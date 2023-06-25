import numpy as np
from _thread import *
import threading
import socket
import sys
import subprocess
import time

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


if __name__ == "__main__":
    print("Executing")
    # Get args
    alveo_ip = sys.argv[1]
    alveo_port = int(sys.argv[2])
    port_num = int(sys.argv[3])
    slots = int(sys.argv[4])
    size = int(sys.argv[5])

    
    print("Executing Ping")
    # Ping FPGA
    # Execute ping command
    max_attempts = 5
    attempts = 0

    while attempts < max_attempts:
        try:
            # Execute ping command
            ping_output = subprocess.run(["ping","-c", "5", alveo_ip], capture_output=True, text=True)

            if ping_output.returncode == 0:
                print(ping_output.stdout)
                break
            else:
                attempts += 1
                print(f"Attempt {attempts}: Ping command failed with return code {ping_output.returncode}")
                print(ping_output.stderr)

        except subprocess.CalledProcessError as err:
            attempts += 1
            print(f"Attempt {attempts}: Error executing ping command: {str(err)}")

        # Sleep for a few seconds before the next attempt
        time.sleep(1)

    if attempts == max_attempts:
        print(f"Failed to reach the target IP after {max_attempts} attempts. Exiting.")
        sys.exit(1)
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

    print(f'From port num:{port_num}\nResult:\n{udp_message_global}')
