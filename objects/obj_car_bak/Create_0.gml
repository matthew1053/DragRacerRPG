/// @description Insert description here
// You can write your code in this editor
car_speed = 0;

car_max_speed = global.car_max_speed; // global.car_max_speed = 12
car_acceleration = global.car_acceleration; // global.car_acceleration = 0.05

// Shifting variables -----------------------------------
gear = 1;
max_gear = 4;
gear_speed_increment = car_max_speed / max_gear;
//gear_max_speed = gear_speed_increment;
shift_ready = false;
gear_percent_thresholds = [0.28, 0.55, 0.8]; // Gear 2, 3, 4 trigger points

gear_speed_thresholds = [];
for (var i = 0; i < array_length(gear_percent_thresholds); i++) {
    gear_speed_thresholds[i] = gear_percent_thresholds[i] * car_max_speed;
}

// Set initial gear cap
gear_max_speed = gear_speed_thresholds[0];

gear_accel_multipliers = [1.0, 0.6, 0.4, 0.2]; // One for each gear


//-------------------------------------------------------

gas_pressed = false;
shift_pressed = false;

start_y = y;
start_x = x;

car_acceleration_base = 0.1;
car_max_acceleration = 0.2;

car_friction = 0.05;

winner = false;

obj_car.image_index = global.car_selection;