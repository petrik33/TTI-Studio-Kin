// Inherit the parent event
event_inherited();
if(instance_exists(claimed)) {
	offset.direction = offset_direction + claimed.image_angle;
	image_angle = claimed.image_angle + 180;
	x = claimed.x + offset.get_vx();
	y = claimed.y + offset.get_vy();
}
