var stats_xx, stats_yy, stats_ss;
stats_xx = 640;
stats_yy = global.size / 2;
stats_ss = argument0;
draw_primitive_begin(pr_trianglefan);
	draw_vertex(stats_xx + lengthdir_x(stats_ss, 90),  stats_yy + lengthdir_y(stats_ss, 90));
	draw_vertex(stats_xx + lengthdir_x(stats_ss, 160), stats_yy + lengthdir_y(stats_ss, 160));
	draw_vertex(stats_xx + lengthdir_x(stats_ss, 235), stats_yy + lengthdir_y(stats_ss, 235));
	draw_vertex(stats_xx + lengthdir_x(stats_ss, 305), stats_yy + lengthdir_y(stats_ss, 305));
	draw_vertex(stats_xx + lengthdir_x(stats_ss, 380), stats_yy + lengthdir_y(stats_ss, 380));
draw_primitive_end();