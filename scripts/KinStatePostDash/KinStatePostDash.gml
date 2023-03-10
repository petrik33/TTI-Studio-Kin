//function kin_postdash_update() {
//	var _input = parent.input;
	
//	if(approximately_equal(parent.velocity.magnitude, parent.max_spd, VECTOR_APPROXIMATION)) {
//		return parent.state_idle;	
//	}
	
//	var _resulting_acceleration = player_get_acceleration_postdash(parent, _input.target_direction);
//	parent.velocity.add(_resulting_acceleration);
	
//	return noone;
//}

//function kin_postdash_enter () {
//	with(parent) {
//		entity_change_sprite(sprites[KIN_SPRITE.MOVING]);
//	}
//}