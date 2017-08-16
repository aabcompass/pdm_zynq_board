library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

library UNISIM;
use UNISIM.VComponents.all;


entity tb_format_converter is
end tb_format_converter;

architecture Behavioral of tb_format_converter is

	component format_converter
    Port ( clk : in STD_LOGIC;
           datain : in STD_LOGIC_VECTOR (7 downto 0);
           dataout : out STD_LOGIC_VECTOR (7 downto 0);
           frame_in : in STD_LOGIC;
           frame_out : out STD_LOGIC);
	end component;

	signal clk: std_logic := '1';
	
	signal datain: std_logic_vector(7 downto 0) := (others => '0');
	signal counter: std_logic_vector(8 downto 0) := (others => '0');
	signal frame_in: std_logic := '0';
	
	constant clk_period: time := 5 ns;

begin

	clk_gen: process
	begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
	end process;
	
	datain <= datain + 1 when rising_edge(clk);
	
	framein_former: process(clk)
		variable state : integer range 0 to 1 := 0;	
	begin
		if(rising_edge(clk)) then
			case state is
				when 0 => if(counter = 116-1) then
										state := 1;
										counter <= (others => '0');
									else
										counter <= counter + 1;
									end if;
									frame_in <= '0';
				when 1 => if(counter = 384-1) then
										state := 0;
										counter <= (others => '0');
									else
										counter <= counter + 1;
									end if;
									frame_in <= '1';
			end case;
		end if;
	end process;

	dut: format_converter port map (clk, datain, open, frame_in, open);
	
	

end Behavioral;
