function ds_list_delete_value(_list_index, _value) {
	var _size = ds_list_size(_list_index);
	
	for(var i = 0; i < _size; i++) {
		if(_list_index[| i] == _value) {
			ds_list_delete(_list_index, i);	
			return true;
		}
	}
	
	return false;
}