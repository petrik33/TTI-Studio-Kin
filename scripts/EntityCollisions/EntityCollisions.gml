function entity_collision(_collision_map, _collision_list) {
	object_collision(position, _collision_list);
	tile_collision(position, _collision_map);
}

function object_collision(_point, _collision_list) {
	var _collided = ds_list_create();
	var _num = ds_list_size(_collision_list);
	
	var _bbox_lines = bbox_get_lines(_point);
	
	for(var _idx = 0; _idx < _num; _idx++) {
		var _inst = _collision_list[| _idx];
		
		if(_inst == self) {
			continue;	
		}
		
		var _collision_lines = ds_list_create();
		for(var i = 0; i < 4; i++) {
			_collision_lines[| i] = _bbox_lines[i];
		}
		
		var _lines_num = 4;
		
		do {
			var _solve_vector = new Vector(0, 0);
			
			for(var i = 0; i < _lines_num; i++) {
				var _line = _collision_lines[| i];
				var _p1 = _line[0];
				var _p2 = _line[1];
				
				var _collides = collision_line(_p1.x, _p1.y, _p2.x, _p2.y, _inst, false, false);
				
				if(_collides == noone) {
					ds_list_delete(_collision_lines, i);
					i--;
					_lines_num--;
					continue;
				}
				
				var _special = collider_check_special(self, _inst);
				if(_special) {
					ds_list_clear(_collision_lines);
					_lines_num = 0;
					break;
				}
				
				var _solve_direction = _p1.get_direction(_p2);
				_solve_vector.add(new Vector(1, _solve_direction - 90));
			}
			
			if(_solve_vector.magnitude > 0) {
				_solve_vector.magnitude = 1;
				_point.translate(_solve_vector);
			
				for(var i = 0; i < _lines_num; i++) {
					var _line = _collision_lines[| i];
					var _p1 = _line[0];
					var _p2 = _line[1];
				
					_p1.translate(_solve_vector);
					_p2.translate(_solve_vector);
				}
			}
			
			_lines_num = ds_list_size(_collision_lines);
		} until(_lines_num == 0);
	}
	
	ds_list_destroy(_collided);
}

function collider_check_special(_entity, _collider) {
	var _component = _collider.components[COMPONENT_TYPE.OBJECT_COLLIDER];
	if(_component.special_condition == noone) {
		return false;	
	}
		
	return _component.special_condition(_entity);
}

function bbox_get_lines(_position) {
	var _bbox_points = bbox_get_points(_position);
	
	var _bbox_lines = [
		[_bbox_points[0], _bbox_points[1]],
		[_bbox_points[1], _bbox_points[2]],
		[_bbox_points[2], _bbox_points[3]],
		[_bbox_points[3], _bbox_points[0]]
	]
	
	return _bbox_lines;
}

function line_direction(_line) {
	return _line[0].get_direction(_line[1]);	
}

function bbox_get_points(_position) {
	var _left = sprite_get_bbox_left(sprite_index) - sprite_xoffset;
	var _right = sprite_get_bbox_right(sprite_index) - sprite_xoffset;
	var _top = sprite_get_bbox_top(sprite_index) - sprite_yoffset;
	var _bot = sprite_get_bbox_bottom(sprite_index) - sprite_yoffset;
	
	var _points = [
		new Point(_left, _top),
		new Point(_right, _top),
		new Point(_right, _bot),
		new Point(_left, _bot)
	];
	
	for(var i = 0; i < 4; i++) {
		var _vec = _points[i].toVector();
		_vec.direction += image_angle;
		_points[i] = _vec.toPoint();
		_points[i].add(_position);
	}
	
	return _points;
}

function tile_collision(_point, _collision_map) {
    var _checker = obj_precise_tile_checker;
	if(!instance_exists(_checker)) instance_create_depth(0,0,0,_checker);
	
	var _x_move = _point.x - x;
	var _y_move = _point.y - y;
	
	var _x1 = tilemap_get_cell_x_at_pixel(_collision_map, bbox_left + _x_move, y),
    _y1 = tilemap_get_cell_y_at_pixel(_collision_map, x, bbox_top + _y_move),
    _x2 = tilemap_get_cell_x_at_pixel(_collision_map, bbox_right + _x_move, y),
    _y2 = tilemap_get_cell_y_at_pixel(_collision_map, x, bbox_bottom + _y_move);
	
	var _collided = false;
	
	var _relative_center = new Point((_x2 - _x1) / 2, (_y2 - _y1) / 2);

	for(var _cell_x = _x1; _cell_x <= _x2; _cell_x++){
		for(var _cell_y = _y1; _cell_y <= _y2; _cell_y++){
			var _tile = tile_get_index(tilemap_get(_collision_map, _cell_x, _cell_y));
			if(_tile){
				_checker.x = _cell_x * TILE_SIZE;
				_checker.y = _cell_y * TILE_SIZE;
				_checker.image_index = _tile;
				
				var _relative_x = _cell_x - _x1;
				var _relative_y = _cell_y - _y1;
				var _relative_point = new Point(_relative_x, _relative_y);
				
				var _relative_direction = _relative_center.get_direction(_relative_point);
				var _reverse_vector = new Vector(1, _relative_direction + 180);

				while(tile_meeting_checker(_point, _checker)) {
					_point.translate(_reverse_vector);
					_collided = true;
				}
			}
		}
	}
	
	return _collided;
}

function tile_meeting_checker(_point, _checker) {
	return 	place_meeting(_point.x,_point.y, _checker);
}

//function entity_object_collision(_point, _collision_list) {
//	var _collided = object_collision(_point, _collision_list);
	
//	var _num = ds_list_size(_collided);
//	var _targeted = array_create(_num, false);
	
//	var _entity = self;
	
//	for(var _idx = 0; _idx < _num; _idx++) {
//		var _inst = _collided[| _idx];
//		var _component = _inst.components[COMPONENT_TYPE.OBJECT_COLLIDER];
//		if(_component.special_condition == noone) {
//			continue;	
//		}
//		if(_component.special_condition(_entity)) {
//			_targeted[_idx] = true;
//		}
//	}
	
//	var _x_move = sign(_point.x - x);
//	var _y_move = sign(_point.y - y);
	
//	var _x_move_left = abs(_point.x - x);
//	var _y_move_left = abs(_point.y - y);
	
//	for(var _idx = 0; _idx < _num; _idx++) {
//		if(_targeted[_idx]) {
//			continue;	
//		}
//		var _inst = _collided[| _idx];
		
//		while(place_meeting(_point.x, y, _inst) && _x_move_left > 0) {
//			_point.x -= _x_move;
//			_x_move_left--;
//		}
		
//		while(place_meeting(_point.x, _point.y, _inst) && _y_move_left > 0) {
//			_point.y -= _y_move;
//			_y_move_left--;
//		}
		
//	}
	
//	ds_list_destroy(_collided);
//}