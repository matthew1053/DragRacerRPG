if (live_call()) return live_results;
/// @description Insert description here
//var view_w = camera_get_view_width(view_camera[0]);
//var view_h = camera_get_view_height(view_camera[0]);
//speedometer_x = view_w - 120;
//speedometer_y = view_h - 365;
if !layer_get_visible("LayerMainMenu") && !layer_get_visible("LayerUpgradeMenu") && !layer_get_visible("LayerTournamentMenu") {

    // --- Draw outer speedometer circle ---
    draw_set_color(c_black);
    draw_circle(speedometer_x, speedometer_y, speedometer_radius + 5, false);
    draw_set_color(c_white);
    draw_circle(speedometer_x, speedometer_y, speedometer_radius, true);

    // --- Draw speed ticks ---
    var max_speed_display = ceil(obj_car.car_max_speed * global.mph_multiplier / 20) * 20 + 20;
    var increment = 20;
    for (var spd = 0; spd <= max_speed_display; spd += increment) {
        var pct = spd / max_speed_display;
        var angle = lerp(start_angle, end_angle, pct);

        var tick_x = speedometer_x + lengthdir_x(speedometer_radius * 0.85, angle);
        var tick_y = speedometer_y + lengthdir_y(speedometer_radius * 0.85, angle);

        var text_x = speedometer_x + lengthdir_x(speedometer_radius * 0.65, angle);
        var text_y = speedometer_y + lengthdir_y(speedometer_radius * 0.65, angle);

        draw_set_color(c_white);
        draw_line(tick_x, tick_y,
                  speedometer_x + lengthdir_x(speedometer_radius * 0.95, angle),
                  speedometer_y + lengthdir_y(speedometer_radius * 0.95, angle));

        draw_set_font(fnt_speedometer);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(text_x, text_y, string(spd));
    }

    // --- Gear display ---
    var gear_text = obj_car.gear >= obj_car.max_gear ? "MAX" : string(obj_car.gear);
    draw_set_font(fnt_speedometer);
    draw_set_color(c_yellow);
    draw_text(speedometer_x, speedometer_y + speedometer_radius * 0.5, gear_text);

    // --- Digital speed ---
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(speedometer_x, speedometer_y + 75, string(round(displayed_speed * global.mph_multiplier)) + " MPH");

    // --- TACHOMETER ARC ---
    var tach_radius = speedometer_radius - 50;
    var segments = 40;
    var angle_range = end_angle - start_angle;

    // --- Filled RPM arc ---
    // Determine color: red in shift zone, cyan otherwise
    var shift_zone_start_rpm = ideal_shift_rpm;
    var shift_zone_end_rpm = max_rpm;
    
    // Background arc
    draw_set_color(c_gray);
    var last_x = speedometer_x + lengthdir_x(tach_radius, start_angle);
    var last_y = speedometer_y + lengthdir_y(tach_radius, start_angle);
    for (var i = 1; i <= segments; i++) {
        var t = i / segments;
        var ang = start_angle + angle_range * t;
    
        // Determine the RPM at this segment
        var segment_rpm = lerp(0, max_rpm, t);
    
        // Choose color based on shift zone
        if (segment_rpm >= shift_zone_start_rpm) {
            draw_set_color(c_red);
        } else {
            draw_set_color(c_gray);
        }
    
        var x2 = speedometer_x + lengthdir_x(tach_radius, ang);
        var y2 = speedometer_y + lengthdir_y(tach_radius, ang);
    
        draw_line_width(last_x, last_y, x2, y2, 6);
    
        last_x = x2;
        last_y = y2;
    }

    var tach_color = current_rpm >= shift_zone_start_rpm && obj_car.gear < obj_car.max_gear ? c_red : c_aqua;
    draw_set_color(tach_color);

    last_x = speedometer_x + lengthdir_x(tach_radius, start_angle);
    last_y = speedometer_y + lengthdir_y(tach_radius, start_angle);
    var rpm_pct = clamp((current_rpm - 1000) / (max_rpm - 1000), 0, 1);
    for (var i = 1; i <= ceil(segments * rpm_pct); i++) {
        var t = i / segments;
        var ang = start_angle + angle_range * t;
        var x2 = speedometer_x + lengthdir_x(tach_radius, ang);
        var y2 = speedometer_y + lengthdir_y(tach_radius, ang);
        draw_line_width(last_x, last_y, x2, y2, 8);
        last_x = x2; last_y = y2;
    }

    // --- Needle jiggle ---
    var speed_percentage = displayed_speed * global.mph_multiplier / max_speed_display;
    var needle_angle = start_angle + ((end_angle - start_angle) * speed_percentage);

    // Jiggle when shift ready or near max speed
    if ((obj_car.shift_ready && obj_car.gear < obj_car.max_gear) || displayed_speed >= obj_car.car_max_speed * 0.95) {
        needle_angle += irandom_range(-2, 2); // 2 degrees jitter
    }

    var needle_x = speedometer_x + lengthdir_x(needle_length, needle_angle);
    var needle_y = speedometer_y + lengthdir_y(needle_length, needle_angle);
    draw_set_color(c_red);
    draw_line_width(speedometer_x, speedometer_y, needle_x, needle_y, 3);
}


