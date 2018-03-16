using web

class Xor {
	
	
 
	
	
	static List findKeySize(Int maxSize,Buf cipherText){
	 
		keyLengths := [,];
 
		for (keySize := 2;keySize <maxSize;keySize++){
			cipherText.seek(0)
			a := cipherText.getRange(0..keySize-1);
			b := cipherText.getRange(keySize..keySize*2-1);
			c := cipherText.getRange(keySize*2..keySize*3-1);
			d := cipherText.getRange(keySize*3..keySize*4-1);
	 //
		 
			avg := ( Distance.hamming(a, b)+ Distance.hamming(a, c)+ Distance.hamming(a, d)+
			        Distance.hamming(b, c)+ Distance.hamming(b, d)+ Distance.hamming(c, d))/6f;
			
			norm :=( 1.0f  * avg) / keySize;
		  
				
			keyLengths.add([keySize,	norm	])
		 
			
		}
		return keyLengths.sort |p1,p2| { return Comparators.floatComparator(((Obj[])p1).get(1),((Obj[])p2).get(1))  };
	}
	
	static Buf xor(Buf a,Buf b){
		if (a.size!=b.size) throw ArgErr("1");
		a.seek(0);
		b.seek(0);
		c := Buf.make();
		while(a.remaining>0){
		c.writeChar(a.readU1.xor(b.readU1()));
		}
		c.seek(0);
		return c;
	}
	
	
	static Buf repeatingXor(Buf a,Buf k){
//		if (k.size>0) throw ArgErr("1");
		a.seek(0);
		k.seek(0);
		c := Buf.make();
		while(a.remaining>0){
		c.write(a.read().xor(k.read()));
			if (k.remaining==0){
				k.seek(0);
			}
		}
		c.seek(0);
		return c;
	}
 
	
	static Obj[] decrypt(Buf a,Int k,|Int char->Int| sc){
		 
		a.seek(0);
		 
		Int score := 0;
		StrBuf c := StrBuf.make();
		
		
		while(a.remaining>0){
			res := a.readChar().xor(k)
			score =score+ sc(res);
			c.addChar(res);
		}
	 
		return [score,c.toStr()];
	}

	
	
	static Int score(Int val){
		Int score := 0;
		if (val>128){
		//	return -1000;
		}
		if (val.isAlpha()){
			score +=30;
		}
		
		if (val.isUpper()){
			val  = val.lower();
		//	score -=10;
		}
		
		if ([' ','.','?','!','\''].contains(val)){
		 
			score +=20;
		}
		if (val.isDigit()){
			score +=10;
		}
		if (['e','t','a','o','i','n','s','h','r','d','l','u'].contains(val)){
		 
			score +=50;
		}
		
		if (['_','-','+','=','(',')','*','&','^','%','$','£','"','~','#','@','[',']'].contains(val)){
		 
			score -=20;
		}
		return score;
	}
	
	
	static Str  decryptStr(Str encoded)
	{
//  WebClient(`http://cryptopals.com/static/challenge-data/4.txt`).getStr.splitLines
		Int score := -1;
		Str res := "blobsky"
		a := ByteUtil.toBuf(encoded)
		Func strategy := Xor#score.func;
		for(Int i:=0;i<256;i++){
			r := decrypt(a,i,strategy)
			Int s := r[0];
			if (s>score){
				res = r[1];
				score = s;
			}
		}
 	return res
	}
	
	
		static Obj[]  decryptBuf(Buf encoded)
	{
//  WebClient(`http://cryptopals.com/static/challenge-data/4.txt`).getStr.splitLines
		Int score := -1;
		Str res := "blobsky"
		Func strategy := Xor#score.func;
		for(Int i:=0;i<256;i++){
			r := decrypt(encoded,i,strategy)
			Int s := r[0];
			if (s>score){
				res = r[1];
				score = s;
			}
		}
 	return [res,score]
	}
	

	static Str  decryptStrs(Str[] encoded)
	{
//  WebClient(`http://cryptopals.com/static/challenge-data/4.txt`).getStr.splitLines
		Int score := -1;
		Str res := "blobsky"
		encoded.each |p1| { 
		a := ByteUtil.toBuf(p1)
		Func strategy := Xor#score.func;
		for(Int i:=0;i<256;i++){
			r := decrypt(a,i,strategy)
			Int s := r[0];
			if (s>score){
				res = r[1];
				score = s;
			}
		}
		}
		 
		 
 	return res
	}

	
	
	static Void main(Str[] args)
	{
	text := decryptStrs(WebClient(`http://cryptopals.com/static/challenge-data/4.txt`).getStr.splitLines)
	// Str text :=  "Burning 'em, if you ain't quick and nimble";
	 Str key := "ICE"
	res :=	repeatingXor(text.toBuf,key.toBuf);
 	echo(res.printLine);
	}
	 
		
		
//	a := ByteUtil.toBuf("1c0111001f010100061a024b53535009181c")
//	b := ByteUtil.toBuf("686974207468652062756c6c277320657965")
//	echo(ByteUtil.toString(xor(a, b)));	
		
 
		
	 
	
}
