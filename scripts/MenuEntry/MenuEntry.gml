function MenuEntry(_parent, _text, _callback) constructor {
	parent = _parent;
	text = _text;
	callback = _callback;
}

function menu_create_icon_from_entry(_parent, _entry, _idx) {
	var _cur_alpha = menu_target_alpha;
	var _pos = new Point(x, y + _idx * entry_space);
	var _icon = new GuiTextIcon(_pos, _entry.text, menu_font, menu_valign, menu_halign,,0, menu_target_alpha);
	var _icon_idx = gui_add_element(_icon);
	icon_fade_in(_icon_idx, menu_icon_fade_in);
	if(_idx == current_entry) {
		icon_highlight(_icon_idx, menu_icon_fade_in);
	}
	return _icon_idx;
}

