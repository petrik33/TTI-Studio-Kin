spd_in = 1 / (time_in * FRAME_RATE);
spd_out = 1 / (time_out * FRAME_RATE);
image_alpha = 0;
state = -1;

state = new State(self, fade_transition_in, fade_transition_in_enter);
state.enter();