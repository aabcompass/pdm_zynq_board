----------------------------------------------------------------------------------
-- Company: INFN TORINO
-- Engineer: M.Mignone
-- 
-- Create Date:    14:11:24 06/2016 
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

entity EC0EC1EC2 is port (
	CLOCK				        :	in	std_logic;
	data_s				        :	in	std_logic_vector(15 downto 0);
	frame_s				        :	in	std_logic;
	ec_event                    :   out std_logic;
	empty_sum_fifo              :   out std_logic;
	rd_en_sum_fifo              :   in  std_logic;
	dout_sum_fifo               :   out std_logic_vector(239 downto 0);
	--Dataoutput for L2
	rd_clk                      :   in  std_logic;
	empty_sum_fifo_l1           :   out std_logic;
    rd_en_sum_fifo_l1           :   in  std_logic;
    dout_sum_fifo_l1            :   out std_logic_vector(239 downto 0)
	);
	
end EC0EC1EC2;

architecture arch_ec of EC0EC1EC2 is

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
    signal	full_sum_fifo	  : std_logic;
	
	--SUM_FIFO L1 (dataoutput for L2)
    signal  din_sum_fifo_l1      : std_logic_vector(239 downto 0);
    signal  wr_en_sum_fifo_l1    : std_logic := '0';
    signal  full_sum_fifo_l1     : std_logic;
	
	--SQRT calculation
	type   state_sqrt_type     is  (s0,s1);
	signal state_sqrt         : state_sqrt_type := s0;
	
	--CIRCULAR BUFFER MEMORY
	signal  wea_cir                     :  std_logic_vector(0 downto 0) := "0";       
    signal  addra_cir                   :  std_logic_vector(8 downto 0) := ( others => '0');
    signal  dina_cir                    :  std_logic_vector(127 downto 0) := ( others => '0');
    signal  douta_cir                   :  std_logic_vector(127 downto 0);
    
    type    state_cir_type              is (s0,s1,s2,s3,s4,s5,s6,s7);
    signal  state_cir                   :   state_cir_type := s0;
    signal  column_cnt                  :  std_logic_vector(8 downto 0) := ( others => '0');
    signal  cir_rdy                     :  std_logic := '0';
    
    --FIFO for CIRCULAR BUFFER
    signal  din_cir_fifo                :  std_logic_vector(127 downto 0) := ( others => '0');
    signal  wr_en_cir_fifo              :  std_logic := '0';
    signal  rd_en_cir_fifo              :  std_logic := '0';
    signal  dout_cir_fifo               :  std_logic_vector(127 downto 0) := ( others => '0');
    signal  full_cir_fifo               :  std_logic;
    signal  empty_cir_fifo              :  std_logic;
    
    type    state_cir_fifo_type         is (s0,s1);
    signal  state_cir_fifo              :   state_cir_fifo_type := s0;
    signal  count_cir_rdy               :  std_logic_vector(2 downto 0) := ( others => '0');
   
    --FIFO circular buffer SUM
    signal accu_11_l0B                 :  std_logic_vector(7 downto 0) := ( others => '0');
    signal accu_11_l0Q                 :  std_logic_vector(10 downto 0);
     
    signal accu_11_l1B                 :  std_logic_vector(7 downto 0) := ( others => '0');
    signal accu_11_l1Q                 :  std_logic_vector(10 downto 0);
     
    signal accu_11_l2B                 :  std_logic_vector(7 downto 0) := ( others => '0');
    signal accu_11_l2Q                 :  std_logic_vector(10 downto 0);
     
    signal accu_11_l3B                 :  std_logic_vector(7 downto 0) := ( others => '0');
    signal accu_11_l3Q                 :  std_logic_vector(10 downto 0);
     
    signal accu_11_l4B                 :  std_logic_vector(7 downto 0) := ( others => '0');
    signal accu_11_l4Q                 :  std_logic_vector(10 downto 0);
     
    signal accu_11_l5B                 :  std_logic_vector(7 downto 0) := ( others => '0');
    signal accu_11_l5Q                 :  std_logic_vector(10 downto 0);
    
    signal accu_11_l6B                 :  std_logic_vector(7 downto 0) := ( others => '0');
    signal accu_11_l6Q                 :  std_logic_vector(10 downto 0);
     
    signal accu_11_l7B                 :  std_logic_vector(7 downto 0) := ( others => '0');
    signal accu_11_l7Q                 :  std_logic_vector(10 downto 0);
    
    signal accu_11_l8B                 :  std_logic_vector(7 downto 0) := ( others => '0');
    signal accu_11_l8Q                 :  std_logic_vector(10 downto 0);
     
    signal accu_11_l9B                 :  std_logic_vector(7 downto 0) := ( others => '0');
    signal accu_11_l9Q                 :  std_logic_vector(10 downto 0);
     
    signal accu_11_l10B                 :  std_logic_vector(7 downto 0) := ( others => '0');
    signal accu_11_l10Q                 :  std_logic_vector(10 downto 0);
     
    signal accu_11_l11B                 :  std_logic_vector(7 downto 0) := ( others => '0');
    signal accu_11_l11Q                 :  std_logic_vector(10 downto 0);
     
    signal accu_11_l12B                 :  std_logic_vector(7 downto 0) := ( others => '0');
    signal accu_11_l12Q                 :  std_logic_vector(10 downto 0);
     
    signal accu_11_l13B                 :  std_logic_vector(7 downto 0) := ( others => '0');
    signal accu_11_l13Q                 :  std_logic_vector(10 downto 0);
     
    signal accu_11_l14B                 :  std_logic_vector(7 downto 0) := ( others => '0');
    signal accu_11_l14Q                 :  std_logic_vector(10 downto 0);
     
    signal accu_11_l15B                 :  std_logic_vector(7 downto 0) := ( others => '0');
    signal accu_11_l15Q                 :  std_logic_vector(10 downto 0);
    
    signal  accu_11_SCLR                :  std_logic := '0';
    
    type    state_cir_sum_type          is  (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12);
    signal  state_cir_sum               :  state_cir_sum_type := s0;
    signal  accu8_rdy                   :  std_logic := '0';
	
	--SQRT
	signal  s_axis_cartesian_tvalid     :  std_logic := '0';
    signal  s_axis_cartesian_tdata_l0   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tvalid_l0       :  std_logic;
    signal  m_axis_dout_tdata_l0        :  std_logic_vector(7 downto 0);
	
    signal  s_axis_cartesian_tdata_l1   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l1        :  std_logic_vector(7 downto 0);
	
    signal  s_axis_cartesian_tdata_l2   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l2        :  std_logic_vector(7 downto 0);
	
		
    signal  s_axis_cartesian_tdata_l3   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l3        :  std_logic_vector(7 downto 0);
	
    signal  s_axis_cartesian_tdata_l4   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l4        :  std_logic_vector(7 downto 0);
	
		
    signal  s_axis_cartesian_tdata_l5   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l5        :  std_logic_vector(7 downto 0);
	
    signal  s_axis_cartesian_tdata_l6   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l6        :  std_logic_vector(7 downto 0);
	
		
    signal  s_axis_cartesian_tdata_l7   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l7        :  std_logic_vector(7 downto 0);
	
    signal  s_axis_cartesian_tdata_l8   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l8        :  std_logic_vector(7 downto 0);
	
		
    signal  s_axis_cartesian_tdata_l9   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l9        :  std_logic_vector(7 downto 0);
	
    signal  s_axis_cartesian_tdata_l10   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l10        :  std_logic_vector(7 downto 0);
	
		
    signal  s_axis_cartesian_tdata_l11   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tvalid_l11       :  std_logic;
    signal  m_axis_dout_tdata_l11        :  std_logic_vector(7 downto 0);
	
    signal  s_axis_cartesian_tdata_l12   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l12        :  std_logic_vector(7 downto 0);
	
		
    signal  s_axis_cartesian_tdata_l13   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l13        :  std_logic_vector(7 downto 0);
	
    signal  s_axis_cartesian_tdata_l14   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l14        :  std_logic_vector(7 downto 0);
	
		
    signal  s_axis_cartesian_tdata_l15   :  std_logic_vector(15 downto 0) := ( others => '0');
    signal  m_axis_dout_tdata_l15        :  std_logic_vector(7 downto 0);
    
    --SUM/16 calculation
    signal  sum16_l0                     :   std_logic_vector(10 downto 0) := ( others => '0');   
    signal  sum16_l1                     :   std_logic_vector(10 downto 0) := ( others => '0');   
    signal  sum16_l2                     :   std_logic_vector(10 downto 0) := ( others => '0');   
    signal  sum16_l3                     :   std_logic_vector(10 downto 0) := ( others => '0');   
    signal  sum16_l4                     :   std_logic_vector(10 downto 0) := ( others => '0');   
    signal  sum16_l5                     :   std_logic_vector(10 downto 0) := ( others => '0');   
    signal  sum16_l6                     :   std_logic_vector(10 downto 0) := ( others => '0');   
    signal  sum16_l7                     :   std_logic_vector(10 downto 0) := ( others => '0');   
    signal  sum16_l8                     :   std_logic_vector(10 downto 0) := ( others => '0');   
    signal  sum16_l9                     :   std_logic_vector(10 downto 0) := ( others => '0');   
    signal  sum16_l10                    :   std_logic_vector(10 downto 0) := ( others => '0');   
    signal  sum16_l11                    :   std_logic_vector(10 downto 0) := ( others => '0');   
    signal  sum16_l12                    :   std_logic_vector(10 downto 0) := ( others => '0');   
    signal  sum16_l13                    :   std_logic_vector(10 downto 0) := ( others => '0');   
    signal  sum16_l14                    :   std_logic_vector(10 downto 0) := ( others => '0');   
    signal  sum16_l15                    :   std_logic_vector(10 downto 0) := ( others => '0');   

    type    state_sum16_type            is   (s0,s1,s2,s3);
    signal  state_sum16                  :   state_sum16_type := s0;
    signal  sum16_rdy                    :   std_logic := '0';
    
    --S calculation
    signal  add_12_l0A                   :   std_logic_vector(10 downto 0) := ( others => '0');
    signal  add_12_l0B                   :   std_logic_vector(8 downto 0) := ( others => '0');
    signal  add_12_l0S                   :   std_logic_vector(11 downto 0);
    
    signal  add_12_l1A                   :   std_logic_vector(10 downto 0) := ( others => '0');
    signal  add_12_l1B                   :   std_logic_vector(8 downto 0) := ( others => '0');
    signal  add_12_l1S                   :   std_logic_vector(11 downto 0);
    
    signal  add_12_l2A                   :   std_logic_vector(10 downto 0) := ( others => '0');
    signal  add_12_l2B                   :   std_logic_vector(8 downto 0) := ( others => '0');
    signal  add_12_l2S                   :   std_logic_vector(11 downto 0);
    
    signal  add_12_l3A                   :   std_logic_vector(10 downto 0) := ( others => '0');
    signal  add_12_l3B                   :   std_logic_vector(8 downto 0) := ( others => '0');
    signal  add_12_l3S                   :   std_logic_vector(11 downto 0);
    
    signal  add_12_l4A                   :   std_logic_vector(10 downto 0) := ( others => '0');
    signal  add_12_l4B                   :   std_logic_vector(8 downto 0) := ( others => '0');
    signal  add_12_l4S                   :   std_logic_vector(11 downto 0);
    
    signal  add_12_l5A                   :   std_logic_vector(10 downto 0) := ( others => '0');
    signal  add_12_l5B                   :   std_logic_vector(8 downto 0) := ( others => '0');
    signal  add_12_l5S                   :   std_logic_vector(11 downto 0);
    
    signal  add_12_l6A                   :   std_logic_vector(10 downto 0) := ( others => '0');
    signal  add_12_l6B                   :   std_logic_vector(8 downto 0) := ( others => '0');
    signal  add_12_l6S                   :   std_logic_vector(11 downto 0);
    
    signal  add_12_l7A                   :   std_logic_vector(10 downto 0) := ( others => '0');
    signal  add_12_l7B                   :   std_logic_vector(8 downto 0) := ( others => '0');
    signal  add_12_l7S                   :   std_logic_vector(11 downto 0);
    
    signal  add_12_l8A                   :   std_logic_vector(10 downto 0) := ( others => '0');
    signal  add_12_l8B                   :   std_logic_vector(8 downto 0) := ( others => '0');
    signal  add_12_l8S                   :   std_logic_vector(11 downto 0);
    
    signal  add_12_l9A                   :   std_logic_vector(10 downto 0) := ( others => '0');
    signal  add_12_l9B                   :   std_logic_vector(8 downto 0) := ( others => '0');
    signal  add_12_l9S                   :   std_logic_vector(11 downto 0);
    
    signal  add_12_l10A                  :   std_logic_vector(10 downto 0) := ( others => '0');
    signal  add_12_l10B                  :   std_logic_vector(8 downto 0) := ( others => '0');
    signal  add_12_l10S                  :   std_logic_vector(11 downto 0);
    
    signal  add_12_l11A                  :   std_logic_vector(10 downto 0) := ( others => '0');
    signal  add_12_l11B                  :   std_logic_vector(8 downto 0) := ( others => '0');
    signal  add_12_l11S                  :   std_logic_vector(11 downto 0);
    
    signal  add_12_l12A                  :   std_logic_vector(10 downto 0) := ( others => '0');
    signal  add_12_l12B                  :   std_logic_vector(8 downto 0) := ( others => '0');
    signal  add_12_l12S                  :   std_logic_vector(11 downto 0);
    
    signal  add_12_l13A                  :   std_logic_vector(10 downto 0) := ( others => '0');
    signal  add_12_l13B                  :   std_logic_vector(8 downto 0) := ( others => '0');
    signal  add_12_l13S                  :   std_logic_vector(11 downto 0);
    
    signal  add_12_l14A                  :   std_logic_vector(10 downto 0) := ( others => '0');
    signal  add_12_l14B                  :   std_logic_vector(8 downto 0) := ( others => '0');
    signal  add_12_l14S                  :   std_logic_vector(11 downto 0);
    
    signal  add_12_l15A                  :   std_logic_vector(10 downto 0) := ( others => '0');
    signal  add_12_l15B                  :   std_logic_vector(8 downto 0) := ( others => '0');
    signal  add_12_l15S                  :   std_logic_vector(11 downto 0);
    
    type    state_S_type                  is   (s0,s1);
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
    signal  dina_smem                     :    std_logic_vector(191 downto 0) := ( others => '0');
    signal  addrb_smem                    :    std_logic_vector(6 downto 0) := "0110000";--Init value ->Second half of memory
    signal  doutb_smem                    :    std_logic_vector(191 downto 0);
    
    --GTU counter
    type    state_gtu_cnt_type            is (s0,s1);
    signal  state_gtu_cnt                 :   state_gtu_cnt_type := s0;
    
    --S MEMORY address switch
    type    state_adr_type                is (s0,s1);
    signal  state_adr                     :   state_adr_type := s0;
    signal  gtu_cnt                       :   std_logic_vector(7 downto 0) := ( others => '0');
    signal  addrb_start                   :   std_logic_vector(6 downto 0) := "0110000";--Init value ->second half of memory (48)
    signal  addrb_stop                    :   std_logic_vector(6 downto 0) := "1011111";--Init value ->second half of memory (95)
    
    --Event check
    signal  col_event                     :   std_logic_vector(15 downto 0) := ( others => '0');
    type    state_event_type              is (s0,s1,s2,s3);
    signal  state_event                   :   state_event_type := s0;
    signal  switch_addr                   :   std_logic := '0';
    
	
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
	
	COMPONENT SUM_FIFO_L1
      PORT (
        wr_clk : IN STD_LOGIC;
        rd_clk : IN STD_LOGIC;
        din : IN STD_LOGIC_VECTOR(239 DOWNTO 0);
        wr_en : IN STD_LOGIC;
        rd_en : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR(239 DOWNTO 0);
        full : OUT STD_LOGIC;
        empty : OUT STD_LOGIC
      );
    END COMPONENT;
	
	COMPONENT CIRCULAR_BUFFER
      PORT (
        clka : IN STD_LOGIC;
        wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
        dina : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
      );
    END COMPONENT;
    
    COMPONENT CIRC_MEM_FIFO
      PORT (
        clk : IN STD_LOGIC;
        din : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
        wr_en : IN STD_LOGIC;
        rd_en : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
        full : OUT STD_LOGIC;
        empty : OUT STD_LOGIC
      );
    END COMPONENT;
    
    COMPONENT ACCUMULATOR_11
      PORT (
        B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        CLK : IN STD_LOGIC;
        SCLR : IN STD_LOGIC;
        Q : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
      );
    END COMPONENT;
	
	COMPONENT SQRT_15
      PORT (
        aclk                    : IN STD_LOGIC;
        s_axis_cartesian_tvalid : IN STD_LOGIC;
        s_axis_cartesian_tdata  : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        m_axis_dout_tvalid      : OUT STD_LOGIC;
        m_axis_dout_tdata       : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
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
    
    COMPONENT S_MEMORY
      PORT (
        clka : IN STD_LOGIC;
        wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
        dina : IN STD_LOGIC_VECTOR(191 DOWNTO 0);
        clkb : IN STD_LOGIC;
        addrb : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
        doutb : OUT STD_LOGIC_VECTOR(191 DOWNTO 0)
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
        full => full_sum_fifo,
        empty => empty_sum_fifo
	);
	
	summ_fifo_L1 : SUM_FIFO_L1
	PORT MAP (
        wr_clk => CLOCK,
        rd_clk => rd_clk,
        din => din_sum_fifo_l1,
        wr_en => wr_en_sum_fifo_l1,
        rd_en => rd_en_sum_fifo_l1,
        dout => dout_sum_fifo_l1,
        full => full_sum_fifo_l1,
        empty => empty_sum_fifo_l1
    );
	
	CIRCULAR_MEM : CIRCULAR_BUFFER
      PORT MAP (
        clka => CLOCK,
        wea => wea_cir,
        addra => addra_cir,
        dina => dina_cir,
        douta => douta_cir
     );
     
    FIFO_BUFFER : CIRC_MEM_FIFO
       PORT MAP (
         clk => CLOCK,
         din => din_cir_fifo,
         wr_en => wr_en_cir_fifo,
         rd_en => rd_en_cir_fifo,
         dout => dout_cir_fifo,
         full => full_cir_fifo,
         empty => empty_cir_fifo
       );
       
    ACCU_11_l0 : ACCUMULATOR_11
       PORT MAP (
         B => accu_11_l0B,
         CLK => CLOCK,
         SCLR => accu_11_SCLR,
         Q => accu_11_l0Q
       );
       
    ACCU_11_l1 : ACCUMULATOR_11
       PORT MAP (
         B => accu_11_l1B,
         CLK => CLOCK,
         SCLR => accu_11_SCLR,
         Q => accu_11_l1Q
       );
       
    ACCU_11_l2 : ACCUMULATOR_11
       PORT MAP (
         B => accu_11_l2B,
         CLK => CLOCK,
         SCLR => accu_11_SCLR,
         Q => accu_11_l2Q
       );
       
    ACCU_11_l3 : ACCUMULATOR_11
       PORT MAP (
         B => accu_11_l3B,
         CLK => CLOCK,
         SCLR => accu_11_SCLR,
         Q => accu_11_l3Q
       );
       
    ACCU_11_l4 : ACCUMULATOR_11
       PORT MAP (
         B => accu_11_l4B,
         CLK => CLOCK,
         SCLR => accu_11_SCLR,
         Q => accu_11_l4Q
       );
              
    ACCU_11_l5 : ACCUMULATOR_11
       PORT MAP (
         B => accu_11_l5B,
         CLK => CLOCK,
         SCLR => accu_11_SCLR,
         Q => accu_11_l5Q
       );
    ACCU_11_l6 : ACCUMULATOR_11
       PORT MAP (
         B => accu_11_l6B,
         CLK => CLOCK,
         SCLR => accu_11_SCLR,
         Q => accu_11_l6Q
       );
              
    ACCU_11_l7 : ACCUMULATOR_11
       PORT MAP (
         B => accu_11_l7B,
         CLK => CLOCK,
         SCLR => accu_11_SCLR,
         Q => accu_11_l7Q
       );
       
    ACCU_11_l8 : ACCUMULATOR_11
       PORT MAP (
         B => accu_11_l8B,
         CLK => CLOCK,
         SCLR => accu_11_SCLR,
         Q => accu_11_l8Q
       );
       
    ACCU_11_l9 : ACCUMULATOR_11
       PORT MAP (
         B => accu_11_l9B,
         CLK => CLOCK,
         SCLR => accu_11_SCLR,
         Q => accu_11_l9Q
       );
       
    ACCU_11_l10 : ACCUMULATOR_11
       PORT MAP (
         B => accu_11_l10B,
         CLK => CLOCK,
         SCLR => accu_11_SCLR,
         Q => accu_11_l10Q
       );
       
    ACCU_11_l11 : ACCUMULATOR_11
       PORT MAP (
         B => accu_11_l11B,
         CLK => CLOCK,
         SCLR => accu_11_SCLR,
         Q => accu_11_l11Q
       );
       
    ACCU_11_l12 : ACCUMULATOR_11
       PORT MAP (
         B => accu_11_l12B,
         CLK => CLOCK,
         SCLR => accu_11_SCLR,
         Q => accu_11_l12Q
       );
              
    ACCU_11_l13 : ACCUMULATOR_11
       PORT MAP (
         B => accu_11_l13B,
         CLK => CLOCK,
         SCLR => accu_11_SCLR,
         Q => accu_11_l13Q
       );
    ACCU_11_l14 : ACCUMULATOR_11
       PORT MAP (
         B => accu_11_l14B,
         CLK => CLOCK,
         SCLR => accu_11_SCLR,
         Q => accu_11_l14Q
       );
              
    ACCU_11_l15 : ACCUMULATOR_11
       PORT MAP (
         B => accu_11_l15B,
         CLK => CLOCK,
         SCLR => accu_11_SCLR,
         Q => accu_11_l15Q
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
      
    add_12_l0 : ADDER_12
      PORT MAP (
        A => add_12_l0A,
        B => add_12_l0B,
        CLK => CLOCK,
        S => add_12_l0S
      );
      
    add_12_l1 : ADDER_12
      PORT MAP (
        A => add_12_l1A,
        B => add_12_l1B,
        CLK => CLOCK,
        S => add_12_l1S
      );
      
    add_12_l2 : ADDER_12
      PORT MAP (
        A => add_12_l2A,
        B => add_12_l2B,
        CLK => CLOCK,
        S => add_12_l2S
      );
      
    add_12_l3 : ADDER_12
      PORT MAP (
        A => add_12_l3A,
        B => add_12_l3B,
        CLK => CLOCK,
        S => add_12_l3S
      );
      
    add_12_l4 : ADDER_12
      PORT MAP (
        A => add_12_l4A,
        B => add_12_l4B,
        CLK => CLOCK,
        S => add_12_l4S
      );
      
    add_12_l5 : ADDER_12
      PORT MAP (
        A => add_12_l5A,
        B => add_12_l5B,
        CLK => CLOCK,
        S => add_12_l5S
      );
      
    add_12_l6 : ADDER_12
      PORT MAP (
        A => add_12_l6A,
        B => add_12_l6B,
        CLK => CLOCK,
        S => add_12_l6S
      );
      
    add_12_l7 : ADDER_12
      PORT MAP (
        A => add_12_l7A,
        B => add_12_l7B,
        CLK => CLOCK,
        S => add_12_l7S
      );
      
    add_12_l8 : ADDER_12
      PORT MAP (
        A => add_12_l8A,
        B => add_12_l8B,
        CLK => CLOCK,
        S => add_12_l8S
      );
      
    add_12_l9 : ADDER_12
      PORT MAP (
        A => add_12_l9A,
        B => add_12_l9B,
        CLK => CLOCK,
        S => add_12_l9S
      );
      
    add_12_l10 : ADDER_12
      PORT MAP (
        A => add_12_l10A,
        B => add_12_l10B,
        CLK => CLOCK,
        S => add_12_l10S
      );
      
    add_12_l11 : ADDER_12
      PORT MAP (
        A => add_12_l11A,
        B => add_12_l11B,
        CLK => CLOCK,
        S => add_12_l11S
      );
      
    add_12_l12 : ADDER_12
      PORT MAP (
        A => add_12_l12A,
        B => add_12_l12B,
        CLK => CLOCK,
        S => add_12_l12S
      );
      
    add_12_l13 : ADDER_12
      PORT MAP (
        A => add_12_l13A,
        B => add_12_l13B,
        CLK => CLOCK,
        S => add_12_l13S
      );
      
    add_12_l14 : ADDER_12
      PORT MAP (
        A => add_12_l14A,
        B => add_12_l14B,
        CLK => CLOCK,
        S => add_12_l14S
      );
      
    add_12_l15 : ADDER_12
      PORT MAP (
        A => add_12_l15A,
        B => add_12_l15B,
        CLK => CLOCK,
        S => add_12_l15S
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
				if (bitcount = "111") then--Now we have 8 bits ready in "pixel_value"
					pixel_rdy	<= '1';--Pixel ready,enable the reading
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
						--Copy the 128 GTU sum in FIFO_SUM_L1 (for L2 processing)
						wr_en_sum_fifo_l1 <= '1';--Write the value on fifo
                        din_sum_fifo_l1(14 downto 0)  <= sum_bus_l0;
                        din_sum_fifo_l1(29 downto 15) <= sum_bus_l1;
                        din_sum_fifo_l1(44 downto 30) <= sum_bus_l2;
                        din_sum_fifo_l1(59 downto 45) <= sum_bus_l3;
                        din_sum_fifo_l1(74 downto 60) <= sum_bus_l4;
                        din_sum_fifo_l1(89 downto 75) <= sum_bus_l5;
                        din_sum_fifo_l1(104 downto 90) <= sum_bus_l6;
                        din_sum_fifo_l1(119 downto 105) <= sum_bus_l7;
                        din_sum_fifo_l1(134 downto 120) <= sum_bus_l8;
                        din_sum_fifo_l1(149 downto 135) <= sum_bus_l9;
                        din_sum_fifo_l1(164 downto 150) <= sum_bus_l10;
                        din_sum_fifo_l1(179 downto 165) <= sum_bus_l11;
                        din_sum_fifo_l1(194 downto 180) <= sum_bus_l12;
                        din_sum_fifo_l1(209 downto 195) <= sum_bus_l13;
                        din_sum_fifo_l1(224 downto 210) <= sum_bus_l14;
                        din_sum_fifo_l1(239 downto 225) <= sum_bus_l15;
                                                
						state_fifo128 <= cp_stop;
				    else
				        state_fifo128 <= cp_start;
					end if;
				when cp_stop =>
					wr_en_sum_fifo <= '0';
					wr_en_sum_fifo_l1 <= '0';
					state_fifo128 <= cp_start;
			end case;
		end if;
	end process;
	
	CIRCULAR_MEMORY : process (CLOCK)
	--Storage GTU columns in a circolar memory (8 GTU DEEP) 
	begin
	   if (CLOCK'event and CLOCK = '1') then
	       case (state_cir) is
	           when s0 =>
	               if (pixel_rdy = '1') then--Check if the pixels value are ready
	                   --Write the pixels value in the circular memory (GTU 1)
	                   wea_cir <= "1";
	                   addra_cir <= column_cnt;
	                   dina_cir(7 downto 0)     <= pixel_value0_s;
	                   dina_cir(15 downto 8)    <= pixel_value1_s;
                       dina_cir(23 downto 16)   <= pixel_value2_s;
                       dina_cir(31 downto 24)   <= pixel_value3_s;
                       dina_cir(39 downto 32)   <= pixel_value4_s;
                       dina_cir(47 downto 40)   <= pixel_value5_s;
                       dina_cir(55 downto 48)   <= pixel_value6_s;
                       dina_cir(63 downto 56)   <= pixel_value7_s;
                       dina_cir(71 downto 64)   <= pixel_value8_s;
                       dina_cir(79 downto 72)   <= pixel_value9_s;
                       dina_cir(87 downto 80)   <= pixel_value10_s;
                       dina_cir(95 downto 88)   <= pixel_value11_s;
                       dina_cir(103 downto 96)  <= pixel_value12_s;
                       dina_cir(111 downto 104) <= pixel_value13_s;
                       dina_cir(119 downto 112) <= pixel_value14_s;
                       dina_cir(127 downto 120) <= pixel_value15_s;
	                   state_cir <= s1;
	               else
	                   state_cir <= s0;
	               end if;
	           when s1 =>
	               wea_cir <= "0"; 
	               --Increment the memory address to the next GTU position
	               --for SUM calculation (Read GTU 2)
                   --Increase the address of 48 position to the next GTU memory position
                   if (addra_cir >= "101010000") then
                       addra_cir <= addra_cir - "101010000";
                   else
                       addra_cir <= addra_cir + 48;
                   end if;
                   state_cir <= s2;
               when s2 =>
                   --Increment the memory address to the next GTU position
                   --for SUM calculation (Read GTU 3)
                   if (addra_cir >= "101010000") then
                       addra_cir <= addra_cir - "101010000";
                   else
                       addra_cir <= addra_cir + 48;
                   end if;
                   state_cir <= s3;
                   --Now the RAM output is ready (Latency =2) enable the storage in the FIFO
                   --(From now read Position 1 and the next positions) 
                   cir_rdy <= '1';
               when s3 =>
                   --Increment the memory address to the next GTU position
                   --for SUM calculation (Read GTU 4) 
                   if (addra_cir >= "101010000") then
                       addra_cir <= addra_cir - "101010000";
                   else
                       addra_cir <= addra_cir + 48;
                   end if;
                   state_cir <= s4;
                   cir_rdy <= '0';
               when s4 =>  
                   --Increment the memory address to the next GTU position
                   --for SUM calculation (Read GTU 5)
                   if (addra_cir >= "101010000") then
                       addra_cir <= addra_cir - "101010000";
                   else
                       addra_cir <= addra_cir + 48;
                   end if;
                   state_cir <= s5;
               when s5 =>
                   --Increment the memory address to the next GTU position
                   --for SUM calculation (Read GTU 6)
                   if (addra_cir >= "101010000") then
                       addra_cir <= addra_cir - "101010000";
                   else
                       addra_cir <= addra_cir + 48;
                   end if;                  
                   state_cir <= s6;
               when s6 =>
                   --Increment the memory address to the next GTU position
                   --for SUM calculation (Read GTU 7)
                   if (addra_cir >= "101010000") then
                       addra_cir <= addra_cir - "101010000";
                   else
                       addra_cir <= addra_cir + 48;
                   end if;
                   state_cir <= s7;   
               when s7 =>
                   -- Read GTU 8
                   if (addra_cir >= "101010000") then
                       addra_cir <= addra_cir - "101010000";
                   else
                       addra_cir <= addra_cir + 48;
                   end if;
	               --Check if we are in the last column of the circular buffer (GTU columns X 8)
                   if (column_cnt = "101111111") then
                       column_cnt <= "000000000";--Yes,reset the memory address
                   else
                       column_cnt <= column_cnt + 1;--No,increase memory address to the next column
                   end if;
                   
	               state_cir <= s0;
	       end case;
	   end if;
	end process;
	
	CIRCULAR_MEMORY_FIFO : process (CLOCK)
    --Storage the CIRCULAR MEMORY in a FIFO 
    begin
       if (CLOCK'event and CLOCK = '1') then
           case (state_cir_fifo) is
               when s0 =>
                   if (cir_rdy = '1') then--Check if the 8 GTU in the circular memory are ready
                        wr_en_cir_fifo <= '1';--Yes write value on FIFO (FIFO_BUFFER)
                        din_cir_fifo <= douta_cir;
                        count_cir_rdy <= count_cir_rdy +1;--Increase the 8 GTU counter (GTU1=>col.0,GTU2=>col.16,GTU3=>col.32..GTU8=>col.112)
                        state_cir_fifo <= s1;
                   else
                        wr_en_cir_fifo <= '0';--All column are in the FIFO,stop writing
                        state_cir_fifo <= s0;
                   end if;
               when s1 =>
                    din_cir_fifo <= douta_cir;              
                    if (count_cir_rdy = "111") then--Check if all the 8 GTU columns (in the last 8 GTU) are in the FIFO (col.0,48,96...336-1,49,97...337-47,95,...383)
                        state_cir_fifo <= s0;--Yes,check next 8 GTU columns (in the last 8 GTU)
                        count_cir_rdy <= "000";
                    else
                        count_cir_rdy <= count_cir_rdy +1;--No,increase the 8 GTU counter and continues write on FIFO
                    end if;
           end case;
       end if;
    end process;
    
    CIRCULAR_SUM : process (CLOCK)
    --Read the circular memory FIFO and calculate the SUM for 8 GTU (Column by column)
    begin
       if (CLOCK'event and CLOCK = '1') then
           case (state_cir_sum) is
               when s0 =>
                    if (empty_cir_fifo = '0') then
                       rd_en_cir_fifo <= '1';--Read cir_fifo
                       state_cir_sum <= s1;
                    end if;
                    accu8_rdy <= '0';
               when s1 =>
                    --Latency FIFO
                    state_cir_sum <= s2;
               when s2 =>
                    --Latency FIFO
                    state_cir_sum <= s3;
                when s3 =>
                    --Read GTU 1 (column 0..47 of the circular memory)
                    --Write value in ACCUMULATOR
                    accu_11_SCLR <= '0';
                    accu8_rdy <= '0';
                    accu_11_l0B <= dout_cir_fifo(7 downto 0);
                    accu_11_l1B <= dout_cir_fifo(15 downto 8);
                    accu_11_l2B <= dout_cir_fifo(23 downto 16);
                    accu_11_l3B <= dout_cir_fifo(31 downto 24);
                    accu_11_l4B <= dout_cir_fifo(39 downto 32);
                    accu_11_l5B <= dout_cir_fifo(47 downto 40);
                    accu_11_l6B <= dout_cir_fifo(55 downto 48);
                    accu_11_l7B <= dout_cir_fifo(63 downto 56);
                    accu_11_l8B <= dout_cir_fifo(71 downto 64);
                    accu_11_l9B <= dout_cir_fifo(79 downto 72);
                    accu_11_l10B <= dout_cir_fifo(87 downto 80);
                    accu_11_l11B <= dout_cir_fifo(95 downto 88);
                    accu_11_l12B <= dout_cir_fifo(103 downto 96);
                    accu_11_l13B <= dout_cir_fifo(111 downto 104);
                    accu_11_l14B <= dout_cir_fifo(119 downto 112);
                    accu_11_l15B <= dout_cir_fifo(127 downto 120);
                    state_cir_sum <= s4;
                when s4 =>
                    --Read GTU 2 (column 48..95 of the circular memory)
                    --Write value in ACCUMULATOR
                    accu_11_l0B <= dout_cir_fifo(7 downto 0);
                    accu_11_l1B <= dout_cir_fifo(15 downto 8);
                    accu_11_l2B <= dout_cir_fifo(23 downto 16);
                    accu_11_l3B <= dout_cir_fifo(31 downto 24);
                    accu_11_l4B <= dout_cir_fifo(39 downto 32);
                    accu_11_l5B <= dout_cir_fifo(47 downto 40);
                    accu_11_l6B <= dout_cir_fifo(55 downto 48);
                    accu_11_l7B <= dout_cir_fifo(63 downto 56);
                    accu_11_l8B <= dout_cir_fifo(71 downto 64);
                    accu_11_l9B <= dout_cir_fifo(79 downto 72);
                    accu_11_l10B <= dout_cir_fifo(87 downto 80);
                    accu_11_l11B <= dout_cir_fifo(95 downto 88);
                    accu_11_l12B <= dout_cir_fifo(103 downto 96);
                    accu_11_l13B <= dout_cir_fifo(111 downto 104);
                    accu_11_l14B <= dout_cir_fifo(119 downto 112);
                    accu_11_l15B <= dout_cir_fifo(127 downto 120);
                    state_cir_sum <= s5;
                when s5 =>
                    --Read GTU 3 (column 96..143 of the circular memory)
                    --Write value in ACCUMULATOR
                    accu_11_l0B <= dout_cir_fifo(7 downto 0);
                    accu_11_l1B <= dout_cir_fifo(15 downto 8);
                    accu_11_l2B <= dout_cir_fifo(23 downto 16);
                    accu_11_l3B <= dout_cir_fifo(31 downto 24);
                    accu_11_l4B <= dout_cir_fifo(39 downto 32);
                    accu_11_l5B <= dout_cir_fifo(47 downto 40);
                    accu_11_l6B <= dout_cir_fifo(55 downto 48);
                    accu_11_l7B <= dout_cir_fifo(63 downto 56);
                    accu_11_l8B <= dout_cir_fifo(71 downto 64);
                    accu_11_l9B <= dout_cir_fifo(79 downto 72);
                    accu_11_l10B <= dout_cir_fifo(87 downto 80);
                    accu_11_l11B <= dout_cir_fifo(95 downto 88);
                    accu_11_l12B <= dout_cir_fifo(103 downto 96);
                    accu_11_l13B <= dout_cir_fifo(111 downto 104);
                    accu_11_l14B <= dout_cir_fifo(119 downto 112);
                    accu_11_l15B <= dout_cir_fifo(127 downto 120);                    
                    state_cir_sum <= s6;
                when s6 =>
                    --Read GTU 4 (column 144.. of the circular memory)
                    --Write value in ACCUMULATOR
                    accu_11_l0B <= dout_cir_fifo(7 downto 0);
                    accu_11_l1B <= dout_cir_fifo(15 downto 8);
                    accu_11_l2B <= dout_cir_fifo(23 downto 16);
                    accu_11_l3B <= dout_cir_fifo(31 downto 24);
                    accu_11_l4B <= dout_cir_fifo(39 downto 32);
                    accu_11_l5B <= dout_cir_fifo(47 downto 40);
                    accu_11_l6B <= dout_cir_fifo(55 downto 48);
                    accu_11_l7B <= dout_cir_fifo(63 downto 56);
                    accu_11_l8B <= dout_cir_fifo(71 downto 64);
                    accu_11_l9B <= dout_cir_fifo(79 downto 72);
                    accu_11_l10B <= dout_cir_fifo(87 downto 80);
                    accu_11_l11B <= dout_cir_fifo(95 downto 88);
                    accu_11_l12B <= dout_cir_fifo(103 downto 96);
                    accu_11_l13B <= dout_cir_fifo(111 downto 104);
                    accu_11_l14B <= dout_cir_fifo(119 downto 112);
                    accu_11_l15B <= dout_cir_fifo(127 downto 120);
                    state_cir_sum <= s7;
                when s7 =>
                    --Read GTU 5 (column 192.. of the circular memory)
                    --Write value in ACCUMULATOR
                    accu_11_l0B <= dout_cir_fifo(7 downto 0);
                    accu_11_l1B <= dout_cir_fifo(15 downto 8);
                    accu_11_l2B <= dout_cir_fifo(23 downto 16);
                    accu_11_l3B <= dout_cir_fifo(31 downto 24);
                    accu_11_l4B <= dout_cir_fifo(39 downto 32);
                    accu_11_l5B <= dout_cir_fifo(47 downto 40);
                    accu_11_l6B <= dout_cir_fifo(55 downto 48);
                    accu_11_l7B <= dout_cir_fifo(63 downto 56);
                    accu_11_l8B <= dout_cir_fifo(71 downto 64);
                    accu_11_l9B <= dout_cir_fifo(79 downto 72);
                    accu_11_l10B <= dout_cir_fifo(87 downto 80);
                    accu_11_l11B <= dout_cir_fifo(95 downto 88);
                    accu_11_l12B <= dout_cir_fifo(103 downto 96);
                    accu_11_l13B <= dout_cir_fifo(111 downto 104);
                    accu_11_l14B <= dout_cir_fifo(119 downto 112);
                    accu_11_l15B <= dout_cir_fifo(127 downto 120);
                    state_cir_sum <= s8;
                when s8 =>
                    --Read GTU 6 (column 240 of the circular memory)
                    --Write value in ACCUMULATOR
                    rd_en_cir_fifo <= '0';--Stop read cir_fifo
                    accu_11_l0B <= dout_cir_fifo(7 downto 0);
                    accu_11_l1B <= dout_cir_fifo(15 downto 8);
                    accu_11_l2B <= dout_cir_fifo(23 downto 16);
                    accu_11_l3B <= dout_cir_fifo(31 downto 24);
                    accu_11_l4B <= dout_cir_fifo(39 downto 32);
                    accu_11_l5B <= dout_cir_fifo(47 downto 40);
                    accu_11_l6B <= dout_cir_fifo(55 downto 48);
                    accu_11_l7B <= dout_cir_fifo(63 downto 56);
                    accu_11_l8B <= dout_cir_fifo(71 downto 64);
                    accu_11_l9B <= dout_cir_fifo(79 downto 72);
                    accu_11_l10B <= dout_cir_fifo(87 downto 80);
                    accu_11_l11B <= dout_cir_fifo(95 downto 88);
                    accu_11_l12B <= dout_cir_fifo(103 downto 96);
                    accu_11_l13B <= dout_cir_fifo(111 downto 104);
                    accu_11_l14B <= dout_cir_fifo(119 downto 112);
                    accu_11_l15B <= dout_cir_fifo(127 downto 120);
                    state_cir_sum <= s9;
                when s9 =>
                    --Read GTU 7 (column 288 of the circular memory)
                    --Write value in ACCUMULATOR
                    accu_11_l0B <= dout_cir_fifo(7 downto 0);
                    accu_11_l1B <= dout_cir_fifo(15 downto 8);
                    accu_11_l2B <= dout_cir_fifo(23 downto 16);
                    accu_11_l3B <= dout_cir_fifo(31 downto 24);
                    accu_11_l4B <= dout_cir_fifo(39 downto 32);
                    accu_11_l5B <= dout_cir_fifo(47 downto 40);
                    accu_11_l6B <= dout_cir_fifo(55 downto 48);
                    accu_11_l7B <= dout_cir_fifo(63 downto 56);
                    accu_11_l8B <= dout_cir_fifo(71 downto 64);
                    accu_11_l9B <= dout_cir_fifo(79 downto 72);
                    accu_11_l10B <= dout_cir_fifo(87 downto 80);
                    accu_11_l11B <= dout_cir_fifo(95 downto 88);
                    accu_11_l12B <= dout_cir_fifo(103 downto 96);
                    accu_11_l13B <= dout_cir_fifo(111 downto 104);
                    accu_11_l14B <= dout_cir_fifo(119 downto 112);
                    accu_11_l15B <= dout_cir_fifo(127 downto 120);
                    state_cir_sum <= s10;
                when s10 =>
                    --Read GTU 8 (column 336.. of the circular memory)
                    --Write value in ACCUMULATOR
                    accu_11_l0B <= dout_cir_fifo(7 downto 0);
                    accu_11_l1B <= dout_cir_fifo(15 downto 8);
                    accu_11_l2B <= dout_cir_fifo(23 downto 16);
                    accu_11_l3B <= dout_cir_fifo(31 downto 24);
                    accu_11_l4B <= dout_cir_fifo(39 downto 32);
                    accu_11_l5B <= dout_cir_fifo(47 downto 40);
                    accu_11_l6B <= dout_cir_fifo(55 downto 48);
                    accu_11_l7B <= dout_cir_fifo(63 downto 56);
                    accu_11_l8B <= dout_cir_fifo(71 downto 64);
                    accu_11_l9B <= dout_cir_fifo(79 downto 72);
                    accu_11_l10B <= dout_cir_fifo(87 downto 80);
                    accu_11_l11B <= dout_cir_fifo(95 downto 88);
                    accu_11_l12B <= dout_cir_fifo(103 downto 96);
                    accu_11_l13B <= dout_cir_fifo(111 downto 104);
                    accu_11_l14B <= dout_cir_fifo(119 downto 112);
                    accu_11_l15B <= dout_cir_fifo(127 downto 120);
                    
                    if (empty_cir_fifo = '0') then --Check if we are in the last column
                        rd_en_cir_fifo <= '1';--No,continue reading 
                    else
                        rd_en_cir_fifo <= '0';--stop reading fifo
                    end if;
                    state_cir_sum <= s11;
                when s11 =>
                    state_cir_sum <= s12;--ACCU latency
                when s12 =>
                    accu_11_SCLR <= '1'; --Clear accumulator
                    if (empty_cir_fifo = '0') then --Check if we are in the last column
                        rd_en_cir_fifo <= '1';--No,continue reading the next 8 gtu columns
                        state_cir_sum <= s3;    
                    else
                        rd_en_cir_fifo <= '0';--yes,stop reading fifo
                        state_cir_sum <= s0;
                    end if;
                    accu8_rdy <= '1';--Now the sum of the 8GTU memory is ready
           end case;
       end if;   
    end process;                
                    
	--SQRT calculation
    SQRT_calc :    process (CLOCK)
    begin                
        if (CLOCK'event and CLOCK = '1') then
            case (state_sqrt) is
                when s0 =>
                    if (sum_bus_rdy = '1') then--Check if the 128 GTU sum are ready
                        s_axis_cartesian_tvalid <= '1';--Yes,enable sqrt
                        
                        s_axis_cartesian_tdata_l0    <= "0" & sum_bus_l0;
                        s_axis_cartesian_tdata_l1    <= "0" & sum_bus_l1;
                        s_axis_cartesian_tdata_l2    <= "0" & sum_bus_l2;
                        s_axis_cartesian_tdata_l3    <= "0" & sum_bus_l3;
                        s_axis_cartesian_tdata_l4    <= "0" & sum_bus_l4;
                        s_axis_cartesian_tdata_l5    <= "0" & sum_bus_l5;
                        s_axis_cartesian_tdata_l6    <= "0" & sum_bus_l6;
                        s_axis_cartesian_tdata_l7    <= "0" & sum_bus_l7;
                        s_axis_cartesian_tdata_l8    <= "0" & sum_bus_l8;
                        s_axis_cartesian_tdata_l9    <= "0" & sum_bus_l9;
                        s_axis_cartesian_tdata_l10   <= "0" & sum_bus_l10;
                        s_axis_cartesian_tdata_l11   <= "0" & sum_bus_l11;
                        s_axis_cartesian_tdata_l12   <= "0" & sum_bus_l12;
                        s_axis_cartesian_tdata_l13   <= "0" & sum_bus_l13;
                        s_axis_cartesian_tdata_l14   <= "0" & sum_bus_l14;
                        s_axis_cartesian_tdata_l15   <= "0" & sum_bus_l15;
                        
                        state_sqrt <= s1;
                    else
                        state_sqrt <= s0;
                    end if;         
                when s1 =>
                    s_axis_cartesian_tvalid <= '0';
                    state_sqrt <= s0;
            end case;
        end if;
    end process;

    --SUM/16 calculation
    SUM16_calc :    process (CLOCK)
    begin                
        if (CLOCK'event and CLOCK = '1') then
            case (state_sum16) is
                when s0 =>
                    if (sum_bus_rdy = '1') then --Check if SUM128 is ready
                        sum16_l0   <= sum_bus_l0(14 downto 4);
                        sum16_l1   <= sum_bus_l1(14 downto 4);
                        sum16_l2   <= sum_bus_l2(14 downto 4);
                        sum16_l3   <= sum_bus_l3(14 downto 4);
                        sum16_l4   <= sum_bus_l4(14 downto 4);
                        sum16_l5   <= sum_bus_l5(14 downto 4);
                        sum16_l6   <= sum_bus_l6(14 downto 4);
                        sum16_l7   <= sum_bus_l7(14 downto 4);
                        sum16_l8   <= sum_bus_l8(14 downto 4);
                        sum16_l9   <= sum_bus_l9(14 downto 4);
                        sum16_l10  <= sum_bus_l10(14 downto 4);
                        sum16_l11  <= sum_bus_l11(14 downto 4);
                        sum16_l12  <= sum_bus_l12(14 downto 4);
                        sum16_l13  <= sum_bus_l13(14 downto 4);
                        sum16_l14  <= sum_bus_l14(14 downto 4);
                        sum16_l15  <= sum_bus_l15(14 downto 4);
                        
                        state_sum16 <= s1;
                    else
                        state_sum16 <= s0;
                    end if;
                    
                    sum16_rdy <= '0';
                when s1 =>--Idle (sync with SQRT process)
                    state_sum16 <= s2;
                when s2 =>--Idle (sync with SQRT process)
                    state_sum16 <= s3;    
                when s3 =>
                    sum16_rdy   <= '1';--Now SUM/16 is ready  
                    state_sum16 <= s0;
            end case;
        end if;
    end process;

    --S calculation
    S_calculation :    process (CLOCK)
    begin                
        if (CLOCK'event and CLOCK = '1') then
            case (state_S) is
                when s0 =>
                    if (sum16_rdy = '1') then--Check if SUM/16 is ready
                        add_12_l0A  <= sum16_l0;
                        add_12_l1A  <= sum16_l1;
                        add_12_l2A  <= sum16_l2;
                        add_12_l3A  <= sum16_l3;
                        add_12_l4A  <= sum16_l4;
                        add_12_l5A  <= sum16_l5;
                        add_12_l6A  <= sum16_l6;
                        add_12_l7A  <= sum16_l7;
                        add_12_l8A  <= sum16_l8;
                        add_12_l9A  <= sum16_l9;
                        add_12_l10A  <= sum16_l10;
                        add_12_l11A  <= sum16_l11;
                        add_12_l12A  <= sum16_l12;
                        add_12_l13A  <= sum16_l13;
                        add_12_l14A  <= sum16_l14;
                        add_12_l15A  <= sum16_l15;
                        
                        state_S <= s1;
                    else
                        state_S <= s0;
                    end if;
                    S_calc <= '0';
                when s1 =>
                    if (m_axis_dout_tvalid_l0 = '1') then--Check if SQRT(SUM) is ready
                        --SQRT minimum from IP Coregen => width 16 bit
                        add_12_l0B  <= m_axis_dout_tdata_l0 & "0"; --2*SQRT(SUM)
                        add_12_l1B  <= m_axis_dout_tdata_l1 & "0"; --2*SQRT(SUM)
                        add_12_l2B  <= m_axis_dout_tdata_l2 & "0"; --2*SQRT(SUM)
                        add_12_l3B  <= m_axis_dout_tdata_l3 & "0"; --2*SQRT(SUM)
                        add_12_l4B  <= m_axis_dout_tdata_l4 & "0"; --2*SQRT(SUM)
                        add_12_l5B  <= m_axis_dout_tdata_l5 & "0"; --2*SQRT(SUM)
                        add_12_l6B  <= m_axis_dout_tdata_l6 & "0"; --2*SQRT(SUM)
                        add_12_l7B  <= m_axis_dout_tdata_l7 & "0"; --2*SQRT(SUM)
                        add_12_l8B  <= m_axis_dout_tdata_l8 & "0"; --2*SQRT(SUM)
                        add_12_l9B  <= m_axis_dout_tdata_l9 & "0"; --2*SQRT(SUM)
                        add_12_l10B <= m_axis_dout_tdata_l10 & "0"; --2*SQRT(SUM)
                        add_12_l11B <= m_axis_dout_tdata_l11 & "0"; --2*SQRT(SUM)
                        add_12_l12B <= m_axis_dout_tdata_l12 & "0"; --2*SQRT(SUM)
                        add_12_l13B <= m_axis_dout_tdata_l13 & "0"; --2*SQRT(SUM)
                        add_12_l14B <= m_axis_dout_tdata_l14 & "0"; --2*SQRT(SUM)
                        add_12_l15B <= m_axis_dout_tdata_l15 & "0"; --2*SQRT(SUM)
                                            
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
				        
				        if (add_12_l0S < "000000001111") then--If S<15 set S=15 
				            dina_smem(11 downto 0) <= "000000001111";
				        else
				            dina_smem(11 downto 0) <= add_12_l0S;
				        end if;
				        
				         if (add_12_l1S < "000000001111") then--If S<15 set S=15 
				            dina_smem(23 downto 12) <= "000000001111";
				        else
				            dina_smem(23 downto 12) <= add_12_l1S;
				        end if;
				        
				         if (add_12_l2S < "000000001111") then--If S<15 set S=15 
				            dina_smem(35 downto 24) <= "000000001111";
				        else
				            dina_smem(35 downto 24) <= add_12_l2S;
				        end if;
				        
				         if (add_12_l3S < "000000001111") then--If S<15 set S=15 
				            dina_smem(47 downto 36) <= "000000001111";
				        else
				            dina_smem(47 downto 36) <= add_12_l3S;
				        end if;
				        
				         if (add_12_l4S < "000000001111") then--If S<15 set S=15 
				            dina_smem(59 downto 48) <= "000000001111";
				        else
				            dina_smem(59 downto 48) <= add_12_l4S;
				        end if;
				        
				         if (add_12_l5S < "000000001111") then--If S<15 set S=15 
				            dina_smem(71 downto 60) <= "000000001111";
				        else
				            dina_smem(71 downto 60) <= add_12_l5S;
				        end if;
				        
				         if (add_12_l6S < "000000001111") then--If S<15 set S=15 
				            dina_smem(83 downto 72) <= "000000001111";
				        else
				            dina_smem(83 downto 72) <= add_12_l6S;
				        end if;
				        
				         if (add_12_l7S < "000000001111") then--If S<15 set S=15 
				            dina_smem(95 downto 84) <= "000000001111";
				        else
				            dina_smem(95 downto 84) <= add_12_l7S;
				        end if;
				        
				         if (add_12_l8S < "000000001111") then--If S<15 set S=15 
				            dina_smem(107 downto 96) <= "000000001111";
				        else
				            dina_smem(107 downto 96) <= add_12_l8S;
				        end if;
				        
				         if (add_12_l9S < "000000001111") then--If S<15 set S=15 
				            dina_smem(119 downto 108) <= "000000001111";
				        else
				            dina_smem(119 downto 108) <= add_12_l9S;
				        end if;
				        
				         if (add_12_l10S < "000000001111") then--If S<15 set S=15 
				            dina_smem(131 downto 120) <= "000000001111";
				        else
				            dina_smem(131 downto 120) <= add_12_l10S;
				        end if;
				        
				         if (add_12_l11S < "000000001111") then--If S<15 set S=15 
				            dina_smem(143 downto 132) <= "000000001111";
				        else
				            dina_smem(143 downto 132) <= add_12_l11S;
				        end if;
				        
				         if (add_12_l12S < "000000001111") then--If S<15 set S=15 
				            dina_smem(155 downto 144) <= "000000001111";
				        else
				            dina_smem(155 downto 144) <= add_12_l12S;
				        end if;
				        
				         if (add_12_l13S < "000000001111") then--If S<15 set S=15 
				            dina_smem(167 downto 156) <= "000000001111";
				        else
				            dina_smem(167 downto 156) <= add_12_l13S;
				        end if;
				        
				         if (add_12_l14S < "000000001111") then--If S<15 set S=15 
				            dina_smem(179 downto 168) <= "000000001111";
				        else
				            dina_smem(179 downto 168) <= add_12_l14S;
				        end if;
				         if (add_12_l15S < "000000001111") then--If S<15 set S=15 
				            dina_smem(191 downto 180) <= "000000001111";
				        else
				            dina_smem(191 downto 180) <= add_12_l15S;
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
	                   if (gtu_cnt = "10001000") then --Change S address block after 128 + 8 GTU
                           gtu_cnt <= "00001001";
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
	                   if (gtu_cnt = "10001000") then --Change S address block after 128 + 8 GTU
	                       addrb_start <= "0000000";--Address memory start 0(half S memory)
	                       addrb_stop  <= "0101111";--Address memory stop 47(half S memory)
	                       state_adr <= s1;
	                   else
	                       state_adr <= s0;
	                   end if;
	               end if;
	           when s1 =>
                   if (switch_addr = '1') then
                       if (gtu_cnt = "10001000") then --Change S address block after 128 + 8 GTU
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
	           
	
	--Event check
    Event_check :    process (CLOCK)
    begin                
        if (CLOCK'event and CLOCK = '1') then
            case (state_event) is
                when s0 => 
				    if (accu8_rdy = '1') then--Check if 8 sum in circular buffer is ready
				        --Check if sum in circular buffer (8 GTU) > S
				        if ( accu_11_l0Q > doutb_smem(11 downto 0) ) then
                            col_event(0) <= '1';--Event in a column
                        end if;
				        if ( accu_11_l1Q > doutb_smem(23 downto 12) ) then
				            col_event(1) <= '1';--Event in a column
				        end if;
				        if ( accu_11_l2Q > doutb_smem(35 downto 24) ) then
				            col_event(2) <= '1';--Event in a column
				        end if;
				        if ( accu_11_l3Q > doutb_smem(47 downto 36) ) then
				            col_event(3) <= '1';--Event in a column
				        end if;
				        if ( accu_11_l4Q > doutb_smem(59 downto 48) ) then
				            col_event(4) <= '1';--Event in a column
				        end if;
				        if ( accu_11_l5Q > doutb_smem(71 downto 60) ) then
				            col_event(5) <= '1';--Event in a column
				        end if;
				        if ( accu_11_l6Q > doutb_smem(83 downto 72) ) then
				            col_event(6) <= '1';--Event in a column
				        end if;
				        if ( accu_11_l7Q > doutb_smem(95 downto 84) ) then
				            col_event(7) <= '1';--Event in a column
				        end if;
				        if ( accu_11_l8Q > doutb_smem(107 downto 96) ) then
				            col_event(8) <= '1';--Event in a column
				        end if;
				        if ( accu_11_l9Q > doutb_smem(119 downto 108) ) then
				            col_event(9) <= '1';--Event in a column
				        end if;
				        if ( accu_11_l10Q > doutb_smem(131 downto 120) ) then
				            col_event(10) <= '1';--Event in a column
				        end if;
				        if ( accu_11_l11Q > doutb_smem(143 downto 132) ) then
				            col_event(11) <= '1';--Event in a column
				        end if;
				        if ( accu_11_l12Q > doutb_smem(155 downto 144) ) then
				            col_event(12) <= '1';--Event in a column
				        end if;
				        if ( accu_11_l13Q > doutb_smem(167 downto 156) ) then
				            col_event(13) <= '1';--Event in a column
				        end if;
				        if ( accu_11_l14Q > doutb_smem(179 downto 168) ) then
				            col_event(14) <= '1';--Event in a column
				        end if;
				        if ( accu_11_l15Q > doutb_smem(191 downto 180) ) then
				            col_event(15) <= '1';--Event in a column
				        end if;
				        
				        state_event <= s1;
				    end if;
				    ec_event <= '0';
				when s1 =>
				    if (addrb_smem = addrb_stop) then--Last memory column for S reading (End of frame)
				        state_event <= s2;
				        switch_addr <= '1';--Enable the "switch" of the memory for the "S" memory
				    else
				        addrb_smem <= addrb_smem + 1;
				        state_event <= s0;
				    end if;
				when s2 =>
				    if (col_event > "0000000000000000") then
				        ec_event <= '1';--Yes,EVENT
				        col_event <= ( others => '0');
				    end if;
				    state_event <= s3;
				    switch_addr <= '0';
			    when s3 =>
				   addrb_smem <= addrb_start;--Update the start address for the reading of the S memory
				   state_event <= s0;
				   ec_event <= '0';
			end case;
	    end if;
	end process;
				        	
end arch_ec;