library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

library UNISIM;
use UNISIM.VComponents.all;


entity format_converter is
    Port ( clk : in STD_LOGIC;
           datain : in STD_LOGIC_VECTOR (7 downto 0);
           dataout : out STD_LOGIC_VECTOR (7 downto 0);
           frame_in : in STD_LOGIC;
           frame_out : out STD_LOGIC);
end format_converter;

architecture Behavioral of format_converter is

	signal counter : std_logic_vector(2 downto 0) := "000";
	signal datain_swapped : std_logic_vector(7 downto 0) := (others => '0');
	signal fifo_en : std_logic_vector(7 downto 0) := (others => '0');
	signal valid : std_logic_vector(7 downto 0) := (others => '0');
	
	signal frame_in_d1: std_logic := '0';
	signal frame_in_d2: std_logic := '0';
	signal frame_in_d3: std_logic := '0';
	signal frame_in_d4: std_logic := '0';
	signal frame_in_d5: std_logic := '0';
	signal frame_in_d6: std_logic := '0';
	signal frame_in_d7: std_logic := '0';
	signal frame_in_d8: std_logic := '0';
	signal frame_in_d9: std_logic := '0';
	signal frame_in_d10: std_logic := '0';
	signal frame_in_d11: std_logic := '0';
	signal frame_in_d12: std_logic := '0';
	signal frame_in_d13: std_logic := '0';
	signal frame_in_d14: std_logic := '0';
	
	COMPONENT fifo_4format_converter
	  PORT (
	    wr_clk : IN STD_LOGIC;
	    rd_clk : IN STD_LOGIC;
	    din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	    wr_en : IN STD_LOGIC;
	    rd_en : IN STD_LOGIC;
	    dout : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
	    full : OUT STD_LOGIC;
	    empty : OUT STD_LOGIC;
	    valid : OUT STD_LOGIC
	  );
	END COMPONENT;

begin
	
	datain_swapped <= datain(0) & datain(1) & datain(2) & datain(3) & datain(4) & datain(5) & datain(6) & datain(7);
	
	counter_process: process(clk)
	begin
		if(rising_edge(clk)) then
			if(frame_in = '1') then
				counter <= counter + 1;
			end if;
		end if;
	end process;

	with counter select fifo_en <=
    "00000001" and (7 downto 0 => frame_in) when "000",
    "00000010" and (7 downto 0 => frame_in) when "001",
    "00000100" and (7 downto 0 => frame_in) when "010",
    "00001000" and (7 downto 0 => frame_in) when "011",
    "00010000" and (7 downto 0 => frame_in) when "100",
    "00100000" and (7 downto 0 => frame_in) when "101",
    "01000000" and (7 downto 0 => frame_in) when "110",
    "10000000" and (7 downto 0 => frame_in) when "111",
    "00000000" and (7 downto 0 => frame_in) when others;

	gen_inst_fifo_4format_converter: for i in 7 downto 0 generate
		inst_fifo_4format_converter : fifo_4format_converter
			PORT MAP (
				wr_clk => clk,
				rd_clk => clk,
				din => datain_swapped,
				wr_en => fifo_en(i),
				rd_en => frame_in_d14,
				dout => dataout(i downto i),
				full => open,
				empty => open,
				valid => valid(i)
			);
	end generate;

	frame_in_d1 <= frame_in when rising_edge(clk);
	frame_in_d2 <= frame_in_d1 when rising_edge(clk);
	frame_in_d3 <= frame_in_d2 when rising_edge(clk);
	frame_in_d4 <= frame_in_d3 when rising_edge(clk);
	frame_in_d5 <= frame_in_d4 when rising_edge(clk);
	frame_in_d6 <= frame_in_d5 when rising_edge(clk);
	frame_in_d7 <= frame_in_d6 when rising_edge(clk);
	frame_in_d8 <= frame_in_d7 when rising_edge(clk);
	frame_in_d9 <= frame_in_d8 when rising_edge(clk);
	frame_in_d10 <= frame_in_d9 when rising_edge(clk);
	frame_in_d11 <= frame_in_d10 when rising_edge(clk);
	frame_in_d12 <= frame_in_d11 when rising_edge(clk);
	frame_in_d13 <= frame_in_d12 when rising_edge(clk);
	frame_in_d14 <= frame_in_d13 when rising_edge(clk);
	
	frame_out <= valid(0);

end Behavioral;
