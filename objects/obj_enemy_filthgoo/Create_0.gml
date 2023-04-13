event_inherited();

speed = 2;

health_points = 5;
new_direction_cooldown = 3;
emission_interval = 0.05;
is_inside_screen = false;
is_sprite_following_player = false;

check_direction_mirror = function()
{
	if (direction >= 90 and direction < 270) image_xscale = -1;
	else image_xscale = 1;
}

choose_new_direction = function()
{
	direction = irandom(359);
	check_direction_mirror();
}

emit_trail = function()
{
	var radius = sprite_width/5;
	var counter = 0, repeat(10)
	{
		var position_x = random_range(x - radius, x + radius);
		var position_dy = y - 13;
		var position_y = random_range(position_dy - radius, position_dy + radius);
		
		var scale = random_range(0.01, 0.3);
		
		var instance = instance_create_layer(
			position_x, position_y, "GroundContamination", 
			obj_enemy_filthgoo_liquid,{
				image_xscale: scale, image_yscale: scale,
			}
		);
		
		var splash_lifetime = 10;
		instance.alarm[0] = room_speed * (splash_lifetime - (counter * 0.1));
		counter++;
	}
}

alarm[0] = room_speed * new_direction_cooldown;
alarm[1] = room_speed * emission_interval;

distance_to_player_listen = sprite_width + obj_player.sprite_width + 350;
emitter = audio_emitter_create();
sound = audio_play_sound_on(emitter, snd_sfx_filthgoo, true, 12);