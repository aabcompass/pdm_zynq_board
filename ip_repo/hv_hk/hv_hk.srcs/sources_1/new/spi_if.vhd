library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity spi_if is
    generic (C_SPI_RATIO: integer := 5);
    Port ( 
    			 clk : in STD_LOGIC;
           --external pins
           sck : out STD_LOGIC := '1';
           mosi : out STD_LOGIC;
           miso : in STD_LOGIC;
           cs_exp : out STD_LOGIC := '1';
           cs_dac : out STD_LOGIC := '1';
           intr: in std_logic;
           -- control if
           start : in STD_LOGIC;
           exp_not_dac: in std_logic;
           ready : out std_logic := '0';
           datain : in STD_LOGIC_VECTOR (23 downto 0);
           datain2 : in STD_LOGIC_VECTOR (23 downto 0);
           datain3 : in STD_LOGIC_VECTOR (23 downto 0);
           dataout : out STD_LOGIC_VECTOR (7 downto 0)
           );
end spi_if;
 
architecture Behavioral of spi_if is

	attribute keep_hierarchy : string;
	attribute keep_hierarchy of Behavioral : architecture is "yes";

	signal cnt: std_logic_vector(C_SPI_RATIO downto 0) := (others => '0');
	signal cnt2: std_logic_vector(C_SPI_RATIO downto 0) := (others => '0');
	signal datain_sr: std_logic_vector(23 downto 0) := (others => '0');
	signal datain_dac_sr: std_logic_vector(24*3-1 downto 0) := (others => '0');
	signal dataout_sr: std_logic_vector(23 downto 0) := (others => '0');
	signal bit_cnt: std_logic_vector(4 downto 0) := (others => '0');
	signal bit_cnt2: std_logic_vector(6 downto 0) := (others => '0');
	signal sck_i: std_logic := '0';
	signal sck_dac_i: std_logic := '0';
	signal ready_exp: std_logic := '1';
	signal ready_dac: std_logic := '1';
	
	attribute keep : string;  
	attribute keep of cnt: signal is "true";  	
	attribute keep of datain_sr: signal is "true";  	
	attribute keep of dataout_sr: signal is "true";  	
	attribute keep of bit_cnt: signal is "true";  	
	attribute keep of sck_i: signal is "true";  	

begin

	sm_exps: process(clk)
		variable state : integer range 0 to 9 := 0;
	begin
		if(rising_edge(clk)) then
			case state is
				when 0 => if(start = '1' and exp_not_dac = '1') then state := state + 1; end if;
				when 1 => if(start = '0') then state := state + 1; end if;
				when 2 => sck_i <= '0';
									ready_exp <= '0';
									datain_sr <= datain;
									bit_cnt <= (others => '0'); 
									if(cnt(C_SPI_RATIO) = '1') then
										cnt <= (others => '0');
										state := state + 1;
									else
										cnt <= cnt + 1;
									end if;
				when 3 => 
									cs_exp <= '0';
									if(cnt(C_SPI_RATIO) = '1') then
										cnt <= (others => '0');
										state := state + 1;
									else
										cnt <= cnt + 1;
									end if;
				when 4 => sck_i <= not sck_i;	
									state := state + 1;				
				when 5 => if(cnt(C_SPI_RATIO) = '1') then
										cnt <= (others => '0');
										state := state + 1;
									else
										cnt <= cnt + 1;
									end if;
				when 6 => sck_i <= not sck_i;
									datain_sr(23 downto 1) <= datain_sr(22 downto 0);	
									dataout_sr(23 downto 1) <= dataout_sr(22 downto 0);	
									state := state + 1;
				when 7 => if(cnt(C_SPI_RATIO) = '1') then
										cnt <= (others => '0');
										state := state + 1;
									else
										cnt <= cnt + 1;
									end if;
				when 8 => if(bit_cnt = 23) then
										state := state + 1;
										sck_i <= '0';
									else
										state := state - 4;
										bit_cnt <= bit_cnt + 1;
									end if;
				when 9 => cs_exp <= '1';
									ready_exp <= '1';
									dataout <= dataout_sr(8 downto 1);
									state := 0;
			end case;
		end if;
	end process;

	sm_dacs: process(clk)
		variable state : integer range 0 to 9 := 0;
	begin
		if(rising_edge(clk)) then
			case state is
				when 0 => if(start = '1' and exp_not_dac = '0') then state := state + 1; end if;
				when 1 => if(start = '0') then state := state + 1; end if;
				when 2 => sck_dac_i <= '1';
									ready_dac <= '0';
									datain_dac_sr <= datain & datain2 & datain3;
									bit_cnt2 <= (others => '0'); 
									if(cnt2(C_SPI_RATIO) = '1') then
										cnt2 <= (others => '0');
										state := state + 1;
									else
										cnt2 <= cnt2 + 1;
									end if;
				when 3 => 
									cs_dac <= exp_not_dac;
									if(cnt2(C_SPI_RATIO) = '1') then
										cnt2 <= (others => '0');
										state := state + 1;
									else
										cnt2 <= cnt2 + 1;
									end if;
				when 4 => sck_dac_i <= not sck_dac_i;	
									state := state + 1;				
				when 5 => if(cnt2(C_SPI_RATIO) = '1') then
										cnt2 <= (others => '0');
										state := state + 1;
									else
										cnt2 <= cnt2 + 1;
									end if;
				when 6 => sck_dac_i <= not sck_dac_i;
									datain_dac_sr(71 downto 1) <= datain_dac_sr(70 downto 0);	
									if(bit_cnt2 = 71) then
										cs_dac <= '1';
									end if;
									state := state + 1;
				when 7 => if(cnt2(C_SPI_RATIO) = '1') then
										cnt2 <= (others => '0');
										state := state + 1;
									else
										cnt2 <= cnt2 + 1;
									end if;
				when 8 => if(bit_cnt2 = 71) then
										state := state + 1;
									--elsif(bit_cnt2 = 23) then	
									--	cs_dac <= '1';
									--	state := state - 4;
									--	bit_cnt2 <= bit_cnt2 + 1;
									else
										state := state - 4;
										bit_cnt2 <= bit_cnt2 + 1;
									end if;
				when 9 => cs_dac <= '1';
									ready_dac <= '1';
									state := 0;
			end case;
		end if;
	end process;


	ready <= ready_exp when exp_not_dac = '1' else ready_dac;
	sck <= sck_i when exp_not_dac = '1' else sck_dac_i;
	mosi <= datain_sr(23) when exp_not_dac = '1' else datain_dac_sr(71);
	dataout_sr(0) <= miso;

end Behavioral;
