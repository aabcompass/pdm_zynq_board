----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2016 04:56:45 PM
-- Design Name: 
-- Module Name: spi_if_tb - Behavioral
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

entity spi_if_tb is
end spi_if_tb;

architecture Behavioral of spi_if_tb is

	component spi_if
    generic (C_SPI_RATIO: integer := 5);
    Port ( 
    			 clk : in STD_LOGIC;
           --external pins
           sck : out STD_LOGIC := '1';
           mosi : out STD_LOGIC;
           miso : in STD_LOGIC;
           cs_exp : out STD_LOGIC := '1';
           cs_dac : out STD_LOGIC := '1';
           -- control if
           start : in STD_LOGIC;
           exp_not_dac: in std_logic;
           ready : out std_logic := '0';
           datain : in STD_LOGIC_VECTOR (23 downto 0);
           datain2 : in STD_LOGIC_VECTOR (23 downto 0);
           datain3 : in STD_LOGIC_VECTOR (23 downto 0);
           dataout : out STD_LOGIC_VECTOR (7 downto 0)
           );
	end component;
	
	signal clk_counter: integer := 0;
	signal clk: std_logic := '0';
	signal start: std_logic := '0';

begin

	process
	begin
		clk <= '1';
		wait for 5 ns;
		clk <= '0';
		wait for 5 ns;
	end process;
	
	sim: process
	begin
		start <= '0';
		wait until clk_counter = 10;
		start <= '1';
		wait until clk_counter = 11;
		start <= '0';
		wait until clk_counter = 10010;
		start <= '1';
		wait until clk_counter = 10011;
		start <= '0';
		wait;
	end process;
	
	clk_counter <= clk_counter + 1 when rising_edge(clk);

	dut: spi_if
    Port map ( 
			 clk => clk,--: in STD_LOGIC;
			 --external pins
			 sck => open,--: out STD_LOGIC := '1';
			 mosi => open, --: out STD_LOGIC;
			 miso => '0',--: in STD_LOGIC;
			 cs_exp => open,--: out STD_LOGIC;
			 cs_dac => open,--: out STD_LOGIC;
			 -- control if
			 start => start,--: in STD_LOGIC;
			 exp_not_dac => '0',--: in std_logic; 
			 ready => open,
			 datain => X"123456", --: in STD_LOGIC_VECTOR (23 downto 0);
			 datain2 => X"123456", --: in STD_LOGIC_VECTOR (23 downto 0);
			 datain3 => X"789ABC", --: in STD_LOGIC_VECTOR (23 downto 0);
			 dataout => open--: out STD_LOGIC_VECTOR (7 downto 0)
			 );


end Behavioral;
