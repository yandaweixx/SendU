module RegisterFile(
  input        clock,
  input        reset,
  input        io_wen,
  input  [2:0] io_waddr,
  input  [7:0] io_wdata,
  input  [2:0] io_raddr,
  output [7:0] io_rdata
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] reg_0; // @[RegisterFile.scala 18:20]
  reg [7:0] reg_1; // @[RegisterFile.scala 18:20]
  reg [7:0] reg_2; // @[RegisterFile.scala 18:20]
  reg [7:0] reg_3; // @[RegisterFile.scala 18:20]
  reg [7:0] reg_4; // @[RegisterFile.scala 18:20]
  reg [7:0] reg_5; // @[RegisterFile.scala 18:20]
  reg [7:0] reg_6; // @[RegisterFile.scala 18:20]
  reg [7:0] reg_7; // @[RegisterFile.scala 18:20]
  wire  _T_1 = io_raddr == 3'h0; // @[RegisterFile.scala 23:19]
  wire [7:0] _GEN_17 = 3'h1 == io_raddr ? reg_1 : reg_0; // @[RegisterFile.scala 26:16]
  wire [7:0] _GEN_18 = 3'h2 == io_raddr ? reg_2 : _GEN_17; // @[RegisterFile.scala 26:16]
  wire [7:0] _GEN_19 = 3'h3 == io_raddr ? reg_3 : _GEN_18; // @[RegisterFile.scala 26:16]
  wire [7:0] _GEN_20 = 3'h4 == io_raddr ? reg_4 : _GEN_19; // @[RegisterFile.scala 26:16]
  wire [7:0] _GEN_21 = 3'h5 == io_raddr ? reg_5 : _GEN_20; // @[RegisterFile.scala 26:16]
  wire [7:0] _GEN_22 = 3'h6 == io_raddr ? reg_6 : _GEN_21; // @[RegisterFile.scala 26:16]
  wire [7:0] _GEN_23 = 3'h7 == io_raddr ? reg_7 : _GEN_22; // @[RegisterFile.scala 26:16]
  assign io_rdata = _T_1 ? 8'h0 : _GEN_23; // @[RegisterFile.scala 24:16 RegisterFile.scala 26:16]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  reg_1 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  reg_2 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  reg_3 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  reg_4 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  reg_5 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  reg_6 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  reg_7 = _RAND_7[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      reg_0 <= 8'h0;
    end else if (io_wen) begin
      if (3'h0 == io_waddr) begin
        reg_0 <= io_wdata;
      end
    end
    if (reset) begin
      reg_1 <= 8'h0;
    end else if (io_wen) begin
      if (3'h1 == io_waddr) begin
        reg_1 <= io_wdata;
      end
    end
    if (reset) begin
      reg_2 <= 8'h0;
    end else if (io_wen) begin
      if (3'h2 == io_waddr) begin
        reg_2 <= io_wdata;
      end
    end
    if (reset) begin
      reg_3 <= 8'h0;
    end else if (io_wen) begin
      if (3'h3 == io_waddr) begin
        reg_3 <= io_wdata;
      end
    end
    if (reset) begin
      reg_4 <= 8'h0;
    end else if (io_wen) begin
      if (3'h4 == io_waddr) begin
        reg_4 <= io_wdata;
      end
    end
    if (reset) begin
      reg_5 <= 8'h0;
    end else if (io_wen) begin
      if (3'h5 == io_waddr) begin
        reg_5 <= io_wdata;
      end
    end
    if (reset) begin
      reg_6 <= 8'h0;
    end else if (io_wen) begin
      if (3'h6 == io_waddr) begin
        reg_6 <= io_wdata;
      end
    end
    if (reset) begin
      reg_7 <= 8'h0;
    end else if (io_wen) begin
      if (3'h7 == io_waddr) begin
        reg_7 <= io_wdata;
      end
    end
  end
endmodule
