# ######################################################################## 
# Copyright (C) 2025 Altera Corporation.
# SPDX-License-Identifier: MIT
# ######################################################################## 

`timescale 1ps/1ps
module f2h_tester_tb ();

localparam SUP_NUM_AGT = 2;   
localparam REG_DATA_W  = 32;  
localparam DATA_W      = 512; 
localparam REG_ADDR_W  = 14;  
localparam ADDR_W  = 64;      
localparam T = 10;


reg                          csr_write;
reg                          csr_read;
reg [REG_ADDR_W-1:0]         csr_address;
reg [REG_DATA_W-1:0]         csr_writedata;
wire                         csr_readdatavalid;
wire [REG_DATA_W-1:0]        csr_readdata; 
wire                         csr_waitrequest;
wire                         f2h_write;
wire                         f2h_read;
wire [REG_ADDR_W-1:0]        f2h_address;
wire [DATA_W/8-1:0]          f2h_byteenable;
wire [DATA_W-1:0]            f2h_writedata;
reg                          f2h_readdatavalid;
reg [DATA_W-1:0]             f2h_readdata;
reg                          f2h_waitrequest;
reg clk_i;
reg rst_i;
reg start_delay;

initial clk_i = 0;
always #(T/2) clk_i = ~clk_i;

f2h_interface_tester dut_f2h_tester(

  .clk                    (clk_i), // Keep it in lower clock domain near to HPS
  .rst_n                  (rst_i), // active low reset

  .csr_avmm_write         (csr_write),
  .csr_avmm_read          (csr_read),
  .csr_avmm_address       (csr_address),
  .csr_avmm_writedata     (csr_writedata),
  .csr_avmm_readdatavalid (csr_readdatavalid),
  .csr_avmm_readdata      (csr_readdata), 
  .csr_avmm_waitrequest   (csr_waitrequest),

  .f2h_avmm_write         (f2h_write),     
  .f2h_avmm_read          (f2h_read),      
  .f2h_avmm_address       (f2h_address),  
  .f2h_avmm_byteenable    (f2h_byteenable), 
  .f2h_avmm_writedata     (f2h_writedata), 
  .f2h_avmm_readdatavalid (f2h_readdatavalid),
  .f2h_avmm_readdata      (f2h_readdata),    
  .f2h_avmm_waitrequest   (f2h_waitrequest)

); 

initial
    begin
        // *** Initial value ***
        csr_write = 0;
        csr_read = 0;
        csr_address = 0;
        csr_writedata = 0;
        f2h_readdata = {DATA_W/8{8'hA0}};
        f2h_readdatavalid = 0;
        f2h_waitrequest = 1;
        
        // *** Reset ***
        rst_i = 0;
        #(T*5);
        rst_i = 1;
        #(T*5);
    
        csr_avmm_write(5'h08, 32'hDEAF_DEAD);   
        csr_avmm_write(5'h04, 32'hFFFF_0C64);   
        csr_avmm_write(5'h00, 32'h0000_0001); // First write with above data 
        #(T*10);
        f2h_waitrequest = 0;
        #(T*2);
        f2h_waitrequest = 1;
        #(T*2); 
        csr_avmm_write(5'h04, 32'hFFFF_0666);   
        csr_avmm_write(5'h00, 32'h0000_0002); // First read with above data    
        #(T*10);
        f2h_waitrequest = 0;
        #(T*4);
        f2h_readdatavalid = 1;
        f2h_waitrequest = 1;
        #(T); 
        f2h_readdatavalid = 0;

        csr_avmm_write(5'h08, 32'hACAC_0505);   
        csr_avmm_write(5'h04, 32'hFFFF_0AB0);   
        csr_avmm_write(5'h00, 32'h0000_0001); // 2nd write with above data 
        #(T*10);
        f2h_waitrequest = 0;
        #(T*2);
        f2h_waitrequest = 1;
        #(T*2); 
        csr_avmm_write(5'h04, 32'hFFFF_0C40);   
        csr_avmm_write(5'h00, 32'h0000_0002); // 2nd read with above data    
        #(T*10);
        f2h_waitrequest = 0;
        #(T*4);
        f2h_readdatavalid = 1;
        f2h_waitrequest = 1;
        #(T); 
        f2h_readdatavalid = 0;

        csr_avmm_write(5'h08, 32'hABAB_ABAB);   
        csr_avmm_write(5'h04, 32'hFFFF_0984);   
        csr_avmm_write(5'h00, 32'h0000_0001); // 2nd write with above data 
        #(T*10);
        f2h_waitrequest = 0;
        #(T*2);
        f2h_waitrequest = 1;
        #(T*2); 
        f2h_readdata = {'b0, 32'hDEAD_DEAD, 32'hCDCD_0505, 32'hABAB_ABAB};
        csr_avmm_write(5'h04, 32'hFFFF_0984);   
        csr_avmm_write(5'h00, 32'h0000_0002); // 2nd read with above data    
        #(T*10);
        f2h_waitrequest = 0;
        #(T*4);
        f2h_readdatavalid = 1;
        f2h_waitrequest = 1;
        #(T); 
        f2h_readdatavalid = 0;
    end

  task csr_avmm_write;
        input [31:0] waddr;
        input [31:0] wdata; 
        begin
            // *** Write address ***
            csr_address = waddr;
            // *** Write data ***
            csr_writedata = wdata;
            csr_write     = 1;
            wait (~csr_waitrequest);
            #(T*2);
            csr_write = 0;
            #T;
        end
    endtask
    
    task csr_avmm_read;
        input [31:0] raddr;
        begin
            // *** Read address ***
            csr_address = raddr;
            csr_read = 1;
            wait (~csr_waitrequest);
            #(T*2);
            csr_read = 0;
            #T;
        end
    endtask

endmodule 
