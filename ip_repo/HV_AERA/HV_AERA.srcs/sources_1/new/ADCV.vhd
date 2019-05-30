----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2019 06:37:57 PM
-- Design Name: 
-- Module Name: ADCV - Behavioral
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
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

Library xpm;
use xpm.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- This module accepts signals from each EC (when number of counts per GTU more 
-- than specified in certain number of pixels). 
-- Forms sequences to cathode HVPS part 
-- Forms records for HVPS events file. 

entity ADCV is
    Port ( clk : in STD_LOGIC;
    			 reset: in STD_LOGIC;
    			 -- 
    			 gtu_sig: in std_logic;
           -- from Artix
		       ec_sig: std_logic_vector(8 downto 0) := "000000000"; -- art2[2:0], art1[2:0], art0[2:0]
           -- to Cathode ctrl
           command : out STD_LOGIC_VECTOR (17 downto 0);
           command_dv : out STD_LOGIC;
           gtu_len  : out std_logic_vector(4 downto 0); --min 2
           -- enables:
           en: in std_logic;
           en_ec_units: in std_logic_vector(8 downto 0);
           -- ec mapping
           en_mapping: in std_logic_vector(4*9-1 downto 0);
           -- parameters
           release_time: in std_logic_vector(31 downto 0);
           gtu_pulse_len_param0: in std_logic_vector(4 downto 0);--number of bug pulses
           gtu_pulse_len_param1: in std_logic_vector(4 downto 0);
           gtu_big_pulses_qty: in std_logic_vector(15 downto 0));
end ADCV;

architecture Behavioral of ADCV is

		attribute KEEP_HIERARCHY : string;
		attribute KEEP_HIERARCHY of Behavioral: architecture is "TRUE";


		signal ec_sig_d1: std_logic_vector(8 downto 0) := "000000000"; -- art2[2:0], art1[2:0], art0[2:0]
		signal ec_release_sig: std_logic_vector(8 downto 0) := "000000000"; -- art2[2:0], art1[2:0], art0[2:0]
		signal cathode_voltage, cathode_voltage_d1: std_logic_vector(2*9-1 downto 0) := (others => '1');
		
		signal gtu_sig_d1: std_logic := '0';
		signal transformer_boost: std_logic := '0';
		
		signal transformer_boost_timer: std_logic_vector(15 downto 0) := (others => '0');


begin

	ec_sig_d1 <= ec_sig when rising_edge(clk);
	gtu_sig_d1 <= gtu_sig when rising_edge(clk);
	
	-- Generates ec_release_sig signal which trigger release cathode voltage.
	ec_gen: for ec_num in 0 to 8 generate
		signal ec_timer: std_logic_vector(31 downto 0) := (others => '0');
		signal ec_sig_front: std_logic := '0';
	begin
	
		ec_sig_front <= ec_sig(ec_num) and (not ec_sig_d1(ec_num)) when rising_edge(clk);
	
		timer: process(clk)
			variable state : integer range 0 to 4 := 0;
		begin
			if(rising_edge(clk)) then
				if(reset = '1') then
					ec_timer <= (others => '0');
				elsif(ec_sig_front = '1') then
					ec_timer <= release_time;
				elsif(ec_timer /= 0) then
					ec_timer <= ec_timer - 1;
				end if;
				if(ec_timer = 1) then
					ec_release_sig(ec_num) <= '1';
				else
					ec_release_sig(ec_num) <= '0';
				end if;
			end if;
		end process;
	
		cathode_voltage_process: process(clk)
		begin
			if(rising_edge(clk)) then
				if(ec_sig_front = '1') then
					if(cathode_voltage(ec_num*2+1 downto ec_num*2)>1) then
						cathode_voltage(ec_num*2+1 downto ec_num*2) <= cathode_voltage(ec_num*2+1 downto ec_num*2) - 1;
					end if;
				elsif(ec_release_sig(ec_num) = '1') then
					if(cathode_voltage(ec_num*2+1 downto ec_num*2)<3) then
						cathode_voltage(ec_num*2+1 downto ec_num*2) <= cathode_voltage(ec_num*2+1 downto ec_num*2) + 1;
					end if;
				end if;
			end if;
		end process;
			
	end generate;
	
	cathode_voltage_d1 <= cathode_voltage when rising_edge(clk);
	
	command_process: process(clk)
	begin
		if(rising_edge(clk)) then
			if(gtu_sig = '1' and gtu_sig_d1 = '0') then
				if(cathode_voltage /= cathode_voltage_d1) then
					command <= cathode_voltage;
					command_dv <= '1';
				else
					command_dv <= '0';
				end if;
			end if;
		end if;
	end process;

	gtu_len_process: process(clk)
	begin
		if(rising_edge(clk)) then
			if(ec_sig > ec_sig_d1) then -- i.e. one of EC usits sent a signal
				transformer_boost <= '1';
				transformer_boost_timer <= gtu_big_pulses_qty;
			elsif(transformer_boost_timer > 0) then
				if(gtu_sig = '1' and gtu_sig_d1 = '0') then
					transformer_boost_timer <= transformer_boost_timer - 1;
				end if;
			else
				transformer_boost <= '0';
			end if;
			if(transformer_boost = '1') then
				gtu_len <= gtu_pulse_len_param0;
			else
				gtu_len <= gtu_pulse_len_param1;
			end if;
		end if;
	end process;
	

end Behavioral;
