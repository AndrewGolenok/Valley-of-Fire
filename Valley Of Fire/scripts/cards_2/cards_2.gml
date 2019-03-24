if global.player_rank <= 3
	{ card_all = 3; card_time = 20; card_find_time = 10; min_wait[5,2] = 10; min_time[5,2] = 80; }
if global.player_rank < 7  && global.player_rank >= 4
	{ card_all = 3; card_time = 25; card_find_time = 15; min_wait[5,2] = 10; min_time[5,2] = 90; }
if global.player_rank <= 10 && global.player_rank >= 7
	{ card_all = 3; card_time = 30; card_find_time = 20; min_wait[5,2] = 40; min_time[5,2] = 60; }
if global.player_rank < 13 && global.player_rank > 10
	{ card_all = 2; card_time = 35; card_find_time = 20; min_wait[5,2] = 20; min_time[5,2] = 40; }
if global.player_rank < 15 && global.player_rank >= 13
	{ card_all = 2; card_time = 40; card_find_time = 20; min_wait[5,2] = 40; min_time[5,2] = 20; }
if global.player_rank >= 15
	{ card_all = 2; card_time = 45; card_find_time = 25; min_wait[5,2] = 50; min_time[5,2] = 20; }

card_time      = 15 + global.player_rank * 2;
card_find_time = 10 + global.player_rank;

card_find   = 0;
card_have   = 0;
card_find_a = 10;
card_find_s = 0;
card_what();

for(i = 1; i <= 2; i ++)
	{
	for(j = 1; j <= card_all; j ++)
		{
		card_scale[i,j] = 0.7;
		card_i[i,j]     = card_m[i,j];
		card_now[i,j]   = 3;
		card_end[i,j]   = 0;
		card_alp[i,j]   = 1;
		card_yy[i,j]    = 0;
		}
	}

fir_i = 0;
fir_j = 0;
sec_i = 0;
sec_j = 0;