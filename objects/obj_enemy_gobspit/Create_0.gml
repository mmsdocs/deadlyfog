event_inherited();

health_points = 2;
speed = 0.009;
distance_spit_player = 200;

is_spitting = false;

spit_cooldown = 0.5;

spit = function()
{
	audio_play_sound(snd_sfx_spit, 11, false);
	var position_x, position_y = y - 89;
	if (image_xscale = -1) position_x = x - 21;
	else position_x = x + 21;
	
	var player_direction = point_direction(position_x, position_y, obj_player.x, obj_player.y);
	
	var instance = instance_create_layer(
		position_x, position_y, "Enemies", 
		obj_enemy_gobspit_liquid, {
			direction: player_direction, speed: 10,
			image_xscale: 0.15, image_yscale: 0.15
		}
	);
	instance.depth = depth - 1;
	instance.can_splash = true;
}