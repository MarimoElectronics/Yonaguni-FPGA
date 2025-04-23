// ***************************************************************************
// ***************************************************************************
// Copyright (C) 2014-2023 Analog Devices, Inc. All rights reserved.
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
//      https://github.com/analogdevicesinc/hdl/blob/main/LICENSE_ADIBSD
//      This will allow to generate bit files and not release the source code,
//      as long as it attaches to an ADI device.
//
// ***************************************************************************
// ***************************************************************************

`timescale 1ns/100ps

module adrv9001_tx #(
  parameter CMOS_LVDS_N = 0,
  parameter NUM_LANES = 4,
  parameter FPGA_TECHNOLOGY = 0,
  parameter USE_BUFG = 0,
  parameter USE_RX_CLK_FOR_TX = 0
) (
  input                   ref_clk,
  input                   up_clk,

  input                   mssi_sync,
  input                   tx_output_enable,

  // physical interface (transmit)
  output                  tx_dclk_out_n_NC,
  output                  tx_dclk_out_p_dclk_out,
  input                   tx_dclk_in_n_NC,
  input                   tx_dclk_in_p_dclk_in,
  output                  tx_idata_out_n_idata0,
  output                  tx_idata_out_p_idata1,
  output                  tx_qdata_out_n_qdata2,
  output                  tx_qdata_out_p_qdata3,
  output                  tx_strobe_out_n_NC,
  output                  tx_strobe_out_p_strobe_out,

  input                   rx_clk_div,
  input                   rx_clk,
  input                   rx_enable,
  input                   rx_ssi_rst,

  // internal resets and clocks

  output     [31:0]       dac_clk_ratio,

  input                   dac_rst,
  output                  dac_clk_div,

  input       [7:0]       dac_data_0,
  input       [7:0]       dac_data_1,
  input       [7:0]       dac_data_2,
  input       [7:0]       dac_data_3,
  input       [7:0]       dac_data_strb,
  input       [7:0]       dac_data_clk,
  input                   dac_data_valid
);

  wire [6*8-1:0] serdes_in;
  wire [5:0] gpio_out;
  wire tx_clk;

  generate
  // LVDS
  if (CMOS_LVDS_N == 0) begin
    genvar i;
    for (i = 0; i <= 3; i = i + 1) begin: g_ddr_o
      reg  [7:0] shift_reg = 8'b0;
      wire [7:0] gpio_in;
      assign tx_clk = rx_clk_div;
      altlvds_tx	ALTLVDS_TX_component (
        .tx_enable (rx_enable),
        .tx_in (gpio_in),
        .tx_inclock (rx_clk),
        .tx_out (gpio_out[i]),
        .pll_areset (1'b0),
        .sync_inclock (1'b0),
        .tx_coreclock (),
        .tx_data_reset (1'b0),
        .tx_locked (),
        .tx_outclock (),
        .tx_pll_enable (1'b1),
        .tx_syncclock (1'b0));
      defparam
        ALTLVDS_TX_component.center_align_msb = "UNUSED",
        ALTLVDS_TX_component.common_rx_tx_pll = "OFF",
        ALTLVDS_TX_component.coreclock_divide_by = 1,
        ALTLVDS_TX_component.data_rate = "800.0 Mbps",
        ALTLVDS_TX_component.deserialization_factor = 8,
        ALTLVDS_TX_component.differential_drive = 0,
        ALTLVDS_TX_component.enable_clock_pin_mode = "UNUSED",
        ALTLVDS_TX_component.implement_in_les = "OFF",
        ALTLVDS_TX_component.inclock_boost = 0,
        ALTLVDS_TX_component.inclock_data_alignment = "EDGE_ALIGNED",
        ALTLVDS_TX_component.inclock_period = 50000,
        ALTLVDS_TX_component.inclock_phase_shift = 0,
        ALTLVDS_TX_component.intended_device_family = "Cyclone V",
        ALTLVDS_TX_component.lpm_hint = "CBX_MODULE_PREFIX=lvds_x8_tx",
        ALTLVDS_TX_component.lpm_type = "altlvds_tx",
        ALTLVDS_TX_component.multi_clock = "OFF",
        ALTLVDS_TX_component.number_of_channels = 1,
        ALTLVDS_TX_component.outclock_alignment = "EDGE_ALIGNED",
        ALTLVDS_TX_component.outclock_divide_by = 1,
        ALTLVDS_TX_component.outclock_duty_cycle = 50,
        ALTLVDS_TX_component.outclock_multiply_by = 1,
        ALTLVDS_TX_component.outclock_phase_shift = 0,
        ALTLVDS_TX_component.outclock_resource = "Dual-Regional clock",
        ALTLVDS_TX_component.output_data_rate = 800,
        ALTLVDS_TX_component.pll_compensation_mode = "AUTO",
        ALTLVDS_TX_component.pll_self_reset_on_loss_lock = "OFF",
        ALTLVDS_TX_component.preemphasis_setting = 0,
        ALTLVDS_TX_component.refclk_frequency = "20.000000 MHz",
        ALTLVDS_TX_component.registered_input = "OFF",
        ALTLVDS_TX_component.use_external_pll = "ON",
        ALTLVDS_TX_component.use_no_phase_shift = "ON",
        ALTLVDS_TX_component.vod_setting = 0,
        ALTLVDS_TX_component.clk_src_is_pll = "off";

      always @(posedge tx_clk) begin
        shift_reg <= serdes_in[i*8+:8];
      end
      assign gpio_in = shift_reg;
    end
    // Order of transmission:
    // gpio_in[0] - first
    // gpio_in[1] - last
    assign serdes_in[47:40] = 8'b00000000;
    assign serdes_in[39:32] = 8'b00000000;
    assign serdes_in[31:24] = dac_data_clk;
    assign serdes_in[23:16] = dac_data_strb;
    assign serdes_in[15: 8] = dac_data_1;
    assign serdes_in[ 7: 0] = dac_data_0;
    assign tx_dclk_out_p_dclk_out     = gpio_out[3];
    assign tx_strobe_out_p_strobe_out = gpio_out[2];
    assign tx_qdata_out_p_qdata3      = gpio_out[1];
    assign tx_idata_out_p_idata1      = gpio_out[0];
    assign dac_clk_ratio = 4;
  end
  // CMOS
  else begin
    assign tx_clk = tx_dclk_in_p_dclk_in;
    genvar i;
    for (i = 0; i <= 5; i = i + 1) begin: g_ddr_o
      reg [7:0] shift_reg = 8'b0;
      wire [1:0] gpio_in;
      altddio_out ALTDDIO_OUT_component (
        .datain_h (gpio_in[1]),
        .datain_l (gpio_in[0]),
        .outclock (tx_clk),
        .dataout (gpio_out[i]),
        .aclr (1'b0),
        .aset (1'b0),
        .oe (1'b1),
        .oe_out (),
        .outclocken (1'b1),
        .sclr (1'b0),
        .sset (1'b0));
      defparam
        ALTDDIO_OUT_component.extend_oe_disable = "OFF",
        ALTDDIO_OUT_component.intended_device_family = "Cyclone V",
        ALTDDIO_OUT_component.invert_output = "OFF",
        ALTDDIO_OUT_component.lpm_hint = "UNUSED",
        ALTDDIO_OUT_component.lpm_type = "altddio_out",
        ALTDDIO_OUT_component.oe_reg = "UNREGISTERED",
        ALTDDIO_OUT_component.power_up_high = "OFF",
        ALTDDIO_OUT_component.width = 1;

      always @(posedge tx_clk) begin
        if (dac_data_valid) begin
          shift_reg <= serdes_in[i*8+:8];
        end else begin
          shift_reg <= {shift_reg[5:0],2'b0};
        end
      end
      // Order of transmission:
      // gpio_in[0] - first
      // gpio_in[1] - last
      assign gpio_in = {shift_reg[6],shift_reg[7]};
    end
    assign serdes_in[47:40] = dac_data_clk;
    assign serdes_in[39:32] = dac_data_strb;
    assign serdes_in[31:24] = dac_data_3;
    assign serdes_in[23:16] = dac_data_2;
    assign serdes_in[15: 8] = dac_data_1;
    assign serdes_in[ 7: 0] = dac_data_0;
    assign tx_dclk_out_p_dclk_out     = gpio_out[5];
    assign tx_strobe_out_p_strobe_out = gpio_out[4];
    assign tx_qdata_out_p_qdata3      = gpio_out[3];
    assign tx_qdata_out_n_qdata2      = gpio_out[2];
    assign tx_idata_out_p_idata1      = gpio_out[1];
    assign tx_idata_out_n_idata0      = gpio_out[0];
    assign dac_clk_ratio = 1;
  end
  endgenerate

  // No clock divider, qualifier used instead
  assign dac_clk_div = tx_clk;

endmodule
