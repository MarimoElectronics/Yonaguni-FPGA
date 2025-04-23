###############################################################################
## Copyright (C) 2024-2025 Marimo Electronics, Co., Ltd. All rights reserved.
### SPDX short identifier: ADIBSD
###############################################################################

set REQUIRED_QUARTUS_VERSION 22.1std.0
set QUARTUS_PRO_ISUSED 0
source ../../../scripts/adi_env.tcl
source ../../scripts/adi_project_intel.tcl

adi_project yonaguni_c5soc

source $ad_hdl_dir/projects/common/yonaguni/c5soc_system_assign.tcl

# adrv9002 interface

set_location_assignment PIN_Y13 -to rx1_dclk_in_p
set_location_assignment PIN_AA13 -to rx1_dclk_in_n
set_location_assignment PIN_U14 -to rx1_strobe_in_p
set_location_assignment PIN_U13 -to rx1_strobe_in_n
set_location_assignment PIN_AG13 -to rx1_idata_in_p
set_location_assignment PIN_AF13 -to rx1_idata_in_n
set_location_assignment PIN_W14 -to rx1_qdata_in_p
set_location_assignment PIN_V13 -to rx1_qdata_in_n
set_location_assignment PIN_Y15 -to rx2_dclk_in_p
set_location_assignment PIN_AA15 -to rx2_dclk_in_n
set_location_assignment PIN_AE19 -to rx2_strobe_in_p
set_location_assignment PIN_AD19 -to rx2_strobe_in_n
set_location_assignment PIN_AF25 -to rx2_idata_in_p
set_location_assignment PIN_AG25 -to rx2_idata_in_n
set_location_assignment PIN_AG23 -to rx2_qdata_in_p
set_location_assignment PIN_AF23 -to rx2_qdata_in_n
set_location_assignment PIN_W21 -to tx1_dclk_in_p
set_location_assignment PIN_W20 -to tx1_dclk_in_n
set_location_assignment PIN_AG8 -to tx1_strobe_out_p
set_location_assignment PIN_AH7 -to tx1_strobe_out_n
set_location_assignment PIN_AG11 -to tx1_idata_out_p
set_location_assignment PIN_AH11 -to tx1_idata_out_n
set_location_assignment PIN_AG9 -to tx1_qdata_out_p
set_location_assignment PIN_AH8 -to tx1_qdata_out_n
set_location_assignment PIN_AG10 -to tx1_dclk_out_p
set_location_assignment PIN_AH9 -to tx1_dclk_out_n
set_location_assignment PIN_Y24 -to tx2_dclk_in_p
set_location_assignment PIN_W24 -to tx2_dclk_in_n
set_location_assignment PIN_AG19 -to tx2_strobe_out_p
set_location_assignment PIN_AH19 -to tx2_strobe_out_n
set_location_assignment PIN_AG15 -to tx2_idata_out_p
set_location_assignment PIN_AH14 -to tx2_idata_out_n
set_location_assignment PIN_AG18 -to tx2_qdata_out_p
set_location_assignment PIN_AH18 -to tx2_qdata_out_n
set_location_assignment PIN_AG14 -to tx2_dclk_out_p
set_location_assignment PIN_AH13 -to tx2_dclk_out_n

set_instance_assignment -name IO_STANDARD "1.8 V" -to rx1_dclk_in_n
set_instance_assignment -name IO_STANDARD "1.8 V" -to rx1_dclk_in_p
set_instance_assignment -name IO_STANDARD "1.8 V" -to rx1_idata_in_n
set_instance_assignment -name IO_STANDARD "1.8 V" -to rx1_idata_in_p
set_instance_assignment -name IO_STANDARD "1.8 V" -to rx1_qdata_in_n
set_instance_assignment -name IO_STANDARD "1.8 V" -to rx1_qdata_in_p
set_instance_assignment -name IO_STANDARD "1.8 V" -to rx1_strobe_in_n
set_instance_assignment -name IO_STANDARD "1.8 V" -to rx1_strobe_in_p
set_instance_assignment -name IO_STANDARD "1.8 V" -to rx2_dclk_in_n
set_instance_assignment -name IO_STANDARD "1.8 V" -to rx2_dclk_in_p
set_instance_assignment -name IO_STANDARD "1.8 V" -to rx2_idata_in_n
set_instance_assignment -name IO_STANDARD "1.8 V" -to rx2_idata_in_p
set_instance_assignment -name IO_STANDARD "1.8 V" -to rx2_qdata_in_n
set_instance_assignment -name IO_STANDARD "1.8 V" -to rx2_qdata_in_p
set_instance_assignment -name IO_STANDARD "1.8 V" -to rx2_strobe_in_n
set_instance_assignment -name IO_STANDARD "1.8 V" -to rx2_strobe_in_p
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx1_dclk_out_n
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx1_dclk_out_p
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx1_dclk_in_n
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx1_dclk_in_p
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx1_idata_out_n
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx1_idata_out_p
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx1_qdata_out_n
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx1_qdata_out_p
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx1_strobe_out_n
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx1_strobe_out_p
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx2_dclk_out_n
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx2_dclk_out_p
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx2_dclk_in_n
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx2_dclk_in_p
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx2_idata_out_n
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx2_idata_out_p
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx2_qdata_out_n
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx2_qdata_out_p
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx2_strobe_out_n
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx2_strobe_out_p

set_instance_assignment -name D1_DELAY 31 -to rx1_idata_in_n
set_instance_assignment -name D1_DELAY 31 -to rx1_idata_in_p
set_instance_assignment -name D1_DELAY 31 -to rx1_qdata_in_n
set_instance_assignment -name D1_DELAY 31 -to rx1_qdata_in_p
set_instance_assignment -name D1_DELAY 31 -to rx1_strobe_in_p
set_instance_assignment -name D1_DELAY 31 -to rx2_idata_in_n
set_instance_assignment -name D1_DELAY 31 -to rx2_idata_in_p
set_instance_assignment -name D1_DELAY 31 -to rx2_qdata_in_n
set_instance_assignment -name D1_DELAY 31 -to rx2_qdata_in_p
set_instance_assignment -name D1_DELAY 31 -to rx2_strobe_in_p
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to tx1_idata_out_n
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to tx1_idata_out_p
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to tx1_qdata_out_n
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to tx1_qdata_out_p
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to tx1_strobe_out_p
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to tx2_idata_out_n
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to tx2_idata_out_p
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to tx2_qdata_out_n
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to tx2_qdata_out_p
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to tx2_strobe_out_p
set_instance_assignment -name OUTPUT_BUFFER_DELAY_CONTROL BOTH_EDGES -to tx1_idata_out_n
set_instance_assignment -name OUTPUT_BUFFER_DELAY_CONTROL BOTH_EDGES -to tx1_idata_out_p
set_instance_assignment -name OUTPUT_BUFFER_DELAY_CONTROL BOTH_EDGES -to tx1_qdata_out_n
set_instance_assignment -name OUTPUT_BUFFER_DELAY_CONTROL BOTH_EDGES -to tx1_qdata_out_p
set_instance_assignment -name OUTPUT_BUFFER_DELAY_CONTROL BOTH_EDGES -to tx1_strobe_out_p
set_instance_assignment -name OUTPUT_BUFFER_DELAY_CONTROL BOTH_EDGES -to tx2_idata_out_n
set_instance_assignment -name OUTPUT_BUFFER_DELAY_CONTROL BOTH_EDGES -to tx2_idata_out_p
set_instance_assignment -name OUTPUT_BUFFER_DELAY_CONTROL BOTH_EDGES -to tx2_qdata_out_n
set_instance_assignment -name OUTPUT_BUFFER_DELAY_CONTROL BOTH_EDGES -to tx2_qdata_out_p
set_instance_assignment -name OUTPUT_BUFFER_DELAY_CONTROL BOTH_EDGES -to tx2_strobe_out_p
set_instance_assignment -name OUTPUT_BUFFER_DELAY 150 -to tx1_idata_out_n
set_instance_assignment -name OUTPUT_BUFFER_DELAY 150 -to tx1_idata_out_p
set_instance_assignment -name OUTPUT_BUFFER_DELAY 150 -to tx1_qdata_out_n
set_instance_assignment -name OUTPUT_BUFFER_DELAY 150 -to tx1_qdata_out_p
set_instance_assignment -name OUTPUT_BUFFER_DELAY 150 -to tx1_strobe_out_p
set_instance_assignment -name OUTPUT_BUFFER_DELAY 150 -to tx2_idata_out_n
set_instance_assignment -name OUTPUT_BUFFER_DELAY 150 -to tx2_idata_out_p
set_instance_assignment -name OUTPUT_BUFFER_DELAY 150 -to tx2_qdata_out_n
set_instance_assignment -name OUTPUT_BUFFER_DELAY 150 -to tx2_qdata_out_p
set_instance_assignment -name OUTPUT_BUFFER_DELAY 150 -to tx2_strobe_out_p
set_instance_assignment -name GLOBAL_SIGNAL GLOBAL_CLOCK -to rx1_dclk_in_p
set_instance_assignment -name GLOBAL_SIGNAL GLOBAL_CLOCK -to rx2_dclk_in_p
set_instance_assignment -name GLOBAL_SIGNAL GLOBAL_CLOCK -to tx1_dclk_in_p
set_instance_assignment -name GLOBAL_SIGNAL GLOBAL_CLOCK -to tx2_dclk_in_p
set_instance_assignment -name SLEW_RATE 1 -to tx1_qdata_out_p

set_location_assignment PIN_AF4 -to rx1_enable
set_location_assignment PIN_AE11 -to rx2_enable
set_location_assignment PIN_AH2 -to tx1_enable
set_location_assignment PIN_AF9 -to tx2_enable
set_instance_assignment -name IO_STANDARD "1.8 V" -to rx1_enable
set_instance_assignment -name IO_STANDARD "1.8 V" -to rx2_enable
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx1_enable
set_instance_assignment -name IO_STANDARD "1.8 V" -to tx2_enable

set_location_assignment PIN_AF11 -to dgpio_0
set_location_assignment PIN_AH6 -to dgpio_1
set_location_assignment PIN_AG5 -to dgpio_2
set_location_assignment PIN_AF5 -to dgpio_3
set_location_assignment PIN_AD12 -to dgpio_4
set_location_assignment PIN_T11 -to dgpio_5
set_location_assignment PIN_AE7 -to dgpio_6
set_location_assignment PIN_AF7 -to dgpio_7
set_location_assignment PIN_AG6 -to dgpio_8
set_location_assignment PIN_AH5 -to dgpio_9
set_location_assignment PIN_AH4 -to dgpio_10
set_location_assignment PIN_AH3 -to dgpio_11
set_location_assignment PIN_AE4 -to gp_int
set_location_assignment PIN_U11 -to reset_trx
set_instance_assignment -name IO_STANDARD "1.8 V" -to dgpio_0
set_instance_assignment -name IO_STANDARD "1.8 V" -to dgpio_1
set_instance_assignment -name IO_STANDARD "1.8 V" -to dgpio_2
set_instance_assignment -name IO_STANDARD "1.8 V" -to dgpio_3
set_instance_assignment -name IO_STANDARD "1.8 V" -to dgpio_4
set_instance_assignment -name IO_STANDARD "1.8 V" -to dgpio_5
set_instance_assignment -name IO_STANDARD "1.8 V" -to dgpio_6
set_instance_assignment -name IO_STANDARD "1.8 V" -to dgpio_7
set_instance_assignment -name IO_STANDARD "1.8 V" -to dgpio_8
set_instance_assignment -name IO_STANDARD "1.8 V" -to dgpio_9
set_instance_assignment -name IO_STANDARD "1.8 V" -to dgpio_10
set_instance_assignment -name IO_STANDARD "1.8 V" -to dgpio_11
set_instance_assignment -name IO_STANDARD "1.8 V" -to gp_int
set_instance_assignment -name IO_STANDARD "1.8 V" -to reset_trx

set_location_assignment PIN_AD10 -to spi_en
set_location_assignment PIN_AF10 -to spi_clk
set_location_assignment PIN_AE9 -to spi_dio
set_location_assignment PIN_AF8 -to spi_do
set_instance_assignment -name IO_STANDARD "1.8 V" -to spi_en
set_instance_assignment -name IO_STANDARD "1.8 V" -to spi_clk
set_instance_assignment -name IO_STANDARD "1.8 V" -to spi_dio
set_instance_assignment -name IO_STANDARD "1.8 V" -to spi_do
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to spi_en
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to spi_clk
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to spi_dio
set_instance_assignment -name IO_MAXIMUM_TOGGLE_RATE "40 MHz" -to spi_do

execute_flow -compile
