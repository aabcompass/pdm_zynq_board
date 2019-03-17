----------------------------------------------------------------------------------
-- Company: INFN TORINO
-- Engineer: M.Mignone
-- 
-- Create Date:    14:11:24 08/2018 
-- Design Name: 
-- Module Name:    ALGO_B - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: EC VHDL
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity EC is port (
	CLOCK				        :	in	std_logic;
	data_s				        :	in	std_logic_vector(15 downto 0);
	frame_s				        :	in	std_logic;
--	ec_event                    :   out std_logic;
	empty_sum_fifo              :   out std_logic;
	rd_en_sum_fifo              :   in  std_logic;
	dout_sum_fifo               :   out std_logic_vector(239 downto 0);
	------------------------------------------------------------------
	thr                         :   in  std_logic_vector(33 downto 0);
	------------------------------------------------------------------
	event_rdy                   :   out std_logic;
	event_data                  :   out std_logic_vector(3 downto 0) := ( others => '0');
	-------------------------------------------------------------------
	ec_cnt_rdy                  :   out std_logic := '0';
	ec_cnt                      :   out std_logic_vector(9 downto 0) := ( others => '0')
	);
	
end EC;

architecture arch_ec of EC is

    signal  pixel_value0_s   :  std_logic_vector(7 downto 0) := ( others => '0');
    signal  pixel_value1_s   :  std_logic_vector(7 downto 0) := ( others => '0');
    signal  pixel_value2_s   :  std_logic_vector(7 downto 0) := ( others => '0');
    signal  pixel_value3_s   :  std_logic_vector(7 downto 0) := ( others => '0');
    signal  pixel_value4_s   :  std_logic_vector(7 downto 0) := ( others => '0');
    signal  pixel_value5_s   :  std_logic_vector(7 downto 0) := ( others => '0');
    signal  pixel_value6_s   :  std_logic_vector(7 downto 0) := ( others => '0');
    signal  pixel_value7_s   :  std_logic_vector(7 downto 0) := ( others => '0');
    signal  pixel_value8_s   :  std_logic_vector(7 downto 0) := ( others => '0');
    signal  pixel_value9_s	 :  std_logic_vector(7 downto 0) := ( others => '0');
    signal  pixel_value10_s	 :  std_logic_vector(7 downto 0) := ( others => '0');
    signal  pixel_value11_s  :  std_logic_vector(7 downto 0) := ( others => '0');
    signal  pixel_value12_s  :  std_logic_vector(7 downto 0) := ( others => '0');
    signal  pixel_value13_s  :  std_logic_vector(7 downto 0) := ( others => '0');
    signal  pixel_value14_s  :  std_logic_vector(7 downto 0) := ( others => '0');
    signal  pixel_value15_s  :  std_logic_vector(7 downto 0) := ( others => '0');

    type    state_sum128_type   is  (s0,s1,s2,s3,s4,s5);
    signal  state_sum128    :   state_sum128_type := s0;
	signal	pixel_col_count :	std_logic_vector(5 downto 0) := ( others => '0');
	signal	gtu_count128	:	std_logic_vector(6 downto 0) := ( others => '0');
	
	signal	wea_sum_mem		:	std_logic_vector(0 downto 0) := "0";
	signal	dina_sum_mem	:	std_logic_vector(239 downto 0) := ( others => '0');
	signal	douta_sum_mem	:	std_logic_vector(239 downto 0);
	
	signal	sum_bus_l0      :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_bus_l1      :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_bus_l2      :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_bus_l3      :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_bus_l4      :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_bus_l5      :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_bus_l6      :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_bus_l7      :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_bus_l8      :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_bus_l9      :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_bus_l10     :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_bus_l11     :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_bus_l12     :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_bus_l13     :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_bus_l14     :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_bus_l15     :	std_logic_vector(14 downto 0) := ( others => '0');
	
	signal	sum_bus_rdy		:	std_logic := '0';
	
	type    state_fifo128_type is  (cp_start, cp_stop);
    signal  state_fifo128   :   state_fifo128_type := cp_start;
	
	signal	bitcount		:	std_logic_vector(2 downto 0) := ( others => '0');
	signal	pixel_rdy		:	std_logic := '0';
	
	signal	add_15_l0A		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_15_l0B		:	std_logic_vector(7 downto 0) := ( others => '0');
	signal	add_15_l0S		:	std_logic_vector(14 downto 0) := ( others => '0');
	
	signal	add_15_l1A		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_15_l1B		:	std_logic_vector(7 downto 0) := ( others => '0');
	signal	add_15_l1S		:	std_logic_vector(14 downto 0) := ( others => '0');
	
	signal	add_15_l2A		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_15_l2B		:	std_logic_vector(7 downto 0) := ( others => '0');
	signal	add_15_l2S		:	std_logic_vector(14 downto 0) := ( others => '0');
	
	signal	add_15_l3A		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_15_l3B		:	std_logic_vector(7 downto 0) := ( others => '0');
	signal	add_15_l3S		:	std_logic_vector(14 downto 0) := ( others => '0');
	
	signal	add_15_l4A		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_15_l4B		:	std_logic_vector(7 downto 0) := ( others => '0');
	signal	add_15_l4S		:	std_logic_vector(14 downto 0) := ( others => '0');
	
	signal	add_15_l5A		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_15_l5B		:	std_logic_vector(7 downto 0) := ( others => '0');
	signal	add_15_l5S		:	std_logic_vector(14 downto 0) := ( others => '0');
	
	signal	add_15_l6A		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_15_l6B		:	std_logic_vector(7 downto 0) := ( others => '0');
	signal	add_15_l6S		:	std_logic_vector(14 downto 0) := ( others => '0');
	
	signal	add_15_l7A		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_15_l7B		:	std_logic_vector(7 downto 0) := ( others => '0');
	signal	add_15_l7S		:	std_logic_vector(14 downto 0) := ( others => '0');
	
	signal	add_15_l8A		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_15_l8B		:	std_logic_vector(7 downto 0) := ( others => '0');
	signal	add_15_l8S		:	std_logic_vector(14 downto 0) := ( others => '0');
	
	signal	add_15_l9A		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_15_l9B		:	std_logic_vector(7 downto 0) := ( others => '0');
	signal	add_15_l9S		:	std_logic_vector(14 downto 0) := ( others => '0');
	
	signal	add_15_l10A		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_15_l10B		:	std_logic_vector(7 downto 0) := ( others => '0');
	signal	add_15_l10S		:	std_logic_vector(14 downto 0) := ( others => '0');
	
	signal	add_15_l11A		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_15_l11B		:	std_logic_vector(7 downto 0) := ( others => '0');
	signal	add_15_l11S		:	std_logic_vector(14 downto 0) := ( others => '0');
	
	signal	add_15_l12A		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_15_l12B		:	std_logic_vector(7 downto 0) := ( others => '0');
	signal	add_15_l12S		:	std_logic_vector(14 downto 0) := ( others => '0');
	
	signal	add_15_l13A		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_15_l13B		:	std_logic_vector(7 downto 0) := ( others => '0');
	signal	add_15_l13S		:	std_logic_vector(14 downto 0) := ( others => '0');
	
	signal	add_15_l14A		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_15_l14B		:	std_logic_vector(7 downto 0) := ( others => '0');
	signal	add_15_l14S		:	std_logic_vector(14 downto 0) := ( others => '0');
	
	signal	add_15_l15A		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_15_l15B		:	std_logic_vector(7 downto 0) := ( others => '0');
	signal	add_15_l15S		:	std_logic_vector(14 downto 0) := ( others => '0');
	
	signal  bypass_add_15   :   std_logic := '0';
	
    --SUM_FIFO
    signal	din_sum_fifo	  : std_logic_vector(239 downto 0);
    signal	wr_en_sum_fifo	  : std_logic := '0';
--    signal	full_sum_fifo	  : std_logic;
	
	--SUM_FIFO_S (FIFO for S calculation)
    signal  din_sum_fifo_sc      : std_logic_vector(239 downto 0);
    signal  wr_en_sum_fifo_sc    : std_logic := '0';
    signal  empty_sum_fifo_sc     : std_logic;
    signal  rd_en_sum_fifo_sc    : std_logic := '0';
    signal  dout_sum_fifo_sc      : std_logic_vector(239 downto 0);
    
	
	--SQRT calculation
	type   state_sqrt_type     is  (s0,s1,s2,s3);
	signal state_sqrt         : state_sqrt_type := s0;
	
	--SQRT
	signal  s_axis_cartesian_tvalid     :  std_logic := '0';
    signal  s_axis_cartesian_tdata_l0   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tvalid_l0       :  std_logic;
    signal  m_axis_dout_tdata_l0        :  std_logic_vector(15 downto 0);
	
    signal  s_axis_cartesian_tdata_l1   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l1        :  std_logic_vector(15 downto 0);
	
    signal  s_axis_cartesian_tdata_l2   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l2        :  std_logic_vector(15 downto 0);
	
		
    signal  s_axis_cartesian_tdata_l3   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l3        :  std_logic_vector(15 downto 0);
	
    signal  s_axis_cartesian_tdata_l4   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l4        :  std_logic_vector(15 downto 0);
	
		
    signal  s_axis_cartesian_tdata_l5   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l5        :  std_logic_vector(15 downto 0);
	
    signal  s_axis_cartesian_tdata_l6   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l6        :  std_logic_vector(15 downto 0);
	
		
    signal  s_axis_cartesian_tdata_l7   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l7        :  std_logic_vector(15 downto 0);
	
    signal  s_axis_cartesian_tdata_l8   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l8        :  std_logic_vector(15 downto 0);
	
		
    signal  s_axis_cartesian_tdata_l9   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l9        :  std_logic_vector(15 downto 0);
	
    signal  s_axis_cartesian_tdata_l10   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l10        :  std_logic_vector(15 downto 0);
	
		
    signal  s_axis_cartesian_tdata_l11   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tvalid_l11       :  std_logic;
    signal  m_axis_dout_tdata_l11        :  std_logic_vector(15 downto 0);
	
    signal  s_axis_cartesian_tdata_l12   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l12        :  std_logic_vector(15 downto 0);
	
		
    signal  s_axis_cartesian_tdata_l13   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l13        :  std_logic_vector(15 downto 0);
	
    signal  s_axis_cartesian_tdata_l14   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l14        :  std_logic_vector(15 downto 0);
	
		
    signal  s_axis_cartesian_tdata_l15   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l15        :  std_logic_vector(15 downto 0);
    
    --S calculation
    signal  add_16_l0A                   :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_16_l0B                   :   std_logic_vector(12 downto 0) := ( others => '0');
    signal  add_16_l0S                   :   std_logic_vector(15 downto 0);
    
    signal  add_16_l1A                   :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_16_l1B                   :   std_logic_vector(12 downto 0) := ( others => '0');
    signal  add_16_l1S                   :   std_logic_vector(15 downto 0);
    
    signal  add_16_l2A                   :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_16_l2B                   :   std_logic_vector(12 downto 0) := ( others => '0');
    signal  add_16_l2S                   :   std_logic_vector(15 downto 0);
    
    signal  add_16_l3A                   :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_16_l3B                   :   std_logic_vector(12 downto 0) := ( others => '0');
    signal  add_16_l3S                   :   std_logic_vector(15 downto 0);
    
    signal  add_16_l4A                   :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_16_l4B                   :   std_logic_vector(12 downto 0) := ( others => '0');
    signal  add_16_l4S                   :   std_logic_vector(15 downto 0);
    
    signal  add_16_l5A                   :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_16_l5B                   :   std_logic_vector(12 downto 0) := ( others => '0');
    signal  add_16_l5S                   :   std_logic_vector(15 downto 0);
    
    signal  add_16_l6A                   :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_16_l6B                   :   std_logic_vector(12 downto 0) := ( others => '0');
    signal  add_16_l6S                   :   std_logic_vector(15 downto 0);
    
    signal  add_16_l7A                   :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_16_l7B                   :   std_logic_vector(12 downto 0) := ( others => '0');
    signal  add_16_l7S                   :   std_logic_vector(15 downto 0);
    
    signal  add_16_l8A                   :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_16_l8B                   :   std_logic_vector(12 downto 0) := ( others => '0');
    signal  add_16_l8S                   :   std_logic_vector(15 downto 0);
    
    signal  add_16_l9A                   :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_16_l9B                   :   std_logic_vector(12 downto 0) := ( others => '0');
    signal  add_16_l9S                   :   std_logic_vector(15 downto 0);
    
    signal  add_16_l10A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_16_l10B                  :   std_logic_vector(12 downto 0) := ( others => '0');
    signal  add_16_l10S                  :   std_logic_vector(15 downto 0);
    
    signal  add_16_l11A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_16_l11B                  :   std_logic_vector(12 downto 0) := ( others => '0');
    signal  add_16_l11S                  :   std_logic_vector(15 downto 0);
    
    signal  add_16_l12A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_16_l12B                  :   std_logic_vector(12 downto 0) := ( others => '0');
    signal  add_16_l12S                  :   std_logic_vector(15 downto 0);
    
    signal  add_16_l13A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_16_l13B                  :   std_logic_vector(12 downto 0) := ( others => '0');
    signal  add_16_l13S                  :   std_logic_vector(15 downto 0);
    
    signal  add_16_l14A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_16_l14B                  :   std_logic_vector(12 downto 0) := ( others => '0');
    signal  add_16_l14S                  :   std_logic_vector(15 downto 0);
    
    signal  add_16_l15A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_16_l15B                  :   std_logic_vector(12 downto 0) := ( others => '0');
    signal  add_16_l15S                  :   std_logic_vector(15 downto 0);
    
    signal  add_15b_l0A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_15b_l0B                  :   std_logic_vector(6 downto 0) := ( others => '0');
    signal  add_15b_l0S                  :   std_logic_vector(14 downto 0);
    
    signal  add_15b_l1A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_15b_l1B                  :   std_logic_vector(6 downto 0) := ( others => '0');
    signal  add_15b_l1S                  :   std_logic_vector(14 downto 0);
    
    signal  add_15b_l2A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_15b_l2B                  :   std_logic_vector(6 downto 0) := ( others => '0');
    signal  add_15b_l2S                  :   std_logic_vector(14 downto 0);
    
    signal  add_15b_l3A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_15b_l3B                  :   std_logic_vector(6 downto 0) := ( others => '0');
    signal  add_15b_l3S                  :   std_logic_vector(14 downto 0);
    
    signal  add_15b_l4A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_15b_l4B                  :   std_logic_vector(6 downto 0) := ( others => '0');
    signal  add_15b_l4S                  :   std_logic_vector(14 downto 0);
    
    signal  add_15b_l5A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_15b_l5B                  :   std_logic_vector(6 downto 0) := ( others => '0');
    signal  add_15b_l5S                  :   std_logic_vector(14 downto 0);
    
    signal  add_15b_l6A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_15b_l6B                  :   std_logic_vector(6 downto 0) := ( others => '0');
    signal  add_15b_l6S                  :   std_logic_vector(14 downto 0);
    
    signal  add_15b_l7A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_15b_l7B                  :   std_logic_vector(6 downto 0) := ( others => '0');
    signal  add_15b_l7S                  :   std_logic_vector(14 downto 0);
    
    signal  add_15b_l8A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_15b_l8B                  :   std_logic_vector(6 downto 0) := ( others => '0');
    signal  add_15b_l8S                  :   std_logic_vector(14 downto 0);
    
    signal  add_15b_l9A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_15b_l9B                  :   std_logic_vector(6 downto 0) := ( others => '0');
    signal  add_15b_l9S                  :   std_logic_vector(14 downto 0);
    
    signal  add_15b_l10A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_15b_l10B                  :   std_logic_vector(6 downto 0) := ( others => '0');
    signal  add_15b_l10S                  :   std_logic_vector(14 downto 0);
    
    signal  add_15b_l11A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_15b_l11B                  :   std_logic_vector(6 downto 0) := ( others => '0');
    signal  add_15b_l11S                  :   std_logic_vector(14 downto 0);
    
    signal  add_15b_l12A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_15b_l12B                  :   std_logic_vector(6 downto 0) := ( others => '0');
    signal  add_15b_l12S                  :   std_logic_vector(14 downto 0);
    
    signal  add_15b_l13A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_15b_l13B                  :   std_logic_vector(6 downto 0) := ( others => '0');
    signal  add_15b_l13S                  :   std_logic_vector(14 downto 0);
    
    signal  add_15b_l14A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_15b_l14B                  :   std_logic_vector(6 downto 0) := ( others => '0');
    signal  add_15b_l14S                  :   std_logic_vector(14 downto 0);
    
    signal  add_15b_l15A                  :   std_logic_vector(14 downto 0) := ( others => '0');
    signal  add_15b_l15B                  :   std_logic_vector(6 downto 0) := ( others => '0');
    signal  add_15b_l15S                  :   std_logic_vector(14 downto 0);
    
    type    state_S_type                  is   (s0,s1,s2,s3);
    signal  state_S                       :    state_S_type := s0;
    signal  S_calc                        :    std_logic := '0';
    signal  S_rdy                         :    std_logic := '0';
    type    state_set_type                is    (s0,s1);
    signal  state_set                     :    state_set_type := s0;
    
    --S MEMORY
    type    state_swrite_type             is  (s0,s1);
    signal  state_swrite                  :    state_swrite_type := s0;
    
    signal  wea_smem                      :    std_logic_vector(0 downto 0) := "0"  ;
    signal  addra_smem                    :    std_logic_vector(6 downto 0) := ( others => '0');
    signal  dina_smem                     :    std_logic_vector(255 downto 0) := ( others => '0');
    signal  addrb_smem                    :    std_logic_vector(6 downto 0) := "0110000";--Init value ->Second half of memory
    signal  doutb_smem                    :    std_logic_vector(255 downto 0);
    
    --GTU counter
    type    state_gtu_cnt_type            is (s0,s1);
    signal  state_gtu_cnt                 :   state_gtu_cnt_type := s0;
    
    --S MEMORY address switch
    type    state_adr_type                is (s0,s1);
    signal  state_adr                     :   state_adr_type := s0;
    signal  gtu_cnt                       :   std_logic_vector(6 downto 0) := ( others => '1');
    signal  addrb_start                   :   std_logic_vector(6 downto 0) := "0110000";--Init value ->second half of memory (48)
    signal  addrb_stop                    :   std_logic_vector(6 downto 0) := "1011111";--Init value ->second half of memory (95)
    
    --Pixel check
    type    state_event_type              is (s0,s1,s2,s3,s4,s5,s6,s7);
    signal  state_event                   :   state_event_type := s0;
    signal  switch_addr                   :   std_logic := '0';
    signal  update_addr                   :   std_logic := '0';
    
    signal  pmt_l0                        :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  pmt_l1                        :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  pmt_l2                        :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  pmt_l3                        :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  pmt_l4                        :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  pmt_l5                        :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  pmt_l6                        :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  pmt_l7                        :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  pmt_l8                        :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  pmt_l9                        :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  pmt_l10                       :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  pmt_l11                       :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  pmt_l12                       :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  pmt_l13                       :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  pmt_l14                       :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  pmt_l15                       :   std_logic_vector(3 downto 0) := ( others => '0');
    
    signal  pmt_col_cnt                   :   std_logic_vector(2 downto 0) := ( others => '0');
    
	signal  add_5_l0l1A     :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  add_5_l0l1B     :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  add_5_l0l1S     :   std_logic_vector(4 downto 0);
    
    signal  add_5_l2l3A     :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  add_5_l2l3B     :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  add_5_l2l3S     :   std_logic_vector(4 downto 0);
    
    signal  add_5_l4l5A     :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  add_5_l4l5B     :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  add_5_l4l5S     :   std_logic_vector(4 downto 0);
        
    signal  add_5_l6l7A     :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  add_5_l6l7B     :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  add_5_l6l7S     :   std_logic_vector(4 downto 0);
    
    signal  add_5_l8l9A     :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  add_5_l8l9B     :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  add_5_l8l9S     :   std_logic_vector(4 downto 0);
        
    signal  add_5_l10l11A   :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  add_5_l10l11B   :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  add_5_l10l11S   :   std_logic_vector(4 downto 0);
    
    signal  add_5_l12l13A   :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  add_5_l12l13B   :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  add_5_l12l13S   :   std_logic_vector(4 downto 0);
            
    signal  add_5_l14l15A   :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  add_5_l14l15B   :   std_logic_vector(3 downto 0) := ( others => '0');
    signal  add_5_l14l15S   :   std_logic_vector(4 downto 0);
    
    signal  add_6_l0l1l2l3A :   std_logic_vector(4 downto 0) := ( others => '0');
    signal  add_6_l0l1l2l3B :   std_logic_vector(4 downto 0) := ( others => '0');
    signal  add_6_l0l1l2l3S :   std_logic_vector(5 downto 0);
    
    signal  add_6_l4l5l6l7A :   std_logic_vector(4 downto 0) := ( others => '0');
    signal  add_6_l4l5l6l7B :   std_logic_vector(4 downto 0) := ( others => '0');
    signal  add_6_l4l5l6l7S :   std_logic_vector(5 downto 0);
    
    signal  add_6_l8l9l10l11A :   std_logic_vector(4 downto 0) := ( others => '0');
    signal  add_6_l8l9l10l11B :   std_logic_vector(4 downto 0) := ( others => '0');
    signal  add_6_l8l9l10l11S :   std_logic_vector(5 downto 0);
    
    signal  add_6_l12l13l14l15A :   std_logic_vector(4 downto 0) := ( others => '0');
    signal  add_6_l12l13l14l15B :   std_logic_vector(4 downto 0) := ( others => '0');
    signal  add_6_l12l13l14l15S :   std_logic_vector(5 downto 0);
    
    signal  add_7_l0l1l2l3l4l5l6l7A :  std_logic_vector(5 downto 0) := ( others => '0');
    signal  add_7_l0l1l2l3l4l5l6l7B :  std_logic_vector(5 downto 0) := ( others => '0');
    
    signal  add_7_l8l9l10l11l12l13l14l15A :  std_logic_vector(5 downto 0) := ( others => '0');
    signal  add_7_l8l9l10l11l12l13l14l15B :  std_logic_vector(5 downto 0) := ( others => '0');
    
    signal  pmt_t : std_logic_vector(6 downto 0);
    signal  pmt_b : std_logic_vector(6 downto 0);
    signal  pmt_ready : std_logic := '0';
    
    --Signal MEMORY
    signal wea_cirmem : std_logic_vector(0 downto 0) := "0";
    signal addra_cirmem : std_logic_vector(3 downto 0) := "0110";--Second half memory
    signal dina_cirmem  : std_logic_vector(22 downto 0) := ( others => '0');
    signal douta_cirmem  : std_logic_vector(22 downto 0) := ( others => '0');
    signal addra_cirmem_old : std_logic_vector(3 downto 0) := ( others => '0');
    
    --Read/write memory
    type   memory_state_type     is  (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11);
    signal memory_state : memory_state_type := s0;
    
    signal add_8tA : std_logic_vector(6 downto 0) := ( others => '0');
    signal add_8tB : std_logic_vector(6 downto 0) := ( others => '0');
    signal add_8tS : std_logic_vector(7 downto 0);
    
    signal add_8bA : std_logic_vector(6 downto 0) := ( others => '0');
    signal add_8bB : std_logic_vector(6 downto 0) := ( others => '0');
    signal add_8bS : std_logic_vector(7 downto 0);
    
    --Check event
    signal pmt_ev       : std_logic := '0';
    signal pmt2_ev      : std_logic := '0';
    signal event_data_s : std_logic_vector(3 downto 0) := ( others => '0');
    signal pmt_ecsum    : std_logic_vector(8 downto 0) := ( others => '0');
    signal ec_half      : std_logic := '0';
    signal ec_ev        : std_logic := '0';
    signal pmt_2ecsum   : std_logic_vector(9 downto 0) := ( others => '0');
    signal ec_ev2       : std_logic := '0';
    signal ec_cnt_s     : std_logic_vector(9 downto 0) := ( others => '0');
    
	COMPONENT ADDER_15
	PORT (
        a   : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
        b   : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        clk : IN STD_LOGIC;
        bypass : IN STD_LOGIC;
        s   : OUT STD_LOGIC_VECTOR(14 DOWNTO 0)
	   );
	END COMPONENT;
	
	COMPONENT SUM_MEMORY
      PORT (
        clka    : IN STD_LOGIC;
        wea     : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra   : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
        dina    : IN STD_LOGIC_VECTOR(239 DOWNTO 0);
        douta   : OUT STD_LOGIC_VECTOR(239 DOWNTO 0)
      );
    END COMPONENT;
	
	COMPONENT SUM_FIFO
	PORT (
        clk     : IN STD_LOGIC;
        din     : IN STD_LOGIC_VECTOR(239 DOWNTO 0);
        wr_en   : IN STD_LOGIC;
        rd_en   : IN STD_LOGIC;
        dout    : OUT STD_LOGIC_VECTOR(239 DOWNTO 0);
        full    : OUT STD_LOGIC;
        empty   : OUT STD_LOGIC
	   );
	END COMPONENT;
	
	COMPONENT SQRT_15
      PORT (
        aclk                    : IN STD_LOGIC;
        s_axis_cartesian_tvalid : IN STD_LOGIC;
        s_axis_cartesian_tdata  : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        m_axis_dout_tvalid      : OUT STD_LOGIC;
        m_axis_dout_tdata       : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
      );
	END COMPONENT;
	
	COMPONENT ADDER_12
      PORT (
        A : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
        CLK : IN STD_LOGIC;
        S : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
      );
    END COMPONENT;
    
    COMPONENT ADDER_16
      PORT (
        A : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
        CLK : IN STD_LOGIC;
        S : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
      );
    END COMPONENT;
    
    COMPONENT ADDER_15B
      PORT (
        A : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
        CLK : IN STD_LOGIC;
        S : OUT STD_LOGIC_VECTOR(14 DOWNTO 0)
      );
    END COMPONENT;
    
    COMPONENT ADDER_5
      PORT (
        A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        CLK : IN STD_LOGIC;
        S : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
      );
    END COMPONENT;
    
    COMPONENT ADDER_6
      PORT (
        A : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        CLK : IN STD_LOGIC;
        S : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
      );
    END COMPONENT;
    
    COMPONENT ADDER_7
      PORT (
        A : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
        CLK : IN STD_LOGIC;
        S : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
      );
    END COMPONENT;
    
    COMPONENT S_MEMORY
      PORT (
        clka : IN STD_LOGIC;
        wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
        dina : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
        clkb : IN STD_LOGIC;
        addrb : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
        doutb : OUT STD_LOGIC_VECTOR(255 DOWNTO 0)
      );
    END COMPONENT;
    
    COMPONENT MEMORY
      PORT (
        clka : IN STD_LOGIC;
        wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        dina : IN STD_LOGIC_VECTOR(22 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(22 DOWNTO 0)
      );
    END COMPONENT;
    
    COMPONENT ADDER_8
      PORT (
        A : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
        CLK : IN STD_LOGIC;
        S : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
      );
    END COMPONENT;
	
	
begin
	add_15_l0: ADDER_15
	PORT MAP (
        a => add_15_l0A,
        b => add_15_l0B,
        clk => CLOCK,
        bypass => bypass_add_15,
        s => add_15_l0S
	);
	
	add_15_l1: ADDER_15
	PORT MAP (
        a => add_15_l1A,
        b => add_15_l1B,
        clk => CLOCK,
        bypass => bypass_add_15,
        s => add_15_l1S
	);
	
	add_15_l2: ADDER_15
	PORT MAP (
        a => add_15_l2A,
        b => add_15_l2B,
        clk => CLOCK,
        bypass => bypass_add_15,
        s => add_15_l2S
	);
	
	add_15_l3: ADDER_15
	PORT MAP (
        a => add_15_l3A,
        b => add_15_l3B,
        clk => CLOCK,
        bypass => bypass_add_15,
        s => add_15_l3S
	);
	
	add_15_l4: ADDER_15
	PORT MAP (
        a => add_15_l4A,
        b => add_15_l4B,
        clk => CLOCK,
        bypass => bypass_add_15,
        s => add_15_l4S
	);
	
	add_15_l5: ADDER_15
	PORT MAP (
        a => add_15_l5A,
        b => add_15_l5B,
        clk => CLOCK,
        bypass => bypass_add_15,
        s => add_15_l5S
	);
	
	add_15_l6: ADDER_15
	PORT MAP (
        a => add_15_l6A,
        b => add_15_l6B,
        clk => CLOCK,
        bypass => bypass_add_15,
        s => add_15_l6S
	);
	
	add_15_l7: ADDER_15
	PORT MAP (
        a => add_15_l7A,
        b => add_15_l7B,
        clk => CLOCK,
        bypass => bypass_add_15,
        s => add_15_l7S
	);
	
	add_15_l8: ADDER_15
	PORT MAP (
        a => add_15_l8A,
        b => add_15_l8B,
        clk => CLOCK,
        bypass => bypass_add_15,
        s => add_15_l8S
	);
	
	add_15_l9: ADDER_15
	PORT MAP (
        a => add_15_l9A,
        b => add_15_l9B,
        clk => CLOCK,
        bypass => bypass_add_15,
        s => add_15_l9S
	);
	
	add_15_l10: ADDER_15
	PORT MAP (
        a => add_15_l10A,
        b => add_15_l10B,
        clk => CLOCK,
        bypass => bypass_add_15,
        s => add_15_l10S
	);
	
	add_15_l11: ADDER_15
	PORT MAP (
        a => add_15_l11A,
        b => add_15_l11B,
        clk => CLOCK,
        bypass => bypass_add_15,
        s => add_15_l11S
	);
	
	add_15_l12: ADDER_15
	PORT MAP (
        a => add_15_l12A,
        b => add_15_l12B,
        clk => CLOCK,
        bypass => bypass_add_15,
        s => add_15_l12S
	);
	
	add_15_l13: ADDER_15
	PORT MAP (
        a => add_15_l13A,
        b => add_15_l13B,
        clk => CLOCK,
        bypass => bypass_add_15,
        s => add_15_l13S
	);
	
	add_15_l14: ADDER_15
	PORT MAP (
        a => add_15_l14A,
        b => add_15_l14B,
        clk => CLOCK,
        bypass => bypass_add_15,
        s => add_15_l14S
	);
	
	add_15_l15: ADDER_15
	PORT MAP (
        a => add_15_l15A,
        b => add_15_l15B,
        clk => CLOCK,
        bypass => bypass_add_15,
        s => add_15_l15S
	);
	
	add_5_l0l1 : ADDER_5
    PORT MAP (
        A => add_5_l0l1A,
        B => add_5_l0l1B,
        CLK => CLOCK,
        S => add_5_l0l1S
    );
    
    add_5_l2l3 : ADDER_5
    PORT MAP (
        A => add_5_l2l3A,
        B => add_5_l2l3B,
        CLK => CLOCK,
        S => add_5_l2l3S
    );
        
        
    add_5_l4l5 : ADDER_5
    PORT MAP (
        A => add_5_l4l5A,
        B => add_5_l4l5B,
        CLK => CLOCK,
        S => add_5_l4l5S
    );
            
    add_5_l6l7 : ADDER_5
    PORT MAP (
        A => add_5_l6l7A,
        B => add_5_l6l7B,
        CLK => CLOCK,
        S => add_5_l6l7S
    );

    add_5_l8l9 : ADDER_5
    PORT MAP (
        A => add_5_l8l9A,
        B => add_5_l8l9B,
        CLK => CLOCK,
        S => add_5_l8l9S
    );

    add_5_l10l11 : ADDER_5
    PORT MAP (
        A => add_5_l10l11A,
        B => add_5_l10l11B,
        CLK => CLOCK,
        S => add_5_l10l11S
    );
    
    add_5_l12l13 : ADDER_5
    PORT MAP (
        A => add_5_l12l13A,
        B => add_5_l12l13B,
        CLK => CLOCK,
        S => add_5_l12l13S
    );
    
    add_5_l14l15 : ADDER_5
    PORT MAP (
        A => add_5_l14l15A,
        B => add_5_l14l15B,
        CLK => CLOCK,
        S => add_5_l14l15S
    );
    
    add_6_l0l1l2l3 : ADDER_6
      PORT MAP (
        A => add_6_l0l1l2l3A,
        B => add_6_l0l1l2l3B,
        CLK => CLOCK,
        S => add_6_l0l1l2l3S
    );
    
    add_6_l4l5l6l7 : ADDER_6
      PORT MAP (
        A => add_6_l4l5l6l7A,
        B => add_6_l4l5l6l7B,
        CLK => CLOCK,
        S => add_6_l4l5l6l7S
    );
    
    add_6_l8l9l10l11 : ADDER_6
      PORT MAP (
        A => add_6_l8l9l10l11A,
        B => add_6_l8l9l10l11B,
        CLK => CLOCK,
        S => add_6_l8l9l10l11S
    );
    
    add_6_l12l13l14l15 : ADDER_6
      PORT MAP (
        A => add_6_l12l13l14l15A,
        B => add_6_l12l13l14l15B,
        CLK => CLOCK,
        S => add_6_l12l13l14l15S
    );
    
    add_7_l0l1l2l3l4l5l6l7 : ADDER_7
      PORT MAP (
        A => add_7_l0l1l2l3l4l5l6l7A,
        B => add_7_l0l1l2l3l4l5l6l7B,
        CLK => CLOCK,
        S => pmt_t
    );
    
    add_7_l8l9l10l11l12l13l14l15 : ADDER_7
      PORT MAP (
        A => add_7_l8l9l10l11l12l13l14l15A,
        B => add_7_l8l9l10l11l12l13l14l15B,
        CLK => CLOCK,
        S => pmt_b
    );
    
    
	memory_sum : SUM_MEMORY
	PORT MAP (
        clka 	=> CLOCK,
        wea 	=> wea_sum_mem,
        addra 	=> pixel_col_count,
        dina 	=> dina_sum_mem,
        douta 	=> douta_sum_mem
	);
	
	summ_fifo : SUM_FIFO
	PORT MAP (
        clk => CLOCK,
        din => din_sum_fifo,
        wr_en => wr_en_sum_fifo,
        rd_en => rd_en_sum_fifo,
        dout => dout_sum_fifo,
        full => open,
        empty => empty_sum_fifo
	);
	
	summ_fifo_sc : SUM_FIFO
        PORT MAP (
            clk => CLOCK,
            din => din_sum_fifo_sc,
            wr_en => wr_en_sum_fifo_sc,
            rd_en => rd_en_sum_fifo_sc,
            dout => dout_sum_fifo_sc,
            full => open,
            empty => empty_sum_fifo_sc
    );
	
	SQRT_15_l0 : SQRT_15
      PORT MAP (
        aclk => CLOCK,
        s_axis_cartesian_tvalid => s_axis_cartesian_tvalid,
        s_axis_cartesian_tdata => s_axis_cartesian_tdata_l0,
        m_axis_dout_tvalid => m_axis_dout_tvalid_l0,
        m_axis_dout_tdata => m_axis_dout_tdata_l0
      );
      
	SQRT_15_l1 : SQRT_15
      PORT MAP (
        aclk => CLOCK,
        s_axis_cartesian_tvalid => s_axis_cartesian_tvalid,
        s_axis_cartesian_tdata => s_axis_cartesian_tdata_l1,
        m_axis_dout_tvalid => open,
        m_axis_dout_tdata => m_axis_dout_tdata_l1
      );
      
	SQRT_15_l2 : SQRT_15
      PORT MAP (
        aclk => CLOCK,
        s_axis_cartesian_tvalid => s_axis_cartesian_tvalid,
        s_axis_cartesian_tdata => s_axis_cartesian_tdata_l2,
        m_axis_dout_tvalid => open,
        m_axis_dout_tdata => m_axis_dout_tdata_l2
      );
      
	SQRT_15_l3 : SQRT_15
      PORT MAP (
        aclk => CLOCK,
        s_axis_cartesian_tvalid => s_axis_cartesian_tvalid,
        s_axis_cartesian_tdata => s_axis_cartesian_tdata_l3,
        m_axis_dout_tvalid => open,
        m_axis_dout_tdata => m_axis_dout_tdata_l3
      );
      	
	SQRT_15_l4 : SQRT_15
      PORT MAP (
        aclk => CLOCK,
        s_axis_cartesian_tvalid => s_axis_cartesian_tvalid,
        s_axis_cartesian_tdata => s_axis_cartesian_tdata_l4,
        m_axis_dout_tvalid => open,
        m_axis_dout_tdata => m_axis_dout_tdata_l4
      );
      	
	SQRT_15_l5 : SQRT_15
      PORT MAP (
        aclk => CLOCK,
        s_axis_cartesian_tvalid => s_axis_cartesian_tvalid,
        s_axis_cartesian_tdata => s_axis_cartesian_tdata_l5,
        m_axis_dout_tvalid => open,
        m_axis_dout_tdata => m_axis_dout_tdata_l5
      );
      	
	SQRT_15_l6 : SQRT_15
      PORT MAP (
        aclk => CLOCK,
        s_axis_cartesian_tvalid => s_axis_cartesian_tvalid,
        s_axis_cartesian_tdata => s_axis_cartesian_tdata_l6,
        m_axis_dout_tvalid => open,
        m_axis_dout_tdata => m_axis_dout_tdata_l6
      );
      	
	SQRT_15_l7 : SQRT_15
      PORT MAP (
        aclk => CLOCK,
        s_axis_cartesian_tvalid => s_axis_cartesian_tvalid,
        s_axis_cartesian_tdata => s_axis_cartesian_tdata_l7,
        m_axis_dout_tvalid => open,
        m_axis_dout_tdata => m_axis_dout_tdata_l7
      );
      	
	SQRT_15_l8 : SQRT_15
      PORT MAP (
        aclk => CLOCK,
        s_axis_cartesian_tvalid => s_axis_cartesian_tvalid,
        s_axis_cartesian_tdata => s_axis_cartesian_tdata_l8,
        m_axis_dout_tvalid => open,
        m_axis_dout_tdata => m_axis_dout_tdata_l8
      );
      	
	SQRT_15_l9 : SQRT_15
      PORT MAP (
        aclk => CLOCK,
        s_axis_cartesian_tvalid => s_axis_cartesian_tvalid,
        s_axis_cartesian_tdata => s_axis_cartesian_tdata_l9,
        m_axis_dout_tvalid => open,
        m_axis_dout_tdata => m_axis_dout_tdata_l9
      );
      	
	SQRT_15_l10 : SQRT_15
      PORT MAP (
        aclk => CLOCK,
        s_axis_cartesian_tvalid => s_axis_cartesian_tvalid,
        s_axis_cartesian_tdata => s_axis_cartesian_tdata_l10,
        m_axis_dout_tvalid => open,
        m_axis_dout_tdata => m_axis_dout_tdata_l10
      );
      	
	SQRT_15_l11 : SQRT_15
      PORT MAP (
        aclk => CLOCK,
        s_axis_cartesian_tvalid => s_axis_cartesian_tvalid,
        s_axis_cartesian_tdata => s_axis_cartesian_tdata_l11,
        m_axis_dout_tvalid => open,
        m_axis_dout_tdata => m_axis_dout_tdata_l11
      );
      	
	SQRT_15_l12 : SQRT_15
      PORT MAP (
        aclk => CLOCK,
        s_axis_cartesian_tvalid => s_axis_cartesian_tvalid,
        s_axis_cartesian_tdata => s_axis_cartesian_tdata_l12,
        m_axis_dout_tvalid => open,
        m_axis_dout_tdata => m_axis_dout_tdata_l12
      );
      
	SQRT_15_l13 : SQRT_15
      PORT MAP (
        aclk => CLOCK,
        s_axis_cartesian_tvalid => s_axis_cartesian_tvalid,
        s_axis_cartesian_tdata => s_axis_cartesian_tdata_l13,
        m_axis_dout_tvalid => open,
        m_axis_dout_tdata => m_axis_dout_tdata_l13
      );
      	
	SQRT_15_l14 : SQRT_15
      PORT MAP (
        aclk => CLOCK,
        s_axis_cartesian_tvalid => s_axis_cartesian_tvalid,
        s_axis_cartesian_tdata => s_axis_cartesian_tdata_l14,
        m_axis_dout_tvalid => open,
        m_axis_dout_tdata => m_axis_dout_tdata_l14
      );
      	
	SQRT_15_l15 : SQRT_15
      PORT MAP (
        aclk => CLOCK,
        s_axis_cartesian_tvalid => s_axis_cartesian_tvalid,
        s_axis_cartesian_tdata => s_axis_cartesian_tdata_l15,
        m_axis_dout_tvalid => open,
        m_axis_dout_tdata => m_axis_dout_tdata_l15
      );
      
    add_16_l0 : ADDER_16
      PORT MAP (
        A => add_16_l0A,
        B => add_16_l0B,
        CLK => CLOCK,
        S => add_16_l0S
      );
      
    add_16_l1 : ADDER_16
      PORT MAP (
        A => add_16_l1A,
        B => add_16_l1B,
        CLK => CLOCK,
        S => add_16_l1S
      );
      
    add_16_l2 : ADDER_16
      PORT MAP (
        A => add_16_l2A,
        B => add_16_l2B,
        CLK => CLOCK,
        S => add_16_l2S
      );
      
    add_16_l3 : ADDER_16
      PORT MAP (
        A => add_16_l3A,
        B => add_16_l3B,
        CLK => CLOCK,
        S => add_16_l3S
      );
      
    add_16_l4 : ADDER_16
      PORT MAP (
        A => add_16_l4A,
        B => add_16_l4B,
        CLK => CLOCK,
        S => add_16_l4S
      );
      
    add_16_l5 : ADDER_16
      PORT MAP (
        A => add_16_l5A,
        B => add_16_l5B,
        CLK => CLOCK,
        S => add_16_l5S
      );
      
    add_16_l6 : ADDER_16
      PORT MAP (
        A => add_16_l6A,
        B => add_16_l6B,
        CLK => CLOCK,
        S => add_16_l6S
      );
      
    add_16_l7 : ADDER_16
      PORT MAP (
        A => add_16_l7A,
        B => add_16_l7B,
        CLK => CLOCK,
        S => add_16_l7S
      );
      
    add_16_l8 : ADDER_16
      PORT MAP (
        A => add_16_l8A,
        B => add_16_l8B,
        CLK => CLOCK,
        S => add_16_l8S
      );
      
    add_16_l9 : ADDER_16
      PORT MAP (
        A => add_16_l9A,
        B => add_16_l9B,
        CLK => CLOCK,
        S => add_16_l9S
      );
      
    add_16_l10 : ADDER_16
      PORT MAP (
        A => add_16_l10A,
        B => add_16_l10B,
        CLK => CLOCK,
        S => add_16_l10S
      );
      
    add_16_l11 : ADDER_16
      PORT MAP (
        A => add_16_l11A,
        B => add_16_l11B,
        CLK => CLOCK,
        S => add_16_l11S
      );
      
    add_16_l12 : ADDER_16
      PORT MAP (
        A => add_16_l12A,
        B => add_16_l12B,
        CLK => CLOCK,
        S => add_16_l12S
      );
      
    add_16_l13 : ADDER_16
      PORT MAP (
        A => add_16_l13A,
        B => add_16_l13B,
        CLK => CLOCK,
        S => add_16_l13S
      );
      
    add_16_l14 : ADDER_16
      PORT MAP (
        A => add_16_l14A,
        B => add_16_l14B,
        CLK => CLOCK,
        S => add_16_l14S
      );
      
    add_16_l15 : ADDER_16
      PORT MAP (
        A => add_16_l15A,
        B => add_16_l15B,
        CLK => CLOCK,
        S => add_16_l15S
      );
      
    add_15b_l0 : ADDER_15B
        PORT MAP (
            A => add_15b_l0A,
            B => add_15b_l0B,
            CLK => CLOCK,
            S => add_15b_l0S
    );
        
    add_15b_l1 : ADDER_15B
        PORT MAP (
            A => add_15b_l1A,
            B => add_15b_l1B,
            CLK => CLOCK,
            S => add_15b_l1S
    );
  
    add_15b_l2 : ADDER_15B
        PORT MAP (
            A => add_15b_l2A,
            B => add_15b_l2B,
            CLK => CLOCK,
            S => add_15b_l2S
    );
 
    add_15b_l3 : ADDER_15B
        PORT MAP (
            A => add_15b_l3A,
            B => add_15b_l3B,
            CLK => CLOCK,
            S => add_15b_l3S
    );  

   add_15b_l4 : ADDER_15B
        PORT MAP (
            A => add_15b_l4A,
            B => add_15b_l4B,
            CLK => CLOCK,
            S => add_15b_l4S
    );
    
   add_15b_l5 : ADDER_15B
        PORT MAP (
           A => add_15b_l5A,
           B => add_15b_l5B,
           CLK => CLOCK,
           S => add_15b_l5S
    );
     
    add_15b_l6 : ADDER_15B
        PORT MAP (
            A => add_15b_l6A,
            B => add_15b_l6B,
            CLK => CLOCK,
            S => add_15b_l6S
      );

   add_15b_l7 : ADDER_15B
        PORT MAP (
          A => add_15b_l7A,
          B => add_15b_l7B,
          CLK => CLOCK,
          S => add_15b_l7S
    );
    
    add_15b_l8 : ADDER_15B
         PORT MAP (
           A => add_15b_l8A,
           B => add_15b_l8B,
           CLK => CLOCK,
           S => add_15b_l8S
     );
     
     add_15b_l9 : ADDER_15B
          PORT MAP (
            A => add_15b_l9A,
            B => add_15b_l9B,
            CLK => CLOCK,
            S => add_15b_l9S
      );
      
   add_15b_l10 : ADDER_15B
        PORT MAP (
            A => add_15b_l10A,
            B => add_15b_l10B,
            CLK => CLOCK,
            S => add_15b_l10S
    );
       
    add_15b_l11 : ADDER_15B
        PORT MAP (
            A => add_15b_l11A,
            B => add_15b_l11B,
            CLK => CLOCK,
            S => add_15b_l11S
    );
        
   add_15b_l12 : ADDER_15B
        PORT MAP (
           A => add_15b_l12A,
           B => add_15b_l12B,
           CLK => CLOCK,
           S => add_15b_l12S
    );
         
   add_15b_l13 : ADDER_15B
        PORT MAP (
            A => add_15b_l13A,
            B => add_15b_l13B,
            CLK => CLOCK,
            S => add_15b_l13S
    );
          
   add_15b_l14 : ADDER_15B
       PORT MAP (
            A => add_15b_l14A,
            B => add_15b_l14B,
            CLK => CLOCK,
            S => add_15b_l14S
    );
           
   add_15b_l15 : ADDER_15B
        PORT MAP (
            A => add_15b_l15A,
            B => add_15b_l15B,
            CLK => CLOCK,
            S => add_15b_l15S
    );
            
    S_MEM : S_MEMORY
      PORT MAP (
        clka => CLOCK,
        wea => wea_smem,
        addra => addra_smem,
        dina => dina_smem,
        clkb => CLOCK,
        addrb => addrb_smem,
        doutb => doutb_smem
    );
      
    CIRCULAR_MEMORY : MEMORY
        PORT MAP (
          clka => CLOCK,
          wea => wea_cirmem,
          addra => addra_cirmem,
          dina => dina_cirmem,
          douta => douta_cirmem
    );
        
    add_8t : ADDER_8
        PORT MAP (
            A => add_8tA,
            B => add_8tB,
            CLK => CLOCK,
            S => add_8tS
    );
    
    add_8b : ADDER_8
        PORT MAP (
            A => add_8bA,
            B => add_8bB,
            CLK => CLOCK,
            S => add_8bS
    );
      
	--Serial PIXEL BIT IN to BYTE PIXEL (SIPO)
	sipo_s : process (CLOCK)
	begin 
		if (CLOCK'event and CLOCK = '1') then
			if (frame_s = '1') then
			    --Shift register
				pixel_value0_s 	<= data_s(0) & pixel_value0_s(7 downto 1);
				pixel_value1_s 	<= data_s(1) & pixel_value1_s(7 downto 1);
				pixel_value2_s 	<= data_s(2) & pixel_value2_s(7 downto 1);
				pixel_value3_s 	<= data_s(3) & pixel_value3_s(7 downto 1);
				pixel_value4_s 	<= data_s(4) & pixel_value4_s(7 downto 1);
				pixel_value5_s 	<= data_s(5) & pixel_value5_s(7 downto 1);
				pixel_value6_s	<= data_s(6) & pixel_value6_s(7 downto 1);
				pixel_value7_s 	<= data_s(7) & pixel_value7_s(7 downto 1);
				pixel_value8_s 	<= data_s(8) & pixel_value8_s(7 downto 1);
				pixel_value9_s 	<= data_s(9) & pixel_value9_s(7 downto 1);
				pixel_value10_s	<= data_s(10) & pixel_value10_s(7 downto 1);
				pixel_value11_s <= data_s(11) & pixel_value11_s(7 downto 1);
				pixel_value12_s <= data_s(12) & pixel_value12_s(7 downto 1);
				pixel_value13_s <= data_s(13) & pixel_value13_s(7 downto 1);
				pixel_value14_s <= data_s(14) & pixel_value14_s(7 downto 1);
				pixel_value15_s <= data_s(15) & pixel_value15_s(7 downto 1);
				if (bitcount = "111") then  --Now we have 8 bits ready in "pixel_value"
					pixel_rdy	<= '1';     --Pixel ready,enable the reading
					bitcount	<= "000";
				else
					pixel_rdy <= '0';
					bitcount <= bitcount + 1;
				end if;
			else
				pixel_rdy		<= '0';
			end if;
		end if;
	end process;
	
	--SUM CALCULATION ON 128GTU
	sum128_gtu :	process (CLOCK)
	begin
		if (CLOCK'event and CLOCK = '1') then
			case (state_sum128) is
				when s0 =>
					if (pixel_rdy = '1') then--The pixel "byte" is ready
						if (gtu_count128 = "0000000") then--First GTU in the 128 GTU block (make SUM = pixel)
						  bypass_add_15 <= '1';
						else--Next GTU after GTU0 (make SUM = current pixel value + last pixel sum)
					      bypass_add_15 <= '0';
						end if;
						add_15_l0A 	<= douta_sum_mem(14 downto 0);
						add_15_l0B 	<= pixel_value0_s;
                        add_15_l1A  <= douta_sum_mem(29 downto 15);
                        add_15_l1B 	<= pixel_value1_s;
                        add_15_l2A  <= douta_sum_mem(44 downto 30);
                        add_15_l2B	<= pixel_value2_s;
                        add_15_l3A  <= douta_sum_mem(59 downto 45);
                        add_15_l3B 	<= pixel_value3_s;
                        add_15_l4A  <= douta_sum_mem(74 downto 60);
                        add_15_l4B 	<= pixel_value4_s;
                        add_15_l5A  <= douta_sum_mem(89 downto 75);
                        add_15_l5B 	<= pixel_value5_s;
                        add_15_l6A  <= douta_sum_mem(104 downto 90);
                        add_15_l6B 	<= pixel_value6_s;
                        add_15_l7A  <= douta_sum_mem(119 downto 105);
                        add_15_l7B  <= pixel_value7_s;
                        add_15_l8A  <= douta_sum_mem(134 downto 120);
                        add_15_l8B 	<= pixel_value8_s;
                        add_15_l9A  <= douta_sum_mem(149 downto 135);
                        add_15_l9B 	<= pixel_value9_s;
                        add_15_l10A <= douta_sum_mem(164 downto 150);
                        add_15_l10B <= pixel_value10_s;
                        add_15_l11A <= douta_sum_mem(179 downto 165);
                        add_15_l11B <= pixel_value11_s;
                        add_15_l12A <= douta_sum_mem(194 downto 180);
                        add_15_l12B <= pixel_value12_s;
                        add_15_l13A <= douta_sum_mem(209 downto 195);
                        add_15_l13B <= pixel_value13_s;
                        add_15_l14A <= douta_sum_mem(224 downto 210);
                        add_15_l14B <= pixel_value14_s;
                        add_15_l15A <= douta_sum_mem(239 downto 225);
                        add_15_l15B <= pixel_value15_s;
						
						state_sum128 <= s1;
					else
					   state_sum128 <= s0;
					end if;
				when s1 =>
					state_sum128 <= s2;
					bypass_add_15 <= '0';
				when s2 =>	--Latency ADDER_15=2
					state_sum128 <= s3;
				when s3 =>
					wea_sum_mem		<=	"1";--Write the SUM in memory (memory_sum)
					dina_sum_mem(14 downto 0)		<= add_15_l0S;
					dina_sum_mem(29 downto 15)		<= add_15_l1S;
					dina_sum_mem(44 downto 30)		<= add_15_l2S;
					dina_sum_mem(59 downto 45)		<= add_15_l3S;
					dina_sum_mem(74 downto 60)		<= add_15_l4S;
					dina_sum_mem(89 downto 75)		<= add_15_l5S;
					dina_sum_mem(104 downto 90)	    <= add_15_l6S;
					dina_sum_mem(119 downto 105)	<= add_15_l7S;
					dina_sum_mem(134 downto 120)	<= add_15_l8S;
					dina_sum_mem(149 downto 135)	<= add_15_l9S;
					dina_sum_mem(164 downto 150)	<= add_15_l10S;
					dina_sum_mem(179 downto 165)	<= add_15_l11S;
					dina_sum_mem(194 downto 180)	<= add_15_l12S;
					dina_sum_mem(209 downto 195)	<= add_15_l13S;
					dina_sum_mem(224 downto 210)	<= add_15_l14S;
					dina_sum_mem(239 downto 225)	<= add_15_l15S;
					
					if (gtu_count128 = "1111111") then --Last GTU (128) (count = 127)
						sum_bus_rdy	<= '1';--Write the 128 SUM in sum_bus and enable the read (sum_bus_rdy=1)
						sum_bus_l0 	<= add_15_l0S;
						sum_bus_l1 	<= add_15_l1S;
						sum_bus_l2 	<= add_15_l2S;
						sum_bus_l3 	<= add_15_l3S;
						sum_bus_l4 	<= add_15_l4S;
						sum_bus_l5 	<= add_15_l5S;
						sum_bus_l6 	<= add_15_l6S;
						sum_bus_l7 	<= add_15_l7S;
						sum_bus_l8 	<= add_15_l8S;
						sum_bus_l9 	<= add_15_l9S;
						sum_bus_l10 <= add_15_l10S;
						sum_bus_l11 <= add_15_l11S;
						sum_bus_l12 <= add_15_l12S;
						sum_bus_l13 <= add_15_l13S;
						sum_bus_l14 <= add_15_l14S;
						sum_bus_l15 <= add_15_l15S;
					end if;	
					state_sum128 <= s4;
				when s4 =>
					wea_sum_mem		<=	"0";
					sum_bus_rdy	<= '0';
					--Check if we are on the last GTU column (47)
					--yes=>reset the memory address
					--no=>increase the memory address
					if (pixel_col_count = "101111") then
						pixel_col_count <= "000000";
						state_sum128 <= s5;
					else
						pixel_col_count <= pixel_col_count + 1;
						state_sum128 <= s0;--reset state for the next GTU
					end if;
				when s5 =>
					if (gtu_count128 = "1111111") then--Last GTU (128 GTU)
						gtu_count128 <= "0000000";
						state_sum128 <= s0;
					else
						gtu_count128 <= gtu_count128 + 1;--Next GTU
						state_sum128 <= s0;
					end if;
			end case;
		end if;
	end process;
	
	--WRITE 128GTU ON SUM_FIFO
	--WRITE 128GTU ON SUMM_FIFO_L1 (for L2 processing)
	fifo128_gtu :	process (CLOCK)
	begin				
		if (CLOCK'event and CLOCK = '1') then
			case (state_fifo128) is
				when cp_start =>
				    --Copy the 128 GTU sum in FIFO_SUM
					if (sum_bus_rdy = '1') then--Check if the 128gtu sum are ready
					   --Copy the 128 GTU sum in FIFO_SUM
						wr_en_sum_fifo <= '1';--Write the value on fifo
						din_sum_fifo(14 downto 0)	 <= sum_bus_l0;
						din_sum_fifo(29 downto 15)	 <= sum_bus_l1;
						din_sum_fifo(44 downto 30)	 <= sum_bus_l2;
						din_sum_fifo(59 downto 45)	 <= sum_bus_l3;
						din_sum_fifo(74 downto 60)	 <= sum_bus_l4;
						din_sum_fifo(89 downto 75)	 <= sum_bus_l5;
						din_sum_fifo(104 downto 90)	 <= sum_bus_l6;
						din_sum_fifo(119 downto 105) <= sum_bus_l7;
						din_sum_fifo(134 downto 120) <= sum_bus_l8;
						din_sum_fifo(149 downto 135) <= sum_bus_l9;
						din_sum_fifo(164 downto 150) <= sum_bus_l10;
						din_sum_fifo(179 downto 165) <= sum_bus_l11;
						din_sum_fifo(194 downto 180) <= sum_bus_l12;
						din_sum_fifo(209 downto 195) <= sum_bus_l13;
						din_sum_fifo(224 downto 210) <= sum_bus_l14;
						din_sum_fifo(239 downto 225) <= sum_bus_l15;
						--Copy the 128 GTU sum in FIFO_SUM_SC (for S calculation)
						wr_en_sum_fifo_sc <= '1';--Write the value on fifo
                        din_sum_fifo_sc(14 downto 0)  <= sum_bus_l0;
                        din_sum_fifo_sc(29 downto 15) <= sum_bus_l1;
                        din_sum_fifo_sc(44 downto 30) <= sum_bus_l2;
                        din_sum_fifo_sc(59 downto 45) <= sum_bus_l3;
                        din_sum_fifo_sc(74 downto 60) <= sum_bus_l4;
                        din_sum_fifo_sc(89 downto 75) <= sum_bus_l5;
                        din_sum_fifo_sc(104 downto 90) <= sum_bus_l6;
                        din_sum_fifo_sc(119 downto 105) <= sum_bus_l7;
                        din_sum_fifo_sc(134 downto 120) <= sum_bus_l8;
                        din_sum_fifo_sc(149 downto 135) <= sum_bus_l9;
                        din_sum_fifo_sc(164 downto 150) <= sum_bus_l10;
                        din_sum_fifo_sc(179 downto 165) <= sum_bus_l11;
                        din_sum_fifo_sc(194 downto 180) <= sum_bus_l12;
                        din_sum_fifo_sc(209 downto 195) <= sum_bus_l13;
                        din_sum_fifo_sc(224 downto 210) <= sum_bus_l14;
                        din_sum_fifo_sc(239 downto 225) <= sum_bus_l15;
                                                
						state_fifo128 <= cp_stop;
				    else
				        state_fifo128 <= cp_start;
					end if;
				when cp_stop =>
					wr_en_sum_fifo <= '0';
					wr_en_sum_fifo_sc <= '0';
					state_fifo128 <= cp_start;
			end case;
		end if;
	end process;               
                    
	--SQRT calculation (SQRT(SUM*2))
    SQRT_calc :    process (CLOCK)
    begin                
        if (CLOCK'event and CLOCK = '1') then
            case (state_sqrt) is
                when s0 =>
                    if (empty_sum_fifo_sc = '0') then--Check if the 128 GTU sum are ready (FIFO_SUM_SC EMPTY=0)
                        rd_en_sum_fifo_sc <= '1';--Enable the FIFO read
                        state_sqrt <= s1;
                    else
                        state_sqrt <= s0;
                    end if;
                when s1 =>
                        state_sqrt <= s2;
                        rd_en_sum_fifo_sc <= '0';
                        --Latency read
                when s2 =>
                        s_axis_cartesian_tvalid <= '1';--Enable sqrt
                                                
                        s_axis_cartesian_tdata_l0    <= dout_sum_fifo_sc(14 downto 0) & "0"; --SUM*2
                        s_axis_cartesian_tdata_l1    <= dout_sum_fifo_sc(29 downto 15) & "0"; --SUM*2
                        s_axis_cartesian_tdata_l2    <= dout_sum_fifo_sc(44 downto 30) & "0"; --SUM*2
                        s_axis_cartesian_tdata_l3    <= dout_sum_fifo_sc(59 downto 45) & "0"; --SUM*2
                        s_axis_cartesian_tdata_l4    <= dout_sum_fifo_sc(74 downto 60) & "0"; --SUM*2
                        s_axis_cartesian_tdata_l5    <= dout_sum_fifo_sc(89 downto 75) & "0"; --SUM*2
                        s_axis_cartesian_tdata_l6    <= dout_sum_fifo_sc(104 downto 90) & "0"; --SUM*2
                        s_axis_cartesian_tdata_l7    <= dout_sum_fifo_sc(119 downto 105) & "0"; --SUM*2
                        s_axis_cartesian_tdata_l8    <= dout_sum_fifo_sc(134 downto 120) & "0"; --SUM*2
                        s_axis_cartesian_tdata_l9    <= dout_sum_fifo_sc(149 downto 135) & "0"; --SUM*2
                        s_axis_cartesian_tdata_l10   <= dout_sum_fifo_sc(164 downto 150) & "0"; --SUM*2
                        s_axis_cartesian_tdata_l11   <= dout_sum_fifo_sc(179 downto 165) & "0"; --SUM*2
                        s_axis_cartesian_tdata_l12   <= dout_sum_fifo_sc(194 downto 180) & "0"; --SUM*2
                        s_axis_cartesian_tdata_l13   <= dout_sum_fifo_sc(209 downto 195) & "0"; --SUM*2
                        s_axis_cartesian_tdata_l14   <= dout_sum_fifo_sc(224 downto 210) & "0"; --SUM*2
                        s_axis_cartesian_tdata_l15   <= dout_sum_fifo_sc(239 downto 225) & "0"; --SUM*2
                                            
                        state_sqrt <= s3;
                        
                when s3 =>
                    s_axis_cartesian_tvalid <= '0';
                    if (S_calc = '1') then--If the S calc. is ready,read the next column in FIFO
                        state_sqrt <= s0;
                    end if;
            end case;
        end if;
    end process;

    --S calculation
    S_calculation :    process (CLOCK)
    begin                
        if (CLOCK'event and CLOCK = '1') then
            case (state_S) is
                when s0 =>
                    if (rd_en_sum_fifo_sc = '1') then--Check if there is a new 128sum value (in FIFO_SUM_SC)
                        state_S <= s1;
                    else
                        state_S <= s0;
                        S_calc <= '0';
                    end if;
                when s1 =>
                    --Latency read
                    state_S <= s2;
                when s2 =>
                    --SUM+32
                        add_15b_l0A <= dout_sum_fifo_sc(14 downto 0);
                        add_15b_l1A <= dout_sum_fifo_sc(29 downto 15);
                        add_15b_l2A <= dout_sum_fifo_sc(44 downto 30);
                        add_15b_l3A <= dout_sum_fifo_sc(59 downto 45);
                        add_15b_l4A <= dout_sum_fifo_sc(74 downto 60);
                        add_15b_l5A <= dout_sum_fifo_sc(89 downto 75);
                        add_15b_l6A <= dout_sum_fifo_sc(104 downto 90);
                        add_15b_l7A <= dout_sum_fifo_sc(119 downto 105);
                        add_15b_l8A <= dout_sum_fifo_sc(134 downto 120);
                        add_15b_l9A <= dout_sum_fifo_sc(149 downto 135);
                        add_15b_l10A <= dout_sum_fifo_sc(164 downto 150);
                        add_15b_l11A <= dout_sum_fifo_sc(179 downto 165);
                        add_15b_l12A <= dout_sum_fifo_sc(194 downto 180);
                        add_15b_l13A <= dout_sum_fifo_sc(209 downto 195);
                        add_15b_l14A <= dout_sum_fifo_sc(224 downto 210);
                        add_15b_l15A <= dout_sum_fifo_sc(239 downto 225);
                        
                        add_15b_l0B <= "0100000";
                        add_15b_l1B <= "0100000";
                        add_15b_l2B <= "0100000";
                        add_15b_l3B <= "0100000";
                        add_15b_l4B <= "0100000";
                        add_15b_l5B <= "0100000";
                        add_15b_l6B <= "0100000";
                        add_15b_l7B <= "0100000";
                        add_15b_l8B <= "0100000";
                        add_15b_l9B <= "0100000";
                        add_15b_l10B <= "0100000";
                        add_15b_l11B <= "0100000";
                        add_15b_l12B <= "0100000";
                        add_15b_l13B <= "0100000";
                        add_15b_l14B <= "0100000";
                        add_15b_l15B <= "0100000";
                        
                        state_S <= s3;
                when s3 =>
                    if (m_axis_dout_tvalid_l0 = '1') then--Check if SQRT(SUM*2) is ready
                        --SQRT minimum from IP Coregen => width MAX 8bit + 5 bit
                        --S=(SUM+32)+32*SQRT(2*SUM)
                        add_16_l0B  <= m_axis_dout_tdata_l0(7 downto 0) & "00000"; --32*SQRT(2*SUM)
                        add_16_l1B  <= m_axis_dout_tdata_l1(7 downto 0) & "00000"; --32*SQRT(2*SUM)
                        add_16_l2B  <= m_axis_dout_tdata_l2(7 downto 0) & "00000"; --32*SQRT(2*SUM)
                        add_16_l3B  <= m_axis_dout_tdata_l3(7 downto 0) & "00000"; --32*SQRT(2*SUM)
                        add_16_l4B  <= m_axis_dout_tdata_l4(7 downto 0) & "00000"; --32*SQRT(2*SUM)
                        add_16_l5B  <= m_axis_dout_tdata_l5(7 downto 0) & "00000"; --32*SQRT(2*SUM)
                        add_16_l6B  <= m_axis_dout_tdata_l6(7 downto 0) & "00000"; --32*SQRT(2*SUM)
                        add_16_l7B  <= m_axis_dout_tdata_l7(7 downto 0) & "00000"; --32*SQRT(2*SUM)
                        add_16_l8B  <= m_axis_dout_tdata_l8(7 downto 0) & "00000"; --32*SQRT(2*SUM)
                        add_16_l9B  <= m_axis_dout_tdata_l9(7 downto 0) & "00000"; --32*SQRT(2*SUM)
                        add_16_l10B <= m_axis_dout_tdata_l10(7 downto 0) & "00000"; --32*SQRT(2*SUM)
                        add_16_l11B <= m_axis_dout_tdata_l11(7 downto 0) & "00000"; --32*SQRT(2*SUM)
                        add_16_l12B <= m_axis_dout_tdata_l12(7 downto 0) & "00000"; --32*SQRT(2*SUM)
                        add_16_l13B <= m_axis_dout_tdata_l13(7 downto 0) & "00000"; --32*SQRT(2*SUM)
                        add_16_l14B <= m_axis_dout_tdata_l14(7 downto 0) & "00000"; --32*SQRT(2*SUM)
                        add_16_l15B <= m_axis_dout_tdata_l15(7 downto 0) & "00000"; --32*SQRT(2*SUM)
                        
                        add_16_l0A <= add_15b_l0S;
                        add_16_l1A <= add_15b_l1S;
                        add_16_l2A <= add_15b_l2S;
                        add_16_l3A <= add_15b_l3S;
                        add_16_l4A <= add_15b_l4S;
                        add_16_l5A <= add_15b_l5S;
                        add_16_l6A <= add_15b_l6S;
                        add_16_l7A <= add_15b_l7S;
                        add_16_l8A <= add_15b_l8S;
                        add_16_l9A <= add_15b_l9S;
                        add_16_l10A <= add_15b_l10S;
                        add_16_l11A <= add_15b_l11S;
                        add_16_l12A <= add_15b_l12S;
                        add_16_l13A <= add_15b_l13S;
                        add_16_l14A <= add_15b_l14S;
                        add_16_l15A <= add_15b_l15S;
                        
                        state_S <= s0;
                        S_calc <= '1';
                    end if;
            end case;
        end if;
    end process;
    
    --Set "S" ready
    S_set :     process (CLOCK)
    begin
        if (CLOCK'event and CLOCK = '1') then
            case (state_set) is
                when s0 =>
                    if (S_calc = '1') then
                        state_set <= s1; --Adder latency
                    end if;
                    S_rdy <= '0';
                when s1 =>
                    S_rdy <= '1';--Now "S" is ready
                    state_set <= s0;
            end case;
        end if;
    end process;
    
	--Write S value in memory
    --memory depth = EC column x2 (half memory for "old" S value,half memory for "new" S value)
    S_write :    process (CLOCK)
    begin                
        if (CLOCK'event and CLOCK = '1') then
            case (state_swrite) is
                when s0 => 
				    if (S_rdy = '1' ) then--Check if S value is ready
				        wea_smem <= "1";--Write on memory (column 0 to column ECx2)
				        if (add_16_l0S < "0000000110000000") then--If S<384 set S=384)
				            dina_smem(15 downto 0) <= "0000000110000000";
                        else
                            dina_smem(15 downto 0) <= add_16_l0S;
                        end if;
                        if (add_16_l1S < "0000000110000000") then--If S<384 set S=384)
                            dina_smem(31 downto 16) <= "0000000110000000";
                        else
                            dina_smem(31 downto 16) <= add_16_l1S;
                        end if;
                        if (add_16_l2S < "0000000110000000") then--If S<384 set S=384)
                            dina_smem(47 downto 32) <= "0000000110000000";
                        else
                            dina_smem(47 downto 32) <= add_16_l2S;
                        end if;
                        if (add_16_l3S < "0000000110000000") then--If S<384 set S=384)
                            dina_smem(63 downto 48) <= "0000000110000000";
                        else
                            dina_smem(63 downto 48) <= add_16_l3S;
                        end if;
                        if (add_16_l4S < "0000000110000000") then--If S<384 set S=384)
                            dina_smem(79 downto 64) <= "0000000110000000";
                        else
                            dina_smem(79 downto 64) <= add_16_l4S;
                        end if;
                        if (add_16_l5S < "0000000110000000") then--If S<384 set S=384)
                            dina_smem(95 downto 80) <= "0000000110000000";
                        else
                            dina_smem(95 downto 80) <= add_16_l5S;
                        end if;
                        if (add_16_l6S < "0000000110000000") then--If S<384 set S=384)
                            dina_smem(111 downto 96) <= "0000000110000000";
                        else
                            dina_smem(111 downto 96) <= add_16_l6S;
                        end if;
                        if (add_16_l7S < "0000000110000000") then--If S<384 set S=384)
                            dina_smem(127 downto 112) <= "0000000110000000";
                        else
                            dina_smem(127 downto 112) <= add_16_l7S;
                        end if;
                        if (add_16_l8S < "0000000110000000") then--If S<384 set S=384)
                            dina_smem(143 downto 128) <= "0000000110000000";
                        else
                            dina_smem(143 downto 128) <= add_16_l8S;
                        end if;
                        if (add_16_l9S < "0000000110000000") then--If S<384 set S=384)
                            dina_smem(159 downto 144) <= "0000000110000000";
                        else
                            dina_smem(159 downto 144) <= add_16_l9S;
                        end if;
                        if (add_16_l10S < "0000000110000000") then--If S<384 set S=384)
                            dina_smem(175 downto 160) <= "0000000110000000";
                        else
                            dina_smem(175 downto 160) <= add_16_l10S;
                        end if;
                        if (add_16_l11S < "0000000110000000") then--If S<384 set S=384)
                            dina_smem(191 downto 176) <= "0000000110000000";
                        else
                            dina_smem(191 downto 176) <= add_16_l11S;
                        end if;
                        if (add_16_l12S < "0000000110000000") then--If S<384 set S=384)
                            dina_smem(207 downto 192) <= "0000000110000000";
                        else
                            dina_smem(207 downto 192) <= add_16_l12S;
                        end if;
                        if (add_16_l13S < "0000000110000000") then--If S<384 set S=384)
                            dina_smem(223 downto 208) <= "0000000110000000";
                        else
                            dina_smem(223 downto 208) <= add_16_l13S;
                        end if;
                        if (add_16_l14S < "0000000110000000") then--If S<384 set S=384)
                            dina_smem(239 downto 224) <= "0000000110000000";
                        else
                            dina_smem(239 downto 224) <= add_16_l14S;
                        end if;
                        if (add_16_l15S < "0000000110000000") then--If S<384 set S=384)
                            dina_smem(255 downto 240) <= "0000000110000000";
                        else
                            dina_smem(255 downto 240) <= add_16_l15S;
                        end if;
                        
				        state_swrite <= s1;
				    end if;
				    
				when s1 =>
				    if (addra_smem = "1011111") then--Last memory column (column EC x 2)
				        addra_smem <= (others => '0');
				    else
				        addra_smem <= addra_smem + 1;
				    end if;
				    wea_smem <= "0";
				    state_swrite <= s0;
			end case;
	    end if;
	end process;
	
	GTU_counter:         process (CLOCK)
	begin
	   if (CLOCK'event and CLOCK = '1') then
	       case (state_gtu_cnt) is
	           when s0 =>
	               if (frame_s = '1') then
	                   --if (gtu_cnt = "10001000") then --Change S address block after 128 + 8 GTU (MINIEUSO version)
	                   if (gtu_cnt = "1111111") then --Change S address block after 128GTU
--                           gtu_cnt <= "00001001";
                             gtu_cnt <= "0000000";
                       else
	                       gtu_cnt <= gtu_cnt + 1;-- GTU counter
	                   end if;
	                   state_gtu_cnt <= s1;
	               end if;
	           when s1 =>
	               if (frame_s = '0') then
	                   state_gtu_cnt <= s0;
	               end if;
	       end case;
	   end if;
	end process;
	
    --Address switch for S memory reading
	--Switch the memory address between half memory bank (first 48-95,then 0-47) 
	--Half memory is for the old S value,the second half memory is the new S value
	-- DUAL PORT MEMORY
	Address_S:         process (CLOCK)
	begin
	   if (CLOCK'event and CLOCK = '1') then
	       case (state_adr) is
	           when s0 =>
	               if (switch_addr = '1') then
	                   --if (gtu_cnt = "10001000") then --Change S address block after 128 + 8 GTU (MINIEUSO VERSION)
	                   if (gtu_cnt = "1111111") then --Change S address block after 128 GTU
	                       addrb_start <= "0000000";--Address memory start 0(half S memory)
	                       addrb_stop  <= "0101111";--Address memory stop 47(half S memory)
	                       state_adr <= s1;
	                   else
	                       state_adr <= s0;
	                   end if;
	               end if;
	           when s1 =>
                   if (switch_addr = '1') then
                       --if (gtu_cnt = "10001000") then --Change S address block after 128 + 8 GTU (MINIEUSO VERSION)
                       if (gtu_cnt = "1111111") then --Change S address block after 128 GTU
                           addrb_start <= "0110000";--Address memory start 48(half S memory)
                           addrb_stop  <= "1011111";--Address memory stop 95 (half S memory)
                           state_adr <= s0;
                       else
                           state_adr <= s1;
                       end if;
                   end if;
	       end case;
	   end if;
	end process;
	           
	
	--Pixel check with S value
    Pixel_check :    process (CLOCK)
    begin                
        if (CLOCK'event and CLOCK = '1') then
            case (state_event) is
                when s0 => 
				    if (pixel_rdy = '1') then--Check if the pixel coulom is ready
				        --Check if the pixel_value > S (Yes increase PMT line counter)
				        if ( pixel_value0_s & "0000000" > doutb_smem(15 downto 0) ) then
                            pmt_l0 <= pmt_l0 + 1;
                        end if;
				        if ( pixel_value1_s & "0000000" > doutb_smem(31 downto 16) ) then
				            pmt_l1 <= pmt_l1 + 1;
				        end if;
				        if ( pixel_value2_s & "0000000" > doutb_smem(47 downto 32) ) then
                            pmt_l2 <= pmt_l2 + 1;
                        end if;
                        if ( pixel_value3_s & "0000000" > doutb_smem(63 downto 48) ) then
                            pmt_l3 <= pmt_l3 + 1;
                        end if;
                        if ( pixel_value4_s & "0000000" > doutb_smem(79 downto 64) ) then
                            pmt_l4 <= pmt_l4 + 1;
                        end if;
                        if ( pixel_value5_s & "0000000" > doutb_smem(95 downto 80) ) then
                            pmt_l5 <= pmt_l5 + 1;
                        end if;
                        if ( pixel_value6_s & "0000000" > doutb_smem(111 downto 96) ) then
                            pmt_l6 <= pmt_l6 + 1;
                        end if;
                        if ( pixel_value7_s & "0000000" > doutb_smem(127 downto 112) ) then
                            pmt_l7 <= pmt_l7 + 1;
                        end if;
                        if ( pixel_value8_s & "0000000" > doutb_smem(143 downto 128) ) then
                            pmt_l8 <= pmt_l8 + 1;
                        end if;
                        if ( pixel_value9_s & "0000000" > doutb_smem(159 downto 144) ) then
                            pmt_l9 <= pmt_l9 + 1;
                        end if;
                        if ( pixel_value10_s & "0000000" > doutb_smem(175 downto 160) ) then
                            pmt_l10 <= pmt_l10 + 1;
                        end if;
                        if ( pixel_value11_s & "0000000" > doutb_smem(191 downto 176) ) then
                            pmt_l11 <= pmt_l11 + 1;
                        end if;
                        if ( pixel_value12_s & "0000000" > doutb_smem(207 downto 192) ) then
                            pmt_l12 <= pmt_l12 + 1;
                        end if;
                        if ( pixel_value13_s & "0000000" > doutb_smem(223 downto 208) ) then
                            pmt_l13 <= pmt_l13 + 1;
                        end if;
                        if ( pixel_value14_s & "0000000" > doutb_smem(239 downto 224) ) then
                            pmt_l14 <= pmt_l14 + 1;
                        end if;
                        if ( pixel_value15_s & "0000000" > doutb_smem(255 downto 240) ) then
                            pmt_l15 <= pmt_l15 + 1;
                        end if;
                        
                        --Check the last PMT column
                        if (pmt_col_cnt = "111") then
                            pmt_col_cnt <= "000";
                            state_event <= s1;
                        else
                            pmt_col_cnt <= pmt_col_cnt + 1;
                        end if;
                        
                        if (addrb_smem = addrb_stop) then--Last memory column for S reading (End of frame)
                            switch_addr <= '1';--Enable the "switch" of the memory address for the "S" memory
                            update_addr <= '1';--Enable the update of the new S memory address
                        else
                            addrb_smem <= addrb_smem + 1;
                        end if;
                    else
                        state_event <= s0;
--                        pmt_ready <= '0';
				    end if;
--				    ec_event <= '0';
				    pmt_ready <= '0';
				when s1 =>
				    --Sum the number of pixel above S for each couple of pixel lines
				    add_5_l0l1A <= pmt_l0;
                    add_5_l0l1B <= pmt_l1;
                    
                    add_5_l2l3A <= pmt_l2;
                    add_5_l2l3B <= pmt_l3;
                                
                    add_5_l4l5A <= pmt_l4;
                    add_5_l4l5B <= pmt_l5;
                                                            
                    add_5_l6l7A <= pmt_l6;
                    add_5_l6l7B <= pmt_l7;
                                                                                
                    add_5_l8l9A <= pmt_l8;
                    add_5_l8l9B <= pmt_l9;
                    
                    add_5_l10l11A <= pmt_l10;
                    add_5_l10l11B <= pmt_l11;
                    
                    add_5_l12l13A <= pmt_l12;
                    add_5_l12l13B <= pmt_l13;
                    
                    add_5_l14l15A <= pmt_l14;
                    add_5_l14l15B <= pmt_l15;
                    
                    switch_addr <= '0';
                    state_event <= s2;
				when s2 =>
--				    if (col_event > "0000000000000000") then
--				        ec_event <= '1';--Yes,EVENT
--				        col_event <= ( others => '0');
--				    end if;
				    state_event <= s3;
			    when s3 =>
                    add_6_l0l1l2l3A <= add_5_l0l1S;
                    add_6_l0l1l2l3B <= add_5_l2l3S;
			       
                    add_6_l4l5l6l7A <= add_5_l4l5S;
                    add_6_l4l5l6l7B <= add_5_l6l7S;
                    
                    add_6_l8l9l10l11A <= add_5_l8l9S;
                    add_6_l8l9l10l11B <= add_5_l10l11S;
                    
                    add_6_l12l13l14l15A <= add_5_l12l13S;
                    add_6_l12l13l14l15B <= add_5_l14l15S;
                    
                    if (update_addr = '1') then--Last memory column for S reading (End of frame)
				        addrb_smem <= addrb_start;--Update the start address for the reading of the S memory
                        update_addr <= '0';
                    end if;
				    state_event <= s4;
--				    ec_event <= '0';
                when s4 =>
                    --ADDER Delay
                    state_event <= s5;
                when s5 =>
                    add_7_l0l1l2l3l4l5l6l7A <= add_6_l0l1l2l3S;
                    add_7_l0l1l2l3l4l5l6l7B <= add_6_l4l5l6l7S;
                    
                    add_7_l8l9l10l11l12l13l14l15A <= add_6_l8l9l10l11S;
                    add_7_l8l9l10l11l12l13l14l15B <= add_6_l12l13l14l15S;
                    
                    state_event <= s6;
                when s6 =>
                    --Adder Delay
                    state_event <= s7;
                when s7 =>
                    --Enable the read of the PMT counter value
                    pmt_ready <= '1';
                    state_event <= s0;
                    --Reset pmt line counter
                    pmt_l0 <= "0000";
                    pmt_l1 <= "0000";
                    pmt_l2 <= "0000";
                    pmt_l3 <= "0000";
                    pmt_l4 <= "0000";
                    pmt_l5 <= "0000";
                    pmt_l6 <= "0000";
                    pmt_l7 <= "0000";
                    pmt_l8 <= "0000";
                    pmt_l9 <= "0000";
                    pmt_l10 <= "0000";
                    pmt_l11 <= "0000";
                    pmt_l12 <= "0000";
                    pmt_l13 <= "0000";
                    pmt_l14 <= "0000";
                    pmt_l15 <= "0000";
			end case;
	    end if;
	end process;
	
    --Read/Write pmt/ec value in circular memory (memory for 3EC with old value + 3EC with new value)
    --Check PMT event
    Memory_storage : process (CLOCK)
    begin                
        if (CLOCK'event and CLOCK = '1') then
            case (memory_state) is
                when s0 =>
                    if (pmt_ready = '1') then--If the pmt value are ready
                        if ( pmt_t > thr(6 downto 0)) then--Check PMT event for pmt_t NEW VALUE aganist PMT_THR1
                            pmt_ev <= '1';
                        end if;
                        pmt_ecsum <= pmt_ecsum + ("00" & pmt_t) + ("00" & pmt_b);--Storage the PMT_t value for the sum in EC
                        
                        memory_state <= s1;
                    else
                        memory_state <= s0;
                        event_rdy <= '0';
                        event_data_s <= "0000";
                    end if;
                when s1 =>
                    if ( pmt_b > thr(6 downto 0)) then--Check PMT event for pmt_b NEW VALUE aganist PMT_THR1
                        pmt_ev <= '1';
                    end if;
                    --Write PMT value in memory
                    dina_cirmem(22 downto 16) <= pmt_t;
                    dina_cirmem(15 downto 9)  <= pmt_b;
                        
                    --Add new PMT value to the old PMT value
                    add_8tA <= pmt_t;--New value
                    add_8bA <= pmt_b;--New value
                    addra_cirmem_old <= addra_cirmem;--Storage memory position
                        
                    --Check the end of the EC,if yes,storage pmt_ecsum value
                    if ( ec_half = '1' ) then
                        dina_cirmem(8 downto 0) <= pmt_ecsum;
                        ec_cnt_s <= ec_cnt_s + ("0" & pmt_ecsum);--Sum pmt_ecsum over 3EC
                        if ( pmt_ecsum > thr(23 downto 15) ) then--Check EC event aganist EC_THR1 (New value)
                            ec_ev <= '1';
                        end if;
                    end if;
                    wea_cirmem <= "1";--Enable write in memory
                    memory_state <= s2;
                when s2 =>
                    wea_cirmem <= "0";
                    --Check pmt_col (old PMT value)
                    if ( addra_cirmem > "0101" ) then--Secold half of the MEMORY
                        addra_cirmem <= addra_cirmem - 6;--Old PMT value memory (first half of the memory)
                    else
                        addra_cirmem <= addra_cirmem + 6;--Old PMT value memory (second half of the memory)
                    end if;
                    memory_state <= s3;
                when s3 =>
                    --Memory delay
                    memory_state <= s4;
                when s4 =>
                    --Memory delay
                    memory_state <= s5;
                when s5 =>
                    --Add new PMT value to the old PMT value
                    add_8tB <= douta_cirmem(22 downto 16);--Old value
                    add_8bB <= douta_cirmem(15 downto 9);--Old value
                    
                    if ( ec_half = '1' ) then
                        pmt_2ecsum <= ("0" & douta_cirmem(8 downto 0)) + ("0" & pmt_ecsum);--PMT count over 2GTU
                        pmt_ecsum <= "000000000";
                    end if;
                    memory_state <= s6;
                when s6 =>
                    --Check the end of the EC
                    if ( ec_half = '1' ) then
                        if ( pmt_2ecsum > thr(33 downto 24) ) then--Check EC event aganist EC_THR2
                            ec_ev2 <= '1';
                        end if;
                        pmt_2ecsum <= "0000000000";
                    end if;
                    --Adder DELAY
                    memory_state <= s7;
                when s7 =>
                    --Adder DELAY
                    memory_state <= s8;
                when s8 =>
                    --Now the PMT sum value over 2 GTU are ready
                    if ( add_8tS > thr(14 downto 7) ) then --Check 2PMT event for 2pmt_t
                        pmt2_ev <= '1';
                    end if;
                    memory_state <= s9;
                when s9 =>
                     if ( add_8bS > thr(14 downto 7) ) then --Check 2PMT event for 2pmt_b
                        pmt2_ev <= '1';
                    end if;
                    memory_state <= s10;  
                when s10 =>
                    --Check EVENT
                    if ( addra_cirmem_old = "0101" or addra_cirmem_old = "1011") then--GTU END
                        event_data_s(0)            <= pmt_ev;  --Update PMT event
                        event_data_s(1)            <= pmt2_ev; --Update 2PMT event
                        event_data_s(2)            <= ec_ev;   --Update EC event
                        event_data_s(3)            <= ec_ev2;  --Update 2EC event
                        
                        pmt_ev  <= '0';
                        pmt2_ev <= '0';
                        ec_ev   <= '0';
                        ec_ev2  <= '0';
                        
                        ec_cnt_rdy <= '1';--Enable the read of ec_cnt (counter for 3EC)
                        ec_cnt <= ec_cnt_s;
                        ec_cnt_s <= "0000000000";
                    end if;
                    memory_state <= s11;
                when s11 =>
                    if ( addra_cirmem_old = "1011" ) then--Last memory position
                        addra_cirmem <= "0000";--Reset to First memory position
                    else
                        addra_cirmem <= addra_cirmem_old +1;--Increase memory position
                    end if;
                    
                    if ( event_data_s > 0 ) then--EVENT,send ready bit and event_data
                        event_data <= event_data_s;
                        event_rdy <= '1';--Enable event read
                    end if;        
                    
                    if ( ec_half = '0' ) then--Counter for the end of the EC
                        ec_half <= '1';
                    else
                        ec_half <= '0';
                    end if;
                    ec_cnt_rdy <= '0';
                    memory_state <= s0;
            end case;
        end if;
    end process;
				        	
end arch_ec;