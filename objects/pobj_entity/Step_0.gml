if(!global.game_is_paused) {
	var _active_components_num = ds_list_size(active_components_list);

	for(var _idx = 0; _idx < _active_components_num; _idx++) {
		var _type_id = active_components_list[| _idx];
		component = components[_type_id];
		if(component.update != -1) {
			component.update();	
		}
	}
}