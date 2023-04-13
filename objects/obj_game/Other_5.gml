switch(room)
{
	case rm_game:
		audio_stop_sound(snd_game_background);
		break
	case rm_prelude:
	case rm_menu_game_over:
	case rm_end_game:
	case rm_pause_menu:
		audio_stop_sound(snd_menu_background);
		break;
}