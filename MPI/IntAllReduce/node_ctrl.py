import sys
import json
import logging
import time
import node_exec as exec
import asyncio

async def execute_port_async(alveo_ip, alveo_port, port, size):
    try:
        await exec.execute(alveo_ip, alveo_port, port, size)
    except Exception as e:
        logging.exception('Exception in execute_port_async', exc_info=True)

if __name__ == "__main__":
    try:
        start_time = time.time()

        # set up logging
        logging.basicConfig(filename='node_ctrl.log', level=logging.DEBUG,
                            format='%(asctime)s - %(levelname)s - %(message)s',
                            datefmt='%Y-%m-%d %H:%M:%S')
        # add a StreamHandler to see logs in console
        logging.getLogger().addHandler(logging.StreamHandler())
        
        logging.debug("Beginning node_ctrl.py.")
        
        # Get args
        alveo_ip = sys.argv[1]
        alveo_port = int(sys.argv[2])
        size = int(sys.argv[3])
        port_json = sys.argv[4]
        port_list = json.loads(port_json)

        logging.debug(f"\nInput: alveo_ip={alveo_ip}\nalveo_port={alveo_port}\nsize={size}\nport_list={port_list}")

        exec_time = time.time()
        
        logging.debug('About to create tasks...')
        tasks = [execute_port_async(alveo_ip, alveo_port, port, size) for port in port_list]
        asyncio.run(asyncio.gather(*tasks))

        end_time = time.time()

        logging.debug(f"Async execution complete in node_ctrl.py.\nTotal Elapsed time = {end_time-start_time}\nExecution time = {exec_time-end_time}")
    except Exception as err:
        logging.exception(f"Failed! Did not complete execution! Error: {str(err)}", exc_info=True)
