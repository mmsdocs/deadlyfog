// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro resource_region_size_x 256

function procedural_spawn_resources(current_x, current_y, resource){
	var region = [
		{initial_x: 0, end_x: 256, initial_y: 0, end_y: 280},
		{initial_x: 0, end_x: 256, initial_y: 440, end_y: 720}
	]
	
	randomize();
	// choose if will be spawned
	var chance = choose(0, 1);
	if (chance == 0) {
		var current_region = 0, repeat(array_length(region))
		{
			// Choose resources quantity
			var resources_quantity = choose(0, 3);
			repeat(resources_quantity)
			{
				var region_data = region[current_region];
				var current_initial_x = region_data.initial_x + current_x;
				var current_end_x = current_initial_x + region_data.end_x;
				var current_initial_y = region_data.initial_y + current_y;
				var current_end_y = current_initial_y + region_data.end_y;
				
				// Choose random position on current region
				var position_x = random_range(current_initial_x, current_end_x);
				var position_y = random_range(current_initial_y, current_end_y);
				
				instance_create_layer(position_x, position_y, "Resources", resource);
			}
			current_region++;
		}
	}
}

function procedural_spawn_enemies(quantity)
{
	// inimigos vem de y - sprite_height < 0 and Y > room_height + sprite_height
	// a cada hora vem uma onda de inimigos
	// pela manhã as ondas são com poucos inimigos e apenas flies e filthgoos
	// pela noite é adicionado um novo inimigo
	// Na primeira noite é adicionado o Centipideo
	// Na segunda noite é adicionado o Bomber
	// Na terceira noite é adicionado o Gobspit
	repeat(quantity)
	{
		var enemy;
		var enemies = [obj_enemy_fly, obj_enemy_filthgoo, obj_enemy_centipideo, obj_enemy_bomber, obj_enemy_gobspit];
		var position_x = random(room_width);
		var position_y = choose(0, room_height);
	
		if (!obj_level_controller.is_night) enemy = irandom(1);
		else
		{
			switch(obj_level_controller.day)
			{
				case 1:
					enemy = irandom(2);
					break;
				case 2:
					enemy = irandom(3);
					break;
				case 3:
					enemy = irandom(4);
					break;
			}
		}
	
		var instance = instance_create_layer(position_x, position_y, "Enemies", enemies[enemy]);
	
		if (position_y <= 0) instance.y -= instance.sprite_height;
		if (position_y >= room_height) instance.y += instance.sprite_height;
		
		obj_level_controller.total_enemies_on_screen++;
	}
}