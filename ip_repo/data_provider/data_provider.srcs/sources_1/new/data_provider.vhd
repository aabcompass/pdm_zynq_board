-- module for preparing data gathered from Artix board.
-- module provides:
	-- crossing clock domain
	-- DDR conversion  

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

library UNISIM;
use UNISIM.VComponents.all;

Library xpm;
use xpm.vcomponents.all;


entity data_provider is
    Port ( 
			-- 100 MHz clocks from external PLL/MMCM
			clk_art0_x1 : in STD_LOGIC;
			clk_art1_x1 : in STD_LOGIC;
			clk_art2_x1 : in STD_LOGIC;
			-- frame signals
			frame_art0:  in std_logic;
			frame_art1:  in std_logic;
			frame_art2:  in std_logic;
			-- data lines
			data_art0: in std_logic_vector(15 downto 0);
			data_art1: in std_logic_vector(15 downto 0);
			data_art2: in std_logic_vector(15 downto 0);			
			-- control
			start_sig: in std_logic;
			--testgen
			clr_reg: in std_logic_vector(31 downto 0);
			testmode: in std_logic_vector(31 downto 0);
			pattern_initial_0r_01: in std_logic_vector(31 downto 0);
			pattern_initial_1r_1l: in std_logic_vector(31 downto 0);
			pattern_initial_2r_21: in std_logic_vector(31 downto 0);
			pattern_trans_step: in std_logic_vector(31 downto 0);
			pattern_trans_max: in std_logic_vector(31 downto 0);
			-- params
			infinite : in std_logic;
			num_of_frames: in std_logic_vector(20 downto 0);
			-- pixel masking
			pixel_masking_reg: in std_logic_vector(31 downto 0);
			-- ADCV calc params
			adcv_max_asic_cnts: in std_logic_vector(7 downto 0);
			adcv_max_pixel_num: in std_logic_vector(7 downto 0); 
			ec_sig_out: out std_logic_vector(8 downto 0);
			-- stat
			status : out std_logic_vector(31 downto 0);
			
			counter_tvalid_all_latch: out std_logic_vector(15 downto 0);
			-- -- data to trigger L1 and to memory buffer
			s_axi_clk: in std_logic;
			-- raw data to MPU
			m_axis_aclk: in std_logic;
--			m_axis_200MHz_aclk: in std_logic;
			
			m_axis_art0l_tdata: out std_logic_vector(15 downto 0);
			m_axis_art0l_tkeep: out std_logic_vector(1 downto 0);
			m_axis_art0l_tvalid: out std_logic;
			m_axis_art0l_tlast: out std_logic;
			m_axis_art0l_tready: in std_logic;
			
			m_axis_art0r_tdata: out std_logic_vector(15 downto 0);
			m_axis_art0r_tkeep: out std_logic_vector(1 downto 0);
			m_axis_art0r_tvalid: out std_logic;
			m_axis_art0r_tlast: out std_logic;
			m_axis_art0r_tready: in std_logic;
			
			m_axis_art1l_tdata: out std_logic_vector(15 downto 0);
			m_axis_art1l_tkeep: out std_logic_vector(1 downto 0);
			m_axis_art1l_tvalid: out std_logic;
			m_axis_art1l_tlast: out std_logic;
			m_axis_art1l_tready: in std_logic;
			
			m_axis_art1r_tdata: out std_logic_vector(15 downto 0);
			m_axis_art1r_tkeep: out std_logic_vector(1 downto 0);
			m_axis_art1r_tvalid: out std_logic;
			m_axis_art1r_tlast: out std_logic;
			m_axis_art1r_tready: in std_logic;
			
			m_axis_art2l_tdata: out std_logic_vector(15 downto 0);
			m_axis_art2l_tkeep: out std_logic_vector(1 downto 0);
			m_axis_art2l_tvalid: out std_logic;
			m_axis_art2l_tlast: out std_logic;
			m_axis_art2l_tready: in std_logic;
			
			m_axis_art2r_tdata: out std_logic_vector(15 downto 0);
			m_axis_art2r_tkeep: out std_logic_vector(1 downto 0);
			m_axis_art2r_tvalid: out std_logic;
			m_axis_art2r_tlast: out std_logic;
			m_axis_art2r_tready: in std_logic
    );
end data_provider; 

architecture Behavioral of data_provider is

attribute KEEP_HIERARCHY : string;
attribute KEEP_HIERARCHY of Behavioral: architecture is "TRUE";
 
	
	COMPONENT fifo_generator_0
		PORT (
			m_aclk : IN STD_LOGIC;
			s_aclk : IN STD_LOGIC;
			s_aresetn : IN STD_LOGIC;
			s_axis_tvalid : IN STD_LOGIC;
			s_axis_tready : OUT STD_LOGIC;
			s_axis_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			s_axis_tkeep : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			s_axis_tlast : IN STD_LOGIC;
			m_axis_tvalid : OUT STD_LOGIC;
			m_axis_tready : IN STD_LOGIC;
			m_axis_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			m_axis_tkeep : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			m_axis_tlast : OUT STD_LOGIC;
			axis_prog_empty : OUT STD_LOGIC
		);
	END COMPONENT;
	
	signal data_art0_odd, data_art0_even: std_logic_vector(15 downto 0) := (others => '0');
	signal data_art1_odd, data_art1_even: std_logic_vector(15 downto 0) := (others => '0');
	signal data_art2_odd, data_art2_even: std_logic_vector(15 downto 0) := (others => '0');
	signal data_art0_ddr, data_art1_ddr, data_art2_ddr: std_logic_vector(31 downto 0) := (others => '0');
	signal data_art0_ddr_d1, data_art1_ddr_d1, data_art2_ddr_d1: std_logic_vector(31 downto 0) := (others => '0');
	signal data_art0_ddr_d2, data_art1_ddr_d2, data_art2_ddr_d2: std_logic_vector(31 downto 0) := (others => '0');
	signal data_art0_ddr_d3, data_art1_ddr_d3, data_art2_ddr_d3: std_logic_vector(31 downto 0) := (others => '0');
	signal data_art0_ddr_d2_sw16, data_art1_ddr_d2_sw16, data_art2_ddr_d2_sw16: std_logic_vector(31 downto 0) := (others => '0');
	signal algob_fifo_16to8_0l_dout, algob_fifo_16to8_0r_dout: std_logic_vector(7 downto 0) := (others => '0');
	signal algob_fifo_16to8_1l_dout, algob_fifo_16to8_1r_dout: std_logic_vector(7 downto 0) := (others => '0');
	signal algob_fifo_16to8_2l_dout, algob_fifo_16to8_2r_dout: std_logic_vector(7 downto 0) := (others => '0');
	signal format_converter_0l_dataout, format_converter_0r_dataout: std_logic_vector(7 downto 0) := (others => '0');
	signal format_converter_1l_dataout, format_converter_1r_dataout: std_logic_vector(7 downto 0) := (others => '0');
	signal format_converter_2l_dataout, format_converter_2r_dataout: std_logic_vector(7 downto 0) := (others => '0');
	
	signal clk_art_x1 : std_logic_vector(2 downto 0);
	signal frame_art_Q1, frame_art_Q2 : std_logic_vector(2 downto 0) := "000";
	signal fifo_rst_n : std_logic_vector(2 downto 0) := "000";
	
	signal start_sig_d1, start_sig_d2 : std_logic_vector(2 downto 0) := "000";
	signal start_feed : std_logic_vector(2 downto 0) := "000";
	signal start_feed_int : std_logic_vector(2 downto 0) := "000";
	signal s_axis_tlast_art_cc_fifo, s_axis_tvalid_art_cc_fifo  : std_logic_vector(2 downto 0) := "000";
	signal s_axis_tlast_art_cc_fifo_d1, s_axis_tvalid_art_cc_fifo_d1  : std_logic_vector(2 downto 0) := "000";
	signal s_axis_tlast_art_int_fifo, s_axis_tvalid_art_int_fifo  : std_logic_vector(2 downto 0) := "000";
	
	signal tcounter : std_logic_vector(8 downto 0) := (others => '0');
	signal counter2, counter2_d1 : std_logic_vector(7 downto 0) := (others => '0');
	signal testgen_dout : std_logic_vector(7 downto 0) := (others => '0');
	signal format_converter_0_datain, format_converter_1_datain : std_logic_vector(7 downto 0) := (others => '0');

	signal frame_art0_check, frame_art1_check, frame_art2_check : std_logic := '0';
	signal algob_fifo_0_dv, algob_fifo_1_dv, algob_fifo_2_dv : std_logic := '0';
	signal format_converter_datain_dv : std_logic := '0';
	signal format_converter_dv : std_logic_vector(2 downto 0) := "000";
	signal testgen_dout_dv, testgen_dout_dv_d1 : std_logic := '0';
	signal is_test_gen_d1, is_test_gen_d2 : std_logic := '0';

	signal gtu_front, frame_art_Q1_1_front_d1, frame_art_Q1_1_front, frame_art_Q1_1_d1: std_logic := '0'; 

	signal timestamp2_l_21: std_logic := '0';
	signal timestamp2_l_21_d1: std_logic := '0';

	
	signal m_axis_art0l_tvalid_i: std_logic := '0';
	signal m_axis_art0r_tvalid_i: std_logic := '0';
	signal m_axis_art1l_tvalid_i: std_logic := '0';
	signal m_axis_art1r_tvalid_i: std_logic := '0';
	signal m_axis_art2l_tvalid_i: std_logic := '0';
	signal m_axis_art2r_tvalid_i: std_logic := '0';
	
	signal axis_prog_empty_0l: std_logic := '0';
	signal axis_prog_empty_0r: std_logic := '0';
	signal axis_prog_empty_1l: std_logic := '0';
	signal axis_prog_empty_1r: std_logic := '0';
	signal axis_prog_empty_2l: std_logic := '0';
	signal axis_prog_empty_2r: std_logic := '0';
	
	signal all_ready: std_logic := '0';
	signal atleast_one_empty: std_logic := '0';
	signal counter_rd : std_logic_vector(8 downto 0) := (others => '0');
	

	signal counter_tvalid_art0l, counter_tvalid_art0l_latch: std_logic_vector(15 downto 0) := (others => '0');
	signal counter_tvalid_art0r, counter_tvalid_art0r_latch: std_logic_vector(15 downto 0) := (others => '0');
	signal counter_tvalid_art1l, counter_tvalid_art1l_latch: std_logic_vector(15 downto 0) := (others => '0');
	signal counter_tvalid_art1r, counter_tvalid_art1r_latch: std_logic_vector(15 downto 0) := (others => '0');
	signal counter_tvalid_art2l, counter_tvalid_art2l_latch: std_logic_vector(15 downto 0) := (others => '0');
	signal counter_tvalid_art2r, counter_tvalid_art2r_latch: std_logic_vector(15 downto 0) := (others => '0');
	
	signal m_axis_art0l_tdata_real: std_logic_vector(15 downto 0) := (others => '0');
	signal m_axis_art0r_tdata_real: std_logic_vector(15 downto 0) := (others => '0');
	signal m_axis_art1l_tdata_real: std_logic_vector(15 downto 0) := (others => '0');
	signal m_axis_art1r_tdata_real: std_logic_vector(15 downto 0) := (others => '0');
	signal m_axis_art2l_tdata_real: std_logic_vector(15 downto 0) := (others => '0');
	signal m_axis_art2r_tdata_real: std_logic_vector(15 downto 0) := (others => '0');
	signal m_axis_art0l_tdata_pattern: std_logic_vector(15 downto 0) := (others => '0');
	signal m_axis_art0r_tdata_pattern: std_logic_vector(15 downto 0) := (others => '0');
	signal m_axis_art1l_tdata_pattern: std_logic_vector(15 downto 0) := (others => '0');
	signal m_axis_art1r_tdata_pattern: std_logic_vector(15 downto 0) := (others => '0');
	signal m_axis_art2l_tdata_pattern: std_logic_vector(15 downto 0) := (others => '0');
	signal m_axis_art2r_tdata_pattern: std_logic_vector(15 downto 0) := (others => '0');
	
	signal pattern_step_cntr: std_logic_vector(31 downto 0) := (others => '0');
	signal pattern_cntr: std_logic_vector(31 downto 0) := (others => '0');
	
	signal is_pattern: std_logic := '0';
	signal is_all_ones: std_logic := '0';
	signal clr_pattern: std_logic := '0';
	
	signal mem_doutb: std_logic_vector(11 downto 0) := (others => '0');
	
	signal pixelmask0b_art0l : std_logic := '0';--<= mem_doutb(0);
	signal pixelmask1b_art0l : std_logic := '0';--<= mem_doutb(1);
	signal pixelmask0b_art0r : std_logic := '0';--<= mem_doutb(2);
	signal pixelmask1b_art0r : std_logic := '0';--<= mem_doutb(3);
	signal pixelmask0b_art1l : std_logic := '0';--<= mem_doutb(4);
	signal pixelmask1b_art1l : std_logic := '0';--<= mem_doutb(5);
	signal pixelmask0b_art1r : std_logic := '0';--<= mem_doutb(6);
	signal pixelmask1b_art1r : std_logic := '0';--<= mem_doutb(7);
	signal pixelmask0b_art2l : std_logic := '0';--<= mem_doutb(8);
	signal pixelmask1b_art2l : std_logic := '0';--<= mem_doutb(9);
	signal pixelmask0b_art2r : std_logic := '0';--<= mem_doutb(10);
	signal pixelmask1b_art2r : std_logic := '0';--<= mem_doutb(11);

	signal pixelmask0_art0l, pixelmask1_art0l, pixelmask0_art0r, pixelmask1_art0r: std_logic_vector(7 downto 0); 
	signal pixelmask0_art1l, pixelmask1_art1l, pixelmask0_art1r, pixelmask1_art1r: std_logic_vector(7 downto 0); 
	signal pixelmask0_art2l, pixelmask1_art2l, pixelmask0_art2r, pixelmask1_art2r: std_logic_vector(7 downto 0); 


	attribute keep : string;  
	attribute keep of frame_art0_check: signal is "true"; 
	attribute keep of frame_art1_check: signal is "true"; 
	attribute keep of frame_art2_check: signal is "true"; 
	
	attribute keep of counter_tvalid_art0l: signal is "true"; 
	attribute keep of counter_tvalid_art0r: signal is "true"; 
	attribute keep of counter_tvalid_art1l: signal is "true"; 
	attribute keep of counter_tvalid_art1r: signal is "true"; 
	attribute keep of counter_tvalid_art2l: signal is "true"; 
	attribute keep of counter_tvalid_art2r: signal is "true";
	attribute keep of counter_tvalid_art0l_latch: signal is "true"; 
	attribute keep of counter_tvalid_art0r_latch: signal is "true"; 
	attribute keep of counter_tvalid_art1l_latch: signal is "true"; 
	attribute keep of counter_tvalid_art1r_latch: signal is "true"; 
	attribute keep of counter_tvalid_art2l_latch: signal is "true"; 
	attribute keep of counter_tvalid_art2r_latch: signal is "true";
	attribute keep of start_feed: signal is "true";
	 
	attribute keep of frame_art_Q1: signal is "true"; 

	
begin

-----------------------------------------------------------
-- data_art conversion from DDR to SDR
-----------------------------------------------------------

	 IDDR_inst_data_gen: for i in 15 downto 0 generate  

		 -- DDR modules for data artix0
		 IDDR_inst_data_art0 : IDDR 
		 generic map (
				DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE", "SAME_EDGE"  or "SAME_EDGE_PIPELINED" 
				INIT_Q1 => '0', -- Initial value of Q1: '0' or '1'
				INIT_Q2 => '0', -- Initial value of Q2: '0' or '1'
				SRTYPE => "SYNC") -- Set/Reset type: "SYNC" or "ASYNC" 
		 port map (
				Q1 => data_art0_odd(i), -- 1-bit output for positive edge of clock (odd ��������)
				Q2 => data_art0_even(i), -- 1-bit output for negative edge of clock (even ������)
				C => clk_art0_x1,   -- 1-bit clock input
				CE => '1', -- 1-bit clock enable input
				D => data_art0(i),   -- 1-bit DDR data input
				R => '0',   -- 1-bit reset
				S => '0'    -- 1-bit set
				);	

		 -- DDR modules for data artix1
		 IDDR_inst_data_art1 : IDDR 
		 generic map (
				DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE", "SAME_EDGE"  or "SAME_EDGE_PIPELINED" 
				INIT_Q1 => '0', -- Initial value of Q1: '0' or '1'
				INIT_Q2 => '0', -- Initial value of Q2: '0' or '1'
				SRTYPE => "SYNC") -- Set/Reset type: "SYNC" or "ASYNC" 
		 port map (
				Q1 => data_art1_odd(i), -- 1-bit output for positive edge of clock  (odd ��������)
				Q2 => data_art1_even(i), -- 1-bit output for negative edge of clock  (even ������)
				C => clk_art1_x1,   -- 1-bit clock input
				CE => '1', -- 1-bit clock enable input
				D => data_art1(i),   -- 1-bit DDR data input
				R => '0',   -- 1-bit reset
				S => '0'    -- 1-bit set
				);	


		 -- DDR modules for data artix2
		 IDDR_inst_data_art2 : IDDR 
		 generic map (
				DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE", "SAME_EDGE" or "SAME_EDGE_PIPELINED" 
				INIT_Q1 => '0', -- Initial value of Q1: '0' or '1'
				INIT_Q2 => '0', -- Initial value of Q2: '0' or '1'
				SRTYPE => "SYNC") -- Set/Reset type: "SYNC" or "ASYNC" 
		 port map (
				Q1 => data_art2_odd(i), -- 1-bit output for positive edge of clock  (odd ��������)
				Q2 => data_art2_even(i), -- 1-bit output for negative edge of clock  (even ������)
				C => clk_art2_x1,   -- 1-bit clock input
				CE => '1', -- 1-bit clock enable input
				D => data_art2(i),   -- 1-bit DDR data input
				R => '0',   -- 1-bit reset
				S => '0'    -- 1-bit set
				);	

		-- reordering DDR out data. 
		-- Combining odd and even
		
		data_art0_ddr(2*i+1) <= data_art0_odd(i);
		data_art0_ddr(2*i) <= data_art0_even(i);
		data_art1_ddr(2*i+1) <= data_art1_odd(i);
		data_art1_ddr(2*i) <= data_art1_even(i);
		data_art2_ddr(2*i+1) <= data_art2_odd(i);
		data_art2_ddr(2*i) <= data_art2_even(i);

   end generate;

-----------------------------------------------------------
-- frame_art conversion from DDR to SDR
-----------------------------------------------------------
   
		 -- DDR modules for frame artix0
   IDDR_inst_frame_art0 : IDDR 
   generic map (
				DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE", "SAME_EDGE" or "SAME_EDGE_PIPELINED" 
				INIT_Q1 => '0', -- Initial value of Q1: '0' or '1'
				INIT_Q2 => '0', -- Initial value of Q2: '0' or '1'
				SRTYPE => "SYNC") -- Set/Reset type: "SYNC" or "ASYNC" 
   port map (
				Q1 => frame_art_Q1(0), -- 1-bit output for positive edge of clock 
				Q2 => frame_art_Q2(0), -- 1-bit output for negative edge of clock
				C => clk_art0_x1,   -- 1-bit clock input
				CE => '1', -- 1-bit clock enable input
				D => frame_art0,   -- 1-bit DDR data input
				R => '0',   -- 1-bit reset
				S => '0'    -- 1-bit set
				);	
   
		 -- DDR modules for frame artix1
   IDDR_inst_frame_art1 : IDDR 
   generic map (
				DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE", "SAME_EDGE" or "SAME_EDGE_PIPELINED" 
				INIT_Q1 => '0', -- Initial value of Q1: '0' or '1'
				INIT_Q2 => '0', -- Initial value of Q2: '0' or '1'
				SRTYPE => "SYNC") -- Set/Reset type: "SYNC" or "ASYNC" 
   port map (
				Q1 => frame_art_Q1(1), -- 1-bit output for positive edge of clock 
				Q2 => frame_art_Q2(1), -- 1-bit output for negative edge of clock
				C => clk_art1_x1,   -- 1-bit clock input
				CE => '1', -- 1-bit clock enable input
				D => frame_art1,   -- 1-bit DDR data input
				R => '0',   -- 1-bit reset
				S => '0'    -- 1-bit set
				);	
   
		 -- DDR modules for frame artix2
   IDDR_inst_frame_art2 : IDDR 
   generic map (
				DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE", "SAME_EDGE" or "SAME_EDGE_PIPELINED" 
				INIT_Q1 => '0', -- Initial value of Q1: '0' or '1'
				INIT_Q2 => '0', -- Initial value of Q2: '0' or '1'
				SRTYPE => "SYNC") -- Set/Reset type: "SYNC" or "ASYNC" 
   port map (
				Q1 => frame_art_Q1(2), -- 1-bit output for positive edge of clock 
				Q2 => frame_art_Q2(2), -- 1-bit output for negative edge of clock
				C => clk_art2_x1,   -- 1-bit clock input
				CE => '1', -- 1-bit clock enable input
				D => frame_art2,   -- 1-bit DDR data input
				R => '0',   -- 1-bit reset
				S => '0'    -- 1-bit set
				);	
 -----------------------------------------------------------
-- CHECK THE CONSISTENCY AFTER DDR TO SDR CONVERSION. CHIPSCOPE ONLY
-----------------------------------------------------------

   frame_art0_check <= frame_art_Q1(0) xor frame_art_Q2(0); 
   frame_art1_check <= frame_art_Q1(1) xor frame_art_Q2(1); 
   frame_art2_check <= frame_art_Q1(2) xor frame_art_Q2(2); 
   
  
  data_art0_ddr_d1 <= data_art0_ddr when rising_edge(clk_art0_x1);
  data_art0_ddr_d2 <= data_art0_ddr_d1 when is_all_ones = '0' else X"01010101";
  data_art1_ddr_d1 <= data_art1_ddr when rising_edge(clk_art1_x1);
  data_art1_ddr_d2 <= data_art1_ddr_d1 when is_all_ones = '0' else X"01010101";
  data_art2_ddr_d1 <= data_art2_ddr when rising_edge(clk_art2_x1);
  data_art2_ddr_d2 <= data_art2_ddr_d1 when is_all_ones = '0' else X"01010101";
  data_art0_ddr_d3 <= data_art0_ddr_d2  when rising_edge(clk_art0_x1);
  data_art1_ddr_d3 <= data_art1_ddr_d2  when rising_edge(clk_art1_x1);
  data_art2_ddr_d3 <= data_art2_ddr_d2  when rising_edge(clk_art2_x1);

	clk_art_x1(0) <= clk_art0_x1;
	clk_art_x1(1) <= clk_art1_x1;
	clk_art_x1(2) <= clk_art2_x1;

raw_datapath_gen: for i in 0 to 2 generate

	signal counter_frames : std_logic_vector(20 downto 0) := (others => '0');
	signal counter : std_logic_vector(8 downto 0) := (others => '0');
	signal infinite_d1: std_logic := '0';
	signal status_d0: std_logic := '0';
	
	signal ecasic_num: std_logic_vector(2 downto 0);
	signal wea: std_logic_vector(0 downto 0);
	signal write_cmd: std_logic;
	signal pixel_discard: std_logic_vector(0 downto 0);
	signal pixel_num: std_logic_vector(8 downto 0);
	signal addra: std_logic_vector(9 downto 0);
	


	COMPONENT blk_mem4data_prov
		PORT (
			clka : IN STD_LOGIC;
			ena : IN STD_LOGIC;
			wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
			addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			dina : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
			clkb : IN STD_LOGIC;
			addrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			doutb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;
	
begin

	xpm_cdc_single_inst: xpm_cdc_single
  generic map (
     DEST_SYNC_FF   => 4, -- integer; range: 2-10
     SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
     SRC_INPUT_REG  => 1  -- integer; 0=do not register input, 1=register input
  )
  port map (
     src_clk  => s_axi_clk,  -- optional; required when SRC_INPUT_REG = 1
     src_in   => infinite,
     dest_clk => clk_art_x1(i),
     dest_out => infinite_d1
  );

  inst_fd0: fd port map(start_sig_d1(i), clk_art_x1(i), start_sig);
  inst_fd1: fd port map(start_sig_d2(i), clk_art_x1(i), start_sig_d1(i));
  start_feed(i) <= start_sig_d1(i) and (not start_sig_d2(i)) when rising_edge(clk_art_x1(i));
   
	fifo_cc_feeder: process(clk_art_x1(i))
		variable state : integer range 0 to 3 := 0;
	begin
		if(rising_edge(clk_art_x1(i))) then
			case state is
				when 0 => if(start_feed(i) = '1') then
										counter_frames <= num_of_frames - 1;	
										state := state + 1;
									elsif (counter_frames /= 0) then
										state := state + 1;	
										counter_frames <= counter_frames - 1;	
									elsif(infinite_d1 = '1') then	
										state := state + 1;
										counter_frames <= counter_frames - 1;									
									end if;																
									s_axis_tlast_art_cc_fifo(i) <= '0';
									s_axis_tvalid_art_cc_fifo(i) <= '0';
				when 1 => if(frame_art_Q1(i) = '0') then
										state := state + 1; 
									end if;
				when 2 => if(frame_art_Q1(i) = '1') then
										state := state + 1;
									end if;
				when 3 => if(counter = conv_std_logic_vector(192-1, 9)) then
										counter <= (others => '0');
										s_axis_tlast_art_cc_fifo(i) <= '1';
										state := 0;
									else
										counter <= counter + 1;
										s_axis_tlast_art_cc_fifo(i) <= '0';
									end if;
									s_axis_tvalid_art_cc_fifo(i) <= '1';
			end case;
		end if;
	end process;
	
	status_former: process(clk_art_x1(i))
	begin
		if(rising_edge(clk_art_x1(i))) then
			if(counter_frames /= 0 or infinite_d1 = '1') then
				status_d0 <= '1';
			else
				status_d0 <= '0';
			end if;
		end if;
	end process;
		
	xpm_cdc_status: xpm_cdc_single
  generic map (
     DEST_SYNC_FF   => 4, -- integer; range: 2-10
     SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
     SRC_INPUT_REG  => 1  -- integer; 0=do not register input, 1=register input
  )
  port map (
     src_clk  => clk_art_x1(i),  -- optional; required when SRC_INPUT_REG = 1
     src_in   => status_d0,
     dest_clk => s_axi_clk,
     dest_out => status(i)
  );
		
	
	frame_art_Q1_1_d1 <= frame_art_Q1(1) when rising_edge(clk_art_x1(1));
	frame_art_Q1_1_front <= frame_art_Q1(1) and (not frame_art_Q1_1_d1) when rising_edge(clk_art_x1(1));
	
	fifo_rstn_former: process(clk_art_x1(i))
		variable cntv: integer := 0;
	begin
		if(rising_edge(clk_art_x1(i))) then
			if(cntv = 10) then
				fifo_rst_n(i) <= '1';
			else
				cntv := cntv + 1;
			end if;
		end if;
	end process;

	pixel_discard <= pixel_masking_reg(0 downto 0 );
	pixel_num <= pixel_masking_reg(16 downto 8);
	ecasic_num <= pixel_masking_reg(22 downto 20);
	write_cmd <= pixel_masking_reg(24);
	
	addra <= pixel_num(8 downto 1) & ecasic_num(0) & pixel_num(0 downto 0);
	
	wea <= "1" when (conv_integer(ecasic_num(2 downto 1)) = i) and write_cmd = '1' else "0";	
	blk_mem_l : blk_mem4data_prov
	  PORT MAP (
	    clka => s_axi_clk,
	    ena => '1',
	    wea => wea,
	    addra => addra,
	    dina => pixel_discard,
	    clkb => clk_art_x1(i),
	    addrb => counter(7 downto 0),
	    doutb => mem_doutb(4*i+3 downto 4*i)
	  );

	s_axis_tvalid_art_cc_fifo_d1(i) <= s_axis_tvalid_art_cc_fifo(i) when rising_edge(clk_art_x1(i));
	s_axis_tlast_art_cc_fifo_d1(i) <= s_axis_tlast_art_cc_fifo(i) when rising_edge(clk_art_x1(i));     
	
end generate;  
	
	pixelmask0b_art0l <= not mem_doutb(0);
	pixelmask1b_art0l <= not mem_doutb(1);
	pixelmask0b_art0r <= not mem_doutb(2);
	pixelmask1b_art0r <= not mem_doutb(3);
	pixelmask0b_art1l <= not mem_doutb(4);
	pixelmask1b_art1l <= not mem_doutb(5);
	pixelmask0b_art1r <= not mem_doutb(6);
	pixelmask1b_art1r <= not mem_doutb(7);
	pixelmask0b_art2l <= not mem_doutb(8);
	pixelmask1b_art2l <= not mem_doutb(9);
	pixelmask0b_art2r <= not mem_doutb(10);
	pixelmask1b_art2r <= not mem_doutb(11);
	
	pixelmask1_art0l <= (others => pixelmask1b_art0l);
	pixelmask0_art0l <= (others => pixelmask0b_art0l);
	pixelmask1_art0r <= (others => pixelmask1b_art0r);
	pixelmask0_art0r <= (others => pixelmask0b_art0r);

	pixelmask1_art1l <= (others => pixelmask1b_art1l);
	pixelmask0_art1l <= (others => pixelmask0b_art1l);
	pixelmask1_art1r <= (others => pixelmask1b_art1r);
	pixelmask0_art1r <= (others => pixelmask0b_art1r);

	pixelmask1_art2l <= (others => pixelmask1b_art2l);
	pixelmask0_art2l <= (others => pixelmask0b_art2l);
	pixelmask1_art2r <= (others => pixelmask1b_art2r);
	pixelmask0_art2r <= (others => pixelmask0b_art2r);

	process(clk_art0_x1)
	begin
		if(rising_edge(clk_art0_x1)) then
			data_art0_ddr_d2_sw16 <=  (data_art0_ddr_d3(23 downto 16) and pixelmask1_art0l) & 
																(data_art0_ddr_d3(31 downto 24) and pixelmask0_art0l) & 
																(data_art0_ddr_d3(7 downto 0)   and pixelmask1_art0r) & 
																(data_art0_ddr_d3(15 downto 8)  and pixelmask0_art0r);
		end if;
	end process;
	
	process(clk_art1_x1)
	begin
		if(rising_edge(clk_art1_x1)) then
			data_art1_ddr_d2_sw16 <=  (data_art1_ddr_d3(23 downto 16) and pixelmask1_art1l) & 
																(data_art1_ddr_d3(31 downto 24) and pixelmask0_art1l) & 
																(data_art1_ddr_d3(7 downto 0)   and pixelmask1_art1r) & 
																(data_art1_ddr_d3(15 downto 8)  and pixelmask0_art1r);
		end if;
	end process;
	 
	process(clk_art2_x1)
	begin
		if(rising_edge(clk_art2_x1)) then
			data_art2_ddr_d2_sw16 <=  (data_art2_ddr_d3(23 downto 16) and pixelmask1_art2l) & 
																(data_art2_ddr_d3(31 downto 24) and pixelmask0_art2l) & 
																(data_art2_ddr_d3(7 downto 0)   and pixelmask1_art2r) & 
																(data_art2_ddr_d3(15 downto 8)  and pixelmask0_art2r);
		end if;
	end process;
	
	ADCV_calc_gen: for i in 0 to 2 generate
		signal cnt_tetrade_ec_00: std_logic_vector(4*8-1 downto 0) := (others => '0');
		signal cnt_tetrade_ec_01: std_logic_vector(4*8-1 downto 0) := (others => '0');
		signal cnt_tetrade_ec_02: std_logic_vector(4*8-1 downto 0) := (others => '0');
		signal sum_ec_00, sum_ec_01, sum_ec_02: std_logic_vector(7 downto 0) := (others => '0');
		signal datain: std_logic_vector(31 downto 0) := (others => '0');
		signal datain_cnt: std_logic_vector(7 downto 0) := (others => '0');
		signal ec_sig: std_logic_vector(2 downto 0) := "000";
	begin
		
		art0_select: if(i=0) generate
			datain <= data_art0_ddr_d2_sw16;
		end generate;

		art1_select: if(i=1) generate
			datain <= data_art1_ddr_d2_sw16;
		end generate;

		art2_select: if(i=2) generate
			datain <= data_art2_ddr_d2_sw16;
		end generate;

		ADCV_calc_cnt_process: process(clk_art_x1(i))
		begin
			if(rising_edge(clk_art_x1(i))) then
				if(s_axis_tvalid_art_cc_fifo_d1(i) = '0') then
					datain_cnt <= (others => '0');
				else
					datain_cnt <= datain_cnt + 1;
				end if;
			end if;
		end process;
		
		ADCV_calc_process: process(clk_art_x1(i))
		begin
			if(rising_edge(clk_art_x1(i))) then
				if(s_axis_tvalid_art_cc_fifo_d1(i) = '0') then
					cnt_tetrade_ec_00(4*8-1 downto 0) <= (others => '0');
					cnt_tetrade_ec_01(4*8-1 downto 0) <= (others => '0');
					cnt_tetrade_ec_02(4*8-1 downto 0) <= (others => '0');
				else
					for j in 0 to 3 loop
						if(datain(8*j+7 downto 8*j) > adcv_max_asic_cnts) then
							case datain_cnt(7 downto 6) is
								when "00" => cnt_tetrade_ec_00(8*j+7 downto 8*j) <= cnt_tetrade_ec_00(8*j+7 downto 8*j) + 1;
								when "01" => cnt_tetrade_ec_01(8*j+7 downto 8*j) <= cnt_tetrade_ec_00(8*j+7 downto 8*j) + 1;
								when "10" => cnt_tetrade_ec_02(8*j+7 downto 8*j) <= cnt_tetrade_ec_00(8*j+7 downto 8*j) + 1;
								when others => cnt_tetrade_ec_02(8*j+7 downto 8*j) <= cnt_tetrade_ec_02(8*j+7 downto 8*j);
							end case;
						end if;
					end loop;
				end if;				
			end if;
		end process;
		
		sum_process: process(clk_art_x1(i))
		begin	
			if(rising_edge(clk_art_x1(i))) then
				sum_ec_00 <= cnt_tetrade_ec_00(31 downto 24) + 
										 cnt_tetrade_ec_00(23 downto 16) +
										 cnt_tetrade_ec_00(15 downto 8) +
										 cnt_tetrade_ec_00(7 downto 0);
				sum_ec_01 <= cnt_tetrade_ec_01(31 downto 24) + 
										 cnt_tetrade_ec_01(23 downto 16) +
										 cnt_tetrade_ec_01(15 downto 8) +
										 cnt_tetrade_ec_01(7 downto 0);
				sum_ec_02 <= cnt_tetrade_ec_02(31 downto 24) + 
										 cnt_tetrade_ec_02(23 downto 16) +
										 cnt_tetrade_ec_02(15 downto 8) +
										 cnt_tetrade_ec_02(7 downto 0);
			end if;
		end process;
		
		cmp_process: process(clk_art_x1(i))
		begin	
			if(rising_edge(clk_art_x1(i))) then
				if(sum_ec_00 >= adcv_max_pixel_num) then ec_sig(0) <= '1'; else ec_sig(0) <= '0'; end if;
				if(sum_ec_01 >= adcv_max_pixel_num) then ec_sig(1) <= '1'; else ec_sig(1) <= '0'; end if;
				if(sum_ec_02 >= adcv_max_pixel_num) then ec_sig(2) <= '1'; else ec_sig(2) <= '0'; end if;
			end if;
		end process;
		
xpm_cdc_array_single_inst: xpm_cdc_array_single
		  generic map (
		    -- Common module generics
		    DEST_SYNC_FF   => 4, -- integer; range: 2-10
		    SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
		    SRC_INPUT_REG  => 0, -- integer; 0=do not register input, 1=register input
		    WIDTH          => 3  -- integer; range: 2-1024
		  )
		  port map (
		    src_clk  => '0',  -- optional; required when SRC_INPUT_REG = 1
		    src_in   => ec_sig,
		    dest_clk => m_axis_aclk,
		    dest_out => ec_sig_out(3*i+2 downto 3*i)
		  );		
	end generate;
	
	
	inst_art0l_cc_fifo : fifo_generator_0
		PORT MAP (
			m_aclk => m_axis_aclk,
			s_aclk => clk_art0_x1,
			s_aresetn => fifo_rst_n(0),
			s_axis_tvalid => s_axis_tvalid_art_cc_fifo_d1(0),
			s_axis_tready => open,
			s_axis_tdata => data_art0_ddr_d2_sw16(31 downto 16),--(15 downto 0),
			s_axis_tkeep => "00",
			s_axis_tlast => s_axis_tlast_art_cc_fifo_d1(0),
			m_axis_tvalid => m_axis_art0l_tvalid_i,
			m_axis_tready => all_ready,
			m_axis_tdata => m_axis_art0l_tdata_real,
			m_axis_tkeep => m_axis_art0l_tkeep,
			m_axis_tlast => m_axis_art0l_tlast,
			axis_prog_empty => axis_prog_empty_0l
		);
		

	inst_art0r_cc_fifo : fifo_generator_0
		PORT MAP (
			m_aclk => m_axis_aclk,
			s_aclk => clk_art0_x1,
			s_aresetn => fifo_rst_n(0),
			s_axis_tvalid => s_axis_tvalid_art_cc_fifo_d1(0),
			s_axis_tready => open,
			s_axis_tdata => data_art0_ddr_d2_sw16(15 downto 0),--(31 downto 16),
			s_axis_tkeep => "00",
			s_axis_tlast => s_axis_tlast_art_cc_fifo_d1(0),
			m_axis_tvalid => m_axis_art0r_tvalid_i,
			m_axis_tready => all_ready,
			m_axis_tdata => m_axis_art0r_tdata_real,
			m_axis_tkeep => m_axis_art0r_tkeep,
			m_axis_tlast => m_axis_art0r_tlast,
			axis_prog_empty => axis_prog_empty_0r
		);

	inst_art1l_cc_fifo : fifo_generator_0
		PORT MAP (
			m_aclk => m_axis_aclk,
			s_aclk => clk_art1_x1,
			s_aresetn => fifo_rst_n(1),
			s_axis_tvalid => s_axis_tvalid_art_cc_fifo_d1(1),
			s_axis_tready => open,
			s_axis_tdata => data_art1_ddr_d2_sw16(31 downto 16),--(15 downto 0),
			s_axis_tkeep => "00",
			s_axis_tlast => s_axis_tlast_art_cc_fifo_d1(1),
			m_axis_tvalid => m_axis_art1l_tvalid_i,
			m_axis_tready => all_ready,
			m_axis_tdata => m_axis_art1l_tdata_real,
			m_axis_tkeep => m_axis_art1l_tkeep,
			m_axis_tlast => m_axis_art1l_tlast,
			axis_prog_empty => axis_prog_empty_1l
		);

	inst_art1r_cc_fifo : fifo_generator_0
		PORT MAP (
			m_aclk => m_axis_aclk,
			s_aclk => clk_art1_x1,
			s_aresetn => fifo_rst_n(1),
			s_axis_tvalid => s_axis_tvalid_art_cc_fifo_d1(1),
			s_axis_tready => open,
			s_axis_tdata => data_art1_ddr_d2_sw16(15 downto 0),--(31 downto 16),
			s_axis_tkeep => "00",
			s_axis_tlast => s_axis_tlast_art_cc_fifo_d1(1),
			m_axis_tvalid => m_axis_art1r_tvalid_i,
			m_axis_tready => all_ready,
			m_axis_tdata => m_axis_art1r_tdata_real,
			m_axis_tkeep => m_axis_art1r_tkeep,
			m_axis_tlast => m_axis_art1r_tlast,
			axis_prog_empty => axis_prog_empty_1r
		);

	inst_art2l_cc_fifo : fifo_generator_0
		PORT MAP (
			m_aclk => m_axis_aclk,
			s_aclk => clk_art2_x1,
			s_aresetn => fifo_rst_n(2),
			s_axis_tvalid => s_axis_tvalid_art_cc_fifo_d1(2),
			s_axis_tready => open,
			s_axis_tdata => data_art2_ddr_d2_sw16(31 downto 16),--(15 downto 0),
			s_axis_tkeep => "00",
			s_axis_tlast => s_axis_tlast_art_cc_fifo_d1(2),
			m_axis_tvalid => m_axis_art2l_tvalid_i,
			m_axis_tready => all_ready,
			m_axis_tdata => m_axis_art2l_tdata_real,
			m_axis_tkeep => m_axis_art2l_tkeep,
			m_axis_tlast => m_axis_art2l_tlast,
			axis_prog_empty => axis_prog_empty_2l
		);

	inst_art2r_cc_fifo : fifo_generator_0 
		PORT MAP (
			m_aclk => m_axis_aclk,
			s_aclk => clk_art2_x1,
			s_aresetn => fifo_rst_n(2),
			s_axis_tvalid => s_axis_tvalid_art_cc_fifo_d1(2),
			s_axis_tready => open,
			s_axis_tdata => data_art2_ddr_d2_sw16(15 downto 0),--(31 downto 16),
			s_axis_tkeep => "00",
			s_axis_tlast => s_axis_tlast_art_cc_fifo_d1(2),
			m_axis_tvalid => m_axis_art2r_tvalid_i,
			m_axis_tready => all_ready,
			m_axis_tdata => m_axis_art2r_tdata_real,
			m_axis_tkeep => m_axis_art2r_tkeep,
			m_axis_tlast => m_axis_art2r_tlast,
			axis_prog_empty => axis_prog_empty_2r
		);

	is_pattern <= testmode(0);
	is_all_ones <= testmode(1);
	clr_pattern <= clr_reg(0);
	

	m_axis_art0l_tdata <= m_axis_art0l_tdata_real when is_pattern = '0' else m_axis_art0l_tdata_pattern;
	m_axis_art0r_tdata <= m_axis_art0r_tdata_real when is_pattern = '0' else m_axis_art0r_tdata_pattern;
	m_axis_art1l_tdata <= m_axis_art1l_tdata_real when is_pattern = '0' else m_axis_art1l_tdata_pattern;
	m_axis_art1r_tdata <= m_axis_art1r_tdata_real when is_pattern = '0' else m_axis_art1r_tdata_pattern;
	m_axis_art2l_tdata <= m_axis_art2l_tdata_real when is_pattern = '0' else m_axis_art2l_tdata_pattern;
	m_axis_art2r_tdata <= m_axis_art2r_tdata_real when is_pattern = '0' else m_axis_art2r_tdata_pattern;

	pattern_generator: process(m_axis_aclk)
	begin
		if(rising_edge(m_axis_aclk)) then
			if((all_ready = '1' and m_axis_art0l_tvalid_i = '1') or clr_pattern = '1') then
				if((pattern_step_cntr = pattern_trans_step-1) or clr_pattern = '1') then
					if((pattern_cntr = pattern_trans_max-1) or clr_pattern = '1') then
						m_axis_art0l_tdata_pattern <= pattern_initial_0r_01(15 downto 0);
						m_axis_art0r_tdata_pattern <= pattern_initial_0r_01(31 downto 16);
						m_axis_art1l_tdata_pattern <= pattern_initial_1r_1l(15 downto 0);
						m_axis_art1r_tdata_pattern <= pattern_initial_1r_1l(31 downto 16);
						m_axis_art2l_tdata_pattern <= pattern_initial_2r_21(15 downto 0);
						m_axis_art2r_tdata_pattern <= pattern_initial_2r_21(31 downto 16);
						pattern_cntr <= (others => '0');
					else
						--
						m_axis_art0l_tdata_pattern(7 downto 0) <= m_axis_art0l_tdata_pattern(7 downto 0) + 1;
						m_axis_art0r_tdata_pattern(7 downto 0) <= m_axis_art0r_tdata_pattern(7 downto 0) + 1;
						m_axis_art1l_tdata_pattern(7 downto 0) <= m_axis_art1l_tdata_pattern(7 downto 0) + 1;
						m_axis_art1r_tdata_pattern(7 downto 0) <= m_axis_art1r_tdata_pattern(7 downto 0) + 1;
						m_axis_art2l_tdata_pattern(7 downto 0) <= m_axis_art2l_tdata_pattern(7 downto 0) + 1;
						m_axis_art2r_tdata_pattern(7 downto 0) <= m_axis_art2r_tdata_pattern(7 downto 0) + 1;
						--
						m_axis_art0l_tdata_pattern(15 downto 8) <= m_axis_art0l_tdata_pattern(15 downto 8) + 1;
						m_axis_art0r_tdata_pattern(15 downto 8) <= m_axis_art0r_tdata_pattern(15 downto 8) + 1;
						m_axis_art1l_tdata_pattern(15 downto 8) <= m_axis_art1l_tdata_pattern(15 downto 8) + 1;
						m_axis_art1r_tdata_pattern(15 downto 8) <= m_axis_art1r_tdata_pattern(15 downto 8) + 1;
						m_axis_art2l_tdata_pattern(15 downto 8) <= m_axis_art2l_tdata_pattern(15 downto 8) + 1;
						m_axis_art2r_tdata_pattern(15 downto 8) <= m_axis_art2r_tdata_pattern(15 downto 8) + 1;
						pattern_cntr <= pattern_cntr + 1;
					end if;
					pattern_step_cntr <= (others => '0');
				else
					pattern_step_cntr <= pattern_step_cntr + 1; 
				end if;
			end if;
		end if;
	end process;
-------------------------------------------------vv--  <-- It's Ok
	m_axis_art0l_tvalid <= all_ready and m_axis_art0l_tvalid_i;
	m_axis_art0r_tvalid <= all_ready and m_axis_art0l_tvalid_i;
	m_axis_art1l_tvalid <= all_ready and m_axis_art0l_tvalid_i;
	m_axis_art1r_tvalid <= all_ready and m_axis_art0l_tvalid_i;
	m_axis_art2l_tvalid <= all_ready and m_axis_art0l_tvalid_i;
	m_axis_art2r_tvalid <= all_ready and m_axis_art0l_tvalid_i;
	
	atleast_one_empty <= (axis_prog_empty_0l or axis_prog_empty_0r or axis_prog_empty_1l or axis_prog_empty_1r or axis_prog_empty_2l or axis_prog_empty_2r) when rising_edge(m_axis_aclk); 
	
	dataout_synchronizer: process(m_axis_aclk)
		variable state : integer range 0 to 1 := 0;
		variable cnt : integer range 0 to 191 := 0;
	begin
		if(rising_edge(m_axis_aclk)) then 
			case state is
				when 0 => if(atleast_one_empty = '0') then
										state := state + 1;
									end if;
									all_ready <= '0';
				when 1 => if(counter_rd = conv_std_logic_vector(192-1, 9)) then	
										counter_rd <= (others => '0');
										state := 0;
									else
										counter_rd <= counter_rd + 1;
									end if;
									all_ready <= '1';
			end case;
		end if;
	end process;
	
	packet_size_verificator: process(m_axis_aclk)
	begin
		if(rising_edge(m_axis_aclk)) then
			--art0l
			if(m_axis_art0l_tvalid_i = '1' and all_ready = '1') then
				counter_tvalid_art0l <= counter_tvalid_art0l + 1;
			else
				counter_tvalid_art0l_latch <= counter_tvalid_art0l;
				counter_tvalid_art0l <= (others => '0');
			end if;
			--art0r
			if(m_axis_art0r_tvalid_i = '1' and all_ready = '1') then
				counter_tvalid_art0r <= counter_tvalid_art0r + 1;
			else
				counter_tvalid_art0r_latch <= counter_tvalid_art0r;
				counter_tvalid_art0r <= (others => '0');
			end if;

			--art1l
			if(m_axis_art1l_tvalid_i = '1' and all_ready = '1') then
				counter_tvalid_art1l <= counter_tvalid_art1l + 1;
			else
				counter_tvalid_art1l_latch <= counter_tvalid_art1l;
				counter_tvalid_art1l <= (others => '0');
			end if;
			--art0r
			if(m_axis_art1r_tvalid_i = '1' and all_ready = '1') then
				counter_tvalid_art1r <= counter_tvalid_art1r + 1;
			else
				counter_tvalid_art1r_latch <= counter_tvalid_art1r;
				counter_tvalid_art1r <= (others => '0');
			end if;

			--art2l
			if(m_axis_art2l_tvalid_i = '1' and all_ready = '1') then
				counter_tvalid_art2l <= counter_tvalid_art2l + 1;
			else
				counter_tvalid_art2l_latch <= counter_tvalid_art2l;
				counter_tvalid_art2l <= (others => '0');
			end if;
			--art0r
			if(m_axis_art2r_tvalid_i = '1' and all_ready = '1') then
				counter_tvalid_art2r <= counter_tvalid_art2r + 1;
			else
				counter_tvalid_art2r_latch <= counter_tvalid_art2r;
				counter_tvalid_art2r <= (others => '0');
			end if;
			
			counter_tvalid_all_latch <= 
				counter_tvalid_art0l_latch and
				counter_tvalid_art0r_latch and
				counter_tvalid_art1l_latch and
				counter_tvalid_art1r_latch and
				counter_tvalid_art2l_latch and
				counter_tvalid_art2r_latch;

		end if;
	end process;
	
end Behavioral;
