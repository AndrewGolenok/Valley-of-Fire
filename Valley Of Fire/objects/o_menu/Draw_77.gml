#region Шейдер
	shader_set(glsl_gaussian_blur);
	shader_set_uniform_f(uscale, 0.006, 0.0); //shader_set_uniform_f(uscale, 0.003, 0.0);
	surface_set_target(surf_blur_pass);
	draw_surface_ext(application_surface, 0, global.size, 1, -1, 0, c_white, 1);
	surface_reset_target();
	shader_set_uniform_f(uscale, 0.0, 0.008); //shader_set_uniform_f(uscale, 0.0, 0.004);
	draw_surface(surf_blur_pass, 0, 0);
	shader_reset();
#endregion
#region Меню
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
			gy = global.size / 2;
			gx = 1280 / 2;
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
	if menu_stage = "heroes"
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
			draw_text_transformed_t(gx, gy, "CHOOSE HERO", ts * s0, ts * s0, 0, c_white, c_black);
		#endregion
		#region Персонажи
			///
			xx5 = 560;
			yy5 = yy - 220;
			ss5 = 0.48;
			
			draw_sprite_ext(s_thief_idle, 0, xx - xx5, yy5, -ss5 * ps8, ss5 * ps8, 0, c_maroon, 1);
			//draw_sprite_ext(s_thief_idle, 0, xx - xx5, yy5, -ss5 * ps8, ss5 * ps8, 0, c_black, 0.8);
			
			draw_sprite_ext(s_sbill_idle, 0, xx + xx5, yy5, ss5, ss5, 0, c_maroon, 1);
			//draw_sprite_ext(s_sbill_idle, 0, xx + xx5, yy5, ss5, ss5, 0, c_black, 0.8);
			///
			///
			xx4 = 300;
			yy4 = yy - 220;
			ss4 = 0.48;
			
			//draw_sprite_ext(s_diego_idle2, 0, xx - xx4 - 50, yy4, -ss4, ss4, 0, c_maroon, 1);
			if show = 2
				{ draw_sprite_ext_t(s_diego_idle2, 0, xx - xx4 - 50, yy4, -ss4 * ps2, ss4 * ps2, 0, c_white, 1, c_white, c_black); }
				else
				{ draw_sprite_ext(s_diego_idle2, 0, xx - xx4 - 50, yy4, -ss4 * ps2, ss4 * ps2, 0, c_white, 1); }
			//draw_sprite_ext(s_diego_idle2, 0, xx - xx4, yy4, -ss4, ss4, 0, c_black, 0.8);
			
			draw_sprite_ext(s_gangster_idle, 0, xx + xx4 + 30, yy4, ss4, ss4, 0, c_maroon, 1);
			//draw_sprite_ext(s_gangster_idle, 0, xx + xx4 + 30, yy4, ss4, ss4, 0, c_black, 0.8);
			///
			///
			xx3 = 340;
			yy3 = yy - 20;
			ss3 = 0.5;
			
			draw_sprite_ext(s_shaman_idle, 0, xx + xx3 + 50, yy3, ss3, ss3, 0, c_maroon, 1);
			//draw_sprite_ext(s_shaman_idle, 0, xx + xx3 + 50, yy3, ss3, ss3, 0, c_black, 0.8);
			
			draw_sprite_ext(s_doctor_idle, 0, xx - xx3, yy3, -ss3, ss3, 0, c_maroon, 1);
			//draw_sprite_ext(s_doctor_idle, 0, xx - xx3, yy3, -ss3, ss3, 0, c_black, 0.8);
			///
			///
			xx2 = 550;
			yy2 = yy + 10;
			ss2 = 0.5;
			
			draw_sprite_ext(s_drunk_idle, 0, xx - xx2, yy2, -ss2, ss2, 0, c_maroon, 1);
			//draw_sprite_ext(s_drunk_idle, 0, xx - xx2, yy2, -ss2, ss2, 0, c_black, 0.8);
			
			if show = 3
				{ draw_sprite_ext_t(s_huntress_idle, 0, xx + xx2 + 30, yy2, ss2 * ps3, ss2 * ps3, 0, c_white, 1, c_white, c_black); }
				else
				{ draw_sprite_ext(s_huntress_idle, 0, xx + xx2 + 30, yy2, ss2 * ps3, ss2 * ps3, 0, c_white, 1); }
			//draw_sprite_ext(s_huntress_idle, 0, xx + xx2 - 30, yy2, ss2, ss2, 0, c_black, 0.8);
			///
			///
			xx1 = 200;
			yy1 = yy + 100;
			ss1 = 0.65;
			
			draw_sprite_ext(s_chief_idle, 0, xx + xx1, yy1, ss1 - 0.05, ss1 - 0.05, 0, c_maroon, 1);
			//draw_sprite_ext(s_chief_idle, 0, xx + xx1, yy1, ss1 - 0.05, ss1 - 0.05, 0, c_black, 0.8);
			
			if show = 1
				{ draw_sprite_ext_t(s_sherif_idle, 0, xx - xx1, yy1, -ss1 * ps1, ss1 * ps1, 0, c_white, 1, c_white, c_black); }
				else
				{ draw_sprite_ext(s_sherif_idle, 0, xx - xx1, yy1, -ss1 * ps1, ss1 * ps1, 0, c_white, 1); }
			//draw_sprite_ext(s_sherif_idle, 0, xx - xx1, yy1, -ss1, ss1, 0, c_black, 0.8);
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
				nx = xx - xx1 + 50;
				ny = yy1 - 190;
				}
			if show = 2
				{
				nx = xx - xx4 - 50;
				ny = yy4 - 120;
				}
			if show = 3
				{
				nx = xx + xx2 + 30;
				ny = yy2 - 120;
				}
			
			if point_in_rectangle(mouse_x, mouse_y, nx - 85, ny - 160, nx + 120, ny + 160) && hold_go = 0
				{
				if mouse_check_button(mb_left)
					{
					if !hold_start
						{
						if hold_time < 10
							{ hold_time += 1; }
							else
							{ hold_start = 1; }
						}
						else
						{
						if hold_true < room_speed * 0.8
							{ hold_true += 1; }
							else
							{ global.hero = show; room_goto_t("duel"); hold_go = 1; }
						for(i=1; i <= 360 * (hold_true / (room_speed * 0.8)); i++)
							{ draw_line_color(nx, ny - 60, nx + lengthdir_x(30, i + 90), ny - 60 + lengthdir_y(30, i + 90), c_white, c_white); }
						}
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
					draw_text_transformed(nx, ny, "HOLD\nTO\nSTART", 0.09, 0.09, 0);
					draw_set_alpha(1);
					}
				}
		#endregion
		}
#endregion