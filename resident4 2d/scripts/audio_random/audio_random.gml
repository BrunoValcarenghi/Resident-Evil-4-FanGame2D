function audio_random(_som, vol = 1, _min = 0.49, _max = 1.51){
    if (!audio_is_playing(_som)){
		var _snd = audio_play_sound(_som, 1, false, global.volume * vol);
	    var _tom = random_range(_min, _max);
	    audio_sound_pitch(_snd, _tom);
	}
}