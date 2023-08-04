import numpy as np
from _thread import *
import asyncio
import socket
import concurrent.futures


BYTES_PER_PACKET = 1408


async def socket_receive(loop, sock, size):
    try:
        shape_global = (size, 1)
        shape_local = (BYTES_PER_PACKET, 1)
        global recv_data_global
        recv_data_global = np.empty(shape_global, dtype=np.uint8)
        data_partial = np.empty(shape_local, dtype=np.uint8)
        num_it = (size // BYTES_PER_PACKET)
        sum_bytes = 0
        connection = 'None'

        for m in range(num_it):
            data_partial = await loop.sock_recv(sock, BYTES_PER_PACKET)
            recv_data_global[(m * BYTES_PER_PACKET):((m * BYTES_PER_PACKET) + BYTES_PER_PACKET)] = np.frombuffer(data_partial, dtype=np.uint8)
            sum_bytes += len(data_partial)

        connection = sock.getsockname()
    except Exception as err:
        raise Exception(f"Could not complete socket_receive() with socket {sock}! Error: {str(err)}")

async def send_packets(loop, sock, udp_message_global, alveo_ip, alveo_port, num_pkts):
    try:
        transport, _ = await loop.create_datagram_endpoint(
            lambda: asyncio.DatagramProtocol(),
            remote_addr=(alveo_ip, alveo_port)
        )

        for m in range(num_pkts):
            udp_message_local = udp_message_global[
                (m * BYTES_PER_PACKET):((m * BYTES_PER_PACKET) + BYTES_PER_PACKET)
            ]
            await loop.sock_sendall(sock, udp_message_local.tobytes())
        transport.close()
    except Exception as err:
        raise Exception(f"Could not complete send_packets() with socket {sock}! Error: {str(err)}")

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

        # Schedule the sending and receiving tasks asynchronously
        send_task = loop.create_task(send_packets(loop, sock, udp_message_global, alveo_ip, alveo_port, num_pkts))
        receive_task = loop.create_task(socket_receive(loop, sock, size))

        # Run sieve_of_eratosthenes in a separate thread
        with concurrent.futures.ThreadPoolExecutor() as executor:
            primes_future = loop.run_in_executor(executor, sieve_of_eratosthenes, 1500000)
            primes = await primes_future

        # Wait for both sending and receiving tasks to complete
        await asyncio.gather(send_task, receive_task)

        np.savetxt(f'{port_num}_output.txt', udp_message_global, fmt='%d')
        np.savetxt(f'{port_num}_recv_data.txt', recv_data_global)

    except Exception as err:
        raise Exception(f"Error! Could not complete execute() on {alveo_ip}:{alveo_port}! Error: {str(err)}")
    finally:
        sock.close()

