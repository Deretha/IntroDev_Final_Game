
// Inherit the parent event
event_inherited();


//movement for if you hit L/R keys, you'll go at speed of accelartion
	if(keyboard_check(vk_left)){
		facing = -1; //left
		x_vel -= accel;
	}
	if(keyboard_check(vk_right)){
		facing = 1; //right
		x_vel += accel;
	}
	
		
if(facing == -1) //left
{
	image_xscale = -1;  
}
else if (facing == 1) //right;
{
	image_xscale = 1;
}