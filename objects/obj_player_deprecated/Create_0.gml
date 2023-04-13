//#macro handcar_use_distance 44
//#macro time_hungry 30 // seconds
//#macro time_thirst 45 // seconds

phy_fixed_rotation = true;

player_status = {
	fed: 5,
	fed_max: 5,
	hydration: 5,
	hydration_max: 5,
}

player_input_interaction = ord("E");
movement_speed = 2;
is_driving_handcar = false;
resource_to_interact = noone;

move = function()
{
	var left = keyboard_check(ord("A"));
	var right = keyboard_check(ord("D"));
	var up = keyboard_check(ord("W"));
	var down = keyboard_check(ord("S"));

	var horizontal = right - left;
	var vertical = down - up;

	var horizontal_speed = horizontal * movement_speed;
	var vertical_speed = vertical * movement_speed;

	phy_speed_x = horizontal_speed;
	phy_speed_y = vertical_speed;
}

aim = function()
{
	if (!is_driving_handcar)
	{
		if (mouse_x < x) image_xscale = -1;
		else image_xscale = 1;
		
		var target_position_x = phy_position_x + lengthdir_x(10, point_direction(x, y, mouse_x, mouse_y));
		var target_position_y = phy_position_y + lengthdir_y(10, point_direction(x, y, mouse_x, mouse_y));
		
		resource_to_interact = collision_line(phy_position_x, phy_position_y, target_position_x, target_position_y, obj_resource, false, false);
	}
}

check_handcar_distance = function()
{
	if (point_distance(x, y, obj_handcar.x, obj_handcar.y) <= handcar_use_distance)
	{
		if (keyboard_check_pressed(player_input_interaction))
		{
			is_driving_handcar = !is_driving_handcar;
			if (is_driving_handcar) enter_handcar();
			else exit_handcar();
		}
		
		var is_handcar_moving = is_driving_handcar and keyboard_check_pressed(vk_space);
		
		if (is_handcar_moving and obj_hud_energy.has_energy())
		{
			obj_hud_energy.decrease();
			obj_handcar.update_sprite = is_handcar_moving;
			obj_level_controller.is_player_driving_handcar = is_handcar_moving;
		}
	}
}

enter_handcar = function()
{
	phy_active = false;
	
	phy_position_x = obj_handcar.x - 14;
	phy_position_y = obj_handcar.y - 15;
	
	obj_gun_besta.unequip();
}

exit_handcar = function()
{
	phy_position_x = obj_handcar.x - 32;
	
	phy_active = true;
	
	obj_gun_besta.equip();
}

check_light_distance = function()
{
	if (obj_level_controller.is_night)
	{
		var distance_from_light = point_distance(phy_position_x, phy_position_y, obj_lighting_cutout.x, obj_lighting_cutout.y);
		if (distance_from_light > obj_lighting_cutout.sprite_width/2) obj_hud_anxiety.increase();
	}
}

shoot = function()
{
	if (!is_driving_handcar) obj_gun_besta.shoot();
}

interact_with_resource = function()
{
	if (resource_to_interact)
	{
		var resource;
		with(resource_to_interact) resource = interact();
		
		if(resource != resource_type.empty) add_resource_to_pocket(resource);
	}
}

add_resource_to_pocket = function(resource)
{
	var was_stored = obj_hud_pocket.try_store_resource(resource);
	if (!was_stored)
	{
		obj_hud_notification.add_notification("Dropped " + resource_as_string(resource));
	}
}

use_resource = function(resource)
{
	if obj_hud_pocket.is_resource_available(resource)
	{
		switch(resource)
		{
			case resource_type.food:
				obj_hud_fed.increase();
				alarm[0] = room_speed * time_hungry;
				break;
			case resource_type.water:
				alarm[1] = room_speed * time_thirst;
				obj_hud_hydration.increase();
				break;
			case resource_type.medicine:
				break;
		}
		obj_hud_pocket.use_resource(resource);
	}
}

game_over_eaten_by_mist = function()
{
	movement_speed = 0;
	show_debug_message("Eaten by mist!");
}


game_over_starveling = function()
{
}

game_over_thirsty = function()
{
}

game_over_panic = function()
{
}

game_over_contaminated = function()
{
}

game_over_killed = function()
{
}

end_game = function()
{
}

alarm[0] = room_speed * time_hungry;
alarm[1] = room_speed * time_thirst;

obj_gun_besta.equip();