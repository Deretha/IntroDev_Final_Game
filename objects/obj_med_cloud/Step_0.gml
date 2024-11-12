cloud_timer +=1;

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

//after 2-4  secs from being transformed from t -> s -> m cloud, it now transforms into large cloud
if(cloud_timer >= random_range(120,240) && image_index == image_number -1)
{
	instance_change(obj_large_cloud,true);
}