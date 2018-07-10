var sss, sss1;
sss  = "123456";
sss1 = 0;

botle_all = 0;
botle_s = 0;
botle_stage = 0;
botle_y[1] = 0;
botle_x[1] = 0;
botle_n[1] = 0;

#region 15 rank
	if global.player_rank = 15 or global.player_rank = 10 or global.player_rank = 5
		{
		botle_all = 4;
		botle_stage = 1;
		sss  = string_copy(sss, 1, botle_all);
		for(i=1;i<=botle_all;i++)
			{
			botle_destroy[i] = 0;
			sss1 = irandom_range(1, string_length(sss));
			botle_n[i] = real(string_copy(sss, sss1, 1));
			sss = string_delete(sss, sss1, 1);
			botle_y[i] = -800; //-400
			botle_x[i] = 640 - 50 * i + 125;
			}
		}
#endregion