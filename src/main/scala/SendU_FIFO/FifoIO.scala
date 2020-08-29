package SendU_FIFO

import chisel3._

class FifoIO[T <: Data ](private val gen: T) extends Bundle {
  val enq = Flipped(new DecoupledIO (gen))
  val deq = new DecoupledIO (gen)
}