/// @description Insert description here
// You can write your code in this editor
	audio_play_sound(snd_collect,40,false);
	part_particles_create(starparts,x,y,star,10);
	flashAlpha = 1; // when player collects drink, player flashes drink color
	stamina += 10;
	instance_destroy(other);
	


