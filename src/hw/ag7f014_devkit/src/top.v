//****************************************************************************
//
// SPDX-License-Identifier: MIT-0
// SPDX-FileCopyrightText: Copyright (C) 2025 Altera Corporation
//
//****************************************************************************
// This is a generated system top level RTL file. 



module top (
//Additional refclk_bti to preserve Etile XCVR
input    wire          refclk_bti,
// Clock and Reset
input    wire [1-1:0]  fpga_clk_100,
output   wire [4-1:0]  fpga_led_pio,
input    wire [4-1:0]  fpga_dipsw_pio,
//input    wire [4-1:0]  fpga_button_pio,
//input  wire          enet_refclk,
//inout  wire          emac1_mdio,
//output wire          emac1_mdc,
//input  wire          emac1_sgmii_rxp,
//input  wire          emac1_sgmii_rxn,
//output wire          emac1_sgmii_txp,
//output wire          emac1_sgmii_txn,
//input  wire          emac1_phy_irq_n,
//output wire          emac1_phy_rst_n,
//HPS
// HPS EMIF
output   wire [0:0]    emif_hps_mem_mem_ck,
output   wire [0:0]    emif_hps_mem_mem_ck_n,
output   wire [16:0]   emif_hps_mem_mem_a,
output   wire [0:0]    emif_hps_mem_mem_act_n,
output   wire [1:0]    emif_hps_mem_mem_ba,
output   wire [1-1:0]    emif_hps_mem_mem_bg,
output   wire [0:0]    emif_hps_mem_mem_cke,
output   wire [0:0]    emif_hps_mem_mem_cs_n,
output   wire [0:0]    emif_hps_mem_mem_odt,
output   wire [0:0]    emif_hps_mem_mem_reset_n,
output   wire [0:0]    emif_hps_mem_mem_par,
input    wire [0:0]    emif_hps_mem_mem_alert_n,
input    wire          emif_hps_oct_oct_rzqin,
input    wire          emif_hps_pll_ref_clk,
inout    wire [9-1:0]   emif_hps_mem_mem_dbi_n,
inout    wire [72-1:0]   emif_hps_mem_mem_dq,
inout    wire [9-1:0]   emif_hps_mem_mem_dqs,
inout    wire [9-1:0]   emif_hps_mem_mem_dqs_n,
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


//input  wire        pcie_bas_conduit_vfenable,         
//input  wire [2:0]  pcie_bas_conduit_pfnum,            
//input  wire [10:0] pcie_bas_conduit_vfnum,            
           
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
//input  wire        pcie_serial_rx_n_in8,             
//input  wire        pcie_serial_rx_n_in9,             
//input  wire        pcie_serial_rx_n_in10,            
//input  wire        pcie_serial_rx_n_in11,            
//input  wire        pcie_serial_rx_n_in12,            
//input  wire        pcie_serial_rx_n_in13,            
//input  wire        pcie_serial_rx_n_in14,            
//input  wire        pcie_serial_rx_n_in15,            
input  wire        pcie_serial_rx_p_in0,             
input  wire        pcie_serial_rx_p_in1,             
input  wire        pcie_serial_rx_p_in2,             
input  wire        pcie_serial_rx_p_in3,             
//input  wire        pcie_serial_rx_p_in4,             
//input  wire        pcie_serial_rx_p_in5,             
//input  wire        pcie_serial_rx_p_in6,             
//input  wire        pcie_serial_rx_p_in7,             
//input  wire        pcie_serial_rx_p_in8,             
//input  wire        pcie_serial_rx_p_in9,             
//input  wire        pcie_serial_rx_p_in10,            
//input  wire        pcie_serial_rx_p_in11,            
//input  wire        pcie_serial_rx_p_in12,            
//input  wire        pcie_serial_rx_p_in13,            
//input  wire        pcie_serial_rx_p_in14,            
//input  wire        pcie_serial_rx_p_in15,            
output wire        pcie_serial_tx_n_out0,            
output wire        pcie_serial_tx_n_out1,            
output wire        pcie_serial_tx_n_out2,            
output wire        pcie_serial_tx_n_out3,            
//output wire        pcie_serial_tx_n_out4,            
//output wire        pcie_serial_tx_n_out5,            
//output wire        pcie_serial_tx_n_out6,            
//output wire        pcie_serial_tx_n_out7,            
//output wire        pcie_serial_tx_n_out8,            
//output wire        pcie_serial_tx_n_out9,            
//output wire        pcie_serial_tx_n_out10,           
//output wire        pcie_serial_tx_n_out11,           
//output wire        pcie_serial_tx_n_out12,           
//output wire        pcie_serial_tx_n_out13,           
//output wire        pcie_serial_tx_n_out14,           
//output wire        pcie_serial_tx_n_out15,           
output wire        pcie_serial_tx_p_out0,            
output wire        pcie_serial_tx_p_out1,            
output wire        pcie_serial_tx_p_out2,            
output wire        pcie_serial_tx_p_out3,            
//output wire        pcie_serial_tx_p_out4,            
//output wire        pcie_serial_tx_p_out5,            
//output wire        pcie_serial_tx_p_out6,            
//output wire        pcie_serial_tx_p_out7,            
//output wire        pcie_serial_tx_p_out8,            
//output wire        pcie_serial_tx_p_out9,            
//output wire        pcie_serial_tx_p_out10,           
//output wire        pcie_serial_tx_p_out11,           
//output wire        pcie_serial_tx_p_out12,           
//output wire        pcie_serial_tx_p_out13,           
//output wire        pcie_serial_tx_p_out14,           
//output wire        pcie_serial_tx_p_out15,           
input  wire        pcie_pin_perst_reset_n 
);

wire         system_clk_100;
wire         system_clk_100_internal;
wire         ninit_done;
wire         fpga_reset_n_debounced_wire;
reg          fpga_reset_n_debounced;
wire         src_reset_n;
wire         system_reset_n;
wire         h2f_reset;
wire         niosv_issp_reset;

wire         clk_bdg_100_clk;
wire         clk_bdg_250_clk;
wire         iopll_locked_export;

assign system_reset_n = fpga_reset_n & src_reset_n & ~h2f_reset & ~ninit_done;




assign system_clk_100   = fpga_clk_100;

assign system_clk_100_internal  = system_clk_100;

wire [4-1:0]     fpga_debounced_buttons;
wire [4-2:0]     fpga_led_internal;
wire           heartbeat_led;
reg  [22:0]    heartbeat_count;
assign fpga_led_pio = {heartbeat_led,fpga_led_internal};
assign heartbeat_led = ~heartbeat_count[22];

wire [31:0]    f2h_irq1_irq;


wire [43:0]    stm_hw_events;

assign stm_hw_events    = {{20{1'b0}}, heartbeat_led, fpga_led_internal, fpga_dipsw_pio, fpga_debounced_buttons};


//wire        emac1_sgmii_status_set_10;
//wire        emac1_sgmii_status_set_1000;
//wire        emac1_sgmii_status_set_100;
//wire        emac1_sgmii_status_hd_ena;
//wire        emac1_status_led_crs;
//wire        emac1_status_led_link;
//wire        emac1_status_led_panel_link;
//wire        emac1_status_led_col;
//wire        emac1_status_led_an;
//wire        emac1_status_led_char_err;
//wire        emac1_status_led_disp_err;
//wire        emac1_serdes_control_export;
//wire        emac1_lvds_tx_pll_locked_export;
//wire [12:0] emac1_sgmii_debug_status_pio;
//wire        emac1_mdio_gmii_mdi_i;
//wire        emac1_mdio_gmii_mdo_o;
//wire        emac1_mdio_gmii_mdo_o_e;
//
//assign emac1_sgmii_debug_status_pio   = {emac1_lvds_tx_pll_locked_export,
//    emac1_serdes_control_export, emac1_status_led_disp_err,
//    emac1_status_led_char_err, emac1_status_led_an,
//    emac1_status_led_col, emac1_status_led_panel_link,
//    emac1_status_led_link, emac1_status_led_crs,
//    emac1_sgmii_status_hd_ena, emac1_sgmii_status_set_100,
//    emac1_sgmii_status_set_1000, emac1_sgmii_status_set_10};

//assign emac1_mdio = emac1_mdio_gmii_mdo_o_e ? emac1_mdio_gmii_mdo_o : 1'bz;
//assign emac1_mdio_gmii_mdi_i = emac1_mdio;

//assign emac1_phy_rst_n = system_reset_n;



assign f2h_irq1_irq    = {32'b0};//~emac1_phy_irq_n};

//Temporary disable src_reset_n
assign src_reset_n = 1'b1;

// Qsys Top module
qsys_top soc_inst (
//.src_prb_rst_sources_source             (src_reset_n),
.clk_100_clk                            (system_clk_100_internal),
.ninit_done_ninit_done                  (ninit_done),
//.led_pio_external_connection_in_port    (fpga_led_internal),
//.led_pio_external_connection_out_port   (fpga_led_internal),
//.dipsw_pio_external_connection_export   (fpga_dipsw_pio),
//.button_pio_external_connection_export  (fpga_debounced_buttons),
.agilex_hps_f2h_stm_hw_events_stm_hwevents (stm_hw_events),     
//Terminate the CS_JTAG.
.agilex_hps_h2f_cs_ntrst                   (1'b1),  
.agilex_hps_h2f_cs_tck                     (1'b1),    
.agilex_hps_h2f_cs_tdi                     (1'b1),    
.agilex_hps_h2f_cs_tdo                     (),    
.agilex_hps_h2f_cs_tdoen                   (),  
.agilex_hps_h2f_cs_tms                     (1'b1),    
.emif_hps_pll_ref_clk_clk               (emif_hps_pll_ref_clk),   
.emif_hps_mem_mem_ck                    (emif_hps_mem_mem_ck),   
.emif_hps_mem_mem_ck_n                  (emif_hps_mem_mem_ck_n),  
.emif_hps_mem_mem_a                     (emif_hps_mem_mem_a),       
.emif_hps_mem_mem_act_n                 (emif_hps_mem_mem_act_n),   
.emif_hps_mem_mem_ba                    (emif_hps_mem_mem_ba),      
.emif_hps_mem_mem_bg                    (emif_hps_mem_mem_bg),      
.emif_hps_mem_mem_cke                   (emif_hps_mem_mem_cke),    
.emif_hps_mem_mem_cs_n                  (emif_hps_mem_mem_cs_n),    
.emif_hps_mem_mem_odt                   (emif_hps_mem_mem_odt),     
.emif_hps_mem_mem_reset_n               (emif_hps_mem_mem_reset_n),
.emif_hps_mem_mem_par                   (emif_hps_mem_mem_par),          
.emif_hps_mem_mem_alert_n               (emif_hps_mem_mem_alert_n),    
.emif_hps_mem_mem_dqs                   (emif_hps_mem_mem_dqs),       
.emif_hps_mem_mem_dqs_n                 (emif_hps_mem_mem_dqs_n),     
.emif_hps_mem_mem_dq                    (emif_hps_mem_mem_dq), 
.emif_hps_mem_mem_dbi_n                 (emif_hps_mem_mem_dbi_n), 
.emif_hps_oct_oct_rzqin                 (emif_hps_oct_oct_rzqin), 
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
//.clk_125_clk                               (enet_refclk),
//.emac1_sgmii_status_set_10              (emac1_sgmii_status_set_10),
//.emac1_sgmii_status_set_1000            (emac1_sgmii_status_set_1000),
//.emac1_sgmii_status_set_100             (emac1_sgmii_status_set_100),
//.emac1_sgmii_status_hd_ena              (emac1_sgmii_status_hd_ena),
//.emac1_status_led_crs                   (emac1_status_led_crs),
//.emac1_status_led_link                  (emac1_status_led_link),
//.emac1_status_led_panel_link            (emac1_status_led_panel_link),
//.emac1_status_led_col                   (emac1_status_led_col),
//.emac1_status_led_an                    (emac1_status_led_an),
//.emac1_status_led_char_err              (emac1_status_led_char_err),
//.emac1_status_led_disp_err              (emac1_status_led_disp_err),
//.emac1_serdes_control_export            (emac1_serdes_control_export),
//.emac1_lvds_tx_pll_locked_export        (emac1_lvds_tx_pll_locked_export),
//.emac1_sgmii_debug_status_pio_export    (emac1_sgmii_debug_status_pio),
//.emac1_serial_rxp_0                     (emac1_sgmii_rxp),
//.emac1_serial_rxn_0                     (emac1_sgmii_rxn),
//.emac1_serial_txp_0                     (emac1_sgmii_txp),
//.emac1_serial_txn_0                     (emac1_sgmii_txn),
//.emac1_mdio_gmii_mdi_i                  (emac1_mdio_gmii_mdi_i),
//.emac1_mdio_gmii_mdo_o                  (emac1_mdio_gmii_mdo_o),
//.emac1_mdio_gmii_mdo_o_e                (emac1_mdio_gmii_mdo_o_e),
//.emac1_mdc_clk                          (emac1_mdc),
//.emac1_ptp_ptp_aux_ts_trig_i            (1'b0),
//.emac1_ptp_ptp_pps_o                    (),
//.emac1_ptp_ptp_tstmp_data               (),
//.emac1_ptp_ptp_tstmp_en                 (),
.h2f_reset_reset                        (h2f_reset),
.reset_reset_n                          (system_reset_n),
//.pcie_bas_conduit_vfenable         (1'b0),         
//.pcie_bas_conduit_pfnum            (3'b000),            
//.pcie_bas_conduit_vfnum            (11'b00000000000),            
.pcie_usr_config_tl_tl_cfg_func    (),    
.pcie_usr_config_tl_tl_cfg_add     (),     
.pcie_usr_config_tl_tl_cfg_ctl     (),          
.pcie_refclk0_clk                     (pcie_refclk0_clk),                     
.pcie_refclk1_clk                     (pcie_refclk1_clk),                     
.pcie_ninit_done_reset                (ninit_done),               
.pcie_serial_rx_n_in0             (pcie_serial_rx_n_in0),             
.pcie_serial_rx_n_in1             (pcie_serial_rx_n_in1),             
.pcie_serial_rx_n_in2             (pcie_serial_rx_n_in2),             
.pcie_serial_rx_n_in3             (pcie_serial_rx_n_in3),             
.pcie_serial_rx_n_in4             (1'b1),             
.pcie_serial_rx_n_in5             (1'b1),             
.pcie_serial_rx_n_in6             (1'b1),             
.pcie_serial_rx_n_in7             (1'b1),             
.pcie_serial_rx_n_in8             (1'b1),             
.pcie_serial_rx_n_in9             (1'b1),             
.pcie_serial_rx_n_in10            (1'b1),            
.pcie_serial_rx_n_in11            (1'b1),            
.pcie_serial_rx_n_in12            (1'b1),            
.pcie_serial_rx_n_in13            (1'b1),            
.pcie_serial_rx_n_in14            (1'b1),            
.pcie_serial_rx_n_in15            (1'b1),            
.pcie_serial_rx_p_in0             (pcie_serial_rx_p_in0),             
.pcie_serial_rx_p_in1             (pcie_serial_rx_p_in1),             
.pcie_serial_rx_p_in2             (pcie_serial_rx_p_in2),             
.pcie_serial_rx_p_in3             (pcie_serial_rx_p_in3),             
.pcie_serial_rx_p_in4             (1'b0),             
.pcie_serial_rx_p_in5             (1'b0),             
.pcie_serial_rx_p_in6             (1'b0),             
.pcie_serial_rx_p_in7             (1'b0),             
.pcie_serial_rx_p_in8             (1'b0),             
.pcie_serial_rx_p_in9             (1'b0),             
.pcie_serial_rx_p_in10            (1'b0),            
.pcie_serial_rx_p_in11            (1'b0),            
.pcie_serial_rx_p_in12            (1'b0),            
.pcie_serial_rx_p_in13            (1'b0),            
.pcie_serial_rx_p_in14            (1'b0),            
.pcie_serial_rx_p_in15            (1'b0),            
.pcie_serial_tx_n_out0            (pcie_serial_tx_n_out0),            
.pcie_serial_tx_n_out1            (pcie_serial_tx_n_out1),            
.pcie_serial_tx_n_out2            (pcie_serial_tx_n_out2),            
.pcie_serial_tx_n_out3            (pcie_serial_tx_n_out3),            
.pcie_serial_tx_n_out4            (),            
.pcie_serial_tx_n_out5            (),            
.pcie_serial_tx_n_out6            (),            
.pcie_serial_tx_n_out7            (),            
.pcie_serial_tx_n_out8            (),            
.pcie_serial_tx_n_out9            (),            
.pcie_serial_tx_n_out10           (),           
.pcie_serial_tx_n_out11           (),           
.pcie_serial_tx_n_out12           (),           
.pcie_serial_tx_n_out13           (),           
.pcie_serial_tx_n_out14           (),           
.pcie_serial_tx_n_out15           (),           
.pcie_serial_tx_p_out0            (pcie_serial_tx_p_out0),            
.pcie_serial_tx_p_out1            (pcie_serial_tx_p_out1),            
.pcie_serial_tx_p_out2            (pcie_serial_tx_p_out2),            
.pcie_serial_tx_p_out3            (pcie_serial_tx_p_out3),            
.pcie_serial_tx_p_out4            (),            
.pcie_serial_tx_p_out5            (),            
.pcie_serial_tx_p_out6            (),            
.pcie_serial_tx_p_out7            (),            
.pcie_serial_tx_p_out8            (),            
.pcie_serial_tx_p_out9            (),            
.pcie_serial_tx_p_out10           (),           
.pcie_serial_tx_p_out11           (),           
.pcie_serial_tx_p_out12           (),           
.pcie_serial_tx_p_out13           (),           
.pcie_serial_tx_p_out14           (),           
.pcie_serial_tx_p_out15           (),           
.pcie_pin_perst_reset_n           (pcie_pin_perst_reset_n),

.pcie_p1_int_int_status                    (),//             pcie_p1_int.int_status
.pcie_p1_hip_status_link_up                (),//             pcie_p1_hip_status.link_up
.pcie_p1_hip_status_dl_up                  (),//                               .dl_up
.pcie_p1_hip_status_surprise_down_err      (),//                               .surprise_down_err
.pcie_p1_hip_status_ltssmstate             (),//                               .ltssmstate

.pcie_p3_int_int_status                    (),//             pcie_p3_int.int_status
.pcie_p3_hip_status_link_up                (),//             pcie_p3_hip_status.link_up
.pcie_p3_hip_status_dl_up                  (),//                               .dl_up
.pcie_p3_hip_status_surprise_down_err      (),//                               .surprise_down_err
.pcie_p3_hip_status_ltssmstate             (),//                               .ltssmstate

.pcie_p1_bam_master_waitrequest            (),//             pcie_p1_bam_master.waitrequest
.pcie_p1_bam_master_address                (),//                               .address
.pcie_p1_bam_master_byteenable             (),//                               .byteenable
.pcie_p1_bam_master_read                   (),//                               .read
.pcie_p1_bam_master_readdata               (),//                               .readdata
.pcie_p1_bam_master_readdatavalid          (),//                               .readdatavalid
.pcie_p1_bam_master_write                  (),//                               .write
.pcie_p1_bam_master_writedata              (),//                               .writedata
.pcie_p1_bam_master_burstcount             (),//                               .burstcount
.pcie_p1_usr_config_tl_tl_cfg_func         (),//           pcie_p1_usr_config_tl.tl_cfg_func
.pcie_p1_usr_config_tl_tl_cfg_add          (),//                               .tl_cfg_add
.pcie_p1_usr_config_tl_tl_cfg_ctl          (),//                               .tl_cfg_ctl
.pcie_p1_usr_hip_reconfig_rst_reset_n      (),//           pcie_p1_usr_hip_reconfig_rst.reset_n
.pcie_p1_usr_hip_reconfig_clk_clk          (),//           pcie_p1_usr_hip_reconfig_clk.clk
.pcie_p1_usr_hip_reconfig_address          (),//           pcie_p1_usr_hip_reconfig.address
.pcie_p1_usr_hip_reconfig_read             (),//                               .read
.pcie_p1_usr_hip_reconfig_readdata         (),//                               .readdata
.pcie_p1_usr_hip_reconfig_readdatavalid    (),//                               .readdatavalid
.pcie_p1_usr_hip_reconfig_write            (),//                               .write
.pcie_p1_usr_hip_reconfig_writedata        (),//                               .writedata
.pcie_p1_usr_hip_reconfig_waitrequest      (),//                               .waitrequest
.pcie_p1_cs_slave_waitrequest              (),//           pcie_p1_cs_slave.waitrequest
.pcie_p1_cs_slave_address                  (),//                               .address
.pcie_p1_cs_slave_byteenable               (),//                               .byteenable
.pcie_p1_cs_slave_read                     (),//                               .read
.pcie_p1_cs_slave_readdata                 (),//                               .readdata
.pcie_p1_cs_slave_readdatavalid            (),//                               .readdatavalid
.pcie_p1_cs_slave_writeresponsevalid       (),//                               .writeresponsevalid
.pcie_p1_cs_slave_write                    (),//                               .write
.pcie_p1_cs_slave_writedata                (),//                               .writedata
.pcie_p1_cs_slave_response                 (),//                               .response

.pcie_p2_bas_conduit_vfenable              (1'b0),//            pcie_p2_bas_conduit.vfenable
.pcie_p2_bas_conduit_pfnum                 (3'b000),//                               .pfnum
.pcie_p2_bas_conduit_vfnum                 (11'b00000000000),//                               .vfnum
.pcie_p2_usr_config_tl_tl_cfg_func         (),//            pcie_p2_usr_config_tl.tl_cfg_func
.pcie_p2_usr_config_tl_tl_cfg_add          (),//                               .tl_cfg_add
.pcie_p2_usr_config_tl_tl_cfg_ctl          (),//                               .tl_cfg_ctl

.pcie_p3_bam_master_waitrequest            (),//            pcie_p3_bam_master.waitrequest
.pcie_p3_bam_master_address                (),//                               .address
.pcie_p3_bam_master_byteenable             (),//                               .byteenable
.pcie_p3_bam_master_read                   (),//                               .read
.pcie_p3_bam_master_readdata               (),//                               .readdata
.pcie_p3_bam_master_readdatavalid          (),//                               .readdatavalid
.pcie_p3_bam_master_write                  (),//                               .write
.pcie_p3_bam_master_writedata              (),//                               .writedata
.pcie_p3_bam_master_burstcount             (),//                               .burstcount
.pcie_p3_usr_config_tl_tl_cfg_func         (),//          pcie_p3_usr_config_tl.tl_cfg_func
.pcie_p3_usr_config_tl_tl_cfg_add          (),//                               .tl_cfg_add
.pcie_p3_usr_config_tl_tl_cfg_ctl          (),//                               .tl_cfg_ctl
.pcie_p3_usr_hip_reconfig_rst_reset_n      (),//          pcie_p3_usr_hip_reconfig_rst.reset_n
.pcie_p3_usr_hip_reconfig_clk_clk          (),//          pcie_p3_usr_hip_reconfig_clk.clk
.pcie_p3_usr_hip_reconfig_address          (),//          pcie_p3_usr_hip_reconfig.address
.pcie_p3_usr_hip_reconfig_read             (),//                               .read
.pcie_p3_usr_hip_reconfig_readdata         (),//                               .readdata
.pcie_p3_usr_hip_reconfig_readdatavalid    (),//                               .readdatavalid
.pcie_p3_usr_hip_reconfig_write            (),//                               .write
.pcie_p3_usr_hip_reconfig_writedata        (),//                               .writedata
.pcie_p3_usr_hip_reconfig_waitrequest      (),//                               .waitrequest
.pcie_p3_cs_slave_waitrequest              (),//          pcie_p3_cs_slave.waitrequest
.pcie_p3_cs_slave_address                  (),//                               .address
.pcie_p3_cs_slave_byteenable               (),//                               .byteenable
.pcie_p3_cs_slave_read                     (),//                               .read
.pcie_p3_cs_slave_readdata                 (),//                               .readdata
.pcie_p3_cs_slave_readdatavalid            (),//                               .readdatavalid
.pcie_p3_cs_slave_writeresponsevalid       (),//                               .writeresponsevalid
.pcie_p3_cs_slave_write                    (),//                               .write
.pcie_p3_cs_slave_writedata               (),//                               .writedata
.pcie_p3_cs_slave_response                 (),//                               .response
.clk_bdg_100_clk                       (clk_bdg_100_clk),
.clk_bdg_250_clk                       (clk_bdg_250_clk),
.iopll_locked_export                   (iopll_locked_export),
.rst_bdg_100_clk                       (clk_bdg_100_clk),
.rst_bdg_100_rst_reset_n               (iopll_locked_export),
.rst_bdg_250_clk                       (clk_bdg_250_clk),
.rst_bdg_250_rst_reset_n               (iopll_locked_export),
.msi_ordering_0_csr_vector_addr_csr_vector_addr   (37'h7ea0_0000) 

);  


endmodule


