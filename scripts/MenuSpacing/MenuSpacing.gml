function menu_set_spacing(_x, _y, _halign, _valign, _width, _height, _border, _entries_num){
	var _entry_space = (_height - _border * 2) / _entries_num;
	
	switch(_halign) {
		case fa_left:
			x = _x + _border;
		break;
		
		case fa_center:
		default:
		
			x = _x + _width / 2;
		
		break;
		
		case fa_right:
			x = _x + _width - _border;
		break;
	}
	
	menu_halign = _halign;
	
	switch(_valign) {
		case fa_top:
			y = _y + _border;
		break;
		
		case fa_middle:
		default:
		
			y = _y + _entry_space / 2;
		
		break;
		
		case fa_bottom:
			y = _y + _border + _entry_space;
		break;
	}
	
	menu_valign = _valign;
	entry_space = _entry_space;
	
}