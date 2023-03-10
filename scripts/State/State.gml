function State(_instance, _update, _enter = -1, _leave = -1) constructor {
	update = _update;
	enter = _enter;
	leave = _leave;
	parent = _instance;
}

function entity_change_state(_state_new) {
	if(state.leave != -1) {
		state.leave();
	}
	
	previous_state = state;
	state = _state_new;
	
	if(state.enter != -1) {
		state.enter();	
	}
}