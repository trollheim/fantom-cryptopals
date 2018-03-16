using web

class RestHelper {
	static Void main(Str[] args)
	{
		string  := WebClient(`http://cryptopals.com/static/challenge-data/4.txt`).getStr.splitLines
	 
		echo(string[0])
	}
}
