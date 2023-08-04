import numpy as np
from _thread import *
import asyncio
import socket

BYTES_PER_PACKET = 1408


async def socket_receive(loop, sock, size):  # Pass the loop as an argument
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
        raise Exception(f"Could not complete socket_receive() with socket {sock}! Error: {str(err)}")

async def send_packets(loop, sock, udp_message_global, alveo_ip, alveo_port, num_pkts):
    for m in range(num_pkts):
        udp_message_local = udp_message_global[(m * BYTES_PER_PACKET):((m * BYTES_PER_PACKET) + BYTES_PER_PACKET)]
        await loop.sock_sendto(sock, udp_message_local, (alveo_ip, alveo_port))

def sieve_of_eratosthenes(n):
    primes = []
    sieve = [True] * (n + 1)
    for p in range(2, n + 1):
        if sieve[p]:
            primes.append(p)
            for i in range(p * p, n + 1, p):
                sieve[i] = False
    return primes

async def execute(alveo_ip: str, alveo_port: int, port_num: int, size: int):
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)  # UDP
        sock.bind(('', port_num))

        shape = (size, 1)

        udp_message_global = np.random.randint(low=0, high=((2 ** 8) - 1), size=shape, dtype=np.uint8)
        num_pkts = size // BYTES_PER_PACKET

        loop = asyncio.get_event_loop()  # Get the event loop

        # Schedule the sending task asynchronously, pass the loop as an argument
        send_task = asyncio.ensure_future(send_packets(loop, sock, udp_message_global, alveo_ip, alveo_port, num_pkts))

        primes = sieve_of_eratosthenes(150000000)

        # Wait for the sending task to complete
        await send_task

        # Continue with other operations in parallel
        recv_data_global = await socket_receive(sock, size)


        np.savetxt(f'{port_num}_output.txt', udp_message_global, fmt='%d')
        np.savetxt(f'{port_num}_recv_data.txt', recv_data_global)

    except Exception as err:
        raise Exception(f"Error! Could not complete execute() on {alveo_ip}:{alveo_port}! Error: {str(err)}")
    finally:
        sock.close()

    
