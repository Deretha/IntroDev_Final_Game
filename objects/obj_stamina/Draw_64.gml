//draws the stamina of player
if(instance_exists(obj_player_one))
{
	draw_sprite(spr_back_stamina,1,10,10);
	draw_sprite_ext(spr_p1_front_stamina,1, 10, 10,
	max(0,obj_player_one.stamina/obj_player_one.staminaMax),1,0,c_white,1);
}

if(instance_exists(obj_player_two))
{
	draw_sprite(spr_back_stamina,1, 1200,10)
	draw_sprite_ext(spr_p2_front_stamina,1,1200,10,
	max(0,obj_player_two.stamina/obj_player_two.staminaMax),1,0,c_white,1);
}
