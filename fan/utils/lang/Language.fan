
class Language {
	
	
	Ngram[] ngrams := [,]
	
	public static Language fromFile(Str path){
		return make(path.toUri.toFile());
	}
	
	new make(File file){
		echo("open file");
		line := 0;
		file.readAllLines.each |p1| { 
			line++;
			Str[] items := p1.split()
			for(i:=0;i<items.size;i++){
				item := items.get(i);
				if (item.size ==0){
					Int score := 30 - (line/10)*10;
					ngrams.add(Ngram.make(item,score));
				}else{
					Int score := (100* (item.size-1));
					ngrams.add(Ngram.make(item,score));
					
					
				}
				
				
			}
			
			
		}		
			
		echo("end");
	}
	
	
	Int rankText(Str s){
		Int sum := 0;
		for( Int i:=0;i<ngrams.size;i++) sum+=ngrams.get(i).rankText(s);
		
		return sum;
		
	}
	
	
}
