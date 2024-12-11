
// //finds avg of p1 and p2 location
var focus_x = (obj_player_one.x + obj_player_two.x) / 2;
var focus_y = (obj_player_one.y + obj_player_two.y) / 2;

////handle smooth camera movement
x = lerp(x, focus_x, 0.1);
y = lerp(y, focus_y, 0.1);

// Determine required zoom based on distance between players
var distance_x = abs(obj_player_one.x - obj_player_two.x);
var distance_y = abs(obj_player_one.y - obj_player_two.y);

// Base dimensions of camera
var base_width = 640;
var base_height = 400;

// Adjust scale to fit both players within view
var scale_x = distance_x / base_width;
var scale_y = distance_y / base_height;

// Adds buffer and maintain aspect ratio
var scale = max(scale_x, scale_y, 1) * 1.3; // 30% buffer
var cam_width = base_width * scale;
var cam_height = base_height * scale;

// Sets camera view size and position
var cam = view_camera[0];
camera_set_view_size(cam, cam_width, cam_height);
camera_set_view_pos(cam, x - cam_width / 2, y - cam_height / 2);



////finds avg of p1 and p2 location
//focus_x = (x + other_player.x) /2;
//focus_y = (y + other_player.y) /2;
////handle smooth camera movement
//targetx = focus_x - (camera_get_view_width(view_camera[0]) / 2); //where we want the camera to be centered on the player
//targety = focus_y - (camera_get_view_height(view_camera[0]) / 2);
//currentx = camera_get_view_x(view_camera[0]); //current camera position
//currenty = camera_get_view_y(view_camera[0]);
////blend between the current and target camera positions for smooth movement
//new_x = targetx * 0.1 + currentx * 0.9;
//new_y = targety * 0.1 + currenty * 0.9;

//// Clamp x position so the camera doesn't go out of bounds on the x-axis
//new_x = clamp(new_x, 0, room_width - camera_get_view_width(view_camera[0]));
//// Set the final camera position
//camera_set_view_pos(view_camera[0], new_x, new_y);
