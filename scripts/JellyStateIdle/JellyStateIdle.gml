function jelly_idle_update () {
	var _state = character_idle_update();
	if(_state != noone) {
		return _state;	
	}
	
	var _input = parent.input;
	
	var _target_direction = _input.get_target_direction();		
	
	var _resulting_acceleration = player_get_acceleration_idle(parent, _target_direction);
	parent.velocity.add(_resulting_acceleration);
	
	if(approximately_equal(parent.velocity.magnitude, parent.max_spd, 0.5)) {
		return new State(parent, jelly_idle_predashing, jelly_idle_predashing_enter);
	}
	
	_state = jelly_special_update();
	
	return _state;
}

function jelly_special_update() {
	var _input = parent.input;
	
	var _spirit = parent.form_components.jelly_spirit;
	var _available = _spirit.available();
	
	if(!_available) {
		return noone;	
	} else {
		if(_spirit.cooldown_finished) {
			_spirit.cooldown_finished = false;
			jelly_part_create_point(parent.x, parent.y);
		}
	}
	
	if(_input.get_special()) {
		_spirit.open_in_range(parent.position);
		_spirit.reset();
		audio_play_sound(snd_medusa_skill, 1, false);
			
		effect_create_target(parent, _spirit.sprite);
	}
	
	return noone;
}

function jelly_idle_enter (){
	with(parent) {
		stopped = false;
		entity_change_sprite(sprites[KIN_SPRITE.IDLE]);
	}
}

function jelly_idle_predashing() {
	var _state = character_idle_update();
	if(_state != noone) {
		return _state;	
	}
	
	var _input = parent.input;

	var _target_direction = _input.get_target_direction();

	var _resulting_acceleration = player_get_acceleration_idle(parent, _target_direction);
	parent.velocity.add(_resulting_acceleration);
	
	if(animation_end(parent, parent.form_components.dash.frame)) {
		return new State(parent, jelly_idle_dashing, jelly_idle_dashing_enter);
	}
	
	_state = jelly_special_update();
	
	return _state;
}

function jelly_idle_predashing_enter() {
	with(parent) {
		entity_change_sprite(sprites[KIN_SPRITE.MOVING]);
	}
}

function jelly_idle_dashing() {
	var _state = character_idle_update();
	if(_state != noone) {
		return _state;	
	}
	
	var _input = parent.input;

	var _target_direction = _input.get_target_direction();

	var _resulting_acceleration = player_get_acceleration_idle(parent, _target_direction);
	parent.velocity.add(_resulting_acceleration);
	
	if(animation_end(parent)) {
		return parent.state_idle;
	}
	
	_state = jelly_special_update();
	
	return _state;	
}

function jelly_idle_dashing_enter() {
	with(parent) {
		velocity.magnitude = form_components.dash.dash_spd;
	}
}