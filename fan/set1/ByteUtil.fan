
class ByteUtil {
	static Str toString(Buf buf){
		buf.seek(0);
		in := buf.in();
		
		Str s := "";
		while(in.avail() >0){
			s+=in.readBits(8).toHex(2)
		} 
		return s;
	}
	
	
	static Buf  toBuf(Str str){
	st := str.toBuf.in();
	out := Buf.make();
	while(st.avail() >0){
	a := st.readBits(8).toChar().toInt(16) 
	b := st.readBits(8).toChar().toInt(16) 
 	out.writeChar(a*16+b) 
 	}
	out.close()
	return out;
	}
	
	
	
}
