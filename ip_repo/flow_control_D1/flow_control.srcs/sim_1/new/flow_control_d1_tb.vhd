------------------------------------------------------------------------------------
---- Company: 
---- Engineer: 
---- 
---- Create Date: 03/02/2018 04:42:58 PM
---- Design Name: 
---- Module Name: flow_control_d1_tb - Behavioral
---- Project Name: 
---- Target Devices: 
---- Tool Versions: 
---- Description: 
---- 
---- Dependencies: 
---- 
---- Revision:
---- Revision 0.01 - File Created
---- Additional Comments:
---- 
------------------------------------------------------------------------------------


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;

---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
----use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx leaf cells in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

--entity flow_control_d1_tb is
----  Port ( );
--end flow_control_d1_tb;

--architecture Behavioral of flow_control_d1_tb is

--	component flow_control_d1 is
--		generic (
--			C_AXIS_DWIDTH : integer := 64;
--			C_CNT_DWIDTH : integer := 32;
--			C_FREQ : integer := 100000000
--		);
--		Port ( 
--				-- in
--				s_axis_aclk : IN STD_LOGIC;
--				s_axis_aresetn : IN STD_LOGIC;
				
--				s_axis_tvalid : IN STD_LOGIC;
--				s_axis_tready : OUT STD_LOGIC;
--				s_axis_tdata : IN STD_LOGIC_VECTOR(C_AXIS_DWIDTH-1 DOWNTO 0);
--				s_axis_tlast : IN STD_LOGIC;
				
--				-- out
--				m_axis_tvalid : OUT STD_LOGIC;
--				m_axis_tready : IN STD_LOGIC;
--				m_axis_tdata : OUT STD_LOGIC_VECTOR(C_AXIS_DWIDTH-1 DOWNTO 0);
--				m_axis_tkeep : OUT STD_LOGIC_VECTOR(C_AXIS_DWIDTH/8-1 DOWNTO 0) := (others => '1');
--				m_axis_tlast : OUT STD_LOGIC := '0';
				
--				trig0 : in std_logic;
--				trig1 : in std_logic;
--				trig2 : in std_logic;
--				trig_4led: out std_logic;
--				trig_button: in std_logic;
				
--				trig_led: out std_logic := '0';
				
--				trig_ext_in: in std_logic;
--				trig_out: out std_logic;
				
--				gtu_sig: in std_logic;
--				--regs
--				flags: IN STD_LOGIC_VECTOR(31 downto 0); --0 
--				clr_flags: IN STD_LOGIC_VECTOR(31 downto 0); --1 
--				trig_delay: IN STD_LOGIC_VECTOR(C_CNT_DWIDTH-1 downto 0); --2
--				flags2: IN STD_LOGIC_VECTOR(31 downto 0);	     --3
--				fifo_thr: IN STD_LOGIC_VECTOR(15 downto 0); --4
--				int_trig_gtu_time: IN STD_LOGIC_VECTOR(31 downto 0);  --5
--				n_gtus_per_cycle: IN STD_LOGIC_VECTOR(31 downto 0);  --6 
--				periodic_trig_gtu_period: IN STD_LOGIC_VECTOR(31 downto 0);  --7 
--				num_of_gtus_after_trig: IN STD_LOGIC_VECTOR(15 downto 0);  --8
--				trig_flags2: IN STD_LOGIC_VECTOR(31 downto 0);  --9
--				unix_time_reg: IN STD_LOGIC_VECTOR(31 downto 0);  --10
				
--				status: OUT STD_LOGIC_VECTOR(31 downto 0);  --14
--				gtu_sig_counter: OUT STD_LOGIC_VECTOR(31 downto 0);  --15
--				unix_time: OUT STD_LOGIC_VECTOR(31 downto 0);  --17
--				trans_counter: OUT STD_LOGIC_VECTOR(C_CNT_DWIDTH-1 downto 0); --18
--				m_axis_fifo_error: OUT STD_LOGIC_VECTOR(31 downto 0); --19
--				gtu_timestamp: OUT STD_LOGIC_VECTOR(31 downto 0); --20
--				trig_type: OUT STD_LOGIC_VECTOR(3 downto 0); --21
--				unix_timestamp: OUT STD_LOGIC_VECTOR(31 downto 0); --22
--				maxis_trans_cnt: OUT STD_LOGIC_VECTOR(31 downto 0) --23
--		);
--	end component; 

--begin

--	dut: flow_control_d1 
--		Port map( 
--				-- in
--				s_axis_aclk => clk,--: IN STD_LOGIC;
--				s_axis_aresetn => aresetn,--: IN STD_LOGIC;
				
--				s_axis_tvalid => s_axis_tvalid,--: IN STD_LOGIC;
--				s_axis_tready => open,--: OUT STD_LOGIC;
--				s_axis_tdata => (others => '0'),--: IN STD_LOGIC_VECTOR(C_AXIS_DWIDTH-1 DOWNTO 0);
--				s_axis_tlast => '0',--: IN STD_LOGIC;
				
--				-- out
--				m_axis_tvalid => ,--: OUT STD_LOGIC;
--				m_axis_tready => ,--: IN STD_LOGIC;
--				m_axis_tdata => ,--: OUT STD_LOGIC_VECTOR(C_AXIS_DWIDTH-1 DOWNTO 0);
--				m_axis_tkeep => ,--: OUT STD_LOGIC_VECTOR(C_AXIS_DWIDTH/8-1 DOWNTO 0) := (others => '1');
--				m_axis_tlast => ,--: OUT STD_LOGIC := '0';
				
--				trig0 => ,--: in std_logic;
--				trig1 => ,--: in std_logic;
--				trig2 => ,--: in std_logic;
--				trig_4led => ,--: out std_logic;
--				trig_button => ,--: in std_logic;
				
--				trig_led => ,--: out std_logic := '0';
				
--				trig_ext_in => ,--: in std_logic;
--				trig_out => ,--: out std_logic;
				
--				gtu_sig => ,--: in std_logic;
--				--regs
--				flags => ,--: IN STD_LOGIC_VECTOR(31 downto 0); --0 
--				clr_flags => ,--: IN STD_LOGIC_VECTOR(31 downto 0); --1 
--				trig_delay => ,--: IN STD_LOGIC_VECTOR(C_CNT_DWIDTH-1 downto 0); --2
--				flags2 => ,--: IN STD_LOGIC_VECTOR(31 downto 0);	     --3
--				fifo_thr => ,--: IN STD_LOGIC_VECTOR(15 downto 0); --4
--				int_trig_gtu_time => ,--: IN STD_LOGIC_VECTOR(31 downto 0);  --5
--				n_gtus_per_cycle => ,--: IN STD_LOGIC_VECTOR(31 downto 0);  --6 
--				periodic_trig_gtu_period => ,--: IN STD_LOGIC_VECTOR(31 downto 0);  --7 
--				num_of_gtus_after_trig => ,--: IN STD_LOGIC_VECTOR(15 downto 0);  --8
--				trig_flags2 => ,--: IN STD_LOGIC_VECTOR(31 downto 0);  --9
--				unix_time_reg => ,--: IN STD_LOGIC_VECTOR(31 downto 0);  --10
				
--				status => ,--: OUT STD_LOGIC_VECTOR(31 downto 0);  --14
--				gtu_sig_counter => ,--: OUT STD_LOGIC_VECTOR(31 downto 0);  --15
--				unix_time => ,-- : OUT STD_LOGIC_VECTOR(31 downto 0);  --17
--				trans_counter => ,--: OUT STD_LOGIC_VECTOR(C_CNT_DWIDTH-1 downto 0); --18
--				m_axis_fifo_error => ,--: OUT STD_LOGIC_VECTOR(31 downto 0); --19
--				gtu_timestamp => ,--: OUT STD_LOGIC_VECTOR(31 downto 0); --20
--				trig_type => ,--: OUT STD_LOGIC_VECTOR(3 downto 0); --21
--				unix_timestamp => ,--: OUT STD_LOGIC_VECTOR(31 downto 0); --22
--				maxis_trans_cnt => ,--: OUT STD_LOGIC_VECTOR(31 downto 0) --23
--		);
--	end component; 
	

--end Behavioral;
