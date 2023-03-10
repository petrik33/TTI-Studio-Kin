function shark_dash_update() {
	var _input = parent.input;
	
	var _resulting_acceleration = player_get_acceleration_idle(parent, _input.get_target_direction());
	parent.velocity.add(_resulting_acceleration);
	
	if(animation_end(parent)) {
		return parent.state_idle;
	}
	
	return noone;
}

function shark_dash_enter() {
	parent.stopped = false;
	breaking = true;
	effect_create_target(parent, spr_sharkdash_vfx);
	var _components = parent.form_components;
	parent.velocity.magnitude = _components.dash.dash_spd;
}