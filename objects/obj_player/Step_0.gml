
//keyAttack = keyboard_check_pressed(ord("F")) || keyboard_check_pressed(ord(vk_enter));

//have variables within the var def
//accel --> acceleration of x; right/left key --> A/D; etc etc
//**var in var def need to be tuned to feel like cloud bouncing game

//decreases our x_vel to be 90% of itself every single frame
x_vel *= 0.9;

//pushes us down...ie gravity
y_vel += grav;

//r_x = remainder pixels
r_x += x_vel;
r_y += y_vel;

//rounds the remainder then removes that remainder from r_x
//bc can't move fractional pixels so GM tries to figure out what to do
//by doing this, we don't let it figure it out so we just round
var to_move_x = round(r_x);
var to_move_y = round(r_y);

r_x -= to_move_x;
r_y -= to_move_y;

// returns whether # is pos, neg or neither and returns 1, -1, or 0
//ex sign(458) will return 1, sign(-5) will return -1 and sign(0) will return 0
//deals w/collisions bc when moving up don't collide w/clouds but when going down, do, etcetc
var dir = sign(to_move_y);

//ADD IN WALL COLLISION
var dist_to_r_wall = room_width - x - 10;
var dist_to_l_wall = x - 10;


//reverses vel to bounce off
//then removes remainding variables
//else if not touching walls, be able to freely move
if(to_move_x >= dist_to_r_wall)
{
	x = room_width - 11;
	x_vel = abs(x_vel) *-1;
	r_x = 0;
	audio_play_sound(snd_wall_bounce,10,false);
}
else if(to_move_x <= -dist_to_l_wall)
{
	x = 11;
	x_vel = abs(x_vel);
	r_x = 0;
	audio_play_sound(snd_wall_bounce,10,false);
}
else 
{
	x += to_move_x;
}

while(to_move_y !=0)
{
	//checks to see if you're colliding
	var colliding = false;
	//checks to see what you're colliding w/
	var collidewithfloor = noone;
	var collidewithclouds = noone;
	//if moving downwards then collide w/clouds
	if(dir >=0)
	{
		collidewithfloor = instance_place(x,y+dir, obj_floor); 
		collidewithclouds = instance_place(x,y+dir,obj_cloud_manager);
		if(collidewithfloor || collidewithclouds !=noone)
		{   //then also check if we aren't already ON cloud
			//then we can collide
			if(place_meeting(x,y,collidewithfloor) || place_meeting(x,y,collidewithclouds) == false)
			{ 
				//audio_play_sound(phaseJump3, 101, 0);
				part_particles_create(dustparts,x,y,dust,10); //creates particles
				squish_timer += squish_speed //when make contact w/floor squish animations
				colliding = true;
			}
		}
	}
	if(!colliding)
	{
		
		y +=dir;
		to_move_y -= dir;

	}
	else 
	{
		audio_play_sound(snd_boing,20,false);
		stamina -= 3;
		y = y+dir;
		y_vel = bounce_vel;
		r_y = 0;
		//when bounce off cloud, cloud loses health (starts crumbling)
		//when healt hits 0, changes sprite to obj disappearing 
		//then makes sure that the sprite animation can play
		//then after the anim has finished playing, destroys cloud in its obj instances
		//and destroys the cloud 
		with(collidewithclouds){
			cloud_health--;
			if(cloud_health == 2){
				sprite_index = cracking1_sprite;
			}
			if(cloud_health == 1){
				sprite_index = cracking2_sprite;
			}
			if(!is_disappearing && cloud_health == 0){
				sprite_index = disappear_sprite;
				image_speed = 1;
				is_disappearing = true;
				instance_change(cloud_disappear,true);
			}
		}
	
		break;
	}
		
}


//make sure stam never goes into neg
if(stamina < 0)
{
	stamina = 0;
}
if(stamina >= staminaMax) //makes sure stam never goes above 100
{
	stamina = 100;
}
//if player has no more stamina, can't move
if (stamina = 0)
{
   grav = 0;
   y_vel = 0;
   accel = 0;
}

//this is the death conditions
if(obj_player_one.stamina <= 0 || obj_player_one.y >= room_height + 300){
	room_goto(rm_p2_win);
	instance_destroy();
}
else if(obj_player_two.stamina <= 0 || obj_player_two.y >= room_height + 300){
	room_goto(rm_p1_win);
	instance_destroy();
}

if(squish_timer != 0) {
	squish_timer += squish_speed;
	image_yscale = animcurve_channel_evaluate(y_curve,squish_timer);
	image_xscale = animcurve_channel_evaluate(x_curve,squish_timer);
	if(squish_timer >=1){ //resets everything once timer done
		image_yscale = 1;
		image_xscale = 1;
		squish_timer = 0;
	}
}
 


//finds avg of p1 and p2 location
focus_x = (x + other_player.x) /2;
focus_y = (y + other_player.y) /2;
//handle smooth camera movement
targetx = focus_x - (camera_get_view_width(view_camera[0]) / 2); //where we want the camera to be  - centered on the player
targety = focus_y - (camera_get_view_height(view_camera[0]) / 2);
currentx = camera_get_view_x(view_camera[0]); //current camera position
currenty = camera_get_view_y(view_camera[0]);
//blend between the current and target camera positions for smooth movement
new_x = targetx * 0.1 + currentx * 0.9;
new_y = targety * 0.1 + currenty * 0.9;

// Clamp x position so the camera doesn't go out of bounds on the x-axis
new_x = clamp(new_x, 0, room_width - camera_get_view_width(view_camera[0]));
// Set the final camera position
camera_set_view_pos(view_camera[0], new_x, new_y);




//when attack key is pressed, attacks and plays the slash animation
//then if you are close enough to other player, which knows by
//calculating  distance btwn players and if distance is smaller than  attack range,
//you can attack and other player loses stamina
if (keyboard_check_pressed(ord(attack_key)) && attack_cooldown <= 0 && instance_exists(other_player)) {
    audio_play_sound(snd_attack, 30, false);

    sprite_index = spr_attack; 
    image_speed = 1;           // Play  attack animation
    image_index = 0;           // Restart animation

    attack_cooldown = 20;      // Set how long until you can attack again so not spamming
    slash_created = false;     // Reset check for slash created
	is_done_attacking = false; //reset check for done attacking
}


if (sprite_index == spr_attack) {
    // Check if attack animation is done and if is done, creates slash effect
    if (!slash_created && image_index >= image_number - 1) {
        //? is a conditional operator. Will return one of two given values depending on 
		//whether the condition expression evaluates to true or false. 
		//Structure is: variable = <condition> ? <statement1 (if true)> : <statement2 (if false)>
		//therefore written below is: if facing right, slash effect will be drawn on right side of character
        var slash_x_offset = (facing == 1) ? 30 : -15;
        var slash_instance = instance_create_layer(x + slash_x_offset, y, "Effects", obj_slash);

        // Flip the slash effect if the player is facing left
        slash_instance.image_xscale = (facing == -1) ? -1 : 1;

        // Mark the slash as created
        slash_created = true;

        //checks to see if player is facing correct direction so then allowed to attack
		//ex: if p1 is facing left AND p1 loc is to the right of p2, meaning p2 is to the left of p1
		//then facing left. similar logic applies for facing right 
        if (instance_exists(other_player)) {
            var is_facing = (facing == -1 && x > other_player.x) ||
                            (facing == 1 && x < other_player.x); 
            var dist = point_distance(x, y, other_player.x, other_player.y);
            if (dist <= attack_range && other_player.invincible == false && is_facing) {
                other_player.stamina -= attack_damage;
                other_player.invincible = true;
            }
        }
    }

// If attack animation is done, transition to done attacking sprite
    if (image_index >= image_number - 1) {
        sprite_index = spr_done_attacking; 
        image_speed = 1;                   // Play through animation
        image_index = 0;                   // Restart animation
        is_done_attacking = true;       
    }
}

if (is_done_attacking && sprite_index == spr_done_attacking) {
    //if the done animation is finished, go back to bouncing sprite
    if (image_index >= image_number - 1) {
        if (y_vel > 0) {
            sprite_index = spr_bounce;
            image_speed = 1;
            image_index = 2; // Set frame for downward bounce
        } else if (y_vel < 0) {
            sprite_index = spr_bounce;
            image_speed = 1;
            image_index = 0; // Set frame for upward bounce
        } 
        is_done_attacking = false; // Reset check for done attacking 
    }
}

// Handle other animations if not attacking or done attacking
if (!is_done_attacking && sprite_index != spr_attack) {
    if (y_vel > 0) { // Bouncing downwards
        sprite_index = spr_bounce;
        image_speed = 1;
        image_index = min(image_index + 0.01, 2); // Increment frame, but cap it at 2
		//min() compares the values and always gives back the smaller one. therefore, 
		//when img index reaches frame 3, will stop
    } else if (y_vel < 0) { // Bouncing upwards
        sprite_index = spr_bounce;
        image_speed = 1;
        image_index = 0;
    }
}


//cond for how invincibility turns off.
//essentially, when invincibility turns on, timer ticks upwards until 60 frames pass,
//then invincibility is turned off and the timer resets
if(invincible)
{
	invincible_timer++;
	if( invincible_timer > invincible_duration)
	{
		invincible = false;
		invincible_timer = 0;
	}
}

// Reduce attack cooldown over time
if (attack_cooldown > 0) {
    attack_cooldown -= 1;
	is_attacking = false;
}



