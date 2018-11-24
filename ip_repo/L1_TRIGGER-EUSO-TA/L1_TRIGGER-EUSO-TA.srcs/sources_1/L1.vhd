----------------------------------------------------------------------------------
-- Company: INFN TORINO
-- Engineer: M.Mignone
-- Create Date:    14:11:24 08/2018 
--
-- Algo_B MINIEUSO
--
-- Design Name: 
-- Module Name:    ALGO_B - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: L1 TRIGGER
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity L1 is port (
	CLOCK			                   :	in	std_logic;
	----------------------------------------------
	DATA_EC0EC1EC2                     :	in	std_logic_vector(15 downto 0);
	DATA_EC3EC4EC5                     :	in	std_logic_vector(15 downto 0);
	DATA_EC6EC7EC8                     :	in	std_logic_vector(15 downto 0);
	FRAME			                   :	in	std_logic;
	------------------------------------------------------
	--AXI4 Stream FIFO 128 GTU SUM EC0EC1EC2
	s_aresetn_EC0EC1EC2		           :	in	std_logic;
	m_aclk_EC0EC1EC2 			       :	in	std_logic;
	m_axis_tvalid_EC0EC1EC2 	       :	out	std_logic;
	m_axis_tready_EC0EC1EC2	           : 	in	std_logic;
    m_axis_tdata_EC0EC1EC2	           : 	out	std_logic_vector(31 downto 0);
    m_axis_tlast_EC0EC1EC2             :    out std_logic;
    --AXI4 Stream FIFO 128 GTU SUM EC3EC4EC5
    s_aresetn_EC3EC4EC5                 :   in  std_logic;
    m_aclk_EC3EC4EC5                    :   in  std_logic;
    m_axis_tvalid_EC3EC4EC5             :   out std_logic;
    m_axis_tready_EC3EC4EC5             :   in  std_logic;
    m_axis_tdata_EC3EC4EC5              :   out std_logic_vector(31 downto 0);
    m_axis_tlast_EC3EC4EC5              :   out std_logic;
    --AXI4 Stream FIFO 128 GTU SUM EC6EC7EC8
    s_aresetn_EC6EC7EC8                 :   in  std_logic;
    m_aclk_EC6EC7EC8                    :   in  std_logic;
    m_axis_tvalid_EC6EC7EC8             :   out std_logic;
    m_axis_tready_EC6EC7EC8             :   in  std_logic;
    m_axis_tdata_EC6EC7EC8              :   out std_logic_vector(31 downto 0);
    m_axis_tlast_EC6EC7EC8              :   out std_logic;
    --INPUT L1 COMMAND THRESHOLD
    THR_CMD                             :   IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    --AXI4 Stream FIFO EVENT
    s_aresetn_ev                        :  in  std_logic;
    m_aclk_ev                           :  in  std_logic;
    m_axis_tvalid_ev                    :  out std_logic;
    m_axis_tready_ev                    :  in  std_logic;
    m_axis_tdata_ev                     :  out std_logic_vector(31 downto 0);
    m_axis_tlast_ev                     :  out std_logic
	);
	
end L1;

architecture Behavioral of L1 is

    --OUT_FIFO
    signal  s_axis_tvalid_fifo_out_ec0ec1ec2      : std_logic := '0';
    signal  s_axis_tready_fifo_out_ec0ec1ec2      : std_logic;
    signal  s_axis_tdata_fifo_out_ec0ec1ec2       : std_logic_vector(31 downto 0) := ( others => '0');
    signal  s_axis_tlast_fifo_out_ec0ec1ec2       : std_logic := '0';
    
    signal  s_axis_tvalid_fifo_out_ec3ec4ec5      : std_logic := '0';
    signal  s_axis_tready_fifo_out_ec3ec4ec5      : std_logic;
    signal  s_axis_tdata_fifo_out_ec3ec4ec5       : std_logic_vector(31 downto 0) := ( others => '0');
    signal  s_axis_tlast_fifo_out_ec3ec4ec5       : std_logic := '0';
    
    signal  s_axis_tvalid_fifo_out_ec6ec7ec8      : std_logic := '0';
    signal  s_axis_tready_fifo_out_ec6ec7ec8      : std_logic;
    signal  s_axis_tdata_fifo_out_ec6ec7ec8       : std_logic_vector(31 downto 0) := ( others => '0');
    signal  s_axis_tlast_fifo_out_ec6ec7ec8       : std_logic := '0';
    
    type    state_fifo_out_type        is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18);
    signal  state_fifo_out              : state_fifo_out_type := s0;
    
    signal	rd_en_sum_fifo_ec0ec1ec2	: std_logic := '0';
    signal  empty_sum_fifo_ec0ec1ec2    : std_logic;
    signal  dout_sum_fifo_ec0ec1ec2     : std_logic_vector(239 downto 0);
    
    signal	rd_en_sum_fifo_ec3ec4ec5	: std_logic := '0';
    signal  empty_sum_fifo_ec3ec4ec5    : std_logic;
    signal  dout_sum_fifo_ec3ec4ec5     : std_logic_vector(239 downto 0);
    
    signal	rd_en_sum_fifo_ec6ec7ec8	: std_logic := '0';
    signal  empty_sum_fifo_ec6ec7ec8    : std_logic;
    signal  dout_sum_fifo_ec6ec7ec8     : std_logic_vector(239 downto 0);
    
    --OUT_FIFO EVENT
    signal  s_axis_tvalid_fifo_ev      : std_logic := '0';
    signal  s_axis_tready_fifo_ev      : std_logic;
    signal  s_axis_tdata_fifo_ev       : std_logic_vector(31 downto 0) := ( others => '0');
    signal  s_axis_tlast_fifo_ev       : std_logic := '0';
    
    signal  event_rdy_ec0ec1ec2        : std_logic;
    signal  event_data_ec0ec1ec2       : std_logic_vector(3 downto 0);
    
    signal  event_rdy_ec3ec4ec5        : std_logic;
    signal  event_data_ec3ec4ec5       : std_logic_vector(3 downto 0);
    
    signal  event_rdy_ec6ec7ec8        : std_logic;
    signal  event_data_ec6ec7ec8       : std_logic_vector(3 downto 0);
    
    type    state_fifo_ev_type         is (s0,s1,s2,s3,s4,s5,s6);
    signal  state_fifo_ev              : state_fifo_ev_type := s0;
    
    signal  thr_values_s               : std_logic_vector(33 downto 0) := "0000001010000001000000001110000110";--DEFAULT THR VALUES
    --(33 downto 24) EC_THR2=10 "0000001010"
    --(23 downto 15) EC_THR1=8   "000001000"
    --(14 downto 7)  PMT_THR2=7   "00000111"
    --(6 downto 0)   PMT_THR1=6    "0000110"
    
    type    state_gtu0_type            is (s0,s1);
    signal  state_gtu0                 : state_gtu0_type := s0;
    signal  gtu_counter                : std_logic_vector(6 downto 0) := ( others => '1');
    signal  gtu0_rdy                   : std_logic := '0';
    
    signal  ec_cnt_rdy_ec0ec1ec2        : std_logic := '0';
    signal  ec_cnt_ec0ec1ec2            : std_logic_vector(9 downto 0) := ( others => '0');
    
    signal  ec_cnt_rdy_ec3ec4ec5        : std_logic := '0';
    signal  ec_cnt_ec3ec4ec5            : std_logic_vector(9 downto 0) := ( others => '0');
    
    signal  ec_cnt_rdy_ec6ec7ec8        : std_logic := '0';
    signal  ec_cnt_ec6ec7ec8            : std_logic_vector(9 downto 0) := ( others => '0');
    
    signal  pdm_thr1                    : std_logic_vector(11 downto 0) := "000000010000";--DEFAULT PDM_THR1=16
    signal  pdm_thr2                    : std_logic_vector(12 downto 0) := "0000000010101";--DEFAULT PDM_THR2=21
        
    signal  ec_cnt_old                  : std_logic_vector(11 downto 0) := ( others => '0');
    signal  ec_cnt_new                  : std_logic_vector(11 downto 0) := ( others => '0');
    signal  ev_data_pdm                 : std_logic_vector(1 downto 0) := ( others => '0');
    
    signal  ev_data                     : std_logic_vector(13 downto 0) := ( others => '0');
    signal  pdm2_cnt                    : std_logic_vector(12 downto 0) := ( others => '0');

    component EC
    port (
	   CLOCK                   :	in	std_logic;
	   ---------------------------MINIEUSO-------------------
	   data_s                  :	in	std_logic_vector(15 downto 0);
	   frame_s                 :	in	std_logic;
	   ----------------------------------MINIEUSO-------------
	   empty_sum_fifo          :   out std_logic;
       rd_en_sum_fifo          :   in  std_logic;
       dout_sum_fifo           :   out std_logic_vector(239 downto 0);
       --------------------------------------------------------
       thr                     :   in  std_logic_vector(33 downto 0);
       event_rdy               :   out std_logic;
       event_data              :   out std_logic_vector(3 downto 0);
       -------------------------------------------------------------------
       ec_cnt_rdy              :   out std_logic;
       ec_cnt                  :   out std_logic_vector(9 downto 0) := ( others => '0')
	   );
    end component EC;

	--FIFO_OUT AXI4 STREAM
	COMPONENT FIFO_OUT
	PORT (
	    m_aclk          : IN STD_LOGIC;
        s_aclk          : IN STD_LOGIC;
        s_aresetn       : IN STD_LOGIC;
        s_axis_tvalid   : IN STD_LOGIC;
        s_axis_tready   : OUT STD_LOGIC;
        s_axis_tdata    : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        s_axis_tlast    : IN STD_LOGIC;
        m_axis_tvalid   : OUT STD_LOGIC;
        m_axis_tready   : IN STD_LOGIC;
        m_axis_tdata    : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        m_axis_tlast    : OUT STD_LOGIC
	   );
	END COMPONENT;

begin

	EC0_EC1_EC2 : EC 
	port map(CLOCK=>CLOCK,
	   ------------------EUSO-TA
	   data_s               =>DATA_EC0EC1EC2,
	   frame_s              =>FRAME,
       rd_en_sum_fifo       =>rd_en_sum_fifo_ec0ec1ec2,
       empty_sum_fifo       =>empty_sum_fifo_ec0ec1ec2,
       dout_sum_fifo        =>dout_sum_fifo_ec0ec1ec2,
       thr                  =>thr_values_s,
       event_rdy            =>event_rdy_ec0ec1ec2,
       event_data           =>event_data_ec0ec1ec2,
       ec_cnt_rdy           =>ec_cnt_rdy_ec0ec1ec2,
       ec_cnt               =>ec_cnt_ec0ec1ec2
	);
	
	EC3_EC4_EC5 : EC 
    port map(CLOCK=>CLOCK,
       ------------------EUSO-TA
       data_s               =>DATA_EC3EC4EC5,
       frame_s              =>FRAME,
       rd_en_sum_fifo       =>rd_en_sum_fifo_ec3ec4ec5,
       empty_sum_fifo       =>empty_sum_fifo_ec3ec4ec5,
       dout_sum_fifo        =>dout_sum_fifo_ec3ec4ec5,
       thr                  =>thr_values_s,
       event_rdy            =>event_rdy_ec3ec4ec5,
       event_data           =>event_data_ec3ec4ec5,
       ec_cnt_rdy           =>ec_cnt_rdy_ec3ec4ec5,
       ec_cnt               =>ec_cnt_ec3ec4ec5
    );
    
    EC6_EC7_EC8 : EC 
    port map(CLOCK=>CLOCK,
       ------------------EUSO-TA
       data_s               =>DATA_EC6EC7EC8,
       frame_s              =>FRAME,
       rd_en_sum_fifo       =>rd_en_sum_fifo_ec6ec7ec8,
       empty_sum_fifo       =>empty_sum_fifo_ec6ec7ec8,
       dout_sum_fifo        =>dout_sum_fifo_ec6ec7ec8,
       thr                  =>thr_values_s,
       event_rdy            =>event_rdy_ec6ec7ec8,
       event_data           =>event_data_ec6ec7ec8,
       ec_cnt_rdy           =>ec_cnt_rdy_ec6ec7ec8,
       ec_cnt               =>ec_cnt_ec6ec7ec8
    );
    
	--FIFO 128 SUM DATAOUT EC0EC1EC2
	AXI4_FIFO_OUT_EC0EC1EC2 : FIFO_OUT
    PORT MAP (
        m_aclk => m_aclk_ec0ec1ec2,
        s_aclk => CLOCK,
        s_aresetn => s_aresetn_ec0ec1ec2,
        s_axis_tvalid => s_axis_tvalid_fifo_out_ec0ec1ec2,
        s_axis_tready => s_axis_tready_fifo_out_ec0ec1ec2,
        s_axis_tdata => s_axis_tdata_fifo_out_ec0ec1ec2,
        s_axis_tlast=> s_axis_tlast_fifo_out_ec0ec1ec2,
        m_axis_tvalid => m_axis_tvalid_EC0EC1EC2,
        m_axis_tready => m_axis_tready_EC0EC1EC2,
        m_axis_tdata => m_axis_tdata_EC0EC1EC2,
        m_axis_tlast=> m_axis_tlast_EC0EC1EC2
    );
    
    --FIFO 128 SUM DATAOUT EC3EC4EC5
    AXI4_FIFO_OUT_EC3EC4EC5 : FIFO_OUT
    PORT MAP (
        m_aclk => m_aclk_ec3ec4ec5,
        s_aclk => CLOCK,
        s_aresetn => s_aresetn_ec3ec4ec5,
        s_axis_tvalid => s_axis_tvalid_fifo_out_ec3ec4ec5,
        s_axis_tready => s_axis_tready_fifo_out_ec3ec4ec5,
        s_axis_tdata => s_axis_tdata_fifo_out_ec3ec4ec5,
        s_axis_tlast=> s_axis_tlast_fifo_out_ec3ec4ec5,
        m_axis_tvalid => m_axis_tvalid_EC3EC4EC5,
        m_axis_tready => m_axis_tready_EC3EC4EC5,
        m_axis_tdata => m_axis_tdata_EC3EC4EC5,
        m_axis_tlast=> m_axis_tlast_EC3EC4EC5
    );
    
    --FIFO 128 SUM DATAOUT EC6EC7EC8
    AXI4_FIFO_OUT_EC6EC7EC8 : FIFO_OUT
    PORT MAP (
        m_aclk => m_aclk_ec6ec7ec8,
        s_aclk => CLOCK,
        s_aresetn => s_aresetn_ec6ec7ec8,
        s_axis_tvalid => s_axis_tvalid_fifo_out_ec6ec7ec8,
        s_axis_tready => s_axis_tready_fifo_out_ec6ec7ec8,
        s_axis_tdata => s_axis_tdata_fifo_out_ec6ec7ec8,
        s_axis_tlast=> s_axis_tlast_fifo_out_ec6ec7ec8,
        m_axis_tvalid => m_axis_tvalid_EC6EC7EC8,
        m_axis_tready => m_axis_tready_EC6EC7EC8,
        m_axis_tdata => m_axis_tdata_EC6EC7EC8,
        m_axis_tlast=> m_axis_tlast_EC6EC7EC8
    );
    
    --FIFO EVENT
    AXI4_FIFO_OUT_EVENT : FIFO_OUT
    PORT MAP (
        m_aclk => m_aclk_ev,
        s_aclk => CLOCK,
        s_aresetn => s_aresetn_ev,
        s_axis_tvalid => s_axis_tvalid_fifo_ev,
        s_axis_tready => s_axis_tready_fifo_ev,
        s_axis_tdata => s_axis_tdata_fifo_ev,
        s_axis_tlast=> s_axis_tlast_fifo_ev,
        m_axis_tvalid => m_axis_tvalid_ev,
        m_axis_tready => m_axis_tready_ev,
        m_axis_tdata => m_axis_tdata_ev,
        m_axis_tlast=> m_axis_tlast_ev
    );
    
    --WRITE 128GTU SUM ON FIFO_OUT (AXI4 FIFO)
    fifo128_out :    process (CLOCK)
    begin
        if (CLOCK'event and CLOCK = '1') then
            case (state_fifo_out) is
                when s0 =>
                    if (empty_sum_fifo_ec0ec1ec2 = '0') then--If the EC FIFO is not empty
                        rd_en_sum_fifo_ec0ec1ec2 <= '1';--Read the FIFO
                        rd_en_sum_fifo_ec3ec4ec5 <= '1';--Read the FIFO
                        rd_en_sum_fifo_ec6ec7ec8 <= '1';--Read the FIFO
                        
                        state_fifo_out <= s1;
                    else
                        state_fifo_out <= s0;
                    end if;
                    s_axis_tvalid_fifo_out_ec0ec1ec2 <= '0';
                    s_axis_tlast_fifo_out_ec0ec1ec2 <= '0';
                    
                    s_axis_tvalid_fifo_out_ec3ec4ec5 <= '0';
                    s_axis_tlast_fifo_out_ec3ec4ec5 <= '0';
                    
                    s_axis_tvalid_fifo_out_ec6ec7ec8 <= '0';
                    s_axis_tlast_fifo_out_ec6ec7ec8 <= '0';
                when s1 =>
                    rd_en_sum_fifo_ec0ec1ec2 <= '0';--Read one FIFO word
                    rd_en_sum_fifo_ec3ec4ec5 <= '0';--Read one FIFO word
                    rd_en_sum_fifo_ec6ec7ec8 <= '0';--Read one FIFO word
                    
                    state_fifo_out <= s2;
                when s2 =>
                    state_fifo_out <= s3;--FIFO Latency
                when s3 =>
                    s_axis_tdata_fifo_out_ec0ec1ec2 <= "00" & dout_sum_fifo_ec0ec1ec2(29 downto 0);--pixel 0,16..15,31
                    s_axis_tdata_fifo_out_ec3ec4ec5 <= "00" & dout_sum_fifo_ec3ec4ec5(29 downto 0);--pixel 0,16..15,31
                    s_axis_tdata_fifo_out_ec6ec7ec8 <= "00" & dout_sum_fifo_ec3ec4ec5(29 downto 0);--pixel 0,16..15,31
                    
                    state_fifo_out <= s4;
                when s4 =>
                    s_axis_tvalid_fifo_out_ec0ec1ec2 <= '1';--Write pixel in AXI FIFO
                    s_axis_tvalid_fifo_out_ec3ec4ec5 <= '1';--Write pixel in AXI FIFO
                    s_axis_tvalid_fifo_out_ec6ec7ec8 <= '1';--Write pixel in AXI FIFO
                    
                    state_fifo_out <= s5;
                when s5 =>
                    s_axis_tvalid_fifo_out_ec0ec1ec2 <= '0';
                    s_axis_tdata_fifo_out_ec0ec1ec2 <= "00" &dout_sum_fifo_ec0ec1ec2(59 downto 30);--pixel 32,48..47,63
                    
                    s_axis_tvalid_fifo_out_ec3ec4ec5 <= '0';
                    s_axis_tdata_fifo_out_ec3ec4ec5 <= "00" &dout_sum_fifo_ec3ec4ec5(59 downto 30);--pixel 32,48..47,63
                    
                    s_axis_tvalid_fifo_out_ec6ec7ec8 <= '0';
                    s_axis_tdata_fifo_out_ec6ec7ec8 <= "00" &dout_sum_fifo_ec6ec7ec8(59 downto 30);--pixel 32,48..47,63
                    
                    state_fifo_out <= s6;
                when s6 =>
                    s_axis_tvalid_fifo_out_ec0ec1ec2 <= '1';--Write pixel in AXI FIFO
                    s_axis_tvalid_fifo_out_ec3ec4ec5 <= '1';--Write pixel in AXI FIFO
                    s_axis_tvalid_fifo_out_ec6ec7ec8 <= '1';--Write pixel in AXI FIFO
                    
                    state_fifo_out <= s7;
                when s7 =>
                    s_axis_tvalid_fifo_out_ec0ec1ec2 <= '0';
                    s_axis_tdata_fifo_out_ec0ec1ec2 <= "00" &dout_sum_fifo_ec0ec1ec2(89 downto 60);--pixel 64,80..79,95
                    
                    s_axis_tvalid_fifo_out_ec3ec4ec5 <= '0';
                    s_axis_tdata_fifo_out_ec3ec4ec5 <= "00" &dout_sum_fifo_ec3ec4ec5(89 downto 60);--pixel 64,80..79,95
                    
                    s_axis_tvalid_fifo_out_ec6ec7ec8 <= '0';
                    s_axis_tdata_fifo_out_ec6ec7ec8 <= "00" &dout_sum_fifo_ec6ec7ec8(89 downto 60);--pixel 64,80..79,95
                    
                    state_fifo_out <= s8;
                when s8 =>
                    s_axis_tvalid_fifo_out_ec0ec1ec2 <= '1';--Write pixel in AXI FIFO
                    s_axis_tvalid_fifo_out_ec3ec4ec5 <= '1';--Write pixel in AXI FIFO
                    s_axis_tvalid_fifo_out_ec6ec7ec8 <= '1';--Write pixel in AXI FIFO
                    
                    state_fifo_out <= s9;
                when s9 =>
                    s_axis_tvalid_fifo_out_ec0ec1ec2 <= '0';
                    s_axis_tdata_fifo_out_ec0ec1ec2 <= "00" & dout_sum_fifo_ec0ec1ec2(119 downto 90);--pixel 96,112..111,127
                    
                    s_axis_tvalid_fifo_out_ec3ec4ec5 <= '0';
                    s_axis_tdata_fifo_out_ec3ec4ec5 <= "00" & dout_sum_fifo_ec3ec4ec5(119 downto 90);--pixel 96,112..111,127
                    
                    s_axis_tvalid_fifo_out_ec6ec7ec8 <= '0';
                    s_axis_tdata_fifo_out_ec6ec7ec8 <= "00" & dout_sum_fifo_ec6ec7ec8(119 downto 90);--pixel 96,112..111,127
                                        
                    state_fifo_out <= s10;
                when s10 =>
                    s_axis_tvalid_fifo_out_ec0ec1ec2 <= '1';--Write pixel in AXI FIFO
                    s_axis_tvalid_fifo_out_ec3ec4ec5 <= '1';--Write pixel in AXI FIFO
                    s_axis_tvalid_fifo_out_ec6ec7ec8 <= '1';--Write pixel in AXI FIFO
                    
                    state_fifo_out <= s11;
                when s11 =>
                    s_axis_tvalid_fifo_out_ec0ec1ec2 <= '0';
                    s_axis_tdata_fifo_out_ec0ec1ec2 <= "00" & dout_sum_fifo_ec0ec1ec2(149 downto 120);--pixel 128,144..143,159
                    
                    s_axis_tvalid_fifo_out_ec3ec4ec5 <= '0';
                    s_axis_tdata_fifo_out_ec3ec4ec5 <= "00" & dout_sum_fifo_ec3ec4ec5(149 downto 120);--pixel 128,144..143,159
                    
                    s_axis_tvalid_fifo_out_ec6ec7ec8 <= '0';
                    s_axis_tdata_fifo_out_ec6ec7ec8 <= "00" & dout_sum_fifo_ec6ec7ec8(149 downto 120);--pixel 128,144..143,159
                    
                    state_fifo_out <= s12;
                when s12 =>
                    s_axis_tvalid_fifo_out_ec0ec1ec2 <= '1';--Write pixel in AXI FIFO
                    s_axis_tvalid_fifo_out_ec3ec4ec5 <= '1';--Write pixel in AXI FIFO
                    s_axis_tvalid_fifo_out_ec6ec7ec8 <= '1';--Write pixel in AXI FIFO
                    
                    state_fifo_out <= s13;
                when s13 =>
                    s_axis_tvalid_fifo_out_ec0ec1ec2 <= '0';
                    s_axis_tdata_fifo_out_ec0ec1ec2 <= "00" & dout_sum_fifo_ec0ec1ec2(179 downto 150);--pixel 160,176..175,191
                    
                    s_axis_tvalid_fifo_out_ec3ec4ec5 <= '0';
                    s_axis_tdata_fifo_out_ec3ec4ec5 <= "00" & dout_sum_fifo_ec3ec4ec5(179 downto 150);--pixel 160,176..175,191
                    
                    s_axis_tvalid_fifo_out_ec6ec7ec8 <= '0';
                    s_axis_tdata_fifo_out_ec6ec7ec8 <= "00" & dout_sum_fifo_ec6ec7ec8(179 downto 150);--pixel 160,176..175,191
                    
                    state_fifo_out <= s14;
                when s14 =>
                    s_axis_tvalid_fifo_out_ec0ec1ec2 <= '1';--Write pixel in AXI FIFO
                    s_axis_tvalid_fifo_out_ec3ec4ec5 <= '1';--Write pixel in AXI FIFO
                    s_axis_tvalid_fifo_out_ec6ec7ec8 <= '1';--Write pixel in AXI FIFO
                    
                    state_fifo_out <= s15;
                when s15 =>
                    s_axis_tvalid_fifo_out_ec0ec1ec2 <= '0';
                    s_axis_tdata_fifo_out_ec0ec1ec2 <= "00" & dout_sum_fifo_ec0ec1ec2(209 downto 180);--pixel 192,208..207,223
                    
                    s_axis_tvalid_fifo_out_ec3ec4ec5 <= '0';
                    s_axis_tdata_fifo_out_ec3ec4ec5 <= "00" & dout_sum_fifo_ec3ec4ec5(209 downto 180);--pixel 192,208..207,223
                    
                    s_axis_tvalid_fifo_out_ec6ec7ec8 <= '0';
                    s_axis_tdata_fifo_out_ec6ec7ec8 <= "00" & dout_sum_fifo_ec6ec7ec8(209 downto 180);--pixel 192,208..207,223
                    
                    state_fifo_out <= s16;
                when s16 =>
                    s_axis_tvalid_fifo_out_ec0ec1ec2 <= '1';--Write pixel in AXI FIFO
                    s_axis_tvalid_fifo_out_ec3ec4ec5 <= '1';--Write pixel in AXI FIFO
                    s_axis_tvalid_fifo_out_ec6ec7ec8 <= '1';--Write pixel in AXI FIFO
                    
                    state_fifo_out <= s17;
                when s17 =>
                    s_axis_tvalid_fifo_out_ec0ec1ec2 <= '0';
                    s_axis_tdata_fifo_out_ec0ec1ec2 <= "00" & dout_sum_fifo_ec0ec1ec2(239 downto 210);--pixel 224,240..239,255
                    
                    s_axis_tvalid_fifo_out_ec3ec4ec5 <= '0';
                    s_axis_tdata_fifo_out_ec3ec4ec5 <= "00" & dout_sum_fifo_ec3ec4ec5(239 downto 210);--pixel 224,240..239,255
                    
                    s_axis_tvalid_fifo_out_ec6ec7ec8 <= '0';
                    s_axis_tdata_fifo_out_ec6ec7ec8 <= "00" & dout_sum_fifo_ec6ec7ec8(239 downto 210);--pixel 224,240..239,255
                    
                    state_fifo_out <= s18;
                when s18 =>
                    s_axis_tvalid_fifo_out_ec0ec1ec2 <= '1';--Write pixel in AXI FIFO
                    s_axis_tvalid_fifo_out_ec3ec4ec5 <= '1';--Write pixel in AXI FIFO
                    s_axis_tvalid_fifo_out_ec6ec7ec8 <= '1';--Write pixel in AXI FIFO
                    
                    if (empty_sum_fifo_ec0ec1ec2 = '1') then
                        s_axis_tlast_fifo_out_ec0ec1ec2 <= '1';--Write LAST 2 pixel in AXI FIFO
                        s_axis_tlast_fifo_out_ec3ec4ec5 <= '1';--Write LAST 2 pixel in AXI FIFO
                        s_axis_tlast_fifo_out_ec6ec7ec8 <= '1';--Write LAST 2 pixel in AXI FIFO
                    end if;
                    state_fifo_out <= s0;
            end case;
        end if;
    end process;
    
    THR_check : process (CLOCK)--Check if new THR values are present
    begin
        if (CLOCK'event and CLOCK = '1') then
            if (FRAME = '0') then --Before GTU start
                case ( THR_CMD(31 downto 30)) is--Check cmd threshold type
                    when "00" =>--cmd group 0
                        thr_values_s(23 downto 0) <= THR_CMD(23 downto 0);--Read the FIFO THR values
                    when "01" =>--cmd group 1
                        thr_values_s(33 downto 24) <= THR_CMD(9 downto 0);--Read the FIFO THR values
                        pdm_thr1 <= THR_CMD(21 downto 10);
                    when "10" =>--cmd group 2
                        pdm_thr2 <= THR_CMD(12 downto 0); --Read the FIFO THR values
                    when others =>
                        null;
                end case;
            end if;
        end if;
    end process;
    
    GTU0:process (CLOCK)--128 GTU Counter (Find GTU0)
        begin
           if (CLOCK'event and CLOCK = '1') then
               case (state_gtu0) is
                   when s0 =>
                       if (frame = '1') then
                            if (gtu_counter = "1111111") then --GTU 128
                                gtu_counter <= "0000000";
                            else
                                gtu_counter <= gtu_counter + 1;-- GTU counter
                            end if;
                            if (gtu_counter = "0000000") then
                                gtu0_rdy <= '1';
                            end if;
                            state_gtu0 <= s1;
                       end if;
                   when s1 =>
                       if (frame = '0') then
                           state_gtu0 <= s0;
                       end if;
                       gtu0_rdy <= '0';
               end case;
           end if;
        end process;
    
    EVENT_DATA : process (CLOCK)--Write EVENT in FIFO OUT
    begin
        if (CLOCK'event and CLOCK = '1') then
            case (state_fifo_ev) is
                when s0 =>
                    if (ec_cnt_rdy_ec0ec1ec2 = '1') then
                        ec_cnt_new <= ("00" & ec_cnt_ec0ec1ec2) + ("00" & ec_cnt_ec3ec4ec5) + ("00" & ec_cnt_ec6ec7ec8);--Read the number of EC > EC_THR1 (New Value) for EC0EC1EC2,EC3EC4EC6,EC6EC7EC8
                        state_fifo_ev <= s1;
                    else
                        state_fifo_ev <= s0;
                        s_axis_tvalid_fifo_ev <= '0';
                        ev_data <= "00000000000000";
                    end if;
                    if (gtu0_rdy = '1') then--GTU0
                        s_axis_tdata_fifo_ev <= "00000000000000000000000000000000";
                        state_fifo_ev <= s6;--Write in AXI FIFO EVENT the start of 128GTU block
                    end if;
                when s1 =>
                    if (event_rdy_ec0ec1ec2 = '1') then--PMT-EC EVENT in EC0,EC1,EC2
                          ev_data(3 downto 0) <= event_data_ec0ec1ec2;
                    end if;
                    if (event_rdy_ec3ec4ec5 = '1') then--PMT-EC EVENT in EC3,EC4,EC5
                          ev_data(7 downto 4) <= event_data_ec3ec4ec5;
                    end if;
                    if (event_rdy_ec6ec7ec8 = '1') then--PMT-EC EVENT in EC6,EC7,EC8
                          ev_data(11 downto 8) <= event_data_ec6ec7ec8;
                    end if;
                    
                    state_fifo_ev <= s2;
                when s2 =>
                    if ( ec_cnt_new > pdm_thr1 ) then --Number of EC in PDM > PDM_THR1
                        ev_data_pdm(0) <= '1';--PDM event
                    end if;
                    ec_cnt_old <= ec_cnt_new;--Storage the new value
                    
                    pdm2_cnt <= ("0" & ec_cnt_old) + ("0" & ec_cnt_new);
                    state_fifo_ev <= s3;
                when s3 =>
                    if (pdm2_cnt > pdm_thr2) then --Number of EC in 2PDM (accross 2GTU) > PDM_THR2
                        ev_data_pdm(1) <= '1';--PDM event EC0,EC1,EC2 over 2GTU
                    end if;
                    state_fifo_ev <= s4;
                when s4 =>
                    ev_data(13 downto 12) <= ev_data_pdm; --PDM-PDM2 events
                    state_fifo_ev <= s5; 
                when s5 =>
                    if (ev_data > 0) then--EVENT,write in FIFO
                        s_axis_tdata_fifo_ev <= "00000000000" & ev_data & gtu_counter;
                        state_fifo_ev <= s6;--Write in AXI FIFO
                        ev_data_pdm <= "00";
                    else
                        state_fifo_ev <= s0;
                    end if;
                when s6 =>
                    s_axis_tvalid_fifo_ev <= '1';--Write in AXI FIFO
                    state_fifo_ev <= s0;
            end case;
        end if;              
    end process;
                
end Behavioral;