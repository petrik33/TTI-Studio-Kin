if(!claimed) {

	if(place_meeting(x, y, obj_character)) {
		var _form_components = obj_character.form_components;
		var _can_grab = variable_struct_exists(_form_components, "grabbed_keys");
		if(_can_grab) {
			claimed = obj_character;
			array_push(_form_components.grabbed_keys, self);
		}
	} 
	
} else {
	var _form_components = claimed.form_components;
	var _can_grab = variable_struct_exists(_form_components, "grabbed_keys");
	if(!_can_grab) {
		claimed = noone;	
	}
}

alarm[0] = check_frequency;
