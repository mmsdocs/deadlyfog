event_inherited();

#macro time_increase_energy 0.5

initial_progress_value_max = progress_value_max;
increase_value = 0.03;

decrease = function()
{
	progress_value = clamp(progress_value - 0.005, 0, progress_value_max);
	alarm[0] = room_speed * time_increase_energy;
}

has_energy = function()
{
	return progress_value > 0;
}