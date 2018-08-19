hat_x[1]  = 640 - 200;
hat_xn[1] = 640 - 200;
hat_y[1]  = 0;
hat_s[1]  = 1;
hat_h[1]  = 0;
		
hat_x[2]  = 640;
hat_xn[2] = 640;
hat_y[2]  = 150;
hat_s[2]  = 1;
hat_h[2]  = 1;
		
hat_x[3]  = 640 + 200;
hat_xn[3] = 640 + 200;
hat_y[3]  = 0;
hat_s[3]  = 1;
hat_h[3]  = 0;
		
hat_spd  = 20;
hat_cha  = choose(1, 3);
hat_sha  = 2;
hat_num  = 1;
hat_max  = 7;
hat_res  = -1;
hat_end  = 0;
		
hat_stage = 0;
hat_timer = 20;
hat_alpha[1] = 1;
hat_alpha[2] = 1;
hat_alpha[3] = 1;

if global.player_rank <= 3
	{ hat_max = 7; min_time[4,1] = 20; min_wait[4,1] = 60; }
if global.player_rank < 7  && global.player_rank >= 4
	{ hat_max = 7; min_time[4,1] = 20; min_wait[4,1] = 50; }
if global.player_rank < 10 && global.player_rank >= 7
	{ hat_max = 6; min_time[4,1] = 20; min_wait[4,1] = 40;}
if global.player_rank < 13 && global.player_rank >= 10
	{ hat_max = 5; min_time[4,1] = 20; min_wait[4,1] = 30; }
if global.player_rank < 15 && global.player_rank >= 13
	{ hat_max = 4; min_time[4,1] = 20; min_wait[4,1] = 30; }
if global.player_rank >= 15
	{ hat_max = 3; min_time[4,1] = 20; min_wait[4,1] = 30; }
	
hat_spd = 45 - global.player_rank * 2;