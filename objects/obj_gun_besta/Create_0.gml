#macro cooldown 0.3

image_speed = 0;

is_equipped = false;
is_recharged_with_arrow = false;
arrow = undefined;

equip = function()
{
	is_equipped = true;
	visible = is_equipped;
	if (arrow != undefined) arrow.set_visibility(visible);
}

unequip = function()
{
	is_equipped = false;
	visible = is_equipped;
	if (arrow != undefined) arrow.set_visibility(visible);
}

recharge = function()
{
	image_index = 1;
	arrow = instance_create_layer(x, y, "Player", obj_besta_arrow);
	arrow.depth = depth - 0.1;
	arrow.set_visibility(obj_gun_besta.is_equipped);
	is_recharged_with_arrow = true;
}

shoot = function()
{
	if (is_equipped and is_recharged_with_arrow)
	{
		audio_play_sound(snd_sfx_arrow, 11, false);
		arrow.free();
		arrow = undefined;
		image_index = 0;
		alarm[0] = cooldown * room_speed;
		is_recharged_with_arrow = false;
	}
}

check_equipped = function()
{
	if (is_equipped)
	{
		x = obj_player.x;
		y = obj_player.y - (obj_player.sprite_height/2);

		image_angle = point_direction(x, y, mouse_x, mouse_y) - 90;
	}
}

recharge();