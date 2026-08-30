`timescale 1ns / 1ps

module uart_tx #(
    parameter CLK_FREQ = 27000000,
    parameter BAUD_RATE = 115200
)(
    input  wire       clk,
    input  wire       reset,
    input  wire       start,
    input  wire [7:0] data,
    output reg        tx,
    output reg        ready
);

    localparam CLK_PER_BIT = CLK_FREQ / BAUD_RATE;
    
    localparam IDLE  = 2'b00;
    localparam START = 2'b01;
    localparam DATA  = 2'b10;
    localparam STOP  = 2'b11;

    reg [1:0]  state = IDLE;
    reg [15:0] clk_count = 0;
    reg [2:0]  bit_index = 0;
    reg [7:0]  tx_data = 0;

    always @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
            clk_count <= 0;
            bit_index <= 0;
            tx <= 1'b1;
            ready <= 1'b1;
        end else begin
            case (state)
                IDLE: begin
                    tx <= 1'b1;
                    ready <= 1'b1;
                    clk_count <= 0;
                    bit_index <= 0;
                    if (start) begin
                        tx_data <= data;
                        ready <= 1'b0;
                        state <= START;
                    end
                end
                
                START: begin
                    tx <= 1'b0;
                    if (clk_count == CLK_PER_BIT - 1) begin
                        clk_count <= 0;
                        state <= DATA;
                    end else begin
                        clk_count <= clk_count + 1;
                    end
                end
                
                DATA: begin
                    tx <= tx_data[bit_index];
                    if (clk_count == CLK_PER_BIT - 1) begin
                        clk_count <= 0;
                        if (bit_index == 7) begin
                            state <= STOP;
                        end else begin
                            bit_index <= bit_index + 1;
                        end
                    end else begin
                        clk_count <= clk_count + 1;
                    end
                end
                
                STOP: begin
                    tx <= 1'b1;
                    if (clk_count == CLK_PER_BIT - 1) begin
                        clk_count <= 0;
                        state <= IDLE;
                    end else begin
                        clk_count <= clk_count + 1;
                    end
                end
            endcase
        end
    end
endmodule
