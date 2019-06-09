-- The basic of data provider artificial modes
---------------------------------------
-- 1. This mode of data provider allows to verify whether the mixture between EC-ASIC boards or not.
	--testmode => X"00000001",--: in std_logic_vector(31 downto 0);
	--pattern_initial_0r_01 => X"06060000",--: in std_logic_vector(31 downto 0);
	--pattern_initial_1r_1l => X"12120C0C",--: in std_logic_vector(31 downto 0);
	--pattern_initial_2r_21 => X"1E1E1818",--: in std_logic_vector(31 downto 0);
	--pattern_trans_step => conv_std_logic_vector(0, 32),--: in std_logic_vector(31 downto 0);
	--pattern_trans_max => conv_std_logic_vector(0, 32),--: in std_logic_vector(31 downto 0);

-- All pixels in each EC-ASIC boards will be the same

---------------------------------------
-- 2. This mode of data provider allows to verify whether the mixture between PMTs.
	--testmode => X"00000001",--: in std_logic_vector(31 downto 0);
	--pattern_initial_0r_01 => X"06060000",--: in std_logic_vector(31 downto 0);
	--pattern_initial_1r_1l => X"12120C0C",--: in std_logic_vector(31 downto 0);
	--pattern_initial_2r_21 => X"1E1E1818",--: in std_logic_vector(31 downto 0);
	--pattern_trans_step => conv_std_logic_vector(32, 32),--: in std_logic_vector(31 downto 0);
	--pattern_trans_max => conv_std_logic_vector(6, 32),--: in std_logic_vector(31 downto 0);

-- All pixels in each EC-ASIC boards will be the same

---------------------------------------
-- 3. This mode of data provider allows to verify whether the mixture between PDMs. 
--    Also it is possible to check the integrators
	--testmode => X"00000001",--: in std_logic_vector(31 downto 0);
	--pattern_initial_0r_01 => X"00000000",--: in std_logic_vector(31 downto 0);
	--pattern_initial_1r_1l => X"00000000",--: in std_logic_vector(31 downto 0);
	--pattern_initial_2r_21 => X"00000000",--: in std_logic_vector(31 downto 0);
	--pattern_trans_step => conv_std_logic_vector(32*6, 32),--: in std_logic_vector(31 downto 0);
	--pattern_trans_max => conv_std_logic_vector(128, 32),--: in std_logic_vector(31 downto 0);

---------------------------------------
-- 4. This mode of data provider allows to verify whether the mixture between single integrated data. 
--    Also it is possible to check the integrators
	--testmode => X"00000001",--: in std_logic_vector(31 downto 0);
	--pattern_initial_0r_01 => X"00000000",--: in std_logic_vector(31 downto 0);
	--pattern_initial_1r_1l => X"00000000",--: in std_logic_vector(31 downto 0);
	--pattern_initial_2r_21 => X"00000000",--: in std_logic_vector(31 downto 0);
	--pattern_trans_step => conv_std_logic_vector(128*32*6, 32),--: in std_logic_vector(31 downto 0);
	--pattern_trans_max => conv_std_logic_vector(128, 32),--: in std_logic_vector(31 downto 0);

---------------------------------------
-- 5. This mode of data provider allows to verify whether the mixture between double integrated data. 
--    Also it is possible to check the integrators
	--testmode => X"00000001",--: in std_logic_vector(31 downto 0);
	--pattern_initial_0r_01 => X"00000000",--: in std_logic_vector(31 downto 0);
	--pattern_initial_1r_1l => X"00000000",--: in std_logic_vector(31 downto 0);
	--pattern_initial_2r_21 => X"00000000",--: in std_logic_vector(31 downto 0);
	--pattern_trans_step => conv_std_logic_vector(128*128*32*6, 32),--: in std_logic_vector(31 downto 0);
	--pattern_trans_max => conv_std_logic_vector(128, 32),--: in std_logic_vector(31 downto 0);
---------------------------------------
-- 6. Debug
--testmode => X"00000001",--: in std_logic_vector(31 downto 0);
--pattern_initial_0r_01 => X"00000000",--: in std_logic_vector(31 downto 0);
--pattern_initial_1r_1l => X"00000000",--: in std_logic_vector(31 downto 0);
--pattern_initial_2r_21 => X"00000000",--: in std_logic_vector(31 downto 0);
--pattern_trans_step => conv_std_logic_vector(192, 32),--: in std_logic_vector(31 downto 0);
--pattern_trans_max => conv_std_logic_vector(0, 32),--: in std_logic_vector(31 downto 0);


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
    adcv_max_pixel_num: in std_logic_vector(9 downto 0); 
    grand_total_max: in std_logic_vector(23 downto 0); 
    ec_sig_out: out std_logic_vector(8 downto 0);
    art_overbright: out std_logic_vector(2 downto 0);
    art_total_out: out std_logic_vector(24*3-1 downto 0);
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
    m_axis_art2r_tready: in std_logic	);
	end component; 

	signal clk_axi_counter: integer := 0;
	signal data_art: std_logic_vector(15 downto 0) := X"0000";
	signal cnt: std_logic_vector(9 downto 0) := "0000000000";
	signal frame_art: std_logic := '0';
	signal frame_art_d1: std_logic := '0';
	signal clk_art: std_logic := '0';
	signal start_sig: std_logic := '0';
	signal s_axi_clk: std_logic := '0';
	signal m_axis_aclk: std_logic := '0';
	signal infinite: std_logic := '0';
	signal clr_reg: std_logic_vector(31 downto 0) := (others => '0');
	signal sum: std_logic_vector(23 downto 0) := (others => '0');

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
				
				clr_reg => clr_reg,---: in std_logic_vector(31 downto 0);
				
				testmode => X"00000001",--: in std_logic_vector(31 downto 0);
				pattern_initial_0r_01 => X"00000000",--: in std_logic_vector(31 downto 0);
				pattern_initial_1r_1l => X"00000000",--: in std_logic_vector(31 downto 0);
				pattern_initial_2r_21 => X"00000000",--: in std_logic_vector(31 downto 0);
				pattern_trans_step => conv_std_logic_vector(192, 32),--: in std_logic_vector(31 downto 0);
				pattern_trans_max => conv_std_logic_vector(0, 32),--: in std_logic_vector(31 downto 0);
				-- params
				infinite => infinite,--: in std_logic;
				num_of_frames => conv_std_logic_vector(10, 21),--: in std_logic_vector(20 downto 0);
				
				pixel_masking_reg => conv_std_logic_vector(0, 32),
				
				adcv_max_asic_cnts => conv_std_logic_vector(60, 8),
				adcv_max_pixel_num => conv_std_logic_vector(10, 10),
				grand_total_max => conv_std_logic_vector(10000, 24),
				
				ec_sig_out => open,
				art_overbright => open,
				art_total_out => open,
				
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
			
			
			clk_axi_counter <= clk_axi_counter + 1 when rising_edge(s_axi_clk);
			
			main: process(s_axi_clk)
			begin
				if(rising_edge(s_axi_clk)) then
					if(clk_axi_counter = 100) then
						start_sig <= '1';
						clr_reg(0) <= '1';
					end if;
					if(clk_axi_counter = 6000) then
						infinite <= '1';
						clr_reg(0) <= '0';
					end if;
					--if(clk_axi_counter = 16000) then
					--	infinite <= '0';
					--end if;
				end if;			
			end process;
			
			
			frame_art_former: process(clk_art)
			begin
				if(rising_edge(clk_art)) then
					if(cnt = 384/2-1) then
						frame_art <= '0';
						cnt <= cnt + 1;
					elsif(cnt = 500/2-1) then
						frame_art <= '1';
						cnt <= (others => '0');
					else
						cnt <= cnt + 1;
					end if; 
				end if;
			end process;
			
			frame_art_d1 <= frame_art when rising_edge(clk_art);
			
			data_art_proc: process(clk_art)
			begin
				if(rising_edge(clk_art)) then
					if(frame_art = '1' and frame_art_d1 = '0') then
						data_art(3 downto 0) <= data_art(3 downto 0) + 1;
						data_art(11 downto 8) <= data_art(11 downto 8) + 1;	
						--sum <= sum +  data_art(7 downto 0);
					--else
						--data_art <= X"0101";
					end if;
				end if;
			end process;
			

end Behavioral;
