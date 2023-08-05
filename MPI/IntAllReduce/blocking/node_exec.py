import numpy as np
from _thread import *
import threading
import socket

BYTES_PER_PACKET = 1408


def socket_receive_threaded(sock, size):
    try:    
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
    except Exception as err:
        raise Exception(f"Could not complete socket_recieve_threaded() with socket {sock}! Error: {str(err)}")


def execute(alveo_ip: str, alveo_port: int, port_num: int, size: int):
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)  # UDP
        sock.bind(('', port_num))

        shape = (size, 1)
        print_lock = threading.Lock()
        print_lock.acquire()
        start_new_thread(socket_receive_threaded, (sock, size,))

        udp_message_global = np.random.randint(low=0, high=((2 ** 8) - 1), size=shape, dtype=np.uint8)
        num_pkts = size // BYTES_PER_PACKET
        for m in range(num_pkts):
            udp_message_local = udp_message_global[(m * BYTES_PER_PACKET):((m * BYTES_PER_PACKET) + BYTES_PER_PACKET)]
            sock.sendto(udp_message_local, (alveo_ip, alveo_port))

        print_lock.release()

        np.savetxt(f'{port_num}_output.txt', udp_message_global, fmt='%d')

        np.savetxt(f'{port_num}_recv_data.txt', recv_data_global, fmt='%d')
    except Exception as err:
        print_lock.release()
        raise Exception(f"Error! Could not complete execute() on {alveo_ip}:{alveo_port}! Error: {str(err)}")
        
    
