library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity axi_data_provider_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 7;

		-- Parameters of Axi Master Bus Interface M00_AXIS
		C_M00_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M00_AXIS_START_COUNT	: integer	:= 32
	);
	port (
		-- Users to add ports here
			-- 100 MHz clocks from external PLL/MMCM
		clk_art0_x1 : in STD_LOGIC;
		clk_art1_x1 : in STD_LOGIC;
		clk_art2_x1 : in STD_LOGIC;
		-- frame signals
		frame_art0:  in std_logic;
		frame_art1:  in std_logic;
		frame_art2:  in std_logic;
		-- data lines
		data_art0: in std_logic_vector(15 downto 0);
		data_art1: in std_logic_vector(15 downto 0);
		data_art2: in std_logic_vector(15 downto 0);			
		-- -- data to trigger L1 and to memory buffer
		-- raw data to MPU
		m_axis_aclk: in std_logic;
		
		m_axis_art0l_tdata: out std_logic_vector(15 downto 0);
		m_axis_art0l_tkeep: out std_logic_vector(1 downto 0);
		m_axis_art0l_tvalid: out std_logic;
		m_axis_art0l_tlast: out std_logic;
		m_axis_art0l_tready: in std_logic;
		
		m_axis_art0r_tdata: out std_logic_vector(15 downto 0);
		m_axis_art0r_tkeep: out std_logic_vector(1 downto 0);
		m_axis_art0r_tvalid: out std_logic;
		m_axis_art0r_tlast: out std_logic;
		m_axis_art0r_tready: in std_logic;
		
		m_axis_art1l_tdata: out std_logic_vector(15 downto 0);
		m_axis_art1l_tkeep: out std_logic_vector(1 downto 0);
		m_axis_art1l_tvalid: out std_logic;
		m_axis_art1l_tlast: out std_logic;
		m_axis_art1l_tready: in std_logic;
		
		m_axis_art1r_tdata: out std_logic_vector(15 downto 0);
		m_axis_art1r_tkeep: out std_logic_vector(1 downto 0);
		m_axis_art1r_tvalid: out std_logic;
		m_axis_art1r_tlast: out std_logic;
		m_axis_art1r_tready: in std_logic;
		
		m_axis_art2l_tdata: out std_logic_vector(15 downto 0);
		m_axis_art2l_tkeep: out std_logic_vector(1 downto 0);
		m_axis_art2l_tvalid: out std_logic;
		m_axis_art2l_tlast: out std_logic;
		m_axis_art2l_tready: in std_logic;
		
		m_axis_art2r_tdata: out std_logic_vector(15 downto 0);
		m_axis_art2r_tkeep: out std_logic_vector(1 downto 0);
		m_axis_art2r_tvalid: out std_logic;
		m_axis_art2r_tlast: out std_logic;
		m_axis_art2r_tready: in std_logic;
		
		gtu_sig: out std_logic := '0';


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
end axi_data_provider_v1_0;
 
architecture arch_imp of axi_data_provider_v1_0 is

	-- component declaration
	component axi_data_provider_v1_0_S00_AXI is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 7
		);
		port (
				-- 100 MHz clocks from external PLL/MMCM
		clk_art0_x1 : in STD_LOGIC;
		clk_art1_x1 : in STD_LOGIC;
		clk_art2_x1 : in STD_LOGIC;
		-- frame signals
		frame_art0:  in std_logic;
		frame_art1:  in std_logic;
		frame_art2:  in std_logic;
		-- data lines
		data_art0: in std_logic_vector(15 downto 0);
		data_art1: in std_logic_vector(15 downto 0);
		data_art2: in std_logic_vector(15 downto 0);			
		-- -- data to trigger L1 and to memory buffer
		-- raw data to MPU
		m_axis_aclk: in std_logic;
		
		m_axis_art0l_tdata: out std_logic_vector(15 downto 0);
		m_axis_art0l_tkeep: out std_logic_vector(1 downto 0);
		m_axis_art0l_tvalid: out std_logic;
		m_axis_art0l_tlast: out std_logic;
		m_axis_art0l_tready: in std_logic;
		
		m_axis_art0r_tdata: out std_logic_vector(15 downto 0);
		m_axis_art0r_tkeep: out std_logic_vector(1 downto 0);
		m_axis_art0r_tvalid: out std_logic;
		m_axis_art0r_tlast: out std_logic;
		m_axis_art0r_tready: in std_logic;
		
		m_axis_art1l_tdata: out std_logic_vector(15 downto 0);
		m_axis_art1l_tkeep: out std_logic_vector(1 downto 0);
		m_axis_art1l_tvalid: out std_logic;
		m_axis_art1l_tlast: out std_logic;
		m_axis_art1l_tready: in std_logic;
		
		m_axis_art1r_tdata: out std_logic_vector(15 downto 0);
		m_axis_art1r_tkeep: out std_logic_vector(1 downto 0);
		m_axis_art1r_tvalid: out std_logic;
		m_axis_art1r_tlast: out std_logic;
		m_axis_art1r_tready: in std_logic;
		
		m_axis_art2l_tdata: out std_logic_vector(15 downto 0);
		m_axis_art2l_tkeep: out std_logic_vector(1 downto 0);
		m_axis_art2l_tvalid: out std_logic;
		m_axis_art2l_tlast: out std_logic;
		m_axis_art2l_tready: in std_logic;
		
		m_axis_art2r_tdata: out std_logic_vector(15 downto 0);
		m_axis_art2r_tkeep: out std_logic_vector(1 downto 0);
		m_axis_art2r_tvalid: out std_logic;
		m_axis_art2r_tlast: out std_logic;
		m_axis_art2r_tready: in std_logic;




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
	end component axi_data_provider_v1_0_S00_AXI;
	
	signal m_axis_art0l_tvalid_i: std_logic := '0';

begin

	gtu_sig <= m_axis_art0l_tvalid_i;
	m_axis_art0l_tvalid <= m_axis_art0l_tvalid_i;

-- Instantiation of Axi Bus Interface S00_AXI
axi_data_provider_v1_0_S00_AXI_inst : axi_data_provider_v1_0_S00_AXI
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
	)
	port map (
				clk_art0_x1 => clk_art0_x1 ,--: in STD_LOGIC;
		clk_art1_x1 =>  clk_art1_x1,--: in STD_LOGIC;
		clk_art2_x1 =>  clk_art2_x1,--: in STD_LOGIC;
		-- 200 MHz clocks from external PLL/MMCM
		-- frame signals
		frame_art0 => frame_art0,--:  in std_logic;
		frame_art1 => frame_art1,--:  in std_logic;
		frame_art2 => frame_art2,--:  in std_logic;
		-- data lines
		data_art0 => data_art0,--: in std_logic_vector(15 downto 0);
		data_art1 => data_art1,--: in std_logic_vector(15 downto 0);
		data_art2 => data_art2,--: in std_logic_vector(15 downto 0);			
		-- -- data to trigger L1 and to memory buffer
		-- raw data to MPU
		m_axis_aclk => m_axis_aclk,--: in std_logic;
		
		m_axis_art0l_tdata => m_axis_art0l_tdata,--: out std_logic_vector(15 downto 0);
		m_axis_art0l_tkeep => m_axis_art0l_tkeep,--: out std_logic_vector(1 downto 0);
		m_axis_art0l_tvalid => m_axis_art0l_tvalid_i,--: out std_logic;
		m_axis_art0l_tlast => m_axis_art0l_tlast,--: out std_logic;
		m_axis_art0l_tready => m_axis_art0l_tready,--: in std_logic;
		
		m_axis_art0r_tdata => m_axis_art0r_tdata,--: out std_logic_vector(15 downto 0);
		m_axis_art0r_tkeep => m_axis_art0r_tkeep,--: out std_logic_vector(1 downto 0);
		m_axis_art0r_tvalid => m_axis_art0r_tvalid,--: out std_logic;
		m_axis_art0r_tlast => m_axis_art0r_tlast,--: out std_logic;
		m_axis_art0r_tready => m_axis_art0r_tready,--: in std_logic;
		
		m_axis_art1l_tdata => m_axis_art1l_tdata,--: out std_logic_vector(15 downto 0);
		m_axis_art1l_tkeep => m_axis_art1l_tkeep,--: out std_logic_vector(1 downto 0);
		m_axis_art1l_tvalid => m_axis_art1l_tvalid,--: out std_logic;
		m_axis_art1l_tlast => m_axis_art1l_tlast,--: out std_logic;
		m_axis_art1l_tready => m_axis_art1l_tready,--: in std_logic;
		
		m_axis_art1r_tdata => m_axis_art1r_tdata,--: out std_logic_vector(15 downto 0);
		m_axis_art1r_tkeep => m_axis_art1r_tkeep,--: out std_logic_vector(1 downto 0);
		m_axis_art1r_tvalid => m_axis_art1r_tvalid,--: out std_logic;
		m_axis_art1r_tlast => m_axis_art1r_tlast,--: out std_logic;
		m_axis_art1r_tready => m_axis_art1r_tready,--: in std_logic;
		
		m_axis_art2l_tdata => m_axis_art2l_tdata,--: out std_logic_vector(15 downto 0);
		m_axis_art2l_tkeep => m_axis_art2l_tkeep,--: out std_logic_vector(1 downto 0);
		m_axis_art2l_tvalid => m_axis_art2l_tvalid,--: out std_logic;
		m_axis_art2l_tlast => m_axis_art2l_tlast,--: out std_logic;
		m_axis_art2l_tready => m_axis_art2l_tready,--: in std_logic;
		
		m_axis_art2r_tdata => m_axis_art2r_tdata,--: out std_logic_vector(15 downto 0);
		m_axis_art2r_tkeep => m_axis_art2r_tkeep,--: out std_logic_vector(1 downto 0);
		m_axis_art2r_tvalid => m_axis_art2r_tvalid,--: out std_logic;
		m_axis_art2r_tlast => m_axis_art2r_tlast,--: out std_logic;
		m_axis_art2r_tready => m_axis_art2r_tready,--: in std_logic;


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

	-- Add user logic here

	-- User logic ends

end arch_imp;
