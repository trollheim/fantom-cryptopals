
class Hex2base64 {
	static const  Str ALPHABET := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"+
						  "abcdefghijklmnopqrstuvwxyz"+
						  "0123456789+/";
	static  const  Str PADDING := "=";
						  
 
	static Void main(Str[] args)
	{
 	Str string := "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d";
	echo(string)
	buf := ByteUtil.toBuf(string);
 
	echo(buf.toBase64);
	echo(toBase64(buf))
	echo("X"+ByteUtil.toString(buf));

	}
	
	
	static Buf fromBase64(Str in){
		//TODO
		return Buf.fromBase64(in)
	}
	
	static Str toBase64(Buf in){
		in.seek(0);
		echo("p"+in.pos);
		stream := in.in();
		Str s := ""
		Int index := 0;
		bits := 8*stream.avail()
		while ( bits>0){
			 
			if (bits>6){
				index = stream.readBits(6);
				bits-=6;
				 
			}else{
				index = stream.readBits(bits);
				 
				index = index.shiftl(6-bits);
				bits = 0;
			}

			char := ALPHABET.get(index);
			s+= char.toChar();
		}
		for (i:=0;i<s.size%4;i++)s+=PADDING;
 
		
		return s;
	}
	
	 
 
}
