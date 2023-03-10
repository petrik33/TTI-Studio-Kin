var _window_width = display_get_width();
var _window_height = display_get_height();

if(DEBUG) {
	_window_width /= 2;
	_window_height /= 2;
}

global.debug1 = 0;
global.debug2 = 0;
global.debug3 = 0;
global.debug4 = 0;

global.view_w = RES_W;
global.view_h = RES_H;
global.view_size = new Point(global.view_w, global.view_h);

global.collide_objects = ds_list_create();

game_music = audio_play_sound(snd_dive_soundtrack1, 1, true);

window_set_size(_window_width, _window_height);
//Resize surface
alarm[0] = 1;

//manager_create(obj_debug_layout);
manager_create(obj_gui_drawer);

var _kin_start_forms = array_create(KIN_FORM.NUM, DEBUG);
_kin_start_forms[0] = true;
global.kin_data = new KinData(_kin_start_forms, KIN_FORM.IDLE);

room_goto(rm_surface_bu);