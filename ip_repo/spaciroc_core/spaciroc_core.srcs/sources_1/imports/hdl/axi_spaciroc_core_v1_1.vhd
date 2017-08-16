library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;


entity axi_spaciroc_core_v1_1 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 8;

		-- Parameters of Axi Master Bus Interface M00_AXIS
		C_M00_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M00_AXIS_START_COUNT	: integer	:= 32
	);
	port (
		-- Users to add ports here
				--prob_clk
        --spaciroc
		user_led: out std_logic;
		re_pc: out std_logic;
		sr_in_pc : out  STD_LOGIC := '1';
		sr_ck_pc : out  STD_LOGIC := '0';
		sr_rstb_pc : out  STD_LOGIC := '0';
		sr_out_pc: in std_logic;
		select_sc_probe_pc, resetb_pc: out std_logic;
		select_din_pc: out std_logic := '1';
		loadb_sc_pc: out std_logic := '1';
-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S00_AXI
		s00_axi_aclk	: in std_logic;
		s00_axi_aresetn	: in std_logic;
		s00_axi_awaddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_awprot	: in std_logic_vector(2 downto 0);
		s00_axi_awvalid	: in std_logic;
		s00_axi_awready	: out std_logic;
		s00_axi_wdata	: in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_wstrb	: in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
		s00_axi_wvalid	: in std_logic;
		s00_axi_wready	: out std_logic;
		s00_axi_bresp	: out std_logic_vector(1 downto 0);
		s00_axi_bvalid	: out std_logic;
		s00_axi_bready	: in std_logic;
		s00_axi_araddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_arprot	: in std_logic_vector(2 downto 0);
		s00_axi_arvalid	: in std_logic;
		s00_axi_arready	: out std_logic;
		s00_axi_rdata	: out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_rresp	: out std_logic_vector(1 downto 0);
		s00_axi_rvalid	: out std_logic;
		s00_axi_rready	: in std_logic
	);
end axi_spaciroc_core_v1_1;

architecture arch_imp of axi_spaciroc_core_v1_1 is

	-- component declaration
	component axi_spaciroc_core_v1_1_S00_AXI is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 8
		);
		port (
    --spaciroc
		user_led: out std_logic;
		re_pc: out std_logic;
		sr_in_pc : out  STD_LOGIC := '1';
		sr_ck_pc : out  STD_LOGIC := '0';
		sr_rstb_pc : out  STD_LOGIC := '0';
		sr_out_pc: in std_logic;
		select_sc_probe_pc, resetb_pc: out std_logic;
		select_din_pc: out std_logic := '1';
		loadb_sc_pc: out std_logic := '1';
		
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component axi_spaciroc_core_v1_1_S00_AXI;

--	component axi_spaciroc_core_v1_1_M00_AXIS is
--		generic (
--		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
--		C_M_START_COUNT	: integer	:= 32
--		);
--		port (
--		M_AXIS_ACLK	: in std_logic;
--		M_AXIS_ARESETN	: in std_logic;
--		M_AXIS_TVALID	: out std_logic;
--		M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
--		M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
--		M_AXIS_TLAST	: out std_logic;
--		M_AXIS_TREADY	: in std_logic
--		);
--	end component axi_spaciroc_core_v1_1_M00_AXIS;
	
	signal prob_clk_out_i: std_logic_vector(2 downto 0) := "000";

begin

-- Instantiation of Axi Bus Interface S00_AXI
axi_spaciroc_core_v1_1_S00_AXI_inst : axi_spaciroc_core_v1_1_S00_AXI
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
	)
	port map (
		-- spaciroc
		user_led  => user_led,
		re_pc  => re_pc,
		sr_in_pc => sr_in_pc,
		sr_ck_pc => sr_ck_pc,
		sr_rstb_pc => sr_rstb_pc,
		sr_out_pc => sr_out_pc,
		select_sc_probe_pc => select_sc_probe_pc,
		resetb_pc => resetb_pc,
		select_din_pc => select_din_pc,
		loadb_sc_pc => loadb_sc_pc,

		S_AXI_ACLK	=> s00_axi_aclk,
		S_AXI_ARESETN	=> s00_axi_aresetn,
		S_AXI_AWADDR	=> s00_axi_awaddr,
		S_AXI_AWPROT	=> s00_axi_awprot,
		S_AXI_AWVALID	=> s00_axi_awvalid,
		S_AXI_AWREADY	=> s00_axi_awready,
		S_AXI_WDATA	=> s00_axi_wdata,
		S_AXI_WSTRB	=> s00_axi_wstrb,
		S_AXI_WVALID	=> s00_axi_wvalid,
		S_AXI_WREADY	=> s00_axi_wready,
		S_AXI_BRESP	=> s00_axi_bresp,
		S_AXI_BVALID	=> s00_axi_bvalid,
		S_AXI_BREADY	=> s00_axi_bready,
		S_AXI_ARADDR	=> s00_axi_araddr,
		S_AXI_ARPROT	=> s00_axi_arprot,
		S_AXI_ARVALID	=> s00_axi_arvalid,
		S_AXI_ARREADY	=> s00_axi_arready,
		S_AXI_RDATA	=> s00_axi_rdata,
		S_AXI_RRESP	=> s00_axi_rresp,
		S_AXI_RVALID	=> s00_axi_rvalid,
		S_AXI_RREADY	=> s00_axi_rready
	);

---- Instantiation of Axi Bus Interface M00_AXIS
--axi_spaciroc_core_v1_1_M00_AXIS_inst : axi_spaciroc_core_v1_1_M00_AXIS
--	generic map (
--		C_M_AXIS_TDATA_WIDTH	=> C_M00_AXIS_TDATA_WIDTH,
--		C_M_START_COUNT	=> C_M00_AXIS_START_COUNT
--	)
--	port map (
--		M_AXIS_ACLK	=> m00_axis_aclk,
--		M_AXIS_ARESETN	=> m00_axis_aresetn,
--		M_AXIS_TVALID	=> m00_axis_tvalid,
--		M_AXIS_TDATA	=> m00_axis_tdata,
--		M_AXIS_TSTRB	=> m00_axis_tstrb,
--		M_AXIS_TLAST	=> m00_axis_tlast,
--		M_AXIS_TREADY	=> m00_axis_tready
--	);

	-- Add user logic here	

	-- User logic ends

end arch_imp;
