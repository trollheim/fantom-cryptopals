
class StrUtils {
	
	
 
	
	
public static	Str[] transpose(Str[] arr){
		StrBuf[] helper := [,];
		Int max := 0;
		Buf[] buffers := [,];
		
		for (Int i :=0; i<arr.size;i++){
			helper.add(  StrBuf.make());
			buffers.add(arr[i].toBuf);
			if (arr.get(i).size>max)max = arr.get(i).size;
		}
		
		
		
		for (Int i :=0;i<max;i++){
		for (Int j :=0 ;j<buffers.size;j++){
			Buf b:=buffers.get(j)
			if (b.remaining>0 )
			helper[i].addChar(b.readChar)
		}
		}
		
	 
		return helper.map |b| { b.toStr  };
		
	}
	
	public static	Str[] splitTranspose(Buf buf,Int length){
		StrBuf[] helper := [,];
		Int max := 0;
	 buf.seek(0)
		for (Int i :=0; i<length;i++){
				helper.add(  StrBuf.make);
		}
 
		for (Int i :=0; i<buf.size;i++){
		 		helper.get(i%length).addChar( buf.readU1);
		 }
		
		
 
		
	 
		return helper.map |b| { b.toStr  };
		
	}
	
	
}
