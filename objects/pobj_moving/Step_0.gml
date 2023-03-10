event_inherited();

if(!global.game_is_paused) {
	var _state_change = state.update();

	if(_state_change != noone) {
		entity_change_state(_state_change);	
	}

	entity_movement();
}