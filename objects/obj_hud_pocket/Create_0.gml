event_inherited();

resource_sprites = [spr_hud_fed, spr_hud_hydration, spr_hud_medicine];
available_resources = [false, false, false];

try_store_resource = function(resource)
{
	if (resource != resource_type.empty)
	{
		var current_resource = resource - 1; // see enum resource_types
		var has_resource = available_resources[current_resource];
		if (!has_resource)
		{
			array_set(available_resources, current_resource, true);
			return true;
		}
	}
	return false;
}

is_resource_available = function(resource)
{
	return available_resources[resource - 1];
}

use_resource = function(resource)
{
	array_set(available_resources, resource - 1, false);
}