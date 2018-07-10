for(i=0; i<=10; i++)
	{
	if back_other_x[i] = 2280
		{
		back_other_x[i]   = 1280 + 268;
		back_other_y[i]   = irandom_range(global.size - 1040 * back_s, global.size - 450 * back_s); // 400
		
		back_other_sk[i]  = 1 - 0.9 * (abs(back_other_y[i] - (global.size - 400 * back_s)) / (global.size - 400 * back_s));
		
		back_other_s[i]   = (1 - 0.6 * abs(back_other_x[i] - 640) / 640) * back_s;
		
		back_other_spr[i] = choose(s_train_skul, s_train_cactus, s_train_hills, s_train_cactus, s_train_cactus, s_train_cactus, s_train_hills, s_train_hills,);
		back_other_img[i] = irandom(2);
			
		back_other_spd[i] = back_spd / 1.5 * (8 + 8 * back_other_sk[i]);
		break;
		}
	}
alarm[0] = irandom_range(10, room_speed * 1);