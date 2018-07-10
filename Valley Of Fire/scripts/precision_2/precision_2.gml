var sss, sss1;
sss  = "123456";
sss1 = 0;

#region 15 rank
	if global.player_rank = 15 or global.player_rank = 10 or global.player_rank = 5
		{
		target_n = 4;
		sss  = string_copy(sss, 1, target_n);
		
		for(i=1;i<=target_n;i++)
			{
			sss1 = irandom_range(1, string_length(sss));
			target_numb[i] = real(string_copy(sss, sss1, 1));
			sss = string_delete(sss, sss1, 1);
			
			target_x[i] = irandom_range(200, 1000);
			target_y[i] = irandom_range(global.size / 2 - 200, global.size / 2 + 200);
			target_s[i] = 0;
			target_c[i] = 0;
			}
		}
#endregion