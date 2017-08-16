library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

--library UNISIM;
--use UNISIM.VComponents.all;

entity pixel_addr_tb is
--  Port ( );
end pixel_addr_tb;

architecture Behavioral of pixel_addr_tb is

	component pixel_adder_32bit
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           datain : in STD_LOGIC_VECTOR (31 downto 0); -- input data from artix
           datain_dv : in STD_LOGIC;                   -- frame signal
           dataout : out STD_LOGIC_VECTOR (15 downto 0); -- data from fifo
           dataout_dv : out STD_LOGIC;
           accumulation : in STD_LOGIC_VECTOR (15 downto 0)); -- number of gtu frames to be integrated
	end component;
	
	constant period : time := 10 ns;
	signal cnt: integer := 0;
	signal dv : std_logic := '0';
	signal clk : std_logic := '0';
	signal reset : std_logic := '0';
	signal data : std_logic_vector(15 downto 0) := (others => '0');
	signal datain : std_logic_vector(31 downto 0) := (others => '0');

begin

	clk_gen: process
	begin
		clk <= '0';
		wait for period/2;
		clk <= '1';
		wait for period/2;
	end process;

	data_gen: process(clk)
	begin
		if(rising_edge(clk)) then
			if(dv = '1') then
				data <= data + 2;
			else
				data <= (others => '0');
			end if;
		end if;
	end process;

	dv_gen: process(clk)
		variable state : integer range 0 to 1 := 0;
	begin
		if(rising_edge(clk)) then
			case state is
				when 0 => if(cnt = 58) then
										state := 1;
										cnt <= 1;
									else
										cnt <= cnt + 1;
									end if;
									dv <= '0';
				when 1 => if(cnt = 192) then
										state := 0;
										cnt <= 1;
									else
										cnt <= cnt + 1;
									end if;
									dv <= '1';
			end case;
		end if;
	end process;
	
	reset_gen: process(clk)
		variable v: integer := 0;
	begin
		if(rising_edge(clk)) then
			if(v = 10) then
				reset <= '0';
			else
				reset <= '1';
				v := v + 1;
			end if;
		end if;
	end process;
	
	
	datain <= data & (data + 1);
	
	dut:  pixel_adder_32bit
    Port map( clk => clk,--: in STD_LOGIC;
           reset => reset,--: in STD_LOGIC;
           datain => datain, --: in STD_LOGIC_VECTOR (31 downto 0); -- input data from artix
           datain_dv => dv,--: in STD_LOGIC;                   -- frame signal
           dataout => open,--: out STD_LOGIC_VECTOR (15 downto 0); -- data from fifo
           dataout_dv => open,--: out STD_LOGIC;
           accumulation => conv_std_logic_vector(7, 16)); --: in STD_LOGIC_VECTOR (15 downto 0)); -- number of gtu frames to be integrated 
	
end Behavioral;
