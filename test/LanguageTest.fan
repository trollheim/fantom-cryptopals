
class LanguageTest : Test {
	
	Void testLoadLanguage(){
		Language l  := Language.fromFile("./resources/lang_en.txt");
		
		echo(l.rankText("this is me"))
		
	}
}
