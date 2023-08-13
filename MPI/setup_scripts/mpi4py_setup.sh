#!/bin/bash
sudo apt-get update
sudo apt-get install mpich

# Create your key
nano ~/.ssh/key
chmod 400 ~/.ssh/key

# Create SSH agent and add key
eval `ssh-agent`
ssh-add ~/.ssh/key

# Install pip3 and packages
sudo apt install python3-pip
pip3 install mpi4py
pip3 install pynq==2.8.0.dev0

# Make sure openssh-sever is installed
sudo apt-get install openssh-server

# Create hostfile with hostnames of the remote leaf nodes involved
nano hosts.txt

# Ensure the python script is already on each of the nodes
# Copy test.py to each node that will execute it.
# e.g.
nano test.py

#ssh into each computer from each computer before this step
mpiexec -n 2 --hostfile hosts.txt --env MPIEXEC_SSHIDENT=~/.ssh/key python3 test.py
