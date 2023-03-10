///@arg font
///@arg valign
///@arg halign
///@arg color
function draw_set_text(_font, _valign, _halign, _color = c_white){
	draw_set_color(_color);
	draw_set_valign(_valign);
	draw_set_halign(_halign);
	draw_set_font(_font);
}

///@arg valign
///@arg halign
function draw_set_align(_valign, _halign) {
	draw_set_valign(_valign);
	draw_set_halign(_halign);
}

function draw_reset_alphacolor() {
	draw_set_alpha(1);
	draw_set_color(c_white);
}