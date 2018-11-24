-- MINIEUSO TestBench Template M.Mignone 10/2016
--INFN Torino

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.std_logic_arith.ALL;
  USE ieee.std_logic_unsigned.ALL;
  --USE ieee.numeric_std.ALL;
  USE	ieee.std_logic_textio.ALL;
  use STD.textio.ALL;


    ENTITY DATAGENERATOR is
    generic (file_name: integer;
            period: time;
            period_axi: time;
            delay: time;
            delay_data: time);
    PORT(
        CLOCK_200			:	in	    std_logic;
		--------------------------EUSO-TA-------------------
		DATA			    :	out	    std_logic_vector(15 downto 0);
		FRAME			    :	out	    std_logic;
		------------------------------------------------------
		--FIFO L1 SUM128
		s_aresetn_L1		:	out		std_logic;
		m_aclk_L1			:	in		std_logic;
		m_axis_tvalid_L1 	:	in	    std_logic;
		m_axis_tready_L1	: 	out		std_logic;
		m_axis_tdata_L1	    : 	in	    std_logic_vector(31 downto 0);
        m_axis_tlast_L1     :   in      std_logic
		);
    END DATAGENERATOR;
	
architecture arch_DATAGENERATOR of DATAGENERATOR is

--	SIGNAL	gtu_cnt_s1		:	std_logic_vector(31 downto 0);--ABSOLUTE GTU NUMBER

	SIGNAL 	s_aresetn_l1_s 	:   std_logic :='1';
--	SIGNAL 	s_aresetn_cmd_s :   std_logic :='1';
--	SIGNAL 	s_aresetn_ev_s 	:   std_logic :='1';
--	SIGNAL	clock			:	std_logic :='0';
--	SIGNAL	clock_axi		:	std_logic :='0';
	SIGNAL  frame_s         :	std_logic :='0';
	
	SIGNAL	clock_axi_s		:	std_logic :='0';
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
	SIGNAL	data_s			:	std_logic_vector(15 downto 0) := ( others => '0');
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
	SIGNAL	m_axis_tready_l1_s	:	std_logic := '0';
	SIGNAL	m_axis_tdata_l1_s	    :	std_logic_vector(31 downto 0);
	SIGNAL	m_axis_tlast_l1_s	    :	std_logic;
	
--	SIGNAL	m_axis_tready_ev_s	:	std_logic := '0';
--    SIGNAL  m_axis_tvalid_ev_s    :   std_logic;
--    SIGNAL  m_axis_tdata_ev_s     :   std_logic_vector(31 downto 0);
--    SIGNAL  m_axis_tlast_ev_s     :   std_logic;
    
--    --AXI4 Stream FIFO (COMMAND IN)
--    SIGNAL  s_axis_tvalid_cmd_s   :   STD_LOGIC := '0';
--    SIGNAL  s_axis_tready_cmd_s   :   STD_LOGIC;
--    SIGNAL  s_axis_tdata_cmd_s    :   STD_LOGIC_VECTOR(31 DOWNTO 0);
			 
--	CONSTANT period			: 	time := 5 ns;
--	CONSTANT delay			:	time := 10 ns;
--	CONSTANT delay_data	    :	time := 2.5 ns;
	
--	-------------------------------------------
--	--Test with DDR data
--	CONSTANT period			: 	time:= 10 ns;
--  CONSTANT delay          :   time := 20 ns;
--  CONSTANT delay_data     :   time := 5 ns;
--  -----------------------------------------------
	
--	CONSTANT period_axi		: 	time := 10 ns;
	
--	-----------------------------------------------
--	--Test with DDR data
--	CONSTANT period_axi		: 	time:= 20 ns;
--  CONSTANT period_l2      :   time:= 50 ns;
--  ------------------------------------------------
				
BEGIN
--        clock_200           <= clock;
        data                <= data_s;
        frame               <= frame_s;
        s_aresetn_L1        <= s_aresetn_L1_s;
--        m_aclk_L1           <= clock_axi;
        m_axis_tready_L1    <= m_axis_tready_L1_s;
        m_axis_tdata_L1_s   <= m_axis_tdata_L1;
        m_axis_tlast_L1_s   <= m_axis_tlast_L1;

--		clock	<=	not clock after period/2;
		
		
--		clock_axi <= not clock_axi after period_axi/2;
		
--		s_aresetn_l1	<=	transport '1',
--				'0' after delay/8,
--				'1' after delay/8 + 10 ns;
		
--		s_aresetn_l2	<=	transport '1',
--                '0' after delay/8,
--                '1' after delay/8 + 10 ns;
                
        s_aresetn_l1_s	<=	transport '1',
                '0' after delay/8,
                '1' after 150 ns;
                
--        s_aresetn_ev_s    <=    transport '1',
--                '0' after delay/8,
--                '1' after 150 ns;
--        s_aresetn_cmd_s    <=    transport '1',
--                '0' after delay/8,
--                '1' after 150 ns;
				

		gen_I_ec:process
		variable p0_s1,p1_s1,p2_s1,p3_s1,p4_s1,p5_s1,p6_s1,p7_s1	: integer;
		variable p0_s2,p1_s2,p2_s2,p3_s2,p4_s2,p5_s2,p6_s2,p7_s2	: integer;
		variable p0_s3,p1_s3,p2_s3,p3_s3,p4_s3,p5_s3,p6_s3,p7_s3	: integer;
		variable p0_s4,p1_s4,p2_s4,p3_s4,p4_s4,p5_s4,p6_s4,p7_s4	: integer;
		variable line_in_ec	:	line;
		FILE	 file_in_ec	:	text;
	begin
	    case (file_name) is
            when 0 =>
                FILE_OPEN(file_in_ec,"Data_IN_EC0EC1EC2.txt",READ_MODE);
            when 1 =>
                FILE_OPEN(file_in_ec,"Data_IN_EC3EC4EC5.txt",READ_MODE);
            when 2 =>
                FILE_OPEN(file_in_ec,"Data_IN_EC6EC7EC8.txt",READ_MODE);    
           when others =>
               null;
        end case;
        
--		FILE_OPEN(file_in_ec,"Data_IN.txt",READ_MODE);
--		gtu_cnt_s1	<= "00000000000000000000000000000000";
		
		wait for 58.5*period;
		wait for delay_data;
		
		while not endfile(file_in_ec) loop
--		  gtu_cnt_s1	<= gtu_cnt_s1 + 1; --Only for DEBUG
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
			wait for period;
			--Only for debug
--			if ( I = 0) then
--                gtu_cnt_s1	<= gtu_cnt_s1 + 1; --Only for DEBUG 
--            end if;
			-------------------MINIEUSO----------------
			data_s(0)	 <=	d0_s1(0);
			data_s(1)  <=	d1_s1(0);
			data_s(2)	 <=	d2_s1(0);
			data_s(3)	 <=	d3_s1(0);
			data_s(4)	 <=	d4_s1(0);
			data_s(5)	 <=	d5_s1(0);
			data_s(6)	 <=	d6_s1(0);
			data_s(7)	 <=	d7_s1(0);
			data_s(8)	 <=	d0_s3(0);
			data_s(9)	 <=	d1_s3(0);
			data_s(10) <=	d2_s3(0);
			data_s(11) <=	d3_s3(0);
			data_s(12) <=	d4_s3(0);
			data_s(13) <=	d5_s3(0);
			data_s(14) <=	d6_s3(0);
			data_s(15) <=	d7_s3(0);
			frame_s <= '1';
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	 <=	d0_s1(1);
			data_s(1)	 <=	d1_s1(1);
			data_s(2)	 <=	d2_s1(1);
			data_s(3)	 <=	d3_s1(1);
			data_s(4)	 <=	d4_s1(1);
			data_s(5)	 <=	d5_s1(1);
			data_s(6)	 <=	d6_s1(1);
			data_s(7)	 <=	d7_s1(1);
			data_s(8)	 <=	d0_s3(1);
			data_s(9)	 <=	d1_s3(1);
			data_s(10) <=	d2_s3(1);
			data_s(11) <=	d3_s3(1);
			data_s(12) <=	d4_s3(1);
			data_s(13) <=	d5_s3(1);
			data_s(14) <=	d6_s3(1);
			data_s(15) <=	d7_s3(1);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	 <=	d0_s1(2);
			data_s(1)	 <=	d1_s1(2);
			data_s(2)	 <=	d2_s1(2);
			data_s(3)	 <=	d3_s1(2);
			data_s(4)	 <=	d4_s1(2);
			data_s(5)	 <=	d5_s1(2);
			data_s(6)	 <=	d6_s1(2);
			data_s(7)	 <=	d7_s1(2);
			data_s(8)	 <=	d0_s3(2);
			data_s(9)	 <=	d1_s3(2);
			data_s(10) <=	d2_s3(2);
			data_s(11) <=	d3_s3(2);
			data_s(12) <=	d4_s3(2);
			data_s(13) <=	d5_s3(2);
			data_s(14) <=	d6_s3(2);
			data_s(15) <=	d7_s3(2);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	 <=	d0_s1(3);
			data_s(1)	 <=	d1_s1(3);
			data_s(2)	 <=	d2_s1(3);
			data_s(3)	 <=	d3_s1(3);
			data_s(4)	 <=	d4_s1(3);
			data_s(5)	 <=	d5_s1(3);
			data_s(6)	 <=	d6_s1(3);
			data_s(7)	 <=	d7_s1(3);
			data_s(8)	 <=	d0_s3(3);
			data_s(9)	 <=	d1_s3(3);
			data_s(10) <=	d2_s3(3);
			data_s(11) <=	d3_s3(3);
			data_s(12) <=	d4_s3(3);
			data_s(13) <=	d5_s3(3);
			data_s(14) <=	d6_s3(3);
			data_s(15) <=	d7_s3(3);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	 <=	d0_s1(4);
			data_s(1)	 <=	d1_s1(4);
			data_s(2)	 <=	d2_s1(4);
			data_s(3)	 <=	d3_s1(4);
			data_s(4)	 <=	d4_s1(4);
			data_s(5)	 <=	d5_s1(4);
			data_s(6)	 <=	d6_s1(4);
			data_s(7)	 <=	d7_s1(4);
			data_s(8)	 <=	d0_s3(4);
			data_s(9)	 <=	d1_s3(4);
			data_s(10) <=	d2_s3(4);
			data_s(11) <=	d3_s3(4);
			data_s(12) <=	d4_s3(4);
			data_s(13) <=	d5_s3(4);
			data_s(14) <=	d6_s3(4);
			data_s(15) <=	d7_s3(4);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	 <=	d0_s1(5);
			data_s(1)	 <=	d1_s1(5);
			data_s(2)	 <=	d2_s1(5);
			data_s(3)	 <=	d3_s1(5);
			data_s(4)	 <=	d4_s1(5);
			data_s(5)	 <=	d5_s1(5);
			data_s(6)	 <=	d6_s1(5);
			data_s(7)	 <=	d7_s1(5);
			data_s(8)	 <=	d0_s3(5);
			data_s(9)	 <=	d1_s3(5);
			data_s(10) <=	d2_s3(5);
			data_s(11) <=	d3_s3(5);
			data_s(12) <=	d4_s3(5);
			data_s(13) <=	d5_s3(5);
			data_s(14) <=	d6_s3(5);
			data_s(15) <=	d7_s3(5);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	 <=	d0_s1(6);
			data_s(1)	 <=	d1_s1(6);
			data_s(2)	 <=	d2_s1(6);
			data_s(3)	 <=	d3_s1(6);
			data_s(4)	 <=	d4_s1(6);
			data_s(5)	 <=	d5_s1(6);
			data_s(6)	 <=	d6_s1(6);
			data_s(7)	 <=	d7_s1(6);
			data_s(8)	 <=	d0_s3(6);
			data_s(9)	 <=	d1_s3(6);
			data_s(10) <=	d2_s3(6);
			data_s(11) <=	d3_s3(6);
			data_s(12) <=	d4_s3(6);
			data_s(13) <=	d5_s3(6);
			data_s(14) <=	d6_s3(6);
			data_s(15) <=	d7_s3(6);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	 <=	d0_s1(7);
			data_s(1)	 <=	d1_s1(7);
			data_s(2)	 <=	d2_s1(7);
			data_s(3)	 <=	d3_s1(7);
			data_s(4)	 <=	d4_s1(7);
			data_s(5)	 <=	d5_s1(7);
			data_s(6)	 <=	d6_s1(7);
			data_s(7)	 <=	d7_s1(7);
			data_s(8)	 <=	d0_s3(7);
			data_s(9)	 <=	d1_s3(7);
			data_s(10) <=	d2_s3(7);
			data_s(11) <=	d3_s3(7);
			data_s(12) <=	d4_s3(7);
			data_s(13) <=	d5_s3(7);
			data_s(14) <=	d6_s3(7);
			data_s(15) <=	d7_s3(7);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	 <=	d0_s1(8);
			data_s(1)	 <=	d1_s1(8);
			data_s(2)	 <=	d2_s1(8);
			data_s(3)	 <=	d3_s1(8);
			data_s(4)	 <=	d4_s1(8);
			data_s(5)	 <=	d5_s1(8);
			data_s(6)	 <=	d6_s1(8);
			data_s(7)	 <=	d7_s1(8);
			data_s(8)	 <=	d0_s3(8);
			data_s(9)	 <=	d1_s3(8);
			data_s(10) <=	d2_s3(8);
			data_s(11) <=	d3_s3(8);
			data_s(12) <=	d4_s3(8);
			data_s(13) <=	d5_s3(8);
			data_s(14) <=	d6_s3(8);
			data_s(15) <=	d7_s3(8);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	 <=	d0_s1(9);
			data_s(1)	 <=	d1_s1(9);
			data_s(2)	 <=	d2_s1(9);
			data_s(3)	 <=	d3_s1(9);
			data_s(4)	 <=	d4_s1(9);
			data_s(5)	 <=	d5_s1(9);
			data_s(6)	 <=	d6_s1(9);
			data_s(7)	 <=	d7_s1(9);
			data_s(8)	 <=	d0_s3(9);
			data_s(9)	 <=	d1_s3(9);
			data_s(10) <=	d2_s3(9);
			data_s(11) <=	d3_s3(9);
			data_s(12) <=	d4_s3(9);
			data_s(13) <=	d5_s3(9);
			data_s(14) <=	d6_s3(9);
			data_s(15) <=	d7_s3(9);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	 <=	d0_s1(10);
			data_s(1)	 <=	d1_s1(10);
			data_s(2)	 <=	d2_s1(10);
			data_s(3)	 <=	d3_s1(10);
			data_s(4)	 <=	d4_s1(10);
			data_s(5)	 <=	d5_s1(10);
			data_s(6)	 <=	d6_s1(10);
			data_s(7)	 <=	d7_s1(10);
			data_s(8)	 <=	d0_s3(10);
			data_s(9)	 <=	d1_s3(10);
			data_s(10) <=	d2_s3(10);
			data_s(11) <=	d3_s3(10);
			data_s(12) <=	d4_s3(10);
			data_s(13) <=	d5_s3(10);
			data_s(14) <=	d6_s3(10);
			data_s(15) <=	d7_s3(10);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	 <=	d0_s1(11);
			data_s(1)	 <=	d1_s1(11);
			data_s(2)	 <=	d2_s1(11);
			data_s(3)	 <=	d3_s1(11);
			data_s(4)	 <=	d4_s1(11);
			data_s(5)	 <=	d5_s1(11);
			data_s(6)	 <=	d6_s1(11);
			data_s(7)	 <=	d7_s1(11);
			data_s(8)	 <=	d0_s3(11);
			data_s(9)	 <=	d1_s3(11);
			data_s(10) <=	d2_s3(11);
			data_s(11) <=	d3_s3(11);
			data_s(12) <=	d4_s3(11);
			data_s(13) <=	d5_s3(11);
			data_s(14) <=	d6_s3(11);
			data_s(15) <=	d7_s3(11);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(12);
			data_s(1)	<=	d1_s1(12);
			data_s(2)	<=	d2_s1(12);
			data_s(3)	<=	d3_s1(12);
			data_s(4)	<=	d4_s1(12);
			data_s(5)	<=	d5_s1(12);
			data_s(6)	<=	d6_s1(12);
			data_s(7)	<=	d7_s1(12);
			data_s(8)	<=	d0_s3(12);
			data_s(9)	<=	d1_s3(12);
			data_s(10)<=	d2_s3(12);
			data_s(11)<=	d3_s3(12);
			data_s(12)<=	d4_s3(12);
			data_s(13)<=	d5_s3(12);
			data_s(14)<=	d6_s3(12);
			data_s(15)<=	d7_s3(12);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(13);
			data_s(1)	<=	d1_s1(13);
			data_s(2)	<=	d2_s1(13);
			data_s(3)	<=	d3_s1(13);
			data_s(4)	<=	d4_s1(13);
			data_s(5)	<=	d5_s1(13);
			data_s(6)	<=	d6_s1(13);
			data_s(7)	<=	d7_s1(13);
			data_s(8)	<=	d0_s3(13);
			data_s(9)	<=	d1_s3(13);
			data_s(10)<=	d2_s3(13);
			data_s(11)<=	d3_s3(13);
			data_s(12)<=	d4_s3(13);
			data_s(13)<=	d5_s3(13);
			data_s(14)<=	d6_s3(13);
			data_s(15)<=	d7_s3(13);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(14);
			data_s(1)	<=	d1_s1(14);
			data_s(2)	<=	d2_s1(14);
			data_s(3)	<=	d3_s1(14);
			data_s(4)	<=	d4_s1(14);
			data_s(5)	<=	d5_s1(14);
			data_s(6)	<=	d6_s1(14);
			data_s(7)	<=	d7_s1(14);
			data_s(8)	<=	d0_s3(14);
			data_s(9)	<=	d1_s3(14);
			data_s(10)<=	d2_s3(14);
			data_s(11)<=	d3_s3(14);
			data_s(12)<=	d4_s3(14);
			data_s(13)<=	d5_s3(14);
			data_s(14)<=	d6_s3(14);
			data_s(15)<=	d7_s3(14);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(15);
			data_s(1)	<=	d1_s1(15);
			data_s(2)	<=	d2_s1(15);
			data_s(3)	<=	d3_s1(15);
			data_s(4)	<=	d4_s1(15);
			data_s(5)	<=	d5_s1(15);
			data_s(6)	<=	d6_s1(15);
			data_s(7)	<=	d7_s1(15);
			data_s(8)	<=	d0_s3(15);
			data_s(9)	<=	d1_s3(15);
			data_s(10)<=	d2_s3(15);
			data_s(11)<=	d3_s3(15);
			data_s(12)<=	d4_s3(15);
			data_s(13)<=	d5_s3(15);
			data_s(14)<=	d6_s3(15);
			data_s(15)<=	d7_s3(15);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(16);
			data_s(1)	<=	d1_s1(16);
			data_s(2)	<=	d2_s1(16);
			data_s(3)	<=	d3_s1(16);
			data_s(4)	<=	d4_s1(16);
			data_s(5)	<=	d5_s1(16);
			data_s(6)	<=	d6_s1(16);
			data_s(7)	<=	d7_s1(16);
			data_s(8)	<=	d0_s3(16);
			data_s(9)	<=	d1_s3(16);
			data_s(10)<=	d2_s3(16);
			data_s(11)<=	d3_s3(16);
			data_s(12)<=	d4_s3(16);
			data_s(13)<=	d5_s3(16);
			data_s(14)<=	d6_s3(16);
			data_s(15)<=	d7_s3(16);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(17);
			data_s(1)	<=	d1_s1(17);
			data_s(2)	<=	d2_s1(17);
			data_s(3)	<=	d3_s1(17);
			data_s(4)	<=	d4_s1(17);
			data_s(5)	<=	d5_s1(17);
			data_s(6)	<=	d6_s1(17);
			data_s(7)	<=	d7_s1(17);
			data_s(8)	<=	d0_s3(17);
			data_s(9)	<=	d1_s3(17);
			data_s(10)<=	d2_s3(17);
			data_s(11)<=	d3_s3(17);
			data_s(12)<=	d4_s3(17);
			data_s(13)<=	d5_s3(17);
			data_s(14)<=	d6_s3(17);
			data_s(15)<=	d7_s3(17);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(18);
			data_s(1)	<=	d1_s1(18);
			data_s(2)	<=	d2_s1(18);
			data_s(3)	<=	d3_s1(18);
			data_s(4)	<=	d4_s1(18);
			data_s(5)	<=	d5_s1(18);
			data_s(6)	<=	d6_s1(18);
			data_s(7)	<=	d7_s1(18);
			data_s(8)	<=	d0_s3(18);
			data_s(9)	<=	d1_s3(18);
			data_s(10)<=	d2_s3(18);
			data_s(11)<=	d3_s3(18);
			data_s(12)<=	d4_s3(18);
			data_s(13)<=	d5_s3(18);
			data_s(14)<=	d6_s3(18);
			data_s(15)<=	d7_s3(18);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(19);
			data_s(1)	<=	d1_s1(19);
			data_s(2)	<=	d2_s1(19);
			data_s(3)	<=	d3_s1(19);
			data_s(4)	<=	d4_s1(19);
			data_s(5)	<=	d5_s1(19);
			data_s(6)	<=	d6_s1(19);
			data_s(7)	<=	d7_s1(19);
			data_s(8)	<=	d0_s3(19);
			data_s(9)	<=	d1_s3(19);
			data_s(10)<=	d2_s3(19);
			data_s(11)<=	d3_s3(19);
			data_s(12)<=	d4_s3(19);
			data_s(13)<=	d5_s3(19);
			data_s(14)<=	d6_s3(19);
			data_s(15)<=	d7_s3(19);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(20);
			data_s(1)	<=	d1_s1(20);
			data_s(2)	<=	d2_s1(20);
			data_s(3)	<=	d3_s1(20);
			data_s(4)	<=	d4_s1(20);
			data_s(5)	<=	d5_s1(20);
			data_s(6)	<=	d6_s1(20);
			data_s(7)	<=	d7_s1(20);
			data_s(8)	<=	d0_s3(20);
			data_s(9)	<=	d1_s3(20);
			data_s(10)<=	d2_s3(20);
			data_s(11)<=	d3_s3(20);
			data_s(12)<=	d4_s3(20);
			data_s(13)<=	d5_s3(20);
			data_s(14)<=	d6_s3(20);
			data_s(15)<=	d7_s3(20);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(21);
			data_s(1)	<=	d1_s1(21);
			data_s(2)	<=	d2_s1(21);
			data_s(3)	<=	d3_s1(21);
			data_s(4)	<=	d4_s1(21);
			data_s(5)	<=	d5_s1(21);
			data_s(6)	<=	d6_s1(21);
			data_s(7)	<=	d7_s1(21);
			data_s(8)	<=	d0_s3(21);
			data_s(9)	<=	d1_s3(21);
			data_s(10)<=	d2_s3(21);
			data_s(11)<=	d3_s3(21);
			data_s(12)<=	d4_s3(21);
			data_s(13)<=	d5_s3(21);
			data_s(14)<=	d6_s3(21);
			data_s(15)<=	d7_s3(21);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(22);
			data_s(1)	<=	d1_s1(22);
			data_s(2)	<=	d2_s1(22);
			data_s(3)	<=	d3_s1(22);
			data_s(4)	<=	d4_s1(22);
			data_s(5)	<=	d5_s1(22);
			data_s(6)	<=	d6_s1(22);
			data_s(7)	<=	d7_s1(22);
			data_s(8)	<=	d0_s3(22);
			data_s(9)	<=	d1_s3(22);
			data_s(10)<=	d2_s3(22);
			data_s(11)<=	d3_s3(22);
			data_s(12)<=	d4_s3(22);
			data_s(13)<=	d5_s3(22);
			data_s(14)<=	d6_s3(22);
			data_s(15)<=	d7_s3(22);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(23);
			data_s(1)	<=	d1_s1(23);
			data_s(2)	<=	d2_s1(23);
			data_s(3)	<=	d3_s1(23);
			data_s(4)	<=	d4_s1(23);
			data_s(5)	<=	d5_s1(23);
			data_s(6)	<=	d6_s1(23);
			data_s(7)	<=	d7_s1(23);
			data_s(8)	<=	d0_s3(23);
			data_s(9)	<=	d1_s3(23);
			data_s(10)<=	d2_s3(23);
			data_s(11)<=	d3_s3(23);
			data_s(12)<=	d4_s3(23);
			data_s(13)<=	d5_s3(23);
			data_s(14)<=	d6_s3(23);
			data_s(15)<=	d7_s3(23);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(24);
			data_s(1)	<=	d1_s1(24);
			data_s(2)	<=	d2_s1(24);
			data_s(3)	<=	d3_s1(24);
			data_s(4)	<=	d4_s1(24);
			data_s(5)	<=	d5_s1(24);
			data_s(6)	<=	d6_s1(24);
			data_s(7)	<=	d7_s1(24);
			data_s(8)	<=	d0_s3(24);
			data_s(9)	<=	d1_s3(24);
			data_s(10)<=	d2_s3(24);
			data_s(11)<=	d3_s3(24);
			data_s(12)<=	d4_s3(24);
			data_s(13)<=	d5_s3(24);
			data_s(14)<=	d6_s3(24);
			data_s(15)<=	d7_s3(24);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(25);
			data_s(1)	<=	d1_s1(25);
			data_s(2)	<=	d2_s1(25);
			data_s(3)	<=	d3_s1(25);
			data_s(4)	<=	d4_s1(25);
			data_s(5)	<=	d5_s1(25);
			data_s(6)	<=	d6_s1(25);
			data_s(7)	<=	d7_s1(25);
			data_s(8)	<=	d0_s3(25);
			data_s(9)	<=	d1_s3(25);
			data_s(10)<=	d2_s3(25);
			data_s(11)<=	d3_s3(25);
			data_s(12)<=	d4_s3(25);
			data_s(13)<=	d5_s3(25);
			data_s(14)<=	d6_s3(25);
			data_s(15)<=	d7_s3(25);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(26);
			data_s(1)	<=	d1_s1(26);
			data_s(2)	<=	d2_s1(26);
			data_s(3)	<=	d3_s1(26);
			data_s(4)	<=	d4_s1(26);
			data_s(5)	<=	d5_s1(26);
			data_s(6)	<=	d6_s1(26);
			data_s(7)	<=	d7_s1(26);
			data_s(8)	<=	d0_s3(26);
			data_s(9)	<=	d1_s3(26);
			data_s(10)<=	d2_s3(26);
			data_s(11)<=	d3_s3(26);
			data_s(12)<=	d4_s3(26);
			data_s(13)<=	d5_s3(26);
			data_s(14)<=	d6_s3(26);
			data_s(15)<=	d7_s3(26);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(27);
			data_s(1)	<=	d1_s1(27);
			data_s(2)	<=	d2_s1(27);
			data_s(3)	<=	d3_s1(27);
			data_s(4)	<=	d4_s1(27);
			data_s(5)	<=	d5_s1(27);
			data_s(6)	<=	d6_s1(27);
			data_s(7)	<=	d7_s1(27);
			data_s(8)	<=	d0_s3(27);
			data_s(9)	<=	d1_s3(27);
			data_s(10)<=	d2_s3(27);
			data_s(11)<=	d3_s3(27);
			data_s(12)<=	d4_s3(27);
			data_s(13)<=	d5_s3(27);
			data_s(14)<=	d6_s3(27);
			data_s(15)<=	d7_s3(27);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(28);
			data_s(1)	<=	d1_s1(28);
			data_s(2)	<=	d2_s1(28);
			data_s(3)	<=	d3_s1(28);
			data_s(4)	<=	d4_s1(28);
			data_s(5)	<=	d5_s1(28);
			data_s(6)	<=	d6_s1(28);
			data_s(7)	<=	d7_s1(28);
			data_s(8)	<=	d0_s3(28);
			data_s(9)	<=	d1_s3(28);
			data_s(10)<=	d2_s3(28);
			data_s(11)<=	d3_s3(28);
			data_s(12)<=	d4_s3(28);
			data_s(13)<=	d5_s3(28);
			data_s(14)<=	d6_s3(28);
			data_s(15)<=	d7_s3(28);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(29);
			data_s(1)	<=	d1_s1(29);
			data_s(2)	<=	d2_s1(29);
			data_s(3)	<=	d3_s1(29);
			data_s(4)	<=	d4_s1(29);
			data_s(5)	<=	d5_s1(29);
			data_s(6)	<=	d6_s1(29);
			data_s(7)	<=	d7_s1(29);
			data_s(8)	<=	d0_s3(29);
			data_s(9)	<=	d1_s3(29);
			data_s(10)<=	d2_s3(29);
			data_s(11)<=	d3_s3(29);
			data_s(12)<=	d4_s3(29);
			data_s(13)<=	d5_s3(29);
			data_s(14)<=	d6_s3(29);
			data_s(15)<=	d7_s3(29);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(30);
			data_s(1)	<=	d1_s1(30);
			data_s(2)	<=	d2_s1(30);
			data_s(3)	<=	d3_s1(30);
			data_s(4)	<=	d4_s1(30);
			data_s(5)	<=	d5_s1(30);
			data_s(6)	<=	d6_s1(30);
			data_s(7)	<=	d7_s1(30);
			data_s(8)	<=	d0_s3(30);
			data_s(9)	<=	d1_s3(30);
			data_s(10)<=	d2_s3(30);
			data_s(11)<=	d3_s3(30);
			data_s(12)<=	d4_s3(30);
			data_s(13)<=	d5_s3(30);
			data_s(14)<=	d6_s3(30);
			data_s(15)<=	d7_s3(30);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(31);
			data_s(1)	<=	d1_s1(31);
			data_s(2)	<=	d2_s1(31);
			data_s(3)	<=	d3_s1(31);
			data_s(4)	<=	d4_s1(31);
			data_s(5)	<=	d5_s1(31);
			data_s(6)	<=	d6_s1(31);
			data_s(7)	<=	d7_s1(31);
			data_s(8)	<=	d0_s3(31);
			data_s(9)	<=	d1_s3(31);
			data_s(10)<=	d2_s3(31);
			data_s(11)<=	d3_s3(31);
			data_s(12)<=	d4_s3(31);
			data_s(13)<=	d5_s3(31);
			data_s(14)<=	d6_s3(31);
			data_s(15)<=	d7_s3(31);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(32);
			data_s(1)	<=	d1_s1(32);
			data_s(2)	<=	d2_s1(32);
			data_s(3)	<=	d3_s1(32);
			data_s(4)	<=	d4_s1(32);
			data_s(5)	<=	d5_s1(32);
			data_s(6)	<=	d6_s1(32);
			data_s(7)	<=	d7_s1(32);
			data_s(8)	<=	d0_s3(32);
			data_s(9)	<=	d1_s3(32);
			data_s(10)<=	d2_s3(32);
			data_s(11)<=	d3_s3(32);
			data_s(12)<=	d4_s3(32);
			data_s(13)<=	d5_s3(32);
			data_s(14)<=	d6_s3(32);
			data_s(15)<=	d7_s3(32);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(33);
			data_s(1)	<=	d1_s1(33);
			data_s(2)	<=	d2_s1(33);
			data_s(3)	<=	d3_s1(33);
			data_s(4)	<=	d4_s1(33);
			data_s(5)	<=	d5_s1(33);
			data_s(6)	<=	d6_s1(33);
			data_s(7)	<=	d7_s1(33);
			data_s(8)	<=	d0_s3(33);
			data_s(9)	<=	d1_s3(33);
			data_s(10)<=	d2_s3(33);
			data_s(11)<=	d3_s3(33);
			data_s(12)<=	d4_s3(33);
			data_s(13)<=	d5_s3(33);
			data_s(14)<=	d6_s3(33);
			data_s(15)<=	d7_s3(33);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(34);
			data_s(1)	<=	d1_s1(34);
			data_s(2)	<=	d2_s1(34);
			data_s(3)	<=	d3_s1(34);
			data_s(4)	<=	d4_s1(34);
			data_s(5)	<=	d5_s1(34);
			data_s(6)	<=	d6_s1(34);
			data_s(7)	<=	d7_s1(34);
			data_s(8)	<=	d0_s3(34);
			data_s(9)	<=	d1_s3(34);
			data_s(10)<=	d2_s3(34);
			data_s(11)<=	d3_s3(34);
			data_s(12)<=	d4_s3(34);
			data_s(13)<=	d5_s3(34);
			data_s(14)<=	d6_s3(34);
			data_s(15)<=	d7_s3(34);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(35);
			data_s(1)	<=	d1_s1(35);
			data_s(2)	<=	d2_s1(35);
			data_s(3)	<=	d3_s1(35);
			data_s(4)	<=	d4_s1(35);
			data_s(5)	<=	d5_s1(35);
			data_s(6)	<=	d6_s1(35);
			data_s(7)	<=	d7_s1(35);
			data_s(8)	<=	d0_s3(35);
			data_s(9)	<=	d1_s3(35);
			data_s(10)<=	d2_s3(35);
			data_s(11)<=	d3_s3(35);
			data_s(12)<=	d4_s3(35);
			data_s(13)<=	d5_s3(35);
			data_s(14)<=	d6_s3(35);
			data_s(15)<=	d7_s3(35);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(36);
			data_s(1)	<=	d1_s1(36);
			data_s(2)	<=	d2_s1(36);
			data_s(3)	<=	d3_s1(36);
			data_s(4)	<=	d4_s1(36);
			data_s(5)	<=	d5_s1(36);
			data_s(6)	<=	d6_s1(36);
			data_s(7)	<=	d7_s1(36);
			data_s(8)	<=	d0_s3(36);
			data_s(9)	<=	d1_s3(36);
			data_s(10)<=	d2_s3(36);
			data_s(11)<=	d3_s3(36);
			data_s(12)<=	d4_s3(36);
			data_s(13)<=	d5_s3(36);
			data_s(14)<=	d6_s3(36);
			data_s(15)<=	d7_s3(36);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(37);
			data_s(1)	<=	d1_s1(37);
			data_s(2)	<=	d2_s1(37);
			data_s(3)	<=	d3_s1(37);
			data_s(4)	<=	d4_s1(37);
			data_s(5)	<=	d5_s1(37);
			data_s(6)	<=	d6_s1(37);
			data_s(7)	<=	d7_s1(37);
			data_s(8)	<=	d0_s3(37);
			data_s(9)	<=	d1_s3(37);
			data_s(10)<=	d2_s3(37);
			data_s(11)<=	d3_s3(37);
			data_s(12)<=	d4_s3(37);
			data_s(13)<=	d5_s3(37);
			data_s(14)<=	d6_s3(37);
			data_s(15)<=	d7_s3(37);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(38);
			data_s(1)	<=	d1_s1(38);
			data_s(2)	<=	d2_s1(38);
			data_s(3)	<=	d3_s1(38);
			data_s(4)	<=	d4_s1(38);
			data_s(5)	<=	d5_s1(38);
			data_s(6)	<=	d6_s1(38);
			data_s(7)	<=	d7_s1(38);
			data_s(8)	<=	d0_s3(38);
			data_s(9)	<=	d1_s3(38);
			data_s(10)<=	d2_s3(38);
			data_s(11)<=	d3_s3(38);
			data_s(12)<=	d4_s3(38);
			data_s(13)<=	d5_s3(38);
			data_s(14)<=	d6_s3(38);
			data_s(15)<=	d7_s3(38);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(39);
			data_s(1)	<=	d1_s1(39);
			data_s(2)	<=	d2_s1(39);
			data_s(3)	<=	d3_s1(39);
			data_s(4)	<=	d4_s1(39);
			data_s(5)	<=	d5_s1(39);
			data_s(6)	<=	d6_s1(39);
			data_s(7)	<=	d7_s1(39);
			data_s(8)	<=	d0_s3(39);
			data_s(9)	<=	d1_s3(39);
			data_s(10)<=	d2_s3(39);
			data_s(11)<=	d3_s3(39);
			data_s(12)<=	d4_s3(39);
			data_s(13)<=	d5_s3(39);
			data_s(14)<=	d6_s3(39);
			data_s(15)<=	d7_s3(39);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(40);
			data_s(1)	<=	d1_s1(40);
			data_s(2)	<=	d2_s1(40);
			data_s(3)	<=	d3_s1(40);
			data_s(4)	<=	d4_s1(40);
			data_s(5)	<=	d5_s1(40);
			data_s(6)	<=	d6_s1(40);
			data_s(7)	<=	d7_s1(40);
			data_s(8)	<=	d0_s3(40);
			data_s(9)	<=	d1_s3(40);
			data_s(10)<=	d2_s3(40);
			data_s(11)<=	d3_s3(40);
			data_s(12)<=	d4_s3(40);
			data_s(13)<=	d5_s3(40);
			data_s(14)<=	d6_s3(40);
			data_s(15)<=	d7_s3(40);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(41);
			data_s(1)	<=	d1_s1(41);
			data_s(2)	<=	d2_s1(41);
			data_s(3)	<=	d3_s1(41);
			data_s(4)	<=	d4_s1(41);
			data_s(5)	<=	d5_s1(41);
			data_s(6)	<=	d6_s1(41);
			data_s(7)	<=	d7_s1(41);
			data_s(8)	<=	d0_s3(41);
			data_s(9)	<=	d1_s3(41);
			data_s(10)<=	d2_s3(41);
			data_s(11)<=	d3_s3(41);
			data_s(12)<=	d4_s3(41);
			data_s(13)<=	d5_s3(41);
			data_s(14)<=	d6_s3(41);
			data_s(15)<=	d7_s3(41);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(42);
			data_s(1)	<=	d1_s1(42);
			data_s(2)	<=	d2_s1(42);
			data_s(3)	<=	d3_s1(42);
			data_s(4)	<=	d4_s1(42);
			data_s(5)	<=	d5_s1(42);
			data_s(6)	<=	d6_s1(42);
			data_s(7)	<=	d7_s1(42);
			data_s(8)	<=	d0_s3(42);
			data_s(9)	<=	d1_s3(42);
			data_s(10)<=	d2_s3(42);
			data_s(11)<=	d3_s3(42);
			data_s(12)<=	d4_s3(42);
			data_s(13)<=	d5_s3(42);
			data_s(14)<=	d6_s3(42);
			data_s(15)<=	d7_s3(42);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(43);
			data_s(1)	<=	d1_s1(43);
			data_s(2)	<=	d2_s1(43);
			data_s(3)	<=	d3_s1(43);
			data_s(4)	<=	d4_s1(43);
			data_s(5)	<=	d5_s1(43);
			data_s(6)	<=	d6_s1(43);
			data_s(7)	<=	d7_s1(43);
			data_s(8)	<=	d0_s3(43);
			data_s(9)	<=	d1_s3(43);
			data_s(10)<=	d2_s3(43);
			data_s(11)<=	d3_s3(43);
			data_s(12)<=	d4_s3(43);
			data_s(13)<=	d5_s3(43);
			data_s(14)<=	d6_s3(43);
			data_s(15)<=	d7_s3(43);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(44);
			data_s(1)	<=	d1_s1(44);
			data_s(2)	<=	d2_s1(44);
			data_s(3)	<=	d3_s1(44);
			data_s(4)	<=	d4_s1(44);
			data_s(5)	<=	d5_s1(44);
			data_s(6)	<=	d6_s1(44);
			data_s(7)	<=	d7_s1(44);
			data_s(8)	<=	d0_s3(44);
			data_s(9)	<=	d1_s3(44);
			data_s(10)<=	d2_s3(44);
			data_s(11)<=	d3_s3(44);
			data_s(12)<=	d4_s3(44);
			data_s(13)<=	d5_s3(44);
			data_s(14)<=	d6_s3(44);
			data_s(15)<=	d7_s3(44);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(45);
			data_s(1)	<=	d1_s1(45);
			data_s(2)	<=	d2_s1(45);
			data_s(3)	<=	d3_s1(45);
			data_s(4)	<=	d4_s1(45);
			data_s(5)	<=	d5_s1(45);
			data_s(6)	<=	d6_s1(45);
			data_s(7)	<=	d7_s1(45);
			data_s(8)	<=	d0_s3(45);
			data_s(9)	<=	d1_s3(45);
			data_s(10)<=	d2_s3(45);
			data_s(11)<=	d3_s3(45);
			data_s(12)<=	d4_s3(45);
			data_s(13)<=	d5_s3(45);
			data_s(14)<=	d6_s3(45);
			data_s(15)<=	d7_s3(45);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(46);
			data_s(1)	<=	d1_s1(46);
			data_s(2)	<=	d2_s1(46);
			data_s(3)	<=	d3_s1(46);
			data_s(4)	<=	d4_s1(46);
			data_s(5)	<=	d5_s1(46);
			data_s(6)	<=	d6_s1(46);
			data_s(7)	<=	d7_s1(46);
			data_s(8)	<=	d0_s3(46);
			data_s(9)	<=	d1_s3(46);
			data_s(10)<=	d2_s3(46);
			data_s(11)<=	d3_s3(46);
			data_s(12)<=	d4_s3(46);
			data_s(13)<=	d5_s3(46);
			data_s(14)<=	d6_s3(46);
			data_s(15)<=	d7_s3(46);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(47);
			data_s(1)	<=	d1_s1(47);
			data_s(2)	<=	d2_s1(47);
			data_s(3)	<=	d3_s1(47);
			data_s(4)	<=	d4_s1(47);
			data_s(5)	<=	d5_s1(47);
			data_s(6)	<=	d6_s1(47);
			data_s(7)	<=	d7_s1(47);
			data_s(8)	<=	d0_s3(47);
			data_s(9)	<=	d1_s3(47);
			data_s(10)<=	d2_s3(47);
			data_s(11)<=	d3_s3(47);
			data_s(12)<=	d4_s3(47);
			data_s(13)<=	d5_s3(47);
			data_s(14)<=	d6_s3(47);
			data_s(15)<=	d7_s3(47);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(48);
			data_s(1)	<=	d1_s1(48);
			data_s(2)	<=	d2_s1(48);
			data_s(3)	<=	d3_s1(48);
			data_s(4)	<=	d4_s1(48);
			data_s(5)	<=	d5_s1(48);
			data_s(6)	<=	d6_s1(48);
			data_s(7)	<=	d7_s1(48);
			data_s(8)	<=	d0_s3(48);
			data_s(9)	<=	d1_s3(48);
			data_s(10)<=	d2_s3(48);
			data_s(11)<=	d3_s3(48);
			data_s(12)<=	d4_s3(48);
			data_s(13)<=	d5_s3(48);
			data_s(14)<=	d6_s3(48);
			data_s(15)<=	d7_s3(48);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(49);
			data_s(1)	<=	d1_s1(49);
			data_s(2)	<=	d2_s1(49);
			data_s(3)	<=	d3_s1(49);
			data_s(4)	<=	d4_s1(49);
			data_s(5)	<=	d5_s1(49);
			data_s(6)	<=	d6_s1(49);
			data_s(7)	<=	d7_s1(49);
			data_s(8)	<=	d0_s3(49);
			data_s(9)	<=	d1_s3(49);
			data_s(10)<=	d2_s3(49);
			data_s(11)<=	d3_s3(49);
			data_s(12)<=	d4_s3(49);
			data_s(13)<=	d5_s3(49);
			data_s(14)<=	d6_s3(49);
			data_s(15)<=	d7_s3(49);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(50);
			data_s(1)	<=	d1_s1(50);
			data_s(2)	<=	d2_s1(50);
			data_s(3)	<=	d3_s1(50);
			data_s(4)	<=	d4_s1(50);
			data_s(5)	<=	d5_s1(50);
			data_s(6)	<=	d6_s1(50);
			data_s(7)	<=	d7_s1(50);
			data_s(8)	<=	d0_s3(50);
			data_s(9)	<=	d1_s3(50);
			data_s(10)<=	d2_s3(50);
			data_s(11)<=	d3_s3(50);
			data_s(12)<=	d4_s3(50);
			data_s(13)<=	d5_s3(50);
			data_s(14)<=  d6_s3(50);
			data_s(15)<=	d7_s3(50);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(51);
			data_s(1)	<=	d1_s1(51);
			data_s(2)	<=	d2_s1(51);
			data_s(3)	<=	d3_s1(51);
			data_s(4)	<=	d4_s1(51);
			data_s(5)	<=	d5_s1(51);
			data_s(6)	<=	d6_s1(51);
			data_s(7)	<=	d7_s1(51);
			data_s(8)	<=	d0_s3(51);
			data_s(9)	<=	d1_s3(51);
			data_s(10)<=	d2_s3(51);
			data_s(11)<=	d3_s3(51);
			data_s(12)<=	d4_s3(51);
			data_s(13)<=	d5_s3(51);
			data_s(14)<=	d6_s3(51);
			data_s(15)<=	d7_s3(51);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(52);
			data_s(1)	<=	d1_s1(52);
			data_s(2)	<=	d2_s1(52);
			data_s(3)	<=	d3_s1(52);
			data_s(4)	<=	d4_s1(52);
			data_s(5)	<=	d5_s1(52);
			data_s(6)	<=	d6_s1(52);
			data_s(7)	<=	d7_s1(52);
			data_s(8)	<=	d0_s3(52);
			data_s(9)	<=	d1_s3(52);
			data_s(10)<=	d2_s3(52);
			data_s(11)<=	d3_s3(52);
			data_s(12)<=	d4_s3(52);
			data_s(13)<=	d5_s3(52);
			data_s(14)<=	d6_s3(52);
			data_s(15)<=	d7_s3(52);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(53);
			data_s(1)	<=	d1_s1(53);
			data_s(2)	<=	d2_s1(53);
			data_s(3)	<=	d3_s1(53);
			data_s(4)	<=	d4_s1(53);
			data_s(5)	<=	d5_s1(53);
			data_s(6)	<=	d6_s1(53);
			data_s(7)	<=	d7_s1(53);
			data_s(8)	<=	d0_s3(53);
			data_s(9)	<=	d1_s3(53);
			data_s(10)<=	d2_s3(53);
			data_s(11)<=	d3_s3(53);
			data_s(12)<=	d4_s3(53);
			data_s(13)<=	d5_s3(53);
			data_s(14)<=	d6_s3(53);
			data_s(15)<=	d7_s3(53);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(54);
			data_s(1)	<=	d1_s1(54);
			data_s(2)	<=	d2_s1(54);
			data_s(3)	<=	d3_s1(54);
			data_s(4)	<=	d4_s1(54);
			data_s(5)	<=	d5_s1(54);
			data_s(6)	<=	d6_s1(54);
			data_s(7)	<=	d7_s1(54);
			data_s(8)	<=	d0_s3(54);
			data_s(9)	<=	d1_s3(54);
			data_s(10)<=	d2_s3(54);
			data_s(11)<=	d3_s3(54);
			data_s(12)<=	d4_s3(54);
			data_s(13)<=	d5_s3(54);
			data_s(14)<=	d6_s3(54);
			data_s(15)<=	d7_s3(54);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(55);
			data_s(1)	<=	d1_s1(55);
			data_s(2)	<=	d2_s1(55);
			data_s(3)	<=	d3_s1(55);
			data_s(4)	<=	d4_s1(55);
			data_s(5)	<=	d5_s1(55);
			data_s(6)	<=	d6_s1(55);
			data_s(7)	<=	d7_s1(55);
			data_s(8)	<=	d0_s3(55);
			data_s(9)	<=	d1_s3(55);
			data_s(10)<=	d2_s3(55);
			data_s(11)<=	d3_s3(55);
			data_s(12)<=	d4_s3(55);
			data_s(13)<=	d5_s3(55);
			data_s(14)<=	d6_s3(55);
			data_s(15)<=	d7_s3(55);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(56);
			data_s(1)	<=	d1_s1(56);
			data_s(2)	<=	d2_s1(56);
			data_s(3)	<=	d3_s1(56);
			data_s(4)	<=	d4_s1(56);
			data_s(5)	<=	d5_s1(56);
			data_s(6)	<=	d6_s1(56);
			data_s(7)	<=	d7_s1(56);
			data_s(8)	<=	d0_s3(56);
			data_s(9)	<=	d1_s3(56);
			data_s(10)<=	d2_s3(56);
			data_s(11)<=	d3_s3(56);
			data_s(12)<=	d4_s3(56);
			data_s(13)<=	d5_s3(56);
			data_s(14)<=	d6_s3(56);
			data_s(15)<=	d7_s3(56);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(57);
			data_s(1)	<=	d1_s1(57);
			data_s(2)	<=	d2_s1(57);
			data_s(3)	<=	d3_s1(57);
			data_s(4)	<=	d4_s1(57);
			data_s(5)	<=	d5_s1(57);
			data_s(6)	<=	d6_s1(57);
			data_s(7)	<=	d7_s1(57);
			data_s(8)	<=	d0_s3(57);
			data_s(9)	<=	d1_s3(57);
			data_s(10)<=	d2_s3(57);
			data_s(11)<=	d3_s3(57);
			data_s(12)<=	d4_s3(57);
			data_s(13)<=	d5_s3(57);
			data_s(14)<=	d6_s3(57);
			data_s(15)<=	d7_s3(57);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(58);
			data_s(1)	<=	d1_s1(58);
			data_s(2)	<=	d2_s1(58);
			data_s(3)	<=	d3_s1(58);
			data_s(4)	<=	d4_s1(58);
			data_s(5)	<=	d5_s1(58);
			data_s(6)	<=	d6_s1(58);
			data_s(7)	<=	d7_s1(58);
			data_s(8)	<=	d0_s3(58);
			data_s(9)	<=	d1_s3(58);
			data_s(10)<=	d2_s3(58);
			data_s(11)<=	d3_s3(58);
			data_s(12)<=	d4_s3(58);
			data_s(13)<=	d5_s3(58);
			data_s(14)<=	d6_s3(58);
			data_s(15)<=	d7_s3(58);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(59);
			data_s(1)	<=	d1_s1(59);
			data_s(2)	<=	d2_s1(59);
			data_s(3)	<=	d3_s1(59);
			data_s(4)	<=	d4_s1(59);
			data_s(5)	<=	d5_s1(59);
			data_s(6)	<=	d6_s1(59);
			data_s(7)	<=	d7_s1(59);
			data_s(8)	<=	d0_s3(59);
			data_s(9)	<=	d1_s3(59);
			data_s(10)<=	d2_s3(59);
			data_s(11)<=	d3_s3(59);
			data_s(12)<=	d4_s3(59);
			data_s(13)<=	d5_s3(59);
			data_s(14)<=	d6_s3(59);
			data_s(15)<=	d7_s3(59);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(60);
			data_s(1)	<=	d1_s1(60);
			data_s(2)	<=	d2_s1(60);
			data_s(3)	<=	d3_s1(60);
			data_s(4)	<=	d4_s1(60);
			data_s(5)	<=	d5_s1(60);
			data_s(6)	<=	d6_s1(60);
			data_s(7)	<=	d7_s1(60);
			data_s(8)	<=	d0_s3(60);
			data_s(9)	<=	d1_s3(60);
			data_s(10)<=	d2_s3(60);
			data_s(11)<=	d3_s3(60);
			data_s(12)<=	d4_s3(60);
			data_s(13)<=	d5_s3(60);
			data_s(14)<=	d6_s3(60);
			data_s(15)<=	d7_s3(60);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(61);
			data_s(1)	<=	d1_s1(61);
			data_s(2)	<=	d2_s1(61);
			data_s(3)	<=	d3_s1(61);
			data_s(4)	<=	d4_s1(61);
			data_s(5)	<=	d5_s1(61);
			data_s(6)	<=	d6_s1(61);
			data_s(7)	<=	d7_s1(61);
			data_s(8)	<=	d0_s3(61);
			data_s(9)	<=	d1_s3(61);
			data_s(10)<=	d2_s3(61);
			data_s(11)<=	d3_s3(61);
			data_s(12)<=	d4_s3(61);
			data_s(13)<=	d5_s3(61);
			data_s(14)<=	d6_s3(61);
			data_s(15)<=	d7_s3(61);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(62);
			data_s(1)	<=	d1_s1(62);
			data_s(2)	<=	d2_s1(62);
			data_s(3)	<=	d3_s1(62);
			data_s(4)	<=	d4_s1(62);
			data_s(5)	<=	d5_s1(62);
			data_s(6)	<=	d6_s1(62);
			data_s(7)	<=	d7_s1(62);
			data_s(8)	<=	d0_s3(62);
			data_s(9)	<=	d1_s3(62);
			data_s(10)<=	d2_s3(62);
			data_s(11)<=	d3_s3(62);
			data_s(12)<=	d4_s3(62);
			data_s(13)<=	d5_s3(62);
			data_s(14)<=	d6_s3(62);
			data_s(15)<=	d7_s3(62);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s1(63);
			data_s(1)	<=	d1_s1(63);
			data_s(2)	<=	d2_s1(63);
			data_s(3)	<=	d3_s1(63);
			data_s(4)	<=	d4_s1(63);
			data_s(5)	<=	d5_s1(63);
			data_s(6)	<=	d6_s1(63);
			data_s(7)	<=	d7_s1(63);
			data_s(8)	<=	d0_s3(63);
			data_s(9)	<=	d1_s3(63);
			data_s(10)<=	d2_s3(63);
			data_s(11)<=	d3_s3(63);
			data_s(12)<=	d4_s3(63);
			data_s(13)<=	d5_s3(63);
			data_s(14)<=	d6_s3(63);
			data_s(15)<=	d7_s3(63);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(0);
			data_s(1)	<=	d1_s2(0);
			data_s(2)	<=	d2_s2(0);
			data_s(3)	<=	d3_s2(0);
			data_s(4)	<=	d4_s2(0);
			data_s(5)	<=	d5_s2(0);
			data_s(6)	<=	d6_s2(0);
			data_s(7)	<=	d7_s2(0);
			data_s(8)	<=	d0_s4(0);
			data_s(9)	<=	d1_s4(0);
			data_s(10)<=	d2_s4(0);
			data_s(11)<=	d3_s4(0);
			data_s(12)<=	d4_s4(0);
			data_s(13)<=	d5_s4(0);
			data_s(14)<=	d6_s4(0);
			data_s(15)<=	d7_s4(0);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(1);
			data_s(1)	<=	d1_s2(1);
			data_s(2)	<=	d2_s2(1);
			data_s(3)	<=	d3_s2(1);
			data_s(4)	<=	d4_s2(1);
			data_s(5)	<=	d5_s2(1);
			data_s(6)	<=	d6_s2(1);
			data_s(7)	<=	d7_s2(1);
			data_s(8)	<=	d0_s4(1);
			data_s(9)	<=	d1_s4(1);
			data_s(10)<=	d2_s4(1);
			data_s(11)<=	d3_s4(1);
			data_s(12)<=	d4_s4(1);
			data_s(13)<=	d5_s4(1);
			data_s(14)<=	d6_s4(1);
			data_s(15)<=	d7_s4(1);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(2);
			data_s(1)	<=	d1_s2(2);
			data_s(2)	<=	d2_s2(2);
			data_s(3)	<=	d3_s2(2);
			data_s(4)	<=	d4_s2(2);
			data_s(5)	<=	d5_s2(2);
			data_s(6)	<=	d6_s2(2);
			data_s(7)	<=	d7_s2(2);
			data_s(8)	<=	d0_s4(2);
			data_s(9)	<=	d1_s4(2);
			data_s(10)<=	d2_s4(2);
			data_s(11)<=	d3_s4(2);
			data_s(12)<=	d4_s4(2);
			data_s(13)<=	d5_s4(2);
			data_s(14)<=	d6_s4(2);
			data_s(15)<=	d7_s4(2);
			---------------------------------------------			
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(3);
			data_s(1)	<=	d1_s2(3);
			data_s(2)	<=	d2_s2(3);
			data_s(3)	<=	d3_s2(3);
			data_s(4)	<=	d4_s2(3);
			data_s(5)	<=	d5_s2(3);
			data_s(6)	<=	d6_s2(3);
			data_s(7)	<=	d7_s2(3);
			data_s(8)	<=	d0_s4(3);
			data_s(9)	<=	d1_s4(3);
			data_s(10)<=	d2_s4(3);
			data_s(11)<=	d3_s4(3);
			data_s(12)<=	d4_s4(3);
			data_s(13)<=	d5_s4(3);
			data_s(14)<=	d6_s4(3);
			data_s(15)<=	d7_s4(3);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(4);
			data_s(1)	<=	d1_s2(4);
			data_s(2)	<=	d2_s2(4);
			data_s(3)	<=	d3_s2(4);
			data_s(4)	<=	d4_s2(4);
			data_s(5)	<=	d5_s2(4);
			data_s(6)	<=	d6_s2(4);
			data_s(7)	<=	d7_s2(4);
			data_s(8)	<=	d0_s4(4);
			data_s(9)	<=	d1_s4(4);
			data_s(10)<=	d2_s4(4);
			data_s(11)<=	d3_s4(4);
			data_s(12)<=	d4_s4(4);
			data_s(13)<=	d5_s4(4);
			data_s(14)<=	d6_s4(4);
			data_s(15)<=	d7_s4(4);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(5);
			data_s(1)	<=	d1_s2(5);
			data_s(2)	<=	d2_s2(5);
			data_s(3)	<=	d3_s2(5);
			data_s(4)	<=	d4_s2(5);
			data_s(5)	<=	d5_s2(5);
			data_s(6)	<=	d6_s2(5);
			data_s(7)	<=	d7_s2(5);
			data_s(8)	<=	d0_s4(5);
			data_s(9)	<=	d1_s4(5);
			data_s(10)<=	d2_s4(5);
			data_s(11)<=	d3_s4(5);
			data_s(12)<=	d4_s4(5);
			data_s(13)<=	d5_s4(5);
			data_s(14)<=	d6_s4(5);
			data_s(15)<=	d7_s4(5);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(6);
			data_s(1)	<=	d1_s2(6);
			data_s(2)	<=	d2_s2(6);
			data_s(3)	<=	d3_s2(6);
			data_s(4)	<=	d4_s2(6);
			data_s(5)	<=	d5_s2(6);
			data_s(6)	<=	d6_s2(6);
			data_s(7)	<=	d7_s2(6);
			data_s(8)	<=	d0_s4(6);
			data_s(9)	<=	d1_s4(6);
			data_s(10)<=	d2_s4(6);
			data_s(11)<=	d3_s4(6);
			data_s(12)<=	d4_s4(6);
			data_s(13)<=	d5_s4(6);
			data_s(14)<=	d6_s4(6);
			data_s(15)<=	d7_s4(6);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(7);
			data_s(1)	<=	d1_s2(7);
			data_s(2)	<=	d2_s2(7);
			data_s(3)	<=	d3_s2(7);
			data_s(4)	<=	d4_s2(7);
			data_s(5)	<=	d5_s2(7);
			data_s(6)	<=	d6_s2(7);
			data_s(7)	<=	d7_s2(7);
			data_s(8)	<=	d0_s4(7);
			data_s(9)	<=	d1_s4(7);
			data_s(10)<=	d2_s4(7);
			data_s(11)<=	d3_s4(7);
			data_s(12)<=	d4_s4(7);
			data_s(13)<=	d5_s4(7);
			data_s(14)<=	d6_s4(7);
			data_s(15)<=	d7_s4(7);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(8);
			data_s(1)	<=	d1_s2(8);
			data_s(2)	<=	d2_s2(8);
			data_s(3)	<=	d3_s2(8);
			data_s(4)	<=	d4_s2(8);
			data_s(5)	<=	d5_s2(8);
			data_s(6)	<=	d6_s2(8);
			data_s(7)	<=	d7_s2(8);
			data_s(8)	<=	d0_s4(8);
			data_s(9)	<=	d1_s4(8);
			data_s(10)<=	d2_s4(8);
			data_s(11)<=	d3_s4(8);
			data_s(12)<=	d4_s4(8);
			data_s(13)<=	d5_s4(8);
			data_s(14)<=	d6_s4(8);
			data_s(15)<=	d7_s4(8);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(9);
			data_s(1)	<=	d1_s2(9);
			data_s(2)	<=	d2_s2(9);
			data_s(3)	<=	d3_s2(9);
			data_s(4)	<=	d4_s2(9);
			data_s(5)	<=	d5_s2(9);
			data_s(6)	<=	d6_s2(9);
			data_s(7)	<=	d7_s2(9);
			data_s(8)	<=	d0_s4(9);
			data_s(9)	<=	d1_s4(9);
			data_s(10)<=	d2_s4(9);
			data_s(11)<=	d3_s4(9);
			data_s(12)<=	d4_s4(9);
			data_s(13)<=	d5_s4(9);
			data_s(14)<=	d6_s4(9);
			data_s(15)<=	d7_s4(9);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(10);
			data_s(1)	<=	d1_s2(10);
			data_s(2)	<=	d2_s2(10);
			data_s(3)	<=	d3_s2(10);
			data_s(4)	<=	d4_s2(10);
			data_s(5)	<=	d5_s2(10);
			data_s(6)	<=	d6_s2(10);
			data_s(7)	<=	d7_s2(10);
			data_s(8)	<=	d0_s4(10);
			data_s(9)	<=	d1_s4(10);
			data_s(10)<=	d2_s4(10);
			data_s(11)<=	d3_s4(10);
			data_s(12)<=	d4_s4(10);
			data_s(13)<=	d5_s4(10);
			data_s(14)<=	d6_s4(10);
			data_s(15)<=	d7_s4(10);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(11);
			data_s(1)	<=	d1_s2(11);
			data_s(2)	<=	d2_s2(11);
			data_s(3)	<=	d3_s2(11);
			data_s(4)	<=	d4_s2(11);
			data_s(5)	<=	d5_s2(11);
			data_s(6)	<=	d6_s2(11);
			data_s(7)	<=	d7_s2(11);
			data_s(8)	<=	d0_s4(11);
			data_s(9)	<=	d1_s4(11);
			data_s(10)<=	d2_s4(11);
			data_s(11)<=	d3_s4(11);
			data_s(12)<=	d4_s4(11);
			data_s(13)<=	d5_s4(11);
			data_s(14)<=	d6_s4(11);
			data_s(15)<=	d7_s4(11);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(12);
			data_s(1)	<=	d1_s2(12);
			data_s(2)	<=	d2_s2(12);
			data_s(3)	<=	d3_s2(12);
			data_s(4)	<=	d4_s2(12);
			data_s(5)	<=	d5_s2(12);
			data_s(6)	<=	d6_s2(12);
			data_s(7)	<=	d7_s2(12);
			data_s(8)	<=	d0_s4(12);
			data_s(9)	<=	d1_s4(12);
			data_s(10)<=	d2_s4(12);
			data_s(11)<=	d3_s4(12);
			data_s(12)<=	d4_s4(12);
			data_s(13)<=	d5_s4(12);
			data_s(14)<=	d6_s4(12);
			data_s(15)<=	d7_s4(12);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(13);
			data_s(1)	<=	d1_s2(13);
			data_s(2)	<=	d2_s2(13);
			data_s(3)	<=	d3_s2(13);
			data_s(4)	<=	d4_s2(13);
			data_s(5)	<=	d5_s2(13);
			data_s(6)	<=	d6_s2(13);
			data_s(7)	<=	d7_s2(13);
			data_s(8)	<=	d0_s4(13);
			data_s(9)	<=	d1_s4(13);
			data_s(10)<=	d2_s4(13);
			data_s(11)<=	d3_s4(13);
			data_s(12)<=	d4_s4(13);
			data_s(13)<=	d5_s4(13);
			data_s(14)<=	d6_s4(13);
			data_s(15)<=	d7_s4(13);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(14);
			data_s(1)	<=	d1_s2(14);
			data_s(2)	<=	d2_s2(14);
			data_s(3)	<=	d3_s2(14);
			data_s(4)	<=	d4_s2(14);
			data_s(5)	<=	d5_s2(14);
			data_s(6)	<=	d6_s2(14);
			data_s(7)	<=	d7_s2(14);
			data_s(8)	<=	d0_s4(14);
			data_s(9)	<=	d1_s4(14);
			data_s(10)<=	d2_s4(14);
			data_s(11)<=	d3_s4(14);
			data_s(12)<=	d4_s4(14);
			data_s(13)<=	d5_s4(14);
			data_s(14)<=	d6_s4(14);
			data_s(15)<=	d7_s4(14);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(15);
			data_s(1)	<=	d1_s2(15);
			data_s(2)	<=	d2_s2(15);
			data_s(3)	<=	d3_s2(15);
			data_s(4)	<=	d4_s2(15);
			data_s(5)	<=	d5_s2(15);
			data_s(6)	<=	d6_s2(15);
			data_s(7)	<=	d7_s2(15);
			data_s(8)	<=	d0_s4(15);
			data_s(9)	<=	d1_s4(15);
			data_s(10)<=	d2_s4(15);
			data_s(11)<=	d3_s4(15);
			data_s(12)<=	d4_s4(15);
			data_s(13)<=	d5_s4(15);
			data_s(14)<=	d6_s4(15);
			data_s(15)<=	d7_s4(15);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(16);
			data_s(1)	<=	d1_s2(16);
			data_s(2)	<=	d2_s2(16);
			data_s(3)	<=	d3_s2(16);
			data_s(4)	<=	d4_s2(16);
			data_s(5)	<=	d5_s2(16);
			data_s(6)	<=	d6_s2(16);
			data_s(7)	<=	d7_s2(16);
			data_s(8)	<=	d0_s4(16);
			data_s(9)	<=	d1_s4(16);
			data_s(10)<=	d2_s4(16);
			data_s(11)<=	d3_s4(16);
			data_s(12)<=	d4_s4(16);
			data_s(13)<=	d5_s4(16);
			data_s(14)<=	d6_s4(16);
			data_s(15)<=	d7_s4(16);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(17);
			data_s(1)	<=	d1_s2(17);
			data_s(2)	<=	d2_s2(17);
			data_s(3)	<=	d3_s2(17);
			data_s(4)	<=	d4_s2(17);
			data_s(5)	<=	d5_s2(17);
			data_s(6)	<=	d6_s2(17);
			data_s(7)	<=	d7_s2(17);
			data_s(8)	<=	d0_s4(17);
			data_s(9)	<=	d1_s4(17);
			data_s(10)<=	d2_s4(17);
			data_s(11)<=	d3_s4(17);
			data_s(12)<=	d4_s4(17);
			data_s(13)<=	d5_s4(17);
			data_s(14)<=	d6_s4(17);
			data_s(15)<=	d7_s4(17);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(18);
			data_s(1)	<=	d1_s2(18);
			data_s(2)	<=	d2_s2(18);
			data_s(3)	<=	d3_s2(18);
			data_s(4)	<=	d4_s2(18);
			data_s(5)	<=	d5_s2(18);
			data_s(6)	<=	d6_s2(18);
			data_s(7)	<=	d7_s2(18);
			data_s(8)	<=	d0_s4(18);
			data_s(9)	<=	d1_s4(18);
			data_s(10)<=	d2_s4(18);
			data_s(11)<=	d3_s4(18);
			data_s(12)<=	d4_s4(18);
			data_s(13)<=	d5_s4(18);
			data_s(14)<=	d6_s4(18);
			data_s(15)<=	d7_s4(18);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(19);
			data_s(1)	<=	d1_s2(19);
			data_s(2)	<=	d2_s2(19);
			data_s(3)	<=	d3_s2(19);
			data_s(4)	<=	d4_s2(19);
			data_s(5)	<=	d5_s2(19);
			data_s(6)	<=	d6_s2(19);
			data_s(7)	<=	d7_s2(19);
			data_s(8)	<=	d0_s4(19);
			data_s(9)	<=	d1_s4(19);
			data_s(10)<=	d2_s4(19);
			data_s(11)<=	d3_s4(19);
			data_s(12)<=	d4_s4(19);
			data_s(13)<=	d5_s4(19);
			data_s(14)<=	d6_s4(19);
			data_s(15)<=	d7_s4(19);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(20);
			data_s(1)	<=	d1_s2(20);
			data_s(2)	<=	d2_s2(20);
			data_s(3)	<=	d3_s2(20);
			data_s(4)	<=	d4_s2(20);
			data_s(5)	<=	d5_s2(20);
			data_s(6)	<=	d6_s2(20);
			data_s(7)	<=	d7_s2(20);
			data_s(8)	<=	d0_s4(20);
			data_s(9)	<=	d1_s4(20);
			data_s(10)<=	d2_s4(20);
			data_s(11)<=	d3_s4(20);
			data_s(12)<=	d4_s4(20);
			data_s(13)<=	d5_s4(20);
			data_s(14)<=	d6_s4(20);
			data_s(15)<=	d7_s4(20);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(21);
			data_s(1)	<=	d1_s2(21);
			data_s(2)	<=	d2_s2(21);
			data_s(3)	<=	d3_s2(21);
			data_s(4)	<=	d4_s2(21);
			data_s(5)	<=	d5_s2(21);
			data_s(6)	<=	d6_s2(21);
			data_s(7)	<=	d7_s2(21);
			data_s(8)	<=	d0_s4(21);
			data_s(9)	<=	d1_s4(21);
			data_s(10)<=	d2_s4(21);
			data_s(11)<=	d3_s4(21);
			data_s(12)<=	d4_s4(21);
			data_s(13)<=	d5_s4(21);
			data_s(14)<=	d6_s4(21);
			data_s(15)<=	d7_s4(21);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(22);
			data_s(1)	<=	d1_s2(22);
			data_s(2)	<=	d2_s2(22);
			data_s(3)	<=	d3_s2(22);
			data_s(4)	<=	d4_s2(22);
			data_s(5)	<=	d5_s2(22);
			data_s(6)	<=	d6_s2(22);
			data_s(7)	<=	d7_s2(22);
			data_s(8)	<=	d0_s4(22);
			data_s(9)	<=	d1_s4(22);
			data_s(10)<=	d2_s4(22);
			data_s(11)<=	d3_s4(22);
			data_s(12)<=	d4_s4(22);
			data_s(13)<=	d5_s4(22);
			data_s(14)<=	d6_s4(22);
			data_s(15)<=	d7_s4(22);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(23);
			data_s(1)	<=	d1_s2(23);
			data_s(2)	<=	d2_s2(23);
			data_s(3)	<=	d3_s2(23);
			data_s(4)	<=	d4_s2(23);
			data_s(5)	<=	d5_s2(23);
			data_s(6)	<=	d6_s2(23);
			data_s(7)	<=	d7_s2(23);
			data_s(8)	<=	d0_s4(23);
			data_s(9)	<=	d1_s4(23);
			data_s(10)<=	d2_s4(23);
			data_s(11)<=	d3_s4(23);
			data_s(12)<=	d4_s4(23);
			data_s(13)<=	d5_s4(23);
			data_s(14)<=	d6_s4(23);
			data_s(15)<=	d7_s4(23);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(24);
			data_s(1)	<=	d1_s2(24);
			data_s(2)	<=	d2_s2(24);
			data_s(3)	<=	d3_s2(24);
			data_s(4)	<=	d4_s2(24);
			data_s(5)	<=	d5_s2(24);
			data_s(6)	<=	d6_s2(24);
			data_s(7)	<=	d7_s2(24);
			data_s(8)	<=	d0_s4(24);
			data_s(9)	<=	d1_s4(24);
			data_s(10)<=	d2_s4(24);
			data_s(11)<=	d3_s4(24);
			data_s(12)<=	d4_s4(24);
			data_s(13)<=	d5_s4(24);
			data_s(14)<=	d6_s4(24);
			data_s(15)<=	d7_s4(24);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(25);
			data_s(1)	<=	d1_s2(25);
			data_s(2)	<=	d2_s2(25);
			data_s(3)	<=	d3_s2(25);
			data_s(4)	<=	d4_s2(25);
			data_s(5)	<=	d5_s2(25);
			data_s(6)	<=	d6_s2(25);
			data_s(7)	<=	d7_s2(25);
			data_s(8)	<=	d0_s4(25);
			data_s(9)	<=	d1_s4(25);
			data_s(10)<=	d2_s4(25);
			data_s(11)<=	d3_s4(25);
			data_s(12)<=	d4_s4(25);
			data_s(13)<=	d5_s4(25);
			data_s(14)<=	d6_s4(25);
			data_s(15)<=	d7_s4(25);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(26);
			data_s(1)	<=	d1_s2(26);
			data_s(2)	<=	d2_s2(26);
			data_s(3)	<=	d3_s2(26);
			data_s(4)	<=	d4_s2(26);
			data_s(5)	<=	d5_s2(26);
			data_s(6)	<=	d6_s2(26);
			data_s(7)	<=	d7_s2(26);
			data_s(8)	<=	d0_s4(26);
			data_s(9)	<=	d1_s4(26);
			data_s(10)<=	d2_s4(26);
			data_s(11)<=	d3_s4(26);
			data_s(12)<=	d4_s4(26);
			data_s(13)<=	d5_s4(26);
			data_s(14)<=	d6_s4(26);
			data_s(15)<=	d7_s4(26);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(27);
			data_s(1)	<=	d1_s2(27);
			data_s(2)	<=	d2_s2(27);
			data_s(3)	<=	d3_s2(27);
			data_s(4)	<=	d4_s2(27);
			data_s(5)	<=	d5_s2(27);
			data_s(6)	<=	d6_s2(27);
			data_s(7)	<=	d7_s2(27);
			data_s(8)	<=	d0_s4(27);
			data_s(9)	<=	d1_s4(27);
			data_s(10)<=	d2_s4(27);
			data_s(11)<=	d3_s4(27);
			data_s(12)<=	d4_s4(27);
			data_s(13)<=	d5_s4(27);
			data_s(14)<=	d6_s4(27);
			data_s(15)<=	d7_s4(27);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(28);
			data_s(1)	<=	d1_s2(28);
			data_s(2)	<=	d2_s2(28);
			data_s(3)	<=	d3_s2(28);
			data_s(4)	<=	d4_s2(28);
			data_s(5)	<=	d5_s2(28);
			data_s(6)	<=	d6_s2(28);
			data_s(7)	<=	d7_s2(28);
			data_s(8)	<=	d0_s4(28);
			data_s(9)	<=	d1_s4(28);
			data_s(10)<=	d2_s4(28);
			data_s(11)<=	d3_s4(28);
			data_s(12)<=	d4_s4(28);
			data_s(13)<=	d5_s4(28);
			data_s(14)<=	d6_s4(28);
			data_s(15)<=	d7_s4(28);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(29);
			data_s(1)	<=	d1_s2(29);
			data_s(2)	<=	d2_s2(29);
			data_s(3)	<=	d3_s2(29);
			data_s(4)	<=	d4_s2(29);
			data_s(5)	<=	d5_s2(29);
			data_s(6)	<=	d6_s2(29);
			data_s(7)	<=	d7_s2(29);
			data_s(8)	<=	d0_s4(29);
			data_s(9)	<=	d1_s4(29);
			data_s(10)<=	d2_s4(29);
			data_s(11)<=	d3_s4(29);
			data_s(12)<=	d4_s4(29);
			data_s(13)<=	d5_s4(29);
			data_s(14)<=	d6_s4(29);
			data_s(15)<=	d7_s4(29);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(30);
			data_s(1)	<=	d1_s2(30);
			data_s(2)	<=	d2_s2(30);
			data_s(3)	<=	d3_s2(30);
			data_s(4)	<=	d4_s2(30);
			data_s(5)	<=	d5_s2(30);
			data_s(6)	<=	d6_s2(30);
			data_s(7)	<=	d7_s2(30);
			data_s(8)	<=	d0_s4(30);
			data_s(9)	<=	d1_s4(30);
			data_s(10)<=	d2_s4(30);
			data_s(11)<=	d3_s4(30);
			data_s(12)<=	d4_s4(30);
			data_s(13)<=	d5_s4(30);
			data_s(14)<=	d6_s4(30);
			data_s(15)<=	d7_s4(30);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(31);
			data_s(1)	<=	d1_s2(31);
			data_s(2)	<=	d2_s2(31);
			data_s(3)	<=	d3_s2(31);
			data_s(4)	<=	d4_s2(31);
			data_s(5)	<=	d5_s2(31);
			data_s(6)	<=	d6_s2(31);
			data_s(7)	<=	d7_s2(31);
			data_s(8)	<=	d0_s4(31);
			data_s(9)	<=	d1_s4(31);
			data_s(10)<=	d2_s4(31);
			data_s(11)<=	d3_s4(31);
			data_s(12)<=	d4_s4(31);
			data_s(13)<=	d5_s4(31);
			data_s(14)<=	d6_s4(31);
			data_s(15)<=	d7_s4(31);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(32);
			data_s(1)	<=	d1_s2(32);
			data_s(2)	<=	d2_s2(32);
			data_s(3)	<=	d3_s2(32);
			data_s(4)	<=	d4_s2(32);
			data_s(5)	<=	d5_s2(32);
			data_s(6)	<=	d6_s2(32);
			data_s(7)	<=	d7_s2(32);
			data_s(8)	<=	d0_s4(32);
			data_s(9)	<=	d1_s4(32);
			data_s(10)<=	d2_s4(32);
			data_s(11)<=	d3_s4(32);
			data_s(12)<=	d4_s4(32);
			data_s(13)<=	d5_s4(32);
			data_s(14)<=	d6_s4(32);
			data_s(15)<=	d7_s4(32);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(33);
			data_s(1)	<=	d1_s2(33);
			data_s(2)	<=	d2_s2(33);
			data_s(3)	<=	d3_s2(33);
			data_s(4)	<=	d4_s2(33);
			data_s(5)	<=	d5_s2(33);
			data_s(6)	<=	d6_s2(33);
			data_s(7)	<=	d7_s2(33);
			data_s(8)	<=	d0_s4(33);
			data_s(9)	<=	d1_s4(33);
			data_s(10)<=	d2_s4(33);
			data_s(11)<=	d3_s4(33);
			data_s(12)<=	d4_s4(33);
			data_s(13)<=	d5_s4(33);
			data_s(14)<=	d6_s4(33);
			data_s(15)<=	d7_s4(33);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(34);
			data_s(1)	<=	d1_s2(34);
			data_s(2)	<=	d2_s2(34);
			data_s(3)	<=	d3_s2(34);
			data_s(4)	<=	d4_s2(34);
			data_s(5)	<=	d5_s2(34);
			data_s(6)	<=	d6_s2(34);
			data_s(7)	<=	d7_s2(34);
			data_s(8)	<=	d0_s4(34);
			data_s(9)	<=	d1_s4(34);
			data_s(10)<=	d2_s4(34);
			data_s(11)<=	d3_s4(34);
			data_s(12)<=	d4_s4(34);
			data_s(13)<=	d5_s4(34);
			data_s(14)<=	d6_s4(34);
			data_s(15)<=	d7_s4(34);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(35);
			data_s(1)	<=	d1_s2(35);
			data_s(2)	<=	d2_s2(35);
			data_s(3)	<=	d3_s2(35);
			data_s(4)	<=	d4_s2(35);
			data_s(5)	<=	d5_s2(35);
			data_s(6)	<=	d6_s2(35);
			data_s(7)	<=	d7_s2(35);
			data_s(8)	<=	d0_s4(35);
			data_s(9)	<=	d1_s4(35);
			data_s(10)<=	d2_s4(35);
			data_s(11)<=	d3_s4(35);
			data_s(12)<=	d4_s4(35);
			data_s(13)<=	d5_s4(35);
			data_s(14)<=	d6_s4(35);
			data_s(15)<=	d7_s4(35);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(36);
			data_s(1)	<=	d1_s2(36);
			data_s(2)	<=	d2_s2(36);
			data_s(3)	<=	d3_s2(36);
			data_s(4)	<=	d4_s2(36);
			data_s(5)	<=	d5_s2(36);
			data_s(6)	<=	d6_s2(36);
			data_s(7)	<=	d7_s2(36);
			data_s(8)	<=	d0_s4(36);
			data_s(9)	<=	d1_s4(36);
			data_s(10)<=	d2_s4(36);
			data_s(11)<=	d3_s4(36);
			data_s(12)<=	d4_s4(36);
			data_s(13)<=	d5_s4(36);
			data_s(14)<=	d6_s4(36);
			data_s(15)<=	d7_s4(36);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(37);
			data_s(1)	<=	d1_s2(37);
			data_s(2)	<=	d2_s2(37);
			data_s(3)	<=	d3_s2(37);
			data_s(4)	<=	d4_s2(37);
			data_s(5)	<=	d5_s2(37);
			data_s(6)	<=	d6_s2(37);
			data_s(7)	<=	d7_s2(37);
			data_s(8)	<=	d0_s4(37);
			data_s(9)	<=	d1_s4(37);
			data_s(10)<=	d2_s4(37);
			data_s(11)<=	d3_s4(37);
			data_s(12)<=	d4_s4(37);
			data_s(13)<=	d5_s4(37);
			data_s(14)<=	d6_s4(37);
			data_s(15)<=	d7_s4(37);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(38);
			data_s(1)	<=	d1_s2(38);
			data_s(2)	<=	d2_s2(38);
			data_s(3)	<=	d3_s2(38);
			data_s(4)	<=	d4_s2(38);
			data_s(5)	<=	d5_s2(38);
			data_s(6)	<=	d6_s2(38);
			data_s(7)	<=	d7_s2(38);
			data_s(8)	<=	d0_s4(38);
			data_s(9)	<=	d1_s4(38);
			data_s(10)<=	d2_s4(38);
			data_s(11)<=	d3_s4(38);
			data_s(12)<=	d4_s4(38);
			data_s(13)<=	d5_s4(38);
			data_s(14)<=	d6_s4(38);
			data_s(15)<=	d7_s4(38);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(39);
			data_s(1)	<=	d1_s2(39);
			data_s(2)	<=	d2_s2(39);
			data_s(3)	<=	d3_s2(39);
			data_s(4)	<=	d4_s2(39);
			data_s(5)	<=	d5_s2(39);
			data_s(6)	<=	d6_s2(39);
			data_s(7)	<=	d7_s2(39);
			data_s(8)	<=	d0_s4(39);
			data_s(9)	<=	d1_s4(39);
			data_s(10)<=	d2_s4(39);
			data_s(11)<=	d3_s4(39);
			data_s(12)<=	d4_s4(39);
			data_s(13)<=	d5_s4(39);
			data_s(14)<=	d6_s4(39);
			data_s(15)<=	d7_s4(39);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(40);
			data_s(1)	<=	d1_s2(40);
			data_s(2)	<=	d2_s2(40);
			data_s(3)	<=	d3_s2(40);
			data_s(4)	<=	d4_s2(40);
			data_s(5)	<=	d5_s2(40);
			data_s(6)	<=	d6_s2(40);
			data_s(7)	<=	d7_s2(40);
			data_s(8)	<=	d0_s4(40);
			data_s(9)	<=	d1_s4(40);
			data_s(10)<=	d2_s4(40);
			data_s(11)<=	d3_s4(40);
			data_s(12)<=	d4_s4(40);
			data_s(13)<=	d5_s4(40);
			data_s(14)<=	d6_s4(40);
			data_s(15)<=	d7_s4(40);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(41);
			data_s(1)	<=	d1_s2(41);
			data_s(2)	<=	d2_s2(41);
			data_s(3)	<=	d3_s2(41);
			data_s(4)	<=	d4_s2(41);
			data_s(5)	<=	d5_s2(41);
			data_s(6)	<=	d6_s2(41);
			data_s(7)	<=	d7_s2(41);
			data_s(8)	<=	d0_s4(41);
			data_s(9)	<=	d1_s4(41);
			data_s(10)<=	d2_s4(41);
			data_s(11)<=	d3_s4(41);
			data_s(12)<=	d4_s4(41);
			data_s(13)<=	d5_s4(41);
			data_s(14)<=	d6_s4(41);
			data_s(15)<=	d7_s4(41);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(42);
			data_s(1)	<=	d1_s2(42);
			data_s(2)	<=	d2_s2(42);
			data_s(3)	<=	d3_s2(42);
			data_s(4)	<=	d4_s2(42);
			data_s(5)	<=	d5_s2(42);
			data_s(6)	<=	d6_s2(42);
			data_s(7)	<=	d7_s2(42);
			data_s(8)	<=	d0_s4(42);
			data_s(9)	<=	d1_s4(42);
			data_s(10)<=	d2_s4(42);
			data_s(11)<=	d3_s4(42);
			data_s(12)<=	d4_s4(42);
			data_s(13)<=	d5_s4(42);
			data_s(14)<=	d6_s4(42);
			data_s(15)<=	d7_s4(42);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(43);
			data_s(1)	<=	d1_s2(43);
			data_s(2)	<=	d2_s2(43);
			data_s(3)	<=	d3_s2(43);
			data_s(4)	<=	d4_s2(43);
			data_s(5)	<=	d5_s2(43);
			data_s(6)	<=	d6_s2(43);
			data_s(7)	<=	d7_s2(43);
			data_s(8)	<=	d0_s4(43);
			data_s(9)	<=	d1_s4(43);
			data_s(10)<=	d2_s4(43);
			data_s(11)<=	d3_s4(43);
			data_s(12)<=	d4_s4(43);
			data_s(13)<=	d5_s4(43);
			data_s(14)<=	d6_s4(43);
			data_s(15)<=	d7_s4(43);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(44);
			data_s(1)	<=	d1_s2(44);
			data_s(2)	<=	d2_s2(44);
			data_s(3)	<=	d3_s2(44);
			data_s(4)	<=	d4_s2(44);
			data_s(5)	<=	d5_s2(44);
			data_s(6)	<=	d6_s2(44);
			data_s(7)	<=	d7_s2(44);
			data_s(8)	<=	d0_s4(44);
			data_s(9)	<=	d1_s4(44);
			data_s(10)<=	d2_s4(44);
			data_s(11)<=	d3_s4(44);
			data_s(12)<=	d4_s4(44);
			data_s(13)<=	d5_s4(44);
			data_s(14)<=	d6_s4(44);
			data_s(15)<=	d7_s4(44);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(45);
			data_s(1)	<=	d1_s2(45);
			data_s(2)	<=	d2_s2(45);
			data_s(3)	<=	d3_s2(45);
			data_s(4)	<=	d4_s2(45);
			data_s(5)	<=	d5_s2(45);
			data_s(6)	<=	d6_s2(45);
			data_s(7)	<=	d7_s2(45);
			data_s(8)	<=	d0_s4(45);
			data_s(9)	<=	d1_s4(45);
			data_s(10)<=	d2_s4(45);
			data_s(11)<=	d3_s4(45);
			data_s(12)<=	d4_s4(45);
			data_s(13)<=	d5_s4(45);
			data_s(14)<=	d6_s4(45);
			data_s(15)<=	d7_s4(45);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(46);
			data_s(1)	<=	d1_s2(46);
			data_s(2)	<=	d2_s2(46);
			data_s(3)	<=	d3_s2(46);
			data_s(4)	<=	d4_s2(46);
			data_s(5)	<=	d5_s2(46);
			data_s(6)	<=	d6_s2(46);
			data_s(7)	<=	d7_s2(46);
			data_s(8)	<=	d0_s4(46);
			data_s(9)	<=	d1_s4(46);
			data_s(10)<=	d2_s4(46);
			data_s(11)<=	d3_s4(46);
			data_s(12)<=	d4_s4(46);
			data_s(13)<=	d5_s4(46);
			data_s(14)<=	d6_s4(46);
			data_s(15)<=	d7_s4(46);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(47);
			data_s(1)	<=	d1_s2(47);
			data_s(2)	<=	d2_s2(47);
			data_s(3)	<=	d3_s2(47);
			data_s(4)	<=	d4_s2(47);
			data_s(5)	<=	d5_s2(47);
			data_s(6)	<=	d6_s2(47);
			data_s(7)	<=	d7_s2(47);
			data_s(8)	<=	d0_s4(47);
			data_s(9)	<=	d1_s4(47);
			data_s(10)<=	d2_s4(47);
			data_s(11)<=	d3_s4(47);
			data_s(12)<=	d4_s4(47);
			data_s(13)<=	d5_s4(47);
			data_s(14)<=	d6_s4(47);
			data_s(15)<=	d7_s4(47);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(48);
			data_s(1)	<=	d1_s2(48);
			data_s(2)	<=	d2_s2(48);
			data_s(3)	<=	d3_s2(48);
			data_s(4)	<=	d4_s2(48);
			data_s(5)	<=	d5_s2(48);
			data_s(6)	<=	d6_s2(48);
			data_s(7)	<=	d7_s2(48);
			data_s(8)	<=	d0_s4(48);
			data_s(9)	<=	d1_s4(48);
			data_s(10)<=	d2_s4(48);
			data_s(11)<=	d3_s4(48);
			data_s(12)<=	d4_s4(48);
			data_s(13)<=	d5_s4(48);
			data_s(14)<=	d6_s4(48);
			data_s(15)<=	d7_s4(48);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(49);
			data_s(1)	<=	d1_s2(49);
			data_s(2)	<=	d2_s2(49);
			data_s(3)	<=	d3_s2(49);
			data_s(4)	<=	d4_s2(49);
			data_s(5)	<=	d5_s2(49);
			data_s(6)	<=	d6_s2(49);
			data_s(7)	<=	d7_s2(49);
			data_s(8)	<=	d0_s4(49);
			data_s(9)	<=	d1_s4(49);
			data_s(10)<=	d2_s4(49);
			data_s(11)<=	d3_s4(49);
			data_s(12)<=	d4_s4(49);
			data_s(13)<=	d5_s4(49);
			data_s(14)<=	d6_s4(49);
			data_s(15)<=	d7_s4(49);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(50);
			data_s(1)	<=	d1_s2(50);
			data_s(2)	<=	d2_s2(50);
			data_s(3)	<=	d3_s2(50);
			data_s(4)	<=	d4_s2(50);
			data_s(5)	<=	d5_s2(50);
			data_s(6)	<=	d6_s2(50);
			data_s(7)	<=	d7_s2(50);
			data_s(8)	<=	d0_s4(50);
			data_s(9)	<=	d1_s4(50);
			data_s(10)<=	d2_s4(50);
			data_s(11)<=	d3_s4(50);
			data_s(12)<=	d4_s4(50);
			data_s(13)<=	d5_s4(50);
			data_s(14)<=	d6_s4(50);
			data_s(15)<=	d7_s4(50);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(51);
			data_s(1)	<=	d1_s2(51);
			data_s(2)	<=	d2_s2(51);
			data_s(3)	<=	d3_s2(51);
			data_s(4)	<=	d4_s2(51);
			data_s(5)	<=	d5_s2(51);
			data_s(6)	<=	d6_s2(51);
			data_s(7)	<=	d7_s2(51);
			data_s(8)	<=	d0_s4(51);
			data_s(9)	<=	d1_s4(51);
			data_s(10)<=	d2_s4(51);
			data_s(11)<=	d3_s4(51);
			data_s(12)<=	d4_s4(51);
			data_s(13)<=	d5_s4(51);
			data_s(14)<=	d6_s4(51);
			data_s(15)<=	d7_s4(51);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(52);
			data_s(1)	<=	d1_s2(52);
			data_s(2)	<=	d2_s2(52);
			data_s(3)	<=	d3_s2(52);
			data_s(4)	<=	d4_s2(52);
			data_s(5)	<=	d5_s2(52);
			data_s(6)	<=	d6_s2(52);
			data_s(7)	<=	d7_s2(52);
			data_s(8)	<=	d0_s4(52);
			data_s(9)	<=	d1_s4(52);
			data_s(10)<=	d2_s4(52);
			data_s(11)<=	d3_s4(52);
			data_s(12)<=	d4_s4(52);
			data_s(13)<=	d5_s4(52);
			data_s(14)<=	d6_s4(52);
			data_s(15)<=	d7_s4(52);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(53);
			data_s(1)	<=	d1_s2(53);
			data_s(2)	<=	d2_s2(53);
			data_s(3)	<=	d3_s2(53);
			data_s(4)	<=	d4_s2(53);
			data_s(5)	<=	d5_s2(53);
			data_s(6)	<=	d6_s2(53);
			data_s(7)	<=	d7_s2(53);
			data_s(8)	<=	d0_s4(53);
			data_s(9)	<=	d1_s4(53);
			data_s(10)<=	d2_s4(53);
			data_s(11)<=	d3_s4(53);
			data_s(12)<=	d4_s4(53);
			data_s(13)<=	d5_s4(53);
			data_s(14)<=	d6_s4(53);
			data_s(15)<=	d7_s4(53);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(54);
			data_s(1)	<=	d1_s2(54);
			data_s(2)	<=	d2_s2(54);
			data_s(3)	<=	d3_s2(54);
			data_s(4)	<=	d4_s2(54);
			data_s(5)	<=	d5_s2(54);
			data_s(6)	<=	d6_s2(54);
			data_s(7)	<=	d7_s2(54);
			data_s(8)	<=	d0_s4(54);
			data_s(9)	<=	d1_s4(54);
			data_s(10)<=	d2_s4(54);
			data_s(11)<=	d3_s4(54);
			data_s(12)<=	d4_s4(54);
			data_s(13)<=	d5_s4(54);
			data_s(14)<=	d6_s4(54);
			data_s(15)<=	d7_s4(54);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(55);
			data_s(1)	<=	d1_s2(55);
			data_s(2)	<=	d2_s2(55);
			data_s(3)	<=	d3_s2(55);
			data_s(4)	<=	d4_s2(55);
			data_s(5)	<=	d5_s2(55);
			data_s(6)	<=	d6_s2(55);
			data_s(7)	<=	d7_s2(55);
			data_s(8)	<=	d0_s4(55);
			data_s(9)	<=	d1_s4(55);
			data_s(10)<=	d2_s4(55);
			data_s(11)<=	d3_s4(55);
			data_s(12)<=	d4_s4(55);
			data_s(13)<=	d5_s4(55);
			data_s(14)<=	d6_s4(55);
			data_s(15)<=	d7_s4(55);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(56);
			data_s(1)	<=	d1_s2(56);
			data_s(2)	<=	d2_s2(56);
			data_s(3)	<=	d3_s2(56);
			data_s(4)	<=	d4_s2(56);
			data_s(5)	<=	d5_s2(56);
			data_s(6)	<=	d6_s2(56);
			data_s(7)	<=	d7_s2(56);
			data_s(8)	<=	d0_s4(56);
			data_s(9)	<=	d1_s4(56);
			data_s(10)<=	d2_s4(56);
			data_s(11)<=	d3_s4(56);
			data_s(12)<=	d4_s4(56);
			data_s(13)<=	d5_s4(56);
			data_s(14)<=	d6_s4(56);
			data_s(15)<=	d7_s4(56);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(57);
			data_s(1)	<=	d1_s2(57);
			data_s(2)	<=	d2_s2(57);
			data_s(3)	<=	d3_s2(57);
			data_s(4)	<=	d4_s2(57);
			data_s(5)	<=	d5_s2(57);
			data_s(6)	<=	d6_s2(57);
			data_s(7)	<=	d7_s2(57);
			data_s(8)	<=	d0_s4(57);
			data_s(9)	<=	d1_s4(57);
			data_s(10)<=	d2_s4(57);
			data_s(11)<=	d3_s4(57);
			data_s(12)<=	d4_s4(57);
			data_s(13)<=	d5_s4(57);
			data_s(14)<=	d6_s4(57);
			data_s(15)<=	d7_s4(57);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(58);
			data_s(1)	<=	d1_s2(58);
			data_s(2)	<=	d2_s2(58);
			data_s(3)	<=	d3_s2(58);
			data_s(4)	<=	d4_s2(58);
			data_s(5)	<=	d5_s2(58);
			data_s(6)	<=	d6_s2(58);
			data_s(7)	<=	d7_s2(58);
			data_s(8)	<=	d0_s4(58);
			data_s(9)	<=	d1_s4(58);
			data_s(10)<=	d2_s4(58);
			data_s(11)<=	d3_s4(58);
			data_s(12)<=	d4_s4(58);
			data_s(13)<=	d5_s4(58);
			data_s(14)<=	d6_s4(58);
			data_s(15)<=	d7_s4(58);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(59);
			data_s(1)	<=	d1_s2(59);
			data_s(2)	<=	d2_s2(59);
			data_s(3)	<=	d3_s2(59);
			data_s(4)	<=	d4_s2(59);
			data_s(5)	<=	d5_s2(59);
			data_s(6)	<=	d6_s2(59);
			data_s(7)	<=	d7_s2(59);
			data_s(8)	<=	d0_s4(59);
			data_s(9)	<=	d1_s4(59);
			data_s(10)<=	d2_s4(59);
			data_s(11)<=	d3_s4(59);
			data_s(12)<=	d4_s4(59);
			data_s(13)<=	d5_s4(59);
			data_s(14)<=	d6_s4(59);
			data_s(15)<=	d7_s4(59);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(60);
			data_s(1)	<=	d1_s2(60);
			data_s(2)	<=	d2_s2(60);
			data_s(3)	<=	d3_s2(60);
			data_s(4)	<=	d4_s2(60);
			data_s(5)	<=	d5_s2(60);
			data_s(6)	<=	d6_s2(60);
			data_s(7)	<=	d7_s2(60);
			data_s(8)	<=	d0_s4(60);
			data_s(9)	<=	d1_s4(60);
			data_s(10)<=	d2_s4(60);
			data_s(11)<=	d3_s4(60);
			data_s(12)<=	d4_s4(60);
			data_s(13)<=	d5_s4(60);
			data_s(14)<=	d6_s4(60);
			data_s(15)<=	d7_s4(60);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(61);
			data_s(1)	<=	d1_s2(61);
			data_s(2)	<=	d2_s2(61);
			data_s(3)	<=	d3_s2(61);
			data_s(4)	<=	d4_s2(61);
			data_s(5)	<=	d5_s2(61);
			data_s(6)	<=	d6_s2(61);
			data_s(7)	<=	d7_s2(61);
			data_s(8)	<=	d0_s4(61);
			data_s(9)	<=	d1_s4(61);
			data_s(10)<=	d2_s4(61);
			data_s(11)<=	d3_s4(61);
			data_s(12)<=	d4_s4(61);
			data_s(13)<=	d5_s4(61);
			data_s(14)<=	d6_s4(61);
			data_s(15)<=	d7_s4(61);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(62);
			data_s(1)	<=	d1_s2(62);
			data_s(2)	<=	d2_s2(62);
			data_s(3)	<=	d3_s2(62);
			data_s(4)	<=	d4_s2(62);
			data_s(5)	<=	d5_s2(62);
			data_s(6)	<=	d6_s2(62);
			data_s(7)	<=	d7_s2(62);
			data_s(8)	<=	d0_s4(62);
			data_s(9)	<=	d1_s4(62);
			data_s(10)<=	d2_s4(62);
			data_s(11)<=	d3_s4(62);
			data_s(12)<=	d4_s4(62);
			data_s(13)<=	d5_s4(62);
			data_s(14)<=	d6_s4(62);
			data_s(15)<=	d7_s4(62);
			---------------------------------------------
			wait for period;
			-------------------MINIEUSO----------------
			data_s(0)	<=	d0_s2(63);
			data_s(1)	<=	d1_s2(63);
			data_s(2)	<=	d2_s2(63);
			data_s(3)	<=	d3_s2(63);
			data_s(4)	<=	d4_s2(63);
			data_s(5)	<=	d5_s2(63);
			data_s(6)	<=	d6_s2(63);
			data_s(7)	<=	d7_s2(63);
			data_s(8)	<=	d0_s4(63);
			data_s(9)	<=	d1_s4(63);
			data_s(10)<=	d2_s4(63);
			data_s(11)<=	d3_s4(63);
			data_s(12)<=	d4_s4(63);
			data_s(13)<=	d5_s4(63);
			data_s(14)<=	d6_s4(63);
			data_s(15)<=	d7_s4(63);
			---------------------------------------------------
			if ( I = 2) then
			   wait for period;
			end if;
	       end loop;
			
			frame_s		<= '0';
			------------------------------------------------------------
			wait for 115*period;   --Standard FRAME IDLE TIME
--			wait for 615*period;     --Alexander DDR test FRAME IDLE TIME
			------------------------------------------------------------
			
		end loop;
				
		wait for 100000*period;
		FILE_CLOSE(file_in_ec);
		
	end process;
	
	gen_sum128_L1:process
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
       case (file_name) is
           when 0 =>
                FILE_OPEN(file_out,"Data_OUT_L1_EC0EC1EC2.txt",WRITE_MODE);
           when 1 =>
                FILE_OPEN(file_out,"Data_OUT_L1_EC3EC4EC5.txt",WRITE_MODE);
            when 2 =>
                FILE_OPEN(file_out,"Data_OUT_L1_EC6EC7EC8.txt",WRITE_MODE);     
           when others =>
               null;
        end case;
        
--		FILE_OPEN(file_out,"Data_OUT_L1.txt",WRITE_MODE);
		loop
			wait for period_axi;
			if (m_axis_tvalid_l1 = '1') then
				d_value:= conv_integer(m_axis_tdata_l1_s(14 downto 0));
				write(line_out,d_value);
				writeline(file_out,line_out);
				d_value:= conv_integer(m_axis_tdata_l1_s(29 downto 15));
				write(line_out,d_value);
				writeline(file_out,line_out);
				if (m_axis_tlast_l1_s = '1') then
				    writeline(file_out,line_out);
				end if;
				
				m_axis_tready_l1_s	<=	'1';
				wait for period_axi;
				m_axis_tready_l1_s	<=	'0';
				wait for period_axi;
			end if;
		end loop;
		FILE_CLOSE(file_out);
	end process;
	
  --  End Test Bench 
  END arch_DATAGENERATOR;
