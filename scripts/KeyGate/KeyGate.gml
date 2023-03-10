function get_key_gate_component(_parent){
	var _component = new ObjectCollider(_parent,,,key_gate_special_cond)
	_component.opened = false;
	return _component;
}

function keys_can_open(_keys, _gate) {
	var _size = array_length(_keys);
	for(var i = 0; i < _size; i++) {
		var _inst_idx = _keys[i];
		if(_inst_idx != -1 && instance_exists(_inst_idx)) {
			if(object_is_child(_gate, _inst_idx.gate_object)) {
				return i;
			}
		}
	}
	
	return -1;
}

function key_gate_special_cond(_inst) {
	if(opened) {
		return true;	
	}
	
	var _form_components = _inst.form_components;
	var _can_open = variable_struct_exists(_form_components, "grabbed_keys");
	if(_can_open) {
		var _open_key = keys_can_open(_form_components.grabbed_keys, parent.object_index);
		if(_open_key != -1) {
			key_use(_form_components.grabbed_keys, _open_key);
			audio_play_sound(snd_oct_keyuse, 1, false);
			with(parent) {
				gate_open();	
			}
			opened = true;
		}
		return true;
	}
	return false;
}

function gate_open() {
	entity_change_sprite(sprite_opened);
}	

function key_use(_keys, _idx) {
	var _key = _keys[_idx];
	array_delete(_keys, _idx, 1);
	instance_destroy(_key);
}