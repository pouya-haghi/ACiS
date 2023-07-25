## MPI Runtime for FPGA

## How to use

### Requirements
- Python version = 3.10.12
- Python Packages
  - paramiko==3.2.0
  - pynq==2.8.0.dev0
- Arguments file
- Hostfile
- Host configuration script
- Node execution script

#### Arguments File
The program is designed to take in a single arguments file with each argument listed rather than have a long list of arguments in the command line. Each argument in the argument file needs to be on its own line. The format of specifying an argument is, `[argument name]=[value]`. Some of the arguments are required and others are optional. 

The required arguments are:
- `np=[positive integer]` This is the total number of processes to to be run.
- `hostfile=[path to hostfile]` This is the path to the hostfile (see hostfile below for more information).
- `xclbin=[path to binary]` This is the path to the `.xclbin` binary file that is used to program the FPGA
- `dir=[path to working directory]` This is the path to where the files will be transferred and executed on the leaf nodes.
- `size=[size in bits]` This is the decimal value of the size in bits that are to be transferred.
- `user=[username on leaf nodes]` This is the username that is used to establish a SSH connection.
- `n=[Integer value]` There are two ways to specify how many processes to run on nodes. If you do not specify the slot numbers for each node in the nodes, you must specify how many nodes exist with this argument.

The optional arguments are:
- `key_path=[key]` This is the path to the key needed for connecting to the leaf nodes.
- `env_path=[users/someone/devenv]` This is the path to the environment directory if you have a virtual environment set up.
- `node_script=node_script.py` This is the path to the script that you will be running on the leaf nodes. The default value is `node_exec.py`. However if you have moved the file or want to use a different one you can specify it here.
- `alveo_ip=[IP address as string]` This is defaulted to `192.168.40.8` but if the IP address of the Alveo FPGA is different you can override it with this argument.
- `alveo_port=[port number]` This is defaulted to `62781` but if you are using a different port for the Alveo FPGA you can override it with this argument.
- `node_ctrl=[path to node control script]` This is the script that executes the `node_script.py` file on the leaf nodes. Generally, it should not be changed unless you have moved or changed the file.
 
