// Play a sound effect with an altered pitch from one simple script
function sound_play_pitch(_index,_pitch){

	var _temp = -1;
	
	_temp = audio_play_sound(_index,1,false);
    
	audio_sound_pitch(_temp, _pitch);

	return _temp;

}
