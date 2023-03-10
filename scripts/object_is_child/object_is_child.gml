function object_is_child(_checked_object, _parent_object){
	return object_is_ancestor(_checked_object, _parent_object) || _checked_object == _parent_object;
}