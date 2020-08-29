;buildInfoPackage: chisel3, version: 3.3.2, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit RegisterFile : 
  module RegisterFile : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip wen : UInt<1>, flip waddr : UInt<3>, flip wdata : UInt<8>, flip raddr : UInt<3>, rdata : UInt<8>}
    
    wire _T : UInt<8>[8] @[RegisterFile.scala 18:28]
    _T[0] <= UInt<8>("h00") @[RegisterFile.scala 18:28]
    _T[1] <= UInt<8>("h00") @[RegisterFile.scala 18:28]
    _T[2] <= UInt<8>("h00") @[RegisterFile.scala 18:28]
    _T[3] <= UInt<8>("h00") @[RegisterFile.scala 18:28]
    _T[4] <= UInt<8>("h00") @[RegisterFile.scala 18:28]
    _T[5] <= UInt<8>("h00") @[RegisterFile.scala 18:28]
    _T[6] <= UInt<8>("h00") @[RegisterFile.scala 18:28]
    _T[7] <= UInt<8>("h00") @[RegisterFile.scala 18:28]
    reg reg : UInt<8>[8], clock with : (reset => (reset, _T)) @[RegisterFile.scala 18:20]
    when io.wen : @[RegisterFile.scala 19:16]
      reg[io.waddr] <= io.wdata @[RegisterFile.scala 20:19]
      skip @[RegisterFile.scala 19:16]
    node _T_1 = eq(io.raddr, UInt<1>("h00")) @[RegisterFile.scala 23:19]
    when _T_1 : @[RegisterFile.scala 23:28]
      io.rdata <= UInt<1>("h00") @[RegisterFile.scala 24:16]
      skip @[RegisterFile.scala 23:28]
    else : @[RegisterFile.scala 25:17]
      io.rdata <= reg[io.raddr] @[RegisterFile.scala 26:16]
      skip @[RegisterFile.scala 25:17]
    
