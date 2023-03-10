function PlayerInputKeyboard(_parent, 
	_get_target_direction = keyboard_get_target_direction,
	_get_target_form = keyboard_get_target_form,
	_get_stop_go = keyboard_get_stop_go,
	_get_special = keyboard_get_special,
	_get_shift = keyboard_get_form_shift,
	_predash_decceleration_buffer = START_BUFF,
	_key_special = vk_space,
	_key_shift = vk_shift,
	_key_left = ord("A"),
	_key_right = ord("D"),
	_key_up = ord("W"),
	_key_down = ord("S")
	) : PlayerInput(_parent, _get_target_direction, _get_target_form,
	_get_stop_go, _get_special, _get_shift, _predash_decceleration_buffer) constructor {
		
	key_special = _key_special;
	key_shift = _key_shift;
	key_left = _key_left;
	key_right = _key_right;
	key_up = _key_up;
	key_down = _key_down;
}

function keyboard_get_form_shift() {
	return keyboard_check(key_shift);
}
	
function keyboard_get_special() {
	return keyboard_check(key_special);	
}

function keyboard_get_stop_go() {
	var _top = keyboard_check_pressed(key_up);
	var _bottom = keyboard_check_pressed(key_down);
	
	//var _input = _top - _bottom;
	//max_spd_part += _input * max_spd_part_step;
	//max_spd_part = clamp(max_spd_part, 0, 1);
	
	return _top || _bottom;
}	

function keyboard_get_target_form() {
	var _left = keyboard_check(key_left);
	var _right = keyboard_check(key_right);
	var _top = keyboard_check(key_up);
	var _bottom = keyboard_check(key_down);
	
	if(_right) {
		return 1;	
	}
	
	if(_top) {
		return 2;	
	}
	
	if(_left) {
		return 3;	
	}
	
	if(_bottom) {
		return 4;	
	}
	
	return -1;
}

function keyboard_get_target_direction() {
	var _left = keyboard_check(key_left);
	var _right = keyboard_check(key_right);
	
	var _input_direction = (_left - _right);
	direction_changed = (_input_direction != 0);
	
	return parent.velocity.direction + _input_direction * parent.rotation_spd;
}