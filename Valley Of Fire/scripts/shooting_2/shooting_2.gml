target_ang = 270;
target_now = 1;
target_iii = 0;
target_bul = 0;
target_spd = 5;

if global.player_rank <= 3
	{ target_all = 5; target_red = choose(1, 0); min_wait[6,2] = 20; min_time[6,2] = 110; }
if global.player_rank < 7  && global.player_rank >= 4
	{ target_all = 4; target_red = choose(1, 0, 0); min_wait[6,2] = 20; min_time[6,2] = 90; }
if global.player_rank <= 10 && global.player_rank >= 7
	{ target_all = 3; target_red = choose(1, 0, 0, 0); min_wait[6,2] = 20; min_time[6,2] = 60; }
if global.player_rank < 13 && global.player_rank > 10
	{ target_all = 3; target_red = choose(1, 0, 0, 0, 0); min_wait[6,2] = 30; min_time[6,2] = 60; }
if global.player_rank < 15 && global.player_rank >= 13
	{ target_all = 2; target_red = 0; min_wait[6,2] = 20; min_time[6,2] = 40; }
if global.player_rank >= 15
	{ target_all = 2; target_red = 0; min_wait[6,2] = 20; min_time[6,2] = 40; }

target_red = 0;
if target_red = 1
	{ target_now = target_all; }

var txt, txt1, txt2, txt3;
txt  = "";
txt2 = "12345";

for(i = 1; i <= target_all; i ++)
	{ txt += string(i); }

for(i = 1; i <= target_all; i ++)
	{
	txt1 = irandom_range(1, string_length(txt));
	target_n[i] = real(string_copy(txt, txt1, 1));
	txt = string_delete(txt, txt1, 1);
	
	txt3 = irandom_range(1, string_length(txt2));
	target_m[i] = real(string_copy(txt2, txt3, 1));
	txt2 = string_delete(txt2, txt3, 1);
	
	target_d[i] = 0;
	target_s[i] = 1;
	target_a[i] = 0;
	}