event_inherited();

#macro time_delete_notification 5

notifications = [];

add_notification = function(notification)
{
	var index = 0;
	if (array_length(notifications) == 2) array_delete(notifications, index, 1);
	if (array_length(notifications) > 0) index = 1;
	
	array_insert(notifications, index, notification);
	
	alarm[0] = room_speed * time_delete_notification;
}