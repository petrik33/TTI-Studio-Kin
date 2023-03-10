if(!menu_blocked) {
	if(menu_keyboard_input()) {
		return;	
	}

	menu_mouse_input();
}