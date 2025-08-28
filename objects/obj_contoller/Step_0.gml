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



// Smooth displayed speed
displayed_speed = lerp(displayed_speed, obj_car.car_speed, speed_smoothing);

// Current gear index
var g = obj_car.gear - 1;

// Top and bottom speed for this gear
var gear_min_speed = 0;
if (obj_car.gear > 1) gear_min_speed = obj_car.car_max_speed / obj_car.gear_ratios[g - 1];
var gear_max_speed = obj_car.car_max_speed / obj_car.gear_ratios[g];

// Gear progress (0..1)
var gear_progress = clamp((displayed_speed - gear_min_speed) / (gear_max_speed - gear_min_speed), 0, 1);

// Map to RPM
current_rpm = 1000 + gear_progress * (obj_car.max_rpm - 1000);
current_rpm = clamp(current_rpm, 1000, obj_car.max_rpm);

// Shift ready flag
obj_car.shift_ready = (current_rpm >= obj_car.shift_rpm && obj_car.gear < obj_car.max_gear);
//------------------------------------------------------------------------