#region Params
camera_width = global.view_w;
camera_height = global.view_h;

camera_half_width = camera_width / 2;
camera_half_height = camera_height / 2;

camera_set_view_size(camera_view, camera_width, camera_height);

#endregion

#region States

#region Follow

state_follow = new State(self, camera_follow_update);
state_follow.lerp_value = 0.1;
state_follow.target = obj_character;

#endregion

state = new State(self, camera_static_update);

#endregion

