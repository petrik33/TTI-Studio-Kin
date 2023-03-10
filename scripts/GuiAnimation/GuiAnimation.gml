function GuiAnimation(_animcurve_id, _scale, _length, _offset = 0, _reversed = false, _delete_element = -1) constructor {
	animation = animcurve_get_channel(animcurve_get(_animcurve_id), 0);
	scale = _scale;
	progress = 0;
	spd = 1 / (_length * FRAME_RATE);
	offset = _offset;
	delete_element = _delete_element;
	reversed = _reversed;
	
	static update = function() {
		var _curve_pos = progress;
		if(reversed) {
			_curve_pos = 1 - progress;	
		}
		
		var _value = offset + animcurve_channel_evaluate(animation, _curve_pos) * scale;
		
		progress += spd;
		
		return _value;
	}
	
	static destructor = function() {
		return delete_element;
	}
}

function gui_get_animation(_idx) {
	var _anim = -1;
	
	if(_idx < 0 || _idx >= GUI_MAX_ANIMATIONS) {
		return -1;	
	}
	
	with(obj_gui_drawer) {
		_anim = animtions[_idx];	
	}
	
	return _anim;
}

function gui_remove_animation(_element_idx, _var_name) {
	var _element = gui_get_element(_element_idx);
	
	if(!is_struct(_element)) {
		return;	
	}
	
	if(ds_map_exists(_element.animations, _var_name)) {
		ds_map_delete(_element.animations, _var_name);	
	}
}

function gui_add_animation(_element_idx, _anim, _var_name) {
	var _element = gui_get_element(_element_idx);
	
	if(!is_struct(_element)) {
		return;	
	}
	
	_element.animations[? _var_name] = _anim;
}

function gui_animations_free_idx(_idx) {
	delete animations[_idx];
	ds_queue_enqueue(free_idx_queue_animations, _idx);
}

//function gui_add_animation(_anim) {
//	var _idx = -1;
//	with(obj_gui_drawer) {
//		global.debug1++;
//		debug_show_value(CORNER.TOP_LEFT, global.debug1);
		
//		if(!ds_queue_empty(free_idx_queue_animations)) {
//			_idx = ds_queue_dequeue(free_idx_queue_animations);	
//		} else {
//			_idx = animations_max_idx;
//			animations_max_idx++;	
//		}
		
//		if(_idx >= GUI_MAX_ANIMATIONS) {
//			animations_max_idx--;
//			show_message("GUI Elements overflow");
//			return -1;
//		}
		
//		animations[_idx] = _anim;
//	}
	
//	return _idx;
//}