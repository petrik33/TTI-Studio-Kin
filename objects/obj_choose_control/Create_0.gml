var _mouse_icon = new GuiTextIcon(new Point(global.gui_w * 3 / 4, global.gui_h / 2), "Mouse", fn_menu, fa_middle, fa_center,,0, 0.5);
var _keyboard_icon = new GuiTextIcon(new Point(global.gui_w  / 4, global.gui_h / 2), "Keyboard", fn_menu, fa_middle, fa_center,,0, 0.5);

icons = array_create(INPUT_TYPE.NUM);

icons[INPUT_TYPE.KEYBOARD] = gui_add_element(_keyboard_icon);
icons[INPUT_TYPE.MOUSE] = gui_add_element(_mouse_icon);

icon_fade_in(icons[INPUT_TYPE.KEYBOARD]);
icon_fade_in(icons[INPUT_TYPE.MOUSE]);

mouse_previous_pos = new Point(-1, -1);
choice_space = global.gui_w / INPUT_TYPE.NUM;

var _tip_icon = new GuiTextIcon(
new Point(global.gui_w / 2, global.gui_h * 0.8),
"Please, see the controls in full description",
, fa_middle, fa_center,,,0.8);

text_icon = gui_add_element(_tip_icon);

icon_fade_in(text_icon);

choice_type = 0;

