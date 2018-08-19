var sss, sss1, sssr, usa;
sss  = "123456";
sss1 = 0;
sssr = "";
usa  = "";

bottle_all = 0;
bottle_s = 0;
bottle_stage = 0;
bottle_y[1] = 0;
bottle_x[1] = 0;
bottle_n[1] = 0;
bottle_red  = 0;

if global.player_rank <= 3
	{ bottle_all = 5; bottle_red = choose(0, 1); min_time[2,2] = 90; min_wait[2,2] = 100; bottle_s1 = choose(1, -1); bottle_s2 = choose(1, -1); bottle_a1 = 0.4; }
if global.player_rank < 7  && global.player_rank >= 4
	{ bottle_all = 5; bottle_red = choose(0, 0, 1); min_time[2,2] = 70; min_wait[2,2] = 80; bottle_s1 = choose(1, -1); bottle_s2 = -1; bottle_a1 = 0.6; }
if global.player_rank < 10 && global.player_rank >= 7
	{ bottle_all = 4; bottle_red = choose(0, 0, 0, 1); min_time[2,2] = 60; min_wait[2,2] = 60; bottle_s1 = -1; bottle_s2 = choose(1, -1); bottle_a1 = 0.7; }
if global.player_rank < 13 && global.player_rank >= 10
	{ bottle_all = 4; bottle_red = choose(0, 0, 0, 0, 1); min_time[2,2] = 40; min_wait[2,2] = 40; bottle_s1 = choose(1, -1); bottle_s2 = 1; bottle_a1 = 0.8; }
if global.player_rank < 15 && global.player_rank >= 13
	{ bottle_all = 3; bottle_red = choose(0, 0, 0, 0, 1); min_time[2,2] = 30; min_wait[2,2] = 30; bottle_s1 = 1; bottle_s2 = 1; bottle_a1 = 0.9; }
if global.player_rank >= 15
	{ bottle_all = 2; min_time[2,2] = 20; min_wait[2,2] = 20; bottle_s1 = 1; bottle_s2 = 1; bottle_a1 = 1; }

bottle_stage = 1;

sss  = string_copy(sss, 1, bottle_all);

for(i=1;i<=bottle_all;i++)
	{
	bottle_destroy[i] = 0;
	sss1 = irandom_range(1, string_length(sss));
	sssr += string_copy(sss, sss1, 1);
	bottle_n[i] = real(string_copy(sss, sss1, 1));
	sss = string_delete(sss, sss1, 1);
	bottle_y[i] = -800;
	bottle_x[i] = 640 - 60 * (bottle_all - 1) + 120 * (i - 1); // - 50 * i + 50 * (bottle_all / 2);
	bottle_i[i] = irandom_range(2, 3);
	}
	
if bottle_all = 2
	{
	sssr = string_replace(sssr, "1", "q");
	sssr = string_replace(sssr, "2", "w");
	
	sssr = string_replace(sssr, "q", "2");
	sssr = string_replace(sssr, "w", "1");
	}
if bottle_all = 3
	{
	sssr = string_replace(sssr, "1", "q");
	sssr = string_replace(sssr, "2", "w");
	sssr = string_replace(sssr, "3", "e");
	
	sssr = string_replace(sssr, "q", "3");
	sssr = string_replace(sssr, "w", "2");
	sssr = string_replace(sssr, "e", "1");
	}
if bottle_all = 4
	{
	sssr = string_replace(sssr, "1", "q");
	sssr = string_replace(sssr, "2", "w");
	sssr = string_replace(sssr, "3", "e");
	sssr = string_replace(sssr, "4", "r");
	
	sssr = string_replace(sssr, "q", "4");
	sssr = string_replace(sssr, "w", "3");
	sssr = string_replace(sssr, "e", "2");
	sssr = string_replace(sssr, "r", "1");
	}
if bottle_all = 5
	{
	sssr = string_replace(sssr, "1", "q");
	sssr = string_replace(sssr, "2", "w");
	sssr = string_replace(sssr, "3", "e");
	sssr = string_replace(sssr, "4", "r");
	sssr = string_replace(sssr, "5", "t");
	
	sssr = string_replace(sssr, "q", "5");
	sssr = string_replace(sssr, "w", "4");
	sssr = string_replace(sssr, "e", "3");
	sssr = string_replace(sssr, "r", "2");
	sssr = string_replace(sssr, "t", "1");
	}

//for(i=bottle_all;i>=1;i--)
//	{
//	usa += string_copy(sssr, i, 1);
//	}
for(i=1;i<=bottle_all;i++)
	{
	bottle_n1[i] = real(string_copy(sssr, i, 1));
	}

//if bottle_all = 2
//	{
//	if bottle_n[1] = 1
//		{ bottle_n1[1] = 2; bottle_n1[2] = 1; }
//	}
//if bottle_all = 3
//	{
//	if bottle_n[1] = 1
//		{
//		bottle_n1[1] = 3;
		
//		if bottle_n[2] = 3
//			{ bottle_n1[2] = 1; }
//		if bottle_n[3] = 3
//			{ bottle_n1[3] = 1; }
//		}
//	if bottle_n[1] = 2
//		{
//		if bottle_n[2] = 3
//			{ bottle_n1[2] = 1; }
//		if bottle_n[3] = 3
//			{ bottle_n1[3] = 1; }
		
//		if bottle_n[2] = 1
//			{ bottle_n1[2] = 3; }
//		if bottle_n[3] = 1
//			{ bottle_n1[3] = 3; }
//		}
//	if bottle_n[1] = 3
//		{
//		bottle_n1[1] = 1;
		
//		if bottle_n[2] = 1
//			{ bottle_n1[2] = 3; }
//		if bottle_n[3] = 1
//			{ bottle_n1[3] = 3; }
//		}
//	}
//if bottle_all = 4
//	{
//	if bottle_n[1] = 1
//		{ bottle_n1[1] = 2; bottle_n1[2] = 1; }
//	}
//if bottle_all = 5
//	{
//	if bottle_n[1] = 1
//		{ bottle_n1[1] = 2; bottle_n1[2] = 1; }
//	}