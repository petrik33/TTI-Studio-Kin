function shark_idle_update () {
	var _state = character_idle_update();
	if(_state != noone) {
		return _state;	
	}
	
	var _input = parent.input;
	
	character_waving_update();
	
	_state = shark_special_update();
	
	return _state;
}

function shark_special_update() {
	var _input = parent.input;
	
	if(_input.get_special()) {
		var _dash = new State(parent, kin_dash_update, shark_dash_enter);
		return get_kin_state_predash(parent, _dash);
	}
	
	return noone;
}

function character_waving_update() {
	var _input = parent.input;
	
	var _components = parent.form_components;
	
	var _waving = _components.waving;
	var _target_direction = _input.get_target_direction();
	
	//Waving
	if(_input.direction_changed) {
		_waving.reset();	
	} else {
		if(--_waving.start_timer <= 0) {
			_waving.set(_target_direction + 90);
			_target_direction = parent.velocity.direction;
		}	
	}
	
	var _resulting_acceleration = player_get_acceleration_waving(parent, _target_direction,  _waving);
	parent.velocity.add(_resulting_acceleration);
}

//function shark_idle_enter () {
//	with(parent) {
//		entity_change_sprite(sprites[KIN_SPRITE.MOVING]);
//	}
//}