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

entity ADCV is
    Port ( clk : in STD_LOGIC;
    			 reset: in STD_LOGIC;
           -- from Artix
           artix_adcv_if : in STD_LOGIC_VECTOR (5 downto 0); -- [art2_clk, art2_sig, art1_clk, art1_sig, art0_clk, art0_sig]
           -- to Cathode ctrl
           command : out STD_LOGIC_VECTOR (17 downto 0);
           command_dv : out STD_LOGIC;
           -- enables:
           en: in std_logic;
           en_ec_units: in std_logic_vector(8 downto 0);
           -- ec mapping
           en_mapping: in std_logic_vector(4*9-1 downto 0);
           -- parameters
           release_time: in std_logic_vector(31 downto 0);
           gtu_pulse_len_param0: in std_logic_vector(4 downto 0);
           gtu_pulse_len_param1: in std_logic_vector(4 downto 0);
           gtu_big_pulses_qty: in std_logic_vector(7 downto 0));
end ADCV;

architecture Behavioral of ADCV is

		signal ec_sig: std_logic_vector(8 downto 0) := "000000000"; -- art2[2:0], art1[2:0], art0[2:0]
		signal ec_release_sig: std_logic_vector(8 downto 0) := "000000000"; -- art2[2:0], art1[2:0], art0[2:0]
		signal cathode_voltage: std_logic_vector(2*9-1 downto 0) := (others => '1');


begin

	-- artix_adcv_if bus decoding
	art_gen: for art_num in 0 to 2 generate
		signal artix_adcv_if_art: std_logic_vector(1 downto 0);
		signal guard_cnt: std_logic_vector(2 downto 0) := "00000";
	begin	
		

		xpm_cdc_array_single_inst: xpm_cdc_array_single
		generic map (
	
			-- Common module generics
			DEST_SYNC_FF   => 4, -- integer; range: 2-10
			SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
			SRC_INPUT_REG  => 0, -- integer; 0=do not register input, 1=register input
			WIDTH          => 2  -- integer; range: 2-1024
	
		)
		port map (
	
			src_clk  => '0',  -- optional; required when SRC_INPUT_REG = 1
			src_in   => artix_adcv_if(art_num*2+1 downto art_num*2),
			dest_clk => clk,
			dest_out => artix_adcv_if_art
		);

		-- Decodes ADCV bus which carry signals from Artixes about HVPS cathode trigger
		if_sm: process(clk)
			variable state: integer range 0 to 5 := 0;
		begin
			if(rising_edge(clk)) then
				if(reset = '1') then
					state := 0;
				else
					case state is
						when 0 => if(artix_adcv_if_art(1) = '1') then
												ec_sig(0+3*art_num) <= artix_adcv_if_art(0);
												state := state + 1;
											end if;	
						when 1 => if(artix_adcv_if_art(1) = '0') then
												ec_sig(0+3*art_num) <= '0';
												state := state + 1;
											end if;
						when 2 => if(artix_adcv_if_art(1) = '1') then
												ec_sig(1+3*art_num) <= artix_adcv_if_art(0);
												state := state + 1;
											end if;	
						when 3 => if(artix_adcv_if_art(1) = '0') then
												ec_sig(1+3*art_num) <= '0';
												state := state + 1;
											end if;
						when 4 => if(artix_adcv_if_art(1) = '1') then
												ec_sig(2+3*art_num) <= artix_adcv_if_art(0);
												state := state + 1;
											end if;	
						when 5 => if(artix_adcv_if_art(1) = '0') then
												ec_sig(2+3*art_num) <= '0';
												state := state + 1;
											end if;
						when 6 => if(guard_cnt = "00000") then
												state := 0;
											else
												guard_cnt <= guard_cnt + 1;
											end if;
					end case;
				end if;
			end if;
		end process;
	end generate;
	
	-- Generates ec_release_sig signal which trigger release cathode voltage.
	ec_gen: for ec_num in 0 to 8 generate
		signal ec_timer: std_logic_vector(31 downto 0) := (others => '0');
	begin
	
		timer: process(clk)
			variable state : integer range 0 to 4 := 0;
		begin
			if(rising_edge(clk)) then
				if(reset = '1') then
					ec_timer <= (others => '0');
				elsif(ec_sig(ec_num) = '1') then
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
				if(ec_sig(ec_num) = '1') then
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

	

end Behavioral;
