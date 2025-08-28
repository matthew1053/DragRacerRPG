/// @description Insert description here
if (live_call()) return live_results;
    
// You can write your code in this editor
// disable race button until tournament is selected
if button_id == 0 {
    if !global.tournament_selected { 
        image_alpha = 0.25;
    } else if mouse_hover {
        image_alpha = 0.25;
    } else {
        image_alpha = 1;
    }
}


// disable tournament button once a tournament is selected
if button_id == 1 {
    if global.tournament_start {
        image_alpha = 0.25;
    } else if mouse_hover {
        image_alpha = 0.25;
    } else {
        image_alpha = 1;
    }
}

//// disable menu HUD after winning a race
if button_id == 6 {
    //menu_button_pressed = false; // reset every frame
    //if mouse_hover || (global.ready && !global.tournament_finish) {
        //image_alpha = 0.25;
    //} else {
        //image_alpha = 1;
    //}

    
    //if global.finish && !global.tournament_finish || (global.ready && !global.tournament_finish)  { 
        //image_alpha = 0.25;
    //} else {
        //image_alpha = 1;
        //for (var i = 0; i < 5; i++) {
            //if (device_mouse_check_button(i, mb_left)) {
                //var mx = device_mouse_x_to_gui(i);
                //var my = device_mouse_y_to_gui(i);
        //
                //// Is this finger still on the button?
                //if (position_meeting(mx, my, id)) {
                    ////menu_button_pressed = true;
                    //layer_set_visible("LayerMainMenu", true);
                    //layer_set_visible("LayerUpgradeMenu", false);
                    //layer_set_visible("HUD", false);
                    //
                    //if global.finish {global.finish = false};
                        //
                    ////layer_set_visible("RaceFinished", false);
                    //break; // no need to check other fingers
                //}
            //}
        //}
     //}
    
    // Check if button is disabled (finish or ready states)
    var is_disabled = (global.finish && !global.tournament_finish) || (global.ready && !global.tournament_finish);
    
    if (is_disabled) {
        image_alpha = 0.25; // button dimmed
    } else {
        image_alpha = 1; // fully visible
    
        // Hover detection
        var hover = false;
        for (var i = 0; i < 5; i++) {
            if (device_mouse_check_button(i, mb_left)) {
                var mx = device_mouse_x_to_gui(i);
                var my = device_mouse_y_to_gui(i);
    
                if (position_meeting(mx, my, id)) {
                    // Handle click action
                    layer_set_visible("LayerMainMenu", true);
                    layer_set_visible("LayerUpgradeMenu", false);
                    layer_set_visible("HUD", false);
    
                    if (global.finish) {
                        global.finish = false;
                    }
                    break;
                }
            } else {
                // Check for hover even without pressing
                var mx = device_mouse_x_to_gui(i);
                var my = device_mouse_y_to_gui(i);
    
                if (position_meeting(mx, my, id)) {
                    hover = true;
                }
            }
        }
    
        // Change alpha or color when hovered
        if (hover) {
            image_alpha = 0.7; // slightly dim to indicate hover
        }
    }
}