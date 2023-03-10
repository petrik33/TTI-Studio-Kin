var _pause = keyboard_check_pressed(vk_escape);

if(_pause) {
	global.game_is_paused = !global.game_is_paused;
	if(global.game_is_paused) {
		audio_pause_sound(game_music);
		with(pobj_entity) {
			image_speed_on_pause = image_speed;
			image_speed = 0;	
		}
	} else {
		with(pobj_entity) {
			image_speed = image_speed_on_pause;	
		}
		audio_resume_sound(game_music);
	}
}