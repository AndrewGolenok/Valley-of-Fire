bottle_stage  = 1;
bottle_change = 0;
bottle_end    = 0;
bottle_s      = 1;

for(i = 1; i <= 6; i ++)
	{
	bottle_destroy[i] = 0;
	if bottle_change = 1
		{ bottle_d[i] = choose(1, -1); }
		else
		{ bottle_d[i] = 1; }
	
	if bottle_d[i] = -1
		{ bottle_p[i] = 1; }
		else
		{ bottle_p[i] = 0; }
	bottle_y[i]   = -800;
	bottle_x[i]   = 640 - 60 * (bottle_all - 1) + 120 * (i - 1);
	bottle_i[i]   = irandom_range(2, 3);
	
	if global.player_rank <= 3
		{ bottle_all = 5; bottle_spd[i] = 0.035; bottle_change = choose(0, 1); min_time[2,4] = 90; min_wait[2,4] = 20; }
	if global.player_rank < 7  && global.player_rank >= 4
		{ bottle_all = 5; bottle_spd[i] = 0.03; bottle_change = choose(0, 1); min_time[2,4] = 70; min_wait[2,4] = 20; }
	if global.player_rank < 10 && global.player_rank >= 7
		{ bottle_all = 4; bottle_spd[i] = 0.03; bottle_change = choose(0, 0, 1); min_time[2,4] = 60; min_wait[2,4] = 20; }
	if global.player_rank < 13 && global.player_rank >= 10
		{ bottle_all = 4; bottle_spd[i] = 0.025; bottle_change = choose(0, 0, 0, 1); min_time[2,4] = 40; min_wait[2,4] = 20; }
	if global.player_rank < 15 && global.player_rank >= 13
		{ bottle_all = 3; bottle_spd[i] = 0.02; bottle_change = 0; min_time[2,4] = 30; min_wait[2,4] = 20; }
	if global.player_rank >= 15
		{ bottle_all = 2; bottle_spd[i] = 0.015; bottle_change = 0; min_time[2,4] = 20; min_wait[2,4] = 20; }
	}