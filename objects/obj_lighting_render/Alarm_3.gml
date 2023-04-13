/// @description Update night hour
current_day_hour += 1;

if (current_day_hour == 24) current_day_hour = 0;

if (current_day_hour == 6) 
{
	obj_level_controller.next_day();
	obj_level_controller.is_night = false;
	alarm[2] = (room_speed * day_duration) / 12;
	alarm[1] = 1;
}
else alarm[3] = (room_speed * night_duration) / 12;

obj_hud_day_hour.set_hour(current_day_hour);

var quantity = irandom_range(3, 6);
procedural_spawn_enemies(quantity);