function camera_follow_update(){
	if(!instance_exists(target)) {
		return;	
	}
	parent.x = lerp(parent.x, target.x, lerp_value);
	parent.y = lerp(parent.y, target.y, lerp_value);
}