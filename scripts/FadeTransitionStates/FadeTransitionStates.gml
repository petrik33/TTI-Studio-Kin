function fade_transition_in() {
	with(parent) {
		image_alpha += spd_in;
		if(image_alpha >= 1) {
			if(mid_condition != -1) {
				return new State(self, fade_transition_mid, fade_transition_mid_enter);
			}
			return new State(self, fade_transition_out, fade_transition_out_enter);
		}
	}
	
	return noone;
}

function fade_transition_in_enter() {
	if(parent.on_in != -1) {
		parent.on_in();	
	}
}

function fade_transition_mid_enter() {
	if(parent.on_mid != -1) {
		parent.on_mid();
	}
}

function fade_transition_mid() {
	if(parent.mid_condition()) {
		return new State(parent, fade_transition_out, fade_transition_out_enter);
	}	
	return noone;
}

function fade_transition_out() {
	with(parent) {
		image_alpha -= spd_out;
		if(image_alpha <= 0) {
			return new State(self, fade_transition_end, fade_transition_end_enter);
		}
	}
	
	return noone;
}

function fade_transition_out_enter() {
	if(parent.on_out != -1) {
		parent.on_out();
	}
}

function fade_transition_end() {
		
}

function fade_transition_end_enter() {
	if(parent.on_end != -1) {
		parent.on_end();
	}
	instance_destroy(parent);
}