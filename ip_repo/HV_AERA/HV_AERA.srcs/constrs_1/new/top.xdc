create_clock -period 5.000 -name PDM_CLK -waveform {0.000 2.500} [get_ports PDM_CLK]

create_clock -period 5.000 -name s00_axi_aclk -waveform {0.000 2.500} [get_ports s00_axi_aclk]
