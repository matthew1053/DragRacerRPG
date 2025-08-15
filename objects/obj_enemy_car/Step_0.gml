/// @description Insert description here
// You can write your code in this editor
if (global.start && !car_finish) {
    if (!shifting) {
        // Apply gear-scaled acceleration
        var accel = car_acceleration * gear_accel_multipliers[gear - 1];
        car_speed += accel;
        if (car_speed > gear_max_speed) car_speed = gear_max_speed;

        // Auto-shift check
        if (car_speed > gear_max_speed * 0.95 && gear < max_gear) {
            car_speed = gear_max_speed; // hold at gear limit
            shifting = true;
            shift_timer = shift_delay;
        }
    } else {
        // Shifting pause
        shift_timer -= 1;
        if (shift_timer <= 0) {
            gear += 1;
            if (gear < max_gear) {
                gear_max_speed = gear_speed_thresholds[gear - 1];
            } else {
                gear_max_speed = car_max_speed; // final gear cap
            }
            shifting = false;
        }
    }

    y -= car_speed;
}

if (car_finish) {
	car_speed -= car_friction;
    if (car_speed < 0) car_speed = 0;
	
	y -= car_speed; // move to the right
}