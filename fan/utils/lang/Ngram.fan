
class Ngram {

	private Str ngram;
	private Int score;
	private Int length;
	
	
	  new make (Str ngram,Int score){
		this.ngram = ngram;
		this.score = score;
		this.length = ngram.size;
		
	}
	
	
	Int rankText(Str text ){
	Int[] helper := ngram.chars();
	Int[] baseline := text.chars();
	Int sc := 0;
	Int j :=0;	 
	for (Int i:=0;i<baseline.size;i++){
		
		if (baseline[i]==helper[j]){
			j++;
			if (helper.size<=j){
				j=0;
				sc += score;
			}
		}else{
			j=0;
		}
		
	}
		
		
	return sc;
		
	}
	
	
}
