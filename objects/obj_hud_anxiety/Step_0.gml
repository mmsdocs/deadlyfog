var contamination_value = obj_hud_contamination.progress_value/obj_hud_contamination.progress_value_max;
progress_value_max = initial_progress_value_max - contamination_value;
progress_value = min(progress_value, progress_value_max);