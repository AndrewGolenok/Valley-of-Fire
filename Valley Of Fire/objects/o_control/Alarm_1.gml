#region Рандом облаков
	for(i = 0; i <= 8; i ++)
		{
		if back_clouds_x[i] = 2280
			{
			back_clouds_x[i] = global.width + 268;
			back_clouds_y[i] = irandom_range(20,  global.height - 1050 * back_s - 20) - 10;
			back_clouds_i[i] = irandom(2);
			back_clouds_s[i] = back_spd * random_range(1, 3) + 0.05;
			back_clouds_sc[i] = random_range(0.75, 2);
			back_clouds_ss[i] = back_clouds_sc[i] * (1 - 0.5 * abs(back_clouds_x[i] - 640) / 640) * back_s;
			break;
			}
		}
	alarm[1] = room_speed;
#endregion