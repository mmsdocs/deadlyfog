event_inherited();

if (instance_exists(obj_game))
{
	switch(obj_game.current_game_over)
	{
		case game_overs.eaten_by_fog:
			value = "Dead by Fog\n\nIt's alive and hungry...";
			break;
		case game_overs.contamination:
			value = "Dead by contamination.\n\nThe medicines help to decrease the contamination...";
			break;
		case game_overs.starveling:
			value = "Dead by hungry.\n\nFeeding yourself during the journey is vital to arrive alive at the Bunker.";
			break;
		case game_overs.thirsty:
			value = "Dead by thirsty.\n\nDrinking water helps in the fight against the 'Monstrosities'...";
			break;
	}
}