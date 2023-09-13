// ***************************************************************************
// ***************************************************************************
// Copyright 2014 - 2020 (c) Analog Devices, Inc. All rights reserved.
//
// In this HDL repository, there are many different and unique modules, consisting
// of various HDL (Verilog or VHDL) components. The individual modules are
// developed independently, and may be accompanied by separate and unique license
// terms.
//
// The user should read each of these license terms, and understand the
// freedoms and responsibilities that he or she has by using this source/core.
//
// This core is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE.
//
// Redistribution and use of source or resulting binaries, with or without modification
// of this file, are permitted under one of the following two license terms:
//
//   1. The GNU General Public License version 2 as published by the
//      Free Software Foundation, which can be found in the top level directory
//      of this repository (LICENSE_GPL2), and also online at:
//      <https://www.gnu.org/licenses/old-licenses/gpl-2.0.html>
//
// OR
//
//   2. An ADI specific BSD license, which can be found in the top level directory
//      of this repository (LICENSE_ADIBSD), and also on-line at:
//      https://github.com/analogdevicesinc/hdl/blob/master/LICENSE_ADIBSD
//      This will allow to generate bit files and not release the source code,
//      as long as it attaches to an ADI device.
//
// ***************************************************************************
// ***************************************************************************

`timescale 1ns/100ps

module adrv9001_rx #(
  parameter CMOS_LVDS_N = 0,
  parameter FPGA_TECHNOLOGY = 0,
  parameter NUM_LANES = 3,
  parameter DRP_WIDTH = 5,
  parameter IODELAY_CTRL = 0,
  parameter USE_BUFG = 0,
  parameter IO_DELAY_GROUP = "dev_if_delay_group"
) (

  // device interface
  input                   rx_dclk_in_n_NC,
  input                   rx_dclk_in_p_dclk_in,
  input                   rx_idata_in_n_idata0,
  input                   rx_idata_in_p_idata1,
  input                   rx_qdata_in_n_qdata2,
  input                   rx_qdata_in_p_qdata3,
  input                   rx_strobe_in_n_NC,
  input                   rx_strobe_in_p_strobe_in,

  // internal reset and clocks
  input                   adc_rst,
  output                  adc_clk,
  output                  adc_clk_div,
  output                  adc_enable,
  output      [7:0]       adc_data_0,
  output      [7:0]       adc_data_1,
  output      [7:0]       adc_data_2,
  output      [7:0]       adc_data_3,
  output      [7:0]       adc_data_strobe,
  output                  adc_valid,

  output     [31:0]       adc_clk_ratio,

  // delay interface (for IDELAY macros)
  input                             up_clk,
  input   [NUM_LANES-1:0]           up_adc_dld,
  input   [DRP_WIDTH*NUM_LANES-1:0] up_adc_dwdata,
  output  [DRP_WIDTH*NUM_LANES-1:0] up_adc_drdata,
  input                   delay_clk,
  input                   delay_rst,
  output                  delay_locked,

  input                   mssi_sync,
  output                  ssi_sync_out,
  input                   ssi_sync_in,
  output                  ssi_rst
);

  reg [3:0] valid_gen;

  wire [4:0] gpio_in;
  wire [39:0] deser_out;
  wire rx_enable;
  wire rx_clk;
  wire rx_clk_div;

  assign adc_clk_div = rx_clk_div;
  assign adc_clk = rx_clk;
  assign adc_enable = rx_enable;
  assign adc_valid = valid_gen[3];
  assign {adc_data_strobe,
          adc_data_3,
          adc_data_2,
          adc_data_1,
          adc_data_0} = deser_out;

  generate
  // LVDS
  if (CMOS_LVDS_N == 0) begin
    // ALTPLL
    altera_pll #(
      .fractional_vco_multiplier("false"),
      .reference_clock_frequency("157.2864 MHz"),
      .operation_mode("lvds"),
      .number_of_clocks(3),
      .output_clock_frequency0("314.572800 MHz"),
      .phase_shift0("1589 ps"),
      .duty_cycle0(50),
      .output_clock_frequency1("39.321600 MHz"),
      .phase_shift1("19073 ps"),
      .duty_cycle1(13),
      .output_clock_frequency2("39.321600 MHz"),
      .phase_shift2("23842 ps"),
      .duty_cycle2(50),
      .output_clock_frequency3("0 MHz"),
      .phase_shift3("0 ps"),
      .duty_cycle3(50),
      .output_clock_frequency4("0 MHz"),
      .phase_shift4("0 ps"),
      .duty_cycle4(50),
      .output_clock_frequency5("0 MHz"),
      .phase_shift5("0 ps"),
      .duty_cycle5(50),
      .output_clock_frequency6("0 MHz"),
      .phase_shift6("0 ps"),
      .duty_cycle6(50),
      .output_clock_frequency7("0 MHz"),
      .phase_shift7("0 ps"),
      .duty_cycle7(50),
      .output_clock_frequency8("0 MHz"),
      .phase_shift8("0 ps"),
      .duty_cycle8(50),
      .output_clock_frequency9("0 MHz"),
      .phase_shift9("0 ps"),
      .duty_cycle9(50),
      .output_clock_frequency10("0 MHz"),
      .phase_shift10("0 ps"),
      .duty_cycle10(50),
      .output_clock_frequency11("0 MHz"),
      .phase_shift11("0 ps"),
      .duty_cycle11(50),
      .output_clock_frequency12("0 MHz"),
      .phase_shift12("0 ps"),
      .duty_cycle12(50),
      .output_clock_frequency13("0 MHz"),
      .phase_shift13("0 ps"),
      .duty_cycle13(50),
      .output_clock_frequency14("0 MHz"),
      .phase_shift14("0 ps"),
      .duty_cycle14(50),
      .output_clock_frequency15("0 MHz"),
      .phase_shift15("0 ps"),
      .duty_cycle15(50),
      .output_clock_frequency16("0 MHz"),
      .phase_shift16("0 ps"),
      .duty_cycle16(50),
      .output_clock_frequency17("0 MHz"),
      .phase_shift17("0 ps"),
      .duty_cycle17(50),
      .pll_type("General"),
      .pll_subtype("General")
    ) altera_pll_i (
      .rst	(delay_rst),
      .outclk ({rx_clk_div, rx_enable, rx_clk}),
      .locked (delay_locked),
      .fboutclk ( ),
      .fbclk (1'b0),
      .refclk (rx_dclk_in_p_dclk_in)
    );
    // Adc valid output:
    always @(posedge rx_clk_div) begin
      if (adc_rst) begin
        valid_gen <= 4'b0000;
      end else begin
        valid_gen <= 4'b1111;
      end
    end
    // ALTLVDS_RX
    genvar i;
    for (i = 0; i <= 2; i = i + 1) begin: g_ddr_i
      reg  [7:0] shift_reg = 8'b0;
      wire [7:0] gpio_out;
      altlvds_rx	ALTLVDS_RX_component (
        .rx_enable (rx_enable),
        .rx_in (gpio_in[i]),
        .rx_inclock (rx_clk),
        .rx_out (gpio_out),
        .dpa_pll_cal_busy (),
        .dpa_pll_recal (1'b0),
        .pll_areset (1'b0),
        .pll_phasecounterselect (),
        .pll_phasedone (1'b1),
        .pll_phasestep (),
        .pll_phaseupdown (),
        .pll_scanclk (),
        .rx_cda_max (),
        .rx_cda_reset (1'b0),
        .rx_channel_data_align (1'b0),
        .rx_coreclk (1'b1),
        .rx_data_align (1'b0),
        .rx_data_align_reset (1'b0),
        .rx_data_reset (1'b0),
        .rx_deskew (1'b0),
        .rx_divfwdclk (),
        .rx_dpa_lock_reset (1'b0),
        .rx_dpa_locked (),
        .rx_dpaclock (1'b0),
        .rx_dpll_enable (1'b1),
        .rx_dpll_hold (1'b0),
        .rx_dpll_reset (1'b0),
        .rx_fifo_reset (1'b0),
        .rx_locked (),
        .rx_outclock (),
        .rx_pll_enable (1'b1),
        .rx_readclock (1'b0),
        .rx_reset (1'b0),
        .rx_syncclock (1'b0));
      defparam
        ALTLVDS_RX_component.buffer_implementation = "RAM",
        ALTLVDS_RX_component.cds_mode = "UNUSED",
        ALTLVDS_RX_component.common_rx_tx_pll = "OFF",
        ALTLVDS_RX_component.data_align_rollover = 4,
        ALTLVDS_RX_component.data_rate = "800.0 Mbps",
        ALTLVDS_RX_component.deserialization_factor = 8,
        ALTLVDS_RX_component.dpa_initial_phase_value = 0,
        ALTLVDS_RX_component.dpll_lock_count = 0,
        ALTLVDS_RX_component.dpll_lock_window = 0,
        ALTLVDS_RX_component.enable_clock_pin_mode = "UNUSED",
        ALTLVDS_RX_component.enable_dpa_align_to_rising_edge_only = "OFF",
        ALTLVDS_RX_component.enable_dpa_calibration = "ON",
        ALTLVDS_RX_component.enable_dpa_fifo = "UNUSED",
        ALTLVDS_RX_component.enable_dpa_initial_phase_selection = "OFF",
        ALTLVDS_RX_component.enable_dpa_mode = "OFF",
        ALTLVDS_RX_component.enable_dpa_pll_calibration = "OFF",
        ALTLVDS_RX_component.enable_soft_cdr_mode = "OFF",
        ALTLVDS_RX_component.implement_in_les = "OFF",
        ALTLVDS_RX_component.inclock_boost = 0,
        ALTLVDS_RX_component.inclock_data_alignment = "EDGE_ALIGNED",
        ALTLVDS_RX_component.inclock_period = 50000,
        ALTLVDS_RX_component.inclock_phase_shift = 0,
        ALTLVDS_RX_component.input_data_rate = 800,
        ALTLVDS_RX_component.intended_device_family = "Cyclone V",
        ALTLVDS_RX_component.lose_lock_on_one_change = "UNUSED",
        ALTLVDS_RX_component.lpm_hint = "CBX_MODULE_PREFIX=lvds_x8_rx",
        ALTLVDS_RX_component.lpm_type = "altlvds_rx",
        ALTLVDS_RX_component.lvds_rx_reg_setting = "ON",
        ALTLVDS_RX_component.number_of_channels = 1,
        ALTLVDS_RX_component.outclock_resource = "Dual-Regional clock",
        ALTLVDS_RX_component.pll_operation_mode = "NORMAL",
        ALTLVDS_RX_component.pll_self_reset_on_loss_lock = "UNUSED",
        ALTLVDS_RX_component.port_rx_channel_data_align = "PORT_UNUSED",
        ALTLVDS_RX_component.port_rx_data_align = "PORT_UNUSED",
        ALTLVDS_RX_component.refclk_frequency = "20.000000 MHz",
        ALTLVDS_RX_component.registered_data_align_input = "UNUSED",
        ALTLVDS_RX_component.registered_output = "OFF",
        ALTLVDS_RX_component.reset_fifo_at_first_lock = "UNUSED",
        ALTLVDS_RX_component.rx_align_data_reg = "RISING_EDGE",
        ALTLVDS_RX_component.sim_dpa_is_negative_ppm_drift = "OFF",
        ALTLVDS_RX_component.sim_dpa_net_ppm_variation = 0,
        ALTLVDS_RX_component.sim_dpa_output_clock_phase_shift = 0,
        ALTLVDS_RX_component.use_coreclock_input = "OFF",
        ALTLVDS_RX_component.use_dpll_rawperror = "OFF",
        ALTLVDS_RX_component.use_external_pll = "ON",
        ALTLVDS_RX_component.use_no_phase_shift = "ON",
        ALTLVDS_RX_component.x_on_bitslip = "ON",
        ALTLVDS_RX_component.clk_src_is_pll = "off";
      // Temporal ordering:
      //   MSB - oldest received bit;
      //   LSB - newest received bit;
      always @(posedge rx_clk_div) begin
        shift_reg <= gpio_out;
      end
      // Connect adc_data_strobe
      if (i == 2) begin
        assign deser_out[4*8+:8] = shift_reg;
      end
      // Connect adc_data
      else begin
        assign deser_out[i*8+:8] = shift_reg;
      end
    end
    // Wire connect:
    assign deser_out[31:24] = 8'b0;
    assign deser_out[23:16] = 8'b0;
    assign gpio_in[4] = 1'b0;
    assign gpio_in[3] = 1'b0;
    assign gpio_in[2] = rx_strobe_in_p_strobe_in;
    assign gpio_in[1] = rx_qdata_in_p_qdata3;
    assign gpio_in[0] = rx_idata_in_p_idata1;
    assign adc_clk_ratio = 4;
  end
  // CMOS
  else begin
    assign rx_clk_div = rx_dclk_in_p_dclk_in;
    assign rx_clk = 1'b0;
    assign rx_enable = 1'b0;
    always @(posedge rx_clk_div) begin
      if (adc_rst) begin
        valid_gen <= 4'b0001;
      end else begin
        valid_gen <= {valid_gen[2:0],valid_gen[3]};
      end
    end

    genvar i;
    for (i = 0; i <= 4; i = i + 1) begin: g_ddr_i
      reg [7:0] shift_reg = 8'b0;
      wire [1:0] gpio_out;
      altddio_in ALTDDIO_IN_component (
        .datain (gpio_in[i]),
        .inclock (rx_clk_div),
        .dataout_h (gpio_out[1]),
        .dataout_l (gpio_out[0]),
        .aclr (1'b0),
        .aset (1'b0),
        .inclocken (1'b1),
        .sclr (1'b0),
        .sset (1'b0));
      defparam
        ALTDDIO_IN_component.intended_device_family = "Cyclone V",
        ALTDDIO_IN_component.invert_input_clocks = "OFF",
        ALTDDIO_IN_component.lpm_hint = "UNUSED",
        ALTDDIO_IN_component.lpm_type = "altddio_in",
        ALTDDIO_IN_component.power_up_high = "OFF",
        ALTDDIO_IN_component.width = 1;

      // Temporal ordering:
      //   MSB - oldest received bit;
      //   LSB - newest received bit;
      always @(posedge rx_clk_div) begin
        shift_reg <= {shift_reg[5:0],gpio_out[0],gpio_out[1]};
      end
      assign deser_out[i*8+:8] = shift_reg;
    end
    assign gpio_in[4] = rx_strobe_in_p_strobe_in;
    assign gpio_in[3] = rx_qdata_in_p_qdata3;
    assign gpio_in[2] = rx_qdata_in_n_qdata2;
    assign gpio_in[1] = rx_idata_in_p_idata1;
    assign gpio_in[0] = rx_idata_in_n_idata0;
    assign delay_locked = 'b0;
    assign adc_clk_ratio = 1;
  end
  endgenerate

  // Drive unused signals
  assign up_adc_drdata = 'b0;
  assign ssi_sync_out = 'b0;
  assign ssi_rst = 'b0;

endmodule
