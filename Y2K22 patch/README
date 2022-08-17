############################################################################################
#                                                                                          #
# Provided script will patch Xilinx Tools for the HLS Y2k22 bug                            #
#                           Copyright (c) 2018 - 2022 Xilinx Inc.                          #
# version: 1.2                                                                             #
# The patch is intended to resolve the following error                                     #
# source run_ippack.tcl -notrace                                                           #
# ERROR: '##########' is an invalid argument. Please specify an integer value.             #
# while executing                                                                          #
# "rdi::set_property core_revision "##########"                                            #
#                                                                                          #
# {component component_1}                                                                  #
# "                                                                                        #
# invoked from within                                                                      #
# "set_property core_revision $Revision $core"                                             #
# (file "run_ippack.tcl" line 835)                                                         #
#                                                                                          #
# The root cause for the issue is in run_ippack.tcl called by export_ip.tcl.               #
# set Revision "##########"                                                                # 
# set_property core_revision $Revision $core                                               #
#                                                                                          #  
# For more information see:                                                                #
# https://support.xilinx.com/s/article/76960                                               # 
############################################################################################


Note: Provided zip file (y2k22_patch-1.2.zip) must be extracted to the installation root:
* Default Window installation location C:\Xilinx
* Default Linux installation location: /opt/Xilinx or /tools/Xilinx

Note: While extracting this patch on Windows, make sure the destination folder does not contain the zip file name (y2k22_patch-1.2). 
      EX: If the installation root is C:\Xilinx make sure after the extraction y2k22_patch folder is under C:\Xilinx, i.e : C:\Xilinx\y2k22_patch

For more information on how to apply the patch see https://support.xilinx.com/s/article/76960

Patch process requires python version  2.7.5 or later.
If you are patching Xilinx 2019.x release or later you can use python installed with Xilinx tools.

* Applying patch with Python installed separately
If you have python installed on your system, you can run the patch.py as following (given python is in your path)
python y2k22_patch/patch.py

* 2014 - 2018 (inclusive)
  You must have python version 2.7.5 or later installed.
  Assuming python is in the path, this patch can be applied to both Windows and Linux by running:
  python y2k22_patch\patch.py

* 2019.1
  On Windows run:
  Vivado\2019.1\tps\win64\python-2.7.5\python.exe y2k22_patch\patch.py

  On Linux run:
  export LD_LIBRARY_PATH=$PWD/Vivado/2019.1/tps/lnx64/python-2.7.5/lib/
  Vivado/2019.1/tps/lnx64/python-2.7.5/bin/python2.7 y2k22_patch/patch.py

2019.2
  On Windows run:
  Vivado\2019.2\tps\win64\python-2.7.5\python.exe y2k22_patch\patch.py

  On Linux run:
  export LD_LIBRARY_PATH=$PWD/Vivado/2019.2/tps/lnx64/python-2.7.5/lib/
  Vivado/2019.2/tps/lnx64/python-2.7.5/bin/python y2k22_patch/patch.py

* 2020.1
  On Windows run:
  Vivado\2020.1\tps\win64\python-2.7.16\python.exe y2k22_patch\patch.py

  On Linux run:
  export LD_LIBRARY_PATH=$PWD/Vivado/2020.1/tps/lnx64/python-2.7.16/lib/
  Vivado/2020.1/tps/lnx64/python-2.7.16/bin/python y2k22_patch/patch.py

* 2020.2
  On Windows run:
  Vivado\2020.2\tps\win64\python-3.8.3\python.exe y2k22_patch\patch.py

  On Linux run:
  export LD_LIBRARY_PATH=$PWD/Vivado/2020.2/tps/lnx64/python-3.8.3/lib/
  Vivado/2020.2/tps/lnx64/python-3.8.3/bin/python y2k22_patch/patch.py

* 2020.3
  On Windows run:
  Vivado\2020.3\tps\win64\python-3.8.3\python.exe y2k22_patch\patch.py

  On Linux run:
  export LD_LIBRARY_PATH=$PWD/Vivado/2020.3/tps/lnx64/python-3.8.3/lib/
  Vivado/2020.3/tps/lnx64/python-3.8.3/bin/python3 y2k22_patch/patch.py

* 2021.1
  On all Linux Flavors (Centos, RHEL, Ubuntu 18,… ) where python version 3.8.3 used, follow the  instructions below
     export LD_LIBRARY_PATH=$PWD/Vivado/2021.1/tps/lnx64/python-3.8.3/lib/
     Vivado/2021.1/tps/lnx64/python-3.8.3/bin/python3 y2k22_patch/patch.py
  On Windows run:
    Vivado\2021.1\tps\win64\python-3.8.3\python.exe y2k22_patch\patch.py


* 2021.2
  On all Linux Flavors (Centos, RHEL, Ubuntu 18,… ) where python version 3.8.3 used, follow the  instructions below
     export LD_LIBRARY_PATH=$PWD/Vivado/2021.2/tps/lnx64/python-3.8.3/lib/
     Vivado/2021.2/tps/lnx64/python-3.8.3/bin/python3 y2k22_patch/patch.py
  On Windows run:
    Vivado\2021.2\tps\win64\python-3.8.3\python.exe y2k22_patch\patch.py

