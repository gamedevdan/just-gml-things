// Plays a piece of music using the global music system
// Takes care of checking for previous music and stopping it
function music_play(_index,_loops){

	if !(global.GAME_MUSIC  == -1) {
    
		if !(audio_is_playing(_index)) {
    
			if (audio_is_playing(global.GAME_MUSIC )) {
            
			    audio_stop_sound(global.GAME_MUSIC );
            
			}
            
			global.GAME_MUSIC  = audio_play_sound(_index,100,_loops);
        
		}
    
	} else {
    
		if !(audio_is_playing(_index)) {
    
			global.GAME_MUSIC  = audio_play_sound(_index,100,_loops);
        
		}
    
	}
	
}
