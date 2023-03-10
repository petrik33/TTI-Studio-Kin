global.gui_w = global.view_w;
global.gui_h = global.view_h;
global.gui_size = new Point(global.gui_w, global.gui_h);

display_set_gui_size(global.gui_w, global.gui_h);

elements = array_create(GUI_MAX_ELEMENTS)
animations = array_create(GUI_MAX_ANIMATIONS);

elements_max_idx = 0;
animations_max_idx = 0;

free_idx_queue_elements = ds_queue_create();
free_idx_queue_animations = ds_queue_create();