function GuiElement(_pos, _draw, _alpha = 1, _color = c_white) constructor {
	draw = _draw;
	position = _pos;
	alpha = _alpha;
	color = _color;
	animations = ds_map_create();
	
	static destructor = function() {
		ds_map_destroy(animations);	
	}
	
	static update = function() {
		var _num = ds_map_size(animations);
		var _keys = ds_map_keys_to_array(animations);
		var _values = ds_map_values_to_array(animations);
		
		for(var _idx = 0; _idx < _num; _idx++) {
			var _anim = _values[_idx];
			
			var _anim_value = _anim.update();
			var _var_name = _keys[_idx];
			
			variable_struct_set(self, _var_name, _anim_value);
			
			if(_anim.progress >= 1) {
				var _delete_this = _anim.destructor();
				
				if(_delete_this) {
					destructor();
					return false;
				}
				
				ds_map_delete(animations, _var_name);
			}
		}
		
		return true;
	}
}

function gui_add_element(_element) {
	var _idx = -1;
	with(obj_gui_drawer) {
		if(!ds_queue_empty(free_idx_queue_elements)) {
			_idx = ds_queue_dequeue(free_idx_queue_elements);	
		} else {
			_idx = elements_max_idx;
			elements_max_idx++;	
		}
		
		if(_idx >= GUI_MAX_ELEMENTS) {
			elements_max_idx--;
			show_message("GUI Elements overflow");
			return;
		}
		
		elements[_idx] = _element;
	}
	
	return _idx;
}

function gui_elements_free_idx(_idx) {
	delete elements[_idx];
	ds_queue_enqueue(free_idx_queue_elements, _idx);
}

function gui_remove_element(_idx) {
	if(_idx < 0 || _idx >= GUI_MAX_ELEMENTS) {
		return;	
	}
	
	with(obj_gui_drawer) {
		if(!is_struct(elements[_idx])) {
			return;	
		}
		elements[_idx].destructor();
		gui_elements_free_idx(_idx);
	}
}

function gui_get_element(_idx) {
	var _elem = -1;
	
	if(_idx < 0 || _idx >= GUI_MAX_ELEMENTS) {
		return -1;	
	}
	
	with(obj_gui_drawer) {
		_elem = elements[_idx];	
	}
	
	return _elem;
}