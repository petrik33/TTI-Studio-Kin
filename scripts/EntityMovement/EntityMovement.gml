function entity_movement(){
	entity_translate_position(velocity);
	image_angle = velocity.direction;
}

function entity_change_movement(_max_spd, _acceleration_spd, _decceleration_spd, _rotation_time, _water_resistance) {
	max_spd = _max_spd;
	acceleration_spd = _acceleration_spd;
	decceleration_spd = _decceleration_spd;
	angular_spd = count_angular_acceleration(max_spd, _rotation_time);
	rotation_spd = count_rotation_spd(_rotation_time);
	water_resistance = _water_resistance;
}

function entity_change_max_spd(_max_spd) {
	max_spd = _max_spd;
	var _rotation_time = 360 / (rotation_spd * FRAME_RATE);
	angular_spd = count_angular_acceleration(max_spd, _rotation_time);
}

function entity_translate_position(_offset) {
	position.translate(_offset);
	entity_update_position();
}

function entity_change_position(_point) {
	position = _point;
	entity_update_position();
}

function entity_update_position() {
	if(collides) {
		entity_collision(global.collision_map, global.collide_objects);	
	}
	
	x = position.x;
	y = position.y;	
}
