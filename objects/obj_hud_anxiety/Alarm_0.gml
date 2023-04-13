/// @description Decrease anxiety
progress_value = clamp(progress_value - increase_value, 0, progress_value_max);

alarm[0] = room_speed * time_decrease_anxiety;