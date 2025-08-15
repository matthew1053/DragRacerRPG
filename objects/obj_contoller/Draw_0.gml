
// You can write your code in this editor
// Get the camera's position and size
var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);
var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);

// Center point of the camera view
var center_x = view_x + (view_w / 2);
var center_y = view_y + (view_h / 2);


// Draw transparent box

// Transparent black box in top quarter of the screen
// Get camera view info
var cam = view_camera[0];
var vx = camera_get_view_x(cam);
var vy = camera_get_view_y(cam);
var vw = camera_get_view_width(cam);
var vh = camera_get_view_height(cam);

// Define box size
var box_h = vh * 0.25; // 25% of view height

// Center vertically, full width
var x1 = vx;
var x2 = vx + vw;
var y1 = vy + (vh - box_h) / 2;
var y2 = y1 + box_h;


// This global.countdown is to remove the box after start
if global.start {
    if global.count < 0 {
        global.remove_box = true;
    }
    global.count -= 1;
}

// Draw transparent box
if !global.remove_box {
    draw_set_alpha(0.75);
    draw_set_color(c_black);
    draw_rectangle(x1, y1, x2, y2, false); // filled rectangle
    draw_set_alpha(1); // Reset alpha
}
//---------------------------------------------------


// Set text settings
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_white);

// Draw global.countdown timer and before race text
if !global.ready {
    draw_set_font(fnt_ready);
    draw_text(center_x, center_y, "Tap anywhere\n to start race")
} else if global.countdown_timer >= -30 {

    draw_set_font(fnt_countdown);
    // draw_set_font(fnt_global.countdown); // optional custom font

    // Draw the text
    draw_text(center_x, center_y, global.countdown_text);
}

// Drawing Upper Left HUD
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_hud);
draw_set_color(c_black);

// Draw Race Number
draw_text(view_x + 10, view_y + 5, "Race " + string(global.tournament_race));

// Draw time
var fps_speed = game_get_speed(gamespeed_fps);
var seconds = global.race_time div fps_speed;
var milliseconds = (global.race_time mod fps_speed) * (1000 div fps_speed);

var ms_string = string(milliseconds);
if (milliseconds < 10) ms_string = "00" + ms_string;
else if (milliseconds < 100) ms_string = "0" + ms_string;
    
    
var time_string = string_format(seconds, 2, 0) + ":" + string_format(ms_string, 3, 0);


draw_text(view_x + 10, view_y + 50, time_string);

// -------------------------------------------------------------------------------------

// Draw speed
var mph = obj_car.car_speed * global.mph_multiplier;
var mph_display = string_format(mph, 1, 0); // Whole number mph

draw_text(view_x + 10, view_y + 90, mph_display);
//--------------------------------------------------------------------------------------

// Draw Gear
draw_text(view_x + 10, view_y + 130, string(obj_car.gear));

// Draw Tournament Type
if global.tournament_selection > 0 {
    draw_text(view_x + 10, view_y + 250, global.tournament_type[global.tournament_selection-1]);
}
//--------------------------------------------------------------------------------------
