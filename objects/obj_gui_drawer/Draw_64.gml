for(var _idx = 0; _idx < elements_max_idx; _idx++) {
	var _elem = elements[_idx];
	
	if(!is_struct(_elem)) {
		continue;	
	}
	
	if(!_elem.update()) {
		gui_elements_free_idx(_idx);	
	}
	
	_elem.draw();
}