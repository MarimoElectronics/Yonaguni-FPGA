
set_false_path -from {get_registers *i2s_controller:ctrl|fifo_synchronizer:tx_sync|fifo*} -to {get_registers *i2s_controller:ctrl|fifo_synchronizer:tx_sync|out_data*}
set_false_path -from {get_registers *i2s_controller:ctrl|fifo_synchronizer:\rx_gen:rx_sync|fifo*} -to {get_registers *i2s_controller:ctrl|fifo_synchronizer:\rx_gen:rx_sync|out_data*}

set_false_path -from {get_registers *i2s_controller:ctrl|cdc_sync_stage0*} -to {get_registers *i2s_controller:ctrl|cdc_sync_stage1*}
set_false_path -from {get_registers *i2s_controller:ctrl|fifo_synchronizer:tx_sync|cdc_sync_stage0*} -to {get_registers *i2s_controller:ctrl|fifo_synchronizer:tx_sync|cdc_sync_stage1*}
set_false_path -from {get_registers *i2s_controller:ctrl|fifo_synchronizer:\rx_gen:rx_sync|cdc_sync_stage0*} -to {get_registers *i2s_controller:ctrl|fifo_synchronizer:\rx_gen:rx_sync|cdc_sync_stage1*}
set_false_path -to {get_registers *i2s_controller:ctrl|data_reset_vec*}
