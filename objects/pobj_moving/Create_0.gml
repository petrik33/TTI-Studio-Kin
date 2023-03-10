event_inherited();

position = new Point(x, y);
velocity = new Vector(0, image_angle);

angular_spd = count_angular_acceleration(max_spd, rotation_time);
rotation_spd = count_rotation_spd(rotation_time);

state_idle = noone;
previous_state = noone;
state = state_idle;

//entity_add_component(new DepthSorted(self,,, depth_sorting_yoffset), COMPONENT_TYPE.DEPTH_SORTED);