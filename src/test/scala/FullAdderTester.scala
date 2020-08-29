import chisel3.iotesters.PeekPokeTester

import chisel3.experimental.chiselName

@chiselName
class FullAdderTester(c: FullAdder) extends PeekPokeTester(c){
  for (t <-0 until 4){
    val a = rnd.nextInt(2)
    val b = rnd.nextInt(2)
    val cin = rnd.nextInt(2)
    val res = a + b + cin
    val sum = res & 1
    val cout = (res >> 1) & 1
    poke(c.io.a, a)
    poke(c.io.b, b)
    poke(c.io.cin, cin)
    step(1)
    expect(c.io.sum, sum)
    expect(c.io.cout, cout)
  }
}

object  FullAdderTester{
  def main(args: Array[String]): Unit = {
    chisel3.iotesters.Driver(() => new FullAdder)(c => new FullAdderTester(c))
  }
}