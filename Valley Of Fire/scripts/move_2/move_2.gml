hand_scale = 0;
hand_angle = 0;
hand_now   = 1;
hand_speed = 16 - global.player_rank / 2;

hand_true[1] = 0;
hand_red[1]  = 0;

if global.player_rank <= 3
	{
	hand_red[i] = choose(0, 1);
	min_time[3,2] = 60;
	hand_true[1] = irandom(359);
	}
if global.player_rank < 7  && global.player_rank >= 4
	{
	hand_red[i] = choose(0, 0, 1);
	min_time[3,2] = 50;
	hand_true[1] = choose(0, 90, 180, 270, 360, 45, 135, 30, 225, 315, 60, 150);
	}
if global.player_rank < 10 && global.player_rank >= 7
	{
	hand_red[i] = choose(0, 0, 0, 1);
	min_time[3,2] = 40;
	hand_true[1] = choose(0, 90, 180, 270, 360, 45, 135, 30, 225, 60);
	}
if global.player_rank < 13 && global.player_rank >= 10
	{
	hand_red[i] = choose(0, 0, 0, 0, 1);
	min_time[3,2] = 40;
	hand_true[1] = choose(0, 90, 180, 270, 360, 45, 30, 60);
	}
if global.player_rank < 15 && global.player_rank >= 13
	{
	min_time[3,2] = 30;
	hand_true[1] = choose(0, 90, 180, 270, 360);
	}
if global.player_rank >= 15
	{
	min_time[3,2] = 30;
	hand_true[1] = choose(0, 90, 180, 360);
	}
		
	
//if global.player_rank > 10
//	{ hand_true[1] = choose(0, 90, 180, 270, 360); }
//if global.player_rank <= 10 && global.player_rank > 5
//	{
//	hand_red[1]   = choose(0, 0, 1);
//	hand_true[1]  = choose(0, 90, 180, 270, 360, 45, 135, 30, 225, 315, 60, 150, 300, 330);
//	}
//if global.player_rank <= 5
//	{ hand_red[1] = irandom(1); hand_true[1] = irandom(359); }