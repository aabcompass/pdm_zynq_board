-- MINIEUSO TestBench Template M.Mignone 04/2016
--INFN Torino

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.std_logic_arith.ALL;
  USE ieee.std_logic_unsigned.ALL;
  --USE ieee.numeric_std.ALL;
  USE	ieee.std_logic_textio.ALL;
  use STD.textio.ALL;

  ENTITY testbench_EC IS
  END testbench_EC;

  ARCHITECTURE behavior OF testbench_EC IS 

  -- Component Declaration
	COMPONENT ALGO_B
   PORT(
		CLOCK			:	in	    std_logic;
		--------------------------MINIEUSO-------------------
		DATA			:	in	    std_logic_vector(15 downto 0);
		FRAME			:	in	    std_logic;
		------------------------------------------------------
		L1_EVENT        :   out     std_logic;
		--FIFO
		s_aresetn		:	in		std_logic;
		m_aclk			:	in		std_logic;
		m_axis_tvalid 	:	out	    std_logic;
		m_axis_tready	: 	in		std_logic;
		m_axis_tdata	: 	out	    std_logic_vector(31 downto 0);
		m_axis_tlast    :   out     std_logic
		);
					
	END COMPONENT;
	


	SIGNAL	gtu_cnt_s1		:	std_logic_vector(31 downto 0);--ABSOLUTE GTU NUMBER

	SIGNAL 	s_aresetn 		:  std_logic :='1';
	SIGNAL	clock			:	std_logic :='0';
	
	SIGNAL	clock_axi		:	std_logic :='0';
--				
	SIGNAL	d0_s1			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d1_s1			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d2_s1			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d3_s1			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d4_s1			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d5_s1			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d6_s1			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d7_s1			:	std_logic_vector(63 downto 0) := ( others => '0');
--							
	SIGNAL	d0_s2			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d1_s2			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d2_s2			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d3_s2			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d4_s2			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d5_s2			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d6_s2			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d7_s2			:	std_logic_vector(63 downto 0) := ( others => '0');
--				
	SIGNAL	d0_s3			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d1_s3			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d2_s3			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d3_s3			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d4_s3			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d5_s3			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d6_s3			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d7_s3			:	std_logic_vector(63 downto 0) := ( others => '0');
--	
	---------------------------------------MINIEUSO-----------
	SIGNAL	data			:	std_logic_vector(15 downto 0) := "0000000000000000";
	SIGNAL	frame_s0	    :	std_logic := '0';
	SIGNAL  l1_event        :   std_logic := '0';
	----------------------------------------------------------

	SIGNAL	d0_s4			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d1_s4			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d2_s4			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d3_s4			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d4_s4			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d5_s4			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d6_s4			:	std_logic_vector(63 downto 0) := ( others => '0');
	SIGNAL	d7_s4			:	std_logic_vector(63 downto 0) := ( others => '0');
				--
	SIGNAL	m_axis_tready	:	std_logic := '0';
	SIGNAL	m_axis_tvalid	:	std_logic;
	SIGNAL	m_axis_tdata	:	std_logic_vector(31 downto 0);
	SIGNAL	m_axis_tlast	:	std_logic;
			 
	CONSTANT period			: 	time:= 5 ns;
	CONSTANT delay			:	time := 10 ns;
	CONSTANT delay_data	    :	time := 2.5 ns;
	
	CONSTANT period_axi		: 	time:= 10 ns;
				
  BEGIN

  -- Component Instantiation
  uut:ALGO_B
	PORT MAP(
            CLOCK				=>	clock,
		    -------------------------MINIEUSO---------
			DATA				=>	data,
			FRAME				=> frame_s0,
			L1_EVENT            => l1_event,
			------------------------------------------
			s_aresetn 			=> s_aresetn,
			m_aclk				=> clock_axi,
			m_axis_tvalid 		=>	m_axis_tvalid,
			m_axis_tready	 	=>	m_axis_tready,
			m_axis_tdata		=> m_axis_tdata,
			m_axis_tlast        => m_axis_tlast			
			);

		
		clock	<=	not clock after period/2;
		
		clock_axi <= not clock_axi after period_axi/2;
		
		s_aresetn	<=	transport '1',
				'0' after delay/8,
				'1' after delay/8 + 10 ns;
				

		gen_I_ec:process
		variable p0_s1,p1_s1,p2_s1,p3_s1,p4_s1,p5_s1,p6_s1,p7_s1	: integer;
		variable p0_s2,p1_s2,p2_s2,p3_s2,p4_s2,p5_s2,p6_s2,p7_s2	: integer;
		variable p0_s3,p1_s3,p2_s3,p3_s3,p4_s3,p5_s3,p6_s3,p7_s3	: integer;
		variable p0_s4,p1_s4,p2_s4,p3_s4,p4_s4,p5_s4,p6_s4,p7_s4	: integer;
		variable line_in_ec	:	line;
		FILE	 file_in_ec	:	text;
	begin
		FILE_OPEN(file_in_ec,"Data_IN.txt",READ_MODE);
		
		gtu_cnt_s1	<= "00000000000000000000000000000000";
		
		wait for 8.5*period;
		wait for delay_data;
		
		while not endfile(file_in_ec) loop
		  gtu_cnt_s1	<= gtu_cnt_s1 + 1; --Only for DEBUG
		  for I in 0 to 2 loop-----------------EC0,EC1,EC2
			--Line1
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s1);
			read(line_in_ec,p6_s1);
			read(line_in_ec,p5_s1);
			read(line_in_ec,p4_s1);
			read(line_in_ec,p3_s1);
			read(line_in_ec,p2_s1);
			read(line_in_ec,p1_s1);
			read(line_in_ec,p0_s1);
			
			d0_s1(63 downto 56)	<= conv_std_logic_vector(p0_s1,8);
			d0_s1(55 downto 48)	<= conv_std_logic_vector(p1_s1,8);
			d0_s1(47 downto 40)	<= conv_std_logic_vector(p2_s1,8);
			d0_s1(39 downto 32)	<= conv_std_logic_vector(p3_s1,8);
			d0_s1(31 downto 24)	<= conv_std_logic_vector(p4_s1,8);
			d0_s1(23 downto 16)	<= conv_std_logic_vector(p5_s1,8);
			d0_s1(15 downto 8) 	<= conv_std_logic_vector(p6_s1,8);
			d0_s1(7 downto 0) 	<= conv_std_logic_vector(p7_s1,8);
			
			--Line2
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s1);
			read(line_in_ec,p6_s1);
			read(line_in_ec,p5_s1);
			read(line_in_ec,p4_s1);
			read(line_in_ec,p3_s1);
			read(line_in_ec,p2_s1);
			read(line_in_ec,p1_s1);
			read(line_in_ec,p0_s1);
			
			d1_s1(63 downto 56)	<= conv_std_logic_vector(p0_s1,8);
			d1_s1(55 downto 48)	<= conv_std_logic_vector(p1_s1,8);
			d1_s1(47 downto 40)	<= conv_std_logic_vector(p2_s1,8);
			d1_s1(39 downto 32)	<= conv_std_logic_vector(p3_s1,8);
			d1_s1(31 downto 24)	<= conv_std_logic_vector(p4_s1,8);
			d1_s1(23 downto 16)	<= conv_std_logic_vector(p5_s1,8);
			d1_s1(15 downto 8) 	<= conv_std_logic_vector(p6_s1,8);
			d1_s1(7 downto 0) 	<= conv_std_logic_vector(p7_s1,8);
			
			--Line3
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s1);
			read(line_in_ec,p6_s1);
			read(line_in_ec,p5_s1);
			read(line_in_ec,p4_s1);
			read(line_in_ec,p3_s1);
			read(line_in_ec,p2_s1);
			read(line_in_ec,p1_s1);
			read(line_in_ec,p0_s1);
			
			d2_s1(63 downto 56)	<= conv_std_logic_vector(p0_s1,8);
			d2_s1(55 downto 48)	<= conv_std_logic_vector(p1_s1,8);
			d2_s1(47 downto 40)	<= conv_std_logic_vector(p2_s1,8);
			d2_s1(39 downto 32)	<= conv_std_logic_vector(p3_s1,8);
			d2_s1(31 downto 24)	<= conv_std_logic_vector(p4_s1,8);
			d2_s1(23 downto 16)	<= conv_std_logic_vector(p5_s1,8);
			d2_s1(15 downto 8) 	<= conv_std_logic_vector(p6_s1,8);
			d2_s1(7 downto 0) 	<= conv_std_logic_vector(p7_s1,8);
			
			--Line4
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s1);
			read(line_in_ec,p6_s1);
			read(line_in_ec,p5_s1);
			read(line_in_ec,p4_s1);
			read(line_in_ec,p3_s1);
			read(line_in_ec,p2_s1);
			read(line_in_ec,p1_s1);
			read(line_in_ec,p0_s1);
			
			d3_s1(63 downto 56)	<= conv_std_logic_vector(p0_s1,8);
			d3_s1(55 downto 48)	<= conv_std_logic_vector(p1_s1,8);
			d3_s1(47 downto 40)	<= conv_std_logic_vector(p2_s1,8);
			d3_s1(39 downto 32)	<= conv_std_logic_vector(p3_s1,8);
			d3_s1(31 downto 24)	<= conv_std_logic_vector(p4_s1,8);
			d3_s1(23 downto 16)	<= conv_std_logic_vector(p5_s1,8);
			d3_s1(15 downto 8) 	<= conv_std_logic_vector(p6_s1,8);
			d3_s1(7 downto 0) 	<= conv_std_logic_vector(p7_s1,8);
			
			--Line5
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s1);
			read(line_in_ec,p6_s1);
			read(line_in_ec,p5_s1);
			read(line_in_ec,p4_s1);
			read(line_in_ec,p3_s1);
			read(line_in_ec,p2_s1);
			read(line_in_ec,p1_s1);
			read(line_in_ec,p0_s1);
			
			d4_s1(63 downto 56)	<= conv_std_logic_vector(p0_s1,8);
			d4_s1(55 downto 48)	<= conv_std_logic_vector(p1_s1,8);
			d4_s1(47 downto 40)	<= conv_std_logic_vector(p2_s1,8);
			d4_s1(39 downto 32)	<= conv_std_logic_vector(p3_s1,8);
			d4_s1(31 downto 24)	<= conv_std_logic_vector(p4_s1,8);
			d4_s1(23 downto 16)	<= conv_std_logic_vector(p5_s1,8);
			d4_s1(15 downto 8) 	<= conv_std_logic_vector(p6_s1,8);
			d4_s1(7 downto 0) 	<= conv_std_logic_vector(p7_s1,8);
			
			--Line6
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s1);
			read(line_in_ec,p6_s1);
			read(line_in_ec,p5_s1);
			read(line_in_ec,p4_s1);
			read(line_in_ec,p3_s1);
			read(line_in_ec,p2_s1);
			read(line_in_ec,p1_s1);
			read(line_in_ec,p0_s1);
			
			d5_s1(63 downto 56)	<= conv_std_logic_vector(p0_s1,8);
			d5_s1(55 downto 48)	<= conv_std_logic_vector(p1_s1,8);
			d5_s1(47 downto 40)	<= conv_std_logic_vector(p2_s1,8);
			d5_s1(39 downto 32)	<= conv_std_logic_vector(p3_s1,8);
			d5_s1(31 downto 24)	<= conv_std_logic_vector(p4_s1,8);
			d5_s1(23 downto 16)	<= conv_std_logic_vector(p5_s1,8);
			d5_s1(15 downto 8) 	<= conv_std_logic_vector(p6_s1,8);
			d5_s1(7 downto 0) 	<= conv_std_logic_vector(p7_s1,8);
			
			--Line7
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s1);
			read(line_in_ec,p6_s1);
			read(line_in_ec,p5_s1);
			read(line_in_ec,p4_s1);
			read(line_in_ec,p3_s1);
			read(line_in_ec,p2_s1);
			read(line_in_ec,p1_s1);
			read(line_in_ec,p0_s1);
			
			d6_s1(63 downto 56)	<= conv_std_logic_vector(p0_s1,8);
			d6_s1(55 downto 48)	<= conv_std_logic_vector(p1_s1,8);
			d6_s1(47 downto 40)	<= conv_std_logic_vector(p2_s1,8);
			d6_s1(39 downto 32)	<= conv_std_logic_vector(p3_s1,8);
			d6_s1(31 downto 24)	<= conv_std_logic_vector(p4_s1,8);
			d6_s1(23 downto 16)	<= conv_std_logic_vector(p5_s1,8);
			d6_s1(15 downto 8) 	<= conv_std_logic_vector(p6_s1,8);
			d6_s1(7 downto 0) 	<= conv_std_logic_vector(p7_s1,8);
			
			--Line8
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s1);
			read(line_in_ec,p6_s1);
			read(line_in_ec,p5_s1);
			read(line_in_ec,p4_s1);
			read(line_in_ec,p3_s1);
			read(line_in_ec,p2_s1);
			read(line_in_ec,p1_s1);
			read(line_in_ec,p0_s1);
			
			d7_s1(63 downto 56)	<= conv_std_logic_vector(p0_s1,8);
			d7_s1(55 downto 48)	<= conv_std_logic_vector(p1_s1,8);
			d7_s1(47 downto 40)	<= conv_std_logic_vector(p2_s1,8);
			d7_s1(39 downto 32)	<= conv_std_logic_vector(p3_s1,8);
			d7_s1(31 downto 24)	<= conv_std_logic_vector(p4_s1,8);
			d7_s1(23 downto 16)	<= conv_std_logic_vector(p5_s1,8);
			d7_s1(15 downto 8) 	<= conv_std_logic_vector(p6_s1,8);
			d7_s1(7 downto 0) 	<= conv_std_logic_vector(p7_s1,8);
			
			--Empty line(9)
			readline(file_in_ec,line_in_ec);
			
			--Line10
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s2);
			read(line_in_ec,p6_s2);
			read(line_in_ec,p5_s2);
			read(line_in_ec,p4_s2);
			read(line_in_ec,p3_s2);
			read(line_in_ec,p2_s2);
			read(line_in_ec,p1_s2);
			read(line_in_ec,p0_s2);
			
			d0_s2(63 downto 56)	<= conv_std_logic_vector(p0_s2,8);
			d0_s2(55 downto 48)	<= conv_std_logic_vector(p1_s2,8);
			d0_s2(47 downto 40)	<= conv_std_logic_vector(p2_s2,8);
			d0_s2(39 downto 32)	<= conv_std_logic_vector(p3_s2,8);
			d0_s2(31 downto 24)	<= conv_std_logic_vector(p4_s2,8);
			d0_s2(23 downto 16)	<= conv_std_logic_vector(p5_s2,8);
			d0_s2(15 downto 8) 	<= conv_std_logic_vector(p6_s2,8);
			d0_s2(7 downto 0) 	<= conv_std_logic_vector(p7_s2,8);
			
			--Line11
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s2);
			read(line_in_ec,p6_s2);
			read(line_in_ec,p5_s2);
			read(line_in_ec,p4_s2);
			read(line_in_ec,p3_s2);
			read(line_in_ec,p2_s2);
			read(line_in_ec,p1_s2);
			read(line_in_ec,p0_s2);
			
			d1_s2(63 downto 56)	<= conv_std_logic_vector(p0_s2,8);
			d1_s2(55 downto 48)	<= conv_std_logic_vector(p1_s2,8);
			d1_s2(47 downto 40)	<= conv_std_logic_vector(p2_s2,8);
			d1_s2(39 downto 32)	<= conv_std_logic_vector(p3_s2,8);
			d1_s2(31 downto 24)	<= conv_std_logic_vector(p4_s2,8);
			d1_s2(23 downto 16)	<= conv_std_logic_vector(p5_s2,8);
			d1_s2(15 downto 8) 	<= conv_std_logic_vector(p6_s2,8);
			d1_s2(7 downto 0) 	<= conv_std_logic_vector(p7_s2,8);
			
			--Line12
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s2);
			read(line_in_ec,p6_s2);
			read(line_in_ec,p5_s2);
			read(line_in_ec,p4_s2);
			read(line_in_ec,p3_s2);
			read(line_in_ec,p2_s2);
			read(line_in_ec,p1_s2);
			read(line_in_ec,p0_s2);
			
			d2_s2(63 downto 56)	<= conv_std_logic_vector(p0_s2,8);
			d2_s2(55 downto 48)	<= conv_std_logic_vector(p1_s2,8);
			d2_s2(47 downto 40)	<= conv_std_logic_vector(p2_s2,8);
			d2_s2(39 downto 32)	<= conv_std_logic_vector(p3_s2,8);
			d2_s2(31 downto 24)	<= conv_std_logic_vector(p4_s2,8);
			d2_s2(23 downto 16)	<= conv_std_logic_vector(p5_s2,8);
			d2_s2(15 downto 8) 	<= conv_std_logic_vector(p6_s2,8);
			d2_s2(7 downto 0) 	<= conv_std_logic_vector(p7_s2,8);
			
			--Line13
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s2);
			read(line_in_ec,p6_s2);
			read(line_in_ec,p5_s2);
			read(line_in_ec,p4_s2);
			read(line_in_ec,p3_s2);
			read(line_in_ec,p2_s2);
			read(line_in_ec,p1_s2);
			read(line_in_ec,p0_s2);
			
			d3_s2(63 downto 56)	<= conv_std_logic_vector(p0_s2,8);
			d3_s2(55 downto 48)	<= conv_std_logic_vector(p1_s2,8);
			d3_s2(47 downto 40)	<= conv_std_logic_vector(p2_s2,8);
			d3_s2(39 downto 32)	<= conv_std_logic_vector(p3_s2,8);
			d3_s2(31 downto 24)	<= conv_std_logic_vector(p4_s2,8);
			d3_s2(23 downto 16)	<= conv_std_logic_vector(p5_s2,8);
			d3_s2(15 downto 8) 	<= conv_std_logic_vector(p6_s2,8);
			d3_s2(7 downto 0) 	<= conv_std_logic_vector(p7_s2,8);
			
			--Line14
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s2);
			read(line_in_ec,p6_s2);
			read(line_in_ec,p5_s2);
			read(line_in_ec,p4_s2);
			read(line_in_ec,p3_s2);
			read(line_in_ec,p2_s2);
			read(line_in_ec,p1_s2);
			read(line_in_ec,p0_s2);
			
			d4_s2(63 downto 56)	<= conv_std_logic_vector(p0_s2,8);
			d4_s2(55 downto 48)	<= conv_std_logic_vector(p1_s2,8);
			d4_s2(47 downto 40)	<= conv_std_logic_vector(p2_s2,8);
			d4_s2(39 downto 32)	<= conv_std_logic_vector(p3_s2,8);
			d4_s2(31 downto 24)	<= conv_std_logic_vector(p4_s2,8);
			d4_s2(23 downto 16)	<= conv_std_logic_vector(p5_s2,8);
			d4_s2(15 downto 8) 	<= conv_std_logic_vector(p6_s2,8);
			d4_s2(7 downto 0) 	<= conv_std_logic_vector(p7_s2,8);
			
			--Line15
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s2);
			read(line_in_ec,p6_s2);
			read(line_in_ec,p5_s2);
			read(line_in_ec,p4_s2);
			read(line_in_ec,p3_s2);
			read(line_in_ec,p2_s2);
			read(line_in_ec,p1_s2);
			read(line_in_ec,p0_s2);
			
			d5_s2(63 downto 56)	<= conv_std_logic_vector(p0_s2,8);
			d5_s2(55 downto 48)	<= conv_std_logic_vector(p1_s2,8);
			d5_s2(47 downto 40)	<= conv_std_logic_vector(p2_s2,8);
			d5_s2(39 downto 32)	<= conv_std_logic_vector(p3_s2,8);
			d5_s2(31 downto 24)	<= conv_std_logic_vector(p4_s2,8);
			d5_s2(23 downto 16)	<= conv_std_logic_vector(p5_s2,8);
			d5_s2(15 downto 8) 	<= conv_std_logic_vector(p6_s2,8);
			d5_s2(7 downto 0) 	<= conv_std_logic_vector(p7_s2,8);
			
			--Line16
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s2);
			read(line_in_ec,p6_s2);
			read(line_in_ec,p5_s2);
			read(line_in_ec,p4_s2);
			read(line_in_ec,p3_s2);
			read(line_in_ec,p2_s2);
			read(line_in_ec,p1_s2);
			read(line_in_ec,p0_s2);
			
			d6_s2(63 downto 56)	<= conv_std_logic_vector(p0_s2,8);
			d6_s2(55 downto 48)	<= conv_std_logic_vector(p1_s2,8);
			d6_s2(47 downto 40)	<= conv_std_logic_vector(p2_s2,8);
			d6_s2(39 downto 32)	<= conv_std_logic_vector(p3_s2,8);
			d6_s2(31 downto 24)	<= conv_std_logic_vector(p4_s2,8);
			d6_s2(23 downto 16)	<= conv_std_logic_vector(p5_s2,8);
			d6_s2(15 downto 8) 	<= conv_std_logic_vector(p6_s2,8);
			d6_s2(7 downto 0) 	<= conv_std_logic_vector(p7_s2,8);
			
			--Line17
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s2);
			read(line_in_ec,p6_s2);
			read(line_in_ec,p5_s2);
			read(line_in_ec,p4_s2);
			read(line_in_ec,p3_s2);
			read(line_in_ec,p2_s2);
			read(line_in_ec,p1_s2);
			read(line_in_ec,p0_s2);
			
			d7_s2(63 downto 56)	<= conv_std_logic_vector(p0_s2,8);
			d7_s2(55 downto 48)	<= conv_std_logic_vector(p1_s2,8);
			d7_s2(47 downto 40)	<= conv_std_logic_vector(p2_s2,8);
			d7_s2(39 downto 32)	<= conv_std_logic_vector(p3_s2,8);
			d7_s2(31 downto 24)	<= conv_std_logic_vector(p4_s2,8);
			d7_s2(23 downto 16)	<= conv_std_logic_vector(p5_s2,8);
			d7_s2(15 downto 8) 	<= conv_std_logic_vector(p6_s2,8);
			d7_s2(7 downto 0) 	<= conv_std_logic_vector(p7_s2,8);
			
			--Empty line(18)
			readline(file_in_ec,line_in_ec);
			
			--Line19
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s3);
			read(line_in_ec,p6_s3);
			read(line_in_ec,p5_s3);
			read(line_in_ec,p4_s3);
			read(line_in_ec,p3_s3);
			read(line_in_ec,p2_s3);
			read(line_in_ec,p1_s3);
			read(line_in_ec,p0_s3);
			
			d0_s3(63 downto 56)	<= conv_std_logic_vector(p0_s3,8);
			d0_s3(55 downto 48)	<= conv_std_logic_vector(p1_s3,8);
			d0_s3(47 downto 40)	<= conv_std_logic_vector(p2_s3,8);
			d0_s3(39 downto 32)	<= conv_std_logic_vector(p3_s3,8);
			d0_s3(31 downto 24)	<= conv_std_logic_vector(p4_s3,8);
			d0_s3(23 downto 16)	<= conv_std_logic_vector(p5_s3,8);
			d0_s3(15 downto 8) 	<= conv_std_logic_vector(p6_s3,8);
			d0_s3(7 downto 0) 	<= conv_std_logic_vector(p7_s3,8);
			
			--Line20
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s3);
			read(line_in_ec,p6_s3);
			read(line_in_ec,p5_s3);
			read(line_in_ec,p4_s3);
			read(line_in_ec,p3_s3);
			read(line_in_ec,p2_s3);
			read(line_in_ec,p1_s3);
			read(line_in_ec,p0_s3);
			
			d1_s3(63 downto 56)	<= conv_std_logic_vector(p0_s3,8);
			d1_s3(55 downto 48)	<= conv_std_logic_vector(p1_s3,8);
			d1_s3(47 downto 40)	<= conv_std_logic_vector(p2_s3,8);
			d1_s3(39 downto 32)	<= conv_std_logic_vector(p3_s3,8);
			d1_s3(31 downto 24)	<= conv_std_logic_vector(p4_s3,8);
			d1_s3(23 downto 16)	<= conv_std_logic_vector(p5_s3,8);
			d1_s3(15 downto 8) 	<= conv_std_logic_vector(p6_s3,8);
			d1_s3(7 downto 0) 	<= conv_std_logic_vector(p7_s3,8);
			
			--Line21
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s3);
			read(line_in_ec,p6_s3);
			read(line_in_ec,p5_s3);
			read(line_in_ec,p4_s3);
			read(line_in_ec,p3_s3);
			read(line_in_ec,p2_s3);
			read(line_in_ec,p1_s3);
			read(line_in_ec,p0_s3);
			
			d2_s3(63 downto 56)	<= conv_std_logic_vector(p0_s3,8);
			d2_s3(55 downto 48)	<= conv_std_logic_vector(p1_s3,8);
			d2_s3(47 downto 40)	<= conv_std_logic_vector(p2_s3,8);
			d2_s3(39 downto 32)	<= conv_std_logic_vector(p3_s3,8);
			d2_s3(31 downto 24)	<= conv_std_logic_vector(p4_s3,8);
			d2_s3(23 downto 16)	<= conv_std_logic_vector(p5_s3,8);
			d2_s3(15 downto 8) 	<= conv_std_logic_vector(p6_s3,8);
			d2_s3(7 downto 0) 	<= conv_std_logic_vector(p7_s3,8);
			
			--Line22
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s3);
			read(line_in_ec,p6_s3);
			read(line_in_ec,p5_s3);
			read(line_in_ec,p4_s3);
			read(line_in_ec,p3_s3);
			read(line_in_ec,p2_s3);
			read(line_in_ec,p1_s3);
			read(line_in_ec,p0_s3);
			
			d3_s3(63 downto 56)	<= conv_std_logic_vector(p0_s3,8);
			d3_s3(55 downto 48)	<= conv_std_logic_vector(p1_s3,8);
			d3_s3(47 downto 40)	<= conv_std_logic_vector(p2_s3,8);
			d3_s3(39 downto 32)	<= conv_std_logic_vector(p3_s3,8);
			d3_s3(31 downto 24)	<= conv_std_logic_vector(p4_s3,8);
			d3_s3(23 downto 16)	<= conv_std_logic_vector(p5_s3,8);
			d3_s3(15 downto 8) 	<= conv_std_logic_vector(p6_s3,8);
			d3_s3(7 downto 0) 	<= conv_std_logic_vector(p7_s3,8);
			
			--Line23
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s3);
			read(line_in_ec,p6_s3);
			read(line_in_ec,p5_s3);
			read(line_in_ec,p4_s3);
			read(line_in_ec,p3_s3);
			read(line_in_ec,p2_s3);
			read(line_in_ec,p1_s3);
			read(line_in_ec,p0_s3);
			
			d4_s3(63 downto 56)	<= conv_std_logic_vector(p0_s3,8);
			d4_s3(55 downto 48)	<= conv_std_logic_vector(p1_s3,8);
			d4_s3(47 downto 40)	<= conv_std_logic_vector(p2_s3,8);
			d4_s3(39 downto 32)	<= conv_std_logic_vector(p3_s3,8);
			d4_s3(31 downto 24)	<= conv_std_logic_vector(p4_s3,8);
			d4_s3(23 downto 16)	<= conv_std_logic_vector(p5_s3,8);
			d4_s3(15 downto 8) 	<= conv_std_logic_vector(p6_s3,8);
			d4_s3(7 downto 0) 	<= conv_std_logic_vector(p7_s3,8);
			
			--Line24
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s3);
			read(line_in_ec,p6_s3);
			read(line_in_ec,p5_s3);
			read(line_in_ec,p4_s3);
			read(line_in_ec,p3_s3);
			read(line_in_ec,p2_s3);
			read(line_in_ec,p1_s3);
			read(line_in_ec,p0_s3);
			
			d5_s3(63 downto 56)	<= conv_std_logic_vector(p0_s3,8);
			d5_s3(55 downto 48)	<= conv_std_logic_vector(p1_s3,8);
			d5_s3(47 downto 40)	<= conv_std_logic_vector(p2_s3,8);
			d5_s3(39 downto 32)	<= conv_std_logic_vector(p3_s3,8);
			d5_s3(31 downto 24)	<= conv_std_logic_vector(p4_s3,8);
			d5_s3(23 downto 16)	<= conv_std_logic_vector(p5_s3,8);
			d5_s3(15 downto 8) 	<= conv_std_logic_vector(p6_s3,8);
			d5_s3(7 downto 0) 	<= conv_std_logic_vector(p7_s3,8);
			
			--Line25
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s3);
			read(line_in_ec,p6_s3);
			read(line_in_ec,p5_s3);
			read(line_in_ec,p4_s3);
			read(line_in_ec,p3_s3);
			read(line_in_ec,p2_s3);
			read(line_in_ec,p1_s3);
			read(line_in_ec,p0_s3);
			
			d6_s3(63 downto 56)	<= conv_std_logic_vector(p0_s3,8);
			d6_s3(55 downto 48)	<= conv_std_logic_vector(p1_s3,8);
			d6_s3(47 downto 40)	<= conv_std_logic_vector(p2_s3,8);
			d6_s3(39 downto 32)	<= conv_std_logic_vector(p3_s3,8);
			d6_s3(31 downto 24)	<= conv_std_logic_vector(p4_s3,8);
			d6_s3(23 downto 16)	<= conv_std_logic_vector(p5_s3,8);
			d6_s3(15 downto 8) 	<= conv_std_logic_vector(p6_s3,8);
			d6_s3(7 downto 0) 	<= conv_std_logic_vector(p7_s3,8);
			
			--Line26
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s3);
			read(line_in_ec,p6_s3);
			read(line_in_ec,p5_s3);
			read(line_in_ec,p4_s3);
			read(line_in_ec,p3_s3);
			read(line_in_ec,p2_s3);
			read(line_in_ec,p1_s3);
			read(line_in_ec,p0_s3);
			
			d7_s3(63 downto 56)	<= conv_std_logic_vector(p0_s3,8);
			d7_s3(55 downto 48)	<= conv_std_logic_vector(p1_s3,8);
			d7_s3(47 downto 40)	<= conv_std_logic_vector(p2_s3,8);
			d7_s3(39 downto 32)	<= conv_std_logic_vector(p3_s3,8);
			d7_s3(31 downto 24)	<= conv_std_logic_vector(p4_s3,8);
			d7_s3(23 downto 16)	<= conv_std_logic_vector(p5_s3,8);
			d7_s3(15 downto 8) 	<= conv_std_logic_vector(p6_s3,8);
			d7_s3(7 downto 0) 	<= conv_std_logic_vector(p7_s3,8);
			
			--Empty line(27)
			readline(file_in_ec,line_in_ec);
			
			--Line28
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s4);
			read(line_in_ec,p6_s4);
			read(line_in_ec,p5_s4);
			read(line_in_ec,p4_s4);
			read(line_in_ec,p3_s4);
			read(line_in_ec,p2_s4);
			read(line_in_ec,p1_s4);
			read(line_in_ec,p0_s4);
			
			d0_s4(63 downto 56)	<= conv_std_logic_vector(p0_s4,8);
			d0_s4(55 downto 48)	<= conv_std_logic_vector(p1_s4,8);
			d0_s4(47 downto 40)	<= conv_std_logic_vector(p2_s4,8);
			d0_s4(39 downto 32)	<= conv_std_logic_vector(p3_s4,8);
			d0_s4(31 downto 24)	<= conv_std_logic_vector(p4_s4,8);
			d0_s4(23 downto 16)	<= conv_std_logic_vector(p5_s4,8);
			d0_s4(15 downto 8) 	<= conv_std_logic_vector(p6_s4,8);
			d0_s4(7 downto 0) 	<= conv_std_logic_vector(p7_s4,8);
			
			--Line29
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s4);
			read(line_in_ec,p6_s4);
			read(line_in_ec,p5_s4);
			read(line_in_ec,p4_s4);
			read(line_in_ec,p3_s4);
			read(line_in_ec,p2_s4);
			read(line_in_ec,p1_s4);
			read(line_in_ec,p0_s4);
			
			d1_s4(63 downto 56)	<= conv_std_logic_vector(p0_s4,8);
			d1_s4(55 downto 48)	<= conv_std_logic_vector(p1_s4,8);
			d1_s4(47 downto 40)	<= conv_std_logic_vector(p2_s4,8);
			d1_s4(39 downto 32)	<= conv_std_logic_vector(p3_s4,8);
			d1_s4(31 downto 24)	<= conv_std_logic_vector(p4_s4,8);
			d1_s4(23 downto 16)	<= conv_std_logic_vector(p5_s4,8);
			d1_s4(15 downto 8) 	<= conv_std_logic_vector(p6_s4,8);
			d1_s4(7 downto 0) 	<= conv_std_logic_vector(p7_s4,8);
			
			--Line30
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s4);
			read(line_in_ec,p6_s4);
			read(line_in_ec,p5_s4);
			read(line_in_ec,p4_s4);
			read(line_in_ec,p3_s4);
			read(line_in_ec,p2_s4);
			read(line_in_ec,p1_s4);
			read(line_in_ec,p0_s4);
			
			d2_s4(63 downto 56)	<= conv_std_logic_vector(p0_s4,8);
			d2_s4(55 downto 48)	<= conv_std_logic_vector(p1_s4,8);
			d2_s4(47 downto 40)	<= conv_std_logic_vector(p2_s4,8);
			d2_s4(39 downto 32)	<= conv_std_logic_vector(p3_s4,8);
			d2_s4(31 downto 24)	<= conv_std_logic_vector(p4_s4,8);
			d2_s4(23 downto 16)	<= conv_std_logic_vector(p5_s4,8);
			d2_s4(15 downto 8) 	<= conv_std_logic_vector(p6_s4,8);
			d2_s4(7 downto 0) 	<= conv_std_logic_vector(p7_s4,8);
			
			--Line31
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s4);
			read(line_in_ec,p6_s4);
			read(line_in_ec,p5_s4);
			read(line_in_ec,p4_s4);
			read(line_in_ec,p3_s4);
			read(line_in_ec,p2_s4);
			read(line_in_ec,p1_s4);
			read(line_in_ec,p0_s4);
			
			d3_s4(63 downto 56)	<= conv_std_logic_vector(p0_s4,8);
			d3_s4(55 downto 48)	<= conv_std_logic_vector(p1_s4,8);
			d3_s4(47 downto 40)	<= conv_std_logic_vector(p2_s4,8);
			d3_s4(39 downto 32)	<= conv_std_logic_vector(p3_s4,8);
			d3_s4(31 downto 24)	<= conv_std_logic_vector(p4_s4,8);
			d3_s4(23 downto 16)	<= conv_std_logic_vector(p5_s4,8);
			d3_s4(15 downto 8) 	<= conv_std_logic_vector(p6_s4,8);
			d3_s4(7 downto 0) 	<= conv_std_logic_vector(p7_s4,8);
			
			--Line32
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s4);
			read(line_in_ec,p6_s4);
			read(line_in_ec,p5_s4);
			read(line_in_ec,p4_s4);
			read(line_in_ec,p3_s4);
			read(line_in_ec,p2_s4);
			read(line_in_ec,p1_s4);
			read(line_in_ec,p0_s4);
			
			d4_s4(63 downto 56)	<= conv_std_logic_vector(p0_s4,8);
			d4_s4(55 downto 48)	<= conv_std_logic_vector(p1_s4,8);
			d4_s4(47 downto 40)	<= conv_std_logic_vector(p2_s4,8);
			d4_s4(39 downto 32)	<= conv_std_logic_vector(p3_s4,8);
			d4_s4(31 downto 24)	<= conv_std_logic_vector(p4_s4,8);
			d4_s4(23 downto 16)	<= conv_std_logic_vector(p5_s4,8);
			d4_s4(15 downto 8) 	<= conv_std_logic_vector(p6_s4,8);
			d4_s4(7 downto 0) 	<= conv_std_logic_vector(p7_s4,8);
			
			--Line33
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s4);
			read(line_in_ec,p6_s4);
			read(line_in_ec,p5_s4);
			read(line_in_ec,p4_s4);
			read(line_in_ec,p3_s4);
			read(line_in_ec,p2_s4);
			read(line_in_ec,p1_s4);
			read(line_in_ec,p0_s4);
			
			d5_s4(63 downto 56)	<= conv_std_logic_vector(p0_s4,8);
			d5_s4(55 downto 48)	<= conv_std_logic_vector(p1_s4,8);
			d5_s4(47 downto 40)	<= conv_std_logic_vector(p2_s4,8);
			d5_s4(39 downto 32)	<= conv_std_logic_vector(p3_s4,8);
			d5_s4(31 downto 24)	<= conv_std_logic_vector(p4_s4,8);
			d5_s4(23 downto 16)	<= conv_std_logic_vector(p5_s4,8);
			d5_s4(15 downto 8) 	<= conv_std_logic_vector(p6_s4,8);
			d5_s4(7 downto 0) 	<= conv_std_logic_vector(p7_s4,8);
			
			--Line34
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s4);
			read(line_in_ec,p6_s4);
			read(line_in_ec,p5_s4);
			read(line_in_ec,p4_s4);
			read(line_in_ec,p3_s4);
			read(line_in_ec,p2_s4);
			read(line_in_ec,p1_s4);
			read(line_in_ec,p0_s4);
			
			d6_s4(63 downto 56)	<= conv_std_logic_vector(p0_s4,8);
			d6_s4(55 downto 48)	<= conv_std_logic_vector(p1_s4,8);
			d6_s4(47 downto 40)	<= conv_std_logic_vector(p2_s4,8);
			d6_s4(39 downto 32)	<= conv_std_logic_vector(p3_s4,8);
			d6_s4(31 downto 24)	<= conv_std_logic_vector(p4_s4,8);
			d6_s4(23 downto 16)	<= conv_std_logic_vector(p5_s4,8);
			d6_s4(15 downto 8) 	<= conv_std_logic_vector(p6_s4,8);
			d6_s4(7 downto 0) 	<= conv_std_logic_vector(p7_s4,8);
			
			--Line35
			readline(file_in_ec,line_in_ec);
			read(line_in_ec,p7_s4);
			read(line_in_ec,p6_s4);
			read(line_in_ec,p5_s4);
			read(line_in_ec,p4_s4);
			read(line_in_ec,p3_s4);
			read(line_in_ec,p2_s4);
			read(line_in_ec,p1_s4);
			read(line_in_ec,p0_s4);
			
			d7_s4(63 downto 56)	<= conv_std_logic_vector(p0_s4,8);
			d7_s4(55 downto 48)	<= conv_std_logic_vector(p1_s4,8);
			d7_s4(47 downto 40)	<= conv_std_logic_vector(p2_s4,8);
			d7_s4(39 downto 32)	<= conv_std_logic_vector(p3_s4,8);
			d7_s4(31 downto 24)	<= conv_std_logic_vector(p4_s4,8);
			d7_s4(23 downto 16)	<= conv_std_logic_vector(p5_s4,8);
			d7_s4(15 downto 8) 	<= conv_std_logic_vector(p6_s4,8);
			d7_s4(7 downto 0) 	<= conv_std_logic_vector(p7_s4,8);
			
			--Empty line(36)
			readline(file_in_ec,line_in_ec);
			
			--wait for 55*period;
			
			--gtu_cnt_s1	<= gtu_cnt_s1 + 1; --Only for DEBUG
			-------------------MINIEUSO----------------
			data(0)	 <=	d0_s1(0);
			data(1)  <=	d1_s1(0);
			data(2)	 <=	d2_s1(0);
			data(3)	 <=	d3_s1(0);
			data(4)	 <=	d4_s1(0);
			data(5)	 <=	d5_s1(0);
			data(6)	 <=	d6_s1(0);
			data(7)	 <=	d7_s1(0);
			data(8)	 <=	d0_s3(0);
			data(9)	 <=	d1_s3(0);
			data(10) <=	d2_s3(0);
			data(11) <=	d3_s3(0);
			data(12) <=	d4_s3(0);
			data(13) <=	d5_s3(0);
			data(14) <=	d6_s3(0);
			data(15) <=	d7_s3(0);
			frame_s0 <= '1';
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	 <=	d0_s1(1);
			data(1)	 <=	d1_s1(1);
			data(2)	 <=	d2_s1(1);
			data(3)	 <=	d3_s1(1);
			data(4)	 <=	d4_s1(1);
			data(5)	 <=	d5_s1(1);
			data(6)	 <=	d6_s1(1);
			data(7)	 <=	d7_s1(1);
			data(8)	 <=	d0_s3(1);
			data(9)	 <=	d1_s3(1);
			data(10) <=	d2_s3(1);
			data(11) <=	d3_s3(1);
			data(12) <=	d4_s3(1);
			data(13) <=	d5_s3(1);
			data(14) <=	d6_s3(1);
			data(15) <=	d7_s3(1);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	 <=	d0_s1(2);
			data(1)	 <=	d1_s1(2);
			data(2)	 <=	d2_s1(2);
			data(3)	 <=	d3_s1(2);
			data(4)	 <=	d4_s1(2);
			data(5)	 <=	d5_s1(2);
			data(6)	 <=	d6_s1(2);
			data(7)	 <=	d7_s1(2);
			data(8)	 <=	d0_s3(2);
			data(9)	 <=	d1_s3(2);
			data(10) <=	d2_s3(2);
			data(11) <=	d3_s3(2);
			data(12) <=	d4_s3(2);
			data(13) <=	d5_s3(2);
			data(14) <=	d6_s3(2);
			data(15) <=	d7_s3(2);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	 <=	d0_s1(3);
			data(1)	 <=	d1_s1(3);
			data(2)	 <=	d2_s1(3);
			data(3)	 <=	d3_s1(3);
			data(4)	 <=	d4_s1(3);
			data(5)	 <=	d5_s1(3);
			data(6)	 <=	d6_s1(3);
			data(7)	 <=	d7_s1(3);
			data(8)	 <=	d0_s3(3);
			data(9)	 <=	d1_s3(3);
			data(10) <=	d2_s3(3);
			data(11) <=	d3_s3(3);
			data(12) <=	d4_s3(3);
			data(13) <=	d5_s3(3);
			data(14) <=	d6_s3(3);
			data(15) <=	d7_s3(3);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	 <=	d0_s1(4);
			data(1)	 <=	d1_s1(4);
			data(2)	 <=	d2_s1(4);
			data(3)	 <=	d3_s1(4);
			data(4)	 <=	d4_s1(4);
			data(5)	 <=	d5_s1(4);
			data(6)	 <=	d6_s1(4);
			data(7)	 <=	d7_s1(4);
			data(8)	 <=	d0_s3(4);
			data(9)	 <=	d1_s3(4);
			data(10) <=	d2_s3(4);
			data(11) <=	d3_s3(4);
			data(12) <=	d4_s3(4);
			data(13) <=	d5_s3(4);
			data(14) <=	d6_s3(4);
			data(15) <=	d7_s3(4);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	 <=	d0_s1(5);
			data(1)	 <=	d1_s1(5);
			data(2)	 <=	d2_s1(5);
			data(3)	 <=	d3_s1(5);
			data(4)	 <=	d4_s1(5);
			data(5)	 <=	d5_s1(5);
			data(6)	 <=	d6_s1(5);
			data(7)	 <=	d7_s1(5);
			data(8)	 <=	d0_s3(5);
			data(9)	 <=	d1_s3(5);
			data(10) <=	d2_s3(5);
			data(11) <=	d3_s3(5);
			data(12) <=	d4_s3(5);
			data(13) <=	d5_s3(5);
			data(14) <=	d6_s3(5);
			data(15) <=	d7_s3(5);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	 <=	d0_s1(6);
			data(1)	 <=	d1_s1(6);
			data(2)	 <=	d2_s1(6);
			data(3)	 <=	d3_s1(6);
			data(4)	 <=	d4_s1(6);
			data(5)	 <=	d5_s1(6);
			data(6)	 <=	d6_s1(6);
			data(7)	 <=	d7_s1(6);
			data(8)	 <=	d0_s3(6);
			data(9)	 <=	d1_s3(6);
			data(10) <=	d2_s3(6);
			data(11) <=	d3_s3(6);
			data(12) <=	d4_s3(6);
			data(13) <=	d5_s3(6);
			data(14) <=	d6_s3(6);
			data(15) <=	d7_s3(6);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	 <=	d0_s1(7);
			data(1)	 <=	d1_s1(7);
			data(2)	 <=	d2_s1(7);
			data(3)	 <=	d3_s1(7);
			data(4)	 <=	d4_s1(7);
			data(5)	 <=	d5_s1(7);
			data(6)	 <=	d6_s1(7);
			data(7)	 <=	d7_s1(7);
			data(8)	 <=	d0_s3(7);
			data(9)	 <=	d1_s3(7);
			data(10) <=	d2_s3(7);
			data(11) <=	d3_s3(7);
			data(12) <=	d4_s3(7);
			data(13) <=	d5_s3(7);
			data(14) <=	d6_s3(7);
			data(15) <=	d7_s3(7);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	 <=	d0_s1(8);
			data(1)	 <=	d1_s1(8);
			data(2)	 <=	d2_s1(8);
			data(3)	 <=	d3_s1(8);
			data(4)	 <=	d4_s1(8);
			data(5)	 <=	d5_s1(8);
			data(6)	 <=	d6_s1(8);
			data(7)	 <=	d7_s1(8);
			data(8)	 <=	d0_s3(8);
			data(9)	 <=	d1_s3(8);
			data(10) <=	d2_s3(8);
			data(11) <=	d3_s3(8);
			data(12) <=	d4_s3(8);
			data(13) <=	d5_s3(8);
			data(14) <=	d6_s3(8);
			data(15) <=	d7_s3(8);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	 <=	d0_s1(9);
			data(1)	 <=	d1_s1(9);
			data(2)	 <=	d2_s1(9);
			data(3)	 <=	d3_s1(9);
			data(4)	 <=	d4_s1(9);
			data(5)	 <=	d5_s1(9);
			data(6)	 <=	d6_s1(9);
			data(7)	 <=	d7_s1(9);
			data(8)	 <=	d0_s3(9);
			data(9)	 <=	d1_s3(9);
			data(10) <=	d2_s3(9);
			data(11) <=	d3_s3(9);
			data(12) <=	d4_s3(9);
			data(13) <=	d5_s3(9);
			data(14) <=	d6_s3(9);
			data(15) <=	d7_s3(9);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	 <=	d0_s1(10);
			data(1)	 <=	d1_s1(10);
			data(2)	 <=	d2_s1(10);
			data(3)	 <=	d3_s1(10);
			data(4)	 <=	d4_s1(10);
			data(5)	 <=	d5_s1(10);
			data(6)	 <=	d6_s1(10);
			data(7)	 <=	d7_s1(10);
			data(8)	 <=	d0_s3(10);
			data(9)	 <=	d1_s3(10);
			data(10) <=	d2_s3(10);
			data(11) <=	d3_s3(10);
			data(12) <=	d4_s3(10);
			data(13) <=	d5_s3(10);
			data(14) <=	d6_s3(10);
			data(15) <=	d7_s3(10);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	 <=	d0_s1(11);
			data(1)	 <=	d1_s1(11);
			data(2)	 <=	d2_s1(11);
			data(3)	 <=	d3_s1(11);
			data(4)	 <=	d4_s1(11);
			data(5)	 <=	d5_s1(11);
			data(6)	 <=	d6_s1(11);
			data(7)	 <=	d7_s1(11);
			data(8)	 <=	d0_s3(11);
			data(9)	 <=	d1_s3(11);
			data(10) <=	d2_s3(11);
			data(11) <=	d3_s3(11);
			data(12) <=	d4_s3(11);
			data(13) <=	d5_s3(11);
			data(14) <=	d6_s3(11);
			data(15) <=	d7_s3(11);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(12);
			data(1)	<=	d1_s1(12);
			data(2)	<=	d2_s1(12);
			data(3)	<=	d3_s1(12);
			data(4)	<=	d4_s1(12);
			data(5)	<=	d5_s1(12);
			data(6)	<=	d6_s1(12);
			data(7)	<=	d7_s1(12);
			data(8)	<=	d0_s3(12);
			data(9)	<=	d1_s3(12);
			data(10)<=	d2_s3(12);
			data(11)<=	d3_s3(12);
			data(12)<=	d4_s3(12);
			data(13)<=	d5_s3(12);
			data(14)<=	d6_s3(12);
			data(15)<=	d7_s3(12);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(13);
			data(1)	<=	d1_s1(13);
			data(2)	<=	d2_s1(13);
			data(3)	<=	d3_s1(13);
			data(4)	<=	d4_s1(13);
			data(5)	<=	d5_s1(13);
			data(6)	<=	d6_s1(13);
			data(7)	<=	d7_s1(13);
			data(8)	<=	d0_s3(13);
			data(9)	<=	d1_s3(13);
			data(10)<=	d2_s3(13);
			data(11)<=	d3_s3(13);
			data(12)<=	d4_s3(13);
			data(13)<=	d5_s3(13);
			data(14)<=	d6_s3(13);
			data(15)<=	d7_s3(13);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(14);
			data(1)	<=	d1_s1(14);
			data(2)	<=	d2_s1(14);
			data(3)	<=	d3_s1(14);
			data(4)	<=	d4_s1(14);
			data(5)	<=	d5_s1(14);
			data(6)	<=	d6_s1(14);
			data(7)	<=	d7_s1(14);
			data(8)	<=	d0_s3(14);
			data(9)	<=	d1_s3(14);
			data(10)<=	d2_s3(14);
			data(11)<=	d3_s3(14);
			data(12)<=	d4_s3(14);
			data(13)<=	d5_s3(14);
			data(14)<=	d6_s3(14);
			data(15)<=	d7_s3(14);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(15);
			data(1)	<=	d1_s1(15);
			data(2)	<=	d2_s1(15);
			data(3)	<=	d3_s1(15);
			data(4)	<=	d4_s1(15);
			data(5)	<=	d5_s1(15);
			data(6)	<=	d6_s1(15);
			data(7)	<=	d7_s1(15);
			data(8)	<=	d0_s3(15);
			data(9)	<=	d1_s3(15);
			data(10)<=	d2_s3(15);
			data(11)<=	d3_s3(15);
			data(12)<=	d4_s3(15);
			data(13)<=	d5_s3(15);
			data(14)<=	d6_s3(15);
			data(15)<=	d7_s3(15);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(16);
			data(1)	<=	d1_s1(16);
			data(2)	<=	d2_s1(16);
			data(3)	<=	d3_s1(16);
			data(4)	<=	d4_s1(16);
			data(5)	<=	d5_s1(16);
			data(6)	<=	d6_s1(16);
			data(7)	<=	d7_s1(16);
			data(8)	<=	d0_s3(16);
			data(9)	<=	d1_s3(16);
			data(10)<=	d2_s3(16);
			data(11)<=	d3_s3(16);
			data(12)<=	d4_s3(16);
			data(13)<=	d5_s3(16);
			data(14)<=	d6_s3(16);
			data(15)<=	d7_s3(16);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(17);
			data(1)	<=	d1_s1(17);
			data(2)	<=	d2_s1(17);
			data(3)	<=	d3_s1(17);
			data(4)	<=	d4_s1(17);
			data(5)	<=	d5_s1(17);
			data(6)	<=	d6_s1(17);
			data(7)	<=	d7_s1(17);
			data(8)	<=	d0_s3(17);
			data(9)	<=	d1_s3(17);
			data(10)<=	d2_s3(17);
			data(11)<=	d3_s3(17);
			data(12)<=	d4_s3(17);
			data(13)<=	d5_s3(17);
			data(14)<=	d6_s3(17);
			data(15)<=	d7_s3(17);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(18);
			data(1)	<=	d1_s1(18);
			data(2)	<=	d2_s1(18);
			data(3)	<=	d3_s1(18);
			data(4)	<=	d4_s1(18);
			data(5)	<=	d5_s1(18);
			data(6)	<=	d6_s1(18);
			data(7)	<=	d7_s1(18);
			data(8)	<=	d0_s3(18);
			data(9)	<=	d1_s3(18);
			data(10)<=	d2_s3(18);
			data(11)<=	d3_s3(18);
			data(12)<=	d4_s3(18);
			data(13)<=	d5_s3(18);
			data(14)<=	d6_s3(18);
			data(15)<=	d7_s3(18);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(19);
			data(1)	<=	d1_s1(19);
			data(2)	<=	d2_s1(19);
			data(3)	<=	d3_s1(19);
			data(4)	<=	d4_s1(19);
			data(5)	<=	d5_s1(19);
			data(6)	<=	d6_s1(19);
			data(7)	<=	d7_s1(19);
			data(8)	<=	d0_s3(19);
			data(9)	<=	d1_s3(19);
			data(10)<=	d2_s3(19);
			data(11)<=	d3_s3(19);
			data(12)<=	d4_s3(19);
			data(13)<=	d5_s3(19);
			data(14)<=	d6_s3(19);
			data(15)<=	d7_s3(19);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(20);
			data(1)	<=	d1_s1(20);
			data(2)	<=	d2_s1(20);
			data(3)	<=	d3_s1(20);
			data(4)	<=	d4_s1(20);
			data(5)	<=	d5_s1(20);
			data(6)	<=	d6_s1(20);
			data(7)	<=	d7_s1(20);
			data(8)	<=	d0_s3(20);
			data(9)	<=	d1_s3(20);
			data(10)<=	d2_s3(20);
			data(11)<=	d3_s3(20);
			data(12)<=	d4_s3(20);
			data(13)<=	d5_s3(20);
			data(14)<=	d6_s3(20);
			data(15)<=	d7_s3(20);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(21);
			data(1)	<=	d1_s1(21);
			data(2)	<=	d2_s1(21);
			data(3)	<=	d3_s1(21);
			data(4)	<=	d4_s1(21);
			data(5)	<=	d5_s1(21);
			data(6)	<=	d6_s1(21);
			data(7)	<=	d7_s1(21);
			data(8)	<=	d0_s3(21);
			data(9)	<=	d1_s3(21);
			data(10)<=	d2_s3(21);
			data(11)<=	d3_s3(21);
			data(12)<=	d4_s3(21);
			data(13)<=	d5_s3(21);
			data(14)<=	d6_s3(21);
			data(15)<=	d7_s3(21);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(22);
			data(1)	<=	d1_s1(22);
			data(2)	<=	d2_s1(22);
			data(3)	<=	d3_s1(22);
			data(4)	<=	d4_s1(22);
			data(5)	<=	d5_s1(22);
			data(6)	<=	d6_s1(22);
			data(7)	<=	d7_s1(22);
			data(8)	<=	d0_s3(22);
			data(9)	<=	d1_s3(22);
			data(10)<=	d2_s3(22);
			data(11)<=	d3_s3(22);
			data(12)<=	d4_s3(22);
			data(13)<=	d5_s3(22);
			data(14)<=	d6_s3(22);
			data(15)<=	d7_s3(22);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(23);
			data(1)	<=	d1_s1(23);
			data(2)	<=	d2_s1(23);
			data(3)	<=	d3_s1(23);
			data(4)	<=	d4_s1(23);
			data(5)	<=	d5_s1(23);
			data(6)	<=	d6_s1(23);
			data(7)	<=	d7_s1(23);
			data(8)	<=	d0_s3(23);
			data(9)	<=	d1_s3(23);
			data(10)<=	d2_s3(23);
			data(11)<=	d3_s3(23);
			data(12)<=	d4_s3(23);
			data(13)<=	d5_s3(23);
			data(14)<=	d6_s3(23);
			data(15)<=	d7_s3(23);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(24);
			data(1)	<=	d1_s1(24);
			data(2)	<=	d2_s1(24);
			data(3)	<=	d3_s1(24);
			data(4)	<=	d4_s1(24);
			data(5)	<=	d5_s1(24);
			data(6)	<=	d6_s1(24);
			data(7)	<=	d7_s1(24);
			data(8)	<=	d0_s3(24);
			data(9)	<=	d1_s3(24);
			data(10)<=	d2_s3(24);
			data(11)<=	d3_s3(24);
			data(12)<=	d4_s3(24);
			data(13)<=	d5_s3(24);
			data(14)<=	d6_s3(24);
			data(15)<=	d7_s3(24);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(25);
			data(1)	<=	d1_s1(25);
			data(2)	<=	d2_s1(25);
			data(3)	<=	d3_s1(25);
			data(4)	<=	d4_s1(25);
			data(5)	<=	d5_s1(25);
			data(6)	<=	d6_s1(25);
			data(7)	<=	d7_s1(25);
			data(8)	<=	d0_s3(25);
			data(9)	<=	d1_s3(25);
			data(10)<=	d2_s3(25);
			data(11)<=	d3_s3(25);
			data(12)<=	d4_s3(25);
			data(13)<=	d5_s3(25);
			data(14)<=	d6_s3(25);
			data(15)<=	d7_s3(25);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(26);
			data(1)	<=	d1_s1(26);
			data(2)	<=	d2_s1(26);
			data(3)	<=	d3_s1(26);
			data(4)	<=	d4_s1(26);
			data(5)	<=	d5_s1(26);
			data(6)	<=	d6_s1(26);
			data(7)	<=	d7_s1(26);
			data(8)	<=	d0_s3(26);
			data(9)	<=	d1_s3(26);
			data(10)<=	d2_s3(26);
			data(11)<=	d3_s3(26);
			data(12)<=	d4_s3(26);
			data(13)<=	d5_s3(26);
			data(14)<=	d6_s3(26);
			data(15)<=	d7_s3(26);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(27);
			data(1)	<=	d1_s1(27);
			data(2)	<=	d2_s1(27);
			data(3)	<=	d3_s1(27);
			data(4)	<=	d4_s1(27);
			data(5)	<=	d5_s1(27);
			data(6)	<=	d6_s1(27);
			data(7)	<=	d7_s1(27);
			data(8)	<=	d0_s3(27);
			data(9)	<=	d1_s3(27);
			data(10)<=	d2_s3(27);
			data(11)<=	d3_s3(27);
			data(12)<=	d4_s3(27);
			data(13)<=	d5_s3(27);
			data(14)<=	d6_s3(27);
			data(15)<=	d7_s3(27);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(28);
			data(1)	<=	d1_s1(28);
			data(2)	<=	d2_s1(28);
			data(3)	<=	d3_s1(28);
			data(4)	<=	d4_s1(28);
			data(5)	<=	d5_s1(28);
			data(6)	<=	d6_s1(28);
			data(7)	<=	d7_s1(28);
			data(8)	<=	d0_s3(28);
			data(9)	<=	d1_s3(28);
			data(10)<=	d2_s3(28);
			data(11)<=	d3_s3(28);
			data(12)<=	d4_s3(28);
			data(13)<=	d5_s3(28);
			data(14)<=	d6_s3(28);
			data(15)<=	d7_s3(28);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(29);
			data(1)	<=	d1_s1(29);
			data(2)	<=	d2_s1(29);
			data(3)	<=	d3_s1(29);
			data(4)	<=	d4_s1(29);
			data(5)	<=	d5_s1(29);
			data(6)	<=	d6_s1(29);
			data(7)	<=	d7_s1(29);
			data(8)	<=	d0_s3(29);
			data(9)	<=	d1_s3(29);
			data(10)<=	d2_s3(29);
			data(11)<=	d3_s3(29);
			data(12)<=	d4_s3(29);
			data(13)<=	d5_s3(29);
			data(14)<=	d6_s3(29);
			data(15)<=	d7_s3(29);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(30);
			data(1)	<=	d1_s1(30);
			data(2)	<=	d2_s1(30);
			data(3)	<=	d3_s1(30);
			data(4)	<=	d4_s1(30);
			data(5)	<=	d5_s1(30);
			data(6)	<=	d6_s1(30);
			data(7)	<=	d7_s1(30);
			data(8)	<=	d0_s3(30);
			data(9)	<=	d1_s3(30);
			data(10)<=	d2_s3(30);
			data(11)<=	d3_s3(30);
			data(12)<=	d4_s3(30);
			data(13)<=	d5_s3(30);
			data(14)<=	d6_s3(30);
			data(15)<=	d7_s3(30);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(31);
			data(1)	<=	d1_s1(31);
			data(2)	<=	d2_s1(31);
			data(3)	<=	d3_s1(31);
			data(4)	<=	d4_s1(31);
			data(5)	<=	d5_s1(31);
			data(6)	<=	d6_s1(31);
			data(7)	<=	d7_s1(31);
			data(8)	<=	d0_s3(31);
			data(9)	<=	d1_s3(31);
			data(10)<=	d2_s3(31);
			data(11)<=	d3_s3(31);
			data(12)<=	d4_s3(31);
			data(13)<=	d5_s3(31);
			data(14)<=	d6_s3(31);
			data(15)<=	d7_s3(31);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(32);
			data(1)	<=	d1_s1(32);
			data(2)	<=	d2_s1(32);
			data(3)	<=	d3_s1(32);
			data(4)	<=	d4_s1(32);
			data(5)	<=	d5_s1(32);
			data(6)	<=	d6_s1(32);
			data(7)	<=	d7_s1(32);
			data(8)	<=	d0_s3(32);
			data(9)	<=	d1_s3(32);
			data(10)<=	d2_s3(32);
			data(11)<=	d3_s3(32);
			data(12)<=	d4_s3(32);
			data(13)<=	d5_s3(32);
			data(14)<=	d6_s3(32);
			data(15)<=	d7_s3(32);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(33);
			data(1)	<=	d1_s1(33);
			data(2)	<=	d2_s1(33);
			data(3)	<=	d3_s1(33);
			data(4)	<=	d4_s1(33);
			data(5)	<=	d5_s1(33);
			data(6)	<=	d6_s1(33);
			data(7)	<=	d7_s1(33);
			data(8)	<=	d0_s3(33);
			data(9)	<=	d1_s3(33);
			data(10)<=	d2_s3(33);
			data(11)<=	d3_s3(33);
			data(12)<=	d4_s3(33);
			data(13)<=	d5_s3(33);
			data(14)<=	d6_s3(33);
			data(15)<=	d7_s3(33);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(34);
			data(1)	<=	d1_s1(34);
			data(2)	<=	d2_s1(34);
			data(3)	<=	d3_s1(34);
			data(4)	<=	d4_s1(34);
			data(5)	<=	d5_s1(34);
			data(6)	<=	d6_s1(34);
			data(7)	<=	d7_s1(34);
			data(8)	<=	d0_s3(34);
			data(9)	<=	d1_s3(34);
			data(10)<=	d2_s3(34);
			data(11)<=	d3_s3(34);
			data(12)<=	d4_s3(34);
			data(13)<=	d5_s3(34);
			data(14)<=	d6_s3(34);
			data(15)<=	d7_s3(34);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(35);
			data(1)	<=	d1_s1(35);
			data(2)	<=	d2_s1(35);
			data(3)	<=	d3_s1(35);
			data(4)	<=	d4_s1(35);
			data(5)	<=	d5_s1(35);
			data(6)	<=	d6_s1(35);
			data(7)	<=	d7_s1(35);
			data(8)	<=	d0_s3(35);
			data(9)	<=	d1_s3(35);
			data(10)<=	d2_s3(35);
			data(11)<=	d3_s3(35);
			data(12)<=	d4_s3(35);
			data(13)<=	d5_s3(35);
			data(14)<=	d6_s3(35);
			data(15)<=	d7_s3(35);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(36);
			data(1)	<=	d1_s1(36);
			data(2)	<=	d2_s1(36);
			data(3)	<=	d3_s1(36);
			data(4)	<=	d4_s1(36);
			data(5)	<=	d5_s1(36);
			data(6)	<=	d6_s1(36);
			data(7)	<=	d7_s1(36);
			data(8)	<=	d0_s3(36);
			data(9)	<=	d1_s3(36);
			data(10)<=	d2_s3(36);
			data(11)<=	d3_s3(36);
			data(12)<=	d4_s3(36);
			data(13)<=	d5_s3(36);
			data(14)<=	d6_s3(36);
			data(15)<=	d7_s3(36);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(37);
			data(1)	<=	d1_s1(37);
			data(2)	<=	d2_s1(37);
			data(3)	<=	d3_s1(37);
			data(4)	<=	d4_s1(37);
			data(5)	<=	d5_s1(37);
			data(6)	<=	d6_s1(37);
			data(7)	<=	d7_s1(37);
			data(8)	<=	d0_s3(37);
			data(9)	<=	d1_s3(37);
			data(10)<=	d2_s3(37);
			data(11)<=	d3_s3(37);
			data(12)<=	d4_s3(37);
			data(13)<=	d5_s3(37);
			data(14)<=	d6_s3(37);
			data(15)<=	d7_s3(37);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(38);
			data(1)	<=	d1_s1(38);
			data(2)	<=	d2_s1(38);
			data(3)	<=	d3_s1(38);
			data(4)	<=	d4_s1(38);
			data(5)	<=	d5_s1(38);
			data(6)	<=	d6_s1(38);
			data(7)	<=	d7_s1(38);
			data(8)	<=	d0_s3(38);
			data(9)	<=	d1_s3(38);
			data(10)<=	d2_s3(38);
			data(11)<=	d3_s3(38);
			data(12)<=	d4_s3(38);
			data(13)<=	d5_s3(38);
			data(14)<=	d6_s3(38);
			data(15)<=	d7_s3(38);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(39);
			data(1)	<=	d1_s1(39);
			data(2)	<=	d2_s1(39);
			data(3)	<=	d3_s1(39);
			data(4)	<=	d4_s1(39);
			data(5)	<=	d5_s1(39);
			data(6)	<=	d6_s1(39);
			data(7)	<=	d7_s1(39);
			data(8)	<=	d0_s3(39);
			data(9)	<=	d1_s3(39);
			data(10)<=	d2_s3(39);
			data(11)<=	d3_s3(39);
			data(12)<=	d4_s3(39);
			data(13)<=	d5_s3(39);
			data(14)<=	d6_s3(39);
			data(15)<=	d7_s3(39);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(40);
			data(1)	<=	d1_s1(40);
			data(2)	<=	d2_s1(40);
			data(3)	<=	d3_s1(40);
			data(4)	<=	d4_s1(40);
			data(5)	<=	d5_s1(40);
			data(6)	<=	d6_s1(40);
			data(7)	<=	d7_s1(40);
			data(8)	<=	d0_s3(40);
			data(9)	<=	d1_s3(40);
			data(10)<=	d2_s3(40);
			data(11)<=	d3_s3(40);
			data(12)<=	d4_s3(40);
			data(13)<=	d5_s3(40);
			data(14)<=	d6_s3(40);
			data(15)<=	d7_s3(40);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(41);
			data(1)	<=	d1_s1(41);
			data(2)	<=	d2_s1(41);
			data(3)	<=	d3_s1(41);
			data(4)	<=	d4_s1(41);
			data(5)	<=	d5_s1(41);
			data(6)	<=	d6_s1(41);
			data(7)	<=	d7_s1(41);
			data(8)	<=	d0_s3(41);
			data(9)	<=	d1_s3(41);
			data(10)<=	d2_s3(41);
			data(11)<=	d3_s3(41);
			data(12)<=	d4_s3(41);
			data(13)<=	d5_s3(41);
			data(14)<=	d6_s3(41);
			data(15)<=	d7_s3(41);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(42);
			data(1)	<=	d1_s1(42);
			data(2)	<=	d2_s1(42);
			data(3)	<=	d3_s1(42);
			data(4)	<=	d4_s1(42);
			data(5)	<=	d5_s1(42);
			data(6)	<=	d6_s1(42);
			data(7)	<=	d7_s1(42);
			data(8)	<=	d0_s3(42);
			data(9)	<=	d1_s3(42);
			data(10)<=	d2_s3(42);
			data(11)<=	d3_s3(42);
			data(12)<=	d4_s3(42);
			data(13)<=	d5_s3(42);
			data(14)<=	d6_s3(42);
			data(15)<=	d7_s3(42);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(43);
			data(1)	<=	d1_s1(43);
			data(2)	<=	d2_s1(43);
			data(3)	<=	d3_s1(43);
			data(4)	<=	d4_s1(43);
			data(5)	<=	d5_s1(43);
			data(6)	<=	d6_s1(43);
			data(7)	<=	d7_s1(43);
			data(8)	<=	d0_s3(43);
			data(9)	<=	d1_s3(43);
			data(10)<=	d2_s3(43);
			data(11)<=	d3_s3(43);
			data(12)<=	d4_s3(43);
			data(13)<=	d5_s3(43);
			data(14)<=	d6_s3(43);
			data(15)<=	d7_s3(43);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(44);
			data(1)	<=	d1_s1(44);
			data(2)	<=	d2_s1(44);
			data(3)	<=	d3_s1(44);
			data(4)	<=	d4_s1(44);
			data(5)	<=	d5_s1(44);
			data(6)	<=	d6_s1(44);
			data(7)	<=	d7_s1(44);
			data(8)	<=	d0_s3(44);
			data(9)	<=	d1_s3(44);
			data(10)<=	d2_s3(44);
			data(11)<=	d3_s3(44);
			data(12)<=	d4_s3(44);
			data(13)<=	d5_s3(44);
			data(14)<=	d6_s3(44);
			data(15)<=	d7_s3(44);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(45);
			data(1)	<=	d1_s1(45);
			data(2)	<=	d2_s1(45);
			data(3)	<=	d3_s1(45);
			data(4)	<=	d4_s1(45);
			data(5)	<=	d5_s1(45);
			data(6)	<=	d6_s1(45);
			data(7)	<=	d7_s1(45);
			data(8)	<=	d0_s3(45);
			data(9)	<=	d1_s3(45);
			data(10)<=	d2_s3(45);
			data(11)<=	d3_s3(45);
			data(12)<=	d4_s3(45);
			data(13)<=	d5_s3(45);
			data(14)<=	d6_s3(45);
			data(15)<=	d7_s3(45);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(46);
			data(1)	<=	d1_s1(46);
			data(2)	<=	d2_s1(46);
			data(3)	<=	d3_s1(46);
			data(4)	<=	d4_s1(46);
			data(5)	<=	d5_s1(46);
			data(6)	<=	d6_s1(46);
			data(7)	<=	d7_s1(46);
			data(8)	<=	d0_s3(46);
			data(9)	<=	d1_s3(46);
			data(10)<=	d2_s3(46);
			data(11)<=	d3_s3(46);
			data(12)<=	d4_s3(46);
			data(13)<=	d5_s3(46);
			data(14)<=	d6_s3(46);
			data(15)<=	d7_s3(46);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(47);
			data(1)	<=	d1_s1(47);
			data(2)	<=	d2_s1(47);
			data(3)	<=	d3_s1(47);
			data(4)	<=	d4_s1(47);
			data(5)	<=	d5_s1(47);
			data(6)	<=	d6_s1(47);
			data(7)	<=	d7_s1(47);
			data(8)	<=	d0_s3(47);
			data(9)	<=	d1_s3(47);
			data(10)<=	d2_s3(47);
			data(11)<=	d3_s3(47);
			data(12)<=	d4_s3(47);
			data(13)<=	d5_s3(47);
			data(14)<=	d6_s3(47);
			data(15)<=	d7_s3(47);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(48);
			data(1)	<=	d1_s1(48);
			data(2)	<=	d2_s1(48);
			data(3)	<=	d3_s1(48);
			data(4)	<=	d4_s1(48);
			data(5)	<=	d5_s1(48);
			data(6)	<=	d6_s1(48);
			data(7)	<=	d7_s1(48);
			data(8)	<=	d0_s3(48);
			data(9)	<=	d1_s3(48);
			data(10)<=	d2_s3(48);
			data(11)<=	d3_s3(48);
			data(12)<=	d4_s3(48);
			data(13)<=	d5_s3(48);
			data(14)<=	d6_s3(48);
			data(15)<=	d7_s3(48);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(49);
			data(1)	<=	d1_s1(49);
			data(2)	<=	d2_s1(49);
			data(3)	<=	d3_s1(49);
			data(4)	<=	d4_s1(49);
			data(5)	<=	d5_s1(49);
			data(6)	<=	d6_s1(49);
			data(7)	<=	d7_s1(49);
			data(8)	<=	d0_s3(49);
			data(9)	<=	d1_s3(49);
			data(10)<=	d2_s3(49);
			data(11)<=	d3_s3(49);
			data(12)<=	d4_s3(49);
			data(13)<=	d5_s3(49);
			data(14)<=	d6_s3(49);
			data(15)<=	d7_s3(49);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(50);
			data(1)	<=	d1_s1(50);
			data(2)	<=	d2_s1(50);
			data(3)	<=	d3_s1(50);
			data(4)	<=	d4_s1(50);
			data(5)	<=	d5_s1(50);
			data(6)	<=	d6_s1(50);
			data(7)	<=	d7_s1(50);
			data(8)	<=	d0_s3(50);
			data(9)	<=	d1_s3(50);
			data(10)<=	d2_s3(50);
			data(11)<=	d3_s3(50);
			data(12)<=	d4_s3(50);
			data(13)<=	d5_s3(50);
			data(14)<=  d6_s3(50);
			data(15)<=	d7_s3(50);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(51);
			data(1)	<=	d1_s1(51);
			data(2)	<=	d2_s1(51);
			data(3)	<=	d3_s1(51);
			data(4)	<=	d4_s1(51);
			data(5)	<=	d5_s1(51);
			data(6)	<=	d6_s1(51);
			data(7)	<=	d7_s1(51);
			data(8)	<=	d0_s3(51);
			data(9)	<=	d1_s3(51);
			data(10)<=	d2_s3(51);
			data(11)<=	d3_s3(51);
			data(12)<=	d4_s3(51);
			data(13)<=	d5_s3(51);
			data(14)<=	d6_s3(51);
			data(15)<=	d7_s3(51);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(52);
			data(1)	<=	d1_s1(52);
			data(2)	<=	d2_s1(52);
			data(3)	<=	d3_s1(52);
			data(4)	<=	d4_s1(52);
			data(5)	<=	d5_s1(52);
			data(6)	<=	d6_s1(52);
			data(7)	<=	d7_s1(52);
			data(8)	<=	d0_s3(52);
			data(9)	<=	d1_s3(52);
			data(10)<=	d2_s3(52);
			data(11)<=	d3_s3(52);
			data(12)<=	d4_s3(52);
			data(13)<=	d5_s3(52);
			data(14)<=	d6_s3(52);
			data(15)<=	d7_s3(52);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(53);
			data(1)	<=	d1_s1(53);
			data(2)	<=	d2_s1(53);
			data(3)	<=	d3_s1(53);
			data(4)	<=	d4_s1(53);
			data(5)	<=	d5_s1(53);
			data(6)	<=	d6_s1(53);
			data(7)	<=	d7_s1(53);
			data(8)	<=	d0_s3(53);
			data(9)	<=	d1_s3(53);
			data(10)<=	d2_s3(53);
			data(11)<=	d3_s3(53);
			data(12)<=	d4_s3(53);
			data(13)<=	d5_s3(53);
			data(14)<=	d6_s3(53);
			data(15)<=	d7_s3(53);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(54);
			data(1)	<=	d1_s1(54);
			data(2)	<=	d2_s1(54);
			data(3)	<=	d3_s1(54);
			data(4)	<=	d4_s1(54);
			data(5)	<=	d5_s1(54);
			data(6)	<=	d6_s1(54);
			data(7)	<=	d7_s1(54);
			data(8)	<=	d0_s3(54);
			data(9)	<=	d1_s3(54);
			data(10)<=	d2_s3(54);
			data(11)<=	d3_s3(54);
			data(12)<=	d4_s3(54);
			data(13)<=	d5_s3(54);
			data(14)<=	d6_s3(54);
			data(15)<=	d7_s3(54);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(55);
			data(1)	<=	d1_s1(55);
			data(2)	<=	d2_s1(55);
			data(3)	<=	d3_s1(55);
			data(4)	<=	d4_s1(55);
			data(5)	<=	d5_s1(55);
			data(6)	<=	d6_s1(55);
			data(7)	<=	d7_s1(55);
			data(8)	<=	d0_s3(55);
			data(9)	<=	d1_s3(55);
			data(10)<=	d2_s3(55);
			data(11)<=	d3_s3(55);
			data(12)<=	d4_s3(55);
			data(13)<=	d5_s3(55);
			data(14)<=	d6_s3(55);
			data(15)<=	d7_s3(55);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(56);
			data(1)	<=	d1_s1(56);
			data(2)	<=	d2_s1(56);
			data(3)	<=	d3_s1(56);
			data(4)	<=	d4_s1(56);
			data(5)	<=	d5_s1(56);
			data(6)	<=	d6_s1(56);
			data(7)	<=	d7_s1(56);
			data(8)	<=	d0_s3(56);
			data(9)	<=	d1_s3(56);
			data(10)<=	d2_s3(56);
			data(11)<=	d3_s3(56);
			data(12)<=	d4_s3(56);
			data(13)<=	d5_s3(56);
			data(14)<=	d6_s3(56);
			data(15)<=	d7_s3(56);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(57);
			data(1)	<=	d1_s1(57);
			data(2)	<=	d2_s1(57);
			data(3)	<=	d3_s1(57);
			data(4)	<=	d4_s1(57);
			data(5)	<=	d5_s1(57);
			data(6)	<=	d6_s1(57);
			data(7)	<=	d7_s1(57);
			data(8)	<=	d0_s3(57);
			data(9)	<=	d1_s3(57);
			data(10)<=	d2_s3(57);
			data(11)<=	d3_s3(57);
			data(12)<=	d4_s3(57);
			data(13)<=	d5_s3(57);
			data(14)<=	d6_s3(57);
			data(15)<=	d7_s3(57);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(58);
			data(1)	<=	d1_s1(58);
			data(2)	<=	d2_s1(58);
			data(3)	<=	d3_s1(58);
			data(4)	<=	d4_s1(58);
			data(5)	<=	d5_s1(58);
			data(6)	<=	d6_s1(58);
			data(7)	<=	d7_s1(58);
			data(8)	<=	d0_s3(58);
			data(9)	<=	d1_s3(58);
			data(10)<=	d2_s3(58);
			data(11)<=	d3_s3(58);
			data(12)<=	d4_s3(58);
			data(13)<=	d5_s3(58);
			data(14)<=	d6_s3(58);
			data(15)<=	d7_s3(58);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(59);
			data(1)	<=	d1_s1(59);
			data(2)	<=	d2_s1(59);
			data(3)	<=	d3_s1(59);
			data(4)	<=	d4_s1(59);
			data(5)	<=	d5_s1(59);
			data(6)	<=	d6_s1(59);
			data(7)	<=	d7_s1(59);
			data(8)	<=	d0_s3(59);
			data(9)	<=	d1_s3(59);
			data(10)<=	d2_s3(59);
			data(11)<=	d3_s3(59);
			data(12)<=	d4_s3(59);
			data(13)<=	d5_s3(59);
			data(14)<=	d6_s3(59);
			data(15)<=	d7_s3(59);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(60);
			data(1)	<=	d1_s1(60);
			data(2)	<=	d2_s1(60);
			data(3)	<=	d3_s1(60);
			data(4)	<=	d4_s1(60);
			data(5)	<=	d5_s1(60);
			data(6)	<=	d6_s1(60);
			data(7)	<=	d7_s1(60);
			data(8)	<=	d0_s3(60);
			data(9)	<=	d1_s3(60);
			data(10)<=	d2_s3(60);
			data(11)<=	d3_s3(60);
			data(12)<=	d4_s3(60);
			data(13)<=	d5_s3(60);
			data(14)<=	d6_s3(60);
			data(15)<=	d7_s3(60);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(61);
			data(1)	<=	d1_s1(61);
			data(2)	<=	d2_s1(61);
			data(3)	<=	d3_s1(61);
			data(4)	<=	d4_s1(61);
			data(5)	<=	d5_s1(61);
			data(6)	<=	d6_s1(61);
			data(7)	<=	d7_s1(61);
			data(8)	<=	d0_s3(61);
			data(9)	<=	d1_s3(61);
			data(10)<=	d2_s3(61);
			data(11)<=	d3_s3(61);
			data(12)<=	d4_s3(61);
			data(13)<=	d5_s3(61);
			data(14)<=	d6_s3(61);
			data(15)<=	d7_s3(61);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(62);
			data(1)	<=	d1_s1(62);
			data(2)	<=	d2_s1(62);
			data(3)	<=	d3_s1(62);
			data(4)	<=	d4_s1(62);
			data(5)	<=	d5_s1(62);
			data(6)	<=	d6_s1(62);
			data(7)	<=	d7_s1(62);
			data(8)	<=	d0_s3(62);
			data(9)	<=	d1_s3(62);
			data(10)<=	d2_s3(62);
			data(11)<=	d3_s3(62);
			data(12)<=	d4_s3(62);
			data(13)<=	d5_s3(62);
			data(14)<=	d6_s3(62);
			data(15)<=	d7_s3(62);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s1(63);
			data(1)	<=	d1_s1(63);
			data(2)	<=	d2_s1(63);
			data(3)	<=	d3_s1(63);
			data(4)	<=	d4_s1(63);
			data(5)	<=	d5_s1(63);
			data(6)	<=	d6_s1(63);
			data(7)	<=	d7_s1(63);
			data(8)	<=	d0_s3(63);
			data(9)	<=	d1_s3(63);
			data(10)<=	d2_s3(63);
			data(11)<=	d3_s3(63);
			data(12)<=	d4_s3(63);
			data(13)<=	d5_s3(63);
			data(14)<=	d6_s3(63);
			data(15)<=	d7_s3(63);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(0);
			data(1)	<=	d1_s2(0);
			data(2)	<=	d2_s2(0);
			data(3)	<=	d3_s2(0);
			data(4)	<=	d4_s2(0);
			data(5)	<=	d5_s2(0);
			data(6)	<=	d6_s2(0);
			data(7)	<=	d7_s2(0);
			data(8)	<=	d0_s4(0);
			data(9)	<=	d1_s4(0);
			data(10)<=	d2_s4(0);
			data(11)<=	d3_s4(0);
			data(12)<=	d4_s4(0);
			data(13)<=	d5_s4(0);
			data(14)<=	d6_s4(0);
			data(15)<=	d7_s4(0);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(1);
			data(1)	<=	d1_s2(1);
			data(2)	<=	d2_s2(1);
			data(3)	<=	d3_s2(1);
			data(4)	<=	d4_s2(1);
			data(5)	<=	d5_s2(1);
			data(6)	<=	d6_s2(1);
			data(7)	<=	d7_s2(1);
			data(8)	<=	d0_s4(1);
			data(9)	<=	d1_s4(1);
			data(10)<=	d2_s4(1);
			data(11)<=	d3_s4(1);
			data(12)<=	d4_s4(1);
			data(13)<=	d5_s4(1);
			data(14)<=	d6_s4(1);
			data(15)<=	d7_s4(1);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(2);
			data(1)	<=	d1_s2(2);
			data(2)	<=	d2_s2(2);
			data(3)	<=	d3_s2(2);
			data(4)	<=	d4_s2(2);
			data(5)	<=	d5_s2(2);
			data(6)	<=	d6_s2(2);
			data(7)	<=	d7_s2(2);
			data(8)	<=	d0_s4(2);
			data(9)	<=	d1_s4(2);
			data(10)<=	d2_s4(2);
			data(11)<=	d3_s4(2);
			data(12)<=	d4_s4(2);
			data(13)<=	d5_s4(2);
			data(14)<=	d6_s4(2);
			data(15)<=	d7_s4(2);
			---------------------------------------------			
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(3);
			data(1)	<=	d1_s2(3);
			data(2)	<=	d2_s2(3);
			data(3)	<=	d3_s2(3);
			data(4)	<=	d4_s2(3);
			data(5)	<=	d5_s2(3);
			data(6)	<=	d6_s2(3);
			data(7)	<=	d7_s2(3);
			data(8)	<=	d0_s4(3);
			data(9)	<=	d1_s4(3);
			data(10)<=	d2_s4(3);
			data(11)<=	d3_s4(3);
			data(12)<=	d4_s4(3);
			data(13)<=	d5_s4(3);
			data(14)<=	d6_s4(3);
			data(15)<=	d7_s4(3);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(4);
			data(1)	<=	d1_s2(4);
			data(2)	<=	d2_s2(4);
			data(3)	<=	d3_s2(4);
			data(4)	<=	d4_s2(4);
			data(5)	<=	d5_s2(4);
			data(6)	<=	d6_s2(4);
			data(7)	<=	d7_s2(4);
			data(8)	<=	d0_s4(4);
			data(9)	<=	d1_s4(4);
			data(10)<=	d2_s4(4);
			data(11)<=	d3_s4(4);
			data(12)<=	d4_s4(4);
			data(13)<=	d5_s4(4);
			data(14)<=	d6_s4(4);
			data(15)<=	d7_s4(4);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(5);
			data(1)	<=	d1_s2(5);
			data(2)	<=	d2_s2(5);
			data(3)	<=	d3_s2(5);
			data(4)	<=	d4_s2(5);
			data(5)	<=	d5_s2(5);
			data(6)	<=	d6_s2(5);
			data(7)	<=	d7_s2(5);
			data(8)	<=	d0_s4(5);
			data(9)	<=	d1_s4(5);
			data(10)<=	d2_s4(5);
			data(11)<=	d3_s4(5);
			data(12)<=	d4_s4(5);
			data(13)<=	d5_s4(5);
			data(14)<=	d6_s4(5);
			data(15)<=	d7_s4(5);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(6);
			data(1)	<=	d1_s2(6);
			data(2)	<=	d2_s2(6);
			data(3)	<=	d3_s2(6);
			data(4)	<=	d4_s2(6);
			data(5)	<=	d5_s2(6);
			data(6)	<=	d6_s2(6);
			data(7)	<=	d7_s2(6);
			data(8)	<=	d0_s4(6);
			data(9)	<=	d1_s4(6);
			data(10)<=	d2_s4(6);
			data(11)<=	d3_s4(6);
			data(12)<=	d4_s4(6);
			data(13)<=	d5_s4(6);
			data(14)<=	d6_s4(6);
			data(15)<=	d7_s4(6);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(7);
			data(1)	<=	d1_s2(7);
			data(2)	<=	d2_s2(7);
			data(3)	<=	d3_s2(7);
			data(4)	<=	d4_s2(7);
			data(5)	<=	d5_s2(7);
			data(6)	<=	d6_s2(7);
			data(7)	<=	d7_s2(7);
			data(8)	<=	d0_s4(7);
			data(9)	<=	d1_s4(7);
			data(10)<=	d2_s4(7);
			data(11)<=	d3_s4(7);
			data(12)<=	d4_s4(7);
			data(13)<=	d5_s4(7);
			data(14)<=	d6_s4(7);
			data(15)<=	d7_s4(7);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(8);
			data(1)	<=	d1_s2(8);
			data(2)	<=	d2_s2(8);
			data(3)	<=	d3_s2(8);
			data(4)	<=	d4_s2(8);
			data(5)	<=	d5_s2(8);
			data(6)	<=	d6_s2(8);
			data(7)	<=	d7_s2(8);
			data(8)	<=	d0_s4(8);
			data(9)	<=	d1_s4(8);
			data(10)<=	d2_s4(8);
			data(11)<=	d3_s4(8);
			data(12)<=	d4_s4(8);
			data(13)<=	d5_s4(8);
			data(14)<=	d6_s4(8);
			data(15)<=	d7_s4(8);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(9);
			data(1)	<=	d1_s2(9);
			data(2)	<=	d2_s2(9);
			data(3)	<=	d3_s2(9);
			data(4)	<=	d4_s2(9);
			data(5)	<=	d5_s2(9);
			data(6)	<=	d6_s2(9);
			data(7)	<=	d7_s2(9);
			data(8)	<=	d0_s4(9);
			data(9)	<=	d1_s4(9);
			data(10)<=	d2_s4(9);
			data(11)<=	d3_s4(9);
			data(12)<=	d4_s4(9);
			data(13)<=	d5_s4(9);
			data(14)<=	d6_s4(9);
			data(15)<=	d7_s4(9);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(10);
			data(1)	<=	d1_s2(10);
			data(2)	<=	d2_s2(10);
			data(3)	<=	d3_s2(10);
			data(4)	<=	d4_s2(10);
			data(5)	<=	d5_s2(10);
			data(6)	<=	d6_s2(10);
			data(7)	<=	d7_s2(10);
			data(8)	<=	d0_s4(10);
			data(9)	<=	d1_s4(10);
			data(10)<=	d2_s4(10);
			data(11)<=	d3_s4(10);
			data(12)<=	d4_s4(10);
			data(13)<=	d5_s4(10);
			data(14)<=	d6_s4(10);
			data(15)<=	d7_s4(10);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(11);
			data(1)	<=	d1_s2(11);
			data(2)	<=	d2_s2(11);
			data(3)	<=	d3_s2(11);
			data(4)	<=	d4_s2(11);
			data(5)	<=	d5_s2(11);
			data(6)	<=	d6_s2(11);
			data(7)	<=	d7_s2(11);
			data(8)	<=	d0_s4(11);
			data(9)	<=	d1_s4(11);
			data(10)<=	d2_s4(11);
			data(11)<=	d3_s4(11);
			data(12)<=	d4_s4(11);
			data(13)<=	d5_s4(11);
			data(14)<=	d6_s4(11);
			data(15)<=	d7_s4(11);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(12);
			data(1)	<=	d1_s2(12);
			data(2)	<=	d2_s2(12);
			data(3)	<=	d3_s2(12);
			data(4)	<=	d4_s2(12);
			data(5)	<=	d5_s2(12);
			data(6)	<=	d6_s2(12);
			data(7)	<=	d7_s2(12);
			data(8)	<=	d0_s4(12);
			data(9)	<=	d1_s4(12);
			data(10)<=	d2_s4(12);
			data(11)<=	d3_s4(12);
			data(12)<=	d4_s4(12);
			data(13)<=	d5_s4(12);
			data(14)<=	d6_s4(12);
			data(15)<=	d7_s4(12);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(13);
			data(1)	<=	d1_s2(13);
			data(2)	<=	d2_s2(13);
			data(3)	<=	d3_s2(13);
			data(4)	<=	d4_s2(13);
			data(5)	<=	d5_s2(13);
			data(6)	<=	d6_s2(13);
			data(7)	<=	d7_s2(13);
			data(8)	<=	d0_s4(13);
			data(9)	<=	d1_s4(13);
			data(10)<=	d2_s4(13);
			data(11)<=	d3_s4(13);
			data(12)<=	d4_s4(13);
			data(13)<=	d5_s4(13);
			data(14)<=	d6_s4(13);
			data(15)<=	d7_s4(13);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(14);
			data(1)	<=	d1_s2(14);
			data(2)	<=	d2_s2(14);
			data(3)	<=	d3_s2(14);
			data(4)	<=	d4_s2(14);
			data(5)	<=	d5_s2(14);
			data(6)	<=	d6_s2(14);
			data(7)	<=	d7_s2(14);
			data(8)	<=	d0_s4(14);
			data(9)	<=	d1_s4(14);
			data(10)<=	d2_s4(14);
			data(11)<=	d3_s4(14);
			data(12)<=	d4_s4(14);
			data(13)<=	d5_s4(14);
			data(14)<=	d6_s4(14);
			data(15)<=	d7_s4(14);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(15);
			data(1)	<=	d1_s2(15);
			data(2)	<=	d2_s2(15);
			data(3)	<=	d3_s2(15);
			data(4)	<=	d4_s2(15);
			data(5)	<=	d5_s2(15);
			data(6)	<=	d6_s2(15);
			data(7)	<=	d7_s2(15);
			data(8)	<=	d0_s4(15);
			data(9)	<=	d1_s4(15);
			data(10)<=	d2_s4(15);
			data(11)<=	d3_s4(15);
			data(12)<=	d4_s4(15);
			data(13)<=	d5_s4(15);
			data(14)<=	d6_s4(15);
			data(15)<=	d7_s4(15);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(16);
			data(1)	<=	d1_s2(16);
			data(2)	<=	d2_s2(16);
			data(3)	<=	d3_s2(16);
			data(4)	<=	d4_s2(16);
			data(5)	<=	d5_s2(16);
			data(6)	<=	d6_s2(16);
			data(7)	<=	d7_s2(16);
			data(8)	<=	d0_s4(16);
			data(9)	<=	d1_s4(16);
			data(10)<=	d2_s4(16);
			data(11)<=	d3_s4(16);
			data(12)<=	d4_s4(16);
			data(13)<=	d5_s4(16);
			data(14)<=	d6_s4(16);
			data(15)<=	d7_s4(16);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(17);
			data(1)	<=	d1_s2(17);
			data(2)	<=	d2_s2(17);
			data(3)	<=	d3_s2(17);
			data(4)	<=	d4_s2(17);
			data(5)	<=	d5_s2(17);
			data(6)	<=	d6_s2(17);
			data(7)	<=	d7_s2(17);
			data(8)	<=	d0_s4(17);
			data(9)	<=	d1_s4(17);
			data(10)<=	d2_s4(17);
			data(11)<=	d3_s4(17);
			data(12)<=	d4_s4(17);
			data(13)<=	d5_s4(17);
			data(14)<=	d6_s4(17);
			data(15)<=	d7_s4(17);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(18);
			data(1)	<=	d1_s2(18);
			data(2)	<=	d2_s2(18);
			data(3)	<=	d3_s2(18);
			data(4)	<=	d4_s2(18);
			data(5)	<=	d5_s2(18);
			data(6)	<=	d6_s2(18);
			data(7)	<=	d7_s2(18);
			data(8)	<=	d0_s4(18);
			data(9)	<=	d1_s4(18);
			data(10)<=	d2_s4(18);
			data(11)<=	d3_s4(18);
			data(12)<=	d4_s4(18);
			data(13)<=	d5_s4(18);
			data(14)<=	d6_s4(18);
			data(15)<=	d7_s4(18);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(19);
			data(1)	<=	d1_s2(19);
			data(2)	<=	d2_s2(19);
			data(3)	<=	d3_s2(19);
			data(4)	<=	d4_s2(19);
			data(5)	<=	d5_s2(19);
			data(6)	<=	d6_s2(19);
			data(7)	<=	d7_s2(19);
			data(8)	<=	d0_s4(19);
			data(9)	<=	d1_s4(19);
			data(10)<=	d2_s4(19);
			data(11)<=	d3_s4(19);
			data(12)<=	d4_s4(19);
			data(13)<=	d5_s4(19);
			data(14)<=	d6_s4(19);
			data(15)<=	d7_s4(19);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(20);
			data(1)	<=	d1_s2(20);
			data(2)	<=	d2_s2(20);
			data(3)	<=	d3_s2(20);
			data(4)	<=	d4_s2(20);
			data(5)	<=	d5_s2(20);
			data(6)	<=	d6_s2(20);
			data(7)	<=	d7_s2(20);
			data(8)	<=	d0_s4(20);
			data(9)	<=	d1_s4(20);
			data(10)<=	d2_s4(20);
			data(11)<=	d3_s4(20);
			data(12)<=	d4_s4(20);
			data(13)<=	d5_s4(20);
			data(14)<=	d6_s4(20);
			data(15)<=	d7_s4(20);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(21);
			data(1)	<=	d1_s2(21);
			data(2)	<=	d2_s2(21);
			data(3)	<=	d3_s2(21);
			data(4)	<=	d4_s2(21);
			data(5)	<=	d5_s2(21);
			data(6)	<=	d6_s2(21);
			data(7)	<=	d7_s2(21);
			data(8)	<=	d0_s4(21);
			data(9)	<=	d1_s4(21);
			data(10)<=	d2_s4(21);
			data(11)<=	d3_s4(21);
			data(12)<=	d4_s4(21);
			data(13)<=	d5_s4(21);
			data(14)<=	d6_s4(21);
			data(15)<=	d7_s4(21);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(22);
			data(1)	<=	d1_s2(22);
			data(2)	<=	d2_s2(22);
			data(3)	<=	d3_s2(22);
			data(4)	<=	d4_s2(22);
			data(5)	<=	d5_s2(22);
			data(6)	<=	d6_s2(22);
			data(7)	<=	d7_s2(22);
			data(8)	<=	d0_s4(22);
			data(9)	<=	d1_s4(22);
			data(10)<=	d2_s4(22);
			data(11)<=	d3_s4(22);
			data(12)<=	d4_s4(22);
			data(13)<=	d5_s4(22);
			data(14)<=	d6_s4(22);
			data(15)<=	d7_s4(22);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(23);
			data(1)	<=	d1_s2(23);
			data(2)	<=	d2_s2(23);
			data(3)	<=	d3_s2(23);
			data(4)	<=	d4_s2(23);
			data(5)	<=	d5_s2(23);
			data(6)	<=	d6_s2(23);
			data(7)	<=	d7_s2(23);
			data(8)	<=	d0_s4(23);
			data(9)	<=	d1_s4(23);
			data(10)<=	d2_s4(23);
			data(11)<=	d3_s4(23);
			data(12)<=	d4_s4(23);
			data(13)<=	d5_s4(23);
			data(14)<=	d6_s4(23);
			data(15)<=	d7_s4(23);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(24);
			data(1)	<=	d1_s2(24);
			data(2)	<=	d2_s2(24);
			data(3)	<=	d3_s2(24);
			data(4)	<=	d4_s2(24);
			data(5)	<=	d5_s2(24);
			data(6)	<=	d6_s2(24);
			data(7)	<=	d7_s2(24);
			data(8)	<=	d0_s4(24);
			data(9)	<=	d1_s4(24);
			data(10)<=	d2_s4(24);
			data(11)<=	d3_s4(24);
			data(12)<=	d4_s4(24);
			data(13)<=	d5_s4(24);
			data(14)<=	d6_s4(24);
			data(15)<=	d7_s4(24);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(25);
			data(1)	<=	d1_s2(25);
			data(2)	<=	d2_s2(25);
			data(3)	<=	d3_s2(25);
			data(4)	<=	d4_s2(25);
			data(5)	<=	d5_s2(25);
			data(6)	<=	d6_s2(25);
			data(7)	<=	d7_s2(25);
			data(8)	<=	d0_s4(25);
			data(9)	<=	d1_s4(25);
			data(10)<=	d2_s4(25);
			data(11)<=	d3_s4(25);
			data(12)<=	d4_s4(25);
			data(13)<=	d5_s4(25);
			data(14)<=	d6_s4(25);
			data(15)<=	d7_s4(25);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(26);
			data(1)	<=	d1_s2(26);
			data(2)	<=	d2_s2(26);
			data(3)	<=	d3_s2(26);
			data(4)	<=	d4_s2(26);
			data(5)	<=	d5_s2(26);
			data(6)	<=	d6_s2(26);
			data(7)	<=	d7_s2(26);
			data(8)	<=	d0_s4(26);
			data(9)	<=	d1_s4(26);
			data(10)<=	d2_s4(26);
			data(11)<=	d3_s4(26);
			data(12)<=	d4_s4(26);
			data(13)<=	d5_s4(26);
			data(14)<=	d6_s4(26);
			data(15)<=	d7_s4(26);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(27);
			data(1)	<=	d1_s2(27);
			data(2)	<=	d2_s2(27);
			data(3)	<=	d3_s2(27);
			data(4)	<=	d4_s2(27);
			data(5)	<=	d5_s2(27);
			data(6)	<=	d6_s2(27);
			data(7)	<=	d7_s2(27);
			data(8)	<=	d0_s4(27);
			data(9)	<=	d1_s4(27);
			data(10)<=	d2_s4(27);
			data(11)<=	d3_s4(27);
			data(12)<=	d4_s4(27);
			data(13)<=	d5_s4(27);
			data(14)<=	d6_s4(27);
			data(15)<=	d7_s4(27);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(28);
			data(1)	<=	d1_s2(28);
			data(2)	<=	d2_s2(28);
			data(3)	<=	d3_s2(28);
			data(4)	<=	d4_s2(28);
			data(5)	<=	d5_s2(28);
			data(6)	<=	d6_s2(28);
			data(7)	<=	d7_s2(28);
			data(8)	<=	d0_s4(28);
			data(9)	<=	d1_s4(28);
			data(10)<=	d2_s4(28);
			data(11)<=	d3_s4(28);
			data(12)<=	d4_s4(28);
			data(13)<=	d5_s4(28);
			data(14)<=	d6_s4(28);
			data(15)<=	d7_s4(28);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(29);
			data(1)	<=	d1_s2(29);
			data(2)	<=	d2_s2(29);
			data(3)	<=	d3_s2(29);
			data(4)	<=	d4_s2(29);
			data(5)	<=	d5_s2(29);
			data(6)	<=	d6_s2(29);
			data(7)	<=	d7_s2(29);
			data(8)	<=	d0_s4(29);
			data(9)	<=	d1_s4(29);
			data(10)<=	d2_s4(29);
			data(11)<=	d3_s4(29);
			data(12)<=	d4_s4(29);
			data(13)<=	d5_s4(29);
			data(14)<=	d6_s4(29);
			data(15)<=	d7_s4(29);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(30);
			data(1)	<=	d1_s2(30);
			data(2)	<=	d2_s2(30);
			data(3)	<=	d3_s2(30);
			data(4)	<=	d4_s2(30);
			data(5)	<=	d5_s2(30);
			data(6)	<=	d6_s2(30);
			data(7)	<=	d7_s2(30);
			data(8)	<=	d0_s4(30);
			data(9)	<=	d1_s4(30);
			data(10)<=	d2_s4(30);
			data(11)<=	d3_s4(30);
			data(12)<=	d4_s4(30);
			data(13)<=	d5_s4(30);
			data(14)<=	d6_s4(30);
			data(15)<=	d7_s4(30);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(31);
			data(1)	<=	d1_s2(31);
			data(2)	<=	d2_s2(31);
			data(3)	<=	d3_s2(31);
			data(4)	<=	d4_s2(31);
			data(5)	<=	d5_s2(31);
			data(6)	<=	d6_s2(31);
			data(7)	<=	d7_s2(31);
			data(8)	<=	d0_s4(31);
			data(9)	<=	d1_s4(31);
			data(10)<=	d2_s4(31);
			data(11)<=	d3_s4(31);
			data(12)<=	d4_s4(31);
			data(13)<=	d5_s4(31);
			data(14)<=	d6_s4(31);
			data(15)<=	d7_s4(31);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(32);
			data(1)	<=	d1_s2(32);
			data(2)	<=	d2_s2(32);
			data(3)	<=	d3_s2(32);
			data(4)	<=	d4_s2(32);
			data(5)	<=	d5_s2(32);
			data(6)	<=	d6_s2(32);
			data(7)	<=	d7_s2(32);
			data(8)	<=	d0_s4(32);
			data(9)	<=	d1_s4(32);
			data(10)<=	d2_s4(32);
			data(11)<=	d3_s4(32);
			data(12)<=	d4_s4(32);
			data(13)<=	d5_s4(32);
			data(14)<=	d6_s4(32);
			data(15)<=	d7_s4(32);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(33);
			data(1)	<=	d1_s2(33);
			data(2)	<=	d2_s2(33);
			data(3)	<=	d3_s2(33);
			data(4)	<=	d4_s2(33);
			data(5)	<=	d5_s2(33);
			data(6)	<=	d6_s2(33);
			data(7)	<=	d7_s2(33);
			data(8)	<=	d0_s4(33);
			data(9)	<=	d1_s4(33);
			data(10)<=	d2_s4(33);
			data(11)<=	d3_s4(33);
			data(12)<=	d4_s4(33);
			data(13)<=	d5_s4(33);
			data(14)<=	d6_s4(33);
			data(15)<=	d7_s4(33);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(34);
			data(1)	<=	d1_s2(34);
			data(2)	<=	d2_s2(34);
			data(3)	<=	d3_s2(34);
			data(4)	<=	d4_s2(34);
			data(5)	<=	d5_s2(34);
			data(6)	<=	d6_s2(34);
			data(7)	<=	d7_s2(34);
			data(8)	<=	d0_s4(34);
			data(9)	<=	d1_s4(34);
			data(10)<=	d2_s4(34);
			data(11)<=	d3_s4(34);
			data(12)<=	d4_s4(34);
			data(13)<=	d5_s4(34);
			data(14)<=	d6_s4(34);
			data(15)<=	d7_s4(34);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(35);
			data(1)	<=	d1_s2(35);
			data(2)	<=	d2_s2(35);
			data(3)	<=	d3_s2(35);
			data(4)	<=	d4_s2(35);
			data(5)	<=	d5_s2(35);
			data(6)	<=	d6_s2(35);
			data(7)	<=	d7_s2(35);
			data(8)	<=	d0_s4(35);
			data(9)	<=	d1_s4(35);
			data(10)<=	d2_s4(35);
			data(11)<=	d3_s4(35);
			data(12)<=	d4_s4(35);
			data(13)<=	d5_s4(35);
			data(14)<=	d6_s4(35);
			data(15)<=	d7_s4(35);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(36);
			data(1)	<=	d1_s2(36);
			data(2)	<=	d2_s2(36);
			data(3)	<=	d3_s2(36);
			data(4)	<=	d4_s2(36);
			data(5)	<=	d5_s2(36);
			data(6)	<=	d6_s2(36);
			data(7)	<=	d7_s2(36);
			data(8)	<=	d0_s4(36);
			data(9)	<=	d1_s4(36);
			data(10)<=	d2_s4(36);
			data(11)<=	d3_s4(36);
			data(12)<=	d4_s4(36);
			data(13)<=	d5_s4(36);
			data(14)<=	d6_s4(36);
			data(15)<=	d7_s4(36);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(37);
			data(1)	<=	d1_s2(37);
			data(2)	<=	d2_s2(37);
			data(3)	<=	d3_s2(37);
			data(4)	<=	d4_s2(37);
			data(5)	<=	d5_s2(37);
			data(6)	<=	d6_s2(37);
			data(7)	<=	d7_s2(37);
			data(8)	<=	d0_s4(37);
			data(9)	<=	d1_s4(37);
			data(10)<=	d2_s4(37);
			data(11)<=	d3_s4(37);
			data(12)<=	d4_s4(37);
			data(13)<=	d5_s4(37);
			data(14)<=	d6_s4(37);
			data(15)<=	d7_s4(37);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(38);
			data(1)	<=	d1_s2(38);
			data(2)	<=	d2_s2(38);
			data(3)	<=	d3_s2(38);
			data(4)	<=	d4_s2(38);
			data(5)	<=	d5_s2(38);
			data(6)	<=	d6_s2(38);
			data(7)	<=	d7_s2(38);
			data(8)	<=	d0_s4(38);
			data(9)	<=	d1_s4(38);
			data(10)<=	d2_s4(38);
			data(11)<=	d3_s4(38);
			data(12)<=	d4_s4(38);
			data(13)<=	d5_s4(38);
			data(14)<=	d6_s4(38);
			data(15)<=	d7_s4(38);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(39);
			data(1)	<=	d1_s2(39);
			data(2)	<=	d2_s2(39);
			data(3)	<=	d3_s2(39);
			data(4)	<=	d4_s2(39);
			data(5)	<=	d5_s2(39);
			data(6)	<=	d6_s2(39);
			data(7)	<=	d7_s2(39);
			data(8)	<=	d0_s4(39);
			data(9)	<=	d1_s4(39);
			data(10)<=	d2_s4(39);
			data(11)<=	d3_s4(39);
			data(12)<=	d4_s4(39);
			data(13)<=	d5_s4(39);
			data(14)<=	d6_s4(39);
			data(15)<=	d7_s4(39);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(40);
			data(1)	<=	d1_s2(40);
			data(2)	<=	d2_s2(40);
			data(3)	<=	d3_s2(40);
			data(4)	<=	d4_s2(40);
			data(5)	<=	d5_s2(40);
			data(6)	<=	d6_s2(40);
			data(7)	<=	d7_s2(40);
			data(8)	<=	d0_s4(40);
			data(9)	<=	d1_s4(40);
			data(10)<=	d2_s4(40);
			data(11)<=	d3_s4(40);
			data(12)<=	d4_s4(40);
			data(13)<=	d5_s4(40);
			data(14)<=	d6_s4(40);
			data(15)<=	d7_s4(40);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(41);
			data(1)	<=	d1_s2(41);
			data(2)	<=	d2_s2(41);
			data(3)	<=	d3_s2(41);
			data(4)	<=	d4_s2(41);
			data(5)	<=	d5_s2(41);
			data(6)	<=	d6_s2(41);
			data(7)	<=	d7_s2(41);
			data(8)	<=	d0_s4(41);
			data(9)	<=	d1_s4(41);
			data(10)<=	d2_s4(41);
			data(11)<=	d3_s4(41);
			data(12)<=	d4_s4(41);
			data(13)<=	d5_s4(41);
			data(14)<=	d6_s4(41);
			data(15)<=	d7_s4(41);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(42);
			data(1)	<=	d1_s2(42);
			data(2)	<=	d2_s2(42);
			data(3)	<=	d3_s2(42);
			data(4)	<=	d4_s2(42);
			data(5)	<=	d5_s2(42);
			data(6)	<=	d6_s2(42);
			data(7)	<=	d7_s2(42);
			data(8)	<=	d0_s4(42);
			data(9)	<=	d1_s4(42);
			data(10)<=	d2_s4(42);
			data(11)<=	d3_s4(42);
			data(12)<=	d4_s4(42);
			data(13)<=	d5_s4(42);
			data(14)<=	d6_s4(42);
			data(15)<=	d7_s4(42);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(43);
			data(1)	<=	d1_s2(43);
			data(2)	<=	d2_s2(43);
			data(3)	<=	d3_s2(43);
			data(4)	<=	d4_s2(43);
			data(5)	<=	d5_s2(43);
			data(6)	<=	d6_s2(43);
			data(7)	<=	d7_s2(43);
			data(8)	<=	d0_s4(43);
			data(9)	<=	d1_s4(43);
			data(10)<=	d2_s4(43);
			data(11)<=	d3_s4(43);
			data(12)<=	d4_s4(43);
			data(13)<=	d5_s4(43);
			data(14)<=	d6_s4(43);
			data(15)<=	d7_s4(43);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(44);
			data(1)	<=	d1_s2(44);
			data(2)	<=	d2_s2(44);
			data(3)	<=	d3_s2(44);
			data(4)	<=	d4_s2(44);
			data(5)	<=	d5_s2(44);
			data(6)	<=	d6_s2(44);
			data(7)	<=	d7_s2(44);
			data(8)	<=	d0_s4(44);
			data(9)	<=	d1_s4(44);
			data(10)<=	d2_s4(44);
			data(11)<=	d3_s4(44);
			data(12)<=	d4_s4(44);
			data(13)<=	d5_s4(44);
			data(14)<=	d6_s4(44);
			data(15)<=	d7_s4(44);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(45);
			data(1)	<=	d1_s2(45);
			data(2)	<=	d2_s2(45);
			data(3)	<=	d3_s2(45);
			data(4)	<=	d4_s2(45);
			data(5)	<=	d5_s2(45);
			data(6)	<=	d6_s2(45);
			data(7)	<=	d7_s2(45);
			data(8)	<=	d0_s4(45);
			data(9)	<=	d1_s4(45);
			data(10)<=	d2_s4(45);
			data(11)<=	d3_s4(45);
			data(12)<=	d4_s4(45);
			data(13)<=	d5_s4(45);
			data(14)<=	d6_s4(45);
			data(15)<=	d7_s4(45);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(46);
			data(1)	<=	d1_s2(46);
			data(2)	<=	d2_s2(46);
			data(3)	<=	d3_s2(46);
			data(4)	<=	d4_s2(46);
			data(5)	<=	d5_s2(46);
			data(6)	<=	d6_s2(46);
			data(7)	<=	d7_s2(46);
			data(8)	<=	d0_s4(46);
			data(9)	<=	d1_s4(46);
			data(10)<=	d2_s4(46);
			data(11)<=	d3_s4(46);
			data(12)<=	d4_s4(46);
			data(13)<=	d5_s4(46);
			data(14)<=	d6_s4(46);
			data(15)<=	d7_s4(46);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(47);
			data(1)	<=	d1_s2(47);
			data(2)	<=	d2_s2(47);
			data(3)	<=	d3_s2(47);
			data(4)	<=	d4_s2(47);
			data(5)	<=	d5_s2(47);
			data(6)	<=	d6_s2(47);
			data(7)	<=	d7_s2(47);
			data(8)	<=	d0_s4(47);
			data(9)	<=	d1_s4(47);
			data(10)<=	d2_s4(47);
			data(11)<=	d3_s4(47);
			data(12)<=	d4_s4(47);
			data(13)<=	d5_s4(47);
			data(14)<=	d6_s4(47);
			data(15)<=	d7_s4(47);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(48);
			data(1)	<=	d1_s2(48);
			data(2)	<=	d2_s2(48);
			data(3)	<=	d3_s2(48);
			data(4)	<=	d4_s2(48);
			data(5)	<=	d5_s2(48);
			data(6)	<=	d6_s2(48);
			data(7)	<=	d7_s2(48);
			data(8)	<=	d0_s4(48);
			data(9)	<=	d1_s4(48);
			data(10)<=	d2_s4(48);
			data(11)<=	d3_s4(48);
			data(12)<=	d4_s4(48);
			data(13)<=	d5_s4(48);
			data(14)<=	d6_s4(48);
			data(15)<=	d7_s4(48);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(49);
			data(1)	<=	d1_s2(49);
			data(2)	<=	d2_s2(49);
			data(3)	<=	d3_s2(49);
			data(4)	<=	d4_s2(49);
			data(5)	<=	d5_s2(49);
			data(6)	<=	d6_s2(49);
			data(7)	<=	d7_s2(49);
			data(8)	<=	d0_s4(49);
			data(9)	<=	d1_s4(49);
			data(10)<=	d2_s4(49);
			data(11)<=	d3_s4(49);
			data(12)<=	d4_s4(49);
			data(13)<=	d5_s4(49);
			data(14)<=	d6_s4(49);
			data(15)<=	d7_s4(49);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(50);
			data(1)	<=	d1_s2(50);
			data(2)	<=	d2_s2(50);
			data(3)	<=	d3_s2(50);
			data(4)	<=	d4_s2(50);
			data(5)	<=	d5_s2(50);
			data(6)	<=	d6_s2(50);
			data(7)	<=	d7_s2(50);
			data(8)	<=	d0_s4(50);
			data(9)	<=	d1_s4(50);
			data(10)<=	d2_s4(50);
			data(11)<=	d3_s4(50);
			data(12)<=	d4_s4(50);
			data(13)<=	d5_s4(50);
			data(14)<=	d6_s4(50);
			data(15)<=	d7_s4(50);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(51);
			data(1)	<=	d1_s2(51);
			data(2)	<=	d2_s2(51);
			data(3)	<=	d3_s2(51);
			data(4)	<=	d4_s2(51);
			data(5)	<=	d5_s2(51);
			data(6)	<=	d6_s2(51);
			data(7)	<=	d7_s2(51);
			data(8)	<=	d0_s4(51);
			data(9)	<=	d1_s4(51);
			data(10)<=	d2_s4(51);
			data(11)<=	d3_s4(51);
			data(12)<=	d4_s4(51);
			data(13)<=	d5_s4(51);
			data(14)<=	d6_s4(51);
			data(15)<=	d7_s4(51);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(52);
			data(1)	<=	d1_s2(52);
			data(2)	<=	d2_s2(52);
			data(3)	<=	d3_s2(52);
			data(4)	<=	d4_s2(52);
			data(5)	<=	d5_s2(52);
			data(6)	<=	d6_s2(52);
			data(7)	<=	d7_s2(52);
			data(8)	<=	d0_s4(52);
			data(9)	<=	d1_s4(52);
			data(10)<=	d2_s4(52);
			data(11)<=	d3_s4(52);
			data(12)<=	d4_s4(52);
			data(13)<=	d5_s4(52);
			data(14)<=	d6_s4(52);
			data(15)<=	d7_s4(52);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(53);
			data(1)	<=	d1_s2(53);
			data(2)	<=	d2_s2(53);
			data(3)	<=	d3_s2(53);
			data(4)	<=	d4_s2(53);
			data(5)	<=	d5_s2(53);
			data(6)	<=	d6_s2(53);
			data(7)	<=	d7_s2(53);
			data(8)	<=	d0_s4(53);
			data(9)	<=	d1_s4(53);
			data(10)<=	d2_s4(53);
			data(11)<=	d3_s4(53);
			data(12)<=	d4_s4(53);
			data(13)<=	d5_s4(53);
			data(14)<=	d6_s4(53);
			data(15)<=	d7_s4(53);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(54);
			data(1)	<=	d1_s2(54);
			data(2)	<=	d2_s2(54);
			data(3)	<=	d3_s2(54);
			data(4)	<=	d4_s2(54);
			data(5)	<=	d5_s2(54);
			data(6)	<=	d6_s2(54);
			data(7)	<=	d7_s2(54);
			data(8)	<=	d0_s4(54);
			data(9)	<=	d1_s4(54);
			data(10)<=	d2_s4(54);
			data(11)<=	d3_s4(54);
			data(12)<=	d4_s4(54);
			data(13)<=	d5_s4(54);
			data(14)<=	d6_s4(54);
			data(15)<=	d7_s4(54);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(55);
			data(1)	<=	d1_s2(55);
			data(2)	<=	d2_s2(55);
			data(3)	<=	d3_s2(55);
			data(4)	<=	d4_s2(55);
			data(5)	<=	d5_s2(55);
			data(6)	<=	d6_s2(55);
			data(7)	<=	d7_s2(55);
			data(8)	<=	d0_s4(55);
			data(9)	<=	d1_s4(55);
			data(10)<=	d2_s4(55);
			data(11)<=	d3_s4(55);
			data(12)<=	d4_s4(55);
			data(13)<=	d5_s4(55);
			data(14)<=	d6_s4(55);
			data(15)<=	d7_s4(55);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(56);
			data(1)	<=	d1_s2(56);
			data(2)	<=	d2_s2(56);
			data(3)	<=	d3_s2(56);
			data(4)	<=	d4_s2(56);
			data(5)	<=	d5_s2(56);
			data(6)	<=	d6_s2(56);
			data(7)	<=	d7_s2(56);
			data(8)	<=	d0_s4(56);
			data(9)	<=	d1_s4(56);
			data(10)<=	d2_s4(56);
			data(11)<=	d3_s4(56);
			data(12)<=	d4_s4(56);
			data(13)<=	d5_s4(56);
			data(14)<=	d6_s4(56);
			data(15)<=	d7_s4(56);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(57);
			data(1)	<=	d1_s2(57);
			data(2)	<=	d2_s2(57);
			data(3)	<=	d3_s2(57);
			data(4)	<=	d4_s2(57);
			data(5)	<=	d5_s2(57);
			data(6)	<=	d6_s2(57);
			data(7)	<=	d7_s2(57);
			data(8)	<=	d0_s4(57);
			data(9)	<=	d1_s4(57);
			data(10)<=	d2_s4(57);
			data(11)<=	d3_s4(57);
			data(12)<=	d4_s4(57);
			data(13)<=	d5_s4(57);
			data(14)<=	d6_s4(57);
			data(15)<=	d7_s4(57);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(58);
			data(1)	<=	d1_s2(58);
			data(2)	<=	d2_s2(58);
			data(3)	<=	d3_s2(58);
			data(4)	<=	d4_s2(58);
			data(5)	<=	d5_s2(58);
			data(6)	<=	d6_s2(58);
			data(7)	<=	d7_s2(58);
			data(8)	<=	d0_s4(58);
			data(9)	<=	d1_s4(58);
			data(10)<=	d2_s4(58);
			data(11)<=	d3_s4(58);
			data(12)<=	d4_s4(58);
			data(13)<=	d5_s4(58);
			data(14)<=	d6_s4(58);
			data(15)<=	d7_s4(58);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(59);
			data(1)	<=	d1_s2(59);
			data(2)	<=	d2_s2(59);
			data(3)	<=	d3_s2(59);
			data(4)	<=	d4_s2(59);
			data(5)	<=	d5_s2(59);
			data(6)	<=	d6_s2(59);
			data(7)	<=	d7_s2(59);
			data(8)	<=	d0_s4(59);
			data(9)	<=	d1_s4(59);
			data(10)<=	d2_s4(59);
			data(11)<=	d3_s4(59);
			data(12)<=	d4_s4(59);
			data(13)<=	d5_s4(59);
			data(14)<=	d6_s4(59);
			data(15)<=	d7_s4(59);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(60);
			data(1)	<=	d1_s2(60);
			data(2)	<=	d2_s2(60);
			data(3)	<=	d3_s2(60);
			data(4)	<=	d4_s2(60);
			data(5)	<=	d5_s2(60);
			data(6)	<=	d6_s2(60);
			data(7)	<=	d7_s2(60);
			data(8)	<=	d0_s4(60);
			data(9)	<=	d1_s4(60);
			data(10)<=	d2_s4(60);
			data(11)<=	d3_s4(60);
			data(12)<=	d4_s4(60);
			data(13)<=	d5_s4(60);
			data(14)<=	d6_s4(60);
			data(15)<=	d7_s4(60);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(61);
			data(1)	<=	d1_s2(61);
			data(2)	<=	d2_s2(61);
			data(3)	<=	d3_s2(61);
			data(4)	<=	d4_s2(61);
			data(5)	<=	d5_s2(61);
			data(6)	<=	d6_s2(61);
			data(7)	<=	d7_s2(61);
			data(8)	<=	d0_s4(61);
			data(9)	<=	d1_s4(61);
			data(10)<=	d2_s4(61);
			data(11)<=	d3_s4(61);
			data(12)<=	d4_s4(61);
			data(13)<=	d5_s4(61);
			data(14)<=	d6_s4(61);
			data(15)<=	d7_s4(61);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(62);
			data(1)	<=	d1_s2(62);
			data(2)	<=	d2_s2(62);
			data(3)	<=	d3_s2(62);
			data(4)	<=	d4_s2(62);
			data(5)	<=	d5_s2(62);
			data(6)	<=	d6_s2(62);
			data(7)	<=	d7_s2(62);
			data(8)	<=	d0_s4(62);
			data(9)	<=	d1_s4(62);
			data(10)<=	d2_s4(62);
			data(11)<=	d3_s4(62);
			data(12)<=	d4_s4(62);
			data(13)<=	d5_s4(62);
			data(14)<=	d6_s4(62);
			data(15)<=	d7_s4(62);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data(0)	<=	d0_s2(63);
			data(1)	<=	d1_s2(63);
			data(2)	<=	d2_s2(63);
			data(3)	<=	d3_s2(63);
			data(4)	<=	d4_s2(63);
			data(5)	<=	d5_s2(63);
			data(6)	<=	d6_s2(63);
			data(7)	<=	d7_s2(63);
			data(8)	<=	d0_s4(63);
			data(9)	<=	d1_s4(63);
			data(10)<=	d2_s4(63);
			data(11)<=	d3_s4(63);
			data(12)<=	d4_s4(63);
			data(13)<=	d5_s4(63);
			data(14)<=	d6_s4(63);
			data(15)<=	d7_s4(63);
			---------------------------------------------------
			wait for period;
	       end loop;---------------------------------EC0,EC1,EC2
			
			frame_s0		<= '0';
			wait for 116*period;
			
		end loop;
				
		wait for 100000*period;
		FILE_CLOSE(file_in_ec);
		
	end process;
	
	gen_sum128:process
		variable	d_gtu_gen   :	integer;
		variable    d_n_auto	:	integer;
		variable	d_s_auto	:	integer;
		variable	d_avg_thr   :   integer;
		variable    d_gtu		:	integer;
		variable    d_line	    :	integer;
		variable	d_col		:	integer;
		variable	d_value	    :	integer;
		variable	line_out	:	line;
		FILE		file_out	:	text;
	begin
		FILE_OPEN(file_out,"Data_OUT_EC.txt",WRITE_MODE);
		loop
			wait for period_axi;
			if (m_axis_tvalid = '1') then
				d_value:= conv_integer(m_axis_tdata(14 downto 0));
				write(line_out,d_value);
				writeline(file_out,line_out);
				d_value:= conv_integer(m_axis_tdata(29 downto 15));
				write(line_out,d_value);
				writeline(file_out,line_out);
				if (m_axis_tlast = '1') then
				    writeline(file_out,line_out);
				end if;
				
				m_axis_tready	<=	'1';
				wait for period_axi;
				m_axis_tready	<=	'0';
				wait for period_axi;
			end if;
		end loop;
		FILE_CLOSE(file_out);
	end process;
	
	gen_event:process
		variable    Ngtu		:	integer;
		variable	line_out_e	:	line;
		FILE		file_out_e	:	text;
	begin
		FILE_OPEN(file_out_e,"Data_EVENT.txt",WRITE_MODE);
		loop
			wait for period;
			if (l1_event = '1') then
				Ngtu:= conv_integer(gtu_cnt_s1);
				write(line_out_e,Ngtu);
				writeline(file_out_e,line_out_e);
			end if;
		end loop;
		FILE_CLOSE(file_out_e);
	end process;
	
	
  --  End Test Bench 
  END;
