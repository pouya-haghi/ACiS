import numpy as np
from _thread import *
import threading
import socket

# !ifconfig

# The following IP address should be in the same subnet
alveo_ipaddr = '192.168.40.8'

#wait until FPGA is programmed
!ping -c 5 $alveo_ipaddr

# sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM) #UDP
#
# sock.bind((''.))
