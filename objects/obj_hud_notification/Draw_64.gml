event_inherited();

draw_set_font(font);
var notification_index = 0, repeat(array_length(notifications))
{
	var notification = notifications[notification_index];
	if (shadow_size > 0)
	{
		draw_text_ext_colour(
			x + shadow_size, y + shadow_size + (notification_index * (separation + box_height)),
			notification, 0, box_width, shadow_color,shadow_color, shadow_color, shadow_color,
			shadow_alpha
		);
	}
	draw_text_ext_colour(
		x, y + (notification_index * (separation + box_height)),
		notification, 0, box_width, color, color, color, color,
		alpha
	);
	notification_index++;
}