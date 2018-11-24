----------------------------------------------------------------------------------
-- Company: INFN TORINO
-- Engineer: M.Mignone
-- Create Date:    14:11:24 08/2018 
--
-- Algo_B EUSO-TA
--
-- Design Name: 
-- Module Name:    ALGO_B - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: TOP MODULE L1 TRIGGER
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity ALGO_B_TA is 
generic (C_SYNTH_BYPASS : std_logic := '0');
port (
	CLOCK_200                       :	in	std_logic;
	---------------------------EUSO-TA-------------------
    DATA_EC0EC1EC2	                :	in	std_logic_vector(15 downto 0);
    DATA_EC3EC4EC5	                :	in	std_logic_vector(15 downto 0);
    DATA_EC6EC7EC8	                :	in	std_logic_vector(15 downto 0);
    FRAME                           :	in	std_logic;
	------------------------------------------------------
    m_axis_aresetn                    :   in  std_logic;
		m_axis_aclk                       :   in  std_logic;
	--AXI4 Stream FIFO L1 DATA 128 SUM EC0EC1EC2
    m0_axis_tvalid         :	out	std_logic;
	  m0_axis_tready         : 	in	std_logic;
    m0_axis_tdata          : 	out	std_logic_vector(31 downto 0);
    m0_axis_tlast          :   out std_logic;
    --AXI4 Stream FIFO L1 DATA 128 SUM EC3EC4EC5
    m1_axis_tvalid         :   out std_logic;
    m1_axis_tready         :   in  std_logic;
    m1_axis_tdata          :   out std_logic_vector(31 downto 0);
    m1_axis_tlast          :   out std_logic;
    --AXI4 Stream FIFO L1 DATA 128 SUM EC6EC7EC8
    m2_axis_tvalid         :   out std_logic;
    m2_axis_tready         :   in  std_logic;
    m2_axis_tdata          :   out std_logic_vector(31 downto 0);
    m2_axis_tlast          :   out std_logic;
    --AXI4 Stream FIFO EVENT
    m_ev_axis_tvalid                :   out std_logic;
    m_ev_axis_tready                :   in  std_logic;
    m_ev_axis_tdata                 :   out std_logic_vector(31 downto 0);
    m_ev_axis_tlast                 :   out std_logic;
    --INPUT L1 COMMAND THRESHOLD
    THR_CMD                         :   IN STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
	
end ALGO_B_TA;

architecture Behavioral of ALGO_B_TA is

	ATTRIBUTE X_INTERFACE_INFO : STRING;
	ATTRIBUTE X_INTERFACE_INFO of m0_axis_tvalid: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS_EC012 TDATA";
	ATTRIBUTE X_INTERFACE_INFO of m0_axis_tready: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS_EC012 TLAST";
	ATTRIBUTE X_INTERFACE_INFO of m0_axis_tdata: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS_EC012 TVALID";
	ATTRIBUTE X_INTERFACE_INFO of m0_axis_tlast: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS_EC012 TREADY";
	
	ATTRIBUTE X_INTERFACE_INFO of m1_axis_tvalid: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS_EC345 TDATA";
	ATTRIBUTE X_INTERFACE_INFO of m1_axis_tready: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS_EC345 TLAST";
	ATTRIBUTE X_INTERFACE_INFO of m1_axis_tdata: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS_EC345 TVALID";
	ATTRIBUTE X_INTERFACE_INFO of m1_axis_tlast: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS_EC345 TREADY";
	
	ATTRIBUTE X_INTERFACE_INFO of m2_axis_tvalid: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS_EC678 TDATA";
	ATTRIBUTE X_INTERFACE_INFO of m2_axis_tready: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS_EC678 TLAST";
	ATTRIBUTE X_INTERFACE_INFO of m2_axis_tdata: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS_EC678 TVALID";
	ATTRIBUTE X_INTERFACE_INFO of m2_axis_tlast: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS_EC678 TREADY";
	
	ATTRIBUTE X_INTERFACE_INFO of m_ev_axis_tvalid: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS_EV TDATA";
	ATTRIBUTE X_INTERFACE_INFO of m_ev_axis_tready: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS_EV TLAST";
	ATTRIBUTE X_INTERFACE_INFO of m_ev_axis_tdata: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS_EV TVALID";
	ATTRIBUTE X_INTERFACE_INFO of m_ev_axis_tlast: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS_EV TREADY";


component L1
    port (
        CLOCK			                :  in  std_logic;
        ---------------------------EUSO-TA-PDM DATA-------------------
        DATA_EC0EC1EC2                  :  in  std_logic_vector(15 downto 0);
        DATA_EC3EC4EC5                  :  in  std_logic_vector(15 downto 0);
        DATA_EC6EC7EC8                  :  in  std_logic_vector(15 downto 0);
        FRAME                           :  in  std_logic;
        ------------------------------------------------------
        --AXI4 Stream FIFO (DATA OUTPUT 128 SUM EC0EC1EC2)
        s_aresetn_ec0ec1ec2             :  in  std_logic;
        m_aclk_ec0ec1ec2                :  in  std_logic;
        m_axis_tvalid_ec0ec1ec2         :  out std_logic;
        m_axis_tready_ec0ec1ec2         :  in  std_logic;
        m_axis_tdata_ec0ec1ec2          :  out std_logic_vector(31 downto 0);
        m_axis_tlast_ec0ec1ec2          :  out std_logic;
        --AXI4 Stream FIFO (DATA OUTPUT 128 SUM EC3EC4EC5)
        s_aresetn_ec3ec4ec5             :  in  std_logic;
        m_aclk_ec3ec4ec5                :  in  std_logic;
        m_axis_tvalid_ec3ec4ec5         :  out std_logic;
        m_axis_tready_ec3ec4ec5         :  in  std_logic;
        m_axis_tdata_ec3ec4ec5          :  out std_logic_vector(31 downto 0);
        m_axis_tlast_ec3ec4ec5          :  out std_logic;
        --AXI4 Stream FIFO (DATA OUTPUT 128 SUM EC6EC7EC8)
        s_aresetn_ec6ec7ec8             :  in  std_logic;
        m_aclk_ec6ec7ec8                :  in  std_logic;
        m_axis_tvalid_ec6ec7ec8         :  out std_logic;
        m_axis_tready_ec6ec7ec8         :  in  std_logic;
        m_axis_tdata_ec6ec7ec8          :  out std_logic_vector(31 downto 0);
        m_axis_tlast_ec6ec7ec8          :  out std_logic;
        --COMMAND IN
        THR_CMD                         :  IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        --AXI4 Stream FIFO EVENT
        s_aresetn_ev                    :  in  std_logic;
        m_aclk_ev                       :  in  std_logic;
        m_axis_tvalid_ev                :  out std_logic;
        m_axis_tready_ev                :  in  std_logic;
        m_axis_tdata_ev                 :  out std_logic_vector(31 downto 0);
        m_axis_tlast_ev                 :  out std_logic
        );
end component L1;



begin

--MMCM_CLK_L1L2 : MMCM_CLK
--   port map ( 
--   -- Clock in ports
--   clk_in1  => CLOCK_200,
--  -- Clock out ports  
--   clk_out1 => CLOCK,
--   clk_out2 => CLOCK_L2              
-- );

	C_SYNTH_BYPASS_GEN: if(C_SYNTH_BYPASS = '0') generate

	L1_TRIGGER : L1
    port map (
    CLOCK                   => CLOCK_200,
    DATA_EC0EC1EC2          => DATA_EC0EC1EC2,
    DATA_EC3EC4EC5          => DATA_EC3EC4EC5,
    DATA_EC6EC7EC8          => DATA_EC6EC7EC8,
    FRAME                   => FRAME,
    ------------------------------------------------------
    --AXI4 Stream FIFO DATA SUM 128 GTU EC0EC1EC2
    s_aresetn_EC0EC1EC2     => m_axis_aresetn,
    m_aclk_EC0EC1EC2        => m_axis_aclk,
    m_axis_tvalid_EC0EC1EC2 => m0_axis_tvalid,
    m_axis_tready_EC0EC1EC2 => m0_axis_tready,
    m_axis_tdata_EC0EC1EC2  => m0_axis_tdata,
    m_axis_tlast_EC0EC1EC2  => m0_axis_tlast,
    ------------------------------------------------------
    --AXI4 Stream FIFO DATA SUM 128 GTU EC3EC4EC5
    s_aresetn_EC3EC4EC5     => m_axis_aresetn,
    m_aclk_EC3EC4EC5        => m_axis_aclk,
    m_axis_tvalid_EC3EC4EC5 => m1_axis_tvalid,
    m_axis_tready_EC3EC4EC5 => m1_axis_tready,
    m_axis_tdata_EC3EC4EC5  => m1_axis_tdata,
    m_axis_tlast_EC3EC4EC5  => m1_axis_tlast,
    ------------------------------------------------------
    --AXI4 Stream FIFO DATA SUM 128 GTU EC6EC7EC8
    s_aresetn_EC6EC7EC8     => m_axis_aresetn,
    m_aclk_EC6EC7EC8        => m_axis_aclk,
    m_axis_tvalid_EC6EC7EC8 => m2_axis_tvalid,
    m_axis_tready_EC6EC7EC8 => m2_axis_tready,
    m_axis_tdata_EC6EC7EC8  => m2_axis_tdata,
    m_axis_tlast_EC6EC7EC8  => m2_axis_tlast,
    -----------------------------
    --AXI4 Stream FIFO (COMMAND IN)
    THR_CMD                 => THR_CMD,
    -------------------------------
    --AXI4 Stream FIFO EVENT
    s_aresetn_ev            => m_axis_aresetn,
    m_aclk_ev               => m_axis_aclk,
    m_axis_tvalid_ev        => m_ev_axis_tvalid,
    m_axis_tready_ev        => m_ev_axis_tready,
    m_axis_tdata_ev         => m_ev_axis_tdata,
    m_axis_tlast_ev         => m_ev_axis_tlast
    );
    
	end generate;	
				
end Behavioral;