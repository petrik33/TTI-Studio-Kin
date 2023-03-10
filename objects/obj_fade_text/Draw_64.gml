draw_set_color(color);
draw_set_alpha(image_alpha);

draw_set_text(font, fa_middle, fa_center);
draw_text_ext(global.gui_w / 2, global.gui_h / 2, text,-1, global.gui_w / 2);

draw_reset_alphacolor();