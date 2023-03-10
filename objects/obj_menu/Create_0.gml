logo_sprite = spr_logo;

menu_blocked = false;

menu_icon_fade_in = 0.25;
menu_icon_highlight = 0.1;

mouse_previous_pos = new Point(-1, -1);

current_entry = 0;
entries = [
	new MenuEntry(self, "Start", menu_game_start),
	new MenuEntry(self, "Exit", menu_leave)
];

entries[0].target_room = rm_tutorial_old;

entries_num = array_length(entries);
menu_icons = array_create(entries_num, -1);

menu_set_spacing(menu_x, menu_y, menu_halign, menu_valign, menu_width, menu_height, menu_border, entries_num);

for(var i = 0; i < entries_num; i++) {
	menu_icons[i] = menu_create_icon_from_entry(self, entries[i], i);	
}