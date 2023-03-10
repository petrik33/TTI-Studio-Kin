function PlayerInputMouse(_parent, 
	_get_target_direction = mouse_get_target_direction,
	_get_target_form = mouse_get_target_form,
	_get_stop_go = mouse_get_stop_go,
	_get_special = mouse_get_special,
	_get_shift = mouse_get_form_shift,
	_predash_decceleration_buffer = START_BUFF,
	_button_special = mb_left,
	_button_shift = mb_right
	) : PlayerInput(_parent, _get_target_direction, _get_target_form, _get_stop_go,
	_get_special, _get_shift, _predash_decceleration_buffer) constructor {
	
	button_special = _button_special;
	button_shift = _button_shift;
	
	mouse_previous_pos = new Point(window_mouse_get_x(), window_mouse_get_y());
	previous_direction = -1;
	direction = parent.velocity.direction;
	
	static mouse_moved = function() {
		var _new_pos = new Point(window_mouse_get_x(), window_mouse_get_y())
		var _movement_magnitude = mouse_previous_pos.get_distance(_new_pos);
		mouse_previous_pos = _new_pos;
		return _movement_magnitude;
	}
}

function mouse_get_form_shift() {
	return mouse_check_button(button_shift);
}
	
function mouse_get_special() {
	return mouse_check_button(button_special);	
}

function mouse_get_stop_go() {
	//var _top = mouse_wheel_up();
	//var _bottom = mouse_wheel_down();
	
	//var _input = _top - _bottom;
	//max_spd_part += _input * max_spd_part_step;
	//max_spd_part = clamp(max_spd_part, 0, 1);
	
	return mouse_check_button_pressed(mb_middle);	
}

function mouse_get_target_form() {
	var _direction = point_direction(parent.x, parent.y, mouse_x, mouse_y);
	
	var _form = 1 + floor((45 + _direction) / 90);
	if(_form == KIN_FORM.NUM) {
		_form = 1;
	}
	
	return _form;
}

function mouse_get_target_direction() {
	direction_changed = false;	
	var _mouse_movement = mouse_moved();
	
	direction = point_direction(parent.x, parent.y, mouse_x, mouse_y);
	
	if (_mouse_movement > 0) {
		var _rotated = abs(angle_difference(direction, previous_direction)) >= 1;
		if(_rotated) {
			direction_changed = true;	
		}
	}
	
	previous_direction = direction;
	
	//if(_mouse_movement <= 0 && !_rotate) {
	//	direction = parent.velocity.direction;	
	//}
	
	return direction;
	//return point_direction(parent.x, parent.y, mouse_x, mouse_y);
}









