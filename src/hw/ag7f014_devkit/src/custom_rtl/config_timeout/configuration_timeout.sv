//# ######################################################################## 
//# Copyright (C) 2025 Altera Corporation.
//# SPDX-License-Identifier: MIT
//# ########################################################################
//----------------------------------------------------------------
// Project Name: P_tile_rp
// Module Name : configuration_timeout.v
// Author : 
// Description : When the response is not received for Config requests which are non-Posted by default,
// there should be some timer counters to terminate the ongoing transaction and assert a response or 
// create an interrupt to inform HPS
//----------------------------------------------------------------
 
`timescale 1 ns / 1 ps

module configuration_timeout # (
    parameter ADDR_WIDTH         = 14,
    parameter DATA_WIDTH         = 32,
	 parameter RESP_WIDTH         = 2,
    parameter SLAVE_ERROR        = 2'b10, // Error from an endpoint slave. Indicates an unsuccessful transaction.
	 parameter REG_WIDTH          = 32,
	 parameter CSR_ADDR_WIDTH     = 8,
    parameter CSR_DATA_WIDTH     = 32,
	 parameter LTSSM_STATE_WIDTH  = 6
	) 
    (
    input logic 						clk_i,
    input logic 						rstn_i,
 
    //snoop interface
    input logic 						cs_snoop_waitrequest_i,    //  waitrequest signal from cs interface snooped by this logic
	 input logic 						cs_snoop_readdatavalid_i,  //  readdatavalid signal from cs interface snooped by this logic
	 input logic 						cs_snoop_writerespvalid_i, //  writerespvalid signal from cs interface snooped by this logic
	 input logic 					   cs_snoop_read_i,           //  read signal towards cs interface snooped by this logic
	 input logic 						cs_snoop_write_i,          //  write signal towards cs interface snooped by this logic
	 input logic [ADDR_WIDTH-1:0] cs_snoop_address_i,        //  address signal towards cs interface snooped by this logic
	 input logic [RESP_WIDTH-1:0] cs_snoop_resp_i,           //  resp signal from cs interface snooped by this logic
	 
	 output logic 						cs_snoop_readdatavalid_o,  // readdatavalid signal from this logic to MUX logic
    output logic [DATA_WIDTH-1:0]cs_snoop_readdata_o,       // readdata signal from this logic to MUX logic                           
	 output logic [RESP_WIDTH-1:0]cs_snoop_resp_o,           // resp signal from this logic to MUX logic
	 output logic 						cs_snoop_writerespvalid_o, // writerespvalid signal from this logic to MUX logic
	 output logic 						mux_sel,                   // mux_sel signal from this logic to MUX logic
	 
	 //csr interface
	 input  logic [CSR_ADDR_WIDTH-1:0]  csr_address_i,  		//  address signal from h2f_lw interface
	 input  logic 							   csr_read_i,          //  read signal from h2f_lw interface 
	 input  logic							   csr_write_i,         //  write signal from h2f_lw interface 
	 input  logic [CSR_DATA_WIDTH-1:0]  csr_writedata_i,		//  writedata signal from h2f_lw interface 
	 input  logic 							   csr_burstcount_i,    //  burstcount signal towards h2f_lw interface
	 input  logic [CSR_DATA_WIDTH/8-1:0]csr_byteenable_i,    //  byeenable signal towards h2f_lw interface
	 input  logic 								csr_debugaccess_i,   //  debugaccess signal towards h2f_lw interface
	 output logic 								csr_readdatavalid_o, //  readdatavalid signal towards h2f_lw interface
	 output logic [CSR_DATA_WIDTH-1:0] 	csr_readdata_o, 		//  readdata signal towards h2f_lw interface
	 output logic 								csr_waitrequest_o,   //  waitrequest signal from h2f_lw interface 

	 
	 input logic 								hip_status_linkup,   //  hip_status_sideband signals from P_tile ip
	 input logic 								hip_status_dl_up,
	 input logic 								hip_status_surprise_down_err,
	 input logic [LTSSM_STATE_WIDTH-1:0]hip_status_ltssm_state
    );
	 
	  logic [REG_WIDTH-1:0] timeout_reg;
	  logic                 mode_enable;     // signal to enable mode under non reset cdn. 
                                            // If this signal is absent, mode will be in read state under reset cdn.	 
														  
	  
	  logic [REG_WIDTH-1:0] count;           // count has a maximum value of 50,00,000.So 23 bits are needed.Signal will 
                                            // increments upto TIME_OUT until response didn't come
	  logic req_pending_flag;                // asserts whenever read or write request comes and deasserts when it's response comes. 
	  logic mode_wr_not_read;                // signal which indicates read/write operation
	  logic count_equal_tc;                  // signal loads 1 when count reaches timeout
	  logic timeout;
	  
	 assign count_equal_tc   = (count==timeout_reg)?1:0;	
// This block determines read or write mode	

	  always@(posedge clk_i) begin  
		if (~rstn_i) begin
	         mode_wr_not_read             <= 0; //In reset cdn, mode should not be in read or write mode
				mode_enable                  <= 0; // A variable called mode_enable will be 0 in reset cdn, and will be 1 in non reset cdn.
      end else if (cs_snoop_read_i && ~cs_snoop_waitrequest_i) begin
		      mode_wr_not_read             <= 0;
				mode_enable                  <= 1;
	   end else if (cs_snoop_write_i && ~cs_snoop_waitrequest_i) begin   // check addrtess is needed in cdn
		      mode_wr_not_read             <= 1;
				mode_enable                  <= 1;
	   end end
		
// This block asserts a req_pending_flag whenever read or write request comes 
// and deasserts when it's response comes.

	 always@(posedge clk_i) begin  
		if (~rstn_i)
				req_pending_flag              <= 0; 
	   else if((cs_snoop_read_i || cs_snoop_write_i) && ~cs_snoop_address_i[13])
		      req_pending_flag              <= 1;
	   else if(cs_snoop_readdatavalid_i || cs_snoop_writerespvalid_i)
		      req_pending_flag              <= 0;
	   else if(count_equal_tc)
		      req_pending_flag              <= 0;
	 end
	 
// This block increments a counter when req_pending_flag signal is high and 
// will reset to zero when read or write response comes. 
 
	 always@(posedge clk_i) begin
		if (~rstn_i) begin
		      count             <= 'b0;     
		end else if(count_equal_tc) begin
		      count             <= 'b0;
      end else if(cs_snoop_readdatavalid_i || cs_snoop_writerespvalid_i)begin
		      count             <= 'b0;
		end else if(req_pending_flag && ~(cs_snoop_read_i || cs_snoop_write_i))begin 
		      count             <= count+1;
		end else begin
		      count             <= 'b0;
	 end end
	 
// This block gives out read signals and write signals based on mode.
 
	 always@(posedge clk_i) begin
		if (~rstn_i) begin
            cs_snoop_readdata_o        <= {DATA_WIDTH{1'b0}};
            cs_snoop_resp_o            <= 2'b00;
            cs_snoop_readdatavalid_o   <= 0;
				cs_snoop_writerespvalid_o  <= 0;
				timeout                    <= 0;
				mux_sel                    <= 0; 
		end else if (count_equal_tc & ~mode_wr_not_read & mode_enable ) begin // When response of read didn't happen 
		      cs_snoop_readdata_o        <= {DATA_WIDTH{1'b0}};
		      cs_snoop_resp_o            <= 2'b00; 
            cs_snoop_readdatavalid_o   <= 1;  
				timeout                    <= 1;
	         mux_sel                    <= 1;	
      end else if (count_equal_tc & mode_wr_not_read & mode_enable ) begin // When response of write didn't happen 
		      cs_snoop_resp_o            <= 2'b00;
            cs_snoop_readdatavalid_o   <= 0;   
            cs_snoop_writerespvalid_o  <= 1;	
				timeout                    <= 1;        // timeout will be set if timeout happens. Used to set error status reg value
				mux_sel                    <= 1;
	   end else begin // response of read or write came 
		      cs_snoop_readdata_o        <= {DATA_WIDTH{1'b0}};
            cs_snoop_resp_o            <= 2'b00;
            cs_snoop_readdatavalid_o   <= 0;
				cs_snoop_writerespvalid_o  <= 0;
				timeout                    <= 0;
       		mux_sel                    <= 0; 
		end end
		
 csr_register csr (.clk_i(clk_i),
                   .rstn_i(rstn_i),
                   .hip_status_linkup(hip_status_linkup),
                   .hip_status_dl_up (hip_status_dl_up),
						 .hip_status_surprise_down_err(hip_status_surprise_down_err),
						 .hip_status_ltssm_state(hip_status_ltssm_state),
						 .csr_address_i(csr_address_i),
						 .csr_read_i(csr_read_i),
						 .csr_write_i(csr_write_i),
						 .csr_writedata_i(csr_writedata_i),
						 .csr_readdatavalid_o(csr_readdatavalid_o),
						 .csr_readdata_o(csr_readdata_o),
						 .csr_burstcount_i(csr_burstcount_i),
						 .csr_byteenable_i(csr_byteenable_i),
						 .csr_waitrequest_o(csr_waitrequest_o),
				       .csr_debugaccess_i(csr_debugaccess_i),
						 .timeout_reg(timeout_reg),
						 .timeout(timeout),
						 .cs_snoop_resp_i(cs_snoop_resp_i));
endmodule
