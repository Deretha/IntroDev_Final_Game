draw_set_font(fnt_text);
draw_set_color(#00FFFB);
draw_set_halign(fa_center);
draw_text(room_width/2,room_height * 0.2,"BRAWL   &   BOUNCE  : ULTIMATE   POGO   SHOWDOWN");

draw_set_color(#00CECB);
draw_text(room_width/2, room_height * 0.4, "Click Below to Begin Playing");
if (is_hovering) {
    draw_set_color(c_yellow);
} else {
    draw_set_color(c_white);
}

// Draw text
draw_text(room_width/2, room_height * 0.5, "START GAME");