;buildInfoPackage: chisel3, version: 3.3.2, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit Decode : 
  module Decode : 
    input clock : Clock
    input reset : UInt<1>
    output io : {din : {flip input : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}}, dout : {dest_pe : UInt<2>, reg_start_addr : UInt<3>, data_length : UInt<3>}}
    
    wire fe_inst : UInt<8>
    fe_inst <= UInt<8>("h00")
    io.din.input.ready <= UInt<1>("h01") @[Decode.scala 36:22]
    node _T = bits(fe_inst, 1, 0) @[Decode.scala 38:30]
    io.dout.dest_pe <= _T @[Decode.scala 38:19]
    node _T_1 = bits(fe_inst, 4, 2) @[Decode.scala 39:37]
    io.dout.reg_start_addr <= _T_1 @[Decode.scala 39:26]
    node _T_2 = bits(fe_inst, 7, 5) @[Decode.scala 40:34]
    io.dout.data_length <= _T_2 @[Decode.scala 40:23]
    when io.din.input.valid : @[Decode.scala 49:30]
      fe_inst <= io.din.input.bits @[Decode.scala 50:15]
      skip @[Decode.scala 49:30]
    else : @[Decode.scala 51:16]
      fe_inst <= UInt<8>("h00") @[Decode.scala 52:15]
      skip @[Decode.scala 51:16]
    
