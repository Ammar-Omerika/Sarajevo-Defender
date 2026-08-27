if (current_time - spawn_time >= life_time || !instance_find(obj_player,0))
{
	instance_destroy();
	exit;
}

var ship = instance_find(obj_player,0);
if (ship != noone)
{
image_angle = ship.image_angle;
var offset =ship.sprite_height * 0.5;
x = ship.x + lengthdir_x(offset, image_angle);
y = ship.y + lengthdir_y(offset, image_angle);
}