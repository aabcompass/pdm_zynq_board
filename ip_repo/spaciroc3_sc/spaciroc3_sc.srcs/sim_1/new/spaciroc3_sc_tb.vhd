library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use std.textio.all;

entity spaciroc3_sc_tb is
--  Port ( );
end spaciroc3_sc_tb;

architecture Behavioral of spaciroc3_sc_tb is

	component spaciroc3_sc_top
			generic (
						 C_LOAD_SPAC_PERIOD : integer := 5;
						 SIM : std_logic := '1';
						 N_SC_BITS: integer := 992;
						 N_PROBE_BITS: integer := 264;
						 N_CHIPS: integer := 6;
						 N_LINES: integer := 6;
						 N_SECTIONS: integer := 6);
			Port ( clk : in STD_LOGIC;
						 reset : in STD_LOGIC;
						 --EXTERNAL PINS
						 sr_in_pc : out  STD_LOGIC_vector(N_LINES-1 downto 0) := (others => '0');
						 sr_ck_pc : out  STD_LOGIC := '0';
						 sr_rstb_pc : out  STD_LOGIC := '1';
						 sr_out_pc: in std_logic;
						 select_sc_probe_pc: out std_logic := '1';
						 resetb_pc: out std_logic := '0';
						 --select_din_pc: out std_logic := '1';
						 loadb_sc_pc: out std_logic := '1';
						 -- CONTROL SIGNALS
						 start: in std_logic := '0';
						 done: out std_logic := '0';
						 is_same_data: in std_logic := '0';
						 -- data to be sent to all chips
						 general_reg0: in std_logic_vector(31 downto 0);
						 general_reg1: in std_logic_vector(31 downto 0);
						 general_reg2: in std_logic_vector(31 downto 0);
						 general_reg3: in std_logic_vector(31 downto 0);
						 general_reg4: in std_logic_vector(31 downto 0);
						 general_reg5: in std_logic_vector(31 downto 0);
						 -- data to be sent separately
						 s00_axis_tdata:  in std_logic_vector(32*N_LINES-1 downto 0);
						 s00_axis_tvalid: in std_logic;
						 s00_axis_tready: out std_logic := '0'
						 --current_chip: out std_logic_vector(2 downto 0) := "000"--;
						 -- data to be downloaded
						 --configuration_sc: in std_logic_vector(N_SC_BITS-1 downto 0);
						 --configuration_probe: in std_logic_vector(N_PROBE_BITS-1 downto 0);
						 --configuration_line: in std_logic_vector(5 downto 0);
						 --configuration_le: in std_logic                     
						 );
	end component;
	
	signal clk_counter: integer := 0;
	signal clk :std_logic := '0';
	signal start :std_logic := '0';
	signal start_d1 :std_logic := '0';
	signal start_front :std_logic := '0';
	
	COMPONENT fifo_generator_4tb
	  PORT (
	    s_aclk : IN STD_LOGIC;
	    s_aresetn : IN STD_LOGIC;
	    s_axis_tvalid : IN STD_LOGIC;
	    s_axis_tready : OUT STD_LOGIC;
	    s_axis_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	    m_axis_tvalid : OUT STD_LOGIC;
	    m_axis_tready : IN STD_LOGIC;
	    m_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	  );
	END COMPONENT;

	COMPONENT axis_dwidth_converter_4tb
		PORT (
			aclk : IN STD_LOGIC;
			aresetn : IN STD_LOGIC;
			s_axis_tvalid : IN STD_LOGIC;
			s_axis_tready : OUT STD_LOGIC;
			s_axis_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			m_axis_tvalid : OUT STD_LOGIC;
			m_axis_tready : IN STD_LOGIC;
			m_axis_tdata : OUT STD_LOGIC_VECTOR(191 DOWNTO 0)
		);
	END COMPONENT;
	
	signal m_axis_tvalid, m_axis_tready, m_axis_tvalid_dwc, m_axis_tready_dwc, s_axis_tvalid, s_axis_tready : std_logic := '0';
	
	file fptr: text;
	signal data_loaded: std_logic := '0';
	signal s_aresetn: std_logic := '0';
	signal s_axis_tdata, m_axis_tdata: std_logic_vector(31 downto 0) := (others => '0');
	signal m_axis_tdata_dwc: std_logic_vector(191 downto 0) := (others => '0');
	
	 
begin


	process
	begin
		clk <= '1';
		wait for 10 ns;
		clk <= '0';
		wait for 10 ns;
		clk_counter <= clk_counter + 1;
	end process;
	
	main_process: process
	begin
		s_aresetn <= '0';
		wait until clk_counter = 40;		
		s_aresetn <= '1';
		wait until clk_counter = 41;		
		start <= '0';
		wait until data_loaded = '1';
		start <= '1';
		wait;
	end process;
	
	start_d1 <= start  when rising_edge(clk);
	start_front <= start and not start_d1 when rising_edge(clk);

	GetData_proc: process(clk)

   variable fstatus       :file_open_status;
   
   variable file_line     :line;
   variable var_data1     :integer;
   variable var_data2     :integer;
   variable var_data3     :std_logic_vector(31 downto 0);
   
   variable state : integer range 0 to 5 := 0;
      
	begin
		if(rising_edge(clk)) then
			case state is
				when 0 => 	if(s_aresetn = '1') then
											state := state + 1;
										end if;
				when 1 => 	if(s_axis_tready = '1') then
											state := state + 1;
										end if;
				when 2 => 	file_open(fstatus, fptr, "/home/alx/c_prj/slow_ctrl_test/sc.txt", read_mode);
										state := state + 1;
				when 3 => 	
										readline(fptr, file_line);
										read(file_line, var_data1);
										read(file_line, var_data2);
										s_axis_tdata <= conv_std_logic_vector(var_data2, 32);
										s_axis_tvalid <= '1';
										if(endfile(fptr)) then
											state := state + 1;
										end if;
				when 4 => 	s_axis_tvalid <= '0';
										state := state + 1;
				when 5 => 	file_close(fptr);
										data_loaded <= '1';
			end case;
		end if;
	
--		 data1     <= (others => '0');
--		 var_data1 := (others => '0');
--		 data2     <= 0;
--		 var_data2 := 0;
--		 data3     <= (others => '0');
--		 var_data3 := (others => '0');
--		 eof       <= '0';
	
--		 wait until s_axis_tready = '1';
	
--		 file_open(fstatus, fptr, "/home/alx/c_prj/slow_ctrl_test/sc.txt", read_mode);
	
--		 while (not endfile(fptr)) loop
--			 wait until rising_edge(clk);
--				--wait until clk = '1';
--				readline(fptr, file_line);
--				read(file_line, var_data1);
				
----				hread(file_line, var_data1);
----				data1      <= var_data1;
----				read(file_line, var_data2);
----				data2      <= var_data2;
----				read(file_line, var_data3);
----				data3      <= var_data3;
--		 end loop;
--		 eof       <= '1';
--		 file_close(fptr);
	end process;
	
	i_fifo_generator_4tb : fifo_generator_4tb
	  PORT MAP (
	    s_aclk => clk,
	    s_aresetn => s_aresetn,
	    s_axis_tvalid => s_axis_tvalid,
	    s_axis_tready => s_axis_tready,
	    s_axis_tdata => s_axis_tdata,
	    m_axis_tvalid => m_axis_tvalid,
	    m_axis_tready => m_axis_tready,
	    m_axis_tdata => m_axis_tdata
	  );

	your_instance_name : axis_dwidth_converter_4tb
		PORT MAP (
			aclk => clk,
			aresetn => s_aresetn,
			s_axis_tvalid => m_axis_tvalid,
			s_axis_tready => m_axis_tready,
			s_axis_tdata => m_axis_tdata,
			m_axis_tvalid => m_axis_tvalid_dwc,
			m_axis_tready => m_axis_tready_dwc,
			m_axis_tdata => m_axis_tdata_dwc
		);
	
	dut: spaciroc3_sc_top
			Port map ( clk =>  clk,--: in STD_LOGIC;
						 reset => '0', --: in STD_LOGIC;
						 --EXTERNAL PINS
						 sr_in_pc => open, --: out  STD_LOGIC_vector(N_LINES-1 downto 0) := (others => '0');
						 sr_ck_pc =>  open,--: out  STD_LOGIC := '0';
						 sr_rstb_pc => open, --: out  STD_LOGIC := '1';
						 sr_out_pc => '0',--: in std_logic;
						 select_sc_probe_pc => open,--: out std_logic := '1';
						 resetb_pc => open,--: out std_logic := '0';
						 --select_din_pc => open,--: out std_logic := '1';
						 loadb_sc_pc => open,--: out std_logic := '1';
						 -- CONTROL SIGNALS
						 start => start_front, --: in std_logic := '0';
						 done => open,--: out std_logic := '0';
						 is_same_data => '0',--: in std_logic := '0';
						 -- data to be sent to all chips
						 general_reg0 => X"12345678",--: in std_logic_vector(31 downto 0);
						 general_reg1 => X"01830183",--: in std_logic_vector(31 downto 0);
						 general_reg2 => X"89ABCDEF",--: in std_logic_vector(31 downto 0);
						 general_reg3 => X"19191919",--: in std_logic_vector(31 downto 0);
						 general_reg4 => X"3A3A3A3A",--: in std_logic_vector(31 downto 0);
						 general_reg5 => X"00000017",--: in std_logic_vector(31 downto 0);
						 -- data to be sent separately
						 s00_axis_tdata => m_axis_tdata_dwc,--:  in std_logic_vector(32*N_LINES-1 downto 0);
						 s00_axis_tvalid => m_axis_tvalid_dwc,--: in std_logic;
						 s00_axis_tready => m_axis_tready_dwc--: out std_logic := '0'
						 --current_chip: out std_logic_vector(2 downto 0) := "000"--;
						 -- data to be downloaded
						 --configuration_sc: in std_logic_vector(N_SC_BITS-1 downto 0);
						 --configuration_probe: in std_logic_vector(N_PROBE_BITS-1 downto 0);
						 --configuration_line: in std_logic_vector(5 downto 0);
						 --configuration_le: in std_logic                     
						 );

	


end Behavioral;
