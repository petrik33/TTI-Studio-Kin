function get_breakable_component(_parent) {
	var _component = new ObjectCollider(_parent,,,breakable_special_condition);
	return _component;
}

function breakable_special_condition(_inst) {
	var _breaks = variable_struct_exists(_inst.state, "breaking");
	if(_breaks) {
		wall_destroy(parent);	
	}
	return _breaks;
}

function wall_destroy(_inst) {
	audio_play_sound(snd_wallbreak, 1, false);
	instance_destroy(_inst);
	dust_create_point(_inst.x, _inst.y);
}