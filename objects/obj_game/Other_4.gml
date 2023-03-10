camera_set_up();
collision_set_up();
bg_tiling_set_up();
particle_system_set_up();

var _kin = kin_create();
if(_kin != noone) {
	camera_follow(_kin);
	obj_camera.x = _kin.x;
	obj_camera.y = _kin.y;
} else {
	obj_camera.x = room_width / 2;
	obj_camera.y = room_height / 2;
}