#region Перемещение между комнатами
	if keyboard_check_pressed(ord("1"))
		{ room_goto_t("logo"); }
	if keyboard_check_pressed(ord("2"))
		{ room_goto_t("menu"); }
	if keyboard_check_pressed(ord("3"))
		{ room_goto_t("duel"); }
#endregion
#region Параллакс
	if keyboard_check(vk_left)
		{
		if global.paral_x > -1
			{ global.paral_x -= 0.1; }
		}
	if keyboard_check(vk_right)
		{
		if global.paral_x < 1
			{ global.paral_x += 0.1; }
		}
	if keyboard_check(vk_up)
		{
		if global.paral_y > -1
			{ global.paral_y -= 0.1; }
		}
	if keyboard_check(vk_down)
		{
		if global.paral_y < 1
			{ global.paral_y += 0.1; }
		}

	if os_type != os_macosx
		{
		global.paral_x = -device_get_tilt_y();
		global.paral_y = -device_get_tilt_x();
		}
#endregion
#region Ини-файлы
	#region Тренировка завершена
		if keyboard_check_pressed(ord("Z"))
			{
			ini_open("Music.ini");
				ini_write_string("Training", "tr1", "2");
				ini_write_string("Training", "tr2", "2");
				ini_write_string("Training", "tr3", "2");
				ini_write_string("Training", "tr4", "2");
				ini_write_string("Training", "tr5", "2");
				ini_write_string("Training", "tr6", "2");
		
				global.tr[1] = ini_read_real("Training", "tr1", 0);
				global.tr[2] = ini_read_real("Training", "tr2", 0);
				global.tr[3] = ini_read_real("Training", "tr3", 0);
				global.tr[4] = ini_read_real("Training", "tr4", 0);
				global.tr[5] = ini_read_real("Training", "tr5", 0);
				global.tr[6] = ini_read_real("Training", "tr6", 0);
			
					if global.tr[6] = 2
						{ global.training_o = 1; }
						else
						{ global.training_o = 0; }
					global.training = 0;
			ini_close();
			}
	#endregion
	#region Тренировка ноль
		if keyboard_check_pressed(ord("X"))
			{
			ini_open("Music.ini");
				ini_write_string("Training", "tr1", "1");
				ini_write_string("Training", "tr2", "0");
				ini_write_string("Training", "tr3", "0");
				ini_write_string("Training", "tr4", "0");
				ini_write_string("Training", "tr5", "0");
				ini_write_string("Training", "tr6", "0");
		
				global.tr[1] = ini_read_real("Training", "tr1", 0);
				global.tr[2] = ini_read_real("Training", "tr2", 0);
				global.tr[3] = ini_read_real("Training", "tr3", 0);
				global.tr[4] = ini_read_real("Training", "tr4", 0);
				global.tr[5] = ini_read_real("Training", "tr5", 0);
				global.tr[6] = ini_read_real("Training", "tr6", 0);
			
					if global.tr[6] = 2
						{ global.training_o = 1; }
						else
						{ global.training_o = 0; }
					global.training = 0;
			ini_close();
			}
	#endregion

	#region Рандомные уровни на листовках
		if keyboard_check_pressed(ord("C"))
			{
			ini_open("Music.ini");
				for(i=1;i<=7;i++)
					{
					ini_write_string("Heroes", "heroes" + string(i), string(irandom(42)));
					global.heroes_have[i] = ini_read_real("Heroes", "heroes" + string(i), 0);
					}
			ini_close();
			}
	#endregion
	#region Нулевой уровень на листовках
		if keyboard_check_pressed(ord("V"))
			{
			ini_open("Music.ini");
				for(i=1;i<=7;i++)
					{
					ini_write_string("Heroes", "heroes" + string(i), "0");
					ini_write_string("Heroes", "heroes4", "1");
					global.heroes_have[i] = ini_read_real("Heroes", "heroes" + string(i), 0);
					}
			ini_close();
			}
	#endregion

	#region Все тотемы есть
		if keyboard_check_pressed(ord("B"))
			{
			ini_open("Music.ini");
				for(i=0;i<=19;i++)
					{
					ini_write_string("Totems", "totem" + string(i), "1");
					ini_write_string("Totems", "totem_n" + string(i), "2");
					
					global.totem_have[i] = ini_read_real("Totems", "totem" + string(i), 0);
					global.totem_new[i]  = ini_read_real("Totems", "totem_n" + string(i), 0);
					}
			ini_close();
			}
	#endregion
	#region Все тотемы ноль
		if keyboard_check_pressed(ord("N"))
			{
			ini_open("Music.ini");
				for(i=0;i<=19;i++)
					{
					if i = 4
						{ ini_write_string("Totems", "totem" + string(i), "1"); }
						else
						{ ini_write_string("Totems", "totem" + string(i), "0"); }
					
					ini_write_string("Totems", "totem_n" + string(i), "0");
					
					global.totem_have[i] = ini_read_real("Totems", "totem" + string(i), 0);
					global.totem_new[i]  = ini_read_real("Totems", "totem_n" + string(i), 0);
					}
			ini_close();
			}
	#endregion

	#region Ранг рандомный
		if keyboard_check_pressed(ord("Q"))
			{
			ini_open("Music.ini");
				ini_write_string("Ranks", "ranks", string(irandom(70)));
				global.rank_stars = ini_read_real("Ranks", "ranks", 0);
			ini_close();
			}
	#endregion
	#region Ранг - ноль
		if keyboard_check_pressed(ord("W"))
			{
			ini_open("Music.ini");
				ini_write_string("Ranks", "ranks", "0");
				global.rank_stars = ini_read_real("Ranks", "ranks", 0);
			ini_close();
			}
	#endregion

	#region Рандом валюты
		if keyboard_check_pressed(ord("A"))
			{
			ini_open("Music.ini");
				ini_write_string("Sounds", "sound_on_g", string(irandom(1000)));
				ini_write_string("Sounds", "sound_false_c", string(irandom(1000)));
			
				global.gold = ini_read_real("Sounds", "sound_on_g", 0);
				global.cash = ini_read_real("Sounds", "sound_false_c", 0);
			ini_close();
			}
	#endregion
	#region Нулевая валюта
		if keyboard_check_pressed(ord("S"))
			{
			ini_open("Music.ini");
				ini_write_string("Sounds", "sound_on_g", "0");
				ini_write_string("Sounds", "sound_false_c", "0");
			
				global.gold = ini_read_real("Sounds", "sound_on_g", 0);
				global.cash = ini_read_real("Sounds", "sound_false_c", 0);
			ini_close();
			}
	#endregion
#endregion
#region Отладка
	//draw_set_font(global.game_font);
	//draw_text_transformed_t(mouse_x, mouse_y, string(global.quests_n_now[1]) + "~" + string(global.quests_n_now[2]) + "~" + string(global.quests_n_now[3]), 0.25, 0.25, 0, c_white, c_black);
#endregion