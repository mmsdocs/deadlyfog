event_inherited();

health_points = 1;
fire_cooldown = 0.2;
distance_to_shoot = sprite_width + 100;

shoot = function()
{
	audio_play_sound(snd_sfx_fly_shooting, 12, false);
	instance_create_layer(x, y, "Enemies", obj_enemy_fly_spike, 
		{direction: player_direction, image_angle: player_direction}
	);
}

alarm[0] = room_speed * fire_cooldown;

distance_to_player_listen = sprite_width + obj_player.sprite_width + 1200;
emitter = audio_emitter_create();
sound = audio_play_sound_on(emitter, snd_sfx_fly_walking, true, 12);