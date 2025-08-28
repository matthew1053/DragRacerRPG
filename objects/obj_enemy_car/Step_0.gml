/// @description Insert description here
if (global.start && !car_finish) {

    if (!shifting) {

        // --- Apply acceleration scaled by gear ---
        var accel = car_acceleration * gear_accel_multipliers[gear - 1];
        car_speed += accel;

        // --- Calculate max speed in this gear using gear ratios ---
        var gear_max_speed = car_max_speed / gear_ratios[gear - 1];
        if (car_speed > gear_max_speed) car_speed = gear_max_speed;

        // --- RPM calculation ---
        var gear_min_speed = gear == 1 ? 0 : car_max_speed / gear_ratios[gear - 2];
        var gear_range = gear_max_speed - gear_min_speed;
        current_rpm = lerp(0, max_rpm, (car_speed - gear_min_speed) / gear_range);
        current_rpm = clamp(current_rpm, 0, max_rpm);

        // --- Shift check ---
        shift_ready = (current_rpm >= ideal_shift_rpm && gear < max_gear);
        if (shift_ready) {
            shifting = true;
            shift_timer = shift_delay;
            car_speed = gear_max_speed; // hold speed during shift
        }

    } else {
        // --- Shifting pause ---
        shift_timer -= 1;
        if (shift_timer <= 0) {
            gear += 1;
            if (gear > max_gear) gear = max_gear;
            shifting = false;
        }
    }

    // --- Move car ---
    y -= car_speed;
}

// --- Car finish deceleration ---
if (car_finish) {
    car_speed -= car_friction;
    if (car_speed < 0) car_speed = 0;
    y -= car_speed;
}