/// @description Insert description here
// You can write your code in this editor

// Car variables
global.car_max_speed = 12;
global.car_acceleration = 0.05;

// --- Gear Setup ---
global.max_gear = 5;

// Gear ratios for 5 gears (higher = more torque, lower = more top speed)
global.gear_ratios = [3.0, 2.1, 1.5, 1.2, 1.0];

// Acceleration multipliers for each gear
global.gear_accel_multipliers = [1.0, 0.8, 0.6, 0.45, 0.3];

// --- RPM System ---
global.max_rpm = 8000;          // redline
global.shift_rpm = 7500;        // upshift trigger
global.perfect_shift_window = 500; // optional small bonus for perfect timing

// Upgrades
global.speed_upgrade_cost = 100;
global.speed_upgrade_amount = 0.2;
global.acceleration_upgrade_cost = 150;
global.acceleration_upgrade_amount = 0.001;

// Player
global.player_money = 0;
global.car_selection = 0; // this variable holds the array index of the selected user car

// Speed multiplier for display purposes
global.mph_multiplier = 8.5
global.mphs_multiplier = 160;


flash_timer = 0;
flash_interval = 30;
flash_visible = true;

live_init();