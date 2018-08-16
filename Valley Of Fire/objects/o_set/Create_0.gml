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
	
	//var map = ds_map_create();
	//var ntf = push_get_first_local_notification(map);
	//while(ntf >= 0)
	//   {
	//   var data = ds_map_find_value(map, "data");
	//   if data == "daily_reward 1" or data == "daily_reward 3" or data == "daily_reward 5" or data == "daily_reward 7"
	//      {
	//      push_cancel_local_notification(ntf);
	//      }
	//   ntf = push_get_next_local_notification(map);
	//   }
	//ds_map_destroy(map);

	//alarm[0]=2;
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
	global.size = 590; //640; // 720; //800; //960;
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
		if !ini_section_exists("Music")
		    {
			ini_write_string("Music", "music", "1");
			//ini_write_string("Music", "reward", "1500");
			//ini_write_string("Music", "dollars", "0");
			}
		global.music = 0; //ini_read_real("Music", "music", 1); // Музыка
		//global.reward = ini_read_real("Music", "reward", 1); // Ранг
		//global.dollars = ini_read_real("Music", "dollars", 1); // Бабки
	ini_close();
#endregion
#region Персонажи
	//global.hero = 1;
	global.player_rank = 15;
	global.heroes_val  = 11;
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
	
	#region Шериф
		global.hp[1]  = 900;
		global.atk[1] = 47;
		
		global.hero_code_name[1]   = "sherif";
		global.hero_code_weapon[1] = "revolver";
		
		global.hero_code_theme[1]  = "math";
		
		global.hero_full_wins[1]    = 4;
		global.hero_nofull_wins[1]  = 0;
		global.hero_full_loose[1]   = 0;
		global.hero_nofull_loose[1] = 2;
	#endregion
	#region Диего
		global.hp[2]  = 1200;
		global.atk[2] = 35;
		
		global.hero_code_name[2]   = "diego";
		global.hero_code_weapon[2] = "rifle";
		
		global.hero_theme[2] = "math";
		
		global.hero_full_wins[2]   = 5;
		global.hero_nofull_wins[2] = 2;
		global.hero_full_loose[2]   = 2;
		global.hero_nofull_loose[2] = 1;
	#endregion
	#region Охотница
		global.hp[3]  = 300;
		global.atk[3] = 140;
		
		global.hero_code_name[3]   = "huntress";
		global.hero_code_weapon[3] = "bow";
		
		global.hero_code_theme[3]  = "math";
		
		global.hero_full_wins[3]    = 20;
		global.hero_nofull_wins[3]  = 0;
		global.hero_full_loose[3]   = 0;
		global.hero_nofull_loose[3] = 0;
	#endregion
	#region Билл
		global.hp[4]  = 200;
		global.atk[4] = 150;
		
		global.hero_code_name[4]   = "sbill";
		global.hero_code_name1[4]  = "jbill";
		global.hero_code_weapon[4] = "-";
		
		global.hero_code_theme[4]  = "math";
		
		global.hero_full_wins[4]    = 20;
		global.hero_nofull_wins[4]  = 0;
		global.hero_full_loose[4]   = 0;
		global.hero_nofull_loose[4] = 0;
	#endregion
	#region Гробовщик
		global.hp[5]  = 250;
		global.atk[5] = 82;
		
		global.hero_code_name[5]   = "undertaker";
		global.hero_code_weapon[5] = "-";
		
		global.hero_code_theme[5] = "";
		
		global.hero_full_wins[5]   = 0;
		global.hero_nofull_wins[5] = 0;
		global.hero_full_loose[5]   = 100;
		global.hero_nofull_loose[5] = 0;
	#endregion
	#region Шаман
		global.hp[6] = 1000;
		global.atk[6] = 41.5;
		
		global.hero_code_name[6]   = "shaman";
		global.hero_code_weapon[6] = "-";
		
		global.hero_code_theme[6] = "";
		
		global.hero_full_wins[6]   = 0;
		global.hero_nofull_wins[6] = 0;
		global.hero_full_loose[6]   = 0;
		global.hero_nofull_loose[6] = 50;
	#endregion
	#region Доктор
		global.hp[7]  = 1100;
		global.atk[7] = 37.5;
		
		global.hero_code_name[7]   = "doctor";
		global.hero_code_weapon[7] = "-";
		
		global.hero_code_theme[7] = "";
		
		global.hero_full_wins[7]   = 30;
		global.hero_nofull_wins[7] = 50;
		
		global.hero_full_loose[7]   = 0;
		global.hero_nofull_loose[7] = 0;
	#endregion
	#region Воришка
		global.hp[8]  = 700;
		global.atk[8] = 60;
		
		global.hero_code_name[8]   = "thief";
		global.hero_code_weapon[8] = "-";
		
		global.hero_code_theme[8] = "";
		
		global.hero_full_wins[8]    = 90;
		global.hero_nofull_wins[8]  = 40;
		global.hero_full_loose[8]   = 0;
		global.hero_nofull_loose[8] = 0;
	#endregion
	#region Гангстер
		global.hp[9]  = 600;
		global.atk[9] = 70;
		
		global.hero_code_name[9]   = "gangster";
		global.hero_code_weapon[9] = "-";
		
		global.hero_code_theme[9] = "";
		
		global.hero_full_wins[9]    = 900;
		global.hero_nofull_wins[9]  = 0;
		global.hero_full_loose[9]   = 0;
		global.hero_nofull_loose[9] = 0;
	#endregion
	#region Пьяница Джо
		global.hp[10]  = 800;
		global.atk[10] = 30;
		
		global.hero_code_name[10]   = "drunk";
		global.hero_code_weapon[10] = "-";
		
		global.hero_code_theme[10] = "";
		
		global.hero_full_wins[10]    = 80;
		global.hero_nofull_wins[10]  = 80;
		global.hero_full_loose[10]   = 80;
		global.hero_nofull_loose[10] = 80;
	#endregion
	#region Вождь
		global.hp[11]  = 400;
		global.atk[11] = 100;
		
		global.hero_code_name[11]   = "chief";
		global.hero_code_weapon[11] = "-";
		
		global.hero_code_theme[11] = "";
		
		global.hero_full_wins[11]    = 0;
		global.hero_nofull_wins[11]  = 0;
		global.hero_full_loose[11]   = 0;
		global.hero_nofull_loose[11] = 0;
	#endregion
	
	for(i = 1; i <= 11; i++)
		{
		global.hero_wins[i]  = global.hero_full_wins[i] + global.hero_nofull_wins[i];
		global.hero_loose[i] = global.hero_full_loose[i] + global.hero_nofull_loose[i];
		global.hero_games[i] = global.hero_wins[i] + global.hero_loose[i];
		
		global.hero_name[i]  = ini_read_string("Hero_"+string(i), "hero_name", "");
		
		global.hero_class[i] = ini_read_string("Hero_"+string(i), "hero_class", "");
		
		global.hero_description[i] = ini_read_string("Hero_"+string(i), "hero_description", "");
		
		global.ability_a1[i] = ini_read_string("Hero_"+string(i), "ability_a1", "");
		global.ability_a2[i] = ini_read_string("Hero_"+string(i), "ability_a2", "");
		global.ability_p1[i] = ini_read_string("Hero_"+string(i), "ability_p1", "");
		global.ability_p2[i] = ini_read_string("Hero_"+string(i), "ability_p2", "");
		
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
	ini_close();
#endregion
#region Характеристики игрока
	global.player_name  = "Andrew";
	//global.hero = 1;
	global.player_rank  = 15;
	global.rank_stars   = 0;
	global.weapon = "standard";
	
	global.enemy_name   = "Werdna";
	global.enemy_hero   = 3;
	global.enemy_rank	= 15;
	global.enemy_weapon = "standard";
	global.enemy = 0;
	
	global.hero		  = choose(1, 2, 3);
	global.enemy_hero = choose(1, 2, 3);
#endregion
#region Вопросы и темы
	ini_open("Language/" + string(global.lang) + "/question_text_" + string(global.lang) + ".ini");
	global.question_text[1, 1] = ini_read_string("Theme_1", "question_1", "");
	global.question_text[1, 2] = ini_read_string("Theme_1", "question_2", "");
	global.question_text[1, 3] = ini_read_string("Theme_1", "question_3", "");
	global.question_text[1, 4] = ini_read_string("Theme_1", "question_4", "");
	
	global.question_text[3, 1] = "Tap if hand direction is same!"; //ini_read_string("Theme_1", "question_1", "");
	global.question_text[3, 2] = "Walk past the fences!";
	global.question_text[3, 3] = "Swipe in the hand direction!";
	global.question_text[3, 4] = "Tap if hand direction is equal...";
	
	global.question_text[2, 1] = "Shoot the bottles in the\norder of their appearance!";
	global.question_text[2, 2] = "Targets!";
	global.question_text[2, 3] = "Shoot the bottles in the\nright sequence!";
	global.question_text[2, 4] = "---";
	
	for(i=4;i<=8;i++)
		{
		for(j=1;j<=4;j++)
			{
			global.question_text[i, j] = "-";
			global.question_text[i, j] = "-";
			global.question_text[i, j] = "-";
			global.question_text[i, j] = "-";
			}
		}
	ini_close();
	
	for(i=1; i<=11; i++)
		{ global.theme_name[i] = "OTHER"; }
	
	global.count_themes = 4; //9;
	ini_open("Language/" + string(global.lang) + "/theme_name_" + string(global.lang) + ".ini");
	global.theme_name[1] = "MATH"//ini_read_string("Theme Name", "name_1", "");
	global.theme_name[2] = "BOTTLES"//ini_read_string("Theme Name", "name_2", "");
	global.theme_name[3] = "MOVE"//ini_read_string("Theme Name", "name_3", "");
	
	global.theme_name[4] = "ATTENTION";
	global.theme_name[5] = "CARDS";
	//global.theme_name[6] = "SHOOTING";
	//global.theme_name[7] = "MEASURE";
	global.theme_name[8] = "STORM";
	
	global.color_white = make_color_rgb(255, 248, 220);
	ini_close();
#endregion
#region Шрифты
	var str1, str2;
	str1  = "0123456789?=≠+-/*><."; //"!"+"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюя"; 
	global.math_font = font_add_sprite_ext(s_question_fig, str1, true, 1);
	
	str2  = "ABCDEFGHIJKLMNOPQRSTUVWXYZАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ!?$%'@.,0123456789=≠+-/*><:;()°"; //"!"+"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюя"; 
	global.game_font = font_add_sprite_ext(s_game_font, str2, true, 1);
#endregion
#region Цвета персонажей
	global.color_hero[1]  = c_orange;
	global.color_hero[2]  = c_maroon;
	global.color_hero[3]  = make_color_rgb(186,  85, 211);
	global.color_hero[4]  = c_white;
	global.color_hero[5]  = make_color_rgb(25 ,  25, 112);
	global.color_hero[6]  = make_color_rgb(64 , 224, 208);
	global.color_hero[7]  = make_color_rgb(60 , 179, 113);
	global.color_hero[8]  = make_color_rgb(105, 105, 105);
	global.color_hero[9]  = make_color_rgb(220,  20,  60);
	global.color_hero[10] = make_color_rgb(250, 235, 215);
	global.color_hero[11] = make_color_rgb(220,  20,  60);
#endregion
#region Параллакс
	global.paral_x = 0;
	global.paral_y = 0;
	global.paral_sx = 15;
	global.paral_sy = 25;
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