/// @description Insert description here
// You can write your code in this editor

draw_self();

//flash
if (flashAlpha > 0) { //if flashAlpha creater than 0, meaning flash activated, will also activate shader
	
	if(is_hurt){
		shader_set(shFlash);
	
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashHurtColor, flashAlpha);
	
		shader_reset();
	}
	else {
		shader_set(shCollect);
	
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashCollectColor, flashAlpha);
	
		shader_reset();
	}
}

//if a player hits the room barrier, a barrier block is created to visually show they can't go past
if(hit_right_wall){
	draw_sprite(spr_barrier, 0, x + 10, y - 30);
}

if(hit_left_wall){
	draw_sprite(spr_barrier, 0, x - 40, y - 30);
}
