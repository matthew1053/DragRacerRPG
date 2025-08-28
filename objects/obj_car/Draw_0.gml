if (live_call()) return live_results;

draw_self();
//var cam = view_camera[0];
//var vx = camera_get_view_x(cam);
//var vy = camera_get_view_y(cam);
//
//draw_set_color(c_white);
//draw_text(vx + 100, vy + 140, "Gear: " + string(gear));
//draw_text(vx + 100, vy + 180, "Speed: " + string_format(car_speed*global.mph_multiplier,2,2));
//draw_text(vx + 100, vy + 220, "RPM: " + string_format(current_rpm,0,0));