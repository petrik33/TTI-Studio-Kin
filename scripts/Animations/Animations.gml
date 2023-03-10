///@arg Instance
///@arg LastFrame
function animation_end(_instance = self, _sprite_last_frame = noone) {
	if(!instance_exists(_instance)) {
		return;
	}
	if(_sprite_last_frame == noone) {
		_sprite_last_frame = _instance.image_number;
	}
	with(_instance) {
		var _sprite_speed = sprite_get_frame_speed(_instance.sprite_index, _instance.image_speed);
		return (_instance.image_index + _sprite_speed >= _sprite_last_frame);
	}
}

///@arg Instance
///@arg LastFrame
function animation_reversed_end(_instance = self, _sprite_last_frame = noone) {
	if(!instance_exists(_instance)) {
		return;
	}
	if(_sprite_last_frame == noone) {
		_sprite_last_frame = 0;
	}
	with(_instance) {
		var _sprite_speed = sprite_get_frame_speed(_instance.sprite_index, _instance.image_speed);
		return (_instance.image_index + _sprite_speed <= _sprite_last_frame);
	}
}

///@arg sprite
///@arg frames_number*
function animation_get_length(_sprite = sprite_index, _frames_number = sprite_get_number(_sprite)){
	var _spr_spd = sprite_get_frame_speed(_sprite, 1);
	return ceil(_frames_number/_spr_spd);
}

function sprite_get_frame_speed(_sprite, _image_speed) {
	var _sprite_speed = 0;
	switch(sprite_get_speed_type(_sprite))
	{
		case spritespeed_framespersecond:
			_sprite_speed = sprite_get_speed(_sprite) * _image_speed/FRAME_RATE;
		break;
		
		case spritespeed_framespergameframe:	
			_sprite_speed = sprite_get_speed(_sprite) * _image_speed;
		break;
	}
	
	return _sprite_speed;
}
