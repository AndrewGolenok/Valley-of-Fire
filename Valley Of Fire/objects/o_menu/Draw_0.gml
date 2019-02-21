#region Шейдер
	/*
	if training_back_y > 0 && global.lug = 0
		{
		var prx, pry;
		prx = global.paral_x * global.paral_sx;
		pry = global.paral_y * global.paral_sy;
	
		draw_set_alpha(0.3);
	
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
		}
	if global.fps_col < room_speed * 5
		{ global.fps_mental += fps_real; }
		else
		{
		if global.fps_mental / global.fps_col < 40
			{
			if !ini_section_exists("Lug")
				{ ini_write_string("Lug", "lug", "1"); }
			global.lug = 1;
			}
		}
	*/
#endregion
#region Типа Шейдер
	draw_sprite(s_tipasheder, 0, 640, global.size / 2);
#endregion

#region Параллакс
	var prx, pry, xxxx, player_num;
		prx = global.paral_x * global.paral_sx;
		pry = global.paral_y * global.paral_sy;
		player_num = "";
	if global.size <= 640
			{ xxxx = - 20; }
			else
			{ xxxx = 0; }
	var popka;
		popka = (720 - global.size) / 2;
	if popka > 0
		{ popka = 0; }
	
	var popka2;
		popka2 = (960 - global.size) * 1.5;
	if popka2 > 0
		{ popka2 = 0; }
	
	if global.pvp_set != 0
		{
		//if os_get_language() = "ru"
		//	{ player_num = " (И"+string(global.pvp_now)+")"; }
		//	else
		//	{ player_num = " (P"+string(global.pvp_now)+")"; }
		player_num = " (" + main_text[1] + string(global.pvp_now)+")";
		}
#endregion

#region Главное меню
	if global.menu_next = "main"   or global.menu_now = "main"
	or global.menu_next = "quests" or global.menu_now = "quests"
		{
		// КНОПКИ
		var ms1, ms2, ms3, ms4, ms5, ms6, ms7, ms8;
		ms1 = 1;
		ms2 = 1;
		ms3 = 1;
		ms4 = 1;
		ms7 = 1;
		
		ms5 = 1;
		ms6 = 1;
		ms8 = 1;
		
		if global.menu_now = "main"
			{
			if point_in_rectangle(mouse_x, mouse_y, 1150 - 125,  global.size - 30 - 125, 1150 + 125, global.size - 30 + 125)
				{
				//// КЛАЦ
				if mouse_check_button_pressed(mb_left)
					{
					if global.sound
						{ audio_play_sound(sd_text, 2, 0); }
					}
				//// КЛАЦ
				if mouse_check_button(mb_left)
					{ ms7 = 1.1; }
				if mouse_check_button_released(mb_left) && global.menu_next = "main" && global.menu_now = "main"
					{
					totem_yy  = 0;
					totem_yy1 = 0;
					global.p_totem[1] = -1;
					global.p_totem[2] = -1;
					global.p_totem[3] = -1;
					global.menu_next = "totem";
				
					GoogleAnalytics_SendEvent("MENU","Игрок зашёл в TOTEMS");
				
					io_clear();
					}
				}
			if point_in_rectangle(mouse_x, mouse_y, 640 - 125, global.size - 30 - 150, 640 + 125, global.size - 30 + 125)
				{
				if mouse_check_button(mb_left)
					{ ms3 = 1.1; }
				if mouse_check_button_released(mb_left) && global.menu_next = "main" && global.menu_now = "main"
					{
					if global.sound { audio_play_sound(sd_store, 3, 0); }
					global.menu_next = "store";
				
					GoogleAnalytics_SendEvent("STORE","Игрок зашёл в STORE");
				
					io_clear();
					}
				}
			if point_in_rectangle(mouse_x, mouse_y, 640 - 260 - 125,  global.size - 30 - 150, 640 - 260 + 125, global.size - 30 + 125)
				{
				//// КЛАЦ
				if mouse_check_button_pressed(mb_left)
					{
					if global.sound
						{ audio_play_sound(sd_text, 2, 0); }
					}
				//// КЛАЦ
				if mouse_check_button(mb_left)
					{ ms2 = 1.1; }
				if mouse_check_button_released(mb_left) && global.menu_next = "main" && global.menu_now = "main"
					{ global.menu_next = "training"; }
				GoogleAnalytics_SendEvent("MENU","Игрок зашёл в TRAINING");
				
				io_clear();
				}
			if point_in_rectangle(mouse_x, mouse_y, 640 + 260 - 125,  global.size - 30 - 150, 640 + 260 + 125, global.size - 30 + 125)
				{
				//// КЛАЦ
				if mouse_check_button_pressed(mb_left)
					{
					if global.sound
						{ audio_play_sound(sd_text, 2, 0); }
					}
				//// КЛАЦ
				if mouse_check_button(mb_left)
					{ ms4 = 1.1; }
				if mouse_check_button_released(mb_left) && global.menu_next = "main" && global.menu_now = "main"
					{
					hero_yy  = 0;
					hero_yy1 = 0;
					global.menu_next = "heroes";
				
					GoogleAnalytics_SendEvent("MENU","Игрок зашёл в HEROES");
				
					io_clear();
					}
				}
			if point_in_rectangle(mouse_x, mouse_y, 120 - 125,  global.size - 30 - 150, 120 + 125, global.size - 30 + 125)
				{
				//// КЛАЦ
				if mouse_check_button_pressed(mb_left)
					{
					if global.sound
						{ audio_play_sound(sd_text, 2, 0); }
					}
				//// КЛАЦ
				if mouse_check_button(mb_left)
					{ ms1 = 1.1; }
				if mouse_check_button_released(mb_left) && global.menu_next = "main" && global.menu_now= "main"
					{
					global.menu_next = "quests";
				
					GoogleAnalytics_SendEvent("MENU","Игрок зашёл в QUESTS");
				
					io_clear();
					}
				}
			}
		
		var newtot;
		newtot = 0;
		for(i=1;i<=18;i++)
			{
			if global.totem_new[i] = 1
				{ newtot = 1; break; }
			}
		
		draw_set_alpha(0.4)
			draw_rectangle_color(0, global.size - 70, 1280, global.size, c_white, c_white, c_white, c_white, 0);
		draw_set_alpha(1);
		
		#region Старое меню
			//draw_sprite_ext_t(s_menu_buttons, 1, 150,  global.size - 100, ms1, ms1, 0, c_white, 1, c_white, c_black);
			//if newtot = 1
			//	{ draw_sprite_ext(s_light, 2, 640 - 150,  global.size - 100, 0.5, 0.5, 0, c_white, 1); }
			//draw_sprite_ext_t(s_menu_buttons, 2, 640 - 150,  global.size - 100, ms2, ms2, 0, c_white, 1, c_white, c_black);
			//draw_sprite_ext_t(s_menu_buttons, 3, 640 + 150, global.size - 100, ms3, ms3, 0, c_white, 1, c_white, c_black);
			//draw_sprite_ext_t(s_menu_buttons, 0, 1130, global.size - 100, ms4, ms4, 0, c_white, 1, c_white, c_black);
			//if newtot = 1
			//	{
			//	if os_get_language() = "ru"
			//		{ draw_text_transformed_t(640 - 90,  global.size - 175, "НОВОЕ!", 0.12, 0.12, 5, c_orange, c_black); }
			//		else
			//		{ draw_text_transformed_t(640 - 90,  global.size - 175, "NEW!", 0.12, 0.12, 5, c_orange, c_black); }
			//	}
			
			//draw_set_alpha(1)
			//	draw_set_font(global.game_font);
			//	draw_set_halign(fa_center);
			//	draw_set_valign(fa_bottom);
			//	if os_get_language() = "ru"
			//		{
			//		draw_text_transformed_t(150,  global.size - 25, "ГЕРОИ", 0.15, 0.15, 5, global.color_white, c_black);
			//		draw_text_transformed_t(640 - 150,  global.size - 25, "ТОТЕМЫ", 0.15, 0.15, 5, global.color_white, c_black);
			//		draw_text_transformed_t(640 + 150,  global.size - 25, "МАГАЗИН", 0.15, 0.15, 5, global.color_white, c_black);
			//		draw_text_transformed_t(1130, global.size - 25,  "ОБУЧЕНИЕ", 0.15, 0.15, 5, global.color_white, c_black);	
			//		}
			//		else
			//		{
			//		draw_text_transformed_t(150,  global.size - 25, "HEROES", 0.15, 0.15, 5, global.color_white, c_black);
			//		draw_text_transformed_t(640 - 150,  global.size - 25, "TOTEMS", 0.15, 0.15, 5, global.color_white, c_black);
			//		draw_text_transformed_t(640 + 150,  global.size - 25, "STORE", 0.15, 0.15, 5, global.color_white, c_black);
			//		draw_text_transformed_t(1130, global.size - 25,  "TUTORIAL", 0.15, 0.15, 5, global.color_white, c_black);	
			//		}
			//draw_set_alpha(1);
		#endregion
		
		draw_sprite_ext_t(s_menu_buttons, 0, 120,  global.size - 100, ms1, ms1, 0, c_white, 1, c_white, c_black);
		//if newtot = 1
		//	{ draw_sprite_ext(s_light, 2, 640 - 150,  global.size - 100, 0.5, 0.5, 0, c_white, 1); }
		draw_sprite_ext_t(s_menu_buttons, 4, 640 - 260,  global.size - 100, ms2, ms2, 0, c_white, 1, c_white, c_black);
		draw_sprite_ext_t(s_menu_buttons, 3, 640, global.size - 100, ms3, ms3, 0, c_white, 1, c_white, c_black);
		draw_sprite_ext_t(s_menu_buttons, 1, 640 + 260, global.size - 100, ms4, ms4, 0, c_white, 1, c_white, c_black);
		draw_sprite_ext_t(s_menu_buttons, 2, 1150, global.size - 100, ms7, ms7, 0, c_white, 1, c_white, c_black);
		
		//if newtot = 1
		//	{
		//	if os_get_language() = "ru"
		//		{ draw_text_transformed_t(640 - 90,  global.size - 175, "НОВОЕ!", 0.12, 0.12, 5, c_orange, c_black); }
		//		else
		//		{ draw_text_transformed_t(640 - 90,  global.size - 175, "NEW!", 0.12, 0.12, 5, c_orange, c_black); }
		//	}
			
		draw_set_alpha(1)
			draw_set_font(global.game_font);
			draw_set_halign(fa_center);
			draw_set_valign(fa_bottom);
			//if os_get_language() = "ru"
			//	{
			//	draw_text_transformed_t(120,  global.size - 25, "ЗАДАНИЯ", 0.15, 0.15, 5, global.color_white, c_black);
			//	draw_text_transformed_t(640 - 260,  global.size - 25, "ОБУЧЕНИЕ", 0.15, 0.15, 5, global.color_white, c_black);
			//	draw_text_transformed_t(640,  global.size - 25, "МАГАЗИН", 0.15, 0.15, 5, global.color_white, c_black);
			//	draw_text_transformed_t(640 + 260,  global.size - 25, "ГЕРОИ", 0.15, 0.15, 5, global.color_white, c_black);
			//	draw_text_transformed_t(1150, global.size - 25,  "ТОТЕМЫ", 0.15, 0.15, 5, global.color_white, c_black);	
			//	}
			//	else
			//	{
			//	draw_text_transformed_t(120,  global.size - 25, "QUESTS", 0.15, 0.15, 5, global.color_white, c_black);
			//	draw_text_transformed_t(640 - 260,  global.size - 25, "TUTORIAL", 0.15, 0.15, 5, global.color_white, c_black);
			//	draw_text_transformed_t(640,  global.size - 25, "STORE", 0.15, 0.15, 5, global.color_white, c_black);
			//	draw_text_transformed_t(640 + 260,  global.size - 25, "HEROES", 0.15, 0.15, 5, global.color_white, c_black);
			//	draw_text_transformed_t(1150, global.size - 25,  "TOTEMS", 0.15, 0.15, 5, global.color_white, c_black);	
			//	}
			draw_text_transformed_t(120,  global.size - 25, main_text[2], 0.15, 0.15, 5, global.color_white, c_black);
			draw_text_transformed_t(640 - 260,  global.size - 25, main_text[3], 0.15, 0.15, 5, global.color_white, c_black);
			draw_text_transformed_t(640,  global.size - 25, main_text[4], 0.15, 0.15, 5, global.color_white, c_black);
			draw_text_transformed_t(640 + 260,  global.size - 25, main_text[5], 0.15, 0.15, 5, global.color_white, c_black);
			draw_text_transformed_t(1150, global.size - 25, main_text[6], 0.15, 0.15, 5, global.color_white, c_black);	
		draw_set_alpha(1);
		// КНОПКИ
		
		#region Рука
			if (global.hand_gold && global.gold >= 100)
			or (global.hand_cash && global.cash >= 50)
				{
				if hand_i < 10
					{ hand_i += 0.4; }
					else
					{ hand_i = 0; }
				draw_sprite_ext(s_training_hand, hand_i, 640, global.size - 100, 1, 1, 0, c_black, 0.5);
				draw_sprite_ext_t(s_training_hand, hand_i, 640, global.size - 100, 1, 1, 0, global.color_white, 1, global.color_white, c_black);
				}
		#endregion
		
		var sc_scale;
		sc_scale = 1;
		//if global.size < 640
			{ sc_scale = 0.4 + 0.6 * (global.size / 960); }
		// ЛОГО
		draw_sprite_ext(s_logo1_smartcowboys, 0, 640, 80, 0.35 * sc_scale, 0.35 * sc_scale, 0, c_white, 1);
		draw_sprite_ext(s_logo1_smartcowboys, 1, 640, 80 + 120 * sc_scale, 0.35 * sc_scale, 0.35 * sc_scale, 0, c_white, 1);
		draw_sprite_ext(s_logo1_smartcowboys, 1, 640, 80 + 120 * sc_scale, 0.35 * sc_scale, 0.35 * sc_scale, 0, c_red, 0.75);
		
		draw_sprite_ext(s_logo1_smartcowboys, 2, 640, 80 + 50 * sc_scale, 0.35 * sc_scale, 0.35 * sc_scale, 10, c_white, 1);
		draw_sprite_ext(s_logo1_smartcowboys, 2, 640, 80 + 50 * sc_scale, 0.35 * sc_scale, 0.35 * sc_scale, 10, c_red, 0.75);
		// ЛОГО
		
		if global.menu_next = "main" or global.menu_now = "main"
			{
			if mouse_check_button_released(mb_left)
				{
				if point_in_rectangle(mouse_x, mouse_y, 640 - 100, 0, 640 + 100, y + 200)
					{
					//// КЛАЦ
					if global.sound
						{ audio_play_sound(sd_text, 2, 0); }
					//// КЛАЦ
					
					//requestReview();
					
					if global.titles = 0
						{ global.titles = 1; io_clear(); }
					}
				}
			//draw_rectangle(640 - 100, 0, 640 + 100, y + 200, 1);
			// ИГРА
			//draw_sprite_ext_t(s_sunmoon, 3, 1130, global.size - 100, 1, 1, 0, c_white, 1, c_white, c_black);
			//draw_set_alpha(0.3);
			//draw_set_color(c_black);
			//draw_text_transformed(640 + prx, global.size / 2 + 10 + pry, "PLAY", 0.4, 0.4, 5);
			//draw_set_color(c_white);
			//draw_set_alpha(1);
			
			//// БЫСТРАЯ ИГРА
			if point_in_rectangle(mouse_x, mouse_y, string_width("∂БЫСТРАЯ ИГРА∂") * 0.22 / 2 + 20 - string_width("œQUICK PLAYœ") * 0.22 / 2, global.size / 2 - string_height("œQUICK PLAYœ") * 0.22 - 10 - 0.2 * (global.size - 590), string_width("∂БЫСТРАЯ ИГРА∂") * 0.22 / 2 + 20 + string_width("œQUICK PLAYœ") * 0.22 / 2, global.size / 2 + string_height("œQUICK PLAYœ") * 0.22 / 2.5 - 10 - 0.2 * (global.size - 590))
			&& global.menu_now = "main"
				{
				GoogleAnalytics_SendEvent("PLAY","Игрок выбрал QUICK PLAY");
				//// КЛАЦ
				if mouse_check_button_pressed(mb_left)
					{
					if global.sound
						{ audio_play_sound(sd_text, 2, 0); }
					}
				//// КЛАЦ
				if mouse_check_button(mb_left)
					{ ms5 = 1.1; }
				if mouse_check_button_released(mb_left) && global.menu_next = "main" && global.menu_now= "main"
					{
					#region Рандом тотемов
						var heroes, r_heroes;
						heroes = "";
						for(i=1;i<=7;i++)
							{
							if global.heroes_have[i] > 0
								{ heroes += string(i); }
							}
						r_heroes = real(string_copy(heroes, irandom_range(1, string_length(heroes)), 1));
						
						#region РАНДОМ
						var totems, r_t1, r_t2, r_t3, n_totem, ti;
						totems = "";
						n_totem = irandom(1);
						r_t1 = -1;
						r_t2 = -1;
						r_t3 = -1;
					
						if n_totem = 1
							{
							for(i=1;i<=9;i++)
								{
								if global.totem_have[i] > 0
									{ totems += string(i); }
								}
							if string_length(totems) >= 3
								{
								ti = irandom_range(1, string_length(totems));
								r_t3 = real(string_copy(totems, ti, 1));
								totems = string_delete(totems, ti, 1);
								
								ti = irandom_range(1, string_length(totems));
								r_t2 = real(string_copy(totems, ti, 1));
								totems = string_delete(totems, ti, 1);
								
								ti = irandom_range(1, string_length(totems));
								r_t1 = real(string_copy(totems, ti, 1));
								totems = string_delete(totems, ti, 1);
								}
							if string_length(totems) = 2
								{
								ti = irandom_range(1, string_length(totems));
								r_t3 = real(string_copy(totems, ti, 1));
								totems = string_delete(totems, ti, 1);
								
								ti = irandom_range(1, string_length(totems));
								r_t2 = real(string_copy(totems, ti, 1));
								totems = string_delete(totems, ti, 1);
								
								//r_t1 = -1;
								
								n_totem = 0;
								}
							if string_length(totems) = 1
								{
								ti = irandom_range(1, string_length(totems));
								r_t3 = real(string_copy(totems, ti, 1));
								totems = string_delete(totems, ti, 1);
								
								//r_t2 = -1;
								
								//r_t1 = -1;
								
								n_totem = 0;
								}
							if totems = ""
								{
								//r_t1 = -1;
								
								//r_t2 = -1;
								
								//r_t3 = -1;
								
								n_totem = 0;
								}
							}
						if n_totem = 0
							{
							for(i=1;i<=9;i++)
								{
								if global.totem_have[i + 9] > 0
									{ totems += string(i + 9); }
								}
							if string_length(totems) >= 3
								{
								if r_t3 = -1
									{
									ti = irandom_range(1, string_length(totems));
									r_t3 = real(string_copy(totems, ti, 1));
									totems = string_delete(totems, ti, 1);
									}
								if r_t2 = -1
									{
									ti = irandom_range(1, string_length(totems));
									r_t2 = real(string_copy(totems, ti, 1));
									totems = string_delete(totems, ti, 1);
									}
								if r_t1 = -1
									{
									ti = irandom_range(1, string_length(totems));
									r_t1 = real(string_copy(totems, ti, 1));
									totems = string_delete(totems, ti, 1);
									}
								}
							if string_length(totems) = 2
								{
								if r_t3 = -1
									{
									ti = irandom_range(1, string_length(totems));
									r_t3 = real(string_copy(totems, ti, 1));
									totems = string_delete(totems, ti, 1);
									}
								if r_t2 = -1
									{
									ti = irandom_range(1, string_length(totems));
									r_t2 = real(string_copy(totems, ti, 1));
									totems = string_delete(totems, ti, 1);
									}
								//r_t1 = -1;
								}
							if string_length(totems) = 1
								{
								if r_t3 = -1
									{
									ti = irandom_range(1, string_length(totems));
									r_t3 = real(string_copy(totems, ti, 1));
									totems = string_delete(totems, ti, 1);
									}
								//r_t2 = -1;
						
								//r_t1 = -1;
								}
							}
						#endregion
					#endregion
					
					global.hero = r_heroes;
					global.p_totem[1] = r_t1;
					global.p_totem[2] = r_t2;
					global.p_totem[3] = r_t3;
					if global.player_rank != 15
						{ global.player_rank = irandom_range(global.player_rank - 1, 15); }
					global.pvp_now = 0;
					global.pvp_set = 0;
					global.quick = 1;
					//global.pvp   = 1;
					room_goto_t("duel");
					}
				}
			}
			
			//draw_rectangle(640 - string_width("QUICK PLAY") * 0.22 - 30, global.size / 2 + 20, 640 - 30, global.size / 2 + 20, 1);
			//if os_get_language() = "ru"
			//	{ draw_text_transformed_t(string_width("∂БЫСТРАЯ ИГРА∂") * 0.22 / 2 + 20, global.size / 2 - 10 - 0.2 * (global.size - 590), "∂БЫСТРАЯ ИГРА∂", 0.22 * ms5, 0.22 * ms5, 5, global.color_white, c_black); }
			//	else
			//	{ draw_text_transformed_t(string_width("∂БЫСТРАЯ ИГРА∂") * 0.22 / 2 + 20, global.size / 2 - 10 - 0.2 * (global.size - 590), "∂QUICK PLAY∂", 0.22 * ms5, 0.22 * ms5, 5, global.color_white, c_black); }
			draw_text_transformed_t(string_width(main_text[7]) * 0.22 / 2 + 20, global.size / 2 - 10 - 0.2 * (global.size - 590), "∂" + main_text[7] + "∂", 0.22 * ms5, 0.22 * ms5, 5, global.color_white, c_black);
			//БЫСТРАЯ ИГРА
		
			//// РАНКЕД ДУЭЛЬ
			if global.menu_now = "main"
				{
				if point_in_rectangle(mouse_x, mouse_y, 640 - string_width(main_text[8]) * 0.22 / 2, global.size / 2 - string_height("®" + main_text[8] + "®") * 0.22 / 2 + 25 + 0.2 * (global.size - 590), 640 + string_width("®" + main_text[8] + "®") * 0.22 / 2, global.size / 2 + string_height("®" + main_text[8] + "®") * 0.22 + 25 + 0.2 * (global.size - 590))
					{
					GoogleAnalytics_SendEvent("PLAY","Игрок выбрал RANKED");
					//// КЛАЦ
					if mouse_check_button_pressed(mb_left)
						{
						if global.sound
							{ audio_play_sound(sd_text, 2, 0); }
						}
					//// КЛАЦ
					if mouse_check_button(mb_left)
						{ ms6 = 1.1; }
					if mouse_check_button_released(mb_left) && global.menu_next = "main" && global.menu_now = "main"
						{
						global.pvp_now = 0;
						global.pvp_set = 0;
						global.duel = 1;
						global.menu_next = "training";
						}
					}
				}
			//if os_get_language() = "ru"
			//	{ draw_text_transformed_t(640, global.size / 2 + string_height("®РАНГ ДУЭЛЬ®") * 0.22 / 2 + 25 + 0.2 * (global.size - 590), "®РАНГ ДУЭЛЬ®", 0.22 * ms6, 0.22 * ms6, 5, global.color_white, c_black); }
			//	else
			//	{ draw_text_transformed_t(640, global.size / 2 + string_height("®RANKED®") * 0.22 / 2 + 25 + 0.2 * (global.size - 590), "®RANKED®", 0.22 * ms6, 0.22 * ms6, 5, global.color_white, c_black); }
			draw_text_transformed_t(640, global.size / 2 + string_height("®" + main_text[8] + "®") * 0.22 / 2 + 25 + 0.2 * (global.size - 590), "®" + main_text[8] + "®", 0.22 * ms6, 0.22 * ms6, 5, global.color_white, c_black);
			//РАНКЕД ДУЭЛЬ
		
			//// ПРОТИВ ДРУГА
			if point_in_rectangle(mouse_x, mouse_y, 1280 - string_width("œ" + main_text[9] + "œ") * 0.22 / 2 - 20 - string_width("œ" + main_text[9] + "œ") * 0.22 / 2, global.size / 2 - string_height("œ" + main_text[9] + "œ") * 0.22 - 60 - 0.2 * (global.size - 590), 1280 - string_width("œ" + main_text[9] + "œ") * 0.22 / 2 - 20 + string_width("œ" + main_text[9] + "œ") * 0.22 / 2, global.size / 2 + string_height("œ" + main_text[9] + "œ") * 0.22 - 60 - 0.2 * (global.size - 590))
			&& global.menu_now = "main"
				{
				GoogleAnalytics_SendEvent("PLAY","Игрок выбрал QUICK PLAY");
				//// КЛАЦ
				if mouse_check_button_pressed(mb_left)
					{
					if global.sound
						{ audio_play_sound(sd_text, 2, 0); }
					}
				//// КЛАЦ
				if mouse_check_button(mb_left)
					{ ms8 = 1.1; }
				if mouse_check_button_released(mb_left) && global.menu_next = "main" && global.menu_now= "main"
					{
					if 0
						{
						#region Рандом тотемов
							var heroes, r_heroes;
							heroes = "";
							for(i=1;i<=7;i++)
								{
								if global.heroes_have[i] > 0
									{ heroes += string(i); }
								}
							r_heroes = real(string_copy(heroes, irandom_range(1, string_length(heroes)), 1));
						
							#region РАНДОМ
							var totems, r_t1, r_t2, r_t3, n_totem, ti;
							totems = "";
							n_totem = irandom(1);
							r_t1 = -1;
							r_t2 = -1;
							r_t3 = -1;
					
							if n_totem = 1
								{
								for(i=1;i<=9;i++)
									{
									if global.totem_have[i] > 0
										{ totems += string(i); }
									}
								if string_length(totems) >= 3
									{
									ti = irandom_range(1, string_length(totems));
									r_t3 = real(string_copy(totems, ti, 1));
									totems = string_delete(totems, ti, 1);
								
									ti = irandom_range(1, string_length(totems));
									r_t2 = real(string_copy(totems, ti, 1));
									totems = string_delete(totems, ti, 1);
								
									ti = irandom_range(1, string_length(totems));
									r_t1 = real(string_copy(totems, ti, 1));
									totems = string_delete(totems, ti, 1);
									}
								if string_length(totems) = 2
									{
									ti = irandom_range(1, string_length(totems));
									r_t3 = real(string_copy(totems, ti, 1));
									totems = string_delete(totems, ti, 1);
								
									ti = irandom_range(1, string_length(totems));
									r_t2 = real(string_copy(totems, ti, 1));
									totems = string_delete(totems, ti, 1);
								
									//r_t1 = -1;
								
									n_totem = 0;
									}
								if string_length(totems) = 1
									{
									ti = irandom_range(1, string_length(totems));
									r_t3 = real(string_copy(totems, ti, 1));
									totems = string_delete(totems, ti, 1);
								
									//r_t2 = -1;
								
									//r_t1 = -1;
								
									n_totem = 0;
									}
								if totems = ""
									{
									//r_t1 = -1;
								
									//r_t2 = -1;
								
									//r_t3 = -1;
								
									n_totem = 0;
									}
								}
							if n_totem = 0
								{
								for(i=1;i<=9;i++)
									{
									if global.totem_have[i + 9] > 0
										{ totems += string(i + 9); }
									}
								if string_length(totems) >= 3
									{
									if r_t3 = -1
										{
										ti = irandom_range(1, string_length(totems));
										r_t3 = real(string_copy(totems, ti, 1));
										totems = string_delete(totems, ti, 1);
										}
									if r_t2 = -1
										{
										ti = irandom_range(1, string_length(totems));
										r_t2 = real(string_copy(totems, ti, 1));
										totems = string_delete(totems, ti, 1);
										}
									if r_t1 = -1
										{
										ti = irandom_range(1, string_length(totems));
										r_t1 = real(string_copy(totems, ti, 1));
										totems = string_delete(totems, ti, 1);
										}
									}
								if string_length(totems) = 2
									{
									if r_t3 = -1
										{
										ti = irandom_range(1, string_length(totems));
										r_t3 = real(string_copy(totems, ti, 1));
										totems = string_delete(totems, ti, 1);
										}
									if r_t2 = -1
										{
										ti = irandom_range(1, string_length(totems));
										r_t2 = real(string_copy(totems, ti, 1));
										totems = string_delete(totems, ti, 1);
										}
									//r_t1 = -1;
									}
								if string_length(totems) = 1
									{
									if r_t3 = -1
										{
										ti = irandom_range(1, string_length(totems));
										r_t3 = real(string_copy(totems, ti, 1));
										totems = string_delete(totems, ti, 1);
										}
									//r_t2 = -1;
						
									//r_t1 = -1;
									}
								}
							#endregion
						#endregion
					
						//global.hero = r_heroes;
						//global.p_totem[1] = r_t1;
						//global.p_totem[2] = r_t2;
						//global.p_totem[3] = r_t3;
						//if global.player_rank != 15
						//	{ global.player_rank = irandom_range(global.player_rank - 1, 15); }
						//global.quick = 1;
						//global.pvp   = 1;
						//room_goto_t("duel");
						}
					global.pvp_set = 1;
					global.duel = 1;
					global.menu_next = "training";
					}
				}
			//draw_rectangle(640 - string_width("QUICK PLAY") * 0.22 - 30, global.size / 2 + 20, 640 - 30, global.size / 2 + 20, 1);
			//if os_get_language() = "ru"
			//	{ draw_text_transformed_t(1280 - string_width("œПРОТИВ ДРУГАœ") * 0.22 / 2 - 20, global.size / 2 - 60 - 0.2 * (global.size - 590), "œПРОТИВ ДРУГАœ", 0.22 * ms8, 0.22 * ms8, 5, global.color_white, c_black); }
			//	else
			//	{ draw_text_transformed_t(1280 - string_width("œПРОТИВ ДРУГАœ") * 0.22 / 2 - 20, global.size / 2 - 60 - 0.2 * (global.size - 590), "œVERSUS FRIENDœ", 0.22 * ms8, 0.22 * ms8, 5, global.color_white, c_black); }
			draw_text_transformed_t(1280 - string_width("œ" + main_text[9] + "œ") * 0.22 / 2 - 20, global.size / 2 - 60 - 0.2 * (global.size - 590), "œ" + main_text[9] + "œ", 0.22 * ms8, 0.22 * ms8, 5, global.color_white, c_black);
			//ПРОТИВ ДРУГА
		
			/// Голда и Кэш
			if global.menu_now = "main"
				{
				if mouse_check_button_released(mb_left)
					{
					if point_in_rectangle(mouse_x, mouse_y, 1280 - string_width(string(global.cash) + "ç") * 0.2 - 10 - string_width(string(global.gold) + "©") * 0.2 - 10, 0, 1280, string_height(string(global.gold) + "©") * 0.2 + 30)
						{
						GoogleAnalytics_SendEvent("PLAY","Игрок нажал сверху на валюту");
						//// КЛАЦ
							if global.sound
								{ audio_play_sound(sd_text, 2, 0); }
						//// КЛАЦ
						global.menu_next = "store";
						global.menu_now = "store";
						store_yy1 = -785;
						store_yy  = 0;
						training_back_y = 0;
						io_clear();
						}
					}
				}
		draw_text_transformed_t(1280 - string_width(string(global.cash) + "ç") * 0.2 - 10 - string_width(string(global.gold) + "©") / 2 * 0.2 - 10, string_height(string(global.gold) + "©") * 0.2 + 10, string(global.gold) + "©", 0.2, 0.2, 0, global.gold_color, c_black);
		draw_text_transformed_t(1280 - string_width(string(global.cash) + "ç") / 2 * 0.2 - 10, string_height(string(global.gold) + "©") * 0.2 + 10, string(global.cash) + "ç", 0.2, 0.2, 0, global.cash_color, c_black);
		// Голда и Кэш
		
		#region Время  
		///
			var time;
			time_h = string(o_control.day_hour);
			time_m = string(o_control.day_minute);
			if o_control.day_hour < 10
				{ time_h = "0" + string(o_control.day_hour); }
			if o_control.day_minute < 10
				{ time_m = "0" + string(o_control.day_minute); }
			
			if time_s = -1
				{ time = time_h + ":" + time_m; }
				else
				{ time = time_h + "µ" + time_m; }
			if (time_t > 0 && time_s = -1) or (time_t < room_speed && time_s = 1)
				{ time_t += time_s; }
				else
				{ time_s = -time_s; }
			draw_text_transformed_t(125 + 72 * 1.6 + string_width(time) / 2 * 0.2 + 10, string_height(string(global.gold) + "©") * 0.2 + 10, time, 0.2, 0.2, 0, global.color_white, c_black);
		////
		#endregion
		#region Музыка
			draw_sprite_ext_t(s_music, music, 72, 60 + 8, 0.4, 0.4, 10, global.color_white, 0.5, global.color_white, c_black);
			draw_sprite_ext_t(s_music, music, 72, 60, 0.4, 0.4, 10, global.color_white, 1, global.color_white, c_black);
			
			if global.menu_now = "main"
				{
				if mouse_check_button_pressed(mb_left)
					{
					if point_in_rectangle(mouse_x, mouse_y, 0, 0, 120, 120)
						{
						//// КЛАЦ
						if mouse_check_button_pressed(mb_left)
							{
							if global.sound
								{ audio_play_sound(sd_text, 2, 0); }
							}
						//// КЛАЦ
						global.music = !global.music;
						ini_open("Music.ini");
							ini_write_string("Music", "music", string(global.music));
						ini_close();
						}
					}
				}
			//draw_rectangle(0, 0, 120, 120, 1);
			
			if global.music = 1
				{
				if music > 0
					{ music -= 1; }
					else
					{ music = 0; }
				}
				else
				{
				if music < 16
					{ music += 1; }
					else
					{ music = 16; }
				}
		#endregion
		#region Звуки 
			draw_sprite_ext_t(s_sound, sound, 72 + 72 * 1.6, 60 + 8, 0.4, 0.4, 10, global.color_white, 0.5, global.color_white, c_black);
			draw_sprite_ext_t(s_sound, sound, 72 + 72 * 1.6, 60, 0.4, 0.4, 10, global.color_white, 1, global.color_white, c_black);
			
			if global.menu_now = "main"
				{
				if mouse_check_button_pressed(mb_left)
					{
					if point_in_rectangle(mouse_x, mouse_y, 72 * 1.6 + 15, 0, 120 + 72 * 1.6, 125)
						{
						//// КЛАЦ
						if global.sound
							{ audio_play_sound(sd_text, 2, 0); }
						//// КЛАЦ
						global.sound = !global.sound;
						//// КЛАЦ
						if global.sound
							{ audio_play_sound(sd_text, 2, 0); }
						//// КЛАЦ
						ini_open("Music.ini");
							ini_write_string("Music", "sound", string(global.sound));
						ini_close();
						}
					}
				}
			//draw_rectangle(0, 0, 120, 120, 1);
			
			if global.sound = 1
				{
				if sound > 0
					{ sound -= 1; }
					else
					{ sound = 0; }
				}
				else
				{
				if sound < 16
					{ sound += 1; }
					else
					{ sound = 16; }
				}
		#endregion
		
		////
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
	
	var ptotem1, ptotem2, ptotem3;
	ptotem1 = global.p_totem[1];
	ptotem2 = global.p_totem[2];
	ptotem3 = global.p_totem[3];
	
	///////
	
	#region Сами тотемы
		for(i=1;i<=18;i++)
			{
			if global.menu_now != "totem"
				{ totem_yy1 = 0; }
			draw_sprite_ext(s_totems, i, 290 + totem_x[i], (160 + 360 + popka) - top + totem_y[i] + training_back_y + totem_yy1 + 10 + pry, totem_s, totem_s, 0, c_black, 0.5); 
			if global.totem_new[i] = 1
				{ draw_sprite_ext(s_light, 0, 290 + totem_x[i] + prx, (160 + 360 + popka) - top + totem_y[i] + training_back_y + totem_yy1 + 10 + pry, totem_s, totem_s, 0, c_white, 0.7);  }
			draw_sprite_ext(s_totems, i, 290 + totem_x[i] + prx, (160 + 360 + popka) - top + totem_y[i] + training_back_y + totem_yy1 + pry, totem_s * totems_ss[i], totem_s * totems_ss[i], 0, c_white, 1);
			if global.totem_have[i] = 0 or (global.duel = 1 && (global.p_totem[1] = i or global.p_totem[2] = i or global.p_totem[3] = i))
				{ draw_sprite_ext(s_totems, i, 290 + totem_x[i] + prx, (160 + 360 + popka) - top + totem_y[i] + training_back_y + totem_yy1 + pry, totem_s * totems_ss[i], totem_s * totems_ss[i], 0, c_black, 0.4); }
				else
				{ draw_sprite_ext(s_totems_eyes, i, 290 + totem_x[i] + prx, (160 + 360 + popka) - top + totem_y[i] + training_back_y + totem_yy1 + pry, totem_s * totems_ss[i], totem_s * totems_ss[i], 0, totem_c[i], totem_alp); }
			if global.totem_new[i] = 1
				{
				//if os_get_language() = "ru"
				//	{ draw_text_transformed_t(290 + totem_x[i] + prx + 40, (160 + 360 + popka) - top + totem_y[i] + training_back_y + totem_yy1 + 10 + pry - 47, "НОВОЕ!", 0.1, 0.1, 0, c_orange, c_black); }
				//	else
				//	{ draw_text_transformed_t(290 + totem_x[i] + prx + 40, (160 + 360 + popka) - top + totem_y[i] + training_back_y + totem_yy1 + 10 + pry - 47, "NEW!", 0.1, 0.1, 0, c_orange, c_black); }
				draw_text_transformed_t(290 + totem_x[i] + prx + 40, (160 + 360 + popka) - top + totem_y[i] + training_back_y + totem_yy1 + 10 + pry - 47, totems_text[1], 0.1, 0.1, 0, c_orange, c_black);
				}
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
		
		draw_text_transformed_t(290 + text_x + prx, (160 + 360 + popka) - top + text_y[1] + training_back_y + totem_yy1 + pry, text_tot[1], 0.2, 0.2, 0, totem_c[1], c_black);
		draw_text_transformed_t(290 + text_x + prx, (160 + 360 + popka) - top + text_y[2] + training_back_y + totem_yy1 + pry, text_tot[2], 0.2, 0.2, 0, totem_c[7], c_black);
		draw_text_transformed_t(290 + text_x + prx, (160 + 360 + popka) - top + text_y[3] + training_back_y + totem_yy1 + pry, text_tot[3], 0.2, 0.2, 0, totem_c[12], c_black);
		draw_text_transformed_t(290 + text_x + prx, (160 + 360 + popka) - top + text_y[4] + training_back_y + totem_yy1 + pry, text_tot[4], 0.2, 0.2, 0, totem_c[16], c_black);
		
		if mouse_check_button(mb_left)
		&& point_in_rectangle(mouse_x, mouse_y, 0, global.size / 2 - 270, 720, global.size / 2 + 270)
			{
			if totem_yy = 0
				{ totem_yy = totem_yy1 - mouse_y; }
			var totemy;
			totemy = totem_yy1;
			totem_yy1 = totem_yy + mouse_y;
			
			if totem_yy1 > 200
				{ totem_yy1 = 200; }
			if totem_yy1 < -1100
				{ totem_yy1 = -1100; }
			
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
			if point_in_rectangle(mouse_x, mouse_y, 290 + totem_x[i] - totem_s * totem_w, 140 + 360 + popka - top + totem_y[i] + training_back_y + totem_yy1 + 10 - totem_s * totem_w, 290 + totem_x[i] + totem_s * totem_w, 140 + 360 - top + popka + totem_y[i] + training_back_y + totem_yy1 + 10 + totem_s * totem_w)
				{
				//// КЛАЦ
				if mouse_check_button_pressed(mb_left)
					{
					if global.sound
						{ audio_play_sound(sd_text, 2, 0); }
					}
				//// КЛАЦ
				if mouse_check_button(mb_left) && totem_pr != 0
					{ totems_ss[i] = 1.1; }
				if mouse_check_button_pressed(mb_left) && totem_pr = 0
					{ totem_pr = i; }
				
				
				GoogleAnalytics_SendEvent("TOTEMS","Игрок выбрал тотем " + string(i));
				
				if mouse_check_button_released(mb_left) && totem_re = 0 && totem_yy1 <= 0 && totem_yy1 >= -950
					{
					if global.duel = 0
						{
						if global.totem_new[i] = 1
							{
							ini_open("Music.ini");
								ini_write_string("Totems", "totem_n" + string(i), "2");
								global.totem_new[i]  = ini_read_real("Totems", "totem_n" + string(i), 0);
							ini_close();
							}
						if totem_pr = i// && hold_sp = 0// && totem_yy = 0
							{ totem_pr = 0; totem_re = 0; totem_now = i; }
							else
							{ totem_pr = 0; totem_re = 0; }
						}
						else
						{
						if global.totem_new[i] = 1
							{
							ini_open("Music.ini");
								ini_write_string("Totems", "totem_n" + string(i), "2");
								global.totem_new[i]  = ini_read_real("Totems", "totem_n" + string(i), 0);
							ini_close();
							}
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
				
				draw_sprite_ext(s_totems, totem_now, 1280 - 300, global.size / 2 - 100 + training_back_y + 15, 0.4, 0.4, 0, c_black, 0.5); 
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
					//// КЛАЦ
					if mouse_check_button_pressed(mb_left)
						{
						if global.sound
							{ audio_play_sound(sd_text, 2, 0); }
						}
					//// КЛАЦ
					if mouse_check_button(mb_left)
						{ go5 = 1.1; }
					if mouse_check_button_released(mb_left)
						{
						if global.pvp_set = 0
							{ global.quick = 0; global.pvp = 0; }
							else
							{ global.quick = 1; global.pvp = 1; }
						
						if global.pvp_set = 0
							{ room_goto_t("duel"); }
						
						if global.pvp_now = 1
							{
							global.p_totem_p[1] = global.p_totem[1];
							global.p_totem_p[2] = global.p_totem[2];
							global.p_totem_p[3] = global.p_totem[3];
							
							global.p_totem[1] = -1;
							global.p_totem[2] = -1;
							global.p_totem[3] = -1;
							
							global.pvp_now = 2;
							global.menu_now = "heroes"; global.menu_next = "heroes";
							}
							else
							{
							if global.pvp_now = 2
								{
								global.e_totem[1] = global.p_totem[1];
								global.e_totem[2] = global.p_totem[2];
								global.e_totem[3] = global.p_totem[3];
								
								global.p_totem[1] = global.p_totem_p[1];
								global.p_totem[2] = global.p_totem_p[2];
								global.p_totem[3] = global.p_totem_p[3];
								
								room_goto_t("duel");
								}
							}
						}
					io_clear();
					}
				
				/////////////
				if global.p_totem[3] != -1
					{
					totems_p[3] = global.p_totem[3];
					totems_x[3] = 0;
					if totems_y[3] < 0
						{ totems_y[3] += 60; }
						else
						{ totems_y[3] = 0; }
					draw_sprite_ext(s_totems, global.p_totem[3], 1280 - 300 - 61, 2 * totem_w * 0.7 + totems_y[3] + global.size / 2 - 130 + training_back_y + 10, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.5); 
					if global.totem_have[global.p_totem[3]] = 1
						{ draw_sprite_ext(s_totems_light, global.p_totem[3], 1280 - 300 - 61, 2 * totem_w * 0.7 + totems_y[3] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, totem_c[global.p_totem[3]], totem_alp); }
					draw_sprite_ext(s_totems, global.p_totem[3], 1280 - 300 - 61, 2 * totem_w * 0.7 + totems_y[3] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_white, 1);
					if global.totem_have[global.p_totem[3]] = 0
						{ draw_sprite_ext(s_totems, global.p_totem[3], 1280 - 300 - 61, 2 * totem_w * 0.7 + totems_y[3] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.4); }
						else
						{ draw_sprite_ext(s_totems_eyes, global.p_totem[3], 1280 - 300 - 61, 2 * totem_w * 0.7 + totems_y[3] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, totem_c[global.p_totem[3]], totem_alp); }
					
					draw_text_ext_transformed_t(1280 -199 - 5,  2 * totem_w * 0.7 + totems_y[3] + global.size / 2 - 130 + training_back_y, string_upper(global.totem_name[global.p_totem[3]]), -1, 1000, 0.09, 0.09, 0, totem_c[global.p_totem[3]], c_black);
					
					if point_in_rectangle(mouse_x, mouse_y, 1280 - 300 - 61 - totem_w / 2, 2 * totem_w * 0.7 + totems_y[3] + global.size / 2 - 130 + training_back_y + 30 - totem_w / 2 - 0, 1280 - 300 - 61 + totem_w / 2, 2 * totem_w * 0.7 + totems_y[3] + global.size / 2 - 130 + training_back_y + 30 + totem_w / 2 - 70)
						{
						//// КЛАЦ
						if mouse_check_button_pressed(mb_left)
							{
							if global.sound
								{ audio_play_sound(sd_text, 2, 0); }
							}
						//// КЛАЦ
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
							draw_sprite_ext(s_totems, totems_p[3], 1280 - 300 - 61 + totems_x[3], 2 * totem_w * 0.8 + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_white, 1);
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
								if global.p_totem[2] != -1
									{
									totems_y[3] = totems_y[2];
									totems_y[2] = totems_y[1];
									global.p_totem[3] = global.p_totem[2];
									global.p_totem[2] = global.p_totem[1];
									global.p_totem[1] = -1;
									
									totems_x[1] = 350;
									totems_y[1] = -(global.size / 2 - 100);
									}
									else
									{
									totems_x[3] = 350;
									totems_y[3] = -(global.size / 2 - 100 + totem_w * 2);
									}
								}
								
								//else
								//{ totems_y[3] = -(global.size / 2 - 100 + totem_w * 2); totems_x[3] = 0; }
							//totems_y[3] = -(global.size / 2 - 100 + totem_w * 2);
							//totems_x[3] = 0;
							}
						}
					}
				///////////
				if global.p_totem[2] != -1
					{
					totems_p[2] = global.p_totem[2];
					totems_x[2] = 0;
					if totems_y[2] < 0
						{ totems_y[2] += 60; }
						else
						{ totems_y[2] = 0; }
					//draw_sprite_ext(s_totems, global.p_totem[2], 1280 - 300, totem_w * 0.7 + totems_y[2] + global.size / 2 - 130 + training_back_y + 10, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.5); 
					if global.totem_have[global.p_totem[2]] = 1
						{ draw_sprite_ext(s_totems_light, global.p_totem[2], 1280 - 300 - 61, totem_w * 0.7 + totems_y[2] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, totem_c[global.p_totem[2]], totem_alp); }
					draw_sprite_ext(s_totems, global.p_totem[2], 1280 - 300 - 61, totem_w * 0.7 + totems_y[2] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_white, 1);
					if global.totem_have[global.p_totem[2]] = 0
						{ draw_sprite_ext(s_totems, global.p_totem[2], 1280 - 300 - 61, totem_w * 0.7 + totems_y[2] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.4); }
						else
						{ draw_sprite_ext(s_totems_eyes, global.p_totem[2], 1280 - 300 - 61, totem_w * 0.7 + totems_y[2] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, totem_c[global.p_totem[2]], totem_alp); }
					
					draw_text_ext_transformed_t(1280 -199 - 5,  totem_w * 0.7 + totems_y[2] + global.size / 2 - 130 + training_back_y, string_upper(global.totem_name[global.p_totem[2]]), -1, 1000, 0.09, 0.09, 0, totem_c[global.p_totem[2]], c_black);
					
					if point_in_rectangle(mouse_x, mouse_y, 1280 - 300 - 61 - totem_w / 2, totem_w * 0.7 + totems_y[2] + global.size / 2 - 130 + training_back_y + 30 - totem_w / 2 - 0, 1280 - 300 + totem_w / 2, totem_w * 0.7 + totems_y[2] + global.size / 2 - 130 + training_back_y + 30 + totem_w / 2 - 70)
						{
						//// КЛАЦ
						if mouse_check_button_pressed(mb_left)
							{
							if global.sound
								{ audio_play_sound(sd_text, 2, 0); }
							}
						//// КЛАЦ
						if mouse_check_button_pressed(mb_left)
							{ global.p_totem[2] = -1; }
						}
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
							draw_sprite_ext(s_totems, totems_p[2], 1280 - 300 - 61 + totems_x[2], totem_w * 0.8 + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_white, 1);
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
				///////////
				if global.p_totem[1] != -1
					{
					totems_p[1] = global.p_totem[1];
					totems_x[1] = 0;
					if totems_y[1] < 0
						{ totems_y[1] += 60; }
						else
						{ totems_y[1] = 0; }
					//draw_sprite_ext(s_totems, global.p_totem[1], 1280 - 300, totems_y[1] + global.size / 2 - 130 + training_back_y + 10, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.5); 
					if global.totem_have[global.p_totem[1]] = 1
						{ draw_sprite_ext(s_totems_light, global.p_totem[1], 1280 - 300 - 61, totems_y[1] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, totem_c[global.p_totem[1]], totem_alp); }
					draw_sprite_ext(s_totems, global.p_totem[1], 1280 - 300 - 61, totems_y[1] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_white, 1);
					if global.totem_have[global.p_totem[1]] = 0
						{ draw_sprite_ext(s_totems, global.p_totem[1], 1280 - 300 - 61, totems_y[1] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_black, 0.4); }
						else
						{ draw_sprite_ext(s_totems_eyes, global.p_totem[1], 1280 - 300 - 61, totems_y[1] + global.size / 2 - 130 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, totem_c[global.p_totem[1]], totem_alp); }
					
					draw_text_ext_transformed_t(1280 -199 - 5, totems_y[1] + global.size / 2 - 130 + training_back_y, string_upper(global.totem_name[global.p_totem[1]]), -1, 1000, 0.09, 0.09, 0, totem_c[global.p_totem[1]], c_black);
					
					if point_in_rectangle(mouse_x, mouse_y, 1280 - 300 - 61 - totem_w / 2, totems_y[1] + global.size / 2 - 130 + training_back_y + 30 - totem_w / 2 - 0, 1280 - 300 + totem_w / 2, totems_y[1] + global.size / 2 - 130 + training_back_y + 30 + totem_w / 2 - 70)
						{
						//// КЛАЦ
						if mouse_check_button_pressed(mb_left)
							{
							if global.sound
								{ audio_play_sound(sd_text, 2, 0); }
							}
						//// КЛАЦ
						if mouse_check_button_pressed(mb_left)
							{ global.p_totem[1] = -1; }
						}
					//draw_rectangle(1280 - 300 - totem_w / 2, totems_y[1] + global.size / 2 - 130 + training_back_y + 30 - totem_w / 2 - 0, 1280 - 300 + totem_w / 2, totems_y[1] + global.size / 2 - 130 + training_back_y + 30 + totem_w / 2 - 20, 1);
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
							draw_sprite_ext(s_totems, totems_p[1], 1280 - 300 - 61 + totems_x[1], global.size / 2 - 100 + training_back_y, totem_s * 1.2, totem_s * 1.2, 0, c_white, 1);
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
				////////////
				
				
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
				draw_sprite_ext(s_light, 0, 1280 - 300, global.size - 60 + training_back_y, 0.6, 0.3, 0, c_white, 0.7);
				if global.pvp_now != 1
					{
					//if os_get_language() != "ru"
					//	{ draw_text_transformed_t(1280 - 300, global.size - 60 + training_back_y, "START", 0.25 * go5, 0.25 * go5, tr_ang, global.color_white, c_black); }
					//	else
					//	{ draw_text_transformed_t(1280 - 300, global.size - 60 + training_back_y, "СТАРТ", 0.25 * go5, 0.25 * go5, tr_ang, global.color_white, c_black); }
					draw_text_transformed_t(1280 - 300, global.size - 60 + training_back_y, totems_text[2], 0.25 * go5, 0.25 * go5, tr_ang, global.color_white, c_black);
					}
					else
					{
					//if os_get_language() != "ru"
					//	{ draw_text_transformed_t(1280 - 300, global.size - 60 + training_back_y, "NEXT", 0.25 * go5, 0.25 * go5, tr_ang, global.color_white, c_black); }
					//	else
					//	{ draw_text_transformed_t(1280 - 300, global.size - 60 + training_back_y, "ДАЛЕЕ", 0.25 * go5, 0.25 * go5, tr_ang, global.color_white, c_black); }
					draw_text_transformed_t(1280 - 300, global.size - 60 + training_back_y, totems_text[3], 0.25 * go5, 0.25 * go5, tr_ang, global.color_white, c_black);
					}
				}
		#endregion
	
	var yh, col;
	yh = 0;
	col = make_color_rgb(242, 232, 201);
	if global.size < 700
		{ yh = 30; }
	draw_sprite_ext(s_totem_back, 2, 640 - 50 + 20, global.size + training_back_y + yh + 20 * (960 / global.size), global.back_scale, global.back_scale, 0, c_black, 0.5);
	draw_sprite_ext_t(s_totem_back, 2, 640 - 50, global.size + training_back_y + yh + 20 * (960 / global.size), global.back_scale, global.back_scale, 0, c_white, 1, c_white, c_black);
	
	//if os_get_language() = "ru"
	//	{
	//	if global.duel = 1
	//		{
	//		if global.size >= 700
	//			{
	//			draw_set_font(global.game_font);
	//			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300, "ВЫБЕРИ ТОТЕМЫ" + player_num, 0.22, 0.22, 0, col, c_black);
	//			}
	//			else
	//			{
	//			draw_set_font(global.game_font);
	//			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300 + 60, "ВЫБЕРИ ТОТЕМЫ" + player_num, 0.22, 0.22, 0, col, c_black);
	//			}
	//		}
	//		else
	//		{
	//		draw_set_font(global.game_font);
	//		draw_text_transformed_t(780, global.size / 2 + training_back_y, "Т\nО\nТ\nЕ\nМ\nЫ", 0.22, 0.22, 0, col, c_black);
	//		}
	//	}
	//	else
	//	{
	//	if global.duel = 1
	//		{
	//		if global.size >= 700
	//			{
	//			draw_set_font(global.game_font);
	//			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300, "CHOOSE TOTEMS" + player_num, 0.22, 0.22, 0, col, c_black);
	//			}
	//			else
	//			{
	//			draw_set_font(global.game_font);
	//			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300 + 60, "CHOOSE TOTEMS" + player_num, 0.22, 0.22, 0, col, c_black);
	//			}
	//		}
	//		else
	//		{
	//		draw_set_font(global.game_font);
	//		draw_text_transformed_t(780, global.size / 2 + training_back_y, "T\nO\nT\nE\nM\nS", 0.22, 0.22, 0, col, c_black);
	//		}
	//	}
	///////
	if global.duel = 1
		{
		if global.size >= 700
			{
			draw_set_font(global.game_font);
			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300, totems_text[4] + player_num, 0.22, 0.22, 0, col, c_black);
			}
			else
			{
			draw_set_font(global.game_font);
			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300 + 60, totems_text[4] + player_num, 0.22, 0.22, 0, col, c_black);
			}
		}
		else
		{
		draw_set_font(global.game_font);
		draw_text_ext_transformed_t(780, global.size / 2 + training_back_y, totems_text[5], -1, 250, 0.22, 0.22, 0, col, c_black);
		}
	///////
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
	
	draw_sprite_ext(s_totem_back, 3, 640 + 140 - 5, global.size - 150 + top - training_back_y + pry * 0.5 + sc_angle * 2 - 50 + 10, global.back_scale * 0.8, global.back_scale * 0.8, 0, c_black, 0.5);
	draw_sprite_ext_t(s_totem_back, 3, 640 + prx + 140, global.size - 150 + top - training_back_y + pry * 0.5 + sc_angle * 2 - 50, global.back_scale * 0.8, global.back_scale * 0.8, 0, c_white, 1, c_white, c_black);
	
	if point_in_rectangle(mouse_x, mouse_y, 1020, 0, 1280, 250)
		{
		//// КЛАЦ
		if mouse_check_button_pressed(mb_left)
			{
			if global.sound
				{ audio_play_sound(sd_text, 2, 0); }
			}
		//// КЛАЦ
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
			//// КЛАЦ
			if mouse_check_button_pressed(mb_left)
				{
				if global.sound
					{ audio_play_sound(sd_text, 2, 0); }
				}
			//// КЛАЦ
			if global.duel = 1
				{ global.menu_now = "heroes"; global.menu_next = "heroes"; io_clear(); }
				else
				{ global.menu_next = "main"; }
			totem_yy  = 0;
			totem_yy1 = 0;
			//hold_my   = 0;
			
			hold_sp   = 0;
			hold_ti   = 0;
			hold_dr   = 1;
			hold_do   = 1;
			
			totem_alp = 0.5;
			totem_adi = 1;
			
			totem_pr = 0;
			totem_re = 0;
			
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
	
	var top, top;
	top = ((sprite_get_height(s_heroes_back) * global.back_scale - global.size) / 2) * (sprite_get_width(s_heroes_back) / 1280); //sprite_get_height(s_training_back) * ((sprite_get_height(s_training_back) / sprite_get_width(s_training_back)) - (global.size / 1280)) / 2;
	draw_sprite_part_ext(s_heroes_back, 1, 0, top, sprite_get_width(s_heroes_back), sprite_get_height(s_heroes_back) - top, 0 + prx, training_back_y + pry, global.back_scale, global.back_scale, c_white, 1);
	///////
	#region Листовки
		for(i=1;i<=7;i++)
			{
			if global.heroes_have[i] < 178 + 110 + 68 + 42 + 26 + 16 + 10 + 6 + 4 + 2
				{ hero_lvl[i] = 10; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6 - 10 - 16 - 26 - 42 - 68 - 110; hero_need[i] = 178; }
			if global.heroes_have[i] < 110 + 68 + 42 + 26 + 16 + 10 + 6 + 4 + 2
				{ hero_lvl[i] = 9; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6 - 10 - 16 - 26 - 42 - 68; hero_need[i] = 110; }
			if global.heroes_have[i] < 68 + 42 + 26 + 16 + 10 + 6 + 4 + 2
				{ hero_lvl[i] = 8; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6 - 10 - 16 - 26 - 42; hero_need[i] = 68; }
			
			if global.heroes_have[i] < 42 + 26 + 16 + 10 + 6 + 4 + 2
				{ hero_lvl[i] = 7; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6 - 10 - 16 - 26; hero_need[i] = 42; }
			//hero_need[i] = 42 + 26 + 16 + 10 + 6 + 4 + 2;
			if global.heroes_have[i] < 26 + 16 + 10 + 6 + 4 + 2
				{ hero_lvl[i] = 6; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6 - 10 - 16; hero_need[i] = 26; }
			if global.heroes_have[i] < 16 + 10 + 6 + 4 + 2
				{ hero_lvl[i] = 5; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6 - 10; hero_need[i] = 16; }
			if global.heroes_have[i] < 10 + 6 + 4 + 2
				{ hero_lvl[i] = 4; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6; hero_need[i] = 10; }
			if global.heroes_have[i] < 6 + 4 + 2
				{ hero_lvl[i] = 3; hero_now1[i] = global.heroes_have[i] - 2 - 4; hero_need[i] = 6; }
			if global.heroes_have[i] < 4 + 2
				{ hero_lvl[i] = 2; hero_now1[i] = global.heroes_have[i] - 2; hero_need[i] = 4; }
			if global.heroes_have[i] < 2
				{ hero_lvl[i] = 1; hero_now1[i] = global.heroes_have[i]; hero_need[i] = 2; }
			
			draw_sprite_ext(s_wanted, i, 330 + hero_xx[i] + prx, (160 + 360 + popka) - top + hero_yyy[i] + training_back_y + hero_yy1 + 10 + pry, hero_s * hero_ss[i], hero_s * hero_ss[i], 0, c_black, 0.5); 
			draw_sprite_ext_t(s_wanted, i, 330 + hero_xx[i] + prx, (160 + 360 + popka) - top + hero_yyy[i] + training_back_y + hero_yy1 + pry, hero_s * hero_ss[i], hero_s * hero_ss[i], 0, c_white, 1, c_white, c_black); 	
			if global.heroes_have[i] = 0
				{ draw_sprite_ext(s_wanted, i, 330 + hero_xx[i] + prx, (160 + 360 + popka) - top + hero_yyy[i] + training_back_y + hero_yy1 + pry, hero_s * hero_ss[i], hero_s * hero_ss[i], 0, c_black, 0.5); }
			
			draw_set_alpha(0.5);
			draw_rectangle_color(330 + hero_xx[i] - hero_w * hero_s * 1.1 + prx, (160 + 360 + popka) - top + hero_yyy[i] + training_back_y + hero_yy1 + hero_h * 1.1 * hero_s - 15 + pry, 330 + hero_xx[i] + hero_w * hero_s * 1.1 + prx, (160 + 360 + popka) - top + hero_yyy[i] + training_back_y + hero_yy1 + hero_h * 1.1 * hero_s + 15 + pry, c_black, c_black, c_black, c_black, 0);
			draw_set_alpha(1);
			
			draw_rectangle_color(330 + hero_xx[i] - hero_w * hero_s * 1.1 + prx, (160 + 360 + popka) - top + hero_yyy[i] + training_back_y + hero_yy1 + hero_h * 1.1 * hero_s - 15 + pry, 330 + hero_xx[i] - hero_w * hero_s * 1.1 + (2 * hero_w * hero_s * 1.1) * (hero_now1[i] / hero_need[i])+ prx, (160 + 360 + popka) - top + hero_yyy[i] + training_back_y + hero_yy1 + hero_h * 1.1 * hero_s + 15 + pry, global.color_hero[i], global.color_hero[i], global.color_hero[i], global.color_hero[i], 0);
			
			draw_sprite_ext_t(s_themes_ss, i, 330 + hero_xx[i] - hero_w * hero_s * 1.1 + prx + 20, (160 + 360 + popka) - top + hero_yyy[i] + training_back_y + hero_yy1 - hero_h * hero_s * 1.1 + pry + 20, 0.3, 0.3, 0, global.color_hero[i], 1, global.color_hero[i], c_black);
			draw_text_transformed_t(330 + hero_xx[i] - hero_w * hero_s * 1.1 + prx + 20, (160 + 360 + popka) - top + hero_yyy[i] + training_back_y + hero_yy1 - hero_h * hero_s * 1.1 + pry + 20, string(hero_lvl[i]) + "", 0.18, 0.18, 0, global.color_white, c_black);
			
			draw_text_transformed_t(330 + hero_xx[i] + prx, (160 + 360 + popka) - top + hero_yyy[i] + training_back_y + hero_yy1 + hero_h * 1.1 * hero_s + pry, "(" + string(hero_now1[i]) + "~" + string(hero_need[i]) + ")", 0.1, 0.1, 0, global.color_white, c_black);
			}
		draw_sprite_ext(s_wanted, 6, 330 + hero_xx[2] + prx, (160 + 360 + popka) - top + hero_yyy[7] + training_back_y + hero_yy1 + 10 + pry, hero_s * hero_ss[2], hero_s * hero_ss[2], 0, c_black, 0.5);
		if os_get_language() != "ru"
			{ draw_text_transformed_t( 330 + hero_xx[2] + prx, (160 + 360 + popka) - top + hero_yyy[7] + training_back_y + hero_yy1 + 10 + pry, "APPEAR\nSOON", 0.15, 0.15, 10, global.color_white, c_black); }
			else
			{ draw_text_transformed_t( 330 + hero_xx[2] + prx, (160 + 360 + popka) - top + hero_yyy[7] + training_back_y + hero_yy1 + 10 + pry, "УЖЕ\nСКОРО!", 0.15, 0.15, 10, global.color_white, c_black); }
		if mouse_check_button(mb_left)
		&& point_in_rectangle(mouse_x, mouse_y, 0, global.size / 2 - 270, 720, global.size / 2 + 270)
			{
			if hero_yy = 0
				{ hero_yy = hero_yy1 - mouse_y; }
			var totemy;
			totemy = hero_yy1;
			hero_yy1 = hero_yy + mouse_y;
			
			if hero_yy1 > 200
				{ hero_yy1 = 200; }
			if hero_yy1 < -950
				{ hero_yy1 = -950; }
			
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
			if point_in_rectangle(mouse_x, mouse_y, 290 + hero_xx[i] - hero_s * hero_w + 40, 140 + 360 - top + popka + hero_yyy[i] + training_back_y + hero_yy1 + 10 - hero_s * hero_h, 290 + hero_xx[i] + hero_s * hero_w + 40, 140 + 360 - top + popka + hero_yyy[i] + training_back_y + hero_yy1 + 10 + hero_s * hero_h)
				{
				//// КЛАЦ
				if mouse_check_button_pressed(mb_left)
					{
					if global.sound
						{ audio_play_sound(sd_text, 2, 0); }
					}
				//// КЛАЦ
				if mouse_check_button(mb_left) && hero_pr != 0
					{ hero_ss[i] = 1.1; }
				if mouse_check_button_pressed(mb_left) && hero_pr = 0
					{ hero_pr = i; }
				if mouse_check_button_released(mb_left) && hero_re = 0 && hero_yy1 <= 0 && hero_yy1 >= -950
					{
					if global.heroes_have[i] > 0 or global.duel = 0
						{
						if hero_pr = i// && hold_sp = 0// && totem_yy = 0
							{ hero_pr = 0; hero_re = 0; hero_now = i; }
							else
							{ hero_pr = 0; hero_re = 0; }
						}
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
				name = heroes_name[i];
				//name = string_upper(global.hero_code_name[i]);
				//if i = 2
				//	{ name = "DRUNK JOE"; }
				//if i = 5
				//	{ name = "BILL SR."; }
				
				//if os_get_language() = "ru"
				//	{
				//	switch(i)
				//		{
				//		case 1: name = "ВОРИШКА"; break;
				//		case 2: name = "ПЬЯН. ДЖО"; break;
				//		case 3: name = "ОХОТНИЦА"; break;
				//		case 4: name = "ДИЕГО"; break;
				//		case 5: name = "БИЛЛ СТ."; break;
				//		case 6: name = "ШЕРИФ"; break;
				//		case 7: name = "ШАМАН"; break;
				//		}
				//	}
				
				draw_text_transformed_t(1280 - 300, global.size / 2 - 30 + training_back_y + 30, name, 0.2, 0.2, 0, global.color_hero[i], c_black);
				
				if global.duel = 0
					{
					atkk = global.atk[i] * (0.1 * (hero_lvl[i] - 1));
					hpp  = global.hp[i] * (0.1 * (hero_lvl[i] - 1)); // hpp  = global.hp[i] * (0.01 * hero_lvl[i]);
					draw_text_transformed_t(1280 - 300 - 90, global.size / 2 - 30 + training_back_y + 70, hp_text + ": " + string(global.hp[i]), 0.12, 0.12, 0, global.color_white, c_black);
					draw_text_transformed_t(1280 - 300 - 90, global.size / 2 - 30 + training_back_y + 100, "(+"+string(hpp)+")", 0.12, 0.12, 0, global.color_hero[2], c_black);
					
					draw_set_halign(fa_left);
					draw_text_transformed_t(1280 - 300 + 90, global.size / 2 - 30 + training_back_y + 70, atk_text + ": " + string(global.atk[i]), 0.12, 0.12, 0, global.color_white, c_black);
					draw_text_transformed_t(1280 - 300 + 90, global.size / 2 - 30 + training_back_y + 100, "(+"+string(atkk)+")", 0.12, 0.12, 0, global.color_hero[2], c_black);
					draw_set_halign(fa_center);
					
					draw_sprite_ext_t(s_themes_button, 0, 1280 - 300 - 75, global.size / 2 - 30 + training_back_y + 165, 0.3, 0.3, 0, global.color_hero[i], 1, global.color_white, c_black);
					draw_sprite_ext_t(s_themes_ss, i, 1280 - 300 - 75, global.size / 2 - 30 + training_back_y + 165, 0.3, 0.3, 0, global.color_white, 1, global.color_white, c_black);
					draw_sprite_ext_t(s_themes_button, 0, 1280 - 300 + 75, global.size / 2 - 30 + training_back_y + 165, 0.3, 0.3, 0, global.color_hero[i], 1, global.color_hero[i], c_black);
					draw_sprite_ext_t(s_super, i + 1, 1280 - 300 + 75, global.size / 2 - 30 + training_back_y + 165, 0.45, 0.45, 0, global.color_white, 1, global.color_white, c_black);
					
					theme  = heroes_theme[i];
					supert = heroes_abil[i];
					//if os_get_language() != "ru"
					//	{
					//	theme = string_upper(global.hero_code_theme[i]);
					//	if i = 4
					//		{ theme = "ATTENTION"; }
					//	switch(i)
					//		{
					//		case 1: supert = "THEFT"; break;
					//		case 2: supert = "STUN"; break;
					//		case 3: supert = "POISON"; break;
					//		case 4: supert = "BOOM"; break;
					//		case 5: supert = "HAZE"; break;
					//		case 6: supert = "CRITICAL"; break;
					//		case 7: supert = "IDOLS"; break;
					//		}
					//	}
					//	else
					//	{
					//	switch(i)
					//		{
					//		case 1: theme = "КАРТЫ"; break;
					//		case 2: theme = "БУТЫЛКИ"; break;
					//		case 3: theme = "ДВИЖЕНИЕ"; break;
					//		case 4: theme = "ВНИМАНИЕ"; break;
					//		case 5: theme = "СТРЕЛЬБА"; break;
					//		case 6: theme = "МАТЕМ."; break;
					//		case 7: theme = "ШТОРМ"; break;
					//		}
					//	switch(i)
					//		{
					//		case 1: supert = "ВОР"; break;
					//		case 2: supert = "СТАН"; break;
					//		case 3: supert = "ЯД"; break;
					//		case 4: supert = "БУУМ"; break;
					//		case 5: supert = "ДЫМКА"; break;
					//		case 6: supert = "КРИТ"; break;
					//		case 7: supert = "ИДОЛЫ"; break;
					//		}
					//	}
					draw_text_transformed_t(1280 - 300 - 75, global.size / 2 - 30 + training_back_y + 165 + 50, theme, 0.12, 0.12, 0, global.color_white, c_black);
					draw_text_transformed_t(1280 - 300 + 75, global.size / 2 - 30 + training_back_y + 165 + 50, supert, 0.12, 0.12, 0, global.color_white, c_black);
					}
					else
					{
					atkk = global.atk[i] * (0.1 * (hero_lvl[i] - 1));
					hpp  = global.hp[i] * (0.1 * (hero_lvl[i] - 1)); // hpp  = global.hp[i] * (0.01 * hero_lvl[i]);
					draw_text_transformed_t(1280 - 300 - 90 + 10, global.size / 2 - 30 + training_back_y + 70, hp_text + ": " + string(global.hp[i]), 0.12, 0.12, 0, global.color_white, c_black);
					draw_text_transformed_t(1280 - 300 - 90, global.size / 2 - 30 + training_back_y + 100, "(+"+string(hpp)+")", 0.12, 0.12, 0, global.color_hero[2], c_black);
					
					draw_set_halign(fa_left);
					draw_text_transformed_t(1280 - 300 + 90, global.size / 2 - 30 + training_back_y + 70, atk_text + ": " + string(global.atk[i]), 0.12, 0.12, 0, global.color_white, c_black);
					draw_text_transformed_t(1280 - 300 + 90, global.size / 2 - 30 + training_back_y + 100, "(+"+string(atkk)+")", 0.12, 0.12, 0, global.color_hero[2], c_black);
					draw_set_halign(fa_center);
					
					var himher, go5;
					if i = 1 or i = 3
						{ himher = her_text; }
						else
						{ himher = him_text; }
					//if os_get_language() != "ru"
					//	{
					//	if i = 1 or i = 3
					//		{ himher = "HER"; }
					//		else
					//		{ himher = "HIM"; }
					//	}
					//	else
					//	{
					//	if i = 1 or i = 3
					//		{ himher = "ЕЁ"; }
					//		else
					//		{ himher = "ЕГО"; }
					//	}
					go5 = 1;
					//draw_rectangle(1280 - 300 - 100, global.size / 2 - 30 + training_back_y + 230 - 70, 1280 - 300 + 100, global.size / 2 - 30 + training_back_y + 230 + 70, 1);
					if point_in_rectangle(mouse_x, mouse_y, 1280 - 300 - 150, global.size / 2 - 30 + training_back_y + 150 - 70 + 36, 1280 - 300 + 150, global.size / 2 - 30 + training_back_y + 150 + 70 + 36)
						{
						//// КЛАЦ
						if mouse_check_button_pressed(mb_left)
							{
							if global.sound
								{ audio_play_sound(sd_text, 2, 0); }
							}
						//// КЛАЦ
						if mouse_check_button(mb_left)
							{ go5 = 1.1; }
						if mouse_check_button_released(mb_left) && global.heroes_have[i] > 0
							{
							GoogleAnalytics_SendEvent("HEROES","Игрок выбрал персонажа " + string(1));
							if global.pvp_now != 2
								{ global.hero = i; }
								else
								{ global.enemy_hero = i; }
							global.duel = 1;
							global.p_totem[1] = -1;
							global.p_totem[2] = -1;
							global.p_totem[3] = -1;
							global.menu_now = "totem"; global.menu_next = "totem";
							io_clear();
							}
						}
					draw_sprite_ext(s_light, 0, 1280 - 300, global.size / 2 - 30 + training_back_y + 130 + 20 + 36, 0.65, 0.4, 0, c_white, 0.7);
					if os_get_language() = "ru"
						{ draw_text_transformed_t(1280 - 300, global.size / 2 - 30 + training_back_y + 130 + 20 + 36, choose_text + "\n" + himher, 0.3 * go5, 0.3 * go5, tr_ang, global.color_white, c_black); }
						else
						{ draw_text_transformed_t(1280 - 300, global.size / 2 - 30 + training_back_y + 130 + 20 + 36, choose_text + "\n" + himher, 0.3 * go5, 0.3 * go5, tr_ang, global.color_white, c_black); }
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
	draw_sprite_ext(s_heroes_back, 2, 640, global.size + training_back_y + yh + 40 * (960 / global.size) + 10, global.back_scale, global.back_scale, 0, c_black, 0.5);
	draw_sprite_ext_t(s_heroes_back, 2, 640, global.size + training_back_y + yh + 40 * (960 / global.size), global.back_scale, global.back_scale, 0, c_white, 1, c_white, c_black);
	
	draw_sprite_ext(s_heroes_back, 4, 640, global.size + training_back_y + yh + 40 * (960 / global.size) + 10, global.back_scale, global.back_scale, 0, c_black, 0.5);
	draw_sprite_ext_t(s_heroes_back, 4, 640, global.size + training_back_y + yh + 40 * (960 / global.size), global.back_scale, global.back_scale, 0, c_white, 1, c_white, c_black);
	
	var text_hero;
	text_hero = "";
	if global.pvp_now = 0
		{ text_hero = ""; }
	
	//if os_get_language() = "ru"
	//	{
	//	if global.duel = 0
	//		{
	//		if global.size  >= 700
	//			{
	//			draw_set_font(global.game_font);
	//			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300, "ГЕРОИ", 0.22, 0.22, 0, col, c_black);
	//			}
	//			else
	//			{
	//			draw_set_font(global.game_font);
	//			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300 + 40, "ГЕРОИ", 0.22, 0.22, 0, col, c_black);
	//			}
	//			//draw_text_transformed_t(80, global.size / 2 + training_back_y - 40, "H\nE\nR\nO\nE\nS", 0.22, 0.22, 0, col, c_black);
	//		}
	//		else
	//		{
	//		if global.size  >= 700
	//			{
	//			draw_set_font(global.game_font);
	//			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300, "ВЫБЕРИ ГЕРОЯ" + player_num, 0.22, 0.22, 0, col, c_black);
	//			}
	//			else
	//			{
	//			draw_set_font(global.game_font);
	//			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300 + 40, "ВЫБЕРИ ГЕРОЯ" + player_num, 0.22, 0.22, 0, col, c_black);
	//			}
	//		}
	//	}
	//	else
	//	{
	//	if global.duel = 0
	//		{
	//		if global.size  >= 700
	//			{
	//			draw_set_font(global.game_font);
	//			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300, "HEROES", 0.22, 0.22, 0, col, c_black);
	//			}
	//			else
	//			{
	//			draw_set_font(global.game_font);
	//			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300 + 40, "HEROES", 0.22, 0.22, 0, col, c_black);
	//			}
	//			//draw_text_transformed_t(80, global.size / 2 + training_back_y - 40, "H\nE\nR\nO\nE\nS", 0.22, 0.22, 0, col, c_black);
	//		}
	//		else
	//		{
	//		if global.size  >= 700
	//			{
	//			draw_set_font(global.game_font);
	//			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300, "CHOOSE A HERO" + player_num, 0.22, 0.22, 0, col, c_black);
	//			}
	//			else
	//			{
	//			draw_set_font(global.game_font);
	//			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300 + 40, "CHOOSE A HERO" + player_num, 0.22, 0.22, 0, col, c_black);
	//			}
	//		}
	//	}
	if global.duel = 0
		{
		if global.size  >= 700
			{
			draw_set_font(global.game_font);
			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300, heroes_text[1], 0.22, 0.22, 0, col, c_black);
			}
			else
			{
			draw_set_font(global.game_font);
			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300 + 40, heroes_text[1], 0.22, 0.22, 0, col, c_black);
			}
			//draw_text_transformed_t(80, global.size / 2 + training_back_y - 40, "H\nE\nR\nO\nE\nS", 0.22, 0.22, 0, col, c_black);
		}
		else
		{
		if global.size  >= 700
			{
			draw_set_font(global.game_font);
			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300, heroes_text[2] + player_num, 0.22, 0.22, 0, col, c_black);
			}
			else
			{
			draw_set_font(global.game_font);
			draw_text_transformed_t(450, global.size / 2 + training_back_y - 300 + 40, heroes_text[2] + player_num, 0.22, 0.22, 0, col, c_black);
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
	
	
	draw_sprite_ext(s_heroes_back, 3, 640 + 140 + 6, global.size - 150 + top - training_back_y + pry * 0.5 - sc_angle * 2 - 50 + 20, global.back_scale * 0.8, global.back_scale * 0.8, 0, c_black, 0.5);
	draw_sprite_ext_t(s_heroes_back, 3, 640 + prx + 140, global.size - 150 + top - training_back_y + pry * 0.5 - sc_angle * 2 - 50, global.back_scale * 0.8, global.back_scale * 0.8, 0, c_white, 1, c_white, c_black);
	
	if point_in_rectangle(mouse_x, mouse_y, 1160, 0, 1280, 380)
		{
		//// КЛАЦ
		if mouse_check_button_pressed(mb_left)
			{
			if global.sound
				{ audio_play_sound(sd_text, 2, 0); }
			}
		//// КЛАЦ
		if mouse_check_button_pressed(mb_left)
			{
			sc_spd  = 2;
			sc_dist = 10;
			}
		}
	if point_in_rectangle(mouse_x, mouse_y, 0, 0, 100, 100)
		{
		//// КЛАЦ
		if mouse_check_button_pressed(mb_left)
			{
			if global.sound
				{ audio_play_sound(sd_text, 2, 0); }
			}
		//// КЛАЦ
		if mouse_check_button_pressed(mb_left)
			{
			hold_sp   = 0;
			hold_ti   = 0;
			hold_dr   = 1;
			hold_do   = 1;
			if global.duel != 1
				{
				hero_yy  = 0;
				hero_yy1 = 0;
				//hold_my   = 0;
				
				hold_sp   = 0;
				hold_ti   = 0;
				hold_dr   = 1;
				hold_do   = 1;
				
				hero_pr = 0;
				hero_re = 0;
				
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
#region Тренировка / Ранкед /  На Двоих
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
				if global.duel = 1
					{
					if global.sound
						{ audio_play_sound(sd_ranked, 3, 0); }
					}
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
	
	#region Ранги
		var star_now, star_need, shield_i, skul_i, go5, skul_i_pvp;
		shield_i = 0;
		skul_i   = 15;
		star_now = global.rank_stars; star_need = 2; shield_i = 0; skul_i = 15; 
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
			{ star_now = global.rank_stars; star_need = 2; shield_i = 0; skul_i = 15; }
		
		skul_i_pvp = skul_i;
		if global.pvp = 1
			{ skul_i = pvp_rank_i; }
	#endregion
	if global.duel = 0
		{
		#region Обучение
			if global.tr[2] = 0 && !instance_exists(o_transf)// && 0
				{
				global.training = theme_t[1,1];
				global.hero = theme_t[1,1];
			
				room_goto_t("duel");
				}
		#endregion
		
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
							if global.sound
								{ audio_play_sound(sd_text, 2, 0); }
							theme_s[i,j] = 1.1;
							}
							else
							{ theme_s[i,j] = 1; }
						if mouse_check_button_released(mb_left)// or (global.tr[2] = 0 && !instance_exists(o_transf))
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
						if theme_s[i,j] < 1.5 - (0.15 * (theme_ot[i,j] == 1))
							{ theme_s[i,j] += 0.05 + (0.15 * (theme_ot[i,j] == 2)); }
							else
							{
							theme_s[i,j] += 0.01;
							if theme_ss[i,j] > 0.1
								{ theme_ss[i,j] -= 0.1 + (0.15 * (theme_ot[i,j] == 2)); }
								else
								{ theme_ss[i,j] = 0.1; theme_stage[i,j] = 2; }
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
							{ theme_ss[i,j] += 0.1 + (0.15 * (theme_ot[i,j] == 2)); }
							else
							{
							if theme_a[i,j] > 0 && theme_ot[i,j] = 1
								{ theme_a[i,j] -= 1; }
								else
								{
								if theme_s[i,j] > 1
									{ theme_s[i,j] -= 0.05 + (0.05 * (theme_ot[i,j] == 2)); }
									else
									{
									//// КЛАЦ
									if mouse_check_button_pressed(mb_left)
										{
										if global.sound
											{ audio_play_sound(sd_text, 2, 0); }
										}
									//// КЛАЦ
									theme_stage[i,j] = 0;
									theme_ss[i,j] = 1; 
									tr_yes = 1;
									}
								}
							}
						}
				#endregion
				draw_sprite_ext(s_themes_button, 0, theme_x[i,j] + prx, theme_y[i,j] + training_back_y + pry, theme_sc * 1.1, theme_sc * 1.1, 0, c_black, 0.35);
				if theme_op[i,j] = 1 && theme_ot[i,j] = 2
					{ draw_sprite_ext(s_light, 0, theme_x[i,j] + prx, theme_y[i,j] + training_back_y + pry, 0.26, 0.26, 0, c_white, 0.55); }
				draw_sprite_ext_t(s_themes_button, 0, theme_x[i,j] + prx, theme_y[i,j] + training_back_y + pry, theme_s[i,j] * theme_sc * theme_ss[i,j], theme_s[i,j] * theme_sc, 0, global.color_hero[theme_t[i,j]], 1, c_white, c_black);
				draw_sprite_ext_t(s_themes_ss, theme_t[i,j], theme_x[i,j] + prx, theme_y[i,j] + training_back_y + pry, theme_s[i,j] * theme_sc * theme_ss[i,j], theme_s[i,j] * theme_sc, 0, global.color_white, 1, global.color_white, c_black);
				if theme_op[i,j] = 1 && theme_ot[i,j] = 1
					{
					if hand_i < 10
						{ hand_i += 0.4; }
						else
						{ hand_i = 0; }
					draw_sprite_ext(s_training_hand, hand_i, theme_x[i,j]- 5, theme_y[i,j] + training_back_y + pry + 15, 1, 1, 0, c_black, 0.5);
					draw_sprite_ext_t(s_training_hand, hand_i, theme_x[i,j] + prx, theme_y[i,j] + training_back_y + pry, 1, 1, 0, global.color_white, 1, global.color_white, c_black);
					}
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
		if global.pvp_set = 1
			{ skul_i = pvp_rank_i; }
		if skul_i = 0
			{ shield_i = 3; }
		if skul_i >= 1 && skul_i <= 5
			{ shield_i = 2; }
		if skul_i >= 6 && skul_i <= 10
			{ shield_i = 1; }
		if skul_i > 10
			{ shield_i = 0; }
		//global.rank_stars = 0;
		//var star_now, star_need, shield_i, skul_i, go5, skul_i_pvp;
		//shield_i = 0;
		//skul_i   = 15;
		//star_now = global.rank_stars; star_need = 2; shield_i = 0; skul_i = 15; 
		//if global.rank_stars < 70
		//	{ star_now = global.rank_stars - 69; star_need = -1; shield_i = 3; skul_i = 0;}
		//if global.rank_stars < 69
		//	{ star_now = global.rank_stars - 63; star_need = 6; shield_i = 2; skul_i = 1;}
		//if global.rank_stars < 63
		//	{ star_now = global.rank_stars - 57; star_need = 6; shield_i = 2; skul_i = 2;}
		//if global.rank_stars < 57
		//	{ star_now = global.rank_stars - 51; star_need = 6; shield_i = 2; skul_i = 3;}
		//if global.rank_stars < 51
		//	{ star_now = global.rank_stars - 46; star_need = 5; shield_i = 2; skul_i = 4;}
		//if global.rank_stars < 46
		//	{ star_now = global.rank_stars - 41; star_need = 5; shield_i = 2; skul_i = 5;}
		//if global.rank_stars < 41
		//	{ star_now = global.rank_stars - 36; star_need = 5; shield_i = 1; skul_i = 6;}
		//if global.rank_stars < 36
		//	{ star_now = global.rank_stars - 31; star_need = 5; shield_i = 1; skul_i = 7;}
		//if global.rank_stars < 31
		//	{ star_now = global.rank_stars - 26; star_need = 5; shield_i = 1; skul_i = 8;}
		//if global.rank_stars < 26
		//	{ star_now = global.rank_stars - 21; star_need = 5; shield_i = 1; skul_i = 9;}
		//if global.rank_stars < 21
		//	{ star_now = global.rank_stars - 16; star_need = 5; shield_i = 1; skul_i = 10;}
		//if global.rank_stars < 16
		//	{ star_now = global.rank_stars - 12; star_need = 4; shield_i = 0; skul_i = 11;}
		//if global.rank_stars < 12
		//	{ star_now = global.rank_stars - 8; star_need = 4; shield_i = 0; skul_i = 12;}
		//if global.rank_stars < 8
		//	{ star_now = global.rank_stars - 5; star_need = 3; shield_i = 0; skul_i = 13;}
		//if global.rank_stars < 5
		//	{ star_now = global.rank_stars - 2; star_need = 3; shield_i = 0; skul_i = 14;}
		//if global.rank_stars < 2
		//	{ star_now = global.rank_stars; star_need = 2; shield_i = 0; skul_i = 15; }
		
		if global.training_o = 1 or global.pvp_set != 0
			{
			if anim_skul < 3
				{ anim_skul += 0.5; }
				else
				{ anim_skul = 0; }
			draw_sprite_ext(s_rank_shield, 0, 640, global.size / 2 + pry - 50 + 15 + training_back_y, 1, 1, 0, c_black, 0.5);
			draw_sprite_ext(s_rank_shield, shield_i, 640 + prx, global.size / 2 + pry - 50 + training_back_y, 1, 1, 0, c_white, 1);
			if skul_i <= 3
				{ draw_sprite_ext_t(s_rank_skul_1, anim_skul, 640, global.size / 2 + pry - 50 + 15 + training_back_y, 1, 1, 0, c_white, 1, c_white, c_black); }
			draw_sprite_ext(s_rank_skul, skul_i, 640, global.size / 2 + pry - 50 + 15 + training_back_y, 1, 1, 0, c_black, 0.5);
			draw_sprite_ext(s_rank_skul, skul_i, 640 + prx, global.size / 2 + pry - 50 + training_back_y, 1, 1, 0, c_white, 1);	
			
			//if os_get_language() != "ru"
			//	{
			//	if skul_i = 0
			//		{
			//		draw_text_transformed_t(640, global.size / 2 + pry - 50 + 15 + training_back_y - 60, "LEGEND", 0.2, 0.2, 0, global.color_white, c_black);
			//		draw_text_transformed_t(640, global.size / 2 + pry - 50 + 15 + training_back_y - 60 + 25 + string_height(global.legend_rank) * 0.2 / 2, string(global.legend_rank), 0.2, 0.2, 0, global.color_white, c_black);
			//		}
			//	}
			//	else
			//	{
			//	if skul_i = 0
			//		{
			//		draw_text_transformed_t(640, global.size / 2 + pry - 50 + 15 + training_back_y - 60, "ЛЕГЕНДА", 0.2, 0.2, 0, global.color_white, c_black);
			//		draw_text_transformed_t(640, global.size / 2 + pry - 50 + 15 + training_back_y - 60 + 25 + string_height(global.legend_rank) * 0.2 / 2, string(global.legend_rank), 0.2, 0.2, 0, global.color_white, c_black);
			//		}
			//	}
			if skul_i = 0
				{
				draw_text_transformed_t(640, global.size / 2 + pry - 50 + 15 + training_back_y - 60, training_text[1], 0.2, 0.2, 0, global.color_white, c_black);
				draw_text_transformed_t(640, global.size / 2 + pry - 50 + 15 + training_back_y - 60 + 25 + string_height(global.legend_rank) * 0.2 / 2, string(global.legend_rank), 0.2, 0.2, 0, global.color_white, c_black);
				}
			if global.pvp_set = 0
				{
				if star_need = 2
					{
					draw_sprite_ext_t(s_rank_star, 0, 640 + prx - 30, global.size / 2 + pry + 35 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
					draw_sprite_ext_t(s_rank_star, 0, 640 + prx + 30, global.size / 2 + pry + 35 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
					
					if star_now > 0
						{ draw_sprite_ext_t(s_rank_star, 0, 640 + prx - 30, global.size / 2 + pry + 35 + training_back_y, 0.3, 0.3, 0, global.color_white, 1, global.color_white, c_black); }
					}
				if star_need = 3
					{
					draw_sprite_ext_t(s_rank_star, 0, 640 + prx - 70, global.size / 2 + pry + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
					draw_sprite_ext_t(s_rank_star, 0, 640 + prx, global.size / 2 + pry + 70 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
					draw_sprite_ext_t(s_rank_star, 0, 640 + prx + 70, global.size / 2 + pry + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
					
					if star_now > 0
						{ draw_sprite_ext_t(s_rank_star, 0, 640 + prx - 70, global.size / 2 + pry + training_back_y, 0.3, 0.3, 0, global.color_white, 1, global.color_white, c_black); }
					if star_now > 1
						{ draw_sprite_ext_t(s_rank_star, 0, 640 + prx, global.size / 2 + pry + 70 + training_back_y, 0.3, 0.3, 0, global.color_white, 1, global.color_white, c_black); }
					}
				if star_need = 4
					{
					draw_sprite_ext_t(s_rank_star, 0, 640 + prx - 110, global.size / 2 + pry - 40 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
					draw_sprite_ext_t(s_rank_star, 0, 640 + prx - 50, global.size / 2 + pry + 20 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
					draw_sprite_ext_t(s_rank_star, 0, 640 + prx + 50, global.size / 2 + pry + 20 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
					draw_sprite_ext_t(s_rank_star, 0, 640 + prx + 110, global.size / 2 + pry - 40 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
					
					if star_now > 0
						{ draw_sprite_ext_t(s_rank_star, 0, 640 + prx - 110, global.size / 2 + pry - 40 + training_back_y, 0.3, 0.3, 0, global.color_white, 1, global.color_white, c_black); }
					if star_now > 1
						{ draw_sprite_ext_t(s_rank_star, 0, 640 + prx - 50, global.size / 2 + pry + 20 + training_back_y, 0.3, 0.3, 0, global.color_white, 1, global.color_white, c_black); }
					if star_now > 2
						{ draw_sprite_ext_t(s_rank_star, 0, 640 + prx + 50, global.size / 2 + pry + 20 + training_back_y, 0.3, 0.3, 0, global.color_white, 1, global.color_white, c_black); }
					}
				if star_need = 5
					{
					draw_sprite_ext_t(s_rank_star, 0, 640 + prx - 100, global.size / 2 + pry - 45 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
					draw_sprite_ext_t(s_rank_star, 0, 640 + prx - 60, global.size / 2 + pry + 15+ training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
					draw_sprite_ext_t(s_rank_star, 0, 640 + prx, global.size / 2 + pry + pry + 60 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
					draw_sprite_ext_t(s_rank_star, 0, 640 + prx + 60, global.size / 2 + pry + 15 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
					draw_sprite_ext_t(s_rank_star, 0, 640 + prx + 100, global.size / 2 + pry - 45 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
					
					if star_now > 0
						{ draw_sprite_ext_t(s_rank_star, 0, 640 + prx - 100, global.size / 2 + pry - 45 + training_back_y, 0.3, 0.3, 0, global.color_white, 1, global.color_white, c_black); }
					if star_now > 1
						{ draw_sprite_ext_t(s_rank_star, 0, 640 + prx - 60, global.size / 2 + pry + 15 + training_back_y, 0.3, 0.3, 0, global.color_white, 1, global.color_white, c_black); }
					if star_now > 2
						{ draw_sprite_ext_t(s_rank_star, 0, 640 + prx, global.size / 2 + pry + 60 + training_back_y, 0.3, 0.3, 0, global.color_white, 1, global.color_white, c_black); }
					if star_now > 3
						{ draw_sprite_ext_t(s_rank_star, 0, 640 + prx + 60, global.size / 2 + pry + 15 + training_back_y, 0.3, 0.3, 0, global.color_white, 1, global.color_white, c_black); }
					}
				if star_need = 6
					{
					draw_sprite_ext_t(s_rank_star, 0, 640 + prx - 120, global.size / 2 + pry - 30 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
					draw_sprite_ext_t(s_rank_star, 0, 640 + prx - 80, global.size / 2 + pry + 20 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
					draw_sprite_ext_t(s_rank_star, 0, 640 + prx - 40, global.size / 2 + pry + 60 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
					draw_sprite_ext_t(s_rank_star, 0, 640 + prx + 40, global.size / 2 + pry + 60 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
					draw_sprite_ext_t(s_rank_star, 0, 640 + prx + 80, global.size / 2 + pry + 20 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
					draw_sprite_ext_t(s_rank_star, 0, 640 + prx + 120, global.size / 2 + pry - 30 + training_back_y, 0.3, 0.3, 0, c_black, 0.5, global.color_white, c_black);
					
					if star_now > 0
						{ draw_sprite_ext_t(s_rank_star, 0, 640 + prx - 120, global.size / 2 + pry - 30 + training_back_y, 0.3, 0.3, 0, global.color_white, 1, global.color_white, c_black); }
					if star_now > 1
						{ draw_sprite_ext_t(s_rank_star, 0, 640 + prx - 80, global.size / 2 + pry + 20 + training_back_y, 0.3, 0.3, 0, global.color_white, 1, global.color_white, c_black); }
					if star_now > 2
						{ draw_sprite_ext_t(s_rank_star, 0, 640 + prx - 40, global.size / 2 + pry + 60 + training_back_y, 0.3, 0.3, 0, global.color_white, 1, global.color_white, c_black); }
					if star_now > 3
						{ draw_sprite_ext_t(s_rank_star, 0, 640 + prx + 40, global.size / 2 + pry + 60 + training_back_y, 0.3, 0.3, 0, global.color_white, 1, global.color_white, c_black); }
					if star_now > 4
						{ draw_sprite_ext_t(s_rank_star, 0, 640 + prx + 80, global.size / 2 + pry + 20 + training_back_y, 0.3, 0.3, 0, global.color_white, 1, global.color_white, c_black); }
					}
				}
			if skul_i != 0
				{ draw_text_transformed_t(640 + prx, global.size / 2 + pry - 150 + training_back_y, string(skul_i), 0.27, 0.27, 5, global.color_white, c_black); }
			}
		
		go5 = 1;
		if global.training_o = 1 or global.pvp_set != 0
			{
			if point_in_rectangle(mouse_x, mouse_y, 640 - 290, global.size / 2 - 60 + 150 + training_back_y, 640 + 290, global.size / 2 + 60 + 150 + training_back_y)
				{
				//// КЛАЦ
				if mouse_check_button_pressed(mb_left)
					{
					if global.sound
						{ audio_play_sound(sd_text, 2, 0); }
					}
				//// КЛАЦ
				if mouse_check_button(mb_left)
					{ go5 = 1.1; }
				if mouse_check_button_released(mb_left)
					{
					global.player_rank = skul_i;
					global.duel = 1;
					if global.pvp_set = 0
						{ global.menu_now = "heroes"; global.menu_next = "heroes"; }
						else
						{
						//global.pvp   = 1;
						//global.quick = 1;
						//room_goto_t("duel");
						
						global.pvp_now = 1;
						global.menu_now = "heroes"; global.menu_next = "heroes";
						}
					}
				}
			//if global.pvp_set = 0
			//	{
			//	if os_get_language() != "ru"
			//		{ draw_text_transformed_t(640, global.size / 2 + 150 + training_back_y, "CHOOSE HERO", 0.27 * go5, 0.27 * go5, 5, global.color_white, c_black); }
			//		else
			//		{ draw_text_transformed_t(640, global.size / 2 + 150 + training_back_y, "ВЫБРАТЬ ГЕРОЯ", 0.27 * go5, 0.27 * go5, 5, global.color_white, c_black); }
			//	}
			//	else
			//	{
			//	if os_get_language() != "ru"
			//		{ draw_text_transformed_t(640, global.size / 2 + 150 + training_back_y, "CHOOSE RANK", 0.27 * go5, 0.27 * go5, 5, global.color_white, c_black); }
			//		else
			//		{ draw_text_transformed_t(640, global.size / 2 + 150 + training_back_y, "ВЫБРАТЬ РАНГ", 0.27 * go5, 0.27 * go5, 5, global.color_white, c_black); }
			//	}
			if global.pvp_set = 0
				{ draw_text_transformed_t(640, global.size / 2 + 150 + training_back_y, training_text[2], 0.27 * go5, 0.27 * go5, 5, global.color_white, c_black); }
				else
				{ draw_text_transformed_t(640, global.size / 2 + 150 + training_back_y, training_text[3], 0.27 * go5, 0.27 * go5, 5, global.color_white, c_black); }
			//ИГРА
			}
		//global.g_rank_now = 0;
		//global.g_stars_need = 0;
		//global.g_stars_now = 0;
		}
	
	if global.training_o != 1 && global.duel = 1 && global.pvp_set = 0
		{
		draw_set_alpha(0.45);
		draw_rectangle_color(0, training_back_y, 1280, global.size + training_back_y, c_black, c_black, c_black, c_black, 0);
		draw_set_alpha(1);
		
		//if os_get_language() = "ru"
		//	{ draw_text_ext_transformed_t(640 + prx, global.size / 2 + training_back_y + pry, "ВЫ ЕЩЁ НЕ ЗАКОНЧИЛИ ОБУЧЕНИЕ!", -1, 1600, 0.27 * go5, 0.27 * go5, -25, global.color_white, c_black); }
		//	else
		//	{ draw_text_ext_transformed_t(640 + prx, global.size / 2 + training_back_y + pry, "YOU HAVE NOT FINISHED TUTORIAL YET!", -1, 1600, 0.27 * go5, 0.27 * go5, -25, global.color_white, c_black); }
		draw_text_ext_transformed_t(640 + prx, global.size / 2 + training_back_y + pry, training_text[4], -1, 1600, 0.27 * go5, 0.27 * go5, -25, global.color_white, c_black);
		}
	draw_sprite_part_ext(s_training_back, 0, 0, top, sprite_get_width(s_training_back), sprite_get_height(s_training_back) - top, 0, training_back_y, global.back_scale, global.back_scale, c_white, 1);
	var yh, col;
	yh = 0;
	col = make_color_rgb(242, 232, 201);
	if global.size < 700
		{ yh = 30; }
	draw_sprite_ext(s_training_back, 2, 640 + 10, global.size + training_back_y + yh + 5, global.back_scale, global.back_scale, 0,  c_black, 0.5);
	draw_sprite_ext_t(s_training_back, 2, 640, global.size + training_back_y + yh, global.back_scale, global.back_scale, 0, c_white, 1, c_white, c_black);
	
	draw_sprite_ext(s_training_back, 4, 640 + 10, global.size + training_back_y + yh + 5, global.back_scale, global.back_scale, 0,  c_black, 0.5);
	draw_sprite_ext_t(s_training_back, 4, 640, global.size + training_back_y + yh, global.back_scale, global.back_scale, 0, c_white, 1, c_white, c_black);
	
	draw_set_font(global.game_font);
	
	if global.pvp_set = 0
		{
		//if os_get_language() != "ru"
		//	{
		//	if global.duel = 0
		//		{ draw_text_transformed_t(150, global.size / 2 + training_back_y, "T\nU\nT\nO\nR\nI\nA\nL", 0.22, 0.22, 0, col, c_black); }
		//		else
		//		{ draw_text_transformed_t(150, global.size / 2 + training_back_y, "®\nR\nA\nN\nK\nE\nD\n®\n ", 0.2, 0.2, 0, col, c_black); }
		//	}
		//	else
		//	{
		//	if global.duel = 0
		//		{ draw_text_transformed_t(150, global.size / 2 + training_back_y, "О\nБ\nУ\nЧ\nЕ\nН\nИ\nЕ", 0.22, 0.22, 0, col, c_black); }
		//		else
		//		{ draw_text_transformed_t(150, global.size / 2 + training_back_y, "®\nР\nА\nН\nК\nE\nД\n®\n ", 0.2, 0.2, 0, col, c_black); }
		//	}
		if global.duel = 0
			{
			//draw_text_transformed_t(150, global.size / 2 + training_back_y, "∂\n" + training_text[5] + "\n∂", 0.22, 0.22, 0, col, c_black);
			draw_text_ext_transformed_t(150, global.size / 2 + training_back_y, "∂\n" + training_text[5] + "\n∂", -1, 300, 0.22, 0.22, 0, col, c_black);
			}
			else
			{ draw_text_ext_transformed_t(150, global.size / 2 + training_back_y, "®\n" + training_text[6] + "\n®", -1, 250, 0.2, 0.2, 0, col, c_black); }
		}
		else
		{
		var l_sc, r_sc;
		l_sc = 1;
		r_sc = 1;
		
		if point_in_rectangle(mouse_x, mouse_y, 640 - 330, global.size / 2 + training_back_y - 250, 640 + 330, global.size / 2 + training_back_y + 100)
			{
			if mouse_check_button(mb_left)
				{
				if mouse_x < 640
					{ l_sc = 1.2; }
					else
					{ r_sc = 1.2; }
				if pvp_pep > 0
					{ pvp_pep -= 1; }
				}
			if mouse_check_button_pressed(mb_left) or pvp_pep = 0
				{
				if mouse_x < 640
					{ pvp_rank_i += 1; l_sc = 1; }
					else
					{ pvp_rank_i -= 1; r_sc = 1; }
				if pvp_rank_i > 15
					{ pvp_rank_i = 15; }
				if pvp_rank_i < skul_i_pvp
					{ pvp_rank_i = skul_i_pvp; }
				pvp_pep = 10;
				}
			}
		//draw_rectangle(640 - 300, global.size / 2 + training_back_y - 250, 640 + 300, global.size / 2 + training_back_y + 150, 1);
		
		//if os_get_language() != "ru"
		//	{
		//	if global.duel != 0
		//		{ draw_text_transformed_t(150, global.size / 2 + training_back_y, "œ\nV\nS\n \nF\nR\nI\nE\nN\nD\nœ", 0.2, 0.2, 0, col, c_black); }
		//	}
		//	else
		//	{
		//	if global.duel != 0
		//		{ draw_text_transformed_t(150, global.size / 2 + training_back_y, "œ\nС\n \nД\nР\nУ\nГ\nО\nМ\nœ", 0.2, 0.2, 0, col, c_black); }
		//	}
		
		if global.duel != 0
			{ draw_text_ext_transformed_t(150, global.size / 2 + training_back_y, "œ\n" + training_text[7] + "\nœ", -1, 250, 0.2, 0.2, 0, col, c_black); }
		
		if pvp_rank_i < 15
			{ draw_text_transformed_t(640 - 200 - 10 * (l_sc - 1), global.size / 2 + training_back_y - 30, "<", 0.65 * l_sc, 0.65 * l_sc, 0, global.color_white, c_black); }
		if pvp_rank_i > skul_i_pvp
			{ draw_text_transformed_t(640 + 200 + 10 * (r_sc - 1), global.size / 2 + training_back_y - 30, ">", 0.65 * r_sc, 0.65 * r_sc, 0, global.color_white, c_black); }
		}
	
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
	
	draw_sprite_ext(s_training_rope, 0, 1130 + 5, -training_back_y + pry * 0.5 + 10, 0.18, 0.18, sc_angle, c_black, 0.5);
	draw_sprite_ext(s_training_sc, 0, 1130 + prx + lengthdir_x(300, sc_angle - 90) + 5, -training_back_y + lengthdir_y(300, sc_angle - 90) + pry * 0.7 + 10, 0.5, 0.5, 0, c_black, 0.5);
	
	draw_sprite_ext_t(s_training_rope, 0, 1130, -training_back_y + pry * 0.5, 0.18, 0.18, sc_angle, c_white, 1, c_white, c_black);
	draw_sprite_ext_t(s_training_sc, 0, 1130 + prx + lengthdir_x(300, sc_angle - 90), -training_back_y + lengthdir_y(300, sc_angle - 90) + pry * 0.7, 0.5, 0.5, 0, c_white, 1, c_white, c_black);
	
	if point_in_rectangle(mouse_x, mouse_y, - 60 + 1130 + lengthdir_x(300, sc_angle - 90), - 100 -training_back_y + lengthdir_y(300, sc_angle - 90), 60 + 1130 + lengthdir_x(300, sc_angle - 90), 100 -training_back_y + lengthdir_y(300, sc_angle - 90))
		{
		//// КЛАЦ
		if mouse_check_button_pressed(mb_left)
			{
			if global.sound
				{ audio_play_sound(sd_text, 2, 0); }
			}
		//// КЛАЦ
		if mouse_check_button_pressed(mb_left)
			{
			if mouse_x > 1130
				{ sc_dir = -1; }
				else
				{ sc_dir = 1; }
			sc_spd   = 1;
			sc_dist  = 10;
			}
		}
	if point_in_rectangle(mouse_x, mouse_y, 0, 0, 100, 100)
		{
		//// КЛАЦ
		if mouse_check_button_pressed(mb_left)
			{
			if global.sound
				{ audio_play_sound(sd_text, 2, 0); }
			}
		//// КЛАЦ
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
#region Магазин / Банк Кэша и Золота
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
	top = sprite_get_height(s_training_back) * ((sprite_get_height(s_training_back) / sprite_get_width(s_training_back)) - (global.size / 1280)) / 2;
	draw_sprite_part_ext(s_store_back, 1, 0, top, sprite_get_width(s_store_back), sprite_get_height(s_store_back) - top, 0 + prx, training_back_y + pry, global.back_scale, global.back_scale, c_white, 1);
	
	draw_set_alpha(0.35);
		draw_rectangle_color(0, -90 + daily_y + training_back_y + pry + store_yy1 + 10, 1280, 20 + cash_y + training_back_y + store_yy1 + pry - 120 - 40, c_black, c_black, c_black, c_black, 0);
		draw_rectangle_color(0, 300 + 157 + cash_y + training_back_y + pry + store_yy1 - 135 - 40, 1280, 40 + gold_y + training_back_y + store_yy1 + pry - 135, c_black, c_black, c_black, c_black, 0);
	draw_set_alpha(1);
	//
	// top - 90 + daily_y + training_back_y + pry + store_yy1 + 10
	// top + 20 + cash_y + training_back_y + store_yy1 + pry - 120 - 40
	
	//draw_set_alpha(0.35);
	//	draw_rectangle_color(0, top - 90 + daily_y + training_back_y + pry + store_yy1 + 10, 1280, top + 20 + cash_y + training_back_y + store_yy1 + pry - 120 - 40, c_black, c_black, c_black, c_black, 0);
	//	draw_rectangle_color(0, 300 + top + 157 + cash_y + training_back_y + pry + store_yy1 - 135 - 40, 1280, top + 40 + gold_y + training_back_y + store_yy1 + pry - 135, c_black, c_black, c_black, c_black, 0);
	//draw_set_alpha(1);
	
	//300 + top + 157 + cash_y + training_back_y + pry + store_yy1 - 135 - 40
	//top + 40 + gold_y + training_back_y + store_yy1 + pry - 120
	///
	////////
	#region Кнопки магазина
		//// ЛУТБОКСЫ
		top = 0;
		#region Нажатие на ящик
			var lbs1, lbs2;
			lbs1 = 1;
			lbs2 = 1;
			if store_tap = 1
				{
				for(i=1;i<=2;i++)
					{
					if lootbox_buy[i] = 1
						{
						if lootbox_buy_s[i] < 1
							{ lootbox_buy_s[i] += 0.1; }
							else
							{ lootbox_buy_s[i] = 1; }
						}
						else
						{
						if lootbox_buy_s[i] > 0
							{ lootbox_buy_s[i] -= 0.1; }
							else
							{ lootbox_buy_s[i] = 0; }
						}
					}
				if lootbox_buy_s[1] = 0 && lootbox_buy_s[2] = 0
				&& lootbox_buy[1] = 0 && lootbox_buy[2] = 0 && daily_buy[1] = 0 && daily_buy[2] = 0 && daily_buy[3] = 0
					{
					#region Покупка 1
						///////
						if point_in_rectangle(mouse_x, mouse_y, 640 - 150 - 105, top + 150 + lootbox_y + training_back_y + pry + 10 + store_yy1 - 75, 640 - 150 + 105, top + 150 + lootbox_y + training_back_y + pry + 10 + store_yy1 + 190)
							{
							//// КЛАЦ
							if mouse_check_button_pressed(mb_left)
								{
								if global.sound
									{ audio_play_sound(sd_text, 2, 0); }
								}
							//// КЛАЦ
							if 1//(global.gold >= 100)
								{
								if mouse_check_button_released(mb_left) // && store_yy <= 0
									{
									if lootbox_buy[1] = 0
										{
										GoogleAnalytics_SendEvent("LOOTBOXES","Игрок купил WOOD BOX");
										if lootbox_buy_s[1] = 0
											{ lootbox_buy[1] = 1; }
										}
									}
								}
								else
								{
								if mouse_check_button_released(mb_left) // && store_yy <= 0
									{ store_yy1 = -1540; io_clear(); }
								}
							if mouse_check_button(mb_left)
								{ lbs1 = 1.1; }
							}
						///////
					#endregion
					#region Покупка 2
						///////
						if point_in_rectangle(mouse_x, mouse_y, 640 + 150 - 105, top + 150 + lootbox_y + training_back_y + pry + 10 + store_yy1 - 75, 640 + 150 + 105, top + 150 + lootbox_y + training_back_y + pry + 10 + store_yy1 + 190)
							{
							//// КЛАЦ
							if mouse_check_button_pressed(mb_left)
								{
								if global.sound
									{ audio_play_sound(sd_text, 2, 0); }
								}
							//// КЛАЦ
							if 1//(global.cash >= 50)
								{
								if mouse_check_button_released(mb_left) // && store_yy <= 0
									{
									if lootbox_buy[2] = 0
										{
										if lootbox_buy_s[2] = 0
											{ lootbox_buy[2] = 1; }
										GoogleAnalytics_SendEvent("LOOTBOXES", "Игрок купил ELITE BOX");
										}
									}
								}
								//else
								//{
								//if mouse_check_button_released(mb_left) // && store_yy <= 0
								//	{ store_yy1 = -785; io_clear(); }
								//}
							if mouse_check_button(mb_left)
								{ lbs2 = 1.1; }
							}
						///////
					#endregion
					}
				}
		#endregion
		
		draw_sprite_ext(s_store_plash, 0, 640 + prx, top + 70 + lootbox_y + training_back_y + store_yy1 + pry + 10, 0.4, 0.4, 0, c_black, 0.5);
		draw_sprite_ext(s_store_plash, 0, 640 + prx, top + 70 + lootbox_y + training_back_y + store_yy1 + pry, 0.4, 0.4, 0, c_white, 1);
		//if os_get_language() != "ru"
		//	{ draw_text_transformed_t(640 + prx, top + 50 + lootbox_y + training_back_y + store_yy1 + pry, "LOOTBOXES", 0.2, 0.2, 0, global.color_white, c_black); }
		//	else
		//	{ draw_text_transformed_t(640 + prx, top + 50 + lootbox_y + training_back_y + store_yy1 + pry, "ЛУТБОКСЫ", 0.2, 0.2, 0, global.color_white, c_black); }
		
		draw_text_transformed_t(640 + prx, top + 50 + lootbox_y + training_back_y + store_yy1 + pry, store_text[1], 0.2, 0.2, 0, global.color_white, c_black);
		
		draw_sprite_ext(s_lootbox1, 0, 640 + prx - 150, top + 150 + lootbox_y + training_back_y + pry + 10 + store_yy1, 0.24, 0.24, 0, c_black, 0.5);
		if lootbox_buy[1] = 0
			{ draw_sprite_ext(s_lootbox1, 0, 640 + prx - 150, top + 150 + lootbox_y + training_back_y + pry + store_yy1     , 0.24 * lbs1, 0.24 * lbs1, 0, c_white, 1); }
		
		draw_sprite_ext(s_lootbox2, 0, 640 + prx + 150, top + 150 + lootbox_y + training_back_y + pry + 10 + store_yy1, 0.24, 0.24, 0, c_black, 0.5);
		if lootbox_buy[2] = 0
			{ draw_sprite_ext(s_lootbox2, 0, 640 + prx + 150, top + 150 + lootbox_y + training_back_y + pry + store_yy1     , 0.24 * lbs2, 0.24 * lbs2, 0, c_white, 1); }
		
		////// Названия
		//if os_get_language() = "ru"
		//	{
		//	draw_text_transformed_t(640 + prx - 150, top + 150 + lootbox_y + training_back_y + pry + 10 + store_yy1 - 45, "ОБЫЧНЫЙ ЯЩИК", 0.13 * lbs1, 0.13 * lbs1, 5, global.color_white, c_black);
		//	draw_text_transformed_t(640 + prx + 150, top + 150 + lootbox_y + training_back_y + pry + 10 + store_yy1 - 45, "ЭЛИТНЫЙ ЯЩИК", 0.13 * lbs2, 0.13 * lbs2, 5, global.gold_color, c_black);
		//	}
		//	else
		//	{
		//	draw_text_transformed_t(640 + prx - 150, top + 150 + lootbox_y + training_back_y + pry + 10 + store_yy1 - 45, "WOOD BOX", 0.13 * lbs1, 0.13 * lbs1, 5, global.color_white, c_black);
		//	draw_text_transformed_t(640 + prx + 150, top + 150 + lootbox_y + training_back_y + pry + 10 + store_yy1 - 45, "ELITE BOX", 0.13 * lbs2, 0.13 * lbs2, 5, global.gold_color, c_black);
		//	}
		draw_text_transformed_t(640 + prx - 150, top + 150 + lootbox_y + training_back_y + pry + 10 + store_yy1 - 45, store_text[2], 0.13 * lbs1, 0.13 * lbs1, 5, global.color_white, c_black);
		draw_text_transformed_t(640 + prx + 150, top + 150 + lootbox_y + training_back_y + pry + 10 + store_yy1 - 45, store_text[3], 0.13 * lbs2, 0.13 * lbs2, 5, global.gold_color, c_black);
		//// Названия
		
		////// Цена
		draw_text_transformed_t(640 + prx - 150 + 22, top + 155 + lootbox_y + training_back_y + pry + 10 + store_yy1 + 140, "100©", 0.25 * lbs1, 0.25 * lbs1, 0, global.gold_color, c_black);
		draw_text_transformed_t(640 + prx + 150 + 22, top + 155 + lootbox_y + training_back_y + pry + 10 + store_yy1 + 140, "50ç", 0.25 * lbs2, 0.25 * lbs2, 0, global.cash_color, c_black);
		///// Цена
		
		///////
		#region Рука
			if (global.hand_gold && global.gold >= 100)
				{
				if hand_i < 10
					{ hand_i += 0.4; }
					else
					{ hand_i = 0; }
				draw_sprite_ext(s_training_hand, hand_i, 640 + prx - 150 + 22, top + 155 + lootbox_y + training_back_y + pry + 10 + store_yy1 + 80, 1, 1, 0, c_black, 0.5);
				draw_sprite_ext_t(s_training_hand, hand_i, 640 + prx - 150 + 22, top + 155 + lootbox_y + training_back_y + pry + 10 + store_yy1 + 80, 1, 1, 0, global.color_white, 1, global.color_white, c_black);
				}
			if (global.hand_cash && global.cash >= 50)
				{
				if !(global.hand_gold && global.gold >= 100)
					{
					if hand_i < 10
						{ hand_i += 0.4; }
						else
						{ hand_i = 0; }
					}
				draw_sprite_ext(s_training_hand, hand_i, 640 + prx + 150 + 22, top + 155 + lootbox_y + training_back_y + pry + 10 + store_yy1 + 80, 1, 1, 0, c_black, 0.5);
				draw_sprite_ext_t(s_training_hand, hand_i, 640 + prx + 150 + 22, top + 155 + lootbox_y + training_back_y + pry + 10 + store_yy1 + 80, 1, 1, 0, global.color_white, 1, global.color_white, c_black);
				}
		#endregion
		///////
		
		////// ЕЖЕДНЕВНЫЕ ПОКУПКИ
		draw_sprite_ext(s_store_plash, 0, 640 + prx, top - 90 + daily_y + training_back_y + pry + store_yy1 + 10, 0.4, 0.4, 0, c_black, 0.5);
		draw_sprite_ext(s_store_plash, 0, 640 + prx, top - 90 + daily_y + training_back_y + pry + store_yy1, 0.4, 0.4, 0, c_white, 1);
		//if os_get_language() != "ru"
		//	{ draw_text_transformed_t(640 + prx, top - 110 + daily_y + training_back_y + pry + store_yy1, "DAILY ITEMS", 0.17, 0.17, 0, global.color_white, c_black); }
		//	else
		//	{ draw_text_transformed_t(640 + prx, top - 110 + daily_y + training_back_y + pry + store_yy1, "ЕЖЕДНЕВНЫЕ ВЕЩИ", 0.17, 0.17, 0, global.color_white, c_black); }
		draw_text_transformed_t(640 + prx, top - 110 + daily_y + training_back_y + pry + store_yy1, store_text[4], 0.17, 0.17, 0, global.color_white, c_black);
		
		//if os_get_language() != "ru"
		//	{ draw_text_transformed_t(640 + prx, top - 110 + daily_y + training_back_y + pry + store_yy1 + 45, "TO REFRESH " + string(23 - current_hour) + "H" + " " + string(59 - current_minute) + "M", 0.1, 0.1, 0, global.color_white, c_black); }
		//	else
		//	{
		//	draw_text_transformed_t(640 + prx - string_width("24H69M)") * 0.1 / 2, top - 110 + daily_y + training_back_y + pry + store_yy1 + 45, "(ДО ОБНОВЛЕНИЯ ", 0.1, 0.1, 0, global.color_white, c_black);
		//	draw_text_transformed_t(640 + prx - string_width("24H69M)") * 0.12 / 2 + string_width("(ДО ОБНОВЛЕНИЯ ") * 0.1 / 2 + string_width(string(23 - current_hour)) * 0.17 / 2, top - 110 + daily_y + training_back_y + pry + store_yy1 + 45 - 10, string(23 - current_hour), 0.17, 0.17, 0, global.color_white, c_black);
		//	draw_text_transformed_t(640 + prx - string_width("24H69M)") * 0.12 / 2 + string_width("(ДО ОБНОВЛЕНИЯ ") * 0.1 / 2 + string_width(string(23 - current_hour)) * 0.17 + string_width("Ч") * 0.1 / 2, top - 110 + daily_y + training_back_y + pry + store_yy1 + 45, "Ч", 0.1, 0.1, 0, global.color_white, c_black);
		//	draw_text_transformed_t(640 + prx - string_width("24H69M)") * 0.12 / 2 + string_width("(ДО ОБНОВЛЕНИЯ ") * 0.1 / 2 + string_width(string(23 - current_hour)) * 0.17 + string_width("Ч") * 0.1 + string_width(string(59 - current_minute)) * 0.17 / 2, top - 110 + daily_y + training_back_y + pry + store_yy1 + 45 - 10, string(59 - current_minute), 0.17, 0.17, 0, global.color_white, c_black);
		//	draw_text_transformed_t(640 + prx - string_width("24H69M)") * 0.12 / 2 + string_width("(ДО ОБНОВЛЕНИЯ ") * 0.1 / 2 + string_width(string(23 - current_hour)) * 0.17 + string_width("Ч") * 0.1 + string_width(string(59 - current_minute)) * 0.17 + string_width("М)") * 0.1 / 2, top - 110 + daily_y + training_back_y + pry + store_yy1 + 45, "М)", 0.1, 0.1, 0, global.color_white, c_black);
		//	}
		
		draw_text_transformed_t(640 + prx - string_width("24H59M)") * 0.1 / 2, top - 110 + daily_y + training_back_y + pry + store_yy1 + 45, "(" + store_text[5] + " ", 0.1, 0.1, 0, global.color_white, c_black);
		draw_text_transformed_t(640 + prx - string_width("24H59M)") * 0.12 / 2 + string_width("(" + store_text[5] + " ") * 0.1 / 2 + string_width(string(23 - current_hour)) * 0.17 / 2, top - 110 + daily_y + training_back_y + pry + store_yy1 + 45 - 10, string(23 - current_hour), 0.17, 0.17, 0, global.color_white, c_black);
		draw_text_transformed_t(640 + prx - string_width("24H59M)") * 0.12 / 2 + string_width("(" + store_text[5] + " ") * 0.1 / 2 + string_width(string(23 - current_hour)) * 0.17 + string_width(store_text[6]) * 0.1 / 2, top - 110 + daily_y + training_back_y + pry + store_yy1 + 45, store_text[6], 0.1, 0.1, 0, global.color_white, c_black);
		draw_text_transformed_t(640 + prx - string_width("24H59M)") * 0.12 / 2 + string_width("(" + store_text[5] + " ") * 0.1 / 2 + string_width(string(23 - current_hour)) * 0.17 + string_width(store_text[6]) * 0.1 + string_width(string(59 - current_minute)) * 0.17 / 2, top - 110 + daily_y + training_back_y + pry + store_yy1 + 45 - 10, string(59 - current_minute), 0.17, 0.17, 0, global.color_white, c_black);
		draw_text_transformed_t(640 + prx - string_width("24H59M)") * 0.12 / 2 + string_width("(" + store_text[5] + " ") * 0.1 / 2 + string_width(string(23 - current_hour)) * 0.17 + string_width(store_text[6]) * 0.1 + string_width(string(59 - current_minute)) * 0.17 + string_width(store_text[7]+")") * 0.1 / 2, top - 110 + daily_y + training_back_y + pry + store_yy1 + 45, store_text[7] + ")", 0.1, 0.1, 0, global.color_white, c_black);
		
			//{
			//draw_text_transformed_t(640 + prx, top - 110 + daily_y + training_back_y + pry + store_yy1 + 45, "(ДО ОБНОВЛЕНИЯ ", 0.1, 0.1, 0, global.color_white, c_black);
			////draw_text_transformed_t(640 + prx, top - 110 + daily_y + training_back_y + pry + store_yy1 + 45, string(s), 0.1, 0.1, 0, global.color_white, c_black);
			//draw_text_transformed_t(640 + prx + string_width("(ДО ОБНОВЛЕНИЯ ") * 0.1 / 2, top - 110 + daily_y + training_back_y + pry + store_yy1 + 45, ")", 0.1, 0.1, 0, global.color_white, c_black);
			//}
		
		/////////
		//draw_sprite_ext(s_wanted, 1, 640 + prx - 200 + 5, top + 80 + daily_y + training_back_y + pry + store_yy1 + 10, 0.5, 0.5, 0, c_black, 0.5);
		//draw_sprite_ext(s_wanted, 2, 640 + prx + 5, top + 80 + daily_y + training_back_y + pry + store_yy1 + 10, 0.5, 0.5, 0, c_black, 0.5);
		//draw_sprite_ext(s_wanted, 3, 640 + prx + 200 + 5, top + 80 + daily_y + training_back_y + pry + store_yy1 + 10, 0.5, 0.5, 0, c_black, 0.5);
		
		//draw_sprite_ext_t(s_wanted, 1, 640 + prx - 200, top + 80 + daily_y + training_back_y + pry + store_yy1, 0.5, 0.5, 0, c_white, 1, c_white, c_black);
		//draw_sprite_ext_t(s_wanted, 2, 640 + prx, top + 80 + daily_y + training_back_y + pry + store_yy1, 0.5, 0.5, 0, c_white, 1, c_white, c_black);
		//draw_sprite_ext_t(s_wanted, 3, 640 + prx + 200, top + 80 + daily_y + training_back_y + pry + store_yy1, 0.5, 0.5, 0, c_white, 1, c_white, c_black);
		//////////
		
		for(dall=1;dall<=3;dall++)
			{
			var dall_x;
			if dall = 1	
				{ dall_x = 640 + prx - 200; }
			if dall = 2	
				{ dall_x = 640 + prx; }
			if dall = 3	
				{ dall_x = 640 + prx + 200; }
			
			var d_h;
				d_h = 1;
			if store_tap = 1
				{
				#region Нажатие на дейли
					//for(i=1;i<=3;i++)
						//{
						if daily_buy[dall] = 1
							{
							if daily_buy_s[dall] < 1
								{ daily_buy_s[dall] += 0.1; }
								else
								{ daily_buy_s[dall] = 1; }
							}
							else
							{
							if daily_buy_s[dall] > 0
								{ daily_buy_s[dall] -= 0.1; }
								else
								{ daily_buy_s[dall] = 0; }
							}
						//}
					if daily_buy[1] = 0 && daily_buy[2] = 0 && daily_buy[3] = 0
					&& lootbox_buy_s[1] = 0 && lootbox_buy_s[2] = 0
					&& lootbox_buy[1] = 0 && lootbox_buy[2] = 0 && daily_buy[1] = 0 && daily_buy[2] = 0 && daily_buy[3] = 0
						{
						if point_in_rectangle(mouse_x, mouse_y, dall_x - 87, top + 80 + daily_y + training_back_y + pry + store_yy1 - 200, dall_x + 87, top + 80 + daily_y + training_back_y + pry + store_yy1 + 200)
							{
							if (daily_t[dall] = 1 && daily_b[dall] = 0) or (daily_t[dall] = 0 && global.totem_have[daily_n[dall]] = 0)
								{
								if mouse_check_button(mb_left)
									{ d_h = 1.1; }
								//// КЛАЦ
								if mouse_check_button_pressed(mb_left)
									{
									if global.sound
										{ audio_play_sound(sd_text, 2, 0); }
									}
								//// КЛАЦ
									
								if mouse_check_button_released(mb_left) // && store_yy <= 0
									{
									GoogleAnalytics_SendEvent("DAILY","Игрок купил DAILY " + string(dall));
									//if lootbox_buy_s[dall] = 0
										{ daily_buy[dall] = 1; }
									io_clear();
									}
								}
							}
								
						}
					//dall_x, top + 80 + daily_y + training_back_y + pry + store_yy1
				#endregion
				}
			if daily_t[dall] = 1
				{
				var name;
				//name = string_upper(global.hero_code_name[daily_n[dall]]);
				//if daily_n[dall] = 2
				//	{ name = "DRUNK JOE"; }
				//if daily_n[dall] = 5
				//	{ name = "BILL SR."; }
										
				//if os_get_language() = "ru"
				//	{
				//	switch(daily_n[dall])
				//		{
				//		case 1: name = "ВОРИШКА"; break;
				//		case 2: name = "ПЬЯН. ДЖО"; break;
				//		case 3: name = "ОХОТНИЦА"; break;
				//		case 4: name = "ДИЕГО"; break;
				//		case 5: name = "БИЛЛ СТ."; break;
				//		case 6: name = "ШЕРИФ"; break;
				//		case 7: name = "ШАМАН"; break;
				//		}
				//	}
				name = heroes_name[daily_n[dall]];
				draw_sprite_ext(s_wanted, daily_n[dall], dall_x + 5, top + 80 + daily_y + training_back_y + pry + store_yy1 + 10, 0.5, 0.5, 0, c_black, 0.5);
				//draw_sprite_ext(s_wanted2, 0, 640 + prx - 200, top + 80 + daily_y + training_back_y + pry + store_yy1, 0.5, 0.5, 0, daily_c[1], 1);
				if daily_buy[dall] = 0 && daily_b[dall] = 0
					{
					draw_sprite_ext_t(s_wanted, daily_n[dall], dall_x, top + 80 + daily_y + training_back_y + pry + store_yy1, 0.5 * d_h, 0.5 * d_h, 0, c_white, 1, c_white, c_black);
					
					draw_text_transformed_t(dall_x, top + 80 + daily_y + training_back_y + pry + store_yy1 + 80, name, 0.12 * d_h, 0.12 * d_h, 0, global.color_hero[daily_n[dall]], c_black);
					draw_text_transformed_t(dall_x + 70, top + 80 + daily_y + training_back_y + pry + store_yy1 - 100, "*" + string(daily_r[dall]), 0.18 * d_h, 0.18 * d_h, 0, global.color_white, c_black);
					
					if daily_pr[dall] = 1
						{ draw_text_transformed_t(dall_x, top + 80 + daily_y + training_back_y + pry + store_yy1 + 140, string(daily_p[dall]) + "ç", 0.25 * d_h, 0.25 * d_h, 0, global.cash_color, c_black); }
						else
						{ draw_text_transformed_t(dall_x, top + 80 + daily_y + training_back_y + pry + store_yy1 + 140, string(daily_p[dall]) + "©", 0.25 * d_h, 0.25 * d_h, 0, global.gold_color, c_black); }
					}
				}
				else
				{
				draw_sprite_ext(s_totems, daily_n[dall], dall_x + 5, top + 80 + daily_y + training_back_y + pry + store_yy1 + 10, 0.35, 0.35, 0, c_black, 0.5);
				
				if daily_buy[dall] = 0 && daily_b[dall] = 0 && global.totem_have[daily_n[dall]] = 0
					{
					//draw_sprite_ext(s_totems_light, daily_n[dall], dall_x, top + 80 + daily_y + training_back_y + pry + store_yy1, 0.35 * d_h, 0.35 * d_h, 0, daily_c[dall], 0.5);
					draw_sprite_ext_t(s_totems, daily_n[dall], dall_x, top + 80 + daily_y + training_back_y + pry + store_yy1, 0.35 * d_h, 0.35 * d_h, 0, c_white, 1, c_white, c_black);
					draw_sprite_ext(s_totems_eyes, daily_n[dall], dall_x, top + 80 + daily_y + training_back_y + pry + store_yy1, 0.35 * d_h, 0.35 * d_h, 0, daily_c[dall], 0.5);
					
					draw_text_ext_transformed_t(dall_x, top + 80 + daily_y + training_back_y + pry + store_yy1 + 80, global.totem_name[daily_n[dall]], -1, 1000, 0.12 * d_h, 0.12 * d_h, 0, daily_c[dall], c_black);
					
					if daily_pr[dall] = 1
						{ draw_text_transformed_t(dall_x, top + 80 + daily_y + training_back_y + pry + store_yy1 + 140, string(daily_p[dall]) + "ç", 0.25 * d_h, 0.25 * d_h, 0, global.cash_color, c_black); }
						else
						{ draw_text_transformed_t(dall_x, top + 80 + daily_y + training_back_y + pry + store_yy1 + 140, string(daily_p[dall]) + "©", 0.25 * d_h, 0.25 * d_h, 0, global.gold_color, c_black); }
					}
				}
			}
		
		//if os_get_language() = "ru"
		//	{ draw_text_transformed_t(640 + prx, top + 80 + daily_y + training_back_y + pry + store_yy1, "УЖЕ СКОРО!", 0.2, 0.2, 10, global.color_white, c_black); }
		//	else
		//	{ draw_text_transformed_t(640 + prx, top + 80 + daily_y + training_back_y + pry + store_yy1, "APPEAR SOON", 0.2, 0.2, 10, global.color_white, c_black); }
		///////
		
		// daily_t[1]
		// daily_n[1]
		// daily_p[1]
		// daily_r[1]
		// daily_c[1]
	
		////// ПОКУПКА ДОЛЛАРОВ
		draw_sprite_ext(s_store_plash, 0, 640 + prx, top + 20 + cash_y + training_back_y + store_yy1 + pry - 100 + 10, 0.4, 0.4, 0, c_black, 0.5);
		draw_sprite_ext(s_store_plash, 0, 640 + prx, top + 20 + cash_y + training_back_y + store_yy1 + pry - 100, 0.4, 0.4, 0, c_white, 1);
		//if os_get_language() = "ru"
		//	{ draw_text_transformed_t(640 + prx, top + 20 + cash_y + training_back_y + store_yy1 + pry - 120, "БАНК ДЕНЕГ", 0.17, 0.17, 0, global.color_white, c_black); }
		//	else
		//	{ draw_text_transformed_t(640 + prx, top + 20 + cash_y + training_back_y + store_yy1 + pry - 120, "BANK OF CASH", 0.17, 0.17, 0, global.color_white, c_black); }
		draw_text_transformed_t(640 + prx, top + 20 + cash_y + training_back_y + store_yy1 + pry - 120, store_text[8], 0.17, 0.17, 0, global.color_white, c_black);
		/////////
		#region Нажатие на покупку КЭША
			var cx1, cx2, cx3, cy1, cy2, sc1, sc2, sc3, sc4, sc5, sc6;
			cx1 = 640 - 200;
			cx2 = 640;
			cx3 = 640 + 200;
			cy1 = top + 127 + cash_y + training_back_y + pry + store_yy1;
			cy2 = 300 + cy1;
			
			sc1 = 1;
			sc2 = 1;
			sc3 = 1;
			sc4 = 1;
			sc5 = 1;
			sc6 = 1;
			
			if store_tap = 1
			&& (gold_buy[1] = 0 && gold_buy[2] = 0 && gold_buy[3] = 0 && lootbox_buy[1] = 0 && lootbox_buy[2] = 0 && daily_buy[1] = 0 && daily_buy[2] = 0 && daily_buy[3] = 0)
				{
				#region Покупки
					#region Покупка 1
						///////
						if point_in_rectangle(mouse_x, mouse_y, cx1 - 75, cy1 - 105, cx1 + 75, cy1 + 105)
							{
							if mouse_check_button_released(mb_left) && store_yy <= 0 && gold_buy[1] = 0 && gold_buy[2] = 0 && gold_buy[3] = 0
								{
								if os_type = os_macosx
									{
									global.cash += cash_val[1];
									ini_open("Music.ini");
										ini_write_string("Sounds", "sound_false_c", string(global.cash));
									ini_close();
									}
								if os_type = os_ios
									{
									if global.sound
										{ audio_play_sound(sd_text, 2, 0); }
									#region Покупка
										if iap_status() == iap_status_available
										   {
										   var product = "buy_cash_50";
										   iap_acquire(product, "");
										   }
										   else
										   { show_message_async("Store is not available."); }
									#endregion
									}
								}
							if mouse_check_button(mb_left)
								{ sc1 = 1.1; }
							}
						///////
					#endregion
					#region Покупка 2
						/////////
						if point_in_rectangle(mouse_x, mouse_y, cx2 - 75, cy1 - 105, cx2 + 75, cy1 + 105)
							{
							if mouse_check_button_released(mb_left) && store_yy <= 0 && gold_buy[1] = 0 && gold_buy[2] = 0 && gold_buy[3] = 0
								{
								if os_type = os_macosx
									{
									global.cash += cash_val[2];
									if global.sound
										{ audio_play_sound(sd_text, 2, 0); }
									GoogleAnalytics_SendEvent("CASH","Игрок купил 270 кэша!");
									ini_open("Music.ini");
										ini_write_string("Sounds", "sound_false_c", string(global.cash));
									ini_close();
									}
								if os_type = os_ios
									{
									if global.sound
										{ audio_play_sound(sd_text, 2, 0); }
									#region Покупка
										if iap_status() == iap_status_available
										   {
										   var product = "buy_cash_270";
										   iap_acquire(product, "");
										   }
										   else
										   { show_message_async("Store is not available."); }
									#endregion
									}
								}
							if mouse_check_button(mb_left)
								{ sc2 = 1.1; }
							}
						/////////
					#endregion
					#region Покупка 3
						////////
						if point_in_rectangle(mouse_x, mouse_y, cx3 - 75, cy1 - 105, cx3 + 75, cy1 + 105)
							{
							if mouse_check_button_released(mb_left) && store_yy <= 0 && gold_buy[1] = 0 && gold_buy[2] = 0 && gold_buy[3] = 0
								{
								if os_type = os_macosx
									{
									global.cash += cash_val[3];
									if global.sound
										{ audio_play_sound(sd_text, 2, 0); }
									GoogleAnalytics_SendEvent("CASH","Игрок купил 550 кэша!");
									ini_open("Music.ini");
										ini_write_string("Sounds", "sound_false_c", string(global.cash));
									ini_close();
									}
								if os_type = os_ios
									{
									if global.sound
										{ audio_play_sound(sd_text, 2, 0); }
									#region Покупка
										if iap_status() == iap_status_available
										   {
										   var product = "buy_cash_550";
										   iap_acquire(product, "");
										   }
										   else
										   { show_message_async("Store is not available."); }
									#endregion
									}
								}
							if mouse_check_button(mb_left)
								{ sc3 = 1.1; }
							}
						//////////
					#endregion
					#region Покупка 4
						///////
						if point_in_rectangle(mouse_x, mouse_y, cx1 - 75, cy2 - 105, cx1 + 75, cy2 + 105)
							{
							if mouse_check_button_released(mb_left) && store_yy <= 0 && gold_buy[1] = 0 && gold_buy[2] = 0 && gold_buy[3] = 0
								{
								if os_type = os_macosx
									{
									global.cash += cash_val[4];
									ini_open("Music.ini");
										ini_write_string("Sounds", "sound_false_c", string(global.cash));
									ini_close();
									}
								if os_type = os_ios
									{
									if global.sound
										{ audio_play_sound(sd_text, 2, 0); }
									#region Покупка
										if iap_status() == iap_status_available
										   {
										   var product = "buy_cash_1200";
										   iap_acquire(product, "");
										   }
										   else
										   { show_message_async("Store is not available."); }
									#endregion
									}
								}
							if mouse_check_button(mb_left)
								{ sc4 = 1.1; }
							}
						///////
					#endregion
					#region Покупка 5
					/////
						if point_in_rectangle(mouse_x, mouse_y, cx2 - 75, cy2 - 105, cx2 + 75, cy2 + 105)
							{
							if mouse_check_button_released(mb_left) && store_yy <= 0 && gold_buy[1] = 0 && gold_buy[2] = 0 && gold_buy[3] = 0
								{
								if os_type = os_macosx
									{
									global.cash += cash_val[5];
									ini_open("Music.ini");
										ini_write_string("Sounds", "sound_false_c", string(global.cash));
									ini_close();
									}
								if os_type = os_ios
									{
									#region Покупка
										if global.sound
											{ audio_play_sound(sd_text, 2, 0); }
										if iap_status() == iap_status_available
										   {
										   var product = "buy_cash_3000";
										   iap_acquire(product, "");
										   }
										   else
										   { show_message_async("Store is not available."); }
									#endregion
									}
								}
							if mouse_check_button(mb_left)
								{ sc5 = 1.1; }
							}
						/////////
					#endregion
					#region Покупка 6
					////////
						if point_in_rectangle(mouse_x, mouse_y, cx3 - 75, cy2 - 105, cx3 + 75, cy2 + 105)
							{
							if mouse_check_button_released(mb_left) && store_yy <= 0 && gold_buy[1] = 0 && gold_buy[2] = 0 && gold_buy[3] = 0
								{
								if os_type = os_macosx
									{
									global.cash += cash_val[6];
									ini_open("Music.ini");
										ini_write_string("Sounds", "sound_false_c", string(global.cash));
									ini_close();
									}
								if os_type = os_ios
									{
									#region Покупка
										if global.sound
											{ audio_play_sound(sd_text, 2, 0); }
										if iap_status() == iap_status_available
										   {
										   var product = "buy_cash_7000";
										   iap_acquire(product, "");
										   }
										   else
										   { show_message_async("Store is not available."); }
									#endregion
									}
								}
							if mouse_check_button(mb_left)
								{ sc6 = 1.1; }
							}
						/////////
					#endregion
				#endregion
				}
		#endregion
		/////////
		draw_sprite_ext(s_currency_buy, 0, 640 + prx - 200 + 5, top + 127 + cash_y + training_back_y + pry + store_yy1 + 10, 0.5 * sc1, 0.5 * sc1, 0, c_black, 0.5);
		draw_sprite_ext_t(s_currency_buy, 0, 640 + prx - 200, top + 127 + cash_y + training_back_y + pry + store_yy1, 0.5 * sc1, 0.5 * sc1, 0, c_white, 1, c_white, c_black);
		draw_text_ext_transformed_t(640 + prx - 200, top + 127 + cash_y + training_back_y + pry + store_yy1 - 135, cash_txt[1], -1, 1600, 0.11 * sc1, 0.11 * sc1, 0, global.color_white, c_black);
		draw_text_ext_transformed_t(640 + prx - 200, top + 127 + cash_y + training_back_y + pry + store_yy1 - 57, string(cash_val[1]), -1, 250, 0.18 * sc1, 0.18 * sc1, 0, global.cash_color, c_black);
		draw_text_ext_transformed_t(640 + prx - 200, top + 127 + cash_y + training_back_y + pry + store_yy1 + 100, cash_pri[1], -1, 250, 0.2 * sc1, 0.2 * sc1, 0, global.color_white, c_black);
		if os_get_region() = "RU"
			{
			//if os_get_language() = "ru"
			//	{ draw_text_transformed_t(640 + prx - 200, top + 127 + cash_y + training_back_y + pry + store_yy1 + 100 - string_height(cash_pri[1]) * 0.2 * sc1 - 5, "СПЕЦИАЛЬНАЯ\nЦЕНА!", 0.08 * sc1, 0.08 * sc1, 0, global.color_white, c_black); }
			//	else
			//	{ draw_text_transformed_t(640 + prx - 200, top + 127 + cash_y + training_back_y + pry + store_yy1 + 100 - string_height(cash_pri[1]) * 0.2 * sc1 - 5, "SPECIAL\nPRICE!", 0.08 * sc1, 0.08 * sc1, 0, global.color_white, c_black); }
			draw_text_ext_transformed_t(640 + prx - 200, top + 127 + cash_y + training_back_y + pry + store_yy1 + 100 - string_height(cash_pri[1]) * 0.2 * sc1 - 5, store_text[9], -1, 250, 0.08 * sc1, 0.08 * sc1, 0, global.color_white, c_black);
			}
		
		draw_sprite_ext(s_currency_buy, 1, 640 + prx + 5, top + 127 + cash_y + training_back_y + pry + store_yy1 + 10, 0.5 * sc2, 0.5 * sc2, 0, c_black, 0.5);
		draw_sprite_ext_t(s_currency_buy, 1, 640 + prx, top + 127 + cash_y + training_back_y + pry + store_yy1, 0.5 * sc2, 0.5 * sc2, 0, c_white, 1, c_white, c_black);
		draw_text_ext_transformed_t(640 + prx, top + 127 + cash_y + training_back_y + pry + store_yy1 - 135, cash_txt[2], -1, 1600, 0.11 * sc2, 0.11 * sc2, 0, global.color_white, c_black);
		draw_text_transformed_t(640 + prx, top + 127 + cash_y + training_back_y + pry + store_yy1 - 57, string(cash_val[2]), 0.18 * sc2, 0.18 * sc2, 0, global.cash_color, c_black);
		draw_text_transformed_t(640 + prx, top + 127 + cash_y + training_back_y + pry + store_yy1 + 100, cash_pri[2], 0.2 * sc2, 0.2 * sc2, 0, global.color_white, c_black);
		
		draw_sprite_ext(s_currency_buy, 2, 640 + prx + 200 + 5, top + 127 + cash_y + training_back_y + pry + store_yy1 + 10, 0.5 * sc3, 0.5 * sc3, 0, c_black, 0.5);
		draw_sprite_ext_t(s_currency_buy, 2, 640 + prx + 200, top + 127 + cash_y + training_back_y + pry + store_yy1, 0.5 * sc3, 0.5 * sc3, 0, c_white, 1, c_white, c_black);
		draw_text_ext_transformed_t(640 + prx + 200, top + 127 + cash_y + training_back_y + pry + store_yy1 - 135, cash_txt[3], -1, 1600, 0.11 * sc3, 0.11 * sc3, 0, global.color_white, c_black);
		draw_text_transformed_t(640 + prx + 200, top + 127 + cash_y + training_back_y + pry + store_yy1 - 57, string(cash_val[3]), 0.18 * sc3, 0.18 * sc3, 0, global.cash_color, c_black);
		draw_text_transformed_t(640 + prx + 200, top + 127 + cash_y + training_back_y + pry + store_yy1 + 100, cash_pri[3], 0.2 * sc3, 0.2 * sc3, 0, global.color_white, c_black);
		
		//////
		
		draw_sprite_ext(s_currency_buy, 3, 640 + prx - 200 + 5, 300 + top + 157 + cash_y + training_back_y + pry + store_yy1 + 10, 0.5 * sc4, 0.5 * sc4, 0, c_black, 0.5);
		draw_sprite_ext_t(s_currency_buy, 3, 640 + prx - 200, 300 + top + 157 + cash_y + training_back_y + pry + store_yy1, 0.5 * sc4, 0.5 * sc4, 0, c_white, 1, c_white, c_black);
		draw_text_ext_transformed_t(640 + prx - 200, 300 + top + 157 + cash_y + training_back_y + pry + store_yy1 - 135, cash_txt[4], -1, 1600, 0.11 * sc4, 0.11 * sc4, 0, global.color_white, c_black);
		draw_text_transformed_t(640 + prx - 200, 300 + top + 157 + cash_y + training_back_y + pry + store_yy1 - 57, string(cash_val[4]), 0.18 * sc4, 0.18 * sc4, 0, global.cash_color, c_black);
		draw_text_transformed_t(640 + prx - 200, 300 + top + 157 + cash_y + training_back_y + pry + store_yy1 + 100, cash_pri[4], 0.2 * sc4, 0.2 * sc4, 0, global.color_white, c_black);
		
		draw_sprite_ext(s_currency_buy, 4, 640 + prx + 5, 300 + top + 157 + cash_y + training_back_y + pry + store_yy1 + 10, 0.5 * sc5, 0.5 * sc5, 0, c_black, 0.5);
		draw_sprite_ext_t(s_currency_buy, 4, 640 + prx, 300 + top + 157 + cash_y + training_back_y + pry + store_yy1, 0.5 * sc5, 0.5 * sc5, 0, c_white, 1, c_white, c_black);
		draw_text_ext_transformed_t(640 + prx, 300 + top + 157 + cash_y + training_back_y + pry + store_yy1 - 135, cash_txt[5], -1, 1600, 0.11 * sc5, 0.11 * sc5, 0, global.color_white, c_black);
		draw_text_transformed_t(640 + prx, 300 + top + 157 + cash_y + training_back_y + pry + store_yy1 - 57, string(cash_val[5]), 0.18 * sc5, 0.18 * sc5, 0, global.cash_color, c_black);
		draw_text_transformed_t(640 + prx, 300 + top + 157 + cash_y + training_back_y + pry + store_yy1 + 100, cash_pri[5], 0.2 * sc5, 0.2 * sc5, 0, global.color_white, c_black);
		
		draw_sprite_ext(s_currency_buy, 5, 640 + prx + 200 + 5, 300 + top + 157 + cash_y + training_back_y + pry + store_yy1 + 10, 0.5 * sc6, 0.5 * sc6, 0, c_black, 0.5);
		draw_sprite_ext_t(s_currency_buy, 5, 640 + prx + 200, 300 + top + 157 + cash_y + training_back_y + pry + store_yy1, 0.5 * sc6, 0.5 * sc6, 0, c_white, 1, c_white, c_black);
		draw_text_ext_transformed_t(640 + prx + 200, 300 + top + 157 + cash_y + training_back_y + pry + store_yy1 - 135, cash_txt[6], -1, 1600, 0.11 * sc6, 0.11 * sc6, 0, global.color_white, c_black);
		draw_text_transformed_t(640 + prx + 200, 300 + top + 157 + cash_y + training_back_y + pry + store_yy1 - 57, string(cash_val[6]), 0.18 * sc6, 0.18 * sc6, 0, global.cash_color, c_black);
		draw_text_transformed_t(640 + prx + 200, 300 + top + 157 + cash_y + training_back_y + pry + store_yy1 + 100, cash_pri[6], 0.2 * sc6, 0.2 * sc6, 0, global.color_white, c_black);
		///////////
		
		//////////
		#region Нажатие на покупку ГОЛД
			var gx1, gx2, gx3, gy, sg1, sg2, sg3;
			gx1 = 640 - 200;
			gx2 = 640;
			gx3 = 640 + 200;
			gy = top + 157 + gold_y + training_back_y + pry + store_yy1;
			
			sg1 = 1;
			sg2 = 1;
			sg3 = 1;
			
			if store_tap = 1
			//&& (gold_buy[1] = 0 && gold_buy[2] = 0 && gold_buy[3] = 0 && lootbox_buy[1] = 0 && lootbox_buy[2] = 0 && daily_buy[1] = 0 && daily_buy[2] = 0 && daily_buy[3] = 0)
				{
				#region Покупки
					for(i=1;i<=3;i++)
						{
						if gold_buy[i] = 1
							{
							if gold_buy_s[i] < 1
								{ gold_buy_s[i] += 0.1; }
								else
								{ gold_buy_s[i] = 1; }
							}
							else
							{
							if gold_buy_s[i] > 0
								{ gold_buy_s[i] -= 0.1; }
								else
								{ gold_buy_s[i] = 0; }
							}
						}
					if gold_buy_s[1] = 0 && gold_buy_s[2] = 0 && gold_buy_s[3] = 0
					&& gold_buy[1] = 0 && gold_buy[2] = 0 && gold_buy[3] = 0
						{
						#region Покупка 1
							///////
							if point_in_rectangle(mouse_x, mouse_y, gx1 - 75, gy - 105, gx1 + 75, gy + 105)
								{
								if global.cash >= gold_pri[1]
									{
									if mouse_check_button_released(mb_left) // && store_yy <= 0
										{
										if gold_buy[1] = 0
											{
											GoogleAnalytics_SendEvent("CASH","Игрок купил 100 кэша!");
											if gold_buy_s[1] = 0
												{ gold_buy[1] = 1; }
											}
										}
									}
									else
									{
									if mouse_check_button_released(mb_left) // && store_yy <= 0
										{ store_yy1 = -758; }
									}
								if mouse_check_button(mb_left)
									{ sg1 = 1.1; }
								}
							///////
						#endregion
						#region Покупка 2
							///////
							if point_in_rectangle(mouse_x, mouse_y, gx2 - 75, gy - 105, gx2 + 75, gy + 105)
								{
								if global.cash >= gold_pri[2]
									{
									if mouse_check_button_released(mb_left) // && store_yy <= 0
										{
										if gold_buy[2] = 0
											{
											GoogleAnalytics_SendEvent("CASH","Игрок купил 800 кэша!");
											if gold_buy_s[2] = 0
												{ gold_buy[2] = 1; }
											}
										}
									}
									else
									{
									if mouse_check_button_released(mb_left) // && store_yy <= 0
										{ store_yy1 = -758; }
									}
								if mouse_check_button(mb_left)
									{ sg2 = 1.1; }
								}
							///////
						#endregion
						#region Покупка 3
							///////
							if point_in_rectangle(mouse_x, mouse_y, gx3 - 75, gy - 105, gx3 + 75, gy + 105)
								{
								if global.cash >= gold_pri[3]
									{
									if mouse_check_button_released(mb_left) // && store_yy <= 0
										{
										if gold_buy[3] = 0
											{
											GoogleAnalytics_SendEvent("CASH","Игрок купил 5500 кэша!");
											if gold_buy_s[3] = 0
												{ gold_buy[3] = 1; }
											}
										}
									}
									else
									{
									if mouse_check_button_released(mb_left) // && store_yy <= 0
										{ store_yy1 = -758; }
									}
								if mouse_check_button(mb_left)
									{ sg3 = 1.1; }
								}
							///////
						#endregion
						}
				#endregion
				}
		#endregion
		/////////
		////// ПОКУПКА ГОЛДЫ
		draw_sprite_ext(s_store_plash, 0, 640 + prx, top + 40 + gold_y + training_back_y + store_yy1 + pry - 100 + 10, 0.4, 0.4, 0, c_black, 0.5);
		draw_sprite_ext(s_store_plash, 0, 640 + prx, top + 40 + gold_y + training_back_y + store_yy1 + pry - 100, 0.4, 0.4, 0, c_white, 1);
		//if os_get_language() = "ru"
		//	{ draw_text_transformed_t(640 + prx, top + 40 + gold_y + training_back_y + store_yy1 + pry - 120, "БАНК ЗОЛОТА", 0.17, 0.17, 0, global.color_white, c_black); }
		//	else
		//	{ draw_text_transformed_t(640 + prx, top + 40 + gold_y + training_back_y + store_yy1 + pry - 120, "BANK OF GOLD", 0.17, 0.17, 0, global.color_white, c_black); }
		draw_text_transformed_t(640 + prx, top + 40 + gold_y + training_back_y + store_yy1 + pry - 120, store_text[10], 0.17, 0.17, 0, global.color_white, c_black);
		/////////
		draw_sprite_ext(s_currency_buy, 6, 640 + prx - 200, top + 157 + gold_y + training_back_y + pry + store_yy1 + 10, 0.5 * sg1, 0.5 * sg1, 0, c_black, 0.5);
		if gold_buy[1] = 0
			{
			draw_sprite_ext_t(s_currency_buy, 6, 640 + prx - 200, top + 157 + gold_y + training_back_y + pry + store_yy1, 0.5 * sg1, 0.5 * sg1, 0, c_white, 1, c_white, c_black);
			draw_text_transformed_t(640 + prx - 200, top + 157 + gold_y + training_back_y + pry + store_yy1 - 57, string(gold_val[1]), 0.18 * sg1, 0.18 * sg1, 0, global.gold_color, c_black);
			if global.cash < gold_pri[1]
				{
				draw_sprite_ext(s_currency_buy, 6, 640 + prx - 200, top + 157 + gold_y + training_back_y + pry + store_yy1, 0.5 * sg1, 0.5 * sg1, 0, c_black, 0.5);
				//if os_get_language() = "ru"
				//	{ draw_text_transformed_t(640 + prx - 200, top + 157 + gold_y + training_back_y + pry + store_yy1, "НЕТ\nСТОЛЬКО\nДЕНЕГ", 0.12, 0.12, 0, global.color_white, c_black); }
				//	else
				//	{ draw_text_transformed_t(640 + prx - 200, top + 157 + gold_y + training_back_y + pry + store_yy1, "NOT\nENOUGH\nCASH", 0.12, 0.12, 0, global.color_white, c_black); }
				draw_text_ext_transformed_t(640 + prx - 200, top + 157 + gold_y + training_back_y + pry + store_yy1, store_text[11], -1, 250, 0.12, 0.12, 0, global.color_white, c_black);
				}
			draw_text_ext_transformed_t(640 + prx - 200, top + 157 + gold_y + training_back_y + pry + store_yy1 - 135, gold_txt[1], -1, 1600, 0.11 * sg1, 0.11 * sg1, 0, global.color_white, c_black);
			draw_text_transformed_t(640 + prx - 200, top + 157 + gold_y + training_back_y + pry + store_yy1 + 100, string(gold_pri[1]) + "ç", 0.2 * sg1, 0.2 * sg1, 0, global.cash_color, c_black);
			}
		draw_sprite_ext(s_currency_buy, 7, 640 + prx, top + 157 + gold_y + training_back_y + pry + store_yy1 + 10, 0.5 * sg2, 0.5 * sg2, 0, c_black, 0.5);
		if gold_buy[2] = 0
			{
			draw_sprite_ext_t(s_currency_buy, 7, 640 + prx, top + 157 + gold_y + training_back_y + pry + store_yy1, 0.5 * sg2, 0.5 * sg2, 0, c_white, 1, c_white, c_black);
			draw_text_transformed_t(640 + prx, top + 157 + gold_y + training_back_y + pry + store_yy1 - 57, string(gold_val[2]), 0.18 * sg2, 0.18 * sg2, 0, global.gold_color, c_black);
			if global.cash < gold_pri[2]
				{
				draw_sprite_ext(s_currency_buy, 7, 640 + prx, top + 157 + gold_y + training_back_y + pry + store_yy1, 0.5 * sg2, 0.5 * sg2, 0, c_black, 0.5);
				//if os_get_language() = "ru"
				//	 { draw_text_transformed_t(640 + prx, top + 157 + gold_y + training_back_y + pry + store_yy1, "НЕТ\nСТОЛЬКО\nДЕНЕГ", 0.12, 0.12, 0, global.color_white, c_black); }
				//	 else
				//	{ draw_text_transformed_t(640 + prx, top + 157 + gold_y + training_back_y + pry + store_yy1, "NOT\nENOUGH\nCASH", 0.12, 0.12, 0, global.color_white, c_black); }
				draw_text_ext_transformed_t(640 + prx, top + 157 + gold_y + training_back_y + pry + store_yy1, store_text[11], -1, 250, 0.12, 0.12, 0, global.color_white, c_black);
				}
			draw_text_ext_transformed_t(640 + prx, top + 157 + gold_y + training_back_y + pry + store_yy1 - 135, gold_txt[2], -1, 1600, 0.11 * sg2, 0.11 * sg2, 0, global.color_white, c_black);
			draw_text_transformed_t(640 + prx, top + 157 + gold_y + training_back_y + pry + store_yy1 + 100, string(gold_pri[2]) + "ç", 0.2 * sg2, 0.2 * sg2, 0, global.cash_color, c_black);
			}
		draw_sprite_ext(s_currency_buy, 8, 640 + prx + 200, top + 157 + gold_y + training_back_y + pry + store_yy1 + 10, 0.5 * sg3, 0.5 * sg3, 0, c_black, 0.5);
		if gold_buy[3] = 0
			{
			draw_sprite_ext_t(s_currency_buy, 8, 640 + prx + 200, top + 157 + gold_y + training_back_y + pry + store_yy1, 0.5 * sg3, 0.5 * sg3, 0, c_white, 1, c_white, c_black);
			draw_text_transformed_t(640 + prx + 200, top + 157 + gold_y + training_back_y + pry + store_yy1 - 57, string(gold_val[3]), 0.18 * sg3, 0.18 * sg3, 0, global.gold_color, c_black);
			if global.cash < gold_pri[3]
				{
				draw_sprite_ext(s_currency_buy, 8, 640 + prx + 200, top + 157 + gold_y + training_back_y + pry + store_yy1, 0.5 * sg3, 0.5 * sg3, 0, c_black, 0.5);
				//if os_get_language() = "ru"
				//	{ draw_text_transformed_t(640 + prx + 200, top + 157 + gold_y + training_back_y + pry + store_yy1, "НЕТ\nСТОЛЬКО\nДЕНЕГ", 0.12, 0.12, 0, global.color_white, c_black); }
				//	else
				//	{ draw_text_transformed_t(640 + prx + 200, top + 157 + gold_y + training_back_y + pry + store_yy1, "NOT\nENOUGH\nCASH", 0.12, 0.12, 0, global.color_white, c_black); }
				draw_text_ext_transformed_t(640 + prx + 200, top + 157 + gold_y + training_back_y + pry + store_yy1, store_text[11], -1, 250, 0.12, 0.12, 0, global.color_white, c_black);
				}
			draw_text_ext_transformed_t(640 + prx + 200, top + 157 + gold_y + training_back_y + pry + store_yy1 - 135, gold_txt[3], -1, 1600, 0.11 * sg3, 0.11 * sg3, 0, global.color_white, c_black);
			draw_text_transformed_t(640 + prx + 200, top + 157 + gold_y + training_back_y + pry + store_yy1 + 100, string(gold_pri[3]) + "ç", 0.2 * sg3, 0.2 * sg3, 0, global.cash_color, c_black);
			}
		//draw_sprite_ext_t(s_currency_buy, 7, 640 + prx, top + 157 + gold_y + training_back_y + pry + store_yy1, 0.5 * sg2, 0.5 * sg2, 0, c_white, 1, c_white, c_black);
		//draw_text_transformed_t(640 + prx, top + 157 + gold_y + training_back_y + pry + store_yy1 - 135, gold_txt[2], 0.11 * sg2, 0.11 * sg2, 0, global.color_white, c_black);
		//draw_text_transformed_t(640 + prx, top + 157 + gold_y + training_back_y + pry + store_yy1 - 57, string(gold_val[2]), 0.18 * sg2, 0.18 * sg2, 0, global.gold_color, c_black);
		//draw_text_transformed_t(640 + prx, top + 157 + gold_y + training_back_y + pry + store_yy1 + 100, string(gold_pri[2]) + "ç", 0.2 * sg2, 0.2 * sg2, 0, global.cash_color, c_black);
		
		//draw_sprite_ext_t(s_currency_buy, 8, 640 + prx + 200, top + 157 + gold_y + training_back_y + pry + store_yy1, 0.5 * sg3, 0.5 * sg3, 0, c_white, 1, c_white, c_black);
		//draw_text_transformed_t(640 + prx + 200, top + 157 + gold_y + training_back_y + pry + store_yy1 - 135, gold_txt[3], 0.11 * sg3, 0.11 * sg3, 0, global.color_white, c_black);
		//draw_text_transformed_t(640 + prx + 200, top + 157 + gold_y + training_back_y + pry + store_yy1 - 57, string(gold_val[3]), 0.18 * sg3, 0.18 * sg3, 0, global.gold_color, c_black);
		//draw_text_transformed_t(640 + prx + 200, top + 157 + gold_y + training_back_y + pry + store_yy1 + 100, string(gold_pri[3]) + "ç", 0.2 * sg3, 0.2 * sg3, 0, global.cash_color, c_black);
		
		//////
		////////ПОКУПКА ГОЛДЫ
		
		/////
		#region Свайпы
		if mouse_check_button(mb_left) && gold_buy[1] = 0 && gold_buy[2] = 0 && gold_buy[3] = 0
		&& point_in_rectangle(mouse_x, mouse_y, 0, global.size / 2 - 270, 1280, global.size / 2 + 270)
			{
			if (gold_buy[1] = 0 && gold_buy[2] = 0 && gold_buy[3] = 0 && lootbox_buy[1] = 0 && lootbox_buy[2] = 0 && daily_buy[1] = 0 && daily_buy[2] = 0 && daily_buy[3] = 0)
				{
				if store_yy = 0
					{ store_yy = store_yy1 - mouse_y; }
				var totemy;
				totemy = store_yy1;
				store_yy1 = store_yy + mouse_y;
			
				if store_yy1 > 200
					{ store_yy1 = 200; }
				if store_yy1 < -1700 - y_ind
					{ store_yy1 = -1700 - y_ind; }
			
				if store_yy1 != totemy
					{ store_pr = 0; store_tap = 0; }
			
				if abs(store_yy1 - totemy) > 50
					{
					hold_dr = sign(store_yy1 - totemy);
					hold_sp = abs(totemy - store_yy1) / 2;
					hold_ti = room_speed / 4;
					hold_do = (hold_sp / 2) / 20;
					}
				if hold_ti > 0
					{ hold_ti -= 1; }
					else
					{ hold_sp = 0; }
				}
			}
			else
			{
			store_tap = 1;
			store_yy = 0;
			
			if abs(hold_sp) > 0
				{
				if hold_dr = 1
					{
					store_yy1 += hold_sp;
					hold_sp -= hold_do;
					if hold_sp < 0
						{ hold_sp = 0  }
					}
				if hold_dr = -1
					{
					store_yy1 -= hold_sp;
					hold_sp -= hold_do;
					if hold_sp < 0
						{ hold_sp = 0; }
					}
				if store_yy1 > 100
					{ hold_sp = 0; }
				if store_yy1 < -1650 - y_ind
					{ hold_sp = 0; }
				}
				else
				{
				if store_yy1 > 0
					{ store_yy1 -= 10; }
				if store_yy1 < -1540 - y_ind
					{ store_yy1 += 10; }
				}
			}
		#endregion
	#endregion
	///////
	var top;
	top = sprite_get_height(s_training_back) * ((sprite_get_height(s_training_back) / sprite_get_width(s_training_back)) - (global.size / 1280)) / 2;
	
	draw_sprite_part_ext(s_store_back, 0, 0, top, sprite_get_width(s_store_back), sprite_get_height(s_store_back) - top, 0, training_back_y, global.back_scale, global.back_scale, c_white, 1);
	
	var yh, col;
	yh = 0;
	col = make_color_rgb(242, 232, 201);
	if global.size < 700
		{ yh = 30; }
	
	if point_in_rectangle(mouse_x, mouse_y, 0, global.size - 250, 250, global.size)
	&& (gold_buy[1] = 0 && gold_buy[2] = 0 && gold_buy[3] = 0 && lootbox_buy[1] = 0 && lootbox_buy[2] = 0 && daily_buy[1] = 0 && daily_buy[2] = 0 && daily_buy[3] = 0)
		{
		//// КЛАЦ
		if mouse_check_button_pressed(mb_left)
			{
			if global.sound
				{ audio_play_sound(sd_text, 2, 0); }
			}
		//// КЛАЦ
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
		
	draw_set_font(global.game_font);
	//if os_get_language() != "ru"
	//	{
	//	draw_text_transformed_t(1024, global.size / 2 + training_back_y, "S\nT\nO\nR\nE", 0.25, 0.25, 0, col, c_black);
	//	draw_text_transformed_t(256, global.size / 2 + training_back_y, "S\nT\nO\nR\nE", 0.25, 0.25, 0, col, c_black);	
	//	}
	//	else
	//	{
	//	draw_text_transformed_t(1024, global.size / 2 + training_back_y + 30, "М\nА\nГ\nА\nЗ\nИ\nН", 0.25, 0.25, 0, col, c_black);
	//	draw_text_transformed_t(256, global.size / 2 + training_back_y + 30, "М\nА\nГ\nА\nЗ\nИ\nН", 0.25, 0.25, 0, col, c_black);	
	//	}
	draw_text_ext_transformed_t(1024, global.size / 2 + training_back_y, store_text[12], -1, 250, 0.25, 0.25, 0, col, c_black);
	draw_text_ext_transformed_t( 256, global.size / 2 + training_back_y, store_text[12], -1, 250, 0.25, 0.25, 0, col, c_black);
	
	draw_sprite_ext(s_store_weel, 2, 15, global.size + training_back_y - 10 + yh / 3 + pry + 10, global.back_scale, global.back_scale, wl_ang, c_black, 0.5);
	draw_sprite_ext_t(s_store_weel, 2, 0 + prx, global.size + training_back_y - 10 + yh / 3 + pry, global.back_scale, global.back_scale, wl_ang, c_white, 1, c_white, c_black);
	
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
	
	draw_sprite_ext(s_store_back, 3, 640, global.size / 2 + 1300 * global.back_scale / 1.5 - training_back_y + pry * 0.5 + sc_angle + 10, global.back_scale, global.back_scale, 0, c_black, 0.5);
	draw_sprite_ext_t(s_store_back, 3, 640 + prx, global.size / 2 + 1300 * global.back_scale / 1.5 - training_back_y + pry * 0.5 + sc_angle/* global.size + top - training_back_y + pry * 0.5 + sc_angle * 2 - 27*/, global.back_scale, global.back_scale, 0, c_white, 1, c_white, c_black);
	
	if point_in_rectangle(mouse_x, mouse_y, 280, global.size + top - 100 - 1200 * global.back_scale - 27, 1000, global.size + top + 500 - 1200 * global.back_scale - 27)
	&& (gold_buy[1] = 0 && gold_buy[2] = 0 && gold_buy[3] = 0 && lootbox_buy[1] = 0 && lootbox_buy[2] = 0 && daily_buy[1] = 0 && daily_buy[2] = 0 && daily_buy[3] = 0)
		{
		if mouse_check_button_pressed(mb_left)
			{
			sc_spd   = 2;
			sc_dist  = 10;
			}
		}
	if point_in_rectangle(mouse_x, mouse_y, 0, 0, 100, 100)
	&& (gold_buy[1] = 0 && gold_buy[2] = 0 && gold_buy[3] = 0 && lootbox_buy[1] = 0 && lootbox_buy[2] = 0 && daily_buy[1] = 0 && daily_buy[2] = 0 && daily_buy[3] = 0)
		{
		if mouse_check_button_pressed(mb_left)
			{
			//// КЛАЦ
			if mouse_check_button_pressed(mb_left)
				{
				if global.sound
					{ audio_play_sound(sd_text, 2, 0); }
				}
			//// КЛАЦ
			hold_sp   = 0;
			hold_ti   = 0;
			hold_dr   = 1;
			hold_do   = 1;
			
			store_yy  = 0;
			store_yy1 = 0;
			global.menu_next = "main";
			}
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
		
		draw_text_transformed_t(640 - string_width(string(global.gold) + "©") / 2 * menu_txt_s + (string_width(string(global.gold) + "©") - string_width(string(global.cash) + "ç")) / 2 * menu_txt_s, global.size / 2 - 300 + 50 - training_back_y + pry * 0.5 + sc_angle , string(global.gold) + "©", menu_txt_s, menu_txt_s, 0, global.gold_color, c_black);
		
		//640 - (string_width(txt_gold) * 0.18 / 2 - 5) + (string_width(txt_gold) - string_width(txt_cash)) * 0.18 / 2
		draw_text_transformed_t(640 + string_width(string(global.cash) + "ç") / 2 * menu_txt_s + (string_width(string(global.gold) + "©") - string_width(string(global.cash) + "ç")) / 2 * menu_txt_s, /* top + popka + 150*/  global.size / 2 - 300 + 50 - training_back_y + pry * 0.5 + sc_angle , string(global.cash) + "ç", menu_txt_s, menu_txt_s, 0, global.cash_color, c_black);
		
	// ЗОЛОТО И КЭШ
	
	#region Золото поверх
		////////// ЗОЛОТО ПОВЕРХ
		for(i=1;i<=3;i++)
			{
			if gold_buy[i] = 1 // && gold_buy_s[1] != 0
				{
				var upsc, minn, miny;
				upsc = 1.5;
				minn = 0.7;
				miny = 30;
				draw_set_alpha(0.7);
				draw_rectangle_color(0, -100, 1280, global.size + training_back_y + 10, c_black, c_black, c_black, c_black, 0);
				draw_set_alpha(1);
				
				draw_sprite_ext_t(s_currency_buy, 5 + i, 640, global.size / 2, 0.5 * sg1 * upsc, 0.5 * sg1 * upsc, 0, c_white, 1, c_white, c_black);
				//draw_sprite_ext_t(s_buy, 5 + i, 640, global.size / 2 + 90, 0.45 * upsc * 0.85, 0.45 * gold_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
				
				//draw_text_transformed_t(640, global.size / 2 - 135, gold_txt[i], 0.11 * sg1 * upsc, 0.11 * sg1 * upsc, 0, global.color_white, c_black);
				//draw_text_transformed_t(640, global.size / 2 - 57, string(gold_val[i]), 0.18 * sg1 * upsc, 0.18 * sg1 * upsc, 0, global.gold_color, c_black);
				
				//if os_get_language() = "ru"
				//	{
				//	draw_sprite_ext_t(s_buy, 2, 640, global.size / 2 + 90 + 60 + 70 - 25, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85 + 25, 0, c_white, 1, c_white, c_black);
				//	draw_text_transformed_t(640 + string_width("КУПИТЬ") * 0.18 * lbs1 * upsc / 3 - 20 - 20, global.size / 2 + 140 + 60 + 70 + xxxx, "КУПИТЬ", 0.18 * lbs1 * upsc * minn, 0.18 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.cash_color, c_black);
				//	draw_text_transformed_t(640 - string_width("50ç") * 0.2 * lbs1 * upsc / 2 + 10 - 60, global.size / 2 + 140 + 60 + 70 + xxxx, "50ç", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.cash_color, c_black);
				//	}
				//	else
				//	{
				//	draw_sprite_ext_t(s_buy, 1, 640, global.size / 2 + 90 + 60 + 70, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
				//	draw_text_transformed_t(640 + string_width("BUY") * 0.2 * lbs1 * upsc / 2 - 20, global.size / 2 + 140 + 60 + 70, "BUY", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.cash_color, c_black);
				//	draw_text_transformed_t(640 - string_width("50ç") * 0.2 * lbs1 * upsc / 2 + 10, global.size / 2 + 140 + 60 + 70/*+ 60*/, "50ç", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.cash_color, c_black);
				//	}
				
				//if os_get_language() = "ru"
				//	{
				//	draw_sprite_ext_t(s_buy, 2, 640, global.size / 2 + 90, 0.45 * upsc * 0.85, 0.45 * gold_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
				//	draw_text_transformed_t(640/* - string_width(string(gold_pri[i]) + "ç КУПИТЬ") * 0.18 * sg1 * upsc / 2 - 20 - 170*/, global.size / 2 + 140, string(gold_pri[i]) + "ç КУПИТЬ", 0.18 * sg1 * upsc * minn, 0.18 * sg1 * upsc * gold_buy_s[i] * minn, 0, global.cash_color, c_black);
				//	//draw_text_transformed_t(640 - string_width(string(gold_pri[i]) + "ç") * 0.2 * sg1 * upsc / 2 - 20, global.size / 2 + 140, string(gold_pri[i]) + "ç", 0.2 * sg1 * upsc * minn, 0.2 * sg1 * upsc * gold_buy_s[i] * minn, 0, global.cash_color, c_black);
				//	}
				//	else
				//	{
				//	draw_sprite_ext_t(s_buy, i - 1, 640, global.size / 2 + 90, 0.45 * upsc * 0.85, 0.45 * gold_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
				//	draw_text_transformed_t(640/* - string_width(string(gold_pri[i]) + "ç BUY") * 0.2 * sg1 * upsc / 2 - 20*/, global.size / 2 + 140, string(gold_pri[i]) + "çBUY", 0.2 * sg1 * upsc * minn, 0.2 * sg1 * upsc * gold_buy_s[i] * minn, 0, global.cash_color, c_black);
				//	//draw_text_transformed_t(640 - string_width(string(gold_pri[i]) + "ç") * 0.2 * sg1 * upsc / 2, global.size / 2 + 140, string(gold_pri[i]) + "ç", 0.2 * sg1 * upsc * minn, 0.2 * sg1 * upsc * gold_buy_s[i] * minn, 0, global.cash_color, c_black);
				//	}
				draw_sprite_ext_t(s_buy, i - 1, 640, global.size / 2 + 90, 0.45 * upsc * 0.85, 0.45 * gold_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
				draw_text_transformed_t(640, global.size / 2 + 140, string(gold_pri[i]) + "ç" + store_text[13], 0.2 * sg1 * upsc * minn, 0.2 * sg1 * upsc * gold_buy_s[i] * minn, 0, global.cash_color, c_black);
				
				if mouse_check_button_pressed(mb_left)
					{
					//// КЛАЦ
					if mouse_check_button_pressed(mb_left)
						{
						if global.sound
							{ audio_play_sound(sd_text, 2, 0); }
						}
					//// КЛАЦ
					if point_in_rectangle(mouse_x, mouse_y, 640 - 150, global.size / 2 + 160 - 60, 640 + 150, global.size / 2 + 160 + 80) && gold_buy_s[i] = 1 
						{
						if global.cash >= gold_pri[i]
							{
							global.gold += gold_val[i];
							global.cash -= gold_pri[i];
							ini_open("Music.ini");
								ini_write_string("Sounds", "sound_on_g", string(global.gold));
								ini_write_string("Sounds", "sound_false_c", string(global.cash));
							ini_close();
							gold_buy[i] = 0;
							if global.sound { audio_play_sound(sd_gold, 3, 0); }
							}
							else
							{ gold_noten[i] = room_speed * 2; gold_buy[i] = 0; }
						}
						else
						{ gold_buy[i] = 0; }
					io_clear();
					//if os_get_language() = "ru"
					//	{
					//	draw_sprite_ext_t(s_buy, 2, 640, global.size / 2 + 90 + 60 + 70 - 25, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85 + 25, 0, c_white, 1, c_white, c_black);
					//	draw_text_transformed_t(640 + string_width("КУПИТЬ") * 0.18 * lbs1 * upsc / 3 - 20 - 20, global.size / 2 + 140 + 60 + 70 + xxxx, "КУПИТЬ", 0.18 * lbs1 * upsc * minn, 0.18 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.gold_color, c_black);
					//	draw_text_transformed_t(640 - string_width("50ç") * 0.2 * lbs1 * upsc / 2 + 10 - 60, global.size / 2 + 140 + 60 + 70 + xxxx, "50ç", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.gold_color, c_black);
					//	}
					//	else
					//	{
					//	draw_sprite_ext_t(s_buy, 1, 640, global.size / 2 + 90 + 60 + 70, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
					//	draw_text_transformed_t(640 + string_width("BUY") * 0.2 * lbs1 * upsc / 2 - 20, global.size / 2 + 140 + 60 + 70, "BUY", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.gold_color, c_black);
					//	draw_text_transformed_t(640 - string_width("50ç") * 0.2 * lbs1 * upsc / 2 + 10, global.size / 2 + 140 + 60 + 70/*+ 60*/, "50ç", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.gold_color, c_black);
					//	}
					}
				}
			}
		////////// ЗОЛОТО ПОВЕРХ
	#endregion
	#region Лутбоксы поверх
		////////// ЛУТБОКСЫ ПОВЕРХ
		var upsc, minn, miny, heror, xxxx;
		upsc = 1.5;
		minn = 0.7;
		miny = 30;
		heror = "1234567";
		if global.size <= 640
			{ xxxx = - 20; }
			else
			{ xxxx = 0; }
		var nizco;
		nizco = 60;
		for(i=1;i<=2;i++)
			{
			if lootbox_buy[i] > 0
				{
				#region Деревянный сундук
				if i = 1
					{
					draw_set_alpha(0.75 + lootbox_alpha);
					draw_rectangle_color(0, -100 + training_back_y, 1280, global.size + training_back_y + 10, c_black, c_black, c_black, c_black, 0);
					draw_set_alpha(1);
					
					//draw_set_alpha(0.5);
					//draw_rectangle_color(0, global.size / 2 - 120 + 65 - 50 - nizco, 1280, global.size / 2 - 120 + 65 + 200 + 70 - nizco, c_black, c_black, c_black, c_black, 0);
					//draw_set_alpha(1);
					if lootbox_buy[i] = 1
						{
						///////////
						
						draw_set_alpha(0.5);
						draw_rectangle_color(0, global.size / 2 - nizco - 120 + 65 - 50, 1280, global.size / 2 - nizco - 120 + 65 + 200 + 70, c_black, c_black, c_black, c_black, 0);
						draw_set_alpha(1);
						
						//if os_get_language() = "ru"
						//	{
						//	draw_sprite_ext_t(s_menu_buttons, 1, 640 - 10 - 180 * 3 + 15, global.size / 2 - nizco - 120 + 65 + 50, 0.6, 0.6, 0, c_white, 1, c_white, c_black);
						//	draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65, "ГЕРОИ", 0.2, 0.2, 5, global.color_white, c_black);
						//	draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65 + 50, "ШАНС 75%", 0.12, 0.12, 5, global.color_white, c_black);
							
						//	draw_sprite_ext_t(s_menu_buttons, 2, 640 - 10 - 180 * 3 + 15, global.size / 2 - nizco - 120 + 65+ 150 + 50, 0.6, 0.6, 0, c_white, 1, c_white, c_black);
						//	draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65 + 150, "ТОТЕМЫ", 0.2, 0.2, 5, global.color_white, c_black);
						//	draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65 + 150 + 50, "ШАНС 25%", 0.12, 0.12, 5, global.color_white, c_black);
						//	}
						//	else
						//	{
						//	draw_sprite_ext_t(s_menu_buttons, 1, 640 - 10 - 180 * 3 + 15, global.size / 2 - nizco - 120 + 65 + 50, 0.6, 0.6, 0, c_white, 1, c_white, c_black);
						//	draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65, "HEROES", 0.2, 0.2, 5, global.color_white, c_black);
						//	draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65 + 50, "CHANCE 75%", 0.12, 0.12, 5, global.color_white, c_black);
							
						//	draw_sprite_ext_t(s_menu_buttons, 2, 640 - 10 - 180 * 3 + 15, global.size / 2 - nizco - 120 + 65+ 150 + 50, 0.6, 0.6, 0, c_white, 1, c_white, c_black);
						//	draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65 + 150, "TOTEMS", 0.2, 0.2, 5, global.color_white, c_black);
						//	draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65 + 150 + 50, "CHANCE 25%", 0.12, 0.12, 5, global.color_white, c_black);
						//	}
						draw_sprite_ext_t(s_menu_buttons, 1, 640 - 10 - 180 * 3 + 15, global.size / 2 - nizco - 120 + 65 + 50, 0.6, 0.6, 0, c_white, 1, c_white, c_black);
						draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65, store_text[15], 0.2, 0.2, 5, global.color_white, c_black);
						draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65 + 50, store_text[16] + " 75%", 0.12, 0.12, 5, global.color_white, c_black);
						
						draw_sprite_ext_t(s_menu_buttons, 2, 640 - 10 - 180 * 3 + 15, global.size / 2 - nizco - 120 + 65+ 150 + 50, 0.6, 0.6, 0, c_white, 1, c_white, c_black);
						draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65 + 150, store_text[17], 0.2, 0.2, 5, global.color_white, c_black);
						draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65 + 150 + 50, store_text[16] + " 25%", 0.12, 0.12, 5, global.color_white, c_black);
						//////////////
						
						///////////////
						//draw_set_alpha(0.4);
						//draw_rectangle_color(1280 - 400, global.size / 2 - 120 + 65 - 50, 1280, global.size / 2 - 120 + 65 + 200 + 70, c_black, c_black, c_black, c_black, 0);
						//draw_set_alpha(1);
						
						//if os_get_language() != "ru"
						//	{
						//	draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 20, "RARITY\nCHANCES:", 0.2, 0.2, 5, global.color_white, c_black);
							
						//	draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20, "LEGENDARY - 5%", 0.12, 0.12, 5, c_orange, c_black);
						//	draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 3, "EPIC - 15%", 0.12, 0.12, 5, c_fuchsia, c_black);
						//	draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 5, "RARE - 30%", 0.12, 0.12, 5, c_aqua, c_black);
						//	draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 7, "COOMON - 50%", 0.12, 0.12, 5, c_white, c_black);
						//	}
						//	else
						//	{
						//	draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 20, "ШАНСЫ\nНАЙТИ:", 0.2, 0.2, 5, global.color_white, c_black);
							
						//	draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20, text_tot[4] + " - 5%", 0.12, 0.12, 5, c_orange, c_black);
						//	draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 3, text_tot[3] + " - 15%", 0.12, 0.12, 5, c_fuchsia, c_black);
						//	draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 5, text_tot[2] + " - 30%", 0.12, 0.12, 5, c_aqua, c_black);
						//	draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 7, text_tot[1] + " - 50%", 0.12, 0.12, 5, c_white, c_black);
						//	}
						draw_text_ext_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 20, store_text[18], -1, 250, 0.2, 0.2, 5, global.color_white, c_black);
						
						draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20, text_tot[4] + " - 5%", 0.12, 0.12, 5, c_orange, c_black);
						draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 3, text_tot[3] + " - 15%", 0.12, 0.12, 5, c_fuchsia, c_black);
						draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 5, text_tot[2] + " - 30%", 0.12, 0.12, 5, c_aqua, c_black);
						draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 7, text_tot[1] + " - 50%", 0.12, 0.12, 5, c_white, c_black);
						//////////////
						
						//if os_get_language() = "ru"
						//	{ draw_text_transformed_t(640, global.size / 2 - nizco + 140 + 60 - 80 + 70 - 210 - 100 + 80, "*2 ВЕЩЕЙ", 0.2, 0.2, 5, global.gold_color, c_black); }
						//	else
						//	{ draw_text_transformed_t(640, global.size / 2 - nizco + 140 + 60 - 80 + 70 - 210 - 100 + 80, "*2 ITEMS", 0.2, 0.2, 5, global.gold_color, c_black); }
						draw_text_transformed_t(640, global.size / 2 - nizco + 140 + 60 - 80 + 70 - 210 - 100 + 80, "*2 " + store_text[19], 0.2, 0.2, 5, global.gold_color, c_black);
						draw_sprite_ext_t(s_lootbox1, 0, 640 - 10, global.size / 2 - nizco - 120 + 65 + 70, 0.25 * lbs1 * upsc, 0.25 * lbs1 * upsc, 0, c_white, 1, c_white, c_black);
						
						//if os_get_language() = "ru"
						//	{ draw_text_transformed_t(640, global.size / 2 - nizco + 140 + 60 - 80 + 70 - 210 - 100, "ОБЫЧНЫЙ ЯЩИК", 0.15 * lbs1 * upsc, 0.15 * lbs1 * upsc, 5, global.color_white, c_black); }
						//	else
						//	{ draw_text_transformed_t(640, global.size / 2 - nizco + 140 + 60 - 80 + 70 - 210 - 100, "WOOD BOX", 0.2 * lbs1 * upsc, 0.2 * lbs1 * upsc, 5, global.color_white, c_black); }
						draw_text_transformed_t(640, global.size / 2 - nizco + 140 + 60 - 80 + 70 - 210 - 100, store_text[2], 0.2 * lbs1 * upsc, 0.2 * lbs1 * upsc, 5, global.color_white, c_black);
						//draw_text_transformed_t(640, global.size / 2 - 57, string(gold_val[i]), 0.18 * sg1 * upsc, 0.18 * sg1 * upsc, 0, global.gold_color, c_black);
						
						if global.gold < 100
							{
							//if os_get_language() = "ru"
							//	{
							//	draw_sprite_ext_t(s_buy, 2, 640 - 25, global.size / 2 - nizco + 90 + 60 + 70 + xxxx, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
							//	draw_text_transformed_t(640 - 25, global.size / 2 - nizco + 140 + 60 + 70 + xxxx, "БОЛЬШЕ©", 0.18 * lbs1 * upsc * minn, 0.18 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.gold_color, c_black);
							//	}
							//	else
							//	{
							//	draw_sprite_ext_t(s_buy, 2, 640 - 25, global.size / 2 - nizco + 90 + 60 + 70 + xxxx, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
							//	draw_text_transformed_t(640 - 25, global.size / 2 + 140 - nizco + 60 + 70 + xxxx, "GET MORE©", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.gold_color, c_black);
							//	}
							draw_sprite_ext_t(s_buy, 2, 640 - 25, global.size / 2 - nizco + 90 + 60 + 70 + xxxx, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
								draw_text_transformed_t(640 - 25, global.size / 2 - nizco + 140 + 60 + 70 + xxxx, store_text[14] + "©", 0.18 * lbs1 * upsc * minn, 0.18 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.gold_color, c_black);
							}
							else
							{
							//if os_get_language() = "ru"
							//	{
							//	draw_sprite_ext_t(s_buy, 2, 640 - 25, global.size / 2 - nizco + 90 + 60 + 70 + xxxx, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
							//	draw_text_transformed_t(640 - 25/* + string_width("100© КУПИТЬ") * 0.18 * lbs1 * upsc / 2 - 20 - 20*/, global.size / 2 - nizco + 140 + 60 + 70 + xxxx, "100© КУПИТЬ", 0.18 * lbs1 * upsc * minn, 0.18 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.gold_color, c_black);
							//	//draw_text_transformed_t(640 - string_width("100©") * 0.2 * lbs1 * upsc / 2 + 10 - 60, global.size / 2 + 140 + 60 + 70 + xxxx, "100©", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.gold_color, c_black);
							//	}
							//	else
							//	{
							//	draw_sprite_ext_t(s_buy, 1, 640 - 25, global.size / 2 - nizco + 90 + 60 + 70 + xxxx, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
							//	draw_text_transformed_t(640 - 25/* + string_width("100© BUY") * 0.2 * lbs1 * upsc / 2 - 20*/, global.size / 2 + 140 - nizco + 60 + 70 + xxxx, "100©BUY", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.gold_color, c_black);
							//	//draw_text_transformed_t(640 - string_width("100©") * 0.2 * lbs1 * upsc / 2 + 10, global.size / 2 + 140 + 60 + 70/*+ 60*/, "100©", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.gold_color, c_black);
							//	}
							draw_sprite_ext_t(s_buy, 1, 640 - 25, global.size / 2 - nizco + 90 + 60 + 70 + xxxx, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
							draw_text_transformed_t(640 - 25, global.size / 2 + 140 - nizco + 60 + 70 + xxxx, "100©" + store_text[13], 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.gold_color, c_black);
							///////
							#region Рука
								if (global.hand_gold && global.gold >= 100)
									{
									if hand_i < 10
										{ hand_i += 0.4; }
										else
										{ hand_i = 0; }
									draw_sprite_ext(s_training_hand, hand_i, 640 - 25, global.size / 2 - nizco + 90 + 60 + 70 + xxxx + 70, 1, 1, 0, c_black, 0.5);
									draw_sprite_ext_t(s_training_hand, hand_i, 640 - 25, global.size / 2 - nizco + 90 + 60 + 70 + xxxx + 70, 1, 1, 0, global.color_white, 1, global.color_white, c_black);
									}
							#endregion
							///////
							}
						//////
						//if global.gold < 100
						//	{
						//	if os_get_language() = "ru"
						//		{
						//		draw_sprite_ext(s_buy, 2, 640 - 25, global.size / 2 - nizco + 90 + 60 + 70 + xxxx, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_black, 0.4);
						//		}
						//		else
						//		{
						//		draw_sprite_ext(s_buy, 1, 640 - 25, global.size / 2 - nizco + 90 + 60 + 70 + xxxx, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_black, 0.4);
						//		}
						//	}
						////////
						if mouse_check_button_pressed(mb_left)
							{
							if point_in_rectangle(mouse_x, mouse_y, 640 - 150 - 20 - 30, global.size / 2 - nizco + 160 - 80 + 60 + 70, 640 + 150 + 20 + 30, global.size / 2 - nizco + 160 + 80 + 60 + 70) && lootbox_buy_s[i] = 1 
								{
								//// КЛАЦ
								if global.sound
									{ audio_play_sound(sd_text, 2, 0); }
								//// КЛАЦ
								if global.gold >= 100
									{
									ini_open("Music.ini");
										if global.hand_gold = 1
											{
											ini_write_string("Hand", "gold", "0");
											global.hand_gold = ini_read_real("Hand", "gold", 0);
											}
										global.gold -= 100;
										ini_write_string("Sounds", "sound_on_g", string(global.gold));
									ini_close();
									lootbox_buy[i] = 2;
									lootbox_s = 0;
									}
									else
									{
									lootbox_buy[i] = 0;
									store_yy1 = -1540;
									}
								}
								else
								{ lootbox_buy[i] = 0; }
							io_clear();
							}
						}
					if lootbox_buy[i] = 2
						{
						if lootbox_s = 0
							{
							for(j=1;j<=2;j++)
								{
								var rand, tr;
								rand = irandom_range(1, 100);
								
								if rand <= 50
									{ tr = 1; }
								if rand > 50 && rand <= 80
									{ tr = 2; }
								if rand > 80 && rand <= 95
									{ tr = 3; }
								if rand > 95
									{ tr = 4; }
								
								lootbox_item_t[j] = choose(0, 1, 1, 1);
							
								if lootbox_item_t[j] = 0
									{
									var ta;
									ta = 0;
									for(l=1;l<=18;l++)
										{ ta += global.totem_have[l]; }
									
									if ta = 18
										{ lootbox_item_t[j] = 1; }
									}
							
								if lootbox_item_t[j] = 1
									{
									#region Листовки
										if tr = 1
											{ lootbox_item_c[j] = global.color_white; lootbox_item_v[j] = 2; }
										if tr = 2
											{ lootbox_item_c[j] = c_aqua; lootbox_item_v[j] = 4; }
										if tr = 3
											{ lootbox_item_c[j] = c_fuchsia; lootbox_item_v[j] = 8; }
										if tr = 4
											{ lootbox_item_c[j] = c_orange; lootbox_item_v[j] = 16; }
										
										var ran;
										ran = irandom_range(1, string_length(heror));
										lootbox_item_i[j] = real(string_copy(heror, ran, 1));
										heror = string_delete(heror, ran, 1);
										
										levelup[j] = global.heroes_have[lootbox_item_i[j]];
										
										if hero_now1[lootbox_item_i[j]] + lootbox_item_v[j]/* + 1*/ >= hero_need[lootbox_item_i[j]]
											{ lvlup[j] = 1; }
											else
											{ lvlup[j] = 0; }
										
										global.heroes_have[lootbox_item_i[j]] += lootbox_item_v[j];
										ini_open("Music.ini");
											ini_write_string("Heroes", "heroes" + string(lootbox_item_i[j]), string(global.heroes_have[lootbox_item_i[j]]));
										ini_close();
									#endregion
									}
									else
									{
									#region Рандом тотемов
										var ti, totems;
										totems = "";
										while(totems = "")
											{
											#region Первый
												if tr = 1
													{
													totems = "";
													for(i=1;i<=6;i++)
														{
														if global.totem_have[i] = 0
															{ totems += string(i); }
														}
													if totems = ""
														{ tr = 2; }
													}
											#endregion
											#region Второй
												if tr = 2
													{
													totems = "";
													for(i=1;i<=5;i++)
														{
														if global.totem_have[i+6] = 0
															{ totems += string(i); }
														}
													if totems = ""
														{ tr = 3; }
													}
											#endregion
											#region Третий
												if tr = 3
													{
													totems = "";
													for(i=1;i<=4;i++)
														{
														if global.totem_have[i+11] = 0
															{ totems += string(i); }
														}
													if totems = ""
														{ tr = 4; }
													}
											#endregion
											#region Четвёртый
												if tr = 4
													{
													totems = "";
													for(i=1;i<=3;i++)
														{
														if global.totem_have[i+15] = 0
															{ totems += string(i); }
														}
													if totems = ""
														{ tr = 1; }
													}
											#endregion
											}
										
										ti = irandom_range(1, string_length(totems));
										if tr = 1
											{ lootbox_item_i[j] = real(string_copy(totems, ti, 1)); }
										if tr = 2
											{ lootbox_item_i[j] = 6 + real(string_copy(totems, ti, 1)); }
										if tr = 3
											{ lootbox_item_i[j] = 11 + real(string_copy(totems, ti, 1)); }
										if tr = 4
											{ lootbox_item_i[j] = 15 + real(string_copy(totems, ti, 1)); }
										
										ini_open("Music.ini");
											ini_write_string("Totems", "totem" + string(lootbox_item_i[j]), "1");
											ini_write_string("Totems", "totem_n" + string(lootbox_item_i[j]), "1");
											global.totem_have[lootbox_item_i[j]] = 1;
											global.totem_new[lootbox_item_i[j]]  = ini_read_real("Totems", "totem_n" + string(lootbox_item_i[j]), 0);
										ini_close();
										
										if lootbox_item_i[j] <= 6
											{ lootbox_item_c[j] = global.color_white; }
										if lootbox_item_i[j] > 6 && lootbox_item_i[j] <= 11
											{ lootbox_item_c[j] = c_aqua; }
										if lootbox_item_i[j] > 11 && lootbox_item_i[j] <= 15
											{ lootbox_item_c[j] = c_fuchsia; }
										if lootbox_item_i[j] > 15
											{ lootbox_item_c[j] = c_orange; }
									#endregion
									}
								}
							
							lootbox_s = 1;
							}
						if lootbox_s = 1
							{
							if lootbox_alpha < 0.15
								{
								lootbox_alpha += 0.05;
								if lootbox_alpha >= 0.15
									{
									if global.sound
										{ audio_play_sound(sd_lootbox, 2, 0); }
									}
								}
								else
								{
								if lootbox_i < 18
									{ lootbox_i += 0.5; }
									else
									{ lootbox_s = 2; lootbox_i = 18; }
								}
							}
						if lootbox_s = 2
							{
							if lootbox_i < 22
								{ lootbox_i += 0.5; }
								else
								{ lootbox_i = 22; }
							if lootbox_aa < 2
								{
								lootbox_aa += 0.2;
								}
								else
								{ lootbox_s = 3; lootbox_aa = 2; }
							}
						if lootbox_s = 3
							{
							if lootbox_aa > 0
								{
								lootbox_aa -= 0.25;
								}
								else
								{ lootbox_aa = 0; }
						
							if lootbox_item_s[1] < 1
								{
								lootbox_item_s[1] += 0.1;
								lootbox_item_x[1] += 30;
								lootbox_item_y[1] -= 2;
								}
								else
								{
								if lootbox_item_s[2] < 1
									{
									lootbox_item_s[2] += 0.1;
									lootbox_item_x[2] += 30;
									lootbox_item_y[2] -= 2;
									}
									else
									{ lootbox_s = 4; }
								}
						
							}
						if lootbox_s = 4
							{
							if mouse_check_button_released(mb_left)
								{
								//// КЛАЦ
								if global.sound
									{ audio_play_sound(sd_text, 2, 0); }
								//// КЛАЦ
								if mouse_x < 640
									{
									if lootbox_item_o[1] = 0
										{ lootbox_item_o[1] = 1; lootbox_item_ss[1] = 3; }
									}
									else
									{
									if lootbox_item_o[2] = 0
										{ lootbox_item_o[2] = 1; lootbox_item_ss[2] = 3; }
									}
								}
							}
					
						if lootbox_item_o[1] = 1
							{
							if lootbox_item_ss[1] > 1
								{ lootbox_item_ss[1] -= 0.2; }
								else
								{ lootbox_item_o[1] = 2; lootbox_item_ss[1]= 1; }
							}
						if lootbox_item_o[2] = 1
							{
							if lootbox_item_ss[2] > 1
								{ lootbox_item_ss[2] -= 0.2; }
								else
								{ lootbox_item_o[2] = 2; lootbox_item_ss[2] = 1; }
							}
					
						if lootbox_item_o[1] = 2 && lootbox_item_o[2] = 2
							{
							if mouse_check_button_released(mb_left)
								{
								lootbox_buy[i] = 0;
								#region Обнуление BUY
									lootbox_alpha = 0; // Темный фон
									lootbox_aa = 0; // Альфа вспышки
									
									lootbox_s = 0; // Стейдж
									lootbox_a = 0; // Угол
									lootbox_d = 1; // Направление угла
									lootbox_t = 0; // Время тряски
									lootbox_i = 0; // Индекс кадра для анимации
									
									/////////
									theme_a1[1] = 0;
									theme_x1[1] = 0;
									theme_y1[1] = 0;
									
									theme_a1[2] = 0;
									theme_x1[2] = 0;
									theme_y1[2] = 0;
									
									theme_a1[3] = 0;
									theme_x1[3] = 0;
									theme_y1[3] = 0;
									//////
									
									lootbox_item_s[1] = 0;
									lootbox_item_s[2] = 0;
									lootbox_item_s[3] = 0; /// Скейл ?
									
									lootbox_item_ss[1] = 0;
									lootbox_item_ss[2] = 0;
									lootbox_item_ss[3] = 0; /// Скейл I
									
									lootbox_item_x[1] = 0;
									lootbox_item_x[2] = 0;
									lootbox_item_x[3] = 0; 
														
									lootbox_item_y[1] = 0;
									lootbox_item_y[2] = 0;
									lootbox_item_y[3] = 0; /// Координаты
														
									lootbox_item_t[1] = 0;
									lootbox_item_t[2] = 0;
									lootbox_item_t[3] = 0; /// Тип - тотем или листовка
														
									lootbox_item_i[1] = 0;
									lootbox_item_i[2] = 0;
									lootbox_item_i[3] = 0; //// Номера (тотема или персонажа)
									
									lootbox_item_c[1] = 0;
									lootbox_item_c[2] = 0;
									lootbox_item_c[3] = 0; //// Цвет
									
									lootbox_item_v[1] = 0;
									lootbox_item_v[2] = 0;
									lootbox_item_v[3] = 0; //// Количество (листовок)
									lootbox_item_o[1] = 0;
									
									lootbox_item_o[2] = 0;
									lootbox_item_o[3] = 0; ///// Открыто или нет
	
									lootbox_buy[1] = 0;
									lootbox_buy[2] = 0;
	
									lootbox_buy_s[1] = 0;
									lootbox_buy_s[2] = 0;
									
									if global.heroes_have[i] < 178 + 110 + 68 + 42 + 26 + 16 + 10 + 6 + 4 + 2
										{ hero_lvl[i] = 10; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6 - 10 - 16 - 26 - 42 - 68 - 110; hero_need[i] = 178; }
									if global.heroes_have[i] < 110 + 68 + 42 + 26 + 16 + 10 + 6 + 4 + 2
										{ hero_lvl[i] = 9; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6 - 10 - 16 - 26 - 42 - 68; hero_need[i] = 110; }
									if global.heroes_have[i] < 68 + 42 + 26 + 16 + 10 + 6 + 4 + 2
										{ hero_lvl[i] = 8; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6 - 10 - 16 - 26 - 42; hero_need[i] = 68; }
		
									if global.heroes_have[i] < 42 + 26 + 16 + 10 + 6 + 4 + 2
										{ hero_lvl[i] = 7; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6 - 10 - 16 - 26; hero_need[i] = 42; }
									if global.heroes_have[i] < 26 + 16 + 10 + 6 + 4 + 2
										{ hero_lvl[i] = 6; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6 - 10 - 16; hero_need[i] = 26; }
									if global.heroes_have[i] < 16 + 10 + 6 + 4 + 2
										{ hero_lvl[i] = 5; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6 - 10; hero_need[i] = 16; }
									if global.heroes_have[i] < 10 + 6 + 4 + 2
										{ hero_lvl[i] = 4; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6; hero_need[i] = 10; }
									if global.heroes_have[i] < 6 + 4 + 2
										{ hero_lvl[i] = 3; hero_now1[i] = global.heroes_have[i] - 2 - 4; hero_need[i] = 6; }
									if global.heroes_have[i] < 4 + 2
										{ hero_lvl[i] = 2; hero_now1[i] = global.heroes_have[i] - 2; hero_need[i] = 4; }
									if global.heroes_have[i] < 2
										{ hero_lvl[i] = 1; hero_now1[i] = global.heroes_have[i]; hero_need[i] = 2; }
		
									levelup[1] = global.heroes_have[i];
									levelup[2] = global.heroes_have[i];
									levelup[3] = global.heroes_have[i];
									
									lvlup[1] = 0;
									lvlup[2] = 0;
									lvlup[3] = 0;
								#endregion
								}
							}
					
						draw_sprite_ext_t(s_lootbox1, lootbox_i, 640 - 10, global.size / 2 - 120 + 65 + 70, 0.25 * lbs1 * upsc, 0.25 * lbs1 * upsc, 0, c_white, 1, c_white, c_black);
						draw_sprite_ext(s_light, 0, 640, global.size / 2 - 120 + 65 + 70, lootbox_aa, 0.5 * lootbox_aa, 0, c_white, lootbox_aa);
						if lootbox_s > 3
							{
							draw_set_alpha(0.1);
							draw_rectangle_color(0, -100 + training_back_y, 1280, global.size + training_back_y + 10, c_black, c_black, c_black, c_black, 0);
							draw_set_alpha(1);
						
							//////
							theme_a1[1] += 10;
							theme_x1[1] += lengthdir_x(random(0.5),theme_a1[i]);
							theme_y1[1] += lengthdir_y(random(0.5),theme_a1[i]);
						
							theme_a1[2] += 10;
							theme_x1[2] += lengthdir_x(random(0.5),theme_a1[i]);
							theme_y1[2] += lengthdir_y(random(0.5),theme_a1[i]);
							//////
							}
						//draw_sprite_ext(s_light,  1, 640 - 10 - lootbox_item_x[1] + theme_x1[1], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[1] + theme_y1[1], 0.6 * lootbox_item_s[1], 0.6 * lootbox_item_s[1], 0, c_white, 1);
					
						if lootbox_item_o[1] < 2
							{
							if lootbox_item_t[1] = 0
								{
								draw_sprite_ext(s_totems_light, 1, 640 - 10 - lootbox_item_x[1] + theme_x1[1], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[1] + theme_y1[1], 0.45 * lootbox_item_s[1], 0.45 * lootbox_item_s[1], 0, lootbox_item_c[1], 0.5);
								draw_sprite_ext(s_totems, 1, 640 - 10 - lootbox_item_x[1] + theme_x1[1], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[1] + theme_y1[1], 0.45 * lootbox_item_s[1], 0.45 * lootbox_item_s[1], 0, c_black, 1);
								//draw_text_transformed_t(640 - 10 - lootbox_item_x[1] + theme_x1[1], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[1] + theme_y1[1], "?", 0.5 * lootbox_item_s[1], 0.5 * lootbox_item_s[1], 0, global.color_white, c_black);
								//if os_get_language() != "ru"
								//	{ draw_text_transformed_t(640 - 10 - lootbox_item_x[1] + theme_x1[1], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[1] + 100, "TAP", 0.17 * lootbox_item_s[1], 0.17 * lootbox_item_s[1], 0, global.color_white, c_black); }
								//	else
								//	{ draw_text_transformed_t(640 - 10 - lootbox_item_x[1] + theme_x1[1], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[1] + 100, "НАЖМИ", 0.17 * lootbox_item_s[1], 0.17 * lootbox_item_s[1], 0, global.color_white, c_black); }
								}
								else
								{
								draw_sprite_ext(s_wanted2,  1, 640 - 10 - lootbox_item_x[1] + theme_x1[1], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[1] + theme_y1[1], 0.65 * lootbox_item_s[1], 0.65 * lootbox_item_s[1], 0, lootbox_item_c[1], 0.5);
								draw_sprite_ext(s_wanted, 6, 640 - 10 - lootbox_item_x[1] + theme_x1[1], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[1] + theme_y1[1], 0.65 * lootbox_item_s[1], 0.65 * lootbox_item_s[1], 0, c_black, 1);
								//draw_text_transformed_t(640 - 10 - lootbox_item_x[1] + theme_x1[1], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[1] + theme_y1[1], "?", 0.5 * lootbox_item_s[1], 0.5 * lootbox_item_s[1], 0, global.color_white, c_black);
								//if os_get_language() != "ru"
								//	{ draw_text_transformed_t(640 - 10 - lootbox_item_x[1] + theme_x1[1], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[1] + 100, "TAP", 0.17 * lootbox_item_s[1], 0.17 * lootbox_item_s[1], 0, global.color_white, c_black); }
								//	else
								//	{ draw_text_transformed_t(640 - 10 - lootbox_item_x[1] + theme_x1[1], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[1] + 100, "НАЖМИ", 0.17 * lootbox_item_s[1], 0.17 * lootbox_item_s[1], 0, global.color_white, c_black); }
								}
							draw_text_transformed_t(640 - 10 - lootbox_item_x[1] + theme_x1[1], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[1] + theme_y1[1], "?", 0.5 * lootbox_item_s[1], 0.5 * lootbox_item_s[1], 0, global.color_white, c_black);
							//if os_get_language() != "ru"
							//	{ draw_text_transformed_t(640 - 10 - lootbox_item_x[1] + theme_x1[1], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[1] + 100, "TAP", 0.17 * lootbox_item_s[1], 0.17 * lootbox_item_s[1], 0, global.color_white, c_black); }
							//	else
							//	{ draw_text_transformed_t(640 - 10 - lootbox_item_x[1] + theme_x1[1], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[1] + 100, "НАЖМИ", 0.17 * lootbox_item_s[1], 0.17 * lootbox_item_s[1], 0, global.color_white, c_black); }
							draw_text_transformed_t(640 - 10 - lootbox_item_x[1] + theme_x1[1], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[1] + 100, store_text[20], 0.17 * lootbox_item_s[1], 0.17 * lootbox_item_s[1], 0, global.color_white, c_black);
							}
						//lootbox_item_t[j]
						if lootbox_item_o[2] < 2
							{
							if lootbox_item_t[2] = 0
								{
								draw_sprite_ext(s_totems_light,  1, 640 - 10 + lootbox_item_x[2] + theme_x1[2], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[2] + theme_y1[2], 0.45 * lootbox_item_s[2], 0.45 * lootbox_item_s[2], 0, lootbox_item_c[2], 0.5);
								draw_sprite_ext(s_totems, 1, 640 - 10 + lootbox_item_x[2] + theme_x1[2], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[2] + theme_y1[2], 0.45 * lootbox_item_s[2], 0.45 * lootbox_item_s[2], 0, c_black, 1);
								//draw_text_transformed_t(640 - 10 + lootbox_item_x[2] + theme_x1[2], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[2] + theme_y1[2], "?", 0.5 * lootbox_item_s[2], 0.5 * lootbox_item_s[2], 0, global.color_white, c_black);
								//if os_get_language() != "ru"
								//	{ draw_text_transformed_t(640 - 10 + lootbox_item_x[2] + theme_x1[2], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[2] + 100, "TAP", 0.17 * lootbox_item_s[2], 0.17 * lootbox_item_s[2], 0, global.color_white, c_black); }
								//	else
								//	{ draw_text_transformed_t(640 - 10 + lootbox_item_x[2] + theme_x1[2], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[2] + 100, "НАЖМИ", 0.17 * lootbox_item_s[2], 0.17 * lootbox_item_s[2], 0, global.color_white, c_black); }
								}
								else
								{
								draw_sprite_ext(s_wanted2,  1, 640 - 10 + lootbox_item_x[2] + theme_x1[2], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[2] + theme_y1[2], 0.65 * lootbox_item_s[2], 0.65 * lootbox_item_s[2], 0, lootbox_item_c[2], 0.5);
								draw_sprite_ext(s_wanted, 6, 640 - 10 + lootbox_item_x[2] + theme_x1[2], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[2] + theme_y1[2], 0.65 * lootbox_item_s[2], 0.65 * lootbox_item_s[2], 0, c_black, 1);
								//draw_text_transformed_t(640 - 10 + lootbox_item_x[2] + theme_x1[2], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[2] + theme_y1[2], "?", 0.5 * lootbox_item_s[2], 0.5 * lootbox_item_s[2], 0, global.color_white, c_black);
								//if os_get_language() != "ru"
								//	{ draw_text_transformed_t(640 - 10 + lootbox_item_x[2] + theme_x1[2], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[2] + 100, "TAP", 0.17 * lootbox_item_s[2], 0.17 * lootbox_item_s[2], 0, global.color_white, c_black); }
								//	else
								//	{ draw_text_transformed_t(640 - 10 + lootbox_item_x[2] + theme_x1[2], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[2] + 100, "НАЖМИ", 0.17 * lootbox_item_s[2], 0.17 * lootbox_item_s[2], 0, global.color_white, c_black); }
								}
							draw_text_transformed_t(640 - 10 + lootbox_item_x[2] + theme_x1[2], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[2] + theme_y1[2], "?", 0.5 * lootbox_item_s[2], 0.5 * lootbox_item_s[2], 0, global.color_white, c_black);
							draw_text_transformed_t(640 - 10 + lootbox_item_x[2] + theme_x1[2], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[2] + 100, store_text[20], 0.17 * lootbox_item_s[2], 0.17 * lootbox_item_s[2], 0, global.color_white, c_black);
							}
					
						for(k=1;k<=2;k++)
							{
							if lootbox_item_o[k] >= 1
								{
								if lootbox_item_t[k] = 0
									{
									draw_sprite_ext(s_totems_light, lootbox_item_i[k], 640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 2) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + theme_y1[k], 0.45 * lootbox_item_s[k], 0.45 * lootbox_item_s[k], 0, lootbox_item_c[k], 0.5);
								
									draw_sprite_ext(s_totems, lootbox_item_i[k], 640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 2) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + theme_y1[k], 0.45 * lootbox_item_s[k] * lootbox_item_ss[k], 0.45 * lootbox_item_s[k] * lootbox_item_ss[k], 0, c_white, 1);
									draw_sprite_ext(s_totems_eyes, lootbox_item_i[k], 640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 2) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + theme_y1[k], 0.45 * lootbox_item_s[k] * lootbox_item_ss[k], 0.45 * lootbox_item_s[k] * lootbox_item_ss[k], 0, lootbox_item_c[k], 0.5);
									if lootbox_item_ss[k] = 1
										{ draw_text_ext_transformed_t(640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 2) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] - 160, string_upper(global.totem_name[lootbox_item_i[k]]), -1, 1000, 0.22 * lootbox_item_s[k], 0.22 * lootbox_item_s[k], 0, lootbox_item_c[k], c_black); }
									if lootbox_item_i[k] != 13
										{
										if lootbox_item_ss[k] = 1
											{ draw_text_ext_transformed_t(640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 2) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + 150 + string_height(string_upper(global.totem_desc[lootbox_item_i[k]])) * 0.12 * lootbox_item_s[k] / 2, string_upper(global.totem_desc[lootbox_item_i[k]]), -1, 2000, 0.12 * lootbox_item_s[k], 0.12 * lootbox_item_s[k], 0, lootbox_item_c[k], c_black); }
										}
										else
										{
										if lootbox_item_ss[k] = 1
											{
											//if os_get_language() != "ru"
											//	{ draw_text_ext_transformed_t(640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 2) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + 150 + string_height("DEAL DAMAGE TO RIVAL HERO AND...") * 0.12 * lootbox_item_s[k] / 2, "DEAL DAMAGE TO RIVAL HERO AND...", -1, 2000, 0.12 * lootbox_item_s[k], 0.12 * lootbox_item_s[k], 0, lootbox_item_c[k], c_black); }
											//	else
											//	{ draw_text_ext_transformed_t(640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 2) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + 150 + string_height("НАНОСИТ УРОН ВРАГУ И 50% НАНОСИТ ВАМ") * 0.12 * lootbox_item_s[k] / 2, "НАНОСИТ УРОН ВРАГУ И 50% НАНОСИТ ВАМ", -1, 2000, 0.12 * lootbox_item_s[k], 0.12 * lootbox_item_s[k], 0, lootbox_item_c[k], c_black); }
											draw_text_ext_transformed_t(640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 2) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + 150 + string_height("D") * 0.12 * lootbox_item_s[k] / 2, string_upper(string_copy(totem_desc[13],0,36)), -1, 2000, 0.12 * lootbox_item_s[k], 0.12 * lootbox_item_s[k], 0, lootbox_item_c[k], c_black);
											}
										}
									}
									else
									{
									draw_sprite_ext(s_wanted2,  1, 640 - 10 + lootbox_item_x[k] * (k == 2)-  lootbox_item_x[k] * (k == 1) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + theme_y1[k], 0.65 * lootbox_item_s[k], 0.65 * lootbox_item_s[k], 0, lootbox_item_c[k], 0.5);
									draw_sprite_ext_t(s_wanted, lootbox_item_i[k], 640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 2) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + theme_y1[k], 0.65 * lootbox_item_s[k] * lootbox_item_ss[k], 0.65 * lootbox_item_s[k] * lootbox_item_ss[k], 0, c_white, 1, c_white, c_black);
									
									if lootbox_item_ss[k] = 1 && lootbox_item_o[k] = 2
										{
										#region Левелап
											var hx, hy, ls, lh;
											hx = 640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 2) + theme_x1[k];
											hy = global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + theme_y1[k];
											ls = 1;
											lh = 1;
											
											if levelup[k] <= global.heroes_have[lootbox_item_i[k]]
												{
												//lootbox_item_v[k] -= 0.1;
												levelup[k] += 0.1;
												if levelup[k] mod 1 = 0
													{ ls = 1.1; }
												}
									
											#region Текущее  наполнение уровня
												if floor(levelup[k]) < 178 + 110 + 68 + 42 + 26 + 16 + 10 + 6 + 4 + 2
													{ hero_lvl[lootbox_item_i[k]] = 10; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6 - 10 - 16 - 26 - 42 - 68 - 110; hero_need[lootbox_item_i[k]] = 178; }
												if floor(levelup[k]) < 110 + 68 + 42 + 26 + 16 + 10 + 6 + 4 + 2
													{ hero_lvl[lootbox_item_i[k]] = 9; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6 - 10 - 16 - 26 - 42 - 68; hero_need[lootbox_item_i[k]] = 110; }
												if floor(levelup[k]) < 68 + 42 + 26 + 16 + 10 + 6 + 4 + 2
													{ hero_lvl[lootbox_item_i[k]] = 8; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6 - 10 - 16 - 26 - 42; hero_need[lootbox_item_i[k]] = 68; }
												
												if floor(levelup[k]) < 42 + 26 + 16 + 10 + 6 + 4 + 2
													{ hero_lvl[lootbox_item_i[k]] = 7; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6 - 10 - 16 - 26; hero_need[lootbox_item_i[k]] = 42; }
												if floor(levelup[k]) < 26 + 16 + 10 + 6 + 4 + 2
													{ hero_lvl[lootbox_item_i[k]] = 6; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6 - 10 - 16; hero_need[lootbox_item_i[k]] = 26; }
												if floor(levelup[k]) < 16 + 10 + 6 + 4 + 2
													{ hero_lvl[lootbox_item_i[k]] = 5; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6 - 10; hero_need[lootbox_item_i[k]] = 16; }
												if floor(levelup[k]) < 10 + 6 + 4 + 2
													{ hero_lvl[lootbox_item_i[k]] = 4; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6; hero_need[lootbox_item_i[k]] = 10; }
												if floor(levelup[k]) < 6 + 4 + 2
													{ hero_lvl[lootbox_item_i[k]] = 3; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4; hero_need[lootbox_item_i[k]] = 6; }
												if floor(levelup[k]) < 4 + 2
													{ hero_lvl[lootbox_item_i[k]] = 2; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2; hero_need[lootbox_item_i[k]] = 4; }
												if floor(levelup[k]) < 2
													{ hero_lvl[lootbox_item_i[k]] = 1; hero_now1[lootbox_item_i[k]] = floor(levelup[k]); hero_need[lootbox_item_i[k]] = 2; }
											#endregion
											
											if hero_now1[lootbox_item_i[k]] = 0
												{ lh = 1.1; }
									
											draw_set_alpha(0.5);
											draw_rectangle_color(hx - 100, hy - 20 + 140, hx + 100, hy + 20 + 140, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
			
											draw_rectangle_color(hx - 100, hy - 20 + 140, hx + (100) * (hero_now1[lootbox_item_i[k]] / hero_need[lootbox_item_i[k]]), hy + 20 + 140, global.color_hero[lootbox_item_i[k]], global.color_hero[lootbox_item_i[k]], global.color_hero[lootbox_item_i[k]], global.color_hero[lootbox_item_i[k]], 0);
			
											draw_sprite_ext_t(s_themes_ss, lootbox_item_i[k], hx - 100, hy - 130, 0.3 * 1.8 * lh, 0.3 * 1.8 * lh, 0, global.color_hero[lootbox_item_i[k]], 1, global.color_hero[lootbox_item_i[k]], c_black);
											draw_text_transformed_t(hx - 100, hy - 130, string(hero_lvl[lootbox_item_i[k]]) + "", 0.18 * 1.8 * ls, 0.18 * 1.8 * ls, 0, global.color_white, c_black);
			
											draw_text_transformed_t(hx, hy + 140, "(" + string(hero_now1[lootbox_item_i[k]]) + "~" + string(hero_need[lootbox_item_i[k]]) + ")", 0.1 * 1.8 * ls, 0.1 * 1.8 * ls, 0, global.color_white, c_black);
											
											draw_text_transformed_t(hx + 100, hy - 130, "*" + string(floor(lootbox_item_v[k])), 0.2 * lootbox_item_s[k], 0.2 * lootbox_item_s[k], 0, global.color_white, c_black);
											
											//if os_get_language() != "ru"
											//	{
											//	if lvlup[k] = 1
											//		{ draw_text_transformed_t(hx, hy + 240, "LEVEL UP!", 0.2, 0.2, 0, global.color_white, c_black); }
											//	}
											//	else
											//	{
											//	if lvlup[k] = 1
											//		{ draw_text_transformed_t(hx, hy + 240, "НОВЫЙ\nУРОВЕНЬ!", 0.18, 0.18, 0, global.color_white, c_black); }
											//	}
											if lvlup[k] = 1
												{ draw_text_transformed_t(hx, hy + 240, store_text[21], 0.2, 0.2, 0, global.color_white, c_black); }
										#endregion
										
										var name;
										name = heroes_name[lootbox_item_i[k]]
										//name = string_upper(global.hero_code_name[lootbox_item_i[k]]);
										//if lootbox_item_i[k] = 2
										//	{ name = "DRUNK JOE"; }
										//if lootbox_item_i[k] = 5
										//	{ name = "BILL SR."; }
										
										//if os_get_language() = "ru"
										//	{
										//	switch(lootbox_item_i[k])
										//		{
										//		case 1: name = "ВОРИШКА"; break;
										//		case 2: name = "ПЬЯН. ДЖО"; break;
										//		case 3: name = "ОХОТНИЦА"; break;
										//		case 4: name = "ДИЕГО"; break;
										//		case 5: name = "БИЛЛ СТ."; break;
										//		case 6: name = "ШЕРИФ"; break;
										//		case 7: name = "ШАМАН"; break;
										//		}
										//	}
										draw_text_transformed_t(hx, hy + 180, name, 0.17 * lootbox_item_s[k], 0.17 * lootbox_item_s[k], 0, global.color_hero[lootbox_item_i[k]], c_black);
										}
									}
								}
							}
						}
					}
				#endregion
				#region Элитный сундук
					if i = 2
						{
						//if lootbox_s <= 3
							//{
							draw_set_alpha(0.75 + lootbox_alpha);
							draw_rectangle_color(0, -100 + training_back_y, 1280, global.size + training_back_y + 10, c_black, c_black, c_black, c_black, 0);
							draw_set_alpha(1);
							//}
						
						if lootbox_buy[i] = 1 // && gold_buy_s[1] != 0
							{
							if 0
								{
								#region Старое
									///////////
									draw_set_alpha(0.4);
									draw_rectangle_color(0, global.size / 2 - 120 + 65 - 50, 400, global.size / 2 - 120 + 65 + 200 + 70, c_black, c_black, c_black, c_black, 0);
									draw_set_alpha(1);
							
									draw_sprite_ext_t(s_menu_buttons, 1, 640 - 10 - 180 * 3 + 15, global.size / 2 - 120 + 65 + 50, 0.6, 0.6, 0, c_white, 1, c_white, c_black);
									draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - 120 + 65, "HEROES", 0.2, 0.2, 5, global.color_white, c_black);
									draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - 120 + 65 + 50, "CHANCE 60%", 0.12, 0.12, 5, global.color_white, c_black);
							
									draw_sprite_ext_t(s_menu_buttons, 2, 640 - 10 - 180 * 3 + 15, global.size / 2 - 120 + 65+ 150 + 50, 0.6, 0.6, 0, c_white, 1, c_white, c_black);
									draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - 120 + 65 + 150, "TOTEMS", 0.2, 0.2, 5, global.color_white, c_black);
									draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - 120 + 65 + 150 + 50, "CHANCE 40%", 0.12, 0.12, 5, global.color_white, c_black);
							
									//////////////
							
									///////////////
									draw_set_alpha(0.4);
									draw_rectangle_color(1280 - 400, global.size / 2 - 120 + 65 - 50, 1280, global.size / 2 - 120 + 65 + 200 + 70, c_black, c_black, c_black, c_black, 0);
									draw_set_alpha(1);
							
									draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - 120 + 65 + 70 - 70 + 20, "RARITY\nCHANCES:", 0.2, 0.2, 5, global.color_white, c_black);
									draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - 120 + 65 + 70 - 70 + 35 + 40 + 20, "LEGENDARY - 15%", 0.12, 0.12, 5, c_orange, c_black);
									draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 3, "EPIC - 30%", 0.12, 0.12, 5, c_fuchsia, c_black);
									draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 5, "RARE - 50%", 0.12, 0.12, 5, c_aqua, c_black);
									draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 7, "COOMON - 5%", 0.12, 0.12, 5, c_white, c_black);
									//////////////
							
									draw_text_transformed_t(640, global.size / 2 + 140 + 60 - 80 + 70 - 210 - 100 + 80, "*3 ITEMS", 0.2, 0.2, 5, global.cash_color, c_black);
							
									draw_sprite_ext_t(s_lootbox2, 0, 640 - 10, global.size / 2 - 120 + 65 + 70, 0.25 * lbs1 * upsc, 0.25 * lbs1 * upsc, 0, c_white, 1, c_white, c_black);
									draw_sprite_ext_t(s_buy, 5 + i, 640, global.size / 2 + 90 + 60 + 70, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
							
									draw_text_transformed_t(640, global.size / 2 + 140 + 60 - 80 + 70 - 210 - 100, "ELITE BOX", 0.2 * lbs1 * upsc, 0.2 * lbs1 * upsc, 5, global.gold_color, c_black);
									//draw_text_transformed_t(640, global.size / 2 - 57, string(gold_val[i]), 0.18 * sg1 * upsc, 0.18 * sg1 * upsc, 0, global.gold_color, c_black);
							
									draw_text_transformed_t(640 - string_width("50ç") * 0.2 * lbs1 * upsc / 2 + 10, global.size / 2 + 140 /*+ 6*/ + 60 + 70/*+ 60*/, "50ç", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.cash_color, c_black);
									draw_text_transformed_t(640 + string_width("BUY") * 0.2 * lbs1 * upsc / 2 - 20, global.size / 2 + 140 + 60 + 70, "BUY", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.cash_color, c_black);
								#endregion
								}
							#region Новое
								///////////
								//draw_set_alpha(0.4);
								//draw_rectangle_color(0, global.size / 2 - 120 + 65 - 50, 400, global.size / 2 - 120 + 65 + 200 + 70, c_black, c_black, c_black, c_black, 0);
								//draw_set_alpha(1);
								draw_set_alpha(0.5);
								draw_rectangle_color(0, global.size / 2 - nizco - 120 + 65 - 50, 1280, global.size / 2 - nizco - 120 + 65 + 200 + 70, c_black, c_black, c_black, c_black, 0);
								draw_set_alpha(1);
								
								//if os_get_language() = "ru"
								//	{
								//	draw_sprite_ext_t(s_menu_buttons, 1, 640 - 10 - 180 * 3 + 15, global.size / 2 - nizco - 120 + 65 + 50, 0.6, 0.6, 0, c_white, 1, c_white, c_black);
								//	draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65, "ГЕРОИ", 0.2, 0.2, 5, global.color_white, c_black);
								//	draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65 + 50, "ШАНС 60%", 0.12, 0.12, 5, global.color_white, c_black);
									
								//	draw_sprite_ext_t(s_menu_buttons, 2, 640 - 10 - 180 * 3 + 15, global.size / 2 - nizco - 120 + 65+ 150 + 50, 0.6, 0.6, 0, c_white, 1, c_white, c_black);
								//	draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65 + 150, "ТОТЕМЫ", 0.2, 0.2, 5, global.color_white, c_black);
								//	draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65 + 150 + 50, "ШАНС 40%", 0.12, 0.12, 5, global.color_white, c_black);
								//	}
								//	else
								//	{
								//	draw_sprite_ext_t(s_menu_buttons, 1, 640 - 10 - 180 * 3 + 15, global.size / 2 - nizco - 120 + 65 + 50, 0.6, 0.6, 0, c_white, 1, c_white, c_black);
								//	draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65, "HEROES", 0.2, 0.2, 5, global.color_white, c_black);
								//	draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65 + 50, "CHANCE 60%", 0.12, 0.12, 5, global.color_white, c_black);
									
								//	draw_sprite_ext_t(s_menu_buttons, 2, 640 - 10 - 180 * 3 + 15, global.size / 2 - nizco - 120 + 65+ 150 + 50, 0.6, 0.6, 0, c_white, 1, c_white, c_black);
								//	draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65 + 150, "TOTEMS", 0.2, 0.2, 5, global.color_white, c_black);
								//	draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65 + 150 + 50, "CHANCE 40%", 0.12, 0.12, 5, global.color_white, c_black);
								//	}
								
									draw_sprite_ext_t(s_menu_buttons, 1, 640 - 10 - 180 * 3 + 15, global.size / 2 - nizco - 120 + 65 + 50, 0.6, 0.6, 0, c_white, 1, c_white, c_black);
									draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65, store_text[15], 0.2, 0.2, 5, global.color_white, c_black);
									draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65 + 50, store_text[16] + " 60%", 0.12, 0.12, 5, global.color_white, c_black);
									
									draw_sprite_ext_t(s_menu_buttons, 2, 640 - 10 - 180 * 3 + 15, global.size / 2 - nizco - 120 + 65+ 150 + 50, 0.6, 0.6, 0, c_white, 1, c_white, c_black);
									draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65 + 150, store_text[17], 0.2, 0.2, 5, global.color_white, c_black);
									draw_text_transformed_t(640 - 10 - 180 * 2, global.size / 2 - nizco - 120 + 65 + 150 + 50, store_text[16] + " 40%", 0.12, 0.12, 5, global.color_white, c_black);
								//////////////
									
								///////////////
								//draw_set_alpha(0.4);
								//draw_rectangle_color(1280 - 400, global.size / 2 - 120 + 65 - 50, 1280, global.size / 2 - 120 + 65 + 200 + 70, c_black, c_black, c_black, c_black, 0);
								//draw_set_alpha(1);
								//draw_set_alpha(0.4);
								//draw_rectangle_color(0, global.size / 2 - 120 + 65 - 50, 400, global.size / 2 - 120 + 65 + 200 + 70, c_black, c_black, c_black, c_black, 0);
								//draw_set_alpha(1);
								
								//if os_get_language() != "ru"
								//	{
								//	draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 20, "RARITY\nCHANCES:", 0.2, 0.2, 5, global.color_white, c_black);
									
								//	draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20, "LEGENDARY - 15%", 0.12, 0.12, 5, c_orange, c_black);
								//	draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 3, "EPIC - 30%", 0.12, 0.12, 5, c_fuchsia, c_black);
								//	draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 5, "RARE - 50%", 0.12, 0.12, 5, c_aqua, c_black);
								//	draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 7, "COOMON - 5%", 0.12, 0.12, 5, c_white, c_black);
								//	}
								//	else
								//	{
								//	draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 20, "ШАНСЫ\nНАЙТИ:", 0.2, 0.2, 5, global.color_white, c_black);
									
								//	draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20, text_tot[4] + " - 15%", 0.12, 0.12, 5, c_orange, c_black);
								//	draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 3, text_tot[3] + " - 30%", 0.12, 0.12, 5, c_fuchsia, c_black);
								//	draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 5, text_tot[2] + " - 50%", 0.12, 0.12, 5, c_aqua, c_black);
								//	draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 7, text_tot[1] + " - 5%", 0.12, 0.12, 5, c_white, c_black);
								//	}
									draw_text_ext_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 20, store_text[18], -1, 250, 0.2, 0.2, 5, global.color_white, c_black);
									
									draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20, text_tot[4] + " - 15%", 0.12, 0.12, 5, c_orange, c_black);
									draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 3, text_tot[3] + " - 30%", 0.12, 0.12, 5, c_fuchsia, c_black);
									draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 5, text_tot[2] + " - 50%", 0.12, 0.12, 5, c_aqua, c_black);
									draw_text_transformed_t(640 - 10 + 180 * 2 + 60, global.size / 2 - nizco - 120 + 65 + 70 - 70 + 35 + 40 + 20 * 7, text_tot[1] + " - 5%", 0.12, 0.12, 5, c_white, c_black);
								
								//////////////
								
								//if os_get_language() = "ru"
								//	{ draw_text_transformed_t(640, global.size / 2 - nizco + 140 + 60 - 80 + 70 - 210 - 100 + 80, "*3 ВЕЩЕЙ", 0.2, 0.2, 5, global.cash_color, c_black); }
								//	else
								//	{ draw_text_transformed_t(640, global.size / 2 - nizco + 140 + 60 - 80 + 70 - 210 - 100 + 80, "*3 ITEMS", 0.2, 0.2, 5, global.cash_color, c_black); }
								draw_text_transformed_t(640, global.size / 2 - nizco + 140 + 60 - 80 + 70 - 210 - 100 + 80, "*3 " + store_text[19], 0.2, 0.2, 5, global.cash_color, c_black);
								//if os_get_language() = "ru"
								//	{
								//	draw_sprite_ext_t(s_buy, 2, 640, global.size / 2 + 90 + 60 + 70, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
								//	draw_text_transformed_t(640/* + string_width("50ç КУПИТЬ") * 0.18 * lbs1 * upsc / 3 - 20 - 20*/, global.size / 2 + 140 + 60 + 70 + xxxx, "50ç КУПИТЬ", 0.18 * lbs1 * upsc * minn, 0.18 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.gold_color, c_black);
								//	//draw_text_transformed_t(640 - string_width("50ç") * 0.2 * lbs1 * upsc / 2 + 10 - 60, global.size / 2 + 140 + 60 + 70 + xxxx, "50ç", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.gold_color, c_black);
								//	}
								//	else
								//	{
								//	draw_sprite_ext_t(s_buy, 1, 640, global.size / 2 + 90 + 60 + 70, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
								//	draw_text_transformed_t(640/* + string_width("50ç BUY") * 0.2 * lbs1 * upsc / 2 - 20*/, global.size / 2 + 140 + 60 + 70, "50ç BUY", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.gold_color, c_black);
								//	//draw_text_transformed_t(640 - string_width("50ç") * 0.2 * lbs1 * upsc / 2 + 10, global.size / 2 + 140 + 60 + 70/*+ 60*/, "50ç", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.gold_color, c_black);
								//	}
								if global.cash < 50
									{
									//if os_get_language() = "ru"
									//	{
									//	draw_sprite_ext_t(s_buy, 2, 640 - 25, global.size / 2 - nizco + 90 + 60 + 70 + xxxx, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
									//	draw_text_transformed_t(640 - 25, global.size / 2 - nizco + 140 + 60 + 70 + xxxx, "БОЛЬШЕç", 0.18 * lbs1 * upsc * minn, 0.18 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.cash_color, c_black);
									//	//draw_text_transformed_t(640 - string_width("100©") * 0.2 * lbs1 * upsc / 2 + 10 - 60, global.size / 2 + 140 + 60 + 70 + xxxx, "100©", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.gold_color, c_black);
									//	}
									//	else
									//	{
									//	draw_sprite_ext_t(s_buy, 2, 640 - 25, global.size / 2 - nizco + 90 + 60 + 70 + xxxx, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
									//	draw_text_transformed_t(640 - 25, global.size / 2 - nizco + 140 + 60 + 70 + xxxx, "GET MOREç", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.cash_color, c_black);
									//	//draw_text_transformed_t(640 - string_width("100©") * 0.2 * lbs1 * upsc / 2 + 10, global.size / 2 + 140 + 60 + 70/*+ 60*/, "100©", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.gold_color, c_black);
									//	}
									draw_sprite_ext_t(s_buy, 2, 640 - 25, global.size / 2 - nizco + 90 + 60 + 70 + xxxx, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
									draw_text_transformed_t(640 - 25, global.size / 2 - nizco + 140 + 60 + 70 + xxxx, store_text[20] + "ç", 0.18 * lbs1 * upsc * minn, 0.18 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.cash_color, c_black);
									}
									else
									{
									//if os_get_language() = "ru"
									//	{
									//	draw_sprite_ext_t(s_buy, 2, 640 - 25, global.size / 2 - nizco + 90 + 60 + 70 + xxxx, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
									//	draw_text_transformed_t(640 - 25, global.size / 2 - nizco + 140 + 60 + 70 + xxxx, "50ç КУПИТЬ", 0.18 * lbs1 * upsc * minn, 0.18 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.cash_color, c_black);
									//	//draw_text_transformed_t(640 - string_width("100©") * 0.2 * lbs1 * upsc / 2 + 10 - 60, global.size / 2 + 140 + 60 + 70 + xxxx, "100©", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.gold_color, c_black);
									//	}
									//	else
									//	{
									//	draw_sprite_ext_t(s_buy, 1, 640 - 25, global.size / 2 - nizco + 90 + 60 + 70 + xxxx, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
									//	draw_text_transformed_t(640 - 25, global.size / 2 - nizco + 140 + 60 + 70 + xxxx, "50çBUY", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.cash_color, c_black);
									//	//draw_text_transformed_t(640 - string_width("100©") * 0.2 * lbs1 * upsc / 2 + 10, global.size / 2 + 140 + 60 + 70/*+ 60*/, "100©", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.gold_color, c_black);
									//	}
									draw_sprite_ext_t(s_buy, 1, 640 - 25, global.size / 2 - nizco + 90 + 60 + 70 + xxxx, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
									draw_text_transformed_t(640 - 25, global.size / 2 - nizco + 140 + 60 + 70 + xxxx, "50ç" + store_text[13], 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.cash_color, c_black);
									
									///////
									#region Рука
										if (global.hand_cash && global.cash >= 50)
											{
											if hand_i < 10
												{ hand_i += 0.4; }
												else
												{ hand_i = 0; }
											draw_sprite_ext(s_training_hand, hand_i, 640 - 25, global.size / 2 - nizco + 90 + 60 + 70 + xxxx + 70, 1, 1, 0, c_black, 0.5);
											draw_sprite_ext_t(s_training_hand, hand_i, 640 - 25, global.size / 2 - nizco + 90 + 60 + 70 + xxxx + 70, 1, 1, 0, global.color_white, 1, global.color_white, c_black);
											}
									#endregion
									///////
									}
								draw_sprite_ext_t(s_lootbox2, 0, 640 - 10, global.size / 2 - nizco - 120 + 65 + 70, 0.25 * lbs1 * upsc, 0.25 * lbs1 * upsc, 0, c_white, 1, c_white, c_black);
								//draw_sprite_ext_t(s_buy, 5 + i, 640, global.size / 2 + 90 + 60 + 70, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
								
								//if os_get_language() = "ru"
								//	{ draw_text_transformed_t(640, global.size / 2 - nizco + 140 + 60 - 80 + 70 - 210 - 100, "ЭЛИТНЫЙ ЯЩИК", 0.15 * lbs1 * upsc, 0.15 * lbs1 * upsc, 5, global.gold_color, c_black); }
								//	else
								//	{ draw_text_transformed_t(640, global.size / 2 - nizco + 140 + 60 - 80 + 70 - 210 - 100, "ELITE BOX", 0.2 * lbs1 * upsc, 0.2 * lbs1 * upsc, 5, global.gold_color, c_black); }
								
								draw_text_transformed_t(640, global.size / 2 - nizco + 140 + 60 - 80 + 70 - 210 - 100, store_text[3], 0.2 * lbs1 * upsc, 0.2 * lbs1 * upsc, 5, global.gold_color, c_black);
								////draw_text_transformed_t(640, global.size / 2 - 57, string(gold_val[i]), 0.18 * sg1 * upsc, 0.18 * sg1 * upsc, 0, global.gold_color, c_black);
								
							#endregion
							
							//////
							//if global.cash < 50
							//	{
							//	if os_get_language() = "ru"
							//		{
							//		draw_sprite_ext(s_buy, 2, 640 - 25, global.size / 2 - nizco + 90 + 60 + 70 + xxxx, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_black, 0.4);
							//		}
							//		else
							//		{
							//		draw_sprite_ext(s_buy, 1, 640 - 25, global.size / 2 - nizco + 90 + 60 + 70 + xxxx, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_black, 0.4);
							//		}
							//	}
							////////
							if mouse_check_button_pressed(mb_left)
								{
								if point_in_rectangle(mouse_x, mouse_y, 640 - 150 - 20 - 30, global.size / 2 - nizco + 160 - 80 + 60 + 70, 640 + 150 + 20 + 30, global.size / 2 - nizco + 160 + 80 + 60 + 70) && lootbox_buy_s[i] = 1 
									{
									//// КЛАЦ
									if mouse_check_button_pressed(mb_left)
										{
										if global.sound
											{ audio_play_sound(sd_text, 2, 0); }
										}
									//// КЛАЦ
									if global.cash >= 50
										{
										//if os_get_language() = "ru"
										//	{
										//	draw_sprite_ext_t(s_buy, 2, 640, global.size / 2 + 90 + 60 + 70 - 25, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85 + 25, 0, c_white, 1, c_white, c_black);
										//	draw_text_transformed_t(640 + string_width("КУПИТЬ") * 0.18 * lbs1 * upsc / 3 - 20 - 20, global.size / 2 + 140 + 60 + 70 + xxxx, "КУПИТЬ", 0.18 * lbs1 * upsc * minn, 0.18 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.cash_color, c_black);
										//	draw_text_transformed_t(640 - string_width("50ç") * 0.2 * lbs1 * upsc / 2 + 10 - 60, global.size / 2 + 140 + 60 + 70 + xxxx, "50ç", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.cash_color, c_black);
										//	}
										//	else
										//	{
										//	draw_sprite_ext_t(s_buy, 1, 640, global.size / 2 + 90 + 60 + 70, 0.45 * upsc * 0.85, 0.45 * lootbox_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
										//	draw_text_transformed_t(640 + string_width("BUY") * 0.2 * lbs1 * upsc / 2 - 20, global.size / 2 + 140 + 60 + 70, "BUY", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.cash_color, c_black);
										//	draw_text_transformed_t(640 - string_width("50ç") * 0.2 * lbs1 * upsc / 2 + 10, global.size / 2 + 140 + 60 + 70/*+ 60*/, "50ç", 0.2 * lbs1 * upsc * minn, 0.2 * lbs1 * upsc * lootbox_buy_s[i] * minn, 0, global.cash_color, c_black);
										//	}
										ini_open("Music.ini");
											
											if global.hand_cash = 1
												{
												ini_write_string("Hand", "cash", "0");
												global.hand_cash = ini_read_real("Hand", "cash", 0);
												}
											global.cash -= 50;
											ini_write_string("Sounds", "sound_false_c", string(global.cash));
										ini_close();
										lootbox_buy[i] = 2;
										lootbox_s = 0;
										}
										else
										{
										lootbox_buy[i] = 0;
										store_yy1 = -785;
										}
									}
									else
									{ lootbox_buy[i] = 0; }
								io_clear();
								}
							}
						if lootbox_buy[i] = 2
							{
							if lootbox_s = 0
								{
								for(j=1;j<=3;j++)
									{
									var rand, tr, rand2;
									rand = irandom_range(1, 100);
									
									if rand <= 50
										{ tr = 2; }
									if rand > 50 && rand <= 85
										{ tr = 3; }
									if rand > 85
										{ tr = 4; }
									
									lootbox_item_t[j] = choose(0, 0, 1, 1, 1);
							
									if lootbox_item_t[j] = 0
										{
										var ta;
										ta = 0;
										for(l=1;l<=18;l++)
											{ ta += global.totem_have[l]; }
										if ta = 18
											{ lootbox_item_t[j] = 1; }
										}
									
									if lootbox_item_t[j] = 1
										{
										#region Листовки
											if tr = 1
												{ lootbox_item_c[j] = global.color_white; lootbox_item_v[j] = 2; }
											if tr = 2
												{ lootbox_item_c[j] = c_aqua; lootbox_item_v[j] = 4; }
											if tr = 3
												{ lootbox_item_c[j] = c_fuchsia; lootbox_item_v[j] = 8; }
											if tr = 4
												{ lootbox_item_c[j] = c_orange; lootbox_item_v[j] = 16; }
									
											var ran;
											ran = irandom_range(1, string_length(heror));
											lootbox_item_i[j] = real(string_copy(heror, ran, 1));
											heror = string_delete(heror, ran, 1);
									
											levelup[j] = global.heroes_have[lootbox_item_i[j]];
										
											if hero_now1[lootbox_item_i[j]] + lootbox_item_v[j] + 1 >= hero_need[lootbox_item_i[j]]
												{ lvlup[j] = 1; }
												else
												{ lvlup[j] = 0; }
										
											global.heroes_have[lootbox_item_i[j]] += lootbox_item_v[j];
											ini_open("Music.ini");
												ini_write_string("Heroes", "heroes" + string(lootbox_item_i[j]), string(global.heroes_have[lootbox_item_i[j]]));
											ini_close();
										#endregion
										}
										else
										{
										#region Рандом тотемов
											var ti, totems;
											totems = "";
											while(totems = "")
												{
												#region Первый
													if tr = 1
														{
														totems = "";
														for(i=1;i<=6;i++)
															{
															if global.totem_have[i] = 0
																{ totems += string(i); }
															}
														if totems = ""
															{ tr = 2; }
														}
												#endregion
												#region Второй
													if tr = 2
														{
														totems = "";
														for(i=1;i<=5;i++)
															{
															if global.totem_have[i+6] = 0
																{ totems += string(i); }
															}
														if totems = ""
															{ tr = 3; }
														}
												#endregion
												#region Третий
													if tr = 3
														{
														totems = "";
														for(i=1;i<=4;i++)
															{
															if global.totem_have[i+11] = 0
																{ totems += string(i); }
															}
														if totems = ""
															{ tr = 4; }
														}
												#endregion
												#region Четвёртый
													if tr = 4
														{
														totems = "";
														for(i=1;i<=3;i++)
															{
															if global.totem_have[i+15] = 0
																{ totems += string(i); }
															}
														if totems = ""
															{ tr = 1; }
														}
												#endregion
												}
											
											ti = irandom_range(1, string_length(totems));
											if tr = 1
												{ lootbox_item_i[j] = real(string_copy(totems, ti, 1)); }
											if tr = 2
												{ lootbox_item_i[j] = 6 + real(string_copy(totems, ti, 1)); }
											if tr = 3
												{ lootbox_item_i[j] = 11 + real(string_copy(totems, ti, 1)); }
											if tr = 4
												{ lootbox_item_i[j] = 15 + real(string_copy(totems, ti, 1)); }
											
											ini_open("Music.ini");
												ini_write_string("Totems", "totem" + string(lootbox_item_i[j]), "1");
												ini_write_string("Totems", "totem_n" + string(lootbox_item_i[j]), "1");
												global.totem_have[lootbox_item_i[j]] = 1;
												global.totem_new[lootbox_item_i[j]]  = ini_read_real("Totems", "totem_n" + string(lootbox_item_i[j]), 0);
											ini_close();
									
											if lootbox_item_i[j] <= 6
												{ lootbox_item_c[j] = global.color_white; }
											if lootbox_item_i[j] > 6 && lootbox_item_i[j] <= 11
												{ lootbox_item_c[j] = c_aqua; }
											if lootbox_item_i[j] > 11 && lootbox_item_i[j] <= 15
												{ lootbox_item_c[j] = c_fuchsia; }
											if lootbox_item_i[j] > 15
												{ lootbox_item_c[j] = c_orange; }
										#endregion
										}
									}
								if global.sound { audio_play_sound(sd_lootbox, 2, 0); }
								lootbox_s = 1;
								}
							if lootbox_s = 1
								{
								//if lootbox_alpha >= 0.15
								//	{
								//	//if global.sound
								//	//	{ audio_play_sound(sd_lootbox, 2, 0); }
								//	}
								//	else
								//	{
								//	if lootbox_i < 18
								//		{ lootbox_i += 0.5; }
								//		else
								//		{ lootbox_s = 2; lootbox_i = 18; }
								//	}
								if lootbox_alpha < 0.15
									{
									lootbox_alpha += 0.05;
									if lootbox_alpha >= 0.15
										{
										//if global.sound
										//	{ audio_play_sound(sd_lootbox, 2, 0); }
										}
									}
									else
									{
									if lootbox_i < 18
										{ lootbox_i += 0.5; }
										else
										{ lootbox_s = 2; lootbox_i = 18; }
									}
								}
							if lootbox_s = 2
								{
								if lootbox_i < 22
									{ lootbox_i += 0.5; }
									else
									{ lootbox_i = 22; }
								if lootbox_aa < 2
									{
									lootbox_aa += 0.2;
									}
									else
									{ lootbox_s = 3; lootbox_aa = 2; }
								}
							if lootbox_s = 3
								{
								if lootbox_aa > 0
									{
									lootbox_aa -= 0.25;
									}
									else
									{ lootbox_aa = 0; }
						
								if lootbox_item_s[1] < 1
									{
									lootbox_item_s[1] += 0.1;
									lootbox_item_x[1] += 40;
									lootbox_item_y[1] -= 2;
									}
									else
									{
									if lootbox_item_s[2] < 1
										{
										lootbox_item_s[2] += 0.1;
										lootbox_item_x[2] += 0;
										lootbox_item_y[2] -= 8;
										}
										else
										{
										if lootbox_item_s[3] < 1
											{
											lootbox_item_s[3] += 0.1;
											lootbox_item_x[3] += 40;
											lootbox_item_y[3] -= 2;
											}
											else
											{ lootbox_s = 4; }
										}
									}
						
								}
							if lootbox_s = 4
								{
								if mouse_check_button_released(mb_left)
									{
									//// КЛАЦ
									if global.sound
										{ audio_play_sound(sd_text, 2, 0); }
									//// КЛАЦ
									if mouse_x <= 426
										{
										if lootbox_item_o[1] = 0
											{ lootbox_item_o[1] = 1; lootbox_item_ss[1] = 3; }
										}
									if mouse_x > 426 && mouse_x <= 853
										{
										if lootbox_item_o[2] = 0
											{ lootbox_item_o[2] = 1; lootbox_item_ss[2] = 3; }
										}
									if mouse_x > 853
										{
										if lootbox_item_o[3] = 0
											{ lootbox_item_o[3] = 1; lootbox_item_ss[3] = 3; }
										}
									}
								}
							
							if lootbox_item_o[1] = 1
								{
								if lootbox_item_ss[1] > 1
									{ lootbox_item_ss[1] -= 0.2; }
									else
									{ lootbox_item_o[1] = 2; lootbox_item_ss[1]= 1; }
								}
							if lootbox_item_o[2] = 1
								{
								if lootbox_item_ss[2] > 1
									{ lootbox_item_ss[2] -= 0.2; }
									else
									{ lootbox_item_o[2] = 2; lootbox_item_ss[2] = 1; }
								}
							if lootbox_item_o[3] = 1
								{
								if lootbox_item_ss[3] > 1
									{ lootbox_item_ss[3] -= 0.2; }
									else
									{ lootbox_item_o[3] = 2; lootbox_item_ss[3] = 1; }
								}
							
							if lootbox_item_o[1] = 2 && lootbox_item_o[2] = 2 && lootbox_item_o[3] = 2
								{
								if mouse_check_button_released(mb_left)
									{
									lootbox_buy[i] = 0;
									#region Обнуление BUY
										lootbox_alpha = 0; // Темный фон
										lootbox_aa = 0; // Альфа вспышки
									
										lootbox_s = 0; // Стейдж
										lootbox_a = 0; // Угол
										lootbox_d = 1; // Направление угла
										lootbox_t = 0; // Время тряски
										lootbox_i = 0; // Индекс кадра для анимации
									
										/////////
										theme_a1[1] = 0;
										theme_x1[1] = 0;
										theme_y1[1] = 0;
									
										theme_a1[2] = 0;
										theme_x1[2] = 0;
										theme_y1[2] = 0;
									
										theme_a1[3] = 0;
										theme_x1[3] = 0;
										theme_y1[3] = 0;
										//////
									
										lootbox_item_s[1] = 0;
										lootbox_item_s[2] = 0;
										lootbox_item_s[3] = 0; /// Скейл ?
									
										lootbox_item_ss[1] = 0;
										lootbox_item_ss[2] = 0;
										lootbox_item_ss[3] = 0; /// Скейл I
									
										lootbox_item_x[1] = 0;
										lootbox_item_x[2] = 0;
										lootbox_item_x[3] = 0; 
														
										lootbox_item_y[1] = 0;
										lootbox_item_y[2] = 0;
										lootbox_item_y[3] = 0; /// Координаты
														
										lootbox_item_t[1] = 0;
										lootbox_item_t[2] = 0;
										lootbox_item_t[3] = 0; /// Тип - тотем или листовка
														
										lootbox_item_i[1] = 0;
										lootbox_item_i[2] = 0;
										lootbox_item_i[3] = 0; //// Номера (тотема или персонажа)
									
										lootbox_item_c[1] = 0;
										lootbox_item_c[2] = 0;
										lootbox_item_c[3] = 0; //// Цвет
									
										lootbox_item_v[1] = 0;
										lootbox_item_v[2] = 0;
										lootbox_item_v[3] = 0; //// Количество (листовок)
										lootbox_item_o[1] = 0;
									
										lootbox_item_o[2] = 0;
										lootbox_item_o[3] = 0; ///// Открыто или нет
	
										lootbox_buy[1] = 0;
										lootbox_buy[2] = 0;
	
										lootbox_buy_s[1] = 0;
										lootbox_buy_s[2] = 0;
									
									
										if global.heroes_have[i] < 42 + 26 + 16 + 10 + 6 + 4 + 2
											{ hero_lvl[i] = 7; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6 - 10 - 16 - 26; hero_need[i] = 42 + 26 + 16 + 10 + 6 + 4 + 2; }
										if global.heroes_have[i] < 26 + 16 + 10 + 6 + 4 + 2
											{ hero_lvl[i] = 6; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6 - 10 - 16; hero_need[i] = 26 + 16 + 10 + 6 + 4 + 2; }
										if global.heroes_have[i] < 16 + 10 + 6 + 4 + 2
											{ hero_lvl[i] = 5; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6 - 10; hero_need[i] = 16 + 10 + 6 + 4 + 2; }
										if global.heroes_have[i] < 10 + 6 + 4 + 2
											{ hero_lvl[i] = 4; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6; hero_need[i] = 10 + 6 + 4 + 2; }
										if global.heroes_have[i] < 6 + 4 + 2
											{ hero_lvl[i] = 3; hero_now1[i] = global.heroes_have[i] - 2 - 4; hero_need[i] = 6 + 4 + 2; }
										if global.heroes_have[i] < 4 + 2
											{ hero_lvl[i] = 2; hero_now1[i] = global.heroes_have[i] - 2; hero_need[i] = 4 + 2; }
										if global.heroes_have[i] < 2
											{ hero_lvl[i] = 1; hero_now1[i] = global.heroes_have[i]; hero_need[i] = 2; }
		
										levelup[1] = global.heroes_have[i];
										levelup[2] = global.heroes_have[i];
										levelup[3] = global.heroes_have[i];
									
										lvlup[1] = 0;
										lvlup[2] = 0;
										lvlup[3] = 0;
									#endregion
									}
								}
							
							draw_sprite_ext_t(s_lootbox2, lootbox_i, 640 - 10, global.size / 2 - 120 + 65 + 70, 0.25 * lbs1 * upsc, 0.25 * lbs1 * upsc, 0, c_white, 1, c_white, c_black);
							draw_sprite_ext(s_light, 0, 640, global.size / 2 - 120 + 65 + 70, lootbox_aa, 0.5 * lootbox_aa, 0, c_white, lootbox_aa);
							if lootbox_s > 3
								{
								draw_set_alpha(0.1);
								draw_rectangle_color(0, -100 + training_back_y, 1280, global.size + training_back_y + 10, c_black, c_black, c_black, c_black, 0);
								draw_set_alpha(1);
						
								//////
								theme_a1[1] += 10;
								theme_x1[1] += lengthdir_x(random(0.5),theme_a1[i]);
								theme_y1[1] += lengthdir_y(random(0.5),theme_a1[i]);
						
								theme_a1[2] += 10;
								theme_x1[2] += lengthdir_x(random(0.5),theme_a1[i]);
								theme_y1[2] += lengthdir_y(random(0.5),theme_a1[i]);
								
								theme_a1[3] += 10;
								theme_x1[3] += lengthdir_x(random(0.5),theme_a1[i]);
								theme_y1[3] += lengthdir_y(random(0.5),theme_a1[i]);
								//////
								}
							//draw_sprite_ext(s_light,  1, 640 - 10 - lootbox_item_x[1] + theme_x1[1], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[1] + theme_y1[1], 0.6 * lootbox_item_s[1], 0.6 * lootbox_item_s[1], 0, c_white, 1);
							
							for(r=1;r<=3;r++)
								{
								if lootbox_item_o[r] < 2
									{
									//if os_get_language() != "ru"
									//	{
									//	if lootbox_item_t[r] = 0
									//		{
									//		draw_sprite_ext(s_totems_light, 1, 640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + theme_y1[r], 0.45 * lootbox_item_s[r], 0.45 * lootbox_item_s[r], 0, lootbox_item_c[r], 0.5);
									//		draw_sprite_ext(s_totems, 1, 640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + theme_y1[r], 0.45 * lootbox_item_s[r], 0.45 * lootbox_item_s[r], 0, c_black, 1);
									//		draw_text_transformed_t(640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + theme_y1[r], "?", 0.5 * lootbox_item_s[r], 0.5 * lootbox_item_s[r], 0, global.color_white, c_black);
									//		draw_text_transformed_t(640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + 100, "TAP", 0.17 * lootbox_item_s[r], 0.17 * lootbox_item_s[r], 0, global.color_white, c_black);
									//		}
									//		else
									//		{
									//		draw_sprite_ext(s_wanted2,  1, 640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + theme_y1[r], 0.65 * lootbox_item_s[r], 0.65 * lootbox_item_s[1], 0, lootbox_item_c[r], 0.5);
									//		draw_sprite_ext(s_wanted, 6, 640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + theme_y1[r], 0.65 * lootbox_item_s[r], 0.65 * lootbox_item_s[1], 0, c_black, 1);
									//		draw_text_transformed_t(640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + theme_y1[r], "?", 0.5 * lootbox_item_s[r], 0.5 * lootbox_item_s[1], 0, global.color_white, c_black);
									//		draw_text_transformed_t(640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + 100, "TAP", 0.17 * lootbox_item_s[r], 0.17 * lootbox_item_s[1], 0, global.color_white, c_black);
									//		}
									//	}
									//	else
									//	{
									//	if lootbox_item_t[r] = 0
									//		{
									//		draw_sprite_ext(s_totems_light, 1, 640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + theme_y1[r], 0.45 * lootbox_item_s[r], 0.45 * lootbox_item_s[r], 0, lootbox_item_c[r], 0.5);
									//		draw_sprite_ext(s_totems, 1, 640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + theme_y1[r], 0.45 * lootbox_item_s[r], 0.45 * lootbox_item_s[r], 0, c_black, 1);
									//		draw_text_transformed_t(640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + theme_y1[r], "?", 0.5 * lootbox_item_s[r], 0.5 * lootbox_item_s[r], 0, global.color_white, c_black);
									//		draw_text_transformed_t(640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + 100, "НАЖМИ", 0.17 * lootbox_item_s[r], 0.17 * lootbox_item_s[r], 0, global.color_white, c_black);
									//		}
									//		else
									//		{
									//		draw_sprite_ext(s_wanted2,  1, 640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + theme_y1[r], 0.65 * lootbox_item_s[r], 0.65 * lootbox_item_s[1], 0, lootbox_item_c[r], 0.5);
									//		draw_sprite_ext(s_wanted, 6, 640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + theme_y1[r], 0.65 * lootbox_item_s[r], 0.65 * lootbox_item_s[1], 0, c_black, 1);
									//		draw_text_transformed_t(640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + theme_y1[r], "?", 0.5 * lootbox_item_s[r], 0.5 * lootbox_item_s[1], 0, global.color_white, c_black);
									//		draw_text_transformed_t(640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + 100, "НАЖМИ", 0.17 * lootbox_item_s[r], 0.17 * lootbox_item_s[1], 0, global.color_white, c_black);
									//		}
									//	}
									if lootbox_item_t[r] = 0
										{
										draw_sprite_ext(s_totems_light, 1, 640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + theme_y1[r], 0.45 * lootbox_item_s[r], 0.45 * lootbox_item_s[r], 0, lootbox_item_c[r], 0.5);
										draw_sprite_ext(s_totems, 1, 640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + theme_y1[r], 0.45 * lootbox_item_s[r], 0.45 * lootbox_item_s[r], 0, c_black, 1);
										//draw_text_transformed_t(640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + theme_y1[r], "?", 0.5 * lootbox_item_s[r], 0.5 * lootbox_item_s[r], 0, global.color_white, c_black);
										//draw_text_transformed_t(640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + 100, "TAP", 0.17 * lootbox_item_s[r], 0.17 * lootbox_item_s[r], 0, global.color_white, c_black);
										}
										else
										{
										draw_sprite_ext(s_wanted2,  1, 640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + theme_y1[r], 0.65 * lootbox_item_s[r], 0.65 * lootbox_item_s[1], 0, lootbox_item_c[r], 0.5);
										draw_sprite_ext(s_wanted, 6, 640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + theme_y1[r], 0.65 * lootbox_item_s[r], 0.65 * lootbox_item_s[1], 0, c_black, 1);
										//draw_text_transformed_t(640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + theme_y1[r], "?", 0.5 * lootbox_item_s[r], 0.5 * lootbox_item_s[1], 0, global.color_white, c_black);
										//draw_text_transformed_t(640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + 100, "TAP", 0.17 * lootbox_item_s[r], 0.17 * lootbox_item_s[1], 0, global.color_white, c_black);
										}
									draw_text_transformed_t(640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + theme_y1[r], "?", 0.5 * lootbox_item_s[r], 0.5 * lootbox_item_s[r], 0, global.color_white, c_black);
									draw_text_transformed_t(640 - 10 - lootbox_item_x[r] * (r == 1) + lootbox_item_x[r] * (r == 3) + theme_x1[r], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[r] + 100, store_text[20], 0.17 * lootbox_item_s[r], 0.17 * lootbox_item_s[r], 0, global.color_white, c_black);
									}
								}
							//lootbox_item_t[j]
							//if lootbox_item_o[2] < 2
							//	{
							//	if lootbox_item_t[2] = 0
							//		{
							//		draw_sprite_ext(s_totems_light,  1, 640 - 10 + lootbox_item_x[2] + theme_x1[2], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[2] + theme_y1[2], 0.45 * lootbox_item_s[2], 0.45 * lootbox_item_s[2], 0, lootbox_item_c[2], 0.5);
							//		draw_sprite_ext(s_totems, 1, 640 - 10 + lootbox_item_x[2] + theme_x1[2], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[2] + theme_y1[2], 0.45 * lootbox_item_s[2], 0.45 * lootbox_item_s[2], 0, c_black, 1);
							//		draw_text_transformed_t(640 - 10 + lootbox_item_x[2] + theme_x1[2], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[2] + theme_y1[2], "?", 0.5 * lootbox_item_s[2], 0.5 * lootbox_item_s[2], 0, global.color_white, c_black);
							//		draw_text_transformed_t(640 - 10 + lootbox_item_x[2] + theme_x1[2], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[2] + 100, "TAP", 0.17 * lootbox_item_s[2], 0.17 * lootbox_item_s[2], 0, global.color_white, c_black);
							//		}
							//		else
							//		{
							//		draw_sprite_ext(s_wanted2,  1, 640 - 10 + lootbox_item_x[2] + theme_x1[2], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[2] + theme_y1[2], 0.65 * lootbox_item_s[2], 0.65 * lootbox_item_s[2], 0, lootbox_item_c[2], 0.5);
							//		draw_sprite_ext(s_wanted, 1, 640 - 10 + lootbox_item_x[2] + theme_x1[2], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[2] + theme_y1[2], 0.65 * lootbox_item_s[2], 0.65 * lootbox_item_s[2], 0, c_black, 1);
							//		draw_text_transformed_t(640 - 10 + lootbox_item_x[2] + theme_x1[2], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[2] + theme_y1[2], "?", 0.5 * lootbox_item_s[2], 0.5 * lootbox_item_s[2], 0, global.color_white, c_black);
							//		draw_text_transformed_t(640 - 10 + lootbox_item_x[2] + theme_x1[2], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[2] + 100, "TAP", 0.17 * lootbox_item_s[2], 0.17 * lootbox_item_s[2], 0, global.color_white, c_black);
							//		}
							//	}
					
							for(k=1;k<=3;k++)
								{
								if lootbox_item_o[k] >= 1
									{
									if lootbox_item_t[k] = 0
										{
										draw_sprite_ext(s_totems_light, lootbox_item_i[k], 640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 3) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + theme_y1[k], 0.45 * lootbox_item_s[k], 0.45 * lootbox_item_s[k], 0, lootbox_item_c[k], 0.5);
										
										draw_sprite_ext(s_totems, lootbox_item_i[k], 640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 3) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + theme_y1[k], 0.45 * lootbox_item_s[k] * lootbox_item_ss[k], 0.45 * lootbox_item_s[k] * lootbox_item_ss[k], 0, c_white, 1);
										draw_sprite_ext(s_totems_eyes, lootbox_item_i[k], 640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 3) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + theme_y1[k], 0.45 * lootbox_item_s[k] * lootbox_item_ss[k], 0.45 * lootbox_item_s[k] * lootbox_item_ss[k], 0, lootbox_item_c[k], 0.5);
										if lootbox_item_ss[k] = 1
											{ draw_text_ext_transformed_t(640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 3) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] - 160, string_upper(global.totem_name[lootbox_item_i[k]]), -1, 1000, 0.22 * lootbox_item_s[k], 0.22 * lootbox_item_s[k], 0, lootbox_item_c[k], c_black); }
										if lootbox_item_i[k] != 13
											{
											if lootbox_item_ss[k] = 1
												{ draw_text_ext_transformed_t(640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 3) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + 150 + string_height(string_upper(global.totem_desc[lootbox_item_i[k]])) * 0.12 * lootbox_item_s[k] / 2, string_upper(global.totem_desc[lootbox_item_i[k]]), -1, 2000, 0.12 * lootbox_item_s[k], 0.12 * lootbox_item_s[k], 0, lootbox_item_c[k], c_black); }
											}
											else
											{
											//if os_get_language() = "ru"
											//	{
											//	if lootbox_item_ss[k] = 1
											//		{ draw_text_ext_transformed_t(640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 3) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + 150 + string_height("НАНОСИТ УРОН ВРАГУ И 50% НАНОСИТ ВАМ") * 0.12 * lootbox_item_s[k] / 2, "DEAL DAMAGE TO RIVAL HERO AND...", -1, 2000, 0.12 * lootbox_item_s[k], 0.12 * lootbox_item_s[k], 0, lootbox_item_c[k], c_black); }
											//	}
											//	else
											//	{
											//	if lootbox_item_ss[k] = 1
											//		{ draw_text_ext_transformed_t(640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 3) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + 150 + string_height("DEAL DAMAGE TO RIVAL HERO AND...") * 0.12 * lootbox_item_s[k] / 2, "DEAL DAMAGE TO RIVAL HERO AND...", -1, 2000, 0.12 * lootbox_item_s[k], 0.12 * lootbox_item_s[k], 0, lootbox_item_c[k], c_black); }
											//	}
											draw_text_ext_transformed_t(640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 2) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + 150 + string_height("D") * 0.12 * lootbox_item_s[k] / 2, string_upper(string_copy(totem_desc[13],0,36)), -1, 2000, 0.12 * lootbox_item_s[k], 0.12 * lootbox_item_s[k], 0, lootbox_item_c[k], c_black);
											}
										}
										else
										{
										draw_sprite_ext(s_wanted2,  1, 640 - 10 + lootbox_item_x[k] * (k == 3) - lootbox_item_x[k] * (k == 1) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + theme_y1[k], 0.65 * lootbox_item_s[k], 0.65 * lootbox_item_s[k], 0, lootbox_item_c[k], 0.5);
										draw_sprite_ext_t(s_wanted, lootbox_item_i[k], 640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 3) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + theme_y1[k], 0.65 * lootbox_item_s[k] * lootbox_item_ss[k], 0.65 * lootbox_item_s[k] * lootbox_item_ss[k], 0, c_white, 1, c_white, c_black);
									
										if lootbox_item_ss[k] = 1 && lootbox_item_o[k] = 2
											{
											#region Левелап
												var hx, hy, ls, lh;
												hx = 640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 3) + theme_x1[k];
												hy = global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + theme_y1[k];
												ls = 1;
												lh = 1;
											
												if levelup[k] <= global.heroes_have[lootbox_item_i[k]]
													{
													//lootbox_item_v[k] -= 0.1;
													levelup[k] += 0.1;
													if levelup[k] mod 1 = 0
														{ ls = 1.1; }
													}
									
												#region Текущее  наполнение уровня
													if floor(levelup[k]) < 178 + 110 + 68 + 42 + 26 + 16 + 10 + 6 + 4 + 2
														{ hero_lvl[lootbox_item_i[k]] = 10; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6 - 10 - 16 - 26 - 42 - 68 - 110; hero_need[lootbox_item_i[k]] = 178; }
													if floor(levelup[k]) < 110 + 68 + 42 + 26 + 16 + 10 + 6 + 4 + 2
														{ hero_lvl[lootbox_item_i[k]] = 9; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6 - 10 - 16 - 26 - 42 - 68; hero_need[lootbox_item_i[k]] = 110; }
													if floor(levelup[k]) < 68 + 42 + 26 + 16 + 10 + 6 + 4 + 2
														{ hero_lvl[lootbox_item_i[k]] = 8; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6 - 10 - 16 - 26 - 42; hero_need[lootbox_item_i[k]] = 68; }
													
													if floor(levelup[k]) < 42 + 26 + 16 + 10 + 6 + 4 + 2
														{ hero_lvl[lootbox_item_i[k]] = 7; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6 - 10 - 16 - 26; hero_need[lootbox_item_i[k]] = 42; }
													if floor(levelup[k]) < 26 + 16 + 10 + 6 + 4 + 2
														{ hero_lvl[lootbox_item_i[k]] = 6; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6 - 10 - 16; hero_need[lootbox_item_i[k]] = 26; }
													if floor(levelup[k]) < 16 + 10 + 6 + 4 + 2
														{ hero_lvl[lootbox_item_i[k]] = 5; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6 - 10; hero_need[lootbox_item_i[k]] = 16; }
													if floor(levelup[k]) < 10 + 6 + 4 + 2
														{ hero_lvl[lootbox_item_i[k]] = 4; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6; hero_need[lootbox_item_i[k]] = 10; }
													if floor(levelup[k]) < 6 + 4 + 2
														{ hero_lvl[lootbox_item_i[k]] = 3; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4; hero_need[lootbox_item_i[k]] = 6; }
													if floor(levelup[k]) < 4 + 2
														{ hero_lvl[lootbox_item_i[k]] = 2; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2; hero_need[lootbox_item_i[k]] = 4; }
													if floor(levelup[k]) < 2
														{ hero_lvl[lootbox_item_i[k]] = 1; hero_now1[lootbox_item_i[k]] = floor(levelup[k]); hero_need[lootbox_item_i[k]] = 2; }
												#endregion
											
												if hero_now1[lootbox_item_i[k]] = 0
													{ lh = 1.1; }
									
												draw_set_alpha(0.5);
												draw_rectangle_color(hx - 100, hy - 20 + 140, hx + 100, hy + 20 + 140, c_black, c_black, c_black, c_black, 0);
												draw_set_alpha(1);
			
												draw_rectangle_color(hx - 100, hy - 20 + 140, hx + (100) * (hero_now1[lootbox_item_i[k]] / hero_need[lootbox_item_i[k]]), hy + 20 + 140, global.color_hero[lootbox_item_i[k]], global.color_hero[lootbox_item_i[k]], global.color_hero[lootbox_item_i[k]], global.color_hero[lootbox_item_i[k]], 0);
			
												draw_sprite_ext_t(s_themes_ss, lootbox_item_i[k], hx - 100, hy - 130, 0.3 * 1.8 * lh, 0.3 * 1.8 * lh, 0, global.color_hero[lootbox_item_i[k]], 1, global.color_hero[lootbox_item_i[k]], c_black);
												draw_text_transformed_t(hx - 100, hy - 130, string(hero_lvl[lootbox_item_i[k]]) + "", 0.18 * 1.8 * ls, 0.18 * 1.8 * ls, 0, global.color_white, c_black);
			
												draw_text_transformed_t(hx, hy + 140, "(" + string(hero_now1[lootbox_item_i[k]]) + "~" + string(hero_need[lootbox_item_i[k]]) + ")", 0.1 * 1.8 * ls, 0.1 * 1.8 * ls, 0, global.color_white, c_black);
											
												draw_text_transformed_t(hx + 100, hy - 130, "*" + string(floor(lootbox_item_v[k])), 0.2 * lootbox_item_s[k], 0.2 * lootbox_item_s[k], 0, global.color_white, c_black);
												
												//if os_get_language() != "ru"
												//	{
												//	if lvlup[k] = 1
												//		{ draw_text_transformed_t(hx, hy + 240, "LEVEL UP!", 0.2, 0.2, 0, global.color_white, c_black); }
												//	}
												//	else
												//	{
												//	if lvlup[k] = 1
												//		{ draw_text_transformed_t(hx, hy + 240, "НОВЫЙ\nУРОВЕНЬ!", 0.18, 0.18, 0, global.color_white, c_black); }
												//	}
												if lvlup[k] = 1
													{ draw_text_transformed_t(hx, hy + 240, store_text[21], 0.2, 0.2, 0, global.color_white, c_black); }
											#endregion
										
											var name;
											name = heroes_name[lootbox_item_i[k]];
											//name = string_upper(global.hero_code_name[lootbox_item_i[k]]);
											//if lootbox_item_i[k] = 2
											//	{ name = "DRUNK JOE"; }
											//if lootbox_item_i[k] = 5
											//	{ name = "BILL SR."; }
											
											//if os_get_language() = "ru"
											//	{
											//	switch(lootbox_item_i[k])
											//		{
											//		case 1: name = "ВОРИШКА"; break;
											//		case 2: name = "ПЬЯН. ДЖО"; break;
											//		case 3: name = "ОХОТНИЦА"; break;
											//		case 4: name = "ДИЕГО"; break;
											//		case 5: name = "БИЛЛ СТ."; break;
											//		case 6: name = "ШЕРИФ"; break;
											//		case 7: name = "ШАМАН"; break;
											//		}
											//	}
											draw_text_transformed_t(hx, hy + 180, name, 0.17 * lootbox_item_s[k], 0.17 * lootbox_item_s[k], 0, global.color_hero[lootbox_item_i[k]], c_black);
											}
										}
									}
								}
							}
						}
				#endregion
				}
			}
		////////// ЛУТБОКСЫ ПОВЕРХ
	#endregion
	#region Дейли поверх
		////////// ДЕЙЛИ ПОВЕРХ
		for(i=1;i<=3;i++)
			{
			if daily_buy[i] = 1 // && gold_buy_s[1] != 0
				{
				var upsc, minn, miny, vall, vall_c;
				upsc = 1.5;
				minn = 0.7;
				miny = 30;
				if daily_pr[i] = 1
					{ vall = "ç"; vall_c = global.cash_color; }
					else
					{ vall = "©"; vall_c = global.gold_color; }
				draw_set_alpha(0.7);
				draw_rectangle_color(0, -100, 1280, global.size + training_back_y + 10, c_black, c_black, c_black, c_black, 0);
				draw_set_alpha(1);
				
				//////////
				#region Отрисовка Дейли-вещи
					dall = i;
					var hoho;
					hoho = 1.8;
					if daily_t[dall] = 1
						{
						var name;
						name = heroes_name[daily_n[dall]];
						//name = string_upper(global.hero_code_name[daily_n[dall]]);
						
						//if daily_n[dall] = 2
						//	{ name = "DRUNK JOE"; }
						//if daily_n[dall] = 5
						//	{ name = "BILL SR."; }
										
						//if os_get_language() = "ru"
						//	{
						//	switch(daily_n[dall])
						//		{
						//		case 1: name = "ВОРИШКА"; break;
						//		case 2: name = "ПЬЯН. ДЖО"; break;
						//		case 3: name = "ОХОТНИЦА"; break;
						//		case 4: name = "ДИЕГО"; break;
						//		case 5: name = "БИЛЛ СТ."; break;
						//		case 6: name = "ШЕРИФ"; break;
						//		case 7: name = "ШАМАН"; break;
						//		}
						//	}
						
						draw_sprite_ext_t(s_wanted, daily_n[dall], 640, global.size / 2 + pry, 0.5 * (hoho - 0.15), 0.5 * (hoho - 0.15), 0, c_white, 1, c_white, c_black);
			
						draw_text_transformed_t(640, global.size / 2 + pry + 80 * (hoho - 0.25), name, 0.12 * (hoho - 0.25), 0.12 * (hoho - 0.25), 0, global.color_hero[daily_n[dall]], c_black);
						draw_text_transformed_t(640 + 70 * hoho, global.size / 2 + pry - 100 * hoho, "*" + string(daily_r[dall]), 0.18 * hoho, 0.18 * hoho, 0, global.color_white, c_black);
						}
						else
						{
						draw_sprite_ext(s_totems_light, daily_n[dall], 640, global.size / 2 + pry, 0.35 * hoho, 0.35 * hoho, 0, daily_c[dall], 0.5);
						draw_sprite_ext_t(s_totems, daily_n[dall], 640, global.size / 2 + pry, 0.35 * hoho, 0.35 * hoho, 0, c_white, 1, c_white, c_black);
						draw_sprite_ext(s_totems_eyes, daily_n[dall], 640, global.size / 2 + pry, 0.35 * hoho, 0.35 * hoho, 0, daily_c[dall], 0.5);
				
						draw_text_ext_transformed_t(640, global.size / 2 + pry - 80 * (hoho + 0.35), global.totem_name[daily_n[dall]], -1, 1000, 0.12 * (hoho - 0.25), 0.12 * (hoho - 0.25), 0, daily_c[dall], c_black);
						}
				#endregion
				//////////
				
				//draw_sprite_ext_t(s_currency_buy, 5 + i, 640, global.size / 2, 0.5 * sg1 * upsc, 0.5 * sg1 * upsc, 0, c_white, 1, c_white, c_black);
				
				if (daily_pr[i] = 1 && global.cash >= daily_p[i])
				or (daily_pr[i] = 0 && global.gold >= daily_p[i])
					{
					//if os_get_language() = "ru"
					//	{
					//	draw_sprite_ext_t(s_buy, 2, 640, global.size / 2 + 90 + 83, 0.45 * upsc * 0.85, 0.45 * daily_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
					//	draw_text_transformed_t(640, global.size / 2 + 140 + 83, string(daily_p[i]) + vall + " КУПИТЬ", 0.18 * upsc * minn, 0.18 * upsc * daily_buy_s[i] * minn, 0, vall_c, c_black);
					//	}
					//	else
					//	{
					//	draw_sprite_ext_t(s_buy, i - 1, 640, global.size / 2 + 90 + 83, 0.45 * upsc * 0.85, 0.45 * daily_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
					//	draw_text_transformed_t(640, global.size / 2 + 140 + 83, string(daily_p[i]) + vall + "BUY", 0.2 * upsc * minn, 0.2 * upsc * daily_buy_s[i] * minn, 0, vall_c, c_black);
					//	}
					draw_sprite_ext_t(s_buy, i - 1, 640, global.size / 2 + 90 + 83, 0.45 * upsc * 0.85, 0.45 * daily_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
					draw_text_transformed_t(640, global.size / 2 + 140 + 83, string(daily_p[i]) + vall + store_text[13], 0.2 * upsc * minn, 0.2 * upsc * daily_buy_s[i] * minn, 0, vall_c, c_black);
					}
					else
					{
					//if os_get_language() = "ru"
					//	{
					//	draw_sprite_ext_t(s_buy, 2, 640, global.size / 2 + 90 + 83, 0.45 * upsc * 0.85, 0.45 * daily_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
					//	draw_text_transformed_t(640, global.size / 2 + 140 + 83, "БОЛЬШЕ" + vall, 0.18 * upsc * minn, 0.18 * upsc * daily_buy_s[i] * minn, 0, vall_c, c_black);
					//	}
					//	else
					//	{
					//	draw_sprite_ext_t(s_buy, i - 1, 640, global.size / 2 + 90 + 83, 0.45 * upsc * 0.85, 0.45 * daily_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
					//	draw_text_transformed_t(640, global.size / 2 + 140 + 83, "GET MORE" + vall, 0.2 * upsc * minn, 0.2 * upsc * daily_buy_s[i] * minn, 0, vall_c, c_black);
					//	}
					draw_sprite_ext_t(s_buy, 2, 640, global.size / 2 + 90 + 83, 0.45 * upsc * 0.85, 0.45 * daily_buy_s[i] * upsc * 0.85, 0, c_white, 1, c_white, c_black);
					draw_text_transformed_t(640, global.size / 2 + 140 + 83, store_text[14] + vall, 0.18 * upsc * minn, 0.18 * upsc * daily_buy_s[i] * minn, 0, vall_c, c_black);
					}
				if mouse_check_button_pressed(mb_left)
					{
					//// КЛАЦ
					if mouse_check_button_pressed(mb_left)
						{
						if global.sound
							{ audio_play_sound(sd_text, 2, 0); }
						}
					//// КЛАЦ
					if point_in_rectangle(mouse_x, mouse_y, 640 - 150, global.size / 2 + 140 - 60 + 83, 640 + 150, global.size / 2 + 140 + 80 + 83) && daily_buy_s[i] = 1 
						{
						if (daily_pr[i] = 1 && global.cash >= daily_p[i])
						or (daily_pr[i] = 0 && global.gold >= daily_p[i])
							{
							if daily_pr[i] = 1
								{ global.cash -= daily_p[i]; }
								else
								{ global.gold -= daily_p[i]; }
							ini_open("Music.ini");
								ini_write_string("Sounds", "sound_on_g", string(global.gold));
								ini_write_string("Sounds", "sound_false_c", string(global.cash));
								
								if i = 1
									{
									ini_write_string("Design", "des4_b", "1");
									daily_b[1] = ini_read_real("Design", "des4_b",  0);
									}
								if i = 2
									{
									ini_write_string("Design", "des7_b", "1");
									daily_b[2] = ini_read_real("Design", "des7_b",  0);
									}
								if i = 3
									{
									ini_write_string("Design", "des9_b", "1");
									daily_b[3] = ini_read_real("Design", "des9_b",  0);
									}
								if daily_t[i] = 0
									{
									//ini_write_string("Sounds", "sound_false_c", "1");
										
									ini_write_string("Totems", "totem" + string(daily_n[i]), "1");
									ini_write_string("Totems", "totem_n" + string(daily_n[i]), "1");
									global.totem_have[daily_n[i]] = ini_read_real("Totems", "totem" + string(daily_n[i]), 0);
									global.totem_new[daily_n[i]]  = ini_read_real("Totems", "totem_n" + string(daily_n[i]), 0);
									}
									else
									{
									j = 2;
									
									lootbox_item_i[j] = daily_n[i];
									lootbox_item_v[j] = daily_r[i];
									levelup[j] = global.heroes_have[lootbox_item_i[j]];
									
									if hero_now1[lootbox_item_i[j]] + lootbox_item_v[j] >= hero_need[lootbox_item_i[j]]
										{ lvlup[j] = 1; }
										else
										{ lvlup[j] = 0; }
									
									global.heroes_have[lootbox_item_i[j]] += lootbox_item_v[j];
									ini_write_string("Heroes", "heroes" + string(lootbox_item_i[j]), string(global.heroes_have[lootbox_item_i[j]]));
									
									k = 2;
									}
							ini_close();
							daily_buy[i] = 2;
							if global.sound { audio_play_sound(sd_gold, 3, 0); }
							}
							else
							{
							daily_buy[i] = 0;
							if daily_pr[i] = 1
								{ store_yy1 = -785; }
								else
								{ store_yy1 = -1540; }
							}
						//daily_buy[i] = 2;
						io_clear();
						}
					}
				if mouse_check_button_released(mb_left)
					{
					if !(point_in_rectangle(mouse_x, mouse_y, 640 - 150, global.size / 2 + 140 - 60 + 83, 640 + 150, global.size / 2 + 140 + 80 + 83) && daily_buy_s[i] = 1)
						{ daily_buy[i] = 0; io_clear(); }
						else
						{ io_clear(); }
					}
				}
			if daily_buy[i] = 2 or daily_buy[i] = 3
				{
				var upsc, minn, miny, vall, vall_c;
				upsc = 1.5;
				minn = 0.7;
				miny = 30;
				if daily_pr[i] = 1
					{ vall = "ç"; vall_c = global.cash_color; }
					else
					{ vall = "©"; vall_c = global.gold_color; }
				draw_set_alpha(0.7);
				draw_rectangle_color(0, -100, 1280, global.size + training_back_y + 10, c_black, c_black, c_black, c_black, 0);
				draw_set_alpha(1);
				
				//////////
				#region Отрисовка Дейли-вещи
					dall = i;
					var hoho;
					hoho = 1.8;
					if daily_t[dall] = 1
						{
						#region Пеппа
							k = 2;
							//levelup[k] = global.heroes_have[daily_n[dall]];
							lootbox_item_i[k] = daily_n[dall];
							lootbox_item_s[k] = 1.2;
							lootbox_item_y[k] = -50;
							theme_y1[k] = 0;
							
							//draw_sprite_ext(s_wanted,  6, 640, global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + theme_y1[k], 0.65 * lootbox_item_s[k], 0.65 * lootbox_item_s[k], 0, c_black, 0.5);
							draw_sprite_ext_t(s_wanted, daily_n[dall], 640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 2) + theme_x1[k], global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + theme_y1[k], 0.65 * lootbox_item_s[k], 0.65 * lootbox_item_s[k], 0, c_white, 1, c_white, c_black);
									
							//if lootbox_item_ss[k] = 1 && lootbox_item_o[k] = 2
								//{
								#region Левелап
									var hx, hy, ls, lh;
									hx = 640 - 10 - lootbox_item_x[k] * (k == 1) + lootbox_item_x[k] * (k == 2) + theme_x1[k];
									hy = global.size / 2 - 120 + 65 + 70 + lootbox_item_y[k] + theme_y1[k];
									ls = 1;
									lh = 1;
											
									if levelup[k] <= global.heroes_have[lootbox_item_i[k]]
										{
										//lootbox_item_v[k] -= 0.1;
										levelup[k] += 0.1;
										if levelup[k] mod 1 = 0
											{ ls = 1.1; }
										}
									
									#region Текущее  наполнение уровня
										if floor(levelup[k]) < 178 + 110 + 68 + 42 + 26 + 16 + 10 + 6 + 4 + 2
											{ hero_lvl[lootbox_item_i[k]] = 10; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6 - 10 - 16 - 26 - 42 - 68 - 110; hero_need[lootbox_item_i[k]] = 178; }
										if floor(levelup[k]) < 110 + 68 + 42 + 26 + 16 + 10 + 6 + 4 + 2
											{ hero_lvl[lootbox_item_i[k]] = 9; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6 - 10 - 16 - 26 - 42 - 68; hero_need[lootbox_item_i[k]] = 110; }
										if floor(levelup[k]) < 68 + 42 + 26 + 16 + 10 + 6 + 4 + 2
											{ hero_lvl[lootbox_item_i[k]] = 8; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6 - 10 - 16 - 26 - 42; hero_need[lootbox_item_i[k]] = 68; }
												
										if floor(levelup[k]) < 42 + 26 + 16 + 10 + 6 + 4 + 2
											{ hero_lvl[lootbox_item_i[k]] = 7; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6 - 10 - 16 - 26; hero_need[lootbox_item_i[k]] = 42; }
										if floor(levelup[k]) < 26 + 16 + 10 + 6 + 4 + 2
											{ hero_lvl[lootbox_item_i[k]] = 6; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6 - 10 - 16; hero_need[lootbox_item_i[k]] = 26; }
										if floor(levelup[k]) < 16 + 10 + 6 + 4 + 2
											{ hero_lvl[lootbox_item_i[k]] = 5; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6 - 10; hero_need[lootbox_item_i[k]] = 16; }
										if floor(levelup[k]) < 10 + 6 + 4 + 2
											{ hero_lvl[lootbox_item_i[k]] = 4; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4 - 6; hero_need[lootbox_item_i[k]] = 10; }
										if floor(levelup[k]) < 6 + 4 + 2
											{ hero_lvl[lootbox_item_i[k]] = 3; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2 - 4; hero_need[lootbox_item_i[k]] = 6; }
										if floor(levelup[k]) < 4 + 2
											{ hero_lvl[lootbox_item_i[k]] = 2; hero_now1[lootbox_item_i[k]] = floor(levelup[k]) - 2; hero_need[lootbox_item_i[k]] = 4; }
										if floor(levelup[k]) < 2
											{ hero_lvl[lootbox_item_i[k]] = 1; hero_now1[lootbox_item_i[k]] = floor(levelup[k]); hero_need[lootbox_item_i[k]] = 2; }
									#endregion
											
									if hero_now1[lootbox_item_i[k]] = 0
										{ lh = 1.1; }
									
									draw_set_alpha(0.5);
									draw_rectangle_color(hx - 100, hy - 20 + 140, hx + 100, hy + 20 + 140, c_black, c_black, c_black, c_black, 0);
									draw_set_alpha(1);
			
									draw_rectangle_color(hx - 100, hy - 20 + 140, hx + (100) * (hero_now1[lootbox_item_i[k]] / hero_need[lootbox_item_i[k]]), hy + 20 + 140, global.color_hero[lootbox_item_i[k]], global.color_hero[lootbox_item_i[k]], global.color_hero[lootbox_item_i[k]], global.color_hero[lootbox_item_i[k]], 0);
			
									draw_sprite_ext_t(s_themes_ss, lootbox_item_i[k], hx - 100, hy - 130, 0.3 * 1.8 * lh, 0.3 * 1.8 * lh, 0, global.color_hero[lootbox_item_i[k]], 1, global.color_hero[lootbox_item_i[k]], c_black);
									draw_text_transformed_t(hx - 100, hy - 130, string(hero_lvl[lootbox_item_i[k]]) + "", 0.18 * 1.8 * ls, 0.18 * 1.8 * ls, 0, global.color_white, c_black);
			
									draw_text_transformed_t(hx, hy + 140, "(" + string(hero_now1[lootbox_item_i[k]]) + "~" + string(hero_need[lootbox_item_i[k]]) + ")", 0.1 * 1.8 * ls, 0.1 * 1.8 * ls, 0, global.color_white, c_black);
											
									draw_text_transformed_t(hx + 100, hy - 130, "*" + string(floor(daily_r[dall])), 0.2 * lootbox_item_s[k], 0.2 * lootbox_item_s[k], 0, global.color_white, c_black);
											
									if os_get_language() != "ru"
										{
										if lvlup[k] = 1
											{ draw_text_transformed_t(hx, hy + 240, "LEVEL UP!", 0.2, 0.2, 0, global.color_white, c_black); }
										}
										else
										{
										if lvlup[k] = 1
											{ draw_text_transformed_t(hx, hy + 240, "НОВЫЙ\nУРОВЕНЬ!", 0.18, 0.18, 0, global.color_white, c_black); }
										}
								#endregion
										
								var name;
								name = string_upper(global.hero_code_name[lootbox_item_i[k]]);
								if lootbox_item_i[k] = 2
									{ name = "DRUNK JOE"; }
								if lootbox_item_i[k] = 5
									{ name = "BILL SR."; }
										
								if os_get_language() = "ru"
									{
									switch(lootbox_item_i[k])
										{
										case 1: name = "ВОРИШКА"; break;
										case 2: name = "ПЬЯН. ДЖО"; break;
										case 3: name = "ОХОТНИЦА"; break;
										case 4: name = "ДИЕГО"; break;
										case 5: name = "БИЛЛ СТ."; break;
										case 6: name = "ШЕРИФ"; break;
										case 7: name = "ШАМАН"; break;
										}
									}
								draw_text_transformed_t(hx, hy + 180, name, 0.17 * lootbox_item_s[k], 0.17 * lootbox_item_s[k], 0, global.color_hero[lootbox_item_i[k]], c_black);
								//}
						#endregion
						//var name;
						//name = string_upper(global.hero_code_name[daily_n[dall]]);
						
						//if daily_n[dall] = 2
						//	{ name = "DRUNK JOE"; }
						//if daily_n[dall] = 5
						//	{ name = "BILL SR."; }
										
						//if os_get_language() = "ru"
						//	{
						//	switch(daily_n[dall])
						//		{
						//		case 1: name = "ВОРИШКА"; break;
						//		case 2: name = "ПЬЯН. ДЖО"; break;
						//		case 3: name = "ОХОТНИЦА"; break;
						//		case 4: name = "ДИЕГО"; break;
						//		case 5: name = "БИЛЛ СТ."; break;
						//		case 6: name = "ШЕРИФ"; break;
						//		case 7: name = "ШАМАН"; break;
						//		}
						//	}
						
						//draw_sprite_ext_t(s_wanted, daily_n[dall], 640, global.size / 2 + pry, 0.5 * (hoho - 0.15), 0.5 * (hoho - 0.15), 0, c_white, 1, c_white, c_black);
						
						//draw_text_transformed_t(640, global.size / 2 + pry + 80 * (hoho - 0.25), name, 0.12 * (hoho - 0.25), 0.12 * (hoho - 0.25), 0, global.color_hero[daily_n[dall]], c_black);
						//draw_text_transformed_t(640 + 70 * hoho, global.size / 2 + pry - 100 * hoho, "*" + string(daily_r[dall]), 0.18 * hoho, 0.18 * hoho, 0, global.color_white, c_black);
						}
						else
						{
						draw_sprite_ext(s_light, 0, 640, global.size / 2 + pry, 0.75, 0.75, 0, c_white, 0.7);
						
						draw_sprite_ext(s_totems_light, daily_n[dall], 640, global.size / 2 + pry, 0.38 * hoho, 0.38 * hoho, 0, daily_c[dall], 0.5);
						draw_sprite_ext_t(s_totems, daily_n[dall], 640, global.size / 2 + pry, 0.38 * hoho, 0.38 * hoho, 0, c_white, 1, c_white, c_black);
						draw_sprite_ext(s_totems_eyes, daily_n[dall], 640, global.size / 2 + pry, 0.38 * hoho, 0.38 * hoho, 0, daily_c[dall], 0.5);
				
						draw_text_ext_transformed_t(640, global.size / 2 + pry - 80 * (hoho + 0.35), global.totem_name[daily_n[dall]], -1, 1000, 0.12 * (hoho - 0.25), 0.12 * (hoho - 0.25), 0, daily_c[dall], c_black);
						//if os_get_language() = "ru"
						//	{ draw_text_ext_transformed_t(640, global.size / 2 + pry + 100 * (hoho + 0.35), "НОВОЕ!", -1, 1000, 0.19 * (hoho - 0.25), 0.19 * (hoho - 0.25), 0, c_orange, c_black); }
						//	else
						//	{ draw_text_ext_transformed_t(640, global.size / 2 + pry + 100 * (hoho + 0.35), "NEW!", -1, 1000, 0.19 * (hoho - 0.25), 0.19 * (hoho - 0.25), 0, c_orange, c_black); }
						draw_text_ext_transformed_t(640, global.size / 2 + pry + 100 * (hoho + 0.35), totems_text[1], -1, 1000, 0.19 * (hoho - 0.25), 0.19 * (hoho - 0.25), 0, c_orange, c_black);
						}
				#endregion
				//////////
				
				if mouse_check_button_pressed(mb_left) && daily_buy[i] = 2
					{ daily_buy[i] = 3; }
				
				if mouse_check_button_released(mb_left) && daily_buy[i] = 3
					{
					//// КЛАЦ
					if global.sound
						{ audio_play_sound(sd_text, 2, 0); }
					//// КЛАЦ
					daily_buy[i] = 0;
					io_clear();
					}
				}
			}
		////////// ДЕЙЛИ ПОВЕРХ
	#endregion
	}
#endregion
#region Квесты / Статистика
	if global.menu_now = "quests" or global.menu_next = "quests"
		{
		if global.menu_next = "quests"
			{
			if global.menu_now != "quests"
				{
				if global.quests_scale < 1
					{ global.quests_scale += 0.1; }
					else
					{
					global.quests_scale = 1;
					global.menu_now = global.menu_next;
					}
				}
			}
			else
			{
			if global.quests_scale > 0
				{ global.quests_scale -= 0.2; }
				else
				{
				global.quests_scale = 0;
				global.menu_now = global.menu_next;
				}
			}
		draw_set_alpha(0.5);
			draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
		draw_set_alpha(1);
		
		draw_sprite_ext_t(s_quests_back, 0, 640, global.size / 2, global.quests_scale * global.quests_scale1, global.quests_scale * global.quests_scale1, 0, c_white, 1, c_white, c_black);
		
		for(i=1;i<=3;i++)
			{
			if global.quests_a[i] = 1
				{
				draw_sprite_ext(s_quests_lists, global.quests_t[i], 640 + (-340 + 170 * i) * global.quests_scale * (global.quests_scale1 / 0.5) + 5, global.size / 2 - 192 * global.quests_scale1 + 5 + 10, global.quests_scale * global.quests_scale1, global.quests_scale * global.quests_scale1, -prx / 2, c_black, 0.5);
				draw_sprite_ext_t(s_quests_lists, global.quests_t[i], 640 + (-340 + 170 * i) * global.quests_scale * (global.quests_scale1 / 0.5), global.size / 2 - 192 * global.quests_scale1 + 5, global.quests_scale * global.quests_scale1, global.quests_scale * global.quests_scale1, -prx / 2, c_white, 1, c_white, c_black);
			
				//draw_sprite_ext_t(s_quests_lists, 0, 640 + (-340 + 170 * i) * global.quests_scale, global.size / 2 - 192 * global.quests_scale1 + pry / 2, global.quests_scale * global.quests_scale1, global.quests_scale * global.quests_scale1, 0, c_white, 1, c_white, c_black);
				draw_text_ext_transformed_t(640 + (-340 + 170 * i) * global.quests_scale * (global.quests_scale1 / 0.5) + lengthdir_x(135 * (global.quests_scale1 / 0.5), -prx / 2 + 270), global.size / 2 - 192 * global.quests_scale1 + 5 + lengthdir_y(135 * (global.quests_scale1 / 0.5), -prx / 2 + 270), global.quests_d[i], -1, 2000, global.quests_scale * 0.08, global.quests_scale * 0.08, -prx / 2, global.color_white, c_black);
				
				if global.quests_refresh
					{
					draw_sprite_ext_t(s_refresh, 0, 640 + (-340 + 170 * i) * global.quests_scale * (global.quests_scale1 / 0.5) + 85, global.size / 2 - 192 * global.quests_scale1, global.quests_scale * global.quests_scale1 * 0.8, global.quests_scale * global.quests_scale1 * 0.8, 0, global.color_white, 1, global.color_white, c_black); 
					
					if point_in_circle(mouse_x, mouse_y, 640 + (-340 + 170 * i) * global.quests_scale * (global.quests_scale1 / 0.5) + 60, global.size / 2 - 192 * global.quests_scale1, 35 * (global.quests_scale1 / 0.5))
						{
						if mouse_check_button_pressed(mb_left)
							{
							if global.sound { audio_play_sound(sd_text, 2, 0); }
							#region Квесты
								//nnn[i] = 1;
								
								ini_open("Music.ini");
									ini_write_string("Qual", "qual_rr", "0");
									global.quests_refresh = ini_read_real("Qual", "qual_rr", 1);
									#region Все варианты обновления
									if i = 1 //nnn[1] = 1 && nnn[2] = 0 && nnn[3] = 0
										{
										global.quests_t[1] = global.quests_t[2];
										while(global.quests_t[1] = global.quests_t[2])
											{
											global.quests_t[1] = irandom_range(1, 26);
											while(global.quests_t[1] = global.quests_t[3])
												{ global.quests_t[1] = irandom_range(1, 26); }
											}
			
										ini_write_string("Qual", "qual_t_1", string(global.quests_t[1]));
			
										ini_write_string("Qual", "qual_1", "0");
										}
									if i = 2 //nnn[1] = 0 && nnn[2] = 1 && nnn[3] = 0
										{
										global.quests_t[2] = global.quests_t[1];
										while(global.quests_t[2] = global.quests_t[1])
											{
											global.quests_t[2] = irandom_range(1, 26);
											while(global.quests_t[2] = global.quests_t[3])
												{ global.quests_t[2] = irandom_range(1, 26); }
											}
			
										ini_write_string("Qual", "qual_t_2", string(global.quests_t[2]));
			
										ini_write_string("Qual", "qual_2", "0");
										}
									if i = 3 //nnn[1] = 0 && nnn[2] = 0 && nnn[3] = 1
										{
										global.quests_t[3] = global.quests_t[1];
										while(global.quests_t[3] = global.quests_t[1])
											{
											global.quests_t[3] = irandom_range(1, 26);
											while(global.quests_t[3] = global.quests_t[2])
												{ global.quests_t[3] = irandom_range(1, 26); }
											}
										ini_write_string("Qual", "qual_t_3", string(global.quests_t[3]));
			
										ini_write_string("Qual", "qual_3", "0");
										}
								#endregion
									
									if global.quests_t[i] = 18
										{
										for(j=2;j<=7;j++)
											{
											ini_write_string("Var", "v" + string(j), "0");
											global.varr[j] = ini_read_real("Var", "v" + string(i), 0);
											}
										}
									global.quests_t[i] = ini_read_real("Qual", "qual_t_" + string(i), 1);
								
									global.quests_a[i] = 1;
									global.quests_s[i] = 0.5;
								
									global.quests_n_all[i] = 1;
									global.quests_n_now[i] = 0;
			
									if nnn[i] = 1//global.quests_a[i] = 0
										{
										global.quests_n[i]  = 1;
			
										global.quests_n_all[i] = 1;
										global.quests_n_now[i] = 0;
			
										global.quests_pt[i] = choose("ç", "©", "©", "©");
										#region Задания 1
										if 1//global.quests_t[i]
											{
											if global.quests_t[i] = 1 or global.quests_t[i] = 2
											or global.quests_t[i] = 3 or global.quests_t[i] = 4
												{
												global.quests_n[i] = choose(1, 2);
												}
			
											if global.quests_t[i] = 5 or global.quests_t[i] = 6 or global.quests_t[i] = 7
											or global.quests_t[i] = 8 or global.quests_t[i] = 9 or global.quests_t[i] = 10
												{
												global.quests_n[i] = choose(1, 2, 3, 4);
												}
				
											if global.quests_t[i] = 11 or global.quests_t[i] = 12 or global.quests_t[i] = 13
												{
												global.quests_n[i] = choose(1, 2, 3);
												}
											if global.quests_t[i] = 14
												{ global.quests_n[i] = 1; }
											if global.quests_t[i] = 15
												{ global.quests_n[i] = 2; }
											if global.quests_t[i] = 16
												{
												global.quests_n[i] = choose(1, 2, 3);
												}
											if global.quests_t[i] = 17
												{
												global.quests_n[i] = choose(1, 2, 3);
												}
			
											if global.quests_t[i] = 18
												{
												global.quests_n[i] = 3;
												}
			
											if global.quests_t[i] = 19
												{ global.quests_n[i] = 2; }
			
											if global.quests_t[i] = 20
												{ global.quests_n[i] = 2; }
			
											if global.quests_t[i] = 21
												{ global.quests_n[i] = 2; }
			
											if global.quests_t[i] = 22
												{
												global.quests_n[i] = 2;
												}
			
											if global.quests_t[i] = 23
												{
												global.quests_n[i] = 2;
												}
			
											if global.quests_t[i] = 24
												{
												global.quests_n[i] = 2;
												}
			
											if global.quests_t[i] = 25
												{ global.quests_n[i] = 2; }
			
											if global.quests_t[i] = 26
												{
												global.quests_n[i] = 2;
												}
											}
									#endregion
			
										ini_write_string("Qual", "qual_pt_" + string(i), string(global.quests_pt[i]));
										ini_write_string("Qual", "qual_n_" + string(i), string(global.quests_n[i]));
										
										ini_write_string("Qual", "qual_a_" + string(i), "1");
										ini_write_string("Qual", "qual_nno_" + string(i), "0");
										global.quests_a[i] = ini_read_real("Qual", "qual_a_" + string(i), 1);
										}
									
									global.quests_n_now[i] = ini_read_real("Qual", "qual_nno_" + string(i), 1);
									global.quests_pt[i] = ini_read_string("Qual", "qual_pt_" + string(i), "©");
									global.quests_n[i]  = ini_read_real("Qual", "qual_n_" + string(i), 1);
									#region Задания 2
											if 1//global.quests_t[i]
												{
												if global.quests_t[i] = 1 or global.quests_t[i] = 2
												or global.quests_t[i] = 3 or global.quests_t[i] = 4
													{
													switch(global.quests_n[i])
														{
														case 1: global.quests_n_all[i] = 3; break;
														case 2: global.quests_n_all[i] = 5; break;
														}
													}
			
												if global.quests_t[i] = 5 or global.quests_t[i] = 6 or global.quests_t[i] = 7
												or global.quests_t[i] = 8 or global.quests_t[i] = 9 or global.quests_t[i] = 10
													{
													switch(global.quests_n[i])
														{
														case 1: global.quests_n_all[i] = 10; break;
														case 2: global.quests_n_all[i] = 20; break;
														case 3: global.quests_n_all[i] = 30; break;
														case 4: global.quests_n_all[i] = 50; break;
														}
													}
				
												if global.quests_t[i] = 11 or global.quests_t[i] = 12 or global.quests_t[i] = 13
													{
													switch(global.quests_n[i])
														{
														case 1: global.quests_n_all[i] = 5; break;
														case 2: global.quests_n_all[i] = 10; break;
														case 3: global.quests_n_all[i] = 15; break;
														}
													}
												if global.quests_t[i] = 16
													{
													switch(global.quests_n[i])
														{
														case 1: global.quests_n_all[i] = 1000; break;
														case 2: global.quests_n_all[i] = 4000; break;
														case 3: global.quests_n_all[i] = 7000; break;
														}
													}
												if global.quests_t[i] = 17
													{
													switch(global.quests_n[i])
														{
														case 1: global.quests_n_all[i] = 5; break;
														case 2: global.quests_n_all[i] = 10; break;
														case 3: global.quests_n_all[i] = 15; break;
														}
													}
			
												if global.quests_t[i] = 18
													{
													global.quests_n_all[i] = 6;
													}
			
												if global.quests_t[i] = 22
													{
													global.quests_n_all[i] = 7;
													}
			
												if global.quests_t[i] = 23
													{
													global.quests_n_all[i] = 3;
													}
			
												if global.quests_t[i] = 24
													{
													global.quests_n_all[i] = 300;
													}
			
												if global.quests_t[i] = 26
													{
													global.quests_n_all[i] = 500;
													}
												}
										#endregion
			
									global.quests_d[i] = "";
									if global.quests_t[i] > 0 && global.quests_t[i] <= 4
										{ global.quests_d[i] = "ВЫИГРАТЬ " + string(global.quests_n_all[i]) + " МАТЧЕЙ ЗА "; }
									if global.quests_t[i] >= 5 && global.quests_t[i] <= 10
										{ global.quests_d[i] = "ОТВЕТИТЬ ВЕРНО НА " + string(global.quests_n_all[i]) + " ВОПРОСОВ ТЕМЫ "; }
									if global.quests_t[i] >= 11 && global.quests_t[i] <= 13
										{ global.quests_d[i] = "СЫГРАТЬ " + string(global.quests_n_all[i]) + " РАЗ "; }
		
									switch(global.quests_t[i])
										{
										case 1:
											global.quests_d[i] += "ВОРИШКУ ИЛИ ДИЕГО";
										break;
										case 2:
											global.quests_d[i] += "ШЕРИФА ИЛИ ДЖО";
										break;
										case 3:
											global.quests_d[i] += "ОХОТНИЦУ ИЛИ ШАМАНА";
										break;
										case 4:
											global.quests_d[i] += "БИЛЛА МЛАДШЕГО";
										break;
										case 5:
											global.quests_d[i] += "КАРТ";
										break;
										case 6:
											global.quests_d[i] += "БУТЫЛКИ";
										break;
										case 7:
											global.quests_d[i] += "ДВИЖЕНИЕ";
										break;
										case 8:
											global.quests_d[i] += "ВНИМАНИЕ";
										break;
										case 9:
											global.quests_d[i] += "СТРЕЛЬБА";
										break;
										case 10:
											global.quests_d[i] += "МАТЕМАТИКА";
										break;
										case 11:
											global.quests_d[i] += "В БЫСТРУЮ ИГРУ";
										break;
										case 12:
											global.quests_d[i] += "В РАНГОВУЮ ИГРУ";
										break;
										case 13:
											global.quests_d[i] += "С ДРУГОМ";
										break;
										case 14:
											global.quests_d[i]  = "ВЫИГРАТЬ МАТЧ БЕЗ ОШИБОК";
										break;
										case 15:
											global.quests_d[i]  = "ВЫИГРАТЬ ДУЭЛЬ, ТРАТЯ НЕ БОЛЕЕ 3 СЕКУНД НА ОТВЕТ";
										break;
										case 16:
											global.quests_d[i]  = "НАНЕСТИ " + string(global.quests_n_all[i]) + " УРОНА";
										break;
										case 17:
											global.quests_d[i]  = "ИСПОЛЬЗОВАТЬ СПОСОБНОСТЬ " + string(global.quests_n_all[i]) + " РАЗ";
										break;
										case 18:
											global.quests_d[i]  = "СВОРОВАТЬ СПОСОБНОСТЬ У КАЖДОГО ПЕРСОНАЖА";
										break;
										case 19:
											global.quests_d[i]  = "ВЫИГРАТЬ ДУЭЛЬ, КОГДА ВРАГ ОШЛУШЕН";
										break;
										case 20:
											global.quests_d[i]  = "УДЕРЖИВАТЬ ВРАГА ОТРАВЛЕННЫМ 15 СЕКУНД";
										break;
										case 21:
											global.quests_d[i]  = "ДОВЕСТИ ХП ВРАГА ДО НУЛЯ, ВЕРНУВ ЕМУ УРОН";
										break;
										case 22:
											global.quests_d[i]  = "ОТВЕТИТЬ ВЕРНО НА 7 ВОПРОСОВ В ТУМАНЕ";
										break;
										case 23:
											global.quests_d[i]  = "ВЫИГРАТЬ 3 ДУЭЛИ, НЕ ИСПОЛЬЗУЯ СПОСОБНОСТЬ";
										break;
										case 24:
											global.quests_d[i]  = "НАНЕСТИ ВРАГУ 300 УРОНА ТОТЕМОМ ОГНЯ";
										break;
										case 25:
											global.quests_d[i]  = "3 РАЗА НАНЕСТИ УРОН, ПРОМАХНУВШИСЬ";
										break;
										case 26:
											global.quests_d[i]  = "НАНЕСТИ ВРАГУ 500 УРОНА ТОТЕМОМ МОЛНИИ";
										break;
										}
								
									global.quests_p[i]  = 40;
								
									if global.quests_pt[i] = "©"
										{
										switch(global.quests_n[i])
											{
											case 1: global.quests_p[i] = 40; break;
											case 2: global.quests_p[i] = 60; break;
											case 3: global.quests_p[i] = 80; break;
											case 4: global.quests_p[i] = 100; break;
											}
										}
										else
										{
										switch(global.quests_n[i])
											{
											case 1: global.quests_p[i] = 8; break;
											case 2: global.quests_p[i] = 12; break;
											case 3: global.quests_p[i] = 16; break;
											case 4: global.quests_p[i] = 25; break;
											}
										}
									//}
	
								ini_close();
							#endregion
							}
						}
					//draw_circle_color(640 + (-340 + 170 * i) * global.quests_scale + 60, global.size / 2 - 192 * global.quests_scale1, 35,c_white, c_white, 1);
					}
				if global.quests_n_all[i] > 1
					{
					draw_text_ext_transformed_t(640 + (-340 + 170 * i) * global.quests_scale * (global.quests_scale1 / 0.5) + lengthdir_x(185 * (global.quests_scale1 / 0.5), -prx / 2 + 270), global.size / 2 - 192 * global.quests_scale1 + 5 + lengthdir_y(185 * (global.quests_scale1 / 0.5), -prx / 2 + 270), string(global.quests_n_now[i]) + "~" +string(global.quests_n_all[i]), -1, 2000, global.quests_scale * 0.15, global.quests_scale * 0.15, -prx / 2, global.color_white, c_black);
				
					//draw_text_ext_transformed_t(640 + (-340 + 170 * i) * global.quests_scale, global.size / 2 - 192 * global.quests_scale1, string(global.quests_n_now[i]) + "~" +string(global.quests_n_all[i]), -1, 2000, global.quests_scale * 0.12, global.quests_scale * 0.12, prx / 2, global.color_white, c_black);
					}
				
				if global.quests_pt[i] = "©"
					{ draw_text_ext_transformed_t(640 + (-340 + 170 * i) * global.quests_scale * (global.quests_scale1 / 0.5), global.size / 2 + 130 * (global.quests_scale1 / 0.5), string(global.quests_p[i]) + string(global.quests_pt[i]), -1, 2000, global.quests_scale * 0.2 * (global.quests_scale1 / 0.5), global.quests_scale * 0.2 * (global.quests_scale1 / 0.5), 0, global.gold_color, c_black); }
					else
					{ draw_text_ext_transformed_t(640 + (-340 + 170 * i) * global.quests_scale * (global.quests_scale1 / 0.5), global.size / 2 + 130 * (global.quests_scale1 / 0.5), string(global.quests_p[i]) + string(global.quests_pt[i]), -1, 2000, global.quests_scale * 0.2 * (global.quests_scale1 / 0.5), global.quests_scale * 0.2 * (global.quests_scale1 / 0.5), 0, global.cash_color, c_black); }
				draw_sprite_ext_t(s_quests_lists, 0, 640 + (-340 + 170 * i) * global.quests_scale * (global.quests_scale1 / 0.5), global.size / 2 - 192 * global.quests_scale1, global.quests_scale * global.quests_scale1, global.quests_scale * global.quests_scale1, 0, c_white, 1, c_white, c_black);
				}
			}
		
		draw_text_transformed_t(640, global.size / 2 - 150 * (global.quests_scale1 / 0.5), main_text[2], global.quests_scale * 0.25, global.quests_scale * 0.25, 0, global.color_white, c_black); // Quests
		
		if !(point_in_rectangle(mouse_x, mouse_y, 640 - 320 * 1.4, global.size / 2 - 150 * 1.4, 640 + 320 * 1.4, global.size / 2 + 150 * 1.4))
		or (point_in_rectangle(mouse_x, mouse_y, 640 - 305 * 1.4 - 40, global.size / 2 - 132 * 1.4 - 40, 640 - 305 * 1.4 + 40, global.size / 2 - 132 * 1.4 + 40))
			{
			//// КЛАЦ
			if mouse_check_button_pressed(mb_left)
				{
				if global.sound
					{ audio_play_sound(sd_text, 2, 0); }
				}
			//// КЛАЦ
			if mouse_check_button_released(mb_left)
				{
				//if global.duel = 1
				//	{ global.duel = 0; }
				global.menu_next = "main";
				
				io_clear();
				}
			}
		
		draw_set_font(global.game_font);
		draw_set_alpha(0.5);
		draw_set_color(c_black);
		draw_text_transformed(640 - 305 * (global.quests_scale1 / 0.5), global.size / 2 - 132 * (global.quests_scale1 / 0.5), "X", global.quests_scale * 0.25, global.quests_scale * 0.25, 0);
		draw_set_color(c_white);
		draw_set_alpha(1);
		}
#endregion

#region Титры
	if global.titles = 1
		{
		draw_set_alpha(0.7);
		draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
		draw_set_alpha(1);
		
		if title_yy + title_y[24] > - 200
			{ title_yy -= 4; }
			else
			{
			global.titles = 0;
			title_yy = global.size - 50;
			for(i=1;i<=25;i++)
				{
				title_scale[i] = 0.2;
				title_y[i] = 150 * i;
				}
			}
		
		for(i=1;i<=25;i++)
			{
			if title_yy + title_y[i] < global.size + 50 && title_yy + title_y[i] > - 50
				{ title_scale[i] += 0.0005; }
			if title_yy + title_y[i] > -400
				{ draw_text_transformed_t(640, title_yy + title_y[i], title_text[i], title_scale[i], title_scale[i], 0, title_coll[i], c_black); }
			}
		
		if mouse_check_button_released(mb_left)
			{
			if global.sound
				{ audio_play_sound(sd_text, 2, 0); }
			
			global.titles = 0;
			title_yy = global.size - 50;
			for(i=1;i<=25;i++)
				{
				title_scale[i] = 0.2;
				title_y[i] = 150 * i;
				}
			io_clear();
			}
		}
#endregion
#region Музыка
	if global.music = 1
		{
		if !audio_is_playing(sd_menu)
			{
			audio_stop_all();
			audio_play_sound(sd_menu, 1, true);
			}
		if audio_is_paused(sd_menu)
			{ audio_resume_sound(sd_menu); }
		//if !audio_is_playing(sd_menu)
		//	{
		//	audio_stop_all();
		//	audio_play_sound(sd_menu, 1, true);
		//	}
		}
		else
		{
		if audio_is_playing(sd_menu)
			{ audio_pause_sound(sd_menu); }
		}
#endregion
#region Тряска
	if tr_timm > 0
		{ tr_timm -= 1; }
		else
		{
		if tr_time > 0
			{
			tr_time -= 1;
			if (tr_ang > 8 && tr_dir = 1)
			or (tr_ang < -8 && tr_dir = -1)
				{ tr_dir = -tr_dir; tr_ang += 1 * tr_dir; }
				else
				{ tr_ang += 1 * tr_dir; }
			}
			else
			{
			tr_ang = 0;
			tr_time = room_speed * 2;
			tr_timm = room_speed * irandom_range(3,6);
			}
		}
#endregion

#region Старое
	/*
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
	*/
#endregion
#region Отладка
	//draw_set_font(global.game_font);
	//draw_text_transformed_t(mouse_x, mouse_y, string(global.tr[1]), 0.25, 0.25, 0, c_white, c_black);
	//draw_set_font(global.game_font);
	//draw_text_transformed_t(mouse_x, mouse_y, string(store_yy1), 0.25, 0.25, 0, c_white, c_black);
	if keyboard_check_pressed(ord("T"))
	or nowday != current_day or nowmon != current_month
		{
		#region Дейли
		ini_open("Music.ini");
	
		if 1//!ini_section_exists("Design")
			{
			#region Рандом Дейли
				var d_t1, d_n1, d_p1, d_r1, dasd1,
					d_t2, d_n2, d_p2, d_r2, dasd2,
					d_t3, d_n3, d_p3, d_r3, dasd3;
				
				dasd1 = 0;
				dasd2 = 0;
				dasd3 = 0;
			
				////////
			
				d_t1 = choose(1, 1, 1, 1, 0);
				d_t2 = choose(1, 1, 1, 1, 0);
			
				if d_t1 = 0 && d_t2 = 0
					{ d_t3 = 1; }
					else
					{
					if 0//d_t1 = 1 && d_t2 = 1
						{ d_t3 = 0; }
						else
						{ d_t3 = choose(1, 1, 1, 1, 0); }
					}
			
				var ta;
					ta = 0;
					for(l=1;l<=18;l++)
						{ ta += global.totem_have[l]; }
									
					if ta = 18
						{ d_t1 = 1; d_t2 = 1; d_t3 = 1; }
				////////
			
				d_p1 = choose(1, 0);
				d_p2 = choose(1, 0);
			
				if d_p1 = 0 && d_p2 = 0
					{ d_p3 = 1; }
					else
					{
					if d_p1 = 1 && d_p2 = 1
						{ d_p3 = 0; }
						else
						{ d_p3 = choose(1, 1, 0); }
					}
			
				////////
				if d_t1 = 0
					{
					#region Рандом тотемов 1
						var ti, totems, tr, trr;
						totems = "";
						tr  = choose(3, 4);
						trr = tr;
					
						while(totems = "")
							{
							#region Третий
								if tr = 3
									{
									totems = "";
									for(i=1;i<=4;i++)
										{
										if global.totem_have[i+11] = 0
											{ totems += string(i); }
										}
									if totems = ""
										{
										if trr = 3
											{ tr = 4; }
											else
											{ d_t1 = 1; }
										}
									}
							#endregion
							#region Четвёртый
								if tr = 4
									{
									totems = "";
									for(i=1;i<=3;i++)
										{
										if global.totem_have[i+15] = 0
											{ totems += string(i); }
										}
									if totems = ""
										{
										if trr = 4
											{ tr = 3;}
											else
											{ d_t1 = 1;  }
										}
									}
							#endregion
							}
						
						if d_t1 = 0
							{
							ti = irandom_range(1, string_length(totems));
							if tr = 3
								{ dasd1 = c_fuchsia; d_n1 = 11 + real(string_copy(totems, ti, 1)); }
							if tr = 4
								{ dasd1 = c_orange; d_n1 = 15 + real(string_copy(totems, ti, 1)); }
							
							//if d_n1 < 16
							//	{ dasd1 = c_fuchsia; }
							//if d_n1 >= 16
							//	{ dasd1 = c_orange; }
							}
					#endregion
					}
				if d_t2 = 0
					{
					#region Рандом тотемов 2
						var ti, totems, tr, trr;
						totems = "";
						tr  = choose(2, 3);
						trr = tr;
					
						while(totems = "")
							{
							#region Второй
								if tr = 2
									{
									totems = "";
									for(i=1;i<=5;i++)
										{
										if global.totem_have[i+6] = 0
										&& (d_t1 == 1 or (d_t1 == 0 && d_n1 != i+6))
											{ totems += string(i); }
										}
									if totems = ""
										{
										if trr = 2
											{ tr = 3; }
											else
											{ d_t2 = 1; }
										}
									}
							#endregion
							#region Третий
								if tr = 3
									{
									totems = "";
									for(i=1;i<=4;i++)
										{
										if global.totem_have[i+11] = 0
										&& (d_t1 == 1 or (d_t1 == 0 && d_n1 != i+11))
											{ totems += string(i); }
										}
									if totems = ""
										{
										if trr = 3
											{ tr = 2; }
											else
											{ d_t2 = 1; }
										}
									}
							#endregion
							}
						
						if d_t2 = 0
							{
							ti = irandom_range(1, string_length(totems));
							if tr = 2
								{ dasd2 = c_aqua; d_n2 = 6 + real(string_copy(totems, ti, 1)); }
							if tr = 3
								{ dasd2 = c_fuchsia; d_n2 = 11 + real(string_copy(totems, ti, 1)); }
										
							//if d_n2 <= 6
							//	{ dasd2 = global.color_white; }
							//if d_n2 > 6 && d_n2 <= 11
							//	{ dasd2 = c_aqua; }
							//if d_n2 > 11 && d_n2 <= 15
							//	{ dasd2 = c_fuchsia; }
							//if d_n2 > 15
							//	{ dasd2 = c_orange; }
							}
					#endregion
					}
				if d_t3 = 0
					{
					#region Рандом тотемов 3
						var ti, totems, tr, trr;
						totems = "";
						tr  = choose(1, 2);
						trr = tr;
					
						while(totems = "")
							{
							#region Первый
								if tr = 1
									{
									totems = "";
									for(i=1;i<=6;i++)
										{
										if global.totem_have[i] = 0
										&& (d_t1 == 1 or (d_t1 == 0 && d_n1 != i))
										&& (d_t2 == 1 or (d_t2 == 0 && d_n2 != i))
											{ totems += string(i); }
										}
									if totems = ""
										{
										if trr = 1
											{ tr = 2; }
											else
											{ d_t3 = 1; }
										}
									}
							#endregion
							#region Второй
								if tr = 2
									{
									totems = "";
									for(i=1;i<=5;i++)
										{
										if global.totem_have[i+6] = 0
										&& (d_t1 == 1 or (d_t1 == 0 && d_n1 != i+6))
										&& (d_t2 == 1 or (d_t2 == 0 && d_n2 != i+6))
											{ totems += string(i); }
										}
									if totems = ""
										{
										if trr = 2
											{ tr = 1; }
											else
											{ d_t3 = 1; }
										}
									}
							#endregion
							}
							
						if d_t3 = 0
							{
							ti = irandom_range(1, string_length(totems));
							if tr = 1
								{ dasd3 = global.color_white; d_n3 = real(string_copy(totems, ti, 1)); }
							if tr = 2
								{ dasd3 = c_aqua; d_n3 = 6 + real(string_copy(totems, ti, 1)); }
							
							//if d_n3 <= 6
							//	{ dasd3 = global.color_white; }
							//if d_n3 > 6 && d_n3 <= 11
							//	{ dasd3 = c_aqua; }
							//if d_n3 > 11 && d_n3 <= 15
							//	{ dasd3 = c_fuchsia; }
							//if d_n3 > 15
							//	{ dasd3 = c_orange; }
							}
					#endregion
					}
			
				if d_t1 = 1
					{
					d_r1 = choose(16, 32, 64);
					
					if d_r1 = 2
						{ dasd1 = global.color_white; }
					if d_r1 > 2 && d_r1 < 8
						{ dasd1 = c_aqua; }
					if d_r1 >= 8 && d_r1 < 16
						{ dasd1 = c_fuchsia; }
					if d_r1 = 16
						{ dasd1 = c_orange; }
					if d_r1 >= 32
						{ dasd1 = c_yellow; }
					}
					else
					{ d_r1 = 0; }
				if d_t2 = 1
					{
					d_r2 = choose(6, 8, 10);
					
					if d_r2 = 2
						{ dasd2 = global.color_white; }
					if d_r2 > 2 && d_r2 < 8
						{ dasd2 = c_aqua; }
					if d_r2 >= 8 && d_r2 < 16
						{ dasd2 = c_fuchsia; }
					if d_r2 = 16
						{ dasd2 = c_orange; }
					if d_r2 >= 32
						{ dasd2 = c_yellow; }
					}
					else
					{ d_r2 = 0; }
				if d_t3 = 1
					{
					d_r3 = choose(2, 4, 6);
					
					if d_r3 = 2
						{ dasd3 = global.color_white; }
					if d_r3 > 2 && d_r3 < 8
						{ dasd3 = c_aqua; }
					if d_r3 >= 8 && d_r3 < 16
						{ dasd3 = c_fuchsia; }
					if d_r3 = 16
						{ dasd3 = c_orange; }
					if d_r3 >= 32
						{ dasd3 = c_yellow; }
					}
					else
					{ d_r3 = 0; }
				
				////////
			
				if d_t1 = 1
					{ d_n1 = irandom_range(1, global.heroes_val); }
			
				if d_t2 = 1
					{
					if d_t1 = 1 
						{
						if d_n1 = 1
							{ d_n2 = irandom_range(2, global.heroes_val); }
							else
							{
							if d_n1 = global.heroes_val
								{ d_n2 = irandom_range(1, global.heroes_val - 1); }
								else
								{ d_n2 = choose(irandom_range(1, d_n1 - 1), irandom_range(d_n1 + 1, global.heroes_val)); }
							}
						}
						else
						{ d_n2 = irandom_range(1, global.heroes_val); }
					}
				
				if d_t3 = 1
					{
					if d_t1 = 1 
						{
						if d_n1 = 1
							{ d_n3 = irandom_range(2, global.heroes_val); }
							else
							{
							if d_n1 = global.heroes_val
								{ d_n3 = irandom_range(1, global.heroes_val - 1); }
								else
								{ d_n3 = choose(irandom_range(1, d_n1 - 1), irandom_range(d_n1 + 1, global.heroes_val)); }
							}
						}
						else
						{
						if d_t2 = 1 
							{
							if d_n2 = 1
								{ d_n3 = irandom_range(2, global.heroes_val); }
								else
								{
								if d_n2 = global.heroes_val
									{ d_n3 = irandom_range(1, global.heroes_val - 1); }
									else
									{ d_n3 = choose(irandom_range(1, d_n2 - 1), irandom_range(d_n2 + 1, global.heroes_val)); }
								}
							}
							else
							{ d_n3 = irandom_range(1, global.heroes_val); }
						}
					}
			#endregion
		
			ini_write_string("Design", "des4_t",  string(d_t1));
			ini_write_string("Design", "des4_n",  string(d_n1));
			ini_write_string("Design", "des4_p",  string(d_p1));
			ini_write_string("Design", "des4_pr",  string(d_p1));
			ini_write_string("Design", "des4_r",  string(d_r1));
			ini_write_string("Design", "des4_c", string(dasd1));
			ini_write_string("Design", "des4_b", "0");
		
			ini_write_string("Design", "des7_t",  string(d_t2));
			ini_write_string("Design", "des7_n",  string(d_n2));
			ini_write_string("Design", "des7_p",  string(d_p2));
			ini_write_string("Design", "des7_pr",  string(d_p2));
			ini_write_string("Design", "des7_r",  string(d_r2));
			ini_write_string("Design", "des7_c", string(dasd2));
			ini_write_string("Design", "des7_b", "0");
		
			ini_write_string("Design", "des9_t",  string(d_t3));
			ini_write_string("Design", "des9_n",  string(d_n3));
			ini_write_string("Design", "des9_p",  string(d_p3));
			ini_write_string("Design", "des9_pr",  string(d_p3));
			ini_write_string("Design", "des9_r",  string(d_r3));
			ini_write_string("Design", "des9_c", string(dasd3));
			ini_write_string("Design", "des9_b", "0");
			
			ini_write_string("Design", "ddd", string(current_day));
			ini_write_string("Design", "dmm", string(current_month));
			}
	
		daily_t[1]  = ini_read_real("Design", "des4_t",  1);
		daily_n[1]  = ini_read_real("Design", "des4_n",  1);
		daily_pr[1] = ini_read_real("Design", "des4_pr", 0);
		daily_r[1]  = ini_read_real("Design", "des4_r",  1);
		daily_c[1]  = ini_read_real("Design", "des4_c",  0);
		daily_b[1]  = ini_read_real("Design", "des4_b",  0);
	
		daily_t[2]  = ini_read_real("Design", "des7_t",  1);
		daily_n[2]  = ini_read_real("Design", "des7_n",  1);
		daily_pr[2] = ini_read_real("Design", "des7_pr", 0);
		daily_r[2]  = ini_read_real("Design", "des7_r",  1);
		daily_c[2]  = ini_read_real("Design", "des7_c",  0);
		daily_b[2]  = ini_read_real("Design", "des7_b",  0);
	
		daily_t[3]  = ini_read_real("Design", "des9_t",  1);
		daily_n[3]  = ini_read_real("Design", "des9_n",  1);
		daily_pr[3] = ini_read_real("Design", "des9_pr", 0);
		daily_r[3]  = ini_read_real("Design", "des9_r",  1);
		daily_c[3]  = ini_read_real("Design", "des9_c",  0);
		daily_b[3]  = ini_read_real("Design", "des9_b",  0);
		
		nowday = ini_read_real("Design", "ddd", 0);
		nowmon = ini_read_real("Design", "dmm", 0);
	
		for(i=1;i<=3;i++)
			{
			daily_p[i] = 0;
			
			if daily_t[i] = 1
				{
				#region Первый
				if daily_r[i] = 2
					{
					if daily_pr[i] = 1
						{ daily_p[i] = 2; }
						else
						{ daily_p[i] = 10; }
					}
				#endregion			
				#region Второй
				if daily_r[i] = 4
					{
					if daily_pr[i] = 1
						{ daily_p[i] = 5; }
						else
						{ daily_p[i] = 25; }
					}
				#endregion			
				#region Третий
				if daily_r[i] = 6
					{
					if daily_pr[i] = 1
						{ daily_p[i] = 7; }
						else
						{ daily_p[i] = 35; }
					}
				#endregion		
				#region Четвертый
				if daily_r[i] = 8
					{
					if daily_pr[i] = 1
						{ daily_p[i] = 10; }
						else
						{ daily_p[i] = 60; }
					}
				#endregion			
				#region Пятый
				if daily_r[i] = 10
					{
					if daily_pr[i] = 1
						{ daily_p[i] = 12; }
						else
						{ daily_p[i] = 80; }
					}
				#endregion		
				#region Шестой
				if daily_r[i] = 16
					{
					if daily_pr[i] = 1
						{ daily_p[i] = 25; }
						else
						{ daily_p[i] = 200; }
					}
				#endregion			
				#region Седьмой
				if daily_r[i] = 32
					{
					if daily_pr[i] = 1
						{ daily_p[i] = 80; }
						else
						{ daily_p[i] = 500; }
					}
				#endregion			
				#region Восьмой
				if daily_r[i] = 64
					{
					if daily_pr[i] = 1
						{ daily_p[i] = 200; }
						else
						{ daily_p[i] = 1000; }
					}
				#endregion	
				}
				else
				{
				if daily_c[i] = global.color_white
					{
					if daily_pr[i] = 1
						{ daily_p[i] = 15; }
						else
						{ daily_p[i] = 75; }
					}
				if daily_c[i] = c_aqua
					{
					if daily_pr[i] = 1
						{ daily_p[i] = 25; }
						else
						{ daily_p[i] = 130; }
					}
				if daily_c[i] = c_fuchsia
					{
					if daily_pr[i] = 1
						{ daily_p[i] = 60; }
						else
						{ daily_p[i] = 300; }
					}
				if daily_c[i] = c_orange
					{
					if daily_pr[i] = 1
						{ daily_p[i] = 160; }
						else
						{ daily_p[i] = 800; }
					}
				}
			}
		//daily_t[1] = 0;
		//daily_t[2] = 0;
		//daily_t[3] = 0; /// ТИП
	
		//daily_n[1] = 0;
		//daily_n[2] = 0;
		//daily_n[3] = 0; /// НОМЕР (1-18 / 1-7)
	
		//daily_p[1] = 0;
		//daily_p[2] = 0;
		//daily_p[3] = 0; /// ЦЕНА
	
		//daily_r[1] = 0;
		//daily_r[2] = 0;
		//daily_r[3] = 0; /// РЕДКОСТЬ
	
		//daily_c[1] = 0;
		//daily_c[2] = 0;
		//daily_c[3] = 0; /// ЦВЕТ
	
		//daily_s[1] = 1;
		//daily_s[2] = 1;
		//daily_s[3] = 1; /// СКЕЙЛ
	
		ini_close();
	#endregion
		#region Задания
		ini_open("Music.ini");
			ini_write_string("Qual", "qual_rr", "1");
			if global.quests_a[1] = 0
				{ ini_write_string("Qual", "qual_1", "1"); }
			if global.quests_a[2] = 0
				{ ini_write_string("Qual", "qual_2", "1"); }
			if global.quests_a[3] = 0
				{ ini_write_string("Qual", "qual_3", "1"); }
		ini_close();
		#endregion
		}
	ini_open("Music.ini");
		if keyboard_check_pressed(ord("I"))
			{
			ini_write_string("Qual", "qual_a_1", "0");
			global.quests_a[1] = ini_read_real("Qual", "qual_a_1", 0);
			}
		if keyboard_check_pressed(ord("O"))
			{
			ini_write_string("Qual", "qual_a_2", "0");
			global.quests_a[2] = ini_read_real("Qual", "qual_a_2", 0);
			}
		if keyboard_check_pressed(ord("P"))
			{
			ini_write_string("Qual", "qual_a_3", "0");
			global.quests_a[3] = ini_read_real("Qual", "qual_a_3", 0);
			}
	ini_close();
#endregion

#region Статистика
	var rec_w;
	rec_w = 200;
	//draw_set_color(c_white);
	//draw_rectangle(640 - rec_w, global.size / 2 - rec_w, 640 + rec_w, global.size / 2 + rec_w, 0);
	
	var stats_xx, stats_yy, stats_ss,
	stats_k1, stats_k2, stats_k3, stats_k4, stats_k5;
	stats_xx = 640;
	stats_yy = global.size / 2;
	stats_ss = 150;
	
	stats_k1 = (global.stats_logic[1])/(global.stats_logic[1] + global.stats_logic[2]);
	stats_k2 = (global.stats_memor[1])/(global.stats_memor[1] + global.stats_memor[2]);
	stats_k3 = (global.stats_speed[1])/(global.stats_speed[1] + global.stats_speed[2]);
	stats_k4 = (global.stats_atten[1])/(global.stats_atten[1] + global.stats_atten[2]);
	stats_k5 = (global.stats_calcu[1])/(global.stats_calcu[1] + global.stats_calcu[2]);
	
	#region Пятиугольник
		draw_set_color(c_black);
		#region Пятиугольник
			draw_primitive_begin(pr_trianglefan);
				draw_vertex(stats_xx + lengthdir_x(stats_ss, 90),  stats_yy + lengthdir_y(stats_ss, 90));
				draw_vertex(stats_xx + lengthdir_x(stats_ss, 160), stats_yy + lengthdir_y(stats_ss, 160));
				draw_vertex(stats_xx + lengthdir_x(stats_ss, 235), stats_yy + lengthdir_y(stats_ss, 235));
				draw_vertex(stats_xx + lengthdir_x(stats_ss, 305), stats_yy + lengthdir_y(stats_ss, 305));
				draw_vertex(stats_xx + lengthdir_x(stats_ss, 380), stats_yy + lengthdir_y(stats_ss, 380));
			draw_primitive_end();
		#endregion
		draw_set_color(c_white);
		stats_ss = 140;
		#region Пятиугольник
			draw_primitive_begin(pr_trianglefan);
				draw_vertex(stats_xx + lengthdir_x(stats_ss, 90),  stats_yy + lengthdir_y(stats_ss, 90));
				draw_vertex(stats_xx + lengthdir_x(stats_ss, 160), stats_yy + lengthdir_y(stats_ss, 160));
				draw_vertex(stats_xx + lengthdir_x(stats_ss, 235), stats_yy + lengthdir_y(stats_ss, 235));
				draw_vertex(stats_xx + lengthdir_x(stats_ss, 305), stats_yy + lengthdir_y(stats_ss, 305));
				draw_vertex(stats_xx + lengthdir_x(stats_ss, 380), stats_yy + lengthdir_y(stats_ss, 380));
			draw_primitive_end();
		#endregion
		#region Внутренние полосы
			for(i=1;i<=5;i++)
				{
				draw_set_color(c_black);
					stats_ss -= 30;
					draw_set_alpha(0.5);
					figure(stats_ss);
				draw_set_color(c_white);
					stats_ss -= 2;
					draw_set_alpha(1);
					figure(stats_ss);
				}
		#endregion
	#endregion
	draw_set_alpha(0.5);
		draw_set_color(c_red);
		stats_ss = 140;
		#region Пятиугольник
		draw_primitive_begin(pr_trianglefan);
			draw_vertex(stats_xx + lengthdir_x(stats_ss * stats_k1, 90),  stats_yy + lengthdir_y(stats_ss * stats_k1, 90));
			draw_vertex(stats_xx + lengthdir_x(stats_ss * stats_k2, 160), stats_yy + lengthdir_y(stats_ss * stats_k2, 160));
			draw_vertex(stats_xx + lengthdir_x(stats_ss * stats_k3, 235), stats_yy + lengthdir_y(stats_ss * stats_k3, 235));
			draw_vertex(stats_xx + lengthdir_x(stats_ss * stats_k4, 305), stats_yy + lengthdir_y(stats_ss * stats_k4, 305));
			draw_vertex(stats_xx + lengthdir_x(stats_ss * stats_k5, 380), stats_yy + lengthdir_y(stats_ss * stats_k5, 380));
		draw_primitive_end();
		#region Линии
			draw_line_width(stats_xx + lengthdir_x(43, 90),  stats_yy + lengthdir_y(43, 90),  stats_xx + lengthdir_x(150, 90),  stats_yy + lengthdir_y(150, 90),  2);
			draw_line_width(stats_xx + lengthdir_x(43, 160), stats_yy + lengthdir_y(43, 160), stats_xx + lengthdir_x(150, 160), stats_yy + lengthdir_y(150, 160), 2);
			draw_line_width(stats_xx + lengthdir_x(43, 235), stats_yy + lengthdir_y(43, 235), stats_xx + lengthdir_x(150, 235), stats_yy + lengthdir_y(150, 235), 2);
			draw_line_width(stats_xx + lengthdir_x(43, 305), stats_yy + lengthdir_y(43, 305), stats_xx + lengthdir_x(150, 305), stats_yy + lengthdir_y(150, 305), 2);
			draw_line_width(stats_xx + lengthdir_x(43, 380), stats_yy + lengthdir_y(43, 380), stats_xx + lengthdir_x(150, 380), stats_yy + lengthdir_y(150, 380), 2);
		#endregion
	#endregion
	draw_set_alpha(1);
	
	#region Названия характеристик
		stats_ss = 170;
		
		draw_set_font(global.game_font);
		
		draw_text_transformed_t(stats_xx + lengthdir_x(stats_ss, 90),  stats_yy + lengthdir_y(stats_ss, 90), "LOGIC", 0.1, 0.1, 0, c_white, c_black);
		draw_text_transformed_t(stats_xx + lengthdir_x(stats_ss, 160), stats_yy + lengthdir_y(stats_ss, 160), "MEMORY", 0.1, 0.1, 0, c_white, c_black);
		draw_text_transformed_t(stats_xx + lengthdir_x(stats_ss, 380), stats_yy + lengthdir_y(stats_ss, 380), "SPEED", 0.1, 0.1, 0, c_white, c_black);
		draw_text_transformed_t(stats_xx + lengthdir_x(stats_ss, 235), stats_yy + lengthdir_y(stats_ss, 235), "ATTENTION", 0.1, 0.1, 0, c_white, c_black);
		draw_text_transformed_t(stats_xx + lengthdir_x(stats_ss, 305), stats_yy + lengthdir_y(stats_ss, 305), "CALCULATING", 0.1, 0.1, 0, c_white, c_black);
	#endregion
	if keyboard_check_pressed(ord("K"))
		{
		for(i=1;i<=2;i++)
			{
			global.stats_logic[i] = irandom(100);
			global.stats_atten[i] = irandom(100);
			global.stats_calcu[i] = irandom(100);
			global.stats_memor[i] = irandom(100);
			global.stats_speed[i] = irandom(100);
			}
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
			//if keyboard_check_pressed(ord("O"))
			//	{
			//	if global.player_rank < 15
			//		{ global.player_rank += 1; }
			//	}
			//if keyboard_check_pressed(ord("P"))
			//	{
			//	if global.player_rank > 0
			//		{ global.player_rank -= 1; }
			//	}
		#endregion
	#endregion
	}