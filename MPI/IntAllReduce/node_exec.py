import asyncio
import numpy as np
import logging
from concurrent.futures import ThreadPoolExecutor
from queue import Queue


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
        self.received_queue = Queue()  # Queue to store received data

    def connection_made(self, transport):
        self.transport = transport

    def datagram_received(self, data, addr):
        # when a datagram is received, put it into the queue
        self.received_queue.put(data)


async def socket_receive_async(protocol, size):
    try:
        shape_global = (size, 1)
        shape_local = (BYTES_PER_PACKET, 1)
        recv_data_global = np.empty(shape_global, dtype=np.uint8)
        data_partial = np.empty(shape_local, dtype=np.uint8)
        num_it = (size // BYTES_PER_PACKET)
        sum_bytes = 0
        connection = 'None'

        for m in range(num_it):
            data_partial, _ = await protocol.received_queue.get()
            recv_data_global[(m * BYTES_PER_PACKET):((m * BYTES_PER_PACKET) + BYTES_PER_PACKET)] = np.frombuffer(data_partial, dtype=np.uint8)
            sum_bytes += len(data_partial)

        return recv_data_global

    except Exception as err:
        raise Exception(f"Could not complete socket_receive_async()! Error: {str(err)}")


async def send_packets_async(protocol, udp_message_global, alveo_ip, alveo_port, num_pkts):
    for m in range(num_pkts):
        udp_message_local = udp_message_global[
            (m * BYTES_PER_PACKET):((m * BYTES_PER_PACKET) + BYTES_PER_PACKET)
        ]
        protocol.transport.sendto(udp_message_local.tobytes(), (alveo_ip, alveo_port))
    protocol.send_complete.set()  # set the event after send operation completes


async def execute(alveo_ip: str, alveo_port: int, port_num: int, size: int):
    logging.debug("Beginning execute.")
    try:
        loop = asyncio.get_running_loop()

        shape = (size, 1)
        udp_message_global = np.random.randint(low=0, high=((2 ** 8) - 1), size=shape, dtype=np.uint8)
        num_pkts = size // BYTES_PER_PACKET

        transport, protocol = await loop.create_datagram_endpoint(
            lambda: DatagramProtocol(udp_message_global, size),
            local_addr=('localhost', port_num))

        # Run the tasks concurrently using asyncio.gather
        recv_task = socket_receive_async(protocol, size)
        send_task = send_packets_async(protocol, udp_message_global, alveo_ip, alveo_port, num_pkts)

        await asyncio.gather(
            recv_task,
            send_task,
            asyncio.to_thread(sieve_of_eratosthenes, 1500000))

        np.savetxt(f'{port_num}_output.txt', udp_message_global, fmt='%d')
        np.savetxt(f'{port_num}_recv_data.txt', recv_task.result(), fmt='%d')  # Save the received data

    except Exception as err:
        logging.exception(f"Error! Could not complete execute() on {alveo_ip}:{alveo_port}! Error: {str(err)}", exc_info=True)
        raise Exception(f"Error! Could not complete execute() on {alveo_ip}:{alveo_port}! Error: {str(err)}")