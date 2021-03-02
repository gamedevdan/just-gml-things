// Pauses the currently played music in the global music system
function music_pause(){
	
	if !(global.GAME_MUSIC == -1) {

		if (audio_is_playing(global.GAME_MUSIC)) {
    
		    audio_pause_sound(global.GAME_MUSIC);
    
		}

	}
	
}