`timescale 1ns / 1ps

module top (
    input  wire clk,
    input  wire reset_n, // Bouton poussoir ou pull-up
    input  wire uart_rx,
    output wire uart_tx
);

    wire reset = ~reset_n;

    // ==========================================
    // 1. UART Modules
    // ==========================================
    wire [7:0] rx_data;
    wire       rx_valid;
    
    uart_rx #(
        .CLK_FREQ(27000000),
        .BAUD_RATE(115200)
    ) urx (
        .clk(clk),
        .reset(reset),
        .rx(uart_rx),
        .data(rx_data),
        .valid(rx_valid)
    );

    reg [7:0] tx_data_reg;
    reg       tx_start_reg;
    wire      tx_ready;

    uart_tx #(
        .CLK_FREQ(27000000),
        .BAUD_RATE(115200)
    ) utx (
        .clk(clk),
        .reset(reset),
        .start(tx_start_reg),
        .data(tx_data_reg),
        .tx(uart_tx),
        .ready(tx_ready)
    );

    // ==========================================
    // 2. Instanciation de l'Accelerateur
    // ==========================================
    wire [31:0] axi_araddr;
    wire [3:0]  axi_arid;
    wire        axi_arvalid;
    wire        axi_arready;
    wire [7:0]  axi_arlen;
    wire [63:0] axi_rdata;
    wire [3:0]  axi_rid;
    wire        axi_rvalid;
    wire        axi_rready;
    wire        axi_rlast;

    reg [7:0]  csr_awaddr_reg;
    reg        csr_awvalid_reg;
    wire       csr_awready;
    reg [31:0] csr_wdata_reg;
    reg        csr_wvalid_reg;
    wire       csr_wready;
    wire       csr_bvalid;
    reg        csr_bready_reg;
    
    wire        out_valid;
    wire        out_ready;
    wire [2:0]  out_mantissa;
    wire [3:0]  out_exponent;
    wire        out_sign;
    wire        acc_busy = 1'b0;
    wire        acc_done = 1'b0;

    Mnist_w4a8 acc (
        .clk(clk),
        .reset(reset),
        
        .io_axiMaster_ar_valid(axi_arvalid),
        .io_axiMaster_ar_ready(axi_arready),
        .io_axiMaster_ar_payload_addr(axi_araddr),
        .io_axiMaster_ar_payload_id(axi_arid),
        .io_axiMaster_ar_payload_len(axi_arlen),
        
        .io_axiMaster_r_valid(axi_rvalid),
        .io_axiMaster_r_ready(axi_rready),
        .io_axiMaster_r_payload_data(axi_rdata),
        .io_axiMaster_r_payload_id(axi_rid),
        .io_axiMaster_r_payload_last(axi_rlast),
        .io_axiMaster_r_payload_resp(2'b00),
        
        .io_axiMaster_aw_ready(1'b0),
        .io_axiMaster_w_ready(1'b0),
        .io_axiMaster_b_valid(1'b0),
        .io_axiMaster_b_payload_id(4'h0),
        .io_axiMaster_b_payload_resp(2'b00),

        .io_ctrlBus_aw_valid(csr_awvalid_reg),
        .io_ctrlBus_aw_ready(csr_awready),
        .io_ctrlBus_aw_payload_addr(csr_awaddr_reg),
        .io_ctrlBus_aw_payload_prot(3'b000),
        
        .io_ctrlBus_w_valid(csr_wvalid_reg),
        .io_ctrlBus_w_ready(csr_wready),
        .io_ctrlBus_w_payload_data(csr_wdata_reg),
        .io_ctrlBus_w_payload_strb(4'b1111),
        
        .io_ctrlBus_b_valid(csr_bvalid),
        .io_ctrlBus_b_ready(csr_bready_reg),
        
        .io_ctrlBus_ar_valid(1'b0),
        .io_ctrlBus_ar_payload_addr(8'h00),
        .io_ctrlBus_ar_payload_prot(3'b000),
        .io_ctrlBus_r_ready(1'b0),
        
        .io_outStream_stream_valid(out_valid),
        .io_outStream_stream_ready(out_ready),
        .io_outStream_stream_payload_0_mantissa(out_mantissa),
        .io_outStream_stream_payload_0_exponent(out_exponent),
        .io_outStream_stream_payload_0_sign(out_sign)
    );

    // ==========================================
    // 3. Mémoire BRAM Interne
    // ==========================================
    // 4096 mots de 64 bits = 32 Ko. (L'image est a 0x10000, poids a 0x20000)
    // On va mapper virtuellement: 
    // 0x10000 -> index BRAM 0x0000
    // 0x20000 -> index BRAM 0x0800 (offset de 16 Ko)
    reg [63:0] ram [0:4095]; 
    
    reg [7:0] rlen_cnt;
    reg [31:0] raddr_reg;
    reg [3:0] rid_reg;
    reg axi_rvalid_reg;
    reg axi_rlast_reg;
    
    wire [31:0] next_raddr = (axi_arvalid && axi_arready) ? axi_araddr : 
                             (axi_rvalid_reg && axi_rready && (rlen_cnt > 0)) ? (raddr_reg + 8) : 
                             raddr_reg;

    wire [11:0] bram_rd_addr = (next_raddr >= 32'h20000) ? 
                               (next_raddr[14:3] + 12'h800) : 
                               (next_raddr[14:3]);

    reg [63:0] axi_rdata_reg;
    always @(posedge clk) begin
        axi_rdata_reg <= ram[bram_rd_addr];
    end

    always @(posedge clk) begin
        if (reset) begin
            axi_rvalid_reg <= 1'b0;
            axi_rlast_reg <= 1'b0;
            raddr_reg <= 0;
            rlen_cnt <= 0;
            rid_reg <= 0;
        end else begin
            if (axi_arvalid && axi_arready) begin
                raddr_reg <= axi_araddr;
                rlen_cnt <= axi_arlen;
                rid_reg <= axi_arid;
                axi_rvalid_reg <= 1'b1;
                axi_rlast_reg <= (axi_arlen == 0);
            end else if (axi_rvalid_reg && axi_rready) begin
                if (rlen_cnt == 0) begin
                    axi_rvalid_reg <= 1'b0;
                    axi_rlast_reg <= 1'b0;
                end else begin
                    rlen_cnt <= rlen_cnt - 1;
                    raddr_reg <= raddr_reg + 8;
                    axi_rlast_reg <= (rlen_cnt == 1);
                end
            end
        end
    end
    
    assign axi_arready = !axi_rvalid_reg;
    assign axi_rvalid = axi_rvalid_reg;
    assign axi_rdata = axi_rdata_reg;
    assign axi_rlast = axi_rlast_reg;
    assign axi_rid = rid_reg;

    // ==========================================
    // 4. State Machine UART (Bridge L2)
    // ==========================================
    localparam S_IDLE     = 0;
    localparam S_C_ADDR   = 1;
    localparam S_C_VAL    = 2;
    localparam S_C_EXEC_AW = 3;
    localparam S_C_EXEC_W  = 4;
    localparam S_C_EXEC_B  = 5;
    localparam S_W_ADDR   = 6;
    localparam S_W_LEN    = 7;
    localparam S_W_DATA   = 8;
    localparam S_R_WAIT   = 9;
    localparam S_R_SEND   = 10;
    localparam S_S_SEND   = 11;

    reg [3:0]  state = S_IDLE;
    reg [31:0] addr_reg = 0;
    reg [31:0] val_reg = 0;
    reg [31:0] len_reg = 0;
    reg [2:0]  byte_cnt = 0;
    reg [3:0]  logit_cnt = 0;
    
    reg [63:0] w_bram_data = 0;
    reg        w_bram_en = 0;
    
    // Ecriture BRAM
    wire [11:0] bram_wr_addr = (addr_reg >= 32'h20000) ? 
                               (addr_reg[14:3] + 12'h800) : 
                               (addr_reg[14:3]);

    always @(posedge clk) begin
        if (w_bram_en) begin
            ram[bram_wr_addr] <= w_bram_data;
        end
    end
    
    assign out_ready = (state == S_R_WAIT);

    always @(posedge clk) begin
        if (reset) begin
            state <= S_IDLE;
            byte_cnt <= 0;
            w_bram_en <= 0;
            csr_awvalid_reg <= 0;
            csr_wvalid_reg <= 0;
            csr_bready_reg <= 0;
            tx_start_reg <= 0;
        end else begin
            w_bram_en <= 0;
            tx_start_reg <= 0;
            
            if (w_bram_en) begin
                addr_reg <= addr_reg + 8;
            end
            
            case (state)
                S_IDLE: begin
                    byte_cnt <= 0;
                    if (rx_valid) begin
                        if (rx_data == 8'h43) state <= S_C_ADDR; // 'C'
                        else if (rx_data == 8'h57) state <= S_W_ADDR; // 'W'
                        else if (rx_data == 8'h52) begin
                            state <= S_R_WAIT; // 'R'
                            logit_cnt <= 0;
                        end
                        else if (rx_data == 8'h53) begin // 'S'
                            tx_data_reg <= {axi_arvalid, axi_rvalid_reg, csr_awvalid_reg, csr_wvalid_reg, out_valid, acc_done, acc_busy, 1'b1};
                            tx_start_reg <= 1'b1;
                            state <= S_S_SEND;
                        end
                    end
                end
                
                // --- Commande CSR ---
                S_C_ADDR: begin
                    if (rx_valid) begin
                        addr_reg <= {rx_data, addr_reg[31:8]}; // LSB first shift
                        if (byte_cnt == 3) begin
                            byte_cnt <= 0;
                            state <= S_C_VAL;
                        end else byte_cnt <= byte_cnt + 1;
                    end
                end
                S_C_VAL: begin
                    if (rx_valid) begin
                        val_reg <= {rx_data, val_reg[31:8]};
                        if (byte_cnt == 3) begin
                            state <= S_C_EXEC_AW;
                            csr_awaddr_reg <= addr_reg[7:0];
                            csr_wdata_reg <= {rx_data, val_reg[31:8]};
                            csr_awvalid_reg <= 1'b1;
                            csr_wvalid_reg <= 1'b1;
                        end else byte_cnt <= byte_cnt + 1;
                    end
                end
                S_C_EXEC_AW: begin
                    if (csr_awready && csr_awvalid_reg) csr_awvalid_reg <= 1'b0;
                    if (csr_wready && csr_wvalid_reg) csr_wvalid_reg <= 1'b0;
                    
                    if ((csr_awready || !csr_awvalid_reg) && (csr_wready || !csr_wvalid_reg)) begin
                        state <= S_C_EXEC_B;
                    end
                end
                S_C_EXEC_B: begin
                    csr_bready_reg <= 1'b1;
                    if (csr_bvalid && csr_bready_reg) begin
                        csr_bready_reg <= 1'b0;
                        state <= S_IDLE;
                    end
                end
                
                // --- Commande Write BRAM ---
                S_W_ADDR: begin
                    if (rx_valid) begin
                        addr_reg <= {rx_data, addr_reg[31:8]};
                        if (byte_cnt == 3) begin
                            byte_cnt <= 0;
                            state <= S_W_LEN;
                        end else byte_cnt <= byte_cnt + 1;
                    end
                end
                S_W_LEN: begin
                    if (rx_valid) begin
                        len_reg <= {rx_data, len_reg[31:8]};
                        if (byte_cnt == 3) begin
                            byte_cnt <= 0;
                            state <= (len_reg == 0) ? S_IDLE : S_W_DATA;
                        end else byte_cnt <= byte_cnt + 1;
                    end
                end
                S_W_DATA: begin
                    if (rx_valid) begin
                        // Assemble 64-bit word
                        w_bram_data[byte_cnt*8 +: 8] <= rx_data;
                        len_reg <= len_reg - 1;
                        
                        if (byte_cnt == 7 || len_reg == 1) begin // Fin du mot ou fin du flux
                            w_bram_en <= 1'b1;
                            byte_cnt <= 0;
                            if (len_reg == 1) state <= S_IDLE;
                        end else begin
                            byte_cnt <= byte_cnt + 1;
                        end
                    end
                end
                
                // --- Commande Read Stream ---
                S_R_WAIT: begin
                    if (out_valid && tx_ready) begin
                        tx_data_reg <= {out_sign, out_exponent, out_mantissa};
                        tx_start_reg <= 1'b1;
                        state <= S_R_SEND;
                    end
                end
                S_R_SEND: begin
                    if (tx_ready && !tx_start_reg) begin
                        if (logit_cnt == 9) begin
                            state <= S_IDLE;
                        end else begin
                            logit_cnt <= logit_cnt + 1;
                            state <= S_R_WAIT;
                        end
                    end
                end
                S_S_SEND: begin
                    if (tx_ready && !tx_start_reg) begin
                        state <= S_IDLE;
                    end
                end
            endcase
        end
    end

endmodule
