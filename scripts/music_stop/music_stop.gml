// Stops the currently playing music from our global music system
function music_stop(){

	if !(global.GAME_MUSIC == -1) {

		if (audio_is_playing(global.GAME_MUSIC)) {
    
		    audio_stop_sound(global.GAME_MUSIC);
    
		}

	}

}
