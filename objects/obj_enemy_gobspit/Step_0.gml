event_inherited();

mp_potential_step(obj_player.x, obj_player.y, speed * player_distance, false);

if (player_distance <= distance_spit_player and !is_spitting)
{
	is_spitting = true;
	spit();
	alarm[0] = room_speed * spit_cooldown;
}