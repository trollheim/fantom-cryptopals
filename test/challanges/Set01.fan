using web

class Set01:Test {
	Void testTask6(){
		
		Language lang  := Language.fromFile("./resources/lang_en.txt");
		//			Str	string  := WebClient(`http://cryptopals.com/static/challenge-data/6.txt`).getStr();//.replace("\n", "");
		
			 cipher  := Xor.repeatingXor("In the middle of the journey of our life I came to myself within a dark wood where the straight way was lost.".toBuf(Charset("utf8")), "FOOBAR".toBuf(Charset("utf8")));
		//	echo(string);
//			cipher := Hex2base64.fromBase64(string);
 
			echo(cipher.charset);
			keys := Xor.findKeySize(cipher.size/4, cipher)
	 
			echo("Possible keys ${keys}")
		
			 
			Int cipherSize := cipher.size
		
 	keys.each |item| {
 			Obj[] results := [,];
 			Int keySize := ((Obj[])item).get(0);
			list :=StrUtils.splitTranspose(cipher, keySize)
			
////			
//			echo("trying size ${keySize}")	
//			echo(list.size)
////			echo("\n\n\n\nBlobsky\n")
////				if Xor.decryptBuf(p1.toBuf); 
		
			
		
		list.each |p1| {
				
				line := Xor.decryptBuf(p1.toBuf);
//				echo("[][](${line})")
				results.add(line)  
			
		}
			
			
			StrBuf result := StrBuf();
		 	for (Int i:=0;i<cipherSize;i++){
				Obj[] r := results.get(i%results.size);	
				ch :=r[0].toStr.chars().get(i/results.size);
//					 [res,score]
					result.addChar(ch)
		 	}
			
		sc := lang.rankText(result.toStr);
		echo("${keySize} ${result.toStr} ${sc}")
	}
	 
	}
		
//		results.sortr |p1,p2| { ((Obj[])p1).get(1).compare(  ((Obj[])p2).get(1))  }
//		
//		echo(results.get(1))
		
		
	//}
	
}
