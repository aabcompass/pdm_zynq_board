library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

--library UNISIM;
--use UNISIM.VComponents.all;
--

entity top is
	generic (
		C_LOAD_SPAC_PERIOD : integer := 5;
		SIM : std_logic := '1';
		C_NUM_OF_ASICS : integer := 6);
	Port ( 
		rst: in std_logic;
		clk_100MHz : in  STD_LOGIC;
		-- ext. pins
		user_led: out std_logic;
		button : in std_logic;
		re_pc: out std_logic;
		sr_in_pc : out  STD_LOGIC := '1';
		sr_ck_pc : out  STD_LOGIC := '0';
		sr_rstb_pc : out  STD_LOGIC := '0';
		sr_out_pc: in std_logic;
		select_sc_probe_pc, resetb_pc: out std_logic;
		select_din_pc: out std_logic := '1';
		loadb_sc_pc: out std_logic := '1';
		-- configuration via slow serial interface
		configuration_vector: in std_logic_vector(897 downto 0);
		configuration_channel: in std_logic_vector(5 downto 0);
		configuration_le: in std_logic
	);
end top;


architecture Behavioral of top is

	component cs_vi
		PORT (
			CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
			ASYNC_OUT : OUT STD_LOGIC_VECTOR(79 DOWNTO 0));
	end component;

	component cs_ctrl
  PORT (
    CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));

	end component;
	
	component clk_80MHz
	port
	 (-- Clock in ports
		CLK_IN1           : in     std_logic;
		-- Clock out ports
		CLK_OUT1          : out    std_logic;
		-- Status and control signals
		RESET             : in     std_logic;
		LOCKED            : out    std_logic
	 );
	end component;

	COMPONENT debounce
	PORT(
		clk : IN std_logic;
		button : IN std_logic;          
		result : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT fifo_generator_1
	  PORT (
	    wr_clk : IN STD_LOGIC;
	    rd_clk : IN STD_LOGIC;
	    din : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
	    wr_en : IN STD_LOGIC;
	    rd_en : IN STD_LOGIC;
	    dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	    valid : OUT STD_LOGIC;
	    full : OUT STD_LOGIC;
	    empty : OUT STD_LOGIC
	  );
	END COMPONENT;
	
	signal reset: std_logic := '0';
	
	signal clk_40MHZ_p_i, clk: std_logic := '1';
	signal rst_i: std_logic;
	signal clk_gtu_i: std_logic;
	signal select_sc_probe_i, select_sc_probe_d1: std_logic := '0';
	signal readout_clk_counter: std_logic_vector(9 downto 0) := (others => '0');
	signal reset_counter: std_logic_vector(20 downto 0) := (others => '0');
	signal select_sc_probe_counter: std_logic_vector(10 downto 0) := (others => '0');
	signal start_load_spaciroc_counter: std_logic_vector(10 downto 0) := (others => '0');
	signal sr_rstb_counter: std_logic_vector(10 downto 0) := (others => '0');
	signal counter_of_asics: std_logic_vector(15 downto 0) := (others => '0');
	signal loadb_sc_counter: std_logic_vector(10 downto 0) := (others => '0');
	
	signal user_led_counter : std_logic_vector(23 downto 0) := (others => '0');
	
	signal button_debounced, button_debounced_d1: std_logic := '0';
	signal sr_ck_en: std_logic := '0';

	signal load_spac_counter : std_logic_vector(25 downto 0) := (others => '0');
	signal counter_load_spac: std_logic_vector(C_LOAD_SPAC_PERIOD+10+3 downto 0) := (others => '0');
	signal spaciroc_load_index: std_logic_vector(9 downto 0) := (others => '0');
	constant NUM_OF_SPAC_REGS: std_logic_vector(9 downto 0) := conv_std_logic_Vector(897, 10); -- plus 1 in mind
	
	signal start_load_spaciroc, spac_loaded: std_logic := '0';
	signal sr_ck_pc_i, sr_ck_pc_d1: std_logic := '0';
	

	signal spaciroc_configuration_vector: std_logic_vector(897 downto 0) := (others => '0');
	signal spaciroc_configuration_vector_corr: std_logic_vector(897 downto 0) := (
		243 => '1', -- Setting threshold for vth_discri_fs
		245 => '1', -- Setting threshold for vth_discri_fs
		213 => '1', -- VFS input enable
		214 => '1', -- FSU input enable
		215 => '1', -- PA
		208 => '1', -- Feedback capacitor FSU.
		209 => '1', -- Feedback capacitor FSU.
--		--32 => '1', --maskb_ch_KI6
		16 => '1', --maskb_ch_lastdynode
		21 => '1', --dyn_range_8p
--		205 downto 199 => '1', -- Biasing switches 
		others => '0');
		
		signal CONTROL0: std_logic_vector(35 downto 0) := (others => '0');
		signal A: std_logic_vector(79 downto 0) := (others => '0');
		
		signal x_data_pc_d1, x_data_pc_d2, x_data_pc_binary: std_logic_vector(7 downto 0) := (others => '0');
		signal fifo_datain: std_logic_vector(63 downto 0) := (others => '0');
		signal readout_channels_gray: std_logic_vector(63 downto 0) := (others => '0');
		
		signal configuration_le_d1: std_logic := '0';
		
		signal x_data_pc_d1_dv: std_logic := '0';
		signal x_data_pc_d1_or, x_data_pc_binary_or: std_logic := '0';
		
		signal readout_duty_counter: std_logic_vector(1 downto 0) := "00";

		COMPONENT gray2bin 
    Port 
    ( 
			clk : in STD_LOGIC;
			datain : in STD_LOGIC_VECTOR (7 downto 0);
			datain_dv : in std_logic;
			dataout : out STD_LOGIC_VECTOR (7 downto 0);
			dataout_dv : out std_logic
		);
		end COMPONENT;
		
		signal readout_channels_gray_dv, readout_channels_gray_dv_d1 : std_logic := '0';
		signal fifo_datain_dv : std_logic := '0';
		signal readout_bit_counter : STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
		signal delay_counter : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		
		signal readout_en_d1, readout_en_d2 : std_logic := '0';

		attribute keep : string;
		attribute keep of x_data_pc_d1 : signal is "true";


begin

-- load SPACIROC registers via slow control interface

--	inst_cs_ctrl : cs_ctrl
--  port map (
--    CONTROL0 => CONTROL0);
--
--
--	inst_cs_vi : cs_vi
--	port map (
--		CONTROL => CONTROL0,
--		ASYNC_OUT => A);

	load_new_conf_vector: process(clk)
		variable state : integer range 0 to 1 := 0;
	begin
		if(rising_edge(clk)) then
			case state is
				
				when 0 =>
					if(configuration_le_d1 = '1') then
						state := state + 1;
					end if;
					
					spaciroc_configuration1: for i in 0 to 7 loop
						spaciroc_configuration_vector_corr(i*2+1 downto i*2) <= "01";--A(1 downto 0);
					end loop;
					
					spaciroc_configuration_vector_corr(16) <= '0';
					spaciroc_configuration_vector_corr(17) <= '1';
					
					spaciroc_configuration_vector_corr(19 downto 18) <= "11";
					spaciroc_configuration_vector_corr(23 downto 20) <= "0000";
					spaciroc_configuration_vector_corr(27 downto 24) <= "1111";
					spaciroc_configuration_vector_corr(31 downto 28) <= "0000";
					spaciroc_configuration_vector_corr(32) <= '0';
					spaciroc_configuration_vector_corr(37 downto 33) <= "00000";
					
					spaciroc_configuration_vector_corr(49 downto 38) <= "010010000000";
					spaciroc_configuration_vector_corr(61 downto 50) <= "010010000000";
					spaciroc_configuration_vector_corr(73 downto 62) <= "010010000000";
					spaciroc_configuration_vector_corr(85 downto 74) <= "010010000000";
					spaciroc_configuration_vector_corr(97 downto 86) <= "010010000000";
					spaciroc_configuration_vector_corr(109 downto 98) <= "010010000000";
					spaciroc_configuration_vector_corr(121 downto 110) <= "010010000000";
					spaciroc_configuration_vector_corr(133 downto 122) <= "010010000000";
				
					
					spaciroc_configuration2: for i in 0 to 63 loop
						spaciroc_configuration_vector_corr(134+i) <= '1';--A(5);
					end loop;
						
					spaciroc_configuration_vector_corr(198) <= '1';
					spaciroc_configuration_vector_corr(205 downto 199) <= "1101001";
					spaciroc_configuration_vector_corr(207 downto 206) <= "00";
					spaciroc_configuration_vector_corr(212 downto 208) <= "11111";
					spaciroc_configuration_vector_corr(213) <= '0';
					spaciroc_configuration_vector_corr(214) <= '1';
					spaciroc_configuration_vector_corr(215) <= '0';
					spaciroc_configuration_vector_corr(216) <= '1';
					spaciroc_configuration_vector_corr(217) <= '1';
					spaciroc_configuration_vector_corr(227 downto 218) <= "0000000000";--A(69 downto 30);
					spaciroc_configuration_vector_corr(237 downto 228) <= "0000000000";--A(69 downto 30);
					spaciroc_configuration_vector_corr(247 downto 238) <= "0011001000";--A(69 downto 30);
					spaciroc_configuration_vector_corr(257 downto 248) <= (others => '0');--A(69 downto 30);
					
					spaciroc_configuration3: for i in 0 to 63 loop
						spaciroc_configuration_vector_corr(267+i*10 downto 258+i*10) <= "0000001000";--A(79 downto 70);
					end loop;		
				
				when 1 =>
					--spaciroc_configuration_vector_corr(257 downto 218) <= configuration_vector(257 downto 218);
					spaciroc_configuration_vector_corr <= configuration_vector;
			end case;
		end if;
	end process;
	
	configuration_le_d1 <= configuration_le when rising_edge(clk);	
	
	spaciroc_configuration_vector <= '0' & spaciroc_configuration_vector_corr(897 downto 1);
		
	
	
	Inst_debounce_gen1 :if(SIM = '0') generate
		Inst_debounce: debounce PORT MAP(	clk => clk, button => rst, result => reset );
	end generate;
	
	Inst_debounce_gen2: if(SIM = '1') generate
		reset <= rst when rising_edge(clk);
	end generate;


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
	end generate ;

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
	end generate ;
	resetb_pc <= rst_i;

	probe_sc_former: process(clk)
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				select_sc_probe_i <= '0';
				select_sc_probe_counter <= (others => '0');
			else
				if(rst_i = '1') then
					if(select_sc_probe_counter(10) = '1') then
						select_sc_probe_i <= '1';
					else
						select_sc_probe_i <= '0';
						select_sc_probe_counter <= select_sc_probe_counter + 1;
					end if;
				end if;			
			end if;
		end if;
	end process;
	select_sc_probe_pc <= select_sc_probe_i;
	select_sc_probe_d1 <= select_sc_probe_i when rising_edge(clk);

	start_load_spaciroc_process: process(clk)
		variable state : integer range 0 to 1 := 0;
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				state := 0;
				start_load_spaciroc_counter <= (others => '0');
				start_load_spaciroc <= '0';
			else
				case state is
					when 0 =>
						if((select_sc_probe_i = '1' and (select_sc_probe_d1 = '0')) or (button_debounced = '1' and button_debounced_d1 = '0')) then
							start_load_spaciroc_counter <= (others => '0');
							state := state + 1;
						end if;
						start_load_spaciroc <= '0';
					when 1 =>
						if(start_load_spaciroc_counter(10) = '1') then
							start_load_spaciroc <= '1';
							state := 0;
						else
							start_load_spaciroc <= '0';
							start_load_spaciroc_counter <= start_load_spaciroc_counter + 1; 
						end if;					
				end case;			
			end if;
		end if;
	end process;

--	inst_clk_80MHz : clk_80MHz
--  port map (
--    CLK_IN1 => clk_100MHz,
--    CLK_OUT1 => clk,
--    RESET  => '0',
--    LOCKED => dcm_locked_led);
    
    -- spaciroc reconfiguration core works on 100MHz in zynqboard
    --  spaciroc reconfiguration core worked on 80MHz in zedboard
    clk <= clk_100MHz;

	user_led_counter_process: process(clk)
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				user_led_counter <= (others => '0');
			else
				user_led_counter <= user_led_counter + 1;
			end if;
		end if;
	end process;
	
	user_led <= user_led_counter(23);
	
	re_pc <= '1';
	

--	Inst_debounce_gen3 :if(SIM = '0') generate
--		Inst_debounce: debounce PORT MAP(	clk => clk, button => button, result => button_debounced );
--	end generate;
	
--	Inst_debounce_gen4: if(SIM = '1') generate
--		button_debounced <= button;
--	end generate;

	-- button for start spaciroc reconfiguration.
	-- this button is unused because spaciroc reconfiguration performed automatically after reset
	button_debounced <= button;
	button_debounced_d1 <= button_debounced when rising_edge(clk);

	sr_ck_pc_former_stage2: process(clk)
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				sr_ck_pc_i <= '0';
				counter_load_spac <= (others => '0');
			else
				if(sr_ck_en = '1') then
					sr_ck_pc_i <= counter_load_spac(C_LOAD_SPAC_PERIOD);
					counter_load_spac <= counter_load_spac + 1;
				else
					counter_load_spac <= (others => '0');
					sr_ck_pc_i <= '0';
				end if;
			end if;
		end if;
	end process;
	
	sr_ck_pc_d1 <= sr_ck_pc_i when rising_edge(clk);
	sr_ck_pc <= sr_ck_pc_i;
	
	load_spaciroc_process: process(clk)
		variable state : integer range 0 to 14 := 0;
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				state := 0;
				select_din_pc <= '1';
				sr_rstb_pc <= '0';
				sr_rstb_counter <= (others => '0');
				sr_ck_en <= '0';
				sr_in_pc <= '1';
				counter_of_asics <= (others => '0');
				loadb_sc_counter <= (others => '0');
				loadb_sc_pc <= '1';
			else
				case state is
					when 0 => -- Starting load SPACIROC
						if(start_load_spaciroc = '1') then
							state := state + 1;
						end if;
					when 1 => -- Applying sr_rstb for a 1000 clk
						if(sr_rstb_counter(10) = '1') then
							sr_rstb_counter <= (others => '0');
							sr_rstb_pc <= '1';
							state := state + 1;
						else
							sr_rstb_counter <= sr_rstb_counter + 1;
							sr_rstb_pc <= '0';
						end if;
					when 2 => 
						--spaciroc_load_index <= NUM_OF_SPAC_REGS;--conv_std_logic_vector(NUM_OF_SPAC_REGS, 10);
						spaciroc_load_index <= (others => '0');--NUM_OF_SPAC_REGS;--conv_std_logic_vector(NUM_OF_SPAC_REGS, 10);
						state := state + 1;
					when 3 => -- Loading configuration data
						sr_ck_en <= '1'; -- starting counter_load_spac
						if(sr_ck_pc_i = '0' and sr_ck_pc_d1 = '1') then
							sr_in_pc <= spaciroc_configuration_vector(conv_integer(spaciroc_load_index));
							--if(conv_integer(spaciroc_load_index) = 0) then 
							if(conv_integer(spaciroc_load_index) = NUM_OF_SPAC_REGS) then 
								state := state + 1;
							else
								--spaciroc_load_index <= spaciroc_load_index - 1;							
								spaciroc_load_index <= spaciroc_load_index + 1;							
							end if;
						end if;
					when 4 => -- Each of C_NUM_OF_ASICS must be loaded
						if(counter_of_asics = C_NUM_OF_ASICS-1) then
							state := state + 1;
							counter_of_asics <= (others => '0');
							sr_ck_en <= '0'; -- stopping counter_load_spac
						else
							state := state - 2;
							counter_of_asics <= counter_of_asics + 1;
						end if;
					when 5 => --waiting before forming loadb_sc_pc
						if(loadb_sc_counter(8) = '1') then
							state := state + 1;
							loadb_sc_counter <= (others => '0');
						else
							loadb_sc_counter <= loadb_sc_counter + 1;
						end if;
					when 6 => --waiting while loadb_sc_pc active
						sr_in_pc <= '1';
						if(loadb_sc_counter(8) = '1') then
							state := state + 1;
							loadb_sc_counter <= (others => '0');
							loadb_sc_pc <= '1';
						else
							loadb_sc_counter <= loadb_sc_counter + 1;
							loadb_sc_pc <= '0';
						end if;
					when 7 => --waiting after forming loadb_sc_pc
						if(loadb_sc_counter(9) = '1') then
							state := state + 1;
							loadb_sc_counter <= (others => '0');
						else
							loadb_sc_counter <= loadb_sc_counter + 1;
						end if;
					when 8 => -- activate Select_din
						select_din_pc <= '0';
						state := state + 1;
					when 9 => -- running  counter_load_spac
						sr_ck_en <= '1';
						if(sr_ck_pc_i = '1') then
							state := state + 1;
						end if;
					when 10 => -- waiting for a one sr_clk
						if(sr_ck_pc_i = '0') then
							sr_ck_en <= '0'; -- stopping  counter_load_spac
							state := state + 1;
						end if;
					when 11 =>  --waiting after forming Select_din
						if(loadb_sc_counter(9) = '1') then
							state := state + 1;
							loadb_sc_counter <= (others => '0');
						else
							loadb_sc_counter <= loadb_sc_counter + 1;
						end if;
					when 12 => -- running  counter_load_spac
						sr_ck_en <= '1';
						--spaciroc_load_index <= NUM_OF_SPAC_REGS;--conv_std_logic_vector(NUM_OF_SPAC_REGS, 10);
						spaciroc_load_index <= (others => '0');--conv_std_logic_vector(NUM_OF_SPAC_REGS, 10);
						select_din_pc <= '1';
						state := state + 1;
					when 13 => -- Loading configuration data
						if(sr_ck_pc_i = '0' and sr_ck_pc_d1 = '1') then
							if(conv_integer(spaciroc_load_index) = NUM_OF_SPAC_REGS) then 
								state := state + 1;
							else
								--spaciroc_load_index <= spaciroc_load_index - 1;							
								spaciroc_load_index <= spaciroc_load_index + 1;							
							end if;
						end if;
					when 14 => -- Each of C_NUM_OF_ASICS must be loaded
						if(counter_of_asics = C_NUM_OF_ASICS-1) then
							state := state + 1;
							counter_of_asics <= (others => '0');
							sr_ck_en <= '0'; -- stopping counter_load_spac
						else
							state := state - 2;
							counter_of_asics <= counter_of_asics + 1;
						end if;
				end case;
			end if;
		end if;
	end process;		

end Behavioral;



