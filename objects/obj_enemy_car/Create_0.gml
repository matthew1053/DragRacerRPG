car_speed = 0;
car_max_speed = 11.5;
car_acceleration = 0.05;
car_finish = false;

// Gear shifting logic ----------------------------------------------------
gear = 1;
max_gear = 5; // increased to 5 gears

// Gear ratios and acceleration multipliers
gear_ratios = [3.0, 2.1, 1.5, 1.2, 1.0];
gear_accel_multipliers = [1.0, 0.8, 0.6, 0.45, 0.3];

shift_ready = false;
current_rpm = 0;
max_rpm = 8000;
ideal_shift_rpm = 7500;

// Optional: simulate shift delay
shift_delay = 80;
shifting = false;
shift_timer = 0;
// ------------------------------------------------------------------------

start_y = y;
start_x = x;
car_friction = 0.05;

obj_enemy_car.image_index = global.enemy_selection_list[global.tournament_race - 1];
