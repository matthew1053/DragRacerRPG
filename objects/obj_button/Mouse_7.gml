/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
switch button_id
{
	case 0: // Race Button
		//room_goto(rm_race_track);
        if global.tournament_selected { 
            layer_set_visible("LayerMainMenu", false);
            layer_set_visible("LayerUpgradeMenu", false);
            layer_set_visible("LayerTournamentMenu", false);
            layer_set_visible("HUD", true);
            
            global.race_queued = true;
        
            var start_x = obj_car.start_x;
            var start_y = obj_car.start_y;
            instance_destroy(obj_car);
            instance_create_layer(start_x, start_y, "Instances", obj_car);
        
            start_x = obj_enemy_car.start_x;
            start_y = obj_enemy_car.start_y;
            instance_destroy(obj_enemy_car);
            instance_create_layer(start_x, start_y, "Instances", obj_enemy_car);
        
            global.race_time = 0;
            global.start = false;
            global.finish = false;
        
            global.countdown_timer = 180;
            global.countdown_text = "";
            
            // used to remove box
            global.remove_box = false;
            global.count = 30;
        
            global.ready = false;
        
            if !global.race_queued {
                global.tournament_race += 1;
            }
            
            if global.tournament_race == 1 {
                global.tournament_start = true;
            }
        
            if global.tournament_finish {
                global.tournament_race = 1;
                global.tournament_finish = false;
            }
        }
    
		break;
    case 1: // Tournament Button
        
        if !global.tournament_start {
            layer_set_visible("LayerMainMenu", false);
            layer_set_visible("LayerUpgradeMenu", false);
            layer_set_visible("HUD", false);
            layer_set_visible("LayerTournamentMenu", true);
        
            // Default to first option
            //global.tournament_selection = 1;
        }
        break;
	case 2: // Upgrade Button
	   // room_goto(rm_upgrade);
        layer_set_visible("LayerMainMenu", false);
        layer_set_visible("LayerUpgradeMenu", true);
        layer_set_visible("HUD", false);
        layer_set_visible("RaceFinished", false);
	    break;
	
	case 3: // Quit
		game_end();
	break;
    
    case 4: // Tournament Selection
        layer_set_visible("LayerMainMenu", true);
        layer_set_visible("LayerUpgradeMenu", false);
        layer_set_visible("HUD", false);
        layer_set_visible("LayerTournamentMenu", false);
        global.tournament_selected = true;
        break;
    case 5: // Back Button
        layer_set_visible("LayerMainMenu", true);
        layer_set_visible("LayerUpgradeMenu", false);
        layer_set_visible("HUD", false);
        break;
    case 6: // Menu Button on HUD
        layer_set_visible("LayerMainMenu", true);
        layer_set_visible("LayerUpgradeMenu", false);
        layer_set_visible("HUD", false);
        
    
        if global.finish {global.finish = false};
            
        layer_set_visible("RaceFinished", false);
        
        break;
}
