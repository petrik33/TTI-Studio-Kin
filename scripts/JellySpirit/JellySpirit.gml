function JellySpirit(_range, _cooldown, _sprite) constructor {
	range = _range;
	cooldown_buffer = _cooldown;
	cooldown = 0;
	cooldown_finished = false;
	sprite = _sprite;
	
	static available = function() {
		if(cooldown <= 0) {
			return true;	
		}
		
		cooldown--;
		return false;
	}
	
	static reset = function() {
		cooldown_finished = false;
		cooldown = cooldown_buffer * FRAME_RATE;	
	}
	
	static open_in_range = function(_position) {
		var _opened = ds_list_create();
		var _opened_num = collision_circle_list(_position.x, _position.y, range, obj_spirit_gate, false, false, _opened, false);
		for(var i = 0;i < _opened_num; i++) {
			var _gate = _opened[| i];
			with(_gate) {
				audio_play_sound(snd_spiritgare_open, 1, false, 0.5);
				gate_open();
				var _collider = components[COMPONENT_TYPE.OBJECT_COLLIDER];
				_collider.opened = true;
			}
		}
	}
}