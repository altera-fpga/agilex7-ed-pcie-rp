`timescale 1ns / 1ps
module pipeline_stages #(
parameter F2H_ADDR_WIDTH = 16,
parameter F2H_DATA_WIDTH = 32, 
parameter PIPE_STAGES = 32
	
)(

input  logic                      clk,   
input  logic                      rst_n, // active low reset

input   logic                         s0_avmm_write,
input   logic                         s0_avmm_read,
input   logic [F2H_ADDR_WIDTH-1:0]    s0_avmm_address,
input   logic [F2H_DATA_WIDTH/8-1:0]  s0_avmm_byteenable,
input   logic [F2H_DATA_WIDTH-1:0]    s0_avmm_writedata,
output  logic                         s0_avmm_readdatavalid,
output  logic [F2H_DATA_WIDTH-1:0]    s0_avmm_readdata, 
output  logic                         s0_avmm_waitrequest,


output logic                         m0_avmm_write,
output logic                         m0_avmm_read,
output logic [F2H_ADDR_WIDTH-1:0]    m0_avmm_address,
output logic [F2H_DATA_WIDTH/8-1:0]  m0_avmm_byteenable,
output logic [F2H_DATA_WIDTH-1:0]    m0_avmm_writedata,
input  logic                         m0_avmm_readdatavalid,
input  logic [F2H_DATA_WIDTH-1:0]    m0_avmm_readdata, 
input  logic                         m0_avmm_waitrequest

);
 reg [PIPE_STAGES-1:0]                         s0_pipe_avmm_write='d0;
 reg [PIPE_STAGES-1:0]                         s0_pipe_avmm_read='d0;
 reg [PIPE_STAGES-1:0][F2H_ADDR_WIDTH-1:0]     s0_pipe_avmm_address='d0;
 reg [PIPE_STAGES-1:0][F2H_DATA_WIDTH/8-1:0]   s0_pipe_avmm_byteenable='d0;
 reg [PIPE_STAGES-1:0][F2H_DATA_WIDTH-1:0]     s0_pipe_avmm_writedata='d0;
 
 reg [PIPE_STAGES-1:0]                         m0_pipe_avmm_readdatavalid='d0;
 reg [PIPE_STAGES-1:0][F2H_DATA_WIDTH-1:0]     m0_pipe_avmm_readdata='d0;
 reg [PIPE_STAGES-1:0]                         m0_pipe_avmm_waitrequest='d0;


 integer i;
 always@(posedge clk) begin
  if(!rst_n) begin
    for(i=0; i<PIPE_STAGES; i++) begin
	  s0_pipe_avmm_write        [i]   <= 'd0;
	  s0_pipe_avmm_read         [i]   <= 'd0;
	  s0_pipe_avmm_address      [i]   <= 'd0;
	  s0_pipe_avmm_byteenable   [i]   <= 'd0;
	  s0_pipe_avmm_writedata    [i]   <= 'd0;
	  m0_pipe_avmm_readdatavalid[i]   <= 'd0;
	  m0_pipe_avmm_readdata     [i]   <= 'd0;
	  m0_pipe_avmm_waitrequest  [i]   <= 'd0;
	end
	end
   else begin
     s0_pipe_avmm_write            <= {s0_pipe_avmm_write[PIPE_STAGES-1:0],s0_avmm_write};
     s0_pipe_avmm_read             <= {s0_pipe_avmm_read[PIPE_STAGES-1:0],s0_avmm_read};
     s0_pipe_avmm_address          <= {s0_pipe_avmm_address[PIPE_STAGES-1:0],s0_avmm_address};
     s0_pipe_avmm_byteenable       <= {s0_pipe_avmm_byteenable[PIPE_STAGES-1:0],s0_avmm_byteenable};
     s0_pipe_avmm_writedata        <= {s0_pipe_avmm_writedata[PIPE_STAGES-1:0],s0_avmm_writedata};
     m0_pipe_avmm_readdatavalid    <= {m0_pipe_avmm_readdatavalid[PIPE_STAGES-1:0],m0_avmm_readdatavalid};
     m0_pipe_avmm_readdata         <= {m0_pipe_avmm_readdata[PIPE_STAGES-1:0],m0_avmm_readdata};
     m0_pipe_avmm_waitrequest      <= {m0_pipe_avmm_waitrequest[PIPE_STAGES-1:0],m0_avmm_waitrequest};
	end
end

assign m0_avmm_write          = s0_pipe_avmm_write        [PIPE_STAGES-1];
assign m0_avmm_read           = s0_pipe_avmm_read         [PIPE_STAGES-1];
assign m0_avmm_address        = s0_pipe_avmm_address      [PIPE_STAGES-1];
assign m0_avmm_byteenable     = s0_pipe_avmm_byteenable   [PIPE_STAGES-1];
assign m0_avmm_writedata      = s0_pipe_avmm_writedata    [PIPE_STAGES-1];
assign s0_avmm_readdatavalid  = m0_pipe_avmm_readdatavalid[PIPE_STAGES-1];
assign s0_avmm_readdata       = m0_pipe_avmm_readdata     [PIPE_STAGES-1];
assign s0_avmm_waitrequest    = m0_pipe_avmm_waitrequest  [PIPE_STAGES-1];


endmodule
