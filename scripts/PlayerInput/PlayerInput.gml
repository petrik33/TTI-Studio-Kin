function PlayerInput(_parent,
	_get_target_direction, _get_target_form,
	_get_stop_go,
	_get_special, _get_shift,
	_predash_decceleration_buffer = START_BUFF / 2,
	_max_spd_part = 1, _max_spd_part_step = 1 / (FRAME_RATE * 0.5)) constructor {
	parent = _parent;
	get_target_direction = _get_target_direction;
	get_target_form = _get_target_form;
	get_stop_go = _get_stop_go;
	get_special = _get_special;
	get_form_shift = _get_shift;
	predash_decceleration_buffer = _predash_decceleration_buffer;
	direction = parent.velocity.direction;
	direction_changed = false;
	//max_spd_part = _max_spd_part;
	//max_spd_part_step = _max_spd_part_step;
}