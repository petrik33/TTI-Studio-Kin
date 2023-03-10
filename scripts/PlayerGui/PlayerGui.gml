function player_hide_form_icons() {
	for (var i = 0; i < KIN_FORM.NUM - 1; i++) {
		icon_fade_out(transition_icons_idx[i]);
	}	
}

function player_show_form_icons(){
	for (var i = 0; i < KIN_FORM.NUM - 1; i++) {
		if(!forms_opened[i + 1]) {
			continue;	
		}
		
		var _icon_idx = transition_icons_idx[i];
		
		if(!is_struct(gui_get_element(transition_icons_idx[i]))) {
			transition_icons_idx[i] = player_create_icon(i);
		}
		
		icon_fade_in(transition_icons_idx[i]);
	}
}

function player_create_icon(_idx) {
	var _icon = form_icons[_idx];
		
	var _direction = 90 * _idx;
		
	var _vec_fit = global.gui_size.point_sub(form_icon_size);
		
	var _dir_vector = new Vector(1, _direction);
	var _projection = abs(_vec_fit.projection(_dir_vector.toPoint()));
		
	var _position = new Point(global.gui_w / 2, global.gui_h / 2);
	_position.translate(new Vector(_projection / 2 - GUI_BORDER, _direction));
		
	var _elem = new GuiIcon(_position, _icon,,,, transition_icons_alpha_target);	
	
	return gui_add_element(_elem);
}

//function player_highlight_form_icon(_target_form, _reversed = false) {
//	var _prev_anim = transition_icon_animations[_target_form - 1];
//	var _prog = 0;
	
//	if(is_struct(_prev_anim)) {
//		_prog = 1 - _prev_anim.progress;
//		gui_remove_animation(transition_icon_animations[_target_form - 1]);
//		delete transition_icon_animations[_target_form - 1];
//	}
	
//	var _icon = transition_icons[_target_form - 1];
	
//	var _highlight = icon_highlight(_icon, _reversed);
//	_highlight.progress = _prog;
	
//	transition_icon_animations[_target_form - 1] = _highlight;
//}