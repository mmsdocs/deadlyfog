/// @description Draw Progress Bar
if (background) draw_sprite(background, 0, x, y);

var progress_width = sprite_get_width(progress_bar);
var progress_height = sprite_get_height(progress_bar);

var xscale = layer_sprite_get_xscale(progress_bar);
var yscale = layer_sprite_get_yscale(progress_bar);
var current_value = min(progress_value, progress_value_max);

if (is_vertical)
{
	//var top = current_top;
	//var bottom = current_bottom;
	
	if (is_top_direction) current_top = progress_height * current_value - progress_height;
	else if (is_top_bottom_direction) 
	{
		current_top = new_current_top;
		current_bottom = new_current_bottom;
	}
	else current_bottom = progress_height * current_value;
	
	draw_sprite_part_ext(
		progress_bar, 0, 0, current_top, progress_width, current_bottom,
		x, y, xscale, yscale, progress_color, progress_alpha
	);
}
else
{
	var left = current_left;
	var right = current_right;
	
	if (is_left_direction) left = progress_width * current_value - progress_width;
	else right = progress_width * current_value;
	
	draw_sprite_part_ext(
		progress_bar, 0, left, 0, right, progress_height,
		x, y, xscale, yscale, progress_color, progress_alpha
	);
}

if(border) draw_sprite(border, 0, x, y);