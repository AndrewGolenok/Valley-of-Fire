#region Идолы
	for(i=1;i<=3;i++)
		{
		global.idol_x[i] = 640 - 250 * (global.idol_h[i]==1) + 250 * (global.idol_h[i]==0);
		if global.idol[i] = 0
			{
			if global.idol_y[i] > -200
				{ global.idol_y[i] -= 70; }
				else
				{ global.idol[i] = 0; }
			}
		if global.idol[i] = 1
			{
			if global.idol_y[i] < o_hero.y
				{ global.idol_y[i] += 50; }
				else
				{ global.idol[i] = 2; }
			}
		if global.idol[i] = 2
			{
			if global.idol_s[i] > 0.8
				{ global.idol_s[i] -= 0.05; }
				else
				{ global.idol[i] = 3; }
			}
		if global.idol[i] = 3
			{
			if global.idol_s[i] < 1
				{ global.idol_s[i] += 0.05; }
				else
				{ global.idol[i] = 4; global.idol_s[i] = 1; }
			}
		if global.idol[i] = 4
			{ global.idol_y[i] = o_hero.y; }
		//if global.idol[i] = 5
		//	{
		//	if global.idol_y[i] > -200
		//		{ global.idol_y[i] -= 50; }
		//		else
		//		{ global.idol[i] = -1; }
		//	}
		draw_sprite_ext_t(s_idols, i - 1, global.idol_x[i], (global.idol_h[i]==1) * o_control.back_train_y1 + (global.idol_h[i]==1) * o_control.back_train_y2 + global.idol_y[i], 1 * o_hero.scale * 1.3, global.idol_s[i] * o_hero.scale * 1.3, 0, c_white, 1, c_white, c_black);	
			for(j=0;j<=1;j++)
				{
				if global.anim[i,j] > -1
					{
					if global.idol[i] > 0 && global.anim[i,j] > -1
						{
						if global.anim[i,j] < 5
							{ global.anim[i,j] += 0.35; }
							else
							{
							global.anim[i,j] = -1;
							if i = 3
								{
								if j = 1
									{
									if hp > 0 && e_hp > 0
										{ hp -= e_atk / 2; }
									dop_i[1] = 7;
									dop_text_color[1] = global.color_hero[7];
									dop_text[7] = "-" + string(round(e_atk / 2));
									with(global.enemy_object)
										{
										if global.super_ability = 0 && !(skeleton_animation_get() = "super") && !(image_index <= hero_shoot && skeleton_animation_get() = "shoot")
											{
											stun = 0;
											skeleton_animation_set("damaged");
											change = 1;
											}
										}
									}
								if j = 0
									{
									if hp > 0 && e_hp > 0
										{ e_hp -= atk / 2; }
									dop_i[2] = 8;
									dop_text_color[2] = global.color_hero[7];
									dop_text[8] = "-" + string(round(atk / 2));
									with(global.enemy_object)
										{
										if global.super_ability = 0 && !(skeleton_animation_get() = "super") && !(image_index <= hero_shoot && skeleton_animation_get() = "shoot")
											{
											stun = 0;
											skeleton_animation_set("damaged");
											change = 1;
											}
										}
									}
								}
							}
							if i = 2 && global.anim[2,j] > -1
								{ draw_sprite_ext_t(s_wind, global.anim[i,j], (global.player_object).x * (j==1) + (global.enemy_object).x * (j==0), (j==1) * o_control.back_train_y1 + (j==0) * o_control.back_train_y2 + (global.player_object).y * (j==1) + (global.enemy_object).y * (j==0), 1.4 * o_hero.scale, global.idol_s[i] * o_hero.scale, 0, c_white, 1, c_white, c_black); }
							if i = 3 && global.anim[3,j] > -1
								{ draw_sprite_ext_t(s_bolt, global.anim[i,j], (global.player_object).x * (j==1) + (global.enemy_object).x * (j==0), (j==1) * o_control.back_train_y1 + (j==0) * o_control.back_train_y2 + (global.player_object).y * (j==1) + (global.enemy_object).y * (j==0), 1.4 * o_hero.scale, global.idol_s[i] * o_hero.scale, 0, c_white, 1, c_white, c_black); }
						}
					}
				//if global.anim[i,j] != -1
				//	{
				//	if i = 2 && global.idol = 4
				//		{ draw_sprite_ext_t(s_wind, global.anim[i,j], (global.player_object).x * (j==1) + (global.enemy_object).x * (j==0), (global.player_object).y * (j==1) + (global.enemy_object).y * (j==0), 1 * o_hero.scale, global.idol_s[i] * o_hero.scale, 0, c_white, 1, c_white, c_black); }
				//	if i = 3 && global.idol = 3
				//		{ draw_sprite_ext_t(s_bolt, global.anim[i,j], (global.player_object).x * (j==1) + (global.enemy_object).x * (j==0), (global.player_object).y * (j==1) + (global.enemy_object).y * (j==0), 1 * o_hero.scale, global.idol_s[i] * o_hero.scale, 0, c_white, 1, c_white, c_black); }
				//	}
				//draw_sprite_ext_t(s_idols, i - 1, global.idol_x[i], global.idol_y[i], 1 * o_hero.scale, global.idol_s[i] * o_hero.scale, 0, 1, 1, c_white, c_black);	
				}
		}
#endregion
#region Фон
	//if global.hero = 6 && ((global.player_object).super = 1 or (global.enemy_object).super = 1)
	//	{ io_clear(); }
	var prx, pry;
	prx = global.paral_x * global.paral_sx;
	pry = global.paral_y * global.paral_sy;
	
	//draw_sprite_ext(s_train_back1, o_control.back_time[1], 640 + o_control.back_x, global.size + o_control.back_y, o_control.back_s, o_control.back_s, 0, c_white, o_control.back_alpha2[o_control.back_time[1]] * o_control.back_alpha[1]);
	//draw_sprite_ext(s_train_back1, o_control.back_time[2], 640 + o_control.back_x, global.size + o_control.back_y, o_control.back_s, o_control.back_s, 0, c_white, o_control.back_alpha2[o_control.back_time[2]] * o_control.back_alpha[2]);
	if global.background = "mine"
		{
		var hui;
		hui = 100 * 960 / global.size;
		//draw_sprite_ext(s_mine_rock1, 0, 0, global.size + hui, o_control.back_s, o_control.back_s, 0, c_white, 1);
		//draw_sprite_ext(s_mine_rock2, 0, 1280, global.size + 100 + hui, o_control.back_s, o_control.back_s, 0, c_white, 1);
		draw_sprite_ext(s_mine_rock1, 0, 0 + prx - 15, global.size + hui + pry, 1, 1, 0, c_white, 1);
		draw_sprite_ext(s_mine_rock2, 0, 1280 + prx + 15, global.size + 100 + hui + pry, 1, 1, 0, c_white, 1);
		}
	if global.background = "saloon"
		{
		if o_control.sl_tumble_y > o_hero.y - 40
			{ draw_sprite_ext(s_saloon_tumbleweed, 0, o_control.sl_tumble_x - prx, o_control.sl_tumble_y - pry, o_control.sl_tumble_s, o_control.sl_tumble_s, o_control.sl_tumble_a, c_white, 1); }
		
		draw_sprite_ext_t(s_saloon_house, 0, 640 + o_control.back_x + prx, global.size + o_control.back_y + pry, 1, 1, 0, c_white, 1, c_white, c_black);
		draw_sprite_ext_t(s_saloon_wanted, o_control.sl_wanted_i, 640 + o_control.back_x + prx, global.size + o_control.back_y + pry, 1, 1, 0, c_white, 1, c_white, c_black);
		}
#endregion
#region Смена способности
if global.hero = 1 && global.enemy_hero = 1
	{ super_now = 0; super_need = 40; e_super_now = 0; e_super_need = 40; global.swipe_ability = 0; super_zhopa = 300; }
#endregion
#region Листовка
	#region Появление
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
		if (global.player_object).stun
			{ list_scale = 0; }
	#endregion
	#region ТЕМЫ
		if global.super_ability = 1
			{ io_clear(); }
		global.training_hand_x = -200;
		global.training_hand_y = -200;
		var mouse_x1, mouse_y1;
		if theme_round[global.rounds] != -1 && theme_choose = 4 && global.super_ability = 0
			{
			#region Текст вопроса
				question_text = global.question_text[theme_round[global.rounds],round_task[global.rounds,global.task]];
				with(global.player_object)
					{
					if shoot = 0 && !(skeleton_animation_get() = "super") && !(skeleton_animation_get() = "shoot")
						{ global.cananswer = 1; }
						else
						{ global.cananswer = 0; }
					}
				with(global.enemy_object)
					{
					if shoot = 0 && skeleton_animation_get() = "idle"
						{ global.e_abilitican = 1; }
						else
						{ global.e_abilitican = 0; }
					}
				with(global.player_object)
					{
					if shoot = 0 && skeleton_animation_get() = "idle"
						{ global.abilitican = 1; }
						else
						{ global.abilitican = 0; }
					}
			#endregion
				
			#region Математика - Math
				if theme_round[global.rounds] = 6
					{
					if global.training = 6
						{
						var hand_xxx, hand_yyy;
						hand_xxx = -200;
						hand_yyy = -200;
							
						global.training_hand_x = hand_xxx;
						global.training_hand_y = hand_yyy;
						}
					timer_y  = -30;
					pre_wait = 0;
					#region Задача 1 - Знаки
						if round_task[global.rounds,global.task] = 1
							{
							#region Координаты кнопок
								var x1, y1, x2, y2, x3, y3, x4, y4, button_width, button_height;
									
								button_width  = sprite_get_width(s_question_sign)  * list_size1 * o_but_sc;
								button_height = sprite_get_height(s_question_sign) * list_size1 * o_but_sc;
							
								x1 = 640 - button_width / 2 * 3 - 45; //640 - 5 - 160 * list_size1 - button_x;
								y1 = global.size / 2 + 50; //global.size / 2 + 4 - 80 + 140 * list_size1 + list_y - 250 * (1 - list_scale);
			
								x2 = 640 - button_width / 2 - 15; //640 - 5 + 160 * list_size1 + button_x;
								y2 = y1;
		
								x3 = 640 + button_width / 2 + 15; //x1;
								y3 = global.size / 2 + 50; //global.size / 2 + 4 - 80 + 400 * list_size1 + list_y - 350 * (1 - list_scale);
		
								x4 = 640 + button_width / 2 * 3 + 45; // x2;
								y4 = y3;
							#endregion
							#region Варианты
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if global.training < 1 or global.training_question != 0
											{
											#region Вариант 1
												if point_in_rectangle(mouse_x1, mouse_y1, x1 - button_width / 2, y1 - button_height / 2, x1 + button_width / 2, y1 + button_height / 2)
													{
													if device_mouse_check_button(dev, mb_left)
														{ b_pressed_s[1] = 1.2; }
														else
														{ b_pressed_s[1] = 1; }
													if device_mouse_check_button_released(dev, mb_left)
														{
														if global.sound { audio_play_sound(sd_text, 2, 0); }
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
												if point_in_rectangle(mouse_x1, mouse_y1, x2 - button_width / 2, y2 - button_height / 2, x2 + button_width / 2, y2 + button_height / 2)
													{
													if device_mouse_check_button(dev, mb_left)
														{ b_pressed_s[2] = 1.2; }
														else
														{ b_pressed_s[2] = 1; }
													if device_mouse_check_button_released(dev, mb_left)
														{
														if global.sound
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
												if point_in_rectangle(mouse_x1, mouse_y1, x3 - button_width / 2, y3 - button_height / 2, x3 + button_width / 2, y3 + button_height / 2)
													{
													if device_mouse_check_button(dev, mb_left)
														{ b_pressed_s[3] = 1.2; }
														else
														{ b_pressed_s[3] = 1; }
													if device_mouse_check_button_released(dev, mb_left)
														{
														if global.sound { audio_play_sound(sd_text, 2, 0); }
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
												if point_in_rectangle(mouse_x1, mouse_y1, x4 - button_width / 2, y4 - button_height / 2, x4 + button_width / 2, y4 + button_height / 2)
													{
													if device_mouse_check_button(dev, mb_left)
														{ b_pressed_s[4] = 1.2; }
														else
														{ b_pressed_s[4] = 1; }
													if device_mouse_check_button_released(dev, mb_left)
														{
														if global.sound { audio_play_sound(sd_text, 2, 0); }
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
											else
											{
											if global.training_stage[6] = 7
												{
												if vtrue[1] = 1
													{
													#region Вариант 1
														if point_in_rectangle(mouse_x1, mouse_y1, x1 - button_width / 2, y1 - button_height / 2, x1 + button_width / 2, y1 + button_height / 2)
															{
															if device_mouse_check_button(dev, mb_left)
																{ b_pressed_s[1] = 1.2; }
																else
																{ b_pressed_s[1] = 1; }
															if device_mouse_check_button_released(dev, mb_left)
																{
																if global.sound { audio_play_sound(sd_text, 2, 0); }
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
													}
												if vtrue[2] = 1
													{
													#region Вариант 2
														if point_in_rectangle(mouse_x1, mouse_y1, x2 - button_width / 2, y2 - button_height / 2, x2 + button_width / 2, y2 + button_height / 2)
															{
															if device_mouse_check_button(dev, mb_left)
																{ b_pressed_s[2] = 1.2; }
																else
																{ b_pressed_s[2] = 1; }
															if device_mouse_check_button_released(dev, mb_left)
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
													}
												if vtrue[3] = 1
													{
													#region Вариант 3
														if point_in_rectangle(mouse_x1, mouse_y1, x3 - button_width / 2, y3 - button_height / 2, x3 + button_width / 2, y3 + button_height / 2)
															{
															if device_mouse_check_button(dev, mb_left)
																{ b_pressed_s[3] = 1.2; }
																else
																{ b_pressed_s[3] = 1; }
															if device_mouse_check_button_released(dev, mb_left)
																{
																if global.sound { audio_play_sound(sd_text, 2, 0); }
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
													}
												if vtrue[4] = 1
													{
													#region Вариант 4
														if point_in_rectangle(mouse_x1, mouse_y1, x4 - button_width / 2, y4 - button_height / 2, x4 + button_width / 2, y4 + button_height / 2)
															{
															if device_mouse_check_button(dev, mb_left)
																{ b_pressed_s[4] = 1.2; }
																else
																{ b_pressed_s[4] = 1; }
															if device_mouse_check_button_released(dev, mb_left)
																{
																if global.sound { audio_play_sound(sd_text, 2, 0); }
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
												}
											}
										}
									}
							#endregion
							#region Рисование кнопок и вопроса
								#region Обучение
									if global.training = 6
										{
										if global.training_stage[6] = 6 or (global.training_stage[6] = 7 && global.training_question = 0)
											{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
											}
									
										//if global.training_stage[1] = 8
										//	{
										//	//global.training_hand_x = hand_xxx;
										//	//global.training_hand_y = hand_yyy;
										//	}
										if mouse_check_button_pressed(mb_left) && global.training_x > 1280 && global.text_sc = 1
											{
											if global.training_stage[6] = 6
												{ global.training_stage[6] = 7; }
											}
										if global.training_question = 3
											{
											global.training_stage[6] = 10;
											global.training_hand_s   = 0;
											global.training_question = 0;
											global.text_ne = 1;
											global.text_go = 0;
											}
										}
								#endregion
								if (global.training < 1 or global.training_stage[6] >= 6)
									{
									var math_ind;
									math_ind = 1.3;
									draw_set_font(global.math_font);
									
									draw_set_color(c_black);
									draw_set_alpha(0.4);
									draw_text_transformed(640 - 3 + 30, global.size / 2 - 200 * list_size - 50 + list_y + 4 + button_x / 4 - 125 * (1 - list_scale), equation_text /*"14?7=2*/, list_size * 1.04, list_size * 1.04 * list_scale, 0);
									draw_set_color(c_white);
									draw_set_alpha(1);
									draw_text_transformed_t(640 + 30, global.size / 2 - 200 * list_size - 50 + list_y + button_x / 4 - 125 * (1 - list_scale), equation_text /*"14?7=2*/, list_size * 1.04, list_size * 1.04 * list_scale, 0, c_white, c_black);
									
									draw_sprite_ext_t(s_question_sign, 0, x1, y1, list_size1 * b_pressed_s[1] * math_ind, list_size1 * list_scale * b_pressed_s[1] * math_ind, 0, c_white, 1, c_white, c_black);
									draw_sprite_ext_t(s_question_sign, 1, x2, y1 + 3, -list_size1 * b_pressed_s[2] * math_ind, list_size1 * list_scale * b_pressed_s[2] * math_ind, 0, c_white, 1, c_white, c_black);
									draw_sprite_ext_t(s_question_sign, 2, x3, y1 + 3, list_size1 * b_pressed_s[3] * math_ind, list_size1 * list_scale * b_pressed_s[3] * math_ind, 0, c_white, 1, c_white, c_black);
									draw_sprite_ext_t(s_question_sign, 3, x4, y1, -list_size1 * b_pressed_s[4] * math_ind, list_size1 * list_scale * b_pressed_s[4] * math_ind, 0, c_white, 1, c_white, c_black);
										
									draw_set_font(global.game_font);
									draw_text_transformed_t(x1, y1 + 10, "+", list_scale * 0.7, list_scale * 0.7, 0, c_white, c_black);
									draw_text_transformed_t(x2, y1 + 10, "-", list_scale * 0.7, list_scale * 0.7, 0, c_white, c_black);
									draw_text_transformed_t(x3, y1 + 10, "/", list_scale * 0.7, list_scale * 0.7, 0, c_white, c_black);
									draw_text_transformed_t(x4, y1 + 10, "*", list_scale * 0.7, list_scale * 0.7, 0, c_white, c_black);
									}
								if global.training_question = 0 && global.training_stage[6] = 7 && hand_xxx = -200
									{
									if vtrue[1] = 1
										{
										hand_xxx = x1;
										hand_yyy = y1;
										}
									if vtrue[2] = 1
										{
										hand_xxx = x2;
										hand_yyy = y1;
										}
									if vtrue[3] = 1
										{
										hand_xxx = x3;
										hand_yyy = y1;
										}
									if vtrue[4] = 1
										{
										hand_xxx = x4;
										hand_yyy = y1;
										}
									
									global.training_hand_x = hand_xxx;
									global.training_hand_y = hand_yyy;
									}
							#endregion
							}
					#endregion
					#region Задача 2 - Числа
						if round_task[global.rounds,global.task] = 2
							{
							#region Координаты кнопок
								var x1, y1, x2, y2, x3, y3, x4, y4, button_width, button_height;
									
								button_width = sprite_get_width(s_question_sign) * list_size1 * o_but_sc;
								button_height = sprite_get_height(s_question_sign) * list_size1 * o_but_sc;
									
								x1 = 640 - button_width / 2 * 3 - 45; //640 - 5 - 160 * list_size1 - button_x;
								y1 = global.size / 2 + 50; //global.size / 2 + 4 - 80 + 140 * list_size1 + list_y - 250 * (1 - list_scale);
									
								x2 = 640 - button_width / 2 - 15; //640 - 5 + 160 * list_size1 + button_x;
								y2 = y1;
									
								x3 = 640 + button_width / 2 + 15; //x1;
								y3 = global.size / 2 + 50; //global.size / 2 + 4 - 80 + 400 * list_size1 + list_y - 350 * (1 - list_scale);
									
								x4 = 640 + button_width / 2 * 3 + 45; // x2;
								y4 = y3;
							#endregion
							#region Варианты
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if global.training < 1 or global.training_question != 0
											{
											#region Вариант 1
												if point_in_rectangle(mouse_x1, mouse_y1, x1 - button_width / 2, y1 - button_height / 2, x1 + button_width / 2, y1 + button_height / 2)
													{
													if device_mouse_check_button(dev, mb_left)
														{ b_pressed_s[1] = 1.2; }
														else
														{ b_pressed_s[1] = 1; }
													if device_mouse_check_button_released(dev, mb_left)
														{
														if global.sound { audio_play_sound(sd_text, 2, 0); }
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
												if point_in_rectangle(mouse_x1, mouse_y1, x2 - button_width / 2, y2 - button_height / 2, x2 + button_width / 2, y2 + button_height / 2)
													{
													if device_mouse_check_button(dev, mb_left)
														{ b_pressed_s[2] = 1.2; }
														else
														{ b_pressed_s[2] = 1; }
													if device_mouse_check_button_released(dev, mb_left)
														{
														if global.sound { audio_play_sound(sd_text, 2, 0); }
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
												if point_in_rectangle(mouse_x1, mouse_y1, x3 - button_width / 2, y3 - button_height / 2, x3 + button_width / 2, y3 + button_height / 2)
													{
													if device_mouse_check_button(dev, mb_left)
														{ b_pressed_s[3] = 1.2; }
														else
														{ b_pressed_s[3] = 1; }
													if device_mouse_check_button_released(dev, mb_left)
														{
														if global.sound { audio_play_sound(sd_text, 2, 0); }
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
											if point_in_rectangle(mouse_x1, mouse_y1, x4 - button_width / 2, y4 - button_height / 2, x4 + button_width / 2, y4 + button_height / 2)
												{
												if device_mouse_check_button(dev, mb_left)
													{ b_pressed_s[4] = 1.2; }
													else
													{ b_pressed_s[4] = 1; }
												if device_mouse_check_button_released(dev, mb_left)
													{
													if global.sound { audio_play_sound(sd_text, 2, 0); }
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
											else
											{
											if global.training_stage[6] = 11
												{
												if vtrue[1] = 1
													{
													#region Вариант 1
														if point_in_rectangle(mouse_x1, mouse_y1, x1 - button_width / 2, y1 - button_height / 2, x1 + button_width / 2, y1 + button_height / 2)
															{
															if device_mouse_check_button(dev, mb_left)
																{ b_pressed_s[1] = 1.2; }
																else
																{ b_pressed_s[1] = 1; }
															if device_mouse_check_button_released(dev, mb_left)
																{
																if global.sound { audio_play_sound(sd_text, 2, 0); }
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
													}
												if vtrue[2] = 1
													{
													#region Вариант 2
														if point_in_rectangle(mouse_x1, mouse_y1, x2 - button_width / 2, y2 - button_height / 2, x2 + button_width / 2, y2 + button_height / 2)
															{
															if device_mouse_check_button(dev, mb_left)
																{ b_pressed_s[2] = 1.2; }
																else
																{ b_pressed_s[2] = 1; }
															if device_mouse_check_button_released(dev, mb_left)
																{
																if global.sound { audio_play_sound(sd_text, 2, 0); }
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
													}
												if vtrue[3] = 1
													{
													#region Вариант 3
														if point_in_rectangle(mouse_x1, mouse_y1, x3 - button_width / 2, y3 - button_height / 2, x3 + button_width / 2, y3 + button_height / 2)
															{
															if device_mouse_check_button(dev, mb_left)
																{ b_pressed_s[3] = 1.2; }
																else
																{ b_pressed_s[3] = 1; }
															if device_mouse_check_button_released(dev, mb_left)
																{
																if global.sound { audio_play_sound(sd_text, 2, 0); }
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
													}
												if vtrue[4] = 1
													{
													#region Вариант 4
													if point_in_rectangle(mouse_x1, mouse_y1, x4 - button_width / 2, y4 - button_height / 2, x4 + button_width / 2, y4 + button_height / 2)
														{
														if device_mouse_check_button(dev, mb_left)
															{ b_pressed_s[4] = 1.2; }
															else
															{ b_pressed_s[4] = 1; }
														if device_mouse_check_button_released(dev, mb_left)
															{
															if global.sound { audio_play_sound(sd_text, 2, 0); }
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
												}
											}
										}
									}
							#endregion
							#region Рисование кнопок и вопроса
								#region Обучение
									if global.training = 6
										{
										if global.training_stage[6] = 10 or (global.training_stage[6] = 11 && global.training_question = 0)
											{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
											}
									
										//if global.training_stage[1] = 8
										//	{
										//	//global.training_hand_x = hand_xxx;
										//	//global.training_hand_y = hand_yyy;
										//	}
										if mouse_check_button_pressed(mb_left) && global.training_x > 1280 && global.text_sc = 1
											{
											if global.training_stage[6] = 10
												{ global.training_stage[6] = 11; }
											}
										if global.training_question = 3
											{
											global.training_stage[6] = 14;
											global.training_hand_s   = 0;
											global.training_question = 0;
											global.text_ne = 1;
											global.text_go = 0;
											}
										}
							#endregion
								if (global.training < 1 or global.training_stage[6] >= 10)// && global.training_question != 0
									{
									var math_ind, txt_scale;
									math_ind = 1.4;
									txt_scale = 0.35;
									draw_set_font(global.math_font);
									
									draw_set_color(c_black);
									draw_set_alpha(0.4);
									draw_text_transformed(640 - 3 + 30, global.size / 2 - 200 * list_size - 50 + list_y + 4 + button_x / 4 - 125 * (1 - list_scale), equation_text, list_size * 1.04, list_size * 1.04 * list_scale, 0);
									draw_set_color(c_white);
									draw_set_alpha(1);
									draw_text_transformed_t(640 + 30, global.size / 2 - 200 * list_size - 50 + list_y + button_x / 4 - 125 * (1 - list_scale), equation_text, list_size * 1.04, list_size * 1.04 * list_scale, 0, c_white, c_black);
									
									draw_sprite_ext_t(s_question_sign, 0, x1, y1, list_size1 * b_pressed_s[1]* math_ind, list_size1 * list_scale * b_pressed_s[1]* math_ind, 0, c_white, 1, c_white, c_black);
									draw_sprite_ext_t(s_question_sign, 0, x2, y1 + 6, list_size1 * b_pressed_s[2]* math_ind, list_size1 * list_scale * b_pressed_s[2]* math_ind, 0, c_white, 1, c_white, c_black);
									draw_sprite_ext_t(s_question_sign, 0, x3, y1 + 6, -list_size1 * b_pressed_s[3]* math_ind, list_size1 * list_scale * b_pressed_s[3]* math_ind, 0, c_white, 1, c_white, c_black);
									draw_sprite_ext_t(s_question_sign, 0, x4, y1, -list_size1 * b_pressed_s[4]* math_ind, list_size1 * list_scale * b_pressed_s[4]* math_ind, 0, c_white, 1, c_white, c_black);
									
									draw_text_transformed_t(x1 + 50, y1 + 65, vtext[1], txt_scale * list_scale, txt_scale * list_scale, 0, c_white, c_black);
									draw_text_transformed_t(x2 + 50, y1 + 65, vtext[2], txt_scale * list_scale, txt_scale * list_scale, 0, c_white, c_black);
									draw_text_transformed_t(x3 + 50, y1 + 65, vtext[3], txt_scale * list_scale, txt_scale * list_scale, 0, c_white, c_black);
									draw_text_transformed_t(x4 + 50, y1 + 65, vtext[4], txt_scale * list_scale, txt_scale * list_scale, 0, c_white, c_black);
									}
								if global.training_question = 0 && global.training_stage[6] = 11 && hand_xxx = -200
									{
									if vtrue[1] = 1
										{
										hand_xxx = x1;
										hand_yyy = y1;
										}
									if vtrue[2] = 1
										{
										hand_xxx = x2;
										hand_yyy = y1;
										}
									if vtrue[3] = 1
										{
										hand_xxx = x3;
										hand_yyy = y1;
										}
									if vtrue[4] = 1
										{
										hand_xxx = x4;
										hand_yyy = y1;
										}
									
									global.training_hand_x = hand_xxx;
									global.training_hand_y = hand_yyy;
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
								
									x1 = 640 - button_width / 2 * 3 - 100; //640 - 5 - 160 * list_size1 - button_x;
									y1 = global.size / 2 + 50; //global.size / 2 + 4 - 80 + 140 * list_size1 + list_y - 250 * (1 - list_scale);
								
									x2 = 640 - button_width / 2 - 15 - 50; //640 - 5 + 160 * list_size1 + button_x;
									y2 = y1;
								
									x3 = 640 + button_width / 2 + 15 + 50; //x1;
									y3 = global.size / 2 + 50; //global.size / 2 + 4 - 80 + 400 * list_size1 + list_y - 350 * (1 - list_scale);
								
									x4 = 640 + button_width / 2 * 3 + 100; // x2;
									y4 = y3;
							#endregion
							#region Варианты
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if global.training < 1 or global.training_question != 0
											{
											#region Вариант 2
												if point_in_rectangle(mouse_x1, mouse_y1, x2 - button_width / 2, y2 - button_height / 2, x2 + button_width / 2, y2 + button_height / 2)
													{
													if device_mouse_check_button(dev, mb_left)
														{ b_pressed_s[2] = 1.2; }
														else
														{ b_pressed_s[2] = 1; }
													if device_mouse_check_button_released(dev, mb_left)
														{
														if global.sound { audio_play_sound(sd_text, 2, 0); }
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
												if point_in_rectangle(mouse_x1, mouse_y1, x3 - button_width / 2, y3 - button_height / 2, x3 + button_width / 2, y3 + button_height / 2)
													{
													if device_mouse_check_button(dev, mb_left)
														{ b_pressed_s[3] = 1.2; }
														else
														{ b_pressed_s[3] = 1; }
													if device_mouse_check_button_released(dev, mb_left)
														{
														if global.sound { audio_play_sound(sd_text, 2, 0); }
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
											else
											{
											if global.training_stage[6] = 16
												{
												if vtrue[2] = 1
													{
													#region Вариант 2
														if point_in_rectangle(mouse_x1, mouse_y1, x2 - button_width / 2, y2 - button_height / 2, x2 + button_width / 2, y2 + button_height / 2)
															{
															if device_mouse_check_button(dev, mb_left)
																{ b_pressed_s[2] = 1.2; }
																else
																{ b_pressed_s[2] = 1; }
															if device_mouse_check_button_released(dev, mb_left)
																{
																if global.sound { audio_play_sound(sd_text, 2, 0); }
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
													}
												if vtrue[3] = 1
													{
													#region Вариант 3
														if point_in_rectangle(mouse_x1, mouse_y1, x3 - button_width / 2, y3 - button_height / 2, x3 + button_width / 2, y3 + button_height / 2)
															{
															if device_mouse_check_button(dev, mb_left)
																{ b_pressed_s[3] = 1.2; }
																else
																{ b_pressed_s[3] = 1; }
															if device_mouse_check_button_released(dev, mb_left)
																{
																if global.sound { audio_play_sound(sd_text, 2, 0); }
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
												}
											}
										}
									}
							#endregion
							#region Рисование кнопок и вопроса
							#region Обучение
								if global.training = 6
									{
									if global.training_stage[6] = 14 or global.training_stage[6] = 15
									or (global.training_stage[6] = 16 && global.training_question = 0)
										{
										draw_set_alpha(0.45);
										draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
										draw_set_alpha(1);
										}
								
									if mouse_check_button_pressed(mb_left) && global.training_x > 1280 && global.text_sc = 1
										{
										if global.training_stage[6] = 14 or global.training_stage[6] = 15
											{ global.training_stage[6] += 1; }
										}
								
									if global.training_question = 3
										{
										global.training_stage[6] = 18;
										global.training_hand_s   = 0;
										global.training_question = 0;
										global.text_ne = 1;
										global.text_go = 0;
										}
									}
							#endregion
							if (global.training < 1 or global.training_stage[6] >= 14)
								{
								var math_ind, txt_scale;
								math_ind = 1.4;
								txt_scale = 0.6;
								draw_set_font(global.math_font);
							
								draw_set_color(c_black);
								draw_set_alpha(0.4);
								draw_text_transformed(640 - 3 + 30, global.size / 2 - 200 * list_size - 50 + list_y + 4 + button_x / 4 - 125 * (1 - list_scale), equation_text, list_size * 1.04, list_size * 1.04 * list_scale, 0);
								draw_set_color(c_white);
								draw_set_alpha(1);
								draw_text_transformed_t(640 + 30, global.size / 2 - 200 * list_size - 50 + list_y + button_x / 4 - 125 * (1 - list_scale), equation_text, list_size * 1.04, list_size * 1.04 * list_scale, 0, c_white, c_black);
							
								draw_sprite_ext_t(s_question_sign, 0, x2, y1 + 6, list_size1 * b_pressed_s[2]* math_ind, list_size1 * list_scale * b_pressed_s[2]* math_ind, 0, c_white, 1, c_white, c_black);
								draw_sprite_ext_t(s_question_sign, 0, x3, y1 + 6, -list_size1 * b_pressed_s[3]* math_ind, list_size1 * list_scale * b_pressed_s[3]* math_ind, 0, c_white, 1, c_white, c_black);
							
								draw_text_transformed_t(x2 + 70, y1 + 100, vtext[2], txt_scale * list_scale, txt_scale * list_scale, 0, c_white, c_black);
								draw_text_transformed_t(x3 + 70, y1 + 100, vtext[3], txt_scale * list_scale, txt_scale * list_scale, 0, c_white, c_black);
								}
							if global.training_question = 0 && global.training_stage[6] = 16 && hand_xxx = -200
								{
								if vtrue[1] = 1
									{
									hand_xxx = x1;
									hand_yyy = y1;
									}
								if vtrue[2] = 1
									{
									hand_xxx = x2;
									hand_yyy = y1;
									}
								if vtrue[3] = 1
									{
									hand_xxx = x3;
									hand_yyy = y1;
									}
								if vtrue[4] = 1
									{
									hand_xxx = x4;
									hand_yyy = y1;
									}
									
								global.training_hand_x = hand_xxx;
								global.training_hand_y = hand_yyy;
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
									y1 = global.size / 2 + 50;
							
									x2 = 640 - button_width / 2 - 15; //640 - 5 + 160 * list_size1 + button_x;
									y2 = y1;
		
									x3 = 640 + button_width / 2 + 15; //x1;
									y3 = global.size / 2 + 50;
							
									x4 = 640 + button_width / 2 * 3 + 45; // x2;
									y4 = y3;
							#endregion
							#region Варианты
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if global.training < 1 or global.training_question != 0
											{
											#region Вариант 2
												if point_in_rectangle(mouse_x1, mouse_y1, x2 - button_width / 2, y2 - button_height / 2, x2 + button_width / 2, y2 + button_height / 2)
													{
													if device_mouse_check_button(dev, mb_left)
														{ b_pressed_s[2] = 1.2; }
														else
														{ b_pressed_s[2] = 1; }
													if device_mouse_check_button_released(dev, mb_left)
														{
														if global.sound { audio_play_sound(sd_text, 2, 0); }
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
												if point_in_rectangle(mouse_x1, mouse_y1, x3 - button_width / 2, y3 - button_height / 2, x3 + button_width / 2, y3 + button_height / 2)
													{
													if device_mouse_check_button(dev, mb_left)
														{ b_pressed_s[3] = 1.2; }
														else
														{ b_pressed_s[3] = 1; }
													if device_mouse_check_button_released(dev, mb_left)
														{
														if global.sound { audio_play_sound(sd_text, 2, 0); }
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
											else
											{
											if global.training_stage[6] = 20
												{
												if vtrue[2] =1
													{
													#region Вариант 2
														if point_in_rectangle(mouse_x1, mouse_y1, x2 - button_width / 2, y2 - button_height / 2, x2 + button_width / 2, y2 + button_height / 2)
															{
															if device_mouse_check_button(dev, mb_left)
																{ b_pressed_s[2] = 1.2; }
																else
																{ b_pressed_s[2] = 1; }
															if device_mouse_check_button_released(dev, mb_left)
																{
																if global.sound { audio_play_sound(sd_text, 2, 0); }
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
													}
												if vtrue[3] = 1
													{
													#region Вариант 3
														if point_in_rectangle(mouse_x1, mouse_y1, x3 - button_width / 2, y3 - button_height / 2, x3 + button_width / 2, y3 + button_height / 2)
															{
															if device_mouse_check_button(dev, mb_left)
																{ b_pressed_s[3] = 1.2; }
																else
																{ b_pressed_s[3] = 1; }
															if device_mouse_check_button_released(dev, mb_left)
																{
																if global.sound { audio_play_sound(sd_text, 2, 0); }
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
												}
											}
										}
									}
							#endregion
							#region Рисование кнопок и вопроса
								#region Обучение
								if global.training = 6
									{
									if global.training_stage[6] = 18 or global.training_stage[6] = 19
									or (global.training_stage[6] = 20 && global.training_question = 0)
										{
										draw_set_alpha(0.45);
										draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
										draw_set_alpha(1);
										}
								
									if mouse_check_button_pressed(mb_left) && global.training_x > 1280 && global.text_sc = 1
										{
										if global.training_stage[6] = 18 or global.training_stage[6] = 19
											{ global.training_stage[6] += 1; }
										}
								
									if global.training_question = 3
										{
										global.training_stage[6] = 22;
										global.training_hand_s   = 0;
										global.training_question = 0;
										global.text_ne = 1;
										global.text_go = 0;
										}
									}
								#endregion
								if (global.training < 1 or global.training_stage[6] >= 18)
									{
									var math_ind, txt_scale;
									math_ind = 1.4;
									txt_scale = 0.6;
									draw_set_font(global.math_font);
								
									draw_set_color(c_black);
									draw_set_alpha(0.4);
									draw_text_transformed(640 - 3 + 30, global.size / 2 - 200 * list_size - 50 + list_y + 4 + button_x / 4 - 125 * (1 - list_scale), equation_text, list_size * 1.04, list_size * 1.04 * list_scale, 0);
									draw_set_color(c_white);
									draw_set_alpha(1);
									draw_text_transformed_t(640 + 30, global.size / 2 - 200 * list_size - 50 + list_y + button_x / 4 - 125 * (1 - list_scale), equation_text, list_size * 1.04, list_size * 1.04 * list_scale, 0, c_white, c_black);
								
									draw_sprite_ext_t(s_question_sign, 0, x2, y1 + 6, list_size1 * b_pressed_s[2]* math_ind, list_size1 * list_scale * b_pressed_s[2]* math_ind, 0, c_white, 1, c_white, c_black);
									draw_sprite_ext_t(s_question_sign, 0, x3, y1 + 6, -list_size1 * b_pressed_s[3]* math_ind, list_size1 * list_scale * b_pressed_s[3]* math_ind, 0, c_white, 1, c_white, c_black);
								
									draw_text_transformed_t(x2 + 70, y1 + 110, vtext[2], txt_scale * list_scale, txt_scale * list_scale, 0, c_white, c_black);
									draw_text_transformed_t(x3 + 70, y1 + 110, vtext[3], txt_scale * list_scale, txt_scale * list_scale, 0, c_white, c_black);
									}
							
								if global.training_question = 0 && global.training_stage[6] = 20 && hand_xxx = -200
									{
									if vtrue[1] = 1
										{
										hand_xxx = x1;
										hand_yyy = y1;
										}
									if vtrue[2] = 1
										{
										hand_xxx = x2;
										hand_yyy = y1;
										}
									if vtrue[3] = 1
										{
										hand_xxx = x3;
										hand_yyy = y1;
										}
									if vtrue[4] = 1
										{
										hand_xxx = x4;
										hand_yyy = y1;
										}
									
									global.training_hand_x = hand_xxx;
									global.training_hand_y = hand_yyy;
									}
								//draw_set_font(global.math_font);
									
								//draw_set_color(c_black);
								//draw_set_alpha(0.4);
								//draw_text_transformed(640 - 3 + 30, global.size / 2 - 200 * list_size - 50 + list_y + 4 + button_x / 4 - 125 * (1 - list_scale), equation_text /*"14?7=2*/, list_size * 1.04, list_size * 1.04 * list_scale, 0);
								//draw_set_color(c_white);
								//draw_set_alpha(1);
								//draw_text_transformed(640 + 30, global.size / 2 - 200 * list_size - 50 + list_y + button_x / 4 - 125 * (1 - list_scale), equation_text /*"14?7=2*/, list_size * 1.04, list_size * 1.04 * list_scale, 0);
									
								//draw_sprite_ext(s_question_figure, 2, x2, y1 + 6 + 6, list_size1, list_size1 * list_scale, 0, c_black, 0.4);
								//draw_sprite_ext(s_question_figure, 2, x3, y1 + 6 + 6, -list_size1, list_size1 * list_scale, 0, c_black, 0.4);
									
								//draw_sprite_ext(s_question_figure, 3, x2, y1 + 6, list_size1, list_size1 * list_scale, 0, c_white, 1);
								//draw_sprite_ext(s_question_figure, 3, x3, y1 + 6, -list_size1, list_size1 * list_scale, 0, c_white, 1);
									
								//draw_sprite_ext(s_question_figure, 2, x2, y1 + 6, list_size1 * b_pressed_s[2], list_size1 * list_scale * b_pressed_s[2], 0, c_white, 1);
								//draw_sprite_ext(s_question_figure, 2, x3, y1 + 6, -list_size1 * b_pressed_s[3], list_size1 * list_scale * b_pressed_s[3], 0, c_white, 1);
									
								//draw_text_transformed(x2 + 40, y1 + string_height(vtext[2]) / 2 * list_size * 1.04 * list_scale + 6, vtext[2], list_size * 1.1, list_size * 1.1 * list_scale, 0);
								//draw_text_transformed(x3 + 40, y1 + string_height(vtext[3]) / 2 * list_size * 1.04  * list_scale + 6, vtext[3], list_size * 1.1, list_size * 1.1 * list_scale, 0);
							#endregion
							}
					#endregion
					}
			#endregion
			#region Бутылки    - Bottles
				if theme_round[global.rounds] = 2
					{
					#region Задача 1 - Бутылки, очередь
						if round_task[global.rounds,global.task] = 1
							{
							if global.training = 2
								{
								var hand_xxx, hand_yyy;
								hand_xxx = -200;
								hand_yyy = -200;
							
								global.training_hand_x = hand_xxx;
								global.training_hand_y = hand_yyy;
								}
							timer_y = 140;
							#region Координаты и появление
								if list_scale = 1
									{
									if bottle_red = 0
										{
										for(i=1;i<=bottle_all;i++)
											{
											if bottle_n[i] = bottle_stage
												{
												if global.training < 1 or global.training_stage[global.training] >= 7
													{
													if bottle_y[i] < 0
														{ global.training_hand_s = 0; bottle_y[i] += 100; }
														else
														{
														bottle_y[i] = 0;
														if bottle_stage < bottle_all
															{ bottle_stage += 1; }
															else
															{ bottle_stage = 0; pre_wait = 0; }
														}
													}
												}
											bottle_x[i] = 640 - 60 * (bottle_all - 1) + 120 * (i - 1); //bottle_x[i] = 640 - 25 * (bottle_all - 1) + 50 * (i - 1);
											}
										}
										else
										{
										if bottle_stage != 0
											{
											for(i=bottle_all;i>=1;i--)
												{
												if bottle_n[i] = bottle_stage
													{
													if bottle_y[i] < 0
														{ bottle_y[i] += 100; }
														else
														{
														bottle_y[i] = 0;
														if bottle_stage > 1
															{ bottle_stage -= 1; }
															else
															{ bottle_stage = 0; pre_wait = 0; }
														}
													}
												bottle_x[i] = 640 - 60 * (bottle_all - 1) + 120 * (i - 1);
												}
											}
										}
									}
							#endregion
							#region Ответ
								if bottle_stage = 0 && global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										for(i=1;i<=bottle_all;i++)
											{
											if global.training = 2
												{
												if global.training_hand_s + 1 = bottle_n[i] && hand_xxx = -200 && bottle_destroy[i] = 0
												&& global.training_stage[2] = 8 && global.training_question = 0
													{
													hand_xxx = bottle_x[i];
													hand_yyy = global.size / 2;
												
													global.training_hand_x = hand_xxx;
													global.training_hand_y = hand_yyy;
													}
												}
											if abs(mouse_x1 - bottle_x[i]) < 50 && abs(mouse_y1 - global.size / 2 + bottle_y[i] - 50) < 100
												{
												color[dev] = c_red;
												if device_mouse_check_button_pressed(dev, mb_left)
													{
													color[dev] = c_green;
													if bottle_destroy[i] = 0
														{
														if global.sound { audio_play_sound(sd_text, 2, 0); }
														//bottle_destroy[i] = 1;
														if global.training < 1 or global.training_question != 0
															{
															bottle_destroy[i] = 1;
															if bottle_s + 1 = bottle_n[i]
																{
																if bottle_s + 1 = bottle_all
																	{ global.answer = 1; bottles_1(); }
																	else
																	{ bottle_s = bottle_n[i]; }
																}
																else
																{ global.answer = 0; bottles_1(); }
															}
															else
															{
															if global.training_stage[2] = 8
																{
																global.training_hand_s += 1;
																if bottle_s + 1 = bottle_n[i]
																	{
																	if bottle_s + 1 = bottle_all
																		{ global.answer = 1; bottles_1(); }
																		else
																		{ bottle_s = bottle_n[i]; }
																	bottle_destroy[i] = 1;
																	}
																}
															}
														}
													}
												}
												else
												{ color[dev] = c_white; }
											}
										}
									}
							#endregion
							#region Рисование
								#region Обучение
									if global.training = 2
										{
										if (global.training_stage[2] = 6 or global.training_stage[2] = 7
										or (global.training_stage[2] = 8 && global.training_question = 0))
											{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
											}
									
										//if global.training_stage[1] = 8
										//	{
										//	//global.training_hand_x = hand_xxx;
										//	//global.training_hand_y = hand_yyy;
										//	}
										if mouse_check_button_pressed(mb_left) && global.training_x > 1280 && global.text_sc = 1
											{
											if global.training_stage[2] = 6 or global.training_stage[2] = 7
												{ global.training_stage[2] += 1; }
											}
										if global.training_question = 3
											{
											global.training_stage[2] += 1;
											global.training_hand_s   = 0;
											global.training_question = 0;
											global.text_ne = 1;
											global.text_go = 0;
											}
										}
								#endregion
								for(i=1;i<=bottle_all;i++)
									{
									var bottle_spr, bottle_ss, bottle_col;
									bottle_spr = asset_get_index("s_bottle" + string(bottle_i[i]));
									if bottle_red = 1
										{ bottle_col = c_red; }
										else
										{ bottle_col = c_white; }
									if bottle_i[i] = 1
										{ bottle_ss = 1; }
										else
										{ bottle_ss = 1.25; }
									if bottle_destroy[i] > 0
										{
										if bottle_destroy[i] < 6
											{
											bottle_destroy[i] += 1;
											draw_sprite_ext(bottle_spr, bottle_destroy[i] - 1, bottle_x[i], global.size / 2 + bottle_y[i] - 50, 0.6 * list_scale * bottle_ss, 0.6 * list_scale * bottle_ss, 0, bottle_col, 1 - 0.1 * bottle_destroy[i]);
											}
										}
										else
										{ draw_sprite_ext(bottle_spr, 0, bottle_x[i], global.size / 2 + bottle_y[i] - 50, 0.6 * list_scale * bottle_ss, 0.6 * list_scale * bottle_ss, 0, bottle_col, 1 - 0.5 * bottle_destroy[i]); }
									}
							#endregion
							}
					#endregion
					#region Задача 2 - Бутылки, номера
						if round_task[global.rounds,global.task] = 2
							{
							if global.training = 2
								{
								var hand_xxx, hand_yyy;
								hand_xxx = -200;
								hand_yyy = -200;
							
								global.training_hand_x = hand_xxx;
								global.training_hand_y = hand_yyy;
								}
							timer_y = 140;
							#region Координаты и появление
								if list_scale = 1
									{
									for(i=1;i<=bottle_all;i++)
										{
										if i = bottle_stage
											{
											if global.training < 1 or global.training_stage[global.training] > 10
												{
												if bottle_y[i] < 0
													{ global.training_hand_s = 0; bottle_y[i] += 100; }
													else
													{
													bottle_y[i] = 0;
													if bottle_stage < bottle_all
														{ bottle_stage += 1; }
														else
														{ bottle_stage = 0; pre_wait = 0; }
													}
												}
											}
										bottle_x[i] = 640 - 60 * (bottle_all - 1) + 120 * (i - 1);
										}
									}
							#endregion
							#region Ответ
								if bottle_stage = 0 && global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										for(i=1;i<=bottle_all;i++)
											{
											if global.training = 2
												{
												if global.training_hand_s + 1 = bottle_n[i] && hand_xxx = -200 && bottle_destroy[i] = 0
												&& global.training_stage[2] = 11 && global.training_question = 0
													{
													hand_xxx = bottle_x[i];
													hand_yyy = global.size / 2;
												
													global.training_hand_x = hand_xxx;
													global.training_hand_y = hand_yyy;
													}
												}
											if abs(mouse_x1 - bottle_x[i]) < 50 && abs(mouse_y1 - global.size / 2 + bottle_y[i] - 50) < 100
												{
												if device_mouse_check_button_pressed(dev, mb_left)
													{
													if global.training < 1 or (global.training_stage[2] = 11 && global.training_question != 0)
														{
														if bottle_destroy[i] = 0
															{
															if global.sound { audio_play_sound(sd_text, 2, 0); }
															bottle_destroy[i] = 1;
															if bottle_s + 1 = bottle_n[i]
																{
																if bottle_s + 1 = bottle_all
																	{ global.answer = 1; bottles_2(); }
																	else
																	{ bottle_s = bottle_n[i]; }
																}
																else
																{ global.answer = 0; bottles_2(); }
															}
														}
														else
														{
														if bottle_destroy[i] = 0
															{
															if global.sound { audio_play_sound(sd_text, 2, 0); }
															global.training_hand_s += 1;
															if bottle_s + 1 = bottle_n[i]
																{
																if bottle_s + 1 = bottle_all
																	{ global.answer = 1; bottles_2(); }
																	else
																	{ bottle_s = bottle_n[i]; }
																bottle_destroy[i] = 1;
																}
															}
														}
													}
												}
											}
										}
									}
							#endregion
							#region Рисование
								#region Обучение
									if global.training = 2
										{
										if (global.training_stage[2] = 10
										or (global.training_stage[2] = 11 && global.training_question = 0))
											{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
											}
									
										//if global.training_stage[1] = 8
										//	{
										//	//global.training_hand_x = hand_xxx;
										//	//global.training_hand_y = hand_yyy;
										//	}
										if mouse_check_button_pressed(mb_left) && global.training_x > 1280 && global.text_sc = 1
											{
											if global.training_stage[2] = 10
												{ global.training_stage[2] += 1; }
											}
										if global.training_question = 3
											{
											global.training_stage[2] = 14;
											global.training_hand_s   = 0;
											global.training_question = 0;
											global.text_ne = 1;
											global.text_go = 0;
											}
										}
								#endregion
								for(i=1;i<=bottle_all;i++)
									{
									var bottle_spr, bottle_ss, bottle_col;
									bottle_spr = asset_get_index("s_bottle" + string(bottle_i[i]));
									if bottle_red = 0
										{ bottle_col = c_white; }
										else
										{ bottle_col = c_red; }
									if bottle_i[i] = 1
										{ bottle_ss = 1; }
										else
										{ bottle_ss = 1.25; }
									if bottle_destroy[i] > 0
										{
										if bottle_destroy[i] < 6
											{
											bottle_destroy[i] += 1;
											draw_sprite_ext(bottle_spr, bottle_destroy[i] - 1, bottle_x[i], global.size / 2 + bottle_y[i] - 50, 0.6 * list_scale * bottle_ss, 0.6 * list_scale * bottle_ss, 0, bottle_col, 1 - 0.1 * bottle_destroy[i]);
											}
										}
										else
										{ draw_sprite_ext(bottle_spr, 0, bottle_x[i], global.size / 2 + bottle_y[i] - 50, 0.6 * list_scale * bottle_ss, 0.6 * list_scale * bottle_ss, 0, bottle_col, 1 - 0.5 * bottle_destroy[i]); }

										draw_set_font(global.game_font);
										if bottle_red = 0
											{
											draw_set_color(c_maroon);
											draw_set_alpha(bottle_a1);
											draw_text_transformed(bottle_x[i], global.size / 2 + bottle_y[i] + 10, string(bottle_n[i]), bottle_s1 * 0.4 * list_scale, bottle_s2 * 0.4 * ((6 - bottle_destroy[i]) / 6) * list_scale, 16);
											draw_set_alpha(1);
											}
											else
											{
											draw_set_color(c_white);
											draw_set_alpha(bottle_a1);
											draw_text_transformed(bottle_x[i], global.size / 2 + bottle_y[i] + 10, string(bottle_n1[i]), bottle_s1 * 0.4 * list_scale, bottle_s2 * 0.4 * ((6 - bottle_destroy[i]) / 6) * list_scale, 16);
											draw_set_alpha(1);
											}
										draw_set_color(c_white);
									}
							#endregion
							}
					#endregion
					#region Задача 3 - Бутылки, падение
						if round_task[global.rounds,global.task] = 3
							{
							if global.training = 2
								{
								var hand_xxx, hand_yyy;
								hand_xxx = -200;
								hand_yyy = -200;
							
								global.training_hand_x = hand_xxx;
								global.training_hand_y = hand_yyy;
								}
							timer_y  = 50;
							#region Координаты
								if list_scale = 1
									{
									for(i=1;i<=bottle_all;i++)
										{
										if bottle_y[i] > 200
											{ pre_wait = 0; }
										if global.training < 1 or global.training_question != 0
											{
											if ((bottle_y[i] < global.size + 100 && i = 1) or ((bottle_y[i - 1] > global.size / 2 - 100 or bottle_destroy[i - 1] != 0) && bottle_y[i] < global.size + 100)) && bottle_destroy[i] = 0 && !global.super_ability
												{ bottle_y[i] += bottle_spd[i]; }
											}
											else
											{
											if global.training_stage[2] = 16
												{
												if (bottle_y[i] < global.size / 2 && i = global.training_hand_s + 1) && bottle_destroy[i] = 0// or (bottle_destroy[i-1] != 0 && i > 1) && bottle_destroy[i] = 0
													{ bottle_y[i] += bottle_spd[i]; }
												
												if bottle_y[i] >= global.size / 2
													{
													if global.training = 2 && bottle_destroy[i] = 0 && global.training_question = 0
														{
														var hand_xxx, hand_yyy;
														hand_xxx = bottle_x[i];
														hand_yyy = bottle_y[i];
							
														global.training_hand_x = hand_xxx;
														global.training_hand_y = hand_yyy;
														}
													}
												}
											}
										if bottle_stage = i && bottle_destroy[i] = 0
											{
											if bottle_y[i] < global.size + 100
												{ }
												else
												{
												if global.training < 1 or global.training_question != 0
													{
													if bottle_r[i] = 1
														{ bottle_stage += 1; bottle_destroy[i] = 1; }
														else
														{ bottles_3(); global.answer = 0; bottle_destroy[i] = 1; }
													if i = bottle_all
														{
														if bottle_stage > bottle_all
															{ bottles_3(); global.answer = 1; bottle_destroy[i] = 1; }
															else
															{ bottles_3(); global.answer = 0; bottle_destroy[i] = 1; }
														}
													}
													else
													{
													//bottle_x[i] = 640;
													//bottle_x[i] = 640;
													//if global.training_stage[2] = 16
													//	{
													//	if bottle_r[i] = 1
													//		{ global.training_hand_s += 1; bottle_stage += 1; bottle_destroy[i] = 1; }
													
													//	if i = bottle_all
													//		{
													//		if bottle_stage > bottle_all
													//			{ bottles_3(); global.answer = 1; bottle_destroy[i] = 1; }
													//		}
													//	}
													}
												}
											}
										}
									}
							if bottle_stage > bottle_all && global.answer = -1
								{ bottles_3(); global.answer = 1; }
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										for(i=1;i<=bottle_all;i++)
											{
											if point_in_rectangle(mouse_x1, mouse_y1, bottle_x[i] - 50, bottle_y[i] - 90, bottle_x[i] + 50, bottle_y[i] + 90)//abs(mouse_x1 - bottle_x[i]) < 50 && abs(mouse_y1 + bottle_y[i]) < 100
												{
												if device_mouse_check_button_pressed(dev, mb_left) && bottle_destroy[i] = 0
													{
													if global.sound { audio_play_sound(sd_text, 2, 0); }
												
													if global.training < 1  or global.training_question != 0
														{
														if bottle_r[i] != 1
															{ bottle_stage += 1; bottle_destroy[i] = 1; }
															else
															{ bottles_3(); global.answer = 0; }
														}
														else
														{
														if bottle_r[i] != 1
															{ bottle_stage += 1; bottle_destroy[i] = 1; global.training_hand_s += 1; }
														}
													}
												}
											}
										}
									}
							#endregion
							#region Рисование
								#region Обучение
									if global.training = 2
										{
										if (global.training_stage[2] = 14 or global.training_stage[2] = 15
										or (global.training_stage[2] = 16 && global.training_question = 0))
											{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
											}
									
										//if global.training_stage[1] = 8
										//	{
										//	//global.training_hand_x = hand_xxx;
										//	//global.training_hand_y = hand_yyy;
										//	}
										if mouse_check_button_pressed(mb_left) && global.training_x > 1280 && global.text_sc = 1
											{
											if global.training_stage[2] = 14 or global.training_stage[2] = 15
												{ global.training_stage[2] += 1; }
											}
										if global.training_question = 3
											{
											global.training_stage[2] = 18;
											global.training_hand_s   = 0;
											global.training_question = 0;
											global.text_ne = 1;
											global.text_go = 0;
											}
										}
								#endregion
								for(i=1;i<=bottle_all;i++)
									{
									var bottle_spr, bottle_ss, bottle_col;
									bottle_spr = asset_get_index("s_bottle" + string(bottle_i[i]));
									if bottle_r[i] = 1
										{ bottle_col = c_red; }
										else
										{ bottle_col = c_white; }
								
									if global.training = 2 && global.training_stage[2] = 16 && global.training_question = 0
										{ bottle_x[i] = 640; }
								
									if bottle_destroy[i] > 0
										{
										if bottle_destroy[i] < 6
											{
											bottle_destroy[i] += 1;
											draw_sprite_ext(bottle_spr, bottle_destroy[i] - 1, bottle_x[i], bottle_y[i], 0.7 * list_scale, 0.7 * list_scale , 0, bottle_col, 1 - 0.1 * bottle_destroy[i]);
											}
										}
										else
										{ draw_sprite_ext(bottle_spr, 0, bottle_x[i], bottle_y[i], 0.7 * list_scale, 0.7 * list_scale, 0, bottle_col, 1 - 0.5 * bottle_destroy[i]); }
								
									//draw_rectangle(bottle_x[i] - 50, bottle_y[i] - 60, bottle_x[i] + 50, bottle_y[i] + 90, 1);
									}
							#endregion
							}
					#endregion
					#region Задача 4 - Бутылки, наполнение
						if round_task[global.rounds,global.task] = 4
							{
							if global.training = 2
								{
								var hand_xxx, hand_yyy;
								hand_xxx = -200;
								hand_yyy = -200;
							
								global.training_hand_x = hand_xxx;
								global.training_hand_y = hand_yyy;
								}
							timer_y = 100;
							#region Координаты
								if list_scale = 1
									{
									for(i=1;i<=bottle_all;i++)
										{
										if global.training < 1 or global.training_question != 0
											{
											if i = bottle_stage
												{
												if bottle_y[i] < 0
													{ bottle_y[i] += 100; }
													else
													{
													bottle_y[i] = 0;
													if bottle_stage < bottle_all
														{ bottle_stage += 1; }
														else
														{ bottle_stage = 0; pre_wait = 0; }
													}
												}
											}
											else
											{
											if global.training_stage >= 19
												{
												if i = bottle_stage
													{
													if bottle_y[i] < 0
														{ bottle_y[i] += 100; }
														else
														{
														bottle_y[i] = 0;
														if bottle_stage < bottle_all
															{ bottle_stage += 1; }
															else
															{ bottle_stage = 0; pre_wait = 0; }
														}
													}
												}
											}
										bottle_x[i] = 640 - 60 * (bottle_all - 1) + 120 * (i - 1);
										}
									}
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0 && bottle_end = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
									
										if (point_in_rectangle(mouse_x1, mouse_y1, 0, 0, 1280, global.size - 150) && super_now = super_need) or super_now != super_need
											{
											if device_mouse_check_button_pressed(dev, mb_left)
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
												for(i=1;i<=bottle_all;i++)
													{
													if global.training < 1 or global.training_question != 0
														{
														if bottle_s = i && bottle_destroy[i] = 0
															{
															bottle_s += 1;
															if bottle_s > bottle_all
																{
																var pp;
																pp = 0;
																for(i=1;i<=bottle_all;i++)
																	{
																	if abs(bottle_p[1] - bottle_p[i]) > 0.2 or abs(bottle_p[1] - bottle_p[i]) > bottle_p[1] * 0.5
																		{ pp = 1; }
																	}
																if pp = 1
																	{ bottle_end = 1; }
																	else
																	{ global.answer = 1; bottles_4(); }
																}
															break;
															}
														}
														else
														{
														if global.training_stage[2] = 20
															{
															if bottle_s = i && bottle_destroy[i] = 0
																{
																bottle_s += 1;
																if bottle_s > bottle_all
																	{
																	var pp;
																	pp = 0;
																	for(i=1;i<=bottle_all;i++)
																		{
																		if abs(bottle_p[1] - bottle_p[i]) > 0.2 or abs(bottle_p[1] - bottle_p[i]) > bottle_p[1] * 0.5
																			{ pp = 1; }
																		}
																	if pp = 1
																		{ bottle_end = 1; }
																		else
																		{ global.answer = 1; bottles_4(); }
																	}
																break;
																}
															}
														}
													}
												}
											}
										}
									}
							#endregion
							#region Рисование
								#region Обучение
									if global.training = 2
										{
										if (global.training_stage[2] = 18 or global.training_stage[2] = 19
										or (global.training_stage[2] = 20 && global.training_question = 0))
											{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
											}
									
										//if global.training_stage[1] = 8
										//	{
										//	//global.training_hand_x = hand_xxx;
										//	//global.training_hand_y = hand_yyy;
										//	}
										if mouse_check_button_pressed(mb_left) && global.training_x > 1280 && global.text_sc = 1
											{
											if global.training_stage[2] = 18 or global.training_stage[2] = 19
												{ global.training_stage[2] += 1; }
											}
										if global.training_question = 3
											{
											global.training_stage[2] = 22;
											global.training_hand_s   = 0;
											global.training_question = 0;
											global.text_ne = 1;
											global.text_go = 0;
											}
										}
								#endregion
								for(i=1;i<=bottle_all;i++)
									{
									var bottle_spr, bottle_h, bottle_w;
									bottle_spr = asset_get_index("s_bottle" + string(bottle_i[i]));
									bottle_h   = sprite_get_height(bottle_spr); // * 0.6;
									bottle_w   = sprite_get_width(bottle_spr);
									if bottle_end = 1
										{
										bottle_destroy[i] = 1;
										if i = bottle_all
											{ bottle_end = 2; }
										}
								
									if bottle_destroy[i] > 0
										{
										if bottle_destroy[i] < 6
											{
											bottle_destroy[i] += 1;
											draw_sprite_ext(bottle_spr, bottle_destroy[i] - 1, bottle_x[i], global.size / 2 + bottle_y[i] - 50, 0.6 * list_scale, 0.6 * list_scale, 0, c_white, 1 - 0.1 * bottle_destroy[i]); 
											draw_sprite_part_ext(bottle_spr, bottle_destroy[i] - 1, 0, bottle_h - bottle_h * bottle_p[i], bottle_w, bottle_h, bottle_x[i] - bottle_w / 2 * 0.6 + 2, global.size / 2 + bottle_y[i] - 50 + bottle_h / 2 * 0.6 - bottle_w * 0.6 * bottle_p[i], 0.6 * list_scale, 0.6 * list_scale, c_red, 1 - 0.1 * bottle_destroy[i]);
											}
										if bottle_end = 2 && bottle_destroy[bottle_all] = 6
											{ global.answer = 0; bottles_4(); }
										}
										else
										{
										if global.training < 1 or global.training_question != 0
											{
											if bottle_s = i && bottle_stage = 0 && bottle_end = 0 && global.super_ability = 0
												{
												if ((bottle_p[i] < 1 && bottle_d[i] = 1) or (bottle_p[i] > 0 && bottle_d[i] = -1))
													{ bottle_p[i] += bottle_spd[i] * bottle_d[i]; }
													else
													{ bottle_end = 1; bottle_destroy[i] = 1; }
												}
											}
											else
											{
											//if global.training_stage[2] = 20
												{
												if bottle_p[i] <= 0.5
													{
													if bottle_s = i && bottle_stage = 0 && bottle_end = 0 && global.super_ability = 0
														{
														if ((bottle_p[i] < 1 && bottle_d[i] = 1) or (bottle_p[i] > 0 && bottle_d[i] = -1))
															{ bottle_p[i] += bottle_spd[i] * bottle_d[i]; }
															//else
															//{ bottle_end = 1; bottle_destroy[i] = 1; }
														}
													}
													else
													{
													if global.training = 2 && bottle_s = i && bottle_destroy[i] = 0
														{
														var hand_xxx, hand_yyy;
														hand_xxx = 800;
														hand_yyy = global.size / 2;
														
														global.training_hand_x = hand_xxx;
														global.training_hand_y = hand_yyy;
														}
													}
												//if bottle_s = i && bottle_stage = 0 && bottle_end = 0
												//	{
												//	if ((bottle_p[i] < 0.6 && bottle_d[i] = 1) or (bottle_p[i] > 0.4 && bottle_d[i] = -1))
												//		{
												//		if ((bottle_p[i] < 1 && bottle_d[i] = 1) or (bottle_p[i] > 0 && bottle_d[i] = -1))
												//			{ bottle_p[i] += bottle_spd[i] * bottle_d[i]; }
												//		}
												//		else
												//		{
												//		if global.training = 2 && bottle_s = i
												//			{
												//			var hand_xxx, hand_yyy;
												//			hand_xxx = global.size / 2;
												//			hand_yyy = 800;
														
												//			global.training_hand_x = hand_xxx;
												//			global.training_hand_y = hand_yyy;
												//			}
												//		}
												//	}
												}
											}
										draw_sprite_ext(bottle_spr, 0, bottle_x[i], global.size / 2 + bottle_y[i] - 50, 0.6 * list_scale, 0.6 * list_scale, 0, c_white, 1 - 0.5 * bottle_destroy[i]);
										draw_sprite_part_ext(bottle_spr, 0, 0, bottle_h - bottle_h * bottle_p[i], bottle_w, bottle_h, bottle_x[i] - bottle_w / 2 * 0.6 + 2, global.size / 2 + bottle_y[i] - 50 + bottle_h / 2 * 0.6 - bottle_w * 0.6 * bottle_p[i], 0.6 * list_scale, 0.6 * list_scale, c_red, 1 - 0.5 * bottle_destroy[i]);
										}
									}
							#endregion
							}
					#endregion 
					}
			#endregion
			#region Движение   - Move
				if theme_round[global.rounds] = 3
					{
					if global.training = 3
						{
						var hand_xxx, hand_yyy;
						hand_xxx = -200;
						hand_yyy = -200;
							
						global.training_hand_x = hand_xxx;
						global.training_hand_y = hand_yyy;
						}
					pre_wait = 0;
					#region Задача 1 - Рука, стрелки, клик
						if round_task[global.rounds,global.task] = 1
							{
							//if global.training = 2 && (global.training_stage[i] = 6
							//or global.training_stage[i] = 7
							//or (global.training_stage[i] = 8 && global.training_question = 0))
								//if global.training = 3
								//	{
								//	var hand_xxx, hand_yyy;
								//	hand_xxx = -200;
								//	hand_yyy = -200;
								//	if global.training_stage[3] = 8 && global.training_question = 0
								//	&& (abs(hand_true[hand_now] - hand_angle) < 30  or abs(hand_true[hand_now] - hand_angle) > 329)
								//		{
								//		hand_xxx = 640 - 250;
								//		hand_yyy = global.size / 2;
									
								//		global.training_hand_x = hand_xxx;
								//		global.training_hand_y = hand_yyy;
								//		}
								//	}
							timer_y = 140;
							#region Координаты и появление
								var x1, y1, y2;
							
								dop_q_y = 0;
							
								x1 = 640;
								y1 = global.size / 2;
							
								y2 = global.size / 2 - 160;
							
								if hand_scale < 1
									{ hand_scale += 0.1; }
							
								if hand_angle < 359
									{ hand_angle += hand_speed; }
									else
									{ hand_angle = 0; }
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if (point_in_rectangle(mouse_x1, mouse_y1, 0, 0, 1280, global.size - 150) && super_now = super_need) or super_now != super_need
											{
											if device_mouse_check_button_pressed(dev, mb_left)
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
												if global.training < 1 or global.training_question > 1
													{
													if hand_now = hand_count
														{
														if ((abs(hand_true[hand_now] - hand_angle) < 30 or abs(hand_true[hand_now] - hand_angle) > 329)) // && hand_red[hand_now] = 0
															{ global.answer = 1; }
															else
															{ global.answer = 0; }
														move_1();
														hand_scale = 0.5;
														}
														else
														{
														if abs(hand_true[hand_now] - hand_angle) < 30 or abs(hand_true[hand_now] - hand_angle) > 329
															{ hand_now += 1; hand_scale = 0.5; }
															else
															{ global.answer = 0; hand_scale = 0.5; move_1(); }
														}
													}
													else
													{
													if global.training_stage[3] = 7 or global.training_stage[3] = 8
														{
														if abs(hand_true[hand_now] - hand_angle) < 30 or abs(hand_true[hand_now] - hand_angle) > 329
															{
															global.answer = 1;
															move_1();
															if global.training_stage[3] = 7
																{ hand_red[1] = 1; }
															if global.training_stage[3] = 8
																{ hand_red[1] = choose(0, 1); }
															if global.training_stage[3] = 7
																{ global.training_stage[3] += 1; }
															hand_scale = 0.5; }
															else
															{ global.training_gb = "TRY AGAIN"; }
														}
													}
												}
											}
										}
									}
							#endregion
							#region Рисование
								#region Обучение
									if global.training = 3
										{
										if (global.training_stage[3] = 6
										or (global.training_stage[3] = 7 && global.training_question = 0)
										or (global.training_stage[3] = 8 && global.training_question = 1))
											{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
											}
									
										//if global.training_stage[1] = 8
										//	{
										//	//global.training_hand_x = hand_xxx;
										//	//global.training_hand_y = hand_yyy;
										//	}
										if mouse_check_button_pressed(mb_left) && global.training_x > 1280 && global.text_sc = 1
											{
											if global.training_stage[3] = 6// or global.training_stage[3] = 7
												{ global.training_stage[3] += 1; }
											}
										if global.training_question = 4
											{
											global.training_stage[3] += 1;
											global.training_hand_s   = 0;
											global.training_question = 0;
											global.text_ne = 1;
											global.text_go = 0;
											}
										}
								#endregion
								for(i=hand_count;i>=1;i--)
									{
									hand_xx[i] = 640 - (hand_now - i) * 100;
									hand_ss[i] = 0;
									if hand_now = i
										{ hand_ss[i] = 0.9; }
									if hand_now = i - 1 or hand_now = i + 1
										{ hand_ss[i] = 0.5; }
									if hand_red[i] = 0
										{ draw_sprite_ext(s_arrow, 0, hand_xx[i], y2, hand_scale * list_scale * hand_ss[i], hand_scale * list_scale * hand_ss[i], hand_true[i] - 90, c_white, hand_ss[i] + 0.1); }
										else
										{ draw_sprite_ext(s_arrow, 0, hand_xx[i], y2, hand_scale * list_scale * hand_ss[i], hand_scale * list_scale * hand_ss[i], hand_true[i] - 90 + 180, c_red, hand_ss[i] + 0.1); }
									}
								draw_sprite_ext(s_hand, 0, x1, y1, hand_scale * list_scale * 0.8, hand_scale * list_scale * 0.8, hand_angle - 90, c_white, 1);
							#endregion
							}
					#endregion
					#region Задача 2 - Рука, градусы, клик
						if round_task[global.rounds,global.task] = 2
							{
							//if global.training = 3
							//	{
							//	var hand_xxx, hand_yyy;
							//	hand_xxx = -200;
							//	hand_yyy = -200;
							//	if global.training_stage[3] = 12 && global.training_question = 0
							//	//&& (abs(hand_true[hand_now] - hand_angle) < 30  or abs(hand_true[hand_now] - hand_angle) > 329)
							//		{
							//		hand_xxx = 640 - 250;
							//		hand_yyy = global.size / 2;
								
							//		global.training_hand_x = hand_xxx;
							//		global.training_hand_y = hand_yyy;
							//		}
							//	}
							timer_y = 140;
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
									{ hand_angle += hand_speed; }
									else
									{ hand_angle = 0; }
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if (point_in_rectangle(mouse_x1, mouse_y1, 0, 0, 1280, global.size - 150) && super_now = super_need) or super_now != super_need
											{
											if device_mouse_check_button_pressed(dev, mb_left)
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
											
												if global.training < 1 or global.training_question != 0
													{
													if abs(hand_true[1] - hand_angle) < 30 or abs(hand_true[1] - hand_angle) > 329
														{ global.answer = 1; }
														else
														{ global.answer = 0; }
													move_2();
													}
													else
													{
													if abs(hand_true[1] - hand_angle) < 30 or abs(hand_true[1] - hand_angle) > 329
														{ global.answer = 1; move_2(); }
														else
														{ global.training_gb = "TRY AGAIN"; }
													}
												}
											}
										}
									}
							#endregion
							#region Рисование
								#region Обучение
									if global.training = 3
										{
										if (global.training_stage[3] = 10 or global.training_stage[3] = 11
										or (global.training_stage[3] = 12 && global.training_question = 0))
											{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
										
											draw_sprite_ext(s_directions, 0, 200, global.size / 2, 0.5, 0.5, 0, global.color_white, 1);
											draw_text_transformed_t(200 + 130, global.size / 2, "0°", list_scale * 0.25, list_scale * 0.25, 0, global.color_white, c_black);
											draw_text_transformed_t(200, global.size / 2 - 130, "90°", list_scale * 0.25, list_scale * 0.25, 0, global.color_white, c_black);
											draw_text_transformed_t(200 - 130, global.size / 2, "180°", list_scale * 0.25, list_scale * 0.25, 0, global.color_white, c_black);
											draw_text_transformed_t(200, global.size / 2 + 130, "270°", list_scale * 0.25, list_scale * 0.25, 0, global.color_white, c_black);
											}
									
										//if global.training_stage[1] = 8
										//	{
										//	//global.training_hand_x = hand_xxx;
										//	//global.training_hand_y = hand_yyy;
										//	}
										if mouse_check_button_pressed(mb_left) && global.training_x > 1280 && global.text_sc = 1
											{
											if global.training_stage[3] = 10 or global.training_stage[3] = 11
												{ global.training_stage[3] = 12; }
											}
										if global.training_question = 3
											{
											global.training_stage[3] += 1;
											global.training_hand_s   = 0;
											global.training_question = 0;
											global.text_ne = 1;
											global.text_go = 0;
											}
										}
								#endregion
								draw_set_font(global.game_font);
								var hand_true2;
								hand_true2 = hand_true[1] + 180;
								if hand_true2 > 360
									{ hand_true2 -= 360; }
								if hand_red[1] = 0
									{ draw_text_transformed_t(x1, y1, string(hand_true[1]) + "°", list_scale * 0.5, list_scale * 0.5, 15, c_white, c_black); }
									else
									{ draw_text_transformed_t(x1, y1, string(hand_true2) + "°", list_scale * 0.5, list_scale * 0.5, 15, c_red, c_black); }
							
								draw_sprite_ext(s_hand, 0, x2, y2, hand_scale * list_scale * 0.8, hand_scale * list_scale * 0.8, hand_angle - 90, c_white, 1);
							#endregion
							}
					#endregion
					#region Задача 3 - Рука, свайп
						if round_task[global.rounds,global.task] = 3
							{
							timer_y = 140;
							#region Координаты и появление
								var x1, y1;
							
								dop_q_y = -70;
							
								x1 = 640;
								y1 = global.size / 2;
							
								if hand_scale < 1
									{ hand_scale += 0.1; }
						
								if hand_angle < hand_true
									{ hand_angle += hand_speed; }
									else
									{ hand_angle = hand_true[hand_now]; }
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if hand_s_t > 0
											{ hand_s_t -= 1; }
											else
											{ hand_s_t = 0; }
							
										if (point_in_rectangle(mouse_x1, mouse_y1, 0, 0, 1280, global.size - 150) && super_now = super_need) or super_now != super_need
											{
											if device_mouse_check_button_pressed(dev, mb_left)
												{
												hand_s_x = mouse_x1;
												hand_s_y = mouse_y1;
												hand_s_t = 50;
												}
											}
								
										if device_mouse_check_button_released(dev, mb_left)
											{
											if point_distance(hand_s_x, hand_s_y, mouse_x1, mouse_y1) < 190
												{ hand_s_t = 0; }
												else
												{
												if hand_s_t > 0
													{
													if global.training < 1
														{
														if hand_now = hand_count
															{
															if global.sound { audio_play_sound(sd_text, 2, 0); }
													
															if abs(hand_true[hand_now] - point_direction(hand_s_x, hand_s_y, mouse_x1, mouse_y1)) < 30 or abs(hand_true[hand_now] - point_direction(hand_s_x, hand_s_y, mouse_x1, mouse_y1)) > 329
																{ global.answer = 1; }
																else
																{ global.answer = 0; }
															move_3();
															hand_scale = 0.5;
															}
															else
															{
															if abs(hand_true[hand_now] - point_direction(hand_s_x, hand_s_y, mouse_x1, mouse_y1)) < 30 or abs(hand_true[hand_now] - point_direction(hand_s_x, hand_s_y, mouse_x1, mouse_y1)) > 329
																{ hand_now += 1; hand_scale = 0.5; }
																else
																{ move_3(); global.answer = 0; hand_scale = 0.5; }
															}
														}
														else
														{
														if global.sound { audio_play_sound(sd_text, 2, 0); }
													
														if abs(hand_true[hand_now] - point_direction(hand_s_x, hand_s_y, mouse_x1, mouse_y1)) < 30 or abs(hand_true[hand_now] - point_direction(hand_s_x, hand_s_y, mouse_x1, mouse_y1)) > 329
															{ global.answer = 1; move_3(); hand_scale = 0.5; }
															else
															{ global.training_gb = "TRY AGAIN"; }
														}
													}
												}
											}
										}
									}
							#endregion
							#region Рисование						
								#region Обучение
									if global.training = 3
										{
										if (global.training_stage[3] = 14 or global.training_stage[3] = 15
										or (global.training_stage[3] = 16 && global.training_question = 0))
											{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
											}
									
										//if global.training_stage[1] = 8
										//	{
										//	//global.training_hand_x = hand_xxx;
										//	//global.training_hand_y = hand_yyy;
										//	}
										if mouse_check_button_pressed(mb_left) && global.training_x > 1280 && global.text_sc = 1
											{
											if global.training_stage[3] = 14 or global.training_stage[3] = 15
												{ global.training_stage[3] += 1; }
											}
										if global.training_question = 3
											{
											global.training_stage[3] = 22;
											global.training_hand_s   = 0;
											global.training_question = 0;
											global.text_ne = 1;
											global.text_go = 0;
											}
										}
								#endregion
								for(i=hand_count;i>=1;i--)
									{
									hand_xx[i] = 640 - (hand_now - i) * 170;
									hand_ss[i] = 0;
									if hand_now = i
										{ hand_ss[i] = 0.9; }
									if hand_now = i - 1 or hand_now = i + 1
										{ hand_ss[i] = 0.5; }
									if hand_red[i] = 0
										{ draw_sprite_ext(s_hand, 0, hand_xx[i], y1, hand_scale * list_scale * hand_ss[i], hand_scale * list_scale * hand_ss[i], hand_true[i] - 90, c_white, hand_ss[i] + 0.1); }
										else
										{ draw_sprite_ext(s_hand, 0, hand_xx[i], y1, hand_scale * list_scale * hand_ss[i], hand_scale * list_scale * hand_ss[i], hand_true[i] - 90 + 180, c_red, hand_ss[i] + 0.1); }
									}
								//draw_sprite_ext(s_hand, 0, x1, y1, hand_scale * list_scale * 0.8, hand_scale * list_scale * 0.8, hand_angle - 90, c_white, 1);
							#endregion
							}
					#endregion
					#region Задача 4 - 
						if round_task[global.rounds,global.task] = 4 && 0
							{
							timer_y = 50;
							#region Координаты
								var test_x1, test_x2, test_y;
								test_x1 = 640 - 180;
								test_x2 = 640 + 180;
								test_y  = global.size / 2 - 60;
							
								pre_wait = 0;
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if point_in_rectangle(mouse_x1, mouse_y1, test_x1 - 150, test_y - 100, test_x1 + 150, test_y + 100) && global.answer = -1
											{
											if mouse_check_button_pressed(mb_left)
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
												global.answer = 1;
												}
											}
										if point_in_rectangle(mouse_x1, mouse_y1, test_x2 - 150, test_y - 100, test_x2 + 150, test_y + 100) && global.answer = -1
											{
											if mouse_check_button_pressed(mb_left)
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
												global.answer = 0;
												}
											}
										}
									}
							#endregion
							#region Рисование
							draw_set_font(global.game_font);
							draw_text_transformed_t(test_x1, test_y, "TRUE" , 0.35 * list_scale, 0.35 * list_scale, 0, global.color_white, c_black);
							draw_text_transformed_t(test_x2, test_y, "MISS" , 0.35 * list_scale, 0.35 * list_scale, 0, c_red, c_black);
						#endregion
							}
					#endregion
					}
			#endregion	
			#region Внимание   - Attention
				if theme_round[global.rounds] = 4
					{
					if global.training = 4
						{
						if global.training_stage[4] = 7
							{ global.training_stage[4] = 8; }
						var hand_xxx, hand_yyy;
						hand_xxx = -200;
						hand_yyy = -200;
							
						global.training_hand_x = hand_xxx;
						global.training_hand_y = hand_yyy;
						}
					#region Задача 1 - Шляпа и напертски
						if round_task[global.rounds,global.task] = 1
							{
							timer_y = 120;
							#region Движение
								var hat_yy, hat_scale;
								hat_yy = global.size / 2 - 30;
								hat_scale = 0.8;
								if hat_stage = 0 && list_scale = 1
									{
									if global.training < 1 or global.training_stage[4] >= 8
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
										{
										hat_x[hat_sha] += hat_spd;
										if hat_x[hat_sha] > hat_xn[hat_sha]
											{ hat_x[hat_sha] = hat_xn[hat_sha]; }
										}
									if hat_x[hat_sha] > hat_xn[hat_sha]
										{
										hat_x[hat_sha] -= hat_spd;
										if hat_x[hat_sha] < hat_xn[hat_sha]
											{ hat_x[hat_sha] = hat_xn[hat_sha]; }
										}
									if hat_x[hat_cha] < hat_xn[hat_cha]
										{
										hat_x[hat_cha] += hat_spd;
										if hat_x[hat_cha] > hat_xn[hat_cha]
											{ hat_x[hat_cha] = hat_xn[hat_cha]; }
										}
									if hat_x[hat_cha] > hat_xn[hat_cha]
										{
										hat_x[hat_cha] -= hat_spd;
										if hat_x[hat_cha] < hat_xn[hat_cha]
											{ hat_x[hat_cha] = hat_xn[hat_cha]; }
										}
								
									if hat_x[hat_sha] = hat_xn[hat_sha] && hat_x[hat_cha] = hat_xn[hat_cha]
										{
										if hat_num < hat_max
											{ hat_num +=1; hat_stage = 1; }
											else
											{ hat_stage = 3; pre_wait = 0; }
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
							if hat_stage = 3 && global.super_ability = 0 && list_scale = 1
								{
								//hat_x[2] - 120 * hat_scale
								//if global.training < 1 or (global.training_question != 0)
								for(dev=0;dev<5;dev++)
									{
									mouse_x1 = device_mouse_x(dev);
									mouse_y1 = device_mouse_y(dev);
									if device_mouse_check_button_released(dev, mb_left)
										{
										if global.training < 1 or (global.training_question != 0)
											{
											if point_in_rectangle(mouse_x1, mouse_y1, hat_x[2] - 120 * hat_scale, hat_yy - 200 * hat_scale, hat_x[2] + 120 * hat_scale, hat_yy + hat_y[2] + 200 * hat_scale)
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
												hat_end = 2;
												hat_res = 1;
												hat_stage = 4;
												}
											if point_in_rectangle(mouse_x1, mouse_y1, hat_x[1] - 120 * hat_scale, hat_yy - 200 * hat_scale, hat_x[1] + 120 * hat_scale, hat_yy + hat_y[1] + 200 * hat_scale)
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
												hat_end = 1;
												hat_res = 0;
												hat_stage = 4;
												}
											if point_in_rectangle(mouse_x1, mouse_y1, hat_x[3] - 120 * hat_scale, hat_yy - 200 * hat_scale, hat_x[3] + 120 * hat_scale, hat_yy + hat_y[3] + 200 * hat_scale)
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
												hat_end = 3;
												hat_res = 0;
												hat_stage = 4;
												}
											}
											else
											{
											if point_in_rectangle(mouse_x1, mouse_y1, hat_x[2] - 120 * hat_scale, hat_yy - 200 * hat_scale, hat_x[2] + 120 * hat_scale, hat_yy + hat_y[2] + 200 * hat_scale)
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
												hat_end = 2;
												hat_res = 1;
												hat_stage = 4;
												}
											if point_in_rectangle(mouse_x1, mouse_y1, hat_x[1] - 120 * hat_scale, hat_yy - 200 * hat_scale, hat_x[1] + 120 * hat_scale, hat_yy + hat_y[1] + 200 * hat_scale)
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
												global.training_gb = "TRY AGAIN";
												}
											if point_in_rectangle(mouse_x1, mouse_y1, hat_x[3] - 120 * hat_scale, hat_yy - 200 * hat_scale, hat_x[3] + 120 * hat_scale, hat_yy + hat_y[3] + 200 * hat_scale)
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
												global.training_gb = "TRY AGAIN";
												}
											}
										}
									}
								}
							#endregion
							#region Рисование
								#region Обучение
									if global.training = 4
										{
										if (global.training_stage[4] = 6 or global.training_stage[4] = 7
										or (global.training_stage[4] = 8 && global.training_question = 0))
											{
											if hat_stage = 3
												{
												global.training_hand_x = hat_x[2] - 120 * hat_scale + 100;
												global.training_hand_y = hat_yy - 200 * hat_scale + 200;
												}
										
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
											}
									
										//if global.training_stage[1] = 8
										//	{
										//	//global.training_hand_x = hand_xxx;
										//	//global.training_hand_y = hand_yyy;
										//	}
										if mouse_check_button_pressed(mb_left) && global.training_x > 1280 && global.text_sc = 1
											{
											if global.training_stage[4] = 6// or global.training_stage[3] = 7
												{ global.training_stage[4] += 1; }
											}
										if global.training_question = 3
											{
											global.training_stage[4] += 1;
											global.training_hand_s   = 0;
											global.training_question = 0;
											global.text_ne = 1;
											global.text_go = 0;
											}
										}
								#endregion
								draw_sprite_ext_t(s_hat, 1, hat_x[2], hat_yy, hat_s[2] * hat_scale * list_scale, hat_s[2] * hat_scale * list_scale, 0, c_white, 1, c_white, c_black);
							
								draw_sprite_ext(s_hat, 0, hat_x[1], hat_yy - hat_y[1], hat_s[1] * hat_scale * list_scale, hat_s[1] * hat_scale * list_scale, 0, c_white, hat_alpha[1]);
								draw_sprite_ext(s_hat, 0, hat_x[2], hat_yy - hat_y[2], hat_s[2] * hat_scale * list_scale, hat_s[2] * hat_scale * list_scale, 0, c_white, hat_alpha[2]);
								draw_sprite_ext(s_hat, 0, hat_x[3], hat_yy - hat_y[3], hat_s[3] * hat_scale * list_scale, hat_s[3] * hat_scale * list_scale, 0, c_white, hat_alpha[3]);
							#endregion
							}
					#endregion
					#region Задача 2 - Камень, ножницы и чё там
						if round_task[global.rounds,global.task] = 2
							{
							timer_y = 150;
							pre_wait = 0;
							#region Координаты
								var x1, y1, y2;
						
								x1 = 640;
								y1 = global.size / 2 - 140;
								y2 = global.size / 2 + 35;
							
								if hand_sign_scale < 1
									{ hand_sign_scale += 0.1; }
								
								if global.training <1 or (global.training_stage[4] = 12 && global.training_question = 0)
									{
									var nd;
									nd = 0;
									for(j=1;j<=3;j++)
										{
										if nd = 0
											{
											if hand_sign[1] = 0
												{
												if hand_sign_z[1,j] = 2
													{ nd = j; }
												}
											if hand_sign[1] = 1
												{
												if hand_sign_z[1,j] = 0
													{ nd = j; break; }
												}
											if hand_sign[hand_sign_now] = 2
												{
												if hand_sign_z[1,j] = 1
													{ nd = j; break; }
												}
											}
										}
								
									if nd != 0
										{
										hand_xxx = 640 - 340 + 170 * nd;
										hand_yyy = y2;
										}
										else
										{
										hand_xxx = -200;
										hand_yyy = -200;
										}
									global.training_hand_x = hand_xxx;
									global.training_hand_y = hand_yyy;
									}
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if mouse_check_button_pressed(mb_left)
											{
											if global.sound { audio_play_sound(sd_text, 2, 0); }
										
											for(j=1;j<=3;j++)
												{
												if point_in_rectangle(mouse_x1, mouse_y1, 640 - 340 + 170 * j - 65, y2 - 65, 640 - 340 + 170 * j + 65, y2 + 65)
													{
													if global.training < 1 or global.training_question != 0
														{
														hand_sign_c[j]  = 0.7;
														hand_sign_scale = 0.5;
														if hand_sign_red[hand_sign_now] = 0
															{
															#region Если не красный
																if hand_sign[hand_sign_now] = 0
																	{
																	if (hand_sign_z[hand_sign_now,j] = 2 && hand_sign_r[hand_sign_now] = 0) or (hand_sign_z[hand_sign_now,j] = 1 && hand_sign_r[hand_sign_now] = 1)
																		{ hand_sign_now += 1; }
																		else
																		{
																		global.answer = 0;
																		attention_2();
																		}
																	break;
																	}
																if hand_sign[hand_sign_now] = 1
																	{
																	if (hand_sign_z[hand_sign_now,j] = 0 && hand_sign_r[hand_sign_now] = 0) or (hand_sign_z[hand_sign_now,j] = 2 && hand_sign_r[hand_sign_now] = 1)
																		{ hand_sign_now += 1; }
																		else
																		{
																		global.answer = 0;
																		attention_2();
																		}
																	break;
																	}
																if hand_sign[hand_sign_now] = 2
																	{
																	if (hand_sign_z[hand_sign_now,j] = 1 && hand_sign_r[hand_sign_now] = 0) or (hand_sign_z[hand_sign_now,j] = 0 && hand_sign_r[hand_sign_now] = 1)
																		{ hand_sign_now += 1; }
																		else
																		{
																		global.answer = 0;
																		attention_2();
																		}
																	break;
																	}
															#endregion
															}
															else
															{
															#region Если красный
																if hand_sign[hand_sign_now] = 0
																	{
																	if (hand_sign_z[hand_sign_now,j] = 1 && hand_sign_r[hand_sign_now] = 0) or (hand_sign_z[hand_sign_now,j] = 2 && hand_sign_r[hand_sign_now] = 1)
																		{ hand_sign_now += 1; }
																		else
																		{
																		global.answer = 0;
																		attention_2();
																		}
																	break;
																	}
																if hand_sign[hand_sign_now] = 1
																	{
																	if (hand_sign_z[hand_sign_now,j] = 2 && hand_sign_r[hand_sign_now] = 0) or (hand_sign_z[hand_sign_now,j] = 0 && hand_sign_r[hand_sign_now] = 1)
																		{ hand_sign_now += 1; }
																		else
																		{
																		global.answer = 0;
																		attention_2();
																		}
																	break;
																	}
																if hand_sign[hand_sign_now] = 2
																	{
																	if (hand_sign_z[hand_sign_now,j] = 0 && hand_sign_r[hand_sign_now] = 0) or (hand_sign_z[hand_sign_now,j] = 1 && hand_sign_r[hand_sign_now] = 1)
																		{ hand_sign_now += 1; }
																		else
																		{
																		global.answer = 0;
																		attention_2();
																		}
																	break;
																	}
															#endregion
															}
														}
														else
														{
														#region Обучение
															if hand_sign[hand_sign_now] = 0
																{
																if (hand_sign_z[hand_sign_now,j] = 2 && hand_sign_r[hand_sign_now] = 0) or (hand_sign_z[hand_sign_now,j] = 1 && hand_sign_r[hand_sign_now] = 1)
																	{ hand_sign_now += 1; }
																	else
																	{ global.training_gb = "TRY AGAIN"; }
																}
															if hand_sign[hand_sign_now] = 1
																{
																if (hand_sign_z[hand_sign_now,j] = 0 && hand_sign_r[hand_sign_now] = 0) or (hand_sign_z[hand_sign_now,j] = 2 && hand_sign_r[hand_sign_now] = 1)
																	{ hand_sign_now += 1; }
																	else
																	{ global.training_gb = "TRY AGAIN"; }
																}
															if hand_sign[hand_sign_now] = 2
																{
																if (hand_sign_z[hand_sign_now,j] = 1 && hand_sign_r[hand_sign_now] = 0) or (hand_sign_z[hand_sign_now,j] = 0 && hand_sign_r[hand_sign_now] = 1)
																	{ hand_sign_now += 1; }
																	else
																	{ global.training_gb = "TRY AGAIN"; }
																}
														#endregion
														}
													}
													else
													{ hand_sign_c[j] = 0.65; }
												}
											if hand_sign_now > hand_sign_count
												{
												global.answer = 1;
												attention_2();
												}
											}
										}
									}
							#endregion
							#region Рисование
								#region Обучение
									if global.training = 4
										{
										if (global.training_stage[4] = 10 or global.training_stage[4] = 11
										or (global.training_stage[4] = 12 && global.training_question = 0))
											{
											if hat_stage = 3
												{
												global.training_hand_x = hat_x[2] - 120 * hat_scale + 100;
												global.training_hand_y = hat_yy - 200 * hat_scale + 200;
												}
										
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
											}
									
										//if global.training_stage[1] = 8
										//	{
										//	//global.training_hand_x = hand_xxx;
										//	//global.training_hand_y = hand_yyy;
										//	}
										if mouse_check_button_pressed(mb_left) && global.training_x > 1280 && global.text_sc = 1
											{
											if global.training_stage[4] = 10 or global.training_stage[4] = 11
												{ global.training_stage[4] += 1; }
											}
										if global.training_question = 3
											{
											global.training_stage[4] = 14;
											global.training_hand_s   = 0;
											global.training_question = 0;
											global.text_ne = 1;
											global.text_go = 0;
											}
										}
								#endregion
								if global.training_stage[4] > 11 or global.training < 1
									{
									for(i=hand_sign_count;i>=1;i--)
										{
										hand_sign_xx[i] = 640 - (hand_sign_now - i) * 170;
										hand_sign_ss[i] = 0;
								
										if hand_sign_now = i
											{ hand_sign_ss[i] = 0.9; }
										if hand_sign_now = i - 1 or hand_sign_now = i + 1
											{ hand_sign_ss[i] = 0.5; }
								
										if hand_sign_red[i] = 0
											{ draw_sprite_ext(s_sign_hand, hand_sign[i], hand_sign_xx[i], y1, hand_sign_scale * list_scale * hand_sign_ss[i], hand_sign_scale * list_scale * hand_sign_ss[i], 0, c_white, hand_sign_ss[i] + 0.1); }
											else
											{ draw_sprite_ext(s_sign_hand, hand_sign[i], hand_sign_xx[i], y1, hand_sign_scale * list_scale * hand_sign_ss[i], hand_sign_scale * list_scale * hand_sign_ss[i], 0, c_red,   hand_sign_ss[i] + 0.1); }
								
										if i = hand_sign_now
											{
											for(j=1;j<=3;j++)
												{
												if hand_sign_r[i] = 0
													{
													draw_sprite_ext_t(s_question_sign, 0, 640 - 340 + 170 * j, y2, list_scale * hand_sign_c[i], list_scale * hand_sign_c[i], 0, c_white, 1, c_white, c_black);
													draw_sprite_ext(s_sign_hand, hand_sign_z[i,j], 640 - 340 + 170 * j, y2, list_scale * hand_sign_c[i], list_scale * hand_sign_c[i], 0, c_white, 1);
													}
													else
													{
													draw_sprite_ext_t(s_question_sign, 4, 640 - 340 + 170 * j, y2, list_scale * hand_sign_c[i], list_scale * hand_sign_c[i], 0, c_white, 1, c_white, c_black);
													draw_sprite_ext(s_sign_hand, hand_sign_z[i,j], 640 - 340 + 170 * j, y2, list_scale * hand_sign_c[i], list_scale * hand_sign_c[i], 0, c_red, 1);
													}
												//draw_rectangle(640 - 340 + 170 * j - 65, y2 - 65, 640 - 340 + 170 * j + 65, y2 + 65, 1);
												}
											}
										}
									}
									else
									{
									if global.training_stage[4] = 11 or global.training_stage[4] = 10
										{ draw_sprite_ext(s_sign_hand2, 0, 640, global.size / 2, list_scale, list_scale, 0, c_white, 1); }
									}
							#endregion
							}
					#endregion
					#region Задача 3 - Конь, заборы
						if round_task[global.rounds,global.task] = 3
							{
							timer_y = 180;
							#region Координаты и появление
								var x0, x1, y0, hn, ho;
								pre_wait = 0
								for(i=0;i<=6;i++)
									{
									horse_y[i] = global.size / 2 + 60 - 60 * i;
									}
								hn = 0;
								ho = 0;
								for(i=1;i<=horse_count;i++)
									{
									if horse_n[i] != 0
										{
										hn = horse_n[i];
										ho = i;
										}
									}
								if horse_yy < ho * 60 && horse_death = 0
									{ horse_yy += ho * 5; }
							
								x0 = 640;
								y0 = horse_y[horse_now];
							
								if horse_death = 1
									{
									if horse_death_y > - 10
										{ horse_death_y -= 4; horse_death_a -= 10; }
										else
										{ horse_death = 3; }
									}
								if horse_death = 3
									{
									horse_death_y += 20;
									if horse_death_y > 100
										{
										global.answer = 0;
										attention_3();
										}
									}
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if (point_in_rectangle(mouse_x1, mouse_y1, 0, 0, 1280, global.size - 150) && super_now = super_need) or super_now != super_need
											{
											if device_mouse_check_button_pressed(dev, mb_left) && horse_death = 0
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
											
												if global.training < 1 or global.training_question > 1
													{
													var dir;
													if mouse_x1 < 640
														{ dir = -1; }
														else
														{ dir = 1; }
												
													for(i=1;i<=horse_count;i++)
														{
														if horse_n[i] = 0
															{
															horse_now += 1;
															horse_n[i] = dir;
															if horse_p[i] = dir
																{
																horse_death = 1;
																//global.answer = 0;
																//move_4();
																}
																else
																{
																if horse_now = horse_count
																	{
																	global.answer = 1;
																	attention_3();
																	}
																}
															break;
															}
														}
													}
													else
													{
													if global.training_stage[4] = 15 or global.training_stage[4] = 16
														{
														var dir;
														if mouse_x1 < 640
															{ dir = -1; }
															else
															{ dir = 1; }
												
														for(i=1;i<=horse_count;i++)
															{
															if horse_n[i] = 0
																{
																//horse_now += 1;
																//horse_n[i] = dir;
																if horse_p[i] = dir
																	{
																	global.training_gb = "TRY AGAIN";
																	//horse_death = 1;
																	}
																	else
																	{
																	horse_now += 1;
																	horse_n[i] = dir;
																	if horse_now = horse_count
																		{
																		global.answer = 1;
																		attention_3();
																		if global.training_stage[4] = 15
																			{ horse_red[1] = -1; horse_red[3] = -1; global.training_stage[4] = 16; }
																		}
																	}
																break;
																}
															}
												
														//var dir;
														//if mouse_x1 < 640
														//	{ dir = -1; }
														//	else
														//	{ dir = 1; }
													
														//for(i=1;i<=horse_count;i++)
														//	{
														//	if horse_p[i] != dir
														//		{
														//		if horse_n[i] = 0
														//			{
														//			horse_now += 1;
														//			horse_n[i] = dir;
														//			if horse_now = horse_count
														//				{
														//				global.answer = 1;
														//				attention_3();
														//				if global.training_stage = 15
														//					{ horse_red[1] = 1; horse_red[3] = 1; global.training_stage = 16; }
														//				}
														//			break;
														//			}
														//		}
														//		else
														//		{
														//		global.training_gb = "TRY AGAIN";
														//		break;
														//		}
														//	}
														}
													}
												}
											}
										}
									}
							#endregion
							#region Рисование
								#region Обучение
									if global.training = 4
										{
										if (global.training_stage[4] = 14
										or (global.training_stage[4] = 15 && global.training_question = 0)
										or (global.training_stage[4] = 16 && global.training_question = 1))
											{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
											}
									
										//if global.training_stage[1] = 8
										//	{
										//	//global.training_hand_x = hand_xxx;
										//	//global.training_hand_y = hand_yyy;
										//	}
										if mouse_check_button_pressed(mb_left) && global.training_x > 1280 && global.text_sc = 1
											{
											if global.training_stage[4] = 14 // or global.training_stage[4] = 15
												{ global.training_stage[4] += 1; }
											}
										if global.training_question = 4
											{
											global.training_stage[4] = 22;
											global.training_hand_s   = 0;
											global.training_question = 0;
											global.text_ne = 1;
											global.text_go = 0;
											}
										if (global.training_question = 0 && global.training_stage[4] = 15) or (global.training_question = 1 && global.training_stage[4] = 16)
											{
											if horse_now + 1 <= horse_count
												{
												hand_xxx = 640 - horse_p[horse_now+1] * 180;
												hand_yyy = global.size / 2;
												}
											}
										global.training_hand_x = hand_xxx;
										global.training_hand_y = hand_yyy;
										}
								#endregion
								for(i=horse_count;i>=1;i--)
									{
									var hral;
									if horse_y[i] + horse_yy > global.size / 2 + 80
										{
										hral = 1 - abs(global.size / 2 + 80 - horse_y[i] - horse_yy) / 80;
										if hral < 0
											{ hral = 0; }
										}
										else
										{ hral = 1; }
								
									//if (global.training_stage[4] = 16 && global.training_question = 1)
									//	{ horse_red[1] = -1; horse_red[3] = -1; }
								
									if horse_red[i] = 1
										{ draw_sprite_ext(s_fence, 0, x0 + 60 * horse_p[i], horse_y[i] + horse_yy, list_scale, list_scale, 0, c_white, hral); }
										else
										{ draw_sprite_ext(s_fence, 0, x0 - 60 * horse_p[i], horse_y[i] + horse_yy, list_scale, list_scale, 0, c_red, hral); }
									if horse_now = i && horse_death = 0
										{ draw_sprite_ext(s_horse, horse_death, x0 + 60 * hn, y0 + horse_yy, list_scale, list_scale, horse_death_a, c_white, 1); }
									}
								if horse_now = 0 or horse_death != 0
									{ draw_sprite_ext(s_horse, horse_death, x0 + 60 * hn, y0 + horse_yy + horse_death_y, list_scale, list_scale, horse_death_a, c_white, 1); }
							#endregion
							}
					#endregion
					#region Задача 4 -
						if round_task[global.rounds,global.task] = 4 && 0
							{
							timer_y = 50;
							#region Координаты
								var test_x1, test_x2, test_y;
								test_x1 = 640 - 180;
								test_x2 = 640 + 180;
								test_y  = global.size / 2 - 60;
									
								pre_wait = 0;
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if point_in_rectangle(mouse_x1, mouse_y1, test_x1 - 150, test_y - 100, test_x1 + 150, test_y + 100) && global.answer = -1
											{
											if mouse_check_button_pressed(mb_left)
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
												global.answer = 1;
												}
											}
										if point_in_rectangle(mouse_x1, mouse_y1, test_x2 - 150, test_y - 100, test_x2 + 150, test_y + 100) && global.answer = -1
											{
											if mouse_check_button_pressed(mb_left)
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
												global.answer = 0;
												}
											}
										}
									}
							#endregion
							#region Рисование
							draw_set_font(global.game_font);
							draw_text_transformed_t(test_x1, test_y, "TRUE" , 0.35 * list_scale, 0.35 * list_scale, 0, global.color_white, c_black);
							draw_text_transformed_t(test_x2, test_y, "MISS" , 0.35 * list_scale, 0.35 * list_scale, 0, c_red, c_black);
						#endregion
							}
					#endregion
					}
			#endregion
			#region Карты	   - Cards
				if theme_round[global.rounds] = 1
					{
					#region Задача 1 - Карты, найти пару
						if round_task[global.rounds,global.task] = 1
							{
							timer_y  = 0;//50;
							#region Координаты
								var card_x, card_y;
								card_x = 640 - 70 - 70 * (card_all == 3);
								card_y = global.size / 2 - 60 - 50;
								if global.training = 1
									{
									var hand_xxx, hand_yyy;
									hand_xxx = -200;
									hand_yyy = -200;
									}
								if list_scale = 1
									{
									if card_time > -1
										{
										if card_time > 0
											{
											if global.training < 1 or global.training_stage[1] = 8
												{ card_time -= 1; }
											for(i=1;i<=2;i++)
												{
												for(j=1;j<=card_all;j++)
													{
													card_now[i,j]   = 3;
													card_i[i,j]     = card_m[i,j];
													card_scale[i,j] = 0.7;
													}
												}
											}
											else
											{
											for(i=1;i<=2;i++)
												{
												for(j=1;j<=card_all;j++)
													{ card_now[i,j] = 4; }
												}
											card_time = -1;
											}
										}
										else
										{ pre_wait = 0; }
									}
							#endregion
							#region Ответ
									if card_time = -1 && list_scale = 1
										{
										for(i=1;i<=2;i++)
											{
											for(j=1;j<=3;j++)
												{
												for(dev=0;dev<5;dev++)
													{
													if global.training = 1 && global.training_stage[1] = 8 && hand_xxx = -200
														{
														if (i = 1 && j = 1) && global.training_hand_s = 0
															{
															hand_xxx = card_x;
															hand_yyy = card_y + card_yy[i,j];
															//hand_xxx = card_x + (j-1) * 140;
															//hand_yyy = card_y + 180 * (i-1) + card_yy[i,j];
															}
														if ((card_m[1,2] = card_m[1,1] && i = 1 && j = 2)
														or (card_m[2,1] = card_m[1,1] && i = 2 && j = 1)
														or (card_m[2,2] = card_m[1,1] && i = 2 && j = 2))
														&& global.training_hand_s = 1
															{
															hand_xxx = card_x + (j-1) * 140;
															hand_yyy = card_y + 180 * (i-1) + card_yy[i,j];
															}
														if ((card_now[1,2] = 0 && i = 1 && j = 2)
														or (card_now[2,1] = 0 && i = 2 && j = 1)
														or (card_now[2,2] = 0 && i = 2 && j =2)) && global.training_hand_s = 2
															{
															hand_xxx = card_x + (j-1) * 140;
															hand_yyy = card_y + 180 * (i-1) + card_yy[i,j];
															}
														if ((card_now[1,2] = 0 && i = 1 && j = 2)
														or (card_now[2,1] = 0 && i = 2 && j = 1)
														or (card_now[2,2] = 0 && i = 2 && j =2)) && global.training_hand_s = 3
															{
															hand_xxx = card_x + (j-1) * 140;
															hand_yyy = card_y + 180 * (i-1) + card_yy[i,j];
															}
														global.training_hand_x = hand_xxx;
														global.training_hand_y = hand_yyy;
														}
													//global.training_hand_s
													mouse_x1 = device_mouse_x(dev);
													mouse_y1 = device_mouse_y(dev);
													if point_in_rectangle(mouse_x1, mouse_y1, card_x + (j-1) * 140 - 75 * card_scale[i,j], card_y + 180 * (i-1) - 110 * card_scale[i,j], card_x + (j-1) * 140 + 75 * card_scale[i,j], card_y + 180 * (i-1) + 110 * card_scale[i,j])
														{
														if device_mouse_check_button_pressed(dev, mb_left) && card_now[i,j] = 0 && card_end[i,j] = 0 && global.super_ability = 0 && list_scale > 0
															{
															if global.training = 1
																{
																if global.training_stage[1] = 8
																	{
																	if global.training_hand_s = 0
																		{
																		if !(i = 1 && j = 1)
																			{ break; }
																		}
																	if global.training_hand_s = 1
																		{
																		if !((i = 1 && j = 2 && card_m[1,1] = card_m[1,2])
																		or (i = 2 && j = 1 && card_m[1,1] = card_m[2,1])
																		or (i = 2 && j = 2 && card_m[1,1] = card_m[2,2]))
																			{ break; }
																		}
																	global.training_hand_s += 1;
																	}
																	else
																	{ break; }
																}
															if global.sound { audio_play_sound(sd_text, 2, 0); }
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
									if card_end[1,1] = 1 && card_end[1,2] = 1
									&& card_end[2,1] = 1 && card_end[2,2] = 1 && ((card_end[2,3] = 1 && card_end[1,3] = 1) or card_all = 2)
										{
										global.answer = 1;
										cards_1();
										}
									}
							#endregion
							#region Рисование
								#region Обучение
									if global.training = 1
										{
										if (global.training_stage[1] = 6 or global.training_stage[1] = 7
										or (global.training_stage[1] = 8 && global.training_question = 0))
											{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
											}
									
										//if global.training_stage[1] = 8
										//	{
										//	//global.training_hand_x = hand_xxx;
										//	//global.training_hand_y = hand_yyy;
										//	}
										if mouse_check_button_pressed(mb_left) && global.training_x > 1280 && global.text_sc = 1
											{
											if global.training_stage[1] = 6 or global.training_stage[1] = 7
												{ global.training_stage[1] += 1; }
											}
										if global.training_question = 3
											{
											global.training_stage[1] += 1;
											global.training_hand_s   = 0;
											global.training_question = 0;
											global.text_ne = 1;
											global.text_go = 0;
											}
										}
								#endregion
								for(i=1;i<=2;i++)
									{
									for(j=1;j<=card_all;j++)
										{
										draw_sprite_ext(s_card, card_i[i,j], card_x + (j-1) * 140, card_y + 180 * (i-1) + card_yy[i,j], card_scale[i,j] * list_scale, 0.7, 0, c_white, card_alp[i,j]);
										}
									}
							#endregion
							}
					#endregion
					#region Задача 2 - Карты, найти карту
						if round_task[global.rounds,global.task] = 2
							{
							timer_y  = 0;
							#region Координаты
								var card_x, card_y;
								card_x = 640 - 70 - 70 * (card_all == 3);
								card_y = global.size / 2 - 60 - 50;
							
								if global.training = 1
									{
									var hand_xxx, hand_yyy;
									hand_xxx = -200;
									hand_yyy = -200;
									}
							
								if list_scale = 1
									{
									if card_time > -1 && list_scale = 1
										{
										if card_time > 0
											{
											if global.training < 1 or (global.training_stage[1] = 12 or global.training_stage[1] = 13)
												{ card_time -= 1; }
											for(i=1;i<=2;i++)
												{
												for(j=1;j<=card_all;j++)
													{
													card_now[i,j]   = 3;
													card_i[i,j]     = card_m[i,j];
													card_scale[i,j] = 0.7
													}
												}
											}
											else
											{
											for(i=1;i<=2;i++)
												{
												for(j=1;j<=card_all;j++)
													{ card_now[i,j] = 4; }
												}
											card_time = -2;
											}
										}
										//else
										//{ pre_wait = 0; }
									if card_time = -3
										{
										if card_find_s < 1
											{
											card_find_s += 0.1;
											card_find_a -= 0.5;
											}
											else
											{
											if global.training < 1 or (global.training_stage[1] = 12 or global.training_stage[1] = 13)
												{
												if card_find_time > 0
													{
													card_find_time -= 1;
													card_find_s += 0.005;
													card_find_a -= 0.05;
													}
													else
													{ card_time = -4; }
												}
											}
										}
									if card_time = -4
										{
										if global.training < 1 or global.training_stage[1] = 13
											{
											if card_find_s > 0
												{
												card_find_s -= 0.1;
												card_find_a += 1;
											
												global.training_hand_s = 0;
												}
												else
												{
												card_time   = -1;
												pre_wait    = 0;
												card_find_s = 0;
												}
											}
										}
									}
								if global.training_stage[1] = 13 && global.training_question = 0
									{
									for(i=1;i<=2;i++)
										{
										for(j=1;j<=card_all;j++)
											{
											if ((card_m[i,j] = card_find && fir_i != i && fir_j != j)) && hand_xxx = -200 //if (card_m[i,j] = card_find && fir_i != i && fir_j != j) && global.training_question = 0 && hand_xxx = -200
												{
												hand_xxx = card_x + (j-1) * 140;
												hand_yyy = card_y + 180 * (i-1) + card_yy[i,j];
											
												global.training_hand_x = hand_xxx;
												global.training_hand_y = hand_yyy;
												}
											}
										}
									}
							#endregion
							#region Ответ
									if card_time = -1 or card_time = -2 && list_scale = 1
										{
										for(i=1;i<=2;i++)
											{
											for(j=1;j<=card_all;j++)
												{
												//if global.training = 1 && global.training_question = 0
												//	{
												//	if ((card_m[i,j] = card_find && fir_i != i && fir_j != j) or (fir_i != 0 && fir_j != 0)) && hand_xxx = -200// && global.training_hand_s = 0 && hand_xxx = -200
												//		{
												//		hand_xxx = card_x + (j-1) * 140;
												//		hand_yyy = card_y + 180 * (i-1) + card_yy[i,j];
												//		global.training_hand_x = hand_xxx;
												//		global.training_hand_y = hand_yyy;
												//		}
												//	}
												for(dev=0;dev<5;dev++)
													{
													mouse_x1 = device_mouse_x(dev);
													mouse_y1 = device_mouse_y(dev);
													if point_in_rectangle(mouse_x1, mouse_y1, card_x + (j-1) * 140 - 75 * card_scale[i,j], card_y + 180 * (i-1) - 110 * card_scale[i,j], card_x + (j-1) * 140 + 75 * card_scale[i,j], card_y + 180 * (i-1) + 110 * card_scale[i,j])
														{
														if device_mouse_check_button_pressed(dev, mb_left) && card_time = -1 && card_now[i,j] = 0 && card_end[i,j] = 0 && global.super_ability = 0 && list_scale > 0
															{
															if global.training = 1 && global.training_question = 0
																{
																if global.training_stage[1] = 13
																	{
																	if global.training_hand_s = 0
																		{
																		if card_m[i,j] != card_find
																			{ break; }
																		}
																	if global.training_hand_s = 1
																		{
																		if card_m[fir_i,fir_j] != card_m[i,j]
																			{ break; }
																		}
																	global.training_hand_s += 1;
																	}
																	else
																	{ break; }
																}
																//else
																//{
														
																//}
														
															if global.sound { audio_play_sound(sd_text, 2, 0); }
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
														if card_i[i,j] = card_find
															{ card_have += 1; }
															else
															{ global.answer = 0; cards_2(); break; }
														if sec_i != 0 && card_scale[sec_i,sec_j] = 0.7
															{
															if card_m[fir_i,fir_j] = card_m[sec_i,sec_j]
																{
																if card_have = 2
																	{ global.answer = 1; cards_2(); break; }
																card_end[fir_i,fir_j] = 1;
																card_end[sec_i,sec_j] = 1;
																}
																else
																{
																if card_have = 1 or card_have = 0
																	{ global.answer = 0; cards_2(); break; }
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
														{
														card_now[i,j] = 0;
														if card_time = -2
															{ card_time = -3; }
														}
													}
										
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
									}
							#endregion
							#region Рисование
								#region Обучение
									if global.training = 1
										{
										if (global.training_stage[1] = 10 or global.training_stage[1] = 11
										or global.training_stage[1] = 12 or (global.training_stage[1] = 13 && global.training_question = 0))
											{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
											}
									
										//if global.training_stage[1] = 8
										//	{
										//	//global.training_hand_x = hand_xxx;
										//	//global.training_hand_y = hand_yyy;
										//	}
										if mouse_check_button_pressed(mb_left) && global.training_x > 1280 && global.text_sc = 1
											{
											if global.training_stage[1] = 10 or global.training_stage[1] = 11 or (global.training_stage[1] = 12 && card_find_s >= 1)
												{ global.training_stage[1] += 1; }
											}
										if global.training_question = 3
											{
											global.training_stage[1] += 1;
											global.training_hand_s   = 0;
											global.training_question = 0;
											global.text_ne = 1;
											global.text_go = 0;
										
											//round_task[global.rounds,1] += 1;
											}
										}
								#endregion
								for(i=1;i<=2;i++)
									{
									for(j=1;j<=card_all;j++)
										{
										draw_sprite_ext(s_card, card_i[i,j], card_x + (j-1) * 140, card_y + 180 * (i-1) + card_yy[i,j], card_scale[i,j] * list_scale, 0.7, 0, c_white, card_alp[i,j]);
										}
									}
								draw_sprite_ext(s_card, card_find, card_x + 70 + 70 * (card_all == 3), card_y + 90, card_find_s * 0.7 * list_scale, card_find_s * 0.7 * list_scale, card_find_a, c_white, 1);
							#endregion
							}
					#endregion
					#region Задача 3 - Карты, порядок
						if round_task[global.rounds,global.task] = 3
							{
							timer_y = -20;
							#region Координаты
								var card_x, card_y;
								card_x = 640;
								card_y = global.size / 2 - 70;
							
								if global.training = 1
									{
									var hand_xxx, hand_yyy;
									hand_xxx = -200;
									hand_yyy = -200;
									}
							
								#region Старое
								//if list_scale = 1
								//	{
								//	for(i=cards_all;i>=1;i--)
								//		{
								//		if cards_s[i] = 0
								//			{
								//			if cards_i[i] = 0
								//				{
								//				cards_x[i] += (18 - cards_time);
								//				if cards_ss[i] > 0
								//					{ cards_ss[i] -= 1 / cards_time; }
								//					else
								//					{ cards_i[i] = cards_m[i]; }
								//				}
								//				else
								//				{
								//				if cards_ss[i] < 1
								//					{ cards_ss[i] += 1 / cards_time; cards_x[i] += (18 - cards_time); }
								//					else
								//					{
								//					cards_s[i] = 1;
								//					}
								//				}
								//			break;
								//			}
								//		if cards_s[i] = 1 && cards_s[1] = 1
								//			{
								//			if cards_x[i] < cards_n[i]
								//				{
											
								//				}
								//			}
								//		//cards_y[i] = 0;
								//		//cards_n[i] = 0;
								//		}
									#endregion
								if list_scale = 1
									{
									for(i=1;i<=cards_all;i++)
										{
										if cards_s[i] = 0
											{
											if cards_i[i] = 0
												{
												if cards_ss[i] > 0
													{ cards_ss[i] -= 1 / 5; }
													else
													{ cards_i[i] = cards_m[i]; }
												}
												else
												{
												if cards_ss[i] < 1
													{ cards_ss[i] += 1 / 5; }
													else
													{ cards_s[i] = 1; }
												}
											break;
											}
										if cards_s[i] = 1 && cards_s[cards_all] = 1
											{
											if cards_time > 0 
												{
												//cards_time -= 1;
												if global.training < 1 or global.training_stage[1] = 15 or global.training_stage[1] = 16
													{ cards_time -= 1; }
												}
												else
												{
												//if abs(cards_x[i] - cards_xx[i]) > 10
												//	{ cards_x[i] -= 20 * sign(cards_x[i] - cards_xx[i]); }
												//	else
												//	{ cards_x[i] = cards_xx[i]; }
												//if cards_y[i] < 200
												//	{ cards_y[i] += 30; }
												//	else
												//	{ pre_wait = 0; }
												if global.training < 1 or global.training_stage[1] = 16
													{
													if abs(cards_x[i] - cards_xx[i]) > 10
														{ cards_x[i] -= 20 * sign(cards_x[i] - cards_xx[i]); }
														else
														{ cards_x[i] = cards_xx[i]; }
													if cards_y[i] < 200
														{ cards_y[i] += 30; }
														else
														{ pre_wait = 0; }
													}
												}
											}
										if cards_s[i] = 2
											{
											if global.training > 0 && hand_xxx = -200 && cards_x[i] = cards_xs[i]
												{
												hand_xxx = cards_x[i];
												hand_yyy = cards_y[i];
												}
											if abs(cards_x[i] - cards_xs[i]) > 10
												{ cards_x[i] -= 20 * sign(cards_x[i] - cards_xs[i]); }
												else
												{
												cards_x[i] = cards_xs[i];
												if cards_now > cards_all
													{
													global.answer = 1;
													cards_3();
													break;
													}
												}
											if cards_y[i] > 0
												{ cards_y[i] -= 30; }
											}
										}
									}
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
									
										if device_mouse_check_button_pressed(dev, mb_left)
											{
											if global.sound { audio_play_sound(sd_text, 2, 0); }
										
											for(i=1;i<=cards_all;i++)
												{
												if point_in_rectangle(mouse_x1, mouse_y1, card_x + cards_x[i] - 52, card_y + cards_y[i] - 70 - 75, card_x + cards_x[i] + 52, card_y + cards_y[i] - 70 + 75)
													{
													if global.training < 1 or global.training_question != 0
														{
														if cards_nu[i] = cards_now
															{
															cards_now += 1;
															cards_s[i] = 2;
															}
															else
															{
															global.answer = 0;
															cards_3();
															break;
															}
														}
														else
														{
														if global.training_stage[1] = 16
															{
															if cards_nu[i] = cards_now
																{
																cards_now += 1;
																cards_s[i] = 2;
																}
															}
														}
													}
												}
											}
										}
									}
							#endregion
							#region Рисование
								#region Обучение
									if global.training = 1
										{
										if (global.training_stage[1] = 14 or global.training_stage[1] = 15
										or (global.training_stage[1] = 16 && global.training_question = 0))
											{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
											}
									
										//if global.training_stage[1] = 8
										//	{
										//	//global.training_hand_x = hand_xxx;
										//	//global.training_hand_y = hand_yyy;
										//	}
										if mouse_check_button_pressed(mb_left) && global.training_x > 1280 && global.text_sc = 1
											{
											if global.training_stage[1] = 14 or (global.training_stage[1] = 15 && cards_s[2] = 1)
												{ global.training_stage[1] += 1; }
											}
										if global.training_question = 3
											{
											global.training_stage[1] += 1;
											global.training_hand_s   = 0;
											global.training_question = 0;
											global.text_ne = 1;
											global.text_go = 0;
										
											global.training_stage[1] = 22;
											//round_task[global.rounds,1] += 1;
											}
										}
								#endregion
								for(i=1;i<=cards_all;i++)
									{ draw_sprite_ext(s_card, cards_i[i], card_x + cards_x[i], card_y + cards_y[i] - 70, cards_ss[i] * 0.7, 0.7, 0, c_white, 1); }
							#endregion
							}
					#endregion
					#region Задача 4 -
						if round_task[global.rounds,global.task] = 4
							{
							timer_y = 50;
							#region Координаты
								var test_x1, test_x2, test_y;
								test_x1 = 640 - 180;
								test_x2 = 640 + 180;
								test_y  = global.size / 2 - 60;
									
								pre_wait = 0;
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if point_in_rectangle(mouse_x1, mouse_y1, test_x1 - 150, test_y - 100, test_x1 + 150, test_y + 100) && global.answer = -1
											{
											if mouse_check_button_pressed(mb_left)
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
												global.answer = 1;
												}
											}
										if point_in_rectangle(mouse_x1, mouse_y1, test_x2 - 150, test_y - 100, test_x2 + 150, test_y + 100) && global.answer = -1
											{
											if mouse_check_button_pressed(mb_left)
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
												global.answer = 0;
												}
											}
										}
									}
							#endregion
							#region Рисование
							draw_set_font(global.game_font);
							draw_text_transformed_t(test_x1, test_y, "TRUE" , 0.35 * list_scale, 0.35 * list_scale, 0, global.color_white, c_black);
							draw_text_transformed_t(test_x2, test_y, "MISS" , 0.35 * list_scale, 0.35 * list_scale, 0, c_red, c_black);
						#endregion
							}
					#endregion
					}
			#endregion			
			#region Стрельба   - Shooting
				if theme_round[global.rounds] = 5
					{
					if global.training = 5
						{
						if global.training_stage[5] = 7
							{ global.training_stage[5] = 8; }
						var hand_xxx, hand_yyy;
						hand_xxx = -200;
						hand_yyy = -200;
							
						global.training_hand_x = hand_xxx;
						global.training_hand_y = hand_yyy;
						}
					#region Задача 1 - Мишени, появление
						if round_task[global.rounds,global.task] = 1
							{
							timer_y = 170;
							#region Координаты
								if list_scale = 1 && (global.player_object).stun = 0 && (global.training < 1 or global.training_stage[5] = 8)
									{
									for(i=1;i<=aim_all;i++)
										{
										if aim_p[i] = 0
											{
											if aim_s[i] < 1
												{
												aim_s[i] += 0.1;
												aim_a[i] += 5;
												break;
												}
												else
												{ aim_p[i] = 1; }
											}
											else
											{
											pre_wait = 0;
											aim_a[i] += 2;
											if aim_d[i] = 0
												{
												//if (global.training < 1 or global.training_question != 0)
												//	{
												//	if aim_s[i] > 0
												//		{ aim_s[i] -= 0.1; }
												//	}
												//	else
												//	{
												//	if hand_xxx = -200// && aim_d[i] = 0
												//		{
												//		hand_xxx = aim_xx[aim_n[i]];
												//		hand_yyy = aim_yy[aim_n[i]];
												
												//		global.training_hand_x = hand_xxx;
												//		global.training_hand_y = hand_yyy;
												//		}
												//	}
												if (global.training < 1 or global.training_question != 0)
													{
													if aim_t[i] > 0
														{ aim_t[i] -= 1; }
														else
														{
														if aim_r[i] = 0 
															{
															if aim_s[i] > 0
																{ aim_s[i] -= 0.1; }
																else
																{
																global.answer = 0;
																shooting_1();
																break;
																}
															}
															else
															{ aim_d[i] = 1; }
														}
													}
													else
													{
													if hand_xxx = -200 && aim_d[i] = 0
														{
														hand_xxx = aim_xx[aim_n[i]];
														hand_yyy = aim_yy[aim_n[i]];
												
														global.training_hand_x = hand_xxx;
														global.training_hand_y = hand_yyy;
														}
													}
												}
												else
												{
												if aim_s[i] > 0
													{ aim_s[i] -= 0.1; }
												}
											}
										if aim_now > aim_all
											{
											global.answer = 1;
											shooting_1();
											break;
											}
										//if aim_r[i] = 1
										//	{
										//	if aim_now = i
										//		{ aim_now += 1; }
										//	if aim_now > aim_all
										//		{
										//		global.answer = 1;
										//		shooting_1();
										//		break;
										//		}
										//	}
										}
									}
								if aim_r[aim_now] = 1
									{
									aim_now += 1;
									if aim_now > aim_all
										{
										global.answer = 1;
										shooting_1();
										}
									}
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										for(i=1;i<=aim_all;i++)
											{
											if point_in_circle(mouse_x1, mouse_y1, aim_xx[aim_n[i]], aim_yy[aim_n[i]], 70) && global.answer = -1
												{
												if device_mouse_check_button_pressed(dev,mb_left) && aim_d[i] = 0
													{
													if global.sound { audio_play_sound(sd_text, 2, 0); }
													if global.training < 1 or global.training_question != 0
														{
														if aim_now = i
															{
															aim_d[i] = 2;
															aim_now += 1;
															break;
															}
															else
															{
															global.answer = 0;
															shooting_1();
															break;
															}
														}
														else
														{
														if aim_now = i && global.training_stage[5] = 8
															{
															aim_d[i] = 2;
															aim_now += 1;
															break;
															}
														}
													}
												}
											}
										}
									}
							#endregion
							#region Рисование
								#region Обучение
									if global.training = 5
										{
										if (global.training_stage[5] = 6 or global.training_stage[5] = 7
										or (global.training_stage[5] = 8 && global.training_question = 0))
											{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
											}
									
										//if global.training_stage[1] = 8
										//	{
										//	//global.training_hand_x = hand_xxx;
										//	//global.training_hand_y = hand_yyy;
										//	}
										if mouse_check_button_pressed(mb_left) && global.training_x > 1280 && global.text_sc = 1
											{
											if global.training_stage[5] = 6 or global.training_stage[5] = 7
												{ global.training_stage[5] += 1; }
											}
										if global.training_question = 3
											{
											global.training_stage[5] += 1;
											global.training_hand_s   = 0;
											global.training_question = 0;
											global.text_ne = 1;
											global.text_go = 0;
											}
										}
								#endregion
								for(i=1;i<=aim_all;i++)
									{
									if aim_r[i] = 0
										{ draw_sprite_ext_t(s_target_2, 0, aim_xx[aim_n[i]], aim_yy[aim_n[i]], aim_s[i] * 0.9, aim_s[i] * 0.9, aim_a[i], global.color_white, 1, global.color_white, c_black); }
										else
										{ draw_sprite_ext_t(s_target_2, 0, aim_xx[aim_n[i]], aim_yy[aim_n[i]], aim_s[i] * 0.9, aim_s[i] * 0.9, aim_a[i], c_red, 1, c_red, c_black); }
									//draw_text_transformed_t(aim_xx[aim_n[i]], aim_yy[aim_n[i]], string(i), aim_s[i] * 0.2, aim_s[i] * 0.2, 0, c_white, c_black);
									//draw_circle(aim_xx[aim_n[i]], aim_yy[aim_n[i]], 70, 1);
									}
								//draw_text_transformed_t(mouse_x, mouse_y, string(aim_now), 0.2, 0.2, 0, c_white, c_black);
							#endregion
							}
					#endregion
					#region Задача 2 - Мишени, пистолет
						if round_task[global.rounds,global.task] = 2
							{
							timer_y = 160;
							#region Координаты
								if list_scale = 1
									{
									if global.training < 1 or global.training_question != 0
										{
										if target_iii = 0
											{
											if target_red = 0
												{ target_ang += target_spd + (target_now * 2); }
												else
												{ target_ang += target_spd * target_all / target_now; }
											}
										if target_ang >= 360
											{
											if target_now > target_all / 2
												{ pre_wait = 0; }
											target_ang -= 360;
											}
										}
										else
										{
										if target_iii = 0 && global.training_stage[5] = 12
											{
											var t_stop;
											t_stop = 0;
											for(i=1;i<=target_all;i++)
												{
												if target_d[i] = 0
													{
													//draw_text_transformed_t(640, global.size / 2, string(round(point_direction(640 - 200, global.size / 2, target_x[i], target_y[i]))) + "/" + string(round(target_ang)), 0.3 * g_star_s, 0.3 * g_star_s, 0, c_white, c_black);
													if abs(target_v[target_m[i]] - target_ang) < target_spd + (target_now * 2)
													or abs(target_v[target_m[i]] - target_ang) > 360 - target_spd - (target_now * 2)
														{
														if target_n[i] = target_now
															{
															t_stop = 1;
															target_ang = target_v[target_m[i]];
															hand_xxx = 640 - 300;
															hand_yyy = global.size / 2 + 100;
														
															global.training_hand_x = hand_xxx;
															global.training_hand_y = hand_yyy;
															}
														}
													}
												}
											if t_stop = 0
												{ target_ang += target_spd + (target_now * 2); }
											}
										if target_ang >= 360
											{
											target_ang -= 360;
											}
										}
									}
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if (point_in_rectangle(mouse_x1, mouse_y1, 0, 0, 1280, global.size - 150) && super_now = super_need) or super_now != super_need
											{
											if device_mouse_check_button_pressed(dev, mb_left)
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
												if global.training < 1 or global.training_question != 0
													{
													if target_iii = 0
														{
														target_iii = 1;
														}
													}
													else
													{
													for(i=1;i<=target_all;i++)
														{
														if target_d[i] = 0 && global.training_stage[5] = 12
															{
															//draw_text_transformed_t(640, global.size / 2, string(round(point_direction(640 - 200, global.size / 2, target_x[i], target_y[i]))) + "/" + string(round(target_ang)), 0.3 * g_star_s, 0.3 * g_star_s, 0, c_white, c_black);
															if abs(target_v[target_m[i]] - target_ang) < 20
															or abs(target_v[target_m[i]] - target_ang) > 340
																{
																if target_n[i] = target_now
																	{ target_iii = 1; }
																}
															}
														}
													}
												}
											}
										}
									}
							#endregion
							#region Рисование
								#region Обучение
									if global.training = 5
										{
										if (global.training_stage[5] = 10 or global.training_stage[5] = 11
										or (global.training_stage[5] = 12 && global.training_question = 0))
											{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
											}
									
										//if global.training_stage[1] = 8
										//	{
										//	//global.training_hand_x = hand_xxx;
										//	//global.training_hand_y = hand_yyy;
										//	}
										if mouse_check_button_pressed(mb_left) && global.training_x > 1280 && global.text_sc = 1
											{
											if global.training_stage[5] = 10 or global.training_stage[5] = 11
												{ global.training_stage[5] += 1; }
											}
										if global.training_question = 3
											{
											global.training_stage[5] += 1;
											global.training_hand_s   = 0;
											global.training_question = 0;
											global.text_ne = 1;
											global.text_go = 0;
											}
										}
								#endregion
								if global.training < 1 or global.training_question != 0 or global.training_stage[5] = 12
									{
									for(i=1;i<=target_all;i++)
										{
										if target_d[i] = 1
											{
											if target_s[i] > 0
												{
												target_s[i] -= 0.15;
												target_a[i] += 5;
												}
												else
												{ target_s[i] = 0; }
											if target_s[i] < 0
												{ target_s[i] = 0; }
											}
										target_x[i] = 640 + lengthdir_x(300, target_v[target_m[i]]);
										target_y[i] = global.size / 2 + 95 + lengthdir_y(300, target_v[target_m[i]]);
										draw_sprite_ext_t(s_target_2, 0, target_x[i], target_y[i], 0.7 * list_scale * target_s[i], 0.7 * list_scale * target_s[i], target_a[i], c_maroon, 1, c_maroon, c_black);
										draw_text_transformed_t(target_x[i], target_y[i], string(target_n[i]), 0.3 * list_scale * target_s[i], 0.3 * list_scale * target_s[i], target_a[i], global.color_white, c_black);
										}
									//draw_line(640 - 200, global.size / 2, 640 - 200 + lengthdir_x(640, target_ang + 15), global.size / 2 + lengthdir_y(640, target_ang + 15));
									if target_iii > 0
										{
										if target_iii < 4
											{ target_iii += 1; }
											else
											{
											target_iii = 0;
											for(i=1;i<=target_all;i++)
												{
												if target_d[i] = 0
													{
													//draw_text_transformed_t(640, global.size / 2, string(round(point_direction(640 - 200, global.size / 2, target_x[i], target_y[i]))) + "/" + string(round(target_ang)), 0.3 * g_star_s, 0.3 * g_star_s, 0, c_white, c_black);
													if abs(target_v[target_m[i]] - target_ang) < 20
													or abs(target_v[target_m[i]] - target_ang) > 340
														{
														pre_wait = 0;
														if target_n[i] = target_now
															{ target_now += 1 * (target_red == 0) - 1 * (target_red == 1); target_d[i] = 1; }
															else
															{
															global.answer = 0;
															shooting_2();
															//break;
															}
														if (target_now > target_all && target_red = 0) or (target_now < target_all && target_red = 1)
															{
															global.answer = 1;
															shooting_2();
															//break;
															}
														break;
														}
													}
												}
											}
										}
								//if global.training < 1 or global.training_question != 0 or global.training_stage[5] = 12
								//	{
									if target_red = 0
										{ draw_sprite_ext_t(s_gun_bullet, target_iii, 640, global.size / 2 + 95/* - 200*/, 0.6 * list_scale, 0.6 * list_scale, target_ang - 20, c_white, 1, c_white, c_black); }
										else
										{ draw_sprite_ext_t(s_gun_bullet, target_iii, 640, global.size / 2 + 95/* - 200*/, 0.6 * list_scale, 0.6 * list_scale, target_ang - 20, c_red, 1, c_red, c_black); }
									}
							#endregion
							}
					#endregion
					#region Задача 3 - Мишени, нож
						if round_task[global.rounds,global.task] = 3
							{
							timer_y = 160;
							#region Координаты
								//pre_wait = 0;
								if list_scale = 1
									{
									if global.training < 1 or global.training_question != 0
										{
										targetk_ang += targetk_spd;
										if targetk_ang >= 360
											{
											targetk_ang -= 360;
											if knife_now > targetk_all / 2
												{ pre_wait = 0; }
											}
										}
										else
										{
										if global.training_stage[5] = 17
											{
											if !((abs((targetk_v[targetk_n[1]] + targetk_ang) - 180) < targetk_spd && (targetk_v[targetk_n[1]] + targetk_ang) <= 360)
											or (abs((targetk_v[targetk_n[1]] + targetk_ang) - 540) < targetk_spd && (targetk_v[targetk_n[1]] + targetk_ang) > 360))
												{
												targetk_ang += targetk_spd;
												if targetk_ang >= 360
													{
													targetk_ang -= 360;
													if knife_now > targetk_all / 2
														{ pre_wait = 0; }
													}
												}
												else
												{
												hand_xxx = 640 + 300;
												hand_yyy = global.size / 2;
											
												global.training_hand_x = hand_xxx;
												global.training_hand_y = hand_yyy;
												}
											}
										}
									for(i=1;i<=knife_now;i++)
										{
										if knife_d[i] = -1
											{
											if knife_x[i] > 640 - 200
												{ knife_x[i] -= 10; }
												else
												{ knife_d[i] = 0; }
											}
										if knife_d[i] = 1
											{
											if knife_x[i] < 640 + 200 - sprite_get_width(s_knife_target2) / 2
												{ knife_x[i] += knife_spd; }
											if knife_x[i] >= 640 + 200 - sprite_get_width(s_knife_target2) / 2
												{
												knife_x[i] = 640 + 200 - sprite_get_width(s_knife_target2) / 2 + 10;
												for(j=1;j<=targetk_all;j++)
													{
													//if abs((targetk_v[targetk_n[j]] + targetk_ang) - 180) < 72
													//&& point_distance(knife_x[i], knife_y[i], 640 + 200 + lengthdir_x(150,targetk_v[targetk_n[j]] + targetk_ang), global.size / 2 + lengthdir_y(150,targetk_v[targetk_n[j]] + targetk_ang)) < 120
													if point_in_circle(knife_x[i], knife_y[i], 640 + 200 + lengthdir_x(sprite_get_width(s_knife_target2) / 2,targetk_v[targetk_n[j]] + targetk_ang), global.size / 2 + lengthdir_y(sprite_get_width(s_knife_target2) / 2,targetk_v[targetk_n[j]] + targetk_ang), 40)
														{
														knife_d[i]  = 2;
														knife_now  += 1;
														knife_n[i]  = j;
														knife_a1[i] = (180 - targetk_ang);
														break;
														}
													if j = targetk_all
														{
														global.answer = 0;
														shooting_3();
														break;
														}
													}
												}
											}
										if global.answer = -1
											{
											if knife_d[i] = 2
												{
												knife_x[i] = 640 + 200 + lengthdir_x(sprite_get_width(s_knife_target2) / 2,targetk_v[targetk_n[knife_n[i]]] + targetk_ang);
												knife_y[i] = global.size / 2 + lengthdir_y(sprite_get_width(s_knife_target2) / 2,targetk_v[targetk_n[knife_n[i]]] + targetk_ang);
												knife_a[i] = knife_a1[i] + targetk_ang - 180; //targetk_v[targetk_n[knife_n[i]]] + targetk_ang - 180;
												}
											}
										}
							
									if knife_now > targetk_all // && knife_d[knife_now - 1] = 2
										{
										global.answer = 1;
										shooting_3();
										}
									}
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if (point_in_rectangle(mouse_x1, mouse_y1, 0, 0, 1280, global.size - 150) && super_now = super_need) or super_now != super_need
											{
											if device_mouse_check_button_pressed(dev,mb_left)
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
												if global.training < 1 or global.training_question != 0
													{
													if knife_d[knife_now] = 0
														{ knife_d[knife_now] = 1; }
													}
													else
													{
													if (abs((targetk_v[targetk_n[1]] + targetk_ang) - 180) < targetk_spd && (targetk_v[targetk_n[1]] + targetk_ang) <= 360)
													or (abs((targetk_v[targetk_n[1]] + targetk_ang) - 540) < targetk_spd && (targetk_v[targetk_n[1]] + targetk_ang) > 360)
													&& global.training_stage[5] = 17
														{
														if knife_d[knife_now] = 0
															{ knife_d[knife_now] = 1; }
														}
													}
												}
											}
										}
									}
							#endregion
							#region Рисование
								#region Обучение
									if global.training = 5
										{
										if (global.training_stage[5] = 14
										or (global.training_stage[5] = 17 && global.training_question = 0))
											{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
											}
									
										//if global.training_stage[1] = 8
										//	{
										//	//global.training_hand_x = hand_xxx;
										//	//global.training_hand_y = hand_yyy;
										//	}
										if mouse_check_button_pressed(mb_left) && global.training_x > 1280 && global.text_sc = 1
											{
											if global.training_stage[5] = 14
												{ global.training_stage[5] = 17; }
											}
										if global.training_question = 3
											{
											global.training_stage[5] = 22;
											global.training_hand_s   = 0;
											global.training_question = 0;
											global.text_ne = 1;
											global.text_go = 0;
											}
										}
								#endregion
								for(i=1;i<=knife_now;i++)
									{ draw_sprite_ext_t(s_knife, 0, knife_x[i], knife_y[i], list_scale, list_scale, knife_a[i], c_white, 1, c_white, c_black); }
								draw_sprite_ext_t(s_knife_target2, 1, 640 + 200, global.size / 2, list_scale, list_scale, targetk_ang, c_white, 1, c_white, c_black);
								for(i=1;i<=targetk_all;i++)
									{
									draw_sprite_ext_t(s_knife_target, 0, 640 + 200 + lengthdir_x(sprite_get_width(s_knife_target2) / 2,targetk_v[targetk_n[i]] + targetk_ang), global.size / 2 + lengthdir_y(sprite_get_width(s_knife_target2) / 2,targetk_v[targetk_n[i]] + targetk_ang), list_scale, list_scale, targetk_ang + targetk_v[targetk_n[i]], c_white, 1, c_white, c_black);
									//draw_circle(640 + 200 + lengthdir_x(150,targetk_v[targetk_n[i]] + targetk_ang), global.size / 2 + lengthdir_y(150,targetk_v[targetk_n[i]] + targetk_ang), 30, 1);
									}
								//draw_text_transformed(mouse_x, mouse_y, string(knife_now), 0.3 * g_star_s, 0.3 * g_star_s, -15);
							#endregion
							}
					#endregion
					#region Задача 4 -
						if round_task[global.rounds,global.task] = 4
							{
							timer_y = 50;
							#region Координаты
								var test_x1, test_x2, test_y;
								test_x1 = 640 - 180;
								test_x2 = 640 + 180;
								test_y  = global.size / 2 - 60;
									
								pre_wait = 0;
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev=0;dev<5;dev++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if point_in_rectangle(mouse_x1, mouse_y1, test_x1 - 150, test_y - 100, test_x1 + 150, test_y + 100) && global.answer = -1
											{
											if mouse_check_button_pressed(mb_left)
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
												global.answer = 1;
												}
											}
										if point_in_rectangle(mouse_x1, mouse_y1, test_x2 - 150, test_y - 100, test_x2 + 150, test_y + 100) && global.answer = -1
											{
											if mouse_check_button_pressed(mb_left)
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
												global.answer = 0;
												}
											}
										}
									}
							#endregion
							#region Рисование
							draw_set_font(global.game_font);
							draw_text_transformed_t(test_x1, test_y, "TRUE" , 0.35 * list_scale, 0.35 * list_scale, 0, global.color_white, c_black);
							draw_text_transformed_t(test_x2, test_y, "MISS" , 0.35 * list_scale, 0.35 * list_scale, 0, c_red, c_black);
						#endregion
							}
					#endregion
					}
			#endregion		
			#region Шторм      - Storm
				if theme_round[global.rounds] = 7
					{ global.storm = 1; storm_1(); }
			#endregion
			
			#region Тест
			if theme_round[global.rounds] = 999999
				{
				#region Задача 1
					if round_task[global.rounds,global.task] = 1
						{
						#region Координаты
							var test_x1, test_x2, test_y;
							test_x1  = 640 - 180;
							test_x2  = 640 + 180;
							test_y   = global.size / 2 - 60;
							pre_wait = 0;
						#endregion
						#region Ответ
							if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
								for(dev=0;dev<5;dev++)
									{
									mouse_x1 = device_mouse_x(dev);
									mouse_y1 = device_mouse_y(dev);
									if point_in_rectangle(mouse_x1, mouse_y1, test_x1 - 150, test_y - 100, test_x1 + 150, test_y + 100) && global.answer = -1
										{
										if mouse_check_button_pressed(mb_left)
											{
											if global.sound { audio_play_sound(sd_text, 2, 0); }
											global.answer = 1;
											}
										}
									if point_in_rectangle(mouse_x1, mouse_y1, test_x2 - 150, test_y - 100, test_x2 + 150, test_y + 100) && global.answer = -1
										{
										if mouse_check_button_pressed(mb_left)
											{
											if global.sound { audio_play_sound(sd_text, 2, 0); }
											global.answer = 0;
											}
										}
									}
								}
						#endregion
						#region Рисование
						draw_set_font(global.game_font);
						draw_text_transformed_t(test_x1, test_y, "TRUE" , 0.35 * list_scale, 0.35 * list_scale, 0, global.color_white, c_black);
						draw_text_transformed_t(test_x2, test_y, "MISS" , 0.35 * list_scale, 0.35 * list_scale, 0, c_red, c_black);
					#endregion
						}
				#endregion
				#region Задача 2
					if round_task[global.rounds,global.task] = 2
						{
						#region Координаты
							var test_x1, test_x2, test_y;
							test_x1  = 640 - 180;
							test_x2  = 640 + 180;
							test_y   = global.size / 2 - 60;
							pre_wait = 0;
						#endregion
						#region Ответ
							if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
								for(dev=0;dev<5;dev++)
									{
									mouse_x1 = device_mouse_x(dev);
									mouse_y1 = device_mouse_y(dev);
									if point_in_rectangle(mouse_x1, mouse_y1, test_x1 - 150, test_y - 100, test_x1 + 150, test_y + 100) && global.answer = -1
										{
										if mouse_check_button_pressed(mb_left)
											{
											if global.sound { audio_play_sound(sd_text, 2, 0); }
											global.answer = 1;
											}
										}
									if point_in_rectangle(mouse_x1, mouse_y1, test_x2 - 150, test_y - 100, test_x2 + 150, test_y + 100) && global.answer = -1
										{
										if mouse_check_button_pressed(mb_left)
											{
											if global.sound { audio_play_sound(sd_text, 2, 0); }
											global.answer = 0;
											}
										}
									}
								}
						#endregion
						#region Рисование
						draw_set_font(global.game_font);
						draw_text_transformed_t(test_x1, test_y, "TRUE" , 0.35 * list_scale, 0.35 * list_scale, 0, global.color_white, c_black);
						draw_text_transformed_t(test_x2, test_y, "MISS" , 0.35 * list_scale, 0.35 * list_scale, 0, c_red, c_black);
					#endregion
						}
				#endregion
				#region Задача 3
					if round_task[global.rounds,global.task] = 3
						{
						#region Координаты
							var test_x1, test_x2, test_y;
							test_x1  = 640 - 180;
							test_x2  = 640 + 180;
							test_y   = global.size / 2 - 60;
							pre_wait = 0;
						#endregion
						#region Ответ
							if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
								for(dev=0;dev<5;dev++)
									{
									mouse_x1 = device_mouse_x(dev);
									mouse_y1 = device_mouse_y(dev);
									if point_in_rectangle(mouse_x1, mouse_y1, test_x1 - 150, test_y - 100, test_x1 + 150, test_y + 100) && global.answer = -1
										{
										if mouse_check_button_pressed(mb_left)
											{
											if global.sound { audio_play_sound(sd_text, 2, 0); }
											global.answer = 1;
											}
										}
									if point_in_rectangle(mouse_x1, mouse_y1, test_x2 - 150, test_y - 100, test_x2 + 150, test_y + 100) && global.answer = -1
										{
										if mouse_check_button_pressed(mb_left)
											{
											if global.sound { audio_play_sound(sd_text, 2, 0); }
											global.answer = 0;
											}
										}
									}
								}
						#endregion
						#region Рисование
						draw_set_font(global.game_font);
						draw_text_transformed_t(test_x1, test_y, "TRUE" , 0.35 * list_scale, 0.35 * list_scale, 0, global.color_white, c_black);
						draw_text_transformed_t(test_x2, test_y, "MISS" , 0.35 * list_scale, 0.35 * list_scale, 0, c_red, c_black);
					#endregion
						}
				#endregion
				#region Задача 4
					if round_task[global.rounds,global.task] = 4
						{
						#region Координаты
							var test_x1, test_x2, test_y;
							test_x1  = 640 - 180;
							test_x2  = 640 + 180;
							test_y   = global.size / 2 - 60;
							pre_wait = 0;
						#endregion
						#region Ответ
							if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
								for(dev=0;dev<5;dev++)
									{
									mouse_x1 = device_mouse_x(dev);
									mouse_y1 = device_mouse_y(dev);
									if point_in_rectangle(mouse_x1, mouse_y1, test_x1 - 150, test_y - 100, test_x1 + 150, test_y + 100) && global.answer = -1
										{
										if mouse_check_button_pressed(mb_left)
											{
											if global.sound { audio_play_sound(sd_text, 2, 0); }
											global.answer = 1;
											}
										}
									if point_in_rectangle(mouse_x1, mouse_y1, test_x2 - 150, test_y - 100, test_x2 + 150, test_y + 100) && global.answer = -1
										{
										if mouse_check_button_pressed(mb_left)
											{
											if global.sound { audio_play_sound(sd_text, 2, 0); }
											global.answer = 0;
											}
										}
									}
								}
						#endregion
						#region Рисование
						draw_set_font(global.game_font);
						draw_text_transformed_t(test_x1, test_y, "TRUE" , 0.35 * list_scale, 0.35 * list_scale, 0, global.color_white, c_black);
						draw_text_transformed_t(test_x2, test_y, "MISS" , 0.35 * list_scale, 0.35 * list_scale, 0, c_red, c_black);
					#endregion
						}
				#endregion
				}
			#endregion
			}
	#endregion
	#region Геймплей
		#region Таймер
			if (list_scale = 1/* or (global.player_object).stun*/) && pre_wait = 0 && (global.training = 0 or (global.training = 5 && global.training_question != 0))
				{
				if timer > 0
					{
					if global.super_ability = 0
						{
						timer -= 1; 
						//timer_x -= 1;
						}
					}
					else
					{
					if global.storm = 1 { storm_1(); }
					(global.player_object).answer = -1
					(global.player_object).stun = 1;
					global.answer = 0;
					if theme_round[global.rounds] = 6
						{ script_execute(asset_get_index("math_" + string(round_task[global.rounds,global.task]))); }
					if theme_round[global.rounds] = 2
						{ script_execute(asset_get_index("bottles_" + string(round_task[global.rounds,global.task]))); }
					if theme_round[global.rounds] = 3
						{ script_execute(asset_get_index("move_" + string(round_task[global.rounds,global.task]))); }
					if theme_round[global.rounds] = 4
						{ script_execute(asset_get_index("attention_" + string(round_task[global.rounds,global.task]))); }
					if theme_round[global.rounds] = 1
						{ script_execute(asset_get_index("cards_" + string(round_task[global.rounds,global.task]))); }
					if theme_round[global.rounds] = 5
						{ script_execute(asset_get_index("shooting_" + string(round_task[global.rounds,global.task]))); }
					}
				if timer <= room_speed * 3
					{
					//draw_set_color(c_red);
					//draw_rectangle(640 - 200 * timer / (3 * room_speed), global.size / 2 - 20 - 5, 640 + 200 * timer / (3 * room_speed), /*y1 - 180*/global.size / 2 - 20 + 5, 0);
					
					draw_set_color(c_white);
					//draw_set_alpha(timer / (3 * room_speed));
					draw_set_alpha(0.4 + 0.6 * timer / (3 * room_speed));
					draw_rectangle(640 - 200 * timer / (3 * room_speed), global.size / 2 - 20 - 5 + timer_y, 640 + 200 * timer / (3 * room_speed), global.size / 2 - 20 + 5 + timer_y, 0);
					draw_set_alpha(1);
					}
				}
		#endregion
			#region Игрок
			if global.answer != -1 && u_question <= 9
				{
				list_scale = 0;
				pre_wait = 1;
				
				u_answer[u_question] = global.answer;
				if u_answer[u_question] > e_answer[u_question]
					{
					if u_question > e_question
						{ u_time[e_question] = (3 + 3 * global.p_totem_a[4]) * room_speed; }
					if u_question = e_question
						{
						u_time[e_question] = (3 + 3 * global.p_totem_a[4]) * room_speed;
						if bot_time2 > (3 + 3 * global.e_totem_a[4]) * room_speed
							{
							bot_time2 = (3 + 3 * global.e_totem_a[4]) * room_speed;
							bot_time = random(1) * room_speed;
							}
						}
					}
					
				if global.training < 1
					{
					if global.answer = 1
						{
						if os_get_language() = "ru"
							{ global.training_gb = choose("ХОРОШО!", "ОТЛИЧНО!", "КРУТО!", "ИДЕАЛЬНО!"); }
							else
							{ global.training_gb = choose("GOOD!", "AWESOME", "PERFECT!", "EXELLENT"); }
						}
						else
						{
						if os_get_language() = "ru"
							{ global.training_gb = choose("ПРОМАХ", "ОШИБКА", "НЕУДАЧА", "НЕВЕЗУХА"); }
							else
							{ global.training_gb = choose("MISS", "FAULT", "GAFFE", "MISTAKE"); }
						}
					}
					
				if global.training < 1
					{ u_question += 1; }
				
				var miss;
				miss = 0;
				if global.idol[3] = 4
					{
					if global.answer = 0 
						{
						global.anim[3,1] = 0;
						}
					}
				if global.idol[2] = 4
					{
					var answ, may;
					answ = global.answer;
					may  = choose(0, 1);
					if may = 1
						{ global.answer = !answ; }
					if answ != global.answer
						{ global.anim[2,1] = 0; }
					}
				
				if global.e_totem_a[9]
					{
					var chance;
					chance = irandom(99);
					if chance < 5
						{ global.answer = 0; miss = 1; }
					}
				//if global.e_totem_a[12] && (e_hp - atk) <= 0
				//	{
				//	var chance;
				//	chance = irandom(99);
				//	if chance < 30
				//		{ global.answer = 0; miss = 1; }
				//	}
				
				if global.e_totem_a[18] = 1
					{
					if global.answer = 0
						{ (global.enemy_object).have_posion = 1; }
					}
				
				if global.answer = 1
					{
					answer_rec = 1;
					answer_col = make_color_rgb(60, 179, 113);
					
					if global.hand = -1
						{
						if super_now != super_need
							{ super_now += 1; part_n = -1; }
						}
						else
						{
						if global.hand = -1 or (global.hand = 1 && global.hero = 1) or (global.hand = 0 && global.hero != 1)
							{
							if super_now != super_need
								{ super_now += 1; part_n = -1; }
							}
							else
							{
							if e_super_now != e_super_need
								{ e_super_now += 1; part_n = -1; }
							}
						}
					if global.critical < 3 - 1 * global.p_totem_a[3]
						{ global.critical += 1; }
					}
					else
					{
					answer_rec = 1;
					if miss = 0
						{ answer_col = make_color_rgb(178, 34, 34); }
						else
						{ answer_col = make_color_rgb(60, 179, 113); }
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
					if global.training < 1
						{ global.question += 1; }
						else
						{
						//if global.answer = 1
						//	{
						//	global.training_question += 1;
						//	global.training_gb = choose("GOOD!", "AWESOME", "PERFECT!", "EXELLENT");
						//	}
						//	else
						//	{ global.training_gb = "TRY AGAIN"; }
						if global.answer = 1
							{
							global.training_question += 1;
							if os_get_language() = "ru"
								{ global.training_gb = choose("ХОРОШО!", "ОТЛИЧНО!", "КРУТО!", "ИДЕАЛЬНО!"); }
								else
								{ global.training_gb = choose("GOOD!", "AWESOME", "PERFECT!", "EXELLENT"); }
							}
							else
							{
							if os_get_language() = "ru"
								{ global.training_gb = choose("ПРОМАХ", "ОШИБКА", "НЕУДАЧА", "НЕВЕЗУХА"); }
								else
								{ global.training_gb = choose("MISS", "FAULT", "GAFFE", "MISTAKE"); }
							}
						}
					if global.storm = 1 { storm_1(); }
					}
					else
					{
					if global.task < 3
						{
						global.task += 1;
						if global.storm = 1 { storm_1(); }
						
						if theme_round[global.rounds] = 6
						{ script_execute(asset_get_index("math_" + string(round_task[global.rounds,global.task]))); }
						if theme_round[global.rounds] = 2
							{ script_execute(asset_get_index("bottles_" + string(round_task[global.rounds,global.task]))); }
						if theme_round[global.rounds] = 3
							{ script_execute(asset_get_index("move_" + string(round_task[global.rounds,global.task]))); }
						if theme_round[global.rounds] = 4
							{ script_execute(asset_get_index("attention_" + string(round_task[global.rounds,global.task]))); }
						if theme_round[global.rounds] = 1
							{ script_execute(asset_get_index("cards_" + string(round_task[global.rounds,global.task]))); }
						if theme_round[global.rounds] = 5
							{ script_execute(asset_get_index("shooting_" + string(round_task[global.rounds,global.task]))); }
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
								if hero = 2
									{ image_speed = 2; }
								if huntress_poison = 0
									{ skeleton_animation_set("shoot"); }
									else
									{
									if hero = 3
										{ skeleton_animation_set("super"); }
										else
										{ skeleton_animation_set("shoot"); }
									}
								change = 3;
								}
								else
								{
								if global.answer = 0 && !(skeleton_animation_get() = "super") && !(image_index <= 20 && skeleton_animation_get() = "shoot")
									{
									image_speed = 1.5;
									if !stun
										{ skeleton_animation_set("miss"); }
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
				timer   = u_time[u_question]; //6 * room_speed;
				timer_x = timer;
				}
				#endregion
			#region Бот
				if (bot_go != 0 && e_question <= 9) && global.training < 1//list_scale = 1 && bot_go !=0
					{
					//if bot_type = 1
						{
						if bot_time = -1
							{
							if e_time[e_question] > 3 * room_speed
								{
								if bot_type = 0
									{ bot_time = random_range(1, 2.5) * room_speed + min_time[theme_round[global.rounds],round_task[global.rounds,global.task]]; }
								if bot_type = 1
									{ bot_time = random_range(0.25, 1.5) * room_speed + min_time[theme_round[global.rounds],round_task[global.rounds,global.task]]; }
								if bot_type = 2
									{ bot_time = random_range(1, 4) * room_speed + min_time[theme_round[global.rounds],round_task[global.rounds,global.task]]; }
								if bot_type = 3
									{ bot_time = random_range(1, 3) * room_speed + min_time[theme_round[global.rounds],round_task[global.rounds,global.task]]; }
								}
								else
								{
								if bot_type = 0
									{ bot_time = random_range(0, 1) * room_speed + min_time[theme_round[global.rounds],round_task[global.rounds,global.task]]; }
								if bot_type = 1
									{ bot_time = random_range(0, 0.2) * room_speed + min_time[theme_round[global.rounds],round_task[global.rounds,global.task]]; }
								if bot_type = 2
									{ bot_time = random_range(0.5, 2) * room_speed + min_time[theme_round[global.rounds],round_task[global.rounds,global.task]]; }
								if bot_type = 3
									{ bot_time = random_range(0, 1) * room_speed + min_time[theme_round[global.rounds],round_task[global.rounds,global.task]]; }
								}
							bot_time2 = e_time[e_question]; //6 * room_speed;
							bot_wait  = min_wait[theme_round[global.rounds],round_task[global.rounds,global.task]];
							}
							else
							{
							if bot_wait <= 0 && (global.enemy_object).stun = 0 && !global.super_ability
								{
								if bot_time > 0
									{ bot_time -= 1; }
									else
									{
									if (global.enemy_object).shoot = 0 && (global.enemy_object).answer = -1
										{
										if bot_type = 0
											{ global.bot_answer = choose(1, 1, 0, 0, 0); }
										if bot_type = 1
											{ global.bot_answer = choose(1, 0); }
										if bot_type = 2
											{ global.bot_answer = choose(1, 1, 1, 1, 0); }
										if bot_type = 3
											{ global.bot_answer = choose(1, 1, 1, 0); }
										}
									}
								}
							if global.bot_answer = -1
								{
								if bot_wait > 0
									{ bot_wait -= 1; }
									else
									{
									if !global.super_ability
										{
										if bot_time2 > 0
											{ bot_time2 -= 1; }
											else
											{
											//bot_time = -1;
											//(global.player_object).answer = -1
											//(global.enemy_object).stun = 1;
											global.bot_answer = 0;
											}
										}
									}
								}
							}
						}
					}
				if e_super_now1 < e_super_now
					{ e_super_now1 += 1 / room_speed; }
				if e_super_now = 0
					{ e_super_now1 = 0; }
				if global.hand = -1
					{
					if e_super_now = e_super_need && e_super_now1 = e_super_need && theme_choose = 4 && global.e_abilitican = 1 && (global.enemy_object).stun = 0 && global.training < 1
						{
						if ((((e_hp - atk) / e_maxhp <= hp / maxhp ) && global.enemy_hero != 5)
						or (global.enemy_hero = 5 && (global.enemy_object).bill_stage != 0)
						or global.swipe_ability = 1 or (global.enemy_hero = 2)
						or (global.enemy_hero = 1 && global.swipe_ability = 0
						&& super_now = super_need != 0) && (bot_type = 2 or bot_type = 3)
						or (global.enemy_hero = 1 && global.swipe_ability = 0) && (bot_type = 1 or bot_type = 2))
						&& (global.enemy_object).hand_away = 0 && (global.player_object).hand_away = 0
							{
							if global.super_ability = 0 && (global.player_object).answer = -1 && (global.enemy_object).answer = -1 && (global.player_object).shoot = 0 && (global.enemy_object).shoot = 0
								{
								e_super_now  = 0;
								e_super_need += 3;
								global.super_ability = 1;
								
								with(global.enemy_object)
									{
									change = 3;
									super  = 1;
									if global.swipe_ability = 0
										{
										switch(global.enemy_hero)
											{
											case 1: o_list.e_super_need = 3 - global.e_totem_a[15]; skeleton_animation_set("super"); change = 1; break;
											case 2: super = 1; image_speed = 2; skeleton_animation_set("shoot"); change = 3; break;
											case 6: abil_x = 160; skeleton_animation_set("super"); change = 3; break;
											case 4: skeleton_animation_set("super"); diego_dynamit = 1; change = 3; break;
											case 3: change = 1; skeleton_animation_set("reload"); /*global.super_ability = 0; global.super_ability1 = 1;*/ huntress_poison = 1; break;
											case 5: super = 1; image_speed = 2; skeleton_animation_set("shoot"); change = 1; break;
											case 7: super = 1; image_index = 0; image_speed = 2; skeleton_animation_set("greetings"); change = 2; break;
											}
										}
										else
										{
										if global.enemy_hero != 1
											{
											change = 1; skeleton_animation_set("reload"); 
											global.super_ability = 1;
											hand_away = room_speed;
												
											o_list.super_now1 = 0//super_need;
											var enemy_now, enemy_need, player_now, player_need;
											enemy_now  = o_list.e_super_now;
											enemy_need = o_list.e_super_need;
												
											player_now  = o_list.super_now;
											player_need = o_list.super_need;
												
											o_list.super_now  = 0; //enemy_now;
											o_list.super_need = 3 - global.p_totem_a[15]; //enemy_need;
												
											o_list.e_super_now  = player_now;
											o_list.e_super_need = player_need;
											}
											else
											{
											switch(global.hero)
												{
												case 1: image_speed = 2; skeleton_animation_set("super"); change = 1; o_list.e_super_need = 3 - global.e_totem_a[15]; break;
												case 2: image_speed = 2; skeleton_animation_set("shoot"); change = 3; break;
												case 3: change = 1; skeleton_animation_set("reload"); huntress_poison = 1; break;
												case 4: skeleton_animation_set("super"); diego_dynamit = 1; change = 3; break;
												case 5: image_speed = 2; skeleton_animation_set("super"); change = 3; break;
												case 6: abil_x = 160; skeleton_animation_set("shoot"); change = 3; break;
												case 7: change = 1; skeleton_animation_set("super"); break;
												}
											}
										}
									}
								
								//skill[global.rounds] = 2;
								//if global.rounds = 1
								//	{ skill[2] = 0; }
							
								global.ability_dop_anim = 1;
								}
							}
						}
					}
					else
					{
					#region ЖОПА
					//if ((e_super_now = e_super_need && (global.hand = -1 or (global.hand = 0 && global.enemy_hero = 1) or (global.hand = 1 && global.hero = 1)))) && theme_choose = 4
					//	{
					//	if (e_hp - atk) / e_maxhp <= hp / maxhp
					//		{
					//		if global.super_ability = 0 && (global.player_object).answer = -1 && (global.enemy_object).answer = -1 && (global.player_object).shoot = 0 && (global.enemy_object).shoot = 0
					//			{
					//			e_super_now  = 0;
					//			e_super_need += 3;
					//			if global.hand = 0 && global.enemy_hero = 1
					//				{ e_super_need = 3; }
					//			global.super_ability = 1;
							
					//			//if global.hand = 0 && global.enemy_hero != 1
					//			//	{ global.super_ability = 0; super_now1 = 0; global.hand = 1; (global.enemy_object).super = 0; }
							
					//			if global.hand = -1 or (global.hand = 0 && global.enemy_hero = 1) or (global.hand = 1 && global.hero = 1)
					//				{
					//				with(global.enemy_object)
					//					{
					//					change = 3;
					//					super  = 1;
					//					if global.swipe_ability = 0
					//						{
					//						switch(global.enemy_hero)
					//							{
					//							case 1: super_need = 3; super_now1 = 3; skeleton_animation_set("super"); change = 1; break;
					//							case 2: super = 1; image_speed = 2; skeleton_animation_set("shoot"); change = 3; break;
					//							case 6: abil_x = 160; skeleton_animation_set("super"); change = 3; break;
					//							case 4: skeleton_animation_set("super"); diego_dynamit = 1; change = 3; break;
					//							case 3: change = 1; skeleton_animation_set("reload"); /*global.super_ability = 0; global.super_ability1 = 1;*/ huntress_poison = 1; break;
					//							case 5: super = 1; image_speed = 2; skeleton_animation_set("shoot"); change = 1; break;
					//							case 7: break;
					//							}
					//						}
					//						else
					//						{
					//						if global.enemy_hero != 1
					//							{
					//							change = 1; skeleton_animation_set("reload"); 
					//							global.super_ability = 1;
					//							hand_away = room_speed;
												
					//							super_need = 3; super_now1 = 0;
					//							var enemy_now, enemy_need, player_now, player_need;
					//							enemy_now  = o_list.e_super_now;
					//							enemy_need = o_list.e_super_need;
												
					//							player_now  = o_list.super_now;
					//							player_need = o_list.super_need;
												
					//							o_list.super_now  = enemy_now;
					//							o_list.super_need = enemy_need;
												
					//							o_list.e_super_now  = player_now;
					//							o_list.e_super_need = player_need;
					//							}
					//							else
					//							{
					//							switch(global.enemy_hero)
					//								{
					//								case 1: image_speed = 2; skeleton_animation_set("super"); change = 1; super_need = 3; super_now1 = 3; break;
					//								case 2: image_speed = 2; skeleton_animation_set("shoot"); change = 3; break;
					//								case 3: image_speed = 2; skeleton_animation_set("shoot"); change = 3; break;
					//								case 4: image_speed = 2; skeleton_animation_set("shoot"); change = 3; break;
					//								case 5: image_speed = 2; skeleton_animation_set("super"); change = 3; break;
					//								case 6: image_speed = 2; skeleton_animation_set("shoot"); change = 3; break;
					//								case 7: image_speed = 2; skeleton_animation_set("super"); change = 3; break;
					//								}
					//							}
					//						}
					//					}
					//				}
							
					//			//skill[global.rounds] = 2;
					//			//if global.rounds = 1
					//			//	{ skill[2] = 0; }
							
					//			global.ability_dop_anim = 1;
					//			}
					//		}
					//	}
					//if (super_now = super_need && ((global.hand = 1 && global.enemy_hero = 1) or (global.hand = 0 && global.hero = 1))) && global.super_ability = 0 && (global.player_object).answer = -1 && (global.enemy_object).answer = -1 && (global.player_object).shoot = 0 && global.super_ability = 0// && (global.enemy_object).shoot = 0
					//	{
					//	super_now  = 0;
					//	super_need += 3;
					//	global.super_ability = 1;
					
					//	if global.enemy_hero = 1
					//		{
					//		with(global.enemy_object)
					//			{
					//			change = 3;
					//			super  = 0;
					//			switch(global.hero)
					//				{
					//				case 1: global.super_ability = 0; break;
					//				case 2: image_speed = 2; skeleton_animation_set("shoot"); change = 3; break;
					//				case 4: image_speed = 2; skeleton_animation_set("shoot"); change = 3; break;
					//				case 3: image_speed = 2; skeleton_animation_set("shoot"); change = 3; break;
					//				case 5: image_speed = 2; skeleton_animation_set("super"); change = 3; break;
					//				case 6: image_speed = 2; skeleton_animation_set("shoot"); change = 3; break;
					//				case 7: image_speed = 2; skeleton_animation_set("super"); change = 3; break;
					//				}
					//			}
					//		//skill[global.rounds] = 2;
					//		//if global.rounds = 1
					//		//	{ skill[2] = 0; }
					//		global.ability_dop_anim = 1;
					//		}
					//		else
					//		{ global.super_ability = 1; (global.enemy_object).hand_away = room_speed; super_now1 = 0; /*global.hand = 1;*/ (global.enemy_object).super = 0; }
					//	}
					#endregion
					}
			#endregion
			#region Враг
			if global.bot_answer != -1 && bot_go != 0 && e_question <= 9
				{
				if global.player_rank = 15
					{
					var trtt;
					trtt = choose(1, 0, 0);
					if trtt = 1
						{ global.bot_answer = 0; }
					}
				if global.bill_abil > 0
					{
					if irandom(9) != 0
						{ global.bot_answer = 0; }
					}
				e_answer[e_question] = global.bot_answer;
				if e_answer[e_question] > u_answer[e_question]
					{
					if e_question > u_question
						{ e_time[e_question] = (3 + 3 * global.e_totem_a[4]) * room_speed; }
					if e_question = u_question
						{
						if timer > (3 + 3 * global.p_totem_a[4]) * room_speed
							{ timer = (3 + 3 * global.p_totem_a[4]) * room_speed; }
						}
					}
				e_question += 1;
				
				if global.idol[3] = 4
					{
					if global.bot_answer = 0 
						{
						global.anim[3,0] = 0;
						}
					}
				if global.idol[2] = 4
					{
					var answ, may;
					answ = global.bot_answer;
					may = choose(0, 1);
					if may = 1
						{ global.bot_answer = !answ; }
					if answ != global.bot_answer
						{ global.anim[2,0] = 0; }
					}
				
				if global.p_totem_a[9]
					{
					var chance;
					chance = irandom(99);
					if chance < 5
						{ global.bot_answer = 0; }
					}
				//if global.p_totem_a[12] && (hp - e_atk) <= 0
				//	{
				//	var chance;
				//	chance = irandom(99);
				//	if chance < 30
				//		{ global.bot_answer = 0; }
				//	}
				
				if global.p_totem_a[18] = 1
					{
					if global.bot_answer = 0
						{ (global.player_object).have_posion = 1; }
					}
				
				if global.bot_answer = 1
					{
					if global.hand = -1
						{
						if e_super_now < e_super_need
							{ e_super_now += 1; }
						}
						else
						{
						if global.hand = -1 or (global.hand = 0 && global.enemy_hero = 1) or (global.hand = 1 && global.hero = 1)
							{
							if e_super_now < e_super_need
								{ e_super_now += 1; }
							}
							else
							{
							if super_now < super_need
								{ super_now += 1; }
							}
						}
					if global.e_critical < 3 - 1 * global.e_totem_a[3]
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
							if hero = 2
								{ image_speed = 2; }
							skeleton_animation_set("shoot");
							change = 3;
							}
							else
							{
							if global.bot_answer = 0 && !(skeleton_animation_get() = "super") && !(image_index <= 20 && skeleton_animation_get() = "shoot")
								{
								image_speed = 1.5;
								if !stun
									{ skeleton_animation_set("miss"); }
								change = 1;
								}
							}
						}
					#endregion
					}
					//
				global.bot_answer = -1;
				if bot_go != 0
					{
					bot_time2 = e_time[e_question];// 6 * room_speed;
					}
				bot_time = -1;
				}
				#endregion
		#region Конец раунда
			global.sraka = 0;
			with(o_hero)
				{
				if skeleton_animation_get() != "idle"
					{ global.sraka = 1; }
				}
			if global.training < 1 && ((u_question = 10 && e_question = 10 && (global.player_object).answer = -1 && (global.enemy_object).answer = -1 && global.sraka = 0) or hp <= 0 or e_hp <= 0)
			&& theme_choose != 5  && theme_choose != 6 && global.super_ability = 0 && ((global.player_object).diego_dynamit = 0 or (global.player_object).diego_dynamit = 1)
			&& ((global.enemy_object).diego_dynamit = 0 or (global.enemy_object).diego_dynamit = 1)// && (global.player_object).shoot = 0  && (global.enemy_object).shoot = 0// && global.sraka = 0
				{
				if hp / maxhp > e_hp / e_maxhp
					{ roundskul[global.rounds] = 1; }
				
				if hp / maxhp < e_hp / e_maxhp
					{ roundskul[global.rounds] = 2; }
				
				if abs(hp / maxhp - e_hp / e_maxhp) <= 0.015
					{
					if u_time[9] > e_time[9]//task_question[3,6] = 2 or task_question[3,6] = 3
						{ roundskul[global.rounds] = 1; }
						else
						{ roundskul[global.rounds] = 2; }  // Раунд окончен
					}
				for(i=1;i<=10;i++)
					{
					u_answer[i] = -1;
					e_answer[i] = -1;
		
					u_time[i] = (6 + 3 * global.p_totem_a[4]) * room_speed;
					e_time[i] = (6 + 3 * global.e_totem_a[4]) * room_speed;
					}
				bot_time2 = e_time[u_question];
				timer     = u_time[u_question];
				u_question = 1;
				e_question = 1;
				global.sraka = 0; // Никто не атакует
				list_go = 0;
				list_scale = 0;
				plas_scale = 0;
								
				bot_go = 0; // 1
				bot_question = 1;
				bot_task     = 1;
				bot_time   = -1;
				bot_time2  =  6 * e_time[1];
				//global.answer = -1;
				//global.bot_answer = -1;
								
				global.task = 1;
				if global.storm = 1 { storm_1(); }
				
				if theme_round[global.rounds] = 6
					{ script_execute(asset_get_index("math_" + string(round_task[global.rounds,global.task]))); }
				if theme_round[global.rounds] = 3
					{ script_execute(asset_get_index("move_" + string(round_task[global.rounds,global.task]))); }
				if theme_round[global.rounds] = 2
					{ script_execute(asset_get_index("bottles_" + string(round_task[global.rounds,global.task]))); }
				if theme_round[global.rounds] = 4
					{ script_execute(asset_get_index("attention_" + string(round_task[global.rounds,global.task]))); }
				if theme_round[global.rounds] = 1
					{ script_execute(asset_get_index("cards_" + string(round_task[global.rounds,global.task]))); }
				if theme_round[global.rounds] = 5
					{ script_execute(asset_get_index("shooting_" + string(round_task[global.rounds,global.task]))); }
				global.question = 1;
								
				global.game_stage = 4;
								
				round_text1_x = 1450;
				round_3_x     = 1450;
				round_2_x     = 1450;
				round_1_x     = 1450;
				round_0_x     = 1450;
	
				round_alpha   = 1;
				
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
		
		//draw_set_font(f_question_regular);
		//draw_set_color(c_black);
		//draw_set_alpha(0.4);
		//draw_text_transformed(640 - 1, dop_q_y + global.size / 2 - 469 * list_size - 90 + 3 + list_y + button_x / 4 + 30, question_text, plas_scale, 1, 0);
		//draw_set_color(c_white);
		//draw_set_alpha(1);
		//draw_text_transformed(640, dop_q_y + global.size / 2 - 469 * list_size - 90 + list_y + button_x / 4 + 30, question_text, plas_scale, 1, 0);
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
	for(dev=0;dev<5;dev++)
		{
		//if global.enemy_hero = 1 && global.hero = 1
		//	{
		//	super_now  = 0;
		//	super_need = 3;
		//	super_now1 = 0;
			
		//	e_super_now  = 0;
		//	e_super_need = 3;
			
		//	global.hand = -1;
		//	}
		mouse_x1 = device_mouse_x(dev);
		mouse_y1 = device_mouse_y(dev);
		
		if device_mouse_check_button_pressed(dev, mb_left) && theme_choose = 4 && (global.player_object).stun = 0 && global.abilitican = 1 && (global.training < 1 or global.training = 6)
			{
			//if point_in_rectangle(mouse_x1, mouse_y1, 640 - 80 + sprite_get_width(s_super) / 2 - 20, global.size - 50 - 80 + super_x + super_zhopa, 640 + 80 + sprite_get_width(s_super) / 2 - 20, global.size - 50 + 80 + super_zhopa)
			if point_in_rectangle(mouse_x1, mouse_y1, 640 * 2 - 80 - sprite_get_width(s_super) / 2, global.size - 50 - 80 + super_zhopa - 20, 640 * 2 + 80 - sprite_get_width(s_super) / 2, global.size - 50 + 80 + super_zhopa - 20)
				{
				if global.sound = 1
					{ audio_play_sound(sd_text, 2, 0); }
				if global.hand = -1
					{
					if super_now = super_need && global.super_ability = 0 && (global.player_object).answer = -1 && (global.enemy_object).answer = -1 && (global.player_object).shoot = 0 && !(global.hero = 1 && global.enemy_hero = 1)// && (global.enemy_object).shoot = 0
						{
						super_now  = 0;
						super_need += 3;
						super_now1 = super_need;
						global.super_ability = 1;
						
						with(global.player_object)
							{
							change = 3;
							super  = 1;
							if global.swipe_ability = 0
								{
								switch(global.hero)
									{
									case 1: o_list.super_need = 3 - global.p_totem_a[15]; o_list.super_now1 = 3; skeleton_animation_set("super"); change = 1; break;
									case 2: super = 1; image_speed = 2; skeleton_animation_set("shoot"); change = 3; break;
									case 6: abil_x = 160; skeleton_animation_set("super"); change = 3; break;
									case 4: skeleton_animation_set("super"); diego_dynamit = 1; change = 3; break;
									case 3: change = 1; skeleton_animation_set("reaload"); huntress_poison = 1; break;
									case 5: super = 1; image_speed = 2; skeleton_animation_set("shoot"); change = 1; break;
									case 7: super = 1; image_index = 0; image_speed = 2; skeleton_animation_set("greetings"); change = 2; break;
									}
								}
								else
								{
								if global.hero != 1
									{
									change = 1; skeleton_animation_set("reload"); 
									global.super_ability = 1;
									hand_away = room_speed;
									
									o_list.super_now1 = 0; //super_need;
									var enemy_now, enemy_need, player_now, player_need;
									enemy_now   = o_list.e_super_now;
									enemy_need  = o_list.e_super_need;
									
									player_now  = o_list.super_now;
									player_need = o_list.super_need;
									
									o_list.super_now  = enemy_now;
									o_list.super_need = enemy_need;
		
									o_list.e_super_now  = 0; //player_now;
									o_list.e_super_need = 3 - global.e_totem_a[15]; //player_need;
									}
									else
									{
									switch(global.enemy_hero)
										{
										case 1: image_speed = 2; skeleton_animation_set("super"); change = 1; o_list.super_need = 3 - global.p_totem_a[15]; o_list.super_now1 = 3; break;
										case 2: image_speed = 2; skeleton_animation_set("shoot"); change = 3; break;
										case 3: change = 1; skeleton_animation_set("reload"); huntress_poison = 1; break;
										case 4: skeleton_animation_set("super"); diego_dynamit = 1; change = 3; break;
										case 5: image_speed = 2; skeleton_animation_set("super"); change = 3; break;
										case 6: abil_x = 160; skeleton_animation_set("shoot"); change = 3; break;
										case 7: change = 1; skeleton_animation_set("super"); break;
										}
									}
								}
							}
						//skill[global.rounds] = 2;
						//if global.rounds = 1
						//	{ skill[2] = 0; }
						global.ability_dop_anim = 1;
						io_clear();
						}
					}
					else
					{
					#region ЖОПА
					//if (super_now = super_need && (global.hand = -1 or (global.hand = 1 && global.hero = 1) or (global.hand = 0 && global.enemy_hero = 1))) && global.super_ability = 0 && (global.player_object).answer = -1 && (global.enemy_object).answer = -1 && (global.player_object).shoot = 0// && (global.enemy_object).shoot = 0
					//	{
					//	super_now  = 0;
					//	super_need += 3;
					//	super_now1 = super_need;
					//	if global.hand = 1
					//		{ super_need = 3; }
					//	global.super_ability = 1;
					
					//	//if global.hand = 1 && global.hero != 1
					//	//	{ global.super_ability = 0; super_now1 = 0; global.hand = 0; (global.player_object).super = 0; }
					
					//	if global.hand = -1 or (global.hand = 1 && global.hero = 1) or (global.hand = 0 && global.enemy_hero = 1)
					//		{
					//		with(global.player_object)
					//			{
					//			change = 3;
					//			super  = 1;
					//			switch(global.hero)
					//				{
					//				case 1: super_now1 = 0; skeleton_animation_set("super"); global.hand = 0; change = 1; break;
					//				case 2: super = 1; image_speed = 2; skeleton_animation_set("shoot"); change = 3; break;
					//				case 6: abil_x = 160; skeleton_animation_set("super"); change = 3; break;
					//				case 4: skeleton_animation_set("super"); diego_dynamit = 1; change = 3; break;
					//				case 3: change = 1; skeleton_animation_set("reload"); /*global.super_ability = 0; global.super_ability1 = 1;*/ huntress_poison = 1; break;
					//				case 5: super = 1; image_speed = 2; skeleton_animation_set("shoot"); change = 1; break;
					//				case 7: break;
					//				}
					//			}
					//		}
					//	//skill[global.rounds] = 2;
					//	//if global.rounds = 1
					//	//	{ skill[2] = 0; }
					//	global.ability_dop_anim = 1;
					//	}
					//if (e_super_now = e_super_need && ((global.hand = 0 && global.hero = 1) or (global.hand = 1 && global.hero != 1))) && global.super_ability = 0 && (global.player_object).answer = -1 && (global.enemy_object).answer = -1 && (global.player_object).shoot = 0 && global.super_ability = 0// && (global.enemy_object).shoot = 0
					//	{
					//	e_super_now  = 0;
					//	e_super_need += 3;
					//	super_now1 = e_super_need;
					//	global.super_ability = 1;
					//	if global.hero = 1
					//		{
					//		with(global.player_object)
					//			{
					//			change = 3;
					//			super  = 0;
					//			switch(global.enemy_hero)
					//				{
					//				case 1: global.super_ability = 0; break;
					//				case 2: image_speed = 2; skeleton_animation_set("shoot"); change = 3; break;
					//				case 4: image_speed = 2; skeleton_animation_set("shoot"); change = 3; break;
					//				case 3: image_speed = 2; skeleton_animation_set("shoot"); change = 3; break;
					//				case 5: image_speed = 2; skeleton_animation_set("super"); change = 3; break;
					//				case 6: image_speed = 2; skeleton_animation_set("shoot"); change = 3; break;
					//				case 7: image_speed = 2; skeleton_animation_set("super"); change = 3; break;
					//				}
					//			}
					//		//skill[global.rounds] = 2;
					//		//if global.rounds = 1
					//		//	{ skill[2] = 0; }
					//		global.ability_dop_anim = 1;
					//		}
					//		else
					//		{ global.super_ability = 1; (global.player_object).hand_away = room_speed; super_now1 = 0; /*global.hand = 0;*/ (global.player_object).super = 0; }
					//	}
					#endregion
					}
				}
			}
		}
	//if vvv
	//	{
	//	if super_x > 0
	//		{ super_x -= 40; }
	//	}
	//	else
	//	{
	//	if super_x < 300
	//		{ super_x += 40; }
	//	}
	
	#region Кнопка суперудара игрока
		var butcolor;
		butcolor = global.color_hero[global.hero];
		if global.hand = -1
			{
			if global.swipe_ability = 0
				{ butcolor = global.color_hero[global.hero]; }
				else
				{ butcolor = global.color_hero[global.enemy_hero]; }
			}
			else
			{
			if (global.hand = 0 && global.hero = 1)
				{ butcolor = global.color_hero[global.enemy_hero]; }
			}
		#region Пацанкод
			if global.hand = -1
				{
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
				
				if global.swipe_ability = 0
					{
					if part_n > 0
						{
						draw_sprite_ext_t(s_super, global.hero + 1, part_x + part_xspd * sign(part_x - (1280) * super_now1 / super_need) * 2, part_y - part_yspd * 2, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
						draw_sprite_ext_t(s_super, global.hero + 1, part_x + part_xspd * sign(part_x - (1280) * super_now1 / super_need), part_y - part_yspd, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
						draw_sprite_ext_t(s_super, global.hero + 1, part_x, part_y, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
						}
					}
					else
					{
					if part_n > 0
						{
						draw_sprite_ext_t(s_super, global.enemy_hero + 1, part_x + part_xspd * sign(part_x - (1280) * super_now1 / super_need) * 2, part_y - part_yspd * 2, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
						draw_sprite_ext_t(s_super, global.enemy_hero + 1, part_x + part_xspd * sign(part_x - (1280) * super_now1 / super_need), part_y - part_yspd, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
						draw_sprite_ext_t(s_super, global.enemy_hero + 1, part_x, part_y, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
						}
					}
				if part_n = 0
					{
					if super_now <= super_need
						{
						if super_now1 < super_now // super_need
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
				}
				else
				{
				#region ЖОПА
				//if part_n = 1
				//	{
				//	if (global.hand = -1 or (global.hand = 1 && global.hero = 1) or (global.hand = 0 && global.enemy_hero = 1))
				//		{
				//		if part_y < global.size - 10
				//			{ part_y += part_yspd; }
				//		if abs(part_x - (1280) * super_now1 / super_need) > 10
				//			{ part_x -= sign(part_x - (1280) * super_now1 / super_need) * part_xspd; }
				//			else
				//			{
				//			if part_y >= global.size - 10
				//				{ part_n = 0; }
				//			}
				//		}
				//	if (global.hand = 0 && global.hero = 1 or (global.hand = 1 && global.hero != 1))
				//		{
				//		if part_y < global.size - 10
				//			{ part_y += part_yspd; }
				//		if abs(part_x - (1280) * super_now1 / e_super_need) > 10
				//			{ part_x -= sign(part_x - (1280) * super_now1 / e_super_need) * part_xspd; }
				//			else
				//			{
				//			if part_y >= global.size - 10
				//				{ part_n = 0; }
				//			}
				//		}
				//	}
				//if part_n = 2
				//	{
				//	if part_s > 0
				//		{ part_s -= 0.25; }
				//		else
				//		{ part_n = 0; }
				//	}
			
				//if (global.hand = -1 or (global.hand = 1 && global.hero = 1) or (global.hand = 0 && global.enemy_hero = 1))
				//	{
				//	if part_n > 0
				//		{
				//		draw_sprite_ext_t(s_super, global.hero + 1, part_x + part_xspd * sign(part_x - (1280) * super_now1 / super_need) * 2, part_y - part_yspd * 2, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
				//		draw_sprite_ext_t(s_super, global.hero + 1, part_x + part_xspd * sign(part_x - (1280) * super_now1 / super_need), part_y - part_yspd, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
				//		draw_sprite_ext_t(s_super, global.hero + 1, part_x, part_y, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
				//		}
				//	}
				//if (global.hand = 0 && global.hero = 1 or (global.hand = 1 && global.hero != 1))
				//	{
				//	if part_n > 0
				//		{
				//		draw_sprite_ext_t(s_super, global.hero + 1, part_x + part_xspd * sign(part_x - (1280) * super_now1 / e_super_need) * 2, part_y - part_yspd * 2, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
				//		draw_sprite_ext_t(s_super, global.hero + 1, part_x + part_xspd * sign(part_x - (1280) * super_now1 / e_super_need), part_y - part_yspd, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
				//		draw_sprite_ext_t(s_super, global.hero + 1, part_x, part_y, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
				//		}
				//	}
				//if part_n = 0
				//	{
				//	if (super_now <= super_need && (global.hand = -1 or (global.hand = 1 && global.hero = 1) or (global.hand = 0 && global.enemy_hero = 1))) or (e_super_now <= e_super_need && (global.hand = 0 && global.hero = 1 or (global.hand = 1 && global.hero != 1)))
				//		{
				//		if (super_now1 < super_need && (global.hand = -1 or (global.hand = 1 && global.hero = 1) or (global.hand = 0 && global.enemy_hero = 1)))//super_now1 < super_now
				//			{ super_now1 += 0.025 * super_need; }
				//			else
				//			{ super_now1 += 0.025 * e_super_need; }
					
				//		if super_now = 0 && (global.hand = -1 or (global.hand = 1 && global.hero = 1) or (global.hand = 0 && global.enemy_hero = 1))
				//			{
				//			if super_now1 > 0
				//				{ super_now1 -= 0.025 * super_need; }
				//				else
				//				{ super_now1 = 0; }
				//			}
				//		if e_super_now = 0 && (global.hand = 0 && global.hero = 1 or (global.hand = 1 && global.hero != 1))
				//			{
				//			if super_now1 > 0
				//				{ super_now1 -= 0.025 * e_super_need; }
				//				else
				//				{ super_now1 = 0; }
				//			}
				//		}
				//	}
				#endregion
				}
			//draw_text_transformed_t(mouse_x, mouse_y, string(part_n), 0.5, 0.5, 0, global.color_hero[global.hero], c_black);
		#endregion
		var d_size;
		d_size = 0.05; //0.1 * (super_stage - 1) / 13;
		if global.hand = -1
			{
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
					if super_alp > 0.2//0.7
						{ super_alp -= 0.05; }
						else
						{ super_alp1 = 0 }
					}
					else
					{
					if super_alp < 1
						{ super_alp += 0.05; }
						else
						{
						if super_alpha > 0
							{ super_alpha -= 0.05; }
							else
							{ super_alpha = 1; super_alp = 0.2; super_alp1 = 1; }
						}
					}
				}
				else
				{ super_alp1 = 1; super_alp = 1; }
			}
			else
			{
			#region ЖОПА
			//if (super_now = super_need && (global.hand = -1 or (global.hand = 1 && global.hero = 1) or (global.hand = 0 && global.enemy_hero = 1))) or (e_super_now = e_super_need && (global.hand = 0 && global.hero = 1 or (global.hand = 1 && global.hero != 1)))
			//	{
			//	if (super_now1 = super_need && (global.hand = -1 or (global.hand = 1 && global.hero = 1) or (global.hand = 0 && global.enemy_hero = 1))) or (super_now1 = e_super_need && (global.hand = 0 && global.hero = 1 or (global.hand = 1 && global.hero != 1)))
			//		{
			//		if super_zhopa > 0
			//			{ super_zhopa -= 40; super_angle = 0; }
			//			else
			//			{
			//			if super_time < 40
			//				{
			//				super_time += 1;
			//				if abs(super_angle) > 1.5
			//					{ super_angle += 2 * super_dir; }
			//					else
			//					{ super_angle = 0; }
			//				}
			//				else
			//				{
			//				if (super_angle < 5 && super_dir = 1) or (super_angle > -5 && super_dir = -1)
			//					{ super_angle += 2 * super_dir; }
			//					else
			//					{
			//					super_dir = -super_dir;
			//					super_angle += 2 * super_dir;
			//					super_val += 1;
			//					if super_val = 5
			//						{ super_time = 0; super_val = 0; }
			//					}
			//				}
			//			}
			//		}
			//	}
			//	else
			//	{
			//	super_val = 0;
			//	super_angle = 0;
			//	if super_zhopa < 300
			//		{ super_zhopa += 30; }
			//	}
		
			//if (super_now = super_need && (global.hand = -1 or (global.hand = 1 && global.hero = 1) or (global.hand = 0 && global.enemy_hero = 1))) or (e_super_now = e_super_need && (global.hand = 0 && global.hero = 1 or (global.hand = 1 && global.hero != 1)))
			//	{
			//	if super_alp1 = 1
			//		{
			//		if super_alp > 0.2//0.7
			//			{ super_alp -= 0.05; }
			//			else
			//			{ super_alp1 = 0 }
			//		}
			//		else
			//		{
			//		if super_alp < 1
			//			{ super_alp += 0.05; }
			//			else
			//			{
			//			if super_alpha > 0
			//				{ super_alpha -= 0.05; }
			//				else
			//				{ super_alpha = 1; super_alp = 0.2; super_alp1 = 1; }
			//			}
			//		}
			//	}
			//	else
			//	{ super_alp1 = 1; super_alp = 1; }
			#endregion
			}
		draw_set_alpha(0.7);
		draw_rectangle_color(0, global.size, 1280, global.size - 13, c_black, c_black, c_black, c_black, 0);
		
		if global.hand = -1
			{
			if super_now = super_need
				{
				draw_set_alpha(0.5 * super_alpha);
				draw_rectangle_color(0, global.size, (1280) * super_now1 / super_need, global.size - 11 - super_alp * 4 * 8, butcolor, butcolor, butcolor, butcolor, 0);
				
				draw_set_alpha(0.3 * super_alpha);
				draw_rectangle_color(0, global.size, (1280) * super_now1 / super_need, global.size - 11 - super_alp * 2 * 6, butcolor, butcolor, butcolor, butcolor, 0);
				
				}
				
				draw_set_alpha(1);
				
				draw_rectangle_color(0, global.size, (1280) * super_now1 / super_need, global.size - 11, butcolor, butcolor, butcolor, butcolor, 0);
				draw_set_alpha(0.2);
				draw_rectangle_color(0, global.size, (1280) * super_now1 / super_need, global.size - 3, c_black, c_black, c_black, c_black, 0);
				draw_set_alpha(1);
				
				draw_set_alpha(1 - super_alp);
				draw_rectangle_color(0, global.size, (1280) * super_now1 / super_need, global.size - 11, c_white, c_white, c_white, c_white, 0);
				draw_set_alpha(1);
				//}
			}
			else
			{
			#region ЖОПА
			//if (super_now = super_need && (global.hand = -1 or (global.hand = 1 && global.hero = 1) or (global.hand = 0 && global.enemy_hero = 1)))
			//	{
			//	draw_set_alpha(0.5 * super_alpha);
			//	draw_rectangle_color(0, global.size, (1280) * super_now1 / super_need, global.size - 11 - super_alp * 4 * 8, butcolor, butcolor, butcolor, butcolor, 0);
				
			//	draw_set_alpha(0.3 * super_alpha);
			//	draw_rectangle_color(0, global.size, (1280) * super_now1 / super_need, global.size - 11 - super_alp * 2 * 6, butcolor, butcolor, butcolor, butcolor, 0);
				
			//	draw_set_alpha(1);
				
			//	draw_rectangle_color(0, global.size, (1280) * super_now1 / super_need, global.size - 11, butcolor, butcolor, butcolor, butcolor, 0);
			//	draw_set_alpha(0.2);
			//	draw_rectangle_color(0, global.size, (1280) * super_now1 / super_need, global.size - 3, c_black, c_black, c_black, c_black, 0);
			//	draw_set_alpha(1);
				
			//	draw_set_alpha(1 - super_alp);
			//	draw_rectangle_color(0, global.size, (1280) * super_now1 / super_need, global.size - 11, c_white, c_white, c_white, c_white, 0);
			//	draw_set_alpha(1);
			//	}
			//if e_super_now = e_super_need && (global.hand = 0 && global.hero = 1 or (global.hand = 1 && global.hero != 1))
			//	{
			//	draw_set_alpha(0.5 * super_alpha);
			//	draw_rectangle_color(0, global.size, (1280) * super_now1 / e_super_need, global.size - 11 - super_alp * 4 * 8, butcolor, butcolor, butcolor, butcolor, 0);
			
			//	draw_set_alpha(0.3 * super_alpha);
			//	draw_rectangle_color(0, global.size, (1280) * super_now1 / e_super_need, global.size - 11 - super_alp * 2 * 6, butcolor, butcolor, butcolor, butcolor, 0);
			
			
			//	draw_set_alpha(1);
		
			//	draw_rectangle_color(0, global.size, (1280) * super_now1 / e_super_need, global.size - 11, butcolor, butcolor, butcolor, butcolor, 0);
			//	draw_set_alpha(0.2);
			//	draw_rectangle_color(0, global.size, (1280) * super_now1 / e_super_need, global.size - 3, c_black, c_black, c_black, c_black, 0);
			//	draw_set_alpha(1);
		
			//	draw_set_alpha(1 - super_alp);
			//	draw_rectangle_color(0, global.size, (1280) * super_now1 / e_super_need, global.size - 11, c_white, c_white, c_white, c_white, 0);
			//	draw_set_alpha(1);
			//	}
			#endregion
			}
		draw_set_font(global.game_font);
		draw_text_transformed_t(640 * 2 - sprite_get_width(s_super) - string_width(super_text) * 0.2 / 2 + 20, global.size - 50 - 20 + super_zhopa, super_text, 0.2, 0.2, super_angle, butcolor, c_black);
		
		//draw_sprite_ext(s_super, 1, 640 + sprite_get_width(s_super) * (list_size1 * 1 + d_size) * super_scale / 2 + 40, global.size - 50 + super_x + super_zhopa, (list_size1 * 1 + d_size) * super_scale, (list_size1 * 1 + d_size) * super_scale, 0, c_white, 1);
		if global.swipe_ability = 0
			{
			draw_sprite_ext_t(s_super, 0, 640 * 2 - sprite_get_width(s_super) / 2/* - 20*/, global.size - 50 - 20 + super_zhopa + 8, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, butcolor, 0.5, butcolor, c_black);
			draw_sprite_ext_t(s_super, 0, 640 * 2 - sprite_get_width(s_super) / 2/* - 20*/, global.size - 50 - 20 + super_zhopa, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, butcolor, 1, butcolor, c_black);
			}
			else
			{
			draw_sprite_ext_t(s_super, 0, 640 * 2 - sprite_get_width(s_super) / 2/* - 20*/, global.size - 50 - 20 + super_zhopa + 8, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_hero[global.enemy_hero], 0.5, global.color_hero[global.enemy_hero], c_black);
			draw_sprite_ext_t(s_super, 0, 640 * 2 - sprite_get_width(s_super) / 2/* - 20*/, global.size - 50 - 20 + super_zhopa, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_hero[global.enemy_hero], 1, global.color_hero[global.enemy_hero], c_black);
			}
		if global.hand = -1
			{
			if global.swipe_ability = 0
				{
				draw_sprite_ext_t(s_super, global.hero + 1, 640 * 2 - sprite_get_width(s_super) / 2, global.size - 50 - 20 + super_zhopa + 8, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_white, 0.5, global.color_white, c_black);
				draw_sprite_ext_t(s_super, global.hero + 1, 640 * 2 - sprite_get_width(s_super) / 2, global.size - 50 - 20 + super_zhopa, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_white, 1, global.color_white, c_black);
				}
				else
				{
				draw_sprite_ext_t(s_super, global.enemy_hero + 1, 640 * 2 - sprite_get_width(s_super) / 2, global.size - 50 - 20 + super_zhopa + 8, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_white, 0., global.color_white, c_black);
				draw_sprite_ext_t(s_super, global.enemy_hero + 1, 640 * 2 - sprite_get_width(s_super) / 2, global.size - 50 - 20 + super_zhopa, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_white, 1, global.color_white, c_black);
				}
			}
			else
			{
			#region ЖОПА
			//if global.hand = -1 or (global.hand = 1 && global.hero = 1) or (global.hand = 0 && global.hero != 1)
			//	{ draw_sprite_ext_t(s_super, global.hero + 1, 640 * 2 - sprite_get_width(s_super) / 2/* - 20*/, global.size - 50 + super_x + super_zhopa, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_white, 1, global.color_white, c_black); }
			//	else
			//	{ draw_sprite_ext_t(s_super, global.enemy_hero + 1, 640 * 2 - sprite_get_width(s_super) / 2/* - 20*/, global.size - 50 + super_x + super_zhopa, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_white, 1, global.color_white, c_black); }
			#endregion
			}
		//draw_sprite_ext(s_super_black, super_stage, 86 * (list_size1 * 1.3 + d_size)/*- 90 - 500 - super_x*/, global.size - 40 - 1 + super_x, list_size1 * 1.3 + d_size, list_size1 * 1.3 + d_size, 0, c_white, 1);
		//draw_sprite_ext(asset_get_index("s_super_" + global.hero_code_name[global.enemy_hero]), e_skill[global.rounds], 1280 - (640 - 90 - 500) + super_x, global.size - 80, -list_size1 * 1, list_size1 * 1, 0, c_white, 1);
	#endregion
	#region Способность Шерифа
		if global.hero = 6 && (global.player_object).super = 1//(global.hero = 6 or (global.enemy_hero = 6 && global.hero = 1 && global.swipe_ability)) && (global.player_object).super = 1
			{
			if global.ability_dop_anim = 1
				{
				abil_x = 160;
				abil_y = y;
				global.ability_dop_anim = 2
				}
			if global.ability_dop_anim = 2
				{
				abil_x += 40;
				abil_y = cos(abil_x / 100) * 100;
				draw_sprite_ext(s_abil_thing_sherif, 0, abil_x, global.size / 2 - 50 + abil_y, abil_s, abil_s, 0, c_white, 1);
			
				if abil_x >= 1100 
					{ global.ability_dop_anim = 3; }
				}
			if global.ability_dop_anim = 3
				{
				if abil_s < 1
					{ abil_s += 0.1; }
					else
					{
					if abil_a >= 180
						{ global.ability_dop_anim = 4; }
					}
				if abil_s = 1
					{ abil_a += 20 * abil_s; }
				draw_sprite_ext(s_abil_thing_sherif, 0, abil_x, global.size / 2 - 50 + abil_y, abil_s, abil_s, abil_a, c_white, 1);
				}
			if global.ability_dop_anim = 4
				{
				draw_sprite_ext(s_abil_thing_sherif, 0, abil_x, global.size / 2 - 50 + abil_y, abil_s, abil_s, abil_a, c_white, 1);
				if abil_s > 0
					{ abil_s -= 0.15; }
					else
					{
					abil_x = 160;
					abil_y = y - 200; //global.size / 2;
					abil_s = 0.5;
					abil_a = 0;
					global.ability_dop_anim = 0;
					(global.player_object).super = 0;
					global.super_ability = 0;
					}
				abil_a += 10;
				}
			}
		
		if global.enemy_hero = 6 && (global.enemy_object).super = 1//(global.enemy_hero = 6 or (global.hero = 6 && global.enemy_hero = 1 && global.swipe_ability)) && (global.enemy_object).super = 1
			{
			if global.ability_dop_anim = 1
				{
				abil_x = 1280 - 160;
				abil_y = y;
				global.ability_dop_anim = 2
				}
			if global.ability_dop_anim = 2
				{
				abil_x -= 40;
				abil_y = cos(abil_x / 100) * 100;
				draw_sprite_ext(s_abil_thing_sherif, 0, abil_x, global.size / 2 - 50 + abil_y, abil_s, abil_s, 0, c_white, 1);
			
				if abil_x <= 160
					{ global.ability_dop_anim = 3; }
				}
			if global.ability_dop_anim = 3
				{
				if abil_s < 1
					{ abil_s += 0.1; }
					else
					{
					if abil_a >= 180
						{ global.ability_dop_anim = 4; }
					}
				if abil_s = 1
					{ abil_a += 20 * abil_s; }
				draw_sprite_ext(s_abil_thing_sherif, 0, abil_x, global.size / 2 - 50 + abil_y, abil_s, abil_s, abil_a, c_white, 1);
				}
			if global.ability_dop_anim = 4
				{
				draw_sprite_ext(s_abil_thing_sherif, 0, abil_x, global.size / 2 - 50 + abil_y, abil_s, abil_s, abil_a, c_white, 1);
				if abil_s > 0
					{ abil_s -= 0.15; }
					else
					{
					abil_x = 1280 - 160;
					abil_y = y - 200; //global.size / 2;
					abil_s = 0.5;
					abil_a = 0;
					global.ability_dop_anim = 0;
					(global.enemy_object).super = 0;
					global.super_ability = 0;
					}
				abil_a += 10;
				}
			}
	#endregion
	#region Способность Билла
		if global.bill_abil > 0 && theme_choose = 4
			{
			if global.bill_abil_a < 0.98
				{ global.bill_abil_a += 0.04; }
				else
				{ global.bill_abil_a = 0.98; }
			global.bill_abil -= 1;
			}
			else
			{
			if global.bill_abil_a > 0
				{ global.bill_abil_a -= 0.04; }
				else
				{ global.bill_abil_a = 0; }
			global.bill_abil = 0;
			}
		draw_set_alpha(global.bill_abil_a);
		draw_circle_color(640, global.size / 2, 1400 * global.bill_abil_a, global.color_white, global.color_white, 0);
		draw_set_alpha(1);
	#endregion
#endregion
#region Тотемы
	if global.game_stage = 0.5
		{
		var txx, tss, pcc;
		txx = 640;
		tss = 0.3;
		pcc = 1;
		#region Появление тотемов
			if global.tot = 0
				{
				if totem_x < 0
					{ totem_x += 30; }
					else
					{ global.tot = 1; }
				}
		#endregion
		#region Эффект тотемов
			if global.tot < 7 && global.tot != -1
				{
				if global.tot < 3
					{ i = 1; }
				if global.tot >= 3 && global.tot < 5
					{ i = 2; }
				if global.tot >= 5
					{ i = 3; }
				totem_txt   = "";
				totem_txt_i = -1;
				for(tt=1;tt<=6;tt++)
					{
					#region Игрок
					if ((global.tot = 1 or global.tot = 3 or global.tot = 5 or global.tot = 1.5 or global.tot = 3.5 or global.tot = 5.5) && totem_first = 1)
					or ((global.tot = 2 or global.tot = 4 or global.tot = 6 or global.tot = 2.5 or global.tot = 4.5 or global.tot = 6.5) && totem_first = 0)
						{
						if global.tot = tt
							{
							if global.p_totem[i] = -1
								{ global.tot += 0.5; totem_time = 20; }
								else
								{
								if i = 1 or i = 2 or i = 3
									{
									if global.p_totem[i] <= 6
										{ pcc = c_white; }
									
									if global.p_totem[i] > 6 && global.p_totem[i] <= 11
										{ pcc = c_aqua; }
									
									if global.p_totem[i] > 11 && global.p_totem[i] <= 15
										{ pcc = c_fuchsia; }
									
									if global.p_totem[i] > 15
										{ pcc = c_orange; }
									
									totem_txt_i = global.p_totem[i];
									totem_txt = global.totem_name[global.p_totem[i]];
									}
								}
							totem_pa[i] = 0;
							if totem_ps[i] < 1.15
								{ totem_ps[i] += 0.03; }
								else
								{
								if totem_time  = 0
									{
									if global.p_totem[i] = 17
										{
										#region Случайные тотемы Врага
										if global.enemy_level <= 4
											{
											global.e_totem[1] = irandom_range(1, 18);
											global.e_totem[2] = -1;
											global.e_totem[3] = -1;
											}
										if global.enemy_level > 4 && global.enemy_level < 7
											{
											var toi;
											global.e_totem[1] = irandom_range(1, 18);
							
											if global.e_totem[1] != 1
												{ global.e_totem[2] = irandom_range(1, global.e_totem[1]); }
												else
												{ global.e_totem[2] = irandom_range(2, 18); }
											global.e_totem[3] = -1;
											}
										if global.enemy_level >= 7
											{
											var toi;
											global.e_totem[1] = irandom_range(1, 18);
		
											if global.e_totem[1] != 1
												{
												global.e_totem[2] = irandom_range(1, global.e_totem[1]);
												if global.e_totem[2] != 1
													{ global.e_totem[3] = irandom_range(1, global.e_totem[2]); }
													else
													{ global.e_totem[3] = irandom_range(2, global.e_totem[1]); }
												}
												else
												{
												global.e_totem[2] = irandom_range(2, 18); 
												if global.e_totem[2] != 2
													{ global.e_totem[3] = irandom_range(2, global.e_totem[2]); }
													else
													{ global.e_totem[3] = irandom_range(3, 18); }
												}
											}
									#endregion
										#region Случайные тотемы Игрока
										if global.p_totem[1] != -1 && global.p_totem[2] = -1 && global.p_totem[3] = -1
											{ global.p_totem[1] = irandom_range(1, 18); }
										if global.p_totem[1] != -1 && global.p_totem[2] != -1 && global.p_totem[3] = -1
											{
											global.p_totem[1] = irandom_range(1, 18);
							
											if global.p_totem[1] != 1
												{ global.p_totem[2] = irandom_range(1, global.p_totem[1]); }
												else
												{ global.p_totem[2] = irandom_range(2, 18); }
											}
										if global.p_totem[1] != -1 && global.p_totem[2] != -1 && global.p_totem[3] != -1
											{
											global.p_totem[1] = irandom_range(1, 18);
		
											if global.p_totem[1] != 1
												{
												global.p_totem[2] = irandom_range(1, global.p_totem[1]);
												if global.p_totem[2] != 1
													{ global.p_totem[3] = irandom_range(1, global.p_totem[2]); }
													else
													{ global.p_totem[3] = irandom_range(2, global.p_totem[1]); }
												}
												else
												{
												global.p_totem[2] = irandom_range(2, 18); 
												if global.p_totem[2] != 2
													{ global.p_totem[3] = irandom_range(2, global.p_totem[2]); }
													else
													{ global.p_totem[3] = irandom_range(3, 18); }
												}
											}
									#endregion
										totem_ps[i] = 0.8;
										//global.tot = 1;
										}
										else
										{
										if global.p_totem[i] = 10
											{
											global.p_totem[i] = choose(irandom_range(1,9), irandom_range(11,18));
											totem_ps[i] = 0.8;
											//global.tot = 1;
											}
											else
											{
											if global.p_totem[i] = 16
												{
												var en_tot;
												en_tot = 1;
												if global.e_totem[2] != -1
													{ en_tot = choose(1, 2); }
												if global.e_totem[3] != -1
													{ en_tot = choose(1, 2, 3); }
												global.p_totem[i] = global.e_totem[en_tot];
												global.e_totem[en_tot] = 19;
												totem_ps[i] = 0.8;
												//totem_es[en_tot] = 0.8;
												//global.tot = 1; global.tot += 0.5;
												}
												else
												{
												if global.p_totem[i] = 11
													{ global.tot = 8; }
													else
													{
													if global.p_totem[i] = 1
														{
														hp *= 1.05;
														maxhp *= 1.05;
														}
													if global.p_totem[i] = 2
														{
														atk *= 1.05;
														}
													if global.p_totem[i] = 14
														{
														#region Все темы - темы игрока
															theme_t[1]  = global.hero;
															theme_nn[1] = global.theme_name[theme_t[1]];
													
															theme_t[2]  = global.hero;
															theme_nn[2] = global.theme_name[theme_t[2]];
													
															theme_t[3]  = global.hero;
															theme_nn[3] = global.theme_name[theme_t[3]];
														#endregion
														}
													if global.p_totem[i] = 7
														{ global.e_totem_a[7] = 0; }
													global.tot += 0.5;
													}
												}
											}
										}
									totem_time = 20;
									if global.sound { audio_play_sound(sd_text, 2, 0); }
									}
									else
									{ totem_time -= 1; }
								}
							}
							//else
							//{
							//if totem_ps[i] < 1
							//	{ totem_ps[i] += 0.01; }
							////if totem_ps[1] > 1
							////	{ totem_ps[1] -= 0.01; }
							//}
						if global.tot = tt + 0.5
							{
							if totem_ps[i] > 1
								{ totem_ps[i] -= 0.03; }
								else
								{ global.tot += 0.5; }
							}
						}
					#endregion
					#region Враг
					if ((global.tot = 1 or global.tot = 3 or global.tot = 5 or global.tot = 1.5 or global.tot = 3.5 or global.tot = 5.5) && totem_first = 0)
					or ((global.tot = 2 or global.tot = 4 or global.tot = 6 or global.tot = 2.5 or global.tot = 4.5 or global.tot = 6.5) && totem_first = 1)
						{
						if global.e_totem[i] = -1
							{ global.tot += 0.5; totem_time = 20; }
							else
							{
							if i = 1 or i = 2 or i = 3
								{
								if global.e_totem[i] <= 6
									{ pcc = c_white; }
								
								if global.e_totem[i] > 6 && global.e_totem[i] <= 11
									{ pcc = c_aqua; }
								
								if global.e_totem[i] > 11 && global.e_totem[i] <= 15
									{ pcc = c_fuchsia; }
								
								if global.e_totem[i] > 15
									{ pcc = c_orange; }
								
								totem_txt_i = global.e_totem[i];
								totem_txt = global.totem_name[global.e_totem[i]];
								}
							}
						if global.e_totem[i] = -1
							{ global.tot += 0.5; totem_time = 20; }
						if global.tot = tt
							{
							totem_ea[i] = 0;
							if totem_es[i] < 1.15
								{ totem_es[i] += 0.03; }
								else
								{
								if totem_time  = 0
									{
									if global.e_totem[i] = 17
										{
										#region Случайные тотемы Врага
										if global.enemy_level <= 4
											{
											global.e_totem[1] = irandom_range(1, 18);
											global.e_totem[2] = -1;
											global.e_totem[3] = -1;
											}
										if global.enemy_level > 4 && global.enemy_level < 7
											{
											var toi;
											global.e_totem[1] = irandom_range(1, 18);
							
											if global.e_totem[1] != 1
												{ global.e_totem[2] = irandom_range(1, global.e_totem[1]); }
												else
												{ global.e_totem[2] = irandom_range(2, 18); }
											global.e_totem[3] = -1;
											}
										if global.enemy_level >= 7
											{
											var toi;
											global.e_totem[1] = irandom_range(1, 18);
		
											if global.e_totem[1] != 1
												{
												global.e_totem[2] = irandom_range(1, global.e_totem[1]);
												if global.e_totem[2] != 1
													{ global.e_totem[3] = irandom_range(1, global.e_totem[2]); }
													else
													{ global.e_totem[3] = irandom_range(2, global.e_totem[1]); }
												}
												else
												{
												global.e_totem[2] = irandom_range(2, 18); 
												if global.e_totem[2] != 2
													{ global.e_totem[3] = irandom_range(2, global.e_totem[2]); }
													else
													{ global.e_totem[3] = irandom_range(3, 18); }
												}
											}
									#endregion
										#region Случайные тотемы Игрока
										if global.p_totem[1] != -1 && global.p_totem[2] = -1 && global.p_totem[3] = -1
											{ global.p_totem[1] = irandom_range(1, 18); }
										if global.p_totem[1] != -1 && global.p_totem[2] != -1 && global.p_totem[3] = -1
											{
											global.p_totem[1] = irandom_range(1, 18);
							
											if global.p_totem[1] != 1
												{ global.p_totem[2] = irandom_range(1, global.p_totem[1]); }
												else
												{ global.p_totem[2] = irandom_range(2, 18); }
											}
										if global.p_totem[1] != -1 && global.p_totem[2] != -1 && global.p_totem[3] != -1
											{
											global.p_totem[1] = irandom_range(1, 18);
		
											if global.p_totem[1] != 1
												{
												global.p_totem[2] = irandom_range(1, global.p_totem[1]);
												if global.p_totem[2] != 1
													{ global.p_totem[3] = irandom_range(1, global.p_totem[2]); }
													else
													{ global.p_totem[3] = irandom_range(2, global.p_totem[1]); }
												}
												else
												{
												global.p_totem[2] = irandom_range(2, 18); 
												if global.p_totem[2] != 2
													{ global.p_totem[3] = irandom_range(2, global.p_totem[2]); }
													else
													{ global.p_totem[3] = irandom_range(3, 18); }
												}
											}
									#endregion
										totem_es[i] = 0.8;
										//global.tot = 1;
										}
										else
										{
										if global.e_totem[i] = 10
											{
											global.e_totem[i] = choose(irandom_range(1,9), irandom_range(11,18));
											totem_es[i] = 0.8;
											//global.tot = 1;
											}
											else
											{
											if global.e_totem[i] = 16
												{
												var pn_tot;
												pn_tot = 1;
												if global.p_totem[2] != -1
													{ pn_tot = choose(1, 2); }
												if global.p_totem[3] != -1
													{ pn_tot = choose(1, 2, 3); }
												global.e_totem[i] = global.p_totem[pn_tot];
												global.p_totem[pn_tot] = 19;
												totem_es[i] = 0.8;
												//totem_ps[pn_tot] = 0.8;
												//global.tot = 1; global.tot += 0.5;
												}
												else
												{
												if global.e_totem[i] = 11
													{ global.tot = 8; }
													else
													{
													if global.e_totem[i] = 1
														{
														e_hp *= 1.05;
														e_maxhp *= 1.05;
														}
													if global.e_totem[i] = 2
														{
														e_atk *= 1.05;
														}
													if global.e_totem[i] = 14
														{
														#region Все темы - темы врага
															theme_t[1]  = global.enemy_hero;
															theme_nn[1] = global.theme_name[theme_t[1]];
													
															theme_t[2]  = global.enemy_hero;
															theme_nn[2] = global.theme_name[theme_t[2]];
													
															theme_t[3]  = global.enemy_hero;
															theme_nn[3] = global.theme_name[theme_t[3]];
														#endregion
														}
													if global.e_totem[i] = 7
														{ global.p_totem_a[7] = 0; }
													global.tot += 0.5;
													}
												}
											}
										}
									totem_time = 20;
									if global.sound { audio_play_sound(sd_text, 2, 0); }
									}
									else
									{ totem_time -= 1; }
								}
							}
							//else
							//{
							//if totem_es[i] < 1
							//	{ totem_es[i] += 0.01; }
							////if totem_ps[1] > 1
							////	{ totem_ps[1] -= 0.01; }
							//}
						if global.tot = tt + 0.5
							{
							if totem_es[i] > 1
								{ totem_es[i] -= 0.03; }
								else
								{ global.tot += 0.5; }
							}
						}
					#endregion
					}
				}
			
		#endregion
		#region Обновление переменных тотемов
			for(i=1;i<=3;i++)
				{
				if global.p_totem[i] <= 6
					{ totem_pc[i] = c_white; }
				if global.e_totem[i] <= 6
					{ totem_ec[i] = c_white; }
				
				if global.p_totem[i] > 6 && global.p_totem[i] <= 11
					{ totem_pc[i] = c_aqua; }
				if global.e_totem[i] > 6 && global.e_totem[i] <= 11
					{ totem_ec[i] = c_aqua; }
				
				if global.p_totem[i] > 11 && global.p_totem[i] <= 15
					{ totem_pc[i] = c_fuchsia; }
				if global.e_totem[i] > 11 && global.e_totem[i] <= 15
					{ totem_ec[i] = c_fuchsia; }
				
				if global.p_totem[i] > 15
					{ totem_pc[i] = c_orange; }
				if global.e_totem[i] > 15
					{ totem_ec[i] = c_orange; }
				}
		#endregion
		#region Уничтожение тотемов
			if global.tot = 8
				{
				for(i=1;i<=3;i++)
					{
					if totem_ps[i] < 1.2
						{ totem_ps[i] += 0.02; totem_es[i] += 0.02; }
						else
						{ global.tot = 9; }
					}
				}
			if global.tot = 9
				{
				for(i=1;i<=3;i++)
					{
					if totem_ps[i] > 0
						{ totem_ps[i] -= 0.1; totem_es[i] -= 0.1; }
						else
						{
						global.tot = -1;
						global.p_totem[1] = -1;
						global.p_totem[2] = -1;
						global.p_totem[3] = -1;
					
						global.e_totem[1] = -1;
						global.e_totem[2] = -1;
						global.e_totem[3] = -1;
					
						for(i=1;i<=18;i++)
							{
							global.p_totem_a[i] = 0;
							global.e_totem_a[i] = 0;
							}
						global.game_stage = 1;
						break;
						}
					}
				}
		#endregion
		#region Уход тотемов
			if global.tot = 7
				{
				if totem_x > -600
					{ totem_x -= 40; }
					else
					{
					global.tot = -1;
					global.game_stage = 1;
					
					if global.training = 4
						{ global.game_stage = 5; }
					if global.player_rank = 15
						{ global.p_totem_a[4] = 1; }
					}
				}
		#endregion
		
		#region Рисование
		if (totem_alpha >= 1 && totem_alpha_d = 1) or (totem_alpha <= 0.5 && totem_alpha_d = -1)
			{ totem_alpha_d = -totem_alpha_d; }
		totem_alpha += 0.01 * totem_alpha_d;
		
		//var totem_nc, pcc;
		//totem_nc = 1//0;
		//totem_txt   = "";
		//totem_txt_i = 1;
		//if totem_first = 1
		//	{
		//	if ceil(global.tot) = 1 && global.p_totem[1] != -1 
		//		{ pcc = 1; totem_txt_i = global.p_totem[1]; totem_txt = global.totem_name[global.p_totem[1]]; totem_nc = 1; }
		//	if ceil(global.tot) = 2 && global.e_totem[1] != -1 
		//		{ pcc = 1; totem_txt_i = global.e_totem[1]; totem_txt = global.totem_name[global.e_totem[1]]; totem_nc = 1; }
		//	if ceil(global.tot) = 3 && global.p_totem[2] != -1 
		//		{ pcc = 2; totem_txt_i = global.p_totem[2]; totem_txt = global.totem_name[global.p_totem[2]]; totem_nc = 1; }
		//	if ceil(global.tot) = 4 && global.e_totem[2] != -1 
		//		{ pcc = 2; totem_txt_i = global.e_totem[2]; totem_txt = global.totem_name[global.e_totem[2]]; totem_nc = 1; }
		//	if ceil(global.tot) = 5 && global.p_totem[3] != -1 
		//		{ pcc = 3; totem_txt_i = global.p_totem[3]; totem_txt = global.totem_name[global.p_totem[3]]; totem_nc = 1; }
		//	if ceil(global.tot) = 6 && global.e_totem[3] != -1 
		//		{ pcc = 3; totem_txt_i = global.e_totem[3]; totem_txt = global.totem_name[global.e_totem[3]]; totem_nc = 1; }
		//	}
		//	else
		//	{
		//	if ceil(global.tot) = 1 && global.e_totem[1] != -1 
		//		{ pcc = 1; totem_txt_i = global.e_totem[1]; totem_txt = global.totem_name[global.e_totem[1]]; totem_nc = 1; }
		//	if ceil(global.tot) = 2 && global.p_totem[1] != -1 
		//		{ pcc = 1; totem_txt_i = global.p_totem[1]; totem_txt = global.totem_name[global.p_totem[1]]; totem_nc = 1; }
		//	if ceil(global.tot) = 3 && global.e_totem[2] != -1 
		//		{ pcc = 2; totem_txt_i = global.e_totem[2]; totem_txt = global.totem_name[global.e_totem[2]]; totem_nc = 1; }
		//	if ceil(global.tot) = 4 && global.p_totem[2] != -1 
		//		{ pcc = 2; totem_txt_i = global.p_totem[2]; totem_txt = global.totem_name[global.p_totem[2]]; totem_nc = 1; }
		//	if ceil(global.tot) = 5 && global.e_totem[3] != -1 
		//		{ pcc = 3; totem_txt_i = global.e_totem[3]; totem_txt = global.totem_name[global.e_totem[3]]; totem_nc = 1; }
		//	if ceil(global.tot) = 6 && global.p_totem[3] != -1 
		//		{ pcc = 3; totem_txt_i = global.p_totem[3]; totem_txt = global.totem_name[global.p_totem[3]]; totem_nc = 1; }
		//	}
		
		if global.tot != -1
			{
			draw_set_alpha(0.45);
			draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
			draw_set_alpha(1);
			}
		if global.tot != -1 && global.tot < 7 && totem_txt_i != -1// && totem_nc = 1
			{
			draw_set_font(global.game_font);
			draw_text_ext_transformed_t(640, global.size / 2, string_upper(global.totem_name[totem_txt_i]), -1, 1000, 0.2, 0.2, 8, pcc, c_black);
			}
		
		/// ТОТЕМЫ
		if global.p_totem[3] > -1
			{ draw_sprite_ext(s_totems_light, global.p_totem[3], txx * 0.5 + totem_x, totem_py[3], tss * totem_ps[3], tss * totem_ps[3], 0, totem_pc[3], totem_alpha); }
		if global.p_totem[2] > -1
			{ draw_sprite_ext(s_totems_light, global.p_totem[2], txx * 0.5 + totem_x, totem_py[2], tss * totem_ps[2], tss * totem_ps[2], 0, totem_pc[2], totem_alpha); }
		if global.p_totem[1] > -1
			{ draw_sprite_ext(s_totems_light, global.p_totem[1], txx * 0.5 + totem_x, totem_py[1], tss * totem_ps[1], tss * totem_ps[1], 0, totem_pc[1], totem_alpha); }
		
		if global.e_totem[3] > -1
			{ draw_sprite_ext(s_totems_light, global.e_totem[3], txx * 1.5 - totem_x, totem_ey[3], tss * totem_es[3], tss * totem_es[3], 0, totem_ec[3], totem_alpha); }
		if global.e_totem[2] > -1
			{ draw_sprite_ext(s_totems_light, global.e_totem[2], txx * 1.5 - totem_x, totem_ey[2], tss * totem_es[2], tss * totem_es[2], 0, totem_ec[2], totem_alpha); }
		if global.e_totem[1] > -1
			{ draw_sprite_ext(s_totems_light, global.e_totem[1], txx * 1.5 - totem_x, totem_ey[1], tss * totem_es[1], tss * totem_es[1], 0, totem_ec[1], totem_alpha); }
		///
		
		/// ТОТЕМЫ
		if global.p_totem[3] > -1
			{
			draw_sprite_ext(s_totems, global.p_totem[3], txx * 0.5 + totem_x, totem_py[3], tss * totem_ps[3], tss * totem_ps[3], 0, c_white, 1);
			draw_sprite_ext(s_totems, global.p_totem[3], txx * 0.5 + totem_x, totem_py[3], tss * totem_ps[3], tss * totem_ps[3], 0, c_black, totem_pa[3]);
			draw_sprite_ext(s_totems_eyes, global.p_totem[3], txx * 0.5 + totem_x, totem_py[3], tss * totem_ps[3], tss * totem_ps[3], 0, totem_pc[3], totem_alpha);
			}
		if global.p_totem[2] > -1
			{
			draw_sprite_ext(s_totems, global.p_totem[2], txx * 0.5 + totem_x, totem_py[2], tss * totem_ps[2], tss * totem_ps[2], 0, c_white, 1);
			draw_sprite_ext(s_totems, global.p_totem[2], txx * 0.5 + totem_x, totem_py[2], tss * totem_ps[2], tss * totem_ps[2], 0, c_black, totem_pa[2]);
			draw_sprite_ext(s_totems_eyes, global.p_totem[2], txx * 0.5 + totem_x, totem_py[2], tss * totem_ps[2], tss * totem_ps[2], 0, totem_pc[2], totem_alpha);
			}
		if global.p_totem[1] > -1
			{
			draw_sprite_ext(s_totems, global.p_totem[1], txx * 0.5 + totem_x, totem_py[1], tss * totem_ps[1], tss * totem_ps[1], 0, c_white, 1);
			draw_sprite_ext(s_totems, global.p_totem[1], txx * 0.5 + totem_x, totem_py[1], tss * totem_ps[1], tss * totem_ps[1], 0, c_black, totem_pa[1]);
			draw_sprite_ext(s_totems_eyes, global.p_totem[1], txx * 0.5 + totem_x, totem_py[1], tss * totem_ps[1], tss * totem_ps[1], 0, totem_pc[1], totem_alpha);
			}
		
		if global.e_totem[3] > -1
			{
			draw_sprite_ext(s_totems, global.e_totem[3], txx * 1.5 - totem_x, totem_ey[3], tss * totem_es[3], tss * totem_es[3], 0, c_white, 1);
			draw_sprite_ext(s_totems, global.e_totem[3], txx * 1.5 - totem_x, totem_ey[3], tss * totem_es[3], tss * totem_es[3], 0, c_black, totem_ea[3]);
			draw_sprite_ext(s_totems_eyes, global.e_totem[3], txx * 1.5 - totem_x, totem_ey[3], tss * totem_es[3], tss * totem_es[3], 0, totem_ec[3], totem_alpha);
			}
		if global.e_totem[2] > -1
			{
			draw_sprite_ext(s_totems, global.e_totem[2], txx * 1.5 - totem_x, totem_ey[2], tss * totem_es[2], tss * totem_es[2], 0, c_white, 1);
			draw_sprite_ext(s_totems, global.e_totem[2], txx * 1.5 - totem_x, totem_ey[2], tss * totem_es[2], tss * totem_es[2], 0, c_black, totem_ea[2]);
			draw_sprite_ext(s_totems_eyes, global.e_totem[2], txx * 1.5 - totem_x, totem_ey[2], tss * totem_es[2], tss * totem_es[2], 0, totem_ec[2], totem_alpha);
			}
		if global.e_totem[1] > -1
			{
			draw_sprite_ext(s_totems, global.e_totem[1], txx * 1.5 - totem_x, totem_ey[1], tss * totem_es[1], tss * totem_es[1], 0, c_white, 1);
			draw_sprite_ext(s_totems, global.e_totem[1], txx * 1.5 - totem_x, totem_ey[1], tss * totem_es[1], tss * totem_es[1], 0, c_black, totem_ea[1]);
			draw_sprite_ext(s_totems_eyes, global.e_totem[1], txx * 1.5 - totem_x, totem_ey[1], tss * totem_es[1], tss * totem_es[1], 0, totem_ec[1], totem_alpha);
			}
		///
		#endregion
		}
#endregion
#region Выбор Первого Игрока
	if global.game_stage = 1 or global.game_stage = 2
		{
		if coin_stage = 0
			{
			if coin_y = global.size + 100
				{
				if global.sound = 1
					{ audio_play_sound(sd_coin,1,0); }
				}
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
				
				if global.p_totem_a[7] = 1 && global.e_totem_a[7] != 1
					{
					if theme_choose = 1
						{ first_player = 1; }
						else
						{ first_player = 0; }
					}
				if global.e_totem_a[7] = 1 && global.p_totem_a[7] != 1
					{
					if theme_choose = 1
						{ first_player = 0; }
						else
						{ first_player = 1; }
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
	if (theme_choose = 1 && global.game_stage = 2) or theme_choose = 7 or theme_choose = 8
		{
		#region Тотем 7
			if global.p_totem_a[7] = 1 && global.e_totem_a[7] != 1
				{
				first_player = 1;
				//if theme_choose = 1
				//	{ first_player = 1; }
				//	else
				//	{ first_player = 0; }
				}
			if global.e_totem_a[7] = 1 && global.p_totem_a[7] != 1
				{
				first_player = 0;
				//if theme_choose = 1
				//	{ first_player = 0; }
				//	else
				//	{ first_player = 1; }
				}
		#endregion
		//if global.game_stage >= 2
			{
			if theme_g = 0
				{
				if theme_s[1] < 1
					{ theme_timer = room_speed * 14; theme_s[1] += 0.1; }
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
							if global.sound = 1
								{ audio_play_sound(sd_text, 2, 0); }
							theme_round[global.rounds] = theme_t[numnum];
							//if theme_t[i] = 7 { global.storm = 1; storm_1(); }
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
								if global.sound = 1
									{ audio_play_sound(sd_text, 2, 0); }
								theme_round[global.rounds] = theme_t[i];
								//if theme_round[global.rounds] = 7 { global.storm = 1; storm_1(); }
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
				if string_length(theme_nn[i]) < 7
					{ draw_text_transformed_t(theme_x[i], theme_y[i] + 100, theme_nn[i], theme_s[i] * 0.2, theme_s[i] * 0.2, 0, global.color_white, c_black); }
					else
					{ draw_text_transformed_t(theme_x[i], theme_y[i] + 100, theme_nn[i], theme_s[i] * 0.18, theme_s[i] * 0.18, 0, global.color_white, c_black); }
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
						if global.sound = 1
							{ audio_play_sound(sd_text, 2, 0); }
						theme_round[global.rounds] = theme_t[numnum];
						//if theme_t[i] = 7 { global.storm = 1; storm_1(); }
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
			
		if theme_click = 0
			{
			if theme_timer > 0
				{ theme_timer -= 1; }
				else
				{
				var numnum;
				if theme_a[1] = 1 && theme_a[2] = 0 && theme_a[3] = 0
					{ numnum = 1; }
				if theme_a[2] = 1 && theme_a[1] = 0 && theme_a[3] = 0
					{ numnum = 2; }
				if theme_a[3] = 1 && theme_a[1] = 0 && theme_a[2] = 0
					{ numnum = 3; }
					
				if theme_a[1] = 1 && theme_a[2] = 1 && theme_a[3] = 0
					{ numnum = choose(1, 2); }
				if theme_a[2] = 1 && theme_a[1] = 0 && theme_a[3] = 1
					{ numnum = choose(2, 3); }
				if theme_a[3] = 1 && theme_a[1] = 1 && theme_a[2] = 0
					{ numnum = choose(1, 3); }
					
				if theme_a[3] = 1 && theme_a[1] = 1 && theme_a[2] = 1
					{ numnum = choose(1, 2, 3); }
					
				theme_click = numnum;
				theme_g = 1;
				if global.sound = 1
					{ audio_play_sound(sd_text, 2, 0); }
				theme_round[global.rounds] = theme_t[numnum];
				}
			
			if theme_timer <= room_speed * 7
				{
				draw_set_color(c_white);
				
				draw_set_alpha(0.4 + 0.6 * theme_timer / (7 * room_speed));
				draw_rectangle(640 - 330 * theme_timer / (7 * room_speed), global.size / 2 - 20 - 5 + 165, 640 + 330 * theme_timer / (7 * room_speed), global.size / 2 - 20 + 5 + 165, 0);
				draw_set_alpha(1);
				}
			}
		}
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
												if global.p_totem_a[13] = 1
													{
													var deal;
													deal = choose(1, 0);
													e_hp -= atk;
													if deal = 0
														{ hp -= e_atk; }
													}
												if global.e_totem_a[13] = 1
													{
													var deal;
													deal = choose(1, 0);
													hp -= e_atk;
													if deal = 0
														{ e_hp -= atk; }
													}
												
												global.game_stage = 5;
												theme_choose = 4;
												list_go = 1//!list_go;
												list_y = -300;
												
												list_scale = 0;
												plas_scale = 0;
												
												var task_number, now_number;
												task_number = "123";
												if theme_round[global.rounds] = 2 or theme_round[global.rounds] = 6
													{ task_number = "1234"; }
												//if theme_round[global.rounds] = 6
												//	{ task_number = "333"; }
												
												for(j=1;j<=3;j++)
													{
													now_number = irandom_range(1, string_length(task_number));
													round_task[global.rounds,j] = real(string_copy(task_number, now_number, 1));
													task_number = string_delete(task_number, now_number, 1);
													}
												
												if global.storm = 1 { storm_1(); }
												vvv = 1;
												if theme_round[global.rounds] = 6
													{ script_execute(asset_get_index("math_" + string(round_task[global.rounds,1]))); }
												if theme_round[global.rounds] = 2
													{ script_execute(asset_get_index("bottles_" + string(round_task[global.rounds,1]))); }
												if theme_round[global.rounds] = 3
													{ script_execute(asset_get_index("move_" + string(round_task[global.rounds,1]))); }
												if theme_round[global.rounds] = 4
													{ script_execute(asset_get_index("attention_" + string(round_task[global.rounds,1]))); }
												if theme_round[global.rounds] = 1
													{ script_execute(asset_get_index("cards_" + string(round_task[global.rounds,1]))); }
												if theme_round[global.rounds] = 5
													{ script_execute(asset_get_index("shooting_" + string(round_task[global.rounds,1]))); }
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
		global.jr_e = 0;
		for(i=1;i<=3;i++)
			{
			global.idol_x[i] = 0;
			global.idol_y[i] = -200;
		
			global.idol[i]   = 0;
			global.idol_s[i] = 1;
			global.idol_h[i] = -1;
			
			for(j=0;j<=1;j++)
				{ global.anim[i,j] = -1; }
			}
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
		with(o_hero)
			{
			//if enemy
			//	{
			//	if hero = 1
			//		{ global.hand = 0; }
			//	}
			//	else
			//	{
			//	if hero = 1
			//		{ global.hand = 1; }
			//	}
			if hero = 5
				{
				if bill_stage = 2
					{
					//hero_sprite  = s_sbill;
					//bill_stage   = 0;
					bill_boom    = 0;
					//bill_boom    = 0;
					//sprite_index = s_sbill;
					//hero_sprite  = s_sbill;
					//image_speed  = 2;
					//bill_stage   = 3;
					//skeleton_animation_set("idle");
					}
				bill_stage = 0;
				}
			}
		global.storm = 0;
		global.critical   = 0;
		global.e_critical = 0;
		vvv = 0;
		with(o_hero)
			{
			//bill_stage = 0;
			//bill_boom  = -1;
			poisoned = 0;
			super = 0;
			huntress_poison = 0;
			diego_dynamit   = 0;
			dynamit_x = 0;
			dynamit_y = 0;
			dynamit_a = 0;
			dynamit_i = 0;
			dynamit_d = 0;
			stun = 0;
			}
		global.super_ability1 = 0;
		global.super_ability  = 0;
		
		draw_set_alpha(0.45 * round_alpha);
		draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
		draw_set_alpha(1);
		
		if 0
			{
			#region Старое
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
			#endregion
			}
			else
			{
			#region Новое
			if whowin_stage = 0
				{
				if whowin_a1 < 0
					{
					whowin_s1 += 1/10;
					whowin_a1 += 18;
					}
					else
					{
					//whowin_s1 += 1/100;
					whowin_a1 += 0.5;
					if whowin_a2 < 0
						{
						whowin_s2 += 1/10;
						whowin_a2 += 18;
						}
						else
						{ whowin_stage = 1; }
					}
				}
			if whowin_stage = 1
				{
				//whowin_s1 += 1/100;
				//whowin_s2 += 1/100;
				whowin_a1 += 0.5;
				whowin_a2 += 0.5;
				if (100 * hp / maxhp) > (100 * e_hp / e_maxhp)
					{ hpold = 1; }
					else
					{ hpold = 0; }
				
				if round(100 * hp / maxhp) = round(100 * e_hp / e_maxhp)
					{ hprld = 1; }
					else
					{ hprld = 0; }
				if hpold //roundskul[(global.rounds - 1)] = 1
					{
					whowin_c1 = c_orange;
					whowin_c2 = c_black;
					whowin_text = "YOU WIN";
					if whowin_s1 < 1.6
						{ whowin_s1 += 0.07; }
						else
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
						whowin_stage = 2;
						}
					}
					else
					{
					whowin_c2 = c_orange;
					whowin_c1 = c_black;
					whowin_text = "YOU LOSE";
					if whowin_s2 < 1.6
						{ whowin_s2 += 0.1; }
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
						whowin_stage = 2;
						}
					}
				}
			if whowin_stage = 2
				{
				if light_scale1 < 1
					{ light_scale1 += 0.05; }
					else
					{ whowin_stage = 3; }
				}
			if whowin_stage = 3
				{
				if whowin_text_a < 0
					{
					whowin_text_s += 1/10;
					whowin_text_a += 18;
					}
					else
					{ whowin_stage = 4; }
				}
			if whowin_stage = 4
				{
				if whowin_timer < room_speed * 2
					{ whowin_timer += 1; }
					else
					{ whowin_stage = 5; }
				}
			if whowin_stage = 5
				{
				if whowin_s1 > 0
					{
					whowin_s1 -= 0.2;
					if whowin_text_s > 0
						{ whowin_text_s -= 0.2; }
					}
					else
					{
					whowin_s1 = 0;
					if whowin_s2 > 0
						{ whowin_s2 -= 0.2; }
						else
						{
						whowin_s2 = 0;
						#region Обновление
							whowin_stage = 0;
	
							whowin_x1 = 200 + 280;
							whowin_y1 = global.size / 2;
							whowin_s1 = 0;
							whowin_c1 = c_black;
							whowin_a1 = -180;
	
							whowin_x2 = 1080 - 280;
							whowin_y2 = global.size / 2;
							whowin_s2 = 0;
							whowin_c2 = c_black;
							whowin_a2 = -180;
	
							whowin_text	  = "";
							whowin_text_x = 640;
							whowin_text_y = global.size / 2 - 160;
							whowin_text_s = 0;
							whowin_text_a = -180;
	
							whowin_timer  = 0;
							light_scale1  = 0;
							light_scale1_dir = -1;
						
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
							for(i=1;i<=9;i++)
								{
								u_answer[i] = -1;
								e_answer[i] = -1;
								}
						#endregion
						}
					}
				}
			if whowin_stage >= 3
				{
				if whowin_text = "YOU LOSE"
					{ light_scale1 = whowin_s1; }
					else
					{ light_scale1 = whowin_s2; }
				if light_scale1_dir = 1
					{
					if light_scale1 < 1.1
						{ light_scale1 += 0.025; }
						else
						{ light_scale1_dir = -light_scale1_dir; }
					}
				if light_scale1_dir = -1
					{
					if light_scale1 > 1
						{ light_scale1 -= 0.025; }
						else
						{ light_scale1_dir = -light_scale1_dir; }
					}
				}
			draw_set_font(global.game_font);
			var light_xx;
			if hpold
				{ light_xx = whowin_x1; }
				else
				{ light_xx = whowin_x2; }
			
			draw_sprite_ext(s_light, 0, light_xx, whowin_y1, light_scale1 * 0.4, light_scale1 * 0.4, 0, global.color_white, 0.4);
			
			if hpold
				{
				if hprld
					{
					draw_text_transformed_t(whowin_x1, whowin_y1, string(round(100 * hp / maxhp)) + "%", 0.4 * whowin_s1, 0.4 * whowin_s1, whowin_a1, global.color_white, c_black);
					draw_text_transformed_t(whowin_x2, whowin_y2, string(round(100 * e_hp / e_maxhp) - 1) + "%", 0.4 * whowin_s2, 0.4 * whowin_s2, whowin_a2, global.color_white, c_black);
					}
					else
					{
					draw_text_transformed_t(whowin_x1, whowin_y1, string(round(100 * hp / maxhp)) + "%", 0.4 * whowin_s1, 0.4 * whowin_s1, whowin_a1, global.color_white, c_black);
					draw_text_transformed_t(whowin_x2, whowin_y2, string(round(100 * e_hp / e_maxhp)) + "%", 0.4 * whowin_s2, 0.4 * whowin_s2, whowin_a2, global.color_white, c_black);
					}
				}
				else
				{
				if hprld
					{
					draw_text_transformed_t(whowin_x1, whowin_y1, string(round(100 * hp / maxhp) - 1) + "%", 0.4 * whowin_s1, 0.4 * whowin_s1, whowin_a1, global.color_white, c_black);
					draw_text_transformed_t(whowin_x2, whowin_y2, string(round(100 * e_hp / e_maxhp)) + "%", 0.4 * whowin_s2, 0.4 * whowin_s2, whowin_a2, global.color_white, c_black);
					}
					else
					{
					draw_text_transformed_t(whowin_x1, whowin_y1, string(round(100 * hp / maxhp)) + "%", 0.4 * whowin_s1, 0.4 * whowin_s1, whowin_a1, global.color_white, c_black);
					draw_text_transformed_t(whowin_x2, whowin_y2, string(round(100 * e_hp / e_maxhp)) + "%", 0.4 * whowin_s2, 0.4 * whowin_s2, whowin_a2, global.color_white, c_black);
					}
				}
			
			draw_text_transformed_t(whowin_text_x, whowin_text_y, whowin_text, 0.25 * whowin_text_s, 0.25 * whowin_text_s, whowin_text_a, global.color_white, c_black);
		#endregion
			}
		}
	if theme_choose = 5
		{
		global.idol[1] = 0;
		global.idol[2] = 0;
		global.idol[3] = 0;
		atk   = global.atk[global.hero];
		e_atk = global.atk[global.enemy_hero];
		
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
			var gold_c;
			gold_c = make_color_rgb(252,232,131);
			draw_set_font(global.game_font);//draw_set_font(f_win_regular);
			
			draw_text_transformed_t(640, -fin_y + 50 + global.size / 2 - 469 * list_size - 100 + list_y, "VICTORY!", finplas * 0.18, 0.18, 0, gold_c, c_black);
			}
		if whowin = 2
			{
			if finplas < 1
				{ finplas += 0.1; }
			
			draw_sprite_ext(s_plash_lose, 2, 640, -fin_y + 50 + global.size / 2 - 469 * list_size - 80 + list_y, list_size * finplas, list_size, 0, c_white, 1);
			draw_sprite_ext(s_plash_lose, 0, 640 + 418  * list_size * (1 - finplas), -fin_y + 50 + global.size / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
			draw_sprite_ext(s_plash_lose, 1, 640 - 418  * list_size * (1 - finplas), -fin_y + 50 + global.size / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
		
			draw_set_font(global.game_font);//draw_set_font(f_win_regular);
			//draw_set_color(c_black);
			//draw_set_alpha(0.4);
			//draw_text_transformed(640 - 1, -fin_y + 50 + global.size / 2 - 469 * list_size - 100 + 3 + list_y, "DEFEAT", finplas * 0.18, 0.18, 0);
			//draw_set_color(c_white);
			//draw_set_alpha(1);
			draw_text_transformed_t(640, -fin_y + 50 + global.size / 2 - 469 * list_size - 100 + list_y, "DEFEAT", finplas * 0.18, 0.18, 0, global.color_white, c_black);
			}
			
		//draw_set_font(global.game_font);
		//draw_text_transformed_t(640, global.size / 2 + 200 + fin_y, "TAP TO RESTART", 0.2, 0.2, 0, c_white, c_black);
		
		//draw_set_color(c_black);
		//draw_set_alpha(0.4);
		//draw_text_transformed(640 - 1, 100 - fin_y + 50 + global.size / 2 - 469 * list_size - 100 + 3 + list_y, "ACCURACY: " + string(round(100 * accuracy_true / accuracy_all)) + "%", finplas * 0.18, 0.18, 0);
		//draw_set_color(c_white);
		//draw_set_alpha(1);
		//draw_text_transformed(640, 100 - fin_y + 50 + global.size / 2 - 469 * list_size - 100 + list_y, "ACCURACY: " + string(round(100 * accuracy_true / accuracy_all)) + "%", finplas * 0.18, 0.18, 0);
		
		//var money, respect;
		//money = 25;
		//if whowin = 1
		//	{ respect = "+1"; }
		//	else
		//	{ respect = "-1"; }
		//if roundskul[1] = 1
		//	{ money += 25; }
		//if roundskul[2] = 1
		//	{ money += 25; }
		//if roundskul[3] = 1 or (roundskul[3] = 0 && money > 25)
		//	{ money += 25; }
			
		
		//draw_set_color(c_black);
		//draw_set_alpha(0.4);
		//draw_text_transformed(640 - 1, 200 - fin_y + 50 + global.size / 2 - 469 * list_size - 100 + 3 + list_y, "MONEY +" + string(money) + "$", finplas * 0.18, 0.18, 0);
		//draw_set_color(c_white);
		//draw_set_alpha(1);
		//draw_text_transformed(640, 200 - fin_y + 50 + global.size / 2 - 469 * list_size - 100 + list_y, "MONEY +" + string(money) + "$", finplas * 0.18, 0.18, 0);
		
		//draw_set_color(c_black);
		//draw_set_alpha(0.4);
		//draw_text_transformed(640 - 1, 300 - fin_y + 50 + global.size / 2 - 469 * list_size - 100 + 3 + list_y, "RESPECT " + string(respect), finplas * 0.18, 0.18, 0);
		//draw_set_color(c_white);
		//draw_set_alpha(1);
		//draw_text_transformed(640, 300 - fin_y + 50 + global.size / 2 - 469 * list_size - 100 + list_y, "RESPECT " + string(respect), finplas * 0.18, 0.18, 0);
		if fin_y > 0
			{ fin_y -= 40; }
			else
			{
			if finplas < 1
				{
				finplas += 0.1;
				if finplas = 1
					{
					//if whowin = 1
					//	{
					//	if global.sound
					//		{ audio_play_sound(sd_win, 2, 0); }
					//	}
					//	else
					//	{
					//	//if global.sound
					//	//	{ audio_play_sound(sd_lose, 2, 0); }
					//	}
					}
				}
				else
				{
				if global.quick = 0
					{
					if whowin = 2 && g_rank_stage = 0
						{
						if global.sound
							{ audio_play_sound(sd_lose, 2, 0); }
						}
					//if whowin = 1 && g_rank_stage = 0
					//	{
					//	if global.sound
					//		{ audio_play_sound(sd_star, 0, 0); }
					//	}
					if g_rank_stage = 0
						{ g_rank_stage = 1; }
					}
					else
					{
					if whowin = 2 && g_rank_stage != 8
						{
						if global.sound
							{ audio_play_sound(sd_lose, 2, 0); }
						}
					if whowin = 1 & g_rank_stage != 8
						{
						if global.sound
							{ audio_play_sound(sd_win, 2, 0); } 
						}
					if g_rank_stage != 8
						{
						ini_open("Music.ini");
						if whowin = 1
							{
							if roundskul_n[3] = 0
								{
								var pg;
								pg = 15 - global.player_rank + 5;
								global.gold += pg;
								txt_gold = "+" + string(pg) + "©";
								txt_cash = "";
								
								ini_write_string("Sounds", "sound_on_g", string(global.gold));
								ini_write_string("Sounds", "sound_false_c", string(global.cash));
								}
								else
								{
								var pg;
								pg = 15 - global.player_rank + 5;
								global.gold += pg;
								txt_gold = "+" + string(pg) + "©";
								txt_cash = "";
								
								ini_write_string("Sounds", "sound_on_g", string(global.gold));
								ini_write_string("Sounds", "sound_false_c", string(global.cash));
								}
							}
						ini_close();
						}
					g_rank_stage = 8;
					}
				}
			#region Какой ранг
				var star_now, star_need, shield_i, skul_i, go5;
					if global.rank_stars <= 70
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
					
					//winstreak = 0;
					if g_rank_type = -1
						{
						g_star_yy[1] = 0;
						g_star_yy[2] = 0;
						g_star_yy[3] = 0;
						g_star_yy[4] = 0;
						g_star_yy[5] = 0;
						g_star_yy[6] = 0;
						
						g_star_ss[1] = 1;
						g_star_ss[2] = 1;
						g_star_ss[3] = 1;
						g_star_ss[4] = 1;
						g_star_ss[5] = 1;
						g_star_ss[6] = 1;
						if whowin = 2 && star_now - 1 < 0
							{ g_rank_type = 1; g_skul_y = 0; g_star_yn = star_now; g_star_yy[g_star_yn] = 0; }
						if whowin = 2 && star_now - 1 >= 0
							{ g_rank_type = 2; g_star_yn = star_now; g_star_yy[g_star_yn] = 0;  }
						if whowin = 1 && star_now + 1 + winstreak < star_need
							{ g_rank_type = 3; g_star_yn = star_now + 1; g_star_yy[g_star_yn]= -global.size / 2 - 200;  }
						if whowin = 1 && star_now + 1 + winstreak >= star_need
							{ g_rank_type = 4; g_skul_y = 0; g_star_yn = star_now + 1; g_star_yy[g_star_yn] = -global.size / 2 - 200;  }
						}
					//draw_set_font(global.game_font);
					//draw_text_transformed_t(mouse_x, mouse_y, string(g_rank_stage) + "~" + string(g_rank_type) + "\n" + string(star_now) + "~" + string(star_need) + "\n" + string(global.last_game2) + "~" + string(global.last_game), 0.25, 0.25, 0, c_white, c_black);
			#endregion
			
			if g_enemy_change = 0
				{
				g_enemy_change = choose(0, 0, 1);
				if g_enemy_change = 1
					{
					if whowin = 1
						{ global.enemy_rank -= 1; }
						else
						{ global.enemy_rank += 1; }
					if global.enemy_rank > 15
						{ global.enemy_rank = 15; }
					if global.enemy_rank < 0
						{ global.enemy_rank = 0; }
					}
				}
			
			/////////
			if g_rank_stage = 1	
				{
				if g_rank_s  < 1
					{ g_rank_s += 0.21; }
					else
					{ g_rank_s = 1; g_rank_stage = 2; }
				}
			////////////
			if g_rank_stage = 2
				{
				if g_star_a  < 1
					{ g_star_a  += 0.1; }
					else
					{ g_rank_stage = 3; }
				}
			//////////
			if g_rank_stage = 3
				{
				if g_rank_type = 1
					{
					g_rank_stage = 4;
					}
				if g_rank_type = 2
					{
					if g_star_yy[g_star_yn] = 0
						{
						if global.rank_stars != 0 && global.rank_stars != 16
						&& global.rank_stars != 41 && global.rank_stars != 69
						&& global.rank_stars != 70
							{ global.rank_stars -= 1; }
							else
							{ g_message = 1; }
						ini_open("Music.ini");
							ini_write_string("Ranks", "ranks", string(global.rank_stars));
						ini_close();
						}
					if g_star_yy[g_star_yn] < global.size / 2 + 300
						{ g_star_yy[g_star_yn] += 15; }
						else
						{ g_rank_stage = 6; }//{ g_rank_stage = 4; }
					}
				if g_rank_type = 3
					{
					if g_star_yy[g_star_yn] != 0
						{
						if global.rank_stars < 70
							{ global.rank_stars += 1 + winstreak; }
						g_star_ss[g_star_yn] = 30;
						if global.sound
							{ audio_play_sound(sd_star, 0, 0); }
						ini_open("Music.ini");
							ini_write_string("Ranks", "ranks", string(global.rank_stars));
						ini_close();
						}
					g_star_yy[g_star_yn] = 0;
					if g_star_ss[g_star_yn] > 1
						{ g_star_ss[g_star_yn] -= 3; }
						else
						{ g_star_ss[g_star_yn] = 1; g_rank_stage = 6; } //{ g_rank_stage = 4; }
					}
				if g_rank_type = 4
					{
					if global.sound
						{ audio_play_sound(sd_star, 0, 0); }
					if global.rank_stars < 70
						{ global.rank_stars += 1 + winstreak; }
					g_rank_stage = 4;
					}
				}
			//////////////
			if g_rank_stage = 4
				{
				if g_rank_type = 1
					{
					//if g_skul_s > 0
						{
						if g_skul_y < global.size / 2 + 200
							{ g_skul_y += 20; }
							else
							{
							if global.rank_stars != 0 && global.rank_stars != 16
							&& global.rank_stars != 41 && global.rank_stars != 69
							&& global.rank_stars != 70
								{ global.rank_stars -= 1; }
								else
								{ g_message = 1; }
							g_rank_stage = 5;
							g_skul_y = 0;
							g_skul_s = 0;
							
							ini_open("Music.ini");
								ini_write_string("Ranks", "ranks", string(global.rank_stars));
							ini_close();
							}
						}
					}
				//if g_rank_type = 2
				//	{
				//	g_rank_stage = 5;
				//	}
				//if g_rank_type = 3
				//	{
				//	g_rank_stage = 5;
				//	}
				if g_rank_type = 4
					{
					//if g_skul_s > 0
						{
						if g_skul_s > 0
							{ g_skul_s -= 0.1; }
							else
							{
							g_rank_stage = 5;
							g_skul_y = 0;
							g_skul_s = 20;
							}
						}
					}
				}
			////
			if g_rank_stage = 5
				{
				if g_rank_type = 1
					{
					if g_skul_s < 1
						{ g_skul_s += 0.2; }
						else
						{ g_skul_s = 1; g_rank_stage = 6; }
					}
				if g_rank_type = 4
					{
					if g_skul_s > 1
						{ g_skul_s -= 2; }
						else
						{ g_skul_s = 1; g_rank_stage = 6; }
					}
				}
			///////
			if g_rank_stage = 6
				{
				ini_open("Music.ini");
					if g_rank_type = 1
						{
						if roundskul_n[3] != 0
							{
							//txt_gold = "+5©";
							//global.gold += 5;
							var pg;
							pg = 15 - global.player_rank + 5;
							global.gold += pg;
							txt_gold = "+" + string(pg) + "©";
							txt_cash = "";
							ini_write_string("Sounds", "sound_on_g", string(global.gold));
							}
						//g_rank_stage = 7;
						}
					if g_rank_type = 2
						{
						if roundskul_n[3] != 0
							{
							var pg;
							pg = 15 - global.player_rank + 5;
							global.gold += pg;
							txt_gold = "+" + string(pg) + "©";
							txt_cash = "";
							ini_write_string("Sounds", "sound_on_g", string(global.gold));
							}
						}
					if g_rank_type = 3
						{
						if roundskul_n[3] = 0
							{
							var pg, pc, pc1;
							pg = 15 - global.player_rank + 15;
							global.gold += pg;
							pc  = 2;
							pc1 = 0;
							if global.player_rank <= 10
								{ pc1 += 2; }
							if global.player_rank <= 5
								{ pc1 += 3; }
							if global.player_rank <= 3
								{ pc1 += 4; }
							if global.player_rank <= 2
								{ pc1 += 4; }
							if global.player_rank <= 1
								{ pc1 += 5; }
							if global.player_rank <= 0
								{ pc1 += 10; }
							
							global.cash += pc + pc1;
							
							if pc1 <= 0
								{
								txt_gold = "+" + string(pg) + "©";
								txt_cash = "+" + string(pc) + "ç";
								}
								else
								{
								txt_gold = "+" + string(pg) + "©";
								txt_cash = "+" + string(pc) + "(+" + string(pc1) + ")" + "ç";
								}
							//txt_gold = "+10©";
							//txt_cash = "+1ç";
							
							ini_write_string("Sounds", "sound_on_g", string(global.gold));
							ini_write_string("Sounds", "sound_false_c", string(global.cash));
							}
							else
							{
							var pg, pc, pc1;
							pg = 15 - global.player_rank + 10;
							global.gold += pg;
							pc  = 1;
							pc1 = 0;
							if global.player_rank <= 10
								{ pc1 += 2; }
							if global.player_rank <= 5
								{ pc1 += 3; }
							if global.player_rank <= 3
								{ pc1 += 4; }
							if global.player_rank <= 2
								{ pc1 += 4; }
							if global.player_rank <= 1
								{ pc1 += 5; }
							if global.player_rank <= 0
								{ pc1 += 10; }
							
							global.cash += pc + pc1;
							
							if pc1 <= 0
								{
								txt_gold = "+" + string(pg) + "©";
								txt_cash = "+" + string(pc) + "ç";
								}
								else
								{
								txt_gold = "+" + string(pg) + "©";
								txt_cash = "+" + string(pc) + "(+" + string(pc1) + ")" + "ç";
								}
							//global.gold += 15 - global.player_rank + 10;
							//global.cash += 1;
							//if global.player_rank <= 10
							//	{ global.cash += 2; }
							//if global.player_rank <= 5
							//	{ global.cash += 3; }
							//if global.player_rank <= 3
							//	{ global.cash += 4; }
							//if global.player_rank <= 2
							//	{ global.cash += 4; }
							//if global.player_rank <= 1
							//	{ global.cash += 5; }
							//if global.player_rank <= 0
							//	{ global.cash += 10; }
							
							//txt_gold = "+" + string(global.gold) + "©";
							//txt_cash = "+" + string(global.cash) + "ç";
							ini_write_string("Sounds", "sound_on_g", string(global.gold));
							ini_write_string("Sounds", "sound_false_c", string(global.cash));
							}
						}
					if g_rank_type = 4
						{
						if roundskul_n[3] = 0
							{
							var pg, pc, pc1;
							pg = 15 - global.player_rank + 20;
							global.gold += pg;
							pc  = 3;
							pc1 = 0;
							if global.player_rank <= 10
								{ pc1 += 2; }
							if global.player_rank <= 5
								{ pc1 += 3; }
							if global.player_rank <= 3
								{ pc1 += 4; }
							if global.player_rank <= 2
								{ pc1 += 4; }
							if global.player_rank <= 1
								{ pc1 += 5; }
							if global.player_rank <= 0
								{ pc1 += 10; }
							
							global.cash += pc + pc1;
							
							if pc1 <= 0
								{
								txt_gold = "+" + string(pg) + "©";
								txt_cash = "+" + string(pc) + "ç";
								}
								else
								{
								txt_gold = "+" + string(pg) + "©";
								txt_cash = "+" + string(pc) + "(+" + string(pc1) + ")" + "ç";
								}
							
							//txt_gold = "+" + string(pg) + "©";
							//txt_cash = "+" + string(pc) + "ç";
							//txt_gold = "+10 (+10)©";
							//txt_cash = "+1 (+3)ç";
							//global.gold += 20;
							//global.cash += 4;
							ini_write_string("Sounds", "sound_on_g", string(global.gold));
							ini_write_string("Sounds", "sound_false_c", string(global.cash));
							}
							else
							{
							var pg, pc, pc1;
							pg = 15 - global.player_rank + 15;
							global.gold += pg;
							pc  = 2;
							pc1 = 0;
							if global.player_rank <= 10
								{ pc1 += 2; }
							if global.player_rank <= 5
								{ pc1 += 3; }
							if global.player_rank <= 3
								{ pc1 += 4; }
							if global.player_rank <= 2
								{ pc1 += 4; }
							if global.player_rank <= 1
								{ pc1 += 5; }
							if global.player_rank <= 0
								{ pc1 += 10; }
							
							global.cash += pc + pc1;
							
							if pc1 <= 0
								{
								txt_gold = "+" + string(pg) + "©";
								txt_cash = "+" + string(pc) + "ç";
								}
								else
								{
								txt_gold = "+" + string(pg) + "©";
								txt_cash = "+" + string(pc) + "(+" + string(pc1) + ")" + "ç";
								}
							//txt_gold = "+15 (+10)©";
							//txt_cash = "+2 (+3)ç";
							//global.gold += 25;
							//global.cash += 5;
							ini_write_string("Sounds", "sound_on_g", string(global.gold));
							ini_write_string("Sounds", "sound_false_c", string(global.cash));
							}
						}
				ini_close();
				if global.quick = 0 && whowin = 1
					{
					if global.sound
						{ audio_play_sound(sd_win, 2, 0); }
					}
				g_rank_stage = 7;
				}
			///////
			if g_rank_stage = 7
				{
				if writein = 0
					{
					global.player_rank = skul_i;
					ini_open("Music.ini");
						ini_write_string("Game", "lastgame2", string(global.last_game));
						ini_write_string("Game", "lastgame", string(!(whowin - 1)));
					
						ini_write_string("Ranks", "ranks", string(global.player_rank));
					
						ini_write_string("Ranks", "ranks", string(global.rank_stars));
					
						global.rank_stars = ini_read_real("Ranks", "ranks", 0);
					
						global.last_game2 = ini_read_real("Game", "lastgame2", 0);
						global.last_game  = ini_read_real("Game", "lastgame", 0);
					ini_close();
					writein = 1;
					}
				draw_set_font(global.game_font);
				if os_get_language() = "ru"
					{ draw_text_transformed_t(640, global.size - 60 + fin_y, "ВЕРНУТЬСЯ В МЕНЮ", 0.2, 0.2, 0, global.color_white, c_black); }
					else
					{ draw_text_transformed_t(640, global.size - 60 + fin_y, "TAP TO GO MENU", 0.2, 0.2, 0, global.color_white, c_black); }
				if mouse_check_button_pressed(mb_left)
					{
					global.p_totem[1] = -1;
					global.p_totem[2] = -1;
					global.p_totem[3] = -1;
					if room_gt = 0
						{ room_goto_t("menu"); room_gt = 1; }
					}
				}
			////////
			if g_rank_stage = 8
				{
				draw_set_font(global.game_font);
				if os_get_language() = "ru"
					{ draw_text_transformed_t(640, global.size - 60 + fin_y, "ВЕРНУТЬСЯ В МЕНЮ", 0.2, 0.2, 0, global.color_white, c_black); }
					else
					{ draw_text_transformed_t(640, global.size - 60 + fin_y, "TAP TO GO MENU", 0.2, 0.2, 0, global.color_white, c_black); }
				
				if mouse_check_button_pressed(mb_left)
					{
					global.p_totem[1] = -1;
					global.p_totem[2] = -1;
					global.p_totem[3] = -1;
					if room_gt = 0
						{ room_goto_t("menu"); room_gt = 1; }
					}
				}
			//////
			if g_rank_stage >= 7
				{
				if whowin = 1
					{
					global.wins += 1;
					GoogleAnalytics_SendEvent("WIN-LOSE","Игрок победил!");
					if global.request = 0
						{
						if req = 0
							{
							if global.wins = 3 or global.wins = 6 or global.wins = 10 or global.wins = 20
								{
								var a;
								a = requestReview();
								requestReview();
								
								//global.request = 1;
								
								if a = 1
									{
									GoogleAnalytics_SendEvent("REQUEST","Игрок нажал на отзыв!");
									global.request = 1;
									}
								}
							req = 1;
							}
						}
					ini_open("Music.ini");
						ini_write_string("Request", "request", string(global.request));
						ini_write_string("Request", "wins", string(global.wins));
							
					global.request = ini_read_real("Request", "request", 0);
					global.wins    = ini_read_real("Request", "wins", 0);
							
					ini_close();
					}
					else
					{ GoogleAnalytics_SendEvent("WIN-LOSE","Игрок проиграл!"); }
				}
			////////
			draw_set_font(global.game_font);
			if global.quick = 0
				{
				if txt_cash = ""
					{ draw_text_transformed_t(640, global.size - 150 + fin_y, txt_gold, 0.18, 0.18, 0, global.gold_color, c_black); }
					else
					{
					draw_text_transformed_t(640 - (string_width(txt_gold) * 0.18 / 2 - 5), global.size - 150 + fin_y, txt_gold, 0.18, 0.18, 0, global.gold_color, c_black);	
					draw_text_transformed_t(640 + string_width(txt_cash) * 0.18 / 2 + 5, global.size - 150 + fin_y, txt_cash, 0.18, 0.18, 0, global.cash_color, c_black);
					}
				}
			////////
			if g_message = 1
				{
				//g_skul_y = 0;
				draw_set_font(global.game_font);
				if os_get_language() = "ru"
					{ draw_text_transformed_t(640, global.size - 180 + fin_y, "ВЫ НЕ ТЕРЯЕТЕ ЗВЕЗДУ\nНА ЭТОМ РАНГЕ", 0.15, 0.15, 0, global.cash_color, c_black); }
					else
					{ draw_text_transformed_t(640, global.size - 180 + fin_y, "YOU DO NOT LOSE\nA STAR ON THIS RANK", 0.15, 0.15, 0, global.cash_color, c_black); }
				}
				
			if winstreak > 0
				{
				draw_set_font(global.game_font);
				if os_get_language() = "ru"
					{ draw_text_transformed_t(640, global.size - 180 + fin_y, "СЕРИЯ ПОБЕД!", 0.15, 0.15, 0, c_orange, c_black); }
					else
					{ draw_text_transformed_t(640, global.size - 180 + fin_y, "WIN STREAK!", 0.15, 0.15, 0, c_orange, c_black); }
				}
			
			if g_rank_stage >= 1
				{
				if global.quick = 0
					{
					#region Ранг
						draw_sprite_ext(s_rank_shield, 0, 640, global.size / 2 - 50 + 15, 1 * g_rank_s, 1 * g_rank_s, 0, c_black, 0.5);
						draw_sprite_ext(s_rank_shield, 0, 640, global.size / 2 - 50, 1 * g_rank_s, 1 * g_rank_s, 0, c_white, 1);
						
						if g_skul_s = 1
							{
							draw_sprite_ext(s_rank_skul, skul_i, 640, g_skul_y + global.size / 2 - 50 + 15, 1 * g_rank_s * g_skul_s, 1 * g_rank_s * g_skul_s, 0, c_black, 0.5);
							draw_sprite_ext(s_rank_skul, skul_i, 640, g_skul_y + global.size / 2 - 50, 1 * g_rank_s * g_skul_s, 1 * g_rank_s * g_skul_s, 0, c_white, 1);	
							}
						if g_rank_stage >= 2 && (g_rank_stage != 4 or g_rank_type != 1)
							{
							draw_set_alpha(g_star_a );
							if star_need = 2
								{
								draw_sprite_ext_t(s_rank_star, 0, 640 - 30, g_skul_y + global.size / 2 + 35, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
								draw_sprite_ext_t(s_rank_star, 0, 640 + 30, global.size / 2 + 35, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
							
								if star_now > 0
									{ draw_sprite_ext_t(s_rank_star, 0, 640 - 30, g_star_yy[1] + global.size / 2 + 35, 0.3 * g_star_ss[1], 0.3 * g_star_ss[1], 0, global.color_white, 1, global.color_white, c_black); }
								if star_now > 1
									{ draw_sprite_ext(s_rank_star, 0, 640 + 30, g_star_yy[2] + global.size / 2 + 35, 0.3 * g_star_ss[2], 0.3 * g_star_ss[2], 0, global.color_white, 1); }
								}
							if star_need = 3
								{
								draw_sprite_ext_t(s_rank_star, 0, 640 - 70, global.size / 2, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
								draw_sprite_ext_t(s_rank_star, 0, 640, global.size / 2 + 70, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
								draw_sprite_ext_t(s_rank_star, 0, 640 + 70, global.size / 2, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
			
								if star_now > 0
									{ draw_sprite_ext_t(s_rank_star, 0, 640 - 70, g_star_yy[1] + global.size / 2, 0.3 * g_star_ss[1], 0.3 * g_star_ss[1], 0, global.color_white, 1, global.color_white, c_black); }
								if star_now > 1
									{ draw_sprite_ext_t(s_rank_star, 0, 640, g_star_yy[2] + global.size / 2 + 70, 0.3 * g_star_ss[2], 0.3 * g_star_ss[2], 0, global.color_white, 1, global.color_white, c_black); }
								if star_now > 2
									{ draw_sprite_ext(s_rank_star, 0, 640 + 30, g_star_yy[3] + global.size / 2 + 35, 0.3 * g_star_ss[3], 0.3 * g_star_ss[3], 0, c_white, 1); }
								}
							if star_need = 4
								{
								draw_sprite_ext_t(s_rank_star, 0, 640 - 110, global.size / 2 - 40, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
								draw_sprite_ext_t(s_rank_star, 0, 640 - 50, global.size / 2 + 20, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
								draw_sprite_ext_t(s_rank_star, 0, 640 + 50, global.size / 2 + 20, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
								draw_sprite_ext_t(s_rank_star, 0, 640 + 110, global.size / 2 - 40, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
			
								if star_now > 0
									{ draw_sprite_ext_t(s_rank_star, 0, 640 - 110, g_star_yy[1] + global.size / 2 - 40, 0.3 * g_star_ss[1], 0.3 * g_star_ss[1], 0, global.color_white, 1, global.color_white, c_black); }
								if star_now > 1
									{ draw_sprite_ext_t(s_rank_star, 0, 640 - 50, g_star_yy[2] + global.size / 2 + 20, 0.3 * g_star_ss[2], 0.3 * g_star_ss[2], 0, global.color_white, 1, global.color_white, c_black); }
								if star_now > 2
									{ draw_sprite_ext_t(s_rank_star, 0, 640 + 50, g_star_yy[3] + global.size / 2 + 20, 0.3 * g_star_ss[3], 0.3 * g_star_ss[3], 0, global.color_white, 1, global.color_white, c_black); }
								if star_now > 3
									{ draw_sprite_ext_t(s_rank_star, 0, 640 + 110, g_star_yy[4] + global.size / 2 - 40, 0.3 * g_star_ss[4], 0.3 * g_star_ss[4], 0, global.color_white, 1, global.color_white, c_black); }
								}
							if star_need = 5
								{
								draw_sprite_ext_t(s_rank_star, 0, 640 - 100, global.size / 2 - 45, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
								draw_sprite_ext_t(s_rank_star, 0, 640 - 60, global.size / 2 + 15, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
								draw_sprite_ext_t(s_rank_star, 0, 640, global.size / 2 + 60, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
								draw_sprite_ext_t(s_rank_star, 0, 640 + 60, global.size / 2 + 15, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
								draw_sprite_ext_t(s_rank_star, 0, 640 + 100, global.size / 2 - 45, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
			
								if star_now > 0
									{ draw_sprite_ext_t(s_rank_star, 0, 640 - 100, g_star_yy[1] + global.size / 2 - 45, 0.3 * g_star_ss[1], 0.3 * g_star_ss[1], 0, global.color_white, 1, global.color_white, c_black); }
								if star_now > 1
									{ draw_sprite_ext_t(s_rank_star, 0, 640 - 60, g_star_yy[2] + global.size / 2 + 15, 0.3 * g_star_ss[2], 0.3 * g_star_ss[2], 0, global.color_white, 1, global.color_white, c_black); }
								if star_now > 2
									{ draw_sprite_ext_t(s_rank_star, 0, 640, g_star_yy[3] + global.size / 2 + 60, 0.3 * g_star_ss[3], 0.3 * g_star_ss[3], 0, global.color_white, 1, global.color_white, c_black); }
								if star_now > 3
									{ draw_sprite_ext_t(s_rank_star, 0, 640 + 60, g_star_yy[4] + global.size / 2 + 15, 0.3 * g_star_ss[4], 0.3 * g_star_ss[4], 0, global.color_white, 1, global.color_white, c_black); }
								if star_now > 4
									{ draw_sprite_ext_t(s_rank_star, 0, 640 + 100, g_star_yy[5] + global.size / 2 - 45, 0.3 * g_star_ss[5], 0.3 * g_star_ss[5], 0, global.color_white, 1, global.color_white, c_black); }
								}
							if star_need = 6
								{
								draw_sprite_ext_t(s_rank_star, 0, 640 - 120, global.size / 2 - 30, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
								draw_sprite_ext_t(s_rank_star, 0, 640 - 80, global.size / 2 + 20, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
								draw_sprite_ext_t(s_rank_star, 0, 640 - 40, global.size / 2 + 60, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
								draw_sprite_ext_t(s_rank_star, 0, 640 + 40, global.size / 2 + 60, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
								draw_sprite_ext_t(s_rank_star, 0, 640 + 80, global.size / 2 + 20, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
								draw_sprite_ext_t(s_rank_star, 0, 640 + 120, global.size / 2 - 30, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
			
								if star_now > 0
									{ draw_sprite_ext_t(s_rank_star, 0, 640 - 120, g_star_yy[1] + global.size / 2 - 30, 0.3 * g_star_ss[1], 0.3 * g_star_ss[1], 0, global.color_white, 1, global.color_white, c_black); }
								if star_now > 1
									{ draw_sprite_ext_t(s_rank_star, 0, 640 - 80, g_star_yy[2] + global.size / 2 + 20, 0.3 * g_star_ss[2], 0.3 * g_star_ss[2], 0, global.color_white, 1, global.color_white, c_black); }
								if star_now > 2
									{ draw_sprite_ext_t(s_rank_star, 0, 640 - 40, g_star_yy[3] + global.size / 2 + 60, 0.3 * g_star_ss[3], 0.3 * g_star_ss[3], 0, global.color_white, 1, global.color_white, c_black); }
								if star_now > 3
									{ draw_sprite_ext_t(s_rank_star, 0, 640 + 40, g_star_yy[4] + global.size / 2 + 60, 0.3 * g_star_ss[4], 0.3 * g_star_ss[4], 0, global.color_white, 1, global.color_white, c_black); }
								if star_now > 4
									{ draw_sprite_ext_t(s_rank_star, 0, 640 + 80, g_star_yy[5] + global.size / 2 + 20, 0.3 * g_star_ss[5], 0.3 * g_star_ss[5], 0, global.color_white, 1, global.color_white, c_black); }
								if star_now > 5
									{ draw_sprite_ext_t(s_rank_star, 0, 640 + 120, g_star_yy[6] + global.size / 2 - 30, 0.3 * g_star_ss[6], 0.3 * g_star_ss[6], 0, global.color_white, 1, global.color_white, c_black); }
								}
							draw_set_alpha(1);
							}
						draw_text_transformed_t(640, global.size / 2 - 150, string(skul_i), 0.27 * g_rank_s, 0.27 * g_rank_s, 5, global.color_white, c_black);
						if g_skul_s != 1
							{
							draw_sprite_ext(s_rank_skul, skul_i, 640, g_skul_y + global.size / 2 - 50 + 15, 1 * g_rank_s * g_skul_s, 1 * g_rank_s * g_skul_s, 0, c_black, 0.5);
							draw_sprite_ext(s_rank_skul, skul_i, 640, g_skul_y + global.size / 2 - 50, 1 * g_rank_s * g_skul_s, 1 * g_rank_s * g_skul_s, 0, c_white, 1);	
							}
					#endregion
					}
					else
					{
					draw_sprite_ext(s_sunmoon, 0, 640, global.size / 2 - 50 + 15, 0.5, 0.5, 0, c_black, 0.5);
					draw_sprite_ext_t(s_sunmoon, 0, 640, global.size / 2 - 50, 0.5, 0.5, 0, c_white, 1, c_white, c_black);
					
					draw_text_transformed_t(640, global.size / 2 - 50, txt_gold, 0.18, 0.18, 0, global.gold_color, c_black);
					}
				}	
			}
		if o_control.back_spd > 0
			{ o_control.back_spd -= 0.05; }
		}
#endregion
#region Хелсбар
	var gui_size;
	gui_size = 0.45;
	if hp > maxhp
		{ maxhp = hp; }
	if e_hp > e_maxhp
		{ e_maxhp = e_hp; }
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
	if anim_skul < 3
		{ anim_skul += 0.5; }
		else
		{ anim_skul = 0; }
	#region Хелсбар Игрока
		draw_sprite_ext_t(s_healthbar_hp, 0, h_x, h_y + h_y1, -gui_size * (0.20 + 0.8 * (maxhp / 1350)), gui_size * 0.4, 0, global.color_white, 1, c_white, c_black);
		
		var pers, dop;
		pers = (hp / maxhp)// * ((1205 - 35) * gui_size - 25);
		dop  = maxhp / 100;
	
		//////////
			draw_set_color(c_red);
			draw_rectangle(h_x + 20, h_y - h_s - 10 + h_y1, h_x + ((1205 - 35) * gui_size * (0.20 + 0.8 * (maxhp / 1350)) - 20) * health_hp / maxhp + 20, h_y - h_s / 8 - 10 + h_y1, 0);
			
			//draw_set_alpha(0.3);
			//draw_set_color(c_black);
			//draw_rectangle(h_x + 20, h_y - h_s / 3 - 10 + h_y1, h_x + ((1205 - 35) * gui_size - 25) * pers * 0.96 / round(maxhp) * health_hp + 20, h_y - h_s / 8 - 10 + h_y1, 0);
			//draw_set_alpha(1);
		//////////
		draw_set_color(global.color_white);
		draw_rectangle(h_x + 20, h_y - h_s - 10 + h_y1, h_x + ((1205 - 35) * gui_size * (0.20 + 0.8 * (maxhp / 1350)) - 20) * pers + 20, h_y - h_s / 8 - 10 + h_y1, 0);
		
		draw_set_alpha(0.3);
		draw_set_color(c_black);
		draw_rectangle(h_x + 20, h_y - h_s / 3 - 10 + h_y1, h_x + ((1205 - 35) * gui_size * (0.20 + 0.8 * (maxhp / 1350)) - 20) + 20, h_y - h_s / 8 - 10 + h_y1, 0);
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
		
		draw_set_font(global.game_font);
		
		if global.quick = 0
			{
			draw_sprite_ext_t(s_rank_shield, rank_i, 10 + sprite_get_width(s_rank_shield) * gui_size / 2, h_y - 5 + h_y1, gui_size * 0.8 * health_scale, gui_size * 0.8 * health_scale, 0 + restart_angle, c_white, 1, c_white, c_black);
			if global.player_rank <= 3
				{ draw_sprite_ext_t(s_rank_skul_1, anim_skul, 10 + sprite_get_width(s_rank_shield) * gui_size / 2, h_y - 5 + h_y1, gui_size * 0.8 * health_scale, gui_size * 0.8 * health_scale, 0 + restart_angle, c_white, 1, c_white, c_black); }
			draw_sprite_ext_t(s_rank_skul, skul, 10 + sprite_get_width(s_rank_shield) * gui_size / 2, h_y - 5 + h_y1, gui_size * 0.8 * health_scale, gui_size * 0.8 * health_scale, 0 + restart_angle, c_white, 1, c_white, c_black);
			draw_text_transformed_t(10 + sprite_get_width(s_rank_shield) * gui_size / 2, h_y + 35 + h_y1 + rank_yy, string(rank), 0.09 * health_scale, 0.09 * health_scale, 0, global.color_white, c_black);
			}
			else
			{ draw_sprite_ext_t(s_sunmoon, 0, 10 + sprite_get_width(s_rank_shield) * gui_size / 2, h_y - 5 + h_y1, gui_size * 0.8 * health_scale * 0.6, gui_size * 0.8 * health_scale * 0.6, 0 + restart_angle, c_white, 1, c_white, c_black); }
		
		draw_text_transformed_t(10 + sprite_get_width(s_rank_shield) * gui_size + string_width(string_upper(global.player_name)) * 0.1 / 2, h_y + 80 - 2 - sprite_get_height(s_healthbar_hp) * gui_size * 0.8 + h_y1, string_upper(global.player_name), 0.1, 0.1, 0, global.color_white, c_black);
		//20
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
		draw_sprite_ext_t(s_healthbar_hp, 0, 1280 - h_x, h_y + h_y1, gui_size * (0.20 + 0.8 * (e_maxhp / 1350)), gui_size * 0.4, 0, c_white, 1, c_white, c_black);
		
		var e_pers;
		e_pers = (e_hp / e_maxhp);
		
		draw_set_color(c_red);
		draw_rectangle(1280 - h_x - ((1205 - 35) * gui_size * (0.20 + 0.8 * (e_maxhp / 1350)) - 25) * health_e_hp / e_maxhp - 25, h_y - h_s / 8 - 10 + h_y1, 1280 - h_x - 25, h_y - h_s - 10 + h_y1, 0);
		
		draw_set_color(global.color_white);
		draw_rectangle(1280 - h_x - ((1205 - 35) * gui_size * (0.20 + 0.8 * (e_maxhp / 1350)) - 25) * e_pers - 25, h_y - h_s / 8 - 10 + h_y1, 1280 - h_x - 25, h_y - h_s - 10 + h_y1, 0);
		
		draw_set_alpha(0.3);
		draw_set_color(c_black);
		draw_rectangle(1280 - h_x - ((1205 - 35) * gui_size * (0.20 + 0.8 * (e_maxhp / 1350)) - 25) * e_pers - 25, h_y - h_s / 8 - 10 + h_y1, 1280 - h_x - 25, h_y - h_s / 3 - 10 + h_y1, 0);
		draw_set_alpha(1);
		
			draw_set_font(global.math_font);
			draw_set_halign(fa_right);
			draw_set_color(c_black);
		
			draw_set_alpha(0.8);
			//draw_text_transformed(1280 - h_x - ((1205 - 35) * gui_size - 25) * pers / round(e_hp) * health_e_hp, h_y - 35 + 11, string(round(e_hp)), 0.12, 0.12, 0);
			draw_set_alpha(1);
		
		var e_skul, e_rank, e_rank_i, e_rank_yy;
			e_skul = global.enemy_rank;
			e_rank_yy = -65;
			e_rank = string(global.enemy_rank);
			if global.enemy_rank <=5
				{ e_rank_i = 2; }
			if global.enemy_rank > 5 && global.enemy_rank <= 10
				{ e_rank_i = 1; }
			if global.enemy_rank > 10
				{ e_rank_i = 0; }
			if global.enemy_rank = 0
				{ e_rank_i = 3; e_rank = "LEGEND"; e_rank_yy = -45; }
		
		if global.quick = 0
			{
			draw_sprite_ext_t(s_rank_shield, e_rank_i, 1280 - 10 - sprite_get_width(s_rank_shield) * gui_size / 2, h_y - 5 + h_y1, gui_size * 0.8 * health_e_scale, gui_size * 0.8 * health_e_scale, 0 + restart_angle, c_white, 1, c_white, c_black);
			if global.enemy_rank <= 3
				{ draw_sprite_ext_t(s_rank_skul_1, anim_skul, 1280 - 10 - sprite_get_width(s_rank_shield) * gui_size / 2, h_y - 5 + h_y1/* + sprite_get_height(s_rank_shield) * gui_size / 2*/, gui_size * 0.8 * health_e_scale, gui_size * 0.8 * health_e_scale, 0 + restart_angle, c_white, 1, c_white, c_black); }
			draw_sprite_ext_t(s_rank_skul, e_skul, 1280 - 10 - sprite_get_width(s_rank_shield) * gui_size / 2, h_y - 5 + h_y1/* + sprite_get_height(s_rank_shield) * gui_size / 2*/, gui_size * 0.8 * health_e_scale, gui_size * 0.8 * health_e_scale, 0 + restart_angle, c_white, 1, c_white, c_black);
			
			draw_set_font(global.game_font);
			draw_text_transformed_t(1280 - (10 + sprite_get_width(s_rank_shield) * gui_size / 2), h_y + 35 + h_y1 + e_rank_yy, string(e_rank), 0.09, 0.09, 0, global.color_white, c_black);
			}
			else
			{ draw_sprite_ext_t(s_sunmoon, 0, 1280 - 10 - sprite_get_width(s_rank_shield) * gui_size / 2, h_y - 5 + h_y1, gui_size * 0.8 * health_e_scale * 0.6, gui_size * 0.8 * health_e_scale * 0.6, 0 + restart_angle, c_white, 1, c_white, c_black); }
		
		draw_set_font(global.game_font);
		if global.jr_e = 1
			{
			if os_get_language() = "ru"
				{ draw_text_transformed_t(1280 - (10 + sprite_get_width(s_rank_shield) * gui_size + string_width(string_upper(global.enemy_name)) * 0.1 / 2), h_y + 80 - 2 - sprite_get_height(s_healthbar_hp) * gui_size * 0.8 + h_y1, string_upper(global.enemy_name) + " JR.", 0.1, 0.1, 0, global.color_white, c_black); }
				else
				{ draw_text_transformed_t(1280 - (10 + sprite_get_width(s_rank_shield) * gui_size + string_width(string_upper(global.enemy_name) + " МЛ.") * 0.1 / 2), h_y + 80 - 2 - sprite_get_height(s_healthbar_hp) * gui_size * 0.8 + h_y1, string_upper(global.enemy_name) + " МЛ.", 0.1, 0.1, 0, global.color_white, c_black); }
			}
			else
			{ draw_text_transformed_t(1280 - (10 + sprite_get_width(s_rank_shield) * gui_size + string_width(string_upper(global.enemy_name)) * 0.1 / 2), h_y + 80 - 2 - sprite_get_height(s_healthbar_hp) * gui_size * 0.8 + h_y1, string_upper(global.enemy_name), 0.1, 0.1, 0, global.color_white, c_black); }
		
		//for(i=1; i<=3; i++)
		//	{
		//	draw_sprite_ext(s_healthbar_table_skul, 0, 1280 - h_x - 10/*20 + sprite_get_width(s_rank_shield) * gui_size + string_width(string_upper(global.player_name)) * 0.1 + sprite_get_width(s_healthbar_table_skul) * gui_size * i * 1.3*/, h_y - 4 - sprite_get_height(s_healthbar_hp) * gui_size, gui_size, gui_size, 0, c_black, 0.75);
		//	draw_sprite_ext(s_healthbar_table_skul, 0, 1280 - h_x - 10/*20 + sprite_get_width(s_rank_shield) * gui_size + string_width(string_upper(global.player_name)) * 0.1 + sprite_get_width(s_healthbar_table_skul) * gui_size * i * 1.3*/, h_y - 4 - sprite_get_height(s_healthbar_hp) * gui_size + roundskul_y[i], roundskul_s[i], roundskul_s[i], 0, c_white, 1);
		//	if roundskul[i] = 2 && roundskul_n[i] > 0
		//		{ draw_sprite_ext(s_healthbar_table_x, 0, 1280 - h_x - 10/*20 + sprite_get_width(s_rank_shield) * gui_size + string_width(string_upper(global.player_name)) * 0.1 + sprite_get_width(s_healthbar_table_skul) * gui_size * i * 1.3*/, h_y - 4 - sprite_get_height(s_healthbar_hp) * gui_size + roundskul_y[i], roundskul_s[i] * 0.7, roundskul_s[i] * 0.7, roundskul_xa[i], c_white, 1); }
		//	}
	#endregion
	//////////////////////////////
	/////////////////////////////
	if whowin_stage >= 3//win_stage >= 4
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
	/*
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
		*/
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
#region Смайлы
	if 0
		{
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
							if global.sound = 1
								{ audio_play_sound(sd_text, 2, 0); }
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
		}
	#endregion
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
		
//if view_go_down = 0
//	{
//	if view_yport != 0
//		{ view_yport = 0; }
//	}
//if view_go_left = 0 && view_go_right = 0
//	{
//	if view_xport != 0
//		{ view_xport = 0; }
//	}
	
#endregion
#region Критикал
	if global.critical = 3 - 1 * global.p_totem_a[3]
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
	if os_get_language() != "ru"
		{ draw_text_transformed_t(critical_x, global.size / 2 + critical_y, "CRITICAL", 0.2 * critical_s, 0.2 * critical_s, 0, (global.player_object).hero_color, c_black); }
		else
		{ draw_text_transformed_t(critical_x, global.size / 2 + critical_y, "КРИТ УРОН", 0.2 * critical_s, 0.2 * critical_s, 0, (global.player_object).hero_color, c_black); }
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
	if answer_rec > 0 && global.idol[2] != 4
		{
		draw_set_alpha(answer_alp);
		draw_rectangle_color(0, 0, 1280, global.size, answer_col, answer_col, answer_col, answer_col, 0);
		draw_set_alpha(1);
		}
	if global.idol[1] = 4 or global.idol[2] = 4 or global.idol[3] = 4
		{
		if idol_alpha_s = 0
			{
			if idol_alpha < 0.2
				{ idol_alpha += 0.002; }
				else
				{ idol_alpha_s = 1; }
			}
		if idol_alpha_s = 1
			{
			if idol_alpha > 0
				{ idol_alpha -= 0.002; }
				else
				{ idol_alpha_s = 0; }
			}
		var idol_col;
		if global.idol[1] = 4
			{ idol_col = make_color_rgb(253,265,15); }
		if global.idol[2] = 4
			{ idol_col = make_color_rgb(170,240,209); }
		if global.idol[3] = 4
			{ idol_col = make_color_rgb(127,199,255); }
		draw_set_alpha(idol_alpha);
		draw_rectangle_color(0, 0, 1280, global.size, idol_col, idol_col, idol_col, idol_col, 0);
		draw_set_alpha(1);
		}
#endregion
#region ОБУЧЕНИЕ
	if global.training > 0 && global.tot = -1//= 1
		{
		var training_text_color;
		training_text_color = global.color_hero[global.training];
		if global.training = 1
			{ training_text_color = global.color_white; }
		if global.training_stage[3] = 8 or global.training_stage[4] = 16
			{ training_text_color = c_red; }
		
		global.p_totem[1] = -1;
		global.p_totem[2] = -1;
		global.p_totem[3] = -1;
		
		global.e_totem[1] = -1;
		global.e_totem[2] = -1;
		global.e_totem[3] = -1;
		
		if global.training_stage[global.training] = 22
			{ list_go = 0; list_scale = 0; }
		
		var txt_t, txt_t1, txt_t2, txt_t3, txt_t4;
		txt_t = global.training_text[global.training,global.training_stage[global.training]];
		
		var cccc;
		cccc = 0;
		if global.training_stage[global.training] = 10 && round_task[global.rounds,1] != 2
			{ round_task[global.rounds,1] = 2; cccc = 1; }
		if global.training_stage[global.training] = 14 && round_task[global.rounds,1] != 3
			{ round_task[global.rounds,1] = 3; cccc = 1; }
		if global.training_stage[global.training] = 18 && round_task[global.rounds,1] != 4
			{ round_task[global.rounds,1] = 4; cccc = 1; }
		
		if cccc = 1
			{
			if theme_round[global.rounds] = 6
				{ script_execute(asset_get_index("math_" + string(round_task[global.rounds,global.task]))); }
			if theme_round[global.rounds] = 2
				{ script_execute(asset_get_index("bottles_" + string(round_task[global.rounds,global.task]))); }
			if theme_round[global.rounds] = 3
				{ script_execute(asset_get_index("move_" + string(round_task[global.rounds,global.task]))); }
			if theme_round[global.rounds] = 4
				{ script_execute(asset_get_index("attention_" + string(round_task[global.rounds,global.task]))); }
			if theme_round[global.rounds] = 1
				{ script_execute(asset_get_index("cards_" + string(round_task[global.rounds,global.task]))); }
			if theme_round[global.rounds] = 5
				{ script_execute(asset_get_index("shooting_" + string(round_task[global.rounds,global.task]))); }
			}
		
		if global.text_ne = 1
			{
			if (mouse_check_button_pressed(mb_left) && global.text_sc = 1) or txt_t = ""
				{
				if global.training_stage[global.training] = 22 
					{
					if global.tr[global.training] = 1
						{
						ini_open("Music.ini");
							#region Обучение
								///
								//ini_write_string("Training", "training", "0");
							
								ini_write_string("Training", "tr" + string(global.training), "2");
								if global.training + 1 <= 6
									{ ini_write_string("Training", "tr" + string(global.training + 1), "1"); }
							
								global.training_o = ini_read_real("Training", "training", 0);
							
								global.tr[1] = ini_read_real("Training", "tr1", 0);
								global.tr[2] = ini_read_real("Training", "tr2", 0);
								global.tr[3] = ini_read_real("Training", "tr3", 0);
								global.tr[4] = ini_read_real("Training", "tr4", 0);
								global.tr[5] = ini_read_real("Training", "tr5", 0);
								global.tr[6] = ini_read_real("Training", "tr6", 0);
								///
							#endregion
						ini_close();
						}
					if global.training != 6
						{ room_goto_t("menu"); }
						else
						{ global.shomen = 1; room_goto_t("duel"); }
					}
				
				if global.training_stage[1] = 12 
					{
					if card_time = 0
						{
						global.text_go = 1;
						global.text_ne = 0;
						}
					}
					else
					{
					global.text_go = 1;
					global.text_ne = 0;
					}
				}
			}
		
		if global.training_stage[global.training] < 6 or global.training_stage[global.training] = 22
			{
			draw_set_alpha(0.45);
			draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
			draw_set_alpha(1);
			
			//}
		//if global.training_stage[global.training] = 1
			//{
			global.training_hand_x = - 200;
			global.training_hand_y = - 200;
			list_go = 0;
			list_scale = 0;
			
			if global.training_x > 1280 - 160
				{ global.training_x -= 40; }
				else
				{ global.text_ne = 1; }
			
			if global.text_go = 0
				{
				if global.text_sc < 1
					{ global.text_sc += 0.1; }
				}
				else
				{
				if global.text_sc > 0
					{ global.text_sc -= 0.1; }
					else
					{
					global.training_stage[global.training] += 1;
					
					if global.training = 7 && global.training_stage[7] = 6
						{
						global.shomen = 2;
						room_goto_t("duel");
						
						ini_open("Music.ini");
							global.gold += 150;
							global.cash += 15;
							ini_write_string("Sounds", "sound_on_g", string(global.gold));
							ini_write_string("Sounds", "sound_false_c", string(global.cash));
						ini_close();
						}
					global.text_ne = 1;
					global.text_go = 0;
					}
				}
			}
		if global.training_x <= 1280
			{ global.training_hero_i += 1; }
		var heroo;
		heroo = asset_get_index("s_" + global.hero_code_name[global.training]);
		draw_sprite_ext(heroo, global.training_hero_i, global.training_x, global.size / 2 + 450, 1, 1, 0, c_white, 1);
		
		draw_sprite_ext_t(s_training_hand, global.training_hand_i, global.training_hand_x, global.training_hand_y, 1, 1, 0, global.color_white, 1, global.color_white, c_black);
		
		if global.super_ability = 0
			{
			if global.training_stage[global.training] < 6 or global.training_stage[global.training] = 22
				{
				draw_set_font(global.game_font);
				draw_text_ext_transformed_t(640, global.size / 2, txt_t, -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
				}
			
			if global.training_stage[global.training] = 6 or global.training_stage[global.training]  = 10
			or global.training_stage[global.training] = 14 or global.training_stage[global.training] = 18
				{
				if global.training_x < 1280 + 500
					{ global.training_x += 50; }
					else
					{ list_go = 1; }
				
				if global.text_go = 0
					{
					if global.text_sc < 1
						{ global.text_sc += 0.1; }
					}
			
				txt_t = global.training_text[global.training,global.training_stage[global.training]];
				draw_set_font(global.game_font);
				draw_text_ext_transformed_t(1020, global.size / 2 - 100, txt_t, -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
				}
			if global.training_stage[global.training] = 7  or global.training_stage[global.training] = 11
			or global.training_stage[global.training] = 15 or global.training_stage[global.training] = 19
				{
				if !(global.training_stage[2] = 11 && global.training_question != 0)
					{
					if ((global.training = 6 && global.training_question = 0)
					or global.training_stage[6] = 16 or global.training_stage[6] = 20) or global.training != 6
						{
						txt_t  = global.training_text[global.training,global.training_stage[global.training]-1];
						txt_t1 = global.training_text[global.training,global.training_stage[global.training]];
						draw_set_font(global.game_font);
						draw_text_ext_transformed_t(1020, global.size / 2 - 100, txt_t, -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
						draw_text_ext_transformed_t(260, global.size / 2 + 20, txt_t1, -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
						}
					}
				}
			if global.training_stage[global.training] = 8  or global.training_stage[global.training] = 12
			or global.training_stage[global.training] = 16 or global.training_stage[global.training] = 20
				{
				if ((global.training_question = 0) or (global.training_question = 1 && global.training_stage[3] = 8)
				 or (global.training_question = 1 && global.training_stage[4] = 16))
					{
					if (global.training = 6 && global.training_question = 0) or global.training != 6
						{
						txt_t  = global.training_text[global.training,global.training_stage[global.training]-2];
						txt_t1 = global.training_text[global.training,global.training_stage[global.training]-1];
						txt_t2 = global.training_text[global.training,global.training_stage[global.training]];
						draw_set_font(global.game_font);
						draw_text_ext_transformed_t(1020, global.size / 2 - 100, txt_t,  -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
						draw_text_ext_transformed_t(260, global.size / 2 + 20, txt_t1, -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
						draw_text_ext_transformed_t(1020, global.size / 2 + 100, txt_t2, -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
						}
					}
				}
			if global.training_stage[global.training] = 9  or global.training_stage[global.training] = 13
			or global.training_stage[global.training] = 17 or global.training_stage[global.training] = 21
				{
				if global.training_question = 0
					{
					txt_t  = global.training_text[global.training,global.training_stage[global.training]-3];
					txt_t1 = global.training_text[global.training,global.training_stage[global.training]-2];
					txt_t2 = global.training_text[global.training,global.training_stage[global.training]-1];
					txt_t3 = global.training_text[global.training,global.training_stage[global.training]];
					draw_set_font(global.game_font);
					draw_text_ext_transformed_t(1020, global.size / 2 - 100, txt_t,  -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
					draw_text_ext_transformed_t(260, global.size / 2 - 100, txt_t1, -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
					draw_text_ext_transformed_t(1020, global.size / 2 + 100, txt_t2, -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
					draw_text_ext_transformed_t(260, global.size / 2 + 100, txt_t3, -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
				
					if txt_t3 = ""
						{
						if global.training = 1 && global.training_stage[1] = 17
							{
							global.training_hand_s   = 0;
							global.training_question = 0;
							global.text_ne = 1;
							global.text_go = 0;
										
							global.training_stage[global.training] = 22;
							//round_task[global.rounds,1] += 1;
							}
							else
							{
							global.training_stage[global.training] += 1;
							global.text_ne = 1;
							global.text_go = 0;
							if global.training = 1 && global.training_stage[1] > 17
								{ round_task[global.rounds,1] += 1; }
							}
						}
					}
			
				//if global.text_go = 1
				//	{
				//	if global.text_sc > 0
				//		{ global.text_sc -= 0.1; }
				//		else
				//		{
				//		global.training_stage[global.training] += 1;
				//		global.text_ne = 1;
				//		global.text_go = 0;
				//		}
				//	}
				}
			}
		if global.training != 2
			{ global.critical = 0; }
		if global.training != 6
			{
			global.super_ability = 0;
			super = 0;
			super_now = 0;
			}
		
		if global.training_hand_i < 11
			{ global.training_hand_i += 0.4; }
			else
			{ global.training_hand_i = 0; }
			
		//if global.training_gb != ""
		//	{
		//	if global.training_gb_t > 0
		//		{
		//		if global.training_gb_y > global.size - 60
		//			{ global.training_gb_y -= 20; }
		//			else
		//			{ global.training_gb_t -= 1; }
		//		}
		//		else
		//		{
		//		if global.training_gb_y < global.size + 100
		//			{ global.training_gb_y += 20; }
		//			else
		//			{
		//			global.training_gb   = ""; //choose("GOOD!", "AWESOME!", "EXELLENT", "TRY AGAIN");
		//			global.training_gb_y = global.size + 100;
		//			global.training_gb_t = room_speed;
		//			}
		//		}
		//	var colorr;
		//	colorr = global.color_hero[2];
		//	if global.training_gb = "TRY AGAIN"
		//		{ colorr = global.color_hero[4]; }
		//	draw_text_transformed_t(640, global.training_gb_y, global.training_gb, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, colorr, c_black);
		//	}
		}
#endregion
#region Музыка
	var musica;
		musica = asset_get_index("sd_" + string(global.background));
	//if global.sound = 1
	//	{
	//	if global.background = "train"
	//		{ audio_play_sound(sd_back_train, 0, true); }
	//	if global.background = "waterfall"
	//		{ audio_play_sound(sd_back_waterfall, 0, true); }
	//	}
	if global.music = 1
		{
		//if audio_is_paused(musica)
		//	{ audio_stop_sound(musica); }
		
		if !audio_is_playing(musica)
			{
			audio_stop_all();
			if global.background = "train"
				{ audio_play_sound(sd_back_train, 0, true); }
			if global.background = "waterfall"
				{ audio_play_sound(sd_back_waterfall, 0, true); }
			audio_play_sound(musica, 1, true);
			}
		}
		//else
		//{
		//if audio_is_playing(musica)
		//	{ audio_pause_sound(musica); }
		//}
#endregion
#region Проверка на слив
	global.notend = 0;
	if roundskul[1] = 0 && roundskul[2] = 0 && roundskul[3] = 0
		{
		if (hp / maxhp) < (e_hp / e_maxhp)
			{ global.notend = 1; }
		}
	if roundskul[1] = 1 && roundskul[2] = 2 && roundskul[3] = 0
		{
		if (hp / maxhp) < (e_hp / e_maxhp)
			{ global.notend = 1; }
		}
	if roundskul[1] = 2 && roundskul[2] = 1 && roundskul[3] = 0
		{
		if (hp / maxhp) < (e_hp / e_maxhp)
			{ global.notend = 1; }
		}
	if roundskul[1] = 2 && roundskul[2] = 0 && roundskul[3] = 0
		{ global.notend = 1; }
	if roundskul[1] = 2 && roundskul[2] = 2 && roundskul[3] = 0
		{ global.notend = 1; }
	if roundskul[1] = 2 && roundskul[2] = 1 && roundskul[3] = 2
		{ global.notend = 1; }
	if roundskul[1] = 1 && roundskul[2] = 2 && roundskul[3] = 2
		{ global.notend = 1; }
	
	ini_open("Music.ini")
		ini_write_string("Musica", "back", string(global.notend));
	ini_close();
#endregion

#region Словечки
	if global.training_gb != ""
		{
		if global.training_gb_t > 0
			{
			if global.training_gb_y > global.size - 60
				{ global.training_gb_y -= 20; }
				else
				{ global.training_gb_t -= 1; }
			}
			else
			{
			if global.training_gb_y < global.size + 100
				{ global.training_gb_y += 20; }
				else
				{
				global.training_gb   = ""; //choose("GOOD!", "AWESOME!", "EXELLENT", "TRY AGAIN");
				global.training_gb_y = global.size + 100;
				global.training_gb_t = room_speed;
				}
			}
		var colorr;
		colorr = global.color_hero[2];
		if global.training_gb = "TRY AGAIN"
			{ colorr = global.color_hero[4]; }
		if global.training_gb = "TRY AGAIN"
			{
			if os_get_language() = "ru"
				{ draw_text_transformed_t(640, global.training_gb_y, "ПОПРОБУЙ ЕЩЁ!", 0.18 * global.text_sc, 0.18 * global.text_sc, 8, colorr, c_black); }
				else
				{ draw_text_transformed_t(640, global.training_gb_y, global.training_gb, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, colorr, c_black); }
			}
			else
			{ draw_text_transformed_t(640, global.training_gb_y, global.training_gb, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, colorr, c_black); }
		}
#endregion
#region Шэйк-эффект
	//if shaker = 1
	//	{
	//	if shaker_spd > 0
	//		{
	//		if (shaker_ang < shaker_spd && shaker_dir = 1) or (shaker_ang > shaker_spd && shaker_dir = -1)
	//			{ shaker_ang += 1 * shaker_dir; }
	//			else
	//			{
	//			shaker_dir  = -shaker_dir;
	//			shaker_ang += 1 * shaker_dir;
	//			shaker_spd -= 1;
	//			}
	//		camera_set_view_angle(camera_get_active(), shaker_ang);
	//		}
	//		else
	//		{
	//		shaker = 0;
	//		shaker_dir = 1;
	//		shaker_spd = 10;
	//		shaker_ang = 0;
	//		}
	//	}
	//if keyboard_check_pressed(ord("I"))
	//	{ shaker = !shaker; }
#endregion
#region Отладка
	//draw_set_font(global.game_font);
	//draw_text_transformed(mouse_x, mouse_y, string(totem_txt), 0.2, 0.2, 0);//draw_text_transformed_t(mouse_x, mouse_y, string(global.tot), 0.25, 0.25, 0, c_white, c_black);
#endregion