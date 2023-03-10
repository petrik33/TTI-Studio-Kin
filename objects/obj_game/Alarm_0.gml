///@desc resize app surface
window_center();
var _window_w = window_get_width();
var _window_h = window_get_height();

_window_w += _window_w % 2;
_window_h += _window_h % 2;

surface_resize(application_surface, _window_w, _window_h);