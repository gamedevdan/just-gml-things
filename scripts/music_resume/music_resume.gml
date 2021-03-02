// Resumes currently paused music, if it exists
function music_resume() {
	
	if !(global.GAME_MUSIC == -1) {

		if (audio_is_paused(global.GAME_MUSIC)) {
    
		    audio_resume_sound(global.GAME_MUSIC);
    
		}

	}
	
}
