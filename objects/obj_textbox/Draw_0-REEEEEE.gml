/// @description Insert description here
// You can write your code in this editor

//draw textbox
draw_sprite(spr_textbox, 0, x,y);

//draw text
draw_set_font(fnt_intro);

draw_text_ext(x + 25, y + 25, text[1], stringHeight, boxWidth);

if(keyboard_check_pressed(vk_space)){

}


