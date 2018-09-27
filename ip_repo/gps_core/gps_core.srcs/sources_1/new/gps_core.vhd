library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

Library xpm;
use xpm.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gps_core is
  Port ( 
  	clk: in std_logic;
  	s_axis_aresetn: in std_logic; 
  	--gps and pps to pins
  	i_RX_Serial: in std_logic;
  	pps_signal: in std_logic;
  	--gps to proc
  	m_axis_tvalid: out std_logic;
  	m_axis_tready: in std_logic;
  	m_axis_tdata: out std_logic_vector(7 downto 0);
  	m_axis_data_count: out std_logic_vector(31 downto 0);
  	--pps to proc
  	reset_pps_counter: in std_logic;
  	pps_count: out std_logic_vector(15 downto 0)  	
  );
end gps_core;

architecture Behavioral of gps_core is

	component UART_RX is
		generic (
			g_CLKS_PER_BIT : integer := 115     -- Needs to be set correctly
			);
		port (
			i_Clk       : in  std_logic;
			i_RX_Serial : in  std_logic;
			o_RX_DV     : out std_logic;
			o_RX_Byte   : out std_logic_vector(7 downto 0)
			);
	end component;

	signal o_RX_DV: std_logic := '0';
	signal pps_signal_sync: std_logic := '0';
	signal o_RX_Byte : std_logic_vector(7 downto 0) := (others => '0');
	signal pps_count_i : std_logic_vector(15 downto 0) := (others => '0');

	COMPONENT axis_data_fifo_4gps
		PORT (
			s_axis_aresetn : IN STD_LOGIC;
			s_axis_aclk : IN STD_LOGIC;
			s_axis_tvalid : IN STD_LOGIC;
			s_axis_tready : OUT STD_LOGIC;
			s_axis_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			m_axis_tvalid : OUT STD_LOGIC;
			m_axis_tready : IN STD_LOGIC;
			m_axis_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			axis_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			axis_wr_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			axis_rd_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;
	
	signal pps_signal_sync_d1: std_logic := '0';

begin

i_UART_RX : UART_RX 
  generic map(
    g_CLKS_PER_BIT => 10417-- 100000000/9600: integer := 115     -- Needs to be set correctly
    )
  port map(
    i_Clk  => clk,     --: in  std_logic;
    i_RX_Serial => i_RX_Serial,-- : in  std_logic;
    o_RX_DV  => o_RX_DV,   --: out std_logic;
    o_RX_Byte => o_RX_Byte  --: out std_logic_vector(7 downto 0)
    );

i_fifo_4gps : axis_data_fifo_4gps
  PORT MAP (
    s_axis_aresetn => s_axis_aresetn,
    s_axis_aclk => clk,
    s_axis_tvalid => o_RX_DV,
    s_axis_tready => open,
    s_axis_tdata => o_RX_Byte,
    m_axis_tvalid => m_axis_tvalid,
    m_axis_tready => m_axis_tready,
    m_axis_tdata => m_axis_tdata,
    axis_data_count => m_axis_data_count,
    axis_wr_data_count => open,
    axis_rd_data_count => open
  );

	pps_sync: xpm_cdc_single
  generic map (
     DEST_SYNC_FF   => 4, -- integer; range: 2-10
     SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
     SRC_INPUT_REG  => 0  -- integer; 0=do not register input, 1=register input
  )
  port map (
     src_clk  => '0',  -- optional; required when SRC_INPUT_REG = 1
     src_in   => pps_signal,
     dest_clk => clk,
     dest_out => pps_signal_sync
  );

	pps_counter: process
	begin
		if(rising_edge(clk)) then
			pps_signal_sync_d1 <= pps_signal_sync;
			if(reset_pps_counter = '1') then
				pps_count_i <= (others => '0');
			else
				if(pps_signal_sync = '1' and pps_signal_sync_d1 = '0') then
					pps_count_i <= pps_count_i + 1;
				end if;
			end if;
		end if;
	end process;
	
	pps_count <= pps_count_i;
	
end Behavioral;
