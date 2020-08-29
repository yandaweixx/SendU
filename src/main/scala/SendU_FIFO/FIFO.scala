package SendU_FIFO

import chisel3._

abstract class FIFO[T <: Data ]( gen: T, depth: Int) extends
  Module {
  val io = IO(new FifoIO(gen))
  assert(depth > 0, "Number of buffer elements needs to be larger than 0")
}


