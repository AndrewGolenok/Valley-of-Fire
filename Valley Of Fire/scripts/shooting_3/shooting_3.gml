//targetk_spd = 5;
//targetk_all = 5;
targetk_ang = 0;
knife_spd   = 50;
knife_now   = 1;

if global.player_rank <= 3
	{ targetk_all = 5; min_wait[6,2] = 30; min_time[6,2] = 110; }
if global.player_rank < 7  && global.player_rank >= 4
	{ targetk_all = 4; min_wait[6,2] = 30; min_time[6,2] = 90; }
if global.player_rank <= 10 && global.player_rank >= 7
	{ targetk_all = 3; min_wait[6,2] = 30; min_time[6,2] = 60; }
if global.player_rank < 13 && global.player_rank > 10
	{ targetk_all = 3; min_wait[6,2] = 30; min_time[6,2] = 60; }
if global.player_rank < 15 && global.player_rank >= 13
	{ targetk_all = 2; min_wait[6,2] = 30; min_time[6,2] = 40; }
if global.player_rank >= 15
	{ targetk_all = 1; min_wait[6,2] = 30; min_time[6,2] = 40; }

targetk_spd = 6 - global.player_rank / 15;

var txt, txt1;
txt = "12345";

for(i = 1; i <= targetk_all; i ++)
	{
	txt1 = irandom_range(1, string_length(txt));
	targetk_n[i] = real(string_copy(txt, txt1, 1));
	txt = string_delete(txt, txt1, 1);
	targetk_d[i] = 0;
	}
	
for(i = 1; i <= 6; i ++)
	{
	knife_y[i] = global.height / 2;
	knife_x[i] = 640 - 170;
	
	knife_d[i] = -1;
	knife_a[i] = 0;
	knife_n[i] = 0;
	
	knife_a1[i] = 0;
	}