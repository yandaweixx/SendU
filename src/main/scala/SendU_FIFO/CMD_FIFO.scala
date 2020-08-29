package SendU_FIFO

import chisel3._
import chisel3.experimental.chiselName
import chisel3.util.log2Ceil

@chiselName
class CMD_FIFO[T <: Data](gen: T, depth: Int) extends FIFO(gen:
  T, depth: Int) {
  def counter(depth: Int, incr: Bool): (UInt, UInt) = {
    val cntReg = RegInit(0.U(log2Ceil(depth).W))
    val nextVal = Mux(cntReg === (depth - 1).U, 0.U, cntReg + 1.U)
    when(incr) {
      cntReg := nextVal
    }
    (cntReg, nextVal)
  }

  // the register based memory
  val memReg = Reg(Vec(depth, gen))
  val incrRead = WireDefault(false.B)
  val incrWrite = WireDefault(false.B)
  val (readPtr, nextRead) = counter(depth, incrRead)
  val (writePtr, nextWrite) = counter(depth, incrWrite)
  val emptyReg = RegInit(true.B)
  val fullReg = RegInit(false.B)
  when(io.enq.valid && !fullReg) {
    memReg(writePtr) := io.enq.bits
    emptyReg := false.B
    fullReg := nextWrite === readPtr
    incrWrite := true.B
  }
  when(io.deq.ready && !emptyReg) {
    fullReg := false.B
    emptyReg := nextRead === writePtr
    incrRead := true.B
  }
  io.deq.bits := memReg(readPtr)
  io.enq.ready := !fullReg
  io.deq.valid := !emptyReg
}
object Main{
  def main(args: Array[String]): Unit = {
    println("main function")
   // val a = UInt(0.W)
    chisel3.Driver.execute(args, () => new CMD_FIFO[UInt](UInt(16.W),16))
  }
}
