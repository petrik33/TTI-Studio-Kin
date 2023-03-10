function ToroidWrap(_buffer = TOROID_WRAP_MIN_BUFF, _update = toroid_wrap_update, _destructor = toroid_wrap_destructor) 
	: Component(_update, _destructor) constructor {
		camera_buffer = _buffer;
}

//function toroid_wrap_update() {
//	if(!camera_in_room(camera_buffer)) {
		
//		var _x_center = new Point(room_width / 2, parent.y);
//		var _to_x_center = _x_center.point_sub(parent.position).toVector();
		
//		var _dot_product_x = _to_x_center.vec_dot_product(parent.velocity);
		
//		if(_dot_product_x < 0) {
//			_to_x_center
//			var _wrapped_position = _x_center.point_sum(_point_to_x_center);
			
//			var _camera_x_offset = obj_camera.x - parent.x;
			
//			with(parent) {
//				entity_change_position(_wrapped_position);
//			}
			
//			with(obj_camera) {
//				x = state.target.x + _camera_x_offset;
//			}
//		}
		
//		var _y_center = new Point(parent.x, room_height / 2);
//		var _point_to_y_center = _y_center.point_sub(parent.position);
		
//		var _dot_product_y = _point_to_y_center.point_dot_product(_velocity_point);
		
//		if(_dot_product_y < 0) {
//			var _wrapped_position = _y_center.point_sum(_point_to_y_center);
//			var _camera_y_offset = obj_camera.y - parent.y;
			
//			with(parent) {
//				entity_change_position(_wrapped_position);
//			}
			
//			with(obj_camera) {
//				y = state.target.y + _camera_y_offset;
//			}
//		}
//	}
//}

function toroid_wrap_update() {
	if(!camera_in_room(camera_buffer)) {
		
		var _room_center = new Point(room_width / 2, room_height / 2);
		var _point_to_center = _room_center.point_sub(parent.position);
		
		var _velocity_point = parent.velocity.toPoint();
		var _dot_product = _point_to_center.point_dot_product(_velocity_point);
		
		if(_dot_product < 0) {
			var _camera_x_offset = obj_camera.x - parent.x;
			var _camera_y_offset = obj_camera.y - parent.y;
			
			var _tile_x_offset = abs(parent.x) % global.bg_tile_w;
			var _tile_y_offset = abs(parent.y) % global.bg_tile_h;
			
			var _wrapped_position = _room_center.point_sum(_point_to_center);
			_wrapped_position.x += (global.bg_tile_w - _tile_x_offset) * 2 * sign(_point_to_center.x);
			_wrapped_position.y += (global.bg_tile_h - _tile_y_offset) * 2 * sign(_point_to_center.y);
			
			with(parent) {
				entity_change_position(_wrapped_position);
			}
			
			with(obj_camera) {
				x = state.target.x + _camera_x_offset;
				y = state.target.y + _camera_y_offset;
			}
		}
	}
}

function toroid_wrap_destructor() {
	//	
}