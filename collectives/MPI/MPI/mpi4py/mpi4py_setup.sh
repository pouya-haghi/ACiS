#!/bin/bash
sudo apt-get update
sudo apt-get install mpich

# Create your key
nano ~/.ssh/key # this is your private key you used for cloudlab
chmod 400 ~/.ssh/key

# Create SSH agent and add key
eval `ssh-agent`
ssh-add ~/.ssh/key

# Now, assuming that node0 (control node) is for controlling other nodes and you have 2 leaf nodes for collective operation,
# Then, SSH from the node0 to node1 and node2. simply just type 'ssh host1' and 'ssh host2'. Then, SSH from node1 to node0 and from node2 to node0. This will populate the tables on all nodes and is a necessary setup for MPI operation. 

# Install pip3 and packages
sudo apt install python3-pip
pip3 install mpi4py
pip3 install pynq==2.8.0.dev0

# Make sure openssh-sever is installed
sudo apt-get install openssh-server

# Create hostfile with hostnames of the remote leaf nodes involved
nano hosts.txt # simply just copy from 'hosts.txt' in this directory.

# Ensure the python script is already on each of the nodes
# Copy test.py to each node that will execute it. There are a couple of .py files in this directory that you can use.
# e.g.
nano test.py

# run this on the control node (node0) - since you have 'hosts.txt' it will use node1 and node2 resources.
mpiexec -n 2 --hostfile hosts.txt --env MPIEXEC_SSHIDENT=~/.ssh/key python3 test.py
