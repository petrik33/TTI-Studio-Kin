// Inherit the parent event
event_inherited();

#region Sprites

sprites = -1;
sprite_diving = spr_kin_diving;
sprite_surfacing = spr_kin_surfacing;
sprite_mid_transition = spr_kin_mid_transition;


sprite_moving_forms = [spr_kin_moving, spr_kin_shark_moving, spr_kin_oct_moving, spr_kin_eel_moving, spr_kin_medusa_moving];
sprite_moving_id = 0;

#endregion

#region Variables

stopped = false;

//max_spd_part = 1;

//predash_decceleration_spd = count_acceleration(max_spd, predash_decceleration_time);
//var _predash_decceleration_buffer = START_BUFF;

form_components = {};

moving = true;

form_special_update = -1;

transition_offset = -1;
transition_icons_idx = array_create(KIN_FORM.NUM - 1, -1);
//transition_icon_animations_idx = array_create(KIN_FORM.NUM - 1, -1);

#endregion

#region Forms

#region Structs

var _form_kin = new KinForm(
	[spr_kin_idle_uw, spr_kin_moving, spr_kin_speeding, spr_kin_transition1, spr_kin_transition3],
	kin_idle_update, character_idle_enter, kin_special_update,
	new Point(0, 0),
	1.8, 0.1, 0.05, 1.25, 0.8);

var _form_shark = new KinForm(
	[spr_kin_shark_idle, spr_kin_shark_moving, spr_kin_shark_moving, -1, spr_kin_transition2_shark],
	shark_idle_update, character_idle_enter, shark_special_update,
	new Point(12, 0),
	2.25, 0.2, 0.1, 1.1, 0.75
)

var _form_octo = new KinForm(
	[spr_kin_oct_idle, spr_kin_oct_moving, spr_kin_oct_moving, -1, spr_kin_transition2_oct],
	octo_state_idle, character_idle_enter, octo_special_update,
	new Point(13, 0),
	1.6, 0.05, 0.05, 1.25, 1
)

var _form_eel = new KinForm(
	[spr_kin_eel_idle, spr_kin_eel_moving, spr_kin_eel_moving, -1, spr_kin_transition2_eel],
	eel_state_idle, character_idle_enter, eel_special_update,
	new Point(4, 0),
	2, 0.1, 0.1, 1.33, 1
)

var _form_jelly = new KinForm(
	[spr_kin_med_idle, spr_kin_medusa_moving, spr_kin_medusa_moving, -1, spr_kin_transition2_med],
	jelly_idle_update, jelly_idle_enter, jelly_special_update,
	new Point(9, -1),
	1, 0.05, 0.05, 1, 1.33
)

_form_kin.form_components = {
	dash: new Dash(4, 11)
};


_form_shark.form_components = {
	dash: new Dash(6, 1),
	waving: new Waving(8, 1.2, START_BUFF/2),
	big_moving: true
};

_form_octo.form_components = {
	dash: new Dash(4, 1),
	grabbed_keys: array_create(MAX_KEYS, -1),
};

_form_eel.form_components = {
	waving: new Waving(8, 1.5, START_BUFF/2),
	hiding: new Hiding(4, 1, 80, spr_kin_eel_hiding, spr_kin_eel_leavehole),
};

_form_jelly.form_components = {
	dash: new Dash(4.5, 6),
	jelly_spirit: new JellySpirit(80, 1, spr_medusaskill_vfx),
};

#endregion

form_icons = [
	spr_shark_ico,
	spr_eel_ico,
	spr_oct_ico,
	spr_med_ico
];

form_icon_size = new Point(sprite_get_width(spr_shark_ico), sprite_get_height(spr_shark_ico));

kin_forms = [
	_form_kin,
	_form_shark,
	_form_eel,
	_form_octo,
	_form_jelly
];

#endregion

#region Components

shadow = new ShadowSilhouette(6, 1.25, 0.5);
//entity_add_component(new ToroidWrap(), COMPONENT_TYPE.TOROID_WRAPPED);

#endregion

#region Input

var _input_idle_keyboard = new PlayerInputKeyboard(self);
var _input_idle_mouse = new PlayerInputMouse(self);

input_structs = array_create(INPUT_TYPE.NUM);
input_structs[INPUT_TYPE.KEYBOARD] = _input_idle_keyboard;
input_structs[INPUT_TYPE.MOUSE] = _input_idle_mouse;

input = input_structs[global.input_type];

#endregion

#region States

state_shift = noone;

kin_change_form(current_form);
state = state_idle;
sprite_index = sprites[KIN_SPRITE.MOVING];

#endregion
