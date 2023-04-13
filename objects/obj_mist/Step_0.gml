if (is_demo) exit;
//if (obj_level_controller.is_night) exit;
x = lerp(x, x + mist_speed, 1);
x = clamp(x, 0, sprite_width);