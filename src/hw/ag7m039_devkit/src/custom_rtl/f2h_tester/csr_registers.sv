`timescale 1 ns / 1 ps

// Supports only DATA_WIDTH aligned accesses
module csr_registers #(
    parameter ADDR_WIDTH         = 14,
    parameter DATA_WIDTH         = 32)
    (
     input logic                   clk,
     input logic                   rstn,
     // Control signals to F2H FSM
     output logic                  read,                         
     output logic                  write,
     output logic [DATA_WIDTH-1:0] address,
     output logic [DATA_WIDTH-1:0] write_data,
     input  logic [DATA_WIDTH-1:0] read_data,
     input  logic                  read_data_valid,
     input  logic [31:0]           read_latency,
     // CSR AVMM
     input  logic [ADDR_WIDTH-1:0] csr_address,          
     input  logic                  csr_read,             
     input  logic                  csr_write,            
     input  logic [DATA_WIDTH-1:0] csr_writedata,        
     output logic                  csr_readdatavalid,    
     output logic [DATA_WIDTH-1:0] csr_readdata,          
     output logic                  csr_waitrequest          
     );
     

localparam CONTROL_REG     = 5'b00000, //0x00
           ADDR_REG        = 5'b00100, //0x04
           WRITE_DATA_REG  = 5'b01000, //0x08
           READ_DATA_REG   = 5'b01100, //0x0C
           READ_LAT_REG    = 5'b10000; //0x10


     logic[DATA_WIDTH-1:0] control_reg;       
     logic[DATA_WIDTH-1:0] addr_reg;          
     logic[DATA_WIDTH-1:0] writedata_reg;     
     logic[DATA_WIDTH-1:0] readdata_reg;      
     logic read_dly, write_dly;               
     logic wredge,rdedge;                     

always@(posedge clk) begin
  if(~rstn) begin
     write_dly <= 1'b0;
     read_dly  <= 1'b0;
  end else begin
     write_dly <= csr_write;
     read_dly  <= csr_read;
end end

assign wredge = csr_write & ~write_dly;
assign rdedge = csr_read  & ~read_dly;

assign csr_waitrequest = (wredge|rdedge); // Whenver edge detected, waitrequest gets asserted for 1 clock cycle to respond back and load registers.


// Write logic
always @ (posedge clk) begin
  if (~rstn) begin
     control_reg    <= '0;
     addr_reg       <= '0;
     writedata_reg  <= '0;
  end else if (csr_write & csr_address == CONTROL_REG) begin
     control_reg    <= csr_writedata;
  end else if (read_data_valid) begin
     control_reg    <= {control_reg[DATA_WIDTH-1:3], 1'b1, control_reg[1:0]};
  end else if (write) begin
     control_reg    <= {control_reg[DATA_WIDTH-1:1], 1'b0};
  end else if (read) begin
     control_reg    <= {control_reg[DATA_WIDTH-1:2], 1'b0, control_reg[0]};
  end else if (csr_write & csr_address == ADDR_REG) begin
     addr_reg       <= csr_writedata;        
  end else if (csr_write & csr_address == WRITE_DATA_REG) begin
     writedata_reg  <= csr_writedata;         
end end

// Read Logic

// Latch the read data on read data valid. Validity of this data depends on the 
// control_reg[2] bit which SW has to poll  
always @ (posedge clk)
  if (~rstn)
   readdata_reg <= '0;
  else if (read_data_valid)
   readdata_reg <= read_data; 

always @ (posedge clk) begin
    if (~rstn) begin
     csr_readdata      <= '0;
     csr_readdatavalid <= 0;
   end else if (csr_read & ~csr_waitrequest) begin
     csr_readdatavalid <= 1;
     case(csr_address)
        CONTROL_REG:    csr_readdata <= control_reg;
        ADDR_REG:       csr_readdata <= addr_reg;
        WRITE_DATA_REG: csr_readdata <= writedata_reg;
        READ_DATA_REG:  csr_readdata <= readdata_reg;
        READ_LAT_REG:   csr_readdata <= read_latency; 
        default:        csr_readdata <= {DATA_WIDTH{1'b0}};
    endcase
    end else if (~csr_read) begin
     csr_readdata      <= '0;
     csr_readdatavalid <= 0;
end end

// Outputs

assign write      = control_reg[0];
assign read       = control_reg[1];
assign address    = addr_reg;       // Address needs to be aligned with F2H data width. Conversion  
                                    // logic is required if byte aligned address in addr_reg and 
                                    // F2H data path width is higher than DATA_WIDTH      
assign write_data = writedata_reg;

endmodule
