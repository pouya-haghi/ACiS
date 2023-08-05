#IntAllGather - blocking
import multiprocessing
import sys
import json
import logging
import time
import node_exec as exec

def execute_port(alveo_ip, alveo_port, port, size):
    exec.execute(alveo_ip, alveo_port, port, size)

if __name__ == "__main__":
    try:
        start_time = time.time()    
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
        
        exec_time = time.time()

        with multiprocessing.Pool() as pool:
            args_list = [(alveo_ip, alveo_port, port, size) for port in port_list]
            pool.starmap(execute_port, args_list)

        end_time = time.time()

        logging.debug(f"Multiprocessing complete in node_ctrl.py.\nTotal Elapsed time = {end_time-start_time}\nExecution time = {exec_time-end_time}")
    except Exception as err:
        logging.debug(f"Failed! Did not complete execution! Error: {(str(err))}")

