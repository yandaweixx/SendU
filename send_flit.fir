;buildInfoPackage: chisel3, version: 3.3.2, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit send_flit : 
  module RegisterFile : 
    input clock : Clock
    input reset : Reset
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
    
  module send_flit : 
    input clock : Clock
    input reset : UInt<1>
    output io : {send_msg : UInt<1>, send_pkg : UInt<8>, send_tail : UInt<1>, flip send_ack : UInt<1>, flip waddr : UInt<3>, flip wdata : UInt<8>, flip wen : UInt<1>, flip din : {dest_pe : UInt<2>, reg_start_addr : UInt<3>, data_length : UInt<3>}}
    
    reg Pkg_Cnt_Reg : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[send_flit.scala 23:28]
    inst Reg_files of RegisterFile @[send_flit.scala 27:26]
    Reg_files.clock <= clock
    Reg_files.reset <= reset
    Reg_files.io.waddr <= io.waddr @[send_flit.scala 29:22]
    Reg_files.io.wdata <= io.wdata @[send_flit.scala 30:22]
    Reg_files.io.wen <= io.wen @[send_flit.scala 31:20]
    reg filt : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[send_flit.scala 34:21]
    reg tmp_addr : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[send_flit.scala 36:25]
    reg tmp_rdata : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[send_flit.scala 37:26]
    io.send_pkg <= filt @[send_flit.scala 38:15]
    node _T = add(io.din.data_length, UInt<1>("h01")) @[send_flit.scala 41:57]
    node _T_1 = tail(_T, 1) @[send_flit.scala 41:57]
    node _T_2 = eq(Pkg_Cnt_Reg, _T_1) @[send_flit.scala 41:33]
    node _T_3 = eq(Pkg_Cnt_Reg, UInt<1>("h01")) @[send_flit.scala 41:104]
    node _T_4 = add(tmp_addr, UInt<1>("h01")) @[send_flit.scala 41:144]
    node _T_5 = tail(_T_4, 1) @[send_flit.scala 41:144]
    node _T_6 = mux(_T_3, io.din.reg_start_addr, _T_5) @[send_flit.scala 41:91]
    node nextVal = mux(_T_2, io.din.reg_start_addr, _T_6) @[send_flit.scala 41:20]
    when io.send_ack : @[send_flit.scala 43:20]
      Reg_files.io.raddr <= nextVal @[send_flit.scala 44:24]
      tmp_rdata <= Reg_files.io.rdata @[send_flit.scala 45:14]
      node _T_7 = eq(Pkg_Cnt_Reg, UInt<1>("h00")) @[send_flit.scala 46:22]
      when _T_7 : @[send_flit.scala 46:30]
        node _T_8 = cat(io.din.dest_pe, io.din.reg_start_addr) @[Cat.scala 29:58]
        node _T_9 = cat(_T_8, io.din.data_length) @[Cat.scala 29:58]
        filt <= _T_9 @[send_flit.scala 47:12]
        io.send_msg <= UInt<1>("h01") @[send_flit.scala 48:19]
        node _T_10 = add(Pkg_Cnt_Reg, UInt<1>("h01")) @[send_flit.scala 49:34]
        node _T_11 = tail(_T_10, 1) @[send_flit.scala 49:34]
        Pkg_Cnt_Reg <= _T_11 @[send_flit.scala 49:19]
        io.send_tail <= UInt<1>("h00") @[send_flit.scala 50:20]
        skip @[send_flit.scala 46:30]
      else : @[send_flit.scala 51:57]
        node _T_12 = add(io.din.data_length, UInt<1>("h01")) @[send_flit.scala 51:51]
        node _T_13 = tail(_T_12, 1) @[send_flit.scala 51:51]
        node _T_14 = eq(Pkg_Cnt_Reg, _T_13) @[send_flit.scala 51:28]
        when _T_14 : @[send_flit.scala 51:57]
          filt <= tmp_rdata @[send_flit.scala 52:12]
          io.send_msg <= UInt<1>("h01") @[send_flit.scala 53:19]
          io.send_tail <= UInt<1>("h01") @[send_flit.scala 54:20]
          Pkg_Cnt_Reg <= UInt<1>("h00") @[send_flit.scala 55:19]
          skip @[send_flit.scala 51:57]
        else : @[send_flit.scala 56:16]
          filt <= tmp_rdata @[send_flit.scala 57:12]
          io.send_msg <= UInt<1>("h01") @[send_flit.scala 58:19]
          node _T_15 = add(Pkg_Cnt_Reg, UInt<1>("h01")) @[send_flit.scala 59:34]
          node _T_16 = tail(_T_15, 1) @[send_flit.scala 59:34]
          Pkg_Cnt_Reg <= _T_16 @[send_flit.scala 59:19]
          io.send_tail <= UInt<1>("h00") @[send_flit.scala 60:20]
          skip @[send_flit.scala 56:16]
      skip @[send_flit.scala 43:20]
    else : @[send_flit.scala 62:14]
      Reg_files.io.raddr <= nextVal @[send_flit.scala 63:24]
      tmp_rdata <= Reg_files.io.rdata @[send_flit.scala 64:15]
      io.send_msg <= UInt<1>("h00") @[send_flit.scala 65:17]
      io.send_tail <= UInt<1>("h00") @[send_flit.scala 66:18]
      filt <= UInt<3>("h00") @[send_flit.scala 67:10]
      skip @[send_flit.scala 62:14]
    
