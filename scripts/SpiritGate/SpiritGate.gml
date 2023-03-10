function get_spirit_gate_component(_parent){
	var _component = new ObjectCollider(_parent,,,spirit_gate_special_cond)
	_component.opened = false;
	return _component;
}

function spirit_gate_special_cond(_inst) {
	return opened;
}