/// @description Set new direction

if (is_inside_screen) choose_new_direction();
is_inside_screen = (x > 0 and x < room_width) and (y > 0 and y < room_height);
alarm[0] = room_speed * new_direction_cooldown;