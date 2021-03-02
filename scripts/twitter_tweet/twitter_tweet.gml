// Opens a twitter intent
// On windows / html5 this will open a browser window to the "compose tweet" page of Twitter
// On Android / iOS it *may* open the Twitter app instead if the user has it installed
// Although it depends on the OS version of the device
function twitter_tweet(_tweet){

	var _tempTweetString = _tweet;
	_tempTweetString = string_replace(_tempTweetString," ","%20");
	_tempTweetString = string_replace(_tempTweetString,":","%3A");
	_tempTweetString = string_replace(_tempTweetString,"/","%2F");
	_tempTweetString = string_replace(_tempTweetString,"\"","%22");
	_tempTweetString = string_replace(_tempTweetString,"!","%21");
	_tempTweetString = string_replace(_tempTweetString,"#","%23");
	_tempTweetString = string_replace(_tempTweetString,"&","%26");
	_tempTweetString = string_replace(_tempTweetString,"(","%28");
	_tempTweetString = string_replace(_tempTweetString,")","%29");
	_tempTweetString = string_replace(_tempTweetString,",","%2C");
	_tempTweetString = string_replace(_tempTweetString,".","%2E");
	_tempTweetString = string_replace(_tempTweetString,"-","%2D");
	_tempTweetString = string_replace(_tempTweetString,"@","%40");

	url_open_ext("https://twitter.com/intent/tweet?text="+_tempTweetString,"_blank");

}
