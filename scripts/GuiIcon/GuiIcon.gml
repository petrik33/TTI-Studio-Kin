function GuiIcon(
_pos, _sprite, _img = 0,
_draw = draw_icon,
_alpha = 0, _target_alpha = 0.5, _color = c_white ) 
: GuiElement(_pos, _draw, _alpha, _color) constructor {
	sprite = _sprite;
	image = _img;
	target_alpha = _target_alpha;
}

function draw_icon() {
	draw_set_alpha(alpha);
	draw_set_color(color);
	draw_sprite(sprite, image, position.x, position.y);
	draw_reset_alphacolor();
}

function icon_fade_in(_icon_idx, _time = 0.5) {
	var _icon = gui_get_element(_icon_idx);
	
	if(!is_struct(_icon)) {
		return -1;	
	}
	
	var _cur_alpha = _icon.alpha;
	var _alpha_left = _icon.target_alpha - _cur_alpha;
	
	var _anim = new GuiAnimation(ac_icons_in, _alpha_left, _time, _cur_alpha);
	gui_add_animation(_icon_idx, _anim, "alpha");		
}

function icon_flash(_icon_idx, _time = 1) {
	var _icon = gui_get_element(_icon_idx);
	
	if(!is_struct(_icon)) {
		return -1;	
	}
	
	var _cur_alpha = _icon.alpha;
	var _prog = _cur_alpha * 0.5;
	
	var _anim = new GuiAnimation(ac_icon_flash, 1, _time,,,true);
	_anim.progress = _prog;
	gui_add_animation(_icon_idx, _anim, "alpha");	
}

function icon_highlight(_icon_idx, _time = 0.25) {
	var _icon = gui_get_element(_icon_idx);
	
	if(!is_struct(_icon)) {
		return -1;	
	}
	
	var _cur_alpha = _icon.alpha;
	var _alpha_left = 1 - _cur_alpha;
	
	var _anim = new GuiAnimation(ac_icon_highlight, _alpha_left, _time, _cur_alpha);
	gui_add_animation(_icon_idx, _anim, "alpha");	
}

function icon_unhighlight(_icon_idx, _time = 0.25) {
	var _icon = gui_get_element(_icon_idx);
	
	if(!is_struct(_icon)) {
		return -1;	
	}
	
	var _cur_alpha = _icon.alpha;
	var _alpha_left = _cur_alpha - _icon.target_alpha;
	
	if(_alpha_left < 0) {
		return -1;	
	}
	
	var _anim = new GuiAnimation(ac_icon_highlight, _alpha_left, _time, _icon.target_alpha, true);
	gui_add_animation(_icon_idx, _anim, "alpha");	
}

function icon_fade_out(_icon_idx, _time = 0.5) {
	var _icon = gui_get_element(_icon_idx);
	
	if(!is_struct(_icon)) {
		return -1;	
	}
	
	var _cur_alpha = _icon.alpha;
	
	var _anim = new GuiAnimation(ac_icons_out, _cur_alpha, _time,,,true);
	gui_add_animation(_icon_idx, _anim, "alpha");		
}