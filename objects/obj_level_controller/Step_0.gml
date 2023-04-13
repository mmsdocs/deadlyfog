if (is_player_driving_handcar)
{
	new_layer_position_x += world_scroll_moving_speed;
	current_layer_spawn_distance += world_scroll_moving_speed;
	mist.x += -3;
	is_player_driving_handcar = false;
	if (instance_exists(obj_walkers)) obj_walkers.is_player_driving_handcar = true;
}

var new_position = lerp(layer_get_x(layer_trail_id), new_layer_position_x, 0.3);
layer_x(layer_trail_id, new_position);
layer_x(layer_ground_id, new_position);
layer_x(layer_nature_id, new_position);

if (abs(current_layer_spawn_distance) >= resource_region_size_x)
{
	procedural_spawn_resources(current_spawn_resources_position_x, 0, obj_resource_box);
	current_layer_spawn_distance = 0;
}