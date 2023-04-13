if (room != rm_game) exit;
is_paused = !is_paused;

if (is_paused)
{
	if(paused_surf == -1) instance_deactivate_all(true);
	paused_surf = surface_create(room_width, room_height);
	surface_set_target(paused_surf);
	draw_surface(application_surface, 0, 0);
	surface_reset_target();
	room_goto(rm_pause_menu)
}