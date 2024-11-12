//this just show how it works for pushing
var fake_var = 0;
var name = "REEEEEEEEE";


dustparts = part_system_create();
part_system_depth(dustparts,30); //particles on top

dust = part_type_create(); 
part_type_shape(dust,pt_shape_square);
part_type_size(dust,0.05,0.1,0,0);
part_type_speed(dust,1,1.2,0.01,0);
part_type_direction(dust,180,360,0,0);
part_type_life(dust,15,25); //duration of how long parts will be (frames)
part_type_color1(dust,#FFFFEA);



squish_timer = 0;
squish_speed = 0.05;
y_curve = animcurve_get_channel(anm_stretch,"y_scale");
x_curve = animcurve_get_channel(anm_stretch,"x_scale");

starparts = part_system_create();
part_system_depth(starparts, 30);

star = part_type_create();
part_type_shape(star,pt_shape_star);
part_type_size(star,0.1,0.5,0,0);
part_type_speed(star,1,1.2,0.01,0);
part_type_direction(star,0,360,0,0);
part_type_life(star,15,25); //duration of how long parts will be (frames)
part_type_color1(star,#00CECB);