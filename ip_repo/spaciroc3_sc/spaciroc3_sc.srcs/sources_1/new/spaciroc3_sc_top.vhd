library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity spaciroc3_sc_top is
		generic (
					 C_LOAD_SPAC_PERIOD : integer := 5;--2^5 - semiperiod of SC
					 SIM : std_logic := '1'; -- is simulation
					 N_SC_BITS: integer := 992; -- number of sc bits in each ASIC
					 N_PROBE_BITS: integer := 264; -- number of probe bits in each ASIC
					 N_CHIPS: integer := 6;
					 N_LINES: integer := 6;
					 N_SECTIONS: integer := 6);
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           --EXTERNAL PINS
           sr_in_pc : out  STD_LOGIC_vector(N_LINES-1 downto 0) := (others => '0'); -- sc data
           sr_ck_pc : out  STD_LOGIC := '0'; -- sc clk
           sr_rstb_pc : out  STD_LOGIC := '1'; -- sc reset 
           sr_out_pc: in std_logic; -- sc feedback
           select_sc_probe_pc: out std_logic := '1'; -- select between sc and probes
           resetb_pc: out std_logic := '0'; -- reset entire ASIC
           --select_din_pc: out std_logic := '1'; -- always one
           loadb_sc_pc: out std_logic := '1'; -- latch
           -- CONTROL SIGNALS from zynq ps
           start: in std_logic := '0'; --start load sc
           done: out std_logic := '0'; -- unused
           is_same_data: in std_logic := '0'; -- simple mode or individual mode
           -- data to be sent to all chips (in simple mode)
           general_reg0: in std_logic_vector(31 downto 0);
           general_reg1: in std_logic_vector(31 downto 0);
           general_reg2: in std_logic_vector(31 downto 0);
           general_reg3: in std_logic_vector(31 downto 0);
           general_reg4: in std_logic_vector(31 downto 0);
           general_reg5: in std_logic_vector(31 downto 0);
           -- data to be sent separately (in individual mode)
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
end spaciroc3_sc_top;

architecture Behavioral of spaciroc3_sc_top is

	attribute keep_hierarchy : string;
	attribute keep_hierarchy of Behavioral : architecture is "yes";


	signal rst_i: std_logic := '0';
	signal s00_axis_tready_i: std_logic := '0';
	signal reset_counter: std_logic_vector(20 downto 0) := (others => '0');
	signal load_sc_cnt : std_logic_vector(C_LOAD_SPAC_PERIOD downto 0) := (0 => '1', others => '0');
	signal load_sc_bits_cnt : std_logic_vector(9 downto 0) := (others => '0');
	signal load_sc_chips_cnt : std_logic_vector(2 downto 0) := (others => '0');
	signal sr_ck_pc_pre: std_logic := '0';
	signal sr_ck_pc_pre_d1: std_logic := '0';
	signal index32: std_logic_vector(4 downto 0) := (others => '0');
	signal sr_ck_pc_cnt: std_logic_vector(15 downto 0) := (others => '0');
	signal current_section: std_logic_vector(3 downto 0) := (others => '0');
	signal config_vector: std_logic_vector(32*N_LINES-1 downto 0) := (others => '0');
	signal status : std_logic_vector(3 downto 0) := "0000";
	signal status2 : std_logic_vector(3 downto 0) := "0000";
	signal tready_cnt : std_logic_vector(15 downto 0) := (others => '0');

	attribute keep : string;  
	attribute keep of rst_i: signal is "true"; 
	attribute keep of load_sc_cnt: signal is "true"; 
	attribute keep of load_sc_bits_cnt: signal is "true"; 
	attribute keep of load_sc_chips_cnt: signal is "true"; 
	attribute keep of sr_ck_pc_pre: signal is "true"; 
	attribute keep of sr_ck_pc_pre_d1: signal is "true"; 
	attribute keep of index32: signal is "true"; 
	attribute keep of current_section: signal is "true"; 
	attribute keep of config_vector: signal is "true"; 
	attribute keep of status: signal is "true"; 
	attribute keep of status2: signal is "true"; 
	attribute keep of sr_ck_pc_cnt: signal is "true"; 
	attribute keep of tready_cnt: signal is "true"; 


begin


	-- process for reset entire ASI
	resetb_former_gen1: if(sim = '0') generate
		reset_former: process(clk)
		begin
			if(rising_edge(clk)) then
				if(reset = '1') then
					rst_i <= '0';	
					reset_counter <= (others => '0');					
				else
					if(reset_counter(20) = '1') then
						rst_i <= '1';			
					else
						rst_i <= '0';			
						reset_counter <= reset_counter + 1;
					end if;
				end if;
			end if;
		end process;
	end generate resetb_former_gen1;

	reset_former_gen2: if(sim = '1') generate
		reset_former: process(clk)
		begin
			if(rising_edge(clk)) then
				if(reset = '1') then			
					rst_i <= '0';	
					reset_counter <= (others => '0');					
				else
					if(reset_counter(5) = '1') then
						rst_i <= '1';			
					else
						rst_i <= '0';			
						reset_counter <= reset_counter + 1;
					end if;
				end if;
			end if;
		end process;
	end generate reset_former_gen2;
	
	resetb_pc <= rst_i;

	ctrl_former_sm: process(clk)
		variable state : integer range 0 to 8 := 0;
	begin
		if(rising_edge(clk)) then
			status <= conv_std_logic_vector(state, 4);
			case state is
				-- waiting for the start signal
				-- assert the reset sc
				when 0 => 	if(start = '1') then
											state := state + 1;
											sr_rstb_pc <= '0';
											sr_ck_pc_cnt <= (others => '0');
										end if;
				-- deassert reset in some time
				when 1 => 	if(load_sc_cnt = 0) then
											sr_rstb_pc <= '1';
											load_sc_cnt <= (0 => '1', others => '0');
											state := state + 1;
										else
											load_sc_cnt <= load_sc_cnt + 1;
										end if;
				-- assert internal sc clock signal
				when 2 => 	sr_ck_pc_pre <= '1';
										state := state + 1;
				-- deassert internal sc clock signal						
				when 3 => 	sr_ck_pc_pre <= '0';
										if(load_sc_cnt = 0) then
											state := state + 1;
											load_sc_cnt <= (0 => '1', others => '0');
											sr_ck_pc <= '1';
											sr_ck_pc_cnt <= sr_ck_pc_cnt + 1;
										else
											load_sc_cnt <= load_sc_cnt + 1;
										end if;
				when 4 => 	if(load_sc_cnt = 0) then
											state := state + 1;
											load_sc_cnt <= (0 => '1', others => '0');
											sr_ck_pc <= '0';
										else
											load_sc_cnt <= load_sc_cnt + 1;
										end if;
				when 5 =>   if(load_sc_bits_cnt = N_SC_BITS-1) then
											state := state + 1;
											load_sc_bits_cnt <= (others => '0');
										else
											load_sc_bits_cnt <= load_sc_bits_cnt + 1;
											state := 2;
										end if;
				when 6 =>   if(load_sc_chips_cnt = N_CHIPS-1) then
											state := state + 1;
											load_sc_chips_cnt <= (others => '0');
										else
											load_sc_chips_cnt <= load_sc_chips_cnt + 1;
											state := 2;
										end if;
				when 7 => 	if(load_sc_cnt = 0) then
											loadb_sc_pc <= '0';
											load_sc_cnt <= (0 => '1', others => '0');
											state := state + 1;
										else
											load_sc_cnt <= load_sc_cnt + 1;
										end if;
				when 8 => 	if(load_sc_cnt = 0) then
											loadb_sc_pc <= '1';
											load_sc_cnt <= (0 => '1', others => '0');
											state := 0;
										else
											load_sc_cnt <= load_sc_cnt + 1;
										end if;
			end case;
		end if;
	end process;

	-- this process determines the current section 	
	current_section_calc: process(clk)
	begin
		if(rising_edge(clk)) then	
			if(start = '1') then	
				current_section <= X"0"; 
			elsif(sr_ck_pc_pre = '1') then
				if(load_sc_bits_cnt = 0) then current_section <= X"0"; end if;
				if(load_sc_bits_cnt = 32) then current_section <= X"1"; end if;
				if(load_sc_bits_cnt = 608) then current_section <= X"2"; end if;
				if(load_sc_bits_cnt = 610) then current_section <= X"3"; end if;
				if(load_sc_bits_cnt = 930) then current_section <= X"4"; end if;
				if(load_sc_bits_cnt = 986) then current_section <= X"5"; end if;
			end if;
		end if;
	end process;
	
	sr_ck_pc_pre_d1 <= sr_ck_pc_pre when rising_edge(clk);
			
	indexing_sm2: process(clk)
	begin
		if(rising_edge(clk)) then
			if(start = '1') then
				index32 <= (others => '0');
			elsif(sr_ck_pc_pre_d1 = '1') then
				if(current_section = X"0") then	
					index32 <= index32 - 1; end if; 
				if(current_section = X"1") then 
					if(index32 = 0) then
						index32 <= conv_std_logic_vector(24, 5);
					elsif(index32 = 16) then
						index32 <= conv_std_logic_vector(8, 5);	
					else
						index32 <= index32 - 1;
					end if;
				end if;
				if(current_section = X"2") then 
					if(index32 = 0) then
						index32 <= conv_std_logic_vector(1, 5);
					else
						index32 <= index32 - 1;
					end if;
				end if;
				if(current_section = X"3") then 
					if(index32 = 0) then
						index32 <= conv_std_logic_vector(28, 5);
					elsif(index32 = 24) then
						index32 <= conv_std_logic_vector(20, 5);	
					elsif(index32 = 16) then
						index32 <= conv_std_logic_vector(12, 5);	
					elsif(index32 = 8) then
						index32 <= conv_std_logic_vector(4, 5);	
					else
						index32 <= index32 - 1;
					end if;
				end if;
				if(current_section = X"4") then 
					if(index32 = 0) then
						index32 <= conv_std_logic_vector(30, 5);
					elsif(index32 = 24) then
						index32 <= conv_std_logic_vector(22, 5);	
					elsif(index32 = 16) then
						index32 <= conv_std_logic_vector(14, 5);	
					elsif(index32 = 8) then
						index32 <= conv_std_logic_vector(6, 5);	
					else
						index32 <= index32 - 1;
					end if;
				end if;
				if(current_section = X"5") then 
					if(index32 = 0) then
						index32 <= conv_std_logic_vector(5, 5);
					else
						index32 <= index32 - 1;
					end if;
				end if;				
			end if;
		end if;
	end process;			
				
	axis_tready_former: process(clk)
		variable state : integer range 0 to 1 := 0;
	begin
		if(rising_edge(clk)) then
			case state is
				when 0 => if(index32 = 0) then
										state := state + 1;
									end if;
									s00_axis_tready_i <= '0';
				when 1 => if(sr_ck_pc_pre_d1 = '1') then
										state := 0;
										s00_axis_tready_i <= not is_same_data;
										tready_cnt <= tready_cnt + 1;
									end if;
			end case;
		end if;
	end process;			
	s00_axis_tready <= s00_axis_tready_i;
				
	config_vector_select: process(clk)
	begin
		if(rising_edge(clk)) then
			if(is_same_data = '0') then
				if(s00_axis_tready_i = '1') then
					config_vector <= s00_axis_tdata;
				end if;
			else
				case current_section is
					when X"0" => config_vector <= general_reg0 & general_reg0 & general_reg0 & general_reg0 & general_reg0 & general_reg0;
					when X"1" => config_vector <= general_reg1 & general_reg1 & general_reg1 & general_reg1 & general_reg1 & general_reg1;
					when X"2" => config_vector <= general_reg2 & general_reg2 & general_reg2 & general_reg2 & general_reg2 & general_reg2;
					when X"3" => config_vector <= general_reg3 & general_reg3 & general_reg3 & general_reg3 & general_reg3 & general_reg3;
					when X"4" => config_vector <= general_reg4 & general_reg4 & general_reg4 & general_reg4 & general_reg4 & general_reg4;
					when X"5" => config_vector <= general_reg5 & general_reg5 & general_reg5 & general_reg5 & general_reg5 & general_reg5;
					when others => config_vector <= (others => '0');
				end case;
			end if;
	end if;
	end process;

	sr_data_select_generate: for i in N_LINES-1 downto 0 generate
		sr_data_select: process(clk)
		begin
			if(rising_edge(clk)) then
				if(current_section = "0") then
					case conv_integer(index32) is
						when 31 => sr_in_pc(i) <= config_vector(31+32*i);
						when 30 => sr_in_pc(i) <= config_vector(30+32*i);
						when 29 => sr_in_pc(i) <= config_vector(29+32*i);
						when 28 => sr_in_pc(i) <= config_vector(28+32*i);
						when 27 => sr_in_pc(i) <= config_vector(27+32*i);
						when 26 => sr_in_pc(i) <= config_vector(26+32*i);
						when 25 => sr_in_pc(i) <= config_vector(25+32*i);
						when 24 => sr_in_pc(i) <= config_vector(24+32*i);
						when 23 => sr_in_pc(i) <= config_vector(23+32*i);
						when 22 => sr_in_pc(i) <= config_vector(22+32*i);
						when 21 => sr_in_pc(i) <= config_vector(21+32*i);
						when 20 => sr_in_pc(i) <= config_vector(20+32*i);
						when 19 => sr_in_pc(i) <= config_vector(19+32*i);
						when 18 => sr_in_pc(i) <= config_vector(18+32*i);
						when 17 => sr_in_pc(i) <= config_vector(17+32*i);
						when 16 => sr_in_pc(i) <= config_vector(7+32*i); --vv because DAC0 bit order is vice-versa vv
						when 15 => sr_in_pc(i) <= config_vector(8+32*i); 
						when 14 => sr_in_pc(i) <= config_vector(9+32*i);
						when 13 => sr_in_pc(i) <= config_vector(10+32*i);
						when 12 => sr_in_pc(i) <= config_vector(11+32*i);
						when 11 => sr_in_pc(i) <= config_vector(12+32*i);
						when 10 => sr_in_pc(i) <= config_vector(13+32*i);
						when 9 => sr_in_pc(i) <= config_vector(14+32*i);
						when 8 => sr_in_pc(i) <= config_vector(15+32*i);
						when 7 => sr_in_pc(i) <= config_vector(16+32*i); --^^ because DAC0 bit order is vice-versa ^^
						when 6 => sr_in_pc(i) <= config_vector(6+32*i);
						when 5 => sr_in_pc(i) <= config_vector(5+32*i);
						when 4 => sr_in_pc(i) <= config_vector(4+32*i);
						when 3 => sr_in_pc(i) <= config_vector(3+32*i);
						when 2 => sr_in_pc(i) <= config_vector(2+32*i);
						when 1 => sr_in_pc(i) <= config_vector(1+32*i);
						when 0 => sr_in_pc(i) <= config_vector(32*i);
						when others => sr_in_pc(i) <= '0';
					end case;
				else
					case conv_integer(index32) is
						when 31 => sr_in_pc(i) <= config_vector(31+32*i);
						when 30 => sr_in_pc(i) <= config_vector(30+32*i);
						when 29 => sr_in_pc(i) <= config_vector(29+32*i);
						when 28 => sr_in_pc(i) <= config_vector(28+32*i);
						when 27 => sr_in_pc(i) <= config_vector(27+32*i);
						when 26 => sr_in_pc(i) <= config_vector(26+32*i);
						when 25 => sr_in_pc(i) <= config_vector(25+32*i);
						when 24 => sr_in_pc(i) <= config_vector(24+32*i);
						when 23 => sr_in_pc(i) <= config_vector(23+32*i);
						when 22 => sr_in_pc(i) <= config_vector(22+32*i);
						when 21 => sr_in_pc(i) <= config_vector(21+32*i);
						when 20 => sr_in_pc(i) <= config_vector(20+32*i);
						when 19 => sr_in_pc(i) <= config_vector(19+32*i);
						when 18 => sr_in_pc(i) <= config_vector(18+32*i);
						when 17 => sr_in_pc(i) <= config_vector(17+32*i);
						when 16 => sr_in_pc(i) <= config_vector(16+32*i);
						when 15 => sr_in_pc(i) <= config_vector(15+32*i);
						when 14 => sr_in_pc(i) <= config_vector(14+32*i);
						when 13 => sr_in_pc(i) <= config_vector(13+32*i);
						when 12 => sr_in_pc(i) <= config_vector(12+32*i);
						when 11 => sr_in_pc(i) <= config_vector(11+32*i);
						when 10 => sr_in_pc(i) <= config_vector(10+32*i);
						when 9 => sr_in_pc(i) <= config_vector(9+32*i);
						when 8 => sr_in_pc(i) <= config_vector(8+32*i);
						when 7 => sr_in_pc(i) <= config_vector(7+32*i);
						when 6 => sr_in_pc(i) <= config_vector(6+32*i);
						when 5 => sr_in_pc(i) <= config_vector(5+32*i);
						when 4 => sr_in_pc(i) <= config_vector(4+32*i);
						when 3 => sr_in_pc(i) <= config_vector(3+32*i);
						when 2 => sr_in_pc(i) <= config_vector(2+32*i);
						when 1 => sr_in_pc(i) <= config_vector(1+32*i);
						when 0 => sr_in_pc(i) <= config_vector(32*i);
						when others => sr_in_pc(i) <= '0';
					end case;
				end if;
			end if;
		end process;
	end generate;
	
end Behavioral;

