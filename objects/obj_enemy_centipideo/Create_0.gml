event_inherited();

health_points = 3;
speed_far_player = 1.2;
speed_close_player = 0.3;
distance_attack_player = sprite_width + 5;
attack_cooldown = 0.1;

attack = function()
{
	obj_player.add_contamination(0.007);
	sprite_index = spr_enemy_centipideo_attacking;
}

alarm[0] = room_speed * attack_cooldown;