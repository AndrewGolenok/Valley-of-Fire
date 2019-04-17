#region Включение рандома
	randomize();
#endregion
#region Пуши
	var map = ds_map_create();
	var ntf = push_get_first_local_notification(map);
	var data = ds_map_find_value(map, "data");
	push_cancel_local_notification(ntf);
	ntf = push_get_next_local_notification(map);
	ds_map_destroy(map);
	alarm[0] = 2;
#endregion
#region Автоподстройка разрешения
	application_surface_enable(1);
	device_mouse_dbclick_enable(true);
	//device_mouse_dbclick_enable(false);
	global.width  = 1280;
	global.height = 720;
	if os_type != os_macosx
	{
		global.height = (display_get_height() * global.width) / display_get_width();
	}
	if global.height < 590
	{
		global.height = 590;
	}
	if global.height > 960
	{
		global.height = 960;
	}
	global.more_size = global.height - 590;
	surface_resize(application_surface, global.width, global.height);
	display_set_gui_size(global.width, global.height);
	room_set_height(room, global.height);
	var VIEW = view_current;
	var camera = camera_create_view(0, 0, global.width, global.height, 0, -1, 0, 0, 0, 0);
	camera_destroy(camera_get_default());
	view_enabled = true;
	view_set_visible(VIEW, true);
	view_set_xport(VIEW, 0);
	view_set_yport(VIEW, 0);
	view_set_wport(VIEW, global.width);
	view_set_hport(VIEW, global.height);
	window_set_size(global.width, global.height);
	view_set_camera(VIEW, camera);
#endregion
#region Язык
	global.lang = "en";
#endregion
#region Ини сохранения
	ini_open("Music.ini");
		#region Музыка
			if !ini_section_exists("Music")
			{
				ini_write_string("Music", "music", "1");
				ini_write_string("Music", "sound", "1");
			}
			global.music = ini_read_real("Music", "music", 1);
			global.sound = ini_read_real("Music", "sound", 1);
		#endregion
		#region Обучение
			if !ini_section_exists("Training")
			{
				ini_write_string("Training", "tr1", "1");
				ini_write_string("Training", "tr2", "0");
				ini_write_string("Training", "tr3", "0");
				ini_write_string("Training", "tr4", "0");
				ini_write_string("Training", "tr5", "0");
				ini_write_string("Training", "tr6", "0");
			}
			global.tr[1] = ini_read_real("Training", "tr1", 1);
			global.tr[2] = ini_read_real("Training", "tr2", 0);
			global.tr[3] = ini_read_real("Training", "tr3", 0);
			global.tr[4] = ini_read_real("Training", "tr4", 0);
			global.tr[5] = ini_read_real("Training", "tr5", 0);
			global.tr[6] = ini_read_real("Training", "tr6", 0);
			if global.tr[6] = 2
			{
				global.training_o = 1;
			}
			else
			{
				global.training_o = 0;
			}
			global.training = 0;
		#endregion
		#region Валюта
			if !ini_section_exists("Sounds")
			{
				ini_write_string("Sounds", "sound_on_g", "0");
				ini_write_string("Sounds", "sound_false_c", "20");
			}
			global.gold = ini_read_real("Sounds", "sound_on_g", 0);
			global.cash = ini_read_real("Sounds", "sound_false_c", 0);
		#endregion
		#region Тотемы
			for(i = 0; i <= 19; i ++)
			{
				if !ini_section_exists("Totems")
				{
					ini_write_string("Totems", "totem" + string(i), "0");
					if i = 4
					{
						ini_write_string("Totems", "totem" + string(i), "1");
					}
					ini_write_string("Totems", "totem_n" + string(i), "0");
				}
				global.totem_have[i] = ini_read_real("Totems", "totem" + string(i), 0);
				global.totem_new[i]  = ini_read_real("Totems", "totem_n" + string(i), 0);
			}
		#endregion
		#region Листовки
			for(i = 1; i <= 7; i ++)
			{
				var ranran;
				ranran = irandom_range(1, 7);
				if !ini_section_exists("Heroes")
				{
					ini_write_string("Heroes", "heroes" + string(i), "0");
					ini_write_string("Heroes", "heroes" + string(ranran), "1");
					ini_write_string("Heroes", "heroes2", "1");
				}
				global.heroes_have[i] = ini_read_real("Heroes", "heroes" + string(i), 0);
			}
		#endregion
		#region Ранг и звёзды
			if !ini_section_exists("Ranks")
			{
				ini_write_string("Ranks", "ranks", "0");
			}
			global.rank_stars = ini_read_real("Ranks", "ranks", 0);
		#endregion
		#region Бо1
			if !ini_section_exists("Game")
			{
				ini_write_string("Game", "lastgame", "0");
				ini_write_string("Game", "lastgame2", "0");
			}
			global.last_game2 = ini_read_real("Game", "lastgame2", 0);
			global.last_game  = ini_read_real("Game", "lastgame", 0);
		#endregion
		#region Лаг
			if !ini_section_exists("Lug")
			{
				ini_write_string("Lug", "lug", "0");
			}
			global.lug = ini_read_real("Lug", "lug", 0);
		#endregion
		#region Реквест - Отзыв
			if !ini_section_exists("Request")
			{
				ini_write_string("Request", "request", "0");
				ini_write_string("Request", "wins", "0");
			}
			global.request = ini_read_real("Request", "request", 0);
			global.wins    = ini_read_real("Request", "wins", 0);
		#endregion
		#region Ежедневные покупки
			if !ini_section_exists("Daily")
			{
				ini_write_string("Daily", "daily_t1", "0");
				ini_write_string("Daily", "daily_t2", "0");
				ini_write_string("Daily", "daily_t3", "0");
				ini_write_string("Daily", "daily_n1", "0");
				ini_write_string("Daily", "daily_n2", "0");
				ini_write_string("Daily", "daily_n3", "0");
			}
			global.daily_t1 = ini_read_real("Daily", "daily_t1", 0);
			global.daily_t2 = ini_read_real("Daily", "daily_t2", 0);
			global.daily_t3 = ini_read_real("Daily", "daily_t3", 0);
			global.daily_t1 = ini_read_real("Daily", "daily_t1", 0);
			global.daily_t2 = ini_read_real("Daily", "daily_t2", 0);
			global.daily_t3 = ini_read_real("Daily", "daily_t3", 0);
		#endregion
		#region Ранг легенды
			if !ini_section_exists("Eho")
			{
				ini_write_string("Eho", "eho", "100");
			}
			global.legend_rank = ini_read_real("Eho", "eho", 100);
		#endregion
		#region Проверка на слив
			if !ini_section_exists("Musica")
			{
				ini_write_string("Musica", "back", "0");
			}
			global.notend = ini_read_real("Musica", "back", 0);
			if global.notend = 1
			{
				if global.rank_stars = 69 or global.rank_stars = 70
				{
					global.legend_rank += irandom_range(1, 10);
					if global.legend_rank > 100
					{
						global.legend_rank += 1;
					}
					ini_write_string("Eho", "eho", string(global.legend_rank));
				}
				if global.rank_stars != 0 && global.rank_stars != 16
				&& global.rank_stars != 41 && global.rank_stars != 69
				&& global.rank_stars != 70
				{
					global.rank_stars -= 1;
				}
				ini_write_string("Game", "lastgame", "0");
				ini_write_string("Game", "lastgame2", string(global.last_game));
				global.last_game2 = ini_read_real("Game", "lastgame2", 0);
				global.last_game  = ini_read_real("Game", "lastgame", 0);
			}
			ini_write_string("Musica", "back", "0");
			global.notend = 0;
		#endregion
		#region Квесты
			for(i = 1; i <= 7; i ++)
			{
				if !ini_section_exists("Var")
				{
					ini_write_string("Var", "v" + string(i), "0");
				}
				global.varr[i] = ini_read_real("Var", "v" + string(i), 0);
			}
		#endregion
		#region Шомен
			if !ini_section_exists("SHOMA")
			{
				ini_write_string("SHOMA", "sm", "0");
			}
			global.shomen1 = ini_read_real("SHOMA", "sm", 0);
			global.pvp = 0;
		#endregion
		#region Рука-меню
			if !ini_section_exists("Hand")
			{
				ini_write_string("Hand", "gold", "1");
				ini_write_string("Hand", "cash", "1");
			}
			global.hand_gold = ini_read_real("Hand", "gold", 0);
			global.hand_cash = ini_read_real("Hand", "cash", 0);
		#endregion
		#region Статистика
			if !ini_section_exists("Stats")
			{
				for(i = 1; i <= 2; i ++)
				{
					ini_write_string("Stats","stats_logic_" + string(i), "1");
					ini_write_string("Stats","stats_atten_" + string(i), "1");
					ini_write_string("Stats","stats_calcu_" + string(i), "1");
					ini_write_string("Stats","stats_memor_" + string(i), "1");
					ini_write_string("Stats","stats_speed_" + string(i), "1");
					ini_write_string("Stats","stats_hero_" + string(i), "1");
					ini_write_string("Stats","stats_theme_" + string(i), "1");
				}
				for(i = 1; i <= 8; i ++)
				{
					ini_write_string("Stats","stats_wins_" + string(i), "1");
					ini_write_string("Stats","stats_lose_" + string(i), "1");
				}
			}
			for(i = 1; i <= 2; i ++)
			{
				global.stats_logic[i] = ini_read_real("Stats","stats_logic_" + string(i), 1);
				global.stats_atten[i] = ini_read_real("Stats","stats_atten_" + string(i), 1);
				global.stats_calcu[i] = ini_read_real("Stats","stats_calcu_" + string(i), 1);
				global.stats_memor[i] = ini_read_real("Stats","stats_memor_" + string(i), 1);
				global.stats_speed[i] = ini_read_real("Stats","stats_speed_" + string(i), 1);
				global.stats_hero[i]  = ini_read_real("Stats","stats_hero_"  + string(i), 1);
				global.stats_theme[i] = ini_read_real("Stats","stats_theme_" + string(i), 1);
			}
			for(i = 1; i <= 8; i ++)
			{
				global.stats_wins[i] = ini_read_real("Stats","stats_wins_" + string(i), 1);
				global.stats_lose[i] = ini_read_real("Stats","stats_lose_" + string(i), 1);
			}
		#endregion
	ini_close();
#endregion
#region Персонажи
	ini_open("Language/" + global.lang + "/heroes_" + global.lang + ".ini");
		#region Характеристики игрока
			global.hero = 1;
			global.heroes_val  = 7;
			global.description_hp = ini_read_string("Description", "description_hp", "HEALTH:");
			global.description_at = ini_read_string("Description", "description_at", "DAMAGE:");
			global.description_ab = ini_read_string("Description", "description_ab", "ABILITY:");
			global.description_aa = ini_read_string("Description", "description_aa", "Active");
			global.description_pa = ini_read_string("Description", "description_pa", "Passive");
			global.description_hs = ini_read_string("Description", "description_hs", "STORY:");
			global.description_th = ini_read_string("Description", "description_th", "THEME:");
			global.property_level = ini_read_string("Description", "property_level", "lvl");
			global.property_wins  = ini_read_string("Description", "property_wins" , "WINS:");
			global.property_grade = ini_read_string("Description", "property_grade", "GRADE:");
			global.grade_rank[0]  = ini_read_string("Description", "grade_rank_0", "Unknow");
			global.grade_rank[1]  = ini_read_string("Description", "grade_rank_1", "Green");
			global.grade_rank[2]  = ini_read_string("Description", "grade_rank_2", "Bronze");
			global.grade_rank[3]  = ini_read_string("Description", "grade_rank_3", "Silver");
			global.grade_rank[4]  = ini_read_string("Description", "grade_rank_4", "Gold");
		#endregion
		#region Воришка
			global.hp[1]  = 700;
			global.atk[1] = 60;
			global.hero_code_name[1]    = "thief";
			global.hero_code_weapon[1]  = "knife";
			global.hero_code_theme[1]   = "cards";
			global.hero_full_wins[1]    = 90;
			global.hero_nofull_wins[1]  = 40;
			global.hero_full_loose[1]   = 0;
			global.hero_nofull_loose[1] = 0;
		#endregion
		#region Пьяница Джо
			global.hp[2]  = 800;
			global.atk[2] = 30;
			global.hero_code_name[2]    = "drunk";
			global.hero_code_weapon[2]  = "bottle";
			global.hero_code_theme[2]   = "bottles";
			global.hero_full_wins[2]    = 80;
			global.hero_nofull_wins[2]  = 80;
			global.hero_full_loose[2]   = 80;
			global.hero_nofull_loose[2] = 80;
		#endregion
		#region Охотница
			global.hp[3]  = 300;
			global.atk[3] = 140;
			global.hero_code_name[3]   = "huntress";
			global.hero_code_weapon[3] = "bow";
			global.hero_code_theme[3]  = "move";
			global.hero_full_wins[3]    = 20;
			global.hero_nofull_wins[3]  = 0;
			global.hero_full_loose[3]   = 0;
			global.hero_nofull_loose[3] = 0;
		#endregion
		#region Диего
			global.hp[4]  = 1200;
			global.atk[4] = 35;
			global.hero_code_name[4]    = "diego";
			global.hero_code_weapon[4]  = "rifle";
			global.hero_theme[4] = "attention";
			global.hero_full_wins[4]    = 5;
			global.hero_nofull_wins[4]  = 2;
			global.hero_full_loose[4]   = 2;
			global.hero_nofull_loose[4] = 1;
		#endregion
		#region Билл
			global.hp[5]  = 400;
			global.atk[5] = 150;
			global.hero_code_name[5]    = "sbill";
			global.hero_code_name1[5]   = "jbill";
			global.hero_code_weapon[5]  = "pistol";
			global.hero_code_theme[5]   = "shooting";
			global.hero_full_wins[5]    = 20;
			global.hero_nofull_wins[5]  = 0;
			global.hero_full_loose[5]   = 0;
			global.hero_nofull_loose[5] = 0;
		#endregion
		#region Шериф
			global.hp[6]  = 600;
			global.atk[6] = 70;
			global.hero_code_name[6]    = "sherif";
			global.hero_code_weapon[6]  = "revolver";
			global.hero_code_theme[6]   = "math";
			global.hero_full_wins[6]    = 4;
			global.hero_nofull_wins[6]  = 0;
			global.hero_full_loose[6]   = 0;
			global.hero_nofull_loose[6] = 2;
		#endregion
		#region Шаман
			global.hp[7]  = 1000;
			global.atk[7] = 41.5;
			global.hero_code_name[7]    = "shaman";
			global.hero_code_weapon[7]  = "spear";
			global.hero_code_theme[7]   = "storm";
			global.hero_full_wins[7]    = 0;
			global.hero_nofull_wins[7]  = 0;
			global.hero_full_loose[7]   = 0;
			global.hero_nofull_loose[7] = 50;
		#endregion
		#region Потом
			#region Гробовщик
				//global.hp[5]  = 250;
				//global.atk[5] = 82;
				//global.hero_code_name[5]    = "undertaker";
				//global.hero_code_weapon[5]  = "-";
				//global.hero_code_theme[5]   = "";
				//global.hero_full_wins[5]    = 0;
				//global.hero_nofull_wins[5]  = 0;
				//global.hero_full_loose[5]   = 100;
				//global.hero_nofull_loose[5] = 0;
			#endregion
			#region Доктор
				//global.hp[7]  = 1100;
				//global.atk[7] = 37.5;
				//global.hero_code_name[7]    = "doctor";
				//global.hero_code_weapon[7]  = "-";
				//global.hero_code_theme[7]   = "";
				//global.hero_full_wins[7]    = 30;
				//global.hero_nofull_wins[7]  = 50;
				//global.hero_full_loose[7]   = 0;
				//global.hero_nofull_loose[7] = 0;
			#endregion
			#region Гангстер
				//global.hp[9]  = 600;
				//global.atk[9] = 70;
				//global.hero_code_name[9]    = "gangster";
				//global.hero_code_weapon[9]  = "-";
				//global.hero_code_theme[9]   = "";
				//global.hero_full_wins[9]    = 900;
				//global.hero_nofull_wins[9]  = 0;
				//global.hero_full_loose[9]   = 0;
				//global.hero_nofull_loose[9] = 0;
			#endregion
			#region Вождь
				//global.hp[11]  = 400;
				//global.atk[11] = 100;
				//global.hero_code_name[11]    = "chief";
				//global.hero_code_weapon[11]  = "-";
				//global.hero_code_theme[11]   = "";
				//global.hero_full_wins[11]    = 0;
				//global.hero_nofull_wins[11]  = 0;
				//global.hero_full_loose[11]   = 0;
				//global.hero_nofull_loose[11] = 0;
			#endregion
		#endregion
	ini_close();
#endregion
#region Вопросы и темы
	for(i = 1; i <= 11; i ++)
	{
		global.theme_name[i] = "OTHER";
	}
	global.count_themes = 7;
	ini_open(global.lang + ".ini");
		for(i = 1; i <= 7; i ++)
		{
			global.theme_name[i] = ini_read_string("Theme", "theme_" + string(i), "");
		}
		global.color_white = make_color_rgb(255, 248, 220);
	ini_close();
#endregion
#region Шрифты
	var str1, str2;
	str1 = "0123456789?=≠+-/*><.";
	global.math_font = font_add_sprite_ext(s_question_fig, str1, true, 1);
	str2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ!?$%'@.,0123456789=≠+-/*><:;()°~©çœ®₽µ∂"; //"!"+"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюя"; 
	global.game_font = font_add_sprite_ext(s_game_font, str2, true, 1);
#endregion
#region Цвета персонажей
	global.color_hero[1]  = make_color_rgb(40 ,  40,  40);
	global.color_hero[2]  = make_color_rgb(60 , 179, 113);
	global.color_hero[3]  = make_color_rgb(186,  85, 211);
	global.color_hero[4]  = c_maroon;
	global.color_hero[5]  = global.color_white;
	global.color_hero[6]  = c_orange;
	global.color_hero[7]  = make_color_rgb(135, 206, 235);
#endregion
#region Параллакс
	global.paral_x  = 0;
	global.paral_y  = 0;
	global.paral_sx = 15;
	global.paral_sy = 20;
#endregion
#region Тотемы
	global.p_totem[1] = -1;
	global.p_totem[2] = -1;
	global.p_totem[3] = -1;
	global.e_totem[1] = -1;
	global.e_totem[2] = -1;
	global.e_totem[3] = -1;
	ini_open(global.lang + ".ini");
		for(i = 1; i <= 19; i ++)
		{
			global.totem_name[i] = ini_read_string("Totems", "totem_name_" + string(i), "");
			global.totem_desc[i] = ini_read_string("Totems", "totem_desc_" + string(i), "");
		}
	ini_close();
#endregion
#region Прочие переменные
	global.shomen      = 0;
	global.gold_color  = make_color_rgb(252,232,131);
	global.cash_color  = make_color_rgb(60 , 179, 113);
	global.player_rank = 15;
#endregion
#region Музыка
	global.music_gain = 1;
	global.music_pere = 0;
	global.back_prev  = 0;
	global.room_pere  = 0;
	global.room_rm    = 0;
	global.room_rmp   = 0;
	depth = -100000;
#endregion
#region Аналитика
	GoogleAnalytics_Init("UA-125015160-1", false);
	GoogleAnalytics_SendEvent("PLAY","Игрок зашёл в игру!");
#endregion
#region Меню
	global.menu_now  = "main";
	global.menu_next = "main";
#endregion
#region ОНЛАЙН: Создание объекта
	instance_create_depth(0, 0, -1, o_client);
#endregion
#region Прочее
	if os_type = os_ios
	{
		achievement_login();
	}
	alarm[2] = room_speed * 1.5;
	global.text_color = make_color_rgb(255, 228, 181);
	global.room_to_go = "set";
	room_goto_t("logo");
#endregion