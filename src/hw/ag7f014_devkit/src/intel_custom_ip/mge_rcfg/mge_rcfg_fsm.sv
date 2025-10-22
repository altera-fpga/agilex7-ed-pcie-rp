// (C) 2018-2019 Intel Corporation. All rights reserved.
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

`timescale 1 ps / 1 ps

module mge_rcfg_fsm #(
    parameter NUM_OF_CHANNEL    = 1,
    
    // Internal parameters, do not change
    parameter NUM_OF_CH_WIDTH   = log2ceil(NUM_OF_CHANNEL)
) ( 
    input                                   clk,
    input                                   rst_n,
    
    output reg                      [ 1:0]  csr_rcfg_address,
    output reg                              csr_rcfg_read,
    output reg                              csr_rcfg_write,
    output reg                      [31:0]  csr_rcfg_writedata,
    input                           [31:0]  csr_rcfg_readdata,
    
    input       [NUM_OF_CHANNEL-1:0]        reconfig_busy,
    output reg  [3:0]                       status,
    output reg                              cur_chan,
    output reg                              mge_chan1_resetn,
    output reg                              mge_chan2_resetn
);

//
// Local parameters declaration
//

// State machine
typedef enum logic[3:0] {IDLE, WAIT_FREE, CFG_CHAN, CFG_SPEED, WAIT_BUSY, WAIT_DONE, DONE} state_t;
state_t state;

// XCVR address offset
localparam CAL_CTRL_ADDR  = 10'h000;

reg [NUM_OF_CH_WIDTH-1:0]  chan;
reg [9:0]   count;

always @(posedge clk ) begin
   case(state)

     IDLE: begin
         status[2:0] <= 3'd0;
     end

     WAIT_FREE: begin
         status[2:0] <= 3'd1;
     end
     
     CFG_CHAN: begin
         status[2:0] <= 3'd2;
     end

     CFG_SPEED: begin
         status[2:0] <= 3'd3;
     end

     WAIT_BUSY: begin
         status[2:0] <= 3'd4;
     end
     
     WAIT_DONE: begin
         status[2:0] <= 3'd5;
     end
     
     DONE: begin
         status[2:0] <= 3'd6;
     end

     default: begin
         status[2:0] <= 3'd7;
     end
     
   endcase
   
   status[3] <= chan[0];
end


// Loop control variable
integer i;

always @(posedge clk or negedge rst_n)
begin
    if(~rst_n) begin
        mge_chan1_resetn <= 1'b0;
        mge_chan2_resetn <= 1'b0;
    end
    else begin
        mge_chan1_resetn <= ~reconfig_busy[0];
        if (NUM_OF_CHANNEL > 1) 
           mge_chan2_resetn <= ~reconfig_busy[1];
    end
end

//
// State machine
//
always @(posedge clk or negedge rst_n)
begin
    if(~rst_n) begin
        state <= IDLE;
        count <= 10'd0;
    end
    else begin
      case(state)

        IDLE: begin
            if (count >=10'h3ff)
               state <= WAIT_FREE;
        end
        
        WAIT_FREE: begin
            if (reconfig_busy[chan] == 1'b0)
               state <= CFG_CHAN;
        end

        CFG_CHAN: begin
            state <= CFG_SPEED;
        end

        CFG_SPEED: begin
            state <= WAIT_BUSY;
        end

        WAIT_BUSY: begin
            if (reconfig_busy[chan] == 1'b1)
               state <= WAIT_DONE;
        end
        
        WAIT_DONE: begin
            if (reconfig_busy[chan] == 1'b0) begin
               if (chan == NUM_OF_CHANNEL-1)
                  state <= DONE;
               else
                  state <= CFG_CHAN;
            end
        end
        
        DONE: begin
            state <= DONE;
        end

        default: begin
            state = DONE;
        end
        
      endcase
      
         if (count <= 10'h3ff)
            count <= count + 10'd1;
    end
end

//
// Avalon MM master interface
//
always @(posedge clk or negedge rst_n)
begin
    if(~rst_n) begin
        csr_rcfg_address         <= 2'b0;
        csr_rcfg_read            <= 1'b0;
        csr_rcfg_write           <= 1'b0;
        csr_rcfg_writedata       <= 32'h0;
    end
    else begin        
        case(state)
            
            IDLE: begin
                csr_rcfg_address        <= 2'b0;
                csr_rcfg_write          <= 1'b0;
                csr_rcfg_writedata      <= 32'h0;
            end
            
            CFG_CHAN: begin
                csr_rcfg_address        <= 2'b0;
                csr_rcfg_write          <= 1'b1;
                csr_rcfg_writedata      <= {{(32-NUM_OF_CHANNEL){1'b0}},chan};
            end
            
            CFG_SPEED: begin
                csr_rcfg_address        <= 2'b1;
                csr_rcfg_write          <= 1'b1;
                csr_rcfg_writedata      <= 32'h00010000;
            end
            
            default: begin
                csr_rcfg_address        <= 2'b0;
                csr_rcfg_write          <= 1'b0;
                csr_rcfg_writedata      <= 32'h0;
            end               
        endcase
        
                    
        if ((state == WAIT_DONE) && (reconfig_busy[chan] == 1'b0) ) 
            chan <= chan + 1;
        else if (state == IDLE)
            chan <= {NUM_OF_CH_WIDTH{1'b0}};
    end
end

// --------------------------------------------------
// Calculates the log2ceil of the input value
// --------------------------------------------------
function integer log2ceil;
    input integer val;
    integer i;
    
    begin
        i = 1;
        log2ceil = 0;
        
        if (val == 1) begin
            return 1;
        end
        
        while (i < val) begin
            log2ceil = log2ceil + 1;
            i = i << 1; 
        end
    end
endfunction

endmodule
