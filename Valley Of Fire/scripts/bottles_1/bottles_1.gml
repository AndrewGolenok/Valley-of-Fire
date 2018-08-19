var sss, sss1;
sss  = "123456";
sss1 = 0;

bottle_all = 0;
bottle_s = 0;
bottle_stage = 0;
bottle_y[1] = 0;
bottle_x[1] = 0;
bottle_n[1] = 0;
bottle_red  = 0;

if global.player_rank <= 3
	{ bottle_all = 5; bottle_red = choose(0, 1); min_time[2,1] = 120; min_wait[2,1] = 100; }
if global.player_rank < 7  && global.player_rank >= 4
	{ bottle_all = 5; bottle_red = choose(0, 0, 1); min_time[2,1] = 100; min_wait[2,1] = 90; }
if global.player_rank < 10 && global.player_rank >= 7
	{ bottle_all = 4; bottle_red = choose(0, 0, 0, 1); min_time[2,1] = 80; min_wait[2,1] = 80; }
if global.player_rank < 13 && global.player_rank >= 10
	{ bottle_all = 4; bottle_red = choose(0, 0, 0, 0, 1); min_time[2,1] = 60; min_wait[2,1] = 80; }
if global.player_rank < 15 && global.player_rank >= 13
	{ bottle_all = 3; bottle_red = choose(0, 0, 0, 0, 1); min_time[2,1] = 30; min_wait[2,1] = 60; }
if global.player_rank >= 15
	{ bottle_all = 2; min_time[2,1] = 20; min_wait[2,1] = 40; }

if bottle_red  = 1 
	{ bottle_stage = bottle_all; }
	else
	{ bottle_stage = 1; }

sss  = string_copy(sss, 1, bottle_all);
for(i=1;i<=bottle_all;i++)
	{
	bottle_destroy[i] = 0;
	sss1 = irandom_range(1, string_length(sss));
	bottle_n[i] = real(string_copy(sss, sss1, 1));
	sss = string_delete(sss, sss1, 1);
	bottle_y[i] = -800;
	bottle_x[i] = 640 - 60 * (bottle_all - 1) + 120 * (i - 1);
	bottle_i[i] = irandom_range(2, 3);
	}