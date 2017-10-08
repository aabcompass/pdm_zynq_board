library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

Library xpm;
use xpm.vcomponents.all;

entity axis_flow_control is
	generic (
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 7;
		-- Width of S_AXI data bus
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		-- Width of S_AXI address bus
		C_S_AXI_ADDR_WIDTH	: integer	:= 7;
		C_AXIS_DWIDTH : integer := 64;
		C_CNT_DWIDTH : integer := 32
	);
  Port ( 
  		-- in
			s_axis_aclk : IN STD_LOGIC;
  		s_axis_aresetn : IN STD_LOGIC;
  		
  		s_axis_tvalid : IN STD_LOGIC;
  		s_axis_tready : OUT STD_LOGIC;
  		s_axis_tdata : IN STD_LOGIC_VECTOR(C_AXIS_DWIDTH-1 DOWNTO 0);
  		s_axis_tlast : IN STD_LOGIC;
  		
  		-- out
			m_axis_tvalid : OUT STD_LOGIC;
  		m_axis_tready : IN STD_LOGIC;
  		m_axis_tdata : OUT STD_LOGIC_VECTOR(C_AXIS_DWIDTH-1 DOWNTO 0);
  		m_axis_tlast : OUT STD_LOGIC;
  		
  		trig0 : in std_logic;
  		trig1 : in std_logic;
  		trig2 : in std_logic;
  		trig_button: in std_logic;
  		
  		trig_led: out std_logic := '0';
  		
  		gtu_sig: in std_logic; 	
  		
  		gpio_0, gpio_1, gpio_2, gpio_3, gpio_4, gpio_5: in std_logic_vector(31 downto 0) := (others => '0');
  		
		-- Global Clock Signal
  		S_AXI_ACLK	: in std_logic;
  		-- Global Reset Signal. This Signal is Active LOW
  		S_AXI_ARESETN	: in std_logic;
  		-- Write address (issued by master, acceped by Slave)
  		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
  		-- Write channel Protection type. This signal indicates the
    		-- privilege and security level of the transaction, and whether
    		-- the transaction is a data access or an instruction access.
  		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
  		-- Write address valid. This signal indicates that the master signaling
    		-- valid write address and control information.
  		S_AXI_AWVALID	: in std_logic;
  		-- Write address ready. This signal indicates that the slave is ready
    		-- to accept an address and associated control signals.
  		S_AXI_AWREADY	: out std_logic;
  		-- Write data (issued by master, acceped by Slave) 
  		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
  		-- Write strobes. This signal indicates which byte lanes hold
    		-- valid data. There is one write strobe bit for each eight
    		-- bits of the write data bus.    
  		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
  		-- Write valid. This signal indicates that valid write
    		-- data and strobes are available.
  		S_AXI_WVALID	: in std_logic;
  		-- Write ready. This signal indicates that the slave
    		-- can accept the write data.
  		S_AXI_WREADY	: out std_logic;
  		-- Write response. This signal indicates the status
    		-- of the write transaction.
  		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
  		-- Write response valid. This signal indicates that the channel
    		-- is signaling a valid write response.
  		S_AXI_BVALID	: out std_logic;
  		-- Response ready. This signal indicates that the master
    		-- can accept a write response.
  		S_AXI_BREADY	: in std_logic;
  		-- Read address (issued by master, acceped by Slave)
  		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
  		-- Protection type. This signal indicates the privilege
    		-- and security level of the transaction, and whether the
    		-- transaction is a data access or an instruction access.
  		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
  		-- Read address valid. This signal indicates that the channel
    		-- is signaling valid read address and control information.
  		S_AXI_ARVALID	: in std_logic;
  		-- Read address ready. This signal indicates that the slave is
    		-- ready to accept an address and associated control signals.
  		S_AXI_ARREADY	: out std_logic;
  		-- Read data (issued by slave)
  		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
  		-- Read response. This signal indicates the status of the
    		-- read transfer.
  		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
  		-- Read valid. This signal indicates that the channel is
    		-- signaling the required read data.
  		S_AXI_RVALID	: out std_logic;
  		-- Read ready. This signal indicates that the master can
    		-- accept the read data and response information.
  		S_AXI_RREADY	: in std_logic
  );
end axis_flow_control;
    
architecture Behavioral of axis_flow_control is

	-- AXI4LITE signals
	signal axi_awaddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
	signal axi_awready	: std_logic;
	signal axi_wready	: std_logic;
	signal axi_bresp	: std_logic_vector(1 downto 0);
	signal axi_bvalid	: std_logic;
	signal axi_araddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
	signal axi_arready	: std_logic;
	signal axi_rdata	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal axi_rresp	: std_logic_vector(1 downto 0);
	signal axi_rvalid	: std_logic;

	-- Example-specific design signals
	-- local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	-- ADDR_LSB is used for addressing 32/64 bit registers/memories
	-- ADDR_LSB = 2 for 32 bits (n downto 2)
	-- ADDR_LSB = 3 for 64 bits (n downto 3)
	constant ADDR_LSB  : integer := (C_S_AXI_DATA_WIDTH/32)+ 1;
	constant OPT_MEM_ADDR_BITS : integer := 4;
	------------------------------------------------
	---- Signals for user logic register space example
	--------------------------------------------------
	---- Number of Slave Registers 32
	signal slv_reg0	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg1	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg2	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg3	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg4	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg5	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg6	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg7	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg8	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg9	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg10	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg11	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg12	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg13	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg14	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg15	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg16	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg17	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg18	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg19	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg20	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg21	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg22	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg23	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg24	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg25	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg26	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg27	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg28	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg29	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg30	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg31	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg_rden	: std_logic;
	signal slv_reg_wren	: std_logic;
	signal reg_data_out	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal byte_index	: integer;

	signal sm_state: std_logic_vector(3 downto 0) := "0000";

	signal is_started: std_logic := '0';
	signal en_int_trig, en_algo_trig, periodic_trig_en: std_logic := '0';
	signal periodic_trig_d0, periodic_trig_d1: std_logic := '0';
	signal release: std_logic := '0';
	signal trig: std_logic := '0';
	signal periodic_trig: std_logic := '0';
	signal pass: std_logic := '0';

	signal clear_error: std_logic := '0';
	signal m_axis_fifo_error: std_logic := '0';
	
	signal trans_counter, trans_counter_latch: std_logic_vector(C_CNT_DWIDTH-1 downto 0) := (others => '0');
	signal trig_cnt: std_logic_vector(C_CNT_DWIDTH-1 downto 0) := (others => '0');
	signal trig_delay: std_logic_vector(C_CNT_DWIDTH-1 downto 0) := (others => '0');
	signal clr_trans_counter : std_logic := '0';
	
	signal gtu_sig_d0, gtu_sig_d1: std_logic := '0';
	signal gtu_sig_counter_l, gtu_sig_counter_l_d1, gtu_sig_counter_h, gtu_sig_counter_4dma: std_logic_vector(31 downto 0) := (others => '0');
	signal gtu_sig_counter_l_latch, gtu_sig_counter_h_latch : std_logic_vector(31 downto 0) := (others => '0');
	
	signal trig_test_gtu_time_l, trig_test_gtu_time_h : std_logic_vector(31 downto 0) := (others => '0');
	signal periodic_trig_phase : std_logic_vector(20 downto 0) := (others => '0');
	
	signal led_cnt : std_logic_vector(23 downto 0) := (others => '0');
	signal dma_length, dma_length_cntr : std_logic_vector(19 downto 0) := (others => '0');
	
	signal int_trig_d0, int_trig_d1, int_trig, trig_force : std_logic := '0';

	component debounce IS
		GENERIC(
			counter_size  :  INTEGER := 19); --counter size (19 bits gives 10.5ms with 50MHz clock)
		PORT(
			clk     : IN  STD_LOGIC;  --input clock
			button  : IN  STD_LOGIC;  --input signal to be debounced
			result  : OUT STD_LOGIC); --debounced signal
		END component;
		
	signal trig_button_debounced: std_logic;
	signal trig_button_n: std_logic;
	signal clr_all: std_logic;
	
	signal restart_intr: std_logic;
	
	COMPONENT axis_fifo_fc
		PORT (
			s_axis_aresetn : IN STD_LOGIC;
			s_axis_aclk : IN STD_LOGIC;
			s_axis_tvalid : IN STD_LOGIC;
			s_axis_tlast : IN STD_LOGIC;
			s_axis_tready : OUT STD_LOGIC;
			s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
			m_axis_tvalid : OUT STD_LOGIC;
			m_axis_tlast : OUT STD_LOGIC;
			m_axis_tready : IN STD_LOGIC;
			m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
			axis_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			axis_wr_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			axis_rd_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT axis_fifo_fc_32
		PORT (
			s_axis_aresetn : IN STD_LOGIC;
			s_axis_aclk : IN STD_LOGIC;
			s_axis_tvalid : IN STD_LOGIC;
			s_axis_tlast : IN STD_LOGIC;
			s_axis_tready : OUT STD_LOGIC;
			s_axis_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			m_axis_tvalid : OUT STD_LOGIC;
			m_axis_tlast : OUT STD_LOGIC;
			m_axis_tready : IN STD_LOGIC;
			m_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			axis_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			axis_wr_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			axis_rd_data_count : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;
	
	signal axis_fifo_fc_count: std_logic_vector(31 downto 0) := (others => '0');
	
	signal m_axis_tlast_key : std_logic := '0';
	signal m_axis_tlast_i : std_logic := '0';
	signal m_axis_tlast_allowed : std_logic := '0';
	signal m_axis_tlast_allowed_d1 : std_logic := '0';
	
	
	signal m_axis_tlast_not_buffered : std_logic := '0';--=> s_axis_tvalid_not_buffered,
	signal m_axis_tvalid_not_buffered : std_logic := '0';--=> s_axis_tvalid_not_buffered,
	signal m_axis_tready_not_buffered : std_logic := '0';--=> s_axis_tready_not_buffered,
	signal m_axis_tdata_not_buffered: std_logic_vector(C_AXIS_DWIDTH-1 downto 0) := (others => '0');--=> s_axis_tdata_not_buffered,

	signal m_axis_tvalid_key, m_axis_tready_key, pass_intr: std_logic := '0';
	
	signal counter_tvalid: std_logic_vector(15 downto 0) := (others => '0');
	signal counter_tvalid_latch: std_logic_vector(15 downto 0) := (others => '0');
	signal tlast_counter: std_logic_vector(15 downto 0) := (others => '0');
	
	attribute keep : string;  
	attribute keep of m_axis_tvalid_key: signal is "true";  
	attribute keep of m_axis_tready_key: signal is "true";  
	attribute keep of pass_intr: signal is "true";  
	attribute keep of m_axis_tvalid_not_buffered: signal is "true";  
	attribute keep of m_axis_tdata_not_buffered: signal is "true";  
	attribute keep of m_axis_tready_not_buffered: signal is "true";  
	attribute keep of m_axis_tlast_allowed: signal is "true";  
	attribute keep of axis_fifo_fc_count: signal is "true";  
	attribute keep of dma_length_cntr: signal is "true";  
	attribute keep of dma_length: signal is "true";  
	attribute keep of counter_tvalid_latch: signal is "true";  
	attribute keep of tlast_counter: signal is "true";  
	attribute keep of sm_state: signal is "true";  

begin


	-- I/O Connections assignments

	S_AXI_AWREADY	<= axi_awready;
	S_AXI_WREADY	<= axi_wready;
	S_AXI_BRESP	<= axi_bresp;
	S_AXI_BVALID	<= axi_bvalid;
	S_AXI_ARREADY	<= axi_arready;
	S_AXI_RDATA	<= axi_rdata;
	S_AXI_RRESP	<= axi_rresp;
	S_AXI_RVALID	<= axi_rvalid;
	-- Implement axi_awready generation
	-- axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	-- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	-- de-asserted when reset is low.

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_awready <= '0';
	    else
	      if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1') then
	        -- slave is ready to accept write address when
	        -- there is a valid write address and write data
	        -- on the write address and data bus. This design 
	        -- expects no outstanding transactions. 
	        axi_awready <= '1';
	      else
	        axi_awready <= '0';
	      end if;
	    end if;
	  end if;
	end process;

	-- Implement axi_awaddr latching
	-- This process is used to latch the address when both 
	-- S_AXI_AWVALID and S_AXI_WVALID are valid. 

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_awaddr <= (others => '0');
	    else
	      if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1') then
	        -- Write Address latching
	        axi_awaddr <= S_AXI_AWADDR;
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement axi_wready generation
	-- axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	-- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	-- de-asserted when reset is low. 

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_wready <= '0';
	    else
	      if (axi_wready = '0' and S_AXI_WVALID = '1' and S_AXI_AWVALID = '1') then
	          -- slave is ready to accept write data when 
	          -- there is a valid write address and write data
	          -- on the write address and data bus. This design 
	          -- expects no outstanding transactions.           
	          axi_wready <= '1';
	      else
	        axi_wready <= '0';
	      end if;
	    end if;
	  end if;
	end process; 

	-- Implement memory mapped register select and write logic generation
	-- The write data is accepted and written to memory mapped registers when
	-- axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	-- select byte enables of slave registers while writing.
	-- These registers are cleared when reset (active low) is applied.
	-- Slave register write enable is asserted when valid address and data are available
	-- and the slave is ready to accept the write address and write data.
	slv_reg_wren <= axi_wready and S_AXI_WVALID and axi_awready and S_AXI_AWVALID ;

	process (S_AXI_ACLK)
	variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0); 
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      slv_reg0 <= (others => '0');
	      slv_reg1 <= (others => '0');
	      slv_reg2 <= (others => '0');
	      slv_reg3 <= (others => '0');
	      slv_reg4 <= (others => '0');
	      slv_reg5 <= (others => '0');
	      slv_reg6 <= (others => '0');
	      slv_reg7 <= (others => '0');
	      slv_reg8 <= (others => '0');
	      slv_reg9 <= (others => '0');
	      slv_reg10 <= (others => '0');
	      slv_reg11 <= (others => '0');
	      slv_reg12 <= (others => '0');
	      slv_reg13 <= (others => '0');
	      slv_reg14 <= (others => '0');
	      slv_reg15 <= (others => '0');
--	      slv_reg16 <= (others => '0');
--	      slv_reg17 <= (others => '0');
--	      slv_reg18 <= (others => '0');
--	      slv_reg19 <= (others => '0');
--	      slv_reg20 <= (others => '0');
--	      slv_reg21 <= (others => '0');
--	      slv_reg22 <= (others => '0');
--	      slv_reg23 <= (others => '0');
--	      slv_reg24 <= (others => '0');
--	      slv_reg25 <= (others => '0');
--	      slv_reg26 <= (others => '0');
--	      slv_reg27 <= (others => '0');
--	      slv_reg28 <= (others => '0');
--	      slv_reg29 <= (others => '0');
--	      slv_reg30 <= (others => '0');
--	      slv_reg31 <= (others => '0');
	    else
	      loc_addr := axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
	      if (slv_reg_wren = '1') then
	        case loc_addr is
	          when b"00000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 0
	                slv_reg0(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"00001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 1
	                slv_reg1(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"00010" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 2
	                slv_reg2(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"00011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 3
	                slv_reg3(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"00100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 4
	                slv_reg4(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"00101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 5
	                slv_reg5(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"00110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 6
	                slv_reg6(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"00111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 7
	                slv_reg7(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"01000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 8
	                slv_reg8(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"01001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 9
	                slv_reg9(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"01010" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 10
	                slv_reg10(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"01011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 11
	                slv_reg11(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"01100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 12
	                slv_reg12(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"01101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 13
	                slv_reg13(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"01110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 14
	                slv_reg14(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"01111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 15
	                slv_reg15(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
--	          when b"10000" =>
--	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
--	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
--	                -- Respective byte enables are asserted as per write strobes                   
--	                -- slave registor 16
--	                slv_reg16(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
--	              end if;
--	            end loop;
--	          when b"10001" =>
--	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
--	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
--	                -- Respective byte enables are asserted as per write strobes                   
--	                -- slave registor 17
--	                slv_reg17(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
--	              end if;
--	            end loop;
--	          when b"10010" =>
--	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
--	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
--	                -- Respective byte enables are asserted as per write strobes                   
--	                -- slave registor 18
--	                slv_reg18(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
--	              end if;
--	            end loop;
--	          when b"10011" =>
--	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
--	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
--	                -- Respective byte enables are asserted as per write strobes                   
--	                -- slave registor 19
--	                slv_reg19(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
--	              end if;
--	            end loop;
--	          when b"10100" =>
--	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
--	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
--	                -- Respective byte enables are asserted as per write strobes                   
--	                -- slave registor 20
--	                slv_reg20(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
--	              end if;
--	            end loop;
--	          when b"10101" =>
--	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
--	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
--	                -- Respective byte enables are asserted as per write strobes                   
--	                -- slave registor 21
--	                slv_reg21(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
--	              end if;
--	            end loop;
--	          when b"10110" =>
--	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
--	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
--	                -- Respective byte enables are asserted as per write strobes                   
--	                -- slave registor 22
--	                slv_reg22(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
--	              end if;
--	            end loop;
--	          when b"10111" =>
--	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
--	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
--	                -- Respective byte enables are asserted as per write strobes                   
--	                -- slave registor 23
--	                slv_reg23(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
--	              end if;
--	            end loop;
--	          when b"11000" =>
--	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
--	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
--	                -- Respective byte enables are asserted as per write strobes                   
--	                -- slave registor 24
--	                slv_reg24(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
--	              end if;
--	            end loop;
--	          when b"11001" =>
--	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
--	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
--	                -- Respective byte enables are asserted as per write strobes                   
--	                -- slave registor 25
--	                slv_reg25(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
--	              end if;
--	            end loop;
--	          when b"11010" =>
--	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
--	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
--	                -- Respective byte enables are asserted as per write strobes                   
--	                -- slave registor 26
--	                slv_reg26(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
--	              end if;
--	            end loop;
--	          when b"11011" =>
--	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
--	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
--	                -- Respective byte enables are asserted as per write strobes                   
--	                -- slave registor 27
--	                slv_reg27(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
--	              end if;
--	            end loop;
--	          when b"11100" =>
--	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
--	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
--	                -- Respective byte enables are asserted as per write strobes                   
--	                -- slave registor 28
--	                slv_reg28(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
--	              end if;
--	            end loop;
--	          when b"11101" =>
--	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
--	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
--	                -- Respective byte enables are asserted as per write strobes                   
--	                -- slave registor 29
--	                slv_reg29(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
--	              end if;
--	            end loop;
--	          when b"11110" =>
--	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
--	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
--	                -- Respective byte enables are asserted as per write strobes                   
--	                -- slave registor 30
--	                slv_reg30(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
--	              end if;
--	            end loop;
--	          when b"11111" =>
--	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
--	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
--	                -- Respective byte enables are asserted as per write strobes                   
--	                -- slave registor 31
--	                slv_reg31(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
--	              end if;
--	            end loop;
	          when others =>
	            slv_reg0 <= slv_reg0;
	            slv_reg1 <= slv_reg1;
	            slv_reg2 <= slv_reg2;
            	slv_reg3 <= slv_reg3;
	            slv_reg4 <= slv_reg4;
	            slv_reg5 <= slv_reg5;
	            slv_reg6 <= slv_reg6;
	            slv_reg7 <= slv_reg7;
	            slv_reg8 <= slv_reg8;
	            slv_reg9 <= slv_reg9;
	            slv_reg10 <= slv_reg10;
	            slv_reg11 <= slv_reg11;
	            slv_reg12 <= slv_reg12;
	            slv_reg13 <= slv_reg13;
	            slv_reg14 <= slv_reg14;
	            slv_reg15 <= slv_reg15;
--	            slv_reg16 <= slv_reg16;
--	            slv_reg17 <= slv_reg17;
--	            slv_reg18 <= slv_reg18;
--	            slv_reg19 <= slv_reg19;
--	            slv_reg20 <= slv_reg20;
--	            slv_reg21 <= slv_reg21;
--	            slv_reg22 <= slv_reg22;
--	            slv_reg23 <= slv_reg23;
--	            slv_reg24 <= slv_reg24;
--	            slv_reg25 <= slv_reg25;
--	            slv_reg26 <= slv_reg26;
--	            slv_reg27 <= slv_reg27;
--	            slv_reg28 <= slv_reg28;
--	            slv_reg29 <= slv_reg29;
--	            slv_reg30 <= slv_reg30;
--	            slv_reg31 <= slv_reg31;
	        end case;
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement write response logic generation
	-- The write response and response valid signals are asserted by the slave 
	-- when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	-- This marks the acceptance of address and indicates the status of 
	-- write transaction.

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_bvalid  <= '0';
	      axi_bresp   <= "00"; --need to work more on the responses
	    else
	      if (axi_awready = '1' and S_AXI_AWVALID = '1' and axi_wready = '1' and S_AXI_WVALID = '1' and axi_bvalid = '0'  ) then
	        axi_bvalid <= '1';
	        axi_bresp  <= "00"; 
	      elsif (S_AXI_BREADY = '1' and axi_bvalid = '1') then   --check if bready is asserted while bvalid is high)
	        axi_bvalid <= '0';                                 -- (there is a possibility that bready is always asserted high)
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement axi_arready generation
	-- axi_arready is asserted for one S_AXI_ACLK clock cycle when
	-- S_AXI_ARVALID is asserted. axi_awready is 
	-- de-asserted when reset (active low) is asserted. 
	-- The read address is also latched when S_AXI_ARVALID is 
	-- asserted. axi_araddr is reset to zero on reset assertion.

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_arready <= '0';
	      axi_araddr  <= (others => '1');
	    else
	      if (axi_arready = '0' and S_AXI_ARVALID = '1') then
	        -- indicates that the slave has acceped the valid read address
	        axi_arready <= '1';
	        -- Read Address latching 
	        axi_araddr  <= S_AXI_ARADDR;           
	      else
	        axi_arready <= '0';
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement axi_arvalid generation
	-- axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	-- S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	-- data are available on the axi_rdata bus at this instance. The 
	-- assertion of axi_rvalid marks the validity of read data on the 
	-- bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	-- is deasserted on reset (active low). axi_rresp and axi_rdata are 
	-- cleared to zero on reset (active low).  
	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then
	    if S_AXI_ARESETN = '0' then
	      axi_rvalid <= '0';
	      axi_rresp  <= "00";
	    else
	      if (axi_arready = '1' and S_AXI_ARVALID = '1' and axi_rvalid = '0') then
	        -- Valid read data is available at the read data bus
	        axi_rvalid <= '1';
	        axi_rresp  <= "00"; -- 'OKAY' response
	      elsif (axi_rvalid = '1' and S_AXI_RREADY = '1') then
	        -- Read data is accepted by the master
	        axi_rvalid <= '0';
	      end if;            
	    end if;
	  end if;
	end process;

	-- Implement memory mapped register select and read logic generation
	-- Slave register read enable is asserted when valid address is available
	-- and the slave is ready to accept the read address.
	slv_reg_rden <= axi_arready and S_AXI_ARVALID and (not axi_rvalid) ;

	process (slv_reg0, slv_reg1, slv_reg2, slv_reg3, slv_reg4, slv_reg5, slv_reg6, slv_reg7, slv_reg8, slv_reg9, slv_reg10, slv_reg11, slv_reg12, slv_reg13, slv_reg14, slv_reg15, slv_reg16, slv_reg17, slv_reg18, slv_reg19, slv_reg20, slv_reg21, slv_reg22, slv_reg23, slv_reg24, slv_reg25, slv_reg26, slv_reg27, slv_reg28, slv_reg29, slv_reg30, slv_reg31, axi_araddr, S_AXI_ARESETN, slv_reg_rden)
	variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0);
	begin
	    -- Address decoding for reading registers
	    loc_addr := axi_araddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
	    case loc_addr is
	      when b"00000" =>
	        reg_data_out <= slv_reg0;
	      when b"00001" =>
	        reg_data_out <= slv_reg1;
	      when b"00010" =>
	        reg_data_out <= slv_reg2;
	      when b"00011" =>
	        reg_data_out <= slv_reg3;
	      when b"00100" =>
	        reg_data_out <= slv_reg4;
	      when b"00101" =>
	        reg_data_out <= slv_reg5;
	      when b"00110" =>
	        reg_data_out <= slv_reg6;
	      when b"00111" =>
	        reg_data_out <= slv_reg7;
	      when b"01000" =>
	        reg_data_out <= slv_reg8;
	      when b"01001" =>
	        reg_data_out <= slv_reg9;
	      when b"01010" =>
	        reg_data_out <= slv_reg10;
	      when b"01011" =>
	        reg_data_out <= slv_reg11;
	      when b"01100" =>
	        reg_data_out <= slv_reg12;
	      when b"01101" =>
	        reg_data_out <= slv_reg13;
	      when b"01110" =>
	        reg_data_out <= slv_reg14;
	      when b"01111" =>
	        reg_data_out <= slv_reg15;
	      when b"10000" =>
	        reg_data_out <= slv_reg16;
	      when b"10001" =>
	        reg_data_out <= slv_reg17;
	      when b"10010" =>
	        reg_data_out <= slv_reg18;
	      when b"10011" =>
	        reg_data_out <= slv_reg19;
	      when b"10100" =>
	        reg_data_out <= slv_reg20;
	      when b"10101" =>
	        reg_data_out <= slv_reg21;
	      when b"10110" =>
	        reg_data_out <= slv_reg22;
	      when b"10111" =>
	        reg_data_out <= slv_reg23;
	      when b"11000" =>
	        reg_data_out <= slv_reg24;
	      when b"11001" =>
	        reg_data_out <= slv_reg25;
	      when b"11010" =>
	        reg_data_out <= slv_reg26;
	      when b"11011" =>
	        reg_data_out <= slv_reg27;
	      when b"11100" =>
	        reg_data_out <= slv_reg28;
	      when b"11101" =>
	        reg_data_out <= slv_reg29;
	      when b"11110" =>
	        reg_data_out <= slv_reg30;
	      when b"11111" =>
	        reg_data_out <= slv_reg31;
	      when others =>
	        reg_data_out  <= (others => '0');
	    end case;
	end process; 

	-- Output register or memory read data
	process( S_AXI_ACLK ) is
	begin
	  if (rising_edge (S_AXI_ACLK)) then
	    if ( S_AXI_ARESETN = '0' ) then
	      axi_rdata  <= (others => '0');
	    else
	      if (slv_reg_rden = '1') then
	        -- When there is a valid read address (S_AXI_ARVALID) with 
	        -- acceptance of read address by the slave (axi_arready), 
	        -- output the read dada 
	        -- Read address mux
	          axi_rdata <= reg_data_out;     -- register read data
	      end if;   
	    end if;
	  end if;
	end process;

----------------------- 


	is_started <= slv_reg0(0);
	en_int_trig <= slv_reg0(1);
	en_algo_trig <= slv_reg0(2);
	periodic_trig_en <= slv_reg0(3);
	
	clr_trans_counter <= slv_reg1(0);
	clear_error <= slv_reg1(1);
	clr_all <= slv_reg1(2);
	restart_intr <= slv_reg1(3);
	
	trig_delay <= slv_reg2(C_CNT_DWIDTH-1 downto 0);

	release <= slv_reg3(0);
	trig_force <= slv_reg3(1);  
	
	trig_test_gtu_time_h <= slv_reg5;
	trig_test_gtu_time_l <= slv_reg6;
	
	periodic_trig_phase <= slv_reg7(20 downto 0);
	dma_length <= slv_reg8(19 downto 0); -- number of dma transfers after which tlast signal will be formed

	slv_reg16 <= gpio_0;
	slv_reg17 <= gpio_1;
	slv_reg18 <= gpio_2;
	slv_reg19 <= gpio_3;
	slv_reg20(15 downto 0) <= counter_tvalid_latch;
	--slv_reg21 <= gpio_5;
	slv_reg21 <= gtu_sig_counter_h;
	slv_reg22 <= gtu_sig_counter_l and "11111111111000000000000000000000";
	slv_reg23(C_CNT_DWIDTH-1 downto 0) <= trans_counter_latch;
	slv_reg24(C_CNT_DWIDTH-1 downto 0) <= trans_counter;
	slv_reg25(0) <= m_axis_fifo_error; 
	slv_reg26(3 downto 0) <= sm_state;
	slv_reg26(16) <= pass_intr;
	slv_reg27 <= gtu_sig_counter_h;
	slv_reg28 <= gtu_sig_counter_l;
	slv_reg29 <= gtu_sig_counter_h_latch;
	slv_reg30 <= gtu_sig_counter_l_latch;
	slv_reg31 <= gtu_sig_counter_4dma;


--	trig_button_n <= not trig_button;
--	i_debounce: debounce port map(s_axis_aclk, trig_button_n, trig_button_debounced);

--	trig <= ((trig0 or trig1 or trig2) and en_algo_trig) or (int_trig and en_int_trig) or (periodic_trig and periodic_trig_en) or trig_force or trig_button_debounced;

	m_axis_tdata_not_buffered <= s_axis_tdata;
	m_axis_tlast_not_buffered <= s_axis_tlast;
	m_axis_tvalid_not_buffered <= s_axis_tvalid and pass;
	s_axis_tready <= '1';

--	transation_counter: process(s_axis_aclk)
--	begin
--		if(rising_edge(s_axis_aclk)) then
--			if(clr_trans_counter = '1' or clr_all = '1') then
--				trans_counter <= (others => '0');
--			elsif(s_axis_tvalid = '1') then
--				trans_counter <= trans_counter + 1;
--			end if;
--		end if;
--	end process;

	trig_sm: process(s_axis_aclk)
		variable state : integer range 0 to 4 := 0;
	begin
		if(rising_edge(s_axis_aclk)) then
			if(clr_all = '1') then
				state := 0;
				trig_cnt <= (others => '0');
				trans_counter_latch <= (others => '0');
				gtu_sig_counter_l_latch <= (others => '0');
				gtu_sig_counter_h_latch <= (others => '0');
				pass <= '1';
			else
				case state is
					when 0 => if(trig = '1') then
											state := state + 1;
										end if;
										pass <= '1';
										sm_state <= X"0";
					when 1 => if(trig_cnt = trig_delay) then
											state := state + 1;
											trig_cnt <= (others => '0');
										elsif(s_axis_tvalid = '1') then
											trig_cnt <= trig_cnt + 1;
										end if;
										pass <= '1';
										sm_state <= X"1";
					when 2 => if(s_axis_tlast = '1') then
											state := state + 1;
											trans_counter_latch <= trans_counter;
											gtu_sig_counter_l_latch <= gtu_sig_counter_l;
											gtu_sig_counter_h_latch <= gtu_sig_counter_h;
											pass <= '0';
										end if;
										sm_state <= X"2";
					when 3 => if(release = '1') then
											state := state + 1;
										end if;
										pass <= '0';
										sm_state <= X"3";
					when 4 => if(release = '0') then
											state := 0;
										end if;
										pass <= '0';
										sm_state <= X"4";
				end case;
			end if;
		end if;
	end process;

	error_latcher: process(s_axis_aclk)
		variable state : integer range 0 to 1 := 0;
	begin
		if(rising_edge(s_axis_aclk)) then
			case state is
				when 0 => if(is_started = '1' and m_axis_tready_not_buffered = '0') then
										m_axis_fifo_error <= '1';
										state := 1;
									end if;
				when 1 => if(clear_error = '1' or clr_all = '1') then
										m_axis_fifo_error <= '0';
										state := 0;
									end if;
			end case;
		end if;
	end process;
	
--	xpm_cdc_single_inst: xpm_cdc_single
--	generic map (
--		 DEST_SYNC_FF   => 4, -- integer; range: 2-10
--		 SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
--		 SRC_INPUT_REG  => 0  -- integer; 0=do not register input, 1=register input
--	)
--	port map (
--		 src_clk  => '0',  -- optional; required when SRC_INPUT_REG = 1
--		 src_in   => gtu_sig,
--		 dest_clk => s_axis_aclk,
--		 dest_out => gtu_sig_d0
--	);	
	
--	gtu_sig_counter_process: process(s_axis_aclk)
--	begin
--		if(rising_edge(s_axis_aclk)) then
--			if(clr_all = '1') then
--				gtu_sig_counter_l <= (others => '0');
--				gtu_sig_counter_l_d1 <= (others => '0');
--				gtu_sig_counter_h <= (others => '0');
--				gtu_sig_counter_4dma <= (others => '0');
--			else
--				gtu_sig_d1 <= gtu_sig_d0;
--				if(gtu_sig_d0 = '1' and gtu_sig_d1 = '0') then
--					gtu_sig_counter_l <= gtu_sig_counter_l + 1;
--					gtu_sig_counter_l_d1 <= gtu_sig_counter_l;
--					if(gtu_sig_counter_l /= gtu_sig_counter_l_d1 and gtu_sig_counter_l = 0) then
--						gtu_sig_counter_h <= gtu_sig_counter_h + 1;
--					end if;
--					if(pass = '1') then
--						gtu_sig_counter_4dma <= gtu_sig_counter_4dma + 1;
--					elsif(release = '1') then
--						gtu_sig_counter_4dma <= (others => '0');
--					end if;
--				end if;
--			end if;
--		end if;
--	end process;
	
--	int_trigger_generator_process: process(s_axis_aclk)
--	begin
--		if(rising_edge(s_axis_aclk)) then
--			if((gtu_sig_counter_l = trig_test_gtu_time_l) and (gtu_sig_counter_h = trig_test_gtu_time_h)) then
--				int_trig_d0 <= '1';
--			else
--				int_trig_d0 <= '0';
--			end if;
--			int_trig_d1 <= int_trig_d0;
--			int_trig <= int_trig_d0 and (not int_trig_d1);
--		end if;
--	end process;
	
--	periodic_trig_generator: process(s_axis_aclk)
--	begin
--		if(rising_edge(s_axis_aclk)) then
--			if(gtu_sig_counter_l(20 downto 0) = periodic_trig_phase) then
--				periodic_trig_d0 <= '1';
--			else
--				periodic_trig_d0 <= '0';
--			end if;
--			periodic_trig_d1 <= periodic_trig_d0;
--			periodic_trig <= periodic_trig_d0 and (not periodic_trig_d1);
--		end if;
--	end process;
	
--	trig_led_indicator: process(s_axis_aclk)
--		variable state : integer range 0 to 1 := 0;
--	begin
--		if(rising_edge(s_axis_aclk)) then
--			case state is
--				when 0 => if(trig = '1') then
--										trig_led <= '1';
--										state := state + 1;
--									end if;
--				when 1 => if(led_cnt = X"FFFFFF") then
--										trig_led <= '0';
--										state := state + 1;
--									end if;
--									led_cnt <= led_cnt + 1;
--			end case;
--		end if;
--	end process;

	packet_size_verificator: process(s_axis_aclk)
		variable state : integer range 0 to 2 := 0;
	begin
		if(rising_edge(s_axis_aclk)) then
			case state is
				when 0 =>
					if(m_axis_tvalid_not_buffered = '1') then
						counter_tvalid <= counter_tvalid + 1;
					else
						state := state + 1;
					end if;
				when 1 => 
					counter_tvalid_latch <= counter_tvalid;
					state := state + 1;
				when 2 =>
					if(m_axis_tvalid_not_buffered = '1') then
						counter_tvalid <= conv_std_logic_vector(1, 16);
						state := 0;
					end if;
			end case;
		end if;
	end process;

	tlast_counter_verificator: process(s_axis_aclk)
	begin
		if(rising_edge(s_axis_aclk)) then
			m_axis_tlast_allowed_d1 <= m_axis_tlast_allowed;
			if(m_axis_tlast_allowed = '1' and m_axis_tlast_allowed_d1 = '0') then
				tlast_counter <= tlast_counter + 1;
			end if;	
		end if;
	end process;


	axis_fifo_fc_64_gen: if(C_AXIS_DWIDTH = 64) generate
		i_axis_fifo_fc : axis_fifo_fc
			PORT MAP (
				s_axis_aresetn => s_axis_aresetn,
				s_axis_aclk => s_axis_aclk,
				s_axis_tvalid => m_axis_tvalid_not_buffered,
				s_axis_tlast => m_axis_tlast_not_buffered,
				s_axis_tready => m_axis_tready_not_buffered,
				s_axis_tdata => m_axis_tdata_not_buffered,
				m_axis_tvalid => m_axis_tvalid_key,
				m_axis_tlast => m_axis_tlast_key,
				m_axis_tready => m_axis_tready_key,
				m_axis_tdata => m_axis_tdata,
				axis_data_count => axis_fifo_fc_count,
				axis_wr_data_count => open,
				axis_rd_data_count => open
			);
	end generate;		

	axis_fifo_fc_32_gen: if(C_AXIS_DWIDTH = 32) generate
		i_axis_fifo_fc : axis_fifo_fc_32
			PORT MAP (
				s_axis_aresetn => s_axis_aresetn,
				s_axis_aclk => s_axis_aclk,
				s_axis_tvalid => m_axis_tvalid_not_buffered,
				s_axis_tlast => m_axis_tlast_not_buffered,
				s_axis_tready => m_axis_tready_not_buffered,
				s_axis_tdata => m_axis_tdata_not_buffered,
				m_axis_tvalid => m_axis_tvalid_key,
				m_axis_tlast => m_axis_tlast_key,
				m_axis_tready => m_axis_tready_key,
				m_axis_tdata => m_axis_tdata,
				axis_data_count => axis_fifo_fc_count,
				axis_wr_data_count => open,
				axis_rd_data_count => open
			);
	end generate;		


	m_axis_tlast_i <= m_axis_tlast_allowed and m_axis_tlast_key;

--	m_axis_tlast_not_buffered_former: process(s_axis_aclk)
--	begin
--		if(rising_edge(s_axis_aclk)) then			
--			-- with restart_intr asserted, we close output data
--			if(restart_intr = '1' or clr_all = '1') then
--				dma_length_cntr <= (others => '0');
--				pass_intr <= '0';
--				m_axis_tlast_allowed <= '0';
--			else
--				-- manage with dma_length_cntr, pass_intr
--				if(m_axis_tvalid_key = '1' and m_axis_tready = '1') then	
--					if(dma_length_cntr /= dma_length-1) then
--						dma_length_cntr <= dma_length_cntr + 1;
--						pass_intr <= '1';
--					else
--						pass_intr <= '0'; -- close output data flow after valid m_axis_tlast_i, wait until restart_intr or clr_all
--					end if;	
--				end if;
--				-- assert m_axis_tlast_i according with counter
--				if(dma_length_cntr >= dma_length-10) then
--					m_axis_tlast_allowed <= '1';
--				else
--					m_axis_tlast_allowed <= '0';
--				end if;	
					
--			end if;	
--		end if;
--	end process;
	
	tlast_allowed_former: process(s_axis_aclk)
	begin
		if(rising_edge(s_axis_aclk)) then			
			-- with restart_intr asserted, we disable TLASTs
			if(restart_intr = '1' or clr_all = '1') then
				dma_length_cntr <= (others => '0');
				m_axis_tlast_allowed <= '0';
			else
				-- manage with dma_length_cntr
				if(m_axis_tvalid_key = '1' and m_axis_tready = '1') then	
					if(dma_length_cntr /= dma_length-1) then
						dma_length_cntr <= dma_length_cntr + 1;
					end if;	
				end if;
				-- assert m_axis_tlast_i according with counter
				if(dma_length_cntr >= dma_length-10) then
					m_axis_tlast_allowed <= '1';
				else
					m_axis_tlast_allowed <= '0';
				end if;	
					
			end if;	
		end if;
	end process;

	-- we have to block the transferring immediatelly after output TLAST	
	pass_intr_former: process(s_axis_aclk)
		variable state : integer range 0 to 2 := 0;
	begin
		if(rising_edge(s_axis_aclk)) then
			if(clr_all = '1') then
				state := 0;
				pass_intr <= '1';
			else
				case state is
					when 0 =>	if(m_axis_tlast_i = '1') then
											pass_intr <= '0';
											state := state + 1;
										end if;
					when 1 => if(restart_intr = '1') then
											pass_intr <= '1';
											state := state + 1;
										end if;
					when 2 =>	if(m_axis_tlast_i = '0') then
											state := 0;
										end if;
				
				end case;
			end if;
		end if;
	end process;
	
	m_axis_tlast <= m_axis_tlast_i;
	
	-- output data switch
	m_axis_tvalid <= m_axis_tvalid_key and pass_intr;
	m_axis_tready_key <= m_axis_tready and pass_intr;
		
end Behavioral;
