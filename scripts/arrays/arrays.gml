function array_has(_id, _value){
	var _size = array_length(_id);
	for(var i = 0; i < _size; i++) {
		if(_id[i] == _value) {
			return true;	
		}
	}
	return false;
}