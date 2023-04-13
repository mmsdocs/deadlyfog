/// @description Attack with Spit
spit();

if (player_distance > distance_spit_player)
{
	is_spitting = false;
	exit;
}
alarm[0] = room_speed * spit_cooldown;