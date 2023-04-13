pressed = false;
if (hovering)
{
	if (is_back_button)
	{
		show_debug_message(instance_exists(obj_game))
		obj_game.current_room_scene = obj_game.last_room_scene;
		obj_game.last_room_scene = room;
		room_goto(obj_game.current_room_scene);
	}
	else
	{
		obj_game.current_room_scene = room_scene;
		obj_game.last_room_scene = room;
		room_goto(room_scene);
	}
}