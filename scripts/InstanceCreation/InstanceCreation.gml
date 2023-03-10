/// @desc on_gui_create Description
/// @param {asset.gmobject} _object Description
/// @param {struct} [_var_struct]={} Description
/// @param {real} [_x]=0 Description
/// @param {real} [_y]=0 Description
/// @returns {id} Description
function on_gui_create(_object, _var_struct = {}, _x = 0, _y = 0){
	return instance_create_layer(_x, _y, "GUI", _object, _var_struct);
}

function manager_create(_object, _var_struct = {}){
	return instance_create_layer(0, 0, "Managers", _object, _var_struct);
}

function kin_create(_kin_struct = global.kin_data) {
	var _spawner = instance_find(obj_player_spawn, 0);
	var _kin = noone;
	
	if(_spawner != noone) {
		_kin_struct.image_angle = _spawner.kin_direction;
		_kin = instance_create_layer(_spawner.x, _spawner.y, "Instances", obj_character, _kin_struct);
	}
	
	return _kin;
}