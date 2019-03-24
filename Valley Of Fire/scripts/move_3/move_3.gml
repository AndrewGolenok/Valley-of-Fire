hand_scale = 0;
hand_angle = 0;
hand_now   = 1;
hand_speed = 16 - global.player_rank / 2; //23 - global.player_rank;

for(i = 1; i <= 6; i ++)
	{
	hand_true[i] = 0;
	hand_red[i]  = 0;
	if global.player_rank <= 3
		{ hand_count = 4; hand_red[i] = choose(0, 1); min_time[3,3] = 80; min_wait[3,3] = 10; }
	if global.player_rank < 7  && global.player_rank >= 4
		{ hand_count = 4; hand_red[i] = choose(0, 0, 1); min_time[3,3] = 60; min_wait[3,3] = 10; }
	if global.player_rank < 10 && global.player_rank >= 7
		{ hand_count = 3; hand_red[i] = choose(0, 0, 0, 1); min_time[3,3] = 60; min_wait[3,3] = 10; }
	if global.player_rank < 13 && global.player_rank >= 10
		{ hand_count = 3; hand_red[i] = choose(0, 0, 0, 0, 1); min_time[3,3] = 50; min_wait[3,3] = 10; }
	if global.player_rank < 15 && global.player_rank >= 13
		{ hand_count = 2; min_time[3,3] = 40; min_wait[3,3] = 10; }
	if global.player_rank >= 15
		{ hand_count = 1; min_time[3,3] = 20; min_wait[3,3] = 10; }
	
	if global.player_rank > 10
		{
		if global.player_rank = 1
			{ hand_true[i] = choose(0, 90, 180, 360); }
			else
			{ hand_true[i] = choose(0, 90, 180, 270, 360); }
		}
	if global.player_rank <= 10 && global.player_rank > 5
		{ hand_true[i] = choose(0, 90, 180, 270, 360, 45, 135, 30, 225, 315, 60, 150, 300, 330); }
	if global.player_rank <= 5
		{ hand_true[i] = irandom(359); }
	}