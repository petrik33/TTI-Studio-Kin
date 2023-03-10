function ds_grid_show_debug(_id){
	var _rows = ds_grid_height(_id);
	var _columns = ds_grid_width(_id);
	for(var _y = 0; _y < _rows; _y++) {
		var _row_str = "";
		for(var _x = 0; _x < _columns; _x++) {
			_row_str += string(_id[# _x,_y]) + " ";	
		}
		show_debug_message(_row_str);
	}
}