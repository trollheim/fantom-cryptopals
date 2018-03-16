class DistanceTest : Test
{
  Void testHamming()
  {
  	verifyEq(Distance.hamming("this is a test".toBuf(), "wokka wokka!!!".toBuf),37);
  }
	
}

 