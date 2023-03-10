enum COMPONENT_TYPE {
	TOROID_WRAPPED = 0,
	OBJECT_COLLIDER,
	NUM
}

function Component (_update, _destructor = -1) constructor {
	update = _update;
	destructor = _destructor;
}

function entity_add_component(_component, _type, _parent = self) {
	_component.parent = _parent;
	components[_type] = _component;
	ds_list_add(active_components_list, _type);
}

function entity_remove_component(_type, _run_destructor = true) {
	var _has_component = ds_list_delete_value(active_components_list, _type);
	if(!_has_component) {
		return false;	
	}
	
	var _component = components[_type];
	
	if(_run_destructor && _component.destructor != -1) {
		_component.destructor();
	}
	
	delete _component;
	components[_type] = -1;
	
	return true;
}