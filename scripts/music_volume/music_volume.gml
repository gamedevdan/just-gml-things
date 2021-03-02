// Change the volume of the currently playing music
function music_volume(_vol,_seconds){
	
	if !(global.GAME_MUSIC == -1) {

		audio_sound_gain(global.GAME_MUSIC,_vol,_seconds*1000);
	
	}
	
}
