/// @description Insert description here
// You can write your code in this editor
global.start = false;
global.finish = false;
global.ready = false;
global.race_queued = false;
global.race_time = 0;

global.tournament_start = false;
global.tournament_finish = false;
global.tournament_race = 1;

global.countdown_timer = 180;
global.countdown_text = "";

// used to remove box
global.remove_box = false;
global.count = 30;

global.prize_money = [300, 200, 100] // [1st place, 2nd place, 3rd place]
global.prize_money_multiplier = [1, 2, 3];
global.tournament_type = ["Amateur", "Semi-Pro", "Pro"]
global.tournament_selection = 1;
global.tournament_selected = false;

// Racer multiplier
global.enemy_speed_base = 11.5;
global.enemy_accel_base = 0.05;
global.enemy_speed_scale = [0.00, 0.02, 0.04, 0.06];
global.enemy_accel_scale = [0.00, 0.01, 0.02, 0.03];
global.enemy_level_scale = [1, 2, 3];
global.enemy_max_speed = 0;
global.enemy_accel = 0;

global.gas_pressed = false;
global.shift_pressed = false;


layer_set_visible("LayerMainMenu", true);
layer_set_visible("LayerUpgradeMenu", false);
layer_set_visible("HUD", false);
layer_set_visible("RaceFinished", false);
layer_set_visible("LayerTournamentMenu", false);
