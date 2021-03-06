-- MINIEUSO TestBench Template M.Mignone 10/2016
--INFN Torino

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.std_logic_arith.ALL;
  USE ieee.std_logic_unsigned.ALL;
  --USE ieee.numeric_std.ALL;
  USE	ieee.std_logic_textio.ALL;
  use STD.textio.ALL;

  ENTITY testbench_PDM IS
  END testbench_PDM;

  ARCHITECTURE behavior OF testbench_PDM IS 

  -- Component Declaration
    COMPONENT ALGO_B
    PORT(
        CLOCK_200               :	in	    std_logic;
		--------------------------EUSO-TA-------------------
        DATA_EC0EC1EC2          :	in	    std_logic_vector(15 downto 0);
        DATA_EC3EC4EC5          :	in	    std_logic_vector(15 downto 0);
        DATA_EC6EC7EC8          :	in	    std_logic_vector(15 downto 0);
        FRAME                   :	in	    std_logic;
		------------------------------------------------------
		--FIFO L1 128 GTU SUM EC0EC1EC2
		s_aresetn_EC0EC1EC2		:	in		std_logic;
		m_aclk_EC0EC1EC2		:	in		std_logic;
		m_axis_tvalid_EC0EC1EC2 :	out	    std_logic;
		m_axis_tready_EC0EC1EC2	: 	in		std_logic;
		m_axis_tdata_EC0EC1EC2	: 	out	    std_logic_vector(31 downto 0);
		m_axis_tlast_EC0EC1EC2  :   out     std_logic;
		--FIFO L1 128 GTU SUM EC3EC4EC5
        s_aresetn_EC3EC4EC5     :   in      std_logic;
        m_aclk_EC3EC4EC5        :   in      std_logic;
        m_axis_tvalid_EC3EC4EC5 :   out     std_logic;
        m_axis_tready_EC3EC4EC5 :   in      std_logic;
        m_axis_tdata_EC3EC4EC5  :   out     std_logic_vector(31 downto 0);
        m_axis_tlast_EC3EC4EC5  :   out     std_logic;
        --FIFO L1 128 GTU SUM EC6EC7EC8
        s_aresetn_EC6EC7EC8     :   in      std_logic;
        m_aclk_EC6EC7EC8        :   in      std_logic;
        m_axis_tvalid_EC6EC7EC8 :   out     std_logic;
        m_axis_tready_EC6EC7EC8 :   in      std_logic;
        m_axis_tdata_EC6EC7EC8  :   out     std_logic_vector(31 downto 0);
        m_axis_tlast_EC6EC7EC8  :   out     std_logic;
		--FIFO EVENT
        s_aresetn_ev            :   in      std_logic;
        m_aclk_ev               :   in      std_logic;
        m_axis_tvalid_ev        :   out     std_logic;
        m_axis_tready_ev        :   in      std_logic;
        m_axis_tdata_ev         :   out     std_logic_vector(31 downto 0);
        m_axis_tlast_ev         :   out     std_logic;
        --INPUT L1 COMMAND THRESHOLD
        THR_CMD                 :   IN      STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
    END COMPONENT;
    
    COMPONENT DATAGENERATOR
    generic (file_name: integer;
            period: time;
            period_axi: time;
            delay: time;
            delay_data: time);
    PORT(
        CLOCK_200           :   in        std_logic;
        --------------------------EUSO-TA-------------------
        DATA                :   out        std_logic_vector(15 downto 0);
        FRAME               :   out        std_logic;
        ------------------------------------------------------
        --FIFO L1 SUM128
        s_aresetn_L1        :   out        std_logic;
        m_aclk_L1           :   in         std_logic;
        m_axis_tvalid_L1    :   in         std_logic;
        m_axis_tready_L1    :   out        std_logic;
        m_axis_tdata_L1     :   in         std_logic_vector(31 downto 0);
        m_axis_tlast_L1     :   in         std_logic
        );
    END COMPONENT;
	
	SIGNAL 	s_aresetn_l1_ec0ec1ec2 	:  std_logic :='1';
	SIGNAL 	s_aresetn_l1_ec3ec4ec5 	:  std_logic :='1';
	SIGNAL 	s_aresetn_l1_ec6ec7ec8 	:  std_logic :='1';
	
	SIGNAL 	s_aresetn_cmd_s     	:  std_logic :='1';
	SIGNAL 	s_aresetn_ev_s 	        :  std_logic :='1';
	
	SIGNAL	clock            		:	std_logic :='0';
	SIGNAL	clock_axi       		:	std_logic :='0';

	--------------------------------------------------
	SIGNAL	data_ec0ec1ec2			:	std_logic_vector(15 downto 0) := ( others => '0');
	SIGNAL	frame_ec0ec1ec2	        :	std_logic := '0';
	
	SIGNAL	data_ec3ec4ec5			:	std_logic_vector(15 downto 0) := ( others => '0');
    SIGNAL  frame_ec3ec4ec5         :   std_logic := '0';
    
    SIGNAL	data_ec6ec7ec8			:	std_logic_vector(15 downto 0) := ( others => '0');
    SIGNAL  frame_ec6ec7ec8         :   std_logic := '0';
	----------------------------------------------------------
	SIGNAL	m_axis_tready_l1_ec0ec1ec2	:	std_logic := '0';
	SIGNAL	m_axis_tvalid_l1_ec0ec1ec2	:	std_logic;
	SIGNAL	m_axis_tdata_l1_ec0ec1ec2	:	std_logic_vector(31 downto 0);
	SIGNAL	m_axis_tlast_l1_ec0ec1ec2	:	std_logic;
	
	SIGNAL	m_axis_tready_l1_ec3ec4ec5	:	std_logic := '0';
    SIGNAL  m_axis_tvalid_l1_ec3ec4ec5  :   std_logic;
    SIGNAL  m_axis_tdata_l1_ec3ec4ec5   :   std_logic_vector(31 downto 0);
    SIGNAL  m_axis_tlast_l1_ec3ec4ec5   :   std_logic;
    
    SIGNAL	m_axis_tready_l1_ec6ec7ec8	:	std_logic := '0';
    SIGNAL  m_axis_tvalid_l1_ec6ec7ec8  :   std_logic;
    SIGNAL  m_axis_tdata_l1_ec6ec7ec8   :   std_logic_vector(31 downto 0);
    SIGNAL  m_axis_tlast_l1_ec6ec7ec8   :   std_logic;
	
    SIGNAL	m_axis_tready_ev_s	  :	  std_logic := '0';
    SIGNAL  m_axis_tvalid_ev_s    :   std_logic;
    SIGNAL  m_axis_tdata_ev_s     :   std_logic_vector(31 downto 0);
    SIGNAL  m_axis_tlast_ev_s     :   std_logic;
    
    SIGNAL  THR_CMD_s            :   std_logic_vector(31 downto 0) := "00000000000001000000001110000110";
    
	CONSTANT period			: 	time := 5 ns;
	CONSTANT period_axi		: 	time := 10 ns;
	CONSTANT delay			:	time := 10 ns;
	CONSTANT delay_data	    :	time := 2.5 ns;
	
--	-------------------------------------------
--	--Test with DDR data
--	CONSTANT period			: 	time:= 10 ns;
--  CONSTANT delay          :   time := 20 ns;
--  CONSTANT delay_data     :   time := 5 ns;
--  -----------------------------------------------
	
--	CONSTANT period_axi		: 	time := 10 ns;
--	CONSTANT period_l2      :   time := 25 ns;
	
--	-----------------------------------------------
--	--Test with DDR data
--	CONSTANT period_axi		: 	time:= 20 ns;
--  CONSTANT period_l2      :   time:= 50 ns;
--  ------------------------------------------------
				
  BEGIN

    -- Component Instantiation
    uut:ALGO_B
    PORT MAP(
        CLOCK_200				=>	clock,
        -------------------------MINIEUSO---------
        DATA_EC0EC1EC2  	    => data_ec0ec1ec2,
        DATA_EC3EC4EC5  	    => data_ec3ec4ec5,
        DATA_EC6EC7EC8  	    => data_ec6ec7ec8,
        FRAME				    => frame_ec0ec1ec2,
        ------------------------------------------
        s_aresetn_EC0EC1EC2		=> s_aresetn_L1_ec0ec1ec2,
        m_aclk_EC0EC1EC2		=> clock_axi,
        m_axis_tvalid_EC0EC1EC2 => m_axis_tvalid_l1_ec0ec1ec2,
        m_axis_tready_EC0EC1EC2	=> m_axis_tready_l1_ec0ec1ec2,
        m_axis_tdata_EC0EC1EC2  => m_axis_tdata_l1_ec0ec1ec2,
        m_axis_tlast_EC0EC1EC2  => m_axis_tlast_l1_ec0ec1ec2,
        ------------------------------------------
        s_aresetn_EC3EC4EC5     => s_aresetn_L1_ec3ec4ec5,
        m_aclk_EC3EC4EC5        => clock_axi,
        m_axis_tvalid_EC3EC4EC5 => m_axis_tvalid_l1_ec3ec4ec5,
        m_axis_tready_EC3EC4EC5 => m_axis_tready_l1_ec3ec4ec5,
        m_axis_tdata_EC3EC4EC5  => m_axis_tdata_l1_ec3ec4ec5,
        m_axis_tlast_EC3EC4EC5  => m_axis_tlast_l1_ec3ec4ec5,
        ------------------------------------------
        s_aresetn_EC6EC7EC8     => s_aresetn_L1_ec6ec7ec8,
        m_aclk_EC6EC7EC8        => clock_axi,
        m_axis_tvalid_EC6EC7EC8 => m_axis_tvalid_l1_ec6ec7ec8,
        m_axis_tready_EC6EC7EC8 => m_axis_tready_l1_ec6ec7ec8,
        m_axis_tdata_EC6EC7EC8  => m_axis_tdata_l1_ec6ec7ec8,
        m_axis_tlast_EC6EC7EC8  => m_axis_tlast_l1_ec6ec7ec8,	
        ------------------------------------------
        s_aresetn_ev 			=> s_aresetn_ev_s,
        m_aclk_ev               => clock_axi,
        m_axis_tvalid_ev        => m_axis_tvalid_ev_s,
        m_axis_tready_ev        => m_axis_tready_ev_s,
        m_axis_tdata_ev         => m_axis_tdata_ev_s,
        m_axis_tlast_ev         => m_axis_tlast_ev_s,
        -------------------------------------------
        --THR COMMAND IN
        THR_CMD                 => THR_CMD_s   		
    );
    
    DATAGEN_EC0EC1EC2:DATAGENERATOR
    --period = 5ns CLOCK_200=200MHz
    --If file_name = 0 
    --Read  Data_IN_EC0EC1EC2.txt
    --Write Data_OUT_L1_EC0EC1EC2.txt
    GENERIC MAP(file_name => 0,period => period,period_axi => period_axi,delay => delay,delay_data => delay_data)
    PORT MAP(
        CLOCK_200                =>    clock,
        -------------------------MINIEUSO---------
        DATA                     =>    data_ec0ec1ec2,
        FRAME                    => frame_ec0ec1ec2,
        ------------------------------------------
        s_aresetn_L1             => s_aresetn_L1_ec0ec1ec2,
        m_aclk_L1                => clock_axi,
        m_axis_tvalid_L1         => m_axis_tvalid_l1_ec0ec1ec2,
        m_axis_tready_L1         => m_axis_tready_l1_ec0ec1ec2,
        m_axis_tdata_L1          => m_axis_tdata_L1_ec0ec1ec2,
        m_axis_tlast_L1          => m_axis_tlast_l1_ec0ec1ec2             
    );
    
    DATAGEN_EC3EC4EC5:DATAGENERATOR
    --period = 5ns CLOCK_200=200MHz
    --If file_name = 1 
    --Read  Data_IN_EC3EC4EC5.txt
    --Write Data_OUT_L1_EC3EC4EC5.txt
    GENERIC MAP(file_name => 1,period => period,period_axi => period_axi,delay => delay,delay_data => delay_data)
    PORT MAP(
        CLOCK_200                =>    clock,
        -------------------------MINIEUSO---------
        DATA                     => data_ec3ec4ec5,
        FRAME                    => frame_ec3ec4ec5,
        ------------------------------------------
        s_aresetn_L1             => s_aresetn_L1_ec3ec4ec5,
        m_aclk_L1                => clock_axi,
        m_axis_tvalid_L1         => m_axis_tvalid_l1_ec3ec4ec5,
        m_axis_tready_L1         => m_axis_tready_l1_ec3ec4ec5,
        m_axis_tdata_L1          => m_axis_tdata_L1_ec3ec4ec5,
        m_axis_tlast_L1          => m_axis_tlast_l1_ec3ec4ec5             
    );
    
    DATAGEN_EC6EC7EC8:DATAGENERATOR
    --period = 5ns CLOCK_200=200MHz
    --If file_name = 2 
    --Read  Data_IN_EC6EC7EC8.txt
    --Write Data_OUT_L1_EC6EC7EC8.txt
    GENERIC MAP(file_name => 2,period => period,period_axi => period_axi,delay => delay,delay_data => delay_data)
    PORT MAP(
        CLOCK_200                =>    clock,
        -------------------------MINIEUSO---------
        DATA                     => data_ec6ec7ec8,
        FRAME                    => frame_ec6ec7ec8,
        ------------------------------------------
        s_aresetn_L1             => s_aresetn_L1_ec6ec7ec8,
        m_aclk_L1                => clock_axi,
        m_axis_tvalid_L1         => m_axis_tvalid_l1_ec6ec7ec8,
        m_axis_tready_L1         => m_axis_tready_l1_ec6ec7ec8,
        m_axis_tdata_L1          => m_axis_tdata_L1_ec6ec7ec8,
        m_axis_tlast_L1          => m_axis_tlast_l1_ec6ec7ec8             
    );
    
    clock	<=	not clock after period/2;
    clock_axi <= not clock_axi after period_axi/2;
    
    
    
    EVENT_L1:process--Read EVENT FIFO
        variable    d_gtu_gen   :    integer;
        variable    d_n_auto    :    integer;
        variable    d_s_auto    :    integer;
        variable    d_avg_thr   :    integer;
        variable    d_gtu       :    integer;
        variable    d_line      :    integer;
        variable    d_col       :    integer;
        variable    d_value     :    integer;
        variable    line_out    :    line;
        FILE        file_out    :    text;
    begin
        FILE_OPEN(file_out,"Data_EVENT.txt",WRITE_MODE);
        loop
            wait for period_axi;
            if (m_axis_tvalid_ev_s = '1') then
                d_value:= conv_integer(m_axis_tdata_ev_s(20));--PDM_TRIGGER2
                write(line_out,d_value,right,2);
                d_value:= conv_integer(m_axis_tdata_ev_s(19));--PDM_TRIGGER1
                write(line_out,d_value,right,2);
                
                d_value:= conv_integer(m_axis_tdata_ev_s(18));--EC_TRIGGER2 EC6EC7EC8
                write(line_out,d_value,right,4);
                d_value:= conv_integer(m_axis_tdata_ev_s(17));--EC_TRIGGER1 EC6EC7EC8
                write(line_out,d_value,right,2);
                d_value:= conv_integer(m_axis_tdata_ev_s(16));--PMT_TRIGGER2 EC6EC7EC8
                write(line_out,d_value,right,2);
                d_value:= conv_integer(m_axis_tdata_ev_s(15));--PMT_TRIGGER1 EC6EC7EC8
                write(line_out,d_value,right,2);
                
                d_value:= conv_integer(m_axis_tdata_ev_s(14));--EC_TRIGGER2 EC3EC4EC5
                write(line_out,d_value,right,4);
                d_value:= conv_integer(m_axis_tdata_ev_s(13));--EC_TRIGGER1 EC3EC4EC5
                write(line_out,d_value,right,2);
                d_value:= conv_integer(m_axis_tdata_ev_s(12));--PMT_TRIGGER2 EC3EC4EC5
                write(line_out,d_value,right,2);
                d_value:= conv_integer(m_axis_tdata_ev_s(11));--PMT_TRIGGER1 EC3EC4EC5
                write(line_out,d_value,right,2);
                
                d_value:= conv_integer(m_axis_tdata_ev_s(10));--EC_TRIGGER2 EC0EC1EC2
                write(line_out,d_value,right,4);
                d_value:= conv_integer(m_axis_tdata_ev_s(9));--EC_TRIGGER1 EC0EC1EC2
                write(line_out,d_value,right,2);
                d_value:= conv_integer(m_axis_tdata_ev_s(8));--PMT_TRIGGER2 EC0EC1EC2
                write(line_out,d_value,right,2);
                d_value:= conv_integer(m_axis_tdata_ev_s(7));--PMT_TRIGGER1 EC0EC1EC2
                write(line_out,d_value,right,2);
                d_value:= conv_integer(m_axis_tdata_ev_s(6 downto 0));--GTU
                write(line_out,d_value,right,5);
                    
                writeline(file_out,line_out);
                if (m_axis_tlast_ev_s = '1') then
                    writeline(file_out,line_out);
                end if;
                    
                m_axis_tready_ev_s    <=    '1';
                wait for period_axi;
                m_axis_tready_ev_s    <=    '0';
                wait for period_axi;
            end if;
        end loop;
        FILE_CLOSE(file_out);
    end process;
    
    write_cmd:process--Write command FIFO
        begin
            wait for 50ns;
           
           THR_CMD_s(6 downto 0)    <= conv_std_logic_vector(6,7);--PMT_THR1 (0:64)
           THR_CMD_s(14 downto 7)   <= conv_std_logic_vector(7,8);--PMT_THR2 (0:128)
           THR_CMD_s(23 downto 15)  <= conv_std_logic_vector(8,9);--EC_THR1 (0:256)
           THR_CMD_s(31 downto 24)  <= "00000000";--Selector cmd type "00"
           wait for period;
           THR_CMD_s(9 downto 0)    <= conv_std_logic_vector(10,10);--EC_THR2 (0:512)
           THR_CMD_s(21 downto 10)  <= conv_std_logic_vector(18,12);--PDM_THR1 (0:2304)
           THR_CMD_s(31 downto 22)  <= "0100000000";--Selector cmd type"01"
           wait for period;
           THR_CMD_s(12 downto 0)  <= conv_std_logic_vector(25,13);--PDM_THR2 (0:4608)
           THR_CMD_s(31 downto 13) <= "1000000000000000000";--Selector cmd type "10"
           wait;
        end process;
    
    
  --  End Test Bench 
  END behavior;
