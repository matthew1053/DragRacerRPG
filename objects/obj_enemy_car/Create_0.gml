/// @description Insert description here
car_speed = 0;
car_max_speed = 11.5;
car_acceleration = 0.05;
car_finish = false;

// Gear shifting logic ----------------------------------------------------
gear = 1;
max_gear = 4;

gear_percent_thresholds = [0.28, 0.55, 0.8];
gear_speed_thresholds = [];

for (var i = 0; i < array_length(gear_percent_thresholds); i++) {
    gear_speed_thresholds[i] = gear_percent_thresholds[i] * car_max_speed;
}

gear_max_speed = gear_speed_thresholds[0];

gear_accel_multipliers = [1.0, 0.6, 0.4, 0.2]; // scaled per gear

shift_delay = 60;
shifting = false;
shift_timer = 0;
// -----------------------------------------------------------------------

start_y = y;
start_x = x;

car_friction = 0.05;

//TODO: Figure out how to not have this reset every time I pause the game
//obj_enemy_car.image_index = irandom(sprite_get_number(obj_enemy_car.sprite_index) - 1);