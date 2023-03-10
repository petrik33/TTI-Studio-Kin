state.update();

var _view_x = x - camera_half_width;
var _view_y = y - camera_half_height;

_view_x = clamp(_view_x, 0, room_width - camera_width);
_view_y = clamp(_view_y, 0, room_height - camera_height);

camera_set_view_pos(camera_view, _view_x, _view_y);