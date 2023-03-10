function kin_dash_start_update() {
	var _input = parent.input;
	var _components = parent.form_components;
	
	var _resulting_acceleration = player_get_acceleration_idle(parent, _input.get_target_direction());
	parent.velocity.add(_resulting_acceleration);
	
	if(animation_end(parent, _components.dash.frame)) {
		return new State(parent, kin_dash_update, kin_dash_enter);
	}
	
	return noone;
}

function kin_dash_start_enter() {
	with(parent) {
		entity_change_sprite(sprites[KIN_SPRITE.DASHING]);
	}
}