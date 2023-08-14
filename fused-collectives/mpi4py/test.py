import numpy as np
import time
from mpi4py import MPI

BYTES_PER_PACKET = 1408


if __name__ == "__main__":
    try:

        # The desired dataset size
        size = 1408 * 8
        # Initialize MPI communication
        comm = MPI.COMM_WORLD
        rank = comm.Get_rank()
        size = comm.Get_size()
        # Generate a random dataset on each rank
        NUM_RANK = 2
        size_out = size * NUM_RANK  
        shape = (size, 1)
        shape_out = (size_out, 1)
        message_global = np.random.randint(low=0, high=((2 ** 8) - 1), size=shape, dtype=np.uint8)
        # Perform non-blocking AllReduce operation to sum the datasets from all ranks
        result = np.empty(shape_out, dtype=np.uint8)

        start_time = time.time()
        # first collective
        comm.Allgather(message_global, result)

        # compute
        SIMD_LENGTH = 16
        num_iter = int(size_out/SIMD_LENGTH)
        temp_acc = 0
        
        for i in range(num_iter):
            temp_acc = result[i*16] + result[i*16 + 1] + result[i*16 + 2] + result[i*16 + 3] + result[i*16 + 4] + result[i*16 + 5] + result[i*16 + 6] + result[i*16 + 7] + result[i*16 + 8] + result[i*16 + 9] + result[i*16 +10] + result[i*16 + 11] + result[i*16 + 12] + result[i*16 + 13] + result[i*16 + 14] + result[i*16 + 15]
            result[i*16] = temp_acc
            result[i*16 + 1] = temp_acc
            result[i*16 + 2] = temp_acc
            result[i*16 + 3] = temp_acc
            result[i*16 + 4] = temp_acc
            result[i*16 + 5] = temp_acc
            result[i*16 + 6] = temp_acc
            result[i*16 + 7] = temp_acc
            result[i*16 + 8] = temp_acc
            result[i*16 + 9] = temp_acc
            result[i*16 + 10] = temp_acc
            result[i*16 + 11] = temp_acc
            result[i*16 + 12] = temp_acc
            result[i*16 + 13] = temp_acc
            result[i*16 + 14] = temp_acc
            result[i*16 + 15] = temp_acc

        # second collective
        size_out_out = size_out * NUM_RANK
        shape_out_out = (size_out_out, 1)
        result_out = np.empty(shape_out_out, dtype=np.uint8)
        comm.Allgather(result, result_out)


        end_time = time.time()
        elapsed_time = end_time - start_time
        print(f"Elapsed Time: {elapsed_time} seconds")

    except Exception as err:
        raise Exception(f"Error! Could not complete AllReduce operation! Error: {str(err)}")
