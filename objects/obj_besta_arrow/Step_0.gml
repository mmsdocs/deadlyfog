seek_gun();
if (!enemy_target) exit;
if (!instance_exists(enemy_target)) instance_destroy();

x = enemy_target.x - enemy_distance_x - sprite_width/2;
y = enemy_target.y - enemy_distance_y - sprite_height/2;