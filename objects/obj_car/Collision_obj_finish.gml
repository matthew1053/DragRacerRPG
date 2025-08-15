/// @description Insert description here
// You can write your code in this editor

//show_debug_message("obj_enemy_car.car_finish: " + string(obj_enemy_car.car_finish));
if !global.finish {
    global.finish = true;
    global.race_queued = false;
    if obj_enemy_car.car_finish {
        obj_car.winner = false;
        global.tournament_finish = true;
        if global.tournament_race == 3 { // Third Place
            global.player_money += global.prize_money[2];
        }
        if global.tournament_race == 4 { // Second Place
            global.player_money += global.prize_money[1];
        }
    } else {
        obj_car.winner = true;
        if global.tournament_race == 4 {
            global.player_money += global.prize_money[0]; // First Place
            global.tournament_finish = true;
            //global.tournament_selection = 0;
        }
    }
    layer_set_visible("RaceFinished", true);
}
