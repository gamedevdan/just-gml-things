// Turn a number of steps into a time string showing minutes:seconds:hundredthsofseconds
function steps_to_time_string(_steps) {
	
	var _gamespeed = game_get_speed(gamespeed_fps);

	var _totalsecs = _steps div _gamespeed;
	var _totalmins = _totalsecs div 60;
	var _leftoversecs = _totalsecs-(_totalmins*60);
	var _leftoversteps = floor((_gamespeed - (_totalsecs*60))*(100/_gamespeed));

	var _timeString = "";

	_timeString += string(_totalmins)+":";

	if (_leftoversecs<10) {
		_timeString += "0";	
	}

	_timeString += string(_leftoversecs)+".";

	if (_leftoversteps<10) {
		_timeString += "0";
	}

	_timeString += string(_leftoversteps);

	return _timeString;

}
