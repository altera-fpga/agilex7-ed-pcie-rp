// (C) 2001-2022 Intel Corporation. All rights reserved.
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


//------------------------------------------------------------------------
// Project              : PCIe RP
// Module               : f2h_interface_tester.sv
// Description          :  This module is used for testing the F2H path till SDRAM memory,
// through the LW H2F path from any SW stack. It includes set of registers to generate 
// control signals to FSM that generates F2H AVMM resquests. One outstanding request at any
// given point of time. It Aligns the address & data as per F2H data width
// Author               : Vasu Devunuri
// Created              : 16-Dec-2022
// Changes              :
//
//----------------------------------------------------------------------



// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module f2h_interface_tester #(
parameter CSR_ADDR_WIDTH = 14,
parameter CSR_DATA_WIDTH = 32,
parameter F2H_ADDR_WIDTH = 64,
parameter F2H_DATA_WIDTH = 512
)(

input  logic                      clk,   
input  logic                      rst_n, // active low reset

input  logic                       csr_avmm_write,
input  logic                       csr_avmm_read,
input  logic [CSR_ADDR_WIDTH-1:0]  csr_avmm_address,
input  logic [CSR_DATA_WIDTH-1:0]  csr_avmm_writedata,
output logic                       csr_avmm_readdatavalid,
output logic [CSR_DATA_WIDTH-1:0]  csr_avmm_readdata, 
output logic                       csr_avmm_waitrequest,

output logic                         f2h_avmm_write,
output logic                         f2h_avmm_read,
output logic [F2H_ADDR_WIDTH-1:0]    f2h_avmm_address,
output logic [F2H_DATA_WIDTH/8-1:0]  f2h_avmm_byteenable,
output logic [F2H_DATA_WIDTH-1:0]    f2h_avmm_writedata,
input  logic                         f2h_avmm_readdatavalid,
input  logic [F2H_DATA_WIDTH-1:0]    f2h_avmm_readdata, 
input  logic                         f2h_avmm_waitrequest

); 

localparam IDLE      = 3'b000,  // waiting for any transaction request from CSR 
           WRITE     = 3'b001,  // initiate a write 
           READ      = 3'b010,  // initiate a read
           READ_WAIT = 3'b011;  // waiting for the read data for read request initiated 

localparam NUM_BYTES = F2H_DATA_WIDTH >> 3;
localparam NUM_BYTES_BITS = $clog2(NUM_BYTES);
localparam NUM_SEG   = F2H_DATA_WIDTH / CSR_DATA_WIDTH; 
localparam SEG_WIDTH = $clog2(NUM_SEG); 

logic                         f2h_read;          
logic                         f2h_write;
logic [CSR_DATA_WIDTH-1:0]    f2h_address;
logic [CSR_DATA_WIDTH-1:0]    f2h_write_data;
logic [CSR_DATA_WIDTH-1:0]    f2h_read_data;
logic                         f2h_read_data_valid;
logic [31:0]                  f2h_read_latency;

// CSR
csr_registers #(
  .ADDR_WIDTH (CSR_ADDR_WIDTH),
  .DATA_WIDTH (CSR_DATA_WIDTH)
) f2h_test_csr (

  .clk               (clk),
  .rstn              (rst_n),
                    
  .read              (f2h_read),             
  .write             (f2h_write),
  .address           (f2h_address),
  .write_data        (f2h_write_data),
  .read_data         (f2h_read_data),
  .read_data_valid   (f2h_read_data_valid),
  .read_latency      (f2h_read_latency),
                    
  .csr_address       (csr_avmm_address),      
  .csr_read          (csr_avmm_read),         
  .csr_write         (csr_avmm_write),        
  .csr_writedata     (csr_avmm_writedata),    
  .csr_readdatavalid (csr_avmm_readdatavalid),
  .csr_readdata      (csr_avmm_readdata),     
  .csr_waitrequest   (csr_avmm_waitrequest)  

 );

// Address alignment w.r.t. F2H bus width
// F2H avmm address = f2h_address mod NUM_BYTES
logic [F2H_ADDR_WIDTH-1:0]    f2h_align_address;
logic [F2H_DATA_WIDTH-1:0]    f2h_align_writedata;
logic [F2H_DATA_WIDTH/8-1:0]  f2h_align_byteenable;
logic [NUM_BYTES_BITS-1:0]    f2h_address_offset;
logic [CSR_DATA_WIDTH-1:0]    read_data_32b;
logic [F2H_DATA_WIDTH-1:0]    byte_enable_offset; // Change size
logic                         read_prog_flag;

// f2h_address_offset is used for calculating aligned address as well as selector 
// of 32-bit data from the read response data
assign f2h_address_offset = f2h_address[NUM_BYTES_BITS-1 : 0]; 

always @ (posedge clk)
  if (~rst_n)
   f2h_align_address <= 0;
  else if (f2h_read | f2h_write)
   f2h_align_address <= f2h_address - f2h_address_offset; // In Bytes

// store the offset value till the read data comes back
always @ (posedge clk)
  if (~rst_n) begin
    byte_enable_offset <= 0;
  end else if (f2h_read | f2h_write) begin
    byte_enable_offset <= f2h_address_offset << 3; // Bits on 
  end else if (f2h_avmm_readdatavalid) begin
    byte_enable_offset <= 0;
  end

always @ (posedge clk)
  if (~rst_n) begin
    read_prog_flag     <= 1'b0;
  end else if (f2h_avmm_read & ~f2h_avmm_waitrequest) begin //~f2h_avmm_waitrequest
    read_prog_flag     <= 1'b1;
  end else if (f2h_avmm_readdatavalid) begin
    read_prog_flag     <= 1'b0;
  end

assign read_data_32b = f2h_avmm_readdata >> byte_enable_offset;
assign f2h_align_writedata  = f2h_write_data << byte_enable_offset;
assign f2h_align_byteenable = {CSR_DATA_WIDTH/8{1'b1}} << (byte_enable_offset>>3);
 
always @ (posedge clk)
  if (~rst_n) begin
    f2h_read_data        <= 0;
    f2h_read_data_valid  <= 0;
  end else if (f2h_avmm_readdatavalid) begin
   f2h_read_data       <= read_data_32b;  
   f2h_read_data_valid <= 1'b1;
  end else begin
   f2h_read_data_valid <= 1'b0;
  end

// FSM 
logic [2:0] current_state;
logic [2:0] next_state;

always @ (posedge clk) begin
  if (~rst_n)
   current_state <= IDLE;
  else
   current_state <= next_state;
end

always @ (*) begin
   //next_state = 'bx; // default 
   case (current_state)
     IDLE : begin
            if (f2h_read)
              next_state = READ;
            else if (f2h_write)
              next_state = WRITE;
            else
              next_state = IDLE;
            end 
     WRITE : begin
              if (~f2h_avmm_waitrequest) // ~f2h_avmm_waitrequest
                next_state = IDLE;
              else 
                next_state = WRITE;
             end
     READ : begin
             if (~f2h_avmm_waitrequest) //~f2h_avmm_waitrequest
               next_state = READ_WAIT;
             else
               next_state = READ;
            end
     READ_WAIT : begin
                 if (f2h_read_data_valid)
                   next_state = IDLE;
                 else 
                   next_state = READ_WAIT;
                  end 
    default: begin
             next_state = IDLE;
             end
 endcase
end

//always @ (posedge clk) begin
always @ (*) begin
  f2h_avmm_read        = 1'b0; 
  f2h_avmm_write       = 1'b0;
  f2h_avmm_address     = 'b0;
  f2h_avmm_byteenable  = 'b0;
  f2h_avmm_writedata   = 'b0; 
  case (current_state)
     IDLE : begin
            f2h_avmm_read        = 0; 
            f2h_avmm_write       = 0;
            end
     WRITE : begin
            f2h_avmm_read        = 1'b0; 
            f2h_avmm_write       = 1'b1;
            f2h_avmm_address     = f2h_align_address;
            f2h_avmm_byteenable  = f2h_align_byteenable;
            f2h_avmm_writedata   = f2h_align_writedata; 
             end
     READ : begin
            f2h_avmm_read        = 1'b1; 
            f2h_avmm_write       = 1'b0;
            f2h_avmm_address     = f2h_align_address;
            end
     READ_WAIT : begin
            f2h_avmm_read        = 1'b0; 
            f2h_avmm_write       = 1'b0;
            end
    
   endcase
end

// Calculate the latency numbers for read requests
// This will help in knowing the latency numbers for different
// F2H configurations like CCU or bypass CCU in SDRAM datapath

logic [31:0] lat_counter;
logic        tc_lat_counter;
  
always @ (posedge clk)
  if (~rst_n | tc_lat_counter | f2h_read_data_valid)
    lat_counter <= 0;
  else if (read_prog_flag)
    lat_counter <= lat_counter + 1'b1;

assign tc_lat_counter   = (lat_counter == {32{1'b1}});  
assign f2h_read_latency = lat_counter;

endmodule
