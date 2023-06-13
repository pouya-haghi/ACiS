import argparse
from typing import AnyStr
import multiprocessing
from fabric import Connection
import sys


def node_config(remote_addr: AnyStr, config_script: AnyStr, exec_script: AnyStr, dest_dir: AnyStr, error_que:
                multiprocessing.Queue):
    try:
        # Connect to remote host
        conn = Connection(remote_addr)

        # Transfer config script
        conn.put(config_script, dest_dir)

        # Transfer script to be executed
        conn.put(exec_script, dest_dir)

        # Get configuration script filename
        script_filename = config_script.split('/')[-1]

        # Execute setup script
        result = conn.run(f'python {dest_dir}/{script_filename}', hide=True)

        print(f'Output from {remote_addr}')
        print(result.stdout.strip)
        print('='*40)

        conn.close()
    except Exception as err:
        error_que.put(f'Error running script on {remote_addr}: {str(err)}')

def node_execute(remote_addr: AnyStr, exec_script: AnyStr, dest_dir: AnyStr, error_que: multiprocessing.Queue):
    try:
        # Connect to remote host
        conn = Connection(remote_addr)

        # Get configuration script filename
        script_filename = exec_script.split('/')[-1]

        # Execute setup script
        result = conn.run(f'python {dest_dir}/{script_filename}', hide=True)

        print(f'Output from {remote_addr}')
        print(result.stdout.strip)
        print('=' * 40)

        conn.close()
    except Exception as err:
        error_que.put(f'Error executing script on {remote_addr}: {str(err)}')

def main():
    # Get Args
    parser = argparse.ArgumentParser(description='Lightweight MPI runtime for FPGA Project [placeholder description]')

    parser.add_argument('-np', type=int, help='Number of processes')
    parser.add_argument('-hostfile', type=str, help='Path to your hostfile with node hostnames')
    parser.add_argument('-exec_script', type=str, help='Path to python script to execute on each node')
    parser.add_argument('-config_script', type=str, help='The path to the python script with the initialization'
                        'process for each node')

    args = parser.parse_args()
    ranks = []
    num_proc = args.np
    hostfile = args.hostfile
    exec_script = args.exec_script
    config_script = args.config_script
    dest = '~/'

    if num_proc < 1:
        print("-np must be a positive integer")
        sys.exit(1)

    if exec_script == None:
        print('Must enter the path to the script to be executed.')
        sys.exit(1)

    if config_script == None:
        print('Must enter the path to the configuration script.')
        sys.exit(1)

    try:
        with open(hostfile, 'r') as file:
            for line in file:
                rankname, hostname = line.strip().split(' slots=')
                ranks.append((rankname,hostname))
    except FileNotFoundError:
        print(f"File '{hostfile}' not found.")
        sys.exit(1)
    except IOError as err:
        print(f"Error opening hostfile: {err}")
        sys.exit(1)

    # Configure nodes
    config_processes = []
    error_queue = multiprocessing.Queue()
    result = True
    print('starting config')
    for rank in ranks:
        process = multiprocessing.Process(target=node_config, args=(rank[1], config_script, exec_script, dest,
                                                                    error_queue))
        config_processes.append(process)
        process.start()
        print ('configuring:')
        print(rank)

    # Check for errors and exit if errors are found
    while not error_queue.empty():
        error = error_queue.get()
        print(error)
        result = False
    if not result:
        sys.exit(1)

    for process in config_processes:
        print('joiningd')
        process.join()



    # Execute script -np times on each node
    execute_processes = []
    for run in range(num_proc):
        for rank in ranks:
            process = multiprocessing.Process(target=node_execute, args=(rank[1], exec_script, dest, error_queue))
            execute_processes.append(process)
            process.start()
        for process in execute_processes:
            process.join()

        # Clear list for next iteration
        execute_processes.clear()


if __name__ == '__main__':
    main()
