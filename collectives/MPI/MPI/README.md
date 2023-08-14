# MPI Runtime for FPGA

## Overview
This is a lightweight MPI-like runtime environment for running the processes required for this project on several leaf nodes from the host node. This program takes in an argument file with several arguments which are described below. At a high level, it takes in the `hostfile` IP addresses of each rank and the number of processes (`np`) and calculates a new port and creates a new process on the leaf node for each port (which corresponds to the appropriate rank in the FPGA code).
The `mpiFPGA` folder contains our runtime system for FPGA. The `mpi4py` contains the already existing mpi4py library with examples running on CloudLab. The following provides information for `mpiFPGA` folder. 

## How to use
### Requirements
- Python version = 3.10.12
    - NOTE: with this version of Python you may need to change line 326 in `vnx_utils.py` to `bool` from `np.bool` since this is deprecated in this version of python and will not run if it is getting that error.
- Python Packages
  - paramiko==3.2.0
  - pynq==2.8.0.dev0
- Arguments file
- Hostfile
- Host configuration script
- Node execution script

#### Arguments File
The program is designed to take in a single arguments file with each argument listed rather than have a long list of arguments in the command line. Each argument in the argument file needs to be on its own line. The format of specifying an argument is, `[argument name]=[value]`. Some of the arguments are required and others are optional. 

##### The required arguments are:
- `np=[positive integer]` This is the total number of processes to to be run.
- `hostfile=[path to hostfile]` This is the path to the hostfile (see hostfile below for more information).
- `xclbin=[path to binary]` This is the path to the `.xclbin` binary file that is used to program the FPGA
- `dir=[path to working directory]` This is the path to where the files will be transferred and executed on the leaf nodes.
- `size=[size in bits]` This is the decimal value of the size in bytes that are to be transferred.
- `user=[username on leaf nodes]` This is the username that is used to establish a SSH connection.
- `n=[Integer value]` There are two ways to specify how many processes to run on nodes. If you do not specify the slot numbers for each node in the nodes, you must specify how many nodes exist with this argument.

##### The optional arguments are:
- `key_path=[key]` This is the path to the key needed for connecting to the leaf nodes.
- `env_path=[users/someone/devenv]` This is the path to the environment directory if you have a virtual environment set up.
- `node_script=node_script.py` This is the path to the script that you will be running on the leaf nodes. The default value is `node_exec.py`. However if you have moved the file or want to use a different one you can specify it here.
- `alveo_ip=[IP address as string]` This is defaulted to `192.168.40.8` but if the IP address of the Alveo FPGA is different you can override it with this argument.
- `alveo_port=[port number]` This is defaulted to `62781` but if you are using a different port for the Alveo FPGA you can override it with this argument.
- `node_ctrl=[path to node control script]` This is the script that executes the `node_script.py` file on the leaf nodes. Generally, it should not be changed unless you have moved or changed the file.
 
#### Hostfile
In the hostfile each node's IP address must be specified on its own line. If the number of slots are specified the program will attempt to fill the slots from top to bottom until `np` processes are created. With this option the `n` argument will be ignored.
```
192.168.40.11 slots=1
192.168.40.12 slots=1
```
Alternatively, you can simply enter each IP address per line. If you choose this option, you must specify a valid argument for `n`.
```
192.168.40.11
192.168.40.12
```
#### Host Configuration Script
This is a helper function that is used internally to set up the FPGA. The host configuration script must named `host_cfg.py` and put into the same directory as `MPI.py` on the host machine (see my example). The `host_cfg.py` file must have a function called `setup_host` with the follwoing arguments
```
setup_host(rank_list,  alveo_port, size, xclbin_path, alveo_ipaddr)
```
The argument `rank_list` is a list of tuples that are constructed like this:
```
[(IP_address_string, (tuple of port, integers),]
Example: [('192.168.10.10', [1234, 5678]), ('192.168.10.11', (8765, 44321)]
```
The rest of the arguments to `setup_host()` have the same value as the inputs to the argument file, or the default value if they are optional arguments. When creating a `setup_host()` function the user must ensure that everything that is needed to set up the FPGA and the host is completed in the `setup_host()` function. See my example `host_cfg.py`.

#### Node Execution Script
This is a helper function to execute the process on the node. The node execution script must be named `node_exec.py` and be put into the same directory as `MPI.py` on the host machine (see my example `node_exec.py`). This script contains a function called `execute()` with the follwoing arguments.
```
execute(alveo_ip, alveo_port, port_num, size)
```
The `port_num` argument is the port number that corresponds to the appropriate rank in the FPGA calculations. The other arguments have the same value as their corresponding arguments in the argument file. This function should perform whatever the user wishes to execute on the individual nodes.
