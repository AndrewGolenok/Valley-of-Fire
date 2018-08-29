#region Пуши
//randomize();
//fizra  = choose("miachik", "ganbol", "roketka", "fizcultura");
//fizra1 = choose("skakalka", "gira", "espander", "lizha");
//if mouse_check_button_pressed(mb_left)
//	{ click = instance_position(mouse_x, mouse_y, id); }
	
	
//if instance_position(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left)
//	{ click = 1; }
//if !instance_position(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left)
//	{ click = 0; }
//if distance_to_object(o_player) < sprite_width * 7
//	{
//	if sprite_index = s_1
//		{
//		if image_index < 4
//			{ image_index += 0.1; }
//			else
//			{ image_speed = 0.1; sprite_index = s_2; }
//		}
//	if sprite_index = s_2
//		{
//		if click
//			{ sprite_index = s_3; }
//		}
//	if sprite_index = s_3
//		{
//		if !click
//			{ sprite_index = s_2; }
//		if place_meeting(x, y, o_player)
//			{
//			// Вопрос
//			}
//		}
//	}
//	else
//	{
//	if sprite_index != s_1
//		{ sprite_index = s_1; image_index = 4; }
//	image_speed = 0;
//	if image_index > 0 
//		{ image_index -= 0.1; }
//	}
	
	var map = ds_map_create();
	var ntf = push_get_first_local_notification(map);
	while(ntf >= 0)
	   {
	   var data = ds_map_find_value(map, "data");
	   if data == "daily_reward 1" or data == "daily_reward 3" or data == "daily_reward 5" or data == "daily_reward 7"
	      {
	      push_cancel_local_notification(ntf);
	      }
	   ntf = push_get_next_local_notification(map);
	   }
	ds_map_destroy(map);

	alarm[0]=2;
#endregion
#region Реклама
	#region UnityADS
		//GoogleAnalytics_Init("UA-96583902-1", false); // Unity ADS
		//if os_type = os_ios
		//	{ unity_ads_init("1202480"); }
		//if os_type = os_android
		//	{ unity_ads_init("1202481"); }
	
		//unity_ads_set_test_mode(0); // 0 - for workable unity ads.
		//global.vidos = 0;
		//global.adv = 0;
	#endregion
	#region AdMob
		//GoogleMobileAds_Init("pub-5529510774102506"); // AdMob ADS
		//var google_b;
		//if os_device != device_ios_iphone and os_device != device_ios_iphone5 and display_get_width() > 640
		//	{ google_b = GoogleMobileAds_Full_Banner; }
		//	else
		//	{ google_b = GoogleMobileAds_Banner; }
		//if os_type=os_ios
		//	{					  
		//	GoogleMobileAds_AddBanner("ca-app-pub-5529510774102506/7557263279", GoogleMobileAds_Banner);
		//	GoogleMobileAds_MoveBanner(0, 2280);
    
		//	GoogleMobileAds_Init("ca-app-pub-5529510774102506/5940929278");
		//	GoogleMobileAds_LoadInterstitial();
		//	}
		//if os_type=os_android
		//	{
		//	GoogleMobileAds_AddBanner("ca-app-pub-5529510774102506/1371128871", GoogleMobileAds_Banner);
		//	GoogleMobileAds_MoveBanner(0, 2280);
    
		//	GoogleMobileAds_Init("ca-app-pub-5529510774102506/2847862071");
		//	GoogleMobileAds_LoadInterstitial();
		//	}
	
		//if !os_is_network_connected()
		//	{ alarm[1]=10*room_speed; }
	#endregion
#endregion
#region Автоподстройка разрешения
	application_surface_enable(1);
	
	device_mouse_dbclick_enable(0);
	global.size = 720; //640; // 720; //800; //960;
	if os_type != os_macosx
	    { global.size = (display_get_height() * 1280) / display_get_width(); }
	
	if global.size < 590 { global.size = 590; }
	if global.size > 960 { global.size = 960; }
	
	global.more_size = global.size - 590;

	surface_resize(application_surface, 1280, global.size);
	display_set_gui_size(1280, global.size);
	room_set_height(room, global.size);
	var VIEW = view_current;
	var camera = camera_create_view(0, 0, 1280, global.size, 0, -1, 0, 0, 0, 0);
	camera_destroy(camera_get_default());

	view_enabled = true;
	view_set_visible(VIEW, true);
	view_set_xport(VIEW, 0);
	view_set_yport(VIEW, 0);
	view_set_wport(VIEW, 1280);
	view_set_hport(VIEW, global.size);
	//view_set_wport(VIEW, display_get_width());
	//view_set_hport(VIEW, display_get_height());
	
	window_set_size(1280, global.size);

	view_set_camera(VIEW, camera);
#endregion
#region Язык
	global.lang = "en"; //os_get_language(); // Берём данные языка устройства
	//if os_type=os_windows
	//	{ global.lang=get_string("Выберите язык:\n1. en - Английский\n2. ru - Русский","en"); }
#endregion
#region Ини сохранения
	ini_open("Music.ini");
		#region Музыка
			if !ini_section_exists("Music")
			    { ini_write_string("Music", "music", "1"); }
			global.music = ini_read_real("Music", "music", 1);
		#endregion
		#region Обучение
			///
			if !ini_section_exists("Training")
			    {
				//ini_write_string("Training", "training", "0");
				//
				ini_write_string("Training", "tr1", "1");
				ini_write_string("Training", "tr2", "0");
				ini_write_string("Training", "tr3", "0");
				ini_write_string("Training", "tr4", "0");
				ini_write_string("Training", "tr5", "0");
				ini_write_string("Training", "tr6", "0");
				//ini_write_string("Music.ini", "reward", "1500");
				//ini_write_string("Music.ini", "dollars", "0");
				}
			//global.training_o = ini_read_real("Training", "training", 0);
			
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
			///
		#endregion
		#region Валюта
			if !ini_section_exists("Sounds")
			    {
				ini_write_string("Sounds", "sound_on_g", "0");
				ini_write_string("Sounds", "sound_false_c", "45");
				}
			//global.training_o = ini_read_real("Training", "training", 0);
			
			global.gold = ini_read_real("Sounds", "sound_on_g", 0);
			global.cash = ini_read_real("Sounds", "sound_false_c", 0);
		#endregion
		#region Тотемы
			for(i=0;i<=19;i++)
				{
				if !ini_section_exists("Totems")
				    {
					ini_write_string("Totems", "totem" + string(i), "0");
					if i = 4
						{ ini_write_string("Totems", "totem" + string(i), "0"); }
					}
				global.totem_have[i] = ini_read_real("Totems", "totem" + string(i), 0);
				}
		#endregion
		#region Листовки
			for(i=1;i<=7;i++)
				{
				if !ini_section_exists("Heroes")
				    {
					ini_write_string("Heroes", "heroes" + string(i), "0");
					ini_write_string("Heroes", "heroes4", "1");
					}
				global.heroes_have[i] = ini_read_real("Heroes", "heroes" + string(i), 0);
				}
		#endregion
		#region Ранг и звёзды
			if !ini_section_exists("Rank")
				{ ini_write_string("Ranks", "ranks", "0"); }
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
				{ ini_write_string("Lug", "lug", "0"); }
			global.lug = ini_read_real("Lug", "lug", 0);
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
	ini_close();
#endregion
#region Персонажи
	//global.hero = 1;
	global.player_rank = 15;
	global.heroes_val  = 7;
	global.weapon = "standard";
	
	ini_open("Language/" + string(global.lang) + "/heroes_"+string(global.lang) + ".ini");
	
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
	
	global.grade_rank[0] = ini_read_string("Description", "grade_rank_0", "Unknow");
	global.grade_rank[1] = ini_read_string("Description", "grade_rank_1", "Green");
	global.grade_rank[2] = ini_read_string("Description", "grade_rank_2", "Bronze");
	global.grade_rank[3] = ini_read_string("Description", "grade_rank_3", "Silver");
	global.grade_rank[4] = ini_read_string("Description", "grade_rank_4", "Gold");
	
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
		global.hp[6]  = 600;//900
		global.atk[6] = 70;//47
		
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
		
			//global.hero_code_name[5]   = "undertaker";
			//global.hero_code_weapon[5] = "-";
		
			//global.hero_code_theme[5] = "";
		
			//global.hero_full_wins[5]   = 0;
			//global.hero_nofull_wins[5] = 0;
			//global.hero_full_loose[5]   = 100;
			//global.hero_nofull_loose[5] = 0;
		#endregion
		#region Доктор
			//global.hp[7]  = 1100;
			//global.atk[7] = 37.5;
		
			//global.hero_code_name[7]   = "doctor";
			//global.hero_code_weapon[7] = "-";
		
			//global.hero_code_theme[7] = "";
		
			//global.hero_full_wins[7]   = 30;
			//global.hero_nofull_wins[7] = 50;
		
			//global.hero_full_loose[7]   = 0;
			//global.hero_nofull_loose[7] = 0;
		#endregion
		#region Гангстер
			//global.hp[9]  = 600;
			//global.atk[9] = 70;
		
			//global.hero_code_name[9]   = "gangster";
			//global.hero_code_weapon[9] = "-";
		
			//global.hero_code_theme[9] = "";
		
			//global.hero_full_wins[9]    = 900;
			//global.hero_nofull_wins[9]  = 0;
			//global.hero_full_loose[9]   = 0;
			//global.hero_nofull_loose[9] = 0;
		#endregion
		#region Вождь
			//global.hp[11]  = 400;
			//global.atk[11] = 100;
		
			//global.hero_code_name[11]   = "chief";
			//global.hero_code_weapon[11] = "-";
		
			//global.hero_code_theme[11] = "";
		
			//global.hero_full_wins[11]    = 0;
			//global.hero_nofull_wins[11]  = 0;
			//global.hero_full_loose[11]   = 0;
			//global.hero_nofull_loose[11] = 0;
		#endregion
	#endregion
	/*
	for(i=1;i<=global.heroes_val;i++)
		{
		global.hero_wins[i]  = global.hero_full_wins[i] + global.hero_nofull_wins[i];
		global.hero_loose[i] = global.hero_full_loose[i] + global.hero_nofull_loose[i];
		global.hero_games[i] = global.hero_wins[i] + global.hero_loose[i];
		
		global.hero_name[i]  = ini_read_string("Hero_"+string(i), "hero_name", "");
		
		global.hero_class[i] = ini_read_string("Hero_"+string(i), "hero_class", "");
		
		global.hero_description[i] = ini_read_string("Hero_"+string(i), "hero_description", "");
		
		global.ability_a1[i]  = ini_read_string("Hero_"+string(i), "ability_a1", "");
		global.ability_a2[i]  = ini_read_string("Hero_"+string(i), "ability_a2", "");
		global.ability_p1[i]  = ini_read_string("Hero_"+string(i), "ability_p1", "");
		global.ability_p2[i]  = ini_read_string("Hero_"+string(i), "ability_p2", "");
		
		global.hero_weapon[i] = ini_read_string("Hero_"+string(i), "hero_weapon", "");
		
		global.hero_theme[i]  = ini_read_string("Hero_"+string(i), "hero_theme", "");
		
		if global.hero_games[i] > 4
			{ global.hero_grade[i] = (global.hero_full_loose[i] + (global.hero_nofull_loose[i]) * 2 + (global.hero_nofull_wins[i]) * 3 + (global.hero_full_wins[i]) * 4) / (global.hero_games[i]); }
			else
			{ global.hero_grade[i] = 0; }
		
		global.hero_level[i] = 1;
		
		var f;
		f = (global.hero_full_loose[i] + (global.hero_nofull_loose[i]) * 2 + (global.hero_nofull_wins[i]) * 3 + (global.hero_full_wins[i]) * 4) * 25;
		if f > 0
			{
			for(j=1; f>0; j++)
				{
				f -= j * 100;
				if f >= 0
					{ global.hero_level[i] += 1; }
				}
			}
		
		global.hero_exp[i] = global.hero_grade[i] * global.hero_games[i] * 25;
		for(j=1; j<=global.hero_level[i]-1; j++)
			{ global.hero_exp[i] -= j * 100; }
		}
	*/
	ini_close();
#endregion
#region Характеристики игрока
	//global.player_name  = "Andrew";
	////global.hero = 1;
	//global.player_rank  = 15;
	////global.rank_stars   = 0;
	//global.weapon = "standard";
	
	//global.enemy_name   = "Werdna";
	//global.enemy_hero   = 3;
	//global.enemy_rank	= 15;
	//global.enemy_weapon = "standard";
	//global.enemy = 0;
	
	//global.hero		  = choose(1, 2, 3);
	//global.enemy_hero = choose(1, 2, 3);
#endregion
#region Вопросы и темы
	ini_open("Language/" + string(global.lang) + "/question_text_" + string(global.lang) + ".ini");
	global.question_text[1,1] = ini_read_string("Theme_1", "question_1", "");
	global.question_text[1,2] = ini_read_string("Theme_1", "question_2", "");
	global.question_text[1,3] = ini_read_string("Theme_1", "question_3", "");
	global.question_text[1,4] = ini_read_string("Theme_1", "question_4", "");
	
	global.question_text[3,1] = "Tap if hand direction is same!"; //ini_read_string("Theme_1", "question_1", "");
	global.question_text[3,2] = "Walk past the fences!";
	global.question_text[3,3] = "Swipe in the hand direction!";
	global.question_text[3,4] = "Tap if hand direction is equal...";
	
	global.question_text[2,1] = "Shoot the bottles in the\norder of their appearance!";
	global.question_text[2,2] = "Targets!";
	global.question_text[2,3] = "Shoot the bottles in the\nright sequence!";
	global.question_text[2,4] = "---";
	
	for(i=4;i<=8;i++)
		{
		for(j=1;j<=4;j++)
			{
			global.question_text[i,j] = "-";
			global.question_text[i,j] = "-";
			global.question_text[i,j] = "-";
			global.question_text[i,j] = "-";
			}
		}
	ini_close();
	
	for(i=1; i<=11; i++)
		{ global.theme_name[i] = "OTHER"; }
	
	global.count_themes = 7;
	ini_open("Language/" + string(global.lang) + "/theme_name_" + string(global.lang) + ".ini");
	
	global.theme_name[1] = "CARDS";
	global.theme_name[2] = "BOTTLES";
	global.theme_name[3] = "MOVE";
	global.theme_name[4] = "ATTENTION";
	global.theme_name[5] = "SHOOTING";
	global.theme_name[6] = "MATH";
	global.theme_name[7] = "STORM";
	
	global.color_white = make_color_rgb(255, 248, 220);
	ini_close();
#endregion
#region Шрифты
	var str1, str2;
	str1  = "0123456789?=≠+-/*><."; //"!"+"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюя"; 
	global.math_font = font_add_sprite_ext(s_question_fig, str1, true, 1);
	
	str2  = "ABCDEFGHIJKLMNOPQRSTUVWXYZАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ!?$%'@.,0123456789=≠+-/*><:;()°~©çœ®₽µ"; //"!"+"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюя"; 
	global.game_font = font_add_sprite_ext(s_game_font, str2, true, 1);
#endregion
#region Цвета персонажей
	global.color_hero[1]  = make_color_rgb(40 ,  40,  40);
	global.color_hero[2]  = make_color_rgb(60 , 179, 113);
	global.color_hero[3]  = make_color_rgb(186,  85, 211); // make_color_rgb(60 , 179, 113);
	global.color_hero[4]  = c_maroon;
	global.color_hero[5]  = global.color_white; //c_white;
	global.color_hero[6]  = c_orange;
	global.color_hero[7]  = make_color_rgb(135, 206, 235);//135, 206, 235
	//global.color_hero[8]  = make_color_rgb(105, 105, 105);
	//global.color_hero[9]  = make_color_rgb(220,  20,  60);
	//global.color_hero[10] = make_color_rgb(250, 235, 215);
	//global.color_hero[11] = make_color_rgb(220,  20,  60);
#endregion
#region Параллакс
	global.paral_x = 0;
	global.paral_y = 0;
	global.paral_sx = 12;
	global.paral_sy = 25;
#endregion
#region Тотемы
	global.p_totem[1] = -1;
	global.p_totem[2] = -1;
	global.p_totem[3] = -1;
	
	global.e_totem[1] = -1;
	global.e_totem[2] = -1;
	global.e_totem[3] = -1;
	
	for(i=1;i<=19;i++)
		{
		//global.totem_have[i] = 0;
		global.totem_name[i] = "TOTEM NAME";
		global.totem_desc[i] = "causes damage to the rival hero at the beginning and may damage your hero as well with the 50% possibility";
		}
	
	global.totem_name[1] = "FRIENDLY TOTEM";
	global.totem_desc[1] = "Increases the hero HP by 5%";
	
	global.totem_name[2] = "WARRIOR TOTEM";
	global.totem_desc[2] = "increases the hero ATK by 5%";
	
	global.totem_name[3] = "hostile totem";
	global.totem_desc[3] = "CRIT demands only one correct answer";
	
	global.totem_name[4] = "thinking totem";
	global.totem_desc[4] = "gives 3 additional seconds to answer";
	
	global.totem_name[5] = "grumpy totem";
	global.totem_desc[5] = "CRIT *2";
	
	global.totem_name[6] = "last chance";
	global.totem_desc[6] = "gives 20% ATK bonus if your rival next attack is mortal";
	
	global.totem_name[7] = "joyful totem";
	global.totem_desc[7] = "you are to choose the theme";
	
	global.totem_name[8] = "inaccessible totem";
	global.totem_desc[8] = "gives immunity to being stunned";
	
	global.totem_name[9] = "evasive totem";
	global.totem_desc[9] = "gives 5% possibility to avoid damage";
	
	global.totem_name[10] = "odd frog";
	global.totem_desc[10] = "turns into other random totem whose power will work";
	
	global.totem_name[11] = "happy lion";
	global.totem_desc[11] = "destroys all totems of either player";
	
	global.totem_name[12] = "steel bull";
	global.totem_desc[12] = "gives 35% possibility to block mortal attack";
	
	global.totem_name[13] = "ambiguous panther";
	global.totem_desc[13] = "causes damage to the rival hero at the beginning and may damage your hero as well with the 50% possibility";
	
	global.totem_name[14] = "all-seeing owl";
	global.totem_desc[14] = "all themes turn into your hero themes";
	
	global.totem_name[15] = "purple fox";
	global.totem_desc[15] = "SUPER demands one less correct answer";
	
	global.totem_name[16] = "rat thief";
	global.totem_desc[16] = "exchanges with your rival totem and its power works";
	
	global.totem_name[17] = "treacherous pig";
	global.totem_desc[17] = "turns all players totems into random ones";
	
	global.totem_name[18] = "King cobra";
	global.totem_desc[18] = "your weapon gets poison at every incorrect answer of your rival";
	
	global.totem_name[19] = "RAT";
	global.totem_desc[19] = "(DO NOTHING)";
	//// 1 - Увеличивает ХП  персонажа на 5%
	//// 2 - Увеличивает АТК персонажа на 5%
	// 3 - КРИТ требует всего 1 верный ответ
	// 4 - Даёт дополнительные 3 секунды на ответ
	// 5 - КРИТ х2
	// 6 - Если следующая атака противника будет смертельной бонус при атаке +20% от АТК
	// 7  - Тему всегда выбираете вы
	// 8  - Даёт иммунитет к ОГЛУШЕНИЮ
	// 9  - Вероятность УКЛОНИТЬСЯ от урона - 5%
	//// 10 - Превращается в другой случаный ТОТЕМ, его эффект срабатывает
	//// 11 - Уничтожает ВСЕ ТОТЕМЫ у каждого игрока
	
	// 12 - Вероятность 35% ЗАБЛОКИРОВАТЬ смертельный урон
	// 13 - В начале раунда наносит урон (АТК) герою противника и с вероятностью 50% наносит урон вашему герою 
	//// 14 - Все ТЕМЫ становятся темами вашего персонажа
	// 15 - СУПЕР требует на 1 верный ответ меньше
	
	//// 16 - Меняется местами с ТОТЕМОМ противника, его эффект срабатывает
	//// 17 - Превращает ВСЕ ТОТЕМЫ игроков в случаные
	// 18 - Ваше оружие получает ЯД при каждом промахе противника
	
	// 19 - деактивированный 16 тотем
#endregion
#region Прочие переменные
	global.shomen = 0;
	global.gold_color = make_color_rgb(252,232,131);
	global.cash_color = make_color_rgb(60 , 179, 113);
#endregion
#region Покупки
	//buy_cash_50 = 0;
	//buy_cash_270 = 0;
	//buy_cash_550 = 0;
	//buy_cash_1200 = 0;
	//buy_cash_3000 = 0;
	//buy_cash_7000 = 0;
#endregion

#region Прочее
	randomize(); // Включаем рандом
	//
	if os_type = os_ios { achievement_login(); } // Game Center
	alarm[2] = room_speed * 1.5; // Покупки
	//
	global.text_color = make_color_rgb(255, 228, 181);
	global.room_to_go = "set";
	room_goto_t("logo"); // Переход
#endregion