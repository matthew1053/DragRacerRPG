/// @description Insert description here
// You can write your code in this editor
switch button_id {
    case 0: // Max speed upgrade button

        
    if global.player_money >= global.speed_upgrade_cost {
    
        global.player_money -= global.speed_upgrade_cost;
        global.car_max_speed += global.speed_upgrade_amount;
        
    }
        
        break;
    
    case 1: // Acceleration upgrade button
            
    if global.player_money >= global.acceleration_upgrade_cost {
    
        global.player_money -= global.acceleration_upgrade_cost;
        global.car_acceleration += global.acceleration_upgrade_amount;
        
    }
        break;
}