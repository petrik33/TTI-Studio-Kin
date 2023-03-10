if(place_meeting(x, y, obj_character)) {
	if(transition_text_enum == -1) {
		room_transition_to(target_room);
	} else {
		room_transition_to_text(target_room, global.stories[transition_text_enum]);	
	}
	instance_destroy();
}

alarm[0] = check_frequency;