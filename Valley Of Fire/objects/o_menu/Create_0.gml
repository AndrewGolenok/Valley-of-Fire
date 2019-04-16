 #region Текст
	ini_open(global.lang + ".ini");
		for(i = 1; i <= 34; i ++)
		{
			if i <= 6
			{
				cash_txt[i] = ini_read_string("Menu", "cash_txt_" + string(i), "");
			}
			if i <= 3
			{
				gold_txt[i] = ini_read_string("Menu", "gold_txt_" + string(i), "");
			}
			if i <= 4
			{
				text_tot[i] = ini_read_string("Menu", "text_tot_" + string(i), "");
			}
			if i <= 8
			{
				heroes_name[i]  = ini_read_string("Menu", "heroes_name_"  + string(i), "");
				heroes_theme[i] = ini_read_string("Menu", "heroes_theme_" + string(i), "");
				heroes_abil[i]  = ini_read_string("Menu", "heroes_abil_"  + string(i), "");
			}
			if i <= 21
			{
				main_text[i]     = ini_read_string("Menu", "main_text_"     + string(i), "");
				training_text[i] = ini_read_string("Menu", "training_text_" + string(i), "");
				store_text[i]    = ini_read_string("Menu", "store_text_"    + string(i), "");
				heroes_text[i]   = ini_read_string("Menu", "heroes_text_"   + string(i), "");
				totems_text[i]   = ini_read_string("Menu", "totems_text_"   + string(i), "");
			}
			quest_text[i] = ini_read_string("Menu", "quest_text_" + string(i), "");
		}
		hp_text     = ini_read_string("Menu", "hp_text", "");
		atk_text    = ini_read_string("Menu", "atk_text", "");
		him_text    = ini_read_string("Menu", "him_text", "");
		her_text    = ini_read_string("Menu", "her_text", "");
		choose_text = ini_read_string("Menu", "choose_text", "");
	ini_close();
#endregion
#region Меню
	tr_ang  = 0;
	tr_dir  = 1;
	tr_time = room_speed * 2;
	tr_timm = 0;
	//global.fps_mental = 0;
	//global.fps_col = 0;
	global.lug_time = 0;
	global.duel = 0;
	global.menu_now   = "main";
	global.back_scale = global.width / 2092;
	global.menu_next = "main";
	time_h = "";
	time_m = "";
	time_t = room_speed;
	time_s = -1;
	if global.music = 1
	{
		music = 0;
	}
	else
	{
		music = 16;
	}
	if global.sound = 1
	{
		sound = 0;
	}
	else
	{
		sound = 16;
	}
	var topp;
	topp = 0;
	if abs(720 - global.height) > 0
	{
		topp = -((720 - global.height) + 30 * sign((720 - global.height)));
	}
	topp = -(720 - global.height) / 2;
#endregion
#region Обучение (тренировка)
	#region Угл, направление, расстояние
		training_back_y = global.height + 350;
		sc_angle = 0;
		sc_dir   = 1;
		sc_spd   = 0.3;
		sc_dist  = 5;
		hand_i   = 0;
		wl_spd   = 0;
		wl_ang   = 0;
		theme_sc = 0.4;
		tr_yes   = 1;
	#endregion
	#region Основные переменные тренировки
		global.training = 0;
		ini_open("Music.ini");
			if !ini_section_exists("Training")
			{
				global.tr[1] = ini_write_string("Training", "tr1", "1");
				global.tr[2] = ini_write_string("Training", "tr2", "0");
				global.tr[3] = ini_write_string("Training", "tr3", "0");
				global.tr[4] = ini_write_string("Training", "tr4", "0");
				global.tr[5] = ini_write_string("Training", "tr5", "0");
				global.tr[6] = ini_write_string("Training", "tr6", "0");
			}
			global.tr[1] = ini_read_real("Training", "tr1", 1);
			global.tr[2] = ini_read_real("Training", "tr2", 0);
			global.tr[3] = ini_read_real("Training", "tr3", 0);
			global.tr[4] = ini_read_real("Training", "tr4", 0);
			global.tr[5] = ini_read_real("Training", "tr5", 0);
			global.tr[6] = ini_read_real("Training", "tr6", 0);
			if global.tr[1] = 0
			{
				global.tr[1] = 1;
			}
			if global.tr[6] = 2
			{
				global.training_o = 1;
			}
			else
			{
				global.training_o = 0;
			}
		ini_close();
	#endregion
	#region Переменные меню тренировки
		for(i = 1; i <= 3; i ++)
		{
			for(j = 1; j <= 2; j ++)
			{
				theme_x[i,j] = 640 - 400 + 200 * i;
				if j = 1
				{
					theme_y[i,j]  = global.height / 2 - 120;
					theme_t[i,j]  = i;
					theme_ot[i,j] = global.tr[i];
					if theme_ot[i,j] = 1
					{
						theme_a[i,j] = 10;
					}
					else
					{
						theme_a[i,j] = 0;
					}
				}
				else
				{
					theme_y[i,j]  = global.height / 2 + 100;
					theme_t[i,j]  = 3 + i;
					theme_ot[i,j] = global.tr[3+i];
					if theme_ot[i,j] = 1
					{
						theme_a[i,j] = 10;
					}
					else
					{
						theme_a[i,j] = 0;
					}
				}
				theme_op[i,j]    = 0;
				theme_s[i,j]     = 1;
				theme_ss[i,j]    = 1;
				theme_stage[i,j] = 0;
				theme_nn[i,j]    = global.theme_name[theme_t[i,j]];
			}
		}
	#endregion
	#region Вызов меню тренировки
		if global.training_o = 0
		{
			global.menu_next = "training";
		}
		else
		{
			global.menu_next = "main";
		}
	#endregion
#endregion
#region Тотемы
	#region Переменные hold
		hold_sp = 0;
		hold_ti = 0;
		hold_dr = 1;
		hold_do = 1;
	#endregion
	#region Основные переменные, координаты, прозрачность, высота
		totem_now = 1;
		hero_i    = 0;
		totem_yy  = 0;
		totem_yy1 = 0;
		//
		totem_alp = 0.5;
		totem_adi = 1;
		//
		totem_pr = 0;
		totem_re = 0;
		//
		totem_s   = 0.25;
		totem_w   = sprite_get_width(s_totems) * totem_s;
		totem_r   = 70;
		//
		totems_y[1] = -(global.height / 2);
		totems_y[2] = -(global.height / 2 - 100 + totem_w);
		totems_y[3] = -(global.height / 2 - 100 + totem_w * 2);
		//
		totems_x[1] = 0;
		totems_x[2] = 0;
		totems_x[3] = 0;
		//
		totems_p[1] = 1;
		totems_p[2] = 1;
		totems_p[3] = 1;
	#endregion
	#region Координаты и цвет
		text_x = totem_w * 0.8;
		for(i = 1; i <= 18; i ++)
		{
			#region Координата X
				totem_x[i] = 0;
				totem_y[i] = 0;
				totems_ss[i] = 1;
				if i = 1 or i = 4 or i = 7 or i = 10 or i = 12 or i = 15 or i = 16
				{
					totem_x[i] = 0;
				}
				if i = 2 or i = 5 or i = 8 or i = 11 or i = 13 or i = 17
				{
					totem_x[i] = totem_w * 0.8;
				}
				if i = 3 or i = 6 or i = 9 or i = 14 or i = 18
				{
					totem_x[i] = 2 * totem_w * 0.8;
				}
			#endregion
			#region Координата Y
				if i = 1 or i = 2 or i = 3
				{
					totem_y[i] = 0;
				}
				if i = 4 or i = 5 or i = 6
				{
					totem_y[i] = totem_w * 0.8;
				}
				if i = 7 or i = 8 or i = 9
				{
					totem_y[i] = 2 * (totem_w * 0.8) + totem_r;
				}
				if i = 10 or i = 11
				{
					totem_y[i] = 3 * (totem_w * 0.8) + totem_r;
				}
				if i = 12 or i = 13 or i = 14
				{
					totem_y[i] = 4 * (totem_w * 0.8) + totem_r * 2;
				}
				if i = 15
				{
					totem_y[i] = 5 * (totem_w * 0.8) + totem_r * 2;
				}
				if i = 16 or i = 17 or i = 18
				{
					totem_y[i] = 6 * (totem_w * 0.8) + totem_r * 3;
				}
			#endregion
			#region Цвет тотема
				totem_c[i] = c_white;
				if i <= 6
				{
					totem_c[i] = global.color_white;
				}
				if i > 6 && i <= 11
				{
					totem_c[i] = c_aqua;
				}
				if i > 11 && i <= 15
				{
					totem_c[i] = c_fuchsia;
				}
				if i > 15
				{
					totem_c[i] = c_orange;
				}
			#endregion
		}
		text_y[1] = -totem_r * 1.5;
		text_y[2] = (totem_y[4] + totem_y[7]) / 2;
		text_y[3] = (totem_y[10] + totem_y[12]) / 2;
		text_y[4] = (totem_y[15] + totem_y[16]) / 2;
	#endregion
#endregion
#region Магазин
	#region Координаты магазина
		store_yy  = 0;
		store_yy1 = 0;
		store_pr  = 0;
		store_tap = 1;
		y_ind     = 0;
	#endregion
	#region Лутбоксы: основное
		lootbox_y     = global.height / 2 - 100 - 100 + 30;
		lootbox_alpha = 0; // Темный фон
		lootbox_aa    = 0; // Альфа вспышки
		lootbox_s     = 0; // Стейдж
		lootbox_a     = 0; // Угол
		lootbox_d     = 1; // Направление угла
		lootbox_t     = 0; // Время тряски
		lootbox_i     = 0; // Индекс кадра для анимации
	#endregion
	#region Темы, координаты
		theme_a1[1] = 0;
		theme_x1[1] = 0;
		theme_y1[1] = 0;
		//
		theme_a1[2] = 0;
		theme_x1[2] = 0;
		theme_y1[2] = 0;
		//
		theme_a1[3] = 0;
		theme_x1[3] = 0;
		theme_y1[3] = 0;
	#endregion
	#region Лутбоксы: вещи
		lootbox_item_s[1]  = 0;
		lootbox_item_s[2]  = 0;
		lootbox_item_s[3]  = 0; // Скейл ?
		//
		lootbox_item_ss[1] = 0;
		lootbox_item_ss[2] = 0;
		lootbox_item_ss[3] = 0; // Скейл I
		//
		lootbox_item_x[1] = 0;
		lootbox_item_x[2] = 0;
		lootbox_item_x[3] = 0; 
		//			
		lootbox_item_y[1] = 0;
		lootbox_item_y[2] = 0;
		lootbox_item_y[3] = 0; // Координаты
		//
		lootbox_item_t[1] = 0;
		lootbox_item_t[2] = 0;
		lootbox_item_t[3] = 0; // Тип - тотем или листовка
		//
		lootbox_item_i[1] = 0;
		lootbox_item_i[2] = 0;
		lootbox_item_i[3] = 0; /// Номера (тотема или персонажа)
		//
		lootbox_item_c[1] = 0;
		lootbox_item_c[2] = 0;
		lootbox_item_c[3] = 0; /// Цвет
		//
		lootbox_item_v[1] = 0;
		lootbox_item_v[2] = 0;
		lootbox_item_v[3] = 0; /// Количество (листовок)
		//
		lootbox_item_o[1] = 0;
		lootbox_item_o[2] = 0;
		lootbox_item_o[3] = 0; //// Открыто или нет
	#endregion
	#region Лубоксы: покупка первого и второго
		lootbox_buy[1]   = 0;
		lootbox_buy[2]   = 0;
		//
		lootbox_buy_s[1] = 0;
		lootbox_buy_s[2] = 0;
	#endregion
	#region Левелап
		lvlup[1] = 0;
		lvlup[2] = 0;
		lvlup[3] = 0;
	#endregion
	#region Дейли
		daily_y = global.height / 2 - 100 + 500 - 100 + 30;
		ini_open("Music.ini");
			if !ini_section_exists("Design")
			{
				#region Рандом Дейли
					var d_t1, d_n1, d_p1, d_r1, dasd1,
					d_t2, d_n2, d_p2, d_r2, dasd2,
					d_t3, d_n3, d_p3, d_r3, dasd3;
					dasd1 = 0;
					dasd2 = 0;
					dasd3 = 0;
					d_t1 = choose(1, 1, 1, 1, 0);
					d_t2 = choose(1, 1, 1, 1, 0);
					if d_t1 = 0 && d_t2 = 0
					{
						d_t3 = 1;
					}
					else
					{
						d_t3 = choose(1, 1, 1, 1, 0);
					}
					var ta;
					ta = 0;
					for(l = 1; l <= 18; l++)
					{
						ta += global.totem_have[l];
					}
					if ta = 18
					{
						d_t1 = 1;
						d_t2 = 1;
						d_t3 = 1;
					}
					//
					d_p1 = choose(1, 0);
					d_p2 = choose(1, 0);
					if d_p1 = 0 && d_p2 = 0
					{
						d_p3 = 1;
					}
					else
					{
						if d_p1 = 1 && d_p2 = 1
						{
							d_p3 = 0;
						}
						else
						{
							d_p3 = choose(1, 1, 0);
						}
					}
					//
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
										for(i = 1; i <= 4; i ++)
										{
											if global.totem_have[i+11] = 0
											{
												totems += string(i);
											}
										}
										if totems = ""
										{
											if trr = 3
											{
												tr = 4;
											}
											else
											{
												d_t1 = 1;
											}
										}
									}
								#endregion
								#region Четвёртый
									if tr = 4
									{
										totems = "";
										for(i = 1; i <= 3; i ++)
										{
											if global.totem_have[i+15] = 0
											{
												totems += string(i);
											}
										}
										if totems = ""
										{
											if trr = 4
											{
												tr = 3;
											}
											else
											{
												d_t1 = 1;
											}
										}
									}
								#endregion
							}
							if d_t1 = 0
							{
								ti = irandom_range(1, string_length(totems));
								if tr = 3
								{
									dasd1 = c_fuchsia;
									d_n1 = 11 + real(string_copy(totems, ti, 1));
								}
								if tr = 4
								{
									dasd1 = c_orange;
									d_n1 = 15 + real(string_copy(totems, ti, 1));
								}
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
										for(i = 1; i <= 5; i ++)
										{
											if global.totem_have[i+6] = 0
											&& (d_t1 == 1 or (d_t1 == 0 && d_n1 != i+6))
											{
												totems += string(i);
											}
										}
										if totems = ""
										{
											if trr = 2
											{
												tr = 3;
											}
											else
											{
												d_t2 = 1;
											}
										}
									}
								#endregion
								#region Третий
									if tr = 3
									{
										totems = "";
										for(i = 1; i <= 4; i ++)
										{
											if global.totem_have[i+11] = 0
											&& (d_t1 == 1 or (d_t1 == 0 && d_n1 != i+11))
											{
												totems += string(i);
											}
										}
										if totems = ""
										{
											if trr = 3
											{
												tr = 2;
											}
											else
											{
												d_t2 = 1;
											}
										}
									}
								#endregion
							}
							if d_t2 = 0
							{
								ti = irandom_range(1, string_length(totems));
								if tr = 2
								{
									dasd2 = c_aqua;
									d_n2 = 6 + real(string_copy(totems, ti, 1));
								}
								if tr = 3
								{
									dasd2 = c_fuchsia;
									d_n2 = 11 + real(string_copy(totems, ti, 1));
								}
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
										for(i = 1; i <= 6; i ++)
										{
											if global.totem_have[i] = 0
											&& (d_t1 == 1 or (d_t1 == 0 && d_n1 != i))
											&& (d_t2 == 1 or (d_t2 == 0 && d_n2 != i))
											{
												totems += string(i);
											}
										}
										if totems = ""
										{
											if trr = 1
											{
												tr = 2;
											}
											else
											{
												d_t3 = 1;
											}
										}
									}
								#endregion
								#region Второй
									if tr = 2
									{
										totems = "";
										for(i = 1; i <= 5; i ++)
										{
											if global.totem_have[i+6] = 0
											&& (d_t1 == 1 or (d_t1 == 0 && d_n1 != i+6))
											&& (d_t2 == 1 or (d_t2 == 0 && d_n2 != i+6))
											{
												totems += string(i);
											}
										}
										if totems = ""
										{
											if trr = 2
											{
												tr = 1;
											}
											else
											{
												d_t3 = 1;
											}
										}
									}
								#endregion
							}
							if d_t3 = 0
							{
								ti = irandom_range(1, string_length(totems));
								if tr = 1
								{
									dasd3 = global.color_white;
									d_n3 = real(string_copy(totems, ti, 1));
								}
								if tr = 2
								{
									dasd3 = c_aqua;
									d_n3 = 6 + real(string_copy(totems, ti, 1));
								}
							}
						#endregion
					}
					if d_t1 = 1
					{
						d_r1 = choose(16, 32, 64);
						if d_r1 = 2
						{
							dasd1 = global.color_white;
						}
						if d_r1 > 2 && d_r1 < 8
						{
							dasd1 = c_aqua;
						}
						if d_r1 >= 8 && d_r1 < 16
						{
							dasd1 = c_fuchsia;
						}
						if d_r1 = 16
						{
							dasd1 = c_orange;
						}
						if d_r1 >= 32
						{
							dasd1 = c_yellow;
						}
					}
					else
					{
						d_r1 = 0;
					}
					if d_t2 = 1
					{
						d_r2 = choose(6, 8, 10);
						if d_r2 = 2
						{
							dasd2 = global.color_white;
						}
						if d_r2 > 2 && d_r2 < 8
						{
							dasd2 = c_aqua;
						}
						if d_r2 >= 8 && d_r2 < 16
						{
							dasd2 = c_fuchsia;
						}
						if d_r2 = 16
						{
							dasd2 = c_orange;
						}
						if d_r2 >= 32
						{
							dasd2 = c_yellow;
						}
					}
					else
					{
						d_r2 = 0;
					}
					if d_t3 = 1
					{
						d_r3 = choose(2, 4, 6);
						if d_r3 = 2
						{
							dasd3 = global.color_white;
						}
						if d_r3 > 2 && d_r3 < 8
						{
							dasd3 = c_aqua;
						}
						if d_r3 >= 8 && d_r3 < 16
						{
							dasd3 = c_fuchsia;
						}
						if d_r3 = 16
						{
							dasd3 = c_orange;
						}
						if d_r3 >= 32
						{
							dasd3 = c_yellow;
						}
					}
					else
					{
						d_r3 = 0;
					}
					//
					if d_t1 = 1
					{
						d_n1 = irandom_range(1, global.heroes_val);
					}
					if d_t2 = 1
					{
						if d_t1 = 1 
						{
							if d_n1 = 1
							{
								d_n2 = irandom_range(2, global.heroes_val);
							}
							else
							{
								if d_n1 = global.heroes_val
								{
									d_n2 = irandom_range(1, global.heroes_val - 1);
								}
								else
								{
									d_n2 = choose(irandom_range(1, d_n1 - 1), irandom_range(d_n1 + 1, global.heroes_val));
								}
							}
						}
						else
						{
							d_n2 = irandom_range(1, global.heroes_val);
						}
					}
					if d_t3 = 1
					{
						if d_t1 = 1 
						{
							if d_n1 = 1
							{
								d_n3 = irandom_range(2, global.heroes_val);
							}
							else
							{
								if d_n1 = global.heroes_val
								{
									d_n3 = irandom_range(1, global.heroes_val - 1);
								}
								else
								{
									d_n3 = choose(irandom_range(1, d_n1 - 1), irandom_range(d_n1 + 1, global.heroes_val));
								}
							}
						}
						else
						{
							if d_t2 = 1 
							{
								if d_n2 = 1
								{
										d_n3 = irandom_range(2, global.heroes_val);
								}
								else
								{
									if d_n2 = global.heroes_val
									{
										d_n3 = irandom_range(1, global.heroes_val - 1);
									}
									else
									{
										d_n3 = choose(irandom_range(1, d_n2 - 1), irandom_range(d_n2 + 1, global.heroes_val));
									}
								}
							}
							else
							{
								d_n3 = irandom_range(1, global.heroes_val);
							}
						}
					}
				#endregion
				#region Запись в ини
					ini_write_string("Design", "des4_t",  string(d_t1));
					ini_write_string("Design", "des4_n",  string(d_n1));
					ini_write_string("Design", "des4_p",  string(d_p1));
					ini_write_string("Design", "des4_pr", string(d_p1));
					ini_write_string("Design", "des4_r",  string(d_r1));
					ini_write_string("Design", "des4_c", string(dasd1));
					ini_write_string("Design", "des4_b", "0");
					//
					ini_write_string("Design", "des7_t",  string(d_t2));
					ini_write_string("Design", "des7_n",  string(d_n2));
					ini_write_string("Design", "des7_p",  string(d_p2));
					ini_write_string("Design", "des7_pr", string(d_p2));
					ini_write_string("Design", "des7_r",  string(d_r2));
					ini_write_string("Design", "des7_c", string(dasd2));
					ini_write_string("Design", "des7_b", "0");
					//
					ini_write_string("Design", "des9_t",  string(d_t3));
					ini_write_string("Design", "des9_n",  string(d_n3));
					ini_write_string("Design", "des9_p",  string(d_p3));
					ini_write_string("Design", "des9_pr", string(d_p3));
					ini_write_string("Design", "des9_r",  string(d_r3));
					ini_write_string("Design", "des9_c", string(dasd3));
					ini_write_string("Design", "des9_b", "0");
					//
					ini_write_string("Design", "ddd", "0");
					ini_write_string("Design", "dmm", "0");
				#endregion
			}
			#region Чтение из ини
				//
				daily_t[1]  = ini_read_real("Design", "des4_t",  1);
				daily_n[1]  = ini_read_real("Design", "des4_n",  1);
				daily_pr[1] = ini_read_real("Design", "des4_pr", 0);
				daily_r[1]  = ini_read_real("Design", "des4_r",  1);
				daily_c[1]  = ini_read_real("Design", "des4_c",  0);
				daily_b[1]  = ini_read_real("Design", "des4_b",  0);
				//
				daily_t[2]  = ini_read_real("Design", "des7_t",  1);
				daily_n[2]  = ini_read_real("Design", "des7_n",  1);
				daily_pr[2] = ini_read_real("Design", "des7_pr", 0);
				daily_r[2]  = ini_read_real("Design", "des7_r",  1);
				daily_c[2]  = ini_read_real("Design", "des7_c",  0);
				daily_b[2]  = ini_read_real("Design", "des7_b",  0);
				//
				daily_t[3]  = ini_read_real("Design", "des9_t",  1);
				daily_n[3]  = ini_read_real("Design", "des9_n",  1);
				daily_pr[3] = ini_read_real("Design", "des9_pr", 0);
				daily_r[3]  = ini_read_real("Design", "des9_r",  1);
				daily_c[3]  = ini_read_real("Design", "des9_c",  0);
				daily_b[3]  = ini_read_real("Design", "des9_b",  0);
				//
				nowday = ini_read_real("Design", "ddd", 0);
				nowmon = ini_read_real("Design", "dmm", 0);
			#endregion
			for(i = 1; i <= 3; i ++)
			{
				daily_buy_s[i] = 0;
				daily_buy[i]   = 0;
				daily_p[i] = 0;
				if daily_t[i] = 1
				{
					#region Первый
						if daily_r[i] = 2
						{
							if daily_pr[i] = 1
							{
								daily_p[i] = 2;
							}
							else
							{
								daily_p[i] = 10;
							}
						}
					#endregion			
					#region Второй
						if daily_r[i] = 4
						{
							if daily_pr[i] = 1
							{
								daily_p[i] = 5;
							}
							else
							{
								daily_p[i] = 25;
							}
						}
					#endregion			
					#region Третий
						if daily_r[i] = 6
						{
							if daily_pr[i] = 1
							{
								daily_p[i] = 7;
							}
							else
							{
								daily_p[i] = 35;
							}
						}
					#endregion		
					#region Четвертый
						if daily_r[i] = 8
						{
							if daily_pr[i] = 1
							{
								daily_p[i] = 10;
							}
							else
							{
								daily_p[i] = 60;
							}
						}
					#endregion			
					#region Пятый
						if daily_r[i] = 10
						{
							if daily_pr[i] = 1
							{
								daily_p[i] = 12;
							}
							else
							{
								daily_p[i] = 80;
							}
						}
					#endregion		
					#region Шестой
						if daily_r[i] = 16
						{
							if daily_pr[i] = 1
							{
								daily_p[i] = 25;
							}
							else
							{
								daily_p[i] = 200;
							}
						}
					#endregion			
					#region Седьмой
						if daily_r[i] = 32
						{
							if daily_pr[i] = 1
							{
								daily_p[i] = 90;
							}
							else
							{
								daily_p[i] = 500;
							}
						}
					#endregion			
					#region Восьмой
						if daily_r[i] = 64
						{
							if daily_pr[i] = 1
							{
								daily_p[i] = 200;
							}
							else
							{
								daily_p[i] = 1000;
							}
						}
					#endregion	
				}
				else
				{
					#region Зависимость от цвета
						if daily_c[i] = global.color_white
						{
							if daily_pr[i] = 1
							{
								daily_p[i] = 15;
							}
							else
							{
								daily_p[i] = 75;
							}
						}
						if daily_c[i] = c_aqua
						{
							if daily_pr[i] = 1
							{
								daily_p[i] = 25;
							}
							else
							{
								daily_p[i] = 130;
							}
						}
						if daily_c[i] = c_fuchsia
						{
							if daily_pr[i] = 1
							{
								daily_p[i] = 60;
							}
							else
							{
								daily_p[i] = 300;
							}
						}
						if daily_c[i] = c_orange
						{
							if daily_pr[i] = 1
							{
								daily_p[i] = 160;
							}
							else
							{
								daily_p[i] = 800;
							}
						}
					#endregion
				}
			}
		ini_close();
	#endregion
	#region Цены и товар
		cash_y = global.height / 2 - 100 + 900 - 100 + 30;
		gold_y = global.height / 2 - 100 + 1600 + 30 - 100 + 30;
		cash_val[1] = 50;
		cash_pri[1] = "$0.99";
		cash_val[2] = 270;
		cash_pri[2] = "$4.99";
		cash_val[3] = 550;
		cash_pri[3] = "$9.99";
		cash_val[4] = 1200;
		cash_pri[4] = "$19.99";
		cash_val[5] = 3000;
		cash_pri[5] = "$49.99";
		cash_val[6] = 7000;
		cash_pri[6] = "$99.99";
		gold_val[1] = 100;
		gold_pri[1] = 20;
		gold_val[2] = 800;
		gold_pri[2] = 150;
		gold_val[3] = 5500;
		gold_pri[3] = 1000;
	#endregion
	#region Цены для России
		if os_get_region() = "RU"
		{
			cash_pri[1] = "15₽";
			cash_pri[2] = "399₽";
			cash_pri[3] = "749₽";
			cash_pri[4] = "1490₽";
			cash_pri[5] = "3790₽";
			cash_pri[6] = "7490₽";
		}
	#endregion
	#region Покупка голды
		gold_buy[1]   = 0;
		gold_buy[2]   = 0;
		gold_buy[3]   = 0;
		//
		gold_buy_s[1] = 0;
		gold_buy_s[2] = 0;
		gold_buy_s[3] = 0;
		//
		gold_noten[1] = 0;
		gold_noten[2] = 0;
		gold_noten[3] = 0;
	#endregion
#endregion
#region Персонажи
	#region Основные переменные
		hero_now = 4;
		hero_s   = 0.5;
		hero_yy  = 0;
		hero_yy1 = 1;
		hero_w   = sprite_get_width(s_wanted) * hero_s;
		hero_h   = sprite_get_height(s_wanted) * hero_s;
		hero_r   = 70;
		hero_re  = 0;
		hero_pr  = 0;
	#endregion
	#region Координаты, размер, уровень
	for(i = 1; i <= 7; i ++)
	{
		#region Координаты, размер
			hero_xx[i]  = 0;
			hero_yyy[i] = 0;
			hero_ss[i]  = 1;
			if i <= 2
			{
				hero_xx[i]  = (hero_w + hero_r) * (i - 1);
				hero_yyy[i] = 0;
				hero_lvl[i] = 0;
			}
			if i > 2 && i <= 4
			{
				hero_xx[i]  = (hero_w + hero_r)  * ((i-2) - 1);
				hero_yyy[i] = hero_h + hero_r;
				hero_lvl[i] = 0;
			}
			if i > 4 && i <= 6
			{
				hero_xx[i]  = (hero_w + hero_r)  * ((i-4) - 1);
				hero_yyy[i] = (hero_h + hero_r) * 2;
				hero_lvl[i] = 0;
			}
			if i = 7
			{
				hero_xx[i]  = 0;
				hero_yyy[i] = (hero_h + hero_r) * 3;
				hero_lvl[i] = 0;
			}
		#endregion
		#region Уровень
			if global.heroes_have[i] < 178 + 110 + 68 + 42 + 26 + 16 + 10 + 6 + 4 + 2
				{ hero_lvl[i] = 10; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6 - 10 - 16 - 26 - 42 - 68 - 110; hero_need[i] = 178; }
			if global.heroes_have[i] < 110 + 68 + 42 + 26 + 16 + 10 + 6 + 4 + 2
				{ hero_lvl[i] = 9; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6 - 10 - 16 - 26 - 42 - 68; hero_need[i] = 110; }
			if global.heroes_have[i] < 68 + 42 + 26 + 16 + 10 + 6 + 4 + 2
				{ hero_lvl[i] = 8; hero_now1[i] = global.heroes_have[i] - 2 - 4 - 6 - 10 - 16 - 26 - 42; hero_need[i] = 68; }
			//
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
			//
			levelup[1] = global.heroes_have[i];
			levelup[2] = global.heroes_have[i];
			levelup[3] = global.heroes_have[i];
		#endregion
	}
	#endregion
#endregion
#region Квесты
	#region Скейл и рефреш
		global.quests_scale   = 0;
		global.quests_scale1  = 0.7;
		global.quests_refresh = 1;
		nnn[1] = 0;
		nnn[2] = 0;
		nnn[3] = 0;
	#endregion
	ini_open("Music.ini");
		#region Основная работа с ини
			if !ini_section_exists("Qual")
			{
				#region Запись в ини
					nnn[1] = 1;
					nnn[2] = 1;
					nnn[3] = 1;
					ini_write_string("Qual", "qual_1", "1");
					ini_write_string("Qual", "qual_2", "1");
					ini_write_string("Qual", "qual_3", "1");
					//
					ini_write_string("Qual", "qual_a_1", "1");
					ini_write_string("Qual", "qual_a_2", "1");
					ini_write_string("Qual", "qual_a_3", "1");
					//
					ini_write_string("Qual", "qual_nno_1", "0");
					ini_write_string("Qual", "qual_nno_2", "0");
					ini_write_string("Qual", "qual_nno_3", "0");
					//
					ini_write_string("Qual", "qual_rr", "1");
				#endregion
			}
			else
			{
				#region Чтение из ини
					nnn[1] = ini_read_real("Qual", "qual_1", 1);
					nnn[2] = ini_read_real("Qual", "qual_2", 1);
					nnn[3] = ini_read_real("Qual", "qual_3", 1);
					//
					global.quests_t[1] = ini_read_real("Qual", "qual_t_1", 1);
					global.quests_t[2] = ini_read_real("Qual", "qual_t_2", 2);
					global.quests_t[3] = ini_read_real("Qual", "qual_t_3", 3);
					//
					global.quests_pt[1] = ini_read_real("Qual", "qual_pt_1", 1);
					global.quests_pt[2] = ini_read_real("Qual", "qual_pt_2", 2);
					global.quests_pt[3] = ini_read_real("Qual", "qual_pt_3", 3);
				#endregion
			}
		#endregion
		#region Чтение переменной рефреша
			global.quests_refresh = ini_read_real("Qual", "qual_rr", 1);
		#endregion
		#region Все варианты обновления
			#region 1 - 1 - 1
				if nnn[1] = 1 && nnn[2] = 1 && nnn[3] = 1
				{
					global.quests_t[1] = irandom_range(1, 26);
					global.quests_t[2] = global.quests_t[1];
					while(global.quests_t[2] = global.quests_t[1])
					{
						global.quests_t[2] = irandom_range(1, 26);
					}
					//
					global.quests_t[3] = global.quests_t[1];
					while(global.quests_t[3] = global.quests_t[1])
					{
						global.quests_t[3] = irandom_range(1, 26);
						while(global.quests_t[3] = global.quests_t[2])
						{
							global.quests_t[3] = irandom_range(1, 26);
						}
					}
					//
					ini_write_string("Qual", "qual_t_1", string(global.quests_t[1]));
					ini_write_string("Qual", "qual_t_2", string(global.quests_t[2]));
					ini_write_string("Qual", "qual_t_3", string(global.quests_t[3]));
					//
					ini_write_string("Qual", "qual_1", "0");
					ini_write_string("Qual", "qual_2", "0");
					ini_write_string("Qual", "qual_3", "0");
				}
			#endregion
			#region 1 - 1 - 0
				if nnn[1] = 1 && nnn[2] = 1 && nnn[3] = 0
				{
					global.quests_t[1] = global.quests_t[3];
					while(global.quests_t[1] = global.quests_t[3])
					{
						global.quests_t[1] = irandom_range(1, 26);
					}
					global.quests_t[2] = global.quests_t[3];
					//
					while(global.quests_t[2] = global.quests_t[3])
					{
						global.quests_t[2] = irandom_range(1, 26);
						while(global.quests_t[2] = global.quests_t[1])
						{
							global.quests_t[2] = irandom_range(1, 26);
						}
					}
					//
					ini_write_string("Qual", "qual_t_1", string(global.quests_t[1]));
					ini_write_string("Qual", "qual_t_2", string(global.quests_t[2]));
					//
					ini_write_string("Qual", "qual_1", "0");
					ini_write_string("Qual", "qual_2", "0");
				}
			#endregion
			#region 1 - 0 - 1
				if nnn[1] = 1 && nnn[2] = 0 && nnn[3] = 1
				{
					global.quests_t[1] = global.quests_t[2];
					while(global.quests_t[1] = global.quests_t[2])
					{
						global.quests_t[1] = irandom_range(1, 26);
					}
					//
					global.quests_t[3] = global.quests_t[2];
					while(global.quests_t[3] = global.quests_t[2])
					{
						global.quests_t[3] = irandom_range(1, 26);
						while(global.quests_t[3] = global.quests_t[1])
						{
							global.quests_t[3] = irandom_range(1, 26);
						}
					}
					//
					ini_write_string("Qual", "qual_t_1", string(global.quests_t[1]));
					ini_write_string("Qual", "qual_t_3", string(global.quests_t[3]));
					//
					ini_write_string("Qual", "qual_1", "0");
					ini_write_string("Qual", "qual_3", "0");
				}
			#endregion
			#region 0 - 1 - 1
				if nnn[1] = 0 && nnn[2] = 1 && nnn[3] = 1
				{
					global.quests_t[2] = global.quests_t[1];
					while(global.quests_t[2] = global.quests_t[1])
					{
						global.quests_t[2] = irandom_range(1, 26);
					}
					//
					global.quests_t[3] = global.quests_t[1];
					while(global.quests_t[3] = global.quests_t[1])
					{
						global.quests_t[3] = irandom_range(1, 26);
						while(global.quests_t[3] = global.quests_t[2])
						{
							global.quests_t[3] = irandom_range(1, 26);
						}
					}
					//
					ini_write_string("Qual", "qual_t_2", string(global.quests_t[2]));
					ini_write_string("Qual", "qual_t_3", string(global.quests_t[3]));
					//
					ini_write_string("Qual", "qual_2", "0");
					ini_write_string("Qual", "qual_3", "0");
				}
			#endregion
			#region 1 - 0 - 0
				if nnn[1] = 1 && nnn[2] = 0 && nnn[3] = 0
				{
					global.quests_t[1] = global.quests_t[2];
					while(global.quests_t[1] = global.quests_t[2])
					{
						global.quests_t[1] = irandom_range(1, 26);
						while(global.quests_t[1] = global.quests_t[3])
						{
							global.quests_t[1] = irandom_range(1, 26);
						}
					}
					//
					ini_write_string("Qual", "qual_t_1", string(global.quests_t[1]));
					//
					ini_write_string("Qual", "qual_1", "0");
				}
			#endregion
			#region 0 - 1 - 0
				if nnn[1] = 0 && nnn[2] = 1 && nnn[3] = 0
				{
					global.quests_t[2] = global.quests_t[1];
					while(global.quests_t[2] = global.quests_t[1])
					{
						global.quests_t[2] = irandom_range(1, 26);
						while(global.quests_t[2] = global.quests_t[3])
						{
							global.quests_t[2] = irandom_range(1, 26);
						}
					}
					//
					ini_write_string("Qual", "qual_t_2", string(global.quests_t[2]));
					//
					ini_write_string("Qual", "qual_2", "0");
				}
			#endregion
			#region 0 - 0 - 1
				if nnn[1] = 0 && nnn[2] = 0 && nnn[3] = 1
				{
					global.quests_t[3] = global.quests_t[1];
					while(global.quests_t[3] = global.quests_t[1])
					{
						global.quests_t[3] = irandom_range(1, 26);
						while(global.quests_t[3] = global.quests_t[2])
						{
							global.quests_t[3] = irandom_range(1, 26);
						}
					}
					ini_write_string("Qual", "qual_t_3", string(global.quests_t[3]));
					//
					ini_write_string("Qual", "qual_3", "0");
				}
			#endregion
		#endregion
		#region Переменные t
			global.quests_t[1] = ini_read_real("Qual", "qual_t_1", 1);
			global.quests_t[2] = ini_read_real("Qual", "qual_t_2", 2);
			global.quests_t[3] = ini_read_real("Qual", "qual_t_3", 3);
		#endregion
		#region Обновление, запись и чтение переменных
			for(i = 1; i <= 3; i ++)
			{
				#region Размер, доступность
					global.quests_a[i]     = ini_read_real("Qual", "qual_a_" + string(i), 1);
					global.quests_s[i]     = 0.5;
					global.quests_n_all[i] = 1;
				#endregion
				#region Обновление и запись
					if nnn[i] = 1
					{
						global.quests_n[i]  = 1;
						global.quests_n_all[i] = 1;
						global.quests_n_now[i] = 0;
						global.quests_pt[i] = choose("ç", "©", "©", "©");
						#region Задания 1
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
							{
								global.quests_n[i] = 1;
							}
							if global.quests_t[i] = 15
							{
								global.quests_n[i] = 2;
							}
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
							{
								global.quests_n[i] = 2;
							}
							if global.quests_t[i] = 20
							{
								global.quests_n[i] = 2;
							}
							if global.quests_t[i] = 21
							{
								global.quests_n[i] = 2;
							}
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
							{
								global.quests_n[i] = 2;
							}
							if global.quests_t[i] = 26
							{
								global.quests_n[i] = 2;
							}
					#endregion
						ini_write_string("Qual", "qual_pt_" + string(i), string(global.quests_pt[i]));
						ini_write_string("Qual", "qual_n_" + string(i), string(global.quests_n[i]));
						ini_write_string("Qual", "qual_a_" + string(i), "1");
						ini_write_string("Qual", "qual_nno_" + string(i), "0");
						global.quests_a[i] = ini_read_real("Qual", "qual_a_" + string(i), 1);
					}
				#endregion
				#region Чтение
					global.quests_n_now[i] = ini_read_real("Qual", "qual_nno_" + string(i), 1);
					global.quests_pt[i]    = ini_read_string("Qual", "qual_pt_" + string(i), "©");
					global.quests_n[i]     = ini_read_real("Qual", "qual_n_" + string(i), 1);
				#endregion
				#region Задания 2
					if global.quests_t[i] = 1 or global.quests_t[i] = 2
					or global.quests_t[i] = 3 or global.quests_t[i] = 4
					{
						switch(global.quests_n[i])
						{
							case 1:
								global.quests_n_all[i] = 3;
							break;
							case 2:
								global.quests_n_all[i] = 5;
							break;
						}
					}
					if global.quests_t[i] = 5 or global.quests_t[i] = 6 or global.quests_t[i] = 7
					or global.quests_t[i] = 8 or global.quests_t[i] = 9 or global.quests_t[i] = 10
					{
						switch(global.quests_n[i])
						{
							case 1:
								global.quests_n_all[i] = 10;
							break;
							case 2:
								global.quests_n_all[i] = 20;
							break;
							case 3:
								global.quests_n_all[i] = 30;
							break;
							case 4:
								global.quests_n_all[i] = 50;
							break;
						}
					}
					if global.quests_t[i] = 11 or global.quests_t[i] = 12 or global.quests_t[i] = 13
					{
						switch(global.quests_n[i])
						{
							case 1:
								global.quests_n_all[i] = 5;
							break;
							case 2:
								global.quests_n_all[i] = 10;
							break;
							case 3:
								global.quests_n_all[i] = 15;
							break;
						}
					}
					if global.quests_t[i] = 16
					{
						switch(global.quests_n[i])
						{
							case 1:
								global.quests_n_all[i] = 1000;
							break;
							case 2:
								global.quests_n_all[i] = 4000;
							break;
							case 3:
								global.quests_n_all[i] = 7000;
							break;
						}
					}
					if global.quests_t[i] = 17
					{
						switch(global.quests_n[i])
						{
							case 1:
								global.quests_n_all[i] = 5;
							break;
							case 2:
								global.quests_n_all[i] = 10;
							break;
							case 3:
								global.quests_n_all[i] = 15;
							break;
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
					if global.quests_t[i] = 25
					{
						global.quests_n_all[i] = 3;
					}
					if global.quests_t[i] = 26
					{
						global.quests_n_all[i] = 500;
					}
					#endregion
				#region Текст квестов
					global.quests_d[i] = "";
					if global.quests_t[i] > 0 && global.quests_t[i] <= 4
					{
						global.quests_d[i] = quest_text[1] + string(global.quests_n_all[i]) + quest_text[2];
					}
					if global.quests_t[i] >= 5 && global.quests_t[i] <= 10
					{
						global.quests_d[i] = quest_text[3] + string(global.quests_n_all[i]) + quest_text[4];
					}
					if global.quests_t[i] >= 11 && global.quests_t[i] <= 13
					{
						global.quests_d[i] = quest_text[5] + string(global.quests_n_all[i]) + quest_text[6];
					}
					if global.quests_t[i] != 16 && global.quests_t[i] != 17
					{
						if global.quests_t[i] < 16
							{
								global.quests_d[i] += quest_text[6+global.quests_t[i]];
							}
							else
							{
								global.quests_d[i] += quest_text[8+global.quests_t[i]];
							}
					}
					else
					{
						switch(global.quests_t[i])
						{
							case 16:
								global.quests_d[i]  = quest_text[22] + string(global.quests_n_all[i]) + quest_text[23];
							break;
							case 17:
								global.quests_d[i]  = quest_text[24] + string(global.quests_n_all[i]) + quest_text[25];
							break;
						}
					}
				#endregion
				#region Переменные p
					global.quests_p[i]  = 40;
					if global.quests_pt[i] = "©"
					{
						switch(global.quests_n[i])
						{
							case 1:
								global.quests_p[i] = 40;
							break;
							case 2:
								global.quests_p[i] = 60;
							break;
							case 3:
								global.quests_p[i] = 80;
							break;
							case 4:
								global.quests_p[i] = 100;
							break;
						}
					}
					else
					{
						switch(global.quests_n[i])
						{
							case 1:
								global.quests_p[i] = 8;
							break;
							case 2:
								global.quests_p[i] = 12;
							break;
							case 3:
								global.quests_p[i] = 16;
							break;
							case 4:
								global.quests_p[i] = 25;
							break;
						}
					}
				#endregion
			}
		#endregion
	ini_close();
#endregion
#region Ранг
	global.g_rank_now = 0;
	global.g_stars_need = 0;
	global.g_stars_now = 0;
	global.quick = 0;
	global.pvp   = 0;
	anim_skul = 0;
	#region ПЕРЕМЕННЫЕ
		var skul_i;
		skul_i = 15;
		if global.rank_stars < 70
			{ skul_i = 0; }
		if global.rank_stars < 69
			{ skul_i = 1; }
		if global.rank_stars < 63
			{ skul_i = 2; }
		if global.rank_stars < 57
			{ skul_i = 3; }
		if global.rank_stars < 51
			{ skul_i = 4; }
		if global.rank_stars < 46
			{ skul_i = 5; }
		if global.rank_stars < 41
			{ skul_i = 6; }
		if global.rank_stars < 36
			{ skul_i = 7; }
		if global.rank_stars < 31
			{ skul_i = 8; }
		if global.rank_stars < 26
			{ skul_i = 9; }
		if global.rank_stars < 21
			{ skul_i = 10; }
		if global.rank_stars < 16
			{ skul_i = 11; }
		if global.rank_stars < 12
			{ skul_i = 12; }
		if global.rank_stars < 8
			{ skul_i = 13;}
		if global.rank_stars < 5
			{ skul_i = 14; }
		if global.rank_stars < 2
			{ skul_i = 15; }
		global.player_rank = skul_i;
		GoogleAnalytics_SendEvent("PLAY","Ранг игрока: " + string(global.player_rank));
	#endregion
#endregion
#region Титры
	global.titles = 0;
	title_yy = global.height - 50 - 150;
	for(i = 1; i <= 25; i ++)
	{
		title_text[i]  = "";
		title_coll[i]  = global.color_white;
		title_scale[i] = 0.2;
		title_y[i] = 150 * i;
	}
	title_text[1]   = "";
	title_text[2]   = "";
	title_text[3]   = "VALLEY\nOF\nFIRE";
	title_text[4]   = "";
	title_coll[1]   = c_orange;
	title_coll[3]   = c_orange;
	title_coll[5]   = c_orange;
	title_coll[10]  = c_orange;
	title_coll[12]  = c_orange;
	title_coll[14]  = c_orange;
	title_coll[17]  = c_orange;
	title_coll[19]  = c_orange;
	title_coll[25]  = c_orange;
	title_text[5]   = "GAME DESIGN:";
	title_text[6]   = "ANDREW GOLENOK";
	title_text[7]   = "ARTEM SHUMEYKO";
	title_text[8]   = "NIKOLAY SAUTIN";
	title_text[9]   = "";
	title_text[10]  = "ART:";
	title_text[11]  = "NIKOLAY SAUTIN";
	title_text[12]  = "PROGRAMMING:";
	title_text[13]  = "ANDREW GOLENOK";
	title_text[14]  = "TASK DESIGN:";
	title_text[15]  = "ALEX STRELNIKOV";
	title_text[16]  = "ANDREW GOLENOK";
	title_text[17]  = "MUSIC:";
	title_text[18]  = "DANILA BARANOV";
	title_text[19]  = "SPECIAL THANKS:";
	title_text[20]  = "AKIM KASABULATOV";
	title_text[21]  = "KRISTINA ZIMAREVA";
	title_text[22]  = "VADIM DAVLETSHIN";
	title_text[23]  = "";
	title_text[24]  = "";
	title_text[25]  = "THANK YOU!";
	if os_get_language() = "ru"
	{
		title_text[1]   = "";
		title_text[2]   = "";
		title_text[3]   = "VALLEY\nOF\nFIRE";
		title_text[4]   = "";
		title_coll[1]   = c_orange;
		title_coll[3]   = c_orange;
		title_coll[5]   = c_orange;
		title_coll[10]  = c_orange;
		title_coll[12]  = c_orange;
		title_coll[14]  = c_orange;
		title_coll[17]  = c_orange;
		title_coll[19]  = c_orange;
		title_coll[25]  = c_orange;
		title_text[5]   = "ГЕЙМ ДИЗАЙН:";
		title_text[6]   = "АНДРЕЙ ГОЛЕНОК";
		title_text[7]   = "АРТЁМ ШУМЕЙКО";
		title_text[8]   = "НИКОЛАЙ САУТИН";
		title_text[9]   = "";
		title_text[10]  = "ХУДОЖНИК:";
		title_text[11]  = "НИКОЛАЙ САУТИН";
		title_text[12]  = "ПРОГРАММИСТ:";
		title_text[13]  = "АНДРЕЙ ГОЛЕНОК";
		title_text[14]  = "ДИЗАЙН ЗАДАЧ:";
		title_text[15]  = "АЛЕКСАНДР СТРЕЛЬНИКОВ";
		title_text[16]  = "АНДРЕЙ ГОЛЕНОК";
		title_text[17]  = "МУЗЫКА:";
		title_text[18]  = "ДАНИЛА БАРАНОВ";
		title_text[19]  = "ОТДЕЛЬНОЕ СПАСИБО:";
		title_text[20]  = "АКИМ КАСАБУЛАТОВ";
		title_text[21]  = "КРИСТИНА ЗИМАРЁВА";
		title_text[22]  = "ВАДИМ ДАВЛЕТШИН";
		title_text[23]  = "";
		title_text[24]  = "";
		title_text[25]  = "СПАСИБО ТЕБЕ!";
	}
	/// SPECIAL THANKS
#endregion
#region ПвП
	global.pvp_set = 0;
	global.pvp_now = 0;
	global.p_totem_p[1] = -1;
	global.p_totem_p[2] = -1;
	global.p_totem_p[3] = -1;
	pvp_rank_i = global.player_rank;
	pvp_pep = 30;
	if global.training_o != 0
	&& (nowday != current_day or nowmon != current_month)
	{
		global.menu_next = "quests";
	}
#endregion