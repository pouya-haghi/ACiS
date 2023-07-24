import logging
import queue
import concurrent.futures
import paramiko
from fabric import Connection
import sys
import host_cfg as host
import json

def create_ssh_connection(ip_address: str, port: int, username: str, key_path: str = None) -> paramiko.SSHClient:
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    logging.debug("Creating SSH connection.")
    if key_path is not None:
        private_key = paramiko.RSAKey.from_private_key_file(key_path)
        ssh.connect(hostname=ip_address, port=port, username=username, pkey=private_key)
    else:
        ssh.connect(hostname=ip_address, port=port, username=username)

    logging.debug(f"Created SSH connection. {ssh}")
    return ssh

def fread_args(filename: str):
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
    arguments.setdefault('n', 0)
    arguments.setdefault('hostfile', None)
    arguments.setdefault('node_script', 'node_exec.py')
    arguments.setdefault('xclbin', None)
    arguments.setdefault('alveo_ip', '192.168.40.8')
    arguments.setdefault('alveo_port', 62781)
    arguments.setdefault('dir', None)
    arguments.setdefault('node_ctrl', 'node_ctrl.py')
    arguments.setdefault('key_path', None)
    arguments.setdefault('env_path', None)
    arguments.setdefault('size', None)
    arguments.setdefault('user', None)
    return arguments


def node_connect_and_transfer(ranks: list, node_ctrl_script, node_ex_script: str, dest_dir: str, error_queue:
                              queue.Queue, connections: list, key_path: str, user: str):
    """
    This function takes a list of a tuples with two elements (hostname, [port_list]) and establishes a connection then 
    returns a a list of new tuples containing (input tuple, Connection object). 
    """
    try:
        for rank in ranks:
            remote_addr = rank[0]
            logging.debug(f"Args {remote_addr}, {node_ctrl_script}, {node_ex_script}, {dest_dir}, {error_queue}, {connections}, {key_path}, {user}")

            # Create SSH connection
            if key_path is not None:
                conn = create_ssh_connection(remote_addr, 22, user, key_path=key_path)
            else:
                conn = create_ssh_connection(remote_addr, 22, user)

            logging.debug(f"Transfering node ctrl script to {remote_addr}.")
            # Transfer control script
            sftp = conn.open_sftp()
            sftp.put(node_ctrl_script, f"{dest_dir}/{node_ctrl_script}")

            logging.debug(f"Transfering node exec script to {remote_addr}.")
            # Transfer script to be executed
            sftp.put(node_ex_script, f"{dest_dir}/{node_ex_script}")

            sftp.close()

            logging.debug(f"Apppending connection {conn} and {rank} to connection list.")
            connections.append((conn, rank))

    except Exception as err:
        error_queue.put(f'Error running script on {remote_addr}: {str(err)}')


def node_execute(connection: tuple, ctrl_script: str, dest_dir: str, error_que: queue.Queue,
                 size: int, alveo_ip: str, alveo_port: int, env_path: str):
    conn = connection[0]
    rank = connection[1]
    remote_addr = rank[0]
    rank_ports = rank[1]
    rank_json = json.dumps(rank_ports)

    if env_path is None:
        activate_cmd = ''
    else:
        activate_cmd = f'source {env_path}/bin/activate'

    command = f'''
    cd {dest_dir}
    {activate_cmd}
    python {ctrl_script} {alveo_ip} {alveo_port} {size} \'{rank_json}\'
    '''

    try:
        # Execute setup script
        stdin, stdout, stderr = conn.exec_command(command)
        output = stdout.read()
        error = stderr.read()
        if error:
            error_que.put(f'Error executing script on {remote_addr}: {error.decode()}')
        else:
            # Generate unique output file name
            output_file = f'output_{remote_addr}.txt'

            # Write output to file on remote computer
            with open(f"{dest_dir}/{output_file}", 'a') as file:
                file.write(f'Remote command output on {remote_addr}: {output.decode()}')

            # Transfer output file from remote computer to host computer
            sftp = conn.open_sftp()
            sftp.get(f"{dest_dir}/{output_file}", f"{dest_dir}/{output_file}")
            sftp.close()

    except Exception as err:
        error_que.put(f'Error executing script on {remote_addr}: {str(err)}')
    
    
def hostfile_extract(hostfile_path: str, num_proc: int, nodes: int):
    """
    This function takes in a path to the hostfile, parses the hostfile and returns a list of tuples, each consisting
    of (hostname, [list of port numbers equal to the number of slots]) for each rank. The port numbers are
    incremented by one starting from 61440.
    """
    rank_data = []
    port_num = 61440  # Hex value F000
    proc_count = 0
    try:
        with open(hostfile_path, 'r') as file:
            first_line = file.readline().strip()
            if "slots=" in first_line:
                hostname, slots = first_line.strip().split(' slots=')
                slots = int(slots)
                if slots < 1:
                    print("Error: Invalid slots value. The slots value must be a positive integer.")
                    sys.exit(1)
                rank_ports = []
                for i in range(slots):
                    if proc_count < num_proc:
                        rank_ports.append(port_num)
                        port_num = port_num + 1
                        proc_count = proc_count+1
                rank_data.append((hostname, rank_ports))
                for line in file:
                    hostname, slots = line.strip().split(' slots=')
                    slots = int(slots)
                    if slots < 1:
                        print("Error: Invalid slots value. The slots value must be a positive integer.")
                        sys.exit(1)
                    rank_ports = []
                    if proc_count < num_proc:
                        for i in range(slots):
                            if proc_count < num_proc:
                                rank_ports.append(port_num)
                                port_num = port_num + 1
                                proc_count = proc_count+1
                        rank_data.append((hostname, rank_ports))
                if proc_count < num_proc:
                    print(f"Error: Not enough slots for processes. {proc_count} slots specified for {num_proc} processes.")
                    sys.exit(1)
            else:
                if (nodes <= 0):
                    print("If the nubmer of slots per node are not specified, the user must specify the total number of nodes.\nNumber of nodes must have a positive integer value (e.g. -n=2).")
                    sys.exit(1)
                processes = num_proc//nodes
                remainder = num_proc % nodes
                hostname = first_line.strip()
                rank_ports = []
                for i in range(processes):
                        rank_ports.append(port_num)
                        port_num = port_num + 1
                if remainder > 0:
                    rank_ports.append(port_num)
                    port_num = port_num + 1
                    remainder = remainder - 1
                nodes_assigned = 1
                rank_data.append((hostname, rank_ports))
                for line in file:
                    if (nodes_assigned < nodes) and (nodes_assigned < num_proc):
                        hostname = line.strip()
                        rank_ports = []
                        for i in range(processes):
                                rank_ports.append(port_num)
                                port_num = port_num + 1
                                proc_count = proc_count+1
                        if remainder > 0:
                            rank_ports.append(port_num)
                            port_num = port_num + 1
                            remainder = remainder - 1
                        nodes_assigned = nodes_assigned +1
                        rank_data.append((hostname, rank_ports))
                if nodes_assigned < nodes:
                    print(f"Error. Not enough IP addresses. There were {nodes_assigned} addresses in {hostfile_path} for {num_proc} number of processes.")
                    sys.exit(1)
    except FileNotFoundError:
        print(f"File '{hostfile_path}' not found.")
        sys.exit(1)
    except ValueError:
        print("Error: Invalid slots value. The slots value must be a positive integer.")
        sys.exit(1)
    except IOError as err:
        print(f"Error opening hostfile: {err}")
        sys.exit(1)
    return rank_data


def main():
    # Get Args
    argfile = sys.argv[1]
    arguments = fread_args(argfile)
    ranks = []
    num_proc = arguments['np']
    num_nodes = arguments['n']
    hostfile = arguments['hostfile']
    node_script = arguments['node_script']
    ctrl_script_name = arguments['node_ctrl']
    xclbin = arguments['xclbin']
    alveo_ip = arguments['alveo_ip']
    alveo_port = arguments['alveo_port']
    key_path = arguments['key_path']
    dest = arguments['dir']
    env_path = arguments['env_path']
    size = arguments['size']
    user = arguments['user']

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
    
    try:
        num_nodes = int(num_nodes)
        if num_nodes < 0:
            print("When specifying number of nodes, the value must be equal to a positive integer. (eg. -n=3)")
            sys.exit(1)
    except ValueError:
        print("When specifying number of nodes, the value must be equal to a positive integer. (eg. -n=3)")
        sys.exit(1)    

    if (alveo_port != 62781):
        try:
            alveo_port = int(alveo_port)
        except ValueError:
            print("Input file must have alveo port number and port number must be a positive integer (eg. "
                  "alveo_port=62781)")
            sys.exit(1)
        if alveo_port < 1:
            print("Input file must have alveo port number and port number must be a positive integer (eg. "
                  "alveo_port=62781)")
            sys.exit(1)

    if node_script == None:
        print('Input file must have the path to the script to be executed on nodes. (eg. node_script=path/to/script.py)')
        sys.exit(1)
    
    if user == None:
        print("Input file must have a valid username to log into the remote machines. (eg. user=[username])")
        sys.exit(1)
    
    if size == None:
        print("Input file must have a value for size and must be a positive integer (eg. size=1)")
        sys.exit(1)
    else:
        try:
            size = int(size)
        except:
            print("Input file must have a value for size and must be a positive integer (eg. size=1)")
            sys.exit(1)
        if size < 1:
            print("Input file must have a value for size and must be a positive integer (eg. size=1)")
            sys.exit(1)

    if dir == None:
        print("Desination directory on the the remote node must be provided. eg. dir=destination/directory/on/remote/node")
        sys.exit(1)

    # Get hostname, slots and assign port numbers
    ranks = hostfile_extract(hostfile, num_proc=num_proc, nodes=num_nodes)

    print(ranks)

    # Configure Host
    host.setup_host(ranks, alveo_port, size, xclbin, alveo_ip)

    error_queue = queue.Queue()
    result = True
    connections = []

    # Setup connections and transfer files to nodes
    node_connect_and_transfer(ranks, ctrl_script_name, node_script, dest, error_queue, connections=connections, key_path=key_path, user=user)

    # Get host ready to receive data from nodes
    print(connections)

    print('starting execute')

    with concurrent.futures.ThreadPoolExecutor() as executor:
        # Submit tasks to the thread pool
        futures = []
        for connection in connections:
            future = executor.submit(node_execute, connection, ctrl_script_name, dest, error_queue,
                                     size, alveo_ip, alveo_port, env_path)
            futures.append(future)

        # Wait for all tasks to complete
        concurrent.futures.wait(futures)

    while not error_queue.empty():
        error = error_queue.get()
        print(error)
        result = False
    if not result:
        sys.exit(1)

if __name__ == '__main__':
    logging.basicConfig(filename='MPI.log', level=logging.DEBUG,
                    format='%(asctime)s - %(levelname)s - %(message)s',
                    datefmt='%Y-%m-%d %H:%M:%S')
    main()