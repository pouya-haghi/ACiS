import numpy as np
from multiprocessing import Process, Lock
from _thread import *
import threading
import socket
import sys
import subprocess

BYTES_PER_PACKET = 1408


def socket_receive_threaded(sock, size):
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

def send_udp_messages(udp_message_global, alveo_ip, alveo_port)


if __name__ == "__main__":
    # Get args
    alveo_ip = sys.argv[1]
    alveo_port = int(sys.argv[2])
    port_num = int(sys.argv[3])
    slots = int(sys.argv[4])
    size = int(sys.argv[5])

    # Ping FPGA
    subprocess.run(['ping', '-c', '5', alveo_ip], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=True)

    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)  # UDP

    sock.bind(('', port_num))

    shape = (size, 1)

    print_lock = threading.Lock()

    print_lock.acquire()
    start_new_thread(socket_receive_threaded, (sock, size,))

    udp_message_global = np.random.randint(low=0, high=((2 ** 8) - 1), size=shape, dtype=np.uint8)
    num_pkts = size // BYTES_PER_PACKET
    for m in range(num_pkts):
        udp_message_local = udp_message_global[(m * BYTES_PER_PACKET): \
                                               ((m * BYTES_PER_PACKET) + BYTES_PER_PACKET)]
        sock.sendto(udp_message_local, (alveo_ip, alveo_port))

    print_lock.release()