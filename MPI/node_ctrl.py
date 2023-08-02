import subprocess
import multiprocessing
import sys
import json
import logging
import time
import node_exec as exec

def ping_fpga(alveo_ip):
    # Ping FPGA
    max_attempts = 5
    logging.debug(f"Establishing connection to FPGA at: {alveo_ip}")
    for attempt in range(1, max_attempts + 1):
        try:
            # Execute ping command
            subprocess.run(["ping", "-c", "1", alveo_ip], stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
            logging.debug(f"Successfully pinged {alveo_ip}")
            return  # Exit the function if the ping is successful
        except subprocess.CalledProcessError as err:
            logging.debug(f"Ping attempt {attempt}/{max_attempts} failed: {str(err)}")

    raise Exception("Failed to ping the destination after 5 attempts. Exiting program.")

def execute_port(alveo_ip, alveo_port, port, size):
    exec.execute(alveo_ip, alveo_port, port, size)

if __name__ == "__main__":
    try:    
        logging.basicConfig(filename='node_ctrl.log', level=logging.DEBUG,
                            format='%(asctime)s - %(levelname)s - %(message)s',
                            datefmt='%Y-%m-%d %H:%M:%S')
        logging.debug("Beginning node_ctrl.py.")
        # Get args
        alveo_ip = sys.argv[1]
        alveo_port = int(sys.argv[2])
        size = int(sys.argv[3])
        port_json = sys.argv[4]
        port_list = json.loads(port_json)

        logging.debug(f"\nInput: alveo_ip={alveo_ip}\nalveo_port={alveo_port}\nsize={size}\nport_list={port_list}")
        
        start_time = time.time()

        # ping_fpga(alveo_ip=alveo_ip)

        fpga_time = time.time()

        with multiprocessing.Pool() as pool:
            args_list = [(alveo_ip, alveo_port, port, size) for port in port_list]
            pool.starmap(execute_port, args_list)

        end_time = time.time()

        logging.debug(f"Multiprocessing complete in node_ctrl.py.\nTotal Elapsed time = {end_time-start_time}\nPing time = {fpga_time-start_time}\nExecution time = {fpga_time-end_time}")
    except Exception as err:
        logging.debug(f"Failed! Did not complete execution! Error: {(str(err))}")

