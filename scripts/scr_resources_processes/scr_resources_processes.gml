// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
enum resource_type
{
	empty,
	food,
	water,
	medicine,
}

function resource_as_string(value)
{
	switch(value)
	{
		case resource_type.food:
			return "food";
			break;
		case resource_type.water:
			return "water";
			break;
		case resource_type.medicine:
			return "medicine";
			break;
	}
}

 function resource_notification()
{
	if (resource != resource_type.empty) return "Collected " + resource_as_string(resource);
	return "Box is empty";
}

function choose_random_resource()
{
	randomize();
	var chance = random(1);
	
	if (chance > 0.35 and chance <=0.60) return resource_type.food;
	if (chance > 0.60 and chance <=0.85) return resource_type.water;
	if (chance > 0.85) return resource_type.medicine;
	
	return resource_type.empty;
}

function interact()
{
	var current_resource = resource;
	if (image_index == 0) image_index++;
	
	var notification = resource_notification();
	obj_hud_notification.add_notification(notification);
	
	if (resource != resource_type.empty) resource = resource_type.empty;
	return current_resource;
}