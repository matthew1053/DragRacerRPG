/// @description Insert description here
// You can write your code in this editor
var was_pressed = pressed;
pressed = false;
obj_car.shift_pressed = false;

// Check multi-touch for this button
for (var i = 0; i < 5; i++) {
    if (device_mouse_check_button(i, mb_left)) {
        var mx = device_mouse_x_to_gui(i);
        var my = device_mouse_y_to_gui(i);

        if (position_meeting(mx, my, id)) {
            pressed = true;
            break;
        }
    }
}

// Detect first frame press
if (pressed && !was_pressed) {
    obj_car.shift_pressed = true;
}