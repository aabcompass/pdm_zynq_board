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

Library xpm;
use xpm.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALGO_B is port (
	S00_AXIS_ACLK			:	in	std_logic;
	S01_AXIS_ACLK			:	in	std_logic;
	---------------------------MINIEUSO-------------------
	S00_AXIS_TDATA			    :	in	std_logic_vector(7 downto 0);
	S00_AXIS_TVALID			    :	in	std_logic;
	S00_AXIS_TREADY			    :	out	std_logic := '1';
	------------------------------------------------------
	S01_AXIS_TDATA			    :	in	std_logic_vector(7 downto 0);
	S01_AXIS_TVALID			    :	in	std_logic;
	S01_AXIS_TREADY			    :	out	std_logic := '1';	
	------------------------------------------------------
	L1_EVENT            :   out std_logic;
	-- inputs forwarding for TA trigger tests
	data_conv_out: out std_logic_vector(15 downto 0);
	frame_conv_out: out std_logic;
	--parameters
	s_max:   in std_logic_vector(11 downto 0) 
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

signal s_max_synced: std_logic_vector(11 downto 0);

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
        dout_sum_fifo_l1    :  out std_logic_vector(239 downto 0);
        -- parameters
        s_max:   in std_logic_vector(11 downto 0) 
        );
end component L1;

component format_converter is
    Port ( clk : in STD_LOGIC;
           datain : in STD_LOGIC_VECTOR (7 downto 0);
           dataout : out STD_LOGIC_VECTOR (7 downto 0);
           frame_in : in STD_LOGIC;
           frame_out : out STD_LOGIC);
end component;


	signal DATA_conv: std_logic_vector(15 downto 0);
	signal FRAME_conv: std_logic;

begin



i_format_converter_h : format_converter 
    Port map( clk 	=> S00_AXIS_ACLK,--: in STD_LOGIC;
           datain 	=> S00_AXIS_TDATA,--: in STD_LOGIC_VECTOR (7 downto 0);
           dataout 	=> DATA_conv(15 downto 8),--: out STD_LOGIC_VECTOR (7 downto 0);
           frame_in 	=> S00_AXIS_TVALID,--: in STD_LOGIC;
           frame_out 	=> FRAME_conv--: out STD_LOGIC);
	);

i_format_converter_l : format_converter 
    Port map( clk 	=> S01_AXIS_ACLK,--: in STD_LOGIC;
           datain 	=> S01_AXIS_TDATA,--: in STD_LOGIC_VECTOR (7 downto 0);
           dataout 	=> DATA_conv(7 downto 0),--: out STD_LOGIC_VECTOR (7 downto 0);
           frame_in 	=> S01_AXIS_TVALID,--: in STD_LOGIC;
           frame_out 	=> open--: out STD_LOGIC);
	);

	data_conv_out <= DATA_conv;
	frame_conv_out <= FRAME_conv;
	
	
xpm_cdc_array_single_inst: xpm_cdc_array_single
	  generic map (
	
	    -- Common module generics
	    DEST_SYNC_FF   => 4, -- integer; range: 2-10
	    SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
	    SRC_INPUT_REG  => 0, -- integer; 0=do not register input, 1=register input
	    WIDTH          => 12  -- integer; range: 2-1024
	
	  )
	  port map (
	
	    src_clk  => '0',  -- optional; required when SRC_INPUT_REG = 1
	    src_in   => s_max,
	    dest_clk => S00_AXIS_ACLK,
	    dest_out => s_max_synced
	  );
	

	L1_TRIGGER : L1
    port map (
    CLOCK               => S00_AXIS_ACLK,
    DATA                => DATA_conv,
    FRAME               => FRAME_conv,
    L1_EVENT            => L1_EVENT,
    ------------------------------------------------------
    --AXI4 Stream FIFO
    s_aresetn           => '1',--s_aresetn_L1,
    m_aclk              => S00_AXIS_ACLK,--m_aclk_L1,
    m_axis_tvalid       => open,--m_axis_tvalid_L1,
    m_axis_tready       => '1',--m_axis_tready_L1,
    m_axis_tdata        => open,--m_axis_tdata_L1,
    m_axis_tlast        => open,--m_axis_tlast_L1,
    -----------------------------
    rd_clk_l1           => rd_clk_l1,
    empty_sum_fifo_l1   => empty_sum_fifo_l1,
    rd_en_sum_fifo_l1   => rd_en_sum_fifo_l1,
    dout_sum_fifo_l1    => dout_sum_fifo_l1,
    -- parameters
    s_max => s_max_synced
    );
    
				
end Behavioral;