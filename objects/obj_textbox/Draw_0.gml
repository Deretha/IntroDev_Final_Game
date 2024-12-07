/// @description Insert description here
// You can write your code in this editor

//draw textbox
draw_sprite(spr_textbox, 0, x,y);

draw_set_color(#009996);
draw_set_font(fnt_intro);

// Draw the text 
draw_text_ext(x + 25, y + 25, display_text, stringHeight, boxWidth);


