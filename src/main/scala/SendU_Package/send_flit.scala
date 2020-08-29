package SendU_Package
import SendU_Register.RegisterFile
import chisel3._
import chisel3.internal.naming.chiselName
import chisel3.testers.BasicTester
import chisel3.util._

/*
import chisel3._
import chisel3.stage.ChiselStage

class Foo extends RawModule {
  val clk   = IO(Input(Clock()))
  val reset = IO(Input(AsyncReset()))
  val io    = IO(Input(new Bundle{ val D = UInt(1.W) }))
  val out   = IO(Output(Bool()))

  val x = withClockAndReset(clk, reset) { RegNext(io.D, init=0.U) }
  out := x
}
然后，将为寄存器生成以下Verilog逻辑x：

always @(posedge clk or posedge reset) begin
  if (reset) begin
    x <= 1'h0;
  end else begin
    x <= io_D;
  end
end
要使用同步reset，请将类型reset从更改AsyncReset为Bool。*/


@chiselName
class send_flit(packet_width: Int, dest_pe: UInt, reg_start_addr:Int, data_len_width: Int, filt_width:Int, read_ports:Int) extends Module {
  val io = IO(new Bundle {
    val send_msg = Output(Bool())
    val send_pkg = Output(UInt(packet_width.W))
    val send_tail = Output(Bool())
    val send_ack = Input(Bool())
    val waddr = Input(UInt(reg_start_addr.W))
    val wdata = Input(UInt(filt_width.W))
    val wen = Input(Bool())
    val din = Flipped(new DecodeOut(dest_pe,reg_start_addr,data_len_width))
  })



  val Pkg_Cnt_Reg = RegInit(0.U(data_len_width.W)) //lo2ceil can only take int parameter

  //val Reg_datalen = RegInit(0.U(data_len_width.W))

  val Reg_files  = Module(new RegisterFile(read_ports,reg_start_addr ,filt_width,8))//8bit-width

  Reg_files.io.waddr := io.waddr
  Reg_files.io.wdata := io.wdata
  Reg_files.io.wen := io.wen

  //val reg = RegInit(VecInit(Seq.fill(depth)(0.U((data_len*2).W))))
  val filt = RegInit(0.U(packet_width.W))

  val tmp_addr = RegInit(0.U(reg_start_addr.W))
  val tmp_rdata = RegInit(0.U(packet_width.W))
  io.send_pkg := filt
  //Reg_files.io.raddr := io.din.reg_start_addr
  //VecInit(Seq.fill(3)(Module(new Mux2).io))
  val nextVal = Mux(Pkg_Cnt_Reg === (io.din.data_length + 1.U), io.din.reg_start_addr, Mux(Pkg_Cnt_Reg === 1.U,io.din.reg_start_addr,(tmp_addr + 1.U)))

  when(io.send_ack){
    Reg_files.io.raddr := nextVal
    tmp_rdata:= Reg_files.io.rdata
    when(Pkg_Cnt_Reg === 0.U){
      filt := Cat(io.din.dest_pe, io.din.reg_start_addr,io.din.data_length)
      io.send_msg := true.B
      Pkg_Cnt_Reg := Pkg_Cnt_Reg + 1.U
      io.send_tail := false.B
    }.elsewhen(Pkg_Cnt_Reg === io.din.data_length + 1.U){
      filt := tmp_rdata
      io.send_msg := true.B
      io.send_tail := true.B
      Pkg_Cnt_Reg := 0.U
    }.otherwise{
      filt := tmp_rdata
      io.send_msg := true.B
      Pkg_Cnt_Reg := Pkg_Cnt_Reg + 1.U
      io.send_tail := false.B
    }
  }.otherwise{
    Reg_files.io.raddr := nextVal
    tmp_rdata := Reg_files.io.rdata
    io.send_msg := false.B
    io.send_tail := false.B
    filt := 0.U(data_len_width.W)

  }
}

object Main2{
  def main(args: Array[String]): Unit = {
    println("main function")
    // val a = UInt(0.W)
    chisel3.Driver.execute(args, () => new send_flit(8, UInt(2.W),3, 3, 8, 1) )
  }
}
