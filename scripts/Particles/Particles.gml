global.part_dust = part_type_create();
part_type_alpha2(global.part_dust, 1, 0);
part_type_life(global.part_dust, floor(FRAME_RATE * 1), floor(FRAME_RATE * 2));
part_type_direction(global.part_dust, 0, 359, 0, 0);
part_type_speed(global.part_dust, 1.5, 2, -0.03, 0);
part_type_sprite(global.part_dust, spr_dust_particle, false, false, true);
part_type_size(global.part_dust, 0.8, 1.2, 0.005, 0);
part_type_orientation(global.part_dust, 0, 360, 0, 0, true);

global.part_jelly = part_type_create();
part_type_alpha2(global.part_jelly, 1, 0);
part_type_life(global.part_jelly, floor(FRAME_RATE * 0.8), floor(FRAME_RATE * 1.6));
part_type_direction(global.part_jelly, 0, 359, 0, 0);
part_type_speed(global.part_jelly, 1, 1.5, -0.02, 0);
part_type_sprite(global.part_jelly, spr_medarea_particle, false, false, false);
part_type_size(global.part_jelly, 0.8, 1.2, 0, 0);
part_type_orientation(global.part_jelly, 0, 360, 0, 0, true);