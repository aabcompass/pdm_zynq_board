----------------------------------------------------------------------------------
-- Company: INFN TORINO
-- Engineer: M.Mignone
-- 
-- Create Date:    14:11:24 10/2016 
-- Design Name: 
-- Module Name:    ALGO_B - Behavioral 
-- Project Name: L2 TRIGGER
-- Target Devices: 
-- Tool versions: 
-- Description: L2 VHDL TRIGGER MINIEUSO
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

entity L2 is port (
	CLOCK_L2			        :	in	std_logic;
	--FIFO L1 Datainput
	rd_clk_l1                   :   out std_logic;
	empty_sum_fifo_l1           :   in  std_logic;
    rd_en_sum_fifo_l1           :   out std_logic := '0';
    dout_sum_fifo_l1            :   in  std_logic_vector(239 downto 0);
    --AXI4 Stream FIFO (DATA OUT)
    s_aresetn                   :   in  std_logic;
    m_aclk                      :   in  std_logic;
    m_axis_tvalid               :   out std_logic;
    m_axis_tready               :   in  std_logic;
    m_axis_tdata                :   out std_logic_vector(31 downto 0);
    m_axis_tlast                :   out std_logic;
    --AXI4 Stream FIFO (COMMAND IN)
    s_aclk_cmd                  :   IN STD_LOGIC;
    s_aresetn_cmd               :   IN STD_LOGIC;
    s_axis_tvalid_cmd           :   IN STD_LOGIC;
    s_axis_tready_cmd           :   OUT STD_LOGIC;
    s_axis_tdata_cmd            :   IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    --L2 EVENT
    L2_event                    :   out std_logic := '0'
	);
	
end L2;

architecture Behavioral of L2 is

    type    state_sum128_type   is  (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24);
    signal  state_sum128    :   state_sum128_type := s0;
	signal	pixel_col_count :	std_logic_vector(5 downto 0) := ( others => '0');
	signal	gtu_count128	:	std_logic_vector(6 downto 0) := ( others => '0');
	
	signal	wea_sum_mem		:	std_logic_vector(0 downto 0) := "0";
	signal	dina_sum_mem	:	std_logic_vector(351 downto 0) := ( others => '0');
	signal	douta_sum_mem	:	std_logic_vector(351 downto 0);
	
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
	
	signal	sum_l0      :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_l1      :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_l2      :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_l3      :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_l4      :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_l5      :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_l6      :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_l7      :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_l8      :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_l9      :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_l10     :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_l11     :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_l12     :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_l13     :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_l14     :	std_logic_vector(14 downto 0) := ( others => '0');
	signal	sum_l15     :	std_logic_vector(14 downto 0) := ( others => '0');
	
	signal	sum_bus_rdy		:	std_logic := '0';
	
	type    state_fifo128_type is  (cp_start, cp_stop);
    signal  state_fifo128   :   state_fifo128_type := cp_start;
	
	signal	bitcount		:	std_logic_vector(2 downto 0) := ( others => '0');
	signal	pixel_rdy		:	std_logic := '0';
	
	signal	add_22_l0A		:	std_logic_vector(21 downto 0) := ( others => '0');
	signal	add_22_l0B		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_22_l0S		:	std_logic_vector(21 downto 0) := ( others => '0');
	
	signal	add_22_l1A		:	std_logic_vector(21 downto 0) := ( others => '0');
	signal	add_22_l1B		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_22_l1S		:	std_logic_vector(21 downto 0) := ( others => '0');
	
	signal	add_22_l2A		:	std_logic_vector(21 downto 0) := ( others => '0');
	signal	add_22_l2B		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_22_l2S		:	std_logic_vector(21 downto 0) := ( others => '0');
	
	signal	add_22_l3A		:	std_logic_vector(21 downto 0) := ( others => '0');
	signal	add_22_l3B		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_22_l3S		:	std_logic_vector(21 downto 0) := ( others => '0');
	
	signal	add_22_l4A		:	std_logic_vector(21 downto 0) := ( others => '0');
	signal	add_22_l4B		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_22_l4S		:	std_logic_vector(21 downto 0) := ( others => '0');
	
	signal	add_22_l5A		:	std_logic_vector(21 downto 0) := ( others => '0');
	signal	add_22_l5B		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_22_l5S		:	std_logic_vector(21 downto 0) := ( others => '0');
	
	signal	add_22_l6A		:	std_logic_vector(21 downto 0) := ( others => '0');
	signal	add_22_l6B		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_22_l6S		:	std_logic_vector(21 downto 0) := ( others => '0');
	
	signal	add_22_l7A		:	std_logic_vector(21 downto 0) := ( others => '0');
	signal	add_22_l7B		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_22_l7S		:	std_logic_vector(21 downto 0) := ( others => '0');
	
	signal	add_22_l8A		:	std_logic_vector(21 downto 0) := ( others => '0');
	signal	add_22_l8B		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_22_l8S		:	std_logic_vector(21 downto 0) := ( others => '0');
	
	signal	add_22_l9A		:	std_logic_vector(21 downto 0) := ( others => '0');
	signal	add_22_l9B		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_22_l9S		:	std_logic_vector(21 downto 0) := ( others => '0');
	
	signal	add_22_l10A		:	std_logic_vector(21 downto 0) := ( others => '0');
	signal	add_22_l10B		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_22_l10S		:	std_logic_vector(21 downto 0) := ( others => '0');
	
	signal	add_22_l11A		:	std_logic_vector(21 downto 0) := ( others => '0');
	signal	add_22_l11B		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_22_l11S		:	std_logic_vector(21 downto 0) := ( others => '0');
	
	signal	add_22_l12A		:	std_logic_vector(21 downto 0) := ( others => '0');
	signal	add_22_l12B		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_22_l12S		:	std_logic_vector(21 downto 0) := ( others => '0');
	
	signal	add_22_l13A		:	std_logic_vector(21 downto 0) := ( others => '0');
	signal	add_22_l13B		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_22_l13S		:	std_logic_vector(21 downto 0) := ( others => '0');
	
	signal	add_22_l14A		:	std_logic_vector(21 downto 0) := ( others => '0');
	signal	add_22_l14B		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_22_l14S		:	std_logic_vector(21 downto 0) := ( others => '0');
	
	signal	add_22_l15A		:	std_logic_vector(21 downto 0) := ( others => '0');
	signal	add_22_l15B		:	std_logic_vector(14 downto 0) := ( others => '0');
	signal	add_22_l15S		:	std_logic_vector(21 downto 0) := ( others => '0');
	
	signal  bypass_add_22   :   std_logic := '0';
	
	--OUT_FIFO
    signal  s_axis_tvalid_fifo_out      : std_logic := '0';
    signal  s_axis_tready_fifo_out      : std_logic;
    signal  s_axis_tdata_fifo_out       : std_logic_vector(31 downto 0) := ( others => '0');
    signal  s_axis_tlast_fifo_out       : std_logic := '0';
    
    --IN FIFO (COMMAND)
    signal  m_axis_tvalid_cmd           : std_logic;
    signal  m_axis_tready_cmd           : std_logic := '0';
    signal  m_axis_tdata_cmd            : std_logic_vector(31 downto 0) := ( others => '0');
    signal  m_axis_tlast_cmd            : std_logic := '0';
    
    --CIRCULAR MEMORY
    signal  wea_cir                     : std_logic_vector(0 downto 0) := "0";
    signal  addra_cir                   : std_logic_vector(9 downto 0) := ( others => '0');
    signal  dina_cir                    : std_logic_vector(239 downto 0) := ( others => '0');
    signal  douta_cir                   : std_logic_vector(239 downto 0);
    signal  cir_en                      : std_logic := '0';
    
    type    state_cir_type              is (s0,s1,s2,s3,s4);
    signal  state_cir                   :   state_cir_type := s0;
    
    signal  column_cnt                  : std_logic_vector(9 downto 0) := ( others => '0');
    signal  column_max                  : std_logic_vector(9 downto 0) := "0101111111";
    signal  P_thr                       : std_logic_vector(4 downto 0) := "01000";--P=8 DEFAULT VALUE
    signal  N_thr                       : std_logic_vector(4 downto 0) := "00100";--N=4 DEFAULT VALUE
    signal  cir_rdy                     : std_logic := '0';
    signal  cir_rd                      : std_logic := '0';
    signal  column_addr                 : std_logic_vector(9 downto 0) := ( others => '0');
    signal  data_cir_rdy                : std_logic := '0';
    signal  l2gtu_col                   : std_logic_vector(5 downto 0) := ( others => '0');
    
    --Multiplier 5x5 (N*P)
    signal  A_mult_5x5                  : std_logic_vector(4 downto 0):= ( others => '0');
    signal  B_mult_5x5                  : std_logic_vector(4 downto 0):= ( others => '0');
    signal  P_mult_5x5                  : std_logic_vector(9 downto 0);
    
    type    state_scalc_type              is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15);
    signal  state_scalc                   :   state_scalc_type := s0;
    
    --Multiplier 15x10 (N*P)*(SUM/128)
    signal  A_mult_15x10_l0             : std_logic_vector(14 downto 0) := ( others => '0');
    signal  B_mult_15x10_l0             : std_logic_vector(9 downto 0) := ( others => '0');
    signal  P_mult_15x10_l0             : std_logic_vector(24 downto 0); 
    
    signal  A_mult_15x10_l1             : std_logic_vector(14 downto 0) := ( others => '0');
    signal  B_mult_15x10_l1             : std_logic_vector(9 downto 0) := ( others => '0');
    signal  P_mult_15x10_l1             : std_logic_vector(24 downto 0); 
    
    signal  A_mult_15x10_l2             : std_logic_vector(14 downto 0) := ( others => '0');
    signal  B_mult_15x10_l2             : std_logic_vector(9 downto 0) := ( others => '0');
    signal  P_mult_15x10_l2             : std_logic_vector(24 downto 0); 
    
    signal  A_mult_15x10_l3             : std_logic_vector(14 downto 0) := ( others => '0');
    signal  B_mult_15x10_l3             : std_logic_vector(9 downto 0) := ( others => '0');
    signal  P_mult_15x10_l3             : std_logic_vector(24 downto 0); 
    
    signal  A_mult_15x10_l4             : std_logic_vector(14 downto 0) := ( others => '0');
    signal  B_mult_15x10_l4             : std_logic_vector(9 downto 0) := ( others => '0');
    signal  P_mult_15x10_l4             : std_logic_vector(24 downto 0); 
    
    signal  A_mult_15x10_l5             : std_logic_vector(14 downto 0) := ( others => '0');
    signal  B_mult_15x10_l5             : std_logic_vector(9 downto 0) := ( others => '0');
    signal  P_mult_15x10_l5             : std_logic_vector(24 downto 0); 
    
    signal  A_mult_15x10_l6             : std_logic_vector(14 downto 0) := ( others => '0');
    signal  B_mult_15x10_l6             : std_logic_vector(9 downto 0) := ( others => '0');
    signal  P_mult_15x10_l6             : std_logic_vector(24 downto 0); 
    
    signal  A_mult_15x10_l7             : std_logic_vector(14 downto 0) := ( others => '0');
    signal  B_mult_15x10_l7             : std_logic_vector(9 downto 0) := ( others => '0');
    signal  P_mult_15x10_l7             : std_logic_vector(24 downto 0); 
    
    signal  A_mult_15x10_l8             : std_logic_vector(14 downto 0) := ( others => '0');
    signal  B_mult_15x10_l8             : std_logic_vector(9 downto 0) := ( others => '0');
    signal  P_mult_15x10_l8             : std_logic_vector(24 downto 0); 
    
    signal  A_mult_15x10_l9             : std_logic_vector(14 downto 0) := ( others => '0');
    signal  B_mult_15x10_l9             : std_logic_vector(9 downto 0) := ( others => '0');
    signal  P_mult_15x10_l9             : std_logic_vector(24 downto 0); 
    
    signal  A_mult_15x10_l10             : std_logic_vector(14 downto 0) := ( others => '0');
    signal  B_mult_15x10_l10             : std_logic_vector(9 downto 0) := ( others => '0');
    signal  P_mult_15x10_l10             : std_logic_vector(24 downto 0); 
    
    signal  A_mult_15x10_l11             : std_logic_vector(14 downto 0) := ( others => '0');
    signal  B_mult_15x10_l11            : std_logic_vector(9 downto 0) := ( others => '0');
    signal  P_mult_15x10_l11             : std_logic_vector(24 downto 0); 
    
    signal  A_mult_15x10_l12             : std_logic_vector(14 downto 0) := ( others => '0');
    signal  B_mult_15x10_l12             : std_logic_vector(9 downto 0) := ( others => '0');
    signal  P_mult_15x10_l12             : std_logic_vector(24 downto 0); 
    
    signal  A_mult_15x10_l13             : std_logic_vector(14 downto 0) := ( others => '0');
    signal  B_mult_15x10_l13             : std_logic_vector(9 downto 0) := ( others => '0');
    signal  P_mult_15x10_l13             : std_logic_vector(24 downto 0); 
    
    signal  A_mult_15x10_l14             : std_logic_vector(14 downto 0) := ( others => '0');
    signal  B_mult_15x10_l14             : std_logic_vector(9 downto 0) := ( others => '0');
    signal  P_mult_15x10_l14             : std_logic_vector(24 downto 0); 
    
    signal  A_mult_15x10_l15             : std_logic_vector(14 downto 0) := ( others => '0');
    signal  B_mult_15x10_l15             : std_logic_vector(9 downto 0) := ( others => '0');
    signal  P_mult_15x10_l15             : std_logic_vector(24 downto 0);
    
    --S_MEMORY
    signal  wea_smem                     : std_logic_vector(0 downto 0) := "0";
    signal  addra_smem                   : std_logic_vector(6 downto 0) := ( others => '0');
    signal  Sw_addr                      : std_logic_vector(6 downto 0) := ( others => '0');
    signal  Sr_addr                      : std_logic_vector(6 downto 0) := ( others => '0');
    signal  dina_smem                    : std_logic_vector(399 downto 0) := ( others => '0');
    signal  douta_smem                   : std_logic_vector(399 downto 0);
    signal  Srdy                         : std_logic := '0';
    
    --Accumulator for SUM in CIRCULAR BUFFER
    signal  B_accu_l0                    : std_logic_vector(14 downto 0) := ( others => '0');                    
    signal  CE_accu                      : std_logic := '0';
    signal  SCLR_accu                    : std_logic := '0';
    signal  Q_accu_l0                    : std_logic_vector(18 downto 0);
    
    signal  B_accu_l1                    : std_logic_vector(14 downto 0) := ( others => '0');
    signal  Q_accu_l1                    : std_logic_vector(18 downto 0);
    
    signal  B_accu_l2                    : std_logic_vector(14 downto 0) := ( others => '0');
    signal  Q_accu_l2                    : std_logic_vector(18 downto 0);
    
    signal  B_accu_l3                    : std_logic_vector(14 downto 0) := ( others => '0');
    signal  Q_accu_l3                    : std_logic_vector(18 downto 0);
    
    signal  B_accu_l4                    : std_logic_vector(14 downto 0) := ( others => '0');
    signal  Q_accu_l4                    : std_logic_vector(18 downto 0);
    
    signal  B_accu_l5                    : std_logic_vector(14 downto 0) := ( others => '0');
    signal  Q_accu_l5                    : std_logic_vector(18 downto 0);
    
    signal  B_accu_l6                    : std_logic_vector(14 downto 0) := ( others => '0');
    signal  Q_accu_l6                    : std_logic_vector(18 downto 0);
    
    signal  B_accu_l7                    : std_logic_vector(14 downto 0) := ( others => '0');
    signal  Q_accu_l7                    : std_logic_vector(18 downto 0);
    
    signal  B_accu_l8                    : std_logic_vector(14 downto 0) := ( others => '0');
    signal  Q_accu_l8                    : std_logic_vector(18 downto 0);
    
    signal  B_accu_l9                    : std_logic_vector(14 downto 0) := ( others => '0');
    signal  Q_accu_l9                    : std_logic_vector(18 downto 0);
    
    signal  B_accu_l10                    : std_logic_vector(14 downto 0) := ( others => '0');
    signal  Q_accu_l10                    : std_logic_vector(18 downto 0);
    
    signal  B_accu_l11                    : std_logic_vector(14 downto 0) := ( others => '0');
    signal  Q_accu_l11                    : std_logic_vector(18 downto 0);
    
    signal  B_accu_l12                    : std_logic_vector(14 downto 0) := ( others => '0');
    signal  Q_accu_l12                    : std_logic_vector(18 downto 0);
    
    signal  B_accu_l13                    : std_logic_vector(14 downto 0) := ( others => '0');
    signal  Q_accu_l13                    : std_logic_vector(18 downto 0);
    
    signal  B_accu_l14                    : std_logic_vector(14 downto 0) := ( others => '0');
    signal  Q_accu_l14                    : std_logic_vector(18 downto 0);
    
    signal  B_accu_l15                    : std_logic_vector(14 downto 0) := ( others => '0');
    signal  Q_accu_l15                    : std_logic_vector(18 downto 0);
    
    --SUM on circular buffer
    type    state_cirsum_type              is (s0,s1,s2,s3,s4,s5,s6,s7);
    signal state_cirsum                 :   state_cirsum_type := s0;
    signal l2gtu_cnt                    : std_logic_vector(4 downto 0) := ( others => '0');
    signal col_cnt                      : std_logic_vector(9 downto 0) := ( others => '0');
    signal last_cln                     : std_logic_vector(4 downto 0) := ( others => '0');
    signal check_event                  : std_logic := '0';
    
    --L2 event check
    type   state_event_type              is (s0,s1,s2,s3);
    signal state_event                  : state_event_type := s0;
    signal Psum_l0                      : std_logic_vector(18 downto 0) := ( others => '0');
    signal Psum_l1                      : std_logic_vector(18 downto 0) := ( others => '0');
    signal Psum_l2                      : std_logic_vector(18 downto 0) := ( others => '0');
    signal Psum_l3                      : std_logic_vector(18 downto 0) := ( others => '0');
    signal Psum_l4                      : std_logic_vector(18 downto 0) := ( others => '0');
    signal Psum_l5                      : std_logic_vector(18 downto 0) := ( others => '0');
    signal Psum_l6                      : std_logic_vector(18 downto 0) := ( others => '0');
    signal Psum_l7                      : std_logic_vector(18 downto 0) := ( others => '0');
    signal Psum_l8                      : std_logic_vector(18 downto 0) := ( others => '0');
    signal Psum_l9                      : std_logic_vector(18 downto 0) := ( others => '0');
    signal Psum_l10                     : std_logic_vector(18 downto 0) := ( others => '0');
    signal Psum_l11                     : std_logic_vector(18 downto 0) := ( others => '0');
    signal Psum_l12                     : std_logic_vector(18 downto 0) := ( others => '0');
    signal Psum_l13                     : std_logic_vector(18 downto 0) := ( others => '0');
    signal Psum_l14                     : std_logic_vector(18 downto 0) := ( others => '0');
    signal Psum_l15                     : std_logic_vector(18 downto 0) := ( others => '0');
    signal read_S                       : std_logic := '0';
    signal Sr_column                    : std_logic_vector(6 downto 0) := ( others => '0');
    signal P_delay                      : std_logic_vector(4 downto 0) := ( others => '0');
    signal col_event                    : std_logic_vector(15 downto 0) := ( others => '0');
    
--    signal  CLOCK_L2    :   std_logic;
    
    COMPONENT ADDER_22
      PORT (
        A : IN STD_LOGIC_VECTOR(21 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
        CLK : IN STD_LOGIC;
        BYPASS : IN STD_LOGIC;
        S : OUT STD_LOGIC_VECTOR(21 DOWNTO 0)
      );
    END COMPONENT;
    
    COMPONENT SUM_MEMORY_L2
      PORT (
        clka : IN STD_LOGIC;
        wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
        dina : IN STD_LOGIC_VECTOR(351 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(351 DOWNTO 0)
      );
    END COMPONENT;
    
    --FIFO_OUT AXI4 STREAM (DATA FIFO)
    COMPONENT FIFO_OUT
    PORT (
        m_aclk          : IN STD_LOGIC;
        s_aclk          : IN STD_LOGIC;
        s_aresetn       : IN STD_LOGIC;
        s_axis_tvalid   : IN STD_LOGIC;
        s_axis_tready   : OUT STD_LOGIC;
        s_axis_tdata    : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        s_axis_tlast    : IN STD_LOGIC;
        m_axis_tvalid   : OUT STD_LOGIC;
        m_axis_tready   : IN STD_LOGIC;
        m_axis_tdata    : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        m_axis_tlast    : OUT STD_LOGIC
       );
    END COMPONENT;
    
    --FIFO_IN AXI4 STREAM (COMMAND FIFO)
    COMPONENT FIFO_IN
      PORT (
        m_aclk          : IN STD_LOGIC;
        s_aclk          : IN STD_LOGIC;
        s_aresetn       : IN STD_LOGIC;
        s_axis_tvalid   : IN STD_LOGIC;
        s_axis_tready   : OUT STD_LOGIC;
        s_axis_tdata    : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        m_axis_tvalid   : OUT STD_LOGIC;
        m_axis_tready   : IN STD_LOGIC;
        m_axis_tdata    : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
      );
    END COMPONENT;
    
    --L2 CIRCULAR MEMORY (MAX 16GTU)
    COMPONENT CIRCULAR_BUFFER_L2
      PORT (
        clka    : IN STD_LOGIC;
        wea     : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra   : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        dina    : IN STD_LOGIC_VECTOR(239 DOWNTO 0);
        douta   : OUT STD_LOGIC_VECTOR(239 DOWNTO 0)
      );
    END COMPONENT;
    
    --Multiplier 5x5 bit (N*P)
    COMPONENT MULT_5x5
      PORT (
        CLK : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
      );
    END COMPONENT;
    
    --Multiplier 15x10 bit (N*P)*(SUM/128)
    COMPONENT MULT_15x10
      PORT (
        CLK : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(24 DOWNTO 0)
      );
    END COMPONENT;
    
    COMPONENT S_MEMORY_L2
      PORT (
        clka : IN STD_LOGIC;
        wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
        dina : IN STD_LOGIC_VECTOR(399 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(399 DOWNTO 0)
      );
    END COMPONENT;
    
    --Accumulator for SUM in CIRCULAR BUFFER (15bit input * 16)
    COMPONENT ACCUM_15x16
      PORT (
        B : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
        CLK : IN STD_LOGIC;
        CE : IN STD_LOGIC;
        SCLR : IN STD_LOGIC;
        Q : OUT STD_LOGIC_VECTOR(18 DOWNTO 0)
      );
    END COMPONENT;
    
begin

add22_l0 : ADDER_22
  PORT MAP (
    A => add_22_l0A,
    B => add_22_l0B,
    CLK => CLOCK_L2,
    BYPASS => bypass_add_22,
    S => add_22_l0S 
  );

add22_l1 : ADDER_22
  PORT MAP (
    A => add_22_l1A,
    B => add_22_l1B,
    CLK => CLOCK_L2,
    BYPASS => bypass_add_22,
    S => add_22_l1S 
  );

add22_l2 : ADDER_22
  PORT MAP (
    A => add_22_l2A,
    B => add_22_l2B,
    CLK => CLOCK_L2,
    BYPASS => bypass_add_22,
    S => add_22_l2S 
  );

add22_l3 : ADDER_22
  PORT MAP (
    A => add_22_l3A,
    B => add_22_l3B,
    CLK => CLOCK_L2,
    BYPASS => bypass_add_22,
    S => add_22_l3S 
  );
  
add22_l4 : ADDER_22
  PORT MAP (
    A => add_22_l4A,
    B => add_22_l4B,
    CLK => CLOCK_L2,
    BYPASS => bypass_add_22,
    S => add_22_l4S 
  );
  
add22_l5 : ADDER_22
  PORT MAP (
    A => add_22_l5A,
    B => add_22_l5B,
    CLK => CLOCK_L2,
    BYPASS => bypass_add_22,
    S => add_22_l5S 
  );
 
 add22_l6 : ADDER_22
    PORT MAP (
      A => add_22_l6A,
      B => add_22_l6B,
      CLK => CLOCK_L2,
      BYPASS => bypass_add_22,
      S => add_22_l6S 
  ); 

 add22_l7 : ADDER_22
    PORT MAP (
      A => add_22_l7A,
      B => add_22_l7B,
      CLK => CLOCK_L2,
      BYPASS => bypass_add_22,
      S => add_22_l7S 
  ); 

 add22_l8 : ADDER_22
    PORT MAP (
      A => add_22_l8A,
      B => add_22_l8B,
      CLK => CLOCK_L2,
      BYPASS => bypass_add_22,
      S => add_22_l8S 
  ); 

 add22_l9 : ADDER_22
    PORT MAP (
      A => add_22_l9A,
      B => add_22_l9B,
      CLK => CLOCK_L2,
      BYPASS => bypass_add_22,
      S => add_22_l9S 
  ); 

 add22_l10 : ADDER_22
    PORT MAP (
      A => add_22_l10A,
      B => add_22_l10B,
      CLK => CLOCK_L2,
      BYPASS => bypass_add_22,
      S => add_22_l10S 
  ); 

 add22_l11 : ADDER_22
    PORT MAP (
      A => add_22_l11A,
      B => add_22_l11B,
      CLK => CLOCK_L2,
      BYPASS => bypass_add_22,
      S => add_22_l11S 
  ); 

 add22_l12 : ADDER_22
    PORT MAP (
      A => add_22_l12A,
      B => add_22_l12B,
      CLK => CLOCK_L2,
      BYPASS => bypass_add_22,
      S => add_22_l12S 
  ); 

 add22_l13 : ADDER_22
    PORT MAP (
      A => add_22_l13A,
      B => add_22_l13B,
      CLK => CLOCK_L2,
      BYPASS => bypass_add_22,
      S => add_22_l13S 
  ); 

 add22_l14 : ADDER_22
    PORT MAP (
      A => add_22_l14A,
      B => add_22_l14B,
      CLK => CLOCK_L2,
      BYPASS => bypass_add_22,
      S => add_22_l14S 
  ); 

 add22_l15 : ADDER_22
    PORT MAP (
      A => add_22_l15A,
      B => add_22_l15B,
      CLK => CLOCK_L2,
      BYPASS => bypass_add_22,
      S => add_22_l15S 
  ); 

 memory_sum_l2 : SUM_MEMORY_L2
    PORT MAP (
      clka => CLOCK_L2,
      wea => wea_sum_mem,
      addra => pixel_col_count,
      dina => dina_sum_mem,
      douta => douta_sum_mem
    );
  --DataOUT AXI4 FIFO
  AXI4_FIFO_OUT_L2 : FIFO_OUT
  PORT MAP (
      m_aclk => m_aclk,
      s_aclk => CLOCK_L2,
      s_aresetn => s_aresetn,
      s_axis_tvalid => s_axis_tvalid_fifo_out,
      s_axis_tready => s_axis_tready_fifo_out,
      s_axis_tdata => s_axis_tdata_fifo_out,
      s_axis_tlast=> s_axis_tlast_fifo_out,
      m_axis_tvalid => m_axis_tvalid,
      m_axis_tready => m_axis_tready,
      m_axis_tdata => m_axis_tdata,
      m_axis_tlast=> m_axis_tlast
  );
  --Command IN AXI4 FIFO
  AXI4_FIFO_IN_L2_COMMAND : FIFO_IN
  PORT MAP (
    m_aclk => CLOCK_L2,
    s_aclk => s_aclk_cmd,
    s_aresetn => s_aresetn_cmd,
    s_axis_tvalid => s_axis_tvalid_cmd,
    s_axis_tready => s_axis_tready_cmd,
    s_axis_tdata => s_axis_tdata_cmd,
    m_axis_tvalid => m_axis_tvalid_cmd,
    m_axis_tready => m_axis_tready_cmd,
    m_axis_tdata => m_axis_tdata_cmd
  );
  
  --CIRCULAR MEMORY for L1 DATA (MAX 16 GTU)
  CIRCILAR_BUFFER : CIRCULAR_BUFFER_L2
  PORT MAP (
    clka =>     CLOCK_L2,
    wea =>      wea_cir,
    addra =>    addra_cir,
    dina =>     dina_cir,
    douta =>    douta_cir
  );
  
  --Multiplier 5x5 bit (N*P)
  mult_5x5_np : MULT_5x5
  PORT MAP (
    CLK => CLOCK_L2,
    A => A_mult_5x5,
    B => B_mult_5x5,
    P => P_mult_5x5
  );
  
  --Multiplier 15x10 (N*P)*(SUM/128)
  mult_15x10_l0 : MULT_15x10
  PORT MAP (
    CLK => CLOCK_L2,
    A => A_mult_15x10_l0,
    B => B_mult_15x10_l0,
    P => P_mult_15x10_l0
  );
  mult_15x10_l1 : MULT_15x10
  PORT MAP (
    CLK => CLOCK_L2,
    A => A_mult_15x10_l1,
    B => B_mult_15x10_l1,
    P => P_mult_15x10_l1
  );
  mult_15x10_l2 : MULT_15x10
  PORT MAP (
    CLK => CLOCK_L2,
    A => A_mult_15x10_l2,
    B => B_mult_15x10_l2,
    P => P_mult_15x10_l2
  );
  mult_15x10_l3 : MULT_15x10
  PORT MAP (
    CLK => CLOCK_L2,
    A => A_mult_15x10_l3,
    B => B_mult_15x10_l3,
    P => P_mult_15x10_l3
  );
  mult_15x10_l4 : MULT_15x10
  PORT MAP (
    CLK => CLOCK_L2,
    A => A_mult_15x10_l4,
    B => B_mult_15x10_l4,
    P => P_mult_15x10_l4
  );
  mult_15x10_l5 : MULT_15x10
  PORT MAP (
    CLK => CLOCK_L2,
    A => A_mult_15x10_l5,
    B => B_mult_15x10_l5,
    P => P_mult_15x10_l5
  );
  mult_15x10_l6 : MULT_15x10
  PORT MAP (
    CLK => CLOCK_L2,
    A => A_mult_15x10_l6,
    B => B_mult_15x10_l6,
    P => P_mult_15x10_l6
  );
  mult_15x10_l7 : MULT_15x10
  PORT MAP (
    CLK => CLOCK_L2,
    A => A_mult_15x10_l7,
    B => B_mult_15x10_l7,
    P => P_mult_15x10_l7
  );
  mult_15x10_l8 : MULT_15x10
  PORT MAP (
    CLK => CLOCK_L2,
    A => A_mult_15x10_l8,
    B => B_mult_15x10_l8,
    P => P_mult_15x10_l8
  );
  mult_15x10_l9 : MULT_15x10
  PORT MAP (
    CLK => CLOCK_L2,
    A => A_mult_15x10_l9,
    B => B_mult_15x10_l9,
    P => P_mult_15x10_l9
  );
  mult_15x10_l10 : MULT_15x10
  PORT MAP (
    CLK => CLOCK_L2,
    A => A_mult_15x10_l10,
    B => B_mult_15x10_l10,
    P => P_mult_15x10_l10
  );
  mult_15x10_l11 : MULT_15x10
  PORT MAP (
    CLK => CLOCK_L2,
    A => A_mult_15x10_l11,
    B => B_mult_15x10_l11,
    P => P_mult_15x10_l11
  );
  mult_15x10_l12 : MULT_15x10
  PORT MAP (
    CLK => CLOCK_L2,
    A => A_mult_15x10_l12,
    B => B_mult_15x10_l12,
    P => P_mult_15x10_l12
  );
  mult_15x10_l13 : MULT_15x10
  PORT MAP (
    CLK => CLOCK_L2,
    A => A_mult_15x10_l13,
    B => B_mult_15x10_l13,
    P => P_mult_15x10_l13
  );
  mult_15x10_l14 : MULT_15x10
  PORT MAP (
    CLK => CLOCK_L2,
    A => A_mult_15x10_l14,
    B => B_mult_15x10_l14,
    P => P_mult_15x10_l14
  );
  mult_15x10_l15 : MULT_15x10
  PORT MAP (
    CLK => CLOCK_L2,
    A => A_mult_15x10_l15,
    B => B_mult_15x10_l15,
    P => P_mult_15x10_l15
  );
  
  S_MEMORY : S_MEMORY_L2
    PORT MAP (
      clka => CLOCK_L2,
      wea => wea_smem,
      addra => addra_smem,
      dina => dina_smem,
      douta => douta_smem
    );
    
    ACCUM_15x16_l0 : ACCUM_15x16
      PORT MAP (
        B => B_accu_l0,
        CLK => CLOCK_L2,
        CE => CE_accu,
        SCLR => SCLR_accu,
        Q => Q_accu_l0
    );
  
  ACCUM_15x16_l1 : ACCUM_15x16
      PORT MAP (
        B => B_accu_l1,
        CLK => CLOCK_L2,
        CE => CE_accu,
        SCLR => SCLR_accu,
        Q => Q_accu_l1
    );
  
  ACCUM_15x16_l2 : ACCUM_15x16
      PORT MAP (
        B => B_accu_l2,
        CLK => CLOCK_L2,
        CE => CE_accu,
        SCLR => SCLR_accu,
        Q => Q_accu_l2
    );
  
  ACCUM_15x16_l3 : ACCUM_15x16
      PORT MAP (
        B => B_accu_l3,
        CLK => CLOCK_L2,
        CE => CE_accu,
        SCLR => SCLR_accu,
        Q => Q_accu_l3
    );
  
  ACCUM_15x16_l4 : ACCUM_15x16
      PORT MAP (
        B => B_accu_l4,
        CLK => CLOCK_L2,
        CE => CE_accu,
        SCLR => SCLR_accu,
        Q => Q_accu_l4
    );
  
  ACCUM_15x16_l5 : ACCUM_15x16
      PORT MAP (
        B => B_accu_l5,
        CLK => CLOCK_L2,
        CE => CE_accu,
        SCLR => SCLR_accu,
        Q => Q_accu_l5
    );
  
  ACCUM_15x16_l6 : ACCUM_15x16
      PORT MAP (
        B => B_accu_l6,
        CLK => CLOCK_L2,
        CE => CE_accu,
        SCLR => SCLR_accu,
        Q => Q_accu_l6
    );
  
  ACCUM_15x16_l7 : ACCUM_15x16
      PORT MAP (
        B => B_accu_l7,
        CLK => CLOCK_L2,
        CE => CE_accu,
        SCLR => SCLR_accu,
        Q => Q_accu_l7
    );
  
  ACCUM_15x16_l8 : ACCUM_15x16
      PORT MAP (
        B => B_accu_l8,
        CLK => CLOCK_L2,
        CE => CE_accu,
        SCLR => SCLR_accu,
        Q => Q_accu_l8
    );
  
  ACCUM_15x16_l9 : ACCUM_15x16
      PORT MAP (
        B => B_accu_l9,
        CLK => CLOCK_L2,
        CE => CE_accu,
        SCLR => SCLR_accu,
        Q => Q_accu_l9
    );
  
  ACCUM_15x16_l10 : ACCUM_15x16
      PORT MAP (
        B => B_accu_l10,
        CLK => CLOCK_L2,
        CE => CE_accu,
        SCLR => SCLR_accu,
        Q => Q_accu_l10
    );
  
  ACCUM_15x16_l11 : ACCUM_15x16
      PORT MAP (
        B => B_accu_l11,
        CLK => CLOCK_L2,
        CE => CE_accu,
        SCLR => SCLR_accu,
        Q => Q_accu_l11
    );
  
  ACCUM_15x16_l12 : ACCUM_15x16
      PORT MAP (
        B => B_accu_l12,
        CLK => CLOCK_L2,
        CE => CE_accu,
        SCLR => SCLR_accu,
        Q => Q_accu_l12
    );
  
  ACCUM_15x16_l13 : ACCUM_15x16
      PORT MAP (
        B => B_accu_l13,
        CLK => CLOCK_L2,
        CE => CE_accu,
        SCLR => SCLR_accu,
        Q => Q_accu_l13
    );
  
  ACCUM_15x16_l14 : ACCUM_15x16
      PORT MAP (
        B => B_accu_l14,
        CLK => CLOCK_L2,
        CE => CE_accu,
        SCLR => SCLR_accu,
        Q => Q_accu_l14
    );
  
  ACCUM_15x16_l15 : ACCUM_15x16
      PORT MAP (
        B => B_accu_l15,
        CLK => CLOCK_L2,
        CE => CE_accu,
        SCLR => SCLR_accu,
        Q => Q_accu_l15
    );
 -------------------------------------------------------------------------------------- 
  
    rd_clk_l1 <= CLOCK_L2;
  
	--SUM CALCULATION ON 128GTU
	sum128_gtu :	process (CLOCK_L2)
	begin
		if (CLOCK_L2'event and CLOCK_L2 = '1') then
			case (state_sum128) is
               when s0 =>
                    if (empty_sum_fifo_l1 = '0') then--If the L1 FIFO is not empty
                        rd_en_sum_fifo_l1 <= '1';--Read the FIFO
                        state_sum128 <= s1;
                    else
                        state_sum128 <= s0;
                    end if;
                when s1 =>
                    rd_en_sum_fifo_l1 <= '0';--Read one FIFO word
                    state_sum128 <= s2;
                when s2 =>
                    state_sum128 <= s3;--FIFO Latency
                when s3 =>
                    if (gtu_count128 = "0000000") then--First GTU in the 128 GTU block (make SUM = pixel)
                      bypass_add_22 <= '1';
                    else--Next GTU after GTU0 (make SUM = current pixel value + last pixel sum)
                      bypass_add_22 <= '0';
                    end if;
                    add_22_l0A 	<= douta_sum_mem(21 downto 0);
                    add_22_l0B 	<= dout_sum_fifo_l1(14 downto 0);
                    add_22_l1A  <= douta_sum_mem(43 downto 22);
                    add_22_l1B 	<= dout_sum_fifo_l1(29 downto 15);
                    add_22_l2A  <= douta_sum_mem(65 downto 44);
                    add_22_l2B	<= dout_sum_fifo_l1(44 downto 30);
                    add_22_l3A  <= douta_sum_mem(87 downto 66);
                    add_22_l3B 	<= dout_sum_fifo_l1(59 downto 45);
                    add_22_l4A  <= douta_sum_mem(109 downto 88);
                    add_22_l4B 	<= dout_sum_fifo_l1(74 downto 60);
                    add_22_l5A  <= douta_sum_mem(131 downto 110);
                    add_22_l5B 	<= dout_sum_fifo_l1(89 downto 75);
                    add_22_l6A  <= douta_sum_mem(153 downto 132);
                    add_22_l6B 	<= dout_sum_fifo_l1(104 downto 90);
                    add_22_l7A  <= douta_sum_mem(175 downto 154);
                    add_22_l7B  <= dout_sum_fifo_l1(119 downto 105);
                    add_22_l8A  <= douta_sum_mem(197 downto 176);
                    add_22_l8B 	<= dout_sum_fifo_l1(134 downto 120);
                    add_22_l9A  <= douta_sum_mem(219 downto 198);
                    add_22_l9B 	<= dout_sum_fifo_l1(149 downto 135);
                    add_22_l10A <= douta_sum_mem(241 downto 220);
                    add_22_l10B <= dout_sum_fifo_l1(164 downto 150);
                    add_22_l11A <= douta_sum_mem(263 downto 242);
                    add_22_l11B <= dout_sum_fifo_l1(179 downto 165);
                    add_22_l12A <= douta_sum_mem(285 downto 264);
                    add_22_l12B <= dout_sum_fifo_l1(194 downto 180);
                    add_22_l13A <= douta_sum_mem(307 downto 286);
                    add_22_l13B <= dout_sum_fifo_l1(209 downto 195);
                    add_22_l14A <= douta_sum_mem(329 downto 308);
                    add_22_l14B <= dout_sum_fifo_l1(224 downto 210);
                    add_22_l15A <= douta_sum_mem(351 downto 330);
                    add_22_l15B <= dout_sum_fifo_l1(239 downto 225);
                    
                    --Put L1 data in CIRCULAR MEMORY input
                    dina_cir    <= dout_sum_fifo_l1(239 downto 0);
                    --Enable circular memory
                    cir_en      <= '1';
                    
                    state_sum128 <= s4;
				when s4 =>
					state_sum128 <= s5;
					bypass_add_22 <= '0';
					
					cir_en <= '0';
				when s5 =>	--Latency ADDER_22=2
					state_sum128 <= s6;
				when s6 =>
					wea_sum_mem		<=	"1";--Write the SUM in memory (memory_sum_l1)
					dina_sum_mem(21 downto 0)		<= add_22_l0S;
					dina_sum_mem(43 downto 22)		<= add_22_l1S;
					dina_sum_mem(65 downto 44)		<= add_22_l2S;
					dina_sum_mem(87 downto 66)		<= add_22_l3S;
					dina_sum_mem(109 downto 88)		<= add_22_l4S;
					dina_sum_mem(131 downto 110)	<= add_22_l5S;
					dina_sum_mem(153 downto 132)	<= add_22_l6S;
					dina_sum_mem(175 downto 154)	<= add_22_l7S;
					dina_sum_mem(197 downto 176)	<= add_22_l8S;
					dina_sum_mem(219 downto 198)	<= add_22_l9S;
					dina_sum_mem(241 downto 220)	<= add_22_l10S;
					dina_sum_mem(263 downto 242)	<= add_22_l11S;
					dina_sum_mem(285 downto 264)	<= add_22_l12S;
					dina_sum_mem(307 downto 286)	<= add_22_l13S;
					dina_sum_mem(329 downto 308)	<= add_22_l14S;
					dina_sum_mem(351 downto 330)	<= add_22_l15S;
					
					if (gtu_count128 = "1111111") then --Last GTU (128) (count = 127)
					    s_axis_tdata_fifo_out <= "0000000000" & add_22_l0S; --Write the 128 SUM on AXI FIFO_OUT_L2
					    s_axis_tvalid_fifo_out <= '1';--Write pixel in AXI FIFO
					    
						sum_bus_rdy	<= '1';--Write the SUM/128  in sum_bus and enable the read (sum_bus_rdy=1)

						sum_bus_l0 	<= add_22_l0S(21 downto 7);
						sum_bus_l1 	<= add_22_l1S(21 downto 7);
						sum_bus_l2 	<= add_22_l2S(21 downto 7);
						sum_bus_l3 	<= add_22_l3S(21 downto 7);
						sum_bus_l4 	<= add_22_l4S(21 downto 7);
						sum_bus_l5 	<= add_22_l5S(21 downto 7);
						sum_bus_l6 	<= add_22_l6S(21 downto 7);
						sum_bus_l7 	<= add_22_l7S(21 downto 7);
						sum_bus_l8 	<= add_22_l8S(21 downto 7);
						sum_bus_l9 	<= add_22_l9S(21 downto 7);
						sum_bus_l10 <= add_22_l10S(21 downto 7);
						sum_bus_l11 <= add_22_l11S(21 downto 7);
						sum_bus_l12 <= add_22_l12S(21 downto 7);
						sum_bus_l13 <= add_22_l13S(21 downto 7);
						sum_bus_l14 <= add_22_l14S(21 downto 7);
						sum_bus_l15 <= add_22_l15S(21 downto 7);

                        state_sum128 <= s7;
                    else
                       state_sum128 <= s23;----------***
					end if;	
			    when s7 =>
			        wea_sum_mem		<=	"0";
                    s_axis_tdata_fifo_out <= "0000000000" & add_22_l1S; --Write the 128 SUM on AXI FIFO_OUT_L2
                    state_sum128 <= s8;
                    sum_bus_rdy	<= '0';  
               when s8 =>
                    s_axis_tdata_fifo_out <= "0000000000" & add_22_l2S; --Write the 128 SUM on AXI FIFO_OUT_L2
                    state_sum128 <= s9;  
               when s9 =>
                    s_axis_tdata_fifo_out <= "0000000000" & add_22_l3S; --Write the 128 SUM on AXI FIFO_OUT_L2
                    state_sum128 <= s10;  
               when s10 =>
                    s_axis_tdata_fifo_out <= "0000000000" & add_22_l4S; --Write the 128 SUM on AXI FIFO_OUT_L2
                    state_sum128 <= s11;  
               when s11 =>
                    s_axis_tdata_fifo_out <= "0000000000" & add_22_l5S; --Write the 128 SUM on AXI FIFO_OUT_L2
                    state_sum128 <= s12;  
               when s12 =>
                    s_axis_tdata_fifo_out <= "0000000000" & add_22_l6S; --Write the 128 SUM on AXI FIFO_OUT_L2
                    state_sum128 <= s13;  
               when s13 =>
                    s_axis_tdata_fifo_out <= "0000000000" & add_22_l7S; --Write the 128 SUM on AXI FIFO_OUT_L2
                    state_sum128 <= s14;
               when s14 =>
                    s_axis_tdata_fifo_out <= "0000000000" & add_22_l8S; --Write the 128 SUM on AXI FIFO_OUT_L2
                    state_sum128 <= s15;
               when s15 =>
                    s_axis_tdata_fifo_out <= "0000000000" & add_22_l9S; --Write the 128 SUM on AXI FIFO_OUT_L2
                    state_sum128 <= s16;
               when s16 =>
                    s_axis_tdata_fifo_out <= "0000000000" & add_22_l10S; --Write the 128 SUM on AXI FIFO_OUT_L2
                    state_sum128 <= s17;
               when s17 =>
                    s_axis_tdata_fifo_out <= "0000000000" & add_22_l11S; --Write the 128 SUM on AXI FIFO_OUT_L2
                    state_sum128 <= s18;
               when s18 =>
                    s_axis_tdata_fifo_out <= "0000000000" & add_22_l12S; --Write the 128 SUM on AXI FIFO_OUT_L2
                    state_sum128 <= s19;
               when s19 =>
                    s_axis_tdata_fifo_out <= "0000000000" & add_22_l13S; --Write the 128 SUM on AXI FIFO_OUT_L2
                    state_sum128 <= s20;
               when s20 =>
                    s_axis_tdata_fifo_out <= "0000000000" & add_22_l14S; --Write the 128 SUM on AXI FIFO_OUT_L2
                    state_sum128 <= s21;
               when s21 =>
                    s_axis_tdata_fifo_out <= "0000000000" & add_22_l15S; --Write the 128 SUM on AXI FIFO_OUT_L2
                    if (empty_sum_fifo_l1 = '1') then
                        s_axis_tlast_fifo_out <= '1';--Write LAST pixel in AXI FIFO OUT L2
                    end if;
                    state_sum128 <= s22;
               when s22 =>
                    s_axis_tvalid_fifo_out <= '0';--END Write pixel in AXI FIFO OUT L2
                    s_axis_tlast_fifo_out <= '0';
                    state_sum128 <= s23;
			   when s23 =>-----------------------*****
					wea_sum_mem		<=	"0";
--					sum_bus_rdy	<= '0';
					--Check if we are on the last GTU column (47)
					--yes=>reset the memory address
					--no=>increase the memory address
					if (pixel_col_count = "101111") then
						pixel_col_count <= "000000";
						state_sum128 <= s24;
					else
						pixel_col_count <= pixel_col_count + 1;
						state_sum128 <= s0;--reset state for the next GTU
					end if;
				when s24 =>
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
	
	CIRCULAR_MEMORY : process (CLOCK_L2)
    --Storage GTU columns in a circolar memory (MAX 16 GTU DEEP)
    --Read circular memory 
    begin
       if (CLOCK_L2'event and CLOCK_L2 = '1') then
            case (state_cir) is
                when s0 =>
                   if (cir_en = '1') then--Check if the GTU columns are ready
                       wea_cir <= "1";--Yes,write column in memory
                       addra_cir <= column_cnt;
                       state_cir <= s1; 
                       if (column_cnt = "0000000000" and m_axis_tvalid_cmd = '1') then--First GTU column in circular memory and command in FIFO
                            P_thr <= m_axis_tdata_cmd(4 downto 0);
                            N_thr <= m_axis_tdata_cmd(9 downto 5);
                            m_axis_tready_cmd <= '1';
                       end if;
                   elsif (cir_rd = '1') then--Read the circular buffer
                        state_cir <= s2; 
                   else
                        state_cir <= s0;
                   end if;
                   cir_rdy <= '0';
                   data_cir_rdy <= '0';  
               when s1 =>
                   wea_cir <= "0";
                   m_axis_tready_cmd <= '0'; 
                   case (P_thr) is  --Set the maximum columns number and check "P"
                        when "00000" =>--Set P=0 to P=1
                            column_max <= "0000101111";
                            P_thr <= "00001";
                        when "00001" =>
                            column_max <= "0000101111";-- (EC column(16*3) * P(1)) - 1 = 47
                        when "00010" =>
                            column_max <= "0001011111";-- (EC column(16*3) * P(2)) - 1 = 95
                        when "00011" =>
                            column_max <= "0010001111";-- (EC column(16*3) * P(3)) - 1 = 143
                        when "00100" =>
                            column_max <= "0010111111";-- (EC column(16*3) * P(4)) - 1 = 191
                        when "00101" =>
                            column_max <= "0011101111";-- (EC column(16*3) * P(5)) - 1 = 239
                        when "00110" =>
                            column_max <= "0100011111";-- (EC column(16*3) * P(6)) - 1 = 287
                        when "00111" =>
                            column_max <= "0101001111";-- (EC column(16*3) * P(7)) - 1 = 335
                        when "01000" =>
                            column_max <= "0101111111";-- (EC column(16*3) * P(8)) - 1 = 383
                        when "01001" =>
                            column_max <= "0110101111";-- (EC column(16*3) * P(9)) - 1 = 431
                        when "01010" =>
                            column_max <= "0111011111";-- (EC column(16*3) * P(10)) - 1 = 479
                        when "01011" =>
                            column_max <= "1000001111";-- (EC column(16*3) * P(11)) - 1 = 527
                        when "01100" =>
                            column_max <= "1000111111";-- (EC column(16*3) * P(12)) - 1 = 575
                        when "01101" =>
                            column_max <= "1001101111";-- (EC column(16*3) * P(13)) - 1 = 623
                        when "01110" =>
                            column_max <= "1010011111";-- (EC column(16*3) * P(14)) - 1 = 671
                        when "01111" =>
                            column_max <= "1011001111";-- (EC column(16*3) * P(15)) - 1 = 719
                        when "10000" =>
                            column_max <= "1011111111";-- (EC column(16*3) * P(16)) - 1 = 767
                        when others =>--Set P>16 to P=16
                            column_max <= "1011111111";
                            P_thr <= "10000";
                   end case;
                   --Check "N" value and set "N"
                   if (N_thr = "00000") then--N=0 set N=1
                        N_thr <= "00001";
                   elsif (N_thr > "10000") then--N>16 set N=16
                        N_thr <= "10000";
                   end if;
                   
                   if (column_cnt = column_max) then --Last column in circular memory
                       column_cnt <= "0000000000";
                   else
                       column_cnt <= column_cnt + 1;
                   end if;
                   
                   if (l2gtu_col = "101111") then--Check the last column of the l2gtu (48 column)
                       l2gtu_col <= "000000";
                       cir_rdy <= '1'; --Set circular memory ready,start the SUM on circular buffer
                   else
                       l2gtu_col <= l2gtu_col + 1;
                   end if;
                    
                   state_cir <= s0;
               when s2 =>--Read circular memory data
                   addra_cir <= column_addr;
                   state_cir <= s3;
               when s3 =>--Read delay
                   state_cir <= s4;
               when s4 =>--Read delay--Data ready now
                   data_cir_rdy <= '1';
                   state_cir <= s0;
           end case;
       end if;
    end process;
    
    CIRCULAR_SUM : process (CLOCK_L2)
    --SUM calculation on CIRCULAR BUFFER
    begin
        if (CLOCK_L2'event and CLOCK_L2 = '1') then
            case (state_cirsum) is
                when s0 =>
                    if (cir_rdy = '1') then
                        SCLR_accu <= '1';--Clear the accumulators
                        state_cirsum <= s1;
                    end if;
                when s1 =>
                    CE_accu <= '0';
                    SCLR_accu <= '0';
                    cir_rd <= '1';--Enable the coloumn read on circular buffer
                    state_cirsum <= s2;
                when s2 =>
                    cir_rd <= '0';
                    last_cln <= P_thr - 1;
                    if (data_cir_rdy = '1') then--Data ready
                        state_cirsum <= s3;
                        if (l2gtu_cnt < P_thr) then--Enable the accumulator for "P" L2GTU
                            CE_accu <= '1';
                            B_accu_l0  <= douta_cir(14 downto 0);
                            B_accu_l1  <= douta_cir(29 downto 15);
                            B_accu_l2  <= douta_cir(44 downto 30);
                            B_accu_l3  <= douta_cir(59 downto 45);
                            B_accu_l4  <= douta_cir(74 downto 60);
                            B_accu_l5  <= douta_cir(89 downto 75);
                            B_accu_l6  <= douta_cir(104 downto 90);
                            B_accu_l7  <= douta_cir(119 downto 105);
                            B_accu_l8  <= douta_cir(134 downto 120);
                            B_accu_l9  <= douta_cir(149 downto 135);
                            B_accu_l10 <= douta_cir(164 downto 150);
                            B_accu_l11 <= douta_cir(179 downto 165);
                            B_accu_l12 <= douta_cir(194 downto 180);
                            B_accu_l13 <= douta_cir(209 downto 195);
                            B_accu_l14 <= douta_cir(224 downto 210);
                            B_accu_l15 <= douta_cir(239 downto 225);
                        end if;   
                    end if;
                when s3 =>
                    if (l2gtu_cnt = last_cln) then--Last sum in accumulator.Keep CE_accu=1 for the last sum (delay=2)
                        state_cirsum <= s4;--Last sum in accumulator
                    else
                        CE_accu <= '0';
                        state_cirsum <= s5;
                    end if;
                when s4 =>--Enable L2 event check
                    CE_accu <= '0';
                    check_event <= '1';
                    state_cirsum <= s5;
                when s5 =>
                    check_event <= '0';
                    if (l2gtu_cnt = "01111") then--Last L2GTU (16 L2GTU)
                       l2gtu_cnt <= "00000";
                       state_cirsum <= s6;
                    else
                        l2gtu_cnt <= l2gtu_cnt + 1;
                        column_addr <= column_addr + 48;--Same column on next L2GTU
                        state_cirsum <= s1;
                    end if;
                when s6 =>
                    CE_accu <= '0';
                    if (col_cnt = "0000101111") then--Last column in a L2GTU (48 columns)
                        col_cnt <= "0000000000";
                        column_addr <= "0000000000";
                        state_cirsum <= s0;
                    else
                        col_cnt <= col_cnt + 1;
                        state_cirsum <= s7;
                    end if;
                when s7 =>
                        SCLR_accu <= '1';--Clear the accumulators for the next columns sum
                        column_addr <= col_cnt;
                        state_cirsum <= s1;
            end case;
        end if;
    end process;
        
    S_CALC : process (CLOCK_L2)
    --S calculation
    --Write/Read "S" value in S_MEMORY
    begin
        if (CLOCK_L2'event and CLOCK_L2 = '1') then
            case (state_scalc) is
                when s0 =>
                    if (sum_bus_rdy = '1') then--(128 L2GTU)
                    
                        --N*P calculation
                        A_mult_5x5 <= N_thr;
                        B_mult_5x5 <= P_thr;
                        
                        --Check if SUM/128 < 13,if TRUE,set SUM/128=13
                        if (sum_bus_l0 < "000000000001101") then
                            sum_l0 <= "000000000001101";
                        else
                            sum_l0 <= sum_bus_l0;
                        end if; 
                        if (sum_bus_l1 < "000000000001101") then
                            sum_l1 <= "000000000001101";
                        else
                            sum_l1 <= sum_bus_l1;
                        end if; 
                        if (sum_bus_l2 < "000000000001101") then
                            sum_l2 <= "000000000001101";
                        else
                            sum_l2 <= sum_bus_l2;
                        end if; 
                        if (sum_bus_l3 < "000000000001101") then
                            sum_l3 <= "000000000001101";
                        else
                            sum_l3 <= sum_bus_l3;
                        end if; 
                        if (sum_bus_l4 < "000000000001101") then
                            sum_l4 <= "000000000001101";
                        else
                            sum_l4 <= sum_bus_l4;
                        end if; 
                        if (sum_bus_l5 < "000000000001101") then
                            sum_l5 <= "000000000001101";
                        else
                            sum_l5 <= sum_bus_l5;
                        end if; 
                        if (sum_bus_l6 < "000000000001101") then
                            sum_l6 <= "000000000001101";
                        else
                            sum_l6 <= sum_bus_l6;
                        end if; 
                        if (sum_bus_l7 < "000000000001101") then
                            sum_l7 <= "000000000001101";
                        else
                            sum_l7 <= sum_bus_l7;
                        end if; 
                        if (sum_bus_l8 < "000000000001101") then
                            sum_l8 <= "000000000001101";
                        else
                            sum_l8 <= sum_bus_l8;
                        end if; 
                        if (sum_bus_l9 < "000000000001101") then
                            sum_l9 <= "000000000001101";
                        else
                            sum_l9 <= sum_bus_l9;
                        end if; 
                        if (sum_bus_l10 < "000000000001101") then
                            sum_l10 <= "000000000001101";
                        else
                            sum_l10 <= sum_bus_l10;
                        end if; 
                        if (sum_bus_l11 < "000000000001101") then
                            sum_l11 <= "000000000001101";
                        else
                            sum_l11 <= sum_bus_l11;
                        end if; 
                        if (sum_bus_l12 < "000000000001101") then
                            sum_l12 <= "000000000001101";
                        else
                            sum_l12 <= sum_bus_l12;
                        end if; 
                        if (sum_bus_l13 < "000000000001101") then
                            sum_l13 <= "000000000001101";
                        else
                            sum_l13 <= sum_bus_l13;
                        end if; 
                        if (sum_bus_l14 < "000000000001101") then
                            sum_l14 <= "000000000001101";
                        else
                            sum_l14 <= sum_bus_l14;
                        end if; 
                        if (sum_bus_l15 < "000000000001101") then
                            sum_l15 <= "000000000001101";
                        else
                            sum_l15 <= sum_bus_l15;
                        end if; 
                        
                        state_scalc <= s1;
                        
                    elsif (read_S = '1') then--Read S_MEMORY
                        state_scalc <= s11;
                    else 
                        state_scalc <= s0;
                    end if;
                when s1 =>--Mult. delay
                    state_scalc <= s2;
                when s2 =>--Mult. delay
                    state_scalc <= s3;
                when s3 =>--Mult. delay
                    state_scalc <= s4;
                when s4 =>--S=(SUM/128)*(N*P)
                    A_mult_15x10_l0 <= sum_l0;
                    B_mult_15x10_l0 <= P_mult_5x5;
                    
                    A_mult_15x10_l1 <= sum_l1;
                    B_mult_15x10_l1 <= P_mult_5x5;
                    
                    A_mult_15x10_l2 <= sum_l2;
                    B_mult_15x10_l2 <= P_mult_5x5;
                    
                    A_mult_15x10_l3 <= sum_l3;
                    B_mult_15x10_l3 <= P_mult_5x5;
                    
                    A_mult_15x10_l4 <= sum_l4;
                    B_mult_15x10_l4 <= P_mult_5x5;
                    
                    A_mult_15x10_l5 <= sum_l5;
                    B_mult_15x10_l5 <= P_mult_5x5;
                    
                    A_mult_15x10_l6 <= sum_l6;
                    B_mult_15x10_l6 <= P_mult_5x5;
                    
                    A_mult_15x10_l7 <= sum_l7;
                    B_mult_15x10_l7 <= P_mult_5x5;
                    
                    A_mult_15x10_l8 <= sum_l8;
                    B_mult_15x10_l8 <= P_mult_5x5;
                    
                    A_mult_15x10_l9 <= sum_l9;
                    B_mult_15x10_l9 <= P_mult_5x5;
                    
                    A_mult_15x10_l10 <= sum_l10;
                    B_mult_15x10_l10 <= P_mult_5x5;
                    
                    A_mult_15x10_l11 <= sum_l11;
                    B_mult_15x10_l11 <= P_mult_5x5;
                    
                    A_mult_15x10_l12 <= sum_l12;
                    B_mult_15x10_l12 <= P_mult_5x5;
                    
                    A_mult_15x10_l13 <= sum_l13;
                    B_mult_15x10_l13 <= P_mult_5x5;
                    
                    A_mult_15x10_l14 <= sum_l14;
                    B_mult_15x10_l14 <= P_mult_5x5;
                    
                    A_mult_15x10_l15 <= sum_l15;
                    B_mult_15x10_l15 <= P_mult_5x5;
                    
                    state_scalc <= s5;
                    
                when s5 =>--Delay mult.
                    state_scalc <= s6;
                when s6 =>--Delay mult.
                    state_scalc <= s7;
                when s7 =>--Delay mult.
                    state_scalc <= s8;
                when s8 =>--Write "S" value column in S_MEMORY (HALF Memory for "Old S",half memory for "New_S")
                     wea_smem <= "1";
                     dina_smem(24 downto 0)     <= P_mult_15x10_l0;
                     dina_smem(49 downto 25)    <= P_mult_15x10_l1;
                     dina_smem(74 downto 50)    <= P_mult_15x10_l2;
                     dina_smem(99 downto 75)    <= P_mult_15x10_l3;
                     dina_smem(124 downto 100)  <= P_mult_15x10_l4;
                     dina_smem(149 downto 125)  <= P_mult_15x10_l5;
                     dina_smem(174 downto 150)  <= P_mult_15x10_l6;
                     dina_smem(199 downto 175)  <= P_mult_15x10_l7;
                     dina_smem(224 downto 200)  <= P_mult_15x10_l8;
                     dina_smem(249 downto 225)  <= P_mult_15x10_l9;
                     dina_smem(274 downto 250)  <= P_mult_15x10_l10;
                     dina_smem(299 downto 275)  <= P_mult_15x10_l11;
                     dina_smem(324 downto 300)  <= P_mult_15x10_l12;
                     dina_smem(349 downto 325)  <= P_mult_15x10_l13;
                     dina_smem(374 downto 350)  <= P_mult_15x10_l14;
                     dina_smem(399 downto 375)  <= P_mult_15x10_l15;
                     state_scalc <= s9;
                when s9 =>
                     wea_smem <= "0";
                     if (Sw_addr = "1011111") then--Last column in S_MEMORY
                         Sw_addr <= "0000000";
                     else
                         Sw_addr <= Sw_addr + 1;
                     end if;
                     state_scalc <= s10;
                when s10 =>
                     addra_smem <= Sw_addr;
                     state_scalc <= s0;
                when s11 =>--Read S_MEMORY
                     addra_smem <= Sr_addr;
                     state_scalc <= s12;
                when s12 =>--Read delay
                     state_scalc <= s13;
                when s13 =>--Read delay
                     state_scalc <= s14;
                when s14 =>--Set "S" value ready
                     Srdy <= '1';
                     state_scalc <= s15;
                when s15 =>--Restore write address after the read
                     addra_smem <= Sw_addr;
                     Srdy <= '0'; 
                     state_scalc <= s0;
            end case;
        end if;
    end process;
    
    L2_EVENT_CHECK : process (CLOCK_L2)
    --Check L2 event
    begin
        if (CLOCK_L2'event and CLOCK_L2 = '1') then
            case (state_event) is
                when s0 =>
                    L2_event <= '0';
                    if (check_event = '1') then --Sum on "P" L2GTU ready
                        Psum_l0  <= Q_accu_l0;
                        Psum_l1  <= Q_accu_l1;
                        Psum_l2  <= Q_accu_l2;
                        Psum_l3  <= Q_accu_l3;
                        Psum_l4  <= Q_accu_l4;
                        Psum_l5  <= Q_accu_l5;
                        Psum_l6  <= Q_accu_l6;
                        Psum_l7  <= Q_accu_l7;
                        Psum_l8  <= Q_accu_l8;
                        Psum_l9  <= Q_accu_l9;
                        Psum_l10 <= Q_accu_l10;
                        Psum_l11 <= Q_accu_l11;
                        Psum_l12 <= Q_accu_l12;
                        Psum_l13 <= Q_accu_l13;
                        Psum_l14 <= Q_accu_l14;
                        Psum_l15 <= Q_accu_l15;
                        state_event <= s1;
                    end if;
                    if (sum_bus_rdy = '1') then--(128 L2GTU)
                        P_delay <= P_thr + 1;--Apply "S" after "P_delay" L2GTU
                    end if;
                when s1 =>
                    if (P_delay = "00000") then--Switch address to the second half of memory
                        if (Sw_addr = "0000000") then
                            Sr_addr <= Sr_column + 48;
                        else
                            Sr_addr <= Sr_column;
                        end if;
                    else
                        Sr_addr <= Sw_addr + Sr_column;
                    end if;    
                    read_S <= '1';--Enable read of S_MEMORY
                    state_event <= s2;
                when s2 =>
                    read_S <= '0';
                    if (Srdy = '1') then--S value ready
                        if ("000000"&Psum_l0 > douta_smem(24 downto 0)) then
                            col_event(0) <= '1';--Column event (line 0)
                        end if;
                        if ("000000"&Psum_l1 > douta_smem(49 downto 25)) then
                            col_event(1) <= '1';--Column event (line 0)
                        end if;
                        if ("000000"&Psum_l2 > douta_smem(74 downto 50)) then
                            col_event(2) <= '1';--Column event (line 0)
                        end if;
                        if ("000000"&Psum_l3 > douta_smem(99 downto 75)) then
                            col_event(3) <= '1';--Column event (line 0)
                        end if;
                        if ("000000"&Psum_l4 > douta_smem(124 downto 100)) then
                            col_event(4) <= '1';--Column event (line 0)
                        end if;
                        if ("000000"&Psum_l5 > douta_smem(149 downto 125)) then
                            col_event(5) <= '1';--Column event (line 0)
                        end if;
                        if ("000000"&Psum_l6 > douta_smem(174 downto 150)) then
                            col_event(6) <= '1';--Column event (line 0)
                        end if;
                        if ("000000"&Psum_l7 > douta_smem(199 downto 175)) then
                            col_event(7) <= '1';--Column event (line 0)
                        end if;
                        if ("000000"&Psum_l8 > douta_smem(224 downto 200)) then
                            col_event(8) <= '1';--Column event (line 0)
                        end if;
                        if ("000000"&Psum_l9 > douta_smem(249 downto 225)) then
                            col_event(9) <= '1';--Column event (line 0)
                        end if;
                        if ("000000"&Psum_l10 > douta_smem(274 downto 250)) then
                            col_event(10) <= '1';--Column event (line 0)
                        end if;
                        if ("000000"&Psum_l11 > douta_smem(299 downto 275)) then
                            col_event(11) <= '1';--Column event (line 0)
                        end if;
                        if ("000000"&Psum_l12 > douta_smem(324 downto 300)) then
                            col_event(12) <= '1';--Column event (line 0)
                        end if;
                        if ("000000"&Psum_l13 > douta_smem(349 downto 325)) then
                            col_event(13) <= '1';--Column event (line 0)
                        end if;
                        if ("000000"&Psum_l14 > douta_smem(374 downto 350)) then
                            col_event(14) <= '1';--Column event (line 0)
                        end if;
                        if ("000000"&Psum_l15 > douta_smem(399 downto 375)) then
                            col_event(15) <= '1';--Column event (line 0)
                        end if;
                         
                        state_event <= s3;
                    end if;   
                when s3 =>
                    if (Sr_column = "0101111") then--Last L2GTU column
                        Sr_column <= "0000000";
                        
                        if (P_delay > "00000") then--Check P_delay
                            P_delay <= P_delay - 1;
                        end if;
                        
                        if (col_event > "0000000000000000") then--Check if there is a event in a L2GTU
                            L2_event <= '1';
                            col_event <= "0000000000000000";
                        end if;
                    else
                        Sr_column <= Sr_column + 1;
                    end if;
                    state_event <= s0;
            end case;
        end if;
    end process;
                                                               
				        	
end Behavioral;