if global.player_rank <= 3
	{ cards_all = 5; min_wait[5,3] = 70; min_time[5,3] = 90; }
if global.player_rank < 7  && global.player_rank >= 4
	{ cards_all = 4; min_wait[5,3] = 60; min_time[5,3] = 70; }
if global.player_rank <= 10 && global.player_rank >= 7
	{ cards_all = 4; min_wait[5,3] = 60; min_time[5,3] = 60; }
if global.player_rank < 13 && global.player_rank > 10
	{ cards_all = 3; min_wait[5,3] = 50; min_time[5,3] = 40; }
if global.player_rank < 15 && global.player_rank >= 13
	{ cards_all = 3; min_wait[5,3] = 50; min_time[5,3] = 30; }
if global.player_rank >= 15
	{ cards_all = 2; min_wait[5,3] = 30; min_time[5,3] = 20; }

cards_time = global.player_rank;
//cards_all   = 2;
//cards_time  = 10;
cards_now     = 1;

cards_stage = 1;

var txt, txt1, txt2, txt3, txt4;
txt2 = "123456";
txt  = "";

txt3 = "";
for(i=1;i<=cards_all;i++)
	{
	txt1 = irandom_range(1, string_length(txt2));
	txt += string_copy(txt2, txt1, 1);
	txt2 = string_delete(txt2, txt1, 1);
	
	txt3 += string(i);
	}
for(i=1;i<=cards_all;i++)
	{
	cards_nu[i] = i;
	cards_y[i]  = 0;
	cards_s[i]  = 0;
	cards_ss[i] = 1;
	cards_i[i]  = 0;
	cards_x[i]  = -70 * (cards_all - 1) + (i - 1) * 140;
	cards_xs[i] = cards_x[i];
	txt1 = irandom_range(1, string_length(txt));
	cards_m[i]  = real(string_copy(txt, txt1, 1));
	txt  = string_delete(txt, txt1, 1);
	
	txt4 = irandom_range(1, string_length(txt3));
	cards_n[i]  = real(string_copy(txt3, txt4, 1));
	txt3 = string_delete(txt3, txt4, 1);
	}
for(i=1;i<=cards_all;i++)
	{
	cards_xx[i] = -70 * (cards_all - 1) + (cards_n[i] - 1) * 140;
	}