create_clock -period 10.000 -name clk_art1_x1 -waveform {0.000 5.000} [get_ports clk_art1_x1]
create_clock -period 10.000 -name clk_mpu -waveform {0.000 5.000} [get_ports clk_mpu]
