import pynq
from vnx_utils import *
import subprocess


def setup_host(rank_list, xclbin_path='../binary/vnx_basic_if0.xclbin', alveo_ipaddr='192.168.40.8'):
    for i in range(len(pynq.Device.devices)):
        print(f'{i}) {pynq.Device.devices[i].name}')

    currentDevice = pynq.Device.devices[0]
    ol = pynq.Overlay(xclbin_path, device=currentDevice)
    print(ol.ip_dict)

    print(f'Link interface 0 {ol.cmac_0.link_status()}')

    # THE FOLLOWING IP ADDRESS SHOULD BE IN THE SAME SUBNET
    print(ol.networklayer_0.set_ip_address(alveo_ipaddr, debug=True))

    # Execute ifconfig command
    ifconfig_output = subprocess.check_output(["ifconfig", "enp175s0"]).decode("utf-8")
    print(ifconfig_output)

    # Execute ping command
    ping_output = subprocess.check_output(["ping", "-c", "5", alveo_ipaddr]).decode("utf-8")
    print(ping_output)

    # This is dont care because we never use its port (50446)
    ol.networklayer_0.sockets[0] = (rank_list[0][0], 50446, 60133, True)

    # These are the nodes and ports we do care about
    for index, rank in enumerate(rank_list):
        ol.networklayer_0.sockets[index+1] = (rank[index][0], rank[index][1], True)

    ol.networklayer_0.populate_socket_table(debug=True)

    lb = ol.krnl_loopback_0

    return lb
