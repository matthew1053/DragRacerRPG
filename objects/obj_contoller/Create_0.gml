/// @description Insert description here
// You can write your code in this editor
global.start = false;
global.finish = false;
global.ready = false; // Used to determine if the race is ready to start
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
global.enemy_selection_list = [0];
global.enemy_count = 4;


global.gas_pressed = false;
global.shift_pressed = false;


layer_set_visible("LayerMainMenu", true);
layer_set_visible("LayerUpgradeMenu", false);
layer_set_visible("HUD", false);
//layer_set_visible("RaceFinished", false);
layer_set_visible("LayerTournamentMenu", false);


// New speedometer variables ----------------------------------------
//current_speed = 0;          // Current speed in MPH or KPH
max_speed_display = 200;    // Maximum speed shown on gauge
speed_smoothing = 0.1;      // How smooth speed changes are
displayed_speed = 0;        // Smoothed speed for display
needle_jitter = 0;

// Visual elements (viewport-aware positioning)
// Get viewport dimensions instead of room dimensions
var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);

speedometer_x = view_w - 115;
speedometer_y = view_h - 375;
speedometer_radius = 100;
needle_length = 60;

// Angle calculations (270 degrees total range)
start_angle = 225;  // Bottom left
end_angle = -45;    // Bottom right

// Tachometer ---
max_rpm = 8000;
ideal_shift_rpm = 6500;
current_rpm = 0;
//--------------------------------------------------------------------
