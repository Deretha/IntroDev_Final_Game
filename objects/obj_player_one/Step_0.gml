
// Inherit the parent event
event_inherited();

//movement for if you hit A/D keys, you'll go at speed of accelartion
	if(keyboard_check(ord(left_key))){
		facing = -1 //left
		x_vel -= accel;
	}
	if(keyboard_check(ord(right_key))){
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

