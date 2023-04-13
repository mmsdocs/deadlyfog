event_inherited();

can_splash = false;

splash = function()
{
	var radius = obj_player.sprite_width;
	var counter = 0, repeat(20)
	{
		var position_x = random_range(x - radius, x + radius);
		var position_y = random_range(y - radius, y + radius);
		
		var scale = random_range(0.01, 0.3);
		
		var instance = instance_create_layer(
			position_x, position_y, "GroundContamination", 
			obj_enemy_gobspit_liquid,{
				image_xscale: scale, image_yscale: scale,
			}
		);
		
		var splash_lifetime = 10;
		instance.alarm[0] = room_speed * (splash_lifetime - (counter * 0.1));
		counter++;
	}
}