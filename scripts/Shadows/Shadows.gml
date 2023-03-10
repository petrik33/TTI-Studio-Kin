/// @desc Function Description
/// @param {struct} component Shadow Component containing scale, offset and color
/// @param {asset.gmsprite} [sprite]=sprite_index Description
/// @param {real} [image]=image_index Description
/// @param {real} [x]=x Description
/// @param {real} [y]=y Description
/// @param {real} [xscale]=image_xscale Description
/// @param {real} [yscale]=image_yscale Description
/// @param {real} [angle]=image_angle Description
/// @param {constant.color} [color]=c_gray Description
function sprite_draw_shadow_silhouette(
	_component,
	_sprite = sprite_index, _image = image_index,
	_x = x, _y = y,
	_xscale = image_xscale, _yscale = image_yscale,
	_angle = image_angle)
{
	gpu_set_blendmode_ext(bm_zero, bm_inv_src_alpha);

	draw_sprite_ext(
		_sprite, _image,
		_x, _y + _component.yoffset,
		_xscale * _component.scale, _yscale * _component.scale,
		_angle, c_white, _component.alpha);
	
	gpu_set_blendmode(bm_normal);
}