/// @description Insert description here
// You can write your code in this editor
if (live_call()) return live_results;
    
var cam = view_camera[0];
var vx  = camera_get_view_x(cam);
var vy  = camera_get_view_y(cam);
var vw  = camera_get_view_width(cam);
var vh  = camera_get_view_height(cam);

x = vx + vw * 0.835;       // 5% from right
y = vy + vh * 0.88;       // 88% down

obj_car.gas_pressed = false; // reset every frame

for (var i = 0; i < 5; i++) {
    if (device_mouse_check_button(i, mb_left)) { // touch detected
        var mx = device_mouse_x(i); // room coordinates
        var my = device_mouse_y(i);

        // Check bounding box of the button
        if (mx > x - sprite_width/2 && mx < x + sprite_width/2 &&
            my > y - sprite_height/2 && my < y + sprite_height/2) {
            obj_car.gas_pressed = true;
            break; // no need to check other touches
        }
    }
}