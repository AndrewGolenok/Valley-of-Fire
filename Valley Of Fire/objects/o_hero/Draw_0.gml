#region Стан при онлайне
	var cancel_stun;
	cancel_stun = 0;
#endregion
#region Появление
	if !enemy
	{
		#region Игрока
			if skeleton_animation_get() = "greetings"
			{
				if x < xn
				{
					x += 10;
				}
				else
				{
					x = xn;
				}
				if x < xn / 2 - 20
				{
					x += 10;
					image_speed = spd_med;
				}
				if x >= xn / 2 - 50 && x < xn / 2 + 30
				{
					x += 5;
					image_speed = spd_max;
				}
				if x >= xn / 2 + 20 && x < xn
				{
					x += 2;
					image_speed = spd_min;
				}
				if x >= xn
				{
					change = 2;
					image_speed = spd_max;
				}
			}
		#endregion
	}
	else
	{
		#region Противника
			if skeleton_animation_get() = "greetings"
			{
				if x > xn
				{
					x -= 10;
				}
				else
				{
					x = xn;
				}
				if x > xn / 2 + 20
				{
					x -= 10;
					image_speed = spd_med;
				}
				if x <= xn / 2 + 50 && x > xn / 2 - 30
				{
					x -= 5;
					image_speed = spd_max;
				}
				if x <= xn / 2 - 20 && x > xn
				{
					x -= 2;
					image_speed = spd_min;
				}
				if x <= xn
				{
					change = 2;
					image_speed = spd_max;
				}
			}
		#endregion
	}
#endregion
#region Рисование персонажа и выстрел
	#region Параллакс
		var prx, pry;
		prx = global.paral_x * global.paral_sx;
		pry = global.paral_y * global.paral_sy;
		if global.background = "mine" or global.background = "saloon"
		{
			prx = -prx;
			pry = -pry;
		}
	#endregion
	#region Использование способности Охотницы
		if (super = 1 or (global.super_ability1 = 1 && huntress_poison) or hand_away > 0)// && !enemy//global.super_ability
		{
			if ability_index < 5
			{
				ability_index += 0.5;
			}
			else
			{
				ability_index += 0.4;
			}
			if ability_index >= 9
			{
				ability_index = 5;
			}
			if image_index >= hero_abindex && !huntress_poison
			{
				ability_alpha -= 0.2;
				ability_index = 9;
			}
			if global.swipe_ability = 0
			{
				draw_sprite_ext(ability_back, ability_index, x - 28 * !enemy + 28 * enemy + prx, y - 15 + pry, sc * scale, scale, 0, hero_color, ability_alpha);
			}
			else
			{
				if enemy
				{
					draw_sprite_ext(ability_back, ability_index, x - 28 * !enemy + 28 * enemy + prx, y - 15 + pry, sc * scale, scale, 0, global.color_hero[global.hero], ability_alpha);
				}
				else
				{
					draw_sprite_ext(ability_back, ability_index, x - 28 * !enemy + 28 * enemy + prx, y - 15 + pry, sc * scale, scale, 0, global.color_hero[global.enemy_hero], ability_alpha);
				}
			}
		}
		else
		{
			ability_index = 0;
			ability_alpha = 1;
		}
	#endregion
	#region Диего, стан
		if change = 5 && image_index = 28
		{
			if hero = 4
			{
				stun_seconds -= 1;
				if stun_seconds > 1
				{
					image_speed = spd_nor + 0.25;
					change = 5;
				}
				else
				{
					image_speed = spd_max;
					change = 2;
				}
				image_index = 18;
			}
		}
	#endregion
	#region Враг и Игрок
		if enemy
			{
			#region Враг
				#region Отрисовка Героя Врага
					draw_sprite_ext(sprite_index, image_index, x + 28 + prx, y - 15 + o_control.back_train_y1 + pry, sc * scale, scale, image_angle, c_white, 1);
					if global.pvp = 1
					{
						if global.now = 0
						{
							draw_sprite_ext(sprite_index, image_index, x + 28 + prx, y - 15 + o_control.back_train_y1 + pry, sc * scale, scale, 0, c_black, 0.45);
						}
					}
				#endregion
				#region Идол огня и Квест на огонь идола
					if global.idol[1] = 4
					{
						if fire_time = 0
						{
							/////// КВЕСТЫ
							for(i = 1; i <= 3; i ++)
							{
								if global.quests_a[i] = 1
								{
									if global.quests_t[i] = 24
									{
										if global.quests_n_now[i] < global.quests_n_all[i]
										{
											global.quests_n_now[i] += o_list.atk / 10;
										}
									}
									ini_open("Music.ini");
										ini_write_string("Qual", "qual_nno_" + string(i), string(global.quests_n_now[i]));
									ini_close();
								}
							}
							/////// КВЕСТЫ
							fire_time = room_speed;
							o_list.e_hp -= o_list.atk / 3; //o_list.e_hp -= o_list.atk / 10;
							o_list.dop_i[2] = 8;
							o_list.dop_text_color[2] = make_color_rgb(253,265,15);
							o_list.dop_text[8] = "-" + string(round(o_list.atk / 10));
							if global.super_ability = 0 && !(skeleton_animation_get() = "super") && !(image_index <= 20 && skeleton_animation_get() = "shoot")
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
						else
						{
							fire_time -= 1;
						}
						draw_sprite_ext(sprite_index, image_index, x + 28 + prx, y - 15 + o_control.back_train_y2 + pry, sc * scale, scale, 0, make_color_rgb(253,265,15), 0.2);
						abil_n += 0.4;
						draw_sprite_ext(s_fire, abil_n, x + 5 + prx, y - 145 - 100 + o_control.back_train_y2 + pry, sc * scale * 1.3, scale * 1.3, 0, c_white, 1);
					}
				#endregion
				#region Яд
					if poisoned > 0
					{
						global.vremiaiada += 1;
						poisoned -= 1;
						if poisoned mod room_speed = 0
						{
							o_list.e_hp -= o_list.atk / 5; //o_list.e_hp -= o_list.atk / 10;
							o_list.dop_i[2] = 8;
							o_list.dop_text_color[2] = (global.player_object).hero_color;
							o_list.dop_text[8] = "-" + string(round(o_list.atk / 10));
							if global.super_ability = 0 && !(skeleton_animation_get() = "super") && !(image_index <= 20 && skeleton_animation_get() = "shoot")
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
						draw_sprite_ext(sprite_index, image_index, x + 28 + prx, y - 15 + o_control.back_train_y1 + pry, sc * scale, scale, 0, c_fuchsia, 0.2);
						abil_n += 0.4;
						draw_sprite_ext(s_abil_thing_huntress, abil_n, x + 5 + prx, y - 145 - 100 + o_control.back_train_y2 + pry, sc * scale * 1.3, scale * 1.3, 0, c_white, 1);
					}
					else
					{
						if global.vremiaiada < room_speed * 15
						{
							global.vremiaiada = 0;
						}
					}
				#endregion
			#endregion
			}
			else
			{
			#region Игрока
				#region Отрисовка Героя Игрока
					draw_sprite_ext(sprite_index, image_index, x - 28 + prx, y - 15 + o_control.back_train_y2 + pry, sc * scale, scale, 0, c_white, 1);
					if global.pvp = 1
					{
						if global.now = 1
						{
							draw_sprite_ext(sprite_index, image_index, x - 28 + prx, y - 15 + o_control.back_train_y2 + pry, sc * scale, scale, 0, c_black, 0.45);
						}
					}
				#endregion
				#region Идол огня
				if global.idol[1] = 4
				{
					if fire_time = 0
					{
						fire_time = room_speed;
						o_list.hp -= o_list.e_atk / 3; // o_list.hp -= o_list.e_atk / 10;
						o_list.dop_i[1] = 7;
						o_list.dop_text_color[1] = make_color_rgb(253,265,15);
						o_list.dop_text[7] = "-" + string(round(o_list.e_atk / 5));
						if global.super_ability = 0 && !(skeleton_animation_get() = "super") && !(image_index <= 20 && skeleton_animation_get() = "shoot")
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
								cancel_stun = 1;
							}
						}
					}
					else
					{
						fire_time -= 1;
					}
					draw_sprite_ext(sprite_index, image_index, x - 28 + prx, y - 15 + o_control.back_train_y2 + pry, sc * scale, scale, 0, make_color_rgb(253,265,15), 0.2);
					abil_n += 0.4;
					draw_sprite_ext(s_fire, abil_n, x + 5 + prx, y - 145 - 100 + o_control.back_train_y2 + pry, sc * scale * 1.3, scale * 1.3, 0, c_white, 1);
				}
				#endregion
				#region Яд
					if poisoned > 0
					{
						poisoned -= 1;
						if poisoned mod room_speed = 0
						{
							o_list.hp -= o_list.e_atk / 5;
							o_list.dop_i[1] = 7;
							o_list.dop_text_color[1] = (global.enemy_object).hero_color;
							o_list.dop_text[7] = "-" + string(round(o_list.e_atk / 5));
							if global.super_ability = 0 && !(skeleton_animation_get() = "super") && !(image_index <= 20 && skeleton_animation_get() = "shoot")
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
									cancel_stun = 1;
								}
							}
						}
						draw_sprite_ext(sprite_index, image_index, x - 28 + prx, y - 15 + o_control.back_train_y2 + pry, sc * scale, scale, 0, c_fuchsia, 0.2);
						abil_n += 0.4;
						draw_sprite_ext(s_abil_thing_huntress, abil_n, x + 5 + prx, y - 145 - 100 + o_control.back_train_y2 + pry, sc * scale * 1.3, scale * 1.3, 0, c_white, 1);
					}
				#endregion
			#endregion
			}
	#endregion
	#region Шериф, стан
		if change = 5 && hero = 6 && image_index = 50 && stun_seconds >= 2
		{
			image_index = 28;
			stun_seconds -= 1;
			if stun_seconds > 1
			{
				change = 5;
			}
			else
			{
				change = 2;
			}
		}
	#endregion
	#region Стрельба
		if shoot = 1
		{
			#region Переменные персонажей
				if hero = 3 or hero = 1 or hero = 2 or hero = 7
				{
					bullet_index = 4;
				}
				if bullet_index < 4
				{
					bullet_index += 1.5;
				}
				else
				{
					sx += (weapon_spd * (!enemy) - weapon_spd * (enemy)) * 2;
				}
				if hero = 1 or hero = 2
				{
					knife_i += 0.5;
				}
			#endregion
			#region Снаряд при способности Охотницы (Охотница или Воришка)
				if huntress_poison
				{
					if hero = 3
					{
						#region Охотница
							draw_sprite_ext(s_huntress_ability, bullet_index, sx + 1 - 28 + prx, sy - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.4 * bullet_alpha);
							draw_sprite_ext(s_huntress_ability, bullet_index, sx - 1 - 28 + prx, sy - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.4 * bullet_alpha);
							draw_sprite_ext(s_huntress_ability, bullet_index, sx - 28 + prx, sy - 1 - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.4 * bullet_alpha);
							draw_sprite_ext(s_huntress_ability, bullet_index, sx - 28 + prx, sy + 1 - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.4 * bullet_alpha);
							for(i = 0; i <= 5; i ++)
							{
								draw_sprite_ext(s_huntress_ability, bullet_index, sx - 8 * i - 28 + prx, sy - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.4 / i * bullet_alpha);
							}
							draw_sprite_ext(s_huntress_ability, bullet_index, sx - 28 + prx, sy - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_white, 1 * bullet_alpha);
							draw_sprite_ext(s_huntress_ability, bullet_index, sx - 28 + prx, sy - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.8 * bullet_alpha);
						#endregion
					}
					else
					{
						#region Воришка
							draw_sprite_ext(s_bullet_knife, bullet_index + knife_i, sx + 1 - 28 + prx, sy - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.4 * bullet_alpha);
							draw_sprite_ext(s_bullet_knife, bullet_index + knife_i, sx - 1 - 28 + prx, sy - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.4 * bullet_alpha);
							draw_sprite_ext(s_bullet_knife, bullet_index + knife_i, sx - 28 + prx, sy - 1 - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.4 * bullet_alpha);
							draw_sprite_ext(s_bullet_knife, bullet_index + knife_i, sx - 28 + prx, sy + 1 - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.4 * bullet_alpha);
							for(i = 0; i <= 5; i ++)
							{
								draw_sprite_ext(s_bullet_knife, bullet_index + knife_i, sx - 8 * i - 28 + prx, sy - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.4 / i * bullet_alpha);
							}
							draw_sprite_ext(s_bullet_knife, bullet_index + knife_i, sx - 28 + prx, sy - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_white, 1 * bullet_alpha);
							draw_sprite_ext(s_bullet_knife, bullet_index + knife_i, sx - 28 + prx, sy - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.8 * bullet_alpha);
						#endregion
					}
				}
				#endregion
			#region Отрисовка снаряда
				if !(huntress_poison)
				{
					if enemy
					{
						#region Враг
							if global.e_totem_a[15] = 0
								{
									if global.e_critical != 3 - 1 * global.e_totem_a[3]
									{
										draw_sprite_ext(hero_bullet, bullet_index + knife_i, sx - 28 + prx, sy + pry, sc * scale - 0.025, scale + 0.025, 0, c_white, bullet_alpha);
									}
									else
									{
										draw_sprite_ext(hero_bullet, bullet_index + knife_i, sx - 28 + prx, sy + pry, sc * scale - 0.025, scale + 0.025, 0, global.color_hero[hero], bullet_alpha);
									}
								}
								else
								{
									draw_sprite_ext(hero_bullet, bullet_index + knife_i, sx - 28 + prx, sy + pry, sc * scale - 0.025, scale + 0.025, 0, global.color_hero[3], bullet_alpha);
								}
						#endregion
					}
					else
					{
						#region Игрок
							if have_posion = 0
							{
								if global.critical != 3 - 1 * global.p_totem_a[3]
								{
									draw_sprite_ext(hero_bullet, bullet_index + knife_i, sx - 28 + prx, sy + pry, sc * scale - 0.025, scale + 0.025, 0, c_white, bullet_alpha);
								}
								else
								{
									draw_sprite_ext(hero_bullet, bullet_index + knife_i, sx - 28 + prx, sy + pry, sc * scale - 0.025, scale + 0.025, 0, global.color_hero[hero], bullet_alpha);
								}
							}
							else
							{
								draw_sprite_ext(hero_bullet, bullet_index + knife_i, sx - 28 + prx, sy + pry, sc * scale - 0.025, scale + 0.025, 0, global.color_hero[3], bullet_alpha);
							}
						#endregion
					}
				}
			#endregion
			#region Снаряд попал в другого игрока
			if ((((sx >= global.width - x - sprite_get_width(s_bullet_revolver) - weapon_spd * 1.2) && !enemy) or ((sx <= (global.width - x) + weapon_spd * 1.2 + sprite_get_width(s_bullet_revolver)) && enemy)) && answer != -1)
			{
				if enemy
				{
					#region Противник попал по нам
						if answer = 1
						{
							enemy_deal();
						}
						else
						{
							with(o_hero)
							{
								enemy_miss();
							}
						}
					#endregion
				}
					else
				{
					#region Мы попали по противнику
						if o_list.bot_question <= global.question && (o_list.bot_task <= global.task) && o_list.bot_time2 > (5 + 3 * global.e_totem_a[4]) * room_speed
						{
							o_list.bot_time  = random(1) * room_speed;
							o_list.bot_time2 = (5 + 3 * global.e_totem_a[4]) * room_speed;
						}
						if answer = 1
						{
							player_deal();
						}
						else
						{
							player_miss();
						}
					#endregion
				}
				#region Обнуление ответа
					if answer != -1
					{
						shoot        = 0;
						bullet_index = 0;
						answer       = -1;
					}
				#endregion
			}
			#endregion
			#region Выстрел мимо
				if answer = 0 
				{
					if (sx > 1380 && !enemy) or (sx < - 100 && enemy)
					{
						shoot        = 0;
						bullet_index = 0;
						answer       = -1;
						//if global.online
						//{
						//	o_client.cl_stage[1] = 6;
						//}
					 }
				}
			#endregion
		}
		//if shoot = 0 && answer != -1
		//{
		//	answer = -1;
		//}
		#region Обнуление выстрела
			if answer = -1 && !super
			{
				shoot = 0;
				bullet_index = 0;
			}
		#endregion
	#endregion
#endregion
#region Суперспособность
	#region Использование способности игрока
		var abil;
		abil = asset_get_index("ability_hero_" + string(global.hero_code_name[hero]));
		script_execute(abil);
	#endregion
	#region Билл старший становится Биллом младшим
		if o_list.theme_choose = 4
		{
			if hero = 5
			{
				if enemy
				{
					#region У игрока
						if o_list.e_hp <= o_list.e_maxhp / 2
						{
							if bill_stage = 0
							{
								if global.jr_e = 0
								{
									global.jr_e = 1;
								}
								global.super_ability = 1;
								sprite_index = s_sbill1;
								hero_sprite  = s_sbill1;
								image_speed  = spd_nor + 0.5;
								bill_stage   = 1;
								skeleton_animation_set("death");
							}
						}
					#endregion
				}
				else
				{
					#region У противника
						if o_list.hp <= o_list.maxhp / 2
						{
							if global.hero = 5
							{
								//if os_get_language() = "ru"
								//{
								//	global.player_name = "БИЛЛ МЛ.";
								//}
								//else
								//{
								//	global.player_name = "BILL JR.";
								//}
							}
							if bill_stage = 0
							{
								global.super_ability = 1;
								sprite_index = s_sbill1;
								hero_sprite  = s_sbill1;
								image_speed  = spd_nor + 0.5;
								bill_stage   = 1;
								skeleton_animation_set("death");
							}
						}
					#endregion
				}
			}
		}
	#endregion
	#region Динамит Диего
		#region Анимация запуска динамита
			if diego_dynamit = 2 && ((image_index >= 18 && hero = 4) or (hero = 1))
			{
				diego_dynamit = 3;
			}
		#endregion
		#region Создание динамита
			if diego_dynamit = 3
			{
				if enemy = 0
				{
					dynamit_x = x + 375 * scale;
					dynamit_y = y - 200;
					dynamit_a = 135;
					dynamit_i = 0;
				}
				else
				{
					dynamit_x = x - 375 * scale;
					dynamit_y = y - 200;
					dynamit_a = 135;
					dynamit_i = 0;
				}
				diego_dynamit = 4;
			}
		#endregion
		#region Динамит запущен
			if diego_dynamit = 4
			{
				if !enemy
				{
					#region У игрока
						if dynamit_x < (global.enemy_object).x
						{
							dynamit_x += 30;
						}
						else
						{
							#region Снижение хп, изменение вида, создание взрыва
								(global.enemy_object).diego_boom = 1;
								view_xport = 0;
								view_yport = 0;
								o_list.view_go_right = 1;
								o_list.view_go_down  = 1;
								if o_list.e_hp > 0 && o_list.hp > 0
								{
									o_list.e_hp -= dynamit_d;
								}
							#endregion
							#region Квест на динамит
								for(i = 1; i <= 3; i ++)
								{
									if global.quests_t[i] = 21 && o_list.e_hp <= 0
									{
										if global.quests_n_now[i] < global.quests_n_all[i]
										{
											global.quests_n_now[i] += 1;
										}
										ini_open("Music.ini");
											ini_write_string("Qual", "qual_nno_" + string(i), string(global.quests_n_now[i]));
										ini_close();
									}
								}
							#endregion
							#region Запуск ответного динамита
								if (global.enemy_object).diego_dynamit = 1
								{
									with((global.enemy_object))
									{
										dynamit_d = o_list.atk + o_list.atk / 10 * (global.e_critical == 3);
										diego_dynamit = 2;
										stun_seconds -= 1;
										change = 3;
										skeleton_animation_set("super");
									}
								}
							#endregion
							#region Доп текст
								o_list.dop_i[2] = 8;
								o_list.dop_text_color[2] = (global.player_object).hero_color;
								o_list.dop_text[8] = "-" + string(dynamit_d);
							#endregion
							#region Смена анимации на получение урона
								if global.super_ability = 0 && !(skeleton_animation_get() = "super") && !(image_index <= 20 && skeleton_animation_get() = "shoot")
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
										cancel_stun = 1;
									}
								}
							#endregion
							#region Обнуление переменных
								diego_dynamit = 0;
								dynamit_d = 0;
								global.super_ability1 = 0;
								global.super_ability = 0;
								super = 0;
							#endregion
						}
						#region Отрисовка динамита
							dynamit_a -= 5;
							draw_sprite_ext(s_abil_thing_diego, 0, dynamit_x, dynamit_y, scale * 1.2, scale * 1.2, dynamit_a, c_white, 1)
						#endregion
					#endregion
				}
				else
				{
					#region У врага
						if dynamit_x > (global.player_object).x
						{
							dynamit_x -= 30;
						}
						else
						{
							#region Снижение хп, изменение вида, создание взрыва
								(global.player_object).diego_boom = 1;
								view_xport = 0;
								view_yport = 0;
								if o_list.view_go_left = 0 && o_list.view_go_down = 0
								{
									o_list.view_go_left = 1;
									o_list.view_go_down = 1;
								}
								if o_list.hp > 0 && o_list.e_hp > 0
								{
									o_list.hp -= dynamit_d;
								}
							#endregion
							#region Запуск ответного динамита
								if (global.player_object).diego_dynamit = 1
								{
									with((global.player_object))
									{
										dynamit_d = o_list.e_atk + o_list.e_atk / 10 * (global.e_critical == 3);
										diego_dynamit = 2;
										stun_seconds -= 1;
										change = 3;
										skeleton_animation_set("super");
									}
								}
							#endregion
							#region Доп текст
								o_list.dop_i[1] = 7;
								o_list.dop_text_color[1] = (global.enemy_object).hero_color;
								if global.critical == 3 - 1 * global.p_totem_a[3]
								{
									o_list.dop_text[7] = "-" + string(round(o_list.e_atk + o_list.e_atk / 10));
								}
								else
								{
									o_list.dop_text[7] = "-" + string(round(o_list.e_atk));
								}
							#endregion
							#region Смена анимации на получение урона
								if global.super_ability = 0 && !(skeleton_animation_get() = "super") && !(image_index <= 20 && skeleton_animation_get() = "shoot")
								{
									if stun != 0
									{
										stun = 0;
										answer = -1;
									}
									skeleton_animation_set("damaged");
									change = 1;
								}
							#endregion
							#region Обнуление переменных
								diego_dynamit = 0;
								dynamit_d = 0;
								global.super_ability1 = 0;
								global.super_ability = 0;
								super = 0;
							#endregion
						}
						dynamit_a -= 5;
						draw_sprite_ext(s_abil_thing_diego, 0, dynamit_x + prx, dynamit_y + pry, scale * 1.2, scale * 1.2, dynamit_a, c_white, 1)
					#endregion
				}
			}
		#endregion
	#endregion
#endregion
#region Стан и Взрыв
	#region Отрисовка взрыва
		if diego_boom > 0
		{
			draw_sprite_ext(s_diego_boom, diego_boom, x + prx, y - 200 + pry, scale * 1.2, scale * 1.2, 0, c_white, 1);
			diego_boom += 0.5;
			if diego_boom > 5
			{
				diego_boom = -1;
			}
		}
	#endregion
	#region Обнуление стана
		var stuun;
		stuun = stun;
		if hero = 5 && bill_stage = 0
		{
			if stun != 0
			{
				stun = 0;
				answer = -1;
			}
			if global.online && !enemy
			{
				cancel_stun = 1;
			}
		}
		if stun != 0
		{
			if global.p_totem_a[8] && !enemy
			{
				if stun != 0
				{
					stun = 0;
					answer = -1;
				}
				if global.online && !enemy
				{
					cancel_stun = 1;
				}
				#region ПОКАЗ ТОТЕМА: Тотем стана
					o_list.totem_show_n[1] = 8;
					if global.online
					{
						o_client.cl_stage[16] = 1; //o_client.cl_stage[1] = 16;
					}
				#endregion
			}
			if global.e_totem_a[8] && enemy
			{
				if stun != 0
				{
					stun = 0;
					answer = -1;
				}
				if global.online && !enemy
				{
					cancel_stun = 1;
				}
				#region ПОКАЗ ТОТЕМА: Тотем стана
					o_list.totem_show_n[2] = 8;
				#endregion
			}
		}
		if global.online && !enemy
		{
			if cancel_stun = 1 && stuun != 0
			{
				o_client.cl_stage[15] = 1; //o_client.cl_stage[1] = 15;
			}
		}
	#endregion
	#region Стан
		if global.super_ability = 0 && stun = 1 && skeleton_animation_get() != "stun"
		{
			stun_seconds = 3;
			sprite_index = hero_sprite;
			skeleton_animation_set("stun");
			image_index = 0;
			image_speed = spd_max;
			change = 4;
		}
	#endregion
	#region Билл младший в обратно Билла старшего
		if bill_boom >= 0
		{
			draw_sprite_ext(s_diego_boom, bill_boom, x + 20 + prx, y - 250 + pry, scale * 1.2, scale * 1.2, 0, c_white, 1);
			draw_sprite_ext(s_diego_boom, bill_boom, x - 20 + prx, y - 200 + pry, scale * 1.2, scale * 1.2, 0, c_white, 1);
			draw_sprite_ext(s_diego_boom, bill_boom, x + 20 + prx, y - 150 + pry, scale * 1.2, scale * 1.2, 0, c_white, 1);
			draw_sprite_ext(s_diego_boom, bill_boom, x - 20 + prx, y - 100 + pry, scale * 1.2, scale * 1.2, 0, c_white, 1);
			draw_sprite_ext(s_diego_boom, bill_boom, x + 20 + prx, y - 50  + pry, scale * 1.2, scale * 1.2, 0, c_white, 1);
			draw_sprite_ext(s_diego_boom, bill_boom, x - 20 + prx, y - 0   + pry, scale * 1.2, scale * 1.2, 0, c_white, 1);
			bill_boom += 0.5;
			if bill_boom > 6
			{
				bill_boom = -1;
			}
			if bill_boom = 3 && global.super_ability = 0
			{
				hero_sprite  = s_sbill;
				sprite_index = hero_sprite;
				skeleton_animation_set("idle");
				image_index = 0;
				image_speed = spd_max;
				change = 1;
			}
		}
	#endregion
	#region Обнуление способности Воришки
		if hand_away > 0
		{
			hand_away -= 1;
			if hand_away = 0
			{
				global.swipe_ability = 0;
				if global.super_ability	= 1
				{
					global.super_ability = 0;
				}
			}
		}
	#endregion
#endregion
#region Чучело
	if global.training > 0
	{
		if enemy
		{
			#region Мотание из стороны в сторону
				if (sc_angle < sc_dist && sc_dir = 1) or (sc_angle > -sc_dist && sc_dir = -1)
				{
					sc_angle += sc_spd * sc_dir;
				}
				else
				{
					sc_dir = -sc_dir;
					sc_angle += sc_spd * sc_dir;
				}
				if sc_dist > 10
				{
					sc_dist -= 1;
				}
				else
				{
					sc_dist = 10;
				}
				if sc_spd > 0.5
				{
					sc_spd -= 0.1;
				}
				else
				{
					sc_spd = 0.5;
				}
			#endregion
			#region Установка сроайта чучела
				if hero_sprite  != s_training_scarecrow
				or sprite_index != s_training_scarecrow
				or image_speed > 0
				{
					hero_sprite = s_training_scarecrow;
					sprite_index = hero_sprite;
					image_index  = 0;
					image_speed  = 0;
				}
			#endregion
			#region Обнуление переменных чучела
				image_angle  = sc_angle;
				super = 0;
				if stun != 0
				{
					stun = 0;
					answer = -1;
				}
				have_posion = 0;
				huntress_poison = 0;
				poisoned = 0;
			#endregion
		}
	}
#endregion