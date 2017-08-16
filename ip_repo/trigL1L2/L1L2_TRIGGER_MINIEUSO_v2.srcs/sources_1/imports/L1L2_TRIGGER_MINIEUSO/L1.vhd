----------------------------------------------------------------------------------
-- Company: INFN TORINO
-- Engineer: M.Mignone
-- Create Date:    14:11:24 06/2016 
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
	CLOCK			            :	in	std_logic;
	---------------------------MINIEUSO-------------------
	DATA			            :	in	std_logic_vector(15 downto 0);
	FRAME			            :	in	std_logic;
	------------------------------------------------------
	L1_EVENT                    :   out std_logic := '0';
	------------------------------------------------------
	--AXI4 Stream FIFO
	s_aresetn		            :	in	std_logic;
	m_aclk 			            :	in	std_logic;
	m_axis_tvalid 	            :	out	std_logic;
	m_axis_tready	            : 	in	std_logic;
    m_axis_tdata	            : 	out	std_logic_vector(31 downto 0);
    m_axis_tlast                :   out std_logic;
    --FIFO Dataoutput for L2
    rd_clk_l1                   :   in  std_logic;
    empty_sum_fifo_l1           :   out std_logic;
    rd_en_sum_fifo_l1           :   in  std_logic;
    dout_sum_fifo_l1            :   out std_logic_vector(239 downto 0)
	);
	
end L1;

architecture Behavioral of L1 is

    signal  ec0_event                   : std_logic := '0';
    
    --OUT_FIFO
    signal  s_axis_tvalid_fifo_out      : std_logic := '0';
    signal  s_axis_tready_fifo_out      : std_logic;
    signal  s_axis_tdata_fifo_out       : std_logic_vector(31 downto 0) := ( others => '0');
    signal  s_axis_tlast_fifo_out       : std_logic := '0';
    
    type    state_fifo_out_type        is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18);
    signal  state_fifo_out              : state_fifo_out_type := s0;
    
    signal	rd_en_sum_fifo_ec0	        : std_logic := '0';
    signal  empty_sum_fifo_ec0          : std_logic;
    signal  dout_sum_fifo_ec0           : std_logic_vector(239 downto 0);
    

    component EC0EC1EC2
    port (
	   CLOCK                   :	in	std_logic;
	   ---------------------------MINIEUSO-------------------
	   data_s                  :	in	std_logic_vector(15 downto 0);
	   frame_s                 :	in	std_logic;
	   ----------------------------------MINIEUSO-------------
	   ec_event                :   out std_logic;
	   empty_sum_fifo          :   out std_logic;
       rd_en_sum_fifo          :   in  std_logic;
       dout_sum_fifo           :   out std_logic_vector(239 downto 0);
       --Dataoutput for L2
       rd_clk                  :   in  std_logic;
       empty_sum_fifo_l1       :   out std_logic;
       rd_en_sum_fifo_l1       :   in  std_logic;
       dout_sum_fifo_l1        :   out std_logic_vector(239 downto 0)
	   );
    end component EC0EC1EC2;

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

	EC0_EC1_EC2 : EC0EC1EC2 
	port map(CLOCK=>CLOCK,
	   ------------------MINIEUSO
	   data_s               =>DATA,
	   frame_s              =>FRAME,
	   ec_event             => ec0_event,
       rd_en_sum_fifo       =>rd_en_sum_fifo_ec0,
       empty_sum_fifo       =>empty_sum_fifo_ec0,
       dout_sum_fifo        =>dout_sum_fifo_ec0,
       	--Dataoutput for L2
       rd_clk               => rd_clk_l1,
       empty_sum_fifo_l1    =>empty_sum_fifo_l1,
       rd_en_sum_fifo_l1    =>rd_en_sum_fifo_l1,
       dout_sum_fifo_l1     =>dout_sum_fifo_l1
	);
	
	AXI4_FIFO_OUT : FIFO_OUT
    PORT MAP (
        m_aclk => m_aclk,
        s_aclk => CLOCK,
        s_aresetn => s_aresetn,
        s_axis_tvalid => s_axis_tvalid_fifo_out,
        s_axis_tready => s_axis_tready_fifo_out,
        s_axis_tdata => s_axis_tdata_fifo_out,
        s_axis_tlast=> s_axis_tlast_fifo_out,
        m_axis_tvalid => m_axis_tvalid,
        m_axis_tready => m_axis_tready,
        m_axis_tdata => m_axis_tdata,
        m_axis_tlast=> m_axis_tlast
    );
    
    --WRITE 128GTU SUM ON FIFO_OUT (AXI4 FIFO)
    fifo128_out :    process (CLOCK)
    begin
        if (CLOCK'event and CLOCK = '1') then
            case (state_fifo_out) is
                when s0 =>
                    if (empty_sum_fifo_ec0 = '0') then--If the EC FIFO is not empty
                        rd_en_sum_fifo_ec0 <= '1';--Read the FIFO
                        state_fifo_out <= s1;
                    else
                        state_fifo_out <= s0;
                    end if;
                    s_axis_tvalid_fifo_out <= '0';
                    s_axis_tlast_fifo_out <= '0';
                when s1 =>
                    rd_en_sum_fifo_ec0 <= '0';--Read one FIFO word
                    state_fifo_out <= s2;
                when s2 =>
                    state_fifo_out <= s3;--FIFO Latency
                when s3 =>
                    s_axis_tdata_fifo_out <= "00" & dout_sum_fifo_ec0(29 downto 0);--pixel 0,16..15,31
                    state_fifo_out <= s4;
                when s4 =>
                    s_axis_tvalid_fifo_out <= '1';--Write pixel in AXI FIFO
                    state_fifo_out <= s5;
                when s5 =>
                    s_axis_tvalid_fifo_out <= '0';
                    s_axis_tdata_fifo_out <= "00" &dout_sum_fifo_ec0(59 downto 30);--pixel 32,48..47,63
                    state_fifo_out <= s6;
                when s6 =>
                    s_axis_tvalid_fifo_out <= '1';--Write pixel in AXI FIFO
                    state_fifo_out <= s7;
                when s7 =>
                    s_axis_tvalid_fifo_out <= '0';
                    s_axis_tdata_fifo_out <= "00" &dout_sum_fifo_ec0(89 downto 60);--pixel 64,80..79,95
                    state_fifo_out <= s8;
                when s8 =>
                    s_axis_tvalid_fifo_out <= '1';--Write pixel in AXI FIFO
                    state_fifo_out <= s9;
                when s9 =>
                    s_axis_tvalid_fifo_out <= '0';
                    s_axis_tdata_fifo_out <= "00" & dout_sum_fifo_ec0(119 downto 90);--pixel 96,112..111,127
                    state_fifo_out <= s10;
                when s10 =>
                    s_axis_tvalid_fifo_out <= '1';--Write pixel in AXI FIFO
                    state_fifo_out <= s11;
                when s11 =>
                    s_axis_tvalid_fifo_out <= '0';
                    s_axis_tdata_fifo_out <= "00" & dout_sum_fifo_ec0(149 downto 120);--pixel 128,144..143,159
                    state_fifo_out <= s12;
                when s12 =>
                    s_axis_tvalid_fifo_out <= '1';--Write pixel in AXI FIFO
                    state_fifo_out <= s13;
                when s13 =>
                    s_axis_tvalid_fifo_out <= '0';
                    s_axis_tdata_fifo_out <= "00" & dout_sum_fifo_ec0(179 downto 150);--pixel 160,176..175,191
                    state_fifo_out <= s14;
                when s14 =>
                    s_axis_tvalid_fifo_out <= '1';--Write pixel in AXI FIFO
                    state_fifo_out <= s15;
                when s15 =>
                    s_axis_tvalid_fifo_out <= '0';
                    s_axis_tdata_fifo_out <= "00" & dout_sum_fifo_ec0(209 downto 180);--pixel 192,208..207,223
                    state_fifo_out <= s16;
                when s16 =>
                    s_axis_tvalid_fifo_out <= '1';--Write pixel in AXI FIFO
                    state_fifo_out <= s17;
                when s17 =>
                    s_axis_tvalid_fifo_out <= '0';
                    s_axis_tdata_fifo_out <= "00" & dout_sum_fifo_ec0(239 downto 210);--pixel 224,240..239,255
                    state_fifo_out <= s18;
                when s18 =>
                    s_axis_tvalid_fifo_out <= '1';--Write pixel in AXI FIFO
                    if (empty_sum_fifo_ec0 = '1') then
                        s_axis_tlast_fifo_out <= '1';--Write LAST 2 pixel in AXI FIFO
                    end if;
                    state_fifo_out <= s0;
            end case;
        end if;
    end process;
	
    Event_L1 :	process (CLOCK)
    begin
        if (CLOCK'event and CLOCK = '1') then
            if (ec0_event = '1') then
                L1_event <= '1';
            else
                L1_event <= '0';
            end if;
        end if;
    end process;	
				
end Behavioral;