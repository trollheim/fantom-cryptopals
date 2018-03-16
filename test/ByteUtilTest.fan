class ByteUtilTest : Test
{
  Void testStuff()
  {
  	verifyEq(ByteUtil.toString(Buf.make.write(0x0b)),"0b");
  }
	
 Void testBuffers()
  {
	a :=	ByteUtil.toBuf("000100020003000400050006000700080009000a000b000c000d000e000f0010")
   	b :=	ByteUtil.toBuf("0010000f000e000d000c000b000a000900080007000600050004000300020001")
   	c := Xor.xor(a, b);
		
   	echo(c.readChar)
   	echo(c.readChar)
  }	
 
	
	
}