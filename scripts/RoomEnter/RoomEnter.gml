function camera_set_up(){
	view_enabled = true;
	view_visible[0] = true;

	var _cam = camera_create();
	view_camera[0] = _cam;
	
	manager_create(obj_camera, 
	{
		camera_view: _cam
	});
}

function collision_set_up() {
	var _collision_layer = layer_get_id("Collision");
	
	if(_collision_layer != -1) {
		layer_set_visible(_collision_layer, false);
		global.collision_map = layer_tilemap_get_id(_collision_layer);
	} else {
		global.collision_map = -1;
	}	
}

function particle_system_set_up() {
	if(layer_exists("Effects")) {
		global.part_system = part_system_create_layer("Effects", false);
	} else {
		global.part_system = -1;	
	}
}

function bg_tiling_set_up() {
	var _bg_layer = layer_get_id("Background");
	var _bg_id = layer_background_get_id(_bg_layer);
	var _bg_sprite = layer_background_get_sprite(_bg_id);

	global.bg_tile_w = sprite_get_width(_bg_sprite);
	global.bg_tile_h = sprite_get_height(_bg_sprite);	
}