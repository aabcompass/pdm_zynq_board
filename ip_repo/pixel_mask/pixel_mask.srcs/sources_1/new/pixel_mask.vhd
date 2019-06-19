----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/14/2019 09:48:09 AM
-- Design Name: 
-- Module Name: pixel_mask - Behavioral
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pixel_mask is
    Port ( 
    	clk : in STD_LOGIC;
    	
    	datain: in std_logic_vector(47 downto 0);
    	datain_dv: in std_logic;
    	dataout: out std_logic_vector(47 downto 0);
    	dataout_dv: out std_logic;
    	
    	pixel_masking_reg: in std_logic_vector(31 downto 0)   	
    	);
end pixel_mask;

architecture Behavioral of pixel_mask is
	
	signal ecasic_num: std_logic_vector(2 downto 0);
	signal wea: std_logic_vector(0 downto 0);
	signal write_cmd: std_logic;
	signal pixel_discard: std_logic_vector(0 downto 0);
	signal pixel_num: std_logic_vector(8 downto 0);
	signal addra: std_logic_vector(11 downto 0);
	
	signal counter: std_logic_vector(9 downto 0);
	signal mem_doutb: std_logic_vector(7 downto 0);

	COMPONENT blk_mem4data_prov
		PORT (
			clka : IN STD_LOGIC;
			ena : IN STD_LOGIC;
			wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
			addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			dina : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
			clkb : IN STD_LOGIC;
			addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
			doutb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END COMPONENT;

begin

	counter_process: process(clk)
	begin
		if(rising_edge(clk)) then
			if(datain_dv = '1') then
				counter <= counter + 1;
			else
				counter <= (others => '0');
			end if;
		end if;
	end process;
	
	pixel_discard <= pixel_masking_reg(0 downto 0);
	pixel_num <= pixel_masking_reg(16 downto 8);
	ecasic_num <= pixel_masking_reg(22 downto 20);
	write_cmd <= pixel_masking_reg(24);

	addra <= pixel_num(8 downto 0) & ecasic_num(2 downto 0);

	wea(0) <= write_cmd;	

	blk_mem_l : blk_mem4data_prov
	PORT MAP (
		clka => clk,
		ena => '1',
		wea => wea,
		addra => addra,
		dina => pixel_discard,
		clkb => clk,
		addrb => counter(8 downto 0),
		doutb => mem_doutb(7 downto 0)
	);

	apply_process: process(clk)
	begin
		if(rising_edge(clk)) then
			dataout_dv <= datain_dv;
			for i in 5 downto 0 loop
				dataout(i*8+7 downto i*8) <= datain(i*8+7 downto i*8) and (not (7 downto 0 => mem_doutb(i)));
			end loop;		
		end if;
	end process;


end Behavioral;
