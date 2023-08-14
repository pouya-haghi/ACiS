import numpy as np
import time
from mpi4py import MPI

BYTES_PER_PACKET = 1408

def execute_allgather(size: int):
    # Initialize MPI communication
    comm = MPI.COMM_WORLD
    rank = comm.Get_rank()
    size = comm.Get_size()

    # Generate a random dataset on each rank
    shape = (size, 1)
    message_global = np.random.randint(low=0, high=((2 ** 8) - 1), size=shape, dtype=np.uint8)

    # Perform Allgather operation to gather the datasets from all ranks
    gathered_data = comm.allgather(message_global)

    # Convert the list to a numpy array
    result = np.concatenate(gathered_data, axis=0)


if __name__ == "__main__":
    try:
        start_time = time.time()

        # The desired dataset size
        dataset_size = 1408 * 8

        # Execute non-blocking AllReduce operation and slow dummy calculation (primes) concurrently
        execute_allgather(dataset_size)

        end_time = time.time()
        elapsed_time = end_time - start_time
        print(f"Elapsed Time: {elapsed_time} seconds")

    except Exception as err:
        raise Exception(f"Error! Could not complete AllGather operation! Error: {str(err)}")
