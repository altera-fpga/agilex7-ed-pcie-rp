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

package alt_mge_phy_reconfig_parameters_CFG2;

localparam ram_depth = 77;
function [26:0] get_ram_data;
  input integer index;
  automatic reg [0:76][26:0] ram_data = {
    27'h0060703, // [26:16]-DPRIO address=0x006; [15:8]-bit mask=0x07; [2:0]-hssi_tx_pcs_pma_interface_tx_pma_data_sel=ten_g_pcs(3'h3);
    27'h00A0302, // [26:16]-DPRIO address=0x00A; [15:8]-bit mask=0x03; [1:0]-hssi_rx_pcs_pma_interface_block_sel=ten_g_pcs(2'h2);
    27'h0220F05, // [26:16]-DPRIO address=0x022; [15:8]-bit mask=0x0F; [3:2]-hssi_tx_pld_pcs_interface_pcs_tx_clk_source=teng(2'h1); [1:0]-hssi_tx_pld_pcs_interface_pcs_tx_clk_out_sel=teng_clk_out(2'h1);
    27'h024C341, // [26:16]-DPRIO address=0x024; [15:8]-bit mask=0xC3; [7:6]-hssi_rx_pld_pcs_interface_pcs_rx_clk_out_sel=teng_clk_out(2'h1); [1:0]-hssi_rx_pld_pcs_interface_pcs_rx_block_sel=teng(2'h1);
    27'h02D6000, // [26:16]-DPRIO address=0x02D; [15:8]-bit mask=0x60; [6:5]-hssi_8g_tx_pcs_byte_serializer=dis_bs(2'h0);
    27'h02E0101, // [26:16]-DPRIO address=0x02E; [15:8]-bit mask=0x01; [0:0]-hssi_8g_tx_pcs_clock_gate_bs_enc=en_bs_enc_clk_gating(1'h1);
    27'h0300808, // [26:16]-DPRIO address=0x030; [15:8]-bit mask=0x08; [3:3]-hssi_8g_tx_pcs_clock_gate_fiford=en_fiford_clk_gating(1'h1);
    27'h0330702, // [26:16]-DPRIO address=0x033; [15:8]-bit mask=0x07; [2:0]-hssi_8g_rx_pcs_wa_pd=wa_pd_10(3'h2);
    27'h038FF00, // [26:16]-DPRIO address=0x038; [15:8]-bit mask=0xFF; [7:0]-hssi_8g_rx_pcs_wa_pd_data=0(8'h0);
    27'h03A1808, // [26:16]-DPRIO address=0x03A; [15:8]-bit mask=0x18; [4:3]-hssi_8g_rx_pcs_wa_rosnumber_data=1(2'h1);
    27'h044E000, // [26:16]-DPRIO address=0x044; [15:8]-bit mask=0xE0; [7:5]-hssi_8g_rx_pcs_byte_deserializer=dis_bds(3'h0);
    27'h0481C00, // [26:16]-DPRIO address=0x048; [15:8]-bit mask=0x1C; [4:2]-hssi_8g_rx_pcs_test_bus_sel=tx_testbus(3'h0);
    27'h04D0505, // [26:16]-DPRIO address=0x04D; [15:8]-bit mask=0x05; [2:2]-hssi_8g_rx_pcs_clock_gate_sw_pc_wrclk=en_sw_pc_wrclk_gating(1'h1); [0:0]-hssi_8g_rx_pcs_clock_gate_pc_rdclk=en_pc_rdclk_gating(1'h1);
    27'h051C0C0, // [26:16]-DPRIO address=0x051; [15:8]-bit mask=0xC0; [7:7]-hssi_8g_rx_pcs_clock_gate_bds_dec_asn=en_bds_dec_asn_clk_gating(1'h1); [6:6]-hssi_8g_rx_pcs_clock_gate_sw_wa=en_sw_wa_clk_gating(1'h1);
    27'h0700E00, // [26:16]-DPRIO address=0x070; [15:8]-bit mask=0x0E; [3:3]-hssi_10g_tx_pcs_scrm_bypass=scrm_bypass_dis(1'h0); [2:2]-hssi_10g_tx_pcs_tx_sm_bypass=tx_sm_bypass_dis(1'h0); [1:1]-hssi_10g_tx_pcs_enc_64b66b_txsm_bypass=enc_64b66b_txsm_bypass_dis(1'h0);
    27'h0863131, // [26:16]-DPRIO address=0x086; [15:8]-bit mask=0x31; [5:5]-hssi_10g_tx_pcs_enc64b66b_txsm_clken=enc64b66b_txsm_clk_en(1'h1); [4:4]-hssi_10g_tx_pcs_scrm_clken=scrm_clk_en(1'h1); [0:0]-hssi_10g_tx_pcs_gbred_clken=gbred_clk_en(1'h1);
    27'h0870707, // [26:16]-DPRIO address=0x087; [15:8]-bit mask=0x07; [2:2]-hssi_10g_tx_pcs_ctrl_bit_reverse=ctrl_bit_reverse_en(1'h1); [1:1]-hssi_10g_tx_pcs_wrfifo_clken=wrfifo_clk_en(1'h1); [0:0]-hssi_10g_tx_pcs_rdfifo_clken=rdfifo_clk_en(1'h1);
    27'h0881F08, // [26:16]-DPRIO address=0x088; [15:8]-bit mask=0x1F; [4:3]-hssi_10g_tx_pcs_gb_tx_odwidth=odwidth_40(2'h1); [2:0]-hssi_10g_tx_pcs_gb_tx_idwidth=idwidth_66(3'h0);
    27'h0892020, // [26:16]-DPRIO address=0x089; [15:8]-bit mask=0x20; [5:5]-hssi_10g_tx_pcs_sh_err=sh_err_en(1'h1);
    27'h08D0400, // [26:16]-DPRIO address=0x08D; [15:8]-bit mask=0x04; [2:2]-hssi_10g_tx_pcs_fastpath=fastpath_dis(1'h0);
    27'h0900200, // [26:16]-DPRIO address=0x090; [15:8]-bit mask=0x02; [1:1]-hssi_10g_tx_pcs_tx_sh_location=lsb(1'h0);
    27'h096CE80, // [26:16]-DPRIO address=0x096; [15:8]-bit mask=0xCE; [7:7]-hssi_10g_rx_pcs_clr_errblk_cnt_en=enable(1'h1); [6:6]-hssi_10g_rx_pcs_blksync_bypass=blksync_bypass_dis(1'h0); [3:3]-hssi_10g_rx_pcs_descrm_bypass=descrm_bypass_dis(1'h0); [2:2]-hssi_10g_rx_pcs_rx_sm_bypass=rx_sm_bypass_dis(1'h0); [1:1]-hssi_10g_rx_pcs_dec_64b66b_rxsm_bypass=dec_64b66b_rxsm_bypass_dis(1'h0);
    27'h0A01F08, // [26:16]-DPRIO address=0x0A0; [15:8]-bit mask=0x1F; [4:3]-hssi_10g_rx_pcs_gb_rx_idwidth=idwidth_40(2'h1); [2:0]-hssi_10g_rx_pcs_gb_rx_odwidth=odwidth_66(3'h0);
    27'h0A2BBBB, // [26:16]-DPRIO address=0x0A2; [15:8]-bit mask=0xBB; [7:7]-hssi_10g_rx_pcs_descrm_clken=descrm_clk_en(1'h1); [5:5]-hssi_10g_rx_pcs_dec64b66b_clken=dec64b66b_clk_en(1'h1); [4:4]-hssi_10g_rx_pcs_ber_clken=ber_clk_en(1'h1); [3:3]-hssi_10g_rx_pcs_rand_clken=rand_clk_en(1'h1); [1:1]-hssi_10g_rx_pcs_wrfifo_clken=wrfifo_clk_en(1'h1); [0:0]-hssi_10g_rx_pcs_rdfifo_clken=rdfifo_clk_en(1'h1);
    27'h0A30A0A, // [26:16]-DPRIO address=0x0A3; [15:8]-bit mask=0x0A; [3:3]-hssi_10g_rx_pcs_gbexp_clken=gbexp_clk_en(1'h1); [1:1]-hssi_10g_rx_pcs_blksync_clken=blksync_clk_en(1'h1);
    27'h0A98000, // [26:16]-DPRIO address=0x0A9; [15:8]-bit mask=0x80; [7:7]-hssi_10g_rx_pcs_fast_path=fast_path_dis(1'h0);
    27'h0AC0202, // [26:16]-DPRIO address=0x0AC; [15:8]-bit mask=0x02; [1:1]-hssi_10g_rx_pcs_ctrl_bit_reverse=ctrl_bit_reverse_en(1'h1);
    27'h0B00200, // [26:16]-DPRIO address=0x0B0; [15:8]-bit mask=0x02; [1:1]-hssi_10g_rx_pcs_rx_sh_location=lsb(1'h0);
    27'h0C50101, // [26:16]-DPRIO address=0x0C5; [15:8]-bit mask=0x01; [0:0]-hssi_fifo_tx_pcs_prot_mode=teng_mode(1'h1);
    27'h0C70101, // [26:16]-DPRIO address=0x0C7; [15:8]-bit mask=0x01; [0:0]-hssi_fifo_rx_pcs_prot_mode=teng_mode(1'h1);
    27'h10C0705, // [26:16]-DPRIO address=0x10C; [15:8]-bit mask=0x07; [2:0]-pma_tx_buf_slew_rate_ctrl=slew_r5(3'h5);
    27'h1100706, // [26:16]-DPRIO address=0x110; [15:8]-bit mask=0x07; [2:0]-pma_cgb_ser_mode=forty_bit(3'h6);
    27'h11F3010, // [26:16]-DPRIO address=0x11F; [15:8]-bit mask=0x30; [5:4]-pma_rx_buf_eq_bw_sel=eq_bw_1(2'h1);
    27'h12E3010, // [26:16]-DPRIO address=0x12E; [15:8]-bit mask=0x30; [5:4]-pma_rx_buf_ctle_tia_isel=ib_tia_bw1(2'h1);
    27'h130C040, // [26:16]-DPRIO address=0x130; [15:8]-bit mask=0xC0; [7:6]-pma_rx_dfe_tapsum_bw_sel=tapsum_medbw(2'h1);
    27'h1320F05, // [26:16]-DPRIO address=0x132; [15:8]-bit mask=0x0F; [3:0]-cdr_pll_set_cdr_vco_speed_fix=92(4'h5);
    27'h133E060, // [26:16]-DPRIO address=0x133; [15:8]-bit mask=0xE0; [7:5]-cdr_pll_chgpmp_current_up_pd=cp_current_pd_up_setting3(3'h3);
    27'h1350F0E, // [26:16]-DPRIO address=0x135; [15:8]-bit mask=0x0F; [3:2]-cdr_pll_lf_resistor_pd=lf_pd_setting3(2'h3); [1:0]-cdr_pll_lf_resistor_pfd=lf_pfd_setting2(2'h2);
    27'h1360F0C, // [26:16]-DPRIO address=0x136; [15:8]-bit mask=0x0F; [3:0]-cdr_pll_set_cdr_vco_speed_fix=92(4'hC);
    27'h1373C08, // [26:16]-DPRIO address=0x137; [15:8]-bit mask=0x3C; [5:2]-cdr_pll_set_cdr_vco_speed=2(4'h2);
    27'h1393F1A, // [26:16]-DPRIO address=0x139; [15:8]-bit mask=0x3F; [5:3]-cdr_pll_chgpmp_current_dn_pd=cp_current_pd_dn_setting3(3'h3); [2:0]-cdr_pll_chgpmp_current_pfd=cp_current_pfd_setting2(3'h2);
    27'h13AFF5B, // [26:16]-DPRIO address=0x13A; [15:8]-bit mask=0xFF; [7:6]-cdr_pll_fref_clklow_div=2(2'h1); [5:3]-cdr_pll_pd_l_counter=2(3'h3); [2:0]-cdr_pll_pfd_l_counter=2(3'h3);
    27'h13BFF10, // [26:16]-DPRIO address=0x13B; [15:8]-bit mask=0xFF; [7:0]-cdr_pll_mcnt_div=16(8'h10);
    27'h13C0C04, // [26:16]-DPRIO address=0x13C; [15:8]-bit mask=0x0C; [3:2]-cdr_pll_ncnt_div=2(2'h1);
    27'h13F0F07, // [26:16]-DPRIO address=0x13F; [15:8]-bit mask=0x0F; [3:0]-pma_rx_deser_deser_factor=deser_40b(4'h7);
    27'h1400706, // [26:16]-DPRIO address=0x140; [15:8]-bit mask=0x07; [2:0]-pma_rx_deser_clkdivrx_user_mode=clkdivrx_user_div33(3'h6);
    27'h1480400, // [26:16]-DPRIO address=0x148; [15:8]-bit mask=0x04; [2:2]-pma_rx_buf_eq_cdgen_sel=eq_cdgen_2(1'h0);
    27'h159FF95, // [26:16]-DPRIO address=0x159; [15:8]-bit mask=0xFF; [7:0]-cdr_pll_set_cdr_input_freq_range=149(8'h95);
    27'h1648000, // [26:16]-DPRIO address=0x164; [15:8]-bit mask=0x80; [7:7]-pma_rx_deser_deser_aibck_x1=normal(1'h0);
    27'h1721010, // [26:16]-DPRIO address=0x172; [15:8]-bit mask=0x10; [4:4]-pma_rx_buf_eq_isel=eq_isel_1(1'h1);
    27'h1790202, // [26:16]-DPRIO address=0x179; [15:8]-bit mask=0x02; [1:1]-pma_rx_odi_xrx_path_x119_rx_path_rstn_overrideb=use_sequencer(1'h1);
    27'h2001F07, // [26:16]-DPRIO address=0x200; [15:8]-bit mask=0x1F; [4:0]-hssi_adapt_tx_datapath_mapping_mode=map_10g_2x2x_2x1x_fifo(5'h7);
    27'h2031F0F, // [26:16]-DPRIO address=0x203; [15:8]-bit mask=0x1F; [4:0]-hssi_adapt_tx_txfifo_full=full_dw(5'hF);
    27'h2040101, // [26:16]-DPRIO address=0x204; [15:8]-bit mask=0x01; [0:0]-hssi_adapt_tx_fifo_double_read=fifo_double_read_en(1'h1);
    27'h2080707, // [26:16]-DPRIO address=0x208; [15:8]-bit mask=0x07; [2:1]-hssi_adapt_tx_tx_fifo_power_mode=full_width_full_depth(2'h3); [0:0]-hssi_adapt_tx_word_align=wa_en(1'h1);
    27'h20C1800, // [26:16]-DPRIO address=0x20C; [15:8]-bit mask=0x18; [4:3]-hssi_adapt_tx_aib_clk_sel=aib_clk_pma_aib_tx_clk(2'h0);
    27'h2101F07, // [26:16]-DPRIO address=0x210; [15:8]-bit mask=0x1F; [4:0]-hssi_adapt_rx_datapath_mapping_mode=map_10g_2x2x_2x1x_fifo(5'h7);
    27'h2128080, // [26:16]-DPRIO address=0x212; [15:8]-bit mask=0x80; [7:7]-hssi_adapt_rx_word_mark=wm_en(1'h1);
    27'h213FF6E, // [26:16]-DPRIO address=0x213; [15:8]-bit mask=0xFF; [7:5]-hssi_adapt_rx_phcomp_rd_del=phcomp_rd_del3(3'h3); [4:0]-hssi_adapt_rx_rxfifo_full=full_dw(5'hE);
    27'h2140101, // [26:16]-DPRIO address=0x214; [15:8]-bit mask=0x01; [0:0]-hssi_adapt_rx_fifo_double_write=fifo_double_write_en(1'h1);
    27'h218C0C0, // [26:16]-DPRIO address=0x218; [15:8]-bit mask=0xC0; [7:6]-hssi_adapt_rx_rx_fifo_power_mode=full_width_full_depth(2'h3);
    27'h2231C00, // [26:16]-DPRIO address=0x223; [15:8]-bit mask=0x1C; [4:2]-hssi_adapt_rx_fifo_rd_clk_sel=fifo_rd_pma_aib_rx_clk(3'h0);
    27'h22E0400, // [26:16]-DPRIO address=0x22E; [15:8]-bit mask=0x04; [2:2]-hssi_aibcr_tx_aib_dllstr_align_dy_ctlsel=aib_dllstr_align_dy_ctlsel_setting0(1'h0);
    27'h2301818, // [26:16]-DPRIO address=0x230; [15:8]-bit mask=0x18; [4:4]-hssi_aibcr_rx_aib_rx_dcc_en=aib_rx_dcc_enable(1'h1); [3:3]-hssi_aibcr_rx_aib_rx_dcc_byp=aib_rx_dcc_byp_disable(1'h1);
    27'h301FF6E, // [26:16]-DPRIO address=0x301; [15:8]-bit mask=0xFF; [7:5]-hssi_pldadapt_tx_phcomp_rd_del=phcomp_rd_del3(3'h3); [4:0]-hssi_pldadapt_tx_txfifo_full=full_pc_dw(5'hE);
    27'h303FF6A, // [26:16]-DPRIO address=0x303; [15:8]-bit mask=0xFF; [7:5]-hssi_pldadapt_tx_tx_fifo_power_mode=full_width_ps_dw(3'h3); [4:0]-hssi_pldadapt_tx_txfifo_pfull=10(5'hA);
    27'h306BE90, // [26:16]-DPRIO address=0x306; [15:8]-bit mask=0xBE; [7:7]-hssi_pldadapt_tx_fifo_double_write=fifo_double_write_en(1'h1); [5:4]-hssi_pldadapt_tx_gb_tx_odwidth=odwidth_40(2'h1); [3:1]-hssi_pldadapt_tx_gb_tx_idwidth=idwidth_66(3'h0);
    27'h3092020, // [26:16]-DPRIO address=0x309; [15:8]-bit mask=0x20; [5:5]-hssi_pldadapt_tx_word_mark=wm_en(1'h1);
    27'h3100702, // [26:16]-DPRIO address=0x310; [15:8]-bit mask=0x07; [2:0]-hssi_pldadapt_tx_stretch_num_stages=two_stage(3'h2);
    27'h3113F01, // [26:16]-DPRIO address=0x311; [15:8]-bit mask=0x3F; [5:0]-hssi_pldadapt_rx_rxfifo_empty=empty_dw(6'h1);
    27'h3127F4F, // [26:16]-DPRIO address=0x312; [15:8]-bit mask=0x7F; [6:6]-hssi_pldadapt_rx_fifo_double_read=fifo_double_read_en(1'h1); [5:0]-hssi_pldadapt_rx_rxfifo_full=full_pc_dw(6'hF);
    27'h3143F0A, // [26:16]-DPRIO address=0x314; [15:8]-bit mask=0x3F; [5:0]-hssi_pldadapt_rx_rxfifo_pfull=10(6'hA);
    27'h3180101, // [26:16]-DPRIO address=0x318; [15:8]-bit mask=0x01; [0:0]-hssi_pldadapt_rx_word_align=wa_en(1'h1);
    27'h31A1C0C, // [26:16]-DPRIO address=0x31A; [15:8]-bit mask=0x1C; [4:2]-hssi_pldadapt_rx_rx_fifo_power_mode=full_width_ps_dw(3'h3);
    27'h3200702, // [26:16]-DPRIO address=0x320; [15:8]-bit mask=0x07; [2:0]-hssi_pldadapt_rx_stretch_num_stages=two_stage(3'h2);
    27'h32C0400, // [26:16]-DPRIO address=0x32C; [15:8]-bit mask=0x04; [2:2]-hssi_aibnd_rx_aib_dllstr_align_dy_ctlsel=aib_dllstr_align_dy_ctlsel_setting0(1'h0);
    27'h32E1818  // [26:16]-DPRIO address=0x32E; [15:8]-bit mask=0x18; [4:4]-hssi_aibnd_tx_aib_tx_dcc_en=aib_tx_dcc_enable(1'h1); [3:3]-hssi_aibnd_tx_aib_tx_dcc_byp=aib_tx_dcc_byp_disable(1'h1);
};

  begin
  get_ram_data = ram_data[index];
  end
endfunction

localparam PLL_SELECT_VALUE = 2;

localparam CDR_REFCLK_SELECT_VALUE = 1;

localparam HSSI_10G_RX_PCS_BER_CLKEN_VALUE = "ber_clk_en";
localparam HSSI_10G_RX_PCS_BER_CLKEN_ADDR_OFST = 162;
localparam HSSI_10G_RX_PCS_BER_CLKEN_ADDR_FIELD_OFST = 4;
localparam HSSI_10G_RX_PCS_BER_CLKEN_ADDR_FIELD_HIGH = 4;
localparam HSSI_10G_RX_PCS_BER_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_BER_CLKEN_ADDR_FIELD_BITMASK = 32'h00000010;
localparam HSSI_10G_RX_PCS_BER_CLKEN_ADDR_FIELD_VALMASK = 32'h00000010;
localparam HSSI_10G_RX_PCS_BER_CLKEN_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_RX_PCS_BLKSYNC_BYPASS_VALUE = "blksync_bypass_dis";
localparam HSSI_10G_RX_PCS_BLKSYNC_BYPASS_ADDR_OFST = 150;
localparam HSSI_10G_RX_PCS_BLKSYNC_BYPASS_ADDR_FIELD_OFST = 6;
localparam HSSI_10G_RX_PCS_BLKSYNC_BYPASS_ADDR_FIELD_HIGH = 6;
localparam HSSI_10G_RX_PCS_BLKSYNC_BYPASS_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_BLKSYNC_BYPASS_ADDR_FIELD_BITMASK = 32'h00000040;
localparam HSSI_10G_RX_PCS_BLKSYNC_BYPASS_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_RX_PCS_BLKSYNC_BYPASS_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_RX_PCS_BLKSYNC_CLKEN_VALUE = "blksync_clk_en";
localparam HSSI_10G_RX_PCS_BLKSYNC_CLKEN_ADDR_OFST = 163;
localparam HSSI_10G_RX_PCS_BLKSYNC_CLKEN_ADDR_FIELD_OFST = 1;
localparam HSSI_10G_RX_PCS_BLKSYNC_CLKEN_ADDR_FIELD_HIGH = 1;
localparam HSSI_10G_RX_PCS_BLKSYNC_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_BLKSYNC_CLKEN_ADDR_FIELD_BITMASK = 32'h00000002;
localparam HSSI_10G_RX_PCS_BLKSYNC_CLKEN_ADDR_FIELD_VALMASK = 32'h00000002;
localparam HSSI_10G_RX_PCS_BLKSYNC_CLKEN_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_RX_PCS_CLR_ERRBLK_CNT_EN_VALUE = "enable";
localparam HSSI_10G_RX_PCS_CLR_ERRBLK_CNT_EN_ADDR_OFST = 150;
localparam HSSI_10G_RX_PCS_CLR_ERRBLK_CNT_EN_ADDR_FIELD_OFST = 7;
localparam HSSI_10G_RX_PCS_CLR_ERRBLK_CNT_EN_ADDR_FIELD_HIGH = 7;
localparam HSSI_10G_RX_PCS_CLR_ERRBLK_CNT_EN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_CLR_ERRBLK_CNT_EN_ADDR_FIELD_BITMASK = 32'h00000080;
localparam HSSI_10G_RX_PCS_CLR_ERRBLK_CNT_EN_ADDR_FIELD_VALMASK = 32'h00000080;
localparam HSSI_10G_RX_PCS_CLR_ERRBLK_CNT_EN_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_RX_PCS_CTRL_BIT_REVERSE_VALUE = "ctrl_bit_reverse_en";
localparam HSSI_10G_RX_PCS_CTRL_BIT_REVERSE_ADDR_OFST = 172;
localparam HSSI_10G_RX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_OFST = 1;
localparam HSSI_10G_RX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_HIGH = 1;
localparam HSSI_10G_RX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_BITMASK = 32'h00000002;
localparam HSSI_10G_RX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_VALMASK = 32'h00000002;
localparam HSSI_10G_RX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_RX_PCS_DEC64B66B_CLKEN_VALUE = "dec64b66b_clk_en";
localparam HSSI_10G_RX_PCS_DEC64B66B_CLKEN_ADDR_OFST = 162;
localparam HSSI_10G_RX_PCS_DEC64B66B_CLKEN_ADDR_FIELD_OFST = 5;
localparam HSSI_10G_RX_PCS_DEC64B66B_CLKEN_ADDR_FIELD_HIGH = 5;
localparam HSSI_10G_RX_PCS_DEC64B66B_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_DEC64B66B_CLKEN_ADDR_FIELD_BITMASK = 32'h00000020;
localparam HSSI_10G_RX_PCS_DEC64B66B_CLKEN_ADDR_FIELD_VALMASK = 32'h00000020;
localparam HSSI_10G_RX_PCS_DEC64B66B_CLKEN_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_RX_PCS_DEC_64B66B_RXSM_BYPASS_VALUE = "dec_64b66b_rxsm_bypass_dis";
localparam HSSI_10G_RX_PCS_DEC_64B66B_RXSM_BYPASS_ADDR_OFST = 150;
localparam HSSI_10G_RX_PCS_DEC_64B66B_RXSM_BYPASS_ADDR_FIELD_OFST = 1;
localparam HSSI_10G_RX_PCS_DEC_64B66B_RXSM_BYPASS_ADDR_FIELD_HIGH = 1;
localparam HSSI_10G_RX_PCS_DEC_64B66B_RXSM_BYPASS_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_DEC_64B66B_RXSM_BYPASS_ADDR_FIELD_BITMASK = 32'h00000002;
localparam HSSI_10G_RX_PCS_DEC_64B66B_RXSM_BYPASS_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_RX_PCS_DEC_64B66B_RXSM_BYPASS_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_RX_PCS_DESCRM_BYPASS_VALUE = "descrm_bypass_dis";
localparam HSSI_10G_RX_PCS_DESCRM_BYPASS_ADDR_OFST = 150;
localparam HSSI_10G_RX_PCS_DESCRM_BYPASS_ADDR_FIELD_OFST = 3;
localparam HSSI_10G_RX_PCS_DESCRM_BYPASS_ADDR_FIELD_HIGH = 3;
localparam HSSI_10G_RX_PCS_DESCRM_BYPASS_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_DESCRM_BYPASS_ADDR_FIELD_BITMASK = 32'h00000008;
localparam HSSI_10G_RX_PCS_DESCRM_BYPASS_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_RX_PCS_DESCRM_BYPASS_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_RX_PCS_DESCRM_CLKEN_VALUE = "descrm_clk_en";
localparam HSSI_10G_RX_PCS_DESCRM_CLKEN_ADDR_OFST = 162;
localparam HSSI_10G_RX_PCS_DESCRM_CLKEN_ADDR_FIELD_OFST = 7;
localparam HSSI_10G_RX_PCS_DESCRM_CLKEN_ADDR_FIELD_HIGH = 7;
localparam HSSI_10G_RX_PCS_DESCRM_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_DESCRM_CLKEN_ADDR_FIELD_BITMASK = 32'h00000080;
localparam HSSI_10G_RX_PCS_DESCRM_CLKEN_ADDR_FIELD_VALMASK = 32'h00000080;
localparam HSSI_10G_RX_PCS_DESCRM_CLKEN_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_RX_PCS_FAST_PATH_VALUE = "fast_path_dis";
localparam HSSI_10G_RX_PCS_FAST_PATH_ADDR_OFST = 169;
localparam HSSI_10G_RX_PCS_FAST_PATH_ADDR_FIELD_OFST = 7;
localparam HSSI_10G_RX_PCS_FAST_PATH_ADDR_FIELD_HIGH = 7;
localparam HSSI_10G_RX_PCS_FAST_PATH_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_FAST_PATH_ADDR_FIELD_BITMASK = 32'h00000080;
localparam HSSI_10G_RX_PCS_FAST_PATH_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_RX_PCS_FAST_PATH_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_RX_PCS_GB_RX_IDWIDTH_VALUE = "idwidth_40";
localparam HSSI_10G_RX_PCS_GB_RX_IDWIDTH_ADDR_OFST = 160;
localparam HSSI_10G_RX_PCS_GB_RX_IDWIDTH_ADDR_FIELD_OFST = 3;
localparam HSSI_10G_RX_PCS_GB_RX_IDWIDTH_ADDR_FIELD_HIGH = 4;
localparam HSSI_10G_RX_PCS_GB_RX_IDWIDTH_ADDR_FIELD_SIZE = 2;
localparam HSSI_10G_RX_PCS_GB_RX_IDWIDTH_ADDR_FIELD_BITMASK = 32'h00000018;
localparam HSSI_10G_RX_PCS_GB_RX_IDWIDTH_ADDR_FIELD_VALMASK = 32'h00000008;
localparam HSSI_10G_RX_PCS_GB_RX_IDWIDTH_ADDR_FIELD_VALUE = 2'h1;

localparam HSSI_10G_RX_PCS_GB_RX_ODWIDTH_VALUE = "odwidth_66";
localparam HSSI_10G_RX_PCS_GB_RX_ODWIDTH_ADDR_OFST = 160;
localparam HSSI_10G_RX_PCS_GB_RX_ODWIDTH_ADDR_FIELD_OFST = 0;
localparam HSSI_10G_RX_PCS_GB_RX_ODWIDTH_ADDR_FIELD_HIGH = 2;
localparam HSSI_10G_RX_PCS_GB_RX_ODWIDTH_ADDR_FIELD_SIZE = 3;
localparam HSSI_10G_RX_PCS_GB_RX_ODWIDTH_ADDR_FIELD_BITMASK = 32'h00000007;
localparam HSSI_10G_RX_PCS_GB_RX_ODWIDTH_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_RX_PCS_GB_RX_ODWIDTH_ADDR_FIELD_VALUE = 3'h0;

localparam HSSI_10G_RX_PCS_GBEXP_CLKEN_VALUE = "gbexp_clk_en";
localparam HSSI_10G_RX_PCS_GBEXP_CLKEN_ADDR_OFST = 163;
localparam HSSI_10G_RX_PCS_GBEXP_CLKEN_ADDR_FIELD_OFST = 3;
localparam HSSI_10G_RX_PCS_GBEXP_CLKEN_ADDR_FIELD_HIGH = 3;
localparam HSSI_10G_RX_PCS_GBEXP_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_GBEXP_CLKEN_ADDR_FIELD_BITMASK = 32'h00000008;
localparam HSSI_10G_RX_PCS_GBEXP_CLKEN_ADDR_FIELD_VALMASK = 32'h00000008;
localparam HSSI_10G_RX_PCS_GBEXP_CLKEN_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_RX_PCS_PROT_MODE_VALUE = "teng_1588_mode";

localparam HSSI_10G_RX_PCS_RAND_CLKEN_VALUE = "rand_clk_en";
localparam HSSI_10G_RX_PCS_RAND_CLKEN_ADDR_OFST = 162;
localparam HSSI_10G_RX_PCS_RAND_CLKEN_ADDR_FIELD_OFST = 3;
localparam HSSI_10G_RX_PCS_RAND_CLKEN_ADDR_FIELD_HIGH = 3;
localparam HSSI_10G_RX_PCS_RAND_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_RAND_CLKEN_ADDR_FIELD_BITMASK = 32'h00000008;
localparam HSSI_10G_RX_PCS_RAND_CLKEN_ADDR_FIELD_VALMASK = 32'h00000008;
localparam HSSI_10G_RX_PCS_RAND_CLKEN_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_RX_PCS_RDFIFO_CLKEN_VALUE = "rdfifo_clk_en";
localparam HSSI_10G_RX_PCS_RDFIFO_CLKEN_ADDR_OFST = 162;
localparam HSSI_10G_RX_PCS_RDFIFO_CLKEN_ADDR_FIELD_OFST = 0;
localparam HSSI_10G_RX_PCS_RDFIFO_CLKEN_ADDR_FIELD_HIGH = 0;
localparam HSSI_10G_RX_PCS_RDFIFO_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_RDFIFO_CLKEN_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_10G_RX_PCS_RDFIFO_CLKEN_ADDR_FIELD_VALMASK = 32'h00000001;
localparam HSSI_10G_RX_PCS_RDFIFO_CLKEN_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_RX_PCS_RX_SH_LOCATION_VALUE = "lsb";
localparam HSSI_10G_RX_PCS_RX_SH_LOCATION_ADDR_OFST = 176;
localparam HSSI_10G_RX_PCS_RX_SH_LOCATION_ADDR_FIELD_OFST = 1;
localparam HSSI_10G_RX_PCS_RX_SH_LOCATION_ADDR_FIELD_HIGH = 1;
localparam HSSI_10G_RX_PCS_RX_SH_LOCATION_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_RX_SH_LOCATION_ADDR_FIELD_BITMASK = 32'h00000002;
localparam HSSI_10G_RX_PCS_RX_SH_LOCATION_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_RX_PCS_RX_SH_LOCATION_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_RX_PCS_RX_SM_BYPASS_VALUE = "rx_sm_bypass_dis";
localparam HSSI_10G_RX_PCS_RX_SM_BYPASS_ADDR_OFST = 150;
localparam HSSI_10G_RX_PCS_RX_SM_BYPASS_ADDR_FIELD_OFST = 2;
localparam HSSI_10G_RX_PCS_RX_SM_BYPASS_ADDR_FIELD_HIGH = 2;
localparam HSSI_10G_RX_PCS_RX_SM_BYPASS_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_RX_SM_BYPASS_ADDR_FIELD_BITMASK = 32'h00000004;
localparam HSSI_10G_RX_PCS_RX_SM_BYPASS_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_RX_PCS_RX_SM_BYPASS_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_RX_PCS_WRFIFO_CLKEN_VALUE = "wrfifo_clk_en";
localparam HSSI_10G_RX_PCS_WRFIFO_CLKEN_ADDR_OFST = 162;
localparam HSSI_10G_RX_PCS_WRFIFO_CLKEN_ADDR_FIELD_OFST = 1;
localparam HSSI_10G_RX_PCS_WRFIFO_CLKEN_ADDR_FIELD_HIGH = 1;
localparam HSSI_10G_RX_PCS_WRFIFO_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_RX_PCS_WRFIFO_CLKEN_ADDR_FIELD_BITMASK = 32'h00000002;
localparam HSSI_10G_RX_PCS_WRFIFO_CLKEN_ADDR_FIELD_VALMASK = 32'h00000002;
localparam HSSI_10G_RX_PCS_WRFIFO_CLKEN_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_TX_PCS_CTRL_BIT_REVERSE_VALUE = "ctrl_bit_reverse_en";
localparam HSSI_10G_TX_PCS_CTRL_BIT_REVERSE_ADDR_OFST = 135;
localparam HSSI_10G_TX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_OFST = 2;
localparam HSSI_10G_TX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_HIGH = 2;
localparam HSSI_10G_TX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_BITMASK = 32'h00000004;
localparam HSSI_10G_TX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_VALMASK = 32'h00000004;
localparam HSSI_10G_TX_PCS_CTRL_BIT_REVERSE_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_TX_PCS_ENC64B66B_TXSM_CLKEN_VALUE = "enc64b66b_txsm_clk_en";
localparam HSSI_10G_TX_PCS_ENC64B66B_TXSM_CLKEN_ADDR_OFST = 134;
localparam HSSI_10G_TX_PCS_ENC64B66B_TXSM_CLKEN_ADDR_FIELD_OFST = 5;
localparam HSSI_10G_TX_PCS_ENC64B66B_TXSM_CLKEN_ADDR_FIELD_HIGH = 5;
localparam HSSI_10G_TX_PCS_ENC64B66B_TXSM_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_ENC64B66B_TXSM_CLKEN_ADDR_FIELD_BITMASK = 32'h00000020;
localparam HSSI_10G_TX_PCS_ENC64B66B_TXSM_CLKEN_ADDR_FIELD_VALMASK = 32'h00000020;
localparam HSSI_10G_TX_PCS_ENC64B66B_TXSM_CLKEN_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_TX_PCS_ENC_64B66B_TXSM_BYPASS_VALUE = "enc_64b66b_txsm_bypass_dis";
localparam HSSI_10G_TX_PCS_ENC_64B66B_TXSM_BYPASS_ADDR_OFST = 112;
localparam HSSI_10G_TX_PCS_ENC_64B66B_TXSM_BYPASS_ADDR_FIELD_OFST = 1;
localparam HSSI_10G_TX_PCS_ENC_64B66B_TXSM_BYPASS_ADDR_FIELD_HIGH = 1;
localparam HSSI_10G_TX_PCS_ENC_64B66B_TXSM_BYPASS_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_ENC_64B66B_TXSM_BYPASS_ADDR_FIELD_BITMASK = 32'h00000002;
localparam HSSI_10G_TX_PCS_ENC_64B66B_TXSM_BYPASS_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_TX_PCS_ENC_64B66B_TXSM_BYPASS_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_TX_PCS_FASTPATH_VALUE = "fastpath_dis";
localparam HSSI_10G_TX_PCS_FASTPATH_ADDR_OFST = 141;
localparam HSSI_10G_TX_PCS_FASTPATH_ADDR_FIELD_OFST = 2;
localparam HSSI_10G_TX_PCS_FASTPATH_ADDR_FIELD_HIGH = 2;
localparam HSSI_10G_TX_PCS_FASTPATH_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_FASTPATH_ADDR_FIELD_BITMASK = 32'h00000004;
localparam HSSI_10G_TX_PCS_FASTPATH_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_TX_PCS_FASTPATH_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_TX_PCS_GB_TX_IDWIDTH_VALUE = "idwidth_66";
localparam HSSI_10G_TX_PCS_GB_TX_IDWIDTH_ADDR_OFST = 136;
localparam HSSI_10G_TX_PCS_GB_TX_IDWIDTH_ADDR_FIELD_OFST = 0;
localparam HSSI_10G_TX_PCS_GB_TX_IDWIDTH_ADDR_FIELD_HIGH = 2;
localparam HSSI_10G_TX_PCS_GB_TX_IDWIDTH_ADDR_FIELD_SIZE = 3;
localparam HSSI_10G_TX_PCS_GB_TX_IDWIDTH_ADDR_FIELD_BITMASK = 32'h00000007;
localparam HSSI_10G_TX_PCS_GB_TX_IDWIDTH_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_TX_PCS_GB_TX_IDWIDTH_ADDR_FIELD_VALUE = 3'h0;

localparam HSSI_10G_TX_PCS_GB_TX_ODWIDTH_VALUE = "odwidth_40";
localparam HSSI_10G_TX_PCS_GB_TX_ODWIDTH_ADDR_OFST = 136;
localparam HSSI_10G_TX_PCS_GB_TX_ODWIDTH_ADDR_FIELD_OFST = 3;
localparam HSSI_10G_TX_PCS_GB_TX_ODWIDTH_ADDR_FIELD_HIGH = 4;
localparam HSSI_10G_TX_PCS_GB_TX_ODWIDTH_ADDR_FIELD_SIZE = 2;
localparam HSSI_10G_TX_PCS_GB_TX_ODWIDTH_ADDR_FIELD_BITMASK = 32'h00000018;
localparam HSSI_10G_TX_PCS_GB_TX_ODWIDTH_ADDR_FIELD_VALMASK = 32'h00000008;
localparam HSSI_10G_TX_PCS_GB_TX_ODWIDTH_ADDR_FIELD_VALUE = 2'h1;

localparam HSSI_10G_TX_PCS_GBRED_CLKEN_VALUE = "gbred_clk_en";
localparam HSSI_10G_TX_PCS_GBRED_CLKEN_ADDR_OFST = 134;
localparam HSSI_10G_TX_PCS_GBRED_CLKEN_ADDR_FIELD_OFST = 0;
localparam HSSI_10G_TX_PCS_GBRED_CLKEN_ADDR_FIELD_HIGH = 0;
localparam HSSI_10G_TX_PCS_GBRED_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_GBRED_CLKEN_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_10G_TX_PCS_GBRED_CLKEN_ADDR_FIELD_VALMASK = 32'h00000001;
localparam HSSI_10G_TX_PCS_GBRED_CLKEN_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_TX_PCS_PROT_MODE_VALUE = "teng_1588_mode";

localparam HSSI_10G_TX_PCS_RDFIFO_CLKEN_VALUE = "rdfifo_clk_en";
localparam HSSI_10G_TX_PCS_RDFIFO_CLKEN_ADDR_OFST = 135;
localparam HSSI_10G_TX_PCS_RDFIFO_CLKEN_ADDR_FIELD_OFST = 0;
localparam HSSI_10G_TX_PCS_RDFIFO_CLKEN_ADDR_FIELD_HIGH = 0;
localparam HSSI_10G_TX_PCS_RDFIFO_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_RDFIFO_CLKEN_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_10G_TX_PCS_RDFIFO_CLKEN_ADDR_FIELD_VALMASK = 32'h00000001;
localparam HSSI_10G_TX_PCS_RDFIFO_CLKEN_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_TX_PCS_SCRM_BYPASS_VALUE = "scrm_bypass_dis";
localparam HSSI_10G_TX_PCS_SCRM_BYPASS_ADDR_OFST = 112;
localparam HSSI_10G_TX_PCS_SCRM_BYPASS_ADDR_FIELD_OFST = 3;
localparam HSSI_10G_TX_PCS_SCRM_BYPASS_ADDR_FIELD_HIGH = 3;
localparam HSSI_10G_TX_PCS_SCRM_BYPASS_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_SCRM_BYPASS_ADDR_FIELD_BITMASK = 32'h00000008;
localparam HSSI_10G_TX_PCS_SCRM_BYPASS_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_TX_PCS_SCRM_BYPASS_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_TX_PCS_SCRM_CLKEN_VALUE = "scrm_clk_en";
localparam HSSI_10G_TX_PCS_SCRM_CLKEN_ADDR_OFST = 134;
localparam HSSI_10G_TX_PCS_SCRM_CLKEN_ADDR_FIELD_OFST = 4;
localparam HSSI_10G_TX_PCS_SCRM_CLKEN_ADDR_FIELD_HIGH = 4;
localparam HSSI_10G_TX_PCS_SCRM_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_SCRM_CLKEN_ADDR_FIELD_BITMASK = 32'h00000010;
localparam HSSI_10G_TX_PCS_SCRM_CLKEN_ADDR_FIELD_VALMASK = 32'h00000010;
localparam HSSI_10G_TX_PCS_SCRM_CLKEN_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_TX_PCS_SH_ERR_VALUE = "sh_err_en";
localparam HSSI_10G_TX_PCS_SH_ERR_ADDR_OFST = 137;
localparam HSSI_10G_TX_PCS_SH_ERR_ADDR_FIELD_OFST = 5;
localparam HSSI_10G_TX_PCS_SH_ERR_ADDR_FIELD_HIGH = 5;
localparam HSSI_10G_TX_PCS_SH_ERR_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_SH_ERR_ADDR_FIELD_BITMASK = 32'h00000020;
localparam HSSI_10G_TX_PCS_SH_ERR_ADDR_FIELD_VALMASK = 32'h00000020;
localparam HSSI_10G_TX_PCS_SH_ERR_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_10G_TX_PCS_TX_SH_LOCATION_VALUE = "lsb";
localparam HSSI_10G_TX_PCS_TX_SH_LOCATION_ADDR_OFST = 144;
localparam HSSI_10G_TX_PCS_TX_SH_LOCATION_ADDR_FIELD_OFST = 1;
localparam HSSI_10G_TX_PCS_TX_SH_LOCATION_ADDR_FIELD_HIGH = 1;
localparam HSSI_10G_TX_PCS_TX_SH_LOCATION_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_TX_SH_LOCATION_ADDR_FIELD_BITMASK = 32'h00000002;
localparam HSSI_10G_TX_PCS_TX_SH_LOCATION_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_TX_PCS_TX_SH_LOCATION_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_TX_PCS_TX_SM_BYPASS_VALUE = "tx_sm_bypass_dis";
localparam HSSI_10G_TX_PCS_TX_SM_BYPASS_ADDR_OFST = 112;
localparam HSSI_10G_TX_PCS_TX_SM_BYPASS_ADDR_FIELD_OFST = 2;
localparam HSSI_10G_TX_PCS_TX_SM_BYPASS_ADDR_FIELD_HIGH = 2;
localparam HSSI_10G_TX_PCS_TX_SM_BYPASS_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_TX_SM_BYPASS_ADDR_FIELD_BITMASK = 32'h00000004;
localparam HSSI_10G_TX_PCS_TX_SM_BYPASS_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_10G_TX_PCS_TX_SM_BYPASS_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_10G_TX_PCS_WRFIFO_CLKEN_VALUE = "wrfifo_clk_en";
localparam HSSI_10G_TX_PCS_WRFIFO_CLKEN_ADDR_OFST = 135;
localparam HSSI_10G_TX_PCS_WRFIFO_CLKEN_ADDR_FIELD_OFST = 1;
localparam HSSI_10G_TX_PCS_WRFIFO_CLKEN_ADDR_FIELD_HIGH = 1;
localparam HSSI_10G_TX_PCS_WRFIFO_CLKEN_ADDR_FIELD_SIZE = 1;
localparam HSSI_10G_TX_PCS_WRFIFO_CLKEN_ADDR_FIELD_BITMASK = 32'h00000002;
localparam HSSI_10G_TX_PCS_WRFIFO_CLKEN_ADDR_FIELD_VALMASK = 32'h00000002;
localparam HSSI_10G_TX_PCS_WRFIFO_CLKEN_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_8G_RX_PCS_BYTE_DESERIALIZER_VALUE = "dis_bds";
localparam HSSI_8G_RX_PCS_BYTE_DESERIALIZER_ADDR_OFST = 68;
localparam HSSI_8G_RX_PCS_BYTE_DESERIALIZER_ADDR_FIELD_OFST = 5;
localparam HSSI_8G_RX_PCS_BYTE_DESERIALIZER_ADDR_FIELD_HIGH = 7;
localparam HSSI_8G_RX_PCS_BYTE_DESERIALIZER_ADDR_FIELD_SIZE = 3;
localparam HSSI_8G_RX_PCS_BYTE_DESERIALIZER_ADDR_FIELD_BITMASK = 32'h000000E0;
localparam HSSI_8G_RX_PCS_BYTE_DESERIALIZER_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_8G_RX_PCS_BYTE_DESERIALIZER_ADDR_FIELD_VALUE = 3'h0;

localparam HSSI_8G_RX_PCS_CLOCK_GATE_BDS_DEC_ASN_VALUE = "en_bds_dec_asn_clk_gating";
localparam HSSI_8G_RX_PCS_CLOCK_GATE_BDS_DEC_ASN_ADDR_OFST = 81;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_BDS_DEC_ASN_ADDR_FIELD_OFST = 7;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_BDS_DEC_ASN_ADDR_FIELD_HIGH = 7;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_BDS_DEC_ASN_ADDR_FIELD_SIZE = 1;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_BDS_DEC_ASN_ADDR_FIELD_BITMASK = 32'h00000080;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_BDS_DEC_ASN_ADDR_FIELD_VALMASK = 32'h00000080;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_BDS_DEC_ASN_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_8G_RX_PCS_CLOCK_GATE_PC_RDCLK_VALUE = "en_pc_rdclk_gating";
localparam HSSI_8G_RX_PCS_CLOCK_GATE_PC_RDCLK_ADDR_OFST = 77;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_PC_RDCLK_ADDR_FIELD_OFST = 0;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_PC_RDCLK_ADDR_FIELD_HIGH = 0;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_PC_RDCLK_ADDR_FIELD_SIZE = 1;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_PC_RDCLK_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_PC_RDCLK_ADDR_FIELD_VALMASK = 32'h00000001;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_PC_RDCLK_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_PC_WRCLK_VALUE = "en_sw_pc_wrclk_gating";
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_PC_WRCLK_ADDR_OFST = 77;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_PC_WRCLK_ADDR_FIELD_OFST = 2;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_PC_WRCLK_ADDR_FIELD_HIGH = 2;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_PC_WRCLK_ADDR_FIELD_SIZE = 1;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_PC_WRCLK_ADDR_FIELD_BITMASK = 32'h00000004;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_PC_WRCLK_ADDR_FIELD_VALMASK = 32'h00000004;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_PC_WRCLK_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_WA_VALUE = "en_sw_wa_clk_gating";
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_WA_ADDR_OFST = 81;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_WA_ADDR_FIELD_OFST = 6;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_WA_ADDR_FIELD_HIGH = 6;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_WA_ADDR_FIELD_SIZE = 1;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_WA_ADDR_FIELD_BITMASK = 32'h00000040;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_WA_ADDR_FIELD_VALMASK = 32'h00000040;
localparam HSSI_8G_RX_PCS_CLOCK_GATE_SW_WA_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_8G_RX_PCS_PROT_MODE_VALUE = "disabled_prot_mode";

localparam HSSI_8G_RX_PCS_TEST_BUS_SEL_VALUE = "tx_testbus";
localparam HSSI_8G_RX_PCS_TEST_BUS_SEL_ADDR_OFST = 72;
localparam HSSI_8G_RX_PCS_TEST_BUS_SEL_ADDR_FIELD_OFST = 2;
localparam HSSI_8G_RX_PCS_TEST_BUS_SEL_ADDR_FIELD_HIGH = 4;
localparam HSSI_8G_RX_PCS_TEST_BUS_SEL_ADDR_FIELD_SIZE = 3;
localparam HSSI_8G_RX_PCS_TEST_BUS_SEL_ADDR_FIELD_BITMASK = 32'h0000001C;
localparam HSSI_8G_RX_PCS_TEST_BUS_SEL_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_8G_RX_PCS_TEST_BUS_SEL_ADDR_FIELD_VALUE = 3'h0;

localparam HSSI_8G_RX_PCS_WA_PD_VALUE = "wa_pd_10";
localparam HSSI_8G_RX_PCS_WA_PD_ADDR_OFST = 51;
localparam HSSI_8G_RX_PCS_WA_PD_ADDR_FIELD_OFST = 0;
localparam HSSI_8G_RX_PCS_WA_PD_ADDR_FIELD_HIGH = 2;
localparam HSSI_8G_RX_PCS_WA_PD_ADDR_FIELD_SIZE = 3;
localparam HSSI_8G_RX_PCS_WA_PD_ADDR_FIELD_BITMASK = 32'h00000007;
localparam HSSI_8G_RX_PCS_WA_PD_ADDR_FIELD_VALMASK = 32'h00000002;
localparam HSSI_8G_RX_PCS_WA_PD_ADDR_FIELD_VALUE = 3'h2;

localparam HSSI_8G_RX_PCS_WA_PD_DATA_VALUE = "0";
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
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR4_FIELD_VALMASK = 32'h00000000;
localparam HSSI_8G_RX_PCS_WA_PD_DATA_ADDR4_FIELD_VALUE = 8'h0;

localparam HSSI_8G_RX_PCS_WA_ROSNUMBER_DATA_VALUE = 2'd1;
localparam HSSI_8G_RX_PCS_WA_ROSNUMBER_DATA_ADDR_OFST = 58;
localparam HSSI_8G_RX_PCS_WA_ROSNUMBER_DATA_ADDR_FIELD_OFST = 3;
localparam HSSI_8G_RX_PCS_WA_ROSNUMBER_DATA_ADDR_FIELD_HIGH = 4;
localparam HSSI_8G_RX_PCS_WA_ROSNUMBER_DATA_ADDR_FIELD_SIZE = 2;
localparam HSSI_8G_RX_PCS_WA_ROSNUMBER_DATA_ADDR_FIELD_BITMASK = 32'h00000018;
localparam HSSI_8G_RX_PCS_WA_ROSNUMBER_DATA_ADDR_FIELD_VALMASK = 32'h00000008;
localparam HSSI_8G_RX_PCS_WA_ROSNUMBER_DATA_ADDR_FIELD_VALUE = 2'h1;

localparam HSSI_8G_RX_PCS_WA_SYNC_SM_CTRL_VALUE = "gige_sync_sm";
localparam HSSI_8G_RX_PCS_WA_SYNC_SM_CTRL_ADDR_OFST = 58;
localparam HSSI_8G_RX_PCS_WA_SYNC_SM_CTRL_ADDR_FIELD_OFST = 5;
localparam HSSI_8G_RX_PCS_WA_SYNC_SM_CTRL_ADDR_FIELD_HIGH = 5;
localparam HSSI_8G_RX_PCS_WA_SYNC_SM_CTRL_ADDR_FIELD_SIZE = 1;
localparam HSSI_8G_RX_PCS_WA_SYNC_SM_CTRL_ADDR_FIELD_BITMASK = 32'h00000020;
localparam HSSI_8G_RX_PCS_WA_SYNC_SM_CTRL_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_8G_RX_PCS_WA_SYNC_SM_CTRL_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_8G_TX_PCS_BYTE_SERIALIZER_VALUE = "dis_bs";
localparam HSSI_8G_TX_PCS_BYTE_SERIALIZER_ADDR_OFST = 45;
localparam HSSI_8G_TX_PCS_BYTE_SERIALIZER_ADDR_FIELD_OFST = 5;
localparam HSSI_8G_TX_PCS_BYTE_SERIALIZER_ADDR_FIELD_HIGH = 6;
localparam HSSI_8G_TX_PCS_BYTE_SERIALIZER_ADDR_FIELD_SIZE = 2;
localparam HSSI_8G_TX_PCS_BYTE_SERIALIZER_ADDR_FIELD_BITMASK = 32'h00000060;
localparam HSSI_8G_TX_PCS_BYTE_SERIALIZER_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_8G_TX_PCS_BYTE_SERIALIZER_ADDR_FIELD_VALUE = 2'h0;

localparam HSSI_8G_TX_PCS_CLOCK_GATE_BS_ENC_VALUE = "en_bs_enc_clk_gating";
localparam HSSI_8G_TX_PCS_CLOCK_GATE_BS_ENC_ADDR_OFST = 46;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_BS_ENC_ADDR_FIELD_OFST = 0;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_BS_ENC_ADDR_FIELD_HIGH = 0;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_BS_ENC_ADDR_FIELD_SIZE = 1;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_BS_ENC_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_BS_ENC_ADDR_FIELD_VALMASK = 32'h00000001;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_BS_ENC_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_8G_TX_PCS_CLOCK_GATE_FIFORD_VALUE = "en_fiford_clk_gating";
localparam HSSI_8G_TX_PCS_CLOCK_GATE_FIFORD_ADDR_OFST = 48;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_FIFORD_ADDR_FIELD_OFST = 3;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_FIFORD_ADDR_FIELD_HIGH = 3;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_FIFORD_ADDR_FIELD_SIZE = 1;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_FIFORD_ADDR_FIELD_BITMASK = 32'h00000008;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_FIFORD_ADDR_FIELD_VALMASK = 32'h00000008;
localparam HSSI_8G_TX_PCS_CLOCK_GATE_FIFORD_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_8G_TX_PCS_PROT_MODE_VALUE = "disabled_prot_mode";

localparam HSSI_ADAPT_RX_DATAPATH_MAPPING_MODE_VALUE = "map_10g_2x2x_2x1x_fifo";
localparam HSSI_ADAPT_RX_DATAPATH_MAPPING_MODE_ADDR_OFST = 528;
localparam HSSI_ADAPT_RX_DATAPATH_MAPPING_MODE_ADDR_FIELD_OFST = 0;
localparam HSSI_ADAPT_RX_DATAPATH_MAPPING_MODE_ADDR_FIELD_HIGH = 4;
localparam HSSI_ADAPT_RX_DATAPATH_MAPPING_MODE_ADDR_FIELD_SIZE = 5;
localparam HSSI_ADAPT_RX_DATAPATH_MAPPING_MODE_ADDR_FIELD_BITMASK = 32'h0000001F;
localparam HSSI_ADAPT_RX_DATAPATH_MAPPING_MODE_ADDR_FIELD_VALMASK = 32'h00000007;
localparam HSSI_ADAPT_RX_DATAPATH_MAPPING_MODE_ADDR_FIELD_VALUE = 5'h7;

localparam HSSI_ADAPT_RX_FIFO_DOUBLE_WRITE_VALUE = "fifo_double_write_en";
localparam HSSI_ADAPT_RX_FIFO_DOUBLE_WRITE_ADDR_OFST = 532;
localparam HSSI_ADAPT_RX_FIFO_DOUBLE_WRITE_ADDR_FIELD_OFST = 0;
localparam HSSI_ADAPT_RX_FIFO_DOUBLE_WRITE_ADDR_FIELD_HIGH = 0;
localparam HSSI_ADAPT_RX_FIFO_DOUBLE_WRITE_ADDR_FIELD_SIZE = 1;
localparam HSSI_ADAPT_RX_FIFO_DOUBLE_WRITE_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_ADAPT_RX_FIFO_DOUBLE_WRITE_ADDR_FIELD_VALMASK = 32'h00000001;
localparam HSSI_ADAPT_RX_FIFO_DOUBLE_WRITE_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_ADAPT_RX_FIFO_RD_CLK_SEL_VALUE = "fifo_rd_pma_aib_rx_clk";
localparam HSSI_ADAPT_RX_FIFO_RD_CLK_SEL_ADDR_OFST = 547;
localparam HSSI_ADAPT_RX_FIFO_RD_CLK_SEL_ADDR_FIELD_OFST = 2;
localparam HSSI_ADAPT_RX_FIFO_RD_CLK_SEL_ADDR_FIELD_HIGH = 4;
localparam HSSI_ADAPT_RX_FIFO_RD_CLK_SEL_ADDR_FIELD_SIZE = 3;
localparam HSSI_ADAPT_RX_FIFO_RD_CLK_SEL_ADDR_FIELD_BITMASK = 32'h0000001C;
localparam HSSI_ADAPT_RX_FIFO_RD_CLK_SEL_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_ADAPT_RX_FIFO_RD_CLK_SEL_ADDR_FIELD_VALUE = 3'h0;

localparam HSSI_ADAPT_RX_FIFO_WIDTH_VALUE = "fifo_double_width";

localparam HSSI_ADAPT_RX_PHCOMP_RD_DEL_VALUE = "phcomp_rd_del3";
localparam HSSI_ADAPT_RX_PHCOMP_RD_DEL_ADDR_OFST = 531;
localparam HSSI_ADAPT_RX_PHCOMP_RD_DEL_ADDR_FIELD_OFST = 5;
localparam HSSI_ADAPT_RX_PHCOMP_RD_DEL_ADDR_FIELD_HIGH = 7;
localparam HSSI_ADAPT_RX_PHCOMP_RD_DEL_ADDR_FIELD_SIZE = 3;
localparam HSSI_ADAPT_RX_PHCOMP_RD_DEL_ADDR_FIELD_BITMASK = 32'h000000E0;
localparam HSSI_ADAPT_RX_PHCOMP_RD_DEL_ADDR_FIELD_VALMASK = 32'h00000060;
localparam HSSI_ADAPT_RX_PHCOMP_RD_DEL_ADDR_FIELD_VALUE = 3'h3;

localparam HSSI_ADAPT_RX_HD_HSSIADAPT_PLD_PCS_RX_CLK_OUT_HZ_VALUE = 31'd257812500;

localparam HSSI_ADAPT_RX_PMA_AIB_RX_CLK_EXPECTED_SETTING_VALUE = "x2";

localparam HSSI_ADAPT_RX_RX_FIFO_POWER_MODE_VALUE = "full_width_full_depth";
localparam HSSI_ADAPT_RX_RX_FIFO_POWER_MODE_ADDR_OFST = 536;
localparam HSSI_ADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_OFST = 6;
localparam HSSI_ADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_HIGH = 7;
localparam HSSI_ADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_SIZE = 2;
localparam HSSI_ADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_BITMASK = 32'h000000C0;
localparam HSSI_ADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_VALMASK = 32'h000000C0;
localparam HSSI_ADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_VALUE = 2'h3;

localparam HSSI_ADAPT_RX_RXFIFO_FULL_VALUE = "full_dw";
localparam HSSI_ADAPT_RX_RXFIFO_FULL_ADDR_OFST = 531;
localparam HSSI_ADAPT_RX_RXFIFO_FULL_ADDR_FIELD_OFST = 0;
localparam HSSI_ADAPT_RX_RXFIFO_FULL_ADDR_FIELD_HIGH = 4;
localparam HSSI_ADAPT_RX_RXFIFO_FULL_ADDR_FIELD_SIZE = 5;
localparam HSSI_ADAPT_RX_RXFIFO_FULL_ADDR_FIELD_BITMASK = 32'h0000001F;
localparam HSSI_ADAPT_RX_RXFIFO_FULL_ADDR_FIELD_VALMASK = 32'h0000000E;
localparam HSSI_ADAPT_RX_RXFIFO_FULL_ADDR_FIELD_VALUE = 5'hE;

localparam HSSI_ADAPT_RX_WORD_ALIGN_ENABLE_VALUE = "enable";

localparam HSSI_ADAPT_RX_WORD_MARK_VALUE = "wm_en";
localparam HSSI_ADAPT_RX_WORD_MARK_ADDR_OFST = 530;
localparam HSSI_ADAPT_RX_WORD_MARK_ADDR_FIELD_OFST = 7;
localparam HSSI_ADAPT_RX_WORD_MARK_ADDR_FIELD_HIGH = 7;
localparam HSSI_ADAPT_RX_WORD_MARK_ADDR_FIELD_SIZE = 1;
localparam HSSI_ADAPT_RX_WORD_MARK_ADDR_FIELD_BITMASK = 32'h00000080;
localparam HSSI_ADAPT_RX_WORD_MARK_ADDR_FIELD_VALMASK = 32'h00000080;
localparam HSSI_ADAPT_RX_WORD_MARK_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_ADAPT_TX_AIB_CLK_SEL_VALUE = "aib_clk_pma_aib_tx_clk";
localparam HSSI_ADAPT_TX_AIB_CLK_SEL_ADDR_OFST = 524;
localparam HSSI_ADAPT_TX_AIB_CLK_SEL_ADDR_FIELD_OFST = 3;
localparam HSSI_ADAPT_TX_AIB_CLK_SEL_ADDR_FIELD_HIGH = 4;
localparam HSSI_ADAPT_TX_AIB_CLK_SEL_ADDR_FIELD_SIZE = 2;
localparam HSSI_ADAPT_TX_AIB_CLK_SEL_ADDR_FIELD_BITMASK = 32'h00000018;
localparam HSSI_ADAPT_TX_AIB_CLK_SEL_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_ADAPT_TX_AIB_CLK_SEL_ADDR_FIELD_VALUE = 2'h0;

localparam HSSI_ADAPT_TX_HD_HSSIADAPT_AIB_HSSI_TX_TRANSFER_CLK_HZ_VALUE = 31'd515625000;

localparam HSSI_ADAPT_TX_DATAPATH_MAPPING_MODE_VALUE = "map_10g_2x2x_2x1x_fifo";
localparam HSSI_ADAPT_TX_DATAPATH_MAPPING_MODE_ADDR_OFST = 512;
localparam HSSI_ADAPT_TX_DATAPATH_MAPPING_MODE_ADDR_FIELD_OFST = 0;
localparam HSSI_ADAPT_TX_DATAPATH_MAPPING_MODE_ADDR_FIELD_HIGH = 4;
localparam HSSI_ADAPT_TX_DATAPATH_MAPPING_MODE_ADDR_FIELD_SIZE = 5;
localparam HSSI_ADAPT_TX_DATAPATH_MAPPING_MODE_ADDR_FIELD_BITMASK = 32'h0000001F;
localparam HSSI_ADAPT_TX_DATAPATH_MAPPING_MODE_ADDR_FIELD_VALMASK = 32'h00000007;
localparam HSSI_ADAPT_TX_DATAPATH_MAPPING_MODE_ADDR_FIELD_VALUE = 5'h7;

localparam HSSI_ADAPT_TX_FIFO_DOUBLE_READ_VALUE = "fifo_double_read_en";
localparam HSSI_ADAPT_TX_FIFO_DOUBLE_READ_ADDR_OFST = 516;
localparam HSSI_ADAPT_TX_FIFO_DOUBLE_READ_ADDR_FIELD_OFST = 0;
localparam HSSI_ADAPT_TX_FIFO_DOUBLE_READ_ADDR_FIELD_HIGH = 0;
localparam HSSI_ADAPT_TX_FIFO_DOUBLE_READ_ADDR_FIELD_SIZE = 1;
localparam HSSI_ADAPT_TX_FIFO_DOUBLE_READ_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_ADAPT_TX_FIFO_DOUBLE_READ_ADDR_FIELD_VALMASK = 32'h00000001;
localparam HSSI_ADAPT_TX_FIFO_DOUBLE_READ_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_ADAPT_TX_FIFO_WIDTH_VALUE = "fifo_double_width";

localparam HSSI_ADAPT_TX_HD_HSSIADAPT_PLD_PCS_TX_CLK_OUT_HZ_VALUE = 31'd257812500;

localparam HSSI_ADAPT_TX_PMA_AIB_TX_CLK_EXPECTED_SETTING_VALUE = "x2";

localparam HSSI_ADAPT_TX_TX_FIFO_POWER_MODE_VALUE = "full_width_full_depth";
localparam HSSI_ADAPT_TX_TX_FIFO_POWER_MODE_ADDR_OFST = 520;
localparam HSSI_ADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_OFST = 1;
localparam HSSI_ADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_HIGH = 2;
localparam HSSI_ADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_SIZE = 2;
localparam HSSI_ADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_BITMASK = 32'h00000006;
localparam HSSI_ADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_VALMASK = 32'h00000006;
localparam HSSI_ADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_VALUE = 2'h3;

localparam HSSI_ADAPT_TX_TXFIFO_FULL_VALUE = "full_dw";
localparam HSSI_ADAPT_TX_TXFIFO_FULL_ADDR_OFST = 515;
localparam HSSI_ADAPT_TX_TXFIFO_FULL_ADDR_FIELD_OFST = 0;
localparam HSSI_ADAPT_TX_TXFIFO_FULL_ADDR_FIELD_HIGH = 4;
localparam HSSI_ADAPT_TX_TXFIFO_FULL_ADDR_FIELD_SIZE = 5;
localparam HSSI_ADAPT_TX_TXFIFO_FULL_ADDR_FIELD_BITMASK = 32'h0000001F;
localparam HSSI_ADAPT_TX_TXFIFO_FULL_ADDR_FIELD_VALMASK = 32'h0000000F;
localparam HSSI_ADAPT_TX_TXFIFO_FULL_ADDR_FIELD_VALUE = 5'hF;

localparam HSSI_ADAPT_TX_WORD_ALIGN_VALUE = "wa_en";
localparam HSSI_ADAPT_TX_WORD_ALIGN_ADDR_OFST = 520;
localparam HSSI_ADAPT_TX_WORD_ALIGN_ADDR_FIELD_OFST = 0;
localparam HSSI_ADAPT_TX_WORD_ALIGN_ADDR_FIELD_HIGH = 0;
localparam HSSI_ADAPT_TX_WORD_ALIGN_ADDR_FIELD_SIZE = 1;
localparam HSSI_ADAPT_TX_WORD_ALIGN_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_ADAPT_TX_WORD_ALIGN_ADDR_FIELD_VALMASK = 32'h00000001;
localparam HSSI_ADAPT_TX_WORD_ALIGN_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_ADAPT_TX_WORD_ALIGN_ENABLE_VALUE = "enable";

localparam HSSI_AIBCR_RX_AIB_RX_DCC_BYP_VALUE = "aib_rx_dcc_byp_disable";
localparam HSSI_AIBCR_RX_AIB_RX_DCC_BYP_ADDR_OFST = 560;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_BYP_ADDR_FIELD_OFST = 3;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_BYP_ADDR_FIELD_HIGH = 3;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_BYP_ADDR_FIELD_SIZE = 1;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_BYP_ADDR_FIELD_BITMASK = 32'h00000008;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_BYP_ADDR_FIELD_VALMASK = 32'h00000008;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_BYP_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_AIBCR_RX_AIB_RX_DCC_EN_VALUE = "aib_rx_dcc_enable";
localparam HSSI_AIBCR_RX_AIB_RX_DCC_EN_ADDR_OFST = 560;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_EN_ADDR_FIELD_OFST = 4;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_EN_ADDR_FIELD_HIGH = 4;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_EN_ADDR_FIELD_SIZE = 1;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_EN_ADDR_FIELD_BITMASK = 32'h00000010;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_EN_ADDR_FIELD_VALMASK = 32'h00000010;
localparam HSSI_AIBCR_RX_AIB_RX_DCC_EN_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_AIBCR_RX_OP_MODE_VALUE = "rx_dcc_enable";

localparam HSSI_AIBCR_RX_POWERMODE_AC_VALUE = "rxdatapath_high_speed_pwr";

localparam HSSI_AIBCR_TX_AIB_DLLSTR_ALIGN_DY_CTLSEL_VALUE = "aib_dllstr_align_dy_ctlsel_setting0";
localparam HSSI_AIBCR_TX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_OFST = 558;
localparam HSSI_AIBCR_TX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_OFST = 2;
localparam HSSI_AIBCR_TX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_HIGH = 2;
localparam HSSI_AIBCR_TX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_SIZE = 1;
localparam HSSI_AIBCR_TX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_BITMASK = 32'h00000004;
localparam HSSI_AIBCR_TX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_AIBCR_TX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_AIBCR_TX_OP_MODE_VALUE = "tx_dll_enable";

localparam HSSI_AIBCR_TX_POWERMODE_AC_VALUE = "txdatapath_high_speed_pwr";

localparam HSSI_AIBND_RX_AIB_DLLSTR_ALIGN_DY_CTLSEL_VALUE = "aib_dllstr_align_dy_ctlsel_setting0";
localparam HSSI_AIBND_RX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_OFST = 812;
localparam HSSI_AIBND_RX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_OFST = 2;
localparam HSSI_AIBND_RX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_HIGH = 2;
localparam HSSI_AIBND_RX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_SIZE = 1;
localparam HSSI_AIBND_RX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_BITMASK = 32'h00000004;
localparam HSSI_AIBND_RX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_AIBND_RX_AIB_DLLSTR_ALIGN_DY_CTLSEL_ADDR_FIELD_VALUE = 1'h0;

localparam HSSI_AIBND_RX_OP_MODE_VALUE = "rx_dll_enable";

localparam HSSI_AIBND_RX_POWERMODE_AC_VALUE = "rxdatapath_high_speed_pwr";

localparam HSSI_AIBND_TX_AIB_TX_DCC_BYP_VALUE = "aib_tx_dcc_byp_disable";
localparam HSSI_AIBND_TX_AIB_TX_DCC_BYP_ADDR_OFST = 814;
localparam HSSI_AIBND_TX_AIB_TX_DCC_BYP_ADDR_FIELD_OFST = 3;
localparam HSSI_AIBND_TX_AIB_TX_DCC_BYP_ADDR_FIELD_HIGH = 3;
localparam HSSI_AIBND_TX_AIB_TX_DCC_BYP_ADDR_FIELD_SIZE = 1;
localparam HSSI_AIBND_TX_AIB_TX_DCC_BYP_ADDR_FIELD_BITMASK = 32'h00000008;
localparam HSSI_AIBND_TX_AIB_TX_DCC_BYP_ADDR_FIELD_VALMASK = 32'h00000008;
localparam HSSI_AIBND_TX_AIB_TX_DCC_BYP_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_AIBND_TX_AIB_TX_DCC_EN_VALUE = "aib_tx_dcc_enable";
localparam HSSI_AIBND_TX_AIB_TX_DCC_EN_ADDR_OFST = 814;
localparam HSSI_AIBND_TX_AIB_TX_DCC_EN_ADDR_FIELD_OFST = 4;
localparam HSSI_AIBND_TX_AIB_TX_DCC_EN_ADDR_FIELD_HIGH = 4;
localparam HSSI_AIBND_TX_AIB_TX_DCC_EN_ADDR_FIELD_SIZE = 1;
localparam HSSI_AIBND_TX_AIB_TX_DCC_EN_ADDR_FIELD_BITMASK = 32'h00000010;
localparam HSSI_AIBND_TX_AIB_TX_DCC_EN_ADDR_FIELD_VALMASK = 32'h00000010;
localparam HSSI_AIBND_TX_AIB_TX_DCC_EN_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_AIBND_TX_OP_MODE_VALUE = "tx_dcc_enable";

localparam HSSI_AIBND_TX_POWERMODE_AC_VALUE = "txdatapath_high_speed_pwr";

localparam PMA_ADAPT_SEQUENCER_RX_PATH_RSTN_OVERRIDEB_VALUE = "use_sequencer";

localparam PMA_ADAPT_DATARATE_BPS_VALUE = "10312500000";

localparam CDR_PLL_CHGPMP_CURRENT_DN_PD_VALUE = "cp_current_pd_dn_setting3";
localparam CDR_PLL_CHGPMP_CURRENT_DN_PD_ADDR_OFST = 313;
localparam CDR_PLL_CHGPMP_CURRENT_DN_PD_ADDR_FIELD_OFST = 3;
localparam CDR_PLL_CHGPMP_CURRENT_DN_PD_ADDR_FIELD_HIGH = 5;
localparam CDR_PLL_CHGPMP_CURRENT_DN_PD_ADDR_FIELD_SIZE = 3;
localparam CDR_PLL_CHGPMP_CURRENT_DN_PD_ADDR_FIELD_BITMASK = 32'h00000038;
localparam CDR_PLL_CHGPMP_CURRENT_DN_PD_ADDR_FIELD_VALMASK = 32'h00000018;
localparam CDR_PLL_CHGPMP_CURRENT_DN_PD_ADDR_FIELD_VALUE = 3'h3;

localparam CDR_PLL_CHGPMP_CURRENT_PFD_VALUE = "cp_current_pfd_setting2";
localparam CDR_PLL_CHGPMP_CURRENT_PFD_ADDR_OFST = 313;
localparam CDR_PLL_CHGPMP_CURRENT_PFD_ADDR_FIELD_OFST = 0;
localparam CDR_PLL_CHGPMP_CURRENT_PFD_ADDR_FIELD_HIGH = 2;
localparam CDR_PLL_CHGPMP_CURRENT_PFD_ADDR_FIELD_SIZE = 3;
localparam CDR_PLL_CHGPMP_CURRENT_PFD_ADDR_FIELD_BITMASK = 32'h00000007;
localparam CDR_PLL_CHGPMP_CURRENT_PFD_ADDR_FIELD_VALMASK = 32'h00000002;
localparam CDR_PLL_CHGPMP_CURRENT_PFD_ADDR_FIELD_VALUE = 3'h2;

localparam CDR_PLL_CHGPMP_CURRENT_UP_PD_VALUE = "cp_current_pd_up_setting3";
localparam CDR_PLL_CHGPMP_CURRENT_UP_PD_ADDR_OFST = 307;
localparam CDR_PLL_CHGPMP_CURRENT_UP_PD_ADDR_FIELD_OFST = 5;
localparam CDR_PLL_CHGPMP_CURRENT_UP_PD_ADDR_FIELD_HIGH = 7;
localparam CDR_PLL_CHGPMP_CURRENT_UP_PD_ADDR_FIELD_SIZE = 3;
localparam CDR_PLL_CHGPMP_CURRENT_UP_PD_ADDR_FIELD_BITMASK = 32'h000000E0;
localparam CDR_PLL_CHGPMP_CURRENT_UP_PD_ADDR_FIELD_VALMASK = 32'h00000060;
localparam CDR_PLL_CHGPMP_CURRENT_UP_PD_ADDR_FIELD_VALUE = 3'h3;

localparam CDR_PLL_DATARATE_BPS_VALUE = "10312500000";

localparam CDR_PLL_F_MAX_VCO_VALUE = "14150000000";

localparam CDR_PLL_F_MIN_VCO_VALUE = "7000000000";

localparam CDR_PLL_FREF_CLKLOW_DIV_VALUE = 2;
localparam CDR_PLL_FREF_CLKLOW_DIV_ADDR_OFST = 314;
localparam CDR_PLL_FREF_CLKLOW_DIV_ADDR_FIELD_OFST = 6;
localparam CDR_PLL_FREF_CLKLOW_DIV_ADDR_FIELD_HIGH = 7;
localparam CDR_PLL_FREF_CLKLOW_DIV_ADDR_FIELD_SIZE = 2;
localparam CDR_PLL_FREF_CLKLOW_DIV_ADDR_FIELD_BITMASK = 32'h000000C0;
localparam CDR_PLL_FREF_CLKLOW_DIV_ADDR_FIELD_VALMASK = 32'h00000040;
localparam CDR_PLL_FREF_CLKLOW_DIV_ADDR_FIELD_VALUE = 2'h1;

localparam CDR_PLL_LF_RESISTOR_PD_VALUE = "lf_pd_setting3";
localparam CDR_PLL_LF_RESISTOR_PD_ADDR_OFST = 309;
localparam CDR_PLL_LF_RESISTOR_PD_ADDR_FIELD_OFST = 2;
localparam CDR_PLL_LF_RESISTOR_PD_ADDR_FIELD_HIGH = 3;
localparam CDR_PLL_LF_RESISTOR_PD_ADDR_FIELD_SIZE = 2;
localparam CDR_PLL_LF_RESISTOR_PD_ADDR_FIELD_BITMASK = 32'h0000000C;
localparam CDR_PLL_LF_RESISTOR_PD_ADDR_FIELD_VALMASK = 32'h0000000C;
localparam CDR_PLL_LF_RESISTOR_PD_ADDR_FIELD_VALUE = 2'h3;

localparam CDR_PLL_LF_RESISTOR_PFD_VALUE = "lf_pfd_setting2";
localparam CDR_PLL_LF_RESISTOR_PFD_ADDR_OFST = 309;
localparam CDR_PLL_LF_RESISTOR_PFD_ADDR_FIELD_OFST = 0;
localparam CDR_PLL_LF_RESISTOR_PFD_ADDR_FIELD_HIGH = 1;
localparam CDR_PLL_LF_RESISTOR_PFD_ADDR_FIELD_SIZE = 2;
localparam CDR_PLL_LF_RESISTOR_PFD_ADDR_FIELD_BITMASK = 32'h00000003;
localparam CDR_PLL_LF_RESISTOR_PFD_ADDR_FIELD_VALMASK = 32'h00000002;
localparam CDR_PLL_LF_RESISTOR_PFD_ADDR_FIELD_VALUE = 2'h2;

localparam CDR_PLL_LPD_COUNTER_VALUE = 5'd2;

localparam CDR_PLL_LPFD_COUNTER_VALUE = 5'd2;

localparam CDR_PLL_MCNT_DIV_VALUE = 8'd16;
localparam CDR_PLL_MCNT_DIV_ADDR_OFST = 315;
localparam CDR_PLL_MCNT_DIV_ADDR_FIELD_OFST = 0;
localparam CDR_PLL_MCNT_DIV_ADDR_FIELD_HIGH = 7;
localparam CDR_PLL_MCNT_DIV_ADDR_FIELD_SIZE = 8;
localparam CDR_PLL_MCNT_DIV_ADDR_FIELD_BITMASK = 32'h000000FF;
localparam CDR_PLL_MCNT_DIV_ADDR_FIELD_VALMASK = 32'h00000010;
localparam CDR_PLL_MCNT_DIV_ADDR_FIELD_VALUE = 8'h10;

localparam CDR_PLL_N_COUNTER_VALUE = 6'd2;

localparam CDR_PLL_NCNT_DIV_VALUE = 2;
localparam CDR_PLL_NCNT_DIV_ADDR_OFST = 316;
localparam CDR_PLL_NCNT_DIV_ADDR_FIELD_OFST = 2;
localparam CDR_PLL_NCNT_DIV_ADDR_FIELD_HIGH = 3;
localparam CDR_PLL_NCNT_DIV_ADDR_FIELD_SIZE = 2;
localparam CDR_PLL_NCNT_DIV_ADDR_FIELD_BITMASK = 32'h0000000C;
localparam CDR_PLL_NCNT_DIV_ADDR_FIELD_VALMASK = 32'h00000004;
localparam CDR_PLL_NCNT_DIV_ADDR_FIELD_VALUE = 2'h1;

localparam CDR_PLL_OUT_FREQ_VALUE = "5156250000";

localparam CDR_PLL_PD_L_COUNTER_VALUE = 2;
localparam CDR_PLL_PD_L_COUNTER_ADDR_OFST = 314;
localparam CDR_PLL_PD_L_COUNTER_ADDR_FIELD_OFST = 3;
localparam CDR_PLL_PD_L_COUNTER_ADDR_FIELD_HIGH = 5;
localparam CDR_PLL_PD_L_COUNTER_ADDR_FIELD_SIZE = 3;
localparam CDR_PLL_PD_L_COUNTER_ADDR_FIELD_BITMASK = 32'h00000038;
localparam CDR_PLL_PD_L_COUNTER_ADDR_FIELD_VALMASK = 32'h00000018;
localparam CDR_PLL_PD_L_COUNTER_ADDR_FIELD_VALUE = 3'h3;

localparam CDR_PLL_PFD_L_COUNTER_VALUE = 2;
localparam CDR_PLL_PFD_L_COUNTER_ADDR_OFST = 314;
localparam CDR_PLL_PFD_L_COUNTER_ADDR_FIELD_OFST = 0;
localparam CDR_PLL_PFD_L_COUNTER_ADDR_FIELD_HIGH = 2;
localparam CDR_PLL_PFD_L_COUNTER_ADDR_FIELD_SIZE = 3;
localparam CDR_PLL_PFD_L_COUNTER_ADDR_FIELD_BITMASK = 32'h00000007;
localparam CDR_PLL_PFD_L_COUNTER_ADDR_FIELD_VALMASK = 32'h00000003;
localparam CDR_PLL_PFD_L_COUNTER_ADDR_FIELD_VALUE = 3'h3;

localparam CDR_PLL_POWERMODE_AC_RVCOTOP_VALUE = "rvcotop_ac_div2";

localparam CDR_PLL_POWERMODE_DC_RVCOTOP_VALUE = "rvcotop_dc_div2";

localparam CDR_PLL_REFERENCE_CLOCK_FREQUENCY_VALUE = "644531250";

localparam CDR_PLL_SET_CDR_INPUT_FREQ_RANGE_VALUE = 8'd149;
localparam CDR_PLL_SET_CDR_INPUT_FREQ_RANGE_ADDR_OFST = 345;
localparam CDR_PLL_SET_CDR_INPUT_FREQ_RANGE_ADDR_FIELD_OFST = 0;
localparam CDR_PLL_SET_CDR_INPUT_FREQ_RANGE_ADDR_FIELD_HIGH = 7;
localparam CDR_PLL_SET_CDR_INPUT_FREQ_RANGE_ADDR_FIELD_SIZE = 8;
localparam CDR_PLL_SET_CDR_INPUT_FREQ_RANGE_ADDR_FIELD_BITMASK = 32'h000000FF;
localparam CDR_PLL_SET_CDR_INPUT_FREQ_RANGE_ADDR_FIELD_VALMASK = 32'h00000095;
localparam CDR_PLL_SET_CDR_INPUT_FREQ_RANGE_ADDR_FIELD_VALUE = 8'h95;

localparam CDR_PLL_SET_CDR_VCO_SPEED_VALUE = 4'd2;
localparam CDR_PLL_SET_CDR_VCO_SPEED_ADDR_OFST = 311;
localparam CDR_PLL_SET_CDR_VCO_SPEED_ADDR_FIELD_OFST = 2;
localparam CDR_PLL_SET_CDR_VCO_SPEED_ADDR_FIELD_HIGH = 5;
localparam CDR_PLL_SET_CDR_VCO_SPEED_ADDR_FIELD_SIZE = 4;
localparam CDR_PLL_SET_CDR_VCO_SPEED_ADDR_FIELD_BITMASK = 32'h0000003C;
localparam CDR_PLL_SET_CDR_VCO_SPEED_ADDR_FIELD_VALMASK = 32'h00000008;
localparam CDR_PLL_SET_CDR_VCO_SPEED_ADDR_FIELD_VALUE = 4'h2;

localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_VALUE = 8'd92;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR0_OFST = 306;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR0_FIELD_OFST = 0;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR0_FIELD_HIGH = 3;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR0_FIELD_SIZE = 4;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR0_FIELD_BITMASK = 32'h0000000F;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR0_FIELD_VALMASK = 32'h00000005;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR0_FIELD_VALUE = 4'h5;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR1_OFST = 310;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR1_FIELD_OFST = 0;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR1_FIELD_HIGH = 3;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR1_FIELD_SIZE = 4;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR1_FIELD_BITMASK = 32'h0000000F;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR1_FIELD_VALMASK = 32'h0000000C;
localparam CDR_PLL_SET_CDR_VCO_SPEED_FIX_ADDR1_FIELD_VALUE = 4'hC;

localparam CDR_PLL_VCO_FREQ_VALUE = "10312500000";

localparam CDR_PLL_PMA_WIDTH_VALUE = 40;

localparam PMA_RX_BUF_CTLE_TIA_ISEL_VALUE = "ib_tia_bw1";
localparam PMA_RX_BUF_CTLE_TIA_ISEL_ADDR_OFST = 302;
localparam PMA_RX_BUF_CTLE_TIA_ISEL_ADDR_FIELD_OFST = 4;
localparam PMA_RX_BUF_CTLE_TIA_ISEL_ADDR_FIELD_HIGH = 5;
localparam PMA_RX_BUF_CTLE_TIA_ISEL_ADDR_FIELD_SIZE = 2;
localparam PMA_RX_BUF_CTLE_TIA_ISEL_ADDR_FIELD_BITMASK = 32'h00000030;
localparam PMA_RX_BUF_CTLE_TIA_ISEL_ADDR_FIELD_VALMASK = 32'h00000010;
localparam PMA_RX_BUF_CTLE_TIA_ISEL_ADDR_FIELD_VALUE = 2'h1;

localparam PMA_RX_BUF_DATARATE_BPS_VALUE = "10312500000";

localparam PMA_RX_BUF_PM_CR2_RX_PATH_DATARATE_BPS_VALUE = "10312500000";

localparam PMA_RX_BUF_PM_CR2_RX_PATH_DATAWIDTH_VALUE = 8'd40;

localparam PMA_RX_BUF_EQ_BW_SEL_VALUE = "eq_bw_1";
localparam PMA_RX_BUF_EQ_BW_SEL_ADDR_OFST = 287;
localparam PMA_RX_BUF_EQ_BW_SEL_ADDR_FIELD_OFST = 4;
localparam PMA_RX_BUF_EQ_BW_SEL_ADDR_FIELD_HIGH = 5;
localparam PMA_RX_BUF_EQ_BW_SEL_ADDR_FIELD_SIZE = 2;
localparam PMA_RX_BUF_EQ_BW_SEL_ADDR_FIELD_BITMASK = 32'h00000030;
localparam PMA_RX_BUF_EQ_BW_SEL_ADDR_FIELD_VALMASK = 32'h00000010;
localparam PMA_RX_BUF_EQ_BW_SEL_ADDR_FIELD_VALUE = 2'h1;

localparam PMA_RX_BUF_EQ_CDGEN_SEL_VALUE = "eq_cdgen_2";
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR0_OFST = 328;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR0_FIELD_OFST = 2;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR0_FIELD_HIGH = 2;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR0_FIELD_SIZE = 1;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR0_FIELD_BITMASK = 32'h00000004;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR0_FIELD_VALMASK = 32'h00000000;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR0_FIELD_VALUE = 1'h0;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR1_OFST = 337;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR1_FIELD_OFST = 7;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR1_FIELD_HIGH = 7;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR1_FIELD_SIZE = 1;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR1_FIELD_BITMASK = 32'h00000080;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR1_FIELD_VALMASK = 32'h00000080;
localparam PMA_RX_BUF_EQ_CDGEN_SEL_ADDR1_FIELD_VALUE = 1'h1;

localparam PMA_RX_BUF_EQ_ISEL_VALUE = "eq_isel_1";
localparam PMA_RX_BUF_EQ_ISEL_ADDR_OFST = 370;
localparam PMA_RX_BUF_EQ_ISEL_ADDR_FIELD_OFST = 4;
localparam PMA_RX_BUF_EQ_ISEL_ADDR_FIELD_HIGH = 4;
localparam PMA_RX_BUF_EQ_ISEL_ADDR_FIELD_SIZE = 1;
localparam PMA_RX_BUF_EQ_ISEL_ADDR_FIELD_BITMASK = 32'h00000010;
localparam PMA_RX_BUF_EQ_ISEL_ADDR_FIELD_VALMASK = 32'h00000010;
localparam PMA_RX_BUF_EQ_ISEL_ADDR_FIELD_VALUE = 1'h1;

localparam PMA_RX_BUF_PM_CR2_RX_PATH_PMA_RX_DIVCLK_HZ_VALUE = "257812500";

localparam PMA_RX_BUF_POWERMODE_AC_CTLE_VALUE = "ctle_pwr_ac2";

localparam PMA_RX_DESER_CLKDIVRX_USER_MODE_VALUE = "clkdivrx_user_div33";
localparam PMA_RX_DESER_CLKDIVRX_USER_MODE_ADDR_OFST = 320;
localparam PMA_RX_DESER_CLKDIVRX_USER_MODE_ADDR_FIELD_OFST = 0;
localparam PMA_RX_DESER_CLKDIVRX_USER_MODE_ADDR_FIELD_HIGH = 2;
localparam PMA_RX_DESER_CLKDIVRX_USER_MODE_ADDR_FIELD_SIZE = 3;
localparam PMA_RX_DESER_CLKDIVRX_USER_MODE_ADDR_FIELD_BITMASK = 32'h00000007;
localparam PMA_RX_DESER_CLKDIVRX_USER_MODE_ADDR_FIELD_VALMASK = 32'h00000006;
localparam PMA_RX_DESER_CLKDIVRX_USER_MODE_ADDR_FIELD_VALUE = 3'h6;

localparam PMA_RX_DESER_DATARATE_BPS_VALUE = "10312500000";

localparam PMA_RX_DESER_DESER_AIBCK_X1_VALUE = "normal";
localparam PMA_RX_DESER_DESER_AIBCK_X1_ADDR_OFST = 356;
localparam PMA_RX_DESER_DESER_AIBCK_X1_ADDR_FIELD_OFST = 7;
localparam PMA_RX_DESER_DESER_AIBCK_X1_ADDR_FIELD_HIGH = 7;
localparam PMA_RX_DESER_DESER_AIBCK_X1_ADDR_FIELD_SIZE = 1;
localparam PMA_RX_DESER_DESER_AIBCK_X1_ADDR_FIELD_BITMASK = 32'h00000080;
localparam PMA_RX_DESER_DESER_AIBCK_X1_ADDR_FIELD_VALMASK = 32'h00000000;
localparam PMA_RX_DESER_DESER_AIBCK_X1_ADDR_FIELD_VALUE = 1'h0;

localparam PMA_RX_DESER_DESER_FACTOR_VALUE = "deser_40b";
localparam PMA_RX_DESER_DESER_FACTOR_ADDR_OFST = 319;
localparam PMA_RX_DESER_DESER_FACTOR_ADDR_FIELD_OFST = 0;
localparam PMA_RX_DESER_DESER_FACTOR_ADDR_FIELD_HIGH = 3;
localparam PMA_RX_DESER_DESER_FACTOR_ADDR_FIELD_SIZE = 4;
localparam PMA_RX_DESER_DESER_FACTOR_ADDR_FIELD_BITMASK = 32'h0000000F;
localparam PMA_RX_DESER_DESER_FACTOR_ADDR_FIELD_VALMASK = 32'h00000007;
localparam PMA_RX_DESER_DESER_FACTOR_ADDR_FIELD_VALUE = 4'h7;

localparam PMA_RX_DESER_POWERMODE_AC_DESER_VALUE = "deser_ac_40b_nobs";

localparam PMA_RX_DESER_POWERMODE_DC_DESER_VALUE = "deser_dc_40b_nobs";

localparam PMA_RX_DFE_DATARATE_BPS_VALUE = "10312500000";

localparam PMA_RX_DFE_TAPSUM_BW_SEL_VALUE = "tapsum_medbw";
localparam PMA_RX_DFE_TAPSUM_BW_SEL_ADDR_OFST = 304;
localparam PMA_RX_DFE_TAPSUM_BW_SEL_ADDR_FIELD_OFST = 6;
localparam PMA_RX_DFE_TAPSUM_BW_SEL_ADDR_FIELD_HIGH = 7;
localparam PMA_RX_DFE_TAPSUM_BW_SEL_ADDR_FIELD_SIZE = 2;
localparam PMA_RX_DFE_TAPSUM_BW_SEL_ADDR_FIELD_BITMASK = 32'h000000C0;
localparam PMA_RX_DFE_TAPSUM_BW_SEL_ADDR_FIELD_VALMASK = 32'h00000040;
localparam PMA_RX_DFE_TAPSUM_BW_SEL_ADDR_FIELD_VALUE = 2'h1;

localparam PMA_RX_ODI_DATARATE_BPS_VALUE = "10312500000";

localparam PMA_RX_ODI_XRX_PATH_X119_RX_PATH_RSTN_OVERRIDEB_VALUE = "use_sequencer";
localparam PMA_RX_ODI_XRX_PATH_X119_RX_PATH_RSTN_OVERRIDEB_ADDR_OFST = 377;
localparam PMA_RX_ODI_XRX_PATH_X119_RX_PATH_RSTN_OVERRIDEB_ADDR_FIELD_OFST = 1;
localparam PMA_RX_ODI_XRX_PATH_X119_RX_PATH_RSTN_OVERRIDEB_ADDR_FIELD_HIGH = 1;
localparam PMA_RX_ODI_XRX_PATH_X119_RX_PATH_RSTN_OVERRIDEB_ADDR_FIELD_SIZE = 1;
localparam PMA_RX_ODI_XRX_PATH_X119_RX_PATH_RSTN_OVERRIDEB_ADDR_FIELD_BITMASK = 32'h00000002;
localparam PMA_RX_ODI_XRX_PATH_X119_RX_PATH_RSTN_OVERRIDEB_ADDR_FIELD_VALMASK = 32'h00000002;
localparam PMA_RX_ODI_XRX_PATH_X119_RX_PATH_RSTN_OVERRIDEB_ADDR_FIELD_VALUE = 1'h1;

localparam PMA_TX_BUF_DATARATE_BPS_VALUE = "10312500000";

localparam PMA_TX_BUF_PM_CR2_TX_PATH_DATARATE_BPS_VALUE = "10312500000";

localparam PMA_TX_BUF_PM_CR2_TX_PATH_DATAWIDTH_VALUE = 8'd40;

localparam PMA_TX_BUF_PM_CR2_TX_PATH_PMA_TX_DIVCLK_HZ_VALUE = "257812500";

localparam PMA_TX_BUF_SLEW_RATE_CTRL_VALUE = "slew_r5";
localparam PMA_TX_BUF_SLEW_RATE_CTRL_ADDR_OFST = 268;
localparam PMA_TX_BUF_SLEW_RATE_CTRL_ADDR_FIELD_OFST = 0;
localparam PMA_TX_BUF_SLEW_RATE_CTRL_ADDR_FIELD_HIGH = 2;
localparam PMA_TX_BUF_SLEW_RATE_CTRL_ADDR_FIELD_SIZE = 3;
localparam PMA_TX_BUF_SLEW_RATE_CTRL_ADDR_FIELD_BITMASK = 32'h00000007;
localparam PMA_TX_BUF_SLEW_RATE_CTRL_ADDR_FIELD_VALMASK = 32'h00000005;
localparam PMA_TX_BUF_SLEW_RATE_CTRL_ADDR_FIELD_VALUE = 3'h5;

localparam PMA_TX_BUF_PM_CR2_TX_PATH_TX_PLL_CLK_HZ_VALUE = "5156250000";

localparam PMA_CGB_DATARATE_BPS_VALUE = "10312500000";

localparam PMA_CGB_SER_MODE_VALUE = "forty_bit";
localparam PMA_CGB_SER_MODE_ADDR_OFST = 272;
localparam PMA_CGB_SER_MODE_ADDR_FIELD_OFST = 0;
localparam PMA_CGB_SER_MODE_ADDR_FIELD_HIGH = 2;
localparam PMA_CGB_SER_MODE_ADDR_FIELD_SIZE = 3;
localparam PMA_CGB_SER_MODE_ADDR_FIELD_BITMASK = 32'h00000007;
localparam PMA_CGB_SER_MODE_ADDR_FIELD_VALMASK = 32'h00000006;
localparam PMA_CGB_SER_MODE_ADDR_FIELD_VALUE = 3'h6;

localparam PMA_CGB_INPUT_SELECT_X1_VALUE = "fpll_top";

localparam PMA_RESET_SEQUENCER_RX_PATH_RSTN_OVERRIDEB_VALUE = "use_sequencer";

localparam PMA_TX_SEQUENCER_TX_PATH_RSTN_OVERRIDEB_VALUE = "use_sequencer";

localparam HSSI_FIFO_RX_PCS_PROT_MODE_VALUE = "teng_mode";
localparam HSSI_FIFO_RX_PCS_PROT_MODE_ADDR_OFST = 199;
localparam HSSI_FIFO_RX_PCS_PROT_MODE_ADDR_FIELD_OFST = 0;
localparam HSSI_FIFO_RX_PCS_PROT_MODE_ADDR_FIELD_HIGH = 0;
localparam HSSI_FIFO_RX_PCS_PROT_MODE_ADDR_FIELD_SIZE = 1;
localparam HSSI_FIFO_RX_PCS_PROT_MODE_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_FIFO_RX_PCS_PROT_MODE_ADDR_FIELD_VALMASK = 32'h00000001;
localparam HSSI_FIFO_RX_PCS_PROT_MODE_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_FIFO_TX_PCS_PROT_MODE_VALUE = "teng_mode";
localparam HSSI_FIFO_TX_PCS_PROT_MODE_ADDR_OFST = 197;
localparam HSSI_FIFO_TX_PCS_PROT_MODE_ADDR_FIELD_OFST = 0;
localparam HSSI_FIFO_TX_PCS_PROT_MODE_ADDR_FIELD_HIGH = 0;
localparam HSSI_FIFO_TX_PCS_PROT_MODE_ADDR_FIELD_SIZE = 1;
localparam HSSI_FIFO_TX_PCS_PROT_MODE_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_FIFO_TX_PCS_PROT_MODE_ADDR_FIELD_VALMASK = 32'h00000001;
localparam HSSI_FIFO_TX_PCS_PROT_MODE_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_PIPE_GEN1_2_PROT_MODE_VALUE = "disabled_prot_mode";

localparam HSSI_PLDADAPT_RX_HDPLDADAPT_AIB_FABRIC_RX_TRANSFER_CLK_HZ_VALUE = 31'd515625000;

localparam HSSI_PLDADAPT_RX_FIFO_DOUBLE_READ_VALUE = "fifo_double_read_en";
localparam HSSI_PLDADAPT_RX_FIFO_DOUBLE_READ_ADDR_OFST = 786;
localparam HSSI_PLDADAPT_RX_FIFO_DOUBLE_READ_ADDR_FIELD_OFST = 6;
localparam HSSI_PLDADAPT_RX_FIFO_DOUBLE_READ_ADDR_FIELD_HIGH = 6;
localparam HSSI_PLDADAPT_RX_FIFO_DOUBLE_READ_ADDR_FIELD_SIZE = 1;
localparam HSSI_PLDADAPT_RX_FIFO_DOUBLE_READ_ADDR_FIELD_BITMASK = 32'h00000040;
localparam HSSI_PLDADAPT_RX_FIFO_DOUBLE_READ_ADDR_FIELD_VALMASK = 32'h00000040;
localparam HSSI_PLDADAPT_RX_FIFO_DOUBLE_READ_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_PLDADAPT_RX_FIFO_WIDTH_VALUE = "fifo_double_width";

localparam HSSI_PLDADAPT_RX_GB_RX_IDWIDTH_VALUE = "idwidth_40";

localparam HSSI_PLDADAPT_RX_GB_RX_ODWIDTH_VALUE = "odwidth_66";

localparam HSSI_PLDADAPT_RX_HDPLDADAPT_PLD_RX_CLK1_DCM_HZ_VALUE = 31'd156250000;

localparam HSSI_PLDADAPT_RX_HDPLDADAPT_PLD_RX_CLK1_ROWCLK_HZ_VALUE = 31'd156250000;

localparam HSSI_PLDADAPT_RX_RX_FIFO_POWER_MODE_VALUE = "full_width_ps_dw";
localparam HSSI_PLDADAPT_RX_RX_FIFO_POWER_MODE_ADDR_OFST = 794;
localparam HSSI_PLDADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_OFST = 2;
localparam HSSI_PLDADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_HIGH = 4;
localparam HSSI_PLDADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_SIZE = 3;
localparam HSSI_PLDADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_BITMASK = 32'h0000001C;
localparam HSSI_PLDADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_VALMASK = 32'h0000000C;
localparam HSSI_PLDADAPT_RX_RX_FIFO_POWER_MODE_ADDR_FIELD_VALUE = 3'h3;

localparam HSSI_PLDADAPT_RX_RXFIFO_EMPTY_VALUE = "empty_dw";
localparam HSSI_PLDADAPT_RX_RXFIFO_EMPTY_ADDR_OFST = 785;
localparam HSSI_PLDADAPT_RX_RXFIFO_EMPTY_ADDR_FIELD_OFST = 0;
localparam HSSI_PLDADAPT_RX_RXFIFO_EMPTY_ADDR_FIELD_HIGH = 5;
localparam HSSI_PLDADAPT_RX_RXFIFO_EMPTY_ADDR_FIELD_SIZE = 6;
localparam HSSI_PLDADAPT_RX_RXFIFO_EMPTY_ADDR_FIELD_BITMASK = 32'h0000003F;
localparam HSSI_PLDADAPT_RX_RXFIFO_EMPTY_ADDR_FIELD_VALMASK = 32'h00000001;
localparam HSSI_PLDADAPT_RX_RXFIFO_EMPTY_ADDR_FIELD_VALUE = 6'h1;

localparam HSSI_PLDADAPT_RX_RXFIFO_FULL_VALUE = "full_pc_dw";
localparam HSSI_PLDADAPT_RX_RXFIFO_FULL_ADDR_OFST = 786;
localparam HSSI_PLDADAPT_RX_RXFIFO_FULL_ADDR_FIELD_OFST = 0;
localparam HSSI_PLDADAPT_RX_RXFIFO_FULL_ADDR_FIELD_HIGH = 5;
localparam HSSI_PLDADAPT_RX_RXFIFO_FULL_ADDR_FIELD_SIZE = 6;
localparam HSSI_PLDADAPT_RX_RXFIFO_FULL_ADDR_FIELD_BITMASK = 32'h0000003F;
localparam HSSI_PLDADAPT_RX_RXFIFO_FULL_ADDR_FIELD_VALMASK = 32'h0000000F;
localparam HSSI_PLDADAPT_RX_RXFIFO_FULL_ADDR_FIELD_VALUE = 6'hF;

localparam HSSI_PLDADAPT_RX_RXFIFO_PFULL_VALUE = 6'd10;
localparam HSSI_PLDADAPT_RX_RXFIFO_PFULL_ADDR_OFST = 788;
localparam HSSI_PLDADAPT_RX_RXFIFO_PFULL_ADDR_FIELD_OFST = 0;
localparam HSSI_PLDADAPT_RX_RXFIFO_PFULL_ADDR_FIELD_HIGH = 5;
localparam HSSI_PLDADAPT_RX_RXFIFO_PFULL_ADDR_FIELD_SIZE = 6;
localparam HSSI_PLDADAPT_RX_RXFIFO_PFULL_ADDR_FIELD_BITMASK = 32'h0000003F;
localparam HSSI_PLDADAPT_RX_RXFIFO_PFULL_ADDR_FIELD_VALMASK = 32'h0000000A;
localparam HSSI_PLDADAPT_RX_RXFIFO_PFULL_ADDR_FIELD_VALUE = 6'hA;

localparam HSSI_PLDADAPT_RX_STRETCH_NUM_STAGES_VALUE = "two_stage";
localparam HSSI_PLDADAPT_RX_STRETCH_NUM_STAGES_ADDR_OFST = 800;
localparam HSSI_PLDADAPT_RX_STRETCH_NUM_STAGES_ADDR_FIELD_OFST = 0;
localparam HSSI_PLDADAPT_RX_STRETCH_NUM_STAGES_ADDR_FIELD_HIGH = 2;
localparam HSSI_PLDADAPT_RX_STRETCH_NUM_STAGES_ADDR_FIELD_SIZE = 3;
localparam HSSI_PLDADAPT_RX_STRETCH_NUM_STAGES_ADDR_FIELD_BITMASK = 32'h00000007;
localparam HSSI_PLDADAPT_RX_STRETCH_NUM_STAGES_ADDR_FIELD_VALMASK = 32'h00000002;
localparam HSSI_PLDADAPT_RX_STRETCH_NUM_STAGES_ADDR_FIELD_VALUE = 3'h2;

localparam HSSI_PLDADAPT_RX_WORD_ALIGN_VALUE = "wa_en";
localparam HSSI_PLDADAPT_RX_WORD_ALIGN_ADDR_OFST = 792;
localparam HSSI_PLDADAPT_RX_WORD_ALIGN_ADDR_FIELD_OFST = 0;
localparam HSSI_PLDADAPT_RX_WORD_ALIGN_ADDR_FIELD_HIGH = 0;
localparam HSSI_PLDADAPT_RX_WORD_ALIGN_ADDR_FIELD_SIZE = 1;
localparam HSSI_PLDADAPT_RX_WORD_ALIGN_ADDR_FIELD_BITMASK = 32'h00000001;
localparam HSSI_PLDADAPT_RX_WORD_ALIGN_ADDR_FIELD_VALMASK = 32'h00000001;
localparam HSSI_PLDADAPT_RX_WORD_ALIGN_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_PLDADAPT_RX_WORD_ALIGN_ENABLE_VALUE = "enable";

localparam HSSI_PLDADAPT_TX_HDPLDADAPT_AIB_FABRIC_PMA_AIB_TX_CLK_HZ_VALUE = 31'd515625000;

localparam HSSI_PLDADAPT_TX_FIFO_DOUBLE_WRITE_VALUE = "fifo_double_write_en";
localparam HSSI_PLDADAPT_TX_FIFO_DOUBLE_WRITE_ADDR_OFST = 774;
localparam HSSI_PLDADAPT_TX_FIFO_DOUBLE_WRITE_ADDR_FIELD_OFST = 7;
localparam HSSI_PLDADAPT_TX_FIFO_DOUBLE_WRITE_ADDR_FIELD_HIGH = 7;
localparam HSSI_PLDADAPT_TX_FIFO_DOUBLE_WRITE_ADDR_FIELD_SIZE = 1;
localparam HSSI_PLDADAPT_TX_FIFO_DOUBLE_WRITE_ADDR_FIELD_BITMASK = 32'h00000080;
localparam HSSI_PLDADAPT_TX_FIFO_DOUBLE_WRITE_ADDR_FIELD_VALMASK = 32'h00000080;
localparam HSSI_PLDADAPT_TX_FIFO_DOUBLE_WRITE_ADDR_FIELD_VALUE = 1'h1;

localparam HSSI_PLDADAPT_TX_FIFO_WIDTH_VALUE = "fifo_double_width";

localparam HSSI_PLDADAPT_TX_GB_TX_IDWIDTH_VALUE = "idwidth_66";
localparam HSSI_PLDADAPT_TX_GB_TX_IDWIDTH_ADDR_OFST = 774;
localparam HSSI_PLDADAPT_TX_GB_TX_IDWIDTH_ADDR_FIELD_OFST = 1;
localparam HSSI_PLDADAPT_TX_GB_TX_IDWIDTH_ADDR_FIELD_HIGH = 3;
localparam HSSI_PLDADAPT_TX_GB_TX_IDWIDTH_ADDR_FIELD_SIZE = 3;
localparam HSSI_PLDADAPT_TX_GB_TX_IDWIDTH_ADDR_FIELD_BITMASK = 32'h0000000E;
localparam HSSI_PLDADAPT_TX_GB_TX_IDWIDTH_ADDR_FIELD_VALMASK = 32'h00000000;
localparam HSSI_PLDADAPT_TX_GB_TX_IDWIDTH_ADDR_FIELD_VALUE = 3'h0;

localparam HSSI_PLDADAPT_TX_GB_TX_ODWIDTH_VALUE = "odwidth_40";
localparam HSSI_PLDADAPT_TX_GB_TX_ODWIDTH_ADDR_OFST = 774;
localparam HSSI_PLDADAPT_TX_GB_TX_ODWIDTH_ADDR_FIELD_OFST = 4;
localparam HSSI_PLDADAPT_TX_GB_TX_ODWIDTH_ADDR_FIELD_HIGH = 5;
localparam HSSI_PLDADAPT_TX_GB_TX_ODWIDTH_ADDR_FIELD_SIZE = 2;
localparam HSSI_PLDADAPT_TX_GB_TX_ODWIDTH_ADDR_FIELD_BITMASK = 32'h00000030;
localparam HSSI_PLDADAPT_TX_GB_TX_ODWIDTH_ADDR_FIELD_VALMASK = 32'h00000010;
localparam HSSI_PLDADAPT_TX_GB_TX_ODWIDTH_ADDR_FIELD_VALUE = 2'h1;

localparam HSSI_PLDADAPT_TX_PHCOMP_RD_DEL_VALUE = "phcomp_rd_del3";
localparam HSSI_PLDADAPT_TX_PHCOMP_RD_DEL_ADDR_OFST = 769;
localparam HSSI_PLDADAPT_TX_PHCOMP_RD_DEL_ADDR_FIELD_OFST = 5;
localparam HSSI_PLDADAPT_TX_PHCOMP_RD_DEL_ADDR_FIELD_HIGH = 7;
localparam HSSI_PLDADAPT_TX_PHCOMP_RD_DEL_ADDR_FIELD_SIZE = 3;
localparam HSSI_PLDADAPT_TX_PHCOMP_RD_DEL_ADDR_FIELD_BITMASK = 32'h000000E0;
localparam HSSI_PLDADAPT_TX_PHCOMP_RD_DEL_ADDR_FIELD_VALMASK = 32'h00000060;
localparam HSSI_PLDADAPT_TX_PHCOMP_RD_DEL_ADDR_FIELD_VALUE = 3'h3;

localparam HSSI_PLDADAPT_TX_HDPLDADAPT_PLD_TX_CLK1_DCM_HZ_VALUE = 31'd156250000;

localparam HSSI_PLDADAPT_TX_HDPLDADAPT_PLD_TX_CLK1_ROWCLK_HZ_VALUE = 31'd156250000;

localparam HSSI_PLDADAPT_TX_HDPLDADAPT_PLD_TX_CLK2_DCM_HZ_VALUE = 31'd515625000;

localparam HSSI_PLDADAPT_TX_HDPLDADAPT_PLD_TX_CLK2_ROWCLK_HZ_VALUE = 31'd515625000;

localparam HSSI_PLDADAPT_TX_PMA_AIB_TX_CLK_EXPECTED_SETTING_VALUE = "x2";

localparam HSSI_PLDADAPT_TX_STRETCH_NUM_STAGES_VALUE = "two_stage";
localparam HSSI_PLDADAPT_TX_STRETCH_NUM_STAGES_ADDR_OFST = 784;
localparam HSSI_PLDADAPT_TX_STRETCH_NUM_STAGES_ADDR_FIELD_OFST = 0;
localparam HSSI_PLDADAPT_TX_STRETCH_NUM_STAGES_ADDR_FIELD_HIGH = 2;
localparam HSSI_PLDADAPT_TX_STRETCH_NUM_STAGES_ADDR_FIELD_SIZE = 3;
localparam HSSI_PLDADAPT_TX_STRETCH_NUM_STAGES_ADDR_FIELD_BITMASK = 32'h00000007;
localparam HSSI_PLDADAPT_TX_STRETCH_NUM_STAGES_ADDR_FIELD_VALMASK = 32'h00000002;
localparam HSSI_PLDADAPT_TX_STRETCH_NUM_STAGES_ADDR_FIELD_VALUE = 3'h2;

localparam HSSI_PLDADAPT_TX_TX_FIFO_POWER_MODE_VALUE = "full_width_ps_dw";
localparam HSSI_PLDADAPT_TX_TX_FIFO_POWER_MODE_ADDR_OFST = 771;
localparam HSSI_PLDADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_OFST = 5;
localparam HSSI_PLDADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_HIGH = 7;
localparam HSSI_PLDADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_SIZE = 3;
localparam HSSI_PLDADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_BITMASK = 32'h000000E0;
localparam HSSI_PLDADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_VALMASK = 32'h00000060;
localparam HSSI_PLDADAPT_TX_TX_FIFO_POWER_MODE_ADDR_FIELD_VALUE = 3'h3;

localparam HSSI_PLDADAPT_TX_TXFIFO_FULL_VALUE = "full_pc_dw";
localparam HSSI_PLDADAPT_TX_TXFIFO_FULL_ADDR_OFST = 769;
localparam HSSI_PLDADAPT_TX_TXFIFO_FULL_ADDR_FIELD_OFST = 0;
localparam HSSI_PLDADAPT_TX_TXFIFO_FULL_ADDR_FIELD_HIGH = 4;
localparam HSSI_PLDADAPT_TX_TXFIFO_FULL_ADDR_FIELD_SIZE = 5;
localparam HSSI_PLDADAPT_TX_TXFIFO_FULL_ADDR_FIELD_BITMASK = 32'h0000001F;
localparam HSSI_PLDADAPT_TX_TXFIFO_FULL_ADDR_FIELD_VALMASK = 32'h0000000E;
localparam HSSI_PLDADAPT_TX_TXFIFO_FULL_ADDR_FIELD_VALUE = 5'hE;

localparam HSSI_PLDADAPT_TX_TXFIFO_PFULL_VALUE = 5'd10;
localparam HSSI_PLDADAPT_TX_TXFIFO_PFULL_ADDR_OFST = 771;
localparam HSSI_PLDADAPT_TX_TXFIFO_PFULL_ADDR_FIELD_OFST = 0;
localparam HSSI_PLDADAPT_TX_TXFIFO_PFULL_ADDR_FIELD_HIGH = 4;
localparam HSSI_PLDADAPT_TX_TXFIFO_PFULL_ADDR_FIELD_SIZE = 5;
localparam HSSI_PLDADAPT_TX_TXFIFO_PFULL_ADDR_FIELD_BITMASK = 32'h0000001F;
localparam HSSI_PLDADAPT_TX_TXFIFO_PFULL_ADDR_FIELD_VALMASK = 32'h0000000A;
localparam HSSI_PLDADAPT_TX_TXFIFO_PFULL_ADDR_FIELD_VALUE = 5'hA;

localparam HSSI_PLDADAPT_TX_WORD_ALIGN_ENABLE_VALUE = "enable";

localparam HSSI_PLDADAPT_TX_WORD_MARK_VALUE = "wm_en";
localparam HSSI_PLDADAPT_TX_WORD_MARK_ADDR_OFST = 777;
localparam HSSI_PLDADAPT_TX_WORD_MARK_ADDR_FIELD_OFST = 5;
localparam HSSI_PLDADAPT_TX_WORD_MARK_ADDR_FIELD_HIGH = 5;
localparam HSSI_PLDADAPT_TX_WORD_MARK_ADDR_FIELD_SIZE = 1;
localparam HSSI_PLDADAPT_TX_WORD_MARK_ADDR_FIELD_BITMASK = 32'h00000020;
localparam HSSI_PLDADAPT_TX_WORD_MARK_ADDR_FIELD_VALMASK = 32'h00000020;
localparam HSSI_PLDADAPT_TX_WORD_MARK_ADDR_FIELD_VALUE = 1'h1;

localparam PMA_CDR_REFCLK_REFCLK_SELECT_VALUE = "ref_iqclk1";

localparam HSSI_RX_PCS_PMA_INTERFACE_BLOCK_SEL_VALUE = "ten_g_pcs";
localparam HSSI_RX_PCS_PMA_INTERFACE_BLOCK_SEL_ADDR_OFST = 10;
localparam HSSI_RX_PCS_PMA_INTERFACE_BLOCK_SEL_ADDR_FIELD_OFST = 0;
localparam HSSI_RX_PCS_PMA_INTERFACE_BLOCK_SEL_ADDR_FIELD_HIGH = 1;
localparam HSSI_RX_PCS_PMA_INTERFACE_BLOCK_SEL_ADDR_FIELD_SIZE = 2;
localparam HSSI_RX_PCS_PMA_INTERFACE_BLOCK_SEL_ADDR_FIELD_BITMASK = 32'h00000003;
localparam HSSI_RX_PCS_PMA_INTERFACE_BLOCK_SEL_ADDR_FIELD_VALMASK = 32'h00000002;
localparam HSSI_RX_PCS_PMA_INTERFACE_BLOCK_SEL_ADDR_FIELD_VALUE = 2'h2;

localparam HSSI_RX_PCS_PMA_INTERFACE_PMA_DW_RX_VALUE = "pma_40b_rx";

localparam HSSI_RX_PCS_PMA_INTERFACE_PROT_MODE_RX_VALUE = "teng_krfec_mode_rx";

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_CLKLOW_CLK_HZ_VALUE = 30'd322265625;

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_FREF_CLK_HZ_VALUE = 30'd322265625;

localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_BLOCK_SEL_VALUE = "teng";
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_BLOCK_SEL_ADDR_OFST = 36;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_BLOCK_SEL_ADDR_FIELD_OFST = 0;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_BLOCK_SEL_ADDR_FIELD_HIGH = 1;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_BLOCK_SEL_ADDR_FIELD_SIZE = 2;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_BLOCK_SEL_ADDR_FIELD_BITMASK = 32'h00000003;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_BLOCK_SEL_ADDR_FIELD_VALMASK = 32'h00000001;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_BLOCK_SEL_ADDR_FIELD_VALUE = 2'h1;

localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_CLK_OUT_SEL_VALUE = "teng_clk_out";
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_CLK_OUT_SEL_ADDR_OFST = 36;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_CLK_OUT_SEL_ADDR_FIELD_OFST = 6;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_CLK_OUT_SEL_ADDR_FIELD_HIGH = 7;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_CLK_OUT_SEL_ADDR_FIELD_SIZE = 2;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_CLK_OUT_SEL_ADDR_FIELD_BITMASK = 32'h000000C0;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_CLK_OUT_SEL_ADDR_FIELD_VALMASK = 32'h00000040;
localparam HSSI_RX_PLD_PCS_INTERFACE_PCS_RX_CLK_OUT_SEL_ADDR_FIELD_VALUE = 2'h1;

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS10G_PMA_DW_RX_VALUE = "pma_40b_rx";

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PMA_DW_RX_VALUE = "pma_40b_rx";

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PMA_IF_PMA_DW_RX_VALUE = "pma_40b_rx";

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PMA_RX_CLK_HZ_VALUE = 30'd257812500;

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS10G_PROT_MODE_RX_VALUE = "teng_1588_mode_rx";

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS8G_PROT_MODE_RX_VALUE = "disabled_prot_mode_rx";

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PROT_MODE_RX_VALUE = "teng_1588_baser_rx";

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PLD_IF_PROT_MODE_RX_VALUE = "teng_reg_mode_rx";

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PMA_IF_PROT_MODE_RX_VALUE = "teng_krfec_mode_rx";

localparam HSSI_RX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_SHARE_FIFO_MEM_PROT_MODE_RX_VALUE = "teng_mode_rx";

localparam HSSI_TX_PCS_PMA_INTERFACE_PMA_DW_TX_VALUE = "pma_40b_tx";

localparam HSSI_TX_PCS_PMA_INTERFACE_PROT_MODE_TX_VALUE = "teng_krfec_mode_tx";

localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_VALUE = "ten_g_pcs";
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR0_OFST = 6;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR0_FIELD_OFST = 0;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR0_FIELD_HIGH = 2;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR0_FIELD_SIZE = 3;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR0_FIELD_BITMASK = 32'h00000007;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR0_FIELD_VALMASK = 32'h00000003;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR0_FIELD_VALUE = 3'h3;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR1_OFST = 8;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR1_FIELD_OFST = 5;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR1_FIELD_HIGH = 6;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR1_FIELD_SIZE = 2;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR1_FIELD_BITMASK = 32'h00000060;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR1_FIELD_VALMASK = 32'h00000000;
localparam HSSI_TX_PCS_PMA_INTERFACE_TX_PMA_DATA_SEL_ADDR1_FIELD_VALUE = 2'h0;

localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_OUT_SEL_VALUE = "teng_clk_out";
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_OUT_SEL_ADDR_OFST = 34;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_OUT_SEL_ADDR_FIELD_OFST = 0;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_OUT_SEL_ADDR_FIELD_HIGH = 1;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_OUT_SEL_ADDR_FIELD_SIZE = 2;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_OUT_SEL_ADDR_FIELD_BITMASK = 32'h00000003;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_OUT_SEL_ADDR_FIELD_VALMASK = 32'h00000001;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_OUT_SEL_ADDR_FIELD_VALUE = 2'h1;

localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_SOURCE_VALUE = "teng";
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_SOURCE_ADDR_OFST = 34;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_SOURCE_ADDR_FIELD_OFST = 2;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_SOURCE_ADDR_FIELD_HIGH = 3;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_SOURCE_ADDR_FIELD_SIZE = 2;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_SOURCE_ADDR_FIELD_BITMASK = 32'h0000000C;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_SOURCE_ADDR_FIELD_VALMASK = 32'h00000004;
localparam HSSI_TX_PLD_PCS_INTERFACE_PCS_TX_CLK_SOURCE_ADDR_FIELD_VALUE = 2'h1;

localparam HSSI_TX_PLD_PCS_INTERFACE_HD_PCS10G_PMA_DW_TX_VALUE = "pma_40b_tx";

localparam HSSI_TX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PMA_DW_TX_VALUE = "pma_40b_tx";

localparam HSSI_TX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PMA_IF_PMA_DW_TX_VALUE = "pma_40b_tx";

localparam HSSI_TX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PMA_TX_CLK_HZ_VALUE = 30'd257812500;

localparam HSSI_TX_PLD_PCS_INTERFACE_HD_PCS10G_PROT_MODE_TX_VALUE = "teng_1588_mode_tx";

localparam HSSI_TX_PLD_PCS_INTERFACE_HD_PCS8G_PROT_MODE_TX_VALUE = "disabled_prot_mode_tx";

localparam HSSI_TX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PROT_MODE_TX_VALUE = "teng_1588_baser_tx";

localparam HSSI_TX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PLD_IF_PROT_MODE_TX_VALUE = "teng_reg_mode_tx";

localparam HSSI_TX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_PMA_IF_PROT_MODE_TX_VALUE = "teng_krfec_mode_tx";

localparam HSSI_TX_PLD_PCS_INTERFACE_HD_PCS_CHANNEL_SHARE_FIFO_MEM_PROT_MODE_TX_VALUE = "teng_mode_tx";

endpackage