# load spaciroc
set_property PACKAGE_PIN AD21 [get_ports loadb_sc_pc]
set_property PACKAGE_PIN Y20 [get_ports resetb_pc]
set_property PACKAGE_PIN AE21 [get_ports select_din_pc]
set_property PACKAGE_PIN AE20 [get_ports select_sc_probe_pc]
set_property PACKAGE_PIN V18 [get_ports sr_ck_pc]
#set_property PACKAGE_PIN W17 [get_ports sr_out_pc]
set_property PACKAGE_PIN W15 [get_ports sr_rstb_pc]
set_property IOSTANDARD LVCMOS25 [get_ports loadb_sc_pc]
set_property IOSTANDARD LVCMOS25 [get_ports select_din_pc]
set_property IOSTANDARD LVCMOS25 [get_ports resetb_pc]
set_property IOSTANDARD LVCMOS25 [get_ports select_sc_probe_pc]
set_property IOSTANDARD LVCMOS25 [get_ports sr_ck_pc]
set_property IOSTANDARD LVCMOS25 [get_ports {sr_in_pc[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {sr_in_pc[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {sr_in_pc[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {sr_in_pc[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {sr_in_pc[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {sr_in_pc[0]}]
#set_property IOSTANDARD LVCMOS25 [get_ports sr_in_pc_1]
#set_property IOSTANDARD LVCMOS25 [get_ports sr_in_pc_2]
#set_property IOSTANDARD LVCMOS25 [get_ports sr_in_pc_3]
#set_property IOSTANDARD LVCMOS25 [get_ports sr_in_pc_4]
#set_property IOSTANDARD LVCMOS25 [get_ports sr_out_pc]
set_property IOSTANDARD LVCMOS25 [get_ports sr_rstb_pc]

set_property PACKAGE_PIN AD19 [get_ports {user_led[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {user_led[0]}]

#set_property PACKAGE_PIN AC23 [get_ports artix_conf_cclk]
#set_property PACKAGE_PIN AD23 [get_ports artix_conf_data]
set_property IOSTANDARD LVCMOS25 [get_ports artx_done]
#set_property IOSTANDARD LVCMOS25 [get_ports artix_conf_cclk]
#set_property IOSTANDARD LVCMOS25 [get_ports artix_conf_data]
set_property PACKAGE_PIN W19 [get_ports artx_initb_io_tri_io]
set_property IOSTANDARD LVCMOS25 [get_ports artx_initb_io_tri_io]

set_property PACKAGE_PIN AF19 [get_ports artx_programb_io_tri_io]
set_property IOSTANDARD LVCMOS25 [get_ports artx_programb_io_tri_io]
set_property PACKAGE_PIN AC23 [get_ports artx_conf_cclk]
set_property PACKAGE_PIN AD23 [get_ports artx_conf_data]
set_property IOSTANDARD LVCMOS25 [get_ports artx_conf_cclk]
set_property IOSTANDARD LVCMOS25 [get_ports artx_conf_data]


set_property PACKAGE_PIN AC13 [get_ports clk_art_0_clk_p]
set_property PACKAGE_PIN AC12 [get_ports clk_art_1_clk_p]
set_property PACKAGE_PIN AC21 [get_ports clk_art_2_clk_p]
set_property IOSTANDARD LVDS_25 [get_ports clk_art_0_clk_p]
set_property IOSTANDARD LVDS_25 [get_ports clk_art_0_clk_n]
set_property IOSTANDARD LVDS_25 [get_ports clk_art_1_clk_p]
set_property IOSTANDARD LVDS_25 [get_ports clk_art_2_clk_p]
set_property IOSTANDARD LVDS_25 [get_ports clk_art_2_clk_n]
set_property DIFF_TERM TRUE [get_ports clk_art_0_clk_p]
set_property DIFF_TERM TRUE [get_ports clk_art_0_clk_n]
set_property DIFF_TERM TRUE [get_ports clk_art_1_clk_p]
set_property DIFF_TERM TRUE [get_ports clk_art_1_clk_n]
set_property DIFF_TERM TRUE [get_ports clk_art_2_clk_p]
set_property DIFF_TERM TRUE [get_ports clk_art_2_clk_n]



set_property PACKAGE_PIN AD14 [get_ports {data_art1[14]}]
set_property PACKAGE_PIN AC14 [get_ports {data_art1[15]}]
set_property PACKAGE_PIN AF14 [get_ports {data_art1[13]}]
set_property PACKAGE_PIN AE15 [get_ports {data_art1[12]}]
set_property PACKAGE_PIN AF15 [get_ports {data_art1[11]}]
set_property PACKAGE_PIN AD15 [get_ports {data_art1[10]}]
set_property PACKAGE_PIN AB15 [get_ports {data_art1[9]}]
set_property PACKAGE_PIN AE16 [get_ports {data_art1[8]}]
set_property PACKAGE_PIN AD16 [get_ports {data_art1[7]}]
set_property PACKAGE_PIN AC16 [get_ports {data_art1[6]}]
set_property PACKAGE_PIN AE17 [get_ports {data_art1[5]}]
set_property PACKAGE_PIN AA15 [get_ports {data_art1[4]}]
set_property PACKAGE_PIN AB16 [get_ports {data_art1[3]}]
set_property PACKAGE_PIN AC17 [get_ports {data_art1[2]}]
set_property PACKAGE_PIN AB17 [get_ports {data_art1[1]}]
set_property PACKAGE_PIN AC18 [get_ports {data_art1[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art1[15]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art1[14]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art1[13]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art1[12]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art1[11]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art1[10]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art1[9]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art1[8]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art1[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art1[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art1[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art1[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art1[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art1[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art1[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art1[0]}]

set_property IOSTANDARD LVCMOS25 [get_ports frame_art1]
set_property PACKAGE_PIN AA12 [get_ports frame_art1]


#set_property PACKAGE_PIN A8 [get_ports {L1_EVENT[0]}]
#set_property IOSTANDARD LVCMOS15 [get_ports {L1_EVENT[0]}]

#hv
set_property PACKAGE_PIN C11 [get_ports CLK_HV_p]
set_property PACKAGE_PIN G10 [get_ports GTU_HV_p]

set_property IOSTANDARD LVDS [get_ports CLK_HV_p]
set_property IOSTANDARD LVDS [get_ports DATA_HV_p]
set_property IOSTANDARD LVDS [get_ports GTU_HV_p]
set_property PACKAGE_PIN W14 [get_ports {sr_in_pc[1]}]
set_property PACKAGE_PIN AF20 [get_ports {sr_in_pc[0]}]
set_property PACKAGE_PIN AE23 [get_ports {sr_in_pc[2]}]
set_property PACKAGE_PIN AF23 [get_ports {sr_in_pc[3]}]
set_property PACKAGE_PIN AE22 [get_ports {sr_in_pc[4]}]
set_property PACKAGE_PIN AF22 [get_ports {sr_in_pc[5]}]

set_property PACKAGE_PIN V19 [get_ports artx_done]

set_property PACKAGE_PIN A15 [get_ports cs_dac_p]
set_property PACKAGE_PIN A13 [get_ports cs_exp_p]
set_property PACKAGE_PIN C14 [get_ports sck_p]
set_property PACKAGE_PIN D13 [get_ports mosi_p]
set_property PACKAGE_PIN E10 [get_ports miso_p]
set_property PACKAGE_PIN E11 [get_ports intr_p]
set_property IOSTANDARD LVDS [get_ports cs_dac_p]
set_property IOSTANDARD LVDS [get_ports cs_exp_p]
set_property IOSTANDARD LVDS [get_ports intr_p]
set_property IOSTANDARD LVDS [get_ports miso_p]
set_property IOSTANDARD LVDS [get_ports mosi_p]
set_property IOSTANDARD LVDS [get_ports sck_p]



set_property PACKAGE_PIN F12 [get_ports DATA_HV_p]

set_property DIFF_TERM TRUE [get_ports intr_p]
set_property DIFF_TERM TRUE [get_ports intr_n]
set_property DIFF_TERM TRUE [get_ports miso_p]
set_property DIFF_TERM TRUE [get_ports miso_n]




set_property PACKAGE_PIN AA25 [get_ports {data_art0[0]}]
set_property PACKAGE_PIN AB26 [get_ports {data_art0[1]}]
set_property PACKAGE_PIN AA24 [get_ports {data_art0[2]}]
set_property PACKAGE_PIN AB25 [get_ports {data_art0[3]}]
set_property PACKAGE_PIN AA23 [get_ports {data_art0[4]}]
set_property PACKAGE_PIN AB24 [get_ports {data_art0[5]}]
set_property PACKAGE_PIN AA22 [get_ports {data_art0[6]}]
set_property PACKAGE_PIN AB22 [get_ports {data_art0[7]}]
set_property PACKAGE_PIN AA20 [get_ports {data_art0[8]}]
set_property PACKAGE_PIN AB21 [get_ports {data_art0[9]}]
set_property PACKAGE_PIN AA19 [get_ports {data_art0[10]}]
set_property PACKAGE_PIN AB20 [get_ports {data_art0[11]}]
set_property PACKAGE_PIN AB19 [get_ports {data_art0[12]}]
set_property PACKAGE_PIN AA17 [get_ports {data_art0[13]}]
set_property PACKAGE_PIN AC19 [get_ports {data_art0[14]}]
set_property PACKAGE_PIN AD20 [get_ports {data_art0[15]}]
set_property PACKAGE_PIN W13 [get_ports {data_art2[15]}]
set_property PACKAGE_PIN AB10 [get_ports {data_art2[14]}]
set_property PACKAGE_PIN Y13 [get_ports {data_art2[13]}]
set_property PACKAGE_PIN AB11 [get_ports {data_art2[12]}]
set_property PACKAGE_PIN AA13 [get_ports {data_art2[11]}]
set_property PACKAGE_PIN AB12 [get_ports {data_art2[10]}]
set_property PACKAGE_PIN AC11 [get_ports {data_art2[9]}]
set_property PACKAGE_PIN AD10 [get_ports {data_art2[8]}]
set_property PACKAGE_PIN AE10 [get_ports {data_art2[7]}]
set_property PACKAGE_PIN AF10 [get_ports {data_art2[6]}]
set_property PACKAGE_PIN AE11 [get_ports {data_art2[5]}]
set_property PACKAGE_PIN AA14 [get_ports {data_art2[4]}]
set_property PACKAGE_PIN AE12 [get_ports {data_art2[3]}]
set_property PACKAGE_PIN AB14 [get_ports {data_art2[2]}]
set_property PACKAGE_PIN AF12 [get_ports {data_art2[1]}]
set_property PACKAGE_PIN AE13 [get_ports {data_art2[0]}]
set_property PACKAGE_PIN AF24 [get_ports frame_art0]
set_property PACKAGE_PIN AA10 [get_ports frame_art2]
set_property IOSTANDARD LVCMOS25 [get_ports frame_art0]
set_property IOSTANDARD LVCMOS25 [get_ports frame_art2]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art2[15]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art2[14]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art2[13]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art2[12]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art2[11]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art2[10]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art2[9]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art2[8]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art2[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art2[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art2[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art2[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art2[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art2[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art2[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art2[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art0[15]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art0[14]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art0[13]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art0[12]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art0[11]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art0[10]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art0[9]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art0[8]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art0[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art0[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art0[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art0[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art0[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art0[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art0[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {data_art0[0]}]

set_property PACKAGE_PIN AE18 [get_ports sr_ck_pc_art]
set_property IOSTANDARD LVCMOS25 [get_ports sr_ck_pc_art]

# ext trig xp bin (connect to GND to cause trigger)
# on PCB X5.11 PL_IO_2_5[7]
set_property PACKAGE_PIN Y18 [get_ports trig_button]
set_property IOSTANDARD LVCMOS25 [get_ports trig_button]
set_property PULLUP true [get_ports trig_button]



set_property PACKAGE_PIN Y17 [get_ports {trig_button_gnd[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {trig_button_gnd[0]}]

set_property PACKAGE_PIN A8 [get_ports trig_L1_4led]
set_property PACKAGE_PIN J9 [get_ports trig_L2_4led]
set_property IOSTANDARD LVCMOS15 [get_ports trig_L1_4led]
set_property IOSTANDARD LVCMOS15 [get_ports trig_L2_4led]

set_property PACKAGE_PIN Y12 [get_ports trig_ext_in]
set_property PACKAGE_PIN AF13 [get_ports trig_out]
set_property IOSTANDARD LVCMOS25 [get_ports trig_ext_in]
set_property IOSTANDARD LVCMOS25 [get_ports trig_out]
