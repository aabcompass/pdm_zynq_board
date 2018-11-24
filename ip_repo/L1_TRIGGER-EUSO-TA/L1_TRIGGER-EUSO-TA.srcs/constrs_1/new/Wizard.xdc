create_clock -period 5.000 -name CLOCK_200 -waveform {0.000 2.500} [get_ports CLOCK_200]
create_clock -period 10.000 -name s_aclk_cmd -waveform {0.000 5.000} [get_ports s_aclk_cmd]
create_clock -period 10.000 -name m_aclk_ev -waveform {0.000 5.000} [get_nets m_aclk_ev]
create_clock -period 10.000 -name m_aclk_EC0EC1EC2 -waveform {0.000 5.000} [get_ports m_aclk_EC0EC1EC2]
create_clock -period 10.000 -name m_aclk_EC3EC4EC5 -waveform {0.000 5.000} [get_ports m_aclk_EC3EC4EC5]
create_clock -period 10.000 -name m_aclk_EC6EC7EC8 -waveform {0.000 5.000} [get_ports m_aclk_EC6EC7EC8]



