#region Тестовые сдвиги фона
	//if keyboard_check(ord("A"))
	//	{ back_x -= 10; }
	//if keyboard_check(ord("D"))
	//	{ back_x += 10; }
	//if keyboard_check(ord("W"))
	//	{ back_y -= 10; }
	//if keyboard_check(ord("S"))
	//	{ back_y += 10; }
	
	//back_sp = back_s;

	//if keyboard_check(ord("Q"))
	//	{ back_s -= 0.025 * back_s; }
	//if keyboard_check(ord("E"))
	//	{ back_s += 0.025 * back_s; }
	
		
	//if keyboard_check(ord("N"))
	//	{
	//	if back_spd > 0
	//		{ back_spd -= 0.05; }
	//	}
	//if keyboard_check(ord("M"))
	//	{
	//	if back_spd < 3
	//		{ back_spd += 0.05; }
	//	}
#endregion
#region Время и прочие характеристики
	if global.music
		{
		if !audio_is_playing(sd_back_train)
			{ audio_play_sound(sd_back_train, 0, 1);  }
		if !audio_is_playing(sd_music)
			{ audio_play_sound(sd_music, 1, 1);  }
		}
		else
		{
		if audio_is_playing(sd_back_train)
			{ audio_stop_sound(sd_back_train);  }
		if audio_is_playing(sd_music)
			{ audio_stop_sound(sd_music);  }
		}
		
	if day_hour = 24
		{ day_hour = 0; }
	
	if day_hour >= 0 && day_hour < 6
		{ back_time[1] = 0; }
	if day_hour >= 6 && day_hour < 12
		{ back_time[1] = 1; }
	if day_hour >= 12 && day_hour < 18
		{ back_time[1] = 2; }
	if day_hour >= 18 && day_hour < 24
		{ back_time[1] = 3; }
	
	back_alpha2[0] = 0.3;
	back_alpha2[4] = 0.3;
	back_alpha2[1] = 0.1;
	back_alpha2[2] = 0;
	back_alpha2[3] = 0.2;
		
	back_time[2]  = back_time[1] + 1;
	
	back_alpha[2] = abs((day_hour * 60 * 60 + day_minute * 60 + day_second) - back_time[1] * 6 * 60 * 60) / (back_time[2] * 6 * 60 * 60 - back_time[1] * 6 * 60 * 60 );
	back_alpha[1] = 1 - back_alpha[2];
	
	if keyboard_check_pressed(ord("A"))
		{
		day_hour += 1;
		}
	if keyboard_check(ord("S"))
		{
		day_minute += 2;
		}
	if keyboard_check(ord("D"))
		{
		day_second += 1;
		}
	
	if day_hour >= 24
		{ day_hour = 0; }
	if day_minute >= 60
		{ day_minute = day_minute - 60; day_hour += 1; }
	if day_second >= 60
		{ day_second = day_second - 60; day_minute += 1; }
		
	var date;
	date = date_current_datetime();
	
	day_hour   = date_get_hour(date);
	day_minute = date_get_minute(date);
	day_second = date_get_second(date);
	
	
	draw_sprite_ext(s_train_back, back_time[1], 640 + back_x, global.size + back_y, back_s, back_s, 0, c_white, back_alpha[1]);
	draw_sprite_ext(s_train_back, back_time[2], 640 + back_x, global.size + back_y, back_s, back_s, 0, c_white, back_alpha[2]);
	
	if day_hour < 20 && day_hour > 3
		{ day_star = 0; }
		else
		{
		if day_hour >= 20
			{ day_star = ((day_hour + day_minute / 60 + day_second / 360) - 18) / 6; }
		if day_hour <= 4
			{
			if day_hour != 0
				{ day_star = 1 / (day_hour + day_minute / 60 + day_second / 360); }
				else
				{ day_star = 1; }
			}
		}
	
	var star_alpha;
	star_alpha = 0;
	if back_time[1] = 0
		{ star_alpha = back_alpha[1] * day_star; }
	if back_time[1] = 1 or back_time[1] = 3
		{ star_alpha = back_alpha[2] * day_star; }
#endregion
#region Фон Поезда
	if global.background = "train" or global.background = "waterfall" or global.background = "saloon"
		{
		#region Звезды и задник
		/////// STARS ///////////
		for(i=0; i<=128; i++)
			{
			day_star_n[i] += 0.25 * back_spd;
			draw_sprite_ext(day_star_s[i], day_star_n[i], i * 10 + back_x, day_star_y[i], back_s, back_s, 0, c_white, star_alpha);
			}
		/////// STARS //////////
	
		moon_scale = 1 - 0.45 * abs(640 + lengthdir_x(640, -90 - 15 * (day_hour + day_minute / 60 + day_second / 360)) - 640) / 640;
	
		draw_sprite_ext(s_sunmoon, 0, 640 + lengthdir_x(640, -90 - 15 * (day_hour + day_minute / 60 + day_second / 3600)), global.size / 2 + lengthdir_y(200, -90 - 15 * (day_hour + day_minute / 60 + day_second / 3600)), moon_scale, moon_scale, -90 - 15 * (day_hour + day_minute / 60 + day_second / 3600), c_white, 1);
		draw_sprite_ext(s_sunmoon, 1, 640 - lengthdir_x(640, -90 - 15 * (day_hour + day_minute / 60 + day_second / 3600)), global.size / 2 - lengthdir_y(200, -90 - 15 * (day_hour + day_minute / 60 + day_second / 3600)), moon_scale, moon_scale, -90 - 15 * (day_hour + day_minute / 60 + day_second / 3600), c_white, 1);
	
		draw_sprite_ext(s_train_back2, back_time[1], 640 + back_x, global.size + back_y, back_s, back_s, 0, c_white, 1);
		draw_sprite_ext(s_train_back2, back_time[1], 640 + back_x, global.size + back_y, back_s, back_s, 0, c_white, back_alpha[1]);
		draw_sprite_ext(s_train_back2, back_time[2], 640 + back_x, global.size + back_y, back_s, back_s, 0, c_white, back_alpha[2]);
	#endregion
		#region Рисование облаков
			for(i=0; i<=8; i++)
				{
				if back_clouds_y[i] > back_m_y
					{ back_clouds_y[i] = back_y + global.size - 1050 * back_s - 20; }
				if back_clouds_x[i] != 2280
					{
					if back_clouds_x[i] > back_x + 640 - sprite_get_width(s_train_back) / 2 * back_s - sprite_get_width(s_train_clouds) * back_clouds_sc[i] * back_s
						{
						back_clouds_x[i] -= back_clouds_s[i];
						back_clouds_ss[i] = back_clouds_sc[i] * (1 - 0.5 * abs(back_clouds_x[i] - 640) / 640) * back_s;
						draw_sprite_ext(s_train_clouds, back_clouds_i[i], back_clouds_x[i], back_y + back_clouds_y[i], back_clouds_ss[i] * back_s, back_clouds_ss[i] * back_s, 0, c_white, 1);
						}
						else
						{ back_clouds_x[i] = 2280; }
					}
				}
		#endregion
		}
	if global.background = "train"
		{
		#region Рисование гор
			back_m_y = back_y + global.size - 1050 * back_s;
	
			for(i=back_n; i<=14; i++)
				{
				if i = back_n
					{
					if back_s = back_sp
						{ back_m_x[back_n] -= back_spd; }
						else
						{ back_m_x[back_n] = back_x + 640 - sprite_get_width(s_train_back) / 2 * back_s; }
		
					back_m_s[back_n] = (1 - 0.5 * abs(back_m_x[back_n] - 640) / 640) * back_s;
		
					if back_m_x[back_n] < back_x + 640 - sprite_get_width(s_train_back) / 2 * back_s - sprite_get_width(s_train_mountain) * back_m_s[back_n]
						{
						back_m_x[back_n] = back_m_x[back_p] + sprite_get_width(s_train_mountain) * back_m_s[back_p];
						back_p = back_n;
						back_m_img[back_p] = irandom(9);
						if back_n != 14
							{ back_n += 1; }
							else
							{ back_n = 0; back_gt = 1 }
						}
					}
					else
					{
					back_m_x[i] = back_m_x[i-1] + sprite_get_width(s_train_mountain) * back_m_s[i-1];
					back_m_s[i] = (1 - 0.5 * abs(back_m_x[i] - 640) / 640) * back_s;
					}
	
				draw_sprite_ext(s_train_mountain, back_m_img[i], back_m_x[i], back_m_y, back_m_s[i], back_m_s[i], 0, c_white, 1);
				}
			if back_n > 0 or back_gt = 1
				{
				for(i=0; i<=back_p; i++)
					{
					if i != 0
						{
						back_m_x[i] = back_m_x[i-1] + sprite_get_width(s_train_mountain) * back_m_s[i-1];
						back_m_s[i] = (1 - 0.5 * abs(back_m_x[i] - 640) / 640) * back_s;
						}
						else
						{
						if back_gt = 0
							{	
							back_m_x[i] = back_m_x[14] + sprite_get_width(s_train_mountain) * back_m_s[14];
							back_m_s[i] = (1 - 0.5 * abs(back_m_x[i] - 640) / 640) * back_s;
							}
							else
							{
							back_m_x[back_n] -= back_spd;
							back_gt = 0;
							}
						}
	
					draw_sprite_ext(s_train_mountain, back_m_img[i], back_m_x[i], back_m_y, back_m_s[i], back_m_s[i], 0, c_white, 1);
					}
				}
		#endregion		
		#region Рисование песка
			back_sand_y   = back_y + global.size - 1050 * back_s;
			back_sand_spd = back_spd / 1.5 * 6;
	
			for(i=0; i<=5; i++)
				{
				back_sand_x[i] -= back_sand_spd;
				if back_sand_x[i] <= back_x + 640 - sprite_get_width(s_train_back) / 2 * back_s - sprite_get_width(s_train_sand) / 2 * back_s
					{ back_sand_x[i] = 1280 + sprite_get_width(s_train_sand) / 2 * back_s; }
		
				draw_sprite_ext(s_train_sand, 0, back_sand_x[i], back_sand_y, back_s, back_s, 0, c_white, 0.9);
				}
		#endregion
		#region Рисование кактусов, утесов, черепков
			for(i=0; i<=10; i++)
				{
				if back_other_x[i] != 2280
					{
					if back_other_x[i] > back_x + 640 - sprite_get_width(s_train_back) / 2 * back_s - 268 * back_s
						{
						back_other_spd[i] = back_spd / 1.5 * (8 + 8 * back_other_sk[i]);
				
						back_other_y[i] += (back_spd * (back_other_x[i] - 640) / 640) / 2;
				
						back_other_x[i] -= back_other_spd[i];	
						back_other_s[i]	 = (1 - 0.6 * abs(back_other_x[i] - 640) / 640) * back_s;
				
						draw_sprite_ext(back_other_spr[i], back_other_img[i], back_other_x[i], back_y - 20 + back_other_y[i] - (sprite_get_width(back_other_spr[i]) * back_other_s[i] * back_other_sk[i] / 3) / 2, back_other_s[i] * back_other_sk[i] / 3, back_other_s[i] * back_other_sk[i] * 1.25, -100, c_black, 0.45);
						draw_sprite_ext(back_other_spr[i], back_other_img[i], back_other_x[i], back_y - 20 + back_other_y[i], back_other_s[i] * back_other_sk[i], back_other_s[i] * back_other_sk[i], 0, c_white, 1);
						//draw_text(mouse_x, mouse_y, string(global.size - 200 * back_s));//draw_text(back_other_x[i], back_y + back_other_y[i], string(back_other_y[i]));
						}
						else
						{ back_other_x[i] = 2280; }
					}
				}
		#endregion
		#region Анимация вагонов
			back_anim_1 -= back_spd / 1.5 * 0.35;
			back_anim_2 += back_spd / 1.5 * 0.35;

			//if back_timen > 0
			//	{
				back_train_y1 += back_spd / 1.5 * back_dir1 * back_spd;
				if abs(back_train_y1) >= back_spd * 5
					{ back_dir1 = -back_dir1; back_train_y1 += back_spd / 1.5 * back_dir1 * back_spd; }
	
				back_train_y2 += back_spd / 1.5 * back_dir2 * back_spd;
				if abs(back_train_y2) >= back_spd * 5
					{ back_dir2 = -back_dir2; back_train_y2 += back_spd / 1.5 * back_dir2 * back_spd; }
			//	}

			if back_anim_1 < 0
				{ back_anim_1 = 2; }
			if back_anim_2 > 2
				{ back_anim_2 = 0; }

			draw_sprite_ext(s_train_decks, back_anim_1, 640 + back_x - sprite_get_width(s_train_back) * back_s / 2, global.size + back_y, -back_s, back_s, 0, c_white, 1);
			draw_sprite_ext(s_train_decks, back_anim_2, 640 + back_x + sprite_get_width(s_train_back) * back_s / 2, global.size + back_y, back_s, back_s, 0, c_white, 1);

			draw_sprite_ext(s_train_rails, 0, 640 + back_x, global.size + back_y, back_s, back_s, 0, c_white, 1);
			draw_sprite_ext(s_train_rails, 0, 640 + back_x, global.size + back_y, -back_s, back_s, 0, c_white, 1);

			draw_sprite_ext(s_train_wagon, 0, 640 + back_x, global.size + back_y + back_train_y1, back_s, back_s, 0, c_white, 1);
		draw_sprite_ext(s_train_wagon, 0, 640 + back_x, global.size + back_y + back_train_y2, -back_s, back_s, 0, c_white, 1);
		#endregion
		}
#endregion
#region Фон Водопада
	if global.background = "waterfall"
		{
		back_train_y1 += back_spd / 1.5 * back_dir1 * back_spd;
		if abs(back_train_y1) >= back_spd * 5
			{ back_dir1 = -back_dir1; back_train_y1 += back_spd / 1.5 * back_dir1 * back_spd; }
		back_train_y2 = back_train_y1;
		draw_sprite_ext(s_waterfall_back, 0, 640 + back_x, global.size + back_y, 1, 1, 0, c_white, 1);
		draw_sprite_ext(s_waterfall_reflection, 0, 640 + back_x, global.size + back_y - 198, 1 - (back_train_y1) * 0.005, 1 - (back_train_y1) * 0.01, 0, c_white, 0.5);
		
		water_n += 0.3;
		draw_sprite_ext(s_waterfall_fall, water_n, 640 + back_x, global.size + back_y, 1, 1, 0, c_white, 0.7);
		draw_sprite_ext(s_waterfall_water, water_n, 640 + back_x, global.size + back_y, 1, 1, 0, c_white, 1);
		
		draw_sprite_ext(s_waterfall_bridge, 0, 640 + back_x, global.size + back_y + back_train_y1, 1, 1, 0, c_white, 1);
		}
#endregion
#region Фон Салуна
	if global.background = "saloon"
		{
		sl_doors_i += 0.1;
		
		if sl_wanted_t > 0
			{ sl_wanted_t -= 1; }
			else
			{
			if sl_wanted_i < 10
				{ sl_wanted_i += 0.3; }
				else
				{
				sl_wanted_t = irandom_range(4, 10) * room_speed;
				sl_wanted_i = 0;
				}
			}
		
		draw_sprite_ext(s_saloon_back, 0, 640 + back_x, global.size + back_y, 1, 1, 0, c_white, 1);
		//draw_sprite_ext(s_saloon_house, 0, 640 + back_x, global.size + back_y, 1, 1, 0, c_white, 1);
		//draw_sprite_ext(s_saloon_wanted, sl_wanted_i, 640 + back_x, global.size + back_y, 1, 1, 0, c_white, 1);
		draw_sprite_ext(s_saloon_doors, sl_doors_i, 640 + back_x, global.size + back_y, 1, 1, 0, c_white, 1);
		
		if sl_tumble_g = 0
			{
			sl_tumble_x = 1280 + 50 + irandom(2000);
			sl_tumble_y = irandom_range(global.size / 2 + 20, global.size);
			sl_tumble_s = 0.1 + 0.3 * (sl_tumble_y / global.size);
			sl_tumble_a = 0;
			sl_tumble_g = 1;
			sl_tumble_spd = irandom_range(1, 6);
			}
		if sl_tumble_g = 1
			{
			sl_tumble_x -= sl_tumble_spd;
			sl_tumble_a += sl_tumble_spd;
			if sl_tumble_x < - 50
				{ sl_tumble_g = 0; }
			}
		if instance_exists(o_hero)
			{
			if sl_tumble_y < o_hero.y - 40
				{ draw_sprite_ext(s_saloon_tumbleweed, 0, sl_tumble_x, sl_tumble_y, sl_tumble_s, sl_tumble_s, sl_tumble_a, c_white, 1); }
			}
		}
#endregion
#region Поверх
	draw_sprite_ext(s_train_back1, o_control.back_time[1], 640 + o_control.back_x, global.size + o_control.back_y, o_control.back_s, o_control.back_s, 0, c_white, o_control.back_alpha2[o_control.back_time[1]] * o_control.back_alpha[1]);
	draw_sprite_ext(s_train_back1, o_control.back_time[2], 640 + o_control.back_x, global.size + o_control.back_y, o_control.back_s, o_control.back_s, 0, c_white, o_control.back_alpha2[o_control.back_time[2]] * o_control.back_alpha[2]);
#endregion
#region Фон Шахт
	if global.background = "mine"
		{
		if light_dir = 1
			{
			if light_s  > 0.6
				{ light_s -= 0.005; }
				else
				{ light_dir = -1; }
			}
			else
			{
			if light_s < 1
				{ light_s += 0.01; }
				else
				{ light_dir = 1; }
			}
		light_alpha = 0;
		if day_hour >= 18 && day_hour < 22
			{ light_alpha = 0.6 * (day_hour + day_minute / 60 + day_second / 360) / 22; }
		if (day_hour >= 22 && day_hour < 24)
			{ light_alpha = 0.8 * (day_hour + day_minute / 60 + day_second / 360) / 24; }
		if (day_hour >= 0 && day_hour < 3)
			{ light_alpha = 0.8 * 1 / (day_hour + day_minute / 60 + day_second / 360 + 0.001); }
		if (day_hour >= 3 && day_hour < 6)
			{ light_alpha = 0.6 * 3 / (day_hour + day_minute / 60 + day_second / 360); }
		draw_sprite_ext(s_mine_back, 0, 640 + back_x, global.size + back_y, 1, 1, 0, c_white, 1);
		draw_sprite_ext(s_light, 0, 640 + back_x + light_x, global.size + back_y - light_y, light_scale * light_s, light_scale * light_s, 0, c_white, light_alpha);
		}
#endregion
#region Суперспособность
	//global.super_ability = 0;
	//with(o_hero)
	//	{
	//	if skeleton_animation_get() = "super"
	//		{ global.super_ability = 1; }
	//	}
	if global.super_ability = 1 or global.super_ability1 = 1
		{
		draw_set_alpha(0.5);
		draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
		draw_set_alpha(1);
		}
#endregion
#region Старый код
/*
#region Линии видов разрешения
	if lines_true
		{
		draw_line_width_color(0, global.size / 2 - 295, 1280, global.size / 2 -295, 5, c_red, c_red);
		draw_line_width_color(0, global.size / 2 + 295, 1280, global.size / 2 + 295, 5, c_red, c_red);

		draw_line_width_color(0, global.size / 2 - 360, 1280, global.size / 2 - 360, 5, c_aqua, c_aqua);
		draw_line_width_color(0, global.size / 2 + 360, 1280, global.size / 2 + 360, 5, c_aqua, c_aqua);

		draw_line_width_color(0, global.size / 2 - 400, 1280, global.size / 2 - 400, 5, c_blue, c_blue);
		draw_line_width_color(0, global.size / 2 + 400, 1280, global.size / 2 + 400, 5, c_blue, c_blue);

		draw_line_width_color(0, global.size / 2 - 480, 1280, global.size / 2 - 480, 5, c_yellow, c_yellow);
		draw_line_width_color(0, global.size / 2 + 480, 1280, global.size / 2 + 480, 5, c_yellow, c_yellow);
		}
#endregion
#region Гуи и интерфес
	#region Листовка
		if keyboard_check_pressed(ord("B"))
			{ button_xc = !button_xc; }
		if button_xc = 1
			{
			if button_x < 500
				{ button_x += 50; }
				else
				{ button_x = 500; }
			}
			else
			{
			if button_x > 0
				{ button_x -= 50; }
				else
				{ button_x = 0; }
			}
		
		var list_size, list_size1;
		list_size  = 0.35 + 0.05 * (global.size - 590) / 370;
		list_size1 = 0.4 + 0.05 * (global.size - 590) / 370;
		
		draw_sprite_ext(s_question_list, 0, 640 - 5, global.size / 2 + 4 - 50 + list_y - 658 * list_size, list_size, list_size * list_scale, 0, c_black, 0.4);
		draw_sprite_ext(s_question_list, 0, 640, global.size / 2 - 50 + list_y - 658 * list_size, list_size, list_size * list_scale, 0, c_white, 1);
		
		//if keyboard_check(ord("G"))
		//	{ plas_scale -= 0.1; }
		//if keyboard_check(ord("H"))
		//	{ plas_scale += 0.1; }
		//if keyboard_check(ord("J"))
		//	{ list_scale -= 0.1; }
		//if keyboard_check(ord("K"))
		//	{ list_scale += 0.1; }
		
		//if plas_scale < 0
		//	{ plas_scale = 0; }
		//if plas_scale > 1
		//	{ plas_scale = 1; }
		//if list_scale < 0
		//	{ list_scale = 0; }
		//if list_scale > 1
		//	{ list_scale = 1; }
		
		if keyboard_check(ord("G"))
			{
			list_y = -300;
			
			list_scale = 0;
			plas_scale = 0;
			}
		
		if list_y >= 20
			{
			if plas_scale < 1
				{ plas_scale += 0.1; }
				else
				{
				if list_scale < 1
					{ list_scale += 0.1; }
				}
			}
			else
			{ list_y += 10; }
		
		var str, font;
		str = "0123456789?=≠+-/*><";//"!"+"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюя"; 
		font = font_add_sprite_ext(s_question_fig, str, true, 1);
		draw_set_font(font);

		//draw_set_font(f_question_bold);
		draw_set_color(c_black);
		draw_set_alpha(0.4);
		draw_text_transformed(640 - 3 + 30, global.size / 2 - 200 * list_size - 50 + list_y + 4 + button_x / 4 - 125 * (1 - list_scale), "14?7=2", list_size * 1.04, list_size * 1.04 * list_scale, 0);
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_text_transformed(640 + 30, global.size / 2 - 200 * list_size - 50 + list_y + button_x / 4 - 125 * (1 - list_scale), "14?7=2", list_size * 1.04, list_size * 1.04 * list_scale, 0);
		
		draw_sprite_ext(s_question_sign, 0, 640 + 2 - 160 * list_size1  - button_x, global.size / 2 + 8 - 80 + 140 * list_size1 + list_y - 250 * (1 - list_scale), list_size1, list_size1 * list_scale, 0, c_black, 0.4);
		draw_sprite_ext(s_question_sign, 1, 640 - 10 + 160 * list_size1 + button_x, global.size / 2 + 8 - 80 + 140 * list_size1 + list_y - 250 * (1 - list_scale), list_size1, list_size1 * list_scale, 0, c_black, 0.4);
		draw_sprite_ext(s_question_sign, 2, 640 + 2 - 160 * list_size1  - button_x, global.size / 2 - 2 - 80 + 400 * list_size1 + list_y - 350 * (1 - list_scale), list_size1, list_size1 * list_scale, 0, c_black, 0.4);
		draw_sprite_ext(s_question_sign, 3, 640 - 10 + 160 * list_size1 + button_x, global.size / 2 - 2 - 80 + 400 * list_size1 + list_y - 350 * (1 - list_scale), list_size1, list_size1 * list_scale, 0, c_black, 0.4);
		
		draw_sprite_ext(s_question_sign, 0, 640 - 5 - 160 * list_size1 - button_x, global.size / 2 + 4 - 80 + 140 * list_size1 + list_y - 250 * (1 - list_scale), list_size1, list_size1 * list_scale, 0, c_white, 1);
		draw_sprite_ext(s_question_sign, 1, 640 - 5 + 160 * list_size1 + button_x, global.size / 2 + 4 - 80 + 140 * list_size1 + list_y - 250 * (1 - list_scale), list_size1, list_size1 * list_scale, 0, c_white, 1);
		draw_sprite_ext(s_question_sign, 2, 640 - 5 - 160 * list_size1 - button_x, global.size / 2 + 4 - 80 + 400 * list_size1 + list_y - 350 * (1 - list_scale), list_size1, list_size1 * list_scale, 0, c_white, 1);
		draw_sprite_ext(s_question_sign, 3, 640 - 5 + 160 * list_size1 + button_x, global.size / 2 + 4 - 80 + 400 * list_size1 + list_y - 350 * (1 - list_scale), list_size1, list_size1 * list_scale, 0, c_white, 1);
		
		draw_sprite_ext(s_question_sign1, 0, 640 - 5 - 160 * list_size1 - button_x, global.size / 2 + 4 - 80 + 140 * list_size1 + list_y - 250 * (1 - list_scale), list_size1, list_size1 * list_scale, 0, c_white, 1);
		draw_sprite_ext(s_question_sign1, 1, 640 - 5 + 160 * list_size1 + button_x, global.size / 2 + 4 - 80 + 140 * list_size1 + list_y - 250 * (1 - list_scale), list_size1, list_size1 * list_scale, 0, c_white, 1);
		draw_sprite_ext(s_question_sign1, 2, 640 - 5 - 160 * list_size1 - button_x, global.size / 2 + 4 - 80 + 400 * list_size1 + list_y - 350 * (1 - list_scale), list_size1, list_size1 * list_scale, 0, c_white, 1);
		draw_sprite_ext(s_question_sign1, 3, 640 - 5 + 160 * list_size1 + button_x, global.size / 2 + 4 - 80 + 400 * list_size1 + list_y - 350 * (1 - list_scale), list_size1, list_size1 * list_scale, 0, c_white, 1);
		
		draw_sprite_ext(s_question_sign11, 0, 640 - 5 - 160 * list_size1 - button_x, global.size / 2 + 4 - 80 + 140 * list_size1 + list_y - 250 * (1 - list_scale), list_size1, list_size1 * list_scale, 0, c_white, button_x / 500);
		draw_sprite_ext(s_question_sign11, 1, 640 - 5 + 160 * list_size1 + button_x, global.size / 2 + 4 - 80 + 140 * list_size1 + list_y - 250 * (1 - list_scale), list_size1, list_size1 * list_scale, 0, c_white, button_x / 500);
		draw_sprite_ext(s_question_sign11, 2, 640 - 5 - 160 * list_size1 - button_x, global.size / 2 + 4 - 80 + 400 * list_size1 + list_y - 350 * (1 - list_scale), list_size1, list_size1 * list_scale, 0, c_white, button_x / 500);
		draw_sprite_ext(s_question_sign11, 3, 640 - 5 + 160 * list_size1 + button_x, global.size / 2 + 4 - 80 + 400 * list_size1 + list_y - 350 * (1 - list_scale), list_size1, list_size1 * list_scale, 0, c_white, button_x / 500);
		
		
		draw_sprite_ext(s_question_question, 2, 640, global.size / 2 - 469 * list_size - 80 + list_y + 5, list_size * plas_scale, list_size, 0, c_black, 0.4);
		draw_sprite_ext(s_question_question, 0, 640 + 418  * list_size * (1 - plas_scale), global.size / 2 - 469 * list_size - 80 + list_y+ 5, list_size, list_size, 0, c_black, 0.4);
		draw_sprite_ext(s_question_question, 1, 640 - 418  * list_size * (1 - plas_scale), global.size / 2 - 469 * list_size - 80 + list_y+ 5, list_size, list_size, 0, c_black, 0.4);
		
		draw_sprite_ext(s_question_question, 2, 640, global.size / 2 - 469 * list_size - 80 + list_y, list_size * plas_scale, list_size, 0, c_white, 1);
		draw_sprite_ext(s_question_question, 0, 640 + 418  * list_size * (1 - plas_scale), global.size / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
		draw_sprite_ext(s_question_question, 1, 640 - 418  * list_size * (1 - plas_scale), global.size / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
		
		draw_set_font(f_question_regular);
		draw_set_color(c_black);
		draw_set_alpha(0.4);
		draw_text_transformed(640 - 1, global.size / 2 - 469 * list_size - 90 + 3 + list_y, "Какой знак пропущен?", plas_scale, 1, 0);
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_text_transformed(640, global.size / 2 - 469 * list_size - 90 + list_y, "Какой знак пропущен?", plas_scale, 1, 0);
		
		//if plas_scale < 1
			//{
			//draw_sprite_ext(s_plash_win, 2, 640, global.size / 2 - 469 * list_size - 80 + list_y, list_size * plas_scale, list_size, 0, c_white, 1);
			//draw_sprite_ext(s_plash_win, 0, 640 + 418  * list_size * (1 - plas_scale), global.size / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
			//draw_sprite_ext(s_plash_win, 1, 640 - 418  * list_size * (1 - plas_scale), global.size / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
			//}
			//else
			//{ win_plas += 0.4; draw_sprite_ext(s_plash_win_f, win_plas, 640, global.size / 2 - 469 * list_size - 80 + list_y, list_size * plas_scale, list_size, 0, c_white, 1); }
		
		//draw_set_font(f_win_regular);
		//draw_set_color(c_black);
		//draw_set_alpha(0.4);
		//draw_text_transformed(640 - 1, global.size / 2 - 469 * list_size - 100 + 3 + list_y, "ТЫ ПОБЕДИЛ!", plas_scale, 1, 0);
		//draw_set_color(c_white);
		//draw_set_alpha(1);
		//draw_text_transformed(640, global.size / 2 - 469 * list_size - 100 + list_y, "ТЫ ПОБЕДИЛ!", plas_scale, 1, 0);
		
		//draw_sprite_ext(s_plash_lose, 2, 640, global.size / 2 - 469 * list_size - 80 + list_y, list_size * plas_scale, list_size, 0, c_white, 1);
		//draw_sprite_ext(s_plash_lose, 0, 640 + 418  * list_size * (1 - plas_scale), global.size / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
		//draw_sprite_ext(s_plash_lose, 1, 640 - 418  * list_size * (1 - plas_scale), global.size / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
		
		//draw_set_font(f_win_regular);
		//draw_set_color(c_black);
		//draw_set_alpha(0.4);
		//draw_text_transformed(640 - 1, global.size / 2 - 469 * list_size - 100 + 3 + list_y, "ТЫ ПРОИГРАЛ", plas_scale, 1, 0);
		//draw_set_color(c_white);
		//draw_set_alpha(1);
		//draw_text_transformed(640, global.size / 2 - 469 * list_size - 100 + list_y, "ТЫ ПРОИГРАЛ", plas_scale, 1, 0);
	#endregion
	#region Способности
		//if keyboard_check_pressed(ord("V"))
		//	{ vvv = !vvv; };
			
			if vvv
				{
				if super_x > 0
					{ super_x -= 40; }
				}
				else
				{
				if super_x < 300
					{ super_x += 40; }
				}
		
			draw_sprite_ext(s_super_sherif, 0, 640 - 30 - 160 * list_size1 - 500 - super_x, global.size / 2 + 4 - 80 + 140 * list_size1 + list_y - 250 * (1 - list_scale) - 200, list_size1 * 1.1, list_size1 * list_scale * 1.1, 0, c_white, 1);
			draw_sprite_ext(s_super_huntress, 0, 1280 - (640 - 30 - 160 * list_size1 - 500) + super_x, global.size / 2 + 4 - 80 + 140 * list_size1 + list_y - 250 * (1 - list_scale) - 200, -list_size1 * 1.1, list_size1 * list_scale * 1.1, 0, c_white, 1);
	#endregion
	#region Выбор Темы
	if theme_choose = 1
		{
			if keyboard_check_pressed(ord("V"))
				{ theme_b_y[1] = 300; theme_b_mv[1] = !theme_b_mv[1]; }
		
			if theme_b_mv[1] = 1
				{
				draw_set_alpha(0.65);
				draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
				draw_set_alpha(1);
			
				if (theme_b_sx[1] < 1 && theme_b_dir[1] = 1) or (theme_b_sx[1] > 0 && theme_b_dir[1] = -1)
					{
				
					if theme_b_dir[1] = 1 or (theme_b_dir[1] = -1 && theme_end[1] != 1)
						{ theme_b_sx[1] += 0.25 * theme_b_dir[1]; }
					}
					else
					{
					if theme_b_dir[1] = 1
						{ theme_b_dir[1] = -theme_b_dir[1]; }
						else
						{
						if theme_go[1] != 2
							{ theme_b_im[1] = irandom(2); }
							else
							{ theme_b_im[1] = 0; theme_end[1] = 1; }
						
							switch(theme_b_im[1])
								{
								case 0: theme_b_th[1] = "MATH"; break;
								case 1: theme_b_th[1] = "MOVE"; break;
								case 2: theme_b_th[1] = "OTHER"; break;
								}
							theme_b_dir[1] = -theme_b_dir[1];
						}
					}
				
				var list_scale2;
				list_scale2 = 0.45;
			
				if theme_b_y[1] > -45 && theme_go[1] = 0
					{ theme_b_y[1] -= 15; }
					else
					{
					theme_go[1] = 1;
					if theme_b_y[1] < 0
						{ theme_b_y[1] += 10; }
						else
						{
						theme_go[1] = 2;
						if theme_end[1] = 1//(theme_b_dir[1] = -1 && theme_end[1] = 1)
							{
							if theme_sc[1] < 1
								{ theme_sc[1] += 0.05; }
							draw_sprite_ext(s_themes_ob, theme_b_im[1], theme_b_x[1], global.size / 2 - 50 + theme_b_y[1], theme_b_sx[1] * list_scale2 * theme_sc[1], list_scale2 * theme_sc[1], 0, c_white, 1);
							}
						}
					}
				
				if theme_go[1] = 2
					{
					theme_b_c[1] += 1;
					if theme_b_c[1] >= theme_b_cn[1]
						{ theme_l[1] = 1;  theme_b_c[1] = 0; }
				
					if theme_l[1] = 1
						{
						if theme_n[1] < 6
							{ theme_n[1] += 0.5; }
							else
							{ theme_n[1] = 0; theme_l[1] = 0; theme_b_cn[1] = irandom_range(room_speed * 3, room_speed * 6); }
						}
					}
			
				draw_sprite_ext(s_themes_button, theme_b_im[1], theme_b_x[1], global.size / 2 - 50 + theme_b_y[1], theme_b_sx[1] * list_scale2, list_scale2, 0, c_white, 1);
				if theme_go[1] = 2 && theme_l[1] = 1
					{ draw_sprite_ext(s_themes_button1, theme_n[1], theme_b_x[1], global.size / 2 - 50 + theme_b_y[1], theme_b_sx[1] * list_scale2, list_scale2, 0, c_white, 1); }
				draw_sprite_ext(s_themes_ss, theme_b_im[1], theme_b_x[1], global.size / 2 - 50 + theme_b_y[1], theme_b_sx[1] * list_scale2, list_scale2, 0, c_white, 1);
			
				if theme_end[1] = 1 && theme_sc[1] > 0.7
					{
					if theme_ps[1] < 1
						{ theme_ps[1] += 0.1; }
					draw_sprite_ext(s_themes_pl, 2, 640, global.size / 2 - 50 + 208 * list_scale2, list_scale2 * theme_ps[1], list_scale2, 0, c_white, 1);
					draw_sprite_ext(s_themes_pl, 0, 640 + 208  * list_scale2 * (1 - theme_ps[1]), global.size / 2 - 50 + 208 * list_scale2, list_scale2, list_scale2, 0, c_white, 1);
					draw_sprite_ext(s_themes_pl, 1, 640 - 208  * list_scale2 * (1 - theme_ps[1]), global.size / 2 - 50 + 208 * list_scale2, list_scale2, list_scale2, 0, c_white, 1);
				
					draw_set_font(f_question_regular1);
					draw_set_color(c_black);
					draw_set_alpha(0.8);
					draw_text_transformed(640, global.size / 2 - 50 + 204 * list_scale2, theme_b_th[1], theme_ps[1], 1, 0);
					draw_set_alpha(1);
					}
				//for(i=0; i<=2; i++) s_themes_button1
				//	{
				//	theme_b_mv[i] = 0;
				//	theme_b_im[i] = irandom(2);
				//	theme_b_sx[i] = 0;
			
				//	theme_b_x[i]  = 0;
				//	theme_b_y[i]  = 300;
				
				//	theme_b_c[i]  = 0;
				//	}
				}
			}
	#endregion
	#region Хелсбар
		var gui_size;
		gui_size = 0.45;
	
		draw_sprite_ext_t(s_healthbar_hp, 0, 48, global.size - 12, -gui_size, gui_size, 0, c_white, 1, c_white, c_black);
	
		draw_set_color(c_white);
		draw_rectangle(48 + 25, global.size - 12 - 47, 48 + (1205 - 35) * gui_size, global.size - 12 - 25, 0);
		
		draw_set_alpha(0.3);
		draw_set_color(c_black);
		draw_rectangle(48 + 25, global.size - 12 - 30, 48 + (1205 - 35) * gui_size, global.size - 12 - 25, 0);
		draw_set_alpha(1);
		
		draw_sprite_ext_t(s_rank_shield, 0, 10 + sprite_get_width(s_rank_shield) * gui_size / 2, global.size - sprite_get_height(s_rank_shield) * gui_size / 2 - 6, gui_size, gui_size, 0, c_white, 1, c_white, c_black);
		draw_set_font(f_description_regular_big);
		draw_text_transformed_t(10 + sprite_get_width(s_rank_shield) * gui_size / 2, global.size - 20 + 10 - 6, "25", 1, 1, 0, c_white, c_black);
		draw_sprite_ext_t(s_rank_skul, 0, 10 + sprite_get_width(s_rank_shield) * gui_size / 2, global.size - 20 - sprite_get_height(s_rank_shield) * gui_size / 2 - 6, gui_size, gui_size, 0, c_white, 1, c_white, c_black);
	
		draw_text_transformed_t(65 + sprite_get_width(s_rank_shield) * gui_size, global.size - 20 - 2 - sprite_get_height(s_healthbar_hp) * gui_size, "PLAYER", 1, 1, 0, c_white, c_black);
		for(i=1; i<=3; i++)
			{ draw_sprite_ext(s_healthbar_table_skul, 0, 65 + sprite_get_width(s_rank_shield) * gui_size + string_width("PLAYER") / 2 + sprite_get_width(s_healthbar_table_skul) * gui_size * i * 1.3, global.size - 20 - 4 - sprite_get_height(s_healthbar_hp) * gui_size, gui_size, gui_size, 0, c_black, 0.75); }
	
		//////////////////////////
	
		draw_sprite_ext_t(s_healthbar_hp, 0, 1280 - 48, global.size - 12, gui_size, gui_size, 0, c_white, 1, c_white, c_black);
	
		draw_set_color(c_white);
		draw_rectangle(1280 - 48 - 25, global.size - 12 - 47, 1280 - 48 - (1205 - 35) * gui_size, global.size - 12 - 25, 0);
		
		draw_set_alpha(0.4);
		draw_set_color(c_black);
		draw_rectangle(1280 - 48 - 25, global.size - 12 - 30, 1280 - 48 - (1205 - 35) * gui_size, global.size - 12 - 25, 0);
		draw_set_alpha(1);
		
		draw_sprite_ext_t(s_rank_shield, 0, 1280 - 10 - sprite_get_width(s_rank_shield) * gui_size / 2, global.size - sprite_get_height(s_rank_shield) * gui_size / 2 - 6, gui_size, gui_size, 0, c_white, 1, c_white, c_black);
		draw_set_font(f_description_regular_big);
		draw_text_transformed_t(1280 - 10 - sprite_get_width(s_rank_shield) * gui_size / 2, global.size - 20 + 10 - 6, "25", 1, 1, 0, c_white, c_black);
		draw_sprite_ext_t(s_rank_skul, 0, 1280 - 10 - sprite_get_width(s_rank_shield) * gui_size / 2, global.size - 20 - sprite_get_height(s_rank_shield) * gui_size / 2 - 6, gui_size, gui_size, 0, c_white, 1, c_white, c_black);
	
		draw_text_transformed_t(1280 - 65 - sprite_get_width(s_rank_shield) * gui_size, global.size - 20 - 2 - sprite_get_height(s_healthbar_hp) * gui_size, "ENEMY", 1, 1, 0, c_white, c_black);
	
		for(i=1; i<=3; i++)
			{ draw_sprite_ext(s_healthbar_table_skul, 0, 1280 - 65 - sprite_get_width(s_rank_shield) * gui_size - string_width("ENEMY") / 2 - sprite_get_width(s_healthbar_table_skul) * gui_size * i * 1.3, global.size - 20 - 4 - sprite_get_height(s_healthbar_hp) * gui_size, gui_size, gui_size, 0, c_black, 0.75); }
	#endregion
	#region Прочее
	/*
	if keyboard_check_pressed(ord("V"))
		{
		if q_col = c_white
			{ q_col = c_black; }
			else
			{ q_col = c_white; }
		}
	var q_col2;
	if q_col = c_white
		{ q_col2 = c_black; }
		else
		{ q_col2 = c_white; }
	
	draw_question(s_question_back, 0, 640, global.size / 2 - 15, 400, 470, 1, q_col2, 0.5);
	
	draw_question(s_question_back, 0, 640, global.size / 2 - 140 - 29 * 2, 350, 70, 1, q_col, 0.5);
	// uuuu
	draw_set_font(f_description_bold);
	draw_text_transformed_t(640, global.size / 2 - 140 - 29 * 2, "Какой знак пропущен?", 1, 1, 0, c_white, c_black);
	//
	
	draw_question(s_question_back, 0, 640, global.size / 2 - 140 - 29 * 2 + 50 + 29 * 2 + 60 + 20, 350, 125, 1, q_col, 0.5);
	// eeee
	draw_set_font(f_wanted_bold);
	draw_text_transformed_t(640, global.size / 2 - 140 - 29 * 2 + 50 + 29 * 2 + 60 + 20, "22?13=12", 1, 1, 0, c_white, c_black);
	//
	
	draw_question(s_question_back, 0, 640 - 350 / 2 + 64 / 2, global.size / 2 - 140 - 29 * 2 + 50 + 29 * 4 + 120 + 45 + 20 * 2, 35, 35, 1, q_col, 0.5);
	// +
	draw_set_font(f_wanted_bold);
	draw_text_transformed_t(640 - 350 / 2 + 64 / 2, global.size / 2 - 140 - 29 * 2 + 50 + 29 * 4 + 120 + 45 + 20 * 2, "+", 1, 1, 0, c_white, c_black);
	//
	
	draw_question(s_question_back, 0, 640 - 350 / 2 + 64 * 2, global.size / 2 - 140 - 29 * 2 + 50 + 29 * 4 + 120 + 45 + 20 * 2, 35, 35, 1, q_col, 0.5);
	// -
	draw_set_font(f_wanted_bold);
	draw_text_transformed_t(640 - 350 / 2 + 64 * 2, global.size / 2 - 140 - 29 * 2 + 50 + 29 * 4 + 120 + 45 + 20 * 2, "-", 1, 1, 0, c_white, c_black);
	//
	
	draw_question(s_question_back, 0, 640 - 350 / 2 + 64 * 3.5, global.size / 2 - 140 - 29 * 2 + 50 + 29 * 4 + 120 + 45 + 20 * 2, 35, 35, 1, q_col, 0.5);
	// *
	draw_set_font(f_wanted_bold);
	draw_text_transformed_t(640 - 350 / 2 + 64 * 3.5, global.size / 2 - 140 - 29 * 2 + 50 + 29 * 4 + 120 + 45 + 20 * 2, "*", 1, 1, 0, c_white, c_black);
	//
	
	draw_question(s_question_back, 0, 640 - 350 / 2 + 64 * 5, global.size / 2 - 140 - 29 * 2 + 50 + 29 * 4 + 120 + 45 + 20 * 2, 35, 35, 1, q_col, 0.5);
	// /
	draw_set_font(f_wanted_bold);
	draw_text_transformed_t(640 - 350 / 2 + 64 * 5, global.size / 2 - 140 - 29 * 2 + 50 + 29 * 4 + 120 + 45 + 20 * 2, "/", 1, 1, 0, c_white, c_black);
	//
	
	#endregion */
#endregion