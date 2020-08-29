package SendU_FIFO

import chisel3._

class DecoupledIO[T <: Data ]( gen: T) extends Bundle {
  val ready = Input(Bool ())
  val valid = Output(Bool ())
  val bits = Output(gen)

  override def cloneType = new DecoupledIO[T](gen).asInstanceOf[this.type]
}