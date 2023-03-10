function kin_predash_update() {
	var _input = parent.input;
	
	var _slow_down = (--predash_decceleration_timer <= 0);
	var _resulting_acceleration;
	
	if(_slow_down) {
		_resulting_acceleration = player_get_acceleration_stopped(parent, _input.get_target_direction());
	} else {
		_resulting_acceleration = player_get_acceleration_idle(parent, _input.get_target_direction());
	}
	
	parent.velocity.add(_resulting_acceleration);
	
	if(!_input.get_special()) {
		//Key released
		return target_state;
	}
	
	return noone;
}

function kin_predash_enter () {
	predash_decceleration_timer = parent.input.predash_decceleration_buffer;
	with(parent) {
		stopped = false;
		entity_change_sprite(sprites[KIN_SPRITE.IDLE]);
	}
}