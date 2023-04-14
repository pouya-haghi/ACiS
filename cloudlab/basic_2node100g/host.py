# 2 nodes (one FPGA and one 100 Gb NIC) - using vnx-basic - use fpga-NIC profile - status: worked successfully 
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
sw_ip = '192.168.40.5'
ol.networklayer_0.sockets[0] = (sw_ip, 50446, 60133, True) # This is dont care
ol.networklayer_0.sockets[1] = (sw_ip, 38746, 62781, True)
ol.networklayer_0.populate_socket_table(debug=True)

mm2s = ol.krnl_mm2s_0
s2mm = ol.krnl_s2mm_0
size = 1408 * 100
shape = (size,1)
if hasattr(ol, 'HBM0'):
    mm2s_buf = pynq.allocate(shape, dtype=np.uint8, target=ol.HBM0)
    s2mm_buf = pynq.allocate(shape, dtype=np.uint8, target=ol.HBM0)
else:
    mm2s_buf = pynq.allocate(shape, dtype=np.uint8, target=ol.bank1)
    s2mm_buf = pynq.allocate(shape, dtype=np.uint8, target=ol.bank1)
mm2s_buf[:] = np.random.randint(low=0, high=((2**8)-1), size=shape, dtype=np.uint8)

s2mm_wh = s2mm.start(s2mm_buf,size)
# now send packet from NIC using sock.sendto
s2mm_wh.wait()
s2mm_buf.sync_from_device()

print(s2mm_buf)
# ===========================================
# Remote (NIC)
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
sock.bind(('', 38746))

size = 1408 * 100
shape = (size,1)
udp_message_global = np.random.randint(low=0, high=((2**8)-1), size=shape, dtype=np.uint8)
BYTES_PER_PACKET = 1408
num_pkts = size//BYTES_PER_PACKET
alveo_port = 62781
for m in range(num_pkts):
    udp_message_local = udp_message_global[(m * BYTES_PER_PACKET) : \
                        ((m * BYTES_PER_PACKET) + BYTES_PER_PACKET)]
    sock.sendto(udp_message_local, (alveo_ipaddr, alveo_port))

print(udp_message_global)


