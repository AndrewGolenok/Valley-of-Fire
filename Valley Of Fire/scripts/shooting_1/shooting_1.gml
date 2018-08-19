aim_now   = 1;
aim_max_r = 0;
aim_all   = 5;

var aim_txt, aim_ran;
aim_txt = "12345";

for(i=1;i<=5;i++)
	{
	if global.player_rank <= 3
		{ aim_all = 5; aim_r[i] = choose(1, 0); min_wait[6,1] = 30; min_time[6,1] = 110; }
	if global.player_rank < 7  && global.player_rank >= 4
		{ aim_all = 4; aim_r[i] = choose(1, 0, 0); min_wait[6,1] = 30; min_time[6,1] = 80; }
	if global.player_rank <= 10 && global.player_rank >= 7
		{ aim_all = 4; aim_r[i] = choose(1, 0, 0, 0); min_wait[6,1] = 30; min_time[6,1] = 80; }
	if global.player_rank < 13 && global.player_rank > 10
		{ aim_all = 3; aim_r[i] = choose(1, 0, 0, 0, 0); min_wait[6,1] = 30; min_time[6,1] = 50; }
	if global.player_rank < 15 && global.player_rank >= 13
		{ aim_all = 3; aim_r[i] = 0; min_wait[6,1] = 30; min_time[6,1] = 50; }
	if global.player_rank >= 15
		{ aim_all = 2; aim_r[i] = 0; min_wait[6,1] = 30; min_time[6,1] = 30; }
	aim_t[i] = 20 + global.player_rank * 4;
	}

for(i=1;i<=aim_all;i++)
	{
	aim_ran  = irandom_range(1, string_length(aim_txt));
	aim_n[i] = real(string_copy(aim_txt,aim_ran,1));
	aim_txt  = string_delete(aim_txt,aim_ran,1);
	
	//aim_t[i] = 60//90;
	//aim_r[i] = choose(1,0); //0;
	aim_max_r += aim_r[i];
	if aim_max_r > 2
		{ aim_r[i] = 0; aim_max_r -= aim_r[i]; }
		
	aim_a[i] = 0;
	aim_s[i] = 0;
	aim_d[i] = 0;
	aim_p[i] = 0;
	}