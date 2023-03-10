if(place_meeting(x, y, obj_character)) {
	with(obj_character) {
		character_get_form(other.form_id);
	}
	instance_destroy();
}

alarm[0] = check_frequency;