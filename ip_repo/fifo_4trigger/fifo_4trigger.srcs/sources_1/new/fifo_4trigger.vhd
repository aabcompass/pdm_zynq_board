library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

Library xpm;
use xpm.vcomponents.all;


entity fifo_4trigger is
		generic (
			C_AXIS_DWIDTH : integer := 64;
			C_CNT_DWIDTH : integer := 32
		);
    Port ( 
			axis_aclk : IN STD_LOGIC;
  		axis_aresetn : IN STD_LOGIC;
  		
  		s_axis_tvalid : IN STD_LOGIC;
  		s_axis_tready : OUT STD_LOGIC;
  		s_axis_tdata : IN STD_LOGIC_VECTOR(C_AXIS_DWIDTH-1 DOWNTO 0);
  		s_axis_tlast : IN STD_LOGIC;
  		
  		-- out
    	m_axis_tvalid : OUT STD_LOGIC;
  		m_axis_tready : IN STD_LOGIC;
  		m_axis_tdata : OUT STD_LOGIC_VECTOR(C_AXIS_DWIDTH-1 DOWNTO 0);
  		m_axis_tlast : OUT STD_LOGIC;
  		
  		trig0 : in std_logic;
  		trig1 : in std_logic;
  		trig2 : in std_logic;
  		trig_button: in std_logic;
  		
  		trig_led: out std_logic := '0';
  		
  		gtu_sig: in std_logic	;
  		
  		flags, flags_se, trig_delay, flags_cmd: in std_logic_vector(31 downto 0); --slv_regs 0, 1, 2, 3
  		trig_test_gtu_time_h, trig_test_gtu_time_l: in std_logic_vector(31 downto 0); --slv_regs 5, 6
  		periodic_trig_phase: in std_logic_vector(20 downto 0); --slv_regs 5, 6
  		
			gtu_sig_counter_h_out, gtu_sig_counter_l_out : out std_logic_vector(31 downto 0); --27, 28, 29, 30
			status : out std_logic_vector(31 downto 0) --27, 28, 29, 30
  		
    );
end fifo_4trigger;

architecture Behavioral of fifo_4trigger is

	component debounce IS
		GENERIC(
			counter_size  :  INTEGER := 19); --counter size (19 bits gives 10.5ms with 50MHz clock)
		PORT(
			clk     : IN  STD_LOGIC;  --input clock
			button  : IN  STD_LOGIC;  --input signal to be debounced
			result  : OUT STD_LOGIC); --debounced signal
		END component;


	COMPONENT fifo_generator_4trigger_1st
		PORT (
			s_aclk : IN STD_LOGIC;
			s_aresetn : IN STD_LOGIC;
			s_axis_tvalid : IN STD_LOGIC;
			s_axis_tready : OUT STD_LOGIC;
			s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
			s_axis_tlast : IN STD_LOGIC;
			m_axis_tvalid : OUT STD_LOGIC;
			m_axis_tready : IN STD_LOGIC;
			m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
			m_axis_tlast : OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT fifo_generator_4trigger_2nd
	  PORT (
	    s_aclk : IN STD_LOGIC;
	    s_aresetn : IN STD_LOGIC;
	    s_axis_tvalid : IN STD_LOGIC;
	    s_axis_tready : OUT STD_LOGIC;
	    s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
	    s_axis_tlast : IN STD_LOGIC;
	    m_axis_tvalid : OUT STD_LOGIC;
	    m_axis_tready : IN STD_LOGIC;
	    m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
	    m_axis_tlast : OUT STD_LOGIC
	  );
	END COMPONENT;
	
	COMPONENT fifo_generator_4trigger_3rd
	  PORT (
	    s_aclk : IN STD_LOGIC;
	    s_aresetn : IN STD_LOGIC;
	    s_axis_tvalid : IN STD_LOGIC;
	    s_axis_tready : OUT STD_LOGIC;
	    s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
	    s_axis_tlast : IN STD_LOGIC;
	    m_axis_tvalid : OUT STD_LOGIC;
	    m_axis_tready : IN STD_LOGIC;
	    m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
	    m_axis_tlast : OUT STD_LOGIC
	  );
	END COMPONENT;
	
	signal is_started: std_logic := '0';
	signal m_axis_1st_tvalid: std_logic := '0';
	signal m_axis_fifo_error: std_logic := '0';
	signal int_trig: std_logic := '0';
	signal en_int_trig: std_logic := '0';
	signal periodic_trig: std_logic := '0';
	signal periodic_trig_en: std_logic := '0';
	signal trig_force: std_logic := '0';
	signal trig_button_debounced: std_logic := '0';
	signal en_algo_trig: std_logic := '0';
	signal clr_all: std_logic := '0';
	signal pass: std_logic := '0';
	signal release: std_logic := '0';
	
	signal trig: std_logic := '0';
	signal m_axis_1st_tready: std_logic := '0';
	signal m_axis_1st_tlast: std_logic := '0';
	signal m_axis_1st_tdata: std_logic_vector(C_AXIS_DWIDTH-1 downto 0)  := (others => '0');
	signal m_axis_2nd_tvalid: std_logic := '0';
	signal m_axis_2nd_tready: std_logic := '0';
	signal m_axis_2nd_tlast: std_logic := '0';
	signal m_axis_2nd_tdata: std_logic_vector(C_AXIS_DWIDTH-1 downto 0)  := (others => '0');
	signal s_axis_3rd_tvalid: std_logic := '0';
	signal s_axis_3rd_tready: std_logic := '0';
	signal s_axis_3rd_tlast: std_logic := '0';
	signal s_axis_3rd_tdata: std_logic_vector(C_AXIS_DWIDTH-1 downto 0)  := (others => '0');
	
	signal rinse_cntr: std_logic_vector(15 downto 0)  := (others => '0');
	signal max_pass_cntr: std_logic_vector(15 downto 0)  := (others => '0');
	signal pass_cntr: std_logic_vector(15 downto 0)  := (others => '0');

	signal gtu_sig_d0, gtu_sig_d1: std_logic := '0';
	signal gtu_sig_counter_l, gtu_sig_counter_l_d1, gtu_sig_counter_h, gtu_sig_counter_4dma: std_logic_vector(31 downto 0) := (others => '0');
	
	signal int_trig_d0, int_trig_d1 : std_logic := '0';

	signal periodic_trig_d0, periodic_trig_d1: std_logic := '0';

	signal led_cnt : std_logic_vector(23 downto 0) := (others => '0');

	signal trig_button_n: std_logic;


begin


	i_fifo_generator_4trigger_1st : fifo_generator_4trigger_1st
		PORT MAP (
			s_aclk => axis_aclk,
			s_aresetn => axis_aresetn,
			s_axis_tvalid => s_axis_tvalid,
			s_axis_tready => s_axis_tready,
			s_axis_tdata => s_axis_tdata,
			s_axis_tlast => s_axis_tlast,
			m_axis_tvalid => m_axis_1st_tvalid,
			m_axis_tready => m_axis_1st_tready,
			m_axis_tdata => m_axis_1st_tdata,
			m_axis_tlast => m_axis_1st_tlast
		);	

	i_fifo_generator_4trigger_2nd : fifo_generator_4trigger_2nd
		PORT MAP (
			s_aclk => axis_aclk,
			s_aresetn => axis_aresetn,
			s_axis_tvalid => m_axis_1st_tvalid,
			s_axis_tready => m_axis_1st_tready,
			s_axis_tdata => m_axis_1st_tdata,
			s_axis_tlast => m_axis_1st_tlast,
			m_axis_tvalid => m_axis_2nd_tvalid,
			m_axis_tready => m_axis_2nd_tready,
			m_axis_tdata => m_axis_2nd_tdata,
			m_axis_tlast => m_axis_2nd_tlast
		);
		
		m_axis_2nd_tready <= '1';

		is_started <= flags(0);
		en_int_trig <= flags(1);
		en_algo_trig <= flags(2);
		periodic_trig_en <= flags(3);
	
		clr_all <= flags_se(2);
	
		release <= flags_cmd(0);
		trig_force <= flags_cmd(1);  
		
		status(16) <= m_axis_fifo_error;

		trig_button_n <= not trig_button;
		i_debounce: debounce port map(axis_aclk, trig_button_n, trig_button_debounced);

		trig <= ((trig0 or trig1 or trig2) and en_algo_trig) or (int_trig and en_int_trig) or (periodic_trig and periodic_trig_en) or trig_force or trig_button_debounced;
		
		sm: process(axis_aclk)
			variable state : integer range 0 to 3 := 0;
		begin
			if(rising_edge(axis_aclk)) then
				if(clr_all = '1') then
					state := 0;
					rinse_cntr <= (others => '0');
					pass_cntr <= (others => '0');
					s_axis_3rd_tlast <= '0';
					s_axis_3rd_tvalid <= '0';
					pass <= '0';												
				else
					case state is 
						when 0 => if(trig = '1') then
												state := state + 1;
											end if;
						when 1 => if(rinse_cntr = trig_delay) then
												pass <= '1';												
												rinse_cntr <= (others => '0');
												state := state + 1;
											else
												rinse_cntr <= rinse_cntr + 1;
											end if;
						when 2 => if(m_axis_2nd_tvalid = '1') then
												if(pass_cntr = max_pass_cntr) then
													pass_cntr <= (others => '0');
													s_axis_3rd_tlast <= '1';
													state := state + 1;
												else
													s_axis_3rd_tlast <= '0'; 
													pass_cntr <= pass_cntr + 1;
												end if;
											end if;
											s_axis_3rd_tvalid <= m_axis_2nd_tvalid;
						when 3 => s_axis_3rd_tlast <= '0';
											s_axis_3rd_tvalid <= '0';
											if(release = '1') then
												state := 0;
											end if;
					end case;
					status(3 downto 0) <= conv_std_logic_vector(state, 4);
				end if;
			end if;
		end process;

		xpm_cdc_single_inst: xpm_cdc_single
		generic map (
			 DEST_SYNC_FF   => 4, -- integer; range: 2-10
			 SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
			 SRC_INPUT_REG  => 0  -- integer; 0=do not register input, 1=register input
		)
		port map (
			 src_clk  => '0',  -- optional; required when SRC_INPUT_REG = 1
			 src_in   => gtu_sig,
			 dest_clk => axis_aclk,
			 dest_out => gtu_sig_d0
		);

		gtu_sig_counter_process: process(axis_aclk)
		begin
			if(rising_edge(axis_aclk)) then
				if(clr_all = '1') then
					gtu_sig_counter_l <= (others => '0');
					gtu_sig_counter_l_d1 <= (others => '0');
					gtu_sig_counter_h <= (others => '0');
				else
					gtu_sig_d1 <= gtu_sig_d0;
					if(gtu_sig_d0 = '1' and gtu_sig_d1 = '0') then
						gtu_sig_counter_l <= gtu_sig_counter_l + 1;
						gtu_sig_counter_l_d1 <= gtu_sig_counter_l;
						if(gtu_sig_counter_l /= gtu_sig_counter_l_d1 and gtu_sig_counter_l = 0) then
							gtu_sig_counter_h <= gtu_sig_counter_h + 1;
						end if;
					end if;
				end if;
			end if;
		end process;
		
		gtu_sig_counter_h_out <= gtu_sig_counter_h;
		gtu_sig_counter_l_out <= 	gtu_sig_counter_l;
		
		int_trigger_generator_process: process(axis_aclk)
			begin
				if(rising_edge(axis_aclk)) then
					if((gtu_sig_counter_l = trig_test_gtu_time_l) and (gtu_sig_counter_h = trig_test_gtu_time_h)) then
						int_trig_d0 <= '1';
					else
						int_trig_d0 <= '0';
					end if;
					int_trig_d1 <= int_trig_d0;
					int_trig <= int_trig_d0 and (not int_trig_d1);
				end if;
			end process;
			
			periodic_trig_generator: process(axis_aclk)
			begin
				if(rising_edge(axis_aclk)) then
					if(gtu_sig_counter_l(20 downto 0) = periodic_trig_phase) then
						periodic_trig_d0 <= '1';
					else
						periodic_trig_d0 <= '0';
					end if;
					periodic_trig_d1 <= periodic_trig_d0;
					periodic_trig <= periodic_trig_d0 and (not periodic_trig_d1);
				end if;
			end process;
			
			trig_led_indicator: process(axis_aclk)
				variable state : integer range 0 to 1 := 0;
			begin
				if(rising_edge(axis_aclk)) then
					case state is
						when 0 => if(trig = '1') then
												trig_led <= '1';
												state := state + 1;
											end if;
						when 1 => if(led_cnt = X"FFFFFF") then
												trig_led <= '0';
												state := 0;
											end if;
											led_cnt <= led_cnt + 1;
					end case;
				end if;
			end process;


		error_latcher: process(axis_aclk)
			variable state : integer range 0 to 1 := 0;
		begin
			if(rising_edge(axis_aclk)) then
				case state is
					when 0 => if(is_started = '1' and s_axis_3rd_tready = '0') then
											m_axis_fifo_error <= '1';
											state := 1;
										end if;
					when 1 => if(clr_all = '1') then
											m_axis_fifo_error <= '0';
											state := 0;
										end if;
				end case;
			end if;
		end process;
		
		i_fifo_generator_4trigger_3rd : fifo_generator_4trigger_3rd
		PORT MAP (
			s_aclk => axis_aclk,
			s_aresetn => axis_aresetn,
			s_axis_tvalid => s_axis_3rd_tvalid,
			s_axis_tready => s_axis_3rd_tready,
			s_axis_tdata => s_axis_3rd_tdata,
			s_axis_tlast => s_axis_3rd_tlast,
			m_axis_tvalid => m_axis_tvalid,
			m_axis_tready => m_axis_tready,
			m_axis_tdata => m_axis_tdata,
			m_axis_tlast => m_axis_tlast
		);
	
end Behavioral;
