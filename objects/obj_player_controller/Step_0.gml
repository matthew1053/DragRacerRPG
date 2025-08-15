/// @description Insert description here
// You can write your code in this editor

// Upgrade Menu
var money_id = layer_text_get_id("LayerUpgradeMenu", "MoneyText");
var speed_id = layer_text_get_id("LayerUpgradeMenu", "SpeedUpgradeCost");
var accel_cost_id = layer_text_get_id("LayerUpgradeMenu", "AccelUpgradeCost");
var max_speed_id = layer_text_get_id("LayerUpgradeMenu", "SpeedLevel");
var accel_id = layer_text_get_id("LayerUpgradeMenu", "AccelLevel");
var max_speed_increase_id = layer_text_get_id("LayerUpgradeMenu", "SpeedIncreaseAmount");
var accel_increase_id = layer_text_get_id("LayerUpgradeMenu", "AccelUpgradeAmount");

var players_money = "$" + string(global.player_money);
var speed_money = "$" + string(global.speed_upgrade_cost);
var accel_money = "$" + string(global.acceleration_upgrade_cost);
var max_speed = string(global.car_max_speed * global.mph_multiplier) + " mph";
var accel = string(global.car_acceleration * global.mphs_multiplier) + " mph/s";
var max_speed_increase = "+" + string(global.speed_upgrade_amount * global.mph_multiplier) + " mph";
var accel_increase = "+" + string(global.acceleration_upgrade_amount * global.mphs_multiplier) + " mph/s";

layer_text_text(money_id, players_money);
layer_text_text(speed_id, speed_money);
layer_text_text(accel_cost_id, accel_money);
layer_text_text(max_speed_id, max_speed);
layer_text_text(accel_id, accel);
layer_text_text(max_speed_increase_id, max_speed_increase);
layer_text_text(accel_increase_id, accel_increase);


// HUD
var money_hud_id = layer_text_get_id("HUD", "PlayerMoney");

var money_hud = "$" + string(global.player_money);

layer_text_text(money_hud_id, money_hud);

// Race Finished HUD
var finished_id = layer_text_get_id("RaceFinished", "FinishedText");
var finished_next_race_id = layer_text_get_id("RaceFinished", "NextRaceText");

var finished = "";
var finished_next_race = "";

// Tournament Menu
var tournament_type_id = layer_text_get_id("LayerTournamentMenu", "RaceTypeText");
var first_place_id = layer_text_get_id("LayerTournamentMenu", "FirstPlaceText");
var second_place_id = layer_text_get_id("LayerTournamentMenu", "SecondPlaceText");
var third_place_id = layer_text_get_id("LayerTournamentMenu", "ThirdPlaceText");

var tournament_type = "";
var first_place = "";
var second_place = "";
var third_place = "";

switch (global.tournament_selection) {
	case 1: // Amateur
        tournament_type = string(global.tournament_type[0]);
        first_place = "1st: $" + string(global.prize_money[0] * global.prize_money_multiplier[0]);
        second_place = "2nd: $" + string(global.prize_money[1] * global.prize_money_multiplier[0]);
        third_place = "3rd: $" + string(global.prize_money[2] * global.prize_money_multiplier[0]);
        break;
    case 2: // Semi-Pro
        tournament_type = string(global.tournament_type[1]);
        first_place = "1st: $" + string(global.prize_money[0] * global.prize_money_multiplier[1]);
        second_place = "2nd: $" + string(global.prize_money[1] * global.prize_money_multiplier[1]);
        third_place = "3rd: $" + string(global.prize_money[2] * global.prize_money_multiplier[1]);
        break;
    case 3: // Pro
        tournament_type = string(global.tournament_type[2])
        first_place = "1st: $" + string(global.prize_money[0] * global.prize_money_multiplier[2]);
        second_place = "2nd: $" + string(global.prize_money[1] * global.prize_money_multiplier[2]);
        third_place = "3rd: $" + string(global.prize_money[2] * global.prize_money_multiplier[2]);
        break;
}

layer_text_text(tournament_type_id, tournament_type);
layer_text_text(first_place_id, first_place);
layer_text_text(second_place_id, second_place);
layer_text_text(third_place_id, third_place);


//var my_panel = layer_get_flexpanel_node("RaceFinished");
//var child_1 = flexpanel_node_get_child(my_panel, "DisplayPanel");
//var next_text = flexpanel_node_get_child(child_1, "NextText");

if global.finish {
    global.tournament_selected = false;
    global.tournament_start = false;
    
    if obj_car.winner {
        if global.tournament_finish {
            finished = "First Place!";
            finished_next_race = "You won $" + string(global.prize_money[0]);
            //global.tournament_start = false;
            //flexpanel_node_style_set_margin(next_text, flexpanel_edge.top, 0);
        } else {
            finished = "Winner!";
            finished_next_race = "Tap anywhere to start next race";
            //flexpanel_node_style_set_margin(next_text, flexpanel_edge.top, 40);
        }
    } else {
        //global.tournament_start = false;
        switch (global.tournament_race) {
            case 1:
                finished = "Last Place";
                finished_next_race = "You won nothing. Try again.";
                break;
            case 2:
                finished = "4th Place";
                finished_next_race = "You won nothing. Try again.";
                break;
            case 3:
                finished = "3rd Place";
                finished_next_race = "You won $" + string(global.prize_money[2]);
                break;
            case 4:
                finished = "2nd Place";
                finished_next_race = "You won $" + string(global.prize_money[1]);
                break;
        }
        //flexpanel_node_style_set_margin(next_text, flexpanel_edge.top, 0);
    }
}

layer_text_text(finished_id, finished);
layer_text_text(finished_next_race_id, finished_next_race);

//flexpanel_node_
//flexpanel_node_style_set_margin(_node, flexpanel_edge.top, 0);

//flash_timer += 1;
//if (flash_timer >= flash_interval) {
    //flash_timer = 0;
    //flash_visible = !flash_visible;
//}
//
//if flash_visible {
    //
//} else {
    //layer_text_text(finished_next_race_id, "");
//}

// Make it flash on the screen maybe
