function octo_state_idle() {
	var _state = character_idle_update();
	if(_state != noone) {
		return _state;	
	}
	
	var _input = parent.input;
	
	var _resulting_acceleration = player_get_acceleration_idle(parent, _input.get_target_direction());
	parent.velocity.add(_resulting_acceleration);
	
	_state = octo_special_update();
	
	return _state;
}

function octo_special_update() {
	var _input = parent.input;
	
	if(_input.get_special()) {
		var _dash_state = new State(parent, kin_dash_start_update, kin_dash_start_enter);
		var _delayed = get_kin_state_predash(parent, _dash_state);
		var _state = kin_idle_delay_state(parent, _delayed);
		return _state;
	}
	
	return noone;
}