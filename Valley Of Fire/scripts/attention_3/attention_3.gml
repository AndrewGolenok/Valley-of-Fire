for(i=1;i<=6;i++)
	{
	horse_p[i]   = choose(-1, 1);
	horse_n[i]   = 0;
	horse_y[i]   = 0;
	horse_red[i] = 1;
	}
horse_yy      = 0;
horse_now     = 0;
horse_death   = 0;
horse_death_y = 0;
horse_death_a = 1;

for(i=1;i<=6;i++)
	{
	if global.player_rank <= 3
			{ horse_count = 6; horse_red[i] = choose(1, -1); min_time[4,3] = 100; min_time[4,3] = 10; }
		if global.player_rank < 7  && global.player_rank >= 4
			{ horse_count = 5; horse_red[i] = choose(1,-1); min_time[4,3] = 90; min_time[4,3] = 10; }
		if global.player_rank < 10 && global.player_rank >= 7
			{ horse_count = 5; horse_red[i] = choose(1, 1, -1); min_time[4,3] = 80; min_time[4,3] = 10; }
		if global.player_rank < 13 && global.player_rank >= 10
			{ horse_count = 4; horse_red[i] = choose(1, 1, 1, -1); min_time[4,3] = 70; min_time[4,3] = 10; }
		if global.player_rank < 15 && global.player_rank >= 13
			{ horse_count = 4; min_time[4,3] = 60; min_time[4,3] = 10; }
		if global.player_rank >= 15
			{ horse_count = 3; min_time[4,3] = 30; min_time[4,3] = 10; }
	horse_p[i] = choose(-1, 1);
	horse_n[i] = 0;
	}