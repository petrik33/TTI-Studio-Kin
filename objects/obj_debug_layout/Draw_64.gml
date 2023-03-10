var _x1 = GUI_BORDER;
var _y1 = GUI_BORDER;

var _x2 = RES_W - GUI_BORDER;
var _y2 = RES_H - GUI_BORDER;

draw_set_align(fa_top, fa_left);
draw_text(_x1, _y1, debug_values[0]);

draw_set_halign(fa_right);
draw_text(_x2, _y1, debug_values[1]);

draw_set_valign(fa_bottom);
draw_text(_x2, _y2, debug_values[2]);

draw_set_halign(fa_left);
draw_text(_x1, _y2, debug_values[3]);
