function camera_in_room(_buffer){
	with(obj_camera) {
		if(x < -(camera_half_width + _buffer) || x > (room_width + camera_half_width + _buffer)) {
			return false;	
		}
		
		if(y < -(camera_half_height + _buffer) || y > (room_height + camera_half_height + _buffer)) {
			return false;	
		}
	}
	return true;
}