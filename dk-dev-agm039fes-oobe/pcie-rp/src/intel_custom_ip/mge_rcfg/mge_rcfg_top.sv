// (C) 2018-2019 Intel Corporation. All rights reserved.
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

module mge_rcfg_top #(
    parameter NUM_OF_CHANNEL    = 1,      // choice: 1, 2
    parameter DEVICE_FAMILY = "Stratix 10",
    // Internal parameters, do not change
    parameter RCFG_XCVR_ADDR_WIDTH = 11,
    parameter NUM_OF_CH_WIDTH   = log2ceil(NUM_OF_CHANNEL)
    
) ( 
    input                                                  clk,
    input                                                  rst_n,
    input                                                  tx_cal_busy_chan1,
    input                                                  tx_cal_busy_chan2,
    input                                                  rx_cal_busy_chan1,
    input                                                  rx_cal_busy_chan2,
    output reg                                             tx_cal_busy_chan1_out,
    output reg                                             tx_cal_busy_chan2_out,
    output reg                                             rx_cal_busy_chan1_out,
    output reg                                             rx_cal_busy_chan2_out,
    output reg                                     [ 1:0]  xcvr_mode_chan1,
    output reg                                     [ 1:0]  xcvr_mode_chan2,
    output reg                                             pll_select_chan1,
    output reg                                             pll_select_chan2,
    output                                                 mge_chan1_resetn,
    output                                                 mge_chan2_resetn,
    output       [6:0]                                     status,
    output [NUM_OF_CH_WIDTH + RCFG_XCVR_ADDR_WIDTH - 1:0]  reconfig_xcvr_master_address,
    output                                                 reconfig_xcvr_master_read,
    output                                                 reconfig_xcvr_master_write,
    output                                         [31:0]  reconfig_xcvr_master_writedata,
    input                                          [31:0]  reconfig_xcvr_master_readdata,
    input                                                  reconfig_xcvr_master_waitrequest
);

// Internal Signals
    reg        [NUM_OF_CHANNEL-1:0] tx_cal_busy;
    reg        [NUM_OF_CHANNEL-1:0] rx_cal_busy;
    wire                     [ 1:0] csr_rcfg_address;
    wire                            csr_rcfg_read;
    wire                            csr_rcfg_write;
    wire                     [31:0] csr_rcfg_writedata;
    wire                     [31:0] csr_rcfg_readdata;
    wire       [NUM_OF_CHANNEL-1:0] reconfig_busy;
    wire  [NUM_OF_CHANNEL-1:0][1:0] xcvr_mode;

// Loop control variable
    integer i;

// Port Mapping
always @* begin
   xcvr_mode_chan1   <= xcvr_mode[0];
   if (NUM_OF_CHANNEL == 2)
      xcvr_mode_chan2<= xcvr_mode[1];
   else 
      xcvr_mode_chan2<= 2'b0;
      
   tx_cal_busy[0]    <= tx_cal_busy_chan1;
   if (NUM_OF_CHANNEL == 2)
      tx_cal_busy[1] <= tx_cal_busy_chan2;
   
   rx_cal_busy[0]    <=  rx_cal_busy_chan1;
   if (NUM_OF_CHANNEL == 2)
      rx_cal_busy[1] <= rx_cal_busy_chan2;
   
   tx_cal_busy_chan1_out   <= tx_cal_busy_chan1;
   tx_cal_busy_chan2_out   <= tx_cal_busy_chan2;
   rx_cal_busy_chan1_out   <= rx_cal_busy_chan1;
   rx_cal_busy_chan2_out   <= rx_cal_busy_chan2;
   
   // PLL select based on MIF configuration
   // Following table shows default configuration in Reference Design
   // ------------------------------
   // | MIF Mode |  Speed   | PLL  |
   // ------------------------------
   // |   2'b00  |     1G   | 1'b1 |
   // |   2'b01  |   2.5G   | 1'b0 |
   // |   2'b10  | Reserved | 1'b0 |
   // |   2'b11  | Reserved | 1'b0 |
   // ------------------------------
   if (xcvr_mode[0] == 2'b00)
      pll_select_chan1 <= 1'b1;
   else
      pll_select_chan1 <= 1'b0;

   if (NUM_OF_CHANNEL == 2) begin
      if (xcvr_mode[1] == 2'b00)
         pll_select_chan2 <= 1'b1;
      else
         pll_select_chan2 <= 1'b0;
   end
   else
      pll_select_chan2 <= 1'b0;      
end
    
    // rcfg FSM
    mge_rcfg_fsm #(
       .NUM_OF_CHANNEL              (NUM_OF_CHANNEL)
    ) mge_rcfg_fsm_i ( 
       .clk                         (clk),    //input
       .rst_n                       (rst_n),  //input

       .csr_rcfg_address            (csr_rcfg_address),    //output reg [ 1:0]  
       .csr_rcfg_read               (csr_rcfg_read),       //output reg
       .csr_rcfg_write              (csr_rcfg_write),      //output reg
       .csr_rcfg_writedata          (csr_rcfg_writedata),  //output reg [31:0]  
       .csr_rcfg_readdata           (csr_rcfg_readdata),   //input      [31:0]  

       .reconfig_busy               (reconfig_busy),       //input      [NUM_OF_CHANNEL-1:0]        
       .status                      (status),              //output reg  [6:0]                          
       .mge_chan1_resetn            (mge_chan1_resetn),    //output reg                              
       .mge_chan2_resetn            (mge_chan2_resetn)     //output reg                              
    );


    
    // Reconfig Block
    alt_mge_rcfg #(
        .NUM_OF_CHANNEL             (NUM_OF_CHANNEL),
        .DEVICE_FAMILY              (DEVICE_FAMILY),
        .RCFG_XCVR_ADDR_WIDTH       (RCFG_XCVR_ADDR_WIDTH)
    ) u_rcfg ( 
        .clk                        (clk),
        .rst_n                      (rst_n),
        
        .csr_rcfg_address           (csr_rcfg_address),
        .csr_rcfg_read              (csr_rcfg_read),
        .csr_rcfg_readdata          (csr_rcfg_readdata),
        .csr_rcfg_write             (csr_rcfg_write),
        .csr_rcfg_writedata         (csr_rcfg_writedata),
        
        .mode_selected              (xcvr_mode),
        
        .tx_cal_busy                (tx_cal_busy),
        .rx_cal_busy                (rx_cal_busy),
        
        .reconfig_busy              (reconfig_busy),
        
        .reconfig_xcvr_address      (reconfig_xcvr_master_address),
        .reconfig_xcvr_read         (reconfig_xcvr_master_read),
        .reconfig_xcvr_write        (reconfig_xcvr_master_write),
        .reconfig_xcvr_writedata    (reconfig_xcvr_master_writedata),
        .reconfig_xcvr_readdata     (reconfig_xcvr_master_readdata),
        .reconfig_xcvr_waitrequest  (reconfig_xcvr_master_waitrequest)
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