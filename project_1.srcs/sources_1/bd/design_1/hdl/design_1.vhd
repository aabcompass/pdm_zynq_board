--Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
--Date        : Mon Jun 10 12:43:06 2019
--Host        : alx-hp-envy-notebook running 64-bit Ubuntu 16.04.6 LTS
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_160MZMZ is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m00_couplers_imp_160MZMZ;

architecture STRUCTURE of m00_couplers_imp_160MZMZ is
  signal m00_couplers_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_m00_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_m00_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= m00_couplers_to_m00_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m00_couplers_to_m00_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid(0) <= m00_couplers_to_m00_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= m00_couplers_to_m00_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m00_couplers_to_m00_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid(0) <= m00_couplers_to_m00_couplers_AWVALID(0);
  M_AXI_bready(0) <= m00_couplers_to_m00_couplers_BREADY(0);
  M_AXI_rready(0) <= m00_couplers_to_m00_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m00_couplers_to_m00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m00_couplers_to_m00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m00_couplers_to_m00_couplers_WVALID(0);
  S_AXI_arready(0) <= m00_couplers_to_m00_couplers_ARREADY(0);
  S_AXI_awready(0) <= m00_couplers_to_m00_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m00_couplers_to_m00_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m00_couplers_to_m00_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m00_couplers_to_m00_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m00_couplers_to_m00_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m00_couplers_to_m00_couplers_RVALID(0);
  S_AXI_wready(0) <= m00_couplers_to_m00_couplers_WREADY(0);
  m00_couplers_to_m00_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m00_couplers_to_m00_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m00_couplers_to_m00_couplers_ARREADY(0) <= M_AXI_arready(0);
  m00_couplers_to_m00_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m00_couplers_to_m00_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m00_couplers_to_m00_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m00_couplers_to_m00_couplers_AWREADY(0) <= M_AXI_awready(0);
  m00_couplers_to_m00_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m00_couplers_to_m00_couplers_BREADY(0) <= S_AXI_bready(0);
  m00_couplers_to_m00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m00_couplers_to_m00_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m00_couplers_to_m00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m00_couplers_to_m00_couplers_RREADY(0) <= S_AXI_rready(0);
  m00_couplers_to_m00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m00_couplers_to_m00_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m00_couplers_to_m00_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m00_couplers_to_m00_couplers_WREADY(0) <= M_AXI_wready(0);
  m00_couplers_to_m00_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m00_couplers_to_m00_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_1NN8OZT is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_rid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    M_AXI_rlast : in STD_LOGIC;
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wlast : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m00_couplers_imp_1NN8OZT;

architecture STRUCTURE of m00_couplers_imp_1NN8OZT is
  component design_1_auto_pc_1 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component design_1_auto_pc_1;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_pc_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m00_couplers_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_pc_to_m00_couplers_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_m00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m00_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_m00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_m00_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_m00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m00_couplers_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_pc_to_m00_couplers_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_m00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_m00_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_m00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_m00_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_m00_couplers_BID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal auto_pc_to_m00_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m00_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal auto_pc_to_m00_couplers_RID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal auto_pc_to_m00_couplers_RLAST : STD_LOGIC;
  signal auto_pc_to_m00_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_m00_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal auto_pc_to_m00_couplers_WID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_pc_to_m00_couplers_WLAST : STD_LOGIC;
  signal auto_pc_to_m00_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_pc_to_m00_couplers_WVALID : STD_LOGIC;
  signal m00_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal m00_couplers_to_auto_pc_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal m00_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal m00_couplers_to_auto_pc_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal m00_couplers_to_auto_pc_BID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal m00_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal m00_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal m00_couplers_to_auto_pc_RID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal m00_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal m00_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal m00_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal m00_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal m00_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal m00_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_auto_pc_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= auto_pc_to_m00_couplers_ARADDR(31 downto 0);
  M_AXI_arburst(1 downto 0) <= auto_pc_to_m00_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= auto_pc_to_m00_couplers_ARCACHE(3 downto 0);
  M_AXI_arid(0) <= auto_pc_to_m00_couplers_ARID(0);
  M_AXI_arlen(3 downto 0) <= auto_pc_to_m00_couplers_ARLEN(3 downto 0);
  M_AXI_arlock(1 downto 0) <= auto_pc_to_m00_couplers_ARLOCK(1 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_pc_to_m00_couplers_ARPROT(2 downto 0);
  M_AXI_arqos(3 downto 0) <= auto_pc_to_m00_couplers_ARQOS(3 downto 0);
  M_AXI_arsize(2 downto 0) <= auto_pc_to_m00_couplers_ARSIZE(2 downto 0);
  M_AXI_arvalid <= auto_pc_to_m00_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_m00_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= auto_pc_to_m00_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= auto_pc_to_m00_couplers_AWCACHE(3 downto 0);
  M_AXI_awid(0) <= auto_pc_to_m00_couplers_AWID(0);
  M_AXI_awlen(3 downto 0) <= auto_pc_to_m00_couplers_AWLEN(3 downto 0);
  M_AXI_awlock(1 downto 0) <= auto_pc_to_m00_couplers_AWLOCK(1 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_pc_to_m00_couplers_AWPROT(2 downto 0);
  M_AXI_awqos(3 downto 0) <= auto_pc_to_m00_couplers_AWQOS(3 downto 0);
  M_AXI_awsize(2 downto 0) <= auto_pc_to_m00_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid <= auto_pc_to_m00_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_m00_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_m00_couplers_RREADY;
  M_AXI_wdata(63 downto 0) <= auto_pc_to_m00_couplers_WDATA(63 downto 0);
  M_AXI_wid(0) <= auto_pc_to_m00_couplers_WID(0);
  M_AXI_wlast <= auto_pc_to_m00_couplers_WLAST;
  M_AXI_wstrb(7 downto 0) <= auto_pc_to_m00_couplers_WSTRB(7 downto 0);
  M_AXI_wvalid <= auto_pc_to_m00_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1(0) <= S_ARESETN(0);
  S_AXI_arready <= m00_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= m00_couplers_to_auto_pc_AWREADY;
  S_AXI_bid(0) <= m00_couplers_to_auto_pc_BID(0);
  S_AXI_bresp(1 downto 0) <= m00_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= m00_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(63 downto 0) <= m00_couplers_to_auto_pc_RDATA(63 downto 0);
  S_AXI_rid(0) <= m00_couplers_to_auto_pc_RID(0);
  S_AXI_rlast <= m00_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= m00_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= m00_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= m00_couplers_to_auto_pc_WREADY;
  auto_pc_to_m00_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_m00_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_m00_couplers_BID(5 downto 0) <= M_AXI_bid(5 downto 0);
  auto_pc_to_m00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_m00_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_m00_couplers_RDATA(63 downto 0) <= M_AXI_rdata(63 downto 0);
  auto_pc_to_m00_couplers_RID(5 downto 0) <= M_AXI_rid(5 downto 0);
  auto_pc_to_m00_couplers_RLAST <= M_AXI_rlast;
  auto_pc_to_m00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_m00_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_m00_couplers_WREADY <= M_AXI_wready;
  m00_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m00_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  m00_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  m00_couplers_to_auto_pc_ARID(0) <= S_AXI_arid(0);
  m00_couplers_to_auto_pc_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  m00_couplers_to_auto_pc_ARLOCK(0) <= S_AXI_arlock(0);
  m00_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m00_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  m00_couplers_to_auto_pc_ARREGION(3 downto 0) <= S_AXI_arregion(3 downto 0);
  m00_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  m00_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  m00_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m00_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  m00_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  m00_couplers_to_auto_pc_AWID(0) <= S_AXI_awid(0);
  m00_couplers_to_auto_pc_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  m00_couplers_to_auto_pc_AWLOCK(0) <= S_AXI_awlock(0);
  m00_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m00_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  m00_couplers_to_auto_pc_AWREGION(3 downto 0) <= S_AXI_awregion(3 downto 0);
  m00_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  m00_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  m00_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  m00_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  m00_couplers_to_auto_pc_WDATA(63 downto 0) <= S_AXI_wdata(63 downto 0);
  m00_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  m00_couplers_to_auto_pc_WSTRB(7 downto 0) <= S_AXI_wstrb(7 downto 0);
  m00_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component design_1_auto_pc_1
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1(0),
      m_axi_araddr(31 downto 0) => auto_pc_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => auto_pc_to_m00_couplers_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => auto_pc_to_m00_couplers_ARCACHE(3 downto 0),
      m_axi_arid(0) => auto_pc_to_m00_couplers_ARID(0),
      m_axi_arlen(3 downto 0) => auto_pc_to_m00_couplers_ARLEN(3 downto 0),
      m_axi_arlock(1 downto 0) => auto_pc_to_m00_couplers_ARLOCK(1 downto 0),
      m_axi_arprot(2 downto 0) => auto_pc_to_m00_couplers_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => auto_pc_to_m00_couplers_ARQOS(3 downto 0),
      m_axi_arready => auto_pc_to_m00_couplers_ARREADY,
      m_axi_arsize(2 downto 0) => auto_pc_to_m00_couplers_ARSIZE(2 downto 0),
      m_axi_arvalid => auto_pc_to_m00_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => auto_pc_to_m00_couplers_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => auto_pc_to_m00_couplers_AWCACHE(3 downto 0),
      m_axi_awid(0) => auto_pc_to_m00_couplers_AWID(0),
      m_axi_awlen(3 downto 0) => auto_pc_to_m00_couplers_AWLEN(3 downto 0),
      m_axi_awlock(1 downto 0) => auto_pc_to_m00_couplers_AWLOCK(1 downto 0),
      m_axi_awprot(2 downto 0) => auto_pc_to_m00_couplers_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => auto_pc_to_m00_couplers_AWQOS(3 downto 0),
      m_axi_awready => auto_pc_to_m00_couplers_AWREADY,
      m_axi_awsize(2 downto 0) => auto_pc_to_m00_couplers_AWSIZE(2 downto 0),
      m_axi_awvalid => auto_pc_to_m00_couplers_AWVALID,
      m_axi_bid(0) => auto_pc_to_m00_couplers_BID(0),
      m_axi_bready => auto_pc_to_m00_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_m00_couplers_BVALID,
      m_axi_rdata(63 downto 0) => auto_pc_to_m00_couplers_RDATA(63 downto 0),
      m_axi_rid(0) => auto_pc_to_m00_couplers_RID(0),
      m_axi_rlast => auto_pc_to_m00_couplers_RLAST,
      m_axi_rready => auto_pc_to_m00_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_m00_couplers_RVALID,
      m_axi_wdata(63 downto 0) => auto_pc_to_m00_couplers_WDATA(63 downto 0),
      m_axi_wid(0) => auto_pc_to_m00_couplers_WID(0),
      m_axi_wlast => auto_pc_to_m00_couplers_WLAST,
      m_axi_wready => auto_pc_to_m00_couplers_WREADY,
      m_axi_wstrb(7 downto 0) => auto_pc_to_m00_couplers_WSTRB(7 downto 0),
      m_axi_wvalid => auto_pc_to_m00_couplers_WVALID,
      s_axi_araddr(31 downto 0) => m00_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => m00_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => m00_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arid(0) => m00_couplers_to_auto_pc_ARID(0),
      s_axi_arlen(7 downto 0) => m00_couplers_to_auto_pc_ARLEN(7 downto 0),
      s_axi_arlock(0) => m00_couplers_to_auto_pc_ARLOCK(0),
      s_axi_arprot(2 downto 0) => m00_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => m00_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => m00_couplers_to_auto_pc_ARREADY,
      s_axi_arregion(3 downto 0) => m00_couplers_to_auto_pc_ARREGION(3 downto 0),
      s_axi_arsize(2 downto 0) => m00_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => m00_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => m00_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => m00_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => m00_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awid(0) => m00_couplers_to_auto_pc_AWID(0),
      s_axi_awlen(7 downto 0) => m00_couplers_to_auto_pc_AWLEN(7 downto 0),
      s_axi_awlock(0) => m00_couplers_to_auto_pc_AWLOCK(0),
      s_axi_awprot(2 downto 0) => m00_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => m00_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => m00_couplers_to_auto_pc_AWREADY,
      s_axi_awregion(3 downto 0) => m00_couplers_to_auto_pc_AWREGION(3 downto 0),
      s_axi_awsize(2 downto 0) => m00_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => m00_couplers_to_auto_pc_AWVALID,
      s_axi_bid(0) => m00_couplers_to_auto_pc_BID(0),
      s_axi_bready => m00_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => m00_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => m00_couplers_to_auto_pc_BVALID,
      s_axi_rdata(63 downto 0) => m00_couplers_to_auto_pc_RDATA(63 downto 0),
      s_axi_rid(0) => m00_couplers_to_auto_pc_RID(0),
      s_axi_rlast => m00_couplers_to_auto_pc_RLAST,
      s_axi_rready => m00_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => m00_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => m00_couplers_to_auto_pc_RVALID,
      s_axi_wdata(63 downto 0) => m00_couplers_to_auto_pc_WDATA(63 downto 0),
      s_axi_wlast => m00_couplers_to_auto_pc_WLAST,
      s_axi_wready => m00_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(7 downto 0) => m00_couplers_to_auto_pc_WSTRB(7 downto 0),
      s_axi_wvalid => m00_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_A9EIW8 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wvalid : in STD_LOGIC
  );
end m00_couplers_imp_A9EIW8;

architecture STRUCTURE of m00_couplers_imp_A9EIW8 is
  signal m00_couplers_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_ARREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_ARVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_AWREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_AWVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_BREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_BVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_RREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_RVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_WREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m00_couplers_to_m00_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= m00_couplers_to_m00_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m00_couplers_to_m00_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= m00_couplers_to_m00_couplers_AWVALID;
  M_AXI_bready <= m00_couplers_to_m00_couplers_BREADY;
  M_AXI_rready <= m00_couplers_to_m00_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m00_couplers_to_m00_couplers_WDATA(31 downto 0);
  M_AXI_wvalid <= m00_couplers_to_m00_couplers_WVALID;
  S_AXI_arready <= m00_couplers_to_m00_couplers_ARREADY;
  S_AXI_awready <= m00_couplers_to_m00_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m00_couplers_to_m00_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m00_couplers_to_m00_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m00_couplers_to_m00_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m00_couplers_to_m00_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m00_couplers_to_m00_couplers_RVALID;
  S_AXI_wready <= m00_couplers_to_m00_couplers_WREADY;
  m00_couplers_to_m00_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m00_couplers_to_m00_couplers_ARREADY <= M_AXI_arready;
  m00_couplers_to_m00_couplers_ARVALID <= S_AXI_arvalid;
  m00_couplers_to_m00_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m00_couplers_to_m00_couplers_AWREADY <= M_AXI_awready;
  m00_couplers_to_m00_couplers_AWVALID <= S_AXI_awvalid;
  m00_couplers_to_m00_couplers_BREADY <= S_AXI_bready;
  m00_couplers_to_m00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m00_couplers_to_m00_couplers_BVALID <= M_AXI_bvalid;
  m00_couplers_to_m00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m00_couplers_to_m00_couplers_RREADY <= S_AXI_rready;
  m00_couplers_to_m00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m00_couplers_to_m00_couplers_RVALID <= M_AXI_rvalid;
  m00_couplers_to_m00_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m00_couplers_to_m00_couplers_WREADY <= M_AXI_wready;
  m00_couplers_to_m00_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m01_couplers_imp_1KIC6O9 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC;
    M_AXI_arprot : out STD_LOGIC;
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC;
    M_AXI_awprot : out STD_LOGIC;
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC;
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC;
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC;
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC;
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC;
    S_AXI_arprot : in STD_LOGIC;
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC;
    S_AXI_awprot : in STD_LOGIC;
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC;
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC;
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC;
    S_AXI_wvalid : in STD_LOGIC
  );
end m01_couplers_imp_1KIC6O9;

architecture STRUCTURE of m01_couplers_imp_1KIC6O9 is
  signal m01_couplers_to_m01_couplers_ARADDR : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_ARPROT : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_ARREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_ARVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_AWADDR : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_AWPROT : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_AWREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_AWVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_BREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_BRESP : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_BVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_RDATA : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_RREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_RRESP : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_RVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_WDATA : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_WREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_WSTRB : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr <= m01_couplers_to_m01_couplers_ARADDR;
  M_AXI_arprot <= m01_couplers_to_m01_couplers_ARPROT;
  M_AXI_arvalid <= m01_couplers_to_m01_couplers_ARVALID;
  M_AXI_awaddr <= m01_couplers_to_m01_couplers_AWADDR;
  M_AXI_awprot <= m01_couplers_to_m01_couplers_AWPROT;
  M_AXI_awvalid <= m01_couplers_to_m01_couplers_AWVALID;
  M_AXI_bready <= m01_couplers_to_m01_couplers_BREADY;
  M_AXI_rready <= m01_couplers_to_m01_couplers_RREADY;
  M_AXI_wdata <= m01_couplers_to_m01_couplers_WDATA;
  M_AXI_wstrb <= m01_couplers_to_m01_couplers_WSTRB;
  M_AXI_wvalid <= m01_couplers_to_m01_couplers_WVALID;
  S_AXI_arready <= m01_couplers_to_m01_couplers_ARREADY;
  S_AXI_awready <= m01_couplers_to_m01_couplers_AWREADY;
  S_AXI_bresp <= m01_couplers_to_m01_couplers_BRESP;
  S_AXI_bvalid <= m01_couplers_to_m01_couplers_BVALID;
  S_AXI_rdata <= m01_couplers_to_m01_couplers_RDATA;
  S_AXI_rresp <= m01_couplers_to_m01_couplers_RRESP;
  S_AXI_rvalid <= m01_couplers_to_m01_couplers_RVALID;
  S_AXI_wready <= m01_couplers_to_m01_couplers_WREADY;
  m01_couplers_to_m01_couplers_ARADDR <= S_AXI_araddr;
  m01_couplers_to_m01_couplers_ARPROT <= S_AXI_arprot;
  m01_couplers_to_m01_couplers_ARREADY <= M_AXI_arready;
  m01_couplers_to_m01_couplers_ARVALID <= S_AXI_arvalid;
  m01_couplers_to_m01_couplers_AWADDR <= S_AXI_awaddr;
  m01_couplers_to_m01_couplers_AWPROT <= S_AXI_awprot;
  m01_couplers_to_m01_couplers_AWREADY <= M_AXI_awready;
  m01_couplers_to_m01_couplers_AWVALID <= S_AXI_awvalid;
  m01_couplers_to_m01_couplers_BREADY <= S_AXI_bready;
  m01_couplers_to_m01_couplers_BRESP <= M_AXI_bresp;
  m01_couplers_to_m01_couplers_BVALID <= M_AXI_bvalid;
  m01_couplers_to_m01_couplers_RDATA <= M_AXI_rdata;
  m01_couplers_to_m01_couplers_RREADY <= S_AXI_rready;
  m01_couplers_to_m01_couplers_RRESP <= M_AXI_rresp;
  m01_couplers_to_m01_couplers_RVALID <= M_AXI_rvalid;
  m01_couplers_to_m01_couplers_WDATA <= S_AXI_wdata;
  m01_couplers_to_m01_couplers_WREADY <= M_AXI_wready;
  m01_couplers_to_m01_couplers_WSTRB <= S_AXI_wstrb;
  m01_couplers_to_m01_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m01_couplers_imp_XD2AKQ is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m01_couplers_imp_XD2AKQ;

architecture STRUCTURE of m01_couplers_imp_XD2AKQ is
  signal m01_couplers_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_ARREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_ARVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_AWREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_AWVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_BREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_BVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_RREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_RVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_WREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m01_couplers_to_m01_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= m01_couplers_to_m01_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m01_couplers_to_m01_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= m01_couplers_to_m01_couplers_AWVALID;
  M_AXI_bready <= m01_couplers_to_m01_couplers_BREADY;
  M_AXI_rready <= m01_couplers_to_m01_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m01_couplers_to_m01_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m01_couplers_to_m01_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m01_couplers_to_m01_couplers_WVALID;
  S_AXI_arready <= m01_couplers_to_m01_couplers_ARREADY;
  S_AXI_awready <= m01_couplers_to_m01_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m01_couplers_to_m01_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m01_couplers_to_m01_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m01_couplers_to_m01_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m01_couplers_to_m01_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m01_couplers_to_m01_couplers_RVALID;
  S_AXI_wready <= m01_couplers_to_m01_couplers_WREADY;
  m01_couplers_to_m01_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m01_couplers_to_m01_couplers_ARREADY <= M_AXI_arready;
  m01_couplers_to_m01_couplers_ARVALID <= S_AXI_arvalid;
  m01_couplers_to_m01_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m01_couplers_to_m01_couplers_AWREADY <= M_AXI_awready;
  m01_couplers_to_m01_couplers_AWVALID <= S_AXI_awvalid;
  m01_couplers_to_m01_couplers_BREADY <= S_AXI_bready;
  m01_couplers_to_m01_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m01_couplers_to_m01_couplers_BVALID <= M_AXI_bvalid;
  m01_couplers_to_m01_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m01_couplers_to_m01_couplers_RREADY <= S_AXI_rready;
  m01_couplers_to_m01_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m01_couplers_to_m01_couplers_RVALID <= M_AXI_rvalid;
  m01_couplers_to_m01_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m01_couplers_to_m01_couplers_WREADY <= M_AXI_wready;
  m01_couplers_to_m01_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m01_couplers_to_m01_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m02_couplers_imp_14PNN8O is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m02_couplers_imp_14PNN8O;

architecture STRUCTURE of m02_couplers_imp_14PNN8O is
  signal m02_couplers_to_m02_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_m02_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_m02_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_m02_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_m02_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= m02_couplers_to_m02_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid(0) <= m02_couplers_to_m02_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= m02_couplers_to_m02_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid(0) <= m02_couplers_to_m02_couplers_AWVALID(0);
  M_AXI_bready(0) <= m02_couplers_to_m02_couplers_BREADY(0);
  M_AXI_rready(0) <= m02_couplers_to_m02_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m02_couplers_to_m02_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m02_couplers_to_m02_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m02_couplers_to_m02_couplers_WVALID(0);
  S_AXI_arready(0) <= m02_couplers_to_m02_couplers_ARREADY(0);
  S_AXI_awready(0) <= m02_couplers_to_m02_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m02_couplers_to_m02_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m02_couplers_to_m02_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m02_couplers_to_m02_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m02_couplers_to_m02_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m02_couplers_to_m02_couplers_RVALID(0);
  S_AXI_wready(0) <= m02_couplers_to_m02_couplers_WREADY(0);
  m02_couplers_to_m02_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m02_couplers_to_m02_couplers_ARREADY(0) <= M_AXI_arready(0);
  m02_couplers_to_m02_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m02_couplers_to_m02_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m02_couplers_to_m02_couplers_AWREADY(0) <= M_AXI_awready(0);
  m02_couplers_to_m02_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m02_couplers_to_m02_couplers_BREADY(0) <= S_AXI_bready(0);
  m02_couplers_to_m02_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m02_couplers_to_m02_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m02_couplers_to_m02_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m02_couplers_to_m02_couplers_RREADY(0) <= S_AXI_rready(0);
  m02_couplers_to_m02_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m02_couplers_to_m02_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m02_couplers_to_m02_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m02_couplers_to_m02_couplers_WREADY(0) <= M_AXI_wready(0);
  m02_couplers_to_m02_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m02_couplers_to_m02_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m02_couplers_imp_97GN1N is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m02_couplers_imp_97GN1N;

architecture STRUCTURE of m02_couplers_imp_97GN1N is
  signal m02_couplers_to_m02_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_m02_couplers_ARREADY : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_ARVALID : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_m02_couplers_AWREADY : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_AWVALID : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_BREADY : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_m02_couplers_BVALID : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_RREADY : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_m02_couplers_RVALID : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_WREADY : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_m02_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m02_couplers_to_m02_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m02_couplers_to_m02_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= m02_couplers_to_m02_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m02_couplers_to_m02_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m02_couplers_to_m02_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= m02_couplers_to_m02_couplers_AWVALID;
  M_AXI_bready <= m02_couplers_to_m02_couplers_BREADY;
  M_AXI_rready <= m02_couplers_to_m02_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m02_couplers_to_m02_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m02_couplers_to_m02_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m02_couplers_to_m02_couplers_WVALID;
  S_AXI_arready <= m02_couplers_to_m02_couplers_ARREADY;
  S_AXI_awready <= m02_couplers_to_m02_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m02_couplers_to_m02_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m02_couplers_to_m02_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m02_couplers_to_m02_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m02_couplers_to_m02_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m02_couplers_to_m02_couplers_RVALID;
  S_AXI_wready <= m02_couplers_to_m02_couplers_WREADY;
  m02_couplers_to_m02_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m02_couplers_to_m02_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m02_couplers_to_m02_couplers_ARREADY <= M_AXI_arready;
  m02_couplers_to_m02_couplers_ARVALID <= S_AXI_arvalid;
  m02_couplers_to_m02_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m02_couplers_to_m02_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m02_couplers_to_m02_couplers_AWREADY <= M_AXI_awready;
  m02_couplers_to_m02_couplers_AWVALID <= S_AXI_awvalid;
  m02_couplers_to_m02_couplers_BREADY <= S_AXI_bready;
  m02_couplers_to_m02_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m02_couplers_to_m02_couplers_BVALID <= M_AXI_bvalid;
  m02_couplers_to_m02_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m02_couplers_to_m02_couplers_RREADY <= S_AXI_rready;
  m02_couplers_to_m02_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m02_couplers_to_m02_couplers_RVALID <= M_AXI_rvalid;
  m02_couplers_to_m02_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m02_couplers_to_m02_couplers_WREADY <= M_AXI_wready;
  m02_couplers_to_m02_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m02_couplers_to_m02_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m03_couplers_imp_1LAKXMY is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m03_couplers_imp_1LAKXMY;

architecture STRUCTURE of m03_couplers_imp_1LAKXMY is
  signal m03_couplers_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_m03_couplers_ARREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_ARVALID : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_m03_couplers_AWREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_AWVALID : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_BREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_m03_couplers_BVALID : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_RREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_m03_couplers_RVALID : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_WREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_m03_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m03_couplers_to_m03_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m03_couplers_to_m03_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= m03_couplers_to_m03_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m03_couplers_to_m03_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m03_couplers_to_m03_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= m03_couplers_to_m03_couplers_AWVALID;
  M_AXI_bready <= m03_couplers_to_m03_couplers_BREADY;
  M_AXI_rready <= m03_couplers_to_m03_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m03_couplers_to_m03_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m03_couplers_to_m03_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m03_couplers_to_m03_couplers_WVALID;
  S_AXI_arready <= m03_couplers_to_m03_couplers_ARREADY;
  S_AXI_awready <= m03_couplers_to_m03_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m03_couplers_to_m03_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m03_couplers_to_m03_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m03_couplers_to_m03_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m03_couplers_to_m03_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m03_couplers_to_m03_couplers_RVALID;
  S_AXI_wready <= m03_couplers_to_m03_couplers_WREADY;
  m03_couplers_to_m03_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m03_couplers_to_m03_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m03_couplers_to_m03_couplers_ARREADY <= M_AXI_arready;
  m03_couplers_to_m03_couplers_ARVALID <= S_AXI_arvalid;
  m03_couplers_to_m03_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m03_couplers_to_m03_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m03_couplers_to_m03_couplers_AWREADY <= M_AXI_awready;
  m03_couplers_to_m03_couplers_AWVALID <= S_AXI_awvalid;
  m03_couplers_to_m03_couplers_BREADY <= S_AXI_bready;
  m03_couplers_to_m03_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m03_couplers_to_m03_couplers_BVALID <= M_AXI_bvalid;
  m03_couplers_to_m03_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m03_couplers_to_m03_couplers_RREADY <= S_AXI_rready;
  m03_couplers_to_m03_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m03_couplers_to_m03_couplers_RVALID <= M_AXI_rvalid;
  m03_couplers_to_m03_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m03_couplers_to_m03_couplers_WREADY <= M_AXI_wready;
  m03_couplers_to_m03_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m03_couplers_to_m03_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m03_couplers_imp_YXPDAH is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m03_couplers_imp_YXPDAH;

architecture STRUCTURE of m03_couplers_imp_YXPDAH is
  signal m03_couplers_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_m03_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_m03_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_m03_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_m03_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= m03_couplers_to_m03_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid(0) <= m03_couplers_to_m03_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= m03_couplers_to_m03_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid(0) <= m03_couplers_to_m03_couplers_AWVALID(0);
  M_AXI_bready(0) <= m03_couplers_to_m03_couplers_BREADY(0);
  M_AXI_rready(0) <= m03_couplers_to_m03_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m03_couplers_to_m03_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m03_couplers_to_m03_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid(0) <= m03_couplers_to_m03_couplers_WVALID(0);
  S_AXI_arready(0) <= m03_couplers_to_m03_couplers_ARREADY(0);
  S_AXI_awready(0) <= m03_couplers_to_m03_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m03_couplers_to_m03_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m03_couplers_to_m03_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m03_couplers_to_m03_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m03_couplers_to_m03_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m03_couplers_to_m03_couplers_RVALID(0);
  S_AXI_wready(0) <= m03_couplers_to_m03_couplers_WREADY(0);
  m03_couplers_to_m03_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m03_couplers_to_m03_couplers_ARREADY(0) <= M_AXI_arready(0);
  m03_couplers_to_m03_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m03_couplers_to_m03_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m03_couplers_to_m03_couplers_AWREADY(0) <= M_AXI_awready(0);
  m03_couplers_to_m03_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m03_couplers_to_m03_couplers_BREADY(0) <= S_AXI_bready(0);
  m03_couplers_to_m03_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m03_couplers_to_m03_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m03_couplers_to_m03_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m03_couplers_to_m03_couplers_RREADY(0) <= S_AXI_rready(0);
  m03_couplers_to_m03_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m03_couplers_to_m03_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m03_couplers_to_m03_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m03_couplers_to_m03_couplers_WREADY(0) <= M_AXI_wready(0);
  m03_couplers_to_m03_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m03_couplers_to_m03_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m04_couplers_imp_17I0ZQL is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m04_couplers_imp_17I0ZQL;

architecture STRUCTURE of m04_couplers_imp_17I0ZQL is
  signal m04_couplers_to_m04_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_ARREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_ARVALID : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_AWREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_AWVALID : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_BREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_m04_couplers_BVALID : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_RREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_m04_couplers_RVALID : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_WREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_m04_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m04_couplers_to_m04_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= m04_couplers_to_m04_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m04_couplers_to_m04_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= m04_couplers_to_m04_couplers_AWVALID;
  M_AXI_bready <= m04_couplers_to_m04_couplers_BREADY;
  M_AXI_rready <= m04_couplers_to_m04_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m04_couplers_to_m04_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m04_couplers_to_m04_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m04_couplers_to_m04_couplers_WVALID;
  S_AXI_arready <= m04_couplers_to_m04_couplers_ARREADY;
  S_AXI_awready <= m04_couplers_to_m04_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m04_couplers_to_m04_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m04_couplers_to_m04_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m04_couplers_to_m04_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m04_couplers_to_m04_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m04_couplers_to_m04_couplers_RVALID;
  S_AXI_wready <= m04_couplers_to_m04_couplers_WREADY;
  m04_couplers_to_m04_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m04_couplers_to_m04_couplers_ARREADY <= M_AXI_arready;
  m04_couplers_to_m04_couplers_ARVALID <= S_AXI_arvalid;
  m04_couplers_to_m04_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m04_couplers_to_m04_couplers_AWREADY <= M_AXI_awready;
  m04_couplers_to_m04_couplers_AWVALID <= S_AXI_awvalid;
  m04_couplers_to_m04_couplers_BREADY <= S_AXI_bready;
  m04_couplers_to_m04_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m04_couplers_to_m04_couplers_BVALID <= M_AXI_bvalid;
  m04_couplers_to_m04_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m04_couplers_to_m04_couplers_RREADY <= S_AXI_rready;
  m04_couplers_to_m04_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m04_couplers_to_m04_couplers_RVALID <= M_AXI_rvalid;
  m04_couplers_to_m04_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m04_couplers_to_m04_couplers_WREADY <= M_AXI_wready;
  m04_couplers_to_m04_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m04_couplers_to_m04_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m04_couplers_imp_D4QJVY is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC;
    M_AXI_arprot : out STD_LOGIC;
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC;
    M_AXI_awprot : out STD_LOGIC;
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC;
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC;
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC;
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC;
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC;
    S_AXI_arprot : in STD_LOGIC;
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC;
    S_AXI_awprot : in STD_LOGIC;
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC;
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC;
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC;
    S_AXI_wvalid : in STD_LOGIC
  );
end m04_couplers_imp_D4QJVY;

architecture STRUCTURE of m04_couplers_imp_D4QJVY is
  signal m04_couplers_to_m04_couplers_ARADDR : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_ARPROT : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_ARREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_ARVALID : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_AWADDR : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_AWPROT : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_AWREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_AWVALID : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_BREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_BRESP : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_BVALID : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_RDATA : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_RREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_RRESP : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_RVALID : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_WDATA : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_WREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_WSTRB : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr <= m04_couplers_to_m04_couplers_ARADDR;
  M_AXI_arprot <= m04_couplers_to_m04_couplers_ARPROT;
  M_AXI_arvalid <= m04_couplers_to_m04_couplers_ARVALID;
  M_AXI_awaddr <= m04_couplers_to_m04_couplers_AWADDR;
  M_AXI_awprot <= m04_couplers_to_m04_couplers_AWPROT;
  M_AXI_awvalid <= m04_couplers_to_m04_couplers_AWVALID;
  M_AXI_bready <= m04_couplers_to_m04_couplers_BREADY;
  M_AXI_rready <= m04_couplers_to_m04_couplers_RREADY;
  M_AXI_wdata <= m04_couplers_to_m04_couplers_WDATA;
  M_AXI_wstrb <= m04_couplers_to_m04_couplers_WSTRB;
  M_AXI_wvalid <= m04_couplers_to_m04_couplers_WVALID;
  S_AXI_arready <= m04_couplers_to_m04_couplers_ARREADY;
  S_AXI_awready <= m04_couplers_to_m04_couplers_AWREADY;
  S_AXI_bresp <= m04_couplers_to_m04_couplers_BRESP;
  S_AXI_bvalid <= m04_couplers_to_m04_couplers_BVALID;
  S_AXI_rdata <= m04_couplers_to_m04_couplers_RDATA;
  S_AXI_rresp <= m04_couplers_to_m04_couplers_RRESP;
  S_AXI_rvalid <= m04_couplers_to_m04_couplers_RVALID;
  S_AXI_wready <= m04_couplers_to_m04_couplers_WREADY;
  m04_couplers_to_m04_couplers_ARADDR <= S_AXI_araddr;
  m04_couplers_to_m04_couplers_ARPROT <= S_AXI_arprot;
  m04_couplers_to_m04_couplers_ARREADY <= M_AXI_arready;
  m04_couplers_to_m04_couplers_ARVALID <= S_AXI_arvalid;
  m04_couplers_to_m04_couplers_AWADDR <= S_AXI_awaddr;
  m04_couplers_to_m04_couplers_AWPROT <= S_AXI_awprot;
  m04_couplers_to_m04_couplers_AWREADY <= M_AXI_awready;
  m04_couplers_to_m04_couplers_AWVALID <= S_AXI_awvalid;
  m04_couplers_to_m04_couplers_BREADY <= S_AXI_bready;
  m04_couplers_to_m04_couplers_BRESP <= M_AXI_bresp;
  m04_couplers_to_m04_couplers_BVALID <= M_AXI_bvalid;
  m04_couplers_to_m04_couplers_RDATA <= M_AXI_rdata;
  m04_couplers_to_m04_couplers_RREADY <= S_AXI_rready;
  m04_couplers_to_m04_couplers_RRESP <= M_AXI_rresp;
  m04_couplers_to_m04_couplers_RVALID <= M_AXI_rvalid;
  m04_couplers_to_m04_couplers_WDATA <= S_AXI_wdata;
  m04_couplers_to_m04_couplers_WREADY <= M_AXI_wready;
  m04_couplers_to_m04_couplers_WSTRB <= S_AXI_wstrb;
  m04_couplers_to_m04_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m05_couplers_imp_1H9VHZJ is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m05_couplers_imp_1H9VHZJ;

architecture STRUCTURE of m05_couplers_imp_1H9VHZJ is
  signal m05_couplers_to_m05_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_ARREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_ARVALID : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_AWREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_AWVALID : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_BREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_m05_couplers_BVALID : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_RREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_m05_couplers_RVALID : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_WREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_m05_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m05_couplers_to_m05_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= m05_couplers_to_m05_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m05_couplers_to_m05_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= m05_couplers_to_m05_couplers_AWVALID;
  M_AXI_bready <= m05_couplers_to_m05_couplers_BREADY;
  M_AXI_rready <= m05_couplers_to_m05_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m05_couplers_to_m05_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m05_couplers_to_m05_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m05_couplers_to_m05_couplers_WVALID;
  S_AXI_arready <= m05_couplers_to_m05_couplers_ARREADY;
  S_AXI_awready <= m05_couplers_to_m05_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m05_couplers_to_m05_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m05_couplers_to_m05_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m05_couplers_to_m05_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m05_couplers_to_m05_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m05_couplers_to_m05_couplers_RVALID;
  S_AXI_wready <= m05_couplers_to_m05_couplers_WREADY;
  m05_couplers_to_m05_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m05_couplers_to_m05_couplers_ARREADY <= M_AXI_arready;
  m05_couplers_to_m05_couplers_ARVALID <= S_AXI_arvalid;
  m05_couplers_to_m05_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m05_couplers_to_m05_couplers_AWREADY <= M_AXI_awready;
  m05_couplers_to_m05_couplers_AWVALID <= S_AXI_awvalid;
  m05_couplers_to_m05_couplers_BREADY <= S_AXI_bready;
  m05_couplers_to_m05_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m05_couplers_to_m05_couplers_BVALID <= M_AXI_bvalid;
  m05_couplers_to_m05_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m05_couplers_to_m05_couplers_RREADY <= S_AXI_rready;
  m05_couplers_to_m05_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m05_couplers_to_m05_couplers_RVALID <= M_AXI_rvalid;
  m05_couplers_to_m05_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m05_couplers_to_m05_couplers_WREADY <= M_AXI_wready;
  m05_couplers_to_m05_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m05_couplers_to_m05_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m05_couplers_imp_W2ISR0 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m05_couplers_imp_W2ISR0;

architecture STRUCTURE of m05_couplers_imp_W2ISR0 is
  signal m05_couplers_to_m05_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_m05_couplers_ARREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_ARVALID : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_m05_couplers_AWREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_AWVALID : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_BREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_m05_couplers_BVALID : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_RREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_m05_couplers_RVALID : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_WREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_m05_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m05_couplers_to_m05_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m05_couplers_to_m05_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= m05_couplers_to_m05_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m05_couplers_to_m05_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m05_couplers_to_m05_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= m05_couplers_to_m05_couplers_AWVALID;
  M_AXI_bready <= m05_couplers_to_m05_couplers_BREADY;
  M_AXI_rready <= m05_couplers_to_m05_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m05_couplers_to_m05_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m05_couplers_to_m05_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m05_couplers_to_m05_couplers_WVALID;
  S_AXI_arready <= m05_couplers_to_m05_couplers_ARREADY;
  S_AXI_awready <= m05_couplers_to_m05_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m05_couplers_to_m05_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m05_couplers_to_m05_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m05_couplers_to_m05_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m05_couplers_to_m05_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m05_couplers_to_m05_couplers_RVALID;
  S_AXI_wready <= m05_couplers_to_m05_couplers_WREADY;
  m05_couplers_to_m05_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m05_couplers_to_m05_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m05_couplers_to_m05_couplers_ARREADY <= M_AXI_arready;
  m05_couplers_to_m05_couplers_ARVALID <= S_AXI_arvalid;
  m05_couplers_to_m05_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m05_couplers_to_m05_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m05_couplers_to_m05_couplers_AWREADY <= M_AXI_awready;
  m05_couplers_to_m05_couplers_AWVALID <= S_AXI_awvalid;
  m05_couplers_to_m05_couplers_BREADY <= S_AXI_bready;
  m05_couplers_to_m05_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m05_couplers_to_m05_couplers_BVALID <= M_AXI_bvalid;
  m05_couplers_to_m05_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m05_couplers_to_m05_couplers_RREADY <= S_AXI_rready;
  m05_couplers_to_m05_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m05_couplers_to_m05_couplers_RVALID <= M_AXI_rvalid;
  m05_couplers_to_m05_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m05_couplers_to_m05_couplers_WREADY <= M_AXI_wready;
  m05_couplers_to_m05_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m05_couplers_to_m05_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m06_couplers_imp_16H1XM6 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m06_couplers_imp_16H1XM6;

architecture STRUCTURE of m06_couplers_imp_16H1XM6 is
  signal m06_couplers_to_m06_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_ARREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_ARVALID : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_AWREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_AWVALID : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_BREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_m06_couplers_BVALID : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_RREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_m06_couplers_RVALID : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_WREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m06_couplers_to_m06_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m06_couplers_to_m06_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= m06_couplers_to_m06_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m06_couplers_to_m06_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= m06_couplers_to_m06_couplers_AWVALID;
  M_AXI_bready <= m06_couplers_to_m06_couplers_BREADY;
  M_AXI_rready <= m06_couplers_to_m06_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m06_couplers_to_m06_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m06_couplers_to_m06_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m06_couplers_to_m06_couplers_WVALID;
  S_AXI_arready <= m06_couplers_to_m06_couplers_ARREADY;
  S_AXI_awready <= m06_couplers_to_m06_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m06_couplers_to_m06_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m06_couplers_to_m06_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m06_couplers_to_m06_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m06_couplers_to_m06_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m06_couplers_to_m06_couplers_RVALID;
  S_AXI_wready <= m06_couplers_to_m06_couplers_WREADY;
  m06_couplers_to_m06_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m06_couplers_to_m06_couplers_ARREADY <= M_AXI_arready;
  m06_couplers_to_m06_couplers_ARVALID <= S_AXI_arvalid;
  m06_couplers_to_m06_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m06_couplers_to_m06_couplers_AWREADY <= M_AXI_awready;
  m06_couplers_to_m06_couplers_AWVALID <= S_AXI_awvalid;
  m06_couplers_to_m06_couplers_BREADY <= S_AXI_bready;
  m06_couplers_to_m06_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m06_couplers_to_m06_couplers_BVALID <= M_AXI_bvalid;
  m06_couplers_to_m06_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m06_couplers_to_m06_couplers_RREADY <= S_AXI_rready;
  m06_couplers_to_m06_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m06_couplers_to_m06_couplers_RVALID <= M_AXI_rvalid;
  m06_couplers_to_m06_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m06_couplers_to_m06_couplers_WREADY <= M_AXI_wready;
  m06_couplers_to_m06_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m06_couplers_to_m06_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m06_couplers_imp_BSTQR1 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m06_couplers_imp_BSTQR1;

architecture STRUCTURE of m06_couplers_imp_BSTQR1 is
  signal m06_couplers_to_m06_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_ARREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_ARVALID : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_AWREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_AWVALID : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_BREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_m06_couplers_BVALID : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_RREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_m06_couplers_RVALID : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_WREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m06_couplers_to_m06_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m06_couplers_to_m06_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= m06_couplers_to_m06_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m06_couplers_to_m06_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= m06_couplers_to_m06_couplers_AWVALID;
  M_AXI_bready <= m06_couplers_to_m06_couplers_BREADY;
  M_AXI_rready <= m06_couplers_to_m06_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m06_couplers_to_m06_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m06_couplers_to_m06_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m06_couplers_to_m06_couplers_WVALID;
  S_AXI_arready <= m06_couplers_to_m06_couplers_ARREADY;
  S_AXI_awready <= m06_couplers_to_m06_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m06_couplers_to_m06_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m06_couplers_to_m06_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m06_couplers_to_m06_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m06_couplers_to_m06_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m06_couplers_to_m06_couplers_RVALID;
  S_AXI_wready <= m06_couplers_to_m06_couplers_WREADY;
  m06_couplers_to_m06_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m06_couplers_to_m06_couplers_ARREADY <= M_AXI_arready;
  m06_couplers_to_m06_couplers_ARVALID <= S_AXI_arvalid;
  m06_couplers_to_m06_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m06_couplers_to_m06_couplers_AWREADY <= M_AXI_awready;
  m06_couplers_to_m06_couplers_AWVALID <= S_AXI_awvalid;
  m06_couplers_to_m06_couplers_BREADY <= S_AXI_bready;
  m06_couplers_to_m06_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m06_couplers_to_m06_couplers_BVALID <= M_AXI_bvalid;
  m06_couplers_to_m06_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m06_couplers_to_m06_couplers_RREADY <= S_AXI_rready;
  m06_couplers_to_m06_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m06_couplers_to_m06_couplers_RVALID <= M_AXI_rvalid;
  m06_couplers_to_m06_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m06_couplers_to_m06_couplers_WREADY <= M_AXI_wready;
  m06_couplers_to_m06_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m06_couplers_to_m06_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m07_couplers_imp_WT7TSF is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m07_couplers_imp_WT7TSF;

architecture STRUCTURE of m07_couplers_imp_WT7TSF is
  signal m07_couplers_to_m07_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_m07_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m07_couplers_to_m07_couplers_ARREADY : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_ARVALID : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_m07_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m07_couplers_to_m07_couplers_AWREADY : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_AWVALID : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_BREADY : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_m07_couplers_BVALID : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_m07_couplers_RREADY : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_m07_couplers_RVALID : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_m07_couplers_WREADY : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m07_couplers_to_m07_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m07_couplers_to_m07_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m07_couplers_to_m07_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= m07_couplers_to_m07_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m07_couplers_to_m07_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m07_couplers_to_m07_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= m07_couplers_to_m07_couplers_AWVALID;
  M_AXI_bready <= m07_couplers_to_m07_couplers_BREADY;
  M_AXI_rready <= m07_couplers_to_m07_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m07_couplers_to_m07_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m07_couplers_to_m07_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m07_couplers_to_m07_couplers_WVALID;
  S_AXI_arready <= m07_couplers_to_m07_couplers_ARREADY;
  S_AXI_awready <= m07_couplers_to_m07_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m07_couplers_to_m07_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m07_couplers_to_m07_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m07_couplers_to_m07_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m07_couplers_to_m07_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m07_couplers_to_m07_couplers_RVALID;
  S_AXI_wready <= m07_couplers_to_m07_couplers_WREADY;
  m07_couplers_to_m07_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m07_couplers_to_m07_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m07_couplers_to_m07_couplers_ARREADY <= M_AXI_arready;
  m07_couplers_to_m07_couplers_ARVALID <= S_AXI_arvalid;
  m07_couplers_to_m07_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m07_couplers_to_m07_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m07_couplers_to_m07_couplers_AWREADY <= M_AXI_awready;
  m07_couplers_to_m07_couplers_AWVALID <= S_AXI_awvalid;
  m07_couplers_to_m07_couplers_BREADY <= S_AXI_bready;
  m07_couplers_to_m07_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m07_couplers_to_m07_couplers_BVALID <= M_AXI_bvalid;
  m07_couplers_to_m07_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m07_couplers_to_m07_couplers_RREADY <= S_AXI_rready;
  m07_couplers_to_m07_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m07_couplers_to_m07_couplers_RVALID <= M_AXI_rvalid;
  m07_couplers_to_m07_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m07_couplers_to_m07_couplers_WREADY <= M_AXI_wready;
  m07_couplers_to_m07_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m07_couplers_to_m07_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m08_couplers_imp_ZL0ESN is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m08_couplers_imp_ZL0ESN;

architecture STRUCTURE of m08_couplers_imp_ZL0ESN is
  signal m08_couplers_to_m08_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m08_couplers_to_m08_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m08_couplers_to_m08_couplers_ARREADY : STD_LOGIC;
  signal m08_couplers_to_m08_couplers_ARVALID : STD_LOGIC;
  signal m08_couplers_to_m08_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m08_couplers_to_m08_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m08_couplers_to_m08_couplers_AWREADY : STD_LOGIC;
  signal m08_couplers_to_m08_couplers_AWVALID : STD_LOGIC;
  signal m08_couplers_to_m08_couplers_BREADY : STD_LOGIC;
  signal m08_couplers_to_m08_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m08_couplers_to_m08_couplers_BVALID : STD_LOGIC;
  signal m08_couplers_to_m08_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m08_couplers_to_m08_couplers_RREADY : STD_LOGIC;
  signal m08_couplers_to_m08_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m08_couplers_to_m08_couplers_RVALID : STD_LOGIC;
  signal m08_couplers_to_m08_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m08_couplers_to_m08_couplers_WREADY : STD_LOGIC;
  signal m08_couplers_to_m08_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m08_couplers_to_m08_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m08_couplers_to_m08_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m08_couplers_to_m08_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= m08_couplers_to_m08_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m08_couplers_to_m08_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m08_couplers_to_m08_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= m08_couplers_to_m08_couplers_AWVALID;
  M_AXI_bready <= m08_couplers_to_m08_couplers_BREADY;
  M_AXI_rready <= m08_couplers_to_m08_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m08_couplers_to_m08_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m08_couplers_to_m08_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m08_couplers_to_m08_couplers_WVALID;
  S_AXI_arready <= m08_couplers_to_m08_couplers_ARREADY;
  S_AXI_awready <= m08_couplers_to_m08_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m08_couplers_to_m08_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m08_couplers_to_m08_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m08_couplers_to_m08_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m08_couplers_to_m08_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m08_couplers_to_m08_couplers_RVALID;
  S_AXI_wready <= m08_couplers_to_m08_couplers_WREADY;
  m08_couplers_to_m08_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m08_couplers_to_m08_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m08_couplers_to_m08_couplers_ARREADY <= M_AXI_arready;
  m08_couplers_to_m08_couplers_ARVALID <= S_AXI_arvalid;
  m08_couplers_to_m08_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m08_couplers_to_m08_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m08_couplers_to_m08_couplers_AWREADY <= M_AXI_awready;
  m08_couplers_to_m08_couplers_AWVALID <= S_AXI_awvalid;
  m08_couplers_to_m08_couplers_BREADY <= S_AXI_bready;
  m08_couplers_to_m08_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m08_couplers_to_m08_couplers_BVALID <= M_AXI_bvalid;
  m08_couplers_to_m08_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m08_couplers_to_m08_couplers_RREADY <= S_AXI_rready;
  m08_couplers_to_m08_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m08_couplers_to_m08_couplers_RVALID <= M_AXI_rvalid;
  m08_couplers_to_m08_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m08_couplers_to_m08_couplers_WREADY <= M_AXI_wready;
  m08_couplers_to_m08_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m08_couplers_to_m08_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m09_couplers_imp_UWZ56U is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m09_couplers_imp_UWZ56U;

architecture STRUCTURE of m09_couplers_imp_UWZ56U is
  signal m09_couplers_to_m09_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m09_couplers_to_m09_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m09_couplers_to_m09_couplers_ARREADY : STD_LOGIC;
  signal m09_couplers_to_m09_couplers_ARVALID : STD_LOGIC;
  signal m09_couplers_to_m09_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m09_couplers_to_m09_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m09_couplers_to_m09_couplers_AWREADY : STD_LOGIC;
  signal m09_couplers_to_m09_couplers_AWVALID : STD_LOGIC;
  signal m09_couplers_to_m09_couplers_BREADY : STD_LOGIC;
  signal m09_couplers_to_m09_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m09_couplers_to_m09_couplers_BVALID : STD_LOGIC;
  signal m09_couplers_to_m09_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m09_couplers_to_m09_couplers_RREADY : STD_LOGIC;
  signal m09_couplers_to_m09_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m09_couplers_to_m09_couplers_RVALID : STD_LOGIC;
  signal m09_couplers_to_m09_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m09_couplers_to_m09_couplers_WREADY : STD_LOGIC;
  signal m09_couplers_to_m09_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m09_couplers_to_m09_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m09_couplers_to_m09_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m09_couplers_to_m09_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= m09_couplers_to_m09_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m09_couplers_to_m09_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m09_couplers_to_m09_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= m09_couplers_to_m09_couplers_AWVALID;
  M_AXI_bready <= m09_couplers_to_m09_couplers_BREADY;
  M_AXI_rready <= m09_couplers_to_m09_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m09_couplers_to_m09_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m09_couplers_to_m09_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m09_couplers_to_m09_couplers_WVALID;
  S_AXI_arready <= m09_couplers_to_m09_couplers_ARREADY;
  S_AXI_awready <= m09_couplers_to_m09_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m09_couplers_to_m09_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m09_couplers_to_m09_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m09_couplers_to_m09_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m09_couplers_to_m09_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m09_couplers_to_m09_couplers_RVALID;
  S_AXI_wready <= m09_couplers_to_m09_couplers_WREADY;
  m09_couplers_to_m09_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m09_couplers_to_m09_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m09_couplers_to_m09_couplers_ARREADY <= M_AXI_arready;
  m09_couplers_to_m09_couplers_ARVALID <= S_AXI_arvalid;
  m09_couplers_to_m09_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m09_couplers_to_m09_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m09_couplers_to_m09_couplers_AWREADY <= M_AXI_awready;
  m09_couplers_to_m09_couplers_AWVALID <= S_AXI_awvalid;
  m09_couplers_to_m09_couplers_BREADY <= S_AXI_bready;
  m09_couplers_to_m09_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m09_couplers_to_m09_couplers_BVALID <= M_AXI_bvalid;
  m09_couplers_to_m09_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m09_couplers_to_m09_couplers_RREADY <= S_AXI_rready;
  m09_couplers_to_m09_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m09_couplers_to_m09_couplers_RVALID <= M_AXI_rvalid;
  m09_couplers_to_m09_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m09_couplers_to_m09_couplers_WREADY <= M_AXI_wready;
  m09_couplers_to_m09_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m09_couplers_to_m09_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m10_couplers_imp_HWT5MB is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m10_couplers_imp_HWT5MB;

architecture STRUCTURE of m10_couplers_imp_HWT5MB is
  signal m10_couplers_to_m10_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m10_couplers_to_m10_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m10_couplers_to_m10_couplers_ARREADY : STD_LOGIC;
  signal m10_couplers_to_m10_couplers_ARVALID : STD_LOGIC;
  signal m10_couplers_to_m10_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m10_couplers_to_m10_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m10_couplers_to_m10_couplers_AWREADY : STD_LOGIC;
  signal m10_couplers_to_m10_couplers_AWVALID : STD_LOGIC;
  signal m10_couplers_to_m10_couplers_BREADY : STD_LOGIC;
  signal m10_couplers_to_m10_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m10_couplers_to_m10_couplers_BVALID : STD_LOGIC;
  signal m10_couplers_to_m10_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m10_couplers_to_m10_couplers_RREADY : STD_LOGIC;
  signal m10_couplers_to_m10_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m10_couplers_to_m10_couplers_RVALID : STD_LOGIC;
  signal m10_couplers_to_m10_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m10_couplers_to_m10_couplers_WREADY : STD_LOGIC;
  signal m10_couplers_to_m10_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m10_couplers_to_m10_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m10_couplers_to_m10_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m10_couplers_to_m10_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= m10_couplers_to_m10_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m10_couplers_to_m10_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m10_couplers_to_m10_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= m10_couplers_to_m10_couplers_AWVALID;
  M_AXI_bready <= m10_couplers_to_m10_couplers_BREADY;
  M_AXI_rready <= m10_couplers_to_m10_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m10_couplers_to_m10_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m10_couplers_to_m10_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m10_couplers_to_m10_couplers_WVALID;
  S_AXI_arready <= m10_couplers_to_m10_couplers_ARREADY;
  S_AXI_awready <= m10_couplers_to_m10_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m10_couplers_to_m10_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m10_couplers_to_m10_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m10_couplers_to_m10_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m10_couplers_to_m10_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m10_couplers_to_m10_couplers_RVALID;
  S_AXI_wready <= m10_couplers_to_m10_couplers_WREADY;
  m10_couplers_to_m10_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m10_couplers_to_m10_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m10_couplers_to_m10_couplers_ARREADY <= M_AXI_arready;
  m10_couplers_to_m10_couplers_ARVALID <= S_AXI_arvalid;
  m10_couplers_to_m10_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m10_couplers_to_m10_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m10_couplers_to_m10_couplers_AWREADY <= M_AXI_awready;
  m10_couplers_to_m10_couplers_AWVALID <= S_AXI_awvalid;
  m10_couplers_to_m10_couplers_BREADY <= S_AXI_bready;
  m10_couplers_to_m10_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m10_couplers_to_m10_couplers_BVALID <= M_AXI_bvalid;
  m10_couplers_to_m10_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m10_couplers_to_m10_couplers_RREADY <= S_AXI_rready;
  m10_couplers_to_m10_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m10_couplers_to_m10_couplers_RVALID <= M_AXI_rvalid;
  m10_couplers_to_m10_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m10_couplers_to_m10_couplers_WREADY <= M_AXI_wready;
  m10_couplers_to_m10_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m10_couplers_to_m10_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m11_couplers_imp_1CSQTEA is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wvalid : in STD_LOGIC
  );
end m11_couplers_imp_1CSQTEA;

architecture STRUCTURE of m11_couplers_imp_1CSQTEA is
  signal m11_couplers_to_m11_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m11_couplers_to_m11_couplers_ARREADY : STD_LOGIC;
  signal m11_couplers_to_m11_couplers_ARVALID : STD_LOGIC;
  signal m11_couplers_to_m11_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m11_couplers_to_m11_couplers_AWREADY : STD_LOGIC;
  signal m11_couplers_to_m11_couplers_AWVALID : STD_LOGIC;
  signal m11_couplers_to_m11_couplers_BREADY : STD_LOGIC;
  signal m11_couplers_to_m11_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m11_couplers_to_m11_couplers_BVALID : STD_LOGIC;
  signal m11_couplers_to_m11_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m11_couplers_to_m11_couplers_RREADY : STD_LOGIC;
  signal m11_couplers_to_m11_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m11_couplers_to_m11_couplers_RVALID : STD_LOGIC;
  signal m11_couplers_to_m11_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m11_couplers_to_m11_couplers_WREADY : STD_LOGIC;
  signal m11_couplers_to_m11_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m11_couplers_to_m11_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= m11_couplers_to_m11_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m11_couplers_to_m11_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= m11_couplers_to_m11_couplers_AWVALID;
  M_AXI_bready <= m11_couplers_to_m11_couplers_BREADY;
  M_AXI_rready <= m11_couplers_to_m11_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m11_couplers_to_m11_couplers_WDATA(31 downto 0);
  M_AXI_wvalid <= m11_couplers_to_m11_couplers_WVALID;
  S_AXI_arready <= m11_couplers_to_m11_couplers_ARREADY;
  S_AXI_awready <= m11_couplers_to_m11_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m11_couplers_to_m11_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m11_couplers_to_m11_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m11_couplers_to_m11_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m11_couplers_to_m11_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m11_couplers_to_m11_couplers_RVALID;
  S_AXI_wready <= m11_couplers_to_m11_couplers_WREADY;
  m11_couplers_to_m11_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m11_couplers_to_m11_couplers_ARREADY <= M_AXI_arready;
  m11_couplers_to_m11_couplers_ARVALID <= S_AXI_arvalid;
  m11_couplers_to_m11_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m11_couplers_to_m11_couplers_AWREADY <= M_AXI_awready;
  m11_couplers_to_m11_couplers_AWVALID <= S_AXI_awvalid;
  m11_couplers_to_m11_couplers_BREADY <= S_AXI_bready;
  m11_couplers_to_m11_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m11_couplers_to_m11_couplers_BVALID <= M_AXI_bvalid;
  m11_couplers_to_m11_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m11_couplers_to_m11_couplers_RREADY <= S_AXI_rready;
  m11_couplers_to_m11_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m11_couplers_to_m11_couplers_RVALID <= M_AXI_rvalid;
  m11_couplers_to_m11_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m11_couplers_to_m11_couplers_WREADY <= M_AXI_wready;
  m11_couplers_to_m11_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m12_couplers_imp_J8PYCW is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m12_couplers_imp_J8PYCW;

architecture STRUCTURE of m12_couplers_imp_J8PYCW is
  signal m12_couplers_to_m12_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m12_couplers_to_m12_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m12_couplers_to_m12_couplers_ARREADY : STD_LOGIC;
  signal m12_couplers_to_m12_couplers_ARVALID : STD_LOGIC;
  signal m12_couplers_to_m12_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m12_couplers_to_m12_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m12_couplers_to_m12_couplers_AWREADY : STD_LOGIC;
  signal m12_couplers_to_m12_couplers_AWVALID : STD_LOGIC;
  signal m12_couplers_to_m12_couplers_BREADY : STD_LOGIC;
  signal m12_couplers_to_m12_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m12_couplers_to_m12_couplers_BVALID : STD_LOGIC;
  signal m12_couplers_to_m12_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m12_couplers_to_m12_couplers_RREADY : STD_LOGIC;
  signal m12_couplers_to_m12_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m12_couplers_to_m12_couplers_RVALID : STD_LOGIC;
  signal m12_couplers_to_m12_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m12_couplers_to_m12_couplers_WREADY : STD_LOGIC;
  signal m12_couplers_to_m12_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m12_couplers_to_m12_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m12_couplers_to_m12_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m12_couplers_to_m12_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= m12_couplers_to_m12_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m12_couplers_to_m12_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m12_couplers_to_m12_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= m12_couplers_to_m12_couplers_AWVALID;
  M_AXI_bready <= m12_couplers_to_m12_couplers_BREADY;
  M_AXI_rready <= m12_couplers_to_m12_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m12_couplers_to_m12_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m12_couplers_to_m12_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m12_couplers_to_m12_couplers_WVALID;
  S_AXI_arready <= m12_couplers_to_m12_couplers_ARREADY;
  S_AXI_awready <= m12_couplers_to_m12_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m12_couplers_to_m12_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m12_couplers_to_m12_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m12_couplers_to_m12_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m12_couplers_to_m12_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m12_couplers_to_m12_couplers_RVALID;
  S_AXI_wready <= m12_couplers_to_m12_couplers_WREADY;
  m12_couplers_to_m12_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m12_couplers_to_m12_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m12_couplers_to_m12_couplers_ARREADY <= M_AXI_arready;
  m12_couplers_to_m12_couplers_ARVALID <= S_AXI_arvalid;
  m12_couplers_to_m12_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m12_couplers_to_m12_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m12_couplers_to_m12_couplers_AWREADY <= M_AXI_awready;
  m12_couplers_to_m12_couplers_AWVALID <= S_AXI_awvalid;
  m12_couplers_to_m12_couplers_BREADY <= S_AXI_bready;
  m12_couplers_to_m12_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m12_couplers_to_m12_couplers_BVALID <= M_AXI_bvalid;
  m12_couplers_to_m12_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m12_couplers_to_m12_couplers_RREADY <= S_AXI_rready;
  m12_couplers_to_m12_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m12_couplers_to_m12_couplers_RVALID <= M_AXI_rvalid;
  m12_couplers_to_m12_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m12_couplers_to_m12_couplers_WREADY <= M_AXI_wready;
  m12_couplers_to_m12_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m12_couplers_to_m12_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m13_couplers_imp_1B6IK7L is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wvalid : in STD_LOGIC
  );
end m13_couplers_imp_1B6IK7L;

architecture STRUCTURE of m13_couplers_imp_1B6IK7L is
  signal m13_couplers_to_m13_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m13_couplers_to_m13_couplers_ARREADY : STD_LOGIC;
  signal m13_couplers_to_m13_couplers_ARVALID : STD_LOGIC;
  signal m13_couplers_to_m13_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m13_couplers_to_m13_couplers_AWREADY : STD_LOGIC;
  signal m13_couplers_to_m13_couplers_AWVALID : STD_LOGIC;
  signal m13_couplers_to_m13_couplers_BREADY : STD_LOGIC;
  signal m13_couplers_to_m13_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m13_couplers_to_m13_couplers_BVALID : STD_LOGIC;
  signal m13_couplers_to_m13_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m13_couplers_to_m13_couplers_RREADY : STD_LOGIC;
  signal m13_couplers_to_m13_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m13_couplers_to_m13_couplers_RVALID : STD_LOGIC;
  signal m13_couplers_to_m13_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m13_couplers_to_m13_couplers_WREADY : STD_LOGIC;
  signal m13_couplers_to_m13_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m13_couplers_to_m13_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= m13_couplers_to_m13_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m13_couplers_to_m13_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= m13_couplers_to_m13_couplers_AWVALID;
  M_AXI_bready <= m13_couplers_to_m13_couplers_BREADY;
  M_AXI_rready <= m13_couplers_to_m13_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m13_couplers_to_m13_couplers_WDATA(31 downto 0);
  M_AXI_wvalid <= m13_couplers_to_m13_couplers_WVALID;
  S_AXI_arready <= m13_couplers_to_m13_couplers_ARREADY;
  S_AXI_awready <= m13_couplers_to_m13_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m13_couplers_to_m13_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m13_couplers_to_m13_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m13_couplers_to_m13_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m13_couplers_to_m13_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m13_couplers_to_m13_couplers_RVALID;
  S_AXI_wready <= m13_couplers_to_m13_couplers_WREADY;
  m13_couplers_to_m13_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m13_couplers_to_m13_couplers_ARREADY <= M_AXI_arready;
  m13_couplers_to_m13_couplers_ARVALID <= S_AXI_arvalid;
  m13_couplers_to_m13_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m13_couplers_to_m13_couplers_AWREADY <= M_AXI_awready;
  m13_couplers_to_m13_couplers_AWVALID <= S_AXI_awvalid;
  m13_couplers_to_m13_couplers_BREADY <= S_AXI_bready;
  m13_couplers_to_m13_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m13_couplers_to_m13_couplers_BVALID <= M_AXI_bvalid;
  m13_couplers_to_m13_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m13_couplers_to_m13_couplers_RREADY <= S_AXI_rready;
  m13_couplers_to_m13_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m13_couplers_to_m13_couplers_RVALID <= M_AXI_rvalid;
  m13_couplers_to_m13_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m13_couplers_to_m13_couplers_WREADY <= M_AXI_wready;
  m13_couplers_to_m13_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m14_couplers_imp_KULMET is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m14_couplers_imp_KULMET;

architecture STRUCTURE of m14_couplers_imp_KULMET is
  signal m14_couplers_to_m14_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m14_couplers_to_m14_couplers_ARREADY : STD_LOGIC;
  signal m14_couplers_to_m14_couplers_ARVALID : STD_LOGIC;
  signal m14_couplers_to_m14_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m14_couplers_to_m14_couplers_AWREADY : STD_LOGIC;
  signal m14_couplers_to_m14_couplers_AWVALID : STD_LOGIC;
  signal m14_couplers_to_m14_couplers_BREADY : STD_LOGIC;
  signal m14_couplers_to_m14_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m14_couplers_to_m14_couplers_BVALID : STD_LOGIC;
  signal m14_couplers_to_m14_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m14_couplers_to_m14_couplers_RREADY : STD_LOGIC;
  signal m14_couplers_to_m14_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m14_couplers_to_m14_couplers_RVALID : STD_LOGIC;
  signal m14_couplers_to_m14_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m14_couplers_to_m14_couplers_WREADY : STD_LOGIC;
  signal m14_couplers_to_m14_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m14_couplers_to_m14_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m14_couplers_to_m14_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid <= m14_couplers_to_m14_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m14_couplers_to_m14_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid <= m14_couplers_to_m14_couplers_AWVALID;
  M_AXI_bready <= m14_couplers_to_m14_couplers_BREADY;
  M_AXI_rready <= m14_couplers_to_m14_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m14_couplers_to_m14_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m14_couplers_to_m14_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m14_couplers_to_m14_couplers_WVALID;
  S_AXI_arready <= m14_couplers_to_m14_couplers_ARREADY;
  S_AXI_awready <= m14_couplers_to_m14_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m14_couplers_to_m14_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m14_couplers_to_m14_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m14_couplers_to_m14_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m14_couplers_to_m14_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m14_couplers_to_m14_couplers_RVALID;
  S_AXI_wready <= m14_couplers_to_m14_couplers_WREADY;
  m14_couplers_to_m14_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m14_couplers_to_m14_couplers_ARREADY <= M_AXI_arready;
  m14_couplers_to_m14_couplers_ARVALID <= S_AXI_arvalid;
  m14_couplers_to_m14_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m14_couplers_to_m14_couplers_AWREADY <= M_AXI_awready;
  m14_couplers_to_m14_couplers_AWVALID <= S_AXI_awvalid;
  m14_couplers_to_m14_couplers_BREADY <= S_AXI_bready;
  m14_couplers_to_m14_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m14_couplers_to_m14_couplers_BVALID <= M_AXI_bvalid;
  m14_couplers_to_m14_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m14_couplers_to_m14_couplers_RREADY <= S_AXI_rready;
  m14_couplers_to_m14_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m14_couplers_to_m14_couplers_RVALID <= M_AXI_rvalid;
  m14_couplers_to_m14_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m14_couplers_to_m14_couplers_WREADY <= M_AXI_wready;
  m14_couplers_to_m14_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m14_couplers_to_m14_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_15K5X9K is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_wlast : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s00_couplers_imp_15K5X9K;

architecture STRUCTURE of s00_couplers_imp_15K5X9K is
  component design_1_auto_pc_3 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC
  );
  end component design_1_auto_pc_3;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_pc_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s00_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal auto_pc_to_s00_couplers_WLAST : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_pc_to_s00_couplers_WVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s00_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_auto_pc_WVALID : STD_LOGIC;
begin
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_s00_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= auto_pc_to_s00_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= auto_pc_to_s00_couplers_AWCACHE(3 downto 0);
  M_AXI_awlen(3 downto 0) <= auto_pc_to_s00_couplers_AWLEN(3 downto 0);
  M_AXI_awlock(1 downto 0) <= auto_pc_to_s00_couplers_AWLOCK(1 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_pc_to_s00_couplers_AWPROT(2 downto 0);
  M_AXI_awqos(3 downto 0) <= auto_pc_to_s00_couplers_AWQOS(3 downto 0);
  M_AXI_awsize(2 downto 0) <= auto_pc_to_s00_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid <= auto_pc_to_s00_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_s00_couplers_BREADY;
  M_AXI_wdata(63 downto 0) <= auto_pc_to_s00_couplers_WDATA(63 downto 0);
  M_AXI_wlast <= auto_pc_to_s00_couplers_WLAST;
  M_AXI_wstrb(7 downto 0) <= auto_pc_to_s00_couplers_WSTRB(7 downto 0);
  M_AXI_wvalid <= auto_pc_to_s00_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1(0) <= S_ARESETN(0);
  S_AXI_awready <= s00_couplers_to_auto_pc_AWREADY;
  S_AXI_bresp(1 downto 0) <= s00_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= s00_couplers_to_auto_pc_BVALID;
  S_AXI_wready <= s00_couplers_to_auto_pc_WREADY;
  auto_pc_to_s00_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_s00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_s00_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_s00_couplers_WREADY <= M_AXI_wready;
  s00_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s00_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s00_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  s00_couplers_to_auto_pc_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  s00_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s00_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s00_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  s00_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  s00_couplers_to_auto_pc_WDATA(63 downto 0) <= S_AXI_wdata(63 downto 0);
  s00_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  s00_couplers_to_auto_pc_WSTRB(7 downto 0) <= S_AXI_wstrb(7 downto 0);
  s00_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component design_1_auto_pc_3
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1(0),
      m_axi_awaddr(31 downto 0) => auto_pc_to_s00_couplers_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => auto_pc_to_s00_couplers_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => auto_pc_to_s00_couplers_AWCACHE(3 downto 0),
      m_axi_awlen(3 downto 0) => auto_pc_to_s00_couplers_AWLEN(3 downto 0),
      m_axi_awlock(1 downto 0) => auto_pc_to_s00_couplers_AWLOCK(1 downto 0),
      m_axi_awprot(2 downto 0) => auto_pc_to_s00_couplers_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => auto_pc_to_s00_couplers_AWQOS(3 downto 0),
      m_axi_awready => auto_pc_to_s00_couplers_AWREADY,
      m_axi_awsize(2 downto 0) => auto_pc_to_s00_couplers_AWSIZE(2 downto 0),
      m_axi_awvalid => auto_pc_to_s00_couplers_AWVALID,
      m_axi_bready => auto_pc_to_s00_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_s00_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_s00_couplers_BVALID,
      m_axi_wdata(63 downto 0) => auto_pc_to_s00_couplers_WDATA(63 downto 0),
      m_axi_wlast => auto_pc_to_s00_couplers_WLAST,
      m_axi_wready => auto_pc_to_s00_couplers_WREADY,
      m_axi_wstrb(7 downto 0) => auto_pc_to_s00_couplers_WSTRB(7 downto 0),
      m_axi_wvalid => auto_pc_to_s00_couplers_WVALID,
      s_axi_awaddr(31 downto 0) => s00_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => s00_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => s00_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awlen(7 downto 0) => s00_couplers_to_auto_pc_AWLEN(7 downto 0),
      s_axi_awlock(0) => '0',
      s_axi_awprot(2 downto 0) => s00_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => B"0000",
      s_axi_awready => s00_couplers_to_auto_pc_AWREADY,
      s_axi_awregion(3 downto 0) => B"0000",
      s_axi_awsize(2 downto 0) => s00_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => s00_couplers_to_auto_pc_AWVALID,
      s_axi_bready => s00_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => s00_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => s00_couplers_to_auto_pc_BVALID,
      s_axi_wdata(63 downto 0) => s00_couplers_to_auto_pc_WDATA(63 downto 0),
      s_axi_wlast => s00_couplers_to_auto_pc_WLAST,
      s_axi_wready => s00_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(7 downto 0) => s00_couplers_to_auto_pc_WSTRB(7 downto 0),
      s_axi_wvalid => s00_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_1PJ7QEI is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s00_couplers_imp_1PJ7QEI;

architecture STRUCTURE of s00_couplers_imp_1PJ7QEI is
  component design_1_auto_pc_2 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component design_1_auto_pc_2;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_pc_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s00_couplers_WVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= auto_pc_to_s00_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_pc_to_s00_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_pc_to_s00_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_s00_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_pc_to_s00_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_pc_to_s00_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_s00_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_s00_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_s00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_pc_to_s00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_pc_to_s00_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1(0) <= S_ARESETN(0);
  S_AXI_arready <= s00_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= s00_couplers_to_auto_pc_AWREADY;
  S_AXI_bid(11 downto 0) <= s00_couplers_to_auto_pc_BID(11 downto 0);
  S_AXI_bresp(1 downto 0) <= s00_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= s00_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= s00_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rid(11 downto 0) <= s00_couplers_to_auto_pc_RID(11 downto 0);
  S_AXI_rlast <= s00_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= s00_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= s00_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= s00_couplers_to_auto_pc_WREADY;
  auto_pc_to_s00_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_s00_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_s00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_s00_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_s00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_s00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_s00_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_s00_couplers_WREADY <= M_AXI_wready;
  s00_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s00_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  s00_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  s00_couplers_to_auto_pc_ARID(11 downto 0) <= S_AXI_arid(11 downto 0);
  s00_couplers_to_auto_pc_ARLEN(3 downto 0) <= S_AXI_arlen(3 downto 0);
  s00_couplers_to_auto_pc_ARLOCK(1 downto 0) <= S_AXI_arlock(1 downto 0);
  s00_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s00_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  s00_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  s00_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  s00_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s00_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s00_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  s00_couplers_to_auto_pc_AWID(11 downto 0) <= S_AXI_awid(11 downto 0);
  s00_couplers_to_auto_pc_AWLEN(3 downto 0) <= S_AXI_awlen(3 downto 0);
  s00_couplers_to_auto_pc_AWLOCK(1 downto 0) <= S_AXI_awlock(1 downto 0);
  s00_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s00_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  s00_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s00_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  s00_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  s00_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  s00_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s00_couplers_to_auto_pc_WID(11 downto 0) <= S_AXI_wid(11 downto 0);
  s00_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  s00_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s00_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component design_1_auto_pc_2
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1(0),
      m_axi_araddr(31 downto 0) => auto_pc_to_s00_couplers_ARADDR(31 downto 0),
      m_axi_arprot(2 downto 0) => auto_pc_to_s00_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_pc_to_s00_couplers_ARREADY,
      m_axi_arvalid => auto_pc_to_s00_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_s00_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_pc_to_s00_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_pc_to_s00_couplers_AWREADY,
      m_axi_awvalid => auto_pc_to_s00_couplers_AWVALID,
      m_axi_bready => auto_pc_to_s00_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_s00_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_s00_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_s00_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_pc_to_s00_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_s00_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_s00_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_s00_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_pc_to_s00_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_s00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_s00_couplers_WVALID,
      s_axi_araddr(31 downto 0) => s00_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => s00_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => s00_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arid(11 downto 0) => s00_couplers_to_auto_pc_ARID(11 downto 0),
      s_axi_arlen(3 downto 0) => s00_couplers_to_auto_pc_ARLEN(3 downto 0),
      s_axi_arlock(1 downto 0) => s00_couplers_to_auto_pc_ARLOCK(1 downto 0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => s00_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => s00_couplers_to_auto_pc_ARREADY,
      s_axi_arsize(2 downto 0) => s00_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => s00_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => s00_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => s00_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => s00_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awid(11 downto 0) => s00_couplers_to_auto_pc_AWID(11 downto 0),
      s_axi_awlen(3 downto 0) => s00_couplers_to_auto_pc_AWLEN(3 downto 0),
      s_axi_awlock(1 downto 0) => s00_couplers_to_auto_pc_AWLOCK(1 downto 0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => s00_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => s00_couplers_to_auto_pc_AWREADY,
      s_axi_awsize(2 downto 0) => s00_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => s00_couplers_to_auto_pc_AWVALID,
      s_axi_bid(11 downto 0) => s00_couplers_to_auto_pc_BID(11 downto 0),
      s_axi_bready => s00_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => s00_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => s00_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => s00_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rid(11 downto 0) => s00_couplers_to_auto_pc_RID(11 downto 0),
      s_axi_rlast => s00_couplers_to_auto_pc_RLAST,
      s_axi_rready => s00_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => s00_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => s00_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => s00_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wid(11 downto 0) => s00_couplers_to_auto_pc_WID(11 downto 0),
      s_axi_wlast => s00_couplers_to_auto_pc_WLAST,
      s_axi_wready => s00_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => s00_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => s00_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_D9C2BV is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_wlast : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s00_couplers_imp_D9C2BV;

architecture STRUCTURE of s00_couplers_imp_D9C2BV is
  signal s00_couplers_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_couplers_AWREADY : STD_LOGIC;
  signal s00_couplers_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_couplers_AWVALID : STD_LOGIC;
  signal s00_couplers_to_s00_couplers_BREADY : STD_LOGIC;
  signal s00_couplers_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_couplers_BVALID : STD_LOGIC;
  signal s00_couplers_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s00_couplers_to_s00_couplers_WLAST : STD_LOGIC;
  signal s00_couplers_to_s00_couplers_WREADY : STD_LOGIC;
  signal s00_couplers_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_s00_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_awaddr(31 downto 0) <= s00_couplers_to_s00_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= s00_couplers_to_s00_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= s00_couplers_to_s00_couplers_AWCACHE(3 downto 0);
  M_AXI_awlen(7 downto 0) <= s00_couplers_to_s00_couplers_AWLEN(7 downto 0);
  M_AXI_awprot(2 downto 0) <= s00_couplers_to_s00_couplers_AWPROT(2 downto 0);
  M_AXI_awsize(2 downto 0) <= s00_couplers_to_s00_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid <= s00_couplers_to_s00_couplers_AWVALID;
  M_AXI_bready <= s00_couplers_to_s00_couplers_BREADY;
  M_AXI_wdata(63 downto 0) <= s00_couplers_to_s00_couplers_WDATA(63 downto 0);
  M_AXI_wlast <= s00_couplers_to_s00_couplers_WLAST;
  M_AXI_wstrb(7 downto 0) <= s00_couplers_to_s00_couplers_WSTRB(7 downto 0);
  M_AXI_wvalid <= s00_couplers_to_s00_couplers_WVALID;
  S_AXI_awready <= s00_couplers_to_s00_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= s00_couplers_to_s00_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= s00_couplers_to_s00_couplers_BVALID;
  S_AXI_wready <= s00_couplers_to_s00_couplers_WREADY;
  s00_couplers_to_s00_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s00_couplers_to_s00_couplers_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s00_couplers_to_s00_couplers_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  s00_couplers_to_s00_couplers_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  s00_couplers_to_s00_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s00_couplers_to_s00_couplers_AWREADY <= M_AXI_awready;
  s00_couplers_to_s00_couplers_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s00_couplers_to_s00_couplers_AWVALID <= S_AXI_awvalid;
  s00_couplers_to_s00_couplers_BREADY <= S_AXI_bready;
  s00_couplers_to_s00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  s00_couplers_to_s00_couplers_BVALID <= M_AXI_bvalid;
  s00_couplers_to_s00_couplers_WDATA(63 downto 0) <= S_AXI_wdata(63 downto 0);
  s00_couplers_to_s00_couplers_WLAST <= S_AXI_wlast;
  s00_couplers_to_s00_couplers_WREADY <= M_AXI_wready;
  s00_couplers_to_s00_couplers_WSTRB(7 downto 0) <= S_AXI_wstrb(7 downto 0);
  s00_couplers_to_s00_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_ULY0TL is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s00_couplers_imp_ULY0TL;

architecture STRUCTURE of s00_couplers_imp_ULY0TL is
  component design_1_auto_pc_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component design_1_auto_pc_0;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_pc_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s00_couplers_WVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= auto_pc_to_s00_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_pc_to_s00_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_pc_to_s00_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_s00_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_pc_to_s00_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_pc_to_s00_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_s00_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_s00_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_s00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_pc_to_s00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_pc_to_s00_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1(0) <= S_ARESETN(0);
  S_AXI_arready <= s00_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= s00_couplers_to_auto_pc_AWREADY;
  S_AXI_bid(11 downto 0) <= s00_couplers_to_auto_pc_BID(11 downto 0);
  S_AXI_bresp(1 downto 0) <= s00_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= s00_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= s00_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rid(11 downto 0) <= s00_couplers_to_auto_pc_RID(11 downto 0);
  S_AXI_rlast <= s00_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= s00_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= s00_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= s00_couplers_to_auto_pc_WREADY;
  auto_pc_to_s00_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_s00_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_s00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_s00_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_s00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_s00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_s00_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_s00_couplers_WREADY <= M_AXI_wready;
  s00_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s00_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  s00_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  s00_couplers_to_auto_pc_ARID(11 downto 0) <= S_AXI_arid(11 downto 0);
  s00_couplers_to_auto_pc_ARLEN(3 downto 0) <= S_AXI_arlen(3 downto 0);
  s00_couplers_to_auto_pc_ARLOCK(1 downto 0) <= S_AXI_arlock(1 downto 0);
  s00_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s00_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  s00_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  s00_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  s00_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s00_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s00_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  s00_couplers_to_auto_pc_AWID(11 downto 0) <= S_AXI_awid(11 downto 0);
  s00_couplers_to_auto_pc_AWLEN(3 downto 0) <= S_AXI_awlen(3 downto 0);
  s00_couplers_to_auto_pc_AWLOCK(1 downto 0) <= S_AXI_awlock(1 downto 0);
  s00_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s00_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  s00_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s00_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  s00_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  s00_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  s00_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s00_couplers_to_auto_pc_WID(11 downto 0) <= S_AXI_wid(11 downto 0);
  s00_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  s00_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s00_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component design_1_auto_pc_0
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1(0),
      m_axi_araddr(31 downto 0) => auto_pc_to_s00_couplers_ARADDR(31 downto 0),
      m_axi_arprot(2 downto 0) => auto_pc_to_s00_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_pc_to_s00_couplers_ARREADY,
      m_axi_arvalid => auto_pc_to_s00_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_s00_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_pc_to_s00_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_pc_to_s00_couplers_AWREADY,
      m_axi_awvalid => auto_pc_to_s00_couplers_AWVALID,
      m_axi_bready => auto_pc_to_s00_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_s00_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_s00_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_s00_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_pc_to_s00_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_s00_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_s00_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_s00_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_pc_to_s00_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_s00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_s00_couplers_WVALID,
      s_axi_araddr(31 downto 0) => s00_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => s00_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => s00_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arid(11 downto 0) => s00_couplers_to_auto_pc_ARID(11 downto 0),
      s_axi_arlen(3 downto 0) => s00_couplers_to_auto_pc_ARLEN(3 downto 0),
      s_axi_arlock(1 downto 0) => s00_couplers_to_auto_pc_ARLOCK(1 downto 0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => s00_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => s00_couplers_to_auto_pc_ARREADY,
      s_axi_arsize(2 downto 0) => s00_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => s00_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => s00_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => s00_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => s00_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awid(11 downto 0) => s00_couplers_to_auto_pc_AWID(11 downto 0),
      s_axi_awlen(3 downto 0) => s00_couplers_to_auto_pc_AWLEN(3 downto 0),
      s_axi_awlock(1 downto 0) => s00_couplers_to_auto_pc_AWLOCK(1 downto 0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => s00_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => s00_couplers_to_auto_pc_AWREADY,
      s_axi_awsize(2 downto 0) => s00_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => s00_couplers_to_auto_pc_AWVALID,
      s_axi_bid(11 downto 0) => s00_couplers_to_auto_pc_BID(11 downto 0),
      s_axi_bready => s00_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => s00_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => s00_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => s00_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rid(11 downto 0) => s00_couplers_to_auto_pc_RID(11 downto 0),
      s_axi_rlast => s00_couplers_to_auto_pc_RLAST,
      s_axi_rready => s00_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => s00_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => s00_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => s00_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wid(11 downto 0) => s00_couplers_to_auto_pc_WID(11 downto 0),
      s_axi_wlast => s00_couplers_to_auto_pc_WLAST,
      s_axi_wready => s00_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => s00_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => s00_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s01_couplers_imp_1HFVYUI is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_wlast : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s01_couplers_imp_1HFVYUI;

architecture STRUCTURE of s01_couplers_imp_1HFVYUI is
  component design_1_auto_us_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC
  );
  end component design_1_auto_us_0;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_us_to_s01_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_us_to_s01_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_us_to_s01_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_us_to_s01_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_us_to_s01_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal auto_us_to_s01_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_us_to_s01_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_us_to_s01_couplers_AWREADY : STD_LOGIC;
  signal auto_us_to_s01_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_us_to_s01_couplers_AWVALID : STD_LOGIC;
  signal auto_us_to_s01_couplers_BREADY : STD_LOGIC;
  signal auto_us_to_s01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_us_to_s01_couplers_BVALID : STD_LOGIC;
  signal auto_us_to_s01_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal auto_us_to_s01_couplers_WLAST : STD_LOGIC;
  signal auto_us_to_s01_couplers_WREADY : STD_LOGIC;
  signal auto_us_to_s01_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal auto_us_to_s01_couplers_WVALID : STD_LOGIC;
  signal s01_couplers_to_auto_us_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_auto_us_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_auto_us_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_auto_us_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s01_couplers_to_auto_us_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s01_couplers_to_auto_us_AWREADY : STD_LOGIC;
  signal s01_couplers_to_auto_us_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s01_couplers_to_auto_us_AWVALID : STD_LOGIC;
  signal s01_couplers_to_auto_us_BREADY : STD_LOGIC;
  signal s01_couplers_to_auto_us_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_auto_us_BVALID : STD_LOGIC;
  signal s01_couplers_to_auto_us_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_auto_us_WLAST : STD_LOGIC;
  signal s01_couplers_to_auto_us_WREADY : STD_LOGIC;
  signal s01_couplers_to_auto_us_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_auto_us_WVALID : STD_LOGIC;
  signal NLW_auto_us_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  M_AXI_awaddr(31 downto 0) <= auto_us_to_s01_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= auto_us_to_s01_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= auto_us_to_s01_couplers_AWCACHE(3 downto 0);
  M_AXI_awlen(7 downto 0) <= auto_us_to_s01_couplers_AWLEN(7 downto 0);
  M_AXI_awlock(0) <= auto_us_to_s01_couplers_AWLOCK(0);
  M_AXI_awprot(2 downto 0) <= auto_us_to_s01_couplers_AWPROT(2 downto 0);
  M_AXI_awqos(3 downto 0) <= auto_us_to_s01_couplers_AWQOS(3 downto 0);
  M_AXI_awsize(2 downto 0) <= auto_us_to_s01_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid <= auto_us_to_s01_couplers_AWVALID;
  M_AXI_bready <= auto_us_to_s01_couplers_BREADY;
  M_AXI_wdata(63 downto 0) <= auto_us_to_s01_couplers_WDATA(63 downto 0);
  M_AXI_wlast <= auto_us_to_s01_couplers_WLAST;
  M_AXI_wstrb(7 downto 0) <= auto_us_to_s01_couplers_WSTRB(7 downto 0);
  M_AXI_wvalid <= auto_us_to_s01_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1(0) <= S_ARESETN(0);
  S_AXI_awready <= s01_couplers_to_auto_us_AWREADY;
  S_AXI_bresp(1 downto 0) <= s01_couplers_to_auto_us_BRESP(1 downto 0);
  S_AXI_bvalid <= s01_couplers_to_auto_us_BVALID;
  S_AXI_wready <= s01_couplers_to_auto_us_WREADY;
  auto_us_to_s01_couplers_AWREADY <= M_AXI_awready;
  auto_us_to_s01_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_us_to_s01_couplers_BVALID <= M_AXI_bvalid;
  auto_us_to_s01_couplers_WREADY <= M_AXI_wready;
  s01_couplers_to_auto_us_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s01_couplers_to_auto_us_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s01_couplers_to_auto_us_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  s01_couplers_to_auto_us_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  s01_couplers_to_auto_us_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s01_couplers_to_auto_us_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s01_couplers_to_auto_us_AWVALID <= S_AXI_awvalid;
  s01_couplers_to_auto_us_BREADY <= S_AXI_bready;
  s01_couplers_to_auto_us_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s01_couplers_to_auto_us_WLAST <= S_AXI_wlast;
  s01_couplers_to_auto_us_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s01_couplers_to_auto_us_WVALID <= S_AXI_wvalid;
auto_us: component design_1_auto_us_0
     port map (
      m_axi_awaddr(31 downto 0) => auto_us_to_s01_couplers_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => auto_us_to_s01_couplers_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => auto_us_to_s01_couplers_AWCACHE(3 downto 0),
      m_axi_awlen(7 downto 0) => auto_us_to_s01_couplers_AWLEN(7 downto 0),
      m_axi_awlock(0) => auto_us_to_s01_couplers_AWLOCK(0),
      m_axi_awprot(2 downto 0) => auto_us_to_s01_couplers_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => auto_us_to_s01_couplers_AWQOS(3 downto 0),
      m_axi_awready => auto_us_to_s01_couplers_AWREADY,
      m_axi_awregion(3 downto 0) => NLW_auto_us_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => auto_us_to_s01_couplers_AWSIZE(2 downto 0),
      m_axi_awvalid => auto_us_to_s01_couplers_AWVALID,
      m_axi_bready => auto_us_to_s01_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_us_to_s01_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_us_to_s01_couplers_BVALID,
      m_axi_wdata(63 downto 0) => auto_us_to_s01_couplers_WDATA(63 downto 0),
      m_axi_wlast => auto_us_to_s01_couplers_WLAST,
      m_axi_wready => auto_us_to_s01_couplers_WREADY,
      m_axi_wstrb(7 downto 0) => auto_us_to_s01_couplers_WSTRB(7 downto 0),
      m_axi_wvalid => auto_us_to_s01_couplers_WVALID,
      s_axi_aclk => S_ACLK_1,
      s_axi_aresetn => S_ARESETN_1(0),
      s_axi_awaddr(31 downto 0) => s01_couplers_to_auto_us_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => s01_couplers_to_auto_us_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => s01_couplers_to_auto_us_AWCACHE(3 downto 0),
      s_axi_awlen(7 downto 0) => s01_couplers_to_auto_us_AWLEN(7 downto 0),
      s_axi_awlock(0) => '0',
      s_axi_awprot(2 downto 0) => s01_couplers_to_auto_us_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => B"0000",
      s_axi_awready => s01_couplers_to_auto_us_AWREADY,
      s_axi_awregion(3 downto 0) => B"0000",
      s_axi_awsize(2 downto 0) => s01_couplers_to_auto_us_AWSIZE(2 downto 0),
      s_axi_awvalid => s01_couplers_to_auto_us_AWVALID,
      s_axi_bready => s01_couplers_to_auto_us_BREADY,
      s_axi_bresp(1 downto 0) => s01_couplers_to_auto_us_BRESP(1 downto 0),
      s_axi_bvalid => s01_couplers_to_auto_us_BVALID,
      s_axi_wdata(31 downto 0) => s01_couplers_to_auto_us_WDATA(31 downto 0),
      s_axi_wlast => s01_couplers_to_auto_us_WLAST,
      s_axi_wready => s01_couplers_to_auto_us_WREADY,
      s_axi_wstrb(3 downto 0) => s01_couplers_to_auto_us_WSTRB(3 downto 0),
      s_axi_wvalid => s01_couplers_to_auto_us_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_interconnect_DMA_INT_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_arlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    M00_AXI_rid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    M00_AXI_rlast : in STD_LOGIC;
    M00_AXI_rready : out STD_LOGIC;
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M00_AXI_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_wlast : out STD_LOGIC;
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC;
    S01_ACLK : in STD_LOGIC;
    S01_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S01_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S01_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_awready : out STD_LOGIC;
    S01_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S01_AXI_awvalid : in STD_LOGIC;
    S01_AXI_bready : in STD_LOGIC;
    S01_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXI_bvalid : out STD_LOGIC;
    S01_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXI_wlast : in STD_LOGIC;
    S01_AXI_wready : out STD_LOGIC;
    S01_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXI_wvalid : in STD_LOGIC
  );
end design_1_axi_interconnect_DMA_INT_0;

architecture STRUCTURE of design_1_axi_interconnect_DMA_INT_0 is
  component design_1_xbar_2 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awready : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_wlast : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_wvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_wready : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arready : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rlast : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rready : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_xbar_2;
  signal M00_ACLK_1 : STD_LOGIC;
  signal M00_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_ACLK_1 : STD_LOGIC;
  signal S00_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S01_ACLK_1 : STD_LOGIC;
  signal S01_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_DMA_INT_ACLK_net : STD_LOGIC;
  signal axi_interconnect_DMA_INT_ARESETN_net : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_DMA_INT_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_DMA_INT_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_DMA_INT_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_DMA_INT_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_DMA_INT_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_DMA_INT_to_s00_couplers_AWREADY : STD_LOGIC;
  signal axi_interconnect_DMA_INT_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_DMA_INT_to_s00_couplers_AWVALID : STD_LOGIC;
  signal axi_interconnect_DMA_INT_to_s00_couplers_BREADY : STD_LOGIC;
  signal axi_interconnect_DMA_INT_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_DMA_INT_to_s00_couplers_BVALID : STD_LOGIC;
  signal axi_interconnect_DMA_INT_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_interconnect_DMA_INT_to_s00_couplers_WLAST : STD_LOGIC;
  signal axi_interconnect_DMA_INT_to_s00_couplers_WREADY : STD_LOGIC;
  signal axi_interconnect_DMA_INT_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_DMA_INT_to_s00_couplers_WVALID : STD_LOGIC;
  signal axi_interconnect_DMA_INT_to_s01_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_DMA_INT_to_s01_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_DMA_INT_to_s01_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_DMA_INT_to_s01_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_DMA_INT_to_s01_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_DMA_INT_to_s01_couplers_AWREADY : STD_LOGIC;
  signal axi_interconnect_DMA_INT_to_s01_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_DMA_INT_to_s01_couplers_AWVALID : STD_LOGIC;
  signal axi_interconnect_DMA_INT_to_s01_couplers_BREADY : STD_LOGIC;
  signal axi_interconnect_DMA_INT_to_s01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_DMA_INT_to_s01_couplers_BVALID : STD_LOGIC;
  signal axi_interconnect_DMA_INT_to_s01_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_DMA_INT_to_s01_couplers_WLAST : STD_LOGIC;
  signal axi_interconnect_DMA_INT_to_s01_couplers_WREADY : STD_LOGIC;
  signal axi_interconnect_DMA_INT_to_s01_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_DMA_INT_to_s01_couplers_WVALID : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_DMA_INT_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_ARREADY : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_DMA_INT_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_ARVALID : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_DMA_INT_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_AWREADY : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_DMA_INT_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_AWVALID : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_DMA_INT_BID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_BREADY : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_DMA_INT_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_BVALID : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_DMA_INT_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_RID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_RLAST : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_DMA_INT_RREADY : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_DMA_INT_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_RVALID : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_DMA_INT_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_WID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_WLAST : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_DMA_INT_WREADY : STD_LOGIC;
  signal m00_couplers_to_axi_interconnect_DMA_INT_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal m00_couplers_to_axi_interconnect_DMA_INT_WVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_BREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s00_couplers_to_xbar_WLAST : STD_LOGIC;
  signal s00_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_xbar_WVALID : STD_LOGIC;
  signal s01_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_xbar_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_xbar_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_xbar_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s01_couplers_to_xbar_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s01_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s01_couplers_to_xbar_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s01_couplers_to_xbar_AWVALID : STD_LOGIC;
  signal s01_couplers_to_xbar_BREADY : STD_LOGIC;
  signal s01_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal s01_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s01_couplers_to_xbar_WLAST : STD_LOGIC;
  signal s01_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s01_couplers_to_xbar_WVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xbar_to_m00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xbar_to_m00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal xbar_to_m00_couplers_RID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RLAST : STD_LOGIC;
  signal xbar_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal xbar_to_m00_couplers_WLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xbar_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_xbar_s_axi_arready_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_xbar_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_xbar_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal NLW_xbar_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_xbar_s_axi_rlast_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_xbar_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_xbar_s_axi_rvalid_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
begin
  M00_ACLK_1 <= M00_ACLK;
  M00_ARESETN_1(0) <= M00_ARESETN(0);
  M00_AXI_araddr(31 downto 0) <= m00_couplers_to_axi_interconnect_DMA_INT_ARADDR(31 downto 0);
  M00_AXI_arburst(1 downto 0) <= m00_couplers_to_axi_interconnect_DMA_INT_ARBURST(1 downto 0);
  M00_AXI_arcache(3 downto 0) <= m00_couplers_to_axi_interconnect_DMA_INT_ARCACHE(3 downto 0);
  M00_AXI_arid(0) <= m00_couplers_to_axi_interconnect_DMA_INT_ARID(0);
  M00_AXI_arlen(3 downto 0) <= m00_couplers_to_axi_interconnect_DMA_INT_ARLEN(3 downto 0);
  M00_AXI_arlock(1 downto 0) <= m00_couplers_to_axi_interconnect_DMA_INT_ARLOCK(1 downto 0);
  M00_AXI_arprot(2 downto 0) <= m00_couplers_to_axi_interconnect_DMA_INT_ARPROT(2 downto 0);
  M00_AXI_arqos(3 downto 0) <= m00_couplers_to_axi_interconnect_DMA_INT_ARQOS(3 downto 0);
  M00_AXI_arsize(2 downto 0) <= m00_couplers_to_axi_interconnect_DMA_INT_ARSIZE(2 downto 0);
  M00_AXI_arvalid <= m00_couplers_to_axi_interconnect_DMA_INT_ARVALID;
  M00_AXI_awaddr(31 downto 0) <= m00_couplers_to_axi_interconnect_DMA_INT_AWADDR(31 downto 0);
  M00_AXI_awburst(1 downto 0) <= m00_couplers_to_axi_interconnect_DMA_INT_AWBURST(1 downto 0);
  M00_AXI_awcache(3 downto 0) <= m00_couplers_to_axi_interconnect_DMA_INT_AWCACHE(3 downto 0);
  M00_AXI_awid(0) <= m00_couplers_to_axi_interconnect_DMA_INT_AWID(0);
  M00_AXI_awlen(3 downto 0) <= m00_couplers_to_axi_interconnect_DMA_INT_AWLEN(3 downto 0);
  M00_AXI_awlock(1 downto 0) <= m00_couplers_to_axi_interconnect_DMA_INT_AWLOCK(1 downto 0);
  M00_AXI_awprot(2 downto 0) <= m00_couplers_to_axi_interconnect_DMA_INT_AWPROT(2 downto 0);
  M00_AXI_awqos(3 downto 0) <= m00_couplers_to_axi_interconnect_DMA_INT_AWQOS(3 downto 0);
  M00_AXI_awsize(2 downto 0) <= m00_couplers_to_axi_interconnect_DMA_INT_AWSIZE(2 downto 0);
  M00_AXI_awvalid <= m00_couplers_to_axi_interconnect_DMA_INT_AWVALID;
  M00_AXI_bready <= m00_couplers_to_axi_interconnect_DMA_INT_BREADY;
  M00_AXI_rready <= m00_couplers_to_axi_interconnect_DMA_INT_RREADY;
  M00_AXI_wdata(63 downto 0) <= m00_couplers_to_axi_interconnect_DMA_INT_WDATA(63 downto 0);
  M00_AXI_wid(0) <= m00_couplers_to_axi_interconnect_DMA_INT_WID(0);
  M00_AXI_wlast <= m00_couplers_to_axi_interconnect_DMA_INT_WLAST;
  M00_AXI_wstrb(7 downto 0) <= m00_couplers_to_axi_interconnect_DMA_INT_WSTRB(7 downto 0);
  M00_AXI_wvalid <= m00_couplers_to_axi_interconnect_DMA_INT_WVALID;
  S00_ACLK_1 <= S00_ACLK;
  S00_ARESETN_1(0) <= S00_ARESETN(0);
  S00_AXI_awready <= axi_interconnect_DMA_INT_to_s00_couplers_AWREADY;
  S00_AXI_bresp(1 downto 0) <= axi_interconnect_DMA_INT_to_s00_couplers_BRESP(1 downto 0);
  S00_AXI_bvalid <= axi_interconnect_DMA_INT_to_s00_couplers_BVALID;
  S00_AXI_wready <= axi_interconnect_DMA_INT_to_s00_couplers_WREADY;
  S01_ACLK_1 <= S01_ACLK;
  S01_ARESETN_1(0) <= S01_ARESETN(0);
  S01_AXI_awready <= axi_interconnect_DMA_INT_to_s01_couplers_AWREADY;
  S01_AXI_bresp(1 downto 0) <= axi_interconnect_DMA_INT_to_s01_couplers_BRESP(1 downto 0);
  S01_AXI_bvalid <= axi_interconnect_DMA_INT_to_s01_couplers_BVALID;
  S01_AXI_wready <= axi_interconnect_DMA_INT_to_s01_couplers_WREADY;
  axi_interconnect_DMA_INT_ACLK_net <= ACLK;
  axi_interconnect_DMA_INT_ARESETN_net(0) <= ARESETN(0);
  axi_interconnect_DMA_INT_to_s00_couplers_AWADDR(31 downto 0) <= S00_AXI_awaddr(31 downto 0);
  axi_interconnect_DMA_INT_to_s00_couplers_AWBURST(1 downto 0) <= S00_AXI_awburst(1 downto 0);
  axi_interconnect_DMA_INT_to_s00_couplers_AWCACHE(3 downto 0) <= S00_AXI_awcache(3 downto 0);
  axi_interconnect_DMA_INT_to_s00_couplers_AWLEN(7 downto 0) <= S00_AXI_awlen(7 downto 0);
  axi_interconnect_DMA_INT_to_s00_couplers_AWPROT(2 downto 0) <= S00_AXI_awprot(2 downto 0);
  axi_interconnect_DMA_INT_to_s00_couplers_AWSIZE(2 downto 0) <= S00_AXI_awsize(2 downto 0);
  axi_interconnect_DMA_INT_to_s00_couplers_AWVALID <= S00_AXI_awvalid;
  axi_interconnect_DMA_INT_to_s00_couplers_BREADY <= S00_AXI_bready;
  axi_interconnect_DMA_INT_to_s00_couplers_WDATA(63 downto 0) <= S00_AXI_wdata(63 downto 0);
  axi_interconnect_DMA_INT_to_s00_couplers_WLAST <= S00_AXI_wlast;
  axi_interconnect_DMA_INT_to_s00_couplers_WSTRB(7 downto 0) <= S00_AXI_wstrb(7 downto 0);
  axi_interconnect_DMA_INT_to_s00_couplers_WVALID <= S00_AXI_wvalid;
  axi_interconnect_DMA_INT_to_s01_couplers_AWADDR(31 downto 0) <= S01_AXI_awaddr(31 downto 0);
  axi_interconnect_DMA_INT_to_s01_couplers_AWBURST(1 downto 0) <= S01_AXI_awburst(1 downto 0);
  axi_interconnect_DMA_INT_to_s01_couplers_AWCACHE(3 downto 0) <= S01_AXI_awcache(3 downto 0);
  axi_interconnect_DMA_INT_to_s01_couplers_AWLEN(7 downto 0) <= S01_AXI_awlen(7 downto 0);
  axi_interconnect_DMA_INT_to_s01_couplers_AWPROT(2 downto 0) <= S01_AXI_awprot(2 downto 0);
  axi_interconnect_DMA_INT_to_s01_couplers_AWSIZE(2 downto 0) <= S01_AXI_awsize(2 downto 0);
  axi_interconnect_DMA_INT_to_s01_couplers_AWVALID <= S01_AXI_awvalid;
  axi_interconnect_DMA_INT_to_s01_couplers_BREADY <= S01_AXI_bready;
  axi_interconnect_DMA_INT_to_s01_couplers_WDATA(31 downto 0) <= S01_AXI_wdata(31 downto 0);
  axi_interconnect_DMA_INT_to_s01_couplers_WLAST <= S01_AXI_wlast;
  axi_interconnect_DMA_INT_to_s01_couplers_WSTRB(3 downto 0) <= S01_AXI_wstrb(3 downto 0);
  axi_interconnect_DMA_INT_to_s01_couplers_WVALID <= S01_AXI_wvalid;
  m00_couplers_to_axi_interconnect_DMA_INT_ARREADY <= M00_AXI_arready;
  m00_couplers_to_axi_interconnect_DMA_INT_AWREADY <= M00_AXI_awready;
  m00_couplers_to_axi_interconnect_DMA_INT_BID(5 downto 0) <= M00_AXI_bid(5 downto 0);
  m00_couplers_to_axi_interconnect_DMA_INT_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  m00_couplers_to_axi_interconnect_DMA_INT_BVALID <= M00_AXI_bvalid;
  m00_couplers_to_axi_interconnect_DMA_INT_RDATA(63 downto 0) <= M00_AXI_rdata(63 downto 0);
  m00_couplers_to_axi_interconnect_DMA_INT_RID(5 downto 0) <= M00_AXI_rid(5 downto 0);
  m00_couplers_to_axi_interconnect_DMA_INT_RLAST <= M00_AXI_rlast;
  m00_couplers_to_axi_interconnect_DMA_INT_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  m00_couplers_to_axi_interconnect_DMA_INT_RVALID <= M00_AXI_rvalid;
  m00_couplers_to_axi_interconnect_DMA_INT_WREADY <= M00_AXI_wready;
m00_couplers: entity work.m00_couplers_imp_1NN8OZT
     port map (
      M_ACLK => M00_ACLK_1,
      M_ARESETN(0) => M00_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_ARADDR(31 downto 0),
      M_AXI_arburst(1 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_ARCACHE(3 downto 0),
      M_AXI_arid(0) => m00_couplers_to_axi_interconnect_DMA_INT_ARID(0),
      M_AXI_arlen(3 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_ARLEN(3 downto 0),
      M_AXI_arlock(1 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_ARLOCK(1 downto 0),
      M_AXI_arprot(2 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_ARPROT(2 downto 0),
      M_AXI_arqos(3 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_ARQOS(3 downto 0),
      M_AXI_arready => m00_couplers_to_axi_interconnect_DMA_INT_ARREADY,
      M_AXI_arsize(2 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_ARSIZE(2 downto 0),
      M_AXI_arvalid => m00_couplers_to_axi_interconnect_DMA_INT_ARVALID,
      M_AXI_awaddr(31 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_AWCACHE(3 downto 0),
      M_AXI_awid(0) => m00_couplers_to_axi_interconnect_DMA_INT_AWID(0),
      M_AXI_awlen(3 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_AWLEN(3 downto 0),
      M_AXI_awlock(1 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_AWLOCK(1 downto 0),
      M_AXI_awprot(2 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_AWPROT(2 downto 0),
      M_AXI_awqos(3 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_AWQOS(3 downto 0),
      M_AXI_awready => m00_couplers_to_axi_interconnect_DMA_INT_AWREADY,
      M_AXI_awsize(2 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_AWSIZE(2 downto 0),
      M_AXI_awvalid => m00_couplers_to_axi_interconnect_DMA_INT_AWVALID,
      M_AXI_bid(5 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_BID(5 downto 0),
      M_AXI_bready => m00_couplers_to_axi_interconnect_DMA_INT_BREADY,
      M_AXI_bresp(1 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_BRESP(1 downto 0),
      M_AXI_bvalid => m00_couplers_to_axi_interconnect_DMA_INT_BVALID,
      M_AXI_rdata(63 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_RDATA(63 downto 0),
      M_AXI_rid(5 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_RID(5 downto 0),
      M_AXI_rlast => m00_couplers_to_axi_interconnect_DMA_INT_RLAST,
      M_AXI_rready => m00_couplers_to_axi_interconnect_DMA_INT_RREADY,
      M_AXI_rresp(1 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_RRESP(1 downto 0),
      M_AXI_rvalid => m00_couplers_to_axi_interconnect_DMA_INT_RVALID,
      M_AXI_wdata(63 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_WDATA(63 downto 0),
      M_AXI_wid(0) => m00_couplers_to_axi_interconnect_DMA_INT_WID(0),
      M_AXI_wlast => m00_couplers_to_axi_interconnect_DMA_INT_WLAST,
      M_AXI_wready => m00_couplers_to_axi_interconnect_DMA_INT_WREADY,
      M_AXI_wstrb(7 downto 0) => m00_couplers_to_axi_interconnect_DMA_INT_WSTRB(7 downto 0),
      M_AXI_wvalid => m00_couplers_to_axi_interconnect_DMA_INT_WVALID,
      S_ACLK => axi_interconnect_DMA_INT_ACLK_net,
      S_ARESETN(0) => axi_interconnect_DMA_INT_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => xbar_to_m00_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => xbar_to_m00_couplers_ARCACHE(3 downto 0),
      S_AXI_arid(0) => xbar_to_m00_couplers_ARID(0),
      S_AXI_arlen(7 downto 0) => xbar_to_m00_couplers_ARLEN(7 downto 0),
      S_AXI_arlock(0) => xbar_to_m00_couplers_ARLOCK(0),
      S_AXI_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      S_AXI_arqos(3 downto 0) => xbar_to_m00_couplers_ARQOS(3 downto 0),
      S_AXI_arready => xbar_to_m00_couplers_ARREADY,
      S_AXI_arregion(3 downto 0) => xbar_to_m00_couplers_ARREGION(3 downto 0),
      S_AXI_arsize(2 downto 0) => xbar_to_m00_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => xbar_to_m00_couplers_ARVALID(0),
      S_AXI_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => xbar_to_m00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => xbar_to_m00_couplers_AWCACHE(3 downto 0),
      S_AXI_awid(0) => xbar_to_m00_couplers_AWID(0),
      S_AXI_awlen(7 downto 0) => xbar_to_m00_couplers_AWLEN(7 downto 0),
      S_AXI_awlock(0) => xbar_to_m00_couplers_AWLOCK(0),
      S_AXI_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      S_AXI_awqos(3 downto 0) => xbar_to_m00_couplers_AWQOS(3 downto 0),
      S_AXI_awready => xbar_to_m00_couplers_AWREADY,
      S_AXI_awregion(3 downto 0) => xbar_to_m00_couplers_AWREGION(3 downto 0),
      S_AXI_awsize(2 downto 0) => xbar_to_m00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => xbar_to_m00_couplers_AWVALID(0),
      S_AXI_bid(0) => xbar_to_m00_couplers_BID(0),
      S_AXI_bready => xbar_to_m00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m00_couplers_BVALID,
      S_AXI_rdata(63 downto 0) => xbar_to_m00_couplers_RDATA(63 downto 0),
      S_AXI_rid(0) => xbar_to_m00_couplers_RID(0),
      S_AXI_rlast => xbar_to_m00_couplers_RLAST,
      S_AXI_rready => xbar_to_m00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m00_couplers_RVALID,
      S_AXI_wdata(63 downto 0) => xbar_to_m00_couplers_WDATA(63 downto 0),
      S_AXI_wlast => xbar_to_m00_couplers_WLAST(0),
      S_AXI_wready => xbar_to_m00_couplers_WREADY,
      S_AXI_wstrb(7 downto 0) => xbar_to_m00_couplers_WSTRB(7 downto 0),
      S_AXI_wvalid => xbar_to_m00_couplers_WVALID(0)
    );
s00_couplers: entity work.s00_couplers_imp_D9C2BV
     port map (
      M_ACLK => axi_interconnect_DMA_INT_ACLK_net,
      M_ARESETN(0) => axi_interconnect_DMA_INT_ARESETN_net(0),
      M_AXI_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => s00_couplers_to_xbar_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => s00_couplers_to_xbar_AWCACHE(3 downto 0),
      M_AXI_awlen(7 downto 0) => s00_couplers_to_xbar_AWLEN(7 downto 0),
      M_AXI_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awready => s00_couplers_to_xbar_AWREADY(0),
      M_AXI_awsize(2 downto 0) => s00_couplers_to_xbar_AWSIZE(2 downto 0),
      M_AXI_awvalid => s00_couplers_to_xbar_AWVALID,
      M_AXI_bready => s00_couplers_to_xbar_BREADY,
      M_AXI_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      M_AXI_bvalid => s00_couplers_to_xbar_BVALID(0),
      M_AXI_wdata(63 downto 0) => s00_couplers_to_xbar_WDATA(63 downto 0),
      M_AXI_wlast => s00_couplers_to_xbar_WLAST,
      M_AXI_wready => s00_couplers_to_xbar_WREADY(0),
      M_AXI_wstrb(7 downto 0) => s00_couplers_to_xbar_WSTRB(7 downto 0),
      M_AXI_wvalid => s00_couplers_to_xbar_WVALID,
      S_ACLK => S00_ACLK_1,
      S_ARESETN(0) => S00_ARESETN_1(0),
      S_AXI_awaddr(31 downto 0) => axi_interconnect_DMA_INT_to_s00_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => axi_interconnect_DMA_INT_to_s00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => axi_interconnect_DMA_INT_to_s00_couplers_AWCACHE(3 downto 0),
      S_AXI_awlen(7 downto 0) => axi_interconnect_DMA_INT_to_s00_couplers_AWLEN(7 downto 0),
      S_AXI_awprot(2 downto 0) => axi_interconnect_DMA_INT_to_s00_couplers_AWPROT(2 downto 0),
      S_AXI_awready => axi_interconnect_DMA_INT_to_s00_couplers_AWREADY,
      S_AXI_awsize(2 downto 0) => axi_interconnect_DMA_INT_to_s00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => axi_interconnect_DMA_INT_to_s00_couplers_AWVALID,
      S_AXI_bready => axi_interconnect_DMA_INT_to_s00_couplers_BREADY,
      S_AXI_bresp(1 downto 0) => axi_interconnect_DMA_INT_to_s00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => axi_interconnect_DMA_INT_to_s00_couplers_BVALID,
      S_AXI_wdata(63 downto 0) => axi_interconnect_DMA_INT_to_s00_couplers_WDATA(63 downto 0),
      S_AXI_wlast => axi_interconnect_DMA_INT_to_s00_couplers_WLAST,
      S_AXI_wready => axi_interconnect_DMA_INT_to_s00_couplers_WREADY,
      S_AXI_wstrb(7 downto 0) => axi_interconnect_DMA_INT_to_s00_couplers_WSTRB(7 downto 0),
      S_AXI_wvalid => axi_interconnect_DMA_INT_to_s00_couplers_WVALID
    );
s01_couplers: entity work.s01_couplers_imp_1HFVYUI
     port map (
      M_ACLK => axi_interconnect_DMA_INT_ACLK_net,
      M_ARESETN(0) => axi_interconnect_DMA_INT_ARESETN_net(0),
      M_AXI_awaddr(31 downto 0) => s01_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => s01_couplers_to_xbar_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => s01_couplers_to_xbar_AWCACHE(3 downto 0),
      M_AXI_awlen(7 downto 0) => s01_couplers_to_xbar_AWLEN(7 downto 0),
      M_AXI_awlock(0) => s01_couplers_to_xbar_AWLOCK(0),
      M_AXI_awprot(2 downto 0) => s01_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awqos(3 downto 0) => s01_couplers_to_xbar_AWQOS(3 downto 0),
      M_AXI_awready => s01_couplers_to_xbar_AWREADY(1),
      M_AXI_awsize(2 downto 0) => s01_couplers_to_xbar_AWSIZE(2 downto 0),
      M_AXI_awvalid => s01_couplers_to_xbar_AWVALID,
      M_AXI_bready => s01_couplers_to_xbar_BREADY,
      M_AXI_bresp(1 downto 0) => s01_couplers_to_xbar_BRESP(3 downto 2),
      M_AXI_bvalid => s01_couplers_to_xbar_BVALID(1),
      M_AXI_wdata(63 downto 0) => s01_couplers_to_xbar_WDATA(63 downto 0),
      M_AXI_wlast => s01_couplers_to_xbar_WLAST,
      M_AXI_wready => s01_couplers_to_xbar_WREADY(1),
      M_AXI_wstrb(7 downto 0) => s01_couplers_to_xbar_WSTRB(7 downto 0),
      M_AXI_wvalid => s01_couplers_to_xbar_WVALID,
      S_ACLK => S01_ACLK_1,
      S_ARESETN(0) => S01_ARESETN_1(0),
      S_AXI_awaddr(31 downto 0) => axi_interconnect_DMA_INT_to_s01_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => axi_interconnect_DMA_INT_to_s01_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => axi_interconnect_DMA_INT_to_s01_couplers_AWCACHE(3 downto 0),
      S_AXI_awlen(7 downto 0) => axi_interconnect_DMA_INT_to_s01_couplers_AWLEN(7 downto 0),
      S_AXI_awprot(2 downto 0) => axi_interconnect_DMA_INT_to_s01_couplers_AWPROT(2 downto 0),
      S_AXI_awready => axi_interconnect_DMA_INT_to_s01_couplers_AWREADY,
      S_AXI_awsize(2 downto 0) => axi_interconnect_DMA_INT_to_s01_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => axi_interconnect_DMA_INT_to_s01_couplers_AWVALID,
      S_AXI_bready => axi_interconnect_DMA_INT_to_s01_couplers_BREADY,
      S_AXI_bresp(1 downto 0) => axi_interconnect_DMA_INT_to_s01_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => axi_interconnect_DMA_INT_to_s01_couplers_BVALID,
      S_AXI_wdata(31 downto 0) => axi_interconnect_DMA_INT_to_s01_couplers_WDATA(31 downto 0),
      S_AXI_wlast => axi_interconnect_DMA_INT_to_s01_couplers_WLAST,
      S_AXI_wready => axi_interconnect_DMA_INT_to_s01_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => axi_interconnect_DMA_INT_to_s01_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => axi_interconnect_DMA_INT_to_s01_couplers_WVALID
    );
xbar: component design_1_xbar_2
     port map (
      aclk => axi_interconnect_DMA_INT_ACLK_net,
      aresetn => axi_interconnect_DMA_INT_ARESETN_net(0),
      m_axi_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => xbar_to_m00_couplers_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => xbar_to_m00_couplers_ARCACHE(3 downto 0),
      m_axi_arid(0) => xbar_to_m00_couplers_ARID(0),
      m_axi_arlen(7 downto 0) => xbar_to_m00_couplers_ARLEN(7 downto 0),
      m_axi_arlock(0) => xbar_to_m00_couplers_ARLOCK(0),
      m_axi_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => xbar_to_m00_couplers_ARQOS(3 downto 0),
      m_axi_arready(0) => xbar_to_m00_couplers_ARREADY,
      m_axi_arregion(3 downto 0) => xbar_to_m00_couplers_ARREGION(3 downto 0),
      m_axi_arsize(2 downto 0) => xbar_to_m00_couplers_ARSIZE(2 downto 0),
      m_axi_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      m_axi_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => xbar_to_m00_couplers_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => xbar_to_m00_couplers_AWCACHE(3 downto 0),
      m_axi_awid(0) => xbar_to_m00_couplers_AWID(0),
      m_axi_awlen(7 downto 0) => xbar_to_m00_couplers_AWLEN(7 downto 0),
      m_axi_awlock(0) => xbar_to_m00_couplers_AWLOCK(0),
      m_axi_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => xbar_to_m00_couplers_AWQOS(3 downto 0),
      m_axi_awready(0) => xbar_to_m00_couplers_AWREADY,
      m_axi_awregion(3 downto 0) => xbar_to_m00_couplers_AWREGION(3 downto 0),
      m_axi_awsize(2 downto 0) => xbar_to_m00_couplers_AWSIZE(2 downto 0),
      m_axi_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      m_axi_bid(0) => xbar_to_m00_couplers_BID(0),
      m_axi_bready(0) => xbar_to_m00_couplers_BREADY(0),
      m_axi_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid(0) => xbar_to_m00_couplers_BVALID,
      m_axi_rdata(63 downto 0) => xbar_to_m00_couplers_RDATA(63 downto 0),
      m_axi_rid(0) => xbar_to_m00_couplers_RID(0),
      m_axi_rlast(0) => xbar_to_m00_couplers_RLAST,
      m_axi_rready(0) => xbar_to_m00_couplers_RREADY(0),
      m_axi_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid(0) => xbar_to_m00_couplers_RVALID,
      m_axi_wdata(63 downto 0) => xbar_to_m00_couplers_WDATA(63 downto 0),
      m_axi_wlast(0) => xbar_to_m00_couplers_WLAST(0),
      m_axi_wready(0) => xbar_to_m00_couplers_WREADY,
      m_axi_wstrb(7 downto 0) => xbar_to_m00_couplers_WSTRB(7 downto 0),
      m_axi_wvalid(0) => xbar_to_m00_couplers_WVALID(0),
      s_axi_araddr(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      s_axi_arburst(3 downto 0) => B"0000",
      s_axi_arcache(7 downto 0) => B"00000000",
      s_axi_arid(1 downto 0) => B"00",
      s_axi_arlen(15 downto 0) => B"0000000000000000",
      s_axi_arlock(1 downto 0) => B"00",
      s_axi_arprot(5 downto 0) => B"000000",
      s_axi_arqos(7 downto 0) => B"00000000",
      s_axi_arready(1 downto 0) => NLW_xbar_s_axi_arready_UNCONNECTED(1 downto 0),
      s_axi_arsize(5 downto 0) => B"000000",
      s_axi_arvalid(1 downto 0) => B"00",
      s_axi_awaddr(63 downto 32) => s01_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awburst(3 downto 2) => s01_couplers_to_xbar_AWBURST(1 downto 0),
      s_axi_awburst(1 downto 0) => s00_couplers_to_xbar_AWBURST(1 downto 0),
      s_axi_awcache(7 downto 4) => s01_couplers_to_xbar_AWCACHE(3 downto 0),
      s_axi_awcache(3 downto 0) => s00_couplers_to_xbar_AWCACHE(3 downto 0),
      s_axi_awid(1 downto 0) => B"00",
      s_axi_awlen(15 downto 8) => s01_couplers_to_xbar_AWLEN(7 downto 0),
      s_axi_awlen(7 downto 0) => s00_couplers_to_xbar_AWLEN(7 downto 0),
      s_axi_awlock(1) => s01_couplers_to_xbar_AWLOCK(0),
      s_axi_awlock(0) => '0',
      s_axi_awprot(5 downto 3) => s01_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awqos(7 downto 4) => s01_couplers_to_xbar_AWQOS(3 downto 0),
      s_axi_awqos(3 downto 0) => B"0000",
      s_axi_awready(1) => s01_couplers_to_xbar_AWREADY(1),
      s_axi_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      s_axi_awsize(5 downto 3) => s01_couplers_to_xbar_AWSIZE(2 downto 0),
      s_axi_awsize(2 downto 0) => s00_couplers_to_xbar_AWSIZE(2 downto 0),
      s_axi_awvalid(1) => s01_couplers_to_xbar_AWVALID,
      s_axi_awvalid(0) => s00_couplers_to_xbar_AWVALID,
      s_axi_bid(1 downto 0) => NLW_xbar_s_axi_bid_UNCONNECTED(1 downto 0),
      s_axi_bready(1) => s01_couplers_to_xbar_BREADY,
      s_axi_bready(0) => s00_couplers_to_xbar_BREADY,
      s_axi_bresp(3 downto 2) => s01_couplers_to_xbar_BRESP(3 downto 2),
      s_axi_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      s_axi_bvalid(1) => s01_couplers_to_xbar_BVALID(1),
      s_axi_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      s_axi_rdata(127 downto 0) => NLW_xbar_s_axi_rdata_UNCONNECTED(127 downto 0),
      s_axi_rid(1 downto 0) => NLW_xbar_s_axi_rid_UNCONNECTED(1 downto 0),
      s_axi_rlast(1 downto 0) => NLW_xbar_s_axi_rlast_UNCONNECTED(1 downto 0),
      s_axi_rready(1 downto 0) => B"00",
      s_axi_rresp(3 downto 0) => NLW_xbar_s_axi_rresp_UNCONNECTED(3 downto 0),
      s_axi_rvalid(1 downto 0) => NLW_xbar_s_axi_rvalid_UNCONNECTED(1 downto 0),
      s_axi_wdata(127 downto 64) => s01_couplers_to_xbar_WDATA(63 downto 0),
      s_axi_wdata(63 downto 0) => s00_couplers_to_xbar_WDATA(63 downto 0),
      s_axi_wlast(1) => s01_couplers_to_xbar_WLAST,
      s_axi_wlast(0) => s00_couplers_to_xbar_WLAST,
      s_axi_wready(1) => s01_couplers_to_xbar_WREADY(1),
      s_axi_wready(0) => s00_couplers_to_xbar_WREADY(0),
      s_axi_wstrb(15 downto 8) => s01_couplers_to_xbar_WSTRB(7 downto 0),
      s_axi_wstrb(7 downto 0) => s00_couplers_to_xbar_WSTRB(7 downto 0),
      s_axi_wvalid(1) => s01_couplers_to_xbar_WVALID,
      s_axi_wvalid(0) => s00_couplers_to_xbar_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axi_interconnect_DMA_RAW_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M00_AXI_wlast : out STD_LOGIC;
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC
  );
end design_1_axi_interconnect_DMA_RAW_0;

architecture STRUCTURE of design_1_axi_interconnect_DMA_RAW_0 is
  signal S00_ACLK_1 : STD_LOGIC;
  signal S00_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_DMA_RAW_ACLK_net : STD_LOGIC;
  signal axi_interconnect_DMA_RAW_ARESETN_net : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_DMA_RAW_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_DMA_RAW_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_DMA_RAW_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_DMA_RAW_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_DMA_RAW_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_DMA_RAW_to_s00_couplers_AWREADY : STD_LOGIC;
  signal axi_interconnect_DMA_RAW_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_DMA_RAW_to_s00_couplers_AWVALID : STD_LOGIC;
  signal axi_interconnect_DMA_RAW_to_s00_couplers_BREADY : STD_LOGIC;
  signal axi_interconnect_DMA_RAW_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_DMA_RAW_to_s00_couplers_BVALID : STD_LOGIC;
  signal axi_interconnect_DMA_RAW_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_interconnect_DMA_RAW_to_s00_couplers_WLAST : STD_LOGIC;
  signal axi_interconnect_DMA_RAW_to_s00_couplers_WREADY : STD_LOGIC;
  signal axi_interconnect_DMA_RAW_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_DMA_RAW_to_s00_couplers_WVALID : STD_LOGIC;
  signal s00_couplers_to_axi_interconnect_DMA_RAW_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_axi_interconnect_DMA_RAW_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_axi_interconnect_DMA_RAW_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_axi_interconnect_DMA_RAW_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_axi_interconnect_DMA_RAW_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_axi_interconnect_DMA_RAW_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_axi_interconnect_DMA_RAW_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_axi_interconnect_DMA_RAW_AWREADY : STD_LOGIC;
  signal s00_couplers_to_axi_interconnect_DMA_RAW_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_axi_interconnect_DMA_RAW_AWVALID : STD_LOGIC;
  signal s00_couplers_to_axi_interconnect_DMA_RAW_BREADY : STD_LOGIC;
  signal s00_couplers_to_axi_interconnect_DMA_RAW_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_axi_interconnect_DMA_RAW_BVALID : STD_LOGIC;
  signal s00_couplers_to_axi_interconnect_DMA_RAW_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s00_couplers_to_axi_interconnect_DMA_RAW_WLAST : STD_LOGIC;
  signal s00_couplers_to_axi_interconnect_DMA_RAW_WREADY : STD_LOGIC;
  signal s00_couplers_to_axi_interconnect_DMA_RAW_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_axi_interconnect_DMA_RAW_WVALID : STD_LOGIC;
begin
  M00_AXI_awaddr(31 downto 0) <= s00_couplers_to_axi_interconnect_DMA_RAW_AWADDR(31 downto 0);
  M00_AXI_awburst(1 downto 0) <= s00_couplers_to_axi_interconnect_DMA_RAW_AWBURST(1 downto 0);
  M00_AXI_awcache(3 downto 0) <= s00_couplers_to_axi_interconnect_DMA_RAW_AWCACHE(3 downto 0);
  M00_AXI_awlen(3 downto 0) <= s00_couplers_to_axi_interconnect_DMA_RAW_AWLEN(3 downto 0);
  M00_AXI_awlock(1 downto 0) <= s00_couplers_to_axi_interconnect_DMA_RAW_AWLOCK(1 downto 0);
  M00_AXI_awprot(2 downto 0) <= s00_couplers_to_axi_interconnect_DMA_RAW_AWPROT(2 downto 0);
  M00_AXI_awqos(3 downto 0) <= s00_couplers_to_axi_interconnect_DMA_RAW_AWQOS(3 downto 0);
  M00_AXI_awsize(2 downto 0) <= s00_couplers_to_axi_interconnect_DMA_RAW_AWSIZE(2 downto 0);
  M00_AXI_awvalid <= s00_couplers_to_axi_interconnect_DMA_RAW_AWVALID;
  M00_AXI_bready <= s00_couplers_to_axi_interconnect_DMA_RAW_BREADY;
  M00_AXI_wdata(63 downto 0) <= s00_couplers_to_axi_interconnect_DMA_RAW_WDATA(63 downto 0);
  M00_AXI_wlast <= s00_couplers_to_axi_interconnect_DMA_RAW_WLAST;
  M00_AXI_wstrb(7 downto 0) <= s00_couplers_to_axi_interconnect_DMA_RAW_WSTRB(7 downto 0);
  M00_AXI_wvalid <= s00_couplers_to_axi_interconnect_DMA_RAW_WVALID;
  S00_ACLK_1 <= S00_ACLK;
  S00_ARESETN_1(0) <= S00_ARESETN(0);
  S00_AXI_awready <= axi_interconnect_DMA_RAW_to_s00_couplers_AWREADY;
  S00_AXI_bresp(1 downto 0) <= axi_interconnect_DMA_RAW_to_s00_couplers_BRESP(1 downto 0);
  S00_AXI_bvalid <= axi_interconnect_DMA_RAW_to_s00_couplers_BVALID;
  S00_AXI_wready <= axi_interconnect_DMA_RAW_to_s00_couplers_WREADY;
  axi_interconnect_DMA_RAW_ACLK_net <= M00_ACLK;
  axi_interconnect_DMA_RAW_ARESETN_net(0) <= M00_ARESETN(0);
  axi_interconnect_DMA_RAW_to_s00_couplers_AWADDR(31 downto 0) <= S00_AXI_awaddr(31 downto 0);
  axi_interconnect_DMA_RAW_to_s00_couplers_AWBURST(1 downto 0) <= S00_AXI_awburst(1 downto 0);
  axi_interconnect_DMA_RAW_to_s00_couplers_AWCACHE(3 downto 0) <= S00_AXI_awcache(3 downto 0);
  axi_interconnect_DMA_RAW_to_s00_couplers_AWLEN(7 downto 0) <= S00_AXI_awlen(7 downto 0);
  axi_interconnect_DMA_RAW_to_s00_couplers_AWPROT(2 downto 0) <= S00_AXI_awprot(2 downto 0);
  axi_interconnect_DMA_RAW_to_s00_couplers_AWSIZE(2 downto 0) <= S00_AXI_awsize(2 downto 0);
  axi_interconnect_DMA_RAW_to_s00_couplers_AWVALID <= S00_AXI_awvalid;
  axi_interconnect_DMA_RAW_to_s00_couplers_BREADY <= S00_AXI_bready;
  axi_interconnect_DMA_RAW_to_s00_couplers_WDATA(63 downto 0) <= S00_AXI_wdata(63 downto 0);
  axi_interconnect_DMA_RAW_to_s00_couplers_WLAST <= S00_AXI_wlast;
  axi_interconnect_DMA_RAW_to_s00_couplers_WSTRB(7 downto 0) <= S00_AXI_wstrb(7 downto 0);
  axi_interconnect_DMA_RAW_to_s00_couplers_WVALID <= S00_AXI_wvalid;
  s00_couplers_to_axi_interconnect_DMA_RAW_AWREADY <= M00_AXI_awready;
  s00_couplers_to_axi_interconnect_DMA_RAW_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  s00_couplers_to_axi_interconnect_DMA_RAW_BVALID <= M00_AXI_bvalid;
  s00_couplers_to_axi_interconnect_DMA_RAW_WREADY <= M00_AXI_wready;
s00_couplers: entity work.s00_couplers_imp_15K5X9K
     port map (
      M_ACLK => axi_interconnect_DMA_RAW_ACLK_net,
      M_ARESETN(0) => axi_interconnect_DMA_RAW_ARESETN_net(0),
      M_AXI_awaddr(31 downto 0) => s00_couplers_to_axi_interconnect_DMA_RAW_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => s00_couplers_to_axi_interconnect_DMA_RAW_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => s00_couplers_to_axi_interconnect_DMA_RAW_AWCACHE(3 downto 0),
      M_AXI_awlen(3 downto 0) => s00_couplers_to_axi_interconnect_DMA_RAW_AWLEN(3 downto 0),
      M_AXI_awlock(1 downto 0) => s00_couplers_to_axi_interconnect_DMA_RAW_AWLOCK(1 downto 0),
      M_AXI_awprot(2 downto 0) => s00_couplers_to_axi_interconnect_DMA_RAW_AWPROT(2 downto 0),
      M_AXI_awqos(3 downto 0) => s00_couplers_to_axi_interconnect_DMA_RAW_AWQOS(3 downto 0),
      M_AXI_awready => s00_couplers_to_axi_interconnect_DMA_RAW_AWREADY,
      M_AXI_awsize(2 downto 0) => s00_couplers_to_axi_interconnect_DMA_RAW_AWSIZE(2 downto 0),
      M_AXI_awvalid => s00_couplers_to_axi_interconnect_DMA_RAW_AWVALID,
      M_AXI_bready => s00_couplers_to_axi_interconnect_DMA_RAW_BREADY,
      M_AXI_bresp(1 downto 0) => s00_couplers_to_axi_interconnect_DMA_RAW_BRESP(1 downto 0),
      M_AXI_bvalid => s00_couplers_to_axi_interconnect_DMA_RAW_BVALID,
      M_AXI_wdata(63 downto 0) => s00_couplers_to_axi_interconnect_DMA_RAW_WDATA(63 downto 0),
      M_AXI_wlast => s00_couplers_to_axi_interconnect_DMA_RAW_WLAST,
      M_AXI_wready => s00_couplers_to_axi_interconnect_DMA_RAW_WREADY,
      M_AXI_wstrb(7 downto 0) => s00_couplers_to_axi_interconnect_DMA_RAW_WSTRB(7 downto 0),
      M_AXI_wvalid => s00_couplers_to_axi_interconnect_DMA_RAW_WVALID,
      S_ACLK => S00_ACLK_1,
      S_ARESETN(0) => S00_ARESETN_1(0),
      S_AXI_awaddr(31 downto 0) => axi_interconnect_DMA_RAW_to_s00_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => axi_interconnect_DMA_RAW_to_s00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => axi_interconnect_DMA_RAW_to_s00_couplers_AWCACHE(3 downto 0),
      S_AXI_awlen(7 downto 0) => axi_interconnect_DMA_RAW_to_s00_couplers_AWLEN(7 downto 0),
      S_AXI_awprot(2 downto 0) => axi_interconnect_DMA_RAW_to_s00_couplers_AWPROT(2 downto 0),
      S_AXI_awready => axi_interconnect_DMA_RAW_to_s00_couplers_AWREADY,
      S_AXI_awsize(2 downto 0) => axi_interconnect_DMA_RAW_to_s00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => axi_interconnect_DMA_RAW_to_s00_couplers_AWVALID,
      S_AXI_bready => axi_interconnect_DMA_RAW_to_s00_couplers_BREADY,
      S_AXI_bresp(1 downto 0) => axi_interconnect_DMA_RAW_to_s00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => axi_interconnect_DMA_RAW_to_s00_couplers_BVALID,
      S_AXI_wdata(63 downto 0) => axi_interconnect_DMA_RAW_to_s00_couplers_WDATA(63 downto 0),
      S_AXI_wlast => axi_interconnect_DMA_RAW_to_s00_couplers_WLAST,
      S_AXI_wready => axi_interconnect_DMA_RAW_to_s00_couplers_WREADY,
      S_AXI_wstrb(7 downto 0) => axi_interconnect_DMA_RAW_to_s00_couplers_WSTRB(7 downto 0),
      S_AXI_wvalid => axi_interconnect_DMA_RAW_to_s00_couplers_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_inst_interconnect_100MHz_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M01_ACLK : in STD_LOGIC;
    M01_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_arready : in STD_LOGIC;
    M01_AXI_arvalid : out STD_LOGIC;
    M01_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_awready : in STD_LOGIC;
    M01_AXI_awvalid : out STD_LOGIC;
    M01_AXI_bready : out STD_LOGIC;
    M01_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_bvalid : in STD_LOGIC;
    M01_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_rready : out STD_LOGIC;
    M01_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_rvalid : in STD_LOGIC;
    M01_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_wready : in STD_LOGIC;
    M01_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_wvalid : out STD_LOGIC;
    M02_ACLK : in STD_LOGIC;
    M02_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M02_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M03_ACLK : in STD_LOGIC;
    M03_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M03_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M04_ACLK : in STD_LOGIC;
    M04_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_arready : in STD_LOGIC;
    M04_AXI_arvalid : out STD_LOGIC;
    M04_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_awready : in STD_LOGIC;
    M04_AXI_awvalid : out STD_LOGIC;
    M04_AXI_bready : out STD_LOGIC;
    M04_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_bvalid : in STD_LOGIC;
    M04_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_rready : out STD_LOGIC;
    M04_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_rvalid : in STD_LOGIC;
    M04_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_wready : in STD_LOGIC;
    M04_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M04_AXI_wvalid : out STD_LOGIC;
    M05_ACLK : in STD_LOGIC;
    M05_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M05_AXI_arready : in STD_LOGIC;
    M05_AXI_arvalid : out STD_LOGIC;
    M05_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M05_AXI_awready : in STD_LOGIC;
    M05_AXI_awvalid : out STD_LOGIC;
    M05_AXI_bready : out STD_LOGIC;
    M05_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_bvalid : in STD_LOGIC;
    M05_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_rready : out STD_LOGIC;
    M05_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_rvalid : in STD_LOGIC;
    M05_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_wready : in STD_LOGIC;
    M05_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_wvalid : out STD_LOGIC;
    M06_ACLK : in STD_LOGIC;
    M06_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_arready : in STD_LOGIC;
    M06_AXI_arvalid : out STD_LOGIC;
    M06_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_awready : in STD_LOGIC;
    M06_AXI_awvalid : out STD_LOGIC;
    M06_AXI_bready : out STD_LOGIC;
    M06_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_bvalid : in STD_LOGIC;
    M06_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_rready : out STD_LOGIC;
    M06_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_rvalid : in STD_LOGIC;
    M06_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_wready : in STD_LOGIC;
    M06_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M06_AXI_wvalid : out STD_LOGIC;
    M07_ACLK : in STD_LOGIC;
    M07_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M07_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M07_AXI_arready : in STD_LOGIC;
    M07_AXI_arvalid : out STD_LOGIC;
    M07_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M07_AXI_awready : in STD_LOGIC;
    M07_AXI_awvalid : out STD_LOGIC;
    M07_AXI_bready : out STD_LOGIC;
    M07_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_bvalid : in STD_LOGIC;
    M07_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_rready : out STD_LOGIC;
    M07_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_rvalid : in STD_LOGIC;
    M07_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_wready : in STD_LOGIC;
    M07_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M07_AXI_wvalid : out STD_LOGIC;
    M08_ACLK : in STD_LOGIC;
    M08_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M08_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M08_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M08_AXI_arready : in STD_LOGIC;
    M08_AXI_arvalid : out STD_LOGIC;
    M08_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M08_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M08_AXI_awready : in STD_LOGIC;
    M08_AXI_awvalid : out STD_LOGIC;
    M08_AXI_bready : out STD_LOGIC;
    M08_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M08_AXI_bvalid : in STD_LOGIC;
    M08_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M08_AXI_rready : out STD_LOGIC;
    M08_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M08_AXI_rvalid : in STD_LOGIC;
    M08_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M08_AXI_wready : in STD_LOGIC;
    M08_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M08_AXI_wvalid : out STD_LOGIC;
    M09_ACLK : in STD_LOGIC;
    M09_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M09_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M09_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M09_AXI_arready : in STD_LOGIC;
    M09_AXI_arvalid : out STD_LOGIC;
    M09_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M09_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M09_AXI_awready : in STD_LOGIC;
    M09_AXI_awvalid : out STD_LOGIC;
    M09_AXI_bready : out STD_LOGIC;
    M09_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M09_AXI_bvalid : in STD_LOGIC;
    M09_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M09_AXI_rready : out STD_LOGIC;
    M09_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M09_AXI_rvalid : in STD_LOGIC;
    M09_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M09_AXI_wready : in STD_LOGIC;
    M09_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M09_AXI_wvalid : out STD_LOGIC;
    M10_ACLK : in STD_LOGIC;
    M10_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M10_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M10_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M10_AXI_arready : in STD_LOGIC;
    M10_AXI_arvalid : out STD_LOGIC;
    M10_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M10_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M10_AXI_awready : in STD_LOGIC;
    M10_AXI_awvalid : out STD_LOGIC;
    M10_AXI_bready : out STD_LOGIC;
    M10_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M10_AXI_bvalid : in STD_LOGIC;
    M10_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M10_AXI_rready : out STD_LOGIC;
    M10_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M10_AXI_rvalid : in STD_LOGIC;
    M10_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M10_AXI_wready : in STD_LOGIC;
    M10_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M10_AXI_wvalid : out STD_LOGIC;
    M11_ACLK : in STD_LOGIC;
    M11_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M11_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M11_AXI_arready : in STD_LOGIC;
    M11_AXI_arvalid : out STD_LOGIC;
    M11_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M11_AXI_awready : in STD_LOGIC;
    M11_AXI_awvalid : out STD_LOGIC;
    M11_AXI_bready : out STD_LOGIC;
    M11_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M11_AXI_bvalid : in STD_LOGIC;
    M11_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M11_AXI_rready : out STD_LOGIC;
    M11_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M11_AXI_rvalid : in STD_LOGIC;
    M11_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M11_AXI_wready : in STD_LOGIC;
    M11_AXI_wvalid : out STD_LOGIC;
    M12_ACLK : in STD_LOGIC;
    M12_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M12_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M12_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M12_AXI_arready : in STD_LOGIC;
    M12_AXI_arvalid : out STD_LOGIC;
    M12_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M12_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M12_AXI_awready : in STD_LOGIC;
    M12_AXI_awvalid : out STD_LOGIC;
    M12_AXI_bready : out STD_LOGIC;
    M12_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M12_AXI_bvalid : in STD_LOGIC;
    M12_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M12_AXI_rready : out STD_LOGIC;
    M12_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M12_AXI_rvalid : in STD_LOGIC;
    M12_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M12_AXI_wready : in STD_LOGIC;
    M12_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M12_AXI_wvalid : out STD_LOGIC;
    M13_ACLK : in STD_LOGIC;
    M13_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M13_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M13_AXI_arready : in STD_LOGIC;
    M13_AXI_arvalid : out STD_LOGIC;
    M13_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M13_AXI_awready : in STD_LOGIC;
    M13_AXI_awvalid : out STD_LOGIC;
    M13_AXI_bready : out STD_LOGIC;
    M13_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M13_AXI_bvalid : in STD_LOGIC;
    M13_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M13_AXI_rready : out STD_LOGIC;
    M13_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M13_AXI_rvalid : in STD_LOGIC;
    M13_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M13_AXI_wready : in STD_LOGIC;
    M13_AXI_wvalid : out STD_LOGIC;
    M14_ACLK : in STD_LOGIC;
    M14_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M14_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M14_AXI_arready : in STD_LOGIC;
    M14_AXI_arvalid : out STD_LOGIC;
    M14_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M14_AXI_awready : in STD_LOGIC;
    M14_AXI_awvalid : out STD_LOGIC;
    M14_AXI_bready : out STD_LOGIC;
    M14_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M14_AXI_bvalid : in STD_LOGIC;
    M14_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M14_AXI_rready : out STD_LOGIC;
    M14_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M14_AXI_rvalid : in STD_LOGIC;
    M14_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M14_AXI_wready : in STD_LOGIC;
    M14_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M14_AXI_wvalid : out STD_LOGIC;
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC
  );
end design_1_inst_interconnect_100MHz_0;

architecture STRUCTURE of design_1_inst_interconnect_100MHz_0 is
  component design_1_xbar_3 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 479 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 44 downto 0 );
    m_axi_awvalid : out STD_LOGIC_VECTOR ( 14 downto 0 );
    m_axi_awready : in STD_LOGIC_VECTOR ( 14 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 479 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 59 downto 0 );
    m_axi_wvalid : out STD_LOGIC_VECTOR ( 14 downto 0 );
    m_axi_wready : in STD_LOGIC_VECTOR ( 14 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 29 downto 0 );
    m_axi_bvalid : in STD_LOGIC_VECTOR ( 14 downto 0 );
    m_axi_bready : out STD_LOGIC_VECTOR ( 14 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 479 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 44 downto 0 );
    m_axi_arvalid : out STD_LOGIC_VECTOR ( 14 downto 0 );
    m_axi_arready : in STD_LOGIC_VECTOR ( 14 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 479 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 29 downto 0 );
    m_axi_rvalid : in STD_LOGIC_VECTOR ( 14 downto 0 );
    m_axi_rready : out STD_LOGIC_VECTOR ( 14 downto 0 )
  );
  end component design_1_xbar_3;
  signal M00_ACLK_1 : STD_LOGIC;
  signal M00_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M01_ACLK_1 : STD_LOGIC;
  signal M01_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M02_ACLK_1 : STD_LOGIC;
  signal M02_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M03_ACLK_1 : STD_LOGIC;
  signal M03_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M04_ACLK_1 : STD_LOGIC;
  signal M04_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M05_ACLK_1 : STD_LOGIC;
  signal M05_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M06_ACLK_1 : STD_LOGIC;
  signal M06_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M07_ACLK_1 : STD_LOGIC;
  signal M07_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M08_ACLK_1 : STD_LOGIC;
  signal M08_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M09_ACLK_1 : STD_LOGIC;
  signal M09_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M10_ACLK_1 : STD_LOGIC;
  signal M10_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M11_ACLK_1 : STD_LOGIC;
  signal M11_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M12_ACLK_1 : STD_LOGIC;
  signal M12_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M13_ACLK_1 : STD_LOGIC;
  signal M13_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M14_ACLK_1 : STD_LOGIC;
  signal M14_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_ACLK_1 : STD_LOGIC;
  signal S00_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal inst_interconnect_100MHz_ACLK_net : STD_LOGIC;
  signal inst_interconnect_100MHz_ARESETN_net : STD_LOGIC_VECTOR ( 0 to 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_ARREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_ARVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_AWREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_AWVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_to_s00_couplers_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_BREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_BVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_RLAST : STD_LOGIC;
  signal inst_interconnect_100MHz_to_s00_couplers_RREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_RVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_WLAST : STD_LOGIC;
  signal inst_interconnect_100MHz_to_s00_couplers_WREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_100MHz_to_s00_couplers_WVALID : STD_LOGIC;
  signal m00_couplers_to_inst_interconnect_100MHz_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_inst_interconnect_100MHz_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_inst_interconnect_100MHz_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_inst_interconnect_100MHz_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_inst_interconnect_100MHz_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_inst_interconnect_100MHz_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_inst_interconnect_100MHz_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_inst_interconnect_100MHz_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_inst_interconnect_100MHz_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_inst_interconnect_100MHz_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_inst_interconnect_100MHz_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_inst_interconnect_100MHz_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_inst_interconnect_100MHz_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_inst_interconnect_100MHz_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_inst_interconnect_100MHz_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_inst_interconnect_100MHz_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_inst_interconnect_100MHz_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m00_couplers_to_inst_interconnect_100MHz_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_inst_interconnect_100MHz_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_inst_interconnect_100MHz_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_inst_interconnect_100MHz_ARREADY : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_100MHz_ARVALID : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_100MHz_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_inst_interconnect_100MHz_AWREADY : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_100MHz_AWVALID : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_100MHz_BREADY : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_100MHz_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_inst_interconnect_100MHz_BVALID : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_100MHz_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_inst_interconnect_100MHz_RREADY : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_100MHz_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_inst_interconnect_100MHz_RVALID : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_100MHz_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_inst_interconnect_100MHz_WREADY : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_100MHz_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_inst_interconnect_100MHz_WVALID : STD_LOGIC;
  signal m02_couplers_to_inst_interconnect_100MHz_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_inst_interconnect_100MHz_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_inst_interconnect_100MHz_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_inst_interconnect_100MHz_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_inst_interconnect_100MHz_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_inst_interconnect_100MHz_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_inst_interconnect_100MHz_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_inst_interconnect_100MHz_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_inst_interconnect_100MHz_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_inst_interconnect_100MHz_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_inst_interconnect_100MHz_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_inst_interconnect_100MHz_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_inst_interconnect_100MHz_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_inst_interconnect_100MHz_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_inst_interconnect_100MHz_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_inst_interconnect_100MHz_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_inst_interconnect_100MHz_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_inst_interconnect_100MHz_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_inst_interconnect_100MHz_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_inst_interconnect_100MHz_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_inst_interconnect_100MHz_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_inst_interconnect_100MHz_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_inst_interconnect_100MHz_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_inst_interconnect_100MHz_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_inst_interconnect_100MHz_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_inst_interconnect_100MHz_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_inst_interconnect_100MHz_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_inst_interconnect_100MHz_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_inst_interconnect_100MHz_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_inst_interconnect_100MHz_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_inst_interconnect_100MHz_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_inst_interconnect_100MHz_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m03_couplers_to_inst_interconnect_100MHz_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_inst_interconnect_100MHz_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m04_couplers_to_inst_interconnect_100MHz_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_inst_interconnect_100MHz_ARREADY : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_100MHz_ARVALID : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_100MHz_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_inst_interconnect_100MHz_AWREADY : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_100MHz_AWVALID : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_100MHz_BREADY : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_100MHz_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_inst_interconnect_100MHz_BVALID : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_100MHz_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_inst_interconnect_100MHz_RREADY : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_100MHz_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_inst_interconnect_100MHz_RVALID : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_100MHz_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_inst_interconnect_100MHz_WREADY : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_100MHz_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_inst_interconnect_100MHz_WVALID : STD_LOGIC;
  signal m05_couplers_to_inst_interconnect_100MHz_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_inst_interconnect_100MHz_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_inst_interconnect_100MHz_ARREADY : STD_LOGIC;
  signal m05_couplers_to_inst_interconnect_100MHz_ARVALID : STD_LOGIC;
  signal m05_couplers_to_inst_interconnect_100MHz_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_inst_interconnect_100MHz_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m05_couplers_to_inst_interconnect_100MHz_AWREADY : STD_LOGIC;
  signal m05_couplers_to_inst_interconnect_100MHz_AWVALID : STD_LOGIC;
  signal m05_couplers_to_inst_interconnect_100MHz_BREADY : STD_LOGIC;
  signal m05_couplers_to_inst_interconnect_100MHz_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_inst_interconnect_100MHz_BVALID : STD_LOGIC;
  signal m05_couplers_to_inst_interconnect_100MHz_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_inst_interconnect_100MHz_RREADY : STD_LOGIC;
  signal m05_couplers_to_inst_interconnect_100MHz_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_inst_interconnect_100MHz_RVALID : STD_LOGIC;
  signal m05_couplers_to_inst_interconnect_100MHz_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_inst_interconnect_100MHz_WREADY : STD_LOGIC;
  signal m05_couplers_to_inst_interconnect_100MHz_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_inst_interconnect_100MHz_WVALID : STD_LOGIC;
  signal m06_couplers_to_inst_interconnect_100MHz_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_inst_interconnect_100MHz_ARREADY : STD_LOGIC;
  signal m06_couplers_to_inst_interconnect_100MHz_ARVALID : STD_LOGIC;
  signal m06_couplers_to_inst_interconnect_100MHz_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_inst_interconnect_100MHz_AWREADY : STD_LOGIC;
  signal m06_couplers_to_inst_interconnect_100MHz_AWVALID : STD_LOGIC;
  signal m06_couplers_to_inst_interconnect_100MHz_BREADY : STD_LOGIC;
  signal m06_couplers_to_inst_interconnect_100MHz_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_inst_interconnect_100MHz_BVALID : STD_LOGIC;
  signal m06_couplers_to_inst_interconnect_100MHz_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_inst_interconnect_100MHz_RREADY : STD_LOGIC;
  signal m06_couplers_to_inst_interconnect_100MHz_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_inst_interconnect_100MHz_RVALID : STD_LOGIC;
  signal m06_couplers_to_inst_interconnect_100MHz_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_inst_interconnect_100MHz_WREADY : STD_LOGIC;
  signal m06_couplers_to_inst_interconnect_100MHz_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m06_couplers_to_inst_interconnect_100MHz_WVALID : STD_LOGIC;
  signal m07_couplers_to_inst_interconnect_100MHz_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_inst_interconnect_100MHz_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m07_couplers_to_inst_interconnect_100MHz_ARREADY : STD_LOGIC;
  signal m07_couplers_to_inst_interconnect_100MHz_ARVALID : STD_LOGIC;
  signal m07_couplers_to_inst_interconnect_100MHz_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_inst_interconnect_100MHz_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m07_couplers_to_inst_interconnect_100MHz_AWREADY : STD_LOGIC;
  signal m07_couplers_to_inst_interconnect_100MHz_AWVALID : STD_LOGIC;
  signal m07_couplers_to_inst_interconnect_100MHz_BREADY : STD_LOGIC;
  signal m07_couplers_to_inst_interconnect_100MHz_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_inst_interconnect_100MHz_BVALID : STD_LOGIC;
  signal m07_couplers_to_inst_interconnect_100MHz_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_inst_interconnect_100MHz_RREADY : STD_LOGIC;
  signal m07_couplers_to_inst_interconnect_100MHz_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_inst_interconnect_100MHz_RVALID : STD_LOGIC;
  signal m07_couplers_to_inst_interconnect_100MHz_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_inst_interconnect_100MHz_WREADY : STD_LOGIC;
  signal m07_couplers_to_inst_interconnect_100MHz_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m07_couplers_to_inst_interconnect_100MHz_WVALID : STD_LOGIC;
  signal m08_couplers_to_inst_interconnect_100MHz_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m08_couplers_to_inst_interconnect_100MHz_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m08_couplers_to_inst_interconnect_100MHz_ARREADY : STD_LOGIC;
  signal m08_couplers_to_inst_interconnect_100MHz_ARVALID : STD_LOGIC;
  signal m08_couplers_to_inst_interconnect_100MHz_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m08_couplers_to_inst_interconnect_100MHz_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m08_couplers_to_inst_interconnect_100MHz_AWREADY : STD_LOGIC;
  signal m08_couplers_to_inst_interconnect_100MHz_AWVALID : STD_LOGIC;
  signal m08_couplers_to_inst_interconnect_100MHz_BREADY : STD_LOGIC;
  signal m08_couplers_to_inst_interconnect_100MHz_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m08_couplers_to_inst_interconnect_100MHz_BVALID : STD_LOGIC;
  signal m08_couplers_to_inst_interconnect_100MHz_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m08_couplers_to_inst_interconnect_100MHz_RREADY : STD_LOGIC;
  signal m08_couplers_to_inst_interconnect_100MHz_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m08_couplers_to_inst_interconnect_100MHz_RVALID : STD_LOGIC;
  signal m08_couplers_to_inst_interconnect_100MHz_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m08_couplers_to_inst_interconnect_100MHz_WREADY : STD_LOGIC;
  signal m08_couplers_to_inst_interconnect_100MHz_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m08_couplers_to_inst_interconnect_100MHz_WVALID : STD_LOGIC;
  signal m09_couplers_to_inst_interconnect_100MHz_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m09_couplers_to_inst_interconnect_100MHz_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m09_couplers_to_inst_interconnect_100MHz_ARREADY : STD_LOGIC;
  signal m09_couplers_to_inst_interconnect_100MHz_ARVALID : STD_LOGIC;
  signal m09_couplers_to_inst_interconnect_100MHz_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m09_couplers_to_inst_interconnect_100MHz_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m09_couplers_to_inst_interconnect_100MHz_AWREADY : STD_LOGIC;
  signal m09_couplers_to_inst_interconnect_100MHz_AWVALID : STD_LOGIC;
  signal m09_couplers_to_inst_interconnect_100MHz_BREADY : STD_LOGIC;
  signal m09_couplers_to_inst_interconnect_100MHz_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m09_couplers_to_inst_interconnect_100MHz_BVALID : STD_LOGIC;
  signal m09_couplers_to_inst_interconnect_100MHz_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m09_couplers_to_inst_interconnect_100MHz_RREADY : STD_LOGIC;
  signal m09_couplers_to_inst_interconnect_100MHz_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m09_couplers_to_inst_interconnect_100MHz_RVALID : STD_LOGIC;
  signal m09_couplers_to_inst_interconnect_100MHz_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m09_couplers_to_inst_interconnect_100MHz_WREADY : STD_LOGIC;
  signal m09_couplers_to_inst_interconnect_100MHz_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m09_couplers_to_inst_interconnect_100MHz_WVALID : STD_LOGIC;
  signal m10_couplers_to_inst_interconnect_100MHz_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m10_couplers_to_inst_interconnect_100MHz_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m10_couplers_to_inst_interconnect_100MHz_ARREADY : STD_LOGIC;
  signal m10_couplers_to_inst_interconnect_100MHz_ARVALID : STD_LOGIC;
  signal m10_couplers_to_inst_interconnect_100MHz_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m10_couplers_to_inst_interconnect_100MHz_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m10_couplers_to_inst_interconnect_100MHz_AWREADY : STD_LOGIC;
  signal m10_couplers_to_inst_interconnect_100MHz_AWVALID : STD_LOGIC;
  signal m10_couplers_to_inst_interconnect_100MHz_BREADY : STD_LOGIC;
  signal m10_couplers_to_inst_interconnect_100MHz_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m10_couplers_to_inst_interconnect_100MHz_BVALID : STD_LOGIC;
  signal m10_couplers_to_inst_interconnect_100MHz_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m10_couplers_to_inst_interconnect_100MHz_RREADY : STD_LOGIC;
  signal m10_couplers_to_inst_interconnect_100MHz_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m10_couplers_to_inst_interconnect_100MHz_RVALID : STD_LOGIC;
  signal m10_couplers_to_inst_interconnect_100MHz_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m10_couplers_to_inst_interconnect_100MHz_WREADY : STD_LOGIC;
  signal m10_couplers_to_inst_interconnect_100MHz_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m10_couplers_to_inst_interconnect_100MHz_WVALID : STD_LOGIC;
  signal m11_couplers_to_inst_interconnect_100MHz_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m11_couplers_to_inst_interconnect_100MHz_ARREADY : STD_LOGIC;
  signal m11_couplers_to_inst_interconnect_100MHz_ARVALID : STD_LOGIC;
  signal m11_couplers_to_inst_interconnect_100MHz_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m11_couplers_to_inst_interconnect_100MHz_AWREADY : STD_LOGIC;
  signal m11_couplers_to_inst_interconnect_100MHz_AWVALID : STD_LOGIC;
  signal m11_couplers_to_inst_interconnect_100MHz_BREADY : STD_LOGIC;
  signal m11_couplers_to_inst_interconnect_100MHz_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m11_couplers_to_inst_interconnect_100MHz_BVALID : STD_LOGIC;
  signal m11_couplers_to_inst_interconnect_100MHz_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m11_couplers_to_inst_interconnect_100MHz_RREADY : STD_LOGIC;
  signal m11_couplers_to_inst_interconnect_100MHz_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m11_couplers_to_inst_interconnect_100MHz_RVALID : STD_LOGIC;
  signal m11_couplers_to_inst_interconnect_100MHz_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m11_couplers_to_inst_interconnect_100MHz_WREADY : STD_LOGIC;
  signal m11_couplers_to_inst_interconnect_100MHz_WVALID : STD_LOGIC;
  signal m12_couplers_to_inst_interconnect_100MHz_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m12_couplers_to_inst_interconnect_100MHz_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m12_couplers_to_inst_interconnect_100MHz_ARREADY : STD_LOGIC;
  signal m12_couplers_to_inst_interconnect_100MHz_ARVALID : STD_LOGIC;
  signal m12_couplers_to_inst_interconnect_100MHz_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m12_couplers_to_inst_interconnect_100MHz_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m12_couplers_to_inst_interconnect_100MHz_AWREADY : STD_LOGIC;
  signal m12_couplers_to_inst_interconnect_100MHz_AWVALID : STD_LOGIC;
  signal m12_couplers_to_inst_interconnect_100MHz_BREADY : STD_LOGIC;
  signal m12_couplers_to_inst_interconnect_100MHz_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m12_couplers_to_inst_interconnect_100MHz_BVALID : STD_LOGIC;
  signal m12_couplers_to_inst_interconnect_100MHz_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m12_couplers_to_inst_interconnect_100MHz_RREADY : STD_LOGIC;
  signal m12_couplers_to_inst_interconnect_100MHz_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m12_couplers_to_inst_interconnect_100MHz_RVALID : STD_LOGIC;
  signal m12_couplers_to_inst_interconnect_100MHz_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m12_couplers_to_inst_interconnect_100MHz_WREADY : STD_LOGIC;
  signal m12_couplers_to_inst_interconnect_100MHz_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m12_couplers_to_inst_interconnect_100MHz_WVALID : STD_LOGIC;
  signal m13_couplers_to_inst_interconnect_100MHz_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m13_couplers_to_inst_interconnect_100MHz_ARREADY : STD_LOGIC;
  signal m13_couplers_to_inst_interconnect_100MHz_ARVALID : STD_LOGIC;
  signal m13_couplers_to_inst_interconnect_100MHz_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m13_couplers_to_inst_interconnect_100MHz_AWREADY : STD_LOGIC;
  signal m13_couplers_to_inst_interconnect_100MHz_AWVALID : STD_LOGIC;
  signal m13_couplers_to_inst_interconnect_100MHz_BREADY : STD_LOGIC;
  signal m13_couplers_to_inst_interconnect_100MHz_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m13_couplers_to_inst_interconnect_100MHz_BVALID : STD_LOGIC;
  signal m13_couplers_to_inst_interconnect_100MHz_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m13_couplers_to_inst_interconnect_100MHz_RREADY : STD_LOGIC;
  signal m13_couplers_to_inst_interconnect_100MHz_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m13_couplers_to_inst_interconnect_100MHz_RVALID : STD_LOGIC;
  signal m13_couplers_to_inst_interconnect_100MHz_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m13_couplers_to_inst_interconnect_100MHz_WREADY : STD_LOGIC;
  signal m13_couplers_to_inst_interconnect_100MHz_WVALID : STD_LOGIC;
  signal m14_couplers_to_inst_interconnect_100MHz_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m14_couplers_to_inst_interconnect_100MHz_ARREADY : STD_LOGIC;
  signal m14_couplers_to_inst_interconnect_100MHz_ARVALID : STD_LOGIC;
  signal m14_couplers_to_inst_interconnect_100MHz_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m14_couplers_to_inst_interconnect_100MHz_AWREADY : STD_LOGIC;
  signal m14_couplers_to_inst_interconnect_100MHz_AWVALID : STD_LOGIC;
  signal m14_couplers_to_inst_interconnect_100MHz_BREADY : STD_LOGIC;
  signal m14_couplers_to_inst_interconnect_100MHz_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m14_couplers_to_inst_interconnect_100MHz_BVALID : STD_LOGIC;
  signal m14_couplers_to_inst_interconnect_100MHz_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m14_couplers_to_inst_interconnect_100MHz_RREADY : STD_LOGIC;
  signal m14_couplers_to_inst_interconnect_100MHz_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m14_couplers_to_inst_interconnect_100MHz_RVALID : STD_LOGIC;
  signal m14_couplers_to_inst_interconnect_100MHz_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m14_couplers_to_inst_interconnect_100MHz_WREADY : STD_LOGIC;
  signal m14_couplers_to_inst_interconnect_100MHz_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m14_couplers_to_inst_interconnect_100MHz_WVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_BREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_RREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_WVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_ARVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_AWVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m01_couplers_RREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_WVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m02_couplers_ARADDR : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m02_couplers_ARVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_AWADDR : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m02_couplers_AWVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_BREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m02_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m02_couplers_RREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m02_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m02_couplers_WDATA : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m02_couplers_WSTRB : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_WVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m03_couplers_ARVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m03_couplers_AWVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m03_couplers_RREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m03_couplers_WSTRB : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_WVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m04_couplers_ARADDR : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_ARVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_AWADDR : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_AWVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_BREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m04_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m04_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m04_couplers_RREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m04_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m04_couplers_WDATA : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_WSTRB : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_WVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m05_couplers_ARADDR : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_ARPROT : STD_LOGIC_VECTOR ( 17 downto 15 );
  signal xbar_to_m05_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_ARVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_AWADDR : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_AWPROT : STD_LOGIC_VECTOR ( 17 downto 15 );
  signal xbar_to_m05_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_AWVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_BREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m05_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m05_couplers_RREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m05_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m05_couplers_WDATA : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_WSTRB : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_WVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m06_couplers_ARADDR : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m06_couplers_ARVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_AWADDR : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m06_couplers_AWVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_BREADY : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m06_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m06_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m06_couplers_RREADY : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m06_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m06_couplers_WDATA : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m06_couplers_WSTRB : STD_LOGIC_VECTOR ( 27 downto 24 );
  signal xbar_to_m06_couplers_WVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m07_couplers_ARADDR : STD_LOGIC_VECTOR ( 255 downto 224 );
  signal xbar_to_m07_couplers_ARPROT : STD_LOGIC_VECTOR ( 23 downto 21 );
  signal xbar_to_m07_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m07_couplers_ARVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_AWADDR : STD_LOGIC_VECTOR ( 255 downto 224 );
  signal xbar_to_m07_couplers_AWPROT : STD_LOGIC_VECTOR ( 23 downto 21 );
  signal xbar_to_m07_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m07_couplers_AWVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_BREADY : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m07_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m07_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m07_couplers_RREADY : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m07_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m07_couplers_WDATA : STD_LOGIC_VECTOR ( 255 downto 224 );
  signal xbar_to_m07_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m07_couplers_WSTRB : STD_LOGIC_VECTOR ( 31 downto 28 );
  signal xbar_to_m07_couplers_WVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m08_couplers_ARADDR : STD_LOGIC_VECTOR ( 287 downto 256 );
  signal xbar_to_m08_couplers_ARPROT : STD_LOGIC_VECTOR ( 26 downto 24 );
  signal xbar_to_m08_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m08_couplers_ARVALID : STD_LOGIC_VECTOR ( 8 to 8 );
  signal xbar_to_m08_couplers_AWADDR : STD_LOGIC_VECTOR ( 287 downto 256 );
  signal xbar_to_m08_couplers_AWPROT : STD_LOGIC_VECTOR ( 26 downto 24 );
  signal xbar_to_m08_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m08_couplers_AWVALID : STD_LOGIC_VECTOR ( 8 to 8 );
  signal xbar_to_m08_couplers_BREADY : STD_LOGIC_VECTOR ( 8 to 8 );
  signal xbar_to_m08_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m08_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m08_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m08_couplers_RREADY : STD_LOGIC_VECTOR ( 8 to 8 );
  signal xbar_to_m08_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m08_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m08_couplers_WDATA : STD_LOGIC_VECTOR ( 287 downto 256 );
  signal xbar_to_m08_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m08_couplers_WSTRB : STD_LOGIC_VECTOR ( 35 downto 32 );
  signal xbar_to_m08_couplers_WVALID : STD_LOGIC_VECTOR ( 8 to 8 );
  signal xbar_to_m09_couplers_ARADDR : STD_LOGIC_VECTOR ( 319 downto 288 );
  signal xbar_to_m09_couplers_ARPROT : STD_LOGIC_VECTOR ( 29 downto 27 );
  signal xbar_to_m09_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m09_couplers_ARVALID : STD_LOGIC_VECTOR ( 9 to 9 );
  signal xbar_to_m09_couplers_AWADDR : STD_LOGIC_VECTOR ( 319 downto 288 );
  signal xbar_to_m09_couplers_AWPROT : STD_LOGIC_VECTOR ( 29 downto 27 );
  signal xbar_to_m09_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m09_couplers_AWVALID : STD_LOGIC_VECTOR ( 9 to 9 );
  signal xbar_to_m09_couplers_BREADY : STD_LOGIC_VECTOR ( 9 to 9 );
  signal xbar_to_m09_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m09_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m09_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m09_couplers_RREADY : STD_LOGIC_VECTOR ( 9 to 9 );
  signal xbar_to_m09_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m09_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m09_couplers_WDATA : STD_LOGIC_VECTOR ( 319 downto 288 );
  signal xbar_to_m09_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m09_couplers_WSTRB : STD_LOGIC_VECTOR ( 39 downto 36 );
  signal xbar_to_m09_couplers_WVALID : STD_LOGIC_VECTOR ( 9 to 9 );
  signal xbar_to_m10_couplers_ARADDR : STD_LOGIC_VECTOR ( 351 downto 320 );
  signal xbar_to_m10_couplers_ARPROT : STD_LOGIC_VECTOR ( 32 downto 30 );
  signal xbar_to_m10_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m10_couplers_ARVALID : STD_LOGIC_VECTOR ( 10 to 10 );
  signal xbar_to_m10_couplers_AWADDR : STD_LOGIC_VECTOR ( 351 downto 320 );
  signal xbar_to_m10_couplers_AWPROT : STD_LOGIC_VECTOR ( 32 downto 30 );
  signal xbar_to_m10_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m10_couplers_AWVALID : STD_LOGIC_VECTOR ( 10 to 10 );
  signal xbar_to_m10_couplers_BREADY : STD_LOGIC_VECTOR ( 10 to 10 );
  signal xbar_to_m10_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m10_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m10_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m10_couplers_RREADY : STD_LOGIC_VECTOR ( 10 to 10 );
  signal xbar_to_m10_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m10_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m10_couplers_WDATA : STD_LOGIC_VECTOR ( 351 downto 320 );
  signal xbar_to_m10_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m10_couplers_WSTRB : STD_LOGIC_VECTOR ( 43 downto 40 );
  signal xbar_to_m10_couplers_WVALID : STD_LOGIC_VECTOR ( 10 to 10 );
  signal xbar_to_m11_couplers_ARADDR : STD_LOGIC_VECTOR ( 383 downto 352 );
  signal xbar_to_m11_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m11_couplers_ARVALID : STD_LOGIC_VECTOR ( 11 to 11 );
  signal xbar_to_m11_couplers_AWADDR : STD_LOGIC_VECTOR ( 383 downto 352 );
  signal xbar_to_m11_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m11_couplers_AWVALID : STD_LOGIC_VECTOR ( 11 to 11 );
  signal xbar_to_m11_couplers_BREADY : STD_LOGIC_VECTOR ( 11 to 11 );
  signal xbar_to_m11_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m11_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m11_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m11_couplers_RREADY : STD_LOGIC_VECTOR ( 11 to 11 );
  signal xbar_to_m11_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m11_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m11_couplers_WDATA : STD_LOGIC_VECTOR ( 383 downto 352 );
  signal xbar_to_m11_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m11_couplers_WVALID : STD_LOGIC_VECTOR ( 11 to 11 );
  signal xbar_to_m12_couplers_ARADDR : STD_LOGIC_VECTOR ( 415 downto 384 );
  signal xbar_to_m12_couplers_ARPROT : STD_LOGIC_VECTOR ( 38 downto 36 );
  signal xbar_to_m12_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m12_couplers_ARVALID : STD_LOGIC_VECTOR ( 12 to 12 );
  signal xbar_to_m12_couplers_AWADDR : STD_LOGIC_VECTOR ( 415 downto 384 );
  signal xbar_to_m12_couplers_AWPROT : STD_LOGIC_VECTOR ( 38 downto 36 );
  signal xbar_to_m12_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m12_couplers_AWVALID : STD_LOGIC_VECTOR ( 12 to 12 );
  signal xbar_to_m12_couplers_BREADY : STD_LOGIC_VECTOR ( 12 to 12 );
  signal xbar_to_m12_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m12_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m12_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m12_couplers_RREADY : STD_LOGIC_VECTOR ( 12 to 12 );
  signal xbar_to_m12_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m12_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m12_couplers_WDATA : STD_LOGIC_VECTOR ( 415 downto 384 );
  signal xbar_to_m12_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m12_couplers_WSTRB : STD_LOGIC_VECTOR ( 51 downto 48 );
  signal xbar_to_m12_couplers_WVALID : STD_LOGIC_VECTOR ( 12 to 12 );
  signal xbar_to_m13_couplers_ARADDR : STD_LOGIC_VECTOR ( 447 downto 416 );
  signal xbar_to_m13_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m13_couplers_ARVALID : STD_LOGIC_VECTOR ( 13 to 13 );
  signal xbar_to_m13_couplers_AWADDR : STD_LOGIC_VECTOR ( 447 downto 416 );
  signal xbar_to_m13_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m13_couplers_AWVALID : STD_LOGIC_VECTOR ( 13 to 13 );
  signal xbar_to_m13_couplers_BREADY : STD_LOGIC_VECTOR ( 13 to 13 );
  signal xbar_to_m13_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m13_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m13_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m13_couplers_RREADY : STD_LOGIC_VECTOR ( 13 to 13 );
  signal xbar_to_m13_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m13_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m13_couplers_WDATA : STD_LOGIC_VECTOR ( 447 downto 416 );
  signal xbar_to_m13_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m13_couplers_WVALID : STD_LOGIC_VECTOR ( 13 to 13 );
  signal xbar_to_m14_couplers_ARADDR : STD_LOGIC_VECTOR ( 479 downto 448 );
  signal xbar_to_m14_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m14_couplers_ARVALID : STD_LOGIC_VECTOR ( 14 to 14 );
  signal xbar_to_m14_couplers_AWADDR : STD_LOGIC_VECTOR ( 479 downto 448 );
  signal xbar_to_m14_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m14_couplers_AWVALID : STD_LOGIC_VECTOR ( 14 to 14 );
  signal xbar_to_m14_couplers_BREADY : STD_LOGIC_VECTOR ( 14 to 14 );
  signal xbar_to_m14_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m14_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m14_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m14_couplers_RREADY : STD_LOGIC_VECTOR ( 14 to 14 );
  signal xbar_to_m14_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m14_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m14_couplers_WDATA : STD_LOGIC_VECTOR ( 479 downto 448 );
  signal xbar_to_m14_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m14_couplers_WSTRB : STD_LOGIC_VECTOR ( 59 downto 56 );
  signal xbar_to_m14_couplers_WVALID : STD_LOGIC_VECTOR ( 14 to 14 );
  signal NLW_xbar_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 44 downto 3 );
  signal NLW_xbar_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 44 downto 3 );
  signal NLW_xbar_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 55 downto 44 );
begin
  M00_ACLK_1 <= M00_ACLK;
  M00_ARESETN_1(0) <= M00_ARESETN(0);
  M00_AXI_araddr(31 downto 0) <= m00_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0);
  M00_AXI_arprot(2 downto 0) <= m00_couplers_to_inst_interconnect_100MHz_ARPROT(2 downto 0);
  M00_AXI_arvalid(0) <= m00_couplers_to_inst_interconnect_100MHz_ARVALID(0);
  M00_AXI_awaddr(31 downto 0) <= m00_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0);
  M00_AXI_awprot(2 downto 0) <= m00_couplers_to_inst_interconnect_100MHz_AWPROT(2 downto 0);
  M00_AXI_awvalid(0) <= m00_couplers_to_inst_interconnect_100MHz_AWVALID(0);
  M00_AXI_bready(0) <= m00_couplers_to_inst_interconnect_100MHz_BREADY(0);
  M00_AXI_rready(0) <= m00_couplers_to_inst_interconnect_100MHz_RREADY(0);
  M00_AXI_wdata(31 downto 0) <= m00_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0);
  M00_AXI_wstrb(3 downto 0) <= m00_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0);
  M00_AXI_wvalid(0) <= m00_couplers_to_inst_interconnect_100MHz_WVALID(0);
  M01_ACLK_1 <= M01_ACLK;
  M01_ARESETN_1(0) <= M01_ARESETN(0);
  M01_AXI_araddr(31 downto 0) <= m01_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0);
  M01_AXI_arvalid <= m01_couplers_to_inst_interconnect_100MHz_ARVALID;
  M01_AXI_awaddr(31 downto 0) <= m01_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0);
  M01_AXI_awvalid <= m01_couplers_to_inst_interconnect_100MHz_AWVALID;
  M01_AXI_bready <= m01_couplers_to_inst_interconnect_100MHz_BREADY;
  M01_AXI_rready <= m01_couplers_to_inst_interconnect_100MHz_RREADY;
  M01_AXI_wdata(31 downto 0) <= m01_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0);
  M01_AXI_wstrb(3 downto 0) <= m01_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0);
  M01_AXI_wvalid <= m01_couplers_to_inst_interconnect_100MHz_WVALID;
  M02_ACLK_1 <= M02_ACLK;
  M02_ARESETN_1(0) <= M02_ARESETN(0);
  M02_AXI_araddr(31 downto 0) <= m02_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0);
  M02_AXI_arvalid(0) <= m02_couplers_to_inst_interconnect_100MHz_ARVALID(0);
  M02_AXI_awaddr(31 downto 0) <= m02_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0);
  M02_AXI_awvalid(0) <= m02_couplers_to_inst_interconnect_100MHz_AWVALID(0);
  M02_AXI_bready(0) <= m02_couplers_to_inst_interconnect_100MHz_BREADY(0);
  M02_AXI_rready(0) <= m02_couplers_to_inst_interconnect_100MHz_RREADY(0);
  M02_AXI_wdata(31 downto 0) <= m02_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0);
  M02_AXI_wstrb(3 downto 0) <= m02_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0);
  M02_AXI_wvalid(0) <= m02_couplers_to_inst_interconnect_100MHz_WVALID(0);
  M03_ACLK_1 <= M03_ACLK;
  M03_ARESETN_1(0) <= M03_ARESETN(0);
  M03_AXI_araddr(31 downto 0) <= m03_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0);
  M03_AXI_arvalid(0) <= m03_couplers_to_inst_interconnect_100MHz_ARVALID(0);
  M03_AXI_awaddr(31 downto 0) <= m03_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0);
  M03_AXI_awvalid(0) <= m03_couplers_to_inst_interconnect_100MHz_AWVALID(0);
  M03_AXI_bready(0) <= m03_couplers_to_inst_interconnect_100MHz_BREADY(0);
  M03_AXI_rready(0) <= m03_couplers_to_inst_interconnect_100MHz_RREADY(0);
  M03_AXI_wdata(31 downto 0) <= m03_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0);
  M03_AXI_wstrb(3 downto 0) <= m03_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0);
  M03_AXI_wvalid(0) <= m03_couplers_to_inst_interconnect_100MHz_WVALID(0);
  M04_ACLK_1 <= M04_ACLK;
  M04_ARESETN_1(0) <= M04_ARESETN(0);
  M04_AXI_araddr(31 downto 0) <= m04_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0);
  M04_AXI_arvalid <= m04_couplers_to_inst_interconnect_100MHz_ARVALID;
  M04_AXI_awaddr(31 downto 0) <= m04_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0);
  M04_AXI_awvalid <= m04_couplers_to_inst_interconnect_100MHz_AWVALID;
  M04_AXI_bready <= m04_couplers_to_inst_interconnect_100MHz_BREADY;
  M04_AXI_rready <= m04_couplers_to_inst_interconnect_100MHz_RREADY;
  M04_AXI_wdata(31 downto 0) <= m04_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0);
  M04_AXI_wstrb(3 downto 0) <= m04_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0);
  M04_AXI_wvalid <= m04_couplers_to_inst_interconnect_100MHz_WVALID;
  M05_ACLK_1 <= M05_ACLK;
  M05_ARESETN_1(0) <= M05_ARESETN(0);
  M05_AXI_araddr(31 downto 0) <= m05_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0);
  M05_AXI_arprot(2 downto 0) <= m05_couplers_to_inst_interconnect_100MHz_ARPROT(2 downto 0);
  M05_AXI_arvalid <= m05_couplers_to_inst_interconnect_100MHz_ARVALID;
  M05_AXI_awaddr(31 downto 0) <= m05_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0);
  M05_AXI_awprot(2 downto 0) <= m05_couplers_to_inst_interconnect_100MHz_AWPROT(2 downto 0);
  M05_AXI_awvalid <= m05_couplers_to_inst_interconnect_100MHz_AWVALID;
  M05_AXI_bready <= m05_couplers_to_inst_interconnect_100MHz_BREADY;
  M05_AXI_rready <= m05_couplers_to_inst_interconnect_100MHz_RREADY;
  M05_AXI_wdata(31 downto 0) <= m05_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0);
  M05_AXI_wstrb(3 downto 0) <= m05_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0);
  M05_AXI_wvalid <= m05_couplers_to_inst_interconnect_100MHz_WVALID;
  M06_ACLK_1 <= M06_ACLK;
  M06_ARESETN_1(0) <= M06_ARESETN(0);
  M06_AXI_araddr(31 downto 0) <= m06_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0);
  M06_AXI_arvalid <= m06_couplers_to_inst_interconnect_100MHz_ARVALID;
  M06_AXI_awaddr(31 downto 0) <= m06_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0);
  M06_AXI_awvalid <= m06_couplers_to_inst_interconnect_100MHz_AWVALID;
  M06_AXI_bready <= m06_couplers_to_inst_interconnect_100MHz_BREADY;
  M06_AXI_rready <= m06_couplers_to_inst_interconnect_100MHz_RREADY;
  M06_AXI_wdata(31 downto 0) <= m06_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0);
  M06_AXI_wstrb(3 downto 0) <= m06_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0);
  M06_AXI_wvalid <= m06_couplers_to_inst_interconnect_100MHz_WVALID;
  M07_ACLK_1 <= M07_ACLK;
  M07_ARESETN_1(0) <= M07_ARESETN(0);
  M07_AXI_araddr(31 downto 0) <= m07_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0);
  M07_AXI_arprot(2 downto 0) <= m07_couplers_to_inst_interconnect_100MHz_ARPROT(2 downto 0);
  M07_AXI_arvalid <= m07_couplers_to_inst_interconnect_100MHz_ARVALID;
  M07_AXI_awaddr(31 downto 0) <= m07_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0);
  M07_AXI_awprot(2 downto 0) <= m07_couplers_to_inst_interconnect_100MHz_AWPROT(2 downto 0);
  M07_AXI_awvalid <= m07_couplers_to_inst_interconnect_100MHz_AWVALID;
  M07_AXI_bready <= m07_couplers_to_inst_interconnect_100MHz_BREADY;
  M07_AXI_rready <= m07_couplers_to_inst_interconnect_100MHz_RREADY;
  M07_AXI_wdata(31 downto 0) <= m07_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0);
  M07_AXI_wstrb(3 downto 0) <= m07_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0);
  M07_AXI_wvalid <= m07_couplers_to_inst_interconnect_100MHz_WVALID;
  M08_ACLK_1 <= M08_ACLK;
  M08_ARESETN_1(0) <= M08_ARESETN(0);
  M08_AXI_araddr(31 downto 0) <= m08_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0);
  M08_AXI_arprot(2 downto 0) <= m08_couplers_to_inst_interconnect_100MHz_ARPROT(2 downto 0);
  M08_AXI_arvalid <= m08_couplers_to_inst_interconnect_100MHz_ARVALID;
  M08_AXI_awaddr(31 downto 0) <= m08_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0);
  M08_AXI_awprot(2 downto 0) <= m08_couplers_to_inst_interconnect_100MHz_AWPROT(2 downto 0);
  M08_AXI_awvalid <= m08_couplers_to_inst_interconnect_100MHz_AWVALID;
  M08_AXI_bready <= m08_couplers_to_inst_interconnect_100MHz_BREADY;
  M08_AXI_rready <= m08_couplers_to_inst_interconnect_100MHz_RREADY;
  M08_AXI_wdata(31 downto 0) <= m08_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0);
  M08_AXI_wstrb(3 downto 0) <= m08_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0);
  M08_AXI_wvalid <= m08_couplers_to_inst_interconnect_100MHz_WVALID;
  M09_ACLK_1 <= M09_ACLK;
  M09_ARESETN_1(0) <= M09_ARESETN(0);
  M09_AXI_araddr(31 downto 0) <= m09_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0);
  M09_AXI_arprot(2 downto 0) <= m09_couplers_to_inst_interconnect_100MHz_ARPROT(2 downto 0);
  M09_AXI_arvalid <= m09_couplers_to_inst_interconnect_100MHz_ARVALID;
  M09_AXI_awaddr(31 downto 0) <= m09_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0);
  M09_AXI_awprot(2 downto 0) <= m09_couplers_to_inst_interconnect_100MHz_AWPROT(2 downto 0);
  M09_AXI_awvalid <= m09_couplers_to_inst_interconnect_100MHz_AWVALID;
  M09_AXI_bready <= m09_couplers_to_inst_interconnect_100MHz_BREADY;
  M09_AXI_rready <= m09_couplers_to_inst_interconnect_100MHz_RREADY;
  M09_AXI_wdata(31 downto 0) <= m09_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0);
  M09_AXI_wstrb(3 downto 0) <= m09_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0);
  M09_AXI_wvalid <= m09_couplers_to_inst_interconnect_100MHz_WVALID;
  M10_ACLK_1 <= M10_ACLK;
  M10_ARESETN_1(0) <= M10_ARESETN(0);
  M10_AXI_araddr(31 downto 0) <= m10_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0);
  M10_AXI_arprot(2 downto 0) <= m10_couplers_to_inst_interconnect_100MHz_ARPROT(2 downto 0);
  M10_AXI_arvalid <= m10_couplers_to_inst_interconnect_100MHz_ARVALID;
  M10_AXI_awaddr(31 downto 0) <= m10_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0);
  M10_AXI_awprot(2 downto 0) <= m10_couplers_to_inst_interconnect_100MHz_AWPROT(2 downto 0);
  M10_AXI_awvalid <= m10_couplers_to_inst_interconnect_100MHz_AWVALID;
  M10_AXI_bready <= m10_couplers_to_inst_interconnect_100MHz_BREADY;
  M10_AXI_rready <= m10_couplers_to_inst_interconnect_100MHz_RREADY;
  M10_AXI_wdata(31 downto 0) <= m10_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0);
  M10_AXI_wstrb(3 downto 0) <= m10_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0);
  M10_AXI_wvalid <= m10_couplers_to_inst_interconnect_100MHz_WVALID;
  M11_ACLK_1 <= M11_ACLK;
  M11_ARESETN_1(0) <= M11_ARESETN(0);
  M11_AXI_araddr(31 downto 0) <= m11_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0);
  M11_AXI_arvalid <= m11_couplers_to_inst_interconnect_100MHz_ARVALID;
  M11_AXI_awaddr(31 downto 0) <= m11_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0);
  M11_AXI_awvalid <= m11_couplers_to_inst_interconnect_100MHz_AWVALID;
  M11_AXI_bready <= m11_couplers_to_inst_interconnect_100MHz_BREADY;
  M11_AXI_rready <= m11_couplers_to_inst_interconnect_100MHz_RREADY;
  M11_AXI_wdata(31 downto 0) <= m11_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0);
  M11_AXI_wvalid <= m11_couplers_to_inst_interconnect_100MHz_WVALID;
  M12_ACLK_1 <= M12_ACLK;
  M12_ARESETN_1(0) <= M12_ARESETN(0);
  M12_AXI_araddr(31 downto 0) <= m12_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0);
  M12_AXI_arprot(2 downto 0) <= m12_couplers_to_inst_interconnect_100MHz_ARPROT(2 downto 0);
  M12_AXI_arvalid <= m12_couplers_to_inst_interconnect_100MHz_ARVALID;
  M12_AXI_awaddr(31 downto 0) <= m12_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0);
  M12_AXI_awprot(2 downto 0) <= m12_couplers_to_inst_interconnect_100MHz_AWPROT(2 downto 0);
  M12_AXI_awvalid <= m12_couplers_to_inst_interconnect_100MHz_AWVALID;
  M12_AXI_bready <= m12_couplers_to_inst_interconnect_100MHz_BREADY;
  M12_AXI_rready <= m12_couplers_to_inst_interconnect_100MHz_RREADY;
  M12_AXI_wdata(31 downto 0) <= m12_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0);
  M12_AXI_wstrb(3 downto 0) <= m12_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0);
  M12_AXI_wvalid <= m12_couplers_to_inst_interconnect_100MHz_WVALID;
  M13_ACLK_1 <= M13_ACLK;
  M13_ARESETN_1(0) <= M13_ARESETN(0);
  M13_AXI_araddr(31 downto 0) <= m13_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0);
  M13_AXI_arvalid <= m13_couplers_to_inst_interconnect_100MHz_ARVALID;
  M13_AXI_awaddr(31 downto 0) <= m13_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0);
  M13_AXI_awvalid <= m13_couplers_to_inst_interconnect_100MHz_AWVALID;
  M13_AXI_bready <= m13_couplers_to_inst_interconnect_100MHz_BREADY;
  M13_AXI_rready <= m13_couplers_to_inst_interconnect_100MHz_RREADY;
  M13_AXI_wdata(31 downto 0) <= m13_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0);
  M13_AXI_wvalid <= m13_couplers_to_inst_interconnect_100MHz_WVALID;
  M14_ACLK_1 <= M14_ACLK;
  M14_ARESETN_1(0) <= M14_ARESETN(0);
  M14_AXI_araddr(31 downto 0) <= m14_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0);
  M14_AXI_arvalid <= m14_couplers_to_inst_interconnect_100MHz_ARVALID;
  M14_AXI_awaddr(31 downto 0) <= m14_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0);
  M14_AXI_awvalid <= m14_couplers_to_inst_interconnect_100MHz_AWVALID;
  M14_AXI_bready <= m14_couplers_to_inst_interconnect_100MHz_BREADY;
  M14_AXI_rready <= m14_couplers_to_inst_interconnect_100MHz_RREADY;
  M14_AXI_wdata(31 downto 0) <= m14_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0);
  M14_AXI_wstrb(3 downto 0) <= m14_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0);
  M14_AXI_wvalid <= m14_couplers_to_inst_interconnect_100MHz_WVALID;
  S00_ACLK_1 <= S00_ACLK;
  S00_ARESETN_1(0) <= S00_ARESETN(0);
  S00_AXI_arready <= inst_interconnect_100MHz_to_s00_couplers_ARREADY;
  S00_AXI_awready <= inst_interconnect_100MHz_to_s00_couplers_AWREADY;
  S00_AXI_bid(11 downto 0) <= inst_interconnect_100MHz_to_s00_couplers_BID(11 downto 0);
  S00_AXI_bresp(1 downto 0) <= inst_interconnect_100MHz_to_s00_couplers_BRESP(1 downto 0);
  S00_AXI_bvalid <= inst_interconnect_100MHz_to_s00_couplers_BVALID;
  S00_AXI_rdata(31 downto 0) <= inst_interconnect_100MHz_to_s00_couplers_RDATA(31 downto 0);
  S00_AXI_rid(11 downto 0) <= inst_interconnect_100MHz_to_s00_couplers_RID(11 downto 0);
  S00_AXI_rlast <= inst_interconnect_100MHz_to_s00_couplers_RLAST;
  S00_AXI_rresp(1 downto 0) <= inst_interconnect_100MHz_to_s00_couplers_RRESP(1 downto 0);
  S00_AXI_rvalid <= inst_interconnect_100MHz_to_s00_couplers_RVALID;
  S00_AXI_wready <= inst_interconnect_100MHz_to_s00_couplers_WREADY;
  inst_interconnect_100MHz_ACLK_net <= ACLK;
  inst_interconnect_100MHz_ARESETN_net(0) <= ARESETN(0);
  inst_interconnect_100MHz_to_s00_couplers_ARADDR(31 downto 0) <= S00_AXI_araddr(31 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_ARBURST(1 downto 0) <= S00_AXI_arburst(1 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_ARCACHE(3 downto 0) <= S00_AXI_arcache(3 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_ARID(11 downto 0) <= S00_AXI_arid(11 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_ARLEN(3 downto 0) <= S00_AXI_arlen(3 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_ARLOCK(1 downto 0) <= S00_AXI_arlock(1 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_ARPROT(2 downto 0) <= S00_AXI_arprot(2 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_ARQOS(3 downto 0) <= S00_AXI_arqos(3 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_ARSIZE(2 downto 0) <= S00_AXI_arsize(2 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_ARVALID <= S00_AXI_arvalid;
  inst_interconnect_100MHz_to_s00_couplers_AWADDR(31 downto 0) <= S00_AXI_awaddr(31 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_AWBURST(1 downto 0) <= S00_AXI_awburst(1 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_AWCACHE(3 downto 0) <= S00_AXI_awcache(3 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_AWID(11 downto 0) <= S00_AXI_awid(11 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_AWLEN(3 downto 0) <= S00_AXI_awlen(3 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_AWLOCK(1 downto 0) <= S00_AXI_awlock(1 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_AWPROT(2 downto 0) <= S00_AXI_awprot(2 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_AWQOS(3 downto 0) <= S00_AXI_awqos(3 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_AWSIZE(2 downto 0) <= S00_AXI_awsize(2 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_AWVALID <= S00_AXI_awvalid;
  inst_interconnect_100MHz_to_s00_couplers_BREADY <= S00_AXI_bready;
  inst_interconnect_100MHz_to_s00_couplers_RREADY <= S00_AXI_rready;
  inst_interconnect_100MHz_to_s00_couplers_WDATA(31 downto 0) <= S00_AXI_wdata(31 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_WID(11 downto 0) <= S00_AXI_wid(11 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_WLAST <= S00_AXI_wlast;
  inst_interconnect_100MHz_to_s00_couplers_WSTRB(3 downto 0) <= S00_AXI_wstrb(3 downto 0);
  inst_interconnect_100MHz_to_s00_couplers_WVALID <= S00_AXI_wvalid;
  m00_couplers_to_inst_interconnect_100MHz_ARREADY(0) <= M00_AXI_arready(0);
  m00_couplers_to_inst_interconnect_100MHz_AWREADY(0) <= M00_AXI_awready(0);
  m00_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  m00_couplers_to_inst_interconnect_100MHz_BVALID(0) <= M00_AXI_bvalid(0);
  m00_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0) <= M00_AXI_rdata(31 downto 0);
  m00_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  m00_couplers_to_inst_interconnect_100MHz_RVALID(0) <= M00_AXI_rvalid(0);
  m00_couplers_to_inst_interconnect_100MHz_WREADY(0) <= M00_AXI_wready(0);
  m01_couplers_to_inst_interconnect_100MHz_ARREADY <= M01_AXI_arready;
  m01_couplers_to_inst_interconnect_100MHz_AWREADY <= M01_AXI_awready;
  m01_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0) <= M01_AXI_bresp(1 downto 0);
  m01_couplers_to_inst_interconnect_100MHz_BVALID <= M01_AXI_bvalid;
  m01_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0) <= M01_AXI_rdata(31 downto 0);
  m01_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0) <= M01_AXI_rresp(1 downto 0);
  m01_couplers_to_inst_interconnect_100MHz_RVALID <= M01_AXI_rvalid;
  m01_couplers_to_inst_interconnect_100MHz_WREADY <= M01_AXI_wready;
  m02_couplers_to_inst_interconnect_100MHz_ARREADY(0) <= M02_AXI_arready(0);
  m02_couplers_to_inst_interconnect_100MHz_AWREADY(0) <= M02_AXI_awready(0);
  m02_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0) <= M02_AXI_bresp(1 downto 0);
  m02_couplers_to_inst_interconnect_100MHz_BVALID(0) <= M02_AXI_bvalid(0);
  m02_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0) <= M02_AXI_rdata(31 downto 0);
  m02_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0) <= M02_AXI_rresp(1 downto 0);
  m02_couplers_to_inst_interconnect_100MHz_RVALID(0) <= M02_AXI_rvalid(0);
  m02_couplers_to_inst_interconnect_100MHz_WREADY(0) <= M02_AXI_wready(0);
  m03_couplers_to_inst_interconnect_100MHz_ARREADY(0) <= M03_AXI_arready(0);
  m03_couplers_to_inst_interconnect_100MHz_AWREADY(0) <= M03_AXI_awready(0);
  m03_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0) <= M03_AXI_bresp(1 downto 0);
  m03_couplers_to_inst_interconnect_100MHz_BVALID(0) <= M03_AXI_bvalid(0);
  m03_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0) <= M03_AXI_rdata(31 downto 0);
  m03_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0) <= M03_AXI_rresp(1 downto 0);
  m03_couplers_to_inst_interconnect_100MHz_RVALID(0) <= M03_AXI_rvalid(0);
  m03_couplers_to_inst_interconnect_100MHz_WREADY(0) <= M03_AXI_wready(0);
  m04_couplers_to_inst_interconnect_100MHz_ARREADY <= M04_AXI_arready;
  m04_couplers_to_inst_interconnect_100MHz_AWREADY <= M04_AXI_awready;
  m04_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0) <= M04_AXI_bresp(1 downto 0);
  m04_couplers_to_inst_interconnect_100MHz_BVALID <= M04_AXI_bvalid;
  m04_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0) <= M04_AXI_rdata(31 downto 0);
  m04_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0) <= M04_AXI_rresp(1 downto 0);
  m04_couplers_to_inst_interconnect_100MHz_RVALID <= M04_AXI_rvalid;
  m04_couplers_to_inst_interconnect_100MHz_WREADY <= M04_AXI_wready;
  m05_couplers_to_inst_interconnect_100MHz_ARREADY <= M05_AXI_arready;
  m05_couplers_to_inst_interconnect_100MHz_AWREADY <= M05_AXI_awready;
  m05_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0) <= M05_AXI_bresp(1 downto 0);
  m05_couplers_to_inst_interconnect_100MHz_BVALID <= M05_AXI_bvalid;
  m05_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0) <= M05_AXI_rdata(31 downto 0);
  m05_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0) <= M05_AXI_rresp(1 downto 0);
  m05_couplers_to_inst_interconnect_100MHz_RVALID <= M05_AXI_rvalid;
  m05_couplers_to_inst_interconnect_100MHz_WREADY <= M05_AXI_wready;
  m06_couplers_to_inst_interconnect_100MHz_ARREADY <= M06_AXI_arready;
  m06_couplers_to_inst_interconnect_100MHz_AWREADY <= M06_AXI_awready;
  m06_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0) <= M06_AXI_bresp(1 downto 0);
  m06_couplers_to_inst_interconnect_100MHz_BVALID <= M06_AXI_bvalid;
  m06_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0) <= M06_AXI_rdata(31 downto 0);
  m06_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0) <= M06_AXI_rresp(1 downto 0);
  m06_couplers_to_inst_interconnect_100MHz_RVALID <= M06_AXI_rvalid;
  m06_couplers_to_inst_interconnect_100MHz_WREADY <= M06_AXI_wready;
  m07_couplers_to_inst_interconnect_100MHz_ARREADY <= M07_AXI_arready;
  m07_couplers_to_inst_interconnect_100MHz_AWREADY <= M07_AXI_awready;
  m07_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0) <= M07_AXI_bresp(1 downto 0);
  m07_couplers_to_inst_interconnect_100MHz_BVALID <= M07_AXI_bvalid;
  m07_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0) <= M07_AXI_rdata(31 downto 0);
  m07_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0) <= M07_AXI_rresp(1 downto 0);
  m07_couplers_to_inst_interconnect_100MHz_RVALID <= M07_AXI_rvalid;
  m07_couplers_to_inst_interconnect_100MHz_WREADY <= M07_AXI_wready;
  m08_couplers_to_inst_interconnect_100MHz_ARREADY <= M08_AXI_arready;
  m08_couplers_to_inst_interconnect_100MHz_AWREADY <= M08_AXI_awready;
  m08_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0) <= M08_AXI_bresp(1 downto 0);
  m08_couplers_to_inst_interconnect_100MHz_BVALID <= M08_AXI_bvalid;
  m08_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0) <= M08_AXI_rdata(31 downto 0);
  m08_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0) <= M08_AXI_rresp(1 downto 0);
  m08_couplers_to_inst_interconnect_100MHz_RVALID <= M08_AXI_rvalid;
  m08_couplers_to_inst_interconnect_100MHz_WREADY <= M08_AXI_wready;
  m09_couplers_to_inst_interconnect_100MHz_ARREADY <= M09_AXI_arready;
  m09_couplers_to_inst_interconnect_100MHz_AWREADY <= M09_AXI_awready;
  m09_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0) <= M09_AXI_bresp(1 downto 0);
  m09_couplers_to_inst_interconnect_100MHz_BVALID <= M09_AXI_bvalid;
  m09_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0) <= M09_AXI_rdata(31 downto 0);
  m09_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0) <= M09_AXI_rresp(1 downto 0);
  m09_couplers_to_inst_interconnect_100MHz_RVALID <= M09_AXI_rvalid;
  m09_couplers_to_inst_interconnect_100MHz_WREADY <= M09_AXI_wready;
  m10_couplers_to_inst_interconnect_100MHz_ARREADY <= M10_AXI_arready;
  m10_couplers_to_inst_interconnect_100MHz_AWREADY <= M10_AXI_awready;
  m10_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0) <= M10_AXI_bresp(1 downto 0);
  m10_couplers_to_inst_interconnect_100MHz_BVALID <= M10_AXI_bvalid;
  m10_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0) <= M10_AXI_rdata(31 downto 0);
  m10_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0) <= M10_AXI_rresp(1 downto 0);
  m10_couplers_to_inst_interconnect_100MHz_RVALID <= M10_AXI_rvalid;
  m10_couplers_to_inst_interconnect_100MHz_WREADY <= M10_AXI_wready;
  m11_couplers_to_inst_interconnect_100MHz_ARREADY <= M11_AXI_arready;
  m11_couplers_to_inst_interconnect_100MHz_AWREADY <= M11_AXI_awready;
  m11_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0) <= M11_AXI_bresp(1 downto 0);
  m11_couplers_to_inst_interconnect_100MHz_BVALID <= M11_AXI_bvalid;
  m11_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0) <= M11_AXI_rdata(31 downto 0);
  m11_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0) <= M11_AXI_rresp(1 downto 0);
  m11_couplers_to_inst_interconnect_100MHz_RVALID <= M11_AXI_rvalid;
  m11_couplers_to_inst_interconnect_100MHz_WREADY <= M11_AXI_wready;
  m12_couplers_to_inst_interconnect_100MHz_ARREADY <= M12_AXI_arready;
  m12_couplers_to_inst_interconnect_100MHz_AWREADY <= M12_AXI_awready;
  m12_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0) <= M12_AXI_bresp(1 downto 0);
  m12_couplers_to_inst_interconnect_100MHz_BVALID <= M12_AXI_bvalid;
  m12_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0) <= M12_AXI_rdata(31 downto 0);
  m12_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0) <= M12_AXI_rresp(1 downto 0);
  m12_couplers_to_inst_interconnect_100MHz_RVALID <= M12_AXI_rvalid;
  m12_couplers_to_inst_interconnect_100MHz_WREADY <= M12_AXI_wready;
  m13_couplers_to_inst_interconnect_100MHz_ARREADY <= M13_AXI_arready;
  m13_couplers_to_inst_interconnect_100MHz_AWREADY <= M13_AXI_awready;
  m13_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0) <= M13_AXI_bresp(1 downto 0);
  m13_couplers_to_inst_interconnect_100MHz_BVALID <= M13_AXI_bvalid;
  m13_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0) <= M13_AXI_rdata(31 downto 0);
  m13_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0) <= M13_AXI_rresp(1 downto 0);
  m13_couplers_to_inst_interconnect_100MHz_RVALID <= M13_AXI_rvalid;
  m13_couplers_to_inst_interconnect_100MHz_WREADY <= M13_AXI_wready;
  m14_couplers_to_inst_interconnect_100MHz_ARREADY <= M14_AXI_arready;
  m14_couplers_to_inst_interconnect_100MHz_AWREADY <= M14_AXI_awready;
  m14_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0) <= M14_AXI_bresp(1 downto 0);
  m14_couplers_to_inst_interconnect_100MHz_BVALID <= M14_AXI_bvalid;
  m14_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0) <= M14_AXI_rdata(31 downto 0);
  m14_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0) <= M14_AXI_rresp(1 downto 0);
  m14_couplers_to_inst_interconnect_100MHz_RVALID <= M14_AXI_rvalid;
  m14_couplers_to_inst_interconnect_100MHz_WREADY <= M14_AXI_wready;
m00_couplers: entity work.m00_couplers_imp_160MZMZ
     port map (
      M_ACLK => M00_ACLK_1,
      M_ARESETN(0) => M00_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m00_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m00_couplers_to_inst_interconnect_100MHz_ARPROT(2 downto 0),
      M_AXI_arready(0) => m00_couplers_to_inst_interconnect_100MHz_ARREADY(0),
      M_AXI_arvalid(0) => m00_couplers_to_inst_interconnect_100MHz_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => m00_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m00_couplers_to_inst_interconnect_100MHz_AWPROT(2 downto 0),
      M_AXI_awready(0) => m00_couplers_to_inst_interconnect_100MHz_AWREADY(0),
      M_AXI_awvalid(0) => m00_couplers_to_inst_interconnect_100MHz_AWVALID(0),
      M_AXI_bready(0) => m00_couplers_to_inst_interconnect_100MHz_BREADY(0),
      M_AXI_bresp(1 downto 0) => m00_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m00_couplers_to_inst_interconnect_100MHz_BVALID(0),
      M_AXI_rdata(31 downto 0) => m00_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0),
      M_AXI_rready(0) => m00_couplers_to_inst_interconnect_100MHz_RREADY(0),
      M_AXI_rresp(1 downto 0) => m00_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m00_couplers_to_inst_interconnect_100MHz_RVALID(0),
      M_AXI_wdata(31 downto 0) => m00_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0),
      M_AXI_wready(0) => m00_couplers_to_inst_interconnect_100MHz_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m00_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m00_couplers_to_inst_interconnect_100MHz_WVALID(0),
      S_ACLK => inst_interconnect_100MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_100MHz_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      S_AXI_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      S_AXI_arready(0) => xbar_to_m00_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      S_AXI_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      S_AXI_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      S_AXI_awready(0) => xbar_to_m00_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      S_AXI_bready(0) => xbar_to_m00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m00_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m00_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      S_AXI_wready(0) => xbar_to_m00_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid(0) => xbar_to_m00_couplers_WVALID(0)
    );
m01_couplers: entity work.m01_couplers_imp_XD2AKQ
     port map (
      M_ACLK => M01_ACLK_1,
      M_ARESETN(0) => M01_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m01_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0),
      M_AXI_arready => m01_couplers_to_inst_interconnect_100MHz_ARREADY,
      M_AXI_arvalid => m01_couplers_to_inst_interconnect_100MHz_ARVALID,
      M_AXI_awaddr(31 downto 0) => m01_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0),
      M_AXI_awready => m01_couplers_to_inst_interconnect_100MHz_AWREADY,
      M_AXI_awvalid => m01_couplers_to_inst_interconnect_100MHz_AWVALID,
      M_AXI_bready => m01_couplers_to_inst_interconnect_100MHz_BREADY,
      M_AXI_bresp(1 downto 0) => m01_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0),
      M_AXI_bvalid => m01_couplers_to_inst_interconnect_100MHz_BVALID,
      M_AXI_rdata(31 downto 0) => m01_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0),
      M_AXI_rready => m01_couplers_to_inst_interconnect_100MHz_RREADY,
      M_AXI_rresp(1 downto 0) => m01_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0),
      M_AXI_rvalid => m01_couplers_to_inst_interconnect_100MHz_RVALID,
      M_AXI_wdata(31 downto 0) => m01_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0),
      M_AXI_wready => m01_couplers_to_inst_interconnect_100MHz_WREADY,
      M_AXI_wstrb(3 downto 0) => m01_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0),
      M_AXI_wvalid => m01_couplers_to_inst_interconnect_100MHz_WVALID,
      S_ACLK => inst_interconnect_100MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_100MHz_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      S_AXI_arready => xbar_to_m01_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m01_couplers_ARVALID(1),
      S_AXI_awaddr(31 downto 0) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      S_AXI_awready => xbar_to_m01_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m01_couplers_AWVALID(1),
      S_AXI_bready => xbar_to_m01_couplers_BREADY(1),
      S_AXI_bresp(1 downto 0) => xbar_to_m01_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m01_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m01_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m01_couplers_RREADY(1),
      S_AXI_rresp(1 downto 0) => xbar_to_m01_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m01_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m01_couplers_WDATA(63 downto 32),
      S_AXI_wready => xbar_to_m01_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      S_AXI_wvalid => xbar_to_m01_couplers_WVALID(1)
    );
m02_couplers: entity work.m02_couplers_imp_14PNN8O
     port map (
      M_ACLK => M02_ACLK_1,
      M_ARESETN(0) => M02_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m02_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0),
      M_AXI_arready(0) => m02_couplers_to_inst_interconnect_100MHz_ARREADY(0),
      M_AXI_arvalid(0) => m02_couplers_to_inst_interconnect_100MHz_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => m02_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0),
      M_AXI_awready(0) => m02_couplers_to_inst_interconnect_100MHz_AWREADY(0),
      M_AXI_awvalid(0) => m02_couplers_to_inst_interconnect_100MHz_AWVALID(0),
      M_AXI_bready(0) => m02_couplers_to_inst_interconnect_100MHz_BREADY(0),
      M_AXI_bresp(1 downto 0) => m02_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m02_couplers_to_inst_interconnect_100MHz_BVALID(0),
      M_AXI_rdata(31 downto 0) => m02_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0),
      M_AXI_rready(0) => m02_couplers_to_inst_interconnect_100MHz_RREADY(0),
      M_AXI_rresp(1 downto 0) => m02_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m02_couplers_to_inst_interconnect_100MHz_RVALID(0),
      M_AXI_wdata(31 downto 0) => m02_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0),
      M_AXI_wready(0) => m02_couplers_to_inst_interconnect_100MHz_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m02_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m02_couplers_to_inst_interconnect_100MHz_WVALID(0),
      S_ACLK => inst_interconnect_100MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_100MHz_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m02_couplers_ARADDR(95 downto 64),
      S_AXI_arready(0) => xbar_to_m02_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m02_couplers_ARVALID(2),
      S_AXI_awaddr(31 downto 0) => xbar_to_m02_couplers_AWADDR(95 downto 64),
      S_AXI_awready(0) => xbar_to_m02_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m02_couplers_AWVALID(2),
      S_AXI_bready(0) => xbar_to_m02_couplers_BREADY(2),
      S_AXI_bresp(1 downto 0) => xbar_to_m02_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m02_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m02_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m02_couplers_RREADY(2),
      S_AXI_rresp(1 downto 0) => xbar_to_m02_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m02_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m02_couplers_WDATA(95 downto 64),
      S_AXI_wready(0) => xbar_to_m02_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m02_couplers_WSTRB(11 downto 8),
      S_AXI_wvalid(0) => xbar_to_m02_couplers_WVALID(2)
    );
m03_couplers: entity work.m03_couplers_imp_YXPDAH
     port map (
      M_ACLK => M03_ACLK_1,
      M_ARESETN(0) => M03_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m03_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0),
      M_AXI_arready(0) => m03_couplers_to_inst_interconnect_100MHz_ARREADY(0),
      M_AXI_arvalid(0) => m03_couplers_to_inst_interconnect_100MHz_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => m03_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0),
      M_AXI_awready(0) => m03_couplers_to_inst_interconnect_100MHz_AWREADY(0),
      M_AXI_awvalid(0) => m03_couplers_to_inst_interconnect_100MHz_AWVALID(0),
      M_AXI_bready(0) => m03_couplers_to_inst_interconnect_100MHz_BREADY(0),
      M_AXI_bresp(1 downto 0) => m03_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m03_couplers_to_inst_interconnect_100MHz_BVALID(0),
      M_AXI_rdata(31 downto 0) => m03_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0),
      M_AXI_rready(0) => m03_couplers_to_inst_interconnect_100MHz_RREADY(0),
      M_AXI_rresp(1 downto 0) => m03_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m03_couplers_to_inst_interconnect_100MHz_RVALID(0),
      M_AXI_wdata(31 downto 0) => m03_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0),
      M_AXI_wready(0) => m03_couplers_to_inst_interconnect_100MHz_WREADY(0),
      M_AXI_wstrb(3 downto 0) => m03_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0),
      M_AXI_wvalid(0) => m03_couplers_to_inst_interconnect_100MHz_WVALID(0),
      S_ACLK => inst_interconnect_100MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_100MHz_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m03_couplers_ARADDR(127 downto 96),
      S_AXI_arready(0) => xbar_to_m03_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m03_couplers_ARVALID(3),
      S_AXI_awaddr(31 downto 0) => xbar_to_m03_couplers_AWADDR(127 downto 96),
      S_AXI_awready(0) => xbar_to_m03_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m03_couplers_AWVALID(3),
      S_AXI_bready(0) => xbar_to_m03_couplers_BREADY(3),
      S_AXI_bresp(1 downto 0) => xbar_to_m03_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m03_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m03_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m03_couplers_RREADY(3),
      S_AXI_rresp(1 downto 0) => xbar_to_m03_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m03_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m03_couplers_WDATA(127 downto 96),
      S_AXI_wready(0) => xbar_to_m03_couplers_WREADY(0),
      S_AXI_wstrb(3 downto 0) => xbar_to_m03_couplers_WSTRB(15 downto 12),
      S_AXI_wvalid(0) => xbar_to_m03_couplers_WVALID(3)
    );
m04_couplers: entity work.m04_couplers_imp_17I0ZQL
     port map (
      M_ACLK => M04_ACLK_1,
      M_ARESETN(0) => M04_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m04_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0),
      M_AXI_arready => m04_couplers_to_inst_interconnect_100MHz_ARREADY,
      M_AXI_arvalid => m04_couplers_to_inst_interconnect_100MHz_ARVALID,
      M_AXI_awaddr(31 downto 0) => m04_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0),
      M_AXI_awready => m04_couplers_to_inst_interconnect_100MHz_AWREADY,
      M_AXI_awvalid => m04_couplers_to_inst_interconnect_100MHz_AWVALID,
      M_AXI_bready => m04_couplers_to_inst_interconnect_100MHz_BREADY,
      M_AXI_bresp(1 downto 0) => m04_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0),
      M_AXI_bvalid => m04_couplers_to_inst_interconnect_100MHz_BVALID,
      M_AXI_rdata(31 downto 0) => m04_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0),
      M_AXI_rready => m04_couplers_to_inst_interconnect_100MHz_RREADY,
      M_AXI_rresp(1 downto 0) => m04_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0),
      M_AXI_rvalid => m04_couplers_to_inst_interconnect_100MHz_RVALID,
      M_AXI_wdata(31 downto 0) => m04_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0),
      M_AXI_wready => m04_couplers_to_inst_interconnect_100MHz_WREADY,
      M_AXI_wstrb(3 downto 0) => m04_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0),
      M_AXI_wvalid => m04_couplers_to_inst_interconnect_100MHz_WVALID,
      S_ACLK => inst_interconnect_100MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_100MHz_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m04_couplers_ARADDR(159 downto 128),
      S_AXI_arready => xbar_to_m04_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m04_couplers_ARVALID(4),
      S_AXI_awaddr(31 downto 0) => xbar_to_m04_couplers_AWADDR(159 downto 128),
      S_AXI_awready => xbar_to_m04_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m04_couplers_AWVALID(4),
      S_AXI_bready => xbar_to_m04_couplers_BREADY(4),
      S_AXI_bresp(1 downto 0) => xbar_to_m04_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m04_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m04_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m04_couplers_RREADY(4),
      S_AXI_rresp(1 downto 0) => xbar_to_m04_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m04_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m04_couplers_WDATA(159 downto 128),
      S_AXI_wready => xbar_to_m04_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m04_couplers_WSTRB(19 downto 16),
      S_AXI_wvalid => xbar_to_m04_couplers_WVALID(4)
    );
m05_couplers: entity work.m05_couplers_imp_W2ISR0
     port map (
      M_ACLK => M05_ACLK_1,
      M_ARESETN(0) => M05_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m05_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m05_couplers_to_inst_interconnect_100MHz_ARPROT(2 downto 0),
      M_AXI_arready => m05_couplers_to_inst_interconnect_100MHz_ARREADY,
      M_AXI_arvalid => m05_couplers_to_inst_interconnect_100MHz_ARVALID,
      M_AXI_awaddr(31 downto 0) => m05_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m05_couplers_to_inst_interconnect_100MHz_AWPROT(2 downto 0),
      M_AXI_awready => m05_couplers_to_inst_interconnect_100MHz_AWREADY,
      M_AXI_awvalid => m05_couplers_to_inst_interconnect_100MHz_AWVALID,
      M_AXI_bready => m05_couplers_to_inst_interconnect_100MHz_BREADY,
      M_AXI_bresp(1 downto 0) => m05_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0),
      M_AXI_bvalid => m05_couplers_to_inst_interconnect_100MHz_BVALID,
      M_AXI_rdata(31 downto 0) => m05_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0),
      M_AXI_rready => m05_couplers_to_inst_interconnect_100MHz_RREADY,
      M_AXI_rresp(1 downto 0) => m05_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0),
      M_AXI_rvalid => m05_couplers_to_inst_interconnect_100MHz_RVALID,
      M_AXI_wdata(31 downto 0) => m05_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0),
      M_AXI_wready => m05_couplers_to_inst_interconnect_100MHz_WREADY,
      M_AXI_wstrb(3 downto 0) => m05_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0),
      M_AXI_wvalid => m05_couplers_to_inst_interconnect_100MHz_WVALID,
      S_ACLK => inst_interconnect_100MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_100MHz_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m05_couplers_ARADDR(191 downto 160),
      S_AXI_arprot(2 downto 0) => xbar_to_m05_couplers_ARPROT(17 downto 15),
      S_AXI_arready => xbar_to_m05_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m05_couplers_ARVALID(5),
      S_AXI_awaddr(31 downto 0) => xbar_to_m05_couplers_AWADDR(191 downto 160),
      S_AXI_awprot(2 downto 0) => xbar_to_m05_couplers_AWPROT(17 downto 15),
      S_AXI_awready => xbar_to_m05_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m05_couplers_AWVALID(5),
      S_AXI_bready => xbar_to_m05_couplers_BREADY(5),
      S_AXI_bresp(1 downto 0) => xbar_to_m05_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m05_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m05_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m05_couplers_RREADY(5),
      S_AXI_rresp(1 downto 0) => xbar_to_m05_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m05_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m05_couplers_WDATA(191 downto 160),
      S_AXI_wready => xbar_to_m05_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m05_couplers_WSTRB(23 downto 20),
      S_AXI_wvalid => xbar_to_m05_couplers_WVALID(5)
    );
m06_couplers: entity work.m06_couplers_imp_16H1XM6
     port map (
      M_ACLK => M06_ACLK_1,
      M_ARESETN(0) => M06_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m06_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0),
      M_AXI_arready => m06_couplers_to_inst_interconnect_100MHz_ARREADY,
      M_AXI_arvalid => m06_couplers_to_inst_interconnect_100MHz_ARVALID,
      M_AXI_awaddr(31 downto 0) => m06_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0),
      M_AXI_awready => m06_couplers_to_inst_interconnect_100MHz_AWREADY,
      M_AXI_awvalid => m06_couplers_to_inst_interconnect_100MHz_AWVALID,
      M_AXI_bready => m06_couplers_to_inst_interconnect_100MHz_BREADY,
      M_AXI_bresp(1 downto 0) => m06_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0),
      M_AXI_bvalid => m06_couplers_to_inst_interconnect_100MHz_BVALID,
      M_AXI_rdata(31 downto 0) => m06_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0),
      M_AXI_rready => m06_couplers_to_inst_interconnect_100MHz_RREADY,
      M_AXI_rresp(1 downto 0) => m06_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0),
      M_AXI_rvalid => m06_couplers_to_inst_interconnect_100MHz_RVALID,
      M_AXI_wdata(31 downto 0) => m06_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0),
      M_AXI_wready => m06_couplers_to_inst_interconnect_100MHz_WREADY,
      M_AXI_wstrb(3 downto 0) => m06_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0),
      M_AXI_wvalid => m06_couplers_to_inst_interconnect_100MHz_WVALID,
      S_ACLK => inst_interconnect_100MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_100MHz_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m06_couplers_ARADDR(223 downto 192),
      S_AXI_arready => xbar_to_m06_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m06_couplers_ARVALID(6),
      S_AXI_awaddr(31 downto 0) => xbar_to_m06_couplers_AWADDR(223 downto 192),
      S_AXI_awready => xbar_to_m06_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m06_couplers_AWVALID(6),
      S_AXI_bready => xbar_to_m06_couplers_BREADY(6),
      S_AXI_bresp(1 downto 0) => xbar_to_m06_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m06_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m06_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m06_couplers_RREADY(6),
      S_AXI_rresp(1 downto 0) => xbar_to_m06_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m06_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m06_couplers_WDATA(223 downto 192),
      S_AXI_wready => xbar_to_m06_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m06_couplers_WSTRB(27 downto 24),
      S_AXI_wvalid => xbar_to_m06_couplers_WVALID(6)
    );
m07_couplers: entity work.m07_couplers_imp_WT7TSF
     port map (
      M_ACLK => M07_ACLK_1,
      M_ARESETN(0) => M07_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m07_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m07_couplers_to_inst_interconnect_100MHz_ARPROT(2 downto 0),
      M_AXI_arready => m07_couplers_to_inst_interconnect_100MHz_ARREADY,
      M_AXI_arvalid => m07_couplers_to_inst_interconnect_100MHz_ARVALID,
      M_AXI_awaddr(31 downto 0) => m07_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m07_couplers_to_inst_interconnect_100MHz_AWPROT(2 downto 0),
      M_AXI_awready => m07_couplers_to_inst_interconnect_100MHz_AWREADY,
      M_AXI_awvalid => m07_couplers_to_inst_interconnect_100MHz_AWVALID,
      M_AXI_bready => m07_couplers_to_inst_interconnect_100MHz_BREADY,
      M_AXI_bresp(1 downto 0) => m07_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0),
      M_AXI_bvalid => m07_couplers_to_inst_interconnect_100MHz_BVALID,
      M_AXI_rdata(31 downto 0) => m07_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0),
      M_AXI_rready => m07_couplers_to_inst_interconnect_100MHz_RREADY,
      M_AXI_rresp(1 downto 0) => m07_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0),
      M_AXI_rvalid => m07_couplers_to_inst_interconnect_100MHz_RVALID,
      M_AXI_wdata(31 downto 0) => m07_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0),
      M_AXI_wready => m07_couplers_to_inst_interconnect_100MHz_WREADY,
      M_AXI_wstrb(3 downto 0) => m07_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0),
      M_AXI_wvalid => m07_couplers_to_inst_interconnect_100MHz_WVALID,
      S_ACLK => inst_interconnect_100MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_100MHz_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m07_couplers_ARADDR(255 downto 224),
      S_AXI_arprot(2 downto 0) => xbar_to_m07_couplers_ARPROT(23 downto 21),
      S_AXI_arready => xbar_to_m07_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m07_couplers_ARVALID(7),
      S_AXI_awaddr(31 downto 0) => xbar_to_m07_couplers_AWADDR(255 downto 224),
      S_AXI_awprot(2 downto 0) => xbar_to_m07_couplers_AWPROT(23 downto 21),
      S_AXI_awready => xbar_to_m07_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m07_couplers_AWVALID(7),
      S_AXI_bready => xbar_to_m07_couplers_BREADY(7),
      S_AXI_bresp(1 downto 0) => xbar_to_m07_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m07_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m07_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m07_couplers_RREADY(7),
      S_AXI_rresp(1 downto 0) => xbar_to_m07_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m07_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m07_couplers_WDATA(255 downto 224),
      S_AXI_wready => xbar_to_m07_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m07_couplers_WSTRB(31 downto 28),
      S_AXI_wvalid => xbar_to_m07_couplers_WVALID(7)
    );
m08_couplers: entity work.m08_couplers_imp_ZL0ESN
     port map (
      M_ACLK => M08_ACLK_1,
      M_ARESETN(0) => M08_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m08_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m08_couplers_to_inst_interconnect_100MHz_ARPROT(2 downto 0),
      M_AXI_arready => m08_couplers_to_inst_interconnect_100MHz_ARREADY,
      M_AXI_arvalid => m08_couplers_to_inst_interconnect_100MHz_ARVALID,
      M_AXI_awaddr(31 downto 0) => m08_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m08_couplers_to_inst_interconnect_100MHz_AWPROT(2 downto 0),
      M_AXI_awready => m08_couplers_to_inst_interconnect_100MHz_AWREADY,
      M_AXI_awvalid => m08_couplers_to_inst_interconnect_100MHz_AWVALID,
      M_AXI_bready => m08_couplers_to_inst_interconnect_100MHz_BREADY,
      M_AXI_bresp(1 downto 0) => m08_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0),
      M_AXI_bvalid => m08_couplers_to_inst_interconnect_100MHz_BVALID,
      M_AXI_rdata(31 downto 0) => m08_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0),
      M_AXI_rready => m08_couplers_to_inst_interconnect_100MHz_RREADY,
      M_AXI_rresp(1 downto 0) => m08_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0),
      M_AXI_rvalid => m08_couplers_to_inst_interconnect_100MHz_RVALID,
      M_AXI_wdata(31 downto 0) => m08_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0),
      M_AXI_wready => m08_couplers_to_inst_interconnect_100MHz_WREADY,
      M_AXI_wstrb(3 downto 0) => m08_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0),
      M_AXI_wvalid => m08_couplers_to_inst_interconnect_100MHz_WVALID,
      S_ACLK => inst_interconnect_100MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_100MHz_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m08_couplers_ARADDR(287 downto 256),
      S_AXI_arprot(2 downto 0) => xbar_to_m08_couplers_ARPROT(26 downto 24),
      S_AXI_arready => xbar_to_m08_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m08_couplers_ARVALID(8),
      S_AXI_awaddr(31 downto 0) => xbar_to_m08_couplers_AWADDR(287 downto 256),
      S_AXI_awprot(2 downto 0) => xbar_to_m08_couplers_AWPROT(26 downto 24),
      S_AXI_awready => xbar_to_m08_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m08_couplers_AWVALID(8),
      S_AXI_bready => xbar_to_m08_couplers_BREADY(8),
      S_AXI_bresp(1 downto 0) => xbar_to_m08_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m08_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m08_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m08_couplers_RREADY(8),
      S_AXI_rresp(1 downto 0) => xbar_to_m08_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m08_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m08_couplers_WDATA(287 downto 256),
      S_AXI_wready => xbar_to_m08_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m08_couplers_WSTRB(35 downto 32),
      S_AXI_wvalid => xbar_to_m08_couplers_WVALID(8)
    );
m09_couplers: entity work.m09_couplers_imp_UWZ56U
     port map (
      M_ACLK => M09_ACLK_1,
      M_ARESETN(0) => M09_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m09_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m09_couplers_to_inst_interconnect_100MHz_ARPROT(2 downto 0),
      M_AXI_arready => m09_couplers_to_inst_interconnect_100MHz_ARREADY,
      M_AXI_arvalid => m09_couplers_to_inst_interconnect_100MHz_ARVALID,
      M_AXI_awaddr(31 downto 0) => m09_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m09_couplers_to_inst_interconnect_100MHz_AWPROT(2 downto 0),
      M_AXI_awready => m09_couplers_to_inst_interconnect_100MHz_AWREADY,
      M_AXI_awvalid => m09_couplers_to_inst_interconnect_100MHz_AWVALID,
      M_AXI_bready => m09_couplers_to_inst_interconnect_100MHz_BREADY,
      M_AXI_bresp(1 downto 0) => m09_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0),
      M_AXI_bvalid => m09_couplers_to_inst_interconnect_100MHz_BVALID,
      M_AXI_rdata(31 downto 0) => m09_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0),
      M_AXI_rready => m09_couplers_to_inst_interconnect_100MHz_RREADY,
      M_AXI_rresp(1 downto 0) => m09_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0),
      M_AXI_rvalid => m09_couplers_to_inst_interconnect_100MHz_RVALID,
      M_AXI_wdata(31 downto 0) => m09_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0),
      M_AXI_wready => m09_couplers_to_inst_interconnect_100MHz_WREADY,
      M_AXI_wstrb(3 downto 0) => m09_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0),
      M_AXI_wvalid => m09_couplers_to_inst_interconnect_100MHz_WVALID,
      S_ACLK => inst_interconnect_100MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_100MHz_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m09_couplers_ARADDR(319 downto 288),
      S_AXI_arprot(2 downto 0) => xbar_to_m09_couplers_ARPROT(29 downto 27),
      S_AXI_arready => xbar_to_m09_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m09_couplers_ARVALID(9),
      S_AXI_awaddr(31 downto 0) => xbar_to_m09_couplers_AWADDR(319 downto 288),
      S_AXI_awprot(2 downto 0) => xbar_to_m09_couplers_AWPROT(29 downto 27),
      S_AXI_awready => xbar_to_m09_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m09_couplers_AWVALID(9),
      S_AXI_bready => xbar_to_m09_couplers_BREADY(9),
      S_AXI_bresp(1 downto 0) => xbar_to_m09_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m09_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m09_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m09_couplers_RREADY(9),
      S_AXI_rresp(1 downto 0) => xbar_to_m09_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m09_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m09_couplers_WDATA(319 downto 288),
      S_AXI_wready => xbar_to_m09_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m09_couplers_WSTRB(39 downto 36),
      S_AXI_wvalid => xbar_to_m09_couplers_WVALID(9)
    );
m10_couplers: entity work.m10_couplers_imp_HWT5MB
     port map (
      M_ACLK => M10_ACLK_1,
      M_ARESETN(0) => M10_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m10_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m10_couplers_to_inst_interconnect_100MHz_ARPROT(2 downto 0),
      M_AXI_arready => m10_couplers_to_inst_interconnect_100MHz_ARREADY,
      M_AXI_arvalid => m10_couplers_to_inst_interconnect_100MHz_ARVALID,
      M_AXI_awaddr(31 downto 0) => m10_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m10_couplers_to_inst_interconnect_100MHz_AWPROT(2 downto 0),
      M_AXI_awready => m10_couplers_to_inst_interconnect_100MHz_AWREADY,
      M_AXI_awvalid => m10_couplers_to_inst_interconnect_100MHz_AWVALID,
      M_AXI_bready => m10_couplers_to_inst_interconnect_100MHz_BREADY,
      M_AXI_bresp(1 downto 0) => m10_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0),
      M_AXI_bvalid => m10_couplers_to_inst_interconnect_100MHz_BVALID,
      M_AXI_rdata(31 downto 0) => m10_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0),
      M_AXI_rready => m10_couplers_to_inst_interconnect_100MHz_RREADY,
      M_AXI_rresp(1 downto 0) => m10_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0),
      M_AXI_rvalid => m10_couplers_to_inst_interconnect_100MHz_RVALID,
      M_AXI_wdata(31 downto 0) => m10_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0),
      M_AXI_wready => m10_couplers_to_inst_interconnect_100MHz_WREADY,
      M_AXI_wstrb(3 downto 0) => m10_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0),
      M_AXI_wvalid => m10_couplers_to_inst_interconnect_100MHz_WVALID,
      S_ACLK => inst_interconnect_100MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_100MHz_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m10_couplers_ARADDR(351 downto 320),
      S_AXI_arprot(2 downto 0) => xbar_to_m10_couplers_ARPROT(32 downto 30),
      S_AXI_arready => xbar_to_m10_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m10_couplers_ARVALID(10),
      S_AXI_awaddr(31 downto 0) => xbar_to_m10_couplers_AWADDR(351 downto 320),
      S_AXI_awprot(2 downto 0) => xbar_to_m10_couplers_AWPROT(32 downto 30),
      S_AXI_awready => xbar_to_m10_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m10_couplers_AWVALID(10),
      S_AXI_bready => xbar_to_m10_couplers_BREADY(10),
      S_AXI_bresp(1 downto 0) => xbar_to_m10_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m10_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m10_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m10_couplers_RREADY(10),
      S_AXI_rresp(1 downto 0) => xbar_to_m10_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m10_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m10_couplers_WDATA(351 downto 320),
      S_AXI_wready => xbar_to_m10_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m10_couplers_WSTRB(43 downto 40),
      S_AXI_wvalid => xbar_to_m10_couplers_WVALID(10)
    );
m11_couplers: entity work.m11_couplers_imp_1CSQTEA
     port map (
      M_ACLK => M11_ACLK_1,
      M_ARESETN(0) => M11_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m11_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0),
      M_AXI_arready => m11_couplers_to_inst_interconnect_100MHz_ARREADY,
      M_AXI_arvalid => m11_couplers_to_inst_interconnect_100MHz_ARVALID,
      M_AXI_awaddr(31 downto 0) => m11_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0),
      M_AXI_awready => m11_couplers_to_inst_interconnect_100MHz_AWREADY,
      M_AXI_awvalid => m11_couplers_to_inst_interconnect_100MHz_AWVALID,
      M_AXI_bready => m11_couplers_to_inst_interconnect_100MHz_BREADY,
      M_AXI_bresp(1 downto 0) => m11_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0),
      M_AXI_bvalid => m11_couplers_to_inst_interconnect_100MHz_BVALID,
      M_AXI_rdata(31 downto 0) => m11_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0),
      M_AXI_rready => m11_couplers_to_inst_interconnect_100MHz_RREADY,
      M_AXI_rresp(1 downto 0) => m11_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0),
      M_AXI_rvalid => m11_couplers_to_inst_interconnect_100MHz_RVALID,
      M_AXI_wdata(31 downto 0) => m11_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0),
      M_AXI_wready => m11_couplers_to_inst_interconnect_100MHz_WREADY,
      M_AXI_wvalid => m11_couplers_to_inst_interconnect_100MHz_WVALID,
      S_ACLK => inst_interconnect_100MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_100MHz_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m11_couplers_ARADDR(383 downto 352),
      S_AXI_arready => xbar_to_m11_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m11_couplers_ARVALID(11),
      S_AXI_awaddr(31 downto 0) => xbar_to_m11_couplers_AWADDR(383 downto 352),
      S_AXI_awready => xbar_to_m11_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m11_couplers_AWVALID(11),
      S_AXI_bready => xbar_to_m11_couplers_BREADY(11),
      S_AXI_bresp(1 downto 0) => xbar_to_m11_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m11_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m11_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m11_couplers_RREADY(11),
      S_AXI_rresp(1 downto 0) => xbar_to_m11_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m11_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m11_couplers_WDATA(383 downto 352),
      S_AXI_wready => xbar_to_m11_couplers_WREADY,
      S_AXI_wvalid => xbar_to_m11_couplers_WVALID(11)
    );
m12_couplers: entity work.m12_couplers_imp_J8PYCW
     port map (
      M_ACLK => M12_ACLK_1,
      M_ARESETN(0) => M12_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m12_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m12_couplers_to_inst_interconnect_100MHz_ARPROT(2 downto 0),
      M_AXI_arready => m12_couplers_to_inst_interconnect_100MHz_ARREADY,
      M_AXI_arvalid => m12_couplers_to_inst_interconnect_100MHz_ARVALID,
      M_AXI_awaddr(31 downto 0) => m12_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m12_couplers_to_inst_interconnect_100MHz_AWPROT(2 downto 0),
      M_AXI_awready => m12_couplers_to_inst_interconnect_100MHz_AWREADY,
      M_AXI_awvalid => m12_couplers_to_inst_interconnect_100MHz_AWVALID,
      M_AXI_bready => m12_couplers_to_inst_interconnect_100MHz_BREADY,
      M_AXI_bresp(1 downto 0) => m12_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0),
      M_AXI_bvalid => m12_couplers_to_inst_interconnect_100MHz_BVALID,
      M_AXI_rdata(31 downto 0) => m12_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0),
      M_AXI_rready => m12_couplers_to_inst_interconnect_100MHz_RREADY,
      M_AXI_rresp(1 downto 0) => m12_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0),
      M_AXI_rvalid => m12_couplers_to_inst_interconnect_100MHz_RVALID,
      M_AXI_wdata(31 downto 0) => m12_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0),
      M_AXI_wready => m12_couplers_to_inst_interconnect_100MHz_WREADY,
      M_AXI_wstrb(3 downto 0) => m12_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0),
      M_AXI_wvalid => m12_couplers_to_inst_interconnect_100MHz_WVALID,
      S_ACLK => inst_interconnect_100MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_100MHz_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m12_couplers_ARADDR(415 downto 384),
      S_AXI_arprot(2 downto 0) => xbar_to_m12_couplers_ARPROT(38 downto 36),
      S_AXI_arready => xbar_to_m12_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m12_couplers_ARVALID(12),
      S_AXI_awaddr(31 downto 0) => xbar_to_m12_couplers_AWADDR(415 downto 384),
      S_AXI_awprot(2 downto 0) => xbar_to_m12_couplers_AWPROT(38 downto 36),
      S_AXI_awready => xbar_to_m12_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m12_couplers_AWVALID(12),
      S_AXI_bready => xbar_to_m12_couplers_BREADY(12),
      S_AXI_bresp(1 downto 0) => xbar_to_m12_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m12_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m12_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m12_couplers_RREADY(12),
      S_AXI_rresp(1 downto 0) => xbar_to_m12_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m12_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m12_couplers_WDATA(415 downto 384),
      S_AXI_wready => xbar_to_m12_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m12_couplers_WSTRB(51 downto 48),
      S_AXI_wvalid => xbar_to_m12_couplers_WVALID(12)
    );
m13_couplers: entity work.m13_couplers_imp_1B6IK7L
     port map (
      M_ACLK => M13_ACLK_1,
      M_ARESETN(0) => M13_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m13_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0),
      M_AXI_arready => m13_couplers_to_inst_interconnect_100MHz_ARREADY,
      M_AXI_arvalid => m13_couplers_to_inst_interconnect_100MHz_ARVALID,
      M_AXI_awaddr(31 downto 0) => m13_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0),
      M_AXI_awready => m13_couplers_to_inst_interconnect_100MHz_AWREADY,
      M_AXI_awvalid => m13_couplers_to_inst_interconnect_100MHz_AWVALID,
      M_AXI_bready => m13_couplers_to_inst_interconnect_100MHz_BREADY,
      M_AXI_bresp(1 downto 0) => m13_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0),
      M_AXI_bvalid => m13_couplers_to_inst_interconnect_100MHz_BVALID,
      M_AXI_rdata(31 downto 0) => m13_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0),
      M_AXI_rready => m13_couplers_to_inst_interconnect_100MHz_RREADY,
      M_AXI_rresp(1 downto 0) => m13_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0),
      M_AXI_rvalid => m13_couplers_to_inst_interconnect_100MHz_RVALID,
      M_AXI_wdata(31 downto 0) => m13_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0),
      M_AXI_wready => m13_couplers_to_inst_interconnect_100MHz_WREADY,
      M_AXI_wvalid => m13_couplers_to_inst_interconnect_100MHz_WVALID,
      S_ACLK => inst_interconnect_100MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_100MHz_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m13_couplers_ARADDR(447 downto 416),
      S_AXI_arready => xbar_to_m13_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m13_couplers_ARVALID(13),
      S_AXI_awaddr(31 downto 0) => xbar_to_m13_couplers_AWADDR(447 downto 416),
      S_AXI_awready => xbar_to_m13_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m13_couplers_AWVALID(13),
      S_AXI_bready => xbar_to_m13_couplers_BREADY(13),
      S_AXI_bresp(1 downto 0) => xbar_to_m13_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m13_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m13_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m13_couplers_RREADY(13),
      S_AXI_rresp(1 downto 0) => xbar_to_m13_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m13_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m13_couplers_WDATA(447 downto 416),
      S_AXI_wready => xbar_to_m13_couplers_WREADY,
      S_AXI_wvalid => xbar_to_m13_couplers_WVALID(13)
    );
m14_couplers: entity work.m14_couplers_imp_KULMET
     port map (
      M_ACLK => M14_ACLK_1,
      M_ARESETN(0) => M14_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m14_couplers_to_inst_interconnect_100MHz_ARADDR(31 downto 0),
      M_AXI_arready => m14_couplers_to_inst_interconnect_100MHz_ARREADY,
      M_AXI_arvalid => m14_couplers_to_inst_interconnect_100MHz_ARVALID,
      M_AXI_awaddr(31 downto 0) => m14_couplers_to_inst_interconnect_100MHz_AWADDR(31 downto 0),
      M_AXI_awready => m14_couplers_to_inst_interconnect_100MHz_AWREADY,
      M_AXI_awvalid => m14_couplers_to_inst_interconnect_100MHz_AWVALID,
      M_AXI_bready => m14_couplers_to_inst_interconnect_100MHz_BREADY,
      M_AXI_bresp(1 downto 0) => m14_couplers_to_inst_interconnect_100MHz_BRESP(1 downto 0),
      M_AXI_bvalid => m14_couplers_to_inst_interconnect_100MHz_BVALID,
      M_AXI_rdata(31 downto 0) => m14_couplers_to_inst_interconnect_100MHz_RDATA(31 downto 0),
      M_AXI_rready => m14_couplers_to_inst_interconnect_100MHz_RREADY,
      M_AXI_rresp(1 downto 0) => m14_couplers_to_inst_interconnect_100MHz_RRESP(1 downto 0),
      M_AXI_rvalid => m14_couplers_to_inst_interconnect_100MHz_RVALID,
      M_AXI_wdata(31 downto 0) => m14_couplers_to_inst_interconnect_100MHz_WDATA(31 downto 0),
      M_AXI_wready => m14_couplers_to_inst_interconnect_100MHz_WREADY,
      M_AXI_wstrb(3 downto 0) => m14_couplers_to_inst_interconnect_100MHz_WSTRB(3 downto 0),
      M_AXI_wvalid => m14_couplers_to_inst_interconnect_100MHz_WVALID,
      S_ACLK => inst_interconnect_100MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_100MHz_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m14_couplers_ARADDR(479 downto 448),
      S_AXI_arready => xbar_to_m14_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m14_couplers_ARVALID(14),
      S_AXI_awaddr(31 downto 0) => xbar_to_m14_couplers_AWADDR(479 downto 448),
      S_AXI_awready => xbar_to_m14_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m14_couplers_AWVALID(14),
      S_AXI_bready => xbar_to_m14_couplers_BREADY(14),
      S_AXI_bresp(1 downto 0) => xbar_to_m14_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m14_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m14_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m14_couplers_RREADY(14),
      S_AXI_rresp(1 downto 0) => xbar_to_m14_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m14_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m14_couplers_WDATA(479 downto 448),
      S_AXI_wready => xbar_to_m14_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m14_couplers_WSTRB(59 downto 56),
      S_AXI_wvalid => xbar_to_m14_couplers_WVALID(14)
    );
s00_couplers: entity work.s00_couplers_imp_ULY0TL
     port map (
      M_ACLK => inst_interconnect_100MHz_ACLK_net,
      M_ARESETN(0) => inst_interconnect_100MHz_ARESETN_net(0),
      M_AXI_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arready => s00_couplers_to_xbar_ARREADY(0),
      M_AXI_arvalid => s00_couplers_to_xbar_ARVALID,
      M_AXI_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awready => s00_couplers_to_xbar_AWREADY(0),
      M_AXI_awvalid => s00_couplers_to_xbar_AWVALID,
      M_AXI_bready => s00_couplers_to_xbar_BREADY,
      M_AXI_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      M_AXI_bvalid => s00_couplers_to_xbar_BVALID(0),
      M_AXI_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      M_AXI_rready => s00_couplers_to_xbar_RREADY,
      M_AXI_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      M_AXI_rvalid => s00_couplers_to_xbar_RVALID(0),
      M_AXI_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      M_AXI_wready => s00_couplers_to_xbar_WREADY(0),
      M_AXI_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      M_AXI_wvalid => s00_couplers_to_xbar_WVALID,
      S_ACLK => S00_ACLK_1,
      S_ARESETN(0) => S00_ARESETN_1(0),
      S_AXI_araddr(31 downto 0) => inst_interconnect_100MHz_to_s00_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => inst_interconnect_100MHz_to_s00_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => inst_interconnect_100MHz_to_s00_couplers_ARCACHE(3 downto 0),
      S_AXI_arid(11 downto 0) => inst_interconnect_100MHz_to_s00_couplers_ARID(11 downto 0),
      S_AXI_arlen(3 downto 0) => inst_interconnect_100MHz_to_s00_couplers_ARLEN(3 downto 0),
      S_AXI_arlock(1 downto 0) => inst_interconnect_100MHz_to_s00_couplers_ARLOCK(1 downto 0),
      S_AXI_arprot(2 downto 0) => inst_interconnect_100MHz_to_s00_couplers_ARPROT(2 downto 0),
      S_AXI_arqos(3 downto 0) => inst_interconnect_100MHz_to_s00_couplers_ARQOS(3 downto 0),
      S_AXI_arready => inst_interconnect_100MHz_to_s00_couplers_ARREADY,
      S_AXI_arsize(2 downto 0) => inst_interconnect_100MHz_to_s00_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => inst_interconnect_100MHz_to_s00_couplers_ARVALID,
      S_AXI_awaddr(31 downto 0) => inst_interconnect_100MHz_to_s00_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => inst_interconnect_100MHz_to_s00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => inst_interconnect_100MHz_to_s00_couplers_AWCACHE(3 downto 0),
      S_AXI_awid(11 downto 0) => inst_interconnect_100MHz_to_s00_couplers_AWID(11 downto 0),
      S_AXI_awlen(3 downto 0) => inst_interconnect_100MHz_to_s00_couplers_AWLEN(3 downto 0),
      S_AXI_awlock(1 downto 0) => inst_interconnect_100MHz_to_s00_couplers_AWLOCK(1 downto 0),
      S_AXI_awprot(2 downto 0) => inst_interconnect_100MHz_to_s00_couplers_AWPROT(2 downto 0),
      S_AXI_awqos(3 downto 0) => inst_interconnect_100MHz_to_s00_couplers_AWQOS(3 downto 0),
      S_AXI_awready => inst_interconnect_100MHz_to_s00_couplers_AWREADY,
      S_AXI_awsize(2 downto 0) => inst_interconnect_100MHz_to_s00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => inst_interconnect_100MHz_to_s00_couplers_AWVALID,
      S_AXI_bid(11 downto 0) => inst_interconnect_100MHz_to_s00_couplers_BID(11 downto 0),
      S_AXI_bready => inst_interconnect_100MHz_to_s00_couplers_BREADY,
      S_AXI_bresp(1 downto 0) => inst_interconnect_100MHz_to_s00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => inst_interconnect_100MHz_to_s00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => inst_interconnect_100MHz_to_s00_couplers_RDATA(31 downto 0),
      S_AXI_rid(11 downto 0) => inst_interconnect_100MHz_to_s00_couplers_RID(11 downto 0),
      S_AXI_rlast => inst_interconnect_100MHz_to_s00_couplers_RLAST,
      S_AXI_rready => inst_interconnect_100MHz_to_s00_couplers_RREADY,
      S_AXI_rresp(1 downto 0) => inst_interconnect_100MHz_to_s00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => inst_interconnect_100MHz_to_s00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => inst_interconnect_100MHz_to_s00_couplers_WDATA(31 downto 0),
      S_AXI_wid(11 downto 0) => inst_interconnect_100MHz_to_s00_couplers_WID(11 downto 0),
      S_AXI_wlast => inst_interconnect_100MHz_to_s00_couplers_WLAST,
      S_AXI_wready => inst_interconnect_100MHz_to_s00_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => inst_interconnect_100MHz_to_s00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => inst_interconnect_100MHz_to_s00_couplers_WVALID
    );
xbar: component design_1_xbar_3
     port map (
      aclk => inst_interconnect_100MHz_ACLK_net,
      aresetn => inst_interconnect_100MHz_ARESETN_net(0),
      m_axi_araddr(479 downto 448) => xbar_to_m14_couplers_ARADDR(479 downto 448),
      m_axi_araddr(447 downto 416) => xbar_to_m13_couplers_ARADDR(447 downto 416),
      m_axi_araddr(415 downto 384) => xbar_to_m12_couplers_ARADDR(415 downto 384),
      m_axi_araddr(383 downto 352) => xbar_to_m11_couplers_ARADDR(383 downto 352),
      m_axi_araddr(351 downto 320) => xbar_to_m10_couplers_ARADDR(351 downto 320),
      m_axi_araddr(319 downto 288) => xbar_to_m09_couplers_ARADDR(319 downto 288),
      m_axi_araddr(287 downto 256) => xbar_to_m08_couplers_ARADDR(287 downto 256),
      m_axi_araddr(255 downto 224) => xbar_to_m07_couplers_ARADDR(255 downto 224),
      m_axi_araddr(223 downto 192) => xbar_to_m06_couplers_ARADDR(223 downto 192),
      m_axi_araddr(191 downto 160) => xbar_to_m05_couplers_ARADDR(191 downto 160),
      m_axi_araddr(159 downto 128) => xbar_to_m04_couplers_ARADDR(159 downto 128),
      m_axi_araddr(127 downto 96) => xbar_to_m03_couplers_ARADDR(127 downto 96),
      m_axi_araddr(95 downto 64) => xbar_to_m02_couplers_ARADDR(95 downto 64),
      m_axi_araddr(63 downto 32) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      m_axi_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arprot(44 downto 39) => NLW_xbar_m_axi_arprot_UNCONNECTED(44 downto 39),
      m_axi_arprot(38 downto 36) => xbar_to_m12_couplers_ARPROT(38 downto 36),
      m_axi_arprot(35 downto 33) => NLW_xbar_m_axi_arprot_UNCONNECTED(35 downto 33),
      m_axi_arprot(32 downto 30) => xbar_to_m10_couplers_ARPROT(32 downto 30),
      m_axi_arprot(29 downto 27) => xbar_to_m09_couplers_ARPROT(29 downto 27),
      m_axi_arprot(26 downto 24) => xbar_to_m08_couplers_ARPROT(26 downto 24),
      m_axi_arprot(23 downto 21) => xbar_to_m07_couplers_ARPROT(23 downto 21),
      m_axi_arprot(20 downto 18) => NLW_xbar_m_axi_arprot_UNCONNECTED(20 downto 18),
      m_axi_arprot(17 downto 15) => xbar_to_m05_couplers_ARPROT(17 downto 15),
      m_axi_arprot(14 downto 3) => NLW_xbar_m_axi_arprot_UNCONNECTED(14 downto 3),
      m_axi_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      m_axi_arready(14) => xbar_to_m14_couplers_ARREADY,
      m_axi_arready(13) => xbar_to_m13_couplers_ARREADY,
      m_axi_arready(12) => xbar_to_m12_couplers_ARREADY,
      m_axi_arready(11) => xbar_to_m11_couplers_ARREADY,
      m_axi_arready(10) => xbar_to_m10_couplers_ARREADY,
      m_axi_arready(9) => xbar_to_m09_couplers_ARREADY,
      m_axi_arready(8) => xbar_to_m08_couplers_ARREADY,
      m_axi_arready(7) => xbar_to_m07_couplers_ARREADY,
      m_axi_arready(6) => xbar_to_m06_couplers_ARREADY,
      m_axi_arready(5) => xbar_to_m05_couplers_ARREADY,
      m_axi_arready(4) => xbar_to_m04_couplers_ARREADY,
      m_axi_arready(3) => xbar_to_m03_couplers_ARREADY(0),
      m_axi_arready(2) => xbar_to_m02_couplers_ARREADY(0),
      m_axi_arready(1) => xbar_to_m01_couplers_ARREADY,
      m_axi_arready(0) => xbar_to_m00_couplers_ARREADY(0),
      m_axi_arvalid(14) => xbar_to_m14_couplers_ARVALID(14),
      m_axi_arvalid(13) => xbar_to_m13_couplers_ARVALID(13),
      m_axi_arvalid(12) => xbar_to_m12_couplers_ARVALID(12),
      m_axi_arvalid(11) => xbar_to_m11_couplers_ARVALID(11),
      m_axi_arvalid(10) => xbar_to_m10_couplers_ARVALID(10),
      m_axi_arvalid(9) => xbar_to_m09_couplers_ARVALID(9),
      m_axi_arvalid(8) => xbar_to_m08_couplers_ARVALID(8),
      m_axi_arvalid(7) => xbar_to_m07_couplers_ARVALID(7),
      m_axi_arvalid(6) => xbar_to_m06_couplers_ARVALID(6),
      m_axi_arvalid(5) => xbar_to_m05_couplers_ARVALID(5),
      m_axi_arvalid(4) => xbar_to_m04_couplers_ARVALID(4),
      m_axi_arvalid(3) => xbar_to_m03_couplers_ARVALID(3),
      m_axi_arvalid(2) => xbar_to_m02_couplers_ARVALID(2),
      m_axi_arvalid(1) => xbar_to_m01_couplers_ARVALID(1),
      m_axi_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      m_axi_awaddr(479 downto 448) => xbar_to_m14_couplers_AWADDR(479 downto 448),
      m_axi_awaddr(447 downto 416) => xbar_to_m13_couplers_AWADDR(447 downto 416),
      m_axi_awaddr(415 downto 384) => xbar_to_m12_couplers_AWADDR(415 downto 384),
      m_axi_awaddr(383 downto 352) => xbar_to_m11_couplers_AWADDR(383 downto 352),
      m_axi_awaddr(351 downto 320) => xbar_to_m10_couplers_AWADDR(351 downto 320),
      m_axi_awaddr(319 downto 288) => xbar_to_m09_couplers_AWADDR(319 downto 288),
      m_axi_awaddr(287 downto 256) => xbar_to_m08_couplers_AWADDR(287 downto 256),
      m_axi_awaddr(255 downto 224) => xbar_to_m07_couplers_AWADDR(255 downto 224),
      m_axi_awaddr(223 downto 192) => xbar_to_m06_couplers_AWADDR(223 downto 192),
      m_axi_awaddr(191 downto 160) => xbar_to_m05_couplers_AWADDR(191 downto 160),
      m_axi_awaddr(159 downto 128) => xbar_to_m04_couplers_AWADDR(159 downto 128),
      m_axi_awaddr(127 downto 96) => xbar_to_m03_couplers_AWADDR(127 downto 96),
      m_axi_awaddr(95 downto 64) => xbar_to_m02_couplers_AWADDR(95 downto 64),
      m_axi_awaddr(63 downto 32) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      m_axi_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awprot(44 downto 39) => NLW_xbar_m_axi_awprot_UNCONNECTED(44 downto 39),
      m_axi_awprot(38 downto 36) => xbar_to_m12_couplers_AWPROT(38 downto 36),
      m_axi_awprot(35 downto 33) => NLW_xbar_m_axi_awprot_UNCONNECTED(35 downto 33),
      m_axi_awprot(32 downto 30) => xbar_to_m10_couplers_AWPROT(32 downto 30),
      m_axi_awprot(29 downto 27) => xbar_to_m09_couplers_AWPROT(29 downto 27),
      m_axi_awprot(26 downto 24) => xbar_to_m08_couplers_AWPROT(26 downto 24),
      m_axi_awprot(23 downto 21) => xbar_to_m07_couplers_AWPROT(23 downto 21),
      m_axi_awprot(20 downto 18) => NLW_xbar_m_axi_awprot_UNCONNECTED(20 downto 18),
      m_axi_awprot(17 downto 15) => xbar_to_m05_couplers_AWPROT(17 downto 15),
      m_axi_awprot(14 downto 3) => NLW_xbar_m_axi_awprot_UNCONNECTED(14 downto 3),
      m_axi_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      m_axi_awready(14) => xbar_to_m14_couplers_AWREADY,
      m_axi_awready(13) => xbar_to_m13_couplers_AWREADY,
      m_axi_awready(12) => xbar_to_m12_couplers_AWREADY,
      m_axi_awready(11) => xbar_to_m11_couplers_AWREADY,
      m_axi_awready(10) => xbar_to_m10_couplers_AWREADY,
      m_axi_awready(9) => xbar_to_m09_couplers_AWREADY,
      m_axi_awready(8) => xbar_to_m08_couplers_AWREADY,
      m_axi_awready(7) => xbar_to_m07_couplers_AWREADY,
      m_axi_awready(6) => xbar_to_m06_couplers_AWREADY,
      m_axi_awready(5) => xbar_to_m05_couplers_AWREADY,
      m_axi_awready(4) => xbar_to_m04_couplers_AWREADY,
      m_axi_awready(3) => xbar_to_m03_couplers_AWREADY(0),
      m_axi_awready(2) => xbar_to_m02_couplers_AWREADY(0),
      m_axi_awready(1) => xbar_to_m01_couplers_AWREADY,
      m_axi_awready(0) => xbar_to_m00_couplers_AWREADY(0),
      m_axi_awvalid(14) => xbar_to_m14_couplers_AWVALID(14),
      m_axi_awvalid(13) => xbar_to_m13_couplers_AWVALID(13),
      m_axi_awvalid(12) => xbar_to_m12_couplers_AWVALID(12),
      m_axi_awvalid(11) => xbar_to_m11_couplers_AWVALID(11),
      m_axi_awvalid(10) => xbar_to_m10_couplers_AWVALID(10),
      m_axi_awvalid(9) => xbar_to_m09_couplers_AWVALID(9),
      m_axi_awvalid(8) => xbar_to_m08_couplers_AWVALID(8),
      m_axi_awvalid(7) => xbar_to_m07_couplers_AWVALID(7),
      m_axi_awvalid(6) => xbar_to_m06_couplers_AWVALID(6),
      m_axi_awvalid(5) => xbar_to_m05_couplers_AWVALID(5),
      m_axi_awvalid(4) => xbar_to_m04_couplers_AWVALID(4),
      m_axi_awvalid(3) => xbar_to_m03_couplers_AWVALID(3),
      m_axi_awvalid(2) => xbar_to_m02_couplers_AWVALID(2),
      m_axi_awvalid(1) => xbar_to_m01_couplers_AWVALID(1),
      m_axi_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      m_axi_bready(14) => xbar_to_m14_couplers_BREADY(14),
      m_axi_bready(13) => xbar_to_m13_couplers_BREADY(13),
      m_axi_bready(12) => xbar_to_m12_couplers_BREADY(12),
      m_axi_bready(11) => xbar_to_m11_couplers_BREADY(11),
      m_axi_bready(10) => xbar_to_m10_couplers_BREADY(10),
      m_axi_bready(9) => xbar_to_m09_couplers_BREADY(9),
      m_axi_bready(8) => xbar_to_m08_couplers_BREADY(8),
      m_axi_bready(7) => xbar_to_m07_couplers_BREADY(7),
      m_axi_bready(6) => xbar_to_m06_couplers_BREADY(6),
      m_axi_bready(5) => xbar_to_m05_couplers_BREADY(5),
      m_axi_bready(4) => xbar_to_m04_couplers_BREADY(4),
      m_axi_bready(3) => xbar_to_m03_couplers_BREADY(3),
      m_axi_bready(2) => xbar_to_m02_couplers_BREADY(2),
      m_axi_bready(1) => xbar_to_m01_couplers_BREADY(1),
      m_axi_bready(0) => xbar_to_m00_couplers_BREADY(0),
      m_axi_bresp(29 downto 28) => xbar_to_m14_couplers_BRESP(1 downto 0),
      m_axi_bresp(27 downto 26) => xbar_to_m13_couplers_BRESP(1 downto 0),
      m_axi_bresp(25 downto 24) => xbar_to_m12_couplers_BRESP(1 downto 0),
      m_axi_bresp(23 downto 22) => xbar_to_m11_couplers_BRESP(1 downto 0),
      m_axi_bresp(21 downto 20) => xbar_to_m10_couplers_BRESP(1 downto 0),
      m_axi_bresp(19 downto 18) => xbar_to_m09_couplers_BRESP(1 downto 0),
      m_axi_bresp(17 downto 16) => xbar_to_m08_couplers_BRESP(1 downto 0),
      m_axi_bresp(15 downto 14) => xbar_to_m07_couplers_BRESP(1 downto 0),
      m_axi_bresp(13 downto 12) => xbar_to_m06_couplers_BRESP(1 downto 0),
      m_axi_bresp(11 downto 10) => xbar_to_m05_couplers_BRESP(1 downto 0),
      m_axi_bresp(9 downto 8) => xbar_to_m04_couplers_BRESP(1 downto 0),
      m_axi_bresp(7 downto 6) => xbar_to_m03_couplers_BRESP(1 downto 0),
      m_axi_bresp(5 downto 4) => xbar_to_m02_couplers_BRESP(1 downto 0),
      m_axi_bresp(3 downto 2) => xbar_to_m01_couplers_BRESP(1 downto 0),
      m_axi_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid(14) => xbar_to_m14_couplers_BVALID,
      m_axi_bvalid(13) => xbar_to_m13_couplers_BVALID,
      m_axi_bvalid(12) => xbar_to_m12_couplers_BVALID,
      m_axi_bvalid(11) => xbar_to_m11_couplers_BVALID,
      m_axi_bvalid(10) => xbar_to_m10_couplers_BVALID,
      m_axi_bvalid(9) => xbar_to_m09_couplers_BVALID,
      m_axi_bvalid(8) => xbar_to_m08_couplers_BVALID,
      m_axi_bvalid(7) => xbar_to_m07_couplers_BVALID,
      m_axi_bvalid(6) => xbar_to_m06_couplers_BVALID,
      m_axi_bvalid(5) => xbar_to_m05_couplers_BVALID,
      m_axi_bvalid(4) => xbar_to_m04_couplers_BVALID,
      m_axi_bvalid(3) => xbar_to_m03_couplers_BVALID(0),
      m_axi_bvalid(2) => xbar_to_m02_couplers_BVALID(0),
      m_axi_bvalid(1) => xbar_to_m01_couplers_BVALID,
      m_axi_bvalid(0) => xbar_to_m00_couplers_BVALID(0),
      m_axi_rdata(479 downto 448) => xbar_to_m14_couplers_RDATA(31 downto 0),
      m_axi_rdata(447 downto 416) => xbar_to_m13_couplers_RDATA(31 downto 0),
      m_axi_rdata(415 downto 384) => xbar_to_m12_couplers_RDATA(31 downto 0),
      m_axi_rdata(383 downto 352) => xbar_to_m11_couplers_RDATA(31 downto 0),
      m_axi_rdata(351 downto 320) => xbar_to_m10_couplers_RDATA(31 downto 0),
      m_axi_rdata(319 downto 288) => xbar_to_m09_couplers_RDATA(31 downto 0),
      m_axi_rdata(287 downto 256) => xbar_to_m08_couplers_RDATA(31 downto 0),
      m_axi_rdata(255 downto 224) => xbar_to_m07_couplers_RDATA(31 downto 0),
      m_axi_rdata(223 downto 192) => xbar_to_m06_couplers_RDATA(31 downto 0),
      m_axi_rdata(191 downto 160) => xbar_to_m05_couplers_RDATA(31 downto 0),
      m_axi_rdata(159 downto 128) => xbar_to_m04_couplers_RDATA(31 downto 0),
      m_axi_rdata(127 downto 96) => xbar_to_m03_couplers_RDATA(31 downto 0),
      m_axi_rdata(95 downto 64) => xbar_to_m02_couplers_RDATA(31 downto 0),
      m_axi_rdata(63 downto 32) => xbar_to_m01_couplers_RDATA(31 downto 0),
      m_axi_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      m_axi_rready(14) => xbar_to_m14_couplers_RREADY(14),
      m_axi_rready(13) => xbar_to_m13_couplers_RREADY(13),
      m_axi_rready(12) => xbar_to_m12_couplers_RREADY(12),
      m_axi_rready(11) => xbar_to_m11_couplers_RREADY(11),
      m_axi_rready(10) => xbar_to_m10_couplers_RREADY(10),
      m_axi_rready(9) => xbar_to_m09_couplers_RREADY(9),
      m_axi_rready(8) => xbar_to_m08_couplers_RREADY(8),
      m_axi_rready(7) => xbar_to_m07_couplers_RREADY(7),
      m_axi_rready(6) => xbar_to_m06_couplers_RREADY(6),
      m_axi_rready(5) => xbar_to_m05_couplers_RREADY(5),
      m_axi_rready(4) => xbar_to_m04_couplers_RREADY(4),
      m_axi_rready(3) => xbar_to_m03_couplers_RREADY(3),
      m_axi_rready(2) => xbar_to_m02_couplers_RREADY(2),
      m_axi_rready(1) => xbar_to_m01_couplers_RREADY(1),
      m_axi_rready(0) => xbar_to_m00_couplers_RREADY(0),
      m_axi_rresp(29 downto 28) => xbar_to_m14_couplers_RRESP(1 downto 0),
      m_axi_rresp(27 downto 26) => xbar_to_m13_couplers_RRESP(1 downto 0),
      m_axi_rresp(25 downto 24) => xbar_to_m12_couplers_RRESP(1 downto 0),
      m_axi_rresp(23 downto 22) => xbar_to_m11_couplers_RRESP(1 downto 0),
      m_axi_rresp(21 downto 20) => xbar_to_m10_couplers_RRESP(1 downto 0),
      m_axi_rresp(19 downto 18) => xbar_to_m09_couplers_RRESP(1 downto 0),
      m_axi_rresp(17 downto 16) => xbar_to_m08_couplers_RRESP(1 downto 0),
      m_axi_rresp(15 downto 14) => xbar_to_m07_couplers_RRESP(1 downto 0),
      m_axi_rresp(13 downto 12) => xbar_to_m06_couplers_RRESP(1 downto 0),
      m_axi_rresp(11 downto 10) => xbar_to_m05_couplers_RRESP(1 downto 0),
      m_axi_rresp(9 downto 8) => xbar_to_m04_couplers_RRESP(1 downto 0),
      m_axi_rresp(7 downto 6) => xbar_to_m03_couplers_RRESP(1 downto 0),
      m_axi_rresp(5 downto 4) => xbar_to_m02_couplers_RRESP(1 downto 0),
      m_axi_rresp(3 downto 2) => xbar_to_m01_couplers_RRESP(1 downto 0),
      m_axi_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid(14) => xbar_to_m14_couplers_RVALID,
      m_axi_rvalid(13) => xbar_to_m13_couplers_RVALID,
      m_axi_rvalid(12) => xbar_to_m12_couplers_RVALID,
      m_axi_rvalid(11) => xbar_to_m11_couplers_RVALID,
      m_axi_rvalid(10) => xbar_to_m10_couplers_RVALID,
      m_axi_rvalid(9) => xbar_to_m09_couplers_RVALID,
      m_axi_rvalid(8) => xbar_to_m08_couplers_RVALID,
      m_axi_rvalid(7) => xbar_to_m07_couplers_RVALID,
      m_axi_rvalid(6) => xbar_to_m06_couplers_RVALID,
      m_axi_rvalid(5) => xbar_to_m05_couplers_RVALID,
      m_axi_rvalid(4) => xbar_to_m04_couplers_RVALID,
      m_axi_rvalid(3) => xbar_to_m03_couplers_RVALID(0),
      m_axi_rvalid(2) => xbar_to_m02_couplers_RVALID(0),
      m_axi_rvalid(1) => xbar_to_m01_couplers_RVALID,
      m_axi_rvalid(0) => xbar_to_m00_couplers_RVALID(0),
      m_axi_wdata(479 downto 448) => xbar_to_m14_couplers_WDATA(479 downto 448),
      m_axi_wdata(447 downto 416) => xbar_to_m13_couplers_WDATA(447 downto 416),
      m_axi_wdata(415 downto 384) => xbar_to_m12_couplers_WDATA(415 downto 384),
      m_axi_wdata(383 downto 352) => xbar_to_m11_couplers_WDATA(383 downto 352),
      m_axi_wdata(351 downto 320) => xbar_to_m10_couplers_WDATA(351 downto 320),
      m_axi_wdata(319 downto 288) => xbar_to_m09_couplers_WDATA(319 downto 288),
      m_axi_wdata(287 downto 256) => xbar_to_m08_couplers_WDATA(287 downto 256),
      m_axi_wdata(255 downto 224) => xbar_to_m07_couplers_WDATA(255 downto 224),
      m_axi_wdata(223 downto 192) => xbar_to_m06_couplers_WDATA(223 downto 192),
      m_axi_wdata(191 downto 160) => xbar_to_m05_couplers_WDATA(191 downto 160),
      m_axi_wdata(159 downto 128) => xbar_to_m04_couplers_WDATA(159 downto 128),
      m_axi_wdata(127 downto 96) => xbar_to_m03_couplers_WDATA(127 downto 96),
      m_axi_wdata(95 downto 64) => xbar_to_m02_couplers_WDATA(95 downto 64),
      m_axi_wdata(63 downto 32) => xbar_to_m01_couplers_WDATA(63 downto 32),
      m_axi_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      m_axi_wready(14) => xbar_to_m14_couplers_WREADY,
      m_axi_wready(13) => xbar_to_m13_couplers_WREADY,
      m_axi_wready(12) => xbar_to_m12_couplers_WREADY,
      m_axi_wready(11) => xbar_to_m11_couplers_WREADY,
      m_axi_wready(10) => xbar_to_m10_couplers_WREADY,
      m_axi_wready(9) => xbar_to_m09_couplers_WREADY,
      m_axi_wready(8) => xbar_to_m08_couplers_WREADY,
      m_axi_wready(7) => xbar_to_m07_couplers_WREADY,
      m_axi_wready(6) => xbar_to_m06_couplers_WREADY,
      m_axi_wready(5) => xbar_to_m05_couplers_WREADY,
      m_axi_wready(4) => xbar_to_m04_couplers_WREADY,
      m_axi_wready(3) => xbar_to_m03_couplers_WREADY(0),
      m_axi_wready(2) => xbar_to_m02_couplers_WREADY(0),
      m_axi_wready(1) => xbar_to_m01_couplers_WREADY,
      m_axi_wready(0) => xbar_to_m00_couplers_WREADY(0),
      m_axi_wstrb(59 downto 56) => xbar_to_m14_couplers_WSTRB(59 downto 56),
      m_axi_wstrb(55 downto 52) => NLW_xbar_m_axi_wstrb_UNCONNECTED(55 downto 52),
      m_axi_wstrb(51 downto 48) => xbar_to_m12_couplers_WSTRB(51 downto 48),
      m_axi_wstrb(47 downto 44) => NLW_xbar_m_axi_wstrb_UNCONNECTED(47 downto 44),
      m_axi_wstrb(43 downto 40) => xbar_to_m10_couplers_WSTRB(43 downto 40),
      m_axi_wstrb(39 downto 36) => xbar_to_m09_couplers_WSTRB(39 downto 36),
      m_axi_wstrb(35 downto 32) => xbar_to_m08_couplers_WSTRB(35 downto 32),
      m_axi_wstrb(31 downto 28) => xbar_to_m07_couplers_WSTRB(31 downto 28),
      m_axi_wstrb(27 downto 24) => xbar_to_m06_couplers_WSTRB(27 downto 24),
      m_axi_wstrb(23 downto 20) => xbar_to_m05_couplers_WSTRB(23 downto 20),
      m_axi_wstrb(19 downto 16) => xbar_to_m04_couplers_WSTRB(19 downto 16),
      m_axi_wstrb(15 downto 12) => xbar_to_m03_couplers_WSTRB(15 downto 12),
      m_axi_wstrb(11 downto 8) => xbar_to_m02_couplers_WSTRB(11 downto 8),
      m_axi_wstrb(7 downto 4) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      m_axi_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid(14) => xbar_to_m14_couplers_WVALID(14),
      m_axi_wvalid(13) => xbar_to_m13_couplers_WVALID(13),
      m_axi_wvalid(12) => xbar_to_m12_couplers_WVALID(12),
      m_axi_wvalid(11) => xbar_to_m11_couplers_WVALID(11),
      m_axi_wvalid(10) => xbar_to_m10_couplers_WVALID(10),
      m_axi_wvalid(9) => xbar_to_m09_couplers_WVALID(9),
      m_axi_wvalid(8) => xbar_to_m08_couplers_WVALID(8),
      m_axi_wvalid(7) => xbar_to_m07_couplers_WVALID(7),
      m_axi_wvalid(6) => xbar_to_m06_couplers_WVALID(6),
      m_axi_wvalid(5) => xbar_to_m05_couplers_WVALID(5),
      m_axi_wvalid(4) => xbar_to_m04_couplers_WVALID(4),
      m_axi_wvalid(3) => xbar_to_m03_couplers_WVALID(3),
      m_axi_wvalid(2) => xbar_to_m02_couplers_WVALID(2),
      m_axi_wvalid(1) => xbar_to_m01_couplers_WVALID(1),
      m_axi_wvalid(0) => xbar_to_m00_couplers_WVALID(0),
      s_axi_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      s_axi_arvalid(0) => s00_couplers_to_xbar_ARVALID,
      s_axi_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      s_axi_awvalid(0) => s00_couplers_to_xbar_AWVALID,
      s_axi_bready(0) => s00_couplers_to_xbar_BREADY,
      s_axi_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      s_axi_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      s_axi_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      s_axi_rready(0) => s00_couplers_to_xbar_RREADY,
      s_axi_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      s_axi_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      s_axi_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      s_axi_wready(0) => s00_couplers_to_xbar_WREADY(0),
      s_axi_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      s_axi_wvalid(0) => s00_couplers_to_xbar_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_inst_interconnect_200MHz_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rready : out STD_LOGIC;
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wvalid : out STD_LOGIC;
    M01_ACLK : in STD_LOGIC;
    M01_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_araddr : out STD_LOGIC;
    M01_AXI_arprot : out STD_LOGIC;
    M01_AXI_arready : in STD_LOGIC;
    M01_AXI_arvalid : out STD_LOGIC;
    M01_AXI_awaddr : out STD_LOGIC;
    M01_AXI_awprot : out STD_LOGIC;
    M01_AXI_awready : in STD_LOGIC;
    M01_AXI_awvalid : out STD_LOGIC;
    M01_AXI_bready : out STD_LOGIC;
    M01_AXI_bresp : in STD_LOGIC;
    M01_AXI_bvalid : in STD_LOGIC;
    M01_AXI_rdata : in STD_LOGIC;
    M01_AXI_rready : out STD_LOGIC;
    M01_AXI_rresp : in STD_LOGIC;
    M01_AXI_rvalid : in STD_LOGIC;
    M01_AXI_wdata : out STD_LOGIC;
    M01_AXI_wready : in STD_LOGIC;
    M01_AXI_wstrb : out STD_LOGIC;
    M01_AXI_wvalid : out STD_LOGIC;
    M02_ACLK : in STD_LOGIC;
    M02_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M02_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M02_AXI_arready : in STD_LOGIC;
    M02_AXI_arvalid : out STD_LOGIC;
    M02_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M02_AXI_awready : in STD_LOGIC;
    M02_AXI_awvalid : out STD_LOGIC;
    M02_AXI_bready : out STD_LOGIC;
    M02_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_bvalid : in STD_LOGIC;
    M02_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_rready : out STD_LOGIC;
    M02_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_rvalid : in STD_LOGIC;
    M02_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_wready : in STD_LOGIC;
    M02_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M02_AXI_wvalid : out STD_LOGIC;
    M03_ACLK : in STD_LOGIC;
    M03_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M03_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M03_AXI_arready : in STD_LOGIC;
    M03_AXI_arvalid : out STD_LOGIC;
    M03_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M03_AXI_awready : in STD_LOGIC;
    M03_AXI_awvalid : out STD_LOGIC;
    M03_AXI_bready : out STD_LOGIC;
    M03_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_bvalid : in STD_LOGIC;
    M03_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_rready : out STD_LOGIC;
    M03_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_rvalid : in STD_LOGIC;
    M03_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_wready : in STD_LOGIC;
    M03_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M03_AXI_wvalid : out STD_LOGIC;
    M04_ACLK : in STD_LOGIC;
    M04_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M04_AXI_araddr : out STD_LOGIC;
    M04_AXI_arprot : out STD_LOGIC;
    M04_AXI_arready : in STD_LOGIC;
    M04_AXI_arvalid : out STD_LOGIC;
    M04_AXI_awaddr : out STD_LOGIC;
    M04_AXI_awprot : out STD_LOGIC;
    M04_AXI_awready : in STD_LOGIC;
    M04_AXI_awvalid : out STD_LOGIC;
    M04_AXI_bready : out STD_LOGIC;
    M04_AXI_bresp : in STD_LOGIC;
    M04_AXI_bvalid : in STD_LOGIC;
    M04_AXI_rdata : in STD_LOGIC;
    M04_AXI_rready : out STD_LOGIC;
    M04_AXI_rresp : in STD_LOGIC;
    M04_AXI_rvalid : in STD_LOGIC;
    M04_AXI_wdata : out STD_LOGIC;
    M04_AXI_wready : in STD_LOGIC;
    M04_AXI_wstrb : out STD_LOGIC;
    M04_AXI_wvalid : out STD_LOGIC;
    M05_ACLK : in STD_LOGIC;
    M05_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M05_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_arready : in STD_LOGIC;
    M05_AXI_arvalid : out STD_LOGIC;
    M05_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_awready : in STD_LOGIC;
    M05_AXI_awvalid : out STD_LOGIC;
    M05_AXI_bready : out STD_LOGIC;
    M05_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_bvalid : in STD_LOGIC;
    M05_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_rready : out STD_LOGIC;
    M05_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_rvalid : in STD_LOGIC;
    M05_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_wready : in STD_LOGIC;
    M05_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M05_AXI_wvalid : out STD_LOGIC;
    M06_ACLK : in STD_LOGIC;
    M06_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    M06_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_arready : in STD_LOGIC;
    M06_AXI_arvalid : out STD_LOGIC;
    M06_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_awready : in STD_LOGIC;
    M06_AXI_awvalid : out STD_LOGIC;
    M06_AXI_bready : out STD_LOGIC;
    M06_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_bvalid : in STD_LOGIC;
    M06_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_rready : out STD_LOGIC;
    M06_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_rvalid : in STD_LOGIC;
    M06_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_wready : in STD_LOGIC;
    M06_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M06_AXI_wvalid : out STD_LOGIC;
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC
  );
end design_1_inst_interconnect_200MHz_0;

architecture STRUCTURE of design_1_inst_interconnect_200MHz_0 is
  component design_1_xbar_1 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 223 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 20 downto 0 );
    m_axi_awvalid : out STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_awready : in STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 223 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 27 downto 0 );
    m_axi_wvalid : out STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_wready : in STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 13 downto 0 );
    m_axi_bvalid : in STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_bready : out STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 223 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 20 downto 0 );
    m_axi_arvalid : out STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_arready : in STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 223 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 13 downto 0 );
    m_axi_rvalid : in STD_LOGIC_VECTOR ( 6 downto 0 );
    m_axi_rready : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  end component design_1_xbar_1;
  signal M00_ACLK_1 : STD_LOGIC;
  signal M00_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M01_ACLK_1 : STD_LOGIC;
  signal M01_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M02_ACLK_1 : STD_LOGIC;
  signal M02_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M03_ACLK_1 : STD_LOGIC;
  signal M03_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M04_ACLK_1 : STD_LOGIC;
  signal M04_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M05_ACLK_1 : STD_LOGIC;
  signal M05_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal M06_ACLK_1 : STD_LOGIC;
  signal M06_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S00_ACLK_1 : STD_LOGIC;
  signal S00_ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal inst_interconnect_200MHz_ACLK_net : STD_LOGIC;
  signal inst_interconnect_200MHz_ARESETN_net : STD_LOGIC_VECTOR ( 0 to 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_ARREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_ARVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_AWREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_AWVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_to_s00_couplers_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_BREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_BVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_RLAST : STD_LOGIC;
  signal inst_interconnect_200MHz_to_s00_couplers_RREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_RVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_WLAST : STD_LOGIC;
  signal inst_interconnect_200MHz_to_s00_couplers_WREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_200MHz_to_s00_couplers_WVALID : STD_LOGIC;
  signal m00_couplers_to_inst_interconnect_200MHz_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_inst_interconnect_200MHz_ARREADY : STD_LOGIC;
  signal m00_couplers_to_inst_interconnect_200MHz_ARVALID : STD_LOGIC;
  signal m00_couplers_to_inst_interconnect_200MHz_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_inst_interconnect_200MHz_AWREADY : STD_LOGIC;
  signal m00_couplers_to_inst_interconnect_200MHz_AWVALID : STD_LOGIC;
  signal m00_couplers_to_inst_interconnect_200MHz_BREADY : STD_LOGIC;
  signal m00_couplers_to_inst_interconnect_200MHz_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_inst_interconnect_200MHz_BVALID : STD_LOGIC;
  signal m00_couplers_to_inst_interconnect_200MHz_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_inst_interconnect_200MHz_RREADY : STD_LOGIC;
  signal m00_couplers_to_inst_interconnect_200MHz_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_inst_interconnect_200MHz_RVALID : STD_LOGIC;
  signal m00_couplers_to_inst_interconnect_200MHz_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_inst_interconnect_200MHz_WREADY : STD_LOGIC;
  signal m00_couplers_to_inst_interconnect_200MHz_WVALID : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_200MHz_ARADDR : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_200MHz_ARPROT : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_200MHz_ARREADY : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_200MHz_ARVALID : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_200MHz_AWADDR : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_200MHz_AWPROT : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_200MHz_AWREADY : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_200MHz_AWVALID : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_200MHz_BREADY : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_200MHz_BRESP : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_200MHz_BVALID : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_200MHz_RDATA : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_200MHz_RREADY : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_200MHz_RRESP : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_200MHz_RVALID : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_200MHz_WDATA : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_200MHz_WREADY : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_200MHz_WSTRB : STD_LOGIC;
  signal m01_couplers_to_inst_interconnect_200MHz_WVALID : STD_LOGIC;
  signal m02_couplers_to_inst_interconnect_200MHz_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_inst_interconnect_200MHz_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_inst_interconnect_200MHz_ARREADY : STD_LOGIC;
  signal m02_couplers_to_inst_interconnect_200MHz_ARVALID : STD_LOGIC;
  signal m02_couplers_to_inst_interconnect_200MHz_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_inst_interconnect_200MHz_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_inst_interconnect_200MHz_AWREADY : STD_LOGIC;
  signal m02_couplers_to_inst_interconnect_200MHz_AWVALID : STD_LOGIC;
  signal m02_couplers_to_inst_interconnect_200MHz_BREADY : STD_LOGIC;
  signal m02_couplers_to_inst_interconnect_200MHz_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_inst_interconnect_200MHz_BVALID : STD_LOGIC;
  signal m02_couplers_to_inst_interconnect_200MHz_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_inst_interconnect_200MHz_RREADY : STD_LOGIC;
  signal m02_couplers_to_inst_interconnect_200MHz_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_inst_interconnect_200MHz_RVALID : STD_LOGIC;
  signal m02_couplers_to_inst_interconnect_200MHz_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_inst_interconnect_200MHz_WREADY : STD_LOGIC;
  signal m02_couplers_to_inst_interconnect_200MHz_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_inst_interconnect_200MHz_WVALID : STD_LOGIC;
  signal m03_couplers_to_inst_interconnect_200MHz_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_inst_interconnect_200MHz_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_inst_interconnect_200MHz_ARREADY : STD_LOGIC;
  signal m03_couplers_to_inst_interconnect_200MHz_ARVALID : STD_LOGIC;
  signal m03_couplers_to_inst_interconnect_200MHz_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_inst_interconnect_200MHz_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_inst_interconnect_200MHz_AWREADY : STD_LOGIC;
  signal m03_couplers_to_inst_interconnect_200MHz_AWVALID : STD_LOGIC;
  signal m03_couplers_to_inst_interconnect_200MHz_BREADY : STD_LOGIC;
  signal m03_couplers_to_inst_interconnect_200MHz_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_inst_interconnect_200MHz_BVALID : STD_LOGIC;
  signal m03_couplers_to_inst_interconnect_200MHz_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_inst_interconnect_200MHz_RREADY : STD_LOGIC;
  signal m03_couplers_to_inst_interconnect_200MHz_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_inst_interconnect_200MHz_RVALID : STD_LOGIC;
  signal m03_couplers_to_inst_interconnect_200MHz_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_inst_interconnect_200MHz_WREADY : STD_LOGIC;
  signal m03_couplers_to_inst_interconnect_200MHz_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_inst_interconnect_200MHz_WVALID : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_200MHz_ARADDR : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_200MHz_ARPROT : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_200MHz_ARREADY : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_200MHz_ARVALID : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_200MHz_AWADDR : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_200MHz_AWPROT : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_200MHz_AWREADY : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_200MHz_AWVALID : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_200MHz_BREADY : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_200MHz_BRESP : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_200MHz_BVALID : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_200MHz_RDATA : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_200MHz_RREADY : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_200MHz_RRESP : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_200MHz_RVALID : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_200MHz_WDATA : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_200MHz_WREADY : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_200MHz_WSTRB : STD_LOGIC;
  signal m04_couplers_to_inst_interconnect_200MHz_WVALID : STD_LOGIC;
  signal m05_couplers_to_inst_interconnect_200MHz_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_inst_interconnect_200MHz_ARREADY : STD_LOGIC;
  signal m05_couplers_to_inst_interconnect_200MHz_ARVALID : STD_LOGIC;
  signal m05_couplers_to_inst_interconnect_200MHz_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_inst_interconnect_200MHz_AWREADY : STD_LOGIC;
  signal m05_couplers_to_inst_interconnect_200MHz_AWVALID : STD_LOGIC;
  signal m05_couplers_to_inst_interconnect_200MHz_BREADY : STD_LOGIC;
  signal m05_couplers_to_inst_interconnect_200MHz_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_inst_interconnect_200MHz_BVALID : STD_LOGIC;
  signal m05_couplers_to_inst_interconnect_200MHz_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_inst_interconnect_200MHz_RREADY : STD_LOGIC;
  signal m05_couplers_to_inst_interconnect_200MHz_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_inst_interconnect_200MHz_RVALID : STD_LOGIC;
  signal m05_couplers_to_inst_interconnect_200MHz_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_inst_interconnect_200MHz_WREADY : STD_LOGIC;
  signal m05_couplers_to_inst_interconnect_200MHz_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m05_couplers_to_inst_interconnect_200MHz_WVALID : STD_LOGIC;
  signal m06_couplers_to_inst_interconnect_200MHz_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_inst_interconnect_200MHz_ARREADY : STD_LOGIC;
  signal m06_couplers_to_inst_interconnect_200MHz_ARVALID : STD_LOGIC;
  signal m06_couplers_to_inst_interconnect_200MHz_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_inst_interconnect_200MHz_AWREADY : STD_LOGIC;
  signal m06_couplers_to_inst_interconnect_200MHz_AWVALID : STD_LOGIC;
  signal m06_couplers_to_inst_interconnect_200MHz_BREADY : STD_LOGIC;
  signal m06_couplers_to_inst_interconnect_200MHz_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_inst_interconnect_200MHz_BVALID : STD_LOGIC;
  signal m06_couplers_to_inst_interconnect_200MHz_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_inst_interconnect_200MHz_RREADY : STD_LOGIC;
  signal m06_couplers_to_inst_interconnect_200MHz_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_inst_interconnect_200MHz_RVALID : STD_LOGIC;
  signal m06_couplers_to_inst_interconnect_200MHz_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_inst_interconnect_200MHz_WREADY : STD_LOGIC;
  signal m06_couplers_to_inst_interconnect_200MHz_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m06_couplers_to_inst_interconnect_200MHz_WVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_BREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_RREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_WVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_ARVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_AWVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BRESP : STD_LOGIC;
  signal xbar_to_m01_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_RDATA : STD_LOGIC;
  signal xbar_to_m01_couplers_RREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_RRESP : STD_LOGIC;
  signal xbar_to_m01_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_WVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m02_couplers_ARADDR : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_ARPROT : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal xbar_to_m02_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_ARVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_AWADDR : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_AWPROT : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal xbar_to_m02_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_AWVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_BREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m02_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m02_couplers_RREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m02_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m02_couplers_WDATA : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_WSTRB : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_WVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_ARPROT : STD_LOGIC_VECTOR ( 11 downto 9 );
  signal xbar_to_m03_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_ARVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_AWPROT : STD_LOGIC_VECTOR ( 11 downto 9 );
  signal xbar_to_m03_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_AWVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m03_couplers_RREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_WSTRB : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_WVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m04_couplers_ARADDR : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_ARPROT : STD_LOGIC_VECTOR ( 14 downto 12 );
  signal xbar_to_m04_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_ARVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_AWADDR : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_AWPROT : STD_LOGIC_VECTOR ( 14 downto 12 );
  signal xbar_to_m04_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_AWVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_BREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_BRESP : STD_LOGIC;
  signal xbar_to_m04_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m04_couplers_RDATA : STD_LOGIC;
  signal xbar_to_m04_couplers_RREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_RRESP : STD_LOGIC;
  signal xbar_to_m04_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m04_couplers_WDATA : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_WSTRB : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_WVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m05_couplers_ARADDR : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_ARVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_AWADDR : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_AWVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_BREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m05_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m05_couplers_RREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m05_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m05_couplers_WDATA : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_WSTRB : STD_LOGIC_VECTOR ( 23 downto 20 );
  signal xbar_to_m05_couplers_WVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m06_couplers_ARADDR : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m06_couplers_ARVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_AWADDR : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m06_couplers_AWVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_BREADY : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m06_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m06_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m06_couplers_RREADY : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m06_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m06_couplers_WDATA : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m06_couplers_WSTRB : STD_LOGIC_VECTOR ( 27 downto 24 );
  signal xbar_to_m06_couplers_WVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal NLW_xbar_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 20 downto 0 );
  signal NLW_xbar_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 20 downto 0 );
  signal NLW_xbar_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  M00_ACLK_1 <= M00_ACLK;
  M00_ARESETN_1(0) <= M00_ARESETN(0);
  M00_AXI_araddr(31 downto 0) <= m00_couplers_to_inst_interconnect_200MHz_ARADDR(31 downto 0);
  M00_AXI_arvalid <= m00_couplers_to_inst_interconnect_200MHz_ARVALID;
  M00_AXI_awaddr(31 downto 0) <= m00_couplers_to_inst_interconnect_200MHz_AWADDR(31 downto 0);
  M00_AXI_awvalid <= m00_couplers_to_inst_interconnect_200MHz_AWVALID;
  M00_AXI_bready <= m00_couplers_to_inst_interconnect_200MHz_BREADY;
  M00_AXI_rready <= m00_couplers_to_inst_interconnect_200MHz_RREADY;
  M00_AXI_wdata(31 downto 0) <= m00_couplers_to_inst_interconnect_200MHz_WDATA(31 downto 0);
  M00_AXI_wvalid <= m00_couplers_to_inst_interconnect_200MHz_WVALID;
  M01_ACLK_1 <= M01_ACLK;
  M01_ARESETN_1(0) <= M01_ARESETN(0);
  M01_AXI_araddr <= m01_couplers_to_inst_interconnect_200MHz_ARADDR;
  M01_AXI_arprot <= m01_couplers_to_inst_interconnect_200MHz_ARPROT;
  M01_AXI_arvalid <= m01_couplers_to_inst_interconnect_200MHz_ARVALID;
  M01_AXI_awaddr <= m01_couplers_to_inst_interconnect_200MHz_AWADDR;
  M01_AXI_awprot <= m01_couplers_to_inst_interconnect_200MHz_AWPROT;
  M01_AXI_awvalid <= m01_couplers_to_inst_interconnect_200MHz_AWVALID;
  M01_AXI_bready <= m01_couplers_to_inst_interconnect_200MHz_BREADY;
  M01_AXI_rready <= m01_couplers_to_inst_interconnect_200MHz_RREADY;
  M01_AXI_wdata <= m01_couplers_to_inst_interconnect_200MHz_WDATA;
  M01_AXI_wstrb <= m01_couplers_to_inst_interconnect_200MHz_WSTRB;
  M01_AXI_wvalid <= m01_couplers_to_inst_interconnect_200MHz_WVALID;
  M02_ACLK_1 <= M02_ACLK;
  M02_ARESETN_1(0) <= M02_ARESETN(0);
  M02_AXI_araddr(31 downto 0) <= m02_couplers_to_inst_interconnect_200MHz_ARADDR(31 downto 0);
  M02_AXI_arprot(2 downto 0) <= m02_couplers_to_inst_interconnect_200MHz_ARPROT(2 downto 0);
  M02_AXI_arvalid <= m02_couplers_to_inst_interconnect_200MHz_ARVALID;
  M02_AXI_awaddr(31 downto 0) <= m02_couplers_to_inst_interconnect_200MHz_AWADDR(31 downto 0);
  M02_AXI_awprot(2 downto 0) <= m02_couplers_to_inst_interconnect_200MHz_AWPROT(2 downto 0);
  M02_AXI_awvalid <= m02_couplers_to_inst_interconnect_200MHz_AWVALID;
  M02_AXI_bready <= m02_couplers_to_inst_interconnect_200MHz_BREADY;
  M02_AXI_rready <= m02_couplers_to_inst_interconnect_200MHz_RREADY;
  M02_AXI_wdata(31 downto 0) <= m02_couplers_to_inst_interconnect_200MHz_WDATA(31 downto 0);
  M02_AXI_wstrb(3 downto 0) <= m02_couplers_to_inst_interconnect_200MHz_WSTRB(3 downto 0);
  M02_AXI_wvalid <= m02_couplers_to_inst_interconnect_200MHz_WVALID;
  M03_ACLK_1 <= M03_ACLK;
  M03_ARESETN_1(0) <= M03_ARESETN(0);
  M03_AXI_araddr(31 downto 0) <= m03_couplers_to_inst_interconnect_200MHz_ARADDR(31 downto 0);
  M03_AXI_arprot(2 downto 0) <= m03_couplers_to_inst_interconnect_200MHz_ARPROT(2 downto 0);
  M03_AXI_arvalid <= m03_couplers_to_inst_interconnect_200MHz_ARVALID;
  M03_AXI_awaddr(31 downto 0) <= m03_couplers_to_inst_interconnect_200MHz_AWADDR(31 downto 0);
  M03_AXI_awprot(2 downto 0) <= m03_couplers_to_inst_interconnect_200MHz_AWPROT(2 downto 0);
  M03_AXI_awvalid <= m03_couplers_to_inst_interconnect_200MHz_AWVALID;
  M03_AXI_bready <= m03_couplers_to_inst_interconnect_200MHz_BREADY;
  M03_AXI_rready <= m03_couplers_to_inst_interconnect_200MHz_RREADY;
  M03_AXI_wdata(31 downto 0) <= m03_couplers_to_inst_interconnect_200MHz_WDATA(31 downto 0);
  M03_AXI_wstrb(3 downto 0) <= m03_couplers_to_inst_interconnect_200MHz_WSTRB(3 downto 0);
  M03_AXI_wvalid <= m03_couplers_to_inst_interconnect_200MHz_WVALID;
  M04_ACLK_1 <= M04_ACLK;
  M04_ARESETN_1(0) <= M04_ARESETN(0);
  M04_AXI_araddr <= m04_couplers_to_inst_interconnect_200MHz_ARADDR;
  M04_AXI_arprot <= m04_couplers_to_inst_interconnect_200MHz_ARPROT;
  M04_AXI_arvalid <= m04_couplers_to_inst_interconnect_200MHz_ARVALID;
  M04_AXI_awaddr <= m04_couplers_to_inst_interconnect_200MHz_AWADDR;
  M04_AXI_awprot <= m04_couplers_to_inst_interconnect_200MHz_AWPROT;
  M04_AXI_awvalid <= m04_couplers_to_inst_interconnect_200MHz_AWVALID;
  M04_AXI_bready <= m04_couplers_to_inst_interconnect_200MHz_BREADY;
  M04_AXI_rready <= m04_couplers_to_inst_interconnect_200MHz_RREADY;
  M04_AXI_wdata <= m04_couplers_to_inst_interconnect_200MHz_WDATA;
  M04_AXI_wstrb <= m04_couplers_to_inst_interconnect_200MHz_WSTRB;
  M04_AXI_wvalid <= m04_couplers_to_inst_interconnect_200MHz_WVALID;
  M05_ACLK_1 <= M05_ACLK;
  M05_ARESETN_1(0) <= M05_ARESETN(0);
  M05_AXI_araddr(31 downto 0) <= m05_couplers_to_inst_interconnect_200MHz_ARADDR(31 downto 0);
  M05_AXI_arvalid <= m05_couplers_to_inst_interconnect_200MHz_ARVALID;
  M05_AXI_awaddr(31 downto 0) <= m05_couplers_to_inst_interconnect_200MHz_AWADDR(31 downto 0);
  M05_AXI_awvalid <= m05_couplers_to_inst_interconnect_200MHz_AWVALID;
  M05_AXI_bready <= m05_couplers_to_inst_interconnect_200MHz_BREADY;
  M05_AXI_rready <= m05_couplers_to_inst_interconnect_200MHz_RREADY;
  M05_AXI_wdata(31 downto 0) <= m05_couplers_to_inst_interconnect_200MHz_WDATA(31 downto 0);
  M05_AXI_wstrb(3 downto 0) <= m05_couplers_to_inst_interconnect_200MHz_WSTRB(3 downto 0);
  M05_AXI_wvalid <= m05_couplers_to_inst_interconnect_200MHz_WVALID;
  M06_ACLK_1 <= M06_ACLK;
  M06_ARESETN_1(0) <= M06_ARESETN(0);
  M06_AXI_araddr(31 downto 0) <= m06_couplers_to_inst_interconnect_200MHz_ARADDR(31 downto 0);
  M06_AXI_arvalid <= m06_couplers_to_inst_interconnect_200MHz_ARVALID;
  M06_AXI_awaddr(31 downto 0) <= m06_couplers_to_inst_interconnect_200MHz_AWADDR(31 downto 0);
  M06_AXI_awvalid <= m06_couplers_to_inst_interconnect_200MHz_AWVALID;
  M06_AXI_bready <= m06_couplers_to_inst_interconnect_200MHz_BREADY;
  M06_AXI_rready <= m06_couplers_to_inst_interconnect_200MHz_RREADY;
  M06_AXI_wdata(31 downto 0) <= m06_couplers_to_inst_interconnect_200MHz_WDATA(31 downto 0);
  M06_AXI_wstrb(3 downto 0) <= m06_couplers_to_inst_interconnect_200MHz_WSTRB(3 downto 0);
  M06_AXI_wvalid <= m06_couplers_to_inst_interconnect_200MHz_WVALID;
  S00_ACLK_1 <= S00_ACLK;
  S00_ARESETN_1(0) <= S00_ARESETN(0);
  S00_AXI_arready <= inst_interconnect_200MHz_to_s00_couplers_ARREADY;
  S00_AXI_awready <= inst_interconnect_200MHz_to_s00_couplers_AWREADY;
  S00_AXI_bid(11 downto 0) <= inst_interconnect_200MHz_to_s00_couplers_BID(11 downto 0);
  S00_AXI_bresp(1 downto 0) <= inst_interconnect_200MHz_to_s00_couplers_BRESP(1 downto 0);
  S00_AXI_bvalid <= inst_interconnect_200MHz_to_s00_couplers_BVALID;
  S00_AXI_rdata(31 downto 0) <= inst_interconnect_200MHz_to_s00_couplers_RDATA(31 downto 0);
  S00_AXI_rid(11 downto 0) <= inst_interconnect_200MHz_to_s00_couplers_RID(11 downto 0);
  S00_AXI_rlast <= inst_interconnect_200MHz_to_s00_couplers_RLAST;
  S00_AXI_rresp(1 downto 0) <= inst_interconnect_200MHz_to_s00_couplers_RRESP(1 downto 0);
  S00_AXI_rvalid <= inst_interconnect_200MHz_to_s00_couplers_RVALID;
  S00_AXI_wready <= inst_interconnect_200MHz_to_s00_couplers_WREADY;
  inst_interconnect_200MHz_ACLK_net <= ACLK;
  inst_interconnect_200MHz_ARESETN_net(0) <= ARESETN(0);
  inst_interconnect_200MHz_to_s00_couplers_ARADDR(31 downto 0) <= S00_AXI_araddr(31 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_ARBURST(1 downto 0) <= S00_AXI_arburst(1 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_ARCACHE(3 downto 0) <= S00_AXI_arcache(3 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_ARID(11 downto 0) <= S00_AXI_arid(11 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_ARLEN(3 downto 0) <= S00_AXI_arlen(3 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_ARLOCK(1 downto 0) <= S00_AXI_arlock(1 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_ARPROT(2 downto 0) <= S00_AXI_arprot(2 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_ARQOS(3 downto 0) <= S00_AXI_arqos(3 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_ARSIZE(2 downto 0) <= S00_AXI_arsize(2 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_ARVALID <= S00_AXI_arvalid;
  inst_interconnect_200MHz_to_s00_couplers_AWADDR(31 downto 0) <= S00_AXI_awaddr(31 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_AWBURST(1 downto 0) <= S00_AXI_awburst(1 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_AWCACHE(3 downto 0) <= S00_AXI_awcache(3 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_AWID(11 downto 0) <= S00_AXI_awid(11 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_AWLEN(3 downto 0) <= S00_AXI_awlen(3 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_AWLOCK(1 downto 0) <= S00_AXI_awlock(1 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_AWPROT(2 downto 0) <= S00_AXI_awprot(2 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_AWQOS(3 downto 0) <= S00_AXI_awqos(3 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_AWSIZE(2 downto 0) <= S00_AXI_awsize(2 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_AWVALID <= S00_AXI_awvalid;
  inst_interconnect_200MHz_to_s00_couplers_BREADY <= S00_AXI_bready;
  inst_interconnect_200MHz_to_s00_couplers_RREADY <= S00_AXI_rready;
  inst_interconnect_200MHz_to_s00_couplers_WDATA(31 downto 0) <= S00_AXI_wdata(31 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_WID(11 downto 0) <= S00_AXI_wid(11 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_WLAST <= S00_AXI_wlast;
  inst_interconnect_200MHz_to_s00_couplers_WSTRB(3 downto 0) <= S00_AXI_wstrb(3 downto 0);
  inst_interconnect_200MHz_to_s00_couplers_WVALID <= S00_AXI_wvalid;
  m00_couplers_to_inst_interconnect_200MHz_ARREADY <= M00_AXI_arready;
  m00_couplers_to_inst_interconnect_200MHz_AWREADY <= M00_AXI_awready;
  m00_couplers_to_inst_interconnect_200MHz_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  m00_couplers_to_inst_interconnect_200MHz_BVALID <= M00_AXI_bvalid;
  m00_couplers_to_inst_interconnect_200MHz_RDATA(31 downto 0) <= M00_AXI_rdata(31 downto 0);
  m00_couplers_to_inst_interconnect_200MHz_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  m00_couplers_to_inst_interconnect_200MHz_RVALID <= M00_AXI_rvalid;
  m00_couplers_to_inst_interconnect_200MHz_WREADY <= M00_AXI_wready;
  m01_couplers_to_inst_interconnect_200MHz_ARREADY <= M01_AXI_arready;
  m01_couplers_to_inst_interconnect_200MHz_AWREADY <= M01_AXI_awready;
  m01_couplers_to_inst_interconnect_200MHz_BRESP <= M01_AXI_bresp;
  m01_couplers_to_inst_interconnect_200MHz_BVALID <= M01_AXI_bvalid;
  m01_couplers_to_inst_interconnect_200MHz_RDATA <= M01_AXI_rdata;
  m01_couplers_to_inst_interconnect_200MHz_RRESP <= M01_AXI_rresp;
  m01_couplers_to_inst_interconnect_200MHz_RVALID <= M01_AXI_rvalid;
  m01_couplers_to_inst_interconnect_200MHz_WREADY <= M01_AXI_wready;
  m02_couplers_to_inst_interconnect_200MHz_ARREADY <= M02_AXI_arready;
  m02_couplers_to_inst_interconnect_200MHz_AWREADY <= M02_AXI_awready;
  m02_couplers_to_inst_interconnect_200MHz_BRESP(1 downto 0) <= M02_AXI_bresp(1 downto 0);
  m02_couplers_to_inst_interconnect_200MHz_BVALID <= M02_AXI_bvalid;
  m02_couplers_to_inst_interconnect_200MHz_RDATA(31 downto 0) <= M02_AXI_rdata(31 downto 0);
  m02_couplers_to_inst_interconnect_200MHz_RRESP(1 downto 0) <= M02_AXI_rresp(1 downto 0);
  m02_couplers_to_inst_interconnect_200MHz_RVALID <= M02_AXI_rvalid;
  m02_couplers_to_inst_interconnect_200MHz_WREADY <= M02_AXI_wready;
  m03_couplers_to_inst_interconnect_200MHz_ARREADY <= M03_AXI_arready;
  m03_couplers_to_inst_interconnect_200MHz_AWREADY <= M03_AXI_awready;
  m03_couplers_to_inst_interconnect_200MHz_BRESP(1 downto 0) <= M03_AXI_bresp(1 downto 0);
  m03_couplers_to_inst_interconnect_200MHz_BVALID <= M03_AXI_bvalid;
  m03_couplers_to_inst_interconnect_200MHz_RDATA(31 downto 0) <= M03_AXI_rdata(31 downto 0);
  m03_couplers_to_inst_interconnect_200MHz_RRESP(1 downto 0) <= M03_AXI_rresp(1 downto 0);
  m03_couplers_to_inst_interconnect_200MHz_RVALID <= M03_AXI_rvalid;
  m03_couplers_to_inst_interconnect_200MHz_WREADY <= M03_AXI_wready;
  m04_couplers_to_inst_interconnect_200MHz_ARREADY <= M04_AXI_arready;
  m04_couplers_to_inst_interconnect_200MHz_AWREADY <= M04_AXI_awready;
  m04_couplers_to_inst_interconnect_200MHz_BRESP <= M04_AXI_bresp;
  m04_couplers_to_inst_interconnect_200MHz_BVALID <= M04_AXI_bvalid;
  m04_couplers_to_inst_interconnect_200MHz_RDATA <= M04_AXI_rdata;
  m04_couplers_to_inst_interconnect_200MHz_RRESP <= M04_AXI_rresp;
  m04_couplers_to_inst_interconnect_200MHz_RVALID <= M04_AXI_rvalid;
  m04_couplers_to_inst_interconnect_200MHz_WREADY <= M04_AXI_wready;
  m05_couplers_to_inst_interconnect_200MHz_ARREADY <= M05_AXI_arready;
  m05_couplers_to_inst_interconnect_200MHz_AWREADY <= M05_AXI_awready;
  m05_couplers_to_inst_interconnect_200MHz_BRESP(1 downto 0) <= M05_AXI_bresp(1 downto 0);
  m05_couplers_to_inst_interconnect_200MHz_BVALID <= M05_AXI_bvalid;
  m05_couplers_to_inst_interconnect_200MHz_RDATA(31 downto 0) <= M05_AXI_rdata(31 downto 0);
  m05_couplers_to_inst_interconnect_200MHz_RRESP(1 downto 0) <= M05_AXI_rresp(1 downto 0);
  m05_couplers_to_inst_interconnect_200MHz_RVALID <= M05_AXI_rvalid;
  m05_couplers_to_inst_interconnect_200MHz_WREADY <= M05_AXI_wready;
  m06_couplers_to_inst_interconnect_200MHz_ARREADY <= M06_AXI_arready;
  m06_couplers_to_inst_interconnect_200MHz_AWREADY <= M06_AXI_awready;
  m06_couplers_to_inst_interconnect_200MHz_BRESP(1 downto 0) <= M06_AXI_bresp(1 downto 0);
  m06_couplers_to_inst_interconnect_200MHz_BVALID <= M06_AXI_bvalid;
  m06_couplers_to_inst_interconnect_200MHz_RDATA(31 downto 0) <= M06_AXI_rdata(31 downto 0);
  m06_couplers_to_inst_interconnect_200MHz_RRESP(1 downto 0) <= M06_AXI_rresp(1 downto 0);
  m06_couplers_to_inst_interconnect_200MHz_RVALID <= M06_AXI_rvalid;
  m06_couplers_to_inst_interconnect_200MHz_WREADY <= M06_AXI_wready;
m00_couplers: entity work.m00_couplers_imp_A9EIW8
     port map (
      M_ACLK => M00_ACLK_1,
      M_ARESETN(0) => M00_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m00_couplers_to_inst_interconnect_200MHz_ARADDR(31 downto 0),
      M_AXI_arready => m00_couplers_to_inst_interconnect_200MHz_ARREADY,
      M_AXI_arvalid => m00_couplers_to_inst_interconnect_200MHz_ARVALID,
      M_AXI_awaddr(31 downto 0) => m00_couplers_to_inst_interconnect_200MHz_AWADDR(31 downto 0),
      M_AXI_awready => m00_couplers_to_inst_interconnect_200MHz_AWREADY,
      M_AXI_awvalid => m00_couplers_to_inst_interconnect_200MHz_AWVALID,
      M_AXI_bready => m00_couplers_to_inst_interconnect_200MHz_BREADY,
      M_AXI_bresp(1 downto 0) => m00_couplers_to_inst_interconnect_200MHz_BRESP(1 downto 0),
      M_AXI_bvalid => m00_couplers_to_inst_interconnect_200MHz_BVALID,
      M_AXI_rdata(31 downto 0) => m00_couplers_to_inst_interconnect_200MHz_RDATA(31 downto 0),
      M_AXI_rready => m00_couplers_to_inst_interconnect_200MHz_RREADY,
      M_AXI_rresp(1 downto 0) => m00_couplers_to_inst_interconnect_200MHz_RRESP(1 downto 0),
      M_AXI_rvalid => m00_couplers_to_inst_interconnect_200MHz_RVALID,
      M_AXI_wdata(31 downto 0) => m00_couplers_to_inst_interconnect_200MHz_WDATA(31 downto 0),
      M_AXI_wready => m00_couplers_to_inst_interconnect_200MHz_WREADY,
      M_AXI_wvalid => m00_couplers_to_inst_interconnect_200MHz_WVALID,
      S_ACLK => inst_interconnect_200MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_200MHz_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      S_AXI_arready => xbar_to_m00_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m00_couplers_ARVALID(0),
      S_AXI_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      S_AXI_awready => xbar_to_m00_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m00_couplers_AWVALID(0),
      S_AXI_bready => xbar_to_m00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      S_AXI_wready => xbar_to_m00_couplers_WREADY,
      S_AXI_wvalid => xbar_to_m00_couplers_WVALID(0)
    );
m01_couplers: entity work.m01_couplers_imp_1KIC6O9
     port map (
      M_ACLK => M01_ACLK_1,
      M_ARESETN(0) => M01_ARESETN_1(0),
      M_AXI_araddr => m01_couplers_to_inst_interconnect_200MHz_ARADDR,
      M_AXI_arprot => m01_couplers_to_inst_interconnect_200MHz_ARPROT,
      M_AXI_arready => m01_couplers_to_inst_interconnect_200MHz_ARREADY,
      M_AXI_arvalid => m01_couplers_to_inst_interconnect_200MHz_ARVALID,
      M_AXI_awaddr => m01_couplers_to_inst_interconnect_200MHz_AWADDR,
      M_AXI_awprot => m01_couplers_to_inst_interconnect_200MHz_AWPROT,
      M_AXI_awready => m01_couplers_to_inst_interconnect_200MHz_AWREADY,
      M_AXI_awvalid => m01_couplers_to_inst_interconnect_200MHz_AWVALID,
      M_AXI_bready => m01_couplers_to_inst_interconnect_200MHz_BREADY,
      M_AXI_bresp => m01_couplers_to_inst_interconnect_200MHz_BRESP,
      M_AXI_bvalid => m01_couplers_to_inst_interconnect_200MHz_BVALID,
      M_AXI_rdata => m01_couplers_to_inst_interconnect_200MHz_RDATA,
      M_AXI_rready => m01_couplers_to_inst_interconnect_200MHz_RREADY,
      M_AXI_rresp => m01_couplers_to_inst_interconnect_200MHz_RRESP,
      M_AXI_rvalid => m01_couplers_to_inst_interconnect_200MHz_RVALID,
      M_AXI_wdata => m01_couplers_to_inst_interconnect_200MHz_WDATA,
      M_AXI_wready => m01_couplers_to_inst_interconnect_200MHz_WREADY,
      M_AXI_wstrb => m01_couplers_to_inst_interconnect_200MHz_WSTRB,
      M_AXI_wvalid => m01_couplers_to_inst_interconnect_200MHz_WVALID,
      S_ACLK => inst_interconnect_200MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_200MHz_ARESETN_net(0),
      S_AXI_araddr => xbar_to_m01_couplers_ARADDR(32),
      S_AXI_arprot => xbar_to_m01_couplers_ARPROT(3),
      S_AXI_arready => xbar_to_m01_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m01_couplers_ARVALID(1),
      S_AXI_awaddr => xbar_to_m01_couplers_AWADDR(32),
      S_AXI_awprot => xbar_to_m01_couplers_AWPROT(3),
      S_AXI_awready => xbar_to_m01_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m01_couplers_AWVALID(1),
      S_AXI_bready => xbar_to_m01_couplers_BREADY(1),
      S_AXI_bresp => xbar_to_m01_couplers_BRESP,
      S_AXI_bvalid => xbar_to_m01_couplers_BVALID,
      S_AXI_rdata => xbar_to_m01_couplers_RDATA,
      S_AXI_rready => xbar_to_m01_couplers_RREADY(1),
      S_AXI_rresp => xbar_to_m01_couplers_RRESP,
      S_AXI_rvalid => xbar_to_m01_couplers_RVALID,
      S_AXI_wdata => xbar_to_m01_couplers_WDATA(32),
      S_AXI_wready => xbar_to_m01_couplers_WREADY,
      S_AXI_wstrb => xbar_to_m01_couplers_WSTRB(4),
      S_AXI_wvalid => xbar_to_m01_couplers_WVALID(1)
    );
m02_couplers: entity work.m02_couplers_imp_97GN1N
     port map (
      M_ACLK => M02_ACLK_1,
      M_ARESETN(0) => M02_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m02_couplers_to_inst_interconnect_200MHz_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m02_couplers_to_inst_interconnect_200MHz_ARPROT(2 downto 0),
      M_AXI_arready => m02_couplers_to_inst_interconnect_200MHz_ARREADY,
      M_AXI_arvalid => m02_couplers_to_inst_interconnect_200MHz_ARVALID,
      M_AXI_awaddr(31 downto 0) => m02_couplers_to_inst_interconnect_200MHz_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m02_couplers_to_inst_interconnect_200MHz_AWPROT(2 downto 0),
      M_AXI_awready => m02_couplers_to_inst_interconnect_200MHz_AWREADY,
      M_AXI_awvalid => m02_couplers_to_inst_interconnect_200MHz_AWVALID,
      M_AXI_bready => m02_couplers_to_inst_interconnect_200MHz_BREADY,
      M_AXI_bresp(1 downto 0) => m02_couplers_to_inst_interconnect_200MHz_BRESP(1 downto 0),
      M_AXI_bvalid => m02_couplers_to_inst_interconnect_200MHz_BVALID,
      M_AXI_rdata(31 downto 0) => m02_couplers_to_inst_interconnect_200MHz_RDATA(31 downto 0),
      M_AXI_rready => m02_couplers_to_inst_interconnect_200MHz_RREADY,
      M_AXI_rresp(1 downto 0) => m02_couplers_to_inst_interconnect_200MHz_RRESP(1 downto 0),
      M_AXI_rvalid => m02_couplers_to_inst_interconnect_200MHz_RVALID,
      M_AXI_wdata(31 downto 0) => m02_couplers_to_inst_interconnect_200MHz_WDATA(31 downto 0),
      M_AXI_wready => m02_couplers_to_inst_interconnect_200MHz_WREADY,
      M_AXI_wstrb(3 downto 0) => m02_couplers_to_inst_interconnect_200MHz_WSTRB(3 downto 0),
      M_AXI_wvalid => m02_couplers_to_inst_interconnect_200MHz_WVALID,
      S_ACLK => inst_interconnect_200MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_200MHz_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m02_couplers_ARADDR(95 downto 64),
      S_AXI_arprot(2 downto 0) => xbar_to_m02_couplers_ARPROT(8 downto 6),
      S_AXI_arready => xbar_to_m02_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m02_couplers_ARVALID(2),
      S_AXI_awaddr(31 downto 0) => xbar_to_m02_couplers_AWADDR(95 downto 64),
      S_AXI_awprot(2 downto 0) => xbar_to_m02_couplers_AWPROT(8 downto 6),
      S_AXI_awready => xbar_to_m02_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m02_couplers_AWVALID(2),
      S_AXI_bready => xbar_to_m02_couplers_BREADY(2),
      S_AXI_bresp(1 downto 0) => xbar_to_m02_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m02_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m02_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m02_couplers_RREADY(2),
      S_AXI_rresp(1 downto 0) => xbar_to_m02_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m02_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m02_couplers_WDATA(95 downto 64),
      S_AXI_wready => xbar_to_m02_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m02_couplers_WSTRB(11 downto 8),
      S_AXI_wvalid => xbar_to_m02_couplers_WVALID(2)
    );
m03_couplers: entity work.m03_couplers_imp_1LAKXMY
     port map (
      M_ACLK => M03_ACLK_1,
      M_ARESETN(0) => M03_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m03_couplers_to_inst_interconnect_200MHz_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m03_couplers_to_inst_interconnect_200MHz_ARPROT(2 downto 0),
      M_AXI_arready => m03_couplers_to_inst_interconnect_200MHz_ARREADY,
      M_AXI_arvalid => m03_couplers_to_inst_interconnect_200MHz_ARVALID,
      M_AXI_awaddr(31 downto 0) => m03_couplers_to_inst_interconnect_200MHz_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m03_couplers_to_inst_interconnect_200MHz_AWPROT(2 downto 0),
      M_AXI_awready => m03_couplers_to_inst_interconnect_200MHz_AWREADY,
      M_AXI_awvalid => m03_couplers_to_inst_interconnect_200MHz_AWVALID,
      M_AXI_bready => m03_couplers_to_inst_interconnect_200MHz_BREADY,
      M_AXI_bresp(1 downto 0) => m03_couplers_to_inst_interconnect_200MHz_BRESP(1 downto 0),
      M_AXI_bvalid => m03_couplers_to_inst_interconnect_200MHz_BVALID,
      M_AXI_rdata(31 downto 0) => m03_couplers_to_inst_interconnect_200MHz_RDATA(31 downto 0),
      M_AXI_rready => m03_couplers_to_inst_interconnect_200MHz_RREADY,
      M_AXI_rresp(1 downto 0) => m03_couplers_to_inst_interconnect_200MHz_RRESP(1 downto 0),
      M_AXI_rvalid => m03_couplers_to_inst_interconnect_200MHz_RVALID,
      M_AXI_wdata(31 downto 0) => m03_couplers_to_inst_interconnect_200MHz_WDATA(31 downto 0),
      M_AXI_wready => m03_couplers_to_inst_interconnect_200MHz_WREADY,
      M_AXI_wstrb(3 downto 0) => m03_couplers_to_inst_interconnect_200MHz_WSTRB(3 downto 0),
      M_AXI_wvalid => m03_couplers_to_inst_interconnect_200MHz_WVALID,
      S_ACLK => inst_interconnect_200MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_200MHz_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m03_couplers_ARADDR(127 downto 96),
      S_AXI_arprot(2 downto 0) => xbar_to_m03_couplers_ARPROT(11 downto 9),
      S_AXI_arready => xbar_to_m03_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m03_couplers_ARVALID(3),
      S_AXI_awaddr(31 downto 0) => xbar_to_m03_couplers_AWADDR(127 downto 96),
      S_AXI_awprot(2 downto 0) => xbar_to_m03_couplers_AWPROT(11 downto 9),
      S_AXI_awready => xbar_to_m03_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m03_couplers_AWVALID(3),
      S_AXI_bready => xbar_to_m03_couplers_BREADY(3),
      S_AXI_bresp(1 downto 0) => xbar_to_m03_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m03_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m03_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m03_couplers_RREADY(3),
      S_AXI_rresp(1 downto 0) => xbar_to_m03_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m03_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m03_couplers_WDATA(127 downto 96),
      S_AXI_wready => xbar_to_m03_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m03_couplers_WSTRB(15 downto 12),
      S_AXI_wvalid => xbar_to_m03_couplers_WVALID(3)
    );
m04_couplers: entity work.m04_couplers_imp_D4QJVY
     port map (
      M_ACLK => M04_ACLK_1,
      M_ARESETN(0) => M04_ARESETN_1(0),
      M_AXI_araddr => m04_couplers_to_inst_interconnect_200MHz_ARADDR,
      M_AXI_arprot => m04_couplers_to_inst_interconnect_200MHz_ARPROT,
      M_AXI_arready => m04_couplers_to_inst_interconnect_200MHz_ARREADY,
      M_AXI_arvalid => m04_couplers_to_inst_interconnect_200MHz_ARVALID,
      M_AXI_awaddr => m04_couplers_to_inst_interconnect_200MHz_AWADDR,
      M_AXI_awprot => m04_couplers_to_inst_interconnect_200MHz_AWPROT,
      M_AXI_awready => m04_couplers_to_inst_interconnect_200MHz_AWREADY,
      M_AXI_awvalid => m04_couplers_to_inst_interconnect_200MHz_AWVALID,
      M_AXI_bready => m04_couplers_to_inst_interconnect_200MHz_BREADY,
      M_AXI_bresp => m04_couplers_to_inst_interconnect_200MHz_BRESP,
      M_AXI_bvalid => m04_couplers_to_inst_interconnect_200MHz_BVALID,
      M_AXI_rdata => m04_couplers_to_inst_interconnect_200MHz_RDATA,
      M_AXI_rready => m04_couplers_to_inst_interconnect_200MHz_RREADY,
      M_AXI_rresp => m04_couplers_to_inst_interconnect_200MHz_RRESP,
      M_AXI_rvalid => m04_couplers_to_inst_interconnect_200MHz_RVALID,
      M_AXI_wdata => m04_couplers_to_inst_interconnect_200MHz_WDATA,
      M_AXI_wready => m04_couplers_to_inst_interconnect_200MHz_WREADY,
      M_AXI_wstrb => m04_couplers_to_inst_interconnect_200MHz_WSTRB,
      M_AXI_wvalid => m04_couplers_to_inst_interconnect_200MHz_WVALID,
      S_ACLK => inst_interconnect_200MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_200MHz_ARESETN_net(0),
      S_AXI_araddr => xbar_to_m04_couplers_ARADDR(128),
      S_AXI_arprot => xbar_to_m04_couplers_ARPROT(12),
      S_AXI_arready => xbar_to_m04_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m04_couplers_ARVALID(4),
      S_AXI_awaddr => xbar_to_m04_couplers_AWADDR(128),
      S_AXI_awprot => xbar_to_m04_couplers_AWPROT(12),
      S_AXI_awready => xbar_to_m04_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m04_couplers_AWVALID(4),
      S_AXI_bready => xbar_to_m04_couplers_BREADY(4),
      S_AXI_bresp => xbar_to_m04_couplers_BRESP,
      S_AXI_bvalid => xbar_to_m04_couplers_BVALID,
      S_AXI_rdata => xbar_to_m04_couplers_RDATA,
      S_AXI_rready => xbar_to_m04_couplers_RREADY(4),
      S_AXI_rresp => xbar_to_m04_couplers_RRESP,
      S_AXI_rvalid => xbar_to_m04_couplers_RVALID,
      S_AXI_wdata => xbar_to_m04_couplers_WDATA(128),
      S_AXI_wready => xbar_to_m04_couplers_WREADY,
      S_AXI_wstrb => xbar_to_m04_couplers_WSTRB(16),
      S_AXI_wvalid => xbar_to_m04_couplers_WVALID(4)
    );
m05_couplers: entity work.m05_couplers_imp_1H9VHZJ
     port map (
      M_ACLK => M05_ACLK_1,
      M_ARESETN(0) => M05_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m05_couplers_to_inst_interconnect_200MHz_ARADDR(31 downto 0),
      M_AXI_arready => m05_couplers_to_inst_interconnect_200MHz_ARREADY,
      M_AXI_arvalid => m05_couplers_to_inst_interconnect_200MHz_ARVALID,
      M_AXI_awaddr(31 downto 0) => m05_couplers_to_inst_interconnect_200MHz_AWADDR(31 downto 0),
      M_AXI_awready => m05_couplers_to_inst_interconnect_200MHz_AWREADY,
      M_AXI_awvalid => m05_couplers_to_inst_interconnect_200MHz_AWVALID,
      M_AXI_bready => m05_couplers_to_inst_interconnect_200MHz_BREADY,
      M_AXI_bresp(1 downto 0) => m05_couplers_to_inst_interconnect_200MHz_BRESP(1 downto 0),
      M_AXI_bvalid => m05_couplers_to_inst_interconnect_200MHz_BVALID,
      M_AXI_rdata(31 downto 0) => m05_couplers_to_inst_interconnect_200MHz_RDATA(31 downto 0),
      M_AXI_rready => m05_couplers_to_inst_interconnect_200MHz_RREADY,
      M_AXI_rresp(1 downto 0) => m05_couplers_to_inst_interconnect_200MHz_RRESP(1 downto 0),
      M_AXI_rvalid => m05_couplers_to_inst_interconnect_200MHz_RVALID,
      M_AXI_wdata(31 downto 0) => m05_couplers_to_inst_interconnect_200MHz_WDATA(31 downto 0),
      M_AXI_wready => m05_couplers_to_inst_interconnect_200MHz_WREADY,
      M_AXI_wstrb(3 downto 0) => m05_couplers_to_inst_interconnect_200MHz_WSTRB(3 downto 0),
      M_AXI_wvalid => m05_couplers_to_inst_interconnect_200MHz_WVALID,
      S_ACLK => inst_interconnect_200MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_200MHz_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m05_couplers_ARADDR(191 downto 160),
      S_AXI_arready => xbar_to_m05_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m05_couplers_ARVALID(5),
      S_AXI_awaddr(31 downto 0) => xbar_to_m05_couplers_AWADDR(191 downto 160),
      S_AXI_awready => xbar_to_m05_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m05_couplers_AWVALID(5),
      S_AXI_bready => xbar_to_m05_couplers_BREADY(5),
      S_AXI_bresp(1 downto 0) => xbar_to_m05_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m05_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m05_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m05_couplers_RREADY(5),
      S_AXI_rresp(1 downto 0) => xbar_to_m05_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m05_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m05_couplers_WDATA(191 downto 160),
      S_AXI_wready => xbar_to_m05_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m05_couplers_WSTRB(23 downto 20),
      S_AXI_wvalid => xbar_to_m05_couplers_WVALID(5)
    );
m06_couplers: entity work.m06_couplers_imp_BSTQR1
     port map (
      M_ACLK => M06_ACLK_1,
      M_ARESETN(0) => M06_ARESETN_1(0),
      M_AXI_araddr(31 downto 0) => m06_couplers_to_inst_interconnect_200MHz_ARADDR(31 downto 0),
      M_AXI_arready => m06_couplers_to_inst_interconnect_200MHz_ARREADY,
      M_AXI_arvalid => m06_couplers_to_inst_interconnect_200MHz_ARVALID,
      M_AXI_awaddr(31 downto 0) => m06_couplers_to_inst_interconnect_200MHz_AWADDR(31 downto 0),
      M_AXI_awready => m06_couplers_to_inst_interconnect_200MHz_AWREADY,
      M_AXI_awvalid => m06_couplers_to_inst_interconnect_200MHz_AWVALID,
      M_AXI_bready => m06_couplers_to_inst_interconnect_200MHz_BREADY,
      M_AXI_bresp(1 downto 0) => m06_couplers_to_inst_interconnect_200MHz_BRESP(1 downto 0),
      M_AXI_bvalid => m06_couplers_to_inst_interconnect_200MHz_BVALID,
      M_AXI_rdata(31 downto 0) => m06_couplers_to_inst_interconnect_200MHz_RDATA(31 downto 0),
      M_AXI_rready => m06_couplers_to_inst_interconnect_200MHz_RREADY,
      M_AXI_rresp(1 downto 0) => m06_couplers_to_inst_interconnect_200MHz_RRESP(1 downto 0),
      M_AXI_rvalid => m06_couplers_to_inst_interconnect_200MHz_RVALID,
      M_AXI_wdata(31 downto 0) => m06_couplers_to_inst_interconnect_200MHz_WDATA(31 downto 0),
      M_AXI_wready => m06_couplers_to_inst_interconnect_200MHz_WREADY,
      M_AXI_wstrb(3 downto 0) => m06_couplers_to_inst_interconnect_200MHz_WSTRB(3 downto 0),
      M_AXI_wvalid => m06_couplers_to_inst_interconnect_200MHz_WVALID,
      S_ACLK => inst_interconnect_200MHz_ACLK_net,
      S_ARESETN(0) => inst_interconnect_200MHz_ARESETN_net(0),
      S_AXI_araddr(31 downto 0) => xbar_to_m06_couplers_ARADDR(223 downto 192),
      S_AXI_arready => xbar_to_m06_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m06_couplers_ARVALID(6),
      S_AXI_awaddr(31 downto 0) => xbar_to_m06_couplers_AWADDR(223 downto 192),
      S_AXI_awready => xbar_to_m06_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m06_couplers_AWVALID(6),
      S_AXI_bready => xbar_to_m06_couplers_BREADY(6),
      S_AXI_bresp(1 downto 0) => xbar_to_m06_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m06_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m06_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m06_couplers_RREADY(6),
      S_AXI_rresp(1 downto 0) => xbar_to_m06_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m06_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m06_couplers_WDATA(223 downto 192),
      S_AXI_wready => xbar_to_m06_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m06_couplers_WSTRB(27 downto 24),
      S_AXI_wvalid => xbar_to_m06_couplers_WVALID(6)
    );
s00_couplers: entity work.s00_couplers_imp_1PJ7QEI
     port map (
      M_ACLK => inst_interconnect_200MHz_ACLK_net,
      M_ARESETN(0) => inst_interconnect_200MHz_ARESETN_net(0),
      M_AXI_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arready => s00_couplers_to_xbar_ARREADY(0),
      M_AXI_arvalid => s00_couplers_to_xbar_ARVALID,
      M_AXI_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awready => s00_couplers_to_xbar_AWREADY(0),
      M_AXI_awvalid => s00_couplers_to_xbar_AWVALID,
      M_AXI_bready => s00_couplers_to_xbar_BREADY,
      M_AXI_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      M_AXI_bvalid => s00_couplers_to_xbar_BVALID(0),
      M_AXI_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      M_AXI_rready => s00_couplers_to_xbar_RREADY,
      M_AXI_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      M_AXI_rvalid => s00_couplers_to_xbar_RVALID(0),
      M_AXI_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      M_AXI_wready => s00_couplers_to_xbar_WREADY(0),
      M_AXI_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      M_AXI_wvalid => s00_couplers_to_xbar_WVALID,
      S_ACLK => S00_ACLK_1,
      S_ARESETN(0) => S00_ARESETN_1(0),
      S_AXI_araddr(31 downto 0) => inst_interconnect_200MHz_to_s00_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => inst_interconnect_200MHz_to_s00_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => inst_interconnect_200MHz_to_s00_couplers_ARCACHE(3 downto 0),
      S_AXI_arid(11 downto 0) => inst_interconnect_200MHz_to_s00_couplers_ARID(11 downto 0),
      S_AXI_arlen(3 downto 0) => inst_interconnect_200MHz_to_s00_couplers_ARLEN(3 downto 0),
      S_AXI_arlock(1 downto 0) => inst_interconnect_200MHz_to_s00_couplers_ARLOCK(1 downto 0),
      S_AXI_arprot(2 downto 0) => inst_interconnect_200MHz_to_s00_couplers_ARPROT(2 downto 0),
      S_AXI_arqos(3 downto 0) => inst_interconnect_200MHz_to_s00_couplers_ARQOS(3 downto 0),
      S_AXI_arready => inst_interconnect_200MHz_to_s00_couplers_ARREADY,
      S_AXI_arsize(2 downto 0) => inst_interconnect_200MHz_to_s00_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => inst_interconnect_200MHz_to_s00_couplers_ARVALID,
      S_AXI_awaddr(31 downto 0) => inst_interconnect_200MHz_to_s00_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => inst_interconnect_200MHz_to_s00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => inst_interconnect_200MHz_to_s00_couplers_AWCACHE(3 downto 0),
      S_AXI_awid(11 downto 0) => inst_interconnect_200MHz_to_s00_couplers_AWID(11 downto 0),
      S_AXI_awlen(3 downto 0) => inst_interconnect_200MHz_to_s00_couplers_AWLEN(3 downto 0),
      S_AXI_awlock(1 downto 0) => inst_interconnect_200MHz_to_s00_couplers_AWLOCK(1 downto 0),
      S_AXI_awprot(2 downto 0) => inst_interconnect_200MHz_to_s00_couplers_AWPROT(2 downto 0),
      S_AXI_awqos(3 downto 0) => inst_interconnect_200MHz_to_s00_couplers_AWQOS(3 downto 0),
      S_AXI_awready => inst_interconnect_200MHz_to_s00_couplers_AWREADY,
      S_AXI_awsize(2 downto 0) => inst_interconnect_200MHz_to_s00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => inst_interconnect_200MHz_to_s00_couplers_AWVALID,
      S_AXI_bid(11 downto 0) => inst_interconnect_200MHz_to_s00_couplers_BID(11 downto 0),
      S_AXI_bready => inst_interconnect_200MHz_to_s00_couplers_BREADY,
      S_AXI_bresp(1 downto 0) => inst_interconnect_200MHz_to_s00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => inst_interconnect_200MHz_to_s00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => inst_interconnect_200MHz_to_s00_couplers_RDATA(31 downto 0),
      S_AXI_rid(11 downto 0) => inst_interconnect_200MHz_to_s00_couplers_RID(11 downto 0),
      S_AXI_rlast => inst_interconnect_200MHz_to_s00_couplers_RLAST,
      S_AXI_rready => inst_interconnect_200MHz_to_s00_couplers_RREADY,
      S_AXI_rresp(1 downto 0) => inst_interconnect_200MHz_to_s00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => inst_interconnect_200MHz_to_s00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => inst_interconnect_200MHz_to_s00_couplers_WDATA(31 downto 0),
      S_AXI_wid(11 downto 0) => inst_interconnect_200MHz_to_s00_couplers_WID(11 downto 0),
      S_AXI_wlast => inst_interconnect_200MHz_to_s00_couplers_WLAST,
      S_AXI_wready => inst_interconnect_200MHz_to_s00_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => inst_interconnect_200MHz_to_s00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => inst_interconnect_200MHz_to_s00_couplers_WVALID
    );
xbar: component design_1_xbar_1
     port map (
      aclk => inst_interconnect_200MHz_ACLK_net,
      aresetn => inst_interconnect_200MHz_ARESETN_net(0),
      m_axi_araddr(223 downto 192) => xbar_to_m06_couplers_ARADDR(223 downto 192),
      m_axi_araddr(191 downto 160) => xbar_to_m05_couplers_ARADDR(191 downto 160),
      m_axi_araddr(159 downto 128) => xbar_to_m04_couplers_ARADDR(159 downto 128),
      m_axi_araddr(127 downto 96) => xbar_to_m03_couplers_ARADDR(127 downto 96),
      m_axi_araddr(95 downto 64) => xbar_to_m02_couplers_ARADDR(95 downto 64),
      m_axi_araddr(63 downto 32) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      m_axi_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arprot(20 downto 15) => NLW_xbar_m_axi_arprot_UNCONNECTED(20 downto 15),
      m_axi_arprot(14 downto 12) => xbar_to_m04_couplers_ARPROT(14 downto 12),
      m_axi_arprot(11 downto 9) => xbar_to_m03_couplers_ARPROT(11 downto 9),
      m_axi_arprot(8 downto 6) => xbar_to_m02_couplers_ARPROT(8 downto 6),
      m_axi_arprot(5 downto 3) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      m_axi_arprot(2 downto 0) => NLW_xbar_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arready(6) => xbar_to_m06_couplers_ARREADY,
      m_axi_arready(5) => xbar_to_m05_couplers_ARREADY,
      m_axi_arready(4) => xbar_to_m04_couplers_ARREADY,
      m_axi_arready(3) => xbar_to_m03_couplers_ARREADY,
      m_axi_arready(2) => xbar_to_m02_couplers_ARREADY,
      m_axi_arready(1) => xbar_to_m01_couplers_ARREADY,
      m_axi_arready(0) => xbar_to_m00_couplers_ARREADY,
      m_axi_arvalid(6) => xbar_to_m06_couplers_ARVALID(6),
      m_axi_arvalid(5) => xbar_to_m05_couplers_ARVALID(5),
      m_axi_arvalid(4) => xbar_to_m04_couplers_ARVALID(4),
      m_axi_arvalid(3) => xbar_to_m03_couplers_ARVALID(3),
      m_axi_arvalid(2) => xbar_to_m02_couplers_ARVALID(2),
      m_axi_arvalid(1) => xbar_to_m01_couplers_ARVALID(1),
      m_axi_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      m_axi_awaddr(223 downto 192) => xbar_to_m06_couplers_AWADDR(223 downto 192),
      m_axi_awaddr(191 downto 160) => xbar_to_m05_couplers_AWADDR(191 downto 160),
      m_axi_awaddr(159 downto 128) => xbar_to_m04_couplers_AWADDR(159 downto 128),
      m_axi_awaddr(127 downto 96) => xbar_to_m03_couplers_AWADDR(127 downto 96),
      m_axi_awaddr(95 downto 64) => xbar_to_m02_couplers_AWADDR(95 downto 64),
      m_axi_awaddr(63 downto 32) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      m_axi_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awprot(20 downto 15) => NLW_xbar_m_axi_awprot_UNCONNECTED(20 downto 15),
      m_axi_awprot(14 downto 12) => xbar_to_m04_couplers_AWPROT(14 downto 12),
      m_axi_awprot(11 downto 9) => xbar_to_m03_couplers_AWPROT(11 downto 9),
      m_axi_awprot(8 downto 6) => xbar_to_m02_couplers_AWPROT(8 downto 6),
      m_axi_awprot(5 downto 3) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      m_axi_awprot(2 downto 0) => NLW_xbar_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awready(6) => xbar_to_m06_couplers_AWREADY,
      m_axi_awready(5) => xbar_to_m05_couplers_AWREADY,
      m_axi_awready(4) => xbar_to_m04_couplers_AWREADY,
      m_axi_awready(3) => xbar_to_m03_couplers_AWREADY,
      m_axi_awready(2) => xbar_to_m02_couplers_AWREADY,
      m_axi_awready(1) => xbar_to_m01_couplers_AWREADY,
      m_axi_awready(0) => xbar_to_m00_couplers_AWREADY,
      m_axi_awvalid(6) => xbar_to_m06_couplers_AWVALID(6),
      m_axi_awvalid(5) => xbar_to_m05_couplers_AWVALID(5),
      m_axi_awvalid(4) => xbar_to_m04_couplers_AWVALID(4),
      m_axi_awvalid(3) => xbar_to_m03_couplers_AWVALID(3),
      m_axi_awvalid(2) => xbar_to_m02_couplers_AWVALID(2),
      m_axi_awvalid(1) => xbar_to_m01_couplers_AWVALID(1),
      m_axi_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      m_axi_bready(6) => xbar_to_m06_couplers_BREADY(6),
      m_axi_bready(5) => xbar_to_m05_couplers_BREADY(5),
      m_axi_bready(4) => xbar_to_m04_couplers_BREADY(4),
      m_axi_bready(3) => xbar_to_m03_couplers_BREADY(3),
      m_axi_bready(2) => xbar_to_m02_couplers_BREADY(2),
      m_axi_bready(1) => xbar_to_m01_couplers_BREADY(1),
      m_axi_bready(0) => xbar_to_m00_couplers_BREADY(0),
      m_axi_bresp(13 downto 12) => xbar_to_m06_couplers_BRESP(1 downto 0),
      m_axi_bresp(11 downto 10) => xbar_to_m05_couplers_BRESP(1 downto 0),
      m_axi_bresp(9) => xbar_to_m04_couplers_BRESP,
      m_axi_bresp(8) => xbar_to_m04_couplers_BRESP,
      m_axi_bresp(7 downto 6) => xbar_to_m03_couplers_BRESP(1 downto 0),
      m_axi_bresp(5 downto 4) => xbar_to_m02_couplers_BRESP(1 downto 0),
      m_axi_bresp(3) => xbar_to_m01_couplers_BRESP,
      m_axi_bresp(2) => xbar_to_m01_couplers_BRESP,
      m_axi_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid(6) => xbar_to_m06_couplers_BVALID,
      m_axi_bvalid(5) => xbar_to_m05_couplers_BVALID,
      m_axi_bvalid(4) => xbar_to_m04_couplers_BVALID,
      m_axi_bvalid(3) => xbar_to_m03_couplers_BVALID,
      m_axi_bvalid(2) => xbar_to_m02_couplers_BVALID,
      m_axi_bvalid(1) => xbar_to_m01_couplers_BVALID,
      m_axi_bvalid(0) => xbar_to_m00_couplers_BVALID,
      m_axi_rdata(223 downto 192) => xbar_to_m06_couplers_RDATA(31 downto 0),
      m_axi_rdata(191 downto 160) => xbar_to_m05_couplers_RDATA(31 downto 0),
      m_axi_rdata(159) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(158) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(157) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(156) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(155) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(154) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(153) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(152) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(151) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(150) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(149) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(148) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(147) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(146) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(145) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(144) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(143) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(142) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(141) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(140) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(139) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(138) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(137) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(136) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(135) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(134) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(133) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(132) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(131) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(130) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(129) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(128) => xbar_to_m04_couplers_RDATA,
      m_axi_rdata(127 downto 96) => xbar_to_m03_couplers_RDATA(31 downto 0),
      m_axi_rdata(95 downto 64) => xbar_to_m02_couplers_RDATA(31 downto 0),
      m_axi_rdata(63) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(62) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(61) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(60) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(59) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(58) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(57) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(56) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(55) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(54) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(53) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(52) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(51) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(50) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(49) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(48) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(47) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(46) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(45) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(44) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(43) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(42) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(41) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(40) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(39) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(38) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(37) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(36) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(35) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(34) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(33) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(32) => xbar_to_m01_couplers_RDATA,
      m_axi_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      m_axi_rready(6) => xbar_to_m06_couplers_RREADY(6),
      m_axi_rready(5) => xbar_to_m05_couplers_RREADY(5),
      m_axi_rready(4) => xbar_to_m04_couplers_RREADY(4),
      m_axi_rready(3) => xbar_to_m03_couplers_RREADY(3),
      m_axi_rready(2) => xbar_to_m02_couplers_RREADY(2),
      m_axi_rready(1) => xbar_to_m01_couplers_RREADY(1),
      m_axi_rready(0) => xbar_to_m00_couplers_RREADY(0),
      m_axi_rresp(13 downto 12) => xbar_to_m06_couplers_RRESP(1 downto 0),
      m_axi_rresp(11 downto 10) => xbar_to_m05_couplers_RRESP(1 downto 0),
      m_axi_rresp(9) => xbar_to_m04_couplers_RRESP,
      m_axi_rresp(8) => xbar_to_m04_couplers_RRESP,
      m_axi_rresp(7 downto 6) => xbar_to_m03_couplers_RRESP(1 downto 0),
      m_axi_rresp(5 downto 4) => xbar_to_m02_couplers_RRESP(1 downto 0),
      m_axi_rresp(3) => xbar_to_m01_couplers_RRESP,
      m_axi_rresp(2) => xbar_to_m01_couplers_RRESP,
      m_axi_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid(6) => xbar_to_m06_couplers_RVALID,
      m_axi_rvalid(5) => xbar_to_m05_couplers_RVALID,
      m_axi_rvalid(4) => xbar_to_m04_couplers_RVALID,
      m_axi_rvalid(3) => xbar_to_m03_couplers_RVALID,
      m_axi_rvalid(2) => xbar_to_m02_couplers_RVALID,
      m_axi_rvalid(1) => xbar_to_m01_couplers_RVALID,
      m_axi_rvalid(0) => xbar_to_m00_couplers_RVALID,
      m_axi_wdata(223 downto 192) => xbar_to_m06_couplers_WDATA(223 downto 192),
      m_axi_wdata(191 downto 160) => xbar_to_m05_couplers_WDATA(191 downto 160),
      m_axi_wdata(159 downto 128) => xbar_to_m04_couplers_WDATA(159 downto 128),
      m_axi_wdata(127 downto 96) => xbar_to_m03_couplers_WDATA(127 downto 96),
      m_axi_wdata(95 downto 64) => xbar_to_m02_couplers_WDATA(95 downto 64),
      m_axi_wdata(63 downto 32) => xbar_to_m01_couplers_WDATA(63 downto 32),
      m_axi_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      m_axi_wready(6) => xbar_to_m06_couplers_WREADY,
      m_axi_wready(5) => xbar_to_m05_couplers_WREADY,
      m_axi_wready(4) => xbar_to_m04_couplers_WREADY,
      m_axi_wready(3) => xbar_to_m03_couplers_WREADY,
      m_axi_wready(2) => xbar_to_m02_couplers_WREADY,
      m_axi_wready(1) => xbar_to_m01_couplers_WREADY,
      m_axi_wready(0) => xbar_to_m00_couplers_WREADY,
      m_axi_wstrb(27 downto 24) => xbar_to_m06_couplers_WSTRB(27 downto 24),
      m_axi_wstrb(23 downto 20) => xbar_to_m05_couplers_WSTRB(23 downto 20),
      m_axi_wstrb(19 downto 16) => xbar_to_m04_couplers_WSTRB(19 downto 16),
      m_axi_wstrb(15 downto 12) => xbar_to_m03_couplers_WSTRB(15 downto 12),
      m_axi_wstrb(11 downto 8) => xbar_to_m02_couplers_WSTRB(11 downto 8),
      m_axi_wstrb(7 downto 4) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      m_axi_wstrb(3 downto 0) => NLW_xbar_m_axi_wstrb_UNCONNECTED(3 downto 0),
      m_axi_wvalid(6) => xbar_to_m06_couplers_WVALID(6),
      m_axi_wvalid(5) => xbar_to_m05_couplers_WVALID(5),
      m_axi_wvalid(4) => xbar_to_m04_couplers_WVALID(4),
      m_axi_wvalid(3) => xbar_to_m03_couplers_WVALID(3),
      m_axi_wvalid(2) => xbar_to_m02_couplers_WVALID(2),
      m_axi_wvalid(1) => xbar_to_m01_couplers_WVALID(1),
      m_axi_wvalid(0) => xbar_to_m00_couplers_WVALID(0),
      s_axi_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      s_axi_arvalid(0) => s00_couplers_to_xbar_ARVALID,
      s_axi_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      s_axi_awvalid(0) => s00_couplers_to_xbar_AWVALID,
      s_axi_bready(0) => s00_couplers_to_xbar_BREADY,
      s_axi_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      s_axi_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      s_axi_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      s_axi_rready(0) => s00_couplers_to_xbar_RREADY,
      s_axi_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      s_axi_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      s_axi_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      s_axi_wready(0) => s00_couplers_to_xbar_WREADY(0),
      s_axi_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      s_axi_wvalid(0) => s00_couplers_to_xbar_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  port (
    CLK_HV_n : out STD_LOGIC;
    CLK_HV_p : out STD_LOGIC;
    DATA_HV_n : out STD_LOGIC;
    DATA_HV_p : out STD_LOGIC;
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    GTU_HV_n : out STD_LOGIC;
    GTU_HV_p : out STD_LOGIC;
    artx_conf_cclk : out STD_LOGIC;
    artx_conf_data : out STD_LOGIC;
    artx_done : in STD_LOGIC;
    artx_initb_io_tri_i : in STD_LOGIC;
    artx_initb_io_tri_o : out STD_LOGIC;
    artx_initb_io_tri_t : out STD_LOGIC;
    artx_programb_io_tri_i : in STD_LOGIC;
    artx_programb_io_tri_o : out STD_LOGIC;
    artx_programb_io_tri_t : out STD_LOGIC;
    clk_art_0_clk_n : in STD_LOGIC;
    clk_art_0_clk_p : in STD_LOGIC;
    clk_art_1_clk_n : in STD_LOGIC;
    clk_art_1_clk_p : in STD_LOGIC;
    clk_art_2_clk_n : in STD_LOGIC;
    clk_art_2_clk_p : in STD_LOGIC;
    cs_dac_n : out STD_LOGIC;
    cs_dac_p : out STD_LOGIC;
    cs_exp_n : out STD_LOGIC;
    cs_exp_p : out STD_LOGIC;
    data_art0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    data_art1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    data_art2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    frame_art0 : in STD_LOGIC;
    frame_art1 : in STD_LOGIC;
    frame_art2 : in STD_LOGIC;
    i_RX_Serial : in STD_LOGIC;
    intr_n : in STD_LOGIC;
    intr_p : in STD_LOGIC;
    loadb_sc_pc : out STD_LOGIC;
    miso_n : in STD_LOGIC;
    miso_p : in STD_LOGIC;
    mosi_n : out STD_LOGIC;
    mosi_p : out STD_LOGIC;
    pps_signal : in STD_LOGIC;
    resetb_pc : out STD_LOGIC;
    sck_n : out STD_LOGIC;
    sck_p : out STD_LOGIC;
    select_din_pc : out STD_LOGIC;
    select_sc_probe_pc : out STD_LOGIC;
    sr_ck_pc : out STD_LOGIC;
    sr_ck_pc_art : out STD_LOGIC;
    sr_in_pc : out STD_LOGIC_VECTOR ( 5 downto 0 );
    sr_rstb_pc : out STD_LOGIC;
    trig_L1_4led : out STD_LOGIC;
    trig_L2_4led : out STD_LOGIC;
    trig_ext_in : in STD_LOGIC;
    trig_out : out STD_LOGIC;
    user_led : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=127,numReposBlks=95,numNonXlnxBlks=12,numHierBlks=32,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=2,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_processing_system7_0_0 is
  port (
    M_AXI_GP0_ARVALID : out STD_LOGIC;
    M_AXI_GP0_AWVALID : out STD_LOGIC;
    M_AXI_GP0_BREADY : out STD_LOGIC;
    M_AXI_GP0_RREADY : out STD_LOGIC;
    M_AXI_GP0_WLAST : out STD_LOGIC;
    M_AXI_GP0_WVALID : out STD_LOGIC;
    M_AXI_GP0_ARID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_AWID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_WID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ACLK : in STD_LOGIC;
    M_AXI_GP0_ARREADY : in STD_LOGIC;
    M_AXI_GP0_AWREADY : in STD_LOGIC;
    M_AXI_GP0_BVALID : in STD_LOGIC;
    M_AXI_GP0_RLAST : in STD_LOGIC;
    M_AXI_GP0_RVALID : in STD_LOGIC;
    M_AXI_GP0_WREADY : in STD_LOGIC;
    M_AXI_GP0_BID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_RID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP1_ARVALID : out STD_LOGIC;
    M_AXI_GP1_AWVALID : out STD_LOGIC;
    M_AXI_GP1_BREADY : out STD_LOGIC;
    M_AXI_GP1_RREADY : out STD_LOGIC;
    M_AXI_GP1_WLAST : out STD_LOGIC;
    M_AXI_GP1_WVALID : out STD_LOGIC;
    M_AXI_GP1_ARID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP1_AWID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP1_WID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP1_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP1_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP1_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP1_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP1_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP1_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP1_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP1_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP1_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP1_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP1_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP1_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP1_ARLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP1_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP1_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP1_AWLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP1_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP1_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP1_ACLK : in STD_LOGIC;
    M_AXI_GP1_ARREADY : in STD_LOGIC;
    M_AXI_GP1_AWREADY : in STD_LOGIC;
    M_AXI_GP1_BVALID : in STD_LOGIC;
    M_AXI_GP1_RLAST : in STD_LOGIC;
    M_AXI_GP1_RVALID : in STD_LOGIC;
    M_AXI_GP1_WREADY : in STD_LOGIC;
    M_AXI_GP1_BID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP1_RID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP1_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP1_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP1_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_ARREADY : out STD_LOGIC;
    S_AXI_HP0_AWREADY : out STD_LOGIC;
    S_AXI_HP0_BVALID : out STD_LOGIC;
    S_AXI_HP0_RLAST : out STD_LOGIC;
    S_AXI_HP0_RVALID : out STD_LOGIC;
    S_AXI_HP0_WREADY : out STD_LOGIC;
    S_AXI_HP0_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_RDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP0_RCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP0_WCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP0_RACOUNT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_WACOUNT : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_ACLK : in STD_LOGIC;
    S_AXI_HP0_ARVALID : in STD_LOGIC;
    S_AXI_HP0_AWVALID : in STD_LOGIC;
    S_AXI_HP0_BREADY : in STD_LOGIC;
    S_AXI_HP0_RDISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP0_RREADY : in STD_LOGIC;
    S_AXI_HP0_WLAST : in STD_LOGIC;
    S_AXI_HP0_WRISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP0_WVALID : in STD_LOGIC;
    S_AXI_HP0_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_ARLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_AWLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_WID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_WDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP0_WSTRB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP1_ARREADY : out STD_LOGIC;
    S_AXI_HP1_AWREADY : out STD_LOGIC;
    S_AXI_HP1_BVALID : out STD_LOGIC;
    S_AXI_HP1_RLAST : out STD_LOGIC;
    S_AXI_HP1_RVALID : out STD_LOGIC;
    S_AXI_HP1_WREADY : out STD_LOGIC;
    S_AXI_HP1_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP1_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP1_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP1_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP1_RDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP1_RCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP1_WCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP1_RACOUNT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP1_WACOUNT : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP1_ACLK : in STD_LOGIC;
    S_AXI_HP1_ARVALID : in STD_LOGIC;
    S_AXI_HP1_AWVALID : in STD_LOGIC;
    S_AXI_HP1_BREADY : in STD_LOGIC;
    S_AXI_HP1_RDISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP1_RREADY : in STD_LOGIC;
    S_AXI_HP1_WLAST : in STD_LOGIC;
    S_AXI_HP1_WRISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP1_WVALID : in STD_LOGIC;
    S_AXI_HP1_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP1_ARLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP1_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP1_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP1_AWLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP1_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP1_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP1_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP1_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP1_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP1_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP1_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP1_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP1_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP1_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP1_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP1_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP1_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP1_WID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP1_WDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXI_HP1_WSTRB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    IRQ_F2P : in STD_LOGIC_VECTOR ( 3 downto 0 );
    FCLK_CLK0 : out STD_LOGIC;
    FCLK_CLK1 : out STD_LOGIC;
    FCLK_RESET0_N : out STD_LOGIC;
    MIO : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    DDR_CAS_n : inout STD_LOGIC;
    DDR_CKE : inout STD_LOGIC;
    DDR_Clk_n : inout STD_LOGIC;
    DDR_Clk : inout STD_LOGIC;
    DDR_CS_n : inout STD_LOGIC;
    DDR_DRSTB : inout STD_LOGIC;
    DDR_ODT : inout STD_LOGIC;
    DDR_RAS_n : inout STD_LOGIC;
    DDR_WEB : inout STD_LOGIC;
    DDR_BankAddr : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_Addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_VRN : inout STD_LOGIC;
    DDR_VRP : inout STD_LOGIC;
    DDR_DM : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQ : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_DQS_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQS : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    PS_SRSTB : inout STD_LOGIC;
    PS_CLK : inout STD_LOGIC;
    PS_PORB : inout STD_LOGIC
  );
  end component design_1_processing_system7_0_0;
  component design_1_axi_artix_conf_v1_0_0_0 is
  port (
    artx_programb_o : out STD_LOGIC;
    artx_programb_i : in STD_LOGIC;
    artx_programb_t : out STD_LOGIC;
    artx_initb_o : out STD_LOGIC;
    artx_initb_i : in STD_LOGIC;
    artx_initb_t : out STD_LOGIC;
    artx_done : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  end component design_1_axi_artix_conf_v1_0_0_0;
  component design_1_xlconcat_0_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In3 : in STD_LOGIC_VECTOR ( 12 downto 0 );
    In4 : in STD_LOGIC_VECTOR ( 13 downto 0 );
    In5 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_xlconcat_0_0;
  component design_1_axi_gpio_0_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    gpio_io_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio2_io_i : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axi_gpio_0_0;
  component design_1_axi_quad_spi_0_0 is
  port (
    ext_spi_clk : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    io0_i : in STD_LOGIC;
    io0_o : out STD_LOGIC;
    io0_t : out STD_LOGIC;
    io1_i : in STD_LOGIC;
    io1_o : out STD_LOGIC;
    io1_t : out STD_LOGIC;
    sck_i : in STD_LOGIC;
    sck_o : out STD_LOGIC;
    sck_t : out STD_LOGIC;
    ss_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    ss_o : out STD_LOGIC_VECTOR ( 0 to 0 );
    ss_t : out STD_LOGIC;
    ip2intc_irpt : out STD_LOGIC
  );
  end component design_1_axi_quad_spi_0_0;
  component design_1_rst_processing_system7_0_100M_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_rst_processing_system7_0_100M_0;
  component design_1_axi_fifo_mm_s_1_0 is
  port (
    interrupt : out STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    mm2s_prmry_reset_out_n : out STD_LOGIC;
    axi_str_txd_tvalid : out STD_LOGIC;
    axi_str_txd_tready : in STD_LOGIC;
    axi_str_txd_tlast : out STD_LOGIC;
    axi_str_txd_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axi_fifo_mm_s_1_0;
  component design_1_axis_dwidth_converter_1_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 191 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component design_1_axis_dwidth_converter_1_0;
  component design_1_spaciroc3_sc_0_0 is
  port (
    user_led : out STD_LOGIC;
    sr_in_pc : out STD_LOGIC_VECTOR ( 5 downto 0 );
    sr_ck_pc : out STD_LOGIC;
    sr_rstb_pc : out STD_LOGIC;
    sr_out_pc : in STD_LOGIC;
    select_sc_probe_pc : out STD_LOGIC;
    resetb_pc : out STD_LOGIC;
    select_din_pc : out STD_LOGIC;
    loadb_sc_pc : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC;
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 191 downto 0 );
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  end component design_1_spaciroc3_sc_0_0;
  component design_1_clk_wiz_0_0 is
  port (
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component design_1_clk_wiz_0_0;
  component design_1_clk_wiz_2_0 is
  port (
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component design_1_clk_wiz_2_0;
  component design_1_axi_dma_L1_0 is
  port (
    s_axi_lite_aclk : in STD_LOGIC;
    m_axi_s2mm_aclk : in STD_LOGIC;
    axi_resetn : in STD_LOGIC;
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_s2mm_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_awvalid : out STD_LOGIC;
    m_axi_s2mm_awready : in STD_LOGIC;
    m_axi_s2mm_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_wlast : out STD_LOGIC;
    m_axi_s2mm_wvalid : out STD_LOGIC;
    m_axi_s2mm_wready : in STD_LOGIC;
    m_axi_s2mm_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_bvalid : in STD_LOGIC;
    m_axi_s2mm_bready : out STD_LOGIC;
    s2mm_prmry_reset_out_n : out STD_LOGIC;
    s_axis_s2mm_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_s2mm_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_s2mm_tvalid : in STD_LOGIC;
    s_axis_s2mm_tready : out STD_LOGIC;
    s_axis_s2mm_tlast : in STD_LOGIC;
    s2mm_introut : out STD_LOGIC
  );
  end component design_1_axi_dma_L1_0;
  component design_1_axis_broadcaster_1r_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tid : out STD_LOGIC_VECTOR ( 9 downto 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component design_1_axis_broadcaster_1r_0;
  component design_1_axis_data_fifo_L2_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 4 downto 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 1 downto 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axis_data_fifo_L2_0;
  component design_1_axis_data_fifo_fc_L2b_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 4 downto 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 5 downto 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 1 downto 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axis_data_fifo_fc_L2b_0;
  component design_1_scurve_adder_0_0 is
  port (
    s_axi_CTRL_BUS_AWADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_CTRL_BUS_AWVALID : in STD_LOGIC;
    s_axi_CTRL_BUS_AWREADY : out STD_LOGIC;
    s_axi_CTRL_BUS_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_CTRL_BUS_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_CTRL_BUS_WVALID : in STD_LOGIC;
    s_axi_CTRL_BUS_WREADY : out STD_LOGIC;
    s_axi_CTRL_BUS_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_CTRL_BUS_BVALID : out STD_LOGIC;
    s_axi_CTRL_BUS_BREADY : in STD_LOGIC;
    s_axi_CTRL_BUS_ARADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_CTRL_BUS_ARVALID : in STD_LOGIC;
    s_axi_CTRL_BUS_ARREADY : out STD_LOGIC;
    s_axi_CTRL_BUS_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_CTRL_BUS_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_CTRL_BUS_RVALID : out STD_LOGIC;
    s_axi_CTRL_BUS_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    in_stream0_TVALID : in STD_LOGIC;
    in_stream0_TREADY : out STD_LOGIC;
    in_stream0_TDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    in_stream0_TDEST : in STD_LOGIC_VECTOR ( 5 downto 0 );
    in_stream0_TKEEP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_stream0_TSTRB : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_stream0_TUSER : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_stream0_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    in_stream0_TID : in STD_LOGIC_VECTOR ( 4 downto 0 );
    in_stream1_TVALID : in STD_LOGIC;
    in_stream1_TREADY : out STD_LOGIC;
    in_stream1_TDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    in_stream1_TDEST : in STD_LOGIC_VECTOR ( 5 downto 0 );
    in_stream1_TKEEP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_stream1_TSTRB : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_stream1_TUSER : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_stream1_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    in_stream1_TID : in STD_LOGIC_VECTOR ( 4 downto 0 );
    in_stream2_TVALID : in STD_LOGIC;
    in_stream2_TREADY : out STD_LOGIC;
    in_stream2_TDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    in_stream2_TDEST : in STD_LOGIC_VECTOR ( 5 downto 0 );
    in_stream2_TKEEP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_stream2_TSTRB : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_stream2_TUSER : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_stream2_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    in_stream2_TID : in STD_LOGIC_VECTOR ( 4 downto 0 );
    in_stream3_TVALID : in STD_LOGIC;
    in_stream3_TREADY : out STD_LOGIC;
    in_stream3_TDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    in_stream3_TDEST : in STD_LOGIC_VECTOR ( 5 downto 0 );
    in_stream3_TKEEP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_stream3_TSTRB : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_stream3_TUSER : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_stream3_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    in_stream3_TID : in STD_LOGIC_VECTOR ( 4 downto 0 );
    in_stream4_TVALID : in STD_LOGIC;
    in_stream4_TREADY : out STD_LOGIC;
    in_stream4_TDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    in_stream4_TDEST : in STD_LOGIC_VECTOR ( 5 downto 0 );
    in_stream4_TKEEP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_stream4_TSTRB : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_stream4_TUSER : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_stream4_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    in_stream4_TID : in STD_LOGIC_VECTOR ( 4 downto 0 );
    in_stream5_TVALID : in STD_LOGIC;
    in_stream5_TREADY : out STD_LOGIC;
    in_stream5_TDATA : in STD_LOGIC_VECTOR ( 15 downto 0 );
    in_stream5_TDEST : in STD_LOGIC_VECTOR ( 5 downto 0 );
    in_stream5_TKEEP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_stream5_TSTRB : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_stream5_TUSER : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_stream5_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    in_stream5_TID : in STD_LOGIC_VECTOR ( 4 downto 0 );
    out_stream_TVALID : out STD_LOGIC;
    out_stream_TREADY : in STD_LOGIC;
    out_stream_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out_stream_TDEST : out STD_LOGIC_VECTOR ( 5 downto 0 );
    out_stream_TKEEP : out STD_LOGIC_VECTOR ( 3 downto 0 );
    out_stream_TSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    out_stream_TUSER : out STD_LOGIC_VECTOR ( 1 downto 0 );
    out_stream_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 );
    out_stream_TID : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component design_1_scurve_adder_0_0;
  component design_1_axi_dma_raw_0 is
  port (
    s_axi_lite_aclk : in STD_LOGIC;
    m_axi_s2mm_aclk : in STD_LOGIC;
    axi_resetn : in STD_LOGIC;
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_s2mm_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_awvalid : out STD_LOGIC;
    m_axi_s2mm_awready : in STD_LOGIC;
    m_axi_s2mm_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_s2mm_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_s2mm_wlast : out STD_LOGIC;
    m_axi_s2mm_wvalid : out STD_LOGIC;
    m_axi_s2mm_wready : in STD_LOGIC;
    m_axi_s2mm_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_bvalid : in STD_LOGIC;
    m_axi_s2mm_bready : out STD_LOGIC;
    s2mm_prmry_reset_out_n : out STD_LOGIC;
    s_axis_s2mm_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_s2mm_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_s2mm_tvalid : in STD_LOGIC;
    s_axis_s2mm_tready : out STD_LOGIC;
    s_axis_s2mm_tlast : in STD_LOGIC;
    s2mm_introut : out STD_LOGIC
  );
  end component design_1_axi_dma_raw_0;
  component design_1_axi_dma_L2_0 is
  port (
    s_axi_lite_aclk : in STD_LOGIC;
    m_axi_s2mm_aclk : in STD_LOGIC;
    axi_resetn : in STD_LOGIC;
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_s2mm_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_awvalid : out STD_LOGIC;
    m_axi_s2mm_awready : in STD_LOGIC;
    m_axi_s2mm_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_s2mm_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_s2mm_wlast : out STD_LOGIC;
    m_axi_s2mm_wvalid : out STD_LOGIC;
    m_axi_s2mm_wready : in STD_LOGIC;
    m_axi_s2mm_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_bvalid : in STD_LOGIC;
    m_axi_s2mm_bready : out STD_LOGIC;
    s2mm_prmry_reset_out_n : out STD_LOGIC;
    s_axis_s2mm_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_s2mm_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_s2mm_tvalid : in STD_LOGIC;
    s_axis_s2mm_tready : out STD_LOGIC;
    s_axis_s2mm_tlast : in STD_LOGIC;
    s2mm_introut : out STD_LOGIC
  );
  end component design_1_axi_dma_L2_0;
  component design_1_axis_broadcaster_00_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component design_1_axis_broadcaster_00_0;
  component design_1_axis_broadcaster_02_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component design_1_axis_broadcaster_02_0;
  component design_1_axis_broadcaster_05_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component design_1_axis_broadcaster_05_0;
  component design_1_axis_broadcaster_04_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component design_1_axis_broadcaster_04_0;
  component design_1_axis_broadcaster_03_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component design_1_axis_broadcaster_03_0;
  component design_1_axis_broadcaster_01_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component design_1_axis_broadcaster_01_0;
  component design_1_axis_data_fifo_sa_04_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axis_data_fifo_sa_04_0;
  component design_1_axis_data_fifo_sa_03_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axis_data_fifo_sa_03_0;
  component design_1_axis_data_fifo_sa_01_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axis_data_fifo_sa_01_0;
  component design_1_axis_data_fifo_sa_00_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axis_data_fifo_sa_00_0;
  component design_1_axis_data_fifo_sa_02_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axis_data_fifo_sa_02_0;
  component design_1_axis_data_fifo_sa_05_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axis_data_fifo_sa_05_0;
  component design_1_axis_clock_converter_0_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component design_1_axis_clock_converter_0_0;
  component design_1_axis_clock_converter_1_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component design_1_axis_clock_converter_1_0;
  component design_1_axis_clock_converter_2_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component design_1_axis_clock_converter_2_0;
  component design_1_axis_clock_converter_3_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component design_1_axis_clock_converter_3_0;
  component design_1_axis_clock_converter_4_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component design_1_axis_clock_converter_4_0;
  component design_1_axis_clock_converter_5_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component design_1_axis_clock_converter_5_0;
  component design_1_axis_dwidth_converter_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component design_1_axis_dwidth_converter_0_0;
  component design_1_axis_dwidth_converter_2_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component design_1_axis_dwidth_converter_2_0;
  component design_1_axis_dwidth_converter_3_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component design_1_axis_dwidth_converter_3_0;
  component design_1_axis_dwidth_converter_4_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component design_1_axis_dwidth_converter_4_0;
  component design_1_axis_dwidth_converter_5_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component design_1_axis_dwidth_converter_5_0;
  component design_1_axis_dwidth_converter_6_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component design_1_axis_dwidth_converter_6_0;
  component design_1_axis_dwidth_conv_sw_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component design_1_axis_dwidth_conv_sw_0_0;
  component design_1_axis_dwidth_conv_sw_2_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component design_1_axis_dwidth_conv_sw_2_0;
  component design_1_axis_dwidth_conv_sw_4_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component design_1_axis_dwidth_conv_sw_4_0;
  component design_1_axis_fifo_sw_0_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axis_fifo_sw_0_0;
  component design_1_axis_fifo_sw_2_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axis_fifo_sw_2_0;
  component design_1_axis_fifo_sw_3_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axis_fifo_sw_3_0;
  component design_1_xlslice_0_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_xlslice_0_0;
  component design_1_clk_wiz_1_0 is
  port (
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component design_1_clk_wiz_1_0;
  component design_1_rst_processing_system7_0_200M_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_rst_processing_system7_0_200M_0;
  component design_1_axis_broadcaster_1r10_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component design_1_axis_broadcaster_1r10_0;
  component design_1_axis_broadcaster_1r11_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component design_1_axis_broadcaster_1r11_0;
  component design_1_axis_broadcaster_1r12_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component design_1_axis_broadcaster_1r12_0;
  component design_1_axis_broadcaster_1r13_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component design_1_axis_broadcaster_1r13_0;
  component design_1_axis_broadcaster_1r14_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component design_1_axis_broadcaster_1r14_0;
  component design_1_axis_broadcaster_1r15_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component design_1_axis_broadcaster_1r15_0;
  component design_1_axis_dwidth_conv_sw_1_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component design_1_axis_dwidth_conv_sw_1_0;
  component design_1_axis_dwidth_conv_sw_3_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component design_1_axis_dwidth_conv_sw_3_0;
  component design_1_axis_dwidth_conv_sw_5_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component design_1_axis_dwidth_conv_sw_5_0;
  component design_1_axis_fifo_sw_1_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axis_fifo_sw_1_0;
  component design_1_axis_fifo_sw_4_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axis_fifo_sw_4_0;
  component design_1_axis_fifo_sw_5_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axis_fifo_sw_5_0;
  component design_1_xlconcat_1_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component design_1_xlconcat_1_0;
  component design_1_util_vector_logic_0_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Op2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_util_vector_logic_0_0;
  component design_1_axis_data_fifo_0_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axis_data_fifo_0_0;
  component design_1_axis_data_fifo_0_6 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axis_data_fifo_0_6;
  component design_1_axis_data_fifo_0_7 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axis_data_fifo_0_7;
  component design_1_axis_data_fifo_2_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axis_data_fifo_2_0;
  component design_1_axis_data_fifo_3_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axis_data_fifo_3_0;
  component design_1_axis_data_fifo_4_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axis_data_fifo_4_0;
  component design_1_top_switch_raw_0 is
  port (
    s_axis_aclk : in STD_LOGIC;
    s_axis_aresetn : in STD_LOGIC;
    s_axis_0_tvalid : in STD_LOGIC;
    s_axis_0_tready : out STD_LOGIC;
    s_axis_0_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_0_tlast : in STD_LOGIC;
    s_axis_1_tvalid : in STD_LOGIC;
    s_axis_1_tready : out STD_LOGIC;
    s_axis_1_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_1_tlast : in STD_LOGIC;
    s_axis_2_tvalid : in STD_LOGIC;
    s_axis_2_tready : out STD_LOGIC;
    s_axis_2_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_2_tlast : in STD_LOGIC;
    s_axis_3_tvalid : in STD_LOGIC;
    s_axis_3_tready : out STD_LOGIC;
    s_axis_3_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_3_tlast : in STD_LOGIC;
    s_axis_4_tvalid : in STD_LOGIC;
    s_axis_4_tready : out STD_LOGIC;
    s_axis_4_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_4_tlast : in STD_LOGIC;
    s_axis_5_tvalid : in STD_LOGIC;
    s_axis_5_tready : out STD_LOGIC;
    s_axis_5_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_5_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    trig_tst : in STD_LOGIC;
    m_axis_event_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_event_tvalid : out STD_LOGIC;
    m_axis_event_tlast : out STD_LOGIC;
    gpio_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_4 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gpio_5 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    S_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    S_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC
  );
  end component design_1_top_switch_raw_0;
  component design_1_axis_flow_control_L2_0 is
  port (
    s_axis_aclk : in STD_LOGIC;
    s_axis_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_events_tvalid : out STD_LOGIC;
    m_axis_events_tready : in STD_LOGIC;
    m_axis_events_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    trig0 : in STD_LOGIC;
    trig1 : in STD_LOGIC;
    trig2 : in STD_LOGIC;
    trig_4led : out STD_LOGIC;
    trig_button : in STD_LOGIC;
    trig_led : out STD_LOGIC;
    trig_ext_in : in STD_LOGIC;
    trig_out : out STD_LOGIC;
    gtu_sig : in STD_LOGIC;
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    S_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    S_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC
  );
  end component design_1_axis_flow_control_L2_0;
  component design_1_l2_trigger_0_0 is
  port (
    trig_data_ap_vld : out STD_LOGIC;
    trig_pixel_ap_vld : out STD_LOGIC;
    s_axi_CTRL_BUS_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_CTRL_BUS_AWVALID : in STD_LOGIC;
    s_axi_CTRL_BUS_AWREADY : out STD_LOGIC;
    s_axi_CTRL_BUS_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_CTRL_BUS_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_CTRL_BUS_WVALID : in STD_LOGIC;
    s_axi_CTRL_BUS_WREADY : out STD_LOGIC;
    s_axi_CTRL_BUS_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_CTRL_BUS_BVALID : out STD_LOGIC;
    s_axi_CTRL_BUS_BREADY : in STD_LOGIC;
    s_axi_CTRL_BUS_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_CTRL_BUS_ARVALID : in STD_LOGIC;
    s_axi_CTRL_BUS_ARREADY : out STD_LOGIC;
    s_axi_CTRL_BUS_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_CTRL_BUS_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_CTRL_BUS_RVALID : out STD_LOGIC;
    s_axi_CTRL_BUS_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    in_stream_TVALID : in STD_LOGIC;
    in_stream_TREADY : out STD_LOGIC;
    in_stream_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_stream_TDEST : in STD_LOGIC_VECTOR ( 5 downto 0 );
    in_stream_TKEEP : in STD_LOGIC_VECTOR ( 3 downto 0 );
    in_stream_TSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    in_stream_TUSER : in STD_LOGIC_VECTOR ( 1 downto 0 );
    in_stream_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    in_stream_TID : in STD_LOGIC_VECTOR ( 4 downto 0 );
    out_stream_TVALID : out STD_LOGIC;
    out_stream_TREADY : in STD_LOGIC;
    out_stream_TDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    out_stream_TDEST : out STD_LOGIC_VECTOR ( 5 downto 0 );
    out_stream_TKEEP : out STD_LOGIC_VECTOR ( 7 downto 0 );
    out_stream_TSTRB : out STD_LOGIC_VECTOR ( 7 downto 0 );
    out_stream_TUSER : out STD_LOGIC_VECTOR ( 1 downto 0 );
    out_stream_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 );
    out_stream_TID : out STD_LOGIC_VECTOR ( 4 downto 0 );
    trig_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    trig_pixel : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_l2_trigger_0_0;
  component design_1_hv_hk_v1_0_0_0 is
  port (
    sck_p : out STD_LOGIC;
    sck_n : out STD_LOGIC;
    mosi_p : out STD_LOGIC;
    mosi_n : out STD_LOGIC;
    cs_exp_p : out STD_LOGIC;
    cs_exp_n : out STD_LOGIC;
    cs_dac_p : out STD_LOGIC;
    cs_dac_n : out STD_LOGIC;
    miso_p : in STD_LOGIC;
    miso_n : in STD_LOGIC;
    intr_p : in STD_LOGIC;
    intr_n : in STD_LOGIC;
    intr_out : out STD_LOGIC;
    gtu_sig : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  end component design_1_hv_hk_v1_0_0_0;
  component design_1_axi_gps_core_0_0 is
  port (
    i_RX_Serial : in STD_LOGIC;
    pps_signal : in STD_LOGIC;
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    S_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    S_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC
  );
  end component design_1_axi_gps_core_0_0;
  component design_1_axi_fifo_mm_s_0_0 is
  port (
    interrupt : out STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s2mm_prmry_reset_out_n : out STD_LOGIC;
    axi_str_rxd_tvalid : in STD_LOGIC;
    axi_str_rxd_tready : out STD_LOGIC;
    axi_str_rxd_tlast : in STD_LOGIC;
    axi_str_rxd_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axi_fifo_mm_s_0_0;
  component design_1_axi_gpio_1_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    gpio_io_o : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axi_gpio_1_0;
  component design_1_axis_flow_control_d1_0_0 is
  port (
    s_axis_aclk : in STD_LOGIC;
    s_axis_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_events_tvalid : out STD_LOGIC;
    m_axis_events_tready : in STD_LOGIC;
    m_axis_events_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_ta_event_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_ta_event_tvalid : in STD_LOGIC;
    s_axis_ta_event_tlast : in STD_LOGIC;
    s_axis_ta_event_tready : out STD_LOGIC;
    trig0 : in STD_LOGIC;
    trig1 : in STD_LOGIC;
    trig2 : in STD_LOGIC;
    trig_4led : out STD_LOGIC;
    trig_button : in STD_LOGIC;
    trig_led : out STD_LOGIC;
    trig_ext_in : in STD_LOGIC;
    trig_out : out STD_LOGIC;
    gtu_sig : in STD_LOGIC;
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    S_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    S_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC
  );
  end component design_1_axis_flow_control_d1_0_0;
  component design_1_ALGO_B_TA_1_0 is
  port (
    CLOCK_200 : in STD_LOGIC;
    DATA_EC0EC1EC2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    DATA_EC3EC4EC5 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    DATA_EC6EC7EC8 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FRAME : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m0_axis_tvalid : out STD_LOGIC;
    m0_axis_tready : in STD_LOGIC;
    m0_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m0_axis_tlast : out STD_LOGIC;
    m1_axis_tvalid : out STD_LOGIC;
    m1_axis_tready : in STD_LOGIC;
    m1_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m1_axis_tlast : out STD_LOGIC;
    m2_axis_tvalid : out STD_LOGIC;
    m2_axis_tready : in STD_LOGIC;
    m2_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m2_axis_tlast : out STD_LOGIC;
    m_ev_axis_tvalid : out STD_LOGIC;
    m_ev_axis_tready : in STD_LOGIC;
    m_ev_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_ev_axis_tlast : out STD_LOGIC;
    THR_CMD : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_ALGO_B_TA_1_0;
  component design_1_ALGO_B_0_0 is
  port (
    S00_AXIS_ACLK : in STD_LOGIC;
    S01_AXIS_ACLK : in STD_LOGIC;
    S00_AXIS_TDATA : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXIS_TVALID : in STD_LOGIC;
    S00_AXIS_TREADY : out STD_LOGIC;
    S01_AXIS_TDATA : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S01_AXIS_TVALID : in STD_LOGIC;
    S01_AXIS_TREADY : out STD_LOGIC;
    L1_EVENT : out STD_LOGIC;
    data_conv_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    frame_conv_out : out STD_LOGIC
  );
  end component design_1_ALGO_B_0_0;
  component design_1_ALGO_B_0_1 is
  port (
    S00_AXIS_ACLK : in STD_LOGIC;
    S01_AXIS_ACLK : in STD_LOGIC;
    S00_AXIS_TDATA : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXIS_TVALID : in STD_LOGIC;
    S00_AXIS_TREADY : out STD_LOGIC;
    S01_AXIS_TDATA : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S01_AXIS_TVALID : in STD_LOGIC;
    S01_AXIS_TREADY : out STD_LOGIC;
    L1_EVENT : out STD_LOGIC;
    data_conv_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    frame_conv_out : out STD_LOGIC
  );
  end component design_1_ALGO_B_0_1;
  component design_1_ALGO_B_0_2 is
  port (
    S00_AXIS_ACLK : in STD_LOGIC;
    S01_AXIS_ACLK : in STD_LOGIC;
    S00_AXIS_TDATA : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXIS_TVALID : in STD_LOGIC;
    S00_AXIS_TREADY : out STD_LOGIC;
    S01_AXIS_TDATA : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S01_AXIS_TVALID : in STD_LOGIC;
    S01_AXIS_TREADY : out STD_LOGIC;
    L1_EVENT : out STD_LOGIC;
    data_conv_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    frame_conv_out : out STD_LOGIC
  );
  end component design_1_ALGO_B_0_2;
  component design_1_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_xlconstant_0_0;
  component design_1_axi_cathode_ctrl_0_0 is
  port (
    GTU_HV_p : out STD_LOGIC;
    GTU_HV_n : out STD_LOGIC;
    CLK_HV_p : out STD_LOGIC;
    CLK_HV_n : out STD_LOGIC;
    DATA_HV_p : out STD_LOGIC;
    DATA_HV_n : out STD_LOGIC;
    ec_sig : in STD_LOGIC_VECTOR ( 8 downto 0 );
    axis_cathode_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_cathode_tvalid : out STD_LOGIC;
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    S_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    S_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC
  );
  end component design_1_axi_cathode_ctrl_0_0;
  component design_1_axi_fifo_mm_s_0_1 is
  port (
    interrupt : out STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s2mm_prmry_reset_out_n : out STD_LOGIC;
    axi_str_rxd_tvalid : in STD_LOGIC;
    axi_str_rxd_tready : out STD_LOGIC;
    axi_str_rxd_tlast : in STD_LOGIC;
    axi_str_rxd_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_axi_fifo_mm_s_0_1;
  component design_1_axi_data_provider_0_0 is
  port (
    clk_art0_x1 : in STD_LOGIC;
    clk_art1_x1 : in STD_LOGIC;
    clk_art2_x1 : in STD_LOGIC;
    frame_art0 : in STD_LOGIC;
    frame_art1 : in STD_LOGIC;
    frame_art2 : in STD_LOGIC;
    data_art0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    data_art1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    data_art2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    ec_sig_out : out STD_LOGIC_VECTOR ( 8 downto 0 );
    art_overbright_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_aclk : in STD_LOGIC;
    m_axis_art0l_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_art0l_tkeep : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_art0l_tvalid : out STD_LOGIC;
    m_axis_art0l_tlast : out STD_LOGIC;
    m_axis_art0l_tready : in STD_LOGIC;
    m_axis_art0r_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_art0r_tkeep : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_art0r_tvalid : out STD_LOGIC;
    m_axis_art0r_tlast : out STD_LOGIC;
    m_axis_art0r_tready : in STD_LOGIC;
    m_axis_art1l_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_art1l_tkeep : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_art1l_tvalid : out STD_LOGIC;
    m_axis_art1l_tlast : out STD_LOGIC;
    m_axis_art1l_tready : in STD_LOGIC;
    m_axis_art1r_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_art1r_tkeep : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_art1r_tvalid : out STD_LOGIC;
    m_axis_art1r_tlast : out STD_LOGIC;
    m_axis_art1r_tready : in STD_LOGIC;
    m_axis_art2l_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_art2l_tkeep : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_art2l_tvalid : out STD_LOGIC;
    m_axis_art2l_tlast : out STD_LOGIC;
    m_axis_art2l_tready : in STD_LOGIC;
    m_axis_art2r_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_art2r_tkeep : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_art2r_tvalid : out STD_LOGIC;
    m_axis_art2r_tlast : out STD_LOGIC;
    m_axis_art2r_tready : in STD_LOGIC;
    gtu_sig : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  end component design_1_axi_data_provider_0_0;
  signal ALGO_B_0_data_conv_out : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ALGO_B_0_frame_conv_out : STD_LOGIC;
  signal ALGO_B_1_L1_EVENT : STD_LOGIC;
  signal ALGO_B_1_data_conv_out : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ALGO_B_2_L1_EVENT : STD_LOGIC;
  signal ALGO_B_2_data_conv_out : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ALGO_B_TA_1_m_ev_axis_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ALGO_B_TA_1_m_ev_axis_TLAST : STD_LOGIC;
  signal ALGO_B_TA_1_m_ev_axis_TREADY : STD_LOGIC;
  signal ALGO_B_TA_1_m_ev_axis_TVALID : STD_LOGIC;
  signal ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal CLK_IN1_D_1_2_CLK_N : STD_LOGIC;
  signal CLK_IN1_D_1_2_CLK_P : STD_LOGIC;
  signal CLK_IN1_D_1_CLK_N : STD_LOGIC;
  signal CLK_IN1_D_1_CLK_P : STD_LOGIC;
  signal S01_AXI_1_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S01_AXI_1_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S01_AXI_1_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S01_AXI_1_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal S01_AXI_1_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal S01_AXI_1_AWREADY : STD_LOGIC;
  signal S01_AXI_1_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal S01_AXI_1_AWVALID : STD_LOGIC;
  signal S01_AXI_1_BREADY : STD_LOGIC;
  signal S01_AXI_1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S01_AXI_1_BVALID : STD_LOGIC;
  signal S01_AXI_1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S01_AXI_1_WLAST : STD_LOGIC;
  signal S01_AXI_1_WREADY : STD_LOGIC;
  signal S01_AXI_1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S01_AXI_1_WVALID : STD_LOGIC;
  signal algo_b_conv_0_L1_EVENT : STD_LOGIC;
  signal artx_done_1 : STD_LOGIC;
  signal axi_artix_conf_v1_0_0_artx_initb_io_TRI_I : STD_LOGIC;
  signal axi_artix_conf_v1_0_0_artx_initb_io_TRI_O : STD_LOGIC;
  signal axi_artix_conf_v1_0_0_artx_initb_io_TRI_T : STD_LOGIC;
  signal axi_artix_conf_v1_0_0_artx_programb_io_TRI_I : STD_LOGIC;
  signal axi_artix_conf_v1_0_0_artx_programb_io_TRI_O : STD_LOGIC;
  signal axi_artix_conf_v1_0_0_artx_programb_io_TRI_T : STD_LOGIC;
  signal axi_cathode_ctrl_0_CLK_HV_n : STD_LOGIC;
  signal axi_cathode_ctrl_0_CLK_HV_p : STD_LOGIC;
  signal axi_cathode_ctrl_0_DATA_HV_n : STD_LOGIC;
  signal axi_cathode_ctrl_0_DATA_HV_p : STD_LOGIC;
  signal axi_cathode_ctrl_0_GTU_HV_n : STD_LOGIC;
  signal axi_cathode_ctrl_0_GTU_HV_p : STD_LOGIC;
  signal axi_cathode_ctrl_0_axis_cathode_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_cathode_ctrl_0_axis_cathode_TVALID : STD_LOGIC;
  signal axi_data_provider_0_ec_sig_out : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal axi_data_provider_0_gtu_sig : STD_LOGIC;
  signal axi_data_provider_0_m_axis_art0l_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_data_provider_0_m_axis_art0l_TLAST : STD_LOGIC;
  signal axi_data_provider_0_m_axis_art0l_TREADY : STD_LOGIC;
  signal axi_data_provider_0_m_axis_art0l_TVALID : STD_LOGIC;
  signal axi_data_provider_0_m_axis_art0r_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_data_provider_0_m_axis_art0r_TLAST : STD_LOGIC;
  signal axi_data_provider_0_m_axis_art0r_TREADY : STD_LOGIC;
  signal axi_data_provider_0_m_axis_art0r_TVALID : STD_LOGIC;
  signal axi_data_provider_0_m_axis_art1l_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_data_provider_0_m_axis_art1l_TLAST : STD_LOGIC;
  signal axi_data_provider_0_m_axis_art1l_TREADY : STD_LOGIC;
  signal axi_data_provider_0_m_axis_art1l_TVALID : STD_LOGIC;
  signal axi_data_provider_0_m_axis_art1r_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_data_provider_0_m_axis_art1r_TLAST : STD_LOGIC;
  signal axi_data_provider_0_m_axis_art1r_TREADY : STD_LOGIC;
  signal axi_data_provider_0_m_axis_art1r_TVALID : STD_LOGIC;
  signal axi_data_provider_0_m_axis_art2l_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_data_provider_0_m_axis_art2l_TLAST : STD_LOGIC;
  signal axi_data_provider_0_m_axis_art2l_TREADY : STD_LOGIC;
  signal axi_data_provider_0_m_axis_art2l_TVALID : STD_LOGIC;
  signal axi_data_provider_0_m_axis_art2r_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_data_provider_0_m_axis_art2r_TLAST : STD_LOGIC;
  signal axi_data_provider_0_m_axis_art2r_TREADY : STD_LOGIC;
  signal axi_data_provider_0_m_axis_art2r_TVALID : STD_LOGIC;
  signal axi_dma_L1_s2mm_introut : STD_LOGIC;
  signal axi_dma_L2_M_AXI_S2MM_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_L2_M_AXI_S2MM_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_L2_M_AXI_S2MM_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_L2_M_AXI_S2MM_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_L2_M_AXI_S2MM_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_L2_M_AXI_S2MM_AWREADY : STD_LOGIC;
  signal axi_dma_L2_M_AXI_S2MM_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_L2_M_AXI_S2MM_AWVALID : STD_LOGIC;
  signal axi_dma_L2_M_AXI_S2MM_BREADY : STD_LOGIC;
  signal axi_dma_L2_M_AXI_S2MM_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_L2_M_AXI_S2MM_BVALID : STD_LOGIC;
  signal axi_dma_L2_M_AXI_S2MM_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_dma_L2_M_AXI_S2MM_WLAST : STD_LOGIC;
  signal axi_dma_L2_M_AXI_S2MM_WREADY : STD_LOGIC;
  signal axi_dma_L2_M_AXI_S2MM_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_L2_M_AXI_S2MM_WVALID : STD_LOGIC;
  signal axi_dma_L2_s2mm_introut : STD_LOGIC;
  signal axi_dma_raw_M_AXI_S2MM_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_raw_M_AXI_S2MM_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_raw_M_AXI_S2MM_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_raw_M_AXI_S2MM_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_raw_M_AXI_S2MM_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_raw_M_AXI_S2MM_AWREADY : STD_LOGIC;
  signal axi_dma_raw_M_AXI_S2MM_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_raw_M_AXI_S2MM_AWVALID : STD_LOGIC;
  signal axi_dma_raw_M_AXI_S2MM_BREADY : STD_LOGIC;
  signal axi_dma_raw_M_AXI_S2MM_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_raw_M_AXI_S2MM_BVALID : STD_LOGIC;
  signal axi_dma_raw_M_AXI_S2MM_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_dma_raw_M_AXI_S2MM_WLAST : STD_LOGIC;
  signal axi_dma_raw_M_AXI_S2MM_WREADY : STD_LOGIC;
  signal axi_dma_raw_M_AXI_S2MM_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_raw_M_AXI_S2MM_WVALID : STD_LOGIC;
  signal axi_dma_raw_s2mm_introut : STD_LOGIC;
  signal axi_fifo_mm_s_1_AXI_STR_TXD_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_fifo_mm_s_1_AXI_STR_TXD_TLAST : STD_LOGIC;
  signal axi_fifo_mm_s_1_AXI_STR_TXD_TREADY : STD_LOGIC;
  signal axi_fifo_mm_s_1_AXI_STR_TXD_TVALID : STD_LOGIC;
  signal axi_gpio_1_gpio_io_o : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M00_AXI_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARVALID : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M00_AXI_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWVALID : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_BID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal axi_interconnect_0_M00_AXI_BREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_BVALID : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_interconnect_0_M00_AXI_RID : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal axi_interconnect_0_M00_AXI_RLAST : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_RREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_RVALID : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_interconnect_0_M00_AXI_WID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M00_AXI_WLAST : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_WREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_0_M00_AXI_WVALID : STD_LOGIC;
  signal axi_interconnect_1_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_1_M00_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_1_M00_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_1_M00_AXI_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_1_M00_AXI_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_1_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_1_M00_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_1_M00_AXI_AWREADY : STD_LOGIC;
  signal axi_interconnect_1_M00_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_1_M00_AXI_AWVALID : STD_LOGIC;
  signal axi_interconnect_1_M00_AXI_BREADY : STD_LOGIC;
  signal axi_interconnect_1_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_1_M00_AXI_BVALID : STD_LOGIC;
  signal axi_interconnect_1_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_interconnect_1_M00_AXI_WLAST : STD_LOGIC;
  signal axi_interconnect_1_M00_AXI_WREADY : STD_LOGIC;
  signal axi_interconnect_1_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_1_M00_AXI_WVALID : STD_LOGIC;
  signal axi_quad_spi_0_io0_o : STD_LOGIC;
  signal axi_quad_spi_0_sck_o : STD_LOGIC;
  signal axis_broadcaster_00_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal axis_broadcaster_00_M01_AXIS_TLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_00_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_00_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_01_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal axis_broadcaster_01_M01_AXIS_TLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_01_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_01_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_02_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal axis_broadcaster_02_M01_AXIS_TLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_02_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_02_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_03_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal axis_broadcaster_03_M01_AXIS_TLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_03_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_03_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_04_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal axis_broadcaster_04_M01_AXIS_TLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_04_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_04_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_05_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal axis_broadcaster_05_M01_AXIS_TLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_05_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_05_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_1r10_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_broadcaster_1r10_M00_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1r10_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1r10_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal axis_broadcaster_1r10_M01_AXIS_TLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_1r10_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1r10_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_1r11_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_broadcaster_1r11_M00_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1r11_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1r11_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal axis_broadcaster_1r11_M01_AXIS_TLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_1r11_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1r11_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_1r12_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_broadcaster_1r12_M00_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1r12_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1r12_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal axis_broadcaster_1r12_M01_AXIS_TLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_1r12_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1r12_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_1r13_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_broadcaster_1r13_M00_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1r13_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1r13_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal axis_broadcaster_1r13_M01_AXIS_TLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_1r13_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1r13_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_1r14_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_broadcaster_1r14_M00_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1r14_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1r14_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal axis_broadcaster_1r14_M01_AXIS_TLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_1r14_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1r14_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_1r15_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_broadcaster_1r15_M00_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1r15_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1r15_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal axis_broadcaster_1r15_M01_AXIS_TLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_1r15_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1r15_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_1r1_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_broadcaster_1r1_M00_AXIS_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1r1_M00_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1r1_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1r2_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_broadcaster_1r2_M00_AXIS_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1r2_M00_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1r2_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1r3_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_broadcaster_1r3_M00_AXIS_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1r3_M00_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1r3_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1r4_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_broadcaster_1r4_M00_AXIS_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1r4_M00_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1r4_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1r5_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_broadcaster_1r5_M00_AXIS_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1r5_M00_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1r5_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1r6_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_broadcaster_1r6_M00_AXIS_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1r6_M00_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1r6_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1r_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axis_broadcaster_1r_M00_AXIS_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1r_M00_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1r_M00_AXIS_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axis_broadcaster_1r_M01_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal axis_broadcaster_1r_M01_AXIS_TDEST : STD_LOGIC_VECTOR ( 11 downto 6 );
  signal axis_broadcaster_1r_M01_AXIS_TID : STD_LOGIC_VECTOR ( 9 downto 5 );
  signal axis_broadcaster_1r_M01_AXIS_TLAST : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_broadcaster_1r_M01_AXIS_TREADY : STD_LOGIC;
  signal axis_broadcaster_1r_M01_AXIS_TUSER : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal axis_broadcaster_1r_M01_AXIS_TVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal axis_clock_converter_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_clock_converter_0_M_AXIS_TLAST : STD_LOGIC;
  signal axis_clock_converter_0_M_AXIS_TREADY : STD_LOGIC;
  signal axis_clock_converter_0_M_AXIS_TVALID : STD_LOGIC;
  signal axis_clock_converter_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_clock_converter_1_M_AXIS_TLAST : STD_LOGIC;
  signal axis_clock_converter_1_M_AXIS_TREADY : STD_LOGIC;
  signal axis_clock_converter_1_M_AXIS_TVALID : STD_LOGIC;
  signal axis_clock_converter_2_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_clock_converter_2_M_AXIS_TLAST : STD_LOGIC;
  signal axis_clock_converter_2_M_AXIS_TREADY : STD_LOGIC;
  signal axis_clock_converter_2_M_AXIS_TVALID : STD_LOGIC;
  signal axis_clock_converter_3_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_clock_converter_3_M_AXIS_TLAST : STD_LOGIC;
  signal axis_clock_converter_3_M_AXIS_TREADY : STD_LOGIC;
  signal axis_clock_converter_3_M_AXIS_TVALID : STD_LOGIC;
  signal axis_clock_converter_4_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_clock_converter_4_M_AXIS_TLAST : STD_LOGIC;
  signal axis_clock_converter_4_M_AXIS_TREADY : STD_LOGIC;
  signal axis_clock_converter_4_M_AXIS_TVALID : STD_LOGIC;
  signal axis_clock_converter_5_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_clock_converter_5_M_AXIS_TLAST : STD_LOGIC;
  signal axis_clock_converter_5_M_AXIS_TREADY : STD_LOGIC;
  signal axis_clock_converter_5_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_data_fifo_0_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_0_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_0_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_data_fifo_1_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_1_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_1_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_2_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_data_fifo_2_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_2_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_2_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_3_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_data_fifo_3_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_3_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_3_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_4_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_data_fifo_4_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_4_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_4_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_5_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_data_fifo_5_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_5_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_5_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_L2_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axis_data_fifo_L2_M_AXIS_TDEST : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal axis_data_fifo_L2_M_AXIS_TID : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal axis_data_fifo_L2_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_L2_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_L2_M_AXIS_TUSER : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axis_data_fifo_L2_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_fc_L10_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axis_data_fifo_fc_L10_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_fc_L10_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_fc_L10_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_fc_L10_axis_data_count : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axis_data_fifo_fc_L11_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axis_data_fifo_fc_L11_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_fc_L11_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_fc_L11_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_fc_L11_axis_data_count : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axis_data_fifo_fc_L12_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axis_data_fifo_fc_L12_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_fc_L12_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_fc_L12_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_fc_L13_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axis_data_fifo_fc_L13_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_fc_L13_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_fc_L13_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_fc_L14_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axis_data_fifo_fc_L14_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_fc_L14_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_fc_L14_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_fc_L9_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axis_data_fifo_fc_L9_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_fc_L9_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_fc_L9_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_fc_L9_axis_data_count : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axis_data_fifo_sa_00_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_data_fifo_sa_00_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_sa_00_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_sa_00_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_sa_01_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_data_fifo_sa_01_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_sa_01_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_sa_01_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_sa_02_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_data_fifo_sa_02_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_sa_02_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_sa_02_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_sa_03_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_data_fifo_sa_03_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_sa_03_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_sa_03_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_sa_04_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_data_fifo_sa_04_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_sa_04_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_sa_04_M_AXIS_TVALID : STD_LOGIC;
  signal axis_data_fifo_sa_05_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axis_data_fifo_sa_05_M_AXIS_TLAST : STD_LOGIC;
  signal axis_data_fifo_sa_05_M_AXIS_TREADY : STD_LOGIC;
  signal axis_data_fifo_sa_05_M_AXIS_TVALID : STD_LOGIC;
  signal axis_dwidth_converter_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_dwidth_converter_0_M_AXIS_TLAST : STD_LOGIC;
  signal axis_dwidth_converter_0_M_AXIS_TREADY : STD_LOGIC;
  signal axis_dwidth_converter_0_M_AXIS_TVALID : STD_LOGIC;
  signal axis_dwidth_converter_10_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axis_dwidth_converter_10_M_AXIS_TLAST : STD_LOGIC;
  signal axis_dwidth_converter_10_M_AXIS_TREADY : STD_LOGIC;
  signal axis_dwidth_converter_10_M_AXIS_TVALID : STD_LOGIC;
  signal axis_dwidth_converter_11_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axis_dwidth_converter_11_M_AXIS_TLAST : STD_LOGIC;
  signal axis_dwidth_converter_11_M_AXIS_TREADY : STD_LOGIC;
  signal axis_dwidth_converter_11_M_AXIS_TVALID : STD_LOGIC;
  signal axis_dwidth_converter_12_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axis_dwidth_converter_12_M_AXIS_TLAST : STD_LOGIC;
  signal axis_dwidth_converter_12_M_AXIS_TREADY : STD_LOGIC;
  signal axis_dwidth_converter_12_M_AXIS_TVALID : STD_LOGIC;
  signal axis_dwidth_converter_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 191 downto 0 );
  signal axis_dwidth_converter_1_M_AXIS_TREADY : STD_LOGIC;
  signal axis_dwidth_converter_1_M_AXIS_TVALID : STD_LOGIC;
  signal axis_dwidth_converter_2_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_dwidth_converter_2_M_AXIS_TLAST : STD_LOGIC;
  signal axis_dwidth_converter_2_M_AXIS_TREADY : STD_LOGIC;
  signal axis_dwidth_converter_2_M_AXIS_TVALID : STD_LOGIC;
  signal axis_dwidth_converter_3_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_dwidth_converter_3_M_AXIS_TLAST : STD_LOGIC;
  signal axis_dwidth_converter_3_M_AXIS_TREADY : STD_LOGIC;
  signal axis_dwidth_converter_3_M_AXIS_TVALID : STD_LOGIC;
  signal axis_dwidth_converter_4_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_dwidth_converter_4_M_AXIS_TLAST : STD_LOGIC;
  signal axis_dwidth_converter_4_M_AXIS_TREADY : STD_LOGIC;
  signal axis_dwidth_converter_4_M_AXIS_TVALID : STD_LOGIC;
  signal axis_dwidth_converter_5_M_AXIS1_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_dwidth_converter_5_M_AXIS1_TLAST : STD_LOGIC;
  signal axis_dwidth_converter_5_M_AXIS1_TREADY : STD_LOGIC;
  signal axis_dwidth_converter_5_M_AXIS1_TVALID : STD_LOGIC;
  signal axis_dwidth_converter_6_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_dwidth_converter_6_M_AXIS_TLAST : STD_LOGIC;
  signal axis_dwidth_converter_6_M_AXIS_TREADY : STD_LOGIC;
  signal axis_dwidth_converter_6_M_AXIS_TVALID : STD_LOGIC;
  signal axis_dwidth_converter_7_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axis_dwidth_converter_7_M_AXIS_TLAST : STD_LOGIC;
  signal axis_dwidth_converter_7_M_AXIS_TREADY : STD_LOGIC;
  signal axis_dwidth_converter_7_M_AXIS_TVALID : STD_LOGIC;
  signal axis_dwidth_converter_8_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axis_dwidth_converter_8_M_AXIS_TLAST : STD_LOGIC;
  signal axis_dwidth_converter_8_M_AXIS_TREADY : STD_LOGIC;
  signal axis_dwidth_converter_8_M_AXIS_TVALID : STD_LOGIC;
  signal axis_dwidth_converter_9_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axis_dwidth_converter_9_M_AXIS_TLAST : STD_LOGIC;
  signal axis_dwidth_converter_9_M_AXIS_TREADY : STD_LOGIC;
  signal axis_dwidth_converter_9_M_AXIS_TVALID : STD_LOGIC;
  signal axis_flow_control_L2_m_axis_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axis_flow_control_L2_m_axis_TLAST : STD_LOGIC;
  signal axis_flow_control_L2_m_axis_TREADY : STD_LOGIC;
  signal axis_flow_control_L2_m_axis_TVALID : STD_LOGIC;
  signal axis_flow_control_L2_trig_4led : STD_LOGIC;
  signal axis_flow_control_L2_trig_led : STD_LOGIC;
  signal axis_flow_control_d1_0_m_axis_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axis_flow_control_d1_0_m_axis_TKEEP : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_flow_control_d1_0_m_axis_TLAST : STD_LOGIC;
  signal axis_flow_control_d1_0_m_axis_TREADY : STD_LOGIC;
  signal axis_flow_control_d1_0_m_axis_TVALID : STD_LOGIC;
  signal axis_flow_control_d1_0_trig_4led : STD_LOGIC;
  signal axis_flow_control_d1_0_trig_led : STD_LOGIC;
  signal axis_flow_control_d1_0_trig_out : STD_LOGIC;
  signal clk_art_1_1_CLK_N : STD_LOGIC;
  signal clk_art_1_1_CLK_P : STD_LOGIC;
  signal clk_wiz_0_clk_out1 : STD_LOGIC;
  signal clk_wiz_0_locked : STD_LOGIC;
  signal clk_wiz_2_clk_out1 : STD_LOGIC;
  signal clk_wiz_2_locked : STD_LOGIC;
  signal clk_wiz_3_clk_out1 : STD_LOGIC;
  signal clk_wiz_3_locked : STD_LOGIC;
  signal data_art0_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal data_art1_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal data_art2_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal dma_L2_S_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal dma_L2_S_AXIS_TLAST : STD_LOGIC;
  signal dma_L2_S_AXIS_TREADY : STD_LOGIC;
  signal dma_L2_S_AXIS_TVALID : STD_LOGIC;
  signal frame_art0_1 : STD_LOGIC;
  signal frame_art1_1 : STD_LOGIC;
  signal frame_art2_1 : STD_LOGIC;
  signal hv_hk_v1_0_0_cs_dac_n : STD_LOGIC;
  signal hv_hk_v1_0_0_cs_dac_p : STD_LOGIC;
  signal hv_hk_v1_0_0_cs_exp_n : STD_LOGIC;
  signal hv_hk_v1_0_0_cs_exp_p : STD_LOGIC;
  signal hv_hk_v1_0_0_intr_out : STD_LOGIC;
  signal hv_hk_v1_0_0_mosi_n : STD_LOGIC;
  signal hv_hk_v1_0_0_mosi_p : STD_LOGIC;
  signal hv_hk_v1_0_0_sck_n : STD_LOGIC;
  signal hv_hk_v1_0_0_sck_p : STD_LOGIC;
  signal i_RX_Serial_1 : STD_LOGIC;
  signal inst_interconnect_100MHz_M01_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M01_AXI_ARREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M01_AXI_ARVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M01_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M01_AXI_AWREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M01_AXI_AWVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M01_AXI_BREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M01_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_M01_AXI_BVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M01_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M01_AXI_RREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M01_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_M01_AXI_RVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M01_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M01_AXI_WREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M01_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_100MHz_M01_AXI_WVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M04_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M04_AXI_ARREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M04_AXI_ARVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M04_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M04_AXI_AWREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M04_AXI_AWVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M04_AXI_BREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M04_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_M04_AXI_BVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M04_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M04_AXI_RREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M04_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_M04_AXI_RVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M04_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M04_AXI_WREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M04_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_100MHz_M04_AXI_WVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M05_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M05_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal inst_interconnect_100MHz_M05_AXI_ARREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M05_AXI_ARVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M05_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M05_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal inst_interconnect_100MHz_M05_AXI_AWREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M05_AXI_AWVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M05_AXI_BREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M05_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_M05_AXI_BVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M05_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M05_AXI_RREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M05_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_M05_AXI_RVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M05_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M05_AXI_WREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M05_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_100MHz_M05_AXI_WVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M10_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M10_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal inst_interconnect_100MHz_M10_AXI_ARREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M10_AXI_ARVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M10_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M10_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal inst_interconnect_100MHz_M10_AXI_AWREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M10_AXI_AWVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M10_AXI_BREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M10_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_M10_AXI_BVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M10_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M10_AXI_RREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M10_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_M10_AXI_RVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M10_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M10_AXI_WREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M10_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_100MHz_M10_AXI_WVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M11_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M11_AXI_ARREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M11_AXI_ARVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M11_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M11_AXI_AWREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M11_AXI_AWVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M11_AXI_BREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M11_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_M11_AXI_BVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M11_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M11_AXI_RREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M11_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_M11_AXI_RVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M11_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M11_AXI_WREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M11_AXI_WVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M12_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M12_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal inst_interconnect_100MHz_M12_AXI_ARREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M12_AXI_ARVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M12_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M12_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal inst_interconnect_100MHz_M12_AXI_AWREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M12_AXI_AWVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M12_AXI_BREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M12_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_M12_AXI_BVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M12_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M12_AXI_RREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M12_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_M12_AXI_RVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M12_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M12_AXI_WREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M12_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_100MHz_M12_AXI_WVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M13_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M13_AXI_ARREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M13_AXI_ARVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M13_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M13_AXI_AWREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M13_AXI_AWVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M13_AXI_BREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M13_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_M13_AXI_BVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M13_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M13_AXI_RREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M13_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_M13_AXI_RVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M13_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M13_AXI_WREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M13_AXI_WVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M14_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M14_AXI_ARREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M14_AXI_ARVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M14_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M14_AXI_AWREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M14_AXI_AWVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M14_AXI_BREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M14_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_M14_AXI_BVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M14_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M14_AXI_RREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M14_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_100MHz_M14_AXI_RVALID : STD_LOGIC;
  signal inst_interconnect_100MHz_M14_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_100MHz_M14_AXI_WREADY : STD_LOGIC;
  signal inst_interconnect_100MHz_M14_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_100MHz_M14_AXI_WVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_M02_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_200MHz_M02_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal inst_interconnect_200MHz_M02_AXI_ARREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_M02_AXI_ARVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_M02_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_200MHz_M02_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal inst_interconnect_200MHz_M02_AXI_AWREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_M02_AXI_AWVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_M02_AXI_BREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_M02_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_200MHz_M02_AXI_BVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_M02_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_200MHz_M02_AXI_RREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_M02_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_200MHz_M02_AXI_RVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_M02_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_200MHz_M02_AXI_WREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_M02_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_200MHz_M02_AXI_WVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_M03_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_200MHz_M03_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal inst_interconnect_200MHz_M03_AXI_ARREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_M03_AXI_ARVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_M03_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_200MHz_M03_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal inst_interconnect_200MHz_M03_AXI_AWREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_M03_AXI_AWVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_M03_AXI_BREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_M03_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_200MHz_M03_AXI_BVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_M03_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_200MHz_M03_AXI_RREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_M03_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_200MHz_M03_AXI_RVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_M03_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_200MHz_M03_AXI_WREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_M03_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_200MHz_M03_AXI_WVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_M05_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_200MHz_M05_AXI_ARREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_M05_AXI_ARVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_M05_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_200MHz_M05_AXI_AWREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_M05_AXI_AWVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_M05_AXI_BREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_M05_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_200MHz_M05_AXI_BVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_M05_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_200MHz_M05_AXI_RREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_M05_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_200MHz_M05_AXI_RVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_M05_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_200MHz_M05_AXI_WREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_M05_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_200MHz_M05_AXI_WVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_M06_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_200MHz_M06_AXI_ARREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_M06_AXI_ARVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_M06_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_200MHz_M06_AXI_AWREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_M06_AXI_AWVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_M06_AXI_BREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_M06_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_200MHz_M06_AXI_BVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_M06_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_200MHz_M06_AXI_RREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_M06_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal inst_interconnect_200MHz_M06_AXI_RVALID : STD_LOGIC;
  signal inst_interconnect_200MHz_M06_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal inst_interconnect_200MHz_M06_AXI_WREADY : STD_LOGIC;
  signal inst_interconnect_200MHz_M06_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_interconnect_200MHz_M06_AXI_WVALID : STD_LOGIC;
  signal intr_n_1 : STD_LOGIC;
  signal intr_p_1 : STD_LOGIC;
  signal l2_trigger_0_out_stream_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal l2_trigger_0_out_stream_TDEST : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal l2_trigger_0_out_stream_TID : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal l2_trigger_0_out_stream_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal l2_trigger_0_out_stream_TREADY : STD_LOGIC;
  signal l2_trigger_0_out_stream_TUSER : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal l2_trigger_0_out_stream_TVALID : STD_LOGIC;
  signal l2_trigger_0_trig_data : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal miso_n_1 : STD_LOGIC;
  signal miso_p_1 : STD_LOGIC;
  signal pps_signal_1 : STD_LOGIC;
  signal processing_system7_0_DDR_ADDR : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal processing_system7_0_DDR_BA : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_DDR_CAS_N : STD_LOGIC;
  signal processing_system7_0_DDR_CKE : STD_LOGIC;
  signal processing_system7_0_DDR_CK_N : STD_LOGIC;
  signal processing_system7_0_DDR_CK_P : STD_LOGIC;
  signal processing_system7_0_DDR_CS_N : STD_LOGIC;
  signal processing_system7_0_DDR_DM : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_DQ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_DDR_DQS_N : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_DQS_P : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_ODT : STD_LOGIC;
  signal processing_system7_0_DDR_RAS_N : STD_LOGIC;
  signal processing_system7_0_DDR_RESET_N : STD_LOGIC;
  signal processing_system7_0_DDR_WE_N : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK0 : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK1 : STD_LOGIC;
  signal processing_system7_0_FCLK_RESET0_N : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_DDR_VRN : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_DDR_VRP : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_MIO : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal processing_system7_0_FIXED_IO_PS_CLK : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_PS_PORB : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_PS_SRSTB : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_BREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_BVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RLAST : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WLAST : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP1_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP1_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP1_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP1_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP1_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP1_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP1_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP1_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP1_ARREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP1_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP1_ARVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP1_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP1_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP1_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP1_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP1_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP1_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP1_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP1_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP1_AWREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP1_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP1_AWVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP1_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP1_BREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP1_BVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP1_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP1_RLAST : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP1_RREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP1_RVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP1_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP1_WLAST : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP1_WREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP1_WVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph1_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph1_M00_AXI_ARREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph1_M00_AXI_ARVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph1_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph1_M00_AXI_AWREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph1_M00_AXI_AWVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph1_M00_AXI_BREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph1_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph1_M00_AXI_BVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph1_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph1_M00_AXI_RREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph1_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph1_M00_AXI_RVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph1_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph1_M00_AXI_WREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph1_M00_AXI_WVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_ARREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_axi_periph_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_AWREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_axi_periph_M00_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_axi_periph_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_BVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_axi_periph_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_RVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_WREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M00_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_axi_periph_M02_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M02_AXI_ARREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M02_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_axi_periph_M02_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M02_AXI_AWREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M02_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_axi_periph_M02_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_axi_periph_M02_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M02_AXI_BVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M02_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M02_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_axi_periph_M02_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M02_AXI_RVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M02_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M02_AXI_WREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M02_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M02_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_axi_periph_M03_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M03_AXI_ARREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M03_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_axi_periph_M03_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M03_AXI_AWREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M03_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_axi_periph_M03_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_axi_periph_M03_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M03_AXI_BVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M03_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M03_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_axi_periph_M03_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M03_AXI_RVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M03_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M03_AXI_WREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M03_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M03_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal processing_system7_0_axi_periph_M06_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M06_AXI_ARREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M06_AXI_ARVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M06_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M06_AXI_AWREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M06_AXI_AWVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M06_AXI_BREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M06_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M06_AXI_BVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M06_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M06_AXI_RREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M06_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M06_AXI_RVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M06_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M06_AXI_WREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M06_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M06_AXI_WVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M07_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M07_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_M07_AXI_ARREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M07_AXI_ARVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M07_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M07_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_M07_AXI_AWREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M07_AXI_AWVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M07_AXI_BREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M07_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M07_AXI_BVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M07_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M07_AXI_RREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M07_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M07_AXI_RVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M07_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M07_AXI_WREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M07_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M07_AXI_WVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M08_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M08_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_M08_AXI_ARREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M08_AXI_ARVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M08_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M08_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_M08_AXI_AWREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M08_AXI_AWVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M08_AXI_BREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M08_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M08_AXI_BVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M08_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M08_AXI_RREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M08_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M08_AXI_RVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M08_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M08_AXI_WREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M08_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M08_AXI_WVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M09_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M09_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_M09_AXI_ARREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M09_AXI_ARVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M09_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M09_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_axi_periph_M09_AXI_AWREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M09_AXI_AWVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M09_AXI_BREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M09_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M09_AXI_BVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M09_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M09_AXI_RREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M09_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_axi_periph_M09_AXI_RVALID : STD_LOGIC;
  signal processing_system7_0_axi_periph_M09_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_axi_periph_M09_AXI_WREADY : STD_LOGIC;
  signal processing_system7_0_axi_periph_M09_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_axi_periph_M09_AXI_WVALID : STD_LOGIC;
  signal rst_processing_system7_0_200M_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rst_processing_system7_0_50M_interconnect_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rst_processing_system7_0_50M_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal scurve_adder_0_out_stream_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal scurve_adder_0_out_stream_TDEST : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal scurve_adder_0_out_stream_TID : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal scurve_adder_0_out_stream_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal scurve_adder_0_out_stream_TREADY : STD_LOGIC;
  signal scurve_adder_0_out_stream_TUSER : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal scurve_adder_0_out_stream_TVALID : STD_LOGIC;
  signal spaciroc3_sc_0_loadb_sc_pc : STD_LOGIC;
  signal spaciroc3_sc_0_resetb_pc : STD_LOGIC;
  signal spaciroc3_sc_0_select_din_pc : STD_LOGIC;
  signal spaciroc3_sc_0_select_sc_probe_pc : STD_LOGIC;
  signal spaciroc3_sc_0_sr_ck_pc : STD_LOGIC;
  signal spaciroc3_sc_0_sr_in_pc : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal spaciroc3_sc_0_sr_rstb_pc : STD_LOGIC;
  signal top_switch_raw_m_axis_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal top_switch_raw_m_axis_TLAST : STD_LOGIC;
  signal top_switch_raw_m_axis_TREADY : STD_LOGIC;
  signal top_switch_raw_m_axis_TVALID : STD_LOGIC;
  signal trig_ext_in_1 : STD_LOGIC;
  signal util_vector_logic_0_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconcat_0_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xlconcat_1_dout : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xlslice_0_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_ALGO_B_1_frame_conv_out_UNCONNECTED : STD_LOGIC;
  signal NLW_ALGO_B_2_frame_conv_out_UNCONNECTED : STD_LOGIC;
  signal NLW_ALGO_B_TA_1_m0_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_ALGO_B_TA_1_m0_axis_tvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_ALGO_B_TA_1_m1_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_ALGO_B_TA_1_m1_axis_tvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_ALGO_B_TA_1_m2_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_ALGO_B_TA_1_m2_axis_tvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_ALGO_B_TA_1_m0_axis_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_ALGO_B_TA_1_m1_axis_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_ALGO_B_TA_1_m2_axis_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axi_data_provider_0_art_overbright_out_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_axi_data_provider_0_m_axis_art0l_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_axi_data_provider_0_m_axis_art0r_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_axi_data_provider_0_m_axis_art1l_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_axi_data_provider_0_m_axis_art1r_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_axi_data_provider_0_m_axis_art2l_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_axi_data_provider_0_m_axis_art2r_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_axi_dma_L1_s2mm_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_L2_s2mm_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_raw_s2mm_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_fifo4adcv_axi_str_rxd_tready_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_fifo4adcv_interrupt_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_fifo4adcv_s2mm_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_fifo_mm_s_1_interrupt_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_fifo_mm_s_1_mm2s_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_fifo_mm_s_TA_ev_axi_str_rxd_tready_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_fifo_mm_s_TA_ev_interrupt_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_fifo_mm_s_TA_ev_s2mm_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_quad_spi_0_io0_t_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_quad_spi_0_io1_o_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_quad_spi_0_io1_t_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_quad_spi_0_ip2intc_irpt_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_quad_spi_0_sck_t_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_quad_spi_0_ss_t_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_quad_spi_0_ss_o_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axis_broadcaster_1r_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_axis_broadcaster_1r_m_axis_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_axis_broadcaster_1r_m_axis_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_axis_broadcaster_1r10_m_axis_tlast_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axis_broadcaster_1r11_m_axis_tlast_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axis_broadcaster_1r12_m_axis_tlast_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axis_broadcaster_1r13_m_axis_tlast_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axis_broadcaster_1r14_m_axis_tlast_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axis_broadcaster_1r15_m_axis_tlast_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axis_data_1st_fifo_0_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_1st_fifo_0_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_1st_fifo_0_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_1st_fifo_1_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_1st_fifo_1_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_1st_fifo_1_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_1st_fifo_2_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_1st_fifo_2_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_1st_fifo_2_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_1st_fifo_3_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_1st_fifo_3_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_1st_fifo_3_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_1st_fifo_4_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_1st_fifo_4_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_1st_fifo_4_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_1st_fifo_5_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_1st_fifo_5_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_1st_fifo_5_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_L2_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_L2_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_L2_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_fc_L2b_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_fc_L2b_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_fc_L2b_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_fc_L2b_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_axis_data_fifo_fc_L2b_m_axis_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_axis_data_fifo_fc_L2b_m_axis_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_axis_data_fifo_sa_00_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_sa_00_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_sa_00_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_sa_01_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_sa_01_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_sa_01_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_sa_02_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_sa_02_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_sa_02_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_sa_03_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_sa_03_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_sa_03_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_sa_04_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_sa_04_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_sa_04_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_sa_05_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_sa_05_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_data_fifo_sa_05_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_dwidth_conv_sw_0_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_axis_dwidth_conv_sw_1_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_axis_dwidth_conv_sw_2_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_axis_dwidth_conv_sw_3_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_axis_dwidth_conv_sw_4_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_axis_dwidth_conv_sw_5_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_axis_dwidth_converter_1_m_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_axis_dwidth_converter_1_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal NLW_axis_fifo_sw_0_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_fifo_sw_0_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_fifo_sw_1_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_fifo_sw_1_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_fifo_sw_1_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_fifo_sw_2_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_fifo_sw_2_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_fifo_sw_3_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_fifo_sw_3_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_fifo_sw_4_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_fifo_sw_4_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_fifo_sw_4_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_fifo_sw_5_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_fifo_sw_5_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_fifo_sw_5_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_axis_flow_control_D1_m_axis_events_tvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_axis_flow_control_D1_trig_button_UNCONNECTED : STD_LOGIC;
  signal NLW_axis_flow_control_D1_m_axis_events_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_axis_flow_control_D2_m_axis_events_tvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_axis_flow_control_D2_trig_button_UNCONNECTED : STD_LOGIC;
  signal NLW_axis_flow_control_D2_trig_out_UNCONNECTED : STD_LOGIC;
  signal NLW_axis_flow_control_D2_m_axis_events_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_inst_interconnect_200MHz_M01_AXI_araddr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M01_AXI_arprot_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M01_AXI_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M01_AXI_awaddr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M01_AXI_awprot_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M01_AXI_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M01_AXI_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M01_AXI_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M01_AXI_wdata_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M01_AXI_wstrb_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M01_AXI_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M04_AXI_araddr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M04_AXI_arprot_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M04_AXI_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M04_AXI_awaddr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M04_AXI_awprot_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M04_AXI_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M04_AXI_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M04_AXI_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M04_AXI_wdata_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M04_AXI_wstrb_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interconnect_200MHz_M04_AXI_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_l2_trigger_0_interrupt_UNCONNECTED : STD_LOGIC;
  signal NLW_l2_trigger_0_trig_data_ap_vld_UNCONNECTED : STD_LOGIC;
  signal NLW_l2_trigger_0_trig_pixel_ap_vld_UNCONNECTED : STD_LOGIC;
  signal NLW_l2_trigger_0_in_stream_TKEEP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_l2_trigger_0_in_stream_TSTRB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_l2_trigger_0_out_stream_TKEEP_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_l2_trigger_0_out_stream_TSTRB_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_l2_trigger_0_trig_pixel_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_ARREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_S_AXI_HP0_RLAST_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_S_AXI_HP0_RVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_S_AXI_HP0_BID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_WACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_WCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP1_RACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP1_RCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP1_WACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP1_WCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_rst_processing_system7_0_100M_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_processing_system7_0_100M_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_processing_system7_0_100M_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_processing_system7_0_200M_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_processing_system7_0_200M_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_processing_system7_0_200M_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_scurve_adder_0_interrupt_UNCONNECTED : STD_LOGIC;
  signal NLW_scurve_adder_0_in_stream0_TKEEP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_scurve_adder_0_in_stream0_TSTRB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_scurve_adder_0_in_stream1_TKEEP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_scurve_adder_0_in_stream1_TSTRB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_scurve_adder_0_in_stream2_TKEEP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_scurve_adder_0_in_stream2_TSTRB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_scurve_adder_0_in_stream3_TKEEP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_scurve_adder_0_in_stream3_TSTRB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_scurve_adder_0_in_stream4_TKEEP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_scurve_adder_0_in_stream4_TSTRB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_scurve_adder_0_in_stream5_TKEEP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_scurve_adder_0_in_stream5_TSTRB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_scurve_adder_0_out_stream_TKEEP_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_scurve_adder_0_out_stream_TSTRB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_spaciroc3_sc_0_user_led_UNCONNECTED : STD_LOGIC;
  signal NLW_top_switch_raw_m_axis_event_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_top_switch_raw_m_axis_event_tvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_top_switch_raw_m_axis_event_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
begin
  CLK_HV_n <= axi_cathode_ctrl_0_CLK_HV_n;
  CLK_HV_p <= axi_cathode_ctrl_0_CLK_HV_p;
  CLK_IN1_D_1_2_CLK_N <= clk_art_2_clk_n;
  CLK_IN1_D_1_2_CLK_P <= clk_art_2_clk_p;
  CLK_IN1_D_1_CLK_N <= clk_art_0_clk_n;
  CLK_IN1_D_1_CLK_P <= clk_art_0_clk_p;
  DATA_HV_n <= axi_cathode_ctrl_0_DATA_HV_n;
  DATA_HV_p <= axi_cathode_ctrl_0_DATA_HV_p;
  GTU_HV_n <= axi_cathode_ctrl_0_GTU_HV_n;
  GTU_HV_p <= axi_cathode_ctrl_0_GTU_HV_p;
  artx_conf_cclk <= axi_quad_spi_0_sck_o;
  artx_conf_data <= axi_quad_spi_0_io0_o;
  artx_done_1 <= artx_done;
  artx_initb_io_tri_o <= axi_artix_conf_v1_0_0_artx_initb_io_TRI_O;
  artx_initb_io_tri_t <= axi_artix_conf_v1_0_0_artx_initb_io_TRI_T;
  artx_programb_io_tri_o <= axi_artix_conf_v1_0_0_artx_programb_io_TRI_O;
  artx_programb_io_tri_t <= axi_artix_conf_v1_0_0_artx_programb_io_TRI_T;
  axi_artix_conf_v1_0_0_artx_initb_io_TRI_I <= artx_initb_io_tri_i;
  axi_artix_conf_v1_0_0_artx_programb_io_TRI_I <= artx_programb_io_tri_i;
  clk_art_1_1_CLK_N <= clk_art_1_clk_n;
  clk_art_1_1_CLK_P <= clk_art_1_clk_p;
  cs_dac_n <= hv_hk_v1_0_0_cs_dac_n;
  cs_dac_p <= hv_hk_v1_0_0_cs_dac_p;
  cs_exp_n <= hv_hk_v1_0_0_cs_exp_n;
  cs_exp_p <= hv_hk_v1_0_0_cs_exp_p;
  data_art0_1(15 downto 0) <= data_art0(15 downto 0);
  data_art1_1(15 downto 0) <= data_art1(15 downto 0);
  data_art2_1(15 downto 0) <= data_art2(15 downto 0);
  frame_art0_1 <= frame_art0;
  frame_art1_1 <= frame_art1;
  frame_art2_1 <= frame_art2;
  i_RX_Serial_1 <= i_RX_Serial;
  intr_n_1 <= intr_n;
  intr_p_1 <= intr_p;
  loadb_sc_pc <= spaciroc3_sc_0_loadb_sc_pc;
  miso_n_1 <= miso_n;
  miso_p_1 <= miso_p;
  mosi_n <= hv_hk_v1_0_0_mosi_n;
  mosi_p <= hv_hk_v1_0_0_mosi_p;
  pps_signal_1 <= pps_signal;
  resetb_pc <= spaciroc3_sc_0_resetb_pc;
  sck_n <= hv_hk_v1_0_0_sck_n;
  sck_p <= hv_hk_v1_0_0_sck_p;
  select_din_pc <= spaciroc3_sc_0_select_din_pc;
  select_sc_probe_pc <= spaciroc3_sc_0_select_sc_probe_pc;
  sr_ck_pc <= spaciroc3_sc_0_sr_ck_pc;
  sr_ck_pc_art <= spaciroc3_sc_0_sr_ck_pc;
  sr_in_pc(5 downto 0) <= spaciroc3_sc_0_sr_in_pc(5 downto 0);
  sr_rstb_pc <= spaciroc3_sc_0_sr_rstb_pc;
  trig_L1_4led <= axis_flow_control_d1_0_trig_4led;
  trig_L2_4led <= axis_flow_control_L2_trig_4led;
  trig_ext_in_1 <= trig_ext_in;
  trig_out <= axis_flow_control_d1_0_trig_out;
  user_led(0) <= util_vector_logic_0_Res(0);
ALGO_B_0: component design_1_ALGO_B_0_0
     port map (
      L1_EVENT => algo_b_conv_0_L1_EVENT,
      S00_AXIS_ACLK => processing_system7_0_FCLK_CLK1,
      S00_AXIS_TDATA(7 downto 0) => axis_broadcaster_1r10_M00_AXIS_TDATA(7 downto 0),
      S00_AXIS_TREADY => axis_broadcaster_1r10_M00_AXIS_TREADY,
      S00_AXIS_TVALID => axis_broadcaster_1r10_M00_AXIS_TVALID(0),
      S01_AXIS_ACLK => processing_system7_0_FCLK_CLK1,
      S01_AXIS_TDATA(7 downto 0) => axis_broadcaster_1r11_M00_AXIS_TDATA(7 downto 0),
      S01_AXIS_TREADY => axis_broadcaster_1r11_M00_AXIS_TREADY,
      S01_AXIS_TVALID => axis_broadcaster_1r11_M00_AXIS_TVALID(0),
      data_conv_out(15 downto 0) => ALGO_B_0_data_conv_out(15 downto 0),
      frame_conv_out => ALGO_B_0_frame_conv_out
    );
ALGO_B_1: component design_1_ALGO_B_0_1
     port map (
      L1_EVENT => ALGO_B_1_L1_EVENT,
      S00_AXIS_ACLK => processing_system7_0_FCLK_CLK1,
      S00_AXIS_TDATA(7 downto 0) => axis_broadcaster_1r14_M00_AXIS_TDATA(7 downto 0),
      S00_AXIS_TREADY => axis_broadcaster_1r14_M00_AXIS_TREADY,
      S00_AXIS_TVALID => axis_broadcaster_1r14_M00_AXIS_TVALID(0),
      S01_AXIS_ACLK => processing_system7_0_FCLK_CLK1,
      S01_AXIS_TDATA(7 downto 0) => axis_broadcaster_1r15_M00_AXIS_TDATA(7 downto 0),
      S01_AXIS_TREADY => axis_broadcaster_1r15_M00_AXIS_TREADY,
      S01_AXIS_TVALID => axis_broadcaster_1r15_M00_AXIS_TVALID(0),
      data_conv_out(15 downto 0) => ALGO_B_1_data_conv_out(15 downto 0),
      frame_conv_out => NLW_ALGO_B_1_frame_conv_out_UNCONNECTED
    );
ALGO_B_2: component design_1_ALGO_B_0_2
     port map (
      L1_EVENT => ALGO_B_2_L1_EVENT,
      S00_AXIS_ACLK => processing_system7_0_FCLK_CLK1,
      S00_AXIS_TDATA(7 downto 0) => axis_broadcaster_1r13_M00_AXIS_TDATA(7 downto 0),
      S00_AXIS_TREADY => axis_broadcaster_1r13_M00_AXIS_TREADY,
      S00_AXIS_TVALID => axis_broadcaster_1r13_M00_AXIS_TVALID(0),
      S01_AXIS_ACLK => processing_system7_0_FCLK_CLK1,
      S01_AXIS_TDATA(7 downto 0) => axis_broadcaster_1r12_M00_AXIS_TDATA(7 downto 0),
      S01_AXIS_TREADY => axis_broadcaster_1r12_M00_AXIS_TREADY,
      S01_AXIS_TVALID => axis_broadcaster_1r12_M00_AXIS_TVALID(0),
      data_conv_out(15 downto 0) => ALGO_B_2_data_conv_out(15 downto 0),
      frame_conv_out => NLW_ALGO_B_2_frame_conv_out_UNCONNECTED
    );
ALGO_B_TA_1: component design_1_ALGO_B_TA_1_0
     port map (
      CLOCK_200 => processing_system7_0_FCLK_CLK1,
      DATA_EC0EC1EC2(15 downto 0) => ALGO_B_0_data_conv_out(15 downto 0),
      DATA_EC3EC4EC5(15 downto 0) => ALGO_B_2_data_conv_out(15 downto 0),
      DATA_EC6EC7EC8(15 downto 0) => ALGO_B_1_data_conv_out(15 downto 0),
      FRAME => ALGO_B_0_frame_conv_out,
      THR_CMD(31 downto 0) => axi_gpio_1_gpio_io_o(31 downto 0),
      m0_axis_tdata(31 downto 0) => NLW_ALGO_B_TA_1_m0_axis_tdata_UNCONNECTED(31 downto 0),
      m0_axis_tlast => NLW_ALGO_B_TA_1_m0_axis_tlast_UNCONNECTED,
      m0_axis_tready => '0',
      m0_axis_tvalid => NLW_ALGO_B_TA_1_m0_axis_tvalid_UNCONNECTED,
      m1_axis_tdata(31 downto 0) => NLW_ALGO_B_TA_1_m1_axis_tdata_UNCONNECTED(31 downto 0),
      m1_axis_tlast => NLW_ALGO_B_TA_1_m1_axis_tlast_UNCONNECTED,
      m1_axis_tready => '0',
      m1_axis_tvalid => NLW_ALGO_B_TA_1_m1_axis_tvalid_UNCONNECTED,
      m2_axis_tdata(31 downto 0) => NLW_ALGO_B_TA_1_m2_axis_tdata_UNCONNECTED(31 downto 0),
      m2_axis_tlast => NLW_ALGO_B_TA_1_m2_axis_tlast_UNCONNECTED,
      m2_axis_tready => '0',
      m2_axis_tvalid => NLW_ALGO_B_TA_1_m2_axis_tvalid_UNCONNECTED,
      m_axis_aclk => processing_system7_0_FCLK_CLK1,
      m_axis_aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_ev_axis_tdata(31 downto 0) => ALGO_B_TA_1_m_ev_axis_TDATA(31 downto 0),
      m_ev_axis_tlast => ALGO_B_TA_1_m_ev_axis_TLAST,
      m_ev_axis_tready => ALGO_B_TA_1_m_ev_axis_TREADY,
      m_ev_axis_tvalid => ALGO_B_TA_1_m_ev_axis_TVALID
    );
PL_FW_VER: component design_1_xlconstant_0_0
     port map (
      dout(31 downto 0) => xlconstant_0_dout(31 downto 0)
    );
axi_artix_conf_v1_0_0: component design_1_axi_artix_conf_v1_0_0_0
     port map (
      artx_done => artx_done_1,
      artx_initb_i => axi_artix_conf_v1_0_0_artx_initb_io_TRI_I,
      artx_initb_o => axi_artix_conf_v1_0_0_artx_initb_io_TRI_O,
      artx_initb_t => axi_artix_conf_v1_0_0_artx_initb_io_TRI_T,
      artx_programb_i => axi_artix_conf_v1_0_0_artx_programb_io_TRI_I,
      artx_programb_o => axi_artix_conf_v1_0_0_artx_programb_io_TRI_O,
      artx_programb_t => axi_artix_conf_v1_0_0_artx_programb_io_TRI_T,
      s00_axi_aclk => processing_system7_0_FCLK_CLK0,
      s00_axi_araddr(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARADDR(3 downto 0),
      s00_axi_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s00_axi_arprot(2 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARPROT(2 downto 0),
      s00_axi_arready => processing_system7_0_axi_periph_M00_AXI_ARREADY,
      s00_axi_arvalid => processing_system7_0_axi_periph_M00_AXI_ARVALID(0),
      s00_axi_awaddr(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWADDR(3 downto 0),
      s00_axi_awprot(2 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWPROT(2 downto 0),
      s00_axi_awready => processing_system7_0_axi_periph_M00_AXI_AWREADY,
      s00_axi_awvalid => processing_system7_0_axi_periph_M00_AXI_AWVALID(0),
      s00_axi_bready => processing_system7_0_axi_periph_M00_AXI_BREADY(0),
      s00_axi_bresp(1 downto 0) => processing_system7_0_axi_periph_M00_AXI_BRESP(1 downto 0),
      s00_axi_bvalid => processing_system7_0_axi_periph_M00_AXI_BVALID,
      s00_axi_rdata(31 downto 0) => processing_system7_0_axi_periph_M00_AXI_RDATA(31 downto 0),
      s00_axi_rready => processing_system7_0_axi_periph_M00_AXI_RREADY(0),
      s00_axi_rresp(1 downto 0) => processing_system7_0_axi_periph_M00_AXI_RRESP(1 downto 0),
      s00_axi_rvalid => processing_system7_0_axi_periph_M00_AXI_RVALID,
      s00_axi_wdata(31 downto 0) => processing_system7_0_axi_periph_M00_AXI_WDATA(31 downto 0),
      s00_axi_wready => processing_system7_0_axi_periph_M00_AXI_WREADY,
      s00_axi_wstrb(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_WSTRB(3 downto 0),
      s00_axi_wvalid => processing_system7_0_axi_periph_M00_AXI_WVALID(0)
    );
axi_cathode_ctrl_0: component design_1_axi_cathode_ctrl_0_0
     port map (
      CLK_HV_n => axi_cathode_ctrl_0_CLK_HV_n,
      CLK_HV_p => axi_cathode_ctrl_0_CLK_HV_p,
      DATA_HV_n => axi_cathode_ctrl_0_DATA_HV_n,
      DATA_HV_p => axi_cathode_ctrl_0_DATA_HV_p,
      GTU_HV_n => axi_cathode_ctrl_0_GTU_HV_n,
      GTU_HV_p => axi_cathode_ctrl_0_GTU_HV_p,
      S_AXI_ACLK => processing_system7_0_FCLK_CLK0,
      S_AXI_ARADDR(6 downto 0) => inst_interconnect_100MHz_M05_AXI_ARADDR(6 downto 0),
      S_AXI_ARESETN => rst_processing_system7_0_50M_peripheral_aresetn(0),
      S_AXI_ARPROT(2 downto 0) => inst_interconnect_100MHz_M05_AXI_ARPROT(2 downto 0),
      S_AXI_ARREADY => inst_interconnect_100MHz_M05_AXI_ARREADY,
      S_AXI_ARVALID => inst_interconnect_100MHz_M05_AXI_ARVALID,
      S_AXI_AWADDR(6 downto 0) => inst_interconnect_100MHz_M05_AXI_AWADDR(6 downto 0),
      S_AXI_AWPROT(2 downto 0) => inst_interconnect_100MHz_M05_AXI_AWPROT(2 downto 0),
      S_AXI_AWREADY => inst_interconnect_100MHz_M05_AXI_AWREADY,
      S_AXI_AWVALID => inst_interconnect_100MHz_M05_AXI_AWVALID,
      S_AXI_BREADY => inst_interconnect_100MHz_M05_AXI_BREADY,
      S_AXI_BRESP(1 downto 0) => inst_interconnect_100MHz_M05_AXI_BRESP(1 downto 0),
      S_AXI_BVALID => inst_interconnect_100MHz_M05_AXI_BVALID,
      S_AXI_RDATA(31 downto 0) => inst_interconnect_100MHz_M05_AXI_RDATA(31 downto 0),
      S_AXI_RREADY => inst_interconnect_100MHz_M05_AXI_RREADY,
      S_AXI_RRESP(1 downto 0) => inst_interconnect_100MHz_M05_AXI_RRESP(1 downto 0),
      S_AXI_RVALID => inst_interconnect_100MHz_M05_AXI_RVALID,
      S_AXI_WDATA(31 downto 0) => inst_interconnect_100MHz_M05_AXI_WDATA(31 downto 0),
      S_AXI_WREADY => inst_interconnect_100MHz_M05_AXI_WREADY,
      S_AXI_WSTRB(3 downto 0) => inst_interconnect_100MHz_M05_AXI_WSTRB(3 downto 0),
      S_AXI_WVALID => inst_interconnect_100MHz_M05_AXI_WVALID,
      axis_cathode_tdata(31 downto 0) => axi_cathode_ctrl_0_axis_cathode_TDATA(31 downto 0),
      axis_cathode_tvalid => axi_cathode_ctrl_0_axis_cathode_TVALID,
      ec_sig(8 downto 0) => axi_data_provider_0_ec_sig_out(8 downto 0)
    );
axi_data_provider_0: component design_1_axi_data_provider_0_0
     port map (
      art_overbright_out(2 downto 0) => NLW_axi_data_provider_0_art_overbright_out_UNCONNECTED(2 downto 0),
      clk_art0_x1 => clk_wiz_0_clk_out1,
      clk_art1_x1 => clk_wiz_3_clk_out1,
      clk_art2_x1 => clk_wiz_2_clk_out1,
      data_art0(15 downto 0) => data_art0_1(15 downto 0),
      data_art1(15 downto 0) => data_art1_1(15 downto 0),
      data_art2(15 downto 0) => data_art2_1(15 downto 0),
      ec_sig_out(8 downto 0) => axi_data_provider_0_ec_sig_out(8 downto 0),
      frame_art0 => frame_art0_1,
      frame_art1 => frame_art1_1,
      frame_art2 => frame_art2_1,
      gtu_sig => axi_data_provider_0_gtu_sig,
      m_axis_aclk => processing_system7_0_FCLK_CLK0,
      m_axis_art0l_tdata(15 downto 0) => axi_data_provider_0_m_axis_art0l_TDATA(15 downto 0),
      m_axis_art0l_tkeep(1 downto 0) => NLW_axi_data_provider_0_m_axis_art0l_tkeep_UNCONNECTED(1 downto 0),
      m_axis_art0l_tlast => axi_data_provider_0_m_axis_art0l_TLAST,
      m_axis_art0l_tready => axi_data_provider_0_m_axis_art0l_TREADY,
      m_axis_art0l_tvalid => axi_data_provider_0_m_axis_art0l_TVALID,
      m_axis_art0r_tdata(15 downto 0) => axi_data_provider_0_m_axis_art0r_TDATA(15 downto 0),
      m_axis_art0r_tkeep(1 downto 0) => NLW_axi_data_provider_0_m_axis_art0r_tkeep_UNCONNECTED(1 downto 0),
      m_axis_art0r_tlast => axi_data_provider_0_m_axis_art0r_TLAST,
      m_axis_art0r_tready => axi_data_provider_0_m_axis_art0r_TREADY,
      m_axis_art0r_tvalid => axi_data_provider_0_m_axis_art0r_TVALID,
      m_axis_art1l_tdata(15 downto 0) => axi_data_provider_0_m_axis_art1l_TDATA(15 downto 0),
      m_axis_art1l_tkeep(1 downto 0) => NLW_axi_data_provider_0_m_axis_art1l_tkeep_UNCONNECTED(1 downto 0),
      m_axis_art1l_tlast => axi_data_provider_0_m_axis_art1l_TLAST,
      m_axis_art1l_tready => axi_data_provider_0_m_axis_art1l_TREADY,
      m_axis_art1l_tvalid => axi_data_provider_0_m_axis_art1l_TVALID,
      m_axis_art1r_tdata(15 downto 0) => axi_data_provider_0_m_axis_art1r_TDATA(15 downto 0),
      m_axis_art1r_tkeep(1 downto 0) => NLW_axi_data_provider_0_m_axis_art1r_tkeep_UNCONNECTED(1 downto 0),
      m_axis_art1r_tlast => axi_data_provider_0_m_axis_art1r_TLAST,
      m_axis_art1r_tready => axi_data_provider_0_m_axis_art1r_TREADY,
      m_axis_art1r_tvalid => axi_data_provider_0_m_axis_art1r_TVALID,
      m_axis_art2l_tdata(15 downto 0) => axi_data_provider_0_m_axis_art2l_TDATA(15 downto 0),
      m_axis_art2l_tkeep(1 downto 0) => NLW_axi_data_provider_0_m_axis_art2l_tkeep_UNCONNECTED(1 downto 0),
      m_axis_art2l_tlast => axi_data_provider_0_m_axis_art2l_TLAST,
      m_axis_art2l_tready => axi_data_provider_0_m_axis_art2l_TREADY,
      m_axis_art2l_tvalid => axi_data_provider_0_m_axis_art2l_TVALID,
      m_axis_art2r_tdata(15 downto 0) => axi_data_provider_0_m_axis_art2r_TDATA(15 downto 0),
      m_axis_art2r_tkeep(1 downto 0) => NLW_axi_data_provider_0_m_axis_art2r_tkeep_UNCONNECTED(1 downto 0),
      m_axis_art2r_tlast => axi_data_provider_0_m_axis_art2r_TLAST,
      m_axis_art2r_tready => axi_data_provider_0_m_axis_art2r_TREADY,
      m_axis_art2r_tvalid => axi_data_provider_0_m_axis_art2r_TVALID,
      s00_axi_aclk => processing_system7_0_FCLK_CLK0,
      s00_axi_araddr(6 downto 0) => processing_system7_0_axi_periph_M09_AXI_ARADDR(6 downto 0),
      s00_axi_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s00_axi_arprot(2 downto 0) => processing_system7_0_axi_periph_M09_AXI_ARPROT(2 downto 0),
      s00_axi_arready => processing_system7_0_axi_periph_M09_AXI_ARREADY,
      s00_axi_arvalid => processing_system7_0_axi_periph_M09_AXI_ARVALID,
      s00_axi_awaddr(6 downto 0) => processing_system7_0_axi_periph_M09_AXI_AWADDR(6 downto 0),
      s00_axi_awprot(2 downto 0) => processing_system7_0_axi_periph_M09_AXI_AWPROT(2 downto 0),
      s00_axi_awready => processing_system7_0_axi_periph_M09_AXI_AWREADY,
      s00_axi_awvalid => processing_system7_0_axi_periph_M09_AXI_AWVALID,
      s00_axi_bready => processing_system7_0_axi_periph_M09_AXI_BREADY,
      s00_axi_bresp(1 downto 0) => processing_system7_0_axi_periph_M09_AXI_BRESP(1 downto 0),
      s00_axi_bvalid => processing_system7_0_axi_periph_M09_AXI_BVALID,
      s00_axi_rdata(31 downto 0) => processing_system7_0_axi_periph_M09_AXI_RDATA(31 downto 0),
      s00_axi_rready => processing_system7_0_axi_periph_M09_AXI_RREADY,
      s00_axi_rresp(1 downto 0) => processing_system7_0_axi_periph_M09_AXI_RRESP(1 downto 0),
      s00_axi_rvalid => processing_system7_0_axi_periph_M09_AXI_RVALID,
      s00_axi_wdata(31 downto 0) => processing_system7_0_axi_periph_M09_AXI_WDATA(31 downto 0),
      s00_axi_wready => processing_system7_0_axi_periph_M09_AXI_WREADY,
      s00_axi_wstrb(3 downto 0) => processing_system7_0_axi_periph_M09_AXI_WSTRB(3 downto 0),
      s00_axi_wvalid => processing_system7_0_axi_periph_M09_AXI_WVALID
    );
axi_dma_L1: component design_1_axi_dma_L1_0
     port map (
      axi_resetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      m_axi_s2mm_aclk => processing_system7_0_FCLK_CLK0,
      m_axi_s2mm_awaddr(31 downto 0) => S01_AXI_1_AWADDR(31 downto 0),
      m_axi_s2mm_awburst(1 downto 0) => S01_AXI_1_AWBURST(1 downto 0),
      m_axi_s2mm_awcache(3 downto 0) => S01_AXI_1_AWCACHE(3 downto 0),
      m_axi_s2mm_awlen(7 downto 0) => S01_AXI_1_AWLEN(7 downto 0),
      m_axi_s2mm_awprot(2 downto 0) => S01_AXI_1_AWPROT(2 downto 0),
      m_axi_s2mm_awready => S01_AXI_1_AWREADY,
      m_axi_s2mm_awsize(2 downto 0) => S01_AXI_1_AWSIZE(2 downto 0),
      m_axi_s2mm_awvalid => S01_AXI_1_AWVALID,
      m_axi_s2mm_bready => S01_AXI_1_BREADY,
      m_axi_s2mm_bresp(1 downto 0) => S01_AXI_1_BRESP(1 downto 0),
      m_axi_s2mm_bvalid => S01_AXI_1_BVALID,
      m_axi_s2mm_wdata(31 downto 0) => S01_AXI_1_WDATA(31 downto 0),
      m_axi_s2mm_wlast => S01_AXI_1_WLAST,
      m_axi_s2mm_wready => S01_AXI_1_WREADY,
      m_axi_s2mm_wstrb(3 downto 0) => S01_AXI_1_WSTRB(3 downto 0),
      m_axi_s2mm_wvalid => S01_AXI_1_WVALID,
      s2mm_introut => axi_dma_L1_s2mm_introut,
      s2mm_prmry_reset_out_n => NLW_axi_dma_L1_s2mm_prmry_reset_out_n_UNCONNECTED,
      s_axi_lite_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_lite_araddr(9 downto 0) => inst_interconnect_100MHz_M11_AXI_ARADDR(9 downto 0),
      s_axi_lite_arready => inst_interconnect_100MHz_M11_AXI_ARREADY,
      s_axi_lite_arvalid => inst_interconnect_100MHz_M11_AXI_ARVALID,
      s_axi_lite_awaddr(9 downto 0) => inst_interconnect_100MHz_M11_AXI_AWADDR(9 downto 0),
      s_axi_lite_awready => inst_interconnect_100MHz_M11_AXI_AWREADY,
      s_axi_lite_awvalid => inst_interconnect_100MHz_M11_AXI_AWVALID,
      s_axi_lite_bready => inst_interconnect_100MHz_M11_AXI_BREADY,
      s_axi_lite_bresp(1 downto 0) => inst_interconnect_100MHz_M11_AXI_BRESP(1 downto 0),
      s_axi_lite_bvalid => inst_interconnect_100MHz_M11_AXI_BVALID,
      s_axi_lite_rdata(31 downto 0) => inst_interconnect_100MHz_M11_AXI_RDATA(31 downto 0),
      s_axi_lite_rready => inst_interconnect_100MHz_M11_AXI_RREADY,
      s_axi_lite_rresp(1 downto 0) => inst_interconnect_100MHz_M11_AXI_RRESP(1 downto 0),
      s_axi_lite_rvalid => inst_interconnect_100MHz_M11_AXI_RVALID,
      s_axi_lite_wdata(31 downto 0) => inst_interconnect_100MHz_M11_AXI_WDATA(31 downto 0),
      s_axi_lite_wready => inst_interconnect_100MHz_M11_AXI_WREADY,
      s_axi_lite_wvalid => inst_interconnect_100MHz_M11_AXI_WVALID,
      s_axis_s2mm_tdata(31 downto 0) => axis_flow_control_L2_m_axis_TDATA(31 downto 0),
      s_axis_s2mm_tkeep(3 downto 0) => B"1111",
      s_axis_s2mm_tlast => axis_flow_control_L2_m_axis_TLAST,
      s_axis_s2mm_tready => axis_flow_control_L2_m_axis_TREADY,
      s_axis_s2mm_tvalid => axis_flow_control_L2_m_axis_TVALID
    );
axi_dma_L2: component design_1_axi_dma_L2_0
     port map (
      axi_resetn => '1',
      m_axi_s2mm_aclk => processing_system7_0_FCLK_CLK0,
      m_axi_s2mm_awaddr(31 downto 0) => axi_dma_L2_M_AXI_S2MM_AWADDR(31 downto 0),
      m_axi_s2mm_awburst(1 downto 0) => axi_dma_L2_M_AXI_S2MM_AWBURST(1 downto 0),
      m_axi_s2mm_awcache(3 downto 0) => axi_dma_L2_M_AXI_S2MM_AWCACHE(3 downto 0),
      m_axi_s2mm_awlen(7 downto 0) => axi_dma_L2_M_AXI_S2MM_AWLEN(7 downto 0),
      m_axi_s2mm_awprot(2 downto 0) => axi_dma_L2_M_AXI_S2MM_AWPROT(2 downto 0),
      m_axi_s2mm_awready => axi_dma_L2_M_AXI_S2MM_AWREADY,
      m_axi_s2mm_awsize(2 downto 0) => axi_dma_L2_M_AXI_S2MM_AWSIZE(2 downto 0),
      m_axi_s2mm_awvalid => axi_dma_L2_M_AXI_S2MM_AWVALID,
      m_axi_s2mm_bready => axi_dma_L2_M_AXI_S2MM_BREADY,
      m_axi_s2mm_bresp(1 downto 0) => axi_dma_L2_M_AXI_S2MM_BRESP(1 downto 0),
      m_axi_s2mm_bvalid => axi_dma_L2_M_AXI_S2MM_BVALID,
      m_axi_s2mm_wdata(63 downto 0) => axi_dma_L2_M_AXI_S2MM_WDATA(63 downto 0),
      m_axi_s2mm_wlast => axi_dma_L2_M_AXI_S2MM_WLAST,
      m_axi_s2mm_wready => axi_dma_L2_M_AXI_S2MM_WREADY,
      m_axi_s2mm_wstrb(7 downto 0) => axi_dma_L2_M_AXI_S2MM_WSTRB(7 downto 0),
      m_axi_s2mm_wvalid => axi_dma_L2_M_AXI_S2MM_WVALID,
      s2mm_introut => axi_dma_L2_s2mm_introut,
      s2mm_prmry_reset_out_n => NLW_axi_dma_L2_s2mm_prmry_reset_out_n_UNCONNECTED,
      s_axi_lite_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_lite_araddr(9 downto 0) => inst_interconnect_100MHz_M13_AXI_ARADDR(9 downto 0),
      s_axi_lite_arready => inst_interconnect_100MHz_M13_AXI_ARREADY,
      s_axi_lite_arvalid => inst_interconnect_100MHz_M13_AXI_ARVALID,
      s_axi_lite_awaddr(9 downto 0) => inst_interconnect_100MHz_M13_AXI_AWADDR(9 downto 0),
      s_axi_lite_awready => inst_interconnect_100MHz_M13_AXI_AWREADY,
      s_axi_lite_awvalid => inst_interconnect_100MHz_M13_AXI_AWVALID,
      s_axi_lite_bready => inst_interconnect_100MHz_M13_AXI_BREADY,
      s_axi_lite_bresp(1 downto 0) => inst_interconnect_100MHz_M13_AXI_BRESP(1 downto 0),
      s_axi_lite_bvalid => inst_interconnect_100MHz_M13_AXI_BVALID,
      s_axi_lite_rdata(31 downto 0) => inst_interconnect_100MHz_M13_AXI_RDATA(31 downto 0),
      s_axi_lite_rready => inst_interconnect_100MHz_M13_AXI_RREADY,
      s_axi_lite_rresp(1 downto 0) => inst_interconnect_100MHz_M13_AXI_RRESP(1 downto 0),
      s_axi_lite_rvalid => inst_interconnect_100MHz_M13_AXI_RVALID,
      s_axi_lite_wdata(31 downto 0) => inst_interconnect_100MHz_M13_AXI_WDATA(31 downto 0),
      s_axi_lite_wready => inst_interconnect_100MHz_M13_AXI_WREADY,
      s_axi_lite_wvalid => inst_interconnect_100MHz_M13_AXI_WVALID,
      s_axis_s2mm_tdata(63 downto 0) => dma_L2_S_AXIS_TDATA(63 downto 0),
      s_axis_s2mm_tkeep(7 downto 0) => B"11111111",
      s_axis_s2mm_tlast => dma_L2_S_AXIS_TLAST,
      s_axis_s2mm_tready => dma_L2_S_AXIS_TREADY,
      s_axis_s2mm_tvalid => dma_L2_S_AXIS_TVALID
    );
axi_dma_raw: component design_1_axi_dma_raw_0
     port map (
      axi_resetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axi_s2mm_aclk => processing_system7_0_FCLK_CLK1,
      m_axi_s2mm_awaddr(31 downto 0) => axi_dma_raw_M_AXI_S2MM_AWADDR(31 downto 0),
      m_axi_s2mm_awburst(1 downto 0) => axi_dma_raw_M_AXI_S2MM_AWBURST(1 downto 0),
      m_axi_s2mm_awcache(3 downto 0) => axi_dma_raw_M_AXI_S2MM_AWCACHE(3 downto 0),
      m_axi_s2mm_awlen(7 downto 0) => axi_dma_raw_M_AXI_S2MM_AWLEN(7 downto 0),
      m_axi_s2mm_awprot(2 downto 0) => axi_dma_raw_M_AXI_S2MM_AWPROT(2 downto 0),
      m_axi_s2mm_awready => axi_dma_raw_M_AXI_S2MM_AWREADY,
      m_axi_s2mm_awsize(2 downto 0) => axi_dma_raw_M_AXI_S2MM_AWSIZE(2 downto 0),
      m_axi_s2mm_awvalid => axi_dma_raw_M_AXI_S2MM_AWVALID,
      m_axi_s2mm_bready => axi_dma_raw_M_AXI_S2MM_BREADY,
      m_axi_s2mm_bresp(1 downto 0) => axi_dma_raw_M_AXI_S2MM_BRESP(1 downto 0),
      m_axi_s2mm_bvalid => axi_dma_raw_M_AXI_S2MM_BVALID,
      m_axi_s2mm_wdata(63 downto 0) => axi_dma_raw_M_AXI_S2MM_WDATA(63 downto 0),
      m_axi_s2mm_wlast => axi_dma_raw_M_AXI_S2MM_WLAST,
      m_axi_s2mm_wready => axi_dma_raw_M_AXI_S2MM_WREADY,
      m_axi_s2mm_wstrb(7 downto 0) => axi_dma_raw_M_AXI_S2MM_WSTRB(7 downto 0),
      m_axi_s2mm_wvalid => axi_dma_raw_M_AXI_S2MM_WVALID,
      s2mm_introut => axi_dma_raw_s2mm_introut,
      s2mm_prmry_reset_out_n => NLW_axi_dma_raw_s2mm_prmry_reset_out_n_UNCONNECTED,
      s_axi_lite_aclk => processing_system7_0_FCLK_CLK1,
      s_axi_lite_araddr(9 downto 0) => processing_system7_0_axi_periph1_M00_AXI_ARADDR(9 downto 0),
      s_axi_lite_arready => processing_system7_0_axi_periph1_M00_AXI_ARREADY,
      s_axi_lite_arvalid => processing_system7_0_axi_periph1_M00_AXI_ARVALID,
      s_axi_lite_awaddr(9 downto 0) => processing_system7_0_axi_periph1_M00_AXI_AWADDR(9 downto 0),
      s_axi_lite_awready => processing_system7_0_axi_periph1_M00_AXI_AWREADY,
      s_axi_lite_awvalid => processing_system7_0_axi_periph1_M00_AXI_AWVALID,
      s_axi_lite_bready => processing_system7_0_axi_periph1_M00_AXI_BREADY,
      s_axi_lite_bresp(1 downto 0) => processing_system7_0_axi_periph1_M00_AXI_BRESP(1 downto 0),
      s_axi_lite_bvalid => processing_system7_0_axi_periph1_M00_AXI_BVALID,
      s_axi_lite_rdata(31 downto 0) => processing_system7_0_axi_periph1_M00_AXI_RDATA(31 downto 0),
      s_axi_lite_rready => processing_system7_0_axi_periph1_M00_AXI_RREADY,
      s_axi_lite_rresp(1 downto 0) => processing_system7_0_axi_periph1_M00_AXI_RRESP(1 downto 0),
      s_axi_lite_rvalid => processing_system7_0_axi_periph1_M00_AXI_RVALID,
      s_axi_lite_wdata(31 downto 0) => processing_system7_0_axi_periph1_M00_AXI_WDATA(31 downto 0),
      s_axi_lite_wready => processing_system7_0_axi_periph1_M00_AXI_WREADY,
      s_axi_lite_wvalid => processing_system7_0_axi_periph1_M00_AXI_WVALID,
      s_axis_s2mm_tdata(63 downto 0) => axis_flow_control_d1_0_m_axis_TDATA(63 downto 0),
      s_axis_s2mm_tkeep(7 downto 0) => axis_flow_control_d1_0_m_axis_TKEEP(7 downto 0),
      s_axis_s2mm_tlast => axis_flow_control_d1_0_m_axis_TLAST,
      s_axis_s2mm_tready => axis_flow_control_d1_0_m_axis_TREADY,
      s_axis_s2mm_tvalid => axis_flow_control_d1_0_m_axis_TVALID
    );
axi_fifo4adcv: component design_1_axi_fifo_mm_s_0_1
     port map (
      axi_str_rxd_tdata(31 downto 0) => axi_cathode_ctrl_0_axis_cathode_TDATA(31 downto 0),
      axi_str_rxd_tlast => '0',
      axi_str_rxd_tready => NLW_axi_fifo4adcv_axi_str_rxd_tready_UNCONNECTED,
      axi_str_rxd_tvalid => axi_cathode_ctrl_0_axis_cathode_TVALID,
      interrupt => NLW_axi_fifo4adcv_interrupt_UNCONNECTED,
      s2mm_prmry_reset_out_n => NLW_axi_fifo4adcv_s2mm_prmry_reset_out_n_UNCONNECTED,
      s_axi_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_araddr(31 downto 0) => inst_interconnect_100MHz_M14_AXI_ARADDR(31 downto 0),
      s_axi_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axi_arready => inst_interconnect_100MHz_M14_AXI_ARREADY,
      s_axi_arvalid => inst_interconnect_100MHz_M14_AXI_ARVALID,
      s_axi_awaddr(31 downto 0) => inst_interconnect_100MHz_M14_AXI_AWADDR(31 downto 0),
      s_axi_awready => inst_interconnect_100MHz_M14_AXI_AWREADY,
      s_axi_awvalid => inst_interconnect_100MHz_M14_AXI_AWVALID,
      s_axi_bready => inst_interconnect_100MHz_M14_AXI_BREADY,
      s_axi_bresp(1 downto 0) => inst_interconnect_100MHz_M14_AXI_BRESP(1 downto 0),
      s_axi_bvalid => inst_interconnect_100MHz_M14_AXI_BVALID,
      s_axi_rdata(31 downto 0) => inst_interconnect_100MHz_M14_AXI_RDATA(31 downto 0),
      s_axi_rready => inst_interconnect_100MHz_M14_AXI_RREADY,
      s_axi_rresp(1 downto 0) => inst_interconnect_100MHz_M14_AXI_RRESP(1 downto 0),
      s_axi_rvalid => inst_interconnect_100MHz_M14_AXI_RVALID,
      s_axi_wdata(31 downto 0) => inst_interconnect_100MHz_M14_AXI_WDATA(31 downto 0),
      s_axi_wready => inst_interconnect_100MHz_M14_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => inst_interconnect_100MHz_M14_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => inst_interconnect_100MHz_M14_AXI_WVALID
    );
axi_fifo_mm_s_1: component design_1_axi_fifo_mm_s_1_0
     port map (
      axi_str_txd_tdata(31 downto 0) => axi_fifo_mm_s_1_AXI_STR_TXD_TDATA(31 downto 0),
      axi_str_txd_tlast => axi_fifo_mm_s_1_AXI_STR_TXD_TLAST,
      axi_str_txd_tready => axi_fifo_mm_s_1_AXI_STR_TXD_TREADY,
      axi_str_txd_tvalid => axi_fifo_mm_s_1_AXI_STR_TXD_TVALID,
      interrupt => NLW_axi_fifo_mm_s_1_interrupt_UNCONNECTED,
      mm2s_prmry_reset_out_n => NLW_axi_fifo_mm_s_1_mm2s_prmry_reset_out_n_UNCONNECTED,
      s_axi_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_araddr(31 downto 0) => processing_system7_0_axi_periph_M06_AXI_ARADDR(31 downto 0),
      s_axi_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axi_arready => processing_system7_0_axi_periph_M06_AXI_ARREADY,
      s_axi_arvalid => processing_system7_0_axi_periph_M06_AXI_ARVALID,
      s_axi_awaddr(31 downto 0) => processing_system7_0_axi_periph_M06_AXI_AWADDR(31 downto 0),
      s_axi_awready => processing_system7_0_axi_periph_M06_AXI_AWREADY,
      s_axi_awvalid => processing_system7_0_axi_periph_M06_AXI_AWVALID,
      s_axi_bready => processing_system7_0_axi_periph_M06_AXI_BREADY,
      s_axi_bresp(1 downto 0) => processing_system7_0_axi_periph_M06_AXI_BRESP(1 downto 0),
      s_axi_bvalid => processing_system7_0_axi_periph_M06_AXI_BVALID,
      s_axi_rdata(31 downto 0) => processing_system7_0_axi_periph_M06_AXI_RDATA(31 downto 0),
      s_axi_rready => processing_system7_0_axi_periph_M06_AXI_RREADY,
      s_axi_rresp(1 downto 0) => processing_system7_0_axi_periph_M06_AXI_RRESP(1 downto 0),
      s_axi_rvalid => processing_system7_0_axi_periph_M06_AXI_RVALID,
      s_axi_wdata(31 downto 0) => processing_system7_0_axi_periph_M06_AXI_WDATA(31 downto 0),
      s_axi_wready => processing_system7_0_axi_periph_M06_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => processing_system7_0_axi_periph_M06_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => processing_system7_0_axi_periph_M06_AXI_WVALID
    );
axi_fifo_mm_s_TA_ev: component design_1_axi_fifo_mm_s_0_0
     port map (
      axi_str_rxd_tdata(31 downto 0) => B"00000000000000000000000000000000",
      axi_str_rxd_tlast => '0',
      axi_str_rxd_tready => NLW_axi_fifo_mm_s_TA_ev_axi_str_rxd_tready_UNCONNECTED,
      axi_str_rxd_tvalid => '0',
      interrupt => NLW_axi_fifo_mm_s_TA_ev_interrupt_UNCONNECTED,
      s2mm_prmry_reset_out_n => NLW_axi_fifo_mm_s_TA_ev_s2mm_prmry_reset_out_n_UNCONNECTED,
      s_axi_aclk => processing_system7_0_FCLK_CLK1,
      s_axi_araddr(31 downto 0) => inst_interconnect_200MHz_M05_AXI_ARADDR(31 downto 0),
      s_axi_aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      s_axi_arready => inst_interconnect_200MHz_M05_AXI_ARREADY,
      s_axi_arvalid => inst_interconnect_200MHz_M05_AXI_ARVALID,
      s_axi_awaddr(31 downto 0) => inst_interconnect_200MHz_M05_AXI_AWADDR(31 downto 0),
      s_axi_awready => inst_interconnect_200MHz_M05_AXI_AWREADY,
      s_axi_awvalid => inst_interconnect_200MHz_M05_AXI_AWVALID,
      s_axi_bready => inst_interconnect_200MHz_M05_AXI_BREADY,
      s_axi_bresp(1 downto 0) => inst_interconnect_200MHz_M05_AXI_BRESP(1 downto 0),
      s_axi_bvalid => inst_interconnect_200MHz_M05_AXI_BVALID,
      s_axi_rdata(31 downto 0) => inst_interconnect_200MHz_M05_AXI_RDATA(31 downto 0),
      s_axi_rready => inst_interconnect_200MHz_M05_AXI_RREADY,
      s_axi_rresp(1 downto 0) => inst_interconnect_200MHz_M05_AXI_RRESP(1 downto 0),
      s_axi_rvalid => inst_interconnect_200MHz_M05_AXI_RVALID,
      s_axi_wdata(31 downto 0) => inst_interconnect_200MHz_M05_AXI_WDATA(31 downto 0),
      s_axi_wready => inst_interconnect_200MHz_M05_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => inst_interconnect_200MHz_M05_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => inst_interconnect_200MHz_M05_AXI_WVALID
    );
axi_gpio_0: component design_1_axi_gpio_0_0
     port map (
      gpio2_io_i(31 downto 0) => xlconstant_0_dout(31 downto 0),
      gpio_io_i(31 downto 0) => xlconcat_0_dout(31 downto 0),
      s_axi_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_araddr(8 downto 0) => processing_system7_0_axi_periph_M03_AXI_ARADDR(8 downto 0),
      s_axi_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axi_arready => processing_system7_0_axi_periph_M03_AXI_ARREADY,
      s_axi_arvalid => processing_system7_0_axi_periph_M03_AXI_ARVALID(0),
      s_axi_awaddr(8 downto 0) => processing_system7_0_axi_periph_M03_AXI_AWADDR(8 downto 0),
      s_axi_awready => processing_system7_0_axi_periph_M03_AXI_AWREADY,
      s_axi_awvalid => processing_system7_0_axi_periph_M03_AXI_AWVALID(0),
      s_axi_bready => processing_system7_0_axi_periph_M03_AXI_BREADY(0),
      s_axi_bresp(1 downto 0) => processing_system7_0_axi_periph_M03_AXI_BRESP(1 downto 0),
      s_axi_bvalid => processing_system7_0_axi_periph_M03_AXI_BVALID,
      s_axi_rdata(31 downto 0) => processing_system7_0_axi_periph_M03_AXI_RDATA(31 downto 0),
      s_axi_rready => processing_system7_0_axi_periph_M03_AXI_RREADY(0),
      s_axi_rresp(1 downto 0) => processing_system7_0_axi_periph_M03_AXI_RRESP(1 downto 0),
      s_axi_rvalid => processing_system7_0_axi_periph_M03_AXI_RVALID,
      s_axi_wdata(31 downto 0) => processing_system7_0_axi_periph_M03_AXI_WDATA(31 downto 0),
      s_axi_wready => processing_system7_0_axi_periph_M03_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => processing_system7_0_axi_periph_M03_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => processing_system7_0_axi_periph_M03_AXI_WVALID(0)
    );
axi_gpio_TA_ev: component design_1_axi_gpio_1_0
     port map (
      gpio_io_o(31 downto 0) => axi_gpio_1_gpio_io_o(31 downto 0),
      s_axi_aclk => processing_system7_0_FCLK_CLK1,
      s_axi_araddr(8 downto 0) => inst_interconnect_200MHz_M06_AXI_ARADDR(8 downto 0),
      s_axi_aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      s_axi_arready => inst_interconnect_200MHz_M06_AXI_ARREADY,
      s_axi_arvalid => inst_interconnect_200MHz_M06_AXI_ARVALID,
      s_axi_awaddr(8 downto 0) => inst_interconnect_200MHz_M06_AXI_AWADDR(8 downto 0),
      s_axi_awready => inst_interconnect_200MHz_M06_AXI_AWREADY,
      s_axi_awvalid => inst_interconnect_200MHz_M06_AXI_AWVALID,
      s_axi_bready => inst_interconnect_200MHz_M06_AXI_BREADY,
      s_axi_bresp(1 downto 0) => inst_interconnect_200MHz_M06_AXI_BRESP(1 downto 0),
      s_axi_bvalid => inst_interconnect_200MHz_M06_AXI_BVALID,
      s_axi_rdata(31 downto 0) => inst_interconnect_200MHz_M06_AXI_RDATA(31 downto 0),
      s_axi_rready => inst_interconnect_200MHz_M06_AXI_RREADY,
      s_axi_rresp(1 downto 0) => inst_interconnect_200MHz_M06_AXI_RRESP(1 downto 0),
      s_axi_rvalid => inst_interconnect_200MHz_M06_AXI_RVALID,
      s_axi_wdata(31 downto 0) => inst_interconnect_200MHz_M06_AXI_WDATA(31 downto 0),
      s_axi_wready => inst_interconnect_200MHz_M06_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => inst_interconnect_200MHz_M06_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => inst_interconnect_200MHz_M06_AXI_WVALID
    );
axi_gps_core_0: component design_1_axi_gps_core_0_0
     port map (
      S_AXI_ACLK => processing_system7_0_FCLK_CLK0,
      S_AXI_ARADDR(4 downto 0) => inst_interconnect_100MHz_M10_AXI_ARADDR(4 downto 0),
      S_AXI_ARESETN => rst_processing_system7_0_50M_peripheral_aresetn(0),
      S_AXI_ARPROT(2 downto 0) => inst_interconnect_100MHz_M10_AXI_ARPROT(2 downto 0),
      S_AXI_ARREADY => inst_interconnect_100MHz_M10_AXI_ARREADY,
      S_AXI_ARVALID => inst_interconnect_100MHz_M10_AXI_ARVALID,
      S_AXI_AWADDR(4 downto 0) => inst_interconnect_100MHz_M10_AXI_AWADDR(4 downto 0),
      S_AXI_AWPROT(2 downto 0) => inst_interconnect_100MHz_M10_AXI_AWPROT(2 downto 0),
      S_AXI_AWREADY => inst_interconnect_100MHz_M10_AXI_AWREADY,
      S_AXI_AWVALID => inst_interconnect_100MHz_M10_AXI_AWVALID,
      S_AXI_BREADY => inst_interconnect_100MHz_M10_AXI_BREADY,
      S_AXI_BRESP(1 downto 0) => inst_interconnect_100MHz_M10_AXI_BRESP(1 downto 0),
      S_AXI_BVALID => inst_interconnect_100MHz_M10_AXI_BVALID,
      S_AXI_RDATA(31 downto 0) => inst_interconnect_100MHz_M10_AXI_RDATA(31 downto 0),
      S_AXI_RREADY => inst_interconnect_100MHz_M10_AXI_RREADY,
      S_AXI_RRESP(1 downto 0) => inst_interconnect_100MHz_M10_AXI_RRESP(1 downto 0),
      S_AXI_RVALID => inst_interconnect_100MHz_M10_AXI_RVALID,
      S_AXI_WDATA(31 downto 0) => inst_interconnect_100MHz_M10_AXI_WDATA(31 downto 0),
      S_AXI_WREADY => inst_interconnect_100MHz_M10_AXI_WREADY,
      S_AXI_WSTRB(3 downto 0) => inst_interconnect_100MHz_M10_AXI_WSTRB(3 downto 0),
      S_AXI_WVALID => inst_interconnect_100MHz_M10_AXI_WVALID,
      i_RX_Serial => i_RX_Serial_1,
      pps_signal => pps_signal_1
    );
axi_interconnect_DMA_INT: entity work.design_1_axi_interconnect_DMA_INT_0
     port map (
      ACLK => processing_system7_0_FCLK_CLK0,
      ARESETN(0) => rst_processing_system7_0_50M_interconnect_aresetn(0),
      M00_ACLK => processing_system7_0_FCLK_CLK0,
      M00_ARESETN(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      M00_AXI_araddr(31 downto 0) => axi_interconnect_0_M00_AXI_ARADDR(31 downto 0),
      M00_AXI_arburst(1 downto 0) => axi_interconnect_0_M00_AXI_ARBURST(1 downto 0),
      M00_AXI_arcache(3 downto 0) => axi_interconnect_0_M00_AXI_ARCACHE(3 downto 0),
      M00_AXI_arid(0) => axi_interconnect_0_M00_AXI_ARID(0),
      M00_AXI_arlen(3 downto 0) => axi_interconnect_0_M00_AXI_ARLEN(3 downto 0),
      M00_AXI_arlock(1 downto 0) => axi_interconnect_0_M00_AXI_ARLOCK(1 downto 0),
      M00_AXI_arprot(2 downto 0) => axi_interconnect_0_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arqos(3 downto 0) => axi_interconnect_0_M00_AXI_ARQOS(3 downto 0),
      M00_AXI_arready => axi_interconnect_0_M00_AXI_ARREADY,
      M00_AXI_arsize(2 downto 0) => axi_interconnect_0_M00_AXI_ARSIZE(2 downto 0),
      M00_AXI_arvalid => axi_interconnect_0_M00_AXI_ARVALID,
      M00_AXI_awaddr(31 downto 0) => axi_interconnect_0_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awburst(1 downto 0) => axi_interconnect_0_M00_AXI_AWBURST(1 downto 0),
      M00_AXI_awcache(3 downto 0) => axi_interconnect_0_M00_AXI_AWCACHE(3 downto 0),
      M00_AXI_awid(0) => axi_interconnect_0_M00_AXI_AWID(0),
      M00_AXI_awlen(3 downto 0) => axi_interconnect_0_M00_AXI_AWLEN(3 downto 0),
      M00_AXI_awlock(1 downto 0) => axi_interconnect_0_M00_AXI_AWLOCK(1 downto 0),
      M00_AXI_awprot(2 downto 0) => axi_interconnect_0_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awqos(3 downto 0) => axi_interconnect_0_M00_AXI_AWQOS(3 downto 0),
      M00_AXI_awready => axi_interconnect_0_M00_AXI_AWREADY,
      M00_AXI_awsize(2 downto 0) => axi_interconnect_0_M00_AXI_AWSIZE(2 downto 0),
      M00_AXI_awvalid => axi_interconnect_0_M00_AXI_AWVALID,
      M00_AXI_bid(5 downto 0) => axi_interconnect_0_M00_AXI_BID(5 downto 0),
      M00_AXI_bready => axi_interconnect_0_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => axi_interconnect_0_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => axi_interconnect_0_M00_AXI_BVALID,
      M00_AXI_rdata(63 downto 0) => axi_interconnect_0_M00_AXI_RDATA(63 downto 0),
      M00_AXI_rid(5 downto 0) => axi_interconnect_0_M00_AXI_RID(5 downto 0),
      M00_AXI_rlast => axi_interconnect_0_M00_AXI_RLAST,
      M00_AXI_rready => axi_interconnect_0_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => axi_interconnect_0_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => axi_interconnect_0_M00_AXI_RVALID,
      M00_AXI_wdata(63 downto 0) => axi_interconnect_0_M00_AXI_WDATA(63 downto 0),
      M00_AXI_wid(0) => axi_interconnect_0_M00_AXI_WID(0),
      M00_AXI_wlast => axi_interconnect_0_M00_AXI_WLAST,
      M00_AXI_wready => axi_interconnect_0_M00_AXI_WREADY,
      M00_AXI_wstrb(7 downto 0) => axi_interconnect_0_M00_AXI_WSTRB(7 downto 0),
      M00_AXI_wvalid => axi_interconnect_0_M00_AXI_WVALID,
      S00_ACLK => processing_system7_0_FCLK_CLK0,
      S00_ARESETN(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      S00_AXI_awaddr(31 downto 0) => axi_dma_L2_M_AXI_S2MM_AWADDR(31 downto 0),
      S00_AXI_awburst(1 downto 0) => axi_dma_L2_M_AXI_S2MM_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => axi_dma_L2_M_AXI_S2MM_AWCACHE(3 downto 0),
      S00_AXI_awlen(7 downto 0) => axi_dma_L2_M_AXI_S2MM_AWLEN(7 downto 0),
      S00_AXI_awprot(2 downto 0) => axi_dma_L2_M_AXI_S2MM_AWPROT(2 downto 0),
      S00_AXI_awready => axi_dma_L2_M_AXI_S2MM_AWREADY,
      S00_AXI_awsize(2 downto 0) => axi_dma_L2_M_AXI_S2MM_AWSIZE(2 downto 0),
      S00_AXI_awvalid => axi_dma_L2_M_AXI_S2MM_AWVALID,
      S00_AXI_bready => axi_dma_L2_M_AXI_S2MM_BREADY,
      S00_AXI_bresp(1 downto 0) => axi_dma_L2_M_AXI_S2MM_BRESP(1 downto 0),
      S00_AXI_bvalid => axi_dma_L2_M_AXI_S2MM_BVALID,
      S00_AXI_wdata(63 downto 0) => axi_dma_L2_M_AXI_S2MM_WDATA(63 downto 0),
      S00_AXI_wlast => axi_dma_L2_M_AXI_S2MM_WLAST,
      S00_AXI_wready => axi_dma_L2_M_AXI_S2MM_WREADY,
      S00_AXI_wstrb(7 downto 0) => axi_dma_L2_M_AXI_S2MM_WSTRB(7 downto 0),
      S00_AXI_wvalid => axi_dma_L2_M_AXI_S2MM_WVALID,
      S01_ACLK => processing_system7_0_FCLK_CLK0,
      S01_ARESETN(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      S01_AXI_awaddr(31 downto 0) => S01_AXI_1_AWADDR(31 downto 0),
      S01_AXI_awburst(1 downto 0) => S01_AXI_1_AWBURST(1 downto 0),
      S01_AXI_awcache(3 downto 0) => S01_AXI_1_AWCACHE(3 downto 0),
      S01_AXI_awlen(7 downto 0) => S01_AXI_1_AWLEN(7 downto 0),
      S01_AXI_awprot(2 downto 0) => S01_AXI_1_AWPROT(2 downto 0),
      S01_AXI_awready => S01_AXI_1_AWREADY,
      S01_AXI_awsize(2 downto 0) => S01_AXI_1_AWSIZE(2 downto 0),
      S01_AXI_awvalid => S01_AXI_1_AWVALID,
      S01_AXI_bready => S01_AXI_1_BREADY,
      S01_AXI_bresp(1 downto 0) => S01_AXI_1_BRESP(1 downto 0),
      S01_AXI_bvalid => S01_AXI_1_BVALID,
      S01_AXI_wdata(31 downto 0) => S01_AXI_1_WDATA(31 downto 0),
      S01_AXI_wlast => S01_AXI_1_WLAST,
      S01_AXI_wready => S01_AXI_1_WREADY,
      S01_AXI_wstrb(3 downto 0) => S01_AXI_1_WSTRB(3 downto 0),
      S01_AXI_wvalid => S01_AXI_1_WVALID
    );
axi_interconnect_DMA_RAW: entity work.design_1_axi_interconnect_DMA_RAW_0
     port map (
      ACLK => processing_system7_0_FCLK_CLK1,
      ARESETN(0) => ARESETN_1(0),
      M00_ACLK => processing_system7_0_FCLK_CLK1,
      M00_ARESETN(0) => rst_processing_system7_0_200M_peripheral_aresetn(0),
      M00_AXI_awaddr(31 downto 0) => axi_interconnect_1_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awburst(1 downto 0) => axi_interconnect_1_M00_AXI_AWBURST(1 downto 0),
      M00_AXI_awcache(3 downto 0) => axi_interconnect_1_M00_AXI_AWCACHE(3 downto 0),
      M00_AXI_awlen(3 downto 0) => axi_interconnect_1_M00_AXI_AWLEN(3 downto 0),
      M00_AXI_awlock(1 downto 0) => axi_interconnect_1_M00_AXI_AWLOCK(1 downto 0),
      M00_AXI_awprot(2 downto 0) => axi_interconnect_1_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awqos(3 downto 0) => axi_interconnect_1_M00_AXI_AWQOS(3 downto 0),
      M00_AXI_awready => axi_interconnect_1_M00_AXI_AWREADY,
      M00_AXI_awsize(2 downto 0) => axi_interconnect_1_M00_AXI_AWSIZE(2 downto 0),
      M00_AXI_awvalid => axi_interconnect_1_M00_AXI_AWVALID,
      M00_AXI_bready => axi_interconnect_1_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => axi_interconnect_1_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => axi_interconnect_1_M00_AXI_BVALID,
      M00_AXI_wdata(63 downto 0) => axi_interconnect_1_M00_AXI_WDATA(63 downto 0),
      M00_AXI_wlast => axi_interconnect_1_M00_AXI_WLAST,
      M00_AXI_wready => axi_interconnect_1_M00_AXI_WREADY,
      M00_AXI_wstrb(7 downto 0) => axi_interconnect_1_M00_AXI_WSTRB(7 downto 0),
      M00_AXI_wvalid => axi_interconnect_1_M00_AXI_WVALID,
      S00_ACLK => processing_system7_0_FCLK_CLK1,
      S00_ARESETN(0) => rst_processing_system7_0_200M_peripheral_aresetn(0),
      S00_AXI_awaddr(31 downto 0) => axi_dma_raw_M_AXI_S2MM_AWADDR(31 downto 0),
      S00_AXI_awburst(1 downto 0) => axi_dma_raw_M_AXI_S2MM_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => axi_dma_raw_M_AXI_S2MM_AWCACHE(3 downto 0),
      S00_AXI_awlen(7 downto 0) => axi_dma_raw_M_AXI_S2MM_AWLEN(7 downto 0),
      S00_AXI_awprot(2 downto 0) => axi_dma_raw_M_AXI_S2MM_AWPROT(2 downto 0),
      S00_AXI_awready => axi_dma_raw_M_AXI_S2MM_AWREADY,
      S00_AXI_awsize(2 downto 0) => axi_dma_raw_M_AXI_S2MM_AWSIZE(2 downto 0),
      S00_AXI_awvalid => axi_dma_raw_M_AXI_S2MM_AWVALID,
      S00_AXI_bready => axi_dma_raw_M_AXI_S2MM_BREADY,
      S00_AXI_bresp(1 downto 0) => axi_dma_raw_M_AXI_S2MM_BRESP(1 downto 0),
      S00_AXI_bvalid => axi_dma_raw_M_AXI_S2MM_BVALID,
      S00_AXI_wdata(63 downto 0) => axi_dma_raw_M_AXI_S2MM_WDATA(63 downto 0),
      S00_AXI_wlast => axi_dma_raw_M_AXI_S2MM_WLAST,
      S00_AXI_wready => axi_dma_raw_M_AXI_S2MM_WREADY,
      S00_AXI_wstrb(7 downto 0) => axi_dma_raw_M_AXI_S2MM_WSTRB(7 downto 0),
      S00_AXI_wvalid => axi_dma_raw_M_AXI_S2MM_WVALID
    );
axi_quad_spi_0: component design_1_axi_quad_spi_0_0
     port map (
      ext_spi_clk => processing_system7_0_FCLK_CLK0,
      io0_i => '0',
      io0_o => axi_quad_spi_0_io0_o,
      io0_t => NLW_axi_quad_spi_0_io0_t_UNCONNECTED,
      io1_i => '0',
      io1_o => NLW_axi_quad_spi_0_io1_o_UNCONNECTED,
      io1_t => NLW_axi_quad_spi_0_io1_t_UNCONNECTED,
      ip2intc_irpt => NLW_axi_quad_spi_0_ip2intc_irpt_UNCONNECTED,
      s_axi_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_araddr(6 downto 0) => processing_system7_0_axi_periph_M02_AXI_ARADDR(6 downto 0),
      s_axi_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axi_arready => processing_system7_0_axi_periph_M02_AXI_ARREADY,
      s_axi_arvalid => processing_system7_0_axi_periph_M02_AXI_ARVALID(0),
      s_axi_awaddr(6 downto 0) => processing_system7_0_axi_periph_M02_AXI_AWADDR(6 downto 0),
      s_axi_awready => processing_system7_0_axi_periph_M02_AXI_AWREADY,
      s_axi_awvalid => processing_system7_0_axi_periph_M02_AXI_AWVALID(0),
      s_axi_bready => processing_system7_0_axi_periph_M02_AXI_BREADY(0),
      s_axi_bresp(1 downto 0) => processing_system7_0_axi_periph_M02_AXI_BRESP(1 downto 0),
      s_axi_bvalid => processing_system7_0_axi_periph_M02_AXI_BVALID,
      s_axi_rdata(31 downto 0) => processing_system7_0_axi_periph_M02_AXI_RDATA(31 downto 0),
      s_axi_rready => processing_system7_0_axi_periph_M02_AXI_RREADY(0),
      s_axi_rresp(1 downto 0) => processing_system7_0_axi_periph_M02_AXI_RRESP(1 downto 0),
      s_axi_rvalid => processing_system7_0_axi_periph_M02_AXI_RVALID,
      s_axi_wdata(31 downto 0) => processing_system7_0_axi_periph_M02_AXI_WDATA(31 downto 0),
      s_axi_wready => processing_system7_0_axi_periph_M02_AXI_WREADY,
      s_axi_wstrb(3 downto 0) => processing_system7_0_axi_periph_M02_AXI_WSTRB(3 downto 0),
      s_axi_wvalid => processing_system7_0_axi_periph_M02_AXI_WVALID(0),
      sck_i => '0',
      sck_o => axi_quad_spi_0_sck_o,
      sck_t => NLW_axi_quad_spi_0_sck_t_UNCONNECTED,
      ss_i(0) => '0',
      ss_o(0) => NLW_axi_quad_spi_0_ss_o_UNCONNECTED(0),
      ss_t => NLW_axi_quad_spi_0_ss_t_UNCONNECTED
    );
axis_broadcaster_00: component design_1_axis_broadcaster_00_0
     port map (
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      m_axis_tdata(31 downto 16) => axis_broadcaster_00_M01_AXIS_TDATA(31 downto 16),
      m_axis_tdata(15 downto 0) => axis_broadcaster_1r1_M00_AXIS_TDATA(15 downto 0),
      m_axis_tlast(1) => axis_broadcaster_00_M01_AXIS_TLAST(1),
      m_axis_tlast(0) => axis_broadcaster_1r1_M00_AXIS_TLAST(0),
      m_axis_tready(1) => axis_broadcaster_00_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_1r1_M00_AXIS_TREADY,
      m_axis_tvalid(1) => axis_broadcaster_00_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_1r1_M00_AXIS_TVALID(0),
      s_axis_tdata(15 downto 0) => axis_data_fifo_0_M_AXIS_TDATA(15 downto 0),
      s_axis_tlast => axis_data_fifo_0_M_AXIS_TLAST,
      s_axis_tready => axis_data_fifo_0_M_AXIS_TREADY,
      s_axis_tvalid => axis_data_fifo_0_M_AXIS_TVALID
    );
axis_broadcaster_01: component design_1_axis_broadcaster_01_0
     port map (
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      m_axis_tdata(31 downto 16) => axis_broadcaster_01_M01_AXIS_TDATA(31 downto 16),
      m_axis_tdata(15 downto 0) => axis_broadcaster_1r6_M00_AXIS_TDATA(15 downto 0),
      m_axis_tlast(1) => axis_broadcaster_01_M01_AXIS_TLAST(1),
      m_axis_tlast(0) => axis_broadcaster_1r6_M00_AXIS_TLAST(0),
      m_axis_tready(1) => axis_broadcaster_01_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_1r6_M00_AXIS_TREADY,
      m_axis_tvalid(1) => axis_broadcaster_01_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_1r6_M00_AXIS_TVALID(0),
      s_axis_tdata(15 downto 0) => axis_data_fifo_1_M_AXIS_TDATA(15 downto 0),
      s_axis_tlast => axis_data_fifo_1_M_AXIS_TLAST,
      s_axis_tready => axis_data_fifo_1_M_AXIS_TREADY,
      s_axis_tvalid => axis_data_fifo_1_M_AXIS_TVALID
    );
axis_broadcaster_02: component design_1_axis_broadcaster_02_0
     port map (
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      m_axis_tdata(31 downto 16) => axis_broadcaster_02_M01_AXIS_TDATA(31 downto 16),
      m_axis_tdata(15 downto 0) => axis_broadcaster_1r2_M00_AXIS_TDATA(15 downto 0),
      m_axis_tlast(1) => axis_broadcaster_02_M01_AXIS_TLAST(1),
      m_axis_tlast(0) => axis_broadcaster_1r2_M00_AXIS_TLAST(0),
      m_axis_tready(1) => axis_broadcaster_02_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_1r2_M00_AXIS_TREADY,
      m_axis_tvalid(1) => axis_broadcaster_02_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_1r2_M00_AXIS_TVALID(0),
      s_axis_tdata(15 downto 0) => axis_data_fifo_2_M_AXIS_TDATA(15 downto 0),
      s_axis_tlast => axis_data_fifo_2_M_AXIS_TLAST,
      s_axis_tready => axis_data_fifo_2_M_AXIS_TREADY,
      s_axis_tvalid => axis_data_fifo_2_M_AXIS_TVALID
    );
axis_broadcaster_03: component design_1_axis_broadcaster_03_0
     port map (
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      m_axis_tdata(31 downto 16) => axis_broadcaster_03_M01_AXIS_TDATA(31 downto 16),
      m_axis_tdata(15 downto 0) => axis_broadcaster_1r5_M00_AXIS_TDATA(15 downto 0),
      m_axis_tlast(1) => axis_broadcaster_03_M01_AXIS_TLAST(1),
      m_axis_tlast(0) => axis_broadcaster_1r5_M00_AXIS_TLAST(0),
      m_axis_tready(1) => axis_broadcaster_03_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_1r5_M00_AXIS_TREADY,
      m_axis_tvalid(1) => axis_broadcaster_03_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_1r5_M00_AXIS_TVALID(0),
      s_axis_tdata(15 downto 0) => axis_data_fifo_3_M_AXIS_TDATA(15 downto 0),
      s_axis_tlast => axis_data_fifo_3_M_AXIS_TLAST,
      s_axis_tready => axis_data_fifo_3_M_AXIS_TREADY,
      s_axis_tvalid => axis_data_fifo_3_M_AXIS_TVALID
    );
axis_broadcaster_04: component design_1_axis_broadcaster_04_0
     port map (
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      m_axis_tdata(31 downto 16) => axis_broadcaster_04_M01_AXIS_TDATA(31 downto 16),
      m_axis_tdata(15 downto 0) => axis_broadcaster_1r4_M00_AXIS_TDATA(15 downto 0),
      m_axis_tlast(1) => axis_broadcaster_04_M01_AXIS_TLAST(1),
      m_axis_tlast(0) => axis_broadcaster_1r4_M00_AXIS_TLAST(0),
      m_axis_tready(1) => axis_broadcaster_04_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_1r4_M00_AXIS_TREADY,
      m_axis_tvalid(1) => axis_broadcaster_04_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_1r4_M00_AXIS_TVALID(0),
      s_axis_tdata(15 downto 0) => axis_data_fifo_4_M_AXIS_TDATA(15 downto 0),
      s_axis_tlast => axis_data_fifo_4_M_AXIS_TLAST,
      s_axis_tready => axis_data_fifo_4_M_AXIS_TREADY,
      s_axis_tvalid => axis_data_fifo_4_M_AXIS_TVALID
    );
axis_broadcaster_05: component design_1_axis_broadcaster_05_0
     port map (
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      m_axis_tdata(31 downto 16) => axis_broadcaster_05_M01_AXIS_TDATA(31 downto 16),
      m_axis_tdata(15 downto 0) => axis_broadcaster_1r3_M00_AXIS_TDATA(15 downto 0),
      m_axis_tlast(1) => axis_broadcaster_05_M01_AXIS_TLAST(1),
      m_axis_tlast(0) => axis_broadcaster_1r3_M00_AXIS_TLAST(0),
      m_axis_tready(1) => axis_broadcaster_05_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_1r3_M00_AXIS_TREADY,
      m_axis_tvalid(1) => axis_broadcaster_05_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_1r3_M00_AXIS_TVALID(0),
      s_axis_tdata(15 downto 0) => axis_data_fifo_5_M_AXIS_TDATA(15 downto 0),
      s_axis_tlast => axis_data_fifo_5_M_AXIS_TLAST,
      s_axis_tready => axis_data_fifo_5_M_AXIS_TREADY,
      s_axis_tvalid => axis_data_fifo_5_M_AXIS_TVALID
    );
axis_broadcaster_1r: component design_1_axis_broadcaster_1r_0
     port map (
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      m_axis_tdata(63 downto 32) => axis_broadcaster_1r_M01_AXIS_TDATA(63 downto 32),
      m_axis_tdata(31 downto 0) => axis_broadcaster_1r_M00_AXIS_TDATA(31 downto 0),
      m_axis_tdest(11 downto 6) => axis_broadcaster_1r_M01_AXIS_TDEST(11 downto 6),
      m_axis_tdest(5 downto 0) => NLW_axis_broadcaster_1r_m_axis_tdest_UNCONNECTED(5 downto 0),
      m_axis_tid(9 downto 5) => axis_broadcaster_1r_M01_AXIS_TID(9 downto 5),
      m_axis_tid(4 downto 0) => NLW_axis_broadcaster_1r_m_axis_tid_UNCONNECTED(4 downto 0),
      m_axis_tlast(1) => axis_broadcaster_1r_M01_AXIS_TLAST(1),
      m_axis_tlast(0) => axis_broadcaster_1r_M00_AXIS_TLAST(0),
      m_axis_tready(1) => axis_broadcaster_1r_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_1r_M00_AXIS_TREADY,
      m_axis_tuser(3 downto 2) => axis_broadcaster_1r_M01_AXIS_TUSER(3 downto 2),
      m_axis_tuser(1 downto 0) => NLW_axis_broadcaster_1r_m_axis_tuser_UNCONNECTED(1 downto 0),
      m_axis_tvalid(1) => axis_broadcaster_1r_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_1r_M00_AXIS_TVALID(0),
      s_axis_tdata(31 downto 0) => scurve_adder_0_out_stream_TDATA(31 downto 0),
      s_axis_tdest(5 downto 0) => scurve_adder_0_out_stream_TDEST(5 downto 0),
      s_axis_tid(4 downto 0) => scurve_adder_0_out_stream_TID(4 downto 0),
      s_axis_tlast => scurve_adder_0_out_stream_TLAST(0),
      s_axis_tready => scurve_adder_0_out_stream_TREADY,
      s_axis_tuser(1 downto 0) => scurve_adder_0_out_stream_TUSER(1 downto 0),
      s_axis_tvalid => scurve_adder_0_out_stream_TVALID
    );
axis_broadcaster_1r10: component design_1_axis_broadcaster_1r10_0
     port map (
      aclk => processing_system7_0_FCLK_CLK1,
      aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(15 downto 8) => axis_broadcaster_1r10_M01_AXIS_TDATA(15 downto 8),
      m_axis_tdata(7 downto 0) => axis_broadcaster_1r10_M00_AXIS_TDATA(7 downto 0),
      m_axis_tlast(1) => axis_broadcaster_1r10_M01_AXIS_TLAST(1),
      m_axis_tlast(0) => NLW_axis_broadcaster_1r10_m_axis_tlast_UNCONNECTED(0),
      m_axis_tready(1) => axis_broadcaster_1r10_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_1r10_M00_AXIS_TREADY,
      m_axis_tvalid(1) => axis_broadcaster_1r10_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_1r10_M00_AXIS_TVALID(0),
      s_axis_tdata(7 downto 0) => axis_dwidth_converter_0_M_AXIS_TDATA(7 downto 0),
      s_axis_tlast => axis_dwidth_converter_0_M_AXIS_TLAST,
      s_axis_tready => axis_dwidth_converter_0_M_AXIS_TREADY,
      s_axis_tvalid => axis_dwidth_converter_0_M_AXIS_TVALID
    );
axis_broadcaster_1r11: component design_1_axis_broadcaster_1r11_0
     port map (
      aclk => processing_system7_0_FCLK_CLK1,
      aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(15 downto 8) => axis_broadcaster_1r11_M01_AXIS_TDATA(15 downto 8),
      m_axis_tdata(7 downto 0) => axis_broadcaster_1r11_M00_AXIS_TDATA(7 downto 0),
      m_axis_tlast(1) => axis_broadcaster_1r11_M01_AXIS_TLAST(1),
      m_axis_tlast(0) => NLW_axis_broadcaster_1r11_m_axis_tlast_UNCONNECTED(0),
      m_axis_tready(1) => axis_broadcaster_1r11_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_1r11_M00_AXIS_TREADY,
      m_axis_tvalid(1) => axis_broadcaster_1r11_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_1r11_M00_AXIS_TVALID(0),
      s_axis_tdata(7 downto 0) => axis_dwidth_converter_3_M_AXIS_TDATA(7 downto 0),
      s_axis_tlast => axis_dwidth_converter_3_M_AXIS_TLAST,
      s_axis_tready => axis_dwidth_converter_3_M_AXIS_TREADY,
      s_axis_tvalid => axis_dwidth_converter_3_M_AXIS_TVALID
    );
axis_broadcaster_1r12: component design_1_axis_broadcaster_1r12_0
     port map (
      aclk => processing_system7_0_FCLK_CLK1,
      aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(15 downto 8) => axis_broadcaster_1r12_M01_AXIS_TDATA(15 downto 8),
      m_axis_tdata(7 downto 0) => axis_broadcaster_1r12_M00_AXIS_TDATA(7 downto 0),
      m_axis_tlast(1) => axis_broadcaster_1r12_M01_AXIS_TLAST(1),
      m_axis_tlast(0) => NLW_axis_broadcaster_1r12_m_axis_tlast_UNCONNECTED(0),
      m_axis_tready(1) => axis_broadcaster_1r12_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_1r12_M00_AXIS_TREADY,
      m_axis_tvalid(1) => axis_broadcaster_1r12_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_1r12_M00_AXIS_TVALID(0),
      s_axis_tdata(7 downto 0) => axis_dwidth_converter_2_M_AXIS_TDATA(7 downto 0),
      s_axis_tlast => axis_dwidth_converter_2_M_AXIS_TLAST,
      s_axis_tready => axis_dwidth_converter_2_M_AXIS_TREADY,
      s_axis_tvalid => axis_dwidth_converter_2_M_AXIS_TVALID
    );
axis_broadcaster_1r13: component design_1_axis_broadcaster_1r13_0
     port map (
      aclk => processing_system7_0_FCLK_CLK1,
      aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(15 downto 8) => axis_broadcaster_1r13_M01_AXIS_TDATA(15 downto 8),
      m_axis_tdata(7 downto 0) => axis_broadcaster_1r13_M00_AXIS_TDATA(7 downto 0),
      m_axis_tlast(1) => axis_broadcaster_1r13_M01_AXIS_TLAST(1),
      m_axis_tlast(0) => NLW_axis_broadcaster_1r13_m_axis_tlast_UNCONNECTED(0),
      m_axis_tready(1) => axis_broadcaster_1r13_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_1r13_M00_AXIS_TREADY,
      m_axis_tvalid(1) => axis_broadcaster_1r13_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_1r13_M00_AXIS_TVALID(0),
      s_axis_tdata(7 downto 0) => axis_dwidth_converter_6_M_AXIS_TDATA(7 downto 0),
      s_axis_tlast => axis_dwidth_converter_6_M_AXIS_TLAST,
      s_axis_tready => axis_dwidth_converter_6_M_AXIS_TREADY,
      s_axis_tvalid => axis_dwidth_converter_6_M_AXIS_TVALID
    );
axis_broadcaster_1r14: component design_1_axis_broadcaster_1r14_0
     port map (
      aclk => processing_system7_0_FCLK_CLK1,
      aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(15 downto 8) => axis_broadcaster_1r14_M01_AXIS_TDATA(15 downto 8),
      m_axis_tdata(7 downto 0) => axis_broadcaster_1r14_M00_AXIS_TDATA(7 downto 0),
      m_axis_tlast(1) => axis_broadcaster_1r14_M01_AXIS_TLAST(1),
      m_axis_tlast(0) => NLW_axis_broadcaster_1r14_m_axis_tlast_UNCONNECTED(0),
      m_axis_tready(1) => axis_broadcaster_1r14_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_1r14_M00_AXIS_TREADY,
      m_axis_tvalid(1) => axis_broadcaster_1r14_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_1r14_M00_AXIS_TVALID(0),
      s_axis_tdata(7 downto 0) => axis_dwidth_converter_4_M_AXIS_TDATA(7 downto 0),
      s_axis_tlast => axis_dwidth_converter_4_M_AXIS_TLAST,
      s_axis_tready => axis_dwidth_converter_4_M_AXIS_TREADY,
      s_axis_tvalid => axis_dwidth_converter_4_M_AXIS_TVALID
    );
axis_broadcaster_1r15: component design_1_axis_broadcaster_1r15_0
     port map (
      aclk => processing_system7_0_FCLK_CLK1,
      aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(15 downto 8) => axis_broadcaster_1r15_M01_AXIS_TDATA(15 downto 8),
      m_axis_tdata(7 downto 0) => axis_broadcaster_1r15_M00_AXIS_TDATA(7 downto 0),
      m_axis_tlast(1) => axis_broadcaster_1r15_M01_AXIS_TLAST(1),
      m_axis_tlast(0) => NLW_axis_broadcaster_1r15_m_axis_tlast_UNCONNECTED(0),
      m_axis_tready(1) => axis_broadcaster_1r15_M01_AXIS_TREADY,
      m_axis_tready(0) => axis_broadcaster_1r15_M00_AXIS_TREADY,
      m_axis_tvalid(1) => axis_broadcaster_1r15_M01_AXIS_TVALID(1),
      m_axis_tvalid(0) => axis_broadcaster_1r15_M00_AXIS_TVALID(0),
      s_axis_tdata(7 downto 0) => axis_dwidth_converter_5_M_AXIS1_TDATA(7 downto 0),
      s_axis_tlast => axis_dwidth_converter_5_M_AXIS1_TLAST,
      s_axis_tready => axis_dwidth_converter_5_M_AXIS1_TREADY,
      s_axis_tvalid => axis_dwidth_converter_5_M_AXIS1_TVALID
    );
axis_clock_converter_0: component design_1_axis_clock_converter_0_0
     port map (
      m_axis_aclk => processing_system7_0_FCLK_CLK1,
      m_axis_aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(15 downto 0) => axis_clock_converter_0_M_AXIS_TDATA(15 downto 0),
      m_axis_tlast => axis_clock_converter_0_M_AXIS_TLAST,
      m_axis_tready => axis_clock_converter_0_M_AXIS_TREADY,
      m_axis_tvalid => axis_clock_converter_0_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(15 downto 0) => axis_broadcaster_00_M01_AXIS_TDATA(31 downto 16),
      s_axis_tlast => axis_broadcaster_00_M01_AXIS_TLAST(1),
      s_axis_tready => axis_broadcaster_00_M01_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_00_M01_AXIS_TVALID(1)
    );
axis_clock_converter_1: component design_1_axis_clock_converter_1_0
     port map (
      m_axis_aclk => processing_system7_0_FCLK_CLK1,
      m_axis_aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(15 downto 0) => axis_clock_converter_1_M_AXIS_TDATA(15 downto 0),
      m_axis_tlast => axis_clock_converter_1_M_AXIS_TLAST,
      m_axis_tready => axis_clock_converter_1_M_AXIS_TREADY,
      m_axis_tvalid => axis_clock_converter_1_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(15 downto 0) => axis_broadcaster_01_M01_AXIS_TDATA(31 downto 16),
      s_axis_tlast => axis_broadcaster_01_M01_AXIS_TLAST(1),
      s_axis_tready => axis_broadcaster_01_M01_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_01_M01_AXIS_TVALID(1)
    );
axis_clock_converter_2: component design_1_axis_clock_converter_2_0
     port map (
      m_axis_aclk => processing_system7_0_FCLK_CLK1,
      m_axis_aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(15 downto 0) => axis_clock_converter_2_M_AXIS_TDATA(15 downto 0),
      m_axis_tlast => axis_clock_converter_2_M_AXIS_TLAST,
      m_axis_tready => axis_clock_converter_2_M_AXIS_TREADY,
      m_axis_tvalid => axis_clock_converter_2_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(15 downto 0) => axis_broadcaster_04_M01_AXIS_TDATA(31 downto 16),
      s_axis_tlast => axis_broadcaster_04_M01_AXIS_TLAST(1),
      s_axis_tready => axis_broadcaster_04_M01_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_04_M01_AXIS_TVALID(1)
    );
axis_clock_converter_3: component design_1_axis_clock_converter_3_0
     port map (
      m_axis_aclk => processing_system7_0_FCLK_CLK1,
      m_axis_aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(15 downto 0) => axis_clock_converter_3_M_AXIS_TDATA(15 downto 0),
      m_axis_tlast => axis_clock_converter_3_M_AXIS_TLAST,
      m_axis_tready => axis_clock_converter_3_M_AXIS_TREADY,
      m_axis_tvalid => axis_clock_converter_3_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(15 downto 0) => axis_broadcaster_05_M01_AXIS_TDATA(31 downto 16),
      s_axis_tlast => axis_broadcaster_05_M01_AXIS_TLAST(1),
      s_axis_tready => axis_broadcaster_05_M01_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_05_M01_AXIS_TVALID(1)
    );
axis_clock_converter_4: component design_1_axis_clock_converter_4_0
     port map (
      m_axis_aclk => processing_system7_0_FCLK_CLK1,
      m_axis_aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(15 downto 0) => axis_clock_converter_4_M_AXIS_TDATA(15 downto 0),
      m_axis_tlast => axis_clock_converter_4_M_AXIS_TLAST,
      m_axis_tready => axis_clock_converter_4_M_AXIS_TREADY,
      m_axis_tvalid => axis_clock_converter_4_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(15 downto 0) => axis_broadcaster_03_M01_AXIS_TDATA(31 downto 16),
      s_axis_tlast => axis_broadcaster_03_M01_AXIS_TLAST(1),
      s_axis_tready => axis_broadcaster_03_M01_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_03_M01_AXIS_TVALID(1)
    );
axis_clock_converter_5: component design_1_axis_clock_converter_5_0
     port map (
      m_axis_aclk => processing_system7_0_FCLK_CLK1,
      m_axis_aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(15 downto 0) => axis_clock_converter_5_M_AXIS_TDATA(15 downto 0),
      m_axis_tlast => axis_clock_converter_5_M_AXIS_TLAST,
      m_axis_tready => axis_clock_converter_5_M_AXIS_TREADY,
      m_axis_tvalid => axis_clock_converter_5_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(15 downto 0) => axis_broadcaster_02_M01_AXIS_TDATA(31 downto 16),
      s_axis_tlast => axis_broadcaster_02_M01_AXIS_TLAST(1),
      s_axis_tready => axis_broadcaster_02_M01_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_02_M01_AXIS_TVALID(1)
    );
axis_data_1st_fifo_0: component design_1_axis_data_fifo_0_0
     port map (
      axis_data_count(31 downto 0) => NLW_axis_data_1st_fifo_0_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_1st_fifo_0_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_1st_fifo_0_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(15 downto 0) => axis_data_fifo_0_M_AXIS_TDATA(15 downto 0),
      m_axis_tlast => axis_data_fifo_0_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_0_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_0_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(15 downto 0) => axi_data_provider_0_m_axis_art0l_TDATA(15 downto 0),
      s_axis_tlast => axi_data_provider_0_m_axis_art0l_TLAST,
      s_axis_tready => axi_data_provider_0_m_axis_art0l_TREADY,
      s_axis_tvalid => axi_data_provider_0_m_axis_art0l_TVALID
    );
axis_data_1st_fifo_1: component design_1_axis_data_fifo_0_6
     port map (
      axis_data_count(31 downto 0) => NLW_axis_data_1st_fifo_1_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_1st_fifo_1_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_1st_fifo_1_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(15 downto 0) => axis_data_fifo_1_M_AXIS_TDATA(15 downto 0),
      m_axis_tlast => axis_data_fifo_1_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_1_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_1_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(15 downto 0) => axi_data_provider_0_m_axis_art0r_TDATA(15 downto 0),
      s_axis_tlast => axi_data_provider_0_m_axis_art0r_TLAST,
      s_axis_tready => axi_data_provider_0_m_axis_art0r_TREADY,
      s_axis_tvalid => axi_data_provider_0_m_axis_art0r_TVALID
    );
axis_data_1st_fifo_2: component design_1_axis_data_fifo_0_7
     port map (
      axis_data_count(31 downto 0) => NLW_axis_data_1st_fifo_2_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_1st_fifo_2_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_1st_fifo_2_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(15 downto 0) => axis_data_fifo_2_M_AXIS_TDATA(15 downto 0),
      m_axis_tlast => axis_data_fifo_2_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_2_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_2_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(15 downto 0) => axi_data_provider_0_m_axis_art1l_TDATA(15 downto 0),
      s_axis_tlast => axi_data_provider_0_m_axis_art1l_TLAST,
      s_axis_tready => axi_data_provider_0_m_axis_art1l_TREADY,
      s_axis_tvalid => axi_data_provider_0_m_axis_art1l_TVALID
    );
axis_data_1st_fifo_3: component design_1_axis_data_fifo_2_0
     port map (
      axis_data_count(31 downto 0) => NLW_axis_data_1st_fifo_3_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_1st_fifo_3_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_1st_fifo_3_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(15 downto 0) => axis_data_fifo_3_M_AXIS_TDATA(15 downto 0),
      m_axis_tlast => axis_data_fifo_3_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_3_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_3_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(15 downto 0) => axi_data_provider_0_m_axis_art1r_TDATA(15 downto 0),
      s_axis_tlast => axi_data_provider_0_m_axis_art1r_TLAST,
      s_axis_tready => axi_data_provider_0_m_axis_art1r_TREADY,
      s_axis_tvalid => axi_data_provider_0_m_axis_art1r_TVALID
    );
axis_data_1st_fifo_4: component design_1_axis_data_fifo_3_0
     port map (
      axis_data_count(31 downto 0) => NLW_axis_data_1st_fifo_4_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_1st_fifo_4_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_1st_fifo_4_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(15 downto 0) => axis_data_fifo_4_M_AXIS_TDATA(15 downto 0),
      m_axis_tlast => axis_data_fifo_4_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_4_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_4_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(15 downto 0) => axi_data_provider_0_m_axis_art2l_TDATA(15 downto 0),
      s_axis_tlast => axi_data_provider_0_m_axis_art2l_TLAST,
      s_axis_tready => axi_data_provider_0_m_axis_art2l_TREADY,
      s_axis_tvalid => axi_data_provider_0_m_axis_art2l_TVALID
    );
axis_data_1st_fifo_5: component design_1_axis_data_fifo_4_0
     port map (
      axis_data_count(31 downto 0) => NLW_axis_data_1st_fifo_5_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_1st_fifo_5_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_1st_fifo_5_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(15 downto 0) => axis_data_fifo_5_M_AXIS_TDATA(15 downto 0),
      m_axis_tlast => axis_data_fifo_5_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_5_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_5_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(15 downto 0) => axi_data_provider_0_m_axis_art2r_TDATA(15 downto 0),
      s_axis_tlast => axi_data_provider_0_m_axis_art2r_TLAST,
      s_axis_tready => axi_data_provider_0_m_axis_art2r_TREADY,
      s_axis_tvalid => axi_data_provider_0_m_axis_art2r_TVALID
    );
axis_data_fifo_L2: component design_1_axis_data_fifo_L2_0
     port map (
      axis_data_count(31 downto 0) => NLW_axis_data_fifo_L2_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_fifo_L2_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_fifo_L2_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(31 downto 0) => axis_data_fifo_L2_M_AXIS_TDATA(31 downto 0),
      m_axis_tdest(5 downto 0) => axis_data_fifo_L2_M_AXIS_TDEST(5 downto 0),
      m_axis_tid(4 downto 0) => axis_data_fifo_L2_M_AXIS_TID(4 downto 0),
      m_axis_tlast => axis_data_fifo_L2_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_L2_M_AXIS_TREADY,
      m_axis_tuser(1 downto 0) => axis_data_fifo_L2_M_AXIS_TUSER(1 downto 0),
      m_axis_tvalid => axis_data_fifo_L2_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(31 downto 0) => axis_broadcaster_1r_M01_AXIS_TDATA(63 downto 32),
      s_axis_tdest(5 downto 0) => axis_broadcaster_1r_M01_AXIS_TDEST(11 downto 6),
      s_axis_tid(4 downto 0) => axis_broadcaster_1r_M01_AXIS_TID(9 downto 5),
      s_axis_tlast => axis_broadcaster_1r_M01_AXIS_TLAST(1),
      s_axis_tready => axis_broadcaster_1r_M01_AXIS_TREADY,
      s_axis_tuser(1 downto 0) => axis_broadcaster_1r_M01_AXIS_TUSER(3 downto 2),
      s_axis_tvalid => axis_broadcaster_1r_M01_AXIS_TVALID(1)
    );
axis_data_fifo_fc_L2b: component design_1_axis_data_fifo_fc_L2b_0
     port map (
      axis_data_count(31 downto 0) => NLW_axis_data_fifo_fc_L2b_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_fifo_fc_L2b_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_fifo_fc_L2b_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(63 downto 0) => dma_L2_S_AXIS_TDATA(63 downto 0),
      m_axis_tdest(5 downto 0) => NLW_axis_data_fifo_fc_L2b_m_axis_tdest_UNCONNECTED(5 downto 0),
      m_axis_tid(4 downto 0) => NLW_axis_data_fifo_fc_L2b_m_axis_tid_UNCONNECTED(4 downto 0),
      m_axis_tlast => dma_L2_S_AXIS_TLAST,
      m_axis_tready => dma_L2_S_AXIS_TREADY,
      m_axis_tuser(1 downto 0) => NLW_axis_data_fifo_fc_L2b_m_axis_tuser_UNCONNECTED(1 downto 0),
      m_axis_tvalid => dma_L2_S_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(63 downto 0) => l2_trigger_0_out_stream_TDATA(63 downto 0),
      s_axis_tdest(5 downto 0) => l2_trigger_0_out_stream_TDEST(5 downto 0),
      s_axis_tid(4 downto 0) => l2_trigger_0_out_stream_TID(4 downto 0),
      s_axis_tlast => l2_trigger_0_out_stream_TLAST(0),
      s_axis_tready => l2_trigger_0_out_stream_TREADY,
      s_axis_tuser(1 downto 0) => l2_trigger_0_out_stream_TUSER(1 downto 0),
      s_axis_tvalid => l2_trigger_0_out_stream_TVALID
    );
axis_data_fifo_sa_00: component design_1_axis_data_fifo_sa_00_0
     port map (
      axis_data_count(31 downto 0) => NLW_axis_data_fifo_sa_00_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_fifo_sa_00_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_fifo_sa_00_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(15 downto 0) => axis_data_fifo_sa_00_M_AXIS_TDATA(15 downto 0),
      m_axis_tlast => axis_data_fifo_sa_00_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_sa_00_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_sa_00_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(15 downto 0) => axis_broadcaster_1r1_M00_AXIS_TDATA(15 downto 0),
      s_axis_tlast => axis_broadcaster_1r1_M00_AXIS_TLAST(0),
      s_axis_tready => axis_broadcaster_1r1_M00_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_1r1_M00_AXIS_TVALID(0)
    );
axis_data_fifo_sa_01: component design_1_axis_data_fifo_sa_01_0
     port map (
      axis_data_count(31 downto 0) => NLW_axis_data_fifo_sa_01_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_fifo_sa_01_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_fifo_sa_01_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(15 downto 0) => axis_data_fifo_sa_01_M_AXIS_TDATA(15 downto 0),
      m_axis_tlast => axis_data_fifo_sa_01_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_sa_01_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_sa_01_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(15 downto 0) => axis_broadcaster_1r6_M00_AXIS_TDATA(15 downto 0),
      s_axis_tlast => axis_broadcaster_1r6_M00_AXIS_TLAST(0),
      s_axis_tready => axis_broadcaster_1r6_M00_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_1r6_M00_AXIS_TVALID(0)
    );
axis_data_fifo_sa_02: component design_1_axis_data_fifo_sa_02_0
     port map (
      axis_data_count(31 downto 0) => NLW_axis_data_fifo_sa_02_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_fifo_sa_02_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_fifo_sa_02_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(15 downto 0) => axis_data_fifo_sa_02_M_AXIS_TDATA(15 downto 0),
      m_axis_tlast => axis_data_fifo_sa_02_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_sa_02_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_sa_02_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(15 downto 0) => axis_broadcaster_1r2_M00_AXIS_TDATA(15 downto 0),
      s_axis_tlast => axis_broadcaster_1r2_M00_AXIS_TLAST(0),
      s_axis_tready => axis_broadcaster_1r2_M00_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_1r2_M00_AXIS_TVALID(0)
    );
axis_data_fifo_sa_03: component design_1_axis_data_fifo_sa_03_0
     port map (
      axis_data_count(31 downto 0) => NLW_axis_data_fifo_sa_03_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_fifo_sa_03_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_fifo_sa_03_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(15 downto 0) => axis_data_fifo_sa_03_M_AXIS_TDATA(15 downto 0),
      m_axis_tlast => axis_data_fifo_sa_03_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_sa_03_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_sa_03_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(15 downto 0) => axis_broadcaster_1r5_M00_AXIS_TDATA(15 downto 0),
      s_axis_tlast => axis_broadcaster_1r5_M00_AXIS_TLAST(0),
      s_axis_tready => axis_broadcaster_1r5_M00_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_1r5_M00_AXIS_TVALID(0)
    );
axis_data_fifo_sa_04: component design_1_axis_data_fifo_sa_04_0
     port map (
      axis_data_count(31 downto 0) => NLW_axis_data_fifo_sa_04_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_fifo_sa_04_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_fifo_sa_04_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(15 downto 0) => axis_data_fifo_sa_04_M_AXIS_TDATA(15 downto 0),
      m_axis_tlast => axis_data_fifo_sa_04_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_sa_04_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_sa_04_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(15 downto 0) => axis_broadcaster_1r4_M00_AXIS_TDATA(15 downto 0),
      s_axis_tlast => axis_broadcaster_1r4_M00_AXIS_TLAST(0),
      s_axis_tready => axis_broadcaster_1r4_M00_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_1r4_M00_AXIS_TVALID(0)
    );
axis_data_fifo_sa_05: component design_1_axis_data_fifo_sa_05_0
     port map (
      axis_data_count(31 downto 0) => NLW_axis_data_fifo_sa_05_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_data_fifo_sa_05_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_data_fifo_sa_05_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(15 downto 0) => axis_data_fifo_sa_05_M_AXIS_TDATA(15 downto 0),
      m_axis_tlast => axis_data_fifo_sa_05_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_sa_05_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_sa_05_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(15 downto 0) => axis_broadcaster_1r3_M00_AXIS_TDATA(15 downto 0),
      s_axis_tlast => axis_broadcaster_1r3_M00_AXIS_TLAST(0),
      s_axis_tready => axis_broadcaster_1r3_M00_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_1r3_M00_AXIS_TVALID(0)
    );
axis_dwidth_conv_sw_0: component design_1_axis_dwidth_conv_sw_0_0
     port map (
      aclk => processing_system7_0_FCLK_CLK1,
      aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(63 downto 0) => axis_dwidth_converter_7_M_AXIS_TDATA(63 downto 0),
      m_axis_tkeep(7 downto 0) => NLW_axis_dwidth_conv_sw_0_m_axis_tkeep_UNCONNECTED(7 downto 0),
      m_axis_tlast => axis_dwidth_converter_7_M_AXIS_TLAST,
      m_axis_tready => axis_dwidth_converter_7_M_AXIS_TREADY,
      m_axis_tvalid => axis_dwidth_converter_7_M_AXIS_TVALID,
      s_axis_tdata(7 downto 0) => axis_broadcaster_1r10_M01_AXIS_TDATA(15 downto 8),
      s_axis_tlast => axis_broadcaster_1r10_M01_AXIS_TLAST(1),
      s_axis_tready => axis_broadcaster_1r10_M01_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_1r10_M01_AXIS_TVALID(1)
    );
axis_dwidth_conv_sw_1: component design_1_axis_dwidth_conv_sw_1_0
     port map (
      aclk => processing_system7_0_FCLK_CLK1,
      aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(63 downto 0) => axis_dwidth_converter_10_M_AXIS_TDATA(63 downto 0),
      m_axis_tkeep(7 downto 0) => NLW_axis_dwidth_conv_sw_1_m_axis_tkeep_UNCONNECTED(7 downto 0),
      m_axis_tlast => axis_dwidth_converter_10_M_AXIS_TLAST,
      m_axis_tready => axis_dwidth_converter_10_M_AXIS_TREADY,
      m_axis_tvalid => axis_dwidth_converter_10_M_AXIS_TVALID,
      s_axis_tdata(7 downto 0) => axis_broadcaster_1r11_M01_AXIS_TDATA(15 downto 8),
      s_axis_tlast => axis_broadcaster_1r11_M01_AXIS_TLAST(1),
      s_axis_tready => axis_broadcaster_1r11_M01_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_1r11_M01_AXIS_TVALID(1)
    );
axis_dwidth_conv_sw_2: component design_1_axis_dwidth_conv_sw_2_0
     port map (
      aclk => processing_system7_0_FCLK_CLK1,
      aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(63 downto 0) => axis_dwidth_converter_8_M_AXIS_TDATA(63 downto 0),
      m_axis_tkeep(7 downto 0) => NLW_axis_dwidth_conv_sw_2_m_axis_tkeep_UNCONNECTED(7 downto 0),
      m_axis_tlast => axis_dwidth_converter_8_M_AXIS_TLAST,
      m_axis_tready => axis_dwidth_converter_8_M_AXIS_TREADY,
      m_axis_tvalid => axis_dwidth_converter_8_M_AXIS_TVALID,
      s_axis_tdata(7 downto 0) => axis_broadcaster_1r12_M01_AXIS_TDATA(15 downto 8),
      s_axis_tlast => axis_broadcaster_1r12_M01_AXIS_TLAST(1),
      s_axis_tready => axis_broadcaster_1r12_M01_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_1r12_M01_AXIS_TVALID(1)
    );
axis_dwidth_conv_sw_3: component design_1_axis_dwidth_conv_sw_3_0
     port map (
      aclk => processing_system7_0_FCLK_CLK1,
      aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(63 downto 0) => axis_dwidth_converter_11_M_AXIS_TDATA(63 downto 0),
      m_axis_tkeep(7 downto 0) => NLW_axis_dwidth_conv_sw_3_m_axis_tkeep_UNCONNECTED(7 downto 0),
      m_axis_tlast => axis_dwidth_converter_11_M_AXIS_TLAST,
      m_axis_tready => axis_dwidth_converter_11_M_AXIS_TREADY,
      m_axis_tvalid => axis_dwidth_converter_11_M_AXIS_TVALID,
      s_axis_tdata(7 downto 0) => axis_broadcaster_1r13_M01_AXIS_TDATA(15 downto 8),
      s_axis_tlast => axis_broadcaster_1r13_M01_AXIS_TLAST(1),
      s_axis_tready => axis_broadcaster_1r13_M01_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_1r13_M01_AXIS_TVALID(1)
    );
axis_dwidth_conv_sw_4: component design_1_axis_dwidth_conv_sw_4_0
     port map (
      aclk => processing_system7_0_FCLK_CLK1,
      aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(63 downto 0) => axis_dwidth_converter_9_M_AXIS_TDATA(63 downto 0),
      m_axis_tkeep(7 downto 0) => NLW_axis_dwidth_conv_sw_4_m_axis_tkeep_UNCONNECTED(7 downto 0),
      m_axis_tlast => axis_dwidth_converter_9_M_AXIS_TLAST,
      m_axis_tready => axis_dwidth_converter_9_M_AXIS_TREADY,
      m_axis_tvalid => axis_dwidth_converter_9_M_AXIS_TVALID,
      s_axis_tdata(7 downto 0) => axis_broadcaster_1r14_M01_AXIS_TDATA(15 downto 8),
      s_axis_tlast => axis_broadcaster_1r14_M01_AXIS_TLAST(1),
      s_axis_tready => axis_broadcaster_1r14_M01_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_1r14_M01_AXIS_TVALID(1)
    );
axis_dwidth_conv_sw_5: component design_1_axis_dwidth_conv_sw_5_0
     port map (
      aclk => processing_system7_0_FCLK_CLK1,
      aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(63 downto 0) => axis_dwidth_converter_12_M_AXIS_TDATA(63 downto 0),
      m_axis_tkeep(7 downto 0) => NLW_axis_dwidth_conv_sw_5_m_axis_tkeep_UNCONNECTED(7 downto 0),
      m_axis_tlast => axis_dwidth_converter_12_M_AXIS_TLAST,
      m_axis_tready => axis_dwidth_converter_12_M_AXIS_TREADY,
      m_axis_tvalid => axis_dwidth_converter_12_M_AXIS_TVALID,
      s_axis_tdata(7 downto 0) => axis_broadcaster_1r15_M01_AXIS_TDATA(15 downto 8),
      s_axis_tlast => axis_broadcaster_1r15_M01_AXIS_TLAST(1),
      s_axis_tready => axis_broadcaster_1r15_M01_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_1r15_M01_AXIS_TVALID(1)
    );
axis_dwidth_converter_0: component design_1_axis_dwidth_converter_0_0
     port map (
      aclk => processing_system7_0_FCLK_CLK1,
      aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(7 downto 0) => axis_dwidth_converter_0_M_AXIS_TDATA(7 downto 0),
      m_axis_tlast => axis_dwidth_converter_0_M_AXIS_TLAST,
      m_axis_tready => axis_dwidth_converter_0_M_AXIS_TREADY,
      m_axis_tvalid => axis_dwidth_converter_0_M_AXIS_TVALID,
      s_axis_tdata(15 downto 0) => axis_clock_converter_0_M_AXIS_TDATA(15 downto 0),
      s_axis_tlast => axis_clock_converter_0_M_AXIS_TLAST,
      s_axis_tready => axis_clock_converter_0_M_AXIS_TREADY,
      s_axis_tvalid => axis_clock_converter_0_M_AXIS_TVALID
    );
axis_dwidth_converter_1: component design_1_axis_dwidth_converter_1_0
     port map (
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      m_axis_tdata(191 downto 0) => axis_dwidth_converter_1_M_AXIS_TDATA(191 downto 0),
      m_axis_tkeep(23 downto 0) => NLW_axis_dwidth_converter_1_m_axis_tkeep_UNCONNECTED(23 downto 0),
      m_axis_tlast => NLW_axis_dwidth_converter_1_m_axis_tlast_UNCONNECTED,
      m_axis_tready => axis_dwidth_converter_1_M_AXIS_TREADY,
      m_axis_tvalid => axis_dwidth_converter_1_M_AXIS_TVALID,
      s_axis_tdata(31 downto 0) => axi_fifo_mm_s_1_AXI_STR_TXD_TDATA(31 downto 0),
      s_axis_tlast => axi_fifo_mm_s_1_AXI_STR_TXD_TLAST,
      s_axis_tready => axi_fifo_mm_s_1_AXI_STR_TXD_TREADY,
      s_axis_tvalid => axi_fifo_mm_s_1_AXI_STR_TXD_TVALID
    );
axis_dwidth_converter_2: component design_1_axis_dwidth_converter_2_0
     port map (
      aclk => processing_system7_0_FCLK_CLK1,
      aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(7 downto 0) => axis_dwidth_converter_2_M_AXIS_TDATA(7 downto 0),
      m_axis_tlast => axis_dwidth_converter_2_M_AXIS_TLAST,
      m_axis_tready => axis_dwidth_converter_2_M_AXIS_TREADY,
      m_axis_tvalid => axis_dwidth_converter_2_M_AXIS_TVALID,
      s_axis_tdata(15 downto 0) => axis_clock_converter_5_M_AXIS_TDATA(15 downto 0),
      s_axis_tlast => axis_clock_converter_5_M_AXIS_TLAST,
      s_axis_tready => axis_clock_converter_5_M_AXIS_TREADY,
      s_axis_tvalid => axis_clock_converter_5_M_AXIS_TVALID
    );
axis_dwidth_converter_3: component design_1_axis_dwidth_converter_3_0
     port map (
      aclk => processing_system7_0_FCLK_CLK1,
      aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(7 downto 0) => axis_dwidth_converter_3_M_AXIS_TDATA(7 downto 0),
      m_axis_tlast => axis_dwidth_converter_3_M_AXIS_TLAST,
      m_axis_tready => axis_dwidth_converter_3_M_AXIS_TREADY,
      m_axis_tvalid => axis_dwidth_converter_3_M_AXIS_TVALID,
      s_axis_tdata(15 downto 0) => axis_clock_converter_1_M_AXIS_TDATA(15 downto 0),
      s_axis_tlast => axis_clock_converter_1_M_AXIS_TLAST,
      s_axis_tready => axis_clock_converter_1_M_AXIS_TREADY,
      s_axis_tvalid => axis_clock_converter_1_M_AXIS_TVALID
    );
axis_dwidth_converter_4: component design_1_axis_dwidth_converter_4_0
     port map (
      aclk => processing_system7_0_FCLK_CLK1,
      aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(7 downto 0) => axis_dwidth_converter_4_M_AXIS_TDATA(7 downto 0),
      m_axis_tlast => axis_dwidth_converter_4_M_AXIS_TLAST,
      m_axis_tready => axis_dwidth_converter_4_M_AXIS_TREADY,
      m_axis_tvalid => axis_dwidth_converter_4_M_AXIS_TVALID,
      s_axis_tdata(15 downto 0) => axis_clock_converter_2_M_AXIS_TDATA(15 downto 0),
      s_axis_tlast => axis_clock_converter_2_M_AXIS_TLAST,
      s_axis_tready => axis_clock_converter_2_M_AXIS_TREADY,
      s_axis_tvalid => axis_clock_converter_2_M_AXIS_TVALID
    );
axis_dwidth_converter_5: component design_1_axis_dwidth_converter_5_0
     port map (
      aclk => processing_system7_0_FCLK_CLK1,
      aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(7 downto 0) => axis_dwidth_converter_5_M_AXIS1_TDATA(7 downto 0),
      m_axis_tlast => axis_dwidth_converter_5_M_AXIS1_TLAST,
      m_axis_tready => axis_dwidth_converter_5_M_AXIS1_TREADY,
      m_axis_tvalid => axis_dwidth_converter_5_M_AXIS1_TVALID,
      s_axis_tdata(15 downto 0) => axis_clock_converter_3_M_AXIS_TDATA(15 downto 0),
      s_axis_tlast => axis_clock_converter_3_M_AXIS_TLAST,
      s_axis_tready => axis_clock_converter_3_M_AXIS_TREADY,
      s_axis_tvalid => axis_clock_converter_3_M_AXIS_TVALID
    );
axis_dwidth_converter_6: component design_1_axis_dwidth_converter_6_0
     port map (
      aclk => processing_system7_0_FCLK_CLK1,
      aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      m_axis_tdata(7 downto 0) => axis_dwidth_converter_6_M_AXIS_TDATA(7 downto 0),
      m_axis_tlast => axis_dwidth_converter_6_M_AXIS_TLAST,
      m_axis_tready => axis_dwidth_converter_6_M_AXIS_TREADY,
      m_axis_tvalid => axis_dwidth_converter_6_M_AXIS_TVALID,
      s_axis_tdata(15 downto 0) => axis_clock_converter_4_M_AXIS_TDATA(15 downto 0),
      s_axis_tlast => axis_clock_converter_4_M_AXIS_TLAST,
      s_axis_tready => axis_clock_converter_4_M_AXIS_TREADY,
      s_axis_tvalid => axis_clock_converter_4_M_AXIS_TVALID
    );
axis_fifo_sw_0: component design_1_axis_fifo_sw_0_0
     port map (
      axis_data_count(31 downto 0) => axis_data_fifo_fc_L9_axis_data_count(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_fifo_sw_0_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_fifo_sw_0_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(63 downto 0) => axis_data_fifo_fc_L9_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => axis_data_fifo_fc_L9_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_fc_L9_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_fc_L9_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK1,
      s_axis_aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      s_axis_tdata(63 downto 0) => axis_dwidth_converter_7_M_AXIS_TDATA(63 downto 0),
      s_axis_tlast => axis_dwidth_converter_7_M_AXIS_TLAST,
      s_axis_tready => axis_dwidth_converter_7_M_AXIS_TREADY,
      s_axis_tvalid => axis_dwidth_converter_7_M_AXIS_TVALID
    );
axis_fifo_sw_1: component design_1_axis_fifo_sw_1_0
     port map (
      axis_data_count(31 downto 0) => NLW_axis_fifo_sw_1_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_fifo_sw_1_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_fifo_sw_1_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(63 downto 0) => axis_data_fifo_fc_L12_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => axis_data_fifo_fc_L12_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_fc_L12_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_fc_L12_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK1,
      s_axis_aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      s_axis_tdata(63 downto 0) => axis_dwidth_converter_10_M_AXIS_TDATA(63 downto 0),
      s_axis_tlast => axis_dwidth_converter_10_M_AXIS_TLAST,
      s_axis_tready => axis_dwidth_converter_10_M_AXIS_TREADY,
      s_axis_tvalid => axis_dwidth_converter_10_M_AXIS_TVALID
    );
axis_fifo_sw_2: component design_1_axis_fifo_sw_2_0
     port map (
      axis_data_count(31 downto 0) => axis_data_fifo_fc_L10_axis_data_count(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_fifo_sw_2_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_fifo_sw_2_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(63 downto 0) => axis_data_fifo_fc_L10_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => axis_data_fifo_fc_L10_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_fc_L10_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_fc_L10_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK1,
      s_axis_aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      s_axis_tdata(63 downto 0) => axis_dwidth_converter_8_M_AXIS_TDATA(63 downto 0),
      s_axis_tlast => axis_dwidth_converter_8_M_AXIS_TLAST,
      s_axis_tready => axis_dwidth_converter_8_M_AXIS_TREADY,
      s_axis_tvalid => axis_dwidth_converter_8_M_AXIS_TVALID
    );
axis_fifo_sw_3: component design_1_axis_fifo_sw_3_0
     port map (
      axis_data_count(31 downto 0) => axis_data_fifo_fc_L11_axis_data_count(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_fifo_sw_3_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_fifo_sw_3_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(63 downto 0) => axis_data_fifo_fc_L11_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => axis_data_fifo_fc_L11_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_fc_L11_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_fc_L11_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK1,
      s_axis_aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      s_axis_tdata(63 downto 0) => axis_dwidth_converter_11_M_AXIS_TDATA(63 downto 0),
      s_axis_tlast => axis_dwidth_converter_11_M_AXIS_TLAST,
      s_axis_tready => axis_dwidth_converter_11_M_AXIS_TREADY,
      s_axis_tvalid => axis_dwidth_converter_11_M_AXIS_TVALID
    );
axis_fifo_sw_4: component design_1_axis_fifo_sw_4_0
     port map (
      axis_data_count(31 downto 0) => NLW_axis_fifo_sw_4_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_fifo_sw_4_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_fifo_sw_4_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(63 downto 0) => axis_data_fifo_fc_L13_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => axis_data_fifo_fc_L13_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_fc_L13_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_fc_L13_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK1,
      s_axis_aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      s_axis_tdata(63 downto 0) => axis_dwidth_converter_9_M_AXIS_TDATA(63 downto 0),
      s_axis_tlast => axis_dwidth_converter_9_M_AXIS_TLAST,
      s_axis_tready => axis_dwidth_converter_9_M_AXIS_TREADY,
      s_axis_tvalid => axis_dwidth_converter_9_M_AXIS_TVALID
    );
axis_fifo_sw_5: component design_1_axis_fifo_sw_5_0
     port map (
      axis_data_count(31 downto 0) => NLW_axis_fifo_sw_5_axis_data_count_UNCONNECTED(31 downto 0),
      axis_rd_data_count(31 downto 0) => NLW_axis_fifo_sw_5_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_axis_fifo_sw_5_axis_wr_data_count_UNCONNECTED(31 downto 0),
      m_axis_tdata(63 downto 0) => axis_data_fifo_fc_L14_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => axis_data_fifo_fc_L14_M_AXIS_TLAST,
      m_axis_tready => axis_data_fifo_fc_L14_M_AXIS_TREADY,
      m_axis_tvalid => axis_data_fifo_fc_L14_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK1,
      s_axis_aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      s_axis_tdata(63 downto 0) => axis_dwidth_converter_12_M_AXIS_TDATA(63 downto 0),
      s_axis_tlast => axis_dwidth_converter_12_M_AXIS_TLAST,
      s_axis_tready => axis_dwidth_converter_12_M_AXIS_TREADY,
      s_axis_tvalid => axis_dwidth_converter_12_M_AXIS_TVALID
    );
axis_flow_control_D1: component design_1_axis_flow_control_d1_0_0
     port map (
      S_AXI_ACLK => processing_system7_0_FCLK_CLK1,
      S_AXI_ARADDR(6 downto 0) => inst_interconnect_200MHz_M03_AXI_ARADDR(6 downto 0),
      S_AXI_ARESETN => rst_processing_system7_0_200M_peripheral_aresetn(0),
      S_AXI_ARPROT(2 downto 0) => inst_interconnect_200MHz_M03_AXI_ARPROT(2 downto 0),
      S_AXI_ARREADY => inst_interconnect_200MHz_M03_AXI_ARREADY,
      S_AXI_ARVALID => inst_interconnect_200MHz_M03_AXI_ARVALID,
      S_AXI_AWADDR(6 downto 0) => inst_interconnect_200MHz_M03_AXI_AWADDR(6 downto 0),
      S_AXI_AWPROT(2 downto 0) => inst_interconnect_200MHz_M03_AXI_AWPROT(2 downto 0),
      S_AXI_AWREADY => inst_interconnect_200MHz_M03_AXI_AWREADY,
      S_AXI_AWVALID => inst_interconnect_200MHz_M03_AXI_AWVALID,
      S_AXI_BREADY => inst_interconnect_200MHz_M03_AXI_BREADY,
      S_AXI_BRESP(1 downto 0) => inst_interconnect_200MHz_M03_AXI_BRESP(1 downto 0),
      S_AXI_BVALID => inst_interconnect_200MHz_M03_AXI_BVALID,
      S_AXI_RDATA(31 downto 0) => inst_interconnect_200MHz_M03_AXI_RDATA(31 downto 0),
      S_AXI_RREADY => inst_interconnect_200MHz_M03_AXI_RREADY,
      S_AXI_RRESP(1 downto 0) => inst_interconnect_200MHz_M03_AXI_RRESP(1 downto 0),
      S_AXI_RVALID => inst_interconnect_200MHz_M03_AXI_RVALID,
      S_AXI_WDATA(31 downto 0) => inst_interconnect_200MHz_M03_AXI_WDATA(31 downto 0),
      S_AXI_WREADY => inst_interconnect_200MHz_M03_AXI_WREADY,
      S_AXI_WSTRB(3 downto 0) => inst_interconnect_200MHz_M03_AXI_WSTRB(3 downto 0),
      S_AXI_WVALID => inst_interconnect_200MHz_M03_AXI_WVALID,
      gtu_sig => axi_data_provider_0_gtu_sig,
      m_axis_events_tdata(63 downto 0) => NLW_axis_flow_control_D1_m_axis_events_tdata_UNCONNECTED(63 downto 0),
      m_axis_events_tready => '0',
      m_axis_events_tvalid => NLW_axis_flow_control_D1_m_axis_events_tvalid_UNCONNECTED,
      m_axis_tdata(63 downto 0) => axis_flow_control_d1_0_m_axis_TDATA(63 downto 0),
      m_axis_tkeep(7 downto 0) => axis_flow_control_d1_0_m_axis_TKEEP(7 downto 0),
      m_axis_tlast => axis_flow_control_d1_0_m_axis_TLAST,
      m_axis_tready => axis_flow_control_d1_0_m_axis_TREADY,
      m_axis_tvalid => axis_flow_control_d1_0_m_axis_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK1,
      s_axis_aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      s_axis_ta_event_tdata(31 downto 0) => ALGO_B_TA_1_m_ev_axis_TDATA(31 downto 0),
      s_axis_ta_event_tlast => ALGO_B_TA_1_m_ev_axis_TLAST,
      s_axis_ta_event_tready => ALGO_B_TA_1_m_ev_axis_TREADY,
      s_axis_ta_event_tvalid => ALGO_B_TA_1_m_ev_axis_TVALID,
      s_axis_tdata(63 downto 0) => top_switch_raw_m_axis_TDATA(63 downto 0),
      s_axis_tlast => top_switch_raw_m_axis_TLAST,
      s_axis_tready => top_switch_raw_m_axis_TREADY,
      s_axis_tvalid => top_switch_raw_m_axis_TVALID,
      trig0 => algo_b_conv_0_L1_EVENT,
      trig1 => ALGO_B_2_L1_EVENT,
      trig2 => ALGO_B_1_L1_EVENT,
      trig_4led => axis_flow_control_d1_0_trig_4led,
      trig_button => NLW_axis_flow_control_D1_trig_button_UNCONNECTED,
      trig_ext_in => trig_ext_in_1,
      trig_led => axis_flow_control_d1_0_trig_led,
      trig_out => axis_flow_control_d1_0_trig_out
    );
axis_flow_control_D2: component design_1_axis_flow_control_L2_0
     port map (
      S_AXI_ACLK => processing_system7_0_FCLK_CLK0,
      S_AXI_ARADDR(6 downto 0) => inst_interconnect_100MHz_M12_AXI_ARADDR(6 downto 0),
      S_AXI_ARESETN => rst_processing_system7_0_50M_peripheral_aresetn(0),
      S_AXI_ARPROT(2 downto 0) => inst_interconnect_100MHz_M12_AXI_ARPROT(2 downto 0),
      S_AXI_ARREADY => inst_interconnect_100MHz_M12_AXI_ARREADY,
      S_AXI_ARVALID => inst_interconnect_100MHz_M12_AXI_ARVALID,
      S_AXI_AWADDR(6 downto 0) => inst_interconnect_100MHz_M12_AXI_AWADDR(6 downto 0),
      S_AXI_AWPROT(2 downto 0) => inst_interconnect_100MHz_M12_AXI_AWPROT(2 downto 0),
      S_AXI_AWREADY => inst_interconnect_100MHz_M12_AXI_AWREADY,
      S_AXI_AWVALID => inst_interconnect_100MHz_M12_AXI_AWVALID,
      S_AXI_BREADY => inst_interconnect_100MHz_M12_AXI_BREADY,
      S_AXI_BRESP(1 downto 0) => inst_interconnect_100MHz_M12_AXI_BRESP(1 downto 0),
      S_AXI_BVALID => inst_interconnect_100MHz_M12_AXI_BVALID,
      S_AXI_RDATA(31 downto 0) => inst_interconnect_100MHz_M12_AXI_RDATA(31 downto 0),
      S_AXI_RREADY => inst_interconnect_100MHz_M12_AXI_RREADY,
      S_AXI_RRESP(1 downto 0) => inst_interconnect_100MHz_M12_AXI_RRESP(1 downto 0),
      S_AXI_RVALID => inst_interconnect_100MHz_M12_AXI_RVALID,
      S_AXI_WDATA(31 downto 0) => inst_interconnect_100MHz_M12_AXI_WDATA(31 downto 0),
      S_AXI_WREADY => inst_interconnect_100MHz_M12_AXI_WREADY,
      S_AXI_WSTRB(3 downto 0) => inst_interconnect_100MHz_M12_AXI_WSTRB(3 downto 0),
      S_AXI_WVALID => inst_interconnect_100MHz_M12_AXI_WVALID,
      gtu_sig => axi_data_provider_0_gtu_sig,
      m_axis_events_tdata(63 downto 0) => NLW_axis_flow_control_D2_m_axis_events_tdata_UNCONNECTED(63 downto 0),
      m_axis_events_tready => '0',
      m_axis_events_tvalid => NLW_axis_flow_control_D2_m_axis_events_tvalid_UNCONNECTED,
      m_axis_tdata(31 downto 0) => axis_flow_control_L2_m_axis_TDATA(31 downto 0),
      m_axis_tlast => axis_flow_control_L2_m_axis_TLAST,
      m_axis_tready => axis_flow_control_L2_m_axis_TREADY,
      m_axis_tvalid => axis_flow_control_L2_m_axis_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK0,
      s_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s_axis_tdata(31 downto 0) => axis_broadcaster_1r_M00_AXIS_TDATA(31 downto 0),
      s_axis_tlast => axis_broadcaster_1r_M00_AXIS_TLAST(0),
      s_axis_tready => axis_broadcaster_1r_M00_AXIS_TREADY,
      s_axis_tvalid => axis_broadcaster_1r_M00_AXIS_TVALID(0),
      trig0 => xlslice_0_Dout(0),
      trig1 => xlslice_0_Dout(0),
      trig2 => xlslice_0_Dout(0),
      trig_4led => axis_flow_control_L2_trig_4led,
      trig_button => NLW_axis_flow_control_D2_trig_button_UNCONNECTED,
      trig_ext_in => trig_ext_in_1,
      trig_led => axis_flow_control_L2_trig_led,
      trig_out => NLW_axis_flow_control_D2_trig_out_UNCONNECTED
    );
clk_wiz_0: component design_1_clk_wiz_0_0
     port map (
      clk_in1_n => CLK_IN1_D_1_CLK_N,
      clk_in1_p => CLK_IN1_D_1_CLK_P,
      clk_out1 => clk_wiz_0_clk_out1,
      locked => clk_wiz_0_locked
    );
clk_wiz_1: component design_1_clk_wiz_1_0
     port map (
      clk_in1_n => clk_art_1_1_CLK_N,
      clk_in1_p => clk_art_1_1_CLK_P,
      clk_out1 => clk_wiz_3_clk_out1,
      locked => clk_wiz_3_locked
    );
clk_wiz_2: component design_1_clk_wiz_2_0
     port map (
      clk_in1_n => CLK_IN1_D_1_2_CLK_N,
      clk_in1_p => CLK_IN1_D_1_2_CLK_P,
      clk_out1 => clk_wiz_2_clk_out1,
      locked => clk_wiz_2_locked
    );
hv_hk_v1_0_0: component design_1_hv_hk_v1_0_0_0
     port map (
      cs_dac_n => hv_hk_v1_0_0_cs_dac_n,
      cs_dac_p => hv_hk_v1_0_0_cs_dac_p,
      cs_exp_n => hv_hk_v1_0_0_cs_exp_n,
      cs_exp_p => hv_hk_v1_0_0_cs_exp_p,
      gtu_sig => axi_data_provider_0_gtu_sig,
      intr_n => intr_n_1,
      intr_out => hv_hk_v1_0_0_intr_out,
      intr_p => intr_p_1,
      miso_n => miso_n_1,
      miso_p => miso_p_1,
      mosi_n => hv_hk_v1_0_0_mosi_n,
      mosi_p => hv_hk_v1_0_0_mosi_p,
      s00_axi_aclk => processing_system7_0_FCLK_CLK0,
      s00_axi_araddr(6 downto 0) => processing_system7_0_axi_periph_M08_AXI_ARADDR(6 downto 0),
      s00_axi_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s00_axi_arprot(2 downto 0) => processing_system7_0_axi_periph_M08_AXI_ARPROT(2 downto 0),
      s00_axi_arready => processing_system7_0_axi_periph_M08_AXI_ARREADY,
      s00_axi_arvalid => processing_system7_0_axi_periph_M08_AXI_ARVALID,
      s00_axi_awaddr(6 downto 0) => processing_system7_0_axi_periph_M08_AXI_AWADDR(6 downto 0),
      s00_axi_awprot(2 downto 0) => processing_system7_0_axi_periph_M08_AXI_AWPROT(2 downto 0),
      s00_axi_awready => processing_system7_0_axi_periph_M08_AXI_AWREADY,
      s00_axi_awvalid => processing_system7_0_axi_periph_M08_AXI_AWVALID,
      s00_axi_bready => processing_system7_0_axi_periph_M08_AXI_BREADY,
      s00_axi_bresp(1 downto 0) => processing_system7_0_axi_periph_M08_AXI_BRESP(1 downto 0),
      s00_axi_bvalid => processing_system7_0_axi_periph_M08_AXI_BVALID,
      s00_axi_rdata(31 downto 0) => processing_system7_0_axi_periph_M08_AXI_RDATA(31 downto 0),
      s00_axi_rready => processing_system7_0_axi_periph_M08_AXI_RREADY,
      s00_axi_rresp(1 downto 0) => processing_system7_0_axi_periph_M08_AXI_RRESP(1 downto 0),
      s00_axi_rvalid => processing_system7_0_axi_periph_M08_AXI_RVALID,
      s00_axi_wdata(31 downto 0) => processing_system7_0_axi_periph_M08_AXI_WDATA(31 downto 0),
      s00_axi_wready => processing_system7_0_axi_periph_M08_AXI_WREADY,
      s00_axi_wstrb(3 downto 0) => processing_system7_0_axi_periph_M08_AXI_WSTRB(3 downto 0),
      s00_axi_wvalid => processing_system7_0_axi_periph_M08_AXI_WVALID,
      sck_n => hv_hk_v1_0_0_sck_n,
      sck_p => hv_hk_v1_0_0_sck_p
    );
inst_interconnect_100MHz: entity work.design_1_inst_interconnect_100MHz_0
     port map (
      ACLK => processing_system7_0_FCLK_CLK0,
      ARESETN(0) => rst_processing_system7_0_50M_interconnect_aresetn(0),
      M00_ACLK => processing_system7_0_FCLK_CLK0,
      M00_ARESETN(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      M00_AXI_araddr(31 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARADDR(31 downto 0),
      M00_AXI_arprot(2 downto 0) => processing_system7_0_axi_periph_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arready(0) => processing_system7_0_axi_periph_M00_AXI_ARREADY,
      M00_AXI_arvalid(0) => processing_system7_0_axi_periph_M00_AXI_ARVALID(0),
      M00_AXI_awaddr(31 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awprot(2 downto 0) => processing_system7_0_axi_periph_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awready(0) => processing_system7_0_axi_periph_M00_AXI_AWREADY,
      M00_AXI_awvalid(0) => processing_system7_0_axi_periph_M00_AXI_AWVALID(0),
      M00_AXI_bready(0) => processing_system7_0_axi_periph_M00_AXI_BREADY(0),
      M00_AXI_bresp(1 downto 0) => processing_system7_0_axi_periph_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid(0) => processing_system7_0_axi_periph_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => processing_system7_0_axi_periph_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rready(0) => processing_system7_0_axi_periph_M00_AXI_RREADY(0),
      M00_AXI_rresp(1 downto 0) => processing_system7_0_axi_periph_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid(0) => processing_system7_0_axi_periph_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => processing_system7_0_axi_periph_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wready(0) => processing_system7_0_axi_periph_M00_AXI_WREADY,
      M00_AXI_wstrb(3 downto 0) => processing_system7_0_axi_periph_M00_AXI_WSTRB(3 downto 0),
      M00_AXI_wvalid(0) => processing_system7_0_axi_periph_M00_AXI_WVALID(0),
      M01_ACLK => processing_system7_0_FCLK_CLK0,
      M01_ARESETN(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      M01_AXI_araddr(31 downto 0) => inst_interconnect_100MHz_M01_AXI_ARADDR(31 downto 0),
      M01_AXI_arready => inst_interconnect_100MHz_M01_AXI_ARREADY,
      M01_AXI_arvalid => inst_interconnect_100MHz_M01_AXI_ARVALID,
      M01_AXI_awaddr(31 downto 0) => inst_interconnect_100MHz_M01_AXI_AWADDR(31 downto 0),
      M01_AXI_awready => inst_interconnect_100MHz_M01_AXI_AWREADY,
      M01_AXI_awvalid => inst_interconnect_100MHz_M01_AXI_AWVALID,
      M01_AXI_bready => inst_interconnect_100MHz_M01_AXI_BREADY,
      M01_AXI_bresp(1 downto 0) => inst_interconnect_100MHz_M01_AXI_BRESP(1 downto 0),
      M01_AXI_bvalid => inst_interconnect_100MHz_M01_AXI_BVALID,
      M01_AXI_rdata(31 downto 0) => inst_interconnect_100MHz_M01_AXI_RDATA(31 downto 0),
      M01_AXI_rready => inst_interconnect_100MHz_M01_AXI_RREADY,
      M01_AXI_rresp(1 downto 0) => inst_interconnect_100MHz_M01_AXI_RRESP(1 downto 0),
      M01_AXI_rvalid => inst_interconnect_100MHz_M01_AXI_RVALID,
      M01_AXI_wdata(31 downto 0) => inst_interconnect_100MHz_M01_AXI_WDATA(31 downto 0),
      M01_AXI_wready => inst_interconnect_100MHz_M01_AXI_WREADY,
      M01_AXI_wstrb(3 downto 0) => inst_interconnect_100MHz_M01_AXI_WSTRB(3 downto 0),
      M01_AXI_wvalid => inst_interconnect_100MHz_M01_AXI_WVALID,
      M02_ACLK => processing_system7_0_FCLK_CLK0,
      M02_ARESETN(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      M02_AXI_araddr(31 downto 0) => processing_system7_0_axi_periph_M02_AXI_ARADDR(31 downto 0),
      M02_AXI_arready(0) => processing_system7_0_axi_periph_M02_AXI_ARREADY,
      M02_AXI_arvalid(0) => processing_system7_0_axi_periph_M02_AXI_ARVALID(0),
      M02_AXI_awaddr(31 downto 0) => processing_system7_0_axi_periph_M02_AXI_AWADDR(31 downto 0),
      M02_AXI_awready(0) => processing_system7_0_axi_periph_M02_AXI_AWREADY,
      M02_AXI_awvalid(0) => processing_system7_0_axi_periph_M02_AXI_AWVALID(0),
      M02_AXI_bready(0) => processing_system7_0_axi_periph_M02_AXI_BREADY(0),
      M02_AXI_bresp(1 downto 0) => processing_system7_0_axi_periph_M02_AXI_BRESP(1 downto 0),
      M02_AXI_bvalid(0) => processing_system7_0_axi_periph_M02_AXI_BVALID,
      M02_AXI_rdata(31 downto 0) => processing_system7_0_axi_periph_M02_AXI_RDATA(31 downto 0),
      M02_AXI_rready(0) => processing_system7_0_axi_periph_M02_AXI_RREADY(0),
      M02_AXI_rresp(1 downto 0) => processing_system7_0_axi_periph_M02_AXI_RRESP(1 downto 0),
      M02_AXI_rvalid(0) => processing_system7_0_axi_periph_M02_AXI_RVALID,
      M02_AXI_wdata(31 downto 0) => processing_system7_0_axi_periph_M02_AXI_WDATA(31 downto 0),
      M02_AXI_wready(0) => processing_system7_0_axi_periph_M02_AXI_WREADY,
      M02_AXI_wstrb(3 downto 0) => processing_system7_0_axi_periph_M02_AXI_WSTRB(3 downto 0),
      M02_AXI_wvalid(0) => processing_system7_0_axi_periph_M02_AXI_WVALID(0),
      M03_ACLK => processing_system7_0_FCLK_CLK0,
      M03_ARESETN(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      M03_AXI_araddr(31 downto 0) => processing_system7_0_axi_periph_M03_AXI_ARADDR(31 downto 0),
      M03_AXI_arready(0) => processing_system7_0_axi_periph_M03_AXI_ARREADY,
      M03_AXI_arvalid(0) => processing_system7_0_axi_periph_M03_AXI_ARVALID(0),
      M03_AXI_awaddr(31 downto 0) => processing_system7_0_axi_periph_M03_AXI_AWADDR(31 downto 0),
      M03_AXI_awready(0) => processing_system7_0_axi_periph_M03_AXI_AWREADY,
      M03_AXI_awvalid(0) => processing_system7_0_axi_periph_M03_AXI_AWVALID(0),
      M03_AXI_bready(0) => processing_system7_0_axi_periph_M03_AXI_BREADY(0),
      M03_AXI_bresp(1 downto 0) => processing_system7_0_axi_periph_M03_AXI_BRESP(1 downto 0),
      M03_AXI_bvalid(0) => processing_system7_0_axi_periph_M03_AXI_BVALID,
      M03_AXI_rdata(31 downto 0) => processing_system7_0_axi_periph_M03_AXI_RDATA(31 downto 0),
      M03_AXI_rready(0) => processing_system7_0_axi_periph_M03_AXI_RREADY(0),
      M03_AXI_rresp(1 downto 0) => processing_system7_0_axi_periph_M03_AXI_RRESP(1 downto 0),
      M03_AXI_rvalid(0) => processing_system7_0_axi_periph_M03_AXI_RVALID,
      M03_AXI_wdata(31 downto 0) => processing_system7_0_axi_periph_M03_AXI_WDATA(31 downto 0),
      M03_AXI_wready(0) => processing_system7_0_axi_periph_M03_AXI_WREADY,
      M03_AXI_wstrb(3 downto 0) => processing_system7_0_axi_periph_M03_AXI_WSTRB(3 downto 0),
      M03_AXI_wvalid(0) => processing_system7_0_axi_periph_M03_AXI_WVALID(0),
      M04_ACLK => processing_system7_0_FCLK_CLK0,
      M04_ARESETN(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      M04_AXI_araddr(31 downto 0) => inst_interconnect_100MHz_M04_AXI_ARADDR(31 downto 0),
      M04_AXI_arready => inst_interconnect_100MHz_M04_AXI_ARREADY,
      M04_AXI_arvalid => inst_interconnect_100MHz_M04_AXI_ARVALID,
      M04_AXI_awaddr(31 downto 0) => inst_interconnect_100MHz_M04_AXI_AWADDR(31 downto 0),
      M04_AXI_awready => inst_interconnect_100MHz_M04_AXI_AWREADY,
      M04_AXI_awvalid => inst_interconnect_100MHz_M04_AXI_AWVALID,
      M04_AXI_bready => inst_interconnect_100MHz_M04_AXI_BREADY,
      M04_AXI_bresp(1 downto 0) => inst_interconnect_100MHz_M04_AXI_BRESP(1 downto 0),
      M04_AXI_bvalid => inst_interconnect_100MHz_M04_AXI_BVALID,
      M04_AXI_rdata(31 downto 0) => inst_interconnect_100MHz_M04_AXI_RDATA(31 downto 0),
      M04_AXI_rready => inst_interconnect_100MHz_M04_AXI_RREADY,
      M04_AXI_rresp(1 downto 0) => inst_interconnect_100MHz_M04_AXI_RRESP(1 downto 0),
      M04_AXI_rvalid => inst_interconnect_100MHz_M04_AXI_RVALID,
      M04_AXI_wdata(31 downto 0) => inst_interconnect_100MHz_M04_AXI_WDATA(31 downto 0),
      M04_AXI_wready => inst_interconnect_100MHz_M04_AXI_WREADY,
      M04_AXI_wstrb(3 downto 0) => inst_interconnect_100MHz_M04_AXI_WSTRB(3 downto 0),
      M04_AXI_wvalid => inst_interconnect_100MHz_M04_AXI_WVALID,
      M05_ACLK => processing_system7_0_FCLK_CLK0,
      M05_ARESETN(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      M05_AXI_araddr(31 downto 0) => inst_interconnect_100MHz_M05_AXI_ARADDR(31 downto 0),
      M05_AXI_arprot(2 downto 0) => inst_interconnect_100MHz_M05_AXI_ARPROT(2 downto 0),
      M05_AXI_arready => inst_interconnect_100MHz_M05_AXI_ARREADY,
      M05_AXI_arvalid => inst_interconnect_100MHz_M05_AXI_ARVALID,
      M05_AXI_awaddr(31 downto 0) => inst_interconnect_100MHz_M05_AXI_AWADDR(31 downto 0),
      M05_AXI_awprot(2 downto 0) => inst_interconnect_100MHz_M05_AXI_AWPROT(2 downto 0),
      M05_AXI_awready => inst_interconnect_100MHz_M05_AXI_AWREADY,
      M05_AXI_awvalid => inst_interconnect_100MHz_M05_AXI_AWVALID,
      M05_AXI_bready => inst_interconnect_100MHz_M05_AXI_BREADY,
      M05_AXI_bresp(1 downto 0) => inst_interconnect_100MHz_M05_AXI_BRESP(1 downto 0),
      M05_AXI_bvalid => inst_interconnect_100MHz_M05_AXI_BVALID,
      M05_AXI_rdata(31 downto 0) => inst_interconnect_100MHz_M05_AXI_RDATA(31 downto 0),
      M05_AXI_rready => inst_interconnect_100MHz_M05_AXI_RREADY,
      M05_AXI_rresp(1 downto 0) => inst_interconnect_100MHz_M05_AXI_RRESP(1 downto 0),
      M05_AXI_rvalid => inst_interconnect_100MHz_M05_AXI_RVALID,
      M05_AXI_wdata(31 downto 0) => inst_interconnect_100MHz_M05_AXI_WDATA(31 downto 0),
      M05_AXI_wready => inst_interconnect_100MHz_M05_AXI_WREADY,
      M05_AXI_wstrb(3 downto 0) => inst_interconnect_100MHz_M05_AXI_WSTRB(3 downto 0),
      M05_AXI_wvalid => inst_interconnect_100MHz_M05_AXI_WVALID,
      M06_ACLK => processing_system7_0_FCLK_CLK0,
      M06_ARESETN(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      M06_AXI_araddr(31 downto 0) => processing_system7_0_axi_periph_M06_AXI_ARADDR(31 downto 0),
      M06_AXI_arready => processing_system7_0_axi_periph_M06_AXI_ARREADY,
      M06_AXI_arvalid => processing_system7_0_axi_periph_M06_AXI_ARVALID,
      M06_AXI_awaddr(31 downto 0) => processing_system7_0_axi_periph_M06_AXI_AWADDR(31 downto 0),
      M06_AXI_awready => processing_system7_0_axi_periph_M06_AXI_AWREADY,
      M06_AXI_awvalid => processing_system7_0_axi_periph_M06_AXI_AWVALID,
      M06_AXI_bready => processing_system7_0_axi_periph_M06_AXI_BREADY,
      M06_AXI_bresp(1 downto 0) => processing_system7_0_axi_periph_M06_AXI_BRESP(1 downto 0),
      M06_AXI_bvalid => processing_system7_0_axi_periph_M06_AXI_BVALID,
      M06_AXI_rdata(31 downto 0) => processing_system7_0_axi_periph_M06_AXI_RDATA(31 downto 0),
      M06_AXI_rready => processing_system7_0_axi_periph_M06_AXI_RREADY,
      M06_AXI_rresp(1 downto 0) => processing_system7_0_axi_periph_M06_AXI_RRESP(1 downto 0),
      M06_AXI_rvalid => processing_system7_0_axi_periph_M06_AXI_RVALID,
      M06_AXI_wdata(31 downto 0) => processing_system7_0_axi_periph_M06_AXI_WDATA(31 downto 0),
      M06_AXI_wready => processing_system7_0_axi_periph_M06_AXI_WREADY,
      M06_AXI_wstrb(3 downto 0) => processing_system7_0_axi_periph_M06_AXI_WSTRB(3 downto 0),
      M06_AXI_wvalid => processing_system7_0_axi_periph_M06_AXI_WVALID,
      M07_ACLK => processing_system7_0_FCLK_CLK0,
      M07_ARESETN(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      M07_AXI_araddr(31 downto 0) => processing_system7_0_axi_periph_M07_AXI_ARADDR(31 downto 0),
      M07_AXI_arprot(2 downto 0) => processing_system7_0_axi_periph_M07_AXI_ARPROT(2 downto 0),
      M07_AXI_arready => processing_system7_0_axi_periph_M07_AXI_ARREADY,
      M07_AXI_arvalid => processing_system7_0_axi_periph_M07_AXI_ARVALID,
      M07_AXI_awaddr(31 downto 0) => processing_system7_0_axi_periph_M07_AXI_AWADDR(31 downto 0),
      M07_AXI_awprot(2 downto 0) => processing_system7_0_axi_periph_M07_AXI_AWPROT(2 downto 0),
      M07_AXI_awready => processing_system7_0_axi_periph_M07_AXI_AWREADY,
      M07_AXI_awvalid => processing_system7_0_axi_periph_M07_AXI_AWVALID,
      M07_AXI_bready => processing_system7_0_axi_periph_M07_AXI_BREADY,
      M07_AXI_bresp(1 downto 0) => processing_system7_0_axi_periph_M07_AXI_BRESP(1 downto 0),
      M07_AXI_bvalid => processing_system7_0_axi_periph_M07_AXI_BVALID,
      M07_AXI_rdata(31 downto 0) => processing_system7_0_axi_periph_M07_AXI_RDATA(31 downto 0),
      M07_AXI_rready => processing_system7_0_axi_periph_M07_AXI_RREADY,
      M07_AXI_rresp(1 downto 0) => processing_system7_0_axi_periph_M07_AXI_RRESP(1 downto 0),
      M07_AXI_rvalid => processing_system7_0_axi_periph_M07_AXI_RVALID,
      M07_AXI_wdata(31 downto 0) => processing_system7_0_axi_periph_M07_AXI_WDATA(31 downto 0),
      M07_AXI_wready => processing_system7_0_axi_periph_M07_AXI_WREADY,
      M07_AXI_wstrb(3 downto 0) => processing_system7_0_axi_periph_M07_AXI_WSTRB(3 downto 0),
      M07_AXI_wvalid => processing_system7_0_axi_periph_M07_AXI_WVALID,
      M08_ACLK => processing_system7_0_FCLK_CLK0,
      M08_ARESETN(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      M08_AXI_araddr(31 downto 0) => processing_system7_0_axi_periph_M08_AXI_ARADDR(31 downto 0),
      M08_AXI_arprot(2 downto 0) => processing_system7_0_axi_periph_M08_AXI_ARPROT(2 downto 0),
      M08_AXI_arready => processing_system7_0_axi_periph_M08_AXI_ARREADY,
      M08_AXI_arvalid => processing_system7_0_axi_periph_M08_AXI_ARVALID,
      M08_AXI_awaddr(31 downto 0) => processing_system7_0_axi_periph_M08_AXI_AWADDR(31 downto 0),
      M08_AXI_awprot(2 downto 0) => processing_system7_0_axi_periph_M08_AXI_AWPROT(2 downto 0),
      M08_AXI_awready => processing_system7_0_axi_periph_M08_AXI_AWREADY,
      M08_AXI_awvalid => processing_system7_0_axi_periph_M08_AXI_AWVALID,
      M08_AXI_bready => processing_system7_0_axi_periph_M08_AXI_BREADY,
      M08_AXI_bresp(1 downto 0) => processing_system7_0_axi_periph_M08_AXI_BRESP(1 downto 0),
      M08_AXI_bvalid => processing_system7_0_axi_periph_M08_AXI_BVALID,
      M08_AXI_rdata(31 downto 0) => processing_system7_0_axi_periph_M08_AXI_RDATA(31 downto 0),
      M08_AXI_rready => processing_system7_0_axi_periph_M08_AXI_RREADY,
      M08_AXI_rresp(1 downto 0) => processing_system7_0_axi_periph_M08_AXI_RRESP(1 downto 0),
      M08_AXI_rvalid => processing_system7_0_axi_periph_M08_AXI_RVALID,
      M08_AXI_wdata(31 downto 0) => processing_system7_0_axi_periph_M08_AXI_WDATA(31 downto 0),
      M08_AXI_wready => processing_system7_0_axi_periph_M08_AXI_WREADY,
      M08_AXI_wstrb(3 downto 0) => processing_system7_0_axi_periph_M08_AXI_WSTRB(3 downto 0),
      M08_AXI_wvalid => processing_system7_0_axi_periph_M08_AXI_WVALID,
      M09_ACLK => processing_system7_0_FCLK_CLK0,
      M09_ARESETN(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      M09_AXI_araddr(31 downto 0) => processing_system7_0_axi_periph_M09_AXI_ARADDR(31 downto 0),
      M09_AXI_arprot(2 downto 0) => processing_system7_0_axi_periph_M09_AXI_ARPROT(2 downto 0),
      M09_AXI_arready => processing_system7_0_axi_periph_M09_AXI_ARREADY,
      M09_AXI_arvalid => processing_system7_0_axi_periph_M09_AXI_ARVALID,
      M09_AXI_awaddr(31 downto 0) => processing_system7_0_axi_periph_M09_AXI_AWADDR(31 downto 0),
      M09_AXI_awprot(2 downto 0) => processing_system7_0_axi_periph_M09_AXI_AWPROT(2 downto 0),
      M09_AXI_awready => processing_system7_0_axi_periph_M09_AXI_AWREADY,
      M09_AXI_awvalid => processing_system7_0_axi_periph_M09_AXI_AWVALID,
      M09_AXI_bready => processing_system7_0_axi_periph_M09_AXI_BREADY,
      M09_AXI_bresp(1 downto 0) => processing_system7_0_axi_periph_M09_AXI_BRESP(1 downto 0),
      M09_AXI_bvalid => processing_system7_0_axi_periph_M09_AXI_BVALID,
      M09_AXI_rdata(31 downto 0) => processing_system7_0_axi_periph_M09_AXI_RDATA(31 downto 0),
      M09_AXI_rready => processing_system7_0_axi_periph_M09_AXI_RREADY,
      M09_AXI_rresp(1 downto 0) => processing_system7_0_axi_periph_M09_AXI_RRESP(1 downto 0),
      M09_AXI_rvalid => processing_system7_0_axi_periph_M09_AXI_RVALID,
      M09_AXI_wdata(31 downto 0) => processing_system7_0_axi_periph_M09_AXI_WDATA(31 downto 0),
      M09_AXI_wready => processing_system7_0_axi_periph_M09_AXI_WREADY,
      M09_AXI_wstrb(3 downto 0) => processing_system7_0_axi_periph_M09_AXI_WSTRB(3 downto 0),
      M09_AXI_wvalid => processing_system7_0_axi_periph_M09_AXI_WVALID,
      M10_ACLK => processing_system7_0_FCLK_CLK0,
      M10_ARESETN(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      M10_AXI_araddr(31 downto 0) => inst_interconnect_100MHz_M10_AXI_ARADDR(31 downto 0),
      M10_AXI_arprot(2 downto 0) => inst_interconnect_100MHz_M10_AXI_ARPROT(2 downto 0),
      M10_AXI_arready => inst_interconnect_100MHz_M10_AXI_ARREADY,
      M10_AXI_arvalid => inst_interconnect_100MHz_M10_AXI_ARVALID,
      M10_AXI_awaddr(31 downto 0) => inst_interconnect_100MHz_M10_AXI_AWADDR(31 downto 0),
      M10_AXI_awprot(2 downto 0) => inst_interconnect_100MHz_M10_AXI_AWPROT(2 downto 0),
      M10_AXI_awready => inst_interconnect_100MHz_M10_AXI_AWREADY,
      M10_AXI_awvalid => inst_interconnect_100MHz_M10_AXI_AWVALID,
      M10_AXI_bready => inst_interconnect_100MHz_M10_AXI_BREADY,
      M10_AXI_bresp(1 downto 0) => inst_interconnect_100MHz_M10_AXI_BRESP(1 downto 0),
      M10_AXI_bvalid => inst_interconnect_100MHz_M10_AXI_BVALID,
      M10_AXI_rdata(31 downto 0) => inst_interconnect_100MHz_M10_AXI_RDATA(31 downto 0),
      M10_AXI_rready => inst_interconnect_100MHz_M10_AXI_RREADY,
      M10_AXI_rresp(1 downto 0) => inst_interconnect_100MHz_M10_AXI_RRESP(1 downto 0),
      M10_AXI_rvalid => inst_interconnect_100MHz_M10_AXI_RVALID,
      M10_AXI_wdata(31 downto 0) => inst_interconnect_100MHz_M10_AXI_WDATA(31 downto 0),
      M10_AXI_wready => inst_interconnect_100MHz_M10_AXI_WREADY,
      M10_AXI_wstrb(3 downto 0) => inst_interconnect_100MHz_M10_AXI_WSTRB(3 downto 0),
      M10_AXI_wvalid => inst_interconnect_100MHz_M10_AXI_WVALID,
      M11_ACLK => processing_system7_0_FCLK_CLK0,
      M11_ARESETN(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      M11_AXI_araddr(31 downto 0) => inst_interconnect_100MHz_M11_AXI_ARADDR(31 downto 0),
      M11_AXI_arready => inst_interconnect_100MHz_M11_AXI_ARREADY,
      M11_AXI_arvalid => inst_interconnect_100MHz_M11_AXI_ARVALID,
      M11_AXI_awaddr(31 downto 0) => inst_interconnect_100MHz_M11_AXI_AWADDR(31 downto 0),
      M11_AXI_awready => inst_interconnect_100MHz_M11_AXI_AWREADY,
      M11_AXI_awvalid => inst_interconnect_100MHz_M11_AXI_AWVALID,
      M11_AXI_bready => inst_interconnect_100MHz_M11_AXI_BREADY,
      M11_AXI_bresp(1 downto 0) => inst_interconnect_100MHz_M11_AXI_BRESP(1 downto 0),
      M11_AXI_bvalid => inst_interconnect_100MHz_M11_AXI_BVALID,
      M11_AXI_rdata(31 downto 0) => inst_interconnect_100MHz_M11_AXI_RDATA(31 downto 0),
      M11_AXI_rready => inst_interconnect_100MHz_M11_AXI_RREADY,
      M11_AXI_rresp(1 downto 0) => inst_interconnect_100MHz_M11_AXI_RRESP(1 downto 0),
      M11_AXI_rvalid => inst_interconnect_100MHz_M11_AXI_RVALID,
      M11_AXI_wdata(31 downto 0) => inst_interconnect_100MHz_M11_AXI_WDATA(31 downto 0),
      M11_AXI_wready => inst_interconnect_100MHz_M11_AXI_WREADY,
      M11_AXI_wvalid => inst_interconnect_100MHz_M11_AXI_WVALID,
      M12_ACLK => processing_system7_0_FCLK_CLK0,
      M12_ARESETN(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      M12_AXI_araddr(31 downto 0) => inst_interconnect_100MHz_M12_AXI_ARADDR(31 downto 0),
      M12_AXI_arprot(2 downto 0) => inst_interconnect_100MHz_M12_AXI_ARPROT(2 downto 0),
      M12_AXI_arready => inst_interconnect_100MHz_M12_AXI_ARREADY,
      M12_AXI_arvalid => inst_interconnect_100MHz_M12_AXI_ARVALID,
      M12_AXI_awaddr(31 downto 0) => inst_interconnect_100MHz_M12_AXI_AWADDR(31 downto 0),
      M12_AXI_awprot(2 downto 0) => inst_interconnect_100MHz_M12_AXI_AWPROT(2 downto 0),
      M12_AXI_awready => inst_interconnect_100MHz_M12_AXI_AWREADY,
      M12_AXI_awvalid => inst_interconnect_100MHz_M12_AXI_AWVALID,
      M12_AXI_bready => inst_interconnect_100MHz_M12_AXI_BREADY,
      M12_AXI_bresp(1 downto 0) => inst_interconnect_100MHz_M12_AXI_BRESP(1 downto 0),
      M12_AXI_bvalid => inst_interconnect_100MHz_M12_AXI_BVALID,
      M12_AXI_rdata(31 downto 0) => inst_interconnect_100MHz_M12_AXI_RDATA(31 downto 0),
      M12_AXI_rready => inst_interconnect_100MHz_M12_AXI_RREADY,
      M12_AXI_rresp(1 downto 0) => inst_interconnect_100MHz_M12_AXI_RRESP(1 downto 0),
      M12_AXI_rvalid => inst_interconnect_100MHz_M12_AXI_RVALID,
      M12_AXI_wdata(31 downto 0) => inst_interconnect_100MHz_M12_AXI_WDATA(31 downto 0),
      M12_AXI_wready => inst_interconnect_100MHz_M12_AXI_WREADY,
      M12_AXI_wstrb(3 downto 0) => inst_interconnect_100MHz_M12_AXI_WSTRB(3 downto 0),
      M12_AXI_wvalid => inst_interconnect_100MHz_M12_AXI_WVALID,
      M13_ACLK => processing_system7_0_FCLK_CLK0,
      M13_ARESETN(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      M13_AXI_araddr(31 downto 0) => inst_interconnect_100MHz_M13_AXI_ARADDR(31 downto 0),
      M13_AXI_arready => inst_interconnect_100MHz_M13_AXI_ARREADY,
      M13_AXI_arvalid => inst_interconnect_100MHz_M13_AXI_ARVALID,
      M13_AXI_awaddr(31 downto 0) => inst_interconnect_100MHz_M13_AXI_AWADDR(31 downto 0),
      M13_AXI_awready => inst_interconnect_100MHz_M13_AXI_AWREADY,
      M13_AXI_awvalid => inst_interconnect_100MHz_M13_AXI_AWVALID,
      M13_AXI_bready => inst_interconnect_100MHz_M13_AXI_BREADY,
      M13_AXI_bresp(1 downto 0) => inst_interconnect_100MHz_M13_AXI_BRESP(1 downto 0),
      M13_AXI_bvalid => inst_interconnect_100MHz_M13_AXI_BVALID,
      M13_AXI_rdata(31 downto 0) => inst_interconnect_100MHz_M13_AXI_RDATA(31 downto 0),
      M13_AXI_rready => inst_interconnect_100MHz_M13_AXI_RREADY,
      M13_AXI_rresp(1 downto 0) => inst_interconnect_100MHz_M13_AXI_RRESP(1 downto 0),
      M13_AXI_rvalid => inst_interconnect_100MHz_M13_AXI_RVALID,
      M13_AXI_wdata(31 downto 0) => inst_interconnect_100MHz_M13_AXI_WDATA(31 downto 0),
      M13_AXI_wready => inst_interconnect_100MHz_M13_AXI_WREADY,
      M13_AXI_wvalid => inst_interconnect_100MHz_M13_AXI_WVALID,
      M14_ACLK => processing_system7_0_FCLK_CLK0,
      M14_ARESETN(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      M14_AXI_araddr(31 downto 0) => inst_interconnect_100MHz_M14_AXI_ARADDR(31 downto 0),
      M14_AXI_arready => inst_interconnect_100MHz_M14_AXI_ARREADY,
      M14_AXI_arvalid => inst_interconnect_100MHz_M14_AXI_ARVALID,
      M14_AXI_awaddr(31 downto 0) => inst_interconnect_100MHz_M14_AXI_AWADDR(31 downto 0),
      M14_AXI_awready => inst_interconnect_100MHz_M14_AXI_AWREADY,
      M14_AXI_awvalid => inst_interconnect_100MHz_M14_AXI_AWVALID,
      M14_AXI_bready => inst_interconnect_100MHz_M14_AXI_BREADY,
      M14_AXI_bresp(1 downto 0) => inst_interconnect_100MHz_M14_AXI_BRESP(1 downto 0),
      M14_AXI_bvalid => inst_interconnect_100MHz_M14_AXI_BVALID,
      M14_AXI_rdata(31 downto 0) => inst_interconnect_100MHz_M14_AXI_RDATA(31 downto 0),
      M14_AXI_rready => inst_interconnect_100MHz_M14_AXI_RREADY,
      M14_AXI_rresp(1 downto 0) => inst_interconnect_100MHz_M14_AXI_RRESP(1 downto 0),
      M14_AXI_rvalid => inst_interconnect_100MHz_M14_AXI_RVALID,
      M14_AXI_wdata(31 downto 0) => inst_interconnect_100MHz_M14_AXI_WDATA(31 downto 0),
      M14_AXI_wready => inst_interconnect_100MHz_M14_AXI_WREADY,
      M14_AXI_wstrb(3 downto 0) => inst_interconnect_100MHz_M14_AXI_WSTRB(3 downto 0),
      M14_AXI_wvalid => inst_interconnect_100MHz_M14_AXI_WVALID,
      S00_ACLK => processing_system7_0_FCLK_CLK0,
      S00_ARESETN(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      S00_AXI_araddr(31 downto 0) => processing_system7_0_M_AXI_GP1_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => processing_system7_0_M_AXI_GP1_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => processing_system7_0_M_AXI_GP1_ARCACHE(3 downto 0),
      S00_AXI_arid(11 downto 0) => processing_system7_0_M_AXI_GP1_ARID(11 downto 0),
      S00_AXI_arlen(3 downto 0) => processing_system7_0_M_AXI_GP1_ARLEN(3 downto 0),
      S00_AXI_arlock(1 downto 0) => processing_system7_0_M_AXI_GP1_ARLOCK(1 downto 0),
      S00_AXI_arprot(2 downto 0) => processing_system7_0_M_AXI_GP1_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => processing_system7_0_M_AXI_GP1_ARQOS(3 downto 0),
      S00_AXI_arready => processing_system7_0_M_AXI_GP1_ARREADY,
      S00_AXI_arsize(2 downto 0) => processing_system7_0_M_AXI_GP1_ARSIZE(2 downto 0),
      S00_AXI_arvalid => processing_system7_0_M_AXI_GP1_ARVALID,
      S00_AXI_awaddr(31 downto 0) => processing_system7_0_M_AXI_GP1_AWADDR(31 downto 0),
      S00_AXI_awburst(1 downto 0) => processing_system7_0_M_AXI_GP1_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => processing_system7_0_M_AXI_GP1_AWCACHE(3 downto 0),
      S00_AXI_awid(11 downto 0) => processing_system7_0_M_AXI_GP1_AWID(11 downto 0),
      S00_AXI_awlen(3 downto 0) => processing_system7_0_M_AXI_GP1_AWLEN(3 downto 0),
      S00_AXI_awlock(1 downto 0) => processing_system7_0_M_AXI_GP1_AWLOCK(1 downto 0),
      S00_AXI_awprot(2 downto 0) => processing_system7_0_M_AXI_GP1_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => processing_system7_0_M_AXI_GP1_AWQOS(3 downto 0),
      S00_AXI_awready => processing_system7_0_M_AXI_GP1_AWREADY,
      S00_AXI_awsize(2 downto 0) => processing_system7_0_M_AXI_GP1_AWSIZE(2 downto 0),
      S00_AXI_awvalid => processing_system7_0_M_AXI_GP1_AWVALID,
      S00_AXI_bid(11 downto 0) => processing_system7_0_M_AXI_GP1_BID(11 downto 0),
      S00_AXI_bready => processing_system7_0_M_AXI_GP1_BREADY,
      S00_AXI_bresp(1 downto 0) => processing_system7_0_M_AXI_GP1_BRESP(1 downto 0),
      S00_AXI_bvalid => processing_system7_0_M_AXI_GP1_BVALID,
      S00_AXI_rdata(31 downto 0) => processing_system7_0_M_AXI_GP1_RDATA(31 downto 0),
      S00_AXI_rid(11 downto 0) => processing_system7_0_M_AXI_GP1_RID(11 downto 0),
      S00_AXI_rlast => processing_system7_0_M_AXI_GP1_RLAST,
      S00_AXI_rready => processing_system7_0_M_AXI_GP1_RREADY,
      S00_AXI_rresp(1 downto 0) => processing_system7_0_M_AXI_GP1_RRESP(1 downto 0),
      S00_AXI_rvalid => processing_system7_0_M_AXI_GP1_RVALID,
      S00_AXI_wdata(31 downto 0) => processing_system7_0_M_AXI_GP1_WDATA(31 downto 0),
      S00_AXI_wid(11 downto 0) => processing_system7_0_M_AXI_GP1_WID(11 downto 0),
      S00_AXI_wlast => processing_system7_0_M_AXI_GP1_WLAST,
      S00_AXI_wready => processing_system7_0_M_AXI_GP1_WREADY,
      S00_AXI_wstrb(3 downto 0) => processing_system7_0_M_AXI_GP1_WSTRB(3 downto 0),
      S00_AXI_wvalid => processing_system7_0_M_AXI_GP1_WVALID
    );
inst_interconnect_200MHz: entity work.design_1_inst_interconnect_200MHz_0
     port map (
      ACLK => processing_system7_0_FCLK_CLK1,
      ARESETN(0) => ARESETN_1(0),
      M00_ACLK => processing_system7_0_FCLK_CLK1,
      M00_ARESETN(0) => rst_processing_system7_0_200M_peripheral_aresetn(0),
      M00_AXI_araddr(31 downto 0) => processing_system7_0_axi_periph1_M00_AXI_ARADDR(31 downto 0),
      M00_AXI_arready => processing_system7_0_axi_periph1_M00_AXI_ARREADY,
      M00_AXI_arvalid => processing_system7_0_axi_periph1_M00_AXI_ARVALID,
      M00_AXI_awaddr(31 downto 0) => processing_system7_0_axi_periph1_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awready => processing_system7_0_axi_periph1_M00_AXI_AWREADY,
      M00_AXI_awvalid => processing_system7_0_axi_periph1_M00_AXI_AWVALID,
      M00_AXI_bready => processing_system7_0_axi_periph1_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => processing_system7_0_axi_periph1_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => processing_system7_0_axi_periph1_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => processing_system7_0_axi_periph1_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rready => processing_system7_0_axi_periph1_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => processing_system7_0_axi_periph1_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => processing_system7_0_axi_periph1_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => processing_system7_0_axi_periph1_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wready => processing_system7_0_axi_periph1_M00_AXI_WREADY,
      M00_AXI_wvalid => processing_system7_0_axi_periph1_M00_AXI_WVALID,
      M01_ACLK => processing_system7_0_FCLK_CLK1,
      M01_ARESETN(0) => rst_processing_system7_0_200M_peripheral_aresetn(0),
      M01_AXI_araddr => NLW_inst_interconnect_200MHz_M01_AXI_araddr_UNCONNECTED,
      M01_AXI_arprot => NLW_inst_interconnect_200MHz_M01_AXI_arprot_UNCONNECTED,
      M01_AXI_arready => '0',
      M01_AXI_arvalid => NLW_inst_interconnect_200MHz_M01_AXI_arvalid_UNCONNECTED,
      M01_AXI_awaddr => NLW_inst_interconnect_200MHz_M01_AXI_awaddr_UNCONNECTED,
      M01_AXI_awprot => NLW_inst_interconnect_200MHz_M01_AXI_awprot_UNCONNECTED,
      M01_AXI_awready => '0',
      M01_AXI_awvalid => NLW_inst_interconnect_200MHz_M01_AXI_awvalid_UNCONNECTED,
      M01_AXI_bready => NLW_inst_interconnect_200MHz_M01_AXI_bready_UNCONNECTED,
      M01_AXI_bresp => '0',
      M01_AXI_bvalid => '0',
      M01_AXI_rdata => '0',
      M01_AXI_rready => NLW_inst_interconnect_200MHz_M01_AXI_rready_UNCONNECTED,
      M01_AXI_rresp => '0',
      M01_AXI_rvalid => '0',
      M01_AXI_wdata => NLW_inst_interconnect_200MHz_M01_AXI_wdata_UNCONNECTED,
      M01_AXI_wready => '0',
      M01_AXI_wstrb => NLW_inst_interconnect_200MHz_M01_AXI_wstrb_UNCONNECTED,
      M01_AXI_wvalid => NLW_inst_interconnect_200MHz_M01_AXI_wvalid_UNCONNECTED,
      M02_ACLK => processing_system7_0_FCLK_CLK1,
      M02_ARESETN(0) => rst_processing_system7_0_200M_peripheral_aresetn(0),
      M02_AXI_araddr(31 downto 0) => inst_interconnect_200MHz_M02_AXI_ARADDR(31 downto 0),
      M02_AXI_arprot(2 downto 0) => inst_interconnect_200MHz_M02_AXI_ARPROT(2 downto 0),
      M02_AXI_arready => inst_interconnect_200MHz_M02_AXI_ARREADY,
      M02_AXI_arvalid => inst_interconnect_200MHz_M02_AXI_ARVALID,
      M02_AXI_awaddr(31 downto 0) => inst_interconnect_200MHz_M02_AXI_AWADDR(31 downto 0),
      M02_AXI_awprot(2 downto 0) => inst_interconnect_200MHz_M02_AXI_AWPROT(2 downto 0),
      M02_AXI_awready => inst_interconnect_200MHz_M02_AXI_AWREADY,
      M02_AXI_awvalid => inst_interconnect_200MHz_M02_AXI_AWVALID,
      M02_AXI_bready => inst_interconnect_200MHz_M02_AXI_BREADY,
      M02_AXI_bresp(1 downto 0) => inst_interconnect_200MHz_M02_AXI_BRESP(1 downto 0),
      M02_AXI_bvalid => inst_interconnect_200MHz_M02_AXI_BVALID,
      M02_AXI_rdata(31 downto 0) => inst_interconnect_200MHz_M02_AXI_RDATA(31 downto 0),
      M02_AXI_rready => inst_interconnect_200MHz_M02_AXI_RREADY,
      M02_AXI_rresp(1 downto 0) => inst_interconnect_200MHz_M02_AXI_RRESP(1 downto 0),
      M02_AXI_rvalid => inst_interconnect_200MHz_M02_AXI_RVALID,
      M02_AXI_wdata(31 downto 0) => inst_interconnect_200MHz_M02_AXI_WDATA(31 downto 0),
      M02_AXI_wready => inst_interconnect_200MHz_M02_AXI_WREADY,
      M02_AXI_wstrb(3 downto 0) => inst_interconnect_200MHz_M02_AXI_WSTRB(3 downto 0),
      M02_AXI_wvalid => inst_interconnect_200MHz_M02_AXI_WVALID,
      M03_ACLK => processing_system7_0_FCLK_CLK1,
      M03_ARESETN(0) => rst_processing_system7_0_200M_peripheral_aresetn(0),
      M03_AXI_araddr(31 downto 0) => inst_interconnect_200MHz_M03_AXI_ARADDR(31 downto 0),
      M03_AXI_arprot(2 downto 0) => inst_interconnect_200MHz_M03_AXI_ARPROT(2 downto 0),
      M03_AXI_arready => inst_interconnect_200MHz_M03_AXI_ARREADY,
      M03_AXI_arvalid => inst_interconnect_200MHz_M03_AXI_ARVALID,
      M03_AXI_awaddr(31 downto 0) => inst_interconnect_200MHz_M03_AXI_AWADDR(31 downto 0),
      M03_AXI_awprot(2 downto 0) => inst_interconnect_200MHz_M03_AXI_AWPROT(2 downto 0),
      M03_AXI_awready => inst_interconnect_200MHz_M03_AXI_AWREADY,
      M03_AXI_awvalid => inst_interconnect_200MHz_M03_AXI_AWVALID,
      M03_AXI_bready => inst_interconnect_200MHz_M03_AXI_BREADY,
      M03_AXI_bresp(1 downto 0) => inst_interconnect_200MHz_M03_AXI_BRESP(1 downto 0),
      M03_AXI_bvalid => inst_interconnect_200MHz_M03_AXI_BVALID,
      M03_AXI_rdata(31 downto 0) => inst_interconnect_200MHz_M03_AXI_RDATA(31 downto 0),
      M03_AXI_rready => inst_interconnect_200MHz_M03_AXI_RREADY,
      M03_AXI_rresp(1 downto 0) => inst_interconnect_200MHz_M03_AXI_RRESP(1 downto 0),
      M03_AXI_rvalid => inst_interconnect_200MHz_M03_AXI_RVALID,
      M03_AXI_wdata(31 downto 0) => inst_interconnect_200MHz_M03_AXI_WDATA(31 downto 0),
      M03_AXI_wready => inst_interconnect_200MHz_M03_AXI_WREADY,
      M03_AXI_wstrb(3 downto 0) => inst_interconnect_200MHz_M03_AXI_WSTRB(3 downto 0),
      M03_AXI_wvalid => inst_interconnect_200MHz_M03_AXI_WVALID,
      M04_ACLK => processing_system7_0_FCLK_CLK1,
      M04_ARESETN(0) => rst_processing_system7_0_200M_peripheral_aresetn(0),
      M04_AXI_araddr => NLW_inst_interconnect_200MHz_M04_AXI_araddr_UNCONNECTED,
      M04_AXI_arprot => NLW_inst_interconnect_200MHz_M04_AXI_arprot_UNCONNECTED,
      M04_AXI_arready => '0',
      M04_AXI_arvalid => NLW_inst_interconnect_200MHz_M04_AXI_arvalid_UNCONNECTED,
      M04_AXI_awaddr => NLW_inst_interconnect_200MHz_M04_AXI_awaddr_UNCONNECTED,
      M04_AXI_awprot => NLW_inst_interconnect_200MHz_M04_AXI_awprot_UNCONNECTED,
      M04_AXI_awready => '0',
      M04_AXI_awvalid => NLW_inst_interconnect_200MHz_M04_AXI_awvalid_UNCONNECTED,
      M04_AXI_bready => NLW_inst_interconnect_200MHz_M04_AXI_bready_UNCONNECTED,
      M04_AXI_bresp => '0',
      M04_AXI_bvalid => '0',
      M04_AXI_rdata => '0',
      M04_AXI_rready => NLW_inst_interconnect_200MHz_M04_AXI_rready_UNCONNECTED,
      M04_AXI_rresp => '0',
      M04_AXI_rvalid => '0',
      M04_AXI_wdata => NLW_inst_interconnect_200MHz_M04_AXI_wdata_UNCONNECTED,
      M04_AXI_wready => '0',
      M04_AXI_wstrb => NLW_inst_interconnect_200MHz_M04_AXI_wstrb_UNCONNECTED,
      M04_AXI_wvalid => NLW_inst_interconnect_200MHz_M04_AXI_wvalid_UNCONNECTED,
      M05_ACLK => processing_system7_0_FCLK_CLK1,
      M05_ARESETN(0) => rst_processing_system7_0_200M_peripheral_aresetn(0),
      M05_AXI_araddr(31 downto 0) => inst_interconnect_200MHz_M05_AXI_ARADDR(31 downto 0),
      M05_AXI_arready => inst_interconnect_200MHz_M05_AXI_ARREADY,
      M05_AXI_arvalid => inst_interconnect_200MHz_M05_AXI_ARVALID,
      M05_AXI_awaddr(31 downto 0) => inst_interconnect_200MHz_M05_AXI_AWADDR(31 downto 0),
      M05_AXI_awready => inst_interconnect_200MHz_M05_AXI_AWREADY,
      M05_AXI_awvalid => inst_interconnect_200MHz_M05_AXI_AWVALID,
      M05_AXI_bready => inst_interconnect_200MHz_M05_AXI_BREADY,
      M05_AXI_bresp(1 downto 0) => inst_interconnect_200MHz_M05_AXI_BRESP(1 downto 0),
      M05_AXI_bvalid => inst_interconnect_200MHz_M05_AXI_BVALID,
      M05_AXI_rdata(31 downto 0) => inst_interconnect_200MHz_M05_AXI_RDATA(31 downto 0),
      M05_AXI_rready => inst_interconnect_200MHz_M05_AXI_RREADY,
      M05_AXI_rresp(1 downto 0) => inst_interconnect_200MHz_M05_AXI_RRESP(1 downto 0),
      M05_AXI_rvalid => inst_interconnect_200MHz_M05_AXI_RVALID,
      M05_AXI_wdata(31 downto 0) => inst_interconnect_200MHz_M05_AXI_WDATA(31 downto 0),
      M05_AXI_wready => inst_interconnect_200MHz_M05_AXI_WREADY,
      M05_AXI_wstrb(3 downto 0) => inst_interconnect_200MHz_M05_AXI_WSTRB(3 downto 0),
      M05_AXI_wvalid => inst_interconnect_200MHz_M05_AXI_WVALID,
      M06_ACLK => processing_system7_0_FCLK_CLK1,
      M06_ARESETN(0) => rst_processing_system7_0_200M_peripheral_aresetn(0),
      M06_AXI_araddr(31 downto 0) => inst_interconnect_200MHz_M06_AXI_ARADDR(31 downto 0),
      M06_AXI_arready => inst_interconnect_200MHz_M06_AXI_ARREADY,
      M06_AXI_arvalid => inst_interconnect_200MHz_M06_AXI_ARVALID,
      M06_AXI_awaddr(31 downto 0) => inst_interconnect_200MHz_M06_AXI_AWADDR(31 downto 0),
      M06_AXI_awready => inst_interconnect_200MHz_M06_AXI_AWREADY,
      M06_AXI_awvalid => inst_interconnect_200MHz_M06_AXI_AWVALID,
      M06_AXI_bready => inst_interconnect_200MHz_M06_AXI_BREADY,
      M06_AXI_bresp(1 downto 0) => inst_interconnect_200MHz_M06_AXI_BRESP(1 downto 0),
      M06_AXI_bvalid => inst_interconnect_200MHz_M06_AXI_BVALID,
      M06_AXI_rdata(31 downto 0) => inst_interconnect_200MHz_M06_AXI_RDATA(31 downto 0),
      M06_AXI_rready => inst_interconnect_200MHz_M06_AXI_RREADY,
      M06_AXI_rresp(1 downto 0) => inst_interconnect_200MHz_M06_AXI_RRESP(1 downto 0),
      M06_AXI_rvalid => inst_interconnect_200MHz_M06_AXI_RVALID,
      M06_AXI_wdata(31 downto 0) => inst_interconnect_200MHz_M06_AXI_WDATA(31 downto 0),
      M06_AXI_wready => inst_interconnect_200MHz_M06_AXI_WREADY,
      M06_AXI_wstrb(3 downto 0) => inst_interconnect_200MHz_M06_AXI_WSTRB(3 downto 0),
      M06_AXI_wvalid => inst_interconnect_200MHz_M06_AXI_WVALID,
      S00_ACLK => processing_system7_0_FCLK_CLK1,
      S00_ARESETN(0) => rst_processing_system7_0_200M_peripheral_aresetn(0),
      S00_AXI_araddr(31 downto 0) => processing_system7_0_M_AXI_GP0_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => processing_system7_0_M_AXI_GP0_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => processing_system7_0_M_AXI_GP0_ARCACHE(3 downto 0),
      S00_AXI_arid(11 downto 0) => processing_system7_0_M_AXI_GP0_ARID(11 downto 0),
      S00_AXI_arlen(3 downto 0) => processing_system7_0_M_AXI_GP0_ARLEN(3 downto 0),
      S00_AXI_arlock(1 downto 0) => processing_system7_0_M_AXI_GP0_ARLOCK(1 downto 0),
      S00_AXI_arprot(2 downto 0) => processing_system7_0_M_AXI_GP0_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => processing_system7_0_M_AXI_GP0_ARQOS(3 downto 0),
      S00_AXI_arready => processing_system7_0_M_AXI_GP0_ARREADY,
      S00_AXI_arsize(2 downto 0) => processing_system7_0_M_AXI_GP0_ARSIZE(2 downto 0),
      S00_AXI_arvalid => processing_system7_0_M_AXI_GP0_ARVALID,
      S00_AXI_awaddr(31 downto 0) => processing_system7_0_M_AXI_GP0_AWADDR(31 downto 0),
      S00_AXI_awburst(1 downto 0) => processing_system7_0_M_AXI_GP0_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => processing_system7_0_M_AXI_GP0_AWCACHE(3 downto 0),
      S00_AXI_awid(11 downto 0) => processing_system7_0_M_AXI_GP0_AWID(11 downto 0),
      S00_AXI_awlen(3 downto 0) => processing_system7_0_M_AXI_GP0_AWLEN(3 downto 0),
      S00_AXI_awlock(1 downto 0) => processing_system7_0_M_AXI_GP0_AWLOCK(1 downto 0),
      S00_AXI_awprot(2 downto 0) => processing_system7_0_M_AXI_GP0_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => processing_system7_0_M_AXI_GP0_AWQOS(3 downto 0),
      S00_AXI_awready => processing_system7_0_M_AXI_GP0_AWREADY,
      S00_AXI_awsize(2 downto 0) => processing_system7_0_M_AXI_GP0_AWSIZE(2 downto 0),
      S00_AXI_awvalid => processing_system7_0_M_AXI_GP0_AWVALID,
      S00_AXI_bid(11 downto 0) => processing_system7_0_M_AXI_GP0_BID(11 downto 0),
      S00_AXI_bready => processing_system7_0_M_AXI_GP0_BREADY,
      S00_AXI_bresp(1 downto 0) => processing_system7_0_M_AXI_GP0_BRESP(1 downto 0),
      S00_AXI_bvalid => processing_system7_0_M_AXI_GP0_BVALID,
      S00_AXI_rdata(31 downto 0) => processing_system7_0_M_AXI_GP0_RDATA(31 downto 0),
      S00_AXI_rid(11 downto 0) => processing_system7_0_M_AXI_GP0_RID(11 downto 0),
      S00_AXI_rlast => processing_system7_0_M_AXI_GP0_RLAST,
      S00_AXI_rready => processing_system7_0_M_AXI_GP0_RREADY,
      S00_AXI_rresp(1 downto 0) => processing_system7_0_M_AXI_GP0_RRESP(1 downto 0),
      S00_AXI_rvalid => processing_system7_0_M_AXI_GP0_RVALID,
      S00_AXI_wdata(31 downto 0) => processing_system7_0_M_AXI_GP0_WDATA(31 downto 0),
      S00_AXI_wid(11 downto 0) => processing_system7_0_M_AXI_GP0_WID(11 downto 0),
      S00_AXI_wlast => processing_system7_0_M_AXI_GP0_WLAST,
      S00_AXI_wready => processing_system7_0_M_AXI_GP0_WREADY,
      S00_AXI_wstrb(3 downto 0) => processing_system7_0_M_AXI_GP0_WSTRB(3 downto 0),
      S00_AXI_wvalid => processing_system7_0_M_AXI_GP0_WVALID
    );
l2_trigger_0: component design_1_l2_trigger_0_0
     port map (
      ap_clk => processing_system7_0_FCLK_CLK0,
      ap_rst_n => rst_processing_system7_0_50M_peripheral_aresetn(0),
      in_stream_TDATA(31 downto 0) => axis_data_fifo_L2_M_AXIS_TDATA(31 downto 0),
      in_stream_TDEST(5 downto 0) => axis_data_fifo_L2_M_AXIS_TDEST(5 downto 0),
      in_stream_TID(4 downto 0) => axis_data_fifo_L2_M_AXIS_TID(4 downto 0),
      in_stream_TKEEP(3) => NLW_l2_trigger_0_in_stream_TKEEP_UNCONNECTED(3),
      in_stream_TKEEP(2 downto 0) => B"111",
      in_stream_TLAST(0) => axis_data_fifo_L2_M_AXIS_TLAST,
      in_stream_TREADY => axis_data_fifo_L2_M_AXIS_TREADY,
      in_stream_TSTRB(3) => NLW_l2_trigger_0_in_stream_TSTRB_UNCONNECTED(3),
      in_stream_TSTRB(2 downto 0) => B"111",
      in_stream_TUSER(1 downto 0) => axis_data_fifo_L2_M_AXIS_TUSER(1 downto 0),
      in_stream_TVALID => axis_data_fifo_L2_M_AXIS_TVALID,
      interrupt => NLW_l2_trigger_0_interrupt_UNCONNECTED,
      out_stream_TDATA(63 downto 0) => l2_trigger_0_out_stream_TDATA(63 downto 0),
      out_stream_TDEST(5 downto 0) => l2_trigger_0_out_stream_TDEST(5 downto 0),
      out_stream_TID(4 downto 0) => l2_trigger_0_out_stream_TID(4 downto 0),
      out_stream_TKEEP(7 downto 0) => NLW_l2_trigger_0_out_stream_TKEEP_UNCONNECTED(7 downto 0),
      out_stream_TLAST(0) => l2_trigger_0_out_stream_TLAST(0),
      out_stream_TREADY => l2_trigger_0_out_stream_TREADY,
      out_stream_TSTRB(7 downto 0) => NLW_l2_trigger_0_out_stream_TSTRB_UNCONNECTED(7 downto 0),
      out_stream_TUSER(1 downto 0) => l2_trigger_0_out_stream_TUSER(1 downto 0),
      out_stream_TVALID => l2_trigger_0_out_stream_TVALID,
      s_axi_CTRL_BUS_ARADDR(5 downto 0) => inst_interconnect_100MHz_M01_AXI_ARADDR(5 downto 0),
      s_axi_CTRL_BUS_ARREADY => inst_interconnect_100MHz_M01_AXI_ARREADY,
      s_axi_CTRL_BUS_ARVALID => inst_interconnect_100MHz_M01_AXI_ARVALID,
      s_axi_CTRL_BUS_AWADDR(5 downto 0) => inst_interconnect_100MHz_M01_AXI_AWADDR(5 downto 0),
      s_axi_CTRL_BUS_AWREADY => inst_interconnect_100MHz_M01_AXI_AWREADY,
      s_axi_CTRL_BUS_AWVALID => inst_interconnect_100MHz_M01_AXI_AWVALID,
      s_axi_CTRL_BUS_BREADY => inst_interconnect_100MHz_M01_AXI_BREADY,
      s_axi_CTRL_BUS_BRESP(1 downto 0) => inst_interconnect_100MHz_M01_AXI_BRESP(1 downto 0),
      s_axi_CTRL_BUS_BVALID => inst_interconnect_100MHz_M01_AXI_BVALID,
      s_axi_CTRL_BUS_RDATA(31 downto 0) => inst_interconnect_100MHz_M01_AXI_RDATA(31 downto 0),
      s_axi_CTRL_BUS_RREADY => inst_interconnect_100MHz_M01_AXI_RREADY,
      s_axi_CTRL_BUS_RRESP(1 downto 0) => inst_interconnect_100MHz_M01_AXI_RRESP(1 downto 0),
      s_axi_CTRL_BUS_RVALID => inst_interconnect_100MHz_M01_AXI_RVALID,
      s_axi_CTRL_BUS_WDATA(31 downto 0) => inst_interconnect_100MHz_M01_AXI_WDATA(31 downto 0),
      s_axi_CTRL_BUS_WREADY => inst_interconnect_100MHz_M01_AXI_WREADY,
      s_axi_CTRL_BUS_WSTRB(3 downto 0) => inst_interconnect_100MHz_M01_AXI_WSTRB(3 downto 0),
      s_axi_CTRL_BUS_WVALID => inst_interconnect_100MHz_M01_AXI_WVALID,
      trig_data(31 downto 0) => l2_trigger_0_trig_data(31 downto 0),
      trig_data_ap_vld => NLW_l2_trigger_0_trig_data_ap_vld_UNCONNECTED,
      trig_pixel(31 downto 0) => NLW_l2_trigger_0_trig_pixel_UNCONNECTED(31 downto 0),
      trig_pixel_ap_vld => NLW_l2_trigger_0_trig_pixel_ap_vld_UNCONNECTED
    );
processing_system7_0: component design_1_processing_system7_0_0
     port map (
      DDR_Addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_BankAddr(2 downto 0) => DDR_ba(2 downto 0),
      DDR_CAS_n => DDR_cas_n,
      DDR_CKE => DDR_cke,
      DDR_CS_n => DDR_cs_n,
      DDR_Clk => DDR_ck_p,
      DDR_Clk_n => DDR_ck_n,
      DDR_DM(3 downto 0) => DDR_dm(3 downto 0),
      DDR_DQ(31 downto 0) => DDR_dq(31 downto 0),
      DDR_DQS(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_DQS_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_DRSTB => DDR_reset_n,
      DDR_ODT => DDR_odt,
      DDR_RAS_n => DDR_ras_n,
      DDR_VRN => FIXED_IO_ddr_vrn,
      DDR_VRP => FIXED_IO_ddr_vrp,
      DDR_WEB => DDR_we_n,
      FCLK_CLK0 => processing_system7_0_FCLK_CLK1,
      FCLK_CLK1 => processing_system7_0_FCLK_CLK0,
      FCLK_RESET0_N => processing_system7_0_FCLK_RESET0_N,
      IRQ_F2P(3 downto 0) => xlconcat_1_dout(3 downto 0),
      MIO(53 downto 0) => FIXED_IO_mio(53 downto 0),
      M_AXI_GP0_ACLK => processing_system7_0_FCLK_CLK1,
      M_AXI_GP0_ARADDR(31 downto 0) => processing_system7_0_M_AXI_GP0_ARADDR(31 downto 0),
      M_AXI_GP0_ARBURST(1 downto 0) => processing_system7_0_M_AXI_GP0_ARBURST(1 downto 0),
      M_AXI_GP0_ARCACHE(3 downto 0) => processing_system7_0_M_AXI_GP0_ARCACHE(3 downto 0),
      M_AXI_GP0_ARID(11 downto 0) => processing_system7_0_M_AXI_GP0_ARID(11 downto 0),
      M_AXI_GP0_ARLEN(3 downto 0) => processing_system7_0_M_AXI_GP0_ARLEN(3 downto 0),
      M_AXI_GP0_ARLOCK(1 downto 0) => processing_system7_0_M_AXI_GP0_ARLOCK(1 downto 0),
      M_AXI_GP0_ARPROT(2 downto 0) => processing_system7_0_M_AXI_GP0_ARPROT(2 downto 0),
      M_AXI_GP0_ARQOS(3 downto 0) => processing_system7_0_M_AXI_GP0_ARQOS(3 downto 0),
      M_AXI_GP0_ARREADY => processing_system7_0_M_AXI_GP0_ARREADY,
      M_AXI_GP0_ARSIZE(2 downto 0) => processing_system7_0_M_AXI_GP0_ARSIZE(2 downto 0),
      M_AXI_GP0_ARVALID => processing_system7_0_M_AXI_GP0_ARVALID,
      M_AXI_GP0_AWADDR(31 downto 0) => processing_system7_0_M_AXI_GP0_AWADDR(31 downto 0),
      M_AXI_GP0_AWBURST(1 downto 0) => processing_system7_0_M_AXI_GP0_AWBURST(1 downto 0),
      M_AXI_GP0_AWCACHE(3 downto 0) => processing_system7_0_M_AXI_GP0_AWCACHE(3 downto 0),
      M_AXI_GP0_AWID(11 downto 0) => processing_system7_0_M_AXI_GP0_AWID(11 downto 0),
      M_AXI_GP0_AWLEN(3 downto 0) => processing_system7_0_M_AXI_GP0_AWLEN(3 downto 0),
      M_AXI_GP0_AWLOCK(1 downto 0) => processing_system7_0_M_AXI_GP0_AWLOCK(1 downto 0),
      M_AXI_GP0_AWPROT(2 downto 0) => processing_system7_0_M_AXI_GP0_AWPROT(2 downto 0),
      M_AXI_GP0_AWQOS(3 downto 0) => processing_system7_0_M_AXI_GP0_AWQOS(3 downto 0),
      M_AXI_GP0_AWREADY => processing_system7_0_M_AXI_GP0_AWREADY,
      M_AXI_GP0_AWSIZE(2 downto 0) => processing_system7_0_M_AXI_GP0_AWSIZE(2 downto 0),
      M_AXI_GP0_AWVALID => processing_system7_0_M_AXI_GP0_AWVALID,
      M_AXI_GP0_BID(11 downto 0) => processing_system7_0_M_AXI_GP0_BID(11 downto 0),
      M_AXI_GP0_BREADY => processing_system7_0_M_AXI_GP0_BREADY,
      M_AXI_GP0_BRESP(1 downto 0) => processing_system7_0_M_AXI_GP0_BRESP(1 downto 0),
      M_AXI_GP0_BVALID => processing_system7_0_M_AXI_GP0_BVALID,
      M_AXI_GP0_RDATA(31 downto 0) => processing_system7_0_M_AXI_GP0_RDATA(31 downto 0),
      M_AXI_GP0_RID(11 downto 0) => processing_system7_0_M_AXI_GP0_RID(11 downto 0),
      M_AXI_GP0_RLAST => processing_system7_0_M_AXI_GP0_RLAST,
      M_AXI_GP0_RREADY => processing_system7_0_M_AXI_GP0_RREADY,
      M_AXI_GP0_RRESP(1 downto 0) => processing_system7_0_M_AXI_GP0_RRESP(1 downto 0),
      M_AXI_GP0_RVALID => processing_system7_0_M_AXI_GP0_RVALID,
      M_AXI_GP0_WDATA(31 downto 0) => processing_system7_0_M_AXI_GP0_WDATA(31 downto 0),
      M_AXI_GP0_WID(11 downto 0) => processing_system7_0_M_AXI_GP0_WID(11 downto 0),
      M_AXI_GP0_WLAST => processing_system7_0_M_AXI_GP0_WLAST,
      M_AXI_GP0_WREADY => processing_system7_0_M_AXI_GP0_WREADY,
      M_AXI_GP0_WSTRB(3 downto 0) => processing_system7_0_M_AXI_GP0_WSTRB(3 downto 0),
      M_AXI_GP0_WVALID => processing_system7_0_M_AXI_GP0_WVALID,
      M_AXI_GP1_ACLK => processing_system7_0_FCLK_CLK0,
      M_AXI_GP1_ARADDR(31 downto 0) => processing_system7_0_M_AXI_GP1_ARADDR(31 downto 0),
      M_AXI_GP1_ARBURST(1 downto 0) => processing_system7_0_M_AXI_GP1_ARBURST(1 downto 0),
      M_AXI_GP1_ARCACHE(3 downto 0) => processing_system7_0_M_AXI_GP1_ARCACHE(3 downto 0),
      M_AXI_GP1_ARID(11 downto 0) => processing_system7_0_M_AXI_GP1_ARID(11 downto 0),
      M_AXI_GP1_ARLEN(3 downto 0) => processing_system7_0_M_AXI_GP1_ARLEN(3 downto 0),
      M_AXI_GP1_ARLOCK(1 downto 0) => processing_system7_0_M_AXI_GP1_ARLOCK(1 downto 0),
      M_AXI_GP1_ARPROT(2 downto 0) => processing_system7_0_M_AXI_GP1_ARPROT(2 downto 0),
      M_AXI_GP1_ARQOS(3 downto 0) => processing_system7_0_M_AXI_GP1_ARQOS(3 downto 0),
      M_AXI_GP1_ARREADY => processing_system7_0_M_AXI_GP1_ARREADY,
      M_AXI_GP1_ARSIZE(2 downto 0) => processing_system7_0_M_AXI_GP1_ARSIZE(2 downto 0),
      M_AXI_GP1_ARVALID => processing_system7_0_M_AXI_GP1_ARVALID,
      M_AXI_GP1_AWADDR(31 downto 0) => processing_system7_0_M_AXI_GP1_AWADDR(31 downto 0),
      M_AXI_GP1_AWBURST(1 downto 0) => processing_system7_0_M_AXI_GP1_AWBURST(1 downto 0),
      M_AXI_GP1_AWCACHE(3 downto 0) => processing_system7_0_M_AXI_GP1_AWCACHE(3 downto 0),
      M_AXI_GP1_AWID(11 downto 0) => processing_system7_0_M_AXI_GP1_AWID(11 downto 0),
      M_AXI_GP1_AWLEN(3 downto 0) => processing_system7_0_M_AXI_GP1_AWLEN(3 downto 0),
      M_AXI_GP1_AWLOCK(1 downto 0) => processing_system7_0_M_AXI_GP1_AWLOCK(1 downto 0),
      M_AXI_GP1_AWPROT(2 downto 0) => processing_system7_0_M_AXI_GP1_AWPROT(2 downto 0),
      M_AXI_GP1_AWQOS(3 downto 0) => processing_system7_0_M_AXI_GP1_AWQOS(3 downto 0),
      M_AXI_GP1_AWREADY => processing_system7_0_M_AXI_GP1_AWREADY,
      M_AXI_GP1_AWSIZE(2 downto 0) => processing_system7_0_M_AXI_GP1_AWSIZE(2 downto 0),
      M_AXI_GP1_AWVALID => processing_system7_0_M_AXI_GP1_AWVALID,
      M_AXI_GP1_BID(11 downto 0) => processing_system7_0_M_AXI_GP1_BID(11 downto 0),
      M_AXI_GP1_BREADY => processing_system7_0_M_AXI_GP1_BREADY,
      M_AXI_GP1_BRESP(1 downto 0) => processing_system7_0_M_AXI_GP1_BRESP(1 downto 0),
      M_AXI_GP1_BVALID => processing_system7_0_M_AXI_GP1_BVALID,
      M_AXI_GP1_RDATA(31 downto 0) => processing_system7_0_M_AXI_GP1_RDATA(31 downto 0),
      M_AXI_GP1_RID(11 downto 0) => processing_system7_0_M_AXI_GP1_RID(11 downto 0),
      M_AXI_GP1_RLAST => processing_system7_0_M_AXI_GP1_RLAST,
      M_AXI_GP1_RREADY => processing_system7_0_M_AXI_GP1_RREADY,
      M_AXI_GP1_RRESP(1 downto 0) => processing_system7_0_M_AXI_GP1_RRESP(1 downto 0),
      M_AXI_GP1_RVALID => processing_system7_0_M_AXI_GP1_RVALID,
      M_AXI_GP1_WDATA(31 downto 0) => processing_system7_0_M_AXI_GP1_WDATA(31 downto 0),
      M_AXI_GP1_WID(11 downto 0) => processing_system7_0_M_AXI_GP1_WID(11 downto 0),
      M_AXI_GP1_WLAST => processing_system7_0_M_AXI_GP1_WLAST,
      M_AXI_GP1_WREADY => processing_system7_0_M_AXI_GP1_WREADY,
      M_AXI_GP1_WSTRB(3 downto 0) => processing_system7_0_M_AXI_GP1_WSTRB(3 downto 0),
      M_AXI_GP1_WVALID => processing_system7_0_M_AXI_GP1_WVALID,
      PS_CLK => FIXED_IO_ps_clk,
      PS_PORB => FIXED_IO_ps_porb,
      PS_SRSTB => FIXED_IO_ps_srstb,
      S_AXI_HP0_ACLK => processing_system7_0_FCLK_CLK1,
      S_AXI_HP0_ARADDR(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_HP0_ARBURST(1 downto 0) => B"00",
      S_AXI_HP0_ARCACHE(3 downto 0) => B"0000",
      S_AXI_HP0_ARID(5 downto 0) => B"000000",
      S_AXI_HP0_ARLEN(3 downto 0) => B"0000",
      S_AXI_HP0_ARLOCK(1 downto 0) => B"00",
      S_AXI_HP0_ARPROT(2 downto 0) => B"000",
      S_AXI_HP0_ARQOS(3 downto 0) => B"0000",
      S_AXI_HP0_ARREADY => NLW_processing_system7_0_S_AXI_HP0_ARREADY_UNCONNECTED,
      S_AXI_HP0_ARSIZE(2 downto 0) => B"000",
      S_AXI_HP0_ARVALID => '0',
      S_AXI_HP0_AWADDR(31 downto 0) => axi_interconnect_1_M00_AXI_AWADDR(31 downto 0),
      S_AXI_HP0_AWBURST(1 downto 0) => axi_interconnect_1_M00_AXI_AWBURST(1 downto 0),
      S_AXI_HP0_AWCACHE(3 downto 0) => axi_interconnect_1_M00_AXI_AWCACHE(3 downto 0),
      S_AXI_HP0_AWID(5 downto 0) => B"000000",
      S_AXI_HP0_AWLEN(3 downto 0) => axi_interconnect_1_M00_AXI_AWLEN(3 downto 0),
      S_AXI_HP0_AWLOCK(1 downto 0) => axi_interconnect_1_M00_AXI_AWLOCK(1 downto 0),
      S_AXI_HP0_AWPROT(2 downto 0) => axi_interconnect_1_M00_AXI_AWPROT(2 downto 0),
      S_AXI_HP0_AWQOS(3 downto 0) => axi_interconnect_1_M00_AXI_AWQOS(3 downto 0),
      S_AXI_HP0_AWREADY => axi_interconnect_1_M00_AXI_AWREADY,
      S_AXI_HP0_AWSIZE(2 downto 0) => axi_interconnect_1_M00_AXI_AWSIZE(2 downto 0),
      S_AXI_HP0_AWVALID => axi_interconnect_1_M00_AXI_AWVALID,
      S_AXI_HP0_BID(5 downto 0) => NLW_processing_system7_0_S_AXI_HP0_BID_UNCONNECTED(5 downto 0),
      S_AXI_HP0_BREADY => axi_interconnect_1_M00_AXI_BREADY,
      S_AXI_HP0_BRESP(1 downto 0) => axi_interconnect_1_M00_AXI_BRESP(1 downto 0),
      S_AXI_HP0_BVALID => axi_interconnect_1_M00_AXI_BVALID,
      S_AXI_HP0_RACOUNT(2 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RACOUNT_UNCONNECTED(2 downto 0),
      S_AXI_HP0_RCOUNT(7 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP0_RDATA(63 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RDATA_UNCONNECTED(63 downto 0),
      S_AXI_HP0_RDISSUECAP1_EN => '0',
      S_AXI_HP0_RID(5 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RID_UNCONNECTED(5 downto 0),
      S_AXI_HP0_RLAST => NLW_processing_system7_0_S_AXI_HP0_RLAST_UNCONNECTED,
      S_AXI_HP0_RREADY => '0',
      S_AXI_HP0_RRESP(1 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RRESP_UNCONNECTED(1 downto 0),
      S_AXI_HP0_RVALID => NLW_processing_system7_0_S_AXI_HP0_RVALID_UNCONNECTED,
      S_AXI_HP0_WACOUNT(5 downto 0) => NLW_processing_system7_0_S_AXI_HP0_WACOUNT_UNCONNECTED(5 downto 0),
      S_AXI_HP0_WCOUNT(7 downto 0) => NLW_processing_system7_0_S_AXI_HP0_WCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP0_WDATA(63 downto 0) => axi_interconnect_1_M00_AXI_WDATA(63 downto 0),
      S_AXI_HP0_WID(5 downto 0) => B"000000",
      S_AXI_HP0_WLAST => axi_interconnect_1_M00_AXI_WLAST,
      S_AXI_HP0_WREADY => axi_interconnect_1_M00_AXI_WREADY,
      S_AXI_HP0_WRISSUECAP1_EN => '0',
      S_AXI_HP0_WSTRB(7 downto 0) => axi_interconnect_1_M00_AXI_WSTRB(7 downto 0),
      S_AXI_HP0_WVALID => axi_interconnect_1_M00_AXI_WVALID,
      S_AXI_HP1_ACLK => processing_system7_0_FCLK_CLK0,
      S_AXI_HP1_ARADDR(31 downto 0) => axi_interconnect_0_M00_AXI_ARADDR(31 downto 0),
      S_AXI_HP1_ARBURST(1 downto 0) => axi_interconnect_0_M00_AXI_ARBURST(1 downto 0),
      S_AXI_HP1_ARCACHE(3 downto 0) => axi_interconnect_0_M00_AXI_ARCACHE(3 downto 0),
      S_AXI_HP1_ARID(5 downto 1) => B"00000",
      S_AXI_HP1_ARID(0) => axi_interconnect_0_M00_AXI_ARID(0),
      S_AXI_HP1_ARLEN(3 downto 0) => axi_interconnect_0_M00_AXI_ARLEN(3 downto 0),
      S_AXI_HP1_ARLOCK(1 downto 0) => axi_interconnect_0_M00_AXI_ARLOCK(1 downto 0),
      S_AXI_HP1_ARPROT(2 downto 0) => axi_interconnect_0_M00_AXI_ARPROT(2 downto 0),
      S_AXI_HP1_ARQOS(3 downto 0) => axi_interconnect_0_M00_AXI_ARQOS(3 downto 0),
      S_AXI_HP1_ARREADY => axi_interconnect_0_M00_AXI_ARREADY,
      S_AXI_HP1_ARSIZE(2 downto 0) => axi_interconnect_0_M00_AXI_ARSIZE(2 downto 0),
      S_AXI_HP1_ARVALID => axi_interconnect_0_M00_AXI_ARVALID,
      S_AXI_HP1_AWADDR(31 downto 0) => axi_interconnect_0_M00_AXI_AWADDR(31 downto 0),
      S_AXI_HP1_AWBURST(1 downto 0) => axi_interconnect_0_M00_AXI_AWBURST(1 downto 0),
      S_AXI_HP1_AWCACHE(3 downto 0) => axi_interconnect_0_M00_AXI_AWCACHE(3 downto 0),
      S_AXI_HP1_AWID(5 downto 1) => B"00000",
      S_AXI_HP1_AWID(0) => axi_interconnect_0_M00_AXI_AWID(0),
      S_AXI_HP1_AWLEN(3 downto 0) => axi_interconnect_0_M00_AXI_AWLEN(3 downto 0),
      S_AXI_HP1_AWLOCK(1 downto 0) => axi_interconnect_0_M00_AXI_AWLOCK(1 downto 0),
      S_AXI_HP1_AWPROT(2 downto 0) => axi_interconnect_0_M00_AXI_AWPROT(2 downto 0),
      S_AXI_HP1_AWQOS(3 downto 0) => axi_interconnect_0_M00_AXI_AWQOS(3 downto 0),
      S_AXI_HP1_AWREADY => axi_interconnect_0_M00_AXI_AWREADY,
      S_AXI_HP1_AWSIZE(2 downto 0) => axi_interconnect_0_M00_AXI_AWSIZE(2 downto 0),
      S_AXI_HP1_AWVALID => axi_interconnect_0_M00_AXI_AWVALID,
      S_AXI_HP1_BID(5 downto 0) => axi_interconnect_0_M00_AXI_BID(5 downto 0),
      S_AXI_HP1_BREADY => axi_interconnect_0_M00_AXI_BREADY,
      S_AXI_HP1_BRESP(1 downto 0) => axi_interconnect_0_M00_AXI_BRESP(1 downto 0),
      S_AXI_HP1_BVALID => axi_interconnect_0_M00_AXI_BVALID,
      S_AXI_HP1_RACOUNT(2 downto 0) => NLW_processing_system7_0_S_AXI_HP1_RACOUNT_UNCONNECTED(2 downto 0),
      S_AXI_HP1_RCOUNT(7 downto 0) => NLW_processing_system7_0_S_AXI_HP1_RCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP1_RDATA(63 downto 0) => axi_interconnect_0_M00_AXI_RDATA(63 downto 0),
      S_AXI_HP1_RDISSUECAP1_EN => '0',
      S_AXI_HP1_RID(5 downto 0) => axi_interconnect_0_M00_AXI_RID(5 downto 0),
      S_AXI_HP1_RLAST => axi_interconnect_0_M00_AXI_RLAST,
      S_AXI_HP1_RREADY => axi_interconnect_0_M00_AXI_RREADY,
      S_AXI_HP1_RRESP(1 downto 0) => axi_interconnect_0_M00_AXI_RRESP(1 downto 0),
      S_AXI_HP1_RVALID => axi_interconnect_0_M00_AXI_RVALID,
      S_AXI_HP1_WACOUNT(5 downto 0) => NLW_processing_system7_0_S_AXI_HP1_WACOUNT_UNCONNECTED(5 downto 0),
      S_AXI_HP1_WCOUNT(7 downto 0) => NLW_processing_system7_0_S_AXI_HP1_WCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP1_WDATA(63 downto 0) => axi_interconnect_0_M00_AXI_WDATA(63 downto 0),
      S_AXI_HP1_WID(5 downto 1) => B"00000",
      S_AXI_HP1_WID(0) => axi_interconnect_0_M00_AXI_WID(0),
      S_AXI_HP1_WLAST => axi_interconnect_0_M00_AXI_WLAST,
      S_AXI_HP1_WREADY => axi_interconnect_0_M00_AXI_WREADY,
      S_AXI_HP1_WRISSUECAP1_EN => '0',
      S_AXI_HP1_WSTRB(7 downto 0) => axi_interconnect_0_M00_AXI_WSTRB(7 downto 0),
      S_AXI_HP1_WVALID => axi_interconnect_0_M00_AXI_WVALID
    );
rst_processing_system7_0_100M: component design_1_rst_processing_system7_0_100M_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_rst_processing_system7_0_100M_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => processing_system7_0_FCLK_RESET0_N,
      interconnect_aresetn(0) => rst_processing_system7_0_50M_interconnect_aresetn(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_rst_processing_system7_0_100M_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => rst_processing_system7_0_50M_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_rst_processing_system7_0_100M_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => processing_system7_0_FCLK_CLK0
    );
rst_processing_system7_0_200M: component design_1_rst_processing_system7_0_200M_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_rst_processing_system7_0_200M_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => processing_system7_0_FCLK_RESET0_N,
      interconnect_aresetn(0) => ARESETN_1(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_rst_processing_system7_0_200M_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => rst_processing_system7_0_200M_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_rst_processing_system7_0_200M_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => processing_system7_0_FCLK_CLK1
    );
scurve_adder_0: component design_1_scurve_adder_0_0
     port map (
      ap_clk => processing_system7_0_FCLK_CLK0,
      ap_rst_n => rst_processing_system7_0_50M_peripheral_aresetn(0),
      in_stream0_TDATA(15 downto 0) => axis_data_fifo_sa_00_M_AXIS_TDATA(15 downto 0),
      in_stream0_TDEST(5 downto 0) => B"000000",
      in_stream0_TID(4 downto 0) => B"00000",
      in_stream0_TKEEP(1 downto 0) => NLW_scurve_adder_0_in_stream0_TKEEP_UNCONNECTED(1 downto 0),
      in_stream0_TLAST(0) => axis_data_fifo_sa_00_M_AXIS_TLAST,
      in_stream0_TREADY => axis_data_fifo_sa_00_M_AXIS_TREADY,
      in_stream0_TSTRB(1 downto 0) => NLW_scurve_adder_0_in_stream0_TSTRB_UNCONNECTED(1 downto 0),
      in_stream0_TUSER(1 downto 0) => B"00",
      in_stream0_TVALID => axis_data_fifo_sa_00_M_AXIS_TVALID,
      in_stream1_TDATA(15 downto 0) => axis_data_fifo_sa_01_M_AXIS_TDATA(15 downto 0),
      in_stream1_TDEST(5 downto 0) => B"000000",
      in_stream1_TID(4 downto 0) => B"00000",
      in_stream1_TKEEP(1 downto 0) => NLW_scurve_adder_0_in_stream1_TKEEP_UNCONNECTED(1 downto 0),
      in_stream1_TLAST(0) => axis_data_fifo_sa_01_M_AXIS_TLAST,
      in_stream1_TREADY => axis_data_fifo_sa_01_M_AXIS_TREADY,
      in_stream1_TSTRB(1 downto 0) => NLW_scurve_adder_0_in_stream1_TSTRB_UNCONNECTED(1 downto 0),
      in_stream1_TUSER(1 downto 0) => B"00",
      in_stream1_TVALID => axis_data_fifo_sa_01_M_AXIS_TVALID,
      in_stream2_TDATA(15 downto 0) => axis_data_fifo_sa_02_M_AXIS_TDATA(15 downto 0),
      in_stream2_TDEST(5 downto 0) => B"000000",
      in_stream2_TID(4 downto 0) => B"00000",
      in_stream2_TKEEP(1 downto 0) => NLW_scurve_adder_0_in_stream2_TKEEP_UNCONNECTED(1 downto 0),
      in_stream2_TLAST(0) => axis_data_fifo_sa_02_M_AXIS_TLAST,
      in_stream2_TREADY => axis_data_fifo_sa_02_M_AXIS_TREADY,
      in_stream2_TSTRB(1 downto 0) => NLW_scurve_adder_0_in_stream2_TSTRB_UNCONNECTED(1 downto 0),
      in_stream2_TUSER(1 downto 0) => B"00",
      in_stream2_TVALID => axis_data_fifo_sa_02_M_AXIS_TVALID,
      in_stream3_TDATA(15 downto 0) => axis_data_fifo_sa_03_M_AXIS_TDATA(15 downto 0),
      in_stream3_TDEST(5 downto 0) => B"000000",
      in_stream3_TID(4 downto 0) => B"00000",
      in_stream3_TKEEP(1 downto 0) => NLW_scurve_adder_0_in_stream3_TKEEP_UNCONNECTED(1 downto 0),
      in_stream3_TLAST(0) => axis_data_fifo_sa_03_M_AXIS_TLAST,
      in_stream3_TREADY => axis_data_fifo_sa_03_M_AXIS_TREADY,
      in_stream3_TSTRB(1 downto 0) => NLW_scurve_adder_0_in_stream3_TSTRB_UNCONNECTED(1 downto 0),
      in_stream3_TUSER(1 downto 0) => B"00",
      in_stream3_TVALID => axis_data_fifo_sa_03_M_AXIS_TVALID,
      in_stream4_TDATA(15 downto 0) => axis_data_fifo_sa_04_M_AXIS_TDATA(15 downto 0),
      in_stream4_TDEST(5 downto 0) => B"000000",
      in_stream4_TID(4 downto 0) => B"00000",
      in_stream4_TKEEP(1 downto 0) => NLW_scurve_adder_0_in_stream4_TKEEP_UNCONNECTED(1 downto 0),
      in_stream4_TLAST(0) => axis_data_fifo_sa_04_M_AXIS_TLAST,
      in_stream4_TREADY => axis_data_fifo_sa_04_M_AXIS_TREADY,
      in_stream4_TSTRB(1 downto 0) => NLW_scurve_adder_0_in_stream4_TSTRB_UNCONNECTED(1 downto 0),
      in_stream4_TUSER(1 downto 0) => B"00",
      in_stream4_TVALID => axis_data_fifo_sa_04_M_AXIS_TVALID,
      in_stream5_TDATA(15 downto 0) => axis_data_fifo_sa_05_M_AXIS_TDATA(15 downto 0),
      in_stream5_TDEST(5 downto 0) => B"000000",
      in_stream5_TID(4 downto 0) => B"00000",
      in_stream5_TKEEP(1 downto 0) => NLW_scurve_adder_0_in_stream5_TKEEP_UNCONNECTED(1 downto 0),
      in_stream5_TLAST(0) => axis_data_fifo_sa_05_M_AXIS_TLAST,
      in_stream5_TREADY => axis_data_fifo_sa_05_M_AXIS_TREADY,
      in_stream5_TSTRB(1 downto 0) => NLW_scurve_adder_0_in_stream5_TSTRB_UNCONNECTED(1 downto 0),
      in_stream5_TUSER(1 downto 0) => B"00",
      in_stream5_TVALID => axis_data_fifo_sa_05_M_AXIS_TVALID,
      interrupt => NLW_scurve_adder_0_interrupt_UNCONNECTED,
      out_stream_TDATA(31 downto 0) => scurve_adder_0_out_stream_TDATA(31 downto 0),
      out_stream_TDEST(5 downto 0) => scurve_adder_0_out_stream_TDEST(5 downto 0),
      out_stream_TID(4 downto 0) => scurve_adder_0_out_stream_TID(4 downto 0),
      out_stream_TKEEP(3 downto 0) => NLW_scurve_adder_0_out_stream_TKEEP_UNCONNECTED(3 downto 0),
      out_stream_TLAST(0) => scurve_adder_0_out_stream_TLAST(0),
      out_stream_TREADY => scurve_adder_0_out_stream_TREADY,
      out_stream_TSTRB(3 downto 0) => NLW_scurve_adder_0_out_stream_TSTRB_UNCONNECTED(3 downto 0),
      out_stream_TUSER(1 downto 0) => scurve_adder_0_out_stream_TUSER(1 downto 0),
      out_stream_TVALID => scurve_adder_0_out_stream_TVALID,
      s_axi_CTRL_BUS_ARADDR(4 downto 0) => inst_interconnect_100MHz_M04_AXI_ARADDR(4 downto 0),
      s_axi_CTRL_BUS_ARREADY => inst_interconnect_100MHz_M04_AXI_ARREADY,
      s_axi_CTRL_BUS_ARVALID => inst_interconnect_100MHz_M04_AXI_ARVALID,
      s_axi_CTRL_BUS_AWADDR(4 downto 0) => inst_interconnect_100MHz_M04_AXI_AWADDR(4 downto 0),
      s_axi_CTRL_BUS_AWREADY => inst_interconnect_100MHz_M04_AXI_AWREADY,
      s_axi_CTRL_BUS_AWVALID => inst_interconnect_100MHz_M04_AXI_AWVALID,
      s_axi_CTRL_BUS_BREADY => inst_interconnect_100MHz_M04_AXI_BREADY,
      s_axi_CTRL_BUS_BRESP(1 downto 0) => inst_interconnect_100MHz_M04_AXI_BRESP(1 downto 0),
      s_axi_CTRL_BUS_BVALID => inst_interconnect_100MHz_M04_AXI_BVALID,
      s_axi_CTRL_BUS_RDATA(31 downto 0) => inst_interconnect_100MHz_M04_AXI_RDATA(31 downto 0),
      s_axi_CTRL_BUS_RREADY => inst_interconnect_100MHz_M04_AXI_RREADY,
      s_axi_CTRL_BUS_RRESP(1 downto 0) => inst_interconnect_100MHz_M04_AXI_RRESP(1 downto 0),
      s_axi_CTRL_BUS_RVALID => inst_interconnect_100MHz_M04_AXI_RVALID,
      s_axi_CTRL_BUS_WDATA(31 downto 0) => inst_interconnect_100MHz_M04_AXI_WDATA(31 downto 0),
      s_axi_CTRL_BUS_WREADY => inst_interconnect_100MHz_M04_AXI_WREADY,
      s_axi_CTRL_BUS_WSTRB(3 downto 0) => inst_interconnect_100MHz_M04_AXI_WSTRB(3 downto 0),
      s_axi_CTRL_BUS_WVALID => inst_interconnect_100MHz_M04_AXI_WVALID
    );
spaciroc3_sc_0: component design_1_spaciroc3_sc_0_0
     port map (
      loadb_sc_pc => spaciroc3_sc_0_loadb_sc_pc,
      resetb_pc => spaciroc3_sc_0_resetb_pc,
      s00_axi_aclk => processing_system7_0_FCLK_CLK0,
      s00_axi_araddr(7 downto 0) => processing_system7_0_axi_periph_M07_AXI_ARADDR(7 downto 0),
      s00_axi_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s00_axi_arprot(2 downto 0) => processing_system7_0_axi_periph_M07_AXI_ARPROT(2 downto 0),
      s00_axi_arready => processing_system7_0_axi_periph_M07_AXI_ARREADY,
      s00_axi_arvalid => processing_system7_0_axi_periph_M07_AXI_ARVALID,
      s00_axi_awaddr(7 downto 0) => processing_system7_0_axi_periph_M07_AXI_AWADDR(7 downto 0),
      s00_axi_awprot(2 downto 0) => processing_system7_0_axi_periph_M07_AXI_AWPROT(2 downto 0),
      s00_axi_awready => processing_system7_0_axi_periph_M07_AXI_AWREADY,
      s00_axi_awvalid => processing_system7_0_axi_periph_M07_AXI_AWVALID,
      s00_axi_bready => processing_system7_0_axi_periph_M07_AXI_BREADY,
      s00_axi_bresp(1 downto 0) => processing_system7_0_axi_periph_M07_AXI_BRESP(1 downto 0),
      s00_axi_bvalid => processing_system7_0_axi_periph_M07_AXI_BVALID,
      s00_axi_rdata(31 downto 0) => processing_system7_0_axi_periph_M07_AXI_RDATA(31 downto 0),
      s00_axi_rready => processing_system7_0_axi_periph_M07_AXI_RREADY,
      s00_axi_rresp(1 downto 0) => processing_system7_0_axi_periph_M07_AXI_RRESP(1 downto 0),
      s00_axi_rvalid => processing_system7_0_axi_periph_M07_AXI_RVALID,
      s00_axi_wdata(31 downto 0) => processing_system7_0_axi_periph_M07_AXI_WDATA(31 downto 0),
      s00_axi_wready => processing_system7_0_axi_periph_M07_AXI_WREADY,
      s00_axi_wstrb(3 downto 0) => processing_system7_0_axi_periph_M07_AXI_WSTRB(3 downto 0),
      s00_axi_wvalid => processing_system7_0_axi_periph_M07_AXI_WVALID,
      s00_axis_aclk => processing_system7_0_FCLK_CLK0,
      s00_axis_aresetn => rst_processing_system7_0_50M_peripheral_aresetn(0),
      s00_axis_tdata(191 downto 0) => axis_dwidth_converter_1_M_AXIS_TDATA(191 downto 0),
      s00_axis_tready => axis_dwidth_converter_1_M_AXIS_TREADY,
      s00_axis_tvalid => axis_dwidth_converter_1_M_AXIS_TVALID,
      select_din_pc => spaciroc3_sc_0_select_din_pc,
      select_sc_probe_pc => spaciroc3_sc_0_select_sc_probe_pc,
      sr_ck_pc => spaciroc3_sc_0_sr_ck_pc,
      sr_in_pc(5 downto 0) => spaciroc3_sc_0_sr_in_pc(5 downto 0),
      sr_out_pc => '0',
      sr_rstb_pc => spaciroc3_sc_0_sr_rstb_pc,
      user_led => NLW_spaciroc3_sc_0_user_led_UNCONNECTED
    );
top_switch_raw: component design_1_top_switch_raw_0
     port map (
      S_AXI_ACLK => processing_system7_0_FCLK_CLK1,
      S_AXI_ARADDR(6 downto 0) => inst_interconnect_200MHz_M02_AXI_ARADDR(6 downto 0),
      S_AXI_ARESETN => rst_processing_system7_0_200M_peripheral_aresetn(0),
      S_AXI_ARPROT(2 downto 0) => inst_interconnect_200MHz_M02_AXI_ARPROT(2 downto 0),
      S_AXI_ARREADY => inst_interconnect_200MHz_M02_AXI_ARREADY,
      S_AXI_ARVALID => inst_interconnect_200MHz_M02_AXI_ARVALID,
      S_AXI_AWADDR(6 downto 0) => inst_interconnect_200MHz_M02_AXI_AWADDR(6 downto 0),
      S_AXI_AWPROT(2 downto 0) => inst_interconnect_200MHz_M02_AXI_AWPROT(2 downto 0),
      S_AXI_AWREADY => inst_interconnect_200MHz_M02_AXI_AWREADY,
      S_AXI_AWVALID => inst_interconnect_200MHz_M02_AXI_AWVALID,
      S_AXI_BREADY => inst_interconnect_200MHz_M02_AXI_BREADY,
      S_AXI_BRESP(1 downto 0) => inst_interconnect_200MHz_M02_AXI_BRESP(1 downto 0),
      S_AXI_BVALID => inst_interconnect_200MHz_M02_AXI_BVALID,
      S_AXI_RDATA(31 downto 0) => inst_interconnect_200MHz_M02_AXI_RDATA(31 downto 0),
      S_AXI_RREADY => inst_interconnect_200MHz_M02_AXI_RREADY,
      S_AXI_RRESP(1 downto 0) => inst_interconnect_200MHz_M02_AXI_RRESP(1 downto 0),
      S_AXI_RVALID => inst_interconnect_200MHz_M02_AXI_RVALID,
      S_AXI_WDATA(31 downto 0) => inst_interconnect_200MHz_M02_AXI_WDATA(31 downto 0),
      S_AXI_WREADY => inst_interconnect_200MHz_M02_AXI_WREADY,
      S_AXI_WSTRB(3 downto 0) => inst_interconnect_200MHz_M02_AXI_WSTRB(3 downto 0),
      S_AXI_WVALID => inst_interconnect_200MHz_M02_AXI_WVALID,
      gpio_0(31 downto 0) => axis_data_fifo_fc_L9_axis_data_count(31 downto 0),
      gpio_1(31 downto 0) => axis_data_fifo_fc_L11_axis_data_count(31 downto 0),
      gpio_2(31 downto 0) => axis_data_fifo_fc_L10_axis_data_count(31 downto 0),
      gpio_3(31 downto 0) => B"00000000000000000000000000000000",
      gpio_4(31 downto 0) => B"00000000000000000000000000000000",
      gpio_5(31 downto 0) => B"00000000000000000000000000000000",
      m_axis_event_tdata(31 downto 0) => NLW_top_switch_raw_m_axis_event_tdata_UNCONNECTED(31 downto 0),
      m_axis_event_tlast => NLW_top_switch_raw_m_axis_event_tlast_UNCONNECTED,
      m_axis_event_tvalid => NLW_top_switch_raw_m_axis_event_tvalid_UNCONNECTED,
      m_axis_tdata(63 downto 0) => top_switch_raw_m_axis_TDATA(63 downto 0),
      m_axis_tlast => top_switch_raw_m_axis_TLAST,
      m_axis_tready => top_switch_raw_m_axis_TREADY,
      m_axis_tvalid => top_switch_raw_m_axis_TVALID,
      s_axis_0_tdata(63 downto 0) => axis_data_fifo_fc_L9_M_AXIS_TDATA(63 downto 0),
      s_axis_0_tlast => axis_data_fifo_fc_L9_M_AXIS_TLAST,
      s_axis_0_tready => axis_data_fifo_fc_L9_M_AXIS_TREADY,
      s_axis_0_tvalid => axis_data_fifo_fc_L9_M_AXIS_TVALID,
      s_axis_1_tdata(63 downto 0) => axis_data_fifo_fc_L12_M_AXIS_TDATA(63 downto 0),
      s_axis_1_tlast => axis_data_fifo_fc_L12_M_AXIS_TLAST,
      s_axis_1_tready => axis_data_fifo_fc_L12_M_AXIS_TREADY,
      s_axis_1_tvalid => axis_data_fifo_fc_L12_M_AXIS_TVALID,
      s_axis_2_tdata(63 downto 0) => axis_data_fifo_fc_L10_M_AXIS_TDATA(63 downto 0),
      s_axis_2_tlast => axis_data_fifo_fc_L10_M_AXIS_TLAST,
      s_axis_2_tready => axis_data_fifo_fc_L10_M_AXIS_TREADY,
      s_axis_2_tvalid => axis_data_fifo_fc_L10_M_AXIS_TVALID,
      s_axis_3_tdata(63 downto 0) => axis_data_fifo_fc_L11_M_AXIS_TDATA(63 downto 0),
      s_axis_3_tlast => axis_data_fifo_fc_L11_M_AXIS_TLAST,
      s_axis_3_tready => axis_data_fifo_fc_L11_M_AXIS_TREADY,
      s_axis_3_tvalid => axis_data_fifo_fc_L11_M_AXIS_TVALID,
      s_axis_4_tdata(63 downto 0) => axis_data_fifo_fc_L13_M_AXIS_TDATA(63 downto 0),
      s_axis_4_tlast => axis_data_fifo_fc_L13_M_AXIS_TLAST,
      s_axis_4_tready => axis_data_fifo_fc_L13_M_AXIS_TREADY,
      s_axis_4_tvalid => axis_data_fifo_fc_L13_M_AXIS_TVALID,
      s_axis_5_tdata(63 downto 0) => axis_data_fifo_fc_L14_M_AXIS_TDATA(63 downto 0),
      s_axis_5_tlast => axis_data_fifo_fc_L14_M_AXIS_TLAST,
      s_axis_5_tready => axis_data_fifo_fc_L14_M_AXIS_TREADY,
      s_axis_5_tvalid => axis_data_fifo_fc_L14_M_AXIS_TVALID,
      s_axis_aclk => processing_system7_0_FCLK_CLK1,
      s_axis_aresetn => rst_processing_system7_0_200M_peripheral_aresetn(0),
      trig_tst => '0'
    );
util_vector_logic_0: component design_1_util_vector_logic_0_0
     port map (
      Op1(0) => axis_flow_control_d1_0_trig_led,
      Op2(0) => axis_flow_control_L2_trig_led,
      Res(0) => util_vector_logic_0_Res(0)
    );
xlconcat_0: component design_1_xlconcat_0_0
     port map (
      In0(0) => clk_wiz_0_locked,
      In1(0) => clk_wiz_3_locked,
      In2(0) => clk_wiz_2_locked,
      In3(12 downto 0) => B"0000000000000",
      In4(13 downto 0) => B"00000000000000",
      In5(1 downto 0) => B"00",
      dout(31 downto 0) => xlconcat_0_dout(31 downto 0)
    );
xlconcat_1: component design_1_xlconcat_1_0
     port map (
      In0(0) => axi_dma_L1_s2mm_introut,
      In1(0) => axi_dma_L2_s2mm_introut,
      In2(0) => hv_hk_v1_0_0_intr_out,
      In3(0) => axi_dma_raw_s2mm_introut,
      dout(3 downto 0) => xlconcat_1_dout(3 downto 0)
    );
xlslice_0: component design_1_xlslice_0_0
     port map (
      Din(31 downto 0) => l2_trigger_0_trig_data(31 downto 0),
      Dout(0) => xlslice_0_Dout(0)
    );
end STRUCTURE;
