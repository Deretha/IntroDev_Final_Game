/// @description Insert description here
// You can write your code in this editor



draw_set_font(fnt_text);
draw_set_color(#00CECB);
draw_set_halign(fa_center);
draw_text(room_width/2,30,"WORLD GRAND FINAL POGOJUMPING COMPETITION");


draw_set_color(#009996);
draw_set_halign(fa_left);
draw_text_ext(x -540 ,90,"Rules:",50, 1350);
draw_text_ext(x -540 ,350,"Controls:",50, 1350);

draw_set_color(c_black);
draw_set_font(fnt_instruc);
draw_text(50, 150, "- Last one standing takes it ALL");


draw_text(50, 250, "- Collect ENERGY DRINKS to regain STAMINA"); 

draw_text(x-200,400, "Player 1");
draw_text(x + 300,400, "Player 2");

draw_set_font(fnt_controls);
draw_text(x-500, 500, "MOVE: A/D Keys");
draw_text(x-500, 600, "ATTACK: F Key");

draw_text(x + 500, 500, "MOVE: Arrow Keys");
draw_text(x + 500, 600, "ATTACK: P Key");

draw_set_halign(fa_center);
draw_text(room_width/2, 600, "Press SPACE to Start");