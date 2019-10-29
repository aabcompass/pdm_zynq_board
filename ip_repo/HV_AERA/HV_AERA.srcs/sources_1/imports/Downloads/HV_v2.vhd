----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:20:11 06/27/2016 
-- Design Name: 
-- Module Name:    HV - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity HV_v2 is
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
end HV_v2;
 
architecture Behavioral of HV_v2 is

		attribute KEEP_HIERARCHY : string;
		attribute KEEP_HIERARCHY of Behavioral: architecture is "TRUE";


signal clk_cnt										 : std_logic_vector(3 downto 0):=(others=>'0');
signal command_in_1								 : std_logic_vector(17 downto 0):=(others=>'0');
signal command_in_2								 : std_logic_vector(17 downto 0):=(others=>'0');
signal command_in_3								 : std_logic_vector(17 downto 0):=(others=>'0');
signal clk_bufg				              	 : std_logic:='0';
signal cnt_1						 	 			 : integer range 0 to 24 :=0;
signal gtu_hv_1				              	 : std_logic:='0';
signal data_hv_1				              	 : std_logic:='0';
signal done_1				              	 	 : std_logic:='0';
signal start_1				              	 	 : std_logic:='0';

-- by Alexander B.
signal Aera_clk				              	 	 : std_logic:='0';
signal Aera_clk_d1				              	 	 : std_logic:='0';

begin

-- Changes by Alexander B.
--BUFG_CLK_HK_CLK_inst : BUFG
--	port map (
--		O => clk_bufg, -- 1-bit Clock buffer output
--		I => clk_cnt(1) -- 1-bit Clock buffer input
--	);
	
	Aera_clk <= clk_cnt(3);
	clk_bufg <= Aera_clk;
	Aera_clk_d1 <= Aera_clk when rising_edge(PDM_CLK);
	
process(PDM_CLK, RESET)
begin
if RESET='1' then 
	clk_cnt<=(others=>'0');
	command_in_1 <=(others=>'0');
	start_1 <= '0';
elsif PDM_CLK='1' and PDM_CLK'event then 
	clk_cnt<=clk_cnt + 1;
	if TRANSMIT='1' then 
		if COMMAND (19 downto 18) = "01" then 
			command_in_1 <= COMMAND (17 downto 0);
			start_1 <= '1';
		else
			command_in_1 <= command_in_1;
			start_1 <= '0';
		end if;
	else
		command_in_1 <= command_in_1;
		if done_1 ='1' then 
			start_1 <= '0';
		else
			start_1 <= start_1;
		end if;
	end if;
end if;
end process;

process(PDM_CLK, RESET)
begin
	if RESET='1' then 
		cnt_1 <= 0;
		--gtu_hv_1 <= '0';
		data_hv_1 <= '0';
		command_in_2 <= (others=>'0');
		command_in_3 <= (others=>'0');
		done_1<='0';
--elsif clk_bufg='1' and clk_bufg'event then  -- by Alexander B.
	elsif (PDM_CLK='1' and PDM_CLK'event) then
		if(Aera_clk = '1' and Aera_clk_d1 = '0') then -- clock enable
			if start_1 = '1' then 
				command_in_2 <= command_in_2;
			else
				command_in_2 <= command_in_1;
			end if;
		
			if cnt_1 <=1 then
				cnt_1 <= cnt_1+1;
				--gtu_hv_1 <= '1';
				data_hv_1 <= '0';
				command_in_3 <= command_in_3;
				done_1<='0';
			elsif cnt_1=2 then 
				cnt_1 <= cnt_1+1;
				--gtu_hv_1 <= '0';	
				data_hv_1 <= '0';
				command_in_3 <= command_in_2;
				done_1<='0';
			elsif cnt_1 >=3 and cnt_1 <= 21 then 
				cnt_1 <= cnt_1+1;
				--gtu_hv_1 <= '0';
				data_hv_1 <= command_in_3(17);
				command_in_3 <= command_in_3 (16 downto 0) & command_in_3(17);
				done_1<='0';
			elsif cnt_1 >= 21 and cnt_1 <= 23 then 
				cnt_1 <= cnt_1+1;
				--gtu_hv_1 <= '0';
				data_hv_1 <= '0';
				command_in_3 <=command_in_3;
				done_1<='0';
			elsif cnt_1 = 24 then 
				cnt_1 <= 0;
				--gtu_hv_1 <= '0';
				data_hv_1 <= '0';
				command_in_3 <=command_in_3;
				done_1<='1';
			else
				cnt_1 <= cnt_1;
				--gtu_hv_1 <= gtu_hv_1;
				data_hv_1 <= data_hv_1;
				command_in_3 <=command_in_3;
				done_1<=done_1;
			end if;	
		end if;
	end if;
end process;

gtu_generator: process(PDM_CLK, RESET)
begin
	if RESET='1' then
		gtu_hv_1 <= '0';		
	elsif (PDM_CLK='1' and PDM_CLK'event) then
		if(Aera_clk = '1' and Aera_clk_d1 = '0') then
			if cnt_1 <= 0 then
				gtu_hv_1 <= '1';
			elsif(cnt_1 >= gtu_width) then
				gtu_hv_1 <= '0';
			end if;
		end if;
	end if;
	
end process;

GTU_HV <= gtu_hv_1;
CLK_HV <= not (clk_bufg) when (cnt_1 >= 4 and cnt_1 <= 21) else '0';
DATA_HV <= data_hv_1 when (cnt_1 >= 3 and cnt_1 <= 21) else '0';


end Behavioral;

