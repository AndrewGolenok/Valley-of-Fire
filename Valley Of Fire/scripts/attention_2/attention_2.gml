hand_sign_count = 0;
hand_sign_now   = 1;
hand_sign_scale = 1;
for(i = 1; i <= 5; i ++)
	{
	hand_sign[i]    = irandom(2)
	hand_sign_xx[i] = 0;
	hand_sign_ss[i] = 1;
	var ttt, ttt1;
	ttt = "012";
	for(j = 1; j <= 3; j ++)
		{
		ttt1 = irandom_range(1,string_length(ttt));
		hand_sign_z[i,j] = real(string_copy(ttt, ttt1, 1));
		hand_sign_c[j]   = 0.65;
		ttt= string_delete(ttt, ttt1, 1);
		}
	if global.player_rank <= 3
		{ hand_sign_count = 4; hand_sign_red[i] = choose(0, 1); hand_sign_r[i] = choose(1, 0, 0); min_time[4,2] = 20; min_wait[4,2] = 0; }
	if global.player_rank < 7  && global.player_rank >= 4
		{ hand_sign_count = 4; hand_sign_red[i] = choose(0, 0, 1); hand_sign_r[i] = choose(1, 0, 0); min_time[4,2] = 20; min_wait[4,2] = 0; }
	if global.player_rank < 10 && global.player_rank >= 7
		{ hand_sign_count = 3; hand_sign_red[i] = choose(0, 0, 0, 1); hand_sign_r[i] = choose(1, 0, 0, 0); min_time[4,2] = 20; min_wait[4,2] = 0; }
	if global.player_rank < 13 && global.player_rank >= 10
		{ hand_sign_count = 3; hand_sign_red[i] = choose(0, 0, 0, 0, 1); hand_sign_r[i] = 0; min_time[4,2] = 20; min_wait[4,2] = 10; }
	if global.player_rank < 15 && global.player_rank >= 13
		{ hand_sign_count = 2; hand_sign_red[i] = 0; hand_sign_r[i] = 0; min_time[4,2] = 20; min_wait[4,2] = 10; }
	if global.player_rank >= 15
		{ hand_sign_count = 1; hand_sign_red[i] = 0; hand_sign_r[i] = 0; min_time[4,2] = 20; min_wait[4,2] = 10; }
	}