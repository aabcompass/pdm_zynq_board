create_clock -period 5.000 -name CLOCK -waveform {0.000 2.500} [get_ports CLOCK]
create_clock -period 30.303 -name m_aclk -waveform {0.000 15.151} [get_ports m_aclk]



