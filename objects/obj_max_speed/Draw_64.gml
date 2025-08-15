/// @description Insert description here
// You can write your code in this editor

var car_speed_upgrade_to = global.car_max_speed + global.speed_upgrade_amount

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y, string(global.car_max_speed) + " > " + string(car_speed_upgrade_to));