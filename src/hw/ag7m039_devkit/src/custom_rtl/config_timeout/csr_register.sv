//# ######################################################################## 
//# Copyright (C) 2025 Altera Corporation.
//# SPDX-License-Identifier: MIT
//# ######################################################################## 
//----------------------------------------------------------------
// Project Name: P_tile_rp
// Module Name : csr_register.sv
// Author :  
// Description : This block has the csr registers such as HIP_status, Timeout, clock frequency and soft reset. 
//               HIP status registers are getting value from P tile ip.
//----------------------------------------------------------------
`timescale 1 ns / 1 ps

module csr_register #(
    parameter CSR_ADDR_WIDTH         = 8,
    parameter CSR_DATA_WIDTH         = 32,
	 parameter RESP_WIDTH             = 2,
	 parameter REG_WIDTH              = 32,
	 parameter LTSSM_STATE_WIDTH      = 6)
	(
	 input logic 								clk_i,
    input logic 								rstn_i,
	 //  hip_status_sideband signals from P_tile ip
    input logic 							   hip_status_linkup,  
	input logic 							   hip_status_dl_up,
	input logic 							   hip_status_surprise_down_err,
	input logic 							   hip_status_dl_timer_update,
	input logic [LTSSM_STATE_WIDTH-1:0]        hip_status_ltssm_state_delay,
	input logic 							   hip_status_ltssm_st_hipfifo_ovrflow,
	
	 input logic                        timeout,                 //  timeout will be set if timeout happens. Used to set error status reg value[1]
    input logic [RESP_WIDTH-1:0]       cs_snoop_resp_i,         //  resp signal from p tile ip to set error status reg value[0]
	 //output logic                       irq_out,                 // Interrupt: generate when errors occured 
	 
	 input  logic [CSR_ADDR_WIDTH-1:0] 	csr_address_i,           //  address signal from h2f_lw interface
	 input  logic 								csr_read_i,              //  read signal from h2f_lw interface 
	 input  logic								csr_write_i,             //  write signal from h2f_lw interface 
	 input  logic [CSR_DATA_WIDTH-1:0]  csr_writedata_i,         //  writedata signal from h2f_lw interface 
	 input  logic 								csr_burstcount_i,        //  burstcount signal towards h2f_lw interface
	 input  logic [CSR_DATA_WIDTH/8-1:0]csr_byteenable_i,        //  byeenable signal towards h2f_lw interface
	 input  logic 								csr_debugaccess_i,       //  debugaccess signal towards h2f_lw interface
	 output logic 								csr_readdatavalid_o,     //  readdatavalid signal towards h2f_lw interface
	 output logic [CSR_DATA_WIDTH-1:0]	csr_readdata_o,          //  readdata signal towards h2f_lw interface
	 output logic 								csr_waitrequest_o,       //  waitrequest signal from h2f_lw interface  
	 output logic [REG_WIDTH-1:0]		   timeout_reg              // register to store timeout
	 );
	 
    localparam	HIP_STATUS  = 5'b00000; //00
    localparam	TIMEOUT_REG = 5'b00100; //04                   
	 localparam CLOCK_FREQ  = 5'b01000; //08
	 localparam SOFT_RESET  = 5'b01100; //0c  
	 localparam ERROR_STAT  = 5'b10000; //10 

    // default parameters 	 
	 localparam	TIMEOUT_DEFAULT  = 32'h4c4b40;              // based on clock 500MHz, number of clock cycles required 10ms/2ns=50,00,000
	 localparam CLOCK_FRQ_DEFAULT= 32'h7a120; 
	 localparam SOFT_RST_DEFAULT = 32'h0;
	 localparam ERROR_STAT_DEFAULT = 32'h0;
	 
	 logic[REG_WIDTH-1:0] hip_status_reg;                   // register to store hip_status
	 logic[REG_WIDTH-1:0] clock_freq_reg;                   // register to store clock frequency
	 logic[REG_WIDTH-1:0] soft_reset_reg;                   // register to store soft reset
	 logic[REG_WIDTH-1:0] error_status_reg;                 // register to store error
	 logic rddly, wrdly;                                    // register to store read and write
	 logic wredge,rdedge;                                   // edge detector of write and read signal
	 logic non_zero_resp;                                   // will be set if cs_snoop_resp_i /=0
	 
always@(posedge clk_i) begin
  if(~rstn_i) begin 
	 wrdly <= 1'b0; 
	 rddly <= 1'b0; 
  end else begin 
	 wrdly <= csr_write_i; 
	 rddly <= csr_read_i; 
end end

assign wredge = csr_write_i& ~wrdly;
assign rdedge = csr_read_i & ~rddly;
assign csr_waitrequest_o = (wredge|rdedge);                      // Whenver edge detected, waitrequest will raise up.
assign non_zero_resp = cs_snoop_resp_i[0] | cs_snoop_resp_i[1];  // will be set if cs_snoop_resp_i /=0
	
// This block stores the values of hip_status, timeout_reg, clock_freq and soft_reset into registers.
assign      hip_status_reg[31:11]= '0;
assign      hip_status_reg[10]  = hip_status_ltssm_st_hipfifo_ovrflow;
assign      hip_status_reg[9:4] = hip_status_ltssm_state_delay;
assign      hip_status_reg[3]   = hip_status_dl_timer_update; 
assign		hip_status_reg[2]   = hip_status_surprise_down_err;
assign		hip_status_reg[1]   = hip_status_dl_up;
assign		hip_status_reg[0]   = hip_status_linkup;


   always @ (posedge clk_i) begin
	 if (~rstn_i) begin
		timeout_reg    <= TIMEOUT_DEFAULT;  
		clock_freq_reg <= CLOCK_FRQ_DEFAULT;     
		soft_reset_reg <= SOFT_RST_DEFAULT;
		error_status_reg <= ERROR_STAT_DEFAULT;
	 end else if (csr_write_i & csr_address_i == TIMEOUT_REG) begin
    	timeout_reg    <= csr_writedata_i;
	 end else if (csr_write_i & csr_address_i == CLOCK_FREQ) begin
    	clock_freq_reg <= csr_writedata_i;		
	 end else if (csr_write_i & csr_address_i == SOFT_RESET) begin
    	soft_reset_reg <= csr_writedata_i;	 	
	 end else if (csr_write_i & csr_address_i == ERROR_STAT) begin
    	error_status_reg <= csr_writedata_i;
	 end else if (timeout) begin
    	error_status_reg[1] <= 1;
	 end else if (non_zero_resp) begin
    	error_status_reg[0] <= 1;	
   end end

// Generate interrupt on error conditions. Enable this logic if design supports interrupt 
//assign irq_out = |error_status_reg;
	
// This block stores the values of hip_status, timeout_reg, clock_freq and soft_reset into readdata.
always @ (posedge clk_i) begin
	if (~rstn_i) begin
    csr_readdata_o      <= '0;
	 csr_readdatavalid_o <= 0;
   end else if (csr_read_i& ~csr_waitrequest_o) begin
	 csr_readdatavalid_o <= 1;
    case(csr_address_i)
	    HIP_STATUS : csr_readdata_o <= hip_status_reg;
	    TIMEOUT_REG: csr_readdata_o <= timeout_reg;
	    CLOCK_FREQ : csr_readdata_o <= clock_freq_reg;
	    SOFT_RESET : csr_readdata_o <= soft_reset_reg;
		 ERROR_STAT : csr_readdata_o <= error_status_reg;
		 default    : csr_readdata_o <= {CSR_DATA_WIDTH{1'b0}};
    endcase
	end else if (~csr_read_i) begin
	 csr_readdata_o      <= '0;
	 csr_readdatavalid_o <= 0;
end end
endmodule
