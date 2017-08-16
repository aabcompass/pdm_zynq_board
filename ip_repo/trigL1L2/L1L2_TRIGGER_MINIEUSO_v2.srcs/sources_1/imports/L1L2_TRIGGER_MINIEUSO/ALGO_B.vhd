----------------------------------------------------------------------------------
-- Company: INFN TORINO
-- Engineer: M.Mignone
-- Create Date:    14:11:24 10/2016 
--
-- Algo_B MINIEUSO
--
-- Design Name: 
-- Module Name:    ALGO_B - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: TOP MODULE L1L2 TRIGGER
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

entity ALGO_B is port (
	CLOCK_200			:	in	std_logic;
	---------------------------MINIEUSO-------------------
	DATA			    :	in	std_logic_vector(15 downto 0);
	FRAME			    :	in	std_logic;
	------------------------------------------------------
	L1_EVENT            :   out std_logic--;
--	L2_EVENT            :   out std_logic;
--	------------------------------------------------------
--	--AXI4 Stream FIFO L1
--	s_aresetn_L1		:	in	std_logic;
--	m_aclk_L1 			:	in	std_logic;
--	m_axis_tvalid_L1 	:	out	std_logic;
--	m_axis_tready_L1	: 	in	std_logic;
--    m_axis_tdata_L1	    : 	out	std_logic_vector(31 downto 0);
--    m_axis_tlast_L1     :   out std_logic;
--    --AXI4 Stream FIFO DATA OUT L2
--    s_aresetn_L2        :   in  std_logic;
--    m_aclk_L2           :   in  std_logic;
--    m_axis_tvalid_L2    :   out std_logic;
--    m_axis_tready_L2    :   in  std_logic;
--    m_axis_tdata_L2     :   out std_logic_vector(31 downto 0);
--    m_axis_tlast_L2     :   out std_logic;
--    --AXI4 Stream FIFO (COMMAND IN L2)
--    s_aclk_cmd          :   IN STD_LOGIC;
--    s_aresetn_cmd       :   IN STD_LOGIC;
--    s_axis_tvalid_cmd   :   IN STD_LOGIC;
--    s_axis_tready_cmd   :   OUT STD_LOGIC;
--    s_axis_tdata_cmd    :   IN STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
	
end ALGO_B;

architecture Behavioral of ALGO_B is

signal  clock                   : std_logic;
signal  clock_l2                : std_logic;

--SUM_FIFO L1 (dataoutput for L2)
signal  rd_clk_l1               : std_logic;
signal  dout_sum_fifo_l1        : std_logic_vector(239 downto 0);
signal  rd_en_sum_fifo_l1       : std_logic;
signal  empty_sum_fifo_l1       : std_logic;

component MMCM_CLK
port
 (-- Clock in ports
  clk_in1           : in     std_logic;
  -- Clock out ports
  clk_out1          : out    std_logic;
  clk_out2          : out    std_logic
 );
end component;

component L1
    port (
        CLOCK			    :  in  std_logic;
        ---------------------------MINIEUSO-------------------
        DATA                :  in  std_logic_vector(15 downto 0);
        FRAME               :  in  std_logic;
        ------------------------------------------------------
        L1_EVENT            :  out std_logic;
        ------------------------------------------------------
        --AXI4 Stream FIFO
        s_aresetn           :  in  std_logic;
        m_aclk              :  in  std_logic;
        m_axis_tvalid       :  out std_logic;
        m_axis_tready       :  in  std_logic;
        m_axis_tdata        :  out std_logic_vector(31 downto 0);
        m_axis_tlast        :  out std_logic;
        --FIFO Dataoutput for L2
        rd_clk_l1           :  in  std_logic;
        empty_sum_fifo_l1   :  out std_logic;
        rd_en_sum_fifo_l1   :  in  std_logic;
        dout_sum_fifo_l1    :  out std_logic_vector(239 downto 0)
        );
end component L1;

component format_converter is
    Port ( clk : in STD_LOGIC;
           datain : in STD_LOGIC_VECTOR (7 downto 0);
           dataout : out STD_LOGIC_VECTOR (7 downto 0);
           frame_in : in STD_LOGIC;
           frame_out : out STD_LOGIC);
end component;

--component L2
--    port (
--	   CLOCK_L2			    :	in	std_logic;
--	   --Data INPUT for L2
--	   rd_clk_l1            :   out  std_logic;
--	   empty_sum_fifo_l1    :   in   std_logic;
--       rd_en_sum_fifo_l1    :   out  std_logic;
--       dout_sum_fifo_l1     :   in   std_logic_vector(239 downto 0);
--       --AXI4 Stream FIFO (DATA OUT)
--       s_aresetn            :   in   std_logic;
--       m_aclk               :   in   std_logic;
--       m_axis_tvalid        :   out  std_logic;
--       m_axis_tready        :   in   std_logic;
--       m_axis_tdata         :   out  std_logic_vector(31 downto 0);
--       m_axis_tlast         :   out  std_logic;
--       --AXI4 Stream FIFO (COMMAND IN)
--       s_aclk_cmd           :   IN STD_LOGIC;
--       s_aresetn_cmd        :   IN STD_LOGIC;
--       s_axis_tvalid_cmd    :   IN STD_LOGIC;
--       s_axis_tready_cmd    :   OUT STD_LOGIC;
--       s_axis_tdata_cmd     :   IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--       --L2 EVENT
--       L2_event             :   out std_logic
--	   );	
--end component L2;

	signal DATA_conv: std_logic_vector(15 downto 0);
	signal FRAME_conv: std_logic;

begin

--MMCM_CLK_L1L2 : MMCM_CLK
--   port map ( 
--   -- Clock in ports
--   clk_in1  => CLOCK_200,
--  -- Clock out ports  
--   clk_out1 => CLOCK,
--   clk_out2 => CLOCK_L2              
-- );


i_format_converter_h : format_converter 
    Port map( clk 	=> CLOCK_200,--: in STD_LOGIC;
           datain 	=> DATA(15 downto 8),--: in STD_LOGIC_VECTOR (7 downto 0);
           dataout 	=> DATA_conv(15 downto 8),--: out STD_LOGIC_VECTOR (7 downto 0);
           frame_in 	=> FRAME,--: in STD_LOGIC;
           frame_out 	=> FRAME_conv--: out STD_LOGIC);
	);

i_format_converter_l : format_converter 
    Port map( clk 	=> CLOCK_200,--: in STD_LOGIC;
           datain 	=> DATA(7 downto 0),--: in STD_LOGIC_VECTOR (7 downto 0);
           dataout 	=> DATA_conv(7 downto 0),--: out STD_LOGIC_VECTOR (7 downto 0);
           frame_in 	=> FRAME,--: in STD_LOGIC;
           frame_out 	=> open--: out STD_LOGIC);
	);


L1_TRIGGER : L1
    port map (
    CLOCK               => CLOCK_200,
    DATA                => DATA_conv,
    FRAME               => FRAME_conv,
    L1_EVENT            => L1_EVENT,
    ------------------------------------------------------
    --AXI4 Stream FIFO
    s_aresetn           => '1',--s_aresetn_L1,
    m_aclk              => CLOCK_200,--m_aclk_L1,
    m_axis_tvalid       => open,--m_axis_tvalid_L1,
    m_axis_tready       => '1',--m_axis_tready_L1,
    m_axis_tdata        => open,--m_axis_tdata_L1,
    m_axis_tlast        => open,--m_axis_tlast_L1,
    -----------------------------
    rd_clk_l1           => rd_clk_l1,
    empty_sum_fifo_l1   => empty_sum_fifo_l1,
    rd_en_sum_fifo_l1   => rd_en_sum_fifo_l1,
    dout_sum_fifo_l1    => dout_sum_fifo_l1
    );
    
--L2_TRIGGER : L2
--    port map (
--    CLOCK_L2            => CLOCK_L2,
--    rd_clk_l1           => rd_clk_l1,
--    empty_sum_fifo_l1   => empty_sum_fifo_l1,
--    rd_en_sum_fifo_l1   => rd_en_sum_fifo_l1,
--    dout_sum_fifo_l1    => dout_sum_fifo_l1,
--    --AXI4 Stream FIFO
--    s_aresetn           => s_aresetn_L2,
--    m_aclk              => m_aclk_L2,
--    m_axis_tvalid       => m_axis_tvalid_L2,
--    m_axis_tready       => m_axis_tready_L2,
--    m_axis_tdata        => m_axis_tdata_L2,
--    m_axis_tlast        => m_axis_tlast_L2,
--    --AXI4 Stream FIFO (COMMAND IN)
--    s_aclk_cmd          => s_aclk_cmd,
--    s_aresetn_cmd       => s_aresetn_cmd,
--    s_axis_tvalid_cmd   => s_axis_tvalid_cmd,
--    s_axis_tready_cmd   => s_axis_tready_cmd,
--    s_axis_tdata_cmd    => s_axis_tdata_cmd,
--    L2_event            => L2_event
--    );
				
end Behavioral;