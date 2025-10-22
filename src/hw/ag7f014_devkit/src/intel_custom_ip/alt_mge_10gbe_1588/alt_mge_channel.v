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

module alt_mge_channel (
    
    input               latency_sclk,
    
    // CSR Clock
    input               csr_clk,
    input               reset_csr_clk,
    
    // MAC Clock
    input               mac_clk,
    
    // XGMII Clock
    input               mac64b_clk,
    
    // Latency Measurement Clock
    input               latency_measure_clk,
    
    // Sampling Clock
    input               tod_sync_10g_sampling_clk,
    input               tod_sync_2p5g_sampling_clk,
    input               tod_sync_1g_sampling_clk,
    
    // Reset
    input               reset,
    input               tx_digitalreset,
    input               rx_digitalreset,
    input               tx_analogreset,
    input               rx_analogreset,
    
    output              tx_digitalreset_stat,
    output              rx_digitalreset_stat,
    output              tx_analogreset_stat,
    output              rx_analogreset_stat,
    
    // MAC CSR
    input        [9:0]  csr_mac_address,
    input               csr_mac_read,
    input               csr_mac_write,
    input       [31:0]  csr_mac_writedata,
    output      [31:0]  csr_mac_readdata,
    output              csr_mac_waitrequest,
    
    // MAC TX User Frame
    input               avalon_st_tx_valid,
    output              avalon_st_tx_ready,
    input               avalon_st_tx_startofpacket,
    input               avalon_st_tx_endofpacket,
    input       [63:0]  avalon_st_tx_data,
    input        [2:0]  avalon_st_tx_empty,
    input               avalon_st_tx_error,
    
    // MAC RX User Frame
    output              avalon_st_rx_valid,
    input               avalon_st_rx_ready,
    output              avalon_st_rx_startofpacket,
    output              avalon_st_rx_endofpacket,
    output      [63:0]  avalon_st_rx_data,
    output       [2:0]  avalon_st_rx_empty,
    output       [5:0]  avalon_st_rx_error,
    
    // MAC TX Frame Status
    output              avalon_st_txstatus_valid,
    output      [39:0]  avalon_st_txstatus_data,
    output       [6:0]  avalon_st_txstatus_error,
    
    // MAC RX Frame Status
    output              avalon_st_rxstatus_valid,
    output      [39:0]  avalon_st_rxstatus_data,
    output       [6:0]  avalon_st_rxstatus_error,
    
    // MAC TX Pause Frame Generation Command
    input        [1:0]  avalon_st_pause_data,
    
    // MAC Status
    output       [1:0]  xgmii_rx_link_fault_status,
    
    // PHY CSR
    input       [10:0]  csr_phy_address,
    input               csr_phy_read,
    input               csr_phy_write,
    input       [31:0]  csr_phy_writedata,
    output      [31:0]  csr_phy_readdata,
    output              csr_phy_waitrequest,
    
    // PHY Operating Mode from Reconfig Block
    input        [1:0]  xcvr_mode,
    
    // PHY Operating Speed to MAC
    output       [2:0]  operating_speed,
    
    // PHY Status
    output              led_link,
    output              led_char_err,
    output              led_disp_err,
    output              led_an,
    output              rx_block_lock,
    
    // Transceiver Serial Interface
    input        [2:0]  tx_serial_clk,
    input               rx_cdr_refclk,
    input               rx_cdr_refclk_1,
    output              rx_pma_clkout,
    output              tx_serial_data,
    input               rx_serial_data,
    
    // Transceiver Status
    output              rx_is_lockedtodata,
    output              tx_cal_busy,
    output              rx_cal_busy,
    
    // Transceiver Reconfiguration
    input               reconfig_clk,
    input               reconfig_reset,
    input       [10:0]  reconfig_address,
    input               reconfig_read,
    input               reconfig_write,
    input       [31:0]  reconfig_writedata,
    output      [31:0]  reconfig_readdata,
    output              reconfig_waitrequest,
    
    // TOD CSR
    input       [3:0]   alt_mge_1588_tod_10g_csr_address,
    input               alt_mge_1588_tod_10g_csr_write,
    input               alt_mge_1588_tod_10g_csr_read,
    input       [31:0]  alt_mge_1588_tod_10g_csr_writedata,
    output      [31:0]  alt_mge_1588_tod_10g_csr_readdata,
    output              alt_mge_1588_tod_10g_csr_waitrequest,
    
    input       [3:0]   alt_mge_1588_tod_2p5g_csr_address,
    input               alt_mge_1588_tod_2p5g_csr_write,
    input               alt_mge_1588_tod_2p5g_csr_read,
    input       [31:0]  alt_mge_1588_tod_2p5g_csr_writedata,
    output      [31:0]  alt_mge_1588_tod_2p5g_csr_readdata,
    output              alt_mge_1588_tod_2p5g_csr_waitrequest,
    
    input       [3:0]   alt_mge_1588_tod_1g_csr_address,
    input               alt_mge_1588_tod_1g_csr_write,
    input               alt_mge_1588_tod_1g_csr_read,
    input       [31:0]  alt_mge_1588_tod_1g_csr_writedata,
    output      [31:0]  alt_mge_1588_tod_1g_csr_readdata,
    output              alt_mge_1588_tod_1g_csr_waitrequest,
    
    //1588      
    input               tx_egress_timestamp_request_in_valid,
    input        [7:0]  tx_egress_timestamp_request_in_fingerprint,
    output              tx_egress_timestamp_96b_valid,
    output      [95:0]  tx_egress_timestamp_96b_data,
    output       [7:0]  tx_egress_timestamp_96b_fingerprint,
    
    output              rx_ingress_timestamp_96b_valid,
    output      [95:0]  rx_ingress_timestamp_96b_data,
    
    input               master_tod_clk,
    input               master_tod_reset,
    input       [95:0]  master_tod_96b_data,
    input               start_tod_sync,
    
    output              pulse_per_second
    
);
    localparam PPS_PULSE_ASSERT_CYCLE_10G   = 3125000;      //Pulse Per Second for 10g - Assert for 10ms (10ms / 3.2ns = 3125000)
    localparam PPS_PULSE_ASSERT_CYCLE_2p5G  = 1562500;      //Pulse Per Second for 2p5g - Assert for 10ms (10ms / 6.4ns = 1562500)
    localparam PPS_PULSE_ASSERT_CYCLE_1G    = 625000;       //Pulse Per Second for 1G - Assert for 10ms (10ms / 16.0ns = 625000)
    
    localparam SPEED_10G    = 3'd0;
    localparam SPEED_2P5G   = 3'd4;
    localparam SPEED_1G     = 3'd1;
    
    // GMII Clock from PHY to MAC
    wire        gmii16b_tx_clk;
    wire        gmii16b_rx_clk;
    
    // GMII TX from MAC to PHY
    wire  [1:0] gmii16b_tx_en;
    wire [15:0] gmii16b_tx_d;
    wire  [1:0] gmii16b_tx_err;
    
    // GMII RX from PHY to MAC
    wire  [1:0] gmii16b_rx_dv;
    wire [15:0] gmii16b_rx_d;
    wire  [1:0] gmii16b_rx_err;
    
    // XGMII TX from MAC to PHY
    wire [71:0] xgmii_tx;
    wire [ 7:0] xgmii_tx_control;
    wire [63:0] xgmii_tx_data;
    
    // XGMII RX from PHY to MAC
    wire [71:0] xgmii_rx;
    wire [ 7:0] xgmii_rx_control;
    wire [63:0] xgmii_rx_data;
    
    // Reset
    wire        reset_gmii16b_tx_clk;
//    wire        reset_csr_clk;
    wire        reset_mac_clk;
    

      
    // 1588
       
    // TOD
    wire [95:0] time_of_day_96b_1g2p5g;
    wire [63:0] time_of_day_64b_1g2p5g;
    
    wire [21:0] tx_gmii16b_latency;
    wire [21:0] rx_gmii16b_latency;
    wire [15:0] tx_xgmii_latency;
    wire [15:0] rx_xgmii_latency;
    
    wire [95:0] time_of_day_96b_10g;
    wire [95:0] time_of_day_96b_2p5g;
    wire [95:0] time_of_day_96b_1g;
    
    wire        tod_96b_slave_load_valid_10g;
    wire [95:0] tod_96b_slave_load_data_10g;
    wire        tod_64b_slave_load_valid_10g;
    wire [63:0] tod_64b_slave_load_data_10g;
    
    wire        tod_96b_slave_load_valid_2p5g;
    wire [95:0] tod_96b_slave_load_data_2p5g;
    wire        tod_64b_slave_load_valid_2p5g;
    wire [63:0] tod_64b_slave_load_data_2p5g;
    
    wire        tod_96b_slave_load_valid_1g;
    wire [95:0] tod_96b_slave_load_data_1g;
    wire        tod_64b_slave_load_valid_1g;
    wire [63:0] tod_64b_slave_load_data_1g;
    
    // PPS
    wire        pulse_per_second_10g;
    wire        pulse_per_second_2p5g;
    wire        pulse_per_second_1g;
    
    // Mux wire from different speed
    assign  pulse_per_second = (operating_speed == SPEED_10G) ? pulse_per_second_10g:
                               (operating_speed == SPEED_2P5G)? pulse_per_second_2p5g:
                                                                pulse_per_second_1g;
    //Sharing the same ToD for TX and RX
    assign  time_of_day_96b_1g2p5g = (operating_speed == SPEED_2P5G)? time_of_day_96b_2p5g:
                                                                      time_of_day_96b_1g;
    
    assign {xgmii_tx_control[7], xgmii_tx_data[63:56],
            xgmii_tx_control[6], xgmii_tx_data[55:48],
            xgmii_tx_control[5], xgmii_tx_data[47:40],
            xgmii_tx_control[4], xgmii_tx_data[39:32],
            xgmii_tx_control[3], xgmii_tx_data[31:24],
            xgmii_tx_control[2], xgmii_tx_data[23:16],
            xgmii_tx_control[1], xgmii_tx_data[15:8],
            xgmii_tx_control[0], xgmii_tx_data[7:0]} = xgmii_tx;
    
    assign xgmii_rx = {xgmii_rx_control[7], xgmii_rx_data[63:56],
                       xgmii_rx_control[6], xgmii_rx_data[55:48],
                       xgmii_rx_control[5], xgmii_rx_data[47:40],
                       xgmii_rx_control[4], xgmii_rx_data[39:32],
                       xgmii_rx_control[3], xgmii_rx_data[31:24],
                       xgmii_rx_control[2], xgmii_rx_data[23:16],
                       xgmii_rx_control[1], xgmii_rx_data[15:8],
                       xgmii_rx_control[0], xgmii_rx_data[7:0]};
    
    alt_mgbaset_mac mac (
        // CSR Clock
        .csr_clk                        (csr_clk),
        
        // MAC Clock
        .tx_312_5_clk                   (mac_clk),
        .rx_312_5_clk                   (mac_clk),
        
        .tx_156_25_clk                  (mac64b_clk),
        .rx_156_25_clk                  (mac64b_clk),
        
        // Reset
        .csr_rst_n                      (~reset_csr_clk),
        .tx_rst_n                       (~tx_digitalreset),
        .rx_rst_n                       (~rx_digitalreset),
        
        // MAC CSR
        .csr_address                    (csr_mac_address),
        .csr_read                       (csr_mac_read),
        .csr_write                      (csr_mac_write),
        .csr_writedata                  (csr_mac_writedata),
        .csr_readdata                   (csr_mac_readdata),
        .csr_waitrequest                (csr_mac_waitrequest),
        
        // MAC TX User Frame
        .avalon_st_tx_valid             (avalon_st_tx_valid),
        .avalon_st_tx_ready             (avalon_st_tx_ready),
        .avalon_st_tx_startofpacket     (avalon_st_tx_startofpacket),
        .avalon_st_tx_endofpacket       (avalon_st_tx_endofpacket),
        .avalon_st_tx_data              (avalon_st_tx_data),
        .avalon_st_tx_empty             (avalon_st_tx_empty),
        .avalon_st_tx_error             (avalon_st_tx_error),

        // MAC RX User Frame
        .avalon_st_rx_valid             (avalon_st_rx_valid),
        .avalon_st_rx_ready             (avalon_st_rx_ready),
        .avalon_st_rx_startofpacket     (avalon_st_rx_startofpacket),
        .avalon_st_rx_endofpacket       (avalon_st_rx_endofpacket),
        .avalon_st_rx_data              (avalon_st_rx_data),
        .avalon_st_rx_empty             (avalon_st_rx_empty),
        .avalon_st_rx_error             (avalon_st_rx_error),
        
        // MAC TX Frame Status
        .avalon_st_txstatus_valid       (avalon_st_txstatus_valid),
        .avalon_st_txstatus_data        (avalon_st_txstatus_data),
        .avalon_st_txstatus_error       (avalon_st_txstatus_error),
        
        // MAC RX Frame Status
        .avalon_st_rxstatus_valid       (avalon_st_rxstatus_valid),
        .avalon_st_rxstatus_data        (avalon_st_rxstatus_data),
        .avalon_st_rxstatus_error       (avalon_st_rxstatus_error),
        
        // MAC TX Pause Frame Generation Command
        .avalon_st_pause_data           (avalon_st_pause_data),
        
        // GMII Clock from PHY to MAC
        .gmii16b_tx_clk                 (gmii16b_tx_clk),
        .gmii16b_rx_clk                 (gmii16b_rx_clk),
        
        // GMII TX from MAC to PHY
        .gmii16b_tx_en                  (gmii16b_tx_en),
        .gmii16b_tx_d                   (gmii16b_tx_d),
        .gmii16b_tx_err                 (gmii16b_tx_err),
        
        // GMII RX from PHY to MAC
        .gmii16b_rx_dv                  (gmii16b_rx_dv),
        .gmii16b_rx_d                   (gmii16b_rx_d),
        .gmii16b_rx_err                 (gmii16b_rx_err),
        
        // XGMII TX from MAC to PHY
        .xgmii_tx                       (xgmii_tx),
        
        // XGMII RX from PHY to MAC
        .xgmii_rx                       (xgmii_rx),
        
        // XGMII Link Fault Status
        .link_fault_status_xgmii_rx_data(xgmii_rx_link_fault_status),
        
        // PHY Operating Speed to MAC
        .speed_sel                      (operating_speed),
        
        // 1588
        .tx_egress_timestamp_request_valid                          (tx_egress_timestamp_request_in_valid),
        .tx_egress_timestamp_request_fingerprint                    (tx_egress_timestamp_request_in_fingerprint),
        .tx_egress_timestamp_96b_valid                              (tx_egress_timestamp_96b_valid),
        .tx_egress_timestamp_96b_data                               (tx_egress_timestamp_96b_data),
        .tx_egress_timestamp_96b_fingerprint                        (tx_egress_timestamp_96b_fingerprint),
        
        .rx_ingress_timestamp_96b_valid                             (rx_ingress_timestamp_96b_valid),
        .rx_ingress_timestamp_96b_data                              (rx_ingress_timestamp_96b_data),

        .tx_time_of_day_96b_10g_data                                (time_of_day_96b_10g),
        .rx_time_of_day_96b_10g_data                                (time_of_day_96b_10g),
        
        .tx_time_of_day_96b_1g_data                                 (time_of_day_96b_1g2p5g),
        .rx_time_of_day_96b_1g_data                                 (time_of_day_96b_1g2p5g),
        
        .tx_path_delay_10g_data                                     (tx_xgmii_latency),
        .rx_path_delay_10g_data                                     (rx_xgmii_latency),
        .tx_path_delay_1g_data                                      (tx_gmii16b_latency),
        .rx_path_delay_1g_data                                      (rx_gmii16b_latency)
    );
    
    alt_mgbaset_phy phy (
        .latency_measure_clk            (latency_measure_clk),
        .latency_sclk                   (latency_sclk),
        
        // CSR Clock
        .csr_clk                        (csr_clk),
        
        // PHY Clock Out
        .tx_clkout                      (gmii16b_tx_clk),
        .rx_clkout                      (gmii16b_rx_clk),
        
        // Reset
        .reset                          (reset),
        .tx_digitalreset                (tx_digitalreset),
        .rx_digitalreset                (rx_digitalreset),
        .tx_analogreset                 (tx_analogreset),
        .rx_analogreset                 (rx_analogreset),
        .tx_digitalreset_stat           (tx_digitalreset_stat),
        .rx_digitalreset_stat           (rx_digitalreset_stat),
        .tx_analogreset_stat            (tx_analogreset_stat),
        .rx_analogreset_stat            (rx_analogreset_stat),
        
        // PHY CSR
        .csr_address                    (csr_phy_address),
        .csr_read                       (csr_phy_read),
        .csr_write                      (csr_phy_write),
        .csr_writedata                  (csr_phy_writedata),
        .csr_readdata                   (csr_phy_readdata),
        .csr_waitrequest                (csr_phy_waitrequest),
        
        // GMII TX from MAC to PHY
        .gmii16b_tx_en                  (gmii16b_tx_en),
        .gmii16b_tx_d                   (gmii16b_tx_d),
        .gmii16b_tx_err                 (gmii16b_tx_err),
        
        // GMII RX from PHY to MAC
        .gmii16b_rx_dv                  (gmii16b_rx_dv),
        .gmii16b_rx_d                   (gmii16b_rx_d),
        .gmii16b_rx_err                 (gmii16b_rx_err),
        
        // XGMII Clock from PLL to PHY
        .xgmii_tx_coreclkin             (mac64b_clk),
        .xgmii_rx_coreclkin             (mac64b_clk),
        
        // XGMII TX from MAC to PHY
        .xgmii_tx_control               (xgmii_tx_control),
        .xgmii_tx_data                  (xgmii_tx_data),
        
        // XGMII RX from PHY to MAC
        .xgmii_rx_control               (xgmii_rx_control),
        .xgmii_rx_data                  (xgmii_rx_data),
        
        // PHY Operating Mode from Reconfig Block
        .xcvr_mode                      (xcvr_mode),
        
        // PHY Operating Speed to MAC
        .operating_speed                (operating_speed),
        
        // PHY Status
        .led_link                       (led_link),
        .led_char_err                   (led_char_err),
        .led_disp_err                   (led_disp_err),
        .led_an                         (led_an),
        .rx_block_lock                  (rx_block_lock),
        
        // Transceiver Serial Interface
        .tx_serial_clk                  (tx_serial_clk),
        .rx_cdr_refclk                  (rx_cdr_refclk),
        .rx_cdr_refclk_1                (rx_cdr_refclk_1),
        .rx_pma_clkout                  (rx_pma_clkout),
        .tx_serial_data                 (tx_serial_data),
        .rx_serial_data                 (rx_serial_data),
        
        // Transceiver Status
        .rx_is_lockedtodata             (rx_is_lockedtodata),
        .tx_cal_busy                    (tx_cal_busy),
        .rx_cal_busy                    (rx_cal_busy),
        
        // Transceiver Reconfiguration
        .reconfig_clk                   (reconfig_clk),
        .reconfig_reset                 (reconfig_reset),
        .reconfig_address               (reconfig_address),
        .reconfig_read                  (reconfig_read),
        .reconfig_write                 (reconfig_write),
        .reconfig_writedata             (reconfig_writedata),
        .reconfig_readdata              (reconfig_readdata),
        .reconfig_waitrequest           (reconfig_waitrequest),
        
        // 1588 Latency
        .gmii16b_tx_latency             (tx_gmii16b_latency),
        .gmii16b_rx_latency             (rx_gmii16b_latency),
        .xgmii_tx_latency               (tx_xgmii_latency),
        .xgmii_rx_latency               (rx_xgmii_latency)
    );
    
    alt_mge_1588_tod_10g tod_10g (
        .period_clk                         (mac_clk),
        .period_rst_n                       (~reset_mac_clk),
        .clk                                (csr_clk),
        .rst_n                              (~reset_csr_clk),
        .csr_write                          (alt_mge_1588_tod_10g_csr_write),
        .csr_read                           (alt_mge_1588_tod_10g_csr_read),
        .csr_address                        (alt_mge_1588_tod_10g_csr_address), //byte to dword address 
        .csr_writedata                      (alt_mge_1588_tod_10g_csr_writedata),
        .csr_readdata                       (alt_mge_1588_tod_10g_csr_readdata),
        .csr_waitrequest                    (alt_mge_1588_tod_10g_csr_waitrequest),
        .time_of_day_96b                    (time_of_day_96b_10g),
        .time_of_day_64b                    (),
        .time_of_day_96b_load_valid         (tod_96b_slave_load_valid_10g),
        .time_of_day_96b_load_data          (tod_96b_slave_load_data_10g),
        .time_of_day_64b_load_valid         (1'b0),
        .time_of_day_64b_load_data          (64'd0)
    );
    
    alt_mge_1588_tod_2p5g tod_2p5g (
        .period_clk                         (gmii16b_tx_clk),
        .period_rst_n                       (~reset_gmii16b_tx_clk),
        .clk                                (csr_clk),
        .rst_n                              (~reset_csr_clk),
        .csr_write                          (alt_mge_1588_tod_2p5g_csr_write),
        .csr_read                           (alt_mge_1588_tod_2p5g_csr_read),
        .csr_address                        (alt_mge_1588_tod_2p5g_csr_address), //byte to dword address 
        .csr_writedata                      (alt_mge_1588_tod_2p5g_csr_writedata),
        .csr_readdata                       (alt_mge_1588_tod_2p5g_csr_readdata),
        .csr_waitrequest                    (alt_mge_1588_tod_2p5g_csr_waitrequest),
        .time_of_day_96b                    (time_of_day_96b_2p5g),
        .time_of_day_64b                    (),
        .time_of_day_96b_load_valid         (tod_96b_slave_load_valid_2p5g),
        .time_of_day_96b_load_data          (tod_96b_slave_load_data_2p5g),
        .time_of_day_64b_load_valid         (1'b0),
        .time_of_day_64b_load_data          (64'd0)
    );
    
    alt_mge_1588_tod_1g tod_1g (
        .period_clk                         (gmii16b_tx_clk),
        .period_rst_n                       (~reset_gmii16b_tx_clk),
        .clk                                (csr_clk),
        .rst_n                              (~reset_csr_clk),
        .csr_write                          (alt_mge_1588_tod_1g_csr_write),
        .csr_read                           (alt_mge_1588_tod_1g_csr_read),
        .csr_address                        (alt_mge_1588_tod_1g_csr_address), //byte to dword address 
        .csr_writedata                      (alt_mge_1588_tod_1g_csr_writedata),
        .csr_readdata                       (alt_mge_1588_tod_1g_csr_readdata),
        .csr_waitrequest                    (alt_mge_1588_tod_1g_csr_waitrequest),
        .time_of_day_96b                    (time_of_day_96b_1g),
        .time_of_day_64b                    (),
        .time_of_day_96b_load_valid         (tod_96b_slave_load_valid_1g),
        .time_of_day_96b_load_data          (tod_96b_slave_load_data_1g),
        .time_of_day_64b_load_valid         (1'b0),
        .time_of_day_64b_load_data          (64'd0)
    );
    
    alt_mge_1588_tod_sync_96b_10g tod_sync_96b_10g (
        //master tod interface
        .clk_master                         (master_tod_clk),
        .reset_master                       (master_tod_reset),
        .start_tod_sync                     (start_tod_sync),
        .tod_master_data                    (master_tod_96b_data),
        
        //slave tod interface
        .clk_slave                          (mac_clk),
        .clk_sampling                       (tod_sync_10g_sampling_clk),
        .reset_slave                        (reset_mac_clk),
        .tod_slave_valid                    (tod_96b_slave_load_valid_10g),
        .tod_slave_data                     (tod_96b_slave_load_data_10g)
    );
      
    alt_mge_1588_tod_sync_96b_2p5g tod_sync_96b_2p5g (
        //master tod interface
        .clk_master                         (master_tod_clk),
        .reset_master                       (master_tod_reset),
        .start_tod_sync                     (start_tod_sync),
        .tod_master_data                    (master_tod_96b_data),
        
        //slave tod interface
        .clk_slave                          (gmii16b_tx_clk),
        .clk_sampling                       (tod_sync_2p5g_sampling_clk),
        .reset_slave                        (reset_gmii16b_tx_clk),
        .tod_slave_valid                    (tod_96b_slave_load_valid_2p5g),
        .tod_slave_data                     (tod_96b_slave_load_data_2p5g)
    );
     
    alt_mge_1588_tod_sync_96b_1g tod_sync_96b_1g (
        //master tod interface
        .clk_master                         (master_tod_clk),
        .reset_master                       (master_tod_reset),
        .start_tod_sync                     (start_tod_sync),
        .tod_master_data                    (master_tod_96b_data),
        
        //slave tod interface
        .clk_slave                          (gmii16b_tx_clk),
        .clk_sampling                       (tod_sync_1g_sampling_clk),
        .reset_slave                        (reset_gmii16b_tx_clk),
        .tod_slave_valid                    (tod_96b_slave_load_valid_1g),
        .tod_slave_data                     (tod_96b_slave_load_data_1g)
    );
    
    altera_eth_1588_pps #(
        .PULSE_CYCLE        (PPS_PULSE_ASSERT_CYCLE_10G)    // assert for 1ms for every 10ms
    ) pulse_per_second_10_u0 (
        .clk                                (mac_clk),
        .reset                              (reset_mac_clk),
    
        .time_of_day_96b                    (time_of_day_96b_10g),
        .pulse_per_second                   (pulse_per_second_10g)
    );
    
    altera_eth_1588_pps #(
        .PULSE_CYCLE        (PPS_PULSE_ASSERT_CYCLE_2p5G)   // assert for 1ms for every 10ms
    ) pulse_per_second_2p5g_u0 (
        .clk                                (gmii16b_tx_clk),
        .reset                              (reset_gmii16b_tx_clk),
    
        .time_of_day_96b                    (time_of_day_96b_2p5g),
        .pulse_per_second                   (pulse_per_second_2p5g)
    );
    
    altera_eth_1588_pps #(
        .PULSE_CYCLE        (PPS_PULSE_ASSERT_CYCLE_1G)     // assert for 1ms for every 10ms    
    ) pulse_per_second_1g_u1 (
        .clk                                (gmii16b_tx_clk),
        .reset                              (reset_gmii16b_tx_clk),
    
        .time_of_day_96b                    (time_of_day_96b_1g),
        .pulse_per_second                   (pulse_per_second_1g)
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
    
    // Reset Synchronization
    alt_mge_reset_synchronizer #(
        .ASYNC_RESET    (1),
        .DEPTH          (3)
    ) u_rst_sync_gmii16b_tx_clk (
        .clk            (gmii16b_tx_clk),
        .reset_in       (tx_digitalreset),
        .reset_out      (reset_gmii16b_tx_clk)
    );
    
    // Reset Synchronization
    alt_mge_reset_synchronizer #(
        .ASYNC_RESET    (1),
        .DEPTH          (3)
    ) u_rst_sync_mac_clk (
        .clk            (mac_clk),
        .reset_in       (tx_digitalreset),
        .reset_out      (reset_mac_clk)
    );
    
endmodule
