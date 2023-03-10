if(!variable_instance_exists(self, "active_components_list")) {
	return;	
}

if(ds_exists(active_components_list, ds_type_list)) {
	ds_list_destroy(active_components_list);
}