import numpy as np
import time
from mpi4py import MPI

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


def execute_allreduce(size: int):
    # Initialize MPI communication
    comm = MPI.COMM_WORLD
    rank = comm.Get_rank()
    size = comm.Get_size()

    # Generate a random dataset on each rank
    shape = (size, 1)
    message_global = np.random.randint(low=0, high=((2 ** 8) - 1), size=shape, dtype=np.uint8)

    # Perform non-blocking AllReduce operation to sum the datasets from all ranks
    result = np.empty(shape, dtype=np.uint8)
    request = comm.Iallgather(message_global, result)

    # Perform the slow dummy calculation concurrently
    seive_size = 150000000
    print(f"Calculating primes for size {seive_size}")
    primes = sieve_of_eratosthenes(seive_size) 

    # Wait for the AllReduce operation to complete
    MPI.Request.Wait(request)

    # Save the AllReduce result and the dummy calculation result to files
    np.savetxt(f'{rank}_output_allreduce.txt', result, fmt='%d')
    np.savetxt(f'{rank}_output_primes.txt', np.array([primes]), fmt='%d')


if __name__ == "__main__":
    try:
        start_time = time.time()

        # The desired dataset size
        dataset_size = 1408 * 8

        # Execute non-blocking AllReduce operation and slow dummy calculation (primes) concurrently
        execute_allreduce(dataset_size)

        end_time = time.time()
        elapsed_time = end_time - start_time
        print(f"Elapsed Time: {elapsed_time} seconds")

    except Exception as err:
        raise Exception(f"Error! Could not complete AllReduce operation! Error: {str(err)}")
