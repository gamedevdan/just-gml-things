// Just plays a sound effect without having to fill in the priority or loop argument every time
function sound_play(_index){

	return audio_play_sound(_index,1,false);
	
}
