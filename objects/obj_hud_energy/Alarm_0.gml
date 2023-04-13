/// @description Increase energy over time
progress_value = clamp(progress_value + increase_value, progress_value, progress_value_max);

alarm[0] = room_speed * time_increase_energy;

