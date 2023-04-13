if (place_meeting(x , y, other))
{
	x = xprevious;
	y = yprevious;
}

alarm[0] = room_speed * collision_cooldown;