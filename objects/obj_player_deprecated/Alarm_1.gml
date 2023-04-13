/// @description Hydration
player_status.hydration = clamp(player_status.hydration - 1, 0, player_status.hydration_max);

obj_hud_hydration.decrease();

alarm[1] = room_speed * time_thirst;