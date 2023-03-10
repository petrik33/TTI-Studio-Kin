function Vector(_magnitude, _direction) constructor {
	magnitude = _magnitude;
	direction = _direction;
	
	static get_vx = function() {
		return lengthdir_x(magnitude, direction);	
	}
	
	static get_vy = function() {
		return lengthdir_y(magnitude, direction);	
	}
	
	static toPoint = function() {
		return new Point(get_vx(), get_vy());	
	}
	
	///@arg vector
	static add = function(_other_vector) {
		var _point_this = toPoint();
		var _point_other = _other_vector.toPoint();
		
		var _vector_sum = _point_this.point_sum(_point_other).toVector();
		
		magnitude = _vector_sum.magnitude;
		direction = _vector_sum.direction;
	}
	
	static sub = function(_other_vector) {
		var _point_this = toPoint();
		var _point_other = _other_vector.toPoint();
		
		var _vector_sub = _point_this.point_sub(_point_other).toVector();
		
		magnitude = _vector_sub.magnitude;
		direction = _vector_sub.direction;
	}
	
	static projection = function(_other_vec) {
		var _dot_product = vec_dot_product(_other_vec);
		return _dot_product / _other_vec.magnitude;
	}
	
	static vec_dot_product = function(_other_vector) {
		return dot_product(get_vx(), get_vy(), _other_vector.get_vx(), _other_vector.get_vy());	
	}
	
	static vec_sum = function(_other_vector) {
		var _vector = new Vector(magnitude, direction);
		_vector.add(_other_vector);
		return _vector;
	}
	
	static vec_sub = function(_other_vector) {
		var _vector = new Vector(magnitude, direction);
		_vector.sub(_other_vector);
		return _vector;
	}
}	