increment_weight = 0.3;
new_position = 0;
is_player_driving_handcar = false;

current_world_position_x = 0;
current_local_position_x = x;

update_position = function()
{
	x = current_local_position_x + current_world_position_x;
}