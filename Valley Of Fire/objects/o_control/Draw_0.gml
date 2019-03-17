#region Отрисовка фона
	if global.room_to_go = "duel" or(global.menu_next = "main" or global.menu_now = "main" or global.menu_now = "quests")
		{
		#region Тестовые сдвиги фона
			var prx, pry;
			prx = global.paral_x * global.paral_sx;
			pry = global.paral_y * global.paral_sy
		#endregion
		#region Время и прочие характеристики
			#region Подстройка фона под время
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
				back_time[2]   = back_time[1] + 1;
				back_alpha[2]  = abs((day_hour * 60 * 60 + day_minute * 60 + day_second) - back_time[1] * 6 * 60 * 60) / (back_time[2] * 6 * 60 * 60 - back_time[1] * 6 * 60 * 60 );
				back_alpha[1]  = 1 - back_alpha[2];
			#endregion
			#region Отладка времени на пк
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
			#endregion
			#region Установка границ времени
				if day_hour >= 24
					{ day_hour = 0; }
				if day_minute >= 60
					{ day_minute = day_minute - 60; day_hour += 1; }
				if day_second >= 60
					{ day_second = day_second - 60; day_minute += 1; }
			#endregion
			#region Отрисовка фона
			var date;
				date = date_current_datetime();
				day_hour   = date_get_hour(date);
				day_minute = date_get_minute(date);
				day_second = date_get_second(date);
				draw_sprite_ext(s_train_back, back_time[1], 640 + back_x, global.height + back_y, back_s, back_s, 0, c_white, back_alpha[1]);
				draw_sprite_ext(s_train_back, back_time[2], 640 + back_x, global.height + back_y, back_s, back_s, 0, c_white, back_alpha[2]);
			#endregion
			#region Звёзды
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
	
				draw_sprite_ext(s_sunmoon, 0, 640 + lengthdir_x(640, -90 - 15 * (day_hour + day_minute / 60 + day_second / 3600)), global.height / 2 + lengthdir_y(200, -90 - 15 * (day_hour + day_minute / 60 + day_second / 3600)), moon_scale, moon_scale, -90 - 15 * (day_hour + day_minute / 60 + day_second / 3600), c_white, 1);
				draw_sprite_ext(s_sunmoon, 1, 640 - lengthdir_x(640, -90 - 15 * (day_hour + day_minute / 60 + day_second / 3600)), global.height / 2 - lengthdir_y(200, -90 - 15 * (day_hour + day_minute / 60 + day_second / 3600)), moon_scale, moon_scale, -90 - 15 * (day_hour + day_minute / 60 + day_second / 3600), c_white, 1);
			#endregion
				#region Рисование облаков
					for(i=0; i<=8; i++)
						{
						if back_clouds_y[i] > back_m_y
							{ back_clouds_y[i] = back_y + global.height - 1050 * back_s - 20; }
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
				#region Задник
					draw_sprite_ext(s_train_back2, back_time[1], 640 + back_x - prx, global.height + back_y - pry, back_s, back_s, 0, c_white, 1);
					draw_sprite_ext(s_train_back2, back_time[1], 640 + back_x - prx, global.height + back_y - pry, back_s, back_s, 0, c_white, back_alpha[1]);
					draw_sprite_ext(s_train_back2, back_time[2], 640 + back_x - prx, global.height + back_y - pry, back_s, back_s, 0, c_white, back_alpha[2]);
				#endregion
				}
			if global.background = "train"
				{
				#region Рисование гор
					back_m_y = back_y + global.height - 1050 * back_s;
	
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
	
						draw_sprite_ext(s_train_mountain, back_m_img[i], back_m_x[i] - prx, back_m_y - pry, back_m_s[i], back_m_s[i], 0, c_white, 1);
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
	
							draw_sprite_ext(s_train_mountain, back_m_img[i], back_m_x[i] - prx, back_m_y - pry, back_m_s[i], back_m_s[i], 0, c_white, 1);
							}
						}
				#endregion		
				#region Рисование песка
					back_sand_y   = back_y + global.height - 1050 * back_s;
					back_sand_spd = back_spd / 1.5 * 6;
	
					for(i=0; i<=5; i++)
						{
						back_sand_x[i] -= back_sand_spd;
						if back_sand_x[i] <= back_x + 640 - sprite_get_width(s_train_back) / 2 * back_s - sprite_get_width(s_train_sand) / 2 * back_s
							{ back_sand_x[i] = global.width + sprite_get_width(s_train_sand) / 2 * back_s; }
		
						draw_sprite_ext(s_train_sand, 0, back_sand_x[i] - prx, back_sand_y - pry, back_s, back_s, 0, c_white, 0.9);
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
				
								draw_sprite_ext(back_other_spr[i], back_other_img[i], back_other_x[i] - prx, back_y - 20 + back_other_y[i] - pry - (sprite_get_width(back_other_spr[i]) * back_other_s[i] * back_other_sk[i] / 3) / 2, back_other_s[i] * back_other_sk[i] / 3, back_other_s[i] * back_other_sk[i] * 1.25, -100, c_black, 0.45);
								draw_sprite_ext(back_other_spr[i], back_other_img[i], back_other_x[i] - prx, back_y - 20 + back_other_y[i] - pry, back_other_s[i] * back_other_sk[i], back_other_s[i] * back_other_sk[i], 0, c_white, 1);
								}
								else
								{ back_other_x[i] = 2280; }
							}
						}
				#endregion
				#region Анимация вагонов
					back_anim_1 -= back_spd / 1.5 * 0.35;
					back_anim_2 += back_spd / 1.5 * 0.35;

					back_train_y1 += back_spd / 1.5 * back_dir1 * back_spd;
					if abs(back_train_y1) >= back_spd * 5
						{ back_dir1 = -back_dir1; back_train_y1 += back_spd / 1.5 * back_dir1 * back_spd; }
				
					back_train_y2 += back_spd / 1.5 * back_dir2 * back_spd;
					if abs(back_train_y2) >= back_spd * 5
						{ back_dir2 = -back_dir2; back_train_y2 += back_spd / 1.5 * back_dir2 * back_spd; }
				
					if back_anim_1 < 0
						{ back_anim_1 = 2; }
					if back_anim_2 > 2
						{ back_anim_2 = 0; }

					draw_sprite_ext(s_train_decks, back_anim_1, 640 + back_x - sprite_get_width(s_train_back) * back_s / 2 + prx, global.height + back_y + pry, -back_s, back_s, 0, c_white, 1);
					draw_sprite_ext(s_train_decks, back_anim_2, 640 + back_x + sprite_get_width(s_train_back) * back_s / 2 + prx, global.height + back_y + pry, back_s, back_s, 0, c_white, 1);

					draw_sprite_ext(s_train_rails, 0, 640 + back_x + prx, global.height + back_y + pry, back_s, back_s, 0, c_white, 1);
					draw_sprite_ext(s_train_rails, 0, 640 + back_x + prx, global.height + back_y + pry, -back_s, back_s, 0, c_white, 1);

					draw_sprite_ext(s_train_wagon, 0, 640 + back_x + prx, global.height + back_y + back_train_y1 + pry, back_s, back_s, 0, c_white, 1);
				draw_sprite_ext(s_train_wagon, 0, 640 + back_x + prx, global.height + back_y + back_train_y2 + pry, -back_s, back_s, 0, c_white, 1);
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
				draw_sprite_ext(s_waterfall_back, 0, 640 + back_x - prx, global.height + back_y - pry, 1, 1, 0, c_white, 1);
				draw_sprite_ext(s_waterfall_reflection, 0, 640 + back_x - prx, global.height + back_y - 198 - pry, 1 - (back_train_y1) * 0.005, 1 - (back_train_y1) * 0.01, 0, c_white, 0.5);
				water_n += 0.3;
				draw_sprite_ext(s_waterfall_fall, water_n, 640 + back_x - prx, global.height + back_y - pry, 1, 1, 0, c_white, 0.7);
				draw_sprite_ext(s_waterfall_water, water_n, 640 + back_x - prx, global.height + back_y - pry, 1, 1, 0, c_white, 1);
				draw_sprite_ext(s_waterfall_bridge, 0, 640 + back_x + prx, global.height + back_y + back_train_y1 + pry, 1, 1, 0, c_white, 1);
				}
		#endregion
		#region Фон Салуна
			if global.background = "saloon"
				{
				#region Анимация дверей и листовки
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
				#endregion
				#region Отрисовка фона и дверей
					draw_sprite_ext(s_saloon_back, 0, 640 + back_x - prx, global.height + back_y - pry, 1, 1, 0, c_white, 1);
					draw_sprite_ext(s_saloon_doors, sl_doors_i, 640 + back_x - prx, global.height + back_y - pry, 1, 1, 0, c_white, 1);
				#endregion
				#region Перекати поле
					if sl_tumble_g = 0
						{
						sl_tumble_x = global.width + 50 + irandom(2000);
						sl_tumble_y = irandom_range(global.height / 2 + 20, global.height);
						sl_tumble_s = 0.1 + 0.3 * (sl_tumble_y / global.height);
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
							{ draw_sprite_ext(s_saloon_tumbleweed, 0, sl_tumble_x - prx, sl_tumble_y - pry, sl_tumble_s, sl_tumble_s, sl_tumble_a, c_white, 1); }
						}
				#endregion
				}
		#endregion
		#region Фон Дома
			if global.background = "house"
				{
				draw_sprite_ext(s_house_back,  0, 640 + back_x, global.height + back_y, back_s, back_s, 0, c_white, 1);
				draw_sprite_ext(s_house_house, 0, 640 + back_x, global.height + back_y, back_s, back_s, 0, c_white, 1);
				draw_sprite_ext(s_house_trees, 0, 640 + back_x - prx, global.height + back_y - pry + 50, back_s, back_s, 0, c_white, 1);
				}
		#endregion
		#region Поверх
			draw_sprite_ext(s_train_back1, o_control.back_time[1], 640 + o_control.back_x, global.height + o_control.back_y, o_control.back_s, o_control.back_s, 0, c_white, o_control.back_alpha2[o_control.back_time[1]] * o_control.back_alpha[1]);
			draw_sprite_ext(s_train_back1, o_control.back_time[2], 640 + o_control.back_x, global.height + o_control.back_y, o_control.back_s, o_control.back_s, 0, c_white, o_control.back_alpha2[o_control.back_time[2]] * o_control.back_alpha[2]);
		#endregion
		#region Фон Шахт
			if global.background = "mine"
				{
				#region Анимация света фонарика
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
				#endregion
				#region Яркость фонарика в разное время
					light_alpha = 0;
					if day_hour >= 18 && day_hour < 22
						{ light_alpha = 0.6 * (day_hour + day_minute / 60 + day_second / 360) / 22; }
					if (day_hour >= 22 && day_hour < 24)
						{ light_alpha = 0.8 * (day_hour + day_minute / 60 + day_second / 360) / 24; }
					if (day_hour >= 0 && day_hour < 3)
						{ light_alpha = 0.8 * 1 / (day_hour + day_minute / 60 + day_second / 360 + 0.001); }
					if (day_hour >= 3 && day_hour < 6)
						{ light_alpha = 0.6 * 3 / (day_hour + day_minute / 60 + day_second / 360); }
				#endregion
				#region Отрисовка фона и света фонарика
					draw_sprite_ext(s_mine_back, 0, 640 + back_x - prx, global.height + back_y - pry, 1, 1, 0, c_white, 1);
					draw_sprite_ext(s_light, 0, 640 + back_x + light_x - prx, global.height + back_y - light_y - pry, light_scale * light_s, light_scale * light_s, 0, c_white, light_alpha);
				#endregion
				}
		#endregion
		#region Суперспособность
			if global.super_ability = 1 or global.super_ability1 = 1
				{
				draw_set_alpha(0.45);
				draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
				draw_set_alpha(1);
				}
		#endregion
		}
#endregion