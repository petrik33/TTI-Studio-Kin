function get_movable_component(_parent, _big = false) {
	var _special_cond = movable_special_condition;
	if(_big) {
		_special_cond = movable_big_special_condition;	
	}
	
	var _component = new ObjectCollider(_parent, movable_update,,_special_cond);
	_component.can_be_moved = true;
	return _component;
}

function movable_update() {
	var _collided = false;
	with(parent) {
		_collided = tile_collision(new Point(x, y), global.collision_map);
	}
	can_be_moved = !_collided;	
}

function movable_big_special_condition(_inst) {
	var _can_move = variable_struct_exists(_inst.form_components, "big_moving");
	var _action = _can_move && can_be_moved;
	
	if(_action) {
		_action = movable_special_action(_inst);
	}
	
	return _action;
}


function movable_special_condition(_inst) {
	var _can_move = variable_instance_exists(_inst, "moving");
	var _action = _can_move && can_be_moved;
	
	if(_action) {
		_action = movable_special_action(_inst);
	}
	
	return _action;
}

function movable_special_action(_inst) {
	with(parent) {
		var _velocity = _inst.velocity;
		var _push = abs(angle_difference(_velocity.direction, push_direction)) < push_angle;
		_inst.velocity.direction = push_direction;
	
		if(_push) {
			var _push_x = lengthdir_x(1, push_direction);
			var _push_y = lengthdir_y(1, push_direction);
			
			do {
				x += _push_x;
				y += _push_y;
			} until(!place_meeting(x, y, _inst));
		}
		return _push;
	}
}