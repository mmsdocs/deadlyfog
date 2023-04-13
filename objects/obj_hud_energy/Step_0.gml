var anxiety_value = obj_hud_anxiety.progress_value/obj_hud_anxiety.progress_value_max;
var contamination_value = obj_hud_contamination.progress_value/obj_hud_contamination.progress_value_max;
progress_value_max = initial_progress_value_max - (contamination_value + anxiety_value);
progress_value = min(progress_value, progress_value_max);

if (progress_value < progress_value_max and alarm[0] <= 0) alarm[0] = room_speed * time_increase_energy;