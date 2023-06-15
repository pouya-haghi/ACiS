from typing import AnyStr
import multiprocessing
from fabric import Connection
import sys
import host_cfg as host
import pynq


def fread_args(filename: AnyStr):
    arguments = {}
    try:
        with open(filename, 'r') as file:
            for line in file:
                arg, value = line.strip().split('=')
                arguments[arg.strip()] = value
    except FileNotFoundError:
        print(f"File '{filename}' not found.")
        sys.exit(1)
    except IOError as err:
        print(f"Error opening {filename}: {err}")
        sys.exit(1)

    arguments.setdefault('np', None)
    arguments.setdefault('hostfile', None)
    arguments.setdefault('node_exec', None)
    arguments.setdefault('node_cfg', None)
    arguments.setdefault('host_cfg', None)
    arguments.setdefault('xclbin', None)
    arguments.setdefault('alveo_ip', None)
    arguments.setdefault('alveo_port', None)
    return arguments


def node_config(remote_addr: AnyStr, node_cfg: AnyStr, node_exec: AnyStr, dest_dir: AnyStr, error_que:
                multiprocessing.Queue):
    try:
        # Connect to remote host
        conn = Connection(remote_addr)

        # Transfer config script
        conn.put(node_cfg, dest_dir)

        # Transfer script to be executed
        conn.put(node_exec, dest_dir)

        # Get configuration script filename
        script_filename = node_cfg.split('/')[-1]

        # Execute setup script
        conn.run(f'python {dest_dir}/{script_filename}', hide=False)

        conn.close()
    except Exception as err:
        error_que.put(f'Error running script on {remote_addr}: {str(err)}')


def node_execute(remote_addr: AnyStr, node_exec: AnyStr, dest_dir: AnyStr, error_que: multiprocessing.Queue):
    try:
        # Connect to remote host
        conn = Connection(remote_addr)

        # Get configuration script filename
        script_filename = node_exec.split('/')[-1]

        # Execute setup script
        conn.run(f'python {dest_dir}/{script_filename}', hide=False)

        conn.close()
    except Exception as err:
        error_que.put(f'Error executing script on {remote_addr}: {str(err)}')


def main():
    # Get Args
    argfile = sys.argv[1]
    arguments = fread_args(argfile)
    ranks = []
    num_proc = arguments['np']
    hostfile = arguments['hostfile']
    node_exec = arguments['node_exec']
    node_cfg = arguments['node_cfg']
    host_cfg = arguments['host_cfg']
    xclbin = arguments['xclbin']
    alveo_ip = arguments['alveo_ip']
    alveo_port = arguments['alveo_port']
    dest = '~/'

    # Error check
    if (num_proc == None):
        print("Input file must have np value and np must be a positive integer (eg. np=1)")
        sys.exit(1)
    else:
        try:
            num_proc = int(num_proc)
        except ValueError:
            print("Input file must have np value and np must be a positive integer (eg. np=1)")
            sys.exit(1)
        if num_proc < 1:
            print("Input file must have np value and np must be a positive integer (eg. np=1)")
            sys.exit(1)

    if (alveo_port == None):
        print("Input file must have alveo port number and port number must be a positive integer (eg. "
              "alveo_port=2222)")
        sys.exit(1)
    else:
        try:
            alveo_port = int(alveo_port)
        except ValueError:
            print("Input file must have alveo port number and port number must be a positive integer (eg. "
                  "alveo_port=2222)")
            sys.exit(1)
        if alveo_port < 1:
            print("Input file must have alveo port number and port number must be a positive integer (eg. "
                  "alveo_port=2222)")
            sys.exit(1)


    if node_exec == None:
        print('Input file must have the path to the script to be executed on nodes. (eg. node_exec=path/to/script.py)')
        sys.exit(1)

    if node_cfg == None:
        print('Input file must have the path to the node configuration script.(eg. node_cfg=path/to/script.py)')
        sys.exit(1)

    if host_cfg == None:
        print('Input file must have the path to the host configuration script. (eg. host_cfg=path/to/script.py)')
        sys.exit(1)

    if xclbin == None:
        print('Input file must have the path to the xclbin file. (eg. xclbin=path/to/script.py)')
        sys.exit(1)

    if alveo_ip == None:
        print('Input file must have the alveo_ip address. (eg. alveo_ip=127.0.0.1)')
        sys.exit(1)

    # Get hostname and port num pair
    try:
        with open(hostfile, 'r') as file:
            for line in file:
                hostname, port_num = line.strip().split(' port=')
                ranks.append((hostname, port_num))
    except FileNotFoundError:
        print(f"File '{hostfile}' not found.")
        sys.exit(1)
    except IOError as err:
        print(f"Error opening hostfile: {err}")
        sys.exit(1)

    # Configure Host
    op = host.setup_host(xclbin, alveo_ip)


    # Configure nodes
    config_processes = []
    error_queue = multiprocessing.Queue()
    result = True
    """
    print('starting config')
    for rank in ranks:
        process = multiprocessing.Process(target=node_config, args=(rank[0], node_cfg, node_exec, dest,
                                                                    error_queue))
        config_processes.append(process)
        process.start()
        print('configuring: ', rank[0])

    # Check for errors and exit if errors are found
    while not error_queue.empty():
        error = error_queue.get()
        print(error)
        result = False
    if not result:
        sys.exit(1)

    for process in config_processes:
        process.join()
        print('joined ', rank[0])
    error_queue.close()
    """

    # Get host ready to receive data from nodes
    size = 1408 * 8

    lb_wh = lb.start(size)

    # Execute script -np times on each node and send data
    execute_processes = []
    print('staring execute')
    for run in range(num_proc):
        for rank in ranks:
            print('executing ', rank[0])
            process = multiprocessing.Process(target=node_execute, args=(rank[0], node_exec, dest, error_queue, size,
                                                                         alveo_ip, ))
            execute_processes.append(process)
            process.start()
        for process in execute_processes:
            process.join()

        # Clear list for next iteration
        execute_processes.clear()

    while not error_queue.empty():
        error = error_queue.get()
        print(error)
        result = False
    if not result:
        sys.exit(1)

    lb_wh.wait()


if __name__ == '__main__':
    main()
