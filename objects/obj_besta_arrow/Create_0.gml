#macro arrow_speed 20

is_free = false;
enemy_target = undefined;
enemy_distance_x = 0;
enemy_distance_y = 0;

free = function()
{
	direction = image_angle + 90;
	speed = arrow_speed;
	is_free = true;
}

seek_gun = function()
{	
	if (!is_free)
	{
		x = obj_gun_besta.x;
		y = obj_gun_besta.y;
		image_angle = obj_gun_besta.image_angle;
	}
}

set_visibility = function(state)
{
	visible = state;
}