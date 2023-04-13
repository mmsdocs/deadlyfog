event_inherited();

increase = function(value)
{
	progress_value = clamp(progress_value + value, progress_value, progress_value_max);
}

decrease = function(value)
{
	progress_value = clamp(progress_value - value, 0, progress_value);
}
