function effect_create(_x, _y, _sprite, _fade_away = false) {
	return instance_create_layer(_x, _y, "Effects", pobj_effect, {
		fade_out: _fade_away,
	});	
}

function effect_create_target(_target, _sprite, _offset = new Point(0, 0), _angle_offset = 0, _fade_away = false) {
	return instance_create_layer(_target.x, _target.y, "Effects", pobj_effect_target, {
		fade_out: _fade_away,
		target: _target,
		offset: _offset.toVector(),
		angle_offset: _angle_offset,
	});		
}

function dust_create_point(_x, _y, _power = EFFECT_POWER.NORMAL) {
	var _min_part = 3;
	var _max_part = 5;
	
	part_particles_create(global.part_system, _x, _y, global.part_dust, irandom_range(_min_part, _max_part));
}

function jelly_part_create_point(_x, _y, _power = EFFECT_POWER.NORMAL) {
	var _min_part = 3;
	var _max_part = 5;
	
	part_particles_create(global.part_system, _x, _y, global.part_jelly, irandom_range(_min_part, _max_part));
}