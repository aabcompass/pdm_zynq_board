set_false_path -through [get_nets {{design_1_i/axi_gpio_0/U0/gpio2_io_o[0]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[1]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[2]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[3]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[4]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[5]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[6]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[7]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[8]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[9]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[10]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[11]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[12]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[13]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[14]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[15]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[16]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[17]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[18]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[19]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[20]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[21]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[22]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[23]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[24]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[25]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[26]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[27]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[28]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[29]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[30]} {design_1_i/axi_gpio_0/U0/gpio2_io_o[31]}}]
#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets design_1_i/clk_wiz_0/inst/clk_in1_design_1_clk_wiz_1_0]
#set_false_path -through [get_nets -hierarchical -regexp -filter { NAME =~  ".+/slv_reg[0-9]*\[[0-9]*\]" }]




