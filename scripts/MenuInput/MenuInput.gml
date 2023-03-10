function menu_keyboard_input(){
	var _input_up = (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")));
	var _input_down = (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")));
	
	var _input = _input_down - _input_up;
	
	if(_input != 0) {
		icon_unhighlight(menu_icons[current_entry], menu_icon_highlight);
		
		current_entry += _input;
		if(current_entry < 0) {
			current_entry = entries_num - 1;	
		}
		if(current_entry >= entries_num) {
			current_entry = 0;	
		}
		
		icon_highlight(menu_icons[current_entry], menu_icon_highlight);
		return true;
	}
	
	if(keyboard_check_pressed(vk_enter)) {
		entries[current_entry].callback();
		return true;
	}
}

function menu_mouse_input() {
	var _menu_pos = new Point(menu_x, menu_y);
	
	var _mouse_x = device_mouse_x_to_gui(0);
	var _mouse_y = device_mouse_y_to_gui(0);
	
	var _mouse_pos = new Point(_mouse_x, _mouse_y);
	
	if(_mouse_pos.get_distance(mouse_previous_pos) > 1) {
		var _input_vec = _mouse_pos.point_sub(_menu_pos);
	
		var _entry = (_input_vec.y - menu_border) / entry_space;
		_entry = clamp(_entry, 0, entries_num - 1);
	
		if(_entry != current_entry) {
			icon_unhighlight(menu_icons[current_entry], menu_icon_highlight);
			current_entry = _entry;
			icon_highlight(menu_icons[current_entry], menu_icon_highlight);
			return true;
		}
	}
	
	mouse_previous_pos = _mouse_pos;
	
	if(mouse_check_button_pressed(mb_left)) {
		entries[current_entry].callback();
		return true;
	}
}