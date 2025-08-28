/// @description Insert description here
// You can write your code in this editor

// Calculate a dynamic acceleration based on current speed
//var dynamic_acceleration = car_acceleration_base - (car_speed / car_max_speed) *
//						  (car_acceleration_base - car_max_acceleration);

if (global.start) {
    if (keyboard_check(vk_space) || gas_pressed) {
        var accel = car_acceleration * gear_accel_multipliers[gear - 1];
        car_speed += accel;
        
        if (car_speed > gear_max_speed) car_speed = gear_max_speed;
            
        if ((keyboard_check(vk_up) || shift_pressed) && car_speed < gear_max_speed * 0.95) car_speed -= .1;  
            
        shift_ready = (car_speed > gear_max_speed * 0.95 && gear < max_gear);
        
                // Shift logic
        if (shift_ready && ((keyboard_check_pressed(vk_up)) || shift_pressed)) {
            gear += 1;

            if (gear < max_gear) {
                gear_max_speed = gear_speed_thresholds[gear - 1];
            } else {
                gear_max_speed = car_max_speed;
            }

            // Optional: perfect shift boost or sound
        }
    }
    
    // Optional: natural deceleration
    else {
        car_speed -= car_friction;
        if (car_speed < 0) car_speed = 0;
    }

    y -= car_speed; // move to the right
}