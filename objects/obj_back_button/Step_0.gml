/// @description Insert description here
// You can write your code in this editor
// else if mouse_hover {
    //image_alpha = 0.5;
//} else {
    //image_alpha = 1;
//}
var was_pressed = pressed;
pressed = false;

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

// Update visual state using image_alpha
if global.tournament_selection == 1 {
    image_alpha = 0.5;
} else if (pressed) {
    image_alpha = 0.5;
} else {
    image_alpha = 1;
}