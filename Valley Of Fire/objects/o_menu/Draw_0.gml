#region Шейдер
	var prx, pry;
	prx = global.paral_x * global.paral_sx;
	pry = global.paral_y * global.paral_sy;
	
	application_surface_draw_enable(1);
	
	draw_set_alpha(0.3 * vs_alpha);
	draw_surface(application_surface,  2.5,  2.5);
	draw_surface(application_surface, -2.5,  2.5);
	draw_surface(application_surface,  2.5, -2.5);
	draw_surface(application_surface, -2.5, -2.5);
	
	draw_surface(application_surface,  5,  5);
	draw_surface(application_surface, -5,  5);
	draw_surface(application_surface,  5, -5);
	draw_surface(application_surface, -5, -5);
	
	draw_surface(application_surface,  7.5,  7.5);
	draw_surface(application_surface, -7.5,  7.5);
	draw_surface(application_surface,  7.5, -7.5);
	draw_surface(application_surface, -7.5, -7.5);
	draw_set_alpha(1);
	//shader_set(glsl_gaussian_blur);
	//shader_set_uniform_f(uscale, 0.006, 0.0); //shader_set_uniform_f(uscale, 0.003, 0.0);
	//surface_set_target(surf_blur_pass);
	//draw_surface_ext(application_surface, 0, global.size, 1, -1, 0, c_white, 1);
	//surface_reset_target();
	//shader_set_uniform_f(uscale, 0.0, 0.008); //shader_set_uniform_f(uscale, 0.0, 0.004);
	//draw_surface(surf_blur_pass, 0, 0);
	//shader_reset();
#endregion
#region Меню
	#region Выбор сложности
		if menu_stage = "dificult"
			{
			#region Анимация
				if s_stage = 0
					{
					if s0 < 1
						{ s0 += 0.1; }
						else
						{
						if s1 < 1
							{ s1 += 0.1; }
							else
							{
							if s2 < 1
								{ s2 += 0.1; }
								else
								{
								if s3 < 1
									{ s3 += 0.1; }
									else
									{ s_stage = 1; }
								}
							}
						}
					}
				if s_stage = 1
					{
					if s_time > 0
						{ s_time -= 1; }
						else
						{ s_stage = 2; }
					}
				if s_stage = 2
					{
					if s1 < 1.2
						{ s1 += 0.025; }
						else
						{ s_stage = 3; }
					}
				if s_stage = 3
					{
					if s2 < 1.2
						{ s2 += 0.025; }
						else
						{ s_stage = 4; }
					if s1 > 1
						{ s1 -= 0.025; }
					}
				if s_stage = 4
					{
					if s3 < 1.2
						{ s3 += 0.025; }
						else
						{ s_stage = 5; }
					if s1 > 1
						{ s1 -= 0.025; }
					if s2 > 1
						{ s2 -= 0.025; }
					}
				if s_stage = 5
					{
					if s1 > 1
						{ s1 -= 0.025; }
					if s2 > 1
						{ s2 -= 0.025; }
					if s3 > 1
						{ s3 -= 0.025; }
						else
						{ s_stage = 6; }
					}
				if s_stage = 6
					{
					s_time = irandom_range(4, 10) * room_speed;
					s_stage = 1;
					}
			#endregion
			#region Рисование
				var gy, gx, gd, gyr, gyt, gyd, scale, scale1, gyw, scale2;
				gy = global.size / 2 + pry;
				gx = 1280 / 2 + prx;
				gd = 360;
				gyr = gy + 20;
				gyt = gy - 290;
				gyd = gyr - 160;
				gyw = gyr + 160;
				scale = 0.2;
				scale1 = 0.27;
				scale2 = 0.15;
	
				draw_set_font(global.game_font);

				draw_text_transformed_t(gx, gyt, "CHOOSE DIFFICULT", scale1 * s0, scale1 * s0, 0, c_white, c_black);

				draw_sprite_ext(s_rank_shield, 0, gx - gd, gyr, s1 * sd1, s1 * sd1, 0, c_white, 1);
				draw_sprite_ext(s_rank_skul, 0, gx - gd, gyr, s1 * sd1, s1 * sd1, 0, c_white, 1);
				draw_text_transformed_t(gx - gd, gyd, "EASY", scale * s1, scale * s1, 10, global.text_color, c_black);
				draw_text_transformed_t(gx - gd, gyw, "15-11\nRANK", scale2 * s1, scale2 * s1, 0, c_white, c_black);
	
	
				draw_sprite_ext(s_rank_shield, 1, gx, gyr, s2 * sd2, s2 * sd2, 0, c_white, 1);
				draw_sprite_ext(s_rank_skul, 1, gx, gyr, s2 * sd2, s2 * sd2, 0, c_white, 1);
				draw_text_transformed_t(gx, gyd, "NORMAL", scale * s2, scale * s2, 10, make_color_rgb(175, 238, 238), c_black);
				draw_text_transformed_t(gx , gyw, "10-6\nRANK", scale2 * s2, scale2 * s2, 0, c_white, c_black);
	
				draw_sprite_ext(s_rank_shield, 2, gx + gd, gyr, s3 * sd3, s3 * sd3, 0, c_white, 1);
				draw_sprite_ext(s_rank_skul, 2, gx + gd, gyr, s3 * sd3, s3 * sd3, 0, c_white, 1);
				draw_text_transformed_t(gx + gd, gyd, "HARD", scale * s3, scale * s3, 10, make_color_rgb(255, 99, 71), c_black);
				draw_text_transformed_t(gx + gd, gyw, "5-1\nRANK", scale2 * s3, scale2 * s3, 0, c_white, c_black);
			#endregion
			#region Нажатие
				if point_in_circle(mouse_x, mouse_y, gx - gd, gyr, 110)
					{
					if mouse_check_button(mb_left)
						{ sd1 = 1.1; }
						else
						{ sd1 = 1; }
		
					if mouse_check_button_released(mb_left)
						{
						global.player_rank = 15;
						global.enemy_rank = irandom_range(11, 15);
					
						s0 = 0;
						menu_stage = "heroes";
						}
					}
					else
					{ sd1 = 1; }
				if point_in_circle(mouse_x, mouse_y, gx, gyr, 110)
					{
					if mouse_check_button(mb_left)
						{ sd2 = 1.1; }
						else
						{ sd2 = 1; }
		
					if mouse_check_button_released(mb_left)
						{
						global.player_rank = 10;
						global.enemy_rank = irandom_range(6, 10);
					
						s0 = 0;
						menu_stage = "heroes";
						}
					}
					else
					{ sd2 = 1; }
				if point_in_circle(mouse_x, mouse_y, gx + gd, gyr, 110)
					{
					if mouse_check_button(mb_left)
						{ sd3 = 1.1; }
						else
						{ sd3 = 1; }
		
					if mouse_check_button_released(mb_left)
						{
						global.player_rank = 5;
						global.enemy_rank = irandom_range(1, 5);
					
						s0 = 0;
						menu_stage = "heroes";
						}
					}
					else
					{ sd3 = 1; }
			#endregion
			}
	#endregion
	#region Выбор героя
		if menu_stage = "heroes2"
			{
			#region Переменные
				var ts, gx, gy, hero_width, hero_spr;
				ts = 0.35;
				gx = 640 + prx;
				gy = 50  + pry;
			#endregion
			#region Текст
				if s0 < 1
					{ s0 += 0.1; }
				anim += 1;
			
				draw_set_font(global.game_font);
				draw_text_transformed_a(gx, gy, "CHOOSE HERO", ts * s0, ts * s0, 0, c_white, c_black);
			#endregion
			#region Персонажи
				for(i=1;i<=global.heroes_val;i++)
					{
					hero_spr   = asset_get_index("s_" + string(global.hero_code_name[hero_g[i]]));
					
					//draw_sprite_ext(hero_spr, 0, hero_x[i], hero_y, hero_size, hero_size, 0, c_white, 1);
					}
			#endregion
			}
	#endregion
	#region Прочее
	if menu_stage = "heroes1"
		{
		#region Переменные
			var gx, gy, xx, yy, ts, ps, xx1, yy1, ss1, xx2, yy2, ss2, xx3, yy3, ss3, xx4, yy4, ss4,
			xx5, yy5, ss5, xx6, yy6, ss6, xx7, yy7, ss7, xx8, yy8, ss8, xx9, yy9, ss9, xx10, yy10, ss10,
			xx11, yy11, ss11;
			gy = global.size / 2 - 290;
			gx = 1280 / 2;
			
			ts = 0.2;
			
			xx = 1280 / 2;
			yy = global.size;
			
			var hercol;
			hercol = c_white;
			if show = 1
				{ hercol = c_orange; }
			if show = 2
				{ hercol = c_maroon; }
			if show = 3
				{ hercol = c_fuchsia; }
		#endregion
		#region Текст
			if s0 < 1
				{ s0 += 0.1; }
			anim += 1;
			
			draw_set_font(global.game_font);
			draw_text_transformed_a(gx, 50, "LEVEL: " + string(global.player_rank), ts * s0, ts * s0, 0, c_white, c_black);
		#endregion
		#region Персонажи
			///
			xx5 = 560 + prx;
			yy5 = yy - 220 + pry;
			ss5 = 0.48;
			
			draw_sprite_ext(s_thief, 0, xx - xx5, yy5, -ss5 * ps8, ss5 * ps8, 0, c_maroon, 1);
			//draw_sprite_ext(s_thief, 0, xx - xx5, yy5, -ss5 * ps8, ss5 * ps8, 0, c_black, 0.8);
			
			draw_sprite_ext(s_sbill, 0, xx + xx5, yy5, ss5, ss5, 0, c_maroon, 1);
			//draw_sprite_ext(s_sbill, 0, xx + xx5, yy5, ss5, ss5, 0, c_black, 0.8);
			///
			///
			xx4 = 300 + prx * 1.04;
			yy4 = yy - 220 + pry * 1.04;
			ss4 = 0.48;
			
			//draw_sprite_ext(s_diego2, 0, xx - xx4 - 50, yy4, -ss4, ss4, 0, c_maroon, 1);
			if show = 2
				{ draw_sprite_ext_t(s_diego2, 0, xx - xx4 - 50, yy4, -ss4 * ps2, ss4 * ps2, 0, c_white, 1, c_white, c_black); }
				else
				{ draw_sprite_ext(s_diego2, 0, xx - xx4 - 50, yy4, -ss4 * ps2, ss4 * ps2, 0, c_white, 1); }
			//draw_sprite_ext(s_diego2, 0, xx - xx4, yy4, -ss4, ss4, 0, c_black, 0.8);
			
			draw_sprite_ext(s_gangster, 0, xx + xx4 + 30, yy4, ss4, ss4, 0, c_maroon, 1);
			//draw_sprite_ext(s_gangster, 0, xx + xx4 + 30, yy4, ss4, ss4, 0, c_black, 0.8);
			///
			///
			xx3 = 340 + prx * 1.06;
			yy3 = yy - 20 + pry * 1.06;
			ss3 = 0.5;
			
			draw_sprite_ext(s_shaman, 0, xx + xx3 + 50, yy3, ss3, ss3, 0, c_maroon, 1);
			//draw_sprite_ext(s_shaman, 0, xx + xx3 + 50, yy3, ss3, ss3, 0, c_black, 0.8);
			
			draw_sprite_ext(s_doctor, 0, xx - xx3, yy3, -ss3, ss3, 0, c_maroon, 1);
			//draw_sprite_ext(s_doctor, 0, xx - xx3, yy3, -ss3, ss3, 0, c_black, 0.8);
			///
			///
			xx2 = 550 + prx * 1.08;
			yy2 = yy + 10 + pry * 1.08;
			ss2 = 0.5;
			
			draw_sprite_ext(s_drunk, 0, xx - xx2, yy2, -ss2, ss2, 0, c_maroon, 1);
			//draw_sprite_ext(s_drunk, 0, xx - xx2, yy2, -ss2, ss2, 0, c_black, 0.8);
			
			if show = 3
				{ draw_sprite_ext_t(s_huntress, 0, xx + xx2 + 30, yy2, ss2 * ps3, ss2 * ps3, 0, c_white, 1, c_white, c_black); }
				else
				{ draw_sprite_ext(s_huntress, 0, xx + xx2 + 30, yy2, ss2 * ps3, ss2 * ps3, 0, c_white, 1); }
			//draw_sprite_ext(s_huntress, 0, xx + xx2 - 30, yy2, ss2, ss2, 0, c_black, 0.8);
			///
			///
			xx1 = 200 + prx * 1.1;
			yy1 = yy + 100 + pry * 1.1;
			ss1 = 0.65;
			
			draw_sprite_ext(s_chief, 0, xx + xx1, yy1, ss1 - 0.05, ss1 - 0.05, 0, c_maroon, 1);
			//draw_sprite_ext(s_chief, 0, xx + xx1, yy1, ss1 - 0.05, ss1 - 0.05, 0, c_black, 0.8);
			
			if show = 1
				{ draw_sprite_ext_t(s_sherif, 0, xx - xx1, yy1, -ss1 * ps1, ss1 * ps1, 0, c_white, 1, c_white, c_black); }
				else
				{ draw_sprite_ext(s_sherif, 0, xx - xx1, yy1, -ss1 * ps1, ss1 * ps1, 0, c_white, 1); }
			//draw_sprite_ext(s_sherif, 0, xx - xx1, yy1, -ss1, ss1, 0, c_black, 0.8);
			///
		#endregion
		#region Нажатие
			if hold_go = 0
				{
				// Воришка
				//if point_in_rectangle(mouse_x, mouse_y, xx - xx5 - 75, yy5 - 360, xx - xx5 + 75, yy5 - 100)
				//	{
				//	if mouse_check_button(mb_left)
				//		{ ps8 = 1.1; }
				//		else
				//		{ ps8 = 1; }
				//	if mouse_check_button_released(mb_left)
				//		{ show = 8; }
				//	}
				//	else
				//	{ ps8 = 1; }
				//
				// Шериф
				if point_in_rectangle(mouse_x, mouse_y, xx - xx1 - 55, yy1 - 410, xx - xx1 + 145, yy1)
					{
					if mouse_check_button(mb_left)
						{ ps1 = 1.1; }
						else
						{ ps1 = 1; }
					if mouse_check_button_released(mb_left)
						{ show = 1; ps1 = 1.1; }
					}
					else
					{ ps1 = 1; }
				//
				// Диего
				if point_in_rectangle(mouse_x, mouse_y, xx - xx4 - 50 - 95, yy4 - 380, xx - xx4 - 50 + 95, yy4 - 120)
					{
					if mouse_check_button(mb_left)
						{ ps2 = 1.1; }
						else
						{ ps2 = 1; }
					if mouse_check_button_released(mb_left)
						{ show = 2; }
					}
					else
					{ ps2 = 1; }
				//
				// Охотница
				if point_in_rectangle(mouse_x, mouse_y, xx + xx2 + 30 - 110, yy2 - 350, xx + xx2 + 30 + 75, yy2)
					{
					if mouse_check_button(mb_left)
						{ ps3 = 1.1; }
						else
						{ ps3 = 1; }
					if mouse_check_button_released(mb_left)
						{ show = 3; }
					}
					else
					{ ps3 = 1; }
			
				if show = 1
					{ ps1 = 1.1; }
				if show = 2
					{ ps2 = 1.1; }
				if show = 3
					{ ps3 = 1.1; }
				//draw_rectangle(xx + xx2 + 30 - 110, yy2 - 350, xx + xx2 + 30 + 75, yy2, 1);
				//
				}
		#endregion
		#region Имя и характеристики
			var nx, ny;
			nx = 100000000;
			ny = 0;
			if show = 1
				{
				nx = xx - xx1 + 50 - prx;
				ny = yy1 - 190 - pry;
				}
			if show = 2
				{
				nx = xx - xx4 - 50 - prx;
				ny = yy4 - 120 - pry;
				}
			if show = 3
				{
				nx = xx + xx2 + 30 - prx;
				ny = yy2 - 120 - pry;
				}
			
			if point_in_rectangle(mouse_x, mouse_y, nx - 85, ny - 160, nx + 120, ny + 160) && hold_go = 0
				{
				if mouse_check_button_pressed(mb_left)
					{
					//if !hold_start
					//	{
					//	if hold_time < 10
					//		{ hold_time += 1; }
					//		else
					//		{ hold_start = 1; }
					//	}
					//	else
					//	{
						//if hold_true < room_speed * 0.8
						//	{ hold_true += 1; }
						//	else
							{ global.hero = show; menu_stage = "search"; hold_go = 1; }
						//for(i=1; i <= 360 * (hold_true / (room_speed * 0.8)); i++)
						//	{ draw_line_color(nx, ny - 60, nx + lengthdir_x(30, i + 90), ny - 60 + lengthdir_y(30, i + 90), c_white, c_white); }
						//}
					}
					else
					{
					hold_time  = 0;
					hold_start = 0;
					hold_true  = 0;
					}
				}
				else
				{
				hold_time  = 0;
				hold_start = 0;
				hold_true  = 0;
				}
			
			if show != 0
				{
				draw_set_font(global.game_font);
				draw_text_transformed_t(xx, 150, string_upper(global.hero_code_name[show]), 0.25, 0.25, 0, hercol, c_black);
				draw_text_transformed_t(xx, 200, string_upper("(" + global.hero_class[show] + ")"), 0.09, 0.09, 0, hercol, c_black);
				
				var super;
				if show = 1
					{ super = s_super_sherif; }
				if show = 2
					{ super = s_super_diego; }
				if show = 3
					{ super = s_super_huntress; }
				draw_text_transformed_t(xx - 170, 250, string_upper(string(global.hp[show])), 0.2, 0.2, 0, c_black, c_white);
				draw_text_transformed_t(xx -170 + string_width(string(global.hp[show])) * 0.2 / 2 + 35, 250, "HP", 0.1, 0.1, 0, c_black, c_white);
				
				draw_text_transformed_t(xx - 170, 300, string_upper(string(global.atk[show])), 0.2, 0.2, 0, c_black, c_white);
				draw_text_transformed_t(xx - 170 + string_width(string(global.atk[show])) * 0.2 / 2 + 50, 300, "ATK", 0.1, 0.1, 0, c_black, c_white);
				
				draw_sprite_ext(super, 1, xx, 275, 0.5, 0.5, 0, c_white, 1);
				draw_sprite_ext(s_themes_button, show, xx + 135, 275, 0.28, 0.28, 0, c_white, 1);
				draw_sprite_ext(s_themes_ob, 0, xx + 135, 275, 0.28, 0.28, 0, c_white, 1);
				draw_sprite_ext(s_themes_ss, show, xx + 135, 275, 0.28, 0.28, 0, c_white, 1);
				///
				draw_sprite_ext(s_hand, 0, nx, ny - 60, 0.25, 0.25, 0, c_white, 1);
				draw_set_color(c_white);
				if !instance_exists(o_transf) //hold_start = 0
					{
					draw_set_alpha(1 - (hold_true / (room_speed * 0.8)));
					draw_text_transformed(nx, ny, "TAP\nTO\nSTART", 0.09, 0.09, 0);
					draw_set_alpha(1);
					}
				}
		#endregion
		}
	#endregion
	#region Подбор противника
		if menu_stage = "search"
			{
			var vs_spr, vs_spr1, vs_size;
			vs_size = 1;
			vs_spr  = asset_get_index("s_" + string(global.hero_code_name[global.hero]));
			vs_spr1 = asset_get_index("s_" + string(global.hero_code_name[vs_hero]));
			
			if global.hero = 1
				{ sherif_x = - 80; }
				else
				{ sherif_x = 0; }
			if vs_hero = 1
				{ sherif_x1 = - 80; }
				else
				{ sherif_x1 = 0; }
			for(i=0;i<=5;i++)
				{
				draw_sprite_ext(vs_spr , 0, vs_x1 + sherif_x - 5 * i, vs_y1 - 5 * i, -vs_size, vs_size, 20, c_black, 0.2);
				draw_sprite_ext(vs_spr1, 0, vs_x2 - sherif_x1 + 5 * i, vs_y2 - 5 * i, vs_size , vs_size, 20, c_black, 0.2);
				}
			if vs_go = 0
				{
				if vs_x1 < 20
					{ vs_x1 += 25; }
				if vs_y1 > global.size
					{ vs_y1 -= 50; }
				
				if vs_x2 > 1280 - 20
					{ vs_x2 -= 25; }
				if vs_y2 < global.size
					{ vs_y2 += 50; }
					else
					{ vs_go = 1; }
				}
			if vs_go = 1
				{
				vs_x1 += 0.1;
				vs_y1 -= 0.1;
				vs_x2 -= 0.1;
				vs_y2 += 0.1;
				
				//if vs_vx < 640 - 10
				//	{ vs_vx += 25; }
				if vs_vy > global.size / 2
					{ vs_vy -= 70; }
				
				//if vs_sx > 640 + 10
				//	{ vs_sx -= 25; }
				if vs_sy < global.size / 2
					{ vs_sy += 70; }
					else
					{ vs_go = 2; }
				}
			if vs_go = 2
				{
				vs_x1 += 0.05;
				vs_y1 -= 0.05;
				vs_x2 -= 0.05;
				vs_y2 += 0.05;
				vs_sy += 0.1;
				vs_vy += 0.1;
				
				if vs_time < 10
					{ vs_time += 1; }
					else
					{ vs_go = 3; }
				//with(o_menu)
				//	{ instance_destroy(); }
				//instance_create_depth(0, 0, -1, o_list);
				//global.enemy = 0;
				//instance_create_depth(0, 0, 0, o_hero);
				//global.enemy = 1;
				//instance_create_depth(0, 0, 0, o_hero);
				}
			if vs_go = 3
				{
				if vs_sy < global.size + 1000
					{ vs_sy += 70; }
				if vs_vy > global.size - 1000
					{ vs_vy -= 70; }
				if vs_alpha > 0
					{ vs_alpha -= 0.05; }
				if vs_x1 > - 600
					{
					vs_x1 -= 30;
					vs_y1 += 30;
					vs_x2 += 30;
					vs_y2 -= 30;
					}
					else
					{
					instance_create_depth(0, 0, -1, o_list);
					global.enemy = 0;
					instance_create_depth(0, 0, 0, o_hero);
					global.enemy = 1;
					instance_create_depth(0, 0, 0, o_hero);
					global.room_to_go = "duel";
					with(o_padpiska)
						{ instance_destroy(); }
					o_control.sl_tumble_g = 0;
					instance_destroy();
					}
				}
			draw_sprite_ext(vs_spr , 0, vs_x1 + sherif_x, vs_y1, -vs_size, vs_size, 20, c_white, 1);
			draw_sprite_ext(vs_spr1, 0, vs_x2 - sherif_x1, vs_y2, vs_size , vs_size, 20, c_white, 1);
			
			draw_set_font(global.game_font);
			draw_text_transformed_a(vs_vx, vs_vy, "V", vs_ts * vs_alpha, vs_ts * vs_alpha, -20, c_white, c_black);
			draw_text_transformed_a(vs_sx, vs_sy, "S", vs_ts * vs_alpha, vs_ts * vs_alpha, -20, c_white, c_black);
			
			//room_goto_t("duel");
			}
	#endregion
#endregion

#region Изменение ранга
	if keyboard_check_pressed(ord("O"))
		{
		if global.player_rank < 15
			{ global.player_rank += 1; }
		}
	if keyboard_check_pressed(ord("P"))
		{
		if global.player_rank > 1
			{ global.player_rank -= 1; }
		}
#endregion