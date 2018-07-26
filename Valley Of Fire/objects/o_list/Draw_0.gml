#region Фон
	//draw_sprite_ext(s_train_back1, o_control.back_time[1], 640 + o_control.back_x, global.size + o_control.back_y, o_control.back_s, o_control.back_s, 0, c_white, o_control.back_alpha2[o_control.back_time[1]] * o_control.back_alpha[1]);
	//draw_sprite_ext(s_train_back1, o_control.back_time[2], 640 + o_control.back_x, global.size + o_control.back_y, o_control.back_s, o_control.back_s, 0, c_white, o_control.back_alpha2[o_control.back_time[2]] * o_control.back_alpha[2]);
	if global.background = "mine"
		{
		var hui;
		hui = 100 * 960 / global.size;
		draw_sprite_ext(s_mine_rock1, 0, 0, global.size + hui, o_control.back_s, o_control.back_s, 0, c_white, 1);
		draw_sprite_ext(s_mine_rock2, 0, 1280, global.size + 100 + hui, o_control.back_s, o_control.back_s, 0, c_white, 1);
		}
#endregion
#region Листовка
	#region Появление
		//if keyboard_check_pressed(ord("B"))
		//	{ button_xc = !button_xc; }
		if o_math_mod = 0
			{
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
			}
			else
			{ button_x = 250; }
		
		var list_size, list_size1;
		list_size  = (0.35 + 0.05 * (global.size - 590) / 370) * o_but_sc;
		list_size1 = (0.4 + 0.05 * (global.size - 590) / 370) * o_but_sc;
		
		//draw_sprite_ext(s_question_list, 0, 640 - 5, global.size / 2 + 4 - 50 + list_y - 658 * list_size, list_size, list_size * list_scale, 0, c_black, 0.4);
		//draw_sprite_ext(s_question_list, 0, 640, global.size / 2 - 50 + list_y - 658 * list_size, list_size, list_size * list_scale, 0, c_white, 1);
		
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
		
		//if keyboard_check_pressed(ord("G"))//global.game_stage = 5 //keyboard_check_pressed(ord("G"))
		//	{
		//	//global.game_stage = 6;
		//	list_go = !list_go;
		//	list_y = -300;
			
		//	list_scale = 0;
		//	plas_scale = 0;
		//	}
		if list_go
			{
			if list_y >= 20
				{
				if plas_scale < 1
					{ plas_scale += 0.1; }
					else
					{
					if list_scale < 1
						{ list_scale += 0.1; }
						else
						{ bot_go = 1; }
					}
				}
				else
				{ list_y += 10; }
			}
	#endregion
	#region Темы
		if theme_round[global.rounds] != -1
			{
			//theme_round[global.rounds] = 3;
			//round_task[global.rounds,global.task] = 2;
			question_text = global.question_text[theme_round[global.rounds],round_task[global.rounds,global.task]];
			with(global.player_object)
				{
				if shoot = 0 && !(skeleton_animation_get() = "super") && !(skeleton_animation_get() = "shoot")
					{ global.cananswer = 1; }
					else
					{ global.cananswer = 0; }
				}
			#region Математика - Math
			if theme_round[global.rounds] = 1
				{
				#region Задача 1 - Знаки
					if round_task[global.rounds,global.task] = 1
						{
						#region Координаты кнопок
							if o_math_mod = 0
								{
								var x1, y1, x2, y2, x3, y3, x4, y4, button_width, button_height;
								x1 = 640 - 5 - 160 * list_size1 - button_x;
								y1 = global.size - 300; //global.size / 2 + 4 - 80 + 140 * list_size1 + list_y - 250 * (1 - list_scale);
			
								x2 = 640 - 5 + 160 * list_size1 + button_x;
								y2 = y1;
		
								x3 = x1;
								y3 = global.size - 180; //global.size / 2 + 4 - 80 + 400 * list_size1 + list_y - 350 * (1 - list_scale);
		
								x4 = x2;
								y4 = y3;
		
								button_width = sprite_get_width(s_question_sign) * list_size1;
								button_height = sprite_get_height(s_question_sign) * list_size1;
								}
								else
								{
								var x1, y1, x2, y2, x3, y3, x4, y4, button_width, button_height;
							
								button_width = sprite_get_width(s_question_sign) * list_size1 * o_but_sc;
								button_height = sprite_get_height(s_question_sign) * list_size1 * o_but_sc;
							
								x1 = 640 - button_width / 2 * 3 - 45; //640 - 5 - 160 * list_size1 - button_x;
								y1 = global.size - 200; //global.size / 2 + 4 - 80 + 140 * list_size1 + list_y - 250 * (1 - list_scale);
			
								x2 = 640 - button_width / 2 - 15; //640 - 5 + 160 * list_size1 + button_x;
								y2 = y1;
		
								x3 = 640 + button_width / 2 + 15; //x1;
								y3 = global.size - 200; //global.size / 2 + 4 - 80 + 400 * list_size1 + list_y - 350 * (1 - list_scale);
		
								x4 = 640 + button_width / 2 * 3 + 45; // x2;
								y4 = y3;
								}
						#endregion
						#region Варианты
							if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
								#region Вариант 1
									if point_in_rectangle(mouse_x, mouse_y, x1 - button_width / 2, y1 - button_height / 2, x1 + button_width / 2, y1 + button_height / 2)
										{
										if mouse_check_button(mb_left)
											{ b_pressed_s[1] = 1.2; }
											else
											{ b_pressed_s[1] = 1; }
										if mouse_check_button_released(mb_left)
											{
											if global.music
												{ audio_play_sound(sd_text, 2, 0); }
											/*audio_play_sound(sd_revolver, 1, 0);*/
											if vtrue[1] = 1
												{ global.answer = 1; }
												else
												{ global.answer = 0; }
											math_1();
											}
										}
										else
										{ b_pressed_s[1] = 1; }
								#endregion
								#region Вариант 2
									if point_in_rectangle(mouse_x, mouse_y, x2 - button_width / 2, y2 - button_height / 2, x2 + button_width / 2, y2 + button_height / 2)
										{
										if mouse_check_button(mb_left)
											{ b_pressed_s[2] = 1.2; }
											else
											{ b_pressed_s[2] = 1; }
										if mouse_check_button_released(mb_left)
											{
											if global.music
												{ audio_play_sound(sd_text, 2, 0); }
											/*audio_play_sound(sd_revolver, 1, 0);*/
											if vtrue[2] = 1
												{ global.answer = 1; }
												else
												{ global.answer = 0; }
											math_1();
											}
										}
										else
										{ b_pressed_s[2] = 1; }
								#endregion
								#region Вариант 3
									if point_in_rectangle(mouse_x, mouse_y, x3 - button_width / 2, y3 - button_height / 2, x3 + button_width / 2, y3 + button_height / 2)
										{
										if mouse_check_button(mb_left)
											{ b_pressed_s[3] = 1.2; }
											else
											{ b_pressed_s[3] = 1; }
										if mouse_check_button_released(mb_left)
											{
											if global.music { audio_play_sound(sd_text, 2, 0); }
											/*audio_play_sound(sd_revolver, 1, 0);*/
											if vtrue[3] = 1
												{ global.answer = 1; }
												else
												{ global.answer = 0; }
											math_1();
											}
										}
										else
										{ b_pressed_s[3] = 1; }
								#endregion
								#region Вариант 4
									if point_in_rectangle(mouse_x, mouse_y, x4 - button_width / 2, y4 - button_height / 2, x4 + button_width / 2, y4 + button_height / 2)
										{
										if mouse_check_button(mb_left)
											{ b_pressed_s[4] = 1.2; }
											else
											{ b_pressed_s[4] = 1; }
										if mouse_check_button_released(mb_left)
											{
											if global.music { audio_play_sound(sd_text, 2, 0); }
											/*audio_play_sound(sd_revolver, 1, 0);*/
											if vtrue[4] = 1
												{ global.answer = 1; }
												else
												{ global.answer = 0; }
											math_1();
											}
										}
										else
										{ b_pressed_s[4] = 1; }
								#endregion
								}
						#endregion
						#region Рисование кнопок и вопроса
							var str, font;
							str  = "0123456789?=≠+-/*><"; //"!"+"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюя"; 
							font = font_add_sprite_ext(s_question_fig, str, true, 1);
							draw_set_font(global.math_font);
						
							//draw_set_font(f_question_bold);
							draw_set_color(c_black);
							draw_set_alpha(0.4);
							draw_text_transformed(640 - 3 + 30, global.size / 2 - 200 * list_size - 50 + list_y + 4 + button_x / 4 - 125 * (1 - list_scale), equation_text /*"14?7=2*/, list_size * 1.04, list_size * 1.04 * list_scale, 0);
							draw_set_color(c_white);
							draw_set_alpha(1);
							draw_text_transformed(640 + 30, global.size / 2 - 200 * list_size - 50 + list_y + button_x / 4 - 125 * (1 - list_scale), equation_text /*"14?7=2*/, list_size * 1.04, list_size * 1.04 * list_scale, 0);
							if o_math_mod = 0
								{
								draw_sprite_ext(s_question_sign, 0, x1, y1 + 6, list_size1, list_size1 * list_scale, 0, c_black, 0.4);
								draw_sprite_ext(s_question_sign, 1, x2, y2 + 6, list_size1, list_size1 * list_scale, 0, c_black, 0.4);
								draw_sprite_ext(s_question_sign, 2, x3, y3 + 6, list_size1, list_size1 * list_scale, 0, c_black, 0.4);
								draw_sprite_ext(s_question_sign, 3, x4, y4 + 6, list_size1, list_size1 * list_scale, 0, c_black, 0.4);
								}
								else
								{
								draw_sprite_ext(s_question_sign, 0, x1, y1 + 6, list_size1, list_size1 * list_scale, 0, c_black, 0.4);
								draw_sprite_ext(s_question_sign, 1, x2, y1 + 6 + 6, -list_size1, list_size1 * list_scale, 0, c_black, 0.4);
								draw_sprite_ext(s_question_sign, 2, x3, y1 + 6 + 6, list_size1, list_size1 * list_scale, 0, c_black, 0.4);
								draw_sprite_ext(s_question_sign, 3, x4, y1 + 6, -list_size1, list_size1 * list_scale, 0, c_black, 0.4);
								}
							//draw_sprite_ext(s_question_sign1, 0, x1, y1, list_size1, list_size1 * list_scale, 0, c_white, 1);
							//draw_sprite_ext(s_question_sign1, 1, x2, y2, list_size1, list_size1 * list_scale, 0, c_white, 1);
							//draw_sprite_ext(s_question_sign1, 2, x3, y3, list_size1, list_size1 * list_scale, 0, c_white, 1);
							//draw_sprite_ext(s_question_sign1, 3, x4, y4, list_size1, list_size1 * list_scale, 0, c_white, 1);
		
							//draw_sprite_ext(s_question_sign11, 0, x1, y1, list_size1, list_size1 * list_scale, 0, c_white, button_x / 500);
							//draw_sprite_ext(s_question_sign11, 1, x2, y2, list_size1, list_size1 * list_scale, 0, c_white, button_x / 500);
							//draw_sprite_ext(s_question_sign11, 2, x3, y3, list_size1, list_size1 * list_scale, 0, c_white, button_x / 500);
							//draw_sprite_ext(s_question_sign11, 3, x4, y4, list_size1, list_size1 * list_scale, 0, c_white, button_x / 500);
							if o_math_mod = 0
								{
								draw_sprite_ext(s_question_sign11, 0, x1, y1, list_size1, list_size1 * list_scale, 0, c_white, 1);
								draw_sprite_ext(s_question_sign11, 1, x2, y2, list_size1, list_size1 * list_scale, 0, c_white, 1);
								draw_sprite_ext(s_question_sign11, 2, x3, y3, list_size1, list_size1 * list_scale, 0, c_white, 1);
								draw_sprite_ext(s_question_sign11, 3, x4, y4, list_size1, list_size1 * list_scale, 0, c_white, 1);
							
								draw_sprite_ext(s_question_sign, 0, x1, y1, list_size1 * b_pressed_s[1], list_size1 * list_scale * b_pressed_s[1], 0, c_white, 1);
								draw_sprite_ext(s_question_sign, 1, x2, y2, list_size1 * b_pressed_s[2], list_size1 * list_scale * b_pressed_s[2], 0, c_white, 1);
								draw_sprite_ext(s_question_sign, 2, x3, y3, list_size1 * b_pressed_s[3], list_size1 * list_scale * b_pressed_s[3], 0, c_white, 1);
								draw_sprite_ext(s_question_sign, 3, x4, y4, list_size1 * b_pressed_s[4], list_size1 * list_scale * b_pressed_s[4], 0, c_white, 1);
								}
								else
								{
								draw_sprite_ext(s_question_sign11, 0, x1, y1, list_size1, list_size1 * list_scale, 0, c_white, 1);
								draw_sprite_ext(s_question_sign11, 1, x2, y1 + 6, -list_size1, list_size1 * list_scale, 0, c_white, 1);
								draw_sprite_ext(s_question_sign11, 2, x3, y1 + 6, list_size1, list_size1 * list_scale, 0, c_white, 1);
								draw_sprite_ext(s_question_sign11, 3, x4, y1, -list_size1, list_size1 * list_scale, 0, c_white, 1);
							
								draw_sprite_ext(s_question_sign, 0, x1, y1, list_size1 * b_pressed_s[1], list_size1 * list_scale * b_pressed_s[1], 0, c_white, 1);
								draw_sprite_ext(s_question_sign, 1, x2, y1 + 6, -list_size1 * b_pressed_s[2], list_size1 * list_scale * b_pressed_s[2], 0, c_white, 1);
								draw_sprite_ext(s_question_sign, 2, x3, y1 + 6, list_size1 * b_pressed_s[3], list_size1 * list_scale * b_pressed_s[3], 0, c_white, 1);
								draw_sprite_ext(s_question_sign, 3, x4, y1, -list_size1 * b_pressed_s[4], list_size1 * list_scale * b_pressed_s[4], 0, c_white, 1);
								}
						
							if list_go = 1 && list_scale > 0.2
								{
								draw_set_color(c_white);
								draw_set_alpha(0.4 + 0.6 * timer_x / (6 * room_speed));
								draw_rectangle(640 - 200 * timer_x / (6 * room_speed), global.size / 2 - 20 - 6 * list_scale, 640 + 200 * timer_x / (6 * room_speed), /*y1 - 180*/global.size / 2 - 20 + 6 * list_scale, 0);
								draw_set_alpha(1);
								}
						#endregion
						}
				#endregion
				#region Задача 2 - Числа
					if round_task[global.rounds,global.task] = 2
						{
						#region Координаты кнопок
							if o_math_mod = 0
								{
								var x1, y1, x2, y2, x3, y3, x4, y4, button_width, button_height;
								x1 = 640 - 5 - 160 * list_size1 - button_x;
								y1 = global.size - 300; //global.size / 2 + 4 - 80 + 140 * list_size1 + list_y - 250 * (1 - list_scale);
			
								x2 = 640 - 5 + 160 * list_size1 + button_x;
								y2 = y1;
		
								x3 = x1;
								y3 = global.size - 180; //global.size / 2 + 4 - 80 + 400 * list_size1 + list_y - 350 * (1 - list_scale);
		
								x4 = x2;
								y4 = y3;
		
								button_width = sprite_get_width(s_question_sign) * list_size1;
								button_height = sprite_get_height(s_question_sign) * list_size1;
								}
								else
								{
								var x1, y1, x2, y2, x3, y3, x4, y4, button_width, button_height;
							
								button_width = sprite_get_width(s_question_sign) * list_size1 * o_but_sc;
								button_height = sprite_get_height(s_question_sign) * list_size1 * o_but_sc;
							
								x1 = 640 - button_width / 2 * 3 - 45; //640 - 5 - 160 * list_size1 - button_x;
								y1 = global.size - 200; //global.size / 2 + 4 - 80 + 140 * list_size1 + list_y - 250 * (1 - list_scale);
			
								x2 = 640 - button_width / 2 - 15; //640 - 5 + 160 * list_size1 + button_x;
								y2 = y1;
		
								x3 = 640 + button_width / 2 + 15; //x1;
								y3 = global.size - 200; //global.size / 2 + 4 - 80 + 400 * list_size1 + list_y - 350 * (1 - list_scale);
		
								x4 = 640 + button_width / 2 * 3 + 45; // x2;
								y4 = y3;
								}
						#endregion
						#region Варианты
							if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
								#region Вариант 1
									if point_in_rectangle(mouse_x, mouse_y, x1 - button_width / 2, y1 - button_height / 2, x1 + button_width / 2, y1 + button_height / 2)
										{
										if mouse_check_button(mb_left)
											{ b_pressed_s[1] = 1.2; }
											else
											{ b_pressed_s[1] = 1; }
										if mouse_check_button_released(mb_left)
											{
											if global.music { audio_play_sound(sd_text, 2, 0); }
											/*audio_play_sound(sd_revolver, 1, 0);*/
											if vtrue[1] = 1
												{ global.answer = 1; }
												else
												{ global.answer = 0; }
											math_2();
											}
										}
										else
										{ b_pressed_s[1] = 1; }
								#endregion
								#region Вариант 2
									if point_in_rectangle(mouse_x, mouse_y, x2 - button_width / 2, y2 - button_height / 2, x2 + button_width / 2, y2 + button_height / 2)
										{
										if mouse_check_button(mb_left)
											{ b_pressed_s[2] = 1.2; }
											else
											{ b_pressed_s[2] = 1; }
										if mouse_check_button_released(mb_left)
											{
											if global.music { audio_play_sound(sd_text, 2, 0); }
											/*audio_play_sound(sd_revolver, 1, 0);*/
											if vtrue[2] = 1
												{ global.answer = 1; }
												else
												{ global.answer = 0; }
											math_2();
											}
										}
										else
										{ b_pressed_s[2] = 1; }
								#endregion
								#region Вариант 3
									if point_in_rectangle(mouse_x, mouse_y, x3 - button_width / 2, y3 - button_height / 2, x3 + button_width / 2, y3 + button_height / 2)
										{
										if mouse_check_button(mb_left)
											{ b_pressed_s[3] = 1.2; }
											else
											{ b_pressed_s[3] = 1; }
										if mouse_check_button_released(mb_left)
											{
											if global.music { audio_play_sound(sd_text, 2, 0); }
											/*audio_play_sound(sd_revolver, 1, 0);*/
											if vtrue[3] = 1
												{ global.answer = 1; }
												else
												{ global.answer = 0; }
											math_2();
											}
										}
										else
										{ b_pressed_s[3] = 1; }
								#endregion
								#region Вариант 4
									if point_in_rectangle(mouse_x, mouse_y, x4 - button_width / 2, y4 - button_height / 2, x4 + button_width / 2, y4 + button_height / 2)
										{
										if mouse_check_button(mb_left)
											{ b_pressed_s[4] = 1.2; }
											else
											{ b_pressed_s[4] = 1; }
										if mouse_check_button_released(mb_left)
											{
											if global.music { audio_play_sound(sd_text, 2, 0); }
											/*audio_play_sound(sd_revolver, 1, 0);*/
											if vtrue[4] = 1
												{ global.answer = 1; }
												else
												{ global.answer = 0; }
											math_2();
											}
										}
										else
										{ b_pressed_s[4] = 1; }
								#endregion
								}
						#endregion
						#region Рисование кнопок и вопроса
							draw_set_font(global.math_font);
						
							//draw_set_font(f_question_bold);
							draw_set_color(c_black);
							draw_set_alpha(0.4);
							draw_text_transformed(640 - 3 + 30, global.size / 2 - 200 * list_size - 50 + list_y + 4 + button_x / 4 - 125 * (1 - list_scale), equation_text /*"14?7=2*/, list_size * 1.04, list_size * 1.04 * list_scale, 0);
							draw_set_color(c_white);
							draw_set_alpha(1);
							draw_text_transformed(640 + 30, global.size / 2 - 200 * list_size - 50 + list_y + button_x / 4 - 125 * (1 - list_scale), equation_text /*"14?7=2*/, list_size * 1.04, list_size * 1.04 * list_scale, 0);
					
							draw_sprite_ext(s_question_figure, 0, x1, y1 + 6, list_size1, list_size1 * list_scale, 0, c_black, 0.4);
							draw_sprite_ext(s_question_figure, 0, x2, y1 + 6 + 6, list_size1, list_size1 * list_scale, 0, c_black, 0.4);
							draw_sprite_ext(s_question_figure, 0, x3, y1 + 6 + 6, -list_size1, list_size1 * list_scale, 0, c_black, 0.4);
							draw_sprite_ext(s_question_figure, 0, x4, y1 + 6, -list_size1, list_size1 * list_scale, 0, c_black, 0.4);
						
							draw_sprite_ext(s_question_figure, 1, x1, y1, list_size1, list_size1 * list_scale, 0, c_white, 1);
							draw_sprite_ext(s_question_figure, 1, x2, y1 + 6, list_size1, list_size1 * list_scale, 0, c_white, 1);
							draw_sprite_ext(s_question_figure, 1, x3, y1 + 6, -list_size1, list_size1 * list_scale, 0, c_white, 1);
							draw_sprite_ext(s_question_figure, 1, x4, y1, -list_size1, list_size1 * list_scale, 0, c_white, 1);
							
							draw_sprite_ext(s_question_figure, 0, x1, y1, list_size1 * b_pressed_s[1], list_size1 * list_scale * b_pressed_s[1], 0, c_white, 1);
							draw_sprite_ext(s_question_figure, 0, x2, y1 + 6, list_size1 * b_pressed_s[2], list_size1 * list_scale * b_pressed_s[2], 0, c_white, 1);
							draw_sprite_ext(s_question_figure, 0, x3, y1 + 6, -list_size1 * b_pressed_s[3], list_size1 * list_scale * b_pressed_s[3], 0, c_white, 1);
							draw_sprite_ext(s_question_figure, 0, x4, y1, -list_size1 * b_pressed_s[4], list_size1 * list_scale * b_pressed_s[4], 0, c_white, 1);
						
							draw_text_transformed(x1 + 30, y1 + string_height(vtext[1]) / 2 * list_size * 1.04 * 0.75 * list_scale, vtext[1], list_size * 1.04 * 0.75, list_size * 1.04 * list_scale * 0.75, 0);
							draw_text_transformed(x2 + 30, y1 + string_height(vtext[2]) / 2 * list_size * 1.04 * 0.75 * list_scale + 6, vtext[2], list_size * 1.04 * 0.75, list_size * 1.04 * list_scale * 0.75, 0);
							draw_text_transformed(x3 + 30, y1 + string_height(vtext[3]) / 2 * list_size * 1.04 * 0.75 * list_scale + 6, vtext[3], list_size * 1.04 * 0.75, list_size * 1.04 * list_scale * 0.75, 0);
							draw_text_transformed(x4 + 30, y1 + string_height(vtext[4]) / 2 * list_size * 1.04 * 0.75 * list_scale, vtext[4], list_size * 1.04 * 0.75, list_size * 1.04 * list_scale * 0.75, 0);
					
							//draw_sprite_ext(s_question_figure, 0, x1, y1, list_size1 * b_pressed_s[1], list_size1 * list_scale * b_pressed_s[1], 0, c_white, 1);
							//draw_sprite_ext(s_question_figure, 0, x2, y1 + 6, -list_size1 * b_pressed_s[2], list_size1 * list_scale * b_pressed_s[2], 0, c_white, 1);
							//draw_sprite_ext(s_question_figure, 0, x3, y1 + 6, list_size1 * b_pressed_s[3], list_size1 * list_scale * b_pressed_s[3], 0, c_white, 1);
							//draw_sprite_ext(s_question_figure, 0, x4, y1, -list_size1 * b_pressed_s[4], list_size1 * list_scale * b_pressed_s[4], 0, c_white, 1);
							if list_go = 1 && list_scale > 0.2
								{
								draw_set_color(c_white);
								draw_set_alpha(0.4 + 0.6 * timer_x / (6 * room_speed));
								draw_rectangle(640 - 200 * timer_x / (6 * room_speed), global.size / 2 - 20 - 6 * list_scale, 640 + 200 * timer_x / (6 * room_speed), /*y1 - 180*/global.size / 2 - 20 + 6 * list_scale, 0);
								draw_set_alpha(1);
								}
						#endregion
						}
				#endregion
				#region Задача 3 - Больше Меньше
					if round_task[global.rounds,global.task] = 3
						{
						#region Координаты кнопок
								var x1, y1, x2, y2, x3, y3, x4, y4, button_width, button_height;
							
								button_width = sprite_get_width(s_question_sign) * list_size1 * o_but_sc;
								button_height = sprite_get_height(s_question_sign) * list_size1 * o_but_sc;
							
								x1 = 640 - button_width / 2 * 3 - 45; //640 - 5 - 160 * list_size1 - button_x;
								y1 = global.size - 200; //global.size / 2 + 4 - 80 + 140 * list_size1 + list_y - 250 * (1 - list_scale);
			
								x2 = 640 - button_width / 2 - 15; //640 - 5 + 160 * list_size1 + button_x;
								y2 = y1;
		
								x3 = 640 + button_width / 2 + 15; //x1;
								y3 = global.size - 200; //global.size / 2 + 4 - 80 + 400 * list_size1 + list_y - 350 * (1 - list_scale);
		
								x4 = 640 + button_width / 2 * 3 + 45; // x2;
								y4 = y3;
						#endregion
						#region Варианты
							if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
								#region Вариант 2
									if point_in_rectangle(mouse_x, mouse_y, x2 - button_width / 2, y2 - button_height / 2, x2 + button_width / 2, y2 + button_height / 2)
										{
										if mouse_check_button(mb_left)
											{ b_pressed_s[2] = 1.2; }
											else
											{ b_pressed_s[2] = 1; }
										if mouse_check_button_released(mb_left)
											{
											if global.music { audio_play_sound(sd_text, 2, 0); }
											/*audio_play_sound(sd_revolver, 1, 0);*/
											if vtrue[2] = 1
												{ global.answer = 1; }
												else
												{ global.answer = 0; }
											math_3();
											}
										}
										else
										{ b_pressed_s[2] = 1; }
								#endregion
								#region Вариант 3
									if point_in_rectangle(mouse_x, mouse_y, x3 - button_width / 2, y3 - button_height / 2, x3 + button_width / 2, y3 + button_height / 2)
										{
										if mouse_check_button(mb_left)
											{ b_pressed_s[3] = 1.2; }
											else
											{ b_pressed_s[3] = 1; }
										if mouse_check_button_released(mb_left)
											{
											if global.music { audio_play_sound(sd_text, 2, 0); }
											/*audio_play_sound(sd_revolver, 1, 0);*/
											if vtrue[3] = 1
												{ global.answer = 1; }
												else
												{ global.answer = 0; }
											math_3();
											}
										}
										else
										{ b_pressed_s[3] = 1; }
								#endregion
								}
						#endregion
						#region Рисование кнопок и вопроса
							draw_set_font(global.math_font);
						
							//draw_set_font(f_question_bold);
							draw_set_color(c_black);
							draw_set_alpha(0.4);
							draw_text_transformed(640 - 3 + 30, global.size / 2 - 200 * list_size - 50 + list_y + 4 + button_x / 4 - 125 * (1 - list_scale), equation_text /*"14?7=2*/, list_size * 1.04, list_size * 1.04 * list_scale, 0);
							draw_set_color(c_white);
							draw_set_alpha(1);
							draw_text_transformed(640 + 30, global.size / 2 - 200 * list_size - 50 + list_y + button_x / 4 - 125 * (1 - list_scale), equation_text /*"14?7=2*/, list_size * 1.04, list_size * 1.04 * list_scale, 0);
					
							draw_sprite_ext(s_question_figure, 2, x2, y1 + 6 + 6, list_size1, list_size1 * list_scale, 0, c_black, 0.4);
							draw_sprite_ext(s_question_figure, 2, x3, y1 + 6 + 6, -list_size1, list_size1 * list_scale, 0, c_black, 0.4);
						
							draw_sprite_ext(s_question_figure, 3, x2, y1 + 6, list_size1, list_size1 * list_scale, 0, c_white, 1);
							draw_sprite_ext(s_question_figure, 3, x3, y1 + 6, -list_size1, list_size1 * list_scale, 0, c_white, 1);
							
							draw_sprite_ext(s_question_figure, 2, x2, y1 + 6, list_size1 * b_pressed_s[2], list_size1 * list_scale * b_pressed_s[2], 0, c_white, 1);
							draw_sprite_ext(s_question_figure, 2, x3, y1 + 6, -list_size1 * b_pressed_s[3], list_size1 * list_scale * b_pressed_s[3], 0, c_white, 1);
						
							draw_text_transformed(x2 + 30, y1 + string_height(vtext[2]) / 2 * list_size * 1.04 * list_scale + 6, vtext[2], list_size * 1.04, list_size * 1.04 * list_scale, 0);
							draw_text_transformed(x3 + 30, y1 + string_height(vtext[3]) / 2 * list_size * 1.04  * list_scale + 6, vtext[3], list_size * 1.04, list_size * 1.04 * list_scale, 0);
						
							if list_go = 1 && list_scale > 0.2
								{
								draw_set_color(c_white);
								draw_set_alpha(0.4 + 0.6 * timer_x / (6 * room_speed));
								draw_rectangle(640 - 200 * timer_x / (6 * room_speed), global.size / 2 - 20 - 6 * list_scale, 640 + 200 * timer_x / (6 * room_speed), /*y1 - 180*/global.size / 2 - 20 + 6 * list_scale, 0);
								draw_set_alpha(1);
								}
						#endregion
						}
				#endregion
				#region Задача 4 - Равно Неравно
					if round_task[global.rounds,global.task] = 4
						{
						#region Координаты кнопок
								var x1, y1, x2, y2, x3, y3, x4, y4, button_width, button_height;
							
								button_width = sprite_get_width(s_question_sign) * list_size1 * o_but_sc;
								button_height = sprite_get_height(s_question_sign) * list_size1 * o_but_sc;
							
								x1 = 640 - button_width / 2 * 3 - 45; //640 - 5 - 160 * list_size1 - button_x;
								y1 = global.size - 200;
							
								x2 = 640 - button_width / 2 - 15; //640 - 5 + 160 * list_size1 + button_x;
								y2 = y1;
		
								x3 = 640 + button_width / 2 + 15; //x1;
								y3 = global.size - 200;
							
								x4 = 640 + button_width / 2 * 3 + 45; // x2;
								y4 = y3;
						#endregion
						#region Варианты
							if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
								#region Вариант 2
									if point_in_rectangle(mouse_x, mouse_y, x2 - button_width / 2, y2 - button_height / 2, x2 + button_width / 2, y2 + button_height / 2)
										{
										if mouse_check_button(mb_left)
											{ b_pressed_s[2] = 1.2; }
											else
											{ b_pressed_s[2] = 1; }
										if mouse_check_button_released(mb_left)
											{
											if global.music { audio_play_sound(sd_text, 2, 0); }
											/*audio_play_sound(sd_revolver, 1, 0);*/
											if vtrue[2] = 1
												{ global.answer = 1; }
												else
												{ global.answer = 0; }
											math_4();
											}
										}
										else
										{ b_pressed_s[2] = 1; }
								#endregion
								#region Вариант 3
									if point_in_rectangle(mouse_x, mouse_y, x3 - button_width / 2, y3 - button_height / 2, x3 + button_width / 2, y3 + button_height / 2)
										{
										if mouse_check_button(mb_left)
											{ b_pressed_s[3] = 1.2; }
											else
											{ b_pressed_s[3] = 1; }
										if mouse_check_button_released(mb_left)
											{
											if global.music { audio_play_sound(sd_text, 2, 0); }
											/*audio_play_sound(sd_revolver, 1, 0);*/
											if vtrue[3] = 1
												{ global.answer = 1; }
												else
												{ global.answer = 0; }
											math_4();
											}
										}
										else
										{ b_pressed_s[3] = 1; }
								#endregion
								}
						#endregion
						#region Рисование кнопок и вопроса
							draw_set_font(global.math_font);
						
							//draw_set_font(f_question_bold);
							draw_set_color(c_black);
							draw_set_alpha(0.4);
							draw_text_transformed(640 - 3 + 30, global.size / 2 - 200 * list_size - 50 + list_y + 4 + button_x / 4 - 125 * (1 - list_scale), equation_text /*"14?7=2*/, list_size * 1.04, list_size * 1.04 * list_scale, 0);
							draw_set_color(c_white);
							draw_set_alpha(1);
							draw_text_transformed(640 + 30, global.size / 2 - 200 * list_size - 50 + list_y + button_x / 4 - 125 * (1 - list_scale), equation_text /*"14?7=2*/, list_size * 1.04, list_size * 1.04 * list_scale, 0);
					
							draw_sprite_ext(s_question_figure, 2, x2, y1 + 6 + 6, list_size1, list_size1 * list_scale, 0, c_black, 0.4);
							draw_sprite_ext(s_question_figure, 2, x3, y1 + 6 + 6, -list_size1, list_size1 * list_scale, 0, c_black, 0.4);
						
							draw_sprite_ext(s_question_figure, 3, x2, y1 + 6, list_size1, list_size1 * list_scale, 0, c_white, 1);
							draw_sprite_ext(s_question_figure, 3, x3, y1 + 6, -list_size1, list_size1 * list_scale, 0, c_white, 1);
							
							draw_sprite_ext(s_question_figure, 2, x2, y1 + 6, list_size1 * b_pressed_s[2], list_size1 * list_scale * b_pressed_s[2], 0, c_white, 1);
							draw_sprite_ext(s_question_figure, 2, x3, y1 + 6, -list_size1 * b_pressed_s[3], list_size1 * list_scale * b_pressed_s[3], 0, c_white, 1);
						
							draw_text_transformed(x2 + 40, y1 + string_height(vtext[2]) / 2 * list_size * 1.04 * list_scale + 6, vtext[2], list_size * 1.1, list_size * 1.1 * list_scale, 0);
							draw_text_transformed(x3 + 40, y1 + string_height(vtext[3]) / 2 * list_size * 1.04  * list_scale + 6, vtext[3], list_size * 1.1, list_size * 1.1 * list_scale, 0);
						
							if list_go = 1 && list_scale > 0.2
								{
								draw_set_color(c_white);
								draw_set_alpha(0.4 + 0.6 * timer_x / (6 * room_speed));
								draw_rectangle(640 - 200 * timer_x / (6 * room_speed), global.size / 2 - 20 - 6 * list_scale, 640 + 200 * timer_x / (6 * room_speed), /*y1 - 180*/global.size / 2 - 20 + 6 * list_scale, 0);
								draw_set_alpha(1);
								}
						#endregion
						}
				#endregion
				}
			#endregion
			#region Меткость - Precision
			if theme_round[global.rounds] = 4//2
				{
				#region Задача 1 - Бутылки, очередь
					if round_task[global.rounds,global.task] = 1
						{
						#region Координаты и появление
							if list_scale = 1
								{
								for(i=1;i<=botle_all;i++)
									{
									if botle_n[i] = botle_stage
										{
										if botle_y[i] < 0
											{ botle_y[i] += 80 }
											else
											{
											botle_y[i] = 0;
											if botle_stage < botle_all
												{ botle_stage += 1; }
												else
												{ botle_stage = 0; }
											}
										}
									botle_x[i] = 640 - 100 * i + 100 * 2.5;
									}
								}
						#endregion
						#region Ответ
							if botle_stage = 0 && global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
								for(i=1; i<=botle_all; i++)
									{
									if abs(mouse_x - botle_x[i]) < 50 && abs(mouse_y - global.size / 2) < 100
										{
										if mouse_check_button_pressed(mb_left)
											{
											if botle_destroy[i] = 0
												{
												if global.music { audio_play_sound(sd_text, 2, 0); }
												botle_destroy[i] = 1;
												if botle_s + 1 = botle_n[i]
													{
													if botle_s + 1 = botle_all
														{ /*audio_play_sound(sd_revolver, 1, 0);*/ global.answer = 1; precision_1(); }
														else
														{ botle_s = botle_n[i]; }
													}
													else
													{ /*audio_play_sound(sd_revolver, 1, 0);*/ global.answer = 0; precision_1(); }
												}
											}
										}
									}
								}
						#endregion
						#region Рисование
							for(i=1;i<=botle_all;i++)
								{
								if botle_destroy[i] > 0
									{
									if botle_destroy[i] < 6
										{
										botle_destroy[i] += 1;
										draw_sprite_ext(s_botle_destroy, botle_destroy[i] - 1, botle_x[i], global.size / 2 + botle_y[i], 0.6 * list_scale, 0.6 * list_scale, 0, c_white, 1 - 0.1 * botle_destroy[i]);
										}
									}
									else
									{ draw_sprite_ext(s_botle, 0, botle_x[i], global.size / 2 + botle_y[i], 0.6 * list_scale, 0.6 * list_scale, 0, c_white, 1 - 0.5 * botle_destroy[i]); }
							
								//draw_sprite_ext(s_botle, 0, botle_x[i], global.size / 2 + botle_y[i], 2 * list_scale, 2 * list_scale, 0, c_white, 1 - 0.5 * botle_destroy[i]);
								//draw_set_color(c_black);
								//draw_text_transformed(botle_x[i], global.size / 2 + botle_y[i], string(botle_n[i]), 0.2, 0.2, 16);
								//draw_set_color(c_white);
								}
						
							if list_go = 1 && list_scale > 0.2
								{
								draw_set_color(c_white);
								draw_set_alpha(0.4 + 0.6 * timer_x / (6 * room_speed));
								draw_rectangle(640 - 200 * timer_x / (6 * room_speed), global.size / 2 - 20 - 6 * list_scale + 150, 640 + 200 * timer_x / (6 * room_speed), global.size / 2 - 20 + 6 * list_scale + 150, 0);
								draw_set_alpha(1);
								}
						#endregion
						}
				#endregion
				#region Задача 2 - Мишени, скорость
					if round_task[global.rounds,global.task] = 2
						{
						#region Координаты и появление
							if list_scale = 1
								{
								for(i=1;i<=target_n;i++)
									{
									if botle_n[i] = botle_stage
										{
										if target_c[i] = 0
											{
											target_s[i] = 0;
											}
										}
									}
								}
						#endregion
						#region Ответ
							if botle_stage = 0 && global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
								for(i=1;i<=botle_all;i++)
									{
									if abs(mouse_x - botle_x[i]) < 50 && abs(mouse_y - global.size / 2) < 100
										{
										if mouse_check_button_pressed(mb_left)
											{
											if botle_destroy[i] = 0
												{
												if global.music { audio_play_sound(sd_text, 2, 0); }
												botle_destroy[i] = 1;
												if botle_s + 1 = botle_n[i]
													{
													if botle_s + 1 = botle_all
														{ /*audio_play_sound(sd_revolver, 1, 0);*/ global.answer = 1; precision_1(); }
														else
														{ botle_s = botle_n[i]; }
													}
													else
													{ /*audio_play_sound(sd_revolver, 1, 0);*/ global.answer = 0; precision_1(); }
												}
											}
										}
									}
								}
						#endregion
						#region Рисование
							for(i=1;i<=botle_all;i++)
								{
								if botle_destroy[i] > 0
									{
									if botle_destroy[i] < 6
										{
										botle_destroy[i] += 1;
										draw_sprite_ext(s_botle_destroy, botle_destroy[i] - 1, botle_x[i], global.size / 2 + botle_y[i], 2 * list_scale, 2 * list_scale, 0, c_white, 1 - 0.1 * botle_destroy[i]);
										}
									}
									else
									{ draw_sprite_ext(s_botle, 0, botle_x[i], global.size / 2 + botle_y[i], 2 * list_scale, 2 * list_scale, 0, c_white, 1 - 0.5 * botle_destroy[i]); }
							
								//draw_sprite_ext(s_botle, 0, botle_x[i], global.size / 2 + botle_y[i], 2 * list_scale, 2 * list_scale, 0, c_white, 1 - 0.5 * botle_destroy[i]);
								//draw_set_color(c_black);
								//draw_text_transformed(botle_x[i], global.size / 2 + botle_y[i], string(botle_n[i]), 0.2, 0.2, 16);
								//draw_set_color(c_white);
								}
						
							if list_go = 1 && list_scale > 0.2
								{
								draw_set_color(c_white);
								draw_set_alpha(0.4 + 0.6 * timer_x / (6 * room_speed));
								draw_rectangle(640 - 200 * timer_x / (6 * room_speed), global.size / 2 - 20 - 6 * list_scale + 150, 640 + 200 * timer_x / (6 * room_speed), global.size / 2 - 20 + 6 * list_scale + 150, 0);
								draw_set_alpha(1);
								}
						#endregion
						}
				#endregion
				#region Задача 3 - Бутылки, номера
					if round_task[global.rounds,global.task] = 3
						{
						#region Координаты и появление
							if list_scale = 1
								{
								for(i=1;i<=botle_all;i++)
									{
									if i = botle_stage
										{
										if botle_y[i] < 0
											{ botle_y[i] += 80 }
											else
											{
											botle_y[i] = 0;
											if botle_stage < botle_all
												{ botle_stage += 1; }
												else
												{ botle_stage = 0; }
											}
										}
									botle_x[i] = 640 - 100 * i + 100 * 2.5;
									}
								}
						#endregion
						#region Ответ
							if botle_stage = 0 && global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
								for(i=1;i<=botle_all;i++)
									{
									if abs(mouse_x - botle_x[i]) < 50 && abs(mouse_y - global.size / 2) < 100
										{
										if mouse_check_button_pressed(mb_left)
											{
											if botle_destroy[i] = 0
												{
												if global.music { audio_play_sound(sd_text, 2, 0); }
												botle_destroy[i] = 1;
												if botle_s + 1 = botle_n[i]
													{
													if botle_s + 1 = botle_all
														{ /*audio_play_sound(sd_revolver, 1, 0);*/ global.answer = 1; precision_1(); }
														else
														{ botle_s = botle_n[i]; }
													}
													else
													{ /*audio_play_sound(sd_revolver, 1, 0);*/ global.answer = 0; precision_1(); }
												}
											}
										}
									}
								}
						#endregion
						#region Рисование
							for(i=1;i<=botle_all;i++)
								{
								if botle_destroy[i] > 0
									{
									if botle_destroy[i] < 6
										{
										botle_destroy[i] += 1;
										draw_sprite_ext(s_botle_destroy, botle_destroy[i] - 1, botle_x[i], global.size / 2 + botle_y[i], 0.6 * list_scale, 0.6 * list_scale, 0, c_white, 1 - 0.1 * botle_destroy[i]);
										}
									}
									else
									{ draw_sprite_ext(s_botle, 0, botle_x[i], global.size / 2 + botle_y[i], 0.6 * list_scale, 0.6 * list_scale, 0, c_white, 1 - 0.5 * botle_destroy[i]); }
								
								draw_set_font(global.game_font);
								draw_set_color(c_black);
								draw_set_alpha(0.4);
								draw_text_transformed(botle_x[i], global.size / 2 + botle_y[i] + 50, string(botle_n[i]), -0.4, 0.4 * ((6 - botle_destroy[i]) / 6), 16);
								draw_set_alpha(1);
								draw_set_color(c_white);
								}
						
							if list_go = 1 && list_scale > 0.2
								{
								draw_set_color(c_white);
								draw_set_alpha(0.4 + 0.6 * timer_x / (6 * room_speed));
								draw_rectangle(640 - 200 * timer_x / (6 * room_speed), global.size / 2 - 20 - 6 * list_scale + 150, 640 + 200 * timer_x / (6 * room_speed), global.size / 2 - 20 + 6 * list_scale + 150, 0);
								draw_set_alpha(1);
								}
						#endregion
						}
				#endregion
				}
			#endregion
			#region Движение - Move
			if theme_round[global.rounds] = 3
				{
				#region Задача 1 - Рука, стрелка, клик
					if round_task[global.rounds,global.task] = 1
						{
						#region Координаты и появление
							var x1, y1, x2, y2;
						
							dop_q_y = 0;
						
							x1 = 640 - 100;
							y1 = global.size / 2;
							x2 = 640 + 100;
							y2 = y1;
						
							hand_scale = 1;
							//if hand_scale < 1
							//	{ hand_scale += 0.005; }
						
							if hand_angle < 359
								{ hand_angle += 14; }
								else
								{ hand_angle = 0; }
						#endregion
						#region Ответ
							if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
								if point_in_rectangle(mouse_x, mouse_y, 200, 0, 1080, global.size - 150)
									{
									if mouse_check_button_pressed(mb_left)
										{
										if global.music { audio_play_sound(sd_text, 2, 0); }
										/*audio_play_sound(sd_revolver, 1, 0);*/
										if abs(hand_true - hand_angle) < 30 or abs(hand_true - hand_angle) > 329
											{ global.answer = 1; }
											else
											{ global.answer = 0; }
										move_1();
										}
									}
								}
						#endregion
						#region Рисование
							draw_set_font(global.math_font);
							
							draw_sprite_ext_t(s_arrow, 0, x1, y1, hand_scale * list_scale, hand_scale * list_scale, hand_true - 90, c_white, 1, c_black, c_white);
							draw_sprite_ext(s_hand, 0, x2, y2, hand_scale * list_scale * 0.8, hand_scale * list_scale * 0.8, hand_angle - 90, c_white, 1);
							if list_go = 1 && list_scale > 0.2
								{
								draw_set_color(c_white);
								draw_set_alpha(0.4 + 0.6 * timer_x / (6 * room_speed));
								draw_rectangle(640 - 200 * timer_x / (6 * room_speed), global.size / 2 - 20 - 6 * list_scale + 200, 640 + 200 * timer_x / (6 * room_speed), global.size / 2 - 20 + 6 * list_scale + 200, 0);
								draw_set_alpha(1);
								}
						#endregion
						}
				#endregion
				#region Задача 2 - Конь, заборы
					if round_task[global.rounds,global.task] = 2
						{
						#region Координаты и появление
							var x0, x1, y0, y1, y2, y3, y4, y5, hn;
						
							dop_q_y = -70;
						
							hn = 0;
							x0 = 640;
						
							y1 = global.size / 2 + 150 - 35;
							y2 = global.size / 2 + 75;
							y3 = global.size / 2;
							y4 = global.size / 2 - 75;
							y5 = global.size / 2 - 150;
						
							y0 = y1;
						
							if horse_n[1] != 0
								{ hn = horse_n[1]; y0 = y2; }
							if horse_n[2] != 0
								{ hn = horse_n[2]; y0 = y3; }
							if horse_n[3] != 0
								{ hn = horse_n[3]; y0 = y4; }
							if horse_n[4] != 0
								{ hn = horse_n[4]; y0 = y5; }
						
							if hand_angle < 359
								{ hand_angle += 14; }
								else
								{ hand_angle = 0; }
						#endregion
						#region Ответ
							if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
								if point_in_rectangle(mouse_x, mouse_y, 200, 0, 1080, global.size - 150)
									{
									if mouse_check_button_pressed(mb_left)
										{
										if global.music { audio_play_sound(sd_text, 2, 0); }
									
										var dir;
										if mouse_x < 640
											{ dir = -1; }
											else
											{ dir = 1; }
										
										if horse_n[1] = 0
											{
											horse_n[1] = dir;
											if horse_p[1] = dir
												{
												/*audio_play_sound(sd_revolver, 1, 0);*/
												global.answer = 0;
												move_2();
												}
											}
											else
											{
											if horse_n[2] = 0
												{
												horse_n[2] = dir;
												if horse_p[2] = dir
													{
													/*audio_play_sound(sd_revolver, 1, 0);*/
													global.answer = 0;
													move_2();
													}
												}
												else
												{
												if horse_n[3] = 0
													{
													horse_n[3] = dir;
													if horse_p[3] = dir
														{
														/*audio_play_sound(sd_revolver, 1, 0);*/
														global.answer = 0;
														move_2();
														}
													}
													else
													{
													if horse_n[4] = 0
														{
														horse_n[4] = dir;
														if horse_p[4] = dir
															{
															/*audio_play_sound(sd_revolver, 1, 0);*/
															global.answer = 0;
															move_2();
															}
															else
															{
															/*audio_play_sound(sd_revolver, 1, 0);*/
															global.answer = 1;
															move_2();
															}
														}
													}
												}
											}
										//if abs(hand_true - hand_angle) < 25 or abs(hand_true - hand_angle) > 334
										//	{ global.answer = 1; }
										//	else
										//	{ global.answer = 0; }
										//move_1();
										}
									}
								}
						#endregion
						#region Рисование
							draw_set_font(global.math_font);
						
							if y0 = y5
								{ draw_sprite_ext(s_horse, 0, x0 + 60 * hn, y0, list_scale, list_scale2, 0, c_white, 1); }
							draw_sprite_ext(s_fence, 0, x0 + 60 * horse_p[4], y5, list_scale, list_scale, 0, c_white, 1);
							if y0 = y4
								{ draw_sprite_ext(s_horse, 0, x0 + 60 * hn, y0, list_scale, list_scale, 0, c_white, 1); }
							draw_sprite_ext(s_fence, 0, x0 + 60 * horse_p[3], y4, list_scale, list_scale, 0, c_white, 1);
							if y0 = y3
								{ draw_sprite_ext(s_horse, 0, x0 + 60 * hn, y0, list_scale, list_scale, 0, c_white, 1); }
							draw_sprite_ext(s_fence, 0, x0 + 60 * horse_p[2], y3, list_scale, list_scale, 0, c_white, 1);
							if y0 = y2
								{ draw_sprite_ext(s_horse, 0, x0 + 60 * hn, y0, list_scale, list_scale, 0, c_white, 1); }
							draw_sprite_ext(s_fence, 0, x0 + 60 * horse_p[1], y2, list_scale, list_scale, 0, c_white, 1);
							if y0 = y1
								{ draw_sprite_ext(s_horse, 0, x0 + 60 * hn, y0, list_scale, list_scale, 0, c_white, 1); }
						
							if list_go = 1 && list_scale > 0.2
								{
								draw_set_color(c_white);
								draw_set_alpha(0.4 + 0.6 * timer_x / (6 * room_speed));
								draw_rectangle(640 - 200 * timer_x / (6 * room_speed), global.size / 2 - 20 - 6 * list_scale + 200, 640 + 200 * timer_x / (6 * room_speed), global.size / 2 - 20 + 6 * list_scale + 200, 0);
								draw_set_alpha(1);
								}
						#endregion
						}
				#endregion
				#region Задача 3 - Рука, свайп
					if round_task[global.rounds,global.task] = 3
						{
						#region Координаты и появление
							var x1, y1;
						
							dop_q_y = -70;
						
							x1 = 640;
							y1 = global.size / 2 - 20;
						
							hand_scale = 1;
						
							if hand_angle < hand_true
								{ hand_angle += 14; }
								else
								{ hand_angle = hand_true; }
						#endregion
						#region Ответ
							if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
								if hand_s_t > 0
									{ hand_s_t -= 1; }
									else
									{ hand_s_t = 0; }
							
								if point_in_rectangle(mouse_x, mouse_y, 200, 0, 1080, global.size - 150)
									{
									if mouse_check_button_pressed(mb_left)
										{
										hand_s_x = mouse_x;
										hand_s_y = mouse_y;
										hand_s_t = 50;
										}
									}
								
								if mouse_check_button_released(mb_left)
									{
									if point_distance(hand_s_x, hand_s_y, mouse_x, mouse_y) < 190
										{ hand_s_t = 0; }
										else
										{
										if hand_s_t > 0
											{
											if global.music { audio_play_sound(sd_text, 2, 0); }
											/*audio_play_sound(sd_revolver, 1, 0);*/
											if abs(hand_true - point_direction(hand_s_x, hand_s_y, mouse_x, mouse_y)) < 30 or abs(hand_true - point_direction(hand_s_x, hand_s_y, mouse_x, mouse_y)) > 329
												{ global.answer = 1; }
												else
												{ global.answer = 0; }
											move_3();
											}
										}
									}
								}
						#endregion
						#region Рисование
							draw_set_font(global.math_font);
							
							draw_sprite_ext(s_hand, 0, x1, y1, hand_scale * list_scale * 0.8, hand_scale * list_scale * 0.8, hand_angle - 90, c_white, 1);
							if list_go = 1 && list_scale > 0.2
								{
								draw_set_color(c_white);
								draw_set_alpha(0.4 + 0.6 * timer_x / (6 * room_speed));
								draw_rectangle(640 - 200 * timer_x / (6 * room_speed), global.size / 2 - 20 - 6 * list_scale + 200, 640 + 200 * timer_x / (6 * room_speed), global.size / 2 - 20 + 6 * list_scale + 200, 0);
								draw_set_alpha(1);
								}
						//draw_text_transformed(mouse_x, mouse_y, string(hand_true) + "-" + string(point_direction(hand_s_x, hand_s_y, mouse_x, mouse_y)), 0.2, 0.2, 15);
						#endregion
						}
				#endregion
				#region Задача 4 - Рука, градусы, клик
					if round_task[global.rounds,global.task] = 4
						{
						#region Координаты и появление
							var x1, y1, x2, y2;
						
							dop_q_y = 0;
						
							x1 = 640 - 100;
							y1 = global.size / 2;
							x2 = 640 + 100;
							y2 = y1;
						
							hand_scale = 1;
							//if hand_scale < 1
							//	{ hand_scale += 0.005; }
						
							if hand_angle < 359
								{ hand_angle += 7; }
								else
								{ hand_angle = 0; }
						#endregion
						#region Ответ
							if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
								if point_in_rectangle(mouse_x, mouse_y, 200, 0, 1080, global.size - 150)
									{
									if mouse_check_button_pressed(mb_left)
										{
										if global.music { audio_play_sound(sd_text, 2, 0); }
										/*audio_play_sound(sd_revolver, 1, 0);*/
										if abs(hand_true - hand_angle) < 30 or abs(hand_true - hand_angle) > 329
											{ global.answer = 1; }
											else
											{ global.answer = 0; }
										move_4();
										}
									}
								}
						#endregion
						#region Рисование
							draw_set_font(global.game_font);
							draw_text_transformed_t(x1, y1, string(hand_true) + "°", list_scale * 0.4, list_scale * 0.4, 15, c_white, c_black);//draw_sprite_ext_t(s_arrow, 0, x1, y1, hand_scale * list_scale, hand_scale * list_scale, hand_true - 90, c_white, 1, c_black, c_white);
							draw_sprite_ext(s_hand, 0, x2, y2, hand_scale * list_scale * 0.8, hand_scale * list_scale * 0.8, hand_angle - 90, c_white, 1);
							if list_go = 1 && list_scale > 0.2
								{
								draw_set_color(c_white);
								draw_set_alpha(0.4 + 0.6 * timer_x / (6 * room_speed));
								draw_rectangle(640 - 200 * timer_x / (6 * room_speed), global.size / 2 - 20 - 6 * list_scale + 200, 640 + 200 * timer_x / (6 * room_speed), global.size / 2 - 20 + 6 * list_scale + 200, 0);
								draw_set_alpha(1);
								}
						#endregion
						}
				#endregion
				}
			#endregion
			#region Внимание - Attention
				if theme_round[global.rounds] = 2//4
				{
				#region Задача 1 - Шляпа и напертски
					if round_task[global.rounds,global.task] = 1
						{
						#region Движение
							var hat_yy, hat_scale;
							hat_yy = global.size / 2;
							hat_scale = 0.8;
							if hat_stage = 0 && list_scale = 1
								{
								if hat_timer > 0
									{ hat_timer -=1; }
									else
									{
									if hat_y[2] > 0
										{ hat_y[2] -= 25; }
										else
										{ hat_timer = 10; hat_stage = 1; }
									}
								}
							if hat_stage = 1
								{
								hat_sha  = choose(1, 2, 3);
								if hat_sha = 1
									{ hat_cha = choose(2, 3); }
								if hat_sha = 2
									{ hat_cha = choose(1, 3); }
								if hat_sha = 3
									{ hat_cha = choose(1, 2); }
								hat_xn[hat_sha] = hat_x[hat_cha];
								hat_xn[hat_cha] = hat_x[hat_sha];
								hat_stage = 2;
								}
							if hat_stage = 2
								{
								if hat_x[hat_sha] < hat_xn[hat_sha]
									{ hat_x[hat_sha] += hat_spd; }
								if hat_x[hat_sha] > hat_xn[hat_sha]
									{ hat_x[hat_sha] -= hat_spd; }
								
								if hat_x[hat_cha] < hat_xn[hat_cha]
									{ hat_x[hat_cha] += hat_spd; }
								if hat_x[hat_cha] > hat_xn[hat_cha]
									{ hat_x[hat_cha] -= hat_spd; }
								
								if hat_x[hat_sha] = hat_xn[hat_sha] && hat_x[hat_cha] = hat_xn[hat_cha]
									{
									if hat_num < hat_max
										{ hat_num +=1; hat_stage = 1; }
										else
										{ hat_stage = 3; }
									}
								}
							if hat_stage = 4
								{
								if hat_y[hat_end] < 150
									{ hat_y[hat_end] += 25; }
									else
									{ hat_stage = 5; }
								}
							if hat_stage = 5
								{
								if hat_res = 0
									{
									if hat_alpha[2] > 0.3
										{ hat_alpha[2] -= 0.05; }
										else
										{ hat_stage = 6; }
									}
									else
									{ hat_stage = 6; }
								}
							if hat_stage = 6
								{
								if hat_timer > 0
									{ hat_timer -=1; }
									else
									{
									global.answer = hat_res;
									attention_1();
									}
								}
						#endregion
						#region Ответ
						if hat_stage = 3
							{
							if mouse_check_button_released(mb_left)
								{
								if point_in_rectangle(mouse_x, mouse_y, hat_x[2] - 200 * hat_scale, hat_yy - 250 * hat_scale, hat_x[2] + 200 * hat_scale, hat_yy + hat_y[2] + 250 * hat_scale)
									{
									audio_play_sound(sd_text, 2, 0);
									hat_end = 2;
									hat_res = 1;
									hat_stage = 4;
									}
								if point_in_rectangle(mouse_x, mouse_y, hat_x[1] - 200 * hat_scale, hat_yy - 250 * hat_scale, hat_x[1] + 200 * hat_scale, hat_yy + hat_y[1] + 250 * hat_scale)
									{
									audio_play_sound(sd_text, 2, 0);
									hat_end = 1;
									hat_res = 0;
									hat_stage = 4;
									}
								if point_in_rectangle(mouse_x, mouse_y, hat_x[3] - 200 * hat_scale, hat_yy - 250 * hat_scale, hat_x[3] + 200 * hat_scale, hat_yy + hat_y[3] + 250 * hat_scale)
									{
									audio_play_sound(sd_text, 2, 0);
									hat_end = 3;
									hat_res = 0;
									hat_stage = 4;
									}
								}
							}
						#endregion
						#region Рисование
							draw_sprite_ext_t(s_hat, 1, hat_x[2], hat_yy, hat_s[2] * hat_scale * list_scale, hat_s[2] * hat_scale * list_scale, 0, c_white, 1, c_white, c_black);
							
							draw_sprite_ext(s_hat, 0, hat_x[1], hat_yy - hat_y[1], hat_s[1] * hat_scale * list_scale, hat_s[1] * hat_scale * list_scale, 0, c_white, hat_alpha[1]);
							draw_sprite_ext(s_hat, 0, hat_x[2], hat_yy - hat_y[2], hat_s[2] * hat_scale * list_scale, hat_s[2] * hat_scale * list_scale, 0, c_white, hat_alpha[2]);
							draw_sprite_ext(s_hat, 0, hat_x[3], hat_yy - hat_y[3], hat_s[3] * hat_scale * list_scale, hat_s[3] * hat_scale * list_scale, 0, c_white, hat_alpha[3]);
						#endregion
						}
				#endregion
				#region Задача 2 - Карты, найти пару
					if round_task[global.rounds,global.task] = 3
						{
						#region Движение
							var card_x, card_y;
							card_x = 640 - 140;
							card_y = global.size / 2 - 60;
						#endregion
						#region Ответ
							for(i=1;i<=2;i++)
								{
								for(j=1;j<=3;j++)
									{
									if point_in_rectangle(mouse_x, mouse_y, card_x + (j-1) * 140 - 75 * card_scale[i,j], card_y + 180 * (i-1) - 110 * card_scale[i,j], card_x + (j-1) * 140 + 75 * card_scale[i,j], card_y + 180 * (i-1) + 110 * card_scale[i,j])
										{
										if mouse_check_button_pressed(mb_left) && card_now[i,j] = 0 && card_end[i,j] = 0
											{
											if fir_i = 0 && fir_j = 0
												{
												fir_i = i;
												fir_j = j;
												card_now[i,j] = 1;
												}
												else
												{
												if sec_i = 0 && sec_j = 0
													{
													sec_i = i;
													sec_j = j;
													card_now[i,j] = 1;
													}
												}
											}
										}
									if card_now[i,j] = 1
										{
										if card_scale[i,j] > 0
											{ card_scale[i,j] -= 0.2; }
											else
											{ card_now[i,j] = 2; card_i[i,j] = card_m[i,j]; }
										}
									if card_now[i,j] = 2
										{
										if card_scale[i,j] < 0.7
											{ card_scale[i,j] += 0.2; }
											else
											{
											if sec_i != 0 && card_scale[sec_i,sec_j] = 0.7
												{
												if card_m[fir_i,fir_j] = card_m[sec_i,sec_j]
													{
													card_end[fir_i,fir_j] = 1;
													card_end[sec_i,sec_j] = 1;
													}
													else
													{
													card_now[fir_i,fir_j] = 4;
													card_now[sec_i,sec_j] = 4;
													}
												fir_i = 0;
												fir_j = 0;
												
												sec_i = 0;
												sec_j = 0;
												}
												else
												{ card_now[i,j] = 3; }
											}
										}
									if card_now[i,j] = 4
										{
										if card_scale[i,j] > 0
											{ card_scale[i,j] -= 0.2; }
											else
											{ card_now[i,j] = 5; card_i[i,j] = 0; }
										}
									if card_now[i,j] = 5
										{
										if card_scale[i,j] < 0.7
											{ card_scale[i,j] += 0.2; }
											else
											{ card_now[i,j] = 0; }
										}
									
									//if card_now[i,j]
									//	{
										
									//	}
									if card_end[i,j] = 1
										{
										if card_alp[i,j] > 0
											{
											card_alp[i,j] -= 0.1;
											card_yy[i,j]  += 5;
											}
										}
									}
								}
							if card_end[1,1] = 1 && card_end[1,2] = 1 && card_end[1,3] = 1
							&& card_end[2,1] = 1 && card_end[2,2] = 1 && card_end[2,3] = 1
								{
								global.answer = 1;
								attention_2();
								}
						#endregion
						#region Рисование
							for(i=1;i<=2;i++)
								{
								for(j=1;j<=3;j++)
									{
									draw_sprite_ext(s_card, card_i[i,j], card_x + (j-1) * 140, card_y + 180 * (i-1) + card_yy[i,j], card_scale[i,j], 0.7, 0, c_white, card_alp[i,j]);
									}
								}
						#endregion
						}
				#endregion
				}
			#endregion
			}
	#endregion
	#region Геймплей
		#region  Таймер
			if list_scale = 1
				{
				if timer > 0
						{
						if global.super_ability = 0
							{
							timer -= 1; 
							timer_x -= 1;
							}
						}
						else
						{
						global.answer = 0;
						if theme_round[global.rounds] = 1
							{ script_execute(asset_get_index("math_" + string(round_task[global.rounds,global.task]))); }
						if theme_round[global.rounds] = 3
							{ script_execute(asset_get_index("move_" + string(round_task[global.rounds,global.task]))); }
						if theme_round[global.rounds] = 2
							{ script_execute(asset_get_index("precision_" + string(round_task[global.rounds,global.task]))); }
						}
				}
		#endregion
			#region Игрок
			if global.answer != -1
				{
				list_scale = 0;
				//if bot_question <= global.question && (bot_task <= global.task) && bot_time2 > 3 * room_speed
				//	{ bot_time = random(1) * room_speed; bot_time2 = 3 * room_speed; }
				if global.answer = 1
					{
					answer_rec = 1;
					answer_col = make_color_rgb(60, 179, 113);
					
					if super_now != super_need
						{ super_now += 1; part_n = -1; }
					if global.critical < 3
						{ global.critical += 1; }
					}
					else
					{
					answer_rec = 1;
					answer_col = make_color_rgb(178, 34, 34);
					global.critical = 0;
					}
				accuracy_true += global.answer;
				accuracy_all  += 1;
				
				for(i=1;i<=6;i++)
					{
					if task_question[global.task,i] = -1
						{
						if timer != 0
							{ task_question[global.task,i] = global.answer; }
							else
							{ task_question[global.task,i] = -2; }
						break;
						}
					}
				if global.question < 3
					{
					global.question += 1;
					}
					else
					{
					if global.task < 3
						{
						global.task += 1;
						
						if theme_round[global.rounds] = 1
							{
							script_execute(asset_get_index("math_" + string(round_task[global.rounds,global.task])));
							//if round_task[global.rounds,global.task] = 1
							//	{ math_1(); }
							//if round_task[global.rounds,global.task] = 2
							//	{ math_2(); }
							//if round_task[global.rounds,global.task] = 3
							//	{ math_3(); }
							//if round_task[global.rounds,global.task] = 4
							//	{ math_4(); }
							}
						if theme_round[global.rounds] = 3
							{
							script_execute(asset_get_index("move_" + string(round_task[global.rounds,global.task])));
							}
						if theme_round[global.rounds] = 2
							{ script_execute(asset_get_index("precision_" + string(round_task[global.rounds,global.task]))); }
						global.question = 1;
						}
						else
						{
						list_go = 0;
						list_scale = 0;
						plas_scale = 0;
						}
					}
				if timer != 0
					{
					//
					#region Старый код
						with(o_hero)
							{
							if !enemy
								{
								answer = global.answer;
								//shoot = 1;
								image_speed = 2.5;
								if huntress_poison = 0
									{ skeleton_animation_set("shoot"); }
									else
									{ skeleton_animation_set("super"); }
								change = 3;
								}
								else
								{
								if global.answer = 0 && !(skeleton_animation_get() = "super") && !(image_index <= 20 && skeleton_animation_get() = "shoot")
									{
									image_speed = 1.5;
									skeleton_animation_set("miss");
									change = 1;
									}
								}
							}
					#endregion
					}
					else
					{ dop_i[0] = 2; }
					//
				global.answer = -1;
				timer = 6 * room_speed;
				timer_x = timer;
				}
				#endregion
			#region Бот
				if bot_go !=0 //list_scale = 1 && bot_go !=0
					{
					//if bot_type = 1
						{
						if bot_time = -1
							{
							if bot_type = 0
								{ bot_time = random_range(1, 3) * room_speed + min_time[theme_round[global.rounds],round_task[global.rounds,global.task]]; }
							if bot_type = 1
								{ bot_time = random_range(1, 3) * room_speed + min_time[theme_round[global.rounds],round_task[global.rounds,global.task]]; }
							if bot_type = 2
								{ bot_time = random_range(3, 5) * room_speed + min_time[theme_round[global.rounds],round_task[global.rounds,global.task]]; }
							if bot_type = 3
								{ bot_time = random_range(2, 4) * room_speed + min_time[theme_round[global.rounds],round_task[global.rounds,global.task]]; }
							bot_time2  = 6 * room_speed;
							}
							else
							{
							if bot_time > 0
								{ bot_time -= 1; }
								else
								{
								if bot_type = 0
									{ global.bot_answer = choose(0, 0, 0, 1, 1); }
								if bot_type = 1
									{ global.bot_answer = choose(0, 1); }
								if bot_type = 2
									{ global.bot_answer = choose(0, 1, 1, 1, 1, 1, 1, 1, 1, 1); }
								if bot_type = 3
									{ global.bot_answer = choose(0, 1, 1, 1, 1, 1, 1, 1); }
								}
							if global.bot_answer = -1
								{
								if bot_time2 > 0
									{ bot_time2 -= 1; }
									else
									{
									bot_time = -1;
									//bot_time2 = 6 * room_speed;
									global.bot_answer = 0;
									}
								}
							if bot_time2 <= 30
								{
								if enemy_smile = -1
									{
									enemy_smile_chance = choose(0,0,0,1);
									if enemy_smile_chance = 1
										{
										enemy_smile = choose(2,2,2,5);
										enemy_smile_time = 30;
										}
									}
								}
							}
						}
					}
			#endregion
			#region Враг
			if global.bot_answer != -1 && bot_go != 0
				{
				//if bot_question >= global.question && (bot_task >= global.task) && timer > 2 * room_speed
				//	{ timer = 2 * room_speed; timer_x = 2 * room_speed; }
				if global.bot_answer = 1
					{
					if global.e_critical < 3
						{ global.e_critical += 1; }
					}
					else
					{ global.e_critical = 0; }
				
				for(i=1;i<=6;i++)
					{
					if task_question[bot_task,i] = -1
						{
						if bot_time2 != 0
							{ task_question[bot_task,i] = 2 + global.bot_answer; }
							else
							{ task_question[bot_task,i] = -2; }
						break;
						}
					}
				if bot_question < 3
					{
					bot_question += 1;
					}
					else
					{
					if bot_task < 3
						{
						bot_task += 1;
						bot_question = 1;
						}
						else
						{
						bot_time2 = -2;
						bot_time  = -2;
						bot_go = 0;
						}
					}
				if bot_time2 != 0
					{
					#region Старый код
					//
					with(o_hero)
						{
						if enemy
							{
							answer = global.bot_answer;
							image_speed = 2.5;
							skeleton_animation_set("shoot");
							change = 3;
							}
							else
							{
							if global.bot_answer = 0 && !(skeleton_animation_get() = "super") && !(image_index <= 20 && skeleton_animation_get() = "shoot")
								{
								image_speed = 1.5;
								skeleton_animation_set("miss");
								change = 1;
								}
							}
						}
					#endregion
					}
					//
				global.bot_answer = -1;
				if bot_go != 0
					{ bot_time2 = 6 * room_speed; }
				bot_time = -1;
				}
				#endregion
		#region Атака персонажей
			//for(j=1; j<=3; j++)
			//	{
			//	for(i=1; i<=6; i++)
			//		{
			//		if task_question[j,i] >= 0 && global.pin = -1
			//			{
			//			if task_question[j,i] = 0 or task_question[j,i] = 1
			//				{
			//				//if timer = 0
			//				//	{ global.pin = -1; i = 10; j =10; break; }
			//				if task_question[j,i] = 0
			//					{
			//					with(o_hero)
			//						{
			//						if change = 0 && skeleton_animation_get() = "idle"
			//							{
			//							global.pin = 789;
			//							if !enemy
			//								{
			//								answer = 0;
			//								image_speed = 2.5;
			//								skeleton_animation_set("shoot");
			//								change = 3;
			//								}
			//								else
			//								{
			//								image_speed = 1.5;
			//								skeleton_animation_set("miss");
			//								change = 1;
			//								}
			//							}
			//						}
			//					if global.pin = 789
			//						{
			//						global.pin = task_question[j,i];
			//						show_message("ZHOPKA=" + string(task_question[j,i]));
			//						task_question[j,i] = -2;
			//						}
			//					}
			//					else
			//					{
			//					with(o_hero)
			//						{
			//						if change = 0 && skeleton_animation_get() = "idle"
			//							{
			//							global.pin = 789;
			//							if !enemy
			//								{
			//								answer = 1;
			//								image_speed = 2.5;
			//								skeleton_animation_set("shoot");
			//								change = 3;
			//								}
			//							}
			//						}
			//					if global.pin = 789
			//						{
			//						global.pin = task_question[j,i];
			//						show_message("ZHOPKA=" + string(task_question[j,i]));
			//						task_question[j,i] = -2;
			//						}
			//					}
			//				}
			//				else
			//				{
			//				//if bot_time2 = 0
			//				//	{ global.pin = -1; i = 10; j =10; break; }
			//				if task_question[j,i] = 2
			//					{
			//					with(o_hero)
			//						{
			//						if change = 0 && skeleton_animation_get() = "idle"
			//							{
			//							global.pin = 789;
			//							if enemy
			//								{
			//								answer = 0;
			//								image_speed = 2.5;
			//								skeleton_animation_set("shoot");
			//								change = 3;
			//								}
			//								else
			//								{
			//								image_speed = 1.5;
			//								skeleton_animation_set("miss");
			//								change = 1;
			//								}
			//							}
			//						}
			//					if global.pin = 789
			//						{
			//						global.pin = task_question[j,i];
			//						show_message("ZHOPKA=" + string(task_question[j,i]));
			//						task_question[j,i] = -2;
			//						}
			//					}
			//					else
			//					{
			//					with(o_hero)
			//						{
			//						if change = 0 && skeleton_animation_get() = "idle"
			//							{
			//							global.pin = 789;
			//							if enemy
			//								{
			//								answer = 1;
			//								image_speed = 2.5;
			//								skeleton_animation_set("shoot");
			//								change = 3;
			//								}
			//							}
			//						}
			//					if global.pin = 789
			//						{
			//						global.pin = task_question[j,i];
			//						show_message("ZHOPKA=" + string(task_question[j,i]));
			//						task_question[j,i] = -2;
			//						}
			//					}
			//				}
			//			//global.pin = task_question[j,i];
			//			//task_question[j,i] = -2;
			//			break;
			//			}
			//		}
			//	}
		#endregion
		#region Конец раунда
			global.sraka = 0;
			with(o_hero)
				{
				if skeleton_animation_get() != "idle"
					{ global.sraka = 1; }
				}
			if (task_question[3,6] != -1 or hp <= 0 or e_hp <= 0) && theme_choose != 5  && theme_choose != 6 && (global.player_object).shoot = 0  && (global.enemy_object).shoot = 0 && global.sraka = 0
				{
				list_go = 0;
				list_scale = 0;
				plas_scale = 0;
								
				bot_go = 0; // 1
				bot_question = 1;
				bot_task     = 1;
				bot_time   = -1;
				bot_time2  = 6 * room_speed;
				global.bot_answer = -1;
								
				global.task = 1;
				if theme_round[global.rounds] = 1
					{ script_execute(asset_get_index("math_" + string(round_task[global.rounds,global.task]))); }
				if theme_round[global.rounds] = 3
					{ script_execute(asset_get_index("move_" + string(round_task[global.rounds,global.task]))); }
				if theme_round[global.rounds] = 2
					{ script_execute(asset_get_index("precision_" + string(round_task[global.rounds,global.task]))); }	
				global.question = 1;
								
				global.game_stage = 4;
								
				round_text1_x = 1450;
				round_3_x     = 1450;
				round_2_x     = 1450;
				round_1_x     = 1450;
				round_0_x     = 1450;
	
				round_alpha   = 1;
				
				if hp / maxhp > e_hp / e_maxhp
					{ roundskul[global.rounds] = 1; }
				
				if hp / maxhp < e_hp / e_maxhp
					{ roundskul[global.rounds] = 2; }
				
				if abs(hp / maxhp - e_hp / e_maxhp) <= 0.015
					{
					if task_question[3,6] = 2 or task_question[3,6] = 3
						{ roundskul[global.rounds] = 1; }
						else
						{ roundskul[global.rounds] = 2; }  // Раунд окончен
					}
				
				task_question[1,1] = -1;
				task_question[1,2] = -1;
				task_question[1,3] = -1;
				task_question[1,4] = -1;
				task_question[1,5] = -1;
				task_question[1,6] = -1; // 0 - игрок неверно, 1 - игрок верно
	
				task_question[2,1] = -1;
				task_question[2,2] = -1;
				task_question[2,3] = -1;
				task_question[2,4] = -1;
				task_question[2,5] = -1;
				task_question[2,6] = -1; // 2 - соперник неверно, 3 - соперник верно
	
				task_question[3,1] = -1;
				task_question[3,2] = -1;
				task_question[3,3] = -1;
				task_question[3,4] = -1;
				task_question[3,5] = -1;
				task_question[3,6] = -1; //
								
				//show_message(string(roundskul[2]));
				if (roundskul[1] = 1 &&  roundskul[2] = 1) or (roundskul[1] = 1 &&  roundskul[3] = 1)  or (roundskul[2] = 1 &&  roundskul[3] = 1)
					{
					//show_message(string(roundskul[1]) + string(roundskul[2]) + string(roundskul[3]));
					//show_message("YOU WIN!!"); room_goto_t("duel");
					theme_choose = 9; whowin = 1;
					}
				if (roundskul[1] = 2 &&  roundskul[2] = 2) or (roundskul[1] = 2 &&  roundskul[3] = 2)  or (roundskul[2] = 2 &&  roundskul[3] = 2)
					{ whowin = 2; /*show_message("YOU LOOSE!"); room_goto_t("duel");*/ }
				if global.rounds < 3
					{ global.rounds += 1; }
					else
					{
					//if roundskul[1] = 1 &&  roundskul[2] = 1
					}
				theme_choose = 5;
				}
		#endregion
	#endregion
	#region Плашка
		//draw_sprite_ext(s_question_question, 2, 640, global.size / 2 - 469 * list_size - 80 + list_y + 5, list_size * plas_scale, list_size, 0, c_black, 0.4);
		//draw_sprite_ext(s_question_question, 0, 640 + 418  * list_size * (1 - plas_scale), global.size / 2 - 469 * list_size - 80 + list_y+ 5, list_size, list_size, 0, c_black, 0.4);
		//draw_sprite_ext(s_question_question, 1, 640 - 418  * list_size * (1 - plas_scale), global.size / 2 - 469 * list_size - 80 + list_y+ 5, list_size, list_size, 0, c_black, 0.4);
		
		//draw_sprite_ext(s_question_question, 2, 640, global.size / 2 - 469 * list_size - 80 + list_y, list_size * plas_scale, list_size, 0, c_white, 1);
		//draw_sprite_ext(s_question_question, 0, 640 + 418  * list_size * (1 - plas_scale), global.size / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
		//draw_sprite_ext(s_question_question, 1, 640 - 418  * list_size * (1 - plas_scale)/* + (419 + 128) * list_size*/, global.size / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
		
		draw_set_font(f_question_regular);
		draw_set_color(c_black);
		draw_set_alpha(0.4);
		draw_text_transformed(640 - 1, dop_q_y + global.size / 2 - 469 * list_size - 90 + 3 + list_y + button_x / 4 + 30, question_text, plas_scale, 1, 0);
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_text_transformed(640, dop_q_y + global.size / 2 - 469 * list_size - 90 + list_y + button_x / 4 + 30, question_text, plas_scale, 1, 0);
	#endregion
	#region Победная и проигрышная плашки
		//if plas_scale < 1
			//{
			//draw_sprite_ext(s_plash_win, 2, 640, global.size / 2 - 469 * list_size - 80 + list_y, list_size * plas_scale, list_size, 0, c_white, 1);
			//draw_sprite_ext(s_plash_win, 0, 640 + 418  * list_size * (1 - plas_scale), global.size / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
			//draw_sprite_ext(s_plash_win, 1, 640 - 418  * list_size * (1 - plas_scale)/* + (419 + 128) * list_size*/, global.size / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
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
		//draw_sprite_ext(s_plash_lose, 1, 640 - 418  * list_size * (1 - plas_scale)/* + (419 + 128) * list_size*/, global.size / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
		
		//draw_set_font(f_win_regular);
		//draw_set_color(c_black);
		//draw_set_alpha(0.4);
		//draw_text_transformed(640 - 1, global.size / 2 - 469 * list_size - 100 + 3 + list_y, "ТЫ ПРОИГРАЛ", plas_scale, 1, 0);
		//draw_set_color(c_white);
		//draw_set_alpha(1);
		//draw_text_transformed(640, global.size / 2 - 469 * list_size - 100 + list_y, "ТЫ ПРОИГРАЛ", plas_scale, 1, 0);
	#endregion
#endregion
#region Способность
	if mouse_check_button_pressed(mb_left) && theme_choose = 4// && list_scale = 1
		{
		if point_in_rectangle(mouse_x, mouse_y, 640 - 80 + sprite_get_width(s_super) / 2 - 20, global.size - 50 - 80 + super_x + super_zhopa, 640 + 80 + sprite_get_width(s_super) / 2 - 20, global.size - 50 + 80 + super_zhopa) //point_in_rectangle(mouse_x, mouse_y, 640 /*- 60 - 500 - super_x*/- 80, global.size - 50 - 80 + super_x, 640 /*- 60 - 500 - super_x*/+ 80, global.size - 50 + 80)
			{
			audio_play_sound(sd_text, 2, 0);
			if super_now = super_need && global.super_ability = 0
				{
				super_now = 0;
				super_need += 3;
				super_now1 = super_need;
				global.super_ability = 1;
				
				with(global.player_object)
					{
					change = 3;
					super  = 1;
					switch(global.hero)
						{
						case 1: skeleton_animation_set("super"); break;
						case 2: skeleton_animation_set("super"); diego_dynamit = 1; break;
						case 3: skeleton_animation_set("reload"); global.super_ability = 0; global.super_ability1 = 1; huntress_poison = 1; break;
						}
					}
				skill[global.rounds] = 2;
				if global.rounds = 1
					{ skill[2] = 0; }
				global.ability_dop_anim = 1;
				//vvv = !vvv;
				}
			}
			//else
			//{
			//if mouse_x < 200
			//	{ /*vvv = !vvv; vvv_time = room_speed * 2.5;*/ }
			//}
		}
	if vvv
		{
		//if vvv_time > 0
		//	{ vvv_time -= 1; }
		//	else
		//	{ vvv = 0; }
		if super_x > 0
			{ super_x -= 40; }
		}
		else
		{
		if super_x < 300
			{ super_x += 40; }
		}
	
	#region Кнопка суперудара игрока
		if 0
		{
		#region Говнокод
			if super_need = 3
				{
				if super_now = 1
					{
					if super_stage < 4
						{ super_stage += 0.5; }
					}
				if super_now = 2
					{
					if super_stage < 9
						{ super_stage += 0.5; }
					}
				if super_now = 3
					{
					if super_stage < 13
						{ super_stage += 0.5; }
					}
				}
			if super_need = 6
				{
				if super_now = 0
					{
					if super_stage > 0
						{ super_stage -= 0.5; }
					}
				if super_now = 1
					{
					if super_stage < 2
						{ super_stage += 0.5; }
					}
				if super_now = 2
					{
					if super_stage < 4
						{ super_stage += 0.5; }
					}
				if super_now = 3
					{
					if super_stage < 6
						{ super_stage += 0.5; }
					}
				if super_now = 4
					{
					if super_stage < 8
						{ super_stage += 0.5; }
					}
				if super_now = 5
					{
					if super_stage < 10
						{ super_stage += 0.5; }
					}
				if super_now = 6
					{
					if super_stage < 13
						{ super_stage += 0.5; }
					}
				}
			if super_need = 9
				{
				if super_now = 0
					{
					if super_stage > 0
						{ super_stage -= 0.5; }
					}
				if super_now = 1
					{
					if super_stage < 2
						{ super_stage += 0.5; }
					}
				if super_now = 2
					{
					if super_stage < 3
						{ super_stage += 0.5; }
					}
				if super_now = 3
					{
					if super_stage < 4
						{ super_stage += 0.5; }
					}
				if super_now = 4
					{
					if super_stage < 5
						{ super_stage += 0.5; }
					}
				if super_now = 5
					{
					if super_stage < 6
						{ super_stage += 0.5; }
					}
				if super_now = 6
					{
					if super_stage < 7
						{ super_stage += 0.5; }
					}
				if super_now = 7
					{
					if super_stage < 8
						{ super_stage += 0.5; }
					}
				if super_now = 8
					{
					if super_stage < 10
						{ super_stage += 0.5; }
					}
				if super_now = 9
					{
					if super_stage < 13
						{ super_stage += 0.5; }
					}
				}
		#endregion
		}
		#region Пацанкод
			if part_n = 1
				{
				if part_y < global.size - 10
					{ part_y += part_yspd; }
				if abs(part_x - (1280) * super_now1 / super_need) > 10
					{ part_x -= sign(part_x - (1280) * super_now1 / super_need) * part_xspd; }
					else
					{
					if part_y >= global.size - 10
						{ part_n = 0; }
					}
				}
			if part_n = 2
				{
				if part_s > 0
					{ part_s -= 0.25; }
					else
					{ part_n = 0; }
				}
				
			if part_n > 0
				{
				draw_sprite_ext_t(s_super, global.hero + 1, part_x + part_xspd * sign(part_x - (1280) * super_now1 / super_need) * 2, part_y - part_yspd * 2, 0.3 * part_s, 0.3 * part_s, 0, global.color_hero[global.hero], 1, global.color_hero[global.hero], c_black);
				draw_sprite_ext_t(s_super, global.hero + 1, part_x + part_xspd * sign(part_x - (1280) * super_now1 / super_need), part_y - part_yspd, 0.3 * part_s, 0.3 * part_s, 0, global.color_hero[global.hero], 1, global.color_hero[global.hero], c_black);
				draw_sprite_ext_t(s_super, global.hero + 1, part_x, part_y, 0.3 * part_s, 0.3 * part_s, 0, global.color_hero[global.hero], 1, global.color_hero[global.hero], c_black);
				}
			
			if part_n = 0
				{
				if super_now <= super_need
					{
					if super_now1 < super_now
						{ super_now1 += 0.025 * super_need; }
					if super_now = 0
						{
						if super_now1 > 0
							{ super_now1 -= 0.025 * super_need; }
							else
							{ super_now1 = 0; }
						}
					}
				}
			//draw_text_transformed_t(mouse_x, mouse_y, string(part_n), 0.5, 0.5, 0, global.color_hero[global.hero], c_black);
		#endregion
		
		var d_size;
		d_size = 0.05; //0.1 * (super_stage - 1) / 13;
		
		if super_now = super_need
			{
			if super_now1 = super_need
				{
				if super_zhopa > 0
					{ super_zhopa -= 40; super_angle = 0; }
					else
					{
					if super_time < 40
						{
						super_time += 1;
						if abs(super_angle) > 1.5
							{ super_angle += 2 * super_dir; }
							else
							{ super_angle = 0; }
						}
						else
						{
						if (super_angle < 5 && super_dir = 1) or (super_angle > -5 && super_dir = -1)
							{ super_angle += 2 * super_dir; }
							else
							{
							super_dir = -super_dir;
							super_angle += 2 * super_dir;
							super_val += 1;
							if super_val = 5
								{ super_time = 0; super_val = 0; }
							}
						}
					}
				}
			}
			else
			{
			super_val = 0;
			super_angle = 0;
			if super_zhopa < 300
				{ super_zhopa += 30; }
			}
		
		if super_now = super_need
			{
			if super_alp1 = 1
				{
				if super_alp > 0.7
					{ super_alp -= 0.05; }
					else
					{ super_alp1 = 0 }
				}
				else
				{
				if super_alp < 1
					{ super_alp += 0.05; }
					else
					{ super_alp1 = 1; }
				}
			}
			else
			{ super_alp1 = 1; super_alp = 1; }
		draw_set_alpha(0.7);
		draw_rectangle_color(0, global.size, 1280, global.size - 13, c_black, c_black, c_black, c_black, 0);
		
		if super_now = super_need
			{
			draw_set_alpha(0.5);
			draw_rectangle_color(0, global.size, (1280) * super_now1 / super_need, global.size - 11 - super_alp * 4, global.color_hero[global.hero], global.color_hero[global.hero], global.color_hero[global.hero], global.color_hero[global.hero], 0);
			
			draw_set_alpha(0.3);
			draw_rectangle_color(0, global.size, (1280) * super_now1 / super_need, global.size - 11 - super_alp * 2, global.color_hero[global.hero], global.color_hero[global.hero], global.color_hero[global.hero], global.color_hero[global.hero], 0);
			}
		draw_set_alpha(1);
		
		draw_rectangle_color(0, global.size, (1280) * super_now1 / super_need, global.size - 11, global.color_hero[global.hero], global.color_hero[global.hero], global.color_hero[global.hero], global.color_hero[global.hero], 0);
		draw_set_alpha(0.2);
		draw_rectangle_color(0, global.size, (1280) * super_now1 / super_need, global.size - 3, c_black, c_black, c_black, c_black, 0);
		draw_set_alpha(1);
		
		draw_set_alpha(1 - super_alp);
		draw_rectangle_color(0, global.size, (1280) * super_now1 / super_need, global.size - 11, c_white, c_white, c_white, c_white, 0);
		draw_set_alpha(1);
		
		
		draw_set_font(global.game_font);
		draw_text_transformed_t(640 - string_width(super_text) * 0.2 / 2 + 20, global.size - 50 + super_x + super_zhopa, super_text, 0.2, 0.2, super_angle, global.color_hero[global.hero], c_black);
		
		//draw_sprite_ext(s_super, 1, 640 + sprite_get_width(s_super) * (list_size1 * 1 + d_size) * super_scale / 2 + 40, global.size - 50 + super_x + super_zhopa, (list_size1 * 1 + d_size) * super_scale, (list_size1 * 1 + d_size) * super_scale, 0, c_white, 1);
		draw_sprite_ext_t(s_super, 0, 640 + sprite_get_width(s_super) / 2 - 20, global.size - 50 + super_x + super_zhopa, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_hero[global.hero], 1, global.color_hero[global.hero], c_black);
		draw_sprite_ext(s_super, global.hero + 1, 640 + sprite_get_width(s_super) / 2 - 20, global.size - 50 + super_x + super_zhopa, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, c_white, 1);
		//draw_sprite_ext(s_super_black, super_stage, 86 * (list_size1 * 1.3 + d_size)/*- 90 - 500 - super_x*/, global.size - 40 - 1 + super_x, list_size1 * 1.3 + d_size, list_size1 * 1.3 + d_size, 0, c_white, 1);
		//draw_sprite_ext(asset_get_index("s_super_" + global.hero_code_name[global.enemy_hero]), e_skill[global.rounds], 1280 - (640 - 90 - 500) + super_x, global.size - 80, -list_size1 * 1, list_size1 * 1, 0, c_white, 1);
	#endregion
	#region Способность Шерифа
		if global.hero = 1
			{
			if global.ability_dop_anim = 1
				{
				abil_x += 40;
				abil_y = cos(abil_x / 100) * 100;
				draw_sprite_ext(s_abil_thing_sherif, 0, abil_x, global.size / 2 - 50 + abil_y, abil_s, abil_s, 0, c_white, 1);
			
				if abil_x >= 1100 
					{ global.ability_dop_anim = 2; }
				}
			if global.ability_dop_anim = 2
				{
				if abil_s < 1
					{ abil_s += 0.1; }
					else
					{
					if abil_a >= 180
						{ global.ability_dop_anim = 3; }
					}
				if abil_s = 1
					{ abil_a += 20 * abil_s; }
				draw_sprite_ext(s_abil_thing_sherif, 0, abil_x, global.size / 2 - 50 + abil_y, abil_s, abil_s, abil_a, c_white, 1);
				}
			if global.ability_dop_anim = 3
				{
				if abil_s > 0
					{ abil_s -= 0.15; }
					else
					{
					abil_x = 160;
					abil_y = global.size / 2;
					abil_s = 0.5;
					abil_a = 0;
					global.ability_dop_anim = 0;
					}
				abil_a += 10;
				draw_sprite_ext(s_abil_thing_sherif, 0, abil_x, global.size / 2 - 50 + abil_y, abil_s, abil_s, abil_a, c_white, 1);
				}
			}
	#endregion
#endregion
if 0
	{
	#region Выбор Первого игрока
		if global.game_stage = 1 //keyboard_check_pressed(ord("H")) 
			{
			if enemy_smile = -1
				{
				enemy_smile_chance = choose(0,1);
				if enemy_smile_chance = 1
					{
					//show_message("POPKA");
					enemy_smile = choose(1,3,3,3,3,3);
					enemy_smile_time = round(room_speed * random_range(1, 3));
					}
				}
		
			global.game_stage = 2;
			if hand_choose > 0
				{ hand_choose = 0; }
				else
				{ hand_choose = 1; }
			hand_x = 640;
			hand_y = global.size + 100;
			hand_a = 0;
			hand_s = 0.7;
			hand_t = 0;
	
			first_player = -1;
	
			hand_text_n = 0;
	
			hand_text_x = 1280 + 300;
			hand_dir    = 1;
	
			hand_alpha  = 1;
			hand_text_y = 0;
			}
	
		if hand_choose > 0
			{
			draw_set_alpha(0.45);
			draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
			draw_set_alpha(1);
		
			draw_set_font(global.game_font);
			//draw_set_font(f_wanted_bold);
			draw_text_transformed_t(640, 200 - hand_y + global.size / 2 - hand_text_y - 50, hand_text[2], 0.35, 0.35, 0, c_white, c_black);
			
			draw_sprite_ext(s_hand, 0, hand_x, hand_y, hand_s, hand_s, hand_a, c_white, 1);
			}
		if hand_choose = 1
			{
			if hand_y > global.size / 2
				{ hand_y -= 33; }
				else
				{ hand_y = global.size / 2; hand_choose = 2; }
			}
		if hand_choose = 2
			{
			if hand_t < 15//30
				{ hand_t += 1; }
				else
				{ hand_t = 1; hand_choose = 3; }
			}
		if hand_choose = 3
			{
			hand_a -= 10 / hand_t;
			if hand_t < 20
				{ hand_t += 1; }
				else
				{ hand_t = 0; hand_choose = 4; }
			}
		if hand_choose = 4
			{
			hand_a += 50;
			if hand_t < 20
				{ hand_t += 1; }
				else
				{
				hand_t = 0;
				hand_choose = 5;
			
				while(hand_a > 360)
					{ hand_a -= 360; }
			
				first_player = irandom(1);
			
				if first_player = 1
					{
					hand_text_x = 1280 + 300;
					hand_dir    = 1;
					}
					else
					{
					hand_text_x = -300;
					hand_dir    = -1;
					}
				}
			}
		if hand_choose = 5
			{
			if first_player = 1
				{
				if abs(hand_a - 90) < 30
					{ hand_a += sign(90 - hand_a) * 30; }
					else
					{ hand_a = 90; hand_choose = 6; }
				}
				else
				{
				if hand_a > 90
					{
					if hand_a < 270
						{ hand_a += 30; }
						else
						{ hand_a = 270; hand_choose = 6; }
					}
					else
					{
					if hand_a > -90
						{ hand_a -= 30; }
						else
						{ hand_a = -90; hand_choose = 6; }
					}
				}
			}
		if hand_choose = 6
			{
			if hand_s < 1
				{ hand_s += 0.05; }
				else
				{ hand_choose = 7; }
			}
		if hand_choose = 7
			{
			if hand_s > 0.9
				{ hand_s -= 0.025; }
				else
				{ hand_t = 0; hand_choose = 8; }
			}
	
		if hand_choose = 8
			{
			if hand_t < 20
				{ hand_t += 1; }
				else
				{ hand_t = 0; hand_choose = 9; }
			}
		if hand_choose = 9
			{
			if hand_alpha > 0
				{ hand_alpha -= 0.05; }
			hand_x += 70 * hand_dir;
			}
		
		if hand_choose > 6
			{
			//hand_alpha = 1 / abs(hand_x - 640) * 100;
			if first_player = 0
				{ draw_sprite_ext((global.enemy_object).sprite_index, (global.enemy_object).image_index, (global.enemy_object).x + 28, (global.enemy_object).y - 15 + o_control.back_train_y1, (global.enemy_object).sc * (global.enemy_object).scale, (global.enemy_object).scale, 0, c_white, hand_alpha); }
				else
				{ draw_sprite_ext((global.player_object).sprite_index, (global.player_object).image_index, (global.player_object).x - 28, (global.player_object).y - 15 + o_control.back_train_y2, (global.player_object).sc * (global.player_object).scale, (global.player_object).scale, 0, c_white, hand_alpha); }
			}
		if hand_choose > 5 && hand_choose < 10
			{
			if hand_text_y < 400
				{ hand_text_y += 40; }
			draw_set_font(global.game_font);//draw_set_font(f_wanted_bold);
			if ((hand_text_x > 640 && hand_dir = 1) or (hand_text_x < 640 && hand_dir = -1)) or hand_choose = 9
				{ hand_text_x -= 70 * hand_dir; }
				else
				{ hand_text_x -= 0.5 * hand_dir; hand_x += 0.5 * hand_dir; }
			if hand_text_x < -300 or hand_text_x > 1580
				{ hand_choose = 10; }
			if first_player = 1
				{ draw_text_transformed_t(hand_text_x, 200, hand_text[0], 0.3, 0.3, 0, c_white, c_black); }
				else
				{ draw_text_transformed_t(hand_text_x, 200, string_upper(global.enemy_name) + " " + hand_text[1], 0.3, 0.3, 0, c_white, c_black); }
			}
	
		if hand_choose = 10
			{ hand_alpha = 0; /*hand_choose = 0;*/ theme_choose = 1; theme_b_mv[0] = 1; }
	#endregion
	#region Выбор Темы
		#region Выбор Темы 1
		if theme_choose = 1
			{
			if global.game_stage = 2
				{
				if enemy_smile = -1
					{
					enemy_smile_chance = choose(0,1,1);
					if enemy_smile_chance = 1
						{
						enemy_smile = 2;
						enemy_smile_time = room_speed * random_range(1, 3);
						}
					}
				global.game_stage = 3;
				}
			#region Нажатие на V
			if 0//keyboard_check_pressed(ord("V"))
				{
				theme_c      = -1;
				theme_c_true = 0;
				for(i=0; i<=2; i++)
					{
					theme_text_y  = -600;
					theme_b_im[i] = irandom(2);
					theme_b_sx[i] = 0;
			
					theme_b_x[i]  = 640 - 300 + 300 * i;
					theme_b_y[i]  = 300 + global.more_size / 2;
			
					theme_b_c[i]   = 0;
					theme_b_cn[i]  = 60;
					theme_b_dir[i] = 1;
			
					theme_n[i]   = 0;
			
					theme_go[i]  = 0;
					theme_sc[i]  = 0;
					theme_end[i] = 0;
			
					theme_l[i]  = 0;
					theme_ps[i] = 0;
			
					if theme_b_im[i] != 0
						{ theme_b_th[i] = global.theme_name[i]; }
						else
						{ theme_b_th[i] = "--"; }
					}
				theme_b_mv[0] = !theme_b_mv[0];
				theme_b_mv[1] = 0;
				theme_b_mv[2] = 0;
				}
			#endregion	
			for(i=0;i<=2;i++)
				{
				if theme_b_mv[i] = 1
					{
					if theme_c = i
						{
						if theme_lo = 0
							{
							if theme_yy[i] > - 60
								{ theme_yy[i] -= 15; }
								else
								{ theme_lo = 1; }
							}
							else
							{
							if theme_yy[i] < 0
								{ theme_yy[i] += 15; }
								else
								{
								if i = 0
									{
									if theme_xx[0] < 300
										{ theme_xx[0] += 50; }
									if theme_xx[1] < 2000
										{ theme_xx[1] += 50; }
									if theme_xx[2] < 2000
										{ theme_xx[2] += 50; }
										else
										{
										if theme_goto_y > - 400 - global.size / 1.5
											{ theme_goto_y -= 40; }
											else
											{
											if theme_real_open[i] = 1
												{ theme_real_open[i] = 2; }
											theme_choose = 2;
											}
										}
									}
								if i = 1
									{
									if theme_xx[0] > -2000
										{ theme_xx[0] -= 50; }
									if theme_xx[2] < 2000
										{ theme_xx[2] += 50; }
										else
										{
										if theme_goto_y > - 400 - global.size / 1.5
											{ theme_goto_y -= 40; }
											else
											{
											if theme_real_open[i] = 1
												{ theme_real_open[i] = 2; }
											theme_choose = 2;
											}
										}
									}
								if i = 2
									{
									if theme_xx[0] > -2000
										{ theme_xx[0] -= 50; }
										else
										{
										if theme_goto_y > - 400 - global.size / 1.5
											{ theme_goto_y -= 40; }
											else
											{
											if theme_real_open[i] = 1
												{ theme_real_open[i] = 2; }
											theme_choose = 2;
											}
										}
									if theme_xx[1] > -2000
										{ theme_xx[1] -= 50; }
									if theme_xx[2] > - 300
										{ theme_xx[2] -= 50; }
									}
								}
							}
						if theme_c_true = 0
							{
							if (theme_b_sx[i] < 1 && theme_b_dir[i] = 1) or (theme_b_sx[i] > 0 && theme_b_dir[i] = -1)
								{ theme_b_sx[i] += 0.25 * theme_b_dir[i]; }
								else
								{
								if theme_b_dir[i] = 1
									{ theme_c_true = 1; }
									else
									{ theme_b_im[i] = theme_real_theme[i]; theme_b_dir[i] = 1; }
								}
							}
						}
			
					if hand_choose = 0
						{
						if i = 0
							{
							draw_set_alpha(0.65);
							draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
							draw_set_alpha(1);
					
							theme_points_time += 1;
							if theme_points_time = 20
								{
								if theme_points != "..."
									{ theme_points += "."; }
									else
									{ theme_points = ""; }
								theme_points_time = 0;
								}
					
							draw_set_font(global.game_font); //draw_set_font(f_wanted_bold);
							if first_player = 1//(first_player = 1 && global.rounds = 1) or (first_player = 2 && global.rounds = 2)
								{ draw_text_transformed_t(640, theme_text_y + theme_goto_y, theme_text[0], 0.3, 0.3, 0, c_white, c_black); }
								else
								{ draw_text_transformed_t(640, theme_text_y + theme_goto_y - 25, string_upper(global.enemy_name) + "\n" + theme_text[1] + theme_points, 0.3, 0.3, 0, c_white, c_black); }
							}
						}
						else
						{ hand_choose = 0; }
			
					if (theme_b_sx[i] < 1 && theme_b_dir[i] = 1) or (theme_b_sx[i] > 0 && theme_b_dir[i] = -1)
						{
						if i = 0 && theme_b_mv[1] = 0 && abs(theme_b_sx[0]) >= 0.9
							{ theme_b_mv[1] = 1; }
						if i = 0 && theme_b_mv[2] = 0 && abs(theme_b_sx[1]) >= 0.9
							{ theme_b_mv[2] = 1; }
				
						if theme_b_dir[i] = 1 or (theme_b_dir[i] = -1 && theme_end[i] != 1)
							{ theme_b_sx[i] += 0.25 * theme_b_dir[i]; }
						}
						else
						{
						if theme_b_dir[i] = 1
							{ theme_b_dir[i] = -theme_b_dir[i]; }
							else
							{
							if theme_go[i] != 2
								{ theme_b_im[i] = irandom(2); }
								else
								{ 
								if theme_c != i
									{ theme_b_im[i] = 0; }
								theme_end[i] = 1;
								}
						
								if theme_b_im[i] != 0
									{ theme_b_th[i] = global.theme_name[i]; }
								theme_b_dir[i] = -theme_b_dir[i];
								theme_ss[i] = -theme_ss[i];
							}
						}
					if theme_end[i] = 1
						{ theme_ss[i] = 1; }
					var list_scale2;
					list_scale2 = 0.45;
			
					if theme_text_y < global.size / 2 - 150 && theme_c != i
						{ theme_text_y += 10; }
					if theme_b_y[i] > -45 && theme_go[i] = 0
						{ theme_b_y[i] -= 25; }
						else
						{
						theme_go[i] = 1;
						if theme_b_y[i] < 0
							{ theme_b_y[i] += 10; }
							else
							{
							theme_go[i] = 2;
							if theme_end[i] = 1 && (first_player = 1 or theme_c != -1)//(theme_b_dir[i] = -1 && theme_end[i] = 1)
								{
								if theme_sc[i] < 1
									{ theme_sc[i] += 0.05; }
								draw_sprite_ext(s_themes_ob, 0, theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + theme_b_y[i], theme_b_sx[i] * list_scale2 * theme_sc[i], list_scale2 * theme_sc[i], 0, c_white, 1);
								}
							}
						}
				
					if theme_go[i] = 2
						{
						theme_b_c[i] += 1;
						if theme_b_c[i] >= theme_b_cn[i]
							{ theme_l[i] = 1;  theme_b_c[i] = 0; }
				
						if theme_l[i] = 1
							{
							if theme_n[i] < 6
								{ theme_n[i] += 0.5; }
								else
								{ theme_n[i] = 0; theme_l[i] = 0; theme_b_cn[i] = irandom_range(room_speed * 3, room_speed * 6); }
							}
						}
					if (theme_b_dir[i] = 1 or theme_c_true = 1) && theme_c = i
						{ theme_b_im[i] = theme_real_theme[i]; }
					draw_sprite_ext(s_themes_button, 4/*theme_b_im[i]*/, theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + theme_b_y[i], theme_b_sx[i] * list_scale2 * theme_ss[i], list_scale2, 0, global.color_hero[theme_b_im[i]]/*c_white*/, 1);
					if theme_go[i] = 2 && theme_l[i] = 1 && first_player = 1
						{ draw_sprite_ext(s_themes_button1, theme_n[i], theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] /* - 50*/ + theme_b_y[i], theme_b_sx[i] * list_scale2 * theme_ss[i], list_scale2, 0, c_white, 1); }
					draw_sprite_ext(s_themes_ss, theme_b_im[i], theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + theme_b_y[i], theme_b_sx[i] * list_scale2, list_scale2, 0, c_white, 1);
			
					if theme_end[i] = 1 && theme_c = -1
						{
						if mouse_check_button_pressed(mb_left)
							{
							if first_player = 1 // && global.rounds = 1//first_player = 1
								{
								if point_in_rectangle(mouse_x, mouse_y, theme_b_x[i] - sprite_get_width(s_themes_button) / 2 * list_scale2, global.size / 2 - sprite_get_height(s_themes_button) / 2 * list_scale2, theme_b_x[i] + sprite_get_width(s_themes_button) / 2 * list_scale2, global.size / 2 + sprite_get_height(s_themes_button) / 2 * list_scale2)
									{
									audio_play_sound(sd_text, 2, 0);
									theme_real_open[i] = 1;
							
									theme_c = i;
									theme_b_dir[i] = -1;
									theme_round[global.rounds] = theme_real_theme[i];
									}
								}
							}
						}
					if theme_end[i] = 1 && theme_sc[i] > 0.7 && theme_c = i
						{
						if theme_ps[i] < 1
							{ theme_ps[i] += 0.1; }
						draw_sprite_ext(s_themes_pl, 2, theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + 208 * list_scale2, list_scale2 * theme_ps[i], list_scale2, 0, c_white, 1);
						draw_sprite_ext(s_themes_pl, 0, theme_b_x[i] + theme_xx[i] + 208  * list_scale2 * (1 - theme_ps[i]), global.size / 2 + theme_goto_y + theme_yy[i] + 208 * list_scale2, list_scale2, list_scale2, 0, c_white, 1);
						draw_sprite_ext(s_themes_pl, 1, theme_b_x[i] + theme_xx[i] - 208  * list_scale2 * (1 - theme_ps[i]), global.size / 2 + theme_goto_y + theme_yy[i] + 208 * list_scale2, list_scale2, list_scale2, 0, c_white, 1);
				
						draw_set_font(f_question_regular1);//draw_set_font(global.game_font);//draw_set_font(f_question_regular1);
						draw_set_color(c_black);
						draw_set_alpha(0.8);
						if theme_b_th[theme_real_theme[i]] != "OTHER"
							{ draw_text_transformed(theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + 204 * list_scale2, theme_b_th[theme_real_theme[i]], theme_ps[i] * 1, 1, 0); }
							else
							{ draw_text_transformed(theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + 204 * list_scale2, theme_b_th[theme_real_theme[i]] + " " + string(theme_real_theme[i]), theme_ps[i] * 1, 1, 0); }
						draw_set_alpha(1);
						}
					}
				}
			if theme_end[2] = 1 && theme_c = -1
				{
				if first_player = 0
					{
					if enemy_timer = -1
						{ enemy_timer = room_speed; }
						else
						{
						enemy_timer -= 1;
						if enemy_timer <=0
							{
							var iii;
							iii = 1//irandom(2);
							theme_real_open[iii] = 1;
							theme_c = iii;
							theme_b_dir[iii] = -1;
							theme_round[global.rounds] = theme_real_theme[iii];
							timer_t = 30 * room_speed;
							}
						}
					}
				if timer_t > 0
					{ timer_t -= 2; }
					else
					{
					var iii;
					iii = irandom(2);
					theme_real_open[iii] = 1;
					theme_c = iii;
					theme_b_dir[iii] = -1;
					theme_round[global.rounds] = theme_real_theme[iii];
					timer_t = 30 * room_speed;
					}
				if timer_t <= 15 * room_speed
					{
					draw_set_color(c_white);
					draw_set_alpha(0.4 + 0.6 * timer_t / (15 * room_speed));
					draw_rectangle(640 - 320 * timer_t / (15 * room_speed), global.size / 2 + theme_goto_y + theme_yy[2] + 208 * list_scale2 + 45, 640 + 320 * timer_t / (15 * room_speed), global.size / 2 + theme_goto_y + theme_yy[2] + 208 * list_scale2 + 55, 0);
					draw_set_alpha(1);
					}
				}
			}
		//draw_text(mouse_x, mouse_y, string(theme_c));
		#endregion
		#region Выбор Темы 2
		if theme_choose = 7
			{
			for(i=0;i<=2;i++)
				{
				if theme_b_mv[i] = 1
					{
					if theme_c = i
						{
						if theme_lo = 0
							{
							if theme_yy[i] > - 60
								{ theme_yy[i] -= 15; }
								else
								{ theme_lo = 1; }
							}
							else
							{
							if theme_yy[i] < 0
								{ theme_yy[i] += 15; }
								else
								{
								if i = 0
									{
									if theme_xx[0] < 300
										{ theme_xx[0] += 50; }
									if theme_xx[1] < 2000
										{ theme_xx[1] += 50; }
									if theme_xx[2] < 2000
										{ theme_xx[2] += 50; }
										else
										{
										if theme_goto_y > - 400 - global.size / 1.5
											{ theme_goto_y -= 40; }
											else
											{
											if theme_real_open[i] = 1
												{ theme_real_open[i] = 2; }
											theme_choose = 2;
											}
										}
									}
								if i = 1
									{
									if theme_xx[0] > -2000
										{ theme_xx[0] -= 50; }
									if theme_xx[2] < 2000
										{ theme_xx[2] += 50; }
										else
										{
										if theme_goto_y > - 400 - global.size / 1.5
											{ theme_goto_y -= 40; }
											else
											{
											if theme_real_open[i] = 1
												{ theme_real_open[i] = 2; }
											theme_choose = 2;
											}
										}
									}
								if i = 2
									{
									if theme_xx[0] > -2000
										{ theme_xx[0] -= 50; }
										else
										{
										if theme_goto_y > - 400 - global.size / 1.5
											{ theme_goto_y -= 40; }
											else
											{
											if theme_real_open[i] = 1
												{ theme_real_open[i] = 2; }
											theme_choose = 2;
											}
										}
									if theme_xx[1] > -2000
										{ theme_xx[1] -= 50; }
									if theme_xx[2] > - 300
										{ theme_xx[2] -= 50; }
									}
								}
							}
						if theme_c_true = 0
							{
							if (theme_b_sx[i] < 1 && theme_b_dir[i] = 1) or (theme_b_sx[i] > 0 && theme_b_dir[i] = -1)
								{ theme_b_sx[i] += 0.25 * theme_b_dir[i]; }
								else
								{
								if theme_b_dir[i] = 1
									{ theme_c_true = 1; }
									else
									{ theme_b_im[i] = theme_real_theme[i]; theme_b_dir[i] = 1; }
								}
							}
						}
			
					if hand_choose = 0
						{
						if i = 0
							{
							draw_set_alpha(0.65);
							draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
							draw_set_alpha(1);
					
							theme_points_time += 1;
							if theme_points_time = 20
								{
								if theme_points != "..."
									{ theme_points += "."; }
									else
									{ theme_points = ""; }
								theme_points_time = 0;
								}
					
							draw_set_font(global.game_font);
							if first_player != 1
								{ draw_text_transformed_t(640, theme_text_y + theme_goto_y, theme_text[0], 0.3, 0.3, 0, c_white, c_black); }
								else
								{ draw_text_transformed_t(640, theme_text_y + theme_goto_y - 25, string_upper(global.enemy_name) + "\n" + theme_text[1] + theme_points, 0.3, 0.3, 0, c_white, c_black); }
							}
						}
						else
						{ hand_choose = 0; }
			
					if (theme_b_sx[i] < 1 && theme_b_dir[i] = 1) or (theme_b_sx[i] > 0 && theme_b_dir[i] = -1)
						{
						if i = 0 && theme_b_mv[1] = 0 && abs(theme_b_sx[0]) >= 0.9
							{ theme_b_mv[1] = 1; }
						if i = 0 && theme_b_mv[2] = 0 && abs(theme_b_sx[1]) >= 0.9
							{ theme_b_mv[2] = 1; }
				
						if theme_b_dir[i] = 1 or (theme_b_dir[i] = -1 && theme_end[i] != 1)
							{ theme_b_sx[i] += 0.25 * theme_b_dir[i]; }
						}
						else
						{
						if theme_b_dir[i] = 1
							{ theme_b_dir[i] = -theme_b_dir[i]; }
							else
							{
							if theme_go[i] != 2
								{ theme_b_im[i] = irandom(2); }
								else
								{ 
								if theme_c != i
									{ theme_b_im[i] = 0; }
								theme_end[i] = 1;
								}
						
								if theme_b_im[i] != 0
									{ theme_b_th[i] = global.theme_name[i]; }
								theme_b_dir[i] = -theme_b_dir[i];
								theme_ss[i] = -theme_ss[i];
							}
						}
					if theme_end[i] = 1
						{ theme_ss[i] = 1; }
					var list_scale2;
					list_scale2 = 0.45;
			
					if theme_text_y < global.size / 2 - 150 && theme_c != i
						{ theme_text_y += 10; }
					if theme_b_y[i] > -45 && theme_go[i] = 0
						{ theme_b_y[i] -= 25; }
						else
						{
						theme_go[i] = 1;
						if theme_b_y[i] < 0
							{ theme_b_y[i] += 10; }
							else
							{
							theme_go[i] = 2;
							if theme_end[i] = 1 && (first_player != 1 or theme_c != -1) && theme_real_open[i] != 2
								{
								if theme_sc[i] < 1
									{ theme_sc[i] += 0.05; }
								draw_sprite_ext(s_themes_ob, 0, theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + theme_b_y[i], theme_b_sx[i] * list_scale2 * theme_sc[i], list_scale2 * theme_sc[i], 0, c_white, 1);
								}
							}
						}
				
					if theme_go[i] = 2
						{
						theme_b_c[i] += 1;
						if theme_b_c[i] >= theme_b_cn[i]
							{ theme_l[i] = 1;  theme_b_c[i] = 0; }
				
						if theme_l[i] = 1
							{
							if theme_n[i] < 6
								{ theme_n[i] += 0.5; }
								else
								{ theme_n[i] = 0; theme_l[i] = 0; theme_b_cn[i] = irandom_range(room_speed * 3, room_speed * 6); }
							}
						}
					if (theme_b_dir[i] = 1 or theme_c_true = 1) && theme_c = i
						{ theme_b_im[i] = theme_real_theme[i]; }
			
					if theme_real_open[i] != 2
						{
						draw_sprite_ext(s_themes_button, theme_b_im[i], theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + theme_b_y[i], theme_b_sx[i] * list_scale2 * theme_ss[i], list_scale2, 0, c_white, 1);
						if theme_go[i] = 2 && theme_l[i] = 1 && first_player != 1
							{ draw_sprite_ext(s_themes_button1, theme_n[i], theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] /* - 50*/ + theme_b_y[i], theme_b_sx[i] * list_scale2 * theme_ss[i], list_scale2, 0, c_white, 1); }
						draw_sprite_ext(s_themes_ss, theme_b_im[i], theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + theme_b_y[i], theme_b_sx[i] * list_scale2, list_scale2, 0, c_white, 1);
						}
						else
						{
						draw_sprite_ext(s_themes_button, theme_real_theme[i], theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + theme_b_y[i], theme_b_sx[i] * list_scale2 * theme_ss[i], list_scale2, 0, c_white, 1);
						draw_sprite_ext(s_themes_ss, theme_real_theme[i], theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + theme_b_y[i], theme_b_sx[i] * list_scale2, list_scale2, 0, c_white, 1);
				
						draw_sprite_ext(s_themes_button, theme_real_theme[i], theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + theme_b_y[i], theme_b_sx[i] * list_scale2 * theme_ss[i], list_scale2, 0, c_black, 0.4);
						}
					if theme_end[i] = 1 && theme_c = -1
						{
						if mouse_check_button_pressed(mb_left)
							{
							if first_player != 1 && theme_real_open[i] != 2
								{
								if point_in_rectangle(mouse_x, mouse_y, theme_b_x[i] - sprite_get_width(s_themes_button) / 2 * list_scale2, global.size / 2 - sprite_get_height(s_themes_button) / 2 * list_scale2, theme_b_x[i] + sprite_get_width(s_themes_button) / 2 * list_scale2, global.size / 2 + sprite_get_height(s_themes_button) / 2 * list_scale2)
									{
									audio_play_sound(sd_text, 2, 0);
									theme_real_open[i] = 1;
									theme_c = i;
									theme_b_dir[i] = -1;
									theme_round[global.rounds] = theme_real_theme[i];
									}
								}
							}
						}
					if theme_end[i] = 1 && theme_sc[i] > 0.7 && theme_c = i
						{
						if theme_ps[i] < 1
							{ theme_ps[i] += 0.1; }
						draw_sprite_ext(s_themes_pl, 2, theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + 208 * list_scale2, list_scale2 * theme_ps[i], list_scale2, 0, c_white, 1);
						draw_sprite_ext(s_themes_pl, 0, theme_b_x[i] + theme_xx[i] + 208  * list_scale2 * (1 - theme_ps[i]), global.size / 2 + theme_goto_y + theme_yy[i] + 208 * list_scale2, list_scale2, list_scale2, 0, c_white, 1);
						draw_sprite_ext(s_themes_pl, 1, theme_b_x[i] + theme_xx[i] - 208  * list_scale2 * (1 - theme_ps[i]), global.size / 2 + theme_goto_y + theme_yy[i] + 208 * list_scale2, list_scale2, list_scale2, 0, c_white, 1);
				
						draw_set_font(f_question_regular1);
						draw_set_color(c_black);
						draw_set_alpha(0.8);
						if theme_b_th[theme_real_theme[i]] != "OTHER"
							{ draw_text_transformed(theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + 204 * list_scale2, theme_b_th[theme_real_theme[i]], theme_ps[i] * 1, 1, 0); }
							else
							{ draw_text_transformed(theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + 204 * list_scale2, theme_b_th[theme_real_theme[i]] + " " + string(theme_real_theme[i]), theme_ps[i] * 1, 1, 0); }
						draw_set_alpha(1);
						}
					}
				}
			if theme_end[2] = 1 && theme_c = -1
				{
				if first_player != 0
					{
					if enemy_timer = -1
						{ enemy_timer = room_speed; }
						else
						{
						enemy_timer -= 1;
						if enemy_timer <= 0
							{
							var iii;
							if theme_real_open[0] != 0
								{ iii = choose(1, 2); }
							if theme_real_open[1] != 0
								{ iii = choose(0, 2); }
							if theme_real_open[2] != 0
								{ iii = choose(0, 1); }
							/////////
							iii = 2;///
							////////
							theme_real_open[iii] = 1;
					
							theme_c = iii;
							theme_b_dir[iii] = -1;
							theme_round[global.rounds] = theme_real_theme[iii];
							timer_t = 30 * room_speed;
							}
						}
					}
				if timer_t > 0
					{ timer_t -= 2; }
					else
					{
					var iii;
					if theme_real_open[0] != 0
						{ iii = choose(1, 2); }
					if theme_real_open[1] != 0
						{ iii = choose(0, 2); }
					if theme_real_open[2] != 0
						{ iii = choose(0, 1); }
					
					theme_real_open[iii] = 1
					
					theme_c = iii;
					theme_b_dir[iii] = -1;
					theme_round[global.rounds] = theme_real_theme[iii];
					timer_t = 30 * room_speed;
					}
				if timer_t <= 15 * room_speed
					{
					draw_set_color(c_white);
					draw_set_alpha(0.4 + 0.6 * timer_t / (15 * room_speed));
					draw_rectangle(640 - 320 * timer_t / (15 * room_speed), global.size / 2 + theme_goto_y + theme_yy[2] + 208 * list_scale2 + 45, 640 + 320 * timer_t / (15 * room_speed), global.size / 2 + theme_goto_y + theme_yy[2] + 208 * list_scale2 + 55, 0);
					draw_set_alpha(1);
					}
				}
			}
		#endregion
		#region Выбор Темы 3
		if theme_choose = 8
			{
			for(i=0;i<=2;i++)
				{
				if theme_b_mv[i] = 1
					{
					if theme_c = i
						{
						if theme_lo = 0
							{
							if theme_yy[i] > - 60
								{ theme_yy[i] -= 15; }
								else
								{ theme_lo = 1; }
							}
							else
							{
							if theme_yy[i] < 0
								{ theme_yy[i] += 15; }
								else
								{
								if i = 0
									{
									if theme_xx[0] < 300
										{ theme_xx[0] += 50; }
									if theme_xx[1] < 2000
										{ theme_xx[1] += 50; }
									if theme_xx[2] < 2000
										{ theme_xx[2] += 50; }
										else
										{
										if theme_goto_y > - 400 - global.size / 1.5
											{ theme_goto_y -= 40; }
											else
											{
											if theme_real_open[i] = 1
												{ theme_real_open[i] = 2; }
											theme_choose = 2;
											}
										}
									}
								if i = 1
									{
									if theme_xx[0] > -2000
										{ theme_xx[0] -= 50; }
									if theme_xx[2] < 2000
										{ theme_xx[2] += 50; }
										else
										{
										if theme_goto_y > - 400 - global.size / 1.5
											{ theme_goto_y -= 40; }
											else
											{
											if theme_real_open[i] = 1
												{ theme_real_open[i] = 2; }
											theme_choose = 2;
											}
										}
									}
								if i = 2
									{
									if theme_xx[0] > -2000
										{ theme_xx[0] -= 50; }
										else
										{
										if theme_goto_y > - 400 - global.size / 1.5
											{ theme_goto_y -= 40; }
											else
											{
											if theme_real_open[i] = 1
												{ theme_real_open[i] = 2; }
											theme_choose = 2;
											}
										}
									if theme_xx[1] > -2000
										{ theme_xx[1] -= 50; }
									if theme_xx[2] > - 300
										{ theme_xx[2] -= 50; }
									}
								}
							}
						if theme_c_true = 0
							{
							if (theme_b_sx[i] < 1 && theme_b_dir[i] = 1) or (theme_b_sx[i] > 0 && theme_b_dir[i] = -1)
								{ theme_b_sx[i] += 0.25 * theme_b_dir[i]; }
								else
								{
								if theme_b_dir[i] = 1
									{ theme_c_true = 1; }
									else
									{ theme_b_im[i] = theme_real_theme[i]; theme_b_dir[i] = 1; }
								}
							}
						}
			
					if hand_choose = 0
						{
						if i = 0
							{
							draw_set_alpha(0.65);
							draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
							draw_set_alpha(1);
					
							draw_set_font(global.game_font);
							}
						}
						else
						{ hand_choose = 0; }
			
					if (theme_b_sx[i] < 1 && theme_b_dir[i] = 1) or (theme_b_sx[i] > 0 && theme_b_dir[i] = -1)
						{
						if i = 0 && theme_b_mv[1] = 0 && abs(theme_b_sx[0]) >= 0.9
							{ theme_b_mv[1] = 1; }
						if i = 0 && theme_b_mv[2] = 0 && abs(theme_b_sx[1]) >= 0.9
							{ theme_b_mv[2] = 1; }
				
						if theme_b_dir[i] = 1 or (theme_b_dir[i] = -1 && theme_end[i] != 1)
							{ theme_b_sx[i] += 0.25 * theme_b_dir[i]; }
						}
						else
						{
						if theme_b_dir[i] = 1
							{ theme_b_dir[i] = -theme_b_dir[i]; }
							else
							{
							if theme_go[i] != 2
								{ theme_b_im[i] = irandom(2); }
								else
								{ 
								if theme_c != i
									{ theme_b_im[i] = 0; }
								theme_end[i] = 1;
								}
						
								if theme_b_im[i] != 0
									{ theme_b_th[i] = global.theme_name[i]; }
								theme_b_dir[i] = -theme_b_dir[i];
								theme_ss[i] = -theme_ss[i];
							}
						}
					if theme_end[i] = 1
						{ theme_ss[i] = 1; }
					var list_scale2;
					list_scale2 = 0.45;
			
					if theme_text_y < global.size / 2 - 150 && theme_c != i
						{ theme_text_y += 10; }
					if theme_b_y[i] > -45 && theme_go[i] = 0
						{ theme_b_y[i] -= 25; }
						else
						{
						theme_go[i] = 1;
						if theme_b_y[i] < 0
							{ theme_b_y[i] += 10; }
							else
							{
							theme_go[i] = 2;
							if theme_end[i] = 1 && (first_player != 1 or theme_c != -1) && theme_real_open[i] != 2//(theme_b_dir[i] = -1 && theme_end[i] = 1)
								{
								if theme_sc[i] < 1
									{ theme_sc[i] += 0.05; }
								draw_sprite_ext(s_themes_ob, 0, theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + theme_b_y[i], theme_b_sx[i] * list_scale2 * theme_sc[i], list_scale2 * theme_sc[i], 0, c_white, 1);
								}
							}
						}
				
					if theme_go[i] = 2
						{
						theme_b_c[i] += 1;
						if theme_b_c[i] >= theme_b_cn[i]
							{ theme_l[i] = 1;  theme_b_c[i] = 0; }
				
						if theme_l[i] = 1
							{
							if theme_n[i] < 6
								{ theme_n[i] += 0.5; }
								else
								{ theme_n[i] = 0; theme_l[i] = 0; theme_b_cn[i] = irandom_range(room_speed * 3, room_speed * 6); }
							}
						}
					if (theme_b_dir[i] = 1 or theme_c_true = 1) && theme_c = i
						{ theme_b_im[i] = theme_real_theme[i]; }
			
					if theme_real_open[i] != 2
						{
						draw_sprite_ext(s_themes_button, theme_b_im[i], theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + theme_b_y[i], theme_b_sx[i] * list_scale2 * theme_ss[i], list_scale2, 0, c_white, 1);
						if theme_go[i] = 2 && theme_l[i] = 1 && first_player != 1
							{ draw_sprite_ext(s_themes_button1, theme_n[i], theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] /* - 50*/ + theme_b_y[i], theme_b_sx[i] * list_scale2 * theme_ss[i], list_scale2, 0, c_white, 1); }
						draw_sprite_ext(s_themes_ss, theme_b_im[i], theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + theme_b_y[i], theme_b_sx[i] * list_scale2, list_scale2, 0, c_white, 1);
						}
						else
						{
						draw_sprite_ext(s_themes_button, theme_real_theme[i], theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + theme_b_y[i], theme_b_sx[i] * list_scale2 * theme_ss[i], list_scale2, 0, c_white, 1);
						draw_sprite_ext(s_themes_ss, theme_real_theme[i], theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + theme_b_y[i], theme_b_sx[i] * list_scale2, list_scale2, 0, c_white, 1);
				
						draw_sprite_ext(s_themes_button, theme_real_theme[i], theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + theme_b_y[i], theme_b_sx[i] * list_scale2 * theme_ss[i], list_scale2, 0, c_black, 0.4);
						}
					if theme_end[i] = 1 && theme_c = -1
						{
						if theme_real_open[i] != 2//first_player != 1 && theme_real_open[i] != 2// && global.rounds = 1//first_player = 1
							{
							theme_real_open[i] = 1;
							theme_c = i;
							theme_b_dir[i] = -1;
							theme_round[global.rounds] = theme_real_theme[i];
							}
						}
					if theme_end[i] = 1 && theme_sc[i] > 0.7 && theme_c = i
						{
						if theme_ps[i] < 1
							{ theme_ps[i] += 0.1; }
						draw_sprite_ext(s_themes_pl, 2, theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + 208 * list_scale2, list_scale2 * theme_ps[i], list_scale2, 0, c_white, 1);
						draw_sprite_ext(s_themes_pl, 0, theme_b_x[i] + theme_xx[i] + 208  * list_scale2 * (1 - theme_ps[i]), global.size / 2 + theme_goto_y + theme_yy[i] + 208 * list_scale2, list_scale2, list_scale2, 0, c_white, 1);
						draw_sprite_ext(s_themes_pl, 1, theme_b_x[i] + theme_xx[i] - 208  * list_scale2 * (1 - theme_ps[i]), global.size / 2 + theme_goto_y + theme_yy[i] + 208 * list_scale2, list_scale2, list_scale2, 0, c_white, 1);
				
						draw_set_font(f_question_regular1);
						draw_set_color(c_black);
						draw_set_alpha(0.8);
						if theme_b_th[theme_real_theme[i]] != "OTHER"
							{ draw_text_transformed(theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + 204 * list_scale2, theme_b_th[theme_real_theme[i]], theme_ps[i] * 1, 1, 0); }
							else
							{ draw_text_transformed(theme_b_x[i] + theme_xx[i], global.size / 2 + theme_goto_y + theme_yy[i] + 204 * list_scale2, theme_b_th[theme_real_theme[i]] + " " + string(theme_real_theme[i]), theme_ps[i] * 1, 1, 0); }
						draw_set_alpha(1);
						}
					}
				}
			}
		#endregion
	#endregion
	}
#region Выбор Первого Игрока
	if global.game_stage = 1 or global.game_stage = 2
		{
		if coin_stage = 0
			{
			if coin_y = global.size + 100
				{ audio_play_sound(sd_coin,1,0); }
			if coin_y > global.size / 2 - 100
				{
				coin_y -= coin_spd;
				if coin_i < 17
					{ coin_i += 1; }
					else
					{ coin_i = 0; }
				coin_a -= 20;
				}
				else
				{ coin_stage = 1; }
			}
		if coin_stage = 1
			{
			if coin_spd > -35
				{
				coin_spd -= 4;
				coin_y -= coin_spd;
				if coin_i < 17
					{ coin_i += 1; }
					else
					{ coin_i = 0; }
				//coin_a -= 60;
				}
				else
				{ coin_stage = 2; }
			}
		if coin_stage = 2
			{
			if coin_y < global.size - 90
				{
				coin_y -= coin_spd;
				if coin_i < 17
					{ coin_i += 1; }
					else
					{ coin_i = 0; }
				coin_a -= 25;
				}
				else
				{ coin_stage = 3; }
			}
		if coin_stage = 3
			{
			if coin_y < global.size - 50
				{
				coin_y -= coin_spd;
				if coin_i < 9
					{ coin_i += 1; }
					else
					{ coin_i = 0; }
				coin_a -= 20;
				}
				else
				{
				if coin_i <= 4
					{ coin_i = 4; first_player = 1; }
					else
					{
					if coin_i > 4
						{ coin_i = 4; first_player = 0; }
					}
				coin_stage = 4;
				coin_a = 0;
				}
			}
		if coin_stage = 4
			{
			name_x  = coin_x;
			name_y  = coin_y;
			name_s  = 0;
		
			first_x = coin_x;
			first_y = coin_y;
			first_s = 0;
			
			coin_stage = 5;
			}
		if coin_stage = 5
			{
			if name_x > 640 - (80 + 40 * !first_player)
				{
				name_x -= (7 + !first_player * 3) * 2;
				name_y -= 3 * 2;
				
				name_s += 0.065 * 2;
				}
				else
				{
				if first_time < 6
					{ first_time += 1; }
					else
					{
					if first_x < 640 + 120
						{
						first_x += 10 * 2;
						first_y -= 3 * 2;
					
						first_s += 0.065 * 2;
						}
						else
						{ theme_choose = 1; global.game_stage = 2; }
					}
				}
			}
		
		if coin_stage < 4
			{ coin_s += 0.005; }
		
		draw_set_alpha(0.45);
		draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
		draw_set_alpha(1);
		
		draw_sprite_ext_t(s_start_coin, coin_i, coin_x, coin_y + coin_d, coin_s, coin_s, coin_a, global.color_white, 1, global.color_white, c_black);
		
		if first_player != -1
			{
			draw_set_font(global.game_font);
			draw_text_transformed_t( name_x,  name_y, coin_you[first_player], name_s * 0.3, name_s * 0.3, 0, global.color_white, c_black);
			draw_text_transformed_t(first_x, first_y, coin_you[2], first_s * 0.3, first_s * 0.3, 0, global.color_white, c_black);
			}
		}
#endregion
#region Выбор Темы
	#region Первый
		if (theme_choose = 1 && global.game_stage = 2) or theme_choose = 7 or theme_choose = 8
			{
			//if global.game_stage >= 2
				{
				if theme_g = 0
					{
					if theme_s[1] < 1
						{ theme_s[1] += 0.1; }
						else
						{
						if theme_s[2] < 1
							{ theme_s[2] += 0.1; }
							else
							{
							if theme_s[3] < 1
								{ theme_s[3] += 0.1; }
							}
						}
					if theme_s[3] = 1
						{
						if coin_y < global.size + 300
							{
							coin_y  += 30;
							name_y  += 30;
							first_y += 30;
							}
							else
							{
							if theme_choose = 8
								{
								var numnum;
								if theme_a[1] = 1
									{ numnum = 1; }
								if theme_a[2] = 1
									{ numnum = 2; }
								if theme_a[3] = 1
									{ numnum = 3; }
								
								//theme_a[numnum] = 0;
								theme_click = numnum;
								theme_g = 1;
								audio_play_sound(sd_text, 2, 0);
								theme_round[global.rounds] = theme_t[numnum];
								}
								else
								{
								if choose_y > global.size - 80
									{ choose_y -= 30; }
								}
							}
						}
					}
				if theme_choose = 7 or theme_choose = 8
					{
					draw_set_alpha(0.45);
					draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
					draw_set_alpha(1);
					}
				for(i=1;i<=3;i++)
					{
					if theme_g = 0
						{
						if theme_s[i] >= 1 && theme_a[i] = 1
							{
							var butsize;
							butsize = theme_s[i] * 0.65 * sprite_get_width(s_themes_button) / 2;
							if first_player = 1 && point_in_rectangle(mouse_x, mouse_y, theme_x[i] - butsize, theme_y[i] - butsize, theme_x[i] + butsize, theme_y[i] + butsize)
								{
								if mouse_check_button(mb_left)
									{ theme_s[i] = 1.1; }
									else
									{ theme_s[i] = 1; }
								if mouse_check_button_released(mb_left)
									{
									//theme_a[i]  = 0;
									theme_click = i;
									theme_g = 1;
									audio_play_sound(sd_text, 2, 0);
									theme_round[global.rounds] = theme_t[i];
									}
								}
							theme_s[i] = 1;
							theme_a1[i] += 10;
							theme_x1[i] += lengthdir_x(random(0.5),theme_a1[i]);
							theme_y1[i] += lengthdir_y(random(0.5),theme_a1[i]);
							}
						}
					if theme_g = 1
						{
						if i != theme_click
							{
							theme_y[i] += 50;
							choose_y += 50;
							}
							else
							{
							if theme_choose = 1
								{
								if theme_x[i] = 640
									{ 
									if theme_s[i] < 1.25
										{ theme_y1[i] -= 1; theme_y[i] += 1; theme_s[i] += 0.025; }
										else
										{
										if choose_y > 500
											{ theme_a[theme_click] = 0; theme_g = 2; }
										}
									}
								if i = 1
									{
									if theme_x[i] < 640
										{ theme_x[i] += 40; }
										else
										{ theme_x[i] = 640; }
									}
								if i = 3
									{
									if theme_x[i] > 640
										{ theme_x[i] -= 40; }
										else
										{ theme_x[i] = 640; }
									}
								}
							if theme_choose = 7
								{
								if theme_x[i] = 640
									{
									if theme_s[i] < 1.25
										{ theme_y1[i] -= 1; theme_y[i] += 1; theme_s[i] += 0.025; }
										else
										{
										if choose_y > 500
											{ theme_a[theme_click] = 0; theme_g = 2; }
										}
									}
								#region Один и Два
									if theme_a[1] = 1 && theme_a[2] = 1
										{
										if i = 1
											{
											if theme_x[i] < 640
												{ theme_x[i] += 40; }
												else
												{ theme_x[i] = 640; }
											}
										if i = 2
											{
											if theme_x[i] > 640
												{ theme_x[i] -= 40; }
												else
												{ theme_x[i] = 640; }
											}	
										}
								#endregion
								#region Один и Три
									if theme_a[1] = 1 && theme_a[3] = 1
										{
										if i = 1
											{
											if theme_x[i] < 640
												{ theme_x[i] += 40; }
												else
												{ theme_x[i] = 640; }
											}
										if i = 3
											{
											if theme_x[i] > 640
												{ theme_x[i] -= 40; }
												else
												{ theme_x[i] = 640; }
											}	
										}
								#endregion
								#region Два и Три
									if theme_a[2] = 1 && theme_a[3] = 1
										{
										if i = 2
											{
											if theme_x[i] < 640
												{ theme_x[i] += 40; }
												else
												{ theme_x[i] = 640; }
											}
										if i = 3
											{
											if theme_x[i] > 640
												{ theme_x[i] -= 40; }
												else
												{ theme_x[i] = 640; }
											}	
										}
								#endregion
								}
							if theme_choose = 8
								{
								
								if theme_s[theme_click] < 1.25
									{ theme_y1[theme_click] -= 1; theme_y[theme_click] += 1; theme_s[theme_click] += 0.025; }
									else
									{
									if choose_y > 500
										{ theme_a[theme_click] = 0; theme_g = 2; }
									}
								}
							}
						}
					if theme_g = 2
						{
						if theme_s[i] > 0
							{ theme_s[i] -= 0.25; }
							else
							{ theme_choose = 2; theme_g = 3; global.game_stage = 3; }
						}
					draw_sprite_ext_t(s_themes_button, 0, theme_x[i] + theme_x1[i], theme_y[i] + theme_y1[i], theme_s[i] * 0.65, theme_s[i] * 0.65, 0, global.color_hero[theme_t[i]], 1, c_white, c_black);
					draw_sprite_ext_t(s_themes_ss, theme_t[i], theme_x[i] + theme_x1[i], theme_y[i] + theme_y1[i], theme_s[i] * 0.64, theme_s[i] * 0.64, 0, global.color_white, 1, global.color_white, c_black);
					draw_set_font(global.game_font);
					draw_text_transformed_t(theme_x[i], theme_y[i] + 100, theme_nn[i], theme_s[i] * 0.2, theme_s[i] * 0.2, 0, global.color_white, c_black);
					}
				if choose_y <= global.size - 80
					{
					theme_points_time += 1;
					if theme_points_time = 20
						{
						if first_player = 0 && theme_points = ""
							{
							var numnum;
							if theme_choose = 1
								{ numnum = choose(1, 1, 3, irandom_range(1, 3)); }
							if theme_choose = 7
								{
								if theme_a[1] != 1
									{ numnum = choose(3, 3, 3, 2); }
								if theme_a[2] != 1
									{ numnum = choose(1, 1, 1, 3); }
								if theme_a[3] != 1
									{ numnum = choose(1, 1, 1, 2); }
								}
							//if theme_choose = 8
							//	{
							//	if theme_a[1] = 1
							//		{ numnum = 1; }
							//	if theme_a[2] = 1
							//		{ numnum = 2; }
							//	if theme_a[3] = 1
							//		{ numnum = 3; }
							//	}
							//theme_a[numnum] = 0;
							theme_click = numnum;
							theme_g = 1;
							audio_play_sound(sd_text, 2, 0);
							theme_round[global.rounds] = theme_t[numnum];
							}
						if theme_points != "..."
							{ theme_points += "."; }
							else
							{ theme_points = "";}
						theme_points_time = 0;
						}
					}
				draw_text_transformed_t(640, choose_y, theme_text[!first_player] + theme_points, 0.23, 0.23, 0, global.color_white, c_black);
				}
			//if coin_d < 300
			//	{ coin_d += 30; }
			}
	#endregion
#endregion
#region Объявление раунда
	#region Новое
		if theme_choose = 3
			{
			global.game_stage = 4;
			if round_s[1] < 1
				{
				round_a[1] += 15;
				round_s[1] += 1/12;
				}
				else
				{
				round_s[1] += round_spd;
				if round_a[1] < 5
					{ round_a[1] += 0.5; }
					else
					{
					if round_s[2] < 1
						{
						round_a[2] += 15;
						round_s[2] += 1/12;
						}
						else
						{
						round_s[2] += round_spd;
						if round_a[2] < 5
							{ round_a[2] += 0.5; }
							else
							{
							if round_s[3] < 1
								{
								round_a[3] += 15;
								round_s[3] += 1/12;
								}
								else
								{
								round_s[3] += round_spd;
								if round_a[3] < 5
									{ round_a[3] += 0.5; }
									else
									{
									if round_s[1] < 5
										{ 
										round_s[1] += round_spd * 90;
										round_s[2] += round_spd * 90;
										round_s[3] += round_spd * 90;
									
										round_y[1] -= 50;
										round_y[2] += 50;
										round_y[3] += 50;
										}
										else
										{
										round_y[1] -= 50;
										round_y[2] += 50;
										round_y[3] += 50;
										if round_alpha > 0
											{ round_alpha -= 0.05; }
											else
											{
											if global.game_stage = 4
												{
												global.game_stage = 5;
												theme_choose = 4;
												list_go = 1//!list_go;
												list_y = -300;
			
												list_scale = 0;
												plas_scale = 0;
									
												var task_number, now_number;
												if theme_round[global.rounds] = 1 or theme_round[global.rounds] = 3
													{ task_number = "1234"; }
												if theme_round[global.rounds] = 2
													{ task_number = "1331"; }
												for(j=1;j<=3;j++)
													{
													now_number = irandom_range(1, string_length(task_number));
													round_task[global.rounds,j] = real(string_copy(task_number, now_number, 1));
													task_number = string_delete(task_number, now_number, 1);
													}
										
												vvv = 1;
												if theme_round[global.rounds] = 1
													{ script_execute(asset_get_index("math_" + string(round_task[global.rounds,1]))); }
												if theme_round[global.rounds] = 3
													{ script_execute(asset_get_index("move_" + string(round_task[global.rounds,1]))); }
												if theme_round[global.rounds] = 2
													{ script_execute(asset_get_index("precision_" + string(round_task[global.rounds,1]))); }	
												}
											}
										}
									}
								}
							}
						}
					}
				}
			draw_set_alpha(0.45 * round_alpha);
			draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
			draw_set_alpha(1);
			
			draw_set_font(global.game_font);
			draw_text_transformed_t(round_x[1], round_y[1], round_text[1] + " " + string(global.rounds), round_s[1] * 0.25, round_s[1] * 0.25, round_a[1], global.color_white, c_black);
			draw_text_transformed_t(round_x[2], round_y[2], round_text[2], round_s[2] * 0.45, round_s[2] * 0.45, round_a[2], global.color_white, c_black);
			draw_text_transformed_t(round_x[3], round_y[3], round_text[3], round_s[3] * 0.85, round_s[3] * 0.85, round_a[3], global.color_white, c_black);
			}
	#endregion
	if theme_choose = 2
		{
		theme_g = 0;
		theme_click = 0;
		theme_dot = "";
		first_player = !first_player;
		for(i=1;i<=3;i++)
			{
			if theme_a[i] = 1
				{
				theme_x[i]  = 640;
				theme_y[i]  = global.size / 2;
				theme_s[i]  = 0;
				theme_x1[i] = 0;
				theme_y1[i] = 0;
				theme_a1[i] = irandom(360);
				}
				else
				{
				theme_x[i]  = 640;
				theme_y[i]  = 100000;
				theme_s[i]  = 0;
				theme_x1[i] = 0;
				theme_y1[i] = 100000;
				theme_a1[i] = irandom(360);
				}
			}
		if global.rounds = 1
			{
			if theme_a[1] != 1
				{ theme_x[2]  = 640 - 150; theme_x[3]  = 640 + 150; }
			if theme_a[2] != 1
				{ theme_x[1]  = 640 - 150; theme_x[3]  = 640 + 150; }
			if theme_a[3] != 1
				{ theme_x[1]  = 640 - 150; theme_x[2]  = 640 + 150; }
			}
			
		round_x[1] = 300;
		round_y[1] = global.size / 2 - 150;
		round_x[2] = 900;
		round_y[2] = global.size / 2;
		round_x[3] = 400;
		round_y[3] = global.size / 2 + 170;
	
		round_s[1] = 0;
		round_s[2] = 0;
		round_s[3] = 0;
	
		round_a[1] = -180;
		round_a[2] = -180;
		round_a[3] = -180;
	
		round_spd   = 0.0025;
		round_alpha = 1;
		
		coin_y = global.size + 300;
		choose_y = global.size + 300;
		
		theme_choose = 3;
		}
#endregion
#region Объявление победителя
	if theme_choose = 6
		{
		global.critical   = 0;
		global.e_critical = 0;
		vvv = 0;
		if enemy_smile = -1
			{
			enemy_smile_chance = choose(0,1);
			if enemy_smile_chance = 1
				{
				if (hp / maxhp - e_hp / e_maxhp) * 100 < -30
					{ enemy_smile = choose(1,1,1,1,3,3,4); }
				if (hp / maxhp - e_hp / e_maxhp) * 100 >= -30 && (hp / maxhp - e_hp / e_maxhp) * 100 < 20
					{ enemy_smile = choose(0,1,2,2,2,3,4); }
				if (hp / maxhp - e_hp / e_maxhp) * 100 >= 20 && (hp / maxhp - e_hp / e_maxhp) * 100 < 40
					{ enemy_smile = choose(2,2,2,5,5,5,4,0); }
				if (hp / maxhp - e_hp / e_maxhp) * 100 >= 40 && (hp / maxhp - e_hp / e_maxhp) * 100 < 70
					{ enemy_smile = choose(0,0,0,5,5,5); }
				if (hp / maxhp - e_hp / e_maxhp) * 100 >= 70
					{ enemy_smile = choose(0,0,0,5,5); }
				enemy_smile_time = room_speed * random_range(1, 3);
				}
			}
		//global.game_stage = 4;
		draw_set_alpha(0.65 * round_alpha);
		draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
		draw_set_alpha(1);
		
		var hp1, hp2, t, t1, cc, cc2;
		if win_stage < 3
			{
			hp1 = string(hp);
			hp2 = string(e_hp);
			}
			else
			{
			hp1 = string(round(100 * hp / maxhp)) + "%";
			hp2 = string(round(100 * e_hp / e_maxhp)) + "%";
			}
		if roundskul[(global.rounds - 1)] = 1
			{ t = win_text[0]; t1 = ">"; cc = c_green; cc2 = c_red; }
			else
			{ t = string_upper(global.enemy_name) + "\n" + win_text[1]; t1 = "<"; cc = c_red; cc2 = c_green; }
		if win_stage < 4
			{ cc = c_black; cc2 = c_black; }
		
		if win_stage = 0
			{
			if win_y > global.size / 2
				{ win_y -= 20; }
				else
				{ win_stage = 1; }
			}
		if win_stage = 1
			{
			if win_a > - 60
				{ win_a -= 10; }
				else
				{ win_stage = 2; }
			}
		if win_stage = 2
			{
			if win_a < 270
				{ win_a += 25; }
				else
				{ win_stage = 3; }
			}
		if win_stage = 3
			{
			if win_a < 360
				{ win_a += 10; }
				else
				{
				win_a = 360;
				win_stage = 4;
				//
				#region Анимации выиграл / проиграл
					if roundskul[(global.rounds - 1)] = 1
						{
						with(o_hero)
							{
							if !enemy
								{
								stun_seconds = 3;
								skeleton_animation_set("win");
								change = 4;
								}
								else
								{
								stun_seconds = 3;
								image_speed  = 2;
								skeleton_animation_set("lose");
								change = 5;
								}
							}
						}
						else
						{
						with(o_hero)
							{
							if enemy
								{
								stun_seconds = 3;
								skeleton_animation_set("win");
								change = 4;
								}
								else
								{
								stun_seconds = 3;
								image_speed  = 2;
								skeleton_animation_set("lose");
								change = 5;
								}
							}
						}
				#endregion
				//
				}
			}
		if win_stage = 4
			{
			if roundskul[(global.rounds - 1)] = 1
				{
				if win_s1 < 2
					{ win_s1 += 0.01; }
					else
					{ win_stage = 5; }
				}
				else
				{
				if win_s2 < 2
					{ win_s2 += 0.01; }
					else
					{ win_stage = 5; }
				}
			}
		if win_stage = 5
			{
			if roundskul[(global.rounds - 1)] = 1
				{
				if win_s1 > 1.25
					{ win_s1 -= 0.01; }
					else
					{ win_stage = 6; }
				}
				else
				{
				if win_s2 < 1.25
					{ win_s2 -= 0.01; }
					else
					{ win_stage = 6; }
				}
			}
		if win_stage >= 4
			{
			if win_text_y1 > global.size / 2
				{ win_text_y1 -= 40; }
				else
				{
				if win_stage < 7
					{ win_text_y1 = global.size / 2; win_stage = 7; }
				}
			}
		if win_stage = 7
			{
			win_text_y1 -= 0.01;
			
			if win_text_y1 <= global.size / 2 - 0.5
				{  win_stage = 8; }
			}
		if win_stage = 8
			{
			win_text_y1 -= 40;
			
			if win_text_y1 < global.size / 2 - 200
				{ win_stage = 9; }
			}
		if win_stage = 9
			{
			win_text_y1 -= 40;
			//win_y += 0.05;
			
			if win_text_y > global.size / 2
				{ win_text_y -= 40; }
				else
				{ win_text_y = global.size / 2; win_stage = 10; }
			}
		if win_stage = 10
			{
			win_text_y -= 0.01;
			//win_y += 0.05;
			
			if win_text_y < global.size / 2 - 0.6
				{ win_text_y = global.size / 2 - 5; win_stage = 11; }
			}
		if win_stage = 11
			{
			win_text_y -= 40;
			win_y -= 40;
			
			if win_text_y < - 300
				{
				win_x  = 350;
				win_s1  = 1;
				win_s2  = 1;
				win_a  = 0;
				win_stage = 0;
				win_y = global.size - 50;
				win_text_y = global.size + 100;
				
				go_hp = 1;
				//hp   = maxhp;
				//e_hp = e_maxhp;
				with(o_hero)
					{ depth += 2; }
				round_text1_x = 1450;
				
				if whowin = 0
					{
					if global.rounds = 2
						{ theme_choose = 7; }
					if global.rounds = 3
						{ theme_choose = 8; }
					}
					else
					{ theme_choose = 9; }
				
				for(i=0; i<=2; i++)
					{
					theme_ss[i] = 1;
		
					theme_xx[i] = 0;
					theme_yy[i] = 0;
			
					theme_b_mv[i] = 0;
					theme_b_im[i] = irandom(2);
					theme_b_sx[i] = 0;
			
					theme_b_x[i]  = 640 - 300 + 300 * i;
					theme_b_y[i]  = 300 + global.more_size / 2;
			
					theme_b_c[i]   = 0;
					theme_b_cn[i]  = 60;
					theme_b_dir[i] = 1;
		
					theme_n[i]   = 0;
			
					theme_go[i]  = 0;
					theme_sc[i]  = 0;
					theme_end[i] = 0;
			
					theme_l[i]  = 0;
			
					theme_ps[i] = 0;
					}
				theme_goto_y = 0;
				theme_lo     = 0;
				theme_c      = -1;
				theme_c_true = 0;
				theme_text_y = -600;
				
				theme_b_mv[0] = 1;
				
				timer_t = 30 * room_speed;
				}
			}
		
		draw_set_font(global.game_font);
		draw_text_transformed_t(win_x, win_y, hp1, 0.25 * win_s1, 0.25 * win_s1, win_a, c_white, cc);
		draw_text_transformed_t(1280 - win_x, win_y, hp2, 0.25 * win_s2, 0.25 * win_s2, win_a, c_white, cc2);
		
		draw_text_transformed_t(640, win_text_y1, t1, 0.5 * win_s2, 0.5 * win_s2, 0, c_white, c_black);
		draw_text_transformed_t(640, win_text_y, t, 0.25 * win_s2, 0.25 * win_s2, 0, c_white, c_black);
		//draw_text_transformed_t(round_text1_x, theme_text_y, t, 0.35, 0.35, 0, c_white, c_black);
		
		//if round_text1_x > 660
		//	{ round_text1_x -= 30; }
		
		//if round_text1_x <= 660
		//	{
		//	round_text1_x -= 0.1//25;
			
		//	if round_text1_x < 645
		//		{
		//		round_text1_x -= 30;
		//		if round_text1_x < -300
		//			{
		//			hp   = maxhp;
		//			e_hp = e_maxhp;
		//			with(o_hero)
		//				{ depth += 2; }
		//			round_text1_x = 1450;
		//			theme_choose = 3;
		//			}
		//		}
		//	}
		}
	if theme_choose = 5
		{
		with(o_hero)
			{ depth -= 2; }
		theme_choose = 6;
		}
#endregion
#region Финиш дуэли
	if theme_choose = 9
		{
		draw_set_alpha(0.65);
		draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
		draw_set_alpha(1);
		if whowin = 1
			{
			if finplas < 1
				{
				draw_sprite_ext(s_plash_win, 2, 640, -fin_y + 50 + global.size / 2 - 469 * list_size - 80 + list_y, list_size * finplas, list_size, 0, c_white, 1);
				draw_sprite_ext(s_plash_win, 0, 640 + 418  * list_size * (1 - finplas), -fin_y + 50 + global.size / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
				draw_sprite_ext(s_plash_win, 1, 640 - 418  * list_size * (1 - finplas), -fin_y + 50 + global.size / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
				}
				else
				{ win_plas += 0.4; draw_sprite_ext(s_plash_win_f, win_plas, 640, -fin_y + 50 + global.size / 2 - 469 * list_size - 80 + list_y, list_size * finplas, list_size, 0, c_white, 1); }
			
			draw_set_font(global.game_font);//draw_set_font(f_win_regular);
			draw_set_color(c_black);
			draw_set_alpha(0.4);
			draw_text_transformed(640 - 1, -fin_y + 50 + global.size / 2 - 469 * list_size - 100 + 3 + list_y, "VICTORY!", finplas * 0.18, 0.18, 0);
			draw_set_color(c_white);
			draw_set_alpha(1);
			draw_text_transformed(640, -fin_y + 50 + global.size / 2 - 469 * list_size - 100 + list_y, "VICTORY!", finplas * 0.18, 0.18, 0);
			}
		if whowin = 2
			{
			if finplas < 1
				{ finplas += 0.1; }
			
			draw_sprite_ext(s_plash_lose, 2, 640, -fin_y + 50 + global.size / 2 - 469 * list_size - 80 + list_y, list_size * finplas, list_size, 0, c_white, 1);
			draw_sprite_ext(s_plash_lose, 0, 640 + 418  * list_size * (1 - finplas), -fin_y + 50 + global.size / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
			draw_sprite_ext(s_plash_lose, 1, 640 - 418  * list_size * (1 - finplas), -fin_y + 50 + global.size / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
		
			draw_set_font(global.game_font);//draw_set_font(f_win_regular);
			draw_set_color(c_black);
			draw_set_alpha(0.4);
			draw_text_transformed(640 - 1, -fin_y + 50 + global.size / 2 - 469 * list_size - 100 + 3 + list_y, "DEFEAT", finplas * 0.18, 0.18, 0);
			draw_set_color(c_white);
			draw_set_alpha(1);
			draw_text_transformed(640, -fin_y + 50 + global.size / 2 - 469 * list_size - 100 + list_y, "DEFEAT", finplas * 0.18, 0.18, 0);
			}
			
		draw_set_font(global.game_font);
		draw_text_transformed_t(640, global.size / 2 + 200 + fin_y, "TAP TO RESTART", 0.2, 0.2, 0, c_white, c_black);
		
		draw_set_color(c_black);
		draw_set_alpha(0.4);
		draw_text_transformed(640 - 1, 100 - fin_y + 50 + global.size / 2 - 469 * list_size - 100 + 3 + list_y, "ACCURACY: " + string(round(100 * accuracy_true / accuracy_all)) + "%", finplas * 0.18, 0.18, 0);
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_text_transformed(640, 100 - fin_y + 50 + global.size / 2 - 469 * list_size - 100 + list_y, "ACCURACY: " + string(round(100 * accuracy_true / accuracy_all)) + "%", finplas * 0.18, 0.18, 0);
		
		var money, respect;
		money = 25;
		if whowin = 1
			{ respect = "+1"; }
			else
			{ respect = "-1"; }
		if roundskul[1] = 1
			{ money += 25; }
		if roundskul[2] = 1
			{ money += 25; }
		if roundskul[3] = 1 or (roundskul[3] = 0 && money > 25)
			{ money += 25; }
		draw_set_color(c_black);
		draw_set_alpha(0.4);
		draw_text_transformed(640 - 1, 200 - fin_y + 50 + global.size / 2 - 469 * list_size - 100 + 3 + list_y, "MONEY +" + string(money) + "$", finplas * 0.18, 0.18, 0);
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_text_transformed(640, 200 - fin_y + 50 + global.size / 2 - 469 * list_size - 100 + list_y, "MONEY +" + string(money) + "$", finplas * 0.18, 0.18, 0);
		
		draw_set_color(c_black);
		draw_set_alpha(0.4);
		draw_text_transformed(640 - 1, 300 - fin_y + 50 + global.size / 2 - 469 * list_size - 100 + 3 + list_y, "RESPECT " + string(respect), finplas * 0.18, 0.18, 0);
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_text_transformed(640, 300 - fin_y + 50 + global.size / 2 - 469 * list_size - 100 + list_y, "RESPECT " + string(respect), finplas * 0.18, 0.18, 0);
		
		if fin_y > 0
			{ fin_y -= 40; }
			else
			{
			if finplas < 1
				{ finplas += 0.1; }
			if mouse_check_button_pressed(mb_left)
				{ room_goto_t("duel"); }
			}
		if o_control.back_spd > 0
			{ o_control.back_spd -= 0.05; }
		}
#endregion
#region Хелсбар
	var gui_size;
	gui_size = 0.45;
	
	if hp < 0
		{ hp = 0; }
	if e_hp < 0
		{ e_hp = 0; }
		
	if go_hp = 1
		{
		if hp < maxhp
			{ hp += maxhp / 20; }
		if hp > maxhp
			{ hp = maxhp; }
		if e_hp < e_maxhp
			{ e_hp += e_maxhp / 20; }
		if e_hp > e_maxhp
			{ e_hp = e_maxhp; }
		if hp = maxhp && e_hp = e_maxhp
			{ go_hp = 0; }
		}
	if health_hp != hp
		{
		if health_hp > hp
			{
			if health_timer > 0
				{ health_timer -= 1; }
				else
				{
				health_hp -= 10;
				if health_hp <= hp
					{ health_hp = hp; health_timer = 20; }
				}
			}
		if health_hp < hp
			{ health_hp = hp; }
		health_scale = 1.25;
		}
		else
		{ health_scale = 1; }
	
	if health_e_hp != e_hp
		{
		if health_e_hp > e_hp
			{
			if health_e_timer > 0
				{ health_e_timer -= 1; }
				else
				{
				health_e_hp -= 10;
				if health_e_hp <= e_hp
					{ health_e_hp = e_hp; health_e_timer = 20; }
				}
			}
		if health_e_hp < e_hp
			{ health_e_hp = e_hp; }
		health_e_scale = 1.25;
		}
		else
		{ health_e_scale = 1; }
	
	//if health_e_hp != e_hp
	//	{
	//	if abs(health_e_hp - e_hp) < e_maxhp / 40
	//		{ health_e_hp = e_hp; }
	//		else
	//		{
	//		if health_e_hp > e_hp
	//			{ health_e_hp -= e_maxhp / 40; }
	//		if health_e_hp < e_hp
	//			{ health_e_hp += e_maxhp / 40; }
	//		}
		//if health_e_al > 0
		//	{ health_e_al -= 0.15; }
		//	else
		//	{ health_e_al = 1; health_e_hp = e_hp; }
	//	}
	
	var h_y, h_x, h_s, h_y1;
	h_x = 40;
	h_y = 45; //global.size - 12;
	h_s = 10;
	h_y1 = 10;
	
	#region Хелсбар Игрока
		draw_sprite_ext_t(s_healthbar_hp, 0, h_x, h_y + h_y1, -gui_size * 0.95, gui_size * 0.4, 0, global.color_white, 1, c_white, c_black);
		
		var pers, dop;
		pers = (hp / maxhp)// * ((1205 - 35) * gui_size - 25);
		dop  = maxhp / 100;
	
		//////////
			draw_set_color(c_red);
			draw_rectangle(h_x + 20, h_y - h_s - 10 + h_y1, h_x + ((1205 - 35) * gui_size - 25) * health_hp / maxhp * 0.96 + 20, h_y - h_s / 8 - 10 + h_y1, 0);
			
			//draw_set_alpha(0.3);
			//draw_set_color(c_black);
			//draw_rectangle(h_x + 20, h_y - h_s / 3 - 10 + h_y1, h_x + ((1205 - 35) * gui_size - 25) * pers * 0.96 / round(maxhp) * health_hp + 20, h_y - h_s / 8 - 10 + h_y1, 0);
			//draw_set_alpha(1);
		//////////
		draw_set_color(global.color_white);
		draw_rectangle(h_x + 20, h_y - h_s - 10 + h_y1, h_x + ((1205 - 35) * gui_size - 25) * pers * 0.96 + 20, h_y - h_s / 8 - 10 + h_y1, 0);
		
		draw_set_alpha(0.3);
		draw_set_color(c_black);
		draw_rectangle(h_x + 20, h_y - h_s / 3 - 10 + h_y1, h_x + ((1205 - 35) * gui_size - 25) * pers * 0.96 + 20, h_y - h_s / 8 - 10 + h_y1, 0);
		draw_set_alpha(1);
		
	
		//if health_al > 0
		//	{ health_al -= 0.02; }
		//	else
		//	{ health_hp = hp; }
		//if health_e_al > 0
		//	{ health_e_al -= 0.02; }
		//	else
		//	{ health_e_hp = e_hp; }
	
		if o_math_mod = 0
			{
			draw_set_font(f_description_regular_big);
			draw_set_color(c_black);
			draw_set_alpha(0.75);
				draw_text_transformed(48 + 25 + ((1205 - 35) * gui_size - 25) - (string_width(round(hp)) + string_width(maxhp) + string_width("/")) / 2 - 5, global.size - 12 - 35, string(round(hp)) + "/" + string(maxhp), 1, 1, 0/*, c_white, c_black*/);
			draw_set_alpha(1);
			}
			else
			{
			draw_set_font(global.math_font);
			draw_set_halign(fa_right);
			draw_set_color(c_black);
		
			draw_set_alpha(0.8);
			//draw_text_transformed(h_x + ((1205 - 35) * gui_size - 25) * pers / round(hp) * health_hp, h_y - 35 + 11, string(round(hp)), 0.12, 0.12, 0);
			draw_set_alpha(1);
			}
	
		draw_sprite_ext_t(s_rank_shield, 0, 10 + sprite_get_width(s_rank_shield) * gui_size / 2, h_y - 5 + h_y1, gui_size * 0.8 * health_scale, gui_size * 0.8 * health_scale, 0 + restart_angle, c_white, 1, c_white, c_black);
		draw_set_font(global.game_font); //draw_set_font(f_description_regular_big);
	
		var skul;
			skul = 0;
		if global.player_rank = 15
			{ skul = 0; }
		if global.player_rank = 10
			{ skul = 1; }
		if global.player_rank = 5
			{ skul = 2; }
		draw_sprite_ext_t(s_rank_skul, skul, 10 + sprite_get_width(s_rank_shield) * gui_size / 2, h_y - 5 + h_y1/* + sprite_get_height(s_rank_shield) * gui_size / 2*/, gui_size * 0.8 * health_scale, gui_size * 0.8 * health_scale, 0 + restart_angle, c_white, 1, c_white, c_black);
		draw_text_transformed_t(10 + sprite_get_width(s_rank_shield) * gui_size / 2, h_y + 35 + h_y1, string(global.player_rank), 0.09 * health_scale, 0.09 * health_scale, 0, global.color_white, c_black);
		draw_text_transformed_t(20 + sprite_get_width(s_rank_shield) * gui_size + string_width(string_upper(global.player_name)) * 0.1 / 2, h_y + 80 - 2 - sprite_get_height(s_healthbar_hp) * gui_size * 0.8 + h_y1, string_upper(global.player_name), 0.1, 0.1, 0, global.color_white, c_black);
	
		for(i=1; i<=3; i++)
			{
			draw_sprite_ext(s_healthbar_table_skul, 0, 640 - 40 + 40 * (i - 1)/*20 + sprite_get_width(s_rank_shield) * gui_size + string_width(string_upper(global.player_name)) * 0.1 + sprite_get_width(s_healthbar_table_skul) * gui_size * i * 1.3*/, h_y - 10 + 3, gui_size * 1.5, gui_size * 1.5, 0, c_black, 0.75);
			draw_sprite_ext_t(s_healthbar_table_skul, 0, 640 - 40 + 40 * (i - 1)/*20 + sprite_get_width(s_rank_shield) * gui_size + string_width(string_upper(global.player_name)) * 0.1 + sprite_get_width(s_healthbar_table_skul) * gui_size * i * 1.3*/, h_y - roundskul_y[i] - 10, roundskul_s[i] * 1.5, roundskul_s[i] * 1.5, 0, c_white, 1, c_white, c_black);
			if roundskul[i] = 2 && roundskul_n[i] > 0
				{ draw_sprite_ext_t(s_healthbar_table_x, 0, 640 - 40 + 40 * (i - 1)/*20 + sprite_get_width(s_rank_shield) * gui_size + string_width(string_upper(global.player_name)) * 0.1 + sprite_get_width(s_healthbar_table_skul) * gui_size * i * 1.3*/, h_y - roundskul_y[i] - 10, roundskul_s[i] * 0.7 * 1.5, roundskul_s[i] * 0.7 * 1.5, roundskul_xa[i], c_white, 1, c_white, c_black); }
			}
		var oneone, onetwo;
		oneone = (roundskul[1] == 1) + (roundskul[2] == 1) + (roundskul[3] == 1);
		onetwo = (roundskul[1] == 2) + (roundskul[2] == 2) + (roundskul[3] == 2);
		draw_set_font(global.game_font);
		//draw_text_transformed_t(640, h_y + 30, string(oneone) + " : " + string(onetwo), 0.15, 0.15, 0, global.color_white, c_black);
	#endregion
	//////////////////////////
	#region Хелсбар Противника
		draw_sprite_ext_t(s_healthbar_hp, 0, 1280 - h_x, h_y + h_y1, gui_size * 0.95, gui_size * 0.4, 0, c_white, 1, c_white, c_black);
		
		var e_pers;
		e_pers = (e_hp / e_maxhp);
		
		draw_set_color(c_red);
		draw_rectangle(1280 - h_x - ((1205 - 35) * gui_size - 25) * health_e_hp / e_maxhp * 0.95 - 25, h_y - h_s / 8 - 10 + h_y1, 1280 - h_x - 25, h_y - h_s - 10 + h_y1, 0);
		
		draw_set_color(global.color_white);
		draw_rectangle(1280 - h_x - ((1205 - 35) * gui_size - 25) * e_pers * 0.95 - 25, h_y - h_s / 8 - 10 + h_y1, 1280 - h_x - 25, h_y - h_s - 10 + h_y1, 0);
		
		draw_set_alpha(0.3);
		draw_set_color(c_black);
		draw_rectangle(1280 - h_x - ((1205 - 35) * gui_size - 25) * e_pers * 0.95 - 25, h_y - h_s / 8 - 10 + h_y1, 1280 - h_x - 25, h_y - h_s / 3 - 10 + h_y1, 0);
		draw_set_alpha(1);
		
			draw_set_font(global.math_font);
			draw_set_halign(fa_right);
			draw_set_color(c_black);
		
			draw_set_alpha(0.8);
			//draw_text_transformed(1280 - h_x - ((1205 - 35) * gui_size - 25) * pers / round(e_hp) * health_e_hp, h_y - 35 + 11, string(round(e_hp)), 0.12, 0.12, 0);
			draw_set_alpha(1);
		
		draw_sprite_ext_t(s_rank_shield, 0, 1280 - 10 - sprite_get_width(s_rank_shield) * gui_size / 2, h_y - 5 + h_y1, gui_size * 0.8 * health_e_scale, gui_size * 0.8 * health_e_scale, 0 + restart_angle, c_white, 1, c_white, c_black);
		draw_set_font(global.game_font);
	
		var eskul;
			eskul = 0;
		if global.enemy_rank > 10
			{ eskul = 0; }
		if global.enemy_rank <= 10 && global.enemy_rank > 5
			{ eskul = 1; }
		if global.enemy_rank <= 5
			{ eskul = 2; }
		draw_sprite_ext_t(s_rank_skul, skul, 1280 - 10 - sprite_get_width(s_rank_shield) * gui_size / 2, h_y - 5 + h_y1/* + sprite_get_height(s_rank_shield) * gui_size / 2*/, gui_size * 0.8 * health_e_scale, gui_size * 0.8 * health_e_scale, 0 + restart_angle, c_white, 1, c_white, c_black);
		draw_text_transformed_t(1280 - (10 + sprite_get_width(s_rank_shield) * gui_size / 2), h_y + 35 + h_y1, string(global.enemy_rank), 0.09, 0.09, 0, global.color_white, c_black);
		draw_text_transformed_t(1280 - (20 + sprite_get_width(s_rank_shield) * gui_size + string_width(string_upper(global.enemy_name)) * 0.1 / 2), h_y + 80 - 2 - sprite_get_height(s_healthbar_hp) * gui_size * 0.8 + h_y1, string_upper(global.enemy_name), 0.1, 0.1, 0, global.color_white, c_black);
	
		//for(i=1; i<=3; i++)
		//	{
		//	draw_sprite_ext(s_healthbar_table_skul, 0, 1280 - h_x - 10/*20 + sprite_get_width(s_rank_shield) * gui_size + string_width(string_upper(global.player_name)) * 0.1 + sprite_get_width(s_healthbar_table_skul) * gui_size * i * 1.3*/, h_y - 4 - sprite_get_height(s_healthbar_hp) * gui_size, gui_size, gui_size, 0, c_black, 0.75);
		//	draw_sprite_ext(s_healthbar_table_skul, 0, 1280 - h_x - 10/*20 + sprite_get_width(s_rank_shield) * gui_size + string_width(string_upper(global.player_name)) * 0.1 + sprite_get_width(s_healthbar_table_skul) * gui_size * i * 1.3*/, h_y - 4 - sprite_get_height(s_healthbar_hp) * gui_size + roundskul_y[i], roundskul_s[i], roundskul_s[i], 0, c_white, 1);
		//	if roundskul[i] = 2 && roundskul_n[i] > 0
		//		{ draw_sprite_ext(s_healthbar_table_x, 0, 1280 - h_x - 10/*20 + sprite_get_width(s_rank_shield) * gui_size + string_width(string_upper(global.player_name)) * 0.1 + sprite_get_width(s_healthbar_table_skul) * gui_size * i * 1.3*/, h_y - 4 - sprite_get_height(s_healthbar_hp) * gui_size + roundskul_y[i], roundskul_s[i] * 0.7, roundskul_s[i] * 0.7, roundskul_xa[i], c_white, 1); }
		//	}
	#endregion
	if 0
	{
	#region Хелсбар Противника 2
		draw_sprite_ext_t(s_healthbar_hp, 0, 1280 - 48, global.size - 12, gui_size, gui_size, 0, c_white, 1, c_white, c_black);
	
		var e_pers;
		e_pers = (e_hp / e_maxhp);
	
		//////////
			draw_set_alpha(health_e_al);
			draw_set_color(c_white);
			draw_rectangle(1280 - 48 - 25, global.size - 12 - 47, 1280 - 48 - 25 - ((1205 - 35) * gui_size - 25) * e_pers / round(e_hp) * health_e_hp, global.size - 12 - 25, 0);
		
			draw_set_alpha(0.4 * health_e_al);
			draw_set_color(c_black);
			draw_rectangle(1280 - 48 - 25, global.size - 12 - 30, 1280 - 48 - 25 - ((1205 - 35) * gui_size - 25) * e_pers / round(e_hp) * health_e_hp, global.size - 12 - 25, 0);
			draw_set_alpha(1);
		/////////
	
		draw_set_color(c_white);
		draw_rectangle(1280 - 48 - 25, global.size - 12 - 47, 1280 - 48 - 25 - ((1205 - 35) * gui_size - 25) * e_pers, global.size - 12 - 25, 0);
		
		draw_set_alpha(0.4);
		draw_set_color(c_black);
		draw_rectangle(1280 - 48 - 25, global.size - 12 - 30, 1280 - 48 - 25 - ((1205 - 35) * gui_size - 25) * e_pers, global.size - 12 - 25, 0);
		draw_set_alpha(1);
	
		if o_math_mod = 0
			{
			draw_set_font(f_description_regular_big);
			draw_set_color(c_black);
			draw_set_alpha(0.75);
				draw_text_transformed(1280 - 48 - 25 - ((1205 - 35) * gui_size - 25) + (string_width(round(e_hp)) + string_width(e_maxhp) + string_width("/")) / 2 + 5, global.size - 12 - 35, string(e_hp) + "/" + string(e_maxhp), 1, 1, 0/*, c_white, c_black*/);
			draw_set_alpha(1);
			}
			else
			{
			draw_set_font(global.math_font);
			draw_set_halign(fa_left);
			draw_set_color(c_black);
		
			draw_set_alpha(0.8);
			draw_text_transformed(1280 - 48 - 25 - ((1205 - 35) * gui_size - 25) * e_pers / round(e_hp) * health_e_hp + 15, global.size - 12 - 35 + 11, string(round(e_hp)), 0.12, 0.12, 0);
			draw_set_alpha(1);
			}
	
		var eskul;
		if global.enemy_rank > 10
			{ eskul = 0; }
		if global.enemy_rank <= 10 && global.enemy_rank > 5
			{ eskul = 1; }
		if global.enemy_rank <= 5
			{ eskul = 2; }
	
		draw_sprite_ext_t(s_rank_shield, 0, 1280 - 10 - sprite_get_width(s_rank_shield) * gui_size / 2, global.size - sprite_get_height(s_rank_shield) * gui_size / 2 - 6, gui_size, gui_size, 0 + restart_angle2, c_white, 1, c_white, c_black);
		draw_set_font(global.game_font); //draw_set_font(f_description_regular_big);
		draw_text_transformed_t(1280 - 10 - sprite_get_width(s_rank_shield) * gui_size / 2, global.size - 20 + 10 - 6, string(global.enemy_rank), 0.12, 0.12, 0, c_white, c_black);
		draw_sprite_ext_t(s_rank_skul, eskul, 1280 - 10 - sprite_get_width(s_rank_shield) * gui_size / 2, global.size - 20 - sprite_get_height(s_rank_shield) * gui_size / 2 - 6, gui_size, gui_size, 0 + restart_angle2, c_white, 1, c_white, c_black);
	
		draw_text_transformed_t(1280 - 20 - sprite_get_width(s_rank_shield) * gui_size - string_width(string_upper(global.enemy_name)) * 0.1 / 2, global.size - 20 - 2 - sprite_get_height(s_healthbar_hp) * gui_size, string_upper(global.enemy_name), 0.1, 0.1, 0, c_white, c_black);
	
		draw_set_color(c_white);
		for(i=1; i<=3; i++)
			{
			draw_sprite_ext(s_healthbar_table_skul, 0, 1280 - 20 - sprite_get_width(s_rank_shield) * gui_size - string_width(string_upper(global.enemy_name)) * 0.1 - sprite_get_width(s_healthbar_table_skul) * gui_size * i * 1.3, global.size - 20 - 4 - sprite_get_height(s_healthbar_hp) * gui_size, gui_size, gui_size, 0, c_black, 0.75);
			draw_sprite_ext(s_healthbar_table_skul, 0, 1280 - 20 - sprite_get_width(s_rank_shield) * gui_size - string_width(string_upper(global.enemy_name)) * 0.1 - sprite_get_width(s_healthbar_table_skul) * gui_size * i * 1.3, global.size - 20 - 4 - sprite_get_height(s_healthbar_hp) * gui_size + roundskul_y[i], roundskul_s[i], roundskul_s[i], 0, c_white, 1);
			if roundskul[i] = 1 && roundskul_n[i] > 0
				{ draw_sprite_ext(s_healthbar_table_x, 0, 1280 - 20 - sprite_get_width(s_rank_shield) * gui_size - string_width(string_upper(global.enemy_name)) * 0.1 - sprite_get_width(s_healthbar_table_skul) * gui_size * i * 1.3, global.size - 20 - 4 - sprite_get_height(s_healthbar_hp) * gui_size + roundskul_y[i], roundskul_s[i] * 0.7, roundskul_s[i] * 0.7,  roundskul_xa[i], c_white, 1); }
			}
	#endregion
	}
	//////////////////////////////
	/////////////////////////////
	if win_stage >= 4
		{
		for(j=1; j<=3; j++)
			{
			if roundskul[j] > 0
				{
				if roundskul_n[j] = 0
					{
					if roundskul_y[j] > -100
						{ roundskul_y[j] -= 10; }
						else
						{ roundskul_n[j] = 1; }
					if roundskul_s[j] < 1
						{ roundskul_s[j] += 0.04; }
					}
			
				if roundskul_n[j] = 1
					{
					if roundskul_xs[j] < 1
						{ roundskul_xs[j] += 0.05;; }	
					if roundskul_xa[j] < 180
						{ roundskul_xa[j] += 20; }
						else
						{ roundskul_n[j] = 2; }
					}
			
				if roundskul_n[j] = 2
					{
					if roundskul_s[j] > gui_size
						{ roundskul_s[j] -= 0.04; }
						else
						{ roundskul_s[j] = gui_size; }
					if roundskul_y[j] < -3
						{ roundskul_y[j] += 5; }
						else
						{ roundskul_y[j] = -3; roundskul_n[j] = 3; }
					}
				}
			}	
		}
	
	//draw_rectangle(0, global.size - 120, 120, global.size, 1);
	if point_in_rectangle(mouse_x, mouse_y, 0, global.size - 120, 120, global.size)
		{
		if mouse_check_button(mb_left)
			{
			if restart_time < room_speed * 0.7
				{ restart_time += 1; }
				else
				{
				if restart_angle < 360
					{ restart_angle += 360 / (room_speed); }
					else
					{
					if !instance_exists(o_transf)
						{ room_goto_t("menu"); }
					}
				}
			}
			else
			{ restart_time = 0; restart_angle = 0; }
		}
		else
		{ restart_time = 0; restart_angle = 0; }
	
	if point_in_rectangle(mouse_x, mouse_y, 1280 - 120, global.size - 120, 1280, global.size)
		{
		if mouse_check_button(mb_left)
			{
			if restart_time2 < room_speed * 0.7
				{ restart_time2 += 1; }
				else
				{
				if restart_angle2 < 360
					{ restart_angle2 += 360 / (room_speed); }
					else
					{
					if !instance_exists(o_transf)
						{ room_goto_t("menu"); }
					}
				}
			}
			else
			{ restart_time2 = 0; restart_angle2 = 0; }
		}
		else
		{ restart_time2 = 0; restart_angle2 = 0; }
#endregion
#region Слова при выстреле
	for(i=0;i<=2;i++)
		{
		if dop_i[i] != -1
			{
			if i = 1
				{
				dop_text_x[i] += 2;  //= 250;
				dop_text_y[i] += 4; // = global.size / 2 - 150;
				}
			if i = 2
				{
				dop_text_x[i] -= 2;
				dop_text_y[i] += 4;
				}
			if dop_text_end[i] = 0
				{
				if dop_text_xscale[i] < 0.2
					{ dop_text_xscale[i] += 0.02; }
				if dop_text_xscale[i] >= 0.2 && dop_text_xscale[i] < 0.25
					{ dop_text_xscale[i] += 0.025; }
				if dop_text_xscale[i] >= 0.25 && dop_text_xscale[i] < 0.30
					{ dop_text_xscale[i] += 0.02; }
				if dop_text_xscale[i] >= 0.30
					{ dop_text_end[i] = 1; }
				}
				else
				{
				if dop_text_xscale[i] > 0
					{ dop_text_xscale[i] -= 0.05; }
					else
					{
					if i = 2// && super_now > super_now1
						{
						part_x = dop_text_x[2];
						part_y = dop_text_y[2];
						part_n = 1;
						part_s = 1;
						
						part_xspd = abs(part_x - (1280) * super_now1 / super_need) / 10;
						part_yspd = abs(part_y - global.size + 10) / 10;
						}
					dop_text_end[i]    = 0;
					dop_text_angle[i]  = 0;
					dop_text_xscale[i] = 0;
					dop_text_yscale[i] = 0;
					dop_text_dir[i]    = 1;
					
					if i = 0
						{
						dop_text_x[i] = 250;
						dop_text_y[i] = global.size / 2 - 150;
						}
					if i = 1
						{
						dop_text_x[i] = 250;
						dop_text_y[i] = global.size / 2 - 150;
						}
					if i = 2
						{
						dop_text_x[i] = 1280 - 250;
						dop_text_y[i] = global.size / 2 - 150;
						}
					dop_i[i] = -1;
					}
				}
			if abs(dop_text_angle[i]) < 30
				{ dop_text_angle[i] += dop_text_dir[i] * 3; }
				else
				{ dop_text_angle[i] -= dop_text_dir[i]; dop_text_dir[i] = -dop_text_dir[i];  }
		
			dop_text_yscale[i] = dop_text_xscale[i];
			
			//dop_text_color[i] = c_orange;
			if dop_i[i] != -1
				{
				dop_text_color[0] = (global.player_object).hero_color;
				draw_set_halign(fa_center);
				draw_set_font(global.game_font);
				draw_text_transformed_t(dop_text_x[i], dop_text_y[i], dop_text[(dop_i[i])], dop_text_xscale[i], dop_text_yscale[i], dop_text_angle[i], dop_text_color[i], 1);
				}
			}
		}
#endregion
if 0
	{
	#region Смайлы
		if point_in_circle(mouse_x, mouse_y, 640, global.size - 20, 65) && mouse_check_button_released(mb_left)
			{ audio_play_sound(sd_text, 2, 0); smile_open = !smile_open; }
	
		if enemy_smile_time > 0
			{ enemy_smile_time -= 1; }
			else
			{
			if enemy_smile_time > -1
				{
				smile_show1 = 1;
				smile_cur1  = enemy_smile;
				enemy_smile_time = -1;
				}
			}
	
		if smile_bi != smile_open
			{
			if smile_bs > 0
				{ smile_bs -= 0.25; }
				else
				{ smile_bi = smile_open; }
			}
			else
			{
			if smile_bs < 1
				{ smile_bs += 0.25; }
			}
	
		draw_sprite_ext(s_smile_button2, smile_bi, 640, global.size - 20, 0.25 * smile_bs * 4, 0.25 * smile_bs * 4, 0, c_white, 0.8);
	
		if smile_open
			{
			if smile_sc < 1
				{ smile_sc += 0.15; }
				else
				{ smile_sc = 1; }
			draw_question(s_question_back, 0, 640, global.size - 140, 560 * smile_sc, 50, 1, c_white, 0.7);
			for(i=0; i<=5; i++)
				{
				if point_in_circle(mouse_x, mouse_y, 640 - 260 + 100 * i, global.size - 140, 40) && smile_sc = 1
					{
					if mouse_check_button_released(mb_left)
						{
						if enemy_smile = -1
							{
							audio_play_sound(sd_text, 2, 0);
							enemy_smile_chance = choose(0,1);
							if enemy_smile_chance = 1
								{
								if (hp / maxhp - e_hp / e_maxhp) * 100 < -30
									{ enemy_smile = choose(1, 1, 1, 1, 3, 3, 4); }
								if (hp / maxhp - e_hp / e_maxhp) * 100 >= -30 && (hp / maxhp - e_hp / e_maxhp) * 100 < 20
									{ enemy_smile = choose(0, 1, 2, 2, 2, 3, 4); }
								if (hp / maxhp - e_hp / e_maxhp) * 100 >= 20 && (hp / maxhp - e_hp / e_maxhp) * 100 < 40
									{ enemy_smile = choose(2, 2, 2, 5, 5, 5, 4, 0); }
								if (hp / maxhp - e_hp / e_maxhp) * 100 >= 40 && (hp / maxhp - e_hp / e_maxhp) * 100 < 70
									{ enemy_smile = choose(0, 0, 0, 5, 5, 5); }
								if (hp / maxhp - e_hp / e_maxhp) * 100 >= 70
									{ enemy_smile = choose(0, 0, 0, 5, 5); }
								enemy_smile_time = room_speed * random_range(1, 3);
								}
							}
						if smile_show = 0
							{
							smile_open = 0;
							smile_show = 1;
							smile_cur  = i;
							}
						}
					if smile_ss[i] < 0.12
						{ smile_ss[i] += 0.02; }
					draw_sprite_ext(asset_get_index("s_smile_"+string(i)), smile_n, 640 - 260 * smile_sc + 100 * i * smile_sc, global.size - 140, (0.27 + smile_ss[i]) * smile_sc, (0.27 + smile_ss[i]), 0, c_white, 1);
					}
					else
					{
					if smile_ss[i] > 0
						{ smile_ss[i] -= 0.02; }
					draw_sprite_ext(s_smiles, i, 640 - 260 * smile_sc + 100 * i * smile_sc, global.size - 140, (0.27 + smile_ss[i]) * smile_sc, (0.27 + smile_ss[i]), 0, c_white, 1);
					}
				}
			smile_n += 1/3;
			}
			else
			{
			smile_n = 0;
			if smile_sc > 0
				{
				smile_sc -= 0.15;
				draw_question(s_question_back, 0, 640, global.size - 140, 560 * smile_sc, 50, 1, c_white, 0.7);
				for(i=0; i<=5; i++)
					{ draw_sprite_ext(s_smiles, i, 640 - 260 * smile_sc + 100 * i * smile_sc, global.size - 140, 0.27 * smile_sc, 0.27, 0, c_white, 1); }
				}
			}
		#region Наш смайл
			if smile_show = 1
				{
				smile_alp  = 1;
				smile_img += 1/3;
		
				if smile_sy < 1
					{ smile_sy += 0.2; }
			
				if smile_sec < 4 * room_speed
					{ smile_sec += 1; }
					else
					{ smile_show = 0; }
		
				draw_sprite_ext(asset_get_index("s_smile_" + string(smile_cur)), smile_img, o_hero.x + 135, o_hero.y - 220, 0.4 * smile_sy, 0.4 * smile_sy, 0, c_white, 1);
				}
				else
				{
				smile_img = 0;
				smile_sec = 0;
				smile_sy  = 0;
		
				if smile_alp > 0
					{
					smile_alp -= 0.05;
					draw_sprite_ext(asset_get_index("s_smile_" + string(smile_cur)), smile_img, o_hero.x + 135, o_hero.y - 220, 0.4, 0.4, 0, c_white, smile_alp);
					}
					else
					{ smile_alp = 0; }
				}
		#endregion
		#region Смайл противника
			if smile_show1 = 1
				{
				smile_alp1  = 1;
				smile_img1 += 1/3;
		
				if smile_sy1 < 1
					{ smile_sy1 += 0.2; }
			
				if smile_sec1 < 4 * room_speed
					{ smile_sec1 += 1; }
					else
					{ smile_show1 = 0; enemy_smile = -1; }
		
				draw_sprite_ext(asset_get_index("s_smile_" + string(smile_cur1)), smile_img1, (global.enemy_object).x - 135, o_hero.y - 220, 0.4 * smile_sy1, 0.4 * smile_sy1, 0, c_white, 1);
				}
				else
				{
				smile_img1 = 0;
				smile_sec1 = 0;
				smile_sy1  = 0;
		
				if smile_alp1 > 0
					{
					smile_alp1 -= 0.05;
					draw_sprite_ext(asset_get_index("s_smile_" + string(smile_cur1)), smile_img1, (global.enemy_object).x - 135, o_hero.y - 220, 0.4, 0.4, 0, c_white, smile_alp1);
					}
					else
					{ smile_alp1 = 0; }
				}
		#endregion
	#endregion
	}
#region Линии видов разрешения
if keyboard_check_pressed(ord("L"))
	{ lines_true = !lines_true; }
	
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
#region Изменения вида
	if view_go_left = 1
		{
		if view_xport > - 20
			{ view_xport -= 10; }
			else
			{ view_go_left = 2; }
		}
	if view_go_left = 2
		{
		if view_xport < 0
			{ view_xport += 10; }
			else
			{ view_go_left = 0; }
		}
		
	if view_go_right = 1
		{
		if view_xport < 20
			{ view_xport += 10; }
			else
			{ view_go_right = 2; }
		}
	if view_go_right = 2
		{
		if view_xport > 0
			{ view_xport -= 10; }
			else
			{ view_go_right = 0; }
		}
		
	if view_go_down = 1
		{
		if view_yport <  15
			{ view_yport += 5; }
			else
			{ view_go_down = 2; }
		}
	if view_go_down = 2
		{
		if view_yport > 0
			{ view_yport -= 5; }
			else
			{ view_go_down = 0; }
		}
		
if view_go_down = 0
	{
	if view_yport != 0
		{ view_yport = 0; }
	}
if view_go_left = 0 && view_go_right = 0
	{
	if view_xport != 0
		{ view_xport = 0; }
	}
	
#endregion
#region Критикал
	if global.critical = 3
		{
		if critical_x < 640 - 30
			{ critical_x += 50; critical_y -= 5; }
		if critical_x >= 640 - 30 && critical_x < 640 + 30
			{ critical_x += 2; }
		if critical_x >= 640 + 30 && critical_x < 1280 + 250
			{ critical_x += 50; critical_y += 5; }
		critical_s =  1 - 0.3 * abs(640 - critical_x) / 640;
		//if global.critical_y_p > 0
		//	{ global.critical_y_p -= 20; }
		}
		else
		{
		critical_x = -250;
		critical_y = -170;
		//if global.critical_y_p < 200
		//	{ global.critical_y_p += 20; }
		}
	//if global.e_critical = 3
	//	{
	//	if global.critical_y_e > 0
	//		{ global.critical_y_e -= 20; }
	//	}
	//	else
	//	{
	//	if global.critical_y_e < 200
	//		{ global.critical_y_e += 20; }
	//	}
	
	draw_set_font(global.game_font);
	draw_text_transformed_t(critical_x, global.size / 2 + critical_y, "CRITICAL", 0.2 * critical_s, 0.2 * critical_s, 0, (global.player_object).hero_color, c_black);
	//draw_text_transformed_t((global.enemy_object).x - 250 , global.size - 22 - sprite_get_height(s_healthbar_hp) * gui_size + global.critical_y_e, "CRITICAL", 0.1, 0.1, 0, (global.enemy_object).hero_color , c_black);
#endregion
#region Верно или нет
	if answer_rec = 1
		{
		if answer_alp < 0.8
			{ answer_alp += 0.15; }
			else
			{ answer_rec = 2; }
		}
	if answer_rec = 2
		{
		if answer_alp > 0
			{ answer_alp -= 0.05; }
			else
			{ answer_rec = 0; }
		}
	if answer_rec > 0
		{
		draw_set_alpha(answer_alp);
		draw_rectangle_color(0, 0, 1280, global.size, answer_col, answer_col, answer_col, answer_col, 0);
		draw_set_alpha(1);
		}
#endregion
#region Шэйк-эффект
	if shaker = 1
		{
		if shaker_spd > 0
			{
			if (shaker_ang < shaker_spd && shaker_dir = 1) or (shaker_ang > shaker_spd && shaker_dir = -1)
				{ shaker_ang += 1 * shaker_dir; }
				else
				{
				shaker_dir  = -shaker_dir;
				shaker_ang += 1 * shaker_dir;
				shaker_spd -= 1;
				}
			camera_set_view_angle(camera_get_active(), shaker_ang);
			}
			else
			{
			shaker = 0;
			shaker_dir = 1;
			shaker_spd = 10;
			shaker_ang = 0;
			}
		}
	if keyboard_check_pressed(ord("I"))
		{ shaker = !shaker; }
#endregion

#region Отладка
	//if keyboard_check(vk_down)
	//	{
	//	ongle -= 1;
	//	}
	//if keyboard_check(vk_up)
	//	{
	//	ongle += 1;
	//	}
	//draw_set_font(global.game_font); //draw_set_font(f_wanted_bold);
	//draw_triangle(mouse_x - 640, mouse_y + 450, mouse_x + 640, mouse_y - 300, mouse_x + 640, mouse_y + 500, 0);
	//draw_text_transformed_t(mouse_x, mouse_y, string(theme_choose), 0.35, 0.35, 0, c_white, c_black); //draw_text_transformed_t(mouse_x, mouse_y, string_upper(keyboard_string), 0.10, 0.10, 0, c_white, c_black);
	//var ot11, ot1, ot2, ot3, ot4, ot5, ot6;
	//ot11 = string(global.pin); //"rounds = " + string(global.rounds) + "\ntask = " + string(global.task) + "\nquestion = " + string(global.question);
	//ot1 = "\nt1.1 = " + string(task_question[1,1]) + " t2.1 = " + string(task_question[2,1]) + " t3.1 = " + string(task_question[3,1]); //ot2 = "\nt1 = " + string(task_question[global.task,1]) + "\nt2 = " + string(task_question[global.task,2]) + "\nt3 = " + string(task_question[global.task,3]) + "\nt4 = " + string(task_question[global.task,4]) + "\nt5 = " + string(task_question[global.task,5]) + "\nt6 = " + string(task_question[global.task,6]);
	//ot2 = "\nt1.2 = " + string(task_question[1,2]) + " t2.2 = " + string(task_question[2,2]) + " t3.2 = " + string(task_question[3,2]);
	//ot3 = "\nt1.3 = " + string(task_question[1,3]) + " t2.3 = " + string(task_question[2,3]) + " t3.3 = " + string(task_question[3,3]);
	//ot4 = "\nt1.4 = " + string(task_question[1,4]) + " t2.4 = " + string(task_question[2,4]) + " t3.4 = " + string(task_question[3,4]);
	//ot5 = "\nt1.5 = " + string(task_question[1,5]) + " t2.5 = " + string(task_question[2,5]) + " t3.5 = " + string(task_question[3,5]);
	//ot6 = "\nt1.6 = " + string(task_question[1,6]) + " t2.6 = " + string(task_question[2,6]) + " t3.6 = " + string(task_question[3,6]);
	//draw_set_font(f_description_regular);
	//draw_text(mouse_x, mouse_y, ot11 + ot1 + ot2 + ot3 + ot4 + ot5 + ot6);
#endregion
#region Прочее
	#region Старый код (Время)
	//var str, font;
	//str  = "0123456789?=≠+-/*><"; //"!"+"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюя"; 
	//font = font_add_sprite_ext(s_question_fig, str, true, 1);
	//draw_set_font(f_player_name_big_bold);
	//var hour, minute;
	//hour = string(o_control.day_hour);
	//minute = string(o_control.day_minute);

	//if real(hour) < 10
	//	{ hour = "0" + hour; }
	//if real(minute) < 10
	//	{ minute = "0" + minute; }
	//draw_text_transformed_t(640, global.size / 2, hour + ":" + minute, 1, 1, 0, c_white, c_black);
#endregion
#endregion