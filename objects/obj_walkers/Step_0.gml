if (is_player_driving_handcar)
{
	new_position += world_scroll_moving_speed;
	is_player_driving_handcar = false;
}

current_world_position_x = lerp(current_world_position_x, new_position, increment_weight);