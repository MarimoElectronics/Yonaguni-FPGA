###############################################################################
## Copyright (C) 2024-2025 Marimo Electronics, Co., Ltd. All rights reserved.
### SPDX short identifier: ADIBSD
###############################################################################

# adrv9001

add_instance axi_adrv9001 axi_adrv9001 1.0
set_instance_parameter_value axi_adrv9001 {CMOS_LVDS_N} {1}
set_instance_parameter_value axi_adrv9001 {DDS_DISABLE} {0}
set_instance_parameter_value axi_adrv9001 {DEV_PACKAGE_MANUAL} {0}
set_instance_parameter_value axi_adrv9001 {FPGA_FAMILY_MANUAL} {0}
set_instance_parameter_value axi_adrv9001 {FPGA_TECHNOLOGY_MANUAL} {100}
set_instance_parameter_value axi_adrv9001 {ID} {0}
set_instance_parameter_value axi_adrv9001 {IO_DELAY_GROUP} {dev_if_delay_group}
set_instance_parameter_value axi_adrv9001 {SPEED_GRADE_MANUAL} {0}
add_interface adrv9001_if conduit end
set_interface_property adrv9001_if EXPORT_OF axi_adrv9001.device_if
add_interface adrv9001_tdd_if conduit end
set_interface_property adrv9001_tdd_if EXPORT_OF axi_adrv9001.tdd_if
add_connection sys_clk.clk axi_adrv9001.s_axi_clock
add_connection sys_clk.clk_reset axi_adrv9001.s_axi_reset

# adc-wfifo

add_instance util_adc_wfifo util_wfifo 1.0
set_instance_parameter_value util_adc_wfifo {DIN_ADDRESS_WIDTH} {5}
set_instance_parameter_value util_adc_wfifo {DIN_DATA_WIDTH} {16}
set_instance_parameter_value util_adc_wfifo {DOUT_DATA_WIDTH} {16}
set_instance_parameter_value util_adc_wfifo {NUM_OF_CHANNELS} {4}
add_connection axi_adrv9001.if_adc_1_clk util_adc_wfifo.if_din_clk
add_connection axi_adrv9001.if_adc_1_rst util_adc_wfifo.if_din_rst
add_connection sys_dma_clk.clk util_adc_wfifo.if_dout_clk
add_connection sys_dma_clk.clk_reset util_adc_wfifo.if_dout_rstn
add_connection axi_adrv9001.adc_1_ch_0 util_adc_wfifo.din_0
set_connection_parameter_value axi_adrv9001.adc_1_ch_0/util_adc_wfifo.din_0 endPort {}
set_connection_parameter_value axi_adrv9001.adc_1_ch_0/util_adc_wfifo.din_0 endPortLSB {0}
set_connection_parameter_value axi_adrv9001.adc_1_ch_0/util_adc_wfifo.din_0 startPort {}
set_connection_parameter_value axi_adrv9001.adc_1_ch_0/util_adc_wfifo.din_0 startPortLSB {0}
set_connection_parameter_value axi_adrv9001.adc_1_ch_0/util_adc_wfifo.din_0 width {0}
add_connection axi_adrv9001.adc_1_ch_1 util_adc_wfifo.din_1
set_connection_parameter_value axi_adrv9001.adc_1_ch_1/util_adc_wfifo.din_1 endPort {}
set_connection_parameter_value axi_adrv9001.adc_1_ch_1/util_adc_wfifo.din_1 endPortLSB {0}
set_connection_parameter_value axi_adrv9001.adc_1_ch_1/util_adc_wfifo.din_1 startPort {}
set_connection_parameter_value axi_adrv9001.adc_1_ch_1/util_adc_wfifo.din_1 startPortLSB {0}
set_connection_parameter_value axi_adrv9001.adc_1_ch_1/util_adc_wfifo.din_1 width {0}
add_connection axi_adrv9001.adc_1_ch_2 util_adc_wfifo.din_2
set_connection_parameter_value axi_adrv9001.adc_1_ch_2/util_adc_wfifo.din_2 endPort {}
set_connection_parameter_value axi_adrv9001.adc_1_ch_2/util_adc_wfifo.din_2 endPortLSB {0}
set_connection_parameter_value axi_adrv9001.adc_1_ch_2/util_adc_wfifo.din_2 startPort {}
set_connection_parameter_value axi_adrv9001.adc_1_ch_2/util_adc_wfifo.din_2 startPortLSB {0}
set_connection_parameter_value axi_adrv9001.adc_1_ch_2/util_adc_wfifo.din_2 width {0}
add_connection axi_adrv9001.adc_1_ch_3 util_adc_wfifo.din_3
set_connection_parameter_value axi_adrv9001.adc_1_ch_3/util_adc_wfifo.din_3 endPort {}
set_connection_parameter_value axi_adrv9001.adc_1_ch_3/util_adc_wfifo.din_3 endPortLSB {0}
set_connection_parameter_value axi_adrv9001.adc_1_ch_3/util_adc_wfifo.din_3 startPort {}
set_connection_parameter_value axi_adrv9001.adc_1_ch_3/util_adc_wfifo.din_3 startPortLSB {0}
set_connection_parameter_value axi_adrv9001.adc_1_ch_3/util_adc_wfifo.din_3 width {0}

# adc-wfifo2

add_instance util_adc_wfifo2 util_wfifo 1.0
set_instance_parameter_value util_adc_wfifo2 {DIN_ADDRESS_WIDTH} {5}
set_instance_parameter_value util_adc_wfifo2 {DIN_DATA_WIDTH} {16}
set_instance_parameter_value util_adc_wfifo2 {DOUT_DATA_WIDTH} {16}
set_instance_parameter_value util_adc_wfifo2 {NUM_OF_CHANNELS} {2}
add_connection axi_adrv9001.if_adc_2_clk util_adc_wfifo2.if_din_clk
add_connection axi_adrv9001.if_adc_2_rst util_adc_wfifo2.if_din_rst
add_connection sys_dma_clk.clk util_adc_wfifo2.if_dout_clk
add_connection sys_dma_clk.clk_reset util_adc_wfifo2.if_dout_rstn
add_connection util_adc_wfifo2.din_1 axi_adrv9001.adc_2_ch_1
set_connection_parameter_value util_adc_wfifo2.din_1/axi_adrv9001.adc_2_ch_1 endPort {}
set_connection_parameter_value util_adc_wfifo2.din_1/axi_adrv9001.adc_2_ch_1 endPortLSB {0}
set_connection_parameter_value util_adc_wfifo2.din_1/axi_adrv9001.adc_2_ch_1 startPort {}
set_connection_parameter_value util_adc_wfifo2.din_1/axi_adrv9001.adc_2_ch_1 startPortLSB {0}
set_connection_parameter_value util_adc_wfifo2.din_1/axi_adrv9001.adc_2_ch_1 width {0}
add_connection util_adc_wfifo2.if_din_ovf axi_adrv9001.if_adc_2_dovf
set_connection_parameter_value util_adc_wfifo2.if_din_ovf/axi_adrv9001.if_adc_2_dovf endPort {}
set_connection_parameter_value util_adc_wfifo2.if_din_ovf/axi_adrv9001.if_adc_2_dovf endPortLSB {0}
set_connection_parameter_value util_adc_wfifo2.if_din_ovf/axi_adrv9001.if_adc_2_dovf startPort {}
set_connection_parameter_value util_adc_wfifo2.if_din_ovf/axi_adrv9001.if_adc_2_dovf startPortLSB {0}
set_connection_parameter_value util_adc_wfifo2.if_din_ovf/axi_adrv9001.if_adc_2_dovf width {0}
add_connection axi_adrv9001.adc_2_ch_0 util_adc_wfifo2.din_0
set_connection_parameter_value axi_adrv9001.adc_2_ch_0/util_adc_wfifo2.din_0 endPort {}
set_connection_parameter_value axi_adrv9001.adc_2_ch_0/util_adc_wfifo2.din_0 endPortLSB {0}
set_connection_parameter_value axi_adrv9001.adc_2_ch_0/util_adc_wfifo2.din_0 startPort {}
set_connection_parameter_value axi_adrv9001.adc_2_ch_0/util_adc_wfifo2.din_0 startPortLSB {0}
set_connection_parameter_value axi_adrv9001.adc_2_ch_0/util_adc_wfifo2.din_0 width {0}

# dac-rfifo

add_instance util_dac_rfifo util_rfifo 1.0
set_instance_parameter_value util_dac_rfifo {DIN_ADDRESS_WIDTH} {5}
set_instance_parameter_value util_dac_rfifo {DIN_DATA_WIDTH} {16}
set_instance_parameter_value util_dac_rfifo {DOUT_DATA_WIDTH} {16}
set_instance_parameter_value util_dac_rfifo {NUM_OF_CHANNELS} {4}
add_connection axi_adrv9001.if_dac_1_clk util_dac_rfifo.if_dout_clk
add_connection axi_adrv9001.if_dac_1_rst util_dac_rfifo.if_dout_rst
add_connection sys_dma_clk.clk util_dac_rfifo.if_din_clk
add_connection sys_dma_clk.clk_reset util_dac_rfifo.if_din_rstn
add_connection util_dac_rfifo.dout_0 axi_adrv9001.dac_1_ch_0
set_connection_parameter_value util_dac_rfifo.dout_0/axi_adrv9001.dac_1_ch_0 endPort {}
set_connection_parameter_value util_dac_rfifo.dout_0/axi_adrv9001.dac_1_ch_0 endPortLSB {0}
set_connection_parameter_value util_dac_rfifo.dout_0/axi_adrv9001.dac_1_ch_0 startPort {}
set_connection_parameter_value util_dac_rfifo.dout_0/axi_adrv9001.dac_1_ch_0 startPortLSB {0}
set_connection_parameter_value util_dac_rfifo.dout_0/axi_adrv9001.dac_1_ch_0 width {0}
add_connection util_dac_rfifo.dout_1 axi_adrv9001.dac_1_ch_1
set_connection_parameter_value util_dac_rfifo.dout_1/axi_adrv9001.dac_1_ch_1 endPort {}
set_connection_parameter_value util_dac_rfifo.dout_1/axi_adrv9001.dac_1_ch_1 endPortLSB {0}
set_connection_parameter_value util_dac_rfifo.dout_1/axi_adrv9001.dac_1_ch_1 startPort {}
set_connection_parameter_value util_dac_rfifo.dout_1/axi_adrv9001.dac_1_ch_1 startPortLSB {0}
set_connection_parameter_value util_dac_rfifo.dout_1/axi_adrv9001.dac_1_ch_1 width {0}
add_connection util_dac_rfifo.dout_2 axi_adrv9001.dac_1_ch_2
set_connection_parameter_value util_dac_rfifo.dout_2/axi_adrv9001.dac_1_ch_2 endPort {}
set_connection_parameter_value util_dac_rfifo.dout_2/axi_adrv9001.dac_1_ch_2 endPortLSB {0}
set_connection_parameter_value util_dac_rfifo.dout_2/axi_adrv9001.dac_1_ch_2 startPort {}
set_connection_parameter_value util_dac_rfifo.dout_2/axi_adrv9001.dac_1_ch_2 startPortLSB {0}
set_connection_parameter_value util_dac_rfifo.dout_2/axi_adrv9001.dac_1_ch_2 width {0}
add_connection util_dac_rfifo.dout_3 axi_adrv9001.dac_1_ch_3
set_connection_parameter_value util_dac_rfifo.dout_3/axi_adrv9001.dac_1_ch_3 endPort {}
set_connection_parameter_value util_dac_rfifo.dout_3/axi_adrv9001.dac_1_ch_3 endPortLSB {0}
set_connection_parameter_value util_dac_rfifo.dout_3/axi_adrv9001.dac_1_ch_3 startPort {}
set_connection_parameter_value util_dac_rfifo.dout_3/axi_adrv9001.dac_1_ch_3 startPortLSB {0}
set_connection_parameter_value util_dac_rfifo.dout_3/axi_adrv9001.dac_1_ch_3 width {0}
add_connection util_dac_rfifo.if_dout_unf axi_adrv9001.if_dac_1_dunf
set_connection_parameter_value util_dac_rfifo.if_dout_unf/axi_adrv9001.if_dac_1_dunf endPort {}
set_connection_parameter_value util_dac_rfifo.if_dout_unf/axi_adrv9001.if_dac_1_dunf endPortLSB {0}
set_connection_parameter_value util_dac_rfifo.if_dout_unf/axi_adrv9001.if_dac_1_dunf startPort {}
set_connection_parameter_value util_dac_rfifo.if_dout_unf/axi_adrv9001.if_dac_1_dunf startPortLSB {0}
set_connection_parameter_value util_dac_rfifo.if_dout_unf/axi_adrv9001.if_dac_1_dunf width {0}

# dac-rfifo2

add_instance util_dac_rfifo2 util_rfifo 1.0
set_instance_parameter_value util_dac_rfifo2 {DIN_ADDRESS_WIDTH} {5}
set_instance_parameter_value util_dac_rfifo2 {DIN_DATA_WIDTH} {16}
set_instance_parameter_value util_dac_rfifo2 {DOUT_DATA_WIDTH} {16}
set_instance_parameter_value util_dac_rfifo2 {NUM_OF_CHANNELS} {2}
add_connection axi_adrv9001.if_dac_2_clk util_dac_rfifo2.if_dout_clk
add_connection axi_adrv9001.if_dac_2_rst util_dac_rfifo2.if_dout_rst
add_connection sys_clk.clk_reset util_dac_rfifo2.if_din_rstn
add_connection sys_dma_clk.clk util_dac_rfifo2.if_din_clk
add_connection util_dac_rfifo2.dout_0 axi_adrv9001.dac_2_ch_0
set_connection_parameter_value util_dac_rfifo2.dout_0/axi_adrv9001.dac_2_ch_0 endPort {}
set_connection_parameter_value util_dac_rfifo2.dout_0/axi_adrv9001.dac_2_ch_0 endPortLSB {0}
set_connection_parameter_value util_dac_rfifo2.dout_0/axi_adrv9001.dac_2_ch_0 startPort {}
set_connection_parameter_value util_dac_rfifo2.dout_0/axi_adrv9001.dac_2_ch_0 startPortLSB {0}
set_connection_parameter_value util_dac_rfifo2.dout_0/axi_adrv9001.dac_2_ch_0 width {0}
add_connection util_dac_rfifo2.dout_1 axi_adrv9001.dac_2_ch_1
set_connection_parameter_value util_dac_rfifo2.dout_1/axi_adrv9001.dac_2_ch_1 endPort {}
set_connection_parameter_value util_dac_rfifo2.dout_1/axi_adrv9001.dac_2_ch_1 endPortLSB {0}
set_connection_parameter_value util_dac_rfifo2.dout_1/axi_adrv9001.dac_2_ch_1 startPort {}
set_connection_parameter_value util_dac_rfifo2.dout_1/axi_adrv9001.dac_2_ch_1 startPortLSB {0}
set_connection_parameter_value util_dac_rfifo2.dout_1/axi_adrv9001.dac_2_ch_1 width {0}
add_connection util_dac_rfifo2.if_dout_unf axi_adrv9001.if_dac_2_dunf
set_connection_parameter_value util_dac_rfifo2.if_dout_unf/axi_adrv9001.if_dac_2_dunf endPort {}
set_connection_parameter_value util_dac_rfifo2.if_dout_unf/axi_adrv9001.if_dac_2_dunf endPortLSB {0}
set_connection_parameter_value util_dac_rfifo2.if_dout_unf/axi_adrv9001.if_dac_2_dunf startPort {}
set_connection_parameter_value util_dac_rfifo2.if_dout_unf/axi_adrv9001.if_dac_2_dunf startPortLSB {0}
set_connection_parameter_value util_dac_rfifo2.if_dout_unf/axi_adrv9001.if_dac_2_dunf width {0}

# adc-pack

add_instance util_adc_pack util_cpack2 1.0
set_instance_parameter_value util_adc_pack {NUM_OF_CHANNELS} {4}
set_instance_parameter_value util_adc_pack {SAMPLES_PER_CHANNEL} {1}
set_instance_parameter_value util_adc_pack {SAMPLE_DATA_WIDTH} {16}
add_connection sys_clk.clk_reset util_adc_pack.reset
add_connection sys_dma_clk.clk util_adc_pack.clk
add_connection util_adc_pack.if_fifo_wr_overflow util_adc_wfifo.if_dout_ovf
set_connection_parameter_value util_adc_pack.if_fifo_wr_overflow/util_adc_wfifo.if_dout_ovf endPort {}
set_connection_parameter_value util_adc_pack.if_fifo_wr_overflow/util_adc_wfifo.if_dout_ovf endPortLSB {0}
set_connection_parameter_value util_adc_pack.if_fifo_wr_overflow/util_adc_wfifo.if_dout_ovf startPort {}
set_connection_parameter_value util_adc_pack.if_fifo_wr_overflow/util_adc_wfifo.if_dout_ovf startPortLSB {0}
set_connection_parameter_value util_adc_pack.if_fifo_wr_overflow/util_adc_wfifo.if_dout_ovf width {0}
add_connection util_adc_wfifo.dout_0 util_adc_pack.adc_ch_0
set_connection_parameter_value util_adc_wfifo.dout_0/util_adc_pack.adc_ch_0 endPort {}
set_connection_parameter_value util_adc_wfifo.dout_0/util_adc_pack.adc_ch_0 endPortLSB {0}
set_connection_parameter_value util_adc_wfifo.dout_0/util_adc_pack.adc_ch_0 startPort {}
set_connection_parameter_value util_adc_wfifo.dout_0/util_adc_pack.adc_ch_0 startPortLSB {0}
set_connection_parameter_value util_adc_wfifo.dout_0/util_adc_pack.adc_ch_0 width {0}
add_connection util_adc_wfifo.dout_1 util_adc_pack.adc_ch_1
set_connection_parameter_value util_adc_wfifo.dout_1/util_adc_pack.adc_ch_1 endPort {}
set_connection_parameter_value util_adc_wfifo.dout_1/util_adc_pack.adc_ch_1 endPortLSB {0}
set_connection_parameter_value util_adc_wfifo.dout_1/util_adc_pack.adc_ch_1 startPort {}
set_connection_parameter_value util_adc_wfifo.dout_1/util_adc_pack.adc_ch_1 startPortLSB {0}
set_connection_parameter_value util_adc_wfifo.dout_1/util_adc_pack.adc_ch_1 width {0}
add_connection util_adc_wfifo.dout_2 util_adc_pack.adc_ch_2
set_connection_parameter_value util_adc_wfifo.dout_2/util_adc_pack.adc_ch_2 endPort {}
set_connection_parameter_value util_adc_wfifo.dout_2/util_adc_pack.adc_ch_2 endPortLSB {0}
set_connection_parameter_value util_adc_wfifo.dout_2/util_adc_pack.adc_ch_2 startPort {}
set_connection_parameter_value util_adc_wfifo.dout_2/util_adc_pack.adc_ch_2 startPortLSB {0}
set_connection_parameter_value util_adc_wfifo.dout_2/util_adc_pack.adc_ch_2 width {0}
add_connection util_adc_wfifo.dout_3 util_adc_pack.adc_ch_3
set_connection_parameter_value util_adc_wfifo.dout_3/util_adc_pack.adc_ch_3 endPort {}
set_connection_parameter_value util_adc_wfifo.dout_3/util_adc_pack.adc_ch_3 endPortLSB {0}
set_connection_parameter_value util_adc_wfifo.dout_3/util_adc_pack.adc_ch_3 startPort {}
set_connection_parameter_value util_adc_wfifo.dout_3/util_adc_pack.adc_ch_3 startPortLSB {0}
set_connection_parameter_value util_adc_wfifo.dout_3/util_adc_pack.adc_ch_3 width {0}
add_connection util_adc_wfifo.if_din_ovf axi_adrv9001.if_adc_1_dovf
set_connection_parameter_value util_adc_wfifo.if_din_ovf/axi_adrv9001.if_adc_1_dovf endPort {}
set_connection_parameter_value util_adc_wfifo.if_din_ovf/axi_adrv9001.if_adc_1_dovf endPortLSB {0}
set_connection_parameter_value util_adc_wfifo.if_din_ovf/axi_adrv9001.if_adc_1_dovf startPort {}
set_connection_parameter_value util_adc_wfifo.if_din_ovf/axi_adrv9001.if_adc_1_dovf startPortLSB {0}
set_connection_parameter_value util_adc_wfifo.if_din_ovf/axi_adrv9001.if_adc_1_dovf width {0}

# adc-pack2

add_instance util_adc_pack2 util_cpack2 1.0
set_instance_parameter_value util_adc_pack2 {NUM_OF_CHANNELS} {2}
set_instance_parameter_value util_adc_pack2 {SAMPLES_PER_CHANNEL} {1}
set_instance_parameter_value util_adc_pack2 {SAMPLE_DATA_WIDTH} {16}
add_connection sys_clk.clk_reset util_adc_pack2.reset
add_connection sys_dma_clk.clk util_adc_pack2.clk
add_connection util_adc_pack2.adc_ch_0 util_adc_wfifo2.dout_0
set_connection_parameter_value util_adc_pack2.adc_ch_0/util_adc_wfifo2.dout_0 endPort {}
set_connection_parameter_value util_adc_pack2.adc_ch_0/util_adc_wfifo2.dout_0 endPortLSB {0}
set_connection_parameter_value util_adc_pack2.adc_ch_0/util_adc_wfifo2.dout_0 startPort {}
set_connection_parameter_value util_adc_pack2.adc_ch_0/util_adc_wfifo2.dout_0 startPortLSB {0}
set_connection_parameter_value util_adc_pack2.adc_ch_0/util_adc_wfifo2.dout_0 width {0}
add_connection util_adc_pack2.adc_ch_1 util_adc_wfifo2.dout_1
set_connection_parameter_value util_adc_pack2.adc_ch_1/util_adc_wfifo2.dout_1 endPort {}
set_connection_parameter_value util_adc_pack2.adc_ch_1/util_adc_wfifo2.dout_1 endPortLSB {0}
set_connection_parameter_value util_adc_pack2.adc_ch_1/util_adc_wfifo2.dout_1 startPort {}
set_connection_parameter_value util_adc_pack2.adc_ch_1/util_adc_wfifo2.dout_1 startPortLSB {0}
set_connection_parameter_value util_adc_pack2.adc_ch_1/util_adc_wfifo2.dout_1 width {0}
add_connection util_adc_pack2.if_fifo_wr_overflow util_adc_wfifo2.if_dout_ovf
set_connection_parameter_value util_adc_pack2.if_fifo_wr_overflow/util_adc_wfifo2.if_dout_ovf endPort {}
set_connection_parameter_value util_adc_pack2.if_fifo_wr_overflow/util_adc_wfifo2.if_dout_ovf endPortLSB {0}
set_connection_parameter_value util_adc_pack2.if_fifo_wr_overflow/util_adc_wfifo2.if_dout_ovf startPort {}
set_connection_parameter_value util_adc_pack2.if_fifo_wr_overflow/util_adc_wfifo2.if_dout_ovf startPortLSB {0}
set_connection_parameter_value util_adc_pack2.if_fifo_wr_overflow/util_adc_wfifo2.if_dout_ovf width {0}

# dac-unpack

add_instance util_dac_upack util_upack2 1.0
set_instance_parameter_value util_dac_upack {INTERFACE_TYPE} {0}
set_instance_parameter_value util_dac_upack {NUM_OF_CHANNELS} {4}
set_instance_parameter_value util_dac_upack {SAMPLES_PER_CHANNEL} {1}
set_instance_parameter_value util_dac_upack {SAMPLE_DATA_WIDTH} {16}
add_connection sys_clk.clk_reset util_dac_upack.reset
add_connection sys_dma_clk.clk util_dac_upack.clk
add_connection util_dac_upack.dac_ch_0 util_dac_rfifo.din_0
set_connection_parameter_value util_dac_upack.dac_ch_0/util_dac_rfifo.din_0 endPort {}
set_connection_parameter_value util_dac_upack.dac_ch_0/util_dac_rfifo.din_0 endPortLSB {0}
set_connection_parameter_value util_dac_upack.dac_ch_0/util_dac_rfifo.din_0 startPort {}
set_connection_parameter_value util_dac_upack.dac_ch_0/util_dac_rfifo.din_0 startPortLSB {0}
set_connection_parameter_value util_dac_upack.dac_ch_0/util_dac_rfifo.din_0 width {0}
add_connection util_dac_upack.dac_ch_1 util_dac_rfifo.din_1
set_connection_parameter_value util_dac_upack.dac_ch_1/util_dac_rfifo.din_1 endPort {}
set_connection_parameter_value util_dac_upack.dac_ch_1/util_dac_rfifo.din_1 endPortLSB {0}
set_connection_parameter_value util_dac_upack.dac_ch_1/util_dac_rfifo.din_1 startPort {}
set_connection_parameter_value util_dac_upack.dac_ch_1/util_dac_rfifo.din_1 startPortLSB {0}
set_connection_parameter_value util_dac_upack.dac_ch_1/util_dac_rfifo.din_1 width {0}
add_connection util_dac_upack.dac_ch_2 util_dac_rfifo.din_2
set_connection_parameter_value util_dac_upack.dac_ch_2/util_dac_rfifo.din_2 endPort {}
set_connection_parameter_value util_dac_upack.dac_ch_2/util_dac_rfifo.din_2 endPortLSB {0}
set_connection_parameter_value util_dac_upack.dac_ch_2/util_dac_rfifo.din_2 startPort {}
set_connection_parameter_value util_dac_upack.dac_ch_2/util_dac_rfifo.din_2 startPortLSB {0}
set_connection_parameter_value util_dac_upack.dac_ch_2/util_dac_rfifo.din_2 width {0}
add_connection util_dac_upack.dac_ch_3 util_dac_rfifo.din_3
set_connection_parameter_value util_dac_upack.dac_ch_3/util_dac_rfifo.din_3 endPort {}
set_connection_parameter_value util_dac_upack.dac_ch_3/util_dac_rfifo.din_3 endPortLSB {0}
set_connection_parameter_value util_dac_upack.dac_ch_3/util_dac_rfifo.din_3 startPort {}
set_connection_parameter_value util_dac_upack.dac_ch_3/util_dac_rfifo.din_3 startPortLSB {0}
set_connection_parameter_value util_dac_upack.dac_ch_3/util_dac_rfifo.din_3 width {0}
add_connection util_dac_upack.if_fifo_rd_underflow util_dac_rfifo.if_din_unf
set_connection_parameter_value util_dac_upack.if_fifo_rd_underflow/util_dac_rfifo.if_din_unf endPort {}
set_connection_parameter_value util_dac_upack.if_fifo_rd_underflow/util_dac_rfifo.if_din_unf endPortLSB {0}
set_connection_parameter_value util_dac_upack.if_fifo_rd_underflow/util_dac_rfifo.if_din_unf startPort {}
set_connection_parameter_value util_dac_upack.if_fifo_rd_underflow/util_dac_rfifo.if_din_unf startPortLSB {0}
set_connection_parameter_value util_dac_upack.if_fifo_rd_underflow/util_dac_rfifo.if_din_unf width {0}

# dac-unpack2

add_instance util_dac_upack2 util_upack2 1.0
set_instance_parameter_value util_dac_upack2 {INTERFACE_TYPE} {0}
set_instance_parameter_value util_dac_upack2 {NUM_OF_CHANNELS} {2}
set_instance_parameter_value util_dac_upack2 {SAMPLES_PER_CHANNEL} {1}
set_instance_parameter_value util_dac_upack2 {SAMPLE_DATA_WIDTH} {16}
add_connection sys_clk.clk_reset util_dac_upack2.reset
add_connection sys_dma_clk.clk util_dac_upack2.clk
add_connection util_dac_upack2.dac_ch_0 util_dac_rfifo2.din_0
set_connection_parameter_value util_dac_upack2.dac_ch_0/util_dac_rfifo2.din_0 endPort {}
set_connection_parameter_value util_dac_upack2.dac_ch_0/util_dac_rfifo2.din_0 endPortLSB {0}
set_connection_parameter_value util_dac_upack2.dac_ch_0/util_dac_rfifo2.din_0 startPort {}
set_connection_parameter_value util_dac_upack2.dac_ch_0/util_dac_rfifo2.din_0 startPortLSB {0}
set_connection_parameter_value util_dac_upack2.dac_ch_0/util_dac_rfifo2.din_0 width {0}
add_connection util_dac_upack2.dac_ch_1 util_dac_rfifo2.din_1
set_connection_parameter_value util_dac_upack2.dac_ch_1/util_dac_rfifo2.din_1 endPort {}
set_connection_parameter_value util_dac_upack2.dac_ch_1/util_dac_rfifo2.din_1 endPortLSB {0}
set_connection_parameter_value util_dac_upack2.dac_ch_1/util_dac_rfifo2.din_1 startPort {}
set_connection_parameter_value util_dac_upack2.dac_ch_1/util_dac_rfifo2.din_1 startPortLSB {0}
set_connection_parameter_value util_dac_upack2.dac_ch_1/util_dac_rfifo2.din_1 width {0}
add_connection util_dac_upack2.if_fifo_rd_underflow util_dac_rfifo2.if_din_unf
set_connection_parameter_value util_dac_upack2.if_fifo_rd_underflow/util_dac_rfifo2.if_din_unf endPort {}
set_connection_parameter_value util_dac_upack2.if_fifo_rd_underflow/util_dac_rfifo2.if_din_unf endPortLSB {0}
set_connection_parameter_value util_dac_upack2.if_fifo_rd_underflow/util_dac_rfifo2.if_din_unf startPort {}
set_connection_parameter_value util_dac_upack2.if_fifo_rd_underflow/util_dac_rfifo2.if_din_unf startPortLSB {0}
set_connection_parameter_value util_dac_upack2.if_fifo_rd_underflow/util_dac_rfifo2.if_din_unf width {0}

# adc-dma

add_instance axi_adc_dma axi_dmac 1.0
set_instance_parameter_value axi_adc_dma {ASYNC_CLK_DEST_REQ_MANUAL} {1}
set_instance_parameter_value axi_adc_dma {ASYNC_CLK_REQ_SRC_MANUAL} {1}
set_instance_parameter_value axi_adc_dma {ASYNC_CLK_SRC_DEST_MANUAL} {1}
set_instance_parameter_value axi_adc_dma {AUTO_ASYNC_CLK} {1}
set_instance_parameter_value axi_adc_dma {AXI_SLICE_DEST} {0}
set_instance_parameter_value axi_adc_dma {AXI_SLICE_SRC} {0}
set_instance_parameter_value axi_adc_dma {CYCLIC} {0}
set_instance_parameter_value axi_adc_dma {DISABLE_DEBUG_REGISTERS} {0}
set_instance_parameter_value axi_adc_dma {DMA_2D_TRANSFER} {0}
set_instance_parameter_value axi_adc_dma {DMA_AXIS_DEST_W} {4}
set_instance_parameter_value axi_adc_dma {DMA_AXIS_ID_W} {8}
set_instance_parameter_value axi_adc_dma {DMA_AXI_ADDR_WIDTH} {32}
set_instance_parameter_value axi_adc_dma {DMA_AXI_PROTOCOL_DEST} {1}
set_instance_parameter_value axi_adc_dma {DMA_AXI_PROTOCOL_SRC} {1}
set_instance_parameter_value axi_adc_dma {DMA_DATA_WIDTH_DEST} {64}
set_instance_parameter_value axi_adc_dma {DMA_DATA_WIDTH_SRC} {64}
set_instance_parameter_value axi_adc_dma {DMA_LENGTH_WIDTH} {24}
set_instance_parameter_value axi_adc_dma {DMA_TYPE_DEST} {0}
set_instance_parameter_value axi_adc_dma {DMA_TYPE_SRC} {2}
set_instance_parameter_value axi_adc_dma {ENABLE_DIAGNOSTICS_IF} {0}
set_instance_parameter_value axi_adc_dma {FIFO_SIZE} {4}
set_instance_parameter_value axi_adc_dma {HAS_AXIS_TDEST} {0}
set_instance_parameter_value axi_adc_dma {HAS_AXIS_TID} {0}
set_instance_parameter_value axi_adc_dma {HAS_AXIS_TKEEP} {0}
set_instance_parameter_value axi_adc_dma {HAS_AXIS_TLAST} {0}
set_instance_parameter_value axi_adc_dma {HAS_AXIS_TSTRB} {0}
set_instance_parameter_value axi_adc_dma {HAS_AXIS_TUSER} {0}
set_instance_parameter_value axi_adc_dma {ID} {0}
set_instance_parameter_value axi_adc_dma {MAX_BYTES_PER_BURST} {128}
set_instance_parameter_value axi_adc_dma {SYNC_TRANSFER_START} {1}
add_connection axi_adc_dma.if_fifo_wr_overflow util_adc_pack.if_packed_fifo_wr_overflow
set_connection_parameter_value axi_adc_dma.if_fifo_wr_overflow/util_adc_pack.if_packed_fifo_wr_overflow endPort {}
set_connection_parameter_value axi_adc_dma.if_fifo_wr_overflow/util_adc_pack.if_packed_fifo_wr_overflow endPortLSB {0}
set_connection_parameter_value axi_adc_dma.if_fifo_wr_overflow/util_adc_pack.if_packed_fifo_wr_overflow startPort {}
set_connection_parameter_value axi_adc_dma.if_fifo_wr_overflow/util_adc_pack.if_packed_fifo_wr_overflow startPortLSB {0}
set_connection_parameter_value axi_adc_dma.if_fifo_wr_overflow/util_adc_pack.if_packed_fifo_wr_overflow width {0}
add_connection sys_clk.clk axi_adc_dma.s_axi_clock
add_connection sys_clk.clk_reset axi_adc_dma.s_axi_reset
add_connection sys_dma_clk.clk axi_adc_dma.if_fifo_wr_clk
add_connection sys_dma_clk.clk axi_adc_dma.m_dest_axi_clock
add_connection sys_dma_clk.clk_reset axi_adc_dma.m_dest_axi_reset
add_connection util_adc_pack.if_packed_fifo_wr_data axi_adc_dma.if_fifo_wr_din
set_connection_parameter_value util_adc_pack.if_packed_fifo_wr_data/axi_adc_dma.if_fifo_wr_din endPort {}
set_connection_parameter_value util_adc_pack.if_packed_fifo_wr_data/axi_adc_dma.if_fifo_wr_din endPortLSB {0}
set_connection_parameter_value util_adc_pack.if_packed_fifo_wr_data/axi_adc_dma.if_fifo_wr_din startPort {}
set_connection_parameter_value util_adc_pack.if_packed_fifo_wr_data/axi_adc_dma.if_fifo_wr_din startPortLSB {0}
set_connection_parameter_value util_adc_pack.if_packed_fifo_wr_data/axi_adc_dma.if_fifo_wr_din width {0}
add_connection util_adc_pack.if_packed_fifo_wr_en axi_adc_dma.if_fifo_wr_en
set_connection_parameter_value util_adc_pack.if_packed_fifo_wr_en/axi_adc_dma.if_fifo_wr_en endPort {}
set_connection_parameter_value util_adc_pack.if_packed_fifo_wr_en/axi_adc_dma.if_fifo_wr_en endPortLSB {0}
set_connection_parameter_value util_adc_pack.if_packed_fifo_wr_en/axi_adc_dma.if_fifo_wr_en startPort {}
set_connection_parameter_value util_adc_pack.if_packed_fifo_wr_en/axi_adc_dma.if_fifo_wr_en startPortLSB {0}
set_connection_parameter_value util_adc_pack.if_packed_fifo_wr_en/axi_adc_dma.if_fifo_wr_en width {0}
add_connection util_adc_pack.if_packed_fifo_wr_sync axi_adc_dma.if_fifo_wr_sync
set_connection_parameter_value util_adc_pack.if_packed_fifo_wr_sync/axi_adc_dma.if_fifo_wr_sync endPort {}
set_connection_parameter_value util_adc_pack.if_packed_fifo_wr_sync/axi_adc_dma.if_fifo_wr_sync endPortLSB {0}
set_connection_parameter_value util_adc_pack.if_packed_fifo_wr_sync/axi_adc_dma.if_fifo_wr_sync startPort {}
set_connection_parameter_value util_adc_pack.if_packed_fifo_wr_sync/axi_adc_dma.if_fifo_wr_sync startPortLSB {0}
set_connection_parameter_value util_adc_pack.if_packed_fifo_wr_sync/axi_adc_dma.if_fifo_wr_sync width {0}

# adc-dma2

add_instance axi_adc_dma2 axi_dmac 1.0
set_instance_parameter_value axi_adc_dma2 {ASYNC_CLK_DEST_REQ_MANUAL} {1}
set_instance_parameter_value axi_adc_dma2 {ASYNC_CLK_REQ_SRC_MANUAL} {1}
set_instance_parameter_value axi_adc_dma2 {ASYNC_CLK_SRC_DEST_MANUAL} {1}
set_instance_parameter_value axi_adc_dma2 {AUTO_ASYNC_CLK} {1}
set_instance_parameter_value axi_adc_dma2 {AXI_SLICE_DEST} {0}
set_instance_parameter_value axi_adc_dma2 {AXI_SLICE_SRC} {0}
set_instance_parameter_value axi_adc_dma2 {CYCLIC} {0}
set_instance_parameter_value axi_adc_dma2 {DISABLE_DEBUG_REGISTERS} {0}
set_instance_parameter_value axi_adc_dma2 {DMA_2D_TRANSFER} {0}
set_instance_parameter_value axi_adc_dma2 {DMA_AXIS_DEST_W} {4}
set_instance_parameter_value axi_adc_dma2 {DMA_AXIS_ID_W} {8}
set_instance_parameter_value axi_adc_dma2 {DMA_AXI_ADDR_WIDTH} {32}
set_instance_parameter_value axi_adc_dma2 {DMA_AXI_PROTOCOL_DEST} {1}
set_instance_parameter_value axi_adc_dma2 {DMA_AXI_PROTOCOL_SRC} {1}
set_instance_parameter_value axi_adc_dma2 {DMA_DATA_WIDTH_DEST} {64}
set_instance_parameter_value axi_adc_dma2 {DMA_DATA_WIDTH_SRC} {32}
set_instance_parameter_value axi_adc_dma2 {DMA_LENGTH_WIDTH} {24}
set_instance_parameter_value axi_adc_dma2 {DMA_TYPE_DEST} {0}
set_instance_parameter_value axi_adc_dma2 {DMA_TYPE_SRC} {2}
set_instance_parameter_value axi_adc_dma2 {ENABLE_DIAGNOSTICS_IF} {0}
set_instance_parameter_value axi_adc_dma2 {FIFO_SIZE} {2}
set_instance_parameter_value axi_adc_dma2 {HAS_AXIS_TDEST} {0}
set_instance_parameter_value axi_adc_dma2 {HAS_AXIS_TID} {0}
set_instance_parameter_value axi_adc_dma2 {HAS_AXIS_TKEEP} {0}
set_instance_parameter_value axi_adc_dma2 {HAS_AXIS_TLAST} {0}
set_instance_parameter_value axi_adc_dma2 {HAS_AXIS_TSTRB} {0}
set_instance_parameter_value axi_adc_dma2 {HAS_AXIS_TUSER} {0}
set_instance_parameter_value axi_adc_dma2 {ID} {1}
set_instance_parameter_value axi_adc_dma2 {MAX_BYTES_PER_BURST} {64}
set_instance_parameter_value axi_adc_dma2 {SYNC_TRANSFER_START} {1}
add_connection axi_adc_dma2.if_fifo_wr_din util_adc_pack2.if_packed_fifo_wr_data
set_connection_parameter_value axi_adc_dma2.if_fifo_wr_din/util_adc_pack2.if_packed_fifo_wr_data endPort {}
set_connection_parameter_value axi_adc_dma2.if_fifo_wr_din/util_adc_pack2.if_packed_fifo_wr_data endPortLSB {0}
set_connection_parameter_value axi_adc_dma2.if_fifo_wr_din/util_adc_pack2.if_packed_fifo_wr_data startPort {}
set_connection_parameter_value axi_adc_dma2.if_fifo_wr_din/util_adc_pack2.if_packed_fifo_wr_data startPortLSB {0}
set_connection_parameter_value axi_adc_dma2.if_fifo_wr_din/util_adc_pack2.if_packed_fifo_wr_data width {0}
add_connection axi_adc_dma2.if_fifo_wr_en util_adc_pack2.if_packed_fifo_wr_en
set_connection_parameter_value axi_adc_dma2.if_fifo_wr_en/util_adc_pack2.if_packed_fifo_wr_en endPort {}
set_connection_parameter_value axi_adc_dma2.if_fifo_wr_en/util_adc_pack2.if_packed_fifo_wr_en endPortLSB {0}
set_connection_parameter_value axi_adc_dma2.if_fifo_wr_en/util_adc_pack2.if_packed_fifo_wr_en startPort {}
set_connection_parameter_value axi_adc_dma2.if_fifo_wr_en/util_adc_pack2.if_packed_fifo_wr_en startPortLSB {0}
set_connection_parameter_value axi_adc_dma2.if_fifo_wr_en/util_adc_pack2.if_packed_fifo_wr_en width {0}
add_connection axi_adc_dma2.if_fifo_wr_overflow util_adc_pack2.if_packed_fifo_wr_overflow
set_connection_parameter_value axi_adc_dma2.if_fifo_wr_overflow/util_adc_pack2.if_packed_fifo_wr_overflow endPort {}
set_connection_parameter_value axi_adc_dma2.if_fifo_wr_overflow/util_adc_pack2.if_packed_fifo_wr_overflow endPortLSB {0}
set_connection_parameter_value axi_adc_dma2.if_fifo_wr_overflow/util_adc_pack2.if_packed_fifo_wr_overflow startPort {}
set_connection_parameter_value axi_adc_dma2.if_fifo_wr_overflow/util_adc_pack2.if_packed_fifo_wr_overflow startPortLSB {0}
set_connection_parameter_value axi_adc_dma2.if_fifo_wr_overflow/util_adc_pack2.if_packed_fifo_wr_overflow width {0}
add_connection axi_adc_dma2.if_fifo_wr_sync util_adc_pack2.if_packed_fifo_wr_sync
set_connection_parameter_value axi_adc_dma2.if_fifo_wr_sync/util_adc_pack2.if_packed_fifo_wr_sync endPort {}
set_connection_parameter_value axi_adc_dma2.if_fifo_wr_sync/util_adc_pack2.if_packed_fifo_wr_sync endPortLSB {0}
set_connection_parameter_value axi_adc_dma2.if_fifo_wr_sync/util_adc_pack2.if_packed_fifo_wr_sync startPort {}
set_connection_parameter_value axi_adc_dma2.if_fifo_wr_sync/util_adc_pack2.if_packed_fifo_wr_sync startPortLSB {0}
set_connection_parameter_value axi_adc_dma2.if_fifo_wr_sync/util_adc_pack2.if_packed_fifo_wr_sync width {0}
add_connection sys_clk.clk axi_adc_dma2.s_axi_clock
add_connection sys_clk.clk_reset axi_adc_dma2.s_axi_reset
add_connection sys_dma_clk.clk axi_adc_dma2.if_fifo_wr_clk
add_connection sys_dma_clk.clk axi_adc_dma2.m_dest_axi_clock
add_connection sys_dma_clk.clk_reset axi_adc_dma2.m_dest_axi_reset

# dac-dma

add_instance axi_dac_dma axi_dmac 1.0
set_instance_parameter_value axi_dac_dma {ASYNC_CLK_DEST_REQ_MANUAL} {1}
set_instance_parameter_value axi_dac_dma {ASYNC_CLK_REQ_SRC_MANUAL} {1}
set_instance_parameter_value axi_dac_dma {ASYNC_CLK_SRC_DEST_MANUAL} {1}
set_instance_parameter_value axi_dac_dma {AUTO_ASYNC_CLK} {1}
set_instance_parameter_value axi_dac_dma {AXI_SLICE_DEST} {0}
set_instance_parameter_value axi_dac_dma {AXI_SLICE_SRC} {0}
set_instance_parameter_value axi_dac_dma {CYCLIC} {1}
set_instance_parameter_value axi_dac_dma {DISABLE_DEBUG_REGISTERS} {0}
set_instance_parameter_value axi_dac_dma {DMA_2D_TRANSFER} {0}
set_instance_parameter_value axi_dac_dma {DMA_AXIS_DEST_W} {4}
set_instance_parameter_value axi_dac_dma {DMA_AXIS_ID_W} {8}
set_instance_parameter_value axi_dac_dma {DMA_AXI_ADDR_WIDTH} {32}
set_instance_parameter_value axi_dac_dma {DMA_AXI_PROTOCOL_DEST} {1}
set_instance_parameter_value axi_dac_dma {DMA_AXI_PROTOCOL_SRC} {1}
set_instance_parameter_value axi_dac_dma {DMA_DATA_WIDTH_DEST} {64}
set_instance_parameter_value axi_dac_dma {DMA_DATA_WIDTH_SRC} {64}
set_instance_parameter_value axi_dac_dma {DMA_LENGTH_WIDTH} {24}
set_instance_parameter_value axi_dac_dma {DMA_TYPE_DEST} {1}
set_instance_parameter_value axi_dac_dma {DMA_TYPE_SRC} {0}
set_instance_parameter_value axi_dac_dma {ENABLE_DIAGNOSTICS_IF} {0}
set_instance_parameter_value axi_dac_dma {FIFO_SIZE} {4}
set_instance_parameter_value axi_dac_dma {HAS_AXIS_TDEST} {0}
set_instance_parameter_value axi_dac_dma {HAS_AXIS_TID} {0}
set_instance_parameter_value axi_dac_dma {HAS_AXIS_TKEEP} {0}
set_instance_parameter_value axi_dac_dma {HAS_AXIS_TLAST} {0}
set_instance_parameter_value axi_dac_dma {HAS_AXIS_TSTRB} {0}
set_instance_parameter_value axi_dac_dma {HAS_AXIS_TUSER} {0}
set_instance_parameter_value axi_dac_dma {ID} {0}
set_instance_parameter_value axi_dac_dma {MAX_BYTES_PER_BURST} {128}
set_instance_parameter_value axi_dac_dma {SYNC_TRANSFER_START} {0}
add_connection axi_dac_dma.m_axis util_dac_upack.s_axis
add_connection sys_clk.clk axi_dac_dma.s_axi_clock
add_connection sys_clk.clk_reset axi_dac_dma.s_axi_reset
add_connection sys_dma_clk.clk axi_dac_dma.if_m_axis_aclk
add_connection sys_dma_clk.clk axi_dac_dma.m_src_axi_clock
add_connection sys_dma_clk.clk_reset axi_dac_dma.m_src_axi_reset

# dac-dma2

add_instance axi_dac_dma2 axi_dmac 1.0
set_instance_parameter_value axi_dac_dma2 {ASYNC_CLK_DEST_REQ_MANUAL} {1}
set_instance_parameter_value axi_dac_dma2 {ASYNC_CLK_REQ_SRC_MANUAL} {1}
set_instance_parameter_value axi_dac_dma2 {ASYNC_CLK_SRC_DEST_MANUAL} {1}
set_instance_parameter_value axi_dac_dma2 {AUTO_ASYNC_CLK} {1}
set_instance_parameter_value axi_dac_dma2 {AXI_SLICE_DEST} {0}
set_instance_parameter_value axi_dac_dma2 {AXI_SLICE_SRC} {0}
set_instance_parameter_value axi_dac_dma2 {CYCLIC} {1}
set_instance_parameter_value axi_dac_dma2 {DISABLE_DEBUG_REGISTERS} {0}
set_instance_parameter_value axi_dac_dma2 {DMA_2D_TRANSFER} {0}
set_instance_parameter_value axi_dac_dma2 {DMA_AXIS_DEST_W} {4}
set_instance_parameter_value axi_dac_dma2 {DMA_AXIS_ID_W} {8}
set_instance_parameter_value axi_dac_dma2 {DMA_AXI_ADDR_WIDTH} {32}
set_instance_parameter_value axi_dac_dma2 {DMA_AXI_PROTOCOL_DEST} {1}
set_instance_parameter_value axi_dac_dma2 {DMA_AXI_PROTOCOL_SRC} {1}
set_instance_parameter_value axi_dac_dma2 {DMA_DATA_WIDTH_DEST} {32}
set_instance_parameter_value axi_dac_dma2 {DMA_DATA_WIDTH_SRC} {64}
set_instance_parameter_value axi_dac_dma2 {DMA_LENGTH_WIDTH} {24}
set_instance_parameter_value axi_dac_dma2 {DMA_TYPE_DEST} {1}
set_instance_parameter_value axi_dac_dma2 {DMA_TYPE_SRC} {0}
set_instance_parameter_value axi_dac_dma2 {ENABLE_DIAGNOSTICS_IF} {0}
set_instance_parameter_value axi_dac_dma2 {FIFO_SIZE} {2}
set_instance_parameter_value axi_dac_dma2 {HAS_AXIS_TDEST} {0}
set_instance_parameter_value axi_dac_dma2 {HAS_AXIS_TID} {0}
set_instance_parameter_value axi_dac_dma2 {HAS_AXIS_TKEEP} {0}
set_instance_parameter_value axi_dac_dma2 {HAS_AXIS_TLAST} {0}
set_instance_parameter_value axi_dac_dma2 {HAS_AXIS_TSTRB} {0}
set_instance_parameter_value axi_dac_dma2 {HAS_AXIS_TUSER} {0}
set_instance_parameter_value axi_dac_dma2 {ID} {1}
set_instance_parameter_value axi_dac_dma2 {MAX_BYTES_PER_BURST} {64}
set_instance_parameter_value axi_dac_dma2 {SYNC_TRANSFER_START} {0}
add_connection axi_dac_dma2.m_axis util_dac_upack2.s_axis
add_connection sys_clk.clk axi_dac_dma2.s_axi_clock
add_connection sys_clk.clk_reset axi_dac_dma2.s_axi_reset
add_connection sys_dma_clk.clk axi_dac_dma2.if_m_axis_aclk
add_connection sys_dma_clk.clk axi_dac_dma2.m_src_axi_clock
add_connection sys_dma_clk.clk_reset axi_dac_dma2.m_src_axi_reset

# avl_adrv9001_gpio

add_instance avl_adrv9001_gpio altera_avalon_pio
set_instance_parameter_value avl_adrv9001_gpio {bitClearingEdgeCapReg} {0}
set_instance_parameter_value avl_adrv9001_gpio {bitModifyingOutReg} {0}
set_instance_parameter_value avl_adrv9001_gpio {captureEdge} {0}
set_instance_parameter_value avl_adrv9001_gpio {direction} {Bidir}
set_instance_parameter_value avl_adrv9001_gpio {edgeType} {RISING}
set_instance_parameter_value avl_adrv9001_gpio {generateIRQ} {1}
set_instance_parameter_value avl_adrv9001_gpio {irqType} {LEVEL}
set_instance_parameter_value avl_adrv9001_gpio {resetValue} {0.0}
set_instance_parameter_value avl_adrv9001_gpio {simDoTestBenchWiring} {0}
set_instance_parameter_value avl_adrv9001_gpio {simDrivenValue} {0.0}
set_instance_parameter_value avl_adrv9001_gpio {width} {19}
add_interface adrv9001_gpio conduit end
set_interface_property adrv9001_gpio EXPORT_OF avl_adrv9001_gpio.external_connection
add_connection sys_clk.clk avl_adrv9001_gpio.clk
add_connection sys_clk.clk_reset avl_adrv9001_gpio.reset

# interrupts

ad_cpu_interrupt 0 axi_adc_dma.interrupt_sender
ad_cpu_interrupt 1 axi_adc_dma2.interrupt_sender
ad_cpu_interrupt 2 axi_dac_dma.interrupt_sender
ad_cpu_interrupt 3 axi_dac_dma2.interrupt_sender
ad_cpu_interrupt 7 avl_adrv9001_gpio.irq

# cpu interconnects

ad_cpu_interconnect 0x00060000 avl_adrv9001_gpio.s1
ad_cpu_interconnect 0x00040000 axi_adc_dma.s_axi
ad_cpu_interconnect 0x00041000 axi_adc_dma2.s_axi
ad_cpu_interconnect 0x00020000 axi_adrv9001.s_axi
ad_cpu_interconnect 0x00044000 axi_dac_dma.s_axi
ad_cpu_interconnect 0x00045000 axi_dac_dma2.s_axi

# mem interconnects

ad_dma_interconnect axi_adc_dma.m_dest_axi 0
ad_dma_interconnect axi_adc_dma2.m_dest_axi 0
ad_dma_interconnect axi_dac_dma.m_src_axi 0
ad_dma_interconnect axi_dac_dma2.m_src_axi 0

