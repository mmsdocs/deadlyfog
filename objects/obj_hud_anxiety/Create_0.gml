event_inherited();

#macro time_decrease_anxiety 0.3

increase_value = 0.03;
initial_progress_value_max = progress_value_max;

increase = function()
{
	progress_value = clamp(progress_value + 0.003, progress_value, progress_value_max);
	alarm[0] = room_speed * time_decrease_anxiety;
}