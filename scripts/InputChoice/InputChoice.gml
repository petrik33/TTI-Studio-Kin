function input_choose_keyboard() {
	var _input_right = (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")));
	var _input_left = (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")));
	
	var _input = _input_right - _input_left;
	
	if(_input != 0) {
		icon_unhighlight(icons[choice_type], 0.1);
		
		choice_type += _input;
		choice_type = clamp(choice_type, 0, INPUT_TYPE.NUM - 1);
		
		icon_highlight(icons[choice_type], 0.1);
	}
	
	if(keyboard_check_pressed(vk_enter)) {
		return true;
	}	
}

function input_choose_mouse() {
	var _mouse_x = device_mouse_x_to_gui(0);
	var _mouse_y = device_mouse_y_to_gui(0);
	
	var _mouse_pos = new Point(_mouse_x, _mouse_y);
	if(_mouse_pos.get_distance(mouse_previous_pos) > 1) {
		var _prev = choice_type;
		choice_type = floor(_mouse_x / choice_space);
		if(_prev != choice_type) {
			icon_unhighlight(icons[_prev], 0.1);
			icon_highlight(icons[choice_type], 0.1);
		}
	}
	
	mouse_previous_pos = _mouse_pos;
	
	if(mouse_check_button_pressed(mb_left)) {
		return true;
	}	
}