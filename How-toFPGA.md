# How-to: Customize and Build FPGA Project

## **HDL Customization**
  The base HDL reference is Release hdl_2023_r2 of the Analog Devices HDL Repository.
  This HDL reference design does not support Intel Cyclone V SoC in ADRV9002 projects.
  For this reason, we are customizing it for the Cyclone V SoC using the Intel Arria 10 SoC HDL code prepared in the ADRV9002 project.
  We provide an environment to build this customized HDL project.
  
  
## **Download and Build FPGA Project**
  - Clone Yonaguni-FPGA and Analog Devices HDL reference.
  ```SHELL
  $ git clone -b FPGA_r1.1.0 https://www.github.com/MarimoElectronics/yonaguni-FPGA
  $ git clone -b hdl_2023_r2 https://www.github.com/analogdevicesinc/hdl
  ```
  - Copy the Yonaguni modified files to the Analog Devices HDL reference. This will copy the make files, tcl files, HDL sources, etc. needed to build the Yonaguni HDL project. The forrowing command is an example of an LVDS project. For a CMOS project, change the "lvds" to "cmos" of the command line and  execute.
   ```SHELL
  $ cp -rf ./yonaguni-FPGA/lvds/* ./hdl/
  ```
  - To build the project, use Quartus Prime Lite Edition 22.1std.0. and add the path so that the Quartus can be launched.
  ```Shellecho 
  # for example, Quartus installation folder is "~/intelFPGA_lite/22.1std.0",
  $ export PATH=$PATH:~/intelFPGA_lite/22.1std.0/quartus/bin
  ```
  - Go to the project folder and build the project. It will take a while for the build to finish.
  ```SHELL
  $ cd ./hdl/projects/yonaguni/c5soc
  $ make
  ```
  - When the build is complete, the Quartus project "yonaguni_c5soc.qpf" will be generated.


## **FPGA Project implementation**
  - Launch Quartus and select the project file "yonaguni_c5soc.qpf".
  - On Quartus, launch "Platform Designer" and select "system_bd.qsys".
  - In Platform Designer, run "Generate > Generate HDL...".
  - Run "Start Compilation" on Quartus.
  - Write the generated "yonaguni_c5soc.rbf" to the BOOT partition of the SD card.


