function kin_transition_out_update () {
	var _input = parent.input;
	
	var _resulting_acceleration = player_get_acceleration_mid_transition(parent);
	parent.velocity.add(_resulting_acceleration);
	
	if(!_input.get_form_shift()) {
		return new State(parent, kin_cancel_transition_update, 	kin_cancel_transition_enter, kin_cancel_transition_leave);
	}
	
	var _anim_ended = false;
	
	if(transition_reversed) {
		_anim_ended = animation_reversed_end(parent);
	} else {
		_anim_ended = animation_end(parent);	
	}
	
	if(_anim_ended) {
		var _state_transition = new State(parent, kin_transition_mid_update, kin_transition_mid_enter);//, kin_transition_mid_leave);	
		_state_transition.target_form = KIN_FORM.IDLE;
		//_state_transition.initial_img_spd = parent.image_speed;
		
		return _state_transition;
	}
	
	return noone;
}

function kin_transition_out_enter () {
	var _reversed = false;
	with(parent) {
		//player_show_form_icons();
		var _sprite = sprites[KIN_SPRITE.TRANS_OUT];
		var _img = 0;
		if(_sprite == -1) {
			_sprite = sprites[KIN_SPRITE.TRANS_IN];
			
			image_speed = -image_speed;
			_img = sprite_get_number(_sprite) - 1;
			
			var _offset = transition_offset.toVector();
			_offset.direction += velocity.direction + 180;
	
			var _used_to_collide = collides;
			if(collides) collides = false;
			entity_translate_position(_offset);	
			collides = _used_to_collide;
			
			_reversed = true;
		}
		entity_change_sprite(_sprite, _img);
	}
	transition_reversed = _reversed;
}

function kin_transition_out_leave() {
	if(transition_reversed) {
		with(parent) {
			image_speed = -image_speed;
		}	
	}
}

function kin_transition_mid_update() {
	var _input = parent.input;
	
	var _resulting_acceleration = player_get_acceleration_mid_transition(parent);
	parent.velocity.add(_resulting_acceleration);
	
	var _form_input = _input.get_target_form();
	if(_form_input != -1 && target_form != _form_input && parent.forms_opened[_form_input]) {
		with(parent) {
			if(other.target_form > 0) {
				icon_unhighlight(transition_icons_idx[other.target_form - 1]);
			}
			icon_highlight(transition_icons_idx[_form_input - 1]);
		}
		target_form = _form_input;
	}
	
	if(!_input.get_form_shift()) {
		with(parent) {
			if(other.target_form != current_form) {
				kin_change_form(other.target_form);	
			}
		}
		
		return new State(parent, kin_transition_in_update, kin_transition_in_enter, kin_transition_in_leave);
	}
	
	return noone;
}

function kin_transition_mid_enter() {
	target_form = KIN_FORM.IDLE;
	audio_play_sound(snd_transition1, 1, false);
	with(parent) {
		entity_change_sprite(sprite_mid_transition);
		player_show_form_icons();
	}
}

//function kin_transition_mid_leave() {
//	parent.image_speed = initial_img_spd;
//}

function kin_transition_in_update() {
	var _input = parent.input;
	
	var _resulting_acceleration = player_get_acceleration_mid_transition(parent);
	parent.velocity.add(_resulting_acceleration);
	
	if(animation_end(parent)) {
		if(!parent.stopped) {
			return parent.state_idle;
		} else {
			return character_get_stopped_state(parent);
		}
	}
	
	return noone;
}

function kin_transition_in_enter() {
	audio_play_sound(snd_wallbreak, 1, false);
	with(parent) {
		player_hide_form_icons();
		entity_change_sprite(sprites[KIN_SPRITE.TRANS_IN]);	
	}
}

function kin_transition_in_leave() {
	with(parent) {
		var _offset = transition_offset.toVector();
		_offset.direction += velocity.direction;
	
		entity_translate_position(_offset);	
	}
}

function kin_cancel_transition_update() {
	var _input = parent.input;
	
	var _resulting_acceleration = player_get_acceleration_idle(parent, _input.get_target_direction());
	parent.velocity.add(_resulting_acceleration);
	
	if(animation_reversed_end(parent)) {
		if(!parent.stopped) {
			return parent.state_idle;
		} else {
			return character_get_stopped_state(parent);
		}
	}
	
	return noone;
}

function kin_cancel_transition_enter() {
	//with(parent) {
	//	player_hide_form_icons();
	//}
	parent.image_speed = -parent.image_speed;
}

function kin_cancel_transition_leave() {
	parent.image_speed = -parent.image_speed;
}