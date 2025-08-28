/// @description Insert description here
// --- Car Speed and Acceleration ---
car_speed = 0;
car_max_speed = global.car_max_speed;      // e.g., 12
car_acceleration = global.car_acceleration; // e.g., 0.05

// --- Gear Setup ---
gear = 1; 
max_gear = global.max_gear; // 5

// Gear ratios for 5 gears (higher = more torque, lower = more top speed)
gear_ratios = global.gear_ratios; // [3.0, 2.1, 1.5, 1.2, 1.0]; 

// Acceleration multipliers for each gear
gear_accel_multipliers = global.gear_accel_multipliers;// [1.0, 0.8, 0.6, 0.45, 0.3];

// --- RPM System ---
current_rpm = 1000;      // idle
max_rpm = global.max_rpm; // 8000;          // redline
shift_rpm = global.shift_rpm; //7500;        // upshift trigger
perfect_shift_window = global.perfect_shift_window; //500; // optional small bonus for perfect timing

// --- Physics / state flags ---
gas_pressed = false;
shift_pressed = false;
shift_ready = false;
car_friction = 0.05;

start_y = y;
start_x = x;

obj_car.image_index = global.car_selection;

live_results = undefined;