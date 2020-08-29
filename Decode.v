module Decode(
  input        clock,
  input        reset,
  output       io_din_input_ready,
  input        io_din_input_valid,
  input  [7:0] io_din_input_bits,
  output [1:0] io_dout_dest_pe,
  output [2:0] io_dout_reg_start_addr,
  output [2:0] io_dout_data_length
);
  wire [7:0] fe_inst = io_din_input_valid ? io_din_input_bits : 8'h0; // @[Decode.scala 49:30]
  assign io_din_input_ready = 1'h1; // @[Decode.scala 36:22]
  assign io_dout_dest_pe = fe_inst[1:0]; // @[Decode.scala 38:19]
  assign io_dout_reg_start_addr = fe_inst[4:2]; // @[Decode.scala 39:26]
  assign io_dout_data_length = fe_inst[7:5]; // @[Decode.scala 40:23]
endmodule
