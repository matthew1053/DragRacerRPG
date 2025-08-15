/// @description Insert description here
// You can write your code in this editor
if (global.countdown_timer >= -30 && global.ready) {
	
	
	if (global.countdown_timer == 180) {
		global.countdown_text = "3"
	} else if (global.countdown_timer == 120) {
		global.countdown_text = "2"
	} else if (global.countdown_timer == 60) {
		global.countdown_text = "1"
	} else if (global.countdown_timer == 0) {
		global.countdown_text = "GO"
		global.start = true;
	}
	
	global.countdown_timer -= 1;
}

//if (obj_car.car_speed * 2.5 == 60) global.finish = true;

//if global.start && !global.finish {
if global.start && !global.finish {
	global.race_time += 1;
}


// TODO: Turn these switch statements into a for loop?
switch (global.tournament_selection) {
    case 1:
        global.enemy_max_speed = global.enemy_speed_base * global.enemy_level_scale[0];
        global.enemy_accel = global.enemy_accel_base * global.enemy_level_scale[0];
            
        break;
    case 2:
        global.enemy_max_speed = global.enemy_speed_base * global.enemy_level_scale[1];
        global.enemy_accel = global.enemy_accel_base * global.enemy_level_scale[1];
        break;
    case 3:
        global.enemy_max_speed = global.enemy_speed_base * global.enemy_level_scale[2];
        global.enemy_accel = global.enemy_accel_base * global.enemy_level_scale[2];
        break;
}

switch (global.tournament_race) {
	case 1: // First race
        obj_enemy_car.car_max_speed = global.enemy_max_speed * (1 + global.enemy_speed_scale[0]);
        obj_enemy_car.car_acceleration = global.enemy_accel * (1 + global.enemy_accel_scale[0]);
        break;
    case 2: // Second race
        obj_enemy_car.car_max_speed = global.enemy_max_speed * (1 + global.enemy_speed_scale[1]);
        obj_enemy_car.car_acceleration = global.enemy_accel * (1 + global.enemy_accel_scale[1]);
        break;
    case 3: // Third race
        obj_enemy_car.car_max_speed = global.enemy_max_speed * (1 + global.enemy_speed_scale[2]);
        obj_enemy_car.car_acceleration = global.enemy_accel * (1 + global.enemy_accel_scale[2]);
        break;
    case 4: // Fourth race
        obj_enemy_car.car_max_speed = global.enemy_max_speed * (1 + global.enemy_speed_scale[3]);
        obj_enemy_car.car_acceleration = global.enemy_accel * (1 + global.enemy_accel_scale[3]);
        break;
}