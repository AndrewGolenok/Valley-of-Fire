if keyboard_check_pressed(ord("1"))
	{ room_goto_t("logo"); }
if keyboard_check_pressed(ord("2"))
	{ room_goto_t("menu"); }
if keyboard_check_pressed(ord("3"))
	{ room_goto_t("duel"); }

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
	global.paral_x = device_get_tilt_y();
	global.paral_y = device_get_tilt_x();
	}
	
if keyboard_check_pressed(ord("C"))
	{
	#region Ини сохранения
	ini_open("Music.ini");
		#region Музыка
			ini_write_string("Music.ini", "Music.ini", "1");
			global.music = 0; //ini_read_real("Music.ini", "Music.ini", 1); // Музыка
		#endregion
		#region Обучение
			///
			ini_write_string("Training", "training", "0");
				
			ini_write_string("Training", "tr1", "1");
			ini_write_string("Training", "tr2", "0");
			ini_write_string("Training", "tr3", "0");
			ini_write_string("Training", "tr4", "0");
			ini_write_string("Training", "tr5", "0");
			ini_write_string("Training", "tr6", "0");
			
			global.training_o = ini_read_real("Training", "training", 0);
			
			global.tr[1] = ini_read_real("Training", "tr1", 0);
			global.tr[2] = ini_read_real("Training", "tr2", 0);
			global.tr[3] = ini_read_real("Training", "tr3", 0);
			global.tr[4] = ini_read_real("Training", "tr4", 0);
			global.tr[5] = ini_read_real("Training", "tr5", 0);
			global.tr[6] = ini_read_real("Training", "tr6", 0);
			///
		#endregion
		#region Валюта
			//global.reward = ini_read_real("Music.ini", "reward", 1); // Ранг
			//global.dollars = ini_read_real("Music.ini", "dollars", 1); // Бабки
		#endregion
	ini_close();
#endregion
	}
if keyboard_check_pressed(ord("V"))
	{
	#region Ини сохранения
	ini_open("Music.ini");
		#region Музыка
			ini_write_string("Music.ini", "Music.ini", "1");
			global.music = 0; //ini_read_real("Music.ini", "Music.ini", 1); // Музыка
		#endregion
		#region Обучение
			///
			ini_write_string("Training", "training", "0");
				
			ini_write_string("Training", "tr1", "2");
			ini_write_string("Training", "tr2", "2");
			ini_write_string("Training", "tr3", "2");
			ini_write_string("Training", "tr4", "2");
			ini_write_string("Training", "tr5", "2");
			ini_write_string("Training", "tr6", "1");
			
			global.training_o = ini_read_real("Training", "training", 0);
			
			global.tr[1] = ini_read_real("Training", "tr1", 0);
			global.tr[2] = ini_read_real("Training", "tr2", 0);
			global.tr[3] = ini_read_real("Training", "tr3", 0);
			global.tr[4] = ini_read_real("Training", "tr4", 0);
			global.tr[5] = ini_read_real("Training", "tr5", 0);
			global.tr[6] = ini_read_real("Training", "tr6", 0);
			///
		#endregion
		#region Валюта
			//global.reward = ini_read_real("Music.ini", "reward", 1); // Ранг
			//global.dollars = ini_read_real("Music.ini", "dollars", 1); // Бабки
		#endregion
	ini_close();
#endregion
	}
#region Отладка
	draw_set_font(global.game_font);
	//draw_text_transformed_t(mouse_x, mouse_y, string(global.paral_x) + ":" + string(global.paral_y), 0.25, 0.25, 0, c_white, c_black);
#endregion