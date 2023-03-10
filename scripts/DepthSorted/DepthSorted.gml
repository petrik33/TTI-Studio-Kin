function depth_sorted_update() {
	draw_grid[# 1, grid_row] = instance.y + yoffset;
}

function depth_sorted_destructor() {
	draw_grid[# 0, grid_row] = -1;
	ds_queue_enqueue(garbaged_rows, grid_row);
}

//Fix Destruction (Take sorting into account)

function DepthSorted(_instance, _update = depth_sorted_update, _destructor = depth_sorted_destructor, _yoffset = 0)
	: Component(_update, _destructor) constructor {
	if(_instance == -1) {
		return;	
	}
	
	instance = _instance;
	instance.visible = false;
	
	yoffset = _yoffset;
	
	if(ds_queue_empty(garbaged_rows)) {
		ds_grid_resize(draw_grid, 2, ++grid_size);
		grid_row = grid_size - 1;
	} else {
		grid_row = 	ds_queue_dequeue(garbaged_rows);
	}
	
	draw_grid[# 0, grid_row] = _instance;
	draw_grid[# 1, grid_row] = _instance.y + yoffset;
	
	static draw_grid = ds_grid_create(2, 0);
	static grid_size = 0;
	static garbaged_rows = ds_queue_create();
}


