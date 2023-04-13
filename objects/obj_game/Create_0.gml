enum game_overs {
	eaten_by_fog,
	starveling,
	thirsty,
	contamination,
	winner,
}

current_game_over = -1;
current_room_scene = rm_main_menu;
last_room_scene = -1;

paused_surf = -1;
is_paused = false;