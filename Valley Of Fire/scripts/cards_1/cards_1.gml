if global.player_rank <= 3
	{ card_all = 3; card_time = -1; min_wait[5,1] = 10; min_time[5,1] = 80; }
if global.player_rank < 7  && global.player_rank >= 4
	{ card_all = 3; card_time = -1; min_wait[5,1] = 10; min_time[5,1] = 90; }
if global.player_rank <= 10 && global.player_rank >= 7
	{ card_all = 3; card_time = 30; min_wait[5,1] = 40; min_time[5,1] = 60; }
if global.player_rank < 13 && global.player_rank > 10
	{ card_all = 2; card_time = -1; min_wait[5,1] = 20; min_time[5,1] = 40; }
if global.player_rank < 15 && global.player_rank >= 13
	{ card_all = 2; card_time = 30; min_wait[5,1] = 40; min_time[5,1] = 20; }
if global.player_rank >= 15
	{ card_all = 2; card_time = 40; min_wait[5,1] = 50; min_time[5,1] = 20; }

for(i = 1; i <= 2; i ++)
	{
	for(j = 1; j <= 3; j ++)
		{
		card_scale[i,j] = 0.7;
		card_m[i,j]   = 0;
		card_i[i,j]   = 0;
		card_now[i,j] = 0;
		if j <= card_all
			{ card_end[i,j] = 0; }
			else
			{ card_end[i,j] = 1; }
		
		card_alp[i,j] = 1;
		card_yy[i,j]  = 0;
		}
	}

card_what();
fir_i = 0;
fir_j = 0;
sec_i = 0;
sec_j = 0;