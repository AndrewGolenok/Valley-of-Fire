#region Переменные игроков
	global.enemy_hero = choose(1, 2, 3);
#endregion
#region Камера
	application_surface_enable(1);
	
	surface_resize(application_surface, 1280, global.size);
	display_set_gui_size(1280, global.size);
	room_set_height(room, global.size);
	VIEW   = view_current; 
	camera = camera_create_view(0, 0, 1280, global.size, 0, -1, 0, 0, 0, 0);
	camera_destroy(camera_get_default());

	view_enabled = true;
	view_set_visible(VIEW, true);
	view_set_xport(VIEW, 0);
	view_set_yport(VIEW, 0);
	view_set_wport(VIEW, 1280);
	view_set_hport(VIEW, global.size);
	
	window_set_size(1280, global.size);

	view_set_camera(VIEW, camera);
#endregion
#region Фон
	global.background = choose("train", "mine", "waterfall", "saloon");
	global.super_ability    = 0;
	global.super_ability1   = 0;
	global.ability_dop_anim = 0;
	depth = 5;
	
	back_x = 0;
	if global.background = "train"
		{
		back_s  = 0.56;
		if global.size < 900
			{ back_y = 160; }
			else
			{ back_y = 30; }
		if global.size < 650
			{ back_y = 220; }
		}
	if global.background = "mine"
		{
		back_s = 0.52;
		if global.size < 900
			{ back_y = 150; }
			else
			{ back_y = 0; }
		}
	if global.background = "waterfall"
		{
		back_s = 0.52;
		if global.size < 900
			{ back_y = 30; }
			else
			{ back_y = 0; }
		}
	if global.background = "saloon"
		{
		back_s = 0.52;
		if global.size < 900
			{ back_y = 100; }
			else
			{ back_y = 0; }
		}
	back_sp = back_s;
	
	#region Поезд
		day_hour   = 9;
		day_minute = 0;
		day_second = 0;
		day_star   = 0;
		
		for(i=0; i<=128; i++)
			{
			if i mod 2 = 0
				{ day_star_s[i] = choose(s_train_star_1, s_train_star_2); }
				else
				{ day_star_s[i] = s_train_star_1; }
			day_star_y[i] = irandom_range(0, 800 * back_s);
			day_star_n[i] = irandom(100);
			}
		
		sun_light  = 0;
		moon_light = 0;
		
		sun_scale  = 0;
		moon_scale = 0;
		
		if day_hour >= 0 && day_hour < 6
			{ back_time[1] = 0; }
		if day_hour >= 6 && day_hour < 12
			{ back_time[1] = 1; }
		if day_hour >= 12 && day_hour < 18
			{ back_time[1] = 2; }
		if day_hour >= 18 && day_hour < 24
			{ back_time[1] = 3; }
		
		back_time[2] = back_time[1] + 1;
		
		back_alpha[2] = ((day_hour * 60 * 60 + day_minute * 60 + day_second) - back_time[1] * 60 * 60 ) / (back_time[2] * 60 * 60  - back_time[1] * 60 * 60 )///abs((back_time[2] * 6 * 60 * 60) - (abs((day_hour * 60 * 60 + day_minute * 60 + day_second) - (back_time[1] * 6 * 60 * 60)))) / (back_time[2] * 6 * 60 * 60);
		back_alpha[1] = 1 - back_alpha[2];
		
		back_anim_1 = 2;
		back_anim_2 = 2;
	
		back_timen =  irandom_range(room_speed * 2, room_speed * 10);
		back_dir1 = -1;
		back_dir2 = 1;
		back_spd  = 0.7//1.5;
	
		back_train_y1 = -back_spd * 3;
		back_train_y2 = back_spd * 3;
	
		back_m_spd = back_spd / 1.5 * 5; // Скорость гор
		back_m_y   = back_y + global.size - 1050 * back_s;
	
		back_n  = 0;
		back_p  = 14;
		back_gt = 0;
		
		back_sand_spd = back_spd / 1.5 * 6;
		back_sand_y   = back_y + global.size - 1050 * back_s;
	
		for(i=0; i<=14; i++)
			{
			if i = back_n
				{
				back_m_img[back_n] = irandom(9);
				back_m_x[back_n]   = back_x + 640 - sprite_get_width(s_train_back) / 2 * back_s;
				back_m_s[back_n]   = (1 - 0.5 * abs(back_m_x[back_n] - 640) / 640) * back_s;
				}
				else
				{
				back_m_img[i] = irandom(9);
				back_m_x[i]   = back_m_x[i-1] + sprite_get_width(s_train_mountain) * back_m_s[i-1];
				back_m_s[i]   = (1 - 0.5 * abs(back_m_x[i] - 640) / 640) * back_s;
				}
			}
		
		for(i=0; i<=5; i++)
			{ back_sand_x[i]  = (sprite_get_width(s_train_sand) / 4 + sprite_get_width(s_train_sand) * i / 4) * back_s; }
			
		for(i=0; i<=10; i++)
			{
			back_other_x[i]   = 2280;
			back_other_y[i]   = irandom_range(global.size - 1050 * back_s, global.size - 200 * back_s);
			back_other_sk[i]  = back_other_y[i] / (global.size - 200);
			
			back_other_s[i]   = (1 - 0.5 * abs(back_other_x[i] - 640) / 640) * back_s;
			
			back_other_spr[i] = choose(s_train_skul, s_train_cactus, s_train_hills);
			back_other_img[i] = irandom(2);
			
			back_other_spd[i] = back_spd / 1.5 * (6 + 2 * back_other_sk[i]);
			}
		
		for(i=0; i<=8; i++)
			{
			back_clouds_x[i] = irandom(1280);
			back_clouds_y[i] = irandom_range(20,  global.size - 1050 * back_s - 20) - 10;
			back_clouds_i[i] = irandom(2);
			back_clouds_s[i] = random_range(1,3);
			
			back_clouds_sc[i] = random_range(0.75, 2);
			back_clouds_ss[i] = back_clouds_sc[i] * (1 - 0.5 * abs(back_clouds_x[i] - 640) / 640) * back_s;
			}
		alarm[1] = 1;
		alarm[0] = 1;
	#endregion
	#region Шахты
		light_scale = 0.5;
		light_dir = -1;
		light_s   = 1;
		light_alpha = 0.7;
		light_x = 433 * back_s;
		light_y = 1140 * back_s;
	#endregion
	#region Водопад
		water_n = 0;
	#endregion
	#region Салун
		sl_doors_i  = 0;
		
		sl_wanted_t = irandom_range(4, 10) * room_speed;
		sl_wanted_i = 0;
		
		sl_tumble_x = 0;
		sl_tumble_y = 0;
		sl_tumble_s = 0;
		sl_tumble_a = 0;
		sl_tumble_g = 0;
		sl_tumble_spd = 0;
	#endregion
	#region Гуи
		//q_col  = c_white;
		//h_pos  = 0;
		//list_y = -300;
		
		//button_xc = 0;
		//button_x  = 0;
		
		//list_scale = 0;
		//plas_scale = 0;
		
		//super_x = 300;
		//vvv = 0;
		
		//win_plas = 0;
		
		//theme_choose = 1;
		//for(i=0; i<=2; i++)
		//	{
		//	theme_b_mv[i] = 0;
		//	theme_b_im[i] = irandom(2);
		//	theme_b_sx[i] = 0;
			
		//	theme_b_x[i]  = 640;
		//	theme_b_y[i]  = 300;
			
		//	theme_b_c[i]   = 0;
		//	theme_b_cn[i]  = 60;
		//	theme_b_dir[i] = 1;
			
		//	theme_n[i]   = 0;
			
		//	theme_go[i]  = 0;
		//	theme_sc[i]  = 0;
		//	theme_end[i] = 0;
			
		//	theme_l[i] = 0;
			
		//	theme_ps[i] = 0;
			
		//	switch(theme_b_im[i])
		//		{
		//		case 0: theme_b_th[i] = "math"; break;
		//		case 1: theme_b_th[i] = "move"; break;
		//		case 2: theme_b_th[i] = "other"; break;
		//		}
		//	}
	#endregion
#endregion