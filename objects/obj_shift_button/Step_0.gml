/// @description Insert description here
// You can write your code in this editor
if (live_call()) return live_results;

var cam = view_camera[0];
var vx  = camera_get_view_x(cam);
var vy  = camera_get_view_y(cam);
var vw  = camera_get_view_width(cam);
var vh  = camera_get_view_height(cam);


x = vx + vw * 0.165;       // 5% from left
y = vy + vh * 0.88;       // 88% down (near bottom)



var was_pressed = pressed;
pressed = false;
obj_car.shift_pressed = false;

// Check multi-touch for this button
for (var i = 0; i < 5; i++) {
    if (device_mouse_check_button(i, mb_left)) {
        var mx = device_mouse_x(i); // room coordinates
        var my = device_mouse_y(i);

        // Check if finger is inside button bounding box
        if (mx > x - sprite_width/2 && mx < x + sprite_width/2 &&
            my > y - sprite_height/2 && my < y + sprite_height/2) {
            pressed = true;
            break; // no need to check other touches
        }
    }
}

// Detect first-frame press
if (pressed && !was_pressed) {
    obj_car.shift_pressed = true;
}