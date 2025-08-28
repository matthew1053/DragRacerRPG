if (live_call()) return live_results;
var scale_factor = 2.75;

// Draw the button sprite
draw_sprite_ext(sprite_index, image_index, x, y, scale_factor, scale_factor, 0, c_white, 1);

// Draw the button label
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_aqua);
draw_set_font(fnt_hud);
draw_set_alpha(0.25);



var label = "";
if (button_id == 0) label = "Shift";
else if (button_id == 1) label = "Gas";

//draw_set_font(fnt_ui);
//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);
//draw_text_ext(x, y, label, scale_factor, 1); // scale = 1
draw_text(x, y, label);

//TODO: scale text
//draw_set_font(fnt_default);
//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);
//draw_text_ext(x, y, label, 1.5, 1); // scale = 1.5