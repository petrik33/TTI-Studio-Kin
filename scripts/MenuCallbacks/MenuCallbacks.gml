function menu_game_start() {
	with(parent) {
		menu_blocked = true;
	}
	instance_destroy(parent);
	room_transition_to(rm_water_backup_bu,,,input_choice_dialog_create, wait_for_dialog_choice);
}

function input_choice_dialog_create() {
	var _dialog = on_gui_create(obj_choose_control);
}

function wait_for_dialog_choice() {
	return !instance_exists(obj_choose_control);	
}

function menu_leave() {
	game_end();	
}