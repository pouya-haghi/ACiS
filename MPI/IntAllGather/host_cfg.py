import pynq
from vnx_utils import *


def setup_host(rank_list: list,  alveo_port: int, size: int, xclbin_path='/binary/vnx_basic_if0.xclbin', alveo_ipaddr='192.168.40.8'):
    for i in range(len(pynq.Device.devices)):
        print(f'{i}) {pynq.Device.devices[i].name}')

    currentDevice = pynq.Device.devices[0]
    ol = pynq.Overlay(xclbin_path, device=currentDevice)

    print(f'Link interface 0 {ol.cmac_0.link_status()}')

    # THE FOLLOWING IP ADDRESS SHOULD BE IN THE SAME SUBNET
    ol.networklayer_0.set_ip_address(alveo_ipaddr, debug=True)

    ol.networklayer_0.arp_discovery()

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
    
    lb.start(size/2)

    return lb
