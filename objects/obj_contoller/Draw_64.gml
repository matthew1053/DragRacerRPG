/// @description Insert description here

if !layer_get_visible("LayerMainMenu") && !layer_get_visible("LayerUpgradeMenu") && !layer_get_visible("LayerTournamentMenu") {
    // Draw Shifting -----------------------------------------------------------------------
    // Position and size
    var bar_x = 10;
    var bar_y = 220;
    var bar_width = 150;
    var bar_height = 16;
    
    // Fill level based on current gear range
    var min_speed = (obj_car.gear - 1) * obj_car.gear_speed_increment;
    var max_speed = obj_car.gear_max_speed;
    var range = max_speed - min_speed;
    
    var fill_pct = clamp((obj_car.car_speed - min_speed) / range, 0, 1);
    var fill_width = fill_pct * bar_width;
    
    // Bar outline
    draw_set_color(c_white);
    draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);
    
    // Filled section
    if (fill_pct >= 0.95) {
        draw_set_color(c_red); // warning color
    } else if (fill_pct >= 0.7) {
        draw_set_color(c_yellow); // caution
    } else {
        draw_set_color(c_lime); // safe
    }
    
    draw_rectangle(bar_x, bar_y, bar_x + fill_width, bar_y + bar_height, false);
    
    if (obj_car.shift_ready) {
        var shake_x = irandom_range(-2, 2);
        var shake_y = irandom_range(-2, 2);
    
        draw_set_color(c_red);
        //draw_set_font(font_shift); // optional custom font
        draw_text(bar_x + shake_x, bar_y - 50 + shake_y, "SHIFT!");
        //draw_text(bar_x, bar_y - 50, "SHIFT");
    } else {
            // Optional label
        draw_set_color(c_black);
        draw_text(bar_x, bar_y - 50, "SHIFT");
    }
    

    // -------------------------------------------------------------------------------------
}  