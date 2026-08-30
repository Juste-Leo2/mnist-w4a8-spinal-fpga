// Generator : SpinalHDL v1.14.2    git head : 78f29dc66110fc099a777992b6daa2f803ab445e
// Component : Accelerator
// Git hash  : af91bd3b742761012f3c12e9e224af11c27fd3c0

`timescale 1ns/1ps

module Mnist_w4a8 (
  output wire          io_axiMaster_aw_valid,
  input  wire          io_axiMaster_aw_ready,
  output wire [31:0]   io_axiMaster_aw_payload_addr,
  output wire [3:0]    io_axiMaster_aw_payload_id,
  output wire [3:0]    io_axiMaster_aw_payload_region,
  output wire [7:0]    io_axiMaster_aw_payload_len,
  output wire [2:0]    io_axiMaster_aw_payload_size,
  output wire [1:0]    io_axiMaster_aw_payload_burst,
  output wire [0:0]    io_axiMaster_aw_payload_lock,
  output wire [3:0]    io_axiMaster_aw_payload_cache,
  output wire [3:0]    io_axiMaster_aw_payload_qos,
  output wire [2:0]    io_axiMaster_aw_payload_prot,
  output wire          io_axiMaster_w_valid,
  input  wire          io_axiMaster_w_ready,
  output wire [63:0]   io_axiMaster_w_payload_data,
  output wire [7:0]    io_axiMaster_w_payload_strb,
  output wire          io_axiMaster_w_payload_last,
  input  wire          io_axiMaster_b_valid,
  output wire          io_axiMaster_b_ready,
  input  wire [3:0]    io_axiMaster_b_payload_id,
  input  wire [1:0]    io_axiMaster_b_payload_resp,
  output wire          io_axiMaster_ar_valid,
  input  wire          io_axiMaster_ar_ready,
  output wire [31:0]   io_axiMaster_ar_payload_addr,
  output wire [3:0]    io_axiMaster_ar_payload_id,
  output wire [3:0]    io_axiMaster_ar_payload_region,
  output wire [7:0]    io_axiMaster_ar_payload_len,
  output wire [2:0]    io_axiMaster_ar_payload_size,
  output wire [1:0]    io_axiMaster_ar_payload_burst,
  output wire [0:0]    io_axiMaster_ar_payload_lock,
  output wire [3:0]    io_axiMaster_ar_payload_cache,
  output wire [3:0]    io_axiMaster_ar_payload_qos,
  output wire [2:0]    io_axiMaster_ar_payload_prot,
  input  wire          io_axiMaster_r_valid,
  output wire          io_axiMaster_r_ready,
  input  wire [63:0]   io_axiMaster_r_payload_data,
  input  wire [3:0]    io_axiMaster_r_payload_id,
  input  wire [1:0]    io_axiMaster_r_payload_resp,
  input  wire          io_axiMaster_r_payload_last,
  input  wire          io_ctrlBus_aw_valid,
  output wire          io_ctrlBus_aw_ready,
  input  wire [7:0]    io_ctrlBus_aw_payload_addr,
  input  wire [2:0]    io_ctrlBus_aw_payload_prot,
  input  wire          io_ctrlBus_w_valid,
  output wire          io_ctrlBus_w_ready,
  input  wire [31:0]   io_ctrlBus_w_payload_data,
  input  wire [3:0]    io_ctrlBus_w_payload_strb,
  output wire          io_ctrlBus_b_valid,
  input  wire          io_ctrlBus_b_ready,
  output wire [1:0]    io_ctrlBus_b_payload_resp,
  input  wire          io_ctrlBus_ar_valid,
  output wire          io_ctrlBus_ar_ready,
  input  wire [7:0]    io_ctrlBus_ar_payload_addr,
  input  wire [2:0]    io_ctrlBus_ar_payload_prot,
  output wire          io_ctrlBus_r_valid,
  input  wire          io_ctrlBus_r_ready,
  output wire [31:0]   io_ctrlBus_r_payload_data,
  output wire [1:0]    io_ctrlBus_r_payload_resp,
  output wire          io_outStream_stream_valid,
  input  wire          io_outStream_stream_ready,
  output wire [2:0]    io_outStream_stream_payload_0_mantissa,
  output wire [3:0]    io_outStream_stream_payload_0_exponent,
  output wire          io_outStream_stream_payload_0_sign,
  input  wire          clk,
  input  wire          reset
);

  wire       [31:0]   model_io_imgBaseAddress;
  wire                model_io_weightResident;
  wire                model_io_weightPrefetch;
  wire                model_io_start_ready;
  wire                model_io_axiMaster_ar_valid;
  wire       [31:0]   model_io_axiMaster_ar_payload_addr;
  wire       [3:0]    model_io_axiMaster_ar_payload_id;
  wire       [3:0]    model_io_axiMaster_ar_payload_region;
  wire       [7:0]    model_io_axiMaster_ar_payload_len;
  wire       [2:0]    model_io_axiMaster_ar_payload_size;
  wire       [1:0]    model_io_axiMaster_ar_payload_burst;
  wire       [0:0]    model_io_axiMaster_ar_payload_lock;
  wire       [3:0]    model_io_axiMaster_ar_payload_cache;
  wire       [3:0]    model_io_axiMaster_ar_payload_qos;
  wire       [2:0]    model_io_axiMaster_ar_payload_prot;
  wire                model_io_axiMaster_r_ready;
  wire                model_io_outStream_stream_valid;
  wire       [2:0]    model_io_outStream_stream_payload_0_mantissa;
  wire       [3:0]    model_io_outStream_stream_payload_0_exponent;
  wire                model_io_outStream_stream_payload_0_sign;
  wire                model_io_busy;
  wire                model_io_done;
  wire                ctrlFactory_readErrorFlag;
  wire                ctrlFactory_writeErrorFlag;
  wire                ctrlFactory_readHaltRequest;
  wire                ctrlFactory_writeHaltRequest;
  wire                ctrlFactory_writeJoinEvent_valid;
  wire                ctrlFactory_writeJoinEvent_ready;
  wire                ctrlFactory_writeOccur;
  reg        [1:0]    ctrlFactory_writeRsp_resp;
  wire                ctrlFactory_writeJoinEvent_translated_valid;
  wire                ctrlFactory_writeJoinEvent_translated_ready;
  wire       [1:0]    ctrlFactory_writeJoinEvent_translated_payload_resp;
  wire                _zz_ctrlFactory_writeJoinEvent_translated_ready;
  wire                ctrlFactory_writeJoinEvent_translated_haltWhen_valid;
  wire                ctrlFactory_writeJoinEvent_translated_haltWhen_ready;
  wire       [1:0]    ctrlFactory_writeJoinEvent_translated_haltWhen_payload_resp;
  wire                ctrlFactory_writeJoinEvent_translated_haltWhen_halfPipe_valid;
  wire                ctrlFactory_writeJoinEvent_translated_haltWhen_halfPipe_ready;
  wire       [1:0]    ctrlFactory_writeJoinEvent_translated_haltWhen_halfPipe_payload_resp;
  reg                 ctrlFactory_writeJoinEvent_translated_haltWhen_rValid;
  wire                ctrlFactory_writeJoinEvent_translated_haltWhen_halfPipe_fire;
  reg        [1:0]    ctrlFactory_writeJoinEvent_translated_haltWhen_rData_resp;
  wire                ctrlFactory_readDataStage_valid;
  wire                ctrlFactory_readDataStage_ready;
  wire       [7:0]    ctrlFactory_readDataStage_payload_addr;
  wire       [2:0]    ctrlFactory_readDataStage_payload_prot;
  reg                 io_ctrlBus_ar_rValid;
  wire                ctrlFactory_readDataStage_fire;
  reg        [7:0]    io_ctrlBus_ar_rData_addr;
  reg        [2:0]    io_ctrlBus_ar_rData_prot;
  reg        [31:0]   ctrlFactory_readRsp_data;
  reg        [1:0]    ctrlFactory_readRsp_resp;
  wire                _zz_ctrlFactory_readDataStage_ready;
  wire                ctrlFactory_readDataStage_haltWhen_valid;
  wire                ctrlFactory_readDataStage_haltWhen_ready;
  wire       [7:0]    ctrlFactory_readDataStage_haltWhen_payload_addr;
  wire       [2:0]    ctrlFactory_readDataStage_haltWhen_payload_prot;
  wire                ctrlFactory_readDataStage_haltWhen_translated_valid;
  wire                ctrlFactory_readDataStage_haltWhen_translated_ready;
  wire       [31:0]   ctrlFactory_readDataStage_haltWhen_translated_payload_data;
  wire       [1:0]    ctrlFactory_readDataStage_haltWhen_translated_payload_resp;
  wire       [7:0]    ctrlFactory_readAddressMasked;
  wire       [7:0]    ctrlFactory_writeAddressMasked;
  wire                ctrlFactory_readOccur;
  reg                 startPending;
  wire                startEvent_valid;
  wire                startEvent_ready;
  wire                startEvent_fire;
  reg        [31:0]   imgAddrReg;
  reg        [31:0]   weightsAddrReg;
  reg        [7:0]    runReg;
  wire                runActive;
  reg        [31:0]   tileCntReg;
  reg        [31:0]   imgBaseOffset;
  reg        [7:0]    _zz_ctrlFactory_readRsp_data;
  reg                 when_Accelerator_l174;

  Sequential model (
    .io_start_valid                         (startEvent_valid                                 ), //i
    .io_start_ready                         (model_io_start_ready                             ), //o
    .io_imgBaseAddress                      (model_io_imgBaseAddress[31:0]                    ), //i
    .io_weightsBaseAddress                  (weightsAddrReg[31:0]                             ), //i
    .io_weightResident                      (model_io_weightResident                          ), //i
    .io_weightReload                        (when_Accelerator_l174                            ), //i
    .io_weightPrefetch                      (model_io_weightPrefetch                          ), //i
    .io_axiMaster_ar_valid                  (model_io_axiMaster_ar_valid                      ), //o
    .io_axiMaster_ar_ready                  (io_axiMaster_ar_ready                            ), //i
    .io_axiMaster_ar_payload_addr           (model_io_axiMaster_ar_payload_addr[31:0]         ), //o
    .io_axiMaster_ar_payload_id             (model_io_axiMaster_ar_payload_id[3:0]            ), //o
    .io_axiMaster_ar_payload_region         (model_io_axiMaster_ar_payload_region[3:0]        ), //o
    .io_axiMaster_ar_payload_len            (model_io_axiMaster_ar_payload_len[7:0]           ), //o
    .io_axiMaster_ar_payload_size           (model_io_axiMaster_ar_payload_size[2:0]          ), //o
    .io_axiMaster_ar_payload_burst          (model_io_axiMaster_ar_payload_burst[1:0]         ), //o
    .io_axiMaster_ar_payload_lock           (model_io_axiMaster_ar_payload_lock               ), //o
    .io_axiMaster_ar_payload_cache          (model_io_axiMaster_ar_payload_cache[3:0]         ), //o
    .io_axiMaster_ar_payload_qos            (model_io_axiMaster_ar_payload_qos[3:0]           ), //o
    .io_axiMaster_ar_payload_prot           (model_io_axiMaster_ar_payload_prot[2:0]          ), //o
    .io_axiMaster_r_valid                   (io_axiMaster_r_valid                             ), //i
    .io_axiMaster_r_ready                   (model_io_axiMaster_r_ready                       ), //o
    .io_axiMaster_r_payload_data            (io_axiMaster_r_payload_data[63:0]                ), //i
    .io_axiMaster_r_payload_id              (io_axiMaster_r_payload_id[3:0]                   ), //i
    .io_axiMaster_r_payload_resp            (io_axiMaster_r_payload_resp[1:0]                 ), //i
    .io_axiMaster_r_payload_last            (io_axiMaster_r_payload_last                      ), //i
    .io_outStream_stream_valid              (model_io_outStream_stream_valid                  ), //o
    .io_outStream_stream_ready              (io_outStream_stream_ready                        ), //i
    .io_outStream_stream_payload_0_mantissa (model_io_outStream_stream_payload_0_mantissa[2:0]), //o
    .io_outStream_stream_payload_0_exponent (model_io_outStream_stream_payload_0_exponent[3:0]), //o
    .io_outStream_stream_payload_0_sign     (model_io_outStream_stream_payload_0_sign         ), //o
    .io_busy                                (model_io_busy                                    ), //o
    .io_done                                (model_io_done                                    ), //o
    .clk                                    (clk                                              ), //i
    .reset                                  (reset                                            )  //i
  );
  assign io_axiMaster_ar_valid = model_io_axiMaster_ar_valid;
  assign io_axiMaster_ar_payload_addr = model_io_axiMaster_ar_payload_addr;
  assign io_axiMaster_ar_payload_id = model_io_axiMaster_ar_payload_id;
  assign io_axiMaster_ar_payload_region = model_io_axiMaster_ar_payload_region;
  assign io_axiMaster_ar_payload_len = model_io_axiMaster_ar_payload_len;
  assign io_axiMaster_ar_payload_size = model_io_axiMaster_ar_payload_size;
  assign io_axiMaster_ar_payload_burst = model_io_axiMaster_ar_payload_burst;
  assign io_axiMaster_ar_payload_lock = model_io_axiMaster_ar_payload_lock;
  assign io_axiMaster_ar_payload_cache = model_io_axiMaster_ar_payload_cache;
  assign io_axiMaster_ar_payload_qos = model_io_axiMaster_ar_payload_qos;
  assign io_axiMaster_ar_payload_prot = model_io_axiMaster_ar_payload_prot;
  assign io_axiMaster_r_ready = model_io_axiMaster_r_ready;
  assign io_axiMaster_aw_valid = 1'b0;
  assign io_axiMaster_aw_payload_addr = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  assign io_axiMaster_aw_payload_id = 4'bxxxx;
  assign io_axiMaster_aw_payload_region = 4'bxxxx;
  assign io_axiMaster_aw_payload_len = 8'bxxxxxxxx;
  assign io_axiMaster_aw_payload_size = 3'bxxx;
  assign io_axiMaster_aw_payload_burst = 2'bxx;
  assign io_axiMaster_aw_payload_lock = 1'bx;
  assign io_axiMaster_aw_payload_cache = 4'bxxxx;
  assign io_axiMaster_aw_payload_qos = 4'bxxxx;
  assign io_axiMaster_aw_payload_prot = 3'bxxx;
  assign io_axiMaster_w_valid = 1'b0;
  assign io_axiMaster_w_payload_data = 64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
  assign io_axiMaster_w_payload_strb = 8'bxxxxxxxx;
  assign io_axiMaster_w_payload_last = 1'bx;
  assign io_axiMaster_b_ready = 1'b0;
  assign io_outStream_stream_valid = model_io_outStream_stream_valid;
  assign io_outStream_stream_payload_0_mantissa = model_io_outStream_stream_payload_0_mantissa;
  assign io_outStream_stream_payload_0_exponent = model_io_outStream_stream_payload_0_exponent;
  assign io_outStream_stream_payload_0_sign = model_io_outStream_stream_payload_0_sign;
  assign ctrlFactory_readErrorFlag = 1'b0;
  assign ctrlFactory_writeErrorFlag = 1'b0;
  assign ctrlFactory_readHaltRequest = 1'b0;
  assign ctrlFactory_writeHaltRequest = 1'b0;
  assign ctrlFactory_writeOccur = (ctrlFactory_writeJoinEvent_valid && ctrlFactory_writeJoinEvent_ready);
  assign ctrlFactory_writeJoinEvent_valid = (io_ctrlBus_aw_valid && io_ctrlBus_w_valid);
  assign io_ctrlBus_aw_ready = ctrlFactory_writeOccur;
  assign io_ctrlBus_w_ready = ctrlFactory_writeOccur;
  assign ctrlFactory_writeJoinEvent_translated_valid = ctrlFactory_writeJoinEvent_valid;
  assign ctrlFactory_writeJoinEvent_ready = ctrlFactory_writeJoinEvent_translated_ready;
  assign ctrlFactory_writeJoinEvent_translated_payload_resp = ctrlFactory_writeRsp_resp;
  assign _zz_ctrlFactory_writeJoinEvent_translated_ready = (! ctrlFactory_writeHaltRequest);
  assign ctrlFactory_writeJoinEvent_translated_haltWhen_valid = (ctrlFactory_writeJoinEvent_translated_valid && _zz_ctrlFactory_writeJoinEvent_translated_ready);
  assign ctrlFactory_writeJoinEvent_translated_ready = (ctrlFactory_writeJoinEvent_translated_haltWhen_ready && _zz_ctrlFactory_writeJoinEvent_translated_ready);
  assign ctrlFactory_writeJoinEvent_translated_haltWhen_payload_resp = ctrlFactory_writeJoinEvent_translated_payload_resp;
  assign ctrlFactory_writeJoinEvent_translated_haltWhen_halfPipe_fire = (ctrlFactory_writeJoinEvent_translated_haltWhen_halfPipe_valid && ctrlFactory_writeJoinEvent_translated_haltWhen_halfPipe_ready);
  assign ctrlFactory_writeJoinEvent_translated_haltWhen_ready = (! ctrlFactory_writeJoinEvent_translated_haltWhen_rValid);
  assign ctrlFactory_writeJoinEvent_translated_haltWhen_halfPipe_valid = ctrlFactory_writeJoinEvent_translated_haltWhen_rValid;
  assign ctrlFactory_writeJoinEvent_translated_haltWhen_halfPipe_payload_resp = ctrlFactory_writeJoinEvent_translated_haltWhen_rData_resp;
  assign io_ctrlBus_b_valid = ctrlFactory_writeJoinEvent_translated_haltWhen_halfPipe_valid;
  assign ctrlFactory_writeJoinEvent_translated_haltWhen_halfPipe_ready = io_ctrlBus_b_ready;
  assign io_ctrlBus_b_payload_resp = ctrlFactory_writeJoinEvent_translated_haltWhen_halfPipe_payload_resp;
  assign ctrlFactory_readDataStage_fire = (ctrlFactory_readDataStage_valid && ctrlFactory_readDataStage_ready);
  assign io_ctrlBus_ar_ready = (! io_ctrlBus_ar_rValid);
  assign ctrlFactory_readDataStage_valid = io_ctrlBus_ar_rValid;
  assign ctrlFactory_readDataStage_payload_addr = io_ctrlBus_ar_rData_addr;
  assign ctrlFactory_readDataStage_payload_prot = io_ctrlBus_ar_rData_prot;
  assign _zz_ctrlFactory_readDataStage_ready = (! ctrlFactory_readHaltRequest);
  assign ctrlFactory_readDataStage_haltWhen_valid = (ctrlFactory_readDataStage_valid && _zz_ctrlFactory_readDataStage_ready);
  assign ctrlFactory_readDataStage_ready = (ctrlFactory_readDataStage_haltWhen_ready && _zz_ctrlFactory_readDataStage_ready);
  assign ctrlFactory_readDataStage_haltWhen_payload_addr = ctrlFactory_readDataStage_payload_addr;
  assign ctrlFactory_readDataStage_haltWhen_payload_prot = ctrlFactory_readDataStage_payload_prot;
  assign ctrlFactory_readDataStage_haltWhen_translated_valid = ctrlFactory_readDataStage_haltWhen_valid;
  assign ctrlFactory_readDataStage_haltWhen_ready = ctrlFactory_readDataStage_haltWhen_translated_ready;
  assign ctrlFactory_readDataStage_haltWhen_translated_payload_data = ctrlFactory_readRsp_data;
  assign ctrlFactory_readDataStage_haltWhen_translated_payload_resp = ctrlFactory_readRsp_resp;
  assign io_ctrlBus_r_valid = ctrlFactory_readDataStage_haltWhen_translated_valid;
  assign ctrlFactory_readDataStage_haltWhen_translated_ready = io_ctrlBus_r_ready;
  assign io_ctrlBus_r_payload_data = ctrlFactory_readDataStage_haltWhen_translated_payload_data;
  assign io_ctrlBus_r_payload_resp = ctrlFactory_readDataStage_haltWhen_translated_payload_resp;
  always @(*) begin
    if(ctrlFactory_writeErrorFlag) begin
      ctrlFactory_writeRsp_resp = 2'b10;
    end else begin
      ctrlFactory_writeRsp_resp = 2'b00;
    end
  end

  always @(*) begin
    if(ctrlFactory_readErrorFlag) begin
      ctrlFactory_readRsp_resp = 2'b10;
    end else begin
      ctrlFactory_readRsp_resp = 2'b00;
    end
  end

  always @(*) begin
    ctrlFactory_readRsp_data = 32'h0;
    case(ctrlFactory_readAddressMasked)
      8'h04 : begin
        ctrlFactory_readRsp_data[0 : 0] = io_outStream_stream_valid;
        ctrlFactory_readRsp_data[1 : 1] = model_io_busy;
        ctrlFactory_readRsp_data[2 : 2] = runActive;
      end
      8'h08 : begin
        ctrlFactory_readRsp_data[31 : 0] = imgAddrReg;
      end
      8'h0c : begin
        ctrlFactory_readRsp_data[31 : 0] = weightsAddrReg;
      end
      8'h1c : begin
        ctrlFactory_readRsp_data[7 : 0] = runReg;
      end
      8'h18 : begin
        ctrlFactory_readRsp_data[31 : 0] = tileCntReg;
      end
      8'h10 : begin
        ctrlFactory_readRsp_data[7 : 0] = _zz_ctrlFactory_readRsp_data;
      end
      default : begin
      end
    endcase
  end

  assign ctrlFactory_readAddressMasked = (ctrlFactory_readDataStage_payload_addr & (~ 8'h03));
  assign ctrlFactory_writeAddressMasked = (io_ctrlBus_aw_payload_addr & (~ 8'h03));
  assign ctrlFactory_readOccur = (io_ctrlBus_r_valid && io_ctrlBus_r_ready);
  assign startEvent_valid = startPending;
  assign startEvent_fire = (startEvent_valid && startEvent_ready);
  assign startEvent_ready = model_io_start_ready;
  assign runActive = runReg[0];
  assign model_io_imgBaseAddress = (imgAddrReg + imgBaseOffset);
  assign model_io_weightResident = _zz_ctrlFactory_readRsp_data[0];
  assign model_io_weightPrefetch = _zz_ctrlFactory_readRsp_data[1];
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      ctrlFactory_writeJoinEvent_translated_haltWhen_rValid <= 1'b0;
      io_ctrlBus_ar_rValid <= 1'b0;
      startPending <= 1'b0;
      imgAddrReg <= 32'h0;
      weightsAddrReg <= 32'h0;
      runReg <= 8'h0;
      tileCntReg <= 32'h0;
      imgBaseOffset <= 32'h0;
      _zz_ctrlFactory_readRsp_data <= 8'h0;
      when_Accelerator_l174 <= 1'b0;
    end else begin
      if(ctrlFactory_writeJoinEvent_translated_haltWhen_valid) begin
        ctrlFactory_writeJoinEvent_translated_haltWhen_rValid <= 1'b1;
      end
      if(ctrlFactory_writeJoinEvent_translated_haltWhen_halfPipe_fire) begin
        ctrlFactory_writeJoinEvent_translated_haltWhen_rValid <= 1'b0;
      end
      if(io_ctrlBus_ar_valid) begin
        io_ctrlBus_ar_rValid <= 1'b1;
      end
      if(ctrlFactory_readDataStage_fire) begin
        io_ctrlBus_ar_rValid <= 1'b0;
      end
      if(startEvent_fire) begin
        startPending <= 1'b0;
      end
      if(model_io_done) begin
        tileCntReg <= (tileCntReg + 32'h00000001);
        if(runActive) begin
          startPending <= 1'b1;
          imgBaseOffset <= (imgBaseOffset + 32'h00000310);
        end
      end
      if(when_Accelerator_l174) begin
        when_Accelerator_l174 <= 1'b0;
      end
      case(ctrlFactory_writeAddressMasked)
        8'h0 : begin
          if(ctrlFactory_writeOccur) begin
            startPending <= 1'b1;
          end
        end
        8'h08 : begin
          if(ctrlFactory_writeOccur) begin
            imgAddrReg <= io_ctrlBus_w_payload_data[31 : 0];
          end
        end
        8'h0c : begin
          if(ctrlFactory_writeOccur) begin
            weightsAddrReg <= io_ctrlBus_w_payload_data[31 : 0];
          end
        end
        8'h1c : begin
          if(ctrlFactory_writeOccur) begin
            runReg <= io_ctrlBus_w_payload_data[7 : 0];
          end
        end
        8'h10 : begin
          if(ctrlFactory_writeOccur) begin
            _zz_ctrlFactory_readRsp_data <= io_ctrlBus_w_payload_data[7 : 0];
          end
        end
        8'h14 : begin
          if(ctrlFactory_writeOccur) begin
            when_Accelerator_l174 <= 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(ctrlFactory_writeJoinEvent_translated_haltWhen_ready) begin
      ctrlFactory_writeJoinEvent_translated_haltWhen_rData_resp <= ctrlFactory_writeJoinEvent_translated_haltWhen_payload_resp;
    end
    if(io_ctrlBus_ar_ready) begin
      io_ctrlBus_ar_rData_addr <= io_ctrlBus_ar_payload_addr;
      io_ctrlBus_ar_rData_prot <= io_ctrlBus_ar_payload_prot;
    end
  end


endmodule

module Sequential (
  input  wire          io_start_valid,
  output wire          io_start_ready,
  input  wire [31:0]   io_imgBaseAddress,
  input  wire [31:0]   io_weightsBaseAddress,
  input  wire          io_weightResident,
  input  wire          io_weightReload,
  input  wire          io_weightPrefetch,
  output wire          io_axiMaster_ar_valid,
  input  wire          io_axiMaster_ar_ready,
  output wire [31:0]   io_axiMaster_ar_payload_addr,
  output wire [3:0]    io_axiMaster_ar_payload_id,
  output wire [3:0]    io_axiMaster_ar_payload_region,
  output wire [7:0]    io_axiMaster_ar_payload_len,
  output wire [2:0]    io_axiMaster_ar_payload_size,
  output wire [1:0]    io_axiMaster_ar_payload_burst,
  output wire [0:0]    io_axiMaster_ar_payload_lock,
  output wire [3:0]    io_axiMaster_ar_payload_cache,
  output wire [3:0]    io_axiMaster_ar_payload_qos,
  output wire [2:0]    io_axiMaster_ar_payload_prot,
  input  wire          io_axiMaster_r_valid,
  output wire          io_axiMaster_r_ready,
  input  wire [63:0]   io_axiMaster_r_payload_data,
  input  wire [3:0]    io_axiMaster_r_payload_id,
  input  wire [1:0]    io_axiMaster_r_payload_resp,
  input  wire          io_axiMaster_r_payload_last,
  output wire          io_outStream_stream_valid,
  input  wire          io_outStream_stream_ready,
  output wire [2:0]    io_outStream_stream_payload_0_mantissa,
  output wire [3:0]    io_outStream_stream_payload_0_exponent,
  output wire          io_outStream_stream_payload_0_sign,
  output wire          io_busy,
  output wire          io_done,
  input  wire          clk,
  input  wire          reset
);

  wire                io_start_fork_io_outputs_1_ready;
  wire                io_start_fork_io_outputs_2_ready;
  wire                io_start_fork_io_outputs_3_ready;
  wire                io_start_fork_io_outputs_4_ready;
  wire       [31:0]   dmaImg_io_cmd_payload_baseAddress;
  wire       [15:0]   dmaImg_io_cmd_payload_patchHeight;
  wire                imgDoubleBuffer_io_reArm;
  wire                imgStreamer_io_reArm;
  wire       [31:0]   dMAReader_5_io_cmd_payload_address;
  wire                streamDoubleBuffer_7_io_reArm;
  wire       [31:0]   dMAReader_6_io_cmd_payload_address;
  wire       [31:0]   dMAReader_7_io_cmd_payload_address;
  wire                streamDoubleBuffer_9_io_reArm;
  wire       [31:0]   dMAReader_8_io_cmd_payload_address;
  wire                io_start_fork_io_input_ready;
  wire                io_start_fork_io_outputs_0_valid;
  wire                io_start_fork_io_outputs_1_valid;
  wire                io_start_fork_io_outputs_2_valid;
  wire                io_start_fork_io_outputs_3_valid;
  wire                io_start_fork_io_outputs_4_valid;
  wire                dmaImg_io_cmd_ready;
  wire                dmaImg_io_axiMaster_ar_valid;
  wire       [31:0]   dmaImg_io_axiMaster_ar_payload_addr;
  wire       [0:0]    dmaImg_io_axiMaster_ar_payload_id;
  wire       [3:0]    dmaImg_io_axiMaster_ar_payload_region;
  wire       [7:0]    dmaImg_io_axiMaster_ar_payload_len;
  wire       [2:0]    dmaImg_io_axiMaster_ar_payload_size;
  wire       [1:0]    dmaImg_io_axiMaster_ar_payload_burst;
  wire       [0:0]    dmaImg_io_axiMaster_ar_payload_lock;
  wire       [3:0]    dmaImg_io_axiMaster_ar_payload_cache;
  wire       [3:0]    dmaImg_io_axiMaster_ar_payload_qos;
  wire       [2:0]    dmaImg_io_axiMaster_ar_payload_prot;
  wire                dmaImg_io_axiMaster_r_ready;
  wire                dmaImg_io_outStream_stream_valid;
  wire       [7:0]    dmaImg_io_outStream_stream_payload_0;
  wire                imgDoubleBuffer_io_streamIn_ready;
  wire       [7:0]    imgDoubleBuffer_io_readData_0;
  wire                imgDoubleBuffer_io_tileReady;
  wire                imgDoubleBuffer_io_loadCanAccept;
  wire                imgDoubleBuffer_io_tileFilled;
  wire                imgDoubleBuffer_io_refreshSettled;
  wire       [9:0]    imgStreamer_io_readAddr;
  wire                imgStreamer_io_nextTile;
  wire                imgStreamer_io_streamOut_valid;
  wire       [7:0]    imgStreamer_io_streamOut_payload_0;
  wire                dMAReader_5_io_cmd_ready;
  wire                dMAReader_5_io_axiMaster_ar_valid;
  wire       [31:0]   dMAReader_5_io_axiMaster_ar_payload_addr;
  wire       [0:0]    dMAReader_5_io_axiMaster_ar_payload_id;
  wire       [3:0]    dMAReader_5_io_axiMaster_ar_payload_region;
  wire       [7:0]    dMAReader_5_io_axiMaster_ar_payload_len;
  wire       [2:0]    dMAReader_5_io_axiMaster_ar_payload_size;
  wire       [1:0]    dMAReader_5_io_axiMaster_ar_payload_burst;
  wire       [0:0]    dMAReader_5_io_axiMaster_ar_payload_lock;
  wire       [3:0]    dMAReader_5_io_axiMaster_ar_payload_cache;
  wire       [3:0]    dMAReader_5_io_axiMaster_ar_payload_qos;
  wire       [2:0]    dMAReader_5_io_axiMaster_ar_payload_prot;
  wire                dMAReader_5_io_axiMaster_r_ready;
  wire                dMAReader_5_io_outStream_stream_valid;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_0;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_1;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_2;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_3;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_4;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_5;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_6;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_7;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_8;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_9;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_10;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_11;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_12;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_13;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_14;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_15;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_16;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_17;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_18;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_19;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_20;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_21;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_22;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_23;
  wire       [3:0]    dMAReader_5_io_outStream_stream_payload_24;
  wire                streamDoubleBuffer_7_io_streamIn_ready;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_0;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_1;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_2;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_3;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_4;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_5;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_6;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_7;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_8;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_9;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_10;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_11;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_12;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_13;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_14;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_15;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_16;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_17;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_18;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_19;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_20;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_21;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_22;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_23;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_24;
  wire                streamDoubleBuffer_7_io_tileReady;
  wire                streamDoubleBuffer_7_io_loadCanAccept;
  wire                streamDoubleBuffer_7_io_tileFilled;
  wire                streamDoubleBuffer_7_io_refreshSettled;
  wire       [0:0]    doubleBufferStreamer_5_io_readAddr;
  wire                doubleBufferStreamer_5_io_nextTile;
  wire                doubleBufferStreamer_5_io_streamOut_valid;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_0;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_1;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_2;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_3;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_4;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_5;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_6;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_7;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_8;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_9;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_10;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_11;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_12;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_13;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_14;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_15;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_16;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_17;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_18;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_19;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_20;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_21;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_22;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_23;
  wire       [3:0]    doubleBufferStreamer_5_io_streamOut_payload_24;
  wire                dMAReader_6_io_cmd_ready;
  wire                dMAReader_6_io_axiMaster_ar_valid;
  wire       [31:0]   dMAReader_6_io_axiMaster_ar_payload_addr;
  wire       [0:0]    dMAReader_6_io_axiMaster_ar_payload_id;
  wire       [3:0]    dMAReader_6_io_axiMaster_ar_payload_region;
  wire       [7:0]    dMAReader_6_io_axiMaster_ar_payload_len;
  wire       [2:0]    dMAReader_6_io_axiMaster_ar_payload_size;
  wire       [1:0]    dMAReader_6_io_axiMaster_ar_payload_burst;
  wire       [0:0]    dMAReader_6_io_axiMaster_ar_payload_lock;
  wire       [3:0]    dMAReader_6_io_axiMaster_ar_payload_cache;
  wire       [3:0]    dMAReader_6_io_axiMaster_ar_payload_qos;
  wire       [2:0]    dMAReader_6_io_axiMaster_ar_payload_prot;
  wire                dMAReader_6_io_axiMaster_r_ready;
  wire                dMAReader_6_io_outStream_stream_valid;
  wire       [15:0]   dMAReader_6_io_outStream_stream_payload_0;
  wire                streamDoubleBuffer_8_io_streamIn_ready;
  wire       [15:0]   streamDoubleBuffer_8_io_readData_0;
  wire                streamDoubleBuffer_8_io_tileReady;
  wire                streamDoubleBuffer_8_io_loadCanAccept;
  wire                streamDoubleBuffer_8_io_tileFilled;
  wire                streamDoubleBuffer_8_io_refreshSettled;
  wire       [0:0]    doubleBufferStreamer_6_io_readAddr;
  wire                doubleBufferStreamer_6_io_nextTile;
  wire                doubleBufferStreamer_6_io_streamOut_valid;
  wire       [15:0]   doubleBufferStreamer_6_io_streamOut_payload_0;
  wire                castOp_2_io_a_stream_ready;
  wire                castOp_2_io_c_stream_valid;
  wire       [7:0]    castOp_2_io_c_stream_payload_0;
  wire       [7:0]    castOp_2_io_c_stream_payload_1;
  wire       [7:0]    castOp_2_io_c_stream_payload_2;
  wire       [7:0]    castOp_2_io_c_stream_payload_3;
  wire       [7:0]    castOp_2_io_c_stream_payload_4;
  wire       [7:0]    castOp_2_io_c_stream_payload_5;
  wire       [7:0]    castOp_2_io_c_stream_payload_6;
  wire       [7:0]    castOp_2_io_c_stream_payload_7;
  wire       [7:0]    castOp_2_io_c_stream_payload_8;
  wire       [7:0]    castOp_2_io_c_stream_payload_9;
  wire       [7:0]    castOp_2_io_c_stream_payload_10;
  wire       [7:0]    castOp_2_io_c_stream_payload_11;
  wire       [7:0]    castOp_2_io_c_stream_payload_12;
  wire       [7:0]    castOp_2_io_c_stream_payload_13;
  wire       [7:0]    castOp_2_io_c_stream_payload_14;
  wire       [7:0]    castOp_2_io_c_stream_payload_15;
  wire       [7:0]    castOp_2_io_c_stream_payload_16;
  wire       [7:0]    castOp_2_io_c_stream_payload_17;
  wire       [7:0]    castOp_2_io_c_stream_payload_18;
  wire       [7:0]    castOp_2_io_c_stream_payload_19;
  wire       [7:0]    castOp_2_io_c_stream_payload_20;
  wire       [7:0]    castOp_2_io_c_stream_payload_21;
  wire       [7:0]    castOp_2_io_c_stream_payload_22;
  wire       [7:0]    castOp_2_io_c_stream_payload_23;
  wire       [7:0]    castOp_2_io_c_stream_payload_24;
  wire                conv2DLayer_1_io_x_stream_ready;
  wire                conv2DLayer_1_io_w_stream_ready;
  wire                conv2DLayer_1_io_b_stream_ready;
  wire                conv2DLayer_1_io_y_stream_valid;
  wire       [15:0]   conv2DLayer_1_io_y_stream_payload_0;
  wire                reLUOp_1_io_x_stream_ready;
  wire                reLUOp_1_io_y_stream_valid;
  wire       [15:0]   reLUOp_1_io_y_stream_payload_0;
  wire                maxPool2DOp_1_io_a_stream_ready;
  wire                maxPool2DOp_1_io_c_stream_valid;
  wire       [15:0]   maxPool2DOp_1_io_c_stream_payload_0;
  wire       [15:0]   maxPool2DOp_1_io_c_stream_payload_1;
  wire                repackOp_8_io_a_stream_ready;
  wire                repackOp_8_io_c_stream_valid;
  wire       [15:0]   repackOp_8_io_c_stream_payload_0;
  wire                repackOp_8_io_isEmpty;
  wire                castOp_3_io_a_stream_ready;
  wire                castOp_3_io_c_stream_valid;
  wire       [2:0]    castOp_3_io_c_stream_payload_0_mantissa;
  wire       [3:0]    castOp_3_io_c_stream_payload_0_exponent;
  wire                castOp_3_io_c_stream_payload_0_sign;
  wire                dMAReader_7_io_cmd_ready;
  wire                dMAReader_7_io_axiMaster_ar_valid;
  wire       [31:0]   dMAReader_7_io_axiMaster_ar_payload_addr;
  wire       [0:0]    dMAReader_7_io_axiMaster_ar_payload_id;
  wire       [3:0]    dMAReader_7_io_axiMaster_ar_payload_region;
  wire       [7:0]    dMAReader_7_io_axiMaster_ar_payload_len;
  wire       [2:0]    dMAReader_7_io_axiMaster_ar_payload_size;
  wire       [1:0]    dMAReader_7_io_axiMaster_ar_payload_burst;
  wire       [0:0]    dMAReader_7_io_axiMaster_ar_payload_lock;
  wire       [3:0]    dMAReader_7_io_axiMaster_ar_payload_cache;
  wire       [3:0]    dMAReader_7_io_axiMaster_ar_payload_qos;
  wire       [2:0]    dMAReader_7_io_axiMaster_ar_payload_prot;
  wire                dMAReader_7_io_axiMaster_r_ready;
  wire                dMAReader_7_io_outStream_stream_valid;
  wire       [2:0]    dMAReader_7_io_outStream_stream_payload_0_mantissa;
  wire       [3:0]    dMAReader_7_io_outStream_stream_payload_0_exponent;
  wire                dMAReader_7_io_outStream_stream_payload_0_sign;
  wire       [2:0]    dMAReader_7_io_outStream_stream_payload_1_mantissa;
  wire       [3:0]    dMAReader_7_io_outStream_stream_payload_1_exponent;
  wire                dMAReader_7_io_outStream_stream_payload_1_sign;
  wire       [2:0]    dMAReader_7_io_outStream_stream_payload_2_mantissa;
  wire       [3:0]    dMAReader_7_io_outStream_stream_payload_2_exponent;
  wire                dMAReader_7_io_outStream_stream_payload_2_sign;
  wire       [2:0]    dMAReader_7_io_outStream_stream_payload_3_mantissa;
  wire       [3:0]    dMAReader_7_io_outStream_stream_payload_3_exponent;
  wire                dMAReader_7_io_outStream_stream_payload_3_sign;
  wire                streamDoubleBuffer_9_io_streamIn_ready;
  wire       [2:0]    streamDoubleBuffer_9_io_readData_0_mantissa;
  wire       [3:0]    streamDoubleBuffer_9_io_readData_0_exponent;
  wire                streamDoubleBuffer_9_io_readData_0_sign;
  wire       [2:0]    streamDoubleBuffer_9_io_readData_1_mantissa;
  wire       [3:0]    streamDoubleBuffer_9_io_readData_1_exponent;
  wire                streamDoubleBuffer_9_io_readData_1_sign;
  wire       [2:0]    streamDoubleBuffer_9_io_readData_2_mantissa;
  wire       [3:0]    streamDoubleBuffer_9_io_readData_2_exponent;
  wire                streamDoubleBuffer_9_io_readData_2_sign;
  wire       [2:0]    streamDoubleBuffer_9_io_readData_3_mantissa;
  wire       [3:0]    streamDoubleBuffer_9_io_readData_3_exponent;
  wire                streamDoubleBuffer_9_io_readData_3_sign;
  wire                streamDoubleBuffer_9_io_tileReady;
  wire                streamDoubleBuffer_9_io_loadCanAccept;
  wire                streamDoubleBuffer_9_io_tileFilled;
  wire                streamDoubleBuffer_9_io_refreshSettled;
  wire       [9:0]    doubleBufferStreamer_7_io_readAddr;
  wire                doubleBufferStreamer_7_io_nextTile;
  wire                doubleBufferStreamer_7_io_streamOut_valid;
  wire       [2:0]    doubleBufferStreamer_7_io_streamOut_payload_0_mantissa;
  wire       [3:0]    doubleBufferStreamer_7_io_streamOut_payload_0_exponent;
  wire                doubleBufferStreamer_7_io_streamOut_payload_0_sign;
  wire       [2:0]    doubleBufferStreamer_7_io_streamOut_payload_1_mantissa;
  wire       [3:0]    doubleBufferStreamer_7_io_streamOut_payload_1_exponent;
  wire                doubleBufferStreamer_7_io_streamOut_payload_1_sign;
  wire       [2:0]    doubleBufferStreamer_7_io_streamOut_payload_2_mantissa;
  wire       [3:0]    doubleBufferStreamer_7_io_streamOut_payload_2_exponent;
  wire                doubleBufferStreamer_7_io_streamOut_payload_2_sign;
  wire       [2:0]    doubleBufferStreamer_7_io_streamOut_payload_3_mantissa;
  wire       [3:0]    doubleBufferStreamer_7_io_streamOut_payload_3_exponent;
  wire                doubleBufferStreamer_7_io_streamOut_payload_3_sign;
  wire                dMAReader_8_io_cmd_ready;
  wire                dMAReader_8_io_axiMaster_ar_valid;
  wire       [31:0]   dMAReader_8_io_axiMaster_ar_payload_addr;
  wire       [0:0]    dMAReader_8_io_axiMaster_ar_payload_id;
  wire       [3:0]    dMAReader_8_io_axiMaster_ar_payload_region;
  wire       [7:0]    dMAReader_8_io_axiMaster_ar_payload_len;
  wire       [2:0]    dMAReader_8_io_axiMaster_ar_payload_size;
  wire       [1:0]    dMAReader_8_io_axiMaster_ar_payload_burst;
  wire       [0:0]    dMAReader_8_io_axiMaster_ar_payload_lock;
  wire       [3:0]    dMAReader_8_io_axiMaster_ar_payload_cache;
  wire       [3:0]    dMAReader_8_io_axiMaster_ar_payload_qos;
  wire       [2:0]    dMAReader_8_io_axiMaster_ar_payload_prot;
  wire                dMAReader_8_io_axiMaster_r_ready;
  wire                dMAReader_8_io_outStream_stream_valid;
  wire       [2:0]    dMAReader_8_io_outStream_stream_payload_0_mantissa;
  wire       [3:0]    dMAReader_8_io_outStream_stream_payload_0_exponent;
  wire                dMAReader_8_io_outStream_stream_payload_0_sign;
  wire                streamDoubleBuffer_10_io_streamIn_ready;
  wire       [2:0]    streamDoubleBuffer_10_io_readData_0_mantissa;
  wire       [3:0]    streamDoubleBuffer_10_io_readData_0_exponent;
  wire                streamDoubleBuffer_10_io_readData_0_sign;
  wire                streamDoubleBuffer_10_io_tileReady;
  wire                streamDoubleBuffer_10_io_loadCanAccept;
  wire                streamDoubleBuffer_10_io_tileFilled;
  wire                streamDoubleBuffer_10_io_refreshSettled;
  wire       [3:0]    doubleBufferStreamer_8_io_readAddr;
  wire                doubleBufferStreamer_8_io_nextTile;
  wire                doubleBufferStreamer_8_io_streamOut_valid;
  wire       [2:0]    doubleBufferStreamer_8_io_streamOut_payload_0_mantissa;
  wire       [3:0]    doubleBufferStreamer_8_io_streamOut_payload_0_exponent;
  wire                doubleBufferStreamer_8_io_streamOut_payload_0_sign;
  wire                repackOp_9_io_a_stream_ready;
  wire                repackOp_9_io_c_stream_valid;
  wire       [2:0]    repackOp_9_io_c_stream_payload_0_mantissa;
  wire       [3:0]    repackOp_9_io_c_stream_payload_0_exponent;
  wire                repackOp_9_io_c_stream_payload_0_sign;
  wire       [2:0]    repackOp_9_io_c_stream_payload_1_mantissa;
  wire       [3:0]    repackOp_9_io_c_stream_payload_1_exponent;
  wire                repackOp_9_io_c_stream_payload_1_sign;
  wire       [2:0]    repackOp_9_io_c_stream_payload_2_mantissa;
  wire       [3:0]    repackOp_9_io_c_stream_payload_2_exponent;
  wire                repackOp_9_io_c_stream_payload_2_sign;
  wire       [2:0]    repackOp_9_io_c_stream_payload_3_mantissa;
  wire       [3:0]    repackOp_9_io_c_stream_payload_3_exponent;
  wire                repackOp_9_io_c_stream_payload_3_sign;
  wire                repackOp_9_io_isEmpty;
  wire                linearLayer_1_io_a_stream_ready;
  wire                linearLayer_1_io_w_stream_ready;
  wire                linearLayer_1_io_b_stream_ready;
  wire                linearLayer_1_io_y_stream_valid;
  wire       [2:0]    linearLayer_1_io_y_stream_payload_0_mantissa;
  wire       [3:0]    linearLayer_1_io_y_stream_payload_0_exponent;
  wire                linearLayer_1_io_y_stream_payload_0_sign;
  wire                axi4ReadOnlyArbiter_1_io_inputs_0_ar_ready;
  wire                axi4ReadOnlyArbiter_1_io_inputs_0_r_valid;
  wire       [63:0]   axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_data;
  wire       [0:0]    axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_id;
  wire       [1:0]    axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_resp;
  wire                axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_last;
  wire                axi4ReadOnlyArbiter_1_io_inputs_1_ar_ready;
  wire                axi4ReadOnlyArbiter_1_io_inputs_1_r_valid;
  wire       [63:0]   axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_data;
  wire       [0:0]    axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_id;
  wire       [1:0]    axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_resp;
  wire                axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_last;
  wire                axi4ReadOnlyArbiter_1_io_inputs_2_ar_ready;
  wire                axi4ReadOnlyArbiter_1_io_inputs_2_r_valid;
  wire       [63:0]   axi4ReadOnlyArbiter_1_io_inputs_2_r_payload_data;
  wire       [0:0]    axi4ReadOnlyArbiter_1_io_inputs_2_r_payload_id;
  wire       [1:0]    axi4ReadOnlyArbiter_1_io_inputs_2_r_payload_resp;
  wire                axi4ReadOnlyArbiter_1_io_inputs_2_r_payload_last;
  wire                axi4ReadOnlyArbiter_1_io_inputs_3_ar_ready;
  wire                axi4ReadOnlyArbiter_1_io_inputs_3_r_valid;
  wire       [63:0]   axi4ReadOnlyArbiter_1_io_inputs_3_r_payload_data;
  wire       [0:0]    axi4ReadOnlyArbiter_1_io_inputs_3_r_payload_id;
  wire       [1:0]    axi4ReadOnlyArbiter_1_io_inputs_3_r_payload_resp;
  wire                axi4ReadOnlyArbiter_1_io_inputs_3_r_payload_last;
  wire                axi4ReadOnlyArbiter_1_io_inputs_4_ar_ready;
  wire                axi4ReadOnlyArbiter_1_io_inputs_4_r_valid;
  wire       [63:0]   axi4ReadOnlyArbiter_1_io_inputs_4_r_payload_data;
  wire       [0:0]    axi4ReadOnlyArbiter_1_io_inputs_4_r_payload_id;
  wire       [1:0]    axi4ReadOnlyArbiter_1_io_inputs_4_r_payload_resp;
  wire                axi4ReadOnlyArbiter_1_io_inputs_4_r_payload_last;
  wire                axi4ReadOnlyArbiter_1_io_output_ar_valid;
  wire       [31:0]   axi4ReadOnlyArbiter_1_io_output_ar_payload_addr;
  wire       [3:0]    axi4ReadOnlyArbiter_1_io_output_ar_payload_id;
  wire       [3:0]    axi4ReadOnlyArbiter_1_io_output_ar_payload_region;
  wire       [7:0]    axi4ReadOnlyArbiter_1_io_output_ar_payload_len;
  wire       [2:0]    axi4ReadOnlyArbiter_1_io_output_ar_payload_size;
  wire       [1:0]    axi4ReadOnlyArbiter_1_io_output_ar_payload_burst;
  wire       [0:0]    axi4ReadOnlyArbiter_1_io_output_ar_payload_lock;
  wire       [3:0]    axi4ReadOnlyArbiter_1_io_output_ar_payload_cache;
  wire       [3:0]    axi4ReadOnlyArbiter_1_io_output_ar_payload_qos;
  wire       [2:0]    axi4ReadOnlyArbiter_1_io_output_ar_payload_prot;
  wire                axi4ReadOnlyArbiter_1_io_output_r_ready;
  wire       [32:0]   _zz_io_cmd_payload_baseAddress;
  wire       [32:0]   _zz_io_cmd_payload_baseAddress_1;
  wire       [32:0]   _zz_io_cmd_payload_baseAddress_2;
  wire       [3:0]    _zz_frameCounter_valueNext;
  wire       [0:0]    _zz_frameCounter_valueNext_1;
  reg                 residentPrev;
  wire                residentRise;
  reg        [0:0]    imgBandIdx;
  reg                 imgBandActive;
  wire                dmaImg_io_cmd_fire;
  wire                when_Sequential_l231;
  reg                 prevStartValid;
  wire                imgQueue_stream_valid;
  wire                imgQueue_stream_ready;
  wire       [7:0]    imgQueue_stream_payload_0;
  reg                 _zz_io_outputs_1_ready;
  reg                 _zz_io_outputs_1_ready_1;
  reg                 _zz_io_stageRequest;
  wire                _zz_when_Sequential_l392;
  wire                _zz_io_outputs_1_ready_2;
  wire                _zz_io_cmd_valid;
  wire                _zz_io_cmd_valid_1;
  wire                _zz_io_outputs_1_ready_3;
  wire                _zz_when_Sequential_l392_1;
  wire                when_Sequential_l392;
  reg                 _zz_io_outputs_2_ready;
  reg                 _zz_io_outputs_2_ready_1;
  reg                 _zz_io_stageRequest_1;
  wire                _zz_when_Sequential_l472;
  wire                _zz_io_outputs_2_ready_2;
  wire                _zz_io_cmd_valid_2;
  wire                _zz_io_cmd_valid_3;
  wire                _zz_io_outputs_2_ready_3;
  wire                _zz_when_Sequential_l472_1;
  wire                when_Sequential_l472;
  reg                 _zz_io_outputs_3_ready;
  reg                 _zz_io_outputs_3_ready_1;
  reg                 _zz_io_stageRequest_2;
  wire                _zz_when_Sequential_l392_2;
  wire                _zz_io_outputs_3_ready_2;
  wire                _zz_io_cmd_valid_4;
  wire                _zz_io_cmd_valid_5;
  wire                _zz_io_outputs_3_ready_3;
  wire                _zz_when_Sequential_l392_3;
  wire                when_Sequential_l392_1;
  reg                 _zz_io_outputs_4_ready;
  reg                 _zz_io_outputs_4_ready_1;
  reg                 _zz_io_stageRequest_3;
  wire                _zz_when_Sequential_l472_2;
  wire                _zz_io_outputs_4_ready_2;
  wire                _zz_io_cmd_valid_6;
  wire                _zz_io_cmd_valid_7;
  wire                _zz_io_outputs_4_ready_3;
  wire                _zz_when_Sequential_l472_3;
  wire                when_Sequential_l472_1;
  reg                 frameCounter_willIncrement;
  wire                frameCounter_willDecrement;
  wire                frameCounter_willClear;
  wire                frameCounter_willLoad;
  reg        [3:0]    frameCounter_valueNext;
  reg        [3:0]    frameCounter_value;
  wire                frameCounter_willOverflowIfInc;
  wire                frameCounter_willUnderflowIfDec;
  wire                frameCounter_willOverflow;
  wire                frameCounter_willUnderflow;
  wire                io_outStream_stream_fire;
  reg                 ioBusy;
  wire                io_start_fire;
  wire                when_Sequential_l676;

  assign _zz_io_cmd_payload_baseAddress = (_zz_io_cmd_payload_baseAddress_1 + _zz_io_cmd_payload_baseAddress_2);
  assign _zz_io_cmd_payload_baseAddress_1 = {1'd0, io_imgBaseAddress};
  assign _zz_io_cmd_payload_baseAddress_2 = (32'h00000310 * imgBandIdx);
  assign _zz_frameCounter_valueNext_1 = frameCounter_willIncrement;
  assign _zz_frameCounter_valueNext = {3'd0, _zz_frameCounter_valueNext_1};
  StreamFork io_start_fork (
    .io_input_valid     (io_start_valid                  ), //i
    .io_input_ready     (io_start_fork_io_input_ready    ), //o
    .io_outputs_0_valid (io_start_fork_io_outputs_0_valid), //o
    .io_outputs_0_ready (1'b1                            ), //i
    .io_outputs_1_valid (io_start_fork_io_outputs_1_valid), //o
    .io_outputs_1_ready (io_start_fork_io_outputs_1_ready), //i
    .io_outputs_2_valid (io_start_fork_io_outputs_2_valid), //o
    .io_outputs_2_ready (io_start_fork_io_outputs_2_ready), //i
    .io_outputs_3_valid (io_start_fork_io_outputs_3_valid), //o
    .io_outputs_3_ready (io_start_fork_io_outputs_3_ready), //i
    .io_outputs_4_valid (io_start_fork_io_outputs_4_valid), //o
    .io_outputs_4_ready (io_start_fork_io_outputs_4_ready), //i
    .clk                (clk                             ), //i
    .reset              (reset                           )  //i
  );
  DMAReader2D dmaImg (
    .io_cmd_valid                   (imgBandActive                                         ), //i
    .io_cmd_ready                   (dmaImg_io_cmd_ready                                   ), //o
    .io_cmd_payload_baseAddress     (dmaImg_io_cmd_payload_baseAddress[31:0]               ), //i
    .io_cmd_payload_stride          (32'h0000001c                                          ), //i
    .io_cmd_payload_patchWidth      (16'h0                                                 ), //i
    .io_cmd_payload_patchHeight     (dmaImg_io_cmd_payload_patchHeight[15:0]               ), //i
    .io_axiMaster_ar_valid          (dmaImg_io_axiMaster_ar_valid                          ), //o
    .io_axiMaster_ar_ready          (axi4ReadOnlyArbiter_1_io_inputs_0_ar_ready            ), //i
    .io_axiMaster_ar_payload_addr   (dmaImg_io_axiMaster_ar_payload_addr[31:0]             ), //o
    .io_axiMaster_ar_payload_id     (dmaImg_io_axiMaster_ar_payload_id                     ), //o
    .io_axiMaster_ar_payload_region (dmaImg_io_axiMaster_ar_payload_region[3:0]            ), //o
    .io_axiMaster_ar_payload_len    (dmaImg_io_axiMaster_ar_payload_len[7:0]               ), //o
    .io_axiMaster_ar_payload_size   (dmaImg_io_axiMaster_ar_payload_size[2:0]              ), //o
    .io_axiMaster_ar_payload_burst  (dmaImg_io_axiMaster_ar_payload_burst[1:0]             ), //o
    .io_axiMaster_ar_payload_lock   (dmaImg_io_axiMaster_ar_payload_lock                   ), //o
    .io_axiMaster_ar_payload_cache  (dmaImg_io_axiMaster_ar_payload_cache[3:0]             ), //o
    .io_axiMaster_ar_payload_qos    (dmaImg_io_axiMaster_ar_payload_qos[3:0]               ), //o
    .io_axiMaster_ar_payload_prot   (dmaImg_io_axiMaster_ar_payload_prot[2:0]              ), //o
    .io_axiMaster_r_valid           (axi4ReadOnlyArbiter_1_io_inputs_0_r_valid             ), //i
    .io_axiMaster_r_ready           (dmaImg_io_axiMaster_r_ready                           ), //o
    .io_axiMaster_r_payload_data    (axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_data[63:0]), //i
    .io_axiMaster_r_payload_id      (axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_id        ), //i
    .io_axiMaster_r_payload_resp    (axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_resp[1:0] ), //i
    .io_axiMaster_r_payload_last    (axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_last      ), //i
    .io_outStream_stream_valid      (dmaImg_io_outStream_stream_valid                      ), //o
    .io_outStream_stream_ready      (imgDoubleBuffer_io_streamIn_ready                     ), //i
    .io_outStream_stream_payload_0  (dmaImg_io_outStream_stream_payload_0[7:0]             ), //o
    .clk                            (clk                                                   ), //i
    .reset                          (reset                                                 )  //i
  );
  StreamDoubleBuffer_2 imgDoubleBuffer (
    .io_streamIn_valid     (dmaImg_io_outStream_stream_valid         ), //i
    .io_streamIn_ready     (imgDoubleBuffer_io_streamIn_ready        ), //o
    .io_streamIn_payload_0 (dmaImg_io_outStream_stream_payload_0[7:0]), //i
    .io_readAddr           (imgStreamer_io_readAddr[9:0]             ), //i
    .io_readData_0         (imgDoubleBuffer_io_readData_0[7:0]       ), //o
    .io_nextTile           (imgStreamer_io_nextTile                  ), //i
    .io_tileReady          (imgDoubleBuffer_io_tileReady             ), //o
    .io_reArm              (imgDoubleBuffer_io_reArm                 ), //i
    .io_loadCanAccept      (imgDoubleBuffer_io_loadCanAccept         ), //o
    .io_tileFilled         (imgDoubleBuffer_io_tileFilled            ), //o
    .io_refreshSettled     (imgDoubleBuffer_io_refreshSettled        ), //o
    .clk                   (clk                                      ), //i
    .reset                 (reset                                    )  //i
  );
  DoubleBufferStreamer imgStreamer (
    .io_readAddr            (imgStreamer_io_readAddr[9:0]           ), //o
    .io_readData_0          (imgDoubleBuffer_io_readData_0[7:0]     ), //i
    .io_nextTile            (imgStreamer_io_nextTile                ), //o
    .io_tileReady           (imgDoubleBuffer_io_tileReady           ), //i
    .io_streamOut_valid     (imgStreamer_io_streamOut_valid         ), //o
    .io_streamOut_ready     (imgQueue_stream_ready                  ), //i
    .io_streamOut_payload_0 (imgStreamer_io_streamOut_payload_0[7:0]), //o
    .io_reArm               (imgStreamer_io_reArm                   ), //i
    .clk                    (clk                                    ), //i
    .reset                  (reset                                  )  //i
  );
  DMAReader_1 dMAReader_5 (
    .io_cmd_valid                   (_zz_io_cmd_valid_1                                    ), //i
    .io_cmd_ready                   (dMAReader_5_io_cmd_ready                              ), //o
    .io_cmd_payload_address         (dMAReader_5_io_cmd_payload_address[31:0]              ), //i
    .io_cmd_payload_length          (16'h0003                                              ), //i
    .io_axiMaster_ar_valid          (dMAReader_5_io_axiMaster_ar_valid                     ), //o
    .io_axiMaster_ar_ready          (axi4ReadOnlyArbiter_1_io_inputs_1_ar_ready            ), //i
    .io_axiMaster_ar_payload_addr   (dMAReader_5_io_axiMaster_ar_payload_addr[31:0]        ), //o
    .io_axiMaster_ar_payload_id     (dMAReader_5_io_axiMaster_ar_payload_id                ), //o
    .io_axiMaster_ar_payload_region (dMAReader_5_io_axiMaster_ar_payload_region[3:0]       ), //o
    .io_axiMaster_ar_payload_len    (dMAReader_5_io_axiMaster_ar_payload_len[7:0]          ), //o
    .io_axiMaster_ar_payload_size   (dMAReader_5_io_axiMaster_ar_payload_size[2:0]         ), //o
    .io_axiMaster_ar_payload_burst  (dMAReader_5_io_axiMaster_ar_payload_burst[1:0]        ), //o
    .io_axiMaster_ar_payload_lock   (dMAReader_5_io_axiMaster_ar_payload_lock              ), //o
    .io_axiMaster_ar_payload_cache  (dMAReader_5_io_axiMaster_ar_payload_cache[3:0]        ), //o
    .io_axiMaster_ar_payload_qos    (dMAReader_5_io_axiMaster_ar_payload_qos[3:0]          ), //o
    .io_axiMaster_ar_payload_prot   (dMAReader_5_io_axiMaster_ar_payload_prot[2:0]         ), //o
    .io_axiMaster_r_valid           (axi4ReadOnlyArbiter_1_io_inputs_1_r_valid             ), //i
    .io_axiMaster_r_ready           (dMAReader_5_io_axiMaster_r_ready                      ), //o
    .io_axiMaster_r_payload_data    (axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_data[63:0]), //i
    .io_axiMaster_r_payload_id      (axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_id        ), //i
    .io_axiMaster_r_payload_resp    (axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_resp[1:0] ), //i
    .io_axiMaster_r_payload_last    (axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_last      ), //i
    .io_outStream_stream_valid      (dMAReader_5_io_outStream_stream_valid                 ), //o
    .io_outStream_stream_ready      (streamDoubleBuffer_7_io_streamIn_ready                ), //i
    .io_outStream_stream_payload_0  (dMAReader_5_io_outStream_stream_payload_0[3:0]        ), //o
    .io_outStream_stream_payload_1  (dMAReader_5_io_outStream_stream_payload_1[3:0]        ), //o
    .io_outStream_stream_payload_2  (dMAReader_5_io_outStream_stream_payload_2[3:0]        ), //o
    .io_outStream_stream_payload_3  (dMAReader_5_io_outStream_stream_payload_3[3:0]        ), //o
    .io_outStream_stream_payload_4  (dMAReader_5_io_outStream_stream_payload_4[3:0]        ), //o
    .io_outStream_stream_payload_5  (dMAReader_5_io_outStream_stream_payload_5[3:0]        ), //o
    .io_outStream_stream_payload_6  (dMAReader_5_io_outStream_stream_payload_6[3:0]        ), //o
    .io_outStream_stream_payload_7  (dMAReader_5_io_outStream_stream_payload_7[3:0]        ), //o
    .io_outStream_stream_payload_8  (dMAReader_5_io_outStream_stream_payload_8[3:0]        ), //o
    .io_outStream_stream_payload_9  (dMAReader_5_io_outStream_stream_payload_9[3:0]        ), //o
    .io_outStream_stream_payload_10 (dMAReader_5_io_outStream_stream_payload_10[3:0]       ), //o
    .io_outStream_stream_payload_11 (dMAReader_5_io_outStream_stream_payload_11[3:0]       ), //o
    .io_outStream_stream_payload_12 (dMAReader_5_io_outStream_stream_payload_12[3:0]       ), //o
    .io_outStream_stream_payload_13 (dMAReader_5_io_outStream_stream_payload_13[3:0]       ), //o
    .io_outStream_stream_payload_14 (dMAReader_5_io_outStream_stream_payload_14[3:0]       ), //o
    .io_outStream_stream_payload_15 (dMAReader_5_io_outStream_stream_payload_15[3:0]       ), //o
    .io_outStream_stream_payload_16 (dMAReader_5_io_outStream_stream_payload_16[3:0]       ), //o
    .io_outStream_stream_payload_17 (dMAReader_5_io_outStream_stream_payload_17[3:0]       ), //o
    .io_outStream_stream_payload_18 (dMAReader_5_io_outStream_stream_payload_18[3:0]       ), //o
    .io_outStream_stream_payload_19 (dMAReader_5_io_outStream_stream_payload_19[3:0]       ), //o
    .io_outStream_stream_payload_20 (dMAReader_5_io_outStream_stream_payload_20[3:0]       ), //o
    .io_outStream_stream_payload_21 (dMAReader_5_io_outStream_stream_payload_21[3:0]       ), //o
    .io_outStream_stream_payload_22 (dMAReader_5_io_outStream_stream_payload_22[3:0]       ), //o
    .io_outStream_stream_payload_23 (dMAReader_5_io_outStream_stream_payload_23[3:0]       ), //o
    .io_outStream_stream_payload_24 (dMAReader_5_io_outStream_stream_payload_24[3:0]       ), //o
    .clk                            (clk                                                   ), //i
    .reset                          (reset                                                 )  //i
  );
  StreamDoubleBuffer_3 streamDoubleBuffer_7 (
    .io_streamIn_valid      (dMAReader_5_io_outStream_stream_valid          ), //i
    .io_streamIn_ready      (streamDoubleBuffer_7_io_streamIn_ready         ), //o
    .io_streamIn_payload_0  (dMAReader_5_io_outStream_stream_payload_0[3:0] ), //i
    .io_streamIn_payload_1  (dMAReader_5_io_outStream_stream_payload_1[3:0] ), //i
    .io_streamIn_payload_2  (dMAReader_5_io_outStream_stream_payload_2[3:0] ), //i
    .io_streamIn_payload_3  (dMAReader_5_io_outStream_stream_payload_3[3:0] ), //i
    .io_streamIn_payload_4  (dMAReader_5_io_outStream_stream_payload_4[3:0] ), //i
    .io_streamIn_payload_5  (dMAReader_5_io_outStream_stream_payload_5[3:0] ), //i
    .io_streamIn_payload_6  (dMAReader_5_io_outStream_stream_payload_6[3:0] ), //i
    .io_streamIn_payload_7  (dMAReader_5_io_outStream_stream_payload_7[3:0] ), //i
    .io_streamIn_payload_8  (dMAReader_5_io_outStream_stream_payload_8[3:0] ), //i
    .io_streamIn_payload_9  (dMAReader_5_io_outStream_stream_payload_9[3:0] ), //i
    .io_streamIn_payload_10 (dMAReader_5_io_outStream_stream_payload_10[3:0]), //i
    .io_streamIn_payload_11 (dMAReader_5_io_outStream_stream_payload_11[3:0]), //i
    .io_streamIn_payload_12 (dMAReader_5_io_outStream_stream_payload_12[3:0]), //i
    .io_streamIn_payload_13 (dMAReader_5_io_outStream_stream_payload_13[3:0]), //i
    .io_streamIn_payload_14 (dMAReader_5_io_outStream_stream_payload_14[3:0]), //i
    .io_streamIn_payload_15 (dMAReader_5_io_outStream_stream_payload_15[3:0]), //i
    .io_streamIn_payload_16 (dMAReader_5_io_outStream_stream_payload_16[3:0]), //i
    .io_streamIn_payload_17 (dMAReader_5_io_outStream_stream_payload_17[3:0]), //i
    .io_streamIn_payload_18 (dMAReader_5_io_outStream_stream_payload_18[3:0]), //i
    .io_streamIn_payload_19 (dMAReader_5_io_outStream_stream_payload_19[3:0]), //i
    .io_streamIn_payload_20 (dMAReader_5_io_outStream_stream_payload_20[3:0]), //i
    .io_streamIn_payload_21 (dMAReader_5_io_outStream_stream_payload_21[3:0]), //i
    .io_streamIn_payload_22 (dMAReader_5_io_outStream_stream_payload_22[3:0]), //i
    .io_streamIn_payload_23 (dMAReader_5_io_outStream_stream_payload_23[3:0]), //i
    .io_streamIn_payload_24 (dMAReader_5_io_outStream_stream_payload_24[3:0]), //i
    .io_readAddr            (doubleBufferStreamer_5_io_readAddr             ), //i
    .io_readData_0          (streamDoubleBuffer_7_io_readData_0[3:0]        ), //o
    .io_readData_1          (streamDoubleBuffer_7_io_readData_1[3:0]        ), //o
    .io_readData_2          (streamDoubleBuffer_7_io_readData_2[3:0]        ), //o
    .io_readData_3          (streamDoubleBuffer_7_io_readData_3[3:0]        ), //o
    .io_readData_4          (streamDoubleBuffer_7_io_readData_4[3:0]        ), //o
    .io_readData_5          (streamDoubleBuffer_7_io_readData_5[3:0]        ), //o
    .io_readData_6          (streamDoubleBuffer_7_io_readData_6[3:0]        ), //o
    .io_readData_7          (streamDoubleBuffer_7_io_readData_7[3:0]        ), //o
    .io_readData_8          (streamDoubleBuffer_7_io_readData_8[3:0]        ), //o
    .io_readData_9          (streamDoubleBuffer_7_io_readData_9[3:0]        ), //o
    .io_readData_10         (streamDoubleBuffer_7_io_readData_10[3:0]       ), //o
    .io_readData_11         (streamDoubleBuffer_7_io_readData_11[3:0]       ), //o
    .io_readData_12         (streamDoubleBuffer_7_io_readData_12[3:0]       ), //o
    .io_readData_13         (streamDoubleBuffer_7_io_readData_13[3:0]       ), //o
    .io_readData_14         (streamDoubleBuffer_7_io_readData_14[3:0]       ), //o
    .io_readData_15         (streamDoubleBuffer_7_io_readData_15[3:0]       ), //o
    .io_readData_16         (streamDoubleBuffer_7_io_readData_16[3:0]       ), //o
    .io_readData_17         (streamDoubleBuffer_7_io_readData_17[3:0]       ), //o
    .io_readData_18         (streamDoubleBuffer_7_io_readData_18[3:0]       ), //o
    .io_readData_19         (streamDoubleBuffer_7_io_readData_19[3:0]       ), //o
    .io_readData_20         (streamDoubleBuffer_7_io_readData_20[3:0]       ), //o
    .io_readData_21         (streamDoubleBuffer_7_io_readData_21[3:0]       ), //o
    .io_readData_22         (streamDoubleBuffer_7_io_readData_22[3:0]       ), //o
    .io_readData_23         (streamDoubleBuffer_7_io_readData_23[3:0]       ), //o
    .io_readData_24         (streamDoubleBuffer_7_io_readData_24[3:0]       ), //o
    .io_nextTile            (doubleBufferStreamer_5_io_nextTile             ), //i
    .io_tileReady           (streamDoubleBuffer_7_io_tileReady              ), //o
    .io_reArm               (streamDoubleBuffer_7_io_reArm                  ), //i
    .io_residentHold        (io_weightResident                              ), //i
    .io_stageRequest        (_zz_io_stageRequest                            ), //i
    .io_loadCanAccept       (streamDoubleBuffer_7_io_loadCanAccept          ), //o
    .io_tileFilled          (streamDoubleBuffer_7_io_tileFilled             ), //o
    .io_refreshSettled      (streamDoubleBuffer_7_io_refreshSettled         ), //o
    .clk                    (clk                                            ), //i
    .reset                  (reset                                          )  //i
  );
  DoubleBufferStreamer_1 doubleBufferStreamer_5 (
    .io_readAddr             (doubleBufferStreamer_5_io_readAddr                 ), //o
    .io_readData_0           (streamDoubleBuffer_7_io_readData_0[3:0]            ), //i
    .io_readData_1           (streamDoubleBuffer_7_io_readData_1[3:0]            ), //i
    .io_readData_2           (streamDoubleBuffer_7_io_readData_2[3:0]            ), //i
    .io_readData_3           (streamDoubleBuffer_7_io_readData_3[3:0]            ), //i
    .io_readData_4           (streamDoubleBuffer_7_io_readData_4[3:0]            ), //i
    .io_readData_5           (streamDoubleBuffer_7_io_readData_5[3:0]            ), //i
    .io_readData_6           (streamDoubleBuffer_7_io_readData_6[3:0]            ), //i
    .io_readData_7           (streamDoubleBuffer_7_io_readData_7[3:0]            ), //i
    .io_readData_8           (streamDoubleBuffer_7_io_readData_8[3:0]            ), //i
    .io_readData_9           (streamDoubleBuffer_7_io_readData_9[3:0]            ), //i
    .io_readData_10          (streamDoubleBuffer_7_io_readData_10[3:0]           ), //i
    .io_readData_11          (streamDoubleBuffer_7_io_readData_11[3:0]           ), //i
    .io_readData_12          (streamDoubleBuffer_7_io_readData_12[3:0]           ), //i
    .io_readData_13          (streamDoubleBuffer_7_io_readData_13[3:0]           ), //i
    .io_readData_14          (streamDoubleBuffer_7_io_readData_14[3:0]           ), //i
    .io_readData_15          (streamDoubleBuffer_7_io_readData_15[3:0]           ), //i
    .io_readData_16          (streamDoubleBuffer_7_io_readData_16[3:0]           ), //i
    .io_readData_17          (streamDoubleBuffer_7_io_readData_17[3:0]           ), //i
    .io_readData_18          (streamDoubleBuffer_7_io_readData_18[3:0]           ), //i
    .io_readData_19          (streamDoubleBuffer_7_io_readData_19[3:0]           ), //i
    .io_readData_20          (streamDoubleBuffer_7_io_readData_20[3:0]           ), //i
    .io_readData_21          (streamDoubleBuffer_7_io_readData_21[3:0]           ), //i
    .io_readData_22          (streamDoubleBuffer_7_io_readData_22[3:0]           ), //i
    .io_readData_23          (streamDoubleBuffer_7_io_readData_23[3:0]           ), //i
    .io_readData_24          (streamDoubleBuffer_7_io_readData_24[3:0]           ), //i
    .io_nextTile             (doubleBufferStreamer_5_io_nextTile                 ), //o
    .io_tileReady            (streamDoubleBuffer_7_io_tileReady                  ), //i
    .io_streamOut_valid      (doubleBufferStreamer_5_io_streamOut_valid          ), //o
    .io_streamOut_ready      (castOp_2_io_a_stream_ready                         ), //i
    .io_streamOut_payload_0  (doubleBufferStreamer_5_io_streamOut_payload_0[3:0] ), //o
    .io_streamOut_payload_1  (doubleBufferStreamer_5_io_streamOut_payload_1[3:0] ), //o
    .io_streamOut_payload_2  (doubleBufferStreamer_5_io_streamOut_payload_2[3:0] ), //o
    .io_streamOut_payload_3  (doubleBufferStreamer_5_io_streamOut_payload_3[3:0] ), //o
    .io_streamOut_payload_4  (doubleBufferStreamer_5_io_streamOut_payload_4[3:0] ), //o
    .io_streamOut_payload_5  (doubleBufferStreamer_5_io_streamOut_payload_5[3:0] ), //o
    .io_streamOut_payload_6  (doubleBufferStreamer_5_io_streamOut_payload_6[3:0] ), //o
    .io_streamOut_payload_7  (doubleBufferStreamer_5_io_streamOut_payload_7[3:0] ), //o
    .io_streamOut_payload_8  (doubleBufferStreamer_5_io_streamOut_payload_8[3:0] ), //o
    .io_streamOut_payload_9  (doubleBufferStreamer_5_io_streamOut_payload_9[3:0] ), //o
    .io_streamOut_payload_10 (doubleBufferStreamer_5_io_streamOut_payload_10[3:0]), //o
    .io_streamOut_payload_11 (doubleBufferStreamer_5_io_streamOut_payload_11[3:0]), //o
    .io_streamOut_payload_12 (doubleBufferStreamer_5_io_streamOut_payload_12[3:0]), //o
    .io_streamOut_payload_13 (doubleBufferStreamer_5_io_streamOut_payload_13[3:0]), //o
    .io_streamOut_payload_14 (doubleBufferStreamer_5_io_streamOut_payload_14[3:0]), //o
    .io_streamOut_payload_15 (doubleBufferStreamer_5_io_streamOut_payload_15[3:0]), //o
    .io_streamOut_payload_16 (doubleBufferStreamer_5_io_streamOut_payload_16[3:0]), //o
    .io_streamOut_payload_17 (doubleBufferStreamer_5_io_streamOut_payload_17[3:0]), //o
    .io_streamOut_payload_18 (doubleBufferStreamer_5_io_streamOut_payload_18[3:0]), //o
    .io_streamOut_payload_19 (doubleBufferStreamer_5_io_streamOut_payload_19[3:0]), //o
    .io_streamOut_payload_20 (doubleBufferStreamer_5_io_streamOut_payload_20[3:0]), //o
    .io_streamOut_payload_21 (doubleBufferStreamer_5_io_streamOut_payload_21[3:0]), //o
    .io_streamOut_payload_22 (doubleBufferStreamer_5_io_streamOut_payload_22[3:0]), //o
    .io_streamOut_payload_23 (doubleBufferStreamer_5_io_streamOut_payload_23[3:0]), //o
    .io_streamOut_payload_24 (doubleBufferStreamer_5_io_streamOut_payload_24[3:0]), //o
    .io_reArm                (_zz_when_Sequential_l392_1                         ), //i
    .clk                     (clk                                                ), //i
    .reset                   (reset                                              )  //i
  );
  DMAReader_2 dMAReader_6 (
    .io_cmd_valid                   (_zz_io_cmd_valid_3                                    ), //i
    .io_cmd_ready                   (dMAReader_6_io_cmd_ready                              ), //o
    .io_cmd_payload_address         (dMAReader_6_io_cmd_payload_address[31:0]              ), //i
    .io_cmd_payload_length          (16'h0                                                 ), //i
    .io_axiMaster_ar_valid          (dMAReader_6_io_axiMaster_ar_valid                     ), //o
    .io_axiMaster_ar_ready          (axi4ReadOnlyArbiter_1_io_inputs_2_ar_ready            ), //i
    .io_axiMaster_ar_payload_addr   (dMAReader_6_io_axiMaster_ar_payload_addr[31:0]        ), //o
    .io_axiMaster_ar_payload_id     (dMAReader_6_io_axiMaster_ar_payload_id                ), //o
    .io_axiMaster_ar_payload_region (dMAReader_6_io_axiMaster_ar_payload_region[3:0]       ), //o
    .io_axiMaster_ar_payload_len    (dMAReader_6_io_axiMaster_ar_payload_len[7:0]          ), //o
    .io_axiMaster_ar_payload_size   (dMAReader_6_io_axiMaster_ar_payload_size[2:0]         ), //o
    .io_axiMaster_ar_payload_burst  (dMAReader_6_io_axiMaster_ar_payload_burst[1:0]        ), //o
    .io_axiMaster_ar_payload_lock   (dMAReader_6_io_axiMaster_ar_payload_lock              ), //o
    .io_axiMaster_ar_payload_cache  (dMAReader_6_io_axiMaster_ar_payload_cache[3:0]        ), //o
    .io_axiMaster_ar_payload_qos    (dMAReader_6_io_axiMaster_ar_payload_qos[3:0]          ), //o
    .io_axiMaster_ar_payload_prot   (dMAReader_6_io_axiMaster_ar_payload_prot[2:0]         ), //o
    .io_axiMaster_r_valid           (axi4ReadOnlyArbiter_1_io_inputs_2_r_valid             ), //i
    .io_axiMaster_r_ready           (dMAReader_6_io_axiMaster_r_ready                      ), //o
    .io_axiMaster_r_payload_data    (axi4ReadOnlyArbiter_1_io_inputs_2_r_payload_data[63:0]), //i
    .io_axiMaster_r_payload_id      (axi4ReadOnlyArbiter_1_io_inputs_2_r_payload_id        ), //i
    .io_axiMaster_r_payload_resp    (axi4ReadOnlyArbiter_1_io_inputs_2_r_payload_resp[1:0] ), //i
    .io_axiMaster_r_payload_last    (axi4ReadOnlyArbiter_1_io_inputs_2_r_payload_last      ), //i
    .io_outStream_stream_valid      (dMAReader_6_io_outStream_stream_valid                 ), //o
    .io_outStream_stream_ready      (streamDoubleBuffer_8_io_streamIn_ready                ), //i
    .io_outStream_stream_payload_0  (dMAReader_6_io_outStream_stream_payload_0[15:0]       ), //o
    .clk                            (clk                                                   ), //i
    .reset                          (reset                                                 )  //i
  );
  StreamDoubleBuffer_4 streamDoubleBuffer_8 (
    .io_streamIn_valid     (dMAReader_6_io_outStream_stream_valid          ), //i
    .io_streamIn_ready     (streamDoubleBuffer_8_io_streamIn_ready         ), //o
    .io_streamIn_payload_0 (dMAReader_6_io_outStream_stream_payload_0[15:0]), //i
    .io_readAddr           (doubleBufferStreamer_6_io_readAddr             ), //i
    .io_readData_0         (streamDoubleBuffer_8_io_readData_0[15:0]       ), //o
    .io_nextTile           (doubleBufferStreamer_6_io_nextTile             ), //i
    .io_tileReady          (streamDoubleBuffer_8_io_tileReady              ), //o
    .io_reArm              (_zz_when_Sequential_l472_1                     ), //i
    .io_residentHold       (io_weightResident                              ), //i
    .io_stageRequest       (_zz_io_stageRequest_1                          ), //i
    .io_loadCanAccept      (streamDoubleBuffer_8_io_loadCanAccept          ), //o
    .io_tileFilled         (streamDoubleBuffer_8_io_tileFilled             ), //o
    .io_refreshSettled     (streamDoubleBuffer_8_io_refreshSettled         ), //o
    .clk                   (clk                                            ), //i
    .reset                 (reset                                          )  //i
  );
  DoubleBufferStreamer_2 doubleBufferStreamer_6 (
    .io_readAddr            (doubleBufferStreamer_6_io_readAddr                 ), //o
    .io_readData_0          (streamDoubleBuffer_8_io_readData_0[15:0]           ), //i
    .io_nextTile            (doubleBufferStreamer_6_io_nextTile                 ), //o
    .io_tileReady           (streamDoubleBuffer_8_io_tileReady                  ), //i
    .io_streamOut_valid     (doubleBufferStreamer_6_io_streamOut_valid          ), //o
    .io_streamOut_ready     (conv2DLayer_1_io_b_stream_ready                    ), //i
    .io_streamOut_payload_0 (doubleBufferStreamer_6_io_streamOut_payload_0[15:0]), //o
    .io_reArm               (_zz_when_Sequential_l472_1                         ), //i
    .clk                    (clk                                                ), //i
    .reset                  (reset                                              )  //i
  );
  CastOp castOp_2 (
    .io_a_stream_valid      (doubleBufferStreamer_5_io_streamOut_valid          ), //i
    .io_a_stream_ready      (castOp_2_io_a_stream_ready                         ), //o
    .io_a_stream_payload_0  (doubleBufferStreamer_5_io_streamOut_payload_0[3:0] ), //i
    .io_a_stream_payload_1  (doubleBufferStreamer_5_io_streamOut_payload_1[3:0] ), //i
    .io_a_stream_payload_2  (doubleBufferStreamer_5_io_streamOut_payload_2[3:0] ), //i
    .io_a_stream_payload_3  (doubleBufferStreamer_5_io_streamOut_payload_3[3:0] ), //i
    .io_a_stream_payload_4  (doubleBufferStreamer_5_io_streamOut_payload_4[3:0] ), //i
    .io_a_stream_payload_5  (doubleBufferStreamer_5_io_streamOut_payload_5[3:0] ), //i
    .io_a_stream_payload_6  (doubleBufferStreamer_5_io_streamOut_payload_6[3:0] ), //i
    .io_a_stream_payload_7  (doubleBufferStreamer_5_io_streamOut_payload_7[3:0] ), //i
    .io_a_stream_payload_8  (doubleBufferStreamer_5_io_streamOut_payload_8[3:0] ), //i
    .io_a_stream_payload_9  (doubleBufferStreamer_5_io_streamOut_payload_9[3:0] ), //i
    .io_a_stream_payload_10 (doubleBufferStreamer_5_io_streamOut_payload_10[3:0]), //i
    .io_a_stream_payload_11 (doubleBufferStreamer_5_io_streamOut_payload_11[3:0]), //i
    .io_a_stream_payload_12 (doubleBufferStreamer_5_io_streamOut_payload_12[3:0]), //i
    .io_a_stream_payload_13 (doubleBufferStreamer_5_io_streamOut_payload_13[3:0]), //i
    .io_a_stream_payload_14 (doubleBufferStreamer_5_io_streamOut_payload_14[3:0]), //i
    .io_a_stream_payload_15 (doubleBufferStreamer_5_io_streamOut_payload_15[3:0]), //i
    .io_a_stream_payload_16 (doubleBufferStreamer_5_io_streamOut_payload_16[3:0]), //i
    .io_a_stream_payload_17 (doubleBufferStreamer_5_io_streamOut_payload_17[3:0]), //i
    .io_a_stream_payload_18 (doubleBufferStreamer_5_io_streamOut_payload_18[3:0]), //i
    .io_a_stream_payload_19 (doubleBufferStreamer_5_io_streamOut_payload_19[3:0]), //i
    .io_a_stream_payload_20 (doubleBufferStreamer_5_io_streamOut_payload_20[3:0]), //i
    .io_a_stream_payload_21 (doubleBufferStreamer_5_io_streamOut_payload_21[3:0]), //i
    .io_a_stream_payload_22 (doubleBufferStreamer_5_io_streamOut_payload_22[3:0]), //i
    .io_a_stream_payload_23 (doubleBufferStreamer_5_io_streamOut_payload_23[3:0]), //i
    .io_a_stream_payload_24 (doubleBufferStreamer_5_io_streamOut_payload_24[3:0]), //i
    .io_c_stream_valid      (castOp_2_io_c_stream_valid                         ), //o
    .io_c_stream_ready      (conv2DLayer_1_io_w_stream_ready                    ), //i
    .io_c_stream_payload_0  (castOp_2_io_c_stream_payload_0[7:0]                ), //o
    .io_c_stream_payload_1  (castOp_2_io_c_stream_payload_1[7:0]                ), //o
    .io_c_stream_payload_2  (castOp_2_io_c_stream_payload_2[7:0]                ), //o
    .io_c_stream_payload_3  (castOp_2_io_c_stream_payload_3[7:0]                ), //o
    .io_c_stream_payload_4  (castOp_2_io_c_stream_payload_4[7:0]                ), //o
    .io_c_stream_payload_5  (castOp_2_io_c_stream_payload_5[7:0]                ), //o
    .io_c_stream_payload_6  (castOp_2_io_c_stream_payload_6[7:0]                ), //o
    .io_c_stream_payload_7  (castOp_2_io_c_stream_payload_7[7:0]                ), //o
    .io_c_stream_payload_8  (castOp_2_io_c_stream_payload_8[7:0]                ), //o
    .io_c_stream_payload_9  (castOp_2_io_c_stream_payload_9[7:0]                ), //o
    .io_c_stream_payload_10 (castOp_2_io_c_stream_payload_10[7:0]               ), //o
    .io_c_stream_payload_11 (castOp_2_io_c_stream_payload_11[7:0]               ), //o
    .io_c_stream_payload_12 (castOp_2_io_c_stream_payload_12[7:0]               ), //o
    .io_c_stream_payload_13 (castOp_2_io_c_stream_payload_13[7:0]               ), //o
    .io_c_stream_payload_14 (castOp_2_io_c_stream_payload_14[7:0]               ), //o
    .io_c_stream_payload_15 (castOp_2_io_c_stream_payload_15[7:0]               ), //o
    .io_c_stream_payload_16 (castOp_2_io_c_stream_payload_16[7:0]               ), //o
    .io_c_stream_payload_17 (castOp_2_io_c_stream_payload_17[7:0]               ), //o
    .io_c_stream_payload_18 (castOp_2_io_c_stream_payload_18[7:0]               ), //o
    .io_c_stream_payload_19 (castOp_2_io_c_stream_payload_19[7:0]               ), //o
    .io_c_stream_payload_20 (castOp_2_io_c_stream_payload_20[7:0]               ), //o
    .io_c_stream_payload_21 (castOp_2_io_c_stream_payload_21[7:0]               ), //o
    .io_c_stream_payload_22 (castOp_2_io_c_stream_payload_22[7:0]               ), //o
    .io_c_stream_payload_23 (castOp_2_io_c_stream_payload_23[7:0]               ), //o
    .io_c_stream_payload_24 (castOp_2_io_c_stream_payload_24[7:0]               )  //o
  );
  Conv2DLayer conv2DLayer_1 (
    .io_x_stream_valid      (imgQueue_stream_valid                              ), //i
    .io_x_stream_ready      (conv2DLayer_1_io_x_stream_ready                    ), //o
    .io_x_stream_payload_0  (imgQueue_stream_payload_0[7:0]                     ), //i
    .io_w_stream_valid      (castOp_2_io_c_stream_valid                         ), //i
    .io_w_stream_ready      (conv2DLayer_1_io_w_stream_ready                    ), //o
    .io_w_stream_payload_0  (castOp_2_io_c_stream_payload_0[7:0]                ), //i
    .io_w_stream_payload_1  (castOp_2_io_c_stream_payload_1[7:0]                ), //i
    .io_w_stream_payload_2  (castOp_2_io_c_stream_payload_2[7:0]                ), //i
    .io_w_stream_payload_3  (castOp_2_io_c_stream_payload_3[7:0]                ), //i
    .io_w_stream_payload_4  (castOp_2_io_c_stream_payload_4[7:0]                ), //i
    .io_w_stream_payload_5  (castOp_2_io_c_stream_payload_5[7:0]                ), //i
    .io_w_stream_payload_6  (castOp_2_io_c_stream_payload_6[7:0]                ), //i
    .io_w_stream_payload_7  (castOp_2_io_c_stream_payload_7[7:0]                ), //i
    .io_w_stream_payload_8  (castOp_2_io_c_stream_payload_8[7:0]                ), //i
    .io_w_stream_payload_9  (castOp_2_io_c_stream_payload_9[7:0]                ), //i
    .io_w_stream_payload_10 (castOp_2_io_c_stream_payload_10[7:0]               ), //i
    .io_w_stream_payload_11 (castOp_2_io_c_stream_payload_11[7:0]               ), //i
    .io_w_stream_payload_12 (castOp_2_io_c_stream_payload_12[7:0]               ), //i
    .io_w_stream_payload_13 (castOp_2_io_c_stream_payload_13[7:0]               ), //i
    .io_w_stream_payload_14 (castOp_2_io_c_stream_payload_14[7:0]               ), //i
    .io_w_stream_payload_15 (castOp_2_io_c_stream_payload_15[7:0]               ), //i
    .io_w_stream_payload_16 (castOp_2_io_c_stream_payload_16[7:0]               ), //i
    .io_w_stream_payload_17 (castOp_2_io_c_stream_payload_17[7:0]               ), //i
    .io_w_stream_payload_18 (castOp_2_io_c_stream_payload_18[7:0]               ), //i
    .io_w_stream_payload_19 (castOp_2_io_c_stream_payload_19[7:0]               ), //i
    .io_w_stream_payload_20 (castOp_2_io_c_stream_payload_20[7:0]               ), //i
    .io_w_stream_payload_21 (castOp_2_io_c_stream_payload_21[7:0]               ), //i
    .io_w_stream_payload_22 (castOp_2_io_c_stream_payload_22[7:0]               ), //i
    .io_w_stream_payload_23 (castOp_2_io_c_stream_payload_23[7:0]               ), //i
    .io_w_stream_payload_24 (castOp_2_io_c_stream_payload_24[7:0]               ), //i
    .io_b_stream_valid      (doubleBufferStreamer_6_io_streamOut_valid          ), //i
    .io_b_stream_ready      (conv2DLayer_1_io_b_stream_ready                    ), //o
    .io_b_stream_payload_0  (doubleBufferStreamer_6_io_streamOut_payload_0[15:0]), //i
    .io_y_stream_valid      (conv2DLayer_1_io_y_stream_valid                    ), //o
    .io_y_stream_ready      (reLUOp_1_io_x_stream_ready                         ), //i
    .io_y_stream_payload_0  (conv2DLayer_1_io_y_stream_payload_0[15:0]          ), //o
    .io_reArm               (_zz_when_Sequential_l392_1                         ), //i
    .clk                    (clk                                                ), //i
    .reset                  (reset                                              )  //i
  );
  ReLUOp reLUOp_1 (
    .io_x_stream_valid     (conv2DLayer_1_io_y_stream_valid          ), //i
    .io_x_stream_ready     (reLUOp_1_io_x_stream_ready               ), //o
    .io_x_stream_payload_0 (conv2DLayer_1_io_y_stream_payload_0[15:0]), //i
    .io_y_stream_valid     (reLUOp_1_io_y_stream_valid               ), //o
    .io_y_stream_ready     (maxPool2DOp_1_io_a_stream_ready          ), //i
    .io_y_stream_payload_0 (reLUOp_1_io_y_stream_payload_0[15:0]     )  //o
  );
  MaxPool2DOp maxPool2DOp_1 (
    .io_a_stream_valid     (reLUOp_1_io_y_stream_valid               ), //i
    .io_a_stream_ready     (maxPool2DOp_1_io_a_stream_ready          ), //o
    .io_a_stream_payload_0 (reLUOp_1_io_y_stream_payload_0[15:0]     ), //i
    .io_c_stream_valid     (maxPool2DOp_1_io_c_stream_valid          ), //o
    .io_c_stream_ready     (repackOp_8_io_a_stream_ready             ), //i
    .io_c_stream_payload_0 (maxPool2DOp_1_io_c_stream_payload_0[15:0]), //o
    .io_c_stream_payload_1 (maxPool2DOp_1_io_c_stream_payload_1[15:0]), //o
    .clk                   (clk                                      ), //i
    .reset                 (reset                                    )  //i
  );
  RepackOp_6 repackOp_8 (
    .io_a_stream_valid     (maxPool2DOp_1_io_c_stream_valid          ), //i
    .io_a_stream_ready     (repackOp_8_io_a_stream_ready             ), //o
    .io_a_stream_payload_0 (maxPool2DOp_1_io_c_stream_payload_0[15:0]), //i
    .io_a_stream_payload_1 (maxPool2DOp_1_io_c_stream_payload_1[15:0]), //i
    .io_c_stream_valid     (repackOp_8_io_c_stream_valid             ), //o
    .io_c_stream_ready     (castOp_3_io_a_stream_ready               ), //i
    .io_c_stream_payload_0 (repackOp_8_io_c_stream_payload_0[15:0]   ), //o
    .io_reArm              (1'b0                                     ), //i
    .io_isEmpty            (repackOp_8_io_isEmpty                    ), //o
    .clk                   (clk                                      ), //i
    .reset                 (reset                                    )  //i
  );
  CastOp_1 castOp_3 (
    .io_a_stream_valid              (repackOp_8_io_c_stream_valid                ), //i
    .io_a_stream_ready              (castOp_3_io_a_stream_ready                  ), //o
    .io_a_stream_payload_0          (repackOp_8_io_c_stream_payload_0[15:0]      ), //i
    .io_c_stream_valid              (castOp_3_io_c_stream_valid                  ), //o
    .io_c_stream_ready              (repackOp_9_io_a_stream_ready                ), //i
    .io_c_stream_payload_0_mantissa (castOp_3_io_c_stream_payload_0_mantissa[2:0]), //o
    .io_c_stream_payload_0_exponent (castOp_3_io_c_stream_payload_0_exponent[3:0]), //o
    .io_c_stream_payload_0_sign     (castOp_3_io_c_stream_payload_0_sign         )  //o
  );
  DMAReader_3 dMAReader_7 (
    .io_cmd_valid                           (_zz_io_cmd_valid_5                                     ), //i
    .io_cmd_ready                           (dMAReader_7_io_cmd_ready                               ), //o
    .io_cmd_payload_address                 (dMAReader_7_io_cmd_payload_address[31:0]               ), //i
    .io_cmd_payload_length                  (16'h0167                                               ), //i
    .io_axiMaster_ar_valid                  (dMAReader_7_io_axiMaster_ar_valid                      ), //o
    .io_axiMaster_ar_ready                  (axi4ReadOnlyArbiter_1_io_inputs_3_ar_ready             ), //i
    .io_axiMaster_ar_payload_addr           (dMAReader_7_io_axiMaster_ar_payload_addr[31:0]         ), //o
    .io_axiMaster_ar_payload_id             (dMAReader_7_io_axiMaster_ar_payload_id                 ), //o
    .io_axiMaster_ar_payload_region         (dMAReader_7_io_axiMaster_ar_payload_region[3:0]        ), //o
    .io_axiMaster_ar_payload_len            (dMAReader_7_io_axiMaster_ar_payload_len[7:0]           ), //o
    .io_axiMaster_ar_payload_size           (dMAReader_7_io_axiMaster_ar_payload_size[2:0]          ), //o
    .io_axiMaster_ar_payload_burst          (dMAReader_7_io_axiMaster_ar_payload_burst[1:0]         ), //o
    .io_axiMaster_ar_payload_lock           (dMAReader_7_io_axiMaster_ar_payload_lock               ), //o
    .io_axiMaster_ar_payload_cache          (dMAReader_7_io_axiMaster_ar_payload_cache[3:0]         ), //o
    .io_axiMaster_ar_payload_qos            (dMAReader_7_io_axiMaster_ar_payload_qos[3:0]           ), //o
    .io_axiMaster_ar_payload_prot           (dMAReader_7_io_axiMaster_ar_payload_prot[2:0]          ), //o
    .io_axiMaster_r_valid                   (axi4ReadOnlyArbiter_1_io_inputs_3_r_valid              ), //i
    .io_axiMaster_r_ready                   (dMAReader_7_io_axiMaster_r_ready                       ), //o
    .io_axiMaster_r_payload_data            (axi4ReadOnlyArbiter_1_io_inputs_3_r_payload_data[63:0] ), //i
    .io_axiMaster_r_payload_id              (axi4ReadOnlyArbiter_1_io_inputs_3_r_payload_id         ), //i
    .io_axiMaster_r_payload_resp            (axi4ReadOnlyArbiter_1_io_inputs_3_r_payload_resp[1:0]  ), //i
    .io_axiMaster_r_payload_last            (axi4ReadOnlyArbiter_1_io_inputs_3_r_payload_last       ), //i
    .io_outStream_stream_valid              (dMAReader_7_io_outStream_stream_valid                  ), //o
    .io_outStream_stream_ready              (streamDoubleBuffer_9_io_streamIn_ready                 ), //i
    .io_outStream_stream_payload_0_mantissa (dMAReader_7_io_outStream_stream_payload_0_mantissa[2:0]), //o
    .io_outStream_stream_payload_0_exponent (dMAReader_7_io_outStream_stream_payload_0_exponent[3:0]), //o
    .io_outStream_stream_payload_0_sign     (dMAReader_7_io_outStream_stream_payload_0_sign         ), //o
    .io_outStream_stream_payload_1_mantissa (dMAReader_7_io_outStream_stream_payload_1_mantissa[2:0]), //o
    .io_outStream_stream_payload_1_exponent (dMAReader_7_io_outStream_stream_payload_1_exponent[3:0]), //o
    .io_outStream_stream_payload_1_sign     (dMAReader_7_io_outStream_stream_payload_1_sign         ), //o
    .io_outStream_stream_payload_2_mantissa (dMAReader_7_io_outStream_stream_payload_2_mantissa[2:0]), //o
    .io_outStream_stream_payload_2_exponent (dMAReader_7_io_outStream_stream_payload_2_exponent[3:0]), //o
    .io_outStream_stream_payload_2_sign     (dMAReader_7_io_outStream_stream_payload_2_sign         ), //o
    .io_outStream_stream_payload_3_mantissa (dMAReader_7_io_outStream_stream_payload_3_mantissa[2:0]), //o
    .io_outStream_stream_payload_3_exponent (dMAReader_7_io_outStream_stream_payload_3_exponent[3:0]), //o
    .io_outStream_stream_payload_3_sign     (dMAReader_7_io_outStream_stream_payload_3_sign         ), //o
    .clk                                    (clk                                                    ), //i
    .reset                                  (reset                                                  )  //i
  );
  StreamDoubleBuffer_5 streamDoubleBuffer_9 (
    .io_streamIn_valid              (dMAReader_7_io_outStream_stream_valid                  ), //i
    .io_streamIn_ready              (streamDoubleBuffer_9_io_streamIn_ready                 ), //o
    .io_streamIn_payload_0_mantissa (dMAReader_7_io_outStream_stream_payload_0_mantissa[2:0]), //i
    .io_streamIn_payload_0_exponent (dMAReader_7_io_outStream_stream_payload_0_exponent[3:0]), //i
    .io_streamIn_payload_0_sign     (dMAReader_7_io_outStream_stream_payload_0_sign         ), //i
    .io_streamIn_payload_1_mantissa (dMAReader_7_io_outStream_stream_payload_1_mantissa[2:0]), //i
    .io_streamIn_payload_1_exponent (dMAReader_7_io_outStream_stream_payload_1_exponent[3:0]), //i
    .io_streamIn_payload_1_sign     (dMAReader_7_io_outStream_stream_payload_1_sign         ), //i
    .io_streamIn_payload_2_mantissa (dMAReader_7_io_outStream_stream_payload_2_mantissa[2:0]), //i
    .io_streamIn_payload_2_exponent (dMAReader_7_io_outStream_stream_payload_2_exponent[3:0]), //i
    .io_streamIn_payload_2_sign     (dMAReader_7_io_outStream_stream_payload_2_sign         ), //i
    .io_streamIn_payload_3_mantissa (dMAReader_7_io_outStream_stream_payload_3_mantissa[2:0]), //i
    .io_streamIn_payload_3_exponent (dMAReader_7_io_outStream_stream_payload_3_exponent[3:0]), //i
    .io_streamIn_payload_3_sign     (dMAReader_7_io_outStream_stream_payload_3_sign         ), //i
    .io_readAddr                    (doubleBufferStreamer_7_io_readAddr[9:0]                ), //i
    .io_readData_0_mantissa         (streamDoubleBuffer_9_io_readData_0_mantissa[2:0]       ), //o
    .io_readData_0_exponent         (streamDoubleBuffer_9_io_readData_0_exponent[3:0]       ), //o
    .io_readData_0_sign             (streamDoubleBuffer_9_io_readData_0_sign                ), //o
    .io_readData_1_mantissa         (streamDoubleBuffer_9_io_readData_1_mantissa[2:0]       ), //o
    .io_readData_1_exponent         (streamDoubleBuffer_9_io_readData_1_exponent[3:0]       ), //o
    .io_readData_1_sign             (streamDoubleBuffer_9_io_readData_1_sign                ), //o
    .io_readData_2_mantissa         (streamDoubleBuffer_9_io_readData_2_mantissa[2:0]       ), //o
    .io_readData_2_exponent         (streamDoubleBuffer_9_io_readData_2_exponent[3:0]       ), //o
    .io_readData_2_sign             (streamDoubleBuffer_9_io_readData_2_sign                ), //o
    .io_readData_3_mantissa         (streamDoubleBuffer_9_io_readData_3_mantissa[2:0]       ), //o
    .io_readData_3_exponent         (streamDoubleBuffer_9_io_readData_3_exponent[3:0]       ), //o
    .io_readData_3_sign             (streamDoubleBuffer_9_io_readData_3_sign                ), //o
    .io_nextTile                    (doubleBufferStreamer_7_io_nextTile                     ), //i
    .io_tileReady                   (streamDoubleBuffer_9_io_tileReady                      ), //o
    .io_reArm                       (streamDoubleBuffer_9_io_reArm                          ), //i
    .io_residentHold                (io_weightResident                                      ), //i
    .io_stageRequest                (_zz_io_stageRequest_2                                  ), //i
    .io_loadCanAccept               (streamDoubleBuffer_9_io_loadCanAccept                  ), //o
    .io_tileFilled                  (streamDoubleBuffer_9_io_tileFilled                     ), //o
    .io_refreshSettled              (streamDoubleBuffer_9_io_refreshSettled                 ), //o
    .clk                            (clk                                                    ), //i
    .reset                          (reset                                                  )  //i
  );
  DoubleBufferStreamer_3 doubleBufferStreamer_7 (
    .io_readAddr                     (doubleBufferStreamer_7_io_readAddr[9:0]                    ), //o
    .io_readData_0_mantissa          (streamDoubleBuffer_9_io_readData_0_mantissa[2:0]           ), //i
    .io_readData_0_exponent          (streamDoubleBuffer_9_io_readData_0_exponent[3:0]           ), //i
    .io_readData_0_sign              (streamDoubleBuffer_9_io_readData_0_sign                    ), //i
    .io_readData_1_mantissa          (streamDoubleBuffer_9_io_readData_1_mantissa[2:0]           ), //i
    .io_readData_1_exponent          (streamDoubleBuffer_9_io_readData_1_exponent[3:0]           ), //i
    .io_readData_1_sign              (streamDoubleBuffer_9_io_readData_1_sign                    ), //i
    .io_readData_2_mantissa          (streamDoubleBuffer_9_io_readData_2_mantissa[2:0]           ), //i
    .io_readData_2_exponent          (streamDoubleBuffer_9_io_readData_2_exponent[3:0]           ), //i
    .io_readData_2_sign              (streamDoubleBuffer_9_io_readData_2_sign                    ), //i
    .io_readData_3_mantissa          (streamDoubleBuffer_9_io_readData_3_mantissa[2:0]           ), //i
    .io_readData_3_exponent          (streamDoubleBuffer_9_io_readData_3_exponent[3:0]           ), //i
    .io_readData_3_sign              (streamDoubleBuffer_9_io_readData_3_sign                    ), //i
    .io_nextTile                     (doubleBufferStreamer_7_io_nextTile                         ), //o
    .io_tileReady                    (streamDoubleBuffer_9_io_tileReady                          ), //i
    .io_streamOut_valid              (doubleBufferStreamer_7_io_streamOut_valid                  ), //o
    .io_streamOut_ready              (linearLayer_1_io_w_stream_ready                            ), //i
    .io_streamOut_payload_0_mantissa (doubleBufferStreamer_7_io_streamOut_payload_0_mantissa[2:0]), //o
    .io_streamOut_payload_0_exponent (doubleBufferStreamer_7_io_streamOut_payload_0_exponent[3:0]), //o
    .io_streamOut_payload_0_sign     (doubleBufferStreamer_7_io_streamOut_payload_0_sign         ), //o
    .io_streamOut_payload_1_mantissa (doubleBufferStreamer_7_io_streamOut_payload_1_mantissa[2:0]), //o
    .io_streamOut_payload_1_exponent (doubleBufferStreamer_7_io_streamOut_payload_1_exponent[3:0]), //o
    .io_streamOut_payload_1_sign     (doubleBufferStreamer_7_io_streamOut_payload_1_sign         ), //o
    .io_streamOut_payload_2_mantissa (doubleBufferStreamer_7_io_streamOut_payload_2_mantissa[2:0]), //o
    .io_streamOut_payload_2_exponent (doubleBufferStreamer_7_io_streamOut_payload_2_exponent[3:0]), //o
    .io_streamOut_payload_2_sign     (doubleBufferStreamer_7_io_streamOut_payload_2_sign         ), //o
    .io_streamOut_payload_3_mantissa (doubleBufferStreamer_7_io_streamOut_payload_3_mantissa[2:0]), //o
    .io_streamOut_payload_3_exponent (doubleBufferStreamer_7_io_streamOut_payload_3_exponent[3:0]), //o
    .io_streamOut_payload_3_sign     (doubleBufferStreamer_7_io_streamOut_payload_3_sign         ), //o
    .io_reArm                        (_zz_when_Sequential_l392_3                                 ), //i
    .clk                             (clk                                                        ), //i
    .reset                           (reset                                                      )  //i
  );
  DMAReader_4 dMAReader_8 (
    .io_cmd_valid                           (_zz_io_cmd_valid_7                                     ), //i
    .io_cmd_ready                           (dMAReader_8_io_cmd_ready                               ), //o
    .io_cmd_payload_address                 (dMAReader_8_io_cmd_payload_address[31:0]               ), //i
    .io_cmd_payload_length                  (16'h0001                                               ), //i
    .io_axiMaster_ar_valid                  (dMAReader_8_io_axiMaster_ar_valid                      ), //o
    .io_axiMaster_ar_ready                  (axi4ReadOnlyArbiter_1_io_inputs_4_ar_ready             ), //i
    .io_axiMaster_ar_payload_addr           (dMAReader_8_io_axiMaster_ar_payload_addr[31:0]         ), //o
    .io_axiMaster_ar_payload_id             (dMAReader_8_io_axiMaster_ar_payload_id                 ), //o
    .io_axiMaster_ar_payload_region         (dMAReader_8_io_axiMaster_ar_payload_region[3:0]        ), //o
    .io_axiMaster_ar_payload_len            (dMAReader_8_io_axiMaster_ar_payload_len[7:0]           ), //o
    .io_axiMaster_ar_payload_size           (dMAReader_8_io_axiMaster_ar_payload_size[2:0]          ), //o
    .io_axiMaster_ar_payload_burst          (dMAReader_8_io_axiMaster_ar_payload_burst[1:0]         ), //o
    .io_axiMaster_ar_payload_lock           (dMAReader_8_io_axiMaster_ar_payload_lock               ), //o
    .io_axiMaster_ar_payload_cache          (dMAReader_8_io_axiMaster_ar_payload_cache[3:0]         ), //o
    .io_axiMaster_ar_payload_qos            (dMAReader_8_io_axiMaster_ar_payload_qos[3:0]           ), //o
    .io_axiMaster_ar_payload_prot           (dMAReader_8_io_axiMaster_ar_payload_prot[2:0]          ), //o
    .io_axiMaster_r_valid                   (axi4ReadOnlyArbiter_1_io_inputs_4_r_valid              ), //i
    .io_axiMaster_r_ready                   (dMAReader_8_io_axiMaster_r_ready                       ), //o
    .io_axiMaster_r_payload_data            (axi4ReadOnlyArbiter_1_io_inputs_4_r_payload_data[63:0] ), //i
    .io_axiMaster_r_payload_id              (axi4ReadOnlyArbiter_1_io_inputs_4_r_payload_id         ), //i
    .io_axiMaster_r_payload_resp            (axi4ReadOnlyArbiter_1_io_inputs_4_r_payload_resp[1:0]  ), //i
    .io_axiMaster_r_payload_last            (axi4ReadOnlyArbiter_1_io_inputs_4_r_payload_last       ), //i
    .io_outStream_stream_valid              (dMAReader_8_io_outStream_stream_valid                  ), //o
    .io_outStream_stream_ready              (streamDoubleBuffer_10_io_streamIn_ready                ), //i
    .io_outStream_stream_payload_0_mantissa (dMAReader_8_io_outStream_stream_payload_0_mantissa[2:0]), //o
    .io_outStream_stream_payload_0_exponent (dMAReader_8_io_outStream_stream_payload_0_exponent[3:0]), //o
    .io_outStream_stream_payload_0_sign     (dMAReader_8_io_outStream_stream_payload_0_sign         ), //o
    .clk                                    (clk                                                    ), //i
    .reset                                  (reset                                                  )  //i
  );
  StreamDoubleBuffer_6 streamDoubleBuffer_10 (
    .io_streamIn_valid              (dMAReader_8_io_outStream_stream_valid                  ), //i
    .io_streamIn_ready              (streamDoubleBuffer_10_io_streamIn_ready                ), //o
    .io_streamIn_payload_0_mantissa (dMAReader_8_io_outStream_stream_payload_0_mantissa[2:0]), //i
    .io_streamIn_payload_0_exponent (dMAReader_8_io_outStream_stream_payload_0_exponent[3:0]), //i
    .io_streamIn_payload_0_sign     (dMAReader_8_io_outStream_stream_payload_0_sign         ), //i
    .io_readAddr                    (doubleBufferStreamer_8_io_readAddr[3:0]                ), //i
    .io_readData_0_mantissa         (streamDoubleBuffer_10_io_readData_0_mantissa[2:0]      ), //o
    .io_readData_0_exponent         (streamDoubleBuffer_10_io_readData_0_exponent[3:0]      ), //o
    .io_readData_0_sign             (streamDoubleBuffer_10_io_readData_0_sign               ), //o
    .io_nextTile                    (doubleBufferStreamer_8_io_nextTile                     ), //i
    .io_tileReady                   (streamDoubleBuffer_10_io_tileReady                     ), //o
    .io_reArm                       (_zz_when_Sequential_l472_3                             ), //i
    .io_residentHold                (io_weightResident                                      ), //i
    .io_stageRequest                (_zz_io_stageRequest_3                                  ), //i
    .io_loadCanAccept               (streamDoubleBuffer_10_io_loadCanAccept                 ), //o
    .io_tileFilled                  (streamDoubleBuffer_10_io_tileFilled                    ), //o
    .io_refreshSettled              (streamDoubleBuffer_10_io_refreshSettled                ), //o
    .clk                            (clk                                                    ), //i
    .reset                          (reset                                                  )  //i
  );
  DoubleBufferStreamer_4 doubleBufferStreamer_8 (
    .io_readAddr                     (doubleBufferStreamer_8_io_readAddr[3:0]                    ), //o
    .io_readData_0_mantissa          (streamDoubleBuffer_10_io_readData_0_mantissa[2:0]          ), //i
    .io_readData_0_exponent          (streamDoubleBuffer_10_io_readData_0_exponent[3:0]          ), //i
    .io_readData_0_sign              (streamDoubleBuffer_10_io_readData_0_sign                   ), //i
    .io_nextTile                     (doubleBufferStreamer_8_io_nextTile                         ), //o
    .io_tileReady                    (streamDoubleBuffer_10_io_tileReady                         ), //i
    .io_streamOut_valid              (doubleBufferStreamer_8_io_streamOut_valid                  ), //o
    .io_streamOut_ready              (linearLayer_1_io_b_stream_ready                            ), //i
    .io_streamOut_payload_0_mantissa (doubleBufferStreamer_8_io_streamOut_payload_0_mantissa[2:0]), //o
    .io_streamOut_payload_0_exponent (doubleBufferStreamer_8_io_streamOut_payload_0_exponent[3:0]), //o
    .io_streamOut_payload_0_sign     (doubleBufferStreamer_8_io_streamOut_payload_0_sign         ), //o
    .io_reArm                        (_zz_when_Sequential_l472_3                                 ), //i
    .clk                             (clk                                                        ), //i
    .reset                           (reset                                                      )  //i
  );
  RepackOp_7 repackOp_9 (
    .io_a_stream_valid              (castOp_3_io_c_stream_valid                    ), //i
    .io_a_stream_ready              (repackOp_9_io_a_stream_ready                  ), //o
    .io_a_stream_payload_0_mantissa (castOp_3_io_c_stream_payload_0_mantissa[2:0]  ), //i
    .io_a_stream_payload_0_exponent (castOp_3_io_c_stream_payload_0_exponent[3:0]  ), //i
    .io_a_stream_payload_0_sign     (castOp_3_io_c_stream_payload_0_sign           ), //i
    .io_c_stream_valid              (repackOp_9_io_c_stream_valid                  ), //o
    .io_c_stream_ready              (linearLayer_1_io_a_stream_ready               ), //i
    .io_c_stream_payload_0_mantissa (repackOp_9_io_c_stream_payload_0_mantissa[2:0]), //o
    .io_c_stream_payload_0_exponent (repackOp_9_io_c_stream_payload_0_exponent[3:0]), //o
    .io_c_stream_payload_0_sign     (repackOp_9_io_c_stream_payload_0_sign         ), //o
    .io_c_stream_payload_1_mantissa (repackOp_9_io_c_stream_payload_1_mantissa[2:0]), //o
    .io_c_stream_payload_1_exponent (repackOp_9_io_c_stream_payload_1_exponent[3:0]), //o
    .io_c_stream_payload_1_sign     (repackOp_9_io_c_stream_payload_1_sign         ), //o
    .io_c_stream_payload_2_mantissa (repackOp_9_io_c_stream_payload_2_mantissa[2:0]), //o
    .io_c_stream_payload_2_exponent (repackOp_9_io_c_stream_payload_2_exponent[3:0]), //o
    .io_c_stream_payload_2_sign     (repackOp_9_io_c_stream_payload_2_sign         ), //o
    .io_c_stream_payload_3_mantissa (repackOp_9_io_c_stream_payload_3_mantissa[2:0]), //o
    .io_c_stream_payload_3_exponent (repackOp_9_io_c_stream_payload_3_exponent[3:0]), //o
    .io_c_stream_payload_3_sign     (repackOp_9_io_c_stream_payload_3_sign         ), //o
    .io_reArm                       (1'b0                                          ), //i
    .io_isEmpty                     (repackOp_9_io_isEmpty                         ), //o
    .clk                            (clk                                           ), //i
    .reset                          (reset                                         )  //i
  );
  LinearLayer linearLayer_1 (
    .io_a_stream_valid              (repackOp_9_io_c_stream_valid                               ), //i
    .io_a_stream_ready              (linearLayer_1_io_a_stream_ready                            ), //o
    .io_a_stream_payload_0_mantissa (repackOp_9_io_c_stream_payload_0_mantissa[2:0]             ), //i
    .io_a_stream_payload_0_exponent (repackOp_9_io_c_stream_payload_0_exponent[3:0]             ), //i
    .io_a_stream_payload_0_sign     (repackOp_9_io_c_stream_payload_0_sign                      ), //i
    .io_a_stream_payload_1_mantissa (repackOp_9_io_c_stream_payload_1_mantissa[2:0]             ), //i
    .io_a_stream_payload_1_exponent (repackOp_9_io_c_stream_payload_1_exponent[3:0]             ), //i
    .io_a_stream_payload_1_sign     (repackOp_9_io_c_stream_payload_1_sign                      ), //i
    .io_a_stream_payload_2_mantissa (repackOp_9_io_c_stream_payload_2_mantissa[2:0]             ), //i
    .io_a_stream_payload_2_exponent (repackOp_9_io_c_stream_payload_2_exponent[3:0]             ), //i
    .io_a_stream_payload_2_sign     (repackOp_9_io_c_stream_payload_2_sign                      ), //i
    .io_a_stream_payload_3_mantissa (repackOp_9_io_c_stream_payload_3_mantissa[2:0]             ), //i
    .io_a_stream_payload_3_exponent (repackOp_9_io_c_stream_payload_3_exponent[3:0]             ), //i
    .io_a_stream_payload_3_sign     (repackOp_9_io_c_stream_payload_3_sign                      ), //i
    .io_w_stream_valid              (doubleBufferStreamer_7_io_streamOut_valid                  ), //i
    .io_w_stream_ready              (linearLayer_1_io_w_stream_ready                            ), //o
    .io_w_stream_payload_0_mantissa (doubleBufferStreamer_7_io_streamOut_payload_0_mantissa[2:0]), //i
    .io_w_stream_payload_0_exponent (doubleBufferStreamer_7_io_streamOut_payload_0_exponent[3:0]), //i
    .io_w_stream_payload_0_sign     (doubleBufferStreamer_7_io_streamOut_payload_0_sign         ), //i
    .io_w_stream_payload_1_mantissa (doubleBufferStreamer_7_io_streamOut_payload_1_mantissa[2:0]), //i
    .io_w_stream_payload_1_exponent (doubleBufferStreamer_7_io_streamOut_payload_1_exponent[3:0]), //i
    .io_w_stream_payload_1_sign     (doubleBufferStreamer_7_io_streamOut_payload_1_sign         ), //i
    .io_w_stream_payload_2_mantissa (doubleBufferStreamer_7_io_streamOut_payload_2_mantissa[2:0]), //i
    .io_w_stream_payload_2_exponent (doubleBufferStreamer_7_io_streamOut_payload_2_exponent[3:0]), //i
    .io_w_stream_payload_2_sign     (doubleBufferStreamer_7_io_streamOut_payload_2_sign         ), //i
    .io_w_stream_payload_3_mantissa (doubleBufferStreamer_7_io_streamOut_payload_3_mantissa[2:0]), //i
    .io_w_stream_payload_3_exponent (doubleBufferStreamer_7_io_streamOut_payload_3_exponent[3:0]), //i
    .io_w_stream_payload_3_sign     (doubleBufferStreamer_7_io_streamOut_payload_3_sign         ), //i
    .io_b_stream_valid              (doubleBufferStreamer_8_io_streamOut_valid                  ), //i
    .io_b_stream_ready              (linearLayer_1_io_b_stream_ready                            ), //o
    .io_b_stream_payload_0_mantissa (doubleBufferStreamer_8_io_streamOut_payload_0_mantissa[2:0]), //i
    .io_b_stream_payload_0_exponent (doubleBufferStreamer_8_io_streamOut_payload_0_exponent[3:0]), //i
    .io_b_stream_payload_0_sign     (doubleBufferStreamer_8_io_streamOut_payload_0_sign         ), //i
    .io_y_stream_valid              (linearLayer_1_io_y_stream_valid                            ), //o
    .io_y_stream_ready              (io_outStream_stream_ready                                  ), //i
    .io_y_stream_payload_0_mantissa (linearLayer_1_io_y_stream_payload_0_mantissa[2:0]          ), //o
    .io_y_stream_payload_0_exponent (linearLayer_1_io_y_stream_payload_0_exponent[3:0]          ), //o
    .io_y_stream_payload_0_sign     (linearLayer_1_io_y_stream_payload_0_sign                   ), //o
    .io_reArm                       (_zz_when_Sequential_l392_3                                 ), //i
    .io_biasReArm                   (_zz_when_Sequential_l472_3                                 ), //i
    .clk                            (clk                                                        ), //i
    .reset                          (reset                                                      )  //i
  );
  Axi4ReadOnlyArbiter axi4ReadOnlyArbiter_1 (
    .io_inputs_0_ar_valid          (dmaImg_io_axiMaster_ar_valid                          ), //i
    .io_inputs_0_ar_ready          (axi4ReadOnlyArbiter_1_io_inputs_0_ar_ready            ), //o
    .io_inputs_0_ar_payload_addr   (dmaImg_io_axiMaster_ar_payload_addr[31:0]             ), //i
    .io_inputs_0_ar_payload_id     (dmaImg_io_axiMaster_ar_payload_id                     ), //i
    .io_inputs_0_ar_payload_region (dmaImg_io_axiMaster_ar_payload_region[3:0]            ), //i
    .io_inputs_0_ar_payload_len    (dmaImg_io_axiMaster_ar_payload_len[7:0]               ), //i
    .io_inputs_0_ar_payload_size   (dmaImg_io_axiMaster_ar_payload_size[2:0]              ), //i
    .io_inputs_0_ar_payload_burst  (dmaImg_io_axiMaster_ar_payload_burst[1:0]             ), //i
    .io_inputs_0_ar_payload_lock   (dmaImg_io_axiMaster_ar_payload_lock                   ), //i
    .io_inputs_0_ar_payload_cache  (dmaImg_io_axiMaster_ar_payload_cache[3:0]             ), //i
    .io_inputs_0_ar_payload_qos    (dmaImg_io_axiMaster_ar_payload_qos[3:0]               ), //i
    .io_inputs_0_ar_payload_prot   (dmaImg_io_axiMaster_ar_payload_prot[2:0]              ), //i
    .io_inputs_0_r_valid           (axi4ReadOnlyArbiter_1_io_inputs_0_r_valid             ), //o
    .io_inputs_0_r_ready           (dmaImg_io_axiMaster_r_ready                           ), //i
    .io_inputs_0_r_payload_data    (axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_data[63:0]), //o
    .io_inputs_0_r_payload_id      (axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_id        ), //o
    .io_inputs_0_r_payload_resp    (axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_resp[1:0] ), //o
    .io_inputs_0_r_payload_last    (axi4ReadOnlyArbiter_1_io_inputs_0_r_payload_last      ), //o
    .io_inputs_1_ar_valid          (dMAReader_5_io_axiMaster_ar_valid                     ), //i
    .io_inputs_1_ar_ready          (axi4ReadOnlyArbiter_1_io_inputs_1_ar_ready            ), //o
    .io_inputs_1_ar_payload_addr   (dMAReader_5_io_axiMaster_ar_payload_addr[31:0]        ), //i
    .io_inputs_1_ar_payload_id     (dMAReader_5_io_axiMaster_ar_payload_id                ), //i
    .io_inputs_1_ar_payload_region (dMAReader_5_io_axiMaster_ar_payload_region[3:0]       ), //i
    .io_inputs_1_ar_payload_len    (dMAReader_5_io_axiMaster_ar_payload_len[7:0]          ), //i
    .io_inputs_1_ar_payload_size   (dMAReader_5_io_axiMaster_ar_payload_size[2:0]         ), //i
    .io_inputs_1_ar_payload_burst  (dMAReader_5_io_axiMaster_ar_payload_burst[1:0]        ), //i
    .io_inputs_1_ar_payload_lock   (dMAReader_5_io_axiMaster_ar_payload_lock              ), //i
    .io_inputs_1_ar_payload_cache  (dMAReader_5_io_axiMaster_ar_payload_cache[3:0]        ), //i
    .io_inputs_1_ar_payload_qos    (dMAReader_5_io_axiMaster_ar_payload_qos[3:0]          ), //i
    .io_inputs_1_ar_payload_prot   (dMAReader_5_io_axiMaster_ar_payload_prot[2:0]         ), //i
    .io_inputs_1_r_valid           (axi4ReadOnlyArbiter_1_io_inputs_1_r_valid             ), //o
    .io_inputs_1_r_ready           (dMAReader_5_io_axiMaster_r_ready                      ), //i
    .io_inputs_1_r_payload_data    (axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_data[63:0]), //o
    .io_inputs_1_r_payload_id      (axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_id        ), //o
    .io_inputs_1_r_payload_resp    (axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_resp[1:0] ), //o
    .io_inputs_1_r_payload_last    (axi4ReadOnlyArbiter_1_io_inputs_1_r_payload_last      ), //o
    .io_inputs_2_ar_valid          (dMAReader_6_io_axiMaster_ar_valid                     ), //i
    .io_inputs_2_ar_ready          (axi4ReadOnlyArbiter_1_io_inputs_2_ar_ready            ), //o
    .io_inputs_2_ar_payload_addr   (dMAReader_6_io_axiMaster_ar_payload_addr[31:0]        ), //i
    .io_inputs_2_ar_payload_id     (dMAReader_6_io_axiMaster_ar_payload_id                ), //i
    .io_inputs_2_ar_payload_region (dMAReader_6_io_axiMaster_ar_payload_region[3:0]       ), //i
    .io_inputs_2_ar_payload_len    (dMAReader_6_io_axiMaster_ar_payload_len[7:0]          ), //i
    .io_inputs_2_ar_payload_size   (dMAReader_6_io_axiMaster_ar_payload_size[2:0]         ), //i
    .io_inputs_2_ar_payload_burst  (dMAReader_6_io_axiMaster_ar_payload_burst[1:0]        ), //i
    .io_inputs_2_ar_payload_lock   (dMAReader_6_io_axiMaster_ar_payload_lock              ), //i
    .io_inputs_2_ar_payload_cache  (dMAReader_6_io_axiMaster_ar_payload_cache[3:0]        ), //i
    .io_inputs_2_ar_payload_qos    (dMAReader_6_io_axiMaster_ar_payload_qos[3:0]          ), //i
    .io_inputs_2_ar_payload_prot   (dMAReader_6_io_axiMaster_ar_payload_prot[2:0]         ), //i
    .io_inputs_2_r_valid           (axi4ReadOnlyArbiter_1_io_inputs_2_r_valid             ), //o
    .io_inputs_2_r_ready           (dMAReader_6_io_axiMaster_r_ready                      ), //i
    .io_inputs_2_r_payload_data    (axi4ReadOnlyArbiter_1_io_inputs_2_r_payload_data[63:0]), //o
    .io_inputs_2_r_payload_id      (axi4ReadOnlyArbiter_1_io_inputs_2_r_payload_id        ), //o
    .io_inputs_2_r_payload_resp    (axi4ReadOnlyArbiter_1_io_inputs_2_r_payload_resp[1:0] ), //o
    .io_inputs_2_r_payload_last    (axi4ReadOnlyArbiter_1_io_inputs_2_r_payload_last      ), //o
    .io_inputs_3_ar_valid          (dMAReader_7_io_axiMaster_ar_valid                     ), //i
    .io_inputs_3_ar_ready          (axi4ReadOnlyArbiter_1_io_inputs_3_ar_ready            ), //o
    .io_inputs_3_ar_payload_addr   (dMAReader_7_io_axiMaster_ar_payload_addr[31:0]        ), //i
    .io_inputs_3_ar_payload_id     (dMAReader_7_io_axiMaster_ar_payload_id                ), //i
    .io_inputs_3_ar_payload_region (dMAReader_7_io_axiMaster_ar_payload_region[3:0]       ), //i
    .io_inputs_3_ar_payload_len    (dMAReader_7_io_axiMaster_ar_payload_len[7:0]          ), //i
    .io_inputs_3_ar_payload_size   (dMAReader_7_io_axiMaster_ar_payload_size[2:0]         ), //i
    .io_inputs_3_ar_payload_burst  (dMAReader_7_io_axiMaster_ar_payload_burst[1:0]        ), //i
    .io_inputs_3_ar_payload_lock   (dMAReader_7_io_axiMaster_ar_payload_lock              ), //i
    .io_inputs_3_ar_payload_cache  (dMAReader_7_io_axiMaster_ar_payload_cache[3:0]        ), //i
    .io_inputs_3_ar_payload_qos    (dMAReader_7_io_axiMaster_ar_payload_qos[3:0]          ), //i
    .io_inputs_3_ar_payload_prot   (dMAReader_7_io_axiMaster_ar_payload_prot[2:0]         ), //i
    .io_inputs_3_r_valid           (axi4ReadOnlyArbiter_1_io_inputs_3_r_valid             ), //o
    .io_inputs_3_r_ready           (dMAReader_7_io_axiMaster_r_ready                      ), //i
    .io_inputs_3_r_payload_data    (axi4ReadOnlyArbiter_1_io_inputs_3_r_payload_data[63:0]), //o
    .io_inputs_3_r_payload_id      (axi4ReadOnlyArbiter_1_io_inputs_3_r_payload_id        ), //o
    .io_inputs_3_r_payload_resp    (axi4ReadOnlyArbiter_1_io_inputs_3_r_payload_resp[1:0] ), //o
    .io_inputs_3_r_payload_last    (axi4ReadOnlyArbiter_1_io_inputs_3_r_payload_last      ), //o
    .io_inputs_4_ar_valid          (dMAReader_8_io_axiMaster_ar_valid                     ), //i
    .io_inputs_4_ar_ready          (axi4ReadOnlyArbiter_1_io_inputs_4_ar_ready            ), //o
    .io_inputs_4_ar_payload_addr   (dMAReader_8_io_axiMaster_ar_payload_addr[31:0]        ), //i
    .io_inputs_4_ar_payload_id     (dMAReader_8_io_axiMaster_ar_payload_id                ), //i
    .io_inputs_4_ar_payload_region (dMAReader_8_io_axiMaster_ar_payload_region[3:0]       ), //i
    .io_inputs_4_ar_payload_len    (dMAReader_8_io_axiMaster_ar_payload_len[7:0]          ), //i
    .io_inputs_4_ar_payload_size   (dMAReader_8_io_axiMaster_ar_payload_size[2:0]         ), //i
    .io_inputs_4_ar_payload_burst  (dMAReader_8_io_axiMaster_ar_payload_burst[1:0]        ), //i
    .io_inputs_4_ar_payload_lock   (dMAReader_8_io_axiMaster_ar_payload_lock              ), //i
    .io_inputs_4_ar_payload_cache  (dMAReader_8_io_axiMaster_ar_payload_cache[3:0]        ), //i
    .io_inputs_4_ar_payload_qos    (dMAReader_8_io_axiMaster_ar_payload_qos[3:0]          ), //i
    .io_inputs_4_ar_payload_prot   (dMAReader_8_io_axiMaster_ar_payload_prot[2:0]         ), //i
    .io_inputs_4_r_valid           (axi4ReadOnlyArbiter_1_io_inputs_4_r_valid             ), //o
    .io_inputs_4_r_ready           (dMAReader_8_io_axiMaster_r_ready                      ), //i
    .io_inputs_4_r_payload_data    (axi4ReadOnlyArbiter_1_io_inputs_4_r_payload_data[63:0]), //o
    .io_inputs_4_r_payload_id      (axi4ReadOnlyArbiter_1_io_inputs_4_r_payload_id        ), //o
    .io_inputs_4_r_payload_resp    (axi4ReadOnlyArbiter_1_io_inputs_4_r_payload_resp[1:0] ), //o
    .io_inputs_4_r_payload_last    (axi4ReadOnlyArbiter_1_io_inputs_4_r_payload_last      ), //o
    .io_output_ar_valid            (axi4ReadOnlyArbiter_1_io_output_ar_valid              ), //o
    .io_output_ar_ready            (io_axiMaster_ar_ready                                 ), //i
    .io_output_ar_payload_addr     (axi4ReadOnlyArbiter_1_io_output_ar_payload_addr[31:0] ), //o
    .io_output_ar_payload_id       (axi4ReadOnlyArbiter_1_io_output_ar_payload_id[3:0]    ), //o
    .io_output_ar_payload_region   (axi4ReadOnlyArbiter_1_io_output_ar_payload_region[3:0]), //o
    .io_output_ar_payload_len      (axi4ReadOnlyArbiter_1_io_output_ar_payload_len[7:0]   ), //o
    .io_output_ar_payload_size     (axi4ReadOnlyArbiter_1_io_output_ar_payload_size[2:0]  ), //o
    .io_output_ar_payload_burst    (axi4ReadOnlyArbiter_1_io_output_ar_payload_burst[1:0] ), //o
    .io_output_ar_payload_lock     (axi4ReadOnlyArbiter_1_io_output_ar_payload_lock       ), //o
    .io_output_ar_payload_cache    (axi4ReadOnlyArbiter_1_io_output_ar_payload_cache[3:0] ), //o
    .io_output_ar_payload_qos      (axi4ReadOnlyArbiter_1_io_output_ar_payload_qos[3:0]   ), //o
    .io_output_ar_payload_prot     (axi4ReadOnlyArbiter_1_io_output_ar_payload_prot[2:0]  ), //o
    .io_output_r_valid             (io_axiMaster_r_valid                                  ), //i
    .io_output_r_ready             (axi4ReadOnlyArbiter_1_io_output_r_ready               ), //o
    .io_output_r_payload_data      (io_axiMaster_r_payload_data[63:0]                     ), //i
    .io_output_r_payload_id        (io_axiMaster_r_payload_id[3:0]                        ), //i
    .io_output_r_payload_resp      (io_axiMaster_r_payload_resp[1:0]                      ), //i
    .io_output_r_payload_last      (io_axiMaster_r_payload_last                           ), //i
    .clk                           (clk                                                   ), //i
    .reset                         (reset                                                 )  //i
  );
  assign residentRise = (io_weightResident && (! residentPrev));
  assign io_start_ready = io_start_fork_io_input_ready;
  assign dmaImg_io_cmd_payload_baseAddress = _zz_io_cmd_payload_baseAddress[31:0];
  assign dmaImg_io_cmd_payload_patchHeight = ((imgBandIdx == 1'b0) ? 16'h001c : 16'h001c);
  assign dmaImg_io_cmd_fire = (imgBandActive && dmaImg_io_cmd_ready);
  assign when_Sequential_l231 = (imgBandIdx == 1'b0);
  assign imgDoubleBuffer_io_reArm = (io_start_valid && (! prevStartValid));
  assign imgStreamer_io_reArm = (io_start_valid && (! prevStartValid));
  assign imgQueue_stream_valid = imgStreamer_io_streamOut_valid;
  assign imgQueue_stream_payload_0 = imgStreamer_io_streamOut_payload_0;
  assign _zz_when_Sequential_l392 = (io_weightResident && io_weightPrefetch);
  assign _zz_io_outputs_1_ready_2 = ((((! _zz_io_outputs_1_ready) || (! io_weightResident)) || _zz_io_outputs_1_ready_1) || residentRise);
  assign _zz_io_cmd_valid = (io_start_fork_io_outputs_1_valid && _zz_io_outputs_1_ready_2);
  assign _zz_io_cmd_valid_1 = (_zz_io_cmd_valid || ((((_zz_when_Sequential_l392 && (_zz_io_outputs_1_ready_1 || residentRise)) && _zz_io_outputs_1_ready_3) && streamDoubleBuffer_7_io_loadCanAccept) && (! _zz_io_cmd_valid)));
  assign io_start_fork_io_outputs_1_ready = (_zz_io_outputs_1_ready_2 ? _zz_io_outputs_1_ready_3 : 1'b1);
  assign _zz_io_outputs_1_ready_3 = dMAReader_5_io_cmd_ready;
  assign dMAReader_5_io_cmd_payload_address = (io_weightsBaseAddress + 32'h0);
  assign _zz_when_Sequential_l392_1 = (_zz_io_cmd_valid_1 && _zz_io_outputs_1_ready_3);
  assign when_Sequential_l392 = (_zz_when_Sequential_l392_1 && _zz_when_Sequential_l392);
  assign streamDoubleBuffer_7_io_reArm = (_zz_when_Sequential_l392_1 && (! _zz_when_Sequential_l392));
  assign _zz_when_Sequential_l472 = (io_weightResident && io_weightPrefetch);
  assign _zz_io_outputs_2_ready_2 = ((((! _zz_io_outputs_2_ready) || (! io_weightResident)) || _zz_io_outputs_2_ready_1) || residentRise);
  assign _zz_io_cmd_valid_2 = (io_start_fork_io_outputs_2_valid && _zz_io_outputs_2_ready_2);
  assign _zz_io_cmd_valid_3 = (_zz_io_cmd_valid_2 || ((((_zz_when_Sequential_l472 && (_zz_io_outputs_2_ready_1 || residentRise)) && _zz_io_outputs_2_ready_3) && streamDoubleBuffer_8_io_loadCanAccept) && (! _zz_io_cmd_valid_2)));
  assign io_start_fork_io_outputs_2_ready = (_zz_io_outputs_2_ready_2 ? _zz_io_outputs_2_ready_3 : 1'b1);
  assign _zz_io_outputs_2_ready_3 = dMAReader_6_io_cmd_ready;
  assign dMAReader_6_io_cmd_payload_address = (io_weightsBaseAddress + 32'h00000020);
  assign _zz_when_Sequential_l472_1 = (_zz_io_cmd_valid_3 && _zz_io_outputs_2_ready_3);
  assign when_Sequential_l472 = (_zz_when_Sequential_l472_1 && _zz_when_Sequential_l472);
  assign imgQueue_stream_ready = conv2DLayer_1_io_x_stream_ready;
  assign _zz_when_Sequential_l392_2 = (io_weightResident && io_weightPrefetch);
  assign _zz_io_outputs_3_ready_2 = ((((! _zz_io_outputs_3_ready) || (! io_weightResident)) || _zz_io_outputs_3_ready_1) || residentRise);
  assign _zz_io_cmd_valid_4 = (io_start_fork_io_outputs_3_valid && _zz_io_outputs_3_ready_2);
  assign _zz_io_cmd_valid_5 = (_zz_io_cmd_valid_4 || ((((_zz_when_Sequential_l392_2 && (_zz_io_outputs_3_ready_1 || residentRise)) && _zz_io_outputs_3_ready_3) && streamDoubleBuffer_9_io_loadCanAccept) && (! _zz_io_cmd_valid_4)));
  assign io_start_fork_io_outputs_3_ready = (_zz_io_outputs_3_ready_2 ? _zz_io_outputs_3_ready_3 : 1'b1);
  assign _zz_io_outputs_3_ready_3 = dMAReader_7_io_cmd_ready;
  assign dMAReader_7_io_cmd_payload_address = (io_weightsBaseAddress + 32'h00000028);
  assign _zz_when_Sequential_l392_3 = (_zz_io_cmd_valid_5 && _zz_io_outputs_3_ready_3);
  assign when_Sequential_l392_1 = (_zz_when_Sequential_l392_3 && _zz_when_Sequential_l392_2);
  assign streamDoubleBuffer_9_io_reArm = (_zz_when_Sequential_l392_3 && (! _zz_when_Sequential_l392_2));
  assign _zz_when_Sequential_l472_2 = (io_weightResident && io_weightPrefetch);
  assign _zz_io_outputs_4_ready_2 = ((((! _zz_io_outputs_4_ready) || (! io_weightResident)) || _zz_io_outputs_4_ready_1) || residentRise);
  assign _zz_io_cmd_valid_6 = (io_start_fork_io_outputs_4_valid && _zz_io_outputs_4_ready_2);
  assign _zz_io_cmd_valid_7 = (_zz_io_cmd_valid_6 || ((((_zz_when_Sequential_l472_2 && (_zz_io_outputs_4_ready_1 || residentRise)) && _zz_io_outputs_4_ready_3) && streamDoubleBuffer_10_io_loadCanAccept) && (! _zz_io_cmd_valid_6)));
  assign io_start_fork_io_outputs_4_ready = (_zz_io_outputs_4_ready_2 ? _zz_io_outputs_4_ready_3 : 1'b1);
  assign _zz_io_outputs_4_ready_3 = dMAReader_8_io_cmd_ready;
  assign dMAReader_8_io_cmd_payload_address = (io_weightsBaseAddress + 32'h00000b68);
  assign _zz_when_Sequential_l472_3 = (_zz_io_cmd_valid_7 && _zz_io_outputs_4_ready_3);
  assign when_Sequential_l472_1 = (_zz_when_Sequential_l472_3 && _zz_when_Sequential_l472_2);
  assign io_outStream_stream_valid = linearLayer_1_io_y_stream_valid;
  assign io_outStream_stream_payload_0_mantissa = linearLayer_1_io_y_stream_payload_0_mantissa;
  assign io_outStream_stream_payload_0_exponent = linearLayer_1_io_y_stream_payload_0_exponent;
  assign io_outStream_stream_payload_0_sign = linearLayer_1_io_y_stream_payload_0_sign;
  always @(*) begin
    frameCounter_willIncrement = 1'b0;
    if(io_outStream_stream_fire) begin
      frameCounter_willIncrement = 1'b1;
    end
  end

  assign frameCounter_willDecrement = 1'b0;
  assign frameCounter_willClear = 1'b0;
  assign frameCounter_willLoad = 1'b0;
  assign frameCounter_willOverflowIfInc = (frameCounter_value == 4'b1001);
  assign frameCounter_willUnderflowIfDec = (frameCounter_value == 4'b0000);
  assign frameCounter_willOverflow = (frameCounter_willOverflowIfInc && frameCounter_willIncrement);
  always @(*) begin
    frameCounter_valueNext = (frameCounter_value + _zz_frameCounter_valueNext);
    if(frameCounter_willOverflow) begin
      frameCounter_valueNext = 4'b0000;
    end
    if(frameCounter_willClear) begin
      frameCounter_valueNext = 4'b0000;
    end
  end

  assign frameCounter_willUnderflow = (frameCounter_willUnderflowIfDec && frameCounter_willDecrement);
  assign io_outStream_stream_fire = (io_outStream_stream_valid && io_outStream_stream_ready);
  assign io_start_fire = (io_start_valid && io_start_ready);
  assign when_Sequential_l676 = ((ioBusy && io_outStream_stream_fire) && frameCounter_willOverflowIfInc);
  assign io_busy = ioBusy;
  assign io_done = ((ioBusy && io_outStream_stream_fire) && frameCounter_willOverflowIfInc);
  assign io_axiMaster_ar_valid = axi4ReadOnlyArbiter_1_io_output_ar_valid;
  assign io_axiMaster_ar_payload_addr = axi4ReadOnlyArbiter_1_io_output_ar_payload_addr;
  assign io_axiMaster_ar_payload_id = axi4ReadOnlyArbiter_1_io_output_ar_payload_id;
  assign io_axiMaster_ar_payload_region = axi4ReadOnlyArbiter_1_io_output_ar_payload_region;
  assign io_axiMaster_ar_payload_len = axi4ReadOnlyArbiter_1_io_output_ar_payload_len;
  assign io_axiMaster_ar_payload_size = axi4ReadOnlyArbiter_1_io_output_ar_payload_size;
  assign io_axiMaster_ar_payload_burst = axi4ReadOnlyArbiter_1_io_output_ar_payload_burst;
  assign io_axiMaster_ar_payload_lock = axi4ReadOnlyArbiter_1_io_output_ar_payload_lock;
  assign io_axiMaster_ar_payload_cache = axi4ReadOnlyArbiter_1_io_output_ar_payload_cache;
  assign io_axiMaster_ar_payload_qos = axi4ReadOnlyArbiter_1_io_output_ar_payload_qos;
  assign io_axiMaster_ar_payload_prot = axi4ReadOnlyArbiter_1_io_output_ar_payload_prot;
  assign io_axiMaster_r_ready = axi4ReadOnlyArbiter_1_io_output_r_ready;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      residentPrev <= 1'b0;
      residentPrev <= 1'b0;
      imgBandIdx <= 1'b0;
      imgBandActive <= 1'b0;
      prevStartValid <= 1'b0;
      _zz_io_outputs_1_ready <= 1'b0;
      _zz_io_outputs_1_ready <= 1'b0;
      _zz_io_outputs_1_ready_1 <= 1'b0;
      _zz_io_outputs_1_ready_1 <= 1'b0;
      _zz_io_stageRequest <= 1'b0;
      _zz_io_stageRequest <= 1'b0;
      _zz_io_outputs_2_ready <= 1'b0;
      _zz_io_outputs_2_ready <= 1'b0;
      _zz_io_outputs_2_ready_1 <= 1'b0;
      _zz_io_outputs_2_ready_1 <= 1'b0;
      _zz_io_stageRequest_1 <= 1'b0;
      _zz_io_stageRequest_1 <= 1'b0;
      _zz_io_outputs_3_ready <= 1'b0;
      _zz_io_outputs_3_ready <= 1'b0;
      _zz_io_outputs_3_ready_1 <= 1'b0;
      _zz_io_outputs_3_ready_1 <= 1'b0;
      _zz_io_stageRequest_2 <= 1'b0;
      _zz_io_stageRequest_2 <= 1'b0;
      _zz_io_outputs_4_ready <= 1'b0;
      _zz_io_outputs_4_ready <= 1'b0;
      _zz_io_outputs_4_ready_1 <= 1'b0;
      _zz_io_outputs_4_ready_1 <= 1'b0;
      _zz_io_stageRequest_3 <= 1'b0;
      _zz_io_stageRequest_3 <= 1'b0;
      frameCounter_value <= 4'b0000;
      ioBusy <= 1'b0;
    end else begin
      residentPrev <= io_weightResident;
      if(io_start_fork_io_outputs_0_valid) begin
        imgBandActive <= 1'b1;
        imgBandIdx <= 1'b0;
      end
      if(dmaImg_io_cmd_fire) begin
        if(when_Sequential_l231) begin
          imgBandActive <= 1'b0;
        end else begin
          imgBandIdx <= (imgBandIdx + 1'b1);
        end
      end
      prevStartValid <= io_start_valid;
      if(_zz_when_Sequential_l392_1) begin
        _zz_io_outputs_1_ready <= 1'b1;
        _zz_io_outputs_1_ready_1 <= 1'b0;
      end
      if(residentRise) begin
        _zz_io_outputs_1_ready_1 <= 1'b1;
      end
      if(when_Sequential_l392) begin
        _zz_io_stageRequest <= 1'b1;
      end
      if(streamDoubleBuffer_7_io_refreshSettled) begin
        _zz_io_stageRequest <= 1'b0;
      end
      if(_zz_when_Sequential_l472_1) begin
        _zz_io_outputs_2_ready <= 1'b1;
        _zz_io_outputs_2_ready_1 <= 1'b0;
      end
      if(residentRise) begin
        _zz_io_outputs_2_ready_1 <= 1'b1;
      end
      if(when_Sequential_l472) begin
        _zz_io_stageRequest_1 <= 1'b1;
      end
      if(streamDoubleBuffer_8_io_refreshSettled) begin
        _zz_io_stageRequest_1 <= 1'b0;
      end
      if(_zz_when_Sequential_l392_3) begin
        _zz_io_outputs_3_ready <= 1'b1;
        _zz_io_outputs_3_ready_1 <= 1'b0;
      end
      if(residentRise) begin
        _zz_io_outputs_3_ready_1 <= 1'b1;
      end
      if(when_Sequential_l392_1) begin
        _zz_io_stageRequest_2 <= 1'b1;
      end
      if(streamDoubleBuffer_9_io_refreshSettled) begin
        _zz_io_stageRequest_2 <= 1'b0;
      end
      if(_zz_when_Sequential_l472_3) begin
        _zz_io_outputs_4_ready <= 1'b1;
        _zz_io_outputs_4_ready_1 <= 1'b0;
      end
      if(residentRise) begin
        _zz_io_outputs_4_ready_1 <= 1'b1;
      end
      if(when_Sequential_l472_1) begin
        _zz_io_stageRequest_3 <= 1'b1;
      end
      if(streamDoubleBuffer_10_io_refreshSettled) begin
        _zz_io_stageRequest_3 <= 1'b0;
      end
      if(io_weightReload) begin
        _zz_io_outputs_1_ready_1 <= 1'b1;
        _zz_io_outputs_2_ready_1 <= 1'b1;
        _zz_io_outputs_3_ready_1 <= 1'b1;
        _zz_io_outputs_4_ready_1 <= 1'b1;
      end
      frameCounter_value <= frameCounter_valueNext;
      if(io_start_fire) begin
        ioBusy <= 1'b1;
      end
      if(when_Sequential_l676) begin
        ioBusy <= 1'b0;
      end
    end
  end


endmodule

module Axi4ReadOnlyArbiter (
  input  wire          io_inputs_0_ar_valid,
  output wire          io_inputs_0_ar_ready,
  input  wire [31:0]   io_inputs_0_ar_payload_addr,
  input  wire [0:0]    io_inputs_0_ar_payload_id,
  input  wire [3:0]    io_inputs_0_ar_payload_region,
  input  wire [7:0]    io_inputs_0_ar_payload_len,
  input  wire [2:0]    io_inputs_0_ar_payload_size,
  input  wire [1:0]    io_inputs_0_ar_payload_burst,
  input  wire [0:0]    io_inputs_0_ar_payload_lock,
  input  wire [3:0]    io_inputs_0_ar_payload_cache,
  input  wire [3:0]    io_inputs_0_ar_payload_qos,
  input  wire [2:0]    io_inputs_0_ar_payload_prot,
  output wire          io_inputs_0_r_valid,
  input  wire          io_inputs_0_r_ready,
  output wire [63:0]   io_inputs_0_r_payload_data,
  output wire [0:0]    io_inputs_0_r_payload_id,
  output wire [1:0]    io_inputs_0_r_payload_resp,
  output wire          io_inputs_0_r_payload_last,
  input  wire          io_inputs_1_ar_valid,
  output wire          io_inputs_1_ar_ready,
  input  wire [31:0]   io_inputs_1_ar_payload_addr,
  input  wire [0:0]    io_inputs_1_ar_payload_id,
  input  wire [3:0]    io_inputs_1_ar_payload_region,
  input  wire [7:0]    io_inputs_1_ar_payload_len,
  input  wire [2:0]    io_inputs_1_ar_payload_size,
  input  wire [1:0]    io_inputs_1_ar_payload_burst,
  input  wire [0:0]    io_inputs_1_ar_payload_lock,
  input  wire [3:0]    io_inputs_1_ar_payload_cache,
  input  wire [3:0]    io_inputs_1_ar_payload_qos,
  input  wire [2:0]    io_inputs_1_ar_payload_prot,
  output wire          io_inputs_1_r_valid,
  input  wire          io_inputs_1_r_ready,
  output wire [63:0]   io_inputs_1_r_payload_data,
  output wire [0:0]    io_inputs_1_r_payload_id,
  output wire [1:0]    io_inputs_1_r_payload_resp,
  output wire          io_inputs_1_r_payload_last,
  input  wire          io_inputs_2_ar_valid,
  output wire          io_inputs_2_ar_ready,
  input  wire [31:0]   io_inputs_2_ar_payload_addr,
  input  wire [0:0]    io_inputs_2_ar_payload_id,
  input  wire [3:0]    io_inputs_2_ar_payload_region,
  input  wire [7:0]    io_inputs_2_ar_payload_len,
  input  wire [2:0]    io_inputs_2_ar_payload_size,
  input  wire [1:0]    io_inputs_2_ar_payload_burst,
  input  wire [0:0]    io_inputs_2_ar_payload_lock,
  input  wire [3:0]    io_inputs_2_ar_payload_cache,
  input  wire [3:0]    io_inputs_2_ar_payload_qos,
  input  wire [2:0]    io_inputs_2_ar_payload_prot,
  output wire          io_inputs_2_r_valid,
  input  wire          io_inputs_2_r_ready,
  output wire [63:0]   io_inputs_2_r_payload_data,
  output wire [0:0]    io_inputs_2_r_payload_id,
  output wire [1:0]    io_inputs_2_r_payload_resp,
  output wire          io_inputs_2_r_payload_last,
  input  wire          io_inputs_3_ar_valid,
  output wire          io_inputs_3_ar_ready,
  input  wire [31:0]   io_inputs_3_ar_payload_addr,
  input  wire [0:0]    io_inputs_3_ar_payload_id,
  input  wire [3:0]    io_inputs_3_ar_payload_region,
  input  wire [7:0]    io_inputs_3_ar_payload_len,
  input  wire [2:0]    io_inputs_3_ar_payload_size,
  input  wire [1:0]    io_inputs_3_ar_payload_burst,
  input  wire [0:0]    io_inputs_3_ar_payload_lock,
  input  wire [3:0]    io_inputs_3_ar_payload_cache,
  input  wire [3:0]    io_inputs_3_ar_payload_qos,
  input  wire [2:0]    io_inputs_3_ar_payload_prot,
  output wire          io_inputs_3_r_valid,
  input  wire          io_inputs_3_r_ready,
  output wire [63:0]   io_inputs_3_r_payload_data,
  output wire [0:0]    io_inputs_3_r_payload_id,
  output wire [1:0]    io_inputs_3_r_payload_resp,
  output wire          io_inputs_3_r_payload_last,
  input  wire          io_inputs_4_ar_valid,
  output wire          io_inputs_4_ar_ready,
  input  wire [31:0]   io_inputs_4_ar_payload_addr,
  input  wire [0:0]    io_inputs_4_ar_payload_id,
  input  wire [3:0]    io_inputs_4_ar_payload_region,
  input  wire [7:0]    io_inputs_4_ar_payload_len,
  input  wire [2:0]    io_inputs_4_ar_payload_size,
  input  wire [1:0]    io_inputs_4_ar_payload_burst,
  input  wire [0:0]    io_inputs_4_ar_payload_lock,
  input  wire [3:0]    io_inputs_4_ar_payload_cache,
  input  wire [3:0]    io_inputs_4_ar_payload_qos,
  input  wire [2:0]    io_inputs_4_ar_payload_prot,
  output wire          io_inputs_4_r_valid,
  input  wire          io_inputs_4_r_ready,
  output wire [63:0]   io_inputs_4_r_payload_data,
  output wire [0:0]    io_inputs_4_r_payload_id,
  output wire [1:0]    io_inputs_4_r_payload_resp,
  output wire          io_inputs_4_r_payload_last,
  output wire          io_output_ar_valid,
  input  wire          io_output_ar_ready,
  output wire [31:0]   io_output_ar_payload_addr,
  output wire [3:0]    io_output_ar_payload_id,
  output wire [3:0]    io_output_ar_payload_region,
  output wire [7:0]    io_output_ar_payload_len,
  output wire [2:0]    io_output_ar_payload_size,
  output wire [1:0]    io_output_ar_payload_burst,
  output wire [0:0]    io_output_ar_payload_lock,
  output wire [3:0]    io_output_ar_payload_cache,
  output wire [3:0]    io_output_ar_payload_qos,
  output wire [2:0]    io_output_ar_payload_prot,
  input  wire          io_output_r_valid,
  output wire          io_output_r_ready,
  input  wire [63:0]   io_output_r_payload_data,
  input  wire [3:0]    io_output_r_payload_id,
  input  wire [1:0]    io_output_r_payload_resp,
  input  wire          io_output_r_payload_last,
  input  wire          clk,
  input  wire          reset
);

  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_inputs_1_ready;
  wire                cmdArbiter_io_inputs_2_ready;
  wire                cmdArbiter_io_inputs_3_ready;
  wire                cmdArbiter_io_inputs_4_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [31:0]   cmdArbiter_io_output_payload_addr;
  wire       [0:0]    cmdArbiter_io_output_payload_id;
  wire       [3:0]    cmdArbiter_io_output_payload_region;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire       [0:0]    cmdArbiter_io_output_payload_lock;
  wire       [3:0]    cmdArbiter_io_output_payload_cache;
  wire       [3:0]    cmdArbiter_io_output_payload_qos;
  wire       [2:0]    cmdArbiter_io_output_payload_prot;
  wire       [2:0]    cmdArbiter_io_chosen;
  wire       [4:0]    cmdArbiter_io_chosenOH;
  reg                 _zz_io_output_r_ready;
  wire       [2:0]    readRspIndex;
  wire                readRspSels_0;
  wire                readRspSels_1;
  wire                readRspSels_2;
  wire                readRspSels_3;
  wire                readRspSels_4;

  StreamArbiter cmdArbiter (
    .io_inputs_0_valid          (io_inputs_0_ar_valid                    ), //i
    .io_inputs_0_ready          (cmdArbiter_io_inputs_0_ready            ), //o
    .io_inputs_0_payload_addr   (io_inputs_0_ar_payload_addr[31:0]       ), //i
    .io_inputs_0_payload_id     (io_inputs_0_ar_payload_id               ), //i
    .io_inputs_0_payload_region (io_inputs_0_ar_payload_region[3:0]      ), //i
    .io_inputs_0_payload_len    (io_inputs_0_ar_payload_len[7:0]         ), //i
    .io_inputs_0_payload_size   (io_inputs_0_ar_payload_size[2:0]        ), //i
    .io_inputs_0_payload_burst  (io_inputs_0_ar_payload_burst[1:0]       ), //i
    .io_inputs_0_payload_lock   (io_inputs_0_ar_payload_lock             ), //i
    .io_inputs_0_payload_cache  (io_inputs_0_ar_payload_cache[3:0]       ), //i
    .io_inputs_0_payload_qos    (io_inputs_0_ar_payload_qos[3:0]         ), //i
    .io_inputs_0_payload_prot   (io_inputs_0_ar_payload_prot[2:0]        ), //i
    .io_inputs_1_valid          (io_inputs_1_ar_valid                    ), //i
    .io_inputs_1_ready          (cmdArbiter_io_inputs_1_ready            ), //o
    .io_inputs_1_payload_addr   (io_inputs_1_ar_payload_addr[31:0]       ), //i
    .io_inputs_1_payload_id     (io_inputs_1_ar_payload_id               ), //i
    .io_inputs_1_payload_region (io_inputs_1_ar_payload_region[3:0]      ), //i
    .io_inputs_1_payload_len    (io_inputs_1_ar_payload_len[7:0]         ), //i
    .io_inputs_1_payload_size   (io_inputs_1_ar_payload_size[2:0]        ), //i
    .io_inputs_1_payload_burst  (io_inputs_1_ar_payload_burst[1:0]       ), //i
    .io_inputs_1_payload_lock   (io_inputs_1_ar_payload_lock             ), //i
    .io_inputs_1_payload_cache  (io_inputs_1_ar_payload_cache[3:0]       ), //i
    .io_inputs_1_payload_qos    (io_inputs_1_ar_payload_qos[3:0]         ), //i
    .io_inputs_1_payload_prot   (io_inputs_1_ar_payload_prot[2:0]        ), //i
    .io_inputs_2_valid          (io_inputs_2_ar_valid                    ), //i
    .io_inputs_2_ready          (cmdArbiter_io_inputs_2_ready            ), //o
    .io_inputs_2_payload_addr   (io_inputs_2_ar_payload_addr[31:0]       ), //i
    .io_inputs_2_payload_id     (io_inputs_2_ar_payload_id               ), //i
    .io_inputs_2_payload_region (io_inputs_2_ar_payload_region[3:0]      ), //i
    .io_inputs_2_payload_len    (io_inputs_2_ar_payload_len[7:0]         ), //i
    .io_inputs_2_payload_size   (io_inputs_2_ar_payload_size[2:0]        ), //i
    .io_inputs_2_payload_burst  (io_inputs_2_ar_payload_burst[1:0]       ), //i
    .io_inputs_2_payload_lock   (io_inputs_2_ar_payload_lock             ), //i
    .io_inputs_2_payload_cache  (io_inputs_2_ar_payload_cache[3:0]       ), //i
    .io_inputs_2_payload_qos    (io_inputs_2_ar_payload_qos[3:0]         ), //i
    .io_inputs_2_payload_prot   (io_inputs_2_ar_payload_prot[2:0]        ), //i
    .io_inputs_3_valid          (io_inputs_3_ar_valid                    ), //i
    .io_inputs_3_ready          (cmdArbiter_io_inputs_3_ready            ), //o
    .io_inputs_3_payload_addr   (io_inputs_3_ar_payload_addr[31:0]       ), //i
    .io_inputs_3_payload_id     (io_inputs_3_ar_payload_id               ), //i
    .io_inputs_3_payload_region (io_inputs_3_ar_payload_region[3:0]      ), //i
    .io_inputs_3_payload_len    (io_inputs_3_ar_payload_len[7:0]         ), //i
    .io_inputs_3_payload_size   (io_inputs_3_ar_payload_size[2:0]        ), //i
    .io_inputs_3_payload_burst  (io_inputs_3_ar_payload_burst[1:0]       ), //i
    .io_inputs_3_payload_lock   (io_inputs_3_ar_payload_lock             ), //i
    .io_inputs_3_payload_cache  (io_inputs_3_ar_payload_cache[3:0]       ), //i
    .io_inputs_3_payload_qos    (io_inputs_3_ar_payload_qos[3:0]         ), //i
    .io_inputs_3_payload_prot   (io_inputs_3_ar_payload_prot[2:0]        ), //i
    .io_inputs_4_valid          (io_inputs_4_ar_valid                    ), //i
    .io_inputs_4_ready          (cmdArbiter_io_inputs_4_ready            ), //o
    .io_inputs_4_payload_addr   (io_inputs_4_ar_payload_addr[31:0]       ), //i
    .io_inputs_4_payload_id     (io_inputs_4_ar_payload_id               ), //i
    .io_inputs_4_payload_region (io_inputs_4_ar_payload_region[3:0]      ), //i
    .io_inputs_4_payload_len    (io_inputs_4_ar_payload_len[7:0]         ), //i
    .io_inputs_4_payload_size   (io_inputs_4_ar_payload_size[2:0]        ), //i
    .io_inputs_4_payload_burst  (io_inputs_4_ar_payload_burst[1:0]       ), //i
    .io_inputs_4_payload_lock   (io_inputs_4_ar_payload_lock             ), //i
    .io_inputs_4_payload_cache  (io_inputs_4_ar_payload_cache[3:0]       ), //i
    .io_inputs_4_payload_qos    (io_inputs_4_ar_payload_qos[3:0]         ), //i
    .io_inputs_4_payload_prot   (io_inputs_4_ar_payload_prot[2:0]        ), //i
    .io_output_valid            (cmdArbiter_io_output_valid              ), //o
    .io_output_ready            (io_output_ar_ready                      ), //i
    .io_output_payload_addr     (cmdArbiter_io_output_payload_addr[31:0] ), //o
    .io_output_payload_id       (cmdArbiter_io_output_payload_id         ), //o
    .io_output_payload_region   (cmdArbiter_io_output_payload_region[3:0]), //o
    .io_output_payload_len      (cmdArbiter_io_output_payload_len[7:0]   ), //o
    .io_output_payload_size     (cmdArbiter_io_output_payload_size[2:0]  ), //o
    .io_output_payload_burst    (cmdArbiter_io_output_payload_burst[1:0] ), //o
    .io_output_payload_lock     (cmdArbiter_io_output_payload_lock       ), //o
    .io_output_payload_cache    (cmdArbiter_io_output_payload_cache[3:0] ), //o
    .io_output_payload_qos      (cmdArbiter_io_output_payload_qos[3:0]   ), //o
    .io_output_payload_prot     (cmdArbiter_io_output_payload_prot[2:0]  ), //o
    .io_chosen                  (cmdArbiter_io_chosen[2:0]               ), //o
    .io_chosenOH                (cmdArbiter_io_chosenOH[4:0]             ), //o
    .clk                        (clk                                     ), //i
    .reset                      (reset                                   )  //i
  );
  always @(*) begin
    case(readRspIndex)
      3'b000 : _zz_io_output_r_ready = io_inputs_0_r_ready;
      3'b001 : _zz_io_output_r_ready = io_inputs_1_r_ready;
      3'b010 : _zz_io_output_r_ready = io_inputs_2_r_ready;
      3'b011 : _zz_io_output_r_ready = io_inputs_3_r_ready;
      default : _zz_io_output_r_ready = io_inputs_4_r_ready;
    endcase
  end

  assign io_inputs_0_ar_ready = cmdArbiter_io_inputs_0_ready;
  assign io_inputs_1_ar_ready = cmdArbiter_io_inputs_1_ready;
  assign io_inputs_2_ar_ready = cmdArbiter_io_inputs_2_ready;
  assign io_inputs_3_ar_ready = cmdArbiter_io_inputs_3_ready;
  assign io_inputs_4_ar_ready = cmdArbiter_io_inputs_4_ready;
  assign io_output_ar_valid = cmdArbiter_io_output_valid;
  assign io_output_ar_payload_addr = cmdArbiter_io_output_payload_addr;
  assign io_output_ar_payload_region = cmdArbiter_io_output_payload_region;
  assign io_output_ar_payload_len = cmdArbiter_io_output_payload_len;
  assign io_output_ar_payload_size = cmdArbiter_io_output_payload_size;
  assign io_output_ar_payload_burst = cmdArbiter_io_output_payload_burst;
  assign io_output_ar_payload_lock = cmdArbiter_io_output_payload_lock;
  assign io_output_ar_payload_cache = cmdArbiter_io_output_payload_cache;
  assign io_output_ar_payload_qos = cmdArbiter_io_output_payload_qos;
  assign io_output_ar_payload_prot = cmdArbiter_io_output_payload_prot;
  assign io_output_ar_payload_id = {cmdArbiter_io_chosen,cmdArbiter_io_output_payload_id};
  assign readRspIndex = io_output_r_payload_id[3 : 1];
  assign readRspSels_0 = (readRspIndex == 3'b000);
  assign readRspSels_1 = (readRspIndex == 3'b001);
  assign readRspSels_2 = (readRspIndex == 3'b010);
  assign readRspSels_3 = (readRspIndex == 3'b011);
  assign readRspSels_4 = (readRspIndex == 3'b100);
  assign io_inputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_inputs_0_r_payload_data = io_output_r_payload_data;
  assign io_inputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_inputs_0_r_payload_last = io_output_r_payload_last;
  assign io_inputs_0_r_payload_id = io_output_r_payload_id[0 : 0];
  assign io_inputs_1_r_valid = (io_output_r_valid && readRspSels_1);
  assign io_inputs_1_r_payload_data = io_output_r_payload_data;
  assign io_inputs_1_r_payload_resp = io_output_r_payload_resp;
  assign io_inputs_1_r_payload_last = io_output_r_payload_last;
  assign io_inputs_1_r_payload_id = io_output_r_payload_id[0 : 0];
  assign io_inputs_2_r_valid = (io_output_r_valid && readRspSels_2);
  assign io_inputs_2_r_payload_data = io_output_r_payload_data;
  assign io_inputs_2_r_payload_resp = io_output_r_payload_resp;
  assign io_inputs_2_r_payload_last = io_output_r_payload_last;
  assign io_inputs_2_r_payload_id = io_output_r_payload_id[0 : 0];
  assign io_inputs_3_r_valid = (io_output_r_valid && readRspSels_3);
  assign io_inputs_3_r_payload_data = io_output_r_payload_data;
  assign io_inputs_3_r_payload_resp = io_output_r_payload_resp;
  assign io_inputs_3_r_payload_last = io_output_r_payload_last;
  assign io_inputs_3_r_payload_id = io_output_r_payload_id[0 : 0];
  assign io_inputs_4_r_valid = (io_output_r_valid && readRspSels_4);
  assign io_inputs_4_r_payload_data = io_output_r_payload_data;
  assign io_inputs_4_r_payload_resp = io_output_r_payload_resp;
  assign io_inputs_4_r_payload_last = io_output_r_payload_last;
  assign io_inputs_4_r_payload_id = io_output_r_payload_id[0 : 0];
  assign io_output_r_ready = _zz_io_output_r_ready;

endmodule

module LinearLayer (
  input  wire          io_a_stream_valid,
  output wire          io_a_stream_ready,
  input  wire [2:0]    io_a_stream_payload_0_mantissa,
  input  wire [3:0]    io_a_stream_payload_0_exponent,
  input  wire          io_a_stream_payload_0_sign,
  input  wire [2:0]    io_a_stream_payload_1_mantissa,
  input  wire [3:0]    io_a_stream_payload_1_exponent,
  input  wire          io_a_stream_payload_1_sign,
  input  wire [2:0]    io_a_stream_payload_2_mantissa,
  input  wire [3:0]    io_a_stream_payload_2_exponent,
  input  wire          io_a_stream_payload_2_sign,
  input  wire [2:0]    io_a_stream_payload_3_mantissa,
  input  wire [3:0]    io_a_stream_payload_3_exponent,
  input  wire          io_a_stream_payload_3_sign,
  input  wire          io_w_stream_valid,
  output wire          io_w_stream_ready,
  input  wire [2:0]    io_w_stream_payload_0_mantissa,
  input  wire [3:0]    io_w_stream_payload_0_exponent,
  input  wire          io_w_stream_payload_0_sign,
  input  wire [2:0]    io_w_stream_payload_1_mantissa,
  input  wire [3:0]    io_w_stream_payload_1_exponent,
  input  wire          io_w_stream_payload_1_sign,
  input  wire [2:0]    io_w_stream_payload_2_mantissa,
  input  wire [3:0]    io_w_stream_payload_2_exponent,
  input  wire          io_w_stream_payload_2_sign,
  input  wire [2:0]    io_w_stream_payload_3_mantissa,
  input  wire [3:0]    io_w_stream_payload_3_exponent,
  input  wire          io_w_stream_payload_3_sign,
  input  wire          io_b_stream_valid,
  output wire          io_b_stream_ready,
  input  wire [2:0]    io_b_stream_payload_0_mantissa,
  input  wire [3:0]    io_b_stream_payload_0_exponent,
  input  wire          io_b_stream_payload_0_sign,
  output wire          io_y_stream_valid,
  input  wire          io_y_stream_ready,
  output wire [2:0]    io_y_stream_payload_0_mantissa,
  output wire [3:0]    io_y_stream_payload_0_exponent,
  output wire          io_y_stream_payload_0_sign,
  input  wire          io_reArm,
  input  wire          io_biasReArm,
  input  wire          clk,
  input  wire          reset
);

  wire                matmulOp_2_io_a_stream_ready;
  wire                matmulOp_2_io_b_stream_ready;
  wire                matmulOp_2_io_c_stream_valid;
  wire       [2:0]    matmulOp_2_io_c_stream_payload_0_mantissa;
  wire       [3:0]    matmulOp_2_io_c_stream_payload_0_exponent;
  wire                matmulOp_2_io_c_stream_payload_0_sign;
  wire                biasAddOp_2_io_a_stream_ready;
  wire                biasAddOp_2_io_b_stream_ready;
  wire                biasAddOp_2_io_c_stream_valid;
  wire       [2:0]    biasAddOp_2_io_c_stream_payload_0_mantissa;
  wire       [3:0]    biasAddOp_2_io_c_stream_payload_0_exponent;
  wire                biasAddOp_2_io_c_stream_payload_0_sign;
  wire                matmulResult_stream_valid;
  wire                matmulResult_stream_ready;
  wire       [2:0]    matmulResult_stream_payload_0_mantissa;
  wire       [3:0]    matmulResult_stream_payload_0_exponent;
  wire                matmulResult_stream_payload_0_sign;

  MatmulOp_1 matmulOp_2 (
    .io_a_stream_valid              (io_a_stream_valid                             ), //i
    .io_a_stream_ready              (matmulOp_2_io_a_stream_ready                  ), //o
    .io_a_stream_payload_0_mantissa (io_a_stream_payload_0_mantissa[2:0]           ), //i
    .io_a_stream_payload_0_exponent (io_a_stream_payload_0_exponent[3:0]           ), //i
    .io_a_stream_payload_0_sign     (io_a_stream_payload_0_sign                    ), //i
    .io_a_stream_payload_1_mantissa (io_a_stream_payload_1_mantissa[2:0]           ), //i
    .io_a_stream_payload_1_exponent (io_a_stream_payload_1_exponent[3:0]           ), //i
    .io_a_stream_payload_1_sign     (io_a_stream_payload_1_sign                    ), //i
    .io_a_stream_payload_2_mantissa (io_a_stream_payload_2_mantissa[2:0]           ), //i
    .io_a_stream_payload_2_exponent (io_a_stream_payload_2_exponent[3:0]           ), //i
    .io_a_stream_payload_2_sign     (io_a_stream_payload_2_sign                    ), //i
    .io_a_stream_payload_3_mantissa (io_a_stream_payload_3_mantissa[2:0]           ), //i
    .io_a_stream_payload_3_exponent (io_a_stream_payload_3_exponent[3:0]           ), //i
    .io_a_stream_payload_3_sign     (io_a_stream_payload_3_sign                    ), //i
    .io_b_stream_valid              (io_w_stream_valid                             ), //i
    .io_b_stream_ready              (matmulOp_2_io_b_stream_ready                  ), //o
    .io_b_stream_payload_0_mantissa (io_w_stream_payload_0_mantissa[2:0]           ), //i
    .io_b_stream_payload_0_exponent (io_w_stream_payload_0_exponent[3:0]           ), //i
    .io_b_stream_payload_0_sign     (io_w_stream_payload_0_sign                    ), //i
    .io_b_stream_payload_1_mantissa (io_w_stream_payload_1_mantissa[2:0]           ), //i
    .io_b_stream_payload_1_exponent (io_w_stream_payload_1_exponent[3:0]           ), //i
    .io_b_stream_payload_1_sign     (io_w_stream_payload_1_sign                    ), //i
    .io_b_stream_payload_2_mantissa (io_w_stream_payload_2_mantissa[2:0]           ), //i
    .io_b_stream_payload_2_exponent (io_w_stream_payload_2_exponent[3:0]           ), //i
    .io_b_stream_payload_2_sign     (io_w_stream_payload_2_sign                    ), //i
    .io_b_stream_payload_3_mantissa (io_w_stream_payload_3_mantissa[2:0]           ), //i
    .io_b_stream_payload_3_exponent (io_w_stream_payload_3_exponent[3:0]           ), //i
    .io_b_stream_payload_3_sign     (io_w_stream_payload_3_sign                    ), //i
    .io_c_stream_valid              (matmulOp_2_io_c_stream_valid                  ), //o
    .io_c_stream_ready              (matmulResult_stream_ready                     ), //i
    .io_c_stream_payload_0_mantissa (matmulOp_2_io_c_stream_payload_0_mantissa[2:0]), //o
    .io_c_stream_payload_0_exponent (matmulOp_2_io_c_stream_payload_0_exponent[3:0]), //o
    .io_c_stream_payload_0_sign     (matmulOp_2_io_c_stream_payload_0_sign         ), //o
    .io_reArm                       (io_reArm                                      ), //i
    .clk                            (clk                                           ), //i
    .reset                          (reset                                         )  //i
  );
  BiasAddOp_1 biasAddOp_2 (
    .io_a_stream_valid              (matmulResult_stream_valid                      ), //i
    .io_a_stream_ready              (biasAddOp_2_io_a_stream_ready                  ), //o
    .io_a_stream_payload_0_mantissa (matmulResult_stream_payload_0_mantissa[2:0]    ), //i
    .io_a_stream_payload_0_exponent (matmulResult_stream_payload_0_exponent[3:0]    ), //i
    .io_a_stream_payload_0_sign     (matmulResult_stream_payload_0_sign             ), //i
    .io_b_stream_valid              (io_b_stream_valid                              ), //i
    .io_b_stream_ready              (biasAddOp_2_io_b_stream_ready                  ), //o
    .io_b_stream_payload_0_mantissa (io_b_stream_payload_0_mantissa[2:0]            ), //i
    .io_b_stream_payload_0_exponent (io_b_stream_payload_0_exponent[3:0]            ), //i
    .io_b_stream_payload_0_sign     (io_b_stream_payload_0_sign                     ), //i
    .io_c_stream_valid              (biasAddOp_2_io_c_stream_valid                  ), //o
    .io_c_stream_ready              (io_y_stream_ready                              ), //i
    .io_c_stream_payload_0_mantissa (biasAddOp_2_io_c_stream_payload_0_mantissa[2:0]), //o
    .io_c_stream_payload_0_exponent (biasAddOp_2_io_c_stream_payload_0_exponent[3:0]), //o
    .io_c_stream_payload_0_sign     (biasAddOp_2_io_c_stream_payload_0_sign         ), //o
    .io_reArm                       (io_biasReArm                                   ), //i
    .clk                            (clk                                            ), //i
    .reset                          (reset                                          )  //i
  );
  assign io_a_stream_ready = matmulOp_2_io_a_stream_ready;
  assign io_w_stream_ready = matmulOp_2_io_b_stream_ready;
  assign matmulResult_stream_valid = matmulOp_2_io_c_stream_valid;
  assign matmulResult_stream_payload_0_mantissa = matmulOp_2_io_c_stream_payload_0_mantissa;
  assign matmulResult_stream_payload_0_exponent = matmulOp_2_io_c_stream_payload_0_exponent;
  assign matmulResult_stream_payload_0_sign = matmulOp_2_io_c_stream_payload_0_sign;
  assign matmulResult_stream_ready = biasAddOp_2_io_a_stream_ready;
  assign io_b_stream_ready = biasAddOp_2_io_b_stream_ready;
  assign io_y_stream_valid = biasAddOp_2_io_c_stream_valid;
  assign io_y_stream_payload_0_mantissa = biasAddOp_2_io_c_stream_payload_0_mantissa;
  assign io_y_stream_payload_0_exponent = biasAddOp_2_io_c_stream_payload_0_exponent;
  assign io_y_stream_payload_0_sign = biasAddOp_2_io_c_stream_payload_0_sign;

endmodule

module RepackOp_7 (
  input  wire          io_a_stream_valid,
  output wire          io_a_stream_ready,
  input  wire [2:0]    io_a_stream_payload_0_mantissa,
  input  wire [3:0]    io_a_stream_payload_0_exponent,
  input  wire          io_a_stream_payload_0_sign,
  output wire          io_c_stream_valid,
  input  wire          io_c_stream_ready,
  output wire [2:0]    io_c_stream_payload_0_mantissa,
  output wire [3:0]    io_c_stream_payload_0_exponent,
  output wire          io_c_stream_payload_0_sign,
  output wire [2:0]    io_c_stream_payload_1_mantissa,
  output wire [3:0]    io_c_stream_payload_1_exponent,
  output wire          io_c_stream_payload_1_sign,
  output wire [2:0]    io_c_stream_payload_2_mantissa,
  output wire [3:0]    io_c_stream_payload_2_exponent,
  output wire          io_c_stream_payload_2_sign,
  output wire [2:0]    io_c_stream_payload_3_mantissa,
  output wire [3:0]    io_c_stream_payload_3_exponent,
  output wire          io_c_stream_payload_3_sign,
  input  wire          io_reArm,
  output wire          io_isEmpty,
  input  wire          clk,
  input  wire          reset
);

  wire       [1:0]    _zz_io_a_stream_translated_widthAdapter_counter_valueNext;
  wire       [0:0]    _zz_io_a_stream_translated_widthAdapter_counter_valueNext_1;
  wire       [15:0]   _zz_io_a_stream_translated_widthAdapter_buffer;
  wire                io_a_stream_translated_valid;
  wire                io_a_stream_translated_ready;
  wire       [7:0]    io_a_stream_translated_payload;
  wire       [31:0]   _zz_io_c_stream_payload_0_mantissa;
  wire                io_a_stream_translated_fire;
  reg                 io_a_stream_translated_widthAdapter_counter_willIncrement;
  wire                io_a_stream_translated_widthAdapter_counter_willDecrement;
  wire                io_a_stream_translated_widthAdapter_counter_willClear;
  wire                io_a_stream_translated_widthAdapter_counter_willLoad;
  reg        [1:0]    io_a_stream_translated_widthAdapter_counter_valueNext;
  reg        [1:0]    io_a_stream_translated_widthAdapter_counter_value;
  wire                io_a_stream_translated_widthAdapter_counter_willOverflowIfInc;
  wire                io_a_stream_translated_widthAdapter_counter_willUnderflowIfDec;
  wire                io_a_stream_translated_widthAdapter_counter_willOverflow;
  wire                io_a_stream_translated_widthAdapter_counter_willUnderflow;
  reg        [23:0]   io_a_stream_translated_widthAdapter_buffer;
  wire       [7:0]    _zz_io_c_stream_payload_0_mantissa_1;
  wire       [7:0]    _zz_io_c_stream_payload_1_mantissa;
  wire       [7:0]    _zz_io_c_stream_payload_2_mantissa;
  wire       [7:0]    _zz_io_c_stream_payload_3_mantissa;

  assign _zz_io_a_stream_translated_widthAdapter_counter_valueNext_1 = io_a_stream_translated_widthAdapter_counter_willIncrement;
  assign _zz_io_a_stream_translated_widthAdapter_counter_valueNext = {1'd0, _zz_io_a_stream_translated_widthAdapter_counter_valueNext_1};
  assign _zz_io_a_stream_translated_widthAdapter_buffer = (io_a_stream_translated_widthAdapter_buffer >>> 4'd8);
  assign io_a_stream_translated_valid = io_a_stream_valid;
  assign io_a_stream_ready = io_a_stream_translated_ready;
  assign io_a_stream_translated_payload = {io_a_stream_payload_0_sign,{io_a_stream_payload_0_exponent,io_a_stream_payload_0_mantissa}};
  assign io_a_stream_translated_fire = (io_a_stream_translated_valid && io_a_stream_translated_ready);
  always @(*) begin
    io_a_stream_translated_widthAdapter_counter_willIncrement = 1'b0;
    if(io_a_stream_translated_fire) begin
      io_a_stream_translated_widthAdapter_counter_willIncrement = 1'b1;
    end
  end

  assign io_a_stream_translated_widthAdapter_counter_willDecrement = 1'b0;
  assign io_a_stream_translated_widthAdapter_counter_willClear = 1'b0;
  assign io_a_stream_translated_widthAdapter_counter_willLoad = 1'b0;
  assign io_a_stream_translated_widthAdapter_counter_willOverflowIfInc = (io_a_stream_translated_widthAdapter_counter_value == 2'b11);
  assign io_a_stream_translated_widthAdapter_counter_willUnderflowIfDec = (io_a_stream_translated_widthAdapter_counter_value == 2'b00);
  assign io_a_stream_translated_widthAdapter_counter_willOverflow = (io_a_stream_translated_widthAdapter_counter_willOverflowIfInc && io_a_stream_translated_widthAdapter_counter_willIncrement);
  always @(*) begin
    io_a_stream_translated_widthAdapter_counter_valueNext = (io_a_stream_translated_widthAdapter_counter_value + _zz_io_a_stream_translated_widthAdapter_counter_valueNext);
    if(io_a_stream_translated_widthAdapter_counter_willClear) begin
      io_a_stream_translated_widthAdapter_counter_valueNext = 2'b00;
    end
  end

  assign io_a_stream_translated_widthAdapter_counter_willUnderflow = (io_a_stream_translated_widthAdapter_counter_willUnderflowIfDec && io_a_stream_translated_widthAdapter_counter_willDecrement);
  assign _zz_io_c_stream_payload_0_mantissa = {io_a_stream_translated_payload,io_a_stream_translated_widthAdapter_buffer};
  assign io_a_stream_translated_ready = (! ((! io_c_stream_ready) && io_a_stream_translated_widthAdapter_counter_willOverflowIfInc));
  assign io_c_stream_valid = (io_a_stream_translated_valid && io_a_stream_translated_widthAdapter_counter_willOverflowIfInc);
  assign _zz_io_c_stream_payload_0_mantissa_1 = _zz_io_c_stream_payload_0_mantissa[7 : 0];
  assign io_c_stream_payload_0_mantissa = _zz_io_c_stream_payload_0_mantissa_1[2 : 0];
  assign io_c_stream_payload_0_exponent = _zz_io_c_stream_payload_0_mantissa_1[6 : 3];
  assign io_c_stream_payload_0_sign = _zz_io_c_stream_payload_0_mantissa_1[7];
  assign _zz_io_c_stream_payload_1_mantissa = _zz_io_c_stream_payload_0_mantissa[15 : 8];
  assign io_c_stream_payload_1_mantissa = _zz_io_c_stream_payload_1_mantissa[2 : 0];
  assign io_c_stream_payload_1_exponent = _zz_io_c_stream_payload_1_mantissa[6 : 3];
  assign io_c_stream_payload_1_sign = _zz_io_c_stream_payload_1_mantissa[7];
  assign _zz_io_c_stream_payload_2_mantissa = _zz_io_c_stream_payload_0_mantissa[23 : 16];
  assign io_c_stream_payload_2_mantissa = _zz_io_c_stream_payload_2_mantissa[2 : 0];
  assign io_c_stream_payload_2_exponent = _zz_io_c_stream_payload_2_mantissa[6 : 3];
  assign io_c_stream_payload_2_sign = _zz_io_c_stream_payload_2_mantissa[7];
  assign _zz_io_c_stream_payload_3_mantissa = _zz_io_c_stream_payload_0_mantissa[31 : 24];
  assign io_c_stream_payload_3_mantissa = _zz_io_c_stream_payload_3_mantissa[2 : 0];
  assign io_c_stream_payload_3_exponent = _zz_io_c_stream_payload_3_mantissa[6 : 3];
  assign io_c_stream_payload_3_sign = _zz_io_c_stream_payload_3_mantissa[7];
  assign io_isEmpty = 1'b1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      io_a_stream_translated_widthAdapter_counter_value <= 2'b00;
    end else begin
      io_a_stream_translated_widthAdapter_counter_value <= io_a_stream_translated_widthAdapter_counter_valueNext;
    end
  end

  always @(posedge clk) begin
    if(io_a_stream_translated_fire) begin
      io_a_stream_translated_widthAdapter_buffer <= {io_a_stream_translated_payload,_zz_io_a_stream_translated_widthAdapter_buffer};
    end
  end


endmodule

module DoubleBufferStreamer_4 (
  output wire [3:0]    io_readAddr,
  input  wire [2:0]    io_readData_0_mantissa,
  input  wire [3:0]    io_readData_0_exponent,
  input  wire          io_readData_0_sign,
  output reg           io_nextTile,
  input  wire          io_tileReady,
  output wire          io_streamOut_valid,
  input  wire          io_streamOut_ready,
  output wire [2:0]    io_streamOut_payload_0_mantissa,
  output wire [3:0]    io_streamOut_payload_0_exponent,
  output wire          io_streamOut_payload_0_sign,
  input  wire          io_reArm,
  input  wire          clk,
  input  wire          reset
);

  reg                 fifo_io_flush;
  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [2:0]    fifo_io_pop_payload_0_mantissa;
  wire       [3:0]    fifo_io_pop_payload_0_exponent;
  wire                fifo_io_pop_payload_0_sign;
  wire       [4:0]    fifo_io_occupancy;
  wire       [4:0]    fifo_io_availability;
  wire       [3:0]    _zz_readCounter_valueNext;
  wire       [0:0]    _zz_readCounter_valueNext_1;
  reg                 readCounter_willIncrement;
  wire                readCounter_willDecrement;
  reg                 readCounter_willClear;
  wire                readCounter_willLoad;
  reg        [3:0]    readCounter_valueNext;
  reg        [3:0]    readCounter_value;
  wire                readCounter_willOverflowIfInc;
  wire                readCounter_willUnderflowIfDec;
  wire                readCounter_willOverflow;
  wire                readCounter_willUnderflow;
  reg                 isReading;
  wire                when_DoubleBufferStreamer_l38;
  wire                reqStream_valid;
  wire                reqStream_ready;
  wire       [3:0]    reqStream_payload;
  wire                reqStream_fire;
  reg                 delayedValid;

  assign _zz_readCounter_valueNext_1 = readCounter_willIncrement;
  assign _zz_readCounter_valueNext = {3'd0, _zz_readCounter_valueNext_1};
  StreamFifo_4 fifo (
    .io_push_valid              (delayedValid                       ), //i
    .io_push_ready              (fifo_io_push_ready                 ), //o
    .io_push_payload_0_mantissa (io_readData_0_mantissa[2:0]        ), //i
    .io_push_payload_0_exponent (io_readData_0_exponent[3:0]        ), //i
    .io_push_payload_0_sign     (io_readData_0_sign                 ), //i
    .io_pop_valid               (fifo_io_pop_valid                  ), //o
    .io_pop_ready               (io_streamOut_ready                 ), //i
    .io_pop_payload_0_mantissa  (fifo_io_pop_payload_0_mantissa[2:0]), //o
    .io_pop_payload_0_exponent  (fifo_io_pop_payload_0_exponent[3:0]), //o
    .io_pop_payload_0_sign      (fifo_io_pop_payload_0_sign         ), //o
    .io_flush                   (fifo_io_flush                      ), //i
    .io_occupancy               (fifo_io_occupancy[4:0]             ), //o
    .io_availability            (fifo_io_availability[4:0]          ), //o
    .clk                        (clk                                ), //i
    .reset                      (reset                              )  //i
  );
  always @(*) begin
    readCounter_willIncrement = 1'b0;
    if(reqStream_fire) begin
      readCounter_willIncrement = 1'b1;
    end
  end

  assign readCounter_willDecrement = 1'b0;
  always @(*) begin
    readCounter_willClear = 1'b0;
    if(io_reArm) begin
      readCounter_willClear = 1'b1;
    end
  end

  assign readCounter_willLoad = 1'b0;
  assign readCounter_willOverflowIfInc = (readCounter_value == 4'b1001);
  assign readCounter_willUnderflowIfDec = (readCounter_value == 4'b0000);
  assign readCounter_willOverflow = (readCounter_willOverflowIfInc && readCounter_willIncrement);
  always @(*) begin
    readCounter_valueNext = (readCounter_value + _zz_readCounter_valueNext);
    if(readCounter_willOverflow) begin
      readCounter_valueNext = 4'b0000;
    end
    if(readCounter_willClear) begin
      readCounter_valueNext = 4'b0000;
    end
  end

  assign readCounter_willUnderflow = (readCounter_willUnderflowIfDec && readCounter_willDecrement);
  always @(*) begin
    io_nextTile = 1'b0;
    if(reqStream_fire) begin
      if(readCounter_willOverflowIfInc) begin
        io_nextTile = 1'b1;
      end
    end
  end

  assign when_DoubleBufferStreamer_l38 = (io_tileReady && (! isReading));
  assign reqStream_valid = isReading;
  assign reqStream_payload = readCounter_value;
  assign io_readAddr = reqStream_payload;
  assign reqStream_fire = (reqStream_valid && reqStream_ready);
  assign io_streamOut_valid = fifo_io_pop_valid;
  assign io_streamOut_payload_0_mantissa = fifo_io_pop_payload_0_mantissa;
  assign io_streamOut_payload_0_exponent = fifo_io_pop_payload_0_exponent;
  assign io_streamOut_payload_0_sign = fifo_io_pop_payload_0_sign;
  assign reqStream_ready = (5'h01 < fifo_io_availability);
  always @(*) begin
    fifo_io_flush = 1'b0;
    if(io_reArm) begin
      fifo_io_flush = 1'b1;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      readCounter_value <= 4'b0000;
      isReading <= 1'b0;
      delayedValid <= 1'b0;
    end else begin
      readCounter_value <= readCounter_valueNext;
      if(when_DoubleBufferStreamer_l38) begin
        isReading <= 1'b1;
      end
      if(reqStream_fire) begin
        if(readCounter_willOverflowIfInc) begin
          isReading <= 1'b0;
        end
      end
      delayedValid <= reqStream_fire;
      if(io_reArm) begin
        isReading <= 1'b0;
        delayedValid <= 1'b0;
      end
    end
  end


endmodule

module StreamDoubleBuffer_6 (
  input  wire          io_streamIn_valid,
  output wire          io_streamIn_ready,
  input  wire [2:0]    io_streamIn_payload_0_mantissa,
  input  wire [3:0]    io_streamIn_payload_0_exponent,
  input  wire          io_streamIn_payload_0_sign,
  input  wire [3:0]    io_readAddr,
  output wire [2:0]    io_readData_0_mantissa,
  output wire [3:0]    io_readData_0_exponent,
  output wire          io_readData_0_sign,
  input  wire          io_nextTile,
  output wire          io_tileReady,
  input  wire          io_reArm,
  input  wire          io_residentHold,
  input  wire          io_stageRequest,
  output wire          io_loadCanAccept,
  output wire          io_tileFilled,
  output wire          io_refreshSettled,
  input  wire          clk,
  input  wire          reset
);

  reg        [7:0]    memPing_spinal_port0;
  reg        [7:0]    memPong_spinal_port0;
  wire                _zz_memPing_port;
  wire                _zz__zz_readDataPing_0_mantissa;
  wire                _zz_memPong_port;
  wire                _zz__zz_readDataPong_0_mantissa;
  wire       [3:0]    _zz_loadCounter_valueNext;
  wire       [0:0]    _zz_loadCounter_valueNext_1;
  wire       [7:0]    _zz_memPing_port_1;
  wire       [7:0]    _zz_memPong_port_1;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 loadBank;
  reg                 computeBank;
  reg                 pingFull;
  reg                 pongFull;
  wire       [2:0]    readDataPing_0_mantissa;
  wire       [3:0]    readDataPing_0_exponent;
  wire                readDataPing_0_sign;
  wire       [7:0]    _zz_readDataPing_0_mantissa;
  wire       [2:0]    readDataPong_0_mantissa;
  wire       [3:0]    readDataPong_0_exponent;
  wire                readDataPong_0_sign;
  wire       [7:0]    _zz_readDataPong_0_mantissa;
  reg                 computeBankDelayed;
  wire                _zz_io_readData_0_mantissa;
  reg                 loadCounter_willIncrement;
  wire                loadCounter_willDecrement;
  reg                 loadCounter_willClear;
  wire                loadCounter_willLoad;
  reg        [3:0]    loadCounter_valueNext;
  reg        [3:0]    loadCounter_value;
  wire                loadCounter_willOverflowIfInc;
  wire                loadCounter_willUnderflowIfDec;
  wire                loadCounter_willOverflow;
  wire                loadCounter_willUnderflow;
  wire                currentLoadBankFull;
  wire                loadDone;
  reg                 tileFilled;
  reg                 switchArmed;
  wire                allowFlip;
  wire                when_StreamDoubleBuffer_l114;
  wire                when_StreamDoubleBuffer_l117;
  wire                when_StreamDoubleBuffer_l123;
  wire                when_StreamDoubleBuffer_l125;
  wire                when_StreamDoubleBuffer_l135;
  wire                when_StreamDoubleBuffer_l137;
  wire                when_StreamDoubleBuffer_l142;
  wire                when_StreamDoubleBuffer_l144;
  reg [7:0] memPing [0:9];
  reg [7:0] memPong [0:9];

  assign _zz_loadCounter_valueNext_1 = loadCounter_willIncrement;
  assign _zz_loadCounter_valueNext = {3'd0, _zz_loadCounter_valueNext_1};
  assign _zz__zz_readDataPing_0_mantissa = 1'b1;
  assign _zz_memPing_port_1 = {io_streamIn_payload_0_sign,{io_streamIn_payload_0_exponent,io_streamIn_payload_0_mantissa}};
  assign _zz__zz_readDataPong_0_mantissa = 1'b1;
  assign _zz_memPong_port_1 = {io_streamIn_payload_0_sign,{io_streamIn_payload_0_exponent,io_streamIn_payload_0_mantissa}};
  always @(posedge clk) begin
    if(_zz__zz_readDataPing_0_mantissa) begin
      memPing_spinal_port0 <= memPing[io_readAddr];
    end
  end

  always @(posedge clk) begin
    if(_zz_2) begin
      memPing[loadCounter_value] <= _zz_memPing_port_1;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_readDataPong_0_mantissa) begin
      memPong_spinal_port0 <= memPong[io_readAddr];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      memPong[loadCounter_value] <= _zz_memPong_port_1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      if(!when_StreamDoubleBuffer_l125) begin
        _zz_1 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      if(when_StreamDoubleBuffer_l125) begin
        _zz_2 = 1'b1;
      end
    end
  end

  assign io_tileReady = ((computeBank == 1'b0) ? pingFull : pongFull);
  assign _zz_readDataPing_0_mantissa = memPing_spinal_port0[7 : 0];
  assign readDataPing_0_mantissa = _zz_readDataPing_0_mantissa[2 : 0];
  assign readDataPing_0_exponent = _zz_readDataPing_0_mantissa[6 : 3];
  assign readDataPing_0_sign = _zz_readDataPing_0_mantissa[7];
  assign _zz_readDataPong_0_mantissa = memPong_spinal_port0[7 : 0];
  assign readDataPong_0_mantissa = _zz_readDataPong_0_mantissa[2 : 0];
  assign readDataPong_0_exponent = _zz_readDataPong_0_mantissa[6 : 3];
  assign readDataPong_0_sign = _zz_readDataPong_0_mantissa[7];
  assign _zz_io_readData_0_mantissa = (computeBankDelayed == 1'b0);
  assign io_readData_0_mantissa = (_zz_io_readData_0_mantissa ? readDataPing_0_mantissa : readDataPong_0_mantissa);
  assign io_readData_0_exponent = (_zz_io_readData_0_mantissa ? readDataPing_0_exponent : readDataPong_0_exponent);
  assign io_readData_0_sign = (_zz_io_readData_0_mantissa ? readDataPing_0_sign : readDataPong_0_sign);
  always @(*) begin
    loadCounter_willIncrement = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      loadCounter_willIncrement = 1'b1;
    end
  end

  assign loadCounter_willDecrement = 1'b0;
  always @(*) begin
    loadCounter_willClear = 1'b0;
    if(io_reArm) begin
      loadCounter_willClear = 1'b1;
    end
  end

  assign loadCounter_willLoad = 1'b0;
  assign loadCounter_willOverflowIfInc = (loadCounter_value == 4'b1001);
  assign loadCounter_willUnderflowIfDec = (loadCounter_value == 4'b0000);
  assign loadCounter_willOverflow = (loadCounter_willOverflowIfInc && loadCounter_willIncrement);
  always @(*) begin
    loadCounter_valueNext = (loadCounter_value + _zz_loadCounter_valueNext);
    if(loadCounter_willOverflow) begin
      loadCounter_valueNext = 4'b0000;
    end
    if(loadCounter_willClear) begin
      loadCounter_valueNext = 4'b0000;
    end
  end

  assign loadCounter_willUnderflow = (loadCounter_willUnderflowIfDec && loadCounter_willDecrement);
  assign currentLoadBankFull = ((loadBank == 1'b0) ? pingFull : pongFull);
  assign io_streamIn_ready = (! currentLoadBankFull);
  assign io_loadCanAccept = (! currentLoadBankFull);
  assign loadDone = ((io_streamIn_valid && (! currentLoadBankFull)) && loadCounter_willOverflowIfInc);
  assign io_tileFilled = tileFilled;
  assign allowFlip = ((! io_residentHold) || switchArmed);
  assign when_StreamDoubleBuffer_l114 = (io_stageRequest && tileFilled);
  assign when_StreamDoubleBuffer_l117 = (io_nextTile && allowFlip);
  assign io_refreshSettled = ((io_nextTile && allowFlip) && switchArmed);
  assign when_StreamDoubleBuffer_l123 = (io_streamIn_valid && (! currentLoadBankFull));
  assign when_StreamDoubleBuffer_l125 = (loadBank == 1'b0);
  assign when_StreamDoubleBuffer_l135 = ((io_nextTile && allowFlip) && (computeBank == 1'b0));
  assign when_StreamDoubleBuffer_l137 = (loadDone && (loadBank == 1'b0));
  assign when_StreamDoubleBuffer_l142 = ((io_nextTile && allowFlip) && (computeBank == 1'b1));
  assign when_StreamDoubleBuffer_l144 = (loadDone && (loadBank == 1'b1));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      loadBank <= 1'b0;
      computeBank <= 1'b0;
      pingFull <= 1'b0;
      pongFull <= 1'b0;
      loadCounter_value <= 4'b0000;
      tileFilled <= 1'b0;
      switchArmed <= 1'b0;
    end else begin
      loadCounter_value <= loadCounter_valueNext;
      tileFilled <= loadDone;
      if(when_StreamDoubleBuffer_l114) begin
        switchArmed <= 1'b1;
      end
      if(when_StreamDoubleBuffer_l117) begin
        computeBank <= (! computeBank);
        switchArmed <= 1'b0;
      end
      if(when_StreamDoubleBuffer_l135) begin
        pingFull <= 1'b0;
      end else begin
        if(when_StreamDoubleBuffer_l137) begin
          pingFull <= 1'b1;
        end
      end
      if(when_StreamDoubleBuffer_l142) begin
        pongFull <= 1'b0;
      end else begin
        if(when_StreamDoubleBuffer_l144) begin
          pongFull <= 1'b1;
        end
      end
      if(loadDone) begin
        loadBank <= (! loadBank);
      end
      if(io_reArm) begin
        loadBank <= 1'b0;
        computeBank <= 1'b0;
        pingFull <= 1'b0;
        pongFull <= 1'b0;
        switchArmed <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    computeBankDelayed <= computeBank;
  end


endmodule

module DMAReader_4 (
  input  wire          io_cmd_valid,
  output wire          io_cmd_ready,
  input  wire [31:0]   io_cmd_payload_address,
  input  wire [15:0]   io_cmd_payload_length,
  output wire          io_axiMaster_ar_valid,
  input  wire          io_axiMaster_ar_ready,
  output wire [31:0]   io_axiMaster_ar_payload_addr,
  output wire [0:0]    io_axiMaster_ar_payload_id,
  output wire [3:0]    io_axiMaster_ar_payload_region,
  output wire [7:0]    io_axiMaster_ar_payload_len,
  output wire [2:0]    io_axiMaster_ar_payload_size,
  output wire [1:0]    io_axiMaster_ar_payload_burst,
  output wire [0:0]    io_axiMaster_ar_payload_lock,
  output wire [3:0]    io_axiMaster_ar_payload_cache,
  output wire [3:0]    io_axiMaster_ar_payload_qos,
  output wire [2:0]    io_axiMaster_ar_payload_prot,
  input  wire          io_axiMaster_r_valid,
  output wire          io_axiMaster_r_ready,
  input  wire [63:0]   io_axiMaster_r_payload_data,
  input  wire [0:0]    io_axiMaster_r_payload_id,
  input  wire [1:0]    io_axiMaster_r_payload_resp,
  input  wire          io_axiMaster_r_payload_last,
  output wire          io_outStream_stream_valid,
  input  wire          io_outStream_stream_ready,
  output wire [2:0]    io_outStream_stream_payload_0_mantissa,
  output wire [3:0]    io_outStream_stream_payload_0_exponent,
  output wire          io_outStream_stream_payload_0_sign,
  input  wire          clk,
  input  wire          reset
);

  wire                repackOp_8_io_c_stream_ready;
  wire                repackOp_8_io_a_stream_ready;
  wire                repackOp_8_io_c_stream_valid;
  wire       [2:0]    repackOp_8_io_c_stream_payload_0_mantissa;
  wire       [3:0]    repackOp_8_io_c_stream_payload_0_exponent;
  wire                repackOp_8_io_c_stream_payload_0_sign;
  wire                repackOp_8_io_isEmpty;
  wire       [16:0]   _zz_remaining;
  wire       [1:0]    _zz_remaining_1;
  wire       [12:0]   _zz_bytesToBoundary;
  wire       [9:0]    _zz_beatsToBoundary;
  wire       [15:0]   _zz__zz_burstLen_3;
  wire       [15:0]   _zz__zz_burstLen_3_1;
  wire       [15:0]   _zz__zz_burstLen_3_2;
  wire       [16:0]   _zz_io_axiMaster_ar_payload_len;
  wire       [31:0]   _zz_addrReg;
  wire       [19:0]   _zz_addrReg_1;
  reg        [16:0]   remaining;
  reg        [8:0]    burstRemain;
  reg        [31:0]   addrReg;
  wire                baseReady;
  wire                gearboxEmpty;
  wire                io_cmd_fire;
  wire       [11:0]   offsetInPage;
  wire       [12:0]   bytesToBoundary;
  wire       [15:0]   beatsToBoundary;
  wire       [16:0]   _zz_burstLen;
  wire       [16:0]   _zz_burstLen_1;
  wire       [0:0]    _zz_burstLen_2;
  wire       [16:0]   _zz_burstLen_3;
  wire       [16:0]   burstLen;
  wire                io_axiMaster_ar_fire;
  wire                axiRawTensor_stream_valid;
  wire                axiRawTensor_stream_ready;
  wire       [2:0]    axiRawTensor_stream_payload_0_mantissa;
  wire       [3:0]    axiRawTensor_stream_payload_0_exponent;
  wire                axiRawTensor_stream_payload_0_sign;
  wire       [2:0]    axiRawTensor_stream_payload_1_mantissa;
  wire       [3:0]    axiRawTensor_stream_payload_1_exponent;
  wire                axiRawTensor_stream_payload_1_sign;
  wire       [2:0]    axiRawTensor_stream_payload_2_mantissa;
  wire       [3:0]    axiRawTensor_stream_payload_2_exponent;
  wire                axiRawTensor_stream_payload_2_sign;
  wire       [2:0]    axiRawTensor_stream_payload_3_mantissa;
  wire       [3:0]    axiRawTensor_stream_payload_3_exponent;
  wire                axiRawTensor_stream_payload_3_sign;
  wire       [2:0]    axiRawTensor_stream_payload_4_mantissa;
  wire       [3:0]    axiRawTensor_stream_payload_4_exponent;
  wire                axiRawTensor_stream_payload_4_sign;
  wire       [2:0]    axiRawTensor_stream_payload_5_mantissa;
  wire       [3:0]    axiRawTensor_stream_payload_5_exponent;
  wire                axiRawTensor_stream_payload_5_sign;
  wire       [2:0]    axiRawTensor_stream_payload_6_mantissa;
  wire       [3:0]    axiRawTensor_stream_payload_6_exponent;
  wire                axiRawTensor_stream_payload_6_sign;
  wire       [2:0]    axiRawTensor_stream_payload_7_mantissa;
  wire       [3:0]    axiRawTensor_stream_payload_7_exponent;
  wire                axiRawTensor_stream_payload_7_sign;
  wire                when_DMAReader_l115;
  wire       [7:0]    _zz_axiRawTensor_stream_payload_0_mantissa;
  wire       [7:0]    _zz_axiRawTensor_stream_payload_1_mantissa;
  wire       [7:0]    _zz_axiRawTensor_stream_payload_2_mantissa;
  wire       [7:0]    _zz_axiRawTensor_stream_payload_3_mantissa;
  wire       [7:0]    _zz_axiRawTensor_stream_payload_4_mantissa;
  wire       [7:0]    _zz_axiRawTensor_stream_payload_5_mantissa;
  wire       [7:0]    _zz_axiRawTensor_stream_payload_6_mantissa;
  wire       [7:0]    _zz_axiRawTensor_stream_payload_7_mantissa;
  reg        [3:0]    _zz_trimmedStream_stream_valid;
  wire                _zz_trimmedStream_stream_valid_1;
  wire                trimmedStream_stream_valid;
  wire                trimmedStream_stream_ready;
  wire       [2:0]    trimmedStream_stream_payload_0_mantissa;
  wire       [3:0]    trimmedStream_stream_payload_0_exponent;
  wire                trimmedStream_stream_payload_0_sign;
  wire                trimmedStream_stream_fire;

  assign _zz_remaining_1 = {1'b0,1'b1};
  assign _zz_remaining = {15'd0, _zz_remaining_1};
  assign _zz_bytesToBoundary = {1'd0, offsetInPage};
  assign _zz_beatsToBoundary = (bytesToBoundary >>> 2'd3);
  assign _zz__zz_burstLen_3 = ((beatsToBoundary < _zz__zz_burstLen_3_1) ? _zz__zz_burstLen_3_2 : beatsToBoundary);
  assign _zz__zz_burstLen_3_1 = {15'd0, _zz_burstLen_2};
  assign _zz__zz_burstLen_3_2 = {15'd0, _zz_burstLen_2};
  assign _zz_io_axiMaster_ar_payload_len = (burstLen - 17'h00001);
  assign _zz_addrReg_1 = ({3'd0,burstLen} <<< 2'd3);
  assign _zz_addrReg = {12'd0, _zz_addrReg_1};
  RepackOp_5 repackOp_8 (
    .io_a_stream_valid              (axiRawTensor_stream_valid                     ), //i
    .io_a_stream_ready              (repackOp_8_io_a_stream_ready                  ), //o
    .io_a_stream_payload_0_mantissa (axiRawTensor_stream_payload_0_mantissa[2:0]   ), //i
    .io_a_stream_payload_0_exponent (axiRawTensor_stream_payload_0_exponent[3:0]   ), //i
    .io_a_stream_payload_0_sign     (axiRawTensor_stream_payload_0_sign            ), //i
    .io_a_stream_payload_1_mantissa (axiRawTensor_stream_payload_1_mantissa[2:0]   ), //i
    .io_a_stream_payload_1_exponent (axiRawTensor_stream_payload_1_exponent[3:0]   ), //i
    .io_a_stream_payload_1_sign     (axiRawTensor_stream_payload_1_sign            ), //i
    .io_a_stream_payload_2_mantissa (axiRawTensor_stream_payload_2_mantissa[2:0]   ), //i
    .io_a_stream_payload_2_exponent (axiRawTensor_stream_payload_2_exponent[3:0]   ), //i
    .io_a_stream_payload_2_sign     (axiRawTensor_stream_payload_2_sign            ), //i
    .io_a_stream_payload_3_mantissa (axiRawTensor_stream_payload_3_mantissa[2:0]   ), //i
    .io_a_stream_payload_3_exponent (axiRawTensor_stream_payload_3_exponent[3:0]   ), //i
    .io_a_stream_payload_3_sign     (axiRawTensor_stream_payload_3_sign            ), //i
    .io_a_stream_payload_4_mantissa (axiRawTensor_stream_payload_4_mantissa[2:0]   ), //i
    .io_a_stream_payload_4_exponent (axiRawTensor_stream_payload_4_exponent[3:0]   ), //i
    .io_a_stream_payload_4_sign     (axiRawTensor_stream_payload_4_sign            ), //i
    .io_a_stream_payload_5_mantissa (axiRawTensor_stream_payload_5_mantissa[2:0]   ), //i
    .io_a_stream_payload_5_exponent (axiRawTensor_stream_payload_5_exponent[3:0]   ), //i
    .io_a_stream_payload_5_sign     (axiRawTensor_stream_payload_5_sign            ), //i
    .io_a_stream_payload_6_mantissa (axiRawTensor_stream_payload_6_mantissa[2:0]   ), //i
    .io_a_stream_payload_6_exponent (axiRawTensor_stream_payload_6_exponent[3:0]   ), //i
    .io_a_stream_payload_6_sign     (axiRawTensor_stream_payload_6_sign            ), //i
    .io_a_stream_payload_7_mantissa (axiRawTensor_stream_payload_7_mantissa[2:0]   ), //i
    .io_a_stream_payload_7_exponent (axiRawTensor_stream_payload_7_exponent[3:0]   ), //i
    .io_a_stream_payload_7_sign     (axiRawTensor_stream_payload_7_sign            ), //i
    .io_c_stream_valid              (repackOp_8_io_c_stream_valid                  ), //o
    .io_c_stream_ready              (repackOp_8_io_c_stream_ready                  ), //i
    .io_c_stream_payload_0_mantissa (repackOp_8_io_c_stream_payload_0_mantissa[2:0]), //o
    .io_c_stream_payload_0_exponent (repackOp_8_io_c_stream_payload_0_exponent[3:0]), //o
    .io_c_stream_payload_0_sign     (repackOp_8_io_c_stream_payload_0_sign         ), //o
    .io_reArm                       (io_cmd_fire                                   ), //i
    .io_isEmpty                     (repackOp_8_io_isEmpty                         ), //o
    .clk                            (clk                                           ), //i
    .reset                          (reset                                         )  //i
  );
  assign baseReady = ((remaining == 17'h0) && (burstRemain == 9'h0));
  assign io_cmd_ready = (baseReady && gearboxEmpty);
  assign io_cmd_fire = (io_cmd_valid && io_cmd_ready);
  assign offsetInPage = addrReg[11 : 0];
  assign bytesToBoundary = (13'h1000 - _zz_bytesToBoundary);
  assign beatsToBoundary = {6'd0, _zz_beatsToBoundary};
  assign _zz_burstLen = 17'h00100;
  assign _zz_burstLen_1 = ((remaining < _zz_burstLen) ? remaining : _zz_burstLen);
  assign _zz_burstLen_2 = 1'b1;
  assign _zz_burstLen_3 = {1'd0, _zz__zz_burstLen_3};
  assign burstLen = ((_zz_burstLen_1 < _zz_burstLen_3) ? _zz_burstLen_1 : _zz_burstLen_3);
  assign io_axiMaster_ar_valid = ((remaining != 17'h0) && (burstRemain == 9'h0));
  assign io_axiMaster_ar_payload_addr = addrReg;
  assign io_axiMaster_ar_payload_len = _zz_io_axiMaster_ar_payload_len[7:0];
  assign io_axiMaster_ar_payload_size = 3'b011;
  assign io_axiMaster_ar_payload_burst = 2'b01;
  assign io_axiMaster_ar_fire = (io_axiMaster_ar_valid && io_axiMaster_ar_ready);
  assign io_axiMaster_ar_payload_id = 1'b0;
  assign io_axiMaster_ar_payload_prot = 3'b000;
  assign io_axiMaster_ar_payload_cache = 4'b0000;
  assign io_axiMaster_ar_payload_lock = 1'b0;
  assign io_axiMaster_ar_payload_qos = 4'b0000;
  assign io_axiMaster_ar_payload_region = 4'b0000;
  assign axiRawTensor_stream_valid = (io_axiMaster_r_valid && (burstRemain != 9'h0));
  assign io_axiMaster_r_ready = axiRawTensor_stream_ready;
  assign when_DMAReader_l115 = (io_axiMaster_r_valid && io_axiMaster_r_ready);
  assign _zz_axiRawTensor_stream_payload_0_mantissa = io_axiMaster_r_payload_data[7 : 0];
  assign axiRawTensor_stream_payload_0_mantissa = _zz_axiRawTensor_stream_payload_0_mantissa[2 : 0];
  assign axiRawTensor_stream_payload_0_exponent = _zz_axiRawTensor_stream_payload_0_mantissa[6 : 3];
  assign axiRawTensor_stream_payload_0_sign = _zz_axiRawTensor_stream_payload_0_mantissa[7];
  assign _zz_axiRawTensor_stream_payload_1_mantissa = io_axiMaster_r_payload_data[15 : 8];
  assign axiRawTensor_stream_payload_1_mantissa = _zz_axiRawTensor_stream_payload_1_mantissa[2 : 0];
  assign axiRawTensor_stream_payload_1_exponent = _zz_axiRawTensor_stream_payload_1_mantissa[6 : 3];
  assign axiRawTensor_stream_payload_1_sign = _zz_axiRawTensor_stream_payload_1_mantissa[7];
  assign _zz_axiRawTensor_stream_payload_2_mantissa = io_axiMaster_r_payload_data[23 : 16];
  assign axiRawTensor_stream_payload_2_mantissa = _zz_axiRawTensor_stream_payload_2_mantissa[2 : 0];
  assign axiRawTensor_stream_payload_2_exponent = _zz_axiRawTensor_stream_payload_2_mantissa[6 : 3];
  assign axiRawTensor_stream_payload_2_sign = _zz_axiRawTensor_stream_payload_2_mantissa[7];
  assign _zz_axiRawTensor_stream_payload_3_mantissa = io_axiMaster_r_payload_data[31 : 24];
  assign axiRawTensor_stream_payload_3_mantissa = _zz_axiRawTensor_stream_payload_3_mantissa[2 : 0];
  assign axiRawTensor_stream_payload_3_exponent = _zz_axiRawTensor_stream_payload_3_mantissa[6 : 3];
  assign axiRawTensor_stream_payload_3_sign = _zz_axiRawTensor_stream_payload_3_mantissa[7];
  assign _zz_axiRawTensor_stream_payload_4_mantissa = io_axiMaster_r_payload_data[39 : 32];
  assign axiRawTensor_stream_payload_4_mantissa = _zz_axiRawTensor_stream_payload_4_mantissa[2 : 0];
  assign axiRawTensor_stream_payload_4_exponent = _zz_axiRawTensor_stream_payload_4_mantissa[6 : 3];
  assign axiRawTensor_stream_payload_4_sign = _zz_axiRawTensor_stream_payload_4_mantissa[7];
  assign _zz_axiRawTensor_stream_payload_5_mantissa = io_axiMaster_r_payload_data[47 : 40];
  assign axiRawTensor_stream_payload_5_mantissa = _zz_axiRawTensor_stream_payload_5_mantissa[2 : 0];
  assign axiRawTensor_stream_payload_5_exponent = _zz_axiRawTensor_stream_payload_5_mantissa[6 : 3];
  assign axiRawTensor_stream_payload_5_sign = _zz_axiRawTensor_stream_payload_5_mantissa[7];
  assign _zz_axiRawTensor_stream_payload_6_mantissa = io_axiMaster_r_payload_data[55 : 48];
  assign axiRawTensor_stream_payload_6_mantissa = _zz_axiRawTensor_stream_payload_6_mantissa[2 : 0];
  assign axiRawTensor_stream_payload_6_exponent = _zz_axiRawTensor_stream_payload_6_mantissa[6 : 3];
  assign axiRawTensor_stream_payload_6_sign = _zz_axiRawTensor_stream_payload_6_mantissa[7];
  assign _zz_axiRawTensor_stream_payload_7_mantissa = io_axiMaster_r_payload_data[63 : 56];
  assign axiRawTensor_stream_payload_7_mantissa = _zz_axiRawTensor_stream_payload_7_mantissa[2 : 0];
  assign axiRawTensor_stream_payload_7_exponent = _zz_axiRawTensor_stream_payload_7_mantissa[6 : 3];
  assign axiRawTensor_stream_payload_7_sign = _zz_axiRawTensor_stream_payload_7_mantissa[7];
  assign axiRawTensor_stream_ready = repackOp_8_io_a_stream_ready;
  assign gearboxEmpty = repackOp_8_io_isEmpty;
  assign _zz_trimmedStream_stream_valid_1 = (4'b1010 <= _zz_trimmedStream_stream_valid);
  assign trimmedStream_stream_valid = (repackOp_8_io_c_stream_valid && (! _zz_trimmedStream_stream_valid_1));
  assign repackOp_8_io_c_stream_ready = (io_outStream_stream_ready || _zz_trimmedStream_stream_valid_1);
  assign trimmedStream_stream_fire = (trimmedStream_stream_valid && trimmedStream_stream_ready);
  assign trimmedStream_stream_payload_0_mantissa = repackOp_8_io_c_stream_payload_0_mantissa;
  assign trimmedStream_stream_payload_0_exponent = repackOp_8_io_c_stream_payload_0_exponent;
  assign trimmedStream_stream_payload_0_sign = repackOp_8_io_c_stream_payload_0_sign;
  assign io_outStream_stream_valid = trimmedStream_stream_valid;
  assign trimmedStream_stream_ready = io_outStream_stream_ready;
  assign io_outStream_stream_payload_0_mantissa = trimmedStream_stream_payload_0_mantissa;
  assign io_outStream_stream_payload_0_exponent = trimmedStream_stream_payload_0_exponent;
  assign io_outStream_stream_payload_0_sign = trimmedStream_stream_payload_0_sign;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      remaining <= 17'h0;
      burstRemain <= 9'h0;
      addrReg <= 32'h0;
      _zz_trimmedStream_stream_valid <= 4'b0000;
    end else begin
      if(io_cmd_fire) begin
        addrReg <= io_cmd_payload_address;
        remaining <= ({1'b0,io_cmd_payload_length} + _zz_remaining);
      end
      if(io_axiMaster_ar_fire) begin
        addrReg <= (addrReg + _zz_addrReg);
        remaining <= (remaining - burstLen);
        burstRemain <= burstLen[8:0];
      end
      if(when_DMAReader_l115) begin
        burstRemain <= (burstRemain - 9'h001);
      end
      if(io_cmd_fire) begin
        _zz_trimmedStream_stream_valid <= 4'b0000;
      end
      if(trimmedStream_stream_fire) begin
        _zz_trimmedStream_stream_valid <= (_zz_trimmedStream_stream_valid + 4'b0001);
      end
    end
  end


endmodule

module DoubleBufferStreamer_3 (
  output wire [9:0]    io_readAddr,
  input  wire [2:0]    io_readData_0_mantissa,
  input  wire [3:0]    io_readData_0_exponent,
  input  wire          io_readData_0_sign,
  input  wire [2:0]    io_readData_1_mantissa,
  input  wire [3:0]    io_readData_1_exponent,
  input  wire          io_readData_1_sign,
  input  wire [2:0]    io_readData_2_mantissa,
  input  wire [3:0]    io_readData_2_exponent,
  input  wire          io_readData_2_sign,
  input  wire [2:0]    io_readData_3_mantissa,
  input  wire [3:0]    io_readData_3_exponent,
  input  wire          io_readData_3_sign,
  output reg           io_nextTile,
  input  wire          io_tileReady,
  output wire          io_streamOut_valid,
  input  wire          io_streamOut_ready,
  output wire [2:0]    io_streamOut_payload_0_mantissa,
  output wire [3:0]    io_streamOut_payload_0_exponent,
  output wire          io_streamOut_payload_0_sign,
  output wire [2:0]    io_streamOut_payload_1_mantissa,
  output wire [3:0]    io_streamOut_payload_1_exponent,
  output wire          io_streamOut_payload_1_sign,
  output wire [2:0]    io_streamOut_payload_2_mantissa,
  output wire [3:0]    io_streamOut_payload_2_exponent,
  output wire          io_streamOut_payload_2_sign,
  output wire [2:0]    io_streamOut_payload_3_mantissa,
  output wire [3:0]    io_streamOut_payload_3_exponent,
  output wire          io_streamOut_payload_3_sign,
  input  wire          io_reArm,
  input  wire          clk,
  input  wire          reset
);

  reg                 fifo_io_flush;
  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [2:0]    fifo_io_pop_payload_0_mantissa;
  wire       [3:0]    fifo_io_pop_payload_0_exponent;
  wire                fifo_io_pop_payload_0_sign;
  wire       [2:0]    fifo_io_pop_payload_1_mantissa;
  wire       [3:0]    fifo_io_pop_payload_1_exponent;
  wire                fifo_io_pop_payload_1_sign;
  wire       [2:0]    fifo_io_pop_payload_2_mantissa;
  wire       [3:0]    fifo_io_pop_payload_2_exponent;
  wire                fifo_io_pop_payload_2_sign;
  wire       [2:0]    fifo_io_pop_payload_3_mantissa;
  wire       [3:0]    fifo_io_pop_payload_3_exponent;
  wire                fifo_io_pop_payload_3_sign;
  wire       [4:0]    fifo_io_occupancy;
  wire       [4:0]    fifo_io_availability;
  wire       [9:0]    _zz_readCounter_valueNext;
  wire       [0:0]    _zz_readCounter_valueNext_1;
  reg                 readCounter_willIncrement;
  wire                readCounter_willDecrement;
  reg                 readCounter_willClear;
  wire                readCounter_willLoad;
  reg        [9:0]    readCounter_valueNext;
  reg        [9:0]    readCounter_value;
  wire                readCounter_willOverflowIfInc;
  wire                readCounter_willUnderflowIfDec;
  wire                readCounter_willOverflow;
  wire                readCounter_willUnderflow;
  reg                 isReading;
  wire                when_DoubleBufferStreamer_l38;
  wire                reqStream_valid;
  wire                reqStream_ready;
  wire       [9:0]    reqStream_payload;
  wire                reqStream_fire;
  reg                 delayedValid;

  assign _zz_readCounter_valueNext_1 = readCounter_willIncrement;
  assign _zz_readCounter_valueNext = {9'd0, _zz_readCounter_valueNext_1};
  StreamFifo_3 fifo (
    .io_push_valid              (delayedValid                       ), //i
    .io_push_ready              (fifo_io_push_ready                 ), //o
    .io_push_payload_0_mantissa (io_readData_0_mantissa[2:0]        ), //i
    .io_push_payload_0_exponent (io_readData_0_exponent[3:0]        ), //i
    .io_push_payload_0_sign     (io_readData_0_sign                 ), //i
    .io_push_payload_1_mantissa (io_readData_1_mantissa[2:0]        ), //i
    .io_push_payload_1_exponent (io_readData_1_exponent[3:0]        ), //i
    .io_push_payload_1_sign     (io_readData_1_sign                 ), //i
    .io_push_payload_2_mantissa (io_readData_2_mantissa[2:0]        ), //i
    .io_push_payload_2_exponent (io_readData_2_exponent[3:0]        ), //i
    .io_push_payload_2_sign     (io_readData_2_sign                 ), //i
    .io_push_payload_3_mantissa (io_readData_3_mantissa[2:0]        ), //i
    .io_push_payload_3_exponent (io_readData_3_exponent[3:0]        ), //i
    .io_push_payload_3_sign     (io_readData_3_sign                 ), //i
    .io_pop_valid               (fifo_io_pop_valid                  ), //o
    .io_pop_ready               (io_streamOut_ready                 ), //i
    .io_pop_payload_0_mantissa  (fifo_io_pop_payload_0_mantissa[2:0]), //o
    .io_pop_payload_0_exponent  (fifo_io_pop_payload_0_exponent[3:0]), //o
    .io_pop_payload_0_sign      (fifo_io_pop_payload_0_sign         ), //o
    .io_pop_payload_1_mantissa  (fifo_io_pop_payload_1_mantissa[2:0]), //o
    .io_pop_payload_1_exponent  (fifo_io_pop_payload_1_exponent[3:0]), //o
    .io_pop_payload_1_sign      (fifo_io_pop_payload_1_sign         ), //o
    .io_pop_payload_2_mantissa  (fifo_io_pop_payload_2_mantissa[2:0]), //o
    .io_pop_payload_2_exponent  (fifo_io_pop_payload_2_exponent[3:0]), //o
    .io_pop_payload_2_sign      (fifo_io_pop_payload_2_sign         ), //o
    .io_pop_payload_3_mantissa  (fifo_io_pop_payload_3_mantissa[2:0]), //o
    .io_pop_payload_3_exponent  (fifo_io_pop_payload_3_exponent[3:0]), //o
    .io_pop_payload_3_sign      (fifo_io_pop_payload_3_sign         ), //o
    .io_flush                   (fifo_io_flush                      ), //i
    .io_occupancy               (fifo_io_occupancy[4:0]             ), //o
    .io_availability            (fifo_io_availability[4:0]          ), //o
    .clk                        (clk                                ), //i
    .reset                      (reset                              )  //i
  );
  always @(*) begin
    readCounter_willIncrement = 1'b0;
    if(reqStream_fire) begin
      readCounter_willIncrement = 1'b1;
    end
  end

  assign readCounter_willDecrement = 1'b0;
  always @(*) begin
    readCounter_willClear = 1'b0;
    if(io_reArm) begin
      readCounter_willClear = 1'b1;
    end
  end

  assign readCounter_willLoad = 1'b0;
  assign readCounter_willOverflowIfInc = (readCounter_value == 10'h2cf);
  assign readCounter_willUnderflowIfDec = (readCounter_value == 10'h0);
  assign readCounter_willOverflow = (readCounter_willOverflowIfInc && readCounter_willIncrement);
  always @(*) begin
    readCounter_valueNext = (readCounter_value + _zz_readCounter_valueNext);
    if(readCounter_willOverflow) begin
      readCounter_valueNext = 10'h0;
    end
    if(readCounter_willClear) begin
      readCounter_valueNext = 10'h0;
    end
  end

  assign readCounter_willUnderflow = (readCounter_willUnderflowIfDec && readCounter_willDecrement);
  always @(*) begin
    io_nextTile = 1'b0;
    if(reqStream_fire) begin
      if(readCounter_willOverflowIfInc) begin
        io_nextTile = 1'b1;
      end
    end
  end

  assign when_DoubleBufferStreamer_l38 = (io_tileReady && (! isReading));
  assign reqStream_valid = isReading;
  assign reqStream_payload = readCounter_value;
  assign io_readAddr = reqStream_payload;
  assign reqStream_fire = (reqStream_valid && reqStream_ready);
  assign io_streamOut_valid = fifo_io_pop_valid;
  assign io_streamOut_payload_0_mantissa = fifo_io_pop_payload_0_mantissa;
  assign io_streamOut_payload_0_exponent = fifo_io_pop_payload_0_exponent;
  assign io_streamOut_payload_0_sign = fifo_io_pop_payload_0_sign;
  assign io_streamOut_payload_1_mantissa = fifo_io_pop_payload_1_mantissa;
  assign io_streamOut_payload_1_exponent = fifo_io_pop_payload_1_exponent;
  assign io_streamOut_payload_1_sign = fifo_io_pop_payload_1_sign;
  assign io_streamOut_payload_2_mantissa = fifo_io_pop_payload_2_mantissa;
  assign io_streamOut_payload_2_exponent = fifo_io_pop_payload_2_exponent;
  assign io_streamOut_payload_2_sign = fifo_io_pop_payload_2_sign;
  assign io_streamOut_payload_3_mantissa = fifo_io_pop_payload_3_mantissa;
  assign io_streamOut_payload_3_exponent = fifo_io_pop_payload_3_exponent;
  assign io_streamOut_payload_3_sign = fifo_io_pop_payload_3_sign;
  assign reqStream_ready = (5'h01 < fifo_io_availability);
  always @(*) begin
    fifo_io_flush = 1'b0;
    if(io_reArm) begin
      fifo_io_flush = 1'b1;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      readCounter_value <= 10'h0;
      isReading <= 1'b0;
      delayedValid <= 1'b0;
    end else begin
      readCounter_value <= readCounter_valueNext;
      if(when_DoubleBufferStreamer_l38) begin
        isReading <= 1'b1;
      end
      if(reqStream_fire) begin
        if(readCounter_willOverflowIfInc) begin
          isReading <= 1'b0;
        end
      end
      delayedValid <= reqStream_fire;
      if(io_reArm) begin
        isReading <= 1'b0;
        delayedValid <= 1'b0;
      end
    end
  end


endmodule

module StreamDoubleBuffer_5 (
  input  wire          io_streamIn_valid,
  output wire          io_streamIn_ready,
  input  wire [2:0]    io_streamIn_payload_0_mantissa,
  input  wire [3:0]    io_streamIn_payload_0_exponent,
  input  wire          io_streamIn_payload_0_sign,
  input  wire [2:0]    io_streamIn_payload_1_mantissa,
  input  wire [3:0]    io_streamIn_payload_1_exponent,
  input  wire          io_streamIn_payload_1_sign,
  input  wire [2:0]    io_streamIn_payload_2_mantissa,
  input  wire [3:0]    io_streamIn_payload_2_exponent,
  input  wire          io_streamIn_payload_2_sign,
  input  wire [2:0]    io_streamIn_payload_3_mantissa,
  input  wire [3:0]    io_streamIn_payload_3_exponent,
  input  wire          io_streamIn_payload_3_sign,
  input  wire [9:0]    io_readAddr,
  output wire [2:0]    io_readData_0_mantissa,
  output wire [3:0]    io_readData_0_exponent,
  output wire          io_readData_0_sign,
  output wire [2:0]    io_readData_1_mantissa,
  output wire [3:0]    io_readData_1_exponent,
  output wire          io_readData_1_sign,
  output wire [2:0]    io_readData_2_mantissa,
  output wire [3:0]    io_readData_2_exponent,
  output wire          io_readData_2_sign,
  output wire [2:0]    io_readData_3_mantissa,
  output wire [3:0]    io_readData_3_exponent,
  output wire          io_readData_3_sign,
  input  wire          io_nextTile,
  output wire          io_tileReady,
  input  wire          io_reArm,
  input  wire          io_residentHold,
  input  wire          io_stageRequest,
  output wire          io_loadCanAccept,
  output wire          io_tileFilled,
  output wire          io_refreshSettled,
  input  wire          clk,
  input  wire          reset
);

  reg        [31:0]   memPing_spinal_port0;
  reg        [31:0]   memPong_spinal_port0;
  wire                _zz_memPing_port;
  wire                _zz__zz_readDataPing_0_mantissa;
  wire                _zz_memPong_port;
  wire                _zz__zz_readDataPong_0_mantissa;
  wire       [9:0]    _zz_loadCounter_valueNext;
  wire       [0:0]    _zz_loadCounter_valueNext_1;
  wire       [31:0]   _zz_memPing_port_1;
  wire       [31:0]   _zz_memPong_port_1;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 loadBank;
  reg                 computeBank;
  reg                 pingFull;
  reg                 pongFull;
  wire       [2:0]    readDataPing_0_mantissa;
  wire       [3:0]    readDataPing_0_exponent;
  wire                readDataPing_0_sign;
  wire       [2:0]    readDataPing_1_mantissa;
  wire       [3:0]    readDataPing_1_exponent;
  wire                readDataPing_1_sign;
  wire       [2:0]    readDataPing_2_mantissa;
  wire       [3:0]    readDataPing_2_exponent;
  wire                readDataPing_2_sign;
  wire       [2:0]    readDataPing_3_mantissa;
  wire       [3:0]    readDataPing_3_exponent;
  wire                readDataPing_3_sign;
  wire       [31:0]   _zz_readDataPing_0_mantissa;
  wire       [7:0]    _zz_readDataPing_0_mantissa_1;
  wire       [7:0]    _zz_readDataPing_1_mantissa;
  wire       [7:0]    _zz_readDataPing_2_mantissa;
  wire       [7:0]    _zz_readDataPing_3_mantissa;
  wire       [2:0]    readDataPong_0_mantissa;
  wire       [3:0]    readDataPong_0_exponent;
  wire                readDataPong_0_sign;
  wire       [2:0]    readDataPong_1_mantissa;
  wire       [3:0]    readDataPong_1_exponent;
  wire                readDataPong_1_sign;
  wire       [2:0]    readDataPong_2_mantissa;
  wire       [3:0]    readDataPong_2_exponent;
  wire                readDataPong_2_sign;
  wire       [2:0]    readDataPong_3_mantissa;
  wire       [3:0]    readDataPong_3_exponent;
  wire                readDataPong_3_sign;
  wire       [31:0]   _zz_readDataPong_0_mantissa;
  wire       [7:0]    _zz_readDataPong_0_mantissa_1;
  wire       [7:0]    _zz_readDataPong_1_mantissa;
  wire       [7:0]    _zz_readDataPong_2_mantissa;
  wire       [7:0]    _zz_readDataPong_3_mantissa;
  reg                 computeBankDelayed;
  wire                _zz_io_readData_0_mantissa;
  reg                 loadCounter_willIncrement;
  wire                loadCounter_willDecrement;
  reg                 loadCounter_willClear;
  wire                loadCounter_willLoad;
  reg        [9:0]    loadCounter_valueNext;
  reg        [9:0]    loadCounter_value;
  wire                loadCounter_willOverflowIfInc;
  wire                loadCounter_willUnderflowIfDec;
  wire                loadCounter_willOverflow;
  wire                loadCounter_willUnderflow;
  wire                currentLoadBankFull;
  wire                loadDone;
  reg                 tileFilled;
  reg                 switchArmed;
  wire                allowFlip;
  wire                when_StreamDoubleBuffer_l114;
  wire                when_StreamDoubleBuffer_l117;
  wire                when_StreamDoubleBuffer_l123;
  wire                when_StreamDoubleBuffer_l125;
  wire                when_StreamDoubleBuffer_l135;
  wire                when_StreamDoubleBuffer_l137;
  wire                when_StreamDoubleBuffer_l142;
  wire                when_StreamDoubleBuffer_l144;
  reg [31:0] memPing [0:719];
  reg [31:0] memPong [0:719];

  assign _zz_loadCounter_valueNext_1 = loadCounter_willIncrement;
  assign _zz_loadCounter_valueNext = {9'd0, _zz_loadCounter_valueNext_1};
  assign _zz__zz_readDataPing_0_mantissa = 1'b1;
  assign _zz_memPing_port_1 = {{io_streamIn_payload_3_sign,{io_streamIn_payload_3_exponent,io_streamIn_payload_3_mantissa}},{{io_streamIn_payload_2_sign,{io_streamIn_payload_2_exponent,io_streamIn_payload_2_mantissa}},{{io_streamIn_payload_1_sign,{io_streamIn_payload_1_exponent,io_streamIn_payload_1_mantissa}},{io_streamIn_payload_0_sign,{io_streamIn_payload_0_exponent,io_streamIn_payload_0_mantissa}}}}};
  assign _zz__zz_readDataPong_0_mantissa = 1'b1;
  assign _zz_memPong_port_1 = {{io_streamIn_payload_3_sign,{io_streamIn_payload_3_exponent,io_streamIn_payload_3_mantissa}},{{io_streamIn_payload_2_sign,{io_streamIn_payload_2_exponent,io_streamIn_payload_2_mantissa}},{{io_streamIn_payload_1_sign,{io_streamIn_payload_1_exponent,io_streamIn_payload_1_mantissa}},{io_streamIn_payload_0_sign,{io_streamIn_payload_0_exponent,io_streamIn_payload_0_mantissa}}}}};
  always @(posedge clk) begin
    if(_zz__zz_readDataPing_0_mantissa) begin
      memPing_spinal_port0 <= memPing[io_readAddr];
    end
  end

  always @(posedge clk) begin
    if(_zz_2) begin
      memPing[loadCounter_value] <= _zz_memPing_port_1;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_readDataPong_0_mantissa) begin
      memPong_spinal_port0 <= memPong[io_readAddr];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      memPong[loadCounter_value] <= _zz_memPong_port_1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      if(!when_StreamDoubleBuffer_l125) begin
        _zz_1 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      if(when_StreamDoubleBuffer_l125) begin
        _zz_2 = 1'b1;
      end
    end
  end

  assign io_tileReady = ((computeBank == 1'b0) ? pingFull : pongFull);
  assign _zz_readDataPing_0_mantissa = memPing_spinal_port0;
  assign _zz_readDataPing_0_mantissa_1 = _zz_readDataPing_0_mantissa[7 : 0];
  assign readDataPing_0_mantissa = _zz_readDataPing_0_mantissa_1[2 : 0];
  assign readDataPing_0_exponent = _zz_readDataPing_0_mantissa_1[6 : 3];
  assign readDataPing_0_sign = _zz_readDataPing_0_mantissa_1[7];
  assign _zz_readDataPing_1_mantissa = _zz_readDataPing_0_mantissa[15 : 8];
  assign readDataPing_1_mantissa = _zz_readDataPing_1_mantissa[2 : 0];
  assign readDataPing_1_exponent = _zz_readDataPing_1_mantissa[6 : 3];
  assign readDataPing_1_sign = _zz_readDataPing_1_mantissa[7];
  assign _zz_readDataPing_2_mantissa = _zz_readDataPing_0_mantissa[23 : 16];
  assign readDataPing_2_mantissa = _zz_readDataPing_2_mantissa[2 : 0];
  assign readDataPing_2_exponent = _zz_readDataPing_2_mantissa[6 : 3];
  assign readDataPing_2_sign = _zz_readDataPing_2_mantissa[7];
  assign _zz_readDataPing_3_mantissa = _zz_readDataPing_0_mantissa[31 : 24];
  assign readDataPing_3_mantissa = _zz_readDataPing_3_mantissa[2 : 0];
  assign readDataPing_3_exponent = _zz_readDataPing_3_mantissa[6 : 3];
  assign readDataPing_3_sign = _zz_readDataPing_3_mantissa[7];
  assign _zz_readDataPong_0_mantissa = memPong_spinal_port0;
  assign _zz_readDataPong_0_mantissa_1 = _zz_readDataPong_0_mantissa[7 : 0];
  assign readDataPong_0_mantissa = _zz_readDataPong_0_mantissa_1[2 : 0];
  assign readDataPong_0_exponent = _zz_readDataPong_0_mantissa_1[6 : 3];
  assign readDataPong_0_sign = _zz_readDataPong_0_mantissa_1[7];
  assign _zz_readDataPong_1_mantissa = _zz_readDataPong_0_mantissa[15 : 8];
  assign readDataPong_1_mantissa = _zz_readDataPong_1_mantissa[2 : 0];
  assign readDataPong_1_exponent = _zz_readDataPong_1_mantissa[6 : 3];
  assign readDataPong_1_sign = _zz_readDataPong_1_mantissa[7];
  assign _zz_readDataPong_2_mantissa = _zz_readDataPong_0_mantissa[23 : 16];
  assign readDataPong_2_mantissa = _zz_readDataPong_2_mantissa[2 : 0];
  assign readDataPong_2_exponent = _zz_readDataPong_2_mantissa[6 : 3];
  assign readDataPong_2_sign = _zz_readDataPong_2_mantissa[7];
  assign _zz_readDataPong_3_mantissa = _zz_readDataPong_0_mantissa[31 : 24];
  assign readDataPong_3_mantissa = _zz_readDataPong_3_mantissa[2 : 0];
  assign readDataPong_3_exponent = _zz_readDataPong_3_mantissa[6 : 3];
  assign readDataPong_3_sign = _zz_readDataPong_3_mantissa[7];
  assign _zz_io_readData_0_mantissa = (computeBankDelayed == 1'b0);
  assign io_readData_0_mantissa = (_zz_io_readData_0_mantissa ? readDataPing_0_mantissa : readDataPong_0_mantissa);
  assign io_readData_0_exponent = (_zz_io_readData_0_mantissa ? readDataPing_0_exponent : readDataPong_0_exponent);
  assign io_readData_0_sign = (_zz_io_readData_0_mantissa ? readDataPing_0_sign : readDataPong_0_sign);
  assign io_readData_1_mantissa = (_zz_io_readData_0_mantissa ? readDataPing_1_mantissa : readDataPong_1_mantissa);
  assign io_readData_1_exponent = (_zz_io_readData_0_mantissa ? readDataPing_1_exponent : readDataPong_1_exponent);
  assign io_readData_1_sign = (_zz_io_readData_0_mantissa ? readDataPing_1_sign : readDataPong_1_sign);
  assign io_readData_2_mantissa = (_zz_io_readData_0_mantissa ? readDataPing_2_mantissa : readDataPong_2_mantissa);
  assign io_readData_2_exponent = (_zz_io_readData_0_mantissa ? readDataPing_2_exponent : readDataPong_2_exponent);
  assign io_readData_2_sign = (_zz_io_readData_0_mantissa ? readDataPing_2_sign : readDataPong_2_sign);
  assign io_readData_3_mantissa = (_zz_io_readData_0_mantissa ? readDataPing_3_mantissa : readDataPong_3_mantissa);
  assign io_readData_3_exponent = (_zz_io_readData_0_mantissa ? readDataPing_3_exponent : readDataPong_3_exponent);
  assign io_readData_3_sign = (_zz_io_readData_0_mantissa ? readDataPing_3_sign : readDataPong_3_sign);
  always @(*) begin
    loadCounter_willIncrement = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      loadCounter_willIncrement = 1'b1;
    end
  end

  assign loadCounter_willDecrement = 1'b0;
  always @(*) begin
    loadCounter_willClear = 1'b0;
    if(io_reArm) begin
      loadCounter_willClear = 1'b1;
    end
  end

  assign loadCounter_willLoad = 1'b0;
  assign loadCounter_willOverflowIfInc = (loadCounter_value == 10'h2cf);
  assign loadCounter_willUnderflowIfDec = (loadCounter_value == 10'h0);
  assign loadCounter_willOverflow = (loadCounter_willOverflowIfInc && loadCounter_willIncrement);
  always @(*) begin
    loadCounter_valueNext = (loadCounter_value + _zz_loadCounter_valueNext);
    if(loadCounter_willOverflow) begin
      loadCounter_valueNext = 10'h0;
    end
    if(loadCounter_willClear) begin
      loadCounter_valueNext = 10'h0;
    end
  end

  assign loadCounter_willUnderflow = (loadCounter_willUnderflowIfDec && loadCounter_willDecrement);
  assign currentLoadBankFull = ((loadBank == 1'b0) ? pingFull : pongFull);
  assign io_streamIn_ready = (! currentLoadBankFull);
  assign io_loadCanAccept = (! currentLoadBankFull);
  assign loadDone = ((io_streamIn_valid && (! currentLoadBankFull)) && loadCounter_willOverflowIfInc);
  assign io_tileFilled = tileFilled;
  assign allowFlip = ((! io_residentHold) || switchArmed);
  assign when_StreamDoubleBuffer_l114 = (io_stageRequest && tileFilled);
  assign when_StreamDoubleBuffer_l117 = (io_nextTile && allowFlip);
  assign io_refreshSettled = ((io_nextTile && allowFlip) && switchArmed);
  assign when_StreamDoubleBuffer_l123 = (io_streamIn_valid && (! currentLoadBankFull));
  assign when_StreamDoubleBuffer_l125 = (loadBank == 1'b0);
  assign when_StreamDoubleBuffer_l135 = ((io_nextTile && allowFlip) && (computeBank == 1'b0));
  assign when_StreamDoubleBuffer_l137 = (loadDone && (loadBank == 1'b0));
  assign when_StreamDoubleBuffer_l142 = ((io_nextTile && allowFlip) && (computeBank == 1'b1));
  assign when_StreamDoubleBuffer_l144 = (loadDone && (loadBank == 1'b1));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      loadBank <= 1'b0;
      computeBank <= 1'b0;
      pingFull <= 1'b0;
      pongFull <= 1'b0;
      loadCounter_value <= 10'h0;
      tileFilled <= 1'b0;
      switchArmed <= 1'b0;
    end else begin
      loadCounter_value <= loadCounter_valueNext;
      tileFilled <= loadDone;
      if(when_StreamDoubleBuffer_l114) begin
        switchArmed <= 1'b1;
      end
      if(when_StreamDoubleBuffer_l117) begin
        computeBank <= (! computeBank);
        switchArmed <= 1'b0;
      end
      if(when_StreamDoubleBuffer_l135) begin
        pingFull <= 1'b0;
      end else begin
        if(when_StreamDoubleBuffer_l137) begin
          pingFull <= 1'b1;
        end
      end
      if(when_StreamDoubleBuffer_l142) begin
        pongFull <= 1'b0;
      end else begin
        if(when_StreamDoubleBuffer_l144) begin
          pongFull <= 1'b1;
        end
      end
      if(loadDone) begin
        loadBank <= (! loadBank);
      end
      if(io_reArm) begin
        loadBank <= 1'b0;
        computeBank <= 1'b0;
        pingFull <= 1'b0;
        pongFull <= 1'b0;
        switchArmed <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    computeBankDelayed <= computeBank;
  end


endmodule

module DMAReader_3 (
  input  wire          io_cmd_valid,
  output wire          io_cmd_ready,
  input  wire [31:0]   io_cmd_payload_address,
  input  wire [15:0]   io_cmd_payload_length,
  output wire          io_axiMaster_ar_valid,
  input  wire          io_axiMaster_ar_ready,
  output wire [31:0]   io_axiMaster_ar_payload_addr,
  output wire [0:0]    io_axiMaster_ar_payload_id,
  output wire [3:0]    io_axiMaster_ar_payload_region,
  output wire [7:0]    io_axiMaster_ar_payload_len,
  output wire [2:0]    io_axiMaster_ar_payload_size,
  output wire [1:0]    io_axiMaster_ar_payload_burst,
  output wire [0:0]    io_axiMaster_ar_payload_lock,
  output wire [3:0]    io_axiMaster_ar_payload_cache,
  output wire [3:0]    io_axiMaster_ar_payload_qos,
  output wire [2:0]    io_axiMaster_ar_payload_prot,
  input  wire          io_axiMaster_r_valid,
  output wire          io_axiMaster_r_ready,
  input  wire [63:0]   io_axiMaster_r_payload_data,
  input  wire [0:0]    io_axiMaster_r_payload_id,
  input  wire [1:0]    io_axiMaster_r_payload_resp,
  input  wire          io_axiMaster_r_payload_last,
  output wire          io_outStream_stream_valid,
  input  wire          io_outStream_stream_ready,
  output wire [2:0]    io_outStream_stream_payload_0_mantissa,
  output wire [3:0]    io_outStream_stream_payload_0_exponent,
  output wire          io_outStream_stream_payload_0_sign,
  output wire [2:0]    io_outStream_stream_payload_1_mantissa,
  output wire [3:0]    io_outStream_stream_payload_1_exponent,
  output wire          io_outStream_stream_payload_1_sign,
  output wire [2:0]    io_outStream_stream_payload_2_mantissa,
  output wire [3:0]    io_outStream_stream_payload_2_exponent,
  output wire          io_outStream_stream_payload_2_sign,
  output wire [2:0]    io_outStream_stream_payload_3_mantissa,
  output wire [3:0]    io_outStream_stream_payload_3_exponent,
  output wire          io_outStream_stream_payload_3_sign,
  input  wire          clk,
  input  wire          reset
);

  wire                repackOp_8_io_c_stream_ready;
  wire                repackOp_8_io_a_stream_ready;
  wire                repackOp_8_io_c_stream_valid;
  wire       [2:0]    repackOp_8_io_c_stream_payload_0_mantissa;
  wire       [3:0]    repackOp_8_io_c_stream_payload_0_exponent;
  wire                repackOp_8_io_c_stream_payload_0_sign;
  wire       [2:0]    repackOp_8_io_c_stream_payload_1_mantissa;
  wire       [3:0]    repackOp_8_io_c_stream_payload_1_exponent;
  wire                repackOp_8_io_c_stream_payload_1_sign;
  wire       [2:0]    repackOp_8_io_c_stream_payload_2_mantissa;
  wire       [3:0]    repackOp_8_io_c_stream_payload_2_exponent;
  wire                repackOp_8_io_c_stream_payload_2_sign;
  wire       [2:0]    repackOp_8_io_c_stream_payload_3_mantissa;
  wire       [3:0]    repackOp_8_io_c_stream_payload_3_exponent;
  wire                repackOp_8_io_c_stream_payload_3_sign;
  wire                repackOp_8_io_isEmpty;
  wire       [16:0]   _zz_remaining;
  wire       [1:0]    _zz_remaining_1;
  wire       [12:0]   _zz_bytesToBoundary;
  wire       [9:0]    _zz_beatsToBoundary;
  wire       [15:0]   _zz__zz_burstLen_3;
  wire       [15:0]   _zz__zz_burstLen_3_1;
  wire       [15:0]   _zz__zz_burstLen_3_2;
  wire       [16:0]   _zz_io_axiMaster_ar_payload_len;
  wire       [31:0]   _zz_addrReg;
  wire       [19:0]   _zz_addrReg_1;
  reg        [16:0]   remaining;
  reg        [8:0]    burstRemain;
  reg        [31:0]   addrReg;
  wire                baseReady;
  wire                gearboxEmpty;
  wire                io_cmd_fire;
  wire       [11:0]   offsetInPage;
  wire       [12:0]   bytesToBoundary;
  wire       [15:0]   beatsToBoundary;
  wire       [16:0]   _zz_burstLen;
  wire       [16:0]   _zz_burstLen_1;
  wire       [0:0]    _zz_burstLen_2;
  wire       [16:0]   _zz_burstLen_3;
  wire       [16:0]   burstLen;
  wire                io_axiMaster_ar_fire;
  wire                axiRawTensor_stream_valid;
  wire                axiRawTensor_stream_ready;
  wire       [2:0]    axiRawTensor_stream_payload_0_mantissa;
  wire       [3:0]    axiRawTensor_stream_payload_0_exponent;
  wire                axiRawTensor_stream_payload_0_sign;
  wire       [2:0]    axiRawTensor_stream_payload_1_mantissa;
  wire       [3:0]    axiRawTensor_stream_payload_1_exponent;
  wire                axiRawTensor_stream_payload_1_sign;
  wire       [2:0]    axiRawTensor_stream_payload_2_mantissa;
  wire       [3:0]    axiRawTensor_stream_payload_2_exponent;
  wire                axiRawTensor_stream_payload_2_sign;
  wire       [2:0]    axiRawTensor_stream_payload_3_mantissa;
  wire       [3:0]    axiRawTensor_stream_payload_3_exponent;
  wire                axiRawTensor_stream_payload_3_sign;
  wire       [2:0]    axiRawTensor_stream_payload_4_mantissa;
  wire       [3:0]    axiRawTensor_stream_payload_4_exponent;
  wire                axiRawTensor_stream_payload_4_sign;
  wire       [2:0]    axiRawTensor_stream_payload_5_mantissa;
  wire       [3:0]    axiRawTensor_stream_payload_5_exponent;
  wire                axiRawTensor_stream_payload_5_sign;
  wire       [2:0]    axiRawTensor_stream_payload_6_mantissa;
  wire       [3:0]    axiRawTensor_stream_payload_6_exponent;
  wire                axiRawTensor_stream_payload_6_sign;
  wire       [2:0]    axiRawTensor_stream_payload_7_mantissa;
  wire       [3:0]    axiRawTensor_stream_payload_7_exponent;
  wire                axiRawTensor_stream_payload_7_sign;
  wire                when_DMAReader_l115;
  wire       [7:0]    _zz_axiRawTensor_stream_payload_0_mantissa;
  wire       [7:0]    _zz_axiRawTensor_stream_payload_1_mantissa;
  wire       [7:0]    _zz_axiRawTensor_stream_payload_2_mantissa;
  wire       [7:0]    _zz_axiRawTensor_stream_payload_3_mantissa;
  wire       [7:0]    _zz_axiRawTensor_stream_payload_4_mantissa;
  wire       [7:0]    _zz_axiRawTensor_stream_payload_5_mantissa;
  wire       [7:0]    _zz_axiRawTensor_stream_payload_6_mantissa;
  wire       [7:0]    _zz_axiRawTensor_stream_payload_7_mantissa;
  reg        [11:0]   _zz_trimmedStream_stream_valid;
  wire                _zz_trimmedStream_stream_valid_1;
  wire                trimmedStream_stream_valid;
  wire                trimmedStream_stream_ready;
  wire       [2:0]    trimmedStream_stream_payload_0_mantissa;
  wire       [3:0]    trimmedStream_stream_payload_0_exponent;
  wire                trimmedStream_stream_payload_0_sign;
  wire       [2:0]    trimmedStream_stream_payload_1_mantissa;
  wire       [3:0]    trimmedStream_stream_payload_1_exponent;
  wire                trimmedStream_stream_payload_1_sign;
  wire       [2:0]    trimmedStream_stream_payload_2_mantissa;
  wire       [3:0]    trimmedStream_stream_payload_2_exponent;
  wire                trimmedStream_stream_payload_2_sign;
  wire       [2:0]    trimmedStream_stream_payload_3_mantissa;
  wire       [3:0]    trimmedStream_stream_payload_3_exponent;
  wire                trimmedStream_stream_payload_3_sign;
  wire                trimmedStream_stream_fire;

  assign _zz_remaining_1 = {1'b0,1'b1};
  assign _zz_remaining = {15'd0, _zz_remaining_1};
  assign _zz_bytesToBoundary = {1'd0, offsetInPage};
  assign _zz_beatsToBoundary = (bytesToBoundary >>> 2'd3);
  assign _zz__zz_burstLen_3 = ((beatsToBoundary < _zz__zz_burstLen_3_1) ? _zz__zz_burstLen_3_2 : beatsToBoundary);
  assign _zz__zz_burstLen_3_1 = {15'd0, _zz_burstLen_2};
  assign _zz__zz_burstLen_3_2 = {15'd0, _zz_burstLen_2};
  assign _zz_io_axiMaster_ar_payload_len = (burstLen - 17'h00001);
  assign _zz_addrReg_1 = ({3'd0,burstLen} <<< 2'd3);
  assign _zz_addrReg = {12'd0, _zz_addrReg_1};
  RepackOp_4 repackOp_8 (
    .io_a_stream_valid              (axiRawTensor_stream_valid                     ), //i
    .io_a_stream_ready              (repackOp_8_io_a_stream_ready                  ), //o
    .io_a_stream_payload_0_mantissa (axiRawTensor_stream_payload_0_mantissa[2:0]   ), //i
    .io_a_stream_payload_0_exponent (axiRawTensor_stream_payload_0_exponent[3:0]   ), //i
    .io_a_stream_payload_0_sign     (axiRawTensor_stream_payload_0_sign            ), //i
    .io_a_stream_payload_1_mantissa (axiRawTensor_stream_payload_1_mantissa[2:0]   ), //i
    .io_a_stream_payload_1_exponent (axiRawTensor_stream_payload_1_exponent[3:0]   ), //i
    .io_a_stream_payload_1_sign     (axiRawTensor_stream_payload_1_sign            ), //i
    .io_a_stream_payload_2_mantissa (axiRawTensor_stream_payload_2_mantissa[2:0]   ), //i
    .io_a_stream_payload_2_exponent (axiRawTensor_stream_payload_2_exponent[3:0]   ), //i
    .io_a_stream_payload_2_sign     (axiRawTensor_stream_payload_2_sign            ), //i
    .io_a_stream_payload_3_mantissa (axiRawTensor_stream_payload_3_mantissa[2:0]   ), //i
    .io_a_stream_payload_3_exponent (axiRawTensor_stream_payload_3_exponent[3:0]   ), //i
    .io_a_stream_payload_3_sign     (axiRawTensor_stream_payload_3_sign            ), //i
    .io_a_stream_payload_4_mantissa (axiRawTensor_stream_payload_4_mantissa[2:0]   ), //i
    .io_a_stream_payload_4_exponent (axiRawTensor_stream_payload_4_exponent[3:0]   ), //i
    .io_a_stream_payload_4_sign     (axiRawTensor_stream_payload_4_sign            ), //i
    .io_a_stream_payload_5_mantissa (axiRawTensor_stream_payload_5_mantissa[2:0]   ), //i
    .io_a_stream_payload_5_exponent (axiRawTensor_stream_payload_5_exponent[3:0]   ), //i
    .io_a_stream_payload_5_sign     (axiRawTensor_stream_payload_5_sign            ), //i
    .io_a_stream_payload_6_mantissa (axiRawTensor_stream_payload_6_mantissa[2:0]   ), //i
    .io_a_stream_payload_6_exponent (axiRawTensor_stream_payload_6_exponent[3:0]   ), //i
    .io_a_stream_payload_6_sign     (axiRawTensor_stream_payload_6_sign            ), //i
    .io_a_stream_payload_7_mantissa (axiRawTensor_stream_payload_7_mantissa[2:0]   ), //i
    .io_a_stream_payload_7_exponent (axiRawTensor_stream_payload_7_exponent[3:0]   ), //i
    .io_a_stream_payload_7_sign     (axiRawTensor_stream_payload_7_sign            ), //i
    .io_c_stream_valid              (repackOp_8_io_c_stream_valid                  ), //o
    .io_c_stream_ready              (repackOp_8_io_c_stream_ready                  ), //i
    .io_c_stream_payload_0_mantissa (repackOp_8_io_c_stream_payload_0_mantissa[2:0]), //o
    .io_c_stream_payload_0_exponent (repackOp_8_io_c_stream_payload_0_exponent[3:0]), //o
    .io_c_stream_payload_0_sign     (repackOp_8_io_c_stream_payload_0_sign         ), //o
    .io_c_stream_payload_1_mantissa (repackOp_8_io_c_stream_payload_1_mantissa[2:0]), //o
    .io_c_stream_payload_1_exponent (repackOp_8_io_c_stream_payload_1_exponent[3:0]), //o
    .io_c_stream_payload_1_sign     (repackOp_8_io_c_stream_payload_1_sign         ), //o
    .io_c_stream_payload_2_mantissa (repackOp_8_io_c_stream_payload_2_mantissa[2:0]), //o
    .io_c_stream_payload_2_exponent (repackOp_8_io_c_stream_payload_2_exponent[3:0]), //o
    .io_c_stream_payload_2_sign     (repackOp_8_io_c_stream_payload_2_sign         ), //o
    .io_c_stream_payload_3_mantissa (repackOp_8_io_c_stream_payload_3_mantissa[2:0]), //o
    .io_c_stream_payload_3_exponent (repackOp_8_io_c_stream_payload_3_exponent[3:0]), //o
    .io_c_stream_payload_3_sign     (repackOp_8_io_c_stream_payload_3_sign         ), //o
    .io_reArm                       (io_cmd_fire                                   ), //i
    .io_isEmpty                     (repackOp_8_io_isEmpty                         ), //o
    .clk                            (clk                                           ), //i
    .reset                          (reset                                         )  //i
  );
  assign baseReady = ((remaining == 17'h0) && (burstRemain == 9'h0));
  assign io_cmd_ready = (baseReady && gearboxEmpty);
  assign io_cmd_fire = (io_cmd_valid && io_cmd_ready);
  assign offsetInPage = addrReg[11 : 0];
  assign bytesToBoundary = (13'h1000 - _zz_bytesToBoundary);
  assign beatsToBoundary = {6'd0, _zz_beatsToBoundary};
  assign _zz_burstLen = 17'h00100;
  assign _zz_burstLen_1 = ((remaining < _zz_burstLen) ? remaining : _zz_burstLen);
  assign _zz_burstLen_2 = 1'b1;
  assign _zz_burstLen_3 = {1'd0, _zz__zz_burstLen_3};
  assign burstLen = ((_zz_burstLen_1 < _zz_burstLen_3) ? _zz_burstLen_1 : _zz_burstLen_3);
  assign io_axiMaster_ar_valid = ((remaining != 17'h0) && (burstRemain == 9'h0));
  assign io_axiMaster_ar_payload_addr = addrReg;
  assign io_axiMaster_ar_payload_len = _zz_io_axiMaster_ar_payload_len[7:0];
  assign io_axiMaster_ar_payload_size = 3'b011;
  assign io_axiMaster_ar_payload_burst = 2'b01;
  assign io_axiMaster_ar_fire = (io_axiMaster_ar_valid && io_axiMaster_ar_ready);
  assign io_axiMaster_ar_payload_id = 1'b0;
  assign io_axiMaster_ar_payload_prot = 3'b000;
  assign io_axiMaster_ar_payload_cache = 4'b0000;
  assign io_axiMaster_ar_payload_lock = 1'b0;
  assign io_axiMaster_ar_payload_qos = 4'b0000;
  assign io_axiMaster_ar_payload_region = 4'b0000;
  assign axiRawTensor_stream_valid = (io_axiMaster_r_valid && (burstRemain != 9'h0));
  assign io_axiMaster_r_ready = axiRawTensor_stream_ready;
  assign when_DMAReader_l115 = (io_axiMaster_r_valid && io_axiMaster_r_ready);
  assign _zz_axiRawTensor_stream_payload_0_mantissa = io_axiMaster_r_payload_data[7 : 0];
  assign axiRawTensor_stream_payload_0_mantissa = _zz_axiRawTensor_stream_payload_0_mantissa[2 : 0];
  assign axiRawTensor_stream_payload_0_exponent = _zz_axiRawTensor_stream_payload_0_mantissa[6 : 3];
  assign axiRawTensor_stream_payload_0_sign = _zz_axiRawTensor_stream_payload_0_mantissa[7];
  assign _zz_axiRawTensor_stream_payload_1_mantissa = io_axiMaster_r_payload_data[15 : 8];
  assign axiRawTensor_stream_payload_1_mantissa = _zz_axiRawTensor_stream_payload_1_mantissa[2 : 0];
  assign axiRawTensor_stream_payload_1_exponent = _zz_axiRawTensor_stream_payload_1_mantissa[6 : 3];
  assign axiRawTensor_stream_payload_1_sign = _zz_axiRawTensor_stream_payload_1_mantissa[7];
  assign _zz_axiRawTensor_stream_payload_2_mantissa = io_axiMaster_r_payload_data[23 : 16];
  assign axiRawTensor_stream_payload_2_mantissa = _zz_axiRawTensor_stream_payload_2_mantissa[2 : 0];
  assign axiRawTensor_stream_payload_2_exponent = _zz_axiRawTensor_stream_payload_2_mantissa[6 : 3];
  assign axiRawTensor_stream_payload_2_sign = _zz_axiRawTensor_stream_payload_2_mantissa[7];
  assign _zz_axiRawTensor_stream_payload_3_mantissa = io_axiMaster_r_payload_data[31 : 24];
  assign axiRawTensor_stream_payload_3_mantissa = _zz_axiRawTensor_stream_payload_3_mantissa[2 : 0];
  assign axiRawTensor_stream_payload_3_exponent = _zz_axiRawTensor_stream_payload_3_mantissa[6 : 3];
  assign axiRawTensor_stream_payload_3_sign = _zz_axiRawTensor_stream_payload_3_mantissa[7];
  assign _zz_axiRawTensor_stream_payload_4_mantissa = io_axiMaster_r_payload_data[39 : 32];
  assign axiRawTensor_stream_payload_4_mantissa = _zz_axiRawTensor_stream_payload_4_mantissa[2 : 0];
  assign axiRawTensor_stream_payload_4_exponent = _zz_axiRawTensor_stream_payload_4_mantissa[6 : 3];
  assign axiRawTensor_stream_payload_4_sign = _zz_axiRawTensor_stream_payload_4_mantissa[7];
  assign _zz_axiRawTensor_stream_payload_5_mantissa = io_axiMaster_r_payload_data[47 : 40];
  assign axiRawTensor_stream_payload_5_mantissa = _zz_axiRawTensor_stream_payload_5_mantissa[2 : 0];
  assign axiRawTensor_stream_payload_5_exponent = _zz_axiRawTensor_stream_payload_5_mantissa[6 : 3];
  assign axiRawTensor_stream_payload_5_sign = _zz_axiRawTensor_stream_payload_5_mantissa[7];
  assign _zz_axiRawTensor_stream_payload_6_mantissa = io_axiMaster_r_payload_data[55 : 48];
  assign axiRawTensor_stream_payload_6_mantissa = _zz_axiRawTensor_stream_payload_6_mantissa[2 : 0];
  assign axiRawTensor_stream_payload_6_exponent = _zz_axiRawTensor_stream_payload_6_mantissa[6 : 3];
  assign axiRawTensor_stream_payload_6_sign = _zz_axiRawTensor_stream_payload_6_mantissa[7];
  assign _zz_axiRawTensor_stream_payload_7_mantissa = io_axiMaster_r_payload_data[63 : 56];
  assign axiRawTensor_stream_payload_7_mantissa = _zz_axiRawTensor_stream_payload_7_mantissa[2 : 0];
  assign axiRawTensor_stream_payload_7_exponent = _zz_axiRawTensor_stream_payload_7_mantissa[6 : 3];
  assign axiRawTensor_stream_payload_7_sign = _zz_axiRawTensor_stream_payload_7_mantissa[7];
  assign axiRawTensor_stream_ready = repackOp_8_io_a_stream_ready;
  assign gearboxEmpty = repackOp_8_io_isEmpty;
  assign _zz_trimmedStream_stream_valid_1 = (12'hb40 <= _zz_trimmedStream_stream_valid);
  assign trimmedStream_stream_valid = (repackOp_8_io_c_stream_valid && (! _zz_trimmedStream_stream_valid_1));
  assign repackOp_8_io_c_stream_ready = (io_outStream_stream_ready || _zz_trimmedStream_stream_valid_1);
  assign trimmedStream_stream_fire = (trimmedStream_stream_valid && trimmedStream_stream_ready);
  assign trimmedStream_stream_payload_0_mantissa = repackOp_8_io_c_stream_payload_0_mantissa;
  assign trimmedStream_stream_payload_0_exponent = repackOp_8_io_c_stream_payload_0_exponent;
  assign trimmedStream_stream_payload_0_sign = repackOp_8_io_c_stream_payload_0_sign;
  assign trimmedStream_stream_payload_1_mantissa = repackOp_8_io_c_stream_payload_1_mantissa;
  assign trimmedStream_stream_payload_1_exponent = repackOp_8_io_c_stream_payload_1_exponent;
  assign trimmedStream_stream_payload_1_sign = repackOp_8_io_c_stream_payload_1_sign;
  assign trimmedStream_stream_payload_2_mantissa = repackOp_8_io_c_stream_payload_2_mantissa;
  assign trimmedStream_stream_payload_2_exponent = repackOp_8_io_c_stream_payload_2_exponent;
  assign trimmedStream_stream_payload_2_sign = repackOp_8_io_c_stream_payload_2_sign;
  assign trimmedStream_stream_payload_3_mantissa = repackOp_8_io_c_stream_payload_3_mantissa;
  assign trimmedStream_stream_payload_3_exponent = repackOp_8_io_c_stream_payload_3_exponent;
  assign trimmedStream_stream_payload_3_sign = repackOp_8_io_c_stream_payload_3_sign;
  assign io_outStream_stream_valid = trimmedStream_stream_valid;
  assign trimmedStream_stream_ready = io_outStream_stream_ready;
  assign io_outStream_stream_payload_0_mantissa = trimmedStream_stream_payload_0_mantissa;
  assign io_outStream_stream_payload_0_exponent = trimmedStream_stream_payload_0_exponent;
  assign io_outStream_stream_payload_0_sign = trimmedStream_stream_payload_0_sign;
  assign io_outStream_stream_payload_1_mantissa = trimmedStream_stream_payload_1_mantissa;
  assign io_outStream_stream_payload_1_exponent = trimmedStream_stream_payload_1_exponent;
  assign io_outStream_stream_payload_1_sign = trimmedStream_stream_payload_1_sign;
  assign io_outStream_stream_payload_2_mantissa = trimmedStream_stream_payload_2_mantissa;
  assign io_outStream_stream_payload_2_exponent = trimmedStream_stream_payload_2_exponent;
  assign io_outStream_stream_payload_2_sign = trimmedStream_stream_payload_2_sign;
  assign io_outStream_stream_payload_3_mantissa = trimmedStream_stream_payload_3_mantissa;
  assign io_outStream_stream_payload_3_exponent = trimmedStream_stream_payload_3_exponent;
  assign io_outStream_stream_payload_3_sign = trimmedStream_stream_payload_3_sign;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      remaining <= 17'h0;
      burstRemain <= 9'h0;
      addrReg <= 32'h0;
      _zz_trimmedStream_stream_valid <= 12'h0;
    end else begin
      if(io_cmd_fire) begin
        addrReg <= io_cmd_payload_address;
        remaining <= ({1'b0,io_cmd_payload_length} + _zz_remaining);
      end
      if(io_axiMaster_ar_fire) begin
        addrReg <= (addrReg + _zz_addrReg);
        remaining <= (remaining - burstLen);
        burstRemain <= burstLen[8:0];
      end
      if(when_DMAReader_l115) begin
        burstRemain <= (burstRemain - 9'h001);
      end
      if(io_cmd_fire) begin
        _zz_trimmedStream_stream_valid <= 12'h0;
      end
      if(trimmedStream_stream_fire) begin
        _zz_trimmedStream_stream_valid <= (_zz_trimmedStream_stream_valid + 12'h004);
      end
    end
  end


endmodule

module CastOp_1 (
  input  wire          io_a_stream_valid,
  output wire          io_a_stream_ready,
  input  wire [15:0]   io_a_stream_payload_0,
  output wire          io_c_stream_valid,
  input  wire          io_c_stream_ready,
  output wire [2:0]    io_c_stream_payload_0_mantissa,
  output wire [3:0]    io_c_stream_payload_0_exponent,
  output wire          io_c_stream_payload_0_sign
);

  wire       [15:0]   _zz__zz_when_Float_l314;
  wire       [15:0]   _zz__zz_when_Float_l314_1;
  wire       [15:0]   _zz__zz_when_Float_l314_2;
  wire       [0:0]    _zz__zz_when_Float_l314_3;
  wire                _zz__zz_when_Float_l318_1;
  wire       [0:0]    _zz__zz_when_Float_l318_1_1;
  wire       [6:0]    _zz__zz_when_Float_l318_1_2;
  wire       [15:0]   _zz__zz_when_Float_l318_2;
  wire       [5:0]    _zz__zz_when_Float_l318_19;
  wire       [5:0]    _zz__zz_when_Float_l318_19_1;
  wire       [4:0]    _zz__zz_when_Float_l318_19_2;
  wire       [5:0]    _zz__zz_when_Float_l65;
  wire       [30:0]   _zz__zz_io_c_stream_payload_0_mantissa;
  wire       [3:0]    _zz__zz_io_c_stream_payload_0_mantissa_4;
  wire       [1:0]    _zz__zz_io_c_stream_payload_0_mantissa_4_1;
  wire       [6:0]    _zz__zz_when_Float_l65_4;
  wire       [6:0]    _zz__zz_when_Float_l65_4_1;
  wire       [6:0]    _zz__zz_when_Float_l65_4_2;
  wire       [6:0]    _zz__zz_when_Float_l65_4_3;
  wire       [4:0]    _zz__zz_when_Float_l65_4_4;
  wire       [6:0]    _zz__zz_when_Float_l65_4_5;
  wire       [4:0]    _zz__zz_when_Float_l65_4_6;
  wire       [6:0]    _zz__zz_when_Float_l65_4_7;
  wire       [1:0]    _zz__zz_when_Float_l65_4_8;
  wire       [6:0]    _zz__zz_when_Float_l65_4_9;
  wire       [1:0]    _zz__zz_when_Float_l65_4_10;
  wire       [6:0]    _zz__zz_io_c_stream_payload_0_exponent;
  wire       [2:0]    scaleHw_mantissa;
  wire       [3:0]    scaleHw_exponent;
  wire                scaleHw_sign;
  reg        [2:0]    _zz_io_c_stream_payload_0_mantissa;
  reg        [3:0]    _zz_when_Float_l65;
  reg                 _zz_io_c_stream_payload_0_sign;
  wire       [15:0]   _zz_when_Float_l314;
  wire                when_Float_l314;
  wire       [15:0]   _zz_when_Float_l318;
  wire       [15:0]   _zz_when_Float_l318_1;
  wire       [15:0]   _zz_when_Float_l318_2;
  wire                _zz_when_Float_l318_3;
  wire                _zz_when_Float_l318_4;
  wire                _zz_when_Float_l318_5;
  wire                _zz_when_Float_l318_6;
  wire                _zz_when_Float_l318_7;
  wire                _zz_when_Float_l318_8;
  wire                _zz_when_Float_l318_9;
  wire                _zz_when_Float_l318_10;
  wire                _zz_when_Float_l318_11;
  wire                _zz_when_Float_l318_12;
  wire                _zz_when_Float_l318_13;
  wire                _zz_when_Float_l318_14;
  wire                _zz_when_Float_l318_15;
  wire                _zz_when_Float_l318_16;
  wire                _zz_when_Float_l318_17;
  wire       [3:0]    _zz_when_Float_l318_18;
  wire       [5:0]    _zz_when_Float_l318_19;
  wire                when_Float_l318;
  reg        [2:0]    _zz_io_c_stream_payload_0_mantissa_1;
  reg        [3:0]    _zz_io_c_stream_payload_0_exponent;
  reg                 _zz_io_c_stream_payload_0_sign_1;
  wire                _zz_when_Float_l65_1;
  wire                _zz_when_Float_l65_2;
  wire       [7:0]    _zz_io_c_stream_payload_0_mantissa_2;
  wire                _zz_when_Float_l65_3;
  wire       [2:0]    _zz_io_c_stream_payload_0_mantissa_3;
  wire       [3:0]    _zz_io_c_stream_payload_0_mantissa_4;
  wire                _zz_io_c_stream_payload_0_mantissa_5;
  wire       [6:0]    _zz_when_Float_l65_4;
  wire                when_Float_l65;
  wire                when_Float_l70;

  assign _zz__zz_when_Float_l314 = (io_a_stream_payload_0[15] ? _zz__zz_when_Float_l314_1 : io_a_stream_payload_0);
  assign _zz__zz_when_Float_l314_1 = (~ io_a_stream_payload_0);
  assign _zz__zz_when_Float_l314_3 = io_a_stream_payload_0[15];
  assign _zz__zz_when_Float_l314_2 = {15'd0, _zz__zz_when_Float_l314_3};
  assign _zz__zz_when_Float_l318_2 = (_zz_when_Float_l318_1 - 16'h0001);
  assign _zz__zz_when_Float_l318_19 = ($signed(6'h0f) - $signed(_zz__zz_when_Float_l318_19_1));
  assign _zz__zz_when_Float_l318_19_2 = {1'b0,_zz_when_Float_l318_18};
  assign _zz__zz_when_Float_l318_19_1 = {{1{_zz__zz_when_Float_l318_19_2[4]}}, _zz__zz_when_Float_l318_19_2};
  assign _zz__zz_when_Float_l65 = _zz_when_Float_l318_19;
  assign _zz__zz_io_c_stream_payload_0_mantissa = ({15'd0,_zz_when_Float_l314} <<< _zz_when_Float_l318_18);
  assign _zz__zz_io_c_stream_payload_0_mantissa_4_1 = {1'b0,((_zz_when_Float_l65_3 ? _zz_io_c_stream_payload_0_mantissa_2[3] : _zz_io_c_stream_payload_0_mantissa_2[2]) && ((_zz_when_Float_l65_3 ? (_zz_io_c_stream_payload_0_mantissa_2[2 : 0] != 3'b000) : (_zz_io_c_stream_payload_0_mantissa_2[1 : 0] != 2'b00)) || _zz_io_c_stream_payload_0_mantissa_3[0]))};
  assign _zz__zz_io_c_stream_payload_0_mantissa_4 = {2'd0, _zz__zz_io_c_stream_payload_0_mantissa_4_1};
  assign _zz__zz_when_Float_l65_4 = ($signed(_zz__zz_when_Float_l65_4_1) + $signed(_zz__zz_when_Float_l65_4_7));
  assign _zz__zz_when_Float_l65_4_1 = ($signed(_zz__zz_when_Float_l65_4_2) - $signed(7'h07));
  assign _zz__zz_when_Float_l65_4_2 = ($signed(_zz__zz_when_Float_l65_4_3) + $signed(_zz__zz_when_Float_l65_4_5));
  assign _zz__zz_when_Float_l65_4_4 = {1'b0,_zz_when_Float_l65};
  assign _zz__zz_when_Float_l65_4_3 = {{2{_zz__zz_when_Float_l65_4_4[4]}}, _zz__zz_when_Float_l65_4_4};
  assign _zz__zz_when_Float_l65_4_6 = {1'b0,scaleHw_exponent};
  assign _zz__zz_when_Float_l65_4_5 = {{2{_zz__zz_when_Float_l65_4_6[4]}}, _zz__zz_when_Float_l65_4_6};
  assign _zz__zz_when_Float_l65_4_8 = {1'b0,_zz_when_Float_l65_3};
  assign _zz__zz_when_Float_l65_4_7 = {{5{_zz__zz_when_Float_l65_4_8[1]}}, _zz__zz_when_Float_l65_4_8};
  assign _zz__zz_when_Float_l65_4_10 = {1'b0,_zz_io_c_stream_payload_0_mantissa_5};
  assign _zz__zz_when_Float_l65_4_9 = {{5{_zz__zz_when_Float_l65_4_10[1]}}, _zz__zz_when_Float_l65_4_10};
  assign _zz__zz_io_c_stream_payload_0_exponent = _zz_when_Float_l65_4;
  assign _zz__zz_when_Float_l318_1 = _zz_when_Float_l318[7];
  assign _zz__zz_when_Float_l318_1_1 = _zz_when_Float_l318[8];
  assign _zz__zz_when_Float_l318_1_2 = {_zz_when_Float_l318[9],{_zz_when_Float_l318[10],{_zz_when_Float_l318[11],{_zz_when_Float_l318[12],{_zz_when_Float_l318[13],{_zz_when_Float_l318[14],_zz_when_Float_l318[15]}}}}}};
  assign io_c_stream_valid = io_a_stream_valid;
  assign io_a_stream_ready = io_c_stream_ready;
  assign scaleHw_sign = 1'b0;
  assign scaleHw_exponent = 4'b0011;
  assign scaleHw_mantissa = 3'b011;
  always @(*) begin
    _zz_io_c_stream_payload_0_sign = ($signed(io_a_stream_payload_0) < $signed(16'h0));
    if(when_Float_l314) begin
      _zz_io_c_stream_payload_0_sign = 1'b0;
    end
  end

  assign _zz_when_Float_l314 = (_zz__zz_when_Float_l314 + _zz__zz_when_Float_l314_2);
  assign when_Float_l314 = (_zz_when_Float_l314 == 16'h0);
  assign _zz_when_Float_l318 = _zz_when_Float_l314;
  assign _zz_when_Float_l318_1 = {_zz_when_Float_l318[0],{_zz_when_Float_l318[1],{_zz_when_Float_l318[2],{_zz_when_Float_l318[3],{_zz_when_Float_l318[4],{_zz_when_Float_l318[5],{_zz_when_Float_l318[6],{_zz__zz_when_Float_l318_1,{_zz__zz_when_Float_l318_1_1,_zz__zz_when_Float_l318_1_2}}}}}}}}};
  assign _zz_when_Float_l318_2 = (_zz_when_Float_l318_1 & (~ _zz__zz_when_Float_l318_2));
  assign _zz_when_Float_l318_3 = _zz_when_Float_l318_2[3];
  assign _zz_when_Float_l318_4 = _zz_when_Float_l318_2[5];
  assign _zz_when_Float_l318_5 = _zz_when_Float_l318_2[6];
  assign _zz_when_Float_l318_6 = _zz_when_Float_l318_2[7];
  assign _zz_when_Float_l318_7 = _zz_when_Float_l318_2[9];
  assign _zz_when_Float_l318_8 = _zz_when_Float_l318_2[10];
  assign _zz_when_Float_l318_9 = _zz_when_Float_l318_2[11];
  assign _zz_when_Float_l318_10 = _zz_when_Float_l318_2[12];
  assign _zz_when_Float_l318_11 = _zz_when_Float_l318_2[13];
  assign _zz_when_Float_l318_12 = _zz_when_Float_l318_2[14];
  assign _zz_when_Float_l318_13 = _zz_when_Float_l318_2[15];
  assign _zz_when_Float_l318_14 = (((((((_zz_when_Float_l318_2[1] || _zz_when_Float_l318_3) || _zz_when_Float_l318_4) || _zz_when_Float_l318_6) || _zz_when_Float_l318_7) || _zz_when_Float_l318_9) || _zz_when_Float_l318_11) || _zz_when_Float_l318_13);
  assign _zz_when_Float_l318_15 = (((((((_zz_when_Float_l318_2[2] || _zz_when_Float_l318_3) || _zz_when_Float_l318_5) || _zz_when_Float_l318_6) || _zz_when_Float_l318_8) || _zz_when_Float_l318_9) || _zz_when_Float_l318_12) || _zz_when_Float_l318_13);
  assign _zz_when_Float_l318_16 = (((((((_zz_when_Float_l318_2[4] || _zz_when_Float_l318_4) || _zz_when_Float_l318_5) || _zz_when_Float_l318_6) || _zz_when_Float_l318_10) || _zz_when_Float_l318_11) || _zz_when_Float_l318_12) || _zz_when_Float_l318_13);
  assign _zz_when_Float_l318_17 = (((((((_zz_when_Float_l318_2[8] || _zz_when_Float_l318_7) || _zz_when_Float_l318_8) || _zz_when_Float_l318_9) || _zz_when_Float_l318_10) || _zz_when_Float_l318_11) || _zz_when_Float_l318_12) || _zz_when_Float_l318_13);
  assign _zz_when_Float_l318_18 = {_zz_when_Float_l318_17,{_zz_when_Float_l318_16,{_zz_when_Float_l318_15,_zz_when_Float_l318_14}}};
  assign _zz_when_Float_l318_19 = ($signed(6'h07) + $signed(_zz__zz_when_Float_l318_19));
  always @(*) begin
    if(when_Float_l314) begin
      _zz_when_Float_l65 = 4'b0000;
    end else begin
      if(when_Float_l318) begin
        _zz_when_Float_l65 = 4'b1111;
      end else begin
        _zz_when_Float_l65 = _zz__zz_when_Float_l65[3:0];
      end
    end
  end

  always @(*) begin
    if(when_Float_l314) begin
      _zz_io_c_stream_payload_0_mantissa = 3'b000;
    end else begin
      if(when_Float_l318) begin
        _zz_io_c_stream_payload_0_mantissa = 3'b000;
      end else begin
        _zz_io_c_stream_payload_0_mantissa = _zz__zz_io_c_stream_payload_0_mantissa[14 : 12];
      end
    end
  end

  assign when_Float_l318 = ($signed(6'h0f) <= $signed(_zz_when_Float_l318_19));
  always @(*) begin
    _zz_io_c_stream_payload_0_sign_1 = (_zz_io_c_stream_payload_0_sign ^ scaleHw_sign);
    if(when_Float_l65) begin
      _zz_io_c_stream_payload_0_sign_1 = 1'b0;
    end
  end

  assign _zz_when_Float_l65_1 = (_zz_when_Float_l65 == 4'b0000);
  assign _zz_when_Float_l65_2 = (scaleHw_exponent == 4'b0000);
  assign _zz_io_c_stream_payload_0_mantissa_2 = ((_zz_when_Float_l65_1 ? 4'b0000 : {1'b1,_zz_io_c_stream_payload_0_mantissa}) * (_zz_when_Float_l65_2 ? 4'b0000 : {1'b1,scaleHw_mantissa}));
  assign _zz_when_Float_l65_3 = _zz_io_c_stream_payload_0_mantissa_2[7];
  assign _zz_io_c_stream_payload_0_mantissa_3 = (_zz_when_Float_l65_3 ? _zz_io_c_stream_payload_0_mantissa_2[6 : 4] : _zz_io_c_stream_payload_0_mantissa_2[5 : 3]);
  assign _zz_io_c_stream_payload_0_mantissa_4 = ({1'b0,_zz_io_c_stream_payload_0_mantissa_3} + _zz__zz_io_c_stream_payload_0_mantissa_4);
  assign _zz_io_c_stream_payload_0_mantissa_5 = _zz_io_c_stream_payload_0_mantissa_4[3];
  assign _zz_when_Float_l65_4 = ($signed(_zz__zz_when_Float_l65_4) + $signed(_zz__zz_when_Float_l65_4_9));
  assign when_Float_l65 = ((_zz_when_Float_l65_1 || _zz_when_Float_l65_2) || ($signed(_zz_when_Float_l65_4) <= $signed(7'h0)));
  always @(*) begin
    if(when_Float_l65) begin
      _zz_io_c_stream_payload_0_exponent = 4'b0000;
    end else begin
      if(when_Float_l70) begin
        _zz_io_c_stream_payload_0_exponent = 4'b1111;
      end else begin
        _zz_io_c_stream_payload_0_exponent = _zz__zz_io_c_stream_payload_0_exponent[3:0];
      end
    end
  end

  always @(*) begin
    if(when_Float_l65) begin
      _zz_io_c_stream_payload_0_mantissa_1 = 3'b000;
    end else begin
      if(when_Float_l70) begin
        _zz_io_c_stream_payload_0_mantissa_1 = 3'b000;
      end else begin
        _zz_io_c_stream_payload_0_mantissa_1 = (_zz_io_c_stream_payload_0_mantissa_5 ? 3'b000 : _zz_io_c_stream_payload_0_mantissa_4[2 : 0]);
      end
    end
  end

  assign when_Float_l70 = ($signed(7'h0f) <= $signed(_zz_when_Float_l65_4));
  assign io_c_stream_payload_0_mantissa = _zz_io_c_stream_payload_0_mantissa_1;
  assign io_c_stream_payload_0_exponent = _zz_io_c_stream_payload_0_exponent;
  assign io_c_stream_payload_0_sign = _zz_io_c_stream_payload_0_sign_1;

endmodule

module RepackOp_6 (
  input  wire          io_a_stream_valid,
  output wire          io_a_stream_ready,
  input  wire [15:0]   io_a_stream_payload_0,
  input  wire [15:0]   io_a_stream_payload_1,
  output wire          io_c_stream_valid,
  input  wire          io_c_stream_ready,
  output wire [15:0]   io_c_stream_payload_0,
  input  wire          io_reArm,
  output wire          io_isEmpty,
  input  wire          clk,
  input  wire          reset
);

  reg        [15:0]   _zz_io_c_stream_payload_0_1;
  wire                io_a_stream_translated_valid;
  wire                io_a_stream_translated_ready;
  wire       [31:0]   io_a_stream_translated_payload;
  wire                _zz_io_c_stream_valid;
  wire                _zz_io_a_stream_translated_ready;
  reg                 io_a_stream_translated_widthAdapter_counter_willIncrement;
  wire                io_a_stream_translated_widthAdapter_counter_willDecrement;
  wire                io_a_stream_translated_widthAdapter_counter_willClear;
  wire                io_a_stream_translated_widthAdapter_counter_willLoad;
  reg        [0:0]    io_a_stream_translated_widthAdapter_counter_valueNext;
  reg        [0:0]    io_a_stream_translated_widthAdapter_counter_value;
  wire                io_a_stream_translated_widthAdapter_counter_willOverflowIfInc;
  wire                io_a_stream_translated_widthAdapter_counter_willUnderflowIfDec;
  wire                io_a_stream_translated_widthAdapter_counter_willOverflow;
  wire                io_a_stream_translated_widthAdapter_counter_willUnderflow;
  wire       [31:0]   _zz_io_c_stream_payload_0;

  always @(*) begin
    case(io_a_stream_translated_widthAdapter_counter_value)
      1'b0 : _zz_io_c_stream_payload_0_1 = _zz_io_c_stream_payload_0[15 : 0];
      default : _zz_io_c_stream_payload_0_1 = _zz_io_c_stream_payload_0[31 : 16];
    endcase
  end

  assign io_a_stream_translated_valid = io_a_stream_valid;
  assign io_a_stream_ready = io_a_stream_translated_ready;
  assign io_a_stream_translated_payload = {io_a_stream_payload_1,io_a_stream_payload_0};
  always @(*) begin
    io_a_stream_translated_widthAdapter_counter_willIncrement = 1'b0;
    if((_zz_io_c_stream_valid && _zz_io_a_stream_translated_ready)) begin
      io_a_stream_translated_widthAdapter_counter_willIncrement = 1'b1;
    end
  end

  assign io_a_stream_translated_widthAdapter_counter_willDecrement = 1'b0;
  assign io_a_stream_translated_widthAdapter_counter_willClear = 1'b0;
  assign io_a_stream_translated_widthAdapter_counter_willLoad = 1'b0;
  assign io_a_stream_translated_widthAdapter_counter_willOverflowIfInc = (io_a_stream_translated_widthAdapter_counter_value == 1'b1);
  assign io_a_stream_translated_widthAdapter_counter_willUnderflowIfDec = (io_a_stream_translated_widthAdapter_counter_value == 1'b0);
  assign io_a_stream_translated_widthAdapter_counter_willOverflow = (io_a_stream_translated_widthAdapter_counter_willOverflowIfInc && io_a_stream_translated_widthAdapter_counter_willIncrement);
  always @(*) begin
    io_a_stream_translated_widthAdapter_counter_valueNext = (io_a_stream_translated_widthAdapter_counter_value + io_a_stream_translated_widthAdapter_counter_willIncrement);
    if(io_a_stream_translated_widthAdapter_counter_willClear) begin
      io_a_stream_translated_widthAdapter_counter_valueNext = 1'b0;
    end
  end

  assign io_a_stream_translated_widthAdapter_counter_willUnderflow = (io_a_stream_translated_widthAdapter_counter_willUnderflowIfDec && io_a_stream_translated_widthAdapter_counter_willDecrement);
  assign _zz_io_c_stream_valid = io_a_stream_translated_valid;
  assign _zz_io_c_stream_payload_0 = io_a_stream_translated_payload;
  assign io_a_stream_translated_ready = (_zz_io_a_stream_translated_ready && io_a_stream_translated_widthAdapter_counter_willOverflowIfInc);
  assign io_c_stream_valid = _zz_io_c_stream_valid;
  assign _zz_io_a_stream_translated_ready = io_c_stream_ready;
  assign io_c_stream_payload_0 = _zz_io_c_stream_payload_0_1[15 : 0];
  assign io_isEmpty = 1'b1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      io_a_stream_translated_widthAdapter_counter_value <= 1'b0;
    end else begin
      io_a_stream_translated_widthAdapter_counter_value <= io_a_stream_translated_widthAdapter_counter_valueNext;
    end
  end


endmodule

module MaxPool2DOp (
  input  wire          io_a_stream_valid,
  output reg           io_a_stream_ready,
  input  wire [15:0]   io_a_stream_payload_0,
  output reg           io_c_stream_valid,
  input  wire          io_c_stream_ready,
  output wire [15:0]   io_c_stream_payload_0,
  output wire [15:0]   io_c_stream_payload_1,
  input  wire          clk,
  input  wire          reset
);
  localparam fsm_3_BOOT = 2'd0;
  localparam fsm_3_stateFill = 2'd1;
  localparam fsm_3_stateOutput = 2'd2;
  localparam fsm_3_stateDone = 2'd3;

  wire                lineBuffers_0_io_pop_valid;
  wire       [15:0]   lineBuffers_0_io_pop_payload;
  wire       [4:0]    _zz_xCnt_valueNext;
  wire       [0:0]    _zz_xCnt_valueNext_1;
  wire       [4:0]    _zz_yCnt_valueNext;
  wire       [0:0]    _zz_yCnt_valueNext_1;
  wire       [7:0]    _zz_outCnt_valueNext;
  wire       [0:0]    _zz_outCnt_valueNext_1;
  wire       [1:0]    _zz_xAligned;
  wire       [1:0]    _zz_yAligned;
  wire                io_a_stream_fire;
  reg        [15:0]   tempVecs_0_0;
  reg        [15:0]   tempVecs_0_1;
  reg        [15:0]   tempVecs_1_0;
  reg        [15:0]   tempVecs_1_1;
  reg        [15:0]   winRegs_0_0;
  reg        [15:0]   winRegs_0_1;
  reg        [15:0]   winRegs_0_2;
  reg        [15:0]   winRegs_0_3;
  reg        [15:0]   winRegs_1_0;
  reg        [15:0]   winRegs_1_1;
  reg        [15:0]   winRegs_1_2;
  reg        [15:0]   winRegs_1_3;
  reg                 chCnt_willIncrement;
  wire                chCnt_willDecrement;
  reg                 chCnt_willClear;
  wire                chCnt_willLoad;
  reg        [0:0]    chCnt_valueNext;
  reg        [0:0]    chCnt_value;
  wire                chCnt_willOverflowIfInc;
  wire                chCnt_willUnderflowIfDec;
  wire                chCnt_willOverflow;
  wire                chCnt_willUnderflow;
  reg                 xCnt_willIncrement;
  wire                xCnt_willDecrement;
  reg                 xCnt_willClear;
  wire                xCnt_willLoad;
  reg        [4:0]    xCnt_valueNext;
  reg        [4:0]    xCnt_value;
  wire                xCnt_willOverflowIfInc;
  wire                xCnt_willUnderflowIfDec;
  wire                xCnt_willOverflow;
  wire                xCnt_willUnderflow;
  reg                 yCnt_willIncrement;
  wire                yCnt_willDecrement;
  reg                 yCnt_willClear;
  wire                yCnt_willLoad;
  reg        [4:0]    yCnt_valueNext;
  reg        [4:0]    yCnt_value;
  wire                yCnt_willOverflowIfInc;
  wire                yCnt_willUnderflowIfDec;
  wire                yCnt_willOverflow;
  wire                yCnt_willUnderflow;
  reg                 outCnt_willIncrement;
  wire                outCnt_willDecrement;
  reg                 outCnt_willClear;
  wire                outCnt_willLoad;
  reg        [7:0]    outCnt_valueNext;
  reg        [7:0]    outCnt_value;
  wire                outCnt_willOverflowIfInc;
  wire                outCnt_willUnderflowIfDec;
  wire                outCnt_willOverflow;
  wire                outCnt_willUnderflow;
  wire       [15:0]   currentPixels_0_0;
  wire       [15:0]   currentPixels_0_1;
  wire       [15:0]   currentPixels_1_0;
  wire       [15:0]   currentPixels_1_1;
  wire       [15:0]   _zz_io_c_stream_payload_0;
  wire       [15:0]   _zz_io_c_stream_payload_0_1;
  wire       [15:0]   _zz_io_c_stream_payload_1;
  wire       [15:0]   _zz_io_c_stream_payload_1_1;
  wire                xAligned;
  wire                yAligned;
  wire                windowReady;
  wire                emitWindow;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [1:0]    fsm_stateReg;
  reg        [1:0]    fsm_stateNext;
  wire       [1:0]    _zz_1;
  wire       [1:0]    _zz_2;
  `ifndef SYNTHESIS
  reg [87:0] fsm_stateReg_string;
  reg [87:0] fsm_stateNext_string;
  `endif


  assign _zz_xCnt_valueNext_1 = xCnt_willIncrement;
  assign _zz_xCnt_valueNext = {4'd0, _zz_xCnt_valueNext_1};
  assign _zz_yCnt_valueNext_1 = yCnt_willIncrement;
  assign _zz_yCnt_valueNext = {4'd0, _zz_yCnt_valueNext_1};
  assign _zz_outCnt_valueNext_1 = outCnt_willIncrement;
  assign _zz_outCnt_valueNext = {7'd0, _zz_outCnt_valueNext_1};
  assign _zz_xAligned = (xCnt_value % 2'b10);
  assign _zz_yAligned = (yCnt_value % 2'b10);
  LineBuffer2D lineBuffers_0 (
    .io_push_valid   (io_a_stream_fire                  ), //i
    .io_push_payload (io_a_stream_payload_0[15:0]       ), //i
    .io_pop_valid    (lineBuffers_0_io_pop_valid        ), //o
    .io_pop_payload  (lineBuffers_0_io_pop_payload[15:0]), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_3_BOOT : fsm_stateReg_string = "BOOT       ";
      fsm_3_stateFill : fsm_stateReg_string = "stateFill  ";
      fsm_3_stateOutput : fsm_stateReg_string = "stateOutput";
      fsm_3_stateDone : fsm_stateReg_string = "stateDone  ";
      default : fsm_stateReg_string = "???????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_3_BOOT : fsm_stateNext_string = "BOOT       ";
      fsm_3_stateFill : fsm_stateNext_string = "stateFill  ";
      fsm_3_stateOutput : fsm_stateNext_string = "stateOutput";
      fsm_3_stateDone : fsm_stateNext_string = "stateDone  ";
      default : fsm_stateNext_string = "???????????";
    endcase
  end
  `endif

  assign io_a_stream_fire = (io_a_stream_valid && io_a_stream_ready);
  always @(*) begin
    chCnt_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_3_stateFill : begin
        if(io_a_stream_fire) begin
          chCnt_willIncrement = 1'b1;
        end
      end
      fsm_3_stateOutput : begin
      end
      fsm_3_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  assign chCnt_willDecrement = 1'b0;
  always @(*) begin
    chCnt_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_3_stateFill : begin
      end
      fsm_3_stateOutput : begin
      end
      fsm_3_stateDone : begin
        chCnt_willClear = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign chCnt_willLoad = 1'b0;
  assign chCnt_willOverflowIfInc = (chCnt_value == 1'b1);
  assign chCnt_willUnderflowIfDec = (chCnt_value == 1'b0);
  assign chCnt_willOverflow = (chCnt_willOverflowIfInc && chCnt_willIncrement);
  always @(*) begin
    chCnt_valueNext = (chCnt_value + chCnt_willIncrement);
    if(chCnt_willClear) begin
      chCnt_valueNext = 1'b0;
    end
  end

  assign chCnt_willUnderflow = (chCnt_willUnderflowIfDec && chCnt_willDecrement);
  always @(*) begin
    xCnt_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_3_stateFill : begin
        if(io_a_stream_fire) begin
          if(chCnt_willOverflowIfInc) begin
            xCnt_willIncrement = 1'b1;
          end
        end
      end
      fsm_3_stateOutput : begin
      end
      fsm_3_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  assign xCnt_willDecrement = 1'b0;
  always @(*) begin
    xCnt_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_3_stateFill : begin
      end
      fsm_3_stateOutput : begin
      end
      fsm_3_stateDone : begin
        xCnt_willClear = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign xCnt_willLoad = 1'b0;
  assign xCnt_willOverflowIfInc = (xCnt_value == 5'h17);
  assign xCnt_willUnderflowIfDec = (xCnt_value == 5'h0);
  assign xCnt_willOverflow = (xCnt_willOverflowIfInc && xCnt_willIncrement);
  always @(*) begin
    xCnt_valueNext = (xCnt_value + _zz_xCnt_valueNext);
    if(xCnt_willOverflow) begin
      xCnt_valueNext = 5'h0;
    end
    if(xCnt_willClear) begin
      xCnt_valueNext = 5'h0;
    end
  end

  assign xCnt_willUnderflow = (xCnt_willUnderflowIfDec && xCnt_willDecrement);
  always @(*) begin
    yCnt_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_3_stateFill : begin
        if(io_a_stream_fire) begin
          if(chCnt_willOverflowIfInc) begin
            if(xCnt_willOverflowIfInc) begin
              yCnt_willIncrement = 1'b1;
            end
          end
        end
      end
      fsm_3_stateOutput : begin
      end
      fsm_3_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  assign yCnt_willDecrement = 1'b0;
  always @(*) begin
    yCnt_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_3_stateFill : begin
      end
      fsm_3_stateOutput : begin
      end
      fsm_3_stateDone : begin
        yCnt_willClear = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign yCnt_willLoad = 1'b0;
  assign yCnt_willOverflowIfInc = (yCnt_value == 5'h17);
  assign yCnt_willUnderflowIfDec = (yCnt_value == 5'h0);
  assign yCnt_willOverflow = (yCnt_willOverflowIfInc && yCnt_willIncrement);
  always @(*) begin
    yCnt_valueNext = (yCnt_value + _zz_yCnt_valueNext);
    if(yCnt_willOverflow) begin
      yCnt_valueNext = 5'h0;
    end
    if(yCnt_willClear) begin
      yCnt_valueNext = 5'h0;
    end
  end

  assign yCnt_willUnderflow = (yCnt_willUnderflowIfDec && yCnt_willDecrement);
  always @(*) begin
    outCnt_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_3_stateFill : begin
      end
      fsm_3_stateOutput : begin
        if(io_c_stream_ready) begin
          outCnt_willIncrement = 1'b1;
        end
      end
      fsm_3_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  assign outCnt_willDecrement = 1'b0;
  always @(*) begin
    outCnt_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_3_stateFill : begin
      end
      fsm_3_stateOutput : begin
      end
      fsm_3_stateDone : begin
        outCnt_willClear = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign outCnt_willLoad = 1'b0;
  assign outCnt_willOverflowIfInc = (outCnt_value == 8'h8f);
  assign outCnt_willUnderflowIfDec = (outCnt_value == 8'h0);
  assign outCnt_willOverflow = (outCnt_willOverflowIfInc && outCnt_willIncrement);
  always @(*) begin
    outCnt_valueNext = (outCnt_value + _zz_outCnt_valueNext);
    if(outCnt_willOverflow) begin
      outCnt_valueNext = 8'h0;
    end
    if(outCnt_willClear) begin
      outCnt_valueNext = 8'h0;
    end
  end

  assign outCnt_willUnderflow = (outCnt_willUnderflowIfDec && outCnt_willDecrement);
  assign currentPixels_0_0 = tempVecs_0_0;
  assign currentPixels_0_1 = lineBuffers_0_io_pop_payload;
  assign currentPixels_1_0 = tempVecs_1_0;
  assign currentPixels_1_1 = io_a_stream_payload_0;
  assign _zz_io_c_stream_payload_0 = (($signed(winRegs_0_2) < $signed(winRegs_0_0)) ? winRegs_0_0 : winRegs_0_2);
  assign _zz_io_c_stream_payload_0_1 = (($signed(winRegs_1_2) < $signed(winRegs_1_0)) ? winRegs_1_0 : winRegs_1_2);
  assign io_c_stream_payload_0 = (($signed(_zz_io_c_stream_payload_0_1) < $signed(_zz_io_c_stream_payload_0)) ? _zz_io_c_stream_payload_0 : _zz_io_c_stream_payload_0_1);
  assign _zz_io_c_stream_payload_1 = (($signed(winRegs_0_3) < $signed(winRegs_0_1)) ? winRegs_0_1 : winRegs_0_3);
  assign _zz_io_c_stream_payload_1_1 = (($signed(winRegs_1_3) < $signed(winRegs_1_1)) ? winRegs_1_1 : winRegs_1_3);
  assign io_c_stream_payload_1 = (($signed(_zz_io_c_stream_payload_1_1) < $signed(_zz_io_c_stream_payload_1)) ? _zz_io_c_stream_payload_1 : _zz_io_c_stream_payload_1_1);
  assign xAligned = (_zz_xAligned == 2'b01);
  assign yAligned = (_zz_yAligned == 2'b01);
  assign windowReady = ((5'h01 <= xCnt_value) && (5'h01 <= yCnt_value));
  assign emitWindow = (((chCnt_willOverflowIfInc && xAligned) && yAligned) && windowReady);
  always @(*) begin
    io_a_stream_ready = 1'b0;
    case(fsm_stateReg)
      fsm_3_stateFill : begin
        io_a_stream_ready = 1'b1;
      end
      fsm_3_stateOutput : begin
      end
      fsm_3_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_c_stream_valid = 1'b0;
    case(fsm_stateReg)
      fsm_3_stateFill : begin
      end
      fsm_3_stateOutput : begin
        io_c_stream_valid = 1'b1;
      end
      fsm_3_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_3_stateFill : begin
      end
      fsm_3_stateOutput : begin
      end
      fsm_3_stateDone : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_3_stateFill : begin
        if(io_a_stream_fire) begin
          if(chCnt_willOverflowIfInc) begin
            if(emitWindow) begin
              fsm_stateNext = fsm_3_stateOutput;
            end
          end
        end
      end
      fsm_3_stateOutput : begin
        if(io_c_stream_ready) begin
          if(outCnt_willOverflowIfInc) begin
            fsm_stateNext = fsm_3_stateDone;
          end else begin
            fsm_stateNext = fsm_3_stateFill;
          end
        end
      end
      fsm_3_stateDone : begin
        fsm_stateNext = fsm_3_stateFill;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_3_stateFill;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_3_BOOT;
    end
  end

  assign _zz_1 = ({1'd0,1'b1} <<< chCnt_value);
  assign _zz_2 = ({1'd0,1'b1} <<< chCnt_value);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      tempVecs_0_0 <= 16'h0;
      tempVecs_0_1 <= 16'h0;
      tempVecs_1_0 <= 16'h0;
      tempVecs_1_1 <= 16'h0;
      winRegs_0_0 <= 16'h0;
      winRegs_0_1 <= 16'h0;
      winRegs_0_2 <= 16'h0;
      winRegs_0_3 <= 16'h0;
      winRegs_1_0 <= 16'h0;
      winRegs_1_1 <= 16'h0;
      winRegs_1_2 <= 16'h0;
      winRegs_1_3 <= 16'h0;
      chCnt_value <= 1'b0;
      xCnt_value <= 5'h0;
      yCnt_value <= 5'h0;
      outCnt_value <= 8'h0;
      fsm_stateReg <= fsm_3_BOOT;
    end else begin
      chCnt_value <= chCnt_valueNext;
      xCnt_value <= xCnt_valueNext;
      yCnt_value <= yCnt_valueNext;
      outCnt_value <= outCnt_valueNext;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_3_stateFill : begin
          if(io_a_stream_fire) begin
            if(_zz_1[0]) begin
              tempVecs_1_0 <= io_a_stream_payload_0;
            end
            if(_zz_1[1]) begin
              tempVecs_1_1 <= io_a_stream_payload_0;
            end
            if(_zz_2[0]) begin
              tempVecs_0_0 <= lineBuffers_0_io_pop_payload;
            end
            if(_zz_2[1]) begin
              tempVecs_0_1 <= lineBuffers_0_io_pop_payload;
            end
            if(chCnt_willOverflowIfInc) begin
              winRegs_0_0 <= winRegs_0_2;
              winRegs_0_1 <= winRegs_0_3;
              winRegs_0_2 <= currentPixels_0_0;
              winRegs_0_3 <= currentPixels_0_1;
              winRegs_1_0 <= winRegs_1_2;
              winRegs_1_1 <= winRegs_1_3;
              winRegs_1_2 <= currentPixels_1_0;
              winRegs_1_3 <= currentPixels_1_1;
            end
          end
        end
        fsm_3_stateOutput : begin
        end
        fsm_3_stateDone : begin
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module ReLUOp (
  input  wire          io_x_stream_valid,
  output wire          io_x_stream_ready,
  input  wire [15:0]   io_x_stream_payload_0,
  output wire          io_y_stream_valid,
  input  wire          io_y_stream_ready,
  output wire [15:0]   io_y_stream_payload_0
);


  assign io_y_stream_valid = io_x_stream_valid;
  assign io_x_stream_ready = io_y_stream_ready;
  assign io_y_stream_payload_0 = (($signed(io_x_stream_payload_0) < $signed(16'h0)) ? 16'h0 : io_x_stream_payload_0);

endmodule

module Conv2DLayer (
  input  wire          io_x_stream_valid,
  output wire          io_x_stream_ready,
  input  wire [7:0]    io_x_stream_payload_0,
  input  wire          io_w_stream_valid,
  output wire          io_w_stream_ready,
  input  wire [7:0]    io_w_stream_payload_0,
  input  wire [7:0]    io_w_stream_payload_1,
  input  wire [7:0]    io_w_stream_payload_2,
  input  wire [7:0]    io_w_stream_payload_3,
  input  wire [7:0]    io_w_stream_payload_4,
  input  wire [7:0]    io_w_stream_payload_5,
  input  wire [7:0]    io_w_stream_payload_6,
  input  wire [7:0]    io_w_stream_payload_7,
  input  wire [7:0]    io_w_stream_payload_8,
  input  wire [7:0]    io_w_stream_payload_9,
  input  wire [7:0]    io_w_stream_payload_10,
  input  wire [7:0]    io_w_stream_payload_11,
  input  wire [7:0]    io_w_stream_payload_12,
  input  wire [7:0]    io_w_stream_payload_13,
  input  wire [7:0]    io_w_stream_payload_14,
  input  wire [7:0]    io_w_stream_payload_15,
  input  wire [7:0]    io_w_stream_payload_16,
  input  wire [7:0]    io_w_stream_payload_17,
  input  wire [7:0]    io_w_stream_payload_18,
  input  wire [7:0]    io_w_stream_payload_19,
  input  wire [7:0]    io_w_stream_payload_20,
  input  wire [7:0]    io_w_stream_payload_21,
  input  wire [7:0]    io_w_stream_payload_22,
  input  wire [7:0]    io_w_stream_payload_23,
  input  wire [7:0]    io_w_stream_payload_24,
  input  wire          io_b_stream_valid,
  output wire          io_b_stream_ready,
  input  wire [15:0]   io_b_stream_payload_0,
  output wire          io_y_stream_valid,
  input  wire          io_y_stream_ready,
  output wire [15:0]   io_y_stream_payload_0,
  input  wire          io_reArm,
  input  wire          clk,
  input  wire          reset
);

  wire                im2ColOp_1_io_a_stream_ready;
  wire                im2ColOp_1_io_c_stream_valid;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_0;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_1;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_2;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_3;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_4;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_5;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_6;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_7;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_8;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_9;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_10;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_11;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_12;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_13;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_14;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_15;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_16;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_17;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_18;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_19;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_20;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_21;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_22;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_23;
  wire       [7:0]    im2ColOp_1_io_c_stream_payload_24;
  wire                matmulOp_2_io_a_stream_ready;
  wire                matmulOp_2_io_b_stream_ready;
  wire                matmulOp_2_io_c_stream_valid;
  wire       [15:0]   matmulOp_2_io_c_stream_payload_0;
  wire                biasAddOp_2_io_a_stream_ready;
  wire                biasAddOp_2_io_b_stream_ready;
  wire                biasAddOp_2_io_c_stream_valid;
  wire       [15:0]   biasAddOp_2_io_c_stream_payload_0;
  wire                matmulResult_stream_valid;
  wire                matmulResult_stream_ready;
  wire       [15:0]   matmulResult_stream_payload_0;

  Im2ColOp im2ColOp_1 (
    .io_a_stream_valid      (io_x_stream_valid                     ), //i
    .io_a_stream_ready      (im2ColOp_1_io_a_stream_ready          ), //o
    .io_a_stream_payload_0  (io_x_stream_payload_0[7:0]            ), //i
    .io_c_stream_valid      (im2ColOp_1_io_c_stream_valid          ), //o
    .io_c_stream_ready      (matmulOp_2_io_a_stream_ready          ), //i
    .io_c_stream_payload_0  (im2ColOp_1_io_c_stream_payload_0[7:0] ), //o
    .io_c_stream_payload_1  (im2ColOp_1_io_c_stream_payload_1[7:0] ), //o
    .io_c_stream_payload_2  (im2ColOp_1_io_c_stream_payload_2[7:0] ), //o
    .io_c_stream_payload_3  (im2ColOp_1_io_c_stream_payload_3[7:0] ), //o
    .io_c_stream_payload_4  (im2ColOp_1_io_c_stream_payload_4[7:0] ), //o
    .io_c_stream_payload_5  (im2ColOp_1_io_c_stream_payload_5[7:0] ), //o
    .io_c_stream_payload_6  (im2ColOp_1_io_c_stream_payload_6[7:0] ), //o
    .io_c_stream_payload_7  (im2ColOp_1_io_c_stream_payload_7[7:0] ), //o
    .io_c_stream_payload_8  (im2ColOp_1_io_c_stream_payload_8[7:0] ), //o
    .io_c_stream_payload_9  (im2ColOp_1_io_c_stream_payload_9[7:0] ), //o
    .io_c_stream_payload_10 (im2ColOp_1_io_c_stream_payload_10[7:0]), //o
    .io_c_stream_payload_11 (im2ColOp_1_io_c_stream_payload_11[7:0]), //o
    .io_c_stream_payload_12 (im2ColOp_1_io_c_stream_payload_12[7:0]), //o
    .io_c_stream_payload_13 (im2ColOp_1_io_c_stream_payload_13[7:0]), //o
    .io_c_stream_payload_14 (im2ColOp_1_io_c_stream_payload_14[7:0]), //o
    .io_c_stream_payload_15 (im2ColOp_1_io_c_stream_payload_15[7:0]), //o
    .io_c_stream_payload_16 (im2ColOp_1_io_c_stream_payload_16[7:0]), //o
    .io_c_stream_payload_17 (im2ColOp_1_io_c_stream_payload_17[7:0]), //o
    .io_c_stream_payload_18 (im2ColOp_1_io_c_stream_payload_18[7:0]), //o
    .io_c_stream_payload_19 (im2ColOp_1_io_c_stream_payload_19[7:0]), //o
    .io_c_stream_payload_20 (im2ColOp_1_io_c_stream_payload_20[7:0]), //o
    .io_c_stream_payload_21 (im2ColOp_1_io_c_stream_payload_21[7:0]), //o
    .io_c_stream_payload_22 (im2ColOp_1_io_c_stream_payload_22[7:0]), //o
    .io_c_stream_payload_23 (im2ColOp_1_io_c_stream_payload_23[7:0]), //o
    .io_c_stream_payload_24 (im2ColOp_1_io_c_stream_payload_24[7:0]), //o
    .clk                    (clk                                   ), //i
    .reset                  (reset                                 )  //i
  );
  MatmulOp matmulOp_2 (
    .io_a_stream_valid      (im2ColOp_1_io_c_stream_valid          ), //i
    .io_a_stream_ready      (matmulOp_2_io_a_stream_ready          ), //o
    .io_a_stream_payload_0  (im2ColOp_1_io_c_stream_payload_0[7:0] ), //i
    .io_a_stream_payload_1  (im2ColOp_1_io_c_stream_payload_1[7:0] ), //i
    .io_a_stream_payload_2  (im2ColOp_1_io_c_stream_payload_2[7:0] ), //i
    .io_a_stream_payload_3  (im2ColOp_1_io_c_stream_payload_3[7:0] ), //i
    .io_a_stream_payload_4  (im2ColOp_1_io_c_stream_payload_4[7:0] ), //i
    .io_a_stream_payload_5  (im2ColOp_1_io_c_stream_payload_5[7:0] ), //i
    .io_a_stream_payload_6  (im2ColOp_1_io_c_stream_payload_6[7:0] ), //i
    .io_a_stream_payload_7  (im2ColOp_1_io_c_stream_payload_7[7:0] ), //i
    .io_a_stream_payload_8  (im2ColOp_1_io_c_stream_payload_8[7:0] ), //i
    .io_a_stream_payload_9  (im2ColOp_1_io_c_stream_payload_9[7:0] ), //i
    .io_a_stream_payload_10 (im2ColOp_1_io_c_stream_payload_10[7:0]), //i
    .io_a_stream_payload_11 (im2ColOp_1_io_c_stream_payload_11[7:0]), //i
    .io_a_stream_payload_12 (im2ColOp_1_io_c_stream_payload_12[7:0]), //i
    .io_a_stream_payload_13 (im2ColOp_1_io_c_stream_payload_13[7:0]), //i
    .io_a_stream_payload_14 (im2ColOp_1_io_c_stream_payload_14[7:0]), //i
    .io_a_stream_payload_15 (im2ColOp_1_io_c_stream_payload_15[7:0]), //i
    .io_a_stream_payload_16 (im2ColOp_1_io_c_stream_payload_16[7:0]), //i
    .io_a_stream_payload_17 (im2ColOp_1_io_c_stream_payload_17[7:0]), //i
    .io_a_stream_payload_18 (im2ColOp_1_io_c_stream_payload_18[7:0]), //i
    .io_a_stream_payload_19 (im2ColOp_1_io_c_stream_payload_19[7:0]), //i
    .io_a_stream_payload_20 (im2ColOp_1_io_c_stream_payload_20[7:0]), //i
    .io_a_stream_payload_21 (im2ColOp_1_io_c_stream_payload_21[7:0]), //i
    .io_a_stream_payload_22 (im2ColOp_1_io_c_stream_payload_22[7:0]), //i
    .io_a_stream_payload_23 (im2ColOp_1_io_c_stream_payload_23[7:0]), //i
    .io_a_stream_payload_24 (im2ColOp_1_io_c_stream_payload_24[7:0]), //i
    .io_b_stream_valid      (io_w_stream_valid                     ), //i
    .io_b_stream_ready      (matmulOp_2_io_b_stream_ready          ), //o
    .io_b_stream_payload_0  (io_w_stream_payload_0[7:0]            ), //i
    .io_b_stream_payload_1  (io_w_stream_payload_1[7:0]            ), //i
    .io_b_stream_payload_2  (io_w_stream_payload_2[7:0]            ), //i
    .io_b_stream_payload_3  (io_w_stream_payload_3[7:0]            ), //i
    .io_b_stream_payload_4  (io_w_stream_payload_4[7:0]            ), //i
    .io_b_stream_payload_5  (io_w_stream_payload_5[7:0]            ), //i
    .io_b_stream_payload_6  (io_w_stream_payload_6[7:0]            ), //i
    .io_b_stream_payload_7  (io_w_stream_payload_7[7:0]            ), //i
    .io_b_stream_payload_8  (io_w_stream_payload_8[7:0]            ), //i
    .io_b_stream_payload_9  (io_w_stream_payload_9[7:0]            ), //i
    .io_b_stream_payload_10 (io_w_stream_payload_10[7:0]           ), //i
    .io_b_stream_payload_11 (io_w_stream_payload_11[7:0]           ), //i
    .io_b_stream_payload_12 (io_w_stream_payload_12[7:0]           ), //i
    .io_b_stream_payload_13 (io_w_stream_payload_13[7:0]           ), //i
    .io_b_stream_payload_14 (io_w_stream_payload_14[7:0]           ), //i
    .io_b_stream_payload_15 (io_w_stream_payload_15[7:0]           ), //i
    .io_b_stream_payload_16 (io_w_stream_payload_16[7:0]           ), //i
    .io_b_stream_payload_17 (io_w_stream_payload_17[7:0]           ), //i
    .io_b_stream_payload_18 (io_w_stream_payload_18[7:0]           ), //i
    .io_b_stream_payload_19 (io_w_stream_payload_19[7:0]           ), //i
    .io_b_stream_payload_20 (io_w_stream_payload_20[7:0]           ), //i
    .io_b_stream_payload_21 (io_w_stream_payload_21[7:0]           ), //i
    .io_b_stream_payload_22 (io_w_stream_payload_22[7:0]           ), //i
    .io_b_stream_payload_23 (io_w_stream_payload_23[7:0]           ), //i
    .io_b_stream_payload_24 (io_w_stream_payload_24[7:0]           ), //i
    .io_c_stream_valid      (matmulOp_2_io_c_stream_valid          ), //o
    .io_c_stream_ready      (matmulResult_stream_ready             ), //i
    .io_c_stream_payload_0  (matmulOp_2_io_c_stream_payload_0[15:0]), //o
    .io_reArm               (io_reArm                              ), //i
    .clk                    (clk                                   ), //i
    .reset                  (reset                                 )  //i
  );
  BiasAddOp biasAddOp_2 (
    .io_a_stream_valid     (matmulResult_stream_valid              ), //i
    .io_a_stream_ready     (biasAddOp_2_io_a_stream_ready          ), //o
    .io_a_stream_payload_0 (matmulResult_stream_payload_0[15:0]    ), //i
    .io_b_stream_valid     (io_b_stream_valid                      ), //i
    .io_b_stream_ready     (biasAddOp_2_io_b_stream_ready          ), //o
    .io_b_stream_payload_0 (io_b_stream_payload_0[15:0]            ), //i
    .io_c_stream_valid     (biasAddOp_2_io_c_stream_valid          ), //o
    .io_c_stream_ready     (io_y_stream_ready                      ), //i
    .io_c_stream_payload_0 (biasAddOp_2_io_c_stream_payload_0[15:0]), //o
    .io_reArm              (1'b0                                   ), //i
    .clk                   (clk                                    ), //i
    .reset                 (reset                                  )  //i
  );
  assign io_x_stream_ready = im2ColOp_1_io_a_stream_ready;
  assign io_w_stream_ready = matmulOp_2_io_b_stream_ready;
  assign matmulResult_stream_valid = matmulOp_2_io_c_stream_valid;
  assign matmulResult_stream_payload_0 = matmulOp_2_io_c_stream_payload_0;
  assign matmulResult_stream_ready = biasAddOp_2_io_a_stream_ready;
  assign io_b_stream_ready = biasAddOp_2_io_b_stream_ready;
  assign io_y_stream_valid = biasAddOp_2_io_c_stream_valid;
  assign io_y_stream_payload_0 = biasAddOp_2_io_c_stream_payload_0;

endmodule

module CastOp (
  input  wire          io_a_stream_valid,
  output wire          io_a_stream_ready,
  input  wire [3:0]    io_a_stream_payload_0,
  input  wire [3:0]    io_a_stream_payload_1,
  input  wire [3:0]    io_a_stream_payload_2,
  input  wire [3:0]    io_a_stream_payload_3,
  input  wire [3:0]    io_a_stream_payload_4,
  input  wire [3:0]    io_a_stream_payload_5,
  input  wire [3:0]    io_a_stream_payload_6,
  input  wire [3:0]    io_a_stream_payload_7,
  input  wire [3:0]    io_a_stream_payload_8,
  input  wire [3:0]    io_a_stream_payload_9,
  input  wire [3:0]    io_a_stream_payload_10,
  input  wire [3:0]    io_a_stream_payload_11,
  input  wire [3:0]    io_a_stream_payload_12,
  input  wire [3:0]    io_a_stream_payload_13,
  input  wire [3:0]    io_a_stream_payload_14,
  input  wire [3:0]    io_a_stream_payload_15,
  input  wire [3:0]    io_a_stream_payload_16,
  input  wire [3:0]    io_a_stream_payload_17,
  input  wire [3:0]    io_a_stream_payload_18,
  input  wire [3:0]    io_a_stream_payload_19,
  input  wire [3:0]    io_a_stream_payload_20,
  input  wire [3:0]    io_a_stream_payload_21,
  input  wire [3:0]    io_a_stream_payload_22,
  input  wire [3:0]    io_a_stream_payload_23,
  input  wire [3:0]    io_a_stream_payload_24,
  output wire          io_c_stream_valid,
  input  wire          io_c_stream_ready,
  output wire [7:0]    io_c_stream_payload_0,
  output wire [7:0]    io_c_stream_payload_1,
  output wire [7:0]    io_c_stream_payload_2,
  output wire [7:0]    io_c_stream_payload_3,
  output wire [7:0]    io_c_stream_payload_4,
  output wire [7:0]    io_c_stream_payload_5,
  output wire [7:0]    io_c_stream_payload_6,
  output wire [7:0]    io_c_stream_payload_7,
  output wire [7:0]    io_c_stream_payload_8,
  output wire [7:0]    io_c_stream_payload_9,
  output wire [7:0]    io_c_stream_payload_10,
  output wire [7:0]    io_c_stream_payload_11,
  output wire [7:0]    io_c_stream_payload_12,
  output wire [7:0]    io_c_stream_payload_13,
  output wire [7:0]    io_c_stream_payload_14,
  output wire [7:0]    io_c_stream_payload_15,
  output wire [7:0]    io_c_stream_payload_16,
  output wire [7:0]    io_c_stream_payload_17,
  output wire [7:0]    io_c_stream_payload_18,
  output wire [7:0]    io_c_stream_payload_19,
  output wire [7:0]    io_c_stream_payload_20,
  output wire [7:0]    io_c_stream_payload_21,
  output wire [7:0]    io_c_stream_payload_22,
  output wire [7:0]    io_c_stream_payload_23,
  output wire [7:0]    io_c_stream_payload_24
);


  assign io_c_stream_valid = io_a_stream_valid;
  assign io_a_stream_ready = io_c_stream_ready;
  assign io_c_stream_payload_0 = {{4{io_a_stream_payload_0[3]}}, io_a_stream_payload_0};
  assign io_c_stream_payload_1 = {{4{io_a_stream_payload_1[3]}}, io_a_stream_payload_1};
  assign io_c_stream_payload_2 = {{4{io_a_stream_payload_2[3]}}, io_a_stream_payload_2};
  assign io_c_stream_payload_3 = {{4{io_a_stream_payload_3[3]}}, io_a_stream_payload_3};
  assign io_c_stream_payload_4 = {{4{io_a_stream_payload_4[3]}}, io_a_stream_payload_4};
  assign io_c_stream_payload_5 = {{4{io_a_stream_payload_5[3]}}, io_a_stream_payload_5};
  assign io_c_stream_payload_6 = {{4{io_a_stream_payload_6[3]}}, io_a_stream_payload_6};
  assign io_c_stream_payload_7 = {{4{io_a_stream_payload_7[3]}}, io_a_stream_payload_7};
  assign io_c_stream_payload_8 = {{4{io_a_stream_payload_8[3]}}, io_a_stream_payload_8};
  assign io_c_stream_payload_9 = {{4{io_a_stream_payload_9[3]}}, io_a_stream_payload_9};
  assign io_c_stream_payload_10 = {{4{io_a_stream_payload_10[3]}}, io_a_stream_payload_10};
  assign io_c_stream_payload_11 = {{4{io_a_stream_payload_11[3]}}, io_a_stream_payload_11};
  assign io_c_stream_payload_12 = {{4{io_a_stream_payload_12[3]}}, io_a_stream_payload_12};
  assign io_c_stream_payload_13 = {{4{io_a_stream_payload_13[3]}}, io_a_stream_payload_13};
  assign io_c_stream_payload_14 = {{4{io_a_stream_payload_14[3]}}, io_a_stream_payload_14};
  assign io_c_stream_payload_15 = {{4{io_a_stream_payload_15[3]}}, io_a_stream_payload_15};
  assign io_c_stream_payload_16 = {{4{io_a_stream_payload_16[3]}}, io_a_stream_payload_16};
  assign io_c_stream_payload_17 = {{4{io_a_stream_payload_17[3]}}, io_a_stream_payload_17};
  assign io_c_stream_payload_18 = {{4{io_a_stream_payload_18[3]}}, io_a_stream_payload_18};
  assign io_c_stream_payload_19 = {{4{io_a_stream_payload_19[3]}}, io_a_stream_payload_19};
  assign io_c_stream_payload_20 = {{4{io_a_stream_payload_20[3]}}, io_a_stream_payload_20};
  assign io_c_stream_payload_21 = {{4{io_a_stream_payload_21[3]}}, io_a_stream_payload_21};
  assign io_c_stream_payload_22 = {{4{io_a_stream_payload_22[3]}}, io_a_stream_payload_22};
  assign io_c_stream_payload_23 = {{4{io_a_stream_payload_23[3]}}, io_a_stream_payload_23};
  assign io_c_stream_payload_24 = {{4{io_a_stream_payload_24[3]}}, io_a_stream_payload_24};

endmodule

module DoubleBufferStreamer_2 (
  output wire [0:0]    io_readAddr,
  input  wire [15:0]   io_readData_0,
  output reg           io_nextTile,
  input  wire          io_tileReady,
  output wire          io_streamOut_valid,
  input  wire          io_streamOut_ready,
  output wire [15:0]   io_streamOut_payload_0,
  input  wire          io_reArm,
  input  wire          clk,
  input  wire          reset
);

  reg                 fifo_io_flush;
  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [15:0]   fifo_io_pop_payload_0;
  wire       [4:0]    fifo_io_occupancy;
  wire       [4:0]    fifo_io_availability;
  reg                 readCounter_willIncrement;
  wire                readCounter_willDecrement;
  reg                 readCounter_willClear;
  wire                readCounter_willLoad;
  reg        [0:0]    readCounter_valueNext;
  reg        [0:0]    readCounter_value;
  wire                readCounter_willOverflowIfInc;
  wire                readCounter_willUnderflowIfDec;
  wire                readCounter_willOverflow;
  wire                readCounter_willUnderflow;
  reg                 isReading;
  wire                when_DoubleBufferStreamer_l38;
  wire                reqStream_valid;
  wire                reqStream_ready;
  wire       [0:0]    reqStream_payload;
  wire                reqStream_fire;
  reg                 delayedValid;

  StreamFifo_2 fifo (
    .io_push_valid     (delayedValid               ), //i
    .io_push_ready     (fifo_io_push_ready         ), //o
    .io_push_payload_0 (io_readData_0[15:0]        ), //i
    .io_pop_valid      (fifo_io_pop_valid          ), //o
    .io_pop_ready      (io_streamOut_ready         ), //i
    .io_pop_payload_0  (fifo_io_pop_payload_0[15:0]), //o
    .io_flush          (fifo_io_flush              ), //i
    .io_occupancy      (fifo_io_occupancy[4:0]     ), //o
    .io_availability   (fifo_io_availability[4:0]  ), //o
    .clk               (clk                        ), //i
    .reset             (reset                      )  //i
  );
  always @(*) begin
    readCounter_willIncrement = 1'b0;
    if(reqStream_fire) begin
      readCounter_willIncrement = 1'b1;
    end
  end

  assign readCounter_willDecrement = 1'b0;
  always @(*) begin
    readCounter_willClear = 1'b0;
    if(io_reArm) begin
      readCounter_willClear = 1'b1;
    end
  end

  assign readCounter_willLoad = 1'b0;
  assign readCounter_willOverflowIfInc = (readCounter_value == 1'b1);
  assign readCounter_willUnderflowIfDec = (readCounter_value == 1'b0);
  assign readCounter_willOverflow = (readCounter_willOverflowIfInc && readCounter_willIncrement);
  always @(*) begin
    readCounter_valueNext = (readCounter_value + readCounter_willIncrement);
    if(readCounter_willClear) begin
      readCounter_valueNext = 1'b0;
    end
  end

  assign readCounter_willUnderflow = (readCounter_willUnderflowIfDec && readCounter_willDecrement);
  always @(*) begin
    io_nextTile = 1'b0;
    if(reqStream_fire) begin
      if(readCounter_willOverflowIfInc) begin
        io_nextTile = 1'b1;
      end
    end
  end

  assign when_DoubleBufferStreamer_l38 = (io_tileReady && (! isReading));
  assign reqStream_valid = isReading;
  assign reqStream_payload = readCounter_value;
  assign io_readAddr = reqStream_payload;
  assign reqStream_fire = (reqStream_valid && reqStream_ready);
  assign io_streamOut_valid = fifo_io_pop_valid;
  assign io_streamOut_payload_0 = fifo_io_pop_payload_0;
  assign reqStream_ready = (5'h01 < fifo_io_availability);
  always @(*) begin
    fifo_io_flush = 1'b0;
    if(io_reArm) begin
      fifo_io_flush = 1'b1;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      readCounter_value <= 1'b0;
      isReading <= 1'b0;
      delayedValid <= 1'b0;
    end else begin
      readCounter_value <= readCounter_valueNext;
      if(when_DoubleBufferStreamer_l38) begin
        isReading <= 1'b1;
      end
      if(reqStream_fire) begin
        if(readCounter_willOverflowIfInc) begin
          isReading <= 1'b0;
        end
      end
      delayedValid <= reqStream_fire;
      if(io_reArm) begin
        isReading <= 1'b0;
        delayedValid <= 1'b0;
      end
    end
  end


endmodule

module StreamDoubleBuffer_4 (
  input  wire          io_streamIn_valid,
  output wire          io_streamIn_ready,
  input  wire [15:0]   io_streamIn_payload_0,
  input  wire [0:0]    io_readAddr,
  output wire [15:0]   io_readData_0,
  input  wire          io_nextTile,
  output wire          io_tileReady,
  input  wire          io_reArm,
  input  wire          io_residentHold,
  input  wire          io_stageRequest,
  output wire          io_loadCanAccept,
  output wire          io_tileFilled,
  output wire          io_refreshSettled,
  input  wire          clk,
  input  wire          reset
);

  reg        [15:0]   memPing_spinal_port0;
  reg        [15:0]   memPong_spinal_port0;
  wire                _zz_memPing_port;
  wire                _zz_readDataPing_0;
  wire                _zz_memPong_port;
  wire                _zz_readDataPong_0;
  wire       [15:0]   _zz_memPing_port_1;
  wire       [15:0]   _zz_memPong_port_1;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 loadBank;
  reg                 computeBank;
  reg                 pingFull;
  reg                 pongFull;
  wire       [15:0]   readDataPing_0;
  wire       [15:0]   readDataPong_0;
  reg                 computeBankDelayed;
  reg                 loadCounter_willIncrement;
  wire                loadCounter_willDecrement;
  reg                 loadCounter_willClear;
  wire                loadCounter_willLoad;
  reg        [0:0]    loadCounter_valueNext;
  reg        [0:0]    loadCounter_value;
  wire                loadCounter_willOverflowIfInc;
  wire                loadCounter_willUnderflowIfDec;
  wire                loadCounter_willOverflow;
  wire                loadCounter_willUnderflow;
  wire                currentLoadBankFull;
  wire                loadDone;
  reg                 tileFilled;
  reg                 switchArmed;
  wire                allowFlip;
  wire                when_StreamDoubleBuffer_l114;
  wire                when_StreamDoubleBuffer_l117;
  wire                when_StreamDoubleBuffer_l123;
  wire                when_StreamDoubleBuffer_l125;
  wire                when_StreamDoubleBuffer_l135;
  wire                when_StreamDoubleBuffer_l137;
  wire                when_StreamDoubleBuffer_l142;
  wire                when_StreamDoubleBuffer_l144;
  reg [15:0] memPing [0:1];
  reg [15:0] memPong [0:1];

  assign _zz_readDataPing_0 = 1'b1;
  assign _zz_memPing_port_1 = io_streamIn_payload_0;
  assign _zz_readDataPong_0 = 1'b1;
  assign _zz_memPong_port_1 = io_streamIn_payload_0;
  always @(posedge clk) begin
    if(_zz_readDataPing_0) begin
      memPing_spinal_port0 <= memPing[io_readAddr];
    end
  end

  always @(posedge clk) begin
    if(_zz_2) begin
      memPing[loadCounter_value] <= _zz_memPing_port_1;
    end
  end

  always @(posedge clk) begin
    if(_zz_readDataPong_0) begin
      memPong_spinal_port0 <= memPong[io_readAddr];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      memPong[loadCounter_value] <= _zz_memPong_port_1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      if(!when_StreamDoubleBuffer_l125) begin
        _zz_1 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      if(when_StreamDoubleBuffer_l125) begin
        _zz_2 = 1'b1;
      end
    end
  end

  assign io_tileReady = ((computeBank == 1'b0) ? pingFull : pongFull);
  assign readDataPing_0 = memPing_spinal_port0[15 : 0];
  assign readDataPong_0 = memPong_spinal_port0[15 : 0];
  assign io_readData_0 = ((computeBankDelayed == 1'b0) ? readDataPing_0 : readDataPong_0);
  always @(*) begin
    loadCounter_willIncrement = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      loadCounter_willIncrement = 1'b1;
    end
  end

  assign loadCounter_willDecrement = 1'b0;
  always @(*) begin
    loadCounter_willClear = 1'b0;
    if(io_reArm) begin
      loadCounter_willClear = 1'b1;
    end
  end

  assign loadCounter_willLoad = 1'b0;
  assign loadCounter_willOverflowIfInc = (loadCounter_value == 1'b1);
  assign loadCounter_willUnderflowIfDec = (loadCounter_value == 1'b0);
  assign loadCounter_willOverflow = (loadCounter_willOverflowIfInc && loadCounter_willIncrement);
  always @(*) begin
    loadCounter_valueNext = (loadCounter_value + loadCounter_willIncrement);
    if(loadCounter_willClear) begin
      loadCounter_valueNext = 1'b0;
    end
  end

  assign loadCounter_willUnderflow = (loadCounter_willUnderflowIfDec && loadCounter_willDecrement);
  assign currentLoadBankFull = ((loadBank == 1'b0) ? pingFull : pongFull);
  assign io_streamIn_ready = (! currentLoadBankFull);
  assign io_loadCanAccept = (! currentLoadBankFull);
  assign loadDone = ((io_streamIn_valid && (! currentLoadBankFull)) && loadCounter_willOverflowIfInc);
  assign io_tileFilled = tileFilled;
  assign allowFlip = ((! io_residentHold) || switchArmed);
  assign when_StreamDoubleBuffer_l114 = (io_stageRequest && tileFilled);
  assign when_StreamDoubleBuffer_l117 = (io_nextTile && allowFlip);
  assign io_refreshSettled = ((io_nextTile && allowFlip) && switchArmed);
  assign when_StreamDoubleBuffer_l123 = (io_streamIn_valid && (! currentLoadBankFull));
  assign when_StreamDoubleBuffer_l125 = (loadBank == 1'b0);
  assign when_StreamDoubleBuffer_l135 = ((io_nextTile && allowFlip) && (computeBank == 1'b0));
  assign when_StreamDoubleBuffer_l137 = (loadDone && (loadBank == 1'b0));
  assign when_StreamDoubleBuffer_l142 = ((io_nextTile && allowFlip) && (computeBank == 1'b1));
  assign when_StreamDoubleBuffer_l144 = (loadDone && (loadBank == 1'b1));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      loadBank <= 1'b0;
      computeBank <= 1'b0;
      pingFull <= 1'b0;
      pongFull <= 1'b0;
      loadCounter_value <= 1'b0;
      tileFilled <= 1'b0;
      switchArmed <= 1'b0;
    end else begin
      loadCounter_value <= loadCounter_valueNext;
      tileFilled <= loadDone;
      if(when_StreamDoubleBuffer_l114) begin
        switchArmed <= 1'b1;
      end
      if(when_StreamDoubleBuffer_l117) begin
        computeBank <= (! computeBank);
        switchArmed <= 1'b0;
      end
      if(when_StreamDoubleBuffer_l135) begin
        pingFull <= 1'b0;
      end else begin
        if(when_StreamDoubleBuffer_l137) begin
          pingFull <= 1'b1;
        end
      end
      if(when_StreamDoubleBuffer_l142) begin
        pongFull <= 1'b0;
      end else begin
        if(when_StreamDoubleBuffer_l144) begin
          pongFull <= 1'b1;
        end
      end
      if(loadDone) begin
        loadBank <= (! loadBank);
      end
      if(io_reArm) begin
        loadBank <= 1'b0;
        computeBank <= 1'b0;
        pingFull <= 1'b0;
        pongFull <= 1'b0;
        switchArmed <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    computeBankDelayed <= computeBank;
  end


endmodule

module DMAReader_2 (
  input  wire          io_cmd_valid,
  output wire          io_cmd_ready,
  input  wire [31:0]   io_cmd_payload_address,
  input  wire [15:0]   io_cmd_payload_length,
  output wire          io_axiMaster_ar_valid,
  input  wire          io_axiMaster_ar_ready,
  output wire [31:0]   io_axiMaster_ar_payload_addr,
  output wire [0:0]    io_axiMaster_ar_payload_id,
  output wire [3:0]    io_axiMaster_ar_payload_region,
  output wire [7:0]    io_axiMaster_ar_payload_len,
  output wire [2:0]    io_axiMaster_ar_payload_size,
  output wire [1:0]    io_axiMaster_ar_payload_burst,
  output wire [0:0]    io_axiMaster_ar_payload_lock,
  output wire [3:0]    io_axiMaster_ar_payload_cache,
  output wire [3:0]    io_axiMaster_ar_payload_qos,
  output wire [2:0]    io_axiMaster_ar_payload_prot,
  input  wire          io_axiMaster_r_valid,
  output wire          io_axiMaster_r_ready,
  input  wire [63:0]   io_axiMaster_r_payload_data,
  input  wire [0:0]    io_axiMaster_r_payload_id,
  input  wire [1:0]    io_axiMaster_r_payload_resp,
  input  wire          io_axiMaster_r_payload_last,
  output wire          io_outStream_stream_valid,
  input  wire          io_outStream_stream_ready,
  output wire [15:0]   io_outStream_stream_payload_0,
  input  wire          clk,
  input  wire          reset
);

  wire                repackOp_8_io_c_stream_ready;
  wire                repackOp_8_io_a_stream_ready;
  wire                repackOp_8_io_c_stream_valid;
  wire       [15:0]   repackOp_8_io_c_stream_payload_0;
  wire                repackOp_8_io_isEmpty;
  wire       [16:0]   _zz_remaining;
  wire       [1:0]    _zz_remaining_1;
  wire       [12:0]   _zz_bytesToBoundary;
  wire       [9:0]    _zz_beatsToBoundary;
  wire       [15:0]   _zz__zz_burstLen_3;
  wire       [15:0]   _zz__zz_burstLen_3_1;
  wire       [15:0]   _zz__zz_burstLen_3_2;
  wire       [16:0]   _zz_io_axiMaster_ar_payload_len;
  wire       [31:0]   _zz_addrReg;
  wire       [19:0]   _zz_addrReg_1;
  reg        [16:0]   remaining;
  reg        [8:0]    burstRemain;
  reg        [31:0]   addrReg;
  wire                baseReady;
  wire                gearboxEmpty;
  wire                io_cmd_fire;
  wire       [11:0]   offsetInPage;
  wire       [12:0]   bytesToBoundary;
  wire       [15:0]   beatsToBoundary;
  wire       [16:0]   _zz_burstLen;
  wire       [16:0]   _zz_burstLen_1;
  wire       [0:0]    _zz_burstLen_2;
  wire       [16:0]   _zz_burstLen_3;
  wire       [16:0]   burstLen;
  wire                io_axiMaster_ar_fire;
  wire                axiRawTensor_stream_valid;
  wire                axiRawTensor_stream_ready;
  wire       [15:0]   axiRawTensor_stream_payload_0;
  wire       [15:0]   axiRawTensor_stream_payload_1;
  wire       [15:0]   axiRawTensor_stream_payload_2;
  wire       [15:0]   axiRawTensor_stream_payload_3;
  wire                when_DMAReader_l115;
  reg        [1:0]    _zz_trimmedStream_stream_valid;
  wire                _zz_trimmedStream_stream_valid_1;
  wire                trimmedStream_stream_valid;
  wire                trimmedStream_stream_ready;
  wire       [15:0]   trimmedStream_stream_payload_0;
  wire                trimmedStream_stream_fire;

  assign _zz_remaining_1 = {1'b0,1'b1};
  assign _zz_remaining = {15'd0, _zz_remaining_1};
  assign _zz_bytesToBoundary = {1'd0, offsetInPage};
  assign _zz_beatsToBoundary = (bytesToBoundary >>> 2'd3);
  assign _zz__zz_burstLen_3 = ((beatsToBoundary < _zz__zz_burstLen_3_1) ? _zz__zz_burstLen_3_2 : beatsToBoundary);
  assign _zz__zz_burstLen_3_1 = {15'd0, _zz_burstLen_2};
  assign _zz__zz_burstLen_3_2 = {15'd0, _zz_burstLen_2};
  assign _zz_io_axiMaster_ar_payload_len = (burstLen - 17'h00001);
  assign _zz_addrReg_1 = ({3'd0,burstLen} <<< 2'd3);
  assign _zz_addrReg = {12'd0, _zz_addrReg_1};
  RepackOp_3 repackOp_8 (
    .io_a_stream_valid     (axiRawTensor_stream_valid             ), //i
    .io_a_stream_ready     (repackOp_8_io_a_stream_ready          ), //o
    .io_a_stream_payload_0 (axiRawTensor_stream_payload_0[15:0]   ), //i
    .io_a_stream_payload_1 (axiRawTensor_stream_payload_1[15:0]   ), //i
    .io_a_stream_payload_2 (axiRawTensor_stream_payload_2[15:0]   ), //i
    .io_a_stream_payload_3 (axiRawTensor_stream_payload_3[15:0]   ), //i
    .io_c_stream_valid     (repackOp_8_io_c_stream_valid          ), //o
    .io_c_stream_ready     (repackOp_8_io_c_stream_ready          ), //i
    .io_c_stream_payload_0 (repackOp_8_io_c_stream_payload_0[15:0]), //o
    .io_reArm              (io_cmd_fire                           ), //i
    .io_isEmpty            (repackOp_8_io_isEmpty                 ), //o
    .clk                   (clk                                   ), //i
    .reset                 (reset                                 )  //i
  );
  assign baseReady = ((remaining == 17'h0) && (burstRemain == 9'h0));
  assign io_cmd_ready = (baseReady && gearboxEmpty);
  assign io_cmd_fire = (io_cmd_valid && io_cmd_ready);
  assign offsetInPage = addrReg[11 : 0];
  assign bytesToBoundary = (13'h1000 - _zz_bytesToBoundary);
  assign beatsToBoundary = {6'd0, _zz_beatsToBoundary};
  assign _zz_burstLen = 17'h00100;
  assign _zz_burstLen_1 = ((remaining < _zz_burstLen) ? remaining : _zz_burstLen);
  assign _zz_burstLen_2 = 1'b1;
  assign _zz_burstLen_3 = {1'd0, _zz__zz_burstLen_3};
  assign burstLen = ((_zz_burstLen_1 < _zz_burstLen_3) ? _zz_burstLen_1 : _zz_burstLen_3);
  assign io_axiMaster_ar_valid = ((remaining != 17'h0) && (burstRemain == 9'h0));
  assign io_axiMaster_ar_payload_addr = addrReg;
  assign io_axiMaster_ar_payload_len = _zz_io_axiMaster_ar_payload_len[7:0];
  assign io_axiMaster_ar_payload_size = 3'b011;
  assign io_axiMaster_ar_payload_burst = 2'b01;
  assign io_axiMaster_ar_fire = (io_axiMaster_ar_valid && io_axiMaster_ar_ready);
  assign io_axiMaster_ar_payload_id = 1'b0;
  assign io_axiMaster_ar_payload_prot = 3'b000;
  assign io_axiMaster_ar_payload_cache = 4'b0000;
  assign io_axiMaster_ar_payload_lock = 1'b0;
  assign io_axiMaster_ar_payload_qos = 4'b0000;
  assign io_axiMaster_ar_payload_region = 4'b0000;
  assign axiRawTensor_stream_valid = (io_axiMaster_r_valid && (burstRemain != 9'h0));
  assign io_axiMaster_r_ready = axiRawTensor_stream_ready;
  assign when_DMAReader_l115 = (io_axiMaster_r_valid && io_axiMaster_r_ready);
  assign axiRawTensor_stream_payload_0 = io_axiMaster_r_payload_data[15 : 0];
  assign axiRawTensor_stream_payload_1 = io_axiMaster_r_payload_data[31 : 16];
  assign axiRawTensor_stream_payload_2 = io_axiMaster_r_payload_data[47 : 32];
  assign axiRawTensor_stream_payload_3 = io_axiMaster_r_payload_data[63 : 48];
  assign axiRawTensor_stream_ready = repackOp_8_io_a_stream_ready;
  assign gearboxEmpty = repackOp_8_io_isEmpty;
  assign _zz_trimmedStream_stream_valid_1 = (2'b10 <= _zz_trimmedStream_stream_valid);
  assign trimmedStream_stream_valid = (repackOp_8_io_c_stream_valid && (! _zz_trimmedStream_stream_valid_1));
  assign repackOp_8_io_c_stream_ready = (io_outStream_stream_ready || _zz_trimmedStream_stream_valid_1);
  assign trimmedStream_stream_fire = (trimmedStream_stream_valid && trimmedStream_stream_ready);
  assign trimmedStream_stream_payload_0 = repackOp_8_io_c_stream_payload_0;
  assign io_outStream_stream_valid = trimmedStream_stream_valid;
  assign trimmedStream_stream_ready = io_outStream_stream_ready;
  assign io_outStream_stream_payload_0 = trimmedStream_stream_payload_0;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      remaining <= 17'h0;
      burstRemain <= 9'h0;
      addrReg <= 32'h0;
      _zz_trimmedStream_stream_valid <= 2'b00;
    end else begin
      if(io_cmd_fire) begin
        addrReg <= io_cmd_payload_address;
        remaining <= ({1'b0,io_cmd_payload_length} + _zz_remaining);
      end
      if(io_axiMaster_ar_fire) begin
        addrReg <= (addrReg + _zz_addrReg);
        remaining <= (remaining - burstLen);
        burstRemain <= burstLen[8:0];
      end
      if(when_DMAReader_l115) begin
        burstRemain <= (burstRemain - 9'h001);
      end
      if(io_cmd_fire) begin
        _zz_trimmedStream_stream_valid <= 2'b00;
      end
      if(trimmedStream_stream_fire) begin
        _zz_trimmedStream_stream_valid <= (_zz_trimmedStream_stream_valid + 2'b01);
      end
    end
  end


endmodule

module DoubleBufferStreamer_1 (
  output wire [0:0]    io_readAddr,
  input  wire [3:0]    io_readData_0,
  input  wire [3:0]    io_readData_1,
  input  wire [3:0]    io_readData_2,
  input  wire [3:0]    io_readData_3,
  input  wire [3:0]    io_readData_4,
  input  wire [3:0]    io_readData_5,
  input  wire [3:0]    io_readData_6,
  input  wire [3:0]    io_readData_7,
  input  wire [3:0]    io_readData_8,
  input  wire [3:0]    io_readData_9,
  input  wire [3:0]    io_readData_10,
  input  wire [3:0]    io_readData_11,
  input  wire [3:0]    io_readData_12,
  input  wire [3:0]    io_readData_13,
  input  wire [3:0]    io_readData_14,
  input  wire [3:0]    io_readData_15,
  input  wire [3:0]    io_readData_16,
  input  wire [3:0]    io_readData_17,
  input  wire [3:0]    io_readData_18,
  input  wire [3:0]    io_readData_19,
  input  wire [3:0]    io_readData_20,
  input  wire [3:0]    io_readData_21,
  input  wire [3:0]    io_readData_22,
  input  wire [3:0]    io_readData_23,
  input  wire [3:0]    io_readData_24,
  output reg           io_nextTile,
  input  wire          io_tileReady,
  output wire          io_streamOut_valid,
  input  wire          io_streamOut_ready,
  output wire [3:0]    io_streamOut_payload_0,
  output wire [3:0]    io_streamOut_payload_1,
  output wire [3:0]    io_streamOut_payload_2,
  output wire [3:0]    io_streamOut_payload_3,
  output wire [3:0]    io_streamOut_payload_4,
  output wire [3:0]    io_streamOut_payload_5,
  output wire [3:0]    io_streamOut_payload_6,
  output wire [3:0]    io_streamOut_payload_7,
  output wire [3:0]    io_streamOut_payload_8,
  output wire [3:0]    io_streamOut_payload_9,
  output wire [3:0]    io_streamOut_payload_10,
  output wire [3:0]    io_streamOut_payload_11,
  output wire [3:0]    io_streamOut_payload_12,
  output wire [3:0]    io_streamOut_payload_13,
  output wire [3:0]    io_streamOut_payload_14,
  output wire [3:0]    io_streamOut_payload_15,
  output wire [3:0]    io_streamOut_payload_16,
  output wire [3:0]    io_streamOut_payload_17,
  output wire [3:0]    io_streamOut_payload_18,
  output wire [3:0]    io_streamOut_payload_19,
  output wire [3:0]    io_streamOut_payload_20,
  output wire [3:0]    io_streamOut_payload_21,
  output wire [3:0]    io_streamOut_payload_22,
  output wire [3:0]    io_streamOut_payload_23,
  output wire [3:0]    io_streamOut_payload_24,
  input  wire          io_reArm,
  input  wire          clk,
  input  wire          reset
);

  reg                 fifo_io_flush;
  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [3:0]    fifo_io_pop_payload_0;
  wire       [3:0]    fifo_io_pop_payload_1;
  wire       [3:0]    fifo_io_pop_payload_2;
  wire       [3:0]    fifo_io_pop_payload_3;
  wire       [3:0]    fifo_io_pop_payload_4;
  wire       [3:0]    fifo_io_pop_payload_5;
  wire       [3:0]    fifo_io_pop_payload_6;
  wire       [3:0]    fifo_io_pop_payload_7;
  wire       [3:0]    fifo_io_pop_payload_8;
  wire       [3:0]    fifo_io_pop_payload_9;
  wire       [3:0]    fifo_io_pop_payload_10;
  wire       [3:0]    fifo_io_pop_payload_11;
  wire       [3:0]    fifo_io_pop_payload_12;
  wire       [3:0]    fifo_io_pop_payload_13;
  wire       [3:0]    fifo_io_pop_payload_14;
  wire       [3:0]    fifo_io_pop_payload_15;
  wire       [3:0]    fifo_io_pop_payload_16;
  wire       [3:0]    fifo_io_pop_payload_17;
  wire       [3:0]    fifo_io_pop_payload_18;
  wire       [3:0]    fifo_io_pop_payload_19;
  wire       [3:0]    fifo_io_pop_payload_20;
  wire       [3:0]    fifo_io_pop_payload_21;
  wire       [3:0]    fifo_io_pop_payload_22;
  wire       [3:0]    fifo_io_pop_payload_23;
  wire       [3:0]    fifo_io_pop_payload_24;
  wire       [4:0]    fifo_io_occupancy;
  wire       [4:0]    fifo_io_availability;
  reg                 readCounter_willIncrement;
  wire                readCounter_willDecrement;
  reg                 readCounter_willClear;
  wire                readCounter_willLoad;
  reg        [0:0]    readCounter_valueNext;
  reg        [0:0]    readCounter_value;
  wire                readCounter_willOverflowIfInc;
  wire                readCounter_willUnderflowIfDec;
  wire                readCounter_willOverflow;
  wire                readCounter_willUnderflow;
  reg                 isReading;
  wire                when_DoubleBufferStreamer_l38;
  wire                reqStream_valid;
  wire                reqStream_ready;
  wire       [0:0]    reqStream_payload;
  wire                reqStream_fire;
  reg                 delayedValid;

  StreamFifo_1 fifo (
    .io_push_valid      (delayedValid               ), //i
    .io_push_ready      (fifo_io_push_ready         ), //o
    .io_push_payload_0  (io_readData_0[3:0]         ), //i
    .io_push_payload_1  (io_readData_1[3:0]         ), //i
    .io_push_payload_2  (io_readData_2[3:0]         ), //i
    .io_push_payload_3  (io_readData_3[3:0]         ), //i
    .io_push_payload_4  (io_readData_4[3:0]         ), //i
    .io_push_payload_5  (io_readData_5[3:0]         ), //i
    .io_push_payload_6  (io_readData_6[3:0]         ), //i
    .io_push_payload_7  (io_readData_7[3:0]         ), //i
    .io_push_payload_8  (io_readData_8[3:0]         ), //i
    .io_push_payload_9  (io_readData_9[3:0]         ), //i
    .io_push_payload_10 (io_readData_10[3:0]        ), //i
    .io_push_payload_11 (io_readData_11[3:0]        ), //i
    .io_push_payload_12 (io_readData_12[3:0]        ), //i
    .io_push_payload_13 (io_readData_13[3:0]        ), //i
    .io_push_payload_14 (io_readData_14[3:0]        ), //i
    .io_push_payload_15 (io_readData_15[3:0]        ), //i
    .io_push_payload_16 (io_readData_16[3:0]        ), //i
    .io_push_payload_17 (io_readData_17[3:0]        ), //i
    .io_push_payload_18 (io_readData_18[3:0]        ), //i
    .io_push_payload_19 (io_readData_19[3:0]        ), //i
    .io_push_payload_20 (io_readData_20[3:0]        ), //i
    .io_push_payload_21 (io_readData_21[3:0]        ), //i
    .io_push_payload_22 (io_readData_22[3:0]        ), //i
    .io_push_payload_23 (io_readData_23[3:0]        ), //i
    .io_push_payload_24 (io_readData_24[3:0]        ), //i
    .io_pop_valid       (fifo_io_pop_valid          ), //o
    .io_pop_ready       (io_streamOut_ready         ), //i
    .io_pop_payload_0   (fifo_io_pop_payload_0[3:0] ), //o
    .io_pop_payload_1   (fifo_io_pop_payload_1[3:0] ), //o
    .io_pop_payload_2   (fifo_io_pop_payload_2[3:0] ), //o
    .io_pop_payload_3   (fifo_io_pop_payload_3[3:0] ), //o
    .io_pop_payload_4   (fifo_io_pop_payload_4[3:0] ), //o
    .io_pop_payload_5   (fifo_io_pop_payload_5[3:0] ), //o
    .io_pop_payload_6   (fifo_io_pop_payload_6[3:0] ), //o
    .io_pop_payload_7   (fifo_io_pop_payload_7[3:0] ), //o
    .io_pop_payload_8   (fifo_io_pop_payload_8[3:0] ), //o
    .io_pop_payload_9   (fifo_io_pop_payload_9[3:0] ), //o
    .io_pop_payload_10  (fifo_io_pop_payload_10[3:0]), //o
    .io_pop_payload_11  (fifo_io_pop_payload_11[3:0]), //o
    .io_pop_payload_12  (fifo_io_pop_payload_12[3:0]), //o
    .io_pop_payload_13  (fifo_io_pop_payload_13[3:0]), //o
    .io_pop_payload_14  (fifo_io_pop_payload_14[3:0]), //o
    .io_pop_payload_15  (fifo_io_pop_payload_15[3:0]), //o
    .io_pop_payload_16  (fifo_io_pop_payload_16[3:0]), //o
    .io_pop_payload_17  (fifo_io_pop_payload_17[3:0]), //o
    .io_pop_payload_18  (fifo_io_pop_payload_18[3:0]), //o
    .io_pop_payload_19  (fifo_io_pop_payload_19[3:0]), //o
    .io_pop_payload_20  (fifo_io_pop_payload_20[3:0]), //o
    .io_pop_payload_21  (fifo_io_pop_payload_21[3:0]), //o
    .io_pop_payload_22  (fifo_io_pop_payload_22[3:0]), //o
    .io_pop_payload_23  (fifo_io_pop_payload_23[3:0]), //o
    .io_pop_payload_24  (fifo_io_pop_payload_24[3:0]), //o
    .io_flush           (fifo_io_flush              ), //i
    .io_occupancy       (fifo_io_occupancy[4:0]     ), //o
    .io_availability    (fifo_io_availability[4:0]  ), //o
    .clk                (clk                        ), //i
    .reset              (reset                      )  //i
  );
  always @(*) begin
    readCounter_willIncrement = 1'b0;
    if(reqStream_fire) begin
      readCounter_willIncrement = 1'b1;
    end
  end

  assign readCounter_willDecrement = 1'b0;
  always @(*) begin
    readCounter_willClear = 1'b0;
    if(io_reArm) begin
      readCounter_willClear = 1'b1;
    end
  end

  assign readCounter_willLoad = 1'b0;
  assign readCounter_willOverflowIfInc = (readCounter_value == 1'b1);
  assign readCounter_willUnderflowIfDec = (readCounter_value == 1'b0);
  assign readCounter_willOverflow = (readCounter_willOverflowIfInc && readCounter_willIncrement);
  always @(*) begin
    readCounter_valueNext = (readCounter_value + readCounter_willIncrement);
    if(readCounter_willClear) begin
      readCounter_valueNext = 1'b0;
    end
  end

  assign readCounter_willUnderflow = (readCounter_willUnderflowIfDec && readCounter_willDecrement);
  always @(*) begin
    io_nextTile = 1'b0;
    if(reqStream_fire) begin
      if(readCounter_willOverflowIfInc) begin
        io_nextTile = 1'b1;
      end
    end
  end

  assign when_DoubleBufferStreamer_l38 = (io_tileReady && (! isReading));
  assign reqStream_valid = isReading;
  assign reqStream_payload = readCounter_value;
  assign io_readAddr = reqStream_payload;
  assign reqStream_fire = (reqStream_valid && reqStream_ready);
  assign io_streamOut_valid = fifo_io_pop_valid;
  assign io_streamOut_payload_0 = fifo_io_pop_payload_0;
  assign io_streamOut_payload_1 = fifo_io_pop_payload_1;
  assign io_streamOut_payload_2 = fifo_io_pop_payload_2;
  assign io_streamOut_payload_3 = fifo_io_pop_payload_3;
  assign io_streamOut_payload_4 = fifo_io_pop_payload_4;
  assign io_streamOut_payload_5 = fifo_io_pop_payload_5;
  assign io_streamOut_payload_6 = fifo_io_pop_payload_6;
  assign io_streamOut_payload_7 = fifo_io_pop_payload_7;
  assign io_streamOut_payload_8 = fifo_io_pop_payload_8;
  assign io_streamOut_payload_9 = fifo_io_pop_payload_9;
  assign io_streamOut_payload_10 = fifo_io_pop_payload_10;
  assign io_streamOut_payload_11 = fifo_io_pop_payload_11;
  assign io_streamOut_payload_12 = fifo_io_pop_payload_12;
  assign io_streamOut_payload_13 = fifo_io_pop_payload_13;
  assign io_streamOut_payload_14 = fifo_io_pop_payload_14;
  assign io_streamOut_payload_15 = fifo_io_pop_payload_15;
  assign io_streamOut_payload_16 = fifo_io_pop_payload_16;
  assign io_streamOut_payload_17 = fifo_io_pop_payload_17;
  assign io_streamOut_payload_18 = fifo_io_pop_payload_18;
  assign io_streamOut_payload_19 = fifo_io_pop_payload_19;
  assign io_streamOut_payload_20 = fifo_io_pop_payload_20;
  assign io_streamOut_payload_21 = fifo_io_pop_payload_21;
  assign io_streamOut_payload_22 = fifo_io_pop_payload_22;
  assign io_streamOut_payload_23 = fifo_io_pop_payload_23;
  assign io_streamOut_payload_24 = fifo_io_pop_payload_24;
  assign reqStream_ready = (5'h01 < fifo_io_availability);
  always @(*) begin
    fifo_io_flush = 1'b0;
    if(io_reArm) begin
      fifo_io_flush = 1'b1;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      readCounter_value <= 1'b0;
      isReading <= 1'b0;
      delayedValid <= 1'b0;
    end else begin
      readCounter_value <= readCounter_valueNext;
      if(when_DoubleBufferStreamer_l38) begin
        isReading <= 1'b1;
      end
      if(reqStream_fire) begin
        if(readCounter_willOverflowIfInc) begin
          isReading <= 1'b0;
        end
      end
      delayedValid <= reqStream_fire;
      if(io_reArm) begin
        isReading <= 1'b0;
        delayedValid <= 1'b0;
      end
    end
  end


endmodule

module StreamDoubleBuffer_3 (
  input  wire          io_streamIn_valid,
  output wire          io_streamIn_ready,
  input  wire [3:0]    io_streamIn_payload_0,
  input  wire [3:0]    io_streamIn_payload_1,
  input  wire [3:0]    io_streamIn_payload_2,
  input  wire [3:0]    io_streamIn_payload_3,
  input  wire [3:0]    io_streamIn_payload_4,
  input  wire [3:0]    io_streamIn_payload_5,
  input  wire [3:0]    io_streamIn_payload_6,
  input  wire [3:0]    io_streamIn_payload_7,
  input  wire [3:0]    io_streamIn_payload_8,
  input  wire [3:0]    io_streamIn_payload_9,
  input  wire [3:0]    io_streamIn_payload_10,
  input  wire [3:0]    io_streamIn_payload_11,
  input  wire [3:0]    io_streamIn_payload_12,
  input  wire [3:0]    io_streamIn_payload_13,
  input  wire [3:0]    io_streamIn_payload_14,
  input  wire [3:0]    io_streamIn_payload_15,
  input  wire [3:0]    io_streamIn_payload_16,
  input  wire [3:0]    io_streamIn_payload_17,
  input  wire [3:0]    io_streamIn_payload_18,
  input  wire [3:0]    io_streamIn_payload_19,
  input  wire [3:0]    io_streamIn_payload_20,
  input  wire [3:0]    io_streamIn_payload_21,
  input  wire [3:0]    io_streamIn_payload_22,
  input  wire [3:0]    io_streamIn_payload_23,
  input  wire [3:0]    io_streamIn_payload_24,
  input  wire [0:0]    io_readAddr,
  output wire [3:0]    io_readData_0,
  output wire [3:0]    io_readData_1,
  output wire [3:0]    io_readData_2,
  output wire [3:0]    io_readData_3,
  output wire [3:0]    io_readData_4,
  output wire [3:0]    io_readData_5,
  output wire [3:0]    io_readData_6,
  output wire [3:0]    io_readData_7,
  output wire [3:0]    io_readData_8,
  output wire [3:0]    io_readData_9,
  output wire [3:0]    io_readData_10,
  output wire [3:0]    io_readData_11,
  output wire [3:0]    io_readData_12,
  output wire [3:0]    io_readData_13,
  output wire [3:0]    io_readData_14,
  output wire [3:0]    io_readData_15,
  output wire [3:0]    io_readData_16,
  output wire [3:0]    io_readData_17,
  output wire [3:0]    io_readData_18,
  output wire [3:0]    io_readData_19,
  output wire [3:0]    io_readData_20,
  output wire [3:0]    io_readData_21,
  output wire [3:0]    io_readData_22,
  output wire [3:0]    io_readData_23,
  output wire [3:0]    io_readData_24,
  input  wire          io_nextTile,
  output wire          io_tileReady,
  input  wire          io_reArm,
  input  wire          io_residentHold,
  input  wire          io_stageRequest,
  output wire          io_loadCanAccept,
  output wire          io_tileFilled,
  output wire          io_refreshSettled,
  input  wire          clk,
  input  wire          reset
);

  reg        [99:0]   memPing_spinal_port0;
  reg        [99:0]   memPong_spinal_port0;
  wire                _zz_memPing_port;
  wire                _zz__zz_readDataPing_0;
  wire                _zz_memPong_port;
  wire                _zz__zz_readDataPong_0;
  wire       [99:0]   _zz_memPing_port_1;
  wire       [99:0]   _zz_memPong_port_1;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 loadBank;
  reg                 computeBank;
  reg                 pingFull;
  reg                 pongFull;
  wire       [3:0]    readDataPing_0;
  wire       [3:0]    readDataPing_1;
  wire       [3:0]    readDataPing_2;
  wire       [3:0]    readDataPing_3;
  wire       [3:0]    readDataPing_4;
  wire       [3:0]    readDataPing_5;
  wire       [3:0]    readDataPing_6;
  wire       [3:0]    readDataPing_7;
  wire       [3:0]    readDataPing_8;
  wire       [3:0]    readDataPing_9;
  wire       [3:0]    readDataPing_10;
  wire       [3:0]    readDataPing_11;
  wire       [3:0]    readDataPing_12;
  wire       [3:0]    readDataPing_13;
  wire       [3:0]    readDataPing_14;
  wire       [3:0]    readDataPing_15;
  wire       [3:0]    readDataPing_16;
  wire       [3:0]    readDataPing_17;
  wire       [3:0]    readDataPing_18;
  wire       [3:0]    readDataPing_19;
  wire       [3:0]    readDataPing_20;
  wire       [3:0]    readDataPing_21;
  wire       [3:0]    readDataPing_22;
  wire       [3:0]    readDataPing_23;
  wire       [3:0]    readDataPing_24;
  wire       [99:0]   _zz_readDataPing_0;
  wire       [3:0]    readDataPong_0;
  wire       [3:0]    readDataPong_1;
  wire       [3:0]    readDataPong_2;
  wire       [3:0]    readDataPong_3;
  wire       [3:0]    readDataPong_4;
  wire       [3:0]    readDataPong_5;
  wire       [3:0]    readDataPong_6;
  wire       [3:0]    readDataPong_7;
  wire       [3:0]    readDataPong_8;
  wire       [3:0]    readDataPong_9;
  wire       [3:0]    readDataPong_10;
  wire       [3:0]    readDataPong_11;
  wire       [3:0]    readDataPong_12;
  wire       [3:0]    readDataPong_13;
  wire       [3:0]    readDataPong_14;
  wire       [3:0]    readDataPong_15;
  wire       [3:0]    readDataPong_16;
  wire       [3:0]    readDataPong_17;
  wire       [3:0]    readDataPong_18;
  wire       [3:0]    readDataPong_19;
  wire       [3:0]    readDataPong_20;
  wire       [3:0]    readDataPong_21;
  wire       [3:0]    readDataPong_22;
  wire       [3:0]    readDataPong_23;
  wire       [3:0]    readDataPong_24;
  wire       [99:0]   _zz_readDataPong_0;
  reg                 computeBankDelayed;
  wire                _zz_io_readData_0;
  reg                 loadCounter_willIncrement;
  wire                loadCounter_willDecrement;
  reg                 loadCounter_willClear;
  wire                loadCounter_willLoad;
  reg        [0:0]    loadCounter_valueNext;
  reg        [0:0]    loadCounter_value;
  wire                loadCounter_willOverflowIfInc;
  wire                loadCounter_willUnderflowIfDec;
  wire                loadCounter_willOverflow;
  wire                loadCounter_willUnderflow;
  wire                currentLoadBankFull;
  wire                loadDone;
  reg                 tileFilled;
  reg                 switchArmed;
  wire                allowFlip;
  wire                when_StreamDoubleBuffer_l114;
  wire                when_StreamDoubleBuffer_l117;
  wire                when_StreamDoubleBuffer_l123;
  wire                when_StreamDoubleBuffer_l125;
  wire                when_StreamDoubleBuffer_l135;
  wire                when_StreamDoubleBuffer_l137;
  wire                when_StreamDoubleBuffer_l142;
  wire                when_StreamDoubleBuffer_l144;
  reg [99:0] memPing [0:1];
  reg [99:0] memPong [0:1];

  assign _zz__zz_readDataPing_0 = 1'b1;
  assign _zz_memPing_port_1 = {io_streamIn_payload_24,{io_streamIn_payload_23,{io_streamIn_payload_22,{io_streamIn_payload_21,{io_streamIn_payload_20,{io_streamIn_payload_19,{io_streamIn_payload_18,{io_streamIn_payload_17,{io_streamIn_payload_16,{io_streamIn_payload_15,{io_streamIn_payload_14,{io_streamIn_payload_13,{io_streamIn_payload_12,{io_streamIn_payload_11,{io_streamIn_payload_10,{io_streamIn_payload_9,{io_streamIn_payload_8,{io_streamIn_payload_7,{io_streamIn_payload_6,{io_streamIn_payload_5,{io_streamIn_payload_4,{io_streamIn_payload_3,{io_streamIn_payload_2,{io_streamIn_payload_1,io_streamIn_payload_0}}}}}}}}}}}}}}}}}}}}}}}};
  assign _zz__zz_readDataPong_0 = 1'b1;
  assign _zz_memPong_port_1 = {io_streamIn_payload_24,{io_streamIn_payload_23,{io_streamIn_payload_22,{io_streamIn_payload_21,{io_streamIn_payload_20,{io_streamIn_payload_19,{io_streamIn_payload_18,{io_streamIn_payload_17,{io_streamIn_payload_16,{io_streamIn_payload_15,{io_streamIn_payload_14,{io_streamIn_payload_13,{io_streamIn_payload_12,{io_streamIn_payload_11,{io_streamIn_payload_10,{io_streamIn_payload_9,{io_streamIn_payload_8,{io_streamIn_payload_7,{io_streamIn_payload_6,{io_streamIn_payload_5,{io_streamIn_payload_4,{io_streamIn_payload_3,{io_streamIn_payload_2,{io_streamIn_payload_1,io_streamIn_payload_0}}}}}}}}}}}}}}}}}}}}}}}};
  always @(posedge clk) begin
    if(_zz__zz_readDataPing_0) begin
      memPing_spinal_port0 <= memPing[io_readAddr];
    end
  end

  always @(posedge clk) begin
    if(_zz_2) begin
      memPing[loadCounter_value] <= _zz_memPing_port_1;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_readDataPong_0) begin
      memPong_spinal_port0 <= memPong[io_readAddr];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      memPong[loadCounter_value] <= _zz_memPong_port_1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      if(!when_StreamDoubleBuffer_l125) begin
        _zz_1 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      if(when_StreamDoubleBuffer_l125) begin
        _zz_2 = 1'b1;
      end
    end
  end

  assign io_tileReady = ((computeBank == 1'b0) ? pingFull : pongFull);
  assign _zz_readDataPing_0 = memPing_spinal_port0;
  assign readDataPing_0 = _zz_readDataPing_0[3 : 0];
  assign readDataPing_1 = _zz_readDataPing_0[7 : 4];
  assign readDataPing_2 = _zz_readDataPing_0[11 : 8];
  assign readDataPing_3 = _zz_readDataPing_0[15 : 12];
  assign readDataPing_4 = _zz_readDataPing_0[19 : 16];
  assign readDataPing_5 = _zz_readDataPing_0[23 : 20];
  assign readDataPing_6 = _zz_readDataPing_0[27 : 24];
  assign readDataPing_7 = _zz_readDataPing_0[31 : 28];
  assign readDataPing_8 = _zz_readDataPing_0[35 : 32];
  assign readDataPing_9 = _zz_readDataPing_0[39 : 36];
  assign readDataPing_10 = _zz_readDataPing_0[43 : 40];
  assign readDataPing_11 = _zz_readDataPing_0[47 : 44];
  assign readDataPing_12 = _zz_readDataPing_0[51 : 48];
  assign readDataPing_13 = _zz_readDataPing_0[55 : 52];
  assign readDataPing_14 = _zz_readDataPing_0[59 : 56];
  assign readDataPing_15 = _zz_readDataPing_0[63 : 60];
  assign readDataPing_16 = _zz_readDataPing_0[67 : 64];
  assign readDataPing_17 = _zz_readDataPing_0[71 : 68];
  assign readDataPing_18 = _zz_readDataPing_0[75 : 72];
  assign readDataPing_19 = _zz_readDataPing_0[79 : 76];
  assign readDataPing_20 = _zz_readDataPing_0[83 : 80];
  assign readDataPing_21 = _zz_readDataPing_0[87 : 84];
  assign readDataPing_22 = _zz_readDataPing_0[91 : 88];
  assign readDataPing_23 = _zz_readDataPing_0[95 : 92];
  assign readDataPing_24 = _zz_readDataPing_0[99 : 96];
  assign _zz_readDataPong_0 = memPong_spinal_port0;
  assign readDataPong_0 = _zz_readDataPong_0[3 : 0];
  assign readDataPong_1 = _zz_readDataPong_0[7 : 4];
  assign readDataPong_2 = _zz_readDataPong_0[11 : 8];
  assign readDataPong_3 = _zz_readDataPong_0[15 : 12];
  assign readDataPong_4 = _zz_readDataPong_0[19 : 16];
  assign readDataPong_5 = _zz_readDataPong_0[23 : 20];
  assign readDataPong_6 = _zz_readDataPong_0[27 : 24];
  assign readDataPong_7 = _zz_readDataPong_0[31 : 28];
  assign readDataPong_8 = _zz_readDataPong_0[35 : 32];
  assign readDataPong_9 = _zz_readDataPong_0[39 : 36];
  assign readDataPong_10 = _zz_readDataPong_0[43 : 40];
  assign readDataPong_11 = _zz_readDataPong_0[47 : 44];
  assign readDataPong_12 = _zz_readDataPong_0[51 : 48];
  assign readDataPong_13 = _zz_readDataPong_0[55 : 52];
  assign readDataPong_14 = _zz_readDataPong_0[59 : 56];
  assign readDataPong_15 = _zz_readDataPong_0[63 : 60];
  assign readDataPong_16 = _zz_readDataPong_0[67 : 64];
  assign readDataPong_17 = _zz_readDataPong_0[71 : 68];
  assign readDataPong_18 = _zz_readDataPong_0[75 : 72];
  assign readDataPong_19 = _zz_readDataPong_0[79 : 76];
  assign readDataPong_20 = _zz_readDataPong_0[83 : 80];
  assign readDataPong_21 = _zz_readDataPong_0[87 : 84];
  assign readDataPong_22 = _zz_readDataPong_0[91 : 88];
  assign readDataPong_23 = _zz_readDataPong_0[95 : 92];
  assign readDataPong_24 = _zz_readDataPong_0[99 : 96];
  assign _zz_io_readData_0 = (computeBankDelayed == 1'b0);
  assign io_readData_0 = (_zz_io_readData_0 ? readDataPing_0 : readDataPong_0);
  assign io_readData_1 = (_zz_io_readData_0 ? readDataPing_1 : readDataPong_1);
  assign io_readData_2 = (_zz_io_readData_0 ? readDataPing_2 : readDataPong_2);
  assign io_readData_3 = (_zz_io_readData_0 ? readDataPing_3 : readDataPong_3);
  assign io_readData_4 = (_zz_io_readData_0 ? readDataPing_4 : readDataPong_4);
  assign io_readData_5 = (_zz_io_readData_0 ? readDataPing_5 : readDataPong_5);
  assign io_readData_6 = (_zz_io_readData_0 ? readDataPing_6 : readDataPong_6);
  assign io_readData_7 = (_zz_io_readData_0 ? readDataPing_7 : readDataPong_7);
  assign io_readData_8 = (_zz_io_readData_0 ? readDataPing_8 : readDataPong_8);
  assign io_readData_9 = (_zz_io_readData_0 ? readDataPing_9 : readDataPong_9);
  assign io_readData_10 = (_zz_io_readData_0 ? readDataPing_10 : readDataPong_10);
  assign io_readData_11 = (_zz_io_readData_0 ? readDataPing_11 : readDataPong_11);
  assign io_readData_12 = (_zz_io_readData_0 ? readDataPing_12 : readDataPong_12);
  assign io_readData_13 = (_zz_io_readData_0 ? readDataPing_13 : readDataPong_13);
  assign io_readData_14 = (_zz_io_readData_0 ? readDataPing_14 : readDataPong_14);
  assign io_readData_15 = (_zz_io_readData_0 ? readDataPing_15 : readDataPong_15);
  assign io_readData_16 = (_zz_io_readData_0 ? readDataPing_16 : readDataPong_16);
  assign io_readData_17 = (_zz_io_readData_0 ? readDataPing_17 : readDataPong_17);
  assign io_readData_18 = (_zz_io_readData_0 ? readDataPing_18 : readDataPong_18);
  assign io_readData_19 = (_zz_io_readData_0 ? readDataPing_19 : readDataPong_19);
  assign io_readData_20 = (_zz_io_readData_0 ? readDataPing_20 : readDataPong_20);
  assign io_readData_21 = (_zz_io_readData_0 ? readDataPing_21 : readDataPong_21);
  assign io_readData_22 = (_zz_io_readData_0 ? readDataPing_22 : readDataPong_22);
  assign io_readData_23 = (_zz_io_readData_0 ? readDataPing_23 : readDataPong_23);
  assign io_readData_24 = (_zz_io_readData_0 ? readDataPing_24 : readDataPong_24);
  always @(*) begin
    loadCounter_willIncrement = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      loadCounter_willIncrement = 1'b1;
    end
  end

  assign loadCounter_willDecrement = 1'b0;
  always @(*) begin
    loadCounter_willClear = 1'b0;
    if(io_reArm) begin
      loadCounter_willClear = 1'b1;
    end
  end

  assign loadCounter_willLoad = 1'b0;
  assign loadCounter_willOverflowIfInc = (loadCounter_value == 1'b1);
  assign loadCounter_willUnderflowIfDec = (loadCounter_value == 1'b0);
  assign loadCounter_willOverflow = (loadCounter_willOverflowIfInc && loadCounter_willIncrement);
  always @(*) begin
    loadCounter_valueNext = (loadCounter_value + loadCounter_willIncrement);
    if(loadCounter_willClear) begin
      loadCounter_valueNext = 1'b0;
    end
  end

  assign loadCounter_willUnderflow = (loadCounter_willUnderflowIfDec && loadCounter_willDecrement);
  assign currentLoadBankFull = ((loadBank == 1'b0) ? pingFull : pongFull);
  assign io_streamIn_ready = (! currentLoadBankFull);
  assign io_loadCanAccept = (! currentLoadBankFull);
  assign loadDone = ((io_streamIn_valid && (! currentLoadBankFull)) && loadCounter_willOverflowIfInc);
  assign io_tileFilled = tileFilled;
  assign allowFlip = ((! io_residentHold) || switchArmed);
  assign when_StreamDoubleBuffer_l114 = (io_stageRequest && tileFilled);
  assign when_StreamDoubleBuffer_l117 = (io_nextTile && allowFlip);
  assign io_refreshSettled = ((io_nextTile && allowFlip) && switchArmed);
  assign when_StreamDoubleBuffer_l123 = (io_streamIn_valid && (! currentLoadBankFull));
  assign when_StreamDoubleBuffer_l125 = (loadBank == 1'b0);
  assign when_StreamDoubleBuffer_l135 = ((io_nextTile && allowFlip) && (computeBank == 1'b0));
  assign when_StreamDoubleBuffer_l137 = (loadDone && (loadBank == 1'b0));
  assign when_StreamDoubleBuffer_l142 = ((io_nextTile && allowFlip) && (computeBank == 1'b1));
  assign when_StreamDoubleBuffer_l144 = (loadDone && (loadBank == 1'b1));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      loadBank <= 1'b0;
      computeBank <= 1'b0;
      pingFull <= 1'b0;
      pongFull <= 1'b0;
      loadCounter_value <= 1'b0;
      tileFilled <= 1'b0;
      switchArmed <= 1'b0;
    end else begin
      loadCounter_value <= loadCounter_valueNext;
      tileFilled <= loadDone;
      if(when_StreamDoubleBuffer_l114) begin
        switchArmed <= 1'b1;
      end
      if(when_StreamDoubleBuffer_l117) begin
        computeBank <= (! computeBank);
        switchArmed <= 1'b0;
      end
      if(when_StreamDoubleBuffer_l135) begin
        pingFull <= 1'b0;
      end else begin
        if(when_StreamDoubleBuffer_l137) begin
          pingFull <= 1'b1;
        end
      end
      if(when_StreamDoubleBuffer_l142) begin
        pongFull <= 1'b0;
      end else begin
        if(when_StreamDoubleBuffer_l144) begin
          pongFull <= 1'b1;
        end
      end
      if(loadDone) begin
        loadBank <= (! loadBank);
      end
      if(io_reArm) begin
        loadBank <= 1'b0;
        computeBank <= 1'b0;
        pingFull <= 1'b0;
        pongFull <= 1'b0;
        switchArmed <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    computeBankDelayed <= computeBank;
  end


endmodule

module DMAReader_1 (
  input  wire          io_cmd_valid,
  output wire          io_cmd_ready,
  input  wire [31:0]   io_cmd_payload_address,
  input  wire [15:0]   io_cmd_payload_length,
  output wire          io_axiMaster_ar_valid,
  input  wire          io_axiMaster_ar_ready,
  output wire [31:0]   io_axiMaster_ar_payload_addr,
  output wire [0:0]    io_axiMaster_ar_payload_id,
  output wire [3:0]    io_axiMaster_ar_payload_region,
  output wire [7:0]    io_axiMaster_ar_payload_len,
  output wire [2:0]    io_axiMaster_ar_payload_size,
  output wire [1:0]    io_axiMaster_ar_payload_burst,
  output wire [0:0]    io_axiMaster_ar_payload_lock,
  output wire [3:0]    io_axiMaster_ar_payload_cache,
  output wire [3:0]    io_axiMaster_ar_payload_qos,
  output wire [2:0]    io_axiMaster_ar_payload_prot,
  input  wire          io_axiMaster_r_valid,
  output wire          io_axiMaster_r_ready,
  input  wire [63:0]   io_axiMaster_r_payload_data,
  input  wire [0:0]    io_axiMaster_r_payload_id,
  input  wire [1:0]    io_axiMaster_r_payload_resp,
  input  wire          io_axiMaster_r_payload_last,
  output wire          io_outStream_stream_valid,
  input  wire          io_outStream_stream_ready,
  output wire [3:0]    io_outStream_stream_payload_0,
  output wire [3:0]    io_outStream_stream_payload_1,
  output wire [3:0]    io_outStream_stream_payload_2,
  output wire [3:0]    io_outStream_stream_payload_3,
  output wire [3:0]    io_outStream_stream_payload_4,
  output wire [3:0]    io_outStream_stream_payload_5,
  output wire [3:0]    io_outStream_stream_payload_6,
  output wire [3:0]    io_outStream_stream_payload_7,
  output wire [3:0]    io_outStream_stream_payload_8,
  output wire [3:0]    io_outStream_stream_payload_9,
  output wire [3:0]    io_outStream_stream_payload_10,
  output wire [3:0]    io_outStream_stream_payload_11,
  output wire [3:0]    io_outStream_stream_payload_12,
  output wire [3:0]    io_outStream_stream_payload_13,
  output wire [3:0]    io_outStream_stream_payload_14,
  output wire [3:0]    io_outStream_stream_payload_15,
  output wire [3:0]    io_outStream_stream_payload_16,
  output wire [3:0]    io_outStream_stream_payload_17,
  output wire [3:0]    io_outStream_stream_payload_18,
  output wire [3:0]    io_outStream_stream_payload_19,
  output wire [3:0]    io_outStream_stream_payload_20,
  output wire [3:0]    io_outStream_stream_payload_21,
  output wire [3:0]    io_outStream_stream_payload_22,
  output wire [3:0]    io_outStream_stream_payload_23,
  output wire [3:0]    io_outStream_stream_payload_24,
  input  wire          clk,
  input  wire          reset
);

  wire                repackOp_9_io_c_stream_ready;
  wire                repackOp_8_io_a_stream_ready;
  wire                repackOp_8_io_c_stream_valid;
  wire       [3:0]    repackOp_8_io_c_stream_payload_0;
  wire                repackOp_8_io_isEmpty;
  wire                repackOp_9_io_a_stream_ready;
  wire                repackOp_9_io_c_stream_valid;
  wire       [3:0]    repackOp_9_io_c_stream_payload_0;
  wire       [3:0]    repackOp_9_io_c_stream_payload_1;
  wire       [3:0]    repackOp_9_io_c_stream_payload_2;
  wire       [3:0]    repackOp_9_io_c_stream_payload_3;
  wire       [3:0]    repackOp_9_io_c_stream_payload_4;
  wire       [3:0]    repackOp_9_io_c_stream_payload_5;
  wire       [3:0]    repackOp_9_io_c_stream_payload_6;
  wire       [3:0]    repackOp_9_io_c_stream_payload_7;
  wire       [3:0]    repackOp_9_io_c_stream_payload_8;
  wire       [3:0]    repackOp_9_io_c_stream_payload_9;
  wire       [3:0]    repackOp_9_io_c_stream_payload_10;
  wire       [3:0]    repackOp_9_io_c_stream_payload_11;
  wire       [3:0]    repackOp_9_io_c_stream_payload_12;
  wire       [3:0]    repackOp_9_io_c_stream_payload_13;
  wire       [3:0]    repackOp_9_io_c_stream_payload_14;
  wire       [3:0]    repackOp_9_io_c_stream_payload_15;
  wire       [3:0]    repackOp_9_io_c_stream_payload_16;
  wire       [3:0]    repackOp_9_io_c_stream_payload_17;
  wire       [3:0]    repackOp_9_io_c_stream_payload_18;
  wire       [3:0]    repackOp_9_io_c_stream_payload_19;
  wire       [3:0]    repackOp_9_io_c_stream_payload_20;
  wire       [3:0]    repackOp_9_io_c_stream_payload_21;
  wire       [3:0]    repackOp_9_io_c_stream_payload_22;
  wire       [3:0]    repackOp_9_io_c_stream_payload_23;
  wire       [3:0]    repackOp_9_io_c_stream_payload_24;
  wire                repackOp_9_io_isEmpty;
  wire       [16:0]   _zz_remaining;
  wire       [1:0]    _zz_remaining_1;
  wire       [12:0]   _zz_bytesToBoundary;
  wire       [9:0]    _zz_beatsToBoundary;
  wire       [15:0]   _zz__zz_burstLen_3;
  wire       [15:0]   _zz__zz_burstLen_3_1;
  wire       [15:0]   _zz__zz_burstLen_3_2;
  wire       [16:0]   _zz_io_axiMaster_ar_payload_len;
  wire       [31:0]   _zz_addrReg;
  wire       [19:0]   _zz_addrReg_1;
  reg        [16:0]   remaining;
  reg        [8:0]    burstRemain;
  reg        [31:0]   addrReg;
  wire                baseReady;
  wire                gearboxEmpty;
  wire                io_cmd_fire;
  wire       [11:0]   offsetInPage;
  wire       [12:0]   bytesToBoundary;
  wire       [15:0]   beatsToBoundary;
  wire       [16:0]   _zz_burstLen;
  wire       [16:0]   _zz_burstLen_1;
  wire       [0:0]    _zz_burstLen_2;
  wire       [16:0]   _zz_burstLen_3;
  wire       [16:0]   burstLen;
  wire                io_axiMaster_ar_fire;
  wire                axiRawTensor_stream_valid;
  wire                axiRawTensor_stream_ready;
  wire       [3:0]    axiRawTensor_stream_payload_0;
  wire       [3:0]    axiRawTensor_stream_payload_1;
  wire       [3:0]    axiRawTensor_stream_payload_2;
  wire       [3:0]    axiRawTensor_stream_payload_3;
  wire       [3:0]    axiRawTensor_stream_payload_4;
  wire       [3:0]    axiRawTensor_stream_payload_5;
  wire       [3:0]    axiRawTensor_stream_payload_6;
  wire       [3:0]    axiRawTensor_stream_payload_7;
  wire       [3:0]    axiRawTensor_stream_payload_8;
  wire       [3:0]    axiRawTensor_stream_payload_9;
  wire       [3:0]    axiRawTensor_stream_payload_10;
  wire       [3:0]    axiRawTensor_stream_payload_11;
  wire       [3:0]    axiRawTensor_stream_payload_12;
  wire       [3:0]    axiRawTensor_stream_payload_13;
  wire       [3:0]    axiRawTensor_stream_payload_14;
  wire       [3:0]    axiRawTensor_stream_payload_15;
  wire                when_DMAReader_l115;
  reg        [6:0]    _zz_trimmedStream_stream_valid;
  wire                _zz_trimmedStream_stream_valid_1;
  wire                trimmedStream_stream_valid;
  wire                trimmedStream_stream_ready;
  wire       [3:0]    trimmedStream_stream_payload_0;
  wire       [3:0]    trimmedStream_stream_payload_1;
  wire       [3:0]    trimmedStream_stream_payload_2;
  wire       [3:0]    trimmedStream_stream_payload_3;
  wire       [3:0]    trimmedStream_stream_payload_4;
  wire       [3:0]    trimmedStream_stream_payload_5;
  wire       [3:0]    trimmedStream_stream_payload_6;
  wire       [3:0]    trimmedStream_stream_payload_7;
  wire       [3:0]    trimmedStream_stream_payload_8;
  wire       [3:0]    trimmedStream_stream_payload_9;
  wire       [3:0]    trimmedStream_stream_payload_10;
  wire       [3:0]    trimmedStream_stream_payload_11;
  wire       [3:0]    trimmedStream_stream_payload_12;
  wire       [3:0]    trimmedStream_stream_payload_13;
  wire       [3:0]    trimmedStream_stream_payload_14;
  wire       [3:0]    trimmedStream_stream_payload_15;
  wire       [3:0]    trimmedStream_stream_payload_16;
  wire       [3:0]    trimmedStream_stream_payload_17;
  wire       [3:0]    trimmedStream_stream_payload_18;
  wire       [3:0]    trimmedStream_stream_payload_19;
  wire       [3:0]    trimmedStream_stream_payload_20;
  wire       [3:0]    trimmedStream_stream_payload_21;
  wire       [3:0]    trimmedStream_stream_payload_22;
  wire       [3:0]    trimmedStream_stream_payload_23;
  wire       [3:0]    trimmedStream_stream_payload_24;
  wire                trimmedStream_stream_fire;

  assign _zz_remaining_1 = {1'b0,1'b1};
  assign _zz_remaining = {15'd0, _zz_remaining_1};
  assign _zz_bytesToBoundary = {1'd0, offsetInPage};
  assign _zz_beatsToBoundary = (bytesToBoundary >>> 2'd3);
  assign _zz__zz_burstLen_3 = ((beatsToBoundary < _zz__zz_burstLen_3_1) ? _zz__zz_burstLen_3_2 : beatsToBoundary);
  assign _zz__zz_burstLen_3_1 = {15'd0, _zz_burstLen_2};
  assign _zz__zz_burstLen_3_2 = {15'd0, _zz_burstLen_2};
  assign _zz_io_axiMaster_ar_payload_len = (burstLen - 17'h00001);
  assign _zz_addrReg_1 = ({3'd0,burstLen} <<< 2'd3);
  assign _zz_addrReg = {12'd0, _zz_addrReg_1};
  RepackOp_1 repackOp_8 (
    .io_a_stream_valid      (axiRawTensor_stream_valid            ), //i
    .io_a_stream_ready      (repackOp_8_io_a_stream_ready         ), //o
    .io_a_stream_payload_0  (axiRawTensor_stream_payload_0[3:0]   ), //i
    .io_a_stream_payload_1  (axiRawTensor_stream_payload_1[3:0]   ), //i
    .io_a_stream_payload_2  (axiRawTensor_stream_payload_2[3:0]   ), //i
    .io_a_stream_payload_3  (axiRawTensor_stream_payload_3[3:0]   ), //i
    .io_a_stream_payload_4  (axiRawTensor_stream_payload_4[3:0]   ), //i
    .io_a_stream_payload_5  (axiRawTensor_stream_payload_5[3:0]   ), //i
    .io_a_stream_payload_6  (axiRawTensor_stream_payload_6[3:0]   ), //i
    .io_a_stream_payload_7  (axiRawTensor_stream_payload_7[3:0]   ), //i
    .io_a_stream_payload_8  (axiRawTensor_stream_payload_8[3:0]   ), //i
    .io_a_stream_payload_9  (axiRawTensor_stream_payload_9[3:0]   ), //i
    .io_a_stream_payload_10 (axiRawTensor_stream_payload_10[3:0]  ), //i
    .io_a_stream_payload_11 (axiRawTensor_stream_payload_11[3:0]  ), //i
    .io_a_stream_payload_12 (axiRawTensor_stream_payload_12[3:0]  ), //i
    .io_a_stream_payload_13 (axiRawTensor_stream_payload_13[3:0]  ), //i
    .io_a_stream_payload_14 (axiRawTensor_stream_payload_14[3:0]  ), //i
    .io_a_stream_payload_15 (axiRawTensor_stream_payload_15[3:0]  ), //i
    .io_c_stream_valid      (repackOp_8_io_c_stream_valid         ), //o
    .io_c_stream_ready      (repackOp_9_io_a_stream_ready         ), //i
    .io_c_stream_payload_0  (repackOp_8_io_c_stream_payload_0[3:0]), //o
    .io_reArm               (io_cmd_fire                          ), //i
    .io_isEmpty             (repackOp_8_io_isEmpty                ), //o
    .clk                    (clk                                  ), //i
    .reset                  (reset                                )  //i
  );
  RepackOp_2 repackOp_9 (
    .io_a_stream_valid      (repackOp_8_io_c_stream_valid          ), //i
    .io_a_stream_ready      (repackOp_9_io_a_stream_ready          ), //o
    .io_a_stream_payload_0  (repackOp_8_io_c_stream_payload_0[3:0] ), //i
    .io_c_stream_valid      (repackOp_9_io_c_stream_valid          ), //o
    .io_c_stream_ready      (repackOp_9_io_c_stream_ready          ), //i
    .io_c_stream_payload_0  (repackOp_9_io_c_stream_payload_0[3:0] ), //o
    .io_c_stream_payload_1  (repackOp_9_io_c_stream_payload_1[3:0] ), //o
    .io_c_stream_payload_2  (repackOp_9_io_c_stream_payload_2[3:0] ), //o
    .io_c_stream_payload_3  (repackOp_9_io_c_stream_payload_3[3:0] ), //o
    .io_c_stream_payload_4  (repackOp_9_io_c_stream_payload_4[3:0] ), //o
    .io_c_stream_payload_5  (repackOp_9_io_c_stream_payload_5[3:0] ), //o
    .io_c_stream_payload_6  (repackOp_9_io_c_stream_payload_6[3:0] ), //o
    .io_c_stream_payload_7  (repackOp_9_io_c_stream_payload_7[3:0] ), //o
    .io_c_stream_payload_8  (repackOp_9_io_c_stream_payload_8[3:0] ), //o
    .io_c_stream_payload_9  (repackOp_9_io_c_stream_payload_9[3:0] ), //o
    .io_c_stream_payload_10 (repackOp_9_io_c_stream_payload_10[3:0]), //o
    .io_c_stream_payload_11 (repackOp_9_io_c_stream_payload_11[3:0]), //o
    .io_c_stream_payload_12 (repackOp_9_io_c_stream_payload_12[3:0]), //o
    .io_c_stream_payload_13 (repackOp_9_io_c_stream_payload_13[3:0]), //o
    .io_c_stream_payload_14 (repackOp_9_io_c_stream_payload_14[3:0]), //o
    .io_c_stream_payload_15 (repackOp_9_io_c_stream_payload_15[3:0]), //o
    .io_c_stream_payload_16 (repackOp_9_io_c_stream_payload_16[3:0]), //o
    .io_c_stream_payload_17 (repackOp_9_io_c_stream_payload_17[3:0]), //o
    .io_c_stream_payload_18 (repackOp_9_io_c_stream_payload_18[3:0]), //o
    .io_c_stream_payload_19 (repackOp_9_io_c_stream_payload_19[3:0]), //o
    .io_c_stream_payload_20 (repackOp_9_io_c_stream_payload_20[3:0]), //o
    .io_c_stream_payload_21 (repackOp_9_io_c_stream_payload_21[3:0]), //o
    .io_c_stream_payload_22 (repackOp_9_io_c_stream_payload_22[3:0]), //o
    .io_c_stream_payload_23 (repackOp_9_io_c_stream_payload_23[3:0]), //o
    .io_c_stream_payload_24 (repackOp_9_io_c_stream_payload_24[3:0]), //o
    .io_reArm               (io_cmd_fire                           ), //i
    .io_isEmpty             (repackOp_9_io_isEmpty                 ), //o
    .clk                    (clk                                   ), //i
    .reset                  (reset                                 )  //i
  );
  assign baseReady = ((remaining == 17'h0) && (burstRemain == 9'h0));
  assign io_cmd_ready = (baseReady && gearboxEmpty);
  assign io_cmd_fire = (io_cmd_valid && io_cmd_ready);
  assign offsetInPage = addrReg[11 : 0];
  assign bytesToBoundary = (13'h1000 - _zz_bytesToBoundary);
  assign beatsToBoundary = {6'd0, _zz_beatsToBoundary};
  assign _zz_burstLen = 17'h00100;
  assign _zz_burstLen_1 = ((remaining < _zz_burstLen) ? remaining : _zz_burstLen);
  assign _zz_burstLen_2 = 1'b1;
  assign _zz_burstLen_3 = {1'd0, _zz__zz_burstLen_3};
  assign burstLen = ((_zz_burstLen_1 < _zz_burstLen_3) ? _zz_burstLen_1 : _zz_burstLen_3);
  assign io_axiMaster_ar_valid = ((remaining != 17'h0) && (burstRemain == 9'h0));
  assign io_axiMaster_ar_payload_addr = addrReg;
  assign io_axiMaster_ar_payload_len = _zz_io_axiMaster_ar_payload_len[7:0];
  assign io_axiMaster_ar_payload_size = 3'b011;
  assign io_axiMaster_ar_payload_burst = 2'b01;
  assign io_axiMaster_ar_fire = (io_axiMaster_ar_valid && io_axiMaster_ar_ready);
  assign io_axiMaster_ar_payload_id = 1'b0;
  assign io_axiMaster_ar_payload_prot = 3'b000;
  assign io_axiMaster_ar_payload_cache = 4'b0000;
  assign io_axiMaster_ar_payload_lock = 1'b0;
  assign io_axiMaster_ar_payload_qos = 4'b0000;
  assign io_axiMaster_ar_payload_region = 4'b0000;
  assign axiRawTensor_stream_valid = (io_axiMaster_r_valid && (burstRemain != 9'h0));
  assign io_axiMaster_r_ready = axiRawTensor_stream_ready;
  assign when_DMAReader_l115 = (io_axiMaster_r_valid && io_axiMaster_r_ready);
  assign axiRawTensor_stream_payload_0 = io_axiMaster_r_payload_data[3 : 0];
  assign axiRawTensor_stream_payload_1 = io_axiMaster_r_payload_data[7 : 4];
  assign axiRawTensor_stream_payload_2 = io_axiMaster_r_payload_data[11 : 8];
  assign axiRawTensor_stream_payload_3 = io_axiMaster_r_payload_data[15 : 12];
  assign axiRawTensor_stream_payload_4 = io_axiMaster_r_payload_data[19 : 16];
  assign axiRawTensor_stream_payload_5 = io_axiMaster_r_payload_data[23 : 20];
  assign axiRawTensor_stream_payload_6 = io_axiMaster_r_payload_data[27 : 24];
  assign axiRawTensor_stream_payload_7 = io_axiMaster_r_payload_data[31 : 28];
  assign axiRawTensor_stream_payload_8 = io_axiMaster_r_payload_data[35 : 32];
  assign axiRawTensor_stream_payload_9 = io_axiMaster_r_payload_data[39 : 36];
  assign axiRawTensor_stream_payload_10 = io_axiMaster_r_payload_data[43 : 40];
  assign axiRawTensor_stream_payload_11 = io_axiMaster_r_payload_data[47 : 44];
  assign axiRawTensor_stream_payload_12 = io_axiMaster_r_payload_data[51 : 48];
  assign axiRawTensor_stream_payload_13 = io_axiMaster_r_payload_data[55 : 52];
  assign axiRawTensor_stream_payload_14 = io_axiMaster_r_payload_data[59 : 56];
  assign axiRawTensor_stream_payload_15 = io_axiMaster_r_payload_data[63 : 60];
  assign axiRawTensor_stream_ready = repackOp_8_io_a_stream_ready;
  assign gearboxEmpty = (repackOp_8_io_isEmpty && repackOp_9_io_isEmpty);
  assign _zz_trimmedStream_stream_valid_1 = (7'h32 <= _zz_trimmedStream_stream_valid);
  assign trimmedStream_stream_valid = (repackOp_9_io_c_stream_valid && (! _zz_trimmedStream_stream_valid_1));
  assign repackOp_9_io_c_stream_ready = (io_outStream_stream_ready || _zz_trimmedStream_stream_valid_1);
  assign trimmedStream_stream_fire = (trimmedStream_stream_valid && trimmedStream_stream_ready);
  assign trimmedStream_stream_payload_0 = repackOp_9_io_c_stream_payload_0;
  assign trimmedStream_stream_payload_1 = repackOp_9_io_c_stream_payload_1;
  assign trimmedStream_stream_payload_2 = repackOp_9_io_c_stream_payload_2;
  assign trimmedStream_stream_payload_3 = repackOp_9_io_c_stream_payload_3;
  assign trimmedStream_stream_payload_4 = repackOp_9_io_c_stream_payload_4;
  assign trimmedStream_stream_payload_5 = repackOp_9_io_c_stream_payload_5;
  assign trimmedStream_stream_payload_6 = repackOp_9_io_c_stream_payload_6;
  assign trimmedStream_stream_payload_7 = repackOp_9_io_c_stream_payload_7;
  assign trimmedStream_stream_payload_8 = repackOp_9_io_c_stream_payload_8;
  assign trimmedStream_stream_payload_9 = repackOp_9_io_c_stream_payload_9;
  assign trimmedStream_stream_payload_10 = repackOp_9_io_c_stream_payload_10;
  assign trimmedStream_stream_payload_11 = repackOp_9_io_c_stream_payload_11;
  assign trimmedStream_stream_payload_12 = repackOp_9_io_c_stream_payload_12;
  assign trimmedStream_stream_payload_13 = repackOp_9_io_c_stream_payload_13;
  assign trimmedStream_stream_payload_14 = repackOp_9_io_c_stream_payload_14;
  assign trimmedStream_stream_payload_15 = repackOp_9_io_c_stream_payload_15;
  assign trimmedStream_stream_payload_16 = repackOp_9_io_c_stream_payload_16;
  assign trimmedStream_stream_payload_17 = repackOp_9_io_c_stream_payload_17;
  assign trimmedStream_stream_payload_18 = repackOp_9_io_c_stream_payload_18;
  assign trimmedStream_stream_payload_19 = repackOp_9_io_c_stream_payload_19;
  assign trimmedStream_stream_payload_20 = repackOp_9_io_c_stream_payload_20;
  assign trimmedStream_stream_payload_21 = repackOp_9_io_c_stream_payload_21;
  assign trimmedStream_stream_payload_22 = repackOp_9_io_c_stream_payload_22;
  assign trimmedStream_stream_payload_23 = repackOp_9_io_c_stream_payload_23;
  assign trimmedStream_stream_payload_24 = repackOp_9_io_c_stream_payload_24;
  assign io_outStream_stream_valid = trimmedStream_stream_valid;
  assign trimmedStream_stream_ready = io_outStream_stream_ready;
  assign io_outStream_stream_payload_0 = trimmedStream_stream_payload_0;
  assign io_outStream_stream_payload_1 = trimmedStream_stream_payload_1;
  assign io_outStream_stream_payload_2 = trimmedStream_stream_payload_2;
  assign io_outStream_stream_payload_3 = trimmedStream_stream_payload_3;
  assign io_outStream_stream_payload_4 = trimmedStream_stream_payload_4;
  assign io_outStream_stream_payload_5 = trimmedStream_stream_payload_5;
  assign io_outStream_stream_payload_6 = trimmedStream_stream_payload_6;
  assign io_outStream_stream_payload_7 = trimmedStream_stream_payload_7;
  assign io_outStream_stream_payload_8 = trimmedStream_stream_payload_8;
  assign io_outStream_stream_payload_9 = trimmedStream_stream_payload_9;
  assign io_outStream_stream_payload_10 = trimmedStream_stream_payload_10;
  assign io_outStream_stream_payload_11 = trimmedStream_stream_payload_11;
  assign io_outStream_stream_payload_12 = trimmedStream_stream_payload_12;
  assign io_outStream_stream_payload_13 = trimmedStream_stream_payload_13;
  assign io_outStream_stream_payload_14 = trimmedStream_stream_payload_14;
  assign io_outStream_stream_payload_15 = trimmedStream_stream_payload_15;
  assign io_outStream_stream_payload_16 = trimmedStream_stream_payload_16;
  assign io_outStream_stream_payload_17 = trimmedStream_stream_payload_17;
  assign io_outStream_stream_payload_18 = trimmedStream_stream_payload_18;
  assign io_outStream_stream_payload_19 = trimmedStream_stream_payload_19;
  assign io_outStream_stream_payload_20 = trimmedStream_stream_payload_20;
  assign io_outStream_stream_payload_21 = trimmedStream_stream_payload_21;
  assign io_outStream_stream_payload_22 = trimmedStream_stream_payload_22;
  assign io_outStream_stream_payload_23 = trimmedStream_stream_payload_23;
  assign io_outStream_stream_payload_24 = trimmedStream_stream_payload_24;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      remaining <= 17'h0;
      burstRemain <= 9'h0;
      addrReg <= 32'h0;
      _zz_trimmedStream_stream_valid <= 7'h0;
    end else begin
      if(io_cmd_fire) begin
        addrReg <= io_cmd_payload_address;
        remaining <= ({1'b0,io_cmd_payload_length} + _zz_remaining);
      end
      if(io_axiMaster_ar_fire) begin
        addrReg <= (addrReg + _zz_addrReg);
        remaining <= (remaining - burstLen);
        burstRemain <= burstLen[8:0];
      end
      if(when_DMAReader_l115) begin
        burstRemain <= (burstRemain - 9'h001);
      end
      if(io_cmd_fire) begin
        _zz_trimmedStream_stream_valid <= 7'h0;
      end
      if(trimmedStream_stream_fire) begin
        _zz_trimmedStream_stream_valid <= (_zz_trimmedStream_stream_valid + 7'h19);
      end
    end
  end


endmodule

module DoubleBufferStreamer (
  output wire [9:0]    io_readAddr,
  input  wire [7:0]    io_readData_0,
  output reg           io_nextTile,
  input  wire          io_tileReady,
  output wire          io_streamOut_valid,
  input  wire          io_streamOut_ready,
  output wire [7:0]    io_streamOut_payload_0,
  input  wire          io_reArm,
  input  wire          clk,
  input  wire          reset
);

  reg                 fifo_io_flush;
  wire                fifo_io_push_ready;
  wire                fifo_io_pop_valid;
  wire       [7:0]    fifo_io_pop_payload_0;
  wire       [4:0]    fifo_io_occupancy;
  wire       [4:0]    fifo_io_availability;
  wire       [9:0]    _zz_readCounter_valueNext;
  wire       [0:0]    _zz_readCounter_valueNext_1;
  reg                 readCounter_willIncrement;
  wire                readCounter_willDecrement;
  reg                 readCounter_willClear;
  wire                readCounter_willLoad;
  reg        [9:0]    readCounter_valueNext;
  reg        [9:0]    readCounter_value;
  wire                readCounter_willOverflowIfInc;
  wire                readCounter_willUnderflowIfDec;
  wire                readCounter_willOverflow;
  wire                readCounter_willUnderflow;
  reg                 isReading;
  wire                when_DoubleBufferStreamer_l38;
  wire                reqStream_valid;
  wire                reqStream_ready;
  wire       [9:0]    reqStream_payload;
  wire                reqStream_fire;
  reg                 delayedValid;

  assign _zz_readCounter_valueNext_1 = readCounter_willIncrement;
  assign _zz_readCounter_valueNext = {9'd0, _zz_readCounter_valueNext_1};
  StreamFifo fifo (
    .io_push_valid     (delayedValid              ), //i
    .io_push_ready     (fifo_io_push_ready        ), //o
    .io_push_payload_0 (io_readData_0[7:0]        ), //i
    .io_pop_valid      (fifo_io_pop_valid         ), //o
    .io_pop_ready      (io_streamOut_ready        ), //i
    .io_pop_payload_0  (fifo_io_pop_payload_0[7:0]), //o
    .io_flush          (fifo_io_flush             ), //i
    .io_occupancy      (fifo_io_occupancy[4:0]    ), //o
    .io_availability   (fifo_io_availability[4:0] ), //o
    .clk               (clk                       ), //i
    .reset             (reset                     )  //i
  );
  always @(*) begin
    readCounter_willIncrement = 1'b0;
    if(reqStream_fire) begin
      readCounter_willIncrement = 1'b1;
    end
  end

  assign readCounter_willDecrement = 1'b0;
  always @(*) begin
    readCounter_willClear = 1'b0;
    if(io_reArm) begin
      readCounter_willClear = 1'b1;
    end
  end

  assign readCounter_willLoad = 1'b0;
  assign readCounter_willOverflowIfInc = (readCounter_value == 10'h30f);
  assign readCounter_willUnderflowIfDec = (readCounter_value == 10'h0);
  assign readCounter_willOverflow = (readCounter_willOverflowIfInc && readCounter_willIncrement);
  always @(*) begin
    readCounter_valueNext = (readCounter_value + _zz_readCounter_valueNext);
    if(readCounter_willOverflow) begin
      readCounter_valueNext = 10'h0;
    end
    if(readCounter_willClear) begin
      readCounter_valueNext = 10'h0;
    end
  end

  assign readCounter_willUnderflow = (readCounter_willUnderflowIfDec && readCounter_willDecrement);
  always @(*) begin
    io_nextTile = 1'b0;
    if(reqStream_fire) begin
      if(readCounter_willOverflowIfInc) begin
        io_nextTile = 1'b1;
      end
    end
  end

  assign when_DoubleBufferStreamer_l38 = (io_tileReady && (! isReading));
  assign reqStream_valid = isReading;
  assign reqStream_payload = readCounter_value;
  assign io_readAddr = reqStream_payload;
  assign reqStream_fire = (reqStream_valid && reqStream_ready);
  assign io_streamOut_valid = fifo_io_pop_valid;
  assign io_streamOut_payload_0 = fifo_io_pop_payload_0;
  assign reqStream_ready = (5'h01 < fifo_io_availability);
  always @(*) begin
    fifo_io_flush = 1'b0;
    if(io_reArm) begin
      fifo_io_flush = 1'b1;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      readCounter_value <= 10'h0;
      isReading <= 1'b0;
      delayedValid <= 1'b0;
    end else begin
      readCounter_value <= readCounter_valueNext;
      if(when_DoubleBufferStreamer_l38) begin
        isReading <= 1'b1;
      end
      if(reqStream_fire) begin
        if(readCounter_willOverflowIfInc) begin
          isReading <= 1'b0;
        end
      end
      delayedValid <= reqStream_fire;
      if(io_reArm) begin
        isReading <= 1'b0;
        delayedValid <= 1'b0;
      end
    end
  end


endmodule

module StreamDoubleBuffer_2 (
  input  wire          io_streamIn_valid,
  output wire          io_streamIn_ready,
  input  wire [7:0]    io_streamIn_payload_0,
  input  wire [9:0]    io_readAddr,
  output wire [7:0]    io_readData_0,
  input  wire          io_nextTile,
  output wire          io_tileReady,
  input  wire          io_reArm,
  output wire          io_loadCanAccept,
  output wire          io_tileFilled,
  output wire          io_refreshSettled,
  input  wire          clk,
  input  wire          reset
);

  reg        [7:0]    memPing_spinal_port0;
  reg        [7:0]    memPong_spinal_port0;
  wire                _zz_memPing_port;
  wire                _zz_readDataPing_0;
  wire                _zz_memPong_port;
  wire                _zz_readDataPong_0;
  wire       [9:0]    _zz_loadCounter_valueNext;
  wire       [0:0]    _zz_loadCounter_valueNext_1;
  wire       [7:0]    _zz_memPing_port_1;
  wire       [7:0]    _zz_memPong_port_1;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 loadBank;
  reg                 computeBank;
  reg                 pingFull;
  reg                 pongFull;
  wire       [7:0]    readDataPing_0;
  wire       [7:0]    readDataPong_0;
  reg                 computeBankDelayed;
  reg                 loadCounter_willIncrement;
  wire                loadCounter_willDecrement;
  reg                 loadCounter_willClear;
  wire                loadCounter_willLoad;
  reg        [9:0]    loadCounter_valueNext;
  reg        [9:0]    loadCounter_value;
  wire                loadCounter_willOverflowIfInc;
  wire                loadCounter_willUnderflowIfDec;
  wire                loadCounter_willOverflow;
  wire                loadCounter_willUnderflow;
  wire                currentLoadBankFull;
  wire                loadDone;
  reg                 tileFilled;
  reg                 switchArmed;
  wire                allowFlip;
  wire                when_StreamDoubleBuffer_l114;
  wire                when_StreamDoubleBuffer_l117;
  wire                when_StreamDoubleBuffer_l123;
  wire                when_StreamDoubleBuffer_l125;
  wire                when_StreamDoubleBuffer_l135;
  wire                when_StreamDoubleBuffer_l137;
  wire                when_StreamDoubleBuffer_l142;
  wire                when_StreamDoubleBuffer_l144;
  reg [7:0] memPing [0:783];
  reg [7:0] memPong [0:783];

  assign _zz_loadCounter_valueNext_1 = loadCounter_willIncrement;
  assign _zz_loadCounter_valueNext = {9'd0, _zz_loadCounter_valueNext_1};
  assign _zz_readDataPing_0 = 1'b1;
  assign _zz_memPing_port_1 = io_streamIn_payload_0;
  assign _zz_readDataPong_0 = 1'b1;
  assign _zz_memPong_port_1 = io_streamIn_payload_0;
  always @(posedge clk) begin
    if(_zz_readDataPing_0) begin
      memPing_spinal_port0 <= memPing[io_readAddr];
    end
  end

  always @(posedge clk) begin
    if(_zz_2) begin
      memPing[loadCounter_value] <= _zz_memPing_port_1;
    end
  end

  always @(posedge clk) begin
    if(_zz_readDataPong_0) begin
      memPong_spinal_port0 <= memPong[io_readAddr];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      memPong[loadCounter_value] <= _zz_memPong_port_1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      if(!when_StreamDoubleBuffer_l125) begin
        _zz_1 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      if(when_StreamDoubleBuffer_l125) begin
        _zz_2 = 1'b1;
      end
    end
  end

  assign io_tileReady = ((computeBank == 1'b0) ? pingFull : pongFull);
  assign readDataPing_0 = memPing_spinal_port0[7 : 0];
  assign readDataPong_0 = memPong_spinal_port0[7 : 0];
  assign io_readData_0 = ((computeBankDelayed == 1'b0) ? readDataPing_0 : readDataPong_0);
  always @(*) begin
    loadCounter_willIncrement = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      loadCounter_willIncrement = 1'b1;
    end
  end

  assign loadCounter_willDecrement = 1'b0;
  always @(*) begin
    loadCounter_willClear = 1'b0;
    if(io_reArm) begin
      loadCounter_willClear = 1'b1;
    end
  end

  assign loadCounter_willLoad = 1'b0;
  assign loadCounter_willOverflowIfInc = (loadCounter_value == 10'h30f);
  assign loadCounter_willUnderflowIfDec = (loadCounter_value == 10'h0);
  assign loadCounter_willOverflow = (loadCounter_willOverflowIfInc && loadCounter_willIncrement);
  always @(*) begin
    loadCounter_valueNext = (loadCounter_value + _zz_loadCounter_valueNext);
    if(loadCounter_willOverflow) begin
      loadCounter_valueNext = 10'h0;
    end
    if(loadCounter_willClear) begin
      loadCounter_valueNext = 10'h0;
    end
  end

  assign loadCounter_willUnderflow = (loadCounter_willUnderflowIfDec && loadCounter_willDecrement);
  assign currentLoadBankFull = ((loadBank == 1'b0) ? pingFull : pongFull);
  assign io_streamIn_ready = (! currentLoadBankFull);
  assign io_loadCanAccept = (! currentLoadBankFull);
  assign loadDone = ((io_streamIn_valid && (! currentLoadBankFull)) && loadCounter_willOverflowIfInc);
  assign io_tileFilled = tileFilled;
  assign allowFlip = ((! 1'b0) || switchArmed);
  assign when_StreamDoubleBuffer_l114 = (1'b0 && tileFilled);
  assign when_StreamDoubleBuffer_l117 = (io_nextTile && allowFlip);
  assign io_refreshSettled = ((io_nextTile && allowFlip) && switchArmed);
  assign when_StreamDoubleBuffer_l123 = (io_streamIn_valid && (! currentLoadBankFull));
  assign when_StreamDoubleBuffer_l125 = (loadBank == 1'b0);
  assign when_StreamDoubleBuffer_l135 = ((io_nextTile && allowFlip) && (computeBank == 1'b0));
  assign when_StreamDoubleBuffer_l137 = (loadDone && (loadBank == 1'b0));
  assign when_StreamDoubleBuffer_l142 = ((io_nextTile && allowFlip) && (computeBank == 1'b1));
  assign when_StreamDoubleBuffer_l144 = (loadDone && (loadBank == 1'b1));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      loadBank <= 1'b0;
      computeBank <= 1'b0;
      pingFull <= 1'b0;
      pongFull <= 1'b0;
      loadCounter_value <= 10'h0;
      tileFilled <= 1'b0;
      switchArmed <= 1'b0;
    end else begin
      loadCounter_value <= loadCounter_valueNext;
      tileFilled <= loadDone;
      if(when_StreamDoubleBuffer_l114) begin
        switchArmed <= 1'b1;
      end
      if(when_StreamDoubleBuffer_l117) begin
        computeBank <= (! computeBank);
        switchArmed <= 1'b0;
      end
      if(when_StreamDoubleBuffer_l135) begin
        pingFull <= 1'b0;
      end else begin
        if(when_StreamDoubleBuffer_l137) begin
          pingFull <= 1'b1;
        end
      end
      if(when_StreamDoubleBuffer_l142) begin
        pongFull <= 1'b0;
      end else begin
        if(when_StreamDoubleBuffer_l144) begin
          pongFull <= 1'b1;
        end
      end
      if(loadDone) begin
        loadBank <= (! loadBank);
      end
      if(io_reArm) begin
        loadBank <= 1'b0;
        computeBank <= 1'b0;
        pingFull <= 1'b0;
        pongFull <= 1'b0;
        switchArmed <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    computeBankDelayed <= computeBank;
  end


endmodule

module DMAReader2D (
  input  wire          io_cmd_valid,
  output reg           io_cmd_ready,
  input  wire [31:0]   io_cmd_payload_baseAddress,
  input  wire [31:0]   io_cmd_payload_stride,
  input  wire [15:0]   io_cmd_payload_patchWidth,
  input  wire [15:0]   io_cmd_payload_patchHeight,
  output wire          io_axiMaster_ar_valid,
  input  wire          io_axiMaster_ar_ready,
  output wire [31:0]   io_axiMaster_ar_payload_addr,
  output wire [0:0]    io_axiMaster_ar_payload_id,
  output wire [3:0]    io_axiMaster_ar_payload_region,
  output wire [7:0]    io_axiMaster_ar_payload_len,
  output wire [2:0]    io_axiMaster_ar_payload_size,
  output wire [1:0]    io_axiMaster_ar_payload_burst,
  output wire [0:0]    io_axiMaster_ar_payload_lock,
  output wire [3:0]    io_axiMaster_ar_payload_cache,
  output wire [3:0]    io_axiMaster_ar_payload_qos,
  output wire [2:0]    io_axiMaster_ar_payload_prot,
  input  wire          io_axiMaster_r_valid,
  output wire          io_axiMaster_r_ready,
  input  wire [63:0]   io_axiMaster_r_payload_data,
  input  wire [0:0]    io_axiMaster_r_payload_id,
  input  wire [1:0]    io_axiMaster_r_payload_resp,
  input  wire          io_axiMaster_r_payload_last,
  output wire          io_outStream_stream_valid,
  input  wire          io_outStream_stream_ready,
  output wire [7:0]    io_outStream_stream_payload_0,
  input  wire          clk,
  input  wire          reset
);
  localparam fsm_BOOT = 2'd0;
  localparam fsm_stateIdle = 2'd1;
  localparam fsm_stateFetch = 2'd2;
  localparam fsm_stateDrain = 2'd3;

  wire                reader1D_io_outStream_stream_ready;
  wire                reader1D_io_cmd_ready;
  wire                reader1D_io_axiMaster_ar_valid;
  wire       [31:0]   reader1D_io_axiMaster_ar_payload_addr;
  wire       [0:0]    reader1D_io_axiMaster_ar_payload_id;
  wire       [3:0]    reader1D_io_axiMaster_ar_payload_region;
  wire       [7:0]    reader1D_io_axiMaster_ar_payload_len;
  wire       [2:0]    reader1D_io_axiMaster_ar_payload_size;
  wire       [1:0]    reader1D_io_axiMaster_ar_payload_burst;
  wire       [0:0]    reader1D_io_axiMaster_ar_payload_lock;
  wire       [3:0]    reader1D_io_axiMaster_ar_payload_cache;
  wire       [3:0]    reader1D_io_axiMaster_ar_payload_qos;
  wire       [2:0]    reader1D_io_axiMaster_ar_payload_prot;
  wire                reader1D_io_axiMaster_r_ready;
  wire                reader1D_io_outStream_stream_valid;
  wire       [7:0]    reader1D_io_outStream_stream_payload_0;
  wire       [3:0]    _zz_readerCmd_payload_length;
  wire       [33:0]   _zz_wordsForCurrentRow;
  wire       [33:0]   _zz_wordsForCurrentRow_1;
  wire       [32:0]   _zz_wordsForCurrentRow_2;
  wire       [32:0]   _zz_wordsForCurrentRow_3;
  wire       [5:0]    _zz_wordsForCurrentRow_4;
  wire       [33:0]   _zz_wordsForCurrentRow_5;
  wire       [3:0]    _zz_wordsForCurrentRow_6;
  wire       [5:0]    _zz_rowFetchedBeats;
  wire       [6:0]    _zz_rowFetchedBeats_1;
  wire       [0:0]    _zz_rowFetchedBeats_2;
  wire       [5:0]    _zz_suppress;
  wire       [6:0]    _zz_elemCnt;
  wire       [6:0]    _zz_elemCnt_1;
  wire       [5:0]    _zz_elemCnt_2;
  wire       [3:0]    _zz_readerCmd_payload_length_1;
  wire       [33:0]   _zz_rowKeepEnd;
  wire       [32:0]   _zz_rowKeepEnd_1;
  wire       [32:0]   _zz_rowKeepEnd_2;
  wire       [5:0]    _zz_rowKeepEnd_3;
  wire       [33:0]   _zz_rowKeepEnd_4;
  wire       [1:0]    _zz_rowKeepEnd_5;
  wire       [15:0]   _zz_lastRow;
  wire       [6:0]    _zz_when_DMAReader2D_l176;
  wire       [6:0]    _zz_when_DMAReader2D_l176_1;
  reg                 readerCmd_valid;
  wire                readerCmd_ready;
  reg        [31:0]   readerCmd_payload_address;
  reg        [15:0]   readerCmd_payload_length;
  wire       [4:0]    rowWidth;
  reg        [31:0]   currentAddress;
  reg        [15:0]   currentRow;
  reg                 lastRow;
  reg        [15:0]   cmdHeight;
  reg        [31:0]   cmdStride;
  reg        [31:0]   rowReqAddr;
  reg        [2:0]    rowWords;
  reg        [2:0]    rowSkip;
  reg        [5:0]    rowKeepEnd;
  wire       [31:0]   headSkipBytes;
  wire       [31:0]   headSkipElems;
  wire       [31:0]   reqAddrAligned;
  wire       [2:0]    wordsForCurrentRow;
  wire       [6:0]    totalFetchElems;
  wire       [5:0]    rowFetchedBeats;
  reg        [5:0]    elemCnt;
  wire                suppress;
  wire                reader1D_io_outStream_stream_fire;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [1:0]    fsm_stateReg;
  reg        [1:0]    fsm_stateNext;
  wire                when_DMAReader2D_l176;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign _zz_readerCmd_payload_length = ({1'b0,rowWords} - {1'b0,3'b001});
  assign _zz_wordsForCurrentRow = (_zz_wordsForCurrentRow_1 / 4'b1000);
  assign _zz_wordsForCurrentRow_1 = ({1'b0,_zz_wordsForCurrentRow_2} + _zz_wordsForCurrentRow_5);
  assign _zz_wordsForCurrentRow_2 = ({1'b0,headSkipElems} + _zz_wordsForCurrentRow_3);
  assign _zz_wordsForCurrentRow_4 = {1'b0,rowWidth};
  assign _zz_wordsForCurrentRow_3 = {27'd0, _zz_wordsForCurrentRow_4};
  assign _zz_wordsForCurrentRow_6 = {1'b0,3'b111};
  assign _zz_wordsForCurrentRow_5 = {30'd0, _zz_wordsForCurrentRow_6};
  assign _zz_rowFetchedBeats_1 = (totalFetchElems / 1'b1);
  assign _zz_rowFetchedBeats = _zz_rowFetchedBeats_1[5:0];
  assign _zz_rowFetchedBeats_2 = (totalFetchElems % 1'b1);
  assign _zz_suppress = {3'd0, rowSkip};
  assign _zz_elemCnt = {1'd0, elemCnt};
  assign _zz_elemCnt_1 = ({1'b0,rowFetchedBeats} - {1'b0,6'h01});
  assign _zz_elemCnt_2 = (elemCnt + 6'h01);
  assign _zz_readerCmd_payload_length_1 = ({1'b0,wordsForCurrentRow} - {1'b0,3'b001});
  assign _zz_rowKeepEnd = ({1'b0,_zz_rowKeepEnd_1} - _zz_rowKeepEnd_4);
  assign _zz_rowKeepEnd_1 = ({1'b0,headSkipElems} + _zz_rowKeepEnd_2);
  assign _zz_rowKeepEnd_3 = {1'b0,rowWidth};
  assign _zz_rowKeepEnd_2 = {27'd0, _zz_rowKeepEnd_3};
  assign _zz_rowKeepEnd_5 = {1'b0,1'b1};
  assign _zz_rowKeepEnd_4 = {32'd0, _zz_rowKeepEnd_5};
  assign _zz_lastRow = (cmdHeight - 16'h0001);
  assign _zz_when_DMAReader2D_l176 = {1'd0, elemCnt};
  assign _zz_when_DMAReader2D_l176_1 = ({1'b0,rowFetchedBeats} - {1'b0,6'h01});
  DMAReader reader1D (
    .io_cmd_valid                   (readerCmd_valid                             ), //i
    .io_cmd_ready                   (reader1D_io_cmd_ready                       ), //o
    .io_cmd_payload_address         (readerCmd_payload_address[31:0]             ), //i
    .io_cmd_payload_length          (readerCmd_payload_length[15:0]              ), //i
    .io_axiMaster_ar_valid          (reader1D_io_axiMaster_ar_valid              ), //o
    .io_axiMaster_ar_ready          (io_axiMaster_ar_ready                       ), //i
    .io_axiMaster_ar_payload_addr   (reader1D_io_axiMaster_ar_payload_addr[31:0] ), //o
    .io_axiMaster_ar_payload_id     (reader1D_io_axiMaster_ar_payload_id         ), //o
    .io_axiMaster_ar_payload_region (reader1D_io_axiMaster_ar_payload_region[3:0]), //o
    .io_axiMaster_ar_payload_len    (reader1D_io_axiMaster_ar_payload_len[7:0]   ), //o
    .io_axiMaster_ar_payload_size   (reader1D_io_axiMaster_ar_payload_size[2:0]  ), //o
    .io_axiMaster_ar_payload_burst  (reader1D_io_axiMaster_ar_payload_burst[1:0] ), //o
    .io_axiMaster_ar_payload_lock   (reader1D_io_axiMaster_ar_payload_lock       ), //o
    .io_axiMaster_ar_payload_cache  (reader1D_io_axiMaster_ar_payload_cache[3:0] ), //o
    .io_axiMaster_ar_payload_qos    (reader1D_io_axiMaster_ar_payload_qos[3:0]   ), //o
    .io_axiMaster_ar_payload_prot   (reader1D_io_axiMaster_ar_payload_prot[2:0]  ), //o
    .io_axiMaster_r_valid           (io_axiMaster_r_valid                        ), //i
    .io_axiMaster_r_ready           (reader1D_io_axiMaster_r_ready               ), //o
    .io_axiMaster_r_payload_data    (io_axiMaster_r_payload_data[63:0]           ), //i
    .io_axiMaster_r_payload_id      (io_axiMaster_r_payload_id                   ), //i
    .io_axiMaster_r_payload_resp    (io_axiMaster_r_payload_resp[1:0]            ), //i
    .io_axiMaster_r_payload_last    (io_axiMaster_r_payload_last                 ), //i
    .io_outStream_stream_valid      (reader1D_io_outStream_stream_valid          ), //o
    .io_outStream_stream_ready      (reader1D_io_outStream_stream_ready          ), //i
    .io_outStream_stream_payload_0  (reader1D_io_outStream_stream_payload_0[7:0] ), //o
    .clk                            (clk                                         ), //i
    .reset                          (reset                                       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_stateIdle : fsm_stateReg_string = "stateIdle ";
      fsm_stateFetch : fsm_stateReg_string = "stateFetch";
      fsm_stateDrain : fsm_stateReg_string = "stateDrain";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_stateIdle : fsm_stateNext_string = "stateIdle ";
      fsm_stateFetch : fsm_stateNext_string = "stateFetch";
      fsm_stateDrain : fsm_stateNext_string = "stateDrain";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign io_axiMaster_ar_valid = reader1D_io_axiMaster_ar_valid;
  assign io_axiMaster_ar_payload_addr = reader1D_io_axiMaster_ar_payload_addr;
  assign io_axiMaster_ar_payload_id = reader1D_io_axiMaster_ar_payload_id;
  assign io_axiMaster_ar_payload_region = reader1D_io_axiMaster_ar_payload_region;
  assign io_axiMaster_ar_payload_len = reader1D_io_axiMaster_ar_payload_len;
  assign io_axiMaster_ar_payload_size = reader1D_io_axiMaster_ar_payload_size;
  assign io_axiMaster_ar_payload_burst = reader1D_io_axiMaster_ar_payload_burst;
  assign io_axiMaster_ar_payload_lock = reader1D_io_axiMaster_ar_payload_lock;
  assign io_axiMaster_ar_payload_cache = reader1D_io_axiMaster_ar_payload_cache;
  assign io_axiMaster_ar_payload_qos = reader1D_io_axiMaster_ar_payload_qos;
  assign io_axiMaster_ar_payload_prot = reader1D_io_axiMaster_ar_payload_prot;
  assign io_axiMaster_r_ready = reader1D_io_axiMaster_r_ready;
  assign readerCmd_ready = reader1D_io_cmd_ready;
  assign rowWidth = 5'h1c;
  always @(*) begin
    readerCmd_valid = 1'b0;
    case(fsm_stateReg)
      fsm_stateIdle : begin
      end
      fsm_stateFetch : begin
        readerCmd_valid = 1'b1;
      end
      fsm_stateDrain : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    readerCmd_payload_address = rowReqAddr;
    case(fsm_stateReg)
      fsm_stateIdle : begin
      end
      fsm_stateFetch : begin
        readerCmd_payload_address = reqAddrAligned;
      end
      fsm_stateDrain : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    readerCmd_payload_length = {12'd0, _zz_readerCmd_payload_length};
    case(fsm_stateReg)
      fsm_stateIdle : begin
      end
      fsm_stateFetch : begin
        readerCmd_payload_length = {12'd0, _zz_readerCmd_payload_length_1};
      end
      fsm_stateDrain : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_cmd_ready = 1'b0;
    case(fsm_stateReg)
      fsm_stateIdle : begin
      end
      fsm_stateFetch : begin
      end
      fsm_stateDrain : begin
        if(when_DMAReader2D_l176) begin
          if(lastRow) begin
            io_cmd_ready = 1'b1;
          end
        end
      end
      default : begin
      end
    endcase
  end

  assign headSkipBytes = (currentAddress % 32'h00000008);
  assign headSkipElems = headSkipBytes;
  assign reqAddrAligned = (currentAddress - headSkipBytes);
  assign wordsForCurrentRow = _zz_wordsForCurrentRow[2:0];
  assign totalFetchElems = (rowWords * 4'b1000);
  assign rowFetchedBeats = (_zz_rowFetchedBeats + ((_zz_rowFetchedBeats_2 != 1'b0) ? 6'h01 : 6'h0));
  assign suppress = ((elemCnt < _zz_suppress) || (rowKeepEnd < elemCnt));
  assign io_outStream_stream_valid = (reader1D_io_outStream_stream_valid && (! suppress));
  assign reader1D_io_outStream_stream_ready = (io_outStream_stream_ready || suppress);
  assign io_outStream_stream_payload_0 = reader1D_io_outStream_stream_payload_0;
  assign reader1D_io_outStream_stream_fire = (reader1D_io_outStream_stream_valid && reader1D_io_outStream_stream_ready);
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_stateIdle : begin
      end
      fsm_stateFetch : begin
      end
      fsm_stateDrain : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_stateIdle : begin
        if(io_cmd_valid) begin
          fsm_stateNext = fsm_stateFetch;
        end
      end
      fsm_stateFetch : begin
        if(readerCmd_ready) begin
          fsm_stateNext = fsm_stateDrain;
        end
      end
      fsm_stateDrain : begin
        if(when_DMAReader2D_l176) begin
          if(lastRow) begin
            fsm_stateNext = fsm_stateIdle;
          end else begin
            fsm_stateNext = fsm_stateFetch;
          end
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_stateIdle;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_BOOT;
    end
  end

  assign when_DMAReader2D_l176 = (reader1D_io_outStream_stream_fire && (_zz_when_DMAReader2D_l176 == _zz_when_DMAReader2D_l176_1));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      currentAddress <= 32'h0;
      currentRow <= 16'h0;
      lastRow <= 1'b0;
      cmdHeight <= 16'h0;
      cmdStride <= 32'h0;
      rowReqAddr <= 32'h0;
      rowWords <= 3'b000;
      rowSkip <= 3'b000;
      rowKeepEnd <= 6'h0;
      elemCnt <= 6'h0;
      fsm_stateReg <= fsm_BOOT;
    end else begin
      if(reader1D_io_outStream_stream_fire) begin
        elemCnt <= ((_zz_elemCnt == _zz_elemCnt_1) ? 6'h0 : _zz_elemCnt_2);
      end
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_stateIdle : begin
          if(io_cmd_valid) begin
            currentAddress <= io_cmd_payload_baseAddress;
            currentRow <= 16'h0;
            cmdHeight <= io_cmd_payload_patchHeight;
            cmdStride <= io_cmd_payload_stride;
          end
        end
        fsm_stateFetch : begin
          if(readerCmd_ready) begin
            rowReqAddr <= reqAddrAligned;
            rowWords <= wordsForCurrentRow;
            rowSkip <= headSkipElems[2:0];
            rowKeepEnd <= _zz_rowKeepEnd[5:0];
            lastRow <= (currentRow == _zz_lastRow);
          end
        end
        fsm_stateDrain : begin
          if(when_DMAReader2D_l176) begin
            currentAddress <= (currentAddress + cmdStride);
            currentRow <= (currentRow + 16'h0001);
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module StreamFork (
  input  wire          io_input_valid,
  output reg           io_input_ready,
  output wire          io_outputs_0_valid,
  input  wire          io_outputs_0_ready,
  output wire          io_outputs_1_valid,
  input  wire          io_outputs_1_ready,
  output wire          io_outputs_2_valid,
  input  wire          io_outputs_2_ready,
  output wire          io_outputs_3_valid,
  input  wire          io_outputs_3_ready,
  output wire          io_outputs_4_valid,
  input  wire          io_outputs_4_ready,
  input  wire          clk,
  input  wire          reset
);

  reg                 logic_linkEnable_0;
  reg                 logic_linkEnable_1;
  reg                 logic_linkEnable_2;
  reg                 logic_linkEnable_3;
  reg                 logic_linkEnable_4;
  wire                when_Stream_l1355;
  wire                when_Stream_l1355_1;
  wire                when_Stream_l1355_2;
  wire                when_Stream_l1355_3;
  wire                when_Stream_l1355_4;
  wire                io_outputs_0_fire;
  wire                io_outputs_1_fire;
  wire                io_outputs_2_fire;
  wire                io_outputs_3_fire;
  wire                io_outputs_4_fire;

  always @(*) begin
    io_input_ready = 1'b1;
    if(when_Stream_l1355) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l1355_1) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l1355_2) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l1355_3) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l1355_4) begin
      io_input_ready = 1'b0;
    end
  end

  assign when_Stream_l1355 = ((! io_outputs_0_ready) && logic_linkEnable_0);
  assign when_Stream_l1355_1 = ((! io_outputs_1_ready) && logic_linkEnable_1);
  assign when_Stream_l1355_2 = ((! io_outputs_2_ready) && logic_linkEnable_2);
  assign when_Stream_l1355_3 = ((! io_outputs_3_ready) && logic_linkEnable_3);
  assign when_Stream_l1355_4 = ((! io_outputs_4_ready) && logic_linkEnable_4);
  assign io_outputs_0_valid = (io_input_valid && logic_linkEnable_0);
  assign io_outputs_0_fire = (io_outputs_0_valid && io_outputs_0_ready);
  assign io_outputs_1_valid = (io_input_valid && logic_linkEnable_1);
  assign io_outputs_1_fire = (io_outputs_1_valid && io_outputs_1_ready);
  assign io_outputs_2_valid = (io_input_valid && logic_linkEnable_2);
  assign io_outputs_2_fire = (io_outputs_2_valid && io_outputs_2_ready);
  assign io_outputs_3_valid = (io_input_valid && logic_linkEnable_3);
  assign io_outputs_3_fire = (io_outputs_3_valid && io_outputs_3_ready);
  assign io_outputs_4_valid = (io_input_valid && logic_linkEnable_4);
  assign io_outputs_4_fire = (io_outputs_4_valid && io_outputs_4_ready);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_linkEnable_0 <= 1'b1;
      logic_linkEnable_1 <= 1'b1;
      logic_linkEnable_2 <= 1'b1;
      logic_linkEnable_3 <= 1'b1;
      logic_linkEnable_4 <= 1'b1;
    end else begin
      if(io_outputs_0_fire) begin
        logic_linkEnable_0 <= 1'b0;
      end
      if(io_outputs_1_fire) begin
        logic_linkEnable_1 <= 1'b0;
      end
      if(io_outputs_2_fire) begin
        logic_linkEnable_2 <= 1'b0;
      end
      if(io_outputs_3_fire) begin
        logic_linkEnable_3 <= 1'b0;
      end
      if(io_outputs_4_fire) begin
        logic_linkEnable_4 <= 1'b0;
      end
      if(io_input_ready) begin
        logic_linkEnable_0 <= 1'b1;
        logic_linkEnable_1 <= 1'b1;
        logic_linkEnable_2 <= 1'b1;
        logic_linkEnable_3 <= 1'b1;
        logic_linkEnable_4 <= 1'b1;
      end
    end
  end


endmodule

module StreamArbiter (
  input  wire          io_inputs_0_valid,
  output wire          io_inputs_0_ready,
  input  wire [31:0]   io_inputs_0_payload_addr,
  input  wire [0:0]    io_inputs_0_payload_id,
  input  wire [3:0]    io_inputs_0_payload_region,
  input  wire [7:0]    io_inputs_0_payload_len,
  input  wire [2:0]    io_inputs_0_payload_size,
  input  wire [1:0]    io_inputs_0_payload_burst,
  input  wire [0:0]    io_inputs_0_payload_lock,
  input  wire [3:0]    io_inputs_0_payload_cache,
  input  wire [3:0]    io_inputs_0_payload_qos,
  input  wire [2:0]    io_inputs_0_payload_prot,
  input  wire          io_inputs_1_valid,
  output wire          io_inputs_1_ready,
  input  wire [31:0]   io_inputs_1_payload_addr,
  input  wire [0:0]    io_inputs_1_payload_id,
  input  wire [3:0]    io_inputs_1_payload_region,
  input  wire [7:0]    io_inputs_1_payload_len,
  input  wire [2:0]    io_inputs_1_payload_size,
  input  wire [1:0]    io_inputs_1_payload_burst,
  input  wire [0:0]    io_inputs_1_payload_lock,
  input  wire [3:0]    io_inputs_1_payload_cache,
  input  wire [3:0]    io_inputs_1_payload_qos,
  input  wire [2:0]    io_inputs_1_payload_prot,
  input  wire          io_inputs_2_valid,
  output wire          io_inputs_2_ready,
  input  wire [31:0]   io_inputs_2_payload_addr,
  input  wire [0:0]    io_inputs_2_payload_id,
  input  wire [3:0]    io_inputs_2_payload_region,
  input  wire [7:0]    io_inputs_2_payload_len,
  input  wire [2:0]    io_inputs_2_payload_size,
  input  wire [1:0]    io_inputs_2_payload_burst,
  input  wire [0:0]    io_inputs_2_payload_lock,
  input  wire [3:0]    io_inputs_2_payload_cache,
  input  wire [3:0]    io_inputs_2_payload_qos,
  input  wire [2:0]    io_inputs_2_payload_prot,
  input  wire          io_inputs_3_valid,
  output wire          io_inputs_3_ready,
  input  wire [31:0]   io_inputs_3_payload_addr,
  input  wire [0:0]    io_inputs_3_payload_id,
  input  wire [3:0]    io_inputs_3_payload_region,
  input  wire [7:0]    io_inputs_3_payload_len,
  input  wire [2:0]    io_inputs_3_payload_size,
  input  wire [1:0]    io_inputs_3_payload_burst,
  input  wire [0:0]    io_inputs_3_payload_lock,
  input  wire [3:0]    io_inputs_3_payload_cache,
  input  wire [3:0]    io_inputs_3_payload_qos,
  input  wire [2:0]    io_inputs_3_payload_prot,
  input  wire          io_inputs_4_valid,
  output wire          io_inputs_4_ready,
  input  wire [31:0]   io_inputs_4_payload_addr,
  input  wire [0:0]    io_inputs_4_payload_id,
  input  wire [3:0]    io_inputs_4_payload_region,
  input  wire [7:0]    io_inputs_4_payload_len,
  input  wire [2:0]    io_inputs_4_payload_size,
  input  wire [1:0]    io_inputs_4_payload_burst,
  input  wire [0:0]    io_inputs_4_payload_lock,
  input  wire [3:0]    io_inputs_4_payload_cache,
  input  wire [3:0]    io_inputs_4_payload_qos,
  input  wire [2:0]    io_inputs_4_payload_prot,
  output wire          io_output_valid,
  input  wire          io_output_ready,
  output wire [31:0]   io_output_payload_addr,
  output wire [0:0]    io_output_payload_id,
  output wire [3:0]    io_output_payload_region,
  output wire [7:0]    io_output_payload_len,
  output wire [2:0]    io_output_payload_size,
  output wire [1:0]    io_output_payload_burst,
  output wire [0:0]    io_output_payload_lock,
  output wire [3:0]    io_output_payload_cache,
  output wire [3:0]    io_output_payload_qos,
  output wire [2:0]    io_output_payload_prot,
  output wire [2:0]    io_chosen,
  output wire [4:0]    io_chosenOH,
  input  wire          clk,
  input  wire          reset
);

  wire       [9:0]    _zz__zz_maskProposal_0_2;
  wire       [9:0]    _zz__zz_maskProposal_0_2_1;
  wire       [4:0]    _zz__zz_maskProposal_0_2_2;
  reg        [31:0]   _zz_io_output_payload_addr_3;
  reg        [0:0]    _zz_io_output_payload_id;
  reg        [3:0]    _zz_io_output_payload_region;
  reg        [7:0]    _zz_io_output_payload_len;
  reg        [2:0]    _zz_io_output_payload_size;
  reg        [1:0]    _zz_io_output_payload_burst;
  reg        [0:0]    _zz_io_output_payload_lock;
  reg        [3:0]    _zz_io_output_payload_cache;
  reg        [3:0]    _zz_io_output_payload_qos;
  reg        [2:0]    _zz_io_output_payload_prot;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  wire                maskProposal_2;
  wire                maskProposal_3;
  wire                maskProposal_4;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  reg                 maskLocked_2;
  reg                 maskLocked_3;
  reg                 maskLocked_4;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire                maskRouted_2;
  wire                maskRouted_3;
  wire                maskRouted_4;
  wire       [4:0]    _zz_maskProposal_0;
  wire       [9:0]    _zz_maskProposal_0_1;
  wire       [9:0]    _zz_maskProposal_0_2;
  wire       [4:0]    _zz_maskProposal_0_3;
  wire                io_output_fire;
  wire                _zz_io_output_payload_addr;
  wire                _zz_io_output_payload_addr_1;
  wire       [2:0]    _zz_io_output_payload_addr_2;
  wire                _zz_io_chosen;
  wire                _zz_io_chosen_1;
  wire                _zz_io_chosen_2;
  wire                _zz_io_chosen_3;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = {maskLocked_3,{maskLocked_2,{maskLocked_1,{maskLocked_0,maskLocked_4}}}};
  assign _zz__zz_maskProposal_0_2_1 = {5'd0, _zz__zz_maskProposal_0_2_2};
  always @(*) begin
    case(_zz_io_output_payload_addr_2)
      3'b000 : begin
        _zz_io_output_payload_addr_3 = io_inputs_0_payload_addr;
        _zz_io_output_payload_id = io_inputs_0_payload_id;
        _zz_io_output_payload_region = io_inputs_0_payload_region;
        _zz_io_output_payload_len = io_inputs_0_payload_len;
        _zz_io_output_payload_size = io_inputs_0_payload_size;
        _zz_io_output_payload_burst = io_inputs_0_payload_burst;
        _zz_io_output_payload_lock = io_inputs_0_payload_lock;
        _zz_io_output_payload_cache = io_inputs_0_payload_cache;
        _zz_io_output_payload_qos = io_inputs_0_payload_qos;
        _zz_io_output_payload_prot = io_inputs_0_payload_prot;
      end
      3'b001 : begin
        _zz_io_output_payload_addr_3 = io_inputs_1_payload_addr;
        _zz_io_output_payload_id = io_inputs_1_payload_id;
        _zz_io_output_payload_region = io_inputs_1_payload_region;
        _zz_io_output_payload_len = io_inputs_1_payload_len;
        _zz_io_output_payload_size = io_inputs_1_payload_size;
        _zz_io_output_payload_burst = io_inputs_1_payload_burst;
        _zz_io_output_payload_lock = io_inputs_1_payload_lock;
        _zz_io_output_payload_cache = io_inputs_1_payload_cache;
        _zz_io_output_payload_qos = io_inputs_1_payload_qos;
        _zz_io_output_payload_prot = io_inputs_1_payload_prot;
      end
      3'b010 : begin
        _zz_io_output_payload_addr_3 = io_inputs_2_payload_addr;
        _zz_io_output_payload_id = io_inputs_2_payload_id;
        _zz_io_output_payload_region = io_inputs_2_payload_region;
        _zz_io_output_payload_len = io_inputs_2_payload_len;
        _zz_io_output_payload_size = io_inputs_2_payload_size;
        _zz_io_output_payload_burst = io_inputs_2_payload_burst;
        _zz_io_output_payload_lock = io_inputs_2_payload_lock;
        _zz_io_output_payload_cache = io_inputs_2_payload_cache;
        _zz_io_output_payload_qos = io_inputs_2_payload_qos;
        _zz_io_output_payload_prot = io_inputs_2_payload_prot;
      end
      3'b011 : begin
        _zz_io_output_payload_addr_3 = io_inputs_3_payload_addr;
        _zz_io_output_payload_id = io_inputs_3_payload_id;
        _zz_io_output_payload_region = io_inputs_3_payload_region;
        _zz_io_output_payload_len = io_inputs_3_payload_len;
        _zz_io_output_payload_size = io_inputs_3_payload_size;
        _zz_io_output_payload_burst = io_inputs_3_payload_burst;
        _zz_io_output_payload_lock = io_inputs_3_payload_lock;
        _zz_io_output_payload_cache = io_inputs_3_payload_cache;
        _zz_io_output_payload_qos = io_inputs_3_payload_qos;
        _zz_io_output_payload_prot = io_inputs_3_payload_prot;
      end
      default : begin
        _zz_io_output_payload_addr_3 = io_inputs_4_payload_addr;
        _zz_io_output_payload_id = io_inputs_4_payload_id;
        _zz_io_output_payload_region = io_inputs_4_payload_region;
        _zz_io_output_payload_len = io_inputs_4_payload_len;
        _zz_io_output_payload_size = io_inputs_4_payload_size;
        _zz_io_output_payload_burst = io_inputs_4_payload_burst;
        _zz_io_output_payload_lock = io_inputs_4_payload_lock;
        _zz_io_output_payload_cache = io_inputs_4_payload_cache;
        _zz_io_output_payload_qos = io_inputs_4_payload_qos;
        _zz_io_output_payload_prot = io_inputs_4_payload_prot;
      end
    endcase
  end

  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign maskRouted_2 = (locked ? maskLocked_2 : maskProposal_2);
  assign maskRouted_3 = (locked ? maskLocked_3 : maskProposal_3);
  assign maskRouted_4 = (locked ? maskLocked_4 : maskProposal_4);
  assign _zz_maskProposal_0 = {io_inputs_4_valid,{io_inputs_3_valid,{io_inputs_2_valid,{io_inputs_1_valid,io_inputs_0_valid}}}};
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[9 : 5] | _zz_maskProposal_0_2[4 : 0]);
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign maskProposal_1 = _zz_maskProposal_0_3[1];
  assign maskProposal_2 = _zz_maskProposal_0_3[2];
  assign maskProposal_3 = _zz_maskProposal_0_3[3];
  assign maskProposal_4 = _zz_maskProposal_0_3[4];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = (((((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1)) || (io_inputs_2_valid && maskRouted_2)) || (io_inputs_3_valid && maskRouted_3)) || (io_inputs_4_valid && maskRouted_4));
  assign _zz_io_output_payload_addr = (maskRouted_1 || maskRouted_3);
  assign _zz_io_output_payload_addr_1 = (maskRouted_2 || maskRouted_3);
  assign _zz_io_output_payload_addr_2 = {maskRouted_4,{_zz_io_output_payload_addr_1,_zz_io_output_payload_addr}};
  assign io_output_payload_addr = _zz_io_output_payload_addr_3;
  assign io_output_payload_id = _zz_io_output_payload_id;
  assign io_output_payload_region = _zz_io_output_payload_region;
  assign io_output_payload_len = _zz_io_output_payload_len;
  assign io_output_payload_size = _zz_io_output_payload_size;
  assign io_output_payload_burst = _zz_io_output_payload_burst;
  assign io_output_payload_lock = _zz_io_output_payload_lock;
  assign io_output_payload_cache = _zz_io_output_payload_cache;
  assign io_output_payload_qos = _zz_io_output_payload_qos;
  assign io_output_payload_prot = _zz_io_output_payload_prot;
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_inputs_2_ready = (maskRouted_2 && io_output_ready);
  assign io_inputs_3_ready = (maskRouted_3 && io_output_ready);
  assign io_inputs_4_ready = (maskRouted_4 && io_output_ready);
  assign io_chosenOH = {maskRouted_4,{maskRouted_3,{maskRouted_2,{maskRouted_1,maskRouted_0}}}};
  assign _zz_io_chosen = io_chosenOH[3];
  assign _zz_io_chosen_1 = io_chosenOH[4];
  assign _zz_io_chosen_2 = (io_chosenOH[1] || _zz_io_chosen);
  assign _zz_io_chosen_3 = (io_chosenOH[2] || _zz_io_chosen);
  assign io_chosen = {_zz_io_chosen_1,{_zz_io_chosen_3,_zz_io_chosen_2}};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b0;
      maskLocked_1 <= 1'b0;
      maskLocked_2 <= 1'b0;
      maskLocked_3 <= 1'b0;
      maskLocked_4 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
        maskLocked_2 <= maskRouted_2;
        maskLocked_3 <= maskRouted_3;
        maskLocked_4 <= maskRouted_4;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module BiasAddOp_1 (
  input  wire          io_a_stream_valid,
  output reg           io_a_stream_ready,
  input  wire [2:0]    io_a_stream_payload_0_mantissa,
  input  wire [3:0]    io_a_stream_payload_0_exponent,
  input  wire          io_a_stream_payload_0_sign,
  input  wire          io_b_stream_valid,
  output reg           io_b_stream_ready,
  input  wire [2:0]    io_b_stream_payload_0_mantissa,
  input  wire [3:0]    io_b_stream_payload_0_exponent,
  input  wire          io_b_stream_payload_0_sign,
  output reg           io_c_stream_valid,
  input  wire          io_c_stream_ready,
  output reg  [2:0]    io_c_stream_payload_0_mantissa,
  output reg  [3:0]    io_c_stream_payload_0_exponent,
  output reg           io_c_stream_payload_0_sign,
  input  wire          io_reArm,
  input  wire          clk,
  input  wire          reset
);
  localparam fsm_2_BOOT = 2'd0;
  localparam fsm_2_stateLoadBias = 2'd1;
  localparam fsm_2_stateProcess = 2'd2;
  localparam fsm_2_stateDone = 2'd3;

  wire       [3:0]    _zz_loadCounter_valueNext;
  wire       [0:0]    _zz_loadCounter_valueNext_1;
  wire       [3:0]    _zz_aCounter_valueNext;
  wire       [0:0]    _zz_aCounter_valueNext_1;
  wire       [3:0]    _zz__zz_when_Float_l199;
  wire       [3:0]    _zz__zz_when_Float_l199_1;
  wire       [4:0]    _zz__zz_when_Float_l199_2;
  reg        [2:0]    _zz__zz_when_Float_l203;
  reg        [3:0]    _zz__zz_when_Float_l199_1_1;
  reg                 _zz__zz_when_Float_l203_1;
  wire       [7:0]    _zz__zz_when_Float_l203_8;
  wire       [7:0]    _zz__zz_when_Float_l203_8_1;
  wire       [6:0]    _zz__zz_when_Float_l203_8_2;
  wire       [7:0]    _zz__zz_when_Float_l203_11;
  wire       [3:0]    _zz__zz_io_c_stream_payload_0_mantissa_4;
  wire       [1:0]    _zz__zz_io_c_stream_payload_0_mantissa_4_1;
  wire       [6:0]    _zz__zz_when_Float_l203_20;
  wire       [6:0]    _zz__zz_when_Float_l203_20_1;
  wire       [4:0]    _zz__zz_when_Float_l203_20_2;
  wire       [6:0]    _zz__zz_when_Float_l203_20_3;
  wire       [3:0]    _zz__zz_when_Float_l203_20_4;
  wire       [3:0]    _zz__zz_when_Float_l203_20_5;
  wire       [6:0]    _zz__zz_when_Float_l203_20_6;
  wire       [1:0]    _zz__zz_when_Float_l203_20_7;
  wire       [6:0]    _zz__zz_io_c_stream_payload_0_exponent;
  reg        [2:0]    biasMem_0_mantissa;
  reg        [3:0]    biasMem_0_exponent;
  reg                 biasMem_0_sign;
  reg        [2:0]    biasMem_1_mantissa;
  reg        [3:0]    biasMem_1_exponent;
  reg                 biasMem_1_sign;
  reg        [2:0]    biasMem_2_mantissa;
  reg        [3:0]    biasMem_2_exponent;
  reg                 biasMem_2_sign;
  reg        [2:0]    biasMem_3_mantissa;
  reg        [3:0]    biasMem_3_exponent;
  reg                 biasMem_3_sign;
  reg        [2:0]    biasMem_4_mantissa;
  reg        [3:0]    biasMem_4_exponent;
  reg                 biasMem_4_sign;
  reg        [2:0]    biasMem_5_mantissa;
  reg        [3:0]    biasMem_5_exponent;
  reg                 biasMem_5_sign;
  reg        [2:0]    biasMem_6_mantissa;
  reg        [3:0]    biasMem_6_exponent;
  reg                 biasMem_6_sign;
  reg        [2:0]    biasMem_7_mantissa;
  reg        [3:0]    biasMem_7_exponent;
  reg                 biasMem_7_sign;
  reg        [2:0]    biasMem_8_mantissa;
  reg        [3:0]    biasMem_8_exponent;
  reg                 biasMem_8_sign;
  reg        [2:0]    biasMem_9_mantissa;
  reg        [3:0]    biasMem_9_exponent;
  reg                 biasMem_9_sign;
  reg                 loadCounter_willIncrement;
  wire                loadCounter_willDecrement;
  reg                 loadCounter_willClear;
  wire                loadCounter_willLoad;
  reg        [3:0]    loadCounter_valueNext;
  reg        [3:0]    loadCounter_value;
  wire                loadCounter_willOverflowIfInc;
  wire                loadCounter_willUnderflowIfDec;
  wire                loadCounter_willOverflow;
  wire                loadCounter_willUnderflow;
  reg                 aCounter_willIncrement;
  wire                aCounter_willDecrement;
  reg                 aCounter_willClear;
  wire                aCounter_willLoad;
  reg        [3:0]    aCounter_valueNext;
  reg        [3:0]    aCounter_value;
  wire                aCounter_willOverflowIfInc;
  wire                aCounter_willUnderflowIfDec;
  wire                aCounter_willOverflow;
  wire                aCounter_willUnderflow;
  wire       [7:0]    _zz_io_c_stream_payload_0_mantissa;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [1:0]    fsm_stateReg;
  reg        [1:0]    fsm_stateNext;
  wire       [15:0]   _zz_1;
  wire                _zz_2;
  wire                _zz_3;
  wire                _zz_4;
  wire                _zz_5;
  wire                _zz_6;
  wire                _zz_7;
  wire                _zz_8;
  wire                _zz_9;
  wire                _zz_10;
  wire                _zz_11;
  wire       [3:0]    _zz_when_Float_l199;
  wire       [2:0]    _zz_when_Float_l203;
  wire       [3:0]    _zz_when_Float_l199_1;
  wire                _zz_when_Float_l203_1;
  reg        [2:0]    _zz_io_c_stream_payload_0_mantissa_1;
  reg        [3:0]    _zz_io_c_stream_payload_0_exponent;
  reg                 _zz_io_c_stream_payload_0_sign;
  wire                _zz_when_Float_l203_2;
  wire       [3:0]    _zz_when_Float_l203_3;
  wire                _zz_io_c_stream_payload_0_sign_1;
  wire       [3:0]    _zz_when_Float_l203_4;
  wire       [6:0]    _zz_when_Float_l203_5;
  wire       [3:0]    _zz_when_Float_l203_6;
  wire       [6:0]    _zz_when_Float_l203_7;
  wire       [7:0]    _zz_when_Float_l203_8;
  wire       [7:0]    _zz_when_Float_l203_9;
  wire       [7:0]    _zz_when_Float_l203_10;
  wire       [7:0]    _zz_when_Float_l203_11;
  wire                _zz_when_Float_l203_12;
  wire                _zz_when_Float_l203_13;
  wire                _zz_when_Float_l203_14;
  wire                _zz_when_Float_l203_15;
  wire                _zz_when_Float_l203_16;
  wire                _zz_when_Float_l203_17;
  wire                _zz_when_Float_l203_18;
  wire       [2:0]    _zz_when_Float_l203_19;
  wire       [14:0]   _zz_io_c_stream_payload_0_mantissa_2;
  wire       [2:0]    _zz_io_c_stream_payload_0_mantissa_3;
  wire       [3:0]    _zz_io_c_stream_payload_0_mantissa_4;
  wire                _zz_io_c_stream_payload_0_mantissa_5;
  wire       [6:0]    _zz_when_Float_l203_20;
  wire                when_Float_l199;
  wire                when_Float_l203;
  wire                when_Float_l207;
  wire                io_a_stream_fire;
  `ifndef SYNTHESIS
  reg [103:0] fsm_stateReg_string;
  reg [103:0] fsm_stateNext_string;
  `endif


  assign _zz_loadCounter_valueNext_1 = loadCounter_willIncrement;
  assign _zz_loadCounter_valueNext = {3'd0, _zz_loadCounter_valueNext_1};
  assign _zz_aCounter_valueNext_1 = aCounter_willIncrement;
  assign _zz_aCounter_valueNext = {3'd0, _zz_aCounter_valueNext_1};
  assign _zz__zz_when_Float_l199 = (_zz__zz_when_Float_l199_1 + 4'b0000);
  assign _zz__zz_when_Float_l199_1 = (_zz__zz_when_Float_l199_2 % 4'b1010);
  assign _zz__zz_when_Float_l199_2 = (aCounter_value * 1'b1);
  assign _zz__zz_when_Float_l203_8 = ({1'b0,_zz_when_Float_l203_5} + {1'b0,_zz_when_Float_l203_7});
  assign _zz__zz_when_Float_l203_8_2 = (_zz_when_Float_l203_5 - _zz_when_Float_l203_7);
  assign _zz__zz_when_Float_l203_8_1 = {1'd0, _zz__zz_when_Float_l203_8_2};
  assign _zz__zz_when_Float_l203_11 = (_zz_when_Float_l203_10 - 8'h01);
  assign _zz__zz_io_c_stream_payload_0_mantissa_4_1 = {1'b0,(_zz_io_c_stream_payload_0_mantissa_2[3] && ((_zz_io_c_stream_payload_0_mantissa_2[2 : 0] != 3'b000) || _zz_io_c_stream_payload_0_mantissa_3[0]))};
  assign _zz__zz_io_c_stream_payload_0_mantissa_4 = {2'd0, _zz__zz_io_c_stream_payload_0_mantissa_4_1};
  assign _zz__zz_when_Float_l203_20 = ($signed(_zz__zz_when_Float_l203_20_1) + $signed(_zz__zz_when_Float_l203_20_3));
  assign _zz__zz_when_Float_l203_20_2 = {1'b0,_zz_when_Float_l203_3};
  assign _zz__zz_when_Float_l203_20_1 = {{2{_zz__zz_when_Float_l203_20_2[4]}}, _zz__zz_when_Float_l203_20_2};
  assign _zz__zz_when_Float_l203_20_4 = ($signed(4'b0001) - $signed(_zz__zz_when_Float_l203_20_5));
  assign _zz__zz_when_Float_l203_20_3 = {{3{_zz__zz_when_Float_l203_20_4[3]}}, _zz__zz_when_Float_l203_20_4};
  assign _zz__zz_when_Float_l203_20_5 = {1'b0,_zz_when_Float_l203_19};
  assign _zz__zz_when_Float_l203_20_7 = {1'b0,_zz_io_c_stream_payload_0_mantissa_5};
  assign _zz__zz_when_Float_l203_20_6 = {{5{_zz__zz_when_Float_l203_20_7[1]}}, _zz__zz_when_Float_l203_20_7};
  assign _zz__zz_io_c_stream_payload_0_exponent = _zz_when_Float_l203_20;
  always @(*) begin
    case(_zz_when_Float_l199)
      4'b0000 : begin
        _zz__zz_when_Float_l203 = biasMem_0_mantissa;
        _zz__zz_when_Float_l199_1_1 = biasMem_0_exponent;
        _zz__zz_when_Float_l203_1 = biasMem_0_sign;
      end
      4'b0001 : begin
        _zz__zz_when_Float_l203 = biasMem_1_mantissa;
        _zz__zz_when_Float_l199_1_1 = biasMem_1_exponent;
        _zz__zz_when_Float_l203_1 = biasMem_1_sign;
      end
      4'b0010 : begin
        _zz__zz_when_Float_l203 = biasMem_2_mantissa;
        _zz__zz_when_Float_l199_1_1 = biasMem_2_exponent;
        _zz__zz_when_Float_l203_1 = biasMem_2_sign;
      end
      4'b0011 : begin
        _zz__zz_when_Float_l203 = biasMem_3_mantissa;
        _zz__zz_when_Float_l199_1_1 = biasMem_3_exponent;
        _zz__zz_when_Float_l203_1 = biasMem_3_sign;
      end
      4'b0100 : begin
        _zz__zz_when_Float_l203 = biasMem_4_mantissa;
        _zz__zz_when_Float_l199_1_1 = biasMem_4_exponent;
        _zz__zz_when_Float_l203_1 = biasMem_4_sign;
      end
      4'b0101 : begin
        _zz__zz_when_Float_l203 = biasMem_5_mantissa;
        _zz__zz_when_Float_l199_1_1 = biasMem_5_exponent;
        _zz__zz_when_Float_l203_1 = biasMem_5_sign;
      end
      4'b0110 : begin
        _zz__zz_when_Float_l203 = biasMem_6_mantissa;
        _zz__zz_when_Float_l199_1_1 = biasMem_6_exponent;
        _zz__zz_when_Float_l203_1 = biasMem_6_sign;
      end
      4'b0111 : begin
        _zz__zz_when_Float_l203 = biasMem_7_mantissa;
        _zz__zz_when_Float_l199_1_1 = biasMem_7_exponent;
        _zz__zz_when_Float_l203_1 = biasMem_7_sign;
      end
      4'b1000 : begin
        _zz__zz_when_Float_l203 = biasMem_8_mantissa;
        _zz__zz_when_Float_l199_1_1 = biasMem_8_exponent;
        _zz__zz_when_Float_l203_1 = biasMem_8_sign;
      end
      default : begin
        _zz__zz_when_Float_l203 = biasMem_9_mantissa;
        _zz__zz_when_Float_l199_1_1 = biasMem_9_exponent;
        _zz__zz_when_Float_l203_1 = biasMem_9_sign;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_2_BOOT : fsm_stateReg_string = "BOOT         ";
      fsm_2_stateLoadBias : fsm_stateReg_string = "stateLoadBias";
      fsm_2_stateProcess : fsm_stateReg_string = "stateProcess ";
      fsm_2_stateDone : fsm_stateReg_string = "stateDone    ";
      default : fsm_stateReg_string = "?????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_2_BOOT : fsm_stateNext_string = "BOOT         ";
      fsm_2_stateLoadBias : fsm_stateNext_string = "stateLoadBias";
      fsm_2_stateProcess : fsm_stateNext_string = "stateProcess ";
      fsm_2_stateDone : fsm_stateNext_string = "stateDone    ";
      default : fsm_stateNext_string = "?????????????";
    endcase
  end
  `endif

  always @(*) begin
    loadCounter_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
        if(io_b_stream_valid) begin
          loadCounter_willIncrement = 1'b1;
        end
      end
      fsm_2_stateProcess : begin
      end
      fsm_2_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  assign loadCounter_willDecrement = 1'b0;
  always @(*) begin
    loadCounter_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
        if(io_reArm) begin
          loadCounter_willClear = 1'b1;
        end
      end
      fsm_2_stateProcess : begin
      end
      fsm_2_stateDone : begin
        loadCounter_willClear = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign loadCounter_willLoad = 1'b0;
  assign loadCounter_willOverflowIfInc = (loadCounter_value == 4'b1001);
  assign loadCounter_willUnderflowIfDec = (loadCounter_value == 4'b0000);
  assign loadCounter_willOverflow = (loadCounter_willOverflowIfInc && loadCounter_willIncrement);
  always @(*) begin
    loadCounter_valueNext = (loadCounter_value + _zz_loadCounter_valueNext);
    if(loadCounter_willOverflow) begin
      loadCounter_valueNext = 4'b0000;
    end
    if(loadCounter_willClear) begin
      loadCounter_valueNext = 4'b0000;
    end
  end

  assign loadCounter_willUnderflow = (loadCounter_willUnderflowIfDec && loadCounter_willDecrement);
  always @(*) begin
    aCounter_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
      end
      fsm_2_stateProcess : begin
        if(io_a_stream_fire) begin
          aCounter_willIncrement = 1'b1;
        end
      end
      fsm_2_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  assign aCounter_willDecrement = 1'b0;
  always @(*) begin
    aCounter_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
      end
      fsm_2_stateProcess : begin
        if(io_reArm) begin
          aCounter_willClear = 1'b1;
        end
      end
      fsm_2_stateDone : begin
        aCounter_willClear = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign aCounter_willLoad = 1'b0;
  assign aCounter_willOverflowIfInc = (aCounter_value == 4'b1001);
  assign aCounter_willUnderflowIfDec = (aCounter_value == 4'b0000);
  assign aCounter_willOverflow = (aCounter_willOverflowIfInc && aCounter_willIncrement);
  always @(*) begin
    aCounter_valueNext = (aCounter_value + _zz_aCounter_valueNext);
    if(aCounter_willOverflow) begin
      aCounter_valueNext = 4'b0000;
    end
    if(aCounter_willClear) begin
      aCounter_valueNext = 4'b0000;
    end
  end

  assign aCounter_willUnderflow = (aCounter_willUnderflowIfDec && aCounter_willDecrement);
  always @(*) begin
    io_a_stream_ready = 1'b0;
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
      end
      fsm_2_stateProcess : begin
        io_a_stream_ready = io_c_stream_ready;
      end
      fsm_2_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_b_stream_ready = 1'b0;
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
        io_b_stream_ready = 1'b1;
      end
      fsm_2_stateProcess : begin
      end
      fsm_2_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_c_stream_valid = 1'b0;
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
      end
      fsm_2_stateProcess : begin
        io_c_stream_valid = io_a_stream_valid;
      end
      fsm_2_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  assign _zz_io_c_stream_payload_0_mantissa = 8'h0;
  always @(*) begin
    io_c_stream_payload_0_mantissa = _zz_io_c_stream_payload_0_mantissa[2 : 0];
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
      end
      fsm_2_stateProcess : begin
        io_c_stream_payload_0_mantissa = _zz_io_c_stream_payload_0_mantissa_1;
      end
      fsm_2_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_c_stream_payload_0_exponent = _zz_io_c_stream_payload_0_mantissa[6 : 3];
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
      end
      fsm_2_stateProcess : begin
        io_c_stream_payload_0_exponent = _zz_io_c_stream_payload_0_exponent;
      end
      fsm_2_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_c_stream_payload_0_sign = _zz_io_c_stream_payload_0_mantissa[7];
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
      end
      fsm_2_stateProcess : begin
        io_c_stream_payload_0_sign = _zz_io_c_stream_payload_0_sign;
      end
      fsm_2_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
      end
      fsm_2_stateProcess : begin
      end
      fsm_2_stateDone : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
        if(io_b_stream_valid) begin
          if(loadCounter_willOverflowIfInc) begin
            fsm_stateNext = fsm_2_stateProcess;
          end
        end
      end
      fsm_2_stateProcess : begin
        if(io_a_stream_fire) begin
          if(aCounter_willOverflowIfInc) begin
            fsm_stateNext = fsm_2_stateDone;
          end
        end
        if(io_reArm) begin
          fsm_stateNext = fsm_2_stateLoadBias;
        end
      end
      fsm_2_stateDone : begin
        fsm_stateNext = fsm_2_stateLoadBias;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_2_stateLoadBias;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_2_BOOT;
    end
  end

  assign _zz_1 = ({15'd0,1'b1} <<< loadCounter_value);
  assign _zz_2 = _zz_1[0];
  assign _zz_3 = _zz_1[1];
  assign _zz_4 = _zz_1[2];
  assign _zz_5 = _zz_1[3];
  assign _zz_6 = _zz_1[4];
  assign _zz_7 = _zz_1[5];
  assign _zz_8 = _zz_1[6];
  assign _zz_9 = _zz_1[7];
  assign _zz_10 = _zz_1[8];
  assign _zz_11 = _zz_1[9];
  assign _zz_when_Float_l199 = (_zz__zz_when_Float_l199 % 4'b1010);
  assign _zz_when_Float_l203 = _zz__zz_when_Float_l203;
  assign _zz_when_Float_l199_1 = _zz__zz_when_Float_l199_1_1;
  assign _zz_when_Float_l203_1 = _zz__zz_when_Float_l203_1;
  assign _zz_when_Float_l203_2 = ((_zz_when_Float_l199_1 < io_a_stream_payload_0_exponent) || ((io_a_stream_payload_0_exponent == _zz_when_Float_l199_1) && (_zz_when_Float_l203 <= io_a_stream_payload_0_mantissa)));
  assign _zz_when_Float_l203_3 = (_zz_when_Float_l203_2 ? io_a_stream_payload_0_exponent : _zz_when_Float_l199_1);
  assign _zz_io_c_stream_payload_0_sign_1 = (_zz_when_Float_l203_2 ? io_a_stream_payload_0_sign : _zz_when_Float_l203_1);
  assign _zz_when_Float_l203_4 = (_zz_when_Float_l203_2 ? _zz_when_Float_l199_1 : io_a_stream_payload_0_exponent);
  assign _zz_when_Float_l203_5 = {((_zz_when_Float_l203_3 == 4'b0000) ? 4'b0000 : {1'b1,(_zz_when_Float_l203_2 ? io_a_stream_payload_0_mantissa : _zz_when_Float_l203)}),3'b000};
  assign _zz_when_Float_l203_6 = (_zz_when_Float_l203_3 - _zz_when_Float_l203_4);
  assign _zz_when_Float_l203_7 = ({((_zz_when_Float_l203_4 == 4'b0000) ? 4'b0000 : {1'b1,(_zz_when_Float_l203_2 ? _zz_when_Float_l203 : io_a_stream_payload_0_mantissa)}),3'b000} >>> ((4'b1000 < _zz_when_Float_l203_6) ? 4'b1000 : _zz_when_Float_l203_6));
  assign _zz_when_Float_l203_8 = ((_zz_io_c_stream_payload_0_sign_1 == (_zz_when_Float_l203_2 ? _zz_when_Float_l203_1 : io_a_stream_payload_0_sign)) ? _zz__zz_when_Float_l203_8 : _zz__zz_when_Float_l203_8_1);
  assign _zz_when_Float_l203_9 = _zz_when_Float_l203_8;
  assign _zz_when_Float_l203_10 = {_zz_when_Float_l203_9[0],{_zz_when_Float_l203_9[1],{_zz_when_Float_l203_9[2],{_zz_when_Float_l203_9[3],{_zz_when_Float_l203_9[4],{_zz_when_Float_l203_9[5],{_zz_when_Float_l203_9[6],_zz_when_Float_l203_9[7]}}}}}}};
  assign _zz_when_Float_l203_11 = (_zz_when_Float_l203_10 & (~ _zz__zz_when_Float_l203_11));
  assign _zz_when_Float_l203_12 = _zz_when_Float_l203_11[3];
  assign _zz_when_Float_l203_13 = _zz_when_Float_l203_11[5];
  assign _zz_when_Float_l203_14 = _zz_when_Float_l203_11[6];
  assign _zz_when_Float_l203_15 = _zz_when_Float_l203_11[7];
  assign _zz_when_Float_l203_16 = (((_zz_when_Float_l203_11[1] || _zz_when_Float_l203_12) || _zz_when_Float_l203_13) || _zz_when_Float_l203_15);
  assign _zz_when_Float_l203_17 = (((_zz_when_Float_l203_11[2] || _zz_when_Float_l203_12) || _zz_when_Float_l203_14) || _zz_when_Float_l203_15);
  assign _zz_when_Float_l203_18 = (((_zz_when_Float_l203_11[4] || _zz_when_Float_l203_13) || _zz_when_Float_l203_14) || _zz_when_Float_l203_15);
  assign _zz_when_Float_l203_19 = {_zz_when_Float_l203_18,{_zz_when_Float_l203_17,_zz_when_Float_l203_16}};
  assign _zz_io_c_stream_payload_0_mantissa_2 = ({7'd0,_zz_when_Float_l203_8} <<< _zz_when_Float_l203_19);
  assign _zz_io_c_stream_payload_0_mantissa_3 = _zz_io_c_stream_payload_0_mantissa_2[6 : 4];
  assign _zz_io_c_stream_payload_0_mantissa_4 = ({1'b0,_zz_io_c_stream_payload_0_mantissa_3} + _zz__zz_io_c_stream_payload_0_mantissa_4);
  assign _zz_io_c_stream_payload_0_mantissa_5 = _zz_io_c_stream_payload_0_mantissa_4[3];
  assign _zz_when_Float_l203_20 = ($signed(_zz__zz_when_Float_l203_20) + $signed(_zz__zz_when_Float_l203_20_6));
  always @(*) begin
    _zz_io_c_stream_payload_0_sign = _zz_io_c_stream_payload_0_sign_1;
    if(when_Float_l199) begin
      _zz_io_c_stream_payload_0_sign = 1'b0;
    end else begin
      if(when_Float_l203) begin
        _zz_io_c_stream_payload_0_sign = 1'b0;
      end
    end
  end

  assign when_Float_l199 = ((io_a_stream_payload_0_exponent == 4'b0000) && (_zz_when_Float_l199_1 == 4'b0000));
  always @(*) begin
    if(when_Float_l199) begin
      _zz_io_c_stream_payload_0_exponent = 4'b0000;
    end else begin
      if(when_Float_l203) begin
        _zz_io_c_stream_payload_0_exponent = 4'b0000;
      end else begin
        if(when_Float_l207) begin
          _zz_io_c_stream_payload_0_exponent = 4'b1111;
        end else begin
          _zz_io_c_stream_payload_0_exponent = _zz__zz_io_c_stream_payload_0_exponent[3:0];
        end
      end
    end
  end

  always @(*) begin
    if(when_Float_l199) begin
      _zz_io_c_stream_payload_0_mantissa_1 = 3'b000;
    end else begin
      if(when_Float_l203) begin
        _zz_io_c_stream_payload_0_mantissa_1 = 3'b000;
      end else begin
        if(when_Float_l207) begin
          _zz_io_c_stream_payload_0_mantissa_1 = 3'b000;
        end else begin
          _zz_io_c_stream_payload_0_mantissa_1 = (_zz_io_c_stream_payload_0_mantissa_5 ? 3'b000 : _zz_io_c_stream_payload_0_mantissa_4[2 : 0]);
        end
      end
    end
  end

  assign when_Float_l203 = ((_zz_when_Float_l203_8 == 8'h0) || ($signed(_zz_when_Float_l203_20) <= $signed(7'h0)));
  assign when_Float_l207 = ($signed(7'h0f) <= $signed(_zz_when_Float_l203_20));
  assign io_a_stream_fire = (io_a_stream_valid && io_a_stream_ready);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      biasMem_0_mantissa <= 3'b000;
      biasMem_0_exponent <= 4'b0000;
      biasMem_0_sign <= 1'b0;
      biasMem_1_mantissa <= 3'b000;
      biasMem_1_exponent <= 4'b0000;
      biasMem_1_sign <= 1'b0;
      biasMem_2_mantissa <= 3'b000;
      biasMem_2_exponent <= 4'b0000;
      biasMem_2_sign <= 1'b0;
      biasMem_3_mantissa <= 3'b000;
      biasMem_3_exponent <= 4'b0000;
      biasMem_3_sign <= 1'b0;
      biasMem_4_mantissa <= 3'b000;
      biasMem_4_exponent <= 4'b0000;
      biasMem_4_sign <= 1'b0;
      biasMem_5_mantissa <= 3'b000;
      biasMem_5_exponent <= 4'b0000;
      biasMem_5_sign <= 1'b0;
      biasMem_6_mantissa <= 3'b000;
      biasMem_6_exponent <= 4'b0000;
      biasMem_6_sign <= 1'b0;
      biasMem_7_mantissa <= 3'b000;
      biasMem_7_exponent <= 4'b0000;
      biasMem_7_sign <= 1'b0;
      biasMem_8_mantissa <= 3'b000;
      biasMem_8_exponent <= 4'b0000;
      biasMem_8_sign <= 1'b0;
      biasMem_9_mantissa <= 3'b000;
      biasMem_9_exponent <= 4'b0000;
      biasMem_9_sign <= 1'b0;
      loadCounter_value <= 4'b0000;
      aCounter_value <= 4'b0000;
      fsm_stateReg <= fsm_2_BOOT;
    end else begin
      loadCounter_value <= loadCounter_valueNext;
      aCounter_value <= aCounter_valueNext;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_2_stateLoadBias : begin
          if(io_b_stream_valid) begin
            if(_zz_2) begin
              biasMem_0_mantissa <= io_b_stream_payload_0_mantissa;
            end
            if(_zz_3) begin
              biasMem_1_mantissa <= io_b_stream_payload_0_mantissa;
            end
            if(_zz_4) begin
              biasMem_2_mantissa <= io_b_stream_payload_0_mantissa;
            end
            if(_zz_5) begin
              biasMem_3_mantissa <= io_b_stream_payload_0_mantissa;
            end
            if(_zz_6) begin
              biasMem_4_mantissa <= io_b_stream_payload_0_mantissa;
            end
            if(_zz_7) begin
              biasMem_5_mantissa <= io_b_stream_payload_0_mantissa;
            end
            if(_zz_8) begin
              biasMem_6_mantissa <= io_b_stream_payload_0_mantissa;
            end
            if(_zz_9) begin
              biasMem_7_mantissa <= io_b_stream_payload_0_mantissa;
            end
            if(_zz_10) begin
              biasMem_8_mantissa <= io_b_stream_payload_0_mantissa;
            end
            if(_zz_11) begin
              biasMem_9_mantissa <= io_b_stream_payload_0_mantissa;
            end
            if(_zz_2) begin
              biasMem_0_exponent <= io_b_stream_payload_0_exponent;
            end
            if(_zz_3) begin
              biasMem_1_exponent <= io_b_stream_payload_0_exponent;
            end
            if(_zz_4) begin
              biasMem_2_exponent <= io_b_stream_payload_0_exponent;
            end
            if(_zz_5) begin
              biasMem_3_exponent <= io_b_stream_payload_0_exponent;
            end
            if(_zz_6) begin
              biasMem_4_exponent <= io_b_stream_payload_0_exponent;
            end
            if(_zz_7) begin
              biasMem_5_exponent <= io_b_stream_payload_0_exponent;
            end
            if(_zz_8) begin
              biasMem_6_exponent <= io_b_stream_payload_0_exponent;
            end
            if(_zz_9) begin
              biasMem_7_exponent <= io_b_stream_payload_0_exponent;
            end
            if(_zz_10) begin
              biasMem_8_exponent <= io_b_stream_payload_0_exponent;
            end
            if(_zz_11) begin
              biasMem_9_exponent <= io_b_stream_payload_0_exponent;
            end
            if(_zz_2) begin
              biasMem_0_sign <= io_b_stream_payload_0_sign;
            end
            if(_zz_3) begin
              biasMem_1_sign <= io_b_stream_payload_0_sign;
            end
            if(_zz_4) begin
              biasMem_2_sign <= io_b_stream_payload_0_sign;
            end
            if(_zz_5) begin
              biasMem_3_sign <= io_b_stream_payload_0_sign;
            end
            if(_zz_6) begin
              biasMem_4_sign <= io_b_stream_payload_0_sign;
            end
            if(_zz_7) begin
              biasMem_5_sign <= io_b_stream_payload_0_sign;
            end
            if(_zz_8) begin
              biasMem_6_sign <= io_b_stream_payload_0_sign;
            end
            if(_zz_9) begin
              biasMem_7_sign <= io_b_stream_payload_0_sign;
            end
            if(_zz_10) begin
              biasMem_8_sign <= io_b_stream_payload_0_sign;
            end
            if(_zz_11) begin
              biasMem_9_sign <= io_b_stream_payload_0_sign;
            end
          end
        end
        fsm_2_stateProcess : begin
        end
        fsm_2_stateDone : begin
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module MatmulOp_1 (
  input  wire          io_a_stream_valid,
  output reg           io_a_stream_ready,
  input  wire [2:0]    io_a_stream_payload_0_mantissa,
  input  wire [3:0]    io_a_stream_payload_0_exponent,
  input  wire          io_a_stream_payload_0_sign,
  input  wire [2:0]    io_a_stream_payload_1_mantissa,
  input  wire [3:0]    io_a_stream_payload_1_exponent,
  input  wire          io_a_stream_payload_1_sign,
  input  wire [2:0]    io_a_stream_payload_2_mantissa,
  input  wire [3:0]    io_a_stream_payload_2_exponent,
  input  wire          io_a_stream_payload_2_sign,
  input  wire [2:0]    io_a_stream_payload_3_mantissa,
  input  wire [3:0]    io_a_stream_payload_3_exponent,
  input  wire          io_a_stream_payload_3_sign,
  input  wire          io_b_stream_valid,
  output wire          io_b_stream_ready,
  input  wire [2:0]    io_b_stream_payload_0_mantissa,
  input  wire [3:0]    io_b_stream_payload_0_exponent,
  input  wire          io_b_stream_payload_0_sign,
  input  wire [2:0]    io_b_stream_payload_1_mantissa,
  input  wire [3:0]    io_b_stream_payload_1_exponent,
  input  wire          io_b_stream_payload_1_sign,
  input  wire [2:0]    io_b_stream_payload_2_mantissa,
  input  wire [3:0]    io_b_stream_payload_2_exponent,
  input  wire          io_b_stream_payload_2_sign,
  input  wire [2:0]    io_b_stream_payload_3_mantissa,
  input  wire [3:0]    io_b_stream_payload_3_exponent,
  input  wire          io_b_stream_payload_3_sign,
  output reg           io_c_stream_valid,
  input  wire          io_c_stream_ready,
  output reg  [2:0]    io_c_stream_payload_0_mantissa,
  output reg  [3:0]    io_c_stream_payload_0_exponent,
  output reg           io_c_stream_payload_0_sign,
  input  wire          io_reArm,
  input  wire          clk,
  input  wire          reset
);
  localparam StateMachineEnum_ = 3'd0;
  localparam StateMachineEnum__1 = 3'd1;
  localparam StateMachineEnum__2 = 3'd2;
  localparam StateMachineEnum__3 = 3'd3;
  localparam StateMachineEnum__4 = 3'd4;
  localparam StateMachineEnum__5 = 3'd5;

  wire       [9:0]    streamDoubleBuffer_7_io_readAddr;
  reg                 streamDoubleBuffer_7_io_nextTile;
  reg        [31:0]   _zz_2_spinal_port0;
  wire                streamDoubleBuffer_7_io_streamIn_ready;
  wire       [2:0]    streamDoubleBuffer_7_io_readData_0_mantissa;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_0_exponent;
  wire                streamDoubleBuffer_7_io_readData_0_sign;
  wire       [2:0]    streamDoubleBuffer_7_io_readData_1_mantissa;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_1_exponent;
  wire                streamDoubleBuffer_7_io_readData_1_sign;
  wire       [2:0]    streamDoubleBuffer_7_io_readData_2_mantissa;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_2_exponent;
  wire                streamDoubleBuffer_7_io_readData_2_sign;
  wire       [2:0]    streamDoubleBuffer_7_io_readData_3_mantissa;
  wire       [3:0]    streamDoubleBuffer_7_io_readData_3_exponent;
  wire                streamDoubleBuffer_7_io_readData_3_sign;
  wire                streamDoubleBuffer_7_io_tileReady;
  wire                streamDoubleBuffer_7_io_loadCanAccept;
  wire                streamDoubleBuffer_7_io_tileFilled;
  wire                streamDoubleBuffer_7_io_refreshSettled;
  wire       [3:0]    _zz_nCounter_valueNext;
  wire       [0:0]    _zz_nCounter_valueNext_1;
  wire       [6:0]    _zz_kCounter_valueNext;
  wire       [0:0]    _zz_kCounter_valueNext_1;
  wire       [3:0]    _zz_outCounter_valueNext;
  wire       [0:0]    _zz_outCounter_valueNext_1;
  wire       [6:0]    _zz__zz_4;
  wire       [0:0]    _zz__zz_4_1;
  wire       [6:0]    _zz__zz_io_readAddr_1;
  wire       [0:0]    _zz__zz_io_readAddr_1_1;
  wire       [10:0]   _zz_io_readAddr_3;
  wire       [10:0]   _zz_io_readAddr_4;
  wire       [10:0]   _zz_io_readAddr_5;
  wire                _zz__zz_2_port;
  wire                _zz__zz_when_Float_l65;
  wire       [3:0]    _zz__zz_when_Float_l65_18;
  wire       [1:0]    _zz__zz_when_Float_l65_18_1;
  wire       [6:0]    _zz__zz_when_Float_l65_20;
  wire       [6:0]    _zz__zz_when_Float_l65_20_1;
  wire       [6:0]    _zz__zz_when_Float_l65_20_2;
  wire       [6:0]    _zz__zz_when_Float_l65_20_3;
  wire       [4:0]    _zz__zz_when_Float_l65_20_4;
  wire       [6:0]    _zz__zz_when_Float_l65_20_5;
  wire       [4:0]    _zz__zz_when_Float_l65_20_6;
  wire       [6:0]    _zz__zz_when_Float_l65_20_7;
  wire       [1:0]    _zz__zz_when_Float_l65_20_8;
  wire       [6:0]    _zz__zz_when_Float_l65_20_9;
  wire       [1:0]    _zz__zz_when_Float_l65_20_10;
  wire       [6:0]    _zz__zz_when_Float_l199_4;
  wire       [3:0]    _zz__zz_when_Float_l65_26;
  wire       [1:0]    _zz__zz_when_Float_l65_26_1;
  wire       [6:0]    _zz__zz_when_Float_l65_28;
  wire       [6:0]    _zz__zz_when_Float_l65_28_1;
  wire       [6:0]    _zz__zz_when_Float_l65_28_2;
  wire       [6:0]    _zz__zz_when_Float_l65_28_3;
  wire       [4:0]    _zz__zz_when_Float_l65_28_4;
  wire       [6:0]    _zz__zz_when_Float_l65_28_5;
  wire       [4:0]    _zz__zz_when_Float_l65_28_6;
  wire       [6:0]    _zz__zz_when_Float_l65_28_7;
  wire       [1:0]    _zz__zz_when_Float_l65_28_8;
  wire       [6:0]    _zz__zz_when_Float_l65_28_9;
  wire       [1:0]    _zz__zz_when_Float_l65_28_10;
  wire       [6:0]    _zz__zz_when_Float_l199_5;
  wire       [3:0]    _zz__zz_when_Float_l65_34;
  wire       [1:0]    _zz__zz_when_Float_l65_34_1;
  wire       [6:0]    _zz__zz_when_Float_l65_36;
  wire       [6:0]    _zz__zz_when_Float_l65_36_1;
  wire       [6:0]    _zz__zz_when_Float_l65_36_2;
  wire       [6:0]    _zz__zz_when_Float_l65_36_3;
  wire       [4:0]    _zz__zz_when_Float_l65_36_4;
  wire       [6:0]    _zz__zz_when_Float_l65_36_5;
  wire       [4:0]    _zz__zz_when_Float_l65_36_6;
  wire       [6:0]    _zz__zz_when_Float_l65_36_7;
  wire       [1:0]    _zz__zz_when_Float_l65_36_8;
  wire       [6:0]    _zz__zz_when_Float_l65_36_9;
  wire       [1:0]    _zz__zz_when_Float_l65_36_10;
  wire       [6:0]    _zz__zz_when_Float_l199_6;
  wire       [3:0]    _zz__zz_when_Float_l65_42;
  wire       [1:0]    _zz__zz_when_Float_l65_42_1;
  wire       [6:0]    _zz__zz_when_Float_l65_44;
  wire       [6:0]    _zz__zz_when_Float_l65_44_1;
  wire       [6:0]    _zz__zz_when_Float_l65_44_2;
  wire       [6:0]    _zz__zz_when_Float_l65_44_3;
  wire       [4:0]    _zz__zz_when_Float_l65_44_4;
  wire       [6:0]    _zz__zz_when_Float_l65_44_5;
  wire       [4:0]    _zz__zz_when_Float_l65_44_6;
  wire       [6:0]    _zz__zz_when_Float_l65_44_7;
  wire       [1:0]    _zz__zz_when_Float_l65_44_8;
  wire       [6:0]    _zz__zz_when_Float_l65_44_9;
  wire       [1:0]    _zz__zz_when_Float_l65_44_10;
  wire       [6:0]    _zz__zz_when_Float_l199_7;
  wire       [7:0]    _zz__zz_when_Float_l203_25;
  wire       [7:0]    _zz__zz_when_Float_l203_25_1;
  wire       [6:0]    _zz__zz_when_Float_l203_25_2;
  wire       [7:0]    _zz__zz_when_Float_l203_28;
  wire       [3:0]    _zz__zz_when_Float_l203_39;
  wire       [1:0]    _zz__zz_when_Float_l203_39_1;
  wire       [6:0]    _zz__zz_when_Float_l203_41;
  wire       [6:0]    _zz__zz_when_Float_l203_41_1;
  wire       [4:0]    _zz__zz_when_Float_l203_41_2;
  wire       [6:0]    _zz__zz_when_Float_l203_41_3;
  wire       [3:0]    _zz__zz_when_Float_l203_41_4;
  wire       [3:0]    _zz__zz_when_Float_l203_41_5;
  wire       [6:0]    _zz__zz_when_Float_l203_41_6;
  wire       [1:0]    _zz__zz_when_Float_l203_41_7;
  wire       [6:0]    _zz__zz_when_Float_l199_8;
  wire       [7:0]    _zz__zz_when_Float_l203_53;
  wire       [7:0]    _zz__zz_when_Float_l203_53_1;
  wire       [6:0]    _zz__zz_when_Float_l203_53_2;
  wire       [7:0]    _zz__zz_when_Float_l203_56;
  wire       [3:0]    _zz__zz_when_Float_l203_67;
  wire       [1:0]    _zz__zz_when_Float_l203_67_1;
  wire       [6:0]    _zz__zz_when_Float_l203_69;
  wire       [6:0]    _zz__zz_when_Float_l203_69_1;
  wire       [4:0]    _zz__zz_when_Float_l203_69_2;
  wire       [6:0]    _zz__zz_when_Float_l203_69_3;
  wire       [3:0]    _zz__zz_when_Float_l203_69_4;
  wire       [3:0]    _zz__zz_when_Float_l203_69_5;
  wire       [6:0]    _zz__zz_when_Float_l203_69_6;
  wire       [1:0]    _zz__zz_when_Float_l203_69_7;
  wire       [6:0]    _zz__zz_when_Float_l199_10;
  wire       [7:0]    _zz__zz_when_Float_l203_81;
  wire       [7:0]    _zz__zz_when_Float_l203_81_1;
  wire       [6:0]    _zz__zz_when_Float_l203_81_2;
  wire       [7:0]    _zz__zz_when_Float_l203_84;
  wire       [3:0]    _zz__zz_when_Float_l203_95;
  wire       [1:0]    _zz__zz_when_Float_l203_95_1;
  wire       [6:0]    _zz__zz_when_Float_l203_97;
  wire       [6:0]    _zz__zz_when_Float_l203_97_1;
  wire       [4:0]    _zz__zz_when_Float_l203_97_2;
  wire       [6:0]    _zz__zz_when_Float_l203_97_3;
  wire       [3:0]    _zz__zz_when_Float_l203_97_4;
  wire       [3:0]    _zz__zz_when_Float_l203_97_5;
  wire       [6:0]    _zz__zz_when_Float_l203_97_6;
  wire       [1:0]    _zz__zz_when_Float_l203_97_7;
  wire       [6:0]    _zz__zz_when_Float_l199_12;
  reg        [2:0]    _zz__zz_when_Float_l203_100;
  reg        [3:0]    _zz__zz_when_Float_l199_15;
  reg                 _zz__zz_when_Float_l203_101;
  wire       [7:0]    _zz__zz_when_Float_l203_109;
  wire       [7:0]    _zz__zz_when_Float_l203_109_1;
  wire       [6:0]    _zz__zz_when_Float_l203_109_2;
  wire       [7:0]    _zz__zz_when_Float_l203_112;
  wire       [3:0]    _zz__zz_io_c_stream_payload_0_mantissa_14;
  wire       [1:0]    _zz__zz_io_c_stream_payload_0_mantissa_14_1;
  wire       [6:0]    _zz__zz_when_Float_l203_122;
  wire       [6:0]    _zz__zz_when_Float_l203_122_1;
  wire       [4:0]    _zz__zz_when_Float_l203_122_2;
  wire       [6:0]    _zz__zz_when_Float_l203_122_3;
  wire       [3:0]    _zz__zz_when_Float_l203_122_4;
  wire       [3:0]    _zz__zz_when_Float_l203_122_5;
  wire       [6:0]    _zz__zz_when_Float_l203_122_6;
  wire       [1:0]    _zz__zz_when_Float_l203_122_7;
  wire       [6:0]    _zz__zz_io_c_stream_payload_0_exponent_10;
  wire       [3:0]    _zz__zz_io_c_stream_payload_0_mantissa_17;
  wire       [0:0]    _zz__zz_io_c_stream_payload_0_mantissa_17_1;
  wire       [2:0]    _zz__zz_26;
  wire       [0:0]    _zz__zz_26_1;
  wire       [31:0]   _zz__zz_2_port_1;
  wire       [4:0]    _zz__zz_io_c_stream_payload_0_mantissa_19;
  wire       [4:0]    _zz__zz_io_c_stream_payload_0_mantissa_19_1;
  wire       [0:0]    _zz__zz_io_c_stream_payload_0_mantissa_19_2;
  wire       [4:0]    _zz__zz_io_c_stream_payload_0_mantissa_19_3;
  reg        [2:0]    _zz_io_c_stream_payload_0_mantissa_20;
  reg        [3:0]    _zz_io_c_stream_payload_0_exponent_11;
  reg                 _zz_io_c_stream_payload_0_sign_11;
  wire       [3:0]    _zz__zz_33;
  wire       [4:0]    _zz__zz_33_1;
  wire       [4:0]    _zz__zz_33_2;
  wire       [0:0]    _zz__zz_33_3;
  wire       [4:0]    _zz__zz_33_4;
  reg                 _zz_1;
  wire       [2:0]    accumulators_0_mantissa;
  wire       [3:0]    accumulators_0_exponent;
  wire                accumulators_0_sign;
  wire       [2:0]    accumulators_1_mantissa;
  wire       [3:0]    accumulators_1_exponent;
  wire                accumulators_1_sign;
  wire       [2:0]    accumulators_2_mantissa;
  wire       [3:0]    accumulators_2_exponent;
  wire                accumulators_2_sign;
  wire       [2:0]    accumulators_3_mantissa;
  wire       [3:0]    accumulators_3_exponent;
  wire                accumulators_3_sign;
  wire       [2:0]    accumulators_4_mantissa;
  wire       [3:0]    accumulators_4_exponent;
  wire                accumulators_4_sign;
  wire       [2:0]    accumulators_5_mantissa;
  wire       [3:0]    accumulators_5_exponent;
  wire                accumulators_5_sign;
  wire       [2:0]    accumulators_6_mantissa;
  wire       [3:0]    accumulators_6_exponent;
  wire                accumulators_6_sign;
  wire       [2:0]    accumulators_7_mantissa;
  wire       [3:0]    accumulators_7_exponent;
  wire                accumulators_7_sign;
  wire       [2:0]    accumulators_8_mantissa;
  wire       [3:0]    accumulators_8_exponent;
  wire                accumulators_8_sign;
  wire       [2:0]    accumulators_9_mantissa;
  wire       [3:0]    accumulators_9_exponent;
  wire                accumulators_9_sign;
  reg                 rowCounter_willIncrement;
  wire                rowCounter_willDecrement;
  wire                rowCounter_willClear;
  wire                rowCounter_willLoad;
  wire                rowCounter_willOverflowIfInc;
  wire                rowCounter_willUnderflowIfDec;
  wire                rowCounter_willOverflow;
  wire                rowCounter_willUnderflow;
  reg                 nCounter_willIncrement;
  wire                nCounter_willDecrement;
  wire                nCounter_willClear;
  wire                nCounter_willLoad;
  reg        [3:0]    nCounter_valueNext;
  reg        [3:0]    nCounter_value;
  wire                nCounter_willOverflowIfInc;
  wire                nCounter_willUnderflowIfDec;
  wire                nCounter_willOverflow;
  wire                nCounter_willUnderflow;
  wire                kCounter_willIncrement;
  wire                kCounter_willDecrement;
  wire                kCounter_willClear;
  wire                kCounter_willLoad;
  reg        [6:0]    kCounter_valueNext;
  reg        [6:0]    kCounter_value;
  wire                kCounter_willOverflowIfInc;
  wire                kCounter_willUnderflowIfDec;
  wire                kCounter_willOverflow;
  wire                kCounter_willUnderflow;
  wire                outCounter_willIncrement;
  wire                outCounter_willDecrement;
  wire                outCounter_willClear;
  wire                outCounter_willLoad;
  reg        [3:0]    outCounter_valueNext;
  reg        [3:0]    outCounter_value;
  wire                outCounter_willOverflowIfInc;
  wire                outCounter_willUnderflowIfDec;
  wire                outCounter_willOverflow;
  wire                outCounter_willUnderflow;
  wire       [7:0]    _zz_io_c_stream_payload_0_mantissa;
  reg                 _zz_3;
  reg        [6:0]    _zz_4;
  reg        [6:0]    _zz_5;
  wire                _zz_6;
  wire                _zz_7;
  reg                 _zz_io_readAddr;
  reg        [6:0]    _zz_io_readAddr_1;
  reg        [6:0]    _zz_io_readAddr_2;
  wire                _zz_8;
  wire                _zz_9;
  reg                 when_matmul_l239;
  reg                 when_matmul_l239_regNext;
  reg        [3:0]    nCounter_value_regNextWhen;
  wire       [31:0]   _zz_when_Float_l65;
  wire       [7:0]    _zz_when_Float_l65_1;
  wire       [7:0]    _zz_when_Float_l65_2;
  wire       [7:0]    _zz_when_Float_l65_3;
  wire       [7:0]    _zz_when_Float_l65_4;
  wire       [3:0]    _zz_when_Float_l65_5;
  wire       [3:0]    _zz_when_Float_l65_6;
  wire       [3:0]    _zz_when_Float_l65_7;
  wire       [3:0]    _zz_when_Float_l65_8;
  wire                _zz_when_Float_l65_9;
  wire                _zz_when_Float_l65_10;
  wire                _zz_when_Float_l65_11;
  wire                _zz_when_Float_l65_12;
  reg        [2:0]    _zz_when_Float_l203;
  reg        [3:0]    _zz_when_Float_l199;
  reg                 _zz_when_Float_l203_1;
  reg        [2:0]    _zz_when_Float_l203_2;
  reg        [3:0]    _zz_when_Float_l199_1;
  reg                 _zz_when_Float_l203_3;
  reg        [2:0]    _zz_when_Float_l203_4;
  reg        [3:0]    _zz_when_Float_l199_2;
  reg                 _zz_when_Float_l203_5;
  reg        [2:0]    _zz_when_Float_l203_6;
  reg        [3:0]    _zz_when_Float_l199_3;
  reg                 _zz_when_Float_l203_7;
  reg        [2:0]    _zz_when_Float_l203_8;
  reg        [3:0]    _zz_when_Float_l199_4;
  reg                 _zz_when_Float_l203_9;
  wire                _zz_when_Float_l65_13;
  wire                _zz_when_Float_l65_14;
  wire       [7:0]    _zz_when_Float_l65_15;
  wire                _zz_when_Float_l65_16;
  wire       [2:0]    _zz_when_Float_l65_17;
  wire       [3:0]    _zz_when_Float_l65_18;
  wire                _zz_when_Float_l65_19;
  wire       [6:0]    _zz_when_Float_l65_20;
  wire                when_Float_l65;
  wire                when_Float_l70;
  reg        [2:0]    _zz_when_Float_l203_10;
  reg        [3:0]    _zz_when_Float_l199_5;
  reg                 _zz_when_Float_l203_11;
  wire                _zz_when_Float_l65_21;
  wire                _zz_when_Float_l65_22;
  wire       [7:0]    _zz_when_Float_l65_23;
  wire                _zz_when_Float_l65_24;
  wire       [2:0]    _zz_when_Float_l65_25;
  wire       [3:0]    _zz_when_Float_l65_26;
  wire                _zz_when_Float_l65_27;
  wire       [6:0]    _zz_when_Float_l65_28;
  wire                when_Float_l65_1;
  wire                when_Float_l70_1;
  reg        [2:0]    _zz_when_Float_l203_12;
  reg        [3:0]    _zz_when_Float_l199_6;
  reg                 _zz_when_Float_l203_13;
  wire                _zz_when_Float_l65_29;
  wire                _zz_when_Float_l65_30;
  wire       [7:0]    _zz_when_Float_l65_31;
  wire                _zz_when_Float_l65_32;
  wire       [2:0]    _zz_when_Float_l65_33;
  wire       [3:0]    _zz_when_Float_l65_34;
  wire                _zz_when_Float_l65_35;
  wire       [6:0]    _zz_when_Float_l65_36;
  wire                when_Float_l65_2;
  wire                when_Float_l70_2;
  reg        [2:0]    _zz_when_Float_l203_14;
  reg        [3:0]    _zz_when_Float_l199_7;
  reg                 _zz_when_Float_l203_15;
  wire                _zz_when_Float_l65_37;
  wire                _zz_when_Float_l65_38;
  wire       [7:0]    _zz_when_Float_l65_39;
  wire                _zz_when_Float_l65_40;
  wire       [2:0]    _zz_when_Float_l65_41;
  wire       [3:0]    _zz_when_Float_l65_42;
  wire                _zz_when_Float_l65_43;
  wire       [6:0]    _zz_when_Float_l65_44;
  wire                when_Float_l65_3;
  wire                when_Float_l70_3;
  reg                 when_matmul_l239_regNext_regNext;
  reg        [3:0]    nCounter_value_regNextWhen_regNextWhen;
  wire                when_Utils_l1073;
  reg        [3:0]    nCounter_value_regNextWhen_regNextWhen_delay_1;
  reg        [3:0]    nCounter_value_regNextWhen_regNextWhen_delay_2;
  wire                when_Utils_l1073_1;
  reg                 when_matmul_l239_regNext_regNext_delay_1;
  reg                 when_matmul_l239_regNext_regNext_delay_2;
  reg                 when_matmul_l239_regNext_regNext_regNext;
  reg        [2:0]    _zz_when_Float_l203_16;
  reg        [3:0]    _zz_when_Float_l199_8;
  reg                 _zz_when_Float_l203_17;
  wire                _zz_when_Float_l203_18;
  wire       [3:0]    _zz_when_Float_l203_19;
  wire                _zz_when_Float_l203_20;
  wire       [3:0]    _zz_when_Float_l203_21;
  wire       [6:0]    _zz_when_Float_l203_22;
  wire       [3:0]    _zz_when_Float_l203_23;
  wire       [6:0]    _zz_when_Float_l203_24;
  wire       [7:0]    _zz_when_Float_l203_25;
  wire       [7:0]    _zz_when_Float_l203_26;
  wire       [7:0]    _zz_when_Float_l203_27;
  wire       [7:0]    _zz_when_Float_l203_28;
  wire                _zz_when_Float_l203_29;
  wire                _zz_when_Float_l203_30;
  wire                _zz_when_Float_l203_31;
  wire                _zz_when_Float_l203_32;
  wire                _zz_when_Float_l203_33;
  wire                _zz_when_Float_l203_34;
  wire                _zz_when_Float_l203_35;
  wire       [2:0]    _zz_when_Float_l203_36;
  wire       [14:0]   _zz_when_Float_l203_37;
  wire       [2:0]    _zz_when_Float_l203_38;
  wire       [3:0]    _zz_when_Float_l203_39;
  wire                _zz_when_Float_l203_40;
  wire       [6:0]    _zz_when_Float_l203_41;
  wire                when_Float_l199;
  wire                when_Float_l203;
  wire                when_Float_l207;
  reg        [2:0]    _zz_when_Float_l203_42;
  reg        [3:0]    _zz_when_Float_l199_9;
  reg                 _zz_when_Float_l203_43;
  reg        [2:0]    _zz_when_Float_l203_44;
  reg        [3:0]    _zz_when_Float_l199_10;
  reg                 _zz_when_Float_l203_45;
  wire                _zz_when_Float_l203_46;
  wire       [3:0]    _zz_when_Float_l203_47;
  wire                _zz_when_Float_l203_48;
  wire       [3:0]    _zz_when_Float_l203_49;
  wire       [6:0]    _zz_when_Float_l203_50;
  wire       [3:0]    _zz_when_Float_l203_51;
  wire       [6:0]    _zz_when_Float_l203_52;
  wire       [7:0]    _zz_when_Float_l203_53;
  wire       [7:0]    _zz_when_Float_l203_54;
  wire       [7:0]    _zz_when_Float_l203_55;
  wire       [7:0]    _zz_when_Float_l203_56;
  wire                _zz_when_Float_l203_57;
  wire                _zz_when_Float_l203_58;
  wire                _zz_when_Float_l203_59;
  wire                _zz_when_Float_l203_60;
  wire                _zz_when_Float_l203_61;
  wire                _zz_when_Float_l203_62;
  wire                _zz_when_Float_l203_63;
  wire       [2:0]    _zz_when_Float_l203_64;
  wire       [14:0]   _zz_when_Float_l203_65;
  wire       [2:0]    _zz_when_Float_l203_66;
  wire       [3:0]    _zz_when_Float_l203_67;
  wire                _zz_when_Float_l203_68;
  wire       [6:0]    _zz_when_Float_l203_69;
  wire                when_Float_l199_1;
  wire                when_Float_l203_1;
  wire                when_Float_l207_1;
  reg        [2:0]    _zz_when_Float_l203_70;
  reg        [3:0]    _zz_when_Float_l199_11;
  reg                 _zz_when_Float_l203_71;
  reg                 when_matmul_l239_regNext_regNext_regNext_regNext;
  reg        [2:0]    _zz_when_Float_l203_72;
  reg        [3:0]    _zz_when_Float_l199_12;
  reg                 _zz_when_Float_l203_73;
  wire                _zz_when_Float_l203_74;
  wire       [3:0]    _zz_when_Float_l203_75;
  wire                _zz_when_Float_l203_76;
  wire       [3:0]    _zz_when_Float_l203_77;
  wire       [6:0]    _zz_when_Float_l203_78;
  wire       [3:0]    _zz_when_Float_l203_79;
  wire       [6:0]    _zz_when_Float_l203_80;
  wire       [7:0]    _zz_when_Float_l203_81;
  wire       [7:0]    _zz_when_Float_l203_82;
  wire       [7:0]    _zz_when_Float_l203_83;
  wire       [7:0]    _zz_when_Float_l203_84;
  wire                _zz_when_Float_l203_85;
  wire                _zz_when_Float_l203_86;
  wire                _zz_when_Float_l203_87;
  wire                _zz_when_Float_l203_88;
  wire                _zz_when_Float_l203_89;
  wire                _zz_when_Float_l203_90;
  wire                _zz_when_Float_l203_91;
  wire       [2:0]    _zz_when_Float_l203_92;
  wire       [14:0]   _zz_when_Float_l203_93;
  wire       [2:0]    _zz_when_Float_l203_94;
  wire       [3:0]    _zz_when_Float_l203_95;
  wire                _zz_when_Float_l203_96;
  wire       [6:0]    _zz_when_Float_l203_97;
  wire                when_Float_l199_2;
  wire                when_Float_l203_2;
  wire                when_Float_l207_2;
  reg        [2:0]    _zz_when_Float_l203_98;
  reg        [3:0]    _zz_when_Float_l199_13;
  reg                 _zz_when_Float_l203_99;
  reg        [2:0]    _zz_io_c_stream_payload_0_mantissa_1;
  reg        [3:0]    _zz_io_c_stream_payload_0_exponent;
  reg                 _zz_io_c_stream_payload_0_sign;
  reg        [2:0]    _zz_io_c_stream_payload_0_mantissa_2;
  reg        [3:0]    _zz_io_c_stream_payload_0_exponent_1;
  reg                 _zz_io_c_stream_payload_0_sign_1;
  reg        [2:0]    _zz_io_c_stream_payload_0_mantissa_3;
  reg        [3:0]    _zz_io_c_stream_payload_0_exponent_2;
  reg                 _zz_io_c_stream_payload_0_sign_2;
  reg        [2:0]    _zz_io_c_stream_payload_0_mantissa_4;
  reg        [3:0]    _zz_io_c_stream_payload_0_exponent_3;
  reg                 _zz_io_c_stream_payload_0_sign_3;
  reg        [2:0]    _zz_io_c_stream_payload_0_mantissa_5;
  reg        [3:0]    _zz_io_c_stream_payload_0_exponent_4;
  reg                 _zz_io_c_stream_payload_0_sign_4;
  reg        [2:0]    _zz_io_c_stream_payload_0_mantissa_6;
  reg        [3:0]    _zz_io_c_stream_payload_0_exponent_5;
  reg                 _zz_io_c_stream_payload_0_sign_5;
  reg        [2:0]    _zz_io_c_stream_payload_0_mantissa_7;
  reg        [3:0]    _zz_io_c_stream_payload_0_exponent_6;
  reg                 _zz_io_c_stream_payload_0_sign_6;
  reg        [2:0]    _zz_io_c_stream_payload_0_mantissa_8;
  reg        [3:0]    _zz_io_c_stream_payload_0_exponent_7;
  reg                 _zz_io_c_stream_payload_0_sign_7;
  reg        [2:0]    _zz_io_c_stream_payload_0_mantissa_9;
  reg        [3:0]    _zz_io_c_stream_payload_0_exponent_8;
  reg                 _zz_io_c_stream_payload_0_sign_8;
  reg        [2:0]    _zz_io_c_stream_payload_0_mantissa_10;
  reg        [3:0]    _zz_io_c_stream_payload_0_exponent_9;
  reg                 _zz_io_c_stream_payload_0_sign_9;
  wire       [3:0]    _zz_when_Float_l199_14;
  wire       [2:0]    _zz_when_Float_l203_100;
  wire       [3:0]    _zz_when_Float_l199_15;
  wire                _zz_when_Float_l203_101;
  wire       [15:0]   _zz_11;
  wire                _zz_12;
  wire                _zz_13;
  wire                _zz_14;
  wire                _zz_15;
  wire                _zz_16;
  wire                _zz_17;
  wire                _zz_18;
  wire                _zz_19;
  wire                _zz_20;
  wire                _zz_21;
  reg        [2:0]    _zz_io_c_stream_payload_0_mantissa_11;
  reg        [3:0]    _zz_io_c_stream_payload_0_exponent_10;
  reg                 _zz_io_c_stream_payload_0_sign_10;
  wire                _zz_when_Float_l203_102;
  wire       [3:0]    _zz_when_Float_l203_103;
  wire                _zz_when_Float_l203_104;
  wire       [3:0]    _zz_when_Float_l203_105;
  wire       [6:0]    _zz_when_Float_l203_106;
  wire       [3:0]    _zz_when_Float_l203_107;
  wire       [6:0]    _zz_when_Float_l203_108;
  wire       [7:0]    _zz_when_Float_l203_109;
  wire       [7:0]    _zz_when_Float_l203_110;
  wire       [7:0]    _zz_when_Float_l203_111;
  wire       [7:0]    _zz_when_Float_l203_112;
  wire                _zz_when_Float_l203_113;
  wire                _zz_when_Float_l203_114;
  wire                _zz_when_Float_l203_115;
  wire                _zz_when_Float_l203_116;
  wire                _zz_when_Float_l203_117;
  wire                _zz_when_Float_l203_118;
  wire                _zz_when_Float_l203_119;
  wire       [2:0]    _zz_when_Float_l203_120;
  wire       [14:0]   _zz_io_c_stream_payload_0_mantissa_12;
  wire       [2:0]    _zz_io_c_stream_payload_0_mantissa_13;
  wire       [3:0]    _zz_io_c_stream_payload_0_mantissa_14;
  wire                _zz_when_Float_l203_121;
  wire       [6:0]    _zz_when_Float_l203_122;
  wire                when_Float_l199_3;
  wire                when_Float_l203_3;
  wire                when_Float_l207_3;
  reg        [0:0]    _zz_io_c_stream_payload_0_mantissa_15;
  reg                 when_matmul_l371;
  reg                 _zz_io_c_stream_payload_0_mantissa_16;
  reg        [3:0]    _zz_io_c_stream_payload_0_mantissa_17;
  reg        [3:0]    _zz_io_c_stream_payload_0_mantissa_18;
  wire                _zz_22;
  wire                _zz_23;
  reg                 _zz_24;
  reg                 _zz_25;
  reg        [2:0]    _zz_26;
  reg        [2:0]    _zz_27;
  wire                _zz_28;
  wire                _zz_29;
  reg        [2:0]    _zz_30;
  reg        [2:0]    _zz_31;
  wire       [3:0]    _zz_io_c_stream_payload_0_mantissa_19;
  wire       [15:0]   _zz_33;
  wire                _zz_34;
  wire                _zz_35;
  wire                _zz_36;
  wire                _zz_37;
  wire                _zz_38;
  wire                _zz_39;
  wire                _zz_40;
  wire                _zz_41;
  wire                _zz_42;
  wire                _zz_43;
  `ifndef SYNTHESIS
  reg [15:0] _zz_30_string;
  reg [15:0] _zz_31_string;
  `endif

  reg [31:0] _zz_2 [0:71];

  assign _zz_nCounter_valueNext_1 = nCounter_willIncrement;
  assign _zz_nCounter_valueNext = {3'd0, _zz_nCounter_valueNext_1};
  assign _zz_kCounter_valueNext_1 = kCounter_willIncrement;
  assign _zz_kCounter_valueNext = {6'd0, _zz_kCounter_valueNext_1};
  assign _zz_outCounter_valueNext_1 = outCounter_willIncrement;
  assign _zz_outCounter_valueNext = {3'd0, _zz_outCounter_valueNext_1};
  assign _zz__zz_4_1 = _zz_3;
  assign _zz__zz_4 = {6'd0, _zz__zz_4_1};
  assign _zz__zz_io_readAddr_1_1 = _zz_io_readAddr;
  assign _zz__zz_io_readAddr_1 = {6'd0, _zz__zz_io_readAddr_1_1};
  assign _zz_io_readAddr_3 = (_zz_io_readAddr_4 + _zz_io_readAddr_5);
  assign _zz_io_readAddr_4 = (nCounter_value * 7'h48);
  assign _zz_io_readAddr_5 = {4'd0, _zz_io_readAddr_2};
  assign _zz__zz_when_Float_l65_18_1 = {1'b0,((_zz_when_Float_l65_16 ? _zz_when_Float_l65_15[3] : _zz_when_Float_l65_15[2]) && ((_zz_when_Float_l65_16 ? (_zz_when_Float_l65_15[2 : 0] != 3'b000) : (_zz_when_Float_l65_15[1 : 0] != 2'b00)) || _zz_when_Float_l65_17[0]))};
  assign _zz__zz_when_Float_l65_18 = {2'd0, _zz__zz_when_Float_l65_18_1};
  assign _zz__zz_when_Float_l65_20 = ($signed(_zz__zz_when_Float_l65_20_1) + $signed(_zz__zz_when_Float_l65_20_7));
  assign _zz__zz_when_Float_l65_20_1 = ($signed(_zz__zz_when_Float_l65_20_2) - $signed(7'h07));
  assign _zz__zz_when_Float_l65_20_2 = ($signed(_zz__zz_when_Float_l65_20_3) + $signed(_zz__zz_when_Float_l65_20_5));
  assign _zz__zz_when_Float_l65_20_4 = {1'b0,_zz_when_Float_l65_5};
  assign _zz__zz_when_Float_l65_20_3 = {{2{_zz__zz_when_Float_l65_20_4[4]}}, _zz__zz_when_Float_l65_20_4};
  assign _zz__zz_when_Float_l65_20_6 = {1'b0,streamDoubleBuffer_7_io_readData_0_exponent};
  assign _zz__zz_when_Float_l65_20_5 = {{2{_zz__zz_when_Float_l65_20_6[4]}}, _zz__zz_when_Float_l65_20_6};
  assign _zz__zz_when_Float_l65_20_8 = {1'b0,_zz_when_Float_l65_16};
  assign _zz__zz_when_Float_l65_20_7 = {{5{_zz__zz_when_Float_l65_20_8[1]}}, _zz__zz_when_Float_l65_20_8};
  assign _zz__zz_when_Float_l65_20_10 = {1'b0,_zz_when_Float_l65_19};
  assign _zz__zz_when_Float_l65_20_9 = {{5{_zz__zz_when_Float_l65_20_10[1]}}, _zz__zz_when_Float_l65_20_10};
  assign _zz__zz_when_Float_l199_4 = _zz_when_Float_l65_20;
  assign _zz__zz_when_Float_l65_26_1 = {1'b0,((_zz_when_Float_l65_24 ? _zz_when_Float_l65_23[3] : _zz_when_Float_l65_23[2]) && ((_zz_when_Float_l65_24 ? (_zz_when_Float_l65_23[2 : 0] != 3'b000) : (_zz_when_Float_l65_23[1 : 0] != 2'b00)) || _zz_when_Float_l65_25[0]))};
  assign _zz__zz_when_Float_l65_26 = {2'd0, _zz__zz_when_Float_l65_26_1};
  assign _zz__zz_when_Float_l65_28 = ($signed(_zz__zz_when_Float_l65_28_1) + $signed(_zz__zz_when_Float_l65_28_7));
  assign _zz__zz_when_Float_l65_28_1 = ($signed(_zz__zz_when_Float_l65_28_2) - $signed(7'h07));
  assign _zz__zz_when_Float_l65_28_2 = ($signed(_zz__zz_when_Float_l65_28_3) + $signed(_zz__zz_when_Float_l65_28_5));
  assign _zz__zz_when_Float_l65_28_4 = {1'b0,_zz_when_Float_l65_6};
  assign _zz__zz_when_Float_l65_28_3 = {{2{_zz__zz_when_Float_l65_28_4[4]}}, _zz__zz_when_Float_l65_28_4};
  assign _zz__zz_when_Float_l65_28_6 = {1'b0,streamDoubleBuffer_7_io_readData_1_exponent};
  assign _zz__zz_when_Float_l65_28_5 = {{2{_zz__zz_when_Float_l65_28_6[4]}}, _zz__zz_when_Float_l65_28_6};
  assign _zz__zz_when_Float_l65_28_8 = {1'b0,_zz_when_Float_l65_24};
  assign _zz__zz_when_Float_l65_28_7 = {{5{_zz__zz_when_Float_l65_28_8[1]}}, _zz__zz_when_Float_l65_28_8};
  assign _zz__zz_when_Float_l65_28_10 = {1'b0,_zz_when_Float_l65_27};
  assign _zz__zz_when_Float_l65_28_9 = {{5{_zz__zz_when_Float_l65_28_10[1]}}, _zz__zz_when_Float_l65_28_10};
  assign _zz__zz_when_Float_l199_5 = _zz_when_Float_l65_28;
  assign _zz__zz_when_Float_l65_34_1 = {1'b0,((_zz_when_Float_l65_32 ? _zz_when_Float_l65_31[3] : _zz_when_Float_l65_31[2]) && ((_zz_when_Float_l65_32 ? (_zz_when_Float_l65_31[2 : 0] != 3'b000) : (_zz_when_Float_l65_31[1 : 0] != 2'b00)) || _zz_when_Float_l65_33[0]))};
  assign _zz__zz_when_Float_l65_34 = {2'd0, _zz__zz_when_Float_l65_34_1};
  assign _zz__zz_when_Float_l65_36 = ($signed(_zz__zz_when_Float_l65_36_1) + $signed(_zz__zz_when_Float_l65_36_7));
  assign _zz__zz_when_Float_l65_36_1 = ($signed(_zz__zz_when_Float_l65_36_2) - $signed(7'h07));
  assign _zz__zz_when_Float_l65_36_2 = ($signed(_zz__zz_when_Float_l65_36_3) + $signed(_zz__zz_when_Float_l65_36_5));
  assign _zz__zz_when_Float_l65_36_4 = {1'b0,_zz_when_Float_l65_7};
  assign _zz__zz_when_Float_l65_36_3 = {{2{_zz__zz_when_Float_l65_36_4[4]}}, _zz__zz_when_Float_l65_36_4};
  assign _zz__zz_when_Float_l65_36_6 = {1'b0,streamDoubleBuffer_7_io_readData_2_exponent};
  assign _zz__zz_when_Float_l65_36_5 = {{2{_zz__zz_when_Float_l65_36_6[4]}}, _zz__zz_when_Float_l65_36_6};
  assign _zz__zz_when_Float_l65_36_8 = {1'b0,_zz_when_Float_l65_32};
  assign _zz__zz_when_Float_l65_36_7 = {{5{_zz__zz_when_Float_l65_36_8[1]}}, _zz__zz_when_Float_l65_36_8};
  assign _zz__zz_when_Float_l65_36_10 = {1'b0,_zz_when_Float_l65_35};
  assign _zz__zz_when_Float_l65_36_9 = {{5{_zz__zz_when_Float_l65_36_10[1]}}, _zz__zz_when_Float_l65_36_10};
  assign _zz__zz_when_Float_l199_6 = _zz_when_Float_l65_36;
  assign _zz__zz_when_Float_l65_42_1 = {1'b0,((_zz_when_Float_l65_40 ? _zz_when_Float_l65_39[3] : _zz_when_Float_l65_39[2]) && ((_zz_when_Float_l65_40 ? (_zz_when_Float_l65_39[2 : 0] != 3'b000) : (_zz_when_Float_l65_39[1 : 0] != 2'b00)) || _zz_when_Float_l65_41[0]))};
  assign _zz__zz_when_Float_l65_42 = {2'd0, _zz__zz_when_Float_l65_42_1};
  assign _zz__zz_when_Float_l65_44 = ($signed(_zz__zz_when_Float_l65_44_1) + $signed(_zz__zz_when_Float_l65_44_7));
  assign _zz__zz_when_Float_l65_44_1 = ($signed(_zz__zz_when_Float_l65_44_2) - $signed(7'h07));
  assign _zz__zz_when_Float_l65_44_2 = ($signed(_zz__zz_when_Float_l65_44_3) + $signed(_zz__zz_when_Float_l65_44_5));
  assign _zz__zz_when_Float_l65_44_4 = {1'b0,_zz_when_Float_l65_8};
  assign _zz__zz_when_Float_l65_44_3 = {{2{_zz__zz_when_Float_l65_44_4[4]}}, _zz__zz_when_Float_l65_44_4};
  assign _zz__zz_when_Float_l65_44_6 = {1'b0,streamDoubleBuffer_7_io_readData_3_exponent};
  assign _zz__zz_when_Float_l65_44_5 = {{2{_zz__zz_when_Float_l65_44_6[4]}}, _zz__zz_when_Float_l65_44_6};
  assign _zz__zz_when_Float_l65_44_8 = {1'b0,_zz_when_Float_l65_40};
  assign _zz__zz_when_Float_l65_44_7 = {{5{_zz__zz_when_Float_l65_44_8[1]}}, _zz__zz_when_Float_l65_44_8};
  assign _zz__zz_when_Float_l65_44_10 = {1'b0,_zz_when_Float_l65_43};
  assign _zz__zz_when_Float_l65_44_9 = {{5{_zz__zz_when_Float_l65_44_10[1]}}, _zz__zz_when_Float_l65_44_10};
  assign _zz__zz_when_Float_l199_7 = _zz_when_Float_l65_44;
  assign _zz__zz_when_Float_l203_25 = ({1'b0,_zz_when_Float_l203_22} + {1'b0,_zz_when_Float_l203_24});
  assign _zz__zz_when_Float_l203_25_2 = (_zz_when_Float_l203_22 - _zz_when_Float_l203_24);
  assign _zz__zz_when_Float_l203_25_1 = {1'd0, _zz__zz_when_Float_l203_25_2};
  assign _zz__zz_when_Float_l203_28 = (_zz_when_Float_l203_27 - 8'h01);
  assign _zz__zz_when_Float_l203_39_1 = {1'b0,(_zz_when_Float_l203_37[3] && ((_zz_when_Float_l203_37[2 : 0] != 3'b000) || _zz_when_Float_l203_38[0]))};
  assign _zz__zz_when_Float_l203_39 = {2'd0, _zz__zz_when_Float_l203_39_1};
  assign _zz__zz_when_Float_l203_41 = ($signed(_zz__zz_when_Float_l203_41_1) + $signed(_zz__zz_when_Float_l203_41_3));
  assign _zz__zz_when_Float_l203_41_2 = {1'b0,_zz_when_Float_l203_19};
  assign _zz__zz_when_Float_l203_41_1 = {{2{_zz__zz_when_Float_l203_41_2[4]}}, _zz__zz_when_Float_l203_41_2};
  assign _zz__zz_when_Float_l203_41_4 = ($signed(4'b0001) - $signed(_zz__zz_when_Float_l203_41_5));
  assign _zz__zz_when_Float_l203_41_3 = {{3{_zz__zz_when_Float_l203_41_4[3]}}, _zz__zz_when_Float_l203_41_4};
  assign _zz__zz_when_Float_l203_41_5 = {1'b0,_zz_when_Float_l203_36};
  assign _zz__zz_when_Float_l203_41_7 = {1'b0,_zz_when_Float_l203_40};
  assign _zz__zz_when_Float_l203_41_6 = {{5{_zz__zz_when_Float_l203_41_7[1]}}, _zz__zz_when_Float_l203_41_7};
  assign _zz__zz_when_Float_l199_8 = _zz_when_Float_l203_41;
  assign _zz__zz_when_Float_l203_53 = ({1'b0,_zz_when_Float_l203_50} + {1'b0,_zz_when_Float_l203_52});
  assign _zz__zz_when_Float_l203_53_2 = (_zz_when_Float_l203_50 - _zz_when_Float_l203_52);
  assign _zz__zz_when_Float_l203_53_1 = {1'd0, _zz__zz_when_Float_l203_53_2};
  assign _zz__zz_when_Float_l203_56 = (_zz_when_Float_l203_55 - 8'h01);
  assign _zz__zz_when_Float_l203_67_1 = {1'b0,(_zz_when_Float_l203_65[3] && ((_zz_when_Float_l203_65[2 : 0] != 3'b000) || _zz_when_Float_l203_66[0]))};
  assign _zz__zz_when_Float_l203_67 = {2'd0, _zz__zz_when_Float_l203_67_1};
  assign _zz__zz_when_Float_l203_69 = ($signed(_zz__zz_when_Float_l203_69_1) + $signed(_zz__zz_when_Float_l203_69_3));
  assign _zz__zz_when_Float_l203_69_2 = {1'b0,_zz_when_Float_l203_47};
  assign _zz__zz_when_Float_l203_69_1 = {{2{_zz__zz_when_Float_l203_69_2[4]}}, _zz__zz_when_Float_l203_69_2};
  assign _zz__zz_when_Float_l203_69_4 = ($signed(4'b0001) - $signed(_zz__zz_when_Float_l203_69_5));
  assign _zz__zz_when_Float_l203_69_3 = {{3{_zz__zz_when_Float_l203_69_4[3]}}, _zz__zz_when_Float_l203_69_4};
  assign _zz__zz_when_Float_l203_69_5 = {1'b0,_zz_when_Float_l203_64};
  assign _zz__zz_when_Float_l203_69_7 = {1'b0,_zz_when_Float_l203_68};
  assign _zz__zz_when_Float_l203_69_6 = {{5{_zz__zz_when_Float_l203_69_7[1]}}, _zz__zz_when_Float_l203_69_7};
  assign _zz__zz_when_Float_l199_10 = _zz_when_Float_l203_69;
  assign _zz__zz_when_Float_l203_81 = ({1'b0,_zz_when_Float_l203_78} + {1'b0,_zz_when_Float_l203_80});
  assign _zz__zz_when_Float_l203_81_2 = (_zz_when_Float_l203_78 - _zz_when_Float_l203_80);
  assign _zz__zz_when_Float_l203_81_1 = {1'd0, _zz__zz_when_Float_l203_81_2};
  assign _zz__zz_when_Float_l203_84 = (_zz_when_Float_l203_83 - 8'h01);
  assign _zz__zz_when_Float_l203_95_1 = {1'b0,(_zz_when_Float_l203_93[3] && ((_zz_when_Float_l203_93[2 : 0] != 3'b000) || _zz_when_Float_l203_94[0]))};
  assign _zz__zz_when_Float_l203_95 = {2'd0, _zz__zz_when_Float_l203_95_1};
  assign _zz__zz_when_Float_l203_97 = ($signed(_zz__zz_when_Float_l203_97_1) + $signed(_zz__zz_when_Float_l203_97_3));
  assign _zz__zz_when_Float_l203_97_2 = {1'b0,_zz_when_Float_l203_75};
  assign _zz__zz_when_Float_l203_97_1 = {{2{_zz__zz_when_Float_l203_97_2[4]}}, _zz__zz_when_Float_l203_97_2};
  assign _zz__zz_when_Float_l203_97_4 = ($signed(4'b0001) - $signed(_zz__zz_when_Float_l203_97_5));
  assign _zz__zz_when_Float_l203_97_3 = {{3{_zz__zz_when_Float_l203_97_4[3]}}, _zz__zz_when_Float_l203_97_4};
  assign _zz__zz_when_Float_l203_97_5 = {1'b0,_zz_when_Float_l203_92};
  assign _zz__zz_when_Float_l203_97_7 = {1'b0,_zz_when_Float_l203_96};
  assign _zz__zz_when_Float_l203_97_6 = {{5{_zz__zz_when_Float_l203_97_7[1]}}, _zz__zz_when_Float_l203_97_7};
  assign _zz__zz_when_Float_l199_12 = _zz_when_Float_l203_97;
  assign _zz__zz_when_Float_l203_109 = ({1'b0,_zz_when_Float_l203_106} + {1'b0,_zz_when_Float_l203_108});
  assign _zz__zz_when_Float_l203_109_2 = (_zz_when_Float_l203_106 - _zz_when_Float_l203_108);
  assign _zz__zz_when_Float_l203_109_1 = {1'd0, _zz__zz_when_Float_l203_109_2};
  assign _zz__zz_when_Float_l203_112 = (_zz_when_Float_l203_111 - 8'h01);
  assign _zz__zz_io_c_stream_payload_0_mantissa_14_1 = {1'b0,(_zz_io_c_stream_payload_0_mantissa_12[3] && ((_zz_io_c_stream_payload_0_mantissa_12[2 : 0] != 3'b000) || _zz_io_c_stream_payload_0_mantissa_13[0]))};
  assign _zz__zz_io_c_stream_payload_0_mantissa_14 = {2'd0, _zz__zz_io_c_stream_payload_0_mantissa_14_1};
  assign _zz__zz_when_Float_l203_122 = ($signed(_zz__zz_when_Float_l203_122_1) + $signed(_zz__zz_when_Float_l203_122_3));
  assign _zz__zz_when_Float_l203_122_2 = {1'b0,_zz_when_Float_l203_103};
  assign _zz__zz_when_Float_l203_122_1 = {{2{_zz__zz_when_Float_l203_122_2[4]}}, _zz__zz_when_Float_l203_122_2};
  assign _zz__zz_when_Float_l203_122_4 = ($signed(4'b0001) - $signed(_zz__zz_when_Float_l203_122_5));
  assign _zz__zz_when_Float_l203_122_3 = {{3{_zz__zz_when_Float_l203_122_4[3]}}, _zz__zz_when_Float_l203_122_4};
  assign _zz__zz_when_Float_l203_122_5 = {1'b0,_zz_when_Float_l203_120};
  assign _zz__zz_when_Float_l203_122_7 = {1'b0,_zz_when_Float_l203_121};
  assign _zz__zz_when_Float_l203_122_6 = {{5{_zz__zz_when_Float_l203_122_7[1]}}, _zz__zz_when_Float_l203_122_7};
  assign _zz__zz_io_c_stream_payload_0_exponent_10 = _zz_when_Float_l203_122;
  assign _zz__zz_io_c_stream_payload_0_mantissa_17_1 = _zz_io_c_stream_payload_0_mantissa_16;
  assign _zz__zz_io_c_stream_payload_0_mantissa_17 = {3'd0, _zz__zz_io_c_stream_payload_0_mantissa_17_1};
  assign _zz__zz_26_1 = _zz_25;
  assign _zz__zz_26 = {2'd0, _zz__zz_26_1};
  assign _zz__zz_io_c_stream_payload_0_mantissa_19 = (_zz__zz_io_c_stream_payload_0_mantissa_19_1 + _zz__zz_io_c_stream_payload_0_mantissa_19_3);
  assign _zz__zz_io_c_stream_payload_0_mantissa_19_1 = (_zz__zz_io_c_stream_payload_0_mantissa_19_2 * 4'b1010);
  assign _zz__zz_io_c_stream_payload_0_mantissa_19_2 = (_zz_io_c_stream_payload_0_mantissa_15 % 1'b1);
  assign _zz__zz_io_c_stream_payload_0_mantissa_19_3 = {1'd0, _zz_io_c_stream_payload_0_mantissa_18};
  assign _zz__zz_33_1 = (_zz__zz_33_2 + _zz__zz_33_4);
  assign _zz__zz_33 = _zz__zz_33_1[3:0];
  assign _zz__zz_33_2 = (_zz__zz_33_3 * 4'b1010);
  assign _zz__zz_33_3 = (_zz_io_c_stream_payload_0_mantissa_15 % 1'b1);
  assign _zz__zz_33_4 = {1'd0, _zz_io_c_stream_payload_0_mantissa_18};
  assign _zz__zz_when_Float_l65 = 1'b1;
  assign _zz__zz_2_port_1 = {{io_a_stream_payload_3_sign,{io_a_stream_payload_3_exponent,io_a_stream_payload_3_mantissa}},{{io_a_stream_payload_2_sign,{io_a_stream_payload_2_exponent,io_a_stream_payload_2_mantissa}},{{io_a_stream_payload_1_sign,{io_a_stream_payload_1_exponent,io_a_stream_payload_1_mantissa}},{io_a_stream_payload_0_sign,{io_a_stream_payload_0_exponent,io_a_stream_payload_0_mantissa}}}}};
  always @(posedge clk) begin
    if(_zz__zz_when_Float_l65) begin
      _zz_2_spinal_port0 <= _zz_2[_zz_io_readAddr_2];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      _zz_2[_zz_5] <= _zz__zz_2_port_1;
    end
  end

  StreamDoubleBuffer_1 streamDoubleBuffer_7 (
    .io_streamIn_valid              (io_b_stream_valid                               ), //i
    .io_streamIn_ready              (streamDoubleBuffer_7_io_streamIn_ready          ), //o
    .io_streamIn_payload_0_mantissa (io_b_stream_payload_0_mantissa[2:0]             ), //i
    .io_streamIn_payload_0_exponent (io_b_stream_payload_0_exponent[3:0]             ), //i
    .io_streamIn_payload_0_sign     (io_b_stream_payload_0_sign                      ), //i
    .io_streamIn_payload_1_mantissa (io_b_stream_payload_1_mantissa[2:0]             ), //i
    .io_streamIn_payload_1_exponent (io_b_stream_payload_1_exponent[3:0]             ), //i
    .io_streamIn_payload_1_sign     (io_b_stream_payload_1_sign                      ), //i
    .io_streamIn_payload_2_mantissa (io_b_stream_payload_2_mantissa[2:0]             ), //i
    .io_streamIn_payload_2_exponent (io_b_stream_payload_2_exponent[3:0]             ), //i
    .io_streamIn_payload_2_sign     (io_b_stream_payload_2_sign                      ), //i
    .io_streamIn_payload_3_mantissa (io_b_stream_payload_3_mantissa[2:0]             ), //i
    .io_streamIn_payload_3_exponent (io_b_stream_payload_3_exponent[3:0]             ), //i
    .io_streamIn_payload_3_sign     (io_b_stream_payload_3_sign                      ), //i
    .io_readAddr                    (streamDoubleBuffer_7_io_readAddr[9:0]           ), //i
    .io_readData_0_mantissa         (streamDoubleBuffer_7_io_readData_0_mantissa[2:0]), //o
    .io_readData_0_exponent         (streamDoubleBuffer_7_io_readData_0_exponent[3:0]), //o
    .io_readData_0_sign             (streamDoubleBuffer_7_io_readData_0_sign         ), //o
    .io_readData_1_mantissa         (streamDoubleBuffer_7_io_readData_1_mantissa[2:0]), //o
    .io_readData_1_exponent         (streamDoubleBuffer_7_io_readData_1_exponent[3:0]), //o
    .io_readData_1_sign             (streamDoubleBuffer_7_io_readData_1_sign         ), //o
    .io_readData_2_mantissa         (streamDoubleBuffer_7_io_readData_2_mantissa[2:0]), //o
    .io_readData_2_exponent         (streamDoubleBuffer_7_io_readData_2_exponent[3:0]), //o
    .io_readData_2_sign             (streamDoubleBuffer_7_io_readData_2_sign         ), //o
    .io_readData_3_mantissa         (streamDoubleBuffer_7_io_readData_3_mantissa[2:0]), //o
    .io_readData_3_exponent         (streamDoubleBuffer_7_io_readData_3_exponent[3:0]), //o
    .io_readData_3_sign             (streamDoubleBuffer_7_io_readData_3_sign         ), //o
    .io_nextTile                    (streamDoubleBuffer_7_io_nextTile                ), //i
    .io_tileReady                   (streamDoubleBuffer_7_io_tileReady               ), //o
    .io_reArm                       (io_reArm                                        ), //i
    .io_loadCanAccept               (streamDoubleBuffer_7_io_loadCanAccept           ), //o
    .io_tileFilled                  (streamDoubleBuffer_7_io_tileFilled              ), //o
    .io_refreshSettled              (streamDoubleBuffer_7_io_refreshSettled          ), //o
    .clk                            (clk                                             ), //i
    .reset                          (reset                                           )  //i
  );
  always @(*) begin
    case(_zz_when_Float_l199_14)
      4'b0000 : begin
        _zz__zz_when_Float_l203_100 = _zz_io_c_stream_payload_0_mantissa_1;
        _zz__zz_when_Float_l199_15 = _zz_io_c_stream_payload_0_exponent;
        _zz__zz_when_Float_l203_101 = _zz_io_c_stream_payload_0_sign;
      end
      4'b0001 : begin
        _zz__zz_when_Float_l203_100 = _zz_io_c_stream_payload_0_mantissa_2;
        _zz__zz_when_Float_l199_15 = _zz_io_c_stream_payload_0_exponent_1;
        _zz__zz_when_Float_l203_101 = _zz_io_c_stream_payload_0_sign_1;
      end
      4'b0010 : begin
        _zz__zz_when_Float_l203_100 = _zz_io_c_stream_payload_0_mantissa_3;
        _zz__zz_when_Float_l199_15 = _zz_io_c_stream_payload_0_exponent_2;
        _zz__zz_when_Float_l203_101 = _zz_io_c_stream_payload_0_sign_2;
      end
      4'b0011 : begin
        _zz__zz_when_Float_l203_100 = _zz_io_c_stream_payload_0_mantissa_4;
        _zz__zz_when_Float_l199_15 = _zz_io_c_stream_payload_0_exponent_3;
        _zz__zz_when_Float_l203_101 = _zz_io_c_stream_payload_0_sign_3;
      end
      4'b0100 : begin
        _zz__zz_when_Float_l203_100 = _zz_io_c_stream_payload_0_mantissa_5;
        _zz__zz_when_Float_l199_15 = _zz_io_c_stream_payload_0_exponent_4;
        _zz__zz_when_Float_l203_101 = _zz_io_c_stream_payload_0_sign_4;
      end
      4'b0101 : begin
        _zz__zz_when_Float_l203_100 = _zz_io_c_stream_payload_0_mantissa_6;
        _zz__zz_when_Float_l199_15 = _zz_io_c_stream_payload_0_exponent_5;
        _zz__zz_when_Float_l203_101 = _zz_io_c_stream_payload_0_sign_5;
      end
      4'b0110 : begin
        _zz__zz_when_Float_l203_100 = _zz_io_c_stream_payload_0_mantissa_7;
        _zz__zz_when_Float_l199_15 = _zz_io_c_stream_payload_0_exponent_6;
        _zz__zz_when_Float_l203_101 = _zz_io_c_stream_payload_0_sign_6;
      end
      4'b0111 : begin
        _zz__zz_when_Float_l203_100 = _zz_io_c_stream_payload_0_mantissa_8;
        _zz__zz_when_Float_l199_15 = _zz_io_c_stream_payload_0_exponent_7;
        _zz__zz_when_Float_l203_101 = _zz_io_c_stream_payload_0_sign_7;
      end
      4'b1000 : begin
        _zz__zz_when_Float_l203_100 = _zz_io_c_stream_payload_0_mantissa_9;
        _zz__zz_when_Float_l199_15 = _zz_io_c_stream_payload_0_exponent_8;
        _zz__zz_when_Float_l203_101 = _zz_io_c_stream_payload_0_sign_8;
      end
      default : begin
        _zz__zz_when_Float_l203_100 = _zz_io_c_stream_payload_0_mantissa_10;
        _zz__zz_when_Float_l199_15 = _zz_io_c_stream_payload_0_exponent_9;
        _zz__zz_when_Float_l203_101 = _zz_io_c_stream_payload_0_sign_9;
      end
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_0_mantissa_19)
      4'b0000 : begin
        _zz_io_c_stream_payload_0_mantissa_20 = _zz_io_c_stream_payload_0_mantissa_1;
        _zz_io_c_stream_payload_0_exponent_11 = _zz_io_c_stream_payload_0_exponent;
        _zz_io_c_stream_payload_0_sign_11 = _zz_io_c_stream_payload_0_sign;
      end
      4'b0001 : begin
        _zz_io_c_stream_payload_0_mantissa_20 = _zz_io_c_stream_payload_0_mantissa_2;
        _zz_io_c_stream_payload_0_exponent_11 = _zz_io_c_stream_payload_0_exponent_1;
        _zz_io_c_stream_payload_0_sign_11 = _zz_io_c_stream_payload_0_sign_1;
      end
      4'b0010 : begin
        _zz_io_c_stream_payload_0_mantissa_20 = _zz_io_c_stream_payload_0_mantissa_3;
        _zz_io_c_stream_payload_0_exponent_11 = _zz_io_c_stream_payload_0_exponent_2;
        _zz_io_c_stream_payload_0_sign_11 = _zz_io_c_stream_payload_0_sign_2;
      end
      4'b0011 : begin
        _zz_io_c_stream_payload_0_mantissa_20 = _zz_io_c_stream_payload_0_mantissa_4;
        _zz_io_c_stream_payload_0_exponent_11 = _zz_io_c_stream_payload_0_exponent_3;
        _zz_io_c_stream_payload_0_sign_11 = _zz_io_c_stream_payload_0_sign_3;
      end
      4'b0100 : begin
        _zz_io_c_stream_payload_0_mantissa_20 = _zz_io_c_stream_payload_0_mantissa_5;
        _zz_io_c_stream_payload_0_exponent_11 = _zz_io_c_stream_payload_0_exponent_4;
        _zz_io_c_stream_payload_0_sign_11 = _zz_io_c_stream_payload_0_sign_4;
      end
      4'b0101 : begin
        _zz_io_c_stream_payload_0_mantissa_20 = _zz_io_c_stream_payload_0_mantissa_6;
        _zz_io_c_stream_payload_0_exponent_11 = _zz_io_c_stream_payload_0_exponent_5;
        _zz_io_c_stream_payload_0_sign_11 = _zz_io_c_stream_payload_0_sign_5;
      end
      4'b0110 : begin
        _zz_io_c_stream_payload_0_mantissa_20 = _zz_io_c_stream_payload_0_mantissa_7;
        _zz_io_c_stream_payload_0_exponent_11 = _zz_io_c_stream_payload_0_exponent_6;
        _zz_io_c_stream_payload_0_sign_11 = _zz_io_c_stream_payload_0_sign_6;
      end
      4'b0111 : begin
        _zz_io_c_stream_payload_0_mantissa_20 = _zz_io_c_stream_payload_0_mantissa_8;
        _zz_io_c_stream_payload_0_exponent_11 = _zz_io_c_stream_payload_0_exponent_7;
        _zz_io_c_stream_payload_0_sign_11 = _zz_io_c_stream_payload_0_sign_7;
      end
      4'b1000 : begin
        _zz_io_c_stream_payload_0_mantissa_20 = _zz_io_c_stream_payload_0_mantissa_9;
        _zz_io_c_stream_payload_0_exponent_11 = _zz_io_c_stream_payload_0_exponent_8;
        _zz_io_c_stream_payload_0_sign_11 = _zz_io_c_stream_payload_0_sign_8;
      end
      default : begin
        _zz_io_c_stream_payload_0_mantissa_20 = _zz_io_c_stream_payload_0_mantissa_10;
        _zz_io_c_stream_payload_0_exponent_11 = _zz_io_c_stream_payload_0_exponent_9;
        _zz_io_c_stream_payload_0_sign_11 = _zz_io_c_stream_payload_0_sign_9;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_30)
      StateMachineEnum_ : _zz_30_string = "  ";
      StateMachineEnum__1 : _zz_30_string = "_1";
      StateMachineEnum__2 : _zz_30_string = "_2";
      StateMachineEnum__3 : _zz_30_string = "_3";
      StateMachineEnum__4 : _zz_30_string = "_4";
      StateMachineEnum__5 : _zz_30_string = "_5";
      default : _zz_30_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_31)
      StateMachineEnum_ : _zz_31_string = "  ";
      StateMachineEnum__1 : _zz_31_string = "_1";
      StateMachineEnum__2 : _zz_31_string = "_2";
      StateMachineEnum__3 : _zz_31_string = "_3";
      StateMachineEnum__4 : _zz_31_string = "_4";
      StateMachineEnum__5 : _zz_31_string = "_5";
      default : _zz_31_string = "??";
    endcase
  end
  `endif

  always @(*) begin
    _zz_1 = 1'b0;
    case(_zz_30)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
        if(io_a_stream_valid) begin
          _zz_1 = 1'b1;
        end
      end
      StateMachineEnum__3 : begin
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
      end
      default : begin
      end
    endcase
  end

  assign accumulators_0_mantissa = 3'b000;
  assign accumulators_0_exponent = 4'b0000;
  assign accumulators_0_sign = 1'b0;
  assign accumulators_1_mantissa = 3'b000;
  assign accumulators_1_exponent = 4'b0000;
  assign accumulators_1_sign = 1'b0;
  assign accumulators_2_mantissa = 3'b000;
  assign accumulators_2_exponent = 4'b0000;
  assign accumulators_2_sign = 1'b0;
  assign accumulators_3_mantissa = 3'b000;
  assign accumulators_3_exponent = 4'b0000;
  assign accumulators_3_sign = 1'b0;
  assign accumulators_4_mantissa = 3'b000;
  assign accumulators_4_exponent = 4'b0000;
  assign accumulators_4_sign = 1'b0;
  assign accumulators_5_mantissa = 3'b000;
  assign accumulators_5_exponent = 4'b0000;
  assign accumulators_5_sign = 1'b0;
  assign accumulators_6_mantissa = 3'b000;
  assign accumulators_6_exponent = 4'b0000;
  assign accumulators_6_sign = 1'b0;
  assign accumulators_7_mantissa = 3'b000;
  assign accumulators_7_exponent = 4'b0000;
  assign accumulators_7_sign = 1'b0;
  assign accumulators_8_mantissa = 3'b000;
  assign accumulators_8_exponent = 4'b0000;
  assign accumulators_8_sign = 1'b0;
  assign accumulators_9_mantissa = 3'b000;
  assign accumulators_9_exponent = 4'b0000;
  assign accumulators_9_sign = 1'b0;
  always @(*) begin
    rowCounter_willIncrement = 1'b0;
    case(_zz_30)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
        if(_zz_8) begin
          if(nCounter_willOverflowIfInc) begin
            rowCounter_willIncrement = 1'b1;
          end
        end
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
      end
      default : begin
      end
    endcase
  end

  assign rowCounter_willDecrement = 1'b0;
  assign rowCounter_willClear = 1'b0;
  assign rowCounter_willLoad = 1'b0;
  assign rowCounter_willOverflowIfInc = 1'b1;
  assign rowCounter_willUnderflowIfDec = 1'b1;
  assign rowCounter_willOverflow = (rowCounter_willOverflowIfInc && rowCounter_willIncrement);
  assign rowCounter_willUnderflow = (rowCounter_willUnderflowIfDec && rowCounter_willDecrement);
  always @(*) begin
    nCounter_willIncrement = 1'b0;
    case(_zz_30)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
        if(_zz_8) begin
          nCounter_willIncrement = 1'b1;
        end
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
      end
      default : begin
      end
    endcase
  end

  assign nCounter_willDecrement = 1'b0;
  assign nCounter_willClear = 1'b0;
  assign nCounter_willLoad = 1'b0;
  assign nCounter_willOverflowIfInc = (nCounter_value == 4'b1001);
  assign nCounter_willUnderflowIfDec = (nCounter_value == 4'b0000);
  assign nCounter_willOverflow = (nCounter_willOverflowIfInc && nCounter_willIncrement);
  always @(*) begin
    nCounter_valueNext = (nCounter_value + _zz_nCounter_valueNext);
    if(nCounter_willOverflow) begin
      nCounter_valueNext = 4'b0000;
    end
    if(nCounter_willClear) begin
      nCounter_valueNext = 4'b0000;
    end
  end

  assign nCounter_willUnderflow = (nCounter_willUnderflowIfDec && nCounter_willDecrement);
  assign kCounter_willIncrement = 1'b0;
  assign kCounter_willDecrement = 1'b0;
  assign kCounter_willClear = 1'b0;
  assign kCounter_willLoad = 1'b0;
  assign kCounter_willOverflowIfInc = (kCounter_value == 7'h47);
  assign kCounter_willUnderflowIfDec = (kCounter_value == 7'h0);
  assign kCounter_willOverflow = (kCounter_willOverflowIfInc && kCounter_willIncrement);
  always @(*) begin
    kCounter_valueNext = (kCounter_value + _zz_kCounter_valueNext);
    if(kCounter_willOverflow) begin
      kCounter_valueNext = 7'h0;
    end
    if(kCounter_willClear) begin
      kCounter_valueNext = 7'h0;
    end
  end

  assign kCounter_willUnderflow = (kCounter_willUnderflowIfDec && kCounter_willDecrement);
  assign outCounter_willIncrement = 1'b0;
  assign outCounter_willDecrement = 1'b0;
  assign outCounter_willClear = 1'b0;
  assign outCounter_willLoad = 1'b0;
  assign outCounter_willOverflowIfInc = (outCounter_value == 4'b1001);
  assign outCounter_willUnderflowIfDec = (outCounter_value == 4'b0000);
  assign outCounter_willOverflow = (outCounter_willOverflowIfInc && outCounter_willIncrement);
  always @(*) begin
    outCounter_valueNext = (outCounter_value + _zz_outCounter_valueNext);
    if(outCounter_willOverflow) begin
      outCounter_valueNext = 4'b0000;
    end
    if(outCounter_willClear) begin
      outCounter_valueNext = 4'b0000;
    end
  end

  assign outCounter_willUnderflow = (outCounter_willUnderflowIfDec && outCounter_willDecrement);
  always @(*) begin
    io_a_stream_ready = 1'b0;
    case(_zz_30)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
        io_a_stream_ready = 1'b1;
      end
      StateMachineEnum__3 : begin
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_c_stream_valid = 1'b0;
    case(_zz_30)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
        io_c_stream_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign _zz_io_c_stream_payload_0_mantissa = 8'h0;
  always @(*) begin
    io_c_stream_payload_0_mantissa = _zz_io_c_stream_payload_0_mantissa[2 : 0];
    case(_zz_30)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
        io_c_stream_payload_0_mantissa = _zz_io_c_stream_payload_0_mantissa_20;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_c_stream_payload_0_exponent = _zz_io_c_stream_payload_0_mantissa[6 : 3];
    case(_zz_30)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
        io_c_stream_payload_0_exponent = _zz_io_c_stream_payload_0_exponent_11;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_c_stream_payload_0_sign = _zz_io_c_stream_payload_0_mantissa[7];
    case(_zz_30)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
        io_c_stream_payload_0_sign = _zz_io_c_stream_payload_0_sign_11;
      end
      default : begin
      end
    endcase
  end

  assign io_b_stream_ready = streamDoubleBuffer_7_io_streamIn_ready;
  always @(*) begin
    streamDoubleBuffer_7_io_nextTile = 1'b0;
    case(_zz_30)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
        if(_zz_8) begin
          if(nCounter_willOverflowIfInc) begin
            if(rowCounter_willOverflowIfInc) begin
              streamDoubleBuffer_7_io_nextTile = 1'b1;
            end
          end
        end
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    _zz_3 = 1'b0;
    case(_zz_30)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
        if(io_a_stream_valid) begin
          _zz_3 = 1'b1;
        end
      end
      StateMachineEnum__3 : begin
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
      end
      default : begin
      end
    endcase
  end

  assign _zz_6 = (_zz_5 == 7'h47);
  assign _zz_7 = (_zz_6 && _zz_3);
  always @(*) begin
    _zz_4 = (_zz_5 + _zz__zz_4);
    if(_zz_7) begin
      _zz_4 = 7'h0;
    end
    if(1'b0) begin
      _zz_4 = 7'h0;
    end
  end

  always @(*) begin
    _zz_io_readAddr = 1'b0;
    case(_zz_30)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
        _zz_io_readAddr = 1'b1;
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
      end
      default : begin
      end
    endcase
  end

  assign _zz_8 = (_zz_io_readAddr_2 == 7'h47);
  assign _zz_9 = (_zz_8 && _zz_io_readAddr);
  always @(*) begin
    _zz_io_readAddr_1 = (_zz_io_readAddr_2 + _zz__zz_io_readAddr_1);
    if(_zz_9) begin
      _zz_io_readAddr_1 = 7'h0;
    end
    if(1'b0) begin
      _zz_io_readAddr_1 = 7'h0;
    end
  end

  assign streamDoubleBuffer_7_io_readAddr = _zz_io_readAddr_3[9:0];
  always @(*) begin
    when_matmul_l239 = 1'b0;
    case(_zz_30)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
        when_matmul_l239 = 1'b1;
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
      end
      default : begin
      end
    endcase
  end

  assign _zz_when_Float_l65 = _zz_2_spinal_port0;
  assign _zz_when_Float_l65_1 = _zz_when_Float_l65[7 : 0];
  assign _zz_when_Float_l65_2 = _zz_when_Float_l65[15 : 8];
  assign _zz_when_Float_l65_3 = _zz_when_Float_l65[23 : 16];
  assign _zz_when_Float_l65_4 = _zz_when_Float_l65[31 : 24];
  assign _zz_when_Float_l65_9 = 1'b1;
  assign _zz_when_Float_l65_5 = (_zz_when_Float_l65_9 ? _zz_when_Float_l65_1[6 : 3] : 4'b0000);
  assign _zz_when_Float_l65_10 = 1'b1;
  assign _zz_when_Float_l65_6 = (_zz_when_Float_l65_10 ? _zz_when_Float_l65_2[6 : 3] : 4'b0000);
  assign _zz_when_Float_l65_11 = 1'b1;
  assign _zz_when_Float_l65_7 = (_zz_when_Float_l65_11 ? _zz_when_Float_l65_3[6 : 3] : 4'b0000);
  assign _zz_when_Float_l65_12 = 1'b1;
  assign _zz_when_Float_l65_8 = (_zz_when_Float_l65_12 ? _zz_when_Float_l65_4[6 : 3] : 4'b0000);
  always @(*) begin
    _zz_when_Float_l203_9 = ((_zz_when_Float_l65_9 ? _zz_when_Float_l65_1[7] : 1'b0) ^ streamDoubleBuffer_7_io_readData_0_sign);
    if(when_Float_l65) begin
      _zz_when_Float_l203_9 = 1'b0;
    end
  end

  assign _zz_when_Float_l65_13 = (_zz_when_Float_l65_5 == 4'b0000);
  assign _zz_when_Float_l65_14 = (streamDoubleBuffer_7_io_readData_0_exponent == 4'b0000);
  assign _zz_when_Float_l65_15 = ((_zz_when_Float_l65_13 ? 4'b0000 : {1'b1,(_zz_when_Float_l65_9 ? _zz_when_Float_l65_1[2 : 0] : 3'b000)}) * (_zz_when_Float_l65_14 ? 4'b0000 : {1'b1,streamDoubleBuffer_7_io_readData_0_mantissa}));
  assign _zz_when_Float_l65_16 = _zz_when_Float_l65_15[7];
  assign _zz_when_Float_l65_17 = (_zz_when_Float_l65_16 ? _zz_when_Float_l65_15[6 : 4] : _zz_when_Float_l65_15[5 : 3]);
  assign _zz_when_Float_l65_18 = ({1'b0,_zz_when_Float_l65_17} + _zz__zz_when_Float_l65_18);
  assign _zz_when_Float_l65_19 = _zz_when_Float_l65_18[3];
  assign _zz_when_Float_l65_20 = ($signed(_zz__zz_when_Float_l65_20) + $signed(_zz__zz_when_Float_l65_20_9));
  assign when_Float_l65 = ((_zz_when_Float_l65_13 || _zz_when_Float_l65_14) || ($signed(_zz_when_Float_l65_20) <= $signed(7'h0)));
  always @(*) begin
    if(when_Float_l65) begin
      _zz_when_Float_l199_4 = 4'b0000;
    end else begin
      if(when_Float_l70) begin
        _zz_when_Float_l199_4 = 4'b1111;
      end else begin
        _zz_when_Float_l199_4 = _zz__zz_when_Float_l199_4[3:0];
      end
    end
  end

  always @(*) begin
    if(when_Float_l65) begin
      _zz_when_Float_l203_8 = 3'b000;
    end else begin
      if(when_Float_l70) begin
        _zz_when_Float_l203_8 = 3'b000;
      end else begin
        _zz_when_Float_l203_8 = (_zz_when_Float_l65_19 ? 3'b000 : _zz_when_Float_l65_18[2 : 0]);
      end
    end
  end

  assign when_Float_l70 = ($signed(7'h0f) <= $signed(_zz_when_Float_l65_20));
  always @(*) begin
    _zz_when_Float_l203_11 = ((_zz_when_Float_l65_10 ? _zz_when_Float_l65_2[7] : 1'b0) ^ streamDoubleBuffer_7_io_readData_1_sign);
    if(when_Float_l65_1) begin
      _zz_when_Float_l203_11 = 1'b0;
    end
  end

  assign _zz_when_Float_l65_21 = (_zz_when_Float_l65_6 == 4'b0000);
  assign _zz_when_Float_l65_22 = (streamDoubleBuffer_7_io_readData_1_exponent == 4'b0000);
  assign _zz_when_Float_l65_23 = ((_zz_when_Float_l65_21 ? 4'b0000 : {1'b1,(_zz_when_Float_l65_10 ? _zz_when_Float_l65_2[2 : 0] : 3'b000)}) * (_zz_when_Float_l65_22 ? 4'b0000 : {1'b1,streamDoubleBuffer_7_io_readData_1_mantissa}));
  assign _zz_when_Float_l65_24 = _zz_when_Float_l65_23[7];
  assign _zz_when_Float_l65_25 = (_zz_when_Float_l65_24 ? _zz_when_Float_l65_23[6 : 4] : _zz_when_Float_l65_23[5 : 3]);
  assign _zz_when_Float_l65_26 = ({1'b0,_zz_when_Float_l65_25} + _zz__zz_when_Float_l65_26);
  assign _zz_when_Float_l65_27 = _zz_when_Float_l65_26[3];
  assign _zz_when_Float_l65_28 = ($signed(_zz__zz_when_Float_l65_28) + $signed(_zz__zz_when_Float_l65_28_9));
  assign when_Float_l65_1 = ((_zz_when_Float_l65_21 || _zz_when_Float_l65_22) || ($signed(_zz_when_Float_l65_28) <= $signed(7'h0)));
  always @(*) begin
    if(when_Float_l65_1) begin
      _zz_when_Float_l199_5 = 4'b0000;
    end else begin
      if(when_Float_l70_1) begin
        _zz_when_Float_l199_5 = 4'b1111;
      end else begin
        _zz_when_Float_l199_5 = _zz__zz_when_Float_l199_5[3:0];
      end
    end
  end

  always @(*) begin
    if(when_Float_l65_1) begin
      _zz_when_Float_l203_10 = 3'b000;
    end else begin
      if(when_Float_l70_1) begin
        _zz_when_Float_l203_10 = 3'b000;
      end else begin
        _zz_when_Float_l203_10 = (_zz_when_Float_l65_27 ? 3'b000 : _zz_when_Float_l65_26[2 : 0]);
      end
    end
  end

  assign when_Float_l70_1 = ($signed(7'h0f) <= $signed(_zz_when_Float_l65_28));
  always @(*) begin
    _zz_when_Float_l203_13 = ((_zz_when_Float_l65_11 ? _zz_when_Float_l65_3[7] : 1'b0) ^ streamDoubleBuffer_7_io_readData_2_sign);
    if(when_Float_l65_2) begin
      _zz_when_Float_l203_13 = 1'b0;
    end
  end

  assign _zz_when_Float_l65_29 = (_zz_when_Float_l65_7 == 4'b0000);
  assign _zz_when_Float_l65_30 = (streamDoubleBuffer_7_io_readData_2_exponent == 4'b0000);
  assign _zz_when_Float_l65_31 = ((_zz_when_Float_l65_29 ? 4'b0000 : {1'b1,(_zz_when_Float_l65_11 ? _zz_when_Float_l65_3[2 : 0] : 3'b000)}) * (_zz_when_Float_l65_30 ? 4'b0000 : {1'b1,streamDoubleBuffer_7_io_readData_2_mantissa}));
  assign _zz_when_Float_l65_32 = _zz_when_Float_l65_31[7];
  assign _zz_when_Float_l65_33 = (_zz_when_Float_l65_32 ? _zz_when_Float_l65_31[6 : 4] : _zz_when_Float_l65_31[5 : 3]);
  assign _zz_when_Float_l65_34 = ({1'b0,_zz_when_Float_l65_33} + _zz__zz_when_Float_l65_34);
  assign _zz_when_Float_l65_35 = _zz_when_Float_l65_34[3];
  assign _zz_when_Float_l65_36 = ($signed(_zz__zz_when_Float_l65_36) + $signed(_zz__zz_when_Float_l65_36_9));
  assign when_Float_l65_2 = ((_zz_when_Float_l65_29 || _zz_when_Float_l65_30) || ($signed(_zz_when_Float_l65_36) <= $signed(7'h0)));
  always @(*) begin
    if(when_Float_l65_2) begin
      _zz_when_Float_l199_6 = 4'b0000;
    end else begin
      if(when_Float_l70_2) begin
        _zz_when_Float_l199_6 = 4'b1111;
      end else begin
        _zz_when_Float_l199_6 = _zz__zz_when_Float_l199_6[3:0];
      end
    end
  end

  always @(*) begin
    if(when_Float_l65_2) begin
      _zz_when_Float_l203_12 = 3'b000;
    end else begin
      if(when_Float_l70_2) begin
        _zz_when_Float_l203_12 = 3'b000;
      end else begin
        _zz_when_Float_l203_12 = (_zz_when_Float_l65_35 ? 3'b000 : _zz_when_Float_l65_34[2 : 0]);
      end
    end
  end

  assign when_Float_l70_2 = ($signed(7'h0f) <= $signed(_zz_when_Float_l65_36));
  always @(*) begin
    _zz_when_Float_l203_15 = ((_zz_when_Float_l65_12 ? _zz_when_Float_l65_4[7] : 1'b0) ^ streamDoubleBuffer_7_io_readData_3_sign);
    if(when_Float_l65_3) begin
      _zz_when_Float_l203_15 = 1'b0;
    end
  end

  assign _zz_when_Float_l65_37 = (_zz_when_Float_l65_8 == 4'b0000);
  assign _zz_when_Float_l65_38 = (streamDoubleBuffer_7_io_readData_3_exponent == 4'b0000);
  assign _zz_when_Float_l65_39 = ((_zz_when_Float_l65_37 ? 4'b0000 : {1'b1,(_zz_when_Float_l65_12 ? _zz_when_Float_l65_4[2 : 0] : 3'b000)}) * (_zz_when_Float_l65_38 ? 4'b0000 : {1'b1,streamDoubleBuffer_7_io_readData_3_mantissa}));
  assign _zz_when_Float_l65_40 = _zz_when_Float_l65_39[7];
  assign _zz_when_Float_l65_41 = (_zz_when_Float_l65_40 ? _zz_when_Float_l65_39[6 : 4] : _zz_when_Float_l65_39[5 : 3]);
  assign _zz_when_Float_l65_42 = ({1'b0,_zz_when_Float_l65_41} + _zz__zz_when_Float_l65_42);
  assign _zz_when_Float_l65_43 = _zz_when_Float_l65_42[3];
  assign _zz_when_Float_l65_44 = ($signed(_zz__zz_when_Float_l65_44) + $signed(_zz__zz_when_Float_l65_44_9));
  assign when_Float_l65_3 = ((_zz_when_Float_l65_37 || _zz_when_Float_l65_38) || ($signed(_zz_when_Float_l65_44) <= $signed(7'h0)));
  always @(*) begin
    if(when_Float_l65_3) begin
      _zz_when_Float_l199_7 = 4'b0000;
    end else begin
      if(when_Float_l70_3) begin
        _zz_when_Float_l199_7 = 4'b1111;
      end else begin
        _zz_when_Float_l199_7 = _zz__zz_when_Float_l199_7[3:0];
      end
    end
  end

  always @(*) begin
    if(when_Float_l65_3) begin
      _zz_when_Float_l203_14 = 3'b000;
    end else begin
      if(when_Float_l70_3) begin
        _zz_when_Float_l203_14 = 3'b000;
      end else begin
        _zz_when_Float_l203_14 = (_zz_when_Float_l65_43 ? 3'b000 : _zz_when_Float_l65_42[2 : 0]);
      end
    end
  end

  assign when_Float_l70_3 = ($signed(7'h0f) <= $signed(_zz_when_Float_l65_44));
  assign when_Utils_l1073 = 1'b1;
  assign when_Utils_l1073_1 = 1'b1;
  assign _zz_when_Float_l203_18 = ((_zz_when_Float_l199_1 < _zz_when_Float_l199) || ((_zz_when_Float_l199 == _zz_when_Float_l199_1) && (_zz_when_Float_l203_2 <= _zz_when_Float_l203)));
  assign _zz_when_Float_l203_19 = (_zz_when_Float_l203_18 ? _zz_when_Float_l199 : _zz_when_Float_l199_1);
  assign _zz_when_Float_l203_20 = (_zz_when_Float_l203_18 ? _zz_when_Float_l203_1 : _zz_when_Float_l203_3);
  assign _zz_when_Float_l203_21 = (_zz_when_Float_l203_18 ? _zz_when_Float_l199_1 : _zz_when_Float_l199);
  assign _zz_when_Float_l203_22 = {((_zz_when_Float_l203_19 == 4'b0000) ? 4'b0000 : {1'b1,(_zz_when_Float_l203_18 ? _zz_when_Float_l203 : _zz_when_Float_l203_2)}),3'b000};
  assign _zz_when_Float_l203_23 = (_zz_when_Float_l203_19 - _zz_when_Float_l203_21);
  assign _zz_when_Float_l203_24 = ({((_zz_when_Float_l203_21 == 4'b0000) ? 4'b0000 : {1'b1,(_zz_when_Float_l203_18 ? _zz_when_Float_l203_2 : _zz_when_Float_l203)}),3'b000} >>> ((4'b1000 < _zz_when_Float_l203_23) ? 4'b1000 : _zz_when_Float_l203_23));
  assign _zz_when_Float_l203_25 = ((_zz_when_Float_l203_20 == (_zz_when_Float_l203_18 ? _zz_when_Float_l203_3 : _zz_when_Float_l203_1)) ? _zz__zz_when_Float_l203_25 : _zz__zz_when_Float_l203_25_1);
  assign _zz_when_Float_l203_26 = _zz_when_Float_l203_25;
  assign _zz_when_Float_l203_27 = {_zz_when_Float_l203_26[0],{_zz_when_Float_l203_26[1],{_zz_when_Float_l203_26[2],{_zz_when_Float_l203_26[3],{_zz_when_Float_l203_26[4],{_zz_when_Float_l203_26[5],{_zz_when_Float_l203_26[6],_zz_when_Float_l203_26[7]}}}}}}};
  assign _zz_when_Float_l203_28 = (_zz_when_Float_l203_27 & (~ _zz__zz_when_Float_l203_28));
  assign _zz_when_Float_l203_29 = _zz_when_Float_l203_28[3];
  assign _zz_when_Float_l203_30 = _zz_when_Float_l203_28[5];
  assign _zz_when_Float_l203_31 = _zz_when_Float_l203_28[6];
  assign _zz_when_Float_l203_32 = _zz_when_Float_l203_28[7];
  assign _zz_when_Float_l203_33 = (((_zz_when_Float_l203_28[1] || _zz_when_Float_l203_29) || _zz_when_Float_l203_30) || _zz_when_Float_l203_32);
  assign _zz_when_Float_l203_34 = (((_zz_when_Float_l203_28[2] || _zz_when_Float_l203_29) || _zz_when_Float_l203_31) || _zz_when_Float_l203_32);
  assign _zz_when_Float_l203_35 = (((_zz_when_Float_l203_28[4] || _zz_when_Float_l203_30) || _zz_when_Float_l203_31) || _zz_when_Float_l203_32);
  assign _zz_when_Float_l203_36 = {_zz_when_Float_l203_35,{_zz_when_Float_l203_34,_zz_when_Float_l203_33}};
  assign _zz_when_Float_l203_37 = ({7'd0,_zz_when_Float_l203_25} <<< _zz_when_Float_l203_36);
  assign _zz_when_Float_l203_38 = _zz_when_Float_l203_37[6 : 4];
  assign _zz_when_Float_l203_39 = ({1'b0,_zz_when_Float_l203_38} + _zz__zz_when_Float_l203_39);
  assign _zz_when_Float_l203_40 = _zz_when_Float_l203_39[3];
  assign _zz_when_Float_l203_41 = ($signed(_zz__zz_when_Float_l203_41) + $signed(_zz__zz_when_Float_l203_41_6));
  always @(*) begin
    _zz_when_Float_l203_17 = _zz_when_Float_l203_20;
    if(when_Float_l199) begin
      _zz_when_Float_l203_17 = 1'b0;
    end else begin
      if(when_Float_l203) begin
        _zz_when_Float_l203_17 = 1'b0;
      end
    end
  end

  assign when_Float_l199 = ((_zz_when_Float_l199 == 4'b0000) && (_zz_when_Float_l199_1 == 4'b0000));
  always @(*) begin
    if(when_Float_l199) begin
      _zz_when_Float_l199_8 = 4'b0000;
    end else begin
      if(when_Float_l203) begin
        _zz_when_Float_l199_8 = 4'b0000;
      end else begin
        if(when_Float_l207) begin
          _zz_when_Float_l199_8 = 4'b1111;
        end else begin
          _zz_when_Float_l199_8 = _zz__zz_when_Float_l199_8[3:0];
        end
      end
    end
  end

  always @(*) begin
    if(when_Float_l199) begin
      _zz_when_Float_l203_16 = 3'b000;
    end else begin
      if(when_Float_l203) begin
        _zz_when_Float_l203_16 = 3'b000;
      end else begin
        if(when_Float_l207) begin
          _zz_when_Float_l203_16 = 3'b000;
        end else begin
          _zz_when_Float_l203_16 = (_zz_when_Float_l203_40 ? 3'b000 : _zz_when_Float_l203_39[2 : 0]);
        end
      end
    end
  end

  assign when_Float_l203 = ((_zz_when_Float_l203_25 == 8'h0) || ($signed(_zz_when_Float_l203_41) <= $signed(7'h0)));
  assign when_Float_l207 = ($signed(7'h0f) <= $signed(_zz_when_Float_l203_41));
  assign _zz_when_Float_l203_46 = ((_zz_when_Float_l199_3 < _zz_when_Float_l199_2) || ((_zz_when_Float_l199_2 == _zz_when_Float_l199_3) && (_zz_when_Float_l203_6 <= _zz_when_Float_l203_4)));
  assign _zz_when_Float_l203_47 = (_zz_when_Float_l203_46 ? _zz_when_Float_l199_2 : _zz_when_Float_l199_3);
  assign _zz_when_Float_l203_48 = (_zz_when_Float_l203_46 ? _zz_when_Float_l203_5 : _zz_when_Float_l203_7);
  assign _zz_when_Float_l203_49 = (_zz_when_Float_l203_46 ? _zz_when_Float_l199_3 : _zz_when_Float_l199_2);
  assign _zz_when_Float_l203_50 = {((_zz_when_Float_l203_47 == 4'b0000) ? 4'b0000 : {1'b1,(_zz_when_Float_l203_46 ? _zz_when_Float_l203_4 : _zz_when_Float_l203_6)}),3'b000};
  assign _zz_when_Float_l203_51 = (_zz_when_Float_l203_47 - _zz_when_Float_l203_49);
  assign _zz_when_Float_l203_52 = ({((_zz_when_Float_l203_49 == 4'b0000) ? 4'b0000 : {1'b1,(_zz_when_Float_l203_46 ? _zz_when_Float_l203_6 : _zz_when_Float_l203_4)}),3'b000} >>> ((4'b1000 < _zz_when_Float_l203_51) ? 4'b1000 : _zz_when_Float_l203_51));
  assign _zz_when_Float_l203_53 = ((_zz_when_Float_l203_48 == (_zz_when_Float_l203_46 ? _zz_when_Float_l203_7 : _zz_when_Float_l203_5)) ? _zz__zz_when_Float_l203_53 : _zz__zz_when_Float_l203_53_1);
  assign _zz_when_Float_l203_54 = _zz_when_Float_l203_53;
  assign _zz_when_Float_l203_55 = {_zz_when_Float_l203_54[0],{_zz_when_Float_l203_54[1],{_zz_when_Float_l203_54[2],{_zz_when_Float_l203_54[3],{_zz_when_Float_l203_54[4],{_zz_when_Float_l203_54[5],{_zz_when_Float_l203_54[6],_zz_when_Float_l203_54[7]}}}}}}};
  assign _zz_when_Float_l203_56 = (_zz_when_Float_l203_55 & (~ _zz__zz_when_Float_l203_56));
  assign _zz_when_Float_l203_57 = _zz_when_Float_l203_56[3];
  assign _zz_when_Float_l203_58 = _zz_when_Float_l203_56[5];
  assign _zz_when_Float_l203_59 = _zz_when_Float_l203_56[6];
  assign _zz_when_Float_l203_60 = _zz_when_Float_l203_56[7];
  assign _zz_when_Float_l203_61 = (((_zz_when_Float_l203_56[1] || _zz_when_Float_l203_57) || _zz_when_Float_l203_58) || _zz_when_Float_l203_60);
  assign _zz_when_Float_l203_62 = (((_zz_when_Float_l203_56[2] || _zz_when_Float_l203_57) || _zz_when_Float_l203_59) || _zz_when_Float_l203_60);
  assign _zz_when_Float_l203_63 = (((_zz_when_Float_l203_56[4] || _zz_when_Float_l203_58) || _zz_when_Float_l203_59) || _zz_when_Float_l203_60);
  assign _zz_when_Float_l203_64 = {_zz_when_Float_l203_63,{_zz_when_Float_l203_62,_zz_when_Float_l203_61}};
  assign _zz_when_Float_l203_65 = ({7'd0,_zz_when_Float_l203_53} <<< _zz_when_Float_l203_64);
  assign _zz_when_Float_l203_66 = _zz_when_Float_l203_65[6 : 4];
  assign _zz_when_Float_l203_67 = ({1'b0,_zz_when_Float_l203_66} + _zz__zz_when_Float_l203_67);
  assign _zz_when_Float_l203_68 = _zz_when_Float_l203_67[3];
  assign _zz_when_Float_l203_69 = ($signed(_zz__zz_when_Float_l203_69) + $signed(_zz__zz_when_Float_l203_69_6));
  always @(*) begin
    _zz_when_Float_l203_45 = _zz_when_Float_l203_48;
    if(when_Float_l199_1) begin
      _zz_when_Float_l203_45 = 1'b0;
    end else begin
      if(when_Float_l203_1) begin
        _zz_when_Float_l203_45 = 1'b0;
      end
    end
  end

  assign when_Float_l199_1 = ((_zz_when_Float_l199_2 == 4'b0000) && (_zz_when_Float_l199_3 == 4'b0000));
  always @(*) begin
    if(when_Float_l199_1) begin
      _zz_when_Float_l199_10 = 4'b0000;
    end else begin
      if(when_Float_l203_1) begin
        _zz_when_Float_l199_10 = 4'b0000;
      end else begin
        if(when_Float_l207_1) begin
          _zz_when_Float_l199_10 = 4'b1111;
        end else begin
          _zz_when_Float_l199_10 = _zz__zz_when_Float_l199_10[3:0];
        end
      end
    end
  end

  always @(*) begin
    if(when_Float_l199_1) begin
      _zz_when_Float_l203_44 = 3'b000;
    end else begin
      if(when_Float_l203_1) begin
        _zz_when_Float_l203_44 = 3'b000;
      end else begin
        if(when_Float_l207_1) begin
          _zz_when_Float_l203_44 = 3'b000;
        end else begin
          _zz_when_Float_l203_44 = (_zz_when_Float_l203_68 ? 3'b000 : _zz_when_Float_l203_67[2 : 0]);
        end
      end
    end
  end

  assign when_Float_l203_1 = ((_zz_when_Float_l203_53 == 8'h0) || ($signed(_zz_when_Float_l203_69) <= $signed(7'h0)));
  assign when_Float_l207_1 = ($signed(7'h0f) <= $signed(_zz_when_Float_l203_69));
  assign _zz_when_Float_l203_74 = ((_zz_when_Float_l199_11 < _zz_when_Float_l199_9) || ((_zz_when_Float_l199_9 == _zz_when_Float_l199_11) && (_zz_when_Float_l203_70 <= _zz_when_Float_l203_42)));
  assign _zz_when_Float_l203_75 = (_zz_when_Float_l203_74 ? _zz_when_Float_l199_9 : _zz_when_Float_l199_11);
  assign _zz_when_Float_l203_76 = (_zz_when_Float_l203_74 ? _zz_when_Float_l203_43 : _zz_when_Float_l203_71);
  assign _zz_when_Float_l203_77 = (_zz_when_Float_l203_74 ? _zz_when_Float_l199_11 : _zz_when_Float_l199_9);
  assign _zz_when_Float_l203_78 = {((_zz_when_Float_l203_75 == 4'b0000) ? 4'b0000 : {1'b1,(_zz_when_Float_l203_74 ? _zz_when_Float_l203_42 : _zz_when_Float_l203_70)}),3'b000};
  assign _zz_when_Float_l203_79 = (_zz_when_Float_l203_75 - _zz_when_Float_l203_77);
  assign _zz_when_Float_l203_80 = ({((_zz_when_Float_l203_77 == 4'b0000) ? 4'b0000 : {1'b1,(_zz_when_Float_l203_74 ? _zz_when_Float_l203_70 : _zz_when_Float_l203_42)}),3'b000} >>> ((4'b1000 < _zz_when_Float_l203_79) ? 4'b1000 : _zz_when_Float_l203_79));
  assign _zz_when_Float_l203_81 = ((_zz_when_Float_l203_76 == (_zz_when_Float_l203_74 ? _zz_when_Float_l203_71 : _zz_when_Float_l203_43)) ? _zz__zz_when_Float_l203_81 : _zz__zz_when_Float_l203_81_1);
  assign _zz_when_Float_l203_82 = _zz_when_Float_l203_81;
  assign _zz_when_Float_l203_83 = {_zz_when_Float_l203_82[0],{_zz_when_Float_l203_82[1],{_zz_when_Float_l203_82[2],{_zz_when_Float_l203_82[3],{_zz_when_Float_l203_82[4],{_zz_when_Float_l203_82[5],{_zz_when_Float_l203_82[6],_zz_when_Float_l203_82[7]}}}}}}};
  assign _zz_when_Float_l203_84 = (_zz_when_Float_l203_83 & (~ _zz__zz_when_Float_l203_84));
  assign _zz_when_Float_l203_85 = _zz_when_Float_l203_84[3];
  assign _zz_when_Float_l203_86 = _zz_when_Float_l203_84[5];
  assign _zz_when_Float_l203_87 = _zz_when_Float_l203_84[6];
  assign _zz_when_Float_l203_88 = _zz_when_Float_l203_84[7];
  assign _zz_when_Float_l203_89 = (((_zz_when_Float_l203_84[1] || _zz_when_Float_l203_85) || _zz_when_Float_l203_86) || _zz_when_Float_l203_88);
  assign _zz_when_Float_l203_90 = (((_zz_when_Float_l203_84[2] || _zz_when_Float_l203_85) || _zz_when_Float_l203_87) || _zz_when_Float_l203_88);
  assign _zz_when_Float_l203_91 = (((_zz_when_Float_l203_84[4] || _zz_when_Float_l203_86) || _zz_when_Float_l203_87) || _zz_when_Float_l203_88);
  assign _zz_when_Float_l203_92 = {_zz_when_Float_l203_91,{_zz_when_Float_l203_90,_zz_when_Float_l203_89}};
  assign _zz_when_Float_l203_93 = ({7'd0,_zz_when_Float_l203_81} <<< _zz_when_Float_l203_92);
  assign _zz_when_Float_l203_94 = _zz_when_Float_l203_93[6 : 4];
  assign _zz_when_Float_l203_95 = ({1'b0,_zz_when_Float_l203_94} + _zz__zz_when_Float_l203_95);
  assign _zz_when_Float_l203_96 = _zz_when_Float_l203_95[3];
  assign _zz_when_Float_l203_97 = ($signed(_zz__zz_when_Float_l203_97) + $signed(_zz__zz_when_Float_l203_97_6));
  always @(*) begin
    _zz_when_Float_l203_73 = _zz_when_Float_l203_76;
    if(when_Float_l199_2) begin
      _zz_when_Float_l203_73 = 1'b0;
    end else begin
      if(when_Float_l203_2) begin
        _zz_when_Float_l203_73 = 1'b0;
      end
    end
  end

  assign when_Float_l199_2 = ((_zz_when_Float_l199_9 == 4'b0000) && (_zz_when_Float_l199_11 == 4'b0000));
  always @(*) begin
    if(when_Float_l199_2) begin
      _zz_when_Float_l199_12 = 4'b0000;
    end else begin
      if(when_Float_l203_2) begin
        _zz_when_Float_l199_12 = 4'b0000;
      end else begin
        if(when_Float_l207_2) begin
          _zz_when_Float_l199_12 = 4'b1111;
        end else begin
          _zz_when_Float_l199_12 = _zz__zz_when_Float_l199_12[3:0];
        end
      end
    end
  end

  always @(*) begin
    if(when_Float_l199_2) begin
      _zz_when_Float_l203_72 = 3'b000;
    end else begin
      if(when_Float_l203_2) begin
        _zz_when_Float_l203_72 = 3'b000;
      end else begin
        if(when_Float_l207_2) begin
          _zz_when_Float_l203_72 = 3'b000;
        end else begin
          _zz_when_Float_l203_72 = (_zz_when_Float_l203_96 ? 3'b000 : _zz_when_Float_l203_95[2 : 0]);
        end
      end
    end
  end

  assign when_Float_l203_2 = ((_zz_when_Float_l203_81 == 8'h0) || ($signed(_zz_when_Float_l203_97) <= $signed(7'h0)));
  assign when_Float_l207_2 = ($signed(7'h0f) <= $signed(_zz_when_Float_l203_97));
  assign _zz_when_Float_l199_14 = (4'b0000 + nCounter_value_regNextWhen_regNextWhen_delay_2);
  assign _zz_when_Float_l203_100 = _zz__zz_when_Float_l203_100;
  assign _zz_when_Float_l199_15 = _zz__zz_when_Float_l199_15;
  assign _zz_when_Float_l203_101 = _zz__zz_when_Float_l203_101;
  assign _zz_11 = ({15'd0,1'b1} <<< _zz_when_Float_l199_14);
  assign _zz_12 = _zz_11[0];
  assign _zz_13 = _zz_11[1];
  assign _zz_14 = _zz_11[2];
  assign _zz_15 = _zz_11[3];
  assign _zz_16 = _zz_11[4];
  assign _zz_17 = _zz_11[5];
  assign _zz_18 = _zz_11[6];
  assign _zz_19 = _zz_11[7];
  assign _zz_20 = _zz_11[8];
  assign _zz_21 = _zz_11[9];
  assign _zz_when_Float_l203_102 = ((_zz_when_Float_l199_13 < _zz_when_Float_l199_15) || ((_zz_when_Float_l199_15 == _zz_when_Float_l199_13) && (_zz_when_Float_l203_98 <= _zz_when_Float_l203_100)));
  assign _zz_when_Float_l203_103 = (_zz_when_Float_l203_102 ? _zz_when_Float_l199_15 : _zz_when_Float_l199_13);
  assign _zz_when_Float_l203_104 = (_zz_when_Float_l203_102 ? _zz_when_Float_l203_101 : _zz_when_Float_l203_99);
  assign _zz_when_Float_l203_105 = (_zz_when_Float_l203_102 ? _zz_when_Float_l199_13 : _zz_when_Float_l199_15);
  assign _zz_when_Float_l203_106 = {((_zz_when_Float_l203_103 == 4'b0000) ? 4'b0000 : {1'b1,(_zz_when_Float_l203_102 ? _zz_when_Float_l203_100 : _zz_when_Float_l203_98)}),3'b000};
  assign _zz_when_Float_l203_107 = (_zz_when_Float_l203_103 - _zz_when_Float_l203_105);
  assign _zz_when_Float_l203_108 = ({((_zz_when_Float_l203_105 == 4'b0000) ? 4'b0000 : {1'b1,(_zz_when_Float_l203_102 ? _zz_when_Float_l203_98 : _zz_when_Float_l203_100)}),3'b000} >>> ((4'b1000 < _zz_when_Float_l203_107) ? 4'b1000 : _zz_when_Float_l203_107));
  assign _zz_when_Float_l203_109 = ((_zz_when_Float_l203_104 == (_zz_when_Float_l203_102 ? _zz_when_Float_l203_99 : _zz_when_Float_l203_101)) ? _zz__zz_when_Float_l203_109 : _zz__zz_when_Float_l203_109_1);
  assign _zz_when_Float_l203_110 = _zz_when_Float_l203_109;
  assign _zz_when_Float_l203_111 = {_zz_when_Float_l203_110[0],{_zz_when_Float_l203_110[1],{_zz_when_Float_l203_110[2],{_zz_when_Float_l203_110[3],{_zz_when_Float_l203_110[4],{_zz_when_Float_l203_110[5],{_zz_when_Float_l203_110[6],_zz_when_Float_l203_110[7]}}}}}}};
  assign _zz_when_Float_l203_112 = (_zz_when_Float_l203_111 & (~ _zz__zz_when_Float_l203_112));
  assign _zz_when_Float_l203_113 = _zz_when_Float_l203_112[3];
  assign _zz_when_Float_l203_114 = _zz_when_Float_l203_112[5];
  assign _zz_when_Float_l203_115 = _zz_when_Float_l203_112[6];
  assign _zz_when_Float_l203_116 = _zz_when_Float_l203_112[7];
  assign _zz_when_Float_l203_117 = (((_zz_when_Float_l203_112[1] || _zz_when_Float_l203_113) || _zz_when_Float_l203_114) || _zz_when_Float_l203_116);
  assign _zz_when_Float_l203_118 = (((_zz_when_Float_l203_112[2] || _zz_when_Float_l203_113) || _zz_when_Float_l203_115) || _zz_when_Float_l203_116);
  assign _zz_when_Float_l203_119 = (((_zz_when_Float_l203_112[4] || _zz_when_Float_l203_114) || _zz_when_Float_l203_115) || _zz_when_Float_l203_116);
  assign _zz_when_Float_l203_120 = {_zz_when_Float_l203_119,{_zz_when_Float_l203_118,_zz_when_Float_l203_117}};
  assign _zz_io_c_stream_payload_0_mantissa_12 = ({7'd0,_zz_when_Float_l203_109} <<< _zz_when_Float_l203_120);
  assign _zz_io_c_stream_payload_0_mantissa_13 = _zz_io_c_stream_payload_0_mantissa_12[6 : 4];
  assign _zz_io_c_stream_payload_0_mantissa_14 = ({1'b0,_zz_io_c_stream_payload_0_mantissa_13} + _zz__zz_io_c_stream_payload_0_mantissa_14);
  assign _zz_when_Float_l203_121 = _zz_io_c_stream_payload_0_mantissa_14[3];
  assign _zz_when_Float_l203_122 = ($signed(_zz__zz_when_Float_l203_122) + $signed(_zz__zz_when_Float_l203_122_6));
  always @(*) begin
    _zz_io_c_stream_payload_0_sign_10 = _zz_when_Float_l203_104;
    if(when_Float_l199_3) begin
      _zz_io_c_stream_payload_0_sign_10 = 1'b0;
    end else begin
      if(when_Float_l203_3) begin
        _zz_io_c_stream_payload_0_sign_10 = 1'b0;
      end
    end
  end

  assign when_Float_l199_3 = ((_zz_when_Float_l199_15 == 4'b0000) && (_zz_when_Float_l199_13 == 4'b0000));
  always @(*) begin
    if(when_Float_l199_3) begin
      _zz_io_c_stream_payload_0_exponent_10 = 4'b0000;
    end else begin
      if(when_Float_l203_3) begin
        _zz_io_c_stream_payload_0_exponent_10 = 4'b0000;
      end else begin
        if(when_Float_l207_3) begin
          _zz_io_c_stream_payload_0_exponent_10 = 4'b1111;
        end else begin
          _zz_io_c_stream_payload_0_exponent_10 = _zz__zz_io_c_stream_payload_0_exponent_10[3:0];
        end
      end
    end
  end

  always @(*) begin
    if(when_Float_l199_3) begin
      _zz_io_c_stream_payload_0_mantissa_11 = 3'b000;
    end else begin
      if(when_Float_l203_3) begin
        _zz_io_c_stream_payload_0_mantissa_11 = 3'b000;
      end else begin
        if(when_Float_l207_3) begin
          _zz_io_c_stream_payload_0_mantissa_11 = 3'b000;
        end else begin
          _zz_io_c_stream_payload_0_mantissa_11 = (_zz_when_Float_l203_121 ? 3'b000 : _zz_io_c_stream_payload_0_mantissa_14[2 : 0]);
        end
      end
    end
  end

  assign when_Float_l203_3 = ((_zz_when_Float_l203_109 == 8'h0) || ($signed(_zz_when_Float_l203_122) <= $signed(7'h0)));
  assign when_Float_l207_3 = ($signed(7'h0f) <= $signed(_zz_when_Float_l203_122));
  always @(*) begin
    _zz_io_c_stream_payload_0_mantissa_16 = 1'b0;
    case(_zz_30)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
        if(io_c_stream_ready) begin
          _zz_io_c_stream_payload_0_mantissa_16 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign _zz_22 = (_zz_io_c_stream_payload_0_mantissa_18 == 4'b1001);
  assign _zz_23 = (_zz_22 && _zz_io_c_stream_payload_0_mantissa_16);
  always @(*) begin
    _zz_io_c_stream_payload_0_mantissa_17 = (_zz_io_c_stream_payload_0_mantissa_18 + _zz__zz_io_c_stream_payload_0_mantissa_17);
    if(_zz_23) begin
      _zz_io_c_stream_payload_0_mantissa_17 = 4'b0000;
    end
    if(1'b0) begin
      _zz_io_c_stream_payload_0_mantissa_17 = 4'b0000;
    end
  end

  always @(*) begin
    _zz_24 = 1'b0;
    case(_zz_30)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
      end
      default : begin
        _zz_24 = 1'b1;
      end
    endcase
  end

  always @(*) begin
    _zz_25 = 1'b0;
    case(_zz_30)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
      end
      StateMachineEnum__4 : begin
        _zz_25 = 1'b1;
      end
      StateMachineEnum__5 : begin
      end
      default : begin
      end
    endcase
  end

  assign _zz_28 = (_zz_27 == 3'b100);
  assign _zz_29 = (_zz_28 && _zz_25);
  always @(*) begin
    _zz_26 = (_zz_27 + _zz__zz_26);
    if(_zz_29) begin
      _zz_26 = 3'b000;
    end
    if(1'b0) begin
      _zz_26 = 3'b000;
    end
  end

  always @(*) begin
    _zz_31 = _zz_30;
    case(_zz_30)
      StateMachineEnum__1 : begin
        if(streamDoubleBuffer_7_io_tileReady) begin
          _zz_31 = StateMachineEnum__2;
        end
      end
      StateMachineEnum__2 : begin
        if(io_a_stream_valid) begin
          if(_zz_6) begin
            _zz_31 = StateMachineEnum__3;
          end
        end
      end
      StateMachineEnum__3 : begin
        if(_zz_8) begin
          if(nCounter_willOverflowIfInc) begin
            _zz_31 = StateMachineEnum__4;
          end
        end
      end
      StateMachineEnum__4 : begin
        if(_zz_28) begin
          _zz_31 = StateMachineEnum__5;
        end
      end
      StateMachineEnum__5 : begin
        if(io_c_stream_ready) begin
          if(_zz_22) begin
            if(when_matmul_l371) begin
              _zz_31 = StateMachineEnum__1;
            end else begin
              _zz_31 = StateMachineEnum__2;
            end
          end
        end
      end
      default : begin
      end
    endcase
    if(_zz_24) begin
      _zz_31 = StateMachineEnum__1;
    end
    if(1'b0) begin
      _zz_31 = StateMachineEnum_;
    end
  end

  assign _zz_io_c_stream_payload_0_mantissa_19 = _zz__zz_io_c_stream_payload_0_mantissa_19[3:0];
  assign _zz_33 = ({15'd0,1'b1} <<< _zz__zz_33);
  assign _zz_34 = _zz_33[0];
  assign _zz_35 = _zz_33[1];
  assign _zz_36 = _zz_33[2];
  assign _zz_37 = _zz_33[3];
  assign _zz_38 = _zz_33[4];
  assign _zz_39 = _zz_33[5];
  assign _zz_40 = _zz_33[6];
  assign _zz_41 = _zz_33[7];
  assign _zz_42 = _zz_33[8];
  assign _zz_43 = _zz_33[9];
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      nCounter_value <= 4'b0000;
      kCounter_value <= 7'h0;
      outCounter_value <= 4'b0000;
      _zz_5 <= 7'h0;
      _zz_io_readAddr_2 <= 7'h0;
      when_matmul_l239_regNext <= 1'b0;
      _zz_when_Float_l203 <= 3'b000;
      _zz_when_Float_l199 <= 4'b0000;
      _zz_when_Float_l203_1 <= 1'b0;
      _zz_when_Float_l203_2 <= 3'b000;
      _zz_when_Float_l199_1 <= 4'b0000;
      _zz_when_Float_l203_3 <= 1'b0;
      _zz_when_Float_l203_4 <= 3'b000;
      _zz_when_Float_l199_2 <= 4'b0000;
      _zz_when_Float_l203_5 <= 1'b0;
      _zz_when_Float_l203_6 <= 3'b000;
      _zz_when_Float_l199_3 <= 4'b0000;
      _zz_when_Float_l203_7 <= 1'b0;
      when_matmul_l239_regNext_regNext <= 1'b0;
      when_matmul_l239_regNext_regNext_delay_1 <= 1'b0;
      when_matmul_l239_regNext_regNext_delay_2 <= 1'b0;
      when_matmul_l239_regNext_regNext_regNext <= 1'b0;
      _zz_when_Float_l203_42 <= 3'b000;
      _zz_when_Float_l199_9 <= 4'b0000;
      _zz_when_Float_l203_43 <= 1'b0;
      _zz_when_Float_l203_70 <= 3'b000;
      _zz_when_Float_l199_11 <= 4'b0000;
      _zz_when_Float_l203_71 <= 1'b0;
      when_matmul_l239_regNext_regNext_regNext_regNext <= 1'b0;
      _zz_when_Float_l203_98 <= 3'b000;
      _zz_when_Float_l199_13 <= 4'b0000;
      _zz_when_Float_l203_99 <= 1'b0;
      _zz_io_c_stream_payload_0_mantissa_1 <= 3'b000;
      _zz_io_c_stream_payload_0_exponent <= 4'b0000;
      _zz_io_c_stream_payload_0_sign <= 1'b0;
      _zz_io_c_stream_payload_0_mantissa_2 <= 3'b000;
      _zz_io_c_stream_payload_0_exponent_1 <= 4'b0000;
      _zz_io_c_stream_payload_0_sign_1 <= 1'b0;
      _zz_io_c_stream_payload_0_mantissa_3 <= 3'b000;
      _zz_io_c_stream_payload_0_exponent_2 <= 4'b0000;
      _zz_io_c_stream_payload_0_sign_2 <= 1'b0;
      _zz_io_c_stream_payload_0_mantissa_4 <= 3'b000;
      _zz_io_c_stream_payload_0_exponent_3 <= 4'b0000;
      _zz_io_c_stream_payload_0_sign_3 <= 1'b0;
      _zz_io_c_stream_payload_0_mantissa_5 <= 3'b000;
      _zz_io_c_stream_payload_0_exponent_4 <= 4'b0000;
      _zz_io_c_stream_payload_0_sign_4 <= 1'b0;
      _zz_io_c_stream_payload_0_mantissa_6 <= 3'b000;
      _zz_io_c_stream_payload_0_exponent_5 <= 4'b0000;
      _zz_io_c_stream_payload_0_sign_5 <= 1'b0;
      _zz_io_c_stream_payload_0_mantissa_7 <= 3'b000;
      _zz_io_c_stream_payload_0_exponent_6 <= 4'b0000;
      _zz_io_c_stream_payload_0_sign_6 <= 1'b0;
      _zz_io_c_stream_payload_0_mantissa_8 <= 3'b000;
      _zz_io_c_stream_payload_0_exponent_7 <= 4'b0000;
      _zz_io_c_stream_payload_0_sign_7 <= 1'b0;
      _zz_io_c_stream_payload_0_mantissa_9 <= 3'b000;
      _zz_io_c_stream_payload_0_exponent_8 <= 4'b0000;
      _zz_io_c_stream_payload_0_sign_8 <= 1'b0;
      _zz_io_c_stream_payload_0_mantissa_10 <= 3'b000;
      _zz_io_c_stream_payload_0_exponent_9 <= 4'b0000;
      _zz_io_c_stream_payload_0_sign_9 <= 1'b0;
      _zz_io_c_stream_payload_0_mantissa_15 <= 1'b0;
      when_matmul_l371 <= 1'b0;
      _zz_io_c_stream_payload_0_mantissa_18 <= 4'b0000;
      _zz_27 <= 3'b000;
      _zz_30 <= StateMachineEnum_;
    end else begin
      nCounter_value <= nCounter_valueNext;
      kCounter_value <= kCounter_valueNext;
      outCounter_value <= outCounter_valueNext;
      _zz_5 <= _zz_4;
      _zz_io_readAddr_2 <= _zz_io_readAddr_1;
      when_matmul_l239_regNext <= when_matmul_l239;
      if(when_matmul_l239_regNext) begin
        _zz_when_Float_l203 <= _zz_when_Float_l203_8;
        _zz_when_Float_l199 <= _zz_when_Float_l199_4;
        _zz_when_Float_l203_1 <= _zz_when_Float_l203_9;
        _zz_when_Float_l203_2 <= _zz_when_Float_l203_10;
        _zz_when_Float_l199_1 <= _zz_when_Float_l199_5;
        _zz_when_Float_l203_3 <= _zz_when_Float_l203_11;
        _zz_when_Float_l203_4 <= _zz_when_Float_l203_12;
        _zz_when_Float_l199_2 <= _zz_when_Float_l199_6;
        _zz_when_Float_l203_5 <= _zz_when_Float_l203_13;
        _zz_when_Float_l203_6 <= _zz_when_Float_l203_14;
        _zz_when_Float_l199_3 <= _zz_when_Float_l199_7;
        _zz_when_Float_l203_7 <= _zz_when_Float_l203_15;
      end
      when_matmul_l239_regNext_regNext <= when_matmul_l239_regNext;
      if(when_Utils_l1073_1) begin
        when_matmul_l239_regNext_regNext_delay_1 <= when_matmul_l239_regNext_regNext;
      end
      if(when_Utils_l1073_1) begin
        when_matmul_l239_regNext_regNext_delay_2 <= when_matmul_l239_regNext_regNext_delay_1;
      end
      when_matmul_l239_regNext_regNext_regNext <= when_matmul_l239_regNext_regNext;
      if(when_matmul_l239_regNext_regNext) begin
        _zz_when_Float_l203_42 <= _zz_when_Float_l203_16;
        _zz_when_Float_l199_9 <= _zz_when_Float_l199_8;
        _zz_when_Float_l203_43 <= _zz_when_Float_l203_17;
      end
      if(when_matmul_l239_regNext_regNext) begin
        _zz_when_Float_l203_70 <= _zz_when_Float_l203_44;
        _zz_when_Float_l199_11 <= _zz_when_Float_l199_10;
        _zz_when_Float_l203_71 <= _zz_when_Float_l203_45;
      end
      when_matmul_l239_regNext_regNext_regNext_regNext <= when_matmul_l239_regNext_regNext_regNext;
      if(when_matmul_l239_regNext_regNext_regNext) begin
        _zz_when_Float_l203_98 <= _zz_when_Float_l203_72;
        _zz_when_Float_l199_13 <= _zz_when_Float_l199_12;
        _zz_when_Float_l203_99 <= _zz_when_Float_l203_73;
      end
      if(when_matmul_l239_regNext_regNext_delay_2) begin
        if(_zz_12) begin
          _zz_io_c_stream_payload_0_mantissa_1 <= _zz_io_c_stream_payload_0_mantissa_11;
        end
        if(_zz_13) begin
          _zz_io_c_stream_payload_0_mantissa_2 <= _zz_io_c_stream_payload_0_mantissa_11;
        end
        if(_zz_14) begin
          _zz_io_c_stream_payload_0_mantissa_3 <= _zz_io_c_stream_payload_0_mantissa_11;
        end
        if(_zz_15) begin
          _zz_io_c_stream_payload_0_mantissa_4 <= _zz_io_c_stream_payload_0_mantissa_11;
        end
        if(_zz_16) begin
          _zz_io_c_stream_payload_0_mantissa_5 <= _zz_io_c_stream_payload_0_mantissa_11;
        end
        if(_zz_17) begin
          _zz_io_c_stream_payload_0_mantissa_6 <= _zz_io_c_stream_payload_0_mantissa_11;
        end
        if(_zz_18) begin
          _zz_io_c_stream_payload_0_mantissa_7 <= _zz_io_c_stream_payload_0_mantissa_11;
        end
        if(_zz_19) begin
          _zz_io_c_stream_payload_0_mantissa_8 <= _zz_io_c_stream_payload_0_mantissa_11;
        end
        if(_zz_20) begin
          _zz_io_c_stream_payload_0_mantissa_9 <= _zz_io_c_stream_payload_0_mantissa_11;
        end
        if(_zz_21) begin
          _zz_io_c_stream_payload_0_mantissa_10 <= _zz_io_c_stream_payload_0_mantissa_11;
        end
        if(_zz_12) begin
          _zz_io_c_stream_payload_0_exponent <= _zz_io_c_stream_payload_0_exponent_10;
        end
        if(_zz_13) begin
          _zz_io_c_stream_payload_0_exponent_1 <= _zz_io_c_stream_payload_0_exponent_10;
        end
        if(_zz_14) begin
          _zz_io_c_stream_payload_0_exponent_2 <= _zz_io_c_stream_payload_0_exponent_10;
        end
        if(_zz_15) begin
          _zz_io_c_stream_payload_0_exponent_3 <= _zz_io_c_stream_payload_0_exponent_10;
        end
        if(_zz_16) begin
          _zz_io_c_stream_payload_0_exponent_4 <= _zz_io_c_stream_payload_0_exponent_10;
        end
        if(_zz_17) begin
          _zz_io_c_stream_payload_0_exponent_5 <= _zz_io_c_stream_payload_0_exponent_10;
        end
        if(_zz_18) begin
          _zz_io_c_stream_payload_0_exponent_6 <= _zz_io_c_stream_payload_0_exponent_10;
        end
        if(_zz_19) begin
          _zz_io_c_stream_payload_0_exponent_7 <= _zz_io_c_stream_payload_0_exponent_10;
        end
        if(_zz_20) begin
          _zz_io_c_stream_payload_0_exponent_8 <= _zz_io_c_stream_payload_0_exponent_10;
        end
        if(_zz_21) begin
          _zz_io_c_stream_payload_0_exponent_9 <= _zz_io_c_stream_payload_0_exponent_10;
        end
        if(_zz_12) begin
          _zz_io_c_stream_payload_0_sign <= _zz_io_c_stream_payload_0_sign_10;
        end
        if(_zz_13) begin
          _zz_io_c_stream_payload_0_sign_1 <= _zz_io_c_stream_payload_0_sign_10;
        end
        if(_zz_14) begin
          _zz_io_c_stream_payload_0_sign_2 <= _zz_io_c_stream_payload_0_sign_10;
        end
        if(_zz_15) begin
          _zz_io_c_stream_payload_0_sign_3 <= _zz_io_c_stream_payload_0_sign_10;
        end
        if(_zz_16) begin
          _zz_io_c_stream_payload_0_sign_4 <= _zz_io_c_stream_payload_0_sign_10;
        end
        if(_zz_17) begin
          _zz_io_c_stream_payload_0_sign_5 <= _zz_io_c_stream_payload_0_sign_10;
        end
        if(_zz_18) begin
          _zz_io_c_stream_payload_0_sign_6 <= _zz_io_c_stream_payload_0_sign_10;
        end
        if(_zz_19) begin
          _zz_io_c_stream_payload_0_sign_7 <= _zz_io_c_stream_payload_0_sign_10;
        end
        if(_zz_20) begin
          _zz_io_c_stream_payload_0_sign_8 <= _zz_io_c_stream_payload_0_sign_10;
        end
        if(_zz_21) begin
          _zz_io_c_stream_payload_0_sign_9 <= _zz_io_c_stream_payload_0_sign_10;
        end
      end
      _zz_io_c_stream_payload_0_mantissa_18 <= _zz_io_c_stream_payload_0_mantissa_17;
      _zz_27 <= _zz_26;
      _zz_30 <= _zz_31;
      case(_zz_30)
        StateMachineEnum__1 : begin
        end
        StateMachineEnum__2 : begin
        end
        StateMachineEnum__3 : begin
          if(_zz_8) begin
            if(nCounter_willOverflowIfInc) begin
              _zz_io_c_stream_payload_0_mantissa_15 <= 1'b0;
              when_matmul_l371 <= (1'b0 == 1'b0);
            end
          end
        end
        StateMachineEnum__4 : begin
        end
        StateMachineEnum__5 : begin
          if(io_c_stream_ready) begin
            if(_zz_34) begin
              _zz_io_c_stream_payload_0_mantissa_1 <= 3'b000;
            end
            if(_zz_35) begin
              _zz_io_c_stream_payload_0_mantissa_2 <= 3'b000;
            end
            if(_zz_36) begin
              _zz_io_c_stream_payload_0_mantissa_3 <= 3'b000;
            end
            if(_zz_37) begin
              _zz_io_c_stream_payload_0_mantissa_4 <= 3'b000;
            end
            if(_zz_38) begin
              _zz_io_c_stream_payload_0_mantissa_5 <= 3'b000;
            end
            if(_zz_39) begin
              _zz_io_c_stream_payload_0_mantissa_6 <= 3'b000;
            end
            if(_zz_40) begin
              _zz_io_c_stream_payload_0_mantissa_7 <= 3'b000;
            end
            if(_zz_41) begin
              _zz_io_c_stream_payload_0_mantissa_8 <= 3'b000;
            end
            if(_zz_42) begin
              _zz_io_c_stream_payload_0_mantissa_9 <= 3'b000;
            end
            if(_zz_43) begin
              _zz_io_c_stream_payload_0_mantissa_10 <= 3'b000;
            end
            if(_zz_34) begin
              _zz_io_c_stream_payload_0_exponent <= 4'b0000;
            end
            if(_zz_35) begin
              _zz_io_c_stream_payload_0_exponent_1 <= 4'b0000;
            end
            if(_zz_36) begin
              _zz_io_c_stream_payload_0_exponent_2 <= 4'b0000;
            end
            if(_zz_37) begin
              _zz_io_c_stream_payload_0_exponent_3 <= 4'b0000;
            end
            if(_zz_38) begin
              _zz_io_c_stream_payload_0_exponent_4 <= 4'b0000;
            end
            if(_zz_39) begin
              _zz_io_c_stream_payload_0_exponent_5 <= 4'b0000;
            end
            if(_zz_40) begin
              _zz_io_c_stream_payload_0_exponent_6 <= 4'b0000;
            end
            if(_zz_41) begin
              _zz_io_c_stream_payload_0_exponent_7 <= 4'b0000;
            end
            if(_zz_42) begin
              _zz_io_c_stream_payload_0_exponent_8 <= 4'b0000;
            end
            if(_zz_43) begin
              _zz_io_c_stream_payload_0_exponent_9 <= 4'b0000;
            end
            if(_zz_34) begin
              _zz_io_c_stream_payload_0_sign <= 1'b0;
            end
            if(_zz_35) begin
              _zz_io_c_stream_payload_0_sign_1 <= 1'b0;
            end
            if(_zz_36) begin
              _zz_io_c_stream_payload_0_sign_2 <= 1'b0;
            end
            if(_zz_37) begin
              _zz_io_c_stream_payload_0_sign_3 <= 1'b0;
            end
            if(_zz_38) begin
              _zz_io_c_stream_payload_0_sign_4 <= 1'b0;
            end
            if(_zz_39) begin
              _zz_io_c_stream_payload_0_sign_5 <= 1'b0;
            end
            if(_zz_40) begin
              _zz_io_c_stream_payload_0_sign_6 <= 1'b0;
            end
            if(_zz_41) begin
              _zz_io_c_stream_payload_0_sign_7 <= 1'b0;
            end
            if(_zz_42) begin
              _zz_io_c_stream_payload_0_sign_8 <= 1'b0;
            end
            if(_zz_43) begin
              _zz_io_c_stream_payload_0_sign_9 <= 1'b0;
            end
            if(_zz_22) begin
              if(when_matmul_l371) begin
                when_matmul_l371 <= 1'b0;
              end
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(when_matmul_l239) begin
      nCounter_value_regNextWhen <= nCounter_value;
    end
    if(when_matmul_l239_regNext) begin
      nCounter_value_regNextWhen_regNextWhen <= nCounter_value_regNextWhen;
    end
    if(when_Utils_l1073) begin
      nCounter_value_regNextWhen_regNextWhen_delay_1 <= nCounter_value_regNextWhen_regNextWhen;
    end
    if(when_Utils_l1073) begin
      nCounter_value_regNextWhen_regNextWhen_delay_2 <= nCounter_value_regNextWhen_regNextWhen_delay_1;
    end
  end


endmodule

module StreamFifo_4 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [2:0]    io_push_payload_0_mantissa,
  input  wire [3:0]    io_push_payload_0_exponent,
  input  wire          io_push_payload_0_sign,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [2:0]    io_pop_payload_0_mantissa,
  output wire [3:0]    io_pop_payload_0_exponent,
  output wire          io_pop_payload_0_sign,
  input  wire          io_flush,
  output wire [4:0]    io_occupancy,
  output wire [4:0]    io_availability,
  input  wire          clk,
  input  wire          reset
);

  reg        [7:0]    logic_ram_spinal_port1;
  wire       [7:0]    _zz_logic_ram_port;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [4:0]    logic_ptr_push;
  reg        [4:0]    logic_ptr_pop;
  wire       [4:0]    logic_ptr_occupancy;
  wire       [4:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1557;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [3:0]    logic_push_onRam_write_payload_address;
  wire       [2:0]    logic_push_onRam_write_payload_data_0_mantissa;
  wire       [3:0]    logic_push_onRam_write_payload_data_0_exponent;
  wire                logic_push_onRam_write_payload_data_0_sign;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [3:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitration_valid;
  wire                logic_pop_sync_readArbitration_ready;
  wire       [3:0]    logic_pop_sync_readArbitration_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [3:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l477;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [3:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [2:0]    logic_pop_sync_readPort_rsp_0_mantissa;
  wire       [3:0]    logic_pop_sync_readPort_rsp_0_exponent;
  wire                logic_pop_sync_readPort_rsp_0_sign;
  wire       [7:0]    _zz_logic_pop_sync_readPort_rsp_0_mantissa;
  wire                logic_pop_addressGen_toFlowFire_valid;
  wire       [3:0]    logic_pop_addressGen_toFlowFire_payload;
  wire                logic_pop_sync_readArbitration_translated_valid;
  wire                logic_pop_sync_readArbitration_translated_ready;
  wire       [2:0]    logic_pop_sync_readArbitration_translated_payload_0_mantissa;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_0_exponent;
  wire                logic_pop_sync_readArbitration_translated_payload_0_sign;
  wire                logic_pop_sync_readArbitration_fire;
  reg        [4:0]    logic_pop_sync_popReg;
  reg [7:0] logic_ram [0:15];

  assign _zz_logic_ram_port = {logic_push_onRam_write_payload_data_0_sign,{logic_push_onRam_write_payload_data_0_exponent,logic_push_onRam_write_payload_data_0_mantissa}};
  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= _zz_logic_ram_port;
    end
  end

  always @(posedge clk) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      logic_ram_spinal_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1557 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 5'h10) == 5'h0);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[3:0];
  assign logic_push_onRam_write_payload_data_0_mantissa = io_push_payload_0_mantissa;
  assign logic_push_onRam_write_payload_data_0_exponent = io_push_payload_0_exponent;
  assign logic_push_onRam_write_payload_data_0_sign = io_push_payload_0_sign;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[3:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitration_ready;
    if(when_Stream_l477) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l477 = (! logic_pop_sync_readArbitration_valid);
  assign logic_pop_sync_readArbitration_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitration_payload = logic_pop_addressGen_rData;
  assign _zz_logic_pop_sync_readPort_rsp_0_mantissa = logic_ram_spinal_port1[7 : 0];
  assign logic_pop_sync_readPort_rsp_0_mantissa = _zz_logic_pop_sync_readPort_rsp_0_mantissa[2 : 0];
  assign logic_pop_sync_readPort_rsp_0_exponent = _zz_logic_pop_sync_readPort_rsp_0_mantissa[6 : 3];
  assign logic_pop_sync_readPort_rsp_0_sign = _zz_logic_pop_sync_readPort_rsp_0_mantissa[7];
  assign logic_pop_addressGen_toFlowFire_valid = logic_pop_addressGen_fire;
  assign logic_pop_addressGen_toFlowFire_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_toFlowFire_valid;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_toFlowFire_payload;
  assign logic_pop_sync_readArbitration_translated_valid = logic_pop_sync_readArbitration_valid;
  assign logic_pop_sync_readArbitration_ready = logic_pop_sync_readArbitration_translated_ready;
  assign logic_pop_sync_readArbitration_translated_payload_0_mantissa = logic_pop_sync_readPort_rsp_0_mantissa;
  assign logic_pop_sync_readArbitration_translated_payload_0_exponent = logic_pop_sync_readPort_rsp_0_exponent;
  assign logic_pop_sync_readArbitration_translated_payload_0_sign = logic_pop_sync_readPort_rsp_0_sign;
  assign io_pop_valid = logic_pop_sync_readArbitration_translated_valid;
  assign logic_pop_sync_readArbitration_translated_ready = io_pop_ready;
  assign io_pop_payload_0_mantissa = logic_pop_sync_readArbitration_translated_payload_0_mantissa;
  assign io_pop_payload_0_exponent = logic_pop_sync_readArbitration_translated_payload_0_exponent;
  assign io_pop_payload_0_sign = logic_pop_sync_readArbitration_translated_payload_0_sign;
  assign logic_pop_sync_readArbitration_fire = (logic_pop_sync_readArbitration_valid && logic_pop_sync_readArbitration_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (5'h10 - logic_ptr_occupancy);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_ptr_push <= 5'h0;
      logic_ptr_pop <= 5'h0;
      logic_ptr_wentUp <= 1'b0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 5'h0;
    end else begin
      if(when_Stream_l1557) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 5'h01);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 5'h01);
      end
      if(io_flush) begin
        logic_ptr_push <= 5'h0;
        logic_ptr_pop <= 5'h0;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitration_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 5'h0;
      end
    end
  end

  always @(posedge clk) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

module RepackOp_5 (
  input  wire          io_a_stream_valid,
  output wire          io_a_stream_ready,
  input  wire [2:0]    io_a_stream_payload_0_mantissa,
  input  wire [3:0]    io_a_stream_payload_0_exponent,
  input  wire          io_a_stream_payload_0_sign,
  input  wire [2:0]    io_a_stream_payload_1_mantissa,
  input  wire [3:0]    io_a_stream_payload_1_exponent,
  input  wire          io_a_stream_payload_1_sign,
  input  wire [2:0]    io_a_stream_payload_2_mantissa,
  input  wire [3:0]    io_a_stream_payload_2_exponent,
  input  wire          io_a_stream_payload_2_sign,
  input  wire [2:0]    io_a_stream_payload_3_mantissa,
  input  wire [3:0]    io_a_stream_payload_3_exponent,
  input  wire          io_a_stream_payload_3_sign,
  input  wire [2:0]    io_a_stream_payload_4_mantissa,
  input  wire [3:0]    io_a_stream_payload_4_exponent,
  input  wire          io_a_stream_payload_4_sign,
  input  wire [2:0]    io_a_stream_payload_5_mantissa,
  input  wire [3:0]    io_a_stream_payload_5_exponent,
  input  wire          io_a_stream_payload_5_sign,
  input  wire [2:0]    io_a_stream_payload_6_mantissa,
  input  wire [3:0]    io_a_stream_payload_6_exponent,
  input  wire          io_a_stream_payload_6_sign,
  input  wire [2:0]    io_a_stream_payload_7_mantissa,
  input  wire [3:0]    io_a_stream_payload_7_exponent,
  input  wire          io_a_stream_payload_7_sign,
  output wire          io_c_stream_valid,
  input  wire          io_c_stream_ready,
  output wire [2:0]    io_c_stream_payload_0_mantissa,
  output wire [3:0]    io_c_stream_payload_0_exponent,
  output wire          io_c_stream_payload_0_sign,
  input  wire          io_reArm,
  output wire          io_isEmpty,
  input  wire          clk,
  input  wire          reset
);

  wire       [7:0]    _zz__zz_io_c_stream_payload_0_mantissa_1;
  wire       [6:0]    _zz__zz_io_c_stream_payload_0_mantissa_1_1;
  wire       [3:0]    _zz__zz_io_c_stream_payload_0_mantissa;
  wire       [2:0]    _zz__zz_io_c_stream_payload_0_mantissa_2;
  wire       [0:0]    _zz__zz_io_c_stream_payload_0_mantissa_3;
  wire       [6:0]    _zz__zz_io_c_stream_payload_0_mantissa_4;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_mantissa_5;
  wire       [23:0]   _zz__zz_io_c_stream_payload_0_mantissa_6;
  wire       [3:0]    _zz__zz_io_c_stream_payload_0_mantissa_7;
  wire       [2:0]    _zz__zz_io_c_stream_payload_0_mantissa_8;
  wire       [3:0]    _zz__zz_io_c_stream_payload_0_mantissa_9;
  wire       [2:0]    _zz__zz_io_c_stream_payload_0_mantissa_10;
  reg        [63:0]   _zz_io_c_stream_payload_0_mantissa;
  reg        [2:0]    _zz_io_a_stream_ready;
  reg                 _zz_io_a_stream_ready_1;
  wire                io_c_stream_fire;
  wire       [7:0]    _zz_io_c_stream_payload_0_mantissa_1;
  wire                io_a_stream_fire;
  wire                when_repack_l55;

  assign _zz__zz_io_c_stream_payload_0_mantissa_1 = _zz_io_c_stream_payload_0_mantissa[_zz__zz_io_c_stream_payload_0_mantissa_1_1 +: 8];
  assign _zz__zz_io_c_stream_payload_0_mantissa_1_1 = (_zz_io_a_stream_ready * 4'b1000);
  assign _zz__zz_io_c_stream_payload_0_mantissa = io_a_stream_payload_5_exponent;
  assign _zz__zz_io_c_stream_payload_0_mantissa_2 = io_a_stream_payload_5_mantissa;
  assign _zz__zz_io_c_stream_payload_0_mantissa_3 = io_a_stream_payload_4_sign;
  assign _zz__zz_io_c_stream_payload_0_mantissa_4 = {io_a_stream_payload_4_exponent,io_a_stream_payload_4_mantissa};
  assign _zz__zz_io_c_stream_payload_0_mantissa_5 = {io_a_stream_payload_3_sign,{io_a_stream_payload_3_exponent,io_a_stream_payload_3_mantissa}};
  assign _zz__zz_io_c_stream_payload_0_mantissa_6 = {{io_a_stream_payload_2_sign,{io_a_stream_payload_2_exponent,io_a_stream_payload_2_mantissa}},{{io_a_stream_payload_1_sign,{_zz__zz_io_c_stream_payload_0_mantissa_7,_zz__zz_io_c_stream_payload_0_mantissa_8}},{io_a_stream_payload_0_sign,{_zz__zz_io_c_stream_payload_0_mantissa_9,_zz__zz_io_c_stream_payload_0_mantissa_10}}}};
  assign _zz__zz_io_c_stream_payload_0_mantissa_7 = io_a_stream_payload_1_exponent;
  assign _zz__zz_io_c_stream_payload_0_mantissa_8 = io_a_stream_payload_1_mantissa;
  assign _zz__zz_io_c_stream_payload_0_mantissa_9 = io_a_stream_payload_0_exponent;
  assign _zz__zz_io_c_stream_payload_0_mantissa_10 = io_a_stream_payload_0_mantissa;
  assign io_c_stream_fire = (io_c_stream_valid && io_c_stream_ready);
  assign io_a_stream_ready = ((! _zz_io_a_stream_ready_1) || (io_c_stream_fire && (_zz_io_a_stream_ready == 3'b111)));
  assign io_c_stream_valid = _zz_io_a_stream_ready_1;
  assign _zz_io_c_stream_payload_0_mantissa_1 = _zz__zz_io_c_stream_payload_0_mantissa_1[7 : 0];
  assign io_c_stream_payload_0_mantissa = _zz_io_c_stream_payload_0_mantissa_1[2 : 0];
  assign io_c_stream_payload_0_exponent = _zz_io_c_stream_payload_0_mantissa_1[6 : 3];
  assign io_c_stream_payload_0_sign = _zz_io_c_stream_payload_0_mantissa_1[7];
  assign io_a_stream_fire = (io_a_stream_valid && io_a_stream_ready);
  assign when_repack_l55 = (_zz_io_a_stream_ready == 3'b111);
  assign io_isEmpty = (! _zz_io_a_stream_ready_1);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_a_stream_ready <= 3'b000;
      _zz_io_a_stream_ready_1 <= 1'b0;
    end else begin
      if(io_a_stream_fire) begin
        _zz_io_a_stream_ready <= 3'b000;
        _zz_io_a_stream_ready_1 <= 1'b1;
      end else begin
        if(io_c_stream_fire) begin
          _zz_io_a_stream_ready <= (_zz_io_a_stream_ready + 3'b001);
          if(when_repack_l55) begin
            _zz_io_a_stream_ready_1 <= 1'b0;
          end
        end
      end
      if(io_reArm) begin
        _zz_io_a_stream_ready_1 <= 1'b0;
        _zz_io_a_stream_ready <= 3'b000;
      end
    end
  end

  always @(posedge clk) begin
    if(io_a_stream_fire) begin
      _zz_io_c_stream_payload_0_mantissa <= {{io_a_stream_payload_7_sign,{io_a_stream_payload_7_exponent,io_a_stream_payload_7_mantissa}},{{io_a_stream_payload_6_sign,{io_a_stream_payload_6_exponent,io_a_stream_payload_6_mantissa}},{{io_a_stream_payload_5_sign,{_zz__zz_io_c_stream_payload_0_mantissa,_zz__zz_io_c_stream_payload_0_mantissa_2}},{{_zz__zz_io_c_stream_payload_0_mantissa_3,_zz__zz_io_c_stream_payload_0_mantissa_4},{_zz__zz_io_c_stream_payload_0_mantissa_5,_zz__zz_io_c_stream_payload_0_mantissa_6}}}}};
    end
  end


endmodule

module StreamFifo_3 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [2:0]    io_push_payload_0_mantissa,
  input  wire [3:0]    io_push_payload_0_exponent,
  input  wire          io_push_payload_0_sign,
  input  wire [2:0]    io_push_payload_1_mantissa,
  input  wire [3:0]    io_push_payload_1_exponent,
  input  wire          io_push_payload_1_sign,
  input  wire [2:0]    io_push_payload_2_mantissa,
  input  wire [3:0]    io_push_payload_2_exponent,
  input  wire          io_push_payload_2_sign,
  input  wire [2:0]    io_push_payload_3_mantissa,
  input  wire [3:0]    io_push_payload_3_exponent,
  input  wire          io_push_payload_3_sign,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [2:0]    io_pop_payload_0_mantissa,
  output wire [3:0]    io_pop_payload_0_exponent,
  output wire          io_pop_payload_0_sign,
  output wire [2:0]    io_pop_payload_1_mantissa,
  output wire [3:0]    io_pop_payload_1_exponent,
  output wire          io_pop_payload_1_sign,
  output wire [2:0]    io_pop_payload_2_mantissa,
  output wire [3:0]    io_pop_payload_2_exponent,
  output wire          io_pop_payload_2_sign,
  output wire [2:0]    io_pop_payload_3_mantissa,
  output wire [3:0]    io_pop_payload_3_exponent,
  output wire          io_pop_payload_3_sign,
  input  wire          io_flush,
  output wire [4:0]    io_occupancy,
  output wire [4:0]    io_availability,
  input  wire          clk,
  input  wire          reset
);

  reg        [31:0]   logic_ram_spinal_port1;
  wire       [31:0]   _zz_logic_ram_port;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [4:0]    logic_ptr_push;
  reg        [4:0]    logic_ptr_pop;
  wire       [4:0]    logic_ptr_occupancy;
  wire       [4:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1557;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [3:0]    logic_push_onRam_write_payload_address;
  wire       [2:0]    logic_push_onRam_write_payload_data_0_mantissa;
  wire       [3:0]    logic_push_onRam_write_payload_data_0_exponent;
  wire                logic_push_onRam_write_payload_data_0_sign;
  wire       [2:0]    logic_push_onRam_write_payload_data_1_mantissa;
  wire       [3:0]    logic_push_onRam_write_payload_data_1_exponent;
  wire                logic_push_onRam_write_payload_data_1_sign;
  wire       [2:0]    logic_push_onRam_write_payload_data_2_mantissa;
  wire       [3:0]    logic_push_onRam_write_payload_data_2_exponent;
  wire                logic_push_onRam_write_payload_data_2_sign;
  wire       [2:0]    logic_push_onRam_write_payload_data_3_mantissa;
  wire       [3:0]    logic_push_onRam_write_payload_data_3_exponent;
  wire                logic_push_onRam_write_payload_data_3_sign;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [3:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitration_valid;
  wire                logic_pop_sync_readArbitration_ready;
  wire       [3:0]    logic_pop_sync_readArbitration_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [3:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l477;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [3:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [2:0]    logic_pop_sync_readPort_rsp_0_mantissa;
  wire       [3:0]    logic_pop_sync_readPort_rsp_0_exponent;
  wire                logic_pop_sync_readPort_rsp_0_sign;
  wire       [2:0]    logic_pop_sync_readPort_rsp_1_mantissa;
  wire       [3:0]    logic_pop_sync_readPort_rsp_1_exponent;
  wire                logic_pop_sync_readPort_rsp_1_sign;
  wire       [2:0]    logic_pop_sync_readPort_rsp_2_mantissa;
  wire       [3:0]    logic_pop_sync_readPort_rsp_2_exponent;
  wire                logic_pop_sync_readPort_rsp_2_sign;
  wire       [2:0]    logic_pop_sync_readPort_rsp_3_mantissa;
  wire       [3:0]    logic_pop_sync_readPort_rsp_3_exponent;
  wire                logic_pop_sync_readPort_rsp_3_sign;
  wire       [31:0]   _zz_logic_pop_sync_readPort_rsp_0_mantissa;
  wire       [7:0]    _zz_logic_pop_sync_readPort_rsp_0_mantissa_1;
  wire       [7:0]    _zz_logic_pop_sync_readPort_rsp_1_mantissa;
  wire       [7:0]    _zz_logic_pop_sync_readPort_rsp_2_mantissa;
  wire       [7:0]    _zz_logic_pop_sync_readPort_rsp_3_mantissa;
  wire                logic_pop_addressGen_toFlowFire_valid;
  wire       [3:0]    logic_pop_addressGen_toFlowFire_payload;
  wire                logic_pop_sync_readArbitration_translated_valid;
  wire                logic_pop_sync_readArbitration_translated_ready;
  wire       [2:0]    logic_pop_sync_readArbitration_translated_payload_0_mantissa;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_0_exponent;
  wire                logic_pop_sync_readArbitration_translated_payload_0_sign;
  wire       [2:0]    logic_pop_sync_readArbitration_translated_payload_1_mantissa;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_1_exponent;
  wire                logic_pop_sync_readArbitration_translated_payload_1_sign;
  wire       [2:0]    logic_pop_sync_readArbitration_translated_payload_2_mantissa;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_2_exponent;
  wire                logic_pop_sync_readArbitration_translated_payload_2_sign;
  wire       [2:0]    logic_pop_sync_readArbitration_translated_payload_3_mantissa;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_3_exponent;
  wire                logic_pop_sync_readArbitration_translated_payload_3_sign;
  wire                logic_pop_sync_readArbitration_fire;
  reg        [4:0]    logic_pop_sync_popReg;
  reg [31:0] logic_ram [0:15];

  assign _zz_logic_ram_port = {{logic_push_onRam_write_payload_data_3_sign,{logic_push_onRam_write_payload_data_3_exponent,logic_push_onRam_write_payload_data_3_mantissa}},{{logic_push_onRam_write_payload_data_2_sign,{logic_push_onRam_write_payload_data_2_exponent,logic_push_onRam_write_payload_data_2_mantissa}},{{logic_push_onRam_write_payload_data_1_sign,{logic_push_onRam_write_payload_data_1_exponent,logic_push_onRam_write_payload_data_1_mantissa}},{logic_push_onRam_write_payload_data_0_sign,{logic_push_onRam_write_payload_data_0_exponent,logic_push_onRam_write_payload_data_0_mantissa}}}}};
  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= _zz_logic_ram_port;
    end
  end

  always @(posedge clk) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      logic_ram_spinal_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1557 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 5'h10) == 5'h0);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[3:0];
  assign logic_push_onRam_write_payload_data_0_mantissa = io_push_payload_0_mantissa;
  assign logic_push_onRam_write_payload_data_0_exponent = io_push_payload_0_exponent;
  assign logic_push_onRam_write_payload_data_0_sign = io_push_payload_0_sign;
  assign logic_push_onRam_write_payload_data_1_mantissa = io_push_payload_1_mantissa;
  assign logic_push_onRam_write_payload_data_1_exponent = io_push_payload_1_exponent;
  assign logic_push_onRam_write_payload_data_1_sign = io_push_payload_1_sign;
  assign logic_push_onRam_write_payload_data_2_mantissa = io_push_payload_2_mantissa;
  assign logic_push_onRam_write_payload_data_2_exponent = io_push_payload_2_exponent;
  assign logic_push_onRam_write_payload_data_2_sign = io_push_payload_2_sign;
  assign logic_push_onRam_write_payload_data_3_mantissa = io_push_payload_3_mantissa;
  assign logic_push_onRam_write_payload_data_3_exponent = io_push_payload_3_exponent;
  assign logic_push_onRam_write_payload_data_3_sign = io_push_payload_3_sign;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[3:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitration_ready;
    if(when_Stream_l477) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l477 = (! logic_pop_sync_readArbitration_valid);
  assign logic_pop_sync_readArbitration_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitration_payload = logic_pop_addressGen_rData;
  assign _zz_logic_pop_sync_readPort_rsp_0_mantissa = logic_ram_spinal_port1;
  assign _zz_logic_pop_sync_readPort_rsp_0_mantissa_1 = _zz_logic_pop_sync_readPort_rsp_0_mantissa[7 : 0];
  assign _zz_logic_pop_sync_readPort_rsp_1_mantissa = _zz_logic_pop_sync_readPort_rsp_0_mantissa[15 : 8];
  assign _zz_logic_pop_sync_readPort_rsp_2_mantissa = _zz_logic_pop_sync_readPort_rsp_0_mantissa[23 : 16];
  assign _zz_logic_pop_sync_readPort_rsp_3_mantissa = _zz_logic_pop_sync_readPort_rsp_0_mantissa[31 : 24];
  assign logic_pop_sync_readPort_rsp_0_mantissa = _zz_logic_pop_sync_readPort_rsp_0_mantissa_1[2 : 0];
  assign logic_pop_sync_readPort_rsp_0_exponent = _zz_logic_pop_sync_readPort_rsp_0_mantissa_1[6 : 3];
  assign logic_pop_sync_readPort_rsp_0_sign = _zz_logic_pop_sync_readPort_rsp_0_mantissa_1[7];
  assign logic_pop_sync_readPort_rsp_1_mantissa = _zz_logic_pop_sync_readPort_rsp_1_mantissa[2 : 0];
  assign logic_pop_sync_readPort_rsp_1_exponent = _zz_logic_pop_sync_readPort_rsp_1_mantissa[6 : 3];
  assign logic_pop_sync_readPort_rsp_1_sign = _zz_logic_pop_sync_readPort_rsp_1_mantissa[7];
  assign logic_pop_sync_readPort_rsp_2_mantissa = _zz_logic_pop_sync_readPort_rsp_2_mantissa[2 : 0];
  assign logic_pop_sync_readPort_rsp_2_exponent = _zz_logic_pop_sync_readPort_rsp_2_mantissa[6 : 3];
  assign logic_pop_sync_readPort_rsp_2_sign = _zz_logic_pop_sync_readPort_rsp_2_mantissa[7];
  assign logic_pop_sync_readPort_rsp_3_mantissa = _zz_logic_pop_sync_readPort_rsp_3_mantissa[2 : 0];
  assign logic_pop_sync_readPort_rsp_3_exponent = _zz_logic_pop_sync_readPort_rsp_3_mantissa[6 : 3];
  assign logic_pop_sync_readPort_rsp_3_sign = _zz_logic_pop_sync_readPort_rsp_3_mantissa[7];
  assign logic_pop_addressGen_toFlowFire_valid = logic_pop_addressGen_fire;
  assign logic_pop_addressGen_toFlowFire_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_toFlowFire_valid;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_toFlowFire_payload;
  assign logic_pop_sync_readArbitration_translated_valid = logic_pop_sync_readArbitration_valid;
  assign logic_pop_sync_readArbitration_ready = logic_pop_sync_readArbitration_translated_ready;
  assign logic_pop_sync_readArbitration_translated_payload_0_mantissa = logic_pop_sync_readPort_rsp_0_mantissa;
  assign logic_pop_sync_readArbitration_translated_payload_0_exponent = logic_pop_sync_readPort_rsp_0_exponent;
  assign logic_pop_sync_readArbitration_translated_payload_0_sign = logic_pop_sync_readPort_rsp_0_sign;
  assign logic_pop_sync_readArbitration_translated_payload_1_mantissa = logic_pop_sync_readPort_rsp_1_mantissa;
  assign logic_pop_sync_readArbitration_translated_payload_1_exponent = logic_pop_sync_readPort_rsp_1_exponent;
  assign logic_pop_sync_readArbitration_translated_payload_1_sign = logic_pop_sync_readPort_rsp_1_sign;
  assign logic_pop_sync_readArbitration_translated_payload_2_mantissa = logic_pop_sync_readPort_rsp_2_mantissa;
  assign logic_pop_sync_readArbitration_translated_payload_2_exponent = logic_pop_sync_readPort_rsp_2_exponent;
  assign logic_pop_sync_readArbitration_translated_payload_2_sign = logic_pop_sync_readPort_rsp_2_sign;
  assign logic_pop_sync_readArbitration_translated_payload_3_mantissa = logic_pop_sync_readPort_rsp_3_mantissa;
  assign logic_pop_sync_readArbitration_translated_payload_3_exponent = logic_pop_sync_readPort_rsp_3_exponent;
  assign logic_pop_sync_readArbitration_translated_payload_3_sign = logic_pop_sync_readPort_rsp_3_sign;
  assign io_pop_valid = logic_pop_sync_readArbitration_translated_valid;
  assign logic_pop_sync_readArbitration_translated_ready = io_pop_ready;
  assign io_pop_payload_0_mantissa = logic_pop_sync_readArbitration_translated_payload_0_mantissa;
  assign io_pop_payload_0_exponent = logic_pop_sync_readArbitration_translated_payload_0_exponent;
  assign io_pop_payload_0_sign = logic_pop_sync_readArbitration_translated_payload_0_sign;
  assign io_pop_payload_1_mantissa = logic_pop_sync_readArbitration_translated_payload_1_mantissa;
  assign io_pop_payload_1_exponent = logic_pop_sync_readArbitration_translated_payload_1_exponent;
  assign io_pop_payload_1_sign = logic_pop_sync_readArbitration_translated_payload_1_sign;
  assign io_pop_payload_2_mantissa = logic_pop_sync_readArbitration_translated_payload_2_mantissa;
  assign io_pop_payload_2_exponent = logic_pop_sync_readArbitration_translated_payload_2_exponent;
  assign io_pop_payload_2_sign = logic_pop_sync_readArbitration_translated_payload_2_sign;
  assign io_pop_payload_3_mantissa = logic_pop_sync_readArbitration_translated_payload_3_mantissa;
  assign io_pop_payload_3_exponent = logic_pop_sync_readArbitration_translated_payload_3_exponent;
  assign io_pop_payload_3_sign = logic_pop_sync_readArbitration_translated_payload_3_sign;
  assign logic_pop_sync_readArbitration_fire = (logic_pop_sync_readArbitration_valid && logic_pop_sync_readArbitration_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (5'h10 - logic_ptr_occupancy);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_ptr_push <= 5'h0;
      logic_ptr_pop <= 5'h0;
      logic_ptr_wentUp <= 1'b0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 5'h0;
    end else begin
      if(when_Stream_l1557) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 5'h01);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 5'h01);
      end
      if(io_flush) begin
        logic_ptr_push <= 5'h0;
        logic_ptr_pop <= 5'h0;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitration_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 5'h0;
      end
    end
  end

  always @(posedge clk) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

module RepackOp_4 (
  input  wire          io_a_stream_valid,
  output wire          io_a_stream_ready,
  input  wire [2:0]    io_a_stream_payload_0_mantissa,
  input  wire [3:0]    io_a_stream_payload_0_exponent,
  input  wire          io_a_stream_payload_0_sign,
  input  wire [2:0]    io_a_stream_payload_1_mantissa,
  input  wire [3:0]    io_a_stream_payload_1_exponent,
  input  wire          io_a_stream_payload_1_sign,
  input  wire [2:0]    io_a_stream_payload_2_mantissa,
  input  wire [3:0]    io_a_stream_payload_2_exponent,
  input  wire          io_a_stream_payload_2_sign,
  input  wire [2:0]    io_a_stream_payload_3_mantissa,
  input  wire [3:0]    io_a_stream_payload_3_exponent,
  input  wire          io_a_stream_payload_3_sign,
  input  wire [2:0]    io_a_stream_payload_4_mantissa,
  input  wire [3:0]    io_a_stream_payload_4_exponent,
  input  wire          io_a_stream_payload_4_sign,
  input  wire [2:0]    io_a_stream_payload_5_mantissa,
  input  wire [3:0]    io_a_stream_payload_5_exponent,
  input  wire          io_a_stream_payload_5_sign,
  input  wire [2:0]    io_a_stream_payload_6_mantissa,
  input  wire [3:0]    io_a_stream_payload_6_exponent,
  input  wire          io_a_stream_payload_6_sign,
  input  wire [2:0]    io_a_stream_payload_7_mantissa,
  input  wire [3:0]    io_a_stream_payload_7_exponent,
  input  wire          io_a_stream_payload_7_sign,
  output wire          io_c_stream_valid,
  input  wire          io_c_stream_ready,
  output wire [2:0]    io_c_stream_payload_0_mantissa,
  output wire [3:0]    io_c_stream_payload_0_exponent,
  output wire          io_c_stream_payload_0_sign,
  output wire [2:0]    io_c_stream_payload_1_mantissa,
  output wire [3:0]    io_c_stream_payload_1_exponent,
  output wire          io_c_stream_payload_1_sign,
  output wire [2:0]    io_c_stream_payload_2_mantissa,
  output wire [3:0]    io_c_stream_payload_2_exponent,
  output wire          io_c_stream_payload_2_sign,
  output wire [2:0]    io_c_stream_payload_3_mantissa,
  output wire [3:0]    io_c_stream_payload_3_exponent,
  output wire          io_c_stream_payload_3_sign,
  input  wire          io_reArm,
  output wire          io_isEmpty,
  input  wire          clk,
  input  wire          reset
);

  wire       [6:0]    _zz__zz_io_c_stream_payload_0_mantissa_1;
  wire       [3:0]    _zz__zz_io_c_stream_payload_0_mantissa;
  wire       [2:0]    _zz__zz_io_c_stream_payload_0_mantissa_2;
  wire       [0:0]    _zz__zz_io_c_stream_payload_0_mantissa_3;
  wire       [6:0]    _zz__zz_io_c_stream_payload_0_mantissa_4;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_mantissa_5;
  wire       [23:0]   _zz__zz_io_c_stream_payload_0_mantissa_6;
  wire       [3:0]    _zz__zz_io_c_stream_payload_0_mantissa_7;
  wire       [2:0]    _zz__zz_io_c_stream_payload_0_mantissa_8;
  wire       [3:0]    _zz__zz_io_c_stream_payload_0_mantissa_9;
  wire       [2:0]    _zz__zz_io_c_stream_payload_0_mantissa_10;
  reg        [63:0]   _zz_io_c_stream_payload_0_mantissa;
  reg        [0:0]    _zz_io_a_stream_ready;
  reg                 _zz_io_a_stream_ready_1;
  wire                io_c_stream_fire;
  wire       [31:0]   _zz_io_c_stream_payload_0_mantissa_1;
  wire       [7:0]    _zz_io_c_stream_payload_0_mantissa_2;
  wire       [7:0]    _zz_io_c_stream_payload_1_mantissa;
  wire       [7:0]    _zz_io_c_stream_payload_2_mantissa;
  wire       [7:0]    _zz_io_c_stream_payload_3_mantissa;
  wire                io_a_stream_fire;
  wire                when_repack_l55;

  assign _zz__zz_io_c_stream_payload_0_mantissa_1 = (_zz_io_a_stream_ready * 6'h20);
  assign _zz__zz_io_c_stream_payload_0_mantissa = io_a_stream_payload_5_exponent;
  assign _zz__zz_io_c_stream_payload_0_mantissa_2 = io_a_stream_payload_5_mantissa;
  assign _zz__zz_io_c_stream_payload_0_mantissa_3 = io_a_stream_payload_4_sign;
  assign _zz__zz_io_c_stream_payload_0_mantissa_4 = {io_a_stream_payload_4_exponent,io_a_stream_payload_4_mantissa};
  assign _zz__zz_io_c_stream_payload_0_mantissa_5 = {io_a_stream_payload_3_sign,{io_a_stream_payload_3_exponent,io_a_stream_payload_3_mantissa}};
  assign _zz__zz_io_c_stream_payload_0_mantissa_6 = {{io_a_stream_payload_2_sign,{io_a_stream_payload_2_exponent,io_a_stream_payload_2_mantissa}},{{io_a_stream_payload_1_sign,{_zz__zz_io_c_stream_payload_0_mantissa_7,_zz__zz_io_c_stream_payload_0_mantissa_8}},{io_a_stream_payload_0_sign,{_zz__zz_io_c_stream_payload_0_mantissa_9,_zz__zz_io_c_stream_payload_0_mantissa_10}}}};
  assign _zz__zz_io_c_stream_payload_0_mantissa_7 = io_a_stream_payload_1_exponent;
  assign _zz__zz_io_c_stream_payload_0_mantissa_8 = io_a_stream_payload_1_mantissa;
  assign _zz__zz_io_c_stream_payload_0_mantissa_9 = io_a_stream_payload_0_exponent;
  assign _zz__zz_io_c_stream_payload_0_mantissa_10 = io_a_stream_payload_0_mantissa;
  assign io_c_stream_fire = (io_c_stream_valid && io_c_stream_ready);
  assign io_a_stream_ready = ((! _zz_io_a_stream_ready_1) || (io_c_stream_fire && (_zz_io_a_stream_ready == 1'b1)));
  assign io_c_stream_valid = _zz_io_a_stream_ready_1;
  assign _zz_io_c_stream_payload_0_mantissa_1 = _zz_io_c_stream_payload_0_mantissa[_zz__zz_io_c_stream_payload_0_mantissa_1 +: 32];
  assign _zz_io_c_stream_payload_0_mantissa_2 = _zz_io_c_stream_payload_0_mantissa_1[7 : 0];
  assign io_c_stream_payload_0_mantissa = _zz_io_c_stream_payload_0_mantissa_2[2 : 0];
  assign io_c_stream_payload_0_exponent = _zz_io_c_stream_payload_0_mantissa_2[6 : 3];
  assign io_c_stream_payload_0_sign = _zz_io_c_stream_payload_0_mantissa_2[7];
  assign _zz_io_c_stream_payload_1_mantissa = _zz_io_c_stream_payload_0_mantissa_1[15 : 8];
  assign io_c_stream_payload_1_mantissa = _zz_io_c_stream_payload_1_mantissa[2 : 0];
  assign io_c_stream_payload_1_exponent = _zz_io_c_stream_payload_1_mantissa[6 : 3];
  assign io_c_stream_payload_1_sign = _zz_io_c_stream_payload_1_mantissa[7];
  assign _zz_io_c_stream_payload_2_mantissa = _zz_io_c_stream_payload_0_mantissa_1[23 : 16];
  assign io_c_stream_payload_2_mantissa = _zz_io_c_stream_payload_2_mantissa[2 : 0];
  assign io_c_stream_payload_2_exponent = _zz_io_c_stream_payload_2_mantissa[6 : 3];
  assign io_c_stream_payload_2_sign = _zz_io_c_stream_payload_2_mantissa[7];
  assign _zz_io_c_stream_payload_3_mantissa = _zz_io_c_stream_payload_0_mantissa_1[31 : 24];
  assign io_c_stream_payload_3_mantissa = _zz_io_c_stream_payload_3_mantissa[2 : 0];
  assign io_c_stream_payload_3_exponent = _zz_io_c_stream_payload_3_mantissa[6 : 3];
  assign io_c_stream_payload_3_sign = _zz_io_c_stream_payload_3_mantissa[7];
  assign io_a_stream_fire = (io_a_stream_valid && io_a_stream_ready);
  assign when_repack_l55 = (_zz_io_a_stream_ready == 1'b1);
  assign io_isEmpty = (! _zz_io_a_stream_ready_1);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_a_stream_ready <= 1'b0;
      _zz_io_a_stream_ready_1 <= 1'b0;
    end else begin
      if(io_a_stream_fire) begin
        _zz_io_a_stream_ready <= 1'b0;
        _zz_io_a_stream_ready_1 <= 1'b1;
      end else begin
        if(io_c_stream_fire) begin
          _zz_io_a_stream_ready <= (_zz_io_a_stream_ready + 1'b1);
          if(when_repack_l55) begin
            _zz_io_a_stream_ready_1 <= 1'b0;
          end
        end
      end
      if(io_reArm) begin
        _zz_io_a_stream_ready_1 <= 1'b0;
        _zz_io_a_stream_ready <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(io_a_stream_fire) begin
      _zz_io_c_stream_payload_0_mantissa <= {{io_a_stream_payload_7_sign,{io_a_stream_payload_7_exponent,io_a_stream_payload_7_mantissa}},{{io_a_stream_payload_6_sign,{io_a_stream_payload_6_exponent,io_a_stream_payload_6_mantissa}},{{io_a_stream_payload_5_sign,{_zz__zz_io_c_stream_payload_0_mantissa,_zz__zz_io_c_stream_payload_0_mantissa_2}},{{_zz__zz_io_c_stream_payload_0_mantissa_3,_zz__zz_io_c_stream_payload_0_mantissa_4},{_zz__zz_io_c_stream_payload_0_mantissa_5,_zz__zz_io_c_stream_payload_0_mantissa_6}}}}};
    end
  end


endmodule

module LineBuffer2D (
  input  wire          io_push_valid,
  input  wire [15:0]   io_push_payload,
  output wire          io_pop_valid,
  output wire [15:0]   io_pop_payload,
  input  wire          clk,
  input  wire          reset
);

  reg        [15:0]   mem_spinal_port1;
  wire       [5:0]    _zz_ptr_valueNext;
  wire       [0:0]    _zz_ptr_valueNext_1;
  wire       [5:0]    _zz_rdAddr;
  wire       [15:0]   _zz_mem_port;
  reg                 ptr_willIncrement;
  wire                ptr_willDecrement;
  wire                ptr_willClear;
  wire                ptr_willLoad;
  reg        [5:0]    ptr_valueNext;
  reg        [5:0]    ptr_value;
  wire                ptr_willOverflowIfInc;
  wire                ptr_willUnderflowIfDec;
  wire                ptr_willOverflow;
  wire                ptr_willUnderflow;
  wire       [5:0]    rdAddr;
  reg                 io_push_valid_regNext;
  reg [15:0] mem [0:47];

  assign _zz_ptr_valueNext_1 = ptr_willIncrement;
  assign _zz_ptr_valueNext = {5'd0, _zz_ptr_valueNext_1};
  assign _zz_rdAddr = (ptr_value + 6'h01);
  assign _zz_mem_port = io_push_payload;
  initial begin
    $readmemb("verilog/Mnist_w4a8_maxPool2DOp.bin",mem);
  end
  always @(posedge clk) begin
    if(io_push_valid) begin
      mem[ptr_value] <= _zz_mem_port;
    end
  end

  always @(posedge clk) begin
    if(io_push_valid) begin
      mem_spinal_port1 <= mem[rdAddr];
    end
  end

  always @(*) begin
    ptr_willIncrement = 1'b0;
    if(io_push_valid) begin
      ptr_willIncrement = 1'b1;
    end
  end

  assign ptr_willDecrement = 1'b0;
  assign ptr_willClear = 1'b0;
  assign ptr_willLoad = 1'b0;
  assign ptr_willOverflowIfInc = (ptr_value == 6'h2f);
  assign ptr_willUnderflowIfDec = (ptr_value == 6'h0);
  assign ptr_willOverflow = (ptr_willOverflowIfInc && ptr_willIncrement);
  always @(*) begin
    ptr_valueNext = (ptr_value + _zz_ptr_valueNext);
    if(ptr_willOverflow) begin
      ptr_valueNext = 6'h0;
    end
    if(ptr_willClear) begin
      ptr_valueNext = 6'h0;
    end
  end

  assign ptr_willUnderflow = (ptr_willUnderflowIfDec && ptr_willDecrement);
  assign rdAddr = ((ptr_value == 6'h2f) ? 6'h0 : _zz_rdAddr);
  assign io_pop_valid = io_push_valid_regNext;
  assign io_pop_payload = mem_spinal_port1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      ptr_value <= 6'h0;
      io_push_valid_regNext <= 1'b0;
    end else begin
      ptr_value <= ptr_valueNext;
      io_push_valid_regNext <= io_push_valid;
    end
  end


endmodule

module BiasAddOp (
  input  wire          io_a_stream_valid,
  output reg           io_a_stream_ready,
  input  wire [15:0]   io_a_stream_payload_0,
  input  wire          io_b_stream_valid,
  output reg           io_b_stream_ready,
  input  wire [15:0]   io_b_stream_payload_0,
  output reg           io_c_stream_valid,
  input  wire          io_c_stream_ready,
  output reg  [15:0]   io_c_stream_payload_0,
  input  wire          io_reArm,
  input  wire          clk,
  input  wire          reset
);
  localparam fsm_2_BOOT = 2'd0;
  localparam fsm_2_stateLoadBias = 2'd1;
  localparam fsm_2_stateProcess = 2'd2;
  localparam fsm_2_stateDone = 2'd3;

  wire       [10:0]   _zz_aCounter_valueNext;
  wire       [0:0]    _zz_aCounter_valueNext_1;
  reg        [15:0]   _zz_io_c_stream_payload_0;
  wire       [0:0]    _zz_io_c_stream_payload_0_1;
  wire       [1:0]    _zz_io_c_stream_payload_0_2;
  wire       [1:0]    _zz_io_c_stream_payload_0_3;
  wire       [1:0]    _zz_io_c_stream_payload_0_4;
  wire       [11:0]   _zz_io_c_stream_payload_0_5;
  reg        [15:0]   biasMem_0;
  reg        [15:0]   biasMem_1;
  reg                 loadCounter_willIncrement;
  wire                loadCounter_willDecrement;
  reg                 loadCounter_willClear;
  wire                loadCounter_willLoad;
  reg        [0:0]    loadCounter_valueNext;
  reg        [0:0]    loadCounter_value;
  wire                loadCounter_willOverflowIfInc;
  wire                loadCounter_willUnderflowIfDec;
  wire                loadCounter_willOverflow;
  wire                loadCounter_willUnderflow;
  reg                 aCounter_willIncrement;
  wire                aCounter_willDecrement;
  reg                 aCounter_willClear;
  wire                aCounter_willLoad;
  reg        [10:0]   aCounter_valueNext;
  reg        [10:0]   aCounter_value;
  wire                aCounter_willOverflowIfInc;
  wire                aCounter_willUnderflowIfDec;
  wire                aCounter_willOverflow;
  wire                aCounter_willUnderflow;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [1:0]    fsm_stateReg;
  reg        [1:0]    fsm_stateNext;
  wire       [1:0]    _zz_1;
  wire                io_a_stream_fire;
  `ifndef SYNTHESIS
  reg [103:0] fsm_stateReg_string;
  reg [103:0] fsm_stateNext_string;
  `endif


  assign _zz_aCounter_valueNext_1 = aCounter_willIncrement;
  assign _zz_aCounter_valueNext = {10'd0, _zz_aCounter_valueNext_1};
  assign _zz_io_c_stream_payload_0_2 = (_zz_io_c_stream_payload_0_3 % 2'b10);
  assign _zz_io_c_stream_payload_0_1 = _zz_io_c_stream_payload_0_2[0:0];
  assign _zz_io_c_stream_payload_0_3 = (_zz_io_c_stream_payload_0_4 + 2'b00);
  assign _zz_io_c_stream_payload_0_4 = (_zz_io_c_stream_payload_0_5 % 2'b10);
  assign _zz_io_c_stream_payload_0_5 = (aCounter_value * 1'b1);
  always @(*) begin
    case(_zz_io_c_stream_payload_0_1)
      1'b0 : _zz_io_c_stream_payload_0 = biasMem_0;
      default : _zz_io_c_stream_payload_0 = biasMem_1;
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_2_BOOT : fsm_stateReg_string = "BOOT         ";
      fsm_2_stateLoadBias : fsm_stateReg_string = "stateLoadBias";
      fsm_2_stateProcess : fsm_stateReg_string = "stateProcess ";
      fsm_2_stateDone : fsm_stateReg_string = "stateDone    ";
      default : fsm_stateReg_string = "?????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_2_BOOT : fsm_stateNext_string = "BOOT         ";
      fsm_2_stateLoadBias : fsm_stateNext_string = "stateLoadBias";
      fsm_2_stateProcess : fsm_stateNext_string = "stateProcess ";
      fsm_2_stateDone : fsm_stateNext_string = "stateDone    ";
      default : fsm_stateNext_string = "?????????????";
    endcase
  end
  `endif

  always @(*) begin
    loadCounter_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
        if(io_b_stream_valid) begin
          loadCounter_willIncrement = 1'b1;
        end
      end
      fsm_2_stateProcess : begin
      end
      fsm_2_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  assign loadCounter_willDecrement = 1'b0;
  always @(*) begin
    loadCounter_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
        if(io_reArm) begin
          loadCounter_willClear = 1'b1;
        end
      end
      fsm_2_stateProcess : begin
      end
      fsm_2_stateDone : begin
        loadCounter_willClear = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign loadCounter_willLoad = 1'b0;
  assign loadCounter_willOverflowIfInc = (loadCounter_value == 1'b1);
  assign loadCounter_willUnderflowIfDec = (loadCounter_value == 1'b0);
  assign loadCounter_willOverflow = (loadCounter_willOverflowIfInc && loadCounter_willIncrement);
  always @(*) begin
    loadCounter_valueNext = (loadCounter_value + loadCounter_willIncrement);
    if(loadCounter_willClear) begin
      loadCounter_valueNext = 1'b0;
    end
  end

  assign loadCounter_willUnderflow = (loadCounter_willUnderflowIfDec && loadCounter_willDecrement);
  always @(*) begin
    aCounter_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
      end
      fsm_2_stateProcess : begin
        if(io_a_stream_fire) begin
          aCounter_willIncrement = 1'b1;
        end
      end
      fsm_2_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  assign aCounter_willDecrement = 1'b0;
  always @(*) begin
    aCounter_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
      end
      fsm_2_stateProcess : begin
        if(io_reArm) begin
          aCounter_willClear = 1'b1;
        end
      end
      fsm_2_stateDone : begin
        aCounter_willClear = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign aCounter_willLoad = 1'b0;
  assign aCounter_willOverflowIfInc = (aCounter_value == 11'h47f);
  assign aCounter_willUnderflowIfDec = (aCounter_value == 11'h0);
  assign aCounter_willOverflow = (aCounter_willOverflowIfInc && aCounter_willIncrement);
  always @(*) begin
    aCounter_valueNext = (aCounter_value + _zz_aCounter_valueNext);
    if(aCounter_willOverflow) begin
      aCounter_valueNext = 11'h0;
    end
    if(aCounter_willClear) begin
      aCounter_valueNext = 11'h0;
    end
  end

  assign aCounter_willUnderflow = (aCounter_willUnderflowIfDec && aCounter_willDecrement);
  always @(*) begin
    io_a_stream_ready = 1'b0;
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
      end
      fsm_2_stateProcess : begin
        io_a_stream_ready = io_c_stream_ready;
      end
      fsm_2_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_b_stream_ready = 1'b0;
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
        io_b_stream_ready = 1'b1;
      end
      fsm_2_stateProcess : begin
      end
      fsm_2_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_c_stream_valid = 1'b0;
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
      end
      fsm_2_stateProcess : begin
        io_c_stream_valid = io_a_stream_valid;
      end
      fsm_2_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_c_stream_payload_0 = 16'h0;
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
      end
      fsm_2_stateProcess : begin
        io_c_stream_payload_0 = ($signed(io_a_stream_payload_0) + $signed(_zz_io_c_stream_payload_0));
      end
      fsm_2_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
      end
      fsm_2_stateProcess : begin
      end
      fsm_2_stateDone : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_2_stateLoadBias : begin
        if(io_b_stream_valid) begin
          if(loadCounter_willOverflowIfInc) begin
            fsm_stateNext = fsm_2_stateProcess;
          end
        end
      end
      fsm_2_stateProcess : begin
        if(io_a_stream_fire) begin
          if(aCounter_willOverflowIfInc) begin
            fsm_stateNext = fsm_2_stateDone;
          end
        end
        if(io_reArm) begin
          fsm_stateNext = fsm_2_stateLoadBias;
        end
      end
      fsm_2_stateDone : begin
        fsm_stateNext = fsm_2_stateLoadBias;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_2_stateLoadBias;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_2_BOOT;
    end
  end

  assign _zz_1 = ({1'd0,1'b1} <<< loadCounter_value);
  assign io_a_stream_fire = (io_a_stream_valid && io_a_stream_ready);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      biasMem_0 <= 16'h0;
      biasMem_1 <= 16'h0;
      loadCounter_value <= 1'b0;
      aCounter_value <= 11'h0;
      fsm_stateReg <= fsm_2_BOOT;
    end else begin
      loadCounter_value <= loadCounter_valueNext;
      aCounter_value <= aCounter_valueNext;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_2_stateLoadBias : begin
          if(io_b_stream_valid) begin
            if(_zz_1[0]) begin
              biasMem_0 <= io_b_stream_payload_0;
            end
            if(_zz_1[1]) begin
              biasMem_1 <= io_b_stream_payload_0;
            end
          end
        end
        fsm_2_stateProcess : begin
        end
        fsm_2_stateDone : begin
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module MatmulOp (
  input  wire          io_a_stream_valid,
  output reg           io_a_stream_ready,
  input  wire [7:0]    io_a_stream_payload_0,
  input  wire [7:0]    io_a_stream_payload_1,
  input  wire [7:0]    io_a_stream_payload_2,
  input  wire [7:0]    io_a_stream_payload_3,
  input  wire [7:0]    io_a_stream_payload_4,
  input  wire [7:0]    io_a_stream_payload_5,
  input  wire [7:0]    io_a_stream_payload_6,
  input  wire [7:0]    io_a_stream_payload_7,
  input  wire [7:0]    io_a_stream_payload_8,
  input  wire [7:0]    io_a_stream_payload_9,
  input  wire [7:0]    io_a_stream_payload_10,
  input  wire [7:0]    io_a_stream_payload_11,
  input  wire [7:0]    io_a_stream_payload_12,
  input  wire [7:0]    io_a_stream_payload_13,
  input  wire [7:0]    io_a_stream_payload_14,
  input  wire [7:0]    io_a_stream_payload_15,
  input  wire [7:0]    io_a_stream_payload_16,
  input  wire [7:0]    io_a_stream_payload_17,
  input  wire [7:0]    io_a_stream_payload_18,
  input  wire [7:0]    io_a_stream_payload_19,
  input  wire [7:0]    io_a_stream_payload_20,
  input  wire [7:0]    io_a_stream_payload_21,
  input  wire [7:0]    io_a_stream_payload_22,
  input  wire [7:0]    io_a_stream_payload_23,
  input  wire [7:0]    io_a_stream_payload_24,
  input  wire          io_b_stream_valid,
  output wire          io_b_stream_ready,
  input  wire [7:0]    io_b_stream_payload_0,
  input  wire [7:0]    io_b_stream_payload_1,
  input  wire [7:0]    io_b_stream_payload_2,
  input  wire [7:0]    io_b_stream_payload_3,
  input  wire [7:0]    io_b_stream_payload_4,
  input  wire [7:0]    io_b_stream_payload_5,
  input  wire [7:0]    io_b_stream_payload_6,
  input  wire [7:0]    io_b_stream_payload_7,
  input  wire [7:0]    io_b_stream_payload_8,
  input  wire [7:0]    io_b_stream_payload_9,
  input  wire [7:0]    io_b_stream_payload_10,
  input  wire [7:0]    io_b_stream_payload_11,
  input  wire [7:0]    io_b_stream_payload_12,
  input  wire [7:0]    io_b_stream_payload_13,
  input  wire [7:0]    io_b_stream_payload_14,
  input  wire [7:0]    io_b_stream_payload_15,
  input  wire [7:0]    io_b_stream_payload_16,
  input  wire [7:0]    io_b_stream_payload_17,
  input  wire [7:0]    io_b_stream_payload_18,
  input  wire [7:0]    io_b_stream_payload_19,
  input  wire [7:0]    io_b_stream_payload_20,
  input  wire [7:0]    io_b_stream_payload_21,
  input  wire [7:0]    io_b_stream_payload_22,
  input  wire [7:0]    io_b_stream_payload_23,
  input  wire [7:0]    io_b_stream_payload_24,
  output reg           io_c_stream_valid,
  input  wire          io_c_stream_ready,
  output reg  [15:0]   io_c_stream_payload_0,
  input  wire          io_reArm,
  input  wire          clk,
  input  wire          reset
);
  localparam StateMachineEnum_ = 3'd0;
  localparam StateMachineEnum__1 = 3'd1;
  localparam StateMachineEnum__2 = 3'd2;
  localparam StateMachineEnum__3 = 3'd3;
  localparam StateMachineEnum__4 = 3'd4;
  localparam StateMachineEnum__5 = 3'd5;

  wire       [0:0]    streamDoubleBuffer_7_io_readAddr;
  reg                 streamDoubleBuffer_7_io_nextTile;
  wire                streamDoubleBuffer_7_io_streamIn_ready;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_0;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_1;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_2;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_3;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_4;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_5;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_6;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_7;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_8;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_9;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_10;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_11;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_12;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_13;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_14;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_15;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_16;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_17;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_18;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_19;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_20;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_21;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_22;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_23;
  wire       [7:0]    streamDoubleBuffer_7_io_readData_24;
  wire                streamDoubleBuffer_7_io_tileReady;
  wire                streamDoubleBuffer_7_io_loadCanAccept;
  wire                streamDoubleBuffer_7_io_tileFilled;
  wire                streamDoubleBuffer_7_io_refreshSettled;
  wire       [9:0]    _zz_rowCounter_valueNext;
  wire       [0:0]    _zz_rowCounter_valueNext_1;
  wire       [10:0]   _zz_outCounter_valueNext;
  wire       [0:0]    _zz_outCounter_valueNext_1;
  wire       [1:0]    _zz_io_readAddr;
  wire       [1:0]    _zz_io_readAddr_1;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_1;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_2;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_3;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_4;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_5;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_6;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_7;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_8;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_9;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_10;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_11;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_12;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_13;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_14;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_15;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_16;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_17;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_18;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_19;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_20;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_21;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_22;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_23;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_24;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_25;
  wire       [6:0]    _zz__zz_io_c_stream_payload_0_85;
  wire       [6:0]    _zz__zz_io_c_stream_payload_0_85_1;
  wire       [4:0]    _zz__zz_io_c_stream_payload_0_85_2;
  wire       [6:0]    _zz__zz_io_c_stream_payload_0_85_3;
  wire       [1:0]    _zz__zz_io_c_stream_payload_0_85_4;
  reg        [15:0]   _zz__zz_io_c_stream_payload_0_86;
  wire       [2:0]    _zz__zz_5;
  wire       [0:0]    _zz__zz_5_1;
  wire                _zz_when;
  reg        [15:0]   _zz_io_c_stream_payload_0_94;
  wire       [4:0]    _zz_io_c_stream_payload_0_95;
  wire       [6:0]    _zz_io_c_stream_payload_0_96;
  wire       [6:0]    _zz_io_c_stream_payload_0_97;
  wire       [4:0]    _zz_io_c_stream_payload_0_98;
  wire       [6:0]    _zz_io_c_stream_payload_0_99;
  wire       [1:0]    _zz_io_c_stream_payload_0_100;
  wire       [4:0]    _zz__zz_10;
  wire       [6:0]    _zz__zz_10_1;
  wire       [6:0]    _zz__zz_10_2;
  wire       [4:0]    _zz__zz_10_3;
  wire       [6:0]    _zz__zz_10_4;
  wire       [1:0]    _zz__zz_10_5;
  wire       [7:0]    _zz__zz_io_c_stream_payload_0_93;
  wire       [71:0]   _zz__zz_io_c_stream_payload_0_93_1;
  reg                 when_Phase_l774;
  wire       [15:0]   accumulators_0;
  wire       [15:0]   accumulators_1;
  wire       [15:0]   accumulators_2;
  wire       [15:0]   accumulators_3;
  wire       [15:0]   accumulators_4;
  wire       [15:0]   accumulators_5;
  wire       [15:0]   accumulators_6;
  wire       [15:0]   accumulators_7;
  wire       [15:0]   accumulators_8;
  wire       [15:0]   accumulators_9;
  wire       [15:0]   accumulators_10;
  wire       [15:0]   accumulators_11;
  wire       [15:0]   accumulators_12;
  wire       [15:0]   accumulators_13;
  wire       [15:0]   accumulators_14;
  wire       [15:0]   accumulators_15;
  wire       [15:0]   accumulators_16;
  wire       [15:0]   accumulators_17;
  wire       [15:0]   accumulators_18;
  wire       [15:0]   accumulators_19;
  wire       [15:0]   accumulators_20;
  wire       [15:0]   accumulators_21;
  wire       [15:0]   accumulators_22;
  wire       [15:0]   accumulators_23;
  wire       [15:0]   accumulators_24;
  wire       [15:0]   accumulators_25;
  wire       [15:0]   accumulators_26;
  wire       [15:0]   accumulators_27;
  wire       [15:0]   accumulators_28;
  wire       [15:0]   accumulators_29;
  wire       [15:0]   accumulators_30;
  wire       [15:0]   accumulators_31;
  wire       [15:0]   accumulators_32;
  wire       [15:0]   accumulators_33;
  wire       [15:0]   accumulators_34;
  wire       [15:0]   accumulators_35;
  wire       [15:0]   accumulators_36;
  wire       [15:0]   accumulators_37;
  wire       [15:0]   accumulators_38;
  wire       [15:0]   accumulators_39;
  wire       [15:0]   accumulators_40;
  wire       [15:0]   accumulators_41;
  wire       [15:0]   accumulators_42;
  wire       [15:0]   accumulators_43;
  wire       [15:0]   accumulators_44;
  wire       [15:0]   accumulators_45;
  wire       [15:0]   accumulators_46;
  wire       [15:0]   accumulators_47;
  wire       [15:0]   accumulators_48;
  wire       [15:0]   accumulators_49;
  wire       [15:0]   accumulators_50;
  wire       [15:0]   accumulators_51;
  wire       [15:0]   accumulators_52;
  wire       [15:0]   accumulators_53;
  wire       [15:0]   accumulators_54;
  wire       [15:0]   accumulators_55;
  wire       [15:0]   accumulators_56;
  wire       [15:0]   accumulators_57;
  wire       [15:0]   accumulators_58;
  wire       [15:0]   accumulators_59;
  wire       [15:0]   accumulators_60;
  wire       [15:0]   accumulators_61;
  wire       [15:0]   accumulators_62;
  wire       [15:0]   accumulators_63;
  wire       [15:0]   accumulators_64;
  wire       [15:0]   accumulators_65;
  wire       [15:0]   accumulators_66;
  wire       [15:0]   accumulators_67;
  wire       [15:0]   accumulators_68;
  wire       [15:0]   accumulators_69;
  wire       [15:0]   accumulators_70;
  wire       [15:0]   accumulators_71;
  wire       [15:0]   accumulators_72;
  wire       [15:0]   accumulators_73;
  wire       [15:0]   accumulators_74;
  wire       [15:0]   accumulators_75;
  wire       [15:0]   accumulators_76;
  wire       [15:0]   accumulators_77;
  wire       [15:0]   accumulators_78;
  wire       [15:0]   accumulators_79;
  wire       [15:0]   accumulators_80;
  wire       [15:0]   accumulators_81;
  wire       [15:0]   accumulators_82;
  wire       [15:0]   accumulators_83;
  wire       [15:0]   accumulators_84;
  wire       [15:0]   accumulators_85;
  wire       [15:0]   accumulators_86;
  wire       [15:0]   accumulators_87;
  wire       [15:0]   accumulators_88;
  wire       [15:0]   accumulators_89;
  wire       [15:0]   accumulators_90;
  wire       [15:0]   accumulators_91;
  wire       [15:0]   accumulators_92;
  wire       [15:0]   accumulators_93;
  wire       [15:0]   accumulators_94;
  wire       [15:0]   accumulators_95;
  wire       [15:0]   accumulators_96;
  wire       [15:0]   accumulators_97;
  wire       [15:0]   accumulators_98;
  wire       [15:0]   accumulators_99;
  wire       [15:0]   accumulators_100;
  wire       [15:0]   accumulators_101;
  wire       [15:0]   accumulators_102;
  wire       [15:0]   accumulators_103;
  wire       [15:0]   accumulators_104;
  wire       [15:0]   accumulators_105;
  wire       [15:0]   accumulators_106;
  wire       [15:0]   accumulators_107;
  wire       [15:0]   accumulators_108;
  wire       [15:0]   accumulators_109;
  wire       [15:0]   accumulators_110;
  wire       [15:0]   accumulators_111;
  wire       [15:0]   accumulators_112;
  wire       [15:0]   accumulators_113;
  wire       [15:0]   accumulators_114;
  wire       [15:0]   accumulators_115;
  wire       [15:0]   accumulators_116;
  wire       [15:0]   accumulators_117;
  wire       [15:0]   accumulators_118;
  wire       [15:0]   accumulators_119;
  wire       [15:0]   accumulators_120;
  wire       [15:0]   accumulators_121;
  wire       [15:0]   accumulators_122;
  wire       [15:0]   accumulators_123;
  wire       [15:0]   accumulators_124;
  wire       [15:0]   accumulators_125;
  wire       [15:0]   accumulators_126;
  wire       [15:0]   accumulators_127;
  wire       [15:0]   accumulators_128;
  wire       [15:0]   accumulators_129;
  wire       [15:0]   accumulators_130;
  wire       [15:0]   accumulators_131;
  wire       [15:0]   accumulators_132;
  wire       [15:0]   accumulators_133;
  wire       [15:0]   accumulators_134;
  wire       [15:0]   accumulators_135;
  wire       [15:0]   accumulators_136;
  wire       [15:0]   accumulators_137;
  wire       [15:0]   accumulators_138;
  wire       [15:0]   accumulators_139;
  wire       [15:0]   accumulators_140;
  wire       [15:0]   accumulators_141;
  wire       [15:0]   accumulators_142;
  wire       [15:0]   accumulators_143;
  wire       [15:0]   accumulators_144;
  wire       [15:0]   accumulators_145;
  wire       [15:0]   accumulators_146;
  wire       [15:0]   accumulators_147;
  wire       [15:0]   accumulators_148;
  wire       [15:0]   accumulators_149;
  wire       [15:0]   accumulators_150;
  wire       [15:0]   accumulators_151;
  wire       [15:0]   accumulators_152;
  wire       [15:0]   accumulators_153;
  wire       [15:0]   accumulators_154;
  wire       [15:0]   accumulators_155;
  wire       [15:0]   accumulators_156;
  wire       [15:0]   accumulators_157;
  wire       [15:0]   accumulators_158;
  wire       [15:0]   accumulators_159;
  wire       [15:0]   accumulators_160;
  wire       [15:0]   accumulators_161;
  wire       [15:0]   accumulators_162;
  wire       [15:0]   accumulators_163;
  wire       [15:0]   accumulators_164;
  wire       [15:0]   accumulators_165;
  wire       [15:0]   accumulators_166;
  wire       [15:0]   accumulators_167;
  wire       [15:0]   accumulators_168;
  wire       [15:0]   accumulators_169;
  wire       [15:0]   accumulators_170;
  wire       [15:0]   accumulators_171;
  wire       [15:0]   accumulators_172;
  wire       [15:0]   accumulators_173;
  wire       [15:0]   accumulators_174;
  wire       [15:0]   accumulators_175;
  wire       [15:0]   accumulators_176;
  wire       [15:0]   accumulators_177;
  wire       [15:0]   accumulators_178;
  wire       [15:0]   accumulators_179;
  wire       [15:0]   accumulators_180;
  wire       [15:0]   accumulators_181;
  wire       [15:0]   accumulators_182;
  wire       [15:0]   accumulators_183;
  wire       [15:0]   accumulators_184;
  wire       [15:0]   accumulators_185;
  wire       [15:0]   accumulators_186;
  wire       [15:0]   accumulators_187;
  wire       [15:0]   accumulators_188;
  wire       [15:0]   accumulators_189;
  wire       [15:0]   accumulators_190;
  wire       [15:0]   accumulators_191;
  wire       [15:0]   accumulators_192;
  wire       [15:0]   accumulators_193;
  wire       [15:0]   accumulators_194;
  wire       [15:0]   accumulators_195;
  wire       [15:0]   accumulators_196;
  wire       [15:0]   accumulators_197;
  wire       [15:0]   accumulators_198;
  wire       [15:0]   accumulators_199;
  wire       [15:0]   accumulators_200;
  wire       [15:0]   accumulators_201;
  wire       [15:0]   accumulators_202;
  wire       [15:0]   accumulators_203;
  wire       [15:0]   accumulators_204;
  wire       [15:0]   accumulators_205;
  wire       [15:0]   accumulators_206;
  wire       [15:0]   accumulators_207;
  wire       [15:0]   accumulators_208;
  wire       [15:0]   accumulators_209;
  wire       [15:0]   accumulators_210;
  wire       [15:0]   accumulators_211;
  wire       [15:0]   accumulators_212;
  wire       [15:0]   accumulators_213;
  wire       [15:0]   accumulators_214;
  wire       [15:0]   accumulators_215;
  wire       [15:0]   accumulators_216;
  wire       [15:0]   accumulators_217;
  wire       [15:0]   accumulators_218;
  wire       [15:0]   accumulators_219;
  wire       [15:0]   accumulators_220;
  wire       [15:0]   accumulators_221;
  wire       [15:0]   accumulators_222;
  wire       [15:0]   accumulators_223;
  wire       [15:0]   accumulators_224;
  wire       [15:0]   accumulators_225;
  wire       [15:0]   accumulators_226;
  wire       [15:0]   accumulators_227;
  wire       [15:0]   accumulators_228;
  wire       [15:0]   accumulators_229;
  wire       [15:0]   accumulators_230;
  wire       [15:0]   accumulators_231;
  wire       [15:0]   accumulators_232;
  wire       [15:0]   accumulators_233;
  wire       [15:0]   accumulators_234;
  wire       [15:0]   accumulators_235;
  wire       [15:0]   accumulators_236;
  wire       [15:0]   accumulators_237;
  wire       [15:0]   accumulators_238;
  wire       [15:0]   accumulators_239;
  wire       [15:0]   accumulators_240;
  wire       [15:0]   accumulators_241;
  wire       [15:0]   accumulators_242;
  wire       [15:0]   accumulators_243;
  wire       [15:0]   accumulators_244;
  wire       [15:0]   accumulators_245;
  wire       [15:0]   accumulators_246;
  wire       [15:0]   accumulators_247;
  wire       [15:0]   accumulators_248;
  wire       [15:0]   accumulators_249;
  wire       [15:0]   accumulators_250;
  wire       [15:0]   accumulators_251;
  wire       [15:0]   accumulators_252;
  wire       [15:0]   accumulators_253;
  wire       [15:0]   accumulators_254;
  wire       [15:0]   accumulators_255;
  wire       [15:0]   accumulators_256;
  wire       [15:0]   accumulators_257;
  wire       [15:0]   accumulators_258;
  wire       [15:0]   accumulators_259;
  wire       [15:0]   accumulators_260;
  wire       [15:0]   accumulators_261;
  wire       [15:0]   accumulators_262;
  wire       [15:0]   accumulators_263;
  wire       [15:0]   accumulators_264;
  wire       [15:0]   accumulators_265;
  wire       [15:0]   accumulators_266;
  wire       [15:0]   accumulators_267;
  wire       [15:0]   accumulators_268;
  wire       [15:0]   accumulators_269;
  wire       [15:0]   accumulators_270;
  wire       [15:0]   accumulators_271;
  wire       [15:0]   accumulators_272;
  wire       [15:0]   accumulators_273;
  wire       [15:0]   accumulators_274;
  wire       [15:0]   accumulators_275;
  wire       [15:0]   accumulators_276;
  wire       [15:0]   accumulators_277;
  wire       [15:0]   accumulators_278;
  wire       [15:0]   accumulators_279;
  wire       [15:0]   accumulators_280;
  wire       [15:0]   accumulators_281;
  wire       [15:0]   accumulators_282;
  wire       [15:0]   accumulators_283;
  wire       [15:0]   accumulators_284;
  wire       [15:0]   accumulators_285;
  wire       [15:0]   accumulators_286;
  wire       [15:0]   accumulators_287;
  wire       [15:0]   accumulators_288;
  wire       [15:0]   accumulators_289;
  wire       [15:0]   accumulators_290;
  wire       [15:0]   accumulators_291;
  wire       [15:0]   accumulators_292;
  wire       [15:0]   accumulators_293;
  wire       [15:0]   accumulators_294;
  wire       [15:0]   accumulators_295;
  wire       [15:0]   accumulators_296;
  wire       [15:0]   accumulators_297;
  wire       [15:0]   accumulators_298;
  wire       [15:0]   accumulators_299;
  wire       [15:0]   accumulators_300;
  wire       [15:0]   accumulators_301;
  wire       [15:0]   accumulators_302;
  wire       [15:0]   accumulators_303;
  wire       [15:0]   accumulators_304;
  wire       [15:0]   accumulators_305;
  wire       [15:0]   accumulators_306;
  wire       [15:0]   accumulators_307;
  wire       [15:0]   accumulators_308;
  wire       [15:0]   accumulators_309;
  wire       [15:0]   accumulators_310;
  wire       [15:0]   accumulators_311;
  wire       [15:0]   accumulators_312;
  wire       [15:0]   accumulators_313;
  wire       [15:0]   accumulators_314;
  wire       [15:0]   accumulators_315;
  wire       [15:0]   accumulators_316;
  wire       [15:0]   accumulators_317;
  wire       [15:0]   accumulators_318;
  wire       [15:0]   accumulators_319;
  wire       [15:0]   accumulators_320;
  wire       [15:0]   accumulators_321;
  wire       [15:0]   accumulators_322;
  wire       [15:0]   accumulators_323;
  wire       [15:0]   accumulators_324;
  wire       [15:0]   accumulators_325;
  wire       [15:0]   accumulators_326;
  wire       [15:0]   accumulators_327;
  wire       [15:0]   accumulators_328;
  wire       [15:0]   accumulators_329;
  wire       [15:0]   accumulators_330;
  wire       [15:0]   accumulators_331;
  wire       [15:0]   accumulators_332;
  wire       [15:0]   accumulators_333;
  wire       [15:0]   accumulators_334;
  wire       [15:0]   accumulators_335;
  wire       [15:0]   accumulators_336;
  wire       [15:0]   accumulators_337;
  wire       [15:0]   accumulators_338;
  wire       [15:0]   accumulators_339;
  wire       [15:0]   accumulators_340;
  wire       [15:0]   accumulators_341;
  wire       [15:0]   accumulators_342;
  wire       [15:0]   accumulators_343;
  wire       [15:0]   accumulators_344;
  wire       [15:0]   accumulators_345;
  wire       [15:0]   accumulators_346;
  wire       [15:0]   accumulators_347;
  wire       [15:0]   accumulators_348;
  wire       [15:0]   accumulators_349;
  wire       [15:0]   accumulators_350;
  wire       [15:0]   accumulators_351;
  wire       [15:0]   accumulators_352;
  wire       [15:0]   accumulators_353;
  wire       [15:0]   accumulators_354;
  wire       [15:0]   accumulators_355;
  wire       [15:0]   accumulators_356;
  wire       [15:0]   accumulators_357;
  wire       [15:0]   accumulators_358;
  wire       [15:0]   accumulators_359;
  wire       [15:0]   accumulators_360;
  wire       [15:0]   accumulators_361;
  wire       [15:0]   accumulators_362;
  wire       [15:0]   accumulators_363;
  wire       [15:0]   accumulators_364;
  wire       [15:0]   accumulators_365;
  wire       [15:0]   accumulators_366;
  wire       [15:0]   accumulators_367;
  wire       [15:0]   accumulators_368;
  wire       [15:0]   accumulators_369;
  wire       [15:0]   accumulators_370;
  wire       [15:0]   accumulators_371;
  wire       [15:0]   accumulators_372;
  wire       [15:0]   accumulators_373;
  wire       [15:0]   accumulators_374;
  wire       [15:0]   accumulators_375;
  wire       [15:0]   accumulators_376;
  wire       [15:0]   accumulators_377;
  wire       [15:0]   accumulators_378;
  wire       [15:0]   accumulators_379;
  wire       [15:0]   accumulators_380;
  wire       [15:0]   accumulators_381;
  wire       [15:0]   accumulators_382;
  wire       [15:0]   accumulators_383;
  wire       [15:0]   accumulators_384;
  wire       [15:0]   accumulators_385;
  wire       [15:0]   accumulators_386;
  wire       [15:0]   accumulators_387;
  wire       [15:0]   accumulators_388;
  wire       [15:0]   accumulators_389;
  wire       [15:0]   accumulators_390;
  wire       [15:0]   accumulators_391;
  wire       [15:0]   accumulators_392;
  wire       [15:0]   accumulators_393;
  wire       [15:0]   accumulators_394;
  wire       [15:0]   accumulators_395;
  wire       [15:0]   accumulators_396;
  wire       [15:0]   accumulators_397;
  wire       [15:0]   accumulators_398;
  wire       [15:0]   accumulators_399;
  wire       [15:0]   accumulators_400;
  wire       [15:0]   accumulators_401;
  wire       [15:0]   accumulators_402;
  wire       [15:0]   accumulators_403;
  wire       [15:0]   accumulators_404;
  wire       [15:0]   accumulators_405;
  wire       [15:0]   accumulators_406;
  wire       [15:0]   accumulators_407;
  wire       [15:0]   accumulators_408;
  wire       [15:0]   accumulators_409;
  wire       [15:0]   accumulators_410;
  wire       [15:0]   accumulators_411;
  wire       [15:0]   accumulators_412;
  wire       [15:0]   accumulators_413;
  wire       [15:0]   accumulators_414;
  wire       [15:0]   accumulators_415;
  wire       [15:0]   accumulators_416;
  wire       [15:0]   accumulators_417;
  wire       [15:0]   accumulators_418;
  wire       [15:0]   accumulators_419;
  wire       [15:0]   accumulators_420;
  wire       [15:0]   accumulators_421;
  wire       [15:0]   accumulators_422;
  wire       [15:0]   accumulators_423;
  wire       [15:0]   accumulators_424;
  wire       [15:0]   accumulators_425;
  wire       [15:0]   accumulators_426;
  wire       [15:0]   accumulators_427;
  wire       [15:0]   accumulators_428;
  wire       [15:0]   accumulators_429;
  wire       [15:0]   accumulators_430;
  wire       [15:0]   accumulators_431;
  wire       [15:0]   accumulators_432;
  wire       [15:0]   accumulators_433;
  wire       [15:0]   accumulators_434;
  wire       [15:0]   accumulators_435;
  wire       [15:0]   accumulators_436;
  wire       [15:0]   accumulators_437;
  wire       [15:0]   accumulators_438;
  wire       [15:0]   accumulators_439;
  wire       [15:0]   accumulators_440;
  wire       [15:0]   accumulators_441;
  wire       [15:0]   accumulators_442;
  wire       [15:0]   accumulators_443;
  wire       [15:0]   accumulators_444;
  wire       [15:0]   accumulators_445;
  wire       [15:0]   accumulators_446;
  wire       [15:0]   accumulators_447;
  wire       [15:0]   accumulators_448;
  wire       [15:0]   accumulators_449;
  wire       [15:0]   accumulators_450;
  wire       [15:0]   accumulators_451;
  wire       [15:0]   accumulators_452;
  wire       [15:0]   accumulators_453;
  wire       [15:0]   accumulators_454;
  wire       [15:0]   accumulators_455;
  wire       [15:0]   accumulators_456;
  wire       [15:0]   accumulators_457;
  wire       [15:0]   accumulators_458;
  wire       [15:0]   accumulators_459;
  wire       [15:0]   accumulators_460;
  wire       [15:0]   accumulators_461;
  wire       [15:0]   accumulators_462;
  wire       [15:0]   accumulators_463;
  wire       [15:0]   accumulators_464;
  wire       [15:0]   accumulators_465;
  wire       [15:0]   accumulators_466;
  wire       [15:0]   accumulators_467;
  wire       [15:0]   accumulators_468;
  wire       [15:0]   accumulators_469;
  wire       [15:0]   accumulators_470;
  wire       [15:0]   accumulators_471;
  wire       [15:0]   accumulators_472;
  wire       [15:0]   accumulators_473;
  wire       [15:0]   accumulators_474;
  wire       [15:0]   accumulators_475;
  wire       [15:0]   accumulators_476;
  wire       [15:0]   accumulators_477;
  wire       [15:0]   accumulators_478;
  wire       [15:0]   accumulators_479;
  wire       [15:0]   accumulators_480;
  wire       [15:0]   accumulators_481;
  wire       [15:0]   accumulators_482;
  wire       [15:0]   accumulators_483;
  wire       [15:0]   accumulators_484;
  wire       [15:0]   accumulators_485;
  wire       [15:0]   accumulators_486;
  wire       [15:0]   accumulators_487;
  wire       [15:0]   accumulators_488;
  wire       [15:0]   accumulators_489;
  wire       [15:0]   accumulators_490;
  wire       [15:0]   accumulators_491;
  wire       [15:0]   accumulators_492;
  wire       [15:0]   accumulators_493;
  wire       [15:0]   accumulators_494;
  wire       [15:0]   accumulators_495;
  wire       [15:0]   accumulators_496;
  wire       [15:0]   accumulators_497;
  wire       [15:0]   accumulators_498;
  wire       [15:0]   accumulators_499;
  wire       [15:0]   accumulators_500;
  wire       [15:0]   accumulators_501;
  wire       [15:0]   accumulators_502;
  wire       [15:0]   accumulators_503;
  wire       [15:0]   accumulators_504;
  wire       [15:0]   accumulators_505;
  wire       [15:0]   accumulators_506;
  wire       [15:0]   accumulators_507;
  wire       [15:0]   accumulators_508;
  wire       [15:0]   accumulators_509;
  wire       [15:0]   accumulators_510;
  wire       [15:0]   accumulators_511;
  wire       [15:0]   accumulators_512;
  wire       [15:0]   accumulators_513;
  wire       [15:0]   accumulators_514;
  wire       [15:0]   accumulators_515;
  wire       [15:0]   accumulators_516;
  wire       [15:0]   accumulators_517;
  wire       [15:0]   accumulators_518;
  wire       [15:0]   accumulators_519;
  wire       [15:0]   accumulators_520;
  wire       [15:0]   accumulators_521;
  wire       [15:0]   accumulators_522;
  wire       [15:0]   accumulators_523;
  wire       [15:0]   accumulators_524;
  wire       [15:0]   accumulators_525;
  wire       [15:0]   accumulators_526;
  wire       [15:0]   accumulators_527;
  wire       [15:0]   accumulators_528;
  wire       [15:0]   accumulators_529;
  wire       [15:0]   accumulators_530;
  wire       [15:0]   accumulators_531;
  wire       [15:0]   accumulators_532;
  wire       [15:0]   accumulators_533;
  wire       [15:0]   accumulators_534;
  wire       [15:0]   accumulators_535;
  wire       [15:0]   accumulators_536;
  wire       [15:0]   accumulators_537;
  wire       [15:0]   accumulators_538;
  wire       [15:0]   accumulators_539;
  wire       [15:0]   accumulators_540;
  wire       [15:0]   accumulators_541;
  wire       [15:0]   accumulators_542;
  wire       [15:0]   accumulators_543;
  wire       [15:0]   accumulators_544;
  wire       [15:0]   accumulators_545;
  wire       [15:0]   accumulators_546;
  wire       [15:0]   accumulators_547;
  wire       [15:0]   accumulators_548;
  wire       [15:0]   accumulators_549;
  wire       [15:0]   accumulators_550;
  wire       [15:0]   accumulators_551;
  wire       [15:0]   accumulators_552;
  wire       [15:0]   accumulators_553;
  wire       [15:0]   accumulators_554;
  wire       [15:0]   accumulators_555;
  wire       [15:0]   accumulators_556;
  wire       [15:0]   accumulators_557;
  wire       [15:0]   accumulators_558;
  wire       [15:0]   accumulators_559;
  wire       [15:0]   accumulators_560;
  wire       [15:0]   accumulators_561;
  wire       [15:0]   accumulators_562;
  wire       [15:0]   accumulators_563;
  wire       [15:0]   accumulators_564;
  wire       [15:0]   accumulators_565;
  wire       [15:0]   accumulators_566;
  wire       [15:0]   accumulators_567;
  wire       [15:0]   accumulators_568;
  wire       [15:0]   accumulators_569;
  wire       [15:0]   accumulators_570;
  wire       [15:0]   accumulators_571;
  wire       [15:0]   accumulators_572;
  wire       [15:0]   accumulators_573;
  wire       [15:0]   accumulators_574;
  wire       [15:0]   accumulators_575;
  wire       [15:0]   accumulators_576;
  wire       [15:0]   accumulators_577;
  wire       [15:0]   accumulators_578;
  wire       [15:0]   accumulators_579;
  wire       [15:0]   accumulators_580;
  wire       [15:0]   accumulators_581;
  wire       [15:0]   accumulators_582;
  wire       [15:0]   accumulators_583;
  wire       [15:0]   accumulators_584;
  wire       [15:0]   accumulators_585;
  wire       [15:0]   accumulators_586;
  wire       [15:0]   accumulators_587;
  wire       [15:0]   accumulators_588;
  wire       [15:0]   accumulators_589;
  wire       [15:0]   accumulators_590;
  wire       [15:0]   accumulators_591;
  wire       [15:0]   accumulators_592;
  wire       [15:0]   accumulators_593;
  wire       [15:0]   accumulators_594;
  wire       [15:0]   accumulators_595;
  wire       [15:0]   accumulators_596;
  wire       [15:0]   accumulators_597;
  wire       [15:0]   accumulators_598;
  wire       [15:0]   accumulators_599;
  wire       [15:0]   accumulators_600;
  wire       [15:0]   accumulators_601;
  wire       [15:0]   accumulators_602;
  wire       [15:0]   accumulators_603;
  wire       [15:0]   accumulators_604;
  wire       [15:0]   accumulators_605;
  wire       [15:0]   accumulators_606;
  wire       [15:0]   accumulators_607;
  wire       [15:0]   accumulators_608;
  wire       [15:0]   accumulators_609;
  wire       [15:0]   accumulators_610;
  wire       [15:0]   accumulators_611;
  wire       [15:0]   accumulators_612;
  wire       [15:0]   accumulators_613;
  wire       [15:0]   accumulators_614;
  wire       [15:0]   accumulators_615;
  wire       [15:0]   accumulators_616;
  wire       [15:0]   accumulators_617;
  wire       [15:0]   accumulators_618;
  wire       [15:0]   accumulators_619;
  wire       [15:0]   accumulators_620;
  wire       [15:0]   accumulators_621;
  wire       [15:0]   accumulators_622;
  wire       [15:0]   accumulators_623;
  wire       [15:0]   accumulators_624;
  wire       [15:0]   accumulators_625;
  wire       [15:0]   accumulators_626;
  wire       [15:0]   accumulators_627;
  wire       [15:0]   accumulators_628;
  wire       [15:0]   accumulators_629;
  wire       [15:0]   accumulators_630;
  wire       [15:0]   accumulators_631;
  wire       [15:0]   accumulators_632;
  wire       [15:0]   accumulators_633;
  wire       [15:0]   accumulators_634;
  wire       [15:0]   accumulators_635;
  wire       [15:0]   accumulators_636;
  wire       [15:0]   accumulators_637;
  wire       [15:0]   accumulators_638;
  wire       [15:0]   accumulators_639;
  wire       [15:0]   accumulators_640;
  wire       [15:0]   accumulators_641;
  wire       [15:0]   accumulators_642;
  wire       [15:0]   accumulators_643;
  wire       [15:0]   accumulators_644;
  wire       [15:0]   accumulators_645;
  wire       [15:0]   accumulators_646;
  wire       [15:0]   accumulators_647;
  wire       [15:0]   accumulators_648;
  wire       [15:0]   accumulators_649;
  wire       [15:0]   accumulators_650;
  wire       [15:0]   accumulators_651;
  wire       [15:0]   accumulators_652;
  wire       [15:0]   accumulators_653;
  wire       [15:0]   accumulators_654;
  wire       [15:0]   accumulators_655;
  wire       [15:0]   accumulators_656;
  wire       [15:0]   accumulators_657;
  wire       [15:0]   accumulators_658;
  wire       [15:0]   accumulators_659;
  wire       [15:0]   accumulators_660;
  wire       [15:0]   accumulators_661;
  wire       [15:0]   accumulators_662;
  wire       [15:0]   accumulators_663;
  wire       [15:0]   accumulators_664;
  wire       [15:0]   accumulators_665;
  wire       [15:0]   accumulators_666;
  wire       [15:0]   accumulators_667;
  wire       [15:0]   accumulators_668;
  wire       [15:0]   accumulators_669;
  wire       [15:0]   accumulators_670;
  wire       [15:0]   accumulators_671;
  wire       [15:0]   accumulators_672;
  wire       [15:0]   accumulators_673;
  wire       [15:0]   accumulators_674;
  wire       [15:0]   accumulators_675;
  wire       [15:0]   accumulators_676;
  wire       [15:0]   accumulators_677;
  wire       [15:0]   accumulators_678;
  wire       [15:0]   accumulators_679;
  wire       [15:0]   accumulators_680;
  wire       [15:0]   accumulators_681;
  wire       [15:0]   accumulators_682;
  wire       [15:0]   accumulators_683;
  wire       [15:0]   accumulators_684;
  wire       [15:0]   accumulators_685;
  wire       [15:0]   accumulators_686;
  wire       [15:0]   accumulators_687;
  wire       [15:0]   accumulators_688;
  wire       [15:0]   accumulators_689;
  wire       [15:0]   accumulators_690;
  wire       [15:0]   accumulators_691;
  wire       [15:0]   accumulators_692;
  wire       [15:0]   accumulators_693;
  wire       [15:0]   accumulators_694;
  wire       [15:0]   accumulators_695;
  wire       [15:0]   accumulators_696;
  wire       [15:0]   accumulators_697;
  wire       [15:0]   accumulators_698;
  wire       [15:0]   accumulators_699;
  wire       [15:0]   accumulators_700;
  wire       [15:0]   accumulators_701;
  wire       [15:0]   accumulators_702;
  wire       [15:0]   accumulators_703;
  wire       [15:0]   accumulators_704;
  wire       [15:0]   accumulators_705;
  wire       [15:0]   accumulators_706;
  wire       [15:0]   accumulators_707;
  wire       [15:0]   accumulators_708;
  wire       [15:0]   accumulators_709;
  wire       [15:0]   accumulators_710;
  wire       [15:0]   accumulators_711;
  wire       [15:0]   accumulators_712;
  wire       [15:0]   accumulators_713;
  wire       [15:0]   accumulators_714;
  wire       [15:0]   accumulators_715;
  wire       [15:0]   accumulators_716;
  wire       [15:0]   accumulators_717;
  wire       [15:0]   accumulators_718;
  wire       [15:0]   accumulators_719;
  wire       [15:0]   accumulators_720;
  wire       [15:0]   accumulators_721;
  wire       [15:0]   accumulators_722;
  wire       [15:0]   accumulators_723;
  wire       [15:0]   accumulators_724;
  wire       [15:0]   accumulators_725;
  wire       [15:0]   accumulators_726;
  wire       [15:0]   accumulators_727;
  wire       [15:0]   accumulators_728;
  wire       [15:0]   accumulators_729;
  wire       [15:0]   accumulators_730;
  wire       [15:0]   accumulators_731;
  wire       [15:0]   accumulators_732;
  wire       [15:0]   accumulators_733;
  wire       [15:0]   accumulators_734;
  wire       [15:0]   accumulators_735;
  wire       [15:0]   accumulators_736;
  wire       [15:0]   accumulators_737;
  wire       [15:0]   accumulators_738;
  wire       [15:0]   accumulators_739;
  wire       [15:0]   accumulators_740;
  wire       [15:0]   accumulators_741;
  wire       [15:0]   accumulators_742;
  wire       [15:0]   accumulators_743;
  wire       [15:0]   accumulators_744;
  wire       [15:0]   accumulators_745;
  wire       [15:0]   accumulators_746;
  wire       [15:0]   accumulators_747;
  wire       [15:0]   accumulators_748;
  wire       [15:0]   accumulators_749;
  wire       [15:0]   accumulators_750;
  wire       [15:0]   accumulators_751;
  wire       [15:0]   accumulators_752;
  wire       [15:0]   accumulators_753;
  wire       [15:0]   accumulators_754;
  wire       [15:0]   accumulators_755;
  wire       [15:0]   accumulators_756;
  wire       [15:0]   accumulators_757;
  wire       [15:0]   accumulators_758;
  wire       [15:0]   accumulators_759;
  wire       [15:0]   accumulators_760;
  wire       [15:0]   accumulators_761;
  wire       [15:0]   accumulators_762;
  wire       [15:0]   accumulators_763;
  wire       [15:0]   accumulators_764;
  wire       [15:0]   accumulators_765;
  wire       [15:0]   accumulators_766;
  wire       [15:0]   accumulators_767;
  wire       [15:0]   accumulators_768;
  wire       [15:0]   accumulators_769;
  wire       [15:0]   accumulators_770;
  wire       [15:0]   accumulators_771;
  wire       [15:0]   accumulators_772;
  wire       [15:0]   accumulators_773;
  wire       [15:0]   accumulators_774;
  wire       [15:0]   accumulators_775;
  wire       [15:0]   accumulators_776;
  wire       [15:0]   accumulators_777;
  wire       [15:0]   accumulators_778;
  wire       [15:0]   accumulators_779;
  wire       [15:0]   accumulators_780;
  wire       [15:0]   accumulators_781;
  wire       [15:0]   accumulators_782;
  wire       [15:0]   accumulators_783;
  wire       [15:0]   accumulators_784;
  wire       [15:0]   accumulators_785;
  wire       [15:0]   accumulators_786;
  wire       [15:0]   accumulators_787;
  wire       [15:0]   accumulators_788;
  wire       [15:0]   accumulators_789;
  wire       [15:0]   accumulators_790;
  wire       [15:0]   accumulators_791;
  wire       [15:0]   accumulators_792;
  wire       [15:0]   accumulators_793;
  wire       [15:0]   accumulators_794;
  wire       [15:0]   accumulators_795;
  wire       [15:0]   accumulators_796;
  wire       [15:0]   accumulators_797;
  wire       [15:0]   accumulators_798;
  wire       [15:0]   accumulators_799;
  wire       [15:0]   accumulators_800;
  wire       [15:0]   accumulators_801;
  wire       [15:0]   accumulators_802;
  wire       [15:0]   accumulators_803;
  wire       [15:0]   accumulators_804;
  wire       [15:0]   accumulators_805;
  wire       [15:0]   accumulators_806;
  wire       [15:0]   accumulators_807;
  wire       [15:0]   accumulators_808;
  wire       [15:0]   accumulators_809;
  wire       [15:0]   accumulators_810;
  wire       [15:0]   accumulators_811;
  wire       [15:0]   accumulators_812;
  wire       [15:0]   accumulators_813;
  wire       [15:0]   accumulators_814;
  wire       [15:0]   accumulators_815;
  wire       [15:0]   accumulators_816;
  wire       [15:0]   accumulators_817;
  wire       [15:0]   accumulators_818;
  wire       [15:0]   accumulators_819;
  wire       [15:0]   accumulators_820;
  wire       [15:0]   accumulators_821;
  wire       [15:0]   accumulators_822;
  wire       [15:0]   accumulators_823;
  wire       [15:0]   accumulators_824;
  wire       [15:0]   accumulators_825;
  wire       [15:0]   accumulators_826;
  wire       [15:0]   accumulators_827;
  wire       [15:0]   accumulators_828;
  wire       [15:0]   accumulators_829;
  wire       [15:0]   accumulators_830;
  wire       [15:0]   accumulators_831;
  wire       [15:0]   accumulators_832;
  wire       [15:0]   accumulators_833;
  wire       [15:0]   accumulators_834;
  wire       [15:0]   accumulators_835;
  wire       [15:0]   accumulators_836;
  wire       [15:0]   accumulators_837;
  wire       [15:0]   accumulators_838;
  wire       [15:0]   accumulators_839;
  wire       [15:0]   accumulators_840;
  wire       [15:0]   accumulators_841;
  wire       [15:0]   accumulators_842;
  wire       [15:0]   accumulators_843;
  wire       [15:0]   accumulators_844;
  wire       [15:0]   accumulators_845;
  wire       [15:0]   accumulators_846;
  wire       [15:0]   accumulators_847;
  wire       [15:0]   accumulators_848;
  wire       [15:0]   accumulators_849;
  wire       [15:0]   accumulators_850;
  wire       [15:0]   accumulators_851;
  wire       [15:0]   accumulators_852;
  wire       [15:0]   accumulators_853;
  wire       [15:0]   accumulators_854;
  wire       [15:0]   accumulators_855;
  wire       [15:0]   accumulators_856;
  wire       [15:0]   accumulators_857;
  wire       [15:0]   accumulators_858;
  wire       [15:0]   accumulators_859;
  wire       [15:0]   accumulators_860;
  wire       [15:0]   accumulators_861;
  wire       [15:0]   accumulators_862;
  wire       [15:0]   accumulators_863;
  wire       [15:0]   accumulators_864;
  wire       [15:0]   accumulators_865;
  wire       [15:0]   accumulators_866;
  wire       [15:0]   accumulators_867;
  wire       [15:0]   accumulators_868;
  wire       [15:0]   accumulators_869;
  wire       [15:0]   accumulators_870;
  wire       [15:0]   accumulators_871;
  wire       [15:0]   accumulators_872;
  wire       [15:0]   accumulators_873;
  wire       [15:0]   accumulators_874;
  wire       [15:0]   accumulators_875;
  wire       [15:0]   accumulators_876;
  wire       [15:0]   accumulators_877;
  wire       [15:0]   accumulators_878;
  wire       [15:0]   accumulators_879;
  wire       [15:0]   accumulators_880;
  wire       [15:0]   accumulators_881;
  wire       [15:0]   accumulators_882;
  wire       [15:0]   accumulators_883;
  wire       [15:0]   accumulators_884;
  wire       [15:0]   accumulators_885;
  wire       [15:0]   accumulators_886;
  wire       [15:0]   accumulators_887;
  wire       [15:0]   accumulators_888;
  wire       [15:0]   accumulators_889;
  wire       [15:0]   accumulators_890;
  wire       [15:0]   accumulators_891;
  wire       [15:0]   accumulators_892;
  wire       [15:0]   accumulators_893;
  wire       [15:0]   accumulators_894;
  wire       [15:0]   accumulators_895;
  wire       [15:0]   accumulators_896;
  wire       [15:0]   accumulators_897;
  wire       [15:0]   accumulators_898;
  wire       [15:0]   accumulators_899;
  wire       [15:0]   accumulators_900;
  wire       [15:0]   accumulators_901;
  wire       [15:0]   accumulators_902;
  wire       [15:0]   accumulators_903;
  wire       [15:0]   accumulators_904;
  wire       [15:0]   accumulators_905;
  wire       [15:0]   accumulators_906;
  wire       [15:0]   accumulators_907;
  wire       [15:0]   accumulators_908;
  wire       [15:0]   accumulators_909;
  wire       [15:0]   accumulators_910;
  wire       [15:0]   accumulators_911;
  wire       [15:0]   accumulators_912;
  wire       [15:0]   accumulators_913;
  wire       [15:0]   accumulators_914;
  wire       [15:0]   accumulators_915;
  wire       [15:0]   accumulators_916;
  wire       [15:0]   accumulators_917;
  wire       [15:0]   accumulators_918;
  wire       [15:0]   accumulators_919;
  wire       [15:0]   accumulators_920;
  wire       [15:0]   accumulators_921;
  wire       [15:0]   accumulators_922;
  wire       [15:0]   accumulators_923;
  wire       [15:0]   accumulators_924;
  wire       [15:0]   accumulators_925;
  wire       [15:0]   accumulators_926;
  wire       [15:0]   accumulators_927;
  wire       [15:0]   accumulators_928;
  wire       [15:0]   accumulators_929;
  wire       [15:0]   accumulators_930;
  wire       [15:0]   accumulators_931;
  wire       [15:0]   accumulators_932;
  wire       [15:0]   accumulators_933;
  wire       [15:0]   accumulators_934;
  wire       [15:0]   accumulators_935;
  wire       [15:0]   accumulators_936;
  wire       [15:0]   accumulators_937;
  wire       [15:0]   accumulators_938;
  wire       [15:0]   accumulators_939;
  wire       [15:0]   accumulators_940;
  wire       [15:0]   accumulators_941;
  wire       [15:0]   accumulators_942;
  wire       [15:0]   accumulators_943;
  wire       [15:0]   accumulators_944;
  wire       [15:0]   accumulators_945;
  wire       [15:0]   accumulators_946;
  wire       [15:0]   accumulators_947;
  wire       [15:0]   accumulators_948;
  wire       [15:0]   accumulators_949;
  wire       [15:0]   accumulators_950;
  wire       [15:0]   accumulators_951;
  wire       [15:0]   accumulators_952;
  wire       [15:0]   accumulators_953;
  wire       [15:0]   accumulators_954;
  wire       [15:0]   accumulators_955;
  wire       [15:0]   accumulators_956;
  wire       [15:0]   accumulators_957;
  wire       [15:0]   accumulators_958;
  wire       [15:0]   accumulators_959;
  wire       [15:0]   accumulators_960;
  wire       [15:0]   accumulators_961;
  wire       [15:0]   accumulators_962;
  wire       [15:0]   accumulators_963;
  wire       [15:0]   accumulators_964;
  wire       [15:0]   accumulators_965;
  wire       [15:0]   accumulators_966;
  wire       [15:0]   accumulators_967;
  wire       [15:0]   accumulators_968;
  wire       [15:0]   accumulators_969;
  wire       [15:0]   accumulators_970;
  wire       [15:0]   accumulators_971;
  wire       [15:0]   accumulators_972;
  wire       [15:0]   accumulators_973;
  wire       [15:0]   accumulators_974;
  wire       [15:0]   accumulators_975;
  wire       [15:0]   accumulators_976;
  wire       [15:0]   accumulators_977;
  wire       [15:0]   accumulators_978;
  wire       [15:0]   accumulators_979;
  wire       [15:0]   accumulators_980;
  wire       [15:0]   accumulators_981;
  wire       [15:0]   accumulators_982;
  wire       [15:0]   accumulators_983;
  wire       [15:0]   accumulators_984;
  wire       [15:0]   accumulators_985;
  wire       [15:0]   accumulators_986;
  wire       [15:0]   accumulators_987;
  wire       [15:0]   accumulators_988;
  wire       [15:0]   accumulators_989;
  wire       [15:0]   accumulators_990;
  wire       [15:0]   accumulators_991;
  wire       [15:0]   accumulators_992;
  wire       [15:0]   accumulators_993;
  wire       [15:0]   accumulators_994;
  wire       [15:0]   accumulators_995;
  wire       [15:0]   accumulators_996;
  wire       [15:0]   accumulators_997;
  wire       [15:0]   accumulators_998;
  wire       [15:0]   accumulators_999;
  wire       [15:0]   accumulators_1000;
  wire       [15:0]   accumulators_1001;
  wire       [15:0]   accumulators_1002;
  wire       [15:0]   accumulators_1003;
  wire       [15:0]   accumulators_1004;
  wire       [15:0]   accumulators_1005;
  wire       [15:0]   accumulators_1006;
  wire       [15:0]   accumulators_1007;
  wire       [15:0]   accumulators_1008;
  wire       [15:0]   accumulators_1009;
  wire       [15:0]   accumulators_1010;
  wire       [15:0]   accumulators_1011;
  wire       [15:0]   accumulators_1012;
  wire       [15:0]   accumulators_1013;
  wire       [15:0]   accumulators_1014;
  wire       [15:0]   accumulators_1015;
  wire       [15:0]   accumulators_1016;
  wire       [15:0]   accumulators_1017;
  wire       [15:0]   accumulators_1018;
  wire       [15:0]   accumulators_1019;
  wire       [15:0]   accumulators_1020;
  wire       [15:0]   accumulators_1021;
  wire       [15:0]   accumulators_1022;
  wire       [15:0]   accumulators_1023;
  wire       [15:0]   accumulators_1024;
  wire       [15:0]   accumulators_1025;
  wire       [15:0]   accumulators_1026;
  wire       [15:0]   accumulators_1027;
  wire       [15:0]   accumulators_1028;
  wire       [15:0]   accumulators_1029;
  wire       [15:0]   accumulators_1030;
  wire       [15:0]   accumulators_1031;
  wire       [15:0]   accumulators_1032;
  wire       [15:0]   accumulators_1033;
  wire       [15:0]   accumulators_1034;
  wire       [15:0]   accumulators_1035;
  wire       [15:0]   accumulators_1036;
  wire       [15:0]   accumulators_1037;
  wire       [15:0]   accumulators_1038;
  wire       [15:0]   accumulators_1039;
  wire       [15:0]   accumulators_1040;
  wire       [15:0]   accumulators_1041;
  wire       [15:0]   accumulators_1042;
  wire       [15:0]   accumulators_1043;
  wire       [15:0]   accumulators_1044;
  wire       [15:0]   accumulators_1045;
  wire       [15:0]   accumulators_1046;
  wire       [15:0]   accumulators_1047;
  wire       [15:0]   accumulators_1048;
  wire       [15:0]   accumulators_1049;
  wire       [15:0]   accumulators_1050;
  wire       [15:0]   accumulators_1051;
  wire       [15:0]   accumulators_1052;
  wire       [15:0]   accumulators_1053;
  wire       [15:0]   accumulators_1054;
  wire       [15:0]   accumulators_1055;
  wire       [15:0]   accumulators_1056;
  wire       [15:0]   accumulators_1057;
  wire       [15:0]   accumulators_1058;
  wire       [15:0]   accumulators_1059;
  wire       [15:0]   accumulators_1060;
  wire       [15:0]   accumulators_1061;
  wire       [15:0]   accumulators_1062;
  wire       [15:0]   accumulators_1063;
  wire       [15:0]   accumulators_1064;
  wire       [15:0]   accumulators_1065;
  wire       [15:0]   accumulators_1066;
  wire       [15:0]   accumulators_1067;
  wire       [15:0]   accumulators_1068;
  wire       [15:0]   accumulators_1069;
  wire       [15:0]   accumulators_1070;
  wire       [15:0]   accumulators_1071;
  wire       [15:0]   accumulators_1072;
  wire       [15:0]   accumulators_1073;
  wire       [15:0]   accumulators_1074;
  wire       [15:0]   accumulators_1075;
  wire       [15:0]   accumulators_1076;
  wire       [15:0]   accumulators_1077;
  wire       [15:0]   accumulators_1078;
  wire       [15:0]   accumulators_1079;
  wire       [15:0]   accumulators_1080;
  wire       [15:0]   accumulators_1081;
  wire       [15:0]   accumulators_1082;
  wire       [15:0]   accumulators_1083;
  wire       [15:0]   accumulators_1084;
  wire       [15:0]   accumulators_1085;
  wire       [15:0]   accumulators_1086;
  wire       [15:0]   accumulators_1087;
  wire       [15:0]   accumulators_1088;
  wire       [15:0]   accumulators_1089;
  wire       [15:0]   accumulators_1090;
  wire       [15:0]   accumulators_1091;
  wire       [15:0]   accumulators_1092;
  wire       [15:0]   accumulators_1093;
  wire       [15:0]   accumulators_1094;
  wire       [15:0]   accumulators_1095;
  wire       [15:0]   accumulators_1096;
  wire       [15:0]   accumulators_1097;
  wire       [15:0]   accumulators_1098;
  wire       [15:0]   accumulators_1099;
  wire       [15:0]   accumulators_1100;
  wire       [15:0]   accumulators_1101;
  wire       [15:0]   accumulators_1102;
  wire       [15:0]   accumulators_1103;
  wire       [15:0]   accumulators_1104;
  wire       [15:0]   accumulators_1105;
  wire       [15:0]   accumulators_1106;
  wire       [15:0]   accumulators_1107;
  wire       [15:0]   accumulators_1108;
  wire       [15:0]   accumulators_1109;
  wire       [15:0]   accumulators_1110;
  wire       [15:0]   accumulators_1111;
  wire       [15:0]   accumulators_1112;
  wire       [15:0]   accumulators_1113;
  wire       [15:0]   accumulators_1114;
  wire       [15:0]   accumulators_1115;
  wire       [15:0]   accumulators_1116;
  wire       [15:0]   accumulators_1117;
  wire       [15:0]   accumulators_1118;
  wire       [15:0]   accumulators_1119;
  wire       [15:0]   accumulators_1120;
  wire       [15:0]   accumulators_1121;
  wire       [15:0]   accumulators_1122;
  wire       [15:0]   accumulators_1123;
  wire       [15:0]   accumulators_1124;
  wire       [15:0]   accumulators_1125;
  wire       [15:0]   accumulators_1126;
  wire       [15:0]   accumulators_1127;
  wire       [15:0]   accumulators_1128;
  wire       [15:0]   accumulators_1129;
  wire       [15:0]   accumulators_1130;
  wire       [15:0]   accumulators_1131;
  wire       [15:0]   accumulators_1132;
  wire       [15:0]   accumulators_1133;
  wire       [15:0]   accumulators_1134;
  wire       [15:0]   accumulators_1135;
  wire       [15:0]   accumulators_1136;
  wire       [15:0]   accumulators_1137;
  wire       [15:0]   accumulators_1138;
  wire       [15:0]   accumulators_1139;
  wire       [15:0]   accumulators_1140;
  wire       [15:0]   accumulators_1141;
  wire       [15:0]   accumulators_1142;
  wire       [15:0]   accumulators_1143;
  wire       [15:0]   accumulators_1144;
  wire       [15:0]   accumulators_1145;
  wire       [15:0]   accumulators_1146;
  wire       [15:0]   accumulators_1147;
  wire       [15:0]   accumulators_1148;
  wire       [15:0]   accumulators_1149;
  wire       [15:0]   accumulators_1150;
  wire       [15:0]   accumulators_1151;
  reg                 rowCounter_willIncrement;
  wire                rowCounter_willDecrement;
  wire                rowCounter_willClear;
  wire                rowCounter_willLoad;
  reg        [9:0]    rowCounter_valueNext;
  reg        [9:0]    rowCounter_value;
  wire                rowCounter_willOverflowIfInc;
  wire                rowCounter_willUnderflowIfDec;
  wire                rowCounter_willOverflow;
  wire                rowCounter_willUnderflow;
  reg                 nCounter_willIncrement;
  wire                nCounter_willDecrement;
  wire                nCounter_willClear;
  wire                nCounter_willLoad;
  reg        [0:0]    nCounter_valueNext;
  reg        [0:0]    nCounter_value;
  wire                nCounter_willOverflowIfInc;
  wire                nCounter_willUnderflowIfDec;
  wire                nCounter_willOverflow;
  wire                nCounter_willUnderflow;
  wire                kCounter_willIncrement;
  wire                kCounter_willDecrement;
  wire                kCounter_willClear;
  wire                kCounter_willLoad;
  wire                kCounter_willOverflowIfInc;
  wire                kCounter_willUnderflowIfDec;
  wire                kCounter_willOverflow;
  wire                kCounter_willUnderflow;
  wire                outCounter_willIncrement;
  wire                outCounter_willDecrement;
  wire                outCounter_willClear;
  wire                outCounter_willLoad;
  reg        [10:0]   outCounter_valueNext;
  reg        [10:0]   outCounter_value;
  wire                outCounter_willOverflowIfInc;
  wire                outCounter_willUnderflowIfDec;
  wire                outCounter_willOverflow;
  wire                outCounter_willUnderflow;
  reg                 when_matmul_l239;
  reg                 when_matmul_l239_regNext;
  reg        [9:0]    rowCounter_value_regNextWhen;
  reg        [0:0]    nCounter_value_regNextWhen;
  wire       [199:0]  _zz_io_c_stream_payload_0;
  wire                when_Phase_l801;
  reg        [15:0]   _zz_io_c_stream_payload_0_1;
  reg        [15:0]   _zz_io_c_stream_payload_0_2;
  reg        [15:0]   _zz_io_c_stream_payload_0_3;
  reg        [15:0]   _zz_io_c_stream_payload_0_4;
  reg        [15:0]   _zz_io_c_stream_payload_0_5;
  reg        [15:0]   _zz_io_c_stream_payload_0_6;
  reg        [15:0]   _zz_io_c_stream_payload_0_7;
  reg        [15:0]   _zz_io_c_stream_payload_0_8;
  reg        [15:0]   _zz_io_c_stream_payload_0_9;
  reg        [15:0]   _zz_io_c_stream_payload_0_10;
  reg        [15:0]   _zz_io_c_stream_payload_0_11;
  reg        [15:0]   _zz_io_c_stream_payload_0_12;
  reg        [15:0]   _zz_io_c_stream_payload_0_13;
  reg        [15:0]   _zz_io_c_stream_payload_0_14;
  reg        [15:0]   _zz_io_c_stream_payload_0_15;
  reg        [15:0]   _zz_io_c_stream_payload_0_16;
  reg        [15:0]   _zz_io_c_stream_payload_0_17;
  reg        [15:0]   _zz_io_c_stream_payload_0_18;
  reg        [15:0]   _zz_io_c_stream_payload_0_19;
  reg        [15:0]   _zz_io_c_stream_payload_0_20;
  reg        [15:0]   _zz_io_c_stream_payload_0_21;
  reg        [15:0]   _zz_io_c_stream_payload_0_22;
  reg        [15:0]   _zz_io_c_stream_payload_0_23;
  reg        [15:0]   _zz_io_c_stream_payload_0_24;
  reg        [15:0]   _zz_io_c_stream_payload_0_25;
  reg                 when_matmul_l239_regNext_regNext;
  reg        [9:0]    rowCounter_value_regNextWhen_regNextWhen;
  wire                when_Utils_l1073;
  reg        [9:0]    rowCounter_value_regNextWhen_regNextWhen_delay_1;
  reg        [9:0]    rowCounter_value_regNextWhen_regNextWhen_delay_2;
  reg        [9:0]    rowCounter_value_regNextWhen_regNextWhen_delay_3;
  reg        [9:0]    rowCounter_value_regNextWhen_regNextWhen_delay_4;
  reg        [9:0]    rowCounter_value_regNextWhen_regNextWhen_delay_5;
  reg        [0:0]    nCounter_value_regNextWhen_regNextWhen;
  wire                when_Utils_l1073_1;
  reg        [0:0]    nCounter_value_regNextWhen_regNextWhen_delay_1;
  reg        [0:0]    nCounter_value_regNextWhen_regNextWhen_delay_2;
  reg        [0:0]    nCounter_value_regNextWhen_regNextWhen_delay_3;
  reg        [0:0]    nCounter_value_regNextWhen_regNextWhen_delay_4;
  reg        [0:0]    nCounter_value_regNextWhen_regNextWhen_delay_5;
  wire                when_Utils_l1073_2;
  reg                 when_matmul_l239_regNext_regNext_delay_1;
  reg                 when_matmul_l239_regNext_regNext_delay_2;
  reg                 when_matmul_l239_regNext_regNext_delay_3;
  reg                 when_matmul_l239_regNext_regNext_delay_4;
  reg                 when_matmul_l239_regNext_regNext_delay_5;
  reg                 when_matmul_l239_regNext_regNext_regNext;
  reg        [15:0]   _zz_io_c_stream_payload_0_26;
  reg        [15:0]   _zz_io_c_stream_payload_0_27;
  reg        [15:0]   _zz_io_c_stream_payload_0_28;
  reg        [15:0]   _zz_io_c_stream_payload_0_29;
  reg        [15:0]   _zz_io_c_stream_payload_0_30;
  reg        [15:0]   _zz_io_c_stream_payload_0_31;
  reg        [15:0]   _zz_io_c_stream_payload_0_32;
  reg        [15:0]   _zz_io_c_stream_payload_0_33;
  reg        [15:0]   _zz_io_c_stream_payload_0_34;
  reg        [15:0]   _zz_io_c_stream_payload_0_35;
  reg        [15:0]   _zz_io_c_stream_payload_0_36;
  reg        [15:0]   _zz_io_c_stream_payload_0_37;
  reg        [15:0]   _zz_io_c_stream_payload_0_38;
  reg                 when_matmul_l239_regNext_regNext_regNext_regNext;
  reg        [15:0]   _zz_io_c_stream_payload_0_39;
  reg        [15:0]   _zz_io_c_stream_payload_0_40;
  reg        [15:0]   _zz_io_c_stream_payload_0_41;
  reg        [15:0]   _zz_io_c_stream_payload_0_42;
  reg        [15:0]   _zz_io_c_stream_payload_0_43;
  reg        [15:0]   _zz_io_c_stream_payload_0_44;
  reg        [15:0]   _zz_io_c_stream_payload_0_45;
  reg                 when_matmul_l239_regNext_regNext_regNext_regNext_regNext;
  reg        [15:0]   _zz_io_c_stream_payload_0_46;
  reg        [15:0]   _zz_io_c_stream_payload_0_47;
  reg        [15:0]   _zz_io_c_stream_payload_0_48;
  reg        [15:0]   _zz_io_c_stream_payload_0_49;
  reg                 when_matmul_l239_regNext_regNext_regNext_regNext_regNext_regNext;
  reg        [15:0]   _zz_io_c_stream_payload_0_50;
  reg        [15:0]   _zz_io_c_stream_payload_0_51;
  reg                 when_matmul_l239_regNext_regNext_regNext_regNext_regNext_regNext_regNext;
  reg        [15:0]   _zz_io_c_stream_payload_0_52;
  reg        [15:0]   _zz_io_c_stream_payload_0_53;
  reg        [15:0]   _zz_io_c_stream_payload_0_54;
  reg        [15:0]   _zz_io_c_stream_payload_0_55;
  reg        [15:0]   _zz_io_c_stream_payload_0_56;
  reg        [15:0]   _zz_io_c_stream_payload_0_57;
  reg        [15:0]   _zz_io_c_stream_payload_0_58;
  reg        [15:0]   _zz_io_c_stream_payload_0_59;
  reg        [15:0]   _zz_io_c_stream_payload_0_60;
  reg        [15:0]   _zz_io_c_stream_payload_0_61;
  reg        [15:0]   _zz_io_c_stream_payload_0_62;
  reg        [15:0]   _zz_io_c_stream_payload_0_63;
  reg        [15:0]   _zz_io_c_stream_payload_0_64;
  reg        [15:0]   _zz_io_c_stream_payload_0_65;
  reg        [15:0]   _zz_io_c_stream_payload_0_66;
  reg        [15:0]   _zz_io_c_stream_payload_0_67;
  reg        [15:0]   _zz_io_c_stream_payload_0_68;
  reg        [15:0]   _zz_io_c_stream_payload_0_69;
  reg        [15:0]   _zz_io_c_stream_payload_0_70;
  reg        [15:0]   _zz_io_c_stream_payload_0_71;
  reg        [15:0]   _zz_io_c_stream_payload_0_72;
  reg        [15:0]   _zz_io_c_stream_payload_0_73;
  reg        [15:0]   _zz_io_c_stream_payload_0_74;
  reg        [15:0]   _zz_io_c_stream_payload_0_75;
  reg        [15:0]   _zz_io_c_stream_payload_0_76;
  reg        [15:0]   _zz_io_c_stream_payload_0_77;
  reg        [15:0]   _zz_io_c_stream_payload_0_78;
  reg        [15:0]   _zz_io_c_stream_payload_0_79;
  reg        [15:0]   _zz_io_c_stream_payload_0_80;
  reg        [15:0]   _zz_io_c_stream_payload_0_81;
  reg        [15:0]   _zz_io_c_stream_payload_0_82;
  reg        [15:0]   _zz_io_c_stream_payload_0_83;
  reg        [15:0]   _zz_io_c_stream_payload_0_84;
  wire       [4:0]    _zz_io_c_stream_payload_0_85;
  wire       [31:0]   _zz_1;
  wire       [15:0]   _zz_io_c_stream_payload_0_86;
  reg        [9:0]    _zz_io_c_stream_payload_0_87;
  reg                 when_matmul_l371;
  reg                 _zz_io_c_stream_payload_0_88;
  reg        [0:0]    _zz_io_c_stream_payload_0_89;
  reg        [0:0]    _zz_io_c_stream_payload_0_90;
  wire                _zz_2;
  reg                 _zz_3;
  reg                 _zz_4;
  reg        [2:0]    _zz_5;
  reg        [2:0]    _zz_6;
  wire                _zz_7;
  reg        [2:0]    _zz_8;
  reg        [2:0]    _zz_9;
  wire       [31:0]   _zz_10;
  wire       [199:0]  _zz_io_c_stream_payload_0_91;
  reg        [199:0]  _zz_io_c_stream_payload_0_92;
  reg        [199:0]  _zz_io_c_stream_payload_0_93;
  `ifndef SYNTHESIS
  reg [15:0] _zz_8_string;
  reg [15:0] _zz_9_string;
  `endif


  assign _zz_when = 1'b1;
  assign _zz_rowCounter_valueNext_1 = rowCounter_willIncrement;
  assign _zz_rowCounter_valueNext = {9'd0, _zz_rowCounter_valueNext_1};
  assign _zz_outCounter_valueNext_1 = outCounter_willIncrement;
  assign _zz_outCounter_valueNext = {10'd0, _zz_outCounter_valueNext_1};
  assign _zz_io_readAddr = (_zz_io_readAddr_1 + 2'b00);
  assign _zz_io_readAddr_1 = (nCounter_value * 1'b1);
  assign _zz__zz_io_c_stream_payload_0_1 = _zz_io_c_stream_payload_0[7 : 0];
  assign _zz__zz_io_c_stream_payload_0_2 = _zz_io_c_stream_payload_0[15 : 8];
  assign _zz__zz_io_c_stream_payload_0_3 = _zz_io_c_stream_payload_0[23 : 16];
  assign _zz__zz_io_c_stream_payload_0_4 = _zz_io_c_stream_payload_0[31 : 24];
  assign _zz__zz_io_c_stream_payload_0_5 = _zz_io_c_stream_payload_0[39 : 32];
  assign _zz__zz_io_c_stream_payload_0_6 = _zz_io_c_stream_payload_0[47 : 40];
  assign _zz__zz_io_c_stream_payload_0_7 = _zz_io_c_stream_payload_0[55 : 48];
  assign _zz__zz_io_c_stream_payload_0_8 = _zz_io_c_stream_payload_0[63 : 56];
  assign _zz__zz_io_c_stream_payload_0_9 = _zz_io_c_stream_payload_0[71 : 64];
  assign _zz__zz_io_c_stream_payload_0_10 = _zz_io_c_stream_payload_0[79 : 72];
  assign _zz__zz_io_c_stream_payload_0_11 = _zz_io_c_stream_payload_0[87 : 80];
  assign _zz__zz_io_c_stream_payload_0_12 = _zz_io_c_stream_payload_0[95 : 88];
  assign _zz__zz_io_c_stream_payload_0_13 = _zz_io_c_stream_payload_0[103 : 96];
  assign _zz__zz_io_c_stream_payload_0_14 = _zz_io_c_stream_payload_0[111 : 104];
  assign _zz__zz_io_c_stream_payload_0_15 = _zz_io_c_stream_payload_0[119 : 112];
  assign _zz__zz_io_c_stream_payload_0_16 = _zz_io_c_stream_payload_0[127 : 120];
  assign _zz__zz_io_c_stream_payload_0_17 = _zz_io_c_stream_payload_0[135 : 128];
  assign _zz__zz_io_c_stream_payload_0_18 = _zz_io_c_stream_payload_0[143 : 136];
  assign _zz__zz_io_c_stream_payload_0_19 = _zz_io_c_stream_payload_0[151 : 144];
  assign _zz__zz_io_c_stream_payload_0_20 = _zz_io_c_stream_payload_0[159 : 152];
  assign _zz__zz_io_c_stream_payload_0_21 = _zz_io_c_stream_payload_0[167 : 160];
  assign _zz__zz_io_c_stream_payload_0_22 = _zz_io_c_stream_payload_0[175 : 168];
  assign _zz__zz_io_c_stream_payload_0_23 = _zz_io_c_stream_payload_0[183 : 176];
  assign _zz__zz_io_c_stream_payload_0_24 = _zz_io_c_stream_payload_0[191 : 184];
  assign _zz__zz_io_c_stream_payload_0_25 = _zz_io_c_stream_payload_0[199 : 192];
  assign _zz__zz_io_c_stream_payload_0_85 = (_zz__zz_io_c_stream_payload_0_85_1 + _zz__zz_io_c_stream_payload_0_85_3);
  assign _zz__zz_io_c_stream_payload_0_85_1 = (_zz__zz_io_c_stream_payload_0_85_2 * 2'b10);
  assign _zz__zz_io_c_stream_payload_0_85_2 = (rowCounter_value_regNextWhen_regNextWhen_delay_5 % 5'h10);
  assign _zz__zz_io_c_stream_payload_0_85_4 = {1'd0, nCounter_value_regNextWhen_regNextWhen_delay_5};
  assign _zz__zz_io_c_stream_payload_0_85_3 = {5'd0, _zz__zz_io_c_stream_payload_0_85_4};
  assign _zz__zz_5_1 = _zz_4;
  assign _zz__zz_5 = {2'd0, _zz__zz_5_1};
  assign _zz_io_c_stream_payload_0_96 = (_zz_io_c_stream_payload_0_97 + _zz_io_c_stream_payload_0_99);
  assign _zz_io_c_stream_payload_0_95 = _zz_io_c_stream_payload_0_96[4:0];
  assign _zz_io_c_stream_payload_0_97 = (_zz_io_c_stream_payload_0_98 * 2'b10);
  assign _zz_io_c_stream_payload_0_98 = (_zz_io_c_stream_payload_0_87 % 5'h10);
  assign _zz_io_c_stream_payload_0_100 = {1'd0, _zz_io_c_stream_payload_0_90};
  assign _zz_io_c_stream_payload_0_99 = {5'd0, _zz_io_c_stream_payload_0_100};
  assign _zz__zz_10_1 = (_zz__zz_10_2 + _zz__zz_10_4);
  assign _zz__zz_10 = _zz__zz_10_1[4:0];
  assign _zz__zz_10_2 = (_zz__zz_10_3 * 2'b10);
  assign _zz__zz_10_3 = (_zz_io_c_stream_payload_0_87 % 5'h10);
  assign _zz__zz_10_5 = {1'd0, _zz_io_c_stream_payload_0_90};
  assign _zz__zz_10_4 = {5'd0, _zz__zz_10_5};
  assign _zz__zz_io_c_stream_payload_0_93 = io_a_stream_payload_9;
  assign _zz__zz_io_c_stream_payload_0_93_1 = {io_a_stream_payload_8,{io_a_stream_payload_7,{io_a_stream_payload_6,{io_a_stream_payload_5,{io_a_stream_payload_4,{io_a_stream_payload_3,{io_a_stream_payload_2,{io_a_stream_payload_1,io_a_stream_payload_0}}}}}}}};
  StreamDoubleBuffer streamDoubleBuffer_7 (
    .io_streamIn_valid      (io_b_stream_valid                       ), //i
    .io_streamIn_ready      (streamDoubleBuffer_7_io_streamIn_ready  ), //o
    .io_streamIn_payload_0  (io_b_stream_payload_0[7:0]              ), //i
    .io_streamIn_payload_1  (io_b_stream_payload_1[7:0]              ), //i
    .io_streamIn_payload_2  (io_b_stream_payload_2[7:0]              ), //i
    .io_streamIn_payload_3  (io_b_stream_payload_3[7:0]              ), //i
    .io_streamIn_payload_4  (io_b_stream_payload_4[7:0]              ), //i
    .io_streamIn_payload_5  (io_b_stream_payload_5[7:0]              ), //i
    .io_streamIn_payload_6  (io_b_stream_payload_6[7:0]              ), //i
    .io_streamIn_payload_7  (io_b_stream_payload_7[7:0]              ), //i
    .io_streamIn_payload_8  (io_b_stream_payload_8[7:0]              ), //i
    .io_streamIn_payload_9  (io_b_stream_payload_9[7:0]              ), //i
    .io_streamIn_payload_10 (io_b_stream_payload_10[7:0]             ), //i
    .io_streamIn_payload_11 (io_b_stream_payload_11[7:0]             ), //i
    .io_streamIn_payload_12 (io_b_stream_payload_12[7:0]             ), //i
    .io_streamIn_payload_13 (io_b_stream_payload_13[7:0]             ), //i
    .io_streamIn_payload_14 (io_b_stream_payload_14[7:0]             ), //i
    .io_streamIn_payload_15 (io_b_stream_payload_15[7:0]             ), //i
    .io_streamIn_payload_16 (io_b_stream_payload_16[7:0]             ), //i
    .io_streamIn_payload_17 (io_b_stream_payload_17[7:0]             ), //i
    .io_streamIn_payload_18 (io_b_stream_payload_18[7:0]             ), //i
    .io_streamIn_payload_19 (io_b_stream_payload_19[7:0]             ), //i
    .io_streamIn_payload_20 (io_b_stream_payload_20[7:0]             ), //i
    .io_streamIn_payload_21 (io_b_stream_payload_21[7:0]             ), //i
    .io_streamIn_payload_22 (io_b_stream_payload_22[7:0]             ), //i
    .io_streamIn_payload_23 (io_b_stream_payload_23[7:0]             ), //i
    .io_streamIn_payload_24 (io_b_stream_payload_24[7:0]             ), //i
    .io_readAddr            (streamDoubleBuffer_7_io_readAddr        ), //i
    .io_readData_0          (streamDoubleBuffer_7_io_readData_0[7:0] ), //o
    .io_readData_1          (streamDoubleBuffer_7_io_readData_1[7:0] ), //o
    .io_readData_2          (streamDoubleBuffer_7_io_readData_2[7:0] ), //o
    .io_readData_3          (streamDoubleBuffer_7_io_readData_3[7:0] ), //o
    .io_readData_4          (streamDoubleBuffer_7_io_readData_4[7:0] ), //o
    .io_readData_5          (streamDoubleBuffer_7_io_readData_5[7:0] ), //o
    .io_readData_6          (streamDoubleBuffer_7_io_readData_6[7:0] ), //o
    .io_readData_7          (streamDoubleBuffer_7_io_readData_7[7:0] ), //o
    .io_readData_8          (streamDoubleBuffer_7_io_readData_8[7:0] ), //o
    .io_readData_9          (streamDoubleBuffer_7_io_readData_9[7:0] ), //o
    .io_readData_10         (streamDoubleBuffer_7_io_readData_10[7:0]), //o
    .io_readData_11         (streamDoubleBuffer_7_io_readData_11[7:0]), //o
    .io_readData_12         (streamDoubleBuffer_7_io_readData_12[7:0]), //o
    .io_readData_13         (streamDoubleBuffer_7_io_readData_13[7:0]), //o
    .io_readData_14         (streamDoubleBuffer_7_io_readData_14[7:0]), //o
    .io_readData_15         (streamDoubleBuffer_7_io_readData_15[7:0]), //o
    .io_readData_16         (streamDoubleBuffer_7_io_readData_16[7:0]), //o
    .io_readData_17         (streamDoubleBuffer_7_io_readData_17[7:0]), //o
    .io_readData_18         (streamDoubleBuffer_7_io_readData_18[7:0]), //o
    .io_readData_19         (streamDoubleBuffer_7_io_readData_19[7:0]), //o
    .io_readData_20         (streamDoubleBuffer_7_io_readData_20[7:0]), //o
    .io_readData_21         (streamDoubleBuffer_7_io_readData_21[7:0]), //o
    .io_readData_22         (streamDoubleBuffer_7_io_readData_22[7:0]), //o
    .io_readData_23         (streamDoubleBuffer_7_io_readData_23[7:0]), //o
    .io_readData_24         (streamDoubleBuffer_7_io_readData_24[7:0]), //o
    .io_nextTile            (streamDoubleBuffer_7_io_nextTile        ), //i
    .io_tileReady           (streamDoubleBuffer_7_io_tileReady       ), //o
    .io_reArm               (io_reArm                                ), //i
    .io_loadCanAccept       (streamDoubleBuffer_7_io_loadCanAccept   ), //o
    .io_tileFilled          (streamDoubleBuffer_7_io_tileFilled      ), //o
    .io_refreshSettled      (streamDoubleBuffer_7_io_refreshSettled  ), //o
    .clk                    (clk                                     ), //i
    .reset                  (reset                                   )  //i
  );
  always @(*) begin
    case(_zz_io_c_stream_payload_0_85)
      5'b00000 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_53;
      5'b00001 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_54;
      5'b00010 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_55;
      5'b00011 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_56;
      5'b00100 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_57;
      5'b00101 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_58;
      5'b00110 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_59;
      5'b00111 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_60;
      5'b01000 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_61;
      5'b01001 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_62;
      5'b01010 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_63;
      5'b01011 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_64;
      5'b01100 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_65;
      5'b01101 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_66;
      5'b01110 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_67;
      5'b01111 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_68;
      5'b10000 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_69;
      5'b10001 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_70;
      5'b10010 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_71;
      5'b10011 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_72;
      5'b10100 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_73;
      5'b10101 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_74;
      5'b10110 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_75;
      5'b10111 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_76;
      5'b11000 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_77;
      5'b11001 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_78;
      5'b11010 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_79;
      5'b11011 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_80;
      5'b11100 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_81;
      5'b11101 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_82;
      5'b11110 : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_83;
      default : _zz__zz_io_c_stream_payload_0_86 = _zz_io_c_stream_payload_0_84;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_0_95)
      5'b00000 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_53;
      5'b00001 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_54;
      5'b00010 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_55;
      5'b00011 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_56;
      5'b00100 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_57;
      5'b00101 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_58;
      5'b00110 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_59;
      5'b00111 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_60;
      5'b01000 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_61;
      5'b01001 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_62;
      5'b01010 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_63;
      5'b01011 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_64;
      5'b01100 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_65;
      5'b01101 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_66;
      5'b01110 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_67;
      5'b01111 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_68;
      5'b10000 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_69;
      5'b10001 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_70;
      5'b10010 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_71;
      5'b10011 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_72;
      5'b10100 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_73;
      5'b10101 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_74;
      5'b10110 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_75;
      5'b10111 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_76;
      5'b11000 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_77;
      5'b11001 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_78;
      5'b11010 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_79;
      5'b11011 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_80;
      5'b11100 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_81;
      5'b11101 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_82;
      5'b11110 : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_83;
      default : _zz_io_c_stream_payload_0_94 = _zz_io_c_stream_payload_0_84;
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_8)
      StateMachineEnum_ : _zz_8_string = "  ";
      StateMachineEnum__1 : _zz_8_string = "_1";
      StateMachineEnum__2 : _zz_8_string = "_2";
      StateMachineEnum__3 : _zz_8_string = "_3";
      StateMachineEnum__4 : _zz_8_string = "_4";
      StateMachineEnum__5 : _zz_8_string = "_5";
      default : _zz_8_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_9)
      StateMachineEnum_ : _zz_9_string = "  ";
      StateMachineEnum__1 : _zz_9_string = "_1";
      StateMachineEnum__2 : _zz_9_string = "_2";
      StateMachineEnum__3 : _zz_9_string = "_3";
      StateMachineEnum__4 : _zz_9_string = "_4";
      StateMachineEnum__5 : _zz_9_string = "_5";
      default : _zz_9_string = "??";
    endcase
  end
  `endif

  always @(*) begin
    when_Phase_l774 = 1'b0;
    case(_zz_8)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
        if(io_a_stream_valid) begin
          when_Phase_l774 = 1'b1;
        end
      end
      StateMachineEnum__3 : begin
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
      end
      default : begin
      end
    endcase
  end

  assign accumulators_0 = 16'h0;
  assign accumulators_1 = 16'h0;
  assign accumulators_2 = 16'h0;
  assign accumulators_3 = 16'h0;
  assign accumulators_4 = 16'h0;
  assign accumulators_5 = 16'h0;
  assign accumulators_6 = 16'h0;
  assign accumulators_7 = 16'h0;
  assign accumulators_8 = 16'h0;
  assign accumulators_9 = 16'h0;
  assign accumulators_10 = 16'h0;
  assign accumulators_11 = 16'h0;
  assign accumulators_12 = 16'h0;
  assign accumulators_13 = 16'h0;
  assign accumulators_14 = 16'h0;
  assign accumulators_15 = 16'h0;
  assign accumulators_16 = 16'h0;
  assign accumulators_17 = 16'h0;
  assign accumulators_18 = 16'h0;
  assign accumulators_19 = 16'h0;
  assign accumulators_20 = 16'h0;
  assign accumulators_21 = 16'h0;
  assign accumulators_22 = 16'h0;
  assign accumulators_23 = 16'h0;
  assign accumulators_24 = 16'h0;
  assign accumulators_25 = 16'h0;
  assign accumulators_26 = 16'h0;
  assign accumulators_27 = 16'h0;
  assign accumulators_28 = 16'h0;
  assign accumulators_29 = 16'h0;
  assign accumulators_30 = 16'h0;
  assign accumulators_31 = 16'h0;
  assign accumulators_32 = 16'h0;
  assign accumulators_33 = 16'h0;
  assign accumulators_34 = 16'h0;
  assign accumulators_35 = 16'h0;
  assign accumulators_36 = 16'h0;
  assign accumulators_37 = 16'h0;
  assign accumulators_38 = 16'h0;
  assign accumulators_39 = 16'h0;
  assign accumulators_40 = 16'h0;
  assign accumulators_41 = 16'h0;
  assign accumulators_42 = 16'h0;
  assign accumulators_43 = 16'h0;
  assign accumulators_44 = 16'h0;
  assign accumulators_45 = 16'h0;
  assign accumulators_46 = 16'h0;
  assign accumulators_47 = 16'h0;
  assign accumulators_48 = 16'h0;
  assign accumulators_49 = 16'h0;
  assign accumulators_50 = 16'h0;
  assign accumulators_51 = 16'h0;
  assign accumulators_52 = 16'h0;
  assign accumulators_53 = 16'h0;
  assign accumulators_54 = 16'h0;
  assign accumulators_55 = 16'h0;
  assign accumulators_56 = 16'h0;
  assign accumulators_57 = 16'h0;
  assign accumulators_58 = 16'h0;
  assign accumulators_59 = 16'h0;
  assign accumulators_60 = 16'h0;
  assign accumulators_61 = 16'h0;
  assign accumulators_62 = 16'h0;
  assign accumulators_63 = 16'h0;
  assign accumulators_64 = 16'h0;
  assign accumulators_65 = 16'h0;
  assign accumulators_66 = 16'h0;
  assign accumulators_67 = 16'h0;
  assign accumulators_68 = 16'h0;
  assign accumulators_69 = 16'h0;
  assign accumulators_70 = 16'h0;
  assign accumulators_71 = 16'h0;
  assign accumulators_72 = 16'h0;
  assign accumulators_73 = 16'h0;
  assign accumulators_74 = 16'h0;
  assign accumulators_75 = 16'h0;
  assign accumulators_76 = 16'h0;
  assign accumulators_77 = 16'h0;
  assign accumulators_78 = 16'h0;
  assign accumulators_79 = 16'h0;
  assign accumulators_80 = 16'h0;
  assign accumulators_81 = 16'h0;
  assign accumulators_82 = 16'h0;
  assign accumulators_83 = 16'h0;
  assign accumulators_84 = 16'h0;
  assign accumulators_85 = 16'h0;
  assign accumulators_86 = 16'h0;
  assign accumulators_87 = 16'h0;
  assign accumulators_88 = 16'h0;
  assign accumulators_89 = 16'h0;
  assign accumulators_90 = 16'h0;
  assign accumulators_91 = 16'h0;
  assign accumulators_92 = 16'h0;
  assign accumulators_93 = 16'h0;
  assign accumulators_94 = 16'h0;
  assign accumulators_95 = 16'h0;
  assign accumulators_96 = 16'h0;
  assign accumulators_97 = 16'h0;
  assign accumulators_98 = 16'h0;
  assign accumulators_99 = 16'h0;
  assign accumulators_100 = 16'h0;
  assign accumulators_101 = 16'h0;
  assign accumulators_102 = 16'h0;
  assign accumulators_103 = 16'h0;
  assign accumulators_104 = 16'h0;
  assign accumulators_105 = 16'h0;
  assign accumulators_106 = 16'h0;
  assign accumulators_107 = 16'h0;
  assign accumulators_108 = 16'h0;
  assign accumulators_109 = 16'h0;
  assign accumulators_110 = 16'h0;
  assign accumulators_111 = 16'h0;
  assign accumulators_112 = 16'h0;
  assign accumulators_113 = 16'h0;
  assign accumulators_114 = 16'h0;
  assign accumulators_115 = 16'h0;
  assign accumulators_116 = 16'h0;
  assign accumulators_117 = 16'h0;
  assign accumulators_118 = 16'h0;
  assign accumulators_119 = 16'h0;
  assign accumulators_120 = 16'h0;
  assign accumulators_121 = 16'h0;
  assign accumulators_122 = 16'h0;
  assign accumulators_123 = 16'h0;
  assign accumulators_124 = 16'h0;
  assign accumulators_125 = 16'h0;
  assign accumulators_126 = 16'h0;
  assign accumulators_127 = 16'h0;
  assign accumulators_128 = 16'h0;
  assign accumulators_129 = 16'h0;
  assign accumulators_130 = 16'h0;
  assign accumulators_131 = 16'h0;
  assign accumulators_132 = 16'h0;
  assign accumulators_133 = 16'h0;
  assign accumulators_134 = 16'h0;
  assign accumulators_135 = 16'h0;
  assign accumulators_136 = 16'h0;
  assign accumulators_137 = 16'h0;
  assign accumulators_138 = 16'h0;
  assign accumulators_139 = 16'h0;
  assign accumulators_140 = 16'h0;
  assign accumulators_141 = 16'h0;
  assign accumulators_142 = 16'h0;
  assign accumulators_143 = 16'h0;
  assign accumulators_144 = 16'h0;
  assign accumulators_145 = 16'h0;
  assign accumulators_146 = 16'h0;
  assign accumulators_147 = 16'h0;
  assign accumulators_148 = 16'h0;
  assign accumulators_149 = 16'h0;
  assign accumulators_150 = 16'h0;
  assign accumulators_151 = 16'h0;
  assign accumulators_152 = 16'h0;
  assign accumulators_153 = 16'h0;
  assign accumulators_154 = 16'h0;
  assign accumulators_155 = 16'h0;
  assign accumulators_156 = 16'h0;
  assign accumulators_157 = 16'h0;
  assign accumulators_158 = 16'h0;
  assign accumulators_159 = 16'h0;
  assign accumulators_160 = 16'h0;
  assign accumulators_161 = 16'h0;
  assign accumulators_162 = 16'h0;
  assign accumulators_163 = 16'h0;
  assign accumulators_164 = 16'h0;
  assign accumulators_165 = 16'h0;
  assign accumulators_166 = 16'h0;
  assign accumulators_167 = 16'h0;
  assign accumulators_168 = 16'h0;
  assign accumulators_169 = 16'h0;
  assign accumulators_170 = 16'h0;
  assign accumulators_171 = 16'h0;
  assign accumulators_172 = 16'h0;
  assign accumulators_173 = 16'h0;
  assign accumulators_174 = 16'h0;
  assign accumulators_175 = 16'h0;
  assign accumulators_176 = 16'h0;
  assign accumulators_177 = 16'h0;
  assign accumulators_178 = 16'h0;
  assign accumulators_179 = 16'h0;
  assign accumulators_180 = 16'h0;
  assign accumulators_181 = 16'h0;
  assign accumulators_182 = 16'h0;
  assign accumulators_183 = 16'h0;
  assign accumulators_184 = 16'h0;
  assign accumulators_185 = 16'h0;
  assign accumulators_186 = 16'h0;
  assign accumulators_187 = 16'h0;
  assign accumulators_188 = 16'h0;
  assign accumulators_189 = 16'h0;
  assign accumulators_190 = 16'h0;
  assign accumulators_191 = 16'h0;
  assign accumulators_192 = 16'h0;
  assign accumulators_193 = 16'h0;
  assign accumulators_194 = 16'h0;
  assign accumulators_195 = 16'h0;
  assign accumulators_196 = 16'h0;
  assign accumulators_197 = 16'h0;
  assign accumulators_198 = 16'h0;
  assign accumulators_199 = 16'h0;
  assign accumulators_200 = 16'h0;
  assign accumulators_201 = 16'h0;
  assign accumulators_202 = 16'h0;
  assign accumulators_203 = 16'h0;
  assign accumulators_204 = 16'h0;
  assign accumulators_205 = 16'h0;
  assign accumulators_206 = 16'h0;
  assign accumulators_207 = 16'h0;
  assign accumulators_208 = 16'h0;
  assign accumulators_209 = 16'h0;
  assign accumulators_210 = 16'h0;
  assign accumulators_211 = 16'h0;
  assign accumulators_212 = 16'h0;
  assign accumulators_213 = 16'h0;
  assign accumulators_214 = 16'h0;
  assign accumulators_215 = 16'h0;
  assign accumulators_216 = 16'h0;
  assign accumulators_217 = 16'h0;
  assign accumulators_218 = 16'h0;
  assign accumulators_219 = 16'h0;
  assign accumulators_220 = 16'h0;
  assign accumulators_221 = 16'h0;
  assign accumulators_222 = 16'h0;
  assign accumulators_223 = 16'h0;
  assign accumulators_224 = 16'h0;
  assign accumulators_225 = 16'h0;
  assign accumulators_226 = 16'h0;
  assign accumulators_227 = 16'h0;
  assign accumulators_228 = 16'h0;
  assign accumulators_229 = 16'h0;
  assign accumulators_230 = 16'h0;
  assign accumulators_231 = 16'h0;
  assign accumulators_232 = 16'h0;
  assign accumulators_233 = 16'h0;
  assign accumulators_234 = 16'h0;
  assign accumulators_235 = 16'h0;
  assign accumulators_236 = 16'h0;
  assign accumulators_237 = 16'h0;
  assign accumulators_238 = 16'h0;
  assign accumulators_239 = 16'h0;
  assign accumulators_240 = 16'h0;
  assign accumulators_241 = 16'h0;
  assign accumulators_242 = 16'h0;
  assign accumulators_243 = 16'h0;
  assign accumulators_244 = 16'h0;
  assign accumulators_245 = 16'h0;
  assign accumulators_246 = 16'h0;
  assign accumulators_247 = 16'h0;
  assign accumulators_248 = 16'h0;
  assign accumulators_249 = 16'h0;
  assign accumulators_250 = 16'h0;
  assign accumulators_251 = 16'h0;
  assign accumulators_252 = 16'h0;
  assign accumulators_253 = 16'h0;
  assign accumulators_254 = 16'h0;
  assign accumulators_255 = 16'h0;
  assign accumulators_256 = 16'h0;
  assign accumulators_257 = 16'h0;
  assign accumulators_258 = 16'h0;
  assign accumulators_259 = 16'h0;
  assign accumulators_260 = 16'h0;
  assign accumulators_261 = 16'h0;
  assign accumulators_262 = 16'h0;
  assign accumulators_263 = 16'h0;
  assign accumulators_264 = 16'h0;
  assign accumulators_265 = 16'h0;
  assign accumulators_266 = 16'h0;
  assign accumulators_267 = 16'h0;
  assign accumulators_268 = 16'h0;
  assign accumulators_269 = 16'h0;
  assign accumulators_270 = 16'h0;
  assign accumulators_271 = 16'h0;
  assign accumulators_272 = 16'h0;
  assign accumulators_273 = 16'h0;
  assign accumulators_274 = 16'h0;
  assign accumulators_275 = 16'h0;
  assign accumulators_276 = 16'h0;
  assign accumulators_277 = 16'h0;
  assign accumulators_278 = 16'h0;
  assign accumulators_279 = 16'h0;
  assign accumulators_280 = 16'h0;
  assign accumulators_281 = 16'h0;
  assign accumulators_282 = 16'h0;
  assign accumulators_283 = 16'h0;
  assign accumulators_284 = 16'h0;
  assign accumulators_285 = 16'h0;
  assign accumulators_286 = 16'h0;
  assign accumulators_287 = 16'h0;
  assign accumulators_288 = 16'h0;
  assign accumulators_289 = 16'h0;
  assign accumulators_290 = 16'h0;
  assign accumulators_291 = 16'h0;
  assign accumulators_292 = 16'h0;
  assign accumulators_293 = 16'h0;
  assign accumulators_294 = 16'h0;
  assign accumulators_295 = 16'h0;
  assign accumulators_296 = 16'h0;
  assign accumulators_297 = 16'h0;
  assign accumulators_298 = 16'h0;
  assign accumulators_299 = 16'h0;
  assign accumulators_300 = 16'h0;
  assign accumulators_301 = 16'h0;
  assign accumulators_302 = 16'h0;
  assign accumulators_303 = 16'h0;
  assign accumulators_304 = 16'h0;
  assign accumulators_305 = 16'h0;
  assign accumulators_306 = 16'h0;
  assign accumulators_307 = 16'h0;
  assign accumulators_308 = 16'h0;
  assign accumulators_309 = 16'h0;
  assign accumulators_310 = 16'h0;
  assign accumulators_311 = 16'h0;
  assign accumulators_312 = 16'h0;
  assign accumulators_313 = 16'h0;
  assign accumulators_314 = 16'h0;
  assign accumulators_315 = 16'h0;
  assign accumulators_316 = 16'h0;
  assign accumulators_317 = 16'h0;
  assign accumulators_318 = 16'h0;
  assign accumulators_319 = 16'h0;
  assign accumulators_320 = 16'h0;
  assign accumulators_321 = 16'h0;
  assign accumulators_322 = 16'h0;
  assign accumulators_323 = 16'h0;
  assign accumulators_324 = 16'h0;
  assign accumulators_325 = 16'h0;
  assign accumulators_326 = 16'h0;
  assign accumulators_327 = 16'h0;
  assign accumulators_328 = 16'h0;
  assign accumulators_329 = 16'h0;
  assign accumulators_330 = 16'h0;
  assign accumulators_331 = 16'h0;
  assign accumulators_332 = 16'h0;
  assign accumulators_333 = 16'h0;
  assign accumulators_334 = 16'h0;
  assign accumulators_335 = 16'h0;
  assign accumulators_336 = 16'h0;
  assign accumulators_337 = 16'h0;
  assign accumulators_338 = 16'h0;
  assign accumulators_339 = 16'h0;
  assign accumulators_340 = 16'h0;
  assign accumulators_341 = 16'h0;
  assign accumulators_342 = 16'h0;
  assign accumulators_343 = 16'h0;
  assign accumulators_344 = 16'h0;
  assign accumulators_345 = 16'h0;
  assign accumulators_346 = 16'h0;
  assign accumulators_347 = 16'h0;
  assign accumulators_348 = 16'h0;
  assign accumulators_349 = 16'h0;
  assign accumulators_350 = 16'h0;
  assign accumulators_351 = 16'h0;
  assign accumulators_352 = 16'h0;
  assign accumulators_353 = 16'h0;
  assign accumulators_354 = 16'h0;
  assign accumulators_355 = 16'h0;
  assign accumulators_356 = 16'h0;
  assign accumulators_357 = 16'h0;
  assign accumulators_358 = 16'h0;
  assign accumulators_359 = 16'h0;
  assign accumulators_360 = 16'h0;
  assign accumulators_361 = 16'h0;
  assign accumulators_362 = 16'h0;
  assign accumulators_363 = 16'h0;
  assign accumulators_364 = 16'h0;
  assign accumulators_365 = 16'h0;
  assign accumulators_366 = 16'h0;
  assign accumulators_367 = 16'h0;
  assign accumulators_368 = 16'h0;
  assign accumulators_369 = 16'h0;
  assign accumulators_370 = 16'h0;
  assign accumulators_371 = 16'h0;
  assign accumulators_372 = 16'h0;
  assign accumulators_373 = 16'h0;
  assign accumulators_374 = 16'h0;
  assign accumulators_375 = 16'h0;
  assign accumulators_376 = 16'h0;
  assign accumulators_377 = 16'h0;
  assign accumulators_378 = 16'h0;
  assign accumulators_379 = 16'h0;
  assign accumulators_380 = 16'h0;
  assign accumulators_381 = 16'h0;
  assign accumulators_382 = 16'h0;
  assign accumulators_383 = 16'h0;
  assign accumulators_384 = 16'h0;
  assign accumulators_385 = 16'h0;
  assign accumulators_386 = 16'h0;
  assign accumulators_387 = 16'h0;
  assign accumulators_388 = 16'h0;
  assign accumulators_389 = 16'h0;
  assign accumulators_390 = 16'h0;
  assign accumulators_391 = 16'h0;
  assign accumulators_392 = 16'h0;
  assign accumulators_393 = 16'h0;
  assign accumulators_394 = 16'h0;
  assign accumulators_395 = 16'h0;
  assign accumulators_396 = 16'h0;
  assign accumulators_397 = 16'h0;
  assign accumulators_398 = 16'h0;
  assign accumulators_399 = 16'h0;
  assign accumulators_400 = 16'h0;
  assign accumulators_401 = 16'h0;
  assign accumulators_402 = 16'h0;
  assign accumulators_403 = 16'h0;
  assign accumulators_404 = 16'h0;
  assign accumulators_405 = 16'h0;
  assign accumulators_406 = 16'h0;
  assign accumulators_407 = 16'h0;
  assign accumulators_408 = 16'h0;
  assign accumulators_409 = 16'h0;
  assign accumulators_410 = 16'h0;
  assign accumulators_411 = 16'h0;
  assign accumulators_412 = 16'h0;
  assign accumulators_413 = 16'h0;
  assign accumulators_414 = 16'h0;
  assign accumulators_415 = 16'h0;
  assign accumulators_416 = 16'h0;
  assign accumulators_417 = 16'h0;
  assign accumulators_418 = 16'h0;
  assign accumulators_419 = 16'h0;
  assign accumulators_420 = 16'h0;
  assign accumulators_421 = 16'h0;
  assign accumulators_422 = 16'h0;
  assign accumulators_423 = 16'h0;
  assign accumulators_424 = 16'h0;
  assign accumulators_425 = 16'h0;
  assign accumulators_426 = 16'h0;
  assign accumulators_427 = 16'h0;
  assign accumulators_428 = 16'h0;
  assign accumulators_429 = 16'h0;
  assign accumulators_430 = 16'h0;
  assign accumulators_431 = 16'h0;
  assign accumulators_432 = 16'h0;
  assign accumulators_433 = 16'h0;
  assign accumulators_434 = 16'h0;
  assign accumulators_435 = 16'h0;
  assign accumulators_436 = 16'h0;
  assign accumulators_437 = 16'h0;
  assign accumulators_438 = 16'h0;
  assign accumulators_439 = 16'h0;
  assign accumulators_440 = 16'h0;
  assign accumulators_441 = 16'h0;
  assign accumulators_442 = 16'h0;
  assign accumulators_443 = 16'h0;
  assign accumulators_444 = 16'h0;
  assign accumulators_445 = 16'h0;
  assign accumulators_446 = 16'h0;
  assign accumulators_447 = 16'h0;
  assign accumulators_448 = 16'h0;
  assign accumulators_449 = 16'h0;
  assign accumulators_450 = 16'h0;
  assign accumulators_451 = 16'h0;
  assign accumulators_452 = 16'h0;
  assign accumulators_453 = 16'h0;
  assign accumulators_454 = 16'h0;
  assign accumulators_455 = 16'h0;
  assign accumulators_456 = 16'h0;
  assign accumulators_457 = 16'h0;
  assign accumulators_458 = 16'h0;
  assign accumulators_459 = 16'h0;
  assign accumulators_460 = 16'h0;
  assign accumulators_461 = 16'h0;
  assign accumulators_462 = 16'h0;
  assign accumulators_463 = 16'h0;
  assign accumulators_464 = 16'h0;
  assign accumulators_465 = 16'h0;
  assign accumulators_466 = 16'h0;
  assign accumulators_467 = 16'h0;
  assign accumulators_468 = 16'h0;
  assign accumulators_469 = 16'h0;
  assign accumulators_470 = 16'h0;
  assign accumulators_471 = 16'h0;
  assign accumulators_472 = 16'h0;
  assign accumulators_473 = 16'h0;
  assign accumulators_474 = 16'h0;
  assign accumulators_475 = 16'h0;
  assign accumulators_476 = 16'h0;
  assign accumulators_477 = 16'h0;
  assign accumulators_478 = 16'h0;
  assign accumulators_479 = 16'h0;
  assign accumulators_480 = 16'h0;
  assign accumulators_481 = 16'h0;
  assign accumulators_482 = 16'h0;
  assign accumulators_483 = 16'h0;
  assign accumulators_484 = 16'h0;
  assign accumulators_485 = 16'h0;
  assign accumulators_486 = 16'h0;
  assign accumulators_487 = 16'h0;
  assign accumulators_488 = 16'h0;
  assign accumulators_489 = 16'h0;
  assign accumulators_490 = 16'h0;
  assign accumulators_491 = 16'h0;
  assign accumulators_492 = 16'h0;
  assign accumulators_493 = 16'h0;
  assign accumulators_494 = 16'h0;
  assign accumulators_495 = 16'h0;
  assign accumulators_496 = 16'h0;
  assign accumulators_497 = 16'h0;
  assign accumulators_498 = 16'h0;
  assign accumulators_499 = 16'h0;
  assign accumulators_500 = 16'h0;
  assign accumulators_501 = 16'h0;
  assign accumulators_502 = 16'h0;
  assign accumulators_503 = 16'h0;
  assign accumulators_504 = 16'h0;
  assign accumulators_505 = 16'h0;
  assign accumulators_506 = 16'h0;
  assign accumulators_507 = 16'h0;
  assign accumulators_508 = 16'h0;
  assign accumulators_509 = 16'h0;
  assign accumulators_510 = 16'h0;
  assign accumulators_511 = 16'h0;
  assign accumulators_512 = 16'h0;
  assign accumulators_513 = 16'h0;
  assign accumulators_514 = 16'h0;
  assign accumulators_515 = 16'h0;
  assign accumulators_516 = 16'h0;
  assign accumulators_517 = 16'h0;
  assign accumulators_518 = 16'h0;
  assign accumulators_519 = 16'h0;
  assign accumulators_520 = 16'h0;
  assign accumulators_521 = 16'h0;
  assign accumulators_522 = 16'h0;
  assign accumulators_523 = 16'h0;
  assign accumulators_524 = 16'h0;
  assign accumulators_525 = 16'h0;
  assign accumulators_526 = 16'h0;
  assign accumulators_527 = 16'h0;
  assign accumulators_528 = 16'h0;
  assign accumulators_529 = 16'h0;
  assign accumulators_530 = 16'h0;
  assign accumulators_531 = 16'h0;
  assign accumulators_532 = 16'h0;
  assign accumulators_533 = 16'h0;
  assign accumulators_534 = 16'h0;
  assign accumulators_535 = 16'h0;
  assign accumulators_536 = 16'h0;
  assign accumulators_537 = 16'h0;
  assign accumulators_538 = 16'h0;
  assign accumulators_539 = 16'h0;
  assign accumulators_540 = 16'h0;
  assign accumulators_541 = 16'h0;
  assign accumulators_542 = 16'h0;
  assign accumulators_543 = 16'h0;
  assign accumulators_544 = 16'h0;
  assign accumulators_545 = 16'h0;
  assign accumulators_546 = 16'h0;
  assign accumulators_547 = 16'h0;
  assign accumulators_548 = 16'h0;
  assign accumulators_549 = 16'h0;
  assign accumulators_550 = 16'h0;
  assign accumulators_551 = 16'h0;
  assign accumulators_552 = 16'h0;
  assign accumulators_553 = 16'h0;
  assign accumulators_554 = 16'h0;
  assign accumulators_555 = 16'h0;
  assign accumulators_556 = 16'h0;
  assign accumulators_557 = 16'h0;
  assign accumulators_558 = 16'h0;
  assign accumulators_559 = 16'h0;
  assign accumulators_560 = 16'h0;
  assign accumulators_561 = 16'h0;
  assign accumulators_562 = 16'h0;
  assign accumulators_563 = 16'h0;
  assign accumulators_564 = 16'h0;
  assign accumulators_565 = 16'h0;
  assign accumulators_566 = 16'h0;
  assign accumulators_567 = 16'h0;
  assign accumulators_568 = 16'h0;
  assign accumulators_569 = 16'h0;
  assign accumulators_570 = 16'h0;
  assign accumulators_571 = 16'h0;
  assign accumulators_572 = 16'h0;
  assign accumulators_573 = 16'h0;
  assign accumulators_574 = 16'h0;
  assign accumulators_575 = 16'h0;
  assign accumulators_576 = 16'h0;
  assign accumulators_577 = 16'h0;
  assign accumulators_578 = 16'h0;
  assign accumulators_579 = 16'h0;
  assign accumulators_580 = 16'h0;
  assign accumulators_581 = 16'h0;
  assign accumulators_582 = 16'h0;
  assign accumulators_583 = 16'h0;
  assign accumulators_584 = 16'h0;
  assign accumulators_585 = 16'h0;
  assign accumulators_586 = 16'h0;
  assign accumulators_587 = 16'h0;
  assign accumulators_588 = 16'h0;
  assign accumulators_589 = 16'h0;
  assign accumulators_590 = 16'h0;
  assign accumulators_591 = 16'h0;
  assign accumulators_592 = 16'h0;
  assign accumulators_593 = 16'h0;
  assign accumulators_594 = 16'h0;
  assign accumulators_595 = 16'h0;
  assign accumulators_596 = 16'h0;
  assign accumulators_597 = 16'h0;
  assign accumulators_598 = 16'h0;
  assign accumulators_599 = 16'h0;
  assign accumulators_600 = 16'h0;
  assign accumulators_601 = 16'h0;
  assign accumulators_602 = 16'h0;
  assign accumulators_603 = 16'h0;
  assign accumulators_604 = 16'h0;
  assign accumulators_605 = 16'h0;
  assign accumulators_606 = 16'h0;
  assign accumulators_607 = 16'h0;
  assign accumulators_608 = 16'h0;
  assign accumulators_609 = 16'h0;
  assign accumulators_610 = 16'h0;
  assign accumulators_611 = 16'h0;
  assign accumulators_612 = 16'h0;
  assign accumulators_613 = 16'h0;
  assign accumulators_614 = 16'h0;
  assign accumulators_615 = 16'h0;
  assign accumulators_616 = 16'h0;
  assign accumulators_617 = 16'h0;
  assign accumulators_618 = 16'h0;
  assign accumulators_619 = 16'h0;
  assign accumulators_620 = 16'h0;
  assign accumulators_621 = 16'h0;
  assign accumulators_622 = 16'h0;
  assign accumulators_623 = 16'h0;
  assign accumulators_624 = 16'h0;
  assign accumulators_625 = 16'h0;
  assign accumulators_626 = 16'h0;
  assign accumulators_627 = 16'h0;
  assign accumulators_628 = 16'h0;
  assign accumulators_629 = 16'h0;
  assign accumulators_630 = 16'h0;
  assign accumulators_631 = 16'h0;
  assign accumulators_632 = 16'h0;
  assign accumulators_633 = 16'h0;
  assign accumulators_634 = 16'h0;
  assign accumulators_635 = 16'h0;
  assign accumulators_636 = 16'h0;
  assign accumulators_637 = 16'h0;
  assign accumulators_638 = 16'h0;
  assign accumulators_639 = 16'h0;
  assign accumulators_640 = 16'h0;
  assign accumulators_641 = 16'h0;
  assign accumulators_642 = 16'h0;
  assign accumulators_643 = 16'h0;
  assign accumulators_644 = 16'h0;
  assign accumulators_645 = 16'h0;
  assign accumulators_646 = 16'h0;
  assign accumulators_647 = 16'h0;
  assign accumulators_648 = 16'h0;
  assign accumulators_649 = 16'h0;
  assign accumulators_650 = 16'h0;
  assign accumulators_651 = 16'h0;
  assign accumulators_652 = 16'h0;
  assign accumulators_653 = 16'h0;
  assign accumulators_654 = 16'h0;
  assign accumulators_655 = 16'h0;
  assign accumulators_656 = 16'h0;
  assign accumulators_657 = 16'h0;
  assign accumulators_658 = 16'h0;
  assign accumulators_659 = 16'h0;
  assign accumulators_660 = 16'h0;
  assign accumulators_661 = 16'h0;
  assign accumulators_662 = 16'h0;
  assign accumulators_663 = 16'h0;
  assign accumulators_664 = 16'h0;
  assign accumulators_665 = 16'h0;
  assign accumulators_666 = 16'h0;
  assign accumulators_667 = 16'h0;
  assign accumulators_668 = 16'h0;
  assign accumulators_669 = 16'h0;
  assign accumulators_670 = 16'h0;
  assign accumulators_671 = 16'h0;
  assign accumulators_672 = 16'h0;
  assign accumulators_673 = 16'h0;
  assign accumulators_674 = 16'h0;
  assign accumulators_675 = 16'h0;
  assign accumulators_676 = 16'h0;
  assign accumulators_677 = 16'h0;
  assign accumulators_678 = 16'h0;
  assign accumulators_679 = 16'h0;
  assign accumulators_680 = 16'h0;
  assign accumulators_681 = 16'h0;
  assign accumulators_682 = 16'h0;
  assign accumulators_683 = 16'h0;
  assign accumulators_684 = 16'h0;
  assign accumulators_685 = 16'h0;
  assign accumulators_686 = 16'h0;
  assign accumulators_687 = 16'h0;
  assign accumulators_688 = 16'h0;
  assign accumulators_689 = 16'h0;
  assign accumulators_690 = 16'h0;
  assign accumulators_691 = 16'h0;
  assign accumulators_692 = 16'h0;
  assign accumulators_693 = 16'h0;
  assign accumulators_694 = 16'h0;
  assign accumulators_695 = 16'h0;
  assign accumulators_696 = 16'h0;
  assign accumulators_697 = 16'h0;
  assign accumulators_698 = 16'h0;
  assign accumulators_699 = 16'h0;
  assign accumulators_700 = 16'h0;
  assign accumulators_701 = 16'h0;
  assign accumulators_702 = 16'h0;
  assign accumulators_703 = 16'h0;
  assign accumulators_704 = 16'h0;
  assign accumulators_705 = 16'h0;
  assign accumulators_706 = 16'h0;
  assign accumulators_707 = 16'h0;
  assign accumulators_708 = 16'h0;
  assign accumulators_709 = 16'h0;
  assign accumulators_710 = 16'h0;
  assign accumulators_711 = 16'h0;
  assign accumulators_712 = 16'h0;
  assign accumulators_713 = 16'h0;
  assign accumulators_714 = 16'h0;
  assign accumulators_715 = 16'h0;
  assign accumulators_716 = 16'h0;
  assign accumulators_717 = 16'h0;
  assign accumulators_718 = 16'h0;
  assign accumulators_719 = 16'h0;
  assign accumulators_720 = 16'h0;
  assign accumulators_721 = 16'h0;
  assign accumulators_722 = 16'h0;
  assign accumulators_723 = 16'h0;
  assign accumulators_724 = 16'h0;
  assign accumulators_725 = 16'h0;
  assign accumulators_726 = 16'h0;
  assign accumulators_727 = 16'h0;
  assign accumulators_728 = 16'h0;
  assign accumulators_729 = 16'h0;
  assign accumulators_730 = 16'h0;
  assign accumulators_731 = 16'h0;
  assign accumulators_732 = 16'h0;
  assign accumulators_733 = 16'h0;
  assign accumulators_734 = 16'h0;
  assign accumulators_735 = 16'h0;
  assign accumulators_736 = 16'h0;
  assign accumulators_737 = 16'h0;
  assign accumulators_738 = 16'h0;
  assign accumulators_739 = 16'h0;
  assign accumulators_740 = 16'h0;
  assign accumulators_741 = 16'h0;
  assign accumulators_742 = 16'h0;
  assign accumulators_743 = 16'h0;
  assign accumulators_744 = 16'h0;
  assign accumulators_745 = 16'h0;
  assign accumulators_746 = 16'h0;
  assign accumulators_747 = 16'h0;
  assign accumulators_748 = 16'h0;
  assign accumulators_749 = 16'h0;
  assign accumulators_750 = 16'h0;
  assign accumulators_751 = 16'h0;
  assign accumulators_752 = 16'h0;
  assign accumulators_753 = 16'h0;
  assign accumulators_754 = 16'h0;
  assign accumulators_755 = 16'h0;
  assign accumulators_756 = 16'h0;
  assign accumulators_757 = 16'h0;
  assign accumulators_758 = 16'h0;
  assign accumulators_759 = 16'h0;
  assign accumulators_760 = 16'h0;
  assign accumulators_761 = 16'h0;
  assign accumulators_762 = 16'h0;
  assign accumulators_763 = 16'h0;
  assign accumulators_764 = 16'h0;
  assign accumulators_765 = 16'h0;
  assign accumulators_766 = 16'h0;
  assign accumulators_767 = 16'h0;
  assign accumulators_768 = 16'h0;
  assign accumulators_769 = 16'h0;
  assign accumulators_770 = 16'h0;
  assign accumulators_771 = 16'h0;
  assign accumulators_772 = 16'h0;
  assign accumulators_773 = 16'h0;
  assign accumulators_774 = 16'h0;
  assign accumulators_775 = 16'h0;
  assign accumulators_776 = 16'h0;
  assign accumulators_777 = 16'h0;
  assign accumulators_778 = 16'h0;
  assign accumulators_779 = 16'h0;
  assign accumulators_780 = 16'h0;
  assign accumulators_781 = 16'h0;
  assign accumulators_782 = 16'h0;
  assign accumulators_783 = 16'h0;
  assign accumulators_784 = 16'h0;
  assign accumulators_785 = 16'h0;
  assign accumulators_786 = 16'h0;
  assign accumulators_787 = 16'h0;
  assign accumulators_788 = 16'h0;
  assign accumulators_789 = 16'h0;
  assign accumulators_790 = 16'h0;
  assign accumulators_791 = 16'h0;
  assign accumulators_792 = 16'h0;
  assign accumulators_793 = 16'h0;
  assign accumulators_794 = 16'h0;
  assign accumulators_795 = 16'h0;
  assign accumulators_796 = 16'h0;
  assign accumulators_797 = 16'h0;
  assign accumulators_798 = 16'h0;
  assign accumulators_799 = 16'h0;
  assign accumulators_800 = 16'h0;
  assign accumulators_801 = 16'h0;
  assign accumulators_802 = 16'h0;
  assign accumulators_803 = 16'h0;
  assign accumulators_804 = 16'h0;
  assign accumulators_805 = 16'h0;
  assign accumulators_806 = 16'h0;
  assign accumulators_807 = 16'h0;
  assign accumulators_808 = 16'h0;
  assign accumulators_809 = 16'h0;
  assign accumulators_810 = 16'h0;
  assign accumulators_811 = 16'h0;
  assign accumulators_812 = 16'h0;
  assign accumulators_813 = 16'h0;
  assign accumulators_814 = 16'h0;
  assign accumulators_815 = 16'h0;
  assign accumulators_816 = 16'h0;
  assign accumulators_817 = 16'h0;
  assign accumulators_818 = 16'h0;
  assign accumulators_819 = 16'h0;
  assign accumulators_820 = 16'h0;
  assign accumulators_821 = 16'h0;
  assign accumulators_822 = 16'h0;
  assign accumulators_823 = 16'h0;
  assign accumulators_824 = 16'h0;
  assign accumulators_825 = 16'h0;
  assign accumulators_826 = 16'h0;
  assign accumulators_827 = 16'h0;
  assign accumulators_828 = 16'h0;
  assign accumulators_829 = 16'h0;
  assign accumulators_830 = 16'h0;
  assign accumulators_831 = 16'h0;
  assign accumulators_832 = 16'h0;
  assign accumulators_833 = 16'h0;
  assign accumulators_834 = 16'h0;
  assign accumulators_835 = 16'h0;
  assign accumulators_836 = 16'h0;
  assign accumulators_837 = 16'h0;
  assign accumulators_838 = 16'h0;
  assign accumulators_839 = 16'h0;
  assign accumulators_840 = 16'h0;
  assign accumulators_841 = 16'h0;
  assign accumulators_842 = 16'h0;
  assign accumulators_843 = 16'h0;
  assign accumulators_844 = 16'h0;
  assign accumulators_845 = 16'h0;
  assign accumulators_846 = 16'h0;
  assign accumulators_847 = 16'h0;
  assign accumulators_848 = 16'h0;
  assign accumulators_849 = 16'h0;
  assign accumulators_850 = 16'h0;
  assign accumulators_851 = 16'h0;
  assign accumulators_852 = 16'h0;
  assign accumulators_853 = 16'h0;
  assign accumulators_854 = 16'h0;
  assign accumulators_855 = 16'h0;
  assign accumulators_856 = 16'h0;
  assign accumulators_857 = 16'h0;
  assign accumulators_858 = 16'h0;
  assign accumulators_859 = 16'h0;
  assign accumulators_860 = 16'h0;
  assign accumulators_861 = 16'h0;
  assign accumulators_862 = 16'h0;
  assign accumulators_863 = 16'h0;
  assign accumulators_864 = 16'h0;
  assign accumulators_865 = 16'h0;
  assign accumulators_866 = 16'h0;
  assign accumulators_867 = 16'h0;
  assign accumulators_868 = 16'h0;
  assign accumulators_869 = 16'h0;
  assign accumulators_870 = 16'h0;
  assign accumulators_871 = 16'h0;
  assign accumulators_872 = 16'h0;
  assign accumulators_873 = 16'h0;
  assign accumulators_874 = 16'h0;
  assign accumulators_875 = 16'h0;
  assign accumulators_876 = 16'h0;
  assign accumulators_877 = 16'h0;
  assign accumulators_878 = 16'h0;
  assign accumulators_879 = 16'h0;
  assign accumulators_880 = 16'h0;
  assign accumulators_881 = 16'h0;
  assign accumulators_882 = 16'h0;
  assign accumulators_883 = 16'h0;
  assign accumulators_884 = 16'h0;
  assign accumulators_885 = 16'h0;
  assign accumulators_886 = 16'h0;
  assign accumulators_887 = 16'h0;
  assign accumulators_888 = 16'h0;
  assign accumulators_889 = 16'h0;
  assign accumulators_890 = 16'h0;
  assign accumulators_891 = 16'h0;
  assign accumulators_892 = 16'h0;
  assign accumulators_893 = 16'h0;
  assign accumulators_894 = 16'h0;
  assign accumulators_895 = 16'h0;
  assign accumulators_896 = 16'h0;
  assign accumulators_897 = 16'h0;
  assign accumulators_898 = 16'h0;
  assign accumulators_899 = 16'h0;
  assign accumulators_900 = 16'h0;
  assign accumulators_901 = 16'h0;
  assign accumulators_902 = 16'h0;
  assign accumulators_903 = 16'h0;
  assign accumulators_904 = 16'h0;
  assign accumulators_905 = 16'h0;
  assign accumulators_906 = 16'h0;
  assign accumulators_907 = 16'h0;
  assign accumulators_908 = 16'h0;
  assign accumulators_909 = 16'h0;
  assign accumulators_910 = 16'h0;
  assign accumulators_911 = 16'h0;
  assign accumulators_912 = 16'h0;
  assign accumulators_913 = 16'h0;
  assign accumulators_914 = 16'h0;
  assign accumulators_915 = 16'h0;
  assign accumulators_916 = 16'h0;
  assign accumulators_917 = 16'h0;
  assign accumulators_918 = 16'h0;
  assign accumulators_919 = 16'h0;
  assign accumulators_920 = 16'h0;
  assign accumulators_921 = 16'h0;
  assign accumulators_922 = 16'h0;
  assign accumulators_923 = 16'h0;
  assign accumulators_924 = 16'h0;
  assign accumulators_925 = 16'h0;
  assign accumulators_926 = 16'h0;
  assign accumulators_927 = 16'h0;
  assign accumulators_928 = 16'h0;
  assign accumulators_929 = 16'h0;
  assign accumulators_930 = 16'h0;
  assign accumulators_931 = 16'h0;
  assign accumulators_932 = 16'h0;
  assign accumulators_933 = 16'h0;
  assign accumulators_934 = 16'h0;
  assign accumulators_935 = 16'h0;
  assign accumulators_936 = 16'h0;
  assign accumulators_937 = 16'h0;
  assign accumulators_938 = 16'h0;
  assign accumulators_939 = 16'h0;
  assign accumulators_940 = 16'h0;
  assign accumulators_941 = 16'h0;
  assign accumulators_942 = 16'h0;
  assign accumulators_943 = 16'h0;
  assign accumulators_944 = 16'h0;
  assign accumulators_945 = 16'h0;
  assign accumulators_946 = 16'h0;
  assign accumulators_947 = 16'h0;
  assign accumulators_948 = 16'h0;
  assign accumulators_949 = 16'h0;
  assign accumulators_950 = 16'h0;
  assign accumulators_951 = 16'h0;
  assign accumulators_952 = 16'h0;
  assign accumulators_953 = 16'h0;
  assign accumulators_954 = 16'h0;
  assign accumulators_955 = 16'h0;
  assign accumulators_956 = 16'h0;
  assign accumulators_957 = 16'h0;
  assign accumulators_958 = 16'h0;
  assign accumulators_959 = 16'h0;
  assign accumulators_960 = 16'h0;
  assign accumulators_961 = 16'h0;
  assign accumulators_962 = 16'h0;
  assign accumulators_963 = 16'h0;
  assign accumulators_964 = 16'h0;
  assign accumulators_965 = 16'h0;
  assign accumulators_966 = 16'h0;
  assign accumulators_967 = 16'h0;
  assign accumulators_968 = 16'h0;
  assign accumulators_969 = 16'h0;
  assign accumulators_970 = 16'h0;
  assign accumulators_971 = 16'h0;
  assign accumulators_972 = 16'h0;
  assign accumulators_973 = 16'h0;
  assign accumulators_974 = 16'h0;
  assign accumulators_975 = 16'h0;
  assign accumulators_976 = 16'h0;
  assign accumulators_977 = 16'h0;
  assign accumulators_978 = 16'h0;
  assign accumulators_979 = 16'h0;
  assign accumulators_980 = 16'h0;
  assign accumulators_981 = 16'h0;
  assign accumulators_982 = 16'h0;
  assign accumulators_983 = 16'h0;
  assign accumulators_984 = 16'h0;
  assign accumulators_985 = 16'h0;
  assign accumulators_986 = 16'h0;
  assign accumulators_987 = 16'h0;
  assign accumulators_988 = 16'h0;
  assign accumulators_989 = 16'h0;
  assign accumulators_990 = 16'h0;
  assign accumulators_991 = 16'h0;
  assign accumulators_992 = 16'h0;
  assign accumulators_993 = 16'h0;
  assign accumulators_994 = 16'h0;
  assign accumulators_995 = 16'h0;
  assign accumulators_996 = 16'h0;
  assign accumulators_997 = 16'h0;
  assign accumulators_998 = 16'h0;
  assign accumulators_999 = 16'h0;
  assign accumulators_1000 = 16'h0;
  assign accumulators_1001 = 16'h0;
  assign accumulators_1002 = 16'h0;
  assign accumulators_1003 = 16'h0;
  assign accumulators_1004 = 16'h0;
  assign accumulators_1005 = 16'h0;
  assign accumulators_1006 = 16'h0;
  assign accumulators_1007 = 16'h0;
  assign accumulators_1008 = 16'h0;
  assign accumulators_1009 = 16'h0;
  assign accumulators_1010 = 16'h0;
  assign accumulators_1011 = 16'h0;
  assign accumulators_1012 = 16'h0;
  assign accumulators_1013 = 16'h0;
  assign accumulators_1014 = 16'h0;
  assign accumulators_1015 = 16'h0;
  assign accumulators_1016 = 16'h0;
  assign accumulators_1017 = 16'h0;
  assign accumulators_1018 = 16'h0;
  assign accumulators_1019 = 16'h0;
  assign accumulators_1020 = 16'h0;
  assign accumulators_1021 = 16'h0;
  assign accumulators_1022 = 16'h0;
  assign accumulators_1023 = 16'h0;
  assign accumulators_1024 = 16'h0;
  assign accumulators_1025 = 16'h0;
  assign accumulators_1026 = 16'h0;
  assign accumulators_1027 = 16'h0;
  assign accumulators_1028 = 16'h0;
  assign accumulators_1029 = 16'h0;
  assign accumulators_1030 = 16'h0;
  assign accumulators_1031 = 16'h0;
  assign accumulators_1032 = 16'h0;
  assign accumulators_1033 = 16'h0;
  assign accumulators_1034 = 16'h0;
  assign accumulators_1035 = 16'h0;
  assign accumulators_1036 = 16'h0;
  assign accumulators_1037 = 16'h0;
  assign accumulators_1038 = 16'h0;
  assign accumulators_1039 = 16'h0;
  assign accumulators_1040 = 16'h0;
  assign accumulators_1041 = 16'h0;
  assign accumulators_1042 = 16'h0;
  assign accumulators_1043 = 16'h0;
  assign accumulators_1044 = 16'h0;
  assign accumulators_1045 = 16'h0;
  assign accumulators_1046 = 16'h0;
  assign accumulators_1047 = 16'h0;
  assign accumulators_1048 = 16'h0;
  assign accumulators_1049 = 16'h0;
  assign accumulators_1050 = 16'h0;
  assign accumulators_1051 = 16'h0;
  assign accumulators_1052 = 16'h0;
  assign accumulators_1053 = 16'h0;
  assign accumulators_1054 = 16'h0;
  assign accumulators_1055 = 16'h0;
  assign accumulators_1056 = 16'h0;
  assign accumulators_1057 = 16'h0;
  assign accumulators_1058 = 16'h0;
  assign accumulators_1059 = 16'h0;
  assign accumulators_1060 = 16'h0;
  assign accumulators_1061 = 16'h0;
  assign accumulators_1062 = 16'h0;
  assign accumulators_1063 = 16'h0;
  assign accumulators_1064 = 16'h0;
  assign accumulators_1065 = 16'h0;
  assign accumulators_1066 = 16'h0;
  assign accumulators_1067 = 16'h0;
  assign accumulators_1068 = 16'h0;
  assign accumulators_1069 = 16'h0;
  assign accumulators_1070 = 16'h0;
  assign accumulators_1071 = 16'h0;
  assign accumulators_1072 = 16'h0;
  assign accumulators_1073 = 16'h0;
  assign accumulators_1074 = 16'h0;
  assign accumulators_1075 = 16'h0;
  assign accumulators_1076 = 16'h0;
  assign accumulators_1077 = 16'h0;
  assign accumulators_1078 = 16'h0;
  assign accumulators_1079 = 16'h0;
  assign accumulators_1080 = 16'h0;
  assign accumulators_1081 = 16'h0;
  assign accumulators_1082 = 16'h0;
  assign accumulators_1083 = 16'h0;
  assign accumulators_1084 = 16'h0;
  assign accumulators_1085 = 16'h0;
  assign accumulators_1086 = 16'h0;
  assign accumulators_1087 = 16'h0;
  assign accumulators_1088 = 16'h0;
  assign accumulators_1089 = 16'h0;
  assign accumulators_1090 = 16'h0;
  assign accumulators_1091 = 16'h0;
  assign accumulators_1092 = 16'h0;
  assign accumulators_1093 = 16'h0;
  assign accumulators_1094 = 16'h0;
  assign accumulators_1095 = 16'h0;
  assign accumulators_1096 = 16'h0;
  assign accumulators_1097 = 16'h0;
  assign accumulators_1098 = 16'h0;
  assign accumulators_1099 = 16'h0;
  assign accumulators_1100 = 16'h0;
  assign accumulators_1101 = 16'h0;
  assign accumulators_1102 = 16'h0;
  assign accumulators_1103 = 16'h0;
  assign accumulators_1104 = 16'h0;
  assign accumulators_1105 = 16'h0;
  assign accumulators_1106 = 16'h0;
  assign accumulators_1107 = 16'h0;
  assign accumulators_1108 = 16'h0;
  assign accumulators_1109 = 16'h0;
  assign accumulators_1110 = 16'h0;
  assign accumulators_1111 = 16'h0;
  assign accumulators_1112 = 16'h0;
  assign accumulators_1113 = 16'h0;
  assign accumulators_1114 = 16'h0;
  assign accumulators_1115 = 16'h0;
  assign accumulators_1116 = 16'h0;
  assign accumulators_1117 = 16'h0;
  assign accumulators_1118 = 16'h0;
  assign accumulators_1119 = 16'h0;
  assign accumulators_1120 = 16'h0;
  assign accumulators_1121 = 16'h0;
  assign accumulators_1122 = 16'h0;
  assign accumulators_1123 = 16'h0;
  assign accumulators_1124 = 16'h0;
  assign accumulators_1125 = 16'h0;
  assign accumulators_1126 = 16'h0;
  assign accumulators_1127 = 16'h0;
  assign accumulators_1128 = 16'h0;
  assign accumulators_1129 = 16'h0;
  assign accumulators_1130 = 16'h0;
  assign accumulators_1131 = 16'h0;
  assign accumulators_1132 = 16'h0;
  assign accumulators_1133 = 16'h0;
  assign accumulators_1134 = 16'h0;
  assign accumulators_1135 = 16'h0;
  assign accumulators_1136 = 16'h0;
  assign accumulators_1137 = 16'h0;
  assign accumulators_1138 = 16'h0;
  assign accumulators_1139 = 16'h0;
  assign accumulators_1140 = 16'h0;
  assign accumulators_1141 = 16'h0;
  assign accumulators_1142 = 16'h0;
  assign accumulators_1143 = 16'h0;
  assign accumulators_1144 = 16'h0;
  assign accumulators_1145 = 16'h0;
  assign accumulators_1146 = 16'h0;
  assign accumulators_1147 = 16'h0;
  assign accumulators_1148 = 16'h0;
  assign accumulators_1149 = 16'h0;
  assign accumulators_1150 = 16'h0;
  assign accumulators_1151 = 16'h0;
  always @(*) begin
    rowCounter_willIncrement = 1'b0;
    case(_zz_8)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
        if(_zz_when) begin
          if(nCounter_willOverflowIfInc) begin
            rowCounter_willIncrement = 1'b1;
          end
        end
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
      end
      default : begin
      end
    endcase
  end

  assign rowCounter_willDecrement = 1'b0;
  assign rowCounter_willClear = 1'b0;
  assign rowCounter_willLoad = 1'b0;
  assign rowCounter_willOverflowIfInc = (rowCounter_value == 10'h23f);
  assign rowCounter_willUnderflowIfDec = (rowCounter_value == 10'h0);
  assign rowCounter_willOverflow = (rowCounter_willOverflowIfInc && rowCounter_willIncrement);
  always @(*) begin
    rowCounter_valueNext = (rowCounter_value + _zz_rowCounter_valueNext);
    if(rowCounter_willOverflow) begin
      rowCounter_valueNext = 10'h0;
    end
    if(rowCounter_willClear) begin
      rowCounter_valueNext = 10'h0;
    end
  end

  assign rowCounter_willUnderflow = (rowCounter_willUnderflowIfDec && rowCounter_willDecrement);
  always @(*) begin
    nCounter_willIncrement = 1'b0;
    case(_zz_8)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
        if(_zz_when) begin
          nCounter_willIncrement = 1'b1;
        end
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
      end
      default : begin
      end
    endcase
  end

  assign nCounter_willDecrement = 1'b0;
  assign nCounter_willClear = 1'b0;
  assign nCounter_willLoad = 1'b0;
  assign nCounter_willOverflowIfInc = (nCounter_value == 1'b1);
  assign nCounter_willUnderflowIfDec = (nCounter_value == 1'b0);
  assign nCounter_willOverflow = (nCounter_willOverflowIfInc && nCounter_willIncrement);
  always @(*) begin
    nCounter_valueNext = (nCounter_value + nCounter_willIncrement);
    if(nCounter_willClear) begin
      nCounter_valueNext = 1'b0;
    end
  end

  assign nCounter_willUnderflow = (nCounter_willUnderflowIfDec && nCounter_willDecrement);
  assign kCounter_willIncrement = 1'b0;
  assign kCounter_willDecrement = 1'b0;
  assign kCounter_willClear = 1'b0;
  assign kCounter_willLoad = 1'b0;
  assign kCounter_willOverflowIfInc = 1'b1;
  assign kCounter_willUnderflowIfDec = 1'b1;
  assign kCounter_willOverflow = (kCounter_willOverflowIfInc && kCounter_willIncrement);
  assign kCounter_willUnderflow = (kCounter_willUnderflowIfDec && kCounter_willDecrement);
  assign outCounter_willIncrement = 1'b0;
  assign outCounter_willDecrement = 1'b0;
  assign outCounter_willClear = 1'b0;
  assign outCounter_willLoad = 1'b0;
  assign outCounter_willOverflowIfInc = (outCounter_value == 11'h47f);
  assign outCounter_willUnderflowIfDec = (outCounter_value == 11'h0);
  assign outCounter_willOverflow = (outCounter_willOverflowIfInc && outCounter_willIncrement);
  always @(*) begin
    outCounter_valueNext = (outCounter_value + _zz_outCounter_valueNext);
    if(outCounter_willOverflow) begin
      outCounter_valueNext = 11'h0;
    end
    if(outCounter_willClear) begin
      outCounter_valueNext = 11'h0;
    end
  end

  assign outCounter_willUnderflow = (outCounter_willUnderflowIfDec && outCounter_willDecrement);
  always @(*) begin
    io_a_stream_ready = 1'b0;
    case(_zz_8)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
        io_a_stream_ready = 1'b1;
      end
      StateMachineEnum__3 : begin
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_c_stream_valid = 1'b0;
    case(_zz_8)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
        io_c_stream_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_c_stream_payload_0 = 16'h0;
    case(_zz_8)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
        io_c_stream_payload_0 = _zz_io_c_stream_payload_0_94;
      end
      default : begin
      end
    endcase
  end

  assign io_b_stream_ready = streamDoubleBuffer_7_io_streamIn_ready;
  always @(*) begin
    streamDoubleBuffer_7_io_nextTile = 1'b0;
    case(_zz_8)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
        if(_zz_when) begin
          if(nCounter_willOverflowIfInc) begin
            if(rowCounter_willOverflowIfInc) begin
              streamDoubleBuffer_7_io_nextTile = 1'b1;
            end
          end
        end
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
      end
      default : begin
      end
    endcase
  end

  assign streamDoubleBuffer_7_io_readAddr = _zz_io_readAddr[0:0];
  always @(*) begin
    when_matmul_l239 = 1'b0;
    case(_zz_8)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
        when_matmul_l239 = 1'b1;
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
      end
      default : begin
      end
    endcase
  end

  assign when_Phase_l801 = 1'b1;
  assign _zz_io_c_stream_payload_0 = _zz_io_c_stream_payload_0_92;
  assign when_Utils_l1073 = 1'b1;
  assign when_Utils_l1073_1 = 1'b1;
  assign when_Utils_l1073_2 = 1'b1;
  assign _zz_io_c_stream_payload_0_85 = _zz__zz_io_c_stream_payload_0_85[4:0];
  assign _zz_1 = ({31'd0,1'b1} <<< _zz_io_c_stream_payload_0_85);
  assign _zz_io_c_stream_payload_0_86 = ($signed(_zz__zz_io_c_stream_payload_0_86) + $signed(_zz_io_c_stream_payload_0_52));
  always @(*) begin
    _zz_io_c_stream_payload_0_88 = 1'b0;
    case(_zz_8)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
        if(io_c_stream_ready) begin
          _zz_io_c_stream_payload_0_88 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign _zz_2 = (_zz_io_c_stream_payload_0_90 == 1'b1);
  always @(*) begin
    _zz_io_c_stream_payload_0_89 = (_zz_io_c_stream_payload_0_90 + _zz_io_c_stream_payload_0_88);
    if(1'b0) begin
      _zz_io_c_stream_payload_0_89 = 1'b0;
    end
  end

  always @(*) begin
    _zz_3 = 1'b0;
    case(_zz_8)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
      end
      StateMachineEnum__4 : begin
      end
      StateMachineEnum__5 : begin
      end
      default : begin
        _zz_3 = 1'b1;
      end
    endcase
  end

  always @(*) begin
    _zz_4 = 1'b0;
    case(_zz_8)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
      end
      StateMachineEnum__4 : begin
        _zz_4 = 1'b1;
      end
      StateMachineEnum__5 : begin
      end
      default : begin
      end
    endcase
  end

  assign _zz_7 = (_zz_6 == 3'b111);
  always @(*) begin
    _zz_5 = (_zz_6 + _zz__zz_5);
    if(1'b0) begin
      _zz_5 = 3'b000;
    end
  end

  always @(*) begin
    _zz_9 = _zz_8;
    case(_zz_8)
      StateMachineEnum__1 : begin
        if(streamDoubleBuffer_7_io_tileReady) begin
          _zz_9 = StateMachineEnum__2;
        end
      end
      StateMachineEnum__2 : begin
        if(io_a_stream_valid) begin
          if(1'b1) begin
            _zz_9 = StateMachineEnum__3;
          end
        end
      end
      StateMachineEnum__3 : begin
        if(_zz_when) begin
          if(nCounter_willOverflowIfInc) begin
            _zz_9 = StateMachineEnum__4;
          end
        end
      end
      StateMachineEnum__4 : begin
        if(_zz_7) begin
          _zz_9 = StateMachineEnum__5;
        end
      end
      StateMachineEnum__5 : begin
        if(io_c_stream_ready) begin
          if(_zz_2) begin
            if(when_matmul_l371) begin
              _zz_9 = StateMachineEnum__1;
            end else begin
              _zz_9 = StateMachineEnum__2;
            end
          end
        end
      end
      default : begin
      end
    endcase
    if(_zz_3) begin
      _zz_9 = StateMachineEnum__1;
    end
    if(1'b0) begin
      _zz_9 = StateMachineEnum_;
    end
  end

  assign _zz_10 = ({31'd0,1'b1} <<< _zz__zz_10);
  assign _zz_io_c_stream_payload_0_91 = _zz_io_c_stream_payload_0_93;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      rowCounter_value <= 10'h0;
      nCounter_value <= 1'b0;
      outCounter_value <= 11'h0;
      when_matmul_l239_regNext <= 1'b0;
      _zz_io_c_stream_payload_0_1 <= 16'h0;
      _zz_io_c_stream_payload_0_2 <= 16'h0;
      _zz_io_c_stream_payload_0_3 <= 16'h0;
      _zz_io_c_stream_payload_0_4 <= 16'h0;
      _zz_io_c_stream_payload_0_5 <= 16'h0;
      _zz_io_c_stream_payload_0_6 <= 16'h0;
      _zz_io_c_stream_payload_0_7 <= 16'h0;
      _zz_io_c_stream_payload_0_8 <= 16'h0;
      _zz_io_c_stream_payload_0_9 <= 16'h0;
      _zz_io_c_stream_payload_0_10 <= 16'h0;
      _zz_io_c_stream_payload_0_11 <= 16'h0;
      _zz_io_c_stream_payload_0_12 <= 16'h0;
      _zz_io_c_stream_payload_0_13 <= 16'h0;
      _zz_io_c_stream_payload_0_14 <= 16'h0;
      _zz_io_c_stream_payload_0_15 <= 16'h0;
      _zz_io_c_stream_payload_0_16 <= 16'h0;
      _zz_io_c_stream_payload_0_17 <= 16'h0;
      _zz_io_c_stream_payload_0_18 <= 16'h0;
      _zz_io_c_stream_payload_0_19 <= 16'h0;
      _zz_io_c_stream_payload_0_20 <= 16'h0;
      _zz_io_c_stream_payload_0_21 <= 16'h0;
      _zz_io_c_stream_payload_0_22 <= 16'h0;
      _zz_io_c_stream_payload_0_23 <= 16'h0;
      _zz_io_c_stream_payload_0_24 <= 16'h0;
      _zz_io_c_stream_payload_0_25 <= 16'h0;
      when_matmul_l239_regNext_regNext <= 1'b0;
      when_matmul_l239_regNext_regNext_delay_1 <= 1'b0;
      when_matmul_l239_regNext_regNext_delay_2 <= 1'b0;
      when_matmul_l239_regNext_regNext_delay_3 <= 1'b0;
      when_matmul_l239_regNext_regNext_delay_4 <= 1'b0;
      when_matmul_l239_regNext_regNext_delay_5 <= 1'b0;
      when_matmul_l239_regNext_regNext_regNext <= 1'b0;
      _zz_io_c_stream_payload_0_26 <= 16'h0;
      _zz_io_c_stream_payload_0_27 <= 16'h0;
      _zz_io_c_stream_payload_0_28 <= 16'h0;
      _zz_io_c_stream_payload_0_29 <= 16'h0;
      _zz_io_c_stream_payload_0_30 <= 16'h0;
      _zz_io_c_stream_payload_0_31 <= 16'h0;
      _zz_io_c_stream_payload_0_32 <= 16'h0;
      _zz_io_c_stream_payload_0_33 <= 16'h0;
      _zz_io_c_stream_payload_0_34 <= 16'h0;
      _zz_io_c_stream_payload_0_35 <= 16'h0;
      _zz_io_c_stream_payload_0_36 <= 16'h0;
      _zz_io_c_stream_payload_0_37 <= 16'h0;
      _zz_io_c_stream_payload_0_38 <= 16'h0;
      when_matmul_l239_regNext_regNext_regNext_regNext <= 1'b0;
      _zz_io_c_stream_payload_0_39 <= 16'h0;
      _zz_io_c_stream_payload_0_40 <= 16'h0;
      _zz_io_c_stream_payload_0_41 <= 16'h0;
      _zz_io_c_stream_payload_0_42 <= 16'h0;
      _zz_io_c_stream_payload_0_43 <= 16'h0;
      _zz_io_c_stream_payload_0_44 <= 16'h0;
      _zz_io_c_stream_payload_0_45 <= 16'h0;
      when_matmul_l239_regNext_regNext_regNext_regNext_regNext <= 1'b0;
      _zz_io_c_stream_payload_0_46 <= 16'h0;
      _zz_io_c_stream_payload_0_47 <= 16'h0;
      _zz_io_c_stream_payload_0_48 <= 16'h0;
      _zz_io_c_stream_payload_0_49 <= 16'h0;
      when_matmul_l239_regNext_regNext_regNext_regNext_regNext_regNext <= 1'b0;
      _zz_io_c_stream_payload_0_50 <= 16'h0;
      _zz_io_c_stream_payload_0_51 <= 16'h0;
      when_matmul_l239_regNext_regNext_regNext_regNext_regNext_regNext_regNext <= 1'b0;
      _zz_io_c_stream_payload_0_52 <= 16'h0;
      _zz_io_c_stream_payload_0_53 <= 16'h0;
      _zz_io_c_stream_payload_0_54 <= 16'h0;
      _zz_io_c_stream_payload_0_55 <= 16'h0;
      _zz_io_c_stream_payload_0_56 <= 16'h0;
      _zz_io_c_stream_payload_0_57 <= 16'h0;
      _zz_io_c_stream_payload_0_58 <= 16'h0;
      _zz_io_c_stream_payload_0_59 <= 16'h0;
      _zz_io_c_stream_payload_0_60 <= 16'h0;
      _zz_io_c_stream_payload_0_61 <= 16'h0;
      _zz_io_c_stream_payload_0_62 <= 16'h0;
      _zz_io_c_stream_payload_0_63 <= 16'h0;
      _zz_io_c_stream_payload_0_64 <= 16'h0;
      _zz_io_c_stream_payload_0_65 <= 16'h0;
      _zz_io_c_stream_payload_0_66 <= 16'h0;
      _zz_io_c_stream_payload_0_67 <= 16'h0;
      _zz_io_c_stream_payload_0_68 <= 16'h0;
      _zz_io_c_stream_payload_0_69 <= 16'h0;
      _zz_io_c_stream_payload_0_70 <= 16'h0;
      _zz_io_c_stream_payload_0_71 <= 16'h0;
      _zz_io_c_stream_payload_0_72 <= 16'h0;
      _zz_io_c_stream_payload_0_73 <= 16'h0;
      _zz_io_c_stream_payload_0_74 <= 16'h0;
      _zz_io_c_stream_payload_0_75 <= 16'h0;
      _zz_io_c_stream_payload_0_76 <= 16'h0;
      _zz_io_c_stream_payload_0_77 <= 16'h0;
      _zz_io_c_stream_payload_0_78 <= 16'h0;
      _zz_io_c_stream_payload_0_79 <= 16'h0;
      _zz_io_c_stream_payload_0_80 <= 16'h0;
      _zz_io_c_stream_payload_0_81 <= 16'h0;
      _zz_io_c_stream_payload_0_82 <= 16'h0;
      _zz_io_c_stream_payload_0_83 <= 16'h0;
      _zz_io_c_stream_payload_0_84 <= 16'h0;
      _zz_io_c_stream_payload_0_87 <= 10'h0;
      when_matmul_l371 <= 1'b0;
      _zz_io_c_stream_payload_0_90 <= 1'b0;
      _zz_6 <= 3'b000;
      _zz_8 <= StateMachineEnum_;
    end else begin
      rowCounter_value <= rowCounter_valueNext;
      nCounter_value <= nCounter_valueNext;
      outCounter_value <= outCounter_valueNext;
      when_matmul_l239_regNext <= when_matmul_l239;
      if(when_matmul_l239_regNext) begin
        _zz_io_c_stream_payload_0_1 <= ($signed(_zz__zz_io_c_stream_payload_0_1) * $signed(streamDoubleBuffer_7_io_readData_0));
        _zz_io_c_stream_payload_0_2 <= ($signed(_zz__zz_io_c_stream_payload_0_2) * $signed(streamDoubleBuffer_7_io_readData_1));
        _zz_io_c_stream_payload_0_3 <= ($signed(_zz__zz_io_c_stream_payload_0_3) * $signed(streamDoubleBuffer_7_io_readData_2));
        _zz_io_c_stream_payload_0_4 <= ($signed(_zz__zz_io_c_stream_payload_0_4) * $signed(streamDoubleBuffer_7_io_readData_3));
        _zz_io_c_stream_payload_0_5 <= ($signed(_zz__zz_io_c_stream_payload_0_5) * $signed(streamDoubleBuffer_7_io_readData_4));
        _zz_io_c_stream_payload_0_6 <= ($signed(_zz__zz_io_c_stream_payload_0_6) * $signed(streamDoubleBuffer_7_io_readData_5));
        _zz_io_c_stream_payload_0_7 <= ($signed(_zz__zz_io_c_stream_payload_0_7) * $signed(streamDoubleBuffer_7_io_readData_6));
        _zz_io_c_stream_payload_0_8 <= ($signed(_zz__zz_io_c_stream_payload_0_8) * $signed(streamDoubleBuffer_7_io_readData_7));
        _zz_io_c_stream_payload_0_9 <= ($signed(_zz__zz_io_c_stream_payload_0_9) * $signed(streamDoubleBuffer_7_io_readData_8));
        _zz_io_c_stream_payload_0_10 <= ($signed(_zz__zz_io_c_stream_payload_0_10) * $signed(streamDoubleBuffer_7_io_readData_9));
        _zz_io_c_stream_payload_0_11 <= ($signed(_zz__zz_io_c_stream_payload_0_11) * $signed(streamDoubleBuffer_7_io_readData_10));
        _zz_io_c_stream_payload_0_12 <= ($signed(_zz__zz_io_c_stream_payload_0_12) * $signed(streamDoubleBuffer_7_io_readData_11));
        _zz_io_c_stream_payload_0_13 <= ($signed(_zz__zz_io_c_stream_payload_0_13) * $signed(streamDoubleBuffer_7_io_readData_12));
        _zz_io_c_stream_payload_0_14 <= ($signed(_zz__zz_io_c_stream_payload_0_14) * $signed(streamDoubleBuffer_7_io_readData_13));
        _zz_io_c_stream_payload_0_15 <= ($signed(_zz__zz_io_c_stream_payload_0_15) * $signed(streamDoubleBuffer_7_io_readData_14));
        _zz_io_c_stream_payload_0_16 <= ($signed(_zz__zz_io_c_stream_payload_0_16) * $signed(streamDoubleBuffer_7_io_readData_15));
        _zz_io_c_stream_payload_0_17 <= ($signed(_zz__zz_io_c_stream_payload_0_17) * $signed(streamDoubleBuffer_7_io_readData_16));
        _zz_io_c_stream_payload_0_18 <= ($signed(_zz__zz_io_c_stream_payload_0_18) * $signed(streamDoubleBuffer_7_io_readData_17));
        _zz_io_c_stream_payload_0_19 <= ($signed(_zz__zz_io_c_stream_payload_0_19) * $signed(streamDoubleBuffer_7_io_readData_18));
        _zz_io_c_stream_payload_0_20 <= ($signed(_zz__zz_io_c_stream_payload_0_20) * $signed(streamDoubleBuffer_7_io_readData_19));
        _zz_io_c_stream_payload_0_21 <= ($signed(_zz__zz_io_c_stream_payload_0_21) * $signed(streamDoubleBuffer_7_io_readData_20));
        _zz_io_c_stream_payload_0_22 <= ($signed(_zz__zz_io_c_stream_payload_0_22) * $signed(streamDoubleBuffer_7_io_readData_21));
        _zz_io_c_stream_payload_0_23 <= ($signed(_zz__zz_io_c_stream_payload_0_23) * $signed(streamDoubleBuffer_7_io_readData_22));
        _zz_io_c_stream_payload_0_24 <= ($signed(_zz__zz_io_c_stream_payload_0_24) * $signed(streamDoubleBuffer_7_io_readData_23));
        _zz_io_c_stream_payload_0_25 <= ($signed(_zz__zz_io_c_stream_payload_0_25) * $signed(streamDoubleBuffer_7_io_readData_24));
      end
      when_matmul_l239_regNext_regNext <= when_matmul_l239_regNext;
      if(when_Utils_l1073_2) begin
        when_matmul_l239_regNext_regNext_delay_1 <= when_matmul_l239_regNext_regNext;
      end
      if(when_Utils_l1073_2) begin
        when_matmul_l239_regNext_regNext_delay_2 <= when_matmul_l239_regNext_regNext_delay_1;
      end
      if(when_Utils_l1073_2) begin
        when_matmul_l239_regNext_regNext_delay_3 <= when_matmul_l239_regNext_regNext_delay_2;
      end
      if(when_Utils_l1073_2) begin
        when_matmul_l239_regNext_regNext_delay_4 <= when_matmul_l239_regNext_regNext_delay_3;
      end
      if(when_Utils_l1073_2) begin
        when_matmul_l239_regNext_regNext_delay_5 <= when_matmul_l239_regNext_regNext_delay_4;
      end
      when_matmul_l239_regNext_regNext_regNext <= when_matmul_l239_regNext_regNext;
      if(when_matmul_l239_regNext_regNext) begin
        _zz_io_c_stream_payload_0_26 <= ($signed(_zz_io_c_stream_payload_0_1) + $signed(_zz_io_c_stream_payload_0_2));
      end
      if(when_matmul_l239_regNext_regNext) begin
        _zz_io_c_stream_payload_0_27 <= ($signed(_zz_io_c_stream_payload_0_3) + $signed(_zz_io_c_stream_payload_0_4));
      end
      if(when_matmul_l239_regNext_regNext) begin
        _zz_io_c_stream_payload_0_28 <= ($signed(_zz_io_c_stream_payload_0_5) + $signed(_zz_io_c_stream_payload_0_6));
      end
      if(when_matmul_l239_regNext_regNext) begin
        _zz_io_c_stream_payload_0_29 <= ($signed(_zz_io_c_stream_payload_0_7) + $signed(_zz_io_c_stream_payload_0_8));
      end
      if(when_matmul_l239_regNext_regNext) begin
        _zz_io_c_stream_payload_0_30 <= ($signed(_zz_io_c_stream_payload_0_9) + $signed(_zz_io_c_stream_payload_0_10));
      end
      if(when_matmul_l239_regNext_regNext) begin
        _zz_io_c_stream_payload_0_31 <= ($signed(_zz_io_c_stream_payload_0_11) + $signed(_zz_io_c_stream_payload_0_12));
      end
      if(when_matmul_l239_regNext_regNext) begin
        _zz_io_c_stream_payload_0_32 <= ($signed(_zz_io_c_stream_payload_0_13) + $signed(_zz_io_c_stream_payload_0_14));
      end
      if(when_matmul_l239_regNext_regNext) begin
        _zz_io_c_stream_payload_0_33 <= ($signed(_zz_io_c_stream_payload_0_15) + $signed(_zz_io_c_stream_payload_0_16));
      end
      if(when_matmul_l239_regNext_regNext) begin
        _zz_io_c_stream_payload_0_34 <= ($signed(_zz_io_c_stream_payload_0_17) + $signed(_zz_io_c_stream_payload_0_18));
      end
      if(when_matmul_l239_regNext_regNext) begin
        _zz_io_c_stream_payload_0_35 <= ($signed(_zz_io_c_stream_payload_0_19) + $signed(_zz_io_c_stream_payload_0_20));
      end
      if(when_matmul_l239_regNext_regNext) begin
        _zz_io_c_stream_payload_0_36 <= ($signed(_zz_io_c_stream_payload_0_21) + $signed(_zz_io_c_stream_payload_0_22));
      end
      if(when_matmul_l239_regNext_regNext) begin
        _zz_io_c_stream_payload_0_37 <= ($signed(_zz_io_c_stream_payload_0_23) + $signed(_zz_io_c_stream_payload_0_24));
      end
      if(when_matmul_l239_regNext_regNext) begin
        _zz_io_c_stream_payload_0_38 <= _zz_io_c_stream_payload_0_25;
      end
      when_matmul_l239_regNext_regNext_regNext_regNext <= when_matmul_l239_regNext_regNext_regNext;
      if(when_matmul_l239_regNext_regNext_regNext) begin
        _zz_io_c_stream_payload_0_39 <= ($signed(_zz_io_c_stream_payload_0_26) + $signed(_zz_io_c_stream_payload_0_27));
      end
      if(when_matmul_l239_regNext_regNext_regNext) begin
        _zz_io_c_stream_payload_0_40 <= ($signed(_zz_io_c_stream_payload_0_28) + $signed(_zz_io_c_stream_payload_0_29));
      end
      if(when_matmul_l239_regNext_regNext_regNext) begin
        _zz_io_c_stream_payload_0_41 <= ($signed(_zz_io_c_stream_payload_0_30) + $signed(_zz_io_c_stream_payload_0_31));
      end
      if(when_matmul_l239_regNext_regNext_regNext) begin
        _zz_io_c_stream_payload_0_42 <= ($signed(_zz_io_c_stream_payload_0_32) + $signed(_zz_io_c_stream_payload_0_33));
      end
      if(when_matmul_l239_regNext_regNext_regNext) begin
        _zz_io_c_stream_payload_0_43 <= ($signed(_zz_io_c_stream_payload_0_34) + $signed(_zz_io_c_stream_payload_0_35));
      end
      if(when_matmul_l239_regNext_regNext_regNext) begin
        _zz_io_c_stream_payload_0_44 <= ($signed(_zz_io_c_stream_payload_0_36) + $signed(_zz_io_c_stream_payload_0_37));
      end
      if(when_matmul_l239_regNext_regNext_regNext) begin
        _zz_io_c_stream_payload_0_45 <= _zz_io_c_stream_payload_0_38;
      end
      when_matmul_l239_regNext_regNext_regNext_regNext_regNext <= when_matmul_l239_regNext_regNext_regNext_regNext;
      if(when_matmul_l239_regNext_regNext_regNext_regNext) begin
        _zz_io_c_stream_payload_0_46 <= ($signed(_zz_io_c_stream_payload_0_39) + $signed(_zz_io_c_stream_payload_0_40));
      end
      if(when_matmul_l239_regNext_regNext_regNext_regNext) begin
        _zz_io_c_stream_payload_0_47 <= ($signed(_zz_io_c_stream_payload_0_41) + $signed(_zz_io_c_stream_payload_0_42));
      end
      if(when_matmul_l239_regNext_regNext_regNext_regNext) begin
        _zz_io_c_stream_payload_0_48 <= ($signed(_zz_io_c_stream_payload_0_43) + $signed(_zz_io_c_stream_payload_0_44));
      end
      if(when_matmul_l239_regNext_regNext_regNext_regNext) begin
        _zz_io_c_stream_payload_0_49 <= _zz_io_c_stream_payload_0_45;
      end
      when_matmul_l239_regNext_regNext_regNext_regNext_regNext_regNext <= when_matmul_l239_regNext_regNext_regNext_regNext_regNext;
      if(when_matmul_l239_regNext_regNext_regNext_regNext_regNext) begin
        _zz_io_c_stream_payload_0_50 <= ($signed(_zz_io_c_stream_payload_0_46) + $signed(_zz_io_c_stream_payload_0_47));
      end
      if(when_matmul_l239_regNext_regNext_regNext_regNext_regNext) begin
        _zz_io_c_stream_payload_0_51 <= ($signed(_zz_io_c_stream_payload_0_48) + $signed(_zz_io_c_stream_payload_0_49));
      end
      when_matmul_l239_regNext_regNext_regNext_regNext_regNext_regNext_regNext <= when_matmul_l239_regNext_regNext_regNext_regNext_regNext_regNext;
      if(when_matmul_l239_regNext_regNext_regNext_regNext_regNext_regNext) begin
        _zz_io_c_stream_payload_0_52 <= ($signed(_zz_io_c_stream_payload_0_50) + $signed(_zz_io_c_stream_payload_0_51));
      end
      if(when_matmul_l239_regNext_regNext_delay_5) begin
        if(_zz_1[0]) begin
          _zz_io_c_stream_payload_0_53 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[1]) begin
          _zz_io_c_stream_payload_0_54 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[2]) begin
          _zz_io_c_stream_payload_0_55 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[3]) begin
          _zz_io_c_stream_payload_0_56 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[4]) begin
          _zz_io_c_stream_payload_0_57 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[5]) begin
          _zz_io_c_stream_payload_0_58 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[6]) begin
          _zz_io_c_stream_payload_0_59 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[7]) begin
          _zz_io_c_stream_payload_0_60 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[8]) begin
          _zz_io_c_stream_payload_0_61 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[9]) begin
          _zz_io_c_stream_payload_0_62 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[10]) begin
          _zz_io_c_stream_payload_0_63 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[11]) begin
          _zz_io_c_stream_payload_0_64 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[12]) begin
          _zz_io_c_stream_payload_0_65 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[13]) begin
          _zz_io_c_stream_payload_0_66 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[14]) begin
          _zz_io_c_stream_payload_0_67 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[15]) begin
          _zz_io_c_stream_payload_0_68 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[16]) begin
          _zz_io_c_stream_payload_0_69 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[17]) begin
          _zz_io_c_stream_payload_0_70 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[18]) begin
          _zz_io_c_stream_payload_0_71 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[19]) begin
          _zz_io_c_stream_payload_0_72 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[20]) begin
          _zz_io_c_stream_payload_0_73 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[21]) begin
          _zz_io_c_stream_payload_0_74 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[22]) begin
          _zz_io_c_stream_payload_0_75 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[23]) begin
          _zz_io_c_stream_payload_0_76 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[24]) begin
          _zz_io_c_stream_payload_0_77 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[25]) begin
          _zz_io_c_stream_payload_0_78 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[26]) begin
          _zz_io_c_stream_payload_0_79 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[27]) begin
          _zz_io_c_stream_payload_0_80 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[28]) begin
          _zz_io_c_stream_payload_0_81 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[29]) begin
          _zz_io_c_stream_payload_0_82 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[30]) begin
          _zz_io_c_stream_payload_0_83 <= _zz_io_c_stream_payload_0_86;
        end
        if(_zz_1[31]) begin
          _zz_io_c_stream_payload_0_84 <= _zz_io_c_stream_payload_0_86;
        end
      end
      _zz_io_c_stream_payload_0_90 <= _zz_io_c_stream_payload_0_89;
      _zz_6 <= _zz_5;
      _zz_8 <= _zz_9;
      case(_zz_8)
        StateMachineEnum__1 : begin
        end
        StateMachineEnum__2 : begin
        end
        StateMachineEnum__3 : begin
          if(_zz_when) begin
            if(nCounter_willOverflowIfInc) begin
              _zz_io_c_stream_payload_0_87 <= rowCounter_value;
              when_matmul_l371 <= (rowCounter_value == 10'h23f);
            end
          end
        end
        StateMachineEnum__4 : begin
        end
        StateMachineEnum__5 : begin
          if(io_c_stream_ready) begin
            if(_zz_10[0]) begin
              _zz_io_c_stream_payload_0_53 <= 16'h0;
            end
            if(_zz_10[1]) begin
              _zz_io_c_stream_payload_0_54 <= 16'h0;
            end
            if(_zz_10[2]) begin
              _zz_io_c_stream_payload_0_55 <= 16'h0;
            end
            if(_zz_10[3]) begin
              _zz_io_c_stream_payload_0_56 <= 16'h0;
            end
            if(_zz_10[4]) begin
              _zz_io_c_stream_payload_0_57 <= 16'h0;
            end
            if(_zz_10[5]) begin
              _zz_io_c_stream_payload_0_58 <= 16'h0;
            end
            if(_zz_10[6]) begin
              _zz_io_c_stream_payload_0_59 <= 16'h0;
            end
            if(_zz_10[7]) begin
              _zz_io_c_stream_payload_0_60 <= 16'h0;
            end
            if(_zz_10[8]) begin
              _zz_io_c_stream_payload_0_61 <= 16'h0;
            end
            if(_zz_10[9]) begin
              _zz_io_c_stream_payload_0_62 <= 16'h0;
            end
            if(_zz_10[10]) begin
              _zz_io_c_stream_payload_0_63 <= 16'h0;
            end
            if(_zz_10[11]) begin
              _zz_io_c_stream_payload_0_64 <= 16'h0;
            end
            if(_zz_10[12]) begin
              _zz_io_c_stream_payload_0_65 <= 16'h0;
            end
            if(_zz_10[13]) begin
              _zz_io_c_stream_payload_0_66 <= 16'h0;
            end
            if(_zz_10[14]) begin
              _zz_io_c_stream_payload_0_67 <= 16'h0;
            end
            if(_zz_10[15]) begin
              _zz_io_c_stream_payload_0_68 <= 16'h0;
            end
            if(_zz_10[16]) begin
              _zz_io_c_stream_payload_0_69 <= 16'h0;
            end
            if(_zz_10[17]) begin
              _zz_io_c_stream_payload_0_70 <= 16'h0;
            end
            if(_zz_10[18]) begin
              _zz_io_c_stream_payload_0_71 <= 16'h0;
            end
            if(_zz_10[19]) begin
              _zz_io_c_stream_payload_0_72 <= 16'h0;
            end
            if(_zz_10[20]) begin
              _zz_io_c_stream_payload_0_73 <= 16'h0;
            end
            if(_zz_10[21]) begin
              _zz_io_c_stream_payload_0_74 <= 16'h0;
            end
            if(_zz_10[22]) begin
              _zz_io_c_stream_payload_0_75 <= 16'h0;
            end
            if(_zz_10[23]) begin
              _zz_io_c_stream_payload_0_76 <= 16'h0;
            end
            if(_zz_10[24]) begin
              _zz_io_c_stream_payload_0_77 <= 16'h0;
            end
            if(_zz_10[25]) begin
              _zz_io_c_stream_payload_0_78 <= 16'h0;
            end
            if(_zz_10[26]) begin
              _zz_io_c_stream_payload_0_79 <= 16'h0;
            end
            if(_zz_10[27]) begin
              _zz_io_c_stream_payload_0_80 <= 16'h0;
            end
            if(_zz_10[28]) begin
              _zz_io_c_stream_payload_0_81 <= 16'h0;
            end
            if(_zz_10[29]) begin
              _zz_io_c_stream_payload_0_82 <= 16'h0;
            end
            if(_zz_10[30]) begin
              _zz_io_c_stream_payload_0_83 <= 16'h0;
            end
            if(_zz_10[31]) begin
              _zz_io_c_stream_payload_0_84 <= 16'h0;
            end
            if(_zz_2) begin
              if(when_matmul_l371) begin
                when_matmul_l371 <= 1'b0;
              end
            end
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(when_matmul_l239) begin
      rowCounter_value_regNextWhen <= rowCounter_value;
    end
    if(when_matmul_l239) begin
      nCounter_value_regNextWhen <= nCounter_value;
    end
    if(when_matmul_l239_regNext) begin
      rowCounter_value_regNextWhen_regNextWhen <= rowCounter_value_regNextWhen;
    end
    if(when_Utils_l1073) begin
      rowCounter_value_regNextWhen_regNextWhen_delay_1 <= rowCounter_value_regNextWhen_regNextWhen;
    end
    if(when_Utils_l1073) begin
      rowCounter_value_regNextWhen_regNextWhen_delay_2 <= rowCounter_value_regNextWhen_regNextWhen_delay_1;
    end
    if(when_Utils_l1073) begin
      rowCounter_value_regNextWhen_regNextWhen_delay_3 <= rowCounter_value_regNextWhen_regNextWhen_delay_2;
    end
    if(when_Utils_l1073) begin
      rowCounter_value_regNextWhen_regNextWhen_delay_4 <= rowCounter_value_regNextWhen_regNextWhen_delay_3;
    end
    if(when_Utils_l1073) begin
      rowCounter_value_regNextWhen_regNextWhen_delay_5 <= rowCounter_value_regNextWhen_regNextWhen_delay_4;
    end
    if(when_matmul_l239_regNext) begin
      nCounter_value_regNextWhen_regNextWhen <= nCounter_value_regNextWhen;
    end
    if(when_Utils_l1073_1) begin
      nCounter_value_regNextWhen_regNextWhen_delay_1 <= nCounter_value_regNextWhen_regNextWhen;
    end
    if(when_Utils_l1073_1) begin
      nCounter_value_regNextWhen_regNextWhen_delay_2 <= nCounter_value_regNextWhen_regNextWhen_delay_1;
    end
    if(when_Utils_l1073_1) begin
      nCounter_value_regNextWhen_regNextWhen_delay_3 <= nCounter_value_regNextWhen_regNextWhen_delay_2;
    end
    if(when_Utils_l1073_1) begin
      nCounter_value_regNextWhen_regNextWhen_delay_4 <= nCounter_value_regNextWhen_regNextWhen_delay_3;
    end
    if(when_Utils_l1073_1) begin
      nCounter_value_regNextWhen_regNextWhen_delay_5 <= nCounter_value_regNextWhen_regNextWhen_delay_4;
    end
    if(when_Phase_l801) begin
      _zz_io_c_stream_payload_0_92 <= _zz_io_c_stream_payload_0_91;
    end
    if(when_Phase_l774) begin
      _zz_io_c_stream_payload_0_93 <= {io_a_stream_payload_24,{io_a_stream_payload_23,{io_a_stream_payload_22,{io_a_stream_payload_21,{io_a_stream_payload_20,{io_a_stream_payload_19,{io_a_stream_payload_18,{io_a_stream_payload_17,{io_a_stream_payload_16,{io_a_stream_payload_15,{io_a_stream_payload_14,{io_a_stream_payload_13,{io_a_stream_payload_12,{io_a_stream_payload_11,{io_a_stream_payload_10,{_zz__zz_io_c_stream_payload_0_93,_zz__zz_io_c_stream_payload_0_93_1}}}}}}}}}}}}}}}};
    end
  end


endmodule

module Im2ColOp (
  input  wire          io_a_stream_valid,
  output reg           io_a_stream_ready,
  input  wire [7:0]    io_a_stream_payload_0,
  output reg           io_c_stream_valid,
  input  wire          io_c_stream_ready,
  output wire [7:0]    io_c_stream_payload_0,
  output wire [7:0]    io_c_stream_payload_1,
  output wire [7:0]    io_c_stream_payload_2,
  output wire [7:0]    io_c_stream_payload_3,
  output wire [7:0]    io_c_stream_payload_4,
  output wire [7:0]    io_c_stream_payload_5,
  output wire [7:0]    io_c_stream_payload_6,
  output wire [7:0]    io_c_stream_payload_7,
  output wire [7:0]    io_c_stream_payload_8,
  output wire [7:0]    io_c_stream_payload_9,
  output wire [7:0]    io_c_stream_payload_10,
  output wire [7:0]    io_c_stream_payload_11,
  output wire [7:0]    io_c_stream_payload_12,
  output wire [7:0]    io_c_stream_payload_13,
  output wire [7:0]    io_c_stream_payload_14,
  output wire [7:0]    io_c_stream_payload_15,
  output wire [7:0]    io_c_stream_payload_16,
  output wire [7:0]    io_c_stream_payload_17,
  output wire [7:0]    io_c_stream_payload_18,
  output wire [7:0]    io_c_stream_payload_19,
  output wire [7:0]    io_c_stream_payload_20,
  output wire [7:0]    io_c_stream_payload_21,
  output wire [7:0]    io_c_stream_payload_22,
  output wire [7:0]    io_c_stream_payload_23,
  output wire [7:0]    io_c_stream_payload_24,
  input  wire          clk,
  input  wire          reset
);
  localparam fsm_1_BOOT = 3'd0;
  localparam fsm_1_stateFill = 3'd1;
  localparam fsm_1_stateOutput = 3'd2;
  localparam fsm_1_stateWaitA = 3'd3;
  localparam fsm_1_stateDone = 3'd4;

  wire       [4:0]    _zz_x_valueNext;
  wire       [0:0]    _zz_x_valueNext_1;
  wire       [4:0]    _zz_y_valueNext;
  wire       [0:0]    _zz_y_valueNext_1;
  wire       [9:0]    _zz_windowCount_valueNext;
  wire       [0:0]    _zz_windowCount_valueNext_1;
  reg        [7:0]    _zz_io_c_stream_payload_0;
  wire       [4:0]    _zz_io_c_stream_payload_0_1;
  reg        [7:0]    _zz_io_c_stream_payload_1;
  wire       [4:0]    _zz_io_c_stream_payload_1_1;
  reg        [7:0]    _zz_io_c_stream_payload_2;
  wire       [4:0]    _zz_io_c_stream_payload_2_1;
  reg        [7:0]    _zz_io_c_stream_payload_3;
  wire       [4:0]    _zz_io_c_stream_payload_3_1;
  reg        [7:0]    _zz_io_c_stream_payload_4;
  wire       [4:0]    _zz_io_c_stream_payload_4_1;
  reg        [7:0]    _zz_io_c_stream_payload_5;
  wire       [4:0]    _zz_io_c_stream_payload_5_1;
  reg        [7:0]    _zz_io_c_stream_payload_6;
  wire       [4:0]    _zz_io_c_stream_payload_6_1;
  reg        [7:0]    _zz_io_c_stream_payload_7;
  wire       [4:0]    _zz_io_c_stream_payload_7_1;
  reg        [7:0]    _zz_io_c_stream_payload_8;
  wire       [4:0]    _zz_io_c_stream_payload_8_1;
  reg        [7:0]    _zz_io_c_stream_payload_9;
  wire       [4:0]    _zz_io_c_stream_payload_9_1;
  reg        [7:0]    _zz_io_c_stream_payload_10;
  wire       [4:0]    _zz_io_c_stream_payload_10_1;
  reg        [7:0]    _zz_io_c_stream_payload_11;
  wire       [4:0]    _zz_io_c_stream_payload_11_1;
  reg        [7:0]    _zz_io_c_stream_payload_12;
  wire       [4:0]    _zz_io_c_stream_payload_12_1;
  reg        [7:0]    _zz_io_c_stream_payload_13;
  wire       [4:0]    _zz_io_c_stream_payload_13_1;
  reg        [7:0]    _zz_io_c_stream_payload_14;
  wire       [4:0]    _zz_io_c_stream_payload_14_1;
  reg        [7:0]    _zz_io_c_stream_payload_15;
  wire       [4:0]    _zz_io_c_stream_payload_15_1;
  reg        [7:0]    _zz_io_c_stream_payload_16;
  wire       [4:0]    _zz_io_c_stream_payload_16_1;
  reg        [7:0]    _zz_io_c_stream_payload_17;
  wire       [4:0]    _zz_io_c_stream_payload_17_1;
  reg        [7:0]    _zz_io_c_stream_payload_18;
  wire       [4:0]    _zz_io_c_stream_payload_18_1;
  reg        [7:0]    _zz_io_c_stream_payload_19;
  wire       [4:0]    _zz_io_c_stream_payload_19_1;
  reg        [7:0]    _zz_io_c_stream_payload_20;
  wire       [4:0]    _zz_io_c_stream_payload_20_1;
  reg        [7:0]    _zz_io_c_stream_payload_21;
  wire       [4:0]    _zz_io_c_stream_payload_21_1;
  reg        [7:0]    _zz_io_c_stream_payload_22;
  wire       [4:0]    _zz_io_c_stream_payload_22_1;
  reg        [7:0]    _zz_io_c_stream_payload_23;
  wire       [4:0]    _zz_io_c_stream_payload_23_1;
  reg        [7:0]    _zz_io_c_stream_payload_24;
  wire       [4:0]    _zz_io_c_stream_payload_24_1;
  wire       [0:0]    _zz__zz_1;
  wire       [0:0]    _zz__zz_2;
  wire       [0:0]    _zz__zz_3;
  wire       [0:0]    _zz__zz_4;
  wire       [0:0]    _zz__zz_5;
  reg        [7:0]    lineBuffers_0_regs_0;
  reg        [7:0]    lineBuffers_0_regs_1;
  reg        [7:0]    lineBuffers_0_regs_2;
  reg        [7:0]    lineBuffers_0_regs_3;
  reg        [7:0]    lineBuffers_0_regs_4;
  reg        [7:0]    lineBuffers_0_regs_5;
  reg        [7:0]    lineBuffers_0_regs_6;
  reg        [7:0]    lineBuffers_0_regs_7;
  reg        [7:0]    lineBuffers_0_regs_8;
  reg        [7:0]    lineBuffers_0_regs_9;
  reg        [7:0]    lineBuffers_0_regs_10;
  reg        [7:0]    lineBuffers_0_regs_11;
  reg        [7:0]    lineBuffers_0_regs_12;
  reg        [7:0]    lineBuffers_0_regs_13;
  reg        [7:0]    lineBuffers_0_regs_14;
  reg        [7:0]    lineBuffers_0_regs_15;
  reg        [7:0]    lineBuffers_0_regs_16;
  reg        [7:0]    lineBuffers_0_regs_17;
  reg        [7:0]    lineBuffers_0_regs_18;
  reg        [7:0]    lineBuffers_0_regs_19;
  reg        [7:0]    lineBuffers_0_regs_20;
  reg        [7:0]    lineBuffers_0_regs_21;
  reg        [7:0]    lineBuffers_0_regs_22;
  reg        [7:0]    lineBuffers_0_regs_23;
  reg        [7:0]    lineBuffers_0_regs_24;
  reg        [7:0]    lineBuffers_0_regs_25;
  reg        [7:0]    lineBuffers_0_regs_26;
  reg        [7:0]    lineBuffers_0_regs_27;
  reg        [7:0]    lineBuffers_1_regs_0;
  reg        [7:0]    lineBuffers_1_regs_1;
  reg        [7:0]    lineBuffers_1_regs_2;
  reg        [7:0]    lineBuffers_1_regs_3;
  reg        [7:0]    lineBuffers_1_regs_4;
  reg        [7:0]    lineBuffers_1_regs_5;
  reg        [7:0]    lineBuffers_1_regs_6;
  reg        [7:0]    lineBuffers_1_regs_7;
  reg        [7:0]    lineBuffers_1_regs_8;
  reg        [7:0]    lineBuffers_1_regs_9;
  reg        [7:0]    lineBuffers_1_regs_10;
  reg        [7:0]    lineBuffers_1_regs_11;
  reg        [7:0]    lineBuffers_1_regs_12;
  reg        [7:0]    lineBuffers_1_regs_13;
  reg        [7:0]    lineBuffers_1_regs_14;
  reg        [7:0]    lineBuffers_1_regs_15;
  reg        [7:0]    lineBuffers_1_regs_16;
  reg        [7:0]    lineBuffers_1_regs_17;
  reg        [7:0]    lineBuffers_1_regs_18;
  reg        [7:0]    lineBuffers_1_regs_19;
  reg        [7:0]    lineBuffers_1_regs_20;
  reg        [7:0]    lineBuffers_1_regs_21;
  reg        [7:0]    lineBuffers_1_regs_22;
  reg        [7:0]    lineBuffers_1_regs_23;
  reg        [7:0]    lineBuffers_1_regs_24;
  reg        [7:0]    lineBuffers_1_regs_25;
  reg        [7:0]    lineBuffers_1_regs_26;
  reg        [7:0]    lineBuffers_1_regs_27;
  reg        [7:0]    lineBuffers_2_regs_0;
  reg        [7:0]    lineBuffers_2_regs_1;
  reg        [7:0]    lineBuffers_2_regs_2;
  reg        [7:0]    lineBuffers_2_regs_3;
  reg        [7:0]    lineBuffers_2_regs_4;
  reg        [7:0]    lineBuffers_2_regs_5;
  reg        [7:0]    lineBuffers_2_regs_6;
  reg        [7:0]    lineBuffers_2_regs_7;
  reg        [7:0]    lineBuffers_2_regs_8;
  reg        [7:0]    lineBuffers_2_regs_9;
  reg        [7:0]    lineBuffers_2_regs_10;
  reg        [7:0]    lineBuffers_2_regs_11;
  reg        [7:0]    lineBuffers_2_regs_12;
  reg        [7:0]    lineBuffers_2_regs_13;
  reg        [7:0]    lineBuffers_2_regs_14;
  reg        [7:0]    lineBuffers_2_regs_15;
  reg        [7:0]    lineBuffers_2_regs_16;
  reg        [7:0]    lineBuffers_2_regs_17;
  reg        [7:0]    lineBuffers_2_regs_18;
  reg        [7:0]    lineBuffers_2_regs_19;
  reg        [7:0]    lineBuffers_2_regs_20;
  reg        [7:0]    lineBuffers_2_regs_21;
  reg        [7:0]    lineBuffers_2_regs_22;
  reg        [7:0]    lineBuffers_2_regs_23;
  reg        [7:0]    lineBuffers_2_regs_24;
  reg        [7:0]    lineBuffers_2_regs_25;
  reg        [7:0]    lineBuffers_2_regs_26;
  reg        [7:0]    lineBuffers_2_regs_27;
  reg        [7:0]    lineBuffers_3_regs_0;
  reg        [7:0]    lineBuffers_3_regs_1;
  reg        [7:0]    lineBuffers_3_regs_2;
  reg        [7:0]    lineBuffers_3_regs_3;
  reg        [7:0]    lineBuffers_3_regs_4;
  reg        [7:0]    lineBuffers_3_regs_5;
  reg        [7:0]    lineBuffers_3_regs_6;
  reg        [7:0]    lineBuffers_3_regs_7;
  reg        [7:0]    lineBuffers_3_regs_8;
  reg        [7:0]    lineBuffers_3_regs_9;
  reg        [7:0]    lineBuffers_3_regs_10;
  reg        [7:0]    lineBuffers_3_regs_11;
  reg        [7:0]    lineBuffers_3_regs_12;
  reg        [7:0]    lineBuffers_3_regs_13;
  reg        [7:0]    lineBuffers_3_regs_14;
  reg        [7:0]    lineBuffers_3_regs_15;
  reg        [7:0]    lineBuffers_3_regs_16;
  reg        [7:0]    lineBuffers_3_regs_17;
  reg        [7:0]    lineBuffers_3_regs_18;
  reg        [7:0]    lineBuffers_3_regs_19;
  reg        [7:0]    lineBuffers_3_regs_20;
  reg        [7:0]    lineBuffers_3_regs_21;
  reg        [7:0]    lineBuffers_3_regs_22;
  reg        [7:0]    lineBuffers_3_regs_23;
  reg        [7:0]    lineBuffers_3_regs_24;
  reg        [7:0]    lineBuffers_3_regs_25;
  reg        [7:0]    lineBuffers_3_regs_26;
  reg        [7:0]    lineBuffers_3_regs_27;
  reg        [7:0]    shiftReg_0;
  reg        [7:0]    shiftReg_1;
  reg        [7:0]    shiftReg_2;
  reg        [7:0]    shiftReg_3;
  reg        [7:0]    shiftReg_4;
  reg        [7:0]    shiftReg_5;
  reg        [7:0]    shiftReg_6;
  reg        [7:0]    shiftReg_7;
  reg        [7:0]    shiftReg_8;
  reg        [7:0]    shiftReg_9;
  reg        [7:0]    shiftReg_10;
  reg        [7:0]    shiftReg_11;
  reg        [7:0]    shiftReg_12;
  reg        [7:0]    shiftReg_13;
  reg        [7:0]    shiftReg_14;
  reg        [7:0]    shiftReg_15;
  reg        [7:0]    shiftReg_16;
  reg        [7:0]    shiftReg_17;
  reg        [7:0]    shiftReg_18;
  reg        [7:0]    shiftReg_19;
  reg        [7:0]    shiftReg_20;
  reg        [7:0]    shiftReg_21;
  reg        [7:0]    shiftReg_22;
  reg        [7:0]    shiftReg_23;
  reg        [7:0]    shiftReg_24;
  reg        [7:0]    tempVecs_0_0;
  reg        [7:0]    tempVecs_1_0;
  reg        [7:0]    tempVecs_2_0;
  reg        [7:0]    tempVecs_3_0;
  reg        [7:0]    tempVecs_4_0;
  reg                 channelCount_willIncrement;
  wire                channelCount_willDecrement;
  reg                 channelCount_willClear;
  wire                channelCount_willLoad;
  wire                channelCount_willOverflowIfInc;
  wire                channelCount_willUnderflowIfDec;
  wire                channelCount_willOverflow;
  wire                channelCount_willUnderflow;
  reg                 x_willIncrement;
  wire                x_willDecrement;
  reg                 x_willClear;
  wire                x_willLoad;
  reg        [4:0]    x_valueNext;
  reg        [4:0]    x_value;
  wire                x_willOverflowIfInc;
  wire                x_willUnderflowIfDec;
  wire                x_willOverflow;
  wire                x_willUnderflow;
  reg                 y_willIncrement;
  wire                y_willDecrement;
  reg                 y_willClear;
  wire                y_willLoad;
  reg        [4:0]    y_valueNext;
  reg        [4:0]    y_value;
  wire                y_willOverflowIfInc;
  wire                y_willUnderflowIfDec;
  wire                y_willOverflow;
  wire                y_willUnderflow;
  reg                 windowCount_willIncrement;
  wire                windowCount_willDecrement;
  reg                 windowCount_willClear;
  wire                windowCount_willLoad;
  reg        [9:0]    windowCount_valueNext;
  reg        [9:0]    windowCount_value;
  wire                windowCount_willOverflowIfInc;
  wire                windowCount_willUnderflowIfDec;
  wire                windowCount_willOverflow;
  wire                windowCount_willUnderflow;
  reg                 outChunkCount_willIncrement;
  wire                outChunkCount_willDecrement;
  reg                 outChunkCount_willClear;
  wire                outChunkCount_willLoad;
  wire                outChunkCount_willOverflowIfInc;
  wire                outChunkCount_willUnderflowIfDec;
  wire                outChunkCount_willOverflow;
  wire                outChunkCount_willUnderflow;
  wire                isWindowValid;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  wire       [7:0]    fsm_currentPixels_0_0;
  wire       [7:0]    fsm_currentPixels_1_0;
  wire       [7:0]    fsm_currentPixels_2_0;
  wire       [7:0]    fsm_currentPixels_3_0;
  wire       [7:0]    fsm_currentPixels_4_0;
  reg        [2:0]    fsm_stateReg;
  reg        [2:0]    fsm_stateNext;
  wire                _zz_1;
  wire                _zz_2;
  wire                _zz_3;
  wire                _zz_4;
  wire                _zz_5;
  `ifndef SYNTHESIS
  reg [87:0] fsm_stateReg_string;
  reg [87:0] fsm_stateNext_string;
  `endif


  assign _zz_x_valueNext_1 = x_willIncrement;
  assign _zz_x_valueNext = {4'd0, _zz_x_valueNext_1};
  assign _zz_y_valueNext_1 = y_willIncrement;
  assign _zz_y_valueNext = {4'd0, _zz_y_valueNext_1};
  assign _zz_windowCount_valueNext_1 = windowCount_willIncrement;
  assign _zz_windowCount_valueNext = {9'd0, _zz_windowCount_valueNext_1};
  assign _zz_io_c_stream_payload_0_1 = (5'h0 + 5'h0);
  assign _zz_io_c_stream_payload_1_1 = (5'h0 + 5'h01);
  assign _zz_io_c_stream_payload_2_1 = (5'h0 + 5'h02);
  assign _zz_io_c_stream_payload_3_1 = (5'h0 + 5'h03);
  assign _zz_io_c_stream_payload_4_1 = (5'h0 + 5'h04);
  assign _zz_io_c_stream_payload_5_1 = (5'h0 + 5'h05);
  assign _zz_io_c_stream_payload_6_1 = (5'h0 + 5'h06);
  assign _zz_io_c_stream_payload_7_1 = (5'h0 + 5'h07);
  assign _zz_io_c_stream_payload_8_1 = (5'h0 + 5'h08);
  assign _zz_io_c_stream_payload_9_1 = (5'h0 + 5'h09);
  assign _zz_io_c_stream_payload_10_1 = (5'h0 + 5'h0a);
  assign _zz_io_c_stream_payload_11_1 = (5'h0 + 5'h0b);
  assign _zz_io_c_stream_payload_12_1 = (5'h0 + 5'h0c);
  assign _zz_io_c_stream_payload_13_1 = (5'h0 + 5'h0d);
  assign _zz_io_c_stream_payload_14_1 = (5'h0 + 5'h0e);
  assign _zz_io_c_stream_payload_15_1 = (5'h0 + 5'h0f);
  assign _zz_io_c_stream_payload_16_1 = (5'h0 + 5'h10);
  assign _zz_io_c_stream_payload_17_1 = (5'h0 + 5'h11);
  assign _zz_io_c_stream_payload_18_1 = (5'h0 + 5'h12);
  assign _zz_io_c_stream_payload_19_1 = (5'h0 + 5'h13);
  assign _zz_io_c_stream_payload_20_1 = (5'h0 + 5'h14);
  assign _zz_io_c_stream_payload_21_1 = (5'h0 + 5'h15);
  assign _zz_io_c_stream_payload_22_1 = (5'h0 + 5'h16);
  assign _zz_io_c_stream_payload_23_1 = (5'h0 + 5'h17);
  assign _zz_io_c_stream_payload_24_1 = (5'h0 + 5'h18);
  assign _zz__zz_1 = 1'b1;
  assign _zz__zz_2 = 1'b1;
  assign _zz__zz_3 = 1'b1;
  assign _zz__zz_4 = 1'b1;
  assign _zz__zz_5 = 1'b1;
  always @(*) begin
    case(_zz_io_c_stream_payload_0_1)
      5'b00000 : _zz_io_c_stream_payload_0 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_0 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_0 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_0 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_0 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_0 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_0 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_0 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_0 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_0 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_0 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_0 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_0 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_0 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_0 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_0 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_0 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_0 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_0 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_0 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_0 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_0 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_0 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_0 = shiftReg_23;
      default : _zz_io_c_stream_payload_0 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_1_1)
      5'b00000 : _zz_io_c_stream_payload_1 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_1 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_1 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_1 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_1 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_1 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_1 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_1 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_1 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_1 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_1 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_1 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_1 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_1 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_1 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_1 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_1 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_1 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_1 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_1 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_1 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_1 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_1 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_1 = shiftReg_23;
      default : _zz_io_c_stream_payload_1 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_2_1)
      5'b00000 : _zz_io_c_stream_payload_2 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_2 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_2 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_2 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_2 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_2 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_2 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_2 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_2 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_2 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_2 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_2 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_2 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_2 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_2 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_2 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_2 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_2 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_2 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_2 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_2 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_2 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_2 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_2 = shiftReg_23;
      default : _zz_io_c_stream_payload_2 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_3_1)
      5'b00000 : _zz_io_c_stream_payload_3 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_3 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_3 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_3 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_3 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_3 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_3 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_3 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_3 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_3 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_3 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_3 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_3 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_3 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_3 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_3 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_3 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_3 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_3 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_3 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_3 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_3 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_3 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_3 = shiftReg_23;
      default : _zz_io_c_stream_payload_3 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_4_1)
      5'b00000 : _zz_io_c_stream_payload_4 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_4 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_4 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_4 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_4 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_4 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_4 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_4 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_4 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_4 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_4 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_4 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_4 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_4 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_4 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_4 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_4 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_4 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_4 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_4 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_4 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_4 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_4 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_4 = shiftReg_23;
      default : _zz_io_c_stream_payload_4 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_5_1)
      5'b00000 : _zz_io_c_stream_payload_5 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_5 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_5 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_5 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_5 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_5 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_5 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_5 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_5 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_5 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_5 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_5 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_5 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_5 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_5 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_5 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_5 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_5 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_5 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_5 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_5 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_5 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_5 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_5 = shiftReg_23;
      default : _zz_io_c_stream_payload_5 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_6_1)
      5'b00000 : _zz_io_c_stream_payload_6 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_6 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_6 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_6 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_6 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_6 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_6 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_6 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_6 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_6 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_6 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_6 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_6 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_6 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_6 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_6 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_6 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_6 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_6 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_6 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_6 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_6 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_6 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_6 = shiftReg_23;
      default : _zz_io_c_stream_payload_6 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_7_1)
      5'b00000 : _zz_io_c_stream_payload_7 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_7 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_7 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_7 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_7 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_7 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_7 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_7 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_7 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_7 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_7 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_7 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_7 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_7 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_7 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_7 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_7 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_7 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_7 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_7 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_7 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_7 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_7 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_7 = shiftReg_23;
      default : _zz_io_c_stream_payload_7 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_8_1)
      5'b00000 : _zz_io_c_stream_payload_8 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_8 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_8 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_8 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_8 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_8 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_8 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_8 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_8 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_8 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_8 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_8 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_8 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_8 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_8 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_8 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_8 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_8 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_8 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_8 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_8 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_8 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_8 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_8 = shiftReg_23;
      default : _zz_io_c_stream_payload_8 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_9_1)
      5'b00000 : _zz_io_c_stream_payload_9 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_9 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_9 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_9 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_9 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_9 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_9 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_9 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_9 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_9 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_9 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_9 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_9 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_9 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_9 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_9 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_9 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_9 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_9 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_9 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_9 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_9 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_9 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_9 = shiftReg_23;
      default : _zz_io_c_stream_payload_9 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_10_1)
      5'b00000 : _zz_io_c_stream_payload_10 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_10 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_10 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_10 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_10 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_10 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_10 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_10 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_10 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_10 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_10 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_10 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_10 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_10 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_10 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_10 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_10 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_10 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_10 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_10 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_10 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_10 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_10 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_10 = shiftReg_23;
      default : _zz_io_c_stream_payload_10 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_11_1)
      5'b00000 : _zz_io_c_stream_payload_11 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_11 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_11 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_11 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_11 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_11 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_11 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_11 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_11 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_11 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_11 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_11 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_11 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_11 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_11 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_11 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_11 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_11 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_11 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_11 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_11 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_11 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_11 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_11 = shiftReg_23;
      default : _zz_io_c_stream_payload_11 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_12_1)
      5'b00000 : _zz_io_c_stream_payload_12 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_12 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_12 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_12 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_12 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_12 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_12 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_12 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_12 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_12 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_12 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_12 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_12 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_12 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_12 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_12 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_12 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_12 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_12 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_12 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_12 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_12 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_12 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_12 = shiftReg_23;
      default : _zz_io_c_stream_payload_12 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_13_1)
      5'b00000 : _zz_io_c_stream_payload_13 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_13 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_13 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_13 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_13 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_13 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_13 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_13 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_13 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_13 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_13 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_13 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_13 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_13 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_13 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_13 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_13 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_13 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_13 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_13 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_13 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_13 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_13 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_13 = shiftReg_23;
      default : _zz_io_c_stream_payload_13 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_14_1)
      5'b00000 : _zz_io_c_stream_payload_14 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_14 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_14 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_14 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_14 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_14 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_14 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_14 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_14 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_14 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_14 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_14 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_14 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_14 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_14 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_14 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_14 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_14 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_14 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_14 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_14 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_14 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_14 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_14 = shiftReg_23;
      default : _zz_io_c_stream_payload_14 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_15_1)
      5'b00000 : _zz_io_c_stream_payload_15 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_15 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_15 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_15 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_15 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_15 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_15 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_15 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_15 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_15 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_15 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_15 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_15 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_15 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_15 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_15 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_15 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_15 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_15 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_15 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_15 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_15 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_15 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_15 = shiftReg_23;
      default : _zz_io_c_stream_payload_15 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_16_1)
      5'b00000 : _zz_io_c_stream_payload_16 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_16 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_16 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_16 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_16 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_16 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_16 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_16 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_16 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_16 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_16 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_16 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_16 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_16 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_16 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_16 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_16 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_16 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_16 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_16 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_16 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_16 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_16 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_16 = shiftReg_23;
      default : _zz_io_c_stream_payload_16 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_17_1)
      5'b00000 : _zz_io_c_stream_payload_17 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_17 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_17 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_17 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_17 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_17 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_17 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_17 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_17 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_17 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_17 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_17 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_17 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_17 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_17 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_17 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_17 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_17 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_17 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_17 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_17 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_17 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_17 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_17 = shiftReg_23;
      default : _zz_io_c_stream_payload_17 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_18_1)
      5'b00000 : _zz_io_c_stream_payload_18 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_18 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_18 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_18 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_18 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_18 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_18 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_18 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_18 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_18 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_18 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_18 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_18 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_18 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_18 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_18 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_18 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_18 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_18 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_18 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_18 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_18 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_18 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_18 = shiftReg_23;
      default : _zz_io_c_stream_payload_18 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_19_1)
      5'b00000 : _zz_io_c_stream_payload_19 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_19 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_19 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_19 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_19 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_19 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_19 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_19 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_19 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_19 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_19 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_19 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_19 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_19 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_19 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_19 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_19 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_19 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_19 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_19 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_19 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_19 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_19 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_19 = shiftReg_23;
      default : _zz_io_c_stream_payload_19 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_20_1)
      5'b00000 : _zz_io_c_stream_payload_20 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_20 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_20 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_20 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_20 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_20 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_20 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_20 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_20 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_20 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_20 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_20 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_20 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_20 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_20 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_20 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_20 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_20 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_20 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_20 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_20 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_20 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_20 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_20 = shiftReg_23;
      default : _zz_io_c_stream_payload_20 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_21_1)
      5'b00000 : _zz_io_c_stream_payload_21 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_21 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_21 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_21 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_21 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_21 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_21 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_21 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_21 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_21 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_21 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_21 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_21 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_21 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_21 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_21 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_21 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_21 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_21 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_21 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_21 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_21 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_21 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_21 = shiftReg_23;
      default : _zz_io_c_stream_payload_21 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_22_1)
      5'b00000 : _zz_io_c_stream_payload_22 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_22 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_22 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_22 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_22 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_22 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_22 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_22 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_22 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_22 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_22 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_22 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_22 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_22 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_22 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_22 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_22 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_22 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_22 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_22 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_22 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_22 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_22 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_22 = shiftReg_23;
      default : _zz_io_c_stream_payload_22 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_23_1)
      5'b00000 : _zz_io_c_stream_payload_23 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_23 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_23 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_23 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_23 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_23 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_23 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_23 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_23 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_23 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_23 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_23 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_23 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_23 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_23 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_23 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_23 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_23 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_23 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_23 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_23 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_23 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_23 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_23 = shiftReg_23;
      default : _zz_io_c_stream_payload_23 = shiftReg_24;
    endcase
  end

  always @(*) begin
    case(_zz_io_c_stream_payload_24_1)
      5'b00000 : _zz_io_c_stream_payload_24 = shiftReg_0;
      5'b00001 : _zz_io_c_stream_payload_24 = shiftReg_1;
      5'b00010 : _zz_io_c_stream_payload_24 = shiftReg_2;
      5'b00011 : _zz_io_c_stream_payload_24 = shiftReg_3;
      5'b00100 : _zz_io_c_stream_payload_24 = shiftReg_4;
      5'b00101 : _zz_io_c_stream_payload_24 = shiftReg_5;
      5'b00110 : _zz_io_c_stream_payload_24 = shiftReg_6;
      5'b00111 : _zz_io_c_stream_payload_24 = shiftReg_7;
      5'b01000 : _zz_io_c_stream_payload_24 = shiftReg_8;
      5'b01001 : _zz_io_c_stream_payload_24 = shiftReg_9;
      5'b01010 : _zz_io_c_stream_payload_24 = shiftReg_10;
      5'b01011 : _zz_io_c_stream_payload_24 = shiftReg_11;
      5'b01100 : _zz_io_c_stream_payload_24 = shiftReg_12;
      5'b01101 : _zz_io_c_stream_payload_24 = shiftReg_13;
      5'b01110 : _zz_io_c_stream_payload_24 = shiftReg_14;
      5'b01111 : _zz_io_c_stream_payload_24 = shiftReg_15;
      5'b10000 : _zz_io_c_stream_payload_24 = shiftReg_16;
      5'b10001 : _zz_io_c_stream_payload_24 = shiftReg_17;
      5'b10010 : _zz_io_c_stream_payload_24 = shiftReg_18;
      5'b10011 : _zz_io_c_stream_payload_24 = shiftReg_19;
      5'b10100 : _zz_io_c_stream_payload_24 = shiftReg_20;
      5'b10101 : _zz_io_c_stream_payload_24 = shiftReg_21;
      5'b10110 : _zz_io_c_stream_payload_24 = shiftReg_22;
      5'b10111 : _zz_io_c_stream_payload_24 = shiftReg_23;
      default : _zz_io_c_stream_payload_24 = shiftReg_24;
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_1_BOOT : fsm_stateReg_string = "BOOT       ";
      fsm_1_stateFill : fsm_stateReg_string = "stateFill  ";
      fsm_1_stateOutput : fsm_stateReg_string = "stateOutput";
      fsm_1_stateWaitA : fsm_stateReg_string = "stateWaitA ";
      fsm_1_stateDone : fsm_stateReg_string = "stateDone  ";
      default : fsm_stateReg_string = "???????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_1_BOOT : fsm_stateNext_string = "BOOT       ";
      fsm_1_stateFill : fsm_stateNext_string = "stateFill  ";
      fsm_1_stateOutput : fsm_stateNext_string = "stateOutput";
      fsm_1_stateWaitA : fsm_stateNext_string = "stateWaitA ";
      fsm_1_stateDone : fsm_stateNext_string = "stateDone  ";
      default : fsm_stateNext_string = "???????????";
    endcase
  end
  `endif

  always @(*) begin
    channelCount_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_1_stateFill : begin
        if(io_a_stream_valid) begin
          channelCount_willIncrement = 1'b1;
        end
      end
      fsm_1_stateOutput : begin
      end
      fsm_1_stateWaitA : begin
        if(io_a_stream_valid) begin
          channelCount_willIncrement = 1'b1;
        end
      end
      fsm_1_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  assign channelCount_willDecrement = 1'b0;
  always @(*) begin
    channelCount_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_1_stateFill : begin
      end
      fsm_1_stateOutput : begin
      end
      fsm_1_stateWaitA : begin
      end
      fsm_1_stateDone : begin
        channelCount_willClear = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign channelCount_willLoad = 1'b0;
  assign channelCount_willOverflowIfInc = 1'b1;
  assign channelCount_willUnderflowIfDec = 1'b1;
  assign channelCount_willOverflow = (channelCount_willOverflowIfInc && channelCount_willIncrement);
  assign channelCount_willUnderflow = (channelCount_willUnderflowIfDec && channelCount_willDecrement);
  always @(*) begin
    x_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_1_stateFill : begin
        if(io_a_stream_valid) begin
          if(channelCount_willOverflowIfInc) begin
            x_willIncrement = 1'b1;
          end
        end
      end
      fsm_1_stateOutput : begin
      end
      fsm_1_stateWaitA : begin
        if(io_a_stream_valid) begin
          if(channelCount_willOverflowIfInc) begin
            x_willIncrement = 1'b1;
          end
        end
      end
      fsm_1_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  assign x_willDecrement = 1'b0;
  always @(*) begin
    x_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_1_stateFill : begin
      end
      fsm_1_stateOutput : begin
      end
      fsm_1_stateWaitA : begin
      end
      fsm_1_stateDone : begin
        x_willClear = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign x_willLoad = 1'b0;
  assign x_willOverflowIfInc = (x_value == 5'h1b);
  assign x_willUnderflowIfDec = (x_value == 5'h0);
  assign x_willOverflow = (x_willOverflowIfInc && x_willIncrement);
  always @(*) begin
    x_valueNext = (x_value + _zz_x_valueNext);
    if(x_willOverflow) begin
      x_valueNext = 5'h0;
    end
    if(x_willClear) begin
      x_valueNext = 5'h0;
    end
  end

  assign x_willUnderflow = (x_willUnderflowIfDec && x_willDecrement);
  always @(*) begin
    y_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_1_stateFill : begin
        if(io_a_stream_valid) begin
          if(channelCount_willOverflowIfInc) begin
            if(x_willOverflowIfInc) begin
              y_willIncrement = 1'b1;
            end
          end
        end
      end
      fsm_1_stateOutput : begin
      end
      fsm_1_stateWaitA : begin
        if(io_a_stream_valid) begin
          if(channelCount_willOverflowIfInc) begin
            if(x_willOverflowIfInc) begin
              y_willIncrement = 1'b1;
            end
          end
        end
      end
      fsm_1_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  assign y_willDecrement = 1'b0;
  always @(*) begin
    y_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_1_stateFill : begin
      end
      fsm_1_stateOutput : begin
      end
      fsm_1_stateWaitA : begin
      end
      fsm_1_stateDone : begin
        y_willClear = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign y_willLoad = 1'b0;
  assign y_willOverflowIfInc = (y_value == 5'h1b);
  assign y_willUnderflowIfDec = (y_value == 5'h0);
  assign y_willOverflow = (y_willOverflowIfInc && y_willIncrement);
  always @(*) begin
    y_valueNext = (y_value + _zz_y_valueNext);
    if(y_willOverflow) begin
      y_valueNext = 5'h0;
    end
    if(y_willClear) begin
      y_valueNext = 5'h0;
    end
  end

  assign y_willUnderflow = (y_willUnderflowIfDec && y_willDecrement);
  always @(*) begin
    windowCount_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_1_stateFill : begin
      end
      fsm_1_stateOutput : begin
        if(io_c_stream_ready) begin
          if(outChunkCount_willOverflowIfInc) begin
            windowCount_willIncrement = 1'b1;
          end
        end
      end
      fsm_1_stateWaitA : begin
      end
      fsm_1_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  assign windowCount_willDecrement = 1'b0;
  always @(*) begin
    windowCount_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_1_stateFill : begin
      end
      fsm_1_stateOutput : begin
      end
      fsm_1_stateWaitA : begin
      end
      fsm_1_stateDone : begin
        windowCount_willClear = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign windowCount_willLoad = 1'b0;
  assign windowCount_willOverflowIfInc = (windowCount_value == 10'h23f);
  assign windowCount_willUnderflowIfDec = (windowCount_value == 10'h0);
  assign windowCount_willOverflow = (windowCount_willOverflowIfInc && windowCount_willIncrement);
  always @(*) begin
    windowCount_valueNext = (windowCount_value + _zz_windowCount_valueNext);
    if(windowCount_willOverflow) begin
      windowCount_valueNext = 10'h0;
    end
    if(windowCount_willClear) begin
      windowCount_valueNext = 10'h0;
    end
  end

  assign windowCount_willUnderflow = (windowCount_willUnderflowIfDec && windowCount_willDecrement);
  always @(*) begin
    outChunkCount_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_1_stateFill : begin
      end
      fsm_1_stateOutput : begin
        if(io_c_stream_ready) begin
          outChunkCount_willIncrement = 1'b1;
        end
      end
      fsm_1_stateWaitA : begin
      end
      fsm_1_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  assign outChunkCount_willDecrement = 1'b0;
  always @(*) begin
    outChunkCount_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_1_stateFill : begin
      end
      fsm_1_stateOutput : begin
      end
      fsm_1_stateWaitA : begin
      end
      fsm_1_stateDone : begin
        outChunkCount_willClear = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign outChunkCount_willLoad = 1'b0;
  assign outChunkCount_willOverflowIfInc = 1'b1;
  assign outChunkCount_willUnderflowIfDec = 1'b1;
  assign outChunkCount_willOverflow = (outChunkCount_willOverflowIfInc && outChunkCount_willIncrement);
  assign outChunkCount_willUnderflow = (outChunkCount_willUnderflowIfDec && outChunkCount_willDecrement);
  always @(*) begin
    io_a_stream_ready = 1'b0;
    case(fsm_stateReg)
      fsm_1_stateFill : begin
        io_a_stream_ready = 1'b1;
      end
      fsm_1_stateOutput : begin
      end
      fsm_1_stateWaitA : begin
        io_a_stream_ready = 1'b1;
      end
      fsm_1_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_c_stream_valid = 1'b0;
    case(fsm_stateReg)
      fsm_1_stateFill : begin
      end
      fsm_1_stateOutput : begin
        io_c_stream_valid = 1'b1;
      end
      fsm_1_stateWaitA : begin
      end
      fsm_1_stateDone : begin
      end
      default : begin
      end
    endcase
  end

  assign io_c_stream_payload_0 = _zz_io_c_stream_payload_0;
  assign io_c_stream_payload_1 = _zz_io_c_stream_payload_1;
  assign io_c_stream_payload_2 = _zz_io_c_stream_payload_2;
  assign io_c_stream_payload_3 = _zz_io_c_stream_payload_3;
  assign io_c_stream_payload_4 = _zz_io_c_stream_payload_4;
  assign io_c_stream_payload_5 = _zz_io_c_stream_payload_5;
  assign io_c_stream_payload_6 = _zz_io_c_stream_payload_6;
  assign io_c_stream_payload_7 = _zz_io_c_stream_payload_7;
  assign io_c_stream_payload_8 = _zz_io_c_stream_payload_8;
  assign io_c_stream_payload_9 = _zz_io_c_stream_payload_9;
  assign io_c_stream_payload_10 = _zz_io_c_stream_payload_10;
  assign io_c_stream_payload_11 = _zz_io_c_stream_payload_11;
  assign io_c_stream_payload_12 = _zz_io_c_stream_payload_12;
  assign io_c_stream_payload_13 = _zz_io_c_stream_payload_13;
  assign io_c_stream_payload_14 = _zz_io_c_stream_payload_14;
  assign io_c_stream_payload_15 = _zz_io_c_stream_payload_15;
  assign io_c_stream_payload_16 = _zz_io_c_stream_payload_16;
  assign io_c_stream_payload_17 = _zz_io_c_stream_payload_17;
  assign io_c_stream_payload_18 = _zz_io_c_stream_payload_18;
  assign io_c_stream_payload_19 = _zz_io_c_stream_payload_19;
  assign io_c_stream_payload_20 = _zz_io_c_stream_payload_20;
  assign io_c_stream_payload_21 = _zz_io_c_stream_payload_21;
  assign io_c_stream_payload_22 = _zz_io_c_stream_payload_22;
  assign io_c_stream_payload_23 = _zz_io_c_stream_payload_23;
  assign io_c_stream_payload_24 = _zz_io_c_stream_payload_24;
  assign isWindowValid = ((5'h04 <= x_value) && (5'h04 <= y_value));
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_1_stateFill : begin
      end
      fsm_1_stateOutput : begin
      end
      fsm_1_stateWaitA : begin
      end
      fsm_1_stateDone : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  assign fsm_currentPixels_0_0 = lineBuffers_3_regs_27;
  assign fsm_currentPixels_1_0 = lineBuffers_2_regs_27;
  assign fsm_currentPixels_2_0 = lineBuffers_1_regs_27;
  assign fsm_currentPixels_3_0 = lineBuffers_0_regs_27;
  assign fsm_currentPixels_4_0 = io_a_stream_payload_0;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_1_stateFill : begin
        if(io_a_stream_valid) begin
          if(channelCount_willOverflowIfInc) begin
            if(isWindowValid) begin
              fsm_stateNext = fsm_1_stateOutput;
            end
          end
        end
      end
      fsm_1_stateOutput : begin
        if(io_c_stream_ready) begin
          if(outChunkCount_willOverflowIfInc) begin
            if(windowCount_willOverflowIfInc) begin
              fsm_stateNext = fsm_1_stateDone;
            end else begin
              fsm_stateNext = fsm_1_stateWaitA;
            end
          end
        end
      end
      fsm_1_stateWaitA : begin
        if(io_a_stream_valid) begin
          if(channelCount_willOverflowIfInc) begin
            if(isWindowValid) begin
              fsm_stateNext = fsm_1_stateOutput;
            end else begin
              fsm_stateNext = fsm_1_stateFill;
            end
          end
        end
      end
      fsm_1_stateDone : begin
        fsm_stateNext = fsm_1_stateFill;
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_1_stateFill;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_1_BOOT;
    end
  end

  assign _zz_1 = _zz__zz_1[0];
  assign _zz_2 = _zz__zz_2[0];
  assign _zz_3 = _zz__zz_3[0];
  assign _zz_4 = _zz__zz_4[0];
  assign _zz_5 = _zz__zz_5[0];
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      lineBuffers_0_regs_0 <= 8'h0;
      lineBuffers_0_regs_1 <= 8'h0;
      lineBuffers_0_regs_2 <= 8'h0;
      lineBuffers_0_regs_3 <= 8'h0;
      lineBuffers_0_regs_4 <= 8'h0;
      lineBuffers_0_regs_5 <= 8'h0;
      lineBuffers_0_regs_6 <= 8'h0;
      lineBuffers_0_regs_7 <= 8'h0;
      lineBuffers_0_regs_8 <= 8'h0;
      lineBuffers_0_regs_9 <= 8'h0;
      lineBuffers_0_regs_10 <= 8'h0;
      lineBuffers_0_regs_11 <= 8'h0;
      lineBuffers_0_regs_12 <= 8'h0;
      lineBuffers_0_regs_13 <= 8'h0;
      lineBuffers_0_regs_14 <= 8'h0;
      lineBuffers_0_regs_15 <= 8'h0;
      lineBuffers_0_regs_16 <= 8'h0;
      lineBuffers_0_regs_17 <= 8'h0;
      lineBuffers_0_regs_18 <= 8'h0;
      lineBuffers_0_regs_19 <= 8'h0;
      lineBuffers_0_regs_20 <= 8'h0;
      lineBuffers_0_regs_21 <= 8'h0;
      lineBuffers_0_regs_22 <= 8'h0;
      lineBuffers_0_regs_23 <= 8'h0;
      lineBuffers_0_regs_24 <= 8'h0;
      lineBuffers_0_regs_25 <= 8'h0;
      lineBuffers_0_regs_26 <= 8'h0;
      lineBuffers_0_regs_27 <= 8'h0;
      lineBuffers_1_regs_0 <= 8'h0;
      lineBuffers_1_regs_1 <= 8'h0;
      lineBuffers_1_regs_2 <= 8'h0;
      lineBuffers_1_regs_3 <= 8'h0;
      lineBuffers_1_regs_4 <= 8'h0;
      lineBuffers_1_regs_5 <= 8'h0;
      lineBuffers_1_regs_6 <= 8'h0;
      lineBuffers_1_regs_7 <= 8'h0;
      lineBuffers_1_regs_8 <= 8'h0;
      lineBuffers_1_regs_9 <= 8'h0;
      lineBuffers_1_regs_10 <= 8'h0;
      lineBuffers_1_regs_11 <= 8'h0;
      lineBuffers_1_regs_12 <= 8'h0;
      lineBuffers_1_regs_13 <= 8'h0;
      lineBuffers_1_regs_14 <= 8'h0;
      lineBuffers_1_regs_15 <= 8'h0;
      lineBuffers_1_regs_16 <= 8'h0;
      lineBuffers_1_regs_17 <= 8'h0;
      lineBuffers_1_regs_18 <= 8'h0;
      lineBuffers_1_regs_19 <= 8'h0;
      lineBuffers_1_regs_20 <= 8'h0;
      lineBuffers_1_regs_21 <= 8'h0;
      lineBuffers_1_regs_22 <= 8'h0;
      lineBuffers_1_regs_23 <= 8'h0;
      lineBuffers_1_regs_24 <= 8'h0;
      lineBuffers_1_regs_25 <= 8'h0;
      lineBuffers_1_regs_26 <= 8'h0;
      lineBuffers_1_regs_27 <= 8'h0;
      lineBuffers_2_regs_0 <= 8'h0;
      lineBuffers_2_regs_1 <= 8'h0;
      lineBuffers_2_regs_2 <= 8'h0;
      lineBuffers_2_regs_3 <= 8'h0;
      lineBuffers_2_regs_4 <= 8'h0;
      lineBuffers_2_regs_5 <= 8'h0;
      lineBuffers_2_regs_6 <= 8'h0;
      lineBuffers_2_regs_7 <= 8'h0;
      lineBuffers_2_regs_8 <= 8'h0;
      lineBuffers_2_regs_9 <= 8'h0;
      lineBuffers_2_regs_10 <= 8'h0;
      lineBuffers_2_regs_11 <= 8'h0;
      lineBuffers_2_regs_12 <= 8'h0;
      lineBuffers_2_regs_13 <= 8'h0;
      lineBuffers_2_regs_14 <= 8'h0;
      lineBuffers_2_regs_15 <= 8'h0;
      lineBuffers_2_regs_16 <= 8'h0;
      lineBuffers_2_regs_17 <= 8'h0;
      lineBuffers_2_regs_18 <= 8'h0;
      lineBuffers_2_regs_19 <= 8'h0;
      lineBuffers_2_regs_20 <= 8'h0;
      lineBuffers_2_regs_21 <= 8'h0;
      lineBuffers_2_regs_22 <= 8'h0;
      lineBuffers_2_regs_23 <= 8'h0;
      lineBuffers_2_regs_24 <= 8'h0;
      lineBuffers_2_regs_25 <= 8'h0;
      lineBuffers_2_regs_26 <= 8'h0;
      lineBuffers_2_regs_27 <= 8'h0;
      lineBuffers_3_regs_0 <= 8'h0;
      lineBuffers_3_regs_1 <= 8'h0;
      lineBuffers_3_regs_2 <= 8'h0;
      lineBuffers_3_regs_3 <= 8'h0;
      lineBuffers_3_regs_4 <= 8'h0;
      lineBuffers_3_regs_5 <= 8'h0;
      lineBuffers_3_regs_6 <= 8'h0;
      lineBuffers_3_regs_7 <= 8'h0;
      lineBuffers_3_regs_8 <= 8'h0;
      lineBuffers_3_regs_9 <= 8'h0;
      lineBuffers_3_regs_10 <= 8'h0;
      lineBuffers_3_regs_11 <= 8'h0;
      lineBuffers_3_regs_12 <= 8'h0;
      lineBuffers_3_regs_13 <= 8'h0;
      lineBuffers_3_regs_14 <= 8'h0;
      lineBuffers_3_regs_15 <= 8'h0;
      lineBuffers_3_regs_16 <= 8'h0;
      lineBuffers_3_regs_17 <= 8'h0;
      lineBuffers_3_regs_18 <= 8'h0;
      lineBuffers_3_regs_19 <= 8'h0;
      lineBuffers_3_regs_20 <= 8'h0;
      lineBuffers_3_regs_21 <= 8'h0;
      lineBuffers_3_regs_22 <= 8'h0;
      lineBuffers_3_regs_23 <= 8'h0;
      lineBuffers_3_regs_24 <= 8'h0;
      lineBuffers_3_regs_25 <= 8'h0;
      lineBuffers_3_regs_26 <= 8'h0;
      lineBuffers_3_regs_27 <= 8'h0;
      shiftReg_0 <= 8'h0;
      shiftReg_1 <= 8'h0;
      shiftReg_2 <= 8'h0;
      shiftReg_3 <= 8'h0;
      shiftReg_4 <= 8'h0;
      shiftReg_5 <= 8'h0;
      shiftReg_6 <= 8'h0;
      shiftReg_7 <= 8'h0;
      shiftReg_8 <= 8'h0;
      shiftReg_9 <= 8'h0;
      shiftReg_10 <= 8'h0;
      shiftReg_11 <= 8'h0;
      shiftReg_12 <= 8'h0;
      shiftReg_13 <= 8'h0;
      shiftReg_14 <= 8'h0;
      shiftReg_15 <= 8'h0;
      shiftReg_16 <= 8'h0;
      shiftReg_17 <= 8'h0;
      shiftReg_18 <= 8'h0;
      shiftReg_19 <= 8'h0;
      shiftReg_20 <= 8'h0;
      shiftReg_21 <= 8'h0;
      shiftReg_22 <= 8'h0;
      shiftReg_23 <= 8'h0;
      shiftReg_24 <= 8'h0;
      tempVecs_0_0 <= 8'h0;
      tempVecs_1_0 <= 8'h0;
      tempVecs_2_0 <= 8'h0;
      tempVecs_3_0 <= 8'h0;
      tempVecs_4_0 <= 8'h0;
      x_value <= 5'h0;
      y_value <= 5'h0;
      windowCount_value <= 10'h0;
      fsm_stateReg <= fsm_1_BOOT;
    end else begin
      x_value <= x_valueNext;
      y_value <= y_valueNext;
      windowCount_value <= windowCount_valueNext;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_1_stateFill : begin
          if(io_a_stream_valid) begin
            if(_zz_1) begin
              tempVecs_4_0 <= io_a_stream_payload_0;
            end
            if(_zz_2) begin
              tempVecs_3_0 <= lineBuffers_0_regs_27;
            end
            if(_zz_3) begin
              tempVecs_2_0 <= lineBuffers_1_regs_27;
            end
            if(_zz_4) begin
              tempVecs_1_0 <= lineBuffers_2_regs_27;
            end
            if(_zz_5) begin
              tempVecs_0_0 <= lineBuffers_3_regs_27;
            end
            lineBuffers_3_regs_27 <= lineBuffers_3_regs_26;
            lineBuffers_3_regs_26 <= lineBuffers_3_regs_25;
            lineBuffers_3_regs_25 <= lineBuffers_3_regs_24;
            lineBuffers_3_regs_24 <= lineBuffers_3_regs_23;
            lineBuffers_3_regs_23 <= lineBuffers_3_regs_22;
            lineBuffers_3_regs_22 <= lineBuffers_3_regs_21;
            lineBuffers_3_regs_21 <= lineBuffers_3_regs_20;
            lineBuffers_3_regs_20 <= lineBuffers_3_regs_19;
            lineBuffers_3_regs_19 <= lineBuffers_3_regs_18;
            lineBuffers_3_regs_18 <= lineBuffers_3_regs_17;
            lineBuffers_3_regs_17 <= lineBuffers_3_regs_16;
            lineBuffers_3_regs_16 <= lineBuffers_3_regs_15;
            lineBuffers_3_regs_15 <= lineBuffers_3_regs_14;
            lineBuffers_3_regs_14 <= lineBuffers_3_regs_13;
            lineBuffers_3_regs_13 <= lineBuffers_3_regs_12;
            lineBuffers_3_regs_12 <= lineBuffers_3_regs_11;
            lineBuffers_3_regs_11 <= lineBuffers_3_regs_10;
            lineBuffers_3_regs_10 <= lineBuffers_3_regs_9;
            lineBuffers_3_regs_9 <= lineBuffers_3_regs_8;
            lineBuffers_3_regs_8 <= lineBuffers_3_regs_7;
            lineBuffers_3_regs_7 <= lineBuffers_3_regs_6;
            lineBuffers_3_regs_6 <= lineBuffers_3_regs_5;
            lineBuffers_3_regs_5 <= lineBuffers_3_regs_4;
            lineBuffers_3_regs_4 <= lineBuffers_3_regs_3;
            lineBuffers_3_regs_3 <= lineBuffers_3_regs_2;
            lineBuffers_3_regs_2 <= lineBuffers_3_regs_1;
            lineBuffers_3_regs_1 <= lineBuffers_3_regs_0;
            lineBuffers_3_regs_0 <= lineBuffers_2_regs_27;
            lineBuffers_2_regs_27 <= lineBuffers_2_regs_26;
            lineBuffers_2_regs_26 <= lineBuffers_2_regs_25;
            lineBuffers_2_regs_25 <= lineBuffers_2_regs_24;
            lineBuffers_2_regs_24 <= lineBuffers_2_regs_23;
            lineBuffers_2_regs_23 <= lineBuffers_2_regs_22;
            lineBuffers_2_regs_22 <= lineBuffers_2_regs_21;
            lineBuffers_2_regs_21 <= lineBuffers_2_regs_20;
            lineBuffers_2_regs_20 <= lineBuffers_2_regs_19;
            lineBuffers_2_regs_19 <= lineBuffers_2_regs_18;
            lineBuffers_2_regs_18 <= lineBuffers_2_regs_17;
            lineBuffers_2_regs_17 <= lineBuffers_2_regs_16;
            lineBuffers_2_regs_16 <= lineBuffers_2_regs_15;
            lineBuffers_2_regs_15 <= lineBuffers_2_regs_14;
            lineBuffers_2_regs_14 <= lineBuffers_2_regs_13;
            lineBuffers_2_regs_13 <= lineBuffers_2_regs_12;
            lineBuffers_2_regs_12 <= lineBuffers_2_regs_11;
            lineBuffers_2_regs_11 <= lineBuffers_2_regs_10;
            lineBuffers_2_regs_10 <= lineBuffers_2_regs_9;
            lineBuffers_2_regs_9 <= lineBuffers_2_regs_8;
            lineBuffers_2_regs_8 <= lineBuffers_2_regs_7;
            lineBuffers_2_regs_7 <= lineBuffers_2_regs_6;
            lineBuffers_2_regs_6 <= lineBuffers_2_regs_5;
            lineBuffers_2_regs_5 <= lineBuffers_2_regs_4;
            lineBuffers_2_regs_4 <= lineBuffers_2_regs_3;
            lineBuffers_2_regs_3 <= lineBuffers_2_regs_2;
            lineBuffers_2_regs_2 <= lineBuffers_2_regs_1;
            lineBuffers_2_regs_1 <= lineBuffers_2_regs_0;
            lineBuffers_2_regs_0 <= lineBuffers_1_regs_27;
            lineBuffers_1_regs_27 <= lineBuffers_1_regs_26;
            lineBuffers_1_regs_26 <= lineBuffers_1_regs_25;
            lineBuffers_1_regs_25 <= lineBuffers_1_regs_24;
            lineBuffers_1_regs_24 <= lineBuffers_1_regs_23;
            lineBuffers_1_regs_23 <= lineBuffers_1_regs_22;
            lineBuffers_1_regs_22 <= lineBuffers_1_regs_21;
            lineBuffers_1_regs_21 <= lineBuffers_1_regs_20;
            lineBuffers_1_regs_20 <= lineBuffers_1_regs_19;
            lineBuffers_1_regs_19 <= lineBuffers_1_regs_18;
            lineBuffers_1_regs_18 <= lineBuffers_1_regs_17;
            lineBuffers_1_regs_17 <= lineBuffers_1_regs_16;
            lineBuffers_1_regs_16 <= lineBuffers_1_regs_15;
            lineBuffers_1_regs_15 <= lineBuffers_1_regs_14;
            lineBuffers_1_regs_14 <= lineBuffers_1_regs_13;
            lineBuffers_1_regs_13 <= lineBuffers_1_regs_12;
            lineBuffers_1_regs_12 <= lineBuffers_1_regs_11;
            lineBuffers_1_regs_11 <= lineBuffers_1_regs_10;
            lineBuffers_1_regs_10 <= lineBuffers_1_regs_9;
            lineBuffers_1_regs_9 <= lineBuffers_1_regs_8;
            lineBuffers_1_regs_8 <= lineBuffers_1_regs_7;
            lineBuffers_1_regs_7 <= lineBuffers_1_regs_6;
            lineBuffers_1_regs_6 <= lineBuffers_1_regs_5;
            lineBuffers_1_regs_5 <= lineBuffers_1_regs_4;
            lineBuffers_1_regs_4 <= lineBuffers_1_regs_3;
            lineBuffers_1_regs_3 <= lineBuffers_1_regs_2;
            lineBuffers_1_regs_2 <= lineBuffers_1_regs_1;
            lineBuffers_1_regs_1 <= lineBuffers_1_regs_0;
            lineBuffers_1_regs_0 <= lineBuffers_0_regs_27;
            lineBuffers_0_regs_27 <= lineBuffers_0_regs_26;
            lineBuffers_0_regs_26 <= lineBuffers_0_regs_25;
            lineBuffers_0_regs_25 <= lineBuffers_0_regs_24;
            lineBuffers_0_regs_24 <= lineBuffers_0_regs_23;
            lineBuffers_0_regs_23 <= lineBuffers_0_regs_22;
            lineBuffers_0_regs_22 <= lineBuffers_0_regs_21;
            lineBuffers_0_regs_21 <= lineBuffers_0_regs_20;
            lineBuffers_0_regs_20 <= lineBuffers_0_regs_19;
            lineBuffers_0_regs_19 <= lineBuffers_0_regs_18;
            lineBuffers_0_regs_18 <= lineBuffers_0_regs_17;
            lineBuffers_0_regs_17 <= lineBuffers_0_regs_16;
            lineBuffers_0_regs_16 <= lineBuffers_0_regs_15;
            lineBuffers_0_regs_15 <= lineBuffers_0_regs_14;
            lineBuffers_0_regs_14 <= lineBuffers_0_regs_13;
            lineBuffers_0_regs_13 <= lineBuffers_0_regs_12;
            lineBuffers_0_regs_12 <= lineBuffers_0_regs_11;
            lineBuffers_0_regs_11 <= lineBuffers_0_regs_10;
            lineBuffers_0_regs_10 <= lineBuffers_0_regs_9;
            lineBuffers_0_regs_9 <= lineBuffers_0_regs_8;
            lineBuffers_0_regs_8 <= lineBuffers_0_regs_7;
            lineBuffers_0_regs_7 <= lineBuffers_0_regs_6;
            lineBuffers_0_regs_6 <= lineBuffers_0_regs_5;
            lineBuffers_0_regs_5 <= lineBuffers_0_regs_4;
            lineBuffers_0_regs_4 <= lineBuffers_0_regs_3;
            lineBuffers_0_regs_3 <= lineBuffers_0_regs_2;
            lineBuffers_0_regs_2 <= lineBuffers_0_regs_1;
            lineBuffers_0_regs_1 <= lineBuffers_0_regs_0;
            lineBuffers_0_regs_0 <= io_a_stream_payload_0;
            if(channelCount_willOverflowIfInc) begin
              shiftReg_0 <= shiftReg_1;
              shiftReg_1 <= shiftReg_2;
              shiftReg_2 <= shiftReg_3;
              shiftReg_3 <= shiftReg_4;
              shiftReg_4 <= fsm_currentPixels_0_0;
              shiftReg_5 <= shiftReg_6;
              shiftReg_6 <= shiftReg_7;
              shiftReg_7 <= shiftReg_8;
              shiftReg_8 <= shiftReg_9;
              shiftReg_9 <= fsm_currentPixels_1_0;
              shiftReg_10 <= shiftReg_11;
              shiftReg_11 <= shiftReg_12;
              shiftReg_12 <= shiftReg_13;
              shiftReg_13 <= shiftReg_14;
              shiftReg_14 <= fsm_currentPixels_2_0;
              shiftReg_15 <= shiftReg_16;
              shiftReg_16 <= shiftReg_17;
              shiftReg_17 <= shiftReg_18;
              shiftReg_18 <= shiftReg_19;
              shiftReg_19 <= fsm_currentPixels_3_0;
              shiftReg_20 <= shiftReg_21;
              shiftReg_21 <= shiftReg_22;
              shiftReg_22 <= shiftReg_23;
              shiftReg_23 <= shiftReg_24;
              shiftReg_24 <= fsm_currentPixels_4_0;
            end
          end
        end
        fsm_1_stateOutput : begin
        end
        fsm_1_stateWaitA : begin
          if(io_a_stream_valid) begin
            if(_zz_1) begin
              tempVecs_4_0 <= io_a_stream_payload_0;
            end
            if(_zz_2) begin
              tempVecs_3_0 <= lineBuffers_0_regs_27;
            end
            if(_zz_3) begin
              tempVecs_2_0 <= lineBuffers_1_regs_27;
            end
            if(_zz_4) begin
              tempVecs_1_0 <= lineBuffers_2_regs_27;
            end
            if(_zz_5) begin
              tempVecs_0_0 <= lineBuffers_3_regs_27;
            end
            lineBuffers_3_regs_27 <= lineBuffers_3_regs_26;
            lineBuffers_3_regs_26 <= lineBuffers_3_regs_25;
            lineBuffers_3_regs_25 <= lineBuffers_3_regs_24;
            lineBuffers_3_regs_24 <= lineBuffers_3_regs_23;
            lineBuffers_3_regs_23 <= lineBuffers_3_regs_22;
            lineBuffers_3_regs_22 <= lineBuffers_3_regs_21;
            lineBuffers_3_regs_21 <= lineBuffers_3_regs_20;
            lineBuffers_3_regs_20 <= lineBuffers_3_regs_19;
            lineBuffers_3_regs_19 <= lineBuffers_3_regs_18;
            lineBuffers_3_regs_18 <= lineBuffers_3_regs_17;
            lineBuffers_3_regs_17 <= lineBuffers_3_regs_16;
            lineBuffers_3_regs_16 <= lineBuffers_3_regs_15;
            lineBuffers_3_regs_15 <= lineBuffers_3_regs_14;
            lineBuffers_3_regs_14 <= lineBuffers_3_regs_13;
            lineBuffers_3_regs_13 <= lineBuffers_3_regs_12;
            lineBuffers_3_regs_12 <= lineBuffers_3_regs_11;
            lineBuffers_3_regs_11 <= lineBuffers_3_regs_10;
            lineBuffers_3_regs_10 <= lineBuffers_3_regs_9;
            lineBuffers_3_regs_9 <= lineBuffers_3_regs_8;
            lineBuffers_3_regs_8 <= lineBuffers_3_regs_7;
            lineBuffers_3_regs_7 <= lineBuffers_3_regs_6;
            lineBuffers_3_regs_6 <= lineBuffers_3_regs_5;
            lineBuffers_3_regs_5 <= lineBuffers_3_regs_4;
            lineBuffers_3_regs_4 <= lineBuffers_3_regs_3;
            lineBuffers_3_regs_3 <= lineBuffers_3_regs_2;
            lineBuffers_3_regs_2 <= lineBuffers_3_regs_1;
            lineBuffers_3_regs_1 <= lineBuffers_3_regs_0;
            lineBuffers_3_regs_0 <= lineBuffers_2_regs_27;
            lineBuffers_2_regs_27 <= lineBuffers_2_regs_26;
            lineBuffers_2_regs_26 <= lineBuffers_2_regs_25;
            lineBuffers_2_regs_25 <= lineBuffers_2_regs_24;
            lineBuffers_2_regs_24 <= lineBuffers_2_regs_23;
            lineBuffers_2_regs_23 <= lineBuffers_2_regs_22;
            lineBuffers_2_regs_22 <= lineBuffers_2_regs_21;
            lineBuffers_2_regs_21 <= lineBuffers_2_regs_20;
            lineBuffers_2_regs_20 <= lineBuffers_2_regs_19;
            lineBuffers_2_regs_19 <= lineBuffers_2_regs_18;
            lineBuffers_2_regs_18 <= lineBuffers_2_regs_17;
            lineBuffers_2_regs_17 <= lineBuffers_2_regs_16;
            lineBuffers_2_regs_16 <= lineBuffers_2_regs_15;
            lineBuffers_2_regs_15 <= lineBuffers_2_regs_14;
            lineBuffers_2_regs_14 <= lineBuffers_2_regs_13;
            lineBuffers_2_regs_13 <= lineBuffers_2_regs_12;
            lineBuffers_2_regs_12 <= lineBuffers_2_regs_11;
            lineBuffers_2_regs_11 <= lineBuffers_2_regs_10;
            lineBuffers_2_regs_10 <= lineBuffers_2_regs_9;
            lineBuffers_2_regs_9 <= lineBuffers_2_regs_8;
            lineBuffers_2_regs_8 <= lineBuffers_2_regs_7;
            lineBuffers_2_regs_7 <= lineBuffers_2_regs_6;
            lineBuffers_2_regs_6 <= lineBuffers_2_regs_5;
            lineBuffers_2_regs_5 <= lineBuffers_2_regs_4;
            lineBuffers_2_regs_4 <= lineBuffers_2_regs_3;
            lineBuffers_2_regs_3 <= lineBuffers_2_regs_2;
            lineBuffers_2_regs_2 <= lineBuffers_2_regs_1;
            lineBuffers_2_regs_1 <= lineBuffers_2_regs_0;
            lineBuffers_2_regs_0 <= lineBuffers_1_regs_27;
            lineBuffers_1_regs_27 <= lineBuffers_1_regs_26;
            lineBuffers_1_regs_26 <= lineBuffers_1_regs_25;
            lineBuffers_1_regs_25 <= lineBuffers_1_regs_24;
            lineBuffers_1_regs_24 <= lineBuffers_1_regs_23;
            lineBuffers_1_regs_23 <= lineBuffers_1_regs_22;
            lineBuffers_1_regs_22 <= lineBuffers_1_regs_21;
            lineBuffers_1_regs_21 <= lineBuffers_1_regs_20;
            lineBuffers_1_regs_20 <= lineBuffers_1_regs_19;
            lineBuffers_1_regs_19 <= lineBuffers_1_regs_18;
            lineBuffers_1_regs_18 <= lineBuffers_1_regs_17;
            lineBuffers_1_regs_17 <= lineBuffers_1_regs_16;
            lineBuffers_1_regs_16 <= lineBuffers_1_regs_15;
            lineBuffers_1_regs_15 <= lineBuffers_1_regs_14;
            lineBuffers_1_regs_14 <= lineBuffers_1_regs_13;
            lineBuffers_1_regs_13 <= lineBuffers_1_regs_12;
            lineBuffers_1_regs_12 <= lineBuffers_1_regs_11;
            lineBuffers_1_regs_11 <= lineBuffers_1_regs_10;
            lineBuffers_1_regs_10 <= lineBuffers_1_regs_9;
            lineBuffers_1_regs_9 <= lineBuffers_1_regs_8;
            lineBuffers_1_regs_8 <= lineBuffers_1_regs_7;
            lineBuffers_1_regs_7 <= lineBuffers_1_regs_6;
            lineBuffers_1_regs_6 <= lineBuffers_1_regs_5;
            lineBuffers_1_regs_5 <= lineBuffers_1_regs_4;
            lineBuffers_1_regs_4 <= lineBuffers_1_regs_3;
            lineBuffers_1_regs_3 <= lineBuffers_1_regs_2;
            lineBuffers_1_regs_2 <= lineBuffers_1_regs_1;
            lineBuffers_1_regs_1 <= lineBuffers_1_regs_0;
            lineBuffers_1_regs_0 <= lineBuffers_0_regs_27;
            lineBuffers_0_regs_27 <= lineBuffers_0_regs_26;
            lineBuffers_0_regs_26 <= lineBuffers_0_regs_25;
            lineBuffers_0_regs_25 <= lineBuffers_0_regs_24;
            lineBuffers_0_regs_24 <= lineBuffers_0_regs_23;
            lineBuffers_0_regs_23 <= lineBuffers_0_regs_22;
            lineBuffers_0_regs_22 <= lineBuffers_0_regs_21;
            lineBuffers_0_regs_21 <= lineBuffers_0_regs_20;
            lineBuffers_0_regs_20 <= lineBuffers_0_regs_19;
            lineBuffers_0_regs_19 <= lineBuffers_0_regs_18;
            lineBuffers_0_regs_18 <= lineBuffers_0_regs_17;
            lineBuffers_0_regs_17 <= lineBuffers_0_regs_16;
            lineBuffers_0_regs_16 <= lineBuffers_0_regs_15;
            lineBuffers_0_regs_15 <= lineBuffers_0_regs_14;
            lineBuffers_0_regs_14 <= lineBuffers_0_regs_13;
            lineBuffers_0_regs_13 <= lineBuffers_0_regs_12;
            lineBuffers_0_regs_12 <= lineBuffers_0_regs_11;
            lineBuffers_0_regs_11 <= lineBuffers_0_regs_10;
            lineBuffers_0_regs_10 <= lineBuffers_0_regs_9;
            lineBuffers_0_regs_9 <= lineBuffers_0_regs_8;
            lineBuffers_0_regs_8 <= lineBuffers_0_regs_7;
            lineBuffers_0_regs_7 <= lineBuffers_0_regs_6;
            lineBuffers_0_regs_6 <= lineBuffers_0_regs_5;
            lineBuffers_0_regs_5 <= lineBuffers_0_regs_4;
            lineBuffers_0_regs_4 <= lineBuffers_0_regs_3;
            lineBuffers_0_regs_3 <= lineBuffers_0_regs_2;
            lineBuffers_0_regs_2 <= lineBuffers_0_regs_1;
            lineBuffers_0_regs_1 <= lineBuffers_0_regs_0;
            lineBuffers_0_regs_0 <= io_a_stream_payload_0;
            if(channelCount_willOverflowIfInc) begin
              shiftReg_0 <= shiftReg_1;
              shiftReg_1 <= shiftReg_2;
              shiftReg_2 <= shiftReg_3;
              shiftReg_3 <= shiftReg_4;
              shiftReg_4 <= fsm_currentPixels_0_0;
              shiftReg_5 <= shiftReg_6;
              shiftReg_6 <= shiftReg_7;
              shiftReg_7 <= shiftReg_8;
              shiftReg_8 <= shiftReg_9;
              shiftReg_9 <= fsm_currentPixels_1_0;
              shiftReg_10 <= shiftReg_11;
              shiftReg_11 <= shiftReg_12;
              shiftReg_12 <= shiftReg_13;
              shiftReg_13 <= shiftReg_14;
              shiftReg_14 <= fsm_currentPixels_2_0;
              shiftReg_15 <= shiftReg_16;
              shiftReg_16 <= shiftReg_17;
              shiftReg_17 <= shiftReg_18;
              shiftReg_18 <= shiftReg_19;
              shiftReg_19 <= fsm_currentPixels_3_0;
              shiftReg_20 <= shiftReg_21;
              shiftReg_21 <= shiftReg_22;
              shiftReg_22 <= shiftReg_23;
              shiftReg_23 <= shiftReg_24;
              shiftReg_24 <= fsm_currentPixels_4_0;
            end
          end
        end
        fsm_1_stateDone : begin
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module StreamFifo_2 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [15:0]   io_push_payload_0,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [15:0]   io_pop_payload_0,
  input  wire          io_flush,
  output wire [4:0]    io_occupancy,
  output wire [4:0]    io_availability,
  input  wire          clk,
  input  wire          reset
);

  reg        [15:0]   logic_ram_spinal_port1;
  wire       [15:0]   _zz_logic_ram_port;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [4:0]    logic_ptr_push;
  reg        [4:0]    logic_ptr_pop;
  wire       [4:0]    logic_ptr_occupancy;
  wire       [4:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1557;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [3:0]    logic_push_onRam_write_payload_address;
  wire       [15:0]   logic_push_onRam_write_payload_data_0;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [3:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitration_valid;
  wire                logic_pop_sync_readArbitration_ready;
  wire       [3:0]    logic_pop_sync_readArbitration_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [3:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l477;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [3:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [15:0]   logic_pop_sync_readPort_rsp_0;
  wire                logic_pop_addressGen_toFlowFire_valid;
  wire       [3:0]    logic_pop_addressGen_toFlowFire_payload;
  wire                logic_pop_sync_readArbitration_translated_valid;
  wire                logic_pop_sync_readArbitration_translated_ready;
  wire       [15:0]   logic_pop_sync_readArbitration_translated_payload_0;
  wire                logic_pop_sync_readArbitration_fire;
  reg        [4:0]    logic_pop_sync_popReg;
  reg [15:0] logic_ram [0:15];

  assign _zz_logic_ram_port = logic_push_onRam_write_payload_data_0;
  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= _zz_logic_ram_port;
    end
  end

  always @(posedge clk) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      logic_ram_spinal_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1557 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 5'h10) == 5'h0);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[3:0];
  assign logic_push_onRam_write_payload_data_0 = io_push_payload_0;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[3:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitration_ready;
    if(when_Stream_l477) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l477 = (! logic_pop_sync_readArbitration_valid);
  assign logic_pop_sync_readArbitration_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitration_payload = logic_pop_addressGen_rData;
  assign logic_pop_sync_readPort_rsp_0 = logic_ram_spinal_port1[15 : 0];
  assign logic_pop_addressGen_toFlowFire_valid = logic_pop_addressGen_fire;
  assign logic_pop_addressGen_toFlowFire_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_toFlowFire_valid;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_toFlowFire_payload;
  assign logic_pop_sync_readArbitration_translated_valid = logic_pop_sync_readArbitration_valid;
  assign logic_pop_sync_readArbitration_ready = logic_pop_sync_readArbitration_translated_ready;
  assign logic_pop_sync_readArbitration_translated_payload_0 = logic_pop_sync_readPort_rsp_0;
  assign io_pop_valid = logic_pop_sync_readArbitration_translated_valid;
  assign logic_pop_sync_readArbitration_translated_ready = io_pop_ready;
  assign io_pop_payload_0 = logic_pop_sync_readArbitration_translated_payload_0;
  assign logic_pop_sync_readArbitration_fire = (logic_pop_sync_readArbitration_valid && logic_pop_sync_readArbitration_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (5'h10 - logic_ptr_occupancy);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_ptr_push <= 5'h0;
      logic_ptr_pop <= 5'h0;
      logic_ptr_wentUp <= 1'b0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 5'h0;
    end else begin
      if(when_Stream_l1557) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 5'h01);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 5'h01);
      end
      if(io_flush) begin
        logic_ptr_push <= 5'h0;
        logic_ptr_pop <= 5'h0;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitration_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 5'h0;
      end
    end
  end

  always @(posedge clk) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

module RepackOp_3 (
  input  wire          io_a_stream_valid,
  output wire          io_a_stream_ready,
  input  wire [15:0]   io_a_stream_payload_0,
  input  wire [15:0]   io_a_stream_payload_1,
  input  wire [15:0]   io_a_stream_payload_2,
  input  wire [15:0]   io_a_stream_payload_3,
  output wire          io_c_stream_valid,
  input  wire          io_c_stream_ready,
  output wire [15:0]   io_c_stream_payload_0,
  input  wire          io_reArm,
  output wire          io_isEmpty,
  input  wire          clk,
  input  wire          reset
);

  wire       [15:0]   _zz_io_c_stream_payload_0_1;
  wire       [6:0]    _zz_io_c_stream_payload_0_2;
  reg        [63:0]   _zz_io_c_stream_payload_0;
  reg        [1:0]    _zz_io_a_stream_ready;
  reg                 _zz_io_a_stream_ready_1;
  wire                io_c_stream_fire;
  wire                io_a_stream_fire;
  wire                when_repack_l55;

  assign _zz_io_c_stream_payload_0_1 = _zz_io_c_stream_payload_0[_zz_io_c_stream_payload_0_2 +: 16];
  assign _zz_io_c_stream_payload_0_2 = (_zz_io_a_stream_ready * 5'h10);
  assign io_c_stream_fire = (io_c_stream_valid && io_c_stream_ready);
  assign io_a_stream_ready = ((! _zz_io_a_stream_ready_1) || (io_c_stream_fire && (_zz_io_a_stream_ready == 2'b11)));
  assign io_c_stream_valid = _zz_io_a_stream_ready_1;
  assign io_c_stream_payload_0 = _zz_io_c_stream_payload_0_1[15 : 0];
  assign io_a_stream_fire = (io_a_stream_valid && io_a_stream_ready);
  assign when_repack_l55 = (_zz_io_a_stream_ready == 2'b11);
  assign io_isEmpty = (! _zz_io_a_stream_ready_1);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_a_stream_ready <= 2'b00;
      _zz_io_a_stream_ready_1 <= 1'b0;
    end else begin
      if(io_a_stream_fire) begin
        _zz_io_a_stream_ready <= 2'b00;
        _zz_io_a_stream_ready_1 <= 1'b1;
      end else begin
        if(io_c_stream_fire) begin
          _zz_io_a_stream_ready <= (_zz_io_a_stream_ready + 2'b01);
          if(when_repack_l55) begin
            _zz_io_a_stream_ready_1 <= 1'b0;
          end
        end
      end
      if(io_reArm) begin
        _zz_io_a_stream_ready_1 <= 1'b0;
        _zz_io_a_stream_ready <= 2'b00;
      end
    end
  end

  always @(posedge clk) begin
    if(io_a_stream_fire) begin
      _zz_io_c_stream_payload_0 <= {io_a_stream_payload_3,{io_a_stream_payload_2,{io_a_stream_payload_1,io_a_stream_payload_0}}};
    end
  end


endmodule

module StreamFifo_1 (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [3:0]    io_push_payload_0,
  input  wire [3:0]    io_push_payload_1,
  input  wire [3:0]    io_push_payload_2,
  input  wire [3:0]    io_push_payload_3,
  input  wire [3:0]    io_push_payload_4,
  input  wire [3:0]    io_push_payload_5,
  input  wire [3:0]    io_push_payload_6,
  input  wire [3:0]    io_push_payload_7,
  input  wire [3:0]    io_push_payload_8,
  input  wire [3:0]    io_push_payload_9,
  input  wire [3:0]    io_push_payload_10,
  input  wire [3:0]    io_push_payload_11,
  input  wire [3:0]    io_push_payload_12,
  input  wire [3:0]    io_push_payload_13,
  input  wire [3:0]    io_push_payload_14,
  input  wire [3:0]    io_push_payload_15,
  input  wire [3:0]    io_push_payload_16,
  input  wire [3:0]    io_push_payload_17,
  input  wire [3:0]    io_push_payload_18,
  input  wire [3:0]    io_push_payload_19,
  input  wire [3:0]    io_push_payload_20,
  input  wire [3:0]    io_push_payload_21,
  input  wire [3:0]    io_push_payload_22,
  input  wire [3:0]    io_push_payload_23,
  input  wire [3:0]    io_push_payload_24,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [3:0]    io_pop_payload_0,
  output wire [3:0]    io_pop_payload_1,
  output wire [3:0]    io_pop_payload_2,
  output wire [3:0]    io_pop_payload_3,
  output wire [3:0]    io_pop_payload_4,
  output wire [3:0]    io_pop_payload_5,
  output wire [3:0]    io_pop_payload_6,
  output wire [3:0]    io_pop_payload_7,
  output wire [3:0]    io_pop_payload_8,
  output wire [3:0]    io_pop_payload_9,
  output wire [3:0]    io_pop_payload_10,
  output wire [3:0]    io_pop_payload_11,
  output wire [3:0]    io_pop_payload_12,
  output wire [3:0]    io_pop_payload_13,
  output wire [3:0]    io_pop_payload_14,
  output wire [3:0]    io_pop_payload_15,
  output wire [3:0]    io_pop_payload_16,
  output wire [3:0]    io_pop_payload_17,
  output wire [3:0]    io_pop_payload_18,
  output wire [3:0]    io_pop_payload_19,
  output wire [3:0]    io_pop_payload_20,
  output wire [3:0]    io_pop_payload_21,
  output wire [3:0]    io_pop_payload_22,
  output wire [3:0]    io_pop_payload_23,
  output wire [3:0]    io_pop_payload_24,
  input  wire          io_flush,
  output wire [4:0]    io_occupancy,
  output wire [4:0]    io_availability,
  input  wire          clk,
  input  wire          reset
);

  reg        [99:0]   logic_ram_spinal_port1;
  wire       [99:0]   _zz_logic_ram_port;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [4:0]    logic_ptr_push;
  reg        [4:0]    logic_ptr_pop;
  wire       [4:0]    logic_ptr_occupancy;
  wire       [4:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1557;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [3:0]    logic_push_onRam_write_payload_address;
  wire       [3:0]    logic_push_onRam_write_payload_data_0;
  wire       [3:0]    logic_push_onRam_write_payload_data_1;
  wire       [3:0]    logic_push_onRam_write_payload_data_2;
  wire       [3:0]    logic_push_onRam_write_payload_data_3;
  wire       [3:0]    logic_push_onRam_write_payload_data_4;
  wire       [3:0]    logic_push_onRam_write_payload_data_5;
  wire       [3:0]    logic_push_onRam_write_payload_data_6;
  wire       [3:0]    logic_push_onRam_write_payload_data_7;
  wire       [3:0]    logic_push_onRam_write_payload_data_8;
  wire       [3:0]    logic_push_onRam_write_payload_data_9;
  wire       [3:0]    logic_push_onRam_write_payload_data_10;
  wire       [3:0]    logic_push_onRam_write_payload_data_11;
  wire       [3:0]    logic_push_onRam_write_payload_data_12;
  wire       [3:0]    logic_push_onRam_write_payload_data_13;
  wire       [3:0]    logic_push_onRam_write_payload_data_14;
  wire       [3:0]    logic_push_onRam_write_payload_data_15;
  wire       [3:0]    logic_push_onRam_write_payload_data_16;
  wire       [3:0]    logic_push_onRam_write_payload_data_17;
  wire       [3:0]    logic_push_onRam_write_payload_data_18;
  wire       [3:0]    logic_push_onRam_write_payload_data_19;
  wire       [3:0]    logic_push_onRam_write_payload_data_20;
  wire       [3:0]    logic_push_onRam_write_payload_data_21;
  wire       [3:0]    logic_push_onRam_write_payload_data_22;
  wire       [3:0]    logic_push_onRam_write_payload_data_23;
  wire       [3:0]    logic_push_onRam_write_payload_data_24;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [3:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitration_valid;
  wire                logic_pop_sync_readArbitration_ready;
  wire       [3:0]    logic_pop_sync_readArbitration_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [3:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l477;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [3:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [3:0]    logic_pop_sync_readPort_rsp_0;
  wire       [3:0]    logic_pop_sync_readPort_rsp_1;
  wire       [3:0]    logic_pop_sync_readPort_rsp_2;
  wire       [3:0]    logic_pop_sync_readPort_rsp_3;
  wire       [3:0]    logic_pop_sync_readPort_rsp_4;
  wire       [3:0]    logic_pop_sync_readPort_rsp_5;
  wire       [3:0]    logic_pop_sync_readPort_rsp_6;
  wire       [3:0]    logic_pop_sync_readPort_rsp_7;
  wire       [3:0]    logic_pop_sync_readPort_rsp_8;
  wire       [3:0]    logic_pop_sync_readPort_rsp_9;
  wire       [3:0]    logic_pop_sync_readPort_rsp_10;
  wire       [3:0]    logic_pop_sync_readPort_rsp_11;
  wire       [3:0]    logic_pop_sync_readPort_rsp_12;
  wire       [3:0]    logic_pop_sync_readPort_rsp_13;
  wire       [3:0]    logic_pop_sync_readPort_rsp_14;
  wire       [3:0]    logic_pop_sync_readPort_rsp_15;
  wire       [3:0]    logic_pop_sync_readPort_rsp_16;
  wire       [3:0]    logic_pop_sync_readPort_rsp_17;
  wire       [3:0]    logic_pop_sync_readPort_rsp_18;
  wire       [3:0]    logic_pop_sync_readPort_rsp_19;
  wire       [3:0]    logic_pop_sync_readPort_rsp_20;
  wire       [3:0]    logic_pop_sync_readPort_rsp_21;
  wire       [3:0]    logic_pop_sync_readPort_rsp_22;
  wire       [3:0]    logic_pop_sync_readPort_rsp_23;
  wire       [3:0]    logic_pop_sync_readPort_rsp_24;
  wire       [99:0]   _zz_logic_pop_sync_readPort_rsp_0;
  wire                logic_pop_addressGen_toFlowFire_valid;
  wire       [3:0]    logic_pop_addressGen_toFlowFire_payload;
  wire                logic_pop_sync_readArbitration_translated_valid;
  wire                logic_pop_sync_readArbitration_translated_ready;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_0;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_1;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_2;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_3;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_4;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_5;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_6;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_7;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_8;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_9;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_10;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_11;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_12;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_13;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_14;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_15;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_16;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_17;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_18;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_19;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_20;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_21;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_22;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_23;
  wire       [3:0]    logic_pop_sync_readArbitration_translated_payload_24;
  wire                logic_pop_sync_readArbitration_fire;
  reg        [4:0]    logic_pop_sync_popReg;
  reg [99:0] logic_ram [0:15];

  assign _zz_logic_ram_port = {logic_push_onRam_write_payload_data_24,{logic_push_onRam_write_payload_data_23,{logic_push_onRam_write_payload_data_22,{logic_push_onRam_write_payload_data_21,{logic_push_onRam_write_payload_data_20,{logic_push_onRam_write_payload_data_19,{logic_push_onRam_write_payload_data_18,{logic_push_onRam_write_payload_data_17,{logic_push_onRam_write_payload_data_16,{logic_push_onRam_write_payload_data_15,{logic_push_onRam_write_payload_data_14,{logic_push_onRam_write_payload_data_13,{logic_push_onRam_write_payload_data_12,{logic_push_onRam_write_payload_data_11,{logic_push_onRam_write_payload_data_10,{logic_push_onRam_write_payload_data_9,{logic_push_onRam_write_payload_data_8,{logic_push_onRam_write_payload_data_7,{logic_push_onRam_write_payload_data_6,{logic_push_onRam_write_payload_data_5,{logic_push_onRam_write_payload_data_4,{logic_push_onRam_write_payload_data_3,{logic_push_onRam_write_payload_data_2,{logic_push_onRam_write_payload_data_1,logic_push_onRam_write_payload_data_0}}}}}}}}}}}}}}}}}}}}}}}};
  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= _zz_logic_ram_port;
    end
  end

  always @(posedge clk) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      logic_ram_spinal_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1557 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 5'h10) == 5'h0);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[3:0];
  assign logic_push_onRam_write_payload_data_0 = io_push_payload_0;
  assign logic_push_onRam_write_payload_data_1 = io_push_payload_1;
  assign logic_push_onRam_write_payload_data_2 = io_push_payload_2;
  assign logic_push_onRam_write_payload_data_3 = io_push_payload_3;
  assign logic_push_onRam_write_payload_data_4 = io_push_payload_4;
  assign logic_push_onRam_write_payload_data_5 = io_push_payload_5;
  assign logic_push_onRam_write_payload_data_6 = io_push_payload_6;
  assign logic_push_onRam_write_payload_data_7 = io_push_payload_7;
  assign logic_push_onRam_write_payload_data_8 = io_push_payload_8;
  assign logic_push_onRam_write_payload_data_9 = io_push_payload_9;
  assign logic_push_onRam_write_payload_data_10 = io_push_payload_10;
  assign logic_push_onRam_write_payload_data_11 = io_push_payload_11;
  assign logic_push_onRam_write_payload_data_12 = io_push_payload_12;
  assign logic_push_onRam_write_payload_data_13 = io_push_payload_13;
  assign logic_push_onRam_write_payload_data_14 = io_push_payload_14;
  assign logic_push_onRam_write_payload_data_15 = io_push_payload_15;
  assign logic_push_onRam_write_payload_data_16 = io_push_payload_16;
  assign logic_push_onRam_write_payload_data_17 = io_push_payload_17;
  assign logic_push_onRam_write_payload_data_18 = io_push_payload_18;
  assign logic_push_onRam_write_payload_data_19 = io_push_payload_19;
  assign logic_push_onRam_write_payload_data_20 = io_push_payload_20;
  assign logic_push_onRam_write_payload_data_21 = io_push_payload_21;
  assign logic_push_onRam_write_payload_data_22 = io_push_payload_22;
  assign logic_push_onRam_write_payload_data_23 = io_push_payload_23;
  assign logic_push_onRam_write_payload_data_24 = io_push_payload_24;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[3:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitration_ready;
    if(when_Stream_l477) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l477 = (! logic_pop_sync_readArbitration_valid);
  assign logic_pop_sync_readArbitration_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitration_payload = logic_pop_addressGen_rData;
  assign _zz_logic_pop_sync_readPort_rsp_0 = logic_ram_spinal_port1;
  assign logic_pop_sync_readPort_rsp_0 = _zz_logic_pop_sync_readPort_rsp_0[3 : 0];
  assign logic_pop_sync_readPort_rsp_1 = _zz_logic_pop_sync_readPort_rsp_0[7 : 4];
  assign logic_pop_sync_readPort_rsp_2 = _zz_logic_pop_sync_readPort_rsp_0[11 : 8];
  assign logic_pop_sync_readPort_rsp_3 = _zz_logic_pop_sync_readPort_rsp_0[15 : 12];
  assign logic_pop_sync_readPort_rsp_4 = _zz_logic_pop_sync_readPort_rsp_0[19 : 16];
  assign logic_pop_sync_readPort_rsp_5 = _zz_logic_pop_sync_readPort_rsp_0[23 : 20];
  assign logic_pop_sync_readPort_rsp_6 = _zz_logic_pop_sync_readPort_rsp_0[27 : 24];
  assign logic_pop_sync_readPort_rsp_7 = _zz_logic_pop_sync_readPort_rsp_0[31 : 28];
  assign logic_pop_sync_readPort_rsp_8 = _zz_logic_pop_sync_readPort_rsp_0[35 : 32];
  assign logic_pop_sync_readPort_rsp_9 = _zz_logic_pop_sync_readPort_rsp_0[39 : 36];
  assign logic_pop_sync_readPort_rsp_10 = _zz_logic_pop_sync_readPort_rsp_0[43 : 40];
  assign logic_pop_sync_readPort_rsp_11 = _zz_logic_pop_sync_readPort_rsp_0[47 : 44];
  assign logic_pop_sync_readPort_rsp_12 = _zz_logic_pop_sync_readPort_rsp_0[51 : 48];
  assign logic_pop_sync_readPort_rsp_13 = _zz_logic_pop_sync_readPort_rsp_0[55 : 52];
  assign logic_pop_sync_readPort_rsp_14 = _zz_logic_pop_sync_readPort_rsp_0[59 : 56];
  assign logic_pop_sync_readPort_rsp_15 = _zz_logic_pop_sync_readPort_rsp_0[63 : 60];
  assign logic_pop_sync_readPort_rsp_16 = _zz_logic_pop_sync_readPort_rsp_0[67 : 64];
  assign logic_pop_sync_readPort_rsp_17 = _zz_logic_pop_sync_readPort_rsp_0[71 : 68];
  assign logic_pop_sync_readPort_rsp_18 = _zz_logic_pop_sync_readPort_rsp_0[75 : 72];
  assign logic_pop_sync_readPort_rsp_19 = _zz_logic_pop_sync_readPort_rsp_0[79 : 76];
  assign logic_pop_sync_readPort_rsp_20 = _zz_logic_pop_sync_readPort_rsp_0[83 : 80];
  assign logic_pop_sync_readPort_rsp_21 = _zz_logic_pop_sync_readPort_rsp_0[87 : 84];
  assign logic_pop_sync_readPort_rsp_22 = _zz_logic_pop_sync_readPort_rsp_0[91 : 88];
  assign logic_pop_sync_readPort_rsp_23 = _zz_logic_pop_sync_readPort_rsp_0[95 : 92];
  assign logic_pop_sync_readPort_rsp_24 = _zz_logic_pop_sync_readPort_rsp_0[99 : 96];
  assign logic_pop_addressGen_toFlowFire_valid = logic_pop_addressGen_fire;
  assign logic_pop_addressGen_toFlowFire_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_toFlowFire_valid;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_toFlowFire_payload;
  assign logic_pop_sync_readArbitration_translated_valid = logic_pop_sync_readArbitration_valid;
  assign logic_pop_sync_readArbitration_ready = logic_pop_sync_readArbitration_translated_ready;
  assign logic_pop_sync_readArbitration_translated_payload_0 = logic_pop_sync_readPort_rsp_0;
  assign logic_pop_sync_readArbitration_translated_payload_1 = logic_pop_sync_readPort_rsp_1;
  assign logic_pop_sync_readArbitration_translated_payload_2 = logic_pop_sync_readPort_rsp_2;
  assign logic_pop_sync_readArbitration_translated_payload_3 = logic_pop_sync_readPort_rsp_3;
  assign logic_pop_sync_readArbitration_translated_payload_4 = logic_pop_sync_readPort_rsp_4;
  assign logic_pop_sync_readArbitration_translated_payload_5 = logic_pop_sync_readPort_rsp_5;
  assign logic_pop_sync_readArbitration_translated_payload_6 = logic_pop_sync_readPort_rsp_6;
  assign logic_pop_sync_readArbitration_translated_payload_7 = logic_pop_sync_readPort_rsp_7;
  assign logic_pop_sync_readArbitration_translated_payload_8 = logic_pop_sync_readPort_rsp_8;
  assign logic_pop_sync_readArbitration_translated_payload_9 = logic_pop_sync_readPort_rsp_9;
  assign logic_pop_sync_readArbitration_translated_payload_10 = logic_pop_sync_readPort_rsp_10;
  assign logic_pop_sync_readArbitration_translated_payload_11 = logic_pop_sync_readPort_rsp_11;
  assign logic_pop_sync_readArbitration_translated_payload_12 = logic_pop_sync_readPort_rsp_12;
  assign logic_pop_sync_readArbitration_translated_payload_13 = logic_pop_sync_readPort_rsp_13;
  assign logic_pop_sync_readArbitration_translated_payload_14 = logic_pop_sync_readPort_rsp_14;
  assign logic_pop_sync_readArbitration_translated_payload_15 = logic_pop_sync_readPort_rsp_15;
  assign logic_pop_sync_readArbitration_translated_payload_16 = logic_pop_sync_readPort_rsp_16;
  assign logic_pop_sync_readArbitration_translated_payload_17 = logic_pop_sync_readPort_rsp_17;
  assign logic_pop_sync_readArbitration_translated_payload_18 = logic_pop_sync_readPort_rsp_18;
  assign logic_pop_sync_readArbitration_translated_payload_19 = logic_pop_sync_readPort_rsp_19;
  assign logic_pop_sync_readArbitration_translated_payload_20 = logic_pop_sync_readPort_rsp_20;
  assign logic_pop_sync_readArbitration_translated_payload_21 = logic_pop_sync_readPort_rsp_21;
  assign logic_pop_sync_readArbitration_translated_payload_22 = logic_pop_sync_readPort_rsp_22;
  assign logic_pop_sync_readArbitration_translated_payload_23 = logic_pop_sync_readPort_rsp_23;
  assign logic_pop_sync_readArbitration_translated_payload_24 = logic_pop_sync_readPort_rsp_24;
  assign io_pop_valid = logic_pop_sync_readArbitration_translated_valid;
  assign logic_pop_sync_readArbitration_translated_ready = io_pop_ready;
  assign io_pop_payload_0 = logic_pop_sync_readArbitration_translated_payload_0;
  assign io_pop_payload_1 = logic_pop_sync_readArbitration_translated_payload_1;
  assign io_pop_payload_2 = logic_pop_sync_readArbitration_translated_payload_2;
  assign io_pop_payload_3 = logic_pop_sync_readArbitration_translated_payload_3;
  assign io_pop_payload_4 = logic_pop_sync_readArbitration_translated_payload_4;
  assign io_pop_payload_5 = logic_pop_sync_readArbitration_translated_payload_5;
  assign io_pop_payload_6 = logic_pop_sync_readArbitration_translated_payload_6;
  assign io_pop_payload_7 = logic_pop_sync_readArbitration_translated_payload_7;
  assign io_pop_payload_8 = logic_pop_sync_readArbitration_translated_payload_8;
  assign io_pop_payload_9 = logic_pop_sync_readArbitration_translated_payload_9;
  assign io_pop_payload_10 = logic_pop_sync_readArbitration_translated_payload_10;
  assign io_pop_payload_11 = logic_pop_sync_readArbitration_translated_payload_11;
  assign io_pop_payload_12 = logic_pop_sync_readArbitration_translated_payload_12;
  assign io_pop_payload_13 = logic_pop_sync_readArbitration_translated_payload_13;
  assign io_pop_payload_14 = logic_pop_sync_readArbitration_translated_payload_14;
  assign io_pop_payload_15 = logic_pop_sync_readArbitration_translated_payload_15;
  assign io_pop_payload_16 = logic_pop_sync_readArbitration_translated_payload_16;
  assign io_pop_payload_17 = logic_pop_sync_readArbitration_translated_payload_17;
  assign io_pop_payload_18 = logic_pop_sync_readArbitration_translated_payload_18;
  assign io_pop_payload_19 = logic_pop_sync_readArbitration_translated_payload_19;
  assign io_pop_payload_20 = logic_pop_sync_readArbitration_translated_payload_20;
  assign io_pop_payload_21 = logic_pop_sync_readArbitration_translated_payload_21;
  assign io_pop_payload_22 = logic_pop_sync_readArbitration_translated_payload_22;
  assign io_pop_payload_23 = logic_pop_sync_readArbitration_translated_payload_23;
  assign io_pop_payload_24 = logic_pop_sync_readArbitration_translated_payload_24;
  assign logic_pop_sync_readArbitration_fire = (logic_pop_sync_readArbitration_valid && logic_pop_sync_readArbitration_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (5'h10 - logic_ptr_occupancy);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_ptr_push <= 5'h0;
      logic_ptr_pop <= 5'h0;
      logic_ptr_wentUp <= 1'b0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 5'h0;
    end else begin
      if(when_Stream_l1557) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 5'h01);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 5'h01);
      end
      if(io_flush) begin
        logic_ptr_push <= 5'h0;
        logic_ptr_pop <= 5'h0;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitration_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 5'h0;
      end
    end
  end

  always @(posedge clk) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

module RepackOp_2 (
  input  wire          io_a_stream_valid,
  output wire          io_a_stream_ready,
  input  wire [3:0]    io_a_stream_payload_0,
  output wire          io_c_stream_valid,
  input  wire          io_c_stream_ready,
  output wire [3:0]    io_c_stream_payload_0,
  output wire [3:0]    io_c_stream_payload_1,
  output wire [3:0]    io_c_stream_payload_2,
  output wire [3:0]    io_c_stream_payload_3,
  output wire [3:0]    io_c_stream_payload_4,
  output wire [3:0]    io_c_stream_payload_5,
  output wire [3:0]    io_c_stream_payload_6,
  output wire [3:0]    io_c_stream_payload_7,
  output wire [3:0]    io_c_stream_payload_8,
  output wire [3:0]    io_c_stream_payload_9,
  output wire [3:0]    io_c_stream_payload_10,
  output wire [3:0]    io_c_stream_payload_11,
  output wire [3:0]    io_c_stream_payload_12,
  output wire [3:0]    io_c_stream_payload_13,
  output wire [3:0]    io_c_stream_payload_14,
  output wire [3:0]    io_c_stream_payload_15,
  output wire [3:0]    io_c_stream_payload_16,
  output wire [3:0]    io_c_stream_payload_17,
  output wire [3:0]    io_c_stream_payload_18,
  output wire [3:0]    io_c_stream_payload_19,
  output wire [3:0]    io_c_stream_payload_20,
  output wire [3:0]    io_c_stream_payload_21,
  output wire [3:0]    io_c_stream_payload_22,
  output wire [3:0]    io_c_stream_payload_23,
  output wire [3:0]    io_c_stream_payload_24,
  input  wire          io_reArm,
  output wire          io_isEmpty,
  input  wire          clk,
  input  wire          reset
);

  wire       [7:0]    _zz__zz_io_c_stream_payload_0;
  reg        [99:0]   _zz_io_c_stream_payload_0;
  reg        [4:0]    _zz_when_repack_l74;
  reg                 _zz_io_a_stream_ready;
  wire                io_a_stream_fire;
  wire                when_repack_l74;
  wire                io_c_stream_fire;

  assign _zz__zz_io_c_stream_payload_0 = (_zz_when_repack_l74 * 3'b100);
  assign io_a_stream_ready = (! _zz_io_a_stream_ready);
  assign io_c_stream_valid = _zz_io_a_stream_ready;
  assign io_c_stream_payload_0 = _zz_io_c_stream_payload_0[3 : 0];
  assign io_c_stream_payload_1 = _zz_io_c_stream_payload_0[7 : 4];
  assign io_c_stream_payload_2 = _zz_io_c_stream_payload_0[11 : 8];
  assign io_c_stream_payload_3 = _zz_io_c_stream_payload_0[15 : 12];
  assign io_c_stream_payload_4 = _zz_io_c_stream_payload_0[19 : 16];
  assign io_c_stream_payload_5 = _zz_io_c_stream_payload_0[23 : 20];
  assign io_c_stream_payload_6 = _zz_io_c_stream_payload_0[27 : 24];
  assign io_c_stream_payload_7 = _zz_io_c_stream_payload_0[31 : 28];
  assign io_c_stream_payload_8 = _zz_io_c_stream_payload_0[35 : 32];
  assign io_c_stream_payload_9 = _zz_io_c_stream_payload_0[39 : 36];
  assign io_c_stream_payload_10 = _zz_io_c_stream_payload_0[43 : 40];
  assign io_c_stream_payload_11 = _zz_io_c_stream_payload_0[47 : 44];
  assign io_c_stream_payload_12 = _zz_io_c_stream_payload_0[51 : 48];
  assign io_c_stream_payload_13 = _zz_io_c_stream_payload_0[55 : 52];
  assign io_c_stream_payload_14 = _zz_io_c_stream_payload_0[59 : 56];
  assign io_c_stream_payload_15 = _zz_io_c_stream_payload_0[63 : 60];
  assign io_c_stream_payload_16 = _zz_io_c_stream_payload_0[67 : 64];
  assign io_c_stream_payload_17 = _zz_io_c_stream_payload_0[71 : 68];
  assign io_c_stream_payload_18 = _zz_io_c_stream_payload_0[75 : 72];
  assign io_c_stream_payload_19 = _zz_io_c_stream_payload_0[79 : 76];
  assign io_c_stream_payload_20 = _zz_io_c_stream_payload_0[83 : 80];
  assign io_c_stream_payload_21 = _zz_io_c_stream_payload_0[87 : 84];
  assign io_c_stream_payload_22 = _zz_io_c_stream_payload_0[91 : 88];
  assign io_c_stream_payload_23 = _zz_io_c_stream_payload_0[95 : 92];
  assign io_c_stream_payload_24 = _zz_io_c_stream_payload_0[99 : 96];
  assign io_a_stream_fire = (io_a_stream_valid && io_a_stream_ready);
  assign when_repack_l74 = (_zz_when_repack_l74 == 5'h18);
  assign io_c_stream_fire = (io_c_stream_valid && io_c_stream_ready);
  assign io_isEmpty = (! _zz_io_a_stream_ready);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_when_repack_l74 <= 5'h0;
      _zz_io_a_stream_ready <= 1'b0;
    end else begin
      if(io_a_stream_fire) begin
        if(when_repack_l74) begin
          _zz_io_a_stream_ready <= 1'b1;
        end
        _zz_when_repack_l74 <= (_zz_when_repack_l74 + 5'h01);
      end
      if(io_c_stream_fire) begin
        _zz_io_a_stream_ready <= 1'b0;
        _zz_when_repack_l74 <= 5'h0;
      end
      if(io_reArm) begin
        _zz_io_a_stream_ready <= 1'b0;
        _zz_when_repack_l74 <= 5'h0;
      end
    end
  end

  always @(posedge clk) begin
    if(io_a_stream_fire) begin
      _zz_io_c_stream_payload_0[_zz__zz_io_c_stream_payload_0 +: 4] <= io_a_stream_payload_0;
    end
  end


endmodule

module RepackOp_1 (
  input  wire          io_a_stream_valid,
  output wire          io_a_stream_ready,
  input  wire [3:0]    io_a_stream_payload_0,
  input  wire [3:0]    io_a_stream_payload_1,
  input  wire [3:0]    io_a_stream_payload_2,
  input  wire [3:0]    io_a_stream_payload_3,
  input  wire [3:0]    io_a_stream_payload_4,
  input  wire [3:0]    io_a_stream_payload_5,
  input  wire [3:0]    io_a_stream_payload_6,
  input  wire [3:0]    io_a_stream_payload_7,
  input  wire [3:0]    io_a_stream_payload_8,
  input  wire [3:0]    io_a_stream_payload_9,
  input  wire [3:0]    io_a_stream_payload_10,
  input  wire [3:0]    io_a_stream_payload_11,
  input  wire [3:0]    io_a_stream_payload_12,
  input  wire [3:0]    io_a_stream_payload_13,
  input  wire [3:0]    io_a_stream_payload_14,
  input  wire [3:0]    io_a_stream_payload_15,
  output wire          io_c_stream_valid,
  input  wire          io_c_stream_ready,
  output wire [3:0]    io_c_stream_payload_0,
  input  wire          io_reArm,
  output wire          io_isEmpty,
  input  wire          clk,
  input  wire          reset
);

  wire       [3:0]    _zz_io_c_stream_payload_0_1;
  wire       [6:0]    _zz_io_c_stream_payload_0_2;
  reg        [63:0]   _zz_io_c_stream_payload_0;
  reg        [3:0]    _zz_io_a_stream_ready;
  reg                 _zz_io_a_stream_ready_1;
  wire                io_c_stream_fire;
  wire                io_a_stream_fire;
  wire                when_repack_l55;

  assign _zz_io_c_stream_payload_0_1 = _zz_io_c_stream_payload_0[_zz_io_c_stream_payload_0_2 +: 4];
  assign _zz_io_c_stream_payload_0_2 = (_zz_io_a_stream_ready * 3'b100);
  assign io_c_stream_fire = (io_c_stream_valid && io_c_stream_ready);
  assign io_a_stream_ready = ((! _zz_io_a_stream_ready_1) || (io_c_stream_fire && (_zz_io_a_stream_ready == 4'b1111)));
  assign io_c_stream_valid = _zz_io_a_stream_ready_1;
  assign io_c_stream_payload_0 = _zz_io_c_stream_payload_0_1[3 : 0];
  assign io_a_stream_fire = (io_a_stream_valid && io_a_stream_ready);
  assign when_repack_l55 = (_zz_io_a_stream_ready == 4'b1111);
  assign io_isEmpty = (! _zz_io_a_stream_ready_1);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_a_stream_ready <= 4'b0000;
      _zz_io_a_stream_ready_1 <= 1'b0;
    end else begin
      if(io_a_stream_fire) begin
        _zz_io_a_stream_ready <= 4'b0000;
        _zz_io_a_stream_ready_1 <= 1'b1;
      end else begin
        if(io_c_stream_fire) begin
          _zz_io_a_stream_ready <= (_zz_io_a_stream_ready + 4'b0001);
          if(when_repack_l55) begin
            _zz_io_a_stream_ready_1 <= 1'b0;
          end
        end
      end
      if(io_reArm) begin
        _zz_io_a_stream_ready_1 <= 1'b0;
        _zz_io_a_stream_ready <= 4'b0000;
      end
    end
  end

  always @(posedge clk) begin
    if(io_a_stream_fire) begin
      _zz_io_c_stream_payload_0 <= {io_a_stream_payload_15,{io_a_stream_payload_14,{io_a_stream_payload_13,{io_a_stream_payload_12,{io_a_stream_payload_11,{io_a_stream_payload_10,{io_a_stream_payload_9,{io_a_stream_payload_8,{io_a_stream_payload_7,{io_a_stream_payload_6,{io_a_stream_payload_5,{io_a_stream_payload_4,{io_a_stream_payload_3,{io_a_stream_payload_2,{io_a_stream_payload_1,io_a_stream_payload_0}}}}}}}}}}}}}}};
    end
  end


endmodule

module StreamFifo (
  input  wire          io_push_valid,
  output wire          io_push_ready,
  input  wire [7:0]    io_push_payload_0,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [7:0]    io_pop_payload_0,
  input  wire          io_flush,
  output wire [4:0]    io_occupancy,
  output wire [4:0]    io_availability,
  input  wire          clk,
  input  wire          reset
);

  reg        [7:0]    logic_ram_spinal_port1;
  wire       [7:0]    _zz_logic_ram_port;
  reg                 _zz_1;
  wire                logic_ptr_doPush;
  wire                logic_ptr_doPop;
  wire                logic_ptr_full;
  wire                logic_ptr_empty;
  reg        [4:0]    logic_ptr_push;
  reg        [4:0]    logic_ptr_pop;
  wire       [4:0]    logic_ptr_occupancy;
  wire       [4:0]    logic_ptr_popOnIo;
  wire                when_Stream_l1557;
  reg                 logic_ptr_wentUp;
  wire                io_push_fire;
  wire                logic_push_onRam_write_valid;
  wire       [3:0]    logic_push_onRam_write_payload_address;
  wire       [7:0]    logic_push_onRam_write_payload_data_0;
  wire                logic_pop_addressGen_valid;
  reg                 logic_pop_addressGen_ready;
  wire       [3:0]    logic_pop_addressGen_payload;
  wire                logic_pop_addressGen_fire;
  wire                logic_pop_sync_readArbitration_valid;
  wire                logic_pop_sync_readArbitration_ready;
  wire       [3:0]    logic_pop_sync_readArbitration_payload;
  reg                 logic_pop_addressGen_rValid;
  reg        [3:0]    logic_pop_addressGen_rData;
  wire                when_Stream_l477;
  wire                logic_pop_sync_readPort_cmd_valid;
  wire       [3:0]    logic_pop_sync_readPort_cmd_payload;
  wire       [7:0]    logic_pop_sync_readPort_rsp_0;
  wire                logic_pop_addressGen_toFlowFire_valid;
  wire       [3:0]    logic_pop_addressGen_toFlowFire_payload;
  wire                logic_pop_sync_readArbitration_translated_valid;
  wire                logic_pop_sync_readArbitration_translated_ready;
  wire       [7:0]    logic_pop_sync_readArbitration_translated_payload_0;
  wire                logic_pop_sync_readArbitration_fire;
  reg        [4:0]    logic_pop_sync_popReg;
  reg [7:0] logic_ram [0:15];

  assign _zz_logic_ram_port = logic_push_onRam_write_payload_data_0;
  always @(posedge clk) begin
    if(_zz_1) begin
      logic_ram[logic_push_onRam_write_payload_address] <= _zz_logic_ram_port;
    end
  end

  always @(posedge clk) begin
    if(logic_pop_sync_readPort_cmd_valid) begin
      logic_ram_spinal_port1 <= logic_ram[logic_pop_sync_readPort_cmd_payload];
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_push_onRam_write_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l1557 = (logic_ptr_doPush != logic_ptr_doPop);
  assign logic_ptr_full = (((logic_ptr_push ^ logic_ptr_popOnIo) ^ 5'h10) == 5'h0);
  assign logic_ptr_empty = (logic_ptr_push == logic_ptr_pop);
  assign logic_ptr_occupancy = (logic_ptr_push - logic_ptr_popOnIo);
  assign io_push_ready = (! logic_ptr_full);
  assign io_push_fire = (io_push_valid && io_push_ready);
  assign logic_ptr_doPush = io_push_fire;
  assign logic_push_onRam_write_valid = io_push_fire;
  assign logic_push_onRam_write_payload_address = logic_ptr_push[3:0];
  assign logic_push_onRam_write_payload_data_0 = io_push_payload_0;
  assign logic_pop_addressGen_valid = (! logic_ptr_empty);
  assign logic_pop_addressGen_payload = logic_ptr_pop[3:0];
  assign logic_pop_addressGen_fire = (logic_pop_addressGen_valid && logic_pop_addressGen_ready);
  assign logic_ptr_doPop = logic_pop_addressGen_fire;
  always @(*) begin
    logic_pop_addressGen_ready = logic_pop_sync_readArbitration_ready;
    if(when_Stream_l477) begin
      logic_pop_addressGen_ready = 1'b1;
    end
  end

  assign when_Stream_l477 = (! logic_pop_sync_readArbitration_valid);
  assign logic_pop_sync_readArbitration_valid = logic_pop_addressGen_rValid;
  assign logic_pop_sync_readArbitration_payload = logic_pop_addressGen_rData;
  assign logic_pop_sync_readPort_rsp_0 = logic_ram_spinal_port1[7 : 0];
  assign logic_pop_addressGen_toFlowFire_valid = logic_pop_addressGen_fire;
  assign logic_pop_addressGen_toFlowFire_payload = logic_pop_addressGen_payload;
  assign logic_pop_sync_readPort_cmd_valid = logic_pop_addressGen_toFlowFire_valid;
  assign logic_pop_sync_readPort_cmd_payload = logic_pop_addressGen_toFlowFire_payload;
  assign logic_pop_sync_readArbitration_translated_valid = logic_pop_sync_readArbitration_valid;
  assign logic_pop_sync_readArbitration_ready = logic_pop_sync_readArbitration_translated_ready;
  assign logic_pop_sync_readArbitration_translated_payload_0 = logic_pop_sync_readPort_rsp_0;
  assign io_pop_valid = logic_pop_sync_readArbitration_translated_valid;
  assign logic_pop_sync_readArbitration_translated_ready = io_pop_ready;
  assign io_pop_payload_0 = logic_pop_sync_readArbitration_translated_payload_0;
  assign logic_pop_sync_readArbitration_fire = (logic_pop_sync_readArbitration_valid && logic_pop_sync_readArbitration_ready);
  assign logic_ptr_popOnIo = logic_pop_sync_popReg;
  assign io_occupancy = logic_ptr_occupancy;
  assign io_availability = (5'h10 - logic_ptr_occupancy);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_ptr_push <= 5'h0;
      logic_ptr_pop <= 5'h0;
      logic_ptr_wentUp <= 1'b0;
      logic_pop_addressGen_rValid <= 1'b0;
      logic_pop_sync_popReg <= 5'h0;
    end else begin
      if(when_Stream_l1557) begin
        logic_ptr_wentUp <= logic_ptr_doPush;
      end
      if(io_flush) begin
        logic_ptr_wentUp <= 1'b0;
      end
      if(logic_ptr_doPush) begin
        logic_ptr_push <= (logic_ptr_push + 5'h01);
      end
      if(logic_ptr_doPop) begin
        logic_ptr_pop <= (logic_ptr_pop + 5'h01);
      end
      if(io_flush) begin
        logic_ptr_push <= 5'h0;
        logic_ptr_pop <= 5'h0;
      end
      if(logic_pop_addressGen_ready) begin
        logic_pop_addressGen_rValid <= logic_pop_addressGen_valid;
      end
      if(io_flush) begin
        logic_pop_addressGen_rValid <= 1'b0;
      end
      if(logic_pop_sync_readArbitration_fire) begin
        logic_pop_sync_popReg <= logic_ptr_pop;
      end
      if(io_flush) begin
        logic_pop_sync_popReg <= 5'h0;
      end
    end
  end

  always @(posedge clk) begin
    if(logic_pop_addressGen_ready) begin
      logic_pop_addressGen_rData <= logic_pop_addressGen_payload;
    end
  end


endmodule

module DMAReader (
  input  wire          io_cmd_valid,
  output wire          io_cmd_ready,
  input  wire [31:0]   io_cmd_payload_address,
  input  wire [15:0]   io_cmd_payload_length,
  output wire          io_axiMaster_ar_valid,
  input  wire          io_axiMaster_ar_ready,
  output wire [31:0]   io_axiMaster_ar_payload_addr,
  output wire [0:0]    io_axiMaster_ar_payload_id,
  output wire [3:0]    io_axiMaster_ar_payload_region,
  output wire [7:0]    io_axiMaster_ar_payload_len,
  output wire [2:0]    io_axiMaster_ar_payload_size,
  output wire [1:0]    io_axiMaster_ar_payload_burst,
  output wire [0:0]    io_axiMaster_ar_payload_lock,
  output wire [3:0]    io_axiMaster_ar_payload_cache,
  output wire [3:0]    io_axiMaster_ar_payload_qos,
  output wire [2:0]    io_axiMaster_ar_payload_prot,
  input  wire          io_axiMaster_r_valid,
  output wire          io_axiMaster_r_ready,
  input  wire [63:0]   io_axiMaster_r_payload_data,
  input  wire [0:0]    io_axiMaster_r_payload_id,
  input  wire [1:0]    io_axiMaster_r_payload_resp,
  input  wire          io_axiMaster_r_payload_last,
  output wire          io_outStream_stream_valid,
  input  wire          io_outStream_stream_ready,
  output wire [7:0]    io_outStream_stream_payload_0,
  input  wire          clk,
  input  wire          reset
);

  wire                repackOp_8_io_a_stream_ready;
  wire                repackOp_8_io_c_stream_valid;
  wire       [7:0]    repackOp_8_io_c_stream_payload_0;
  wire                repackOp_8_io_isEmpty;
  wire       [16:0]   _zz_remaining;
  wire       [1:0]    _zz_remaining_1;
  wire       [12:0]   _zz_bytesToBoundary;
  wire       [9:0]    _zz_beatsToBoundary;
  wire       [15:0]   _zz__zz_burstLen_3;
  wire       [15:0]   _zz__zz_burstLen_3_1;
  wire       [15:0]   _zz__zz_burstLen_3_2;
  wire       [16:0]   _zz_io_axiMaster_ar_payload_len;
  wire       [31:0]   _zz_addrReg;
  wire       [19:0]   _zz_addrReg_1;
  reg        [16:0]   remaining;
  reg        [8:0]    burstRemain;
  reg        [31:0]   addrReg;
  wire                baseReady;
  wire                gearboxEmpty;
  wire                io_cmd_fire;
  wire       [11:0]   offsetInPage;
  wire       [12:0]   bytesToBoundary;
  wire       [15:0]   beatsToBoundary;
  wire       [16:0]   _zz_burstLen;
  wire       [16:0]   _zz_burstLen_1;
  wire       [0:0]    _zz_burstLen_2;
  wire       [16:0]   _zz_burstLen_3;
  wire       [16:0]   burstLen;
  wire                io_axiMaster_ar_fire;
  wire                axiRawTensor_stream_valid;
  wire                axiRawTensor_stream_ready;
  wire       [7:0]    axiRawTensor_stream_payload_0;
  wire       [7:0]    axiRawTensor_stream_payload_1;
  wire       [7:0]    axiRawTensor_stream_payload_2;
  wire       [7:0]    axiRawTensor_stream_payload_3;
  wire       [7:0]    axiRawTensor_stream_payload_4;
  wire       [7:0]    axiRawTensor_stream_payload_5;
  wire       [7:0]    axiRawTensor_stream_payload_6;
  wire       [7:0]    axiRawTensor_stream_payload_7;
  wire                when_DMAReader_l115;

  assign _zz_remaining_1 = {1'b0,1'b1};
  assign _zz_remaining = {15'd0, _zz_remaining_1};
  assign _zz_bytesToBoundary = {1'd0, offsetInPage};
  assign _zz_beatsToBoundary = (bytesToBoundary >>> 2'd3);
  assign _zz__zz_burstLen_3 = ((beatsToBoundary < _zz__zz_burstLen_3_1) ? _zz__zz_burstLen_3_2 : beatsToBoundary);
  assign _zz__zz_burstLen_3_1 = {15'd0, _zz_burstLen_2};
  assign _zz__zz_burstLen_3_2 = {15'd0, _zz_burstLen_2};
  assign _zz_io_axiMaster_ar_payload_len = (burstLen - 17'h00001);
  assign _zz_addrReg_1 = ({3'd0,burstLen} <<< 2'd3);
  assign _zz_addrReg = {12'd0, _zz_addrReg_1};
  RepackOp repackOp_8 (
    .io_a_stream_valid     (axiRawTensor_stream_valid            ), //i
    .io_a_stream_ready     (repackOp_8_io_a_stream_ready         ), //o
    .io_a_stream_payload_0 (axiRawTensor_stream_payload_0[7:0]   ), //i
    .io_a_stream_payload_1 (axiRawTensor_stream_payload_1[7:0]   ), //i
    .io_a_stream_payload_2 (axiRawTensor_stream_payload_2[7:0]   ), //i
    .io_a_stream_payload_3 (axiRawTensor_stream_payload_3[7:0]   ), //i
    .io_a_stream_payload_4 (axiRawTensor_stream_payload_4[7:0]   ), //i
    .io_a_stream_payload_5 (axiRawTensor_stream_payload_5[7:0]   ), //i
    .io_a_stream_payload_6 (axiRawTensor_stream_payload_6[7:0]   ), //i
    .io_a_stream_payload_7 (axiRawTensor_stream_payload_7[7:0]   ), //i
    .io_c_stream_valid     (repackOp_8_io_c_stream_valid         ), //o
    .io_c_stream_ready     (io_outStream_stream_ready            ), //i
    .io_c_stream_payload_0 (repackOp_8_io_c_stream_payload_0[7:0]), //o
    .io_reArm              (1'b0                                 ), //i
    .io_isEmpty            (repackOp_8_io_isEmpty                ), //o
    .clk                   (clk                                  ), //i
    .reset                 (reset                                )  //i
  );
  assign baseReady = ((remaining == 17'h0) && (burstRemain == 9'h0));
  assign io_cmd_ready = baseReady;
  assign io_cmd_fire = (io_cmd_valid && io_cmd_ready);
  assign offsetInPage = addrReg[11 : 0];
  assign bytesToBoundary = (13'h1000 - _zz_bytesToBoundary);
  assign beatsToBoundary = {6'd0, _zz_beatsToBoundary};
  assign _zz_burstLen = 17'h00100;
  assign _zz_burstLen_1 = ((remaining < _zz_burstLen) ? remaining : _zz_burstLen);
  assign _zz_burstLen_2 = 1'b1;
  assign _zz_burstLen_3 = {1'd0, _zz__zz_burstLen_3};
  assign burstLen = ((_zz_burstLen_1 < _zz_burstLen_3) ? _zz_burstLen_1 : _zz_burstLen_3);
  assign io_axiMaster_ar_valid = ((remaining != 17'h0) && (burstRemain == 9'h0));
  assign io_axiMaster_ar_payload_addr = addrReg;
  assign io_axiMaster_ar_payload_len = _zz_io_axiMaster_ar_payload_len[7:0];
  assign io_axiMaster_ar_payload_size = 3'b011;
  assign io_axiMaster_ar_payload_burst = 2'b01;
  assign io_axiMaster_ar_fire = (io_axiMaster_ar_valid && io_axiMaster_ar_ready);
  assign io_axiMaster_ar_payload_id = 1'b0;
  assign io_axiMaster_ar_payload_prot = 3'b000;
  assign io_axiMaster_ar_payload_cache = 4'b0000;
  assign io_axiMaster_ar_payload_lock = 1'b0;
  assign io_axiMaster_ar_payload_qos = 4'b0000;
  assign io_axiMaster_ar_payload_region = 4'b0000;
  assign axiRawTensor_stream_valid = (io_axiMaster_r_valid && (burstRemain != 9'h0));
  assign io_axiMaster_r_ready = axiRawTensor_stream_ready;
  assign when_DMAReader_l115 = (io_axiMaster_r_valid && io_axiMaster_r_ready);
  assign axiRawTensor_stream_payload_0 = io_axiMaster_r_payload_data[7 : 0];
  assign axiRawTensor_stream_payload_1 = io_axiMaster_r_payload_data[15 : 8];
  assign axiRawTensor_stream_payload_2 = io_axiMaster_r_payload_data[23 : 16];
  assign axiRawTensor_stream_payload_3 = io_axiMaster_r_payload_data[31 : 24];
  assign axiRawTensor_stream_payload_4 = io_axiMaster_r_payload_data[39 : 32];
  assign axiRawTensor_stream_payload_5 = io_axiMaster_r_payload_data[47 : 40];
  assign axiRawTensor_stream_payload_6 = io_axiMaster_r_payload_data[55 : 48];
  assign axiRawTensor_stream_payload_7 = io_axiMaster_r_payload_data[63 : 56];
  assign axiRawTensor_stream_ready = repackOp_8_io_a_stream_ready;
  assign gearboxEmpty = repackOp_8_io_isEmpty;
  assign io_outStream_stream_valid = repackOp_8_io_c_stream_valid;
  assign io_outStream_stream_payload_0 = repackOp_8_io_c_stream_payload_0;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      remaining <= 17'h0;
      burstRemain <= 9'h0;
      addrReg <= 32'h0;
    end else begin
      if(io_cmd_fire) begin
        addrReg <= io_cmd_payload_address;
        remaining <= ({1'b0,io_cmd_payload_length} + _zz_remaining);
      end
      if(io_axiMaster_ar_fire) begin
        addrReg <= (addrReg + _zz_addrReg);
        remaining <= (remaining - burstLen);
        burstRemain <= burstLen[8:0];
      end
      if(when_DMAReader_l115) begin
        burstRemain <= (burstRemain - 9'h001);
      end
    end
  end


endmodule

module StreamDoubleBuffer_1 (
  input  wire          io_streamIn_valid,
  output wire          io_streamIn_ready,
  input  wire [2:0]    io_streamIn_payload_0_mantissa,
  input  wire [3:0]    io_streamIn_payload_0_exponent,
  input  wire          io_streamIn_payload_0_sign,
  input  wire [2:0]    io_streamIn_payload_1_mantissa,
  input  wire [3:0]    io_streamIn_payload_1_exponent,
  input  wire          io_streamIn_payload_1_sign,
  input  wire [2:0]    io_streamIn_payload_2_mantissa,
  input  wire [3:0]    io_streamIn_payload_2_exponent,
  input  wire          io_streamIn_payload_2_sign,
  input  wire [2:0]    io_streamIn_payload_3_mantissa,
  input  wire [3:0]    io_streamIn_payload_3_exponent,
  input  wire          io_streamIn_payload_3_sign,
  input  wire [9:0]    io_readAddr,
  output wire [2:0]    io_readData_0_mantissa,
  output wire [3:0]    io_readData_0_exponent,
  output wire          io_readData_0_sign,
  output wire [2:0]    io_readData_1_mantissa,
  output wire [3:0]    io_readData_1_exponent,
  output wire          io_readData_1_sign,
  output wire [2:0]    io_readData_2_mantissa,
  output wire [3:0]    io_readData_2_exponent,
  output wire          io_readData_2_sign,
  output wire [2:0]    io_readData_3_mantissa,
  output wire [3:0]    io_readData_3_exponent,
  output wire          io_readData_3_sign,
  input  wire          io_nextTile,
  output wire          io_tileReady,
  input  wire          io_reArm,
  output wire          io_loadCanAccept,
  output wire          io_tileFilled,
  output wire          io_refreshSettled,
  input  wire          clk,
  input  wire          reset
);

  reg        [31:0]   memPing_spinal_port0;
  reg        [31:0]   memPong_spinal_port0;
  wire                _zz_memPing_port;
  wire                _zz__zz_readDataPing_0_mantissa;
  wire                _zz_memPong_port;
  wire                _zz__zz_readDataPong_0_mantissa;
  wire       [9:0]    _zz_loadCounter_valueNext;
  wire       [0:0]    _zz_loadCounter_valueNext_1;
  wire       [31:0]   _zz_memPing_port_1;
  wire       [31:0]   _zz_memPong_port_1;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 loadBank;
  reg                 computeBank;
  reg                 pingFull;
  reg                 pongFull;
  wire       [2:0]    readDataPing_0_mantissa;
  wire       [3:0]    readDataPing_0_exponent;
  wire                readDataPing_0_sign;
  wire       [2:0]    readDataPing_1_mantissa;
  wire       [3:0]    readDataPing_1_exponent;
  wire                readDataPing_1_sign;
  wire       [2:0]    readDataPing_2_mantissa;
  wire       [3:0]    readDataPing_2_exponent;
  wire                readDataPing_2_sign;
  wire       [2:0]    readDataPing_3_mantissa;
  wire       [3:0]    readDataPing_3_exponent;
  wire                readDataPing_3_sign;
  wire       [31:0]   _zz_readDataPing_0_mantissa;
  wire       [7:0]    _zz_readDataPing_0_mantissa_1;
  wire       [7:0]    _zz_readDataPing_1_mantissa;
  wire       [7:0]    _zz_readDataPing_2_mantissa;
  wire       [7:0]    _zz_readDataPing_3_mantissa;
  wire       [2:0]    readDataPong_0_mantissa;
  wire       [3:0]    readDataPong_0_exponent;
  wire                readDataPong_0_sign;
  wire       [2:0]    readDataPong_1_mantissa;
  wire       [3:0]    readDataPong_1_exponent;
  wire                readDataPong_1_sign;
  wire       [2:0]    readDataPong_2_mantissa;
  wire       [3:0]    readDataPong_2_exponent;
  wire                readDataPong_2_sign;
  wire       [2:0]    readDataPong_3_mantissa;
  wire       [3:0]    readDataPong_3_exponent;
  wire                readDataPong_3_sign;
  wire       [31:0]   _zz_readDataPong_0_mantissa;
  wire       [7:0]    _zz_readDataPong_0_mantissa_1;
  wire       [7:0]    _zz_readDataPong_1_mantissa;
  wire       [7:0]    _zz_readDataPong_2_mantissa;
  wire       [7:0]    _zz_readDataPong_3_mantissa;
  reg                 computeBankDelayed;
  wire                _zz_io_readData_0_mantissa;
  reg                 loadCounter_willIncrement;
  wire                loadCounter_willDecrement;
  reg                 loadCounter_willClear;
  wire                loadCounter_willLoad;
  reg        [9:0]    loadCounter_valueNext;
  reg        [9:0]    loadCounter_value;
  wire                loadCounter_willOverflowIfInc;
  wire                loadCounter_willUnderflowIfDec;
  wire                loadCounter_willOverflow;
  wire                loadCounter_willUnderflow;
  wire                currentLoadBankFull;
  wire                loadDone;
  reg                 tileFilled;
  reg                 switchArmed;
  wire                allowFlip;
  wire                when_StreamDoubleBuffer_l114;
  wire                when_StreamDoubleBuffer_l117;
  wire                when_StreamDoubleBuffer_l123;
  wire                when_StreamDoubleBuffer_l125;
  wire                when_StreamDoubleBuffer_l135;
  wire                when_StreamDoubleBuffer_l137;
  wire                when_StreamDoubleBuffer_l142;
  wire                when_StreamDoubleBuffer_l144;
  reg [31:0] memPing [0:719];
  reg [31:0] memPong [0:719];

  assign _zz_loadCounter_valueNext_1 = loadCounter_willIncrement;
  assign _zz_loadCounter_valueNext = {9'd0, _zz_loadCounter_valueNext_1};
  assign _zz__zz_readDataPing_0_mantissa = 1'b1;
  assign _zz_memPing_port_1 = {{io_streamIn_payload_3_sign,{io_streamIn_payload_3_exponent,io_streamIn_payload_3_mantissa}},{{io_streamIn_payload_2_sign,{io_streamIn_payload_2_exponent,io_streamIn_payload_2_mantissa}},{{io_streamIn_payload_1_sign,{io_streamIn_payload_1_exponent,io_streamIn_payload_1_mantissa}},{io_streamIn_payload_0_sign,{io_streamIn_payload_0_exponent,io_streamIn_payload_0_mantissa}}}}};
  assign _zz__zz_readDataPong_0_mantissa = 1'b1;
  assign _zz_memPong_port_1 = {{io_streamIn_payload_3_sign,{io_streamIn_payload_3_exponent,io_streamIn_payload_3_mantissa}},{{io_streamIn_payload_2_sign,{io_streamIn_payload_2_exponent,io_streamIn_payload_2_mantissa}},{{io_streamIn_payload_1_sign,{io_streamIn_payload_1_exponent,io_streamIn_payload_1_mantissa}},{io_streamIn_payload_0_sign,{io_streamIn_payload_0_exponent,io_streamIn_payload_0_mantissa}}}}};
  always @(posedge clk) begin
    if(_zz__zz_readDataPing_0_mantissa) begin
      memPing_spinal_port0 <= memPing[io_readAddr];
    end
  end

  always @(posedge clk) begin
    if(_zz_2) begin
      memPing[loadCounter_value] <= _zz_memPing_port_1;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_readDataPong_0_mantissa) begin
      memPong_spinal_port0 <= memPong[io_readAddr];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      memPong[loadCounter_value] <= _zz_memPong_port_1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      if(!when_StreamDoubleBuffer_l125) begin
        _zz_1 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      if(when_StreamDoubleBuffer_l125) begin
        _zz_2 = 1'b1;
      end
    end
  end

  assign io_tileReady = ((computeBank == 1'b0) ? pingFull : pongFull);
  assign _zz_readDataPing_0_mantissa = memPing_spinal_port0;
  assign _zz_readDataPing_0_mantissa_1 = _zz_readDataPing_0_mantissa[7 : 0];
  assign readDataPing_0_mantissa = _zz_readDataPing_0_mantissa_1[2 : 0];
  assign readDataPing_0_exponent = _zz_readDataPing_0_mantissa_1[6 : 3];
  assign readDataPing_0_sign = _zz_readDataPing_0_mantissa_1[7];
  assign _zz_readDataPing_1_mantissa = _zz_readDataPing_0_mantissa[15 : 8];
  assign readDataPing_1_mantissa = _zz_readDataPing_1_mantissa[2 : 0];
  assign readDataPing_1_exponent = _zz_readDataPing_1_mantissa[6 : 3];
  assign readDataPing_1_sign = _zz_readDataPing_1_mantissa[7];
  assign _zz_readDataPing_2_mantissa = _zz_readDataPing_0_mantissa[23 : 16];
  assign readDataPing_2_mantissa = _zz_readDataPing_2_mantissa[2 : 0];
  assign readDataPing_2_exponent = _zz_readDataPing_2_mantissa[6 : 3];
  assign readDataPing_2_sign = _zz_readDataPing_2_mantissa[7];
  assign _zz_readDataPing_3_mantissa = _zz_readDataPing_0_mantissa[31 : 24];
  assign readDataPing_3_mantissa = _zz_readDataPing_3_mantissa[2 : 0];
  assign readDataPing_3_exponent = _zz_readDataPing_3_mantissa[6 : 3];
  assign readDataPing_3_sign = _zz_readDataPing_3_mantissa[7];
  assign _zz_readDataPong_0_mantissa = memPong_spinal_port0;
  assign _zz_readDataPong_0_mantissa_1 = _zz_readDataPong_0_mantissa[7 : 0];
  assign readDataPong_0_mantissa = _zz_readDataPong_0_mantissa_1[2 : 0];
  assign readDataPong_0_exponent = _zz_readDataPong_0_mantissa_1[6 : 3];
  assign readDataPong_0_sign = _zz_readDataPong_0_mantissa_1[7];
  assign _zz_readDataPong_1_mantissa = _zz_readDataPong_0_mantissa[15 : 8];
  assign readDataPong_1_mantissa = _zz_readDataPong_1_mantissa[2 : 0];
  assign readDataPong_1_exponent = _zz_readDataPong_1_mantissa[6 : 3];
  assign readDataPong_1_sign = _zz_readDataPong_1_mantissa[7];
  assign _zz_readDataPong_2_mantissa = _zz_readDataPong_0_mantissa[23 : 16];
  assign readDataPong_2_mantissa = _zz_readDataPong_2_mantissa[2 : 0];
  assign readDataPong_2_exponent = _zz_readDataPong_2_mantissa[6 : 3];
  assign readDataPong_2_sign = _zz_readDataPong_2_mantissa[7];
  assign _zz_readDataPong_3_mantissa = _zz_readDataPong_0_mantissa[31 : 24];
  assign readDataPong_3_mantissa = _zz_readDataPong_3_mantissa[2 : 0];
  assign readDataPong_3_exponent = _zz_readDataPong_3_mantissa[6 : 3];
  assign readDataPong_3_sign = _zz_readDataPong_3_mantissa[7];
  assign _zz_io_readData_0_mantissa = (computeBankDelayed == 1'b0);
  assign io_readData_0_mantissa = (_zz_io_readData_0_mantissa ? readDataPing_0_mantissa : readDataPong_0_mantissa);
  assign io_readData_0_exponent = (_zz_io_readData_0_mantissa ? readDataPing_0_exponent : readDataPong_0_exponent);
  assign io_readData_0_sign = (_zz_io_readData_0_mantissa ? readDataPing_0_sign : readDataPong_0_sign);
  assign io_readData_1_mantissa = (_zz_io_readData_0_mantissa ? readDataPing_1_mantissa : readDataPong_1_mantissa);
  assign io_readData_1_exponent = (_zz_io_readData_0_mantissa ? readDataPing_1_exponent : readDataPong_1_exponent);
  assign io_readData_1_sign = (_zz_io_readData_0_mantissa ? readDataPing_1_sign : readDataPong_1_sign);
  assign io_readData_2_mantissa = (_zz_io_readData_0_mantissa ? readDataPing_2_mantissa : readDataPong_2_mantissa);
  assign io_readData_2_exponent = (_zz_io_readData_0_mantissa ? readDataPing_2_exponent : readDataPong_2_exponent);
  assign io_readData_2_sign = (_zz_io_readData_0_mantissa ? readDataPing_2_sign : readDataPong_2_sign);
  assign io_readData_3_mantissa = (_zz_io_readData_0_mantissa ? readDataPing_3_mantissa : readDataPong_3_mantissa);
  assign io_readData_3_exponent = (_zz_io_readData_0_mantissa ? readDataPing_3_exponent : readDataPong_3_exponent);
  assign io_readData_3_sign = (_zz_io_readData_0_mantissa ? readDataPing_3_sign : readDataPong_3_sign);
  always @(*) begin
    loadCounter_willIncrement = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      loadCounter_willIncrement = 1'b1;
    end
  end

  assign loadCounter_willDecrement = 1'b0;
  always @(*) begin
    loadCounter_willClear = 1'b0;
    if(io_reArm) begin
      loadCounter_willClear = 1'b1;
    end
  end

  assign loadCounter_willLoad = 1'b0;
  assign loadCounter_willOverflowIfInc = (loadCounter_value == 10'h2cf);
  assign loadCounter_willUnderflowIfDec = (loadCounter_value == 10'h0);
  assign loadCounter_willOverflow = (loadCounter_willOverflowIfInc && loadCounter_willIncrement);
  always @(*) begin
    loadCounter_valueNext = (loadCounter_value + _zz_loadCounter_valueNext);
    if(loadCounter_willOverflow) begin
      loadCounter_valueNext = 10'h0;
    end
    if(loadCounter_willClear) begin
      loadCounter_valueNext = 10'h0;
    end
  end

  assign loadCounter_willUnderflow = (loadCounter_willUnderflowIfDec && loadCounter_willDecrement);
  assign currentLoadBankFull = ((loadBank == 1'b0) ? pingFull : pongFull);
  assign io_streamIn_ready = (! currentLoadBankFull);
  assign io_loadCanAccept = (! currentLoadBankFull);
  assign loadDone = ((io_streamIn_valid && (! currentLoadBankFull)) && loadCounter_willOverflowIfInc);
  assign io_tileFilled = tileFilled;
  assign allowFlip = ((! 1'b0) || switchArmed);
  assign when_StreamDoubleBuffer_l114 = (1'b0 && tileFilled);
  assign when_StreamDoubleBuffer_l117 = (io_nextTile && allowFlip);
  assign io_refreshSettled = ((io_nextTile && allowFlip) && switchArmed);
  assign when_StreamDoubleBuffer_l123 = (io_streamIn_valid && (! currentLoadBankFull));
  assign when_StreamDoubleBuffer_l125 = (loadBank == 1'b0);
  assign when_StreamDoubleBuffer_l135 = ((io_nextTile && allowFlip) && (computeBank == 1'b0));
  assign when_StreamDoubleBuffer_l137 = (loadDone && (loadBank == 1'b0));
  assign when_StreamDoubleBuffer_l142 = ((io_nextTile && allowFlip) && (computeBank == 1'b1));
  assign when_StreamDoubleBuffer_l144 = (loadDone && (loadBank == 1'b1));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      loadBank <= 1'b0;
      computeBank <= 1'b0;
      pingFull <= 1'b0;
      pongFull <= 1'b0;
      loadCounter_value <= 10'h0;
      tileFilled <= 1'b0;
      switchArmed <= 1'b0;
    end else begin
      loadCounter_value <= loadCounter_valueNext;
      tileFilled <= loadDone;
      if(when_StreamDoubleBuffer_l114) begin
        switchArmed <= 1'b1;
      end
      if(when_StreamDoubleBuffer_l117) begin
        computeBank <= (! computeBank);
        switchArmed <= 1'b0;
      end
      if(when_StreamDoubleBuffer_l135) begin
        pingFull <= 1'b0;
      end else begin
        if(when_StreamDoubleBuffer_l137) begin
          pingFull <= 1'b1;
        end
      end
      if(when_StreamDoubleBuffer_l142) begin
        pongFull <= 1'b0;
      end else begin
        if(when_StreamDoubleBuffer_l144) begin
          pongFull <= 1'b1;
        end
      end
      if(loadDone) begin
        loadBank <= (! loadBank);
      end
      if(io_reArm) begin
        loadBank <= 1'b0;
        computeBank <= 1'b0;
        pingFull <= 1'b0;
        pongFull <= 1'b0;
        switchArmed <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    computeBankDelayed <= computeBank;
  end


endmodule

module StreamDoubleBuffer (
  input  wire          io_streamIn_valid,
  output wire          io_streamIn_ready,
  input  wire [7:0]    io_streamIn_payload_0,
  input  wire [7:0]    io_streamIn_payload_1,
  input  wire [7:0]    io_streamIn_payload_2,
  input  wire [7:0]    io_streamIn_payload_3,
  input  wire [7:0]    io_streamIn_payload_4,
  input  wire [7:0]    io_streamIn_payload_5,
  input  wire [7:0]    io_streamIn_payload_6,
  input  wire [7:0]    io_streamIn_payload_7,
  input  wire [7:0]    io_streamIn_payload_8,
  input  wire [7:0]    io_streamIn_payload_9,
  input  wire [7:0]    io_streamIn_payload_10,
  input  wire [7:0]    io_streamIn_payload_11,
  input  wire [7:0]    io_streamIn_payload_12,
  input  wire [7:0]    io_streamIn_payload_13,
  input  wire [7:0]    io_streamIn_payload_14,
  input  wire [7:0]    io_streamIn_payload_15,
  input  wire [7:0]    io_streamIn_payload_16,
  input  wire [7:0]    io_streamIn_payload_17,
  input  wire [7:0]    io_streamIn_payload_18,
  input  wire [7:0]    io_streamIn_payload_19,
  input  wire [7:0]    io_streamIn_payload_20,
  input  wire [7:0]    io_streamIn_payload_21,
  input  wire [7:0]    io_streamIn_payload_22,
  input  wire [7:0]    io_streamIn_payload_23,
  input  wire [7:0]    io_streamIn_payload_24,
  input  wire [0:0]    io_readAddr,
  output wire [7:0]    io_readData_0,
  output wire [7:0]    io_readData_1,
  output wire [7:0]    io_readData_2,
  output wire [7:0]    io_readData_3,
  output wire [7:0]    io_readData_4,
  output wire [7:0]    io_readData_5,
  output wire [7:0]    io_readData_6,
  output wire [7:0]    io_readData_7,
  output wire [7:0]    io_readData_8,
  output wire [7:0]    io_readData_9,
  output wire [7:0]    io_readData_10,
  output wire [7:0]    io_readData_11,
  output wire [7:0]    io_readData_12,
  output wire [7:0]    io_readData_13,
  output wire [7:0]    io_readData_14,
  output wire [7:0]    io_readData_15,
  output wire [7:0]    io_readData_16,
  output wire [7:0]    io_readData_17,
  output wire [7:0]    io_readData_18,
  output wire [7:0]    io_readData_19,
  output wire [7:0]    io_readData_20,
  output wire [7:0]    io_readData_21,
  output wire [7:0]    io_readData_22,
  output wire [7:0]    io_readData_23,
  output wire [7:0]    io_readData_24,
  input  wire          io_nextTile,
  output wire          io_tileReady,
  input  wire          io_reArm,
  output wire          io_loadCanAccept,
  output wire          io_tileFilled,
  output wire          io_refreshSettled,
  input  wire          clk,
  input  wire          reset
);

  reg        [199:0]  memPing_spinal_port0;
  reg        [199:0]  memPong_spinal_port0;
  wire                _zz_memPing_port;
  wire                _zz__zz_readDataPing_0;
  wire                _zz_memPong_port;
  wire                _zz__zz_readDataPong_0;
  wire       [199:0]  _zz_memPing_port_1;
  wire       [199:0]  _zz_memPong_port_1;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 loadBank;
  reg                 computeBank;
  reg                 pingFull;
  reg                 pongFull;
  wire       [7:0]    readDataPing_0;
  wire       [7:0]    readDataPing_1;
  wire       [7:0]    readDataPing_2;
  wire       [7:0]    readDataPing_3;
  wire       [7:0]    readDataPing_4;
  wire       [7:0]    readDataPing_5;
  wire       [7:0]    readDataPing_6;
  wire       [7:0]    readDataPing_7;
  wire       [7:0]    readDataPing_8;
  wire       [7:0]    readDataPing_9;
  wire       [7:0]    readDataPing_10;
  wire       [7:0]    readDataPing_11;
  wire       [7:0]    readDataPing_12;
  wire       [7:0]    readDataPing_13;
  wire       [7:0]    readDataPing_14;
  wire       [7:0]    readDataPing_15;
  wire       [7:0]    readDataPing_16;
  wire       [7:0]    readDataPing_17;
  wire       [7:0]    readDataPing_18;
  wire       [7:0]    readDataPing_19;
  wire       [7:0]    readDataPing_20;
  wire       [7:0]    readDataPing_21;
  wire       [7:0]    readDataPing_22;
  wire       [7:0]    readDataPing_23;
  wire       [7:0]    readDataPing_24;
  wire       [199:0]  _zz_readDataPing_0;
  wire       [7:0]    readDataPong_0;
  wire       [7:0]    readDataPong_1;
  wire       [7:0]    readDataPong_2;
  wire       [7:0]    readDataPong_3;
  wire       [7:0]    readDataPong_4;
  wire       [7:0]    readDataPong_5;
  wire       [7:0]    readDataPong_6;
  wire       [7:0]    readDataPong_7;
  wire       [7:0]    readDataPong_8;
  wire       [7:0]    readDataPong_9;
  wire       [7:0]    readDataPong_10;
  wire       [7:0]    readDataPong_11;
  wire       [7:0]    readDataPong_12;
  wire       [7:0]    readDataPong_13;
  wire       [7:0]    readDataPong_14;
  wire       [7:0]    readDataPong_15;
  wire       [7:0]    readDataPong_16;
  wire       [7:0]    readDataPong_17;
  wire       [7:0]    readDataPong_18;
  wire       [7:0]    readDataPong_19;
  wire       [7:0]    readDataPong_20;
  wire       [7:0]    readDataPong_21;
  wire       [7:0]    readDataPong_22;
  wire       [7:0]    readDataPong_23;
  wire       [7:0]    readDataPong_24;
  wire       [199:0]  _zz_readDataPong_0;
  reg                 computeBankDelayed;
  wire                _zz_io_readData_0;
  reg                 loadCounter_willIncrement;
  wire                loadCounter_willDecrement;
  reg                 loadCounter_willClear;
  wire                loadCounter_willLoad;
  reg        [0:0]    loadCounter_valueNext;
  reg        [0:0]    loadCounter_value;
  wire                loadCounter_willOverflowIfInc;
  wire                loadCounter_willUnderflowIfDec;
  wire                loadCounter_willOverflow;
  wire                loadCounter_willUnderflow;
  wire                currentLoadBankFull;
  wire                loadDone;
  reg                 tileFilled;
  reg                 switchArmed;
  wire                allowFlip;
  wire                when_StreamDoubleBuffer_l114;
  wire                when_StreamDoubleBuffer_l117;
  wire                when_StreamDoubleBuffer_l123;
  wire                when_StreamDoubleBuffer_l125;
  wire                when_StreamDoubleBuffer_l135;
  wire                when_StreamDoubleBuffer_l137;
  wire                when_StreamDoubleBuffer_l142;
  wire                when_StreamDoubleBuffer_l144;
  reg [199:0] memPing [0:1];
  reg [199:0] memPong [0:1];

  assign _zz__zz_readDataPing_0 = 1'b1;
  assign _zz_memPing_port_1 = {io_streamIn_payload_24,{io_streamIn_payload_23,{io_streamIn_payload_22,{io_streamIn_payload_21,{io_streamIn_payload_20,{io_streamIn_payload_19,{io_streamIn_payload_18,{io_streamIn_payload_17,{io_streamIn_payload_16,{io_streamIn_payload_15,{io_streamIn_payload_14,{io_streamIn_payload_13,{io_streamIn_payload_12,{io_streamIn_payload_11,{io_streamIn_payload_10,{io_streamIn_payload_9,{io_streamIn_payload_8,{io_streamIn_payload_7,{io_streamIn_payload_6,{io_streamIn_payload_5,{io_streamIn_payload_4,{io_streamIn_payload_3,{io_streamIn_payload_2,{io_streamIn_payload_1,io_streamIn_payload_0}}}}}}}}}}}}}}}}}}}}}}}};
  assign _zz__zz_readDataPong_0 = 1'b1;
  assign _zz_memPong_port_1 = {io_streamIn_payload_24,{io_streamIn_payload_23,{io_streamIn_payload_22,{io_streamIn_payload_21,{io_streamIn_payload_20,{io_streamIn_payload_19,{io_streamIn_payload_18,{io_streamIn_payload_17,{io_streamIn_payload_16,{io_streamIn_payload_15,{io_streamIn_payload_14,{io_streamIn_payload_13,{io_streamIn_payload_12,{io_streamIn_payload_11,{io_streamIn_payload_10,{io_streamIn_payload_9,{io_streamIn_payload_8,{io_streamIn_payload_7,{io_streamIn_payload_6,{io_streamIn_payload_5,{io_streamIn_payload_4,{io_streamIn_payload_3,{io_streamIn_payload_2,{io_streamIn_payload_1,io_streamIn_payload_0}}}}}}}}}}}}}}}}}}}}}}}};
  always @(posedge clk) begin
    if(_zz__zz_readDataPing_0) begin
      memPing_spinal_port0 <= memPing[io_readAddr];
    end
  end

  always @(posedge clk) begin
    if(_zz_2) begin
      memPing[loadCounter_value] <= _zz_memPing_port_1;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_readDataPong_0) begin
      memPong_spinal_port0 <= memPong[io_readAddr];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      memPong[loadCounter_value] <= _zz_memPong_port_1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      if(!when_StreamDoubleBuffer_l125) begin
        _zz_1 = 1'b1;
      end
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      if(when_StreamDoubleBuffer_l125) begin
        _zz_2 = 1'b1;
      end
    end
  end

  assign io_tileReady = ((computeBank == 1'b0) ? pingFull : pongFull);
  assign _zz_readDataPing_0 = memPing_spinal_port0;
  assign readDataPing_0 = _zz_readDataPing_0[7 : 0];
  assign readDataPing_1 = _zz_readDataPing_0[15 : 8];
  assign readDataPing_2 = _zz_readDataPing_0[23 : 16];
  assign readDataPing_3 = _zz_readDataPing_0[31 : 24];
  assign readDataPing_4 = _zz_readDataPing_0[39 : 32];
  assign readDataPing_5 = _zz_readDataPing_0[47 : 40];
  assign readDataPing_6 = _zz_readDataPing_0[55 : 48];
  assign readDataPing_7 = _zz_readDataPing_0[63 : 56];
  assign readDataPing_8 = _zz_readDataPing_0[71 : 64];
  assign readDataPing_9 = _zz_readDataPing_0[79 : 72];
  assign readDataPing_10 = _zz_readDataPing_0[87 : 80];
  assign readDataPing_11 = _zz_readDataPing_0[95 : 88];
  assign readDataPing_12 = _zz_readDataPing_0[103 : 96];
  assign readDataPing_13 = _zz_readDataPing_0[111 : 104];
  assign readDataPing_14 = _zz_readDataPing_0[119 : 112];
  assign readDataPing_15 = _zz_readDataPing_0[127 : 120];
  assign readDataPing_16 = _zz_readDataPing_0[135 : 128];
  assign readDataPing_17 = _zz_readDataPing_0[143 : 136];
  assign readDataPing_18 = _zz_readDataPing_0[151 : 144];
  assign readDataPing_19 = _zz_readDataPing_0[159 : 152];
  assign readDataPing_20 = _zz_readDataPing_0[167 : 160];
  assign readDataPing_21 = _zz_readDataPing_0[175 : 168];
  assign readDataPing_22 = _zz_readDataPing_0[183 : 176];
  assign readDataPing_23 = _zz_readDataPing_0[191 : 184];
  assign readDataPing_24 = _zz_readDataPing_0[199 : 192];
  assign _zz_readDataPong_0 = memPong_spinal_port0;
  assign readDataPong_0 = _zz_readDataPong_0[7 : 0];
  assign readDataPong_1 = _zz_readDataPong_0[15 : 8];
  assign readDataPong_2 = _zz_readDataPong_0[23 : 16];
  assign readDataPong_3 = _zz_readDataPong_0[31 : 24];
  assign readDataPong_4 = _zz_readDataPong_0[39 : 32];
  assign readDataPong_5 = _zz_readDataPong_0[47 : 40];
  assign readDataPong_6 = _zz_readDataPong_0[55 : 48];
  assign readDataPong_7 = _zz_readDataPong_0[63 : 56];
  assign readDataPong_8 = _zz_readDataPong_0[71 : 64];
  assign readDataPong_9 = _zz_readDataPong_0[79 : 72];
  assign readDataPong_10 = _zz_readDataPong_0[87 : 80];
  assign readDataPong_11 = _zz_readDataPong_0[95 : 88];
  assign readDataPong_12 = _zz_readDataPong_0[103 : 96];
  assign readDataPong_13 = _zz_readDataPong_0[111 : 104];
  assign readDataPong_14 = _zz_readDataPong_0[119 : 112];
  assign readDataPong_15 = _zz_readDataPong_0[127 : 120];
  assign readDataPong_16 = _zz_readDataPong_0[135 : 128];
  assign readDataPong_17 = _zz_readDataPong_0[143 : 136];
  assign readDataPong_18 = _zz_readDataPong_0[151 : 144];
  assign readDataPong_19 = _zz_readDataPong_0[159 : 152];
  assign readDataPong_20 = _zz_readDataPong_0[167 : 160];
  assign readDataPong_21 = _zz_readDataPong_0[175 : 168];
  assign readDataPong_22 = _zz_readDataPong_0[183 : 176];
  assign readDataPong_23 = _zz_readDataPong_0[191 : 184];
  assign readDataPong_24 = _zz_readDataPong_0[199 : 192];
  assign _zz_io_readData_0 = (computeBankDelayed == 1'b0);
  assign io_readData_0 = (_zz_io_readData_0 ? readDataPing_0 : readDataPong_0);
  assign io_readData_1 = (_zz_io_readData_0 ? readDataPing_1 : readDataPong_1);
  assign io_readData_2 = (_zz_io_readData_0 ? readDataPing_2 : readDataPong_2);
  assign io_readData_3 = (_zz_io_readData_0 ? readDataPing_3 : readDataPong_3);
  assign io_readData_4 = (_zz_io_readData_0 ? readDataPing_4 : readDataPong_4);
  assign io_readData_5 = (_zz_io_readData_0 ? readDataPing_5 : readDataPong_5);
  assign io_readData_6 = (_zz_io_readData_0 ? readDataPing_6 : readDataPong_6);
  assign io_readData_7 = (_zz_io_readData_0 ? readDataPing_7 : readDataPong_7);
  assign io_readData_8 = (_zz_io_readData_0 ? readDataPing_8 : readDataPong_8);
  assign io_readData_9 = (_zz_io_readData_0 ? readDataPing_9 : readDataPong_9);
  assign io_readData_10 = (_zz_io_readData_0 ? readDataPing_10 : readDataPong_10);
  assign io_readData_11 = (_zz_io_readData_0 ? readDataPing_11 : readDataPong_11);
  assign io_readData_12 = (_zz_io_readData_0 ? readDataPing_12 : readDataPong_12);
  assign io_readData_13 = (_zz_io_readData_0 ? readDataPing_13 : readDataPong_13);
  assign io_readData_14 = (_zz_io_readData_0 ? readDataPing_14 : readDataPong_14);
  assign io_readData_15 = (_zz_io_readData_0 ? readDataPing_15 : readDataPong_15);
  assign io_readData_16 = (_zz_io_readData_0 ? readDataPing_16 : readDataPong_16);
  assign io_readData_17 = (_zz_io_readData_0 ? readDataPing_17 : readDataPong_17);
  assign io_readData_18 = (_zz_io_readData_0 ? readDataPing_18 : readDataPong_18);
  assign io_readData_19 = (_zz_io_readData_0 ? readDataPing_19 : readDataPong_19);
  assign io_readData_20 = (_zz_io_readData_0 ? readDataPing_20 : readDataPong_20);
  assign io_readData_21 = (_zz_io_readData_0 ? readDataPing_21 : readDataPong_21);
  assign io_readData_22 = (_zz_io_readData_0 ? readDataPing_22 : readDataPong_22);
  assign io_readData_23 = (_zz_io_readData_0 ? readDataPing_23 : readDataPong_23);
  assign io_readData_24 = (_zz_io_readData_0 ? readDataPing_24 : readDataPong_24);
  always @(*) begin
    loadCounter_willIncrement = 1'b0;
    if(when_StreamDoubleBuffer_l123) begin
      loadCounter_willIncrement = 1'b1;
    end
  end

  assign loadCounter_willDecrement = 1'b0;
  always @(*) begin
    loadCounter_willClear = 1'b0;
    if(io_reArm) begin
      loadCounter_willClear = 1'b1;
    end
  end

  assign loadCounter_willLoad = 1'b0;
  assign loadCounter_willOverflowIfInc = (loadCounter_value == 1'b1);
  assign loadCounter_willUnderflowIfDec = (loadCounter_value == 1'b0);
  assign loadCounter_willOverflow = (loadCounter_willOverflowIfInc && loadCounter_willIncrement);
  always @(*) begin
    loadCounter_valueNext = (loadCounter_value + loadCounter_willIncrement);
    if(loadCounter_willClear) begin
      loadCounter_valueNext = 1'b0;
    end
  end

  assign loadCounter_willUnderflow = (loadCounter_willUnderflowIfDec && loadCounter_willDecrement);
  assign currentLoadBankFull = ((loadBank == 1'b0) ? pingFull : pongFull);
  assign io_streamIn_ready = (! currentLoadBankFull);
  assign io_loadCanAccept = (! currentLoadBankFull);
  assign loadDone = ((io_streamIn_valid && (! currentLoadBankFull)) && loadCounter_willOverflowIfInc);
  assign io_tileFilled = tileFilled;
  assign allowFlip = ((! 1'b0) || switchArmed);
  assign when_StreamDoubleBuffer_l114 = (1'b0 && tileFilled);
  assign when_StreamDoubleBuffer_l117 = (io_nextTile && allowFlip);
  assign io_refreshSettled = ((io_nextTile && allowFlip) && switchArmed);
  assign when_StreamDoubleBuffer_l123 = (io_streamIn_valid && (! currentLoadBankFull));
  assign when_StreamDoubleBuffer_l125 = (loadBank == 1'b0);
  assign when_StreamDoubleBuffer_l135 = ((io_nextTile && allowFlip) && (computeBank == 1'b0));
  assign when_StreamDoubleBuffer_l137 = (loadDone && (loadBank == 1'b0));
  assign when_StreamDoubleBuffer_l142 = ((io_nextTile && allowFlip) && (computeBank == 1'b1));
  assign when_StreamDoubleBuffer_l144 = (loadDone && (loadBank == 1'b1));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      loadBank <= 1'b0;
      computeBank <= 1'b0;
      pingFull <= 1'b0;
      pongFull <= 1'b0;
      loadCounter_value <= 1'b0;
      tileFilled <= 1'b0;
      switchArmed <= 1'b0;
    end else begin
      loadCounter_value <= loadCounter_valueNext;
      tileFilled <= loadDone;
      if(when_StreamDoubleBuffer_l114) begin
        switchArmed <= 1'b1;
      end
      if(when_StreamDoubleBuffer_l117) begin
        computeBank <= (! computeBank);
        switchArmed <= 1'b0;
      end
      if(when_StreamDoubleBuffer_l135) begin
        pingFull <= 1'b0;
      end else begin
        if(when_StreamDoubleBuffer_l137) begin
          pingFull <= 1'b1;
        end
      end
      if(when_StreamDoubleBuffer_l142) begin
        pongFull <= 1'b0;
      end else begin
        if(when_StreamDoubleBuffer_l144) begin
          pongFull <= 1'b1;
        end
      end
      if(loadDone) begin
        loadBank <= (! loadBank);
      end
      if(io_reArm) begin
        loadBank <= 1'b0;
        computeBank <= 1'b0;
        pingFull <= 1'b0;
        pongFull <= 1'b0;
        switchArmed <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    computeBankDelayed <= computeBank;
  end


endmodule

module RepackOp (
  input  wire          io_a_stream_valid,
  output wire          io_a_stream_ready,
  input  wire [7:0]    io_a_stream_payload_0,
  input  wire [7:0]    io_a_stream_payload_1,
  input  wire [7:0]    io_a_stream_payload_2,
  input  wire [7:0]    io_a_stream_payload_3,
  input  wire [7:0]    io_a_stream_payload_4,
  input  wire [7:0]    io_a_stream_payload_5,
  input  wire [7:0]    io_a_stream_payload_6,
  input  wire [7:0]    io_a_stream_payload_7,
  output wire          io_c_stream_valid,
  input  wire          io_c_stream_ready,
  output wire [7:0]    io_c_stream_payload_0,
  input  wire          io_reArm,
  output wire          io_isEmpty,
  input  wire          clk,
  input  wire          reset
);

  wire       [2:0]    _zz_io_a_stream_translated_widthAdapter_counter_valueNext;
  wire       [0:0]    _zz_io_a_stream_translated_widthAdapter_counter_valueNext_1;
  reg        [7:0]    _zz_io_c_stream_payload_0_1;
  wire                io_a_stream_translated_valid;
  wire                io_a_stream_translated_ready;
  wire       [63:0]   io_a_stream_translated_payload;
  wire                _zz_io_c_stream_valid;
  wire                _zz_io_a_stream_translated_ready;
  reg                 io_a_stream_translated_widthAdapter_counter_willIncrement;
  wire                io_a_stream_translated_widthAdapter_counter_willDecrement;
  wire                io_a_stream_translated_widthAdapter_counter_willClear;
  wire                io_a_stream_translated_widthAdapter_counter_willLoad;
  reg        [2:0]    io_a_stream_translated_widthAdapter_counter_valueNext;
  reg        [2:0]    io_a_stream_translated_widthAdapter_counter_value;
  wire                io_a_stream_translated_widthAdapter_counter_willOverflowIfInc;
  wire                io_a_stream_translated_widthAdapter_counter_willUnderflowIfDec;
  wire                io_a_stream_translated_widthAdapter_counter_willOverflow;
  wire                io_a_stream_translated_widthAdapter_counter_willUnderflow;
  wire       [63:0]   _zz_io_c_stream_payload_0;

  assign _zz_io_a_stream_translated_widthAdapter_counter_valueNext_1 = io_a_stream_translated_widthAdapter_counter_willIncrement;
  assign _zz_io_a_stream_translated_widthAdapter_counter_valueNext = {2'd0, _zz_io_a_stream_translated_widthAdapter_counter_valueNext_1};
  always @(*) begin
    case(io_a_stream_translated_widthAdapter_counter_value)
      3'b000 : _zz_io_c_stream_payload_0_1 = _zz_io_c_stream_payload_0[7 : 0];
      3'b001 : _zz_io_c_stream_payload_0_1 = _zz_io_c_stream_payload_0[15 : 8];
      3'b010 : _zz_io_c_stream_payload_0_1 = _zz_io_c_stream_payload_0[23 : 16];
      3'b011 : _zz_io_c_stream_payload_0_1 = _zz_io_c_stream_payload_0[31 : 24];
      3'b100 : _zz_io_c_stream_payload_0_1 = _zz_io_c_stream_payload_0[39 : 32];
      3'b101 : _zz_io_c_stream_payload_0_1 = _zz_io_c_stream_payload_0[47 : 40];
      3'b110 : _zz_io_c_stream_payload_0_1 = _zz_io_c_stream_payload_0[55 : 48];
      default : _zz_io_c_stream_payload_0_1 = _zz_io_c_stream_payload_0[63 : 56];
    endcase
  end

  assign io_a_stream_translated_valid = io_a_stream_valid;
  assign io_a_stream_ready = io_a_stream_translated_ready;
  assign io_a_stream_translated_payload = {io_a_stream_payload_7,{io_a_stream_payload_6,{io_a_stream_payload_5,{io_a_stream_payload_4,{io_a_stream_payload_3,{io_a_stream_payload_2,{io_a_stream_payload_1,io_a_stream_payload_0}}}}}}};
  always @(*) begin
    io_a_stream_translated_widthAdapter_counter_willIncrement = 1'b0;
    if((_zz_io_c_stream_valid && _zz_io_a_stream_translated_ready)) begin
      io_a_stream_translated_widthAdapter_counter_willIncrement = 1'b1;
    end
  end

  assign io_a_stream_translated_widthAdapter_counter_willDecrement = 1'b0;
  assign io_a_stream_translated_widthAdapter_counter_willClear = 1'b0;
  assign io_a_stream_translated_widthAdapter_counter_willLoad = 1'b0;
  assign io_a_stream_translated_widthAdapter_counter_willOverflowIfInc = (io_a_stream_translated_widthAdapter_counter_value == 3'b111);
  assign io_a_stream_translated_widthAdapter_counter_willUnderflowIfDec = (io_a_stream_translated_widthAdapter_counter_value == 3'b000);
  assign io_a_stream_translated_widthAdapter_counter_willOverflow = (io_a_stream_translated_widthAdapter_counter_willOverflowIfInc && io_a_stream_translated_widthAdapter_counter_willIncrement);
  always @(*) begin
    io_a_stream_translated_widthAdapter_counter_valueNext = (io_a_stream_translated_widthAdapter_counter_value + _zz_io_a_stream_translated_widthAdapter_counter_valueNext);
    if(io_a_stream_translated_widthAdapter_counter_willClear) begin
      io_a_stream_translated_widthAdapter_counter_valueNext = 3'b000;
    end
  end

  assign io_a_stream_translated_widthAdapter_counter_willUnderflow = (io_a_stream_translated_widthAdapter_counter_willUnderflowIfDec && io_a_stream_translated_widthAdapter_counter_willDecrement);
  assign _zz_io_c_stream_valid = io_a_stream_translated_valid;
  assign _zz_io_c_stream_payload_0 = io_a_stream_translated_payload;
  assign io_a_stream_translated_ready = (_zz_io_a_stream_translated_ready && io_a_stream_translated_widthAdapter_counter_willOverflowIfInc);
  assign io_c_stream_valid = _zz_io_c_stream_valid;
  assign _zz_io_a_stream_translated_ready = io_c_stream_ready;
  assign io_c_stream_payload_0 = _zz_io_c_stream_payload_0_1[7 : 0];
  assign io_isEmpty = 1'b1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      io_a_stream_translated_widthAdapter_counter_value <= 3'b000;
    end else begin
      io_a_stream_translated_widthAdapter_counter_value <= io_a_stream_translated_widthAdapter_counter_valueNext;
    end
  end


endmodule
