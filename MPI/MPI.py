import logging
import concurrent.futures
import paramiko
from fabric import Connection
import sys
import host_cfg as host
import json

def create_ssh_connection(ip_address: str, port: int, username: str, key_path: str = None) -> paramiko.SSHClient:
    try:
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        logging.debug("Creating SSH connection.")
        if key_path is not None:
            private_key = paramiko.RSAKey.from_private_key_file(key_path)
            ssh.connect(hostname=ip_address, port=port, username=username, pkey=private_key)
        else:
            ssh.connect(hostname=ip_address, port=port, username=username)

        logging.debug(f"Created SSH connection. {ssh}")
    except Exception as err:
        raise Exception(f"Error creating SSH connection on {ip_address}. Error: {str(err)}")
    return ssh

def fread_args(filename: str):
    arguments = {}
    try:
        with open(filename, 'r') as file:
            for line in file:
                arg, value = line.strip().split('=')
                arguments[arg.strip()] = value
    except FileNotFoundError:
        raise FileNotFoundError(f"File '{filename}' not found.")
    except IOError as err:
        raise IOError(f"Error opening {filename}: {err}")

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


def node_connect_and_transfer(ranks: list, node_ctrl_script, node_ex_script: str, dest_dir: str,
                              connections: list, key_path: str, user: str):
    """
    This function takes a list of a tuples with two elements (hostname, [port_list]) and establishes a connection then 
    returns a a list of new tuples containing (input tuple, Connection object). 
    """
    try:
        for rank in ranks:
            remote_addr = rank[0]
            logging.debug(f"Args {remote_addr}, {node_ctrl_script}, {node_ex_script}, {dest_dir}, {connections}, {key_path}, {user}")

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
        raise Exception(f'Error running script on {remote_addr}: {str(err)}')


def node_execute(connection: tuple, ctrl_script: str, dest_dir: str, size: int, alveo_ip: str, alveo_port: int, env_path: str):
    conn = connection[0]
    rank = connection[1]
    remote_addr = rank[0]
    rank_ports = rank[1]
    try:
        rank_json = json.dumps(rank_ports)
    except ValueError as err:
        raise ValueError(f"Error during json.dumps() {str(err)}.")

    logging.debug(f"Beginning node_execute command on node {remote_addr}.")

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
        logging.debug(f"Execute script on {remote_addr} ports: {rank_ports}")
        stdin, stdout, stderr = conn.exec_command(command)
        output = stdout.read()
        error = stderr.read()
        if error:
            raise Exception(f'Error executing script on {remote_addr}: {error.decode()}')
        else:
            logging.debug(f"Generate unique output file name")
            output_file = f'output_{remote_addr}.txt'

            logging.debug(f"Write {output_file} on remote computer")
            with open(f"{dest_dir}/{output_file}", 'a') as file:
                file.write(f'Remote command output on {remote_addr}: {output.decode()}')

    except Exception as err:
        raise Exception(f'Error executing script on {remote_addr}: {str(err)}')
    
    
def hostfile_extract(hostfile_path: str, num_proc: int, nodes: int):
    """
    This function takes in a path to the hostfile, parses the hostfile and returns a list of tuples, each consisting
    of (hostname, [list of port numbers equal to the number of slots]) for each rank. The port numbers are
    incremented by one starting from 61440.
    """
    logging.debug("Extracting info from hostfile and assigning ports for each rank.")
    rank_data = []
    port_num = 61440  # Hex value F000
    proc_count = 0
    try:
        with open(hostfile_path, 'r') as file:
            first_line = file.readline().strip()
            if "slots=" in first_line:
                logging.debug("Slots value found. Computing ports for slots.")
                hostname, slots = first_line.strip().split(' slots=')
                slots = int(slots)
                if slots < 1:
                    raise ValueError("Error: Invalid slots value. The slots value must be a positive integer.")
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
                        raise ValueError("Error: Invalid slots value. The slots value must be a positive integer.")
                    rank_ports = []
                    if proc_count < num_proc:
                        for i in range(slots):
                            if proc_count < num_proc:
                                rank_ports.append(port_num)
                                port_num = port_num + 1
                                proc_count = proc_count+1
                        rank_data.append((hostname, rank_ports))
                if proc_count < num_proc:
                    raise ValueError(f"Error: Not enough slots for processes. {proc_count} slots specified for {num_proc} processes.")
            else:
                logging.debug("Slots value NOT found. Computing ports for -n processes per node.")
                if (nodes <= 0):
                    raise ValueError("If the nubmer of slots per node are not specified, the user must specify the total number of nodes.\nNumber of nodes must have a positive integer value (e.g. -n=2).")
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
                    raise ValueError(f"Error. Not enough IP addresses. There were {nodes_assigned} addresses in {hostfile_path} for {num_proc} number of processes.")
    except FileNotFoundError:
        raise FileNotFoundError(f"File '{hostfile_path}' not found. Could not execute hostfile_extract()")
    except ValueError as err:
        raise ValueError(f"Error:{err}")
    except IOError as err:
        raise IOError(f"Error opening hostfile: {err}")
    return rank_data


def main():
    try:    
        # Get Args
        argfile = sys.argv[1]
        logging.debug("Extracting arguments.")
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
        connections = []

        # Error check
        logging.debug("Error checking arguments.")
        if (num_proc == None):
            raise ValueError("Input file must have np value and np must be a positive integer (eg. np=1)")
        else:
            try:
                num_proc = int(num_proc)
            except ValueError:
                raise ValueError("Input file must have np value and np must be a positive integer (eg. np=1)")
            if num_proc < 1:
                raise ValueError("Input file must have np value and np must be a positive integer (eg. np=1)")
        
        try:
            num_nodes = int(num_nodes)
            if num_nodes < 0:
                raise ValueError("When specifying number of nodes, the value must be equal to a positive integer. (eg. -n=3)")
        except ValueError:
            raise ValueError("When specifying number of nodes, the value must be equal to a positive integer. (eg. -n=3)")   

        if (alveo_port != 62781):
            try:
                alveo_port = int(alveo_port)
            except ValueError:
                raise ValueError("Input file must have alveo port number and port number must be a positive integer (eg. "
                    "alveo_port=62781)")
            if alveo_port < 1:
                raise ValueError("Input file must have alveo port number and port number must be a positive integer (eg. "
                    "alveo_port=62781)")

        if node_script == None:
            raise ValueError('Input file must have the path to the script to be executed on nodes. (eg. node_script=path/to/script.py)')
        
        if user == None:
            raise ValueError("Input file must have a valid username to log into the remote machines. (eg. user=[username])")
        
        if size == None:
            raise ValueError("Input file must have a value for size and must be a positive integer (eg. size=1)")
        else:
            try:
                size = int(size)
            except:
                raise ValueError("Input file must have a value for size and must be a positive integer (eg. size=1)")
            if size < 1:
                raise ValueError("Input file must have a value for size and must be a positive integer (eg. size=1)")

        if dir == None:
            raise ValueError("Desination directory on the the remote node must be provided. eg. dir=destination/directory/on/remote/node")

        # Get hostname, slots and assign port numbers
        ranks = hostfile_extract(hostfile, num_proc=num_proc, nodes=num_nodes)

        logging.debug(f"Ranks values:\n{ranks})")

        # Configure Host
        host.setup_host(ranks, alveo_port, size, xclbin, alveo_ip)

        # Setup connections and transfer files to nodes
        node_connect_and_transfer(ranks, ctrl_script_name, node_script, dest, connections=connections, key_path=key_path, user=user)

        # Get host ready to receive data from nodes
        logging.debug(f"Connections list values:\n{connections}")

        logging.debug(f'Starting execute.')

        with concurrent.futures.ThreadPoolExecutor() as executor:
            # Submit tasks to the thread pool
            futures = []
            for connection in connections:
                future = executor.submit(node_execute, connection, ctrl_script_name, dest,
                                        size, alveo_ip, alveo_port, env_path)
                futures.append(future)

            # Wait for all tasks to complete
            concurrent.futures.wait(futures)
        
        logging.debug("Successfully completed. Program cleanup and exit.")
        if connections:
            for connection in connections:
                paramiko.SSHClient.close(connection[0])
    except Exception as error:
        if connections:
            for connection in connections:
                paramiko.SSHClient.close(connection[0])
        logging.error(f"Error:{str(error)} encountered.\nProgram exiting.")
        print(f"Error:{str(error)} encountered.\nProgram exiting.")
        sys.exit(1)


if __name__ == '__main__':
    logging.basicConfig(filename='MPI.log', level=logging.NOTSET,
                    format='%(asctime)s - %(levelname)s - %(message)s',
                    datefmt='%Y-%m-%d %H:%M:%S')
    main()