if (is_paused and room == rm_game)
{
	is_paused = false;
	instance_activate_all();
	surface_free(paused_surf);
	paused_surf = -1;
}
switch(room)
{
	case rm_game:
		audio_play_sound(snd_game_background, 10, true);
		break
	default:
		if (!audio_is_playing(snd_menu_background))	audio_play_sound(snd_menu_background, 10, true);
		break;
}