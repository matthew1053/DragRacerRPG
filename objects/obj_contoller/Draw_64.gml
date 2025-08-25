/// @description Insert description here

if !layer_get_visible("LayerMainMenu") && !layer_get_visible("LayerUpgradeMenu") && !layer_get_visible("LayerTournamentMenu") {
    // TODO: potentially move this out into it's own object
// Draw new speedometer ----------------------------------------------------------------
    
    // --- SPEEDOMETER ---
    // Outer circle
    draw_set_color(c_black);
    draw_circle(speedometer_x, speedometer_y, speedometer_radius + 5, false);
    draw_set_color(c_white);
    draw_circle(speedometer_x, speedometer_y, speedometer_radius, true);
    
    max_speed_display = ceil(obj_car.car_max_speed * global.mph_multiplier / 20) * 20;
    max_speed_display += 20;
    
    var increment = 20;
    for (var spd = 0; spd <= max_speed_display; spd += increment) {
        var pct = spd / max_speed_display;
        var angle = lerp(start_angle, end_angle, pct);
    
        var tick_x = speedometer_x + lengthdir_x(speedometer_radius * 0.85, angle);
        var tick_y = speedometer_y + lengthdir_y(speedometer_radius * 0.85, angle);
    
        var text_x = speedometer_x + lengthdir_x(speedometer_radius * 0.65, angle);
        var text_y = speedometer_y + lengthdir_y(speedometer_radius * 0.65, angle);
    
        draw_set_color(c_white);
        draw_line(
            tick_x, tick_y,
            speedometer_x + lengthdir_x(speedometer_radius * 0.95, angle),
            speedometer_y + lengthdir_y(speedometer_radius * 0.95, angle)
        );
    
        draw_set_font(fnt_speedometer);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(text_x, text_y, string(spd));
    }
    
    // Center circle
    draw_set_color(c_black);
    draw_circle(speedometer_x, speedometer_y, 5, false);
    
    var gear_text;
    if (obj_car.gear >= obj_car.max_gear) {
        gear_text = "MAX";
    } else {
        gear_text = string(obj_car.gear);
    }
    
    // --- Draw Gear Above MPH ---
    if (obj_car.gear > 0) {
        draw_set_font(fnt_speedometer);
        draw_set_color(c_yellow); // stands out
        draw_text(speedometer_x, speedometer_y + speedometer_radius * 0.5, gear_text);
    } else {
        // Neutral or starting case
        draw_text(speedometer_x, speedometer_y + speedometer_radius * 0.5, "N");
    }
    
    // Digital speed
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(speedometer_x, speedometer_y + 75, string(round(displayed_speed * global.mph_multiplier)) + " MPH");
    
    
    // --- TACHOMETER ARC (replaces shifting bar) ---
    var tach_radius = speedometer_radius - 50;
    var segments = 40;
    var angle_range = end_angle - start_angle;
    
    // Draw background arc
    draw_set_color(c_gray);
    var last_x = speedometer_x + lengthdir_x(tach_radius, start_angle);
    var last_y = speedometer_y + lengthdir_y(tach_radius, start_angle);
    for (var i = 1; i <= segments; i++) {
        var t = i / segments;
        var ang = start_angle + angle_range * t;
        var x2 = speedometer_x + lengthdir_x(tach_radius, ang);
        var y2 = speedometer_y + lengthdir_y(tach_radius, ang);
        draw_line_width(last_x, last_y, x2, y2, 6);
        last_x = x2;
        last_y = y2;
    }
    
    // Filled RPM arc
    var tach_color;
    var max_gear = array_length(obj_car.gear_percent_thresholds) + 1;
    
    // SHIFT text
    if (obj_car.shift_ready && obj_car.gear < max_gear) {
        // Create a pulsating effect (0..1 range)
        var pulse = (sin(current_time / 200) + 1) * 0.5; // oscillates between 0 and 1
        // Blend between dark red and bright red
        tach_color = make_color_hsv(0, 255, lerp(100, 255, pulse));
    } else {
        tach_color = c_aqua;
    }
    
    draw_set_color(tach_color);
    last_x = speedometer_x + lengthdir_x(tach_radius, start_angle);
    last_y = speedometer_y + lengthdir_y(tach_radius, start_angle);
    for (var i = 1; i <= segments * clamp(current_rpm / ideal_shift_rpm, 0, 1); i++) {
        var t = i / segments;
        var ang = start_angle + angle_range * t;
        var x2 = speedometer_x + lengthdir_x(tach_radius, ang);
        var y2 = speedometer_y + lengthdir_y(tach_radius, ang);
        draw_line_width(last_x, last_y, x2, y2, 8);
        last_x = x2;
        last_y = y2;
    }
    
    // Adding shift zone
    // Fraction of tach for shift zone
    var shift_zone_pct = 0.05; // last 5% of gear
    var shift_zone_start = 1 - shift_zone_pct; // start of highlight relative to gear progress
    
    draw_set_color(c_red); // highlight color
    last_x = speedometer_x + lengthdir_x(tach_radius, start_angle + angle_range * shift_zone_start);
    last_y = speedometer_y + lengthdir_y(tach_radius, start_angle + angle_range * shift_zone_start);
    
    // number of segments for the highlight
    var highlight_segments = ceil(segments * shift_zone_pct);
    
    for (var i = 1; i <= highlight_segments; i++) {
        var t = shift_zone_start + (i / segments); 
        var ang = start_angle + angle_range * t;
        var x2 = speedometer_x + lengthdir_x(tach_radius, ang);
        var y2 = speedometer_y + lengthdir_y(tach_radius, ang);
        draw_line_width(last_x, last_y, x2, y2, 8);
        last_x = x2;
        last_y = y2;
    }
    
    
    // Speed needle
    var speed_percentage = displayed_speed * global.mph_multiplier / max_speed_display;
    var needle_angle = start_angle + ((end_angle - start_angle) * speed_percentage);
    
    // Add jitter if active
    needle_angle += needle_jitter;
    
    var needle_x = speedometer_x + lengthdir_x(needle_length, needle_angle);
    var needle_y = speedometer_y + lengthdir_y(needle_length, needle_angle);
    
    draw_set_color(c_red);
    draw_line_width(speedometer_x, speedometer_y, needle_x, needle_y, 3);
// -------------------------------------------------------------------------------------
}