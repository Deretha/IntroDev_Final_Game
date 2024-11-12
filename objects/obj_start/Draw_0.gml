/// @description Insert description here
// You can write your code in this editor



draw_set_font(fnt_text);
draw_set_color(#00CECB);
draw_set_halign(fa_center);
draw_text(room_width/2,10,"WORLD GRAND FINAL POGOJUMPING COMPETITION");


draw_set_color(#009996);
draw_set_halign(fa_left);
draw_text_ext(x -540 ,90,"ONLY ONE MORE PERSON STANDS IN THE WAY TO GOLD AND TITLE OF POGOJUMPING CHAMPION",50, 1350);
draw_set_halign(fa_center);
draw_text(room_width/2, 250, "LAST ONE STANDING TAKES IT ALL");

draw_set_font(fnt_instruc);
draw_set_color(c_black);
draw_text(room_width/2, 340, "COLLECT ENERGY DRINKS TO REGAIN STAMINA"); 

draw_set_halign(fa_left);
draw_text(x-500,400, "P1 MOVE: A/D Keys || P1 ATTACK: F Key");

draw_text(x+150, 400, "P2 MOVE: Arrow Keys || P2 ATTACK: P Key");

draw_set_halign(fa_center);
draw_text(room_width/2, 600, "Press SPACE to Start");