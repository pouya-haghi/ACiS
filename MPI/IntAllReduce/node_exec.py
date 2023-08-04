# asynio test
import threading
import socket
import logging
import numpy as np

BYTES_PER_PACKET = 1408

def sieve_of_eratosthenes(n):
    primes = []
    sieve = [True] * (n + 1)
    for p in range(2, n + 1):
        if sieve[p]:
            primes.append(p)
            for i in range(p * p, n + 1, p):
                sieve[i] = False
    return primes


def socket_receive_threaded(sock, size, port_num):
    try:    
        shape_global = (size,1)
        shape_local = (BYTES_PER_PACKET,1)
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
        np.savetxt(f'{port_num}_recv_data.txt', recv_data_global, fmt='%d')
    except Exception as err:
        raise Exception(f"Could not complete socket_recieve_threaded() with socket {sock}! Error: {str(err)}")


def socket_send_threaded(sock, udp_message_global, alveo_ip, alveo_port, size):
    try:
        num_pkts = size // BYTES_PER_PACKET
        for m in range(num_pkts):
            udp_message_local = udp_message_global[(m * BYTES_PER_PACKET):((m * BYTES_PER_PACKET) + BYTES_PER_PACKET)]
            sock.sendto(udp_message_local, (alveo_ip, alveo_port))
    except Exception as err:
        raise Exception(f"Could not complete socket_send_threaded() with socket {sock}! Error: {str(err)}")


def execute(alveo_ip: str, alveo_port: int, port_num: int, size: int, sieve_size: int):
    try:
        logging.debug(f'Starting execute for {port_num}')
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)  # UDP
        sock.bind(('', port_num))

        shape = (size, 1)
        udp_message_global = np.random.randint(low=0, high=((2 ** 8) - 1), size=shape, dtype=np.uint8)

        recv_thread = threading.Thread(target=socket_receive_threaded, args=(sock, size,port_num,))
        send_thread = threading.Thread(target=socket_send_threaded, args=(sock, udp_message_global, alveo_ip, alveo_port, size,))
        sieve_thread = threading.Thread(target=sieve_of_eratosthenes, args=(sieve_size,))

        # Start the threads
        recv_thread.start()
        send_thread.start()
        sieve_thread.start()

        # Wait for all threads to finish
        recv_thread.join()
        send_thread.join()
        sieve_thread.join()

    except Exception as err:
        raise Exception(f"Could not complete execute() on {alveo_ip}:{alveo_port}! Error: {str(err)}")
    finally:
        sock.close()
