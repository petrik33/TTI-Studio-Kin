function Hiding(_spd, _leave_spd, _range, _sprite, _sprite_leave, _offset = new Point(57, -1)) constructor {
	spd = _spd;
	range = _range;
	sprite = _sprite;
	leave_spd = _leave_spd;
	sprite_leave = _sprite_leave;
	offset = _offset;
	
	static find_hole = function(_position) {
		var _closest_hole = instance_nearest(_position.x, _position.y, obj_hole);
		if(_closest_hole != noone) {
			var _dist = point_distance(_position.x, _position.y, _closest_hole.x, _closest_hole.y);
			
			if(_dist <= range) {
				return _closest_hole;	
			}
		}
		return noone;
	}
}