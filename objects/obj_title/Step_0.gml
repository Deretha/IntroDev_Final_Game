// Check if the mouse is over the text
if (mouse_x > text_x  && mouse_x < text_width &&
    mouse_y > text_y  && mouse_y < text_height) {
    is_hovering = true;
} else {
    is_hovering = false;
}

if(is_hovering && mouse_check_button_pressed(mb_left)){
	audio_play_sound(snd_click, 10, false);
	room_goto(rm_intro);
}