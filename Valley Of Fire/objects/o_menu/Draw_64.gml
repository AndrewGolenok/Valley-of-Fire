#region Параллакс
	var prx, pry;
		prx = global.paral_x * global.paral_sx;
		pry = global.paral_y * global.paral_sy;
#endregion

#region Главное меню
	if global.menu_next = "main" or global.menu_now = "main"
		{
		// КНОПКИ
		var ms1, ms2, ms3, ms4, ms5;
		ms1 = 1;
		ms2 = 1;
		ms3 = 1
		ms4 = 1;
		ms5 = 1;
		if point_in_rectangle(mouse_x, mouse_y, 640 - 150 - 125,  global.size - 30 - 125, 640 - 150 + 125, global.size - 30 + 125)
			{
			if mouse_check_button(mb_left)
				{ ms2 = 1.1; }
			if mouse_check_button_released(mb_left)
				{
				totem_yy  = 0;
				totem_yy1 = 0;
				global.menu_next = "totem";
				}
			}
		if point_in_rectangle(mouse_x, mouse_y, 640 + 150 - 125,  global.size - 30 - 150, 640 + 150 + 125, global.size - 30 + 125)
			{
			if mouse_check_button(mb_left)
				{ ms3 = 1.1; }
			if mouse_check_button_released(mb_left)
				{ global.menu_next = "store"; }
			}
		if point_in_rectangle(mouse_x, mouse_y, 1130 - 125,  global.size - 30 - 150, 1130 + 125, global.size - 30 + 125)
			{
			if mouse_check_button(mb_left)
				{ ms4 = 1.1; }
			if mouse_check_button_released(mb_left)
				{ global.menu_next = "training"; }
			}
		if point_in_rectangle(mouse_x, mouse_y, 150 - 125,  global.size - 30 - 150, 150 + 125, global.size - 30 + 125)
			{
			if mouse_check_button(mb_left)
				{ ms1 = 1.1; }
			if mouse_check_button_released(mb_left)
				{
				hero_yy  = 0;
				hero_yy1 = 0;
				global.menu_next = "heroes";
				}
			}
		
		draw_set_alpha(0.4)
			draw_rectangle_color(0, global.size - 70, 1280, global.size, c_white, c_white, c_white, c_white, 0);
		draw_set_alpha(1);
		
		draw_sprite_ext_t(s_menu_buttons, 1, 150,  global.size - 100, ms1, ms1, 0, c_white, 1, c_white, c_black);
		draw_sprite_ext_t(s_menu_buttons, 2, 640 - 150,  global.size - 100, ms2, ms2, 0, c_white, 1, c_white, c_black);
		draw_sprite_ext_t(s_menu_buttons, 3, 640 + 150, global.size - 100, ms3, ms3, 0, c_white, 1, c_white, c_black);
		draw_sprite_ext_t(s_menu_buttons, 0, 1130, global.size - 100, ms4, ms4, 0, c_white, 1, c_white, c_black);
		
		draw_set_alpha(1)
			draw_set_font(global.game_font);
			draw_set_halign(fa_center);
			draw_set_valign(fa_bottom);
				draw_text_transformed_t(150,  global.size - 25, "HEROES", 0.15, 0.15, 5, global.color_white, c_black);
				draw_text_transformed_t(640 - 150,  global.size - 25, "TOTEMS", 0.15, 0.15, 5, global.color_white, c_black);
				draw_text_transformed_t(640 + 150,  global.size - 25, "STORE", 0.15, 0.15, 5, global.color_white, c_black);
				draw_text_transformed_t(1130, global.size - 25,  "TRAINING", 0.15, 0.15, 5, global.color_white, c_black);	
		draw_set_alpha(1);
		// КНОПКИ
		
		// ЛОГО
		draw_sprite_ext(s_logo1_smartcowboys, 0, 640, 80, 0.35, 0.35, 0, c_white, 1);
		draw_sprite_ext(s_logo1_smartcowboys, 1, 640, 80 + 120, 0.35, 0.35, 0, c_white, 1);
		draw_sprite_ext(s_logo1_smartcowboys, 1, 640, 80 + 120, 0.35, 0.35, 0, c_red, 0.75);
		
		draw_sprite_ext(s_logo1_smartcowboys, 2, 640, 80 + 50, 0.35, 0.35, 10, c_white, 1);
		draw_sprite_ext(s_logo1_smartcowboys, 2, 640, 80 + 50, 0.35, 0.35, 10, c_red, 0.75);
		// ЛОГО
		
		// ИГРА
		//draw_sprite_ext_t(s_sunmoon, 3, 1130, global.size - 100, 1, 1, 0, c_white, 1, c_white, c_black);
		//draw_set_alpha(0.3);
		//draw_set_color(c_black);
		//draw_text_transformed(640 + prx, global.size / 2 + 10 + pry, "PLAY", 0.4, 0.4, 5);
		//draw_set_color(c_white);
		//draw_set_alpha(1);
		
		if point_in_rectangle(mouse_x, mouse_y, 640 - 90, global.size / 2 - 60, 640 + 90, global.size / 2 + 60)
			{
			if mouse_check_button(mb_left)
				{ ms5 = 1.1; }
			if mouse_check_button_released(mb_left)
				{
				if global.training_o = 1
					{ global.duel = 1; }
				global.menu_next = "training";
				}
			}
		//draw_rectangle(640 - 90, global.size / 2 - 45, 640 + 90, global.size / 2 + 45, 1);
		draw_text_transformed_t(640, global.size / 2, "PLAY", 0.27 * ms5, 0.27 * ms5, 5, global.color_white, c_black);
		//ИГРА
		}
#endregion

#region Тотемы / Выбор тотемов
if global.menu_now = "totem" or global.menu_next = "totem"
	{
	if global.menu_next = "totem"
		{
		if global.menu_now != "totem"
			{
			if training_back_y - global.size / 12 > 0
				{ training_back_y -= global.size / 12; }
				else
				{
				global.menu_now = "totem";
				training_back_y = 0;
				}
			}
		}
		else
		{
		if training_back_y - global.size / 12 < global.size + 350
			{ training_back_y += global.size / 12; }
			else
			{
			//if global.duel = 1
			//	{
			//	if global.menu_next = "main"
			//		{ global.duel = 0; global.menu_now = "main"; }
			//	if global.menu_next = "vs"
			//		{ global.menu_now = "main"; global.menu_next = "vs"; }
			//	if global.menu_next = "heroes"
			//		{ global.menu_now = "main"; global.menu_next = "heroes"; }
			//	}
			//	else
			//	{ global.menu_now = global.menu_next; }
			global.menu_now = global.menu_next;
			training_back_y = global.size + 350;
			}
		}
		
	var colb;
	colb = make_color_rgb(123, 0, 28);
	//draw_rectangle_color(0, training_back_y + global.size + 50, 1280, global.size, colb, colb, colb, colb, 0);
	
	var top;
	top = ((sprite_get_height(s_totem_back) * global.back_scale - global.size) / 2) * (sprite_get_width(s_totem_back) / 1280); //sprite_get_height(s_training_back) * ((sprite_get_height(s_training_back) / sprite_get_width(s_training_back)) - (global.size / 1280)) / 2;
	draw_sprite_part_ext(s_totem_back, 1, 0, top, sprite_get_width(s_totem_back), sprite_get_height(s_totem_back) - top, 0 + prx, training_back_y + pry, global.back_scale, global.back_scale, c_white, 1);
	
	///////
	
	#region Сами тотемы
		for(i=1;i<=18;i++)
			{
			draw_sprite_ext(s_totems, i, 290 + totem_x[i] + prx, 140 + 360 - top + totem_y[i] + training_back_y + totem_yy1 + 10 + pry, totem_s, totem_s, 0, c_black, 0.5); 
			draw_sprite_ext(s_totems, i, 290 + totem_x[i] + prx, 140 + 360 - top + totem_y[i] + training_back_y + totem_yy1 + pry, totem_s * totems_ss[i], totem_s * totems_ss[i], 0, c_white, 1);
			if global.totem_have[i] = 0
				{ draw_sprite_ext(s_totems, i, 290 + totem_x[i] + prx, 140 + 360 - top + totem_y[i] + training_back_y + totem_yy1 + pry, totem_s * totems_ss[i], totem_s * totems_ss[i], 0, c_black, 0.4); }
				else
				{ draw_sprite_ext(s_totems_eyes, i, 290 + totem_x[i] + prx, 140 + 360 - top + totem_y[i] + training_back_y + totem_yy1 + pry, totem_s * totems_ss[i], totem_s * totems_ss[i], 0, totem_c[i], totem_alp); }
			}
		
		//draw_set_alpha(0.5);
		//draw_set_color(c_black);
		//	draw_text_transformed(290 + text_x, 8 + 140 + 360 - top + text_y[1] + training_back_y + totem_yy1, text_tot[1], 0.2, 0.2, 0);
		//	draw_text_transformed(290 + text_x, 8 + 140 + 360 - top + text_y[2] + training_back_y + totem_yy1, text_tot[2], 0.2, 0.2, 0);
		//	draw_text_transformed(290 + text_x, 8 + 140 + 360 - top + text_y[3] + training_back_y + totem_yy1, text_tot[3], 0.2, 0.2, 0);
		//	draw_text_transformed(290 + text_x, 8 + 140 + 360 - top + text_y[4] + training_back_y + totem_yy1, text_tot[4], 0.2, 0.2, 0);
		//draw_set_color(c_white);
		//draw_set_alpha(1);
		
		//draw_set_alpha(0.5);
		//draw_text_transformed_t(290 + text_x, 8 + 140 + 360 - top + text_y[1] + training_back_y + totem_yy1, text_tot[1], 0.2, 0.2, 0, totem_c[1], c_black);
		//draw_text_transformed_t(290 + text_x, 8 + 140 + 360 - top + text_y[2] + training_back_y + totem_yy1, text_tot[2], 0.2, 0.2, 0, totem_c[7], c_black);
		//draw_text_transformed_t(290 + text_x, 8 + 140 + 360 - top + text_y[3] + training_back_y + totem_yy1, text_tot[3], 0.2, 0.2, 0, totem_c[12], c_black);
		//draw_text_transformed_t(290 + text_x, 8 + 140 + 360 - top + text_y[4] + training_back_y + totem_yy1, text_tot[4], 0.2, 0.2, 0, totem_c[16], c_black);
		//draw_set_alpha(1);
		
		draw_text_transformed_t(290 + text_x + prx, 140 + 360 - top + text_y[1] + training_back_y + totem_yy1 + pry, text_tot[1], 0.2, 0.2, 0, totem_c[1], c_black);
		draw_text_transformed_t(290 + text_x + prx, 140 + 360 - top + text_y[2] + training_back_y + totem_yy1 + pry, text_tot[2], 0.2, 0.2, 0, totem_c[7], c_black);
		draw_text_transformed_t(290 + text_x + prx, 140 + 360 - top + text_y[3] + training_back_y + totem_yy1 + pry, text_tot[3], 0.2, 0.2, 0, totem_c[12], c_black);
		draw_text_transformed_t(290 + text_x + prx, 140 + 360 - top + text_y[4] + training_back_y + totem_yy1 + pry, text_tot[4], 0.2, 0.2, 0, totem_c[16], c_black);
		
		if mouse_check_button(mb_left)
		&& point_in_rectangle(mouse_x, mouse_y, 120, global.size / 2 - 270, 720, global.size / 2 + 270)
			{
			if totem_yy = 0
				{ totem_yy = totem_yy1 - mouse_y; }
			var totemy;
			totemy = totem_yy1;
			totem_yy1 = totem_yy + mouse_y;
			
			if totem_yy1 > 100
				{ totem_yy1 = 100; }
			if totem_yy1 < -1000
				{ totem_yy1 = -1000; }
			
			if totem_yy1 != totemy
				{ totem_pr = 0; }
			
			if abs(totem_yy1 - totemy) > 50
				{
				hold_dr = sign(totem_yy1 - totemy);
				hold_sp = abs(totemy - totem_yy1) / 2;
				hold_ti = room_speed / 4;
				hold_do = (hold_sp / 2) / 20;
				}
			if hold_ti > 0
				{ hold_ti -= 1; }
				else
				{ hold_sp = 0; }
			}
			else
			{
			totem_yy = 0;
			
			if abs(hold_sp) > 0
				{
				if hold_dr = 1
					{
					totem_yy1 += hold_sp;
					hold_sp -= hold_do;
					if hold_sp < 0
						{ hold_sp = 0  }
					}
				if hold_dr = -1
					{
					totem_yy1 -= hold_sp;
					hold_sp -= hold_do;
					if hold_sp < 0
						{ hold_sp = 0; }
					}
				if totem_yy1 > 100
					{ hold_sp = 0; }
				if totem_yy1 < -1040
					{ hold_sp = 0; }
				}
				else
				{
				if totem_yy1 > 0
					{ totem_yy1 -= 10; }
				if totem_yy1 < -940
					{ totem_yy1 += 10; }
				}
			}
		
		for(i=1;i<=18;i++)
			{
			totems_ss[i] = 1;
			if point_in_rectangle(mouse_x, mouse_y, 290 + totem_x[i] - totem_s * totem_w, 140 + 360 - top + totem_y[i] + training_back_y + totem_yy1 + 10 - totem_s * totem_w, 290 + totem_x[i] + totem_s * totem_w, 140 + 360 - top + totem_y[i] + training_back_y + totem_yy1 + 10 + totem_s * totem_w)
				{
				if mouse_check_button(mb_left) && totem_pr != 0
					{ totems_ss[i] = 1.1; }
				if mouse_check_button_pressed(mb_left) && totem_pr = 0
					{ totem_pr = i; }
				if mouse_check_button_released(mb_left) && totem_re = 0 && totem_yy1 <= 0 && totem_yy1 >= -950
					{
					if global.duel = 0
						{
						if totem_pr = i// && hold_sp = 0// && totem_yy = 0
							{ totem_pr = 0; totem_re = 0; totem_now = i; }
							else
							{ totem_pr = 0; totem_re = 0; }
						}
						else
						{
						if global.totem_have[i] = 1
							{
							if global.p_totem[3] = -1
								{
								global.p_totem[3] = i;
								}
								else
								{
								if global.p_totem[2] = -1
									{
									if global.p_totem[3] != i
										{ global.p_totem[2] = i; }
									}
									else
									{
									if global.p_totem[1] = -1
										{
										if global.p_totem[3] != i && global.p_totem[2] != i
											{ global.p_totem[1] = i; }
										}
									}
								}
							}
						}
					}
				}
			//draw_rectangle_color(290 + totem_x[i] - totem_s * totem_w, 140 + 360 - top + totem_y[i] + training_back_y + totem_yy1 + 10 - totem_s * totem_w, 290 + totem_x[i] + totem_s * totem_w, 140 + 360 - top + totem_y[i] + training_back_y + totem_yy1 + 10 + totem_s * totem_w, c_white, c_white, c_white, c_white, 1);
			}
	#endregion
	
	draw_sprite_part_ext(s_totem_back, 0, 0, top, sprite_get_width(s_totem_back), sprite_get_height(s_totem_back) - top, 0, training_back_y, global.back_scale, global.back_scale, c_white, 1);
	
	#region Описание тотема
			if global.duel = 0
				{
				/////
				if (totem_alp >= 1 && totem_adi = 1) or (totem_alp <= 0.5 && totem_adi = -1)
					{ totem_adi = -totem_adi; }
				totem_alp += 0.01 * totem_adi;
				
				draw_sprite_ext(s_totems, totem_now, 1280 - 300, global.size / 2 - 100 + training_back_y + 30, 0.4, 0.4, 0, c_black, 0.5); 
				if global.totem_have[totem_now] = 1
					{ draw_sprite_ext(s_totems_light, totem_now, 1280 - 300, global.size / 2 - 100 + training_back_y, 0.4, 0.4, 0, totem_c[totem_now], totem_alp); }
				draw_sprite_ext(s_totems, totem_now, 1280 - 300, global.size / 2 - 100 + training_back_y, 0.4, 0.4, 0, c_white, 1);
				if global.totem_have[totem_now] = 0
					{ draw_sprite_ext(s_totems, totem_now, 1280 - 300, global.size / 2 - 100 + training_back_y, 0.4, 0.4, 0, c_black, 0.4); }
					else
					{ draw_sprite_ext(s_totems_eyes, totem_now, 1280 - 300, global.size / 2 - 100 + training_back_y, 0.4, 0.4, 0, totem_c[totem_now], totem_alp); }
				////
				draw_text_ext_transformed_t(1280 - 300, global.size / 2 - 100 + training_back_y + 235, string_upper(global.totem_desc[totem_now]), -1, 2500, 0.12, 0.12, 0, global.color_white, c_black);
				draw_text_ext_transformed_t(1280 - 300, global.size / 2 - 100 + training_back_y + 90, string_upper(global.totem_name[totem_now]), -1, 1000, 0.15, 0.15, 0, totem_c[totem_now], c_black);
				////
				}
				else
				{
				if (totem_alp >= 1 && totem_adi = 1) or (totem_alp <= 0.5 && totem_adi = -1)
					{ totem_adi = -totem_adi; }
				totem_alp += 0.01 * totem_adi;
				var go5;
				go5 = 1;
				if point_in_rectangle(mouse_x, mouse_y, 1280 - 300 - 150, global.size - 60 + training_back_y - 50, 1280 - 300 + 150, global.size - 60 + training_back_y + 50)
					{
					if mouse_check_button(mb_left)
						{ go5 = 1.1; }
					if mouse_check_button_released(mb_left)
						{ room_goto_t("duel"); }
					io_clear();
					}
				
				if global.p_totem[1] != -1
					{
					totems_p[1] = global.p_totem[1];
					totems_x[1] = 0;
					if totems_y[1] < 0
						{ totems_y[1] += 60; }
						else
						{ totems_y[1] = 0; }
					draw_sprite_ext(s_totems, global.p_totem[1], 1280 - 300, totems_y[1] + global.size / 2 - 130 + training_back_y + 10, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.5); 
					if global.totem_have[global.p_totem[1]] = 1
						{ draw_sprite_ext(s_totems_light, global.p_totem[1], 1280 - 300, totems_y[1] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, totem_c[global.p_totem[1]], totem_alp); }
					draw_sprite_ext(s_totems, global.p_totem[1], 1280 - 300, totems_y[1] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_white, 1);
					if global.totem_have[global.p_totem[1]] = 0
						{ draw_sprite_ext(s_totems, global.p_totem[1], 1280 - 300, totems_y[1] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.4); }
						else
						{ draw_sprite_ext(s_totems_eyes, global.p_totem[1], 1280 - 300, totems_y[1] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, totem_c[global.p_totem[1]], totem_alp); }
					
					if point_in_rectangle(mouse_x, mouse_y, 1280 - 300 - totem_w / 2, totems_y[1] + global.size / 2 - 130 + training_back_y + 30 - totem_w / 2, 1280 - 300 + totem_w / 2, totems_y[1] + global.size / 2 - 130 + training_back_y + 30 + totem_w / 2)
						{
						if mouse_check_button_pressed(mb_left)
							{ global.p_totem[1] = -1; }
						}
					//draw_rectangle(1280 - 300 - totem_w / 2, global.size / 2 - 100 + training_back_y + 30 - totem_w / 2, 1280 - 300 + totem_w / 2, global.size / 2 - 100 + training_back_y + 30 + totem_w / 2, 1);
					}
					else
					{
					if totems_y[1] = 0
						{
						if totems_x[1] < 300
							{
							totems_x[1] += 50;
							//draw_sprite_ext(s_totems, global.p_totem[1], 1280 - 300 + totems_x[1], global.size / 2 - 100 + training_back_y + 30, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.5); 
							//if global.totem_have[global.p_totem[1]] = 1
							//	{ draw_sprite_ext(s_totems_light, global.p_totem[1], 1280 - 300 + totems_x[1], global.size / 2 - 100 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, totem_c[global.p_totem[1]], totem_alp); }
							draw_sprite_ext(s_totems, totems_p[1], 1280 - 300 + totems_x[1], global.size / 2 - 100 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_white, 1);
							//if global.totem_have[global.p_totem[1]] = 0
							//	{ draw_sprite_ext(s_totems, global.p_totem[1], 1280 - 300 + totems_x[1], global.size / 2 - 100 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.4); }
							//	else
							//	{ draw_sprite_ext(s_totems_eyes, global.p_totem[1], 1280 - 300 + totems_x[1], global.size / 2 - 100 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, totem_c[global.p_totem[1]], totem_alp); }
							}
							else
							{
							totems_y[1] = -global.size / 2;
							totems_x[1] = 0;
							}
						}
					}
				
				if global.p_totem[2] != -1
					{
					totems_p[2] = global.p_totem[2];
					totems_x[2] = 0;
					if totems_y[2] < 0
						{ totems_y[2] += 60; }
						else
						{ totems_y[2] = 0; }
					draw_sprite_ext(s_totems, global.p_totem[2], 1280 - 300, totem_w * 0.7 + totems_y[2] + global.size / 2 - 130 + training_back_y + 10, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.5); 
					if global.totem_have[global.p_totem[2]] = 1
						{ draw_sprite_ext(s_totems_light, global.p_totem[2], 1280 - 300, totem_w * 0.7 + totems_y[2] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, totem_c[global.p_totem[2]], totem_alp); }
					draw_sprite_ext(s_totems, global.p_totem[2], 1280 - 300, totem_w * 0.7 + totems_y[2] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_white, 1);
					if global.totem_have[global.p_totem[2]] = 0
						{ draw_sprite_ext(s_totems, global.p_totem[2], 1280 - 300, totem_w * 0.7 + totems_y[2] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.4); }
						else
						{ draw_sprite_ext(s_totems_eyes, global.p_totem[2], 1280 - 300, totem_w * 0.7 + totems_y[2] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, totem_c[global.p_totem[2]], totem_alp); }
					
					if point_in_rectangle(mouse_x, mouse_y, 1280 - 300 - totem_w / 2, totem_w * 0.7 + totems_y[2] + global.size / 2 - 130 + training_back_y + 30 - totem_w / 2, 1280 - 300 + totem_w / 2, totem_w * 0.7 + totems_y[2] + global.size / 2 - 130 + training_back_y + 30 + totem_w / 2)
						{
						if mouse_check_button_pressed(mb_left)
							{ global.p_totem[2] = -1; }
						}
					//draw_rectangle(1280 - 300 - totem_w / 2, totem_w * 0.8 + totems_y[2] + global.size / 2 - 130 + training_back_y + 30 - totem_w / 2, 1280 - 300 + totem_w / 2, totem_w * 0.8 + totems_y[2] + global.size / 2 - 130 + training_back_y + 30 + totem_w / 2, 1);
					}
					else
					{
					if totems_y[2] = 0
						{
						if totems_x[2] < 300
							{
							totems_x[2] += 50;
							//draw_sprite_ext(s_totems, global.p_totem[2], 1280 - 300 + totems_x[2], totem_w * 0.8 + global.size / 2 - 130 + training_back_y + 30, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.5); 
							//if global.totem_have[global.p_totem[2]] = 1
							//	{ draw_sprite_ext(s_totems_light, global.p_totem[2], 1280 - 300 + totems_x[2], totem_w * 0.8 + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, totem_c[global.p_totem[2]], totem_alp); }
							draw_sprite_ext(s_totems, totems_p[2], 1280 - 300 + totems_x[2], totem_w * 0.8 + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_white, 1);
							//if global.totem_have[global.p_totem[2]] = 0
							//	{ draw_sprite_ext(s_totems, global.p_totem[2], 1280 - 300 + totems_x[2], totem_w * 0.8 + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.4); }
							//	else
							//	{ draw_sprite_ext(s_totems_eyes, global.p_totem[2], 1280 - 300 + totems_x[2], totem_w * 0.8 + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, totem_c[global.p_totem[2]], totem_alp); }
							}
							else
							{
							if global.p_totem[1] != -1
								{ totems_y[2] = totems_y[1]; totems_x[1] = 350; totems_y[1] = -(global.size / 2); global.p_totem[2] = global.p_totem[1]; global.p_totem[1] = -1; }
								else
								{ totems_y[2] = -(global.size / 2 - 100 + totem_w); totems_x[2] = 0; }
							}
						}
					}
				
				if global.p_totem[3] != -1
					{
					totems_p[3] = global.p_totem[3];
					totems_x[3] = 0;
					if totems_y[3] < 0
						{ totems_y[3] += 60; }
						else
						{ totems_y[3] = 0; }
					draw_sprite_ext(s_totems, global.p_totem[3], 1280 - 300, 2 * totem_w * 0.7 + totems_y[3] + global.size / 2 - 130 + training_back_y + 10, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.5); 
					if global.totem_have[global.p_totem[3]] = 1
						{ draw_sprite_ext(s_totems_light, global.p_totem[3], 1280 - 300, 2 * totem_w * 0.7 + totems_y[3] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, totem_c[global.p_totem[3]], totem_alp); }
					draw_sprite_ext(s_totems, global.p_totem[3], 1280 - 300, 2 * totem_w * 0.7 + totems_y[3] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_white, 1);
					if global.totem_have[global.p_totem[3]] = 0
						{ draw_sprite_ext(s_totems, global.p_totem[3], 1280 - 300, 2 * totem_w * 0.7 + totems_y[3] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.4); }
						else
						{ draw_sprite_ext(s_totems_eyes, global.p_totem[3], 1280 - 300, 2 * totem_w * 0.7 + totems_y[3] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, totem_c[global.p_totem[3]], totem_alp); }
					
					if point_in_rectangle(mouse_x, mouse_y, 1280 - 300 - totem_w / 2, 2 * totem_w * 0.7 + totems_y[3] + global.size / 2 - 130 + training_back_y + 30 - totem_w / 2, 1280 - 300 + totem_w / 2, 2 * totem_w * 0.7 + totems_y[3] + global.size / 2 - 130 + training_back_y + 30 + totem_w / 2)
						{
						if mouse_check_button_pressed(mb_left)
							{ global.p_totem[3] = -1; }
						}
					}
					else
					{
					if totems_y[3] = 0
						{
						if totems_x[3] < 300
							{
							totems_x[3] += 50;
							//draw_sprite_ext(s_totems, global.p_totem[3], 1280 - 300 + totems_x[3], totem_w * 0.8 + global.size / 2 - 130 + training_back_y + 30, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.5); 
							draw_sprite_ext(s_totems, totems_p[3], 1280 - 300 + totems_x[3], 2 * totem_w * 0.8 + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_white, 1);
							}
							else
							{
							
							if global.p_totem[1] = -1 && global.p_totem[2] != -1
								{
								totems_y[3] = totems_y[2];
								totems_x[2] = 350;
								totems_y[2] = -(global.size / 2 - 100 + totem_w);
								global.p_totem[3] = global.p_totem[2];
								global.p_totem[2] = -1;
								}
								else
								{
								if global.p_totem[1] != -1
									{
									totems_y[3] = totems_y[2];
									totems_y[2] = totems_y[1];
									global.p_totem[3] = global.p_totem[2];
									global.p_totem[2] = global.p_totem[1];
									global.p_totem[1] = -1;
									
									totems_x[1] = 350;
									totems_y[1] = -(global.size / 2 - 100);
									}
								}
								
								//else
								//{ totems_y[3] = -(global.size / 2 - 100 + totem_w * 2); totems_x[3] = 0; }
							//totems_y[3] = -(global.size / 2 - 100 + totem_w * 2);
							//totems_x[3] = 0;
							}
						}
					}
				
				//////////////
				//if global.p_totem[2] != -1
				//	{
				//	draw_sprite_ext(s_totems, global.p_totem[2], 1280 - 300, totem_w * 0.8 + global.size / 2 - 130 + training_back_y + 30, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.5); 
				//	if global.totem_have[global.p_totem[2]] = 1
				//		{ draw_sprite_ext(s_totems_light, global.p_totem[2], 1280 - 300, totem_w * 0.8 + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, totem_c[global.p_totem[2]], totem_alp); }
				//	draw_sprite_ext(s_totems, global.p_totem[2], 1280 - 300, totem_w * 0.8 + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_white, 1);
				//	if global.totem_have[global.p_totem[2]] = 0
				//		{ draw_sprite_ext(s_totems, global.p_totem[2], 1280 - 300, totem_w * 0.8 + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.4); }
				//		else
				//		{ draw_sprite_ext(s_totems_eyes, global.p_totem[2], 1280 - 300, totem_w * 0.8 + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, totem_c[global.p_totem[2]], totem_alp); }
				//	}
				//if global.p_totem[3] != -1
				//	{
				//	draw_sprite_ext(s_totems, global.p_totem[3], 1280 - 300, 2 * totem_w * 0.8 + global.size / 2 - 130 + training_back_y + 30, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.5); 
				//	if global.totem_have[global.p_totem[3]] = 1
				//		{ draw_sprite_ext(s_totems_light, global.p_totem[3], 1280 - 300, 2 * totem_w * 0.8 + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, totem_c[global.p_totem[3]], totem_alp); }
				//	draw_sprite_ext(s_totems, global.p_totem[3], 1280 - 300, 2 * totem_w * 0.8 + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_white, 1);
				//	if global.totem_have[global.p_totem[3]] = 0
				//		{ draw_sprite_ext(s_totems, global.p_totem[3],  1280 - 300, 2 * totem_w * 0.8 + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.4); }
				//		else
				//		{ draw_sprite_ext(s_totems_eyes, global.p_totem[3], 1280 - 300, 2 * totem_w * 0.8 + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, totem_c[global.p_totem[3]], totem_alp); }
				//	}
				
				//draw_rectangle(1280 - 300 - 150, global.size - 60 + training_back_y - 50, 1280 - 300 + 150, global.size - 60 + training_back_y + 50, 1);
				draw_text_transformed_t(1280 - 300, global.size - 60 + training_back_y, "START DUEL", 0.25 * go5, 0.25 * go5, 0, global.color_white, c_black);
				}
		#endregion
	
	var yh, col;
	yh = 0;
	col = make_color_rgb(242, 232, 201);
	if global.size < 700
		{ yh = 30; }
	draw_sprite_ext_t(s_totem_back, 2, 640 - 50, global.size + training_back_y + yh + 20 * (960 / global.size), global.back_scale, global.back_scale, 0, c_white, 1, c_white, c_black);
	
	if global.duel = 1
		{
		if global.size >= 640
			{
			draw_set_font(global.game_font);
			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300, "CHOOSE YOUR TOTEMS", 0.22, 0.22, 0, col, c_black);
			}
			else
			{
			draw_set_font(global.game_font);
			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300 + 60, "CHOOSE YOUR TOTEMS", 0.22, 0.22, 0, col, c_black);
			}
		}
		else
		{
		draw_set_font(global.game_font);
		draw_text_transformed_t(780, global.size / 2 + training_back_y, "T\nO\nT\nE\nM\nS", 0.22, 0.22, 0, col, c_black);
		}
	
	if (sc_angle < sc_dist && sc_dir = 1) or (sc_angle > -sc_dist && sc_dir = -1)
		{ sc_angle += sc_dir * sc_spd; }
		else
		{ sc_dir = -sc_dir; sc_angle += sc_dir * sc_spd; }
	if sc_spd > 0.3
		{ sc_spd -= 0.05; }
		else
		{ sc_spd = 0.3; }
	if sc_dist > 3
		{ sc_dist -= 0.025; }
	
	draw_sprite_ext_t(s_totem_back, 3, 640 + prx + 140, global.size - 150 + top -training_back_y + pry * 0.5 + sc_angle * 2 - 50, global.back_scale * 0.8, global.back_scale * 0.8, 0, c_white, 1, c_white, c_black);
	
	if point_in_rectangle(mouse_x, mouse_y, 1020, 0, 1280, 250)
		{
		if mouse_check_button_pressed(mb_left)
			{
			sc_spd   = 3;
			sc_dist  = 10;
			}
		}
	if point_in_rectangle(mouse_x, mouse_y, 0, 0, 100, 100)
		{
		if mouse_check_button_pressed(mb_left)
			{
			if global.duel = 1
				{ global.menu_now = "heroes"; global.menu_next = "heroes"; io_clear(); }
				else
				{ global.menu_next = "main"; }
			totem_yy1 = 0;
			//global.menu_next = "main";
			}
		}
	
	draw_set_font(global.game_font);
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_text_transformed(50, 50 + training_back_y, "X", 0.25, 0.25, 0);
	draw_set_color(c_white);
	draw_set_alpha(1);
	}
#endregion
#region Персонажи / Выбор Персонажа
if global.menu_now = "heroes" or (global.menu_next = "heroes" && global.duel = 0)
	{
	if global.menu_next = "heroes"
		{
		if global.menu_now != "heroes"
			{
			if training_back_y - global.size / 12 > 0
				{ training_back_y -= global.size / 12; }
				else
				{
				global.p_totem[1] = -1;
				global.p_totem[2] = -1;
				global.p_totem[3] = -1;
				global.menu_now = "heroes";
				training_back_y = 0;
				}
			}
		}
		else
		{
		if training_back_y - global.size / 12 < global.size + 350
			{ training_back_y += global.size / 12; }
			else
			{
			//if global.duel = 1
			//	{
			//	if global.menu_next = "main"
			//		{ global.duel = 0; global.menu_now = "main"; }
			//	//if global.menu_next = "totems"
			//	//	{ global.menu_next = "totems"; }
			//	//if global.menu_next = "training"
			//	//	{ global.menu_next = "training"; }
			//	global.menu_now = "main";
			//	}
			//	else
			//	{ global.menu_now = global.menu_next; }
			global.menu_now = global.menu_next;
			training_back_y = global.size + 350;
			}
		}
		
	var colb;
	colb = make_color_rgb(123, 0, 28);
	//draw_rectangle_color(0, training_back_y + global.size + 50, 1280, global.size, colb, colb, colb, colb, 0);
	
	var top;
	top = ((sprite_get_height(s_heroes_back) * global.back_scale - global.size) / 2) * (sprite_get_width(s_heroes_back) / 1280); //sprite_get_height(s_training_back) * ((sprite_get_height(s_training_back) / sprite_get_width(s_training_back)) - (global.size / 1280)) / 2;
	draw_sprite_part_ext(s_heroes_back, 1, 0, top, sprite_get_width(s_heroes_back), sprite_get_height(s_heroes_back) - top, 0 + prx, training_back_y + pry, global.back_scale, global.back_scale, c_white, 1);
	
	///////
	#region Листовки
		for(i=1;i<=7;i++)
			{
			draw_sprite_ext(s_wanted, i, 330 + hero_xx[i] + prx, 140 + 360 - top + hero_yyy[i] + training_back_y + hero_yy1 + 10 + pry, hero_s * hero_ss[i], hero_s * hero_ss[i], 0, c_black, 0.5); 
			draw_sprite_ext_t(s_wanted, i, 330 + hero_xx[i] + prx, 140 + 360 - top + hero_yyy[i] + training_back_y + hero_yy1 + pry, hero_s * hero_ss[i], hero_s * hero_ss[i], 0, c_white, 1, c_white, c_black); 	
			if global.heroes_have[i] = 0
				{ draw_sprite_ext(s_wanted, i, 330 + hero_xx[i] + prx, 140 + 360 - top + hero_yyy[i] + training_back_y + hero_yy1 + pry, hero_s * hero_ss[i], hero_s * hero_ss[i], 0, c_black, 0.5); }
			
			draw_set_alpha(0.5);
			draw_rectangle_color(330 + hero_xx[i] - hero_w * hero_s * 1.1 + prx, 140 + 360 - top + hero_yyy[i] + training_back_y + hero_yy1 + hero_h * 1.1 * hero_s - 15 + pry, 330 + hero_xx[i] + hero_w * hero_s * 1.1 + prx, 140 + 360 - top + hero_yyy[i] + training_back_y + hero_yy1 + hero_h * 1.1 * hero_s + 15+ pry, c_black, c_black, c_black, c_black, 0);
			draw_set_alpha(1);
			
			draw_rectangle_color(330 + hero_xx[i] - hero_w * hero_s * 1.1 + prx, 140 + 360 - top + hero_yyy[i] + training_back_y + hero_yy1 + hero_h * 1.1 * hero_s - 15 + pry, 330 + hero_xx[i] - hero_w * hero_s * 1.1 + (2 * hero_w * hero_s * 1.1) * (hero_now1[i] / hero_need[i])+ prx, 140 + 360 - top + hero_yyy[i] + training_back_y + hero_yy1 + hero_h * 1.1 * hero_s + 15 + pry, global.color_hero[i], global.color_hero[i], global.color_hero[i], global.color_hero[i], 0);
			
			draw_sprite_ext_t(s_themes_ss, i, 330 + hero_xx[i] - hero_w * hero_s * 1.1 + prx, 140 + 360 - top + hero_yyy[i] + training_back_y + hero_yy1 + hero_h * hero_s * 1.1 + pry, 0.3, 0.3, 0, global.color_white, 1, global.color_white, c_black);
			draw_text_transformed_t(330 + hero_xx[i] - hero_w * hero_s * 1.1 + prx, 140 + 360 - top + hero_yyy[i] + training_back_y + hero_yy1 + hero_h * hero_s * 1.1 + pry, string(hero_lvl[i]) + "", 0.18, 0.18, 0, global.color_hero[i], c_black);
			
			draw_text_transformed_t(330 + hero_xx[i] + prx, 140 + 360 - top + hero_yyy[i] + training_back_y + hero_yy1 + hero_h * 1.1 * hero_s + pry, "(" + string(hero_now1[i]) + "~" + string(hero_need[i]) + ")", 0.1, 0.1, 0, global.color_white, c_black);
			}
		if mouse_check_button(mb_left)
		&& point_in_rectangle(mouse_x, mouse_y, 120, global.size / 2 - 270, 720, global.size / 2 + 270)
			{
			if hero_yy = 0
				{ hero_yy = hero_yy1 - mouse_y; }
			var totemy;
			totemy = hero_yy1;
			hero_yy1 = hero_yy + mouse_y;
			
			if hero_yy1 > 100
				{ hero_yy1 = 100; }
			if hero_yy1 < -850
				{ hero_yy1 = -850; }
			
			if hero_yy1 != totemy
				{ hero_pr = 0; }
			
			if abs(hero_yy1 - totemy) > 50
				{
				hold_dr = sign(hero_yy1 - totemy);
				hold_sp = abs(totemy - hero_yy1) / 2;
				hold_ti = room_speed / 4;
				hold_do = (hold_sp / 2) / 20;
				}
			if hold_ti > 0
				{ hold_ti -= 1; }
				else
				{ hold_sp = 0; }
			}
			else
			{
			hero_yy = 0;
			
			if abs(hold_sp) > 0
				{
				if hold_dr = 1
					{
					hero_yy1 += hold_sp;
					hold_sp -= hold_do;
					if hold_sp < 0
						{ hold_sp = 0  }
					}
				if hold_dr = -1
					{
					hero_yy1 -= hold_sp;
					hold_sp -= hold_do;
					if hold_sp < 0
						{ hold_sp = 0; }
					}
				if hero_yy1 > 100
					{ hold_sp = 0; }
				if hero_yy1 < -850
					{ hold_sp = 0; }
				}
				else
				{
				if hero_yy1 > 0
					{ hero_yy1 -= 10; }
				if hero_yy1 < -750
					{ hero_yy1 += 10; }
				}
			}
		
		for(i=1;i<=7;i++)
			{
			hero_ss[i] = 1;
			if point_in_rectangle(mouse_x, mouse_y, 290 + hero_xx[i] - hero_s * hero_w + 40, 140 + 360 - top + hero_yyy[i] + training_back_y + hero_yy1 + 10 - hero_s * hero_h, 290 + hero_xx[i] + hero_s * hero_w + 40, 140 + 360 - top + hero_yyy[i] + training_back_y + hero_yy1 + 10 + hero_s * hero_h)
				{
				if mouse_check_button(mb_left) && hero_pr != 0
					{ hero_ss[i] = 1.1; }
				if mouse_check_button_pressed(mb_left) && hero_pr = 0
					{ hero_pr = i; }
				if mouse_check_button_released(mb_left) && hero_re = 0 && hero_yy1 <= 0 && hero_yy1 >= -950
					{
					if hero_pr = i// && hold_sp = 0// && totem_yy = 0
						{ hero_pr = 0; hero_re = 0; hero_now = i; }
						else
						{ hero_pr = 0; hero_re = 0; }
					}
				}
			//draw_rectangle_color(290 + totem_x[i] - totem_s * totem_w, 140 + 360 - top + totem_y[i] + training_back_y + totem_yy1 + 10 - totem_s * totem_w, 290 + totem_x[i] + totem_s * totem_w, 140 + 360 - top + totem_y[i] + training_back_y + totem_yy1 + 10 + totem_s * totem_w, c_white, c_white, c_white, c_white, 1);
			}
	#endregion
	//////
	draw_sprite_part_ext(s_heroes_back, 0, 0, top, sprite_get_width(s_heroes_back), sprite_get_height(s_heroes_back) - top, 0, training_back_y, global.back_scale, global.back_scale, c_white, 1);
	///////
	#region Показ персонажа
		hero_i += 1;
		for(i=1;i<=7;i++)
			{
			if i = hero_now
				{
				draw_sprite_ext(asset_get_index("s_" + global.hero_code_name[i]), hero_i, 1280 - 300, global.size / 2 - 30 + training_back_y + 10, 0.3, 0.3, 0, c_black, 0.5); 
				draw_sprite_ext(asset_get_index("s_" + global.hero_code_name[i]), hero_i, 1280 - 300, global.size / 2 - 30 + training_back_y, 0.3, 0.3, 0, c_white, 1); 
				
				var name, hpp, atkk, theme, supert;
				name = string_upper(global.hero_code_name[i]);
				if i = 2
					{ name = "DRUNK JOE"; }
				if i = 5
					{ name = "BILL SR."; }
				draw_text_transformed_t(1280 - 300, global.size / 2 - 30 + training_back_y + 30, name, 0.2, 0.2, 0, global.color_hero[i], c_black);
				
				if global.duel = 0
					{
					atkk = global.atk[i] * (0.01 * hero_lvl[i]);
					hpp  = global.hp[i] * (0.01 * hero_lvl[i]);
					draw_text_transformed_t(1280 - 300 - 90, global.size / 2 - 30 + training_back_y + 70, "HP: " + string(global.hp[i]), 0.12, 0.12, 0, global.color_white, c_black);
					draw_text_transformed_t(1280 - 300 - 90, global.size / 2 - 30 + training_back_y + 100, "(+"+string(hpp)+")", 0.12, 0.12, 0, global.color_hero[2], c_black);
					
					draw_set_halign(fa_left);
					draw_text_transformed_t(1280 - 300 + 90, global.size / 2 - 30 + training_back_y + 70, "ATK: " + string(global.atk[i]), 0.12, 0.12, 0, global.color_white, c_black);
					draw_text_transformed_t(1280 - 300 + 90, global.size / 2 - 30 + training_back_y + 100, "(+"+string(atkk)+")", 0.12, 0.12, 0, global.color_hero[2], c_black);
					draw_set_halign(fa_center);
					
					draw_sprite_ext_t(s_themes_button, 0, 1280 - 300 - 75, global.size / 2 - 30 + training_back_y + 165, 0.3, 0.3, 0, global.color_hero[i], 1, global.color_white, c_black);
					draw_sprite_ext_t(s_themes_ss, i, 1280 - 300 - 75, global.size / 2 - 30 + training_back_y + 165, 0.3, 0.3, 0, global.color_white, 1, global.color_white, c_black);
					draw_sprite_ext_t(s_themes_button, 0, 1280 - 300 + 75, global.size / 2 - 30 + training_back_y + 165, 0.3, 0.3, 0, global.color_hero[i], 1, global.color_hero[i], c_black);
					draw_sprite_ext_t(s_super, i + 1, 1280 - 300 + 75, global.size / 2 - 30 + training_back_y + 165, 0.45, 0.45, 0, global.color_white, 1, global.color_white, c_black);
					
					theme = string_upper(global.hero_code_theme[i]);
					if i = 4
						{ theme = "ATTENTION"; }
					switch(i)
						{
						case 1: supert = "THEFT"; break;
						case 2: supert = "STUN"; break;
						case 3: supert = "POISON"; break;
						case 4: supert = "DYNAMIT"; break;
						case 5: supert = "HAZE"; break;
						case 6: supert = "CRITICAL"; break;
						case 7: supert = "IDOLS"; break;
						}
					draw_text_transformed_t(1280 - 300 - 75, global.size / 2 - 30 + training_back_y + 165 + 50, theme, 0.12, 0.12, 0, global.color_white, c_black);
					draw_text_transformed_t(1280 - 300 + 75, global.size / 2 - 30 + training_back_y + 165 + 50, supert, 0.12, 0.12, 0, global.color_white, c_black);
					}
					else
					{
					var himher, go5;
					if i = 1 or i = 3
						{ himher = "HER"; }
						else
						{ himher = "HIM"; }
					go5 = 1;
					//draw_rectangle(1280 - 300 - 100, global.size / 2 - 30 + training_back_y + 230 - 70, 1280 - 300 + 100, global.size / 2 - 30 + training_back_y + 230 + 70, 1);
					if point_in_rectangle(mouse_x, mouse_y, 1280 - 300 - 150, global.size / 2 - 30 + training_back_y + 150 - 70, 1280 - 300 + 150, global.size / 2 - 30 + training_back_y + 150 + 70)
						{
						if mouse_check_button(mb_left)
							{ go5 = 1.1; }
						if mouse_check_button_released(mb_left) && global.heroes_have[i] > 0
							{
							global.hero = i;
							global.duel = 1;
							global.menu_now = "totem"; global.menu_next = "totem";
							io_clear();
							}
						}
					draw_text_transformed_t(1280 - 300, global.size / 2 - 30 + training_back_y + 130 + 20, "CHOOSE\n" + himher, 0.3 * go5, 0.3 * go5, 0, global.color_white, c_black);
					}
				//draw_set_alpha(0.5);
				//draw_rectangle_color(330 + hero_xx[i] - hero_w * hero_s * 1.1, 140 + 360 - top + hero_yyy[i] + training_back_y + hero_yy1 + hero_h * 1.1 * hero_s - 15, 330 + hero_xx[i] + hero_w * hero_s * 1.1, 140 + 360 - top + hero_yyy[i] + training_back_y + hero_yy1 + hero_h * 1.1 * hero_s + 15, c_black, c_black, c_black, c_black, 0);
				//draw_set_alpha(1);
				
				//draw_rectangle_color(330 + hero_xx[i] - hero_w * hero_s * 1.1, 140 + 360 - top + hero_yyy[i] + training_back_y + hero_yy1 + hero_h * 1.1 * hero_s - 15, 330 + hero_xx[i] - hero_w * hero_s * 1.1 + (2 * hero_w * hero_s * 1.1) * (hero_now1[i] / hero_need[i]), 140 + 360 - top + hero_yyy[i] + training_back_y + hero_yy1 + hero_h * 1.1 * hero_s + 15, global.color_hero[i], global.color_hero[i], global.color_hero[i], global.color_hero[i], 0);
				
				//draw_sprite_ext_t(s_themes_ss, i, 330 + hero_xx[i] - hero_w * hero_s * 1.1, 140 + 360 - top + hero_yyy[i] + training_back_y + hero_yy1 + hero_h * hero_s * 1.1, 0.3, 0.3, 0, global.color_white, 1, global.color_white, c_black);
				//draw_text_transformed_t(330 + hero_xx[i] - hero_w * hero_s * 1.1, 140 + 360 - top + hero_yyy[i] + training_back_y + hero_yy1 + hero_h * hero_s * 1.1, string(hero_lvl[i]) + "", 0.18, 0.18, 0, global.color_hero[i], c_black);
				
				//draw_text_transformed_t(330 + hero_xx[i], 140 + 360 - top + hero_yyy[i] + training_back_y + hero_yy1 + hero_h * 1.1 * hero_s, "(" + string(hero_now1[i]) + "~" + string(hero_need[i]) + ")", 0.1, 0.1, 0, global.color_white, c_black);
				}
			}
	#endregion
	/////
	
	var yh, col;
	yh = 0;
	col = make_color_rgb(242, 232, 201);
	if global.size < 700
		{ yh = 30; }
	draw_sprite_ext_t(s_heroes_back, 2, 640, global.size + training_back_y + yh + 40 * (960 / global.size), global.back_scale, global.back_scale, 0, c_white, 1, c_white, c_black);
	
	if global.duel = 0
		{
		draw_set_font(global.game_font);
		draw_text_transformed_t(80, global.size / 2 + training_back_y - 40, "H\nE\nR\nO\nE\nS", 0.22, 0.22, 0, col, c_black);
		}
		else
		{
		if global.size  >= 640
			{
			draw_set_font(global.game_font);
			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300, "CHOOSE YOUR HERO", 0.22, 0.22, 0, col, c_black);
			}
			else
			{
			draw_set_font(global.game_font);
			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300 + 40, "CHOOSE YOUR HERO", 0.22, 0.22, 0, col, c_black);
			}
		}
	if (sc_angle < sc_dist && sc_dir = 1) or (sc_angle > -sc_dist && sc_dir = -1)
		{ sc_angle += sc_dir * sc_spd; }
		else
		{ sc_dir = -sc_dir; sc_angle += sc_dir * sc_spd; }
	if sc_spd > 0
		{ sc_spd -= 0.05; }
		else
		{ sc_spd = 0; }
	if sc_dist > 3
		{ sc_dist -= 0.025; }
	
	
	draw_sprite_ext(s_heroes_back, 3, 640 + prx + 140 + 6, global.size - 150 + top - training_back_y + pry * 0.5 - sc_angle * 2 - 50 + 20, global.back_scale * 0.8, global.back_scale * 0.8, 0, c_black, 0.5);
	draw_sprite_ext_t(s_heroes_back, 3, 640 + prx + 140, global.size - 150 + top - training_back_y + pry * 0.5 - sc_angle * 2 - 50, global.back_scale * 0.8, global.back_scale * 0.8, 0, c_white, 1, c_white, c_black);
	
	if point_in_rectangle(mouse_x, mouse_y, 1160, 0, 1280, 380)
		{
		if mouse_check_button_pressed(mb_left)
			{
			sc_spd   = 2;
			sc_dist  = 10;
			}
		}
	if point_in_rectangle(mouse_x, mouse_y, 0, 0, 100, 100)
		{
		if mouse_check_button_pressed(mb_left)
			{
			if global.duel != 1
				{
				hero_i = 0;
				hero_yy1 = 0;
				global.menu_next = "main";
				}
				else
				{
				hero_i = 0;
				//hero_yy1 = 0;
				global.menu_now = "training"; global.menu_next = "training";
				io_clear();
				}
			}
		}
	
	draw_set_font(global.game_font);
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_text_transformed(50, 50 + training_back_y, "X", 0.25, 0.25, 0);
	draw_set_color(c_white);
	draw_set_alpha(1);
	}
#endregion
#region Тренировка / Ранкед
if global.menu_now = "training" or global.menu_next = "training"
	{
	if global.menu_next = "training"
		{
		if global.menu_now != "training"
			{
			if training_back_y - global.size / 12 > 0
				{ training_back_y -= global.size / 12; }
				else
				{
				global.menu_now = "training";
				training_back_y = 0;
				}
			}
		}
		else
		{
		if training_back_y - global.size / 12 < global.size + 350
			{ training_back_y += global.size / 12; }
			else
			{
			if global.duel = 1
				{
				if global.menu_next = "main"
					{ global.duel = 0; global.menu_now = "main"; }
				}
				else
				{ global.menu_now = global.menu_next; }
			//global.menu_now = global.menu_next;
			training_back_y = global.size + 350;
			}
		}
		
	var colb;
	colb = make_color_rgb(123, 0, 28);
	//draw_rectangle_color(0, training_back_y + global.size + 50, 1280, global.size, colb, colb, colb, colb, 0);
	
	var top;
	top = ((sprite_get_height(s_training_back) * global.back_scale - global.size) / 2) * (sprite_get_width(s_training_back) / 1280) //sprite_get_height(s_training_back) * ((sprite_get_height(s_training_back) / sprite_get_width(s_training_back)) - (global.size / 1280)) / 2;
	draw_sprite_part_ext(s_training_back, 1, 0, top, sprite_get_width(s_training_back), sprite_get_height(s_training_back) - top, 0 + prx, training_back_y + pry, global.back_scale, global.back_scale, c_white, 1);
	
	if global.duel = 0
		{
		for(j=1;j<=2;j++)
			{
			for(i=1;i<=3;i++)
				{
				if point_in_rectangle(mouse_x, mouse_y, theme_x[i,j] - 70, theme_y[i,j] - 70, theme_x[i,j] + 70, theme_y[i,j] + 70)
					{
					if theme_stage[i,j] = 0
						{
						if mouse_check_button_pressed(mb_left)
							{
							//if global.music
								{ audio_play_sound(sd_text, 2, 0); }
							theme_s[i,j] = 1.1;
							}
							else
							{ theme_s[i,j] = 1; }
						if mouse_check_button_released(mb_left)
							{
							if theme_op[i,j] != 0
								{
								global.training = theme_t[i,j];
								global.hero = theme_t[i,j];
							
								room_goto_t("duel");
								}
							}
						}
					}
			
			
				//if theme_op[i,j] = 0 && i = 1 && j = 1 && theme_stage[i,j] = 0 && training_back_y = 0
				//	{ theme_stage[i,j] = 1; }
				if theme_op[i,j] = 0 && theme_stage[i,j] = 0 && training_back_y = 0 && tr_yes = 1 && theme_ot[i,j] > 0
					{ theme_stage[i,j] = 1; tr_yes = 0; }
			
				#region Тема открывается
					if theme_stage[i,j] = 1
						{
						if theme_s[i,j] < 1.5 - (0.2 * (theme_ot[i,j] == 1))
							{ theme_s[i,j] += 0.05 + (0.05 * (theme_ot[i,j] == 2)); }
							else
							{
							theme_s[i,j] += 0.01;
							if theme_ss[i,j] > 0.1
								{ theme_ss[i,j] -= 0.1 + (0.1 * (theme_ot[i,j] == 2)); }
								else
								{ theme_stage[i,j] = 2; }
							}
						}
					if theme_stage[i,j] = 2
						{
						theme_op[i,j] = 1;
						if theme_ot[i,j] = 0
							{
							if j = 1
								{
								#region Запись в ини
									ini_open("Music.ini");
										///
										ini_write_string("Training", "tr" + string(theme_t[i,j]), "1");
										global.tr[i] = ini_read_real("Training", "tr" + string(theme_t[i,j]), 0);
										///
									ini_close();
								#endregion
						
								theme_ot[i,j] = global.tr[i]
								}
								else
								{
								#region Запись в ини
									ini_open("Music.ini");
										///
										ini_write_string("Training", "tr" + string(theme_t[i,j]), "1");
										global.tr[3+i] = ini_read_real("Training", "tr" + string(theme_t[i,j]), 0);
										///
									ini_close();
								#endregion
								theme_ot[i,j] = global.tr[3+i]
								}
							}
						if theme_ss[i,j] < 1
							{ theme_ss[i,j] += 0.1 + (0.1 * (theme_ot[i,j] == 2)); }
							else
							{
							if theme_a[i,j] > 0 && theme_ot[i,j] = 1
								{ theme_a[i,j] -= 1; }
								else
								{
								if theme_s[i,j] > 1
									{ theme_s[i,j] -= 0.05 + (0.05 * (theme_ot[i,j] == 2)); }
									else
									{ theme_stage[i,j] = 0; tr_yes = 1; }
								}
							}
						}
				#endregion
				draw_sprite_ext(s_themes_button, 0, theme_x[i,j] + prx, theme_y[i,j] + training_back_y + pry, theme_sc * 1.1, theme_sc * 1.1, 0, c_black, 0.35);
				if theme_op[i,j] = 1 && theme_ot[i,j] = 2
					{ draw_sprite_ext(s_light, 0, theme_x[i,j] + prx, theme_y[i,j] + training_back_y + pry, 0.26, 0.26, 0, c_white, 0.55); }
				draw_sprite_ext_t(s_themes_button, 0, theme_x[i,j] + prx, theme_y[i,j] + training_back_y + pry, theme_s[i,j] * theme_sc * theme_ss[i,j], theme_s[i,j] * theme_sc, 0, global.color_hero[theme_t[i,j]], 1, c_white, c_black);
				draw_sprite_ext_t(s_themes_ss, theme_t[i,j], theme_x[i,j] + prx, theme_y[i,j] + training_back_y + pry, theme_s[i,j] * theme_sc * theme_ss[i,j], theme_s[i,j] * theme_sc, 0, global.color_white, 1, global.color_white, c_black);
			
				draw_set_font(global.game_font);
				//draw_text_transformed_t(global.size / 2, 100 + training_back_y, "T\nR\nA\nI\nN\nI\nN\nG", 0.3, 0.3, 0, global.color_white, c_black);
				if theme_op[i,j] = 1
					{
					var cl;
					//if theme_ot[i,j] = 2
						//{ cl = global.color_hero[theme_t[i,j]]; }
						//else
						{ cl = global.color_white; }
					if string_length(theme_nn[i,j]) < 7
						{ draw_text_transformed_t(theme_x[i,j] + prx, theme_y[i,j] + training_back_y + 100 + pry, theme_nn[i,j], theme_s[i,j] * (theme_sc / 3) * theme_ss[i,j], theme_s[i,j] * ( theme_sc / 3), 0, cl, c_black); }
						else
						{ draw_text_transformed_t(theme_x[i,j] + prx, theme_y[i,j] + training_back_y + 100 + pry, theme_nn[i,j], theme_s[i,j] * (theme_sc / 3 - 0.02) * theme_ss[i,j], theme_s[i,j] * (theme_sc / 3 - 0.02), 0, cl, c_black); }
					}
					else
					{
					draw_sprite_ext_t(s_themes_button, 0, theme_x[i,j] + prx, theme_y[i,j] + training_back_y + pry, theme_s[i,j] * theme_sc * theme_ss[i,j], theme_s[i,j] * theme_sc, 0, global.color_hero[1], 1, global.color_hero[1], c_black);
					draw_text_transformed_t(theme_x[i,j] + prx, theme_y[i,j] + training_back_y + pry, "?", theme_s[i,j] * theme_sc * theme_ss[i,j], theme_s[i,j] * theme_sc, 0, global.color_white, c_black);
				
					var ques;
					ques = "";
					for(k=1;k<=string_length(theme_nn[i,j]);k++)
						{ ques += "?"; }
					if string_length(ques) > 6
						{ ques = "??????" }
					if string_length(theme_nn[i,j]) < 7
						{ draw_text_transformed_t(theme_x[i,j] + prx, theme_y[i,j] + training_back_y + 100 + pry, ques, theme_s[i,j] * (theme_sc / 3) * theme_ss[i,j], theme_s[i,j] * ( theme_sc / 3), 0, global.color_hero[1], c_black); }
						else
						{ draw_text_transformed_t(theme_x[i,j] + prx, theme_y[i,j] + training_back_y + 100 + pry, ques, theme_s[i,j] * (theme_sc / 3 - 0.02) * theme_ss[i,j], theme_s[i,j] * (theme_sc / 3 - 0.02), 0, global.color_hero[1], c_black); }
					}
				}
			}
		}
		else
		{
		//global.rank_stars = 0;
		var star_now, star_need, shield_i, skul_i, go5;
		if global.rank_stars < 70
			{ star_now = global.rank_stars - 69; star_need = -1; shield_i = 3; skul_i = 0;}
		if global.rank_stars < 69
			{ star_now = global.rank_stars - 63; star_need = 6; shield_i = 2; skul_i = 1;}
		if global.rank_stars < 63
			{ star_now = global.rank_stars - 57; star_need = 6; shield_i = 2; skul_i = 2;}
		if global.rank_stars < 57
			{ star_now = global.rank_stars - 51; star_need = 6; shield_i = 2; skul_i = 3;}
		if global.rank_stars < 51
			{ star_now = global.rank_stars - 46; star_need = 5; shield_i = 2; skul_i = 4;}
		if global.rank_stars < 46
			{ star_now = global.rank_stars - 41; star_need = 5; shield_i = 2; skul_i = 5;}
		if global.rank_stars < 41
			{ star_now = global.rank_stars - 36; star_need = 5; shield_i = 1; skul_i = 6;}
		if global.rank_stars < 36
			{ star_now = global.rank_stars - 31; star_need = 5; shield_i = 1; skul_i = 7;}
		if global.rank_stars < 31
			{ star_now = global.rank_stars - 26; star_need = 5; shield_i = 1; skul_i = 8;}
		if global.rank_stars < 26
			{ star_now = global.rank_stars - 21; star_need = 5; shield_i = 1; skul_i = 9;}
		if global.rank_stars < 21
			{ star_now = global.rank_stars - 16; star_need = 5; shield_i = 1; skul_i = 10;}
		if global.rank_stars < 16
			{ star_now = global.rank_stars - 12; star_need = 4; shield_i = 0; skul_i = 11;}
		if global.rank_stars < 12
			{ star_now = global.rank_stars - 8; star_need = 4; shield_i = 0; skul_i = 12;}
		if global.rank_stars < 8
			{ star_now = global.rank_stars - 5; star_need = 3; shield_i = 0; skul_i = 13;}
		if global.rank_stars < 5
			{ star_now = global.rank_stars - 2; star_need = 3; shield_i = 0; skul_i = 14;}
		if global.rank_stars < 2
			{ star_now = global.rank_stars; star_need = 2; shield_i = 0; skul_i = 15;}
		
		draw_sprite_ext(s_rank_shield, 0, 640, global.size / 2 - 50 + 15 + training_back_y, 1, 1, 0, c_black, 0.5);
		draw_sprite_ext(s_rank_shield, 0, 640, global.size / 2 - 50 + training_back_y, 1, 1, 0, c_white, 1);
		
		draw_sprite_ext(s_rank_skul, skul_i, 640, global.size / 2 - 50 + 15 + training_back_y, 1, 1, 0, c_black, 0.5);
		draw_sprite_ext(s_rank_skul, skul_i, 640, global.size / 2 - 50 + training_back_y, 1, 1, 0, c_white, 1);	
		
		if star_need = 2
			{
			draw_sprite_ext_t(s_rank_star, 0, 640 - 30, global.size / 2 + 35 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
			draw_sprite_ext_t(s_rank_star, 0, 640 + 30, global.size / 2 + 35 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
			
			if star_now > 0
				{ draw_sprite_ext_t(s_rank_star, 0, 640 - 30, global.size / 2 + 35 + training_back_y, 0.3, 0.3, 0, c_white, 1, global.color_white, c_black); }
			//if star_now > 1
			//	{ draw_sprite_ext(s_rank_star, 0, 640 + 30, global.size / 2 + 35, 0.3, 0.3, 0, c_white, 1); }
			}
		if star_need = 3
			{
			draw_sprite_ext_t(s_rank_star, 0, 640 - 70, global.size / 2 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
			draw_sprite_ext_t(s_rank_star, 0, 640, global.size / 2 + 70 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
			draw_sprite_ext_t(s_rank_star, 0, 640 + 70, global.size / 2+ training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
			
			if star_now > 0
				{ draw_sprite_ext_t(s_rank_star, 0, 640 - 70, global.size / 2 + training_back_y, 0.3, 0.3, 0, c_white, 1, global.color_white, c_black); }
			if star_now > 1
				{ draw_sprite_ext_t(s_rank_star, 0, 640, global.size / 2 + 70 + training_back_y, 0.3, 0.3, 0, c_white, 1, global.color_white, c_black); }
			//if star_now > 2
			//	{ draw_sprite_ext(s_rank_star, 0, 640 + 30, global.size / 2 + 35, 0.3, 0.3, 0, c_white, 1); }
			}
		if star_need = 4
			{
			draw_sprite_ext_t(s_rank_star, 0, 640 - 110, global.size / 2 - 40 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
			draw_sprite_ext_t(s_rank_star, 0, 640 - 50, global.size / 2 + 20 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
			draw_sprite_ext_t(s_rank_star, 0, 640 + 50, global.size / 2 + 20 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
			draw_sprite_ext_t(s_rank_star, 0, 640 + 110, global.size / 2 - 40 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
			
			if star_now > 0
				{ draw_sprite_ext_t(s_rank_star, 0, 640 - 110, global.size / 2 - 40 + training_back_y, 0.3, 0.3, 0, c_white, 1, global.color_white, c_black); }
			if star_now > 1
				{ draw_sprite_ext_t(s_rank_star, 0, 640 - 50, global.size / 2 + 20 + training_back_y, 0.3, 0.3, 0, c_white, 1, global.color_white, c_black); }
			if star_now > 2
				{ draw_sprite_ext_t(s_rank_star, 0, 640 + 50, global.size / 2 + 20 + training_back_y, 0.3, 0.3, 0, c_white, 1, global.color_white, c_black); }
			}
		if star_need = 5
			{
			draw_sprite_ext_t(s_rank_star, 0, 640 - 100, global.size / 2 - 45 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
			draw_sprite_ext_t(s_rank_star, 0, 640 - 60, global.size / 2 + 15+ training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
			draw_sprite_ext_t(s_rank_star, 0, 640, global.size / 2 + 60 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
			draw_sprite_ext_t(s_rank_star, 0, 640 + 60, global.size / 2 + 15 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
			draw_sprite_ext_t(s_rank_star, 0, 640 + 100, global.size / 2 - 45 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
			
			if star_now > 0
				{ draw_sprite_ext_t(s_rank_star, 0, 640 - 100, global.size / 2 - 45 + training_back_y, 0.3, 0.3, 0, c_white, 1, global.color_white, c_black); }
			if star_now > 1
				{ draw_sprite_ext_t(s_rank_star, 0, 640 - 60, global.size / 2 + 15 + training_back_y, 0.3, 0.3, 0, c_white, 1, global.color_white, c_black); }
			if star_now > 2
				{ draw_sprite_ext_t(s_rank_star, 0, 640, global.size / 2 + 60 + training_back_y, 0.3, 0.3, 0, c_white, 1, global.color_white, c_black); }
			if star_now > 3
				{ draw_sprite_ext_t(s_rank_star, 0, 640 + 60, global.size / 2 + 15 + training_back_y, 0.3, 0.3, 0, c_white, 1, global.color_white, c_black); }
			}
		if star_need = 6
			{
			draw_sprite_ext_t(s_rank_star, 0, 640 - 120, global.size / 2 - 30 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
			draw_sprite_ext_t(s_rank_star, 0, 640 - 80, global.size / 2 + 20 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
			draw_sprite_ext_t(s_rank_star, 0, 640 - 40, global.size / 2 + 60 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
			draw_sprite_ext_t(s_rank_star, 0, 640 + 40, global.size / 2 + 60 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
			draw_sprite_ext_t(s_rank_star, 0, 640 + 80, global.size / 2 + 20 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
			draw_sprite_ext_t(s_rank_star, 0, 640 + 120, global.size / 2 - 30 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
			
			if star_now > 0
				{ draw_sprite_ext_t(s_rank_star, 0, 640 - 120, global.size / 2 - 30 + training_back_y, 0.3, 0.3, 0, c_white, 1, global.color_white, c_black); }
			if star_now > 1
				{ draw_sprite_ext_t(s_rank_star, 0, 640 - 80, global.size / 2 + 20 + training_back_y, 0.3, 0.3, 0, c_white, 1, global.color_white, c_black); }
			if star_now > 2
				{ draw_sprite_ext_t(s_rank_star, 0, 640 - 40, global.size / 2 + 60 + training_back_y, 0.3, 0.3, 0, c_white, 1, global.color_white, c_black); }
			if star_now > 3
				{ draw_sprite_ext_t(s_rank_star, 0, 640 + 40, global.size / 2 + 60 + training_back_y, 0.3, 0.3, 0, c_white, 1, global.color_white, c_black); }
			if star_now > 4
				{ draw_sprite_ext_t(s_rank_star, 0, 640 + 80, global.size / 2 + 20 + training_back_y, 0.3, 0.3, 0, c_white, 1, global.color_white, c_black); }
			}
		
		draw_text_transformed_t(640, global.size / 2 - 150 + training_back_y, string(skul_i), 0.27, 0.27, 5, global.color_white, c_black);
		
		go5 = 1;
		if point_in_rectangle(mouse_x, mouse_y, 640 - 290, global.size / 2 - 60 + 150 + training_back_y, 640 + 290, global.size / 2 + 60 + 150 + training_back_y)
			{
			if mouse_check_button(mb_left)
				{ go5 = 1.1; }
			if mouse_check_button_released(mb_left)
				{
				global.player_rank = skul_i;
				global.duel = 1;
				global.menu_now = "heroes"; global.menu_next = "heroes";
				}
			}
		//draw_rectangle(640 - 290, global.size / 2 - 60 + 150 + training_back_y, 640 + 290, global.size / 2 + 60 + 150 + training_back_y, 1);
		draw_text_transformed_t(640, global.size / 2 + 150 + training_back_y, "CHOOSE HERO", 0.27 * go5, 0.27 * go5, 5, global.color_white, c_black);
		//ИГРА
		
		//global.g_rank_now = 0;
		//global.g_stars_need = 0;
		//global.g_stars_now = 0;
		}
	
	draw_sprite_part_ext(s_training_back, 0, 0, top, sprite_get_width(s_training_back), sprite_get_height(s_training_back) - top, 0, training_back_y, global.back_scale, global.back_scale, c_white, 1);
	var yh, col;
	yh = 0;
	col = make_color_rgb(242, 232, 201);
	if global.size < 700
		{ yh = 30; }
	draw_sprite_ext_t(s_training_back, 2, 640, global.size + training_back_y + yh, global.back_scale, global.back_scale, 0, c_white, 1, c_white, c_black);
	
	draw_set_font(global.game_font);
	if global.duel = 0
		{ draw_text_transformed_t(150, global.size / 2 + training_back_y, "T\nR\nA\nI\nN\nI\nN\nG", 0.22, 0.22, 0, col, c_black); }
		else
		{ draw_text_transformed_t(150, global.size / 2 + training_back_y, "R\nA\nN\nK\nE\nD\n \nM\nO\nD\nE", 0.2, 0.2, 0, col, c_black); }
	if (sc_angle < sc_dist && sc_dir = 1) or (sc_angle > -sc_dist && sc_dir = -1)
		{ sc_angle += sc_dir * sc_spd; }
		else
		{ sc_dir = -sc_dir; sc_angle += sc_dir * sc_spd; }
	if sc_spd > 0.3
		{ sc_spd -= 0.01; }
		else
		{ sc_spd = 0.3; }
	if sc_dist > 5
		{ sc_dist -= 0.025; }
	
	draw_sprite_ext_t(s_training_rope, 0, 1130 + prx, -training_back_y + pry * 0.5, 0.18, 0.18, sc_angle, c_white, 1, c_white, c_black);
	draw_sprite_ext_t(s_training_sc, 0, 1130 + prx + lengthdir_x(300, sc_angle - 90), -training_back_y + lengthdir_y(300, sc_angle - 90) + pry * 0.7, 0.5, 0.5, 0, c_white, 1, c_white, c_black);
	
	if point_in_rectangle(mouse_x, mouse_y, - 60 + 1130 + lengthdir_x(300, sc_angle - 90), - 100 -training_back_y + lengthdir_y(300, sc_angle - 90), 60 + 1130 + lengthdir_x(300, sc_angle - 90), 100 -training_back_y + lengthdir_y(300, sc_angle - 90))
		{
		if mouse_check_button_pressed(mb_left)
			{
			if mouse_x > 1130 + lengthdir_x(300, sc_angle - 90)
				{ sc_dir = -1; }
				else
				{ sc_dir = 1; }
			sc_spd   = 1;
			sc_dist  = 10;
			}
		}
	if point_in_rectangle(mouse_x, mouse_y, 0, 0, 100, 100)
		{
		if mouse_check_button_pressed(mb_left)
			{
			//if global.duel = 1
			//	{ global.duel = 0; }
			global.menu_next = "main";
			}
		}
	
	draw_set_font(global.game_font);
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_text_transformed(50, 50 + training_back_y, "X", 0.25, 0.25, 0);
	draw_set_color(c_white);
	draw_set_alpha(1);
	}
#endregion
#region Магазин
if global.menu_now = "store" or global.menu_next = "store"
	{
	if global.menu_next = "store"
		{
		if global.menu_now != "store"
			{
			if training_back_y - global.size / 12 > 0
				{ training_back_y -= global.size / 12; }
				else
				{
				global.menu_now = "store";
				training_back_y = 0;
				}
			}
		}
		else
		{
		if training_back_y - global.size / 12 < global.size + 350
			{ training_back_y += global.size / 12; }
			else
			{
			global.menu_now = global.menu_next;
			training_back_y = global.size + 350;
			}
		}
		
	var colb;
	colb = make_color_rgb(123, 0, 28);
	//draw_rectangle_color(0, training_back_y + global.size + 50, 1280, global.size, colb, colb, colb, colb, 0);
	
	var top;
	top = ((sprite_get_height(s_store_back) * global.back_scale - global.size) / 2) * (sprite_get_width(s_store_back) / 1280); //sprite_get_height(s_training_back) * ((sprite_get_height(s_training_back) / sprite_get_width(s_training_back)) - (global.size / 1280)) / 2;
	draw_sprite_part_ext(s_store_back, 1, 0, top, sprite_get_width(s_store_back), sprite_get_height(s_store_back) - top, 0 + prx, training_back_y + pry, global.back_scale, global.back_scale, c_white, 1);
	
	///////
	
	draw_sprite_part_ext(s_store_back, 0, 0, top, sprite_get_width(s_store_back), sprite_get_height(s_store_back) - top, 0, training_back_y, global.back_scale, global.back_scale, c_white, 1);
	
	var yh, col;
	yh = 0;
	col = make_color_rgb(242, 232, 201);
	if global.size < 700
		{ yh = 30; }
	
	if point_in_rectangle(mouse_x, mouse_y, 0, global.size - 250, 250, global.size)
		{
		if mouse_check_button_pressed(mb_left)
			{
			if wl_spd < 15
				{ wl_spd += 2.5; }
			}
		}
	
	wl_ang -= wl_spd;
	
	if wl_spd > 0
		{ wl_spd -= 0.05; }
		else
		{ wl_spd = 0; }
	
	if wl_ang >= 360
		{ wl_ang -= 360; }
	draw_sprite_ext_t(s_store_weel, 2, 0 + prx, global.size + training_back_y - 10 + yh / 3 + pry, global.back_scale, global.back_scale, wl_ang, c_white, 1, c_white, c_black);
	
	draw_set_font(global.game_font);
	draw_text_transformed_t(1170, global.size / 2 + training_back_y, "S\nT\nO\nR\nE", 0.25, 0.25, 0, col, c_black);
			
	if (sc_angle < sc_dist && sc_dir = 1) or (sc_angle > -sc_dist && sc_dir = -1)
		{ sc_angle += sc_dir * sc_spd; }
		else
		{ sc_dir = -sc_dir; sc_angle += sc_dir * sc_spd; }
	if sc_spd > 0
		{ sc_spd -= 0.05; }
		else
		{ sc_spd = 0; }
	if sc_dist > 3
		{ sc_dist -= 0.025; }
	
	draw_sprite_ext_t(s_store_back, 3, 640 + prx, global.size + top - training_back_y + pry * 0.5 + sc_angle * 2 - 27, global.back_scale, global.back_scale, 0, c_white, 1, c_white, c_black);
	
	if point_in_rectangle(mouse_x, mouse_y, 280, global.size + top - 100 - 1200 * global.back_scale - 27, 1000, global.size + top + 500 - 1200 * global.back_scale - 27)
		{
		if mouse_check_button_pressed(mb_left)
			{
			sc_spd   = 2;
			sc_dist  = 10;
			}
		}
	if point_in_rectangle(mouse_x, mouse_y, 0, 0, 100, 100)
		{
		if mouse_check_button_pressed(mb_left)
			{ global.menu_next = "main"; }
		}
	
	draw_set_font(global.game_font);
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_text_transformed(50, 50 + training_back_y, "X", 0.25, 0.25, 0);
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	// ЗОЛОТО И КЭШ
		#region Координаты и размеры
			var menu_but_w, menu_but_s, menu_txt_s, menu_txt_w, menu_but_c, menu_txt_s1;
			menu_but_w  = 140;
			menu_but_s  = 0.9;
			menu_txt_s  = 0.2;
			menu_txt_s1 = 0.18;
			menu_txt_w  = 240;
			menu_but_c = make_color_rgb(230, 53, 70);
			
			var menu_stat_i, menu_stat_s, menu_plus_s, menu_setb_x, menu_setb_y, gold_col;
			menu_stat_i = 3;
			menu_stat_s = 0.9;
			menu_plus_s = 1;
			menu_setb_x = 80;
			menu_setb_y = global.size + top - 50 - 1200 * global.back_scale;
			
			var menu_gold_t, menu_gold_x, menu_cash_x, menu_cash_t, menu_plus1_x, menu_plus2_x;
			menu_gold_t = string(global.gold) + "©";
			menu_cash_t = string(global.cash) + "ç";
			menu_gold_x = 900 - menu_setb_x / 2 - menu_txt_s * string_width(menu_cash_t) / 2;
			menu_cash_x = 900 - menu_setb_x / 2 - menu_txt_s * string_width(menu_cash_t) - menu_txt_s * string_width(menu_gold_t) / 2 - menu_setb_x;
			
			menu_plus1_x = menu_gold_x - menu_txt_s * string_width(menu_cash_t) / 2 - menu_setb_x / 2 - 10;
			menu_plus2_x = menu_cash_x - menu_txt_s * string_width(menu_gold_t) / 2 - menu_setb_x / 2 - 10;
			gold_col = make_color_rgb(252,232,131);
		#endregion
		//menu_setb_y - training_back_y + pry
		//top - training_back_y + pry * 0.5 + sc_angle * 2 - 27
		draw_text_transformed_t(menu_gold_x + prx, top / 2 - training_back_y + pry * 0.5 + sc_angle * 2, string(global.cash) + "ç", menu_txt_s, menu_txt_s, 0, global.color_hero[2], c_black);
		draw_sprite_ext_t(s_menu_settings_p, 0, menu_plus1_x + prx, top / 2 - training_back_y + pry * 0.5 + sc_angle * 2, menu_plus_s, menu_plus_s, 0, c_white, 1, c_white, c_black);
		
		draw_text_transformed_t(menu_cash_x + prx, top / 2 - training_back_y + pry * 0.5 + sc_angle * 2, string(global.gold) + "©", menu_txt_s, menu_txt_s, 0, gold_col, c_black);
		draw_sprite_ext_t(s_menu_settings_p, 0, menu_plus2_x + prx, top / 2 - training_back_y + pry * 0.5 + sc_angle * 2, menu_plus_s, menu_plus_s, 0, c_white, 1, c_white, c_black);
		// ЗОЛОТО И КЭШ
	}
#endregion

if 0
	{
	#region СТАРЫЙ ОБЪЕКТ
		#region Выбор сложности
			if menu_stage = "dificult234234"
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
	
		#region Прочее1
			if menu_stage = "heroes0234234"
				{
				#region Переменные
					var ts, gx, gy, hero_width, hero_spr;
					ts = 0.35;
					gx = 640 + prx;
					gy = 50  + pry;
				
					var rankk;
				rankk = string(global.player_rank);
				if global.player_rank = 0
					{ rankk = "LEGEND" }
				draw_set_font(global.game_font);
				draw_text_transformed_a(gx, 50, "LEVEL: " + string(rankk), ts * s0, ts * s0, 0, c_white, c_black);
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
					
						draw_sprite_ext(hero_spr, 0, hero_x[i], hero_y, hero_size, hero_size, 0, c_white, 1);
						}
				#endregion
				}
		#endregion
		#region Прочее2
		if menu_stage = "heroes2234234"
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
				if show = 6
					{ hercol = c_orange; }
				if show = 4
					{ hercol = c_maroon; }
				if show = 3
					{ hercol = c_fuchsia; }
			#endregion
			#region Текст
				if s0 < 1
					{ s0 += 0.1; }
				anim += 1;
				var rankk;
				rankk = string(global.player_rank);
				if global.player_rank = 0
					{ rankk = "LEGEND" }
				draw_set_font(global.game_font);
				draw_text_transformed_a(gx, 50, "LEVEL: " + string(rankk), ts * s0, ts * s0, 0, c_white, c_black);
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
				if show = 4
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
			
				if show = 6
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
							{ show = 6; ps1 = 1.1; }
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
							{ show = 4; }
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
			
					if show = 6
						{ ps1 = 1.1; }
					if show = 4
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
				if show = 6
					{
					nx = xx - xx1 + 50 - prx;
					ny = yy1 - 190 - pry;
					}
				if show = 4
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
					if show = 6
						{ super = s_super_sherif; }
					if show = 4
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
	
		#region Выбор героя
			if menu_stage = "heroes1"
				{
				var vs_spr, vs_spr1, vs_size;
				vs_size = 1;
				vs_spr  = asset_get_index("s_" + string(global.hero_code_name[global.hero]));
				vs_spr1 = asset_get_index("s_" + string(global.hero_code_name[global.enemy_hero]));
				vs_hero = global.enemy_hero
				if global.hero = 6
					{ sherif_x = - 80; }
					else
					{ sherif_x = 0; }
				if vs_hero = 6
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
			
				draw_sprite_ext(vs_spr , 0, vs_x1 + sherif_x, vs_y1, -vs_size, vs_size, 20, c_white, 1);
				draw_sprite_ext(vs_spr1, 0, vs_x2 - sherif_x1, vs_y2, vs_size , vs_size, 20, c_white, 1);
			
				draw_set_font(global.game_font);
				draw_text_transformed_a(vs_vx, vs_vy, "V", vs_ts * vs_alpha, vs_ts * vs_alpha, -20, c_white, c_black);
				draw_text_transformed_a(vs_sx, vs_sy, "S", vs_ts * vs_alpha, vs_ts * vs_alpha, -20, c_white, c_black);
			
				if mouse_check_button(mb_left) && lag = 0
					{
					lag = 4;
					if mouse_x < 400
						{
						if mouse_y < global.size / 2
							{
							if global.hero > 1
								{ global.hero -= 1; }
							}
							else
							{
							if global.hero < 7
								{ global.hero += 1; }
							}
						}
					if mouse_x > 800
						{
						//if global.hero = 6 or global.hero = 4 or global.hero = 3 or global.hero = 1
							{ menu_stage = "search"; }
						}
					if mouse_x >= 400 && mouse_x <= 800
						{
						if mouse_y > global.size / 2
							{
							if global.player_rank < 15
								{ global.player_rank += 1; }
							}
						if mouse_y <= global.size / 2
							{
							if global.player_rank > 0
								{ global.player_rank -= 1; }
							}
						}
					}
				if lag > 0
					{ lag -= 1; }
				if anim_skul < 3
					{ anim_skul += 0.5; }
					else
					{ anim_skul = 0; }
				var skul, rank, rank_i, rank_yy;
				rank_yy = -65;
				skul = global.player_rank;
				rank = string(global.player_rank);
				if global.player_rank <=5
					{ rank_i = 2; }
				if global.player_rank > 5 && global.player_rank <= 10
					{ rank_i = 1; }
				if global.player_rank > 10
					{ rank_i = 0; }
				if global.player_rank = 0
					{ rank_i = 3; rank = "LEGEND"; rank_yy = -45; }
		
				draw_sprite_ext_t(s_rank_shield, rank_i, 640, 100, 0.7, 0.7, 0, c_white, 1, c_white, c_black);
				if global.player_rank <= 3
					{ draw_sprite_ext_t(s_rank_skul_1, anim_skul, 640, 100, 0.7, 0.7, 0, c_white, 1, c_white, c_black); }
				draw_sprite_ext_t(s_rank_skul, skul, 640, 100, 0.7, 0.7, 0, c_white, 1, c_white, c_black);
		
				draw_set_font(global.game_font);
				draw_text_transformed_t(640, 120 + rank_yy, string(rank), 0.25, 0.25, 0, global.color_white, c_black);
				}
		#endregion
		#region Подбор противника
			if menu_stage = "search"
				{
				var vs_spr, vs_spr1, vs_size;
				vs_size = 1;
				vs_spr  = asset_get_index("s_" + string(global.hero_code_name[global.hero]));
				vs_spr1 = asset_get_index("s_" + string(global.hero_code_name[vs_hero]));
			
				if global.hero = 6
					{ sherif_x = - 80; }
					else
					{ sherif_x = 0; }
				if vs_hero = 6
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
				
					if vs_vy > global.size / 2
						{ vs_vy -= 70; }
				
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
				}
		#endregion
		#region Сурф
			application_surface_draw_enable(1);
		#endregion
	
		#region Изменение ранга
			if keyboard_check_pressed(ord("O"))
				{
				if global.player_rank < 15
					{ global.player_rank += 1; }
				}
			if keyboard_check_pressed(ord("P"))
				{
				if global.player_rank > 0
					{ global.player_rank -= 1; }
				}
		#endregion
	#endregion
	}
if 0
	{
	#region Координаты и размеры
		var prx, pry;
		prx = global.paral_x * global.paral_sx;
		pry = global.paral_y * global.paral_sy;
	
		var menu_but_w, menu_but_s, menu_txt_s, menu_txt_w, menu_but_c, menu_txt_s1;
		menu_but_w  = 140;
		menu_but_s  = 0.9;
		menu_txt_s  = 0.23;
		menu_txt_s1 = 0.18;
		menu_txt_w  = 240;
		menu_but_c = make_color_rgb(230, 53, 70);
	
		var menu_stat_i, menu_stat_s, menu_plus_s, menu_setb_x, menu_setb_y;
		menu_stat_i = 3;
		menu_stat_s = 0.9;
		menu_plus_s = 1;
		menu_setb_x = 70;
		menu_setb_y = 70;
		
		var menu_gold_t, menu_gold_x, menu_cash_x, menu_cash_t, menu_plus1_x, menu_plus2_x;
		menu_gold_t = string(global.gold) + "©";
		menu_cash_t = string(global.cash) + "ç";
		menu_gold_x = 1280 - menu_setb_x / 2 - menu_txt_s * string_width(menu_cash_t) / 2;
		menu_cash_x = 1280 - menu_setb_x / 2 - menu_txt_s * string_width(menu_cash_t) - menu_txt_s * string_width(menu_gold_t) / 2 - menu_setb_x;
		
		menu_plus1_x = menu_gold_x - menu_txt_s * string_width(menu_cash_t) / 2 - menu_setb_x /2;
		menu_plus2_x = menu_cash_x - menu_txt_s * string_width(menu_gold_t) / 2 - menu_setb_x /2;
	#endregion
	#region Нажатие
		for(dev=0;dev<5;dev++)
			{
			var mouse_x1, mouse_y1;
			mouse_x1 = device_mouse_x(dev);
			mouse_y1 = device_mouse_y(dev);
			if device_mouse_check_button_released(dev, mb_left)
				{
			
				}
			}
	#endregion
	#region Рисование
		//
		if global.tablet = 1
			{
			draw_sprite_ext_t(s_menu_buttons, 0, menu_heroes_x, menu_heroes_y, menu_but_s * menu_heroes_s, menu_but_s * menu_heroes_s, 0, c_white, 1, c_white, c_black);
			draw_sprite_ext_t(s_menu_buttons, 1, menu_totems_x, menu_totems_y, menu_but_s * menu_totems_s, menu_but_s * menu_totems_s, 0, c_white, 1, c_white, c_black);
			draw_sprite_ext_t(s_menu_buttons, 2, menu_quests_x, menu_quests_y, menu_but_s * menu_quests_s, menu_but_s * menu_quests_s, 0, c_white, 1, c_white, c_black);
			draw_sprite_ext_t(s_menu_buttons, 3,   menu_shop_x,   menu_shop_y, menu_but_s *   menu_shop_s, menu_but_s *   menu_shop_s, 0, c_white, 1, c_white, c_black);
			
			draw_set_font(global.game_font);
			draw_set_halign(fa_center);
			draw_set_valign(fa_bottom);
			draw_text_ext_transformed_t(menu_heroes_x, menu_heroes_y + menu_but_w * menu_heroes_s - 20, menu_heroes_n, -1, menu_txt_w, menu_txt_s1, menu_txt_s1, 0, menu_but_c, c_black);
			draw_text_ext_transformed_t(menu_totems_x, menu_totems_y + menu_but_w * menu_totems_s - 20, menu_totems_n, -1, menu_txt_w, menu_txt_s1, menu_txt_s1, 0, menu_but_c, c_black);
			draw_text_ext_transformed_t(menu_quests_x, menu_quests_y + menu_but_w * menu_quests_s - 20, menu_quests_n, -1, menu_txt_w, menu_txt_s1, menu_txt_s1, 0, menu_but_c, c_black);
			draw_text_ext_transformed_t(  menu_shop_x,   menu_shop_y + menu_but_w *   menu_shop_s - 20,   menu_shop_n, -1, menu_txt_w, menu_txt_s1, menu_txt_s1, 0, menu_but_c, c_black);
			}
			else
			{
			draw_sprite_ext_t(s_menu_buttons_12, 0, 0, menu_heroes_y, menu_but_s * menu_heroes_s, menu_but_s * menu_heroes_s, 0, c_white, 1, c_white, c_black);
			draw_sprite_ext_t(s_menu_buttons_12, 1, 0, menu_totems_y, menu_but_s * menu_totems_s, menu_but_s * menu_totems_s, 0, c_white, 1, c_white, c_black);
			draw_sprite_ext_t(s_menu_buttons_34, 0, 1280, menu_quests_y, menu_but_s * menu_quests_s, menu_but_s * menu_quests_s, 0, c_white, 1, c_white, c_black);
			draw_sprite_ext_t(s_menu_buttons_34, 1, 1280,   menu_shop_y, menu_but_s *   menu_shop_s, menu_but_s *   menu_shop_s, 0, c_white, 1, c_white, c_black);
	
			draw_set_font(global.game_font);
			draw_set_halign(fa_left);
			draw_set_valign(fa_bottom);
			draw_text_ext_transformed_t(menu_heroes_x, menu_heroes_y + menu_but_w * menu_heroes_s - 20, menu_heroes_n, -1, menu_txt_w, menu_txt_s1, menu_txt_s1, 0, menu_but_c, c_black);
			draw_text_ext_transformed_t(menu_totems_x, menu_totems_y + menu_but_w * menu_totems_s - 20, menu_totems_n, -1, menu_txt_w, menu_txt_s1, menu_txt_s1, 0, menu_but_c, c_black);
			draw_text_ext_transformed_t(menu_quests_x, menu_quests_y + menu_but_w * menu_quests_s - 20, menu_quests_n, -1, menu_txt_w, menu_txt_s1, menu_txt_s1, 0, menu_but_c, c_black);
			draw_text_ext_transformed_t(  menu_shop_x,   menu_shop_y + menu_but_w *   menu_shop_s - 20,   menu_shop_n, -1, menu_txt_w, menu_txt_s1, menu_txt_s1, 0, menu_but_c, c_black);
			}
		//
	
		//
		draw_sprite_ext(s_logo1_smartcowboys, 0, 640,  80, 0.35, 0.35, 0, c_white, 1);
		draw_sprite_ext(s_logo1_smartcowboys, 1, 640, 200, 0.35, 0.35, 0, c_white, 1);
		draw_sprite_ext(s_logo1_smartcowboys, 1, 640, 200, 0.35, 0.35, 0, c_red, 0.75);
		
		draw_sprite_ext(s_logo1_smartcowboys, 2, 640, 130, 0.35, 0.35, 10, c_white, 1);
		draw_sprite_ext(s_logo1_smartcowboys, 2, 640, 130, 0.35, 0.35, 10, c_red, 0.75);
		//
	
		//
		if global.tablet = 1
			{
			draw_sprite_ext_t(s_menu_settings_b,  0, menu_setb_x, menu_setb_y, menu_stat_s, menu_stat_s, 0, c_white, 1, c_white, c_black);
			draw_sprite_ext_t(s_menu_settings_b,  1, menu_setb_x * menu_stat_i, menu_setb_y, menu_stat_s, menu_stat_s, 0, c_white, 1, c_white, c_black);
			}
			else
			{
			draw_sprite_ext_t(s_menu_settings_b,  0, menu_setb_x, menu_setb_y, menu_stat_s, menu_stat_s, 0, c_white, 1, c_white, c_black);
			draw_sprite_ext_t(s_menu_settings_b,  1, menu_setb_x, menu_setb_y * 2, menu_stat_s, menu_stat_s, 0, c_white, 1, c_white, c_black);
			}
		//
	
		//
		draw_text_transformed_t(menu_gold_x, menu_setb_y, string(global.cash) + "ç", menu_txt_s, menu_txt_s, 0, global.color_white, c_black);
		draw_sprite_ext_t(s_menu_settings_p, 1, menu_plus1_x, menu_setb_y, menu_plus_s, menu_plus_s, 0, c_white, 1, c_white, c_black);
		
		draw_text_transformed_t(menu_cash_x, menu_setb_y, string(global.gold) + "©", menu_txt_s, menu_txt_s, 0, global.color_white, c_black);
		draw_sprite_ext_t(s_menu_settings_p, 1, menu_plus2_x, menu_setb_y, menu_plus_s, menu_plus_s, 0, c_white, 1, c_white, c_black);
		//
	
		//
		draw_text_transformed_t(play_b_x, play_b_y, play_b_t, play_b_s, play_b_s, 0, global.color_white, c_black);
		draw_text_transformed_t(training_b_x, training_b_y, training_b_t, training_b_s, training_b_s, 0, global.color_white, c_black);
		draw_text_transformed_t(arena_b_x, arena_b_y, arena_b_t, arena_b_s, arena_b_s, 0, global.color_white, c_black);
		//
	#endregion
	}
	
#region Отладка
	draw_set_font(global.game_font);
	draw_text_transformed_t(mouse_x, mouse_y, string(global.fps_mental / global.fps_col), 0.25, 0.25, 0, c_white, c_black);
#endregion