library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

library UNISIM;
use UNISIM.VComponents.all;
--

entity pattern_checker is
    Port 
    ( 
      -- system
      -- data to ZYNQ
      zynq_clk_p, zynq_clk_n: in std_logic;
      --zynq_frame: in std_logic;
      zynq_data: in std_logic_vector(15 downto 0);
      
      -- locked
      blink: out std_logic;
      locked: out std_logic
      --led_result: out std_logic
    );
end pattern_checker;


architecture Behavioral of pattern_checker is

	component clk_diff_to_200
	port
	 (-- Clock in ports
		clk_in1_p         : in     std_logic;
		clk_in1_n         : in     std_logic;
		-- Clock out ports
		clk_out1          : out    std_logic;
		-- Status and control signals
		reset             : in     std_logic;
		locked            : out    std_logic
	 );
	end component;

	signal clk: std_logic;
	
	signal counter_led : std_logic_vector(24 downto 0) := (others => '0');
	
	signal counter_a, counter_a_d1, counter_a_d2 : std_logic_vector(15 downto 0) := (0 => '0', others => '0');
	signal counter_b, counter_b_d1, counter_b_d2 : std_logic_vector(15 downto 0) := (0 => '1', others => '0');
	signal err_counter_a : std_logic_vector(15 downto 0) := (others => '0');
	signal err_counter_b : std_logic_vector(15 downto 0) := (others => '0');

	attribute keep : string; 
	attribute keep of counter_a: signal is "true"; 
	attribute keep of counter_b: signal is "true"; 
	attribute keep of err_counter_a: signal is "true"; 
	attribute keep of err_counter_b: signal is "true"; 

begin



	inst_clk_diff_to_200 : clk_diff_to_200
		 port map ( 
	
		 -- Clock in ports
		 clk_in1_p => zynq_clk_p,
		 clk_in1_n => zynq_clk_n,
		-- Clock out ports  
		 clk_out1 => clk,
		-- Status and control signals                
		 reset => '0',
		 locked => locked            
	 );

	counter_led <= counter_led + 1 when rising_edge(clk);
	blink <= counter_led(24);
	
   
  IDDR_inst_data_gen: for i in 15 downto 0 generate  
   IDDR_inst_data : IDDR 
   generic map (
      DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE", "SAME_EDGE" 
 -- or "SAME_EDGE_PIPELINED" 
      INIT_Q1 => '0', -- Initial value of Q1: '0' or '1'
      INIT_Q2 => '0', -- Initial value of Q2: '0' or '1'
      SRTYPE => "SYNC") -- Set/Reset type: "SYNC" or "ASYNC" 
   port map (
      Q1 => counter_a(i), -- 1-bit output for positive edge of clock 
      Q2 => counter_b(i), -- 1-bit output for negative edge of clock
      C => clk,   -- 1-bit clock input
      CE => '1', -- 1-bit clock enable input
      D => zynq_data(i),   -- 1-bit DDR data input
      R => '0',   -- 1-bit reset
      S => '0'    -- 1-bit set
      );	
   end generate;

	counter_a_d1 <= counter_a when rising_edge(clk);
	counter_b_d1 <= counter_b when rising_edge(clk);
	counter_a_d2 <= counter_a_d1 when rising_edge(clk);
	counter_b_d2 <= counter_b_d1 when rising_edge(clk);
	
	err_counter_a_process: process(clk)
	begin
		if(rising_edge(clk)) then
			if(counter_a_d1 - counter_a_d2 /= 2) then
				err_counter_a <=  err_counter_a + 1;
			end if; 
		end if;
	end process;
	
	err_counter_b_process: process(clk)
	begin
		if(rising_edge(clk)) then
			if(counter_b_d1 - counter_b_d2 /= 2) then
				err_counter_b <=  err_counter_b + 1;
			end if; 
		end if;
	end process;
	
	
end Behavioral;
