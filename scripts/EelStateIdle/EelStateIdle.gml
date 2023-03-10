function eel_state_idle(){
	var _state = character_idle_update();
	if(_state != noone) {
		return _state;	
	}
	
	var _input = parent.input;
	
	character_waving_update();
	
	_state = eel_special_update();
	
	return _state;
}

function eel_special_update() {
	var _input = parent.input;
	
	if(_input.get_special()) {
		var _target = parent.form_components.hiding.find_hole(parent.position);
		if(_target != noone) {
			var _hide_state = new State(parent, eel_state_hide, eel_state_hide_enter);
			_hide_state.target = _target;
			return _hide_state;
		}
	}
	
	return noone;
}