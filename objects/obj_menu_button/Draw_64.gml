draw_self(); // testar com luz e modo noturno do game

event_inherited();

draw_set_font(font);

draw_set_color(shadow_color);
draw_text(x + text_shadow_size - int64(pressed), y + text_shadow_size - int64(pressed), button_text);

draw_set_color(hovering ? hover_color : color);
draw_text(x, y, button_text);