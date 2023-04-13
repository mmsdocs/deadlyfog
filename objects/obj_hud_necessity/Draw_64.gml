event_inherited();

if (type)
{
	var new_position_x = x, repeat(total)
	{
		draw_sprite(type, image_index, new_position_x, y);
		
		new_position_x += sprite_get_width(type) + separation;
	}
}