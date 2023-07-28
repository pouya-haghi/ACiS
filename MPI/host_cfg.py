import pynq
from vnx_utils import *
import subprocess
import sys
import time


def setup_host(rank_list: list,  alveo_port: int, size: int, xclbin_path='/binary/vnx_basic_if0.xclbin', alveo_ipaddr='192.168.40.8'):
    for i in range(len(pynq.Device.devices)):
        print(f'{i}) {pynq.Device.devices[i].name}')

    currentDevice = pynq.Device.devices[0]
    ol = pynq.Overlay(xclbin_path, device=currentDevice)
    #print(ol.ip_dict)

    # print(f'Link interface 0 {ol.cmac_0.link_status()}')

    # THE FOLLOWING IP ADDRESS SHOULD BE IN THE SAME SUBNET
    # print(ol.networklayer_0.set_ip_address(alveo_ipaddr, debug=True))

    # Execute ifconfig command
    ifconfig_output = subprocess.check_output(["ifconfig", "enp175s0"]).decode("utf-8")
    # print(ifconfig_output)

    # Execute ping command
    max_attempts = 5
    attempts = 0

    while attempts < max_attempts:
        try:
            # Execute ping command
            ping_output = subprocess.run(["ping","-c", "5", alveo_ipaddr], capture_output=True, text=True)

            if ping_output.returncode == 0:
                print(ping_output.stdout)
                break
            else:
                attempts += 1
                # print(f"Attempt {attempts}: Ping command failed with return code {ping_output.returncode}")
                # print(ping_output.stderr)

        except subprocess.CalledProcessError as err:
            attempts += 1
            # print(f"Attempt {attempts}: Error executing ping command: {str(err)}")

        # Sleep for a few seconds before the next attempt
        time.sleep(1)

    if attempts == max_attempts:
        print(f"Failed to reach the target IP after {max_attempts} attempts. Exiting.")
        sys.exit(1)

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
