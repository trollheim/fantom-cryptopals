
class StrUtilsTest : Test{
	
	Void testTranspose(){
		Str[] exp := ["abc", "abc", "b"];
		Str[] res := StrUtils.transpose(["aa","bbb","cc"])
		verifyEq(res  ,exp )
		
	}
//	
		
	Void testSplitTranspose(){
		Str[] exp := ["abc", "abc", "abc"];
		Str[] res := StrUtils.splitTranspose("aaabbbccc".toBuf,3)
		verifyEq(res  ,exp )
		
	}
}
