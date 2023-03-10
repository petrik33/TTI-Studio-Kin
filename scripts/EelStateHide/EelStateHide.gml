function eel_state_hide(){
	var _dist = parent.position.get_distance(target_position);
	
	with(parent) {
		velocity.magnitude = min(_dist, velocity.magnitude);
	}
	
	if(animation_end(parent)) {
		var _hidden_state = new State(parent, eel_state_hidden, eel_state_hidden_enter, eel_state_hidden_leave);
		_hidden_state.hole = target;
		return _hidden_state;
	}
	
	return noone;
}

function eel_state_hide_enter() { 
	target_position = new Point(target.x, target.y);
	audio_play_sound(snd_eel_hide, 1, false);
	with(parent) {
		var _hiding = form_components.hiding;
		
		velocity.direction = position.get_direction(other.target_position);
		velocity.magnitude = _hiding.spd;
		
		entity_change_sprite(_hiding.sprite);
		collides = false;
	}
}

function eel_state_hidden() {
	var _input = parent.input;
	
	if(_input.get_special()) {
		var _leave_state = new State(parent, eel_state_leave, eel_state_leave_enter, eel_state_leave_leave);	
		_leave_state.hole = hole;
		return _leave_state;
	}
	
	return noone;
}

function eel_state_hidden_enter() {
	with(hole) {
		entity_change_sprite(sprite_filled);	
	}
	with(parent) {
		entity_change_position(new Point(other.hole.x, other.hole.y));
		visible = false;	
	}
}

function eel_state_hidden_leave() {
	with(hole) {
		entity_change_sprite(sprite_idle);	
	}
	with(parent) {
		visible = true;	
	}
}

function eel_state_leave() {
	if(animation_end(parent)) {
		return parent.state_idle;
	}
	
	return noone;
}

function eel_state_leave_enter() {
	var _direction = hole.leave_direction;
	with(parent) {
		var _hiding = form_components.hiding;
		entity_change_sprite(_hiding.sprite_leave);
		velocity.direction = _direction;
	}
}

function eel_state_leave_leave() {
	var _direction = hole.leave_direction;
	with(parent) {
		var _hiding = form_components.hiding;
		
		var _offset = _hiding.offset.toVector();
		_offset.direction += _direction;
		
		entity_translate_position(_offset);
		
		velocity.magnitude = _hiding.leave_spd;
		
		collides = true;	
	}
}