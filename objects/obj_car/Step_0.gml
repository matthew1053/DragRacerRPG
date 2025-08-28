/// @description Insert description here
// You can write your code in this editor

// Calculate a dynamic acceleration based on current speed
//var dynamic_acceleration = car_acceleration_base - (car_speed / car_max_speed) *
//						  (car_acceleration_base - car_max_acceleration);
if (live_call()) return live_results;
if (global.start) {

    // --- ACCELERATION ---
    if (keyboard_check(vk_space) || gas_pressed) {
        var accel = car_acceleration * gear_accel_multipliers[gear - 1];
        car_speed += accel;
    } 
    else {
        // Natural deceleration
        car_speed -= car_friction;
        if (car_speed < 0) car_speed = 0;
    }

    // --- GEAR TOP SPEED ---
    var top_speed_in_gear = car_max_speed / gear_ratios[gear - 1];
    if (car_speed > top_speed_in_gear) car_speed = top_speed_in_gear;

    // --- RPM CALCULATION ---
    current_rpm = 1000 + ((car_speed / top_speed_in_gear) * (max_rpm - 1000));
    current_rpm = clamp(current_rpm, 1000, max_rpm);

    // --- SHIFT READY ---
    shift_ready = (current_rpm >= shift_rpm && gear < max_gear);

    // --- SHIFT LOGIC ---
    if (shift_ready && (keyboard_check_pressed(vk_up) || shift_pressed)) {
        // Increment gear
        gear += 1;
        gear = min(gear, max_gear);

        // Adjust RPM based on gear ratios
        if (gear <= max_gear) {
            var prev_ratio = gear_ratios[gear - 2];
            var new_ratio = gear_ratios[gear - 1];
            current_rpm = current_rpm * (new_ratio / prev_ratio);
        }

        // Optional perfect shift bonus
        if (abs(current_rpm - shift_rpm) <= perfect_shift_window) {
            car_speed += 0.5; // small speed boost
        }
    }

    // --- OPTIONAL BRAKE / REVERSE ---
    if ((keyboard_check(vk_up) || shift_pressed) && car_speed < top_speed_in_gear * 0.95) {
        car_speed -= 0.1;
    }

    // --- MOVE CAR ---
    y -= car_speed;

    // --- DEBUG HUD (if using Draw GUI event) ---
    // Remove these lines from Step if you are using a Draw GUI event
    /*
    draw_set_color(c_white);
    draw_text(20, 20, "Gear: " + string(gear));
    draw_text(20, 40, "Speed: " + string_format(car_speed,2,2));
    draw_text(20, 60, "RPM: " + string_format(current_rpm,0,0));
    */
}