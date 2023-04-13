event_inherited();

mp_potential_step(obj_player.x, obj_player.y, speed, false);

if (player_distance <= distance_attack_player)
{
	if (sprite_index == spr_enemy_centipideo_attacking)
	{
		if (!audio_is_playing(snd_sfx_centipideo_attacking))
		{
			audio_play_sound(snd_sfx_centipideo_attacking, 12, false);
		}
	}
	speed = speed_close_player;
}
else
{
	if (sprite_index != spr_enemy_centipideo) sprite_index = spr_enemy_centipideo;
	speed = speed_far_player;
}