/// @description Player Processes
if (is_demo) exit;

audio_listener_orientation(0, 0, 1, lengthdir_x(1, direction), lengthdir_y(1, direction), 0);

move();
aim();

check_handcar_distance();
check_light_distance();

if (mouse_check_button_pressed(mb_left)) shoot();

if (keyboard_check_pressed(player_input_interaction)) interact_with_resource();
if (keyboard_check_pressed(ord("1"))) use_resource(resource_type.food);
if (keyboard_check_pressed(ord("2"))) use_resource(resource_type.water);
if (keyboard_check_pressed(ord("3"))) use_resource(resource_type.medicine);