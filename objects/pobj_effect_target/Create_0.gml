// Inherit the parent event
event_inherited();

offset_direction = offset.direction;

if(instance_exists(target)) {
	image_angle = target.image_angle + angle_offset;
	offset.direction = offset_direction + target.image_angle;
	x = target.x + offset.get_vx();
	y = target.y + offset.get_vy();
}