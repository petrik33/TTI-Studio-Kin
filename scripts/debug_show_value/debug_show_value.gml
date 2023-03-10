function debug_show_value(_corner, _value){
	var _shown = false;
	with(obj_debug_layout) {
		_shown = true;
		debug_values[_corner] = _value;
	}
	return _shown;
}