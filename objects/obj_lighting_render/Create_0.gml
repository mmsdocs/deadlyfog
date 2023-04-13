#macro day_duration 3 * 60 // 3 minutes
#macro night_duration 5 * 60 // 5 minutes
#macro night_alpha 0.65

lighting_surface = -1;
alpha_transition = 0;
color = c_black;
current_day_hour = 6;

alarm[2] = (room_speed * day_duration) / 12;