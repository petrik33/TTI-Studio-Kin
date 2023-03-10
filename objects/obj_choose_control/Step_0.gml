if(input_choose_keyboard() || input_choose_mouse()) {
	global.input_type = choice_type;
	instance_destroy();
}