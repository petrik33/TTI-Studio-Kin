function Waving(_amplitude, _period, _start_buffer = START_BUFF, _oscillation_offset = 0) constructor{
	amplitude = _amplitude;
	spd = PI_2 / (_period * FRAME_RATE);
	oscillation_offset = _oscillation_offset;
	start_buffer = _start_buffer;
	direction = -1;
	active = false;
	finished = false;
	
	start_timer = start_buffer;
	progress = oscillation_offset;
	
	static update_acceleration = function() {
		progress += spd;
		if(progress >= (PI_2 + oscillation_offset)) {
			finished = true;
			progress = progress % (PI_2 + oscillation_offset);	
		}
		
		return (-amplitude * sqr(spd) * cos(progress));
	}
	
	static set = function(_direction) {
		direction = _direction;
		active = true;
	}
	
	static reset = function() {
		active = false;
		finished = false;
		start_timer = start_buffer;
		progress = oscillation_offset;	
	}
}