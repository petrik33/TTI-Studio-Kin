function player_get_acceleration_waving(_instance, _target_direction, _waving) {
	var _resulting_acceleration = player_get_acceleration_idle(_instance, _target_direction);
	
	var _velocity = _instance.velocity;
	if(_waving.active) {
		_resulting_acceleration.add(get_waving_acceleration(_waving));	
	}
	
	return _resulting_acceleration;
}

function player_get_acceleration_idle(_instance, _target_direction) {
	var _velocity = _instance.velocity;
		
	var _resulting_acceleration = new Vector(0, _velocity.direction);
	
	var _resistance_magnitude = count_resistance_decceleration(_instance.water_resistance, _velocity);
	
	var _dash_decceleration = get_decceleration_to(_velocity,
		_resistance_magnitude, _instance.max_spd);
		
	var _spd_acceleration = get_acceleration_to(
		_velocity, _instance.acceleration_spd, _instance.max_spd);
	
	var _rotate_acceleration = get_rotation_acceleration(_velocity, _target_direction, _instance.angular_spd);
		
	_resulting_acceleration.add(_spd_acceleration);
	_resulting_acceleration.add(_dash_decceleration);
	_resulting_acceleration.add(_rotate_acceleration);
	
	return _resulting_acceleration;
}

function player_get_acceleration_stopped(_instance, _target_direction) {
	var _velocity = _instance.velocity;
		
	var _resulting_acceleration = new Vector(0, _velocity.direction);
	
	var _resistance_magnitude = count_resistance_decceleration(_instance.water_resistance, _velocity);
	var _decelleration_magnitude = _resistance_magnitude + _instance.decceleration_spd;
	
	var _decceleration = get_decceleration_to(_velocity,
		_decelleration_magnitude, 0.1);
	
	var _rotate_acceleration = get_rotation_acceleration(_velocity, _target_direction, _instance.angular_spd);
		
	_resulting_acceleration.add(_decceleration);
	_resulting_acceleration.add(_rotate_acceleration);
	
	return _resulting_acceleration;
}

//function player_get_acceleration_predash(_instance, _target_direction, _slow_down) {
//	var _velocity = _instance.velocity;
//	var _resulting_acceleration = new Vector(0, _velocity.direction);
	
//	if(_slow_down) {
//		var _decceleration = get_decceleration_to(_velocity, _instance.decceleration_spd, 0.1);
//		_resulting_acceleration.add(_decceleration);
//	}
	
//	var _rotate_acceleration = get_rotation_acceleration(_velocity, _target_direction, _instance.angular_spd);
		
//	_resulting_acceleration.add(_rotate_acceleration);
	
//	return _resulting_acceleration;
//}

function player_get_acceleration_mid_transition(_instance) {
	var _velocity = _instance.velocity;
	var _resistance_magnitude =  count_resistance_decceleration(_instance.water_resistance, _velocity);
	var _decelleration_magnitude = _resistance_magnitude + _instance.decceleration_spd;
	
	var _decceleration = get_decceleration_to(_velocity,
		_decelleration_magnitude, 0.1);
		
	return _decceleration;
}