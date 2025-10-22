//# ######################################################################## 
//# Copyright (C) 2025 Altera Corporation.
//# SPDX-License-Identifier: MIT
//# ########################################################################

module msi_ordering # (
  parameter DEVICE_FAMILY = "Agilex 7"
 ,parameter ADDR_WIDTH = 5
 ,parameter DATA_WIDTH = 32
 ,parameter NUM_VECTORS = 32 // only 32 is supported.
 ,parameter MAX_OUTSTANDING_MSI = 16 // outstanding MSI requests

  // AXI-MM
 ,parameter AXIMM_AWID_WIDTH          = 1
 ,parameter AXIMM_AWADDR_WIDTH        = 36
 ,parameter AXIMM_WDATA_WIDTH         = 256
 ,parameter AXIMM_BID_WIDTH           = 1
 ,parameter AXIMM_ARID_WIDTH          = 1
 ,parameter AXIMM_ARADDR_WIDTH        = 36
 ,parameter AXIMM_RID_WIDTH           = 1
 ,parameter AXIMM_RDATA_WIDTH         = 256

) (
  input var logic clk

 ,input var logic rst

 // BAM sink interface (address unit: Words)
 ,input	var logic 	  			       igr_avmm_wr
 ,input	var logic 				       igr_avmm_rd 
 ,input	var logic [ADDR_WIDTH-1:0]     igr_avmm_addr			
 ,input	var logic [DATA_WIDTH-1:0]	   igr_avmm_wrdata
 ,input	var logic [(DATA_WIDTH/8)-1:0] igr_avmm_byteenable
 ,output var logic [DATA_WIDTH-1:0]	   igr_avmm_rddata
 ,output var logic                     igr_avmm_waitreq

 // MSI to GIC source interface (address unit: Words)
 ,output var logic 	  			        egr_avmm_wr
 ,output var logic 				        egr_avmm_rd 
 ,output var logic [ADDR_WIDTH-1:0]     egr_avmm_addr			
 ,output var logic [DATA_WIDTH-1:0]	    egr_avmm_wrdata
 ,output var logic [(DATA_WIDTH/8)-1:0] egr_avmm_byteenable
 ,output var logic              	    egr_avmm_burstcount // only burst=0x1 is supported.
 ,input var logic [DATA_WIDTH-1:0]	    egr_avmm_rddata     
 ,input var logic                       egr_avmm_rddata_vld 
 ,input var logic            	        egr_avmm_waitreq 

 // F2H source interface
 ,output var logic 	  			               f2h_avmm_wr
 ,output var logic 				               f2h_avmm_rd 
 ,output var logic [AXIMM_AWADDR_WIDTH-1:0]    f2h_avmm_addr			
 ,output var logic [AXIMM_WDATA_WIDTH-1:0]	   f2h_avmm_wrdata
 ,output var logic [(AXIMM_WDATA_WIDTH/8)-1:0] f2h_avmm_byteenable
 ,output var logic                             f2h_avmm_burstcount // only burst=0x1 is supported.
 ,input var logic [AXIMM_RDATA_WIDTH-1:0]	   f2h_avmm_rddata     // unused
 ,input var logic                              f2h_avmm_rddata_vld // unused
 ,input var logic                  	           f2h_avmm_waitreq

 // -----------------------------------------------------------------
 // AXI ID map interface

 // ingress AXI-MM Write Address Channel
 ,input  var logic [AXIMM_AWID_WIDTH-1:0]          igr_awid                            
 ,input  var logic [AXIMM_AWADDR_WIDTH-1:0]        igr_awaddr                          
 ,input  var logic [7:0]                           igr_awlen                           
 ,input  var logic [2:0]                           igr_awsize                          
 ,input  var logic [1:0]                           igr_awburst                         
 ,input  var logic [0:0]                           igr_awlock                          
 ,input  var logic [3:0]                           igr_awcache                         
 ,input  var logic [2:0]                           igr_awprot                          
 ,input  var logic                                 igr_awvalid                         
 ,output var logic                                 igr_awready

 // ingress AXI-MM Write Data Channel
 ,input  var logic [AXIMM_WDATA_WIDTH-1:0]         igr_wdata                           
 ,input  var logic [(AXIMM_WDATA_WIDTH/8)-1:0]     igr_wstrb                           
 ,input  var logic                                 igr_wlast                           
 ,input  var logic                                 igr_wvalid                          
 ,output var logic                                 igr_wready 

 // ingress AXI-MM Write Response Channel
 ,output var logic [AXIMM_BID_WIDTH-1:0]           igr_bid                             
 ,output var logic [1:0]                           igr_bresp                           
 ,output var logic                                 igr_bvalid                          
 ,input  var logic                                 igr_bready       

 // ingress AXI-MM Read Address Channel 
 ,input  var logic [AXIMM_ARID_WIDTH-1:0]          igr_arid                            
 ,input  var logic [AXIMM_ARADDR_WIDTH-1:0]        igr_araddr                          
 ,input  var logic [7:0]                           igr_arlen                           
 ,input  var logic [2:0]                           igr_arsize                          
 ,input  var logic [1:0]                           igr_arburst                         
 ,input  var logic [0:0]                           igr_arlock                          
 ,input  var logic [3:0]                           igr_arcache                         
 ,input  var logic [2:0]                           igr_arprot                          
 ,input  var logic                                 igr_arvalid                         
 ,output var logic                                 igr_arready

 // ingress AXI-MM Read Data Channel       
 ,output var logic [AXIMM_RID_WIDTH-1:0]           igr_rid                             
 ,output var logic [AXIMM_RDATA_WIDTH-1:0]         igr_rdata                           
 ,output var logic [1:0]                           igr_rresp                           
 ,output var logic                                 igr_rlast                           
 ,output var logic                                 igr_rvalid                          
 ,input  var logic                                 igr_rready                          

 // egress AXI-MM Write Address Channel
 ,output var logic [AXIMM_AWID_WIDTH-1:0]          egr_awid                            
 ,output var logic [AXIMM_AWADDR_WIDTH-1:0]        egr_awaddr                          
 ,output var logic [7:0]                           egr_awlen                           
 ,output var logic [2:0]                           egr_awsize                          
 ,output var logic [1:0]                           egr_awburst                         
 ,output var logic [0:0]                           egr_awlock                          
 ,output var logic [3:0]                           egr_awcache                         
 ,output var logic [2:0]                           egr_awprot                          
 ,output var logic                                 egr_awvalid                         
 ,input  var logic                                 egr_awready 

 // egress AXI-MM Write Data Channel                        
 ,output var logic [AXIMM_WDATA_WIDTH-1:0]         egr_wdata                           
 ,output var logic [(AXIMM_WDATA_WIDTH/8)-1:0]     egr_wstrb                           
 ,output var logic                                 egr_wlast                           
 ,output var logic                                 egr_wvalid                          
 ,input  var logic                                 egr_wready           

 // egress AXI-MM Write Response Channel               
 ,input  var logic [AXIMM_BID_WIDTH-1:0]           egr_bid                             
 ,input  var logic [1:0]                           egr_bresp                           
 ,input  var logic                                 egr_bvalid                          
 ,output var logic                                 egr_bready            

 // egress AXI-MM Read Address Channel               
 ,output var logic [AXIMM_ARID_WIDTH-1:0]          egr_arid                            
 ,output var logic [AXIMM_ARADDR_WIDTH-1:0]        egr_araddr                          
 ,output var logic [7:0]                           egr_arlen                           
 ,output var logic [2:0]                           egr_arsize                          
 ,output var logic [1:0]                           egr_arburst                         
 ,output var logic [0:0]                           egr_arlock                          
 ,output var logic [3:0]                           egr_arcache                         
 ,output var logic [2:0]                           egr_arprot                          
 ,output var logic                                 egr_arvalid                         
 ,input  var logic                                 egr_arready  

 // egress AXI-MM Read Data Channel                              
 ,input  var logic [AXIMM_RID_WIDTH-1:0]           egr_rid                             
 ,input  var logic [AXIMM_RDATA_WIDTH-1:0]         egr_rdata                           
 ,input  var logic [1:0]                           egr_rresp                           
 ,input  var logic                                 egr_rlast                           
 ,input  var logic                                 egr_rvalid                          
 ,output var logic                                 egr_rready        

 // -----------------------------------------------------------------
 // csr interface
 ,input var logic [AXIMM_AWADDR_WIDTH-1:0] csr_vector_addr // lower 5 bits must be unused/zero
                                                           // used to determine the MSI vector

);

  localparam NUM_VECTORS_WD = $clog2(NUM_VECTORS);

  localparam MAX_OUTSTANDING_MSI_WD = $clog2(MAX_OUTSTANDING_MSI);

  //localparam F2H_FIFO_DEPTH = 512;
  localparam F2H_FIFO_DEPTH = 16;
  localparam F2H_FIFO_WIDTH = NUM_VECTORS_WD;
  localparam F2H_FIFO_THRESHOLD = F2H_FIFO_DEPTH - 4;

  localparam F2H_REQ_FIFO_DEPTH = MAX_OUTSTANDING_MSI*2;
  localparam F2H_REQ_FIFO_WIDTH = $clog2(F2H_REQ_FIFO_DEPTH);
  localparam F2H_REQ_FIFO_THRESHOLD = F2H_REQ_FIFO_DEPTH - 8;

  localparam MSI2GIC_FIFO_DEPTH = 512;
  localparam MSI2GIC_FIFO_WIDTH = DATA_WIDTH + ADDR_WIDTH;
  localparam MSI2GIC_FIFO_THRESHOLD = MSI2GIC_FIFO_DEPTH - 32;

  localparam BID_RSP_FIFO_DEPTH = 8;
  localparam BID_RSP_FIFO_THRESHOLD = BID_RSP_FIFO_DEPTH - 2;

  logic [NUM_VECTORS-1:0] [DATA_WIDTH-1:0] vector_data_array;

  // logic [NUM_VECTORS-1:0] [31:0] pend_bresp_array;
  logic [F2H_REQ_FIFO_DEPTH-1:0] [31:0] pend_bresp_array;

  logic [31:0] pend_bresp_array_prefetch;
  
  logic [$clog2(F2H_REQ_FIFO_DEPTH)-1:0] wr_pend_array_ptr, rd_pend_array_ptr, pend_array_cnt,
    nxt_pend_array_cnt, dec_pend_array;
  
  logic [31:0] free_run_req_cnt;

  logic [DATA_WIDTH-1:0] igr_avmm_wrdata_be;

  logic [NUM_VECTORS-1:0] [MAX_OUTSTANDING_MSI_WD-1:0] vector_cnt_array;

  logic [MSI2GIC_FIFO_WIDTH-1:0] msi2gic_fifo_wrdata;

  logic [NUM_VECTORS-1:0] rr_req, rr_gnt;

  logic [NUM_VECTORS_WD-1:0] f2h_fifo_wrdata, f2h_fifo_rddata;

  logic [NUM_VECTORS_WD:0] f2h_fifo_rddata_plus1;

  logic [NUM_VECTORS_WD-1:0] f2h_req_fifo_wrdata,
    f2h_req_fifo_rddata;

  logic [$clog2(F2H_FIFO_DEPTH)-1:0] f2h_fifo_wrusedw;
  
  logic [$clog2(BID_RSP_FIFO_DEPTH)-1:0] bid_rsp_fifo_wrusedw;

  logic [$clog2(F2H_REQ_FIFO_DEPTH)-1:0] f2h_req_fifo_wrusedw;

  logic [$clog2(MSI2GIC_FIFO_DEPTH)-1:0] msi2gic_fifo_wrusedw;

  logic f2h_fifo_wr, f2h_fifo_rd, msi2gic_fifo_rdy, f2h_resp_valid, f2h_fifo_rdy,
    f2h_fifo_rdempty, rr_en, msi2gic_fifo_wr, msi2gic_fifo_rd, msi2gic_fifo_rdempty,
    f2h_req_fifo_rd, f2h_req_fifo_wr, f2h_req_fifo_rdy, f2h_req_fifo_rdempty,
    bid_rsp_fifo_wr, bid_rsp_fifo_rd, bid_rsp_fifo_rdempty,
    pend_array_ptr_incr, pend_array_ptr_decr, pend_array_rdy,
    f2h_req_fifo_rd_req, f2h_req_fifo_rd_rdy,
    egr_avmm_rd_keep_assert, pending_rddatavld;
    
  // -----------------------------------------------------------------

  always_ff @ (posedge clk) begin
    if (igr_avmm_wr & igr_avmm_waitreq & f2h_fifo_rdy & f2h_req_fifo_rdy) begin
      igr_avmm_waitreq <= '0;

    // wait until get readdata back
    end else if (igr_avmm_rd & igr_avmm_waitreq & egr_avmm_rddata_vld) begin
      igr_avmm_waitreq <= '0;

    end else begin
      igr_avmm_waitreq <= '1;
    end

    if (rst) begin
      igr_avmm_waitreq <= '1;
    end
     
  end // always_ff
  
  always_ff @ (posedge clk) begin
    igr_avmm_rddata <= egr_avmm_rddata;
  end

  always_comb begin
    // insert igr_avmm_addr into wdata 
    f2h_fifo_wrdata = igr_avmm_addr[NUM_VECTORS_WD-1:0];

    f2h_fifo_wr = igr_avmm_wr & !igr_avmm_waitreq;
  end

  always_comb begin
    for (int i=0; i < (DATA_WIDTH/8); i=i+1) begin
      igr_avmm_wrdata_be[8*i+:8] = igr_avmm_byteenable[i] ?  igr_avmm_wrdata[8*i+:8] : 8'h0;
    end
  end
  
  // free_run_req_cnt: count outstanding write request responses
  always_ff @ (posedge clk) begin
    if (rst)
      free_run_req_cnt <= '0;
    else begin
      // write request with no write response
      if (igr_awvalid & igr_awready & (!egr_bvalid | (egr_bvalid & !egr_bready)))
        free_run_req_cnt <= free_run_req_cnt + 'h1;

      // no write request with write response
      else if ((!igr_awvalid | (igr_awvalid & !igr_awready)) & egr_bvalid & egr_bready & (egr_bresp == '0))
        free_run_req_cnt <= free_run_req_cnt - 'h1;

    end // else
  end // always_ff

  // load MSI data into vector_data_array
  always_ff @ (posedge clk) begin
    if (igr_avmm_wr & !igr_avmm_waitreq) begin
      vector_data_array[igr_avmm_addr[NUM_VECTORS_WD-1:0]] <= igr_avmm_wrdata_be;
    end

    if (rst) begin
      vector_data_array <= '0;
    end 
  end // always_ff

  // dec_pend_array: decrement pending array used to decrement pend_bresp_array indices
  always_ff @ (posedge clk) begin
    pend_array_rdy <= (pend_array_cnt <= F2H_REQ_FIFO_DEPTH - 4);

    if (rst)
      dec_pend_array <= '0;
    else begin
        // write response
        if (!(igr_awvalid & igr_awready & 
         (igr_awaddr[AXIMM_AWADDR_WIDTH-1:NUM_VECTORS_WD] == csr_vector_addr[AXIMM_AWADDR_WIDTH-1:NUM_VECTORS_WD]))
          & egr_bvalid & egr_bready & (egr_bresp == '0))
          dec_pend_array <= dec_pend_array + 'h1;
        
        // no write request that matches the csr_vector_addr.
        // dec_pend_array will be subtracted from pend_bresp_array and is set to 0.
        else if (!(igr_awvalid & igr_awready & 
         (igr_awaddr[AXIMM_AWADDR_WIDTH-1:NUM_VECTORS_WD] == csr_vector_addr[AXIMM_AWADDR_WIDTH-1:NUM_VECTORS_WD]))
         & (dec_pend_array != '0))
          dec_pend_array <= '0;

    end
  end // always_ff

  always_comb begin
    igr_awready = egr_awready & pend_array_rdy;
  end

  // pend_array_cnt: tracks how many entries are used in pend_bresp_array
  always_ff @ (posedge clk) begin
    if ( ( igr_awvalid & igr_awready & 
           (igr_awaddr[AXIMM_AWADDR_WIDTH-1:NUM_VECTORS_WD] == csr_vector_addr[AXIMM_AWADDR_WIDTH-1:NUM_VECTORS_WD]) 
         )
		   & !f2h_req_fifo_rd)
      pend_array_cnt <= pend_array_cnt + 'h1;
	 else if ( !( igr_awvalid & igr_awready & 
               (igr_awaddr[AXIMM_AWADDR_WIDTH-1:NUM_VECTORS_WD] == csr_vector_addr[AXIMM_AWADDR_WIDTH-1:NUM_VECTORS_WD]) 
                )
		        & f2h_req_fifo_rd)
       pend_array_cnt <= pend_array_cnt - 'h1;
		 
	  if (rst)
	    pend_array_cnt <= '0;
  end

  // wr_pend_array_ptr: increment when receive write request matching csr_vector_addr
  // rd_pend_array_ptr: increment when f2h_req_fifo_rd == '1
  always_ff @ (posedge clk) begin
    // wr_pend_array_ptr
    if (igr_awvalid & igr_awready & 
        (igr_awaddr[AXIMM_AWADDR_WIDTH-1:NUM_VECTORS_WD] == csr_vector_addr[AXIMM_AWADDR_WIDTH-1:NUM_VECTORS_WD]) 
         ) begin
      wr_pend_array_ptr <= wr_pend_array_ptr + 'h1;
    end else begin
      wr_pend_array_ptr <= wr_pend_array_ptr;
    end

    // rd_pend_array_ptr
    if (f2h_req_fifo_rd) begin
      rd_pend_array_ptr <= rd_pend_array_ptr + 'h1;
    end else begin
      rd_pend_array_ptr <= rd_pend_array_ptr;  
    end
    
    // pend_bresp_array
    for (int i=0; i < F2H_REQ_FIFO_DEPTH; i=i+1) begin
      // latch count when there is a write request and write response at the same time
      if (igr_awvalid & igr_awready & 
         (igr_awaddr[AXIMM_AWADDR_WIDTH-1:NUM_VECTORS_WD] == csr_vector_addr[AXIMM_AWADDR_WIDTH-1:NUM_VECTORS_WD]) 
          & egr_bvalid & egr_bready & (egr_bresp == '0))
        pend_bresp_array[wr_pend_array_ptr] <= free_run_req_cnt;

      // latch count when there is a write request and no write response
      else if (igr_awvalid & igr_awready & 
         (igr_awaddr[AXIMM_AWADDR_WIDTH-1:NUM_VECTORS_WD] == csr_vector_addr[AXIMM_AWADDR_WIDTH-1:NUM_VECTORS_WD]))
        pend_bresp_array[wr_pend_array_ptr] <= free_run_req_cnt + 'h1;
   
      // pending decrement action (dec_pend_array != '0) and set to 0 to prevent a negative value for all loop indices
      else if ((dec_pend_array != '0) & (pend_bresp_array[i] <= dec_pend_array)) 
        pend_bresp_array[i] <= '0;      

      // pending decrement action (dec_pend_array != '0) and subtract dec_pend_array for all loop indices
      else if (dec_pend_array != '0) 
        pend_bresp_array[i] <= pend_bresp_array[i] - dec_pend_array;      
    end

    if (rst) begin
      pend_bresp_array <= '0;
      wr_pend_array_ptr <= '0;
      rd_pend_array_ptr <= '0;
    end 
  end

  always_ff @ (posedge clk) begin
    f2h_fifo_rdy <= f2h_fifo_wrusedw < F2H_FIFO_THRESHOLD;
  end

  always_comb begin
    f2h_fifo_rd = !f2h_fifo_rdempty & !f2h_avmm_waitreq;

    f2h_avmm_wr = !f2h_fifo_rdempty;

    f2h_avmm_rd = '0;

    f2h_avmm_wrdata = 'hbeefcafe;

    f2h_avmm_byteenable = '1;

    f2h_avmm_burstcount = 'h1;

    f2h_avmm_addr = csr_vector_addr;
  end

  scfifo f2h_fifo
  (
   .clock                    (clk),
   .data                     (f2h_fifo_wrdata),
   .rdreq                    (f2h_fifo_rd),
   .wrreq                    (f2h_fifo_wr),
   .almost_full              (),
   .full                     (),    
   .q                        (f2h_fifo_rddata),
   .aclr                     (1'b0),
   .almost_empty             (),
   .eccstatus                (), 
   .empty                    (f2h_fifo_rdempty),     
   .sclr                     (rst),
   .usedw                    (f2h_fifo_wrusedw));     
  defparam
  f2h_fifo.add_ram_output_register  = "ON",
  f2h_fifo.enable_ecc  = "FALSE",
  f2h_fifo.intended_device_family  = DEVICE_FAMILY,
  f2h_fifo.ram_block_type  = "AUTO",
  f2h_fifo.lpm_numwords  = F2H_FIFO_DEPTH,
  f2h_fifo.lpm_showahead  = "ON",
  f2h_fifo.lpm_type  = "scfifo",
  f2h_fifo.lpm_width  = F2H_FIFO_WIDTH,
  f2h_fifo.lpm_widthu  = $clog2(F2H_FIFO_DEPTH),
  f2h_fifo.overflow_checking  = "OFF",
  f2h_fifo.underflow_checking  = "OFF", 
  f2h_fifo.use_eab  = "ON";

  // -----------------------------------------------------------------
  // snooping interface

  always_comb begin
   
    // compare if igr_awaddr matches the csr base address without considering lower inserted bits
    if (igr_awaddr[AXIMM_AWADDR_WIDTH-1:NUM_VECTORS_WD] 
          == csr_vector_addr[AXIMM_AWADDR_WIDTH-1:NUM_VECTORS_WD]) begin
 
      // zero out the lower bits used for injecting the MSI #
      egr_awaddr = {igr_awaddr[AXIMM_AWADDR_WIDTH-1:NUM_VECTORS_WD],{NUM_VECTORS_WD{1'b0}}};
    end else begin
      egr_awaddr = igr_awaddr;  
    end


    // AXI-MM Write Address Channel
    egr_awid     = igr_awid;
    egr_awlen    = igr_awlen;   
    egr_awsize   = igr_awsize;  
    egr_awburst  = igr_awburst; 
    egr_awlock   = igr_awlock;  
    egr_awcache  = igr_awcache; 
    egr_awprot   = igr_awprot;  
    egr_awvalid  = igr_awvalid;

    // AXI-MM Write Data Channel
    egr_wdata  = igr_wdata; 
    egr_wstrb  = igr_wstrb; 
    egr_wlast  = igr_wlast; 
    egr_wvalid = igr_wvalid;
    igr_wready = egr_wready; 

    // AXI-MM Write Response Channel
    igr_bid    = egr_bid;   
    igr_bresp  = egr_bresp; 
    igr_bvalid = egr_bvalid;
    egr_bready = igr_bready;

    // AXI-MM Read Address Channel 
    egr_arid    = igr_arid;   
    egr_araddr  = igr_araddr; 
    egr_arlen   = igr_arlen;  
    egr_arsize  = igr_arsize; 
    egr_arburst = igr_arburst;
    egr_arlock  = igr_arlock; 
    egr_arcache = igr_arcache;
    egr_arprot  = igr_arprot; 
    egr_arvalid = igr_arvalid;
    igr_arready = egr_arready;

    // AXI-MM Read Data Channel 
    igr_rid    = egr_rid;
    igr_rdata  = egr_rdata;
    igr_rresp  = egr_rresp;
    igr_rlast  = egr_rlast;
    igr_rvalid = egr_rvalid;
    egr_rready = igr_rready;
  end

  always_ff @ (posedge clk) begin
    f2h_req_fifo_rdy <= f2h_req_fifo_wrusedw < F2H_REQ_FIFO_THRESHOLD;

    pend_bresp_array_prefetch <= pend_bresp_array[rd_pend_array_ptr];
	
    // f2h_req_fifo_rd ready to dequeue
	if (f2h_req_fifo_rd_req & !f2h_req_fifo_rd_rdy)
      f2h_req_fifo_rd_rdy <= '1;
    else if (f2h_req_fifo_rd)
      f2h_req_fifo_rd_rdy <= '0;

    if (rst)
      f2h_req_fifo_rd_rdy <= '0;

  end

  always_comb begin  

    f2h_req_fifo_wrdata = igr_avmm_addr;
    
    f2h_req_fifo_wr = f2h_req_fifo_rdy & igr_avmm_wr & !igr_avmm_waitreq;

    // request to read
    f2h_req_fifo_rd_req = !f2h_req_fifo_rdempty & (pend_bresp_array[rd_pend_array_ptr] == '0)
                          & (pend_array_cnt != '0);
								
								
	f2h_req_fifo_rd = f2h_req_fifo_rd_rdy & !egr_avmm_waitreq;

    egr_avmm_wr     = f2h_req_fifo_rd_rdy;

    egr_avmm_wrdata = vector_data_array[f2h_req_fifo_rddata];

    egr_avmm_byteenable = egr_avmm_rd ? igr_avmm_byteenable : '1;

    egr_avmm_burstcount = 'h1;

    egr_avmm_addr = egr_avmm_rd ? igr_avmm_addr : f2h_req_fifo_rddata;

    // egr_avmm_rd = igr_avmm_rd;
  end

  always_ff @ (posedge clk) begin
    if (rst) begin
      egr_avmm_rd <= '0;
      egr_avmm_rd_keep_assert <= '0;
      pending_rddatavld <= '0;
    end else begin
      // assert rd_req
      if (igr_avmm_rd & !egr_avmm_waitreq & !egr_avmm_rd & !pending_rddatavld) begin
        egr_avmm_rd <= '1;
        egr_avmm_rd_keep_assert <= '0;
        pending_rddatavld <= '1;
      end else if (igr_avmm_rd & egr_avmm_waitreq & !egr_avmm_rd & !pending_rddatavld) begin
        egr_avmm_rd <= '1;
        egr_avmm_rd_keep_assert <= '1;
        pending_rddatavld <= '0;
      end else if (egr_avmm_rd & 
                   (!egr_avmm_rd_keep_assert | (egr_avmm_rd_keep_assert & !egr_avmm_waitreq))) begin
        egr_avmm_rd <= '0;
        egr_avmm_rd_keep_assert <= '0;

      // wait for rd_resp
      end else if (egr_avmm_rddata_vld) begin
        pending_rddatavld <= '0;
      end
    end
  end

    scfifo f2h_req_fifo
	(
	 .clock                    (clk),
	 .data                     (f2h_req_fifo_wrdata),
	 .rdreq                    (f2h_req_fifo_rd),
	 .wrreq                    (f2h_req_fifo_wr),
	 .almost_full              (),
	 .full                     (),    
	 .q                        (f2h_req_fifo_rddata),
	 .aclr                     (1'b0),
	 .almost_empty             (),
	 .eccstatus                (), 
	 .empty                    (f2h_req_fifo_rdempty),     
	 .sclr                     (rst),
	 .usedw                    (f2h_req_fifo_wrusedw));     
    defparam
	f2h_req_fifo.add_ram_output_register  = "ON",
	f2h_req_fifo.enable_ecc  = "FALSE",
	f2h_req_fifo.intended_device_family  = DEVICE_FAMILY,
	f2h_req_fifo.ram_block_type  = "AUTO",
	f2h_req_fifo.lpm_numwords  = F2H_REQ_FIFO_DEPTH,
	f2h_req_fifo.lpm_showahead  = "ON",
	f2h_req_fifo.lpm_type  = "scfifo",
	f2h_req_fifo.lpm_width  = F2H_REQ_FIFO_WIDTH,
	f2h_req_fifo.lpm_widthu  = $clog2(F2H_REQ_FIFO_DEPTH),
	f2h_req_fifo.overflow_checking  = "OFF",
	f2h_req_fifo.underflow_checking  = "OFF", 
	f2h_req_fifo.use_eab  = "ON";

endmodule
