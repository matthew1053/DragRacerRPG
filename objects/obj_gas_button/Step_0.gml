/// @description Insert description here
// You can write your code in this editor
obj_car.gas_pressed = false; // reset every frame

for (var i = 0; i < 5; i++) {
    if (device_mouse_check_button(i, mb_left)) {
        var mx = device_mouse_x_to_gui(i);
        var my = device_mouse_y_to_gui(i);

        // Is this finger still on the button?
        if (position_meeting(mx, my, id)) {
            obj_car.gas_pressed = true;
            break; // no need to check other fingers
        }
    }
}