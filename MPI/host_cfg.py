import pynq
from vnx_utils import *
import subprocess
import logging
import sys
import time

def ping_fpga(alveo_ip):
    # Ping FPGA
    max_attempts = 5
    # logging.debug(f"Establishing connection to FPGA at: {alveo_ip}")
    for attempt in range(1, max_attempts + 1):
        try:
            # Execute ping command
            subprocess.run(["ping", "-c", "1", alveo_ip], stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
            # logging.debug(f"Successfully pinged {alveo_ip}")
            return  # Exit the function if the ping is successful
        except subprocess.CalledProcessError as err:
            logging.debug(f"Ping attempt {attempt}/{max_attempts} failed: {str(err)}")

    raise Exception("Failed to ping the destination after 5 attempts. Exiting program.")


def setup_host(rank_list: list,  alveo_port: int, size: int, xclbin_path='/binary/vnx_basic_if0.xclbin', alveo_ipaddr='192.168.40.8'):
    try:
        for i in range(len(pynq.Device.devices)):
            pynq.Device.devices[i].name

        currentDevice = pynq.Device.devices[0]
        ol = pynq.Overlay(xclbin_path, device=currentDevice)
        #print(ol.ip_dict)

        # print(f'Link interface 0 {ol.cmac_0.link_status()}')

        # THE FOLLOWING IP ADDRESS SHOULD BE IN THE SAME SUBNET
        ol.networklayer_0.set_ip_address(alveo_ipaddr, debug=True)

        # Execute ifconfig command
        ifconfig_output = subprocess.check_output(["ifconfig", "enp175s0"]).decode("utf-8")
        # print(ifconfig_output)

        # Execute ping command

        # This is dont care because we never use its port (50446)
        ol.networklayer_0.sockets[0] = (rank_list[0][0], 50446, 60133, True)

        # These are the nodes and ports we do care about
        index = 1
        for rank in rank_list:
            for ip in rank[1]:
                ol.networklayer_0.sockets[index] = (rank[0], ip, alveo_port, True)
                index = index+1

        ol.networklayer_0.populate_socket_table(debug=True)

        lb = ol.krnl_loopback_0
        
        lb.start(size)

        return lb
    
    except Exception as err:
        raise Exception(f"Error during setup_host(). Error: {str(err)}")
