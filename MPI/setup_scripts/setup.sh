#!/bin/bash

# Update and upgrade
sudo apt update
N | sudo apt upgrade -y

sudo apt install python3-pip -y
source /opt/xilinx/xrt/setup.sh

sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget -y

wget https://www.python.org/ftp/python/3.10.12/Python-3.10.12.tgz

tar -xf Python-3.10.12.tgz

cd Python-3.10.12

./configure --enable-optimizations

make -j$(nproc)

sudo make altinstall

cd ~

python3.10 -m venv devenv

source devenv/bin/activate
pip3.10 install pynq==2.8.0.dev0
pip3.10 install Fabric

git clone https://github.com/pouya-haghi/G-FPin_HW.git
cd G-FPin_HW
git checkout -b Ian origin/Ian
cd ~
git clone https://github.com/Xilinx/xup_vitis_network_example.git --recursive


cd ~/G-FPin_HW/MPI
cp MPI.py ~/xup_vitis_network_example/Notebooks
cp host_cfg.py ~/xup_vitis_network_example/Notebooks
cp node_exec.py ~/xup_vitis_network_example/Notebooks
cp node_ctrl.py ~/xup_vitis_network_example/Notebooks
cp -r test ~/xup_vitis_network_example/Notebooks
cd ~/G-FPin_HW/cloudlab/basic_3node100g_loopbackingNetworkKernel_IntAllreduce_withHeader
mkdir ~/xup_vitis_network_example/Notebooks/binary
cp vnx_basic_if0.xclbin ~/xup_vitis_network_example/Notebooks/binary
cd ~/xup_vitis_network_example/Notebooks

# Use your cloudlab public key and name it
nano key
chmod 600 key

# for each node 
sudo ifconfig enp175s0 192.168.40.11

#python MPI.py test/argfile.txt