if(ds_exists(global.collide_objects, ds_type_list)) {
	ds_list_clear(global.collide_objects);
}

part_system_destroy(global.part_system);