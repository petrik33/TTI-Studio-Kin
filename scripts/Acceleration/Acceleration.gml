function get_acceleration_to(_velocity, _acceleration_spd, _target_spd) {
	var _acceleration_magnitude = max(0, min(_target_spd - _velocity.magnitude, _acceleration_spd));
	var _acceleration = new Vector(_acceleration_magnitude, _velocity.direction);
	
	return _acceleration;
}

function get_decceleration_to(_velocity, _decceleration_spd, _target_spd) {
	var _decceleration_magnitude = max(0, min(_velocity.magnitude - _target_spd, _decceleration_spd));
	var _decceleration = new Vector(_decceleration_magnitude, _velocity.direction + 180);
	
	return _decceleration;
}

function get_decceleration_to_stop(_velocity, _decceleration_spd) {
	var _decceleration_magnitude = min(_velocity.magnitude, _decceleration_spd);
	_decceleration_magnitude = max(_decceleration_magnitude - VECTOR_APPROXIMATION, 0);
	
	var _decceleration = new Vector(_decceleration_magnitude, _velocity.direction + 180);
	
	return _decceleration;
}

function get_rotation_acceleration(_velocity, _target_direction, _angular_spd) {
	var _rotate_acceleration = get_acceleration_sub(
		_velocity, new Vector(_velocity.magnitude, _target_direction) , _angular_spd);	
	return _rotate_acceleration;
}

function get_acceleration_sub(_current_velocity, _target_velocity, _magnitude) {
	var _acceleration = _target_velocity.vec_sub(_current_velocity);
	_acceleration.magnitude = min(_acceleration.magnitude, _magnitude);
	
	return _acceleration;
}

function get_waving_acceleration(_waving) {
	var _magnitude = _waving.update_acceleration();
	var _direction = _waving.direction;
	var _waving_acceleration = new Vector(_magnitude, _direction);
	
	return _waving_acceleration;
}

function count_acceleration(_spd, _time) {
	return _spd / (_time * FRAME_RATE);	
}

function count_angular_acceleration(_spd, _time) {
	return _spd * degtorad(count_rotation_spd(_time));	
}

function count_rotation_spd(_time) {
	return 360 / (_time * FRAME_RATE);	
}

//function count_angular_acceleration(_spd, _radius) {
//	return sqr(_spd) / _radius;	
//}

//function count_rotation_spd(_spd, _radius) {
//	return radtodeg(_spd / _radius)	
//}

function count_resistance_decceleration(_water_resitance, _velocity) {
	return global.resist_decceleration_spd * _water_resitance * sqr(_velocity.magnitude);
}