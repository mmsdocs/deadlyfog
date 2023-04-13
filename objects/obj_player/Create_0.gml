#macro handcar_use_distance 44
#macro resource_interaction_distance 15
#macro time_hungry 20 // seconds
#macro time_thirst 25 // seconds
#macro handcar_drive_cooldown 0.065 // seconds

if (is_demo) exit;

player_status = {
	fed: 5,
	fed_max: 5,
	hydration: 5,
	hydration_max: 5,
}

player_input_interaction = ord("E");
movement_speed = 2;
medicine_value = 0.5;
is_driving_handcar = false;
can_drive_handcar = true
resource_to_interact = noone;

move = function()
{
	if (is_driving_handcar) exit;
	
	var left = keyboard_check(ord("A"));
	var right = keyboard_check(ord("D"));
	var up = keyboard_check(ord("W"));
	var down = keyboard_check(ord("S"));

	var horizontal = right - left;
	var vertical = down - up;

	var horizontal_speed = horizontal * movement_speed;
	var vertical_speed = vertical * movement_speed;

	x += horizontal_speed;
	y += vertical_speed;
	
	if (x > room_width) x = xprevious;
	if (y < 0 or y > room_height) y = yprevious;
}

aim = function()
{
	if (!is_driving_handcar)
	{
		if (mouse_x < x) image_xscale = -1;
		else image_xscale = 1;
		
		var target_position_x = x + lengthdir_x(resource_interaction_distance, point_direction(x, y, mouse_x, mouse_y));
		var target_position_y = y + lengthdir_y(resource_interaction_distance, point_direction(x, y, mouse_x, mouse_y));
		
		resource_to_interact = collision_line(x, y, target_position_x, target_position_y, obj_resource, false, false);
		
		if (resource_to_interact) obj_hud_interaction.visible = true;
		else obj_hud_interaction.visible = false;
	}
}

check_handcar_distance = function()
{
	var has_enemies_alive = obj_level_controller.total_enemies_on_screen > 0;	

	if (point_distance(x, y, obj_handcar.x, obj_handcar.y) <= handcar_use_distance)
	{
		if (keyboard_check_pressed(player_input_interaction) and !has_enemies_alive)
		{
			is_driving_handcar = !is_driving_handcar;
			if (is_driving_handcar) enter_handcar();
			else exit_handcar();
		}
		
		if (!is_driving_handcar and !has_enemies_alive) obj_hud_interaction.visible = true;
		
		var is_handcar_moving = is_driving_handcar and keyboard_check(vk_space) and can_drive_handcar;
		
		if (is_handcar_moving and obj_hud_energy.has_energy())
		{
			can_drive_handcar = false;
			obj_hud_energy.decrease();
			obj_handcar.move();
			obj_level_controller.is_player_driving_handcar = is_handcar_moving;
			alarm[2] = room_speed * handcar_drive_cooldown;
		}
	}
	
	if (has_enemies_alive and is_driving_handcar)
	{
		obj_hud_interaction.visible = false;
		is_driving_handcar = false;
		exit_handcar();
	}
}

enter_handcar = function()
{
	var driver_position_x = obj_handcar.x - 14;
	var driver_position_y = obj_handcar.y;
	
	x = driver_position_x;
	y = driver_position_y;
	image_xscale = 1;
	
	obj_handcar.solid = false;
	
	obj_gun_besta.unequip();
}

exit_handcar = function()
{
	x = obj_handcar.x - 32;
	
	obj_handcar.solid = true;
	
	obj_gun_besta.equip();
}

check_light_distance = function()
{
	if (obj_level_controller.is_night)
	{
		var distance_from_light = point_distance(x, y, obj_lighting_cutout.x, obj_lighting_cutout.y);
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
		audio_play_sound(snd_sfx_resource_box, 10, false);
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
				player_status.fed = clamp(player_status.fed + 1, 0, player_status.fed_max);
				obj_hud_fed.increase();
				alarm[0] = room_speed * time_hungry;
				break;
			case resource_type.water:
				player_status.hydration = clamp(player_status.hydration + 1, 0, player_status.hydration_max);
				obj_hud_hydration.increase();
				alarm[1] = room_speed * time_thirst;
				break;
			case resource_type.medicine:
				obj_hud_contamination.decrease(medicine_value);
				break;
		}
		obj_hud_pocket.use_resource(resource);
	}
}

add_contamination = function(value)
{
	obj_hud_contamination.increase(value);
	if (obj_hud_contamination.progress_value == 1) game_over_contaminated();
}

game_over_eaten_by_mist = function()
{
	movement_speed = 0;
	obj_game.current_game_over = game_overs.eaten_by_fog;
	room_goto(rm_menu_game_over);
}


game_over_starveling = function()
{
	obj_game.current_game_over = game_overs.starveling;
	room_goto(rm_menu_game_over);
}

game_over_thirsty = function()
{
	obj_game.current_game_over = game_overs.thirsty;
	room_goto(rm_menu_game_over);
}

game_over_contaminated = function()
{
	obj_game.current_game_over = game_overs.contamination;
	room_goto(rm_menu_game_over);
}

end_game = function()
{
	obj_game.current_game_over = game_overs.winner;
	room_goto(rm_end_game);
}


alarm[0] = room_speed * time_hungry;
alarm[1] = room_speed * time_thirst;

obj_gun_besta.equip();