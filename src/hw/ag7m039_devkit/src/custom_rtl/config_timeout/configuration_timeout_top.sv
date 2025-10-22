//# ######################################################################## 
//# Copyright (C) 2025 Altera Corporation.
//# SPDX-License-Identifier: MIT
//# ########################################################################  
//----------------------------------------------------------------
// Project Name: P_tile_rp
// Module Name : configuration_timeout_top.v
// Author : anilatho 
// Description : A file that includes config timeout and mux.
//----------------------------------------------------------------
 

`timescale 1 ns / 1 ps

module configuration_timeout_top # (
    parameter ADDR_WIDTH            = 14,
    parameter DATA_WIDTH            = 32,
	 parameter RESP_WIDTH            = 2,
    parameter CSR_ADDR_WIDTH        = 8,
    parameter CSR_DATA_WIDTH        = 32,	 
	 parameter CSR_BYTE_ENABLE_WIDTH = 4,
	 parameter LTSSM_STATE_WIDTH     = 6
    ) 
    (
    input logic  						 			clk_i,
    input logic  						 			rstn_i,
	 input logic  						 			cs_waitrequest_i,     // waitrequest 	 signal from P_tile_ip
	 input logic  						 			cs_readdatavalid_i,   // readdatavalid signal from P_tile_ip
	 input logic  						 			cs_writerespvalid_i,  // writerespvalid signal from P_tile_ip
    input logic [DATA_WIDTH-1:0]  			cs_readdata_i,        // readdata 		 signal from P_tile_ip                    
	 input logic [RESP_WIDTH-1:0]  			cs_resp_i,            // response 		 signal from P_tile_ip
	 
	 output logic[ADDR_WIDTH-1:0]  			cs_address_o,         // address 		 signal to   P_tile_ip
	 output logic[DATA_WIDTH-1:0]  			cs_writedata_o,       // writedata  	 signal to   P_tile_ip
	 output logic 						 			cs_read_o,            // read        	 signal to   P_tile_ip
	 output logic 						 			cs_write_o,           // write      	 signal to   P_tile_ip
	 output logic 						 			cs_burstcount_o,      // burst count   signal to   P_tile_ip 
	 output logic[DATA_WIDTH/8-1:0]			cs_byteenable_o,      // byteenable    signal to   P_tile_ip 
	 output logic 					    			cs_debugaccess_o,     // debugaccess   signal to   P_tile_ip 
	 
	 input logic [ADDR_WIDTH-1:0]  			hps_address_i,        // address 		 signal from CS bridge
	 input logic [DATA_WIDTH-1:0]  			hps_writedata_i,      // writedata     signal from CS bridge
	 input logic  						 			hps_read_i,           // read    		 signal from CS bridge
	 input logic  						 			hps_write_i,          // write   		 signal from CS bridge
	 input logic  						 			hps_burstcount_i,     // burstcount    signal from CS bridge, it's size is 1 since the path is lightweight
	 input logic [DATA_WIDTH/8-1:0]			hps_byteenable_i,     // byteenable 	 signal from CS bridge
	 input logic  						 			hps_debugaccess_i,    // debugaccess 	 signal from CS bridge
	 
    output logic 						 			hps_waitrequest_o,    // waitrequest 	  signal to   CS bridge
	 output logic 					    			hps_readdatavalid_o,  // readdatavalid  signal to   CS bridge
	 output logic 						 			hps_writerespvalid_o, // writerespvalid signal to   CS bridge
	 output logic [DATA_WIDTH-1:0] 			hps_readdata_o,       // readdata       signal to   CS bridge
	 output logic [RESP_WIDTH-1:0] 			hps_resp_o,           // resp           signal to   CS bridge
	 
	 // csr interface from hps_lwh2f
	 
	 input logic [CSR_ADDR_WIDTH-1:0]  		 csr_address_i,     // address     signal from h2f_lw interface
	 input logic 							 		 csr_read_i,        // read        signal from h2f_lw interface 
	 input logic 								 	 csr_write_i,       // write       signal from h2f_lw interface 
	 input logic [CSR_DATA_WIDTH-1:0] 		 csr_writedata_i,   // writedata   signal from h2f_lw interface 
	 input logic 							 		 csr_burstcount_i,  // burstcount  signal from h2f_lw interface
	 input logic [CSR_DATA_WIDTH/8-1:0]     csr_byteenable_i,  // byeenable   signal from h2f_lw interface
	 input logic 									 csr_debugaccess_i, // debugaccess signal from h2f_lw interface
	 output logic 									 csr_readdatavalid_o,//readdatavalid signal from h2f_lw interface
	 output logic [CSR_DATA_WIDTH-1:0] 		 csr_readdata_o,    // readdata    signal from h2f_lw interface
	 output logic 									 csr_waitrequest_o,  //waitrequest signal to   h2f_lw interface 

	 // hip status sideband interface from p_tile ip
	 input logic 									hip_status_linkup,                
	 input logic 									hip_status_dl_up,
	 input logic 									hip_status_surprise_down_err,
	 input logic 									hip_status_dl_timer_update,
	 input logic [LTSSM_STATE_WIDTH-1:0]            hip_status_ltssm_state_delay,
	 input logic 									hip_status_ltssm_st_hipfifo_ovrflow
	 
	 );
	 
	 logic 						select;
	 logic 						cs_snoop_readdatavalid_o;          // readdatavalid from config_timeout module
	 logic [DATA_WIDTH-1:0] cs_snoop_readdata_o;               // readdata      from config_timeout module
	 logic [RESP_WIDTH-1:0] cs_snoop_resp_o;                   // response      from config_timeout module
	 logic 						cs_snoop_writerespvalid_o;
	 logic                  cs_snoop_readdatavalid_i;
	 logic                  cs_snoop_writerespvalid_i;
	 logic                  cs_snoop_waitrequest_i;
	 logic 						cs_snoop_read_i;
	 logic 						cs_snoop_write_i;
	 logic [ADDR_WIDTH-1:0] cs_snoop_address_i;
	 
	 // pass through logic from CS bridge to P_tile ip
	 assign hps_waitrequest_o = cs_waitrequest_i;
	 assign cs_address_o      = hps_address_i;
	 assign cs_writedata_o    = hps_writedata_i;
	 assign cs_read_o         = hps_read_i;
	 assign cs_write_o        = hps_write_i;
	 assign cs_burstcount_o   = hps_burstcount_i;
	 assign cs_byteenable_o   = hps_byteenable_i;
	 assign cs_debugaccess_o  = hps_debugaccess_i;
	 
	 configuration_timeout u0 (.clk_i(clk_i), 
	                           .rstn_i(rstn_i),
										.cs_snoop_resp_i(cs_resp_i), 
										.cs_snoop_waitrequest_i(cs_waitrequest_i), 
										.cs_snoop_readdatavalid_i(cs_readdatavalid_i),
										.cs_snoop_writerespvalid_i(cs_writerespvalid_i),
										.cs_snoop_read_i(hps_read_i),
										.cs_snoop_write_i(hps_write_i),
										.cs_snoop_address_i(hps_address_i),
										.cs_snoop_readdatavalid_o(cs_snoop_readdatavalid_o),
										.cs_snoop_readdata_o(cs_snoop_readdata_o),                             
										.cs_snoop_resp_o(cs_snoop_resp_o),
										.cs_snoop_writerespvalid_o(cs_snoop_writerespvalid_o),	
										.mux_sel(select),
										.csr_address_i(csr_address_i),
										.csr_read_i(csr_read_i),
										.csr_write_i(csr_write_i),
										.csr_writedata_i(csr_writedata_i),
										.csr_readdatavalid_o(csr_readdatavalid_o),
										.csr_readdata_o(csr_readdata_o),
										.csr_burstcount_i(csr_burstcount_i),
						            .csr_byteenable_i(csr_byteenable_i),
										.csr_debugaccess_i(csr_debugaccess_i),
										.csr_waitrequest_o(csr_waitrequest_o),
										.hip_status_linkup(hip_status_linkup),
										.hip_status_dl_up(hip_status_dl_up),
										.hip_status_surprise_down_err(hip_status_surprise_down_err),
										.hip_status_dl_timer_update          (hip_status_dl_timer_update          ),
										.hip_status_ltssm_state_delay        (hip_status_ltssm_state_delay        ),
										.hip_status_ltssm_st_hipfifo_ovrflow (hip_status_ltssm_st_hipfifo_ovrflow ));
										
	 multiplexer m0 (.clk_i(clk_i), 
	         .rstn_i(rstn_i),  
	         .cs_readdatavalid_i(cs_readdatavalid_i),
				.cs_writerespvalid_i(cs_writerespvalid_i),
				.cs_readdata_i(cs_readdata_i),                             
				.cs_resp_i(cs_resp_i), 
				.config_readdatavalid_i(cs_snoop_readdatavalid_o),
				.config_writerespvalid_i(cs_snoop_writerespvalid_o),
				.config_readdata_i(cs_snoop_readdata_o),                             
				.config_resp_i(cs_snoop_resp_o),
				.select(select),
				.hps_readdatavalid_o(hps_readdatavalid_o),
				.hps_writerespvalid_o(hps_writerespvalid_o),
				.hps_readdata_o(hps_readdata_o),
				.hps_resp_o(hps_resp_o)
	 );									
										
endmodule								
										
