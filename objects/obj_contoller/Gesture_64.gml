/// @description Insert description here
// You can write your code in this editor
if global.finish && !global.tournament_finish{
    global.race_queued = true;
    //layer_set_visible("RaceFinished", false);
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

    global.tournament_race += 1;

    //if global.tournament_finish {
        //global.tournament_race = 1;
        //global.tournament_finish = false;
    //}
} else {
    global.ready = true;
}