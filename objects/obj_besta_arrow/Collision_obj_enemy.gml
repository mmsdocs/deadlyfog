if (is_free and enemy_target == undefined)
{
	speed = 0;
	enemy_target = other;
	enemy_distance_x = enemy_target.x - xprevious;
	enemy_distance_y = enemy_target.y - yprevious;
	enemy_target.damage();
}