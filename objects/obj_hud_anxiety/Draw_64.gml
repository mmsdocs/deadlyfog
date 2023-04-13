new_current_top = obj_hud_contamination.current_bottom * -1;
var bottom_position = sprite_get_height(progress_bar) * min(progress_value/progress_value_max, progress_value_max);
new_current_bottom = bottom_position - new_current_top;
event_inherited();