package SendU_Register

import chisel3._
import chisel3.experimental.chiselName

@chiselName
class RegisterFile(readPorts: Int, addr:Int, data_len:Int, depth:Int) extends Module {
  require(readPorts >= 0)
  val io = IO(new Bundle {
    val wen = Input(Bool())
    val waddr = Input(UInt(addr.W))//Input(UInt(5.W))
    val wdata = Input(UInt(data_len.W))
    val raddr = Input(UInt(addr.W))//Input(Vec(readPorts, UInt(5.W)))
    val rdata = Output(UInt(data_len.W))
  })

  // 包含UInt类型向量的寄存器
  val reg = RegInit(VecInit(Seq.fill(depth)(0.U(data_len.W))))
  when(io.wen) {
    reg(io.waddr) := io.wdata
  }

    when(io.raddr === 0.U) {
      io.rdata := 0.U
    }.otherwise {
      io.rdata := reg(io.raddr)
    }

}

object Main{
  def main(args: Array[String]): Unit = {
    println("main function")
    // val a = UInt(0.W)
    chisel3.Driver.execute(args, () => new RegisterFile(4,3, 8,8))
  }
}

