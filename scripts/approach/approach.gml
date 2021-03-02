// Approach a value by an amount
function approach(_current,_target,_increment){

	var _temp = _current;

	if (_current-_increment > _target) {

	    _temp = _target-_increment;

	} else if (_current+_increment < _target) {

	    _temp = _current+_increment;

	} else {

	    _temp = _target;

	}

	return _temp;


}
