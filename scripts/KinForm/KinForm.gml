function KinForm(_sprites, _idle_update, _idle_enter, _special_update, _transition_offset,
	_max_spd, _acceleration_spd, _decceleration_spd, _rotation_time, _water_resistance) constructor {
	sprites = _sprites;
	idle_update = _idle_update;
	idle_enter = _idle_enter;
	special_update = _special_update;
	transition_offset = _transition_offset;
	max_spd = _max_spd;
	acceleration_spd = _acceleration_spd;
	decceleration_spd = _decceleration_spd;
	rotation_time = _rotation_time;
	water_resistance = _water_resistance;
	form_components = {};
}

function kin_change_form(_form_enum) {
	current_form = _form_enum;
	var _form = kin_forms[_form_enum];
	
	sprites = _form.sprites;
	form_components = _form.form_components;
	state_idle = new State(self, _form.idle_update, _form.idle_enter);
	form_special_update = _form.special_update;
	
	transition_offset = _form.transition_offset;
	
	entity_change_movement(_form.max_spd, _form.acceleration_spd, _form.decceleration_spd, _form.rotation_time, _form.water_resistance);
	predash_decceleration_spd = count_acceleration(max_spd, predash_decceleration_time);
}

function character_get_form(_form_enum) {
	forms_opened[_form_enum] = true;
	transition_icons_idx[_form_enum - 1] = player_create_icon(_form_enum - 1);
	icon_flash(transition_icons_idx[_form_enum - 1], 2);
	effect_create_target(self, spr_kingperk_vfx);
	audio_play_sound(snd_kin_getperk, 1, false);
}

enum KIN_FORM {
	IDLE,
	SHARK,
	EEL,
	OCTO,
	JELLY,
	NUM
}

enum KIN_SPRITE {
	IDLE = 0,
	MOVING,
	DASHING,
	TRANS_OUT,
	TRANS_IN,
	NUM
}

enum FORM_STATE {
	IDLE,
	PREDASH,
	DASH,
	DASH_START,
	POST_DASH,
	NUM
}