
//check how many clouds there are
var num_energy_drinks = instance_number(obj_energy_drink);
//count up the number of frames
frames_since_energy_drink += 1;
//spawn_timer +=1;

//IF we've waited the max number of frames OR
//if we have less than 4 clouds
if (frames_since_energy_drink > frames_bt_energy_drink || num_energy_drinks < 2) {
	//IF we do not have the max num of cloud
	if(num_energy_drinks < max_energy_drinks) {
	
		//create a new cloud at a random position
		var new_energy_drink = instance_create_layer(random_range(15, room_width - 30), 
		random_range(100, room_height - 400), "Drinks",obj_energy_drink)
		
		//spawn_timer = 0;
		//the with structure allows us to change the scope
		//of the following variables to whatever is in the paraenthesis
		//in this case, the scope is of the newly created cloud
		with(new_energy_drink) {
			//count how many times we tried to change the clouds position
			var tries = 0;
			//while we've tried less than 3000 times
			//and a cloud is inside our collider
			while(tries < 12000 && collision_rectangle(x-12, y-12, x+12, y+12, obj_energy_drink, 
				false, true) != noone) {
					//set the new clouds's position to a new random position
					//and count up the num of times we've tried to get
					//a new position
					x = random_range(15, room_width - 30);
					y = random_range(25, room_height - 100);
					tries +=1;
			}
		}
	}
	//since we just made a new cloud
	//reset the counter
	frames_since_energy_drink = 0;
}

