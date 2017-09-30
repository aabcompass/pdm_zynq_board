connect -host localhost -port 3121
targets 2
source project_1.sdk/design_1_wrapper_hw_platform_0/ps7_init.tcl
ps7_post_config 
dow project_1.sdk/setup_ps/Debug/setup_ps.elf
con
disconnect

