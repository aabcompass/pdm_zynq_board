library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

Library xpm;
use xpm.vcomponents.all;

entity flow_control_d1 is
	generic (
		C_AXIS_DWIDTH : integer := 64;
		C_CNT_DWIDTH : integer := 32;
		C_FREQ : integer := 100000000
	);
  Port ( 
  		-- in
			s_axis_aclk : IN STD_LOGIC;
  		s_axis_aresetn : IN STD_LOGIC;
  		
  		s_axis_tvalid : IN STD_LOGIC;
  		s_axis_tready : OUT STD_LOGIC;
  		s_axis_tdata : IN STD_LOGIC_VECTOR(C_AXIS_DWIDTH-1 DOWNTO 0);
  		s_axis_tlast : IN STD_LOGIC;
  		
  		-- out data
			m_axis_tvalid : OUT STD_LOGIC;
  		m_axis_tready : IN STD_LOGIC;
  		m_axis_tdata : OUT STD_LOGIC_VECTOR(C_AXIS_DWIDTH-1 DOWNTO 0);
  		m_axis_tkeep : OUT STD_LOGIC_VECTOR(C_AXIS_DWIDTH/8-1 DOWNTO 0) := (others => '1');
  		m_axis_tlast : OUT STD_LOGIC := '0';
 		  
 		  -- out events
			m_axis_events_tvalid : OUT STD_LOGIC;
  		m_axis_events_tready : IN STD_LOGIC;
  		m_axis_events_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
  		
  		trig0 : in std_logic;
  		trig1 : in std_logic;
  		trig2 : in std_logic;
  		trig_4led: out std_logic;
  		trig_button: in std_logic;
  		
  		trig_led: out std_logic := '0';
  		
  		trig_ext_in: in std_logic;
  		trig_out: out std_logic;
  		
  		gtu_sig: in std_logic;
  		--regs
  		flags: IN STD_LOGIC_VECTOR(31 downto 0); --0 
  		clr_flags: IN STD_LOGIC_VECTOR(31 downto 0); --1 
  		trig_delay: IN STD_LOGIC_VECTOR(C_CNT_DWIDTH-1 downto 0); --2 UNUSED
  		flags2: IN STD_LOGIC_VECTOR(31 downto 0);	     --3
  		fifo_thr: IN STD_LOGIC_VECTOR(15 downto 0); --4
  		int_trig_gtu_time: IN STD_LOGIC_VECTOR(31 downto 0);  --5
  		n_gtus_per_cycle: IN STD_LOGIC_VECTOR(31 downto 0);  --6 
  		periodic_trig_gtu_period: IN STD_LOGIC_VECTOR(31 downto 0);  --7 
  		num_of_gtus_after_trig: IN STD_LOGIC_VECTOR(15 downto 0);  --8
  		trig_flags2: IN STD_LOGIC_VECTOR(31 downto 0);  --9
  		unix_time_reg: IN STD_LOGIC_VECTOR(31 downto 0);  --10
  		tlast_remover_phase: IN std_logic_vector(2 downto 0) := "000"; --11
  		trigger_relax_time: IN std_logic_vector(23 downto 0) := X"000000"; --12

  		
  		status: OUT STD_LOGIC_VECTOR(31 downto 0);  --14
  		gtu_sig_counter: OUT STD_LOGIC_VECTOR(31 downto 0);  --15
  		unix_time: OUT STD_LOGIC_VECTOR(31 downto 0);  --17
  		trans_counter: OUT STD_LOGIC_VECTOR(C_CNT_DWIDTH-1 downto 0); --18
  		m_axis_fifo_error: OUT STD_LOGIC_VECTOR(31 downto 0); --19
  		gtu_timestamp: OUT STD_LOGIC_VECTOR(31 downto 0); --20
  		trig_type: OUT STD_LOGIC_VECTOR(3 downto 0); --21
  		unix_timestamp: OUT STD_LOGIC_VECTOR(31 downto 0); --22
  		maxis_trans_cnt: OUT STD_LOGIC_VECTOR(31 downto 0); --23
  		maxis_accepted_cnt: OUT STD_LOGIC_VECTOR(31 downto 0); --24
  		trig_all_cnt: OUT STD_LOGIC_VECTOR(31 downto 0) --25
  );
end flow_control_d1;  
     
architecture Behavioral of flow_control_d1 is

	signal sm_state, sm_state_sink: std_logic_vector(3 downto 0) := "0000";

	signal is_started: std_logic := '0';
	signal en_int_trig, en_algo_trig, periodic_trig_en, en_ext_trig, ext_trig_latch: std_logic := '0';
	signal release, release_always: std_logic := '0';
	signal ext_trig: std_logic := '0';
	signal trig, trig_d1, trig_d2, trig_front: std_logic := '0';
	signal trig_immediate, trig_immediate_latch: std_logic := '0';
	signal periodic_trig, periodic_trig_latch: std_logic := '0'; 

	signal clear_error: std_logic := '0';
	
	signal trans_counter_latch: std_logic_vector(C_CNT_DWIDTH-1 downto 0) := (others => '0');
	signal trig_delay_cnt: std_logic_vector(C_CNT_DWIDTH-1 downto 0) := (others => '0');
	signal clr_trans_counter : std_logic := '0';
	signal clr_sink_sm : std_logic := '0';
	
	signal gtu_sig_d0, gtu_sig_d1: std_logic := '0';
	
	signal periodic_trig_phase : std_logic_vector(20 downto 0) := (others => '0');
	
	signal led_cnt, trig_out_cnt : std_logic_vector(23 downto 0) := (others => '0');
	signal m_axis_tlast_cnt : std_logic_vector(15 downto 0) := (others => '0');
	
	signal int_trig_d0, int_trig_d1, int_trig, trig_force : std_logic := '0';
	
	signal trig_event: std_logic := '0';
	signal trig_events_log_en: std_logic := '0';
	signal dma_error: std_logic := '0';
	

	component debounce IS
		GENERIC(
			counter_size  :  INTEGER := 19); --counter size (19 bits gives 10.5ms with 50MHz clock)
		PORT(
			clk     : IN  STD_LOGIC;  --input clock
			button  : IN  STD_LOGIC;  --input signal to be debounced
			result  : OUT STD_LOGIC); --debounced signal
		END component;
		
	signal trig_button_debounced: std_logic := '0';
	signal trig_button_n: std_logic := '0';
	signal clr_all: std_logic := '0';
	signal clr_gtu_cnt: std_logic := '0';
	signal clr_trig_service: std_logic := '0';
	
	COMPONENT axis_data_fifo_extra
		PORT (
			s_axis_aresetn : IN STD_LOGIC;
			s_axis_aclk : IN STD_LOGIC;
			s_axis_tvalid : IN STD_LOGIC;
			s_axis_tready : OUT STD_LOGIC;
			s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
			s_axis_tlast : IN STD_LOGIC;
			m_axis_tvalid : OUT STD_LOGIC;
			m_axis_tready : IN STD_LOGIC;
			m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
			m_axis_tlast : OUT STD_LOGIC;
			axis_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			axis_wr_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			axis_rd_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT axis_fifo_fc
		PORT (
			s_axis_aresetn : IN STD_LOGIC;
			s_axis_aclk : IN STD_LOGIC;
			s_axis_tvalid : IN STD_LOGIC;
			s_axis_tlast : IN STD_LOGIC;
			s_axis_tready : OUT STD_LOGIC;
			s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
			m_axis_tvalid : OUT STD_LOGIC;
			m_axis_tlast : OUT STD_LOGIC;
			m_axis_tready : IN STD_LOGIC;
			m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
			axis_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			axis_wr_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			axis_rd_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT axis_fifo_fc_32
		PORT (
			s_axis_aresetn : IN STD_LOGIC;
			s_axis_aclk : IN STD_LOGIC;
			s_axis_tvalid : IN STD_LOGIC;
			s_axis_tlast : IN STD_LOGIC;
			s_axis_tready : OUT STD_LOGIC;
			s_axis_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			m_axis_tvalid : OUT STD_LOGIC;
			m_axis_tlast : OUT STD_LOGIC;
			m_axis_tready : IN STD_LOGIC;
			m_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			axis_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			axis_wr_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			axis_rd_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT fifo4dma
		PORT (
			s_axis_aresetn : IN STD_LOGIC;
			s_axis_aclk : IN STD_LOGIC;
			s_axis_tvalid : IN STD_LOGIC;
			s_axis_tlast : IN STD_LOGIC;
			s_axis_tready : OUT STD_LOGIC;
			s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
			m_axis_tvalid : OUT STD_LOGIC;
			m_axis_tlast : OUT STD_LOGIC;
			m_axis_tready : IN STD_LOGIC;
			m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
			axis_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			axis_wr_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			axis_rd_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT fifo4gtu_events
		PORT (
			s_axis_aresetn : IN STD_LOGIC;
			s_axis_aclk : IN STD_LOGIC;
			s_axis_tvalid : IN STD_LOGIC;
			s_axis_tready : OUT STD_LOGIC;
			s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
			m_axis_tvalid : OUT STD_LOGIC;
			m_axis_tready : IN STD_LOGIC;
			m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
			axis_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			axis_wr_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			axis_rd_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
		);
	END COMPONENT;
	
	signal axis_fifo_fc_count: std_logic_vector(31 downto 0) := (others => '0');
	
	signal m_axis_tlast_key : std_logic := '0';
	signal m_axis_tlast_i : std_logic := '0';
	signal m_axis_tlast_allowed : std_logic := '0';
	signal m_axis_tlast_allowed_d1 : std_logic := '0';
	
	
	signal m_axis_tdata_i: std_logic_vector(C_AXIS_DWIDTH-1 downto 0) := (others => '0');--=> s_axis_tdata_not_buffered,

	signal m_axis_tvalid_key, m_axis_tready_key: std_logic := '0';
	signal pass: std_logic := '0';
	signal pass_tlast: std_logic := '0';
	signal self_trig, self_trig_latch: std_logic := '0';
	signal one_second_pulse: std_logic := '0';
	signal set_unix_time: std_logic := '0';
	signal trig_latch: std_logic := '0';
	signal trig_latch_clr: std_logic := '0';
	
	signal number_of_triggers: std_logic_vector(15 downto 0) := (others => '0');
	signal trig_cnt: std_logic_vector(15 downto 0) := (others => '0');
	signal trig_all_cnt_i: std_logic_vector(31 downto 0) := (others => '0');
	signal one_second_cnt: std_logic_vector(31 downto 0) := (others => '0');
	signal periodic_trig_gen_cnt, periodic_trig_gen_cnt2: std_logic_vector(31 downto 0) := (others => '0');
	signal int_trig_gen_cnt: std_logic_vector(31 downto 0) := (others => '0');
	
	
	signal en_trig_led, en_trig_out, trig_out_pulse, trig_out_force : std_logic := '0';
	signal trig_ext_in_sync, trig_ext_in_sync_d1 : std_logic := '0';
	
	signal s_axis_tvalid_d1, s_axis_tlast_d1: std_logic := '0';
	signal s_axis_tdata_d1: std_logic_vector(63 downto 0) := (others => '0');
	signal m_axis_tdata_buf: std_logic_vector(63 downto 0) := (others => '0');

  signal tlast_remover_cnt: std_logic_vector(2 downto 0) := "000";
	signal clr_tlast_remover: std_logic := '0';
	
	signal m_axis_tready_sink: std_logic := '0';
	signal fifo_half: std_logic := '0';
	signal m_axis_tvalid_i: std_logic := '0';
	signal m_axis_tready_buf: std_logic := '0';
	signal m_axis_tvalid_buf: std_logic := '0';
	
	signal trans_counter_i: std_logic_vector(C_CNT_DWIDTH-1 downto 0) := (others => '0');
	signal gtu_sig_counter_i: std_logic_vector(31 downto 0) := (others => '0');
	signal unix_time_i: std_logic_vector(31 downto 0) := (others => '0');
	signal maxis_trans_cnt_i: std_logic_vector(31 downto 0) := (others => '0');
	signal maxis_accepted_cnt_i: std_logic_vector(31 downto 0) := (others => '0');
	
	signal inject_16_events_cnt: std_logic_vector(3 downto 0) := (others => '0');
	signal trig_type_i: std_logic_vector(3 downto 0) := (others => '0');
	signal s_axis_events_tdata: std_logic_vector(63 downto 0) := (others => '0');
	signal inject_16_events: std_logic := '0';
	signal cmd_inject_16_events, cmd_inject_16_events_d0, cmd_inject_16_events_d1: std_logic := '0';
	
	signal tlast_out_cnt: std_logic_vector(15 downto 0) := (others => '0');
	signal m_axis_tlast_buf: std_logic := '0';
	
	signal trigger_relax_time_cnt: std_logic_vector(23 downto 0) := (others => '0');


	attribute keep : string; 
	attribute keep of s_axis_tlast_d1: signal is "true";  
	attribute keep of m_axis_tvalid_key: signal is "true";  
	attribute keep of m_axis_tready_key: signal is "true";  
	attribute keep of m_axis_tlast_allowed: signal is "true";  
	attribute keep of axis_fifo_fc_count: signal is "true";  
	attribute keep of sm_state: signal is "true";  
	attribute keep of sm_state_sink: signal is "true";  
	attribute keep of trig_type: signal is "true";  
	attribute keep of m_axis_tdata_i: signal is "true";  
	attribute keep of periodic_trig_gtu_period: signal is "true";  
	attribute keep of periodic_trig_gen_cnt: signal is "true";  
	attribute keep of periodic_trig: signal is "true";  
	attribute keep of m_axis_tready_sink: signal is "true";  
	attribute keep of fifo_half: signal is "true";  
	attribute keep of fifo_thr: signal is "true";  
	attribute keep of trig_latch: signal is "true";  
	attribute keep of tlast_remover_cnt: signal is "true";  
	attribute keep of pass: signal is "true";  
	attribute keep of pass_tlast: signal is "true";  
	attribute keep of trig_latch_clr: signal is "true";  
	attribute keep of m_axis_tlast_cnt: signal is "true";  
	attribute keep of m_axis_tvalid_i: signal is "true";  



begin



----------------------- 

	
xpm_cdc_extsync_inst: xpm_cdc_single
  generic map (
     DEST_SYNC_FF   => 4, -- integer; range: 2-10
     SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
     SRC_INPUT_REG  => 0  -- integer; 0=do not register input, 1=register input
  )
  port map (
     src_clk  => '0',  -- optional; required when SRC_INPUT_REG = 1
     src_in   => trig_ext_in,
     dest_clk => s_axis_aclk,
     dest_out => trig_ext_in_sync
  );

	is_started <= flags(0);
	periodic_trig_en <= flags(1);
	en_algo_trig <= flags(2);
	en_int_trig <= flags(3);
	en_ext_trig <= flags(4);
	release_always <= flags(6); 
	
	clr_trans_counter <= clr_flags(0);
	clear_error <= clr_flags(1);
	clr_all <= clr_flags(2);
	clr_gtu_cnt <= clr_flags(4);
	clr_trig_service <= clr_flags(5);
	clr_tlast_remover <= clr_flags(6);
	clr_sink_sm <= clr_flags(7); 
	 
	trig_immediate <= clr_flags(16);
	
	cmd_inject_16_events_d0 <= clr_flags(17) when rising_edge(s_axis_aclk);
	cmd_inject_16_events_d1 <= cmd_inject_16_events_d0 when rising_edge(s_axis_aclk);
	cmd_inject_16_events <= cmd_inject_16_events_d0 and (not cmd_inject_16_events_d1);

	release <= flags2(0);  
	trig_force <= flags2(1); 
	set_unix_time <= flags2(2); 
	



	number_of_triggers <= trig_flags2(15 downto 0);
	en_trig_led <= trig_flags2(16);
	en_trig_out <= trig_flags2(17);
	trig_out_force <= trig_flags2(18);
	trig_events_log_en <= trig_flags2(19);


	status(3 downto 0) <= sm_state;
	status(7 downto 4) <= sm_state_sink;
	status(8) <= pass;
	status(16) <= trig_latch;
	status(17) <= trig_ext_in_sync;
	status(18) <= dma_error; -- asserted if fifo overflowed. Cleared by release signal
	
	transation_counter: process(s_axis_aclk)
	begin
		if(rising_edge(s_axis_aclk)) then
			if(clr_trans_counter = '1' or clr_all = '1') then
				trans_counter_i <= (others => '0');
			elsif(s_axis_tvalid = '1') then
				trans_counter_i <= trans_counter_i + 1;
			end if;
		end if;
	end process;
	
	trans_counter <= trans_counter_i;

	xpm_cdc_single_inst: xpm_cdc_single
	generic map (
		 DEST_SYNC_FF   => 4, -- integer; range: 2-10
		 SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
		 SRC_INPUT_REG  => 0  -- integer; 0=do not register input, 1=register input
	)
	port map (
		 src_clk  => '0',  -- optional; required when SRC_INPUT_REG = 1
		 src_in   => gtu_sig,
		 dest_clk => s_axis_aclk,
		 dest_out => gtu_sig_d0
	);	
	
	gtu_sig_counter_process: process(s_axis_aclk)
	begin
		if(rising_edge(s_axis_aclk)) then
			if(clr_all = '1' or clr_gtu_cnt = '1') then
				gtu_sig_counter_i <= (others => '0');
			else
				gtu_sig_d1 <= gtu_sig_d0;
				if(gtu_sig_d0 = '1' and gtu_sig_d1 = '0') then
					gtu_sig_counter_i <= gtu_sig_counter_i + 1;
				end if;
			end if;
		end if;
	end process;	
	gtu_sig_counter <= gtu_sig_counter_i;

	one_second_pulse_process: process(s_axis_aclk) 
	begin
		if(rising_edge(s_axis_aclk)) then
			if((one_second_cnt = C_FREQ-1) or (clr_all = '1')) then
				one_second_cnt <= (others => '0'); 
				one_second_pulse <= '1';
			else
				one_second_cnt <= one_second_cnt + 1;
				one_second_pulse <= '0';
			end if;
		end if;
	end process;

	unix_time_process: process(s_axis_aclk) 
	begin
		if(rising_edge(s_axis_aclk)) then
			if(set_unix_time = '1') then
				unix_time_i <= unix_time_reg;
			elsif(one_second_pulse = '1') then
				unix_time_i <= unix_time_i + 1;
			end if;
		end if;
	end process;
	unix_time <= unix_time_i;
	
	periodic_trig_gen: process(s_axis_aclk) 
	begin
		if(rising_edge(s_axis_aclk)) then
			if(clr_all = '1' or clr_trig_service = '1') then
				periodic_trig_gen_cnt <= (others => '0');
				periodic_trig_gen_cnt2 <= (others => '0');
			else
				if(periodic_trig_gen_cnt2 < n_gtus_per_cycle) then
					if(gtu_sig_d0 = '1' and gtu_sig_d1 = '0') then
						if(periodic_trig_gen_cnt = periodic_trig_gtu_period-1) then
							periodic_trig <= periodic_trig_en;
							periodic_trig_gen_cnt <= (others => '0');
						else
							periodic_trig <= '0';
							periodic_trig_gen_cnt <= periodic_trig_gen_cnt + 1;
						end if;
					else
						periodic_trig <= '0';
					end if;
				else
					periodic_trig <= '0';
				end if;
			end if;
		end if;
	end process;
	
	int_trig_gen: process(s_axis_aclk) 
		variable state : integer range 0 to 1 := 0;
	begin
		if(rising_edge(s_axis_aclk)) then
			if(clr_all = '1' or clr_trig_service = '1') then
				int_trig_gen_cnt <= (others => '0');
				state := 0;
			else
				case state is
					when 0 => 
						if(periodic_trig_gen_cnt2 < n_gtus_per_cycle) then
							if(gtu_sig_d0 = '1' and gtu_sig_d1 = '0') then
								if(int_trig_gen_cnt = int_trig_gtu_time-1) then
									int_trig <= en_int_trig;
									state := state + 1;
								else 
									int_trig <= '0';
									int_trig_gen_cnt <= int_trig_gen_cnt + 1;
								end if;
							end if;
						end if;
					when 1 =>
						int_trig <= '0';
				end case;
			end if;
		end if;
	end process;
	
	self_trig <= ((trig0 or trig1 or trig2) and en_algo_trig);
	trig_4led <= trig0 or trig1 or trig2;
	ext_trig <= (trig_ext_in_sync and en_ext_trig);

	trig <= self_trig or int_trig or periodic_trig or trig_force or trig_button_debounced or ext_trig or trig_immediate;
	latency_process: process(s_axis_aclk)
	begin
		if(rising_edge(s_axis_aclk)) then
			trig_d1 <= trig;
			trig_d2 <= trig_d1;
			trig_front <= trig_d1 and (not trig_d2);
			if(trig = '1') then
				periodic_trig_latch <= periodic_trig;
				self_trig_latch <= self_trig;
				ext_trig_latch <= ext_trig;
				trig_immediate_latch <= trig_immediate;
			end if;
		end if;
	end process;
	
	trig_led_indicator: process(s_axis_aclk)
		variable state : integer range 0 to 1 := 0;
	begin
		if(rising_edge(s_axis_aclk)) then
			case state is
				when 0 => if(trig = '1') then
										trig_led <= en_trig_led;
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
	 
	trig_service: process(s_axis_aclk)
		variable state : integer range 0 to 7 := 0;
	begin
		if(rising_edge(s_axis_aclk)) then
			if(clr_all = '1' or clr_trig_service = '1') then
				trig_cnt <= (others => '0');
				trig_type_i <= (others => '0');
				trig_latch <= '0';		
				state := 0;
			else
				sm_state <= conv_std_logic_vector(state, 4);
				case state is
					when 0 => if(trig = '1') then 
											if(self_trig = '1' or ext_trig = '1') then
												if(trig_cnt < number_of_triggers) then
													state := state + 1;
													trig_type_i <= (others => '0');
												end if;
											else
												state := state + 1;
												trig_type_i <= (others => '0');
											end if;
										end if;
					when 1 => 
										if(periodic_trig_latch = '1') then
											trig_type_i <= X"1";
										elsif(self_trig_latch = '1') then
											trig_type_i <= X"2";
											trig_cnt <= trig_cnt + 1;
										elsif(trig_immediate_latch = '1') then
											trig_type_i <= X"3";
										elsif(ext_trig_latch = '1') then
											trig_type_i <= X"4";
											trig_cnt <= trig_cnt + 1;
										else
											trig_type_i <= X"8";
										end if;							
										trig_latch <= '1';		
										gtu_timestamp <= gtu_sig_counter_i;
										unix_timestamp <= unix_time_i;
										state := state + 1;										
					when 2 => if(trig = '0') then
											state := state + 1;
										end if;
					when 3 => if(trig_latch_clr = '1') then
											trig_latch <= '0';
											state := state + 1;
										end if;
					when 4 => if(trigger_relax_time_cnt = trigger_relax_time) then
											state := state + 1;
											trigger_relax_time_cnt <= (others => '0');
										else
											trigger_relax_time_cnt <= trigger_relax_time_cnt + 1;
										end if;
					when 5 => if(m_axis_tlast_i = '0') then
											state := state + 1;
										end if;
					when 6 => if(m_axis_tlast_i = '1') then
											state := state + 1;
										end if;
					when 7 => if(release = '1' or release_always = '1') then
											state := 0;
										end if;
				end case; 
			end if;
		end if;
	end process;
	
	trig_type <= trig_type_i;


  -- this process removes all tlast except every 6th.
  -- By this manner we concat EC-ASICs packet to PDM packets
  tlast_remover: process(s_axis_aclk)
  begin
  	if(rising_edge(s_axis_aclk)) then
  		if(clr_tlast_remover = '1') then
  			tlast_remover_cnt <= "000";
  			pass_tlast <= '0';
  		elsif(s_axis_tlast = '1' and s_axis_tvalid = '1') then
  			if(tlast_remover_cnt = "101") then
  				tlast_remover_cnt <= "000";
  			else
  				tlast_remover_cnt <= tlast_remover_cnt + 1; 
  			end if;
  			if(tlast_remover_cnt = tlast_remover_phase) then
  				pass_tlast <= '1';
  			else
  				pass_tlast <= '0';
  			end if; 
  		end if;	
  	end if;
  end process;
 
  s_axis_tready <= '1';
  s_axis_tvalid_d1 <= s_axis_tvalid when rising_edge(s_axis_aclk);
  s_axis_tdata_d1 <= s_axis_tdata when rising_edge(s_axis_aclk);
  s_axis_tlast_d1 <= s_axis_tlast and pass_tlast when rising_edge(s_axis_aclk);
 
    
	i_axis_fifo_fc : axis_fifo_fc
	PORT MAP (
		s_axis_aresetn => s_axis_aresetn,
		s_axis_aclk => s_axis_aclk,
		s_axis_tvalid => s_axis_tvalid_d1,
		s_axis_tlast => s_axis_tlast_d1,
		s_axis_tready => open,
		s_axis_tdata => s_axis_tdata_d1,
		m_axis_tvalid => m_axis_tvalid_key,
		m_axis_tlast => m_axis_tlast_key,
		m_axis_tready => m_axis_tready_key,
		m_axis_tdata => m_axis_tdata_buf,
		axis_data_count => axis_fifo_fc_count,
		axis_wr_data_count => open,
		axis_rd_data_count => open
	);

	--m_axis_tready_key <= m_axis_tready_buf and (pass or m_axis_tready_sink);
	m_axis_tready_key <= (pass or m_axis_tready_sink);
	m_axis_tvalid_i <= m_axis_tvalid_key and pass;
	m_axis_tvalid_buf <= m_axis_tvalid_i;
	--m_axis_tlast <= m_axis_tlast_key and pass;

	comparator: process(s_axis_aclk)
	begin
		if(rising_edge(s_axis_aclk)) then
			if(axis_fifo_fc_count > fifo_thr) then
				fifo_half <= '1';
			else
				fifo_half <= '0';
			end if;
		end if;
	end process;

	sink_process: process(s_axis_aclk)
		variable state : integer range 0 to 2 := 0;
	begin
		if(rising_edge(s_axis_aclk)) then
			if(clr_sink_sm = '1') then
				state := 0;
				m_axis_tready_sink <= '0';
				trig_latch_clr <= '0';
				pass <= '0';
				m_axis_tlast_cnt <= conv_std_logic_vector(0, 16);
			else
				sm_state_sink <= conv_std_logic_vector(state, 4);
				case state is
					-- waiting for tlast. Take a decision: sink or not
					when 0 =>	if(fifo_half = '1') then
											m_axis_tready_sink <= '1';
											if(trig_latch = '1') then
												state := state + 1;
											end if;
										else
											m_axis_tready_sink <= '0';
										end if;
										trig_latch_clr <= '0';
					when 1 => if(m_axis_tlast_key = '1') then
											m_axis_tready_sink <= '0';
											pass <= '1';
											m_axis_tlast_cnt <= conv_std_logic_vector(1, 16);
											state := state + 1;
										end if;
					when 2 => if(m_axis_tlast_key = '1') then
											if(m_axis_tlast_cnt = num_of_gtus_after_trig) then
												pass <= '0';
												trig_latch_clr <= '1';
												state := 0;
											else
												m_axis_tlast_cnt <= m_axis_tlast_cnt + 1;
											end if;
										end if;
				end case;
			end if;
		end if;
	end process;

	maxis_trans_cnt_process: process(s_axis_aclk)
		begin
		if(rising_edge(s_axis_aclk)) then
			-- here we count all transfers accepted from DMA
			if(m_axis_tready_buf = '1' and m_axis_tvalid_i = '1') then
				maxis_accepted_cnt_i <= maxis_accepted_cnt_i + 1;
			end if;
			-- here we count all transfers, whether accepted or not
			if(m_axis_tvalid_i = '1') then
				maxis_trans_cnt_i <= maxis_trans_cnt_i + 1;
			end if;
		end if; 	
	end process;
	maxis_trans_cnt <= maxis_trans_cnt_i;
	maxis_accepted_cnt <= maxis_accepted_cnt_i;
	
	fifo4dma_overflow_control: process(s_axis_aclk)
	begin
		if(rising_edge(s_axis_aclk)) then
			if(clr_all = '1' or release = '1') then
				dma_error <= '0';
			elsif(m_axis_tready_buf = '0') then
				dma_error <= '1';
			end if;
		end if;
	end process;
		
	tlast_out_former: process(s_axis_aclk)
	begin
		if(rising_edge(s_axis_aclk)) then
			if(clr_all = '1') then
				m_axis_tlast_buf <= '0';
				tlast_out_cnt <= X"0000";
			else
				if(m_axis_tvalid_buf = '1' and  m_axis_tready_buf = '1') then
					if(tlast_out_cnt = X"8FFE") then
						tlast_out_cnt <= tlast_out_cnt + 1;
						m_axis_tlast_buf <= '1';
					elsif(tlast_out_cnt = X"8FFF") then
						tlast_out_cnt <= X"0000";
						m_axis_tlast_buf <= '0';
					else
						tlast_out_cnt <= tlast_out_cnt + 1;
						m_axis_tlast_buf <= '0';
					end if;
				end if;
			end if;
		end if;
	end process;
	
	i_fifo4dma : fifo4dma
	  PORT MAP (
	    s_axis_aresetn => s_axis_aresetn,
	    s_axis_aclk => s_axis_aclk,
	    s_axis_tvalid => m_axis_tvalid_buf,
	    s_axis_tlast => m_axis_tlast_buf,
	    s_axis_tready => m_axis_tready_buf,
	    s_axis_tdata => m_axis_tdata_buf,
	    m_axis_tvalid => m_axis_tvalid,
	    m_axis_tlast => m_axis_tlast_i,
	    m_axis_tready => m_axis_tready,
	    m_axis_tdata => m_axis_tdata,
	    axis_data_count => open,
	    axis_wr_data_count => open,
	    axis_rd_data_count => open
	  );

	m_axis_tlast <= m_axis_tlast_i;
-----------------------------------------
-- Trigger GTU event logging to M-AXIS --
-----------------------------------------

	inject_16_events_process: process(s_axis_aclk)
	begin
		if(rising_edge(s_axis_aclk)) then
			if(cmd_inject_16_events = '1') then 
				inject_16_events_cnt <= "0000"; 
				inject_16_events <= '1'; 
			elsif(inject_16_events_cnt = "1111") then 
				inject_16_events <= '0'; 
			else
				inject_16_events_cnt <= inject_16_events_cnt + 1;
			end if; 
		end if;
	end process;

	trig_event <= (trig_front and trig_events_log_en) or inject_16_events;
	s_axis_events_tdata <= gtu_sig_counter_i & X"0001000" & trig_type_i;

	i_fifo4gtu_events : fifo4gtu_events
		PORT MAP (
			s_axis_aresetn => s_axis_aresetn,
			s_axis_aclk => s_axis_aclk,
			s_axis_tvalid => trig_event,
			s_axis_tready => open,
			s_axis_tdata => s_axis_events_tdata,--gtu_sig_counter_i,
			m_axis_tvalid => m_axis_events_tvalid,
			m_axis_tready => m_axis_events_tready,
			m_axis_tdata => m_axis_events_tdata,
			axis_data_count => open,
			axis_wr_data_count => open,
			axis_rd_data_count => open
		);

	trig_all_cnt_process:  process(s_axis_aclk) 
	begin
		if(rising_edge(s_axis_aclk)) then
			if(trig_events_log_en = '0') then
				trig_all_cnt_i <= (others => '0');
			elsif(trig_front = '1') then
				trig_all_cnt_i <= trig_all_cnt_i + 1;
			end if;
		end if;
	end process; 
	
	trig_all_cnt <= trig_all_cnt_i;


		
end Behavioral;
