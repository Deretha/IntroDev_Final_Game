if(keyboard_check(ord("R"))){
	room_goto(rm_intro);
	audio_stop_sound(snd_cheering);
	audio_stop_sound(snd_win);
}