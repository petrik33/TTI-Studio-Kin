function ObjectCollider(_parent, _update = -1, _destructor = object_collider_destructor,
	_special_condition = noone) 
	: Component(_update, _destructor) constructor {
	special_condition = _special_condition;
	ds_list_add(global.collide_objects, _parent);
}

function object_collider_destructor() {
	ds_list_delete(global.collide_objects, ds_list_find_index(global.collide_objects, parent));	
}