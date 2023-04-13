event_inherited();

player_direction = point_direction(x, y, obj_player.x, obj_player.y);

player_distance = point_distance(x, y, obj_player.x, obj_player.y);

if (!is_sprite_following_player) exit;

if (x > obj_player.x) image_xscale = -1;
else image_xscale = 1;