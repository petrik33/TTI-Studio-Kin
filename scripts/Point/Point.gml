function Point(_x, _y) constructor {
	x = _x;
	y = _y;
	
	///@arg point
	static get_distance = function(_other_point) {
		return point_distance(x, y, _other_point.x, _other_point.y);
	}
	
	///@arg point
	static get_direction = function(_other_point) {
		return point_direction(x, y, _other_point.x, _other_point.y);
	}
	
	static toVector = function() {
		return new Vector(POINT_0.get_distance(self), POINT_0.get_direction(self));
	}
	
	///@arg point
	static add = function(_other_point) {
		x += _other_point.x;
		y += _other_point.y;
	}
	
	///@arg point
	static sub = function(_other_point) {
		x -= _other_point.x;
		y -= _other_point.y;
	}
	
	static projection = function(_other_point) {
		var _dot_product = point_dot_product(_other_point);
		var _other_magnitude = _other_point.get_distance(POINT_0);
		return _dot_product / _other_magnitude;
	}
	
	///@arg vector
	static translate = function(_vector) {
		x += _vector.get_vx();
		y += _vector.get_vy();
	}
	
	static point_dot_product = function(_other_point) {
		return dot_product(x, y, _other_point.x, _other_point.y);	
	}
	
	static point_sum = function(_other_point) {
		var _point = new Point(x, y);
		_point.add(_other_point);
		return _point;
	}
	
	static point_sub = function(_other_point) {
		var _point = new Point(x, y);
		_point.sub(_other_point);
		return _point;	
	}
}