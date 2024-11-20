//starts animation
if(image_speed == 0 && image_index == 0 )
{
	image_speed = 1;
}

//after animation played once, ends it and leaves it on last image 
if(image_index >= image_number -1)
{
	image_speed = 0;
	image_index = image_number - 1;
}
