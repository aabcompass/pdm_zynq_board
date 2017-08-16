library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity spaciroc3_sc_tb is
--  Port ( );
end spaciroc3_sc_tb;

architecture Behavioral of spaciroc3_sc_tb is

	component spaciroc3_sc_top
			generic (
						 C_LOAD_SPAC_PERIOD : integer := 5;
						 SIM : std_logic := '1';
						 N_SC_BITS: integer := 992;
						 N_PROBE_BITS: integer := 264;
						 N_CHIPS: integer := 6;
						 N_LINES: integer := 6;
						 N_SECTIONS: integer := 6);
			Port ( clk : in STD_LOGIC;
						 reset : in STD_LOGIC;
						 --EXTERNAL PINS
						 sr_in_pc : out  STD_LOGIC_vector(N_LINES-1 downto 0) := (others => '0');
						 sr_ck_pc : out  STD_LOGIC := '0';
						 sr_rstb_pc : out  STD_LOGIC := '1';
						 sr_out_pc: in std_logic;
						 select_sc_probe_pc: out std_logic := '1';
						 resetb_pc: out std_logic := '0';
						 --select_din_pc: out std_logic := '1';
						 loadb_sc_pc: out std_logic := '1';
						 -- CONTROL SIGNALS
						 start: in std_logic := '0';
						 done: out std_logic := '0';
						 is_same_data: in std_logic := '0';
						 -- data to be sent to all chips
						 general_reg0: in std_logic_vector(31 downto 0);
						 general_reg1: in std_logic_vector(31 downto 0);
						 general_reg2: in std_logic_vector(31 downto 0);
						 general_reg3: in std_logic_vector(31 downto 0);
						 general_reg4: in std_logic_vector(31 downto 0);
						 general_reg5: in std_logic_vector(31 downto 0);
						 -- data to be sent separately
						 s00_axis_tdata:  in std_logic_vector(32*N_LINES-1 downto 0);
						 s00_axis_tvalid: in std_logic;
						 s00_axis_tready: out std_logic := '0'
						 --current_chip: out std_logic_vector(2 downto 0) := "000"--;
						 -- data to be downloaded
						 --configuration_sc: in std_logic_vector(N_SC_BITS-1 downto 0);
						 --configuration_probe: in std_logic_vector(N_PROBE_BITS-1 downto 0);
						 --configuration_line: in std_logic_vector(5 downto 0);
						 --configuration_le: in std_logic                     
						 );
	end component;
	
	signal clk_counter: integer := 0;
	signal clk :std_logic := '0';
	signal start :std_logic := '0';

begin


	process
	begin
		clk <= '1';
		wait for 10 ns;
		clk <= '0';
		wait for 10 ns;
		clk_counter <= clk_counter + 1;
	end process;
	
	main_process: process
	begin
		start <= '0';
		wait until clk_counter = 50;
		start <= '1';
		wait until clk_counter = 51;
		start <= '0';
		wait;
	end process;
	
	dut: spaciroc3_sc_top
			Port map ( clk =>  clk,--: in STD_LOGIC;
						 reset => '0', --: in STD_LOGIC;
						 --EXTERNAL PINS
						 sr_in_pc => open, --: out  STD_LOGIC_vector(N_LINES-1 downto 0) := (others => '0');
						 sr_ck_pc =>  open,--: out  STD_LOGIC := '0';
						 sr_rstb_pc => open, --: out  STD_LOGIC := '1';
						 sr_out_pc => '0',--: in std_logic;
						 select_sc_probe_pc => open,--: out std_logic := '1';
						 resetb_pc => open,--: out std_logic := '0';
						 --select_din_pc => open,--: out std_logic := '1';
						 loadb_sc_pc => open,--: out std_logic := '1';
						 -- CONTROL SIGNALS
						 start => start, --: in std_logic := '0';
						 done => open,--: out std_logic := '0';
						 is_same_data => '0',--: in std_logic := '0';
						 -- data to be sent to all chips
						 general_reg0 => X"12345678",--: in std_logic_vector(31 downto 0);
						 general_reg1 => X"01830183",--: in std_logic_vector(31 downto 0);
						 general_reg2 => X"89ABCDEF",--: in std_logic_vector(31 downto 0);
						 general_reg3 => X"19191919",--: in std_logic_vector(31 downto 0);
						 general_reg4 => X"3A3A3A3A",--: in std_logic_vector(31 downto 0);
						 general_reg5 => X"00000017",--: in std_logic_vector(31 downto 0);
						 -- data to be sent separately
						 s00_axis_tdata => (others => '0'),--:  in std_logic_vector(32*N_LINES-1 downto 0);
						 s00_axis_tvalid => '1',--: in std_logic;
						 s00_axis_tready => open--: out std_logic := '0'
						 --current_chip: out std_logic_vector(2 downto 0) := "000"--;
						 -- data to be downloaded
						 --configuration_sc: in std_logic_vector(N_SC_BITS-1 downto 0);
						 --configuration_probe: in std_logic_vector(N_PROBE_BITS-1 downto 0);
						 --configuration_line: in std_logic_vector(5 downto 0);
						 --configuration_le: in std_logic                     
						 );

	


end Behavioral;
