/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_left);
//draw textbox
draw_sprite(spr_textbox, 0, x,y);

draw_set_color(#009996);
draw_set_font(fnt_intro);

// Draw the text 
draw_text_ext(x + 25, y + 25, display_text, stringHeight, boxWidth);

draw_set_font(fnt_instruc);
draw_set_color(c_black);
draw_text(room_width - 610, y + 130, "Press SPACE to Continue");

draw_text(room_width - 370, y - 560, "Press S to Skip");