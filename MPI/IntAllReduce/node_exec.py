# asynio test

import asyncio
import numpy as np
import logging

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
        self.transport = None
        self.send_complete = asyncio.Event()  # Event to signal completion of sending

    def connection_made(self, transport):
        self.transport = transport

    def datagram_received(self, data, addr):
        # wait for the send operation to complete before processing received data
        if self.send_complete.is_set():
            data = np.frombuffer(data, dtype=np.uint8).reshape(-1, 1)
            logging.debug(f'Received data: {data}')
            self.buffer[:data.shape[0]] = data

async def send_packets(protocol, udp_message_global, alveo_ip, alveo_port, num_pkts):
    for m in range(num_pkts):
        udp_message_local = udp_message_global[
            (m * BYTES_PER_PACKET):((m * BYTES_PER_PACKET) + BYTES_PER_PACKET)
        ]
        protocol.transport.sendto(udp_message_local.tobytes(), (alveo_ip, alveo_port))
        logging.debug(f"Sent packet: {udp_message_local}")
    protocol.send_complete.set() 

async def execute(alveo_ip: str, alveo_port: int, port_num: int, size: int):
    logging.debug("Beginning execute.")

    try:
        loop = asyncio.get_running_loop()

        shape = (size, 1)
        udp_message_global = np.random.randint(low=0, high=((2 ** 8) - 1), size=shape, dtype=np.uint8)
        num_pkts = size // BYTES_PER_PACKET

        logging.debug('Before create_datagram_endpoint')
        transport, protocol = await loop.create_datagram_endpoint(
            lambda: DatagramProtocol(udp_message_global, size),
            local_addr=('localhost', port_num))
        logging.debug('After create_datagram_endpoint')

        logging.debug('Before send_packets')
        # run send_packets and sieve_of_eratosthenes concurrently
        await asyncio.gather(
            send_packets(protocol, udp_message_global, alveo_ip, alveo_port, num_pkts),
            asyncio.to_thread(sieve_of_eratosthenes, 1500000))
        logging.debug('After send_packets')

        np.savetxt(f'{port_num}_output.txt', udp_message_global, fmt='%d')
        np.savetxt(f'{port_num}_recv_data.txt', protocol.buffer, fmt='%d')
    except Exception as err:
        logging.exception(f"Error! Could not complete execute() on {alveo_ip}:{alveo_port}! Error: {str(err)}", exc_info=True)
        raise Exception(f"Error! Could not complete execute() on {alveo_ip}:{alveo_port}! Error: {str(err)}")
    finally:
        if transport:
            transport.close()
