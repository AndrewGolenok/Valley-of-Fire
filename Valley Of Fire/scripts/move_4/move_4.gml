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
			{ horse_count = 6; horse_red[i] = choose(1, -1); min_time[3,4] = 100; }
		if global.player_rank < 7  && global.player_rank >= 4
			{ horse_count = 5; horse_red[i] = choose(1,-1); min_time[3,4] = 90; }
		if global.player_rank < 10 && global.player_rank >= 7
			{ horse_count = 5; horse_red[i] = choose(1, 1, -1); min_time[3,4] = 80; }
		if global.player_rank < 13 && global.player_rank >= 10
			{ horse_count = 4; horse_red[i] = choose(1, 1, 1, -1); min_time[3,4] = 70; }
		if global.player_rank < 15 && global.player_rank >= 13
			{ horse_count = 4; min_time[3,4] = 60; }
		if global.player_rank >= 15
			{ horse_count = 3; min_time[3,4] = 30; }
	horse_p[i] = choose(-1, 1);
	horse_n[i] = 0;
	}

if 0
	{
	#region 15 rank
		if global.player_rank = 15
			{
			horse_p[1] = choose(-1, 1);
			horse_p[2] = choose(-1, 1);
			horse_p[3] = choose(-1, 1);
			horse_p[4] = choose(-1, 1);
			}
	#endregion
	#region 10 rank
		if global.player_rank = 10
			{
			horse_p[1] = choose(-1, 1);
			horse_p[2] = choose(-1, 1);
			horse_p[3] = choose(-1, 1);
			horse_p[4] = choose(-1, 1);
			}
	#endregion
	#region 5 rank
		if global.player_rank = 5
			{
			horse_p[1] = choose(-1, 1);
			horse_p[2] = choose(-1, 1);
			horse_p[3] = choose(-1, 1);
			horse_p[4] = choose(-1, 1);
			}
	#endregion
	}