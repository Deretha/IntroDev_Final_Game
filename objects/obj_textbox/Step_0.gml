
if (text_timer > 0) {
    text_timer -= delta_time; // Subtract time elapsed since the last frame
	//built in var returns frame delta time --> time difference between prev frame and current frame
} else if (text_position < string_length(text[current_page])) {
    text_timer = text_speed; // Reset timer
    text_position++;         // Move to next character
    display_text = string_copy(text[current_page], 1, text_position); // Updates displayed text
	
	if (text_position % 4 == 0) { // Play sound for every 2nd letter
    var random_sound = talk_sounds[irandom(array_length(talk_sounds) - 1)];
    audio_play_sound(random_sound, 1, false);
	}
}

// once all text has been displayed and you hit the space button, goes to next page
if (keyboard_check_pressed(vk_space)) {
    if (text_position < string_length(text[current_page])) {
        // Skips animation and displays full text
        text_position = string_length(text[current_page]);
        display_text = text[current_page];
    } else {
        // Move to the next page if the full text is already displayed
        current_page++;
        if (current_page >= array_length(text)) {
            room_goto(rm_start); //when at last page, next time hit space goes to start room
        } else {
             // Reset vars for next page
            text_position = 0;
            display_text = "";
        }
    }
}

//press S to skip cutscene
if(keyboard_check_pressed(ord("S"))){
	room_goto(rm_start);
}