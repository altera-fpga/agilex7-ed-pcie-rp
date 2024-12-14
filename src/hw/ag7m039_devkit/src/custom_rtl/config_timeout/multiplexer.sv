//----------------------------------------------------------------
// Project Name: P_tile_rp
// Module Name : mux.v
// Author : anilatho 
// Description : A multiplexer with select pin coming from configuration_timeout.v. Also In0 is from CS and IN1 from configuration_timeout.
//----------------------------------------------------------------
 

`timescale 1 ns / 1 ps

module multiplexer # (
    parameter ADDR_WIDTH         = 14,
    parameter DATA_WIDTH         = 32,
	 parameter RESP_WIDTH         = 2	 
    ) 
    (
    input   clk_i,
    input   rstn_i,
 
    //snoop interface
	 
	 input  logic cs_readdatavalid_i,
	 input  logic cs_writerespvalid_i,
    input  logic [DATA_WIDTH-1:0] cs_readdata_i,                             
	 input  logic [RESP_WIDTH-1:0] cs_resp_i,
		 
	 //Configuration timeout interface 
	 input  logic config_readdatavalid_i,
	 input  logic config_writerespvalid_i,
    input  logic [DATA_WIDTH-1:0] config_readdata_i,                             
	 input  logic [RESP_WIDTH-1:0] config_resp_i,
	 input  logic select,
	 
	 output logic hps_readdatavalid_o,
	 output logic hps_writerespvalid_o,
	 output logic [DATA_WIDTH-1:0]hps_readdata_o,
	 output logic [RESP_WIDTH-1:0]hps_resp_o
);
	 
	 always@(posedge clk_i) begin
		if (~rstn_i) begin
		 hps_readdatavalid_o  <= 0;
		 hps_writerespvalid_o <= 0;
		 hps_readdata_o       <= '0;
		 hps_resp_o           <= '0;
		end else if(~select) begin
		 hps_readdatavalid_o  <= cs_readdatavalid_i;
		 hps_writerespvalid_o <= cs_writerespvalid_i;
		 hps_readdata_o       <= cs_readdata_i;
		 hps_resp_o           <= cs_resp_i;     // drive 0 if hps results in data abort exception
		end else if(select) begin
		 hps_readdatavalid_o  <= config_readdatavalid_i;
		 hps_writerespvalid_o <= config_writerespvalid_i;
		 hps_readdata_o       <= config_readdata_i;
		 hps_resp_o           <= config_resp_i; // drive 0 if hps results in data abort exception
		end else begin
		 hps_readdatavalid_o  <= 0;
		 hps_writerespvalid_o <= 0;
		 hps_readdata_o       <= '0;
		 hps_resp_o           <= '0;
		end end
		
	endmodule
		 
		 
	  
	 
	 
	 
