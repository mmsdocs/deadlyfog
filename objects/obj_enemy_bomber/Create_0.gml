event_inherited();

speed = 0.6;

health_points = 1;
distance_explode_player = obj_player.sprite_height;

explode = function()
{
	audio_play_sound(snd_sfx_bomber_explode, 12, false);
	speed = 0;
	var radius = sprite_width * 3;
	var counter = 0, repeat(40)
	{
		var position_x = random_range(x - radius, x + radius);
		var position_y = random_range(y - radius, y + radius);
		
		var scale = random_range(0.5, 0.7);
		
		var instance = instance_create_layer(
			position_x, position_y, "GroundContamination", 
			obj_enemy_filthgoo_liquid,{
				image_xscale: scale, image_yscale: scale,
			}
		);
		
		var splash_lifetime = 15;
		instance.alarm[0] = room_speed * (splash_lifetime - (counter * 0.1));
		counter++;
	}

	instance_destroy();
}

distance_to_player_listen = sprite_width + obj_player.sprite_width + 600;
emitter = audio_emitter_create();
sound = audio_play_sound_on(emitter, snd_sfx_bomber_walking, true, 12);