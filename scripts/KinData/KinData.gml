function KinData(_forms_opened, _current_form) constructor {
	forms_opened = _forms_opened;
	current_form = _current_form;
}

function kin_set_data() {
	var _data = new KinData(forms_opened, current_form);
	return _data;
}