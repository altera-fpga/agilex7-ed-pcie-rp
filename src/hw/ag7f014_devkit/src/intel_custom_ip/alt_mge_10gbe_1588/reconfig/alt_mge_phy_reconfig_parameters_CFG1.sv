// (C) 2001-2019 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.

package alt_mge_phy_reconfig_parameters_CFG1;

localparam ram_depth = 77;
function [26:0] get_ram_data;
  input integer index;
  automatic reg [0:76][26:0] ram_data = {
    27'h0060702, // [26:16]-DPRIO address=0x006; [15:8]-bit mask=0x07; [2:0]-hssi_tx_pcs_pma_interface_tx_pma_data_sel=eight_g_pcs(3'h2);
    27'h00A0301, // [26:16]-DPRIO address=0x00A; [15:8]-bit mask=0x03; [1:0]-hssi_rx_pcs_pma_interface_block_sel=eight_g_pcs(2'h1);
    27'h0220F00, // [26:16]-DPRIO address=0x022; [15:8]-bit mask=0x0F; [3:2]-hssi_tx_pld_pcs_interface_pcs_tx_clk_source=eightg(2'h0); [1:0]-hssi_tx_pld_pcs_interface_pcs_tx_clk_out_sel=eightg_clk_out(2'h0);
    27'h024C300, // [26:16]-DPRIO address=0x024; [15:8]-bit mask=0xC3; [7:6]-hssi_rx_pld_pcs_interface_pcs_rx_clk_out_sel=eightg_clk_out(2'h0); [1:0]-hssi_rx_pld_pcs_interface_pcs_rx_block_sel=eightg(2'h0);
    27'h02D6020, // [26:16]-DPRIO address=0x02D; [15:8]-bit mask=0x60; [6:5]-hssi_8g_tx_pcs_byte_serializer=en_bs_by_2(2'h1);
    27'h02E0100, // [26:16]-DPRIO address=0x02E; [15:8]-bit mask=0x01; [0:0]-hssi_8g_tx_pcs_clock_gate_bs_enc=dis_bs_enc_clk_gating(1'h0);
    27'h0300800, // [26:16]-DPRIO address=0x030; [15:8]-bit mask=0x08; [3:3]-hssi_8g_tx_pcs_clock_gate_fiford=dis_fiford_clk_gating(1'h0);
    27'h0330700, // [26:16]-DPRIO address=0x033; [15:8]-bit mask=0x07; [2:0]-hssi_8g_rx_pcs_wa_pd=wa_pd_7(3'h0);
    27'h038FF7C, // [26:16]-DPRIO address=0x038; [15:8]-bit mask=0xFF; [7:0]-hssi_8g_rx_pcs_wa_pd_data=124(8'h7C);
    27'h03A1800, // [26:16]-DPRIO address=0x03A; [15:8]-bit mask=0x18; [4:3]-hssi_8g_rx_pcs_wa_rosnumber_data=0(2'h0);
    27'h044E040, // [26:16]-DPRIO address=0x044; [15:8]-bit mask=0xE0; [7:5]-hssi_8g_rx_pcs_byte_deserializer=en_bds_by_2(3'h2);
    27'h0481C14, // [26:16]-DPRIO address=0x048; [15:8]-bit mask=0x1C; [4:2]-hssi_8g_rx_pcs_test_bus_sel=pcie_ctrl_testbus(3'h5);
    27'h04D0500, // [26:16]-DPRIO address=0x04D; [15:8]-bit mask=0x05; [2:2]-hssi_8g_rx_pcs_clock_gate_sw_pc_wrclk=dis_sw_pc_wrclk_gating(1'h0); [0:0]-hssi_8g_rx_pcs_clock_gate_pc_rdclk=dis_pc_rdclk_gating(1'h0);
    27'h051C000, // [26:16]-DPRIO address=0x051; [15:8]-bit mask=0xC0; [7:7]-hssi_8g_rx_pcs_clock_gate_bds_dec_asn=dis_bds_dec_asn_clk_gating(1'h0); [6:6]-hssi_8g_rx_pcs_clock_gate_sw_wa=dis_sw_wa_clk_gating(1'h0);
    27'h0700E0E, // [26:16]-DPRIO address=0x070; [15:8]-bit mask=0x0E; [3:3]-hssi_10g_tx_pcs_scrm_bypass=scrm_bypass_en(1'h1); [2:2]-hssi_10g_tx_pcs_tx_sm_bypass=tx_sm_bypass_en(1'h1); [1:1]-hssi_10g_tx_pcs_enc_64b66b_txsm_bypass=enc_64b66b_txsm_bypass_en(1'h1);
    27'h0863100, // [26:16]-DPRIO address=0x086; [15:8]-bit mask=0x31; [5:5]-hssi_10g_tx_pcs_enc64b66b_txsm_clken=enc64b66b_txsm_clk_dis(1'h0); [4:4]-hssi_10g_tx_pcs_scrm_clken=scrm_clk_dis(1'h0); [0:0]-hssi_10g_tx_pcs_gbred_clken=gbred_clk_dis(1'h0);
    27'h0870700, // [26:16]-DPRIO address=0x087; [15:8]-bit mask=0x07; [2:2]-hssi_10g_tx_pcs_ctrl_bit_reverse=ctrl_bit_reverse_dis(1'h0); [1:1]-hssi_10g_tx_pcs_wrfifo_clken=wrfifo_clk_dis(1'h0); [0:0]-hssi_10g_tx_pcs_rdfifo_clken=rdfifo_clk_dis(1'h0);
    27'h0881F15, // [26:16]-DPRIO address=0x088; [15:8]-bit mask=0x1F; [4:3]-hssi_10g_tx_pcs_gb_tx_odwidth=odwidth_64(2'h2); [2:0]-hssi_10g_tx_pcs_gb_tx_idwidth=idwidth_64(3'h5);
    27'h0892000, // [26:16]-DPRIO address=0x089; [15:8]-bit mask=0x20; [5:5]-hssi_10g_tx_pcs_sh_err=sh_err_dis(1'h0);
    27'h08D0404, // [26:16]-DPRIO address=0x08D; [15:8]-bit mask=0x04; [2:2]-hssi_10g_tx_pcs_fastpath=fastpath_en(1'h1);
    27'h0900202, // [26:16]-DPRIO address=0x090; [15:8]-bit mask=0x02; [1:1]-hssi_10g_tx_pcs_tx_sh_location=msb(1'h1);
    27'h096CE4E, // [26:16]-DPRIO address=0x096; [15:8]-bit mask=0xCE; [7:7]-hssi_10g_rx_pcs_clr_errblk_cnt_en=disable(1'h0); [6:6]-hssi_10g_rx_pcs_blksync_bypass=blksync_bypass_en(1'h1); [3:3]-hssi_10g_rx_pcs_descrm_bypass=descrm_bypass_en(1'h1); [2:2]-hssi_10g_rx_pcs_rx_sm_bypass=rx_sm_bypass_en(1'h1); [1:1]-hssi_10g_rx_pcs_dec_64b66b_rxsm_bypass=dec_64b66b_rxsm_bypass_en(1'h1);
    27'h0A01F15, // [26:16]-DPRIO address=0x0A0; [15:8]-bit mask=0x1F; [4:3]-hssi_10g_rx_pcs_gb_rx_idwidth=idwidth_64(2'h2); [2:0]-hssi_10g_rx_pcs_gb_rx_odwidth=odwidth_64(3'h5);
    27'h0A2BB00, // [26:16]-DPRIO address=0x0A2; [15:8]-bit mask=0xBB; [7:7]-hssi_10g_rx_pcs_descrm_clken=descrm_clk_dis(1'h0); [5:5]-hssi_10g_rx_pcs_dec64b66b_clken=dec64b66b_clk_dis(1'h0); [4:4]-hssi_10g_rx_pcs_ber_clken=ber_clk_dis(1'h0); [3:3]-hssi_10g_rx_pcs_rand_clken=rand_clk_dis(1'h0); [1:1]-hssi_10g_rx_pcs_wrfifo_clken=wrfifo_clk_dis(1'h0); [0:0]-hssi_10g_rx_pcs_rdfifo_clken=rdfifo_clk_dis(1'h0);
    27'h0A30A00, // [26:16]-DPRIO address=0x0A3; [15:8]-bit mask=0x0A; [3:3]-hssi_10g_rx_pcs_gbexp_clken=gbexp_clk_dis(1'h0); [1:1]-hssi_10g_rx_pcs_blksync_clken=blksync_clk_dis(1'h0);
    27'h0A98080, // [26:16]-DPRIO address=0x0A9; [15:8]-bit mask=0x80; [7:7]-hssi_10g_rx_pcs_fast_path=fast_path_en(1'h1);
    27'h0AC0200, // [26:16]-DPRIO address=0x0AC; [15:8]-bit mask=0x02; [1:1]-hssi_10g_rx_pcs_ctrl_bit_reverse=ctrl_bit_reverse_dis(1'h0);
    27'h0B00202, // [26:16]-DPRIO address=0x0B0; [15:8]-bit mask=0x02; [1:1]-hssi_10g_rx_pcs_rx_sh_location=msb(1'h1);
    27'h0C50100, // [26:16]-DPRIO address=0x0C5; [15:8]-bit mask=0x01; [0:0]-hssi_fifo_tx_pcs_prot_mode=non_teng_mode(1'h0);
    27'h0C70100, // [26:16]-DPRIO address=0x0C7; [15:8]-bit mask=0x01; [0:0]-hssi_fifo_rx_pcs_prot_mode=non_teng_mode(1'h0);
    27'h10C0704, // [26:16]-DPRIO address=0x10C; [15:8]-bit mask=0x07; [2:0]-pma_tx_buf_slew_rate_ctrl=slew_r4(3'h4);
    27'h1100704, // [26:16]-DPRIO address=0x110; [15:8]-bit mask=0x07; [2:0]-pma_cgb_ser_mode=ten_bit(3'h4);
    27'h11F3000, // [26:16]-DPRIO address=0x11F; [15:8]-bit mask=0x30; [5:4]-pma_rx_buf_eq_bw_sel=eq_bw_0(2'h0);
    27'h12E3000, // [26:16]-DPRIO address=0x12E; [15:8]-bit mask=0x30; [5:4]-pma_rx_buf_ctle_tia_isel=ib_tia_bw0(2'h0);
    27'h130C0C0, // [26:16]-DPRIO address=0x130; [15:8]-bit mask=0xC0; [7:6]-pma_rx_dfe_tapsum_bw_sel=tapsum_lowbw(2'h3);
    27'h1320F03, // [26:16]-DPRIO address=0x132; [15:8]-bit mask=0x0F; [3:0]-cdr_pll_set_cdr_vco_speed_fix=56(4'h3);
    27'h133E080, // [26:16]-DPRIO address=0x133; [15:8]-bit mask=0xE0; [7:5]-cdr_pll_chgpmp_current_up_pd=cp_current_pd_up_setting4(3'h4);
    27'h1350F0F, // [26:16]-DPRIO address=0x135; [15:8]-bit mask=0x0F; [3:2]-cdr_pll_lf_resistor_pd=lf_pd_setting3(2'h3); [1:0]-cdr_pll_lf_resistor_pfd=lf_pfd_setting3(2'h3);
    27'h1360F08, // [26:16]-DPRIO address=0x136; [15:8]-bit mask=0x0F; [3:0]-cdr_pll_set_cdr_vco_speed_fix=56(4'h8);
    27'h1373C0C, // [26:16]-DPRIO address=0x137; [15:8]-bit mask=0x3C; [5:2]-cdr_pll_set_cdr_vco_speed=3(4'h3);
    27'h1393F21, // [26:16]-DPRIO address=0x139; [15:8]-bit mask=0x3F; [5:3]-cdr_pll_chgpmp_current_dn_pd=cp_current_pd_dn_setting4(3'h4); [2:0]-cdr_pll_chgpmp_current_pfd=cp_current_pfd_setting1(3'h1);
    27'h13AFF23, // [26:16]-DPRIO address=0x13A; [15:8]-bit mask=0xFF; [7:6]-cdr_pll_fref_clklow_div=1(2'h0); [5:3]-cdr_pll_pd_l_counter=4(3'h4); [2:0]-cdr_pll_pfd_l_counter=2(3'h3);
    27'h13BFF19, // [26:16]-DPRIO address=0x13B; [15:8]-bit mask=0xFF; [7:0]-cdr_pll_mcnt_div=25(8'h19);
    27'h13C0C00, // [26:16]-DPRIO address=0x13C; [15:8]-bit mask=0x0C; [3:2]-cdr_pll_ncnt_div=1(2'h0);
    27'h13F0F01, // [26:16]-DPRIO address=0x13F; [15:8]-bit mask=0x0F; [3:0]-pma_rx_deser_deser_factor=deser_10b(4'h1);
    27'h1400702, // [26:16]-DPRIO address=0x140; [15:8]-bit mask=0x07; [2:0]-pma_rx_deser_clkdivrx_user_mode=clkdivrx_user_clkdiv(3'h2);
    27'h1480404, // [26:16]-DPRIO address=0x148; [15:8]-bit mask=0x04; [2:2]-pma_rx_buf_eq_cdgen_sel=eq_cdgen_3(1'h1);
    27'h159FF1E, // [26:16]-DPRIO address=0x159; [15:8]-bit mask=0xFF; [7:0]-cdr_pll_set_cdr_input_freq_range=30(8'h1E);
    27'h1648080, // [26:16]-DPRIO address=0x164; [15:8]-bit mask=0x80; [7:7]-pma_rx_deser_deser_aibck_x1=clk1x_over_ride(1'h1);
    27'h1721000, // [26:16]-DPRIO address=0x172; [15:8]-bit mask=0x10; [4:4]-pma_rx_buf_eq_isel=eq_isel_0(1'h0);
    27'h1790202, // [26:16]-DPRIO address=0x179; [15:8]-bit mask=0x02; [1:1]-pma_rx_odi_xrx_path_x119_rx_path_rstn_overrideb=use_sequencer(1'h1);
    27'h2001F00, // [26:16]-DPRIO address=0x200; [15:8]-bit mask=0x1F; [4:0]-hssi_adapt_tx_datapath_mapping_mode=map_8g_1x1xfifo(5'h0);
    27'h2031F07, // [26:16]-DPRIO address=0x203; [15:8]-bit mask=0x1F; [4:0]-hssi_adapt_tx_txfifo_full=full_sw(5'h7);
    27'h2040100, // [26:16]-DPRIO address=0x204; [15:8]-bit mask=0x01; [0:0]-hssi_adapt_tx_fifo_double_read=fifo_double_read_dis(1'h0);
    27'h2080702, // [26:16]-DPRIO address=0x208; [15:8]-bit mask=0x07; [2:1]-hssi_adapt_tx_tx_fifo_power_mode=full_width_half_depth(2'h1); [0:0]-hssi_adapt_tx_word_align=wa_dis(1'h0);
    27'h20C1810, // [26:16]-DPRIO address=0x20C; [15:8]-bit mask=0x18; [4:3]-hssi_adapt_tx_aib_clk_sel=aib_clk_pld_pcs_tx_clk_out(2'h2);
    27'h2101F00, // [26:16]-DPRIO address=0x210; [15:8]-bit mask=0x1F; [4:0]-hssi_adapt_rx_datapath_mapping_mode=map_8g_1x1xfifo(5'h0);
    27'h2128000, // [26:16]-DPRIO address=0x212; [15:8]-bit mask=0x80; [7:7]-hssi_adapt_rx_word_mark=wm_dis(1'h0);
    27'h213FF47, // [26:16]-DPRIO address=0x213; [15:8]-bit mask=0xFF; [7:5]-hssi_adapt_rx_phcomp_rd_del=phcomp_rd_del2(3'h2); [4:0]-hssi_adapt_rx_rxfifo_full=full_sw(5'h7);
    27'h2140100, // [26:16]-DPRIO address=0x214; [15:8]-bit mask=0x01; [0:0]-hssi_adapt_rx_fifo_double_write=fifo_double_write_dis(1'h0);
    27'h218C040, // [26:16]-DPRIO address=0x218; [15:8]-bit mask=0xC0; [7:6]-hssi_adapt_rx_rx_fifo_power_mode=full_width_half_depth(2'h1);
    27'h2231C0C, // [26:16]-DPRIO address=0x223; [15:8]-bit mask=0x1C; [4:2]-hssi_adapt_rx_fifo_rd_clk_sel=fifo_rd_pld_pcs_rx_clk_out(3'h3);
    27'h22E0404, // [26:16]-DPRIO address=0x22E; [15:8]-bit mask=0x04; [2:2]-hssi_aibcr_tx_aib_dllstr_align_dy_ctlsel=aib_dllstr_align_dy_ctlsel_setting1(1'h1);
    27'h2301800, // [26:16]-DPRIO address=0x230; [15:8]-bit mask=0x18; [4:4]-hssi_aibcr_rx_aib_rx_dcc_en=aib_rx_dcc_disable(1'h0); [3:3]-hssi_aibcr_rx_aib_rx_dcc_byp=aib_rx_dcc_byp_enable(1'h0);
    27'h301FF47, // [26:16]-DPRIO address=0x301; [15:8]-bit mask=0xFF; [7:5]-hssi_pldadapt_tx_phcomp_rd_del=phcomp_rd_del2(3'h2); [4:0]-hssi_pldadapt_tx_txfifo_full=full_pc_sw(5'h7);
    27'h303FF25, // [26:16]-DPRIO address=0x303; [15:8]-bit mask=0xFF; [7:5]-hssi_pldadapt_tx_tx_fifo_power_mode=full_width_ps_sw(3'h1); [4:0]-hssi_pldadapt_tx_txfifo_pfull=5(5'h5);
    27'h306BE08, // [26:16]-DPRIO address=0x306; [15:8]-bit mask=0xBE; [7:7]-hssi_pldadapt_tx_fifo_double_write=fifo_double_write_dis(1'h0); [5:4]-hssi_pldadapt_tx_gb_tx_odwidth=odwidth_32(2'h0); [3:1]-hssi_pldadapt_tx_gb_tx_idwidth=idwidth_32(3'h4);
    27'h3092000, // [26:16]-DPRIO address=0x309; [15:8]-bit mask=0x20; [5:5]-hssi_pldadapt_tx_word_mark=wm_dis(1'h0);
    27'h3100701, // [26:16]-DPRIO address=0x310; [15:8]-bit mask=0x07; [2:0]-hssi_pldadapt_tx_stretch_num_stages=one_stage(3'h1);
    27'h3113F00, // [26:16]-DPRIO address=0x311; [15:8]-bit mask=0x3F; [5:0]-hssi_pldadapt_rx_rxfifo_empty=empty_sw(6'h0);
    27'h3127F07, // [26:16]-DPRIO address=0x312; [15:8]-bit mask=0x7F; [6:6]-hssi_pldadapt_rx_fifo_double_read=fifo_double_read_dis(1'h0); [5:0]-hssi_pldadapt_rx_rxfifo_full=full_pc_sw(6'h7);
    27'h3143F05, // [26:16]-DPRIO address=0x314; [15:8]-bit mask=0x3F; [5:0]-hssi_pldadapt_rx_rxfifo_pfull=5(6'h5);
    27'h3180100, // [26:16]-DPRIO address=0x318; [15:8]-bit mask=0x01; [0:0]-hssi_pldadapt_rx_word_align=wa_dis(1'h0);
    27'h31A1C04, // [26:16]-DPRIO address=0x31A; [15:8]-bit mask=0x1C; [4:2]-hssi_pldadapt_rx_rx_fifo_power_mode=full_width_ps_sw(3'h1);
    27'h3200701, // [26:16]-DPRIO address=0x320; [15:8]-bit mask=0x07; [2:0]-hssi_pldadapt_rx_stretch_num_stages=one_stage(3'h1);
    27'h32C0404, // [26:16]-DPRIO address=0x32C; [15:8]-bit mask=0x04; [2:2]-hssi_aibnd_rx_aib_dllstr_align_dy_ctlsel=aib_dllstr_align_dy_ctlsel_setting1(1'h1);
    27'h32E1800  // [26:16]-DPRIO address=0x32E; [15:8]-bit mask=0x18; [4:4]-hssi_aibnd_tx_aib_tx_dcc_en=aib_tx_dcc_disable(1'h0); [3:3]-hssi_aibnd_tx_aib_tx_dcc_byp=aib_tx_dcc_byp_enable(1'h0);
};

  begin
  get_ram_data = ram_data[index];
  end
endfunction

localparam PLL_SELECT_VALUE = 0;

localparam CDR_REFCLK_SELECT_VALUE = 0;

localparam HSSI_10G_RX_PCS_BER_CLKEN_VALUE = "ber_clk_dis";
localparam HSSI_10G_RX_PCS_BER_CLKEN_ADDR_OFST = 162;
localparam HSSI_10G_RX_PCS_BER_CLKEN_ADDR_FIELD_OFST = 4;
localparam HSSI_10G_RX_PCS_BER_CLKEN_ADDR_FIELD_HIGH = 4;
localparam HSSI_10G_RX_PCS_BER_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_BER_CLKEN_ADDR_FIELD_BITMASK = 32'h00000010;
localparam HSSI_10G_RX_PCS_BER_CLKEN_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_RX_PCS_BER_CLKEN_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_RX_PCS_BLKSYNC_BYPASS_VALUE = "blksync_bypass_en";
localparam HSSI_10G_RX_PCS_BLKSYNC_BYPASS_ADDR_OFST = 150;
localparam HSSI_10G_RX_PCS_BLKSYNC_BYPASS_ADDR_FIELD_OFST = 6;
localparam HSSI_10G_RX_PCS_BLKSYNC_BYPASS_ADDR_FIELD_HIGH = 6;
localparam HSSI_10G_RX_PCS_BLKSYNC_BYPASS_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_BLKSYNC_BYPASS_ADDR_FIELD_BITMASK = 32'h00000040;
localparam HSSI_10G_RX_PCS_BLKSYNC_BYPASS_ADDR_FIELD_VALMASK = 32'h00000040;
localparam HSSI_10G_RX_PCS_BLKSYNC_BYPASS_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_RX_PCS_BLKSYNC_CLKEN_VALUE = "blksync_clk_dis";
localparam HSSI_10G_RX_PCS_BLKSYNC_CLKEN_ADDR_OFST = 163;
localparam HSSI_10G_RX_PCS_BLKSYNC_CLKEN_ADDR_FIELD_OFST = 1;
localparam HSSI_10G_RX_PCS_BLKSYNC_CLKEN_ADDR_FIELD_HIGH = 1;
localparam HSSI_10G_RX_PCS_BLKSYNC_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_BLKSYNC_CLKEN_ADDR_FIELD_BITMASK = 32'h00000002;
localparam HSSI_10G_RX_PCS_BLKSYNC_CLKEN_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_RX_PCS_BLKSYNC_CLKEN_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_RX_PCS_CLR_ERRBLK_CNT_EN_VALUE = "disable";
localparam HSSI_10G_RX_PCS_CLR_ERRBLK_CNT_EN_ADDR_OFST = 150;
localparam HSSI_10G_RX_PCS_CLR_ERRBLK_CNT_EN_ADDR_FIELD_OFST = 7;
localparam HSSI_10G_RX_PCS_CLR_ERRBLK_CNT_EN_ADDR_FIELD_HIGH = 7;
localparam HSSI_10G_RX_PCS_CLR_ERRBLK_CNT_EN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_CLR_ERRBLK_CNT_EN_ADDR_FIELD_BITMASK = 32'h00000080;
localparam HSSI_10G_RX_PCS_CLR_ERRBLK_CNT_EN_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_RX_PCS_CLR_ERRBLK_CNT_EN_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_RX_PCS_CTRL_BIT_REVERSE_VALUE = "ctrl_bit_reverse_dis";
localparam HSSI_10G_RX_PCS_CTRL_BIT_REVERSE_ADDR_OFST = 172;
localparam HSSI_10G_RX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_OFST = 1;
localparam HSSI_10G_RX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_HIGH = 1;
localparam HSSI_10G_RX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_BITMASK = 32'h00000002;
localparam HSSI_10G_RX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_RX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_RX_PCS_DEC64B66B_CLKEN_VALUE = "dec64b66b_clk_dis";
localparam HSSI_10G_RX_PCS_DEC64B66B_CLKEN_ADDR_OFST = 162;
localparam HSSI_10G_RX_PCS_DEC64B66B_CLKEN_ADDR_FIELD_OFST = 5;
localparam HSSI_10G_RX_PCS_DEC64B66B_CLKEN_ADDR_FIELD_HIGH = 5;
localparam HSSI_10G_RX_PCS_DEC64B66B_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_DEC64B66B_CLKEN_ADDR_FIELD_BITMASK = 32'h00000020;
localparam HSSI_10G_RX_PCS_DEC64B66B_CLKEN_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_RX_PCS_DEC64B66B_CLKEN_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_RX_PCS_DEC_64B66B_RXSM_BYPASS_VALUE = "dec_64b66b_rxsm_bypass_en";
localparam HSSI_10G_RX_PCS_DEC_64B66B_RXSM_BYPASS_ADDR_OFST = 150;
localparam HSSI_10G_RX_PCS_DEC_64B66B_RXSM_BYPASS_ADDR_FIELD_OFST = 1;
localparam HSSI_10G_RX_PCS_DEC_64B66B_RXSM_BYPASS_ADDR_FIELD_HIGH = 1;
localparam HSSI_10G_RX_PCS_DEC_64B66B_RXSM_BYPASS_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_DEC_64B66B_RXSM_BYPASS_ADDR_FIELD_BITMASK = 32'h00000002;
localparam HSSI_10G_RX_PCS_DEC_64B66B_RXSM_BYPASS_ADDR_FIELD_VALMASK = 32'h00000002;
localparam HSSI_10G_RX_PCS_DEC_64B66B_RXSM_BYPASS_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_RX_PCS_DESCRM_BYPASS_VALUE = "descrm_bypass_en";
localparam HSSI_10G_RX_PCS_DESCRM_BYPASS_ADDR_OFST = 150;
localparam HSSI_10G_RX_PCS_DESCRM_BYPASS_ADDR_FIELD_OFST = 3;
localparam HSSI_10G_RX_PCS_DESCRM_BYPASS_ADDR_FIELD_HIGH = 3;
localparam HSSI_10G_RX_PCS_DESCRM_BYPASS_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_DESCRM_BYPASS_ADDR_FIELD_BITMASK = 32'h00000008;
localparam HSSI_10G_RX_PCS_DESCRM_BYPASS_ADDR_FIELD_VALMASK = 32'h00000008;
localparam HSSI_10G_RX_PCS_DESCRM_BYPASS_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_RX_PCS_DESCRM_CLKEN_VALUE = "descrm_clk_dis";
localparam HSSI_10G_RX_PCS_DESCRM_CLKEN_ADDR_OFST = 162;
localparam HSSI_10G_RX_PCS_DESCRM_CLKEN_ADDR_FIELD_OFST = 7;
localparam HSSI_10G_RX_PCS_DESCRM_CLKEN_ADDR_FIELD_HIGH = 7;
localparam HSSI_10G_RX_PCS_DESCRM_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_DESCRM_CLKEN_ADDR_FIELD_BITMASK = 32'h00000080;
localparam HSSI_10G_RX_PCS_DESCRM_CLKEN_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_RX_PCS_DESCRM_CLKEN_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_RX_PCS_FAST_PATH_VALUE = "fast_path_en";
localparam HSSI_10G_RX_PCS_FAST_PATH_ADDR_OFST = 169;
localparam HSSI_10G_RX_PCS_FAST_PATH_ADDR_FIELD_OFST = 7;
localparam HSSI_10G_RX_PCS_FAST_PATH_ADDR_FIELD_HIGH = 7;
localparam HSSI_10G_RX_PCS_FAST_PATH_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_FAST_PATH_ADDR_FIELD_BITMASK = 32'h00000080;
localparam HSSI_10G_RX_PCS_FAST_PATH_ADDR_FIELD_VALMASK = 32'h00000080;
localparam HSSI_10G_RX_PCS_FAST_PATH_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_RX_PCS_GB_RX_IDWIDTH_VALUE = "idwidth_64";
localparam HSSI_10G_RX_PCS_GB_RX_IDWIDTH_ADDR_OFST = 160;
localparam HSSI_10G_RX_PCS_GB_RX_IDWIDTH_ADDR_FIELD_OFST = 3;
localparam HSSI_10G_RX_PCS_GB_RX_IDWIDTH_ADDR_FIELD_HIGH = 4;
localparam HSSI_10G_RX_PCS_GB_RX_IDWIDTH_ADDR_FIELD_SIZE = 2;
localparam HSSI_10G_RX_PCS_GB_RX_IDWIDTH_ADDR_FIELD_BITMASK = 32'h00000018;
localparam HSSI_10G_RX_PCS_GB_RX_IDWIDTH_ADDR_FIELD_VALMASK = 32'h00000010;
localparam HSSI_10G_RX_PCS_GB_RX_IDWIDTH_ADDR_FIELD_VALUE = 2'h2;

localparam HSSI_10G_RX_PCS_GB_RX_ODWIDTH_VALUE = "odwidth_64";
localparam HSSI_10G_RX_PCS_GB_RX_ODWIDTH_ADDR_OFST = 160;
localparam HSSI_10G_RX_PCS_GB_RX_ODWIDTH_ADDR_FIELD_OFST = 0;
localparam HSSI_10G_RX_PCS_GB_RX_ODWIDTH_ADDR_FIELD_HIGH = 2;
localparam HSSI_10G_RX_PCS_GB_RX_ODWIDTH_ADDR_FIELD_SIZE = 3;
localparam HSSI_10G_RX_PCS_GB_RX_ODWIDTH_ADDR_FIELD_BITMASK = 32'h00000007;
localparam HSSI_10G_RX_PCS_GB_RX_ODWIDTH_ADDR_FIELD_VALMASK = 32'h00000005;
localparam HSSI_10G_RX_PCS_GB_RX_ODWIDTH_ADDR_FIELD_VALUE = 3'h5;

localparam HSSI_10G_RX_PCS_GBEXP_CLKEN_VALUE = "gbexp_clk_dis";
localparam HSSI_10G_RX_PCS_GBEXP_CLKEN_ADDR_OFST = 163;
localparam HSSI_10G_RX_PCS_GBEXP_CLKEN_ADDR_FIELD_OFST = 3;
localparam HSSI_10G_RX_PCS_GBEXP_CLKEN_ADDR_FIELD_HIGH = 3;
localparam HSSI_10G_RX_PCS_GBEXP_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_GBEXP_CLKEN_ADDR_FIELD_BITMASK = 32'h00000008;
localparam HSSI_10G_RX_PCS_GBEXP_CLKEN_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_RX_PCS_GBEXP_CLKEN_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_RX_PCS_PROT_MODE_VALUE = "disable_mode";

localparam HSSI_10G_RX_PCS_RAND_CLKEN_VALUE = "rand_clk_dis";
localparam HSSI_10G_RX_PCS_RAND_CLKEN_ADDR_OFST = 162;
localparam HSSI_10G_RX_PCS_RAND_CLKEN_ADDR_FIELD_OFST = 3;
localparam HSSI_10G_RX_PCS_RAND_CLKEN_ADDR_FIELD_HIGH = 3;
localparam HSSI_10G_RX_PCS_RAND_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_RAND_CLKEN_ADDR_FIELD_BITMASK = 32'h00000008;
localparam HSSI_10G_RX_PCS_RAND_CLKEN_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_RX_PCS_RAND_CLKEN_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_RX_PCS_RDFIFO_CLKEN_VALUE = "rdfifo_clk_dis";
localparam HSSI_10G_RX_PCS_RDFIFO_CLKEN_ADDR_OFST = 162;
localparam HSSI_10G_RX_PCS_RDFIFO_CLKEN_ADDR_FIELD_OFST = 0;
localparam HSSI_10G_RX_PCS_RDFIFO_CLKEN_ADDR_FIELD_HIGH = 0;
localparam HSSI_10G_RX_PCS_RDFIFO_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_RDFIFO_CLKEN_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_10G_RX_PCS_RDFIFO_CLKEN_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_RX_PCS_RDFIFO_CLKEN_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_RX_PCS_RX_SH_LOCATION_VALUE = "msb";
localparam HSSI_10G_RX_PCS_RX_SH_LOCATION_ADDR_OFST = 176;
localparam HSSI_10G_RX_PCS_RX_SH_LOCATION_ADDR_FIELD_OFST = 1;
localparam HSSI_10G_RX_PCS_RX_SH_LOCATION_ADDR_FIELD_HIGH = 1;
localparam HSSI_10G_RX_PCS_RX_SH_LOCATION_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_RX_SH_LOCATION_ADDR_FIELD_BITMASK = 32'h00000002;
localparam HSSI_10G_RX_PCS_RX_SH_LOCATION_ADDR_FIELD_VALMASK = 32'h00000002;
localparam HSSI_10G_RX_PCS_RX_SH_LOCATION_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_RX_PCS_RX_SM_BYPASS_VALUE = "rx_sm_bypass_en";
localparam HSSI_10G_RX_PCS_RX_SM_BYPASS_ADDR_OFST = 150;
localparam HSSI_10G_RX_PCS_RX_SM_BYPASS_ADDR_FIELD_OFST = 2;
localparam HSSI_10G_RX_PCS_RX_SM_BYPASS_ADDR_FIELD_HIGH = 2;
localparam HSSI_10G_RX_PCS_RX_SM_BYPASS_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_RX_SM_BYPASS_ADDR_FIELD_BITMASK = 32'h00000004;
localparam HSSI_10G_RX_PCS_RX_SM_BYPASS_ADDR_FIELD_VALMASK = 32'h00000004;
localparam HSSI_10G_RX_PCS_RX_SM_BYPASS_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_RX_PCS_WRFIFO_CLKEN_VALUE = "wrfifo_clk_dis";
localparam HSSI_10G_RX_PCS_WRFIFO_CLKEN_ADDR_OFST = 162;
localparam HSSI_10G_RX_PCS_WRFIFO_CLKEN_ADDR_FIELD_OFST = 1;
localparam HSSI_10G_RX_PCS_WRFIFO_CLKEN_ADDR_FIELD_HIGH = 1;
localparam HSSI_10G_RX_PCS_WRFIFO_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_WRFIFO_CLKEN_ADDR_FIELD_BITMASK = 32'h00000002;
localparam HSSI_10G_RX_PCS_WRFIFO_CLKEN_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_RX_PCS_WRFIFO_CLKEN_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_TX_PCS_CTRL_BIT_REVERSE_VALUE = "ctrl_bit_reverse_dis";
localparam HSSI_10G_TX_PCS_CTRL_BIT_REVERSE_ADDR_OFST = 135;
localparam HSSI_10G_TX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_OFST = 2;
localparam HSSI_10G_TX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_HIGH = 2;
localparam HSSI_10G_TX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_BITMASK = 32'h00000004;
localparam HSSI_10G_TX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_TX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_TX_PCS_ENC64B66B_TXSM_CLKEN_VALUE = "enc64b66b_txsm_clk_dis";
localparam HSSI_10G_TX_PCS_ENC64B66B_TXSM_CLKEN_ADDR_OFST = 134;
localparam HSSI_10G_TX_PCS_ENC64B66B_TXSM_CLKEN_ADDR_FIELD_OFST = 5;
localparam HSSI_10G_TX_PCS_ENC64B66B_TXSM_CLKEN_ADDR_FIELD_HIGH = 5;
localparam HSSI_10G_TX_PCS_ENC64B66B_TXSM_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_ENC64B66B_TXSM_CLKEN_ADDR_FIELD_BITMASK = 32'h00000020;
localparam HSSI_10G_TX_PCS_ENC64B66B_TXSM_CLKEN_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_TX_PCS_ENC64B66B_TXSM_CLKEN_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_TX_PCS_ENC_64B66B_TXSM_BYPASS_VALUE = "enc_64b66b_txsm_bypass_en";
localparam HSSI_10G_TX_PCS_ENC_64B66B_TXSM_BYPASS_ADDR_OFST = 112;
localparam HSSI_10G_TX_PCS_ENC_64B66B_TXSM_BYPASS_ADDR_FIELD_OFST = 1;
localparam HSSI_10G_TX_PCS_ENC_64B66B_TXSM_BYPASS_ADDR_FIELD_HIGH = 1;
localparam HSSI_10G_TX_PCS_ENC_64B66B_TXSM_BYPASS_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_ENC_64B66B_TXSM_BYPASS_ADDR_FIELD_BITMASK = 32'h00000002;
localparam HSSI_10G_TX_PCS_ENC_64B66B_TXSM_BYPASS_ADDR_FIELD_VALMASK = 32'h00000002;
localparam HSSI_10G_TX_PCS_ENC_64B66B_TXSM_BYPASS_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_TX_PCS_FASTPATH_VALUE = "fastpath_en";
localparam HSSI_10G_TX_PCS_FASTPATH_ADDR_OFST = 141;
localparam HSSI_10G_TX_PCS_FASTPATH_ADDR_FIELD_OFST = 2;
localparam HSSI_10G_TX_PCS_FASTPATH_ADDR_FIELD_HIGH = 2;
localparam HSSI_10G_TX_PCS_FASTPATH_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_FASTPATH_ADDR_FIELD_BITMASK = 32'h00000004;
localparam HSSI_10G_TX_PCS_FASTPATH_ADDR_FIELD_VALMASK = 32'h00000004;
localparam HSSI_10G_TX_PCS_FASTPATH_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_TX_PCS_GB_TX_IDWIDTH_VALUE = "idwidth_64";
localparam HSSI_10G_TX_PCS_GB_TX_IDWIDTH_ADDR_OFST = 136;
localparam HSSI_10G_TX_PCS_GB_TX_IDWIDTH_ADDR_FIELD_OFST = 0;
localparam HSSI_10G_TX_PCS_GB_TX_IDWIDTH_ADDR_FIELD_HIGH = 2;
localparam HSSI_10G_TX_PCS_GB_TX_IDWIDTH_ADDR_FIELD_SIZE = 3;
localparam HSSI_10G_TX_PCS_GB_TX_IDWIDTH_ADDR_FIELD_BITMASK = 32'h00000007;
localparam HSSI_10G_TX_PCS_GB_TX_IDWIDTH_ADDR_FIELD_VALMASK = 32'h00000005;
localparam HSSI_10G_TX_PCS_GB_TX_IDWIDTH_ADDR_FIELD_VALUE = 3'h5;

localparam HSSI_10G_TX_PCS_GB_TX_ODWIDTH_VALUE = "odwidth_64";
localparam HSSI_10G_TX_PCS_GB_TX_ODWIDTH_ADDR_OFST = 136;
localparam HSSI_10G_TX_PCS_GB_TX_ODWIDTH_ADDR_FIELD_OFST = 3;
localparam HSSI_10G_TX_PCS_GB_TX_ODWIDTH_ADDR_FIELD_HIGH = 4;
localparam HSSI_10G_TX_PCS_GB_TX_ODWIDTH_ADDR_FIELD_SIZE = 2;
localparam HSSI_10G_TX_PCS_GB_TX_ODWIDTH_ADDR_FIELD_BITMASK = 32'h00000018;
localparam HSSI_10G_TX_PCS_GB_TX_ODWIDTH_ADDR_FIELD_VALMASK = 32'h00000010;
localparam HSSI_10G_TX_PCS_GB_TX_ODWIDTH_ADDR_FIELD_VALUE = 2'h2;

localparam HSSI_10G_TX_PCS_GBRED_CLKEN_VALUE = "gbred_clk_dis";
localparam HSSI_10G_TX_PCS_GBRED_CLKEN_ADDR_OFST = 134;
localparam HSSI_10G_TX_PCS_GBRED_CLKEN_ADDR_FIELD_OFST = 0;
localparam HSSI_10G_TX_PCS_GBRED_CLKEN_ADDR_FIELD_HIGH = 0;
localparam HSSI_10G_TX_PCS_GBRED_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_GBRED_CLKEN_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_10G_TX_PCS_GBRED_CLKEN_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_TX_PCS_GBRED_CLKEN_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_TX_PCS_PROT_MODE_VALUE = "disable_mode";

localparam HSSI_10G_TX_PCS_RDFIFO_CLKEN_VALUE = "rdfifo_clk_dis";
localparam HSSI_10G_TX_PCS_RDFIFO_CLKEN_ADDR_OFST = 135;
localparam HSSI_10G_TX_PCS_RDFIFO_CLKEN_ADDR_FIELD_OFST = 0;
localparam HSSI_10G_TX_PCS_RDFIFO_CLKEN_ADDR_FIELD_HIGH = 0;
localparam HSSI_10G_TX_PCS_RDFIFO_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_RDFIFO_CLKEN_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_10G_TX_PCS_RDFIFO_CLKEN_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_TX_PCS_RDFIFO_CLKEN_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_TX_PCS_SCRM_BYPASS_VALUE = "scrm_bypass_en";
localparam HSSI_10G_TX_PCS_SCRM_BYPASS_ADDR_OFST = 112;
localparam HSSI_10G_TX_PCS_SCRM_BYPASS_ADDR_FIELD_OFST = 3;
localparam HSSI_10G_TX_PCS_SCRM_BYPASS_ADDR_FIELD_HIGH = 3;
localparam HSSI_10G_TX_PCS_SCRM_BYPASS_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_SCRM_BYPASS_ADDR_FIELD_BITMASK = 32'h00000008;
localparam HSSI_10G_TX_PCS_SCRM_BYPASS_ADDR_FIELD_VALMASK = 32'h00000008;
localparam HSSI_10G_TX_PCS_SCRM_BYPASS_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_TX_PCS_SCRM_CLKEN_VALUE = "scrm_clk_dis";
localparam HSSI_10G_TX_PCS_SCRM_CLKEN_ADDR_OFST = 134;
localparam HSSI_10G_TX_PCS_SCRM_CLKEN_ADDR_FIELD_OFST = 4;
localparam HSSI_10G_TX_PCS_SCRM_CLKEN_ADDR_FIELD_HIGH = 4;
localparam HSSI_10G_TX_PCS_SCRM_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_SCRM_CLKEN_ADDR_FIELD_BITMASK = 32'h00000010;
localparam HSSI_10G_TX_PCS_SCRM_CLKEN_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_TX_PCS_SCRM_CLKEN_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_TX_PCS_SH_ERR_VALUE = "sh_err_dis";
localparam HSSI_10G_TX_PCS_SH_ERR_ADDR_OFST = 137;
localparam HSSI_10G_TX_PCS_SH_ERR_ADDR_FIELD_OFST = 5;
localparam HSSI_10G_TX_PCS_SH_ERR_ADDR_FIELD_HIGH = 5;
localparam HSSI_10G_TX_PCS_SH_ERR_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_SH_ERR_ADDR_FIELD_BITMASK = 32'h00000020;
localparam HSSI_10G_TX_PCS_SH_ERR_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_TX_PCS_SH_ERR_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_TX_PCS_TX_SH_LOCATION_VALUE = "msb";
localparam HSSI_10G_TX_PCS_TX_SH_LOCATION_ADDR_OFST = 144;
localparam HSSI_10G_TX_PCS_TX_SH_LOCATION_ADDR_FIELD_OFST = 1;
localparam HSSI_10G_TX_PCS_TX_SH_LOCATION_ADDR_FIELD_HIGH = 1;
localparam HSSI_10G_TX_PCS_TX_SH_LOCATION_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_TX_SH_LOCATION_ADDR_FIELD_BITMASK = 32'h00000002;
localparam HSSI_10G_TX_PCS_TX_SH_LOCATION_ADDR_FIELD_VALMASK = 32'h00000002;
localparam HSSI_10G_TX_PCS_TX_SH_LOCATION_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_TX_PCS_TX_SM_BYPASS_VALUE = "tx_sm_bypass_en";
localparam HSSI_10G_TX_PCS_TX_SM_BYPASS_ADDR_OFST = 112;
localparam HSSI_10G_TX_PCS_TX_SM_BYPASS_ADDR_FIELD_OFST = 2;
localparam HSSI_10G_TX_PCS_TX_SM_BYPASS_ADDR_FIELD_HIGH = 2;
localparam HSSI_10G_TX_PCS_TX_SM_BYPASS_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_TX_SM_BYPASS_ADDR_FIELD_BITMASK = 32'h00000004;
localparam HSSI_10G_TX_PCS_TX_SM_BYPASS_ADDR_FIELD_VALMASK = 32'h00000004;
localparam HSSI_10G_TX_PCS_TX_SM_BYPASS_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_TX_PCS_WRFIFO_CLKEN_VALUE = "wrfifo_clk_dis";
localparam HSSI_10G_TX_PCS_WRFIFO_CLKEN_ADDR_OFST = 135;
localparam HSSI_10G_TX_PCS_WRFIFO_CLKEN_ADDR_FIELD_OFST = 1;
localparam HSSI_10G_TX_PCS_WRFIFO_CLKEN_ADDR_FIELD_HIGH = 1;
localparam HSSI_10G_TX_PCS_WRFIFO_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_WRFIFO_CLKEN_ADDR_FIELD_BITMASK = 32'h00000002;
localparam HSSI_10G_TX_PCS_WRFIFO_CLKEN_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_TX_PCS_WRFIFO_CLKEN_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_8G_RX_PCS_BYTE_DESERIALIZER_VALUE = "en_bds_by_2";
localparam HSSI_8G_RX_PCS_BYTE_DESERIALIZER_ADDR_OFST = 68;
localparam HSSI_8G_RX_PCS_BYTE_DESERIALIZER_ADDR_FIELD_OFST = 5;
localparam HSSI_8G_RX_PCS_BYTE_DESERIALIZER_ADDR_FIELD_HIGH = 7;
localparam HSSI_8G_RX_PCS_BYTE_DESERIALIZER_ADDR_FIELD_SIZE = 3;
localparam HSSI_8G_RX_PCS_BYTE_DESERIALIZER_ADDR_FIELD_BITMASK = 32'h000000E0;
localparam HSSI_8G_RX_PCS_BYTE_DESERIALIZER_ADDR_FIELD_VALMASK = 32'h00000040;
localparam HSSI_8G_RX_PCS_BYTE_DESERIALIZER_ADDR_FIELD_VALUE = 3'h2;

localparam HSSI_8G_RX_PCS_CLOCK_GATE_BDS_DEC_ASN_VALUE = "dis_bds_dec_asn_clk_gating";
localparam HSSI_8G_RX_PCS_CLOCK_GATE_BDS_DEC_ASN_ADDR_OFST = 81;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_BDS_DEC_ASN_ADDR_FIELD_OFST = 7;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_BDS_DEC_ASN_ADDR_FIELD_HIGH = 7;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_BDS_DEC_ASN_ADDR_FIELD_SIZE = 1;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_BDS_DEC_ASN_ADDR_FIELD_BITMASK = 32'h00000080;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_BDS_DEC_ASN_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_BDS_DEC_ASN_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_8G_RX_PCS_CLOCK_GATE_PC_RDCLK_VALUE = "dis_pc_rdclk_gating";
localparam HSSI_8G_RX_PCS_CLOCK_GATE_PC_RDCLK_ADDR_OFST = 77;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_PC_RDCLK_ADDR_FIELD_OFST = 0;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_PC_RDCLK_ADDR_FIELD_HIGH = 0;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_PC_RDCLK_ADDR_FIELD_SIZE = 1;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_PC_RDCLK_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_PC_RDCLK_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_PC_RDCLK_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_PC_WRCLK_VALUE = "dis_sw_pc_wrclk_gating";
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_PC_WRCLK_ADDR_OFST = 77;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_PC_WRCLK_ADDR_FIELD_OFST = 2;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_PC_WRCLK_ADDR_FIELD_HIGH = 2;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_PC_WRCLK_ADDR_FIELD_SIZE = 1;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_PC_WRCLK_ADDR_FIELD_BITMASK = 32'h00000004;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_PC_WRCLK_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_PC_WRCLK_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_WA_VALUE = "dis_sw_wa_clk_gating";
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_WA_ADDR_OFST = 81;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_WA_ADDR_FIELD_OFST = 6;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_WA_ADDR_FIELD_HIGH = 6;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_WA_ADDR_FIELD_SIZE = 1;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_WA_ADDR_FIELD_BITMASK = 32'h00000040;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_WA_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_WA_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_8G_RX_PCS_PROT_MODE_VALUE = "basic_rm_disable";

localparam HSSI_8G_RX_PCS_TEST_BUS_SEL_VALUE = "pcie_ctrl_testbus";
localparam HSSI_8G_RX_PCS_TEST_BUS_SEL_ADDR_OFST = 72;
localparam HSSI_8G_RX_PCS_TEST_BUS_SEL_ADDR_FIELD_OFST = 2;
localparam HSSI_8G_RX_PCS_TEST_BUS_SEL_ADDR_FIELD_HIGH = 4;
localparam HSSI_8G_RX_PCS_TEST_BUS_SEL_ADDR_FIELD_SIZE = 3;
localparam HSSI_8G_RX_PCS_TEST_BUS_SEL_ADDR_FIELD_BITMASK = 32'h0000001C;
localparam HSSI_8G_RX_PCS_TEST_BUS_SEL_ADDR_FIELD_VALMASK = 32'h00000014;
localparam HSSI_8G_RX_PCS_TEST_BUS_SEL_ADDR_FIELD_VALUE = 3'h5;

localparam HSSI_8G_RX_PCS_WA_PD_VALUE = "wa_pd_7";
localparam HSSI_8G_RX_PCS_WA_PD_ADDR_OFST = 51;
localparam HSSI_8G_RX_PCS_WA_PD_ADDR_FIELD_OFST = 0;
localparam HSSI_8G_RX_PCS_WA_PD_ADDR_FIELD_HIGH = 2;
localparam HSSI_8G_RX_PCS_WA_PD_ADDR_FIELD_SIZE = 3;
localparam HSSI_8G_RX_PCS_WA_PD_ADDR_FIELD_BITMASK = 32'h00000007;
localparam HSSI_8G_RX_PCS_WA_PD_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_8G_RX_PCS_WA_PD_ADDR_FIELD_VALUE = 3'h0;

localparam HSSI_8G_RX_PCS_WA_PD_DATA_VALUE = "124";
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR0_OFST = 52;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR0_FIELD_OFST = 0;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR0_FIELD_HIGH = 7;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR0_FIELD_SIZE = 8;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR0_FIELD_BITMASK = 32'h000000FF;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR0_FIELD_VALMASK = 32'h00000000;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR0_FIELD_VALUE = 8'h0;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR1_OFST = 53;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR1_FIELD_OFST = 0;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR1_FIELD_HIGH = 7;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR1_FIELD_SIZE = 8;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR1_FIELD_BITMASK = 32'h000000FF;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR1_FIELD_VALMASK = 32'h00000000;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR1_FIELD_VALUE = 8'h0;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR2_OFST = 54;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR2_FIELD_OFST = 0;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR2_FIELD_HIGH = 7;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR2_FIELD_SIZE = 8;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR2_FIELD_BITMASK = 32'h000000FF;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR2_FIELD_VALMASK = 32'h00000000;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR2_FIELD_VALUE = 8'h0;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR3_OFST = 55;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR3_FIELD_OFST = 0;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR3_FIELD_HIGH = 7;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR3_FIELD_SIZE = 8;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR3_FIELD_BITMASK = 32'h000000FF;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR3_FIELD_VALMASK = 32'h00000000;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR3_FIELD_VALUE = 8'h0;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR4_OFST = 56;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR4_FIELD_OFST = 0;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR4_FIELD_HIGH = 7;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR4_FIELD_SIZE = 8;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR4_FIELD_BITMASK = 32'h000000FF;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR4_FIELD_VALMASK = 32'h0000007C;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR4_FIELD_VALUE = 8'h7C;

localparam HSSI_8G_RX_PCS_WA_ROSNUMBER_DATA_VALUE = 2'd0;
localparam HSSI_8G_RX_PCS_WA_ROSNUMBER_DATA_ADDR_OFST = 58;
localparam HSSI_8G_RX_PCS_WA_ROSNUMBER_DATA_ADDR_FIELD_OFST = 3;
localparam HSSI_8G_RX_PCS_WA_ROSNUMBER_DATA_ADDR_FIELD_HIGH = 4;
localparam HSSI_8G_RX_PCS_WA_ROSNUMBER_DATA_ADDR_FIELD_SIZE = 2;
localparam HSSI_8G_RX_PCS_WA_ROSNUMBER_DATA_ADDR_FIELD_BITMASK = 32'h00000018;
localparam HSSI_8G_RX_PCS_WA_ROSNUMBER_DATA_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_8G_RX_PCS_WA_ROSNUMBER_DATA_ADDR_FIELD_VALUE = 2'h0;

localparam HSSI_8G_RX_PCS_WA_SYNC_SM_CTRL_VALUE = "sw_basic_sync_sm";
localparam HSSI_8G_RX_PCS_WA_SYNC_SM_CTRL_ADDR_OFST = 58;
localparam HSSI_8G_RX_PCS_WA_SYNC_SM_CTRL_ADDR_FIELD_OFST = 5;
localparam HSSI_8G_RX_PCS_WA_SYNC_SM_CTRL_ADDR_FIELD_HIGH = 5;
localparam HSSI_8G_RX_PCS_WA_SYNC_SM_CTRL_ADDR_FIELD_SIZE = 1;
localparam HSSI_8G_RX_PCS_WA_SYNC_SM_CTRL_ADDR_FIELD_BITMASK = 32'h00000020;
localparam HSSI_8G_RX_PCS_WA_SYNC_SM_CTRL_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_8G_RX_PCS_WA_SYNC_SM_CTRL_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_8G_TX_PCS_BYTE_SERIALIZER_VALUE = "en_bs_by_2";
localparam HSSI_8G_TX_PCS_BYTE_SERIALIZER_ADDR_OFST = 45;
localparam HSSI_8G_TX_PCS_BYTE_SERIALIZER_ADDR_FIELD_OFST = 5;
localparam HSSI_8G_TX_PCS_BYTE_SERIALIZER_ADDR_FIELD_HIGH = 6;
localparam HSSI_8G_TX_PCS_BYTE_SERIALIZER_ADDR_FIELD_SIZE = 2;
localparam HSSI_8G_TX_PCS_BYTE_SERIALIZER_ADDR_FIELD_BITMASK = 32'h00000060;
localparam HSSI_8G_TX_PCS_BYTE_SERIALIZER_ADDR_FIELD_VALMASK = 32'h00000020;
localparam HSSI_8G_TX_PCS_BYTE_SERIALIZER_ADDR_FIELD_VALUE = 2'h1;

localparam HSSI_8G_TX_PCS_CLOCK_GATE_BS_ENC_VALUE = "dis_bs_enc_clk_gating";
localparam HSSI_8G_TX_PCS_CLOCK_GATE_BS_ENC_ADDR_OFST = 46;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_BS_ENC_ADDR_FIELD_OFST = 0;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_BS_ENC_ADDR_FIELD_HIGH = 0;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_BS_ENC_ADDR_FIELD_SIZE = 1;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_BS_ENC_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_BS_ENC_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_BS_ENC_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_8G_TX_PCS_CLOCK_GATE_FIFORD_VALUE = "dis_fiford_clk_gating";
localparam HSSI_8G_TX_PCS_CLOCK_GATE_FIFORD_ADDR_OFST = 48;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_FIFORD_ADDR_FIELD_OFST = 3;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_FIFORD_ADDR_FIELD_HIGH = 3;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_FIFORD_ADDR_FIELD_SIZE = 1;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_FIFORD_ADDR_FIELD_BITMASK = 32'h00000008;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_FIFORD_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_FIFORD_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_8G_TX_PCS_PROT_MODE_VALUE = "basic";

localparam HSSI_ADAPT_RX_DATAPATH_MAPPING_MODE_VALUE = "map_8g_1x1xfifo";
localparam HSSI_ADAPT_RX_DATAPATH_MAPPING_MODE_ADDR_OFST = 528;
localparam HSSI_ADAPT_RX_DATAPATH_MAPPING_MODE_ADDR_FIELD_OFST = 0;
localparam HSSI_ADAPT_RX_DATAPATH_MAPPING_MODE_ADDR_FIELD_HIGH = 4;
localparam HSSI_ADAPT_RX_DATAPATH_MAPPING_MODE_ADDR_FIELD_SIZE = 5;
localparam HSSI_ADAPT_RX_DATAPATH_MAPPING_MODE_ADDR_FIELD_BITMASK = 32'h0000001F;
localparam HSSI_ADAPT_RX_DATAPATH_MAPPING_MODE_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_ADAPT_RX_DATAPATH_MAPPING_MODE_ADDR_FIELD_VALUE = 5'h0;

localparam HSSI_ADAPT_RX_FIFO_DOUBLE_WRITE_VALUE = "fifo_double_write_dis";
localparam HSSI_ADAPT_RX_FIFO_DOUBLE_WRITE_ADDR_OFST = 532;
localparam HSSI_ADAPT_RX_FIFO_DOUBLE_WRITE_ADDR_FIELD_OFST = 0;
localparam HSSI_ADAPT_RX_FIFO_DOUBLE_WRITE_ADDR_FIELD_HIGH = 0;
localparam HSSI_ADAPT_RX_FIFO_DOUBLE_WRITE_ADDR_FIELD_SIZE = 1;
localparam HSSI_ADAPT_RX_FIFO_DOUBLE_WRITE_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_ADAPT_RX_FIFO_DOUBLE_WRITE_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_ADAPT_RX_FIFO_DOUBLE_WRITE_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_ADAPT_RX_FIFO_RD_CLK_SEL_VALUE = "fifo_rd_pld_pcs_rx_clk_out";
localparam HSSI_ADAPT_RX_FIFO_RD_CLK_SEL_ADDR_OFST = 547;
localparam HSSI_ADAPT_RX_FIFO_RD_CLK_SEL_ADDR_FIELD_OFST = 2;
localparam HSSI_ADAPT_RX_FIFO_RD_CLK_SEL_ADDR_FIELD_HIGH = 4;
localparam HSSI_ADAPT_RX_FIFO_RD_CLK_SEL_ADDR_FIELD_SIZE = 3;
localparam HSSI_ADAPT_RX_FIFO_RD_CLK_SEL_ADDR_FIELD_BITMASK = 32'h0000001C;
localparam HSSI_ADAPT_RX_FIFO_RD_CLK_SEL_ADDR_FIELD_VALMASK = 32'h0000000C;
localparam HSSI_ADAPT_RX_FIFO_RD_CLK_SEL_ADDR_FIELD_VALUE = 3'h3;

localparam HSSI_ADAPT_RX_FIFO_WIDTH_VALUE = "fifo_single_width";

localparam HSSI_ADAPT_RX_PHCOMP_RD_DEL_VALUE = "phcomp_rd_del2";
localparam HSSI_ADAPT_RX_PHCOMP_RD_DEL_ADDR_OFST = 531;
localparam HSSI_ADAPT_RX_PHCOMP_RD_DEL_ADDR_FIELD_OFST = 5;
localparam HSSI_ADAPT_RX_PHCOMP_RD_DEL_ADDR_FIELD_HIGH = 7;
localparam HSSI_ADAPT_RX_PHCOMP_RD_DEL_ADDR_FIELD_SIZE = 3;
localparam HSSI_ADAPT_RX_PHCOMP_RD_DEL_ADDR_FIELD_BITMASK = 32'h000000E0;
localparam HSSI_ADAPT_RX_PHCOMP_RD_DEL_ADDR_FIELD_VALMASK = 32'h00000040;
localparam HSSI_ADAPT_RX_PHCOMP_RD_DEL_ADDR_FIELD_VALUE = 3'h2;

localparam HSSI_ADAPT_RX_HD_HSSIADAPT_PLD_PCS_RX_CLK_OUT_HZ_VALUE = 31'd156250000;

localparam HSSI_ADAPT_RX_PMA_AIB_RX_CLK_EXPECTED_SETTING_VALUE = "not_used";

localparam HSSI_ADAPT_RX_RX_FIFO_POWER_MODE_VALUE = "full_width_half_depth";
localparam HSSI_ADAPT_RX_RX_FIFO_POWER_MODE_ADDR_OFST = 536;
localparam HSSI_ADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_OFST = 6;
localparam HSSI_ADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_HIGH = 7;
localparam HSSI_ADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_SIZE = 2;
localparam HSSI_ADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_BITMASK = 32'h000000C0;
localparam HSSI_ADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_VALMASK = 32'h00000040;
localparam HSSI_ADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_VALUE = 2'h1;

localparam HSSI_ADAPT_RX_RXFIFO_FULL_VALUE = "full_sw";
localparam HSSI_ADAPT_RX_RXFIFO_FULL_ADDR_OFST = 531;
localparam HSSI_ADAPT_RX_RXFIFO_FULL_ADDR_FIELD_OFST = 0;
localparam HSSI_ADAPT_RX_RXFIFO_FULL_ADDR_FIELD_HIGH = 4;
localparam HSSI_ADAPT_RX_RXFIFO_FULL_ADDR_FIELD_SIZE = 5;
localparam HSSI_ADAPT_RX_RXFIFO_FULL_ADDR_FIELD_BITMASK = 32'h0000001F;
localparam HSSI_ADAPT_RX_RXFIFO_FULL_ADDR_FIELD_VALMASK = 32'h00000007;
localparam HSSI_ADAPT_RX_RXFIFO_FULL_ADDR_FIELD_VALUE = 5'h7;

localparam HSSI_ADAPT_RX_WORD_ALIGN_ENABLE_VALUE = "disable";

localparam HSSI_ADAPT_RX_WORD_MARK_VALUE = "wm_dis";
localparam HSSI_ADAPT_RX_WORD_MARK_ADDR_OFST = 530;
localparam HSSI_ADAPT_RX_WORD_MARK_ADDR_FIELD_OFST = 7;
localparam HSSI_ADAPT_RX_WORD_MARK_ADDR_FIELD_HIGH = 7;
localparam HSSI_ADAPT_RX_WORD_MARK_ADDR_FIELD_SIZE = 1;
localparam HSSI_ADAPT_RX_WORD_MARK_ADDR_FIELD_BITMASK = 32'h00000080;
localparam HSSI_ADAPT_RX_WORD_MARK_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_ADAPT_RX_WORD_MARK_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_ADAPT_TX_AIB_CLK_SEL_VALUE = "aib_clk_pld_pcs_tx_clk_out";
localparam HSSI_ADAPT_TX_AIB_CLK_SEL_ADDR_OFST = 524;
localparam HSSI_ADAPT_TX_AIB_CLK_SEL_ADDR_FIELD_OFST = 3;
localparam HSSI_ADAPT_TX_AIB_CLK_SEL_ADDR_FIELD_HIGH = 4;
localparam HSSI_ADAPT_TX_AIB_CLK_SEL_ADDR_FIELD_SIZE = 2;
localparam HSSI_ADAPT_TX_AIB_CLK_SEL_ADDR_FIELD_BITMASK = 32'h00000018;
localparam HSSI_ADAPT_TX_AIB_CLK_SEL_ADDR_FIELD_VALMASK = 32'h00000010;
localparam HSSI_ADAPT_TX_AIB_CLK_SEL_ADDR_FIELD_VALUE = 2'h2;

localparam HSSI_ADAPT_TX_HD_HSSIADAPT_AIB_HSSI_TX_TRANSFER_CLK_HZ_VALUE = 31'd156250000;

localparam HSSI_ADAPT_TX_DATAPATH_MAPPING_MODE_VALUE = "map_8g_1x1xfifo";
localparam HSSI_ADAPT_TX_DATAPATH_MAPPING_MODE_ADDR_OFST = 512;
localparam HSSI_ADAPT_TX_DATAPATH_MAPPING_MODE_ADDR_FIELD_OFST = 0;
localparam HSSI_ADAPT_TX_DATAPATH_MAPPING_MODE_ADDR_FIELD_HIGH = 4;
localparam HSSI_ADAPT_TX_DATAPATH_MAPPING_MODE_ADDR_FIELD_SIZE = 5;
localparam HSSI_ADAPT_TX_DATAPATH_MAPPING_MODE_ADDR_FIELD_BITMASK = 32'h0000001F;
localparam HSSI_ADAPT_TX_DATAPATH_MAPPING_MODE_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_ADAPT_TX_DATAPATH_MAPPING_MODE_ADDR_FIELD_VALUE = 5'h0;

localparam HSSI_ADAPT_TX_FIFO_DOUBLE_READ_VALUE = "fifo_double_read_dis";
localparam HSSI_ADAPT_TX_FIFO_DOUBLE_READ_ADDR_OFST = 516;
localparam HSSI_ADAPT_TX_FIFO_DOUBLE_READ_ADDR_FIELD_OFST = 0;
localparam HSSI_ADAPT_TX_FIFO_DOUBLE_READ_ADDR_FIELD_HIGH = 0;
localparam HSSI_ADAPT_TX_FIFO_DOUBLE_READ_ADDR_FIELD_SIZE = 1;
localparam HSSI_ADAPT_TX_FIFO_DOUBLE_READ_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_ADAPT_TX_FIFO_DOUBLE_READ_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_ADAPT_TX_FIFO_DOUBLE_READ_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_ADAPT_TX_FIFO_WIDTH_VALUE = "fifo_single_width";

localparam HSSI_ADAPT_TX_HD_HSSIADAPT_PLD_PCS_TX_CLK_OUT_HZ_VALUE = 31'd156250000;

localparam HSSI_ADAPT_TX_PMA_AIB_TX_CLK_EXPECTED_SETTING_VALUE = "not_used";

localparam HSSI_ADAPT_TX_TX_FIFO_POWER_MODE_VALUE = "full_width_half_depth";
localparam HSSI_ADAPT_TX_TX_FIFO_POWER_MODE_ADDR_OFST = 520;
localparam HSSI_ADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_OFST = 1;
localparam HSSI_ADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_HIGH = 2;
localparam HSSI_ADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_SIZE = 2;
localparam HSSI_ADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_BITMASK = 32'h00000006;
localparam HSSI_ADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_VALMASK = 32'h00000002;
localparam HSSI_ADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_VALUE = 2'h1;

localparam HSSI_ADAPT_TX_TXFIFO_FULL_VALUE = "full_sw";
localparam HSSI_ADAPT_TX_TXFIFO_FULL_ADDR_OFST = 515;
localparam HSSI_ADAPT_TX_TXFIFO_FULL_ADDR_FIELD_OFST = 0;
localparam HSSI_ADAPT_TX_TXFIFO_FULL_ADDR_FIELD_HIGH = 4;
localparam HSSI_ADAPT_TX_TXFIFO_FULL_ADDR_FIELD_SIZE = 5;
localparam HSSI_ADAPT_TX_TXFIFO_FULL_ADDR_FIELD_BITMASK = 32'h0000001F;
localparam HSSI_ADAPT_TX_TXFIFO_FULL_ADDR_FIELD_VALMASK = 32'h00000007;
localparam HSSI_ADAPT_TX_TXFIFO_FULL_ADDR_FIELD_VALUE = 5'h7;

localparam HSSI_ADAPT_TX_WORD_ALIGN_VALUE = "wa_dis";
localparam HSSI_ADAPT_TX_WORD_ALIGN_ADDR_OFST = 520;
localparam HSSI_ADAPT_TX_WORD_ALIGN_ADDR_FIELD_OFST = 0;
localparam HSSI_ADAPT_TX_WORD_ALIGN_ADDR_FIELD_HIGH = 0;
localparam HSSI_ADAPT_TX_WORD_ALIGN_ADDR_FIELD_SIZE = 1;
localparam HSSI_ADAPT_TX_WORD_ALIGN_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_ADAPT_TX_WORD_ALIGN_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_ADAPT_TX_WORD_ALIGN_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_ADAPT_TX_WORD_ALIGN_ENABLE_VALUE = "disable";

localparam HSSI_AIBCR_RX_AIB_RX_DCC_BYP_VALUE = "aib_rx_dcc_byp_enable";
localparam HSSI_AIBCR_RX_AIB_RX_DCC_BYP_ADDR_OFST = 560;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_BYP_ADDR_FIELD_OFST = 3;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_BYP_ADDR_FIELD_HIGH = 3;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_BYP_ADDR_FIELD_SIZE = 1;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_BYP_ADDR_FIELD_BITMASK = 32'h00000008;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_BYP_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_BYP_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_AIBCR_RX_AIB_RX_DCC_EN_VALUE = "aib_rx_dcc_disable";
localparam HSSI_AIBCR_RX_AIB_RX_DCC_EN_ADDR_OFST = 560;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_EN_ADDR_FIELD_OFST = 4;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_EN_ADDR_FIELD_HIGH = 4;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_EN_ADDR_FIELD_SIZE = 1;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_EN_ADDR_FIELD_BITMASK = 32'h00000010;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_EN_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_EN_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_AIBCR_RX_OP_MODE_VALUE = "rx_dcc_disable";

localparam HSSI_AIBCR_RX_POWERMODE_AC_VALUE = "rxdatapath_low_speed_pwr";

localparam HSSI_AIBCR_TX_AIB_DLLSTR_ALIGN_DY_CTLSEL_VALUE = "aib_dllstr_align_dy_ctlsel_setting1";
localparam HSSI_AIBCR_TX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_OFST = 558;
localparam HSSI_AIBCR_TX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_OFST = 2;
localparam HSSI_AIBCR_TX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_HIGH = 2;
localparam HSSI_AIBCR_TX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_SIZE = 1;
localparam HSSI_AIBCR_TX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_BITMASK = 32'h00000004;
localparam HSSI_AIBCR_TX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_VALMASK = 32'h00000004;
localparam HSSI_AIBCR_TX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_AIBCR_TX_OP_MODE_VALUE = "tx_dll_disable";

localparam HSSI_AIBCR_TX_POWERMODE_AC_VALUE = "txdatapath_low_speed_pwr";

localparam HSSI_AIBND_RX_AIB_DLLSTR_ALIGN_DY_CTLSEL_VALUE = "aib_dllstr_align_dy_ctlsel_setting1";
localparam HSSI_AIBND_RX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_OFST = 812;
localparam HSSI_AIBND_RX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_OFST = 2;
localparam HSSI_AIBND_RX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_HIGH = 2;
localparam HSSI_AIBND_RX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_SIZE = 1;
localparam HSSI_AIBND_RX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_BITMASK = 32'h00000004;
localparam HSSI_AIBND_RX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_VALMASK = 32'h00000004;
localparam HSSI_AIBND_RX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_AIBND_RX_OP_MODE_VALUE = "rx_dll_disable";

localparam HSSI_AIBND_RX_POWERMODE_AC_VALUE = "rxdatapath_low_speed_pwr";

localparam HSSI_AIBND_TX_AIB_TX_DCC_BYP_VALUE = "aib_tx_dcc_byp_enable";
localparam HSSI_AIBND_TX_AIB_TX_DCC_BYP_ADDR_OFST = 814;
localparam HSSI_AIBND_TX_AIB_TX_DCC_BYP_ADDR_FIELD_OFST = 3;
localparam HSSI_AIBND_TX_AIB_TX_DCC_BYP_ADDR_FIELD_HIGH = 3;
localparam HSSI_AIBND_TX_AIB_TX_DCC_BYP_ADDR_FIELD_SIZE = 1;
localparam HSSI_AIBND_TX_AIB_TX_DCC_BYP_ADDR_FIELD_BITMASK = 32'h00000008;
localparam HSSI_AIBND_TX_AIB_TX_DCC_BYP_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_AIBND_TX_AIB_TX_DCC_BYP_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_AIBND_TX_AIB_TX_DCC_EN_VALUE = "aib_tx_dcc_disable";
localparam HSSI_AIBND_TX_AIB_TX_DCC_EN_ADDR_OFST = 814;
localparam HSSI_AIBND_TX_AIB_TX_DCC_EN_ADDR_FIELD_OFST = 4;
localparam HSSI_AIBND_TX_AIB_TX_DCC_EN_ADDR_FIELD_HIGH = 4;
localparam HSSI_AIBND_TX_AIB_TX_DCC_EN_ADDR_FIELD_SIZE = 1;
localparam HSSI_AIBND_TX_AIB_TX_DCC_EN_ADDR_FIELD_BITMASK = 32'h00000010;
localparam HSSI_AIBND_TX_AIB_TX_DCC_EN_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_AIBND_TX_AIB_TX_DCC_EN_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_AIBND_TX_OP_MODE_VALUE = "tx_dcc_disable";

localparam HSSI_AIBND_TX_POWERMODE_AC_VALUE = "txdatapath_low_speed_pwr";

localparam PMA_ADAPT_SEQUENCER_RX_PATH_RSTN_OVERRIDEB_VALUE = "use_sequencer";

localparam PMA_ADAPT_DATARATE_BPS_VALUE = "3125000000";

localparam CDR_PLL_CHGPMP_CURRENT_DN_PD_VALUE = "cp_current_pd_dn_setting4";
localparam CDR_PLL_CHGPMP_CURRENT_DN_PD_ADDR_OFST = 313;
localparam CDR_PLL_CHGPMP_CURRENT_DN_PD_ADDR_FIELD_OFST = 3;
localparam CDR_PLL_CHGPMP_CURRENT_DN_PD_ADDR_FIELD_HIGH = 5;
localparam CDR_PLL_CHGPMP_CURRENT_DN_PD_ADDR_FIELD_SIZE = 3;
localparam CDR_PLL_CHGPMP_CURRENT_DN_PD_ADDR_FIELD_BITMASK = 32'h00000038;
localparam CDR_PLL_CHGPMP_CURRENT_DN_PD_ADDR_FIELD_VALMASK = 32'h00000020;
localparam CDR_PLL_CHGPMP_CURRENT_DN_PD_ADDR_FIELD_VALUE = 3'h4;

localparam CDR_PLL_CHGPMP_CURRENT_PFD_VALUE = "cp_current_pfd_setting1";
localparam CDR_PLL_CHGPMP_CURRENT_PFD_ADDR_OFST = 313;
localparam CDR_PLL_CHGPMP_CURRENT_PFD_ADDR_FIELD_OFST = 0;
localparam CDR_PLL_CHGPMP_CURRENT_PFD_ADDR_FIELD_HIGH = 2;
localparam CDR_PLL_CHGPMP_CURRENT_PFD_ADDR_FIELD_SIZE = 3;
localparam CDR_PLL_CHGPMP_CURRENT_PFD_ADDR_FIELD_BITMASK = 32'h00000007;
localparam CDR_PLL_CHGPMP_CURRENT_PFD_ADDR_FIELD_VALMASK = 32'h00000001;
localparam CDR_PLL_CHGPMP_CURRENT_PFD_ADDR_FIELD_VALUE = 3'h1;

localparam CDR_PLL_CHGPMP_CURRENT_UP_PD_VALUE = "cp_current_pd_up_setting4";
localparam CDR_PLL_CHGPMP_CURRENT_UP_PD_ADDR_OFST = 307;
localparam CDR_PLL_CHGPMP_CURRENT_UP_PD_ADDR_FIELD_OFST = 5;
localparam CDR_PLL_CHGPMP_CURRENT_UP_PD_ADDR_FIELD_HIGH = 7;
localparam CDR_PLL_CHGPMP_CURRENT_UP_PD_ADDR_FIELD_SIZE = 3;
localparam CDR_PLL_CHGPMP_CURRENT_UP_PD_ADDR_FIELD_BITMASK = 32'h000000E0;
localparam CDR_PLL_CHGPMP_CURRENT_UP_PD_ADDR_FIELD_VALMASK = 32'h00000080;
localparam CDR_PLL_CHGPMP_CURRENT_UP_PD_ADDR_FIELD_VALUE = 3'h4;

localparam CDR_PLL_DATARATE_BPS_VALUE = "3125000000";

localparam CDR_PLL_F_MAX_VCO_VALUE = "10312500000";

localparam CDR_PLL_F_MIN_VCO_VALUE = "4900000000";

localparam CDR_PLL_FREF_CLKLOW_DIV_VALUE = 1;
localparam CDR_PLL_FREF_CLKLOW_DIV_ADDR_OFST = 314;
localparam CDR_PLL_FREF_CLKLOW_DIV_ADDR_FIELD_OFST = 6;
localparam CDR_PLL_FREF_CLKLOW_DIV_ADDR_FIELD_HIGH = 7;
localparam CDR_PLL_FREF_CLKLOW_DIV_ADDR_FIELD_SIZE = 2;
localparam CDR_PLL_FREF_CLKLOW_DIV_ADDR_FIELD_BITMASK = 32'h000000C0;
localparam CDR_PLL_FREF_CLKLOW_DIV_ADDR_FIELD_VALMASK = 32'h00000000;
localparam CDR_PLL_FREF_CLKLOW_DIV_ADDR_FIELD_VALUE = 2'h0;

localparam CDR_PLL_LF_RESISTOR_PD_VALUE = "lf_pd_setting3";
localparam CDR_PLL_LF_RESISTOR_PD_ADDR_OFST = 309;
localparam CDR_PLL_LF_RESISTOR_PD_ADDR_FIELD_OFST = 2;
localparam CDR_PLL_LF_RESISTOR_PD_ADDR_FIELD_HIGH = 3;
localparam CDR_PLL_LF_RESISTOR_PD_ADDR_FIELD_SIZE = 2;
localparam CDR_PLL_LF_RESISTOR_PD_ADDR_FIELD_BITMASK = 32'h0000000C;
localparam CDR_PLL_LF_RESISTOR_PD_ADDR_FIELD_VALMASK = 32'h0000000C;
localparam CDR_PLL_LF_RESISTOR_PD_ADDR_FIELD_VALUE = 2'h3;

localparam CDR_PLL_LF_RESISTOR_PFD_VALUE = "lf_pfd_setting3";
localparam CDR_PLL_LF_RESISTOR_PFD_ADDR_OFST = 309;
localparam CDR_PLL_LF_RESISTOR_PFD_ADDR_FIELD_OFST = 0;
localparam CDR_PLL_LF_RESISTOR_PFD_ADDR_FIELD_HIGH = 1;
localparam CDR_PLL_LF_RESISTOR_PFD_ADDR_FIELD_SIZE = 2;
localparam CDR_PLL_LF_RESISTOR_PFD_ADDR_FIELD_BITMASK = 32'h00000003;
localparam CDR_PLL_LF_RESISTOR_PFD_ADDR_FIELD_VALMASK = 32'h00000003;
localparam CDR_PLL_LF_RESISTOR_PFD_ADDR_FIELD_VALUE = 2'h3;

localparam CDR_PLL_LPD_COUNTER_VALUE = 5'd4;

localparam CDR_PLL_LPFD_COUNTER_VALUE = 5'd2;

localparam CDR_PLL_MCNT_DIV_VALUE = 8'd25;
localparam CDR_PLL_MCNT_DIV_ADDR_OFST = 315;
localparam CDR_PLL_MCNT_DIV_ADDR_FIELD_OFST = 0;
localparam CDR_PLL_MCNT_DIV_ADDR_FIELD_HIGH = 7;
localparam CDR_PLL_MCNT_DIV_ADDR_FIELD_SIZE = 8;
localparam CDR_PLL_MCNT_DIV_ADDR_FIELD_BITMASK = 32'h000000FF;
localparam CDR_PLL_MCNT_DIV_ADDR_FIELD_VALMASK = 32'h00000019;
localparam CDR_PLL_MCNT_DIV_ADDR_FIELD_VALUE = 8'h19;

localparam CDR_PLL_N_COUNTER_VALUE = 6'd1;

localparam CDR_PLL_NCNT_DIV_VALUE = 1;
localparam CDR_PLL_NCNT_DIV_ADDR_OFST = 316;
localparam CDR_PLL_NCNT_DIV_ADDR_FIELD_OFST = 2;
localparam CDR_PLL_NCNT_DIV_ADDR_FIELD_HIGH = 3;
localparam CDR_PLL_NCNT_DIV_ADDR_FIELD_SIZE = 2;
localparam CDR_PLL_NCNT_DIV_ADDR_FIELD_BITMASK = 32'h0000000C;
localparam CDR_PLL_NCNT_DIV_ADDR_FIELD_VALMASK = 32'h00000000;
localparam CDR_PLL_NCNT_DIV_ADDR_FIELD_VALUE = 2'h0;

localparam CDR_PLL_OUT_FREQ_VALUE = "1562500000";

localparam CDR_PLL_PD_L_COUNTER_VALUE = 4;
localparam CDR_PLL_PD_L_COUNTER_ADDR_OFST = 314;
localparam CDR_PLL_PD_L_COUNTER_ADDR_FIELD_OFST = 3;
localparam CDR_PLL_PD_L_COUNTER_ADDR_FIELD_HIGH = 5;
localparam CDR_PLL_PD_L_COUNTER_ADDR_FIELD_SIZE = 3;
localparam CDR_PLL_PD_L_COUNTER_ADDR_FIELD_BITMASK = 32'h00000038;
localparam CDR_PLL_PD_L_COUNTER_ADDR_FIELD_VALMASK = 32'h00000020;
localparam CDR_PLL_PD_L_COUNTER_ADDR_FIELD_VALUE = 3'h4;

localparam CDR_PLL_PFD_L_COUNTER_VALUE = 2;
localparam CDR_PLL_PFD_L_COUNTER_ADDR_OFST = 314;
localparam CDR_PLL_PFD_L_COUNTER_ADDR_FIELD_OFST = 0;
localparam CDR_PLL_PFD_L_COUNTER_ADDR_FIELD_HIGH = 2;
localparam CDR_PLL_PFD_L_COUNTER_ADDR_FIELD_SIZE = 3;
localparam CDR_PLL_PFD_L_COUNTER_ADDR_FIELD_BITMASK = 32'h00000007;
localparam CDR_PLL_PFD_L_COUNTER_ADDR_FIELD_VALMASK = 32'h00000003;
localparam CDR_PLL_PFD_L_COUNTER_ADDR_FIELD_VALUE = 3'h3;

localparam CDR_PLL_POWERMODE_AC_RVCOTOP_VALUE = "rvcotop_ac_div4";

localparam CDR_PLL_POWERMODE_DC_RVCOTOP_VALUE = "rvcotop_dc_div4";

localparam CDR_PLL_REFERENCE_CLOCK_FREQUENCY_VALUE = "125000000";

localparam CDR_PLL_SET_CDR_INPUT_FREQ_RANGE_VALUE = 8'd30;
localparam CDR_PLL_SET_CDR_INPUT_FREQ_RANGE_ADDR_OFST = 345;
localparam CDR_PLL_SET_CDR_INPUT_FREQ_RANGE_ADDR_FIELD_OFST = 0;
localparam CDR_PLL_SET_CDR_INPUT_FREQ_RANGE_ADDR_FIELD_HIGH = 7;
localparam CDR_PLL_SET_CDR_INPUT_FREQ_RANGE_ADDR_FIELD_SIZE = 8;
localparam CDR_PLL_SET_CDR_INPUT_FREQ_RANGE_ADDR_FIELD_BITMASK = 32'h000000FF;
localparam CDR_PLL_SET_CDR_INPUT_FREQ_RANGE_ADDR_FIELD_VALMASK = 32'h0000001E;
localparam CDR_PLL_SET_CDR_INPUT_FREQ_RANGE_ADDR_FIELD_VALUE = 8'h1E;

localparam CDR_PLL_SET_CDR_VCO_SPEED_VALUE = 4'd3;
localparam CDR_PLL_SET_CDR_VCO_SPEED_ADDR_OFST = 311;
localparam CDR_PLL_SET_CDR_VCO_SPEED_ADDR_FIELD_OFST = 2;
localparam CDR_PLL_SET_CDR_VCO_SPEED_ADDR_FIELD_HIGH = 5;
localparam CDR_PLL_SET_CDR_VCO_SPEED_ADDR_FIELD_SIZE = 4;
localparam CDR_PLL_SET_CDR_VCO_SPEED_ADDR_FIELD_BITMASK = 32'h0000003C;
localparam CDR_PLL_SET_CDR_VCO_SPEED_ADDR_FIELD_VALMASK = 32'h0000000C;
localparam CDR_PLL_SET_CDR_VCO_SPEED_ADDR_FIELD_VALUE = 4'h3;

localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_VALUE = 8'd56;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR0_OFST = 306;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR0_FIELD_OFST = 0;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR0_FIELD_HIGH = 3;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR0_FIELD_SIZE = 4;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR0_FIELD_BITMASK = 32'h0000000F;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR0_FIELD_VALMASK = 32'h00000003;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR0_FIELD_VALUE = 4'h3;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR1_OFST = 310;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR1_FIELD_OFST = 0;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR1_FIELD_HIGH = 3;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR1_FIELD_SIZE = 4;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR1_FIELD_BITMASK = 32'h0000000F;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR1_FIELD_VALMASK = 32'h00000008;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR1_FIELD_VALUE = 4'h8;

localparam CDR_PLL_VCO_FREQ_VALUE = "6250000000";

localparam CDR_PLL_PMA_WIDTH_VALUE = 10;

localparam PMA_RX_BUF_CTLE_TIA_ISEL_VALUE = "ib_tia_bw0";
localparam PMA_RX_BUF_CTLE_TIA_ISEL_ADDR_OFST = 302;
localparam PMA_RX_BUF_CTLE_TIA_ISEL_ADDR_FIELD_OFST = 4;
localparam PMA_RX_BUF_CTLE_TIA_ISEL_ADDR_FIELD_HIGH = 5;
localparam PMA_RX_BUF_CTLE_TIA_ISEL_ADDR_FIELD_SIZE = 2;
localparam PMA_RX_BUF_CTLE_TIA_ISEL_ADDR_FIELD_BITMASK = 32'h00000030;
localparam PMA_RX_BUF_CTLE_TIA_ISEL_ADDR_FIELD_VALMASK = 32'h00000000;
localparam PMA_RX_BUF_CTLE_TIA_ISEL_ADDR_FIELD_VALUE = 2'h0;

localparam PMA_RX_BUF_DATARATE_BPS_VALUE = "3125000000";

localparam PMA_RX_BUF_PM_CR2_RX_PATH_DATARATE_BPS_VALUE = "3125000000";

localparam PMA_RX_BUF_PM_CR2_RX_PATH_DATAWIDTH_VALUE = 8'd10;

localparam PMA_RX_BUF_EQ_BW_SEL_VALUE = "eq_bw_0";
localparam PMA_RX_BUF_EQ_BW_SEL_ADDR_OFST = 287;
localparam PMA_RX_BUF_EQ_BW_SEL_ADDR_FIELD_OFST = 4;
localparam PMA_RX_BUF_EQ_BW_SEL_ADDR_FIELD_HIGH = 5;
localparam PMA_RX_BUF_EQ_BW_SEL_ADDR_FIELD_SIZE = 2;
localparam PMA_RX_BUF_EQ_BW_SEL_ADDR_FIELD_BITMASK = 32'h00000030;
localparam PMA_RX_BUF_EQ_BW_SEL_ADDR_FIELD_VALMASK = 32'h00000000;
localparam PMA_RX_BUF_EQ_BW_SEL_ADDR_FIELD_VALUE = 2'h0;

localparam PMA_RX_BUF_EQ_CDGEN_SEL_VALUE = "eq_cdgen_3";
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR0_OFST = 328;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR0_FIELD_OFST = 2;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR0_FIELD_HIGH = 2;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR0_FIELD_SIZE = 1;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR0_FIELD_BITMASK = 32'h00000004;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR0_FIELD_VALMASK = 32'h00000004;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR0_FIELD_VALUE = 1'h1;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR1_OFST = 337;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR1_FIELD_OFST = 7;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR1_FIELD_HIGH = 7;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR1_FIELD_SIZE = 1;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR1_FIELD_BITMASK = 32'h00000080;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR1_FIELD_VALMASK = 32'h00000080;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR1_FIELD_VALUE = 1'h1;

localparam PMA_RX_BUF_EQ_ISEL_VALUE = "eq_isel_0";
localparam PMA_RX_BUF_EQ_ISEL_ADDR_OFST = 370;
localparam PMA_RX_BUF_EQ_ISEL_ADDR_FIELD_OFST = 4;
localparam PMA_RX_BUF_EQ_ISEL_ADDR_FIELD_HIGH = 4;
localparam PMA_RX_BUF_EQ_ISEL_ADDR_FIELD_SIZE = 1;
localparam PMA_RX_BUF_EQ_ISEL_ADDR_FIELD_BITMASK = 32'h00000010;
localparam PMA_RX_BUF_EQ_ISEL_ADDR_FIELD_VALMASK = 32'h00000000;
localparam PMA_RX_BUF_EQ_ISEL_ADDR_FIELD_VALUE = 1'h0;

localparam PMA_RX_BUF_PM_CR2_RX_PATH_PMA_RX_DIVCLK_HZ_VALUE = "312500000";

localparam PMA_RX_BUF_POWERMODE_AC_CTLE_VALUE = "ctle_pwr_ac1";

localparam PMA_RX_DESER_CLKDIVRX_USER_MODE_VALUE = "clkdivrx_user_clkdiv";
localparam PMA_RX_DESER_CLKDIVRX_USER_MODE_ADDR_OFST = 320;
localparam PMA_RX_DESER_CLKDIVRX_USER_MODE_ADDR_FIELD_OFST = 0;
localparam PMA_RX_DESER_CLKDIVRX_USER_MODE_ADDR_FIELD_HIGH = 2;
localparam PMA_RX_DESER_CLKDIVRX_USER_MODE_ADDR_FIELD_SIZE = 3;
localparam PMA_RX_DESER_CLKDIVRX_USER_MODE_ADDR_FIELD_BITMASK = 32'h00000007;
localparam PMA_RX_DESER_CLKDIVRX_USER_MODE_ADDR_FIELD_VALMASK = 32'h00000002;
localparam PMA_RX_DESER_CLKDIVRX_USER_MODE_ADDR_FIELD_VALUE = 3'h2;

localparam PMA_RX_DESER_DATARATE_BPS_VALUE = "3125000000";

localparam PMA_RX_DESER_DESER_AIBCK_X1_VALUE = "clk1x_over_ride";
localparam PMA_RX_DESER_DESER_AIBCK_X1_ADDR_OFST = 356;
localparam PMA_RX_DESER_DESER_AIBCK_X1_ADDR_FIELD_OFST = 7;
localparam PMA_RX_DESER_DESER_AIBCK_X1_ADDR_FIELD_HIGH = 7;
localparam PMA_RX_DESER_DESER_AIBCK_X1_ADDR_FIELD_SIZE = 1;
localparam PMA_RX_DESER_DESER_AIBCK_X1_ADDR_FIELD_BITMASK = 32'h00000080;
localparam PMA_RX_DESER_DESER_AIBCK_X1_ADDR_FIELD_VALMASK = 32'h00000080;
localparam PMA_RX_DESER_DESER_AIBCK_X1_ADDR_FIELD_VALUE = 1'h1;

localparam PMA_RX_DESER_DESER_FACTOR_VALUE = "deser_10b";
localparam PMA_RX_DESER_DESER_FACTOR_ADDR_OFST = 319;
localparam PMA_RX_DESER_DESER_FACTOR_ADDR_FIELD_OFST = 0;
localparam PMA_RX_DESER_DESER_FACTOR_ADDR_FIELD_HIGH = 3;
localparam PMA_RX_DESER_DESER_FACTOR_ADDR_FIELD_SIZE = 4;
localparam PMA_RX_DESER_DESER_FACTOR_ADDR_FIELD_BITMASK = 32'h0000000F;
localparam PMA_RX_DESER_DESER_FACTOR_ADDR_FIELD_VALMASK = 32'h00000001;
localparam PMA_RX_DESER_DESER_FACTOR_ADDR_FIELD_VALUE = 4'h1;

localparam PMA_RX_DESER_POWERMODE_AC_DESER_VALUE = "deser_ac_10b_nobs";

localparam PMA_RX_DESER_POWERMODE_DC_DESER_VALUE = "deser_dc_10b_nobs";

localparam PMA_RX_DFE_DATARATE_BPS_VALUE = "3125000000";

localparam PMA_RX_DFE_TAPSUM_BW_SEL_VALUE = "tapsum_lowbw";
localparam PMA_RX_DFE_TAPSUM_BW_SEL_ADDR_OFST = 304;
localparam PMA_RX_DFE_TAPSUM_BW_SEL_ADDR_FIELD_OFST = 6;
localparam PMA_RX_DFE_TAPSUM_BW_SEL_ADDR_FIELD_HIGH = 7;
localparam PMA_RX_DFE_TAPSUM_BW_SEL_ADDR_FIELD_SIZE = 2;
localparam PMA_RX_DFE_TAPSUM_BW_SEL_ADDR_FIELD_BITMASK = 32'h000000C0;
localparam PMA_RX_DFE_TAPSUM_BW_SEL_ADDR_FIELD_VALMASK = 32'h000000C0;
localparam PMA_RX_DFE_TAPSUM_BW_SEL_ADDR_FIELD_VALUE = 2'h3;

localparam PMA_RX_ODI_DATARATE_BPS_VALUE = "3125000000";

localparam PMA_RX_ODI_XRX_PATH_X119_RX_PATH_RSTN_OVERRIDEB_VALUE = "use_sequencer";
localparam PMA_RX_ODI_XRX_PATH_X119_RX_PATH_RSTN_OVERRIDEB_ADDR_OFST = 377;
localparam PMA_RX_ODI_XRX_PATH_X119_RX_PATH_RSTN_OVERRIDEB_ADDR_FIELD_OFST = 1;
localparam PMA_RX_ODI_XRX_PATH_X119_RX_PATH_RSTN_OVERRIDEB_ADDR_FIELD_HIGH = 1;
localparam PMA_RX_ODI_XRX_PATH_X119_RX_PATH_RSTN_OVERRIDEB_ADDR_FIELD_SIZE = 1;
localparam PMA_RX_ODI_XRX_PATH_X119_RX_PATH_RSTN_OVERRIDEB_ADDR_FIELD_BITMASK = 32'h00000002;
localparam PMA_RX_ODI_XRX_PATH_X119_RX_PATH_RSTN_OVERRIDEB_ADDR_FIELD_VALMASK = 32'h00000002;
localparam PMA_RX_ODI_XRX_PATH_X119_RX_PATH_RSTN_OVERRIDEB_ADDR_FIELD_VALUE = 1'h1;

localparam PMA_TX_BUF_DATARATE_BPS_VALUE = "3125000000";

localparam PMA_TX_BUF_PM_CR2_TX_PATH_DATARATE_BPS_VALUE = "3125000000";

localparam PMA_TX_BUF_PM_CR2_TX_PATH_DATAWIDTH_VALUE = 8'd10;

localparam PMA_TX_BUF_PM_CR2_TX_PATH_PMA_TX_DIVCLK_HZ_VALUE = "312500000";

localparam PMA_TX_BUF_SLEW_RATE_CTRL_VALUE = "slew_r4";
localparam PMA_TX_BUF_SLEW_RATE_CTRL_ADDR_OFST = 268;
localparam PMA_TX_BUF_SLEW_RATE_CTRL_ADDR_FIELD_OFST = 0;
localparam PMA_TX_BUF_SLEW_RATE_CTRL_ADDR_FIELD_HIGH = 2;
localparam PMA_TX_BUF_SLEW_RATE_CTRL_ADDR_FIELD_SIZE = 3;
localparam PMA_TX_BUF_SLEW_RATE_CTRL_ADDR_FIELD_BITMASK = 32'h00000007;
localparam PMA_TX_BUF_SLEW_RATE_CTRL_ADDR_FIELD_VALMASK = 32'h00000004;
localparam PMA_TX_BUF_SLEW_RATE_CTRL_ADDR_FIELD_VALUE = 3'h4;

localparam PMA_TX_BUF_PM_CR2_TX_PATH_TX_PLL_CLK_HZ_VALUE = "1562500000";

localparam PMA_CGB_DATARATE_BPS_VALUE = "3125000000";

localparam PMA_CGB_SER_MODE_VALUE = "ten_bit";
localparam PMA_CGB_SER_MODE_ADDR_OFST = 272;
localparam PMA_CGB_SER_MODE_ADDR_FIELD_OFST = 0;
localparam PMA_CGB_SER_MODE_ADDR_FIELD_HIGH = 2;
localparam PMA_CGB_SER_MODE_ADDR_FIELD_SIZE = 3;
localparam PMA_CGB_SER_MODE_ADDR_FIELD_BITMASK = 32'h00000007;
localparam PMA_CGB_SER_MODE_ADDR_FIELD_VALMASK = 32'h00000004;
localparam PMA_CGB_SER_MODE_ADDR_FIELD_VALUE = 3'h4;

localparam PMA_CGB_INPUT_SELECT_X1_VALUE = "fpll_bot";

localparam PMA_RESET_SEQUENCER_RX_PATH_RSTN_OVERRIDEB_VALUE = "use_sequencer";

localparam PMA_TX_SEQUENCER_TX_PATH_RSTN_OVERRIDEB_VALUE = "bypass_sequencer";

localparam HSSI_FIFO_RX_PCS_PROT_MODE_VALUE = "non_teng_mode";
localparam HSSI_FIFO_RX_PCS_PROT_MODE_ADDR_OFST = 199;
localparam HSSI_FIFO_RX_PCS_PROT_MODE_ADDR_FIELD_OFST = 0;
localparam HSSI_FIFO_RX_PCS_PROT_MODE_ADDR_FIELD_HIGH = 0;
localparam HSSI_FIFO_RX_PCS_PROT_MODE_ADDR_FIELD_SIZE = 1;
localparam HSSI_FIFO_RX_PCS_PROT_MODE_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_FIFO_RX_PCS_PROT_MODE_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_FIFO_RX_PCS_PROT_MODE_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_FIFO_TX_PCS_PROT_MODE_VALUE = "non_teng_mode";
localparam HSSI_FIFO_TX_PCS_PROT_MODE_ADDR_OFST = 197;
localparam HSSI_FIFO_TX_PCS_PROT_MODE_ADDR_FIELD_OFST = 0;
localparam HSSI_FIFO_TX_PCS_PROT_MODE_ADDR_FIELD_HIGH = 0;
localparam HSSI_FIFO_TX_PCS_PROT_MODE_ADDR_FIELD_SIZE = 1;
localparam HSSI_FIFO_TX_PCS_PROT_MODE_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_FIFO_TX_PCS_PROT_MODE_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_FIFO_TX_PCS_PROT_MODE_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_PIPE_GEN1_2_PROT_MODE_VALUE = "basic";

localparam HSSI_PLDADAPT_RX_HDPLDADAPT_AIB_FABRIC_RX_TRANSFER_CLK_HZ_VALUE = 31'd156250000;

localparam HSSI_PLDADAPT_RX_FIFO_DOUBLE_READ_VALUE = "fifo_double_read_dis";
localparam HSSI_PLDADAPT_RX_FIFO_DOUBLE_READ_ADDR_OFST = 786;
localparam HSSI_PLDADAPT_RX_FIFO_DOUBLE_READ_ADDR_FIELD_OFST = 6;
localparam HSSI_PLDADAPT_RX_FIFO_DOUBLE_READ_ADDR_FIELD_HIGH = 6;
localparam HSSI_PLDADAPT_RX_FIFO_DOUBLE_READ_ADDR_FIELD_SIZE = 1;
localparam HSSI_PLDADAPT_RX_FIFO_DOUBLE_READ_ADDR_FIELD_BITMASK = 32'h00000040;
localparam HSSI_PLDADAPT_RX_FIFO_DOUBLE_READ_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_PLDADAPT_RX_FIFO_DOUBLE_READ_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_PLDADAPT_RX_FIFO_WIDTH_VALUE = "fifo_single_width";

localparam HSSI_PLDADAPT_RX_GB_RX_IDWIDTH_VALUE = "idwidth_32";

localparam HSSI_PLDADAPT_RX_GB_RX_ODWIDTH_VALUE = "odwidth_32";

localparam HSSI_PLDADAPT_RX_HDPLDADAPT_PLD_RX_CLK1_DCM_HZ_VALUE = 31'd156250000;

localparam HSSI_PLDADAPT_RX_HDPLDADAPT_PLD_RX_CLK1_ROWCLK_HZ_VALUE = 31'd156250000;

localparam HSSI_PLDADAPT_RX_RX_FIFO_POWER_MODE_VALUE = "full_width_ps_sw";
localparam HSSI_PLDADAPT_RX_RX_FIFO_POWER_MODE_ADDR_OFST = 794;
localparam HSSI_PLDADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_OFST = 2;
localparam HSSI_PLDADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_HIGH = 4;
localparam HSSI_PLDADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_SIZE = 3;
localparam HSSI_PLDADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_BITMASK = 32'h0000001C;
localparam HSSI_PLDADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_VALMASK = 32'h00000004;
localparam HSSI_PLDADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_VALUE = 3'h1;

localparam HSSI_PLDADAPT_RX_RXFIFO_EMPTY_VALUE = "empty_sw";
localparam HSSI_PLDADAPT_RX_RXFIFO_EMPTY_ADDR_OFST = 785;
localparam HSSI_PLDADAPT_RX_RXFIFO_EMPTY_ADDR_FIELD_OFST = 0;
localparam HSSI_PLDADAPT_RX_RXFIFO_EMPTY_ADDR_FIELD_HIGH = 5;
localparam HSSI_PLDADAPT_RX_RXFIFO_EMPTY_ADDR_FIELD_SIZE = 6;
localparam HSSI_PLDADAPT_RX_RXFIFO_EMPTY_ADDR_FIELD_BITMASK = 32'h0000003F;
localparam HSSI_PLDADAPT_RX_RXFIFO_EMPTY_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_PLDADAPT_RX_RXFIFO_EMPTY_ADDR_FIELD_VALUE = 6'h0;

localparam HSSI_PLDADAPT_RX_RXFIFO_FULL_VALUE = "full_pc_sw";
localparam HSSI_PLDADAPT_RX_RXFIFO_FULL_ADDR_OFST = 786;
localparam HSSI_PLDADAPT_RX_RXFIFO_FULL_ADDR_FIELD_OFST = 0;
localparam HSSI_PLDADAPT_RX_RXFIFO_FULL_ADDR_FIELD_HIGH = 5;
localparam HSSI_PLDADAPT_RX_RXFIFO_FULL_ADDR_FIELD_SIZE = 6;
localparam HSSI_PLDADAPT_RX_RXFIFO_FULL_ADDR_FIELD_BITMASK = 32'h0000003F;
localparam HSSI_PLDADAPT_RX_RXFIFO_FULL_ADDR_FIELD_VALMASK = 32'h00000007;
localparam HSSI_PLDADAPT_RX_RXFIFO_FULL_ADDR_FIELD_VALUE = 6'h7;

localparam HSSI_PLDADAPT_RX_RXFIFO_PFULL_VALUE = 6'd5;
localparam HSSI_PLDADAPT_RX_RXFIFO_PFULL_ADDR_OFST = 788;
localparam HSSI_PLDADAPT_RX_RXFIFO_PFULL_ADDR_FIELD_OFST = 0;
localparam HSSI_PLDADAPT_RX_RXFIFO_PFULL_ADDR_FIELD_HIGH = 5;
localparam HSSI_PLDADAPT_RX_RXFIFO_PFULL_ADDR_FIELD_SIZE = 6;
localparam HSSI_PLDADAPT_RX_RXFIFO_PFULL_ADDR_FIELD_BITMASK = 32'h0000003F;
localparam HSSI_PLDADAPT_RX_RXFIFO_PFULL_ADDR_FIELD_VALMASK = 32'h00000005;
localparam HSSI_PLDADAPT_RX_RXFIFO_PFULL_ADDR_FIELD_VALUE = 6'h5;

localparam HSSI_PLDADAPT_RX_STRETCH_NUM_STAGES_VALUE = "one_stage";
localparam HSSI_PLDADAPT_RX_STRETCH_NUM_STAGES_ADDR_OFST = 800;
localparam HSSI_PLDADAPT_RX_STRETCH_NUM_STAGES_ADDR_FIELD_OFST = 0;
localparam HSSI_PLDADAPT_RX_STRETCH_NUM_STAGES_ADDR_FIELD_HIGH = 2;
localparam HSSI_PLDADAPT_RX_STRETCH_NUM_STAGES_ADDR_FIELD_SIZE = 3;
localparam HSSI_PLDADAPT_RX_STRETCH_NUM_STAGES_ADDR_FIELD_BITMASK = 32'h00000007;
localparam HSSI_PLDADAPT_RX_STRETCH_NUM_STAGES_ADDR_FIELD_VALMASK = 32'h00000001;
localparam HSSI_PLDADAPT_RX_STRETCH_NUM_STAGES_ADDR_FIELD_VALUE = 3'h1;

localparam HSSI_PLDADAPT_RX_WORD_ALIGN_VALUE = "wa_dis";
localparam HSSI_PLDADAPT_RX_WORD_ALIGN_ADDR_OFST = 792;
localparam HSSI_PLDADAPT_RX_WORD_ALIGN_ADDR_FIELD_OFST = 0;
localparam HSSI_PLDADAPT_RX_WORD_ALIGN_ADDR_FIELD_HIGH = 0;
localparam HSSI_PLDADAPT_RX_WORD_ALIGN_ADDR_FIELD_SIZE = 1;
localparam HSSI_PLDADAPT_RX_WORD_ALIGN_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_PLDADAPT_RX_WORD_ALIGN_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_PLDADAPT_RX_WORD_ALIGN_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_PLDADAPT_RX_WORD_ALIGN_ENABLE_VALUE = "disable";

localparam HSSI_PLDADAPT_TX_HDPLDADAPT_AIB_FABRIC_PMA_AIB_TX_CLK_HZ_VALUE = 31'd156250000;

localparam HSSI_PLDADAPT_TX_FIFO_DOUBLE_WRITE_VALUE = "fifo_double_write_dis";
localparam HSSI_PLDADAPT_TX_FIFO_DOUBLE_WRITE_ADDR_OFST = 774;
localparam HSSI_PLDADAPT_TX_FIFO_DOUBLE_WRITE_ADDR_FIELD_OFST = 7;
localparam HSSI_PLDADAPT_TX_FIFO_DOUBLE_WRITE_ADDR_FIELD_HIGH = 7;
localparam HSSI_PLDADAPT_TX_FIFO_DOUBLE_WRITE_ADDR_FIELD_SIZE = 1;
localparam HSSI_PLDADAPT_TX_FIFO_DOUBLE_WRITE_ADDR_FIELD_BITMASK = 32'h00000080;
localparam HSSI_PLDADAPT_TX_FIFO_DOUBLE_WRITE_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_PLDADAPT_TX_FIFO_DOUBLE_WRITE_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_PLDADAPT_TX_FIFO_WIDTH_VALUE = "fifo_single_width";

localparam HSSI_PLDADAPT_TX_GB_TX_IDWIDTH_VALUE = "idwidth_32";
localparam HSSI_PLDADAPT_TX_GB_TX_IDWIDTH_ADDR_OFST = 774;
localparam HSSI_PLDADAPT_TX_GB_TX_IDWIDTH_ADDR_FIELD_OFST = 1;
localparam HSSI_PLDADAPT_TX_GB_TX_IDWIDTH_ADDR_FIELD_HIGH = 3;
localparam HSSI_PLDADAPT_TX_GB_TX_IDWIDTH_ADDR_FIELD_SIZE = 3;
localparam HSSI_PLDADAPT_TX_GB_TX_IDWIDTH_ADDR_FIELD_BITMASK = 32'h0000000E;
localparam HSSI_PLDADAPT_TX_GB_TX_IDWIDTH_ADDR_FIELD_VALMASK = 32'h00000008;
localparam HSSI_PLDADAPT_TX_GB_TX_IDWIDTH_ADDR_FIELD_VALUE = 3'h4;

localparam HSSI_PLDADAPT_TX_GB_TX_ODWIDTH_VALUE = "odwidth_32";
localparam HSSI_PLDADAPT_TX_GB_TX_ODWIDTH_ADDR_OFST = 774;
localparam HSSI_PLDADAPT_TX_GB_TX_ODWIDTH_ADDR_FIELD_OFST = 4;
localparam HSSI_PLDADAPT_TX_GB_TX_ODWIDTH_ADDR_FIELD_HIGH = 5;
localparam HSSI_PLDADAPT_TX_GB_TX_ODWIDTH_ADDR_FIELD_SIZE = 2;
localparam HSSI_PLDADAPT_TX_GB_TX_ODWIDTH_ADDR_FIELD_BITMASK = 32'h00000030;
localparam HSSI_PLDADAPT_TX_GB_TX_ODWIDTH_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_PLDADAPT_TX_GB_TX_ODWIDTH_ADDR_FIELD_VALUE = 2'h0;

localparam HSSI_PLDADAPT_TX_PHCOMP_RD_DEL_VALUE = "phcomp_rd_del2";
localparam HSSI_PLDADAPT_TX_PHCOMP_RD_DEL_ADDR_OFST = 769;
localparam HSSI_PLDADAPT_TX_PHCOMP_RD_DEL_ADDR_FIELD_OFST = 5;
localparam HSSI_PLDADAPT_TX_PHCOMP_RD_DEL_ADDR_FIELD_HIGH = 7;
localparam HSSI_PLDADAPT_TX_PHCOMP_RD_DEL_ADDR_FIELD_SIZE = 3;
localparam HSSI_PLDADAPT_TX_PHCOMP_RD_DEL_ADDR_FIELD_BITMASK = 32'h000000E0;
localparam HSSI_PLDADAPT_TX_PHCOMP_RD_DEL_ADDR_FIELD_VALMASK = 32'h00000040;
localparam HSSI_PLDADAPT_TX_PHCOMP_RD_DEL_ADDR_FIELD_VALUE = 3'h2;

localparam HSSI_PLDADAPT_TX_HDPLDADAPT_PLD_TX_CLK1_DCM_HZ_VALUE = 31'd156250000;

localparam HSSI_PLDADAPT_TX_HDPLDADAPT_PLD_TX_CLK1_ROWCLK_HZ_VALUE = 31'd156250000;

localparam HSSI_PLDADAPT_TX_HDPLDADAPT_PLD_TX_CLK2_DCM_HZ_VALUE = 31'd156250000;

localparam HSSI_PLDADAPT_TX_HDPLDADAPT_PLD_TX_CLK2_ROWCLK_HZ_VALUE = 31'd156250000;

localparam HSSI_PLDADAPT_TX_PMA_AIB_TX_CLK_EXPECTED_SETTING_VALUE = "not_used";

localparam HSSI_PLDADAPT_TX_STRETCH_NUM_STAGES_VALUE = "one_stage";
localparam HSSI_PLDADAPT_TX_STRETCH_NUM_STAGES_ADDR_OFST = 784;
localparam HSSI_PLDADAPT_TX_STRETCH_NUM_STAGES_ADDR_FIELD_OFST = 0;
localparam HSSI_PLDADAPT_TX_STRETCH_NUM_STAGES_ADDR_FIELD_HIGH = 2;
localparam HSSI_PLDADAPT_TX_STRETCH_NUM_STAGES_ADDR_FIELD_SIZE = 3;
localparam HSSI_PLDADAPT_TX_STRETCH_NUM_STAGES_ADDR_FIELD_BITMASK = 32'h00000007;
localparam HSSI_PLDADAPT_TX_STRETCH_NUM_STAGES_ADDR_FIELD_VALMASK = 32'h00000001;
localparam HSSI_PLDADAPT_TX_STRETCH_NUM_STAGES_ADDR_FIELD_VALUE = 3'h1;

localparam HSSI_PLDADAPT_TX_TX_FIFO_POWER_MODE_VALUE = "full_width_ps_sw";
localparam HSSI_PLDADAPT_TX_TX_FIFO_POWER_MODE_ADDR_OFST = 771;
localparam HSSI_PLDADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_OFST = 5;
localparam HSSI_PLDADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_HIGH = 7;
localparam HSSI_PLDADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_SIZE = 3;
localparam HSSI_PLDADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_BITMASK = 32'h000000E0;
localparam HSSI_PLDADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_VALMASK = 32'h00000020;
localparam HSSI_PLDADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_VALUE = 3'h1;

localparam HSSI_PLDADAPT_TX_TXFIFO_FULL_VALUE = "full_pc_sw";
localparam HSSI_PLDADAPT_TX_TXFIFO_FULL_ADDR_OFST = 769;
localparam HSSI_PLDADAPT_TX_TXFIFO_FULL_ADDR_FIELD_OFST = 0;
localparam HSSI_PLDADAPT_TX_TXFIFO_FULL_ADDR_FIELD_HIGH = 4;
localparam HSSI_PLDADAPT_TX_TXFIFO_FULL_ADDR_FIELD_SIZE = 5;
localparam HSSI_PLDADAPT_TX_TXFIFO_FULL_ADDR_FIELD_BITMASK = 32'h0000001F;
localparam HSSI_PLDADAPT_TX_TXFIFO_FULL_ADDR_FIELD_VALMASK = 32'h00000007;
localparam HSSI_PLDADAPT_TX_TXFIFO_FULL_ADDR_FIELD_VALUE = 5'h7;

localparam HSSI_PLDADAPT_TX_TXFIFO_PFULL_VALUE = 5'd5;
localparam HSSI_PLDADAPT_TX_TXFIFO_PFULL_ADDR_OFST = 771;
localparam HSSI_PLDADAPT_TX_TXFIFO_PFULL_ADDR_FIELD_OFST = 0;
localparam HSSI_PLDADAPT_TX_TXFIFO_PFULL_ADDR_FIELD_HIGH = 4;
localparam HSSI_PLDADAPT_TX_TXFIFO_PFULL_ADDR_FIELD_SIZE = 5;
localparam HSSI_PLDADAPT_TX_TXFIFO_PFULL_ADDR_FIELD_BITMASK = 32'h0000001F;
localparam HSSI_PLDADAPT_TX_TXFIFO_PFULL_ADDR_FIELD_VALMASK = 32'h00000005;
localparam HSSI_PLDADAPT_TX_TXFIFO_PFULL_ADDR_FIELD_VALUE = 5'h5;

localparam HSSI_PLDADAPT_TX_WORD_ALIGN_ENABLE_VALUE = "disable";

localparam HSSI_PLDADAPT_TX_WORD_MARK_VALUE = "wm_dis";
localparam HSSI_PLDADAPT_TX_WORD_MARK_ADDR_OFST = 777;
localparam HSSI_PLDADAPT_TX_WORD_MARK_ADDR_FIELD_OFST = 5;
localparam HSSI_PLDADAPT_TX_WORD_MARK_ADDR_FIELD_HIGH = 5;
localparam HSSI_PLDADAPT_TX_WORD_MARK_ADDR_FIELD_SIZE = 1;
localparam HSSI_PLDADAPT_TX_WORD_MARK_ADDR_FIELD_BITMASK = 32'h00000020;
localparam HSSI_PLDADAPT_TX_WORD_MARK_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_PLDADAPT_TX_WORD_MARK_ADDR_FIELD_VALUE = 1'h0;

localparam PMA_CDR_REFCLK_REFCLK_SELECT_VALUE = "ref_iqclk0";

localparam HSSI_RX_PCS_PMA_INTERFACE_BLOCK_SEL_VALUE = "eight_g_pcs";
localparam HSSI_RX_PCS_PMA_INTERFACE_BLOCK_SEL_ADDR_OFST = 10;
localparam HSSI_RX_PCS_PMA_INTERFACE_BLOCK_SEL_ADDR_FIELD_OFST = 0;
localparam HSSI_RX_PCS_PMA_INTERFACE_BLOCK_SEL_ADDR_FIELD_HIGH = 1;
localparam HSSI_RX_PCS_PMA_INTERFACE_BLOCK_SEL_ADDR_FIELD_SIZE = 2;
localparam HSSI_RX_PCS_PMA_INTERFACE_BLOCK_SEL_ADDR_FIELD_BITMASK = 32'h00000003;
localparam HSSI_RX_PCS_PMA_INTERFACE_BLOCK_SEL_ADDR_FIELD_VALMASK = 32'h00000001;
localparam HSSI_RX_PCS_PMA_INTERFACE_BLOCK_SEL_ADDR_FIELD_VALUE = 2'h1;

localparam HSSI_RX_PCS_PMA_INTERFACE_PMA_DW_RX_VALUE = "pma_10b_rx";

localparam HSSI_RX_PCS_PMA_INTERFACE_PROT_MODE_RX_VALUE = "eightg_basic_mode_rx";

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_CLKLOW_CLK_HZ_VALUE = 30'd125000000;

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_FREF_CLK_HZ_VALUE = 30'd125000000;

localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_BLOCK_SEL_VALUE = "eightg";
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_BLOCK_SEL_ADDR_OFST = 36;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_BLOCK_SEL_ADDR_FIELD_OFST = 0;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_BLOCK_SEL_ADDR_FIELD_HIGH = 1;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_BLOCK_SEL_ADDR_FIELD_SIZE = 2;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_BLOCK_SEL_ADDR_FIELD_BITMASK = 32'h00000003;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_BLOCK_SEL_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_BLOCK_SEL_ADDR_FIELD_VALUE = 2'h0;

localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_CLK_OUT_SEL_VALUE = "eightg_clk_out";
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_CLK_OUT_SEL_ADDR_OFST = 36;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_CLK_OUT_SEL_ADDR_FIELD_OFST = 6;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_CLK_OUT_SEL_ADDR_FIELD_HIGH = 7;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_CLK_OUT_SEL_ADDR_FIELD_SIZE = 2;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_CLK_OUT_SEL_ADDR_FIELD_BITMASK = 32'h000000C0;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_CLK_OUT_SEL_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_CLK_OUT_SEL_ADDR_FIELD_VALUE = 2'h0;

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS10G_PMA_DW_RX_VALUE = "pma_64b_rx";

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PMA_DW_RX_VALUE = "pma_10b_rx";

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PMA_IF_PMA_DW_RX_VALUE = "pma_10b_rx";

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PMA_RX_CLK_HZ_VALUE = 30'd312500000;

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS10G_PROT_MODE_RX_VALUE = "disabled_prot_mode_rx";

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS8G_PROT_MODE_RX_VALUE = "basic_rm_disable_rx";

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PROT_MODE_RX_VALUE = "basic_8gpcs_rm_disable_rx";

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PLD_IF_PROT_MODE_RX_VALUE = "eightg_and_g3_reg_mode_rx";

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PMA_IF_PROT_MODE_RX_VALUE = "eightg_basic_mode_rx";

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_SHARE_FIFO_MEM_PROT_MODE_RX_VALUE = "non_teng_mode_rx";

localparam HSSI_TX_PCS_PMA_INTERFACE_PMA_DW_TX_VALUE = "pma_10b_tx";

localparam HSSI_TX_PCS_PMA_INTERFACE_PROT_MODE_TX_VALUE = "eightg_basic_mode_tx";

localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_VALUE = "eight_g_pcs";
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR0_OFST = 6;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR0_FIELD_OFST = 0;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR0_FIELD_HIGH = 2;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR0_FIELD_SIZE = 3;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR0_FIELD_BITMASK = 32'h00000007;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR0_FIELD_VALMASK = 32'h00000002;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR0_FIELD_VALUE = 3'h2;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR1_OFST = 8;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR1_FIELD_OFST = 5;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR1_FIELD_HIGH = 6;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR1_FIELD_SIZE = 2;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR1_FIELD_BITMASK = 32'h00000060;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR1_FIELD_VALMASK = 32'h00000000;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR1_FIELD_VALUE = 2'h0;

localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_OUT_SEL_VALUE = "eightg_clk_out";
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_OUT_SEL_ADDR_OFST = 34;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_OUT_SEL_ADDR_FIELD_OFST = 0;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_OUT_SEL_ADDR_FIELD_HIGH = 1;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_OUT_SEL_ADDR_FIELD_SIZE = 2;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_OUT_SEL_ADDR_FIELD_BITMASK = 32'h00000003;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_OUT_SEL_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_OUT_SEL_ADDR_FIELD_VALUE = 2'h0;

localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_SOURCE_VALUE = "eightg";
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_SOURCE_ADDR_OFST = 34;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_SOURCE_ADDR_FIELD_OFST = 2;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_SOURCE_ADDR_FIELD_HIGH = 3;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_SOURCE_ADDR_FIELD_SIZE = 2;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_SOURCE_ADDR_FIELD_BITMASK = 32'h0000000C;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_SOURCE_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_SOURCE_ADDR_FIELD_VALUE = 2'h0;

localparam HSSI_TX_PLD_PCS_INTERFACE_HD_PCS10G_PMA_DW_TX_VALUE = "pma_64b_tx";

localparam HSSI_TX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PMA_DW_TX_VALUE = "pma_10b_tx";

localparam HSSI_TX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PMA_IF_PMA_DW_TX_VALUE = "pma_10b_tx";

localparam HSSI_TX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PMA_TX_CLK_HZ_VALUE = 30'd312500000;

localparam HSSI_TX_PLD_PCS_INTERFACE_HD_PCS10G_PROT_MODE_TX_VALUE = "disabled_prot_mode_tx";

localparam HSSI_TX_PLD_PCS_INTERFACE_HD_PCS8G_PROT_MODE_TX_VALUE = "basic_tx";

localparam HSSI_TX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PROT_MODE_TX_VALUE = "basic_8gpcs_tx";

localparam HSSI_TX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PLD_IF_PROT_MODE_TX_VALUE = "eightg_and_g3_reg_mode_tx";

localparam HSSI_TX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PMA_IF_PROT_MODE_TX_VALUE = "eightg_basic_mode_tx";

localparam HSSI_TX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_SHARE_FIFO_MEM_PROT_MODE_TX_VALUE = "non_teng_mode_tx";

endpackage