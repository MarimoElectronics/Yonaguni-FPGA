
create_clock -period 20.000 -name sys_clk  [get_ports {sys_clk}]
create_clock -period 20.833 -name usb1_clk [get_ports {usb1_clk}]
create_clock -period 81.380 -name dev_clk_out [get_ports {dev_clk_out}]
create_clock -period 12.500 -name rx1_dclk_in_p [get_ports {rx1_dclk_in_p}]
create_clock -period 12.500 -name rx2_dclk_in_p [get_ports {rx2_dclk_in_p}]
create_clock -period 12.500 -name tx1_dclk_in_p [get_ports {tx1_dclk_in_p}]
create_clock -period 12.500 -name tx2_dclk_in_p [get_ports {tx2_dclk_in_p}]

derive_pll_clocks
derive_clock_uncertainty

set_false_path -from [get_registers *altera_reset_synchronizer:alt_rst_sync_uq1|altera_reset_synchronizer_int_chain_out*]

## -----------------------------------------------------------------------------
## set_input_delay setting of ADRV 9002 CSSI             |  min(ns)  |  max(ns)
## -----------------------------------------------------------------------------
## Tdelay of ADRV9002                                    |  0.0      |  5.0
## Skew between data and clock                           | -0.1      |  0.1
## -----------------------------------------------------------------------------
set_input_delay -clock {rx1_dclk_in_p} -max  5.1 [get_ports {rx1_idata*}]
set_input_delay -clock {rx1_dclk_in_p} -max  5.1 [get_ports {rx1_qdata*}]
set_input_delay -clock {rx1_dclk_in_p} -max  5.1 [get_ports {rx1_strobe_in_p}]
set_input_delay -clock {rx1_dclk_in_p} -min -0.1 [get_ports {rx1_idata*}]
set_input_delay -clock {rx1_dclk_in_p} -min -0.1 [get_ports {rx1_qdata*}]
set_input_delay -clock {rx1_dclk_in_p} -min -0.1 [get_ports {rx1_strobe_in_p}]
set_input_delay -clock {rx1_dclk_in_p} -max  5.1 [get_ports {rx1_idata*}]      -clock_fall -add_delay
set_input_delay -clock {rx1_dclk_in_p} -max  5.1 [get_ports {rx1_qdata*}]      -clock_fall -add_delay
set_input_delay -clock {rx1_dclk_in_p} -max  5.1 [get_ports {rx1_strobe_in_p}] -clock_fall -add_delay
set_input_delay -clock {rx1_dclk_in_p} -min -0.1 [get_ports {rx1_idata*}]      -clock_fall -add_delay
set_input_delay -clock {rx1_dclk_in_p} -min -0.1 [get_ports {rx1_qdata*}]      -clock_fall -add_delay
set_input_delay -clock {rx1_dclk_in_p} -min -0.1 [get_ports {rx1_strobe_in_p}] -clock_fall -add_delay

set_input_delay -clock {rx2_dclk_in_p} -max  5.1 [get_ports {rx2_idata*}]
set_input_delay -clock {rx2_dclk_in_p} -max  5.1 [get_ports {rx2_qdata*}]
set_input_delay -clock {rx2_dclk_in_p} -max  5.1 [get_ports {rx2_strobe_in_p}]
set_input_delay -clock {rx2_dclk_in_p} -min -0.1 [get_ports {rx2_idata*}]
set_input_delay -clock {rx2_dclk_in_p} -min -0.1 [get_ports {rx2_qdata*}]
set_input_delay -clock {rx2_dclk_in_p} -min -0.1 [get_ports {rx2_strobe_in_p}]
set_input_delay -clock {rx2_dclk_in_p} -max  5.1 [get_ports {rx2_idata*}]      -clock_fall -add_delay
set_input_delay -clock {rx2_dclk_in_p} -max  5.1 [get_ports {rx2_qdata*}]      -clock_fall -add_delay
set_input_delay -clock {rx2_dclk_in_p} -max  5.1 [get_ports {rx2_strobe_in_p}] -clock_fall -add_delay
set_input_delay -clock {rx2_dclk_in_p} -min -0.1 [get_ports {rx2_idata*}]      -clock_fall -add_delay
set_input_delay -clock {rx2_dclk_in_p} -min -0.1 [get_ports {rx2_qdata*}]      -clock_fall -add_delay
set_input_delay -clock {rx2_dclk_in_p} -min -0.1 [get_ports {rx2_strobe_in_p}] -clock_fall -add_delay

## -----------------------------------------------------------------------------
## set_output_delay setting of ADRV9002 CSSI             |  min(ns)  |  max(ns)
## -----------------------------------------------------------------------------
## Tsetup of ADRV9002                                    |  0.0      |  2.0
## Thold  of ADRV9002                                    |  0.0      |  2.0
## Skew between data and clock(max 3.3mm, 5.5ns/m)       | -0.02     |  0.02
## Ajastable delay of ADRV9002(170ps 7tap)               |  1.19     | -1.19
## -----------------------------------------------------------------------------
create_generated_clock -name tx1_dclk_out_p -source [get_ports {tx1_dclk_in_p}] [get_ports {tx1_dclk_out_p}]
set_output_delay -clock {tx1_dclk_out_p} -max  3.21 [get_ports {tx1_idata_out_n}]
set_output_delay -clock {tx1_dclk_out_p} -max  3.21 [get_ports {tx1_idata_out_p}]
set_output_delay -clock {tx1_dclk_out_p} -max  3.21 [get_ports {tx1_qdata_out_n}]
set_output_delay -clock {tx1_dclk_out_p} -max  3.21 [get_ports {tx1_qdata_out_p}]
set_output_delay -clock {tx1_dclk_out_p} -max  3.21 [get_ports {tx1_strobe_out_p}]
set_output_delay -clock {tx1_dclk_out_p} -min -0.83 [get_ports {tx1_idata_out_n}]
set_output_delay -clock {tx1_dclk_out_p} -min -0.83 [get_ports {tx1_idata_out_p}]
set_output_delay -clock {tx1_dclk_out_p} -min -0.83 [get_ports {tx1_qdata_out_n}]
set_output_delay -clock {tx1_dclk_out_p} -min -0.83 [get_ports {tx1_qdata_out_p}]
set_output_delay -clock {tx1_dclk_out_p} -min -0.83 [get_ports {tx1_strobe_out_p}]
set_output_delay -clock {tx1_dclk_out_p} -max  3.21 [get_ports {tx1_idata_out_n}]  -clock_fall -add_delay
set_output_delay -clock {tx1_dclk_out_p} -max  3.21 [get_ports {tx1_idata_out_p}]  -clock_fall -add_delay
set_output_delay -clock {tx1_dclk_out_p} -max  3.21 [get_ports {tx1_qdata_out_n}]  -clock_fall -add_delay
set_output_delay -clock {tx1_dclk_out_p} -max  3.21 [get_ports {tx1_qdata_out_p}]  -clock_fall -add_delay
set_output_delay -clock {tx1_dclk_out_p} -max  3.21 [get_ports {tx1_strobe_out_p}] -clock_fall -add_delay
set_output_delay -clock {tx1_dclk_out_p} -min -0.83 [get_ports {tx1_idata_out_n}]  -clock_fall -add_delay
set_output_delay -clock {tx1_dclk_out_p} -min -0.83 [get_ports {tx1_idata_out_p}]  -clock_fall -add_delay
set_output_delay -clock {tx1_dclk_out_p} -min -0.83 [get_ports {tx1_qdata_out_n}]  -clock_fall -add_delay
set_output_delay -clock {tx1_dclk_out_p} -min -0.83 [get_ports {tx1_qdata_out_p}]  -clock_fall -add_delay
set_output_delay -clock {tx1_dclk_out_p} -min -0.83 [get_ports {tx1_strobe_out_p}] -clock_fall -add_delay

create_generated_clock -name tx2_dclk_out_p -source [get_ports {tx2_dclk_in_p}] [get_ports {tx2_dclk_out_p}]
set_output_delay -clock {tx2_dclk_out_p} -max  3.21 [get_ports {tx2_idata_out_n}]
set_output_delay -clock {tx2_dclk_out_p} -max  3.21 [get_ports {tx2_idata_out_p}]
set_output_delay -clock {tx2_dclk_out_p} -max  3.21 [get_ports {tx2_qdata_out_n}]
set_output_delay -clock {tx2_dclk_out_p} -max  3.21 [get_ports {tx2_qdata_out_p}]
set_output_delay -clock {tx2_dclk_out_p} -max  3.21 [get_ports {tx2_strobe_out_p}]
set_output_delay -clock {tx2_dclk_out_p} -min -0.83 [get_ports {tx2_idata_out_n}]
set_output_delay -clock {tx2_dclk_out_p} -min -0.83 [get_ports {tx2_idata_out_p}]
set_output_delay -clock {tx2_dclk_out_p} -min -0.83 [get_ports {tx2_qdata_out_n}]
set_output_delay -clock {tx2_dclk_out_p} -min -0.83 [get_ports {tx2_qdata_out_p}]
set_output_delay -clock {tx2_dclk_out_p} -min -0.83 [get_ports {tx2_strobe_out_p}]
set_output_delay -clock {tx2_dclk_out_p} -max  3.21 [get_ports {tx2_idata_out_n}]  -clock_fall -add_delay
set_output_delay -clock {tx2_dclk_out_p} -max  3.21 [get_ports {tx2_idata_out_p}]  -clock_fall -add_delay
set_output_delay -clock {tx2_dclk_out_p} -max  3.21 [get_ports {tx2_qdata_out_n}]  -clock_fall -add_delay
set_output_delay -clock {tx2_dclk_out_p} -max  3.21 [get_ports {tx2_qdata_out_p}]  -clock_fall -add_delay
set_output_delay -clock {tx2_dclk_out_p} -max  3.21 [get_ports {tx2_strobe_out_p}] -clock_fall -add_delay
set_output_delay -clock {tx2_dclk_out_p} -min -0.83 [get_ports {tx2_idata_out_n}]  -clock_fall -add_delay
set_output_delay -clock {tx2_dclk_out_p} -min -0.83 [get_ports {tx2_idata_out_p}]  -clock_fall -add_delay
set_output_delay -clock {tx2_dclk_out_p} -min -0.83 [get_ports {tx2_qdata_out_n}]  -clock_fall -add_delay
set_output_delay -clock {tx2_dclk_out_p} -min -0.83 [get_ports {tx2_qdata_out_p}]  -clock_fall -add_delay
set_output_delay -clock {tx2_dclk_out_p} -min -0.83 [get_ports {tx2_strobe_out_p}] -clock_fall -add_delay
