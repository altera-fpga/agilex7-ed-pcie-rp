//# ######################################################################## 
//# Copyright (C) 2025 Altera Corporation.
//# SPDX-License-Identifier: MIT
//# ######################################################################## 
module addr_filter # (
  parameter DEVICE_FAMILY = "Agilex 7"

 ,parameter PIPELINE_MSI_GIC_START_ADDR_LSB = 32'h20018000 
 ,parameter PIPELINE_MSI_GIC_START_ADDR_MSB = 32'h0 
 ,parameter PIPELINE_MSI_GIC_END_ADDR_LSB   = 32'h2001807F 
 ,parameter PIPELINE_MSI_GIC_END_ADDR_MSB   = 32'h0 
 ,parameter PIPELINE_0_START_ADDR_LSB       = 32'h80000000 
 ,parameter PIPELINE_0_START_ADDR_MSB       = 32'h0 
 ,parameter PIPELINE_0_END_ADDR_LSB         = 32'hFFFFFFFF 
 ,parameter PIPELINE_0_END_ADDR_MSB         = 32'h0 
 ,parameter PIPELINE_1_START_ADDR_LSB       = 32'h80000000
 ,parameter PIPELINE_1_START_ADDR_MSB       = 32'h8
 ,parameter PIPELINE_1_END_ADDR_LSB         = 32'hFFFFFFFF
 ,parameter PIPELINE_1_END_ADDR_MSB         = 32'h9

  // AXI-MM
 ,parameter AXIMM_AWID_WIDTH          = 8
 ,parameter AXIMM_AWADDR_WIDTH        = 64
 ,parameter AXIMM_WDATA_WIDTH         = 256
 ,parameter AXIMM_BID_WIDTH           = 8
 ,parameter AXIMM_ARID_WIDTH          = 8
 ,parameter AXIMM_ARADDR_WIDTH        = 64
 ,parameter AXIMM_RID_WIDTH           = 8
 ,parameter AXIMM_RDATA_WIDTH         = 256

) (
  input  var logic                                 clk
 ,input  var logic                                 rst

 // ingress AXI-MM Write Address Channel
 ,input  var logic [AXIMM_AWID_WIDTH-1:0]          igr_axi_awid                            
 ,input  var logic [AXIMM_AWADDR_WIDTH-1:0]        igr_axi_awaddr                          
 ,input  var logic [7:0]                           igr_axi_awlen                           
 ,input  var logic [2:0]                           igr_axi_awsize                          
 ,input  var logic [1:0]                           igr_axi_awburst                         
 ,input  var logic [0:0]                           igr_axi_awlock                          
 ,input  var logic [3:0]                           igr_axi_awcache                         
 ,input  var logic [2:0]                           igr_axi_awprot                          
 ,input  var logic                                 igr_axi_awvalid                         
 ,output var logic                                 igr_axi_awready

 // ingress AXI-MM Write Data Channel
 ,input  var logic [AXIMM_WDATA_WIDTH-1:0]         igr_axi_wdata                           
 ,input  var logic [(AXIMM_WDATA_WIDTH/8)-1:0]     igr_axi_wstrb                           
 ,input  var logic                                 igr_axi_wlast                           
 ,input  var logic                                 igr_axi_wvalid                          
 ,output var logic                                 igr_axi_wready 

 // ingress AXI-MM Write Response Channel
 ,output var logic [AXIMM_BID_WIDTH-1:0]           igr_axi_bid                             
 ,output var logic [1:0]                           igr_axi_bresp                           
 ,output var logic                                 igr_axi_bvalid                          
 ,input  var logic                                 igr_axi_bready       

 // ingress AXI-MM Read Address Channel 
 ,input  var logic [AXIMM_ARID_WIDTH-1:0]          igr_axi_arid                            
 ,input  var logic [AXIMM_ARADDR_WIDTH-1:0]        igr_axi_araddr                          
 ,input  var logic [7:0]                           igr_axi_arlen                           
 ,input  var logic [2:0]                           igr_axi_arsize                          
 ,input  var logic [1:0]                           igr_axi_arburst                         
 ,input  var logic [0:0]                           igr_axi_arlock                          
 ,input  var logic [3:0]                           igr_axi_arcache                         
 ,input  var logic [2:0]                           igr_axi_arprot                          
 ,input  var logic                                 igr_axi_arvalid                         
 ,output var logic                                 igr_axi_arready

 // ingress AXI-MM Read Data Channel       
 ,output var logic [AXIMM_RID_WIDTH-1:0]           igr_axi_rid                             
 ,output var logic [AXIMM_RDATA_WIDTH-1:0]         igr_axi_rdata                           
 ,output var logic [1:0]                           igr_axi_rresp                           
 ,output var logic                                 igr_axi_rlast                           
 ,output var logic                                 igr_axi_rvalid                          
 ,input  var logic                                 igr_axi_rready                          

 // ----------------------------------------------------------------
 // Datapath AXI egress

 // egress AXI-MM Write Address Channel
 ,output var logic [AXIMM_AWID_WIDTH-1:0]          egr_axi_awid                            
 ,output var logic [AXIMM_AWADDR_WIDTH-1:0]        egr_axi_awaddr                          
 ,output var logic [7:0]                           egr_axi_awlen                           
 ,output var logic [2:0]                           egr_axi_awsize                          
 ,output var logic [1:0]                           egr_axi_awburst                         
 ,output var logic [0:0]                           egr_axi_awlock                          
 ,output var logic [3:0]                           egr_axi_awcache                         
 ,output var logic [2:0]                           egr_axi_awprot                          
 ,output var logic                                 egr_axi_awvalid                         
 ,input  var logic                                 egr_axi_awready 

 // egress AXI-MM Write Data Channel                        
 ,output var logic [AXIMM_WDATA_WIDTH-1:0]         egr_axi_wdata                           
 ,output var logic [(AXIMM_WDATA_WIDTH/8)-1:0]     egr_axi_wstrb                           
 ,output var logic                                 egr_axi_wlast                           
 ,output var logic                                 egr_axi_wvalid                          
 ,input  var logic                                 egr_axi_wready           

 // egress AXI-MM Write Response Channel               
 ,input  var logic [AXIMM_BID_WIDTH-1:0]           egr_axi_bid                             
 ,input  var logic [1:0]                           egr_axi_bresp                           
 ,input  var logic                                 egr_axi_bvalid                          
 ,output var logic                                 egr_axi_bready            

 // egress AXI-MM Read Address Channel               
 ,output var logic [AXIMM_ARID_WIDTH-1:0]          egr_axi_arid                            
 ,output var logic [AXIMM_ARADDR_WIDTH-1:0]        egr_axi_araddr                          
 ,output var logic [7:0]                           egr_axi_arlen                           
 ,output var logic [2:0]                           egr_axi_arsize                          
 ,output var logic [1:0]                           egr_axi_arburst                         
 ,output var logic [0:0]                           egr_axi_arlock                          
 ,output var logic [3:0]                           egr_axi_arcache                         
 ,output var logic [2:0]                           egr_axi_arprot                          
 ,output var logic                                 egr_axi_arvalid                         
 ,input  var logic                                 egr_axi_arready  

 // egress AXI-MM Read Data Channel                              
 ,input  var logic [AXIMM_RID_WIDTH-1:0]           egr_axi_rid                             
 ,input  var logic [AXIMM_RDATA_WIDTH-1:0]         egr_axi_rdata                           
 ,input  var logic [1:0]                           egr_axi_rresp                           
 ,input  var logic                                 egr_axi_rlast                           
 ,input  var logic                                 egr_axi_rvalid                          
 ,output var logic                                 egr_axi_rready     

 // ----------------------------------------------------------------
 // MSI AXI egress

 // egress AXI-MM Write Address Channel
 ,output var logic [AXIMM_AWID_WIDTH-1:0]          egr_msi_axi_awid                            
 ,output var logic [AXIMM_AWADDR_WIDTH-1:0]        egr_msi_axi_awaddr                          
 ,output var logic [7:0]                           egr_msi_axi_awlen                           
 ,output var logic [2:0]                           egr_msi_axi_awsize                          
 ,output var logic [1:0]                           egr_msi_axi_awburst                         
 ,output var logic [0:0]                           egr_msi_axi_awlock                          
 ,output var logic [3:0]                           egr_msi_axi_awcache                         
 ,output var logic [2:0]                           egr_msi_axi_awprot                          
 ,output var logic                                 egr_msi_axi_awvalid                         
 ,input  var logic                                 egr_msi_axi_awready 

 // egress AXI-MM Write Data Channel                        
 ,output var logic [AXIMM_WDATA_WIDTH-1:0]         egr_msi_axi_wdata                           
 ,output var logic [(AXIMM_WDATA_WIDTH/8)-1:0]     egr_msi_axi_wstrb                           
 ,output var logic                                 egr_msi_axi_wlast                           
 ,output var logic                                 egr_msi_axi_wvalid                          
 ,input  var logic                                 egr_msi_axi_wready           

 // egress AXI-MM Write Response Channel               
 ,input  var logic [AXIMM_BID_WIDTH-1:0]           egr_msi_axi_bid                             
 ,input  var logic [1:0]                           egr_msi_axi_bresp                           
 ,input  var logic                                 egr_msi_axi_bvalid                          
 ,output var logic                                 egr_msi_axi_bready            

 // egress AXI-MM Read Address Channel               
 ,output var logic [AXIMM_ARID_WIDTH-1:0]          egr_msi_axi_arid                            
 ,output var logic [AXIMM_ARADDR_WIDTH-1:0]        egr_msi_axi_araddr                          
 ,output var logic [7:0]                           egr_msi_axi_arlen                           
 ,output var logic [2:0]                           egr_msi_axi_arsize                          
 ,output var logic [1:0]                           egr_msi_axi_arburst                         
 ,output var logic [0:0]                           egr_msi_axi_arlock                          
 ,output var logic [3:0]                           egr_msi_axi_arcache                         
 ,output var logic [2:0]                           egr_msi_axi_arprot                          
 ,output var logic                                 egr_msi_axi_arvalid                         
 ,input  var logic                                 egr_msi_axi_arready  

 // egress AXI-MM Read Data Channel                              
 ,input  var logic [AXIMM_RID_WIDTH-1:0]           egr_msi_axi_rid                             
 ,input  var logic [AXIMM_RDATA_WIDTH-1:0]         egr_msi_axi_rdata                           
 ,input  var logic [1:0]                           egr_msi_axi_rresp                           
 ,input  var logic                                 egr_msi_axi_rlast                           
 ,input  var logic                                 egr_msi_axi_rvalid                          
 ,output var logic                                 egr_msi_axi_rready     

); 
 // combine MSB and LSB
 localparam PIPELINE_MSI_GIC_START_ADDR = {PIPELINE_MSI_GIC_START_ADDR_MSB,PIPELINE_MSI_GIC_START_ADDR_LSB};
 localparam PIPELINE_MSI_GIC_END_ADDR   = {PIPELINE_MSI_GIC_END_ADDR_MSB,PIPELINE_MSI_GIC_END_ADDR_LSB};
 localparam PIPELINE_0_START_ADDR       = {PIPELINE_0_START_ADDR_MSB,PIPELINE_0_START_ADDR_LSB};
 localparam PIPELINE_0_END_ADDR         = {PIPELINE_0_END_ADDR_MSB,PIPELINE_0_END_ADDR_LSB};
 localparam PIPELINE_1_START_ADDR       = {PIPELINE_1_START_ADDR_MSB,PIPELINE_1_START_ADDR_LSB};
 localparam PIPELINE_1_END_ADDR         = {PIPELINE_1_END_ADDR_MSB,PIPELINE_1_END_ADDR_LSB};

  localparam WR_FIFO_DEPTH = 512;
  localparam WR_ADDR_FIFO_WIDTH = AXIMM_AWID_WIDTH+AXIMM_AWADDR_WIDTH+8+3+2+1+4+3;
  localparam WR_DATA_FIFO_WIDTH = AXIMM_WDATA_WIDTH+(AXIMM_WDATA_WIDTH/8)+1;
  localparam WR_FIFO_THRESHOLD = WR_FIFO_DEPTH - 32;

  localparam RD_FIFO_DEPTH = 8;
  localparam RD_FIFO_WIDTH = AXIMM_ARID_WIDTH+AXIMM_ARADDR_WIDTH+8+3+2+1+4+3;
  localparam RD_FIFO_THRESHOLD = RD_FIFO_DEPTH - 3;

  localparam RSP_FIFO_DEPTH = 8;
  localparam RSP_FIFO_THRESHOLD = RSP_FIFO_DEPTH - 3;

  localparam WR_RSP_FIFO_WIDTH = AXIMM_BID_WIDTH+2;
  localparam RD_RSP_FIFO_WIDTH = AXIMM_RID_WIDTH+AXIMM_RDATA_WIDTH+2+1;


  logic [$clog2(WR_FIFO_DEPTH)-1:0] wr_addr_fifo_wrusedw, wr_data_fifo_wrusedw;

  logic [$clog2(RD_FIFO_DEPTH)-1:0] rd_fifo_wrusedw;
  
  logic wr_addr_fifo_rd, wr_addr_fifo_rdempty, 
    wr_data_fifo_rd, wr_data_fifo_rdempty,
    egr_pending_wlast, rd_fifo_rd, init_wdata, 
    wdata_within_range, msi_wdata_within_range,
    rd_fifo_rdempty;

  // Write/Read Response Handling
  logic [AXIMM_BID_WIDTH-1:0] msi_wr_rsp_fifo_bid;
  logic [$clog2(RSP_FIFO_DEPTH)-1:0] msi_wr_rsp_fifo_wrusedw, msi_rd_rsp_fifo_wrusedw;
  logic [1:0] msi_wr_rsp_fifo_bresp;
  logic msi_wr_rsp_fifo_rd, msi_wr_rsp_fifo_rdempty;

  logic [AXIMM_RID_WIDTH-1:0] msi_rd_rsp_fifo_rid;  
  logic [AXIMM_RDATA_WIDTH-1:0] msi_rd_rsp_fifo_rdata;
  logic [1:0] msi_rd_rsp_fifo_rresp;
  logic msi_rd_rsp_fifo_rd, msi_rd_rsp_fifo_rdempty, msi_rd_rsp_fifo_rlast;

  logic [AXIMM_BID_WIDTH-1:0] wr_rsp_fifo_bid;
  logic [$clog2(RSP_FIFO_DEPTH)-1:0] wr_rsp_fifo_wrusedw, rd_rsp_fifo_wrusedw;
  logic [1:0] wr_rsp_fifo_bresp;
  logic wr_rsp_fifo_rd, wr_rsp_fifo_rdempty;

  logic [AXIMM_RID_WIDTH-1:0] rd_rsp_fifo_rid;  
  logic [AXIMM_RDATA_WIDTH-1:0] rd_rsp_fifo_rdata;
  logic [1:0] rd_rsp_fifo_rresp;
  logic rd_rsp_fifo_rd, rd_rsp_fifo_rdempty, rd_rsp_fifo_rlast;

  always_ff @ (posedge clk) begin
    igr_axi_awready <= wr_addr_fifo_wrusedw < WR_FIFO_THRESHOLD;

    igr_axi_wready  <= wr_data_fifo_wrusedw < WR_FIFO_THRESHOLD;

    igr_axi_arready <= rd_fifo_wrusedw < RD_FIFO_THRESHOLD;
  end

  // Write Address Request
  always_comb begin
    if (!wr_addr_fifo_rdempty & !wr_data_fifo_rdempty & !egr_pending_wlast) begin
      if ( (egr_axi_awaddr >= PIPELINE_0_START_ADDR && egr_axi_awaddr <= PIPELINE_0_END_ADDR )
         | (egr_axi_awaddr >= PIPELINE_1_START_ADDR && egr_axi_awaddr <= PIPELINE_1_END_ADDR )
          ) begin
        egr_axi_awvalid = '1;
        egr_msi_axi_awvalid = '0;
       end
      else if (egr_axi_awaddr >= PIPELINE_MSI_GIC_START_ADDR && egr_axi_awaddr <= PIPELINE_MSI_GIC_END_ADDR 
               ) begin
        egr_axi_awvalid = '0;
        egr_msi_axi_awvalid = '1;
      end else begin
        egr_axi_awvalid = '0;
        egr_msi_axi_awvalid = '0;
      end
    end else begin
      egr_axi_awvalid = '0;
      egr_msi_axi_awvalid = '0;
    end
  end

  // Write Data Request
  always_comb begin
    if (!wr_addr_fifo_rdempty & !wr_data_fifo_rdempty & !egr_pending_wlast) begin
      if ( (egr_axi_awaddr >= PIPELINE_0_START_ADDR && egr_axi_awaddr <= PIPELINE_0_END_ADDR )
         | (egr_axi_awaddr >= PIPELINE_1_START_ADDR && egr_axi_awaddr <= PIPELINE_1_END_ADDR )
          ) begin
        // first transfer within range
        egr_axi_wvalid  = '1;
        egr_msi_axi_wvalid  = '0;
       end
      else if (egr_axi_awaddr >= PIPELINE_MSI_GIC_START_ADDR && egr_axi_awaddr <= PIPELINE_MSI_GIC_END_ADDR 
               ) begin
        egr_axi_wvalid  = '0;
        egr_msi_axi_wvalid  = '1;
      end
      else begin
        egr_axi_wvalid  = '0;
        egr_msi_axi_wvalid  = '0;
      end
    end else if (egr_pending_wlast & wdata_within_range & !wr_data_fifo_rdempty) begin
      egr_axi_wvalid = '1;
      egr_msi_axi_wvalid = '0;
    end else if (egr_pending_wlast & msi_wdata_within_range & !wr_data_fifo_rdempty) begin
      egr_axi_wvalid = '0;
      egr_msi_axi_wvalid = '1;
    end else begin
      egr_axi_wvalid = '0;
      egr_msi_axi_wvalid = '0;
    end
  end

  // init_wdata : popped out of wr_addr_fifo and there's a pending EOP
  always_ff @(posedge clk) begin
    if (wr_addr_fifo_rd & !init_wdata & !egr_axi_wlast) begin
      if ( (egr_axi_awaddr >= PIPELINE_0_START_ADDR && egr_axi_awaddr <= PIPELINE_0_END_ADDR )
         | (egr_axi_awaddr >= PIPELINE_1_START_ADDR && egr_axi_awaddr <= PIPELINE_1_END_ADDR )
          ) begin
        init_wdata <= '1; 
        wdata_within_range <= '1;
        msi_wdata_within_range <= '0;
       end
      else if (egr_axi_awaddr >= PIPELINE_MSI_GIC_START_ADDR && egr_axi_awaddr <= PIPELINE_MSI_GIC_END_ADDR
               ) begin
        init_wdata <= '1; 
        wdata_within_range <= '0;
        msi_wdata_within_range <= '1;
       end
      else begin
        init_wdata <= '1; 
        wdata_within_range <= '0;
        msi_wdata_within_range <= '0;
      end
    end else if (wr_data_fifo_rd & !egr_axi_wlast) begin
        init_wdata <= '1; 
        wdata_within_range <= wdata_within_range;
        msi_wdata_within_range <= msi_wdata_within_range;
    end else if (wr_data_fifo_rd & egr_axi_wlast) begin
        init_wdata <= '0; 
        wdata_within_range <= '0;
        msi_wdata_within_range <= '0;
    end

    if (rst) begin
        init_wdata <= '0; 
        wdata_within_range <= '0;
        msi_wdata_within_range <= '0;
    end
  end

 // Read Address Request
  always_comb begin
    if (!rd_fifo_rdempty) begin
      if ( (egr_axi_araddr >= PIPELINE_0_START_ADDR && egr_axi_araddr <= PIPELINE_0_END_ADDR )
         | (egr_axi_araddr >= PIPELINE_1_START_ADDR && egr_axi_araddr <= PIPELINE_1_END_ADDR )
          ) begin
        egr_axi_arvalid = '1;
        egr_msi_axi_arvalid = '0;
       end
      else if (egr_axi_araddr >= PIPELINE_MSI_GIC_START_ADDR && egr_axi_araddr <= PIPELINE_MSI_GIC_END_ADDR) begin
        egr_axi_arvalid = '0;
        egr_msi_axi_arvalid = '1;
      end
      else begin
        egr_axi_arvalid = '0;
        egr_msi_axi_arvalid = '0;
      end
    end else begin
      egr_axi_arvalid = '0;
      egr_msi_axi_arvalid = '0;
    end
  end

  // egr_pending_wlast : track egress pending EOP
  always_ff @ (posedge clk) begin
    if (rst) 
      egr_pending_wlast <= '0;
    else begin
      if (wr_data_fifo_rd & !egr_axi_wlast) begin
        egr_pending_wlast  <= '1;
      end 
      else if (wr_data_fifo_rd & egr_axi_wlast) begin
        egr_pending_wlast <= '0;
      end
    end
  end  

  always_comb begin
    // start transfer
    if (!wr_addr_fifo_rdempty & !wr_data_fifo_rdempty & !egr_pending_wlast) begin
      if ( (egr_axi_awaddr >= PIPELINE_0_START_ADDR && egr_axi_awaddr <= PIPELINE_0_END_ADDR )
         | (egr_axi_awaddr >= PIPELINE_1_START_ADDR && egr_axi_awaddr <= PIPELINE_1_END_ADDR )
          ) begin
        wr_addr_fifo_rd = egr_axi_awready & egr_axi_wready;
        wr_data_fifo_rd = wr_addr_fifo_rd;
      end else if (egr_axi_awaddr >= PIPELINE_MSI_GIC_START_ADDR && egr_axi_awaddr <= PIPELINE_MSI_GIC_END_ADDR) begin
        wr_addr_fifo_rd = egr_msi_axi_awready & egr_msi_axi_wready;
        wr_data_fifo_rd = wr_addr_fifo_rd;
      // flush
      end else begin
        wr_addr_fifo_rd = '1; 
        wr_data_fifo_rd = '1; 
      end
    end else if (!wr_data_fifo_rdempty & wdata_within_range & egr_pending_wlast) begin
        wr_addr_fifo_rd = '0; 
        wr_data_fifo_rd = egr_axi_wready;
    end else if (!wr_data_fifo_rdempty & msi_wdata_within_range & egr_pending_wlast) begin
        wr_addr_fifo_rd = '0; 
        wr_data_fifo_rd = egr_msi_axi_wready;
    // flush
    end else if (!wr_data_fifo_rdempty & egr_pending_wlast) begin
        wr_addr_fifo_rd = '0; 
        wr_data_fifo_rd = '1;
    end else begin
      wr_addr_fifo_rd = '0; 
      wr_data_fifo_rd = '0;
    end
  end

  always_comb begin
    if (!rd_fifo_rdempty) begin
      if ( (egr_axi_araddr >= PIPELINE_0_START_ADDR && egr_axi_araddr <= PIPELINE_0_END_ADDR )
         | (egr_axi_araddr >= PIPELINE_1_START_ADDR && egr_axi_araddr <= PIPELINE_1_END_ADDR )
          )
        rd_fifo_rd = egr_axi_arready;
      else if (egr_axi_araddr >= PIPELINE_MSI_GIC_START_ADDR && egr_axi_araddr <= PIPELINE_MSI_GIC_END_ADDR)
        rd_fifo_rd = egr_msi_axi_arready;
      // flush
      else 
        rd_fifo_rd = '1;
    end
    else 
      rd_fifo_rd = '0;
  end

  scfifo wr_addr_fifo
  (
   .clock                    (clk),
   .data                     ({ igr_axi_awid   
                               ,igr_axi_awaddr 
                               ,igr_axi_awlen  
                               ,igr_axi_awsize 
                               ,igr_axi_awburst
                               ,igr_axi_awlock 
                               ,igr_axi_awcache
                               ,igr_axi_awprot 
                                }),
   .rdreq                    (wr_addr_fifo_rd),
   .wrreq                    (igr_axi_awready & igr_axi_awvalid),
   .almost_full              (),
   .full                     (),    
   .q                        ({ egr_axi_awid   
                               ,egr_axi_awaddr 
                               ,egr_axi_awlen  
                               ,egr_axi_awsize 
                               ,egr_axi_awburst
                               ,egr_axi_awlock 
                               ,egr_axi_awcache
                               ,egr_axi_awprot
                                }),
   .aclr                     (1'b0),
   .almost_empty             (),
   .eccstatus                (), 
   .empty                    (wr_addr_fifo_rdempty),     
   .sclr                     (rst),
   .usedw                    (wr_addr_fifo_wrusedw));     
  defparam
  wr_addr_fifo.add_ram_output_register  = "ON",
  wr_addr_fifo.enable_ecc  = "FALSE",
  wr_addr_fifo.intended_device_family  = DEVICE_FAMILY,
  wr_addr_fifo.ram_block_type  = "AUTO",
  wr_addr_fifo.lpm_numwords  = WR_FIFO_DEPTH,
  wr_addr_fifo.lpm_showahead  = "ON",
  wr_addr_fifo.lpm_type  = "scfifo",
  wr_addr_fifo.lpm_width  = WR_ADDR_FIFO_WIDTH,
  wr_addr_fifo.lpm_widthu  = $clog2(WR_FIFO_DEPTH),
  wr_addr_fifo.overflow_checking  = "OFF",
  wr_addr_fifo.underflow_checking  = "OFF", 
  wr_addr_fifo.use_eab  = "ON";

  scfifo wr_data_fifo
  (
   .clock                    (clk),
   .data                     ({ igr_axi_wdata
                               ,igr_axi_wstrb
                               ,igr_axi_wlast
                               }),
   .rdreq                    (wr_data_fifo_rd),
   .wrreq                    (igr_axi_wready & igr_axi_wvalid),
   .almost_full              (),
   .full                     (),    
   .q                        ({ egr_axi_wdata
                               ,egr_axi_wstrb
                               ,egr_axi_wlast
                               }),
   .aclr                     (1'b0),
   .almost_empty             (),
   .eccstatus                (), 
   .empty                    (wr_data_fifo_rdempty),     
   .sclr                     (rst),
   .usedw                    (wr_data_fifo_wrusedw));     
  defparam
  wr_data_fifo.add_ram_output_register  = "ON",
  wr_data_fifo.enable_ecc  = "FALSE",
  wr_data_fifo.intended_device_family  = DEVICE_FAMILY,
  wr_data_fifo.ram_block_type  = "AUTO",
  wr_data_fifo.lpm_numwords  = WR_FIFO_DEPTH,
  wr_data_fifo.lpm_showahead  = "ON",
  wr_data_fifo.lpm_type  = "scfifo",
  wr_data_fifo.lpm_width  = WR_DATA_FIFO_WIDTH,
  wr_data_fifo.lpm_widthu  = $clog2(WR_FIFO_DEPTH),
  wr_data_fifo.overflow_checking  = "OFF",
  wr_data_fifo.underflow_checking  = "OFF", 
  wr_data_fifo.use_eab  = "ON";

  scfifo rd_fifo
  (
   .clock                    (clk),
   .data                     ({ igr_axi_arid   
                               ,igr_axi_araddr 
                               ,igr_axi_arlen  
                               ,igr_axi_arsize 
                               ,igr_axi_arburst
                               ,igr_axi_arlock 
                               ,igr_axi_arcache
                               ,igr_axi_arprot 
                               }),
   .rdreq                    (rd_fifo_rd),
   .wrreq                    (igr_axi_arvalid & igr_axi_arready),
   .almost_full              (),
   .full                     (),    
   .q                        ({ egr_axi_arid   
                               ,egr_axi_araddr 
                               ,egr_axi_arlen  
                               ,egr_axi_arsize 
                               ,egr_axi_arburst
                               ,egr_axi_arlock 
                               ,egr_axi_arcache
                               ,egr_axi_arprot 
                               }),
   .aclr                     (1'b0),
   .almost_empty             (),
   .eccstatus                (), 
   .empty                    (rd_fifo_rdempty),     
   .sclr                     (rst),
   .usedw                    (rd_fifo_wrusedw));     
  defparam
  rd_fifo.add_ram_output_register  = "ON",
  rd_fifo.enable_ecc  = "FALSE",
  rd_fifo.intended_device_family  = DEVICE_FAMILY,
  rd_fifo.ram_block_type  = "AUTO",
  rd_fifo.lpm_numwords  = RD_FIFO_DEPTH,
  rd_fifo.lpm_showahead  = "ON",
  rd_fifo.lpm_type  = "scfifo",
  rd_fifo.lpm_width  = RD_FIFO_WIDTH,
  rd_fifo.lpm_widthu  = $clog2(RD_FIFO_DEPTH),
  rd_fifo.overflow_checking  = "OFF",
  rd_fifo.underflow_checking  = "OFF", 
  rd_fifo.use_eab  = "ON";

  // -----------------------------------------------------------------------
  // Write/Read Response Handling
 
  always_ff @ (posedge clk) begin
    egr_msi_axi_bready <= msi_wr_rsp_fifo_wrusedw < RSP_FIFO_THRESHOLD;

    egr_msi_axi_rready  <= msi_rd_rsp_fifo_wrusedw < RSP_FIFO_THRESHOLD;

    egr_axi_bready <= wr_rsp_fifo_wrusedw < RSP_FIFO_THRESHOLD;

    egr_axi_rready  <= rd_rsp_fifo_wrusedw < RSP_FIFO_THRESHOLD;
  end

  // MUX between datapath and MSI path
  always_comb begin
    // write response
    if (!msi_wr_rsp_fifo_rdempty) begin
      igr_axi_bvalid     = '1;
      igr_axi_bid        = msi_wr_rsp_fifo_bid;
      igr_axi_bresp      = msi_wr_rsp_fifo_bresp;

      msi_wr_rsp_fifo_rd = igr_axi_bready;
      wr_rsp_fifo_rd     = '0;
    end else if (!wr_rsp_fifo_rdempty) begin
      igr_axi_bvalid = '1;
      igr_axi_bid    = wr_rsp_fifo_bid;
      igr_axi_bresp  = wr_rsp_fifo_bresp;

      msi_wr_rsp_fifo_rd = '0;
      wr_rsp_fifo_rd     = igr_axi_bready;
    end else begin
      igr_axi_bvalid = '0;
      igr_axi_bid    = '0;
      igr_axi_bresp  = '0;

      msi_wr_rsp_fifo_rd = '0;
      wr_rsp_fifo_rd     = '0;
    end

    // read response
    if (!msi_rd_rsp_fifo_rdempty) begin
      igr_axi_rvalid     = '1;
      igr_axi_rid        = msi_rd_rsp_fifo_rid;
      igr_axi_rdata      = msi_rd_rsp_fifo_rdata;
      igr_axi_rresp      = msi_rd_rsp_fifo_rresp;
      igr_axi_rlast      = msi_rd_rsp_fifo_rlast;

      msi_rd_rsp_fifo_rd = igr_axi_rready;
      rd_rsp_fifo_rd     = '0;
    end else if (!rd_rsp_fifo_rdempty) begin
      igr_axi_rvalid     = '1;
      igr_axi_rid        = rd_rsp_fifo_rid;
      igr_axi_rdata      = rd_rsp_fifo_rdata;
      igr_axi_rresp      = rd_rsp_fifo_rresp;
      igr_axi_rlast      = rd_rsp_fifo_rlast;

      msi_rd_rsp_fifo_rd = '0;
      rd_rsp_fifo_rd     = igr_axi_rready;
    end else begin
      igr_axi_rvalid     = '0;
      igr_axi_rid        = '0;
      igr_axi_rdata      = '0;
      igr_axi_rresp      = '0;
      igr_axi_rlast      = '0;

      msi_rd_rsp_fifo_rd = '0;
      rd_rsp_fifo_rd     = '0;
    end
  end

  // msi_wr_rsp_fifo
  scfifo msi_wr_rsp_fifo
  (
   .clock                    (clk),
   .data                     ({ egr_msi_axi_bid
                               ,egr_msi_axi_bresp
                               }),
   .rdreq                    (msi_wr_rsp_fifo_rd),
   .wrreq                    (egr_msi_axi_bready & egr_msi_axi_bvalid),
   .almost_full              (),
   .full                     (),    
   .q                        ({ msi_wr_rsp_fifo_bid
                               ,msi_wr_rsp_fifo_bresp
                               }),
   .aclr                     (1'b0),
   .almost_empty             (),
   .eccstatus                (), 
   .empty                    (msi_wr_rsp_fifo_rdempty),     
   .sclr                     (rst),
   .usedw                    (msi_wr_rsp_fifo_wrusedw));     
  defparam
  msi_wr_rsp_fifo.add_ram_output_register  = "ON",
  msi_wr_rsp_fifo.enable_ecc  = "FALSE",
  msi_wr_rsp_fifo.intended_device_family  = DEVICE_FAMILY,
  msi_wr_rsp_fifo.ram_block_type  = "AUTO",
  msi_wr_rsp_fifo.lpm_numwords  = RSP_FIFO_DEPTH,
  msi_wr_rsp_fifo.lpm_showahead  = "ON",
  msi_wr_rsp_fifo.lpm_type  = "scfifo",
  msi_wr_rsp_fifo.lpm_width  = WR_RSP_FIFO_WIDTH,
  msi_wr_rsp_fifo.lpm_widthu  = $clog2(RSP_FIFO_DEPTH),
  msi_wr_rsp_fifo.overflow_checking  = "OFF",
  msi_wr_rsp_fifo.underflow_checking  = "OFF", 
  msi_wr_rsp_fifo.use_eab  = "ON";

  // msi_rd_rsp_fifo
  scfifo msi_rd_rsp_fifo
  (
   .clock                    (clk),
   .data                     ({ egr_msi_axi_rid
                               ,egr_msi_axi_rdata
                               ,egr_msi_axi_rresp
                               ,egr_msi_axi_rlast
                               }),
   .rdreq                    (msi_rd_rsp_fifo_rd),
   .wrreq                    (egr_msi_axi_rready & egr_msi_axi_rvalid),
   .almost_full              (),
   .full                     (),    
   .q                        ({ msi_rd_rsp_fifo_rid
                               ,msi_rd_rsp_fifo_rdata
                               ,msi_rd_rsp_fifo_rresp
                               ,msi_rd_rsp_fifo_rlast
                               }),
   .aclr                     (1'b0),
   .almost_empty             (),
   .eccstatus                (), 
   .empty                    (msi_rd_rsp_fifo_rdempty),     
   .sclr                     (rst),
   .usedw                    (msi_rd_rsp_fifo_wrusedw));     
  defparam
  msi_rd_rsp_fifo.add_ram_output_register  = "ON",
  msi_rd_rsp_fifo.enable_ecc  = "FALSE",
  msi_rd_rsp_fifo.intended_device_family  = DEVICE_FAMILY,
  msi_rd_rsp_fifo.ram_block_type  = "AUTO",
  msi_rd_rsp_fifo.lpm_numwords  = RSP_FIFO_DEPTH,
  msi_rd_rsp_fifo.lpm_showahead  = "ON",
  msi_rd_rsp_fifo.lpm_type  = "scfifo",
  msi_rd_rsp_fifo.lpm_width  = RD_RSP_FIFO_WIDTH,
  msi_rd_rsp_fifo.lpm_widthu  = $clog2(RSP_FIFO_DEPTH),
  msi_rd_rsp_fifo.overflow_checking  = "OFF",
  msi_rd_rsp_fifo.underflow_checking  = "OFF", 
  msi_rd_rsp_fifo.use_eab  = "ON";

  // wr_rsp_fifo
  scfifo wr_rsp_fifo
  (
   .clock                    (clk),
   .data                     ({ egr_axi_bid
                               ,egr_axi_bresp
                               }),
   .rdreq                    (wr_rsp_fifo_rd),
   .wrreq                    (egr_axi_bready & egr_axi_bvalid),
   .almost_full              (),
   .full                     (),    
   .q                        ({ wr_rsp_fifo_bid
                               ,wr_rsp_fifo_bresp
                               }),
   .aclr                     (1'b0),
   .almost_empty             (),
   .eccstatus                (), 
   .empty                    (wr_rsp_fifo_rdempty),     
   .sclr                     (rst),
   .usedw                    (wr_rsp_fifo_wrusedw));     
  defparam
  wr_rsp_fifo.add_ram_output_register  = "ON",
  wr_rsp_fifo.enable_ecc  = "FALSE",
  wr_rsp_fifo.intended_device_family  = DEVICE_FAMILY,
  wr_rsp_fifo.ram_block_type  = "AUTO",
  wr_rsp_fifo.lpm_numwords  = RSP_FIFO_DEPTH,
  wr_rsp_fifo.lpm_showahead  = "ON",
  wr_rsp_fifo.lpm_type  = "scfifo",
  wr_rsp_fifo.lpm_width  = WR_RSP_FIFO_WIDTH,
  wr_rsp_fifo.lpm_widthu  = $clog2(RSP_FIFO_DEPTH),
  wr_rsp_fifo.overflow_checking  = "OFF",
  wr_rsp_fifo.underflow_checking  = "OFF", 
  wr_rsp_fifo.use_eab  = "ON";

  // rd_rsp_fifo
  scfifo rd_rsp_fifo
  (
   .clock                    (clk),
   .data                     ({ egr_axi_rid
                               ,egr_axi_rdata
                               ,egr_axi_rresp
                               ,egr_axi_rlast
                               }),
   .rdreq                    (rd_rsp_fifo_rd),
   .wrreq                    (egr_axi_rready & egr_axi_rvalid),
   .almost_full              (),
   .full                     (),    
   .q                        ({ rd_rsp_fifo_rid
                               ,rd_rsp_fifo_rdata
                               ,rd_rsp_fifo_rresp
                               ,rd_rsp_fifo_rlast
                               }),
   .aclr                     (1'b0),
   .almost_empty             (),
   .eccstatus                (), 
   .empty                    (rd_rsp_fifo_rdempty),     
   .sclr                     (rst),
   .usedw                    (rd_rsp_fifo_wrusedw));     
  defparam
  rd_rsp_fifo.add_ram_output_register  = "ON",
  rd_rsp_fifo.enable_ecc  = "FALSE",
  rd_rsp_fifo.intended_device_family  = DEVICE_FAMILY,
  rd_rsp_fifo.ram_block_type  = "AUTO",
  rd_rsp_fifo.lpm_numwords  = RSP_FIFO_DEPTH,
  rd_rsp_fifo.lpm_showahead  = "ON",
  rd_rsp_fifo.lpm_type  = "scfifo",
  rd_rsp_fifo.lpm_width  = RD_RSP_FIFO_WIDTH,
  rd_rsp_fifo.lpm_widthu  = $clog2(RSP_FIFO_DEPTH),
  rd_rsp_fifo.overflow_checking  = "OFF",
  rd_rsp_fifo.underflow_checking  = "OFF", 
  rd_rsp_fifo.use_eab  = "ON";


  always_comb begin

    // ------------------------------------------------
    // MSI AXI egress

    // egress AXI-MM Write Address Channel
    egr_msi_axi_awid    = egr_axi_awid;
    egr_msi_axi_awaddr  = egr_axi_awaddr; 
    egr_msi_axi_awlen   = egr_axi_awlen;    
    egr_msi_axi_awsize  = egr_axi_awsize; 
    egr_msi_axi_awburst = egr_axi_awburst;
    egr_msi_axi_awlock  = egr_axi_awlock; 
    egr_msi_axi_awcache = egr_axi_awcache;
    egr_msi_axi_awprot  = egr_axi_awprot;
  
    // egress AXI-MM Write Data Channel 
    egr_msi_axi_wdata = egr_axi_wdata;
    egr_msi_axi_wstrb = egr_axi_wstrb;
    egr_msi_axi_wlast = egr_axi_wlast;

    // egress AXI-MM Read Address Channel
    egr_msi_axi_arid    = egr_axi_arid;   
    egr_msi_axi_araddr  = egr_axi_araddr; 
    egr_msi_axi_arlen   = egr_axi_arlen;  
    egr_msi_axi_arsize  = egr_axi_arsize; 
    egr_msi_axi_arburst = egr_axi_arburst;
    egr_msi_axi_arlock  = egr_axi_arlock; 
    egr_msi_axi_arcache = egr_axi_arcache;
    egr_msi_axi_arprot  = egr_axi_arprot; 

  end

  // debug counters
  //
  //

  // logic [31:0] addr_filt_igr_aw_cnt, addr_filt_igr_w_cnt,
  //              addr_filt_egr_axi_aw_cnt, addr_filt_egr_axi_w_cnt,
  //              addr_filt_egr_msi_axi_aw_cnt, addr_filt_egr_msi_axi_w_cnt,
  //              addr_filt_egr_bvld_cnt, addr_filt_egr_msi_bvld_cnt,
  //              addr_filt_igr_bvld_cnt, addr_filt_igr_datapath_aw_cnt,
  //              addr_filt_igr_msipath_aw_cnt /* synthesis noprune */;
  // 
  // logic addr_filt_aw_sent_out_more_than_received, addr_filt_blvd_sent_out_more_than_received /* synthesis noprune */;
  // 
  // always_ff @ (posedge clk) begin
  //   // IGR
  //   if (igr_axi_awvalid & igr_axi_awready)
  //     addr_filt_igr_aw_cnt <= addr_filt_igr_aw_cnt + 'h1;
  // 
  //   if (igr_axi_wvalid & igr_axi_wlast & igr_axi_wready)
  //     addr_filt_igr_w_cnt <= addr_filt_igr_w_cnt + 'h1;
  // 
  //   if ( igr_axi_awvalid & igr_axi_awready 
  //      & ((igr_axi_awaddr >= PIPELINE_0_START_ADDR && igr_axi_awaddr <= PIPELINE_0_END_ADDR )
  //        |(igr_axi_awaddr >= PIPELINE_1_START_ADDR && igr_axi_awaddr <= PIPELINE_1_END_ADDR )
  //         )
  //       )
  //     addr_filt_igr_datapath_aw_cnt <= addr_filt_igr_datapath_aw_cnt + 'h1;
  // 
  //   if ( igr_axi_awvalid & igr_axi_awready 
  //      & (igr_axi_awaddr >= PIPELINE_MSI_GIC_START_ADDR && igr_axi_awaddr <= PIPELINE_MSI_GIC_END_ADDR )
  //         )
  //     addr_filt_igr_msipath_aw_cnt <= addr_filt_igr_msipath_aw_cnt + 'h1;
  // 
  //   if (igr_axi_bvalid & igr_axi_bready)
  //     addr_filt_igr_bvld_cnt <= addr_filt_igr_bvld_cnt + 'h1;
  // 
  //   // EGR
  //   if (egr_axi_awvalid & egr_axi_awready)
  //     addr_filt_egr_axi_aw_cnt <= addr_filt_egr_axi_aw_cnt + 'h1;
  // 
  //   if (egr_axi_wvalid & egr_axi_wlast & egr_axi_wready)
  //     addr_filt_egr_axi_w_cnt <= addr_filt_egr_axi_w_cnt + 'h1;
  // 
  //   if (egr_axi_bvalid & egr_axi_bready)
  //     addr_filt_egr_bvld_cnt <= addr_filt_egr_bvld_cnt + 'h1;
  // 
  // 
  //   // MSI
  //   if (egr_msi_axi_awvalid & egr_msi_axi_awready)
  //     addr_filt_egr_msi_axi_aw_cnt <= addr_filt_egr_msi_axi_aw_cnt + 'h1;
  // 
  //   if (egr_msi_axi_wvalid & egr_msi_axi_wlast & egr_msi_axi_wready)
  //     addr_filt_egr_msi_axi_w_cnt <= addr_filt_egr_msi_axi_w_cnt + 'h1;
  // 
  //   if (egr_msi_axi_bvalid & egr_msi_axi_bready)
  //     addr_filt_egr_msi_bvld_cnt <= addr_filt_egr_msi_bvld_cnt + 'h1;
  // 
  //   // comparisons
  //   if ( (addr_filt_egr_axi_aw_cnt+addr_filt_egr_msi_axi_aw_cnt) > addr_filt_igr_aw_cnt )
  //     addr_filt_aw_sent_out_more_than_received <= '1; 
  // 
  //   if ( addr_filt_igr_bvld_cnt > (addr_filt_egr_bvld_cnt+addr_filt_egr_msi_bvld_cnt) )
  //     addr_filt_blvd_sent_out_more_than_received <= '1; 
  // 
  // 
  //   if (rst) begin
  //     addr_filt_igr_aw_cnt <= '0;
  //     addr_filt_igr_w_cnt <= '0;
  // 
  //     addr_filt_egr_axi_aw_cnt <= '0;
  //     addr_filt_egr_axi_w_cnt <= '0;
  // 
  //     addr_filt_egr_msi_axi_aw_cnt <= '0;
  //     addr_filt_egr_msi_axi_w_cnt <= '0;     
  // 
  //     addr_filt_egr_bvld_cnt <= '0; 
  //     addr_filt_egr_msi_bvld_cnt <= '0; 
  //     addr_filt_igr_bvld_cnt <= '0; 
  // 
  //     addr_filt_igr_datapath_aw_cnt <= '0;
  //     addr_filt_igr_msipath_aw_cnt <= '0;
  //  
  //     addr_filt_aw_sent_out_more_than_received <= '0;
  //     addr_filt_blvd_sent_out_more_than_received <= '0;
  //   end
  // 
  // end


endmodule
