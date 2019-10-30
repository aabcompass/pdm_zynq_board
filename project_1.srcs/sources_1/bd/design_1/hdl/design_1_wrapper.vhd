--Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
--Date        : Tue Oct 29 18:33:24 2019
--Host        : alx-hp-envy-notebook running 64-bit Ubuntu 16.04.6 LTS
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
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
    artx_initb_io_tri_io : inout STD_LOGIC;
    artx_programb_io_tri_io : inout STD_LOGIC;
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
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    artx_initb_io_tri_o : out STD_LOGIC;
    artx_initb_io_tri_t : out STD_LOGIC;
    artx_initb_io_tri_i : in STD_LOGIC;
    artx_programb_io_tri_o : out STD_LOGIC;
    artx_programb_io_tri_t : out STD_LOGIC;
    artx_programb_io_tri_i : in STD_LOGIC;
    clk_art_1_clk_n : in STD_LOGIC;
    clk_art_1_clk_p : in STD_LOGIC;
    clk_art_0_clk_n : in STD_LOGIC;
    clk_art_0_clk_p : in STD_LOGIC;
    clk_art_2_clk_n : in STD_LOGIC;
    clk_art_2_clk_p : in STD_LOGIC;
    artx_done : in STD_LOGIC;
    artx_conf_data : out STD_LOGIC;
    artx_conf_cclk : out STD_LOGIC;
    frame_art1 : in STD_LOGIC;
    data_art1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    sr_ck_pc : out STD_LOGIC;
    sr_ck_pc_art : out STD_LOGIC;
    sr_rstb_pc : out STD_LOGIC;
    select_sc_probe_pc : out STD_LOGIC;
    resetb_pc : out STD_LOGIC;
    select_din_pc : out STD_LOGIC;
    loadb_sc_pc : out STD_LOGIC;
    sr_in_pc : out STD_LOGIC_VECTOR ( 5 downto 0 );
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
    frame_art0 : in STD_LOGIC;
    frame_art2 : in STD_LOGIC;
    data_art0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    data_art2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    user_led : out STD_LOGIC_VECTOR ( 0 to 0 );
    trig_L2_4led : out STD_LOGIC;
    trig_ext_in : in STD_LOGIC;
    trig_L1_4led : out STD_LOGIC;
    trig_out : out STD_LOGIC;
    i_RX_Serial : in STD_LOGIC;
    pps_signal : in STD_LOGIC;
    GTU_HV_p : out STD_LOGIC;
    GTU_HV_n : out STD_LOGIC;
    CLK_HV_p : out STD_LOGIC;
    CLK_HV_n : out STD_LOGIC;
    DATA_HV_p : out STD_LOGIC;
    DATA_HV_n : out STD_LOGIC
  );
  end component design_1;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal artx_initb_io_tri_i : STD_LOGIC;
  signal artx_initb_io_tri_o : STD_LOGIC;
  signal artx_initb_io_tri_t : STD_LOGIC;
  signal artx_programb_io_tri_i : STD_LOGIC;
  signal artx_programb_io_tri_o : STD_LOGIC;
  signal artx_programb_io_tri_t : STD_LOGIC;
begin
artx_initb_io_tri_iobuf: component IOBUF
     port map (
      I => artx_initb_io_tri_o,
      IO => artx_initb_io_tri_io,
      O => artx_initb_io_tri_i,
      T => artx_initb_io_tri_t
    );
artx_programb_io_tri_iobuf: component IOBUF
     port map (
      I => artx_programb_io_tri_o,
      IO => artx_programb_io_tri_io,
      O => artx_programb_io_tri_i,
      T => artx_programb_io_tri_t
    );
design_1_i: component design_1
     port map (
      CLK_HV_n => CLK_HV_n,
      CLK_HV_p => CLK_HV_p,
      DATA_HV_n => DATA_HV_n,
      DATA_HV_p => DATA_HV_p,
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      GTU_HV_n => GTU_HV_n,
      GTU_HV_p => GTU_HV_p,
      artx_conf_cclk => artx_conf_cclk,
      artx_conf_data => artx_conf_data,
      artx_done => artx_done,
      artx_initb_io_tri_i => artx_initb_io_tri_i,
      artx_initb_io_tri_o => artx_initb_io_tri_o,
      artx_initb_io_tri_t => artx_initb_io_tri_t,
      artx_programb_io_tri_i => artx_programb_io_tri_i,
      artx_programb_io_tri_o => artx_programb_io_tri_o,
      artx_programb_io_tri_t => artx_programb_io_tri_t,
      clk_art_0_clk_n => clk_art_0_clk_n,
      clk_art_0_clk_p => clk_art_0_clk_p,
      clk_art_1_clk_n => clk_art_1_clk_n,
      clk_art_1_clk_p => clk_art_1_clk_p,
      clk_art_2_clk_n => clk_art_2_clk_n,
      clk_art_2_clk_p => clk_art_2_clk_p,
      cs_dac_n => cs_dac_n,
      cs_dac_p => cs_dac_p,
      cs_exp_n => cs_exp_n,
      cs_exp_p => cs_exp_p,
      data_art0(15 downto 0) => data_art0(15 downto 0),
      data_art1(15 downto 0) => data_art1(15 downto 0),
      data_art2(15 downto 0) => data_art2(15 downto 0),
      frame_art0 => frame_art0,
      frame_art1 => frame_art1,
      frame_art2 => frame_art2,
      i_RX_Serial => i_RX_Serial,
      intr_n => intr_n,
      intr_p => intr_p,
      loadb_sc_pc => loadb_sc_pc,
      miso_n => miso_n,
      miso_p => miso_p,
      mosi_n => mosi_n,
      mosi_p => mosi_p,
      pps_signal => pps_signal,
      resetb_pc => resetb_pc,
      sck_n => sck_n,
      sck_p => sck_p,
      select_din_pc => select_din_pc,
      select_sc_probe_pc => select_sc_probe_pc,
      sr_ck_pc => sr_ck_pc,
      sr_ck_pc_art => sr_ck_pc_art,
      sr_in_pc(5 downto 0) => sr_in_pc(5 downto 0),
      sr_rstb_pc => sr_rstb_pc,
      trig_L1_4led => trig_L1_4led,
      trig_L2_4led => trig_L2_4led,
      trig_ext_in => trig_ext_in,
      trig_out => trig_out,
      user_led(0) => user_led(0)
    );
end STRUCTURE;
