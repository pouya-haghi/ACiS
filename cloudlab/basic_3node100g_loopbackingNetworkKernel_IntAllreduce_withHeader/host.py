# 3 nodes (one FPGA and two 100 Gb NIC) - using vnx-basic - using fpga-NIC profile - status: working
# the kernel is simply adding each 32 bit element with constant 1 and then looping back the networking kernel
# You just populate the socket table with two NICs once and run the kernel once. Each node gets the correct data. I think the reason is that each NIC sends data at different time but if they were to send data at the same time packet loss can happen and either you dont get part of data or you get the data from another wrong node. One thing we should do in future is to process packets based on src IP address.
# This is the order: 
# 1) local node starts (lb_wh = lb.start(size))
# 2) remote NIC 1 posts receive (start_new_thread(socket_receive_threaded, (sock,size,)))
# 3) NIC2 posts receive
# 4) remote NIC 1 sends (sock.sendto) 
# 5) remote NIC 2 sends (sock.sendto) 
# 6) local node waits (lb_wh.wait())
# 7) remote NIC 1 prints (print(udp_message_global) , print(recv_data_global)) -- these two arrays should be the same

# Local (FPGA):
import pynq
import numpy as np
from _thread import *
import threading 
import socket
from vnx_utils import *
from timeit import default_timer as timer

for i in range(len(pynq.Device.devices)):
    print("{}) {}".format(i, pynq.Device.devices[i].name))

currentDevice = pynq.Device.devices[0]
xclbin = '../binary/vnx_basic_if0.xclbin'
ol = pynq.Overlay(xclbin,device=currentDevice)
print(ol.ip_dict)

print("Link interface 0 {}".format(ol.cmac_0.link_status()))

# THE FOLLOWING IP ADDRESS SHOULD BE IN THE SAME SUBNET
alveo_ipaddr = '192.168.40.8'
print(ol.networklayer_0.set_ip_address(alveo_ipaddr, debug=True))

!ifconfig enp175s0
!ping -c 5 $alveo_ipaddr

# YOU MUST GET THE FOLLOWING IP ADDRESS FROM 100GB NIC
sw_ip1 = '192.168.40.11'
sw_ip2 = '192.168.40.12'
ol.networklayer_0.sockets[0] = (sw_ip1, 50446, 60133, True) # This is dont care because we never use its port (50446)
ol.networklayer_0.sockets[1] = (sw_ip1, 38656, 62781, True) # This is used since we are using its port (38656) in remote NIC 1
ol.networklayer_0.sockets[2] = (sw_ip2, 60416, 62781, True) # This is used since we are using its port (60416) in remote NIC 2
ol.networklayer_0.populate_socket_table(debug=True)

lb = ol.krnl_loopback_0
size = 1408 * 8 # sum of all of elements from NIC 1 (1408*50) and (+) NIC 2 (1408*50). 
lb_wh = lb.start(size)
# now send packet from NIC using sock.sendto
lb_wh.wait()
# ===========================================
# Remote (NIC) 1
import numpy as np
from _thread import *
import threading 
import socket
# from vnx_utils import *

!ifconfig
# THE FOLLOWING IP ADDRESS SHOULD BE IN THE SAME SUBNET
alveo_ipaddr = '192.168.40.8'
# wait until fpga is programmed
!ping -c 5 $alveo_ipaddr

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM) # UDP
sock.bind(('', 38656))

size = 1408 * 8
shape = (size,1)

print_lock = threading.Lock() 
# thread function 
def socket_receive_threaded(sock, size): 
    BYTES_PER_PACKET = 1408
    shape_global = (size,1)
    shape_local = (BYTES_PER_PACKET,1)
    global recv_data_global
    recv_data_global = np.empty(shape_global, dtype = np.uint8)
    data_partial = np.empty(shape_local, dtype = np.uint8)
    num_it = (size // BYTES_PER_PACKET)
    sum_bytes = 0
    connection = 'None'
    for m in range(num_it):
        res = sock.recvfrom_into(data_partial) 
        recv_data_global[(m * BYTES_PER_PACKET) : ((m * BYTES_PER_PACKET) \
                        + BYTES_PER_PACKET)] = data_partial
        sum_bytes = sum_bytes + int(res[0])
        connection = res[1]


print_lock.acquire() 
start_new_thread(socket_receive_threaded, (sock,size,))
# now you can send the data

udp_message_global = np.random.randint(low=0, high=((2**8)-1), size=shape, dtype=np.uint8)
BYTES_PER_PACKET = 1408
num_pkts = size//BYTES_PER_PACKET
alveo_port = 62781
for m in range(num_pkts):
    udp_message_local = udp_message_global[(m * BYTES_PER_PACKET) : \
                        ((m * BYTES_PER_PACKET) + BYTES_PER_PACKET)]
    sock.sendto(udp_message_local, (alveo_ipaddr, alveo_port))

# now call lb_wh.wait() from local node
print(udp_message_global)
print(recv_data_global)

# ===========================================
# Remote (NIC) 2
import numpy as np
from _thread import *
import threading 
import socket
# from vnx_utils import *

!ifconfig
# THE FOLLOWING IP ADDRESS SHOULD BE IN THE SAME SUBNET
alveo_ipaddr = '192.168.40.8'
# wait until fpga is programmed
!ping -c 5 $alveo_ipaddr

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM) # UDP
sock.bind(('', 60416))

size = 1408 * 8
shape = (size,1)

print_lock = threading.Lock() 
# thread function 
def socket_receive_threaded(sock, size): 
    BYTES_PER_PACKET = 1408
    shape_global = (size,1)
    shape_local = (BYTES_PER_PACKET,1)
    global recv_data_global
    recv_data_global = np.empty(shape_global, dtype = np.uint8)
    data_partial = np.empty(shape_local, dtype = np.uint8)
    num_it = (size // BYTES_PER_PACKET)
    sum_bytes = 0
    connection = 'None'
    for m in range(num_it):
        res = sock.recvfrom_into(data_partial) 
        recv_data_global[(m * BYTES_PER_PACKET) : ((m * BYTES_PER_PACKET) \
                        + BYTES_PER_PACKET)] = data_partial
        sum_bytes = sum_bytes + int(res[0])
        connection = res[1]

print_lock.acquire() 
start_new_thread(socket_receive_threaded, (sock,size,))

# now you can send the data

udp_message_global = np.random.randint(low=0, high=((2**8)-1), size=shape, dtype=np.uint8)
BYTES_PER_PACKET = 1408
num_pkts = size//BYTES_PER_PACKET
alveo_port = 62781
for m in range(num_pkts):
    udp_message_local = udp_message_global[(m * BYTES_PER_PACKET) : \
                        ((m * BYTES_PER_PACKET) + BYTES_PER_PACKET)]
    sock.sendto(udp_message_local, (alveo_ipaddr, alveo_port))

# now call lb_wh.wait() from local node
print(udp_message_global)
print(recv_data_global)
