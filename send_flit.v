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
module send_flit(
  input        clock,
  input        reset,
  output       io_send_msg,
  output [7:0] io_send_pkg,
  output       io_send_tail,
  input        io_send_ack,
  input  [2:0] io_waddr,
  input  [7:0] io_wdata,
  input        io_wen,
  input  [1:0] io_din_dest_pe,
  input  [2:0] io_din_reg_start_addr,
  input  [2:0] io_din_data_length
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  Reg_files_clock; // @[send_flit.scala 27:26]
  wire  Reg_files_reset; // @[send_flit.scala 27:26]
  wire  Reg_files_io_wen; // @[send_flit.scala 27:26]
  wire [2:0] Reg_files_io_waddr; // @[send_flit.scala 27:26]
  wire [7:0] Reg_files_io_wdata; // @[send_flit.scala 27:26]
  wire [2:0] Reg_files_io_raddr; // @[send_flit.scala 27:26]
  wire [7:0] Reg_files_io_rdata; // @[send_flit.scala 27:26]
  reg [2:0] Pkg_Cnt_Reg; // @[send_flit.scala 23:28]
  reg [7:0] filt; // @[send_flit.scala 34:21]
  reg [7:0] tmp_rdata; // @[send_flit.scala 37:26]
  wire [2:0] _T_1 = io_din_data_length + 3'h1; // @[send_flit.scala 41:57]
  wire  _T_2 = Pkg_Cnt_Reg == _T_1; // @[send_flit.scala 41:33]
  wire  _T_3 = Pkg_Cnt_Reg == 3'h1; // @[send_flit.scala 41:104]
  wire [2:0] _T_6 = _T_3 ? io_din_reg_start_addr : 3'h1; // @[send_flit.scala 41:91]
  wire  _T_7 = Pkg_Cnt_Reg == 3'h0; // @[send_flit.scala 46:22]
  wire [7:0] _T_9 = {io_din_dest_pe,io_din_reg_start_addr,io_din_data_length}; // @[Cat.scala 29:58]
  wire [2:0] _T_11 = Pkg_Cnt_Reg + 3'h1; // @[send_flit.scala 49:34]
  wire  _GEN_7 = _T_7 ? 1'h0 : _T_2; // @[send_flit.scala 46:30]
  wire [7:0] _GEN_9 = Reg_files_io_rdata; // @[send_flit.scala 43:20]
  RegisterFile Reg_files ( // @[send_flit.scala 27:26]
    .clock(Reg_files_clock),
    .reset(Reg_files_reset),
    .io_wen(Reg_files_io_wen),
    .io_waddr(Reg_files_io_waddr),
    .io_wdata(Reg_files_io_wdata),
    .io_raddr(Reg_files_io_raddr),
    .io_rdata(Reg_files_io_rdata)
  );
  assign io_send_msg = io_send_ack; // @[send_flit.scala 48:19 send_flit.scala 53:19 send_flit.scala 58:19 send_flit.scala 65:17]
  assign io_send_pkg = filt; // @[send_flit.scala 38:15]
  assign io_send_tail = io_send_ack & _GEN_7; // @[send_flit.scala 50:20 send_flit.scala 54:20 send_flit.scala 60:20 send_flit.scala 66:18]
  assign Reg_files_clock = clock;
  assign Reg_files_reset = reset;
  assign Reg_files_io_wen = io_wen; // @[send_flit.scala 31:20]
  assign Reg_files_io_waddr = io_waddr; // @[send_flit.scala 29:22]
  assign Reg_files_io_wdata = io_wdata; // @[send_flit.scala 30:22]
  assign Reg_files_io_raddr = _T_2 ? io_din_reg_start_addr : _T_6; // @[send_flit.scala 44:24 send_flit.scala 63:24]
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
  Pkg_Cnt_Reg = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  filt = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  tmp_rdata = _RAND_2[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      Pkg_Cnt_Reg <= 3'h0;
    end else if (io_send_ack) begin
      if (_T_7) begin
        Pkg_Cnt_Reg <= _T_11;
      end else if (_T_2) begin
        Pkg_Cnt_Reg <= 3'h0;
      end else begin
        Pkg_Cnt_Reg <= _T_11;
      end
    end
    if (reset) begin
      filt <= 8'h0;
    end else if (io_send_ack) begin
      if (_T_7) begin
        filt <= _T_9;
      end else begin
        filt <= tmp_rdata;
      end
    end else begin
      filt <= 8'h0;
    end
    if (reset) begin
      tmp_rdata <= 8'h0;
    end else begin
      tmp_rdata <= _GEN_9;
    end
  end
endmodule
