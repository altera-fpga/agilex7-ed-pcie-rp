//# ######################################################################## 
//# Copyright (C) 2025 Altera Corporation.
//# SPDX-License-Identifier: MIT
//# ########################################################################
 
//----------------------------------------------------------------
// Project Name: R_tile_rp
// Module Name : address_remapper.sv
// Author :  
`timescale 1 ns / 1 ps

module address_remapper #(
//parameter PF_REGISTER ='h20000FFF,
//parameter PCIE_CONFIG ='h20010000,
parameter IN_ADDR_WIDTH = 21,
parameter IN_DATA_WIDTH = 32,
parameter OUT_ADDR_WIDTH = 32,
parameter OUT_DATA_WIDTH = 32,
parameter RESP_WIDTH     = 2
)(

input  logic                      clk,   
input  logic                      rst_n, 
 
//---------------------------------------------------------------------------------
//                             Signals from hps
//---------------------------------------------------------------------------------
input logic  						 	hps_burstcount_i,     // burstcount      signal from hps
input logic [IN_DATA_WIDTH-1:0]  	    hps_writedata_i,      // writedata       signal from hps	 
input logic [IN_ADDR_WIDTH-1:0]  	    hps_address_i,        // address 		 signal from hps
input logic  						 	hps_write_i,          // write   		 signal from hps
input logic  						 	hps_read_i,           // read    		 signal from hps
input logic [IN_DATA_WIDTH/8-1:0]	    hps_byteenable_i,     // byteenable 	 signal from hps
input logic  						 	hps_debugaccess_i,    // debugaccess 	 signal from hps

output logic 						    hps_waitrequest_o,    // waitrequest 	 signal to R_tile_ip
output logic [IN_DATA_WIDTH-1:0] 		hps_readdata_o,       // readdata        signal to R_tile_ip
output logic 					    	hps_readdatavalid_o,  // readdatavalid   signal to R_tile_ip
output logic 					    	hps_writerespvalid_o, // readdatavalid   signal to R_tile_ip
output logic [RESP_WIDTH-1:0] 			hps_resp_o,  


//---------------------------------------------------------------------------------
//                             Signals to mcdma R-tile_ip
//---------------------------------------------------------------------------------
input logic  						 	mcdma_waitrequest_i,     // waitrequest 	signal from R_tile_ip
input logic  						 	mcdma_readdatavalid_i,   // readdatavalid   signal from R_tile_ip
input logic  						 	mcdma_writerespvalid_i,  // writerespvalid  signal from R_tile_ip
input logic [OUT_DATA_WIDTH-1:0]  		mcdma_readdata_i,        // readdata 		signal from R_tile_ip                    
input logic [RESP_WIDTH-1:0]  			mcdma_resp_i,            // response 		signal from R_tile_ip

output logic[OUT_ADDR_WIDTH-1:0]  		mcdma_address_o,         // address 		signal to   R_tile_ip
output logic[OUT_DATA_WIDTH-1:0]  		mcdma_writedata_o,       // writedata  	    signal to   R_tile_ip
output logic 						 	mcdma_read_o,            // read        	signal to   R_tile_ip
output logic 						 	mcdma_write_o,           // write      	    signal to   R_tile_ip
output logic 						 	mcdma_burstcount_o,      // burst count     signal to   R_tile_ip 
output logic[OUT_DATA_WIDTH/8-1:0]		mcdma_byteenable_o,      // byteenable      signal to   R_tile_ip 
output logic 					    	mcdma_debugaccess_o     // debugaccess     signal to   R_tile_ip 
	 
); 
	
assign hps_waitrequest_o    = mcdma_waitrequest_i;
assign hps_readdata_o       = mcdma_readdata_i;
assign hps_readdatavalid_o  = mcdma_readdatavalid_i;	
assign hps_writerespvalid_o = mcdma_writerespvalid_i;
assign hps_resp_o           = mcdma_resp_i;
// For R-tile usrhip_address was 32-bit, Where from hps we don't have memory to access all 32-bit,
// so considering only 21-bits,remaining padding with zero's
	
assign mcdma_address_o       = {11'd0,hps_address_i[20:0]};
assign mcdma_writedata_o     = hps_writedata_i;
assign mcdma_read_o          = hps_read_i;
assign mcdma_write_o         = hps_write_i;
assign mcdma_burstcount_o    = hps_burstcount_i;
assign mcdma_byteenable_o    = hps_byteenable_i;
assign mcdma_debugaccess_o   = hps_debugaccess_i;

endmodule


















