for(i=0; i<=8; i++)
	{
	if back_clouds_x[i] = 2280
		{
		back_clouds_x[i] = 1280 + 268;
		back_clouds_y[i] = irandom_range(20,  global.size - 1050 * back_s - 20) - 10; //irandom_range(50, 350) * global.size / 960;
		back_clouds_i[i] = irandom(2);
		back_clouds_s[i] = back_spd * random_range(1, 3) + 0.05;
		
		back_clouds_sc[i] = random_range(0.75, 2);
			
		back_clouds_ss[i] = back_clouds_sc[i] * (1 - 0.5 * abs(back_clouds_x[i] - 640) / 640) * back_s;
		break;
		}
	}
alarm[1] = room_speed;
		
/*
for(i=0; i<=10; i++)
	{
	if back_other_x[i] = 2280
		{
		back_other_x[i]   = 1280 + 268;
		back_other_y[i]   = irandom_range(global.size - 1040 * back_s, global.size - 400 * back_s);
		
		back_other_sk[i]  = 1 - 0.9 * (abs(-back_other_y[i] + (global.size - 400 * back_s)) / (back_other_y[i]));
		
		back_other_s[i]   = (1 - 0.6 * abs(back_other_x[i] - 640) / 640) * back_s;
		
		back_other_spr[i] = choose(s_train_skul, s_train_cactus, s_train_hills, s_train_cactus, s_train_cactus, s_train_cactus, s_train_hills, s_train_hills,);
		back_other_img[i] = irandom(2);
			
		back_other_spd[i] = back_spd / 1.5 * (8 + 8 * back_other_sk[i]);
		break;
		}
	}
alarm[0] = irandom_range(room_speed / 10, room_speed * 1.5);