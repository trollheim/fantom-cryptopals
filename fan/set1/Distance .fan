
class Distance  {
	
	static Int hamming (Buf a,Buf b){
		a.seek(0);b.seek(0);
	 
		
		if (a.size != b.size) return -1;
		c := Xor.xor(a, b);
		i := c.size;
		sum := 0
		for (;i>0;i--){
		 
			byte := c.readChar
			while (byte>0){
				sum += byte %2;
				byte = byte /2;
			}
			
		}
		return sum;
		 
	}
	
}
