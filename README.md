# ADRV9002 RF-SoM FPGA Project

- [**ADRV9002 RF-SoM FPGA Project**](#adrv9002-rf-som-fpga-project)
  - [**Project Descriptions**](#project-descriptions)
  - [**FPGA Overview**](#fpga-overview)
  - [**HDL Customization**](#hdl-customization)
  - [**License**](#license)
  - [**DISCLAIMER**](#disclaimer)


## **Project Descriptions**
  ADRV9002 RF-SoM (Model number: MEC-00689002-EVB, Development code: "Yonaguni") is a Software Defined Radio (SDR) System on Module (SoM) for Analog Devices ADRV9002 Agile Transceiver™ IC.
  The SoM is an Intel Cyclone® V SE SoC FPGA-based single-board that can be used as an evaluation tool and prototyping platform.
  The ADRV9002 2×2 transceiver with integrated DPD engine operates from 30 MHz to 6 GHz and supports narrow-band (kHz) and wideband operation up to 40 MHz.
  Marimo Electronics Co., Ltd. can also support the development of custom versions optimized for specific applications. 


## **FPGA Overview**
  Yonaguni integrates an Intel Cyclone® V SE SoC FPGA (5CSEBA6U23C7N) for baseband processor.
  This repository provides users with FPGA projects that implement partially customized Analog Devices HDL reference designs on this baseband processor.
  The projects provided differ depending on the ADRV9002 interface.

| Interface | Project |
----|----
| CSSI | Yonaguni_cmos_linux |
| LSSI | Yonaguni_lvds_linux * |

\* Coming soon


## **HDL Customization**
  The base HDL reference is Release 2021_R2 of the Analog Devices HDL Repository.
  This HDL reference design does not support Intel Cyclone V SoC in ADRV9002 projects.
  For this reason, we are customizing it for the Cyclone V SoC using the Intel Arria 10 SoC HDL code prepared in the ADRV9002 project.
  The following files have been modified:
  
  /ip/hdl/library/axi_adrv9001/intel/adrv9001_rx.v
  
  /ip/hdl/library/axi_adrv9001/intel/adrv9001_tx.v
  
  /ip/hdl/library/axi_adrv9001/intel/axi_adrv9001_if.v **
  
  /ip/hdl/library/axi_adrv9001/axi_adrv9001_hw.tcl

\** The original axi_adrv9001_if.v is located in /ip/hdl/library/axi_adrv9001


## **License**
Copyright (c) 2023 Marimo Electronics Co., Ltd.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

However, some of the software published in this repository is copyrighted by Analog Devices, Inc. These are subject to Analog Devices' license terms and disclaimers, which you should refer to.
  
  https://github.com/analogdevicesinc/linux/tree/master/LICENSES
  
  https://github.com/analogdevicesinc/hdl/tree/master


## **DISCLAIMER**
THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
