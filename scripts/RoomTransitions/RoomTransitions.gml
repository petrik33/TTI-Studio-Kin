function room_transition_to(_room, _time = 1, _on_in = -1, _on_mid = -1, _mid_condition = -1, _struct = {}) {
	
	var _transition = on_gui_create(obj_fade_transition, {
		time_in: _time / 2,
		time_out: _time / 2,
		on_in: _on_in,
		on_mid: _on_mid,
		mid_condition: _mid_condition,
		target_room: _room,
		on_out: room_goto_target,
		target_struct: _struct,
	})
	
	return _transition;
}

function room_transition_to_text(_room, _text, _time = 1, _text_time = 20, _font = fn_main) {
	
	var _target_struct = {
		target_time: _time,
		target_read_time: _text_time * FRAME_RATE,
		target_text: _text,
		target_font: _font
	}
	
	var _transition = room_transition_to(_room, _time, , fade_text_create_target, fade_text_ended, _target_struct);
	
	return _transition;
}

function fade_text_ended() {
	var _skip = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
	return _skip || !instance_exists(obj_fade_text);
}

function fade_text_create_target() {
	var _fade = on_gui_create(obj_fade_text, {
		time_in: target_struct.target_time / 2,
		time_out: target_struct.target_time / 2,
		mid_condition: mid_condition_timer,
		timer: target_struct.target_read_time,
		text: target_struct.target_text,
		font: target_struct.target_font
	})
	
	return _fade;
}

function mid_condition_timer() {
	if(timer <= 0) {
		return true;	
	}
	timer--;
}

function room_goto_target() {
	room_goto(target_room);
}