#region Идолы
	for(i = 1; i <= 3; i ++)
	{
		#region Координата X идола
			//global.idol_x[i] = 640 - 250 * (global.idol_h[i] == 1) + 250 * (global.idol_h[i] == 0);
		#endregion
		#region Координаты Y идолов
			switch(global.idol[i])
			{
				case 0:
					if global.idol_y[i] > -200
					{
						global.idol_y[i] -= 70;
					}
					else
					{
						if global.idol_h[i] != -1
						{
							global.idol[i] = 1//0;
							//global.idol_x[i] = 640 - 250 * (global.idol_h[i] == 1) + 250 * (global.idol_h[i] == 0);
							global.idol_x[i] = 640 - (250 - 110 + 110 * (i - 1)) * (global.idol_h[i] == 1) + (250 - 110 + 110 * (i - 1)) * (global.idol_h[i] == 0);
						}
					}
				break;
				case 1:
					if global.idol_y[i] < o_hero.y // + 120 - 120 * i
					{
						global.idol_y[i] += 50;
					}
					else
					{
						global.idol[i] = 2;
					}
				break;
				case 2:
					if global.idol_s[i] > 0.8
					{
						global.idol_s[i] -= 0.05;
					}
					else
					{
						global.idol[i] = 3;
					}
				break;
				case 3:
					if global.idol_s[i] < 1
					{
						global.idol_s[i] += 0.05;
					}
					else
					{
						global.idol[i]   = 4;
						global.idol_s[i] = 1;
					}
				break;
				case 4:
					global.idol_y[i] = o_hero.y; // + 120 - 120 * i;
				break;
			}
		#endregion
		#region Отрисовка идола
			draw_sprite_ext_t(s_idols, i - 1, global.idol_x[i], (global.idol_h[i]==0) * o_control.back_train_y1 + (global.idol_h[i]==1) * o_control.back_train_y2 + global.idol_y[i], 1 * o_hero.scale * 1.3, global.idol_s[i] * o_hero.scale * 1.3, 0, c_white, 1, c_white, c_black);	
		#endregion
		#region Эффект и Отрисовка эффектов
		for(j = 0; j <= 1; j ++)
		{
			if global.anim[i,j] > -1
			{
				if global.idol[i] > 0 && global.anim[i,j] > -1
				{
					if global.anim[i,j] < 5
					{
						global.anim[i,j] += 0.35;
					}
					else
					{
						global.anim[i,j] = -1;
						if i = 3
						{
							#region Идол игрока
								if j = 1
								{
									if hp >= 1 && e_hp >= 1
									{
										hp -= e_atk / 2;
									}
									dop_i[1] = 7;
									dop_text_color[1] = global.color_hero[7];
									dop_text[7] = "-" + string(round(e_atk / 2));
									with(global.enemy_object)
									{
										if global.super_ability = 0 && !(skeleton_animation_get() = "super") && !(image_index <= hero_shoot && skeleton_animation_get() = "shoot")
										{
											if stun != 0
											{
												stun = 0;
												answer = -1;
											}
											skeleton_animation_set("damaged");
											change = 1;
											if global.online
											{
												o_client.cl_stage[15] = 1; //o_client.cl_stage[1] = 15;
											}
										}
									}
								}
								#endregion
							#region Идол врага
								if j = 0
								{
									/////// КВЕСТЫ
									for(l = 1; l <= 3; l ++)
									{
										if global.quests_a[l] = 1
										{
											if global.quests_t[l] = 25
											{
												if global.quests_n_now[l] < global.quests_n_all[l]
												{
													global.quests_n_now[l] += atk / 2;
												}
											}
											ini_open("Music.ini");
												ini_write_string("Qual", "qual_nno_" + string(l), string(global.quests_n_now[l]));
											ini_close();
										}
									}
									/////// КВЕСТЫ
									if hp >= 1 && e_hp >= 1
									{
										e_hp -= atk / 2;
									}
									dop_i[2] = 8;
									dop_text_color[2] = global.color_hero[7];
									dop_text[8] = "-" + string(round(atk / 2));
									with(global.enemy_object)
									{
										if global.super_ability = 0 && !(skeleton_animation_get() = "super") && !(image_index <= hero_shoot && skeleton_animation_get() = "shoot")
										{
											if stun != 0
											{
												stun = 0;
												answer = -1;
											}
											skeleton_animation_set("damaged");
											change = 1;
										}
									}
								}
							#endregion
						}
					}
					if i = 2 && global.anim[2,j] > -1
					{
						draw_sprite_ext_t(s_wind, global.anim[i,j], (global.player_object).x * (j==1) + (global.enemy_object).x * (j==0), (j==1) * o_control.back_train_y1 + (j==0) * o_control.back_train_y2 + (global.player_object).y * (j==1) + (global.enemy_object).y * (j==0), 1.4 * o_hero.scale, global.idol_s[i] * o_hero.scale, 0, c_white, 1, c_white, c_black);
					}
					if i = 3 && global.anim[3,j] > -1
					{
						draw_sprite_ext_t(s_bolt, global.anim[i,j], (global.player_object).x * (j==1) + (global.enemy_object).x * (j==0), (j==1) * o_control.back_train_y1 + (j==0) * o_control.back_train_y2 + (global.player_object).y * (j==1) + (global.enemy_object).y * (j==0), 1.4 * o_hero.scale, global.idol_s[i] * o_hero.scale, 0, c_white, 1, c_white, c_black);
					}
				}
			}
		}
		#endregion
	}
#endregion
#region Фон
	var prx, pry;
	prx = global.paral_x * global.paral_sx;
	pry = global.paral_y * global.paral_sy;
	if global.background = "mine"
	{
		var hui;
		hui = 100 * 960 / global.height;
		draw_sprite_ext(s_mine_rock1, 0, 0 + prx - 15, global.height + hui + pry, 1, 1, 0, c_white, 1);
		draw_sprite_ext(s_mine_rock2, 0, global.width + prx + 15, global.height + 100 + hui + pry, 1, 1, 0, c_white, 1);
	}
	if global.background = "saloon"
	{
		if o_control.sl_tumble_y > o_hero.y - 40
		{
			draw_sprite_ext(s_saloon_tumbleweed, 0, o_control.sl_tumble_x - prx, o_control.sl_tumble_y - pry, o_control.sl_tumble_s, o_control.sl_tumble_s, o_control.sl_tumble_a, c_white, 1);
		}
		draw_sprite_ext_t(s_saloon_house, 0, 640 + o_control.back_x + prx, global.height + o_control.back_y + pry, 1, 1, 0, c_white, 1, c_white, c_black);
		draw_sprite_ext_t(s_saloon_wanted, o_control.sl_wanted_i, 640 + o_control.back_x + prx, global.height + o_control.back_y + pry, 1, 1, 0, c_white, 1, c_white, c_black);
	}
#endregion
#region Смена способности
	if global.hero = 1 && global.enemy_hero = 1
	{
		super_now    = 0;
		super_need   = 40;
		e_super_now  = 0;
		e_super_need = 40;
		super_zhopa  = 300;
		global.swipe_ability = 0;
	}
#endregion
#region Листовка
	#region Появление
		button_x = 250;
		var list_size, list_size1;
		list_size  = (0.35 + 0.05 * (global.height - 590) / 370) * o_but_sc;
		list_size1 = (0.4 + 0.05 * (global.height - 590) / 370) * o_but_sc;
		if list_go
		{
			if list_y >= 20
			{
				if plas_scale < 1
				{
					plas_scale += 0.11;
				}
				else
				{
					if plas_scale > 1
					{
						plas_scale -= 0.01;
					}
					else
					{
						plas_scale = 1;
						if list_scale < 1
						{
							list_scale += 0.11;
						}
						else
						{
							if list_scale > 1
							{
								list_scale -= 0.01;
							}
							//if global.online = 0
							//{
								bot_go = 1;
							//}
						}
					}
				}
			}
			else
			{
				list_y += 10;
			}
		}
		if global.pvp = 0
		{
			if (global.player_object).stun
			{
				list_scale = 0;
			}
		}
		else
		{
			if ((global.player_object).stun && global.now = 0)
			or ((global.enemy_object).stun && global.now = 1)
			{
				list_scale = 0;
			}
		}
	#endregion
	#region ТЕМЫ
		#region Очистка мыши, перемнные координат
			if global.super_ability = 1
			{
				io_clear();
			}
			global.training_hand_x = -200;
			global.training_hand_y = -200;
			var mouse_x1, mouse_y1;
		#endregion
		if theme_round[global.rounds] != -1 && theme_choose = 4 && global.super_ability = 0
		{
			#region Текст вопроса
				var pvp_x;
				pvp_x = 0;
				question_text = "";
				with(global.player_object)
				{
					if shoot = 0 && !(skeleton_animation_get() = "super") && !(skeleton_animation_get() = "shoot")
					{
						global.cananswer = 1;
					}
					else
					{
						global.cananswer = 0;
					}
				}
				with(global.enemy_object)
				{
					if shoot = 0// && (skeleton_animation_get() = "idle")
					{
						global.e_abilitican = 1;
					}
					else
					{
						global.e_abilitican = 0;
					}
				}
				with(global.player_object)
				{
					if shoot = 0// && (skeleton_animation_get() = "idle")
					{
						global.abilitican = 1;
					}
					else
					{
						global.abilitican = 0;
					}
				}
			#endregion
			#region Математика - Math
				if theme_round[global.rounds] = 6
				{
					#region ТРЕНИРОВКА: координаты руки
						if global.training = 6
						{
							var hand_xxx, hand_yyy;
							hand_xxx = -200;
							hand_yyy = -200;
							global.training_hand_x = hand_xxx;
							global.training_hand_y = hand_yyy;
						}
					#endregion
					#region ТАЙМЕР: Ожидание и координаты
						timer_y  = -30;
						pre_wait = 0;
					#endregion
					#region Задача 1 - Знаки
						if round_task[global.rounds,global.task] = 1
						{
							#region Координаты кнопок
								var x1, y1, x2, y2, x3, y3, x4, y4, button_width, button_height;
								button_width  = sprite_get_width(s_question_sign)  * list_size1 * o_but_sc;
								button_height = sprite_get_height(s_question_sign) * list_size1 * o_but_sc;
								x1 = 640 - button_width / 2 * 3 - 45 + pvp_x;
								y1 = global.height / 2 + 50;
								x2 = 640 - button_width / 2 - 15 + pvp_x;
								y2 = y1;
								x3 = 640 + button_width / 2 + 15 + pvp_x;
								y3 = global.height / 2 + 50;
								x4 = 640 + button_width / 2 * 3 + 45 + pvp_x;
								y4 = y3;
							#endregion
							#region Варианты
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if global.training < 1 or global.training_question != 0
										{
											#region Вариант 1
												if point_in_rectangle(mouse_x1, mouse_y1, x1 - button_width / 2, y1 - button_height / 2, x1 + button_width / 2, y1 + button_height / 2)
												{
													if device_mouse_check_button(dev, mb_left)
													{
														b_pressed_s[1] = 1.2;
													}
													else
													{
														b_pressed_s[1] = 1;
													}
													if device_mouse_check_button_released(dev, mb_left)
													{
														if global.sound
														{
															audio_play_sound(sd_text, 2, 0);
														}
														if vtrue[1] = 1
														{
															global.answer = 1;
														}
														else
														{
															global.answer = 0;
														}
														math_1();
													}
												}
												else
												{
													b_pressed_s[1] = 1;
												}
											#endregion
											#region Вариант 2
												if point_in_rectangle(mouse_x1, mouse_y1, x2 - button_width / 2, y2 - button_height / 2, x2 + button_width / 2, y2 + button_height / 2)
												{
													if device_mouse_check_button(dev, mb_left)
													{
														b_pressed_s[2] = 1.2;
													}
													else
													{
														b_pressed_s[2] = 1;
													}
													if device_mouse_check_button_released(dev, mb_left)
													{
														if global.sound
														{
															audio_play_sound(sd_text, 2, 0);
														}
														if vtrue[2] = 1
														{
															global.answer = 1;
														}
														else
														{
															global.answer = 0;
														}
														math_1();
													}
												}
												else
												{
													b_pressed_s[2] = 1;
												}
											#endregion
											#region Вариант 3
												if point_in_rectangle(mouse_x1, mouse_y1, x3 - button_width / 2, y3 - button_height / 2, x3 + button_width / 2, y3 + button_height / 2)
												{
													if device_mouse_check_button(dev, mb_left)
													{
														b_pressed_s[3] = 1.2;
													}
													else
													{
														b_pressed_s[3] = 1;
													}
													if device_mouse_check_button_released(dev, mb_left)
													{
														if global.sound
														{
															audio_play_sound(sd_text, 2, 0);
														}
														if vtrue[3] = 1
														{
															global.answer = 1;
														}
														else
														{
															global.answer = 0;
														}
														math_1();
													}
												}
												else
												{
													b_pressed_s[3] = 1;
												}
											#endregion
											#region Вариант 4
												if point_in_rectangle(mouse_x1, mouse_y1, x4 - button_width / 2, y4 - button_height / 2, x4 + button_width / 2, y4 + button_height / 2)
												{
													if device_mouse_check_button(dev, mb_left)
													{
														b_pressed_s[4] = 1.2;
													}
													else
													{
														b_pressed_s[4] = 1;
													}
													if device_mouse_check_button_released(dev, mb_left)
													{
														if global.sound { audio_play_sound(sd_text, 2, 0); }
														if vtrue[4] = 1
														{
															global.answer = 1;
														}
														else
														{
															global.answer = 0;
														}
														math_1();
													}
												}
												else
												{
													b_pressed_s[4] = 1;
												}
											#endregion
										}
										#region ОБУЧЕНИЕ: Варианты
											if !(global.training < 1 or global.training_question != 0)
											{
												#region Варианты при тренировке
													if global.training_stage[6] = 7
													{
														if vtrue[1] = 1
														{
															#region Вариант 1
																if point_in_rectangle(mouse_x1, mouse_y1, x1 - button_width / 2, y1 - button_height / 2, x1 + button_width / 2, y1 + button_height / 2)
																{
																	if device_mouse_check_button(dev, mb_left)
																	{
																		b_pressed_s[1] = 1.2;
																	}
																	else
																	{
																		b_pressed_s[1] = 1;
																	}
																	if device_mouse_check_button_released(dev, mb_left)
																	{
																		if global.sound { audio_play_sound(sd_text, 2, 0); }
																		if vtrue[1] = 1
																		{
																			global.answer = 1;
																		}
																		else
																		{
																			global.answer = 0;
																		}
																		math_1();
																	}
																}
																else
																{
																	b_pressed_s[1] = 1;
																}
															#endregion
														}
														if vtrue[2] = 1
														{
															#region Вариант 2
																if point_in_rectangle(mouse_x1, mouse_y1, x2 - button_width / 2, y2 - button_height / 2, x2 + button_width / 2, y2 + button_height / 2)
																{
																	if device_mouse_check_button(dev, mb_left)
																	{
																		b_pressed_s[2] = 1.2;
																	}
																	else
																	{
																		b_pressed_s[2] = 1;
																	}
																	if device_mouse_check_button_released(dev, mb_left)
																	{
																		if global.music
																		{
																			audio_play_sound(sd_text, 2, 0);
																		}
																		if vtrue[2] = 1
																		{
																			global.answer = 1;
																		}
																		else
																		{
																			global.answer = 0;
																		}
																		math_1();
																	}
																}
																else
																{
																	b_pressed_s[2] = 1;
																}
															#endregion
														}
														if vtrue[3] = 1
														{
															#region Вариант 3
																if point_in_rectangle(mouse_x1, mouse_y1, x3 - button_width / 2, y3 - button_height / 2, x3 + button_width / 2, y3 + button_height / 2)
																{
																	if device_mouse_check_button(dev, mb_left)
																	{
																		b_pressed_s[3] = 1.2;
																	}
																	else
																	{
																		b_pressed_s[3] = 1;
																	}
																	if device_mouse_check_button_released(dev, mb_left)
																	{
																		if global.sound
																		{
																			audio_play_sound(sd_text, 2, 0);
																		}
																		if vtrue[3] = 1
																		{
																			global.answer = 1;
																		}
																		else
																		{
																			global.answer = 0;
																		}
																		math_1();
																	}
																}
																else
																{
																	b_pressed_s[3] = 1;
																}
															#endregion
														}
														if vtrue[4] = 1
														{
															#region Вариант 4
																if point_in_rectangle(mouse_x1, mouse_y1, x4 - button_width / 2, y4 - button_height / 2, x4 + button_width / 2, y4 + button_height / 2)
																{
																	if device_mouse_check_button(dev, mb_left)
																	{
																		b_pressed_s[4] = 1.2;
																	}
																	else
																	{
																		b_pressed_s[4] = 1;
																	}
																	if device_mouse_check_button_released(dev, mb_left)
																	{
																		if global.sound
																		{
																			audio_play_sound(sd_text, 2, 0);
																		}
																		if vtrue[4] = 1
																		{
																			global.answer = 1;
																		}
																		else
																		{
																			global.answer = 0;
																		}
																		math_1();
																	}
																}
																else
																{
																	b_pressed_s[4] = 1;
																}
															#endregion
														}
													}
												#endregion
											}
										#endregion
									}
								}
							#endregion
							#region Рисование кнопок и вопроса
								#region ОБУЧЕНИЕ: Нажатие
									if global.training = 6
									{
										if global.training_stage[6] = 6 or (global.training_stage[6] = 7 && global.training_question = 0)
										{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
										}
										if mouse_check_button_pressed(mb_left) && global.training_x >= global.width && global.text_sc = 1
										{
											if global.training_stage[6] = 6
											{
												global.training_stage[6] = 7;
											}
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
								#region Отрисовка знаков и задачи
									if (global.training < 1 or global.training_stage[6] >= 6)
									{
										var math_ind;
										math_ind = 1.3;
										draw_set_font(global.math_font);
										draw_set_color(c_black);
										draw_set_alpha(0.4);
										draw_text_transformed(640 - 3 + 30, global.height / 2 - 200 * list_size - 50 + list_y + 4 + button_x / 4 - 125 * (1 - list_scale), equation_text /*"14?7=2*/, list_size * 1.04, list_size * 1.04 * list_scale, 0);
										draw_set_color(c_white);
										draw_set_alpha(1);
										draw_text_transformed_t(640 + 30, global.height / 2 - 200 * list_size - 50 + list_y + button_x / 4 - 125 * (1 - list_scale), equation_text /*"14?7=2*/, list_size * 1.04, list_size * 1.04 * list_scale, 0, c_white, c_black);
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
								#endregion
								#region ОБУЧЕНИЕ: Прохождение
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
								x1 = 640 - button_width / 2 * 3 - 45 + pvp_x;
								y1 = global.height / 2 + 50;
								x2 = 640 - button_width / 2 - 15 + pvp_x;
								y2 = y1;
								x3 = 640 + button_width / 2 + 15 + pvp_x;
								y3 = global.height / 2 + 50;
								x4 = 640 + button_width / 2 * 3 + 45 + pvp_x;
								y4 = y3;
							#endregion
							#region Варианты
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if global.training < 1 or global.training_question != 0
										{
											#region Вариант 1
												if point_in_rectangle(mouse_x1, mouse_y1, x1 - button_width / 2, y1 - button_height / 2, x1 + button_width / 2, y1 + button_height / 2)
												{
													if device_mouse_check_button(dev, mb_left)
													{
														b_pressed_s[1] = 1.2;
													}
													else
													{
														b_pressed_s[1] = 1;
													}
													if device_mouse_check_button_released(dev, mb_left)
														{
														if global.sound
														{
															audio_play_sound(sd_text, 2, 0);
														}
														if vtrue[1] = 1
														{
															global.answer = 1;
														}
														else
														{
															global.answer = 0;
														}
														math_2();
														}
												}
												else
												{
													b_pressed_s[1] = 1;
												}
											#endregion
											#region Вариант 2
												if point_in_rectangle(mouse_x1, mouse_y1, x2 - button_width / 2, y2 - button_height / 2, x2 + button_width / 2, y2 + button_height / 2)
												{
													if device_mouse_check_button(dev, mb_left)
													{
														b_pressed_s[2] = 1.2;
													}
													else
													{
														b_pressed_s[2] = 1;
													}
													if device_mouse_check_button_released(dev, mb_left)
													{
														if global.sound
														{
															audio_play_sound(sd_text, 2, 0);
														}
														if vtrue[2] = 1
														{
															global.answer = 1;
														}
														else
														{
															global.answer = 0;
														}
														math_2();
													}
												}
												else
												{
													b_pressed_s[2] = 1;
												}
											#endregion
											#region Вариант 3
												if point_in_rectangle(mouse_x1, mouse_y1, x3 - button_width / 2, y3 - button_height / 2, x3 + button_width / 2, y3 + button_height / 2)
												{
													if device_mouse_check_button(dev, mb_left)
													{
														b_pressed_s[3] = 1.2;
													}
													else
													{
														b_pressed_s[3] = 1;
													}
													if device_mouse_check_button_released(dev, mb_left)
													{
														if global.sound
														{
															audio_play_sound(sd_text, 2, 0);
														}
														if vtrue[3] = 1
														{
															global.answer = 1;
														}
														else
														{
															global.answer = 0;
														}
														math_2();
													}
												}
												else
												{
													b_pressed_s[3] = 1;
												}
											#endregion
											#region Вариант 4
												if point_in_rectangle(mouse_x1, mouse_y1, x4 - button_width / 2, y4 - button_height / 2, x4 + button_width / 2, y4 + button_height / 2)
												{
													if device_mouse_check_button(dev, mb_left)
													{
														b_pressed_s[4] = 1.2;
													}
													else
													{
														b_pressed_s[4] = 1;
													}
													if device_mouse_check_button_released(dev, mb_left)
													{
														if global.sound
														{
															audio_play_sound(sd_text, 2, 0);
														}
														if vtrue[4] = 1
														{
															global.answer = 1;
														}
														else
														{
															global.answer = 0;
														}
														math_2();
													}
												}
												else
												{
													b_pressed_s[4] = 1;
												}
											#endregion
										}
										#region ОБУЧЕНИЕ: Варианты
												if !(global.training < 1 or global.training_question != 0)
												{
													if global.training_stage[6] = 11
													{
														if vtrue[1] = 1
														{
															#region Вариант 1
																if point_in_rectangle(mouse_x1, mouse_y1, x1 - button_width / 2, y1 - button_height / 2, x1 + button_width / 2, y1 + button_height / 2)
																{
																	if device_mouse_check_button(dev, mb_left)
																	{
																		b_pressed_s[1] = 1.2;
																	}
																	else
																	{
																		b_pressed_s[1] = 1;
																	}
																	if device_mouse_check_button_released(dev, mb_left)
																	{
																		if global.sound
																		{
																			audio_play_sound(sd_text, 2, 0);
																		}
																		if vtrue[1] = 1
																		{
																			global.answer = 1;
																		}
																		else
																		{
																			global.answer = 0;
																		}
																		math_2();
																	}
																}
																else
																{
																	b_pressed_s[1] = 1;
																}
															#endregion
														}
														if vtrue[2] = 1
														{
															#region Вариант 2
																if point_in_rectangle(mouse_x1, mouse_y1, x2 - button_width / 2, y2 - button_height / 2, x2 + button_width / 2, y2 + button_height / 2)
																	{
																		if device_mouse_check_button(dev, mb_left)
																		{
																			b_pressed_s[2] = 1.2;
																		}
																		else
																		{
																			b_pressed_s[2] = 1;
																		}
																		if device_mouse_check_button_released(dev, mb_left)
																		{
																			if global.sound
																			{
																				audio_play_sound(sd_text, 2, 0);
																			}
																			if vtrue[2] = 1
																			{
																				global.answer = 1;
																			}
																			else
																			{
																				global.answer = 0;
																			}
																			math_2();
																		}
																	}
																	else
																	{
																		b_pressed_s[2] = 1;
																	}
															#endregion
														}
														if vtrue[3] = 1
														{
															#region Вариант 3
																if point_in_rectangle(mouse_x1, mouse_y1, x3 - button_width / 2, y3 - button_height / 2, x3 + button_width / 2, y3 + button_height / 2)
																{
																	if device_mouse_check_button(dev, mb_left)
																	{
																		b_pressed_s[3] = 1.2;
																	}
																	else
																	{
																		b_pressed_s[3] = 1;
																	}
																	if device_mouse_check_button_released(dev, mb_left)
																	{
																		if global.sound
																		{
																			audio_play_sound(sd_text, 2, 0);
																		}
																		if vtrue[3] = 1
																		{
																			global.answer = 1;
																		}
																		else
																		{
																			global.answer = 0;
																		}
																		math_2();
																	}
																}
																else
																{
																	b_pressed_s[3] = 1;
																}
															#endregion
														}
														if vtrue[4] = 1
														{
															#region Вариант 4
																if point_in_rectangle(mouse_x1, mouse_y1, x4 - button_width / 2, y4 - button_height / 2, x4 + button_width / 2, y4 + button_height / 2)
																{
																	if device_mouse_check_button(dev, mb_left)
																	{
																		b_pressed_s[4] = 1.2;
																	}
																	else
																	{
																		b_pressed_s[4] = 1;
																	}
																	if device_mouse_check_button_released(dev, mb_left)
																	{
																		if global.sound
																		{
																			audio_play_sound(sd_text, 2, 0);
																		}
																		if vtrue[4] = 1
																		{
																			global.answer = 1;
																		}
																		else
																		{
																			global.answer = 0;
																		}
																		math_2();
																	}
																}
																else
																{
																	b_pressed_s[4] = 1;
																}
															#endregion
														}
													}
												}
											#endregion
									}
								}
							#endregion
							#region Рисование кнопок и вопроса
								#region ОБУЧЕНИЕ: Нажатие
									if global.training = 6
									{
										if global.training_stage[6] = 10 or (global.training_stage[6] = 11 && global.training_question = 0)
										{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
										}
										if mouse_check_button_pressed(mb_left) && global.training_x >= global.width && global.text_sc = 1
										{
											if global.training_stage[6] = 10
											{
												global.training_stage[6] = 11;
											}
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
								#region Отрисовка знаков и задачи
									if (global.training < 1 or global.training_stage[6] >= 10)
									{
										var math_ind, txt_scale;
										math_ind = 1.4;
										txt_scale = 0.35;
										draw_set_font(global.math_font);
										draw_set_color(c_black);
										draw_set_alpha(0.4);
										draw_text_transformed(640 - 3 + 30, global.height / 2 - 200 * list_size - 50 + list_y + 4 + button_x / 4 - 125 * (1 - list_scale), equation_text, list_size * 1.04, list_size * 1.04 * list_scale, 0);
										draw_set_color(c_white);
										draw_set_alpha(1);
										draw_text_transformed_t(640 + 30, global.height / 2 - 200 * list_size - 50 + list_y + button_x / 4 - 125 * (1 - list_scale), equation_text, list_size * 1.04, list_size * 1.04 * list_scale, 0, c_white, c_black);
										draw_sprite_ext_t(s_question_sign, 0, x1, y1, list_size1 * b_pressed_s[1]* math_ind, list_size1 * list_scale * b_pressed_s[1]* math_ind, 0, c_white, 1, c_white, c_black);
										draw_sprite_ext_t(s_question_sign, 0, x2, y1 + 6, list_size1 * b_pressed_s[2]* math_ind, list_size1 * list_scale * b_pressed_s[2]* math_ind, 0, c_white, 1, c_white, c_black);
										draw_sprite_ext_t(s_question_sign, 0, x3, y1 + 6, -list_size1 * b_pressed_s[3]* math_ind, list_size1 * list_scale * b_pressed_s[3]* math_ind, 0, c_white, 1, c_white, c_black);
										draw_sprite_ext_t(s_question_sign, 0, x4, y1, -list_size1 * b_pressed_s[4]* math_ind, list_size1 * list_scale * b_pressed_s[4]* math_ind, 0, c_white, 1, c_white, c_black);
										draw_text_transformed_t(x1 + 50, y1 + 65, vtext[1], txt_scale * list_scale, txt_scale * list_scale, 0, c_white, c_black);
										draw_text_transformed_t(x2 + 50, y1 + 65, vtext[2], txt_scale * list_scale, txt_scale * list_scale, 0, c_white, c_black);
										draw_text_transformed_t(x3 + 50, y1 + 65, vtext[3], txt_scale * list_scale, txt_scale * list_scale, 0, c_white, c_black);
										draw_text_transformed_t(x4 + 50, y1 + 65, vtext[4], txt_scale * list_scale, txt_scale * list_scale, 0, c_white, c_black);
									}
								#endregion
								#region ОБУЧЕНИЕ: Прохождение
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
									x1 = 640 - button_width / 2 * 3 - 100 + pvp_x;
									y1 = global.height / 2 + 50;
									x2 = 640 - button_width / 2 - 15 - 50 + pvp_x;
									y2 = y1;
									x3 = 640 + button_width / 2 + 15 + 50 + pvp_x;
									y3 = global.height / 2 + 50;
									x4 = 640 + button_width / 2 * 3 + 100 + pvp_x;
									y4 = y3;
							#endregion
							#region Варианты
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if global.training < 1 or global.training_question != 0
										{
											#region Вариант 2
												if point_in_rectangle(mouse_x1, mouse_y1, x2 - button_width / 2, y2 - button_height / 2, x2 + button_width / 2, y2 + button_height / 2)
												{
													if device_mouse_check_button(dev, mb_left)
													{
														b_pressed_s[2] = 1.2;
													}
													else
													{
														b_pressed_s[2] = 1;
													}
													if device_mouse_check_button_released(dev, mb_left)
													{
														if global.sound
														{
															audio_play_sound(sd_text, 2, 0);
														}
														if vtrue[2] = 1
															{
																global.answer = 1;
															}
															else
															{
																global.answer = 0;
															}
														math_3();
													}
												}
												else
												{
													b_pressed_s[2] = 1;
												}
											#endregion
											#region Вариант 3
												if point_in_rectangle(mouse_x1, mouse_y1, x3 - button_width / 2, y3 - button_height / 2, x3 + button_width / 2, y3 + button_height / 2)
												{
													if device_mouse_check_button(dev, mb_left)
													{
														b_pressed_s[3] = 1.2;
													}
													else
													{
														b_pressed_s[3] = 1;
													}
													if device_mouse_check_button_released(dev, mb_left)
													{
														if global.sound
														{
															audio_play_sound(sd_text, 2, 0);
														}
														if vtrue[3] = 1
															{
																global.answer = 1;
															}
															else
															{
																global.answer = 0;
															}
														math_3();
													}
												}
												else
												{
													b_pressed_s[3] = 1;
												}
											#endregion
										}
										#region ОБУЧЕНИЕ: Варианты
											if !(global.training < 1 or global.training_question != 0)
											{
												if global.training_stage[6] = 16
												{
													if vtrue[2] = 1
													{
														#region Вариант 2
															if point_in_rectangle(mouse_x1, mouse_y1, x2 - button_width / 2, y2 - button_height / 2, x2 + button_width / 2, y2 + button_height / 2)
															{
																if device_mouse_check_button(dev, mb_left)
																{
																	b_pressed_s[2] = 1.2;
																}
																else
																{
																	b_pressed_s[2] = 1;
																}
																if device_mouse_check_button_released(dev, mb_left)
																{
																	if global.sound
																	{
																		audio_play_sound(sd_text, 2, 0);
																	}
																	if vtrue[2] = 1
																	{
																		global.answer = 1;
																	}
																	else
																	{
																		global.answer = 0;
																	}
																	math_3();
																}
															}
															else
															{
																b_pressed_s[2] = 1;
															}
														#endregion
													}
													if vtrue[3] = 1
													{
														#region Вариант 3
															if point_in_rectangle(mouse_x1, mouse_y1, x3 - button_width / 2, y3 - button_height / 2, x3 + button_width / 2, y3 + button_height / 2)
															{
																if device_mouse_check_button(dev, mb_left)
																{
																	b_pressed_s[3] = 1.2;
																}
																else
																{
																	b_pressed_s[3] = 1;
																}
																if device_mouse_check_button_released(dev, mb_left)
																{
																	if global.sound
																	{
																		audio_play_sound(sd_text, 2, 0);
																	}
																	if vtrue[3] = 1
																	{
																		global.answer = 1;
																	}
																	else
																	{
																		global.answer = 0;
																	}
																	math_3();
																}
															}
															else
															{
																b_pressed_s[3] = 1;
															}
														#endregion
													}
												}
											}
										#endregion
									}
								}
							#endregion
							#region Рисование кнопок и вопроса
								#region ОБУЧЕНИЕ: Нажатие
								if global.training = 6
								{
									if global.training_stage[6] = 14 or global.training_stage[6] = 15
									or (global.training_stage[6] = 16 && global.training_question = 0)
									{
										draw_set_alpha(0.45);
										draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
										draw_set_alpha(1);
									}
									if mouse_check_button_pressed(mb_left) && global.training_x >= global.width && global.text_sc = 1
									{
										if global.training_stage[6] = 14 or global.training_stage[6] = 15
										{
											global.training_stage[6] += 1;
										}
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
								#region Отрисовка Больше/Меньше и задачи
									if (global.training < 1 or global.training_stage[6] >= 14)
									{
										var math_ind, txt_scale;
										math_ind = 1.4;
										txt_scale = 0.6;
										draw_set_font(global.math_font);
										draw_set_color(c_black);
										draw_set_alpha(0.4);
										draw_text_transformed(640 - 3 + 30, global.height / 2 - 200 * list_size - 50 + list_y + 4 + button_x / 4 - 125 * (1 - list_scale), equation_text, list_size * 1.04, list_size * 1.04 * list_scale, 0);
										draw_set_color(c_white);
										draw_set_alpha(1);
										draw_text_transformed_t(640 + 30, global.height / 2 - 200 * list_size - 50 + list_y + button_x / 4 - 125 * (1 - list_scale), equation_text, list_size * 1.04, list_size * 1.04 * list_scale, 0, c_white, c_black);
										draw_sprite_ext_t(s_question_sign, 0, x2, y1 + 6, list_size1 * b_pressed_s[2]* math_ind, list_size1 * list_scale * b_pressed_s[2]* math_ind, 0, c_white, 1, c_white, c_black);
										draw_sprite_ext_t(s_question_sign, 0, x3, y1 + 6, -list_size1 * b_pressed_s[3]* math_ind, list_size1 * list_scale * b_pressed_s[3]* math_ind, 0, c_white, 1, c_white, c_black);
										draw_text_transformed_t(x2 + 70, y1 + 100, vtext[2], txt_scale * list_scale, txt_scale * list_scale, 0, c_white, c_black);
										draw_text_transformed_t(x3 + 70, y1 + 100, vtext[3], txt_scale * list_scale, txt_scale * list_scale, 0, c_white, c_black);
									}
								#endregion
								#region ОБУЧЕНИЕ: Прохождение
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
									x1 = 640 - button_width / 2 * 3 - 45 + pvp_x;
									y1 = global.height / 2 + 50;
									x2 = 640 - button_width / 2 - 15 + pvp_x;
									y2 = y1;
									x3 = 640 + button_width / 2 + 15 + pvp_x;
									y3 = global.height / 2 + 50;
									x4 = 640 + button_width / 2 * 3 + 45 + pvp_x;
									y4 = y3;
							#endregion
							#region Варианты
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if global.training < 1 or global.training_question != 0
										{
											#region Вариант 2
												if point_in_rectangle(mouse_x1, mouse_y1, x2 - button_width / 2, y2 - button_height / 2, x2 + button_width / 2, y2 + button_height / 2)
												{
													if device_mouse_check_button(dev, mb_left)
													{
														b_pressed_s[2] = 1.2;
													}
													else
													{
														b_pressed_s[2] = 1;
													}
													if device_mouse_check_button_released(dev, mb_left)
													{
														if global.sound
														{
															audio_play_sound(sd_text, 2, 0);
														}
														if vtrue[2] = 1
															{
																global.answer = 1;
															}
															else
															{
																global.answer = 0;
															}
														math_3();
													}
												}
												else
												{
													b_pressed_s[2] = 1;
												}
											#endregion
											#region Вариант 3
												if point_in_rectangle(mouse_x1, mouse_y1, x3 - button_width / 2, y3 - button_height / 2, x3 + button_width / 2, y3 + button_height / 2)
												{
													if device_mouse_check_button(dev, mb_left)
													{
														b_pressed_s[3] = 1.2;
													}
													else
													{
														b_pressed_s[3] = 1;
													}
													if device_mouse_check_button_released(dev, mb_left)
													{
														if global.sound
														{
															audio_play_sound(sd_text, 2, 0);
														}
														if vtrue[3] = 1
															{
																global.answer = 1;
															}
															else
															{
																global.answer = 0;
															}
														math_3();
													}
												}
												else
												{
													b_pressed_s[3] = 1;
												}
											#endregion
										}
										#region ОБУЧЕНИЕ: Варианты
											if !(global.training < 1 or global.training_question != 0)
											{
												if global.training_stage[6] = 20
												{
													if vtrue[2] = 1
													{
														#region Вариант 2
															if point_in_rectangle(mouse_x1, mouse_y1, x2 - button_width / 2, y2 - button_height / 2, x2 + button_width / 2, y2 + button_height / 2)
															{
																if device_mouse_check_button(dev, mb_left)
																{
																	b_pressed_s[2] = 1.2;
																}
																else
																{
																	b_pressed_s[2] = 1;
																}
																if device_mouse_check_button_released(dev, mb_left)
																{
																	if global.sound
																	{
																		audio_play_sound(sd_text, 2, 0);
																	}
																	if vtrue[2] = 1
																	{
																		global.answer = 1;
																	}
																	else
																	{
																		global.answer = 0;
																	}
																	math_4();
																}
															}
															else
															{
																b_pressed_s[2] = 1;
															}
														#endregion
													}
													if vtrue[3] = 1
													{
														#region Вариант 3
															if point_in_rectangle(mouse_x1, mouse_y1, x3 - button_width / 2, y3 - button_height / 2, x3 + button_width / 2, y3 + button_height / 2)
															{
																if device_mouse_check_button(dev, mb_left)
																{
																	b_pressed_s[3] = 1.2;
																}
																else
																{
																	b_pressed_s[3] = 1;
																}
																if device_mouse_check_button_released(dev, mb_left)
																{
																	if global.sound
																	{
																		audio_play_sound(sd_text, 2, 0);
																	}
																	if vtrue[3] = 1
																	{
																		global.answer = 1;
																	}
																	else
																	{
																		global.answer = 0;
																	}
																	math_4();
																}
															}
															else
															{
																b_pressed_s[3] = 1;
															}
														#endregion
													}
												}
											}
										#endregion
									}
								}
							#endregion
							#region Рисование кнопок и вопроса
								#region ОБУЧЕНИЕ: Нажатие
									if global.training = 6
									{
										if global.training_stage[6] = 18 or global.training_stage[6] = 19
										or (global.training_stage[6] = 20 && global.training_question = 0)
										{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
										}
										if mouse_check_button_pressed(mb_left) && global.training_x >= global.width && global.text_sc = 1
										{
											if global.training_stage[6] = 18 or global.training_stage[6] = 19
												{
													global.training_stage[6] += 1;
												}
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
								#region Отрисовка равно/неравно и задачи
									if (global.training < 1 or global.training_stage[6] >= 18)
									{
										var math_ind, txt_scale;
										math_ind = 1.4;
										txt_scale = 0.6;
										draw_set_font(global.math_font);
										draw_set_color(c_black);
										draw_set_alpha(0.4);
										draw_text_transformed(640 - 3 + 30, global.height / 2 - 200 * list_size - 50 + list_y + 4 + button_x / 4 - 125 * (1 - list_scale), equation_text, list_size * 1.04, list_size * 1.04 * list_scale, 0);
										draw_set_color(c_white);
										draw_set_alpha(1);
										draw_text_transformed_t(640 + 30, global.height / 2 - 200 * list_size - 50 + list_y + button_x / 4 - 125 * (1 - list_scale), equation_text, list_size * 1.04, list_size * 1.04 * list_scale, 0, c_white, c_black);
										draw_sprite_ext_t(s_question_sign, 0, x2, y1 + 6, list_size1 * b_pressed_s[2]* math_ind, list_size1 * list_scale * b_pressed_s[2]* math_ind, 0, c_white, 1, c_white, c_black);
										draw_sprite_ext_t(s_question_sign, 0, x3, y1 + 6, -list_size1 * b_pressed_s[3]* math_ind, list_size1 * list_scale * b_pressed_s[3]* math_ind, 0, c_white, 1, c_white, c_black);
										draw_text_transformed_t(x2 + 70, y1 + 110, vtext[2], txt_scale * list_scale, txt_scale * list_scale, 0, c_white, c_black);
										draw_text_transformed_t(x3 + 70, y1 + 110, vtext[3], txt_scale * list_scale, txt_scale * list_scale, 0, c_white, c_black);
									}
								#endregion
								#region ОБУЧЕНИЕ: Прохождение
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
								#endregion
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
							#region ТРЕНИРОВКА: координаты руки
								if global.training = 2
								{
									var hand_xxx, hand_yyy;
									hand_xxx = -200;
									hand_yyy = -200;
									global.training_hand_x = hand_xxx;
									global.training_hand_y = hand_yyy;
								}
							#endregion
							#region ТАЙМЕР: Координаты
								timer_y = 140;
							#endregion
							#region Координаты и появление
								if list_scale = 1
								{
									if bottle_red = 0
									{
										for(i = 1; i <= bottle_all; i ++)
										{
											if bottle_n[i] = bottle_stage
											{
												if global.training < 1 or global.training_stage[global.training] >= 7
												{
													if bottle_y[i] < 0
													{
														global.training_hand_s = 0;
														bottle_y[i] += 100;
														pre_wait = 1;
													}
													else
													{
														bottle_y[i] = 0;
														if bottle_stage < bottle_all
														{
															bottle_stage += 1;
															pre_wait = 1;
														}
														else
														{
															bottle_stage = 0;
															pre_wait = 0;
														}
													}
												}
											}
											bottle_x[i] = 640 - 60 * (bottle_all - 1) + 120 * (i - 1);
										}
									}
									else
									{
										if bottle_stage != 0
										{
											for(i = bottle_all; i >=1; i --)
											{
												if bottle_n[i] = bottle_stage
												{
													if bottle_y[i] < 0
													{
														bottle_y[i] += 100;
													}
													else
													{
														bottle_y[i] = 0;
														if bottle_stage > 1
														{
															bottle_stage -= 1;
														}
														else
														{
															bottle_stage = 0;
															pre_wait     = 0;
														}
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
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										for(i = 1; i <= bottle_all; i ++)
										{
											if global.training = 2
											{
												if global.training_hand_s + 1 = bottle_n[i] && hand_xxx = -200 && bottle_destroy[i] = 0
												&& global.training_stage[2] = 8 && global.training_question = 0
												{
													hand_xxx = bottle_x[i];
													hand_yyy = global.height / 2;
													global.training_hand_x = hand_xxx;
													global.training_hand_y = hand_yyy;
												}
											}
											if abs(mouse_x1 - bottle_x[i]) < 50 && abs(mouse_y1 - global.height / 2 + bottle_y[i] - 50) < 100
											{
												color[dev] = c_red;
												if device_mouse_check_button_pressed(dev, mb_left)
												{
													color[dev] = c_green;
													if bottle_destroy[i] = 0
													{
														if global.sound { audio_play_sound(sd_text, 2, 0); }
														if global.training < 1 or global.training_question != 0
														{
															bottle_destroy[i] = 1;
															if bottle_s + 1 = bottle_n[i]
															{
																if bottle_s + 1 = bottle_all
																{
																	global.answer = 1;
																	bottles_1();
																}
																else
																{
																	bottle_s = bottle_n[i];
																}
															}
															else
															{
																global.answer = 0;
																bottles_1();
															}
														}
														else
														{
															if global.training_stage[2] = 8
															{
																global.training_hand_s += 1;
																if bottle_s + 1 = bottle_n[i]
																{
																	if bottle_s + 1 = bottle_all
																	{
																		global.answer = 1;
																		bottles_1();
																	}
																	else
																	{
																		bottle_s = bottle_n[i];
																	}
																	bottle_destroy[i] = 1;
																}
															}
														}
													}
												}
											}
											else
											{
												color[dev] = c_white;
											}
										}
									}
								}
							#endregion
							#region Рисование
								#region ОБУЧЕНИЕ: Нажатие и Прохождение
									if global.training = 2
									{
										if (global.training_stage[2] = 6 or global.training_stage[2] = 7
										or (global.training_stage[2] = 8 && global.training_question = 0))
										{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
										}
										if mouse_check_button_pressed(mb_left) && global.training_x >= global.width && global.text_sc = 1
										{
											if global.training_stage[2] = 6 or global.training_stage[2] = 7
											{
												global.training_stage[2] += 1;
											}
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
								#region Отрисовка и анимация уничтожения бутылок
									for(i = 1; i <= bottle_all; i ++)
									{
										var bottle_spr, bottle_ss, bottle_col;
										bottle_spr = asset_get_index("s_bottle" + string(bottle_i[i]));
										if bottle_red = 1
										{
											bottle_col = c_red;
										}
										else
										{
											bottle_col = c_white;
										}
										if bottle_i[i] = 1
										{
											bottle_ss = 1;
										}
										else
										{
											bottle_ss = 1.25;
										}
										if bottle_destroy[i] > 0
										{
											if bottle_destroy[i] < 6
											{
												bottle_destroy[i] += 1;
												draw_sprite_ext(bottle_spr, bottle_destroy[i] - 1, bottle_x[i], global.height / 2 + bottle_y[i] - 50, 0.6 * list_scale * bottle_ss, 0.6 * list_scale * bottle_ss, 0, bottle_col, 1 - 0.1 * bottle_destroy[i]);
											}
										}
										else
										{
											draw_sprite_ext(bottle_spr, 0, bottle_x[i], global.height / 2 + bottle_y[i] - 50, 0.6 * list_scale * bottle_ss, 0.6 * list_scale * bottle_ss, 0, bottle_col, 1 - 0.5 * bottle_destroy[i]);
										}
									}
								#endregion
							#endregion
						}
					#endregion
					#region Задача 2 - Бутылки, номера
						if round_task[global.rounds,global.task] = 2
						{
							#region ТРЕНИРОВКА: Координаты руки
								if global.training = 2
								{
									var hand_xxx, hand_yyy;
									hand_xxx = -200;
									hand_yyy = -200;
									global.training_hand_x = hand_xxx;
									global.training_hand_y = hand_yyy;
								}
							#endregion
							#region ТАЙМЕР: Координаты
								timer_y = 140;
							#endregion
							#region Координаты и появление
								if list_scale = 1
								{
									for(i = 1; i <= bottle_all; i ++)
									{
										if i = bottle_stage
										{
											if global.training < 1 or global.training_stage[global.training] > 10
											{
												if bottle_y[i] < 0
												{
													global.training_hand_s = 0;
													bottle_y[i] += 100;
													pre_wait = 1;
												}
												else
												{
													bottle_y[i] = 0;
													if bottle_stage < bottle_all
													{
														bottle_stage += 1;
														pre_wait = 1;
													}
													else
													{
														bottle_stage = 0;
														pre_wait = 0;
													}
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
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										for(i = 1; i <= bottle_all; i ++)
										{
											if global.training = 2
											{
												if global.training_hand_s + 1 = bottle_n[i] && hand_xxx = -200 && bottle_destroy[i] = 0
												&& global.training_stage[2] = 11 && global.training_question = 0
												{
													hand_xxx = bottle_x[i];
													hand_yyy = global.height / 2;
													global.training_hand_x = hand_xxx;
													global.training_hand_y = hand_yyy;
												}
											}
											if abs(mouse_x1 - bottle_x[i]) < 50 && abs(mouse_y1 - global.height / 2 + bottle_y[i] - 50) < 100
											{
												if device_mouse_check_button_pressed(dev, mb_left)
												{
													if global.training < 1 or (global.training_stage[2] = 11 && global.training_question != 0)
													{
														if bottle_destroy[i] = 0
														{
															if global.sound
															{
																audio_play_sound(sd_text, 2, 0);
															}
															bottle_destroy[i] = 1;
															if bottle_s + 1 = bottle_n[i]
															{
																if bottle_s + 1 = bottle_all
																{
																	global.answer = 1;
																	bottles_2();
																}
																else
																{
																	bottle_s = bottle_n[i];
																}
															}
															else
															{
																global.answer = 0;
																bottles_2();
															}
														}
													}
													else
													{
														if bottle_destroy[i] = 0
														{
															if global.sound
															{
																audio_play_sound(sd_text, 2, 0);
															}
															global.training_hand_s += 1;
															if bottle_s + 1 = bottle_n[i]
															{
																if bottle_s + 1 = bottle_all
																{
																	global.answer = 1;
																	bottles_2();
																}
																else
																{
																	bottle_s = bottle_n[i];
																}
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
								#region ОБУЧЕНИЕ: Нажатие и Прохождение
									if global.training = 2
									{
										if (global.training_stage[2] = 10
										or (global.training_stage[2] = 11 && global.training_question = 0))
										{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
										}
										if mouse_check_button_pressed(mb_left) && global.training_x >= global.width && global.text_sc = 1
										{
											if global.training_stage[2] = 10
											{
												global.training_stage[2] += 1;
											}
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
								#region Отрисовка бутылок
									for(i = 1; i <= bottle_all; i ++)
									{
										var bottle_spr, bottle_ss, bottle_col;
										bottle_spr = asset_get_index("s_bottle" + string(bottle_i[i]));
										if bottle_red = 0
										{
											bottle_col = c_white;
										}
										else
										{
											bottle_col = c_red;
										}
										if bottle_i[i] = 1
										{
											bottle_ss = 1;
										}
										else
										{
											bottle_ss = 1.25;
										}
										if bottle_destroy[i] > 0
										{
											if bottle_destroy[i] < 6
											{
												bottle_destroy[i] += 1;
												draw_sprite_ext(bottle_spr, bottle_destroy[i] - 1, bottle_x[i], global.height / 2 + bottle_y[i] - 50, 0.6 * list_scale * bottle_ss, 0.6 * list_scale * bottle_ss, 0, bottle_col, 1 - 0.1 * bottle_destroy[i]);
											}
										}
										else
										{
											draw_sprite_ext(bottle_spr, 0, bottle_x[i], global.height / 2 + bottle_y[i] - 50, 0.6 * list_scale * bottle_ss, 0.6 * list_scale * bottle_ss, 0, bottle_col, 1 - 0.5 * bottle_destroy[i]);
										}
										draw_set_font(global.game_font);
										if bottle_red = 0
										{
											draw_set_color(c_maroon);
											draw_set_alpha(bottle_a1);
											draw_text_transformed(bottle_x[i], global.height / 2 + bottle_y[i] + 10, string(bottle_n[i]), bottle_s1 * 0.4 * list_scale, bottle_s2 * 0.4 * ((6 - bottle_destroy[i]) / 6) * list_scale, 16);
											draw_set_alpha(1);
										}
										else
										{
											draw_set_color(c_white);
											draw_set_alpha(bottle_a1);
											draw_text_transformed(bottle_x[i], global.height / 2 + bottle_y[i] + 10, string(bottle_n1[i]), bottle_s1 * 0.4 * list_scale, bottle_s2 * 0.4 * ((6 - bottle_destroy[i]) / 6) * list_scale, 16);
											draw_set_alpha(1);
										}
										draw_set_color(c_white);
									}
								#endregion
							#endregion
						}
					#endregion
					#region Задача 3 - Бутылки, падение
						if round_task[global.rounds,global.task] = 3
						{
							#region ТРЕНИРОВКА: Координаты руки
								if global.training = 2
								{
									var hand_xxx, hand_yyy;
									hand_xxx = -200;
									hand_yyy = -200;
									global.training_hand_x = hand_xxx;
									global.training_hand_y = hand_yyy;
								}
							#endregion
							#region ТАЙМЕР: Координаты
								timer_y  = 50;
							#endregion
							#region Координаты
								if list_scale = 1
								{
									for(i = 1; i <= bottle_all; i ++)
									{
										if bottle_y[i] > 200
										{
											pre_wait = 0;
										}
										if global.training < 1 or global.training_question != 0
										{
											if ((bottle_y[i] < global.height + 100 && i = 1) or ((bottle_y[i - 1] > global.height / 2 - 100 or bottle_destroy[i - 1] != 0) && bottle_y[i] < global.height + 100)) && bottle_destroy[i] = 0 && !global.super_ability
											{
												bottle_y[i] += bottle_spd[i];
											}
										}
										else
										{
											if global.training_stage[2] = 16
											{
												if (bottle_y[i] < global.height / 2 && i = global.training_hand_s + 1) && bottle_destroy[i] = 0// or (bottle_destroy[i-1] != 0 && i > 1) && bottle_destroy[i] = 0
												{
													bottle_y[i] += bottle_spd[i];
												}
												if bottle_y[i] >= global.height / 2
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
											if !(bottle_y[i] < global.height + 100)
											{
												if global.training < 1 or global.training_question != 0
												{
													if bottle_r[i] = 1
													{
														bottle_stage += 1;
														bottle_destroy[i] = 1;
													}
													else
													{
														bottles_3();
														global.answer = 0;
														bottle_destroy[i] = 1;
													}
													if i = bottle_all
													{
														if bottle_stage > bottle_all
														{
															bottles_3();
															global.answer = 1;
															bottle_destroy[i] = 1;
														}
														else
														{
															bottles_3();
															global.answer = 0;
															bottle_destroy[i] = 1;
														}
													}
												}
											}
										}
									}
								}
							if bottle_stage > bottle_all && global.answer = -1
							{
								bottles_3();
								global.answer = 1;
							}
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										for(i = 1; i <= bottle_all; i ++)
										{
											if point_in_rectangle(mouse_x1, mouse_y1, bottle_x[i] - 50, bottle_y[i] - 90, bottle_x[i] + 50, bottle_y[i] + 90)//abs(mouse_x1 - bottle_x[i]) < 50 && abs(mouse_y1 + bottle_y[i]) < 100
											{
												if device_mouse_check_button_pressed(dev, mb_left) && bottle_destroy[i] = 0
												{
													if global.sound
													{
														audio_play_sound(sd_text, 2, 0);
													}
													if global.training < 1  or global.training_question != 0
													{
														if bottle_r[i] != 1
														{
															bottle_stage += 1;
															bottle_destroy[i] = 1;
														}
														else
														{
															bottles_3();
															global.answer = 0;
														}
													}
													else
													{
														if bottle_r[i] != 1
														{
															bottle_stage += 1;
															bottle_destroy[i] = 1;
															global.training_hand_s += 1;
														}
													}
												}
											}
										}
									}
								}
							#endregion
							#region Рисование
								#region ОБУЧЕНИЕ: Нажатие и Прохождение
									if global.training = 2
									{
										if (global.training_stage[2] = 14 or global.training_stage[2] = 15
										or (global.training_stage[2] = 16 && global.training_question = 0))
										{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
										}
										if mouse_check_button_pressed(mb_left) && global.training_x >= global.width && global.text_sc = 1
										{
											if global.training_stage[2] = 14 or global.training_stage[2] = 15
											{
												global.training_stage[2] += 1;
											}
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
								#region Отрисовка бутылок
									for(i = 1; i <= bottle_all; i ++)
									{
										#region ОБУЧЕНИЕ: Изменение координат
											if global.training = 2 && global.training_stage[2] = 16 && global.training_question = 0
											{
												bottle_x[i] = 640;
											}
										#endregion
										#region Отрисовка и уничтожение бутылок
											var bottle_spr, bottle_ss, bottle_col;
											bottle_spr = asset_get_index("s_bottle" + string(bottle_i[i]));
											if bottle_r[i] = 1
											{
												bottle_col = c_red;
											}
											else
											{
												bottle_col = c_white;
											}
											if bottle_destroy[i] > 0
											{
												if bottle_destroy[i] < 6
												{
													bottle_destroy[i] += 1;
													draw_sprite_ext(bottle_spr, bottle_destroy[i] - 1, bottle_x[i], bottle_y[i], 0.7 * list_scale, 0.7 * list_scale , 0, bottle_col, 1 - 0.1 * bottle_destroy[i]);
												}
											}
											else
											{
												draw_sprite_ext(bottle_spr, 0, bottle_x[i], bottle_y[i], 0.7 * list_scale, 0.7 * list_scale, 0, bottle_col, 1 - 0.5 * bottle_destroy[i]);
											}
										#endregion
									}
								#endregion
							#endregion
						}
					#endregion
					#region Задача 4 - Бутылки, наполнение
						if round_task[global.rounds,global.task] = 4
						{
							#region ТРЕНИРОВКА: Координаты руки
								if global.training = 2
								{
									var hand_xxx, hand_yyy;
									hand_xxx = -200;
									hand_yyy = -200;
									global.training_hand_x = hand_xxx;
									global.training_hand_y = hand_yyy;
								}
							#endregion
							#region ТАЙМЕР: Координаты
								timer_y = 100;
							#endregion
							#region Координаты
								if list_scale = 1
								{
									for(i = 1; i <= bottle_all; i ++)
									{
										if global.training < 1 or global.training_question != 0
										{
											if i = bottle_stage
											{
												if bottle_y[i] < 0
												{
													bottle_y[i] += 100;
													pre_wait = 1;
												}
												else
												{
													bottle_y[i] = 0;
													if bottle_stage < bottle_all
													{
														bottle_stage += 1;
														pre_wait = 1;
													}
													else
													{
														bottle_stage = 0;
														pre_wait = 0;
													}
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
														{
															bottle_stage += 1;
														}
														else
														{
															bottle_stage = 0;
															pre_wait = 0;
														}
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
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if (point_in_rectangle(mouse_x1, mouse_y1, 0, 0, global.width, global.height - 150) && super_now = super_need) or super_now != super_need
											{
											if device_mouse_check_button_pressed(dev, mb_left)
												{
												if global.sound { audio_play_sound(sd_text, 2, 0); }
												for(i = 1; i <= bottle_all; i ++)
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
																for(i = 1; i <= bottle_all; i ++)
																{
																	if abs(bottle_p[1] - bottle_p[i]) > 0.2 or abs(bottle_p[1] - bottle_p[i]) > bottle_p[1] * 0.5
																	{
																		pp = 1;
																	}
																}
																if pp = 1
																{
																	bottle_end = 1;
																}
																else
																{
																	global.answer = 1;
																	bottles_4();
																}
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
																	for(i = 1; i <= bottle_all; i ++)
																	{
																		if abs(bottle_p[1] - bottle_p[i]) > 0.2 or abs(bottle_p[1] - bottle_p[i]) > bottle_p[1] * 0.5
																		{
																			pp = 1;
																		}
																	}
																	if pp = 1
																	{
																		bottle_end = 1;
																	}
																	else
																	{
																		global.answer = 1;
																		bottles_4();
																	}
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
								#region ОБУЧЕНИЕ: Нажатие и Прохождение
									if global.training = 2
									{
										if (global.training_stage[2] = 18 or global.training_stage[2] = 19
										or (global.training_stage[2] = 20 && global.training_question = 0))
										{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
										}
										if mouse_check_button_pressed(mb_left) && global.training_x >= global.width && global.text_sc = 1
										{
											if global.training_stage[2] = 18 or global.training_stage[2] = 19
											{
												global.training_stage[2] += 1;
											}
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
								#region Отрисовка бутылок и наполнения
									for(i = 1; i <= bottle_all; i ++)
										{
										#region Размеры и спрайт бутылки
											var bottle_spr, bottle_h, bottle_w;
											bottle_spr = asset_get_index("s_bottle" + string(bottle_i[i]));
											bottle_h   = sprite_get_height(bottle_spr);
											bottle_w   = sprite_get_width(bottle_spr);
										#endregion
										#region Уничтожение бутылки 1
											if bottle_end = 1
											{
												bottle_destroy[i] = 1;
												if i = bottle_all
												{
													bottle_end = 2;
												}
											}
										#endregion
										#region Уничтожение бутылки 2
											if bottle_destroy[i] > 0
												{
													if bottle_destroy[i] < 6
													{
														bottle_destroy[i] += 1;
														draw_sprite_ext(bottle_spr, bottle_destroy[i] - 1, bottle_x[i], global.height / 2 + bottle_y[i] - 50, 0.6 * list_scale, 0.6 * list_scale, 0, c_white, 1 - 0.1 * bottle_destroy[i]); 
														//draw_sprite_part_ext(bottle_spr, bottle_destroy[i] - 1, 0, bottle_h - bottle_h * bottle_p[i], bottle_w, bottle_h, bottle_x[i] - bottle_w / 2 * 0.6 + 2, global.height / 2 + bottle_y[i] - 50 + bottle_h / 2 * 0.6 - bottle_w * 0.6 * bottle_p[i], 0.6 * list_scale, 0.6 * list_scale, c_red, 1 - 0.1 * bottle_destroy[i]);
													}
													if bottle_end = 2 && bottle_destroy[bottle_all] = 6
													{
														global.answer = 0;
														bottles_4();
													}
												}
										#endregion
										#region Анимация наполнения и отрисовка
											if bottle_destroy[i] <= 0
											{
												#region Анимация падения бутылок
													if global.training < 1 or global.training_question != 0
													{
														if bottle_s = i && bottle_stage = 0 && bottle_end = 0 && global.super_ability = 0
														{
															if ((bottle_p[i] < 1 && bottle_d[i] = 1) or (bottle_p[i] > 0 && bottle_d[i] = -1))
															{
																bottle_p[i] += bottle_spd[i] * bottle_d[i];
															}
															else
															{
																bottle_end = 1;
																bottle_destroy[i] = 1;
															}
														}
													}
												#endregion
												#region ОБУЧЕНИЕ: Движение бутылок и координаты
													if !(global.training < 1 or global.training_question != 0)
													{
														if bottle_p[i] <= 0.5
														{
															if bottle_s = i && bottle_stage = 0 && bottle_end = 0 && global.super_ability = 0
															{
																if ((bottle_p[i] < 1 && bottle_d[i] = 1) or (bottle_p[i] > 0 && bottle_d[i] = -1))
																{
																	bottle_p[i] += bottle_spd[i] * bottle_d[i];
																}
															}
														}
														else
														{
															if global.training = 2 && bottle_s = i && bottle_destroy[i] = 0
															{
																var hand_xxx, hand_yyy;
																hand_xxx = 800;
																hand_yyy = global.height / 2;
																global.training_hand_x = hand_xxx;
																global.training_hand_y = hand_yyy;
															}
														}
													}
												#endregion
												#region Отрисовка бутылок
													draw_sprite_ext(bottle_spr, 0, bottle_x[i], global.height / 2 + bottle_y[i] - 50, 0.6 * list_scale, 0.6 * list_scale, 0, c_white, 1 - 0.5 * bottle_destroy[i]);
													draw_sprite_part_ext(bottle_spr, 0, 0, bottle_h - bottle_h * bottle_p[i], bottle_w, bottle_h, bottle_x[i] - bottle_w / 2 * 0.6 + 2, global.height / 2 + bottle_y[i] - 50 + bottle_h / 2 * 0.6 - bottle_w * 0.6 * bottle_p[i], 0.6 * list_scale, 0.6 * list_scale, c_red, 1 - 0.5 * bottle_destroy[i]);
												#endregion
											}
										#endregion
										}
								#endregion
							#endregion
						}
					#endregion 
				}
			#endregion
			#region Движение   - Move
				if theme_round[global.rounds] = 3
					{
					#region ТРЕНИРОВКА: координаты руки
						if global.training = 3
						{
							var hand_xxx, hand_yyy;
							hand_xxx = -200 + pvp_x;
							hand_yyy = -200;
							global.training_hand_x = hand_xxx;
							global.training_hand_y = hand_yyy;
						}
					#endregion
					#region ТАЙМЕР: Ожидание и координаты
						pre_wait = 0;
						timer_y = 140;
					#endregion
					#region Задача 1 - Рука, стрелки, клик
						if round_task[global.rounds,global.task] = 1
						{
							#region Координаты и появление
								var x1, y1, y2;
								dop_q_y = 0;
								x1 = 640 + pvp_x;
								y1 = global.height / 2;
								y2 = global.height / 2 - 160;
								if hand_scale < 1
								{
									hand_scale += 0.1;
								}
								if hand_angle < 359
								{
									hand_angle += hand_speed;
								}
								else
								{
									hand_angle = 0;
								}
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if (point_in_rectangle(mouse_x1, mouse_y1, 0, 0, global.width, global.height - 150) && super_now = super_need) or super_now != super_need
										{
											if device_mouse_check_button_pressed(dev, mb_left)
											{
												#region Музыка
													if global.sound
													{
														audio_play_sound(sd_text, 2, 0);
													}
												#endregion
												#region Проверка нажатия
													if global.training < 1 or global.training_question > 1
													{
														if hand_now = hand_count
														{
															if ((abs(hand_true[hand_now] - hand_angle) < 30 or abs(hand_true[hand_now] - hand_angle) > 329)) // && hand_red[hand_now] = 0
															{
																global.answer = 1;
															}
															else
															{
																global.answer = 0;
															}
															move_1();
															hand_scale = 0.5;
														}
														else
														{
															if abs(hand_true[hand_now] - hand_angle) < 30 or abs(hand_true[hand_now] - hand_angle) > 329
															{
																hand_now += 1;
																hand_scale = 0.5;
															}
															else
															{
																global.answer = 0;
																hand_scale = 0.5;
																move_1();
															}
														}
													}
												#endregion
												#region ОБУЧЕНИЕ: Нажатие
													if !(global.training < 1 or global.training_question > 1)
													{
														if global.training_stage[3] = 7 or global.training_stage[3] = 8
														{
															if abs(hand_true[hand_now] - hand_angle) < 30 or abs(hand_true[hand_now] - hand_angle) > 329
															{
																global.answer = 1;
																move_1();
																if global.training_stage[3] = 7
																{
																	hand_red[1] = 1;
																}
																if global.training_stage[3] = 8
																{
																	hand_red[1] = choose(0, 1);
																}
																if global.training_stage[3] = 7
																{
																	global.training_stage[3] += 1;
																}
																hand_scale = 0.5;
															}
															else
															{
																global.training_gb = "TRY AGAIN";
															}
														}
													}
												#endregion
											}
										}
									}
								}
							#endregion
							#region Рисование
								#region ОБУЧЕНИЕ: Нажатие
									if global.training = 3
									{
										if (global.training_stage[3] = 6
										or (global.training_stage[3] = 7 && global.training_question = 0)
										or (global.training_stage[3] = 8 && global.training_question = 1))
										{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
										}
										if mouse_check_button_pressed(mb_left) && global.training_x >= global.width && global.text_sc = 1
										{
											if global.training_stage[3] = 6
											{
												global.training_stage[3] += 1;
											}
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
								#region Отрисовка стрелки
									for(i = hand_count; i >= 1;i --)
									{
										hand_xx[i] = 640 - (hand_now - i) * 100 + pvp_x;
										hand_ss[i] = 0;
										if hand_now = i
										{
											hand_ss[i] = 0.9;
										}
										if hand_now = i - 1 or hand_now = i + 1
										{
											hand_ss[i] = 0.5;
										}
										if hand_red[i] = 0
										{
											draw_sprite_ext(s_arrow, 0, hand_xx[i], y2, hand_scale * list_scale * hand_ss[i], hand_scale * list_scale * hand_ss[i], hand_true[i] - 90, c_white, hand_ss[i] + 0.1);
										}
										else
										{
											draw_sprite_ext(s_arrow, 0, hand_xx[i], y2, hand_scale * list_scale * hand_ss[i], hand_scale * list_scale * hand_ss[i], hand_true[i] - 90 + 180, c_red, hand_ss[i] + 0.1);
										}
									}
								#endregion
								#region Отрисовка руки
									draw_sprite_ext(s_hand, 0, x1, y1, hand_scale * list_scale * 0.8, hand_scale * list_scale * 0.8, hand_angle - 90, c_white, 1);
								#endregion
							#endregion
						}
					#endregion
					#region Задача 2 - Рука, градусы, клик
						if round_task[global.rounds,global.task] = 2
							{
							#region Координаты и появление
								var x1, y1, x2, y2;
								dop_q_y = 0;
								x1 = 640 - 100 + pvp_x;
								y1 = global.height / 2;
								x2 = 640 + 100 + pvp_x;
								y2 = y1;
								hand_scale = 1;
								if hand_angle < 359
									{ hand_angle += hand_speed; }
									else
									{ hand_angle = 0; }
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if (point_in_rectangle(mouse_x1, mouse_y1, 0, 0, global.width, global.height - 150) && super_now = super_need) or super_now != super_need
										{
											if device_mouse_check_button_pressed(dev, mb_left)
											{
												#region Звук
													if global.sound
													{
														audio_play_sound(sd_text, 2, 0);
													}
												#endregion
												#region Ответ
													if global.training < 1 or global.training_question != 0
													{
														if abs(hand_true[1] - hand_angle) < 30 or abs(hand_true[1] - hand_angle) > 329
														{
															global.answer = 1;
														}
														else
														{
															global.answer = 0;
														}
														move_2();
													}
												#endregion
												#region ОБУЧЕНИЕ: Ответ
													if !(global.training < 1 or global.training_question != 0)
													{
														if abs(hand_true[1] - hand_angle) < 30 or abs(hand_true[1] - hand_angle) > 329
														{
															global.answer = 1;
															move_2();
														}
														else
														{
															global.training_gb = "TRY AGAIN";
														}
													}
												#endregion
											}
										}
									}
								}
							#endregion
							#region Рисование
								#region ОБУЧЕНИЕ: Отрисовка
									if global.training = 3
									{
										if (global.training_stage[3] = 10 or global.training_stage[3] = 11
										or (global.training_stage[3] = 12))
										{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
											draw_sprite_ext(s_directions, 0, 200, global.height / 2, 0.5, 0.5, 0, global.color_white, 1);
											draw_text_transformed_t(200 + 130, global.height / 2, "360°\n0°", list_scale * 0.25, list_scale * 0.25, 0, global.color_white, c_black);
											draw_text_transformed_t(200, global.height / 2 - 130, "90°", list_scale * 0.25, list_scale * 0.25, 0, global.color_white, c_black);
											draw_text_transformed_t(200 - 130, global.height / 2, "180°", list_scale * 0.25, list_scale * 0.25, 0, global.color_white, c_black);
											draw_text_transformed_t(200, global.height / 2 + 130, "270°", list_scale * 0.25, list_scale * 0.25, 0, global.color_white, c_black);
										}
										if mouse_check_button_pressed(mb_left) && global.training_x >= global.width && global.text_sc = 1
										{
											if global.training_stage[3] = 10 or global.training_stage[3] = 11
											{
												global.training_stage[3] = 12;
											}
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
								#region Отрисовка руки и градуса
									draw_set_font(global.game_font);
									var hand_true2;
									hand_true2 = hand_true[1] + 180;
									if hand_true2 > 360
									{
										hand_true2 -= 360;
									}
									if hand_red[1] = 0
									{
										draw_text_transformed_t(x1, y1, string(hand_true[1]) + "°", list_scale * 0.5, list_scale * 0.5, 15, c_white, c_black);
									}
									else
									{
										draw_text_transformed_t(x1, y1, string(hand_true2) + "°", list_scale * 0.5, list_scale * 0.5, 15, c_red, c_black);
									}
									draw_sprite_ext(s_hand, 0, x2, y2, hand_scale * list_scale * 0.8, hand_scale * list_scale * 0.8, hand_angle - 90, c_white, 1);
								#endregion
							#endregion
							}
					#endregion
					#region Задача 3 - Рука, свайп
						if round_task[global.rounds,global.task] = 3
							{
							#region Координаты и появление
								var x1, y1;
								dop_q_y = -70;
								x1 = 640 + pvp_x;
								y1 = global.height / 2;
								if hand_scale < 1
								{
									hand_scale += 0.1;
								}
								if hand_angle < hand_true
								{
									hand_angle += hand_speed;
								}
								else
								{
									hand_angle = hand_true[hand_now];
								}
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										#region Рука до нуля
											if hand_s_t > 0
											{
												hand_s_t -= 1;
											}
											else
											{
												hand_s_t = 0;
											}
										#endregion
										#region Координаты рук
											if (point_in_rectangle(mouse_x1, mouse_y1, 0, 0, global.width, global.height - 150) && super_now = super_need) or super_now != super_need
											{
												if device_mouse_check_button_pressed(dev, mb_left)
												{
													hand_s_x = mouse_x1;
													hand_s_y = mouse_y1;
													hand_s_t = 50;
												}
											}
										#endregion
										#region Нажатие
											if device_mouse_check_button_released(dev, mb_left)
											{
												if point_distance(hand_s_x, hand_s_y, mouse_x1, mouse_y1) < 190
												{
													hand_s_t = 0;
												}
												else
												{
													if hand_s_t > 0
													{
														#region Ответ
															if global.training < 1
															{
																if hand_now = hand_count
																{
																	if global.sound
																	{
																		audio_play_sound(sd_text, 2, 0);
																	}
																	if abs(hand_true[hand_now] - point_direction(hand_s_x, hand_s_y, mouse_x1, mouse_y1)) < 30 or abs(hand_true[hand_now] - point_direction(hand_s_x, hand_s_y, mouse_x1, mouse_y1)) > 329
																	{
																		global.answer = 1;
																	}
																	else
																	{
																		global.answer = 0;
																	}
																	move_3();
																	hand_scale = 0.5;
																}
																else
																{
																	if abs(hand_true[hand_now] - point_direction(hand_s_x, hand_s_y, mouse_x1, mouse_y1)) < 30 or abs(hand_true[hand_now] - point_direction(hand_s_x, hand_s_y, mouse_x1, mouse_y1)) > 329
																	{
																		hand_now += 1;
																		hand_scale = 0.5;
																	}
																	else
																	{
																		move_3();
																		global.answer = 0;
																		hand_scale = 0.5;
																	}
																}
															}
														#endregion
														#region ОБУЧЕНИЕ: Ответ
															if !(global.training < 1)
															{
																if global.sound
																{
																	audio_play_sound(sd_text, 2, 0);
																}
																if abs(hand_true[hand_now] - point_direction(hand_s_x, hand_s_y, mouse_x1, mouse_y1)) < 30 or abs(hand_true[hand_now] - point_direction(hand_s_x, hand_s_y, mouse_x1, mouse_y1)) > 329
																{
																	global.answer = 1;
																	move_3();
																	hand_scale = 0.5;
																}
																else
																{
																	global.training_gb = "TRY AGAIN";
																}
															}
														#endregion
													}
												}
											}
										#endregion
									}
								}
							#endregion
							#region Рисование						
								#region ОБУЧЕНИЕ: Нажатие
									if global.training = 3
									{
										if (global.training_stage[3] = 14 or global.training_stage[3] = 15
										or (global.training_stage[3] = 16 && global.training_question = 0))
										{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
										}
										if mouse_check_button_pressed(mb_left) && global.training_x >= global.width && global.text_sc = 1
										{
											if global.training_stage[3] = 14 or global.training_stage[3] = 15
											{
												global.training_stage[3] += 1;
											}
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
								#region Рисование руки
									for(i = hand_count; i >= 1; i--)
									{
										hand_xx[i] = 640 - (hand_now - i) * 170 + pvp_x;
										hand_ss[i] = 0;
										if hand_now = i
										{
											hand_ss[i] = 0.9;
										}
										if hand_now = i - 1 or hand_now = i + 1
										{
											hand_ss[i] = 0.5;
										}
										if hand_red[i] = 0
										{
											draw_sprite_ext(s_hand, 0, hand_xx[i], y1, hand_scale * list_scale * hand_ss[i], hand_scale * list_scale * hand_ss[i], hand_true[i] - 90, c_white, hand_ss[i] + 0.1);
										}
										else
										{
											draw_sprite_ext(s_hand, 0, hand_xx[i], y1, hand_scale * list_scale * hand_ss[i], hand_scale * list_scale * hand_ss[i], hand_true[i] - 90 + 180, c_red, hand_ss[i] + 0.1);
										}
									}
								#endregion
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
								test_y  = global.height / 2 - 60;
								pre_wait = 0;
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if point_in_rectangle(mouse_x1, mouse_y1, test_x1 - 150, test_y - 100, test_x1 + 150, test_y + 100) && global.answer = -1
										{
											if mouse_check_button_pressed(mb_left)
											{
												if global.sound
												{
													audio_play_sound(sd_text, 2, 0);
												}
												global.answer = 1;
											}
										}
										if point_in_rectangle(mouse_x1, mouse_y1, test_x2 - 150, test_y - 100, test_x2 + 150, test_y + 100) && global.answer = -1
										{
											if mouse_check_button_pressed(mb_left)
											{
												if global.sound
												{
													audio_play_sound(sd_text, 2, 0);
												}
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
					#region ТРЕНИРОВКА: координаты руки
						if global.training = 4
						{
							if global.training_stage[4] = 7
							{
								global.training_stage[4] = 8;
							}
							var hand_xxx, hand_yyy;
							hand_xxx = -200;
							hand_yyy = -200;
							global.training_hand_x = hand_xxx;
							global.training_hand_y = hand_yyy;
						}
					#endregion
					#region Задача 1 - Шляпа и напертски
						if round_task[global.rounds,global.task] = 1
							{
							#region ТАЙМЕР: Координаты
								timer_y = 120;
							#endregion
							#region Движение
								#region Переменные координат шляп
									var hat_yy, hat_scale;
									hat_yy = global.height / 2 - 30;
									hat_scale = 0.8;
								#endregion
								#region Стадия 0
								if hat_stage = 0 && list_scale = 1
								{
									if global.training < 1 or global.training_stage[4] >= 8
									{
										pre_wait = 1;
										if hat_timer > 0
										{
											hat_timer -=1;
										}
										else
										{
											if hat_y[2] > 0
											{
												hat_y[2] -= 25;
											}
											else
											{
												hat_timer = 10;
												hat_stage = 1;
											}
										}
									}
								}
								#endregion
								#region Стадия 1
									if hat_stage = 1
									{
										pre_wait = 1;
										hat_sha  = choose(1, 2, 3);
										if hat_sha = 1
										{
											hat_cha = choose(2, 3);
										}
										if hat_sha = 2
										{
											hat_cha = choose(1, 3);
										}
										if hat_sha = 3
										{
											hat_cha = choose(1, 2);
										}
										hat_xn[hat_sha] = hat_x[hat_cha];
										hat_xn[hat_cha] = hat_x[hat_sha];
										hat_stage = 2;
									}
								#endregion
								#region Стадия 2
									if hat_stage = 2
									{
										pre_wait = 1;
										if hat_x[hat_sha] < hat_xn[hat_sha]
										{
											hat_x[hat_sha] += hat_spd;
											if hat_x[hat_sha] > hat_xn[hat_sha]
											{
												hat_x[hat_sha] = hat_xn[hat_sha];
											}
										}
										if hat_x[hat_sha] > hat_xn[hat_sha]
										{
											hat_x[hat_sha] -= hat_spd;
											if hat_x[hat_sha] < hat_xn[hat_sha]
											{
												hat_x[hat_sha] = hat_xn[hat_sha];
											}
										}
										if hat_x[hat_cha] < hat_xn[hat_cha]
										{
											hat_x[hat_cha] += hat_spd;
											if hat_x[hat_cha] > hat_xn[hat_cha]
											{
												hat_x[hat_cha] = hat_xn[hat_cha];
											}	
										}
										if hat_x[hat_cha] > hat_xn[hat_cha]
										{
											hat_x[hat_cha] -= hat_spd;
											if hat_x[hat_cha] < hat_xn[hat_cha]
											{
												hat_x[hat_cha] = hat_xn[hat_cha];
											}	
										}
										if hat_x[hat_sha] = hat_xn[hat_sha] && hat_x[hat_cha] = hat_xn[hat_cha]
										{
											if hat_num < hat_max
											{
												hat_num +=1;
												hat_stage = 1;
											}
											else
											{
												hat_stage = 3;
												pre_wait = 0;
											}
										}
									}
								#endregion
								#region Стадия 4
									if hat_stage = 4
									{
										if hat_y[hat_end] < 150
										{
											hat_y[hat_end] += 25;
										}
										else
										{
											hat_stage = 5;
										}
									}
								#endregion
								#region Стадия 5
									if hat_stage = 5
									{
										if hat_res = 0
										{
											if hat_alpha[2] > 0.3
											{
												hat_alpha[2] -= 0.05;
											}
											else
											{
												hat_stage = 6;
											}
										}
										else
										{
											hat_stage = 6;
										}
									}
								#endregion
								#region Стадия 6
									if hat_stage = 6
									{
										if hat_timer > 0
										{
											hat_timer -=1;
										}
										else
										{
											global.answer = hat_res;
											attention_1();
										}
									}
								#endregion
							#endregion
							#region Ответ
								if hat_stage = 3 && global.super_ability = 0 && list_scale = 1
								{
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if device_mouse_check_button_released(dev, mb_left)
										{
											#region Нажатие на шляпы
												if global.training < 1 or global.training_question != 0
												{
													if point_in_rectangle(mouse_x1, mouse_y1, hat_x[2] - 120 * hat_scale, hat_yy - 200 * hat_scale, hat_x[2] + 120 * hat_scale, hat_yy + hat_y[2] + 200 * hat_scale)
													{
														if global.sound
														{
															audio_play_sound(sd_text, 2, 0);
														}
														hat_end = 2;
														hat_res = 1;
														hat_stage = 4;
													}
													if point_in_rectangle(mouse_x1, mouse_y1, hat_x[1] - 120 * hat_scale, hat_yy - 200 * hat_scale, hat_x[1] + 120 * hat_scale, hat_yy + hat_y[1] + 200 * hat_scale)
													{
														if global.sound
														{
															audio_play_sound(sd_text, 2, 0);
														}
														hat_end = 1;
														hat_res = 0;
														hat_stage = 4;
													}
													if point_in_rectangle(mouse_x1, mouse_y1, hat_x[3] - 120 * hat_scale, hat_yy - 200 * hat_scale, hat_x[3] + 120 * hat_scale, hat_yy + hat_y[3] + 200 * hat_scale)
													{
														if global.sound
														{
															audio_play_sound(sd_text, 2, 0);
														}
														hat_end = 3;
														hat_res = 0;
														hat_stage = 4;
													}
												}
											#endregion
											#region ОБУЧЕНИЕ: нажатие на шляпу
												if !(global.training < 1 or global.training_question != 0)
												{
													if point_in_rectangle(mouse_x1, mouse_y1, hat_x[2] - 120 * hat_scale, hat_yy - 200 * hat_scale, hat_x[2] + 120 * hat_scale, hat_yy + hat_y[2] + 200 * hat_scale)
													{
														if global.sound
														{
															audio_play_sound(sd_text, 2, 0);
														}
														hat_end = 2;
														hat_res = 1;
														hat_stage = 4;
													}
													if point_in_rectangle(mouse_x1, mouse_y1, hat_x[1] - 120 * hat_scale, hat_yy - 200 * hat_scale, hat_x[1] + 120 * hat_scale, hat_yy + hat_y[1] + 200 * hat_scale)
													{
														if global.sound
														{
															audio_play_sound(sd_text, 2, 0);
														}
														global.training_gb = "TRY AGAIN";
													}
													if point_in_rectangle(mouse_x1, mouse_y1, hat_x[3] - 120 * hat_scale, hat_yy - 200 * hat_scale, hat_x[3] + 120 * hat_scale, hat_yy + hat_y[3] + 200 * hat_scale)
													{
														if global.sound
														{
															audio_play_sound(sd_text, 2, 0);
														}
														global.training_gb = "TRY AGAIN";
													}
												}
											#endregion
										}
									}
								}
							#endregion
							#region Рисование
								#region ОБУЧЕНИЕ: Тень и нажатие
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
											draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
										}
										if mouse_check_button_pressed(mb_left) && global.training_x >= global.width && global.text_sc = 1
										{
											if global.training_stage[4] = 6
											{
												global.training_stage[4] += 1;
											}
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
								#region Отрисовка шляп
									draw_sprite_ext_t(s_hat, 1, hat_x[2], hat_yy, hat_s[2] * hat_scale * list_scale, hat_s[2] * hat_scale * list_scale, 0, c_white, 1, c_white, c_black);
									draw_sprite_ext(s_hat, 0, hat_x[1], hat_yy - hat_y[1], hat_s[1] * hat_scale * list_scale, hat_s[1] * hat_scale * list_scale, 0, c_white, hat_alpha[1]);
									draw_sprite_ext(s_hat, 0, hat_x[2], hat_yy - hat_y[2], hat_s[2] * hat_scale * list_scale, hat_s[2] * hat_scale * list_scale, 0, c_white, hat_alpha[2]);
									draw_sprite_ext(s_hat, 0, hat_x[3], hat_yy - hat_y[3], hat_s[3] * hat_scale * list_scale, hat_s[3] * hat_scale * list_scale, 0, c_white, hat_alpha[3]);
								#endregion
							#endregion
							}
					#endregion
					#region Задача 2 - Камень, ножницы и чё там
						if round_task[global.rounds,global.task] = 2
							{
							#region ТАЙМЕР: Ожидание и координаты
								timer_y = 150;
								pre_wait = 0;
							#endregion
							#region Координаты
								#region Координаты и размеры
									var x1, y1, y2;
									x1 = 640;
									y1 = global.height / 2 - 140;
									y2 = global.height / 2 + 35;
									if hand_sign_scale < 1
										{
											hand_sign_scale += 0.1;
										}
								#endregion
								#region Символ руки
									if global.training < 1 or (global.training_stage[4] = 12 && global.training_question = 0)
									{
										var nd;
										nd = 0;
										for(j = 1; j <= 3; j ++)
										{
											if nd = 0
											{
												if hand_sign[1] = 0
												{
													if hand_sign_z[1,j] = 2
													{
														nd = j;
													}
												}
												if hand_sign[1] = 1
												{
													if hand_sign_z[1,j] = 0
													{
														nd = j;
														break; 
													}
												}
												if hand_sign[hand_sign_now] = 2
												{
													if hand_sign_z[1,j] = 1
													{
													nd = j;
													break;
													}
												}
											}
										}
										#region Координаты руки
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
										#endregion
									}
								#endregion
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if mouse_check_button_pressed(mb_left)
										{
											if global.sound
											{
												audio_play_sound(sd_text, 2, 0);
											}
											for(j = 1; j <= 3; j ++)
											{
												if point_in_rectangle(mouse_x1, mouse_y1, 640 - 340 + 170 * j - 65, y2 - 65, 640 - 340 + 170 * j + 65, y2 + 65)
												{
													#region Нажатие на вариант
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
																		{
																			hand_sign_now += 1;
																		}
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
																		{
																			hand_sign_now += 1;
																		}
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
																		{
																			hand_sign_now += 1;
																		}
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
																		{
																			hand_sign_now += 1;
																		}
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
																		{
																			hand_sign_now += 1;
																		}
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
																		{
																			hand_sign_now += 1;
																		}
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
															#region ОБУЧЕНИЕ
																if hand_sign[hand_sign_now] = 0
																{
																	if (hand_sign_z[hand_sign_now,j] = 2 && hand_sign_r[hand_sign_now] = 0) or (hand_sign_z[hand_sign_now,j] = 1 && hand_sign_r[hand_sign_now] = 1)
																	{
																		hand_sign_now += 1;
																	}
																	else
																	{
																		global.training_gb = "TRY AGAIN";
																	}
																}
																if hand_sign[hand_sign_now] = 1
																{
																	if (hand_sign_z[hand_sign_now,j] = 0 && hand_sign_r[hand_sign_now] = 0) or (hand_sign_z[hand_sign_now,j] = 2 && hand_sign_r[hand_sign_now] = 1)
																	{
																		hand_sign_now += 1;
																	}
																	else
																	{
																		global.training_gb = "TRY AGAIN";
																	}
																}
																if hand_sign[hand_sign_now] = 2
																{
																	if (hand_sign_z[hand_sign_now,j] = 1 && hand_sign_r[hand_sign_now] = 0) or (hand_sign_z[hand_sign_now,j] = 0 && hand_sign_r[hand_sign_now] = 1)
																	{
																		hand_sign_now += 1;
																	}
																	else
																	{
																		global.training_gb = "TRY AGAIN";
																	}
																}
															#endregion
														}
													#endregion
												}
												else
												{
													hand_sign_c[j] = 0.65;
												}
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
								#region ОБУЧЕНИЕ: Нажатие
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
											draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
										}
										if mouse_check_button_pressed(mb_left) && global.training_x >= global.width && global.text_sc = 1
										{
											if global.training_stage[4] = 10 or global.training_stage[4] = 11
											{
												global.training_stage[4] += 1;
											}
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
								#region Отрисовка руки и задника
									if global.training_stage[4] > 11 or global.training < 1
									{
										for(i = hand_sign_count; i >= 1; i--)
										{
											hand_sign_xx[i] = 640 - (hand_sign_now - i) * 170;
											hand_sign_ss[i] = 0;
											if hand_sign_now = i
											{
												hand_sign_ss[i] = 0.9;
											}
											if hand_sign_now = i - 1 or hand_sign_now = i + 1
											{
												hand_sign_ss[i] = 0.5;
											}
											if hand_sign_red[i] = 0
											{
												draw_sprite_ext(s_sign_hand, hand_sign[i], hand_sign_xx[i], y1, hand_sign_scale * list_scale * hand_sign_ss[i], hand_sign_scale * list_scale * hand_sign_ss[i], 0, c_white, hand_sign_ss[i] + 0.1);
											}
											else
											{
												draw_sprite_ext(s_sign_hand, hand_sign[i], hand_sign_xx[i], y1, hand_sign_scale * list_scale * hand_sign_ss[i], hand_sign_scale * list_scale * hand_sign_ss[i], 0, c_red,   hand_sign_ss[i] + 0.1);
											}
											if i = hand_sign_now
											{
												for(j = 1; j <= 3; j ++)
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
												}
											}
										}
									}
								#endregion
								#region ОБУЧЕНИЕ: Отрисовка руки
									if !(global.training_stage[4] > 11 or global.training < 1)
									{
										if global.training_stage[4] = 11 or global.training_stage[4] = 10
										{
											draw_sprite_ext(s_sign_hand2, 0, 640, global.height / 2, list_scale, list_scale, 0, c_white, 1);
										}
									}
								#endregion
							#endregion
							}
					#endregion
					#region Задача 3 - Конь, заборы
						if round_task[global.rounds,global.task] = 3
							{
							#region ТАЙМЕР: Координаты
								timer_y = 180;
							#endregion
							#region Координаты и появление
								#region Переменные координат
									var x0, x1, y0, hn, ho;
									pre_wait = 0
									for(i = 0; i <= 6; i ++)
									{
										horse_y[i] = global.height / 2 + 60 - 60 * i;
									}
									hn = 0;
									ho = 0;
									x0 = 640;
									y0 = horse_y[horse_now];
									for(i = 1; i <= horse_count; i ++)
									{
										if horse_n[i] != 0
										{
											hn = horse_n[i];
											ho = i;
										}
									}
								#endregion
								#region Падение лошади
									if horse_yy < ho * 60 && horse_death = 0
									{
										horse_yy += ho * 5;
									}
									if horse_death = 1
									{
										if horse_death_y > - 10
										{
											horse_death_y -= 4;
											horse_death_a -= 10;
										}
										else
										{
											horse_death = 3;
										}
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
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if (point_in_rectangle(mouse_x1, mouse_y1, 0, 0, global.width, global.height - 150) && super_now = super_need) or super_now != super_need
										{
											if device_mouse_check_button_pressed(dev, mb_left) && horse_death = 0
											{
												#region Звук
													if global.sound
													{
														audio_play_sound(sd_text, 2, 0);
													}
												#endregion
												#region Нажатие, верное или неверное (лошадь падает)
													if global.training < 1 or global.training_question > 1
													{
														var dir;
														if mouse_x1 < 640
														{
															dir = -1;
														}
														else
														{
															dir = 1;
														}
														for(i = 1; i <= horse_count; i ++)
														{
															if horse_n[i] = 0
															{
																horse_now += 1;
																horse_n[i] = dir;
																if horse_p[i] = dir
																{
																	horse_death = 1;
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
												#endregion
												#region ОБУЧЕНИЕ: Нажатие
													if !(global.training < 1 or global.training_question > 1)
													{
														if global.training_stage[4] = 15 or global.training_stage[4] = 16
														{
															var dir;
															if mouse_x1 < 640
															{
																dir = -1;
															}
															else
															{
																dir = 1;
															}
															for(i = 1; i <= horse_count; i ++)
															{
																if horse_n[i] = 0
																{
																	if horse_p[i] = dir
																	{
																		global.training_gb = "TRY AGAIN";
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
																			{
																				horse_red[1] = -1;
																				horse_red[3] = -1;
																				global.training_stage[4] = 16;
																			}
																		}
																	}
																	break;
																}
															}
														}
													}
												#endregion
											}
										}
									}
								}
							#endregion
							#region Рисование
								#region ОБУЧЕНИЕ: Нажатие
									if global.training = 4
									{
										if (global.training_stage[4] = 14
										or (global.training_stage[4] = 15 && global.training_question = 0)
										or (global.training_stage[4] = 16 && global.training_question = 1))
										{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
										}
										if mouse_check_button_pressed(mb_left) && global.training_x >= global.width && global.text_sc = 1
										{
											if global.training_stage[4] = 14
											{
												global.training_stage[4] += 1;
											}
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
												hand_yyy = global.height / 2;
											}
										}
										global.training_hand_x = hand_xxx;
										global.training_hand_y = hand_yyy;
									}
								#endregion
								for(i = horse_count;i>=1;i--)
								{
									#region Прозрачность лошади
										var hral;
										if horse_y[i] + horse_yy > global.height / 2 + 80
										{
											hral = 1 - abs(global.height / 2 + 80 - horse_y[i] - horse_yy) / 80;
											if hral < 0
											{
												hral = 0;
											}
											
										}
										else
										{
											hral = 1;
										}
									#endregion
									#region Отрисовка заборов (красных и обычных)
										if horse_red[i] = 1
										{
											draw_sprite_ext(s_fence, 0, x0 + 60 * horse_p[i], horse_y[i] + horse_yy, list_scale, list_scale, 0, c_white, hral);
										}
										else
										{
											draw_sprite_ext(s_fence, 0, x0 - 60 * horse_p[i], horse_y[i] + horse_yy, list_scale, list_scale, 0, c_red, hral);
										}
									#endregion
									#region Отрисовка лошади
										if horse_now = i && horse_death = 0
										{
											draw_sprite_ext(s_horse, horse_death, x0 + 60 * hn, y0 + horse_yy, list_scale, list_scale, horse_death_a, c_white, 1);
										}
									#endregion
								}
								#region Отрисовка лошади в начальной позиции или при падении
									if horse_now = 0 or horse_death != 0
									{
										draw_sprite_ext(s_horse, horse_death, x0 + 60 * hn, y0 + horse_yy + horse_death_y, list_scale, list_scale, horse_death_a, c_white, 1);
									}
								#endregion
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
								test_y  = global.height / 2 - 60;
								pre_wait = 0;
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if point_in_rectangle(mouse_x1, mouse_y1, test_x1 - 150, test_y - 100, test_x1 + 150, test_y + 100) && global.answer = -1
										{
											if mouse_check_button_pressed(mb_left)
											{
												if global.sound
												{
													audio_play_sound(sd_text, 2, 0);
												}
												global.answer = 1;
											}
										}
										if point_in_rectangle(mouse_x1, mouse_y1, test_x2 - 150, test_y - 100, test_x2 + 150, test_y + 100) && global.answer = -1
										{
											if mouse_check_button_pressed(mb_left)
											{
												if global.sound
												{
													audio_play_sound(sd_text, 2, 0);
												}
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
							#region ТАЙМЕР: Координаты
								timer_y  = 0;
							#endregion
							#region Координаты
								#region Координаты карт
									var card_x, card_y;
									card_x = 640 - 70 - 70 * (card_all == 3);
									card_y = global.height / 2 - 60 - 50;
								#endregion
								#region Карты
									if list_scale = 1
									{
										if card_time > -1
										{
											if card_time > 0
											{
												#region Карты появились
													if global.training < 1 or global.training_stage[1] = 8
													{
														card_time -= 1;
													}
													for(i = 1; i <= 2; i ++)
													{
														for(j = 1; j <= card_all; j ++)
														{
															card_now[i,j]   = 3;
															card_i[i,j]     = card_m[i,j];
															card_scale[i,j] = 0.7;
														}
													}
												#endregion
											}
											else
											{
												#region Обнуление времени
													for(i = 1; i <= 2; i ++)
													{
														for(j = 1; j <= card_all; j ++)
														{
															card_now[i,j] = 4;
														}
													}
													card_time = -1;
												#endregion
											}
										pre_wait = 1;
										}
										else
										{
											pre_wait = 0;
										}
									}
								#endregion
								#region ОБУЧЕНИЕ: Координаты руки
									if global.training = 1
									{
										var hand_xxx, hand_yyy;
										hand_xxx = -200;
										hand_yyy = -200;
									}
								#endregion
							#endregion
							#region Ответ
									if card_time = -1 && list_scale = 1
									{
										for(i = 1; i <= 2; i ++)
										{
											for(j = 1; j <= 3; j ++)
											{
												#region Нажатие на карту
													for(dev = 0; dev < 5; dev ++)
													{
														#region ОБУЧЕНИЕ: Координаты руки
															if global.training = 1 && global.training_stage[1] = 8 && hand_xxx = -200
															{
																#region Первая
																	if (i = 1 && j = 1) && global.training_hand_s = 0
																	{
																		hand_xxx = card_x;
																		hand_yyy = card_y + card_yy[i,j];
																	}
																#endregion
																#region Вторая
																	if ((card_m[1,2] = card_m[1,1] && i = 1 && j = 2)
																	or (card_m[2,1] = card_m[1,1] && i = 2 && j = 1)
																	or (card_m[2,2] = card_m[1,1] && i = 2 && j = 2))
																	&& global.training_hand_s = 1
																	{
																		hand_xxx = card_x + (j-1) * 140;
																		hand_yyy = card_y + 180 * (i-1) + card_yy[i,j];
																	}
																#endregion
																#region Третья
																	if ((card_now[1,2] = 0 && i = 1 && j = 2)
																	or (card_now[2,1] = 0 && i = 2 && j = 1)
																	or (card_now[2,2] = 0 && i = 2 && j =2)) && global.training_hand_s = 2
																	{
																		hand_xxx = card_x + (j-1) * 140;
																		hand_yyy = card_y + 180 * (i-1) + card_yy[i,j];
																	}
																#endregion
																#region Четвёртая
																	if ((card_now[1,2] = 0 && i = 1 && j = 2)
																	or (card_now[2,1] = 0 && i = 2 && j = 1)
																	or (card_now[2,2] = 0 && i = 2 && j =2)) && global.training_hand_s = 3
																	{
																		hand_xxx = card_x + (j-1) * 140;
																		hand_yyy = card_y + 180 * (i-1) + card_yy[i,j];
																	}
																#endregion
																#region Установка координат
																	global.training_hand_x = hand_xxx;
																	global.training_hand_y = hand_yyy;
																#endregion
															}
														#endregion
														mouse_x1 = device_mouse_x(dev);
														mouse_y1 = device_mouse_y(dev);
														if point_in_rectangle(mouse_x1, mouse_y1, card_x + (j-1) * 140 - 75 * card_scale[i,j], card_y + 180 * (i-1) - 110 * card_scale[i,j], card_x + (j-1) * 140 + 75 * card_scale[i,j], card_y + 180 * (i-1) + 110 * card_scale[i,j])
														{
															if device_mouse_check_button_pressed(dev, mb_left) && card_now[i,j] = 0 && card_end[i,j] = 0 && global.super_ability = 0 && list_scale > 0
															{
																#region ОБУЧЕНИЕ: Рука на картах
																	if global.training = 1
																	{
																		if global.training_stage[1] = 8
																		{
																			if global.training_hand_s = 0
																			{
																				if !(i = 1 && j = 1)
																				{
																					break;
																				}
																			}
																			if global.training_hand_s = 1
																			{
																				if !((i = 1 && j = 2 && card_m[1,1] = card_m[1,2])
																				or (i = 2 && j = 1 && card_m[1,1] = card_m[2,1])
																				or (i = 2 && j = 2 && card_m[1,1] = card_m[2,2]))
																				{
																					break;
																				}
																			}
																			global.training_hand_s += 1;
																		}
																		else
																		{
																			break;
																		}
																	}
																#endregion
																#region Звук
																	if global.sound
																	{
																		audio_play_sound(sd_text, 2, 0);
																	}
																#endregion
																#region Текущая карта
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
																#endregion
															}
														}
													}
												#endregion
												#region Стадия 1: Показ - начало поворота
													if card_now[i,j] = 1
													{
														if card_scale[i,j] > 0
														{
															card_scale[i,j] -= 0.2;
														}
														else
														{
															card_now[i,j] = 2;
															card_i[i,j] = card_m[i,j];
														}
													}
												#endregion
												#region Стадия 2: Показ - конец разворота
													if card_now[i,j] = 2
													{
														if card_scale[i,j] < 0.7
														{
															card_scale[i,j] += 0.2;
														}
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
															{
																card_now[i,j] = 3;
															}
														}
													}
												#endregion
												#region Стадия 4: Сворачивание - начало разворота
													if card_now[i,j] = 4
													{
														if card_scale[i,j] > 0
														{
															card_scale[i,j] -= 0.2;
														}
														else
														{
															card_now[i,j] = 5;
															card_i[i,j] = 0;
														}
													}
												#endregion
												#region Стадия 5: Сворачивание - конец разворота
													if card_now[i,j] = 5
													{
														if card_scale[i,j] < 0.7
														{
															card_scale[i,j] += 0.2;
														}
														else
														{
															card_now[i,j] = 0;
														}
													}
												#endregion
												#region Исчезновение карты
													if card_end[i,j] = 1
													{
														if card_alp[i,j] > 0
														{
															card_alp[i,j] -= 0.1;
															card_yy[i,j]  += 5;
														}
													}
												#endregion
											}
										}
										#region Верный ответ
											if card_end[1,1] = 1 && card_end[1,2] = 1
											&& card_end[2,1] = 1 && card_end[2,2] = 1 && ((card_end[2,3] = 1 && card_end[1,3] = 1) or card_all = 2)
											{
												global.answer = 1;
												cards_1();
											}
										#endregion
									}
							#endregion
							#region Рисование
								#region ОБУЧЕНИЕ: Тень и нажатие
									if global.training = 1
									{
										if (global.training_stage[1] = 6 or global.training_stage[1] = 7
										or (global.training_stage[1] = 8 && global.training_question = 0))
										{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
										}
										if mouse_check_button_pressed(mb_left) && global.training_x >= global.width && global.text_sc = 1
										{
											if global.training_stage[1] = 6 or global.training_stage[1] = 7
											{
												global.training_stage[1] += 1;
											}
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
								#region Рисование карт
									for(i = 1; i <= 2; i ++)
									{
										for(j = 1; j <= card_all; j ++)
										{
											draw_sprite_ext(s_card, card_i[i,j], card_x + (j-1) * 140, card_y + 180 * (i-1) + card_yy[i,j], card_scale[i,j] * list_scale, 0.7, 0, c_white, card_alp[i,j]);
										}
									}
								#endregion
							#endregion
							}
					#endregion
					#region Задача 2 - Карты, найти карту
						if round_task[global.rounds,global.task] = 2
							{
							#region ТАЙМЕР: Координаты
								timer_y  = 0;
							#endregion
							#region Координаты
								#region Координаты карт
									var card_x, card_y;
									card_x = 640 - 70 - 70 * (card_all == 3);
									card_y = global.height / 2 - 60 - 50;
								#endregion
								#region Одна карта
									if list_scale = 1
									{
										#region Показ одной карты, переменные
											if card_time > -1 && list_scale = 1
											{
												pre_wait = 1;
												if card_time > 0
												{
													if global.training < 1 or (global.training_stage[1] = 12 or global.training_stage[1] = 13)
													{
														card_time -= 1;
													}
													for(i = 1; i <= 2; i ++)
													{
														for(j = 1; j <= card_all; j ++)
														{
															card_now[i,j]   = 3;
															card_i[i,j]     = card_m[i,j];
															card_scale[i,j] = 0.7
														}
													}
												}
												else
												{
													for(i = 1; i <= 2; i ++)
													{
														for(j = 1; j <= card_all; j ++)
														{
															card_now[i,j] = 4;
														}
													}
													card_time = -2;
												}
											}
										#endregion
										#region Пока одной карты, угл
											if card_time = -3
											{
												pre_wait = 1;
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
														{
															card_time = -4;
														}
													}
												}
											}
										#endregion
										#region Сворачивание одной карты
											if card_time = -4
											{
												if global.training < 1 or global.training_stage[1] = 13
												{
													if card_find_s > 0
													{
														card_find_s -= 0.1;
														card_find_a += 1;
														global.training_hand_s = 0;
														pre_wait = 1;
													}
													else
													{
														card_time   = -1;
														pre_wait    = 0;
														card_find_s = 0;
													}
												}
											}
										#endregion
									}
								#endregion
								#region ОБУЧЕНИЕ: Изменение координат руки
									#region Координаты руки
										if global.training = 1
										{
											var hand_xxx, hand_yyy;
											hand_xxx = -200;
											hand_yyy = -200;
										}
									#endregion
									#region Изменение координат
										if global.training_stage[1] = 13 && global.training_question = 0
										{
											for(i = 1; i <= 2; i ++)
											{
												for(j = 1; j <= card_all; j ++)
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
								#endregion
							#endregion
							#region Ответ
									if card_time = -1 or card_time = -2 && list_scale = 1
									{
										for(i = 1; i <= 2; i ++)
										{
											for(j = 1; j <= card_all; j ++)
											{
												#region Нажатие на карту
													for(dev = 0; dev < 5; dev ++)
													{
														mouse_x1 = device_mouse_x(dev);
														mouse_y1 = device_mouse_y(dev);
														if point_in_rectangle(mouse_x1, mouse_y1, card_x + (j-1) * 140 - 75 * card_scale[i,j], card_y + 180 * (i-1) - 110 * card_scale[i,j], card_x + (j-1) * 140 + 75 * card_scale[i,j], card_y + 180 * (i-1) + 110 * card_scale[i,j])
														{
															if device_mouse_check_button_pressed(dev, mb_left) && card_time = -1 && card_now[i,j] = 0 && card_end[i,j] = 0 && global.super_ability = 0 && list_scale > 0
															{
																#region ОБУЧЕНИЕ: Карты
																	if global.training = 1 && global.training_question = 0
																	{
																		if global.training_stage[1] = 13
																		{
																			if global.training_hand_s = 0
																			{
																				if card_m[i,j] != card_find
																				{
																					break;
																				}
																			}
																			if global.training_hand_s = 1
																			{
																				if card_m[fir_i,fir_j] != card_m[i,j]
																				{
																					break;
																				}
																			}
																			global.training_hand_s += 1;
																		}
																		else
																		{
																			break;
																		}
																	}
																#endregion
																#region Звук
																	if global.sound
																	{
																		audio_play_sound(sd_text, 2, 0);
																	}
																#endregion
																#region Нажатие на карту
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
																#endregion
															}
														}
													}
												#endregion
												#region Стадия 1: Разворот - начало
													if card_now[i,j] = 1
													{
														if card_scale[i,j] > 0
														{
															card_scale[i,j] -= 0.2;
														}
														else
														{
															card_now[i,j] = 2;
															card_i[i,j] = card_m[i,j];
														}
													}
												#endregion
												#region Стадия 2: Разворот - конец, проверка
													if card_now[i,j] = 2
													{
														if card_scale[i,j] < 0.7
														{
															card_scale[i,j] += 0.2;
														}
														else
														{
															if card_i[i,j] = card_find
															{
																card_have += 1;
															}
															else
															{
																global.answer = 0;
																cards_2();
																break;
															}
															if sec_i != 0 && card_scale[sec_i,sec_j] = 0.7
															{
																if card_m[fir_i,fir_j] = card_m[sec_i,sec_j]
																{
																	if card_have = 2
																	{
																		global.answer = 1;
																		cards_2();
																		break;
																	}
																	card_end[fir_i,fir_j] = 1;
																	card_end[sec_i,sec_j] = 1;
																}
																else
																{
																	if card_have = 1 or card_have = 0
																		{
																			global.answer = 0;
																			cards_2();
																			break;
																		}
																	card_now[fir_i,fir_j] = 4;
																	card_now[sec_i,sec_j] = 4;
																}
																fir_i = 0;
																fir_j = 0;
																sec_i = 0;
																sec_j = 0;
															}
															else
															{
																card_now[i,j] = 3;
															}
														}
													}
												#endregion
												#region Стадия 4: Сворачивание карты 1
													if card_now[i,j] = 4
													{
														if card_scale[i,j] > 0
														{
															card_scale[i,j] -= 0.2;
														}
														else
														{
															card_now[i,j] = 5;
															card_i[i,j] = 0;
														}
													}
												#endregion
												#region Стадия 5: Сворачивание карты 2
													if card_now[i,j] = 5
													{
														if card_scale[i,j] < 0.7
														{
															card_scale[i,j] += 0.2;
														}
														else
														{
															card_now[i,j] = 0;
															if card_time = -2
															{
																card_time = -3;
															}
														}
													}
												#endregion
												#region Исчезновение карты
													if card_end[i,j] = 1
													{
														if card_alp[i,j] > 0
														{
															card_alp[i,j] -= 0.1;
															card_yy[i,j]  += 5;
														}
													}
												#endregion
											}
										}
									}
							#endregion
							#region Рисование
								#region ОБУЧЕНИЕ: Тень и нажатие
									if global.training = 1
									{
										if (global.training_stage[1] = 10 or global.training_stage[1] = 11
										or global.training_stage[1] = 12 or (global.training_stage[1] = 13 && global.training_question = 0))
										{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
										}
										if mouse_check_button_pressed(mb_left) && global.training_x >= global.width && global.text_sc = 1
										{
											if global.training_stage[1] = 10 or global.training_stage[1] = 11 or (global.training_stage[1] = 12 && card_find_s >= 1)
											{
												global.training_stage[1] += 1;
											}
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
								#region Отрисовка карт и одной карты
									for(i = 1; i <= 2; i ++)
									{
										for(j = 1; j <= card_all; j ++)
										{
											draw_sprite_ext(s_card, card_i[i,j], card_x + (j-1) * 140, card_y + 180 * (i-1) + card_yy[i,j], card_scale[i,j] * list_scale, 0.7, 0, c_white, card_alp[i,j]);
										}
									}
									draw_sprite_ext(s_card, card_find, card_x + 70 + 70 * (card_all == 3), card_y + 90, card_find_s * 0.7 * list_scale, card_find_s * 0.7 * list_scale, card_find_a, c_white, 1);
								#endregion
							#endregion
							}
					#endregion
					#region Задача 3 - Карты, порядок
						if round_task[global.rounds,global.task] = 3
							{
							#region ТАЙМЕР: Координаты
								timer_y  = -20;
							#endregion
							#region Координаты
								#region Координаты карт
									var card_x, card_y;
									card_x = 640;
									card_y = global.height / 2 - 70;
								#endregion
								#region ОБУЧЕНИЕ: Координаты руки
									if global.training = 1
									{
										var hand_xxx, hand_yyy;
										hand_xxx = -200;
										hand_yyy = -200;
									}
								#endregion
								#region Карты
									if list_scale = 1
									{
										for(i = 1; i <= cards_all; i ++)
										{
											#region Показ карт и присвоение номера
												if cards_s[i] = 0
												{
													pre_wait = 1;
													if cards_i[i] = 0
													{
														if cards_ss[i] > 0
														{
															cards_ss[i] -= 1 / 5;
														}
														else
														{
															cards_i[i] = cards_m[i];
														}
													}
													else
													{
														if cards_ss[i] < 1
														{
															cards_ss[i] += 1 / 5;
														}
														else
														{
															cards_s[i] = 1;
														}
													}
													break;
												}
											#endregion
											#region Расстановка карт на свои места
												if cards_s[i] = 1 && cards_s[cards_all] = 1
												{
													if cards_time > 0 
													{
														pre_wait = 1;
														if global.training < 1 or global.training_stage[1] = 15 or global.training_stage[1] = 16
														{
															cards_time -= 1;
														}
													}
													else
													{
														if global.training < 1 or global.training_stage[1] = 16
														{
															if abs(cards_x[i] - cards_xx[i]) > 10
															{
																cards_x[i] -= 20 * sign(cards_x[i] - cards_xx[i]); }
															else
															{
																cards_x[i] = cards_xx[i];
															}
															if cards_y[i] < 200
															{
																cards_y[i] += 30;
																pre_wait = 1;
															}
															else
															{
																pre_wait = 0;
															}
														}
													}
												}
											#endregion
											#region Ответ и движение карт
												if cards_s[i] = 2
												{
													#region ОБУЧЕНИЕ: Координаты карт
														if global.training > 0 && hand_xxx = -200 && cards_x[i] = cards_xs[i]
														{
															hand_xxx = cards_x[i];
															hand_yyy = cards_y[i];
														}
													#endregion
													#region Верный ответ
														if abs(cards_x[i] - cards_xs[i]) > 10
														{
															cards_x[i] -= 20 * sign(cards_x[i] - cards_xs[i]);
														}
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
													#endregion
													#region Поднятие карты обратно
														if cards_y[i] > 0
														{
															cards_y[i] -= 30;
														}
													#endregion
												}
											#endregion
										}
									}
								#endregion
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev = 0; dev < 5; dev ++)
										{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if device_mouse_check_button_pressed(dev, mb_left)
											{
											#region Звук
												if global.sound { audio_play_sound(sd_text, 2, 0); }
											#endregion
											#region Нажатие на карту
												for(i = 1; i <= cards_all; i ++)
													{
													if point_in_rectangle(mouse_x1, mouse_y1, card_x + cards_x[i] - 52, card_y + cards_y[i] - 70 - 75, card_x + cards_x[i] + 52, card_y + cards_y[i] - 70 + 75)
														{
														#region Прибавление стадии и проигрыш
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
														#endregion
														#region ОБУЧЕНИЕ: Прибавление стадии карт
															if !(global.training < 1 or global.training_question != 0)
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
														#endregion
														}
													}
											#endregion
											}
										}
									}
							#endregion
							#region Рисование
								#region ОБУЧЕНИЕ: Тень и нажатие
									if global.training = 1
									{
										if (global.training_stage[1] = 14 or global.training_stage[1] = 15
										or (global.training_stage[1] = 16 && global.training_question = 0))
										{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
										}
										if mouse_check_button_pressed(mb_left) && global.training_x >= global.width && global.text_sc = 1
										{
											if global.training_stage[1] = 14 or (global.training_stage[1] = 15 && cards_s[2] = 1)
											{
												global.training_stage[1] += 1;
											}
										}
										if global.training_question = 3
										{
											global.training_stage[1] += 1;
											global.training_hand_s   = 0;
											global.training_question = 0;
											global.text_ne = 1;
											global.text_go = 0;
											global.training_stage[1] = 22;
										}
									}
								#endregion
								#region Рисование карт
									for(i = 1; i <= cards_all; i ++)
									{
										draw_sprite_ext(s_card, cards_i[i], card_x + cards_x[i], card_y + cards_y[i] - 70, cards_ss[i] * 0.7 * list_scale, 0.7, 0, c_white, 1);
									}
								#endregion
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
								test_y  = global.height / 2 - 60;
								pre_wait = 0;
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if point_in_rectangle(mouse_x1, mouse_y1, test_x1 - 150, test_y - 100, test_x1 + 150, test_y + 100) && global.answer = -1
										{
											if mouse_check_button_pressed(mb_left)
											{
												if global.sound
												{
													audio_play_sound(sd_text, 2, 0);
												}
												global.answer = 1;
											}
										}
										if point_in_rectangle(mouse_x1, mouse_y1, test_x2 - 150, test_y - 100, test_x2 + 150, test_y + 100) && global.answer = -1
										{
											if mouse_check_button_pressed(mb_left)
											{
												if global.sound
												{
													audio_play_sound(sd_text, 2, 0);
												}
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
					#region ТРЕНИРОВКА: Координаты руки
						if global.training = 5
						{
							if global.training_stage[5] = 7
							{
								global.training_stage[5] = 8;
							}
							var hand_xxx, hand_yyy;
							hand_xxx = -200;
							hand_yyy = -200;
							global.training_hand_x = hand_xxx;
							global.training_hand_y = hand_yyy;
						}
					#endregion
					#region Задача 1 - Мишени, появление
						if round_task[global.rounds,global.task] = 1
						{
							#region ТАЙМЕР: Координаты
								timer_y = 170;
							#endregion
							#region Координаты
								if list_scale = 1 && (global.player_object).stun = 0 && (global.training < 1 or global.training_stage[5] = 8)
								{
									for(i = 1; i <= aim_all; i ++)
									{
										if aim_p[i] = 0
										{
											#region Появление мишеней
												if aim_s[i] < 1
												{
													aim_s[i] += 0.1;
													aim_a[i] += 5;
													break;
												}
												else
												{
													aim_p[i] = 1;
												}
											#endregion
										}
										else
										{
											#region Угол и ответ
												#region Вращение мишени
													pre_wait = 0;
													aim_a[i] += 2;
												#endregion
												if aim_d[i] = 0
												{
													#region Неверный ответ
														if (global.training < 1 or global.training_question != 0)
														{
															if aim_t[i] > 0
															{
																aim_t[i] -= 1;
															}
															else
															{
																if aim_r[i] = 0 
																{
																	if aim_s[i] > 0
																	{
																		aim_s[i] -= 0.1;
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
																	aim_d[i] = 1;
																}
															}
														}
													#endregion
													#region ОБУЧЕНИЕ: Координаты руки
														if !(global.training < 1 or global.training_question != 0)
														{
															if hand_xxx = -200 && aim_d[i] = 0
															{
																hand_xxx = aim_xx[aim_n[i]];
																hand_yyy = aim_yy[aim_n[i]];
																global.training_hand_x = hand_xxx;
																global.training_hand_y = hand_yyy;
															}
														}
													#endregion
												}
												else
												{
													#region Исчезновение мишени
														if aim_s[i] > 0
														{
															aim_s[i] -= 0.1;
														}
													#endregion
												}
											#endregion
										}
										#region Верный финальный выстрел 2
											if aim_now > aim_all
											{
												global.answer = 1;
												shooting_1();
												break;
											}
										#endregion
									}
								}
								#region Верный финальный ответ
									if aim_r[aim_now] = 1
									{
										aim_now += 1;
										if aim_now > aim_all && global.answer = -1
										{
											global.answer = 1;
											shooting_1();
										}
									}
								#endregion
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										for(i = 1; i <= aim_all; i ++)
										{
											if point_in_circle(mouse_x1, mouse_y1, aim_xx[aim_n[i]], aim_yy[aim_n[i]], 70) && global.answer = -1
											{
												if device_mouse_check_button_pressed(dev,mb_left) && aim_d[i] = 0
												{
													#region Звук
														if global.sound
														{
															audio_play_sound(sd_text, 2, 0);
														}
													#endregion
													#region Нажатие и остановка при неверном ответе
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
													#endregion
													#region ОБУЧЕНИЕ: Авто-ответ
														if !(global.training < 1 or global.training_question != 0)
														{
															if aim_now = i && global.training_stage[5] = 8
															{
																aim_d[i] = 2;
																aim_now += 1;
																break;
															}
														}
													#endregion
												}
											}
										}
									}
								}
							#endregion
							#region Рисование
								#region ОБУЧЕНИЕ: Тень и нажатие
									if global.training = 5
									{
										if (global.training_stage[5] = 6 or global.training_stage[5] = 7
										or (global.training_stage[5] = 8 && global.training_question = 0))
										{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
										}
										if mouse_check_button_pressed(mb_left) && global.training_x >= global.width && global.text_sc = 1
										{
											if global.training_stage[5] = 6 or global.training_stage[5] = 7
											{
												global.training_stage[5] += 1;
											}
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
								#region Рисование мишеней
									for(i = 1; i <= aim_all; i ++)
									{
										if aim_r[i] = 0
										{
											draw_sprite_ext_t(s_target_2, 0, aim_xx[aim_n[i]], aim_yy[aim_n[i]], aim_s[i] * 0.9, aim_s[i] * 0.9, aim_a[i], global.color_white, 1, global.color_white, c_black);
										}
										else
										{
											draw_sprite_ext_t(s_target_2, 0, aim_xx[aim_n[i]], aim_yy[aim_n[i]], aim_s[i] * 0.9, aim_s[i] * 0.9, aim_a[i], c_red, 1, c_red, c_black);
										}
									}
								#endregion
							#endregion
						}
					#endregion
					#region Задача 2 - Мишени, пистолет
						if round_task[global.rounds,global.task] = 2
							{
							#region ТАЙМЕР: Координаты
								timer_y = 160;
							#endregion
							#region Координаты
								if list_scale = 1
								{
									#region Изменение угла
										if global.training < 1 or global.training_question != 0
										{
											if target_iii = 0
											{
												if target_red = 0
												{
													target_ang += target_spd + (target_now * 2);
												}
												else
												{
													target_ang += target_spd * target_all / target_now;
												}
											}
											if target_ang >= 360
											{
												if target_now > target_all / 2
												{
													pre_wait = 0;
												}
												target_ang -= 360;
											}
										}
									#endregion
									#region ОБУЧЕНИЕ: Координаты рук и изменение угла
										if !(global.training < 1 or global.training_question != 0)
										{
											if target_iii = 0 && global.training_stage[5] = 12
											{
												var t_stop;
												t_stop = 0;
												for(i = 1; i <= target_all; i ++)
												{
													if target_d[i] = 0
													{
														if abs(target_v[target_m[i]] - target_ang) < target_spd + (target_now * 2)
														or abs(target_v[target_m[i]] - target_ang) > 360 - target_spd - (target_now * 2)
														{
															if target_n[i] = target_now
															{
																t_stop = 1;
																target_ang = target_v[target_m[i]];
																hand_xxx = 640 - 300;
																hand_yyy = global.height / 2 + 100;
																global.training_hand_x = hand_xxx;
																global.training_hand_y = hand_yyy;
															}
														}
													}
												}
												if t_stop = 0
												{
													target_ang += target_spd + (target_now * 2);
												}
											}
											if target_ang >= 360
											{
												target_ang -= 360;
											}
										}
									#endregion
								}
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if (point_in_rectangle(mouse_x1, mouse_y1, 0, 0, global.width, global.height - 150) && super_now = super_need) or super_now != super_need
										{
											if device_mouse_check_button_pressed(dev, mb_left)
											{
												#region Звук
													if global.sound
													{
														audio_play_sound(sd_text, 2, 0);
													}
												#endregion
												#region Индекс мишени
													if global.training < 1 or global.training_question != 0
													{
														if target_iii = 0
														{
															target_iii = 1;
														}
													}
												#endregion
												#region ОБУЧЕНИЕ: Индекс мишени
													if !(global.training < 1 or global.training_question != 0)
													{
														for(i = 1; i <= target_all; i ++)
														{
															if target_d[i] = 0 && global.training_stage[5] = 12
															{
																if abs(target_v[target_m[i]] - target_ang) < 20
																or abs(target_v[target_m[i]] - target_ang) > 340
																{
																	if target_n[i] = target_now
																	{
																		target_iii = 1;
																	}
																}
															}
														}
													}
												#endregion
											}
										}
									}
								}
							#endregion
							#region Рисование и логика
								#region ОБУЧЕНИЕ: Тень и нажатие
									if global.training = 5
									{
										if (global.training_stage[5] = 10 or global.training_stage[5] = 11
										or (global.training_stage[5] = 12 && global.training_question = 0))
										{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
										}
										if mouse_check_button_pressed(mb_left) && global.training_x >= global.width && global.text_sc = 1
										{
											if global.training_stage[5] = 10 or global.training_stage[5] = 11
											{
												global.training_stage[5] += 1;
											}
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
								#region Отрисовка мишеней и пистолета
									if global.training < 1 or global.training_question != 0 or global.training_stage[5] = 12
									{
										#region Отрисовка и размер мишеней
											for(i = 1; i <= target_all; i ++)
											{
												if target_d[i] = 1
												{
													if target_s[i] > 0
													{
														target_s[i] -= 0.15;
														target_a[i] += 5;
													}
													else
													{
														target_s[i] = 0;
													}
													if target_s[i] < 0
													{
														target_s[i] = 0;
													}
												}
												target_x[i] = 640 + lengthdir_x(300, target_v[target_m[i]]);
												target_y[i] = global.height / 2 + 95 + lengthdir_y(300, target_v[target_m[i]]);
												draw_sprite_ext_t(s_target_2, 0, target_x[i], target_y[i], 0.7 * list_scale * target_s[i], 0.7 * list_scale * target_s[i], target_a[i], c_maroon, 1, c_maroon, c_black);
												draw_text_transformed_t(target_x[i], target_y[i], string(target_n[i]), 0.3 * list_scale * target_s[i], 0.3 * list_scale * target_s[i], target_a[i], global.color_white, c_black);
											}
										#endregion
										#region Логика попадания, верный и неверный ответ
											if target_iii > 0
											{
												if target_iii < 4
												{
													target_iii += 1;
												}
												else
												{
													target_iii = 0;
													for(i = 1; i <= target_all; i ++)
													{
														if target_d[i] = 0
														{
															if abs(target_v[target_m[i]] - target_ang) < 20
															or abs(target_v[target_m[i]] - target_ang) > 340
															{
																pre_wait = 0;
																if target_n[i] = target_now
																{
																	target_now += 1 * (target_red == 0) - 1 * (target_red == 1);
																	target_d[i] = 1;
																}
																else
																{
																	global.answer = 0;
																	shooting_2();
																}
																if (target_now > target_all && target_red = 0) or (target_now < target_all && target_red = 1)
																{
																	global.answer = 1;
																	shooting_2();
																}
																break;
															}
														}
													}
												}
											}
										#endregion
										#region Отрисовка пушки
											if target_red = 0
												{
													draw_sprite_ext_t(s_gun_bullet, target_iii, 640, global.height / 2 + 95, 0.6 * list_scale, 0.6 * list_scale, target_ang - 20, c_white, 1, c_white, c_black);
												}
												else
												{
													draw_sprite_ext_t(s_gun_bullet, target_iii, 640, global.height / 2 + 95, 0.6 * list_scale, 0.6 * list_scale, target_ang - 20, c_red, 1, c_red, c_black);
												}
										#endregion
									}
								#endregion
							#endregion
							}
					#endregion
					#region Задача 3 - Мишени, нож
						if round_task[global.rounds,global.task] = 3
							{
							#region ТАЙМЕР: Ожидание и координаты
								timer_y = 160;
								pre_wait = 0;
							#endregion
							#region Координаты
								if list_scale = 1
								{
									#region Изменение угла
										if global.training < 1 or global.training_question != 0
										{
											targetk_ang += targetk_spd;
											if targetk_ang >= 360
											{
												targetk_ang -= 360;
												if knife_now > targetk_all / 2
												{
													pre_wait = 0;
												}
											}
										}
									#endregion
									#region ОБУЧЕНИЕ: Изменение угла и координата руки
										if !(global.training < 1 or global.training_question != 0)
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
														{
															pre_wait = 0;
														}
													}
												}
												else
												{
													hand_xxx = 640 + 300;
													hand_yyy = global.height / 2;
													global.training_hand_x = hand_xxx;
													global.training_hand_y = hand_yyy;
												}
											}
										}
									#endregion
									#region Появление и движение ножа
										for(i = 1; i <= knife_now; i ++)
											{
											#region Появление ножа
												if knife_d[i] = -1
												{
													if knife_x[i] > 640 - 200
													{
														knife_x[i] -= 10;
													}
													else
													{
														knife_d[i] = 0;
													}
												}
											#endregion
											#region Движение ножа и непопадание
												if knife_d[i] = 1
												{
													if knife_x[i] < 640 + 200 - sprite_get_width(s_knife_target2) / 2
													{
														knife_x[i] += knife_spd;
													}
													if knife_x[i] >= 640 + 200 - sprite_get_width(s_knife_target2) / 2
													{
														knife_x[i] = 640 + 200 - sprite_get_width(s_knife_target2) / 2 + 10;
														for(j = 1; j <= targetk_all; j ++)
														{
															if point_in_circle(knife_x[i], knife_y[i], 640 + 200 + lengthdir_x(sprite_get_width(s_knife_target2) / 2,targetk_v[targetk_n[j]] + targetk_ang), global.height / 2 + lengthdir_y(sprite_get_width(s_knife_target2) / 2,targetk_v[targetk_n[j]] + targetk_ang), 40)
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
											#endregion
											#region Респавн ножа
												if global.answer = -1
												{
													if knife_d[i] = 2
													{
														knife_x[i] = 640 + 200 + lengthdir_x(sprite_get_width(s_knife_target2) / 2,targetk_v[targetk_n[knife_n[i]]] + targetk_ang);
														knife_y[i] = global.height / 2 + lengthdir_y(sprite_get_width(s_knife_target2) / 2,targetk_v[targetk_n[knife_n[i]]] + targetk_ang);
														knife_a[i] = knife_a1[i] + targetk_ang - 180;
													}
												}
											#endregion
											}
									#endregion
									#region Игрок попал во все мишени
										if knife_now > targetk_all
										{
											global.answer = 1;
											shooting_3();
										}
									#endregion
								}
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if (point_in_rectangle(mouse_x1, mouse_y1, 0, 0, global.width, global.height - 150) && super_now = super_need) or super_now != super_need
										{
											if device_mouse_check_button_pressed(dev,mb_left)
											{
												#region Звук
													if global.sound
													{
														audio_play_sound(sd_text, 2, 0);
													}
												#endregion
												#region Бросок ножа
													if global.training < 1 or global.training_question != 0
													{
														if knife_d[knife_now] = 0
														{
															knife_d[knife_now] = 1;
														}
													}
												#endregion
												#region ОБУЧЕНИЕ: Бросок ножа
													if !(global.training < 1 or global.training_question != 0)
													{
														if (abs((targetk_v[targetk_n[1]] + targetk_ang) - 180) < targetk_spd && (targetk_v[targetk_n[1]] + targetk_ang) <= 360)
														or (abs((targetk_v[targetk_n[1]] + targetk_ang) - 540) < targetk_spd && (targetk_v[targetk_n[1]] + targetk_ang) > 360)
														&& global.training_stage[5] = 17
														{
															if knife_d[knife_now] = 0
															{
																knife_d[knife_now] = 1;
															}
														}
													}
												#endregion
											}
										}
									}
								}
							#endregion
							#region Рисование
								#region ОБУЧЕНИЕ: Отрисовка прямоугольника и нажатие
									if global.training = 5
									{
										if (global.training_stage[5] = 14
										or (global.training_stage[5] = 17 && global.training_question = 0))
										{
											draw_set_alpha(0.45);
											draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
											draw_set_alpha(1);
										}
										if mouse_check_button_pressed(mb_left) && global.training_x >= global.width && global.text_sc = 1
										{
											if global.training_stage[5] = 14
											{
												global.training_stage[5] = 17;
											}
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
								#region Отрисовка ножа, круглой штуки и мишеней
									for(i = 1; i <= knife_now; i ++)
									{
										draw_sprite_ext_t(s_knife, 0, knife_x[i], knife_y[i], list_scale, list_scale, knife_a[i], c_white, 1, c_white, c_black);
									}
									draw_sprite_ext_t(s_knife_target2, 1, 640 + 200, global.height / 2, list_scale, list_scale, targetk_ang, c_white, 1, c_white, c_black);
									for(i = 1; i <= targetk_all; i ++)
									{
										draw_sprite_ext_t(s_knife_target, 0, 640 + 200 + lengthdir_x(sprite_get_width(s_knife_target2) / 2,targetk_v[targetk_n[i]] + targetk_ang), global.height / 2 + lengthdir_y(sprite_get_width(s_knife_target2) / 2,targetk_v[targetk_n[i]] + targetk_ang), list_scale, list_scale, targetk_ang + targetk_v[targetk_n[i]], c_white, 1, c_white, c_black);
									}
								#endregion
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
								test_y  = global.height / 2 - 60;
								pre_wait = 0;
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
								{
									for(dev = 0; dev < 5; dev ++)
									{
										mouse_x1 = device_mouse_x(dev);
										mouse_y1 = device_mouse_y(dev);
										if point_in_rectangle(mouse_x1, mouse_y1, test_x1 - 150, test_y - 100, test_x1 + 150, test_y + 100) && global.answer = -1
										{
											if mouse_check_button_pressed(mb_left)
											{
												if global.sound
												{
													audio_play_sound(sd_text, 2, 0);
												}
												global.answer = 1;
											}
										}
										if point_in_rectangle(mouse_x1, mouse_y1, test_x2 - 150, test_y - 100, test_x2 + 150, test_y + 100) && global.answer = -1
										{
											if mouse_check_button_pressed(mb_left)
											{
												if global.sound
												{
													audio_play_sound(sd_text, 2, 0);
												}
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
					{
						global.storm = 1;
						storm_1();
					}
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
								test_y   = global.height / 2 - 60;
								pre_wait = 0;
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev = 0; dev < 5; dev ++)
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
								test_y   = global.height / 2 - 60;
								pre_wait = 0;
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev = 0; dev < 5; dev ++)
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
								test_y   = global.height / 2 - 60;
								pre_wait = 0;
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev = 0; dev < 5; dev ++)
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
								test_y   = global.height / 2 - 60;
								pre_wait = 0;
							#endregion
							#region Ответ
								if global.cananswer && list_scale = 1 && global.super_ability = 0 && smile_open = 0
									{
									for(dev = 0; dev < 5; dev ++)
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
		#region Ответ при ПвП
			if global.pvp = 1
			{
				if global.now = 1
				{
					if global.answer != -1
					{
						global.bot_answer = global.answer;
						global.answer = -1;
					}
				}
			}
		#endregion
	#endregion
	#region Геймплей
		#region Таймер
			if (list_scale = 1) && pre_wait = 0 && (global.training = 0 or (global.training = 5 && global.training_question != 0))
			&& (global.pvp = 0 or (global.pvp = 1 && global.now = 0))
			{
				if timer > 0
				{
					#region Снижение времени таймера
						if theme_round[global.rounds] != -1 && theme_choose = 4 && global.super_ability = 0
						{
							timer -= 1; 
							global.bistra_time -= 1;
							if global.bistra_time >= room_speed * 3
							{
								global.bistra = 0;
							}
						}
					#endregion
				}
				else
				{
					#region Если игрок не успел ответить
						global.bistra_time = 0;
						if global.storm = 1
						{
							storm_1();
						}
						(global.player_object).answer = -1
						(global.player_object).stun = 1;
						if global.online
						{
							o_client.cl_stage[14] = 1; //o_client.cl_stage[1] = 14;
						}
						global.answer = 0;
						#region Скрипт темы/раунда/задачи
							if global.storm = 1
							{
								storm_1();
							}
							switch(theme_round[global.rounds])
							{
								case 1:
									script_execute(asset_get_index("cards_" + string(round_task[global.rounds,global.task])));
								break;
								case 2:
									script_execute(asset_get_index("bottles_" + string(round_task[global.rounds,global.task])));
								break;
								case 3:
									script_execute(asset_get_index("move_" + string(round_task[global.rounds,global.task])));
								break;
								case 4:
									script_execute(asset_get_index("attention_" + string(round_task[global.rounds,global.task])));
								break;
								case 5:
									script_execute(asset_get_index("shooting_" + string(round_task[global.rounds,global.task])));
								break;
								case 6:
									script_execute(asset_get_index("math_" + string(round_task[global.rounds,global.task])));
								break;
							}
							//global.question = 1;
						#endregion
					#endregion
				}
				#region Отрисовка полосы таймера
					if timer <= room_speed * 3
					{
						draw_set_color(c_white);
						draw_set_alpha(0.4 + 0.6 * timer / (3 * room_speed));
						draw_rectangle(640 - 200 * timer / (3 * room_speed), global.height / 2 - 20 - 5 + timer_y, 640 + 200 * timer / (3 * room_speed), global.height / 2 - 20 + 5 + timer_y, 0);
						draw_set_alpha(1);
					}
				#endregion
			}
		#endregion
		#region Игрок
			if global.answer != -1 && u_question <= 9
			{
				#region Запись ответа
					player_q[u_question,global.rounds] = global.answer;
					pre_wait = 1;
				#endregion
				#region Онлайн
					if global.online
					{
						o_client.answer[global.myid]   = global.answer;
						o_client.question[global.myid] = global.question;
						o_client.task[global.myid]     = global.task;
						o_client.hp[global.enid]       = e_hp;
						//if o_client.cl_stage[1] != 14
						//{
							o_client.cl_stage[7] = 1; //o_client.cl_stage[1] = 7;
						//}
					}
				#endregion
				#region Квесты
					for(i = 1; i <= 3; i ++)
					{
						if global.answer = 1
						{
							if global.quests_a[i] = 1
							{
								if global.quests_t[i] = 5 or global.quests_t[i] = 6
								or global.quests_t[i] = 7 or global.quests_t[i] = 8
								or global.quests_t[i] = 9 or global.quests_t[i] = 10
								&& theme_round[global.rounds] = global.quests_t[i] - 4
								{
									if global.quests_n_now[i] < global.quests_n_all[i]
									{
										global.quests_n_now[i] += 1;
									}
								}
								if global.quests_t[i] = 22 && global.bill_abil > 0
								{
									if global.quests_n_now[i] < global.quests_n_all[i]
									{
										global.quests_n_now[i] += 1;
									}
								}
								ini_open("Music.ini");
									ini_write_string("Qual", "qual_nno_" + string(i), string(global.quests_n_now[i]));
								ini_close();
							}
						}
					}
					if global.answer = 0
					{
						global.pralna = 0;
					}
				#endregion
				#region Сворачивание вопроса при ответе
					list_scale = 0;
					pre_wait   = 1;
				#endregion
				#region Зависимость вопроса и времени врага (и времени ответа бота)
					u_answer[u_question] = global.answer;
					if u_answer[u_question] > e_answer[u_question] && global.pvp = 0
					{
						if u_question > e_question
						{
							e_time[u_question] = (5 + 3 * global.e_totem_a[4] - 0) * room_speed;
						}
						if u_question = e_question
						{
							e_time[u_question] = (5 + 3 * global.e_totem_a[4] - 0) * room_speed;
							if bot_time2 > (5 + 3 * global.e_totem_a[4] - 2) * room_speed
							{
								bot_time2 = (5 + 3 * global.e_totem_a[4] - 0) * room_speed;
								bot_time = random(1) * room_speed;
							}
						}
					}
					//if u_answer[u_question] > e_answer[u_question] && global.pvp = 0
					//{
						//if u_question > e_question
						//{
						//	u_time[e_question] = (5 + 3 * global.p_totem_a[4]) * room_speed;
						//}
						//if u_question = e_question
						//{
						//	u_time[e_question] = (5 + 3 * global.p_totem_a[4]) * room_speed;
						//	if bot_time2 > (5 + 3 * global.e_totem_a[4]) * room_speed
						//	{
						//		bot_time2 = (5 + 3 * global.e_totem_a[4]) * room_speed;
						//		bot_time = random(1) * room_speed;
						//	}
						//}
					//}
					if global.training < 1
					{
						u_question += 1;
					}
				#endregion
				#region Надписи, говорящие о верности ответа
					if global.training < 1
					{
						if global.answer = 1
						{
							if os_get_language() = "ru"
							{
								global.training_gb = choose("ХОРОШО!", "ОТЛИЧНО!", "КРУТО!", "ИДЕАЛЬНО!");
							}
							else
							{
								global.training_gb = choose("GOOD!", "AWESOME", "PERFECT!", "EXELLENT");
							}
						}
						else
						{
							if os_get_language() = "ru"
								{
									global.training_gb = choose("ПРОМАХ", "ОШИБКА", "НЕУДАЧА", "НЕВЕЗУХА");
								}
								else
								{
									global.training_gb = choose("MISS", "FAULT", "GAFFE", "MISTAKE");
								}
						}
					}
				#endregion
				#region Эффект идола молнии
					var miss;
					miss = 0;
					if global.idol[3] = 4
					{
						if global.answer = 0 
						{
							global.anim[3,1] = 0;
						}
					}
				#endregion
				#region Эффект идола ветра
					if global.idol[2] = 4
					{
						var answ, may;
						answ = global.answer;
						may  = choose(0, 1);
						if global.online
						{
							may = real(string_copy(idol_wind[global.myid], 1, 1));
							idol_wind[global.myid] = string_delete(idol_wind[global.myid], 1, 1);
						}
						if may = 1
						{
							global.answer = !answ;
						}
						if answ != global.answer
						{
							global.anim[2,1] = 0;
						}
						#region Квест на идола
							for(i = 1; i <= 3; i ++)
							{
								if global.quests_a[i] = 1 && answ != global.answer && answ = 0
								{
									if global.quests_t[i] = 25
									{
										if global.quests_n_now[i] < global.quests_n_all[i]
										{
											global.quests_n_now[i] += 1;
										}
									}
									ini_open("Music.ini");
										ini_write_string("Qual", "qual_nno_" + string(i), string(global.quests_n_now[i]));
									ini_close();
								}
							}
						#endregion
					}
				#endregion
				#region Эффкт тотема врага (промах)
					if global.e_totem_a[9]
					{
						var chance;
						chance = irandom(99);
						if global.online
						{
							if real(string_copy(totem_ran_evasive[global.enid], 1, 1)) = 1
							{
								chance = 1;
							}
							else
							{
								chance = 7;
							}
							totem_ran_evasive[global.enid] = string_delete(totem_ran_evasive[global.enid], 1, 1);
						}
						if chance < 7
						{
							global.answer = 0;
							miss = 1;
							#region ПОКАЗ ТОТЕМА: Тотем уклонения
								totem_show_n[2] = 9;
							#endregion
						}
					}
				#endregion
				#region Эффект тотема игрока -врага (яд)
					//if global.p_totem_a[18] = 1
					//{
					//	if global.answer = 1
					//	{
					//		#region ПОКАЗ ТОТЕМА: Тотем стана
					//			if (global.player_object).have_posion != 1
					//			{
					//				totem_show_n[1] = 18;
					//			}
					//		#endregion
					//		(global.player_object).have_posion = 1;
					//	}
					//}
					//if global.e_totem_a[18] = 1
					//{
					//	if global.answer = 0
					//	{
					//		#region ПОКАЗ ТОТЕМА: Тотем стана
					//			if (global.enemy_object).have_posion != 1
					//			{
					//				totem_show_n[2] = 18;
					//			}
					//		#endregion
					//		(global.enemy_object).have_posion = 1;
					//	}
					//}
				#endregion
				#region ОТВЕТ ИГРОКА
					if global.answer = 1
					{
						#region Верный
							answer_rec = 1;
							answer_col = make_color_rgb(60, 179, 113);
							if global.hand = -1
							{
								if super_now != super_need
								{
									super_now += 1;
									part_n = -1;
									#region ПОКАЗ ТОТЕМА: Тотем супера
										if global.p_totem_a[15] = 1
										&& super_now = super_need
										{
											totem_show_n[1] = 15;
										}
									#endregion
								}
							}
							else
							{
								if global.hand = -1 or (global.hand = 1 && global.hero = 1) or (global.hand = 0 && global.hero != 1)
								{
									if super_now != super_need
									{
										super_now += 1;
										part_n = -1;
										#region ПОКАЗ ТОТЕМА: Тотем супера
											if global.p_totem_a[15] = 1
											&& super_now = super_need
											{
												totem_show_n[1] = 15;
											}
										#endregion
									}
								}
								else
								{
									if e_super_now != e_super_need
									{
										e_super_now += 1;
										part_n = -1;
										#region ПОКАЗ ТОТЕМА: Тотем супера
											if global.e_totem_a[15] = 1
											&& e_super_now = e_super_need
											{
												totem_show_n[2] = 15;
											}
										#endregion
									}
								}
							}
							if global.critical < 3 - 1 * global.p_totem_a[3]
							{
								#region ПОКАЗ ТОТЕМА: Тотем Крита
									if global.p_totem_a[3] = 1
									{
										totem_show_n[1] = 3;
									}
								#endregion
								#region ПОКАЗ ТОТЕМА: Тотем Крита 2
									if global.p_totem_a[5] = 1
									{
										totem_show_n[1] = 5;
									}
								#endregion
								global.critical += 1;
							}
						#endregion
					}
					else
					{
						#region Неверный
							answer_rec = 1;
							if miss = 0
							{
								answer_col = make_color_rgb(178, 34, 34);
							}
							else
							{
								answer_col = make_color_rgb(60, 179, 113);
							}
							global.critical = 0;
						#endregion
					}
				#endregion
				#region Рассчёт аккуратности
					accuracy_true += global.answer;
					accuracy_all  += 1;
				#endregion
				#region Запись ответа в task_question
					for(i = 1; i <= 6; i ++)
					{
						if task_question[global.task,i] = -1
						{
							if timer != 0
							{
								task_question[global.task,i] = global.answer;
							}
							else
							{
								task_question[global.task,i] = -2;
							}
							break;
						}
					}
				#endregion
				#region Проверка на номер вопроса и смена задачи
					if global.question < 3
					{
						#region Прибавление номера вопроса (и надпии для тренировки)
							if global.training < 1
							{
								global.question += 1;
							}
							else
							{
								if global.answer = 1
								{
									global.training_question += 1;
									if os_get_language() = "ru"
									{
										global.training_gb = choose("ХОРОШО!", "ОТЛИЧНО!", "КРУТО!", "ИДЕАЛЬНО!");
									}
									else
									{
										global.training_gb = choose("GOOD!", "AWESOME", "PERFECT!", "EXELLENT");
									}
								}
								else
								{
									if os_get_language() = "ru"
									{
										global.training_gb = choose("ПРОМАХ", "ОШИБКА", "НЕУДАЧА", "НЕВЕЗУХА");
									}
									else
									{
										global.training_gb = choose("MISS", "FAULT", "GAFFE", "MISTAKE");
									}
								}
							}
							if global.storm = 1
							{
								storm_1();
							}
						#endregion
					}
					else
					{
						#region Прибавление новой задачи и проверка
							if global.task < 3
							{
								#region Устанавливаем новую задачу
									#region Прибавляем задачу
										if global.pvp = 1
										{
											global.now = !global.now;
											part_n = 0;
											global.nex += 1;
											if global.nex = 2
											{
												global.nex = 0;
												global.task += 1;
												global.question = 1;
											}
											else
											{
												global.question = 1;
											}
											global.pvp_stop = 1;
										}
										else
										{
											global.task += 1;
										}
									#endregion
									#region Скрипт темы/раунда/задачи
										if global.storm = 1
										{
											storm_1();
										}
										switch(theme_round[global.rounds])
										{
											case 1:
												script_execute(asset_get_index("cards_" + string(round_task[global.rounds,global.task])));
											break;
											case 2:
												script_execute(asset_get_index("bottles_" + string(round_task[global.rounds,global.task])));
											break;
											case 3:
												script_execute(asset_get_index("move_" + string(round_task[global.rounds,global.task])));
											break;
											case 4:
												script_execute(asset_get_index("attention_" + string(round_task[global.rounds,global.task])));
											break;
											case 5:
												script_execute(asset_get_index("shooting_" + string(round_task[global.rounds,global.task])));
											break;
											case 6:
												script_execute(asset_get_index("math_" + string(round_task[global.rounds,global.task])));
											break;
										}
										global.question = 1;
									#endregion
								#endregion
							}
							else
							{
								if global.pvp = 0
								{
									#region Сворачивание вопроса, игрок ждёт соперника
										list_go = 0;
										list_scale = 0;
										plas_scale = 0;
									#endregion
								}
								else
								{
									#region Отвечает второй игрок
										global.now = !global.now;
										part_n = 0;
										global.nex += 1;
										list_scale = 0;
										#region Скрипт темы/раунда/задачи
											if global.storm = 1
											{
												storm_1();
											}
											switch(theme_round[global.rounds])
											{
												case 1:
													script_execute(asset_get_index("cards_" + string(round_task[global.rounds,global.task])));
												break;
												case 2:
													script_execute(asset_get_index("bottles_" + string(round_task[global.rounds,global.task])));
												break;
												case 3:
													script_execute(asset_get_index("move_" + string(round_task[global.rounds,global.task])));
												break;
												case 4:
													script_execute(asset_get_index("attention_" + string(round_task[global.rounds,global.task])));
												break;
												case 5:
													script_execute(asset_get_index("shooting_" + string(round_task[global.rounds,global.task])));
												break;
												case 6:
													script_execute(asset_get_index("math_" + string(round_task[global.rounds,global.task])));
												break;
											}
											global.question = 1;
										#endregion
										if global.nex = 2
										{
											global.nex = 0;
											list_go = 0;
											list_scale = 0;
											plas_scale = 0;
										}
										else
										{
											global.question = 1;
											global.pvp_stop = 1;
										}
									#endregion
								}
							}
						#endregion
					}
				#endregion
				#region Таймер
					if timer != 0
					{
						#region Анимация игрока (Старый код?)
							with(o_hero)
							{
								if !enemy
								{
									answer = global.answer;
									image_speed = spd_max + 0.5;
									if hero = 2
									{
										image_speed = spd_max;
									}
									if huntress_poison = 0
									{
										skeleton_animation_set("shoot");
									}
									else
									{
										if hero = 3
											{
												skeleton_animation_set("super");
											}
											else
											{
												skeleton_animation_set("shoot");
											}
									}
									change = 3;
								}
								else
								{
									if global.answer = 0 && !(skeleton_animation_get() = "super") && !(image_index <= 20 && skeleton_animation_get() = "shoot")
										{
											image_speed = spd_nor + 0.5;
											if !stun && global.super_ability = 0
											{
												skeleton_animation_set("miss");
											}
											change = 1;
										}
								}
							}
						#endregion
					}
					else
					{
						dop_i[0] = 2;
					}
					global.answer = -1;
					timer   = u_time[u_question];
					timer_x = timer;
				#endregion
			}
		#endregion
		#region Бот
			#region Время бота для ПвП
				if global.pvp = 1
				{
					bot_time = 100;
				}
			#endregion
			#region Время ответа, таймер, условия бота
				if (bot_go != 0 && e_question <= 9) && global.training < 1 && (global.pvp = 0 or (global.pvp = 1 && list_scale = 1)) && global.online = 0
				{
					if bot_time = -1
					{
						#region Установка времени ответа бота
							if global.pvp = 0
							{
								if e_time[e_question] > 3 * room_speed
								{
									if bot_type = 0
									{
										bot_time = random_range(1, 2.5) * room_speed + min_time[theme_round[global.rounds],round_task[global.rounds,global.task]];
									}
									if bot_type = 1
									{
										bot_time = random_range(0.25, 1.5) * room_speed + min_time[theme_round[global.rounds],round_task[global.rounds,global.task]];
									}
									if bot_type = 2
									{
										bot_time = random_range(1, 4) * room_speed + min_time[theme_round[global.rounds],round_task[global.rounds,global.task]];
									}
									if bot_type = 3
									{
										bot_time = random_range(1, 3) * room_speed + min_time[theme_round[global.rounds],round_task[global.rounds,global.task]];
									}
								}
								else
								{
									if bot_type = 0
									{
										bot_time = random_range(0, 1) * room_speed + min_time[theme_round[global.rounds],round_task[global.rounds,global.task]];
									}
									if bot_type = 1
									{
										bot_time = random_range(0, 0.2) * room_speed + min_time[theme_round[global.rounds],round_task[global.rounds,global.task]];
									}
									if bot_type = 2
									{
										bot_time = random_range(0.5, 2) * room_speed + min_time[theme_round[global.rounds],round_task[global.rounds,global.task]];
									}
									if bot_type = 3
									{
										bot_time = random_range(0, 1) * room_speed + min_time[theme_round[global.rounds],round_task[global.rounds,global.task]];
									}
								}
							}
							bot_time2 = e_time[e_question];
							bot_wait  = min_wait[theme_round[global.rounds],round_task[global.rounds,global.task]];
						#endregion
					}
					else
					{
						#region По окончании времени ответа, бот отвечает
							if bot_wait <= 0 && (global.enemy_object).stun = 0 && !global.super_ability
							&& global.pvp = 0
							{
								if bot_time > 0
								{
									bot_time -= 1;
								}
								else
								{
									if global.pvp = 0
									{
										if (global.enemy_object).shoot = 0 && (global.enemy_object).answer = -1
										{
											global.bot_answer = 0;
											if bot_type = 0
											{
												global.bot_answer = choose(1, 1, 0, 0, 0);
											}
											if bot_type = 1
											{
												global.bot_answer = choose(1, 0);
											}
											if bot_type = 2
											{
												global.bot_answer = choose(1, 1, 1, 1, 0);
											}
											if bot_type = 3
											{
												global.bot_answer = choose(1, 1, 1, 0);
											}
										}
									}
								}
							}
						#endregion
						#region Ожидание бота, убавление таймера бота и ПвП условия
							if global.bot_answer = -1 && (global.pvp = 0 or global.now = 1)
							{
								if bot_wait > 0
								{
									bot_wait -= 1;
								}
								else
								{
									if !global.super_ability && global.pvp = 1
									{
										if bot_time2 > 0
										{
											bot_time2 -= 1;
										}
										else
										{
											#region Скрипт темы/раунда/задачи
												if global.storm = 1
												{
													storm_1();
												}
												switch(theme_round[global.rounds])
												{
													case 1:
														script_execute(asset_get_index("cards_" + string(round_task[global.rounds,global.task])));
													break;
													case 2:
														script_execute(asset_get_index("bottles_" + string(round_task[global.rounds,global.task])));
													break;
													case 3:
														script_execute(asset_get_index("move_" + string(round_task[global.rounds,global.task])));
													break;
													case 4:
														script_execute(asset_get_index("attention_" + string(round_task[global.rounds,global.task])));
													break;
													case 5:
														script_execute(asset_get_index("shooting_" + string(round_task[global.rounds,global.task])));
													break;
													case 6:
														script_execute(asset_get_index("math_" + string(round_task[global.rounds,global.task])));
													break;
												}
												global.question = 1;
											#endregion
											(global.player_object).answer = -1
											(global.enemy_object).stun = 1;
											global.bot_answer = 0;
										}
										if bot_time2 <= room_speed * 3
										{
											#region Отрисвка таймера при ПвП
												draw_set_color(c_white);
												draw_set_alpha(0.4 + 0.6 * bot_time2 / (3 * room_speed));
												draw_rectangle(640 - 200 * bot_time2 / (3 * room_speed), global.height / 2 - 20 - 5 + timer_y, 640 + 200 * bot_time2 / (3 * room_speed), global.height / 2 - 20 + 5 + timer_y, 0);
												draw_set_alpha(1);
											#endregion
										}
									}
								}
							}
						#endregion
					}
				}
			#endregion
			#region Границы таймера и суперспособности
				if bot_time > 10 * room_speed
				{
					bot_time = 10 * room_speed;
				}
				if bot_time2 > 8 * room_speed
				{
					bot_time = 8 * room_speed;
				}
				if bot_wait > room_speed * 8
				{
					bot_wait = room_speed * 8;
				}
				if e_super_now1 < e_super_now
				{
					e_super_now1 += 1 / room_speed;
				}
				if e_super_now = 0
				{
					e_super_now1 = 0;
				}
			#endregion
			#region Суперспособность бота
			if global.hand = -1 && (global.online = 0 or enemy_super = 1)
			{
				if (e_super_now = e_super_need && e_super_now1 >= e_super_need && theme_choose = 4 && global.e_abilitican = 1 && (global.enemy_object).stun = 0 && global.training < 1) or (enemy_super = 1)
				{
					if (((((e_hp - atk) / e_maxhp <= hp / maxhp ) && global.enemy_hero != 5)
					or (global.enemy_hero = 5 && (global.enemy_object).bill_stage != 0)
					or global.swipe_ability = 1 or (global.enemy_hero = 2)
					or (global.enemy_hero = 1 && global.swipe_ability = 0 && super_now = super_need)
					&& (bot_type = 2 or bot_type = 3)
					or (global.enemy_hero = 1 && global.swipe_ability = 0) && (bot_type = 1 or bot_type = 2))
					&& (global.enemy_object).hand_away = 0 && (global.player_object).hand_away = 0) or (enemy_super = 1)
					{
						if (global.super_ability = 0 && (global.player_object).answer = -1 && (global.enemy_object).answer = -1 && (global.player_object).shoot = 0 && (global.enemy_object).shoot = 0
						&& (global.pvp = 0 or (global.pvp = 1 && pvp_super_popa = 1))) or (enemy_super = 1)
						{
							#region Суперспособность
								if enemy_super = 1
								{
									enemy_super = 0;
								}
								if pvp_super_popa = 1
								{
									pvp_super_popa = 0;
								}
								e_super_now  = 0;
								e_super_need += 3;
								global.super_ability = 1;
								with(global.enemy_object)
								{
									change = 3;
									super  = 1;
									if global.swipe_ability = 0
									{
										#region Если способность не украдена
											switch(global.enemy_hero)
											{
												case 1:
													o_list.e_super_need = 3 - global.e_totem_a[15];
													skeleton_animation_set("super");
													change = 1;
												break;
												case 2:
													super = 1;
													image_speed = spd_max;
													skeleton_animation_set("shoot");
													change = 3;
												break;
												case 6:
													abil_x = 160;
													skeleton_animation_set("super");
													change = 3;
												break;
												case 4:
													skeleton_animation_set("super");
													diego_dynamit = 1;
													change = 3;
												break;
												case 3:
													change = 1;
													skeleton_animation_set("reload");
													huntress_poison = 1;
												break;
												case 5:
													super = 1;
													image_speed = spd_max;
													skeleton_animation_set("shoot");
													change = 1;
												break;
												case 7:
													super = 1;
													image_index = 0;
													image_speed = spd_max;
													skeleton_animation_set("greetings");
													change = 2;
												break;
											}
										#endregion
									}
									else
									{
										if global.enemy_hero != 1
										{
											#region Возвравщение себе способности
												change = 1;
												skeleton_animation_set("reload"); 
												global.super_ability = 1;
												hand_away = room_speed;
												o_list.super_now1 = 0;
												var enemy_now, enemy_need, player_now, player_need;
												enemy_now  = o_list.e_super_now;
												enemy_need = o_list.e_super_need;
												player_now  = o_list.super_now;
												player_need = o_list.super_need;
												o_list.super_now  = 0;
												o_list.super_need = 3 - global.p_totem_a[15];
												o_list.e_super_now  = player_now;
												o_list.e_super_need = player_need;
											#endregion
										}
										else
										{
											#region Использоване суперспособности противника
												switch(global.hero)
													{
													case 1:
														image_speed = spd_max;
														skeleton_animation_set("super");
														change = 1;
														o_list.e_super_need = 3 - global.e_totem_a[15]; break;
													case 2:
														image_speed = spd_max;
														skeleton_animation_set("shoot");
														change = 3;
													break;
													case 3:
														change = 1;
														skeleton_animation_set("reload");
														huntress_poison = 1;
													break;
													case 4:
														skeleton_animation_set("super");
														diego_dynamit = 1;
														change = 3;
													break;
													case 5:
														image_speed = spd_max;
														skeleton_animation_set("super");
														change = 3;
													break;
													case 6:
														abil_x = 160;
														skeleton_animation_set("shoot");
														change = 3;
													break;
													case 7:
														change = 1;
														skeleton_animation_set("super");
													break;
													}
											#endregion
										}
									}
								}
								global.ability_dop_anim = 1;
							#endregion
						}
					}
				}
			}
			#endregion
		#endregion
		#region Враг
			if global.bot_answer != -1 && bot_go != 0 && e_question <= 9
			{
				#region Запись ответа
					enemy_q[e_question,global.rounds] = global.bot_answer;
				#endregion
				#region Вероятность неверного ответа для низкого ранга
					if (global.player_rank = 15 or global.player_rank = 14) && global.pvp = 0 && global.online = 0
					{
						var trtt;
						trtt = choose(1, 0, 0);
						if trtt = 1
						{
							global.bot_answer = 0;
						}
					}
				#endregion
				#region Вероятность неверного ответа при ульте Била
					if global.bill_abil > 0 && global.pvp = 0 && global.online = 0
					{
						if irandom(9) != 0
						{
							global.bot_answer = 0;
						}
					}
				#endregion
				#region Зависимость вопроса и времени игрока
					e_answer[e_question] = global.bot_answer;
					if e_answer[e_question] > u_answer[e_question] && global.pvp = 0
					{
						if e_question > u_question
						{
							u_time[e_question] = (5 + 3 * global.p_totem_a[4] - 0) * room_speed;
						}
						if e_question = u_question
						{
							if timer > (5 + 3 * global.p_totem_a[4] - 2) * room_speed
							{
								timer = (5 + 3 * global.p_totem_a[4] - 0) * room_speed;
							}
						}
					}
					e_question += 1;
				#endregion
				#region ПвП, сворачивание вопроса
					if global.pvp = 1
					{
						list_scale = 0;
						#region Скрипт темы/раунда/задачи
							if global.storm = 1
							{
								storm_1();
							}
							switch(theme_round[global.rounds])
							{
								case 1:
									script_execute(asset_get_index("cards_" + string(round_task[global.rounds,global.task])));
								break;
								case 2:
									script_execute(asset_get_index("bottles_" + string(round_task[global.rounds,global.task])));
								break;
								case 3:
									script_execute(asset_get_index("move_" + string(round_task[global.rounds,global.task])));
								break;
								case 4:
									script_execute(asset_get_index("attention_" + string(round_task[global.rounds,global.task])));
								break;
								case 5:
									script_execute(asset_get_index("shooting_" + string(round_task[global.rounds,global.task])));
								break;
								case 6:
									script_execute(asset_get_index("math_" + string(round_task[global.rounds,global.task])));
								break;
							}
							global.question = 1;
						#endregion
					}
				#endregion
				#region Эффект идола молнии
					if global.idol[3] = 4
					{
						if global.bot_answer = 0 
						{
							global.anim[3,0] = 0;
						}
					}
				#endregion
				#region Эффект идола ветра
					if global.idol[2] = 4
					{
						var answ, may;
						answ = global.bot_answer;
						may = choose(0, 1);
						if may = 1
						{
							global.bot_answer = !answ;
						}
						if answ != global.bot_answer
						{
							global.anim[2,0] = 0;
						}
					}
				#endregion
				#region Эффект тотема игрока (промах)
					if global.p_totem_a[9]
					{
						var chance;
						chance = irandom(99);
						if global.online
						{
							if real(string_copy(totem_ran_evasive[global.myid], 1, 1)) = 1
							{
								chance = 1;
							}
							else
							{
								chance = 7;
							}
							totem_ran_evasive[global.myid] = string_delete(totem_ran_evasive[global.myid], 1, 1);
						}
						if chance < 7
						{
							global.bot_answer = 0;
							#region ПОКАЗ ТОТЕМА: Тотем уклонения
								totem_show_n[1] = 9;
							#endregion
						}
					}
				#endregion
				#region Эффект тотема игрока (яд)
					if global.e_totem_a[18] = 1
					{
						if global.bot_answer = 1
						{
							#region ПОКАЗ ТОТЕМА: Тотем стана
								if (global.enemy_object).have_posion != 1
								{
									totem_show_n[2] = 18;
								}
							#endregion
							(global.enemy_object).have_posion = 1;
						}
					} 
					//if global.p_totem_a[18] = 1
					//{
					//	if global.bot_answer = 0
					//	{
					//		#region ПОКАЗ ТОТЕМА: Тотем стана
					//			if (global.player_object).have_posion != 1
					//			{
					//				totem_show_n[1] = 18;
					//			}
					//		#endregion
					//		(global.player_object).have_posion = 1;
					//	}
					//}
				#endregion
				#region ОТВЕТ ВРАГА
					if global.bot_answer = 1
					{
						if global.hand = -1
						{
							if e_super_now < e_super_need
							{
								e_super_now += 1;
								#region ПОКАЗ ТОТЕМА: Тотем супера
									if global.e_totem_a[15] = 1
									&& e_super_now = e_super_need
									{
										totem_show_n[2] = 15;
									}
								#endregion
							}
						}
						else
						{
							if global.hand = -1 or (global.hand = 0 && global.enemy_hero = 1) or (global.hand = 1 && global.hero = 1)
							{
								if e_super_now < e_super_need
								{
									e_super_now += 1;
									#region ПОКАЗ ТОТЕМА: Тотем супера
										if global.e_totem_a[15] = 1
										&& e_super_now = e_super_need
										{
											totem_show_n[2] = 15;
										}
									#endregion
								}
							}
							else
							{
								if super_now < super_need
								{
									super_now += 1;
									#region ПОКАЗ ТОТЕМА: Тотем супера
										if global.p_totem_a[15] = 1
										&& super_now = super_need
										{
											totem_show_n[1] = 15;
										}
									#endregion
								}
							}
						}
						if global.e_critical < 3 - 1 * global.e_totem_a[3]
						{
							#region ПОКАЗ ТОТЕМА: Тотем Крита
								if global.e_totem_a[3] = 1
								{
									totem_show_n[2] = 3;
								}
							#endregion
							#region ПОКАЗ ТОТЕМА: Тотем Крита 2
								if global.e_totem_a[5] = 1
								{
									totem_show_n[2] = 5;
								}
							#endregion
							global.e_critical += 1;
						}
					}
					else
					{
						global.e_critical = 0;
					}
				#endregion
				#region Завись ответа в task_question
					for(i = 1; i <= 6; i ++)
					{
						if task_question[bot_task,i] = -1
						{
							if bot_time2 != 0
							{
								task_question[bot_task,i] = 2 + global.bot_answer;
							}
							else
							{
								task_question[bot_task,i] = -2;
							}
							break;
						}
					}
				#endregion
				#region Новый вопрос и задача у врага
					if bot_question < 3
						{
							bot_question += 1;
						}
						else
						{
							#region Проверка новой задачи прибавление
								if global.online = 0
								{
									if bot_task < 3
									{
										#region Прибавление задачи и Установка новой задачи в случае ПвП
											if global.pvp = 1
											{
												global.now = !global.now;
												list_scale = 0;
												#region Скрипт темы/раунда/задачи
													if global.storm = 1
													{
														storm_1();
													}
													switch(theme_round[global.rounds])
													{
														case 1:
															script_execute(asset_get_index("cards_" + string(round_task[global.rounds,global.task])));
														break;
														case 2:
															script_execute(asset_get_index("bottles_" + string(round_task[global.rounds,global.task])));
														break;
														case 3:
															script_execute(asset_get_index("move_" + string(round_task[global.rounds,global.task])));
														break;
														case 4:
															script_execute(asset_get_index("attention_" + string(round_task[global.rounds,global.task])));
														break;
														case 5:
															script_execute(asset_get_index("shooting_" + string(round_task[global.rounds,global.task])));
														break;
														case 6:
															script_execute(asset_get_index("math_" + string(round_task[global.rounds,global.task])));
														break;
													}
													global.question = 1;
												#endregion
												part_n = 0;
												global.nex += 1;
												if global.nex = 2
												{
													global.nex = 0;
													bot_task += 1;
													global.task += 1;
													global.question = 1;
												}
												else
												{
													global.question = 1;
												}
												global.pvp_stop = 1;
											}
											else
											{
												bot_task += 1;
											}
											bot_question = 1;
										#endregion
									}
									else
									{
										if global.pvp = 0
										{
											#region Враг закончил овечать
												bot_time2 = -2;
												bot_time  = -2;
												bot_go    = 0;
											#endregion
										}
										else
										{
											#region В случае ПвП овтечает игрок или заканчиваем раунд
												global.now = !global.now;
												part_n = 0;
												global.nex += 1;
												if global.nex = 2
												{
													global.nex = 0;
													list_go = 0;
													list_scale = 0;
													plas_scale = 0;
												}
												else
												{
													global.question = 1;
													global.pvp_stop = 1;
												}
											#endregion
										}
									}
								}
							#endregion
						}
				#endregion
				#region Таймер
					if bot_time2 != 0
					{
						#region Старый код
							with(o_hero)
							{
								if enemy
								{
									answer = global.bot_answer;
									image_speed = spd_max + 0.5;
									if hero = 2
									{
										image_speed = spd_max;
									}
									skeleton_animation_set("shoot");
									change = 3;
								}
								else
								{
									if global.bot_answer = 0 && !(skeleton_animation_get() = "super") && !(image_index <= 20 && skeleton_animation_get() = "shoot")
									{
										image_speed = spd_nor + 0.5;
										if !stun && global.super_ability = 0
										{
											skeleton_animation_set("miss");
										}
										change = 1;
									}
								}
							}
						#endregion
					}
					global.bot_answer = -1;
					if bot_go != 0
					{
						bot_time2 = e_time[e_question];
					}
					bot_time = -1;
				#endregion
			}
		#endregion
		#region Конец раунда
			#region Переменная сраки
				global.sraka = 0;
				with(o_hero)
				{
					if skeleton_animation_get() != "idle"
					{
						global.sraka = 1;
					}
				}
			#endregion
			#region Конец раунда
				if global.online // && o_client.cl_stage[1] = 0
				{
					if global.training < 1 && ((u_question >= 10 && (global.player_object).answer = -1 && global.sraka = 0 && ((global.player_object).diego_dynamit = 0 or (global.player_object).diego_dynamit = 1) && global.super_ability = 0) or floor(hp) < 1 or floor(e_hp) < 1)
					&& theme_choose != 5  && theme_choose != 6 && theme_choose != 9
					{
						if player_end[global.myid] = 0
						{
							o_list.pepa += "P1 "; //pepa += "1 ";
							player_end[global.myid] = 1; //player_end[global.myid] = 2; //player_end[global.myid] = 1;
							if player_end[global.enid] = 0
							{
								o_list.pepa += "P1.1 "; //pepa += "2 ";
								faster_id = global.myid;
							}
							o_client.cl_stage[8] = 1; //o_client.cl_stage[1] = 8;
						}
					}
				}
				if (global.training < 1 && ((u_question >= 10 && e_question >= 10 && (global.player_object).answer = -1 && (global.enemy_object).answer = -1 && global.sraka = 0) or floor(hp) < 1 or floor(e_hp) < 1 or (global.online = 1 && (player_end[1] = 1 && player_end[2] = 1)))
				&& theme_choose != 5  && theme_choose != 6 && theme_choose != 9 && global.super_ability = 0 && ((global.player_object).diego_dynamit = 0 or (global.player_object).diego_dynamit = 1)
				&& ((global.enemy_object).diego_dynamit = 0 or (global.enemy_object).diego_dynamit = 1))// && (global.player_object).shoot = 0  && (global.enemy_object).shoot = 0// && global.sraka = 0
				{
					if (global.online = 0 or (global.online = 1 && ((player_end[1] = 1 && player_end[2] = 1) or floor(hp) < 1 or floor(e_hp) < 1)))
					{
						o_list.pepa += "P2 "; //o_list.pepa += "6 ";
						#region Результат раунда в зависимости от хп игроков
							if round(100 * hp / maxhp) > round(100 * e_hp / e_maxhp)
							{
								roundskul[global.rounds] = 1;
							}
							else
							{
								roundskul[global.rounds] = 2;
							}
							if abs((100 * hp / maxhp) - (100 * e_hp / e_maxhp)) < 1
							{
								if global.online
								{
									if faster_id = global.myid
									{
										roundskul[global.rounds] = 1;
									}
									else
									{
										roundskul[global.rounds] = 2;
									}  // Раунд окончен
								//o_client.cl_stage[11] = 1; //o_client.cl_stage[1] = 11;
								}
								else
								{
									if u_time[9] > e_time[9]
									{
										roundskul[global.rounds] = 1;
									}
									else
									{
										roundskul[global.rounds] = 2;
									}  // Раунд окончен
								}
							//o_client.cl_stage[1] = 11;
							}
						#endregion
						#region Обнуление переменных U
							for(i = 1; i <= 10; i ++)
							{
								u_answer[i] = -1;
								e_answer[i] = -1;
								u_time[i] = (5 + 3 * global.p_totem_a[4]) * room_speed;
								e_time[i] = (5 + 3 * global.e_totem_a[4]) * room_speed;
							}
						#endregion
						#region Обнуление плашек и прочих переменных
							bot_time2 = e_time[u_question];
							timer     = u_time[u_question];
							u_question = 1;
							e_question = 1;
							global.sraka = 0; // Никто не атакует
							list_go = 0;
							list_scale = 0;
							plas_scale = 0;
						#endregion		
						#region Обнуление переменных бота и шторм
							bot_go       = 1; //0; //1
							bot_question = 1;
							bot_task     = 1;
							bot_time     = -1;
							bot_time2    = (5 + 3 * global.e_totem_a[4]) * e_time[1];
							global.task  = 1;
						#endregion
						#region Скрипт темы/раунда/задачи
							if global.storm = 1
							{
								storm_1();
							}
							switch(theme_round[global.rounds])
							{
								case 1:
									script_execute(asset_get_index("cards_" + string(round_task[global.rounds,global.task])));
								break;
								case 2:
									script_execute(asset_get_index("bottles_" + string(round_task[global.rounds,global.task])));
								break;
								case 3:
									script_execute(asset_get_index("move_" + string(round_task[global.rounds,global.task])));
								break;
								case 4:
									script_execute(asset_get_index("attention_" + string(round_task[global.rounds,global.task])));
								break;
								case 5:
									script_execute(asset_get_index("shooting_" + string(round_task[global.rounds,global.task])));
								break;
								case 6:
									script_execute(asset_get_index("math_" + string(round_task[global.rounds,global.task])));
								break;
							}
							global.question = 1;
						#endregion
						#region Стадия игры, вопрос и задача
							global.question = 1;
							global.task = 1;
							global.game_stage = 4;
						#endregion			
						#region Обнуление переменных текста раунда
							round_text1_x = 1450;
							round_3_x     = 1450;
							round_2_x     = 1450;
							round_1_x     = 1450;
							round_0_x     = 1450;
							round_alpha   = 1;
						#endregion
						#region Обнуление переменных ответов
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
						#endregion
						#region Переменные победителя и смена стадии ?????
							if (roundskul[1] = 1 &&  roundskul[2] = 1) or (roundskul[1] = 1 &&  roundskul[3] = 1)  or (roundskul[2] = 1 &&  roundskul[3] = 1)
							{
								theme_choose = 9;
								whowin = 1;
							}
							if (roundskul[1] = 2 &&  roundskul[2] = 2) or (roundskul[1] = 2 &&  roundskul[3] = 2)  or (roundskul[2] = 2 &&  roundskul[3] = 2)
							{
								theme_choose = 9;
								whowin = 2;
							}
							//if global.rounds < 3
							//{
							//	global.rounds += 1;
							//}
							//PEPA
							
							//if global.online
							//{
							//	player_end[1] = 0;
							//	player_end[2] = 0;
							//}
							if global.online && whowin != 0
							{
								o_list.pepa += "P2.1 ";
								o_client.cl_stage[12] = 1; //o_client.cl_stage[1] = 12;
							}
							theme_choose = 5;
						#endregion
					}
				}
			#endregion
		#endregion
	#endregion
	#region ПвП
		if global.pvp_stop != 0
		{
			#region Тёмный экран
				draw_set_alpha(0.45);
				draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
				draw_set_alpha(1);
			#endregion
			#region Цвет
				var ccc, xxx;
				if global.now = 0
				{
					xxx = -360;
					ccc = global.color_hero[global.hero];
				}
				else
				{
					xxx = 360;
					ccc = global.color_hero[global.enemy_hero];
				}
			#endregion
			#region Текст
				draw_text_transformed_t(640 + xxx, global.height + 50 - (global.height / 2 + 50) * pvp_scale - 25, coin_you[!global.now], 0.3, 0.3, -40 + 55 * pvp_scale, ccc, c_black);
				if os_get_language() = "ru"
				{
					draw_text_transformed_t(640, global.height + 50 - (global.height / 2 + 50) * pvp_scale - 200, "ТВОЙ ХОД", 0.3, 0.3, -40 + 45 * pvp_scale, global.color_white, c_black);
				}
				else
				{
					draw_text_transformed_t(640, global.height + 50 - (global.height / 2 + 50) * pvp_scale - 200, "YOU TURN", 0.3, 0.3, -40 + 45 * pvp_scale, global.color_white, c_black);
				}
			#endregion
			#region Анимация руки на супере
				if hand_i < 10
				{
					hand_i += 0.4;
				}
				else
				{
					hand_i = 0;
				}
				draw_sprite_ext(s_training_hand, hand_i, 640 + xxx * 0.8, global.height + 50 - (global.height / 2 + 50) * pvp_scale + 100, 1, 1, 0, c_black, 0.5);
				draw_sprite_ext_t(s_training_hand, hand_i, 640 + xxx * 0.8, global.height + 50 - (global.height / 2 + 50) * pvp_scale + 100, 1, 1, 0, global.color_white, 1, global.color_white, c_black);
			#endregion
			#region Стадии региона
				list_go = 0;
				if mouse_check_button_pressed(mb_left) && pvp_scale = 1
				{
					pvp_stage = 1;
				}
				if pvp_stage = 0
				{
					if pvp_scale < 1
					{
						pvp_scale += 0.2;
					}
				}
				else
				{
					if pvp_scale > 0
					{
						pvp_scale -= 0.2;
					}
					else
					{
						pvp_stage = 0;
						list_go = 1;
						global.pvp_stop = 0;
					}
				}
			#endregion
		}
#endregion
#endregion
#region Способность
	#region Нажатие на супер
		for(dev = 0; dev < 5; dev ++)
		{
			#region Координата по горизонтали
				var pvp_xx;
				pvp_xx = 0;
				if global.pvp = 1
				{
					if global.now = 0
					{
						pvp_xx = - (640 * 2 - 80 - sprite_get_width(s_super) / 2);
					}
					else
					{
						pvp_xx = 0;
					}
				}
			#endregion
			#region Координаты мыши
				mouse_x1 = device_mouse_x(dev);
				mouse_y1 = device_mouse_y(dev);
			#endregion
			#region Суперудар, нажатие
				if device_mouse_check_button_pressed(dev, mb_left) && theme_choose = 4 && (global.player_object).stun = 0 && global.abilitican = 1 && (global.training < 1 or global.training = 6) && global.pvp_stop = 0
				{
					if point_in_rectangle(mouse_x1, mouse_y1, 640 * 2 - 80 - sprite_get_width(s_super) / 2 + pvp_xx, global.height - 50 - 80 + super_zhopa - 20, 640 * 2 + 80 - sprite_get_width(s_super) / 2 + pvp_xx, global.height - 50 + 80 + super_zhopa - 20)
					{
						if global.pvp = 0 or (global.pvp = 1 && global.now = 0)
						{
							#region Звук клика
								if global.sound = 1
								{
									audio_play_sound(sd_text, 2, 0);
								}
							#endregion
							if super_now = super_need
							&& global.super_ability = 0
							&& (global.player_object).answer = -1// && (global.enemy_object).answer = -1
							//&& (global.player_object).shoot = 0 && (global.enemy_object).shoot = 0
							&& !(global.hero = 1 && global.enemy_hero = 1)
							{
								//super_ii += "1-";
								if global.online
								{
									go_super = 1;
									//super_ii += "2-";
								}
								trigger = 1;
								#region Квесты
									for(i = 1; i <= 3; i ++)
									{
										if global.quests_a[i] = 1
										{
											if global.quests_t[i] = 17
											{
												if global.quests_n_now[i] < global.quests_n_all[i]
												{
													global.quests_n_now[i] += 1;
												}
											}
											ini_open("Music.ini");
												ini_write_string("Qual", "qual_nno_" + string(i), string(global.quests_n_now[i]));
											ini_close();
										}
									}
									global.spasabnast = 1;
								#endregion
								#region Переменные супера
									super_now  = 0;
									super_need += 3;
									super_now1 = super_need;
									global.super_ability = 1;
								#endregion
								#region Действие суперудара
									with(global.player_object)
									{
										change = 3;
										super  = 1;
										if global.swipe_ability = 0
										{
											#region Обычный суперудар
												#region Действие суперудара персонажа
													switch(global.hero)
													{
														case 1:
															o_list.super_need = 3 - global.p_totem_a[15];
															o_list.super_now1 = 3;
															skeleton_animation_set("super");
															change = 1;
														break;
														case 2:
															super = 1;
															image_speed = spd_max;
															skeleton_animation_set("shoot");
															change = 3;
														break;
														case 6:
															abil_x = 160;
															skeleton_animation_set("super");
															change = 3;
														break;
														case 4:
															skeleton_animation_set("super");
															diego_dynamit = 1;
															change = 3;
														break;
														case 3:
															change = 1;
															skeleton_animation_set("reaload");
															huntress_poison = 1;
														break;
														case 5:
															super = 1;
															image_speed = spd_max;
															skeleton_animation_set("shoot");
															change = 1;
															//o_list.super_ii += "3-";
														break;
														case 7:
															super = 1;
															image_index = 0;
															image_speed = spd_max;
															skeleton_animation_set("greetings");
															change = 2;
														break;
													}
												#endregion
												#region Квест на супер Воришки
													if global.enemy_hero != 1
													{
														if global.hero = 1
														{
															ini_open("Music.ini");
															ini_write_string("Var", "v" + string(global.enemy_hero), "1");
															global.varr[global.enemy_hero] = ini_read_real("Var", "v" + string(global.enemy_hero), 0);
															for(i = 1; i <= 3; i ++)
															{
																if global.quests_a[i] = 1
																{
																	if global.quests_t[i] = 18
																	{
																		if global.quests_n_now[i] < global.quests_n_all[i]
																		{
																			global.quests_n_now[i] += 1;
																		}
																	}
																	ini_write_string("Qual", "qual_nno_" + string(i), string(global.quests_n_now[i]));
																}
																ini_write_string("Qual", "qual_nno_" + string(i), string(global.quests_n_now[i]));
															}
															ini_close();
														}
													}
												#endregion
											#endregion
										}
										else
										{
											if global.hero != 1
											{
												#region Возвращение себе суперспособности
													change = 6; skeleton_animation_set("reload"); 
													global.super_ability = 1;
													hand_away = room_speed;
													o_list.super_now1 = 0;
													var enemy_now, enemy_need, player_now, player_need;
													enemy_now   = o_list.e_super_now;
													enemy_need  = o_list.e_super_need;
													player_now  = o_list.super_now;
													player_need = o_list.super_need;
													o_list.super_now  = enemy_now;
													o_list.super_need = enemy_need;
													o_list.e_super_now  = 0;
													o_list.e_super_need = 3 - global.e_totem_a[15];
												#endregion
											}
											else
											{
												#region Использование чужой способности
													switch(global.enemy_hero)
													{
														case 1:
															image_speed = spd_max;
															skeleton_animation_set("super");
															change = 1;
															o_list.super_need = 3 - global.p_totem_a[15];
															o_list.super_now1 = 3;
														break;
														case 2:
															image_speed = spd_max;
															skeleton_animation_set("shoot");
															change = 3;
														break;
														case 3:
															change = 1;
															skeleton_animation_set("reload");
															huntress_poison = 1;
														break;
														case 4:
															skeleton_animation_set("super");
															diego_dynamit = 1;
															change = 3;
														break;
														case 5:
															image_speed = spd_max;
															skeleton_animation_set("super");
															change = 3; 
														break;
														case 6:
															abil_x = 160;
															skeleton_animation_set("shoot");
															change = 3;
														break;
														case 7:
															change = 1;
															skeleton_animation_set("super");
														break;
													}
												#endregion
											}
										}
									}
								#endregion
								#region Очистка состояния мыши и анимация
									global.ability_dop_anim = 1;
									io_clear();
								#endregion
							}
						}
						else
						{
							pvp_super_popa = 1;
						}
					}
				}
			#endregion
		}
	#endregion
	#region Кнопка суперудара
		if global.pvp = 0 or global.now = 0
		{
			#region Кнопка суперудара игрока
				#region Цвет кнопки
					var butcolor;
					butcolor = global.color_hero[global.hero];
					if global.hand = -1
					{
						if global.swipe_ability = 0
						{
							butcolor = global.color_hero[global.hero];
						}
						else
						{
							butcolor = global.color_hero[global.enemy_hero];
						}
					}
					else
					{
						if (global.hand = 0 && global.hero = 1)
						{
							butcolor = global.color_hero[global.enemy_hero];
						}
					}
				#endregion
				#region Пацанкод (кнопка супера)
					if global.hand = -1
					{
						#region Эффект вокруг кнопки
							if part_n = 1
							{
								if part_y < global.height - 10
								{
									part_y += part_yspd;
								}
								if abs(part_x - (global.width) * super_now1 / super_need) > 10
								{
									part_x -= sign(part_x - (global.width) * super_now1 / super_need) * part_xspd;
								}
								else
								{
									if part_y >= global.height - 10
									{
										part_n = 0;
									}
								}
							}
							if part_n = 2
							{
								if part_s > 0
								{
									part_s -= 0.25;
								}
								else
								{
									part_n = 0;
								}
							}
						#endregion
						#region Отрисовка кнопки
							if global.pvp = 0
							{
								if global.swipe_ability = 0
								{
									if part_n > 0
									{
										draw_sprite_ext_t(s_super, global.hero + 1, part_x + part_xspd * sign(part_x - (global.width) * super_now1 / super_need) * 2, part_y - part_yspd * 2, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
										draw_sprite_ext_t(s_super, global.hero + 1, part_x + part_xspd * sign(part_x - (global.width) * super_now1 / super_need), part_y - part_yspd, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
										draw_sprite_ext_t(s_super, global.hero + 1, part_x, part_y, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
									}
								}
								else
								{
									if part_n > 0
									{
										draw_sprite_ext_t(s_super, global.enemy_hero + 1, part_x + part_xspd * sign(part_x - (global.width) * super_now1 / super_need) * 2, part_y - part_yspd * 2, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
										draw_sprite_ext_t(s_super, global.enemy_hero + 1, part_x + part_xspd * sign(part_x - (global.width) * super_now1 / super_need), part_y - part_yspd, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
										draw_sprite_ext_t(s_super, global.enemy_hero + 1, part_x, part_y, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
									}
								}
							}
						#endregion
						#region Заполнение полоски супера
							if part_n = 0
							{
								if super_now <= super_need
								{
									if super_now1 < super_now
									{
										super_now1 += 0.025 * super_need;
									}
									if super_now = 0
									{
										if super_now1 > 0
										{
											super_now1 -= 0.025 * super_need;
										}
										else
										{
											super_now1 = 0;
										}
									}
								}
							}
						#endregion
					}
				#endregion
				#region Заполнение полоки супера, доступность кнопки
					var d_size;
					d_size = 0.05;
					if global.hand = -1
					{
						if super_now = super_need
						{
							if super_now1 = super_need
							{
								#region Кнопка выезжает и трясётся
									if super_zhopa > 0
									{
										super_zhopa -= 40;
										super_angle = 0;
									}
									else
									{
										if super_time < 40
										{
											super_time += 1;
											if abs(super_angle) > 1.5
											{
												super_angle += 2 * super_dir;
											}
											else
											{
												super_angle = 0;
											}
										}
										else
										{
											if (super_angle < 5 && super_dir = 1) or (super_angle > -5 && super_dir = -1)
											{
												super_angle += 2 * super_dir;
											}
											else
											{
												super_dir = -super_dir;
												super_angle += 2 * super_dir;
												super_val += 1;
												if super_val = 5
												{
													super_time = 0;
													super_val = 0;
												}
											}
										}
									}
								#endregion
							}
						}
						else
						{
							#region Обнуление, кнопка уезжает
								super_val = 0;
								super_angle = 0;
								if super_zhopa < 300
								{
									super_zhopa += 30;
								}
							#endregion
						}
						#region Кнопка доступна
							if super_now = super_need
							{
								if super_alp1 = 1
								{
									if super_alp > 0.2
									{
										super_alp -= 0.05;
									}
									else
									{
										super_alp1 = 0;
									}
								}
								else
								{
									if super_alp < 1
									{
										super_alp += 0.05;
									}
									else
									{
										if super_alpha > 0
										{
											super_alpha -= 0.05;
										}
										else
										{
											super_alpha = 1;
											super_alp = 0.2;
											super_alp1 = 1;
										}
									}
								}
							}
							else
							{
								super_alp1 = 1;
								super_alp = 1;
							}
						#endregion
					}
				#endregion
				#region Обводка
					draw_set_alpha(0.7);
					draw_rectangle_color(0, global.height, global.width, global.height - 13, c_black, c_black, c_black, c_black, 0);
				#endregion
				#region Рисование прямоугольника супера
					if global.hand = -1
					{
						if super_now = super_need
						{
							draw_set_alpha(0.5 * super_alpha);
							draw_rectangle_color(0, global.height, (global.width) * super_now1 / super_need, global.height - 11 - super_alp * 4 * 8, butcolor, butcolor, butcolor, butcolor, 0);
							draw_set_alpha(0.3 * super_alpha);
							draw_rectangle_color(0, global.height, (global.width) * super_now1 / super_need, global.height - 11 - super_alp * 2 * 6, butcolor, butcolor, butcolor, butcolor, 0);
						}
						draw_set_alpha(1);
						draw_rectangle_color(0, global.height, (global.width) * super_now1 / super_need, global.height - 11, butcolor, butcolor, butcolor, butcolor, 0);
						draw_set_alpha(0.2);
						draw_rectangle_color(0, global.height, (global.width) * super_now1 / super_need, global.height - 3, c_black, c_black, c_black, c_black, 0);
						draw_set_alpha(1);
						draw_set_alpha(1 - super_alp);
						draw_rectangle_color(0, global.height, (global.width) * super_now1 / super_need, global.height - 11, c_white, c_white, c_white, c_white, 0);
						draw_set_alpha(1);
					}
				#endregion
				#region Рисование текста "СУПЕР"
					draw_set_font(global.game_font);
					draw_text_transformed_t(640 * 2 - sprite_get_width(s_super) - string_width(super_text) * 0.2 / 2 + 20 + pvp_xx / 1.5, global.height - 50 - 20 + super_zhopa, super_text, 0.2, 0.2, super_angle, butcolor, c_black);
				#endregion
				#region Отрисовка значка супера
					if global.swipe_ability = 0
					{
						draw_sprite_ext_t(s_super, 0, 640 * 2 - sprite_get_width(s_super) / 2 + pvp_xx/* - 20*/, global.height - 50 - 20 + super_zhopa + 8, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, butcolor, 0.5, butcolor, c_black);
						draw_sprite_ext_t(s_super, 0, 640 * 2 - sprite_get_width(s_super) / 2 + pvp_xx/* - 20*/, global.height - 50 - 20 + super_zhopa, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, butcolor, 1, butcolor, c_black);
						draw_sprite_ext_t(s_super, global.hero + 1, 640 * 2 - sprite_get_width(s_super) / 2 + pvp_xx, global.height - 50 - 20 + super_zhopa + 8, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_white, 0.5, global.color_white, c_black);
						draw_sprite_ext_t(s_super, global.hero + 1, 640 * 2 - sprite_get_width(s_super) / 2 + pvp_xx, global.height - 50 - 20 + super_zhopa, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_white, 1, global.color_white, c_black);
					}
					else
					{
						draw_sprite_ext_t(s_super, 0, 640 * 2 - sprite_get_width(s_super) / 2 + pvp_xx/* - 20*/, global.height - 50 - 20 + super_zhopa + 8, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_hero[global.enemy_hero], 0.5, global.color_hero[global.enemy_hero], c_black);
						draw_sprite_ext_t(s_super, 0, 640 * 2 - sprite_get_width(s_super) / 2 + pvp_xx/* - 20*/, global.height - 50 - 20 + super_zhopa, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_hero[global.enemy_hero], 1, global.color_hero[global.enemy_hero], c_black);
						draw_sprite_ext_t(s_super, global.enemy_hero + 1, 640 * 2 - sprite_get_width(s_super) / 2 + pvp_xx, global.height - 50 - 20 + super_zhopa + 8, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_white, 0., global.color_white, c_black);
						draw_sprite_ext_t(s_super, global.enemy_hero + 1, 640 * 2 - sprite_get_width(s_super) / 2 + pvp_xx, global.height - 50 - 20 + super_zhopa, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_white, 1, global.color_white, c_black);
					}
				#endregion
			#endregion
		}
		else
		{
			#region Кнопка суперудара врага
				#region Цвет кнопки
					var butcolor;
					butcolor = global.color_hero[global.hero];
					if global.hand = -1
					{
						if global.swipe_ability = 0
						{
							butcolor = global.color_hero[global.enemy_hero];
						}
						else
						{
							butcolor = global.color_hero[global.hero];
						}
					}
					else
					{
						if (global.hand = 0 && global.enemy_hero = 1)
						{
							butcolor = global.color_hero[global.hero];
						}
					}
				#endregion
				#region Пацанкод (кнопка супера)
					if global.hand = -1
					{
						#region Эффект вокруг кнопки
							if part_n = 1
							{
								if part_y < global.height - 10
								{
									part_y += part_yspd;
								}
								if abs(part_x - (global.width) * e_super_now1 / e_super_need) > 10
								{
									part_x -= sign(part_x - (global.width) * e_super_now1 / e_super_need) * part_xspd;
								}
								else
								{
									if part_y >= global.height - 10
									{
										part_n = 0;
									}
								}
							}
							if part_n = 2
							{
								if part_s > 0
								{
									part_s -= 0.25;
								}
								else
								{
									part_n = 0;
								}
							}
						#endregion
						#region Отрисовка кнопки
							if global.pvp = 0
							{
								if global.swipe_ability = 0
								{
									if part_n > 0
									{
										draw_sprite_ext_t(s_super, global.hero + 1, part_x + part_xspd * sign(part_x - (global.width) * e_super_now1 / e_super_need) * 2, part_y - part_yspd * 2, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
										draw_sprite_ext_t(s_super, global.hero + 1, part_x + part_xspd * sign(part_x - (global.width) * e_super_now1 / e_super_need), part_y - part_yspd, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
										draw_sprite_ext_t(s_super, global.hero + 1, part_x, part_y, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
									}
								}
								else
								{
									if part_n > 0
									{
										draw_sprite_ext_t(s_super, global.enemy_hero + 1, part_x + part_xspd * sign(part_x - (global.width) * e_super_now1 / e_super_need) * 2, part_y - part_yspd * 2, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
										draw_sprite_ext_t(s_super, global.enemy_hero + 1, part_x + part_xspd * sign(part_x - (global.width) * e_super_now1 / e_super_need), part_y - part_yspd, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
										draw_sprite_ext_t(s_super, global.enemy_hero + 1, part_x, part_y, 0.3 * part_s, 0.3 * part_s, 0, butcolor, 1, butcolor, c_black);
									}
								}
							}
						#endregion
						#region Заполнение полоски супера
							if part_n = 0
							{
								if e_super_now <= e_super_need
								{
									if e_super_now1 < e_super_now
									{
										e_super_now1 += 0.025 * e_super_need;
									}
									if e_super_now = 0
									{
										if e_super_now1 > 0
										{
											e_super_now1 -= 0.025 * e_super_need;
										}
										else
										{
											e_super_now1 = 0;
										}
									}
								}
							}
						#endregion
					}
				#endregion
				#region Заполнение полоки супера, доступность кнопки
					var d_size;
					d_size = 0.05;
					if global.hand = -1
					{
						if e_super_now >= e_super_need
						{
							if e_super_now1 >= e_super_need
							{
								#region Кнопка выезжает и трясётся
									if super_zhopa > 0
									{
										super_zhopa -= 40;
										super_angle = 0;
									}
									else
									{
										if super_time < 40
										{
											super_time += 1;
											if abs(super_angle) > 1.5
											{
												super_angle += 2 * super_dir;
											}
											else
											{
												super_angle = 0;
											}
										}
										else
										{
											if (super_angle < 5 && super_dir = 1) or (super_angle > -5 && super_dir = -1)
											{
												super_angle += 2 * super_dir;
											}
											else
											{
												super_dir = -super_dir;
												super_angle += 2 * super_dir;
												super_val += 1;
												if super_val = 5
												{
													super_time = 0;
													super_val = 0;
												}
											}
										}
									}
								#endregion
							}
						}
						else
						{
							#region Обнуление, когда кнопка выезжает
								super_val = 0;
								super_angle = 0;
								if super_zhopa < 300
								{
									super_zhopa += 30;
								}
							#endregion
						}
						#region Кнопка доступна
							if e_super_now = e_super_need
							{
								if super_alp1 = 1
								{
									if super_alp > 0.2
									{
										super_alp -= 0.05;
									}
									else
									{
										super_alp1 = 0;
									}
								}
								else
								{
									if super_alp < 1
									{
										super_alp += 0.05;
									}
									else
									{
										if super_alpha > 0
										{
											super_alpha -= 0.05;
										}
										else
										{
											super_alpha = 1;
											super_alp = 0.2;
											super_alp1 = 1;
										}
									}
								}
							}
							else
							{
								super_alp1 = 1;
								super_alp = 1;
							}
						#endregion
					}
				#endregion
				#region Обводка
					draw_set_alpha(0.7);
					draw_rectangle_color(0, global.height, global.width, global.height - 13, c_black, c_black, c_black, c_black, 0);
				#endregion
				#region Рисование прямоугольника супера
					if global.hand = -1
					{
						if e_super_now = e_super_need
						{
							draw_set_alpha(0.5 * super_alpha);
							draw_rectangle_color(0, global.height, (global.width) * e_super_now1 / e_super_need, global.height - 11 - super_alp * 4 * 8, butcolor, butcolor, butcolor, butcolor, 0);
							draw_set_alpha(0.3 * super_alpha);
							draw_rectangle_color(0, global.height, (global.width) * e_super_now1 / e_super_need, global.height - 11 - super_alp * 2 * 6, butcolor, butcolor, butcolor, butcolor, 0);
						}
						draw_set_alpha(1);
						draw_rectangle_color(0, global.height, (global.width) * e_super_now1 / e_super_need, global.height - 11, butcolor, butcolor, butcolor, butcolor, 0);
						draw_set_alpha(0.2);
						draw_rectangle_color(0, global.height, (global.width) * e_super_now1 / e_super_need, global.height - 3, c_black, c_black, c_black, c_black, 0);
						draw_set_alpha(1);
						draw_set_alpha(1 - super_alp);
						draw_rectangle_color(0, global.height, (global.width) * e_super_now1 / e_super_need, global.height - 11, c_white, c_white, c_white, c_white, 0);
						draw_set_alpha(1);
					}
				#endregion
				#region Рисование текста "СУПЕР"
					draw_set_font(global.game_font);
					draw_text_transformed_t(640 * 2 - sprite_get_width(s_super) - string_width(super_text) * 0.2 / 2 + 20 + pvp_xx / 1.5, global.height - 50 - 20 + super_zhopa, super_text, 0.2, 0.2, super_angle, butcolor, c_black);
				#endregion
				#region Отрисовка значка супера
					if global.swipe_ability = 0
					{
						draw_sprite_ext_t(s_super, 0, 640 * 2 - sprite_get_width(s_super) / 2 + pvp_xx/* - 20*/, global.height - 50 - 20 + super_zhopa + 8, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_hero[global.enemy_hero], 0.5, butcolor, c_black);
						draw_sprite_ext_t(s_super, 0, 640 * 2 - sprite_get_width(s_super) / 2 + pvp_xx/* - 20*/, global.height - 50 - 20 + super_zhopa, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_hero[global.enemy_hero], 1, butcolor, c_black);
						draw_sprite_ext_t(s_super, global.enemy_hero + 1, 640 * 2 - sprite_get_width(s_super) / 2 + pvp_xx, global.height - 50 - 20 + super_zhopa + 8, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_white, 0.5, global.color_white, c_black);
						draw_sprite_ext_t(s_super, global.enemy_hero + 1, 640 * 2 - sprite_get_width(s_super) / 2 + pvp_xx, global.height - 50 - 20 + super_zhopa, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_white, 1, global.color_white, c_black);
					}
					else
					{
						draw_sprite_ext_t(s_super, 0, 640 * 2 - sprite_get_width(s_super) / 2 + pvp_xx/* - 20*/, global.height - 50 - 20 + super_zhopa + 8, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_hero[global.hero], 0.5, global.color_hero[global.hero], c_black);
						draw_sprite_ext_t(s_super, 0, 640 * 2 - sprite_get_width(s_super) / 2 + pvp_xx/* - 20*/, global.height - 50 - 20 + super_zhopa, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_hero[global.hero], 1, global.color_hero[global.hero], c_black);
						draw_sprite_ext_t(s_super, global.hero + 1, 640 * 2 - sprite_get_width(s_super) / 2 + pvp_xx, global.height - 50 - 20 + super_zhopa + 8, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_white, 0., global.color_white, c_black);
						draw_sprite_ext_t(s_super, global.hero + 1, 640 * 2 - sprite_get_width(s_super) / 2 + pvp_xx, global.height - 50 - 20 + super_zhopa, list_size1 * 1 + d_size, list_size1 * 1 + d_size, super_angle, global.color_white, 1, global.color_white, c_black);
					}
				#endregion
			#endregion
		}
	#endregion
	#region Особые суперспособности персонажей
		#region Способность Шерифа
			#region Отрисовка мишени игрока
				if global.hero = 6 && (global.player_object).super = 1
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
						draw_sprite_ext(s_abil_thing_sherif, 0, abil_x, global.height / 2 - 50 + abil_y, abil_s, abil_s, 0, c_white, 1);
						if abil_x >= 1100 
						{
							global.ability_dop_anim = 3;
						}
					}
					if global.ability_dop_anim = 3
					{
						if abil_s < 1
						{
							abil_s += 0.1;
						}
						else
						{
							if abil_a >= 180
							{
								global.ability_dop_anim = 4;
							}
						}
						if abil_s = 1
						{
							abil_a += 20 * abil_s;
						}
						draw_sprite_ext(s_abil_thing_sherif, 0, abil_x, global.height / 2 - 50 + abil_y, abil_s, abil_s, abil_a, c_white, 1);
					}
					if global.ability_dop_anim = 4
					{
						draw_sprite_ext(s_abil_thing_sherif, 0, abil_x, global.height / 2 - 50 + abil_y, abil_s, abil_s, abil_a, c_white, 1);
						if abil_s > 0
						{
							abil_s -= 0.15;
						}
						else
						{
							abil_x = 160;
							abil_y = y - 200;
							abil_s = 0.5;
							abil_a = 0;
							global.ability_dop_anim = 0;
							(global.player_object).super = 0;
							global.super_ability = 0;
						}
						abil_a += 10;
					}
				}
			#endregion
			#region Отрисовка мишени врага
				if global.enemy_hero = 6 && (global.enemy_object).super = 1
				{
					if global.ability_dop_anim = 1
					{
						abil_x = global.width - 160;
						abil_y = y;
						global.ability_dop_anim = 2
					}
					if global.ability_dop_anim = 2
					{
						abil_x -= 40;
						abil_y = cos(abil_x / 100) * 100;
						draw_sprite_ext(s_abil_thing_sherif, 0, abil_x, global.height / 2 - 50 + abil_y, abil_s, abil_s, 0, c_white, 1);
						if abil_x <= 160
						{
							global.ability_dop_anim = 3;
						}
					}
					if global.ability_dop_anim = 3
					{
						if abil_s < 1
						{
							abil_s += 0.1;
						}
						else
						{
							if abil_a >= 180
							{
								global.ability_dop_anim = 4;
							}
						}
						if abil_s = 1
						{
							abil_a += 20 * abil_s;
						}
						draw_sprite_ext(s_abil_thing_sherif, 0, abil_x, global.height / 2 - 50 + abil_y, abil_s, abil_s, abil_a, c_white, 1);
					}
					if global.ability_dop_anim = 4
					{
						draw_sprite_ext(s_abil_thing_sherif, 0, abil_x, global.height / 2 - 50 + abil_y, abil_s, abil_s, abil_a, c_white, 1);
						if abil_s > 0
						{
							abil_s -= 0.15;
						}
						else
						{
							abil_x = global.width - 160;
							abil_y = y - 200;
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
		#endregion
		#region Способность Билла
			if global.bill_abil > 0 && theme_choose = 4
			{
				if global.bill_abil_a < 0.98
				{
					global.bill_abil_a += 0.04;
				}
				else
				{
					global.bill_abil_a = 0.98;
				}
				global.bill_abil -= 1;
			}
			if global.bill_abil <= 0 or theme_choose != 4
			{
				if global.bill_abil_a > 0
				{
					global.bill_abil_a -= 0.04;
				}
				else
				{
					global.bill_abil_a = 0;
				}
				global.bill_abil = 0;
			}
			draw_set_alpha(global.bill_abil_a);
			draw_circle_color(640, global.height / 2, 1400 * global.bill_abil_a, global.color_white, global.color_white, 0);
			draw_set_alpha(1);
		#endregion
	#endregion
#endregion
#region Тотемы
	if global.game_stage = 0.5
	&& (global.online = 0 or (global.online = 1/* && global.enemy_name != "-"*/ && nameg_need = 0))
	{
		#region Временные переменные
			var txx, tss, pcc;
			txx = 640;
			tss = 0.3;
			pcc = 1;
		#endregion
		#region Появление тотемов
			if global.tot = 0
			{
				if totem_x < 0
				{
					totem_x += 30;
				}
				else
				{
					global.tot = 1;
				}
			}
		#endregion
		#region Эффект тотемов
			if global.tot < 7 && global.tot != -1
			{
				if global.tot < 3
				{
					i = 1;
				}
				if global.tot >= 3 && global.tot < 5
				{
					i = 2;
				}
				if global.tot >= 5
				{
					i = 3;
				}
				totem_txt   = "";
				totem_txt_i = -1;
				for(tt = 1; tt <= 6; tt ++)
				{
					#region Игрок
						if ((global.tot = 1 or global.tot = 3 or global.tot = 5 or global.tot = 1.5 or global.tot = 3.5 or global.tot = 5.5) && totem_first = 1)
						or ((global.tot = 2 or global.tot = 4 or global.tot = 6 or global.tot = 2.5 or global.tot = 4.5 or global.tot = 6.5) && totem_first = 0)
						{
							if global.tot = tt
							{
								if global.p_totem[i] = -1
								{
									global.tot += 0.5;
									totem_time = 20;
								}
								else
								{
									if i = 1 or i = 2 or i = 3
									{
										if global.p_totem[i] <= 6
										{
											pcc = c_white;
										}
										if global.p_totem[i] > 6 && global.p_totem[i] <= 11
										{
											pcc = c_aqua;
										}
										if global.p_totem[i] > 11 && global.p_totem[i] <= 15
										{
											pcc = c_fuchsia;
										}
										if global.p_totem[i] > 15
										{
											pcc = c_orange;
										}
										totem_txt_i = global.p_totem[i];
										totem_txt = global.totem_name[global.p_totem[i]];
									}
								}
								totem_pa[i] = 0;
								if totem_ps[i] < 1.15
								{
									totem_ps[i] += 0.03;
								}
								else
								{
									if totem_time  = 0
									{
										if global.p_totem[i] = 17
										{
											if global.online
											{
												for(t1 = 1; t1 <= 3; t1 ++)
												{
													totemus_pig[t1,global.myid]     = real(string_copy(totem_ran_pig[global.myid], 1, 1));
													totemus_pig_num[t1,global.myid] = real(string_copy(totem_ran_pig_num[global.myid], 1, 1));
													totem_ran_pig[global.myid]      = string_delete(totem_ran_pig[global.myid], 1, 1);
													totem_ran_pig_num[global.myid]  = string_delete(totem_ran_pig_num[global.myid], 1, 1);
													global.p_totem[t1] = totemus_pig_num[t1,global.myid] + totemus_pig[t1,global.myid];
													totemus_pig[t1,global.enid]     = real(string_copy(totem_ran_pig[global.enid], 1, 1));
													totemus_pig_num[t1,global.enid] = real(string_copy(totem_ran_pig_num[global.enid], 1, 1));
													totem_ran_pig[global.enid]      = string_delete(totem_ran_pig[global.enid], 1, 1);
													totem_ran_pig_num[global.enid]  = string_delete(totem_ran_pig_num[global.enid], 1, 1);
													global.e_totem[t1] = totemus_pig_num[t1,global.enid] + totemus_pig[t1,global.enid];
												}
											}
											else
											{
												#region Случайные тотемы Врага
													if global.e_totem[1] != -1 && global.e_totem[2] = -1 && global.e_totem[3] = -1
													{
														global.e_totem[1] = irandom_range(1, 18);
													}
													if global.e_totem[1] != -1 && global.e_totem[2] != -1 && global.e_totem[3] = -1
													{
														global.e_totem[1] = irandom_range(1, 18);
														if global.e_totem[1] != 1
														{
															global.e_totem[2] = irandom_range(1, global.e_totem[1]);
														}
														else
														{
															global.e_totem[2] = irandom_range(2, 18);
														}
													}
													if global.e_totem[1] != -1 && global.e_totem[2] != -1 && global.e_totem[3] != -1
													{
														global.e_totem[1] = irandom_range(1, 18);
														if global.e_totem[1] != 1
														{
															global.e_totem[2] = irandom_range(1, global.e_totem[1]);
															if global.e_totem[2] != 1
															{
																global.e_totem[3] = irandom_range(1, global.e_totem[2]);
															}
															else
															{
																global.e_totem[3] = irandom_range(2, global.e_totem[1]);
															}
														}
														else
														{
															global.e_totem[2] = irandom_range(2, 18); 
															if global.e_totem[2] != 2
															{
																global.e_totem[3] = irandom_range(2, global.e_totem[2]);
															}
															else
															{
																global.e_totem[3] = irandom_range(3, 18);
															}
														}
													}
												#endregion
												#region Случайные тотемы Игрока
												if global.p_totem[1] != -1 && global.p_totem[2] = -1 && global.p_totem[3] = -1
												{
													global.p_totem[1] = irandom_range(1, 18);
												}
												if global.p_totem[1] != -1 && global.p_totem[2] != -1 && global.p_totem[3] = -1
												{
													global.p_totem[1] = irandom_range(1, 18);
													if global.p_totem[1] != 1
													{
														global.p_totem[2] = irandom_range(1, global.p_totem[1]);
													}
													else
													{
														global.p_totem[2] = irandom_range(2, 18);
													}
												}
												if global.p_totem[1] != -1 && global.p_totem[2] != -1 && global.p_totem[3] != -1
												{
													global.p_totem[1] = irandom_range(1, 18);
													if global.p_totem[1] != 1
													{
														global.p_totem[2] = irandom_range(1, global.p_totem[1]);
														if global.p_totem[2] != 1
														{
															global.p_totem[3] = irandom_range(1, global.p_totem[2]);
														}
														else
														{
															global.p_totem[3] = irandom_range(2, global.p_totem[1]);
														}
													}
													else
													{
														global.p_totem[2] = irandom_range(2, 18); 
														if global.p_totem[2] != 2
														{
															global.p_totem[3] = irandom_range(2, global.p_totem[2]);
														}
														else
														{
															global.p_totem[3] = irandom_range(3, 18);
														}
													}
												}
											#endregion
											}
											totem_ps[i] = 0.8;
										}
										else
										{
											#region Эффекты тотемов
												if global.p_totem[i] = 10
												{
													if global.online
													{
														var totemus, totemus_num;
														totemus     = real(string_copy(totem_ran_frog[global.myid], 1, 1));
														totemus_num = real(string_copy(totem_ran_frog_num[global.myid], 1, 1));
														totem_ran_frog[global.myid]     = string_delete(totem_ran_frog[global.myid], 1, 1);
														totem_ran_frog_num[global.myid] = string_delete(totem_ran_frog_num[global.myid], 1, 1);
														global.p_totem[i] = totemus_num + totemus;
													}
													else
													{
														global.p_totem[i] = choose(irandom_range(1,9), irandom_range(11,18));
													}
													totem_ps[i] = 0.8;
												}
												else
												{
													if global.p_totem[i] = 16
													{
														if global.e_totem[1] != -1
														{
															var en_tot, en_tot_online;
															en_tot = 1;
															en_tot_online = 1;
															
															if global.online
															{
																en_tot_online = real(string_copy(totem_ran_rat[global.myid], 1, 1));
																totem_ran_rat[global.myid] = string_delete(totem_ran_rat[global.myid], 1, 1);
															}
															
															if global.e_totem[2] != -1
															{
																if global.online
																{
																	if en_tot_online = 3
																	{
																		en_tot = 1;
																	}
																	else
																	{
																		en_tot = en_tot_online;
																	}
																}
																else
																{
																	en_tot = choose(1, 2);
																}
															}
															if global.e_totem[3] != -1
															{
																if global.online
																{
																	en_tot = en_tot_online;
																}
																else
																{
																	en_tot = choose(3, 2, 1);
																}
															}
															global.p_totem[i] = global.e_totem[en_tot];
															global.e_totem[en_tot] = 19;
															totem_ps[i] = 0.8;
														}
														else
														{
															totem_ps[i] = 1;
															global.tot += 0.5;
														}
													}
													else
													{
														if global.p_totem[i] = 11
														{
															global.tot = 8;
														}
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
															{
																global.e_totem_a[7] = 0;
															}
															if global.p_totem[i] = 4
															{
																u_time[i] = (5 + 3 * global.p_totem_a[4]) * room_speed;
																timer = u_time[i];
															}
															global.tot += 0.5;
														}
													}
												}
											#endregion
										}
										totem_time = 20;
										if global.sound
										{
											audio_play_sound(sd_text, 2, 0);
										}
									}
									else
									{
										totem_time -= 1;
									}
								}
							}
							if global.tot = tt + 0.5
							{
								if totem_ps[i] > 1
								{
									totem_ps[i] -= 0.03;
								}
								else
								{
									global.tot += 0.5;
								}
							}
						}
					#endregion
					#region Враг
						if ((global.tot = 1 or global.tot = 3 or global.tot = 5 or global.tot = 1.5 or global.tot = 3.5 or global.tot = 5.5) && totem_first = 0)
						or ((global.tot = 2 or global.tot = 4 or global.tot = 6 or global.tot = 2.5 or global.tot = 4.5 or global.tot = 6.5) && totem_first = 1)
						{
							if global.e_totem[i] = -1
							{
								global.tot += 0.5;
								totem_time = 20;
							}
							else
							{
								#region Цвет и имя тотема
									if i = 1 or i = 2 or i = 3
									{
										if global.e_totem[i] <= 6
										{
											pcc = c_white;
										}
										if global.e_totem[i] > 6 && global.e_totem[i] <= 11
										{
											pcc = c_aqua;
										}
										if global.e_totem[i] > 11 && global.e_totem[i] <= 15
										{
											pcc = c_fuchsia;
										}
										if global.e_totem[i] > 15
										{
											pcc = c_orange;
										}
										totem_txt_i = global.e_totem[i];
										totem_txt = global.totem_name[global.e_totem[i]];
									}
								#endregion
							}
							if global.e_totem[i] = -1
							{
								global.tot += 0.5;
								totem_time = 20;
							}
							if global.tot = tt
							{
								totem_ea[i] = 0;
								if totem_es[i] < 1.15
								{
									totem_es[i] += 0.03;
								}
								else
								{
									if totem_time  = 0
									{
										#region Код тотемов
											if global.e_totem[i] = 17
											{
												if 0
												{
													#region Случайные тотемы Врага
														if global.enemy_level <= 4
														{
															global.e_totem[3] = irandom_range(1, 18);
															global.e_totem[1] = -1;
															global.e_totem[2] = -1;
														}
														if global.enemy_level > 4 && global.enemy_level < 7
														{
															var toi;
															global.e_totem[3] = irandom_range(1, 18);
															if global.e_totem[3] != 1
															{
																global.e_totem[2] = irandom_range(1, global.e_totem[3]);
															}
															else
															{
																global.e_totem[2] = irandom_range(2, 18);
															}
															global.e_totem[1] = -1;
														}
														if global.enemy_level >= 7
														{
															var toi;
															global.e_totem[3] = irandom_range(1, 18);
															if global.e_totem[3] != 1
															{
																global.e_totem[2] = irandom_range(1, global.e_totem[3]);
																if global.e_totem[2] != 1
																{
																	global.e_totem[1] = irandom_range(1, global.e_totem[2]);
																}
																else
																{
																	global.e_totem[1] = irandom_range(2, global.e_totem[3]);
																}
															}
															else
															{
																global.e_totem[2] = irandom_range(2, 18); 
																if global.e_totem[2] != 2
																{
																	global.e_totem[1] = irandom_range(2, global.e_totem[2]);
																}
																else
																{
																	global.e_totem[1] = irandom_range(3, 18);
																}
															}
														}
													#endregion
												}
												if global.online
												{
													for(t1 = 1; t1 <= 3; t1 ++)
													{
														totemus_pig[t1,global.myid]     = real(string_copy(totem_ran_pig[global.myid], 1, 1));
														totemus_pig_num[t1,global.myid] = real(string_copy(totem_ran_pig_num[global.myid], 1, 1));
														totem_ran_pig[global.myid]      = string_delete(totem_ran_pig[global.myid], 1, 1);
														totem_ran_pig_num[global.myid]  = string_delete(totem_ran_pig_num[global.myid], 1, 1);
														global.p_totem[t1] = totemus_pig_num[t1,global.myid] + totemus_pig[t1,global.myid];
														totemus_pig[t1,global.enid]     = real(string_copy(totem_ran_pig[global.enid], 1, 1));
														totemus_pig_num[t1,global.enid] = real(string_copy(totem_ran_pig_num[global.enid], 1, 1));
														totem_ran_pig[global.enid]      = string_delete(totem_ran_pig[global.enid], 1, 1);
														totem_ran_pig_num[global.enid]  = string_delete(totem_ran_pig_num[global.enid], 1, 1);
														global.e_totem[t1] = totemus_pig_num[t1,global.enid] + totemus_pig[t1,global.enid];
													}
												}
												else
												{
													#region Случайные тотемы Врага
														if global.e_totem[1] != -1 && global.e_totem[2] = -1 && global.e_totem[3] = -1
														{
															global.e_totem[1] = irandom_range(1, 18);
														}
														if global.e_totem[1] != -1 && global.e_totem[2] != -1 && global.e_totem[3] = -1
														{
															global.e_totem[1] = irandom_range(1, 18);
															if global.e_totem[1] != 1
															{
																global.e_totem[2] = irandom_range(1, global.e_totem[1]);
															}
															else
															{
																global.e_totem[2] = irandom_range(2, 18);
															}
														}
														if global.e_totem[1] != -1 && global.e_totem[2] != -1 && global.e_totem[3] != -1
														{
															global.e_totem[1] = irandom_range(1, 18);
															if global.e_totem[1] != 1
															{
																global.e_totem[2] = irandom_range(1, global.e_totem[1]);
																if global.e_totem[2] != 1
																{
																	global.e_totem[3] = irandom_range(1, global.e_totem[2]);
																}
																else
																{
																	global.e_totem[3] = irandom_range(2, global.e_totem[1]);
																}
															}
																else
															{
																global.e_totem[2] = irandom_range(2, 18); 
																if global.e_totem[2] != 2
																{
																	global.e_totem[3] = irandom_range(2, global.e_totem[2]);
																}
																else
																{
																	global.e_totem[3] = irandom_range(3, 18);
																}
															}
														}
													#endregion
													#region Случайные тотемы Игрока
													if global.p_totem[1] != -1 && global.p_totem[2] = -1 && global.p_totem[3] = -1
													{
														global.p_totem[1] = irandom_range(1, 18);
													}
													if global.p_totem[1] != -1 && global.p_totem[2] != -1 && global.p_totem[3] = -1
													{
														global.p_totem[1] = irandom_range(1, 18);
														if global.p_totem[1] != 1
														{
															global.p_totem[2] = irandom_range(1, global.p_totem[1]);
														}
														else
														{
															global.p_totem[2] = irandom_range(2, 18);
														}
													}
													if global.p_totem[1] != -1 && global.p_totem[2] != -1 && global.p_totem[3] != -1
													{
														global.p_totem[1] = irandom_range(1, 18);
														if global.p_totem[1] != 1
														{
															global.p_totem[2] = irandom_range(1, global.p_totem[1]);
															if global.p_totem[2] != 1
																{
																	global.p_totem[3] = irandom_range(1, global.p_totem[2]);
																}
																else
																{
																	global.p_totem[3] = irandom_range(2, global.p_totem[1]);
																}
														}
														else
														{
															global.p_totem[2] = irandom_range(2, 18); 
															if global.p_totem[2] != 2
															{
																global.p_totem[3] = irandom_range(2, global.p_totem[2]);
															}
															else
															{
																global.p_totem[3] = irandom_range(3, 18);
															}
														}
													}
												#endregion
												}
												totem_es[i] = 0.8;
											}
											else
											{
												#region Эффект тотемов
													if global.e_totem[i] = 10
													{
														if global.online
														{
															var totemus, totemus_num;
															totemus     = real(string_copy(totem_ran_frog[global.enid], 1, 1));
															totemus_num = real(string_copy(totem_ran_frog_num[global.enid], 1, 1));
															totem_ran_frog[global.enid]     = string_delete(totem_ran_frog[global.enid], 1, 1);
															totem_ran_frog_num[global.enid] = string_delete(totem_ran_frog_num[global.enid], 1, 1);
															global.e_totem[i] = totemus_num + totemus;
														}
														else
														{
															global.e_totem[i] = choose(irandom_range(1,9), irandom_range(11,18));
														}
														totem_es[i] = 0.8;
													}
													else
													{
														if global.e_totem[i] = 16
														{
															if global.p_totem[2] != -1
															{
																var pn_tot, pn_tot_online;
																pn_tot = 1;
																pn_tot_online = 1;
																if global.online
																{
																	pn_tot_online = real(string_copy(totem_ran_rat[global.enid], 1, 1));
																	totem_ran_rat[global.enid] = string_delete(totem_ran_rat[global.enid], 1, 1);
																}
																if global.p_totem[2] != -1
																{
																	if global.online
																	{
																		if pn_tot_online = 3
																		{
																			pn_tot = 1;
																		}
																		else
																		{
																			pn_tot = pn_tot_online;
																		}
																	}
																	else
																	{
																		pn_tot = choose(1, 2);
																	}
																}
																if global.p_totem[3] != -1
																{
																	if global.online
																	{
																		pn_tot = pn_tot_online;
																	}
																	else
																	{
																		pn_tot = choose(3, 2, 1);
																	}
																}
																global.e_totem[i] = global.p_totem[pn_tot];
																global.p_totem[pn_tot] = 19;
																totem_es[i] = 0.8;
															}
															else
															{
																totem_es[i] = 1;
																global.tot += 0.5;
															}
														}
														else
														{
															if global.e_totem[i] = 11
															{
																global.tot = 8;
															}
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
																{
																	global.p_totem_a[7] = 0;
																}
																global.tot += 0.5;
															}
														}
													}
												#endregion
											}
											totem_time = 20;
											if global.sound
											{
												audio_play_sound(sd_text, 2, 0);
											}
										#endregion
									}
									else
									{
										totem_time -= 1;
									}
								}
							}
							if global.tot = tt + 0.5
							{
								if totem_es[i] > 1
								{
									totem_es[i] -= 0.03;
								}
								else
								{
									global.tot += 0.5;
								}
							}
						}
					#endregion
				}
			}
		#endregion
		#region Обновление переменных тотемов
			for(i = 1; i <= 3; i ++)
			{
				if global.p_totem[i] <= 6
				{
					totem_pc[i] = c_white;
				}
				if global.e_totem[i] <= 6
				{
					totem_ec[i] = c_white;
				}
				if global.p_totem[i] > 6 && global.p_totem[i] <= 11
				{
					totem_pc[i] = c_aqua;
				}
				if global.e_totem[i] > 6 && global.e_totem[i] <= 11
				{
					totem_ec[i] = c_aqua;
				}
				if global.p_totem[i] > 11 && global.p_totem[i] <= 15
				{
					totem_pc[i] = c_fuchsia;
				}
				if global.e_totem[i] > 11 && global.e_totem[i] <= 15
				{
					totem_ec[i] = c_fuchsia;
				}
				if global.p_totem[i] > 15
				{
					totem_pc[i] = c_orange;
				}
				if global.e_totem[i] > 15
				{
					totem_ec[i] = c_orange;
				}
			}
		#endregion
		#region Уничтожение тотемов
			if global.tot = 8
			{
				for(i = 1; i <= 3; i ++)
				{
					if totem_ps[i] < 1.2
					{
						totem_ps[i] += 0.02;
						totem_es[i] += 0.02;
					}
					else
					{
						global.tot = 9;
					}
				}
			}
			if global.tot = 9
			{
				for(i = 1; i <= 3; i ++)
				{
					if totem_ps[i] > 0
					{
						totem_ps[i] -= 0.1;
						totem_es[i] -= 0.1;
					}
					else
					{
						global.tot = -1;
						global.p_totem[1] = -1;
						global.p_totem[2] = -1;
						global.p_totem[3] = -1;
						global.e_totem[1] = -1;
						global.e_totem[2] = -1;
						global.e_totem[3] = -1;
						for(i = 1; i <= 18; i ++)
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
				{
					totem_x -= 40;
				}
				else
				{
					global.tot = -1;
					global.game_stage = 1;
					if global.training = 4
					{
						global.game_stage = 5;
					}
					if global.player_rank = 15
					{
						global.p_totem_a[4] = 1;
					}
				}
			}
		#endregion
		#region Рисование
			#region Прозрачность тотемов
				if (totem_alpha >= 1 && totem_alpha_d = 1) or (totem_alpha <= 0.5 && totem_alpha_d = -1)
				{
					totem_alpha_d = -totem_alpha_d;
				}
				totem_alpha += 0.01 * totem_alpha_d;
			#endregion
			#region Темный прямоугольник
				if global.tot != -1
				{
					draw_set_alpha(0.45);
					draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
					draw_set_alpha(1);
				}
			#endregion
			#region Отрисовка текста (имена тотемов)
				if global.tot != -1 && global.tot < 7 && totem_txt_i != -1
				{
					draw_set_font(global.game_font);
					draw_text_ext_transformed_t(640, global.height / 2 + string_height(string_upper(global.totem_name[totem_txt_i])) * 0.2 + string_height(string_upper(global.totem_desc[totem_txt_i])) * 0.1 + 20, string_upper(global.totem_desc[totem_txt_i]), -1, 2500, 0.1, 0.1, 8, global.color_white, c_black);
					draw_text_ext_transformed_t(640, global.height / 2, string_upper(global.totem_name[totem_txt_i]), -1, 1000, 0.2, 0.2, 8, pcc, c_black);
				}
			#endregion
			#region Свет тотемов
				if global.p_totem[3] > -1
				{
					draw_sprite_ext(s_totems_light, global.p_totem[3], txx * 0.5 + totem_x, totem_py[3], tss * totem_ps[3], tss * totem_ps[3], 0, totem_pc[3], totem_alpha);
				}
				if global.p_totem[2] > -1
				{
					draw_sprite_ext(s_totems_light, global.p_totem[2], txx * 0.5 + totem_x, totem_py[2], tss * totem_ps[2], tss * totem_ps[2], 0, totem_pc[2], totem_alpha);
				}
				if global.p_totem[1] > -1
				{
					draw_sprite_ext(s_totems_light, global.p_totem[1], txx * 0.5 + totem_x, totem_py[1], tss * totem_ps[1], tss * totem_ps[1], 0, totem_pc[1], totem_alpha);
				}
				if global.e_totem[3] > -1
				{
					draw_sprite_ext(s_totems_light, global.e_totem[3], txx * 1.5 - totem_x, totem_ey[3], tss * totem_es[3], tss * totem_es[3], 0, totem_ec[3], totem_alpha);
				}
				if global.e_totem[2] > -1
				{
					draw_sprite_ext(s_totems_light, global.e_totem[2], txx * 1.5 - totem_x, totem_ey[2], tss * totem_es[2], tss * totem_es[2], 0, totem_ec[2], totem_alpha);
				}
				if global.e_totem[1] > -1
				{
					draw_sprite_ext(s_totems_light, global.e_totem[1], txx * 1.5 - totem_x, totem_ey[1], tss * totem_es[1], tss * totem_es[1], 0, totem_ec[1], totem_alpha);
				}
			#endregion
			#region Отрисовка тотемов
				#region Тотемы игрока
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
				#endregion
				#region Тотемы врага
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
				#endregion
			#endregion
		#endregion
	}
#endregion
#region Выбор Первого Игрока
	if global.game_stage = 1 or global.game_stage = 2
	{
		#region Стадия 0
			if coin_stage = 0
			{
				if coin_y = global.height + 100
				{
					if global.sound = 1
					{
						audio_play_sound(sd_coin,1,0);
					}
				}
				if coin_y > global.height / 2 - 100
				{
					coin_y -= coin_spd;
					if coin_i < 17
					{
						coin_i += 1;
					}
					else
					{
						coin_i = 0;
					}
					coin_a -= 20;
				}
				else
				{
					#region ПОКАЗ ТОТЕМА: Тотем выбора темы
						if global.p_totem_a[7] = 1
						{
							totem_show_n[1] = 7;
						}
						if global.e_totem_a[7] = 1
						{
							totem_show_n[2] = 7;
						}
					#endregion
					coin_stage = 1;
				}
			}
		#endregion
		#region Стадия 1
			if coin_stage = 1
			{
				if coin_spd > -35
				{
					coin_spd -= 4;
					coin_y -= coin_spd;
					if coin_i < 17
					{
						coin_i += 1;
					}
					else
					{
						coin_i = 0;
					}
				}
				else
				{
					coin_stage = 2;
				}
			}
		#endregion
		#region Стадия 2
			if coin_stage = 2
			{
				if coin_y < global.height - 90
				{
					coin_y -= coin_spd;
					if coin_i < 17
					{
						coin_i += 1;
					}
					else
					{
						coin_i = 0;
					}
					coin_a -= 25;
				}
				else
				{
					coin_stage = 3;
				}
			}
		#endregion
		#region Стадия 3
			if coin_stage = 3
			{
				if coin_y < global.height - 50
				{
					#region Взлёт монетки
						coin_y -= coin_spd;
						if coin_i < 9
						{
							coin_i += 1;
						}
						else
						{
							coin_i = 0;
						}
						coin_a -= 20;
					#endregion
				}
				else
				{
					#region Падение монтки
						if global.online
						{
							if global.myid = o_client.first_p
							{
								first_player = 1;
							}
							else
							{
								first_player = 0;
							}
						}
						else
						{
							if coin_i <= 4
							{
								coin_i = 4;
								first_player = 1;
							}
							else
							{
								if coin_i > 4
								{
									coin_i = 4;
									first_player = 0;
								}
							}
						}
						if global.p_totem_a[7] = 1 && global.e_totem_a[7] != 1
						{
							if theme_choose = 1
							{
								first_player = 1;
							}
							else
							{
								first_player = 0;
							}
						}
						if global.e_totem_a[7] = 1 && global.p_totem_a[7] != 1
						{
							if theme_choose = 1
							{
								first_player = 0;
							}
							else
							{
								first_player = 1;
							}
						}
						if global.pvp = 1
						{
							global.now = !first_player;
						}
						part_n = 0;
						coin_stage = 4;
						coin_a = 0;
					#endregion
				}
			}
		#endregion
		#region Стадия 4
			if coin_stage = 4
			{
				name_x     = coin_x;
				name_y     = coin_y;
				name_s     = 0;
				first_x    = coin_x;
				first_y    = coin_y;
				first_s    = 0;
				coin_stage = 5;
			}
		#endregion
		#region Стадия 5
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
					{
						first_time += 1;
					}
					else
					{
						if first_x < 640 + 120
						{
							first_x += 10 * 2;
							first_y -= 3 * 2;
							first_s += 0.065 * 2;
						}
						else
						{
							theme_choose = 1;
							global.game_stage = 2;
						}
					}
				}
			}
		#endregion
		#region Размер монетки
			if coin_stage < 4
			{
				coin_s += 0.005;
			}
		#endregion
		#region Отрисовка монетки
			draw_set_alpha(0.45);
			draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
			draw_set_alpha(1);
			draw_sprite_ext_t(s_start_coin, coin_i, coin_x, coin_y + coin_d, coin_s, coin_s, coin_a, global.color_white, 1, global.color_white, c_black);
			if first_player != -1
			{
				draw_set_font(global.game_font);
				draw_text_transformed_t( name_x - global.pvp * 30,  name_y, coin_you[first_player], name_s * 0.3, name_s * 0.3, 0, global.color_white, c_black);
				draw_text_transformed_t(first_x + global.pvp * 30, first_y, coin_you[2], first_s * 0.3, first_s * 0.3, 0, global.color_white, c_black);
			}
		#endregion
	}
#endregion
#region Выбор Темы
	if (theme_choose = 1 && global.game_stage = 2) or theme_choose = 7 or theme_choose = 8
	{
		#region Тотем 7
			if global.p_totem_a[7] = 1 && global.e_totem_a[7] != 1
			{
				first_player = 1;
			}
			if global.e_totem_a[7] = 1 && global.p_totem_a[7] != 1
			{
				first_player = 0;
			}
		#endregion
		#region Монетка с текстом уходит
			if theme_g = 0
			{
				if theme_s[1] < 1
					{
						theme_timer = room_speed * 14;
						theme_s[1] += 0.1;
					}
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
					if coin_y < global.height + 300
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
							{
								numnum = 1;
							}
							if theme_a[2] = 1
							{
								numnum = 2;
							}
							if theme_a[3] = 1
							{
								numnum = 3;
							}
							theme_click = numnum;
							theme_g = 1;
							if global.sound = 1
							{
								audio_play_sound(sd_text, 2, 0);
							}
							theme_round[global.rounds] = theme_t[numnum];
						}
						else
						{
							if choose_y > global.height - 80
							{
								choose_y -= 30;
							}
						}
					}
				}
			}
		#endregion
		#region Отрисовка тёмного фона
			if theme_choose = 7 or theme_choose = 8
			{
				draw_set_alpha(0.45);
				draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
				draw_set_alpha(1);
			}
		#endregion
		#region Выбор темы
			for(i = 1; i <= 3; i ++)
			{
				#region Нажатие на тему
					if theme_g = 0
					{
						if theme_s[i] >= 1 && theme_a[i] = 1
						{
							var butsize;
							butsize = theme_s[i] * 0.65 * sprite_get_width(s_themes_button) / 2;
							if (first_player = 1 or global.pvp) && point_in_rectangle(mouse_x, mouse_y, theme_x[i] - butsize, theme_y[i] - butsize, theme_x[i] + butsize, theme_y[i] + butsize)
							{
								if mouse_check_button(mb_left)
								{
									theme_s[i] = 1.1;
								}
								else
								{
									theme_s[i] = 1;
								}
								if mouse_check_button_released(mb_left)
								{
									theme_click = i;
									theme_g = 1;
									if global.sound = 1
									{
										audio_play_sound(sd_text, 2, 0);
									}
									theme_round[global.rounds] = theme_t[i];
									if global.online
									{
										o_client.theme_r[global.rounds] = i;
										o_client.go_theme = 1;
										o_client.cl_stage[4] = 1; //o_client.cl_stage[1] = 4;
									}
								}
							}
							theme_s[i] = 1;
							theme_a1[i] += 10;
							theme_x1[i] += lengthdir_x(random(0.5),theme_a1[i]);
							theme_y1[i] += lengthdir_y(random(0.5),theme_a1[i]);
						}
					}
				#endregion
				#region Тема выбрана
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
									{
										theme_y1[i] -= 1;
										theme_y[i] += 1;
										theme_s[i] += 0.025;
									}
									else
									{
										if choose_y > 500
										{
											theme_a[theme_click] = 0;
											theme_g = 2;
									}
									}
								}
								if i = 1
								{
									if theme_x[i] < 640
									{
										theme_x[i] += 40;
									}
									else
									{
										theme_x[i] = 640;
									}
								}
								if i = 3
								{
									if theme_x[i] > 640
									{
										theme_x[i] -= 40;
									}
									else
									{
										theme_x[i] = 640;
									}
								}
							}
							if theme_choose = 7
							{
								if theme_x[i] = 640
								{
									if theme_s[i] < 1.25
									{
										theme_y1[i] -= 1;
										theme_y[i] += 1;
										theme_s[i] += 0.025;
									}
									else
									{
										if choose_y > 500
										{
											theme_a[theme_click] = 0;
											theme_g = 2;
										}
									}
								}
								#region Один и Два
									if theme_a[1] = 1 && theme_a[2] = 1
									{
										if i = 1
										{
											if theme_x[i] < 640
											{
												theme_x[i] += 40;
											}
											else
											{
												theme_x[i] = 640;
											}
										}
										if i = 2
										{
											if theme_x[i] > 640
											{
												theme_x[i] -= 40;
											}
											else
											{
												theme_x[i] = 640;
											}
										}	
									}
								#endregion
								#region Один и Три
									if theme_a[1] = 1 && theme_a[3] = 1
									{
										if i = 1
										{
											if theme_x[i] < 640
												{
													theme_x[i] += 40;
												}
												else
												{
													theme_x[i] = 640;
												}
										}
										if i = 3
										{
											if theme_x[i] > 640
												{
													theme_x[i] -= 40;
												}
												else
												{
													theme_x[i] = 640;
												}
										}	
									}
								#endregion
								#region Два и Три
									if theme_a[2] = 1 && theme_a[3] = 1
									{
										if i = 2
										{
											if theme_x[i] < 640
											{
												theme_x[i] += 40;
											}
											else
											{
												theme_x[i] = 640;
											}
										}
										if i = 3
										{
											if theme_x[i] > 640
											{
												theme_x[i] -= 40;
											}
											else
											{
												theme_x[i] = 640;
											}
										}	
									}
								#endregion
							}
							if theme_choose = 8
							{
								if theme_s[theme_click] < 1.25
								{
									theme_y1[theme_click] -= 1;
									theme_y[theme_click] += 1;
									theme_s[theme_click] += 0.025;
								}
								else
								{
									if choose_y > 500
									{
										theme_a[theme_click] = 0;
										theme_g = 2;
									}
								}
							}
						}
					}
				#endregion
				#region Переход на новую стадию игры
					if theme_g = 2
					{
						if theme_s[i] > 0
						{
							theme_s[i] -= 0.25;
						}
						else
						{
							theme_choose = 2;
							theme_g = 3;
							global.game_stage = 3;
						}
					}
				#endregion
				#region Отрисовыка иконок тем
					draw_sprite_ext_t(s_themes_button, 0, theme_x[i] + theme_x1[i], theme_y[i] + theme_y1[i], theme_s[i] * 0.65, theme_s[i] * 0.65, 0, global.color_hero[theme_t[i]], 1, c_white, c_black);
					draw_sprite_ext_t(s_themes_ss, theme_t[i], theme_x[i] + theme_x1[i], theme_y[i] + theme_y1[i], theme_s[i] * 0.64, theme_s[i] * 0.64, 0, global.color_white, 1, global.color_white, c_black);
					draw_set_font(global.game_font);
					if string_length(theme_nn[i]) < 7
					{
						draw_text_transformed_t(theme_x[i], theme_y[i] + 100, theme_nn[i], theme_s[i] * 0.2, theme_s[i] * 0.2, 0, global.color_white, c_black);
					}
					else
					{
						draw_text_transformed_t(theme_x[i], theme_y[i] + 100, theme_nn[i], theme_s[i] * 0.15, theme_s[i] * 0.15, 0, global.color_white, c_black);
					}
				#endregion
			}
		#endregion
		#region Враг выбирает тему
			if choose_y <= global.height - 80
			{
				theme_points_time += 1;
				if theme_points_time = 20
				{
					if (first_player = 0 && global.pvp = 0 && global.online = 0) && theme_points = ""
					{
						var numnum;
						if theme_choose = 1
						{
							numnum = choose(1, 1, 3, irandom_range(1, 3));
						}
						if theme_choose = 7
						{
							if theme_a[1] != 1
							{
								numnum = choose(3, 3, 3, 2);
							}
							if theme_a[2] != 1
							{
								numnum = choose(1, 1, 1, 3);
							}
							if theme_a[3] != 1
							{
								numnum = choose(1, 1, 1, 2);
							}
						}
						theme_click = numnum;
						theme_g = 1;
						if global.sound = 1
						{
							audio_play_sound(sd_text, 2, 0);
						}
						theme_round[global.rounds] = theme_t[numnum];
					}
					if theme_points != "..."
					{
						theme_points += ".";
					}
					else
					{
						theme_points = "";
					}
					theme_points_time = 0;
				}
			}
			draw_text_transformed_t(640, choose_y, theme_text[!first_player] + theme_points, 0.23, 0.23, 0, global.color_white, c_black);
		#endregion
		#region Автовыбор темы
			if theme_click = 0
			{
				if theme_timer > 0
				{
					theme_timer -= 1;
				}
				else
				{
					if global.online
					{
						if global.myid = o_client.first_p
						{
							var numnum;
							if theme_a[1] = 1 && theme_a[2] = 0 && theme_a[3] = 0
							{
								numnum = 1;
							}
							if theme_a[2] = 1 && theme_a[1] = 0 && theme_a[3] = 0
							{
								numnum = 2;
							}
							if theme_a[3] = 1 && theme_a[1] = 0 && theme_a[2] = 0
							{
								numnum = 3;
							}
							if theme_a[1] = 1 && theme_a[2] = 1 && theme_a[3] = 0
							{
								numnum = choose(1, 2);
							}
							if theme_a[2] = 1 && theme_a[1] = 0 && theme_a[3] = 1
							{
								numnum = choose(2, 3);
							}
							if theme_a[3] = 1 && theme_a[1] = 1 && theme_a[2] = 0
							{
								numnum = choose(1, 3);
							}
							if theme_a[3] = 1 && theme_a[1] = 1 && theme_a[2] = 1
							{
								numnum = choose(1, 2, 3);
							}
							theme_click = numnum;
							theme_g = 1;
							if global.sound = 1
							{
								audio_play_sound(sd_text, 2, 0);
							}
							theme_round[global.rounds] = theme_t[numnum];
							o_client.theme_r[global.rounds] = numnum;
							o_client.cl_stage[4] = 1; //o_client.cl_stage[1] = 4;
						}
						else
						{
							autolose_time += 1;
							if autolose_time = room_speed * 10
							{
								o_client.winner = global.myid;
								o_client.stage  = 3;
								if instance_exists(o_list)
								{
									global.game_stage   = 5;
									o_list.autowin      = 1;
									o_list.whowin       = 1;
									o_list.theme_choose = 9;
									global.idol[1]		= 0;
									global.idol[2]		= 0;
									global.idol[3]		= 0;
								}
								o_client.cl_stage[19] = 1; //o_client.cl_stage[1] = 19;
							}
						}
					}
					else
					{
						var numnum;
						if theme_a[1] = 1 && theme_a[2] = 0 && theme_a[3] = 0
						{
							numnum = 1;
						}
						if theme_a[2] = 1 && theme_a[1] = 0 && theme_a[3] = 0
						{
							numnum = 2;
						}
						if theme_a[3] = 1 && theme_a[1] = 0 && theme_a[2] = 0
						{
							numnum = 3;
						}
						if theme_a[1] = 1 && theme_a[2] = 1 && theme_a[3] = 0
						{
							numnum = choose(1, 2);
						}
						if theme_a[2] = 1 && theme_a[1] = 0 && theme_a[3] = 1
						{
							numnum = choose(2, 3);
						}
						if theme_a[3] = 1 && theme_a[1] = 1 && theme_a[2] = 0
						{
							numnum = choose(1, 3);
						}
						if theme_a[3] = 1 && theme_a[1] = 1 && theme_a[2] = 1
						{
							numnum = choose(1, 2, 3);
						}
						theme_click = numnum;
						theme_g = 1;
						if global.sound = 1
						{
							audio_play_sound(sd_text, 2, 0);
						}
						theme_round[global.rounds] = theme_t[numnum];
					}
				}
				if theme_timer <= room_speed * 7
				{
					draw_set_color(c_white);
					draw_set_alpha(0.4 + 0.6 * theme_timer / (7 * room_speed));
					draw_rectangle(640 - 330 * theme_timer / (7 * room_speed), global.height / 2 - 20 - 5 + 165, 640 + 330 * theme_timer / (7 * room_speed), global.height / 2 - 20 + 5 + 165, 0);
					draw_set_alpha(1);
				}
			}
		#endregion
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
				round_s[1] += 1 / 12;
			}
			else
			{
				round_s[1] += round_spd;
				if round_a[1] < 5
				{
					round_a[1] += 0.5;
				}
				else
				{
					if round_s[2] < 1
					{
						round_a[2] += 15;
						round_s[2] += 1 / 12;
					}
					else
					{
						round_s[2] += round_spd;
						if round_a[2] < 5
						{
							round_a[2] += 0.5;
						}
						else
						{
							if round_s[3] < 1
							{
								round_a[3] += 15;
								round_s[3] += 1 / 12;
							}
							else
							{
								round_s[3] += round_spd;
								if round_a[3] < 5
								{
									round_a[3] += 0.5;
								}
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
										{
											round_alpha -= 0.05;
										}
										else
										{
											if global.game_stage = 4
											{
												if global.p_totem_a[13] = 1
												{
													var deal;
													deal = choose(1, 0);
													if global.online
													{
														if real(string_copy(totem_ran_panther[global.myid], 1, 1)) = 1
														{
															deal = 1;
														}
														else
														{
															deal = 0;
														}
														totem_ran_panther[global.myid] = string_delete(totem_ran_panther[global.myid], 1, 1);
													}
													e_hp -= atk;
													if deal = 0
													{
														hp -= e_atk;
													}
													#region ПОКАЗ ТОТЕМА: Тотем быстрого урона
														o_list.totem_show_n[1] = 13;
													#endregion
												}
												if global.e_totem_a[13] = 1
												{
													var deal;
													deal = choose(1, 0);
													if global.online
													{
														if real(string_copy(totem_ran_panther[global.enid], 1, 1)) = 1
														{
															deal = 1;
														}
														else
														{
															deal = 0;
														}
														totem_ran_panther[global.enid] = string_delete(totem_ran_panther[global.enid], 1, 1);
													}
													hp -= e_atk;
													if deal = 0
													{
														e_hp -= atk;
													}
													#region ПОКАЗ ТОТЕМА: Тотем быстрого урона
														o_list.totem_show_n[2] = 13;
													#endregion
												}
												global.game_stage = 5;
												theme_choose = 4;
												list_go = 1;
												list_y = -300;
												list_scale = 0;
												plas_scale = 0;
												var task_number, now_number;
												task_number = "123";
												if theme_round[global.rounds] = 2 or theme_round[global.rounds] = 6
												{
													task_number = "1234";
												}
												for(j = 1; j <= 3; j ++)
												{
													now_number = irandom_range(1, string_length(task_number));
													round_task[global.rounds,j] = real(string_copy(task_number, now_number, 1));
													task_number = string_delete(task_number, now_number, 1);
													if global.online
													{
														if (first_player = 1 && global.rounds != 3) or (global.rounds = 3 && o_client.first_p = global.myid)
														{
															o_client.cl_stage[9] = 1; //o_client.cl_stage[1] = 9;
														}
													}
												}
												vvv = 1;
												#region Скрипт темы/раунда/задачи
													if global.storm = 1
													{
														storm_1();
													}
													switch(theme_round[global.rounds])
													{
														case 1:
															script_execute(asset_get_index("cards_" + string(round_task[global.rounds,global.task])));
														break;
														case 2:
															script_execute(asset_get_index("bottles_" + string(round_task[global.rounds,global.task])));
														break;
														case 3:
															script_execute(asset_get_index("move_" + string(round_task[global.rounds,global.task])));
														break;
														case 4:
															script_execute(asset_get_index("attention_" + string(round_task[global.rounds,global.task])));
														break;
														case 5:
															script_execute(asset_get_index("shooting_" + string(round_task[global.rounds,global.task])));
														break;
														case 6:
															script_execute(asset_get_index("math_" + string(round_task[global.rounds,global.task])));
														break;
													}
													global.question = 1;
												#endregion
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
			draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
			draw_set_alpha(1);
			draw_set_font(global.game_font);
			draw_text_transformed_t(round_x[1], round_y[1], round_text[1] + " " + string(global.rounds), round_s[1] * 0.25, round_s[1] * 0.25, round_a[1], global.color_white, c_black);
			draw_text_transformed_t(round_x[2], round_y[2], round_text[2], round_s[2] * 0.45, round_s[2] * 0.45, round_a[2], global.color_white, c_black);
			draw_text_transformed_t(round_x[3], round_y[3], round_text[3], round_s[3] * 0.85, round_s[3] * 0.85, round_a[3], global.color_white, c_black);
		}
	#endregion
	#region Обнуление переменные перед раундом
		if theme_choose = 2
		{
			#region Билл
				global.jr_e = 0;
				if global.hero = 5
				{
					if os_get_language() = "ru"
					{
						global.player_name = "БИЛЛ СТ.";
					}
					else
					{
						global.player_name = "BILL SR.";
					}
				}
			#endregion
			#region Идолы
				for(i = 1; i <= 3; i ++)
				{
					global.idol_x[i] = 0;
					global.idol_y[i] = -200;
					global.idol[i]   = 0;
					global.idol_s[i] = 1;
					global.idol_h[i] = -1;
					for(j = 0; j <= 1; j ++)
					{
						global.anim[i,j] = -1;
					}
				}
			#endregion
			#region Переменные нажатий и первого игрока
				theme_g      = 0;
				theme_click  = 0;
				theme_dot    = "";
				first_player = !first_player;
				if global.online
				{
					o_client.first_p = 3 - o_client.first_p;
				}
			#endregion
			#region Переменные тем
				for(i = 1; i <= 3; i ++)
				{
					if theme_a[i] = 1
					{
						theme_x[i]  = 640;
						theme_y[i]  = global.height / 2;
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
			#endregion
			#region Координаты кнопок
				if global.rounds = 1
				{
					if theme_a[1] != 1
					{
						theme_x[2]  = 640 - 150;
						theme_x[3]  = 640 + 150;
					}
					if theme_a[2] != 1
					{
						theme_x[1]  = 640 - 150;
						theme_x[3]  = 640 + 150;
					}
					if theme_a[3] != 1
					{
						theme_x[1]  = 640 - 150;
						theme_x[2]  = 640 + 150;
					}
				}
			#endregion
			#region Координаты надписей
				round_x[1]   = 300;
				round_y[1]   = global.height / 2 - 150;
				round_x[2]   = 900;
				round_y[2]   = global.height / 2;
				round_x[3]   = 400;
				round_y[3]   = global.height / 2 + 170;
				round_s[1]   = 0;
				round_s[2]   = 0;
				round_s[3]   = 0;
				round_a[1]   = -180;
				round_a[2]   = -180;
				round_a[3]   = -180;
				round_spd    = 0.0025;
				round_alpha  = 1;
				coin_y       = global.height + 300;
				choose_y     = global.height + 300;
				if global.online
				{
					o_client.cl_stage[5] = 1; //o_client.cl_stage[1] = 5;
					theme_choose = -1;
				}
				else
				{
					theme_choose = 3;
				}
			#endregion
		}
	#endregion
#endregion
#region Объявление победителя раунда
	#region Объявление
		if theme_choose = 6
		{
			#region Билл
				with(o_hero)
				{
					//if global.hero = 5
					//{
					//	if os_get_language() = "ru"
					//	{
					//		global.player_name = "БИЛЛ СТ.";
					//	}
					//	else
					//	{
					//		global.player_name = "BILL SR.";
					//	}
					//}
					global.jr_e = 0;
					if hero = 5
					{
						if bill_stage = 2
						{
							bill_boom    = 0;
						}
						bill_stage = 0;
					}
				}
			#endregion
			#region Обнуление переменных
				global.storm      = 0;
				global.critical   = 0;
				global.e_critical = 0;
				vvv = 0;
				with(o_hero)
				{
					poisoned  = 0;
					super     = 0;
					huntress_poison = 0;
					diego_dynamit   = 0;
					dynamit_x = 0;
					dynamit_y = 0;
					dynamit_a = 0;
					dynamit_i = 0;
					dynamit_d = 0;
					stun      = 0;
				}
			#endregion
			#region Отрисовка темного
				global.super_ability1 = 0;
				global.super_ability  = 0;
				draw_set_alpha(0.45 * round_alpha);
				draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
				draw_set_alpha(1);
			#endregion
			#region Объявление победителя раунда
				#region Стадия 0
					if whowin_stage = 0
					{
						if whowin_a1 < 0
						{
							whowin_s1 += 1/10;
							whowin_a1 += 18;
						}
						else
						{
							whowin_a1 += 0.5;
							if whowin_a2 < 0
							{
								whowin_s2 += 1/10;
								whowin_a2 += 18;
							}
							else
							{
								whowin_stage = 1;
							}
						}
					}
				#endregion
				#region Стадия 1
					if whowin_stage = 1
					{
						whowin_a1 += 0.5;
						whowin_a2 += 0.5;
						if round(100 * hp / maxhp) > round(100 * e_hp / e_maxhp)
						{
							hpold = 1;
						}
						else
						{
							hpold = 0;
						}
						if abs(round(100 * hp / maxhp) - round(100 * e_hp / e_maxhp)) < 1
						{
							hprld = 1;
							if global.online
							{
								//if roundskul[global.rounds] = 1
								//{
								//	hpold = 1;
								//}
								//else
								//{
								//	hpold = 0;
								//}
								if faster_id = global.myid
								{
									hpold = 1;
								}
								else
								{
									hpold = 0;
								}
							}
						}
						else
						{
							hprld = 0;
						}
						
						if roundskul[global.rounds] = 1 //hpold
						{
							#region Победа
								whowin_c1 = c_orange;
								whowin_c2 = c_black;
								if os_get_language() != "ru"
								{
									whowin_text = "YOU WIN";
								}
								else
								{
									whowin_text = "ТЫ ВЫИГРАЛ";
								}
								if whowin_s1 < 1.6
								{
									whowin_s1 += 0.07;
								}
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
											image_speed  = spd_max;
											skeleton_animation_set("lose");
											change = 5;
										}
									}
									whowin_stage = 2;
								}
							#endregion
						}
						else
						{
							#region Поражение
								whowin_c2 = c_orange;
								whowin_c1 = c_black;
								if os_get_language() = "ru"
								{
									whowin_text = "ТЫ ПРОИГРАЛ";
								}
								else
								{
									whowin_text = "YOU LOSE";
								}
								if whowin_s2 < 1.6
								{
									whowin_s2 += 0.1;
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
											image_speed  = spd_max;
											skeleton_animation_set("lose");
											change = 5;
										}
									}
									whowin_stage = 2;
								}
							#endregion
						}
					}
				#endregion
				#region Стадия 2
					if whowin_stage = 2
					{
						if light_scale1 < 1
						{
							light_scale1 += 0.05;
						}
						else
						{
							whowin_stage = 3;
						}
					}
				#endregion
				#region Стадия 3
					if whowin_stage = 3
					{
						if whowin_text_a < 0
						{
							whowin_text_s += 1/10;
							whowin_text_a += 18;
						}
						else
						{
							whowin_stage = 4;
						}
					}
				#endregion
				#region Стадия 4
					if whowin_stage = 4
					{
						if whowin_timer < room_speed * 2
						{
							whowin_timer += 1;
						}
						else
						{
							whowin_stage = 5;
						}
					}
				#endregion
				#region Стадия 5
					if whowin_stage = 5
					{
						if whowin_s1 > 0
						{
							whowin_s1 -= 0.2;
							if whowin_text_s > 0
							{
								whowin_text_s -= 0.2;
							}
						}
						else
						{
							whowin_s1 = 0;
							if whowin_s2 > 0
							{
								whowin_s2 -= 0.2;
							}
							else
							{
								whowin_s2 = 0;
								#region Обновление
									if global.rounds < 3
									{
										global.rounds += 1;
									}
									whowin_stage = 0;
									whowin_x1 = 200 + 280;
									whowin_y1 = global.height / 2;
									whowin_s1 = 0;
									whowin_c1 = c_black;
									whowin_a1 = -180;
									whowin_x2 = 1080 - 280;
									whowin_y2 = global.height / 2;
									whowin_s2 = 0;
									whowin_c2 = c_black;
									whowin_a2 = -180;
									whowin_text	  = "";
									whowin_text_x = 640;
									whowin_text_y = global.height / 2 - 160;
									whowin_text_s = 0;
									whowin_text_a = -180;
									whowin_timer  = 0;
									light_scale1  = 0;
									light_scale1_dir = -1;
									go_hp = 1;
									with(o_hero)
									{
										depth = 2; //depth += 2;
									}
									round_text1_x = 1450;
									if whowin = 0
									{
										if global.rounds = 2
										{
											theme_choose = 7;
											#region ПОКАЗ ТОТЕМА: Тотем выбора темы
												if global.p_totem_a[7] = 1
												{
													totem_show_n[1] = 7;
												}
												if global.e_totem_a[7] = 1
												{
													totem_show_n[2] = 7;
												}
											#endregion
										}
										if global.rounds = 3
										{
											theme_choose = 8;
										}
									}
									else
									{
										theme_choose = 9;
										if global.online
										{
											o_client.cl_stage[12] = 1; //o_client.cl_stage[1] = 12;
										}
									}
									for(i = 0; i <= 2; i ++)
									{
										theme_ss[i] = 1;
										theme_xx[i] = 0;
										theme_yy[i] = 0;
										theme_b_mv[i]  = 0;
										theme_b_im[i]  = irandom(2);
										theme_b_sx[i]  = 0;
										theme_b_x[i]   = 640 - 300 + 300 * i;
										theme_b_y[i]   = 300 + global.more_size / 2;
										theme_b_c[i]   = 0;
										theme_b_cn[i]  = 60;
										theme_b_dir[i] = 1;
										theme_n[i]     = 0;
										theme_go[i]    = 0;
										theme_sc[i]    = 0;
										theme_end[i]   = 0;
										theme_l[i]     = 0;
										theme_ps[i]    = 0;
									}
									theme_goto_y  = 0;
									theme_lo      = 0;
									theme_c       = -1;
									theme_c_true  = 0;
									theme_text_y  = -600;
									theme_b_mv[0] = 1;
									timer_t = 30 * room_speed;
									for(i = 1; i <= 9; i ++)
									{
										u_answer[i] = -1;
										e_answer[i] = -1;
									}
								#endregion
							}
						}
					}
				#endregion
				#region Покачивание надписи
					if whowin_stage >= 3
					{
						if whowin_text = "YOU LOSE"
						{
							light_scale1 = whowin_s1;
						}
						else
						{
							light_scale1 = whowin_s2;
						}
						if light_scale1_dir = 1
						{
							if light_scale1 < 1.1
							{
								light_scale1 += 0.025;
							}
							else
							{
								light_scale1_dir = -light_scale1_dir;
							}
						}
						if light_scale1_dir = -1
						{
							if light_scale1 > 1
							{
								light_scale1 -= 0.025;
							}
							else
							{
								light_scale1_dir = -light_scale1_dir;
							}
						}
					}
				#endregion
				#region Отрисовка подстветки
					draw_set_font(global.game_font);
					var light_xx;
					if hpold
					{
						light_xx = whowin_x1;
					}
					else
					{
						light_xx = whowin_x2;
					}
					draw_sprite_ext(s_light, 0, light_xx, whowin_y1, light_scale1 * 0.4, light_scale1 * 0.4, 0, global.color_white, 0.4);
				#endregion
				#region Отрисовка текста
					draw_text_transformed_t(whowin_x1, whowin_y1, string(round(100 * hp / maxhp)) + "%", 0.4 * whowin_s1, 0.4 * whowin_s1, whowin_a1, global.color_white, c_black);
					draw_text_transformed_t(whowin_x2, whowin_y2, string(round(100 * e_hp / e_maxhp)) + "%", 0.4 * whowin_s2, 0.4 * whowin_s2, whowin_a2, global.color_white, c_black);
					if 0
					{
						if hpold
						{
							#region Отрисовка процентов, если выиграл
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
							#endregion
						}
						else
						{
							#region Отрисовка процентов, если проиграл
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
							#endregion
						}
					}
					draw_text_transformed_t(whowin_text_x, whowin_text_y, whowin_text, 0.25 * whowin_text_s, 0.25 * whowin_text_s, whowin_text_a, global.color_white, c_black);
				#endregion
			#endregion
		}
	#endregion
	#region Обнуление переменных перед раундом
		if theme_choose = 5
		{
			//o_list.pepa += "11 ";
			if global.online
			{
				if round_end = 1// && o_client.cl_stage[1] = 0
				{
					//o_list.pepa += "14 ";
					if round_end_dop = 1
					{
						o_list.pepa += "F1 "; //o_list.pepa += "15 ";
						theme_choose = 6;
						
						player_end[1] = 0; //
						player_end[2] = 0; // Игроки закончили отвечать на вопросы
						faster_id     = -1; // Самый быстрый игрок
						//pepa		  = ""; // Отладка
						round_end     = 0; // Враг закончил раунд
						round_end_dop = 2;
					}
				}
				else
				{
					if round_end = 0 // && o_client.cl_stage[1] = 0
					{
						global.idol[1] = 0;
						global.idol[2] = 0;
						global.idol[3] = 0;
						global.idol_h[1]	= -1;
						global.idol_h[2]	= -1;
						global.idol_h[3]	= -1;
						if global.hero = 2
						{
							atk     = global.atk[global.hero];
							atk    *= (1 + 0.1 * (global.hero_level - 1));
						}
						if global.enemy_hero = 2
						{
							e_atk   = global.atk[global.enemy_hero];
							e_atk  *= (1 + 0.1 * (global.enemy_level - 1));
						}
						with(o_hero)
						{
							depth = -2; //depth -= 2;
						}
						o_client.cl_stage[10] = 1; //o_client.cl_stage[1] = 10;
						o_list.pepa += "P6 "; //o_list.pepa += "12 ";
						round_end = 1;
					}
				}
			}
			else
			{
				global.idol[1] = 0;
				global.idol[2] = 0;
				global.idol[3] = 0;
				global.idol_h[1]	= -1;
				global.idol_h[2]	= -1;
				global.idol_h[3]	= -1;
				if global.hero = 2
				{
					atk     = global.atk[global.hero];
					atk    *= (1 + 0.1 * (global.hero_level - 1));
				}
				if global.enemy_hero = 2
				{
					e_atk   = global.atk[global.enemy_hero];
					e_atk  *= (1 + 0.1 * (global.enemy_level - 1));
				}
				//atk     = global.atk[global.hero];
				//e_atk   = global.atk[global.enemy_hero];
				//atk    *= (1 + 0.1 * (global.hero_level - 1));
				//hp     *= (1 + 0.1 * (global.hero_level - 1));
				//e_atk  *= (1 + 0.1 * (global.enemy_level - 1));
				//e_hp   *= (1 + 0.1 * (global.enemy_level - 1));
				//maxhp   = hp;
				//e_maxhp = e_hp;
				//maxhp   = global.hp[global.hero] * (1 + 0.1 * (global.hero_level - 1));
				//e_maxhp = global.hp[global.enemy_hero] * (1 + 0.1 * (global.enemy_level - 1));
				with(o_hero)
				{
					depth = -2; //depth -= 2;
				}
				theme_choose = 6;
			}
		}
	#endregion
#endregion
#region Финиш дуэли
	if theme_choose = 9
	{
		#region Отрисовка темноты поверх
			draw_set_alpha(0.65);
			draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
			draw_set_alpha(1);
		#endregion
		#region Отрисовка плашки
			#region Победил игрок (или нет pvp)
			if whowin = 1 or global.pvp = 1
			{
				if finplas < 1 && autowin = 0
				{
					draw_sprite_ext(s_plash_win, 2, 640, -fin_y + 50 + global.height / 2 - 469 * list_size - 80 + list_y, list_size * finplas, list_size, 0, c_white, 1);
					draw_sprite_ext(s_plash_win, 0, 640 + 418  * list_size * (1 - finplas), -fin_y + 50 + global.height / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
					draw_sprite_ext(s_plash_win, 1, 640 - 418  * list_size * (1 - finplas), -fin_y + 50 + global.height / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
				}
				else
				{
					if autowin = 0
					{
						win_plas += 0.4;
						draw_sprite_ext(s_plash_win_f, win_plas, 640, -fin_y + 50 + global.height / 2 - 469 * list_size - 80 + list_y, list_size * finplas, list_size, 0, c_white, 1);
					}
				}
				var gold_c, pvpp;
				gold_c = make_color_rgb(252,232,131);
				pvpp = "";
				if global.pvp = 1
				{
					if whowin = 1
					{
						pvpp = coin_you[1] + "\n";
					}
					else
					{
						pvpp = coin_you[0] + "\n";
					}
				}
				draw_set_font(global.game_font);
				if os_get_language() = "ru"
				{
					if autowin = 0
					{
						draw_text_transformed_t(640, -fin_y + 50 + global.height / 2 - 469 * list_size - 100 + list_y, pvpp + "ПОБЕДА!", finplas * 0.18, 0.18, 0, gold_c, c_black);
					}
					else
					{
						draw_text_transformed_t(640, -fin_y + 50 + global.height / 2 - 469 * list_size - 100 + list_y, pvpp + "ПРОТИВНИК ВЫШЕЛ", finplas * 0.18, 0.18, 0, gold_c, c_black);
					}
				}
				else
				{
					if autowin = 0
					{
						draw_text_transformed_t(640, -fin_y + 50 + global.height / 2 - 469 * list_size - 100 + list_y, pvpp + "VICTORY!", finplas * 0.18, 0.18, 0, gold_c, c_black);
					}
					else
					{
						draw_text_transformed_t(640, -fin_y + 50 + global.height / 2 - 469 * list_size - 100 + list_y, pvpp + "OPPONENT LEAVE", finplas * 0.18, 0.18, 0, gold_c, c_black);
					}
				}
			}
			#endregion
			#region Победил враг
				if whowin = 2 && global.pvp = 0
				{
					if finplas < 1
					{
						finplas += 0.1;
					}
					draw_sprite_ext(s_plash_lose, 2, 640, -fin_y + 50 + global.height / 2 - 469 * list_size - 80 + list_y, list_size * finplas, list_size, 0, c_white, 1);
					draw_sprite_ext(s_plash_lose, 0, 640 + 418  * list_size * (1 - finplas), -fin_y + 50 + global.height / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
					draw_sprite_ext(s_plash_lose, 1, 640 - 418  * list_size * (1 - finplas), -fin_y + 50 + global.height / 2 - 469 * list_size - 80 + list_y, list_size, list_size, 0, c_white, 1);
					draw_set_font(global.game_font);
					if autolose = 0
					{
						if os_get_language() != "ru"
						{
							draw_text_transformed_t(640, -fin_y + 50 + global.height / 2 - 469 * list_size - 100 + list_y, "DEFEAT", finplas * 0.18, 0.18, 0, global.color_white, c_black);
						}
						else
						{
							draw_text_transformed_t(640, -fin_y + 50 + global.height / 2 - 469 * list_size - 100 + list_y, "ПОРАЖЕНИЕ", finplas * 0.18, 0.18, 0, global.color_white, c_black);
						}
					}
					else
					{
						if os_get_language() != "ru"
						{
							draw_text_transformed_t(640, -fin_y + 50 + global.height / 2 - 469 * list_size - 100 + list_y, "TOO LATE...", finplas * 0.18, 0.18, 0, global.color_white, c_black);
						}
						else
						{
							draw_text_transformed_t(640, -fin_y + 50 + global.height / 2 - 469 * list_size - 100 + list_y, "ЧТО-ТО ТЫ ДОЛГО...", finplas * 0.18, 0.18, 0, global.color_white, c_black);
						}
					}
				}
			#endregion
		#endregion
		#region Появление плашки финиша
			if fin_y > 0
				{
					fin_y -= 40;
				}
		#endregion
		#region Главный код Финиша
			if fin_y <= 0
			{
				#region Появление плашки, запись данных
					if finplas < 1
					{
						#region Разворот плашки финиша и код квестов
							finplas += 0.1;
							if finplas >= 1
							{
								for(i = 1; i <= 3; i ++)
								{
									if whowin = 1
									{
										if global.shomen1 = 0 && global.shomen
										{
											ini_open("Music.ini");
												ini_write_string("SHOMA", "sm", "1");
												global.shomen1 = ini_read_real("SHOMA", "sm", 0);
											ini_close();
										}
										if global.quests_a[i] = 1
										{
											if (global.quests_t[i] = 1 && (global.hero = 1 or global.hero = 4))
											or (global.quests_t[i] = 2 && (global.hero = 2 or global.hero = 6))
											or (global.quests_t[i] = 3 && (global.hero = 3 or global.hero = 7))
											or (global.quests_t[i] = 4 && (global.hero = 5 && global.bill_propil = 0))
											{
												if global.quests_n_now[i] < global.quests_n_all[i]
												{
													global.quests_n_now[i] += 1;
												}
											}
											if global.quests_t[i] = 14 && global.pralna = 1
											{
												if global.quests_n_now[i] < global.quests_n_all[i]
												{
													global.quests_n_now[i] += 1;
												}
											}
											if global.quests_t[i] = 15 && global.bistra = 1
											{
												if global.quests_n_now[i] < global.quests_n_all[i]
												{
													global.quests_n_now[i] += 1;
												}
											}
											if global.quests_t[i] = 23 && global.spasabnast = 0
											{
												if global.quests_n_now[i] < global.quests_n_all[i]
												{
													global.quests_n_now[i] += 1;
												}
											}
											if global.quests_t[i] = 20 && global.vremiaiada >= room_speed * 15
											{
												if global.quests_n_now[i] < global.quests_n_all[i]
												{
													global.quests_n_now[i] += 1;
												}
											}
											ini_open("Music.ini");
												ini_write_string("Qual", "qual_nno_" + string(i), string(global.quests_n_now[i]));
											ini_close();
										}
									}
									if global.quests_a[i] = 1
									{
										if global.quests_t[i] = 11 or global.quests_t[i] = 12 or global.quests_t[i] = 13
										{
											if global.quests_n_now[i] < global.quests_n_all[i]
											{
												global.quests_n_now[i] += 1;
											}
										}
										ini_open("Music.ini");
											ini_write_string("Qual", "qual_nno_" + string(i), string(global.quests_n_now[i]));
										ini_close();
									}
								}
							}
						#endregion
					}
					else
					{
						if global.quick = 0
						{
							#region Для быстрой игры
								if whowin = 2 && g_rank_stage = 0
								{
									if global.sound
									{
										audio_play_sound(sd_lose, 2, 0);
									}
								}
								if g_rank_stage = 0
								{
									g_rank_stage = 1;
								}
							#endregion
						}
						else
						{
							#region Для обычной игры
								#region Победная или проигрышная музыка
									if music_off = 0
									{
										if whowin = 2
										{
											if global.sound
											{
												audio_play_sound(sd_lose, 2, 0);
											}
										}
										if whowin = 1
										{
											if global.sound
											{
												audio_play_sound(sd_win, 2, 0);
											} 
										}
										music_off = 1;
									}
								#endregion
								#region Запись перемнных голды и баксов
									if g_rank_stage != 8
									{
										ini_open("Music.ini");
										if whowin = 1
										{
											if roundskul_n[3] = 0
											{
												var pg;
												pg = 10
												global.gold += pg;
												txt_gold = "+" + string(pg) + "©";
												txt_cash = "";
												ini_write_string("Sounds", "sound_on_g", string(global.gold));
												ini_write_string("Sounds", "sound_false_c", string(global.cash));
											}
											else
											{
												var pg;
												pg = 5;
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
								#endregion
							#endregion
						}
					}
				#endregion
				#region Какой ранг
					var star_now, star_need, shield_i, skul_i, go5;
					shield_i = 0;
					skul_i   = 15;
					#region Звезды ранга
						star_now = global.rank_stars; star_need = 2; shield_i = 0; skul_i = 15; 
						if global.rank_stars <= 70
							{ star_now = global.rank_stars - 69; star_need = -1; shield_i = 3; skul_i = 0; }
						if global.rank_stars < 69
							{ star_now = global.rank_stars - 63; star_need = 6; shield_i = 2; skul_i = 1; }
						if global.rank_stars < 63
							{ star_now = global.rank_stars - 57; star_need = 6; shield_i = 2; skul_i = 2; }
						if global.rank_stars < 57
							{ star_now = global.rank_stars - 51; star_need = 6; shield_i = 2; skul_i = 3; }
						if global.rank_stars < 51
							{ star_now = global.rank_stars - 46; star_need = 5; shield_i = 2; skul_i = 4; }
						if global.rank_stars < 46
							{ star_now = global.rank_stars - 41; star_need = 5; shield_i = 2; skul_i = 5; }
						if global.rank_stars < 41
							{ star_now = global.rank_stars - 36; star_need = 5; shield_i = 1; skul_i = 6; }
						if global.rank_stars < 36
							{ star_now = global.rank_stars - 31; star_need = 5; shield_i = 1; skul_i = 7; }
						if global.rank_stars < 31
							{ star_now = global.rank_stars - 26; star_need = 5; shield_i = 1; skul_i = 8; }
						if global.rank_stars < 26
							{ star_now = global.rank_stars - 21; star_need = 5; shield_i = 1; skul_i = 9; }
						if global.rank_stars < 21
							{ star_now = global.rank_stars - 16; star_need = 5; shield_i = 1; skul_i = 10; }
						if global.rank_stars < 16
							{ star_now = global.rank_stars - 12; star_need = 4; shield_i = 0; skul_i = 11; }
						if global.rank_stars < 12
							{ star_now = global.rank_stars - 8; star_need = 4; shield_i = 0; skul_i = 12; }
						if global.rank_stars < 8
							{ star_now = global.rank_stars - 5; star_need = 3; shield_i = 0; skul_i = 13; }
						if global.rank_stars < 5
							{ star_now = global.rank_stars - 2; star_need = 3; shield_i = 0; skul_i = 14; }
						if global.rank_stars < 2
							{ star_now = global.rank_stars; star_need = 2; shield_i = 0; skul_i = 15; }
					#endregion
					#region Переменные звезд ранга
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
							{
								g_rank_type = 1;
								g_skul_y = 0;
								g_star_yn = star_now;
								g_star_yy[g_star_yn] = 0;
							}
							if whowin = 2 && star_now - 1 >= 0
							{
								g_rank_type = 2;
								g_star_yn = star_now;
								g_star_yy[g_star_yn] = 0;
							}
							if whowin = 1 && star_now + 1 + winstreak < star_need
							{
								g_rank_type = 3;
								g_star_yn = star_now + 1;
								g_star_yy[g_star_yn]= -global.height / 2 - 200;
							}
							if whowin = 1 && star_now + 1 + winstreak >= star_need
							{
								g_rank_type = 4;
								g_skul_y = 0;
								g_star_yn = star_now + 1;
								g_star_yy[g_star_yn] = -global.height / 2 - 200;
							}
						}
					#endregion
				#endregion
				#region Ранг врага
					if g_enemy_change = 0
					{
						g_enemy_change = choose(0, 0, 1);
						if g_enemy_change = 1
						{
							if whowin = 1
							{
								global.enemy_rank -= 1;
							}
							else
							{
								global.enemy_rank += 1;
							}
							if global.enemy_rank > 15
							{
								global.enemy_rank = 15;
							}
							if global.enemy_rank < 0
							{
								global.enemy_rank = 0;
							}
						}
					}
				#endregion
				#region Стадия 1
					if g_rank_stage = 1	
					{
						if g_rank_s  < 1
						{
							g_rank_s += 0.21;
						}
						else
						{
							g_rank_s = 1;
							g_rank_stage = 2;
						}
					}
				#endregion
				#region Стадия 2
					if g_rank_stage = 2
					{
						if g_star_a  < 1
						{
							g_star_a  += 0.1;
						}
						else
						{
							g_rank_stage = 3;
						}
					}
				#endregion
				#region Стадия 3
					if g_rank_stage = 3
					{
						#region Тип ранга 1
							if g_rank_type = 1
							{
								if global.rank_stars >= 69
								{
									global.legend_rank += irandom_range(1, 10);
										if global.legend_rank > 100
										{
											global.legend_rank += 1;
										}
									ini_open("Music.ini");
										ini_write_string("Eho", "eho", string(global.legend_rank));
									ini_close();
								}
								g_rank_stage = 4;
							}
						#endregion
						#region Тип ранга 2
							if g_rank_type = 2
							{
								if g_star_yy[g_star_yn] = 0
								{
									if global.rank_stars != 0 && global.rank_stars != 16
									&& global.rank_stars != 41 && global.rank_stars != 69
									&& global.rank_stars != 70
									{ 
										global.rank_stars -= 1;
									}
									else
									{
										g_message = 1;
									}
									if global.rank_stars >= 69
									{
										global.legend_rank += irandom_range(1, 10);
											if global.legend_rank > 100
											{
												global.legend_rank += 1;
											}
										ini_open("Music.ini");
											ini_write_string("Eho", "eho", string(global.legend_rank));
										ini_close();
									}
									ini_open("Music.ini");
										ini_write_string("Ranks", "ranks", string(global.rank_stars));
									ini_close();
								}
								if g_star_yy[g_star_yn] < 300
								{
									g_star_yy[g_star_yn] += 15;
								}
								else
								{
									g_rank_stage = 6;
								}
							}
						#endregion
						#region Тип ранга 3
							if g_rank_type = 3
							{
								if g_star_yy[g_star_yn] != 0
								{
									if global.rank_stars < 69
									{
										global.rank_stars += 1 + winstreak;
									}
									else
									{
										if global.rank_stars = 69 or global.rank_stars = 70
										{
											global.legend_rank -= irandom_range(1, 10);
											if global.legend_rank < 1
											{
												global.legend_rank = 1;
											}
											ini_open("Music.ini");
												ini_write_string("Eho", "eho", string(global.legend_rank));
											ini_close();
										}
									}
									g_star_ss[g_star_yn] = 30;
									if global.sound
									{
										audio_play_sound(sd_star, 0, 0);
									}
									ini_open("Music.ini");
										ini_write_string("Ranks", "ranks", string(global.rank_stars));
									ini_close();
								}
								g_star_yy[g_star_yn] = 0;
								if g_star_ss[g_star_yn] > 1
								{
									g_star_ss[g_star_yn] -= 3;
								}
								else
								{
									g_star_ss[g_star_yn] = 1;
									g_rank_stage = 6;
								}
							}
						#endregion
						#region Тип ранга 4
							if g_rank_type = 4
							{
								if global.sound
								{
									audio_play_sound(sd_star, 0, 0);
								}
								if global.rank_stars < 69
								{
									global.rank_stars += 1 + winstreak;
								}
								else
								{
									if global.rank_stars = 69 or global.rank_stars = 70
									{
										global.legend_rank -= irandom_range(1, 10);
										if global.legend_rank < 1
										{
											global.legend_rank = 1;
										}
										ini_open("Music.ini");
											ini_write_string("Eho", "eho", string(global.legend_rank));
										ini_close();
									}
								}
								g_rank_stage = 4;
							}
						#endregion
					}
				#endregion
				#region Стадия 4
					if g_rank_stage = 4
					{
						if g_rank_type = 1
						{
							if g_skul_y < global.height / 2 + 200
							{
								g_skul_y += 20;
							}
							else
							{
								if global.rank_stars != 0 && global.rank_stars != 16
								&& global.rank_stars != 41 && global.rank_stars != 69
								&& global.rank_stars != 70
									{
										global.rank_stars -= 1;
									}
									else
									{
										g_message = 1;
									}
								g_rank_stage = 5;
								g_skul_y = 0;
								g_skul_s = 0;
								ini_open("Music.ini");
									ini_write_string("Ranks", "ranks", string(global.rank_stars));
								ini_close();
							}
						}
						if g_rank_type = 4
						{
							if g_skul_s > 0
							{
								g_skul_s -= 0.1;
							}
							else
							{
								g_rank_stage = 5;
								g_skul_y = 0;
								g_skul_s = 20;
							}
						}
					}
				#endregion
				#region Стадия 5
					if g_rank_stage = 5
					{
						if g_rank_type = 1
						{
							if g_skul_s < 1
							{
								g_skul_s += 0.2;
							}
							else
							{
								g_skul_s = 1;
								g_rank_stage = 6;
							}
						}
						if g_rank_type = 4
						{
							if g_skul_s > 1
							{
								g_skul_s -= 2;
							}
							else
							{
								g_skul_s = 1;
								g_rank_stage = 6;
							}
						}
					}
				#endregion
				#region Стадия 6
					if g_rank_stage = 6
					{
						ini_open("Music.ini");
							#region Тип 1
								if g_rank_type = 1
								{
									if roundskul_n[3] != 0
									{
										var pg;
										pg = 10;
										global.gold += pg;
										txt_gold = "+" + string(pg) + "©";
										txt_cash = "";
										ini_write_string("Sounds", "sound_on_g", string(global.gold));
									}
								}
							#endregion
							#region Тип 2
								if g_rank_type = 2
								{
									if roundskul_n[3] != 0
									{
										var pg;
										pg = 10;
										global.gold += pg;
										txt_gold = "+" + string(pg) + "©";
										txt_cash = "";
										ini_write_string("Sounds", "sound_on_g", string(global.gold));
									}
								}
							#endregion
							#region Тип 3
								if g_rank_type = 3
								{
									if roundskul_n[3] = 0
									{
										var pg, pc, pc1;
										pg = 10;
										global.gold += pg;
										pc  = 2;
										pc1 = 0;
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
										ini_write_string("Sounds", "sound_on_g", string(global.gold));
										ini_write_string("Sounds", "sound_false_c", string(global.cash));
									}
									else
									{
										var pg, pc, pc1;
										pg = 5;
										global.gold += pg;
										pc  = 1;
										pc1 = 0;
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
										ini_write_string("Sounds", "sound_on_g", string(global.gold));
										ini_write_string("Sounds", "sound_false_c", string(global.cash));
									}
								}
							#endregion
							#region Тип 4
								if g_rank_type = 4
								{
									if roundskul_n[3] = 0
									{
										var pg, pc, pc1;
										pg = 10;
										global.gold += pg;
										pc  = 2;
										pc1 = 0;
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
										ini_write_string("Sounds", "sound_on_g", string(global.gold));
										ini_write_string("Sounds", "sound_false_c", string(global.cash));
									}
									else
									{
										var pg, pc, pc1;
										pg = 5;
										global.gold += pg;
										pc  = 1;
										pc1 = 0;
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
										ini_write_string("Sounds", "sound_on_g", string(global.gold));
										ini_write_string("Sounds", "sound_false_c", string(global.cash));
									}
								}
							#endregion
						ini_close();
						#region Звук победы
							if global.quick = 0 && whowin = 1
							{
								if global.sound
								{
									audio_play_sound(sd_win, 2, 0);
								}
							}
						#endregion
						g_rank_stage = 7;
					}
				#endregion
				#region Стадия 7
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
						{
							draw_text_transformed_t(640, global.height - 60 + fin_y, "ВЕРНУТЬСЯ В МЕНЮ", 0.2, 0.2, 0, global.color_white, c_black);
						}
						else
						{
							draw_text_transformed_t(640, global.height - 60 + fin_y, "TAP TO GO MENU", 0.2, 0.2, 0, global.color_white, c_black);
						}
						if mouse_check_button_pressed(mb_left)
						{
							global.p_totem[1] = -1;
							global.p_totem[2] = -1;
							global.p_totem[3] = -1;
							if room_gt = 0
							{
								room_goto_t("menu");
								room_gt = 1;
							}
						}
					}
				#endregion
				#region Стадия 8
					if g_rank_stage = 8
					{
						draw_set_font(global.game_font);
						if os_get_language() = "ru"
						{
							draw_text_transformed_t(640, global.height - 60 + fin_y, "ВЕРНУТЬСЯ В МЕНЮ", 0.2, 0.2, 0, global.color_white, c_black);
						}
						else
						{
							draw_text_transformed_t(640, global.height - 60 + fin_y, "TAP TO GO MENU", 0.2, 0.2, 0, global.color_white, c_black);
						}
					}
				#endregion
				#region Победа, реквест, запись в ини реквеста
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
										requestReview();
										GoogleAnalytics_SendEvent("REQUEST","Игрок нажал на отзыв!");
										global.request = 1;
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
						{
							GoogleAnalytics_SendEvent("WIN-LOSE","Игрок проиграл!");
						}
					}
				#endregion
				#region Не быстрая игра
					draw_set_font(global.game_font);
					if global.quick = 0
					{
						if txt_cash = ""
						{
							draw_text_transformed_t(640, global.height - 150 + fin_y, txt_gold, 0.18, 0.18, 0, global.gold_color, c_black);
						}
						else
						{
							draw_text_transformed_t(640 - (string_width(txt_gold) * 0.18 / 2 - 5) + (string_width(txt_gold) - string_width(txt_cash)) * 0.18 / 2, global.height - 150 + fin_y, txt_gold, 0.18, 0.18, 0, global.gold_color, c_black);	
							draw_text_transformed_t(640 + (string_width(txt_cash) * 0.18 / 2 + 5) + (string_width(txt_gold) - string_width(txt_cash)) * 0.18 / 2, global.height - 150 + fin_y, txt_cash, 0.18, 0.18, 0, global.cash_color, c_black);
						}
					}
				#endregion
				#region Отрисовка ранга
					if g_rank_stage >= 1
					{
						if global.quick = 0
						{
							#region Ранг
								draw_sprite_ext(s_rank_shield, 0, 640, global.height / 2 - 50 + 15, 1 * g_rank_s, 1 * g_rank_s, 0, c_black, 0.5);
								draw_sprite_ext(s_rank_shield, shield_i, 640, global.height / 2 - 50, 1 * g_rank_s, 1 * g_rank_s, 0, c_white, 1);
								if skul_i <= 3
								{
									draw_sprite_ext_t(s_rank_skul_1, anim_skul, 640, global.height / 2 - 50 + 15, g_rank_s, g_rank_s, 0 + restart_angle, c_white, 1, c_white, c_black);
								}
								if os_get_language() != "ru"
								{
									if skul_i = 0
									{
										draw_text_transformed_t(640, global.height / 2 - 50 + 15, "LEGEND", 0.2, 0.2, 0, global.color_white, c_black);
										draw_text_transformed_t(640, global.height / 2 - 50 + 15 + 5 + string_height(global.legend_rank) * 0.2 / 2, string(global.legend_rank), 0.2, 0.2, 0, global.color_white, c_black);
									}
								}
								else
								{
									if skul_i = 0
									{
										draw_text_transformed_t(640, global.height / 2 - 50 + 15, "ЛЕГЕНДА", 0.2, 0.2, 0, global.color_white, c_black);
										draw_text_transformed_t(640, global.height / 2 - 50 + 15 + 5 + string_height(global.legend_rank) * 0.2 / 2, string(global.legend_rank), 0.2, 0.2, 0, global.color_white, c_black);
									}
								}
								if g_skul_s = 1
								{
									draw_sprite_ext(s_rank_skul, skul_i, 640, g_skul_y + global.height / 2 - 50 + 15, 1 * g_rank_s * g_skul_s, 1 * g_rank_s * g_skul_s, 0, c_black, 0.5);
									draw_sprite_ext(s_rank_skul, skul_i, 640, g_skul_y + global.height / 2 - 50, 1 * g_rank_s * g_skul_s, 1 * g_rank_s * g_skul_s, 0, c_white, 1);	
								}
								if g_rank_stage >= 2 && (g_rank_stage != 4 or g_rank_type != 1)
								{
									draw_set_alpha(g_star_a );
									#region Нужно 2
										if star_need = 2
										{
											draw_sprite_ext_t(s_rank_star, 0, 640 - 30, g_skul_y + global.height / 2 + 35, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
											draw_sprite_ext_t(s_rank_star, 0, 640 + 30, global.height / 2 + 35, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
											if star_now > 0
											{
												draw_sprite_ext_t(s_rank_star, 0, 640 - 30, g_star_yy[1] + global.height / 2 + 35, 0.3 * g_star_ss[1], 0.3 * g_star_ss[1], 0, global.color_white, 1, global.color_white, c_black);
											}
											if star_now > 1
											{
												draw_sprite_ext(s_rank_star, 0, 640 + 30, g_star_yy[2] + global.height / 2 + 35, 0.3 * g_star_ss[2], 0.3 * g_star_ss[2], 0, global.color_white, 1);
											}
										}
									#endregion
									#region Нужно 3
										if star_need = 3
										{
											draw_sprite_ext_t(s_rank_star, 0, 640 - 70, global.height / 2, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
											draw_sprite_ext_t(s_rank_star, 0, 640, global.height / 2 + 70, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
											draw_sprite_ext_t(s_rank_star, 0, 640 + 70, global.height / 2, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
											if star_now > 0
											{
												draw_sprite_ext_t(s_rank_star, 0, 640 - 70, g_star_yy[1] + global.height / 2, 0.3 * g_star_ss[1], 0.3 * g_star_ss[1], 0, global.color_white, 1, global.color_white, c_black);
											}
											if star_now > 1
											{
												draw_sprite_ext_t(s_rank_star, 0, 640, g_star_yy[2] + global.height / 2 + 70, 0.3 * g_star_ss[2], 0.3 * g_star_ss[2], 0, global.color_white, 1, global.color_white, c_black);
											}
											if star_now > 2
											{
												draw_sprite_ext(s_rank_star, 0, 640 + 30, g_star_yy[3] + global.height / 2 + 35, 0.3 * g_star_ss[3], 0.3 * g_star_ss[3], 0, c_white, 1);
											}
										}
									#endregion
									#region Нужно 4
										if star_need = 4
											{
											draw_sprite_ext_t(s_rank_star, 0, 640 - 110, global.height / 2 - 40, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
											draw_sprite_ext_t(s_rank_star, 0, 640 - 50, global.height / 2 + 20, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
											draw_sprite_ext_t(s_rank_star, 0, 640 + 50, global.height / 2 + 20, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
											draw_sprite_ext_t(s_rank_star, 0, 640 + 110, global.height / 2 - 40, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
											if star_now > 0
												{ draw_sprite_ext_t(s_rank_star, 0, 640 - 110, g_star_yy[1] + global.height / 2 - 40, 0.3 * g_star_ss[1], 0.3 * g_star_ss[1], 0, global.color_white, 1, global.color_white, c_black); }
											if star_now > 1
												{ draw_sprite_ext_t(s_rank_star, 0, 640 - 50, g_star_yy[2] + global.height / 2 + 20, 0.3 * g_star_ss[2], 0.3 * g_star_ss[2], 0, global.color_white, 1, global.color_white, c_black); }
											if star_now > 2
												{ draw_sprite_ext_t(s_rank_star, 0, 640 + 50, g_star_yy[3] + global.height / 2 + 20, 0.3 * g_star_ss[3], 0.3 * g_star_ss[3], 0, global.color_white, 1, global.color_white, c_black); }
											if star_now > 3
												{ draw_sprite_ext_t(s_rank_star, 0, 640 + 110, g_star_yy[4] + global.height / 2 - 40, 0.3 * g_star_ss[4], 0.3 * g_star_ss[4], 0, global.color_white, 1, global.color_white, c_black); }
											}
									#endregion
									#region Нужно 5
										if star_need = 5
											{
											draw_sprite_ext_t(s_rank_star, 0, 640 - 100, global.height / 2 - 45, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
											draw_sprite_ext_t(s_rank_star, 0, 640 - 60, global.height / 2 + 15, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
											draw_sprite_ext_t(s_rank_star, 0, 640, global.height / 2 + 60, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
											draw_sprite_ext_t(s_rank_star, 0, 640 + 60, global.height / 2 + 15, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
											draw_sprite_ext_t(s_rank_star, 0, 640 + 100, global.height / 2 - 45, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
											if star_now > 0
												{ draw_sprite_ext_t(s_rank_star, 0, 640 - 100, g_star_yy[1] + global.height / 2 - 45, 0.3 * g_star_ss[1], 0.3 * g_star_ss[1], 0, global.color_white, 1, global.color_white, c_black); }
											if star_now > 1
												{ draw_sprite_ext_t(s_rank_star, 0, 640 - 60, g_star_yy[2] + global.height / 2 + 15, 0.3 * g_star_ss[2], 0.3 * g_star_ss[2], 0, global.color_white, 1, global.color_white, c_black); }
											if star_now > 2
												{ draw_sprite_ext_t(s_rank_star, 0, 640, g_star_yy[3] + global.height / 2 + 60, 0.3 * g_star_ss[3], 0.3 * g_star_ss[3], 0, global.color_white, 1, global.color_white, c_black); }
											if star_now > 3
												{ draw_sprite_ext_t(s_rank_star, 0, 640 + 60, g_star_yy[4] + global.height / 2 + 15, 0.3 * g_star_ss[4], 0.3 * g_star_ss[4], 0, global.color_white, 1, global.color_white, c_black); }
											if star_now > 4
												{ draw_sprite_ext_t(s_rank_star, 0, 640 + 100, g_star_yy[5] + global.height / 2 - 45, 0.3 * g_star_ss[5], 0.3 * g_star_ss[5], 0, global.color_white, 1, global.color_white, c_black); }
											}
									#endregion
									#region Нужно 6
										if star_need = 6
											{
											draw_sprite_ext_t(s_rank_star, 0, 640 - 120, global.height / 2 - 30, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
											draw_sprite_ext_t(s_rank_star, 0, 640 - 80, global.height / 2 + 20, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
											draw_sprite_ext_t(s_rank_star, 0, 640 - 40, global.height / 2 + 60, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
											draw_sprite_ext_t(s_rank_star, 0, 640 + 40, global.height / 2 + 60, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
											draw_sprite_ext_t(s_rank_star, 0, 640 + 80, global.height / 2 + 20, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
											draw_sprite_ext_t(s_rank_star, 0, 640 + 120, global.height / 2 - 30, 0.3 * g_star_s, 0.3 * g_star_s, 0, c_black, 0.5, global.color_white, c_black);
											if star_now > 0
												{ draw_sprite_ext_t(s_rank_star, 0, 640 - 120, g_star_yy[1] + global.height / 2 - 30, 0.3 * g_star_ss[1], 0.3 * g_star_ss[1], 0, global.color_white, 1, global.color_white, c_black); }
											if star_now > 1
												{ draw_sprite_ext_t(s_rank_star, 0, 640 - 80, g_star_yy[2] + global.height / 2 + 20, 0.3 * g_star_ss[2], 0.3 * g_star_ss[2], 0, global.color_white, 1, global.color_white, c_black); }
											if star_now > 2
												{ draw_sprite_ext_t(s_rank_star, 0, 640 - 40, g_star_yy[3] + global.height / 2 + 60, 0.3 * g_star_ss[3], 0.3 * g_star_ss[3], 0, global.color_white, 1, global.color_white, c_black); }
											if star_now > 3
												{ draw_sprite_ext_t(s_rank_star, 0, 640 + 40, g_star_yy[4] + global.height / 2 + 60, 0.3 * g_star_ss[4], 0.3 * g_star_ss[4], 0, global.color_white, 1, global.color_white, c_black); }
											if star_now > 4
												{ draw_sprite_ext_t(s_rank_star, 0, 640 + 80, g_star_yy[5] + global.height / 2 + 20, 0.3 * g_star_ss[5], 0.3 * g_star_ss[5], 0, global.color_white, 1, global.color_white, c_black); }
											if star_now > 5
												{ draw_sprite_ext_t(s_rank_star, 0, 640 + 120, g_star_yy[6] + global.height / 2 - 30, 0.3 * g_star_ss[6], 0.3 * g_star_ss[6], 0, global.color_white, 1, global.color_white, c_black); }
											}
									#endregion
									draw_set_alpha(1);
								}
								if skul_i != 0
								{
									draw_text_transformed_t(640, global.height / 2 - 150, string(skul_i), 0.27 * g_rank_s, 0.27 * g_rank_s, 5, global.color_white, c_black);
								}
								if g_skul_s != 1
								{
									draw_sprite_ext(s_rank_skul, skul_i, 640, g_skul_y + global.height / 2 - 50 + 15, 1 * g_rank_s * g_skul_s, 1 * g_rank_s * g_skul_s, 0, c_black, 0.5);
									draw_sprite_ext(s_rank_skul, skul_i, 640, g_skul_y + global.height / 2 - 50, 1 * g_rank_s * g_skul_s, 1 * g_rank_s * g_skul_s, 0, c_white, 1);	
								}
							#endregion
						}
						else
						{
							#region Солнце
								draw_sprite_ext(s_sunmoon, 0, 640, global.height / 2 - 50 + 15, 0.5, 0.5, 0, c_black, 0.5);
								draw_sprite_ext_t(s_sunmoon, 0, 640, global.height / 2 - 50, 0.5, 0.5, 0, c_white, 1, c_white, c_black);
								if global.pvp = 0
								{
									draw_text_transformed_t(640, global.height / 2 - 50, txt_gold, 0.18, 0.18, 0, global.gold_color, c_black);
								}
							#endregion
						}
					}
				#endregion
				#region Надпись, если нет потери звезды
					if g_message = 1
					{
						draw_set_font(global.game_font);
						if os_get_language() = "ru"
						{
							draw_text_transformed_t(640, global.height - 180 + fin_y, "ВЫ НЕ ТЕРЯЕТЕ ЗВЕЗДУ\nНА ЭТОМ РАНГЕ", 0.15, 0.15, 0, global.cash_color, c_black);
						}
						else
						{
							draw_text_transformed_t(640, global.height - 180 + fin_y, "YOU DO NOT LOSE\nA STAR ON THIS RANK", 0.15, 0.15, 0, global.cash_color, c_black);
						}
					}
				#endregion
				#region Надпись при Винстрике
					if winstreak > 0 && whowin = 1 && global.quick = 0
					{
						draw_set_font(global.game_font);
						if os_get_language() = "ru"
						{
							draw_text_transformed_t(640, global.height - 180 + fin_y - 40, "СЕРИЯ ПОБЕД!", 0.15, 0.15, 0, c_orange, c_black);
						}
						else
						{
							draw_text_transformed_t(640, global.height - 180 + fin_y - 40, "WIN STREAK!", 0.15, 0.15, 0, c_orange, c_black);
						}
					}
				#endregion
			}
		#endregion
		#region Снижение скорости фона в конце игры
			if o_control.back_spd > 0
			{
				o_control.back_spd -= 0.05;
			}
		#endregion
		#region Запись о выполнении квеста и сообшение о выполнении
			if g_rank_stage = 8 or g_rank_stage = 7
			{
				#region Квесты
					var peponka;
					peponka = 0;
					for(i = 1; i <= 3; i ++)
					{
						if global.quests_a[i] = 1
						{
							if global.quests_n_now[i] >= global.quests_n_all[i]
							{
								draw_set_alpha(0.25);
								draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
								draw_set_alpha(1);
								draw_sprite_ext(s_light, 0, 640, global.height / 2, 0.5, 0.5, 0, c_white, 0.7);
								draw_sprite_ext(s_quests_lists, global.quests_t[i], 640, global.height / 2 - 192 * 0.7, 0.7, 0.7, 0, c_black, 0.5);
								draw_sprite_ext_t(s_quests_lists, global.quests_t[i], 640, global.height / 2 - 192 * 0.7, 0.7, 0.7, 0, c_white, 1, c_white, c_black);
								draw_text_ext_transformed_t(640, global.height / 2 - 192 * 0.7 + 200, global.quests_d[i], -1, 2000, 0.08, 0.08, 0, global.color_white, c_black);
								if os_get_language() = "ru"
								{
									draw_text_ext_transformed_t(640, global.height / 2 - 192 * 0.7, "ВЫПОЛНЕНО!", -1, 2000, 0.15, 0.17, 12, c_orange, c_black);
								}
								else
								{
									draw_text_ext_transformed_t(640, global.height / 2 - 192 * 0.7, "COMPLITED!", -1, 2000, 0.15, 0.17, 12, c_orange, c_black);
								}
								if global.quests_pt[i] = "©"
								{
									draw_text_ext_transformed_t(640, global.height / 2 - 192 * 0.7 + 280, string(global.quests_p[i]) + string(global.quests_pt[i]), -1, 2000, 0.3, 0.3, 0, global.gold_color, c_black);
								}
								else
								{
									draw_text_ext_transformed_t(640, global.height / 2 - 192 * 0.7 + 280, string(global.quests_p[i]) + string(global.quests_pt[i]), -1, 2000, 0.3, 0.3, 0, global.cash_color, c_black);
								}
								peponka = 1;
								if mouse_check_button_released(mb_left)
								{
									peponka = 0;
									global.quests_a[i] = 0;
									if global.quests_pt[i] = "©"
									{
										global.gold += global.quests_p[i];
									}
									else
									{
										global.cash += global.quests_p[i];
									}
									ini_open("Music.ini");
										ini_write_string("Qual", "qual_a_" + string(i), "0");
										ini_write_string("Sounds", "sound_on_g", string(global.gold));
										ini_write_string("Sounds", "sound_false_c", string(global.cash));
										if global.quests_t[i] = 18
										{
											for(j = 2; j <= 7; j ++)
											{
												ini_write_string("Var", "v" + string(j), "0");
												global.varr[j] = ini_read_real("Var", "v" + string(i), 0);
											}
										}
									ini_close();
									if global.sound
									{
										audio_play_sound(sd_gold, 3, 0);
									}
									io_clear();
								}
							}
						}
					}
				#endregion
				#region Переход в меню по нажатию
					if mouse_check_button_pressed(mb_left) && peponka = 0
					{
						global.p_totem[1] = -1;
						global.p_totem[2] = -1;
						global.p_totem[3] = -1;
						if room_gt = 0
						{
							room_goto_t("menu");
							room_gt = 1;
						}
					}
				#endregion
			}
		#endregion
	}
#endregion
#region Хелсбар
	#region Временные переменные
		var gui_size,
		h_y, h_x, h_s, h_y1,
		pers, dop, e_pers, a_maxhp, a_e_maxhp;
		gui_size = 0.45;
		h_x  = 40;
		h_y  = 45;
		h_s  = 10;
		h_y1 = 10;
	#endregion
	#region Границы хп
		if hp > maxhp
		{
			maxhp = hp;
		}
		if e_hp > e_maxhp
		{
			e_maxhp = e_hp;
		}
		if hp < 0
		{
			hp = 0;
		}
		if e_hp < 0
		{
			e_hp = 0;
		}
	#endregion
	#region Пополнение хп
		if go_hp = 1
		{
			if hp < maxhp
			{
				hp += maxhp / 20;
			}
			if hp > maxhp
			{
				hp = maxhp;
			}
			if e_hp < e_maxhp
			{
				e_hp += e_maxhp / 20;
			}
			if e_hp > e_maxhp
			{
				e_hp = e_maxhp;
			}
			if hp = maxhp && e_hp = e_maxhp
			{
				go_hp = 0;
			}
		}
	#endregion
	#region Таймер и размер
		#region Игрок
			if health_hp != hp
			{
				if health_hp > hp
				{
					if health_timer > 0
					{
						health_timer -= 1;
					}
					else
					{
						health_hp -= 10;
						if health_hp <= hp
						{
							health_hp    = hp;
							health_timer = 20;
						}
					}
				}
				if health_hp < hp
				{
					health_hp = hp;
				}
				health_scale = 1.25;
			}
			else
			{
				health_scale = 1;
			}
		#endregion
		#region Враг
			if health_e_hp != e_hp
			{
				if health_e_hp > e_hp
				{
					if health_e_timer > 0
					{
						health_e_timer -= 1;
					}
					else
					{
						health_e_hp -= 10;
						if health_e_hp <= e_hp
						{
							health_e_hp    = e_hp;
							health_e_timer = 20;
						}
					}
				}
				if health_e_hp < e_hp
				{
					health_e_hp = e_hp;
				}
				health_e_scale = 1.25;
			}
			else
			{
				health_e_scale = 1;
			}
		#endregion
	#endregion
	#region Анимация черепка
		if anim_skul < 3
		{
			anim_skul += 0.5;
		}
		else
		{
			anim_skul = 0;
		}
	#endregion
	#region Относительные переменные
		pers      = abs(hp / maxhp);
		dop       = maxhp / 100;
		e_pers    = abs(e_hp / e_maxhp);
		a_maxhp   = maxhp;
		a_e_maxhp = e_maxhp;
	#endregion
	#region Подстройка размеров относительно хп игроков
		if maxhp > e_maxhp
		{
			if maxhp > 1350
			{
				e_maxhp = e_maxhp / maxhp * 1350;
				maxhp   = 1350;
			}
		}
		else
		{
			if e_maxhp > 1350
			{
				maxhp   = maxhp / e_maxhp * 1350;
				e_maxhp = 1350;
			}
		}
		health_hp   = health_hp * maxhp / a_maxhp;
		health_e_hp = health_e_hp * e_maxhp / a_e_maxhp;
	#endregion	
	#region ОТРИСОВКА
		#region Хелсбар Игрока
			#region Плашка
				draw_sprite_ext_t(s_healthbar_hp, 0, h_x, h_y + h_y1, -gui_size * (0.20 + 0.8 * (maxhp / 1350)), gui_size * 0.4, 0, global.color_white, 1, c_white, c_black);
			#endregion
			#region Красный шлейф
				draw_set_color(c_red);
				draw_rectangle(h_x + 20, h_y - h_s - 10 + h_y1, h_x + ((1205 - 35) * gui_size * (0.20 + 0.8 * (maxhp / 1350)) - 20) * health_hp / maxhp + 20, h_y - h_s / 8 - 10 + h_y1, 0);
			#endregion
			#region Полоса хп
				draw_set_color(global.color_white);
				draw_rectangle(h_x + 20, h_y - h_s - 10 + h_y1, h_x + ((1205 - 35) * gui_size * (0.20 + 0.8 * (maxhp / 1350)) - 20) * pers + 20, h_y - h_s / 8 - 10 + h_y1, 0);
			#endregion
			#region Тень полоcы хп
				draw_set_alpha(0.3);
				draw_set_color(c_black);
				draw_rectangle(h_x + 20, h_y - h_s / 3 - 10 + h_y1, h_x + ((1205 - 35) * gui_size * (0.20 + 0.8 * (maxhp / 1350)) - 20) + 20, h_y - h_s / 8 - 10 + h_y1, 0);
				draw_set_alpha(1);
			#endregion
			#region Определение ранга
				var skul, rank, rank_i, rank_yy;
				rank_yy = -65;
				skul = global.player_rank;
				rank = string(global.player_rank);
				if global.player_rank <=5
				{
					rank_i = 2;
				}
				if global.player_rank > 5 && global.player_rank <= 10
				{
					rank_i = 1;
				}
				if global.player_rank > 10
				{
					rank_i = 0;
				}
				if global.player_rank = 0
				{
					rank_i = 3;
					if os_get_language() != "ru"
					{
						rank = "LEGEND";
					}
					else
					{
						rank = "ЛЕГЕНДА";
					}
					rank_yy = -45;
				}
			#endregion
			#region Отрисовка черепа ранга
				draw_set_font(global.game_font);
				if global.quick = 0
				{
					draw_sprite_ext_t(s_rank_shield, rank_i, 10 + sprite_get_width(s_rank_shield) * gui_size / 2, h_y - 5 + h_y1, gui_size * 0.8 * health_scale, gui_size * 0.8 * health_scale, 0 + restart_angle, c_white, 1, c_white, c_black);
					if global.player_rank <= 3
					{
						draw_sprite_ext_t(s_rank_skul_1, anim_skul, 10 + sprite_get_width(s_rank_shield) * gui_size / 2, h_y - 5 + h_y1, gui_size * 0.8 * health_scale, gui_size * 0.8 * health_scale, 0 + restart_angle, c_white, 1, c_white, c_black);
					}
					draw_sprite_ext_t(s_rank_skul, skul, 10 + sprite_get_width(s_rank_shield) * gui_size / 2, h_y - 5 + h_y1, gui_size * 0.8 * health_scale, gui_size * 0.8 * health_scale, 0 + restart_angle, c_white, 1, c_white, c_black);
					draw_text_transformed_t(10 + sprite_get_width(s_rank_shield) * gui_size / 2, h_y + 35 + h_y1 + rank_yy, string(rank), 0.09 * health_scale, 0.09 * health_scale, 0, global.color_white, c_black);
				}
				else
				{
					draw_sprite_ext_t(s_sunmoon, 0, 10 + sprite_get_width(s_rank_shield) * gui_size / 2, h_y - 5 + h_y1, gui_size * 0.8 * health_scale * 0.6, gui_size * 0.8 * health_scale * 0.6, 0 + restart_angle, c_white, 1, c_white, c_black);
				}
			#endregion
			#region Отрисовка никнейма игрока
				draw_text_transformed_t(10 + sprite_get_width(s_rank_shield) * gui_size + string_width(string_upper(global.player_name)) * 0.1 / 2, h_y + 80 - 2 - sprite_get_height(s_healthbar_hp) * gui_size * 0.8 + h_y1, string_upper(global.player_name), 0.1, 0.1, 0, global.color_white, c_black);
			#endregion
			#region Отрисовка черепков дуэли
				for(i = 1; i <= 3; i ++)
				{
					draw_sprite_ext(s_healthbar_table_skul, 0, 640 - 40 + 40 * (i - 1), h_y - 10 + 3, gui_size * 1.5, gui_size * 1.5, 0, c_black, 0.75);
					draw_sprite_ext_t(s_healthbar_table_skul, 0, 640 - 40 + 40 * (i - 1), h_y - roundskul_y[i] - 10, roundskul_s[i] * 1.5, roundskul_s[i] * 1.5, 0, c_white, 1, c_white, c_black);
					if roundskul[i] = 2 && roundskul_n[i] > 0
					{
						draw_sprite_ext_t(s_healthbar_table_x, 0, 640 - 40 + 40 * (i - 1), h_y - roundskul_y[i] - 10, roundskul_s[i] * 0.7 * 1.5, roundskul_s[i] * 0.7 * 1.5, roundskul_xa[i], c_white, 1, c_white, c_black);
					}
				}
				var oneone, onetwo;
				oneone = (roundskul[1] == 1) + (roundskul[2] == 1) + (roundskul[3] == 1);
				onetwo = (roundskul[1] == 2) + (roundskul[2] == 2) + (roundskul[3] == 2);
				draw_set_font(global.game_font);
			#endregion
		#endregion
		#region Хелсбар Противника
			#region Плашка
				draw_sprite_ext_t(s_healthbar_hp, 0, global.width - h_x, h_y + h_y1, gui_size * (0.20 + 0.8 * (e_maxhp / 1350)), gui_size * 0.4, 0, c_white, 1, c_white, c_black);
			#endregion
			#region Красный шлейф
				draw_set_color(c_red);
				draw_rectangle(global.width - h_x - ((1205 - 35) * gui_size * (0.20 + 0.8 * (e_maxhp / 1350)) - 25) * health_e_hp / e_maxhp - 25, h_y - h_s / 8 - 10 + h_y1, global.width - h_x - 25, h_y - h_s - 10 + h_y1, 0);
			#endregion
			#region Полоса хп
				draw_set_color(global.color_white);
				draw_rectangle(global.width - h_x - ((1205 - 35) * gui_size * (0.20 + 0.8 * (e_maxhp / 1350)) - 25) * e_pers - 25, h_y - h_s / 8 - 10 + h_y1, global.width - h_x - 25, h_y - h_s - 10 + h_y1, 0);
			#endregion
			#region Тень полосы хп
				draw_set_alpha(0.3);
				draw_set_color(c_black);
				draw_rectangle(global.width - h_x - ((1205 - 35) * gui_size * (0.20 + 0.8 * (e_maxhp / 1350)) - 25) * e_pers - 25, h_y - h_s / 8 - 10 + h_y1, global.width - h_x - 25, h_y - h_s / 3 - 10 + h_y1, 0);
				draw_set_alpha(1);
				draw_set_font(global.math_font);
				draw_set_halign(fa_right);
				draw_set_color(c_black);
			#endregion
			#region Определение ранга
				var e_skul, e_rank, e_rank_i, e_rank_yy;
				e_skul = global.enemy_rank;
				e_rank_yy = -65;
				e_rank = string(global.enemy_rank);
				if global.enemy_rank <=5
				{
					e_rank_i = 2;
				}
				if global.enemy_rank > 5 && global.enemy_rank <= 10
				{
					e_rank_i = 1;
				}
				if global.enemy_rank > 10
				{
					e_rank_i = 0;
				}
				if global.enemy_rank = 0
				{
					e_rank_i = 3;
					if os_get_language() != "ru"
					{
						e_rank = "LEGEND";
					}
					else
					{
						e_rank = "ЛЕГЕНДА";
					}
					e_rank_yy = -45;
				}
			#endregion
			#region Отрисовка черепа ранга
				if global.quick = 0
				{
					draw_sprite_ext_t(s_rank_shield, e_rank_i, global.width - 10 - sprite_get_width(s_rank_shield) * gui_size / 2, h_y - 5 + h_y1, gui_size * 0.8 * health_e_scale, gui_size * 0.8 * health_e_scale, 0 + restart_angle, c_white, 1, c_white, c_black);
					if global.enemy_rank <= 3
					{
						draw_sprite_ext_t(s_rank_skul_1, anim_skul, global.width - 10 - sprite_get_width(s_rank_shield) * gui_size / 2, h_y - 5 + h_y1, gui_size * 0.8 * health_e_scale, gui_size * 0.8 * health_e_scale, 0 + restart_angle, c_white, 1, c_white, c_black);
					}
					draw_sprite_ext_t(s_rank_skul, e_skul, global.width - 10 - sprite_get_width(s_rank_shield) * gui_size / 2, h_y - 5 + h_y1, gui_size * 0.8 * health_e_scale, gui_size * 0.8 * health_e_scale, 0 + restart_angle, c_white, 1, c_white, c_black);
					draw_set_font(global.game_font);
					draw_text_transformed_t(global.width - (10 + sprite_get_width(s_rank_shield) * gui_size / 2), h_y + 35 + h_y1 + e_rank_yy, string(e_rank), 0.09, 0.09, 0, global.color_white, c_black);
				}
				else
				{
					draw_sprite_ext_t(s_sunmoon, 0, global.width - 10 - sprite_get_width(s_rank_shield) * gui_size / 2, h_y - 5 + h_y1, gui_size * 0.8 * health_e_scale * 0.6, gui_size * 0.8 * health_e_scale * 0.6, 0 + restart_angle, c_white, 1, c_white, c_black);
				}
			#endregion
			#region Отрисовка черепков дуэли
				draw_set_font(global.game_font);
				//if global.jr_e = 1
				//{
				//	if os_get_language() != "ru"
				//	{
				//		draw_text_transformed_t(global.width - (10 + sprite_get_width(s_rank_shield) * gui_size + string_width(string_upper(global.enemy_name)) * 0.1 / 2), h_y + 80 - 2 - sprite_get_height(s_healthbar_hp) * gui_size * 0.8 + h_y1, string_upper(global.enemy_name) + " JR.", 0.1, 0.1, 0, global.color_white, c_black);
				//	}
				//	else
				//	{
				//		draw_text_transformed_t(global.width - (10 + sprite_get_width(s_rank_shield) * gui_size + string_width(string_upper(global.enemy_name) + " МЛ.") * 0.1 / 2), h_y + 80 - 2 - sprite_get_height(s_healthbar_hp) * gui_size * 0.8 + h_y1, string_upper(global.enemy_name) + " МЛ.", 0.1, 0.1, 0, global.color_white, c_black);
				//	}
				//}
				//else
				//{
					draw_text_transformed_t(global.width - (10 + sprite_get_width(s_rank_shield) * gui_size + string_width(string_upper(global.enemy_name)) * 0.1 / 2), h_y + 80 - 2 - sprite_get_height(s_healthbar_hp) * gui_size * 0.8 + h_y1, string_upper(global.enemy_name), 0.1, 0.1, 0, global.color_white, c_black);
				//}
			#endregion
		#endregion
	#endregion
	#region Перевод переменных
		maxhp   = a_maxhp;
		e_maxhp = a_e_maxhp;
	#endregion
	#region Координаты черепков
		if whowin_stage >= 3
		{
			for(j = 1;  j <= 3;  j ++)
			{
				if roundskul[j] > 0
				{
					#region Нет черепка
						if roundskul_n[j] = 0
						{
							if roundskul_y[j] > -100
							{
								roundskul_y[j] -= 10;
							}
							else
							{
								roundskul_n[j] = 1;
							}
							if roundskul_s[j] < 1
							{
								roundskul_s[j] += 0.04;
							}
						}
					#endregion
					#region Черепок победы
						if roundskul_n[j] = 1
						{
							if roundskul_xs[j] < 1
							{
								roundskul_xs[j] += 0.05;
							}	
							if roundskul_xa[j] < 180
							{
								roundskul_xa[j] += 20;
							}
							else
							{
								roundskul_n[j] = 2;
							}
						}
					#endregion
					#region Черепок поражения
						if roundskul_n[j] = 2
						{
							if roundskul_s[j] > gui_size
							{
								roundskul_s[j] -= 0.04;
							}
							else
							{
								roundskul_s[j] = gui_size;
							}
							if roundskul_y[j] < -3
							{
								roundskul_y[j] += 5;
							}
							else
							{
								roundskul_y[j] = -3;
								roundskul_n[j] = 3;
							}
						}
					#endregion
				}
			}	
		}
	#endregion
#endregion
#region Слова при выстреле
	for(i = 0; i <= 2; i ++)
	{
		if dop_i[i] != -1
		{
			#region Движение слова
				if i = 1
				{
					dop_text_x[i] += 2;
					dop_text_y[i] += 4;
				}
				if i = 2
				{
					dop_text_x[i] -= 2;
					dop_text_y[i] += 4;
				}
			#endregion
			#region Изменение размеров и прозрачности слова
				if dop_text_end[i] = 0
				{
					#region Появление, изменение размеров
						if dop_text_xscale[i] < 0.2
						{
							dop_text_xscale[i] += 0.02;
						}
						if dop_text_xscale[i] >= 0.2 && dop_text_xscale[i] < 0.25
						{
							dop_text_xscale[i] += 0.025;
						}
						if dop_text_xscale[i] >= 0.25 && dop_text_xscale[i] < 0.30
						{
							dop_text_xscale[i] += 0.02;
						}
						if dop_text_xscale[i] >= 0.30
						{
							dop_text_end[i] = 1;
						}
					#endregion
				}
				else
				{
					#region Исчезновение, изменение размеров и координат
						if dop_text_xscale[i] > 0
						{
							dop_text_xscale[i] -= 0.05;
						}
						else
						{
							if i = 2
							{
								part_x    = dop_text_x[2];
								part_y    = dop_text_y[2];
								part_n    = 1;
								part_s    = 1;
								part_xspd = abs(part_x - (global.width) * super_now1 / super_need) / 10;
								part_yspd = abs(part_y - global.height + 10) / 10;
							}
							dop_text_end[i]    = 0;
							dop_text_angle[i]  = 0;
							dop_text_xscale[i] = 0;
							dop_text_yscale[i] = 0;
							dop_text_dir[i]    = 1;
							if i = 0
							{
								dop_text_x[i] = 250;
								dop_text_y[i] = global.height / 2 - 150;
							}
							if i = 1
							{
								dop_text_x[i] = 250;
								dop_text_y[i] = global.height / 2 - 150;
							}
							if i = 2
							{
								dop_text_x[i] = global.width - 250;
								dop_text_y[i] = global.height / 2 - 150;
							}
							dop_i[i] = -1;
						}
					#endregion
				}
			#endregion
			#region Изменение угла
				if abs(dop_text_angle[i]) < 30
				{
					dop_text_angle[i] += dop_text_dir[i] * 3;
				}
				else
				{
					dop_text_angle[i] -= dop_text_dir[i];
					dop_text_dir[i] = -dop_text_dir[i];
				}
				dop_text_yscale[i] = dop_text_xscale[i];
			#endregion
			#region Отрисовка слова
				if dop_i[i] != -1
				{
					dop_text_color[0] = (global.player_object).hero_color;
					draw_set_halign(fa_center);
					draw_set_font(global.game_font);
					draw_text_transformed_t(dop_text_x[i], dop_text_y[i], dop_text[(dop_i[i])], dop_text_xscale[i], dop_text_yscale[i], dop_text_angle[i], dop_text_color[i], 1);
				}
			#endregion
		}
	}
#endregion
#region Смайлы (0)
	if 0
	{
		#region Проверка на нажатие
			if point_in_circle(mouse_x, mouse_y, 640, global.height - 20, 65) && mouse_check_button_released(mb_left)
			{
				audio_play_sound(sd_text, 2, 0);
				smile_open = !smile_open;
			}
		#endregion
		#region Время смайла
			if enemy_smile_time > 0
			{
				enemy_smile_time -= 1;
			}
			else
			{
				if enemy_smile_time > -1
				{
					smile_show1 = 1;
					smile_cur1  = enemy_smile;
					enemy_smile_time = -1;
				}
			}
		#endregion
		#region Прозрачность смайла
			if smile_bi != smile_open
			{
				if smile_bs > 0
				{
					smile_bs -= 0.25;
				}
				else
				{
					smile_bi = smile_open;
				}
			}
			else
			{
				if smile_bs < 1
				{
					smile_bs += 0.25;
				}
			}
		#endregion
		#region Отрисовка кнопки смайлов
			draw_sprite_ext(s_smile_button2, smile_bi, 640, global.height - 20, 0.25 * smile_bs * 4, 0.25 * smile_bs * 4, 0, c_white, 0.8);
		#endregion
		#region Выбор смайла
			if smile_open
			{
				#region Разворачивание плашки
					if smile_sc < 1
					{
						smile_sc += 0.15;
					}
					else
					{
						smile_sc = 1;
					}
				#endregion
				#region Отрисовка плашки
					//draw_question(s_question_back, 0, 640, global.height - 140, 560 * smile_sc, 50, 1, c_white, 0.7);
				#endregion
				#region Наведение на смайл, смайл соперника
					for(i = 0; i <= 5; i ++)
					{
						if point_in_circle(mouse_x, mouse_y, 640 - 260 + 100 * i, global.height - 140, 40) && smile_sc = 1
						{
							if mouse_check_button_released(mb_left)
							{
								if enemy_smile = -1
								{
									if global.sound = 1
									{
										audio_play_sound(sd_text, 2, 0);
									}
									enemy_smile_chance = choose(0, 1);
									if enemy_smile_chance = 1
									{
										if (hp / maxhp - e_hp / e_maxhp) * 100 < -30
										{
											enemy_smile = choose(1, 1, 1, 1, 3, 3, 4);
										}
										if (hp / maxhp - e_hp / e_maxhp) * 100 >= -30 && (hp / maxhp - e_hp / e_maxhp) * 100 < 20
										{
											enemy_smile = choose(0, 1, 2, 2, 2, 3, 4);
										}
										if (hp / maxhp - e_hp / e_maxhp) * 100 >= 20 && (hp / maxhp - e_hp / e_maxhp) * 100 < 40
										{
											enemy_smile = choose(2, 2, 2, 5, 5, 5, 4, 0);
										}
										if (hp / maxhp - e_hp / e_maxhp) * 100 >= 40 && (hp / maxhp - e_hp / e_maxhp) * 100 < 70
										{
											enemy_smile = choose(0, 0, 0, 5, 5, 5);
										}
										if (hp / maxhp - e_hp / e_maxhp) * 100 >= 70
										{
											enemy_smile = choose(0, 0, 0, 5, 5);
										}
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
							{
								smile_ss[i] += 0.02;
							}
							draw_sprite_ext(asset_get_index("s_smile_"+string(i)), smile_n, 640 - 260 * smile_sc + 100 * i * smile_sc, global.height - 140, (0.27 + smile_ss[i]) * smile_sc, (0.27 + smile_ss[i]), 0, c_white, 1);
						}
						else
						{
							if smile_ss[i] > 0
							{
								smile_ss[i] -= 0.02;
							}
							draw_sprite_ext(s_smiles, i, 640 - 260 * smile_sc + 100 * i * smile_sc, global.height - 140, (0.27 + smile_ss[i]) * smile_sc, (0.27 + smile_ss[i]), 0, c_white, 1);
						}
					}
					smile_n += 1/3;
				#endregion
			}
			else
			{
				#region Сворачивание плашки
					smile_n = 0;
					if smile_sc > 0
					{
						smile_sc -= 0.15;
						draw_question(s_question_back, 0, 640, global.height - 140, 560 * smile_sc, 50, 1, c_white, 0.7);
						for(i = 0; i <= 5; i ++)
						{
							draw_sprite_ext(s_smiles, i, 640 - 260 * smile_sc + 100 * i * smile_sc, global.height - 140, 0.27 * smile_sc, 0.27, 0, c_white, 1);
						}
					}
				#endregion
			}
		#endregion
		#region Наш смайл
			if smile_show = 1
			{
				smile_alp  = 1;
				smile_img += 1/3;
				if smile_sy < 1
				{
					smile_sy += 0.2;
				}
				if smile_sec < 4 * room_speed
				{
					smile_sec += 1;
				}
				else
				{
					smile_show = 0;
				}
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
				{
					smile_alp = 0;
				}
			}
		#endregion
		#region Смайл противника
			if smile_show1 = 1
			{
				smile_alp1  = 1;
				smile_img1 += 1/3;
				if smile_sy1 < 1
				{
					smile_sy1 += 0.2;
				}
				if smile_sec1 < 4 * room_speed
				{
					smile_sec1 += 1;
				}
				else
				{
					smile_show1 = 0;
					enemy_smile = -1;
				}
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
				{
					smile_alp1 = 0;
				}
			}
		#endregion
	}
#endregion
#region Линии видов разрешения
	if keyboard_check_pressed(ord("L"))
	{
		lines_true = !lines_true;
	}
	if lines_true
	{
		draw_line_width_color(0, global.height / 2 - 295, global.width, global.height / 2 -295, 5, c_red, c_red);
		draw_line_width_color(0, global.height / 2 + 295, global.width, global.height / 2 + 295, 5, c_red, c_red);
		
		draw_line_width_color(0, global.height / 2 - 360, global.width, global.height / 2 - 360, 5, c_aqua, c_aqua);
		draw_line_width_color(0, global.height / 2 + 360, global.width, global.height / 2 + 360, 5, c_aqua, c_aqua);
		
		draw_line_width_color(0, global.height / 2 - 400, global.width, global.height / 2 - 400, 5, c_blue, c_blue);
		draw_line_width_color(0, global.height / 2 + 400, global.width, global.height / 2 + 400, 5, c_blue, c_blue);
		
		draw_line_width_color(0, global.height / 2 - 480, global.width, global.height / 2 - 480, 5, c_yellow, c_yellow);
		draw_line_width_color(0, global.height / 2 + 480, global.width, global.height / 2 + 480, 5, c_yellow, c_yellow);
	}
#endregion
#region Изменения вида
	#region Влево
		if view_go_left = 1
		{
			if view_xport > - 20
			{
				view_xport -= 10;
			}
			else
			{
				view_go_left = 2;
			}
		}
		if view_go_left = 2
		{
			if view_xport < 0
			{
				view_xport += 10;
			}
			else
			{
				view_go_left = 0;
			}
		}
	#endregion
	#region Вправо
		if view_go_right = 1
		{
			if view_xport < 20
			{
				view_xport += 10;
			}
			else
			{
				view_go_right = 2;
			}
		}
		if view_go_right = 2
		{
			if view_xport > 0
			{
				view_xport -= 10;
			}
			else
			{
				view_go_right = 0;
			}
		}
	#endregion
	#region Вниз
		if view_go_down = 1
		{
			if view_yport <  15
			{
				view_yport += 5;
			}
			else
			{
				view_go_down = 2;
			}
		}
		if view_go_down = 2
		{
			if view_yport > 0
			{
				view_yport -= 5;
			}
			else
			{
				view_go_down = 0;
			}
		}
	#endregion
#endregion
#region Критикал
	#region Изменение
		if global.critical = 3 - 1 * global.p_totem_a[3]
		{
			if critical_x < 640 - 30
			{
				critical_x += 50;
				critical_y -= 5;
			}
			if critical_x >= 640 - 30 && critical_x < 640 + 30
			{
				critical_x += 2;
			}
			if critical_x >= 640 + 30 && critical_x < global.width + 250
			{
				critical_x += 50;
				critical_y += 5;
			}
			critical_s =  1 - 0.3 * abs(640 - critical_x) / 640;
		}
		else
		{
			critical_x = -250;
			critical_y = -170;
		}
	#endregion
	#region Рисование
		draw_set_font(global.game_font);
		if os_get_language() != "ru"
		{
			draw_text_transformed_t(critical_x, global.height / 2 + critical_y, "CRITICAL", 0.2 * critical_s, 0.2 * critical_s, 0, (global.player_object).hero_color, c_black);
		}
		else
		{
			draw_text_transformed_t(critical_x, global.height / 2 + critical_y, "КРИТ УРОН", 0.2 * critical_s, 0.2 * critical_s, 0, (global.player_object).hero_color, c_black);
		}
	#endregion
#endregion
#region Верно или нет
	#region 1 или 2
		if answer_rec = 1
		{
			if answer_alp < 0.8
			{
				answer_alp += 0.15;
			}
			else
			{
				answer_rec = 2;
			}
		}
		if answer_rec = 2
		{
			if answer_alp > 0
			{
				answer_alp -= 0.05;
			}
			else
			{
				answer_rec = 0;
			}
		}
	#endregion
	#region Отрисовка красного или зеленого поверх
		if answer_rec > 0 && global.idol[2] != 4
		{
			draw_set_alpha(answer_alp);
			draw_rectangle_color(0, 0, global.width, global.height, answer_col, answer_col, answer_col, answer_col, 0);
			draw_set_alpha(1);
		}
	#endregion
	#region Отрисовка красного (четвёртый идол)
		if global.idol[1] = 4 or global.idol[2] = 4 or global.idol[3] = 4
		{
			if idol_alpha_s = 0
			{
				if idol_alpha < 0.2
				{
					idol_alpha += 0.002;
				}
				else
				{
					idol_alpha_s = 1;
				}
			}
			if idol_alpha_s = 1
			{
				if idol_alpha > 0
				{
					idol_alpha -= 0.002;
				}
				else
				{
					idol_alpha_s = 0;
				}
			}
			var idol_col;
			if global.idol[1] = 4
			{
				idol_col = make_color_rgb(253,265,15);
			}
			if global.idol[2] = 4
			{
				idol_col = make_color_rgb(170,240,209);
			}
			if global.idol[3] = 4
			{
				idol_col = make_color_rgb(127,199,255);
			}
			draw_set_alpha(idol_alpha);
			draw_rectangle_color(0, 0, global.width, global.height, idol_col, idol_col, idol_col, idol_col, 0);
			draw_set_alpha(1);
		}
	#endregion
#endregion
#region ОБУЧЕНИЕ
	if global.training > 0 && global.tot = -1
	{
		#region Цвет
			var training_text_color;
			training_text_color = global.color_hero[global.training];
			if global.training = 1
			{
				training_text_color = global.color_white;
			}
			if global.training_stage[3] = 8 or global.training_stage[4] = 16
			{
				training_text_color = c_red;
			}
		#endregion
		#region Отмена тотемов и обнуление переменных
			global.p_totem[1] = -1;
			global.p_totem[2] = -1;
			global.p_totem[3] = -1;
			global.e_totem[1] = -1;
			global.e_totem[2] = -1;
			global.e_totem[3] = -1;
			if global.training_stage[global.training] = 22
			{
				list_go = 0;
				list_scale = 0;
			}
		#endregion
		#region Локальные переменные
			var txt_t, txt_t1, txt_t2, txt_t3, txt_t4;
			txt_t = global.training_text[global.training,global.training_stage[global.training]];
		#endregion
		#region Скрипт задачи по теме
			var cccc;
			cccc = 0;
			if global.training_stage[global.training] = 10 && round_task[global.rounds,1] != 2
			{
				round_task[global.rounds,1] = 2;
				cccc = 1;
			}
			if global.training_stage[global.training] = 14 && round_task[global.rounds,1] != 3
			{
				round_task[global.rounds,1] = 3;
				cccc = 1;
			}
			if global.training_stage[global.training] = 18 && round_task[global.rounds,1] != 4
			{
				round_task[global.rounds,1] = 4;
				cccc = 1;
			}
			if cccc = 1
			{
				#region Скрипт темы/раунда/задачи
					if global.storm = 1
					{
						storm_1();
					}
					switch(theme_round[global.rounds])
					{
						case 1:
							script_execute(asset_get_index("cards_" + string(round_task[global.rounds,global.task])));
						break;
						case 2:
							script_execute(asset_get_index("bottles_" + string(round_task[global.rounds,global.task])));
						break;
						case 3:
							script_execute(asset_get_index("move_" + string(round_task[global.rounds,global.task])));
						break;
						case 4:
							script_execute(asset_get_index("attention_" + string(round_task[global.rounds,global.task])));
						break;
						case 5:
							script_execute(asset_get_index("shooting_" + string(round_task[global.rounds,global.task])));
						break;
						case 6:
							script_execute(asset_get_index("math_" + string(round_task[global.rounds,global.task])));
						break;
					}
					global.question = 1;
				#endregion
			}
		#endregion
		#region Переменные, Ини
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
									ini_write_string("Training", "tr" + string(global.training), "2");
									if global.training + 1 <= 6
									{
										ini_write_string("Training", "tr" + string(global.training + 1), "1");
									}
									global.training_o = ini_read_real("Training", "training", 0);
									global.tr[1] = ini_read_real("Training", "tr1", 0);
									global.tr[2] = ini_read_real("Training", "tr2", 0);
									global.tr[3] = ini_read_real("Training", "tr3", 0);
									global.tr[4] = ini_read_real("Training", "tr4", 0);
									global.tr[5] = ini_read_real("Training", "tr5", 0);
									global.tr[6] = ini_read_real("Training", "tr6", 0);
								#endregion
							ini_close();
						}
						if global.training != 6
						{
							room_goto_t("menu");
						}
						else
						{
							global.shomen = 1;
							room_goto_t("duel");
						}
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
		#endregion
		#region Начало обучения - первые две стадии
			if global.training_stage[global.training] < 6 or global.training_stage[global.training] = 22
			{
				draw_set_alpha(0.45);
				draw_rectangle_color(0, 0, global.width, global.height, c_black, c_black, c_black, c_black, 0);
				draw_set_alpha(1);
				global.training_hand_x = - 200;
				global.training_hand_y = - 200;
				list_go = 0;
				list_scale = 0;
				if global.training_x > global.width - 160
				{
					global.training_x -= 40;
				}
				else
				{
					global.text_ne = 1;
				}
				if global.text_go = 0
				{
					if global.text_sc < 1
					{
						global.text_sc += 0.1;
					}
				}
				else
				{
					if global.text_sc > 0
					{
						global.text_sc -= 0.1;
					}
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
		#endregion
		#region Изменение i
			if global.training_x <= global.width
			{
				global.training_hero_i += 1;
			}
		#endregion
		#region Отрисовка персонажа обучения
			var heroo;
			heroo = asset_get_index("s_" + global.hero_code_name[global.training]);
			draw_sprite_ext(heroo, global.training_hero_i, global.training_x, global.height / 2 + 450, 1, 1, 0, c_white, 1);
		#endregion
		#region Отрисовка руки обучения
			draw_sprite_ext_t(s_training_hand, global.training_hand_i, global.training_hand_x, global.training_hand_y, 1, 1, 0, global.color_white, 1, global.color_white, c_black);
		#endregion
		#region Если способность не используется
			if global.super_ability = 0
			{
				#region Отрисовка текста до 6 стадии
					if global.training_stage[global.training] < 6 or global.training_stage[global.training] = 22
					{
						draw_set_font(global.game_font);
						draw_text_ext_transformed_t(640, global.height / 2, txt_t, -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
					}
				#endregion
				#region Текст 6, 10, 14 и 18
					if global.training_stage[global.training] = 6 or global.training_stage[global.training]  = 10
					or global.training_stage[global.training] = 14 or global.training_stage[global.training] = 18
					{
						if global.training_x < global.width + 500
						{
							global.training_x += 50;
						}
						else
						{
							list_go = 1;
						}
						if global.text_go = 0
						{
							if global.text_sc < 1
							{
								global.text_sc += 0.1;
							}
						}
						txt_t = global.training_text[global.training,global.training_stage[global.training]];
						draw_set_font(global.game_font);
						draw_text_ext_transformed_t(1020, global.height / 2 - 100, txt_t, -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
					}
				#endregion
				#region Текст 7, 11, 15 и 19
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
								draw_text_ext_transformed_t(1020, global.height / 2 - 100, txt_t, -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
								draw_text_ext_transformed_t(260, global.height / 2 + 20, txt_t1, -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
							}
						}
					}
				#endregion
				#region Текст 8, 12, 16 и 20
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
								draw_text_ext_transformed_t(1020, global.height / 2 - 100, txt_t,  -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
								draw_text_ext_transformed_t(260, global.height / 2 + 20, txt_t1, -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
								draw_text_ext_transformed_t(1020, global.height / 2 + 100, txt_t2, -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
							}
						}
					}
				#endregion
				#region Текст 9, 13, 17 и 21
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
						draw_text_ext_transformed_t(1020, global.height / 2 - 100, txt_t,  -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
						draw_text_ext_transformed_t(260, global.height / 2 - 100, txt_t1, -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
						draw_text_ext_transformed_t(1020, global.height / 2 + 100, txt_t2, -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
						draw_text_ext_transformed_t(260, global.height / 2 + 100, txt_t3, -1, 500 / 0.18, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, training_text_color, c_black);
						if txt_t3 = ""
						{
							if global.training = 1 && global.training_stage[1] = 17
							{
								global.training_hand_s   = 0;
								global.training_question = 0;
								global.text_ne = 1;
								global.text_go = 0;
								global.training_stage[global.training] = 22;
							}
							else
							{
								global.training_stage[global.training] += 1;
								global.text_ne = 1;
								global.text_go = 0;
								if global.training = 1 && global.training_stage[1] > 17
								{
									round_task[global.rounds,1] += 1;
								}
							}
						}
					}
				}
				#endregion
			}
		#endregion
		#region Изменения и обнуления
			if global.training != 2
			{
				global.critical = 0;
			}
			if global.training != 6
			{
				global.super_ability = 0;
				super = 0;
				super_now = 0;
			}
			if global.training_hand_i < 11
			{
				global.training_hand_i += 0.4;
			}
			else
			{
				global.training_hand_i = 0;
			}
		#endregion
	}
#endregion
#region Музыка
	var musica;
		musica = asset_get_index("sd_" + string(global.background));
	if global.music = 1
	{
		if !audio_is_playing(musica)
		{
			audio_stop_all();
			if global.background = "train"
			{
				audio_play_sound(sd_back_train, 0, true);
			}
			if global.background = "waterfall"
			{
				audio_play_sound(sd_back_waterfall, 0, true);
			}
			audio_play_sound(musica, 1, true);
		}
	}
#endregion
#region Проверка на слив
	global.notend = 0;
	if global.quick = 0
	{
		#region Слился
			if roundskul[1] = 0 && roundskul[2] = 0 && roundskul[3] = 0
			{
				if ((hp + e_atk * 2) / maxhp) < (e_hp / e_maxhp)
				{
					global.notend = 1;
			}
			}
			if roundskul[1] = 1 && roundskul[2] = 2 && roundskul[3] = 0
			{
				if ((hp + e_atk * 2) / maxhp) < (e_hp / e_maxhp)
				{
					global.notend = 1;
				}
			}
			if roundskul[1] = 2 && roundskul[2] = 1 && roundskul[3] = 0
			{
				if ((hp + e_atk * 2) / maxhp) < (e_hp / e_maxhp)
				{
					global.notend = 1;
				}
			}
			if roundskul[1] = 2 && roundskul[2] = 0 && roundskul[3] = 0
			{
				global.notend = 1;
			}
			if roundskul[1] = 2 && roundskul[2] = 2 && roundskul[3] = 0
			{
				global.notend = 1;
			}
			if roundskul[1] = 2 && roundskul[2] = 1 && roundskul[3] = 2
			{
				global.notend = 1;
			}
			if roundskul[1] = 1 && roundskul[2] = 2 && roundskul[3] = 2
			{
				global.notend = 1;
			}
		#endregion
	}
	ini_open("Music.ini")
		ini_write_string("Musica", "back", string(global.notend));
	ini_close();
#endregion
#region Словечки
	if global.training_gb != ""
	{
		#region Координаты и Движение
			if global.training_gb_t > 0
			{
				if global.training_gb_y > global.height - 60
				{
					global.training_gb_y -= 20;
				}
				else
				{
					global.training_gb_t -= 1;
				}
			}
			else
			{
				if global.training_gb_y < global.height + 100
				{
					global.training_gb_y += 20;
				}
				else
				{
					global.training_gb   = "";
					global.training_gb_y = global.height + 100;
					global.training_gb_t = room_speed;
				}
			}
		#endregion
		#region Цвет
			var colorr;
			colorr = global.color_hero[2];
			if global.training_gb = "TRY AGAIN" or global.training_gb = "MISS"
			or global.training_gb = "FAULT" or global.training_gb = "GAFFE"
			or global.training_gb = "MISTAKE" or global.training_gb = "ПРОМАХ"
			or global.training_gb = "ОШИБКА" or global.training_gb = "НЕУДАЧА"
			or global.training_gb = "НЕВЕЗУХА"
			{
				colorr = global.color_hero[4];
			}
		#endregion
		#region Словечко
			if global.training_gb = "TRY AGAIN"
			{
				if os_get_language() = "ru"
				{
					draw_text_transformed_t(640, global.training_gb_y, "ПОПРОБУЙ ЕЩЁ!", 0.18 * global.text_sc, 0.18 * global.text_sc, 8, colorr, c_black);
				}
				else
				{
					draw_text_transformed_t(640, global.training_gb_y, global.training_gb, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, colorr, c_black);
				}
			}
			else
			{
				draw_text_transformed_t(640, global.training_gb_y, global.training_gb, 0.18 * global.text_sc, 0.18 * global.text_sc, 8, colorr, c_black);
			}
		#endregion
	}
#endregion
#region Отрисовка текущих ответов
	var gui_b_size, gui_b_y, gui_b_x, gui_b_spr;
	gui_b_size = 0.35;
	gui_b_y    = 0;
	gui_b_x    = 165;
	gui_b_spr  = s_gui_bullet;
	for(i = 1; i <= 3; i++)
	{
		//if i = global.task
		//{
		//	gui_b_y = 10; 
		//}
		//else
		//{
		//	gui_b_y = 0;
		//}
		for(j = 1; j <= 3; j++)
		{
			if u_question = (i - 1) * 3 + j
			{
				gui_b_y = 5; 
			}
			else
			{
				gui_b_y = 0;
			}
			draw_sprite_ext(gui_b_spr, j - 1, global.width / 2 + (-gui_b_x + gui_b_x * (i - 1)) * gui_b_size,  h_y + 80 - 2 - sprite_get_height(s_healthbar_hp) * gui_size * 0.8 + h_y1 - gui_b_y, gui_b_size, gui_b_size, 0, c_white, 1);
			if player_q[(i - 1) * 3 + j, global.rounds] = 1
			{
				draw_sprite_ext(gui_b_spr, 2 + j, global.width / 2 + (-gui_b_x + gui_b_x * (i - 1)) * gui_b_size,  h_y + 80 - 2 - sprite_get_height(s_healthbar_hp) * gui_size * 0.8 + h_y1 - gui_b_y, gui_b_size, gui_b_size, 0, c_white, 1);
			}
			if player_q[(i - 1) * 3 + j, global.rounds] = 0
			{
				draw_sprite_ext(gui_b_spr, 5 + j, global.width / 2 + (-gui_b_x + gui_b_x * (i - 1)) * gui_b_size,  h_y + 80 - 2 - sprite_get_height(s_healthbar_hp) * gui_size * 0.8 + h_y1 - gui_b_y, gui_b_size, gui_b_size, 0, c_white, 1);
			}
		}
	}
	//draw_sprite_ext(s_gui_bullet, 0, global.width / 2, global.height / 3, 0.35, 0.35, 0, c_white, 1);
	//if u_question > 1
	//{
	//	draw_sprite_ext(s_gui_bullet, u_question - 1, mouse_x, mouse_y, 0.35, 0.35, 0, c_white, 1);
	//	for(i = 1; i <= 3; i++)
	//	{
	//		if player_q[i,global.rounds] = 0
	//		{
	//			draw_sprite_ext(s_gui_bullet, 10 + i - 1, mouse_x, mouse_y, 0.35, 0.35, 0, c_white, 1);
	//		}
	//	}
	//}
#endregion
#region Текущий тотем
	for(i = 1; i <= 2; i++)
	{
		if totem_show_n[i] > 0
		{
			var totem_size, totem_color;
			totem_size  = 0.25;
			totem_color = c_white;
			if totem_show_n[i] <= 6
			{
				totem_color = c_white;
			}
			if totem_show_n[i] > 6 && totem_show_n[i] <= 11
			{
				totem_color = c_aqua;
			}
			if totem_show_n[i] > 11 && totem_show_n[i] <= 15
			{
				totem_color = c_fuchsia;
			}
			if totem_show_n[i] > 15
			{
				totem_color = c_orange;
			}
		
			if totem_show_i[i] = 0
			{
				if i = 1
				{
					totem_show_x[i]  = (global.player_object).x + 200;
					 
				}
				else
				{
					totem_show_x[i]  = (global.enemy_object).x - 250;
				}
				totem_show_y[i]  = (global.player_object).y - 300;
				totem_show_s[i]  = 0;
				totem_show_s1[i] = 0;
				totem_show_i[i]  = 1;
				totem_show_a[i]  = -15;
			}
			if totem_show_i[i] = 1
			{
				if totem_show_s[i] < 1
				{
					totem_show_s[i] += 0.1;
					totem_show_a[i] += 0.75 * 2;
				}
				else
				{
					totem_show_i[i] = 2;
				}
			}
			if totem_show_i[i] = 2
			{
				if totem_show_s1[i] < 1
				{
					totem_show_s1[i] += 0.1;
					totem_show_s[i] += 0.02;
					totem_show_a[i] += 0.25;
				}
				else
				{
					totem_show_i[i] = 3;
				}
			}
			if totem_show_i[i] = 3
			{
				if totem_show_s[i] < 1.45
				{
					totem_show_s[i] += 0.01;
					totem_show_a[i] += 0.1;
				}
				else
				{
					totem_show_i[i] = 4;
				}
			}
			if totem_show_i[i] = 4
			{
				if totem_show_s[i] > 0
				{
					totem_show_s[i]  -= 0.1;
					totem_show_a[i]  -= 1;
					totem_show_s1[i] -= 0.1;
				}
				else
				{
					totem_show_x[i]  = 0;
					totem_show_y[i]  = 0;
					totem_show_s[i]  = 0;
					totem_show_s1[i] = 0;
					totem_show_a[i]  = 0;
					totem_show_i[i]  = 0;
					totem_show_n[i]  = 0;
				}
			}
			if totem_show_i[i] > 1
			{
				draw_sprite_ext(s_totems_light, totem_show_n[i], totem_show_x[i], totem_show_y[i], totem_show_s[i] * totem_show_s1[i] * totem_size, totem_show_s[i] * totem_show_s1[i] * totem_size, totem_show_a[i], totem_color, 1);
				draw_sprite_ext(s_totems, totem_show_n[i], totem_show_x[i], totem_show_y[i], totem_show_s[i] * totem_size, totem_show_s[i] * totem_size, totem_show_a[i], c_white, 1);
				draw_sprite_ext(s_totems_eyes, totem_show_n[i], totem_show_x[i], totem_show_y[i], totem_show_s[i] * totem_size, totem_show_s[i] * totem_size, totem_show_a[i], totem_color, totem_show_s1[i]);
			}
			else
			{
				draw_sprite_ext(s_totems, totem_show_n[i], totem_show_x[i], totem_show_y[i], totem_show_s[i] * totem_size, totem_show_s[i] * totem_size, totem_show_a[i], c_white, 1);
			}
		}
	}
#endregion
#region Онлайн, концовка раунда
	//if global.online && player_end[global.myid] = 2 && o_client.cl_stage[1] = 0
	//{
	//	player_end[global.myid] = 1;
	//	o_client.cl_stage[1] = 8;
	//}
#endregion
#region Онлайн, имя врага
	if o_client.nameg = 2 && nameg_need = 1 //global.enemy_name = "-" && o_client.nameg = 2
	{
		if nameg_time > 0
		{
			nameg_time --;
		}
		else
		{
			nameg_time     = 5;
			o_client.nameg = 1;
		}
	}
	if o_client.zhopanegra2 != ""
	{
		if global.enemy_name != o_client.zhopanegra2
		{
			global.enemy_name = o_client.zhopanegra2;
		}
	}
#endregion
#region Онлайн, супер
	if go_super = 1
	{
		//super_ii += "4-";
	}
	if go_super = 1// && o_client.cl_stage[1] = 0
	{
		//super_ii += "5-";
		o_client.cl_stage[18] = 1; //o_client.cl_stage[1] = 18;
		go_super = 0;
	}
#endregion
#region Отладка
	//timer = room_speed;
	var popec;
	popec = "";
	
	//popec += "IDOLS-RANDOM: " + string(idols_random);
	//popec += "\nIDOL 1: " + string(global.idol[1]) + "~" + string(global.idol_h[1]) + "~" + string(global.idol_x[1]) + "~" + string(global.idol_y[2]) + "~" + string(global.idol_s[1]);
	//popec += "\nIDOL 2: " + string(global.idol[2]) + "~" + string(global.idol_h[2]) + "~" + string(global.idol_x[2]) + "~" + string(global.idol_y[2]) + "~" + string(global.idol_s[2]);
	//popec += "\nIDOL 3: " + string(global.idol[3]) + "~" + string(global.idol_h[3]) + "~" + string(global.idol_x[3]) + "~" + string(global.idol_y[3]) + "~" + string(global.idol_s[3]);
	
	//popec += "PLAYER-END: " + string(player_end[1]) + "~" + string(player_end[2]);
	//popec += "\nFASTER-ID : " + string(faster_id);
	//popec += "\nTHEME-CHOOSE : " + string(theme_choose);
	//popec += "\nU-E-QUESTION : " + string(u_question) + "~" + string(e_question);
	//popec += "\nPL-EN-ANSWER : " + string((global.player_object).answer) + "~" + string((global.enemy_object).answer);
	//popec += "\nROUND-END-DOP : " + string(round_end_dop);
	//popec += "\nROUND-END : " + string(round_end);
	
	//popec += "\nFASTER-ID: " + string(faster_id);
	//popec += "\nEN-FASTER: " + string(en_faster);
	//popec += "\nROUNDSKUL: " + string(roundskul[1]) + "~" + string(roundskul[2]) + "~" + string(roundskul[3]);
	//popec += "\nPLAYER-END: " + string(player_end[global.myid]) + "~" + string(player_end[global.enid]);
	//popec += "\nWHOWIN: " + string(whowin);
	//popec += "\nWINNER" + string(o_client.winner);
	
	//popec += "\n\nTHEME-ROUND: " + string(theme_round[global.rounds]);
	//popec += "\nTHEME-CHOOSE : " + string(theme_choose);
	//popec += "\nSUPER_ABILITY: " + string(global.super_ability);
	//popec += "\nTRAINING: "  + string(global.training);
	//popec += "\nSCALE: " + string(list_scale);
	//popec += "\nWAIT: " + string(pre_wait);
	
	//popec += "\n" + string(o_client.cl_stage[1]);
	//popec += "\nTHEMECHOOSE " + string(theme_choose);
	//popec += "\nWHOWIN " + string(whowin);
	//popec += "\nLIST_Y " + string(list_y);
	//popec += "\nAUTOLOSE " + string(autolose);
	//popec += "\nAUTOWIN " + string(autowin);
	//popec += "\nFINPLAS " + string(finplas);
	//popec += "\nWINNER " + string(o_client.winner);
	//popec += "\n\n" + super_ii;
	
	//popec += "NAMEG = " + string(o_client.nameg);
	//popec += "\nNAMEG2 = " + string(o_client.nameg2);
	//popec += "\nNAMEG2_TIME = " + string(o_client.nameg2_time);
	//popec += "\nNAMEG_NEED = " + string(o_list.nameg_need);
	//if o_client.zhopanegra = 1
	//{
	//	popec += "\nЖОПЕЦ " + string(o_client.zhopanegra2);
	//}
	
	//popec += string(hp) + "~" + string(maxhp) + " - " + string(atk);
	//popec += "\n" + string(e_hp) + "~" + string(e_maxhp) + " - " + string(e_atk);
	
	//popec += global.training_text[global.training,global.training_stage[global.training]];
	//popec += string(global.training_x) + "~" + string(global.training_x);
	//popec += "\n st" + string(global.training_stage[global.training]);
	//popec += "\n sc" + string(global.text_sc);
	//popec += "\n ne" + string(global.text_ne);
	//popec += "\n go" + string(global.text_go);
	// global.training_x >= global.width && global.text_sc = 1
	//global.text_ne global.text_go
	
	//popec += string(o_client.index);
	
	//popec += "\nRAT THIEF: " + totem_ran_rat[global.myid]        + "    ~    RAT THIEF: " + totem_ran_rat[global.enid];
	//popec += "\nPANTHER: "   + totem_ran_panther[global.myid]    + "    ~    PANTHER: "   + totem_ran_panther[global.enid];
	//popec += "\nFROG: "      + totem_ran_frog[global.myid]       + "    ~    FROG: "      + totem_ran_frog[global.enid];
	//popec += "\nPIG: "       + totem_ran_pig[global.myid]        + "    ~    PIG: "       + totem_ran_pig[global.enid];
	//popec += "\nEVAS: "      + totem_ran_evasive[global.myid]    + "    ~    EVAS: "      + totem_ran_evasive[global.enid];
	//popec += "\nBULL: "      + totem_ran_bull[global.myid]       + "    ~    BULL: "      + totem_ran_bull[global.enid];
	
	//popec += string(global.myid) + "\n" + string(player_end[1]) + "~" + string(faster_id) + "~" + string(player_end[2]);
	//popec += "\n ТЕМА: " + string(theme_choose) + "\n СРАКА:" + string(global.sraka) + "\n ЭНД:" + string(round_end);
	//popec += "\n ТАСК-ВОП:" + string(global.task) + "~" + string(global.question) + "~" + string(u_question);
	//popec += "\n ГОТОВ:" + string(o_client.ready[global.myid]) + "~" + string(o_client.ready[global.enid]);
	//popec += "\n СЛ_СТДЖ:" + string(o_client.cl_stage[1]) + "\n" + string(round_end_dop) + "\n ФЁРСТ_ПЛ:" + string(first_player);
	//popec += "\n РЕАР:" + string(o_client.rearr) + "\n ДОСУЛ:" + string(o_client.dosul);
	
	//popec += "idol_1 = " + string(global.idol[1]);
	//popec += "\nidol_2 = " + string(global.idol[2]);
	//popec += "\nidol_3 = " + string(global.idol[3]);
	//popec += "\n";
	//popec += "\nidol_h_1 = " + string(global.idol_h[1]);
	//popec += "\nidol_h_2 = " + string(global.idol_h[2]);
	//popec += "\nidol_h_3 = " + string(global.idol_h[3]);
	
	//*******
	//popec += "\ntraining: " + string(global.training);
	//popec += "\npvp_stop: " + string(global.pvp_stop);
	//popec += "\nsuper_now~need: " + string(super_now) + " ~ : " + string(super_need);
	//popec += "\nsuper_abilitican: " + string(global.abilitican);
	//popec += "\nanswer_pl~en: " + string((global.player_object).answer) + " ~ : " + string((global.enemy_object).answer);
	//popec += "\nshoot_pl~en: " + string((global.player_object).shoot) + " ~ : " + string((global.enemy_object).shoot);
	//*****
	
	//super_now = super_need
	//&& global.super_ability = 0
	//&& (global.player_object).answer = -1 && (global.enemy_object).answer = -1
	//&& (global.player_object).shoot = 0 && (global.enemy_object).shoot = 0
	//&& !(global.hero = 1 && global.enemy_hero = 1)
	
	draw_set_font(global.game_font);
	draw_text_transformed_t(global.width / 2, global.height / 2, string_upper(popec), 0.1, 0.1, 0, c_lime, c_black);
	//draw_text_transformed_t(mouse_x, mouse_y, "ROUNDS: " + string(global.rounds) + "\nPEPA(" + string(global.myid) + ") " + string(pepa), 0.06, 0.06, 0, c_white, c_black);
	//"\nPEPA : " + string(pepa)
	// 1.1.2
#endregion