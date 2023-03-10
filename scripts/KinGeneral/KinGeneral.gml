function get_kin_state_transition(_instance) {
	return new State(parent, kin_transition_out_update, kin_transition_out_enter, kin_transition_out_leave);
}

function get_kin_state_predash(_instance, _dash_state) {
	var _state = new State(_instance, kin_predash_update, kin_predash_enter);	
	_state.target_state = _dash_state;
	return _state;
}

function kin_idle_to_target_update () {
	var _input = parent.input;
	
	var _resulting_acceleration = player_get_acceleration_idle(parent, _input.get_target_direction());
	parent.velocity.add(_resulting_acceleration);
	
	if(animation_end(parent,target_frame)) {
		return target_state;	
	}
	
	return noone;
}

function kin_idle_delay_state(_instance, _state, _frame = noone) {
	var _state_delay = new State(_instance, kin_idle_to_target_update);
	
	_state_delay.target_state = _state;
	_state_delay.target_frame = _frame;
	
	return _state_delay;
}

function character_get_stopped_state(_parent) {
	var _state_stopped = new State(_parent, character_state_idle_stopped, character_stopped_enter);
	_state_stopped.special_update = _parent.form_special_update;
	return _state_stopped;	
}

function character_idle_update() {
	var _input = parent.input;
	
	if(_input.get_stop_go()) {
		return character_get_stopped_state(parent);
	}
	
	if(_input.get_form_shift()) {
		return get_kin_state_transition(parent);
	}	
	
	return noone;
}

function character_stopped_update() {
	var _input = parent.input;
	
	var _resulting_acceleration = player_get_acceleration_stopped(parent, _input.get_target_direction());
	parent.velocity.add(_resulting_acceleration);
	
	//var _max_spd_part_new = _input.get_stop_go();
	//if(_max_spd_part_new != parent.max_spd_part) {
	//	with(parent) {
	//		parent.max_spd_part = _max_spd_part_new;
	//		entity_change_max_spd(parent.max_spd * _max_spd_part_new);	
	//	}
	//}
	
	if(_input.get_stop_go()) {
		return parent.state_idle;
	}
	
	if(_input.get_form_shift()) {
		return get_kin_state_transition(parent);
	}
	
	return noone;
}

function character_stopped_enter() {
	with(parent) {
		stopped = true;
		entity_change_sprite(sprites[KIN_SPRITE.IDLE]);
	}
}