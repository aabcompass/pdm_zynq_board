library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity data_provider_tb is
--  Port ( );
end data_provider_tb;

architecture Behavioral of data_provider_tb is

	component data_provider is
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
				start_sig_int: in std_logic;
				run_timestamp2_counter: in std_logic;
				reset_timestamp2_counter: in std_logic;
				timestamp2: out std_logic_vector(63 downto 0);
				alarm: out std_logic;
				clr_alarm: in std_logic;
				--testgen
				is_test_gen: in std_logic;
				test_duty1, test_duty2: in std_logic_vector(7 downto 0);
				testmode: in std_logic_vector(31 downto 0);
				-- params
				infinite : in std_logic;
				num_of_frames: in std_logic_vector(20 downto 0);
				-- stat
				axis_0l_rd_data_count: out std_logic_vector(15 downto 0);
				axis_0r_rd_data_count: out std_logic_vector(15 downto 0);
				axis_1l_rd_data_count: out std_logic_vector(15 downto 0);
				axis_1r_rd_data_count: out std_logic_vector(15 downto 0);
				axis_2l_rd_data_count: out std_logic_vector(15 downto 0);
				axis_2r_rd_data_count: out std_logic_vector(15 downto 0);
				
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
	end component; 

	signal clk_axi_counter: integer := 0;
	signal data_art: std_logic_vector(15 downto 0);
	signal cnt: std_logic_vector(9 downto 0) := "0000000000";
	signal frame_art: std_logic := '0';
	signal clk_art: std_logic := '0';
	signal start_sig: std_logic := '0';
	signal s_axi_clk: std_logic := '0';
	signal m_axis_aclk: std_logic := '0';
	signal infinite: std_logic := '0';

begin

	dut: data_provider 
			Port map( 
				-- 100 MHz clocks from external PLL/MMCM
				clk_art0_x1 => clk_art,--: in STD_LOGIC;
				clk_art1_x1 => clk_art,-- : in STD_LOGIC;
				clk_art2_x1 => clk_art, --: in STD_LOGIC;
				-- frame signals
				frame_art0 => frame_art,--:  in std_logic;
				frame_art1 => frame_art,--:  in std_logic;
				frame_art2 => frame_art,--:  in std_logic;
				-- data lines
				data_art0 => data_art,--: in std_logic_vector(15 downto 0);
				data_art1 => data_art,--: in std_logic_vector(15 downto 0);
				data_art2 => data_art,--: in std_logic_vector(15 downto 0);			
				-- control
				start_sig => start_sig,--: in std_logic;
				start_sig_int => '0',--: in std_logic;
				run_timestamp2_counter => '0',--: in std_logic;
				reset_timestamp2_counter => '0',--: in std_logic;
				timestamp2 => open,--: out std_logic_vector(63 downto 0);
				alarm => open,--: out std_logic;
				clr_alarm => '0',--: in std_logic;
				--testgen
				is_test_gen => '0',--: in std_logic;
				test_duty1 => (others => '0'),--, 
				test_duty2 => (others => '0'),--: in std_logic_vector(7 downto 0);
				testmode => (others => '0'),--: in std_logic_vector(31 downto 0);
				-- params
				infinite => infinite,--: in std_logic;
				num_of_frames => conv_std_logic_vector(10, 21),--: in std_logic_vector(20 downto 0);
				-- stat
				axis_0l_rd_data_count => open,--: out std_logic_vector(15 downto 0);
				axis_0r_rd_data_count => open,--: out std_logic_vector(15 downto 0);
				axis_1l_rd_data_count => open,--: out std_logic_vector(15 downto 0);
				axis_1r_rd_data_count => open,--: out std_logic_vector(15 downto 0);
				axis_2l_rd_data_count => open,--: out std_logic_vector(15 downto 0);
				axis_2r_rd_data_count => open,--: out std_logic_vector(15 downto 0);
				
				counter_tvalid_all_latch => open,--: out std_logic_vector(15 downto 0);
				-- -- data to trigger L1 and to memory buffer
				s_axi_clk => s_axi_clk,--: in std_logic;
				-- raw data to MPU
				m_axis_aclk => m_axis_aclk,--: in std_logic;
	--			m_axis_200MHz_aclk: in std_logic;
				
				m_axis_art0l_tdata => open,--: out std_logic_vector(15 downto 0);
				m_axis_art0l_tkeep => open,--: out std_logic_vector(1 downto 0);
				m_axis_art0l_tvalid => open,--: out std_logic;
				m_axis_art0l_tlast => open,--: out std_logic;
				m_axis_art0l_tready => '1',--: in std_logic;
				
				m_axis_art0r_tdata => open,--: out std_logic_vector(15 downto 0);
				m_axis_art0r_tkeep => open,--: out std_logic_vector(1 downto 0);
				m_axis_art0r_tvalid => open,--: out std_logic;
				m_axis_art0r_tlast => open,--: out std_logic;
				m_axis_art0r_tready => '1',--: in std_logic;
				
				m_axis_art1l_tdata => open,--: out std_logic_vector(15 downto 0);
				m_axis_art1l_tkeep => open,--: out std_logic_vector(1 downto 0);
				m_axis_art1l_tvalid => open,--: out std_logic;
				m_axis_art1l_tlast => open,--: out std_logic;
				m_axis_art1l_tready => '1',--: in std_logic;
				
				m_axis_art1r_tdata => open,--: out std_logic_vector(15 downto 0);
				m_axis_art1r_tkeep => open,--: out std_logic_vector(1 downto 0);
				m_axis_art1r_tvalid => open,--: out std_logic;
				m_axis_art1r_tlast => open,--: out std_logic;
				m_axis_art1r_tready => '1',--: in std_logic;
				
				m_axis_art2l_tdata => open,--: out std_logic_vector(15 downto 0);
				m_axis_art2l_tkeep => open,--: out std_logic_vector(1 downto 0);
				m_axis_art2l_tvalid => open,--: out std_logic;
				m_axis_art2l_tlast => open,--: out std_logic;
				m_axis_art2l_tready => '1',--: in std_logic;
				
				m_axis_art2r_tdata => open,--: out std_logic_vector(15 downto 0);
				m_axis_art2r_tkeep => open,--: out std_logic_vector(1 downto 0);
				m_axis_art2r_tvalid => open,--: out std_logic;
				m_axis_art2r_tlast => open,--: out std_logic;
				m_axis_art2r_tready => '1'--: in std_logic
			);
			
			process
			begin
				wait for 5 ns;
				clk_art <= '0';
				s_axi_clk <= '0';
				m_axis_aclk <= '0';
				wait for 5 ns;
				clk_art <= '1';
				s_axi_clk <= '1';
				m_axis_aclk <= '1';
			end process;
			
			data_art <= (others => '0');
			
			clk_axi_counter <= clk_axi_counter + 1 when rising_edge(s_axi_clk);
			
			main: process(s_axi_clk)
			begin
				if(rising_edge(s_axi_clk)) then
					if(clk_axi_counter = 100) then
						start_sig <= '1';
					end if;
					if(clk_axi_counter = 6000) then
						infinite <= '1';
					end if;
					if(clk_axi_counter = 16000) then
						infinite <= '0';
					end if;
				end if;			
			end process;
			
			
			frame_art_former: process(clk_art)
			begin
				if(rising_edge(clk_art)) then
					if(cnt = 383) then
						frame_art <= '0';
						cnt <= cnt + 1;
					elsif(cnt = 499) then
						frame_art <= '1';
						cnt <= (others => '0');
					else
						cnt <= cnt + 1;
					end if; 
				end if;
			end process;

end Behavioral;
