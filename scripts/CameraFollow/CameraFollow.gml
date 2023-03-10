function camera_follow(_target = noone){
	with(obj_camera) {
		if(_target != noone) {
			state_follow.target = _target;
		}
		entity_change_state(state_follow);	
	}
}