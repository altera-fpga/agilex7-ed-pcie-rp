//****************************************************************************
//
// SPDX-License-Identifier: MIT-0
// Copyright(c) 2019-2021 Intel Corporation.
//
//****************************************************************************
// This is a generated system top level RTL file. 



module ghrd_agilex_top (
//Additional refclk_bti to preserve Etile XCVR
// Clock and Reset
input    wire [1-1:0]  fpga_clk_100,


output   wire [4-1:0]  fpga_led_pio,

//HPS
// HPS EMIF
output   wire     					emif_hps_mem_mem_ck_c,
output   wire     					emif_hps_mem_mem_ck_t,
output   wire [12:0]   				emif_hps_mem_mem_ca,
output   wire     					emif_hps_mem_mem_cs_n,
output   wire     					emif_hps_mem_mem_reset_n,
output   wire [3:0]    				emif_hps_mem_mem_dm_n,
input    wire     					emif_hps_mem_mem_alert_n,
input    wire          				emif_hps_oct_oct_rzqin,
input    wire          				emif_hps_noc_refclk_clk,
output	 wire		   				emif_hps_noc_pll_lock_o_pll_lock_o,
input    wire          				emif_hps_ref_clk_clk,
inout    wire [32-1:0]   	emif_hps_mem_mem_dq,
inout	 wire [3:0]	   				emif_hps_mem_mem_dqs_c,
inout	 wire [3:0]	   				emif_hps_mem_mem_dqs_t,
input    wire        hps_jtag_tck,
input    wire        hps_jtag_tms,
output   wire        hps_jtag_tdo,
input    wire        hps_jtag_tdi,
output   wire        hps_sdmmc_CCLK, 
inout    wire        hps_sdmmc_CMD,          
inout    wire        hps_sdmmc_D0,          
inout    wire        hps_sdmmc_D1,          
inout    wire        hps_sdmmc_D2,        
inout    wire        hps_sdmmc_D3,        
inout    wire        hps_usb0_DATA0,         
inout    wire        hps_usb0_DATA1,      
inout    wire        hps_usb0_DATA2,        
inout    wire        hps_usb0_DATA3,       
inout    wire        hps_usb0_DATA4,        
inout    wire        hps_usb0_DATA5,      
inout    wire        hps_usb0_DATA6,      
inout    wire        hps_usb0_DATA7,         
input    wire        hps_usb0_CLK,         
output   wire        hps_usb0_STP,       
input    wire        hps_usb0_DIR,        
input    wire        hps_usb0_NXT, 
output   wire        hps_emac0_TX_CLK,       //TODO: may need to change RMII TX CLK to be input instead, check
input    wire        hps_emac0_RX_CLK,      
output   wire        hps_emac0_TX_CTL,
input    wire        hps_emac0_RX_CTL,      
output   wire        hps_emac0_TXD0,       
output   wire        hps_emac0_TXD1,
input    wire        hps_emac0_RXD0,     
input    wire        hps_emac0_RXD1,                
output   wire        hps_emac0_TXD2,        
output   wire        hps_emac0_TXD3,
input    wire        hps_emac0_RXD2,        
input    wire        hps_emac0_RXD3, 
inout    wire        hps_emac0_MDIO,         
output   wire        hps_emac0_MDC,
input    wire        hps_uart0_RX,       
output   wire        hps_uart0_TX, 
inout    wire        hps_i2c1_SDA,        
inout    wire        hps_i2c1_SCL, 
inout    wire        hps_gpio1_io0,
inout    wire        hps_gpio1_io1,
inout    wire        hps_gpio1_io4,
inout    wire        hps_gpio1_io5,
inout    wire        hps_gpio1_io19,
inout    wire        hps_gpio1_io20,
inout    wire        hps_gpio1_io21,
input    wire        hps_ref_clk,

input    wire [1-1:0]   fpga_reset_n,

input  wire        pcie_bas_conduit_vfenable,         
input  wire [2:0]  pcie_bas_conduit_pfnum,            
input  wire [10:0] pcie_bas_conduit_vfnum,            
           
input  wire        pcie_refclk0_clk,                     
input  wire        pcie_refclk1_clk,                     
input  wire        pcie_serial_rx_n_in0,             
input  wire        pcie_serial_rx_n_in1,             
input  wire        pcie_serial_rx_n_in2,             
input  wire        pcie_serial_rx_n_in3,    
//input  wire        pcie_serial_rx_n_in4,             
//input  wire        pcie_serial_rx_n_in5,             
//input  wire        pcie_serial_rx_n_in6,             
//input  wire        pcie_serial_rx_n_in7,                            
input  wire        pcie_serial_rx_p_in0,             
input  wire        pcie_serial_rx_p_in1,             
input  wire        pcie_serial_rx_p_in2,             
input  wire        pcie_serial_rx_p_in3,  
//input  wire        pcie_serial_rx_p_in4,             
//input  wire        pcie_serial_rx_p_in5,             
//input  wire        pcie_serial_rx_p_in6,             
//input  wire        pcie_serial_rx_p_in7,                              
output wire        pcie_serial_tx_n_out0,            
output wire        pcie_serial_tx_n_out1,            
output wire        pcie_serial_tx_n_out2,            
output wire        pcie_serial_tx_n_out3,
//output wire        pcie_serial_tx_n_out4,            
//output wire        pcie_serial_tx_n_out5,            
//output wire        pcie_serial_tx_n_out6,            
//output wire        pcie_serial_tx_n_out7,                              
output wire        pcie_serial_tx_p_out0,            
output wire        pcie_serial_tx_p_out1,            
output wire        pcie_serial_tx_p_out2,            
output wire        pcie_serial_tx_p_out3,  
//output wire        pcie_serial_tx_p_out4,            
//output wire        pcie_serial_tx_p_out5,            
//output wire        pcie_serial_tx_p_out6,            
//output wire        pcie_serial_tx_p_out7,                       
input  wire        pcie_pin_perst_reset_n      
);

wire         system_clk_100;
wire         system_clk_100_internal;
wire         ninit_done;
wire         fpga_reset_n_debounced_wire;
reg          fpga_reset_n_debounced;
wire         src_reset_n;
wire         system_reset_n;
wire         system_reset_sync;
wire         h2f_reset;

wire         clk_bdg_100_clk;
wire         clk_bdg_250_clk;
wire         iopll_locked_export;

assign system_reset_n = fpga_reset_n_debounced & src_reset_n & ~h2f_reset & ~ninit_done;

altera_reset_synchronizer #(
    .ASYNC_RESET (1),
    .DEPTH       (2)
) sys_rst_inst (
    .reset_in  (~system_reset_n),
    .clk       (system_clk_100),
    .reset_out (system_reset_sync)
);

altera_reset_synchronizer #(
    .ASYNC_RESET (1),
    .DEPTH       (2)
) sys_rst_sgpio_inst (
    .reset_in  (~system_reset_sync),
    .clk       (fpga_sgpio_clk),
    .reset_out (system_reset_sync_sgpio)
);

assign system_clk_100   = fpga_clk_100;

assign system_clk_100_internal  = system_clk_100;

wire [4-2:0]     fpga_led_internal;
wire           heartbeat_led;
reg  [22:0]    heartbeat_count;
assign heartbeat_led = ~heartbeat_count[22];

assign fpga_led_pio = {heartbeat_led,fpga_led_internal};




//Temporary disable src_reset_n
assign src_reset_n = 1'b1;

// Qsys Top module
qsys_top soc_inst (
//.src_prb_rst_sources_source             (src_reset_n),
.clk_100_clk                            (system_clk_100_internal),
.ninit_done_ninit_done                  (ninit_done),
.led_pio_external_connection_in_port    (fpga_led_internal),
.led_pio_external_connection_out_port   (fpga_led_internal),
.emif_hps_noc_pll_lock_o_pll_lock_o     (emif_hps_noc_pll_lock_o_pll_lock_o),
.emif_hps_noc_refclk_clk                (emif_hps_noc_refclk_clk),
.emif_hps_emif_mem_ck_0_mem_ck_c        (emif_hps_mem_mem_ck_c),   
.emif_hps_emif_mem_ck_0_mem_ck_t        (emif_hps_mem_mem_ck_t),  
.emif_hps_emif_mem_0_mem_ca             (emif_hps_mem_mem_ca),       
.emif_hps_emif_mem_0_mem_cs_n           (emif_hps_mem_mem_cs_n),    
.emif_hps_emif_mem_reset_n_mem_reset_n               (emif_hps_mem_mem_reset_n),
.emif_hps_emif_mem_0_mem_dm_n                  (emif_hps_mem_mem_dm_n), 
.emif_hps_emif_mem_0_mem_alert_n               (emif_hps_mem_mem_alert_n),    
.emif_hps_emif_oct_0_oct_rzqin                 (emif_hps_oct_oct_rzqin),
.emif_hps_emif_ref_clk_0_clk                   (emif_hps_ref_clk_clk),
.emif_hps_emif_mem_0_mem_dq                    (emif_hps_mem_mem_dq),       
.emif_hps_emif_mem_0_mem_dqs_c                 (emif_hps_mem_mem_dqs_c), 
.emif_hps_emif_mem_0_mem_dqs_t                 (emif_hps_mem_mem_dqs_t), 
.hps_io_jtag_tck                 (hps_jtag_tck),                
.hps_io_jtag_tms                 (hps_jtag_tms),                
.hps_io_jtag_tdo                 (hps_jtag_tdo),                 
.hps_io_jtag_tdi                 (hps_jtag_tdi),    
.hps_io_EMAC0_TX_CLK       (hps_emac0_TX_CLK),     
.hps_io_EMAC0_RX_CLK       (hps_emac0_RX_CLK),     
.hps_io_EMAC0_TX_CTL       (hps_emac0_TX_CTL),    
.hps_io_EMAC0_RX_CTL       (hps_emac0_RX_CTL),    
.hps_io_EMAC0_TXD0         (hps_emac0_TXD0),     
.hps_io_EMAC0_TXD1         (hps_emac0_TXD1),
.hps_io_EMAC0_RXD0         (hps_emac0_RXD0),       
.hps_io_EMAC0_RXD1         (hps_emac0_RXD1),        
.hps_io_EMAC0_TXD2         (hps_emac0_TXD2),      
.hps_io_EMAC0_TXD3         (hps_emac0_TXD3),   
.hps_io_EMAC0_RXD2         (hps_emac0_RXD2),        
.hps_io_EMAC0_RXD3         (hps_emac0_RXD3),
.hps_io_EMAC0_MDIO         (hps_emac0_MDIO),       
.hps_io_EMAC0_MDC          (hps_emac0_MDC), 
.hps_io_SDMMC_CCLK         (hps_sdmmc_CCLK),   
.hps_io_SDMMC_CMD          (hps_sdmmc_CMD), 
.hps_io_SDMMC_D0           (hps_sdmmc_D0),          
.hps_io_SDMMC_D1           (hps_sdmmc_D1),          
.hps_io_SDMMC_D2           (hps_sdmmc_D2),         
.hps_io_SDMMC_D3           (hps_sdmmc_D3),        
.hps_io_I2C1_SDA           (hps_i2c1_SDA),     
.hps_io_I2C1_SCL           (hps_i2c1_SCL),
.hps_io_UART0_RX           (hps_uart0_RX),          
.hps_io_UART0_TX           (hps_uart0_TX), 
.hps_io_USB0_CLK           (hps_usb0_CLK), 
.hps_io_USB0_STP           (hps_usb0_STP), 
.hps_io_USB0_DIR           (hps_usb0_DIR),
.hps_io_USB0_NXT           (hps_usb0_NXT),
.hps_io_USB0_DATA0         (hps_usb0_DATA0),
.hps_io_USB0_DATA1         (hps_usb0_DATA1), 
.hps_io_USB0_DATA2         (hps_usb0_DATA2), 
.hps_io_USB0_DATA3         (hps_usb0_DATA3), 
.hps_io_USB0_DATA4         (hps_usb0_DATA4), 
.hps_io_USB0_DATA5         (hps_usb0_DATA5),
.hps_io_USB0_DATA6         (hps_usb0_DATA6), 
.hps_io_USB0_DATA7         (hps_usb0_DATA7),
.hps_io_gpio1_io0           (hps_gpio1_io0),
.hps_io_gpio1_io1           (hps_gpio1_io1),
.hps_io_gpio1_io4           (hps_gpio1_io4),
.hps_io_gpio1_io5           (hps_gpio1_io5),
.hps_io_gpio1_io19           (hps_gpio1_io19),
.hps_io_gpio1_io20           (hps_gpio1_io20),
.hps_io_gpio1_io21           (hps_gpio1_io21),
.f2h_irq1_irq                           (f2h_irq1_irq),
.hps_io_hps_osc_clk                     (hps_ref_clk),
.h2f_reset_reset                        (h2f_reset),
.reset_reset                         (~system_reset_n),
//.iopll_0_reset_reset                    (~system_reset_n),
.pcie_p1_bas_conduit_vfenable         (1'b0),         
.pcie_p1_bas_conduit_pfnum            (3'b000),            
.pcie_p1_bas_conduit_vfnum            (11'b00000000000),                     
.pcie_ninit_done_reset                (ninit_done),               
.pcie_serial_rx_n_in0             (1'b1),             
.pcie_serial_rx_n_in1             (1'b1),             
.pcie_serial_rx_n_in2             (1'b1),             
.pcie_serial_rx_n_in3             (1'b1),             
.pcie_serial_rx_n_in4             (1'b1),             
.pcie_serial_rx_n_in5             (1'b1),             
.pcie_serial_rx_n_in6             (1'b1),             
.pcie_serial_rx_n_in7             (1'b1),                      
.pcie_serial_rx_n_in8             (pcie_serial_rx_n_in0),                      
.pcie_serial_rx_n_in9             (pcie_serial_rx_n_in1),                      
.pcie_serial_rx_n_in10            (pcie_serial_rx_n_in2),                      
.pcie_serial_rx_n_in11            (pcie_serial_rx_n_in3),
.pcie_serial_rx_n_in12            (1'b1),  
.pcie_serial_rx_n_in13            (1'b1),  
.pcie_serial_rx_n_in14            (1'b1),  
.pcie_serial_rx_n_in15            (1'b1),  
                     
.pcie_serial_rx_p_in0             (1'b0),             
.pcie_serial_rx_p_in1             (1'b0),             
.pcie_serial_rx_p_in2             (1'b0),             
.pcie_serial_rx_p_in3             (1'b0),             
.pcie_serial_rx_p_in4             (1'b0),             
.pcie_serial_rx_p_in5             (1'b0),             
.pcie_serial_rx_p_in6             (1'b0),             
.pcie_serial_rx_p_in7             (1'b0),                      
.pcie_serial_rx_p_in8             (pcie_serial_rx_p_in0),                      
.pcie_serial_rx_p_in9             (pcie_serial_rx_p_in1),                      
.pcie_serial_rx_p_in10            (pcie_serial_rx_p_in2),                      
.pcie_serial_rx_p_in11            (pcie_serial_rx_p_in3),   
.pcie_serial_rx_p_in12            (1'b0),   
.pcie_serial_rx_p_in13            (1'b0),   
.pcie_serial_rx_p_in14            (1'b0),   
.pcie_serial_rx_p_in15            (1'b0),   

                   
.pcie_serial_tx_n_out0            (),            
.pcie_serial_tx_n_out1            (),            
.pcie_serial_tx_n_out2            (),            
.pcie_serial_tx_n_out3            (),            
.pcie_serial_tx_n_out4            (),            
.pcie_serial_tx_n_out5            (),            
.pcie_serial_tx_n_out6            (),            
.pcie_serial_tx_n_out7            (),                    
.pcie_serial_tx_n_out8            (pcie_serial_tx_n_out0),                    
.pcie_serial_tx_n_out9            (pcie_serial_tx_n_out1),                    
.pcie_serial_tx_n_out10           (pcie_serial_tx_n_out2),                    
.pcie_serial_tx_n_out11           (pcie_serial_tx_n_out3),                    
.pcie_serial_tx_n_out12           (),                    
.pcie_serial_tx_n_out13           (),                    
.pcie_serial_tx_n_out14           (),                    
.pcie_serial_tx_n_out15           (),  
                  
.pcie_serial_tx_p_out0            (),            
.pcie_serial_tx_p_out1            (),            
.pcie_serial_tx_p_out2            (),            
.pcie_serial_tx_p_out3            (),            
.pcie_serial_tx_p_out4            (),            
.pcie_serial_tx_p_out5            (),            
.pcie_serial_tx_p_out6            (),            
.pcie_serial_tx_p_out7            (),                    
.pcie_serial_tx_p_out8            (pcie_serial_tx_p_out0),                    
.pcie_serial_tx_p_out9            (pcie_serial_tx_p_out1),                    
.pcie_serial_tx_p_out10           (pcie_serial_tx_p_out2),                    
.pcie_serial_tx_p_out11           (pcie_serial_tx_p_out3),                    
.pcie_serial_tx_p_out12           (),                    
.pcie_serial_tx_p_out13           (), 
.pcie_serial_tx_p_out14           (), 
.pcie_serial_tx_p_out15           (), 
                   
.pcie_pin_perst_pin_perst          (pcie_pin_perst_reset_n),
.clk_bdg_100_clk                       (clk_bdg_100_clk),
.clk_bdg_250_clk                       (clk_bdg_250_clk),
.iopll_locked_export                   (iopll_locked_export),
.rst_bdg_100_clk                       (clk_bdg_100_clk),
.rst_bdg_100_rst_reset_n               (iopll_locked_export),
//.rst_bdg_100_rst_reset_n               (system_reset_n),
.rst_bdg_250_clk                       (clk_bdg_250_clk),
.rst_bdg_250_rst_reset_n               (iopll_locked_export),
//.rst_bdg_250_rst_reset_n               (system_reset_n),
.pcie_refclk0_clk                      (pcie_refclk0_clk),
.pcie_refclk1_clk                      (pcie_refclk1_clk)
//.iopll_pd_reset_reset                  (1'b0)

//.pcie_p2_hip_status_link_up            (),     
//.pcie_p2_hip_status_dl_up              (),     
//.pcie_p2_hip_status_surprise_down_err  (),    
//.pcie_p2_hip_status_ltssmstate         (),   
//pcie_p2_bas_conduit_vfenable         (1'b0),         
//.pcie_p2_bas_conduit_pfnum            (3'b000),            
//.pcie_p2_bas_conduit_vfnum            (11'b00000000000),       
//.pcie_p2_bas_slave_waitrequest        (),
//.pcie_p2_bas_slave_address            (64'd0),                 
//.pcie_p2_bas_slave_byteenable         (16'd0),              
//.pcie_p2_bas_slave_read               (1'b0), 
//.pcie_p2_bas_slave_readdata           (),                
//.pcie_p2_bas_slave_readdatavalid      (),      
//.pcie_p2_bas_slave_write              (1'b0), 
//.pcie_p2_bas_slave_writedata          (128'd0), 
//.pcie_p2_bas_slave_burstcount         (6'd0), 
//.pcie_p2_bas_slave_response           (),             
//.pcie_p2_bam_master_waitrequest       (),  
//.pcie_p2_bam_master_address           (),  
//.pcie_p2_bam_master_byteenable        (),
//.pcie_p2_bam_master_read              (),    
//.pcie_p2_bam_master_readdata          (128'd0),            
//.pcie_p2_bam_master_readdatavalid     (1'b0),
//.pcie_p2_bam_master_write             (),    
//.pcie_p2_bam_master_writedata         (),
//.pcie_p2_bam_master_burstcount        (),  
//.pcie_p2_usr_config_tl_tl_cfg_func    (),        
//.pcie_p2_usr_config_tl_tl_cfg_add     (),         
//.pcie_p2_usr_config_tl_tl_cfg_ctl     (),          
//.pcie_p2_usr_hip_reconfig_rst_reset_n (),     
//.pcie_p2_usr_hip_reconfig_clk_clk     (),          
//.pcie_p2_usr_hip_reconfig_address     (21'd0),          
//.pcie_p2_usr_hip_reconfig_read        (1'd0),            
//.pcie_p2_usr_hip_reconfig_readdata    (),         
//.pcie_p2_usr_hip_reconfig_readdatavalid(),    
//.pcie_p2_usr_hip_reconfig_write       (1'd0),           
//.pcie_p2_usr_hip_reconfig_writedata   (8'd0),       
//.pcie_p2_usr_hip_reconfig_waitrequest (),      
//.pcie_p2_cs_slave_waitrequest         (),            
//.pcie_p2_cs_slave_address             (14'd0),           
//.pcie_p2_cs_slave_byteenable          (4'd0),   
//.pcie_p2_cs_slave_read                (1'd0),                     
//.pcie_p2_cs_slave_readdata            (),  
//.pcie_p2_cs_slave_readdatavalid       (),          
//.pcie_p2_cs_slave_writeresponsevalid  (),       
//.pcie_p2_cs_slave_write               (1'd0),                 
//.pcie_p2_cs_slave_writedata           (32'd0),
//.pcie_p2_cs_slave_response            (),                
//.systemclk_refclk_fgt_in_refclk_fgt_0 (pcie_refclk0_clk)
//.systemclk_refclk_fgt_in_refclk_fgt_3 (pcie_refclk0_clk)
);  

// debounce fpga_reset_n
debounce fpga_reset_n_debounce_inst (
.clk          (system_clk_100_internal),
.reset_n      (~ninit_done),
.data_in      (fpga_reset_n),
.data_out     (fpga_reset_n_debounced_wire)
);
defparam fpga_reset_n_debounce_inst.WIDTH = 1;
defparam fpga_reset_n_debounce_inst.POLARITY = "LOW";
defparam fpga_reset_n_debounce_inst.TIMEOUT = 10000;               // at 100Mhz this is a debounce time of 1ms
defparam fpga_reset_n_debounce_inst.TIMEOUT_WIDTH = 32;            // ceil(log2(TIMEOUT))

always @ (posedge system_clk_100_internal or posedge ninit_done)
begin
    if (ninit_done == 1'b1)
        fpga_reset_n_debounced <= 1'b0;
    else
        fpga_reset_n_debounced <= fpga_reset_n_debounced_wire;  
end

always @(posedge system_clk_100_internal or posedge system_reset_sync) begin
  if (system_reset_sync)
    heartbeat_count <= 23'd0;
  else
    heartbeat_count <= heartbeat_count + 23'd1;
end



endmodule


