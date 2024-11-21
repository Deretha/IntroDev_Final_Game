
//counts num of frames since last cloud was made
frames_since_cloud = 0;

//max frames we want to wait to make a new cloud
frames_bt_cloud = 360;

//max num of clouds that can be on screen at once
max_clouds = 6;

//cloud 0 = 255, 415
//cloud 1 = 0, 320
//cloud 2 = 543, 320
//cloud 3 = 95, 160;
//cloud 4 = 448, 160;
//cloud 5 = 255, 0
cloud_locations = [
	[255, 415],
	[0, 320],
	[543, 320],
	[95, 160],
	[448, 160],
	[255, 0],
]

cloud_x_spawning_locations = [255,0,543,95,448,255];
cloud_y_spawning_locations = [415,320,320,160,160,0];