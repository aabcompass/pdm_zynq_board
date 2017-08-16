----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/19/2017 09:21:36 AM
-- Design Name: 
-- Module Name: algo_b_conv - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity algo_b_conv is
  Port 
  ( 
  	s_axis_aclk			:	in	std_logic;
  ---------------------------MINIEUSO-------------------
  s_axis_TDATA			:	in	std_logic_vector(15 downto 0);
  s_axis_tvalid			:	in	std_logic;
  s_axis_tready			:	out	std_logic := '1';
  ------------------------------------------------------
  L1_EVENT        :   out std_logic
  ------------------------------------------------------
--  --AXI4 Stream FIFO
--  s_aresetn		:	in	std_logic;
--  m_aclk 			:	in	std_logic;
--  m_axis_tvalid 	:	out	std_logic;
--  m_axis_tready	: 	in	std_logic;
--    m_axis_tdata	: 	out	std_logic_vector(31 downto 0);
--    m_axis_tlast    :   out std_logic

  );
end algo_b_conv;

architecture Behavioral of algo_b_conv is




component format_converter is
    Port ( clk : in STD_LOGIC;
           datain : in STD_LOGIC_VECTOR (7 downto 0);
           dataout : out STD_LOGIC_VECTOR (7 downto 0);
           frame_in : in STD_LOGIC;
           frame_out : out STD_LOGIC);
end component;

component ALGO_B is port 
(
		CLOCK			:	in	std_logic;
		---------------------------MINIEUSO-------------------
		s_axis_TDATA			:	in	std_logic_vector(15 downto 0);
		s_axis_tvalid			:	in	std_logic;
		s_axis_tready			:	out	std_logic := '1';
		------------------------------------------------------
		L1_EVENT        :   out std_logic;
		------------------------------------------------------
		--AXI4 Stream FIFO
		s_aresetn		:	in	std_logic;
		m_aclk 			:	in	std_logic;
		m_axis_tvalid 	:	out	std_logic;
		m_axis_tready	: 	in	std_logic;
    m_axis_tdata	: 	out	std_logic_vector(31 downto 0);
    m_axis_tlast    :   out std_logic
	);
	
end component;

signal s_axis_TDATA_conv: std_logic_vector(15 downto 0);
signal s_axis_tvalid_conv: std_logic := '0';

begin

i_format_converter_h : format_converter 
    Port map( clk 	=> s_axis_aclk,--: in STD_LOGIC;
           datain 	=> s_axis_TDATA(15 downto 8),--: in STD_LOGIC_VECTOR (7 downto 0);
           dataout 	=> s_axis_TDATA_conv(15 downto 8),--: out STD_LOGIC_VECTOR (7 downto 0);
           frame_in 	=> s_axis_tvalid,--: in STD_LOGIC;
           frame_out 	=> s_axis_tvalid_conv--: out STD_LOGIC);
	);

i_format_converter_l : format_converter 
    Port map( clk 	=> s_axis_aclk,--: in STD_LOGIC;
           datain 	=> s_axis_TDATA(7 downto 0),--: in STD_LOGIC_VECTOR (7 downto 0);
           dataout 	=> s_axis_TDATA_conv(7 downto 0),--: out STD_LOGIC_VECTOR (7 downto 0);
           frame_in 	=> s_axis_tvalid,--: in STD_LOGIC;
           frame_out 	=> open--: out STD_LOGIC);
	);
	
i_ALGO_B: ALGO_B
port map 
(
		CLOCK		=> 	s_axis_aclk,--:	in	std_logic;
		---------------------------MINIEUSO-------------------
		s_axis_TDATA	=> s_axis_TDATA_conv,	--:	in	std_logic_vector(15 downto 0);
		s_axis_tvalid	=> 	s_axis_tvalid_conv	,--:	in	std_logic;
		s_axis_tready	=> open,		--:	out	std_logic := '1';
		------------------------------------------------------
		L1_EVENT  =>  L1_EVENT ,    --:   out std_logic;
		------------------------------------------------------
		--AXI4 Stream FIFO
		s_aresetn	=> 	'1',--:	in	std_logic;
		m_aclk 	=> 	s_axis_aclk,	--:	in	std_logic;
		m_axis_tvalid => 	open,--:	out	std_logic;
		m_axis_tready	=> '1',--: 	in	std_logic;
    m_axis_tdata	=> open,--: 	out	std_logic_vector(31 downto 0);
    m_axis_tlast => open   --:   out std_logic
	);

end Behavioral;
