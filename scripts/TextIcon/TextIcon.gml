function GuiTextIcon(
_pos, _text, _font = fn_main,
_valign = fa_top, _halign = fa_left,
_draw = draw_text_icon,
_alpha = 0, _target_alpha = 0.5, _color = c_white ) 
: GuiElement(_pos, _draw, _alpha, _color) constructor {
	text = _text;
	font = _font;
	valign = _valign;
	halign = _halign;
	target_alpha = _target_alpha;
}

function draw_text_icon() {
	draw_set_alpha(alpha);
	draw_set_color(color);
	draw_set_text(font, valign, halign, color);
	draw_text(position.x, position.y, text);
	draw_reset_alphacolor();
}