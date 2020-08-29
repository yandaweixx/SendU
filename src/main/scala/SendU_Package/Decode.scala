package SendU_Package
import SendU_FIFO.DecoupledIO
import chisel3._
import chisel3.util._
import chisel3.experimental._

object Instructions {
  def CMD   = BitPat("b11111111")
  def NOP   = BitPat.bitPatToUInt(BitPat("b00000000"))
  //def BEQ  = BitPat("b?????????????????000?????1100011")
  //value : "b00000000000000000000000001100011"
  //mask : "b00000000000000000111000001111111"
}

class DecodeOut(pe_width: UInt, ba_addr: Int, data_len_width: Int) extends Bundle {
  val dest_pe = Output(pe_width)
  val reg_start_addr = Output(UInt(ba_addr.W))
  val data_length = Output(UInt(data_len_width.W))
  override def cloneType = new DecodeOut(pe_width, ba_addr, data_len_width).asInstanceOf[this.type]

}

class DecodeIn[T <: Data ](private val gen: T) extends Bundle {
  val input = Flipped(new DecoupledIO (gen))
}

@chiselName
class Decode(gen:UInt, dest_pe: UInt, reg_start_addr:Int, data_len_width:Int) extends Module {
  val io = IO(new Bundle {
    val din = new DecodeIn(gen)
    val dout = new DecodeOut(dest_pe,reg_start_addr,data_len_width)
  })

  val fe_inst = WireDefault(Instructions.NOP)

  io.din.input.ready := true.B

  io.dout.dest_pe :=  fe_inst(1,0)
  io.dout.reg_start_addr :=  fe_inst(4,2)
  io.dout.data_length :=  fe_inst(7,5)

  /*bitpat 's compare*/
  //"b10101".U === BitPat("b101??") // 等于true.B
  //
  //"b10111".U === BitPat("b101??") // 等于true.B
  //
  //"b10001".U === BitPat("b101??") // 等于false.B

    when(io.din.input.valid) {
      fe_inst := io.din.input.bits
    }.otherwise(
      fe_inst := Instructions.NOP
    )

}

object Main{
  def main(args: Array[String]): Unit = {
    println("main function")
    // val a = UInt(0.W)
    chisel3.Driver.execute(args, () => new Decode(UInt(8.W), UInt(2.W), 3, 3))
  }
}

