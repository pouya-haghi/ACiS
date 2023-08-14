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

def execute_allgather(size: int):
    # Initialize MPI communication
    comm = MPI.COMM_WORLD
    rank = comm.Get_rank()
    total_ranks = comm.Get_size()

    # Generate a random dataset on each rank
    shape = (size, )
    message_global = np.random.randint(low=0, high=((2 ** 8) - 1), size=shape, dtype=np.uint8)

    # Prepare for Allgather: The total size of the result is size multiplied by total_ranks
    result = np.empty(shape[0] * total_ranks, dtype=np.uint8)
    
    request = comm.Iallgather(message_global, result)

    # Perform the slow dummy calculation concurrently
    sieve_size = 150000
    print(f"Calculating primes for size {sieve_size}")
    primes = sieve_of_eratosthenes(sieve_size) 

    # Wait for the Allgather operation to complete
    MPI.Request.Wait(request)

    # Save the Allgather result and the dummy calculation result to files
    np.savetxt(f'{rank}_output_allgather.txt', result, fmt='%d')
    np.savetxt(f'{rank}_output_primes.txt', np.array(primes), fmt='%d', delimiter=",")  # specifying delimiter for clarity


if __name__ == "__main__":
    try:
        start_time = time.time()

        # The desired dataset size
        dataset_size = 1408 * 8

        # Execute non-blocking Allgather operation and slow dummy calculation (primes) concurrently
        execute_allgather(dataset_size)

        end_time = time.time()
        elapsed_time = end_time - start_time
        print(f"Elapsed Time: {elapsed_time} seconds")

    except Exception as err:
        raise Exception(f"Error! Could not complete Allgather operation! Error: {str(err)}")
