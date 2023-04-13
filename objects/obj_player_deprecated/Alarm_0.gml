/// @description Fed
player_status.fed = clamp(player_status.fed - 1, 0, player_status.fed_max);
obj_hud_fed.decrease();

alarm[0] = room_speed * time_hungry;