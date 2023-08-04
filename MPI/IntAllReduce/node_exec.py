import asyncio
import numpy as np
from concurrent.futures import ThreadPoolExecutor

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

class DatagramProtocol(asyncio.DatagramProtocol):
    def __init__(self, data, size):
        self.data = data
        self.size = size
        self.buffer = np.empty((size, 1), dtype=np.uint8)

    def datagram_received(self, data, addr):
        # when a datagram is received, convert it and store it in the buffer
        data = np.frombuffer(data, dtype=np.uint8).reshape(-1, 1)
        self.buffer[:data.shape[0]] = data

async def send_packets(protocol, udp_message_global, alveo_ip, alveo_port, num_pkts):
    for m in range(num_pkts):
        udp_message_local = udp_message_global[
            (m * BYTES_PER_PACKET):((m * BYTES_PER_PACKET) + BYTES_PER_PACKET)
        ]
        protocol.transport.sendto(udp_message_local.tobytes(), (alveo_ip, alveo_port))

async def execute(alveo_ip: str, alveo_port: int, port_num: int, size: int):
    try:
        loop = asyncio.get_running_loop()

        shape = (size, 1)
        udp_message_global = np.random.randint(low=0, high=((2 ** 8) - 1), size=shape, dtype=np.uint8)
        num_pkts = size // BYTES_PER_PACKET

        transport, protocol = await loop.create_datagram_endpoint(
            lambda: DatagramProtocol(udp_message_global, size),
            local_addr=('localhost', port_num))

        # Run sieve_of_eratosthenes in a separate thread
        sieve_future = loop.run_in_executor(None, sieve_of_eratosthenes, 1500000)
        sieve_task = asyncio.create_task(sieve_future)

        # Send packets and perform the sieve concurrently
        tasks = [
            send_packets(protocol, udp_message_global, alveo_ip, alveo_port, num_pkts),
            sieve_task
        ]
        await asyncio.gather(*tasks)

        np.savetxt(f'{port_num}_output.txt', udp_message_global, fmt='%d')
        np.savetxt(f'{port_num}_recv_data.txt', protocol.buffer, fmt='%d')

        transport.close()
    except Exception as err:
        raise Exception(f"Error! Could not complete execute() on {alveo_ip}:{alveo_port}! Error: {str(err)}")
