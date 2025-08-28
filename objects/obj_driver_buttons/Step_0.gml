if (live_call()) return live_results;

var cam = view_camera[0];
var vx  = camera_get_view_x(cam);
var vy  = camera_get_view_y(cam);
var vw  = camera_get_view_width(cam);
var vh  = camera_get_view_height(cam);

if (button_id == 0) {  // Bottom-left
    x = vx + vw * 0.165;       // 5% from left
    y = vy + vh * 0.88;       // 88% down (near bottom)
}
else if (button_id == 1) {  // Bottom-right
    x = vx + vw * 0.835;       // 5% from right
    y = vy + vh * 0.88;       // 88% down
}

// Multi-touch detection helper
function button_held(_instance_id) {
    // Loop through 5 possible touches
    for (var i = 0; i < 5; i++) {
        if (device_mouse_check_button(i, mb_left)) {
            // Only count touches, ignore mouse simulation
            if (device_mouse_check_touch(i)) {
                var mx = device_mouse_x_to_gui(i);
                var my = device_mouse_y_to_gui(i);
                if (position_meeting(mx, my, _instance_id)) {
                    return true;
                }
            }
        }
    }
    return false;
}

// SHIFT --------------------------------------------------
//var was_pressed = shift_pressed;
//shift_pressed = false;
//obj_car.shift_pressed = false;
//
//// Check multi-touch for this button
//for (var i = 0; i < 5; i++) {
    //if (device_mouse_check_button(i, mb_left)) {
        //var mx = device_mouse_x_to_gui(i);
        //var my = device_mouse_y_to_gui(i);
//
        //if (position_meeting(mx, my, id)) {
            //shift_pressed = true;
            //break;
        //}
    //}
//}
//
//// Detect first frame press
//if (shift_pressed && !was_pressed) {
    //obj_car.shift_pressed = true;
//}

// GAS -------------------------------------------------------
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