----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2016 04:13:20 PM
-- Design Name: 
-- Module Name: hv_tb - Behavioral
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

entity hv_tb is
--  Port ( );
end hv_tb;

architecture Behavioral of hv_tb is

	component HV_v2 is
		port(   
					RESET                       : in std_logic;
					PDM_CLK                     : in std_logic;
					gtu_width										: in std_logic_vector(4 downto 0); --min 2
					
					GTU_HV                    	 : out std_logic;
					CLK_HV                    	 : out std_logic;
					DATA_HV                     : out std_logic;
					COMMAND							 : in std_logic_vector(31 downto 0);
					TRANSMIT 						 : in std_logic;			
					TEST                        : out std_logic_vector(31 downto 0)
				);
	end component;

	
	constant period_pdm_clk: time := 5 ns;
	signal PDM_CLK: std_logic := '0';
	signal TRANSMIT: std_logic := '0';
	signal COMMAND: std_logic_vector(31 downto 0) := (others => '0');
	signal PDM_CLK_counter: integer := 0;

begin

	clk_gen: process
	begin
		PDM_CLK <= '1';
		wait for period_pdm_clk / 2;
		PDM_CLK <= '0';
		wait for period_pdm_clk / 2;
		PDM_CLK_counter <= PDM_CLK_counter + 1;
	end process;

	dut: HV_v2
			port map(   
						RESET => '0', --                     : in std_logic;
						PDM_CLK  =>  PDM_CLK,--                   : in std_logic;
						gtu_width => "00011",
						GTU_HV   => open , --                	 : out std_logic;
						CLK_HV   =>  open, --                	 : out std_logic;
						DATA_HV   => open ,  --                : out std_logic;
						COMMAND	 => COMMAND	,	--				 : in std_logic_vector(31 downto 0);
						TRANSMIT  => TRANSMIT,		--				 : in std_logic;			
						TEST    => open    --                : out std_logic_vector(31 downto 0)
					);


	tb_process: process
	begin
		wait until PDM_CLK_counter = 350*4;
		COMMAND(19 downto 18) <= "01";
		COMMAND(17 downto 0) <= "111110101010101010";
		wait until PDM_CLK_counter = 354*4;
		TRANSMIT <= '1';
		wait until PDM_CLK_counter = 358*4;
		TRANSMIT <= '0';
		wait until PDM_CLK_counter = 740*4;
		COMMAND(19 downto 18) <= "01";
		COMMAND(17 downto 0) <= "111111111111111111";
		wait until PDM_CLK_counter = 750*4;
		TRANSMIT <= '1';
		wait until PDM_CLK_counter = 754*4;
		TRANSMIT <= '0';
		wait;
	end process;

end Behavioral;
