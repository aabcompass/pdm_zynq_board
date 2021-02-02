#set_property MARK_DEBUG true [get_nets {design_1_i/axi_data_provider_0_ec_sig_out[0]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_data_provider_0_ec_sig_out[1]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_data_provider_0_ec_sig_out[2]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_data_provider_0_ec_sig_out[3]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_data_provider_0_ec_sig_out[4]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_data_provider_0_ec_sig_out[5]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_data_provider_0_ec_sig_out[6]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_data_provider_0_ec_sig_out[7]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_data_provider_0_ec_sig_out[8]}]
#set_property MARK_DEBUG true [get_nets design_1_i/axi_data_provider_0_gtu_sig]

#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[16]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[15]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[12]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[11]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[10]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[9]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[7]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[1]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[0]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[13]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[4]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[2]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[6]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[3]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[5]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[14]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[17]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[8]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/ec_release_sig[7]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/ec_release_sig[6]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/ec_release_sig[5]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/ec_release_sig[3]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/ec_release_sig[2]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/ec_release_sig[1]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/ec_release_sig[0]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/ec_release_sig[8]}]
#set_property MARK_DEBUG true [get_nets {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/ec_release_sig[4]}]
#set_property MARK_DEBUG true [get_nets design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/transformer_boost]


#set_property MARK_DEBUG true [get_nets design_1_i/axi_cathode_ctrl_0/U0/CLK_HV]
#set_property MARK_DEBUG true [get_nets design_1_i/axi_cathode_ctrl_0/U0/DATA_HV]
#set_property MARK_DEBUG true [get_nets design_1_i/axi_cathode_ctrl_0/U0/GTU_HV]
#create_debug_core u_ila_0 ila
#set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
#set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
#set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
#set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
#set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
#set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
#set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
#set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
#set_property port_width 1 [get_debug_ports u_ila_0/clk]
#connect_debug_port u_ila_0/clk [get_nets [list design_1_i/processing_system7_0/inst/FCLK_CLK1]]
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
#set_property port_width 9 [get_debug_ports u_ila_0/probe0]
#connect_debug_port u_ila_0/probe0 [get_nets [list {design_1_i/axi_data_provider_0_ec_sig_out[0]} {design_1_i/axi_data_provider_0_ec_sig_out[1]} {design_1_i/axi_data_provider_0_ec_sig_out[2]} {design_1_i/axi_data_provider_0_ec_sig_out[3]} {design_1_i/axi_data_provider_0_ec_sig_out[4]} {design_1_i/axi_data_provider_0_ec_sig_out[5]} {design_1_i/axi_data_provider_0_ec_sig_out[6]} {design_1_i/axi_data_provider_0_ec_sig_out[7]} {design_1_i/axi_data_provider_0_ec_sig_out[8]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
#set_property port_width 18 [get_debug_ports u_ila_0/probe1]
#connect_debug_port u_ila_0/probe1 [get_nets [list {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[0]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[1]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[2]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[3]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[4]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[5]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[6]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[7]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[8]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[9]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[10]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[11]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[12]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[13]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[14]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[15]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[16]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/cathode_voltage[17]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
#set_property port_width 9 [get_debug_ports u_ila_0/probe2]
#connect_debug_port u_ila_0/probe2 [get_nets [list {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/ec_release_sig[0]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/ec_release_sig[1]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/ec_release_sig[2]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/ec_release_sig[3]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/ec_release_sig[4]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/ec_release_sig[5]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/ec_release_sig[6]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/ec_release_sig[7]} {design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/ec_release_sig[8]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
#set_property port_width 1 [get_debug_ports u_ila_0/probe3]
#connect_debug_port u_ila_0/probe3 [get_nets [list design_1_i/axi_data_provider_0_gtu_sig]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
#set_property port_width 1 [get_debug_ports u_ila_0/probe4]
#connect_debug_port u_ila_0/probe4 [get_nets [list design_1_i/axi_cathode_ctrl_0/U0/CLK_HV]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
#set_property port_width 1 [get_debug_ports u_ila_0/probe5]
#connect_debug_port u_ila_0/probe5 [get_nets [list design_1_i/axi_cathode_ctrl_0/U0/DATA_HV]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
#set_property port_width 1 [get_debug_ports u_ila_0/probe6]
#connect_debug_port u_ila_0/probe6 [get_nets [list design_1_i/axi_cathode_ctrl_0/U0/GTU_HV]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
#set_property port_width 1 [get_debug_ports u_ila_0/probe7]
#connect_debug_port u_ila_0/probe7 [get_nets [list design_1_i/axi_cathode_ctrl_0/U0/i_ADCV/transformer_boost]]
#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets u_ila_0_FCLK_CLK1]

set_property MARK_DEBUG true [get_nets trig_out2_OBUF]
create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list design_1_i/processing_system7_0/inst/FCLK_CLK0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 1 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list trig_out2_OBUF]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_FCLK_CLK0]
