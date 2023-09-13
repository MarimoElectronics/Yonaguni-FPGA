
create_clock -period 20.000 -name sys_clk  [get_ports {sys_clk}]
create_clock -period 20.833 -name usb1_clk [get_ports {usb1_clk}]
create_clock -period 40.690 -name dev_clk_out [get_ports {dev_clk_out}]
create_clock -period 12.500 -name rx1_dclk_in_p [get_ports {rx1_dclk_in_p}]
create_clock -period 12.500 -name rx2_dclk_in_p [get_ports {rx2_dclk_in_p}]
create_clock -period 12.500 -name tx1_dclk_in_p [get_ports {tx1_dclk_in_p}]
create_clock -period 12.500 -name tx2_dclk_in_p [get_ports {tx2_dclk_in_p}]
create_generated_clock -name r_i2s_mclk -source [get_ports {dev_clk_out}] -divide_by 2 [get_nets {r_i2s_mclk}]

derive_pll_clocks
derive_clock_uncertainty

set_false_path -from [get_registers *altera_reset_synchronizer:alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out*]
set_false_path -to [get_registers *axi_adrv9001:axi_adrv9001|axi_adrv9001_core:i_core|sync_bits:i_tx1_ctrl_sync|cdc_sync_stage1*]
set_false_path -to [get_registers *axi_adrv9001:axi_adrv9001|axi_adrv9001_core:i_core|sync_bits:i_rx1_ctrl_sync|cdc_sync_stage1*]
