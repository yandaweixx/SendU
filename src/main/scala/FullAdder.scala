import chisel3._

class FullAdder extends Module{
    val io = IO(new Bundle{
      val a = Input(UInt(1.W))
      val b = Input(UInt(1.W))
      val cin = Input(UInt(1.W))
      val sum = Output(UInt(1.W))
      val cout = Output(UInt(1.W))
    })

  val a_xor_b = io.a ^ io.b
  io.sum := a_xor_b ^ io.cin

  val a_and_b = io.a & io.b
  val b_and_cin = io.b & io.cin
  val a_and_cin = io.a & io.cin
  io.cout := a_and_b | b_and_cin | a_and_cin
}

object Main{
  def main(args: Array[String]): Unit = {
    println("main function")
    chisel3.Driver.execute(args, () => new FullAdder)
  }
}
