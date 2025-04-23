###############################################################################
## Copyright (C) 2024-2025 Marimo Electronics, Co., Ltd. All rights reserved.
### SPDX short identifier: ADIBSD
###############################################################################

source $ad_hdl_dir/projects/scripts/adi_pd.tcl
source $ad_hdl_dir/projects/common/yonaguni/c5soc_system_qsys.tcl

if [info exists ad_project_dir] {
  source ../../common/yonaguni_qsys.tcl
} else {
  source ../common/yonaguni_qsys.tcl
}

#system ID
set_instance_parameter_value axi_sysid_0 {ROM_ADDR_BITS} {9}
set_instance_parameter_value rom_sys_0 {PATH_TO_FILE} "$mem_init_sys_file_path/mem_init_sys.txt"
set_instance_parameter_value rom_sys_0 {ROM_ADDR_BITS} {9}

sysid_gen_sys_init_file;
