`timescale 1ns / 1ps

module uart_rx #(
    parameter CLK_FREQ = 27000000,
    parameter BAUD_RATE = 115200
)(
    input  wire       clk,
    input  wire       reset,
    input  wire       rx,
    output reg [7:0]  data,
    output reg        valid
);

    localparam CLK_PER_BIT = CLK_FREQ / BAUD_RATE;
    
    // Etats de la machine
    localparam IDLE  = 2'b00;
    localparam START = 2'b01;
    localparam DATA  = 2'b10;
    localparam STOP  = 2'b11;

    reg [1:0] state = IDLE;
    reg [15:0] clk_count = 0;
    reg [2:0]  bit_index = 0;
    reg [7:0]  rx_data = 0;
    
    // Resynchronisation du signal RX pour éviter la métastabilité
    reg rx_sync_1 = 1'b1;
    reg rx_sync   = 1'b1;
    
    always @(posedge clk) begin
        rx_sync_1 <= rx;
        rx_sync   <= rx_sync_1;
    end

    always @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
            clk_count <= 0;
            bit_index <= 0;
            valid <= 0;
            data <= 0;
        end else begin
            valid <= 0; // Pulsé à 1 sur 1 cycle d'horloge
            
            case (state)
                IDLE: begin
                    clk_count <= 0;
                    bit_index <= 0;
                    if (rx_sync == 1'b0) begin // Détection du Start Bit
                        state <= START;
                    end
                end
                
                START: begin
                    if (clk_count == (CLK_PER_BIT / 2)) begin
                        if (rx_sync == 1'b0) begin // Confirme le start bit
                            clk_count <= 0;
                            state <= DATA;
                        end else begin
                            state <= IDLE; // Faux départ
                        end
                    end else begin
                        clk_count <= clk_count + 1;
                    end
                end
                
                DATA: begin
                    if (clk_count == CLK_PER_BIT - 1) begin
                        clk_count <= 0;
                        rx_data[bit_index] <= rx_sync;
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
                    if (clk_count == CLK_PER_BIT - 1) begin
                        clk_count <= 0;
                        if (rx_sync == 1'b1) begin
                            data <= rx_data;
                            valid <= 1'b1;
                        end
                        state <= IDLE;
                    end else begin
                        clk_count <= clk_count + 1;
                    end
                end
            endcase
        end
    end
endmodule
