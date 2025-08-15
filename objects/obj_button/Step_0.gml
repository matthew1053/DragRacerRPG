/// @description Insert description here
// You can write your code in this editor

// disable race button until tournament is selected
if button_id == 0 {
    if !global.tournament_selected { 
        image_alpha = 0.5;
    } else if mouse_hover {
        image_alpha = 0.5;
    } else {
        image_alpha = 1;
    }
}

// disable tournament button once a tournament is selected
if button_id == 1 {
    if global.tournament_start {
        image_alpha = 0.5;
    } else if mouse_hover {
        image_alpha = 0.5;
    } else {
        image_alpha = 1;
    }
}

// Menu button on HUD
if button_id == 6 {
    //menu_button_pressed = false; // reset every frame
    for (var i = 0; i < 5; i++) {
        if (device_mouse_check_button(i, mb_left)) {
            var mx = device_mouse_x_to_gui(i);
            var my = device_mouse_y_to_gui(i);
    
            // Is this finger still on the button?
            if (position_meeting(mx, my, id)) {
                //menu_button_pressed = true;
                layer_set_visible("LayerMainMenu", true);
                layer_set_visible("LayerUpgradeMenu", false);
                layer_set_visible("HUD", false);
                
                if global.finish {global.finish = false};
                    
                layer_set_visible("RaceFinished", false);
                break; // no need to check other fingers
            }
        }
    }
}

//if menu_button_pressed {
    //show_debug_message("TEST");
    //layer_set_visible("LayerMainMenu", true);
        //layer_set_visible("LayerUpgradeMenu", false);
        //layer_set_visible("HUD", false);
        //layer_set_visible("LayerTournamentMenu", false);
        //global.tournament_selected = true;
//}