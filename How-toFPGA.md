# How-to: Customize and Build FPGA Project

## **HDL Customization**
  The base HDL reference is Release 2021_R2 of the Analog Devices HDL Repository.
  This HDL reference design does not support Intel Cyclone V SoC in ADRV9002 projects.
  For this reason, we are customizing it for the Cyclone V SoC using the Intel Arria 10 SoC HDL code prepared in the ADRV9002 project.
  The following files have been modified by us:
  
  /ip/hdl/library/axi_adrv9001/intel/adrv9001_rx.v
  
  /ip/hdl/library/axi_adrv9001/intel/adrv9001_tx.v
  
  /ip/hdl/library/axi_adrv9001/intel/axi_adrv9001_if.v *
  
  /ip/hdl/library/axi_adrv9001/axi_adrv9001_hw.tcl

\* The original axi_adrv9001_if.v is located in /hdl/library/axi_adrv9001

## **FPGA Project implementation**
  - Use Quartus Prime Lite Edition 20.1.1
  - if your project is CMOS use "yonaguni_cmos_linux_" else use "yonaguni_lvds_linux".
  - Launch Quartus and select "yonaguni_cmos.qpf" or "yonaguni_lvds.qpf".
  - On Quartus, launch Platform Designer and select "system_bd.qsys".
  - In Platform Designer, run Generate > Generate HDL...
  - Run Start Compilation on Quartus.
  - For CMOS projects, write "yonaguni_cmos.rbf" created in the /output_files folder to the BOOT partition of the SD card.
  - For LVDS projects, rename "yonaguni_lvds.rbf" created in the /output_files folder to "yonaguni_cmos.rbf", and write the "yonaguni_cmos.rbf" to the BOOT partition of the SD card.