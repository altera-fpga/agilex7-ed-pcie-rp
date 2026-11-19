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


`timescale 1 ps / 1 ps

module alt_mge_rd #(
    parameter NUM_OF_CHANNEL = 1,
    parameter MAX_NUM_OF_CHANNEL = 2
) (
    
    // CSR Clock
    input                                   csr_clk,
    input                                   reset_csr_clk,
    
    // MAC Clock
    output                                  mac_clk,
    
    // XGMII Clock
    output                                  mac64b_clk,
    
    // Reference Clock
    input                                   refclk_1g2p5g,
    input                                   refclk_core,
    input                                   refclk_10g,
    
    // Reset
    input                                   reset,
    output [NUM_OF_CHANNEL-1:0]             tx_digitalreset,
    output [NUM_OF_CHANNEL-1:0]             rx_digitalreset,
    output [NUM_OF_CHANNEL-1:0]             rx_digitalreset_stat,
    
    //CSR
    input  [16:0]                           csr_address,
    input                                   csr_write,
    input                                   csr_read,
    output                                  csr_waitrequest,
    input  [3:0]                            csr_byteenable,
    input                                   csr_debugaccess,
    input                                   csr_burstcount,
    input  [31:0]                           csr_writedata,
    output [31:0]                           csr_readdata,
    output                                  csr_readdatavalid,
    
    
    // MAC TX User Frame
    input  [NUM_OF_CHANNEL-1:0]             avalon_st_tx_valid,
    output [NUM_OF_CHANNEL-1:0]             avalon_st_tx_ready,
    input  [NUM_OF_CHANNEL-1:0]             avalon_st_tx_startofpacket,
    input  [NUM_OF_CHANNEL-1:0]             avalon_st_tx_endofpacket,
    input  [NUM_OF_CHANNEL-1:0][63:0]       avalon_st_tx_data,
    input  [NUM_OF_CHANNEL-1:0][ 2:0]       avalon_st_tx_empty,
    input  [NUM_OF_CHANNEL-1:0]             avalon_st_tx_error,
    
    // MAC RX User Frame
    output [NUM_OF_CHANNEL-1:0]             avalon_st_rx_valid,
    input  [NUM_OF_CHANNEL-1:0]             avalon_st_rx_ready,
    output [NUM_OF_CHANNEL-1:0]             avalon_st_rx_startofpacket,
    output [NUM_OF_CHANNEL-1:0]             avalon_st_rx_endofpacket,
    output [NUM_OF_CHANNEL-1:0][63:0]       avalon_st_rx_data,
    output [NUM_OF_CHANNEL-1:0][ 2:0]       avalon_st_rx_empty,
    output [NUM_OF_CHANNEL-1:0][ 5:0]       avalon_st_rx_error,
    
    // MAC TX Frame Status
    output [NUM_OF_CHANNEL-1:0]             avalon_st_txstatus_valid,
    output [NUM_OF_CHANNEL-1:0][39:0]       avalon_st_txstatus_data,
    output [NUM_OF_CHANNEL-1:0][ 6:0]       avalon_st_txstatus_error,
    
    // MAC RX Frame Status
    output [NUM_OF_CHANNEL-1:0]             avalon_st_rxstatus_valid,
    output [NUM_OF_CHANNEL-1:0][39:0]       avalon_st_rxstatus_data,
    output [NUM_OF_CHANNEL-1:0][ 6:0]       avalon_st_rxstatus_error,
    
    // MAC TX Pause Frame Generation Command
    input  [NUM_OF_CHANNEL-1:0][ 1:0]       avalon_st_pause_data,
    
    // MAC Status
    output [NUM_OF_CHANNEL-1:0][ 1:0]       xgmii_rx_link_fault_status,
    
    // PHY Status
    output [NUM_OF_CHANNEL-1:0]             led_link,
    output [NUM_OF_CHANNEL-1:0]             led_char_err,
    output [NUM_OF_CHANNEL-1:0]             led_disp_err,
    output [NUM_OF_CHANNEL-1:0]             led_an,
    output [NUM_OF_CHANNEL-1:0]             rx_block_lock,
    
    // Transceiver Serial Interface
    output [NUM_OF_CHANNEL-1:0]             tx_serial_data,
    input  [NUM_OF_CHANNEL-1:0]             rx_serial_data,
    output [NUM_OF_CHANNEL-1:0]             rx_pma_clkout,
    
    // Data Path Readiness
    output [NUM_OF_CHANNEL-1:0]             channel_tx_ready,
    output [NUM_OF_CHANNEL-1:0]             channel_rx_ready,
         
    output [NUM_OF_CHANNEL-1:0][ 1:0]       xcvr_mode_out,
    
    // 1588
    input  [NUM_OF_CHANNEL-1:0]             tx_egress_timestamp_request_in_valid,
    input  [NUM_OF_CHANNEL-1:0][7:0]        tx_egress_timestamp_request_in_fingerprint,
    
    output [NUM_OF_CHANNEL-1:0]             tx_egress_timestamp_96b_valid,
    output [NUM_OF_CHANNEL-1:0][95:0]       tx_egress_timestamp_96b_data,
    output [NUM_OF_CHANNEL-1:0][7:0]        tx_egress_timestamp_96b_fingerprint,
    
    output [NUM_OF_CHANNEL-1:0]             rx_ingress_timestamp_96b_valid,
    output [NUM_OF_CHANNEL-1:0][95:0]       rx_ingress_timestamp_96b_data,
    
    input  [NUM_OF_CHANNEL-1:0]             start_tod_sync,
    output [NUM_OF_CHANNEL-1:0]             pulse_per_second,
    output                                  master_pulse_per_second,
    output                                  core_pll_locked,
    output                                  xcvr_sampling_pll_locked,
    output                                  tod_sampling_pll_locked
);
    
    // Local parameter
    localparam NUM_OF_CH_WIDTH = log2ceil(NUM_OF_CHANNEL);
    localparam PPS_PULSE_ASSERT_CYCLE_MASTER   = 1250000;
    
    // Loop Control Variable
    genvar i;
    
    // Clock
    wire                            latency_sclk;
    wire                            tod_sampling_clk;
    
    // Transceiver PLL
    wire                            xcvr_pll_10g_pll_locked;
    wire                            xcvr_pll_10g_pll_cal_busy;
    wire                            xcvr_pll_10g_serial_clk;
    
    wire [((NUM_OF_CHANNEL-1)/6):0] xcvr_pll_2p5g_pll_locked;
    wire [((NUM_OF_CHANNEL-1)/6):0] xcvr_pll_2p5g_pll_cal_busy;
    wire [((NUM_OF_CHANNEL-1)/6):0] xcvr_pll_2p5g_serial_clk;
    
    wire [((NUM_OF_CHANNEL-1)/6):0] xcvr_pll_1g_pll_locked;
    wire [((NUM_OF_CHANNEL-1)/6):0] xcvr_pll_1g_pll_cal_busy;
    wire [((NUM_OF_CHANNEL-1)/6):0] xcvr_pll_1g_serial_clk;
    
    // Transceiver Reset
    wire [NUM_OF_CHANNEL-1:0]       tx_analogreset;
    wire [NUM_OF_CHANNEL-1:0]       rx_analogreset;
     
    wire [NUM_OF_CHANNEL-1:0]       tx_analogreset_stat;
    wire [NUM_OF_CHANNEL-1:0]       rx_analogreset_stat;
    wire [NUM_OF_CHANNEL-1:0]       tx_digitalreset_stat;
    //wire [NUM_OF_CHANNEL-1:0]       rx_digitalreset_stat;
    
    // Reset Controller
    wire [NUM_OF_CHANNEL-1:0]       reset_ctrl_tx_ready;
    wire [NUM_OF_CHANNEL-1:0]       reset_ctrl_rx_ready;
    
    // Reset Synchronization
    // wire                            reset_csr_clk;
    
    // MAC Status
    wire [NUM_OF_CHANNEL-1:0]       xgmii_rx_link_fault_status_good;
    
    // Transceiver Status
    wire [NUM_OF_CHANNEL-1:0]       rx_is_lockedtodata;
    wire [NUM_OF_CHANNEL-1:0]       tx_cal_busy;
    wire [NUM_OF_CHANNEL-1:0]       rx_cal_busy;
    
    // Transceiver Reconfiguration
    wire    [NUM_OF_CH_WIDTH +10:0] mge_rcfg_address;
    wire                            mge_rcfg_read;
    wire                            mge_rcfg_write;
    wire                     [31:0] mge_rcfg_writedata;
    wire [NUM_OF_CHANNEL-1:0][31:0] mge_rcfg_readdata;
    wire [NUM_OF_CHANNEL-1:0]       mge_rcfg_waitrequest;
    
    // Reconfiguration Signals
    wire [NUM_OF_CHANNEL-1:0][ 2:0] operating_speed;
    wire [NUM_OF_CHANNEL-1:0][ 1:0] xcvr_mode;
    wire [NUM_OF_CHANNEL-1:0][ 1:0] pll_select;
    wire [NUM_OF_CHANNEL-1:0]       reconfig_busy;

    // Reconfig CSR
    wire [ 1:0]                     csr_rcfg_address;
    wire                            csr_rcfg_read;
    wire                            csr_rcfg_write;
    wire [31:0]                     csr_rcfg_writedata;
    wire [31:0]                     csr_rcfg_readdata;
    // MAC CSR
    wire [MAX_NUM_OF_CHANNEL-1:0][ 9:0] csr_mac_address;
    wire [MAX_NUM_OF_CHANNEL-1:0]       csr_mac_read;
    wire [MAX_NUM_OF_CHANNEL-1:0]       csr_mac_write;
    wire [MAX_NUM_OF_CHANNEL-1:0][31:0] csr_mac_writedata;
    wire [MAX_NUM_OF_CHANNEL-1:0][31:0] csr_mac_readdata;
    wire [MAX_NUM_OF_CHANNEL-1:0]       csr_mac_waitrequest;
    
    // PHY CSR
    wire [MAX_NUM_OF_CHANNEL-1:0][10:0] csr_phy_address;
    wire [MAX_NUM_OF_CHANNEL-1:0]       csr_phy_read;
    wire [MAX_NUM_OF_CHANNEL-1:0]       csr_phy_write;
    wire [MAX_NUM_OF_CHANNEL-1:0][31:0] csr_phy_writedata;
    wire [MAX_NUM_OF_CHANNEL-1:0][31:0] csr_phy_readdata;
    wire [MAX_NUM_OF_CHANNEL-1:0]       csr_phy_waitrequest;
    
    // TODs CSR
    wire [3:0]                      csr_master_tod_address;
    wire                            csr_master_tod_write;
    wire                            csr_master_tod_read;
    wire [31:0]                     csr_master_tod_writedata;
    wire [31:0]                     csr_master_tod_readdata;
    wire                            csr_master_tod_waitrequest;
    
    wire [MAX_NUM_OF_CHANNEL-1:0][3:0]  csr_10g_tod_address;
    wire [MAX_NUM_OF_CHANNEL-1:0]       csr_10g_tod_write;
    wire [MAX_NUM_OF_CHANNEL-1:0]       csr_10g_tod_read;
    wire [MAX_NUM_OF_CHANNEL-1:0][31:0] csr_10g_tod_writedata;
    wire [MAX_NUM_OF_CHANNEL-1:0][31:0] csr_10g_tod_readdata;
    wire [MAX_NUM_OF_CHANNEL-1:0]       csr_10g_tod_waitrequest;
    
    wire [MAX_NUM_OF_CHANNEL-1:0][3:0]  csr_2p5g_tod_address;
    wire [MAX_NUM_OF_CHANNEL-1:0]       csr_2p5g_tod_write;
    wire [MAX_NUM_OF_CHANNEL-1:0]       csr_2p5g_tod_read;
    wire [MAX_NUM_OF_CHANNEL-1:0][31:0] csr_2p5g_tod_writedata;
    wire [MAX_NUM_OF_CHANNEL-1:0][31:0] csr_2p5g_tod_readdata;
    wire [MAX_NUM_OF_CHANNEL-1:0]       csr_2p5g_tod_waitrequest;
   
    wire [MAX_NUM_OF_CHANNEL-1:0][3:0]  csr_1g_tod_address;
    wire [MAX_NUM_OF_CHANNEL-1:0]       csr_1g_tod_write;
    wire [MAX_NUM_OF_CHANNEL-1:0]       csr_1g_tod_read;
    wire [MAX_NUM_OF_CHANNEL-1:0][31:0] csr_1g_tod_writedata;
    wire [MAX_NUM_OF_CHANNEL-1:0][31:0] csr_1g_tod_readdata;
    wire [MAX_NUM_OF_CHANNEL-1:0]       csr_1g_tod_waitrequest;
    
    // 1588
    wire                            master_tod_clk;
    wire                            master_tod_reset_sync;
    wire [95:0]                     master_tod_96b;
    wire                            tod_sync_10g_sampling_clk;
    wire                            tod_sync_2p5g_sampling_clk;
    wire                            tod_sync_1g_sampling_clk;
    wire                            calc_clk;            // sampling clock for GIGE PCS latency measurement
    
    assign  master_tod_clk = refclk_core;
    assign  calc_clk = tod_sampling_clk;
    assign  tod_sync_10g_sampling_clk = tod_sampling_clk;
    assign  tod_sync_2p5g_sampling_clk = tod_sampling_clk;
    assign  tod_sync_1g_sampling_clk = tod_sampling_clk;
    
    // TX PLL for 10G
    alt_mge_xcvr_atx_pll_10g u_xcvr_atx_pll_10g (
        .pll_refclk0     (refclk_10g),
        .tx_serial_clk   (),
        .mcgb_serial_clk (xcvr_pll_10g_serial_clk),
        .pll_locked      (xcvr_pll_10g_pll_locked),
        .pll_cal_busy    (xcvr_pll_10g_pll_cal_busy)
    );
    
    genvar phypllid;
    generate
        for (phypllid = 0; phypllid <= ((NUM_OF_CHANNEL-1)/6); phypllid = phypllid+1)
        begin: PHY_PLL
        // TX PLL for 2.5G
        alt_mge_xcvr_atx_pll_2p5g u_xcvr_atx_pll_2p5g (
            .pll_refclk0     (refclk_1g2p5g),
            .tx_serial_clk   (xcvr_pll_2p5g_serial_clk[phypllid]),
            .mcgb_serial_clk (),
            .pll_locked      (xcvr_pll_2p5g_pll_locked[phypllid]),
            .pll_cal_busy    (xcvr_pll_2p5g_pll_cal_busy[phypllid])
        );
        
        // TX PLL for 1G
        alt_mge_xcvr_fpll_1g u_xcvr_fpll_1g (
            .pll_refclk0     (refclk_1g2p5g),
            .pll_locked      (xcvr_pll_1g_pll_locked[phypllid]),
            .tx_serial_clk   (xcvr_pll_1g_serial_clk[phypllid]),
            .pll_cal_busy    (xcvr_pll_1g_pll_cal_busy[phypllid]),
            .mcgb_serial_clk ()
        );
        end //end for
    endgenerate
    
    // Core PLL
    alt_mge_core_pll core_pll (
        .pll_refclk0        (refclk_10g),
        .outclk_div1        (mac_clk),
        .outclk_div2        (mac64b_clk),
        .pll_locked         (core_pll_locked),
        .pll_cal_busy       ()
    );
    
    // Sampling clock for Native PHY
    pll_sampling_clk xcvr_sampling_pll (
        .pll_refclk0        (refclk_1g2p5g),
        .outclk_div1        (latency_sclk),
        .pll_locked         (xcvr_sampling_pll_locked),
        .pll_cal_busy       ()
    );
    
    // Sampling clock for ToD Sync
    pll_tod_sync_sampling_clock tod_sampling_pll (
        .pll_refclk0        (refclk_1g2p5g),
        .outclk_div1        (tod_sampling_clk),
        .pll_locked         (tod_sampling_pll_locked),
        .pll_cal_busy       ()
    );
    
//    // Reset Synchronization
//    alt_mge_reset_synchronizer #(
//        .ASYNC_RESET    (1),
//        .DEPTH          (3)
//    ) u_rst_sync_csr_clk (
//        .clk            (csr_clk),
//        .reset_in       (reset),
//        .reset_out      (reset_csr_clk)
//    );
    
    alt_mge_reset_synchronizer #(
        .ASYNC_RESET    (1),
        .DEPTH          (3)
    ) u_rst_master_tod_clk (
        .clk            (master_tod_clk),
        .reset_in       (reset),
        .reset_out      (master_tod_reset_sync)
    );
    
    generate for(i = 0; i < NUM_OF_CHANNEL; i = i + 1)
    begin : CHANNEL_GEN

        // MAC + PHY
        alt_mge_channel u_channel (
            .latency_sclk               (latency_sclk),
            
            // CSR Clock
            .csr_clk                    (csr_clk),
            
            // MAC Clock
            .mac_clk                    (mac_clk),
            
            // XGMII Clock
            .mac64b_clk                 (mac64b_clk),
            
            // Latency Measurement Clock
            .latency_measure_clk        (calc_clk),
            
            // Sampling Clock
            .tod_sync_10g_sampling_clk  (tod_sync_10g_sampling_clk),
            .tod_sync_2p5g_sampling_clk (tod_sync_2p5g_sampling_clk),
            .tod_sync_1g_sampling_clk   (tod_sync_1g_sampling_clk),
            
            // Reset
            .reset                      (reset),
            .tx_digitalreset            (tx_digitalreset[i]),
            .tx_digitalreset_stat       (tx_digitalreset_stat[i]),
            .rx_digitalreset            (rx_digitalreset[i]),
            .rx_digitalreset_stat       (rx_digitalreset_stat[i]),
            .tx_analogreset             (tx_analogreset[i]),
            .tx_analogreset_stat        (tx_analogreset_stat[i]),
            .rx_analogreset             (rx_analogreset[i]),
            .rx_analogreset_stat        (rx_analogreset_stat[i]),
            
            // MAC CSR
            .csr_mac_address            (csr_mac_address[i]),
            .csr_mac_read               (csr_mac_read[i]),
            .csr_mac_write              (csr_mac_write[i]),
            .csr_mac_writedata          (csr_mac_writedata[i]),
            .csr_mac_readdata           (csr_mac_readdata[i]),
            .csr_mac_waitrequest        (csr_mac_waitrequest[i]),
            
            // MAC TX User Frame
            .avalon_st_tx_valid         (avalon_st_tx_valid[i]),
            .avalon_st_tx_ready         (avalon_st_tx_ready[i]),
            .avalon_st_tx_startofpacket (avalon_st_tx_startofpacket[i]),
            .avalon_st_tx_endofpacket   (avalon_st_tx_endofpacket[i]),
            .avalon_st_tx_data          (avalon_st_tx_data[i]),
            .avalon_st_tx_empty         (avalon_st_tx_empty[i]),
            .avalon_st_tx_error         (avalon_st_tx_error[i]),
            
            // MAC RX User Frame
            .avalon_st_rx_valid         (avalon_st_rx_valid[i]),
            .avalon_st_rx_ready         (avalon_st_rx_ready[i]),
            .avalon_st_rx_startofpacket (avalon_st_rx_startofpacket[i]),
            .avalon_st_rx_endofpacket   (avalon_st_rx_endofpacket[i]),
            .avalon_st_rx_data          (avalon_st_rx_data[i]),
            .avalon_st_rx_empty         (avalon_st_rx_empty[i]),
            .avalon_st_rx_error         (avalon_st_rx_error[i]),
            
            // MAC TX Frame Status
            .avalon_st_txstatus_valid   (avalon_st_txstatus_valid[i]),
            .avalon_st_txstatus_data    (avalon_st_txstatus_data[i]),
            .avalon_st_txstatus_error   (avalon_st_txstatus_error[i]),
            
            // MAC RX Frame Status
            .avalon_st_rxstatus_valid   (avalon_st_rxstatus_valid[i]),
            .avalon_st_rxstatus_data    (avalon_st_rxstatus_data[i]),
            .avalon_st_rxstatus_error   (avalon_st_rxstatus_error[i]),
            
            // MAC TX Pause Frame Generation Command
            .avalon_st_pause_data       (avalon_st_pause_data[i]),
            
            // MAC Status
            .xgmii_rx_link_fault_status (xgmii_rx_link_fault_status[i]),
            
            // PHY CSR
            .csr_phy_address            (csr_phy_address[i]),
            .csr_phy_read               (csr_phy_read[i]),
            .csr_phy_write              (csr_phy_write[i]),
            .csr_phy_writedata          (csr_phy_writedata[i]),
            .csr_phy_readdata           (csr_phy_readdata[i]),
            .csr_phy_waitrequest        (csr_phy_waitrequest[i]),
            
            // PHY Operating Speed
            .operating_speed            (operating_speed[i]),
            
            // PHY Operating Mode from Reconfig Block
            .xcvr_mode                  (xcvr_mode[i]),
            
            // PHY Status
            .led_link                   (led_link[i]),
            .led_char_err               (led_char_err[i]),
            .led_disp_err               (led_disp_err[i]),
            .led_an                     (led_an[i]),
            .rx_block_lock              (rx_block_lock[i]),
            
            // Transceiver Serial Interface
            .tx_serial_clk              ({xcvr_pll_10g_serial_clk, xcvr_pll_1g_serial_clk[i/6], xcvr_pll_2p5g_serial_clk[i/6]}),
            .rx_cdr_refclk              (refclk_1g2p5g),
            .rx_cdr_refclk_1            (refclk_10g),
            .rx_pma_clkout              (rx_pma_clkout[i]),
            .tx_serial_data             (tx_serial_data[i]),
            .rx_serial_data             (rx_serial_data[i]),
            
            // Transceiver Status
            .rx_is_lockedtodata         (rx_is_lockedtodata[i]),
            .tx_cal_busy                (tx_cal_busy[i]),
            .rx_cal_busy                (rx_cal_busy[i]),
            
            // Transceiver Reconfiguration
            .reconfig_clk               (csr_clk),
            .reconfig_reset             (reset_csr_clk),
            .reconfig_address           (mge_rcfg_address[10:0]),
            .reconfig_read              (mge_rcfg_read && (mge_rcfg_address[NUM_OF_CH_WIDTH+10:11] == i[NUM_OF_CH_WIDTH-1:0])),
            .reconfig_write             (mge_rcfg_write && (mge_rcfg_address[NUM_OF_CH_WIDTH+10:11] == i[NUM_OF_CH_WIDTH-1:0])),
            .reconfig_writedata         (mge_rcfg_writedata),
            .reconfig_readdata          (mge_rcfg_readdata[i]),
            .reconfig_waitrequest       (mge_rcfg_waitrequest[i]),
            
            // TOD CSR
            .alt_mge_1588_tod_10g_csr_address      (csr_10g_tod_address[i]),
            .alt_mge_1588_tod_10g_csr_write        (csr_10g_tod_write[i]),
            .alt_mge_1588_tod_10g_csr_read         (csr_10g_tod_read[i]),
            .alt_mge_1588_tod_10g_csr_writedata    (csr_10g_tod_writedata[i]),
            .alt_mge_1588_tod_10g_csr_readdata     (csr_10g_tod_readdata[i]),
            .alt_mge_1588_tod_10g_csr_waitrequest  (csr_10g_tod_waitrequest[i]),

            .alt_mge_1588_tod_2p5g_csr_address     (csr_2p5g_tod_address[i]),
            .alt_mge_1588_tod_2p5g_csr_write       (csr_2p5g_tod_write[i]),
            .alt_mge_1588_tod_2p5g_csr_read        (csr_2p5g_tod_read[i]),
            .alt_mge_1588_tod_2p5g_csr_writedata   (csr_2p5g_tod_writedata[i]),
            .alt_mge_1588_tod_2p5g_csr_readdata    (csr_2p5g_tod_readdata[i]),
            .alt_mge_1588_tod_2p5g_csr_waitrequest (csr_2p5g_tod_waitrequest[i]),

            .alt_mge_1588_tod_1g_csr_address       (csr_1g_tod_address[i]),
            .alt_mge_1588_tod_1g_csr_write         (csr_1g_tod_write[i]),
            .alt_mge_1588_tod_1g_csr_read          (csr_1g_tod_read[i]),
            .alt_mge_1588_tod_1g_csr_writedata     (csr_1g_tod_writedata[i]),
            .alt_mge_1588_tod_1g_csr_readdata      (csr_1g_tod_readdata[i]),
            .alt_mge_1588_tod_1g_csr_waitrequest   (csr_1g_tod_waitrequest[i]),
            
            // 1588
            .tx_egress_timestamp_request_in_valid                       (tx_egress_timestamp_request_in_valid[i]),
            .tx_egress_timestamp_request_in_fingerprint                 (tx_egress_timestamp_request_in_fingerprint[i]),
            .tx_egress_timestamp_96b_valid                              (tx_egress_timestamp_96b_valid[i]),
            .tx_egress_timestamp_96b_data                               (tx_egress_timestamp_96b_data[i]),
            .tx_egress_timestamp_96b_fingerprint                        (tx_egress_timestamp_96b_fingerprint[i]),
            .rx_ingress_timestamp_96b_valid                             (rx_ingress_timestamp_96b_valid[i]),
            .rx_ingress_timestamp_96b_data                              (rx_ingress_timestamp_96b_data[i]),
            .master_tod_clk                                             (master_tod_clk),
            .master_tod_reset                                           (master_tod_reset_sync),
            .master_tod_96b_data                                        (master_tod_96b),
            .start_tod_sync                                             (start_tod_sync[i]),
            .pulse_per_second                                           (pulse_per_second[i])
        );
        
        // PLL select based on MIF configuration
        // Following table shows default configuration in Reference Design
        // ------------------------------
        // | MIF Mode |  Speed   | PLL  |
        // ------------------------------
        // |   2'b00  |     1G   | 2'h1 |
        // |   2'b01  |   2.5G   | 2'h0 |
        // |   2'b10  |     5G   | 2'h2 |
        // |   2'b11  |    10G   | 2'h2 |
        // ------------------------------
        assign pll_select[i] = (xcvr_mode[i] == 2'b00) ? 2'h1 :
                               (xcvr_mode[i] == 2'b01) ? 2'h0 : 2'h2;
        
        assign xcvr_mode_out = xcvr_mode;

        // Reset Controller for Transceiver Channel
        alt_mge_xcvr_reset_ctrl_channel u_xcvr_reset_ctrl_ch (
            .clock              (refclk_core),
            .reset              (reset | reconfig_busy[i]),
            .tx_analogreset     (tx_analogreset[i]),
            .tx_digitalreset    (tx_digitalreset[i]),
            .tx_ready           (reset_ctrl_tx_ready[i]),
            .pll_locked         ({xcvr_pll_10g_pll_locked, xcvr_pll_1g_pll_locked[i/6], xcvr_pll_2p5g_pll_locked[i/6]}),
            .pll_select         (pll_select[i]),
            .tx_cal_busy        (tx_cal_busy[i]),
            .rx_analogreset     (rx_analogreset[i]),
            .rx_digitalreset    (rx_digitalreset[i]),
            .rx_analogreset_stat(rx_analogreset_stat[i]),
            .rx_digitalreset_stat (rx_digitalreset_stat[i]),
            .tx_analogreset_stat(tx_analogreset_stat[i]),
            .tx_digitalreset_stat(tx_digitalreset_stat[i]),
            .rx_ready           (reset_ctrl_rx_ready[i]),
            .rx_is_lockedtodata (rx_is_lockedtodata[i]),
            .rx_cal_busy        (rx_cal_busy[i]) 
            //.pll_cal_busy       ({xcvr_pll_10g_pll_cal_busy, xcvr_pll_1g_pll_cal_busy, xcvr_pll_2p5g_pll_cal_busy}),   
        );
        
        // Channel readiness status
        assign xgmii_rx_link_fault_status_good[i] = ((operating_speed[i] == 3'b000) || (operating_speed[i] == 3'b101)) ? (xgmii_rx_link_fault_status[i] == 2'b00) : 1'b1;
        
        assign channel_tx_ready[i] = reset_ctrl_tx_ready[i] & (xgmii_rx_link_fault_status_good[i]);
        assign channel_rx_ready[i] = reset_ctrl_rx_ready[i] & (led_link[i] | rx_block_lock[i]);
        
        
        subsys_10gbe_addr_decoder u_10gbe_addr_decoder (
            .csr_master_tod_address       (csr_master_tod_address),       //  output,   width = 4,   csr_master_tod.address
            .csr_master_tod_read          (csr_master_tod_read),          //  output,   width = 1,                 .read
            .csr_master_tod_write         (csr_master_tod_write),         //  output,   width = 1,                 .write
            .csr_master_tod_writedata     (csr_master_tod_writedata),     //  output,  width = 32,                 .writedata
            .csr_master_tod_readdata      (csr_master_tod_readdata),      //   input,  width = 32,                 .readdata
            .csr_master_tod_waitrequest   (csr_master_tod_waitrequest),   //   input,   width = 1,                 .waitrequest
            .csr_reconfig_address         (csr_rcfg_address),         //  output,   width = 2,     csr_reconfig.address
            .csr_reconfig_read            (csr_rcfg_read),            //  output,   width = 1,                 .read
            .csr_reconfig_write           (csr_rcfg_write),           //  output,   width = 1,                 .write
            .csr_reconfig_writedata       (csr_rcfg_writedata),       //  output,  width = 32,                 .writedata
            .csr_reconfig_readdata        (csr_rcfg_readdata),        //   input,  width = 32,                 .readdata
            .csr_mac_ch1_address          (csr_mac_address[0]),          //  output,  width = 10,      csr_mac_ch1.address
            .csr_mac_ch1_read             (csr_mac_read[0]),             //  output,   width = 1,                 .read
            .csr_mac_ch1_write            (csr_mac_write[0]),            //  output,   width = 1,                 .write
            .csr_mac_ch1_writedata        (csr_mac_writedata[0]),        //  output,  width = 32,                 .writedata
            .csr_mac_ch1_readdata         (csr_mac_readdata[0]),         //   input,  width = 32,                 .readdata
            .csr_mac_ch1_waitrequest      (csr_mac_waitrequest[0]),      //   input,   width = 1,                 .waitrequest
            .csr_phy_ch1_address          (csr_phy_address[0]),          //  output,  width = 11,      csr_phy_ch1.address
            .csr_phy_ch1_read             (csr_phy_read[0]),             //  output,   width = 1,                 .read
            .csr_phy_ch1_write            (csr_phy_write[0]),            //  output,   width = 1,                 .write
            .csr_phy_ch1_writedata        (csr_phy_writedata[0]),        //  output,  width = 32,                 .writedata
            .csr_phy_ch1_readdata         (csr_phy_readdata[0]),         //   input,  width = 32,                 .readdata
            .csr_phy_ch1_waitrequest      (csr_phy_waitrequest[0]),      //   input,   width = 1,                 .waitrequest
            .csr_tod_10g_ch1_address      (csr_10g_tod_address[0]),      //  output,   width = 4,  csr_tod_10g_ch1.address
            .csr_tod_10g_ch1_read         (csr_10g_tod_read[0]),         //  output,   width = 1,                 .read
            .csr_tod_10g_ch1_write        (csr_10g_tod_write[0]),        //  output,   width = 1,                 .write
            .csr_tod_10g_ch1_writedata    (csr_10g_tod_writedata[0]),    //  output,  width = 32,                 .writedata
            .csr_tod_10g_ch1_readdata     (csr_10g_tod_readdata[0]),     //   input,  width = 32,                 .readdata
            .csr_tod_10g_ch1_waitrequest  (csr_10g_tod_waitrequest[0]),  //   input,   width = 1,                 .waitrequest
            .csr_tod_1g_ch1_address       (csr_1g_tod_address[0]),       //  output,   width = 4,   csr_tod_1g_ch1.address
            .csr_tod_1g_ch1_read          (csr_1g_tod_read[0]),          //  output,   width = 1,                 .read
            .csr_tod_1g_ch1_write         (csr_1g_tod_write[0]),         //  output,   width = 1,                 .write
            .csr_tod_1g_ch1_writedata     (csr_1g_tod_writedata[0]),     //  output,  width = 32,                 .writedata
            .csr_tod_1g_ch1_readdata      (csr_1g_tod_readdata[0]),      //   input,  width = 32,                 .readdata
            .csr_tod_1g_ch1_waitrequest   (csr_1g_tod_waitrequest[0]),   //   input,   width = 1,                 .waitrequest
            .csr_tod_2p5g_ch1_address     (csr_2p5g_tod_address[0]),     //  output,   width = 4, csr_tod_2p5g_ch1.address
            .csr_tod_2p5g_ch1_read        (csr_2p5g_tod_read[0]),        //  output,   width = 1,                 .read
            .csr_tod_2p5g_ch1_write       (csr_2p5g_tod_write[0]),       //  output,   width = 1,                 .write
            .csr_tod_2p5g_ch1_writedata   (csr_2p5g_tod_writedata[0]),   //  output,  width = 32,                 .writedata
            .csr_tod_2p5g_ch1_readdata    (csr_2p5g_tod_readdata[0]),    //   input,  width = 32,                 .readdata
            .csr_tod_2p5g_ch1_waitrequest (csr_2p5g_tod_waitrequest[0]), //   input,   width = 1,                 .waitrequest
            .csr_address                  (csr_address),                  //   input,  width = 17,                 .address
            .csr_write                    (csr_write),                    //   input,   width = 1,                 .write
            .csr_read                     (csr_read),                     //   input,   width = 1,                 .read
            .csr_waitrequest              (csr_waitrequest),              //  output,   width = 1,              csr.waitrequest
            .csr_byteenable               (csr_byteenable),               //   input,   width = 4,                 .byteenable
            .csr_debugaccess              (csr_debugaccess),              //   input,   width = 1,                 .debugaccess
            .csr_burstcount               (csr_burstcount),               //   input,   width = 1,                 .burstcount
            .csr_writedata                (csr_writedata),                //   input,  width = 32,                 .writedata
            .csr_readdata                 (csr_readdata),                 //  output,  width = 32,                 .readdata
            .csr_readdatavalid            (csr_readdatavalid),            //  output,   width = 1,                 .readdatavalid
            .refclk_csr_clk               (csr_clk),               //   input,   width = 1,       refclk_csr.clk
            .reset_reset_n                (~reset_csr_clk)                 //   input,   width = 1,            reset.reset_n
        );
    end
    endgenerate
    
    genvar channel_id;
    generate for (channel_id = NUM_OF_CHANNEL; channel_id < MAX_NUM_OF_CHANNEL; channel_id = channel_id+1)
    begin: UNUSED_CSR
        assign csr_mac_readdata[channel_id] = 32'b0;
        assign csr_mac_waitrequest[channel_id] = 1'b0;
        assign csr_phy_readdata[channel_id] = 32'b0;
        assign csr_phy_waitrequest[channel_id] = 1'b0;
        assign csr_10g_tod_readdata[channel_id] = 32'b0;
        assign csr_10g_tod_waitrequest[channel_id] = 1'b0;
        assign csr_1g_tod_readdata[channel_id] = 32'b0;
        assign csr_1g_tod_waitrequest[channel_id] = 1'b0;
        assign csr_2p5g_tod_readdata[channel_id] = 32'b0;
        assign csr_2p5g_tod_waitrequest[channel_id] = 1'b0;
    end
    endgenerate
    
    // Reconfig Block
    alt_mge_rcfg #(
        .NUM_OF_CHANNEL             (NUM_OF_CHANNEL),
        .DEVICE_FAMILY              ("Stratix 10")
    ) u_rcfg ( 
        .clk                        (csr_clk),
        .rst_n                      (~reset_csr_clk),
        
        .csr_rcfg_address           (csr_rcfg_address),
        .csr_rcfg_read              (csr_rcfg_read),
        .csr_rcfg_readdata          (csr_rcfg_readdata),
        .csr_rcfg_write             (csr_rcfg_write),
        .csr_rcfg_writedata         (csr_rcfg_writedata),
        
        .mode_selected              (xcvr_mode),
        
        .tx_cal_busy                (tx_cal_busy),
        .rx_cal_busy                (rx_cal_busy),
        
        .reconfig_busy              (reconfig_busy),
        
        .reconfig_xcvr_address      (mge_rcfg_address),
        .reconfig_xcvr_read         (mge_rcfg_read),
        .reconfig_xcvr_write        (mge_rcfg_write),
        .reconfig_xcvr_writedata    (mge_rcfg_writedata),
        .reconfig_xcvr_readdata     (mge_rcfg_readdata[mge_rcfg_address[NUM_OF_CH_WIDTH+10:11]]),
        .reconfig_xcvr_waitrequest  (mge_rcfg_waitrequest[mge_rcfg_address[NUM_OF_CH_WIDTH+10:11]])
    );
    
    // Master Time of Day
    alt_mge_1588_tod_master u_master_tod (
        .period_clk                             (master_tod_clk),
        .period_rst_n                           (~master_tod_reset_sync),
        .clk                                    (csr_clk),
        .rst_n                                  (~reset_csr_clk),
        .csr_write                              (csr_master_tod_write),
        .csr_read                               (csr_master_tod_read),
        .csr_address                            (csr_master_tod_address),
        .csr_writedata                          (csr_master_tod_writedata),
        .csr_readdata                           (csr_master_tod_readdata),
        .csr_waitrequest                        (csr_master_tod_waitrequest),
        .time_of_day_96b                        (master_tod_96b),
        .time_of_day_64b                        (),
        .time_of_day_96b_load_valid             (1'b0),
        .time_of_day_96b_load_data              (96'd0),
        .time_of_day_64b_load_valid             (1'b0),
        .time_of_day_64b_load_data              (64'd0)
    );
    
    // Master Pulse Per Second
    altera_eth_1588_pps #(
        .PULSE_CYCLE        (PPS_PULSE_ASSERT_CYCLE_MASTER)
    ) u_master_pulse_per_second (
        .clk                                    (master_tod_clk),
        .reset                                  (master_tod_reset_sync),
    
        .time_of_day_96b                        (master_tod_96b),
        .pulse_per_second                       (master_pulse_per_second)
    );
    
    // --------------------------------------------------
    // Calculates the log2ceil of the input value
    // --------------------------------------------------
    function integer log2ceil;
        input integer val;
        integer i;
        
        begin
            i = 1;
            log2ceil = 0;
            
            if (val == 1) begin
                return 1;
            end
            
            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i << 1; 
            end
        end
    endfunction
    
endmodule
