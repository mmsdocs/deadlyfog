event_inherited();

var initial_resource_position_x = x + margin_left;
var initial_resource_position_y = y + margin_top;

var current_resource_index = 0, repeat(array_length(resource_sprites))
{
	var current_resource = resource_sprites[current_resource_index];
	var resource_position_x = initial_resource_position_x;
	var resource_position_y = initial_resource_position_y;
	
	if (available_resources[current_resource_index])
	{
		draw_sprite(current_resource, 0, resource_position_x, resource_position_y);
	}
	
	initial_resource_position_y = resource_position_y + sprite_get_width(current_resource) + separation;
	
	current_resource_index++;
}