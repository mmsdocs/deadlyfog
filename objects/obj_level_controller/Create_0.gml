#macro world_scroll_moving_speed -12

day = 1;

is_player_driving_handcar = false;
is_night = false;

layer_trail_id = layer_get_id("Rails");
layer_ground_id = layer_get_id("Ground");
layer_nature_id = layer_get_id("Nature");

mist = obj_mist;

new_layer_position_x = 0;
current_spawn_resources_position_x = 0;
current_layer_spawn_distance = 0;

total_enemies_on_screen = 0;

next_day = function()
{
	day++;
	obj_hud_current_day.set_day(day);
	if (day == 4) obj_player.end_game();
}

repeat(6)
{
	procedural_spawn_resources(current_spawn_resources_position_x, 0, obj_resource_box);
	current_spawn_resources_position_x += resource_region_size_x;
}