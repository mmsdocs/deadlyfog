/// @description Update day hour
current_day_hour += 1;

if (current_day_hour == 18)
{
	obj_level_controller.is_night = true;
	alarm[3] = (room_speed * night_duration) / 12;
	alarm[0] = 1;
}
else alarm[2] = (room_speed * day_duration) / 12;

obj_hud_day_hour.set_hour(current_day_hour);

var quantity = irandom_range(2, 3);
procedural_spawn_enemies(quantity);