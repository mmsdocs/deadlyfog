event_inherited();

draw_set_font(font);

if (line_width > -1) draw_text_ext(x, y, value, line_separation, line_width);
else
{
	if (shadow_size > 0)
	{
		draw_text_color(x + shadow_size, y + shadow_size, value, shadow_color,shadow_color, shadow_color, shadow_color, shadow_alpha);
	}
	draw_text_color(x, y, value, color, color, color, color, alpha);
}