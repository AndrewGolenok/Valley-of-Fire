bottle_stage = 1;
bottle_red_a = 0;

for(i=1;i<=6;i++)
	{
	bottle_y[i]   = - 140;
	bottle_i[i]   = irandom_range(2, 3);
	bottle_x[i]   = irandom_range(280, 1000);
	bottle_destroy[i] = 0;
	
	if global.player_rank <= 3
		{ bottle_all = 6; bottle_spd[i] = global.size / 20; bottle_r[i] = choose(0, 1); min_time[2,3] = 150; min_wait[2,3] = 60; }
	if global.player_rank < 7  && global.player_rank >= 4
		{ bottle_all = 6; bottle_spd[i] = global.size / 25; bottle_r[i] = choose(0, 1); min_time[2,3] = 120; min_wait[2,3] = 60; }
	if global.player_rank < 10 && global.player_rank >= 7
		{ bottle_all = 5; bottle_spd[i] = global.size / 30; bottle_r[i] = choose(0, 0, 1); min_time[2,3] = 100; min_wait[2,3] = 40; }
	if global.player_rank < 13 && global.player_rank >= 10
		{ bottle_all = 5; bottle_spd[i] = global.size / 35; bottle_r[i] = choose(0, 0, 1); min_time[2,3] = 60; min_wait[2,3] = 40; }
	if global.player_rank < 15 && global.player_rank >= 13
		{ bottle_all = 4; bottle_spd[i] = global.size / 40; bottle_r[i] = choose(0, 0, 0, 1); min_time[2,3] = 50; min_wait[2,3] = 40; }
	if global.player_rank >= 15
		{ bottle_all = 3; bottle_spd[i] = global.size / 45; bottle_r[i] = 0; min_time[2,3] = 20; min_wait[2,3] = 40; }
	bottle_r[i] = 0;
	bottle_red_a += bottle_r[i];
	if bottle_red_a > 2
		{ bottle_r[i] = 0; bottle_red_a -= 1; }
	}


/*
bottle_t[2] = 0;
bpttle_t[3] = 0;

bottle_p[2] = 0;
bpttle_p[3] = 0;

bottle_v[2] = 0;
bpttle_v[3] = 0;

var per, per1, tru;
per  = -1;
per1 = -1;
tru  = choose(2, 3);

if global.player_rank <= 3
	{
	per1 = irandom(100);
	min_time[3,1] = 20;
	}
if global.player_rank < 7  && global.player_rank >= 4
	{
	per1 = irandom(100);
	min_time[3,1] = 20;
	}
if global.player_rank < 10 && global.player_rank >= 7
	{
	per1 = irandom(100);
	min_time[3,1] = 20;
	}
if global.player_rank <= 13 && global.player_rank > 10
	{
	per = irandom_range(1, 10);
	min_time[3,1] = 20;
	}
if global.player_rank < 15 && global.player_rank > 13
	{
	per = choose(2, 3, 4, 5, 6, 8, 10);
	min_time[3,1] = 20;
	}
if global.player_rank >= 15
	{
	per = choose(2, 3, 4, 5);
	min_time[3,1] = 20;
	
	
	}