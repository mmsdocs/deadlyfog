event_inherited();

set_hour = function(hour)
{
	value = string_replace(value_mask, "hh", string(hour));
	value = string_replace(value, "mm","00");
}