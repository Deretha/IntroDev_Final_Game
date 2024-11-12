

cloud_timer ++; 

//starts the animation
if(image_speed == 0 && image_index == 0 )
{
	image_speed = 1;
}

//when it hits the last image frame, it ends the animation and stays on last frame
if(image_index >= image_number -1)
{
	image_speed = 0;
	image_index = image_number - 1;
}

//after 2-4 secs, transform into a small cloud
if(cloud_timer >= random_range(120,240) && image_index == image_number -1)
{
	instance_change(obj_med_cloud,true);
}

