if (is_demo) exit;

image_speed = 0;

move = function()
{
	if (!audio_is_playing(snd_sfx_handcar)) audio_play_sound(snd_sfx_handcar, 11, false);
	image_index++;
	if (image_index == image_number) image_index = 0;
}