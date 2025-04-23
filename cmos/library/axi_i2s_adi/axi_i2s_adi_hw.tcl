

package require qsys

source ../../scripts/adi_env.tcl
source ../scripts/adi_ip_intel.tcl

set_module_property NAME axi_i2s_adi
set_module_property DESCRIPTION "AXI I2S Controller"
set_module_property VERSION 1.0
set_module_property GROUP "Analog Devices"
set_module_property DISPLAY_NAME axi_i2s_adi
set_module_property ELABORATION_CALLBACK axi_i2s_adi_elaborate
#set_module_property VALIDATION_CALLBACK info_param_validate

# files

add_fileset quartus_synth QUARTUS_SYNTH "" "Quartus Synthesis"
set_fileset_property quartus_synth TOP_LEVEL axi_i2s_adi
add_fileset_file axi_ctrlif.vhd                VHDL PATH $ad_hdl_dir/library/common/axi_ctrlif.vhd
add_fileset_file axi_streaming_dma_tx_fifo.vhd VHDL PATH $ad_hdl_dir/library/common/axi_streaming_dma_tx_fifo.vhd
add_fileset_file axi_streaming_dma_rx_fifo.vhd VHDL PATH $ad_hdl_dir/library/common/axi_streaming_dma_rx_fifo.vhd
add_fileset_file pl330_dma_fifo.vhd            VHDL PATH $ad_hdl_dir/library/common/pl330_dma_fifo.vhd
add_fileset_file dma_fifo.vhd                  VHDL PATH $ad_hdl_dir/library/common/dma_fifo.vhd
add_fileset_file i2s_controller.vhd            VHDL PATH i2s_controller.vhd
add_fileset_file i2s_rx.vhd                    VHDL PATH i2s_rx.vhd
add_fileset_file i2s_tx.vhd                    VHDL PATH i2s_tx.vhd
add_fileset_file i2s_clkgen.vhd                VHDL PATH i2s_clkgen.vhd
add_fileset_file fifo_synchronizer.vhd         VHDL PATH fifo_synchronizer.vhd
add_fileset_file axi_i2s_adi.vhd               VHDL PATH axi_i2s_adi.vhd
add_fileset_file axi_i2s_adi_constr.sdc        SDC  PATH axi_i2s_adi_constr.sdc

# parameters

add_parameter SLOT_WIDTH INTEGER 24
set_parameter_property SLOT_WIDTH DEFAULT_VALUE 24
set_parameter_property SLOT_WIDTH DISPLAY_NAME SLOT_WIDTH
set_parameter_property SLOT_WIDTH TYPE INTEGER
set_parameter_property SLOT_WIDTH UNITS None
set_parameter_property SLOT_WIDTH HDL_PARAMETER true
add_parameter LRCLK_POL INTEGER 0
set_parameter_property LRCLK_POL DEFAULT_VALUE 0
set_parameter_property LRCLK_POL DISPLAY_NAME LRCLK_POL
set_parameter_property LRCLK_POL TYPE INTEGER
set_parameter_property LRCLK_POL UNITS None
set_parameter_property LRCLK_POL HDL_PARAMETER true
add_parameter BCLK_POL INTEGER 0
set_parameter_property BCLK_POL DEFAULT_VALUE 0
set_parameter_property BCLK_POL DISPLAY_NAME BCLK_POL
set_parameter_property BCLK_POL TYPE INTEGER
set_parameter_property BCLK_POL UNITS None
set_parameter_property BCLK_POL HDL_PARAMETER true
add_parameter S_AXI_DATA_WIDTH INTEGER 32
set_parameter_property S_AXI_DATA_WIDTH DEFAULT_VALUE 32
set_parameter_property S_AXI_DATA_WIDTH DISPLAY_NAME S_AXI_DATA_WIDTH
set_parameter_property S_AXI_DATA_WIDTH TYPE INTEGER
set_parameter_property S_AXI_DATA_WIDTH UNITS None
set_parameter_property S_AXI_DATA_WIDTH HDL_PARAMETER true
add_parameter S_AXI_ADDRESS_WIDTH INTEGER 32
set_parameter_property S_AXI_ADDRESS_WIDTH DEFAULT_VALUE 16
set_parameter_property S_AXI_ADDRESS_WIDTH DISPLAY_NAME S_AXI_ADDRESS_WIDTH
set_parameter_property S_AXI_ADDRESS_WIDTH TYPE INTEGER
set_parameter_property S_AXI_ADDRESS_WIDTH UNITS None
set_parameter_property S_AXI_ADDRESS_WIDTH HDL_PARAMETER true
add_parameter DEVICE_FAMILY STRING "Cyclone V"
set_parameter_property DEVICE_FAMILY DEFAULT_VALUE "Cyclone V"
set_parameter_property DEVICE_FAMILY DISPLAY_NAME DEVICE_FAMILY
set_parameter_property DEVICE_FAMILY TYPE STRING
set_parameter_property DEVICE_FAMILY ENABLED false
set_parameter_property DEVICE_FAMILY UNITS None
set_parameter_property DEVICE_FAMILY HDL_PARAMETER true
add_parameter DMA_TYPE INTEGER 0
set_parameter_property DMA_TYPE DEFAULT_VALUE 0
set_parameter_property DMA_TYPE DISPLAY_NAME DMA_TYPE
set_parameter_property DMA_TYPE TYPE INTEGER
set_parameter_property DMA_TYPE UNITS None
set_parameter_property DMA_TYPE HDL_PARAMETER true
add_parameter NUM_OF_CHANNEL INTEGER 1
set_parameter_property NUM_OF_CHANNEL DEFAULT_VALUE 1
set_parameter_property NUM_OF_CHANNEL DISPLAY_NAME NUM_OF_CHANNEL
set_parameter_property NUM_OF_CHANNEL TYPE INTEGER
set_parameter_property NUM_OF_CHANNEL UNITS None
set_parameter_property NUM_OF_CHANNEL HDL_PARAMETER true
add_parameter HAS_TX INTEGER 1
set_parameter_property HAS_TX DEFAULT_VALUE 1
set_parameter_property HAS_TX DISPLAY_NAME HAS_TX
set_parameter_property HAS_TX TYPE INTEGER
set_parameter_property HAS_TX UNITS None
set_parameter_property HAS_TX HDL_PARAMETER true
add_parameter HAS_RX INTEGER 1
set_parameter_property HAS_RX DEFAULT_VALUE 1
set_parameter_property HAS_RX DISPLAY_NAME HAS_RX
set_parameter_property HAS_RX TYPE INTEGER
set_parameter_property HAS_RX UNITS None
set_parameter_property HAS_RX HDL_PARAMETER true

# interfaces

ad_ip_intf_s_axi s_axi_aclk s_axi_aresetn

# connection point i2s
add_interface i2s conduit end
add_interface_port i2s sdata_i sdata_i Input NUM_OF_CHANNEL
add_interface_port i2s sdata_o sdata_o Output NUM_OF_CHANNEL
add_interface_port i2s bclk_o bclk_o Output NUM_OF_CHANNEL
add_interface_port i2s lrclk_o lrclk_o Output NUM_OF_CHANNEL
set_interface_property i2s associatedClock if_data_clk_i
set_interface_property i2s associatedReset s_axi_aresetn
ad_interface clock data_clk_i input 1

# updates

proc axi_i2s_adi_elaborate {} {
  set m_dma_type [get_parameter_value "DMA_TYPE"]
  set m_has_tx [get_parameter_value "HAS_TX"]
  set m_has_rx [get_parameter_value "HAS_RX"]
  if {$m_dma_type == 0} {
    if {$m_has_tx == 1} {
      # connection point m_axis
      add_interface m_axis axi4stream start
      add_interface_port m_axis m_axis_tdata tdata Output 32
#     add_interface_port m_axis m_axis_tkeep tkeep Output 4
#     add_interface_port m_axis m_axis_tlast tlast Output 1
      add_interface_port m_axis m_axis_tready tready Input 1
      add_interface_port m_axis m_axis_tvalid tvalid Output 1
      set_interface_property m_axis associatedClock if_m_axis_aclk
      set_interface_property m_axis associatedReset if_s_axis_aresetn
      ad_interface clock m_axis_aclk input 1
    }
    if {$m_has_rx == 1} {
      # connection point s_axis
      add_interface s_axis axi4stream end
      add_interface_port s_axis s_axis_tdata tdata Input 32
#     add_interface_port s_axis s_axis_tlast tlast Input 1
      add_interface_port s_axis s_axis_tready tready Output 1
      add_interface_port s_axis s_axis_tvalid tvalid Input 1
      set_interface_property s_axis associatedClock if_s_axis_aclk
      set_interface_property s_axis associatedReset if_s_axis_aresetn
      ad_interface clock s_axis_aclk input 1
    }
    # connection point s_axis_aresetn
    ad_interface reset s_axis_aresetn input 1 if_s_axis_aclk
  } else {
    if {$m_has_tx == 1} {
      # connection point dma_req_tx
      add_interface dma_req_tx conduit end
      add_interface_port dma_req_tx dma_req_tx_daready daready Output 1
      add_interface_port dma_req_tx dma_req_tx_datype datype Input 2
      add_interface_port dma_req_tx dma_req_tx_davalid davalid Input 1
      add_interface_port dma_req_tx dma_req_tx_drlast dlast Output 1
      add_interface_port dma_req_tx dma_req_tx_drready drready Input 1
      add_interface_port dma_req_tx dma_req_tx_drtype drtype Output 2
      add_interface_port dma_req_tx dma_req_tx_drvalid drvalid Output 1
      set_interface_property dma_req_tx associatedClock if_dma_req_tx_aclk
      set_interface_property dma_req_tx associatedReset if_dma_req_tx_rstn
      ad_interface reset dma_req_tx_rstn input 1 if_dma_req_tx_aclk
      ad_interface clock dma_req_tx_aclk input 1
    }
    if {$m_has_rx == 1} {
      # connection point dma_req_rx
      add_interface dma_req_rx conduit end
      add_interface_port dma_req_rx dma_req_rx_daready daready Output 1
      add_interface_port dma_req_rx dma_req_rx_datype datype Input 2
      add_interface_port dma_req_rx dma_req_rx_davalid davalid Input 1
      add_interface_port dma_req_rx dma_req_rx_drlast drlast Output 1
      add_interface_port dma_req_rx dma_req_rx_drready drready Input 1
      add_interface_port dma_req_rx dma_req_rx_drtype drtype Output 2
      add_interface_port dma_req_rx dma_req_rx_drvalid drvalid Output 1
      set_interface_property dma_req_rx associatedClock if_dma_req_rx_aclk
      set_interface_property dma_req_rx associatedReset if_dma_req_rx_rstn
      ad_interface reset dma_req_rx_rstn input 1 if_dma_req_rx_aclk
      ad_interface clock dma_req_rx_aclk input 1
    }
  }
}
