event_inherited();

health_points = 0;
contamination = 0.001;
speed_far_player = 1;
player_direction = 0;
player_distance = 0;
is_sprite_following_player = true;

damage = function()
{
	health_points = clamp(health_points - 1, 0, health_points);
	if (health_points == 0)
	{
		bleed();
		instance_destroy();
	}
}

bleed = function()
{
	var radius = sprite_width/2;
	var counter = 0, repeat(10)
	{
		var position_x = random_range(x - radius, x + radius);
		var position_y = random_range(y - radius, y + radius);
		
		var scale = random_range(0.05, 0.25);
		
		var instance = instance_create_layer(
			position_x, position_y, "GroundContamination", 
			obj_enemy_filthgoo_liquid,{
				image_xscale: scale, image_yscale: scale,
			}
		);
		
		var splash_lifetime = 7;
		instance.alarm[0] = room_speed * (splash_lifetime - (counter * 0.1));
		counter++;
	}
}