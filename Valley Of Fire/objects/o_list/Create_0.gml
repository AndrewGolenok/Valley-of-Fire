#region Стартовые переменные
	#region Чокнутый шаман
		if global.shomen
		{
			if global.shomen1 != 0
			{
				global.shomen = 0;
			}
			else
			{
				if global.quick = 0 && global.pvp = 0 && global.training = -1
				{
					global.shomen = 1;
				}
			}
		}
		if global.training = -1 && global.shomen
		{
			global.player_rank = 15;
			global.enemy_rank  = 15;
			bot_type = 3;
			if os_get_language() = "ru"
			{
				global.enemy_name  = "ЧОКНУТЫЙ ШАМАН";
			}
			else
			{
				global.enemy_name  = "CRAZY SHAMAN";
			}
			global.hero = choose(1, 2, 3, 4, 6);
			global.enemy_hero = 7;
		}
	#endregion
	#region Имена
		global.player_name = string_upper(global.hero_code_name[global.hero]);
		global.enemy_rank  = choose(global.player_rank - 1, global.player_rank + 1, global.player_rank + 1, global.player_rank, global.player_rank, global.player_rank, global.player_rank, global.player_rank)
		if global.hero = 2
		{
			global.player_name = "DRUNK JOE";
		}
		if global.hero = 5
		{
			global.player_name = "BILL SR.";
		}
		if os_get_language() = "ru"
		{
			switch(global.hero)
			{
				case 1: global.player_name = "ВОРИШКА"; break;
				case 2: global.player_name = "ПЬЯН. ДЖО"; break;
				case 3: global.player_name = "ОХОТНИЦА"; break;
				case 4: global.player_name = "ДИЕГО"; break;
				case 5: global.player_name = "БИЛЛ СТ."; break;
				case 6: global.player_name = "ШЕРИФ"; break;
				case 7: global.player_name = "ШАМАН"; break;
			}
		}
	#endregion
	#region Ранг врага
		if global.enemy_rank > 15
		{
			global.enemy_rank = 15;
		}
		if global.enemy_rank < 0
		{
			global.enemy_rank = 0;
		}
	#endregion
	#region Основные пепеменные
		room_gt   = 0;
		writein   = 0;
		anim_skul = 0;
		music_off = 0;
		
		lines_true = 0;
		list_go    = 0;
		
		q_col  = c_white;
		h_pos  = 0;
		list_y = -300;
		
		button_xc = 0;
		button_x  = 0;
		
		list_scale = 0;
		plas_scale = 0;
		win_plas   = 0;
		
		theme_choose  = 1;
		question_text = "";
		
		super_x  = 0;
		vvv      = 0;
		vvv_time = 0;
		skill[1] = 1;
		skill[2] = 1;
		skill[3] = 1;
		
		e_skill[1] = 1;
		e_skill[2] = 1;
		e_skill[3] = 1;
		
		abil_x = 160;
		abil_y = y;
		abil_s = 0.5;
		abil_a = 0;
	#endregion
#endregion
#region Черепки
	for(j = 1;  j <= 3;  j ++)
	{
		roundskul[j]    = 0;
		roundskul_y[j]  = 200;
		roundskul_n[j]  = 0;
		roundskul_s[j]  = 0.1;
		roundskul_xs[j] = 0;
		roundskul_xa[j] = 0;
	}
#endregion
#region Смайлы
	enemy_smile_chance = -1;
	enemy_smile_time   = -1;
	enemy_smile        = -1;
	smile_open  = 0;
	smile_sc    = 0;
	smile_show  = 0;
	smile_cur   = 0;
	smile_alp   = 0;
	smile_sy    = 0;
	smile_sec   = 0;
	smile_img   = 0;
	smile_show1 = 0;
	smile_cur1  = 0;
	smile_alp1  = 0;
	smile_sy1   = 0;
	smile_sec1  = 0;
	smile_img1  = 0;
	smile_bi    = 0;
	smile_bs    = 1;
	smile_n     = 0;
	for(i = 0; i <= 5; i ++)
	{
		smile_ss[i] = 0;
	}
#endregion
#region Выбор игрока
		first_player = -1;
		theme_points_time = 0;
		theme_points = "";
		coin_x   = 640;
		coin_y   = global.height + 100;
		coin_s   = 1;
		coin_a   = 0;
		coin_i   = choose(0, 9);
		coin_spd = 35;
		coin_d   = 0;
		
		coin_stage = 0;
		first_time = 0;
		
		name_x   = 0;
		name_y   = 0;
		name_s   = 0;
		first_x  = 0;
		first_y  = 0;
		first_s  = 0;
		th_ch1_x = 0;
		th_ch1_y = 0;
		th_ch1_s = 0;
		th_ch2_x = 0;
		th_ch2_y = 0;
		th_ch2_s = 0;
		theme_s1 = 1;
		theme_s2 = 1;
		theme_s3 = 1;
		
		ini_open(string(global.lang) + ".ini");
			coin_you[1]  = ini_read_string("Menu", "coin_you_1", "");
			coin_you[0]  = ini_read_string("Menu", "coin_you_0", "");
			coin_you[2]  = ini_read_string("Menu", "coin_you_2", "");
			coin_text1 = ini_read_string("Menu", "coin_text1", "");
			coin_text2 = ini_read_string("Menu", "coin_text2", "");
			if global.pvp = 1
			{
				coin_you[1] = ini_read_string("Menu", "coin_you_p", "") + "1";
				coin_you[0] = ini_read_string("Menu", "coin_you_p", "") + "2";
			}
		ini_close();
		coin_text1_a = 0;
		coin_text2_a = 0;
		coin_text1_s = 0;
		coin_text2_s = 0;
		hand_i = 0;
	#endregion
#region Выбор Темы
	theme_x[1]  = 640 - 300;
	theme_y[1]  = global.height / 2;
	theme_s[1]  = 0;
	theme_t[1]  = global.enemy_hero;
	theme_a[1]  = 1;
	theme_nn[1] = global.theme_name[theme_t[1]];
	theme_x1[1] = 0;
	theme_y1[1] = 0;
	theme_a1[1] = irandom(360);
	
	theme_x[2]  = 640;
	theme_y[2]  = global.height / 2;
	theme_s[2]  = 0;
	if global.enemy_hero != global.hero
	{
		theme_t[2] = global.hero;
	}
	else
	{
		theme_t[2] = theme_new(theme_t[1], -1);
	}
	
	theme_a[2]  = 1;
	theme_nn[2] = global.theme_name[theme_t[2]];
	theme_x1[2] = 0;
	theme_y1[2] = 0;
	theme_a1[2] = irandom(360);
	
	theme_x[3]  = 640 + 300;
	theme_y[3]  = global.height / 2;
	theme_s[3]  = 0;
	theme_t[3]  = theme_new(theme_t[1], theme_t[2]);
	theme_a[3]  = 1;
	theme_nn[3] = global.theme_name[theme_t[3]];
	theme_x1[3] = 0;
	theme_y1[3] = 0;
	theme_a1[3] = irandom(360);
	
	choose_y = global.height + 300;
	
	theme_g = 0;
	theme_click = 0;
	theme_dot   = "";
	
	theme_timer = room_speed * 14;
#endregion
#region Объявление раунда
	ini_open(string(global.lang) + ".ini");
		round_text[1] = ini_read_string("Menu", "round_text_1", "");
		round_text[2] = ini_read_string("Menu", "round_text_2", "");
		round_text[3] = ini_read_string("Menu", "round_text_3", "");
	ini_close();
	
	round_text1_x = 1450;
	
	round_x[1] = 300;
	round_y[1] = global.height / 2 - 150;
	round_x[2] = 900;
	round_y[2] = global.height / 2;
	round_x[3] = 400;
	round_y[3] = global.height / 2 + 170;
	
	round_s[1] = 0;
	round_s[2] = 0;
	round_s[3] = 0;
	
	round_a[1] = -180;
	round_a[2] = -180;
	round_a[3] = -180;
	
	round_spd   = 0.0025;
	round_alpha = 1;
#endregion
#region Объявление победителя
	win_x       = 350;
	win_s1      = 1;
	win_s2      = 1;
	win_a       = 0;
	win_stage   = 0;
	win_y       = global.height - 50;
	win_text_y  = global.height + 100;
	win_text_y1 = global.height + 100;
	
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
	whowin_stage  = 0;
	whowin_timer  = 0;
	
	light_scale1  = 0;
	light_scale1_dir = -1;
#endregion
#region Переменные Дуэли
	#region Критический урон
		global.critical   = 0;
		global.e_critical = 0;
		critical_x = -250;
		critical_y = -170;
		critical_s = 0.7;
		global.critical_y_p = 200;
		global.critical_y_e = 200;
	#endregion
	#region Основные переменные дуэли
		theme_round[1]    = -1;
		theme_round[2]    = -1;
		theme_round[3]    = -1; // В каком раунде какая тема
		global.rounds     = 1; // Какой сейчас раунд
		global.task       = 1; // Какая задача (1-3)
		global.question   = 1; // Какой вопрос (1-3)
		global.answer     = -1; // Ответил на все вопросы задачи или нет
		global.cananswer  = 1;
		global.game_stage = 0;
		for(i = 1; i <= 3; i ++)
		{
			for(j = 1; j <= 3; j ++)
				{
				round_task[i,j] = 0;
				}
		}
	#endregion
	#region Характеристики игроков (Хп и Атака)
		maxhp   = global.hp[global.hero];
		hp      = maxhp;
		atk     = global.atk[global.hero];
		e_maxhp = global.hp[global.enemy_hero];
		e_hp    = e_maxhp;
		e_atk   = global.atk[global.enemy_hero]; // Макс хп, хп и урон
		
		health_al   = 1;
		health_hp   = hp;
		health_e_al = 1;
		health_e_hp = e_hp;
	#endregion
	#region Переменные, в которых хранятся ответы
		question_time = 0; // Время на вопрос
		
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
	#region Таймер
		timer   = 6 * room_speed;
		timer_x = 6 * room_speed;
	#endregion
	#region Прочие переменные дуэли
		global.abilitican   = 1;
		global.e_abilitican = 1;
		o_but_sc   = 1.2;
		dop_q_y = 0;
	#endregion
#endregion
#region Доп текст
		ini_open("other_text_en.ini")
			if os_get_language() = "ru"
			{
				ini_open("other_text_ru.ini");
			}
			else
			{
				ini_open("other_text_en.ini");
			}
			hand_text[0]  = ini_read_string("Text", "hand_text_0", "");
			hand_text[1]  = ini_read_string("Text", "hand_text_1", "");
			hand_text[2]  = ini_read_string("Text", "hand_text_2", "");
			theme_text[0] = ini_read_string("Text", "theme_text_0", "");
			theme_text[1] = ini_read_string("Text", "theme_text_1", "");
			win_text[0] = ini_read_string("Text", "win_text_0", "");
			win_text[1] = ini_read_string("Text", "win_text_1", "");
			end_text[0] = ini_read_string("Text", "end_text_0", "");
			end_text[1] = ini_read_string("Text", "end_text_1", "");
			if global.pvp = 1
			{
				theme_text[1] = theme_text[0];
			}
			for(i = 0; i <= 2; i ++)
			{
				dop_i[i] = -1;
				dop_text_end[i]    = 0;
				dop_text_angle[i]  = 0;
				dop_text_xscale[i] = 0;
				dop_text_yscale[i] = 0;
				dop_text_dir[i]    = 1;
				dop_text_color[i]  = c_white;
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
			}
			dop_t[3] = 0;
			dop_t[4] = 0;
			dop_t[5] = 0;
			dop_t[6] = 0;
			dop_dmg  = 0;
			dop_text[0] = ini_read_string("Text", "dop_text_0", "DODGE");  // DODGE
			dop_text[1] = ini_read_string("Text", "dop_text_1", "MISS");  // MISS
			dop_text[2] = ini_read_string("Text", "dop_text_2", "SKIP"); // SKIP
			dop_text[3] = ini_read_string("Text", "dop_text_3", "CRITICAL"); // CRITICAL
			dop_text[4] = ini_read_string("Text", "dop_text_4", "STUN");    // STUN
			dop_text[5] = ini_read_string("Text", "dop_text_5", "POISON"); // POISON
			dop_text[6] = ini_read_string("Text", "dop_text_6", "BLEED"); // BLEED
			dop_text[7] = "";
			dop_text[8] = "";
		ini_close();
	#endregion
#region ТЕМЫ
	#region	Математика - Math
		equation_text = "";
		vtext[1] = "+";
		vtext[2] = "-";
		vtext[3] = "/";
		vtext[4] = "*";
	
		vtrue[1] = 0;
		vtrue[2] = 0;
		vtrue[3] = 0;
		vtrue[4] = 0;
		
		b_pressed_s[1] = 1;
		b_pressed_s[2] = 1;
		b_pressed_s[3] = 1;
		b_pressed_s[4] = 1;
	#endregion
	#region	Бутылки    - Bottles
		bottle_all    = 0;
		bottle_s      = 1;
		bottle_stage  = 0;
		bottle_red    = 0;
		bottle_s1     = 1;
		bottle_s2     = 1;
		bottle_a1     = 1;
		bottle_red_a  = 0;
		bottle_change = 0;
		bottle_end    = 0;
		for(i = 1; i <= 6; i ++)
		{
			bottle_y[i]  = 0;
			bottle_a[i]  = 0;
			bottle_x[i]  = 0;
			bottle_n[i]  = 0;
			bottle_n1[i] = 0;
			bottle_i[i]  = irandom_range(2, 3);
			bottle_destroy[i] = 0;
			target_x[i] = 0;
			target_y[i] = 0;
			target_s[i] = 1;
			target_c[i] = 1;
			target_numb[i] = 0;
			bottle_spd[i]  = 0;
			bottle_r[i]    = 0;
			bottle_p[i]    = 0;
			bottle_d[i]    = 0;
		}
		target_n = 0;
	#endregion
	#region	Движение   - Move
		hand_scale = 0;
		hand_angle = 0;
		hand_count = 1;
		hand_speed = 23 - global.player_rank;
		for(i = 1; i <= 6; i ++)
		{
			hand_true[i] = 0;
			hand_xx[i]   = 640;
			hand_ss[i]   = 1;
			hand_red[i]  = 0;
		}
		hand_now = 1;
		hand_s_x = 0;
		hand_s_y = 0;
		hand_s_t = 0;
	#endregion
	#region	Внимание   - Attention
		#region Задача 1 - Шляпа, напёрстки
		hat_x[1]  = 640 - 200;
		hat_xn[1] = 640 - 200;
		hat_y[1]  = 0;
		hat_s[1]  = 1;
		hat_h[1]  = 0;
		
		hat_x[2]  = 640;
		hat_xn[2] = 640;
		hat_y[2]  = 150;
		hat_s[2]  = 1;
		hat_h[2]  = 1;
		
		hat_x[3]  = 640 + 200;
		hat_xn[3] = 640 + 200;
		hat_y[3]  = 0;
		hat_s[3]  = 1;
		hat_h[3]  = 0;
		
		hat_x[4]  = 640 + 200;
		hat_xn[4] = 640 + 200;
		hat_y[4]  = 0;
		hat_s[4]  = 1;
		hat_h[4]  = 0;
		
		hat_spd  = 20;
		hat_cha  = choose(1, 3);
		hat_sha  = 2;
		hat_num  = 1;
		hat_max  = 7;
		hat_res  = -1;
		hat_end  = 0;
		
		hat_stage = 0;
		hat_timer = 20;
		hat_alpha[1] = 1;
		hat_alpha[2] = 1;
		hat_alpha[3] = 1;
	#endregion
		#region Задача 2 - Камень, ножницы и чё там
			for(i = 1; i <= 5; i ++)
			{
				hand_sign[i] = 0;
				hand_sign_red[i] = 0;
				hand_sign_xx[i]  = 0;
				hand_sign_ss[i]  = 1;
				hand_sign_r[i]   = 0;
				for(j = 1; j <= 3; j ++)
				{
					hand_sign_c[i]   = 0.65;
					hand_sign_z[i,j] = 0;
				}
			}
			hand_sign_now   = 1;
			hand_sign_count = 0;
			hand_sign_scale = 1;
		#endregion
		#region Задача 3 - Конь, заборы
			for(i = 1; i <= 6; i ++)
			{
			horse_p[i]   = choose(-1, 1);
			horse_n[i]   = 0;
			horse_y[i]   = 0;
			horse_red[i] = 1;
			}
			horse_yy      = 0;
			horse_now     = 0;
			horse_count   = 4;
			horse_death   = 0;
			horse_death_y = 0;
			horse_death_a = 1;
		#endregion
	#endregion
	#region	Карты      - Cards
		#region Задача 1 / 2 - Карты, найти пару / карту
		for(i = 1; i <= 2; i ++)
		{
			for(j = 1; j <= 3; j ++)
			{
				card_scale[i,j] = 0.7;
				card_m[i,j]   = 0;
				card_i[i,j]   = 0;
				card_now[i,j] = 0;
				card_end[i,j] = 0;
				card_alp[i,j] = 1;
				card_yy[i,j]  = 0;
			}
		}
		fir_i = 0;
		fir_j = 0;
		sec_i = 0;
		sec_j = 0;
		card_all  = 2;
		card_time = -1;
		cards_1();
		card_find = 0;
		card_have = 0;
		card_find_a = 0;
		card_find_s = 0;
		card_find_time = 0;
	#endregion
		#region Задача 3 - Карты, порядок
			cards_all   = 3;
			cards_stage = 1;
			cards_time  = 10;
			cards_now   = 1;
			for(i = 1; i <= 5; i ++)
			{
				cards_y[i]  = 0;
				cards_x[i]  = 0;
				cards_m[i]  = 0;
				cards_n[i]  = 0;
				cards_i[i]  = 0;
				cards_s[i]  = 0;
				cards_ss[i] = 1;
				cards_xx[i] = 0;
				cards_xs[i] = 0;
				cards_nu[i] = 0;
			}
		#endregion
	#endregion
	#region	Стрельба   - Shooting
		#region Мишени, появление
			aim_xx[1] = 640 - 300;
			aim_yy[1] = 150;
			
			aim_xx[2] = 640 - 200;
			aim_yy[2] = global.height - 210;
			
			aim_xx[3] = 640;
			aim_yy[3] = global.height / 2;
			
			aim_xx[4] = 640 + 150;
			aim_yy[4] = 150;
			
			aim_xx[5] = 640 + 300;
			aim_yy[5] = global.height - 210;
			
			aim_now   = 1;
			aim_all   = 2;
			aim_max_r = 0;
			for(i = 1; i <= 5; i ++)
			{
				aim_n[i] = 0;
				aim_a[i] = 0;
				aim_s[i] = 0;
				aim_t[i] = 0;
				aim_r[i] = 0;
				aim_d[i] = 0;
				aim_p[i] = 0;
			}
		#endregion
		#region Мишени, пистолет
			target_ang = 0;
			target_all = 5;
			target_now = 1;
			target_red = 0;
			target_spd = 20;
			target_bul = 0;
			target_iii = 0;
			target_gon = 0;
			
			target_v[1] = 0;
			target_v[2] = 45;
			target_v[3] = 90;
			target_v[4] = 135;
			target_v[5] = 180;
			
			for(i = 1; i <= 5; i ++)
			{
				target_n[i] = 0;
				target_m[i] = 0;
				target_y[i] = global.height / 2;
				target_x[i] = 640 + 200;
				target_d[i] = 0;
				target_s[i] = 1;
				target_a[i] = 0;
			}
		#endregion
		#region Мишени, нож
			targetk_ang = 0;
			targetk_all = 5;
			targetk_spd = 20;
			for(i = 1; i <= 5; i ++)
			{
				targetk_v[i] = 72 * (i - 1)
				targetk_n[i] = 0;
				targetk_d[i] = 0;
			}
			for(i = 1; i <= 6; i ++)
			{
				knife_now   = 1;
				knife_spd   = 20;
				knife_y[i]  = global.height / 2;
				knife_x[i]  = 640 - 170;
				knife_d[i]  = 0;
				knife_a[i]  = 0;
				knife_n[i]  = 0;
				knife_a1[i] = 0;
			}
		#endregion
	#endregion
	#region	Шторм      - Storm
		global.storm = 0;
	#endregion
#endregion
#region Суперудар Кнопка
	super_need   = 3;
	super_now    = 0;
	super_now1   = 0;
	super_scale  = 0;
	super_stage  = 0;
	super_zhopa  = 300;
	super_zhopa1 = 300;
	super_angle  = 0;
	super_dir    = 1;
	super_alp    = 1;
	super_alp1   = 1;
	super_alpha  = 1;
	
	e_super_need = 3;
	e_super_now  = 0;
	e_super_now1 = 0;
	
	super_time  = 0;
	super_val   = 0;
	
	part_x    = 0;
	part_y    = 0;
	part_s    = 1;
	part_n    = 0;
	part_xspd = 0;
	part_yspd = 0;
	
	health_timer = 20;
	health_scale = 1;
	
	health_e_timer = 20;
	health_e_scale = 1;
	
	shaker     = 0;
	shaker_dir = 1;
	shaker_spd = 10;
	shaker_ang = 0;
	go_hp      = 0;
	
	ini_open(string(global.lang) + ".ini");
		super_text  = ini_read_string("Menu", "super_text", "");
		super_text2 = ini_read_string("Menu", "super_text2", "");
	ini_close();
#endregion
#region Финиш Дуэли
	whowin  = 0;
	finplas = 0;
	fin_y = 500;
	
	accuracy_true = 0;
	accuracy_all  = 0;
	
	g_rank_stage = 0;
	g_enemy_change = 0;
	g_star_y = 0;
	g_star_a = 0;
	g_rank_y = 0;
	g_skul_y = 0;
	g_rank_s = 0;
	g_skul_s = 1;
	g_star_s = 1;
	
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
	
	g_star_yn = 1;
	
	if global.last_game = 1 && global.last_game2 = 1 && global.player_rank > 5
	{
		winstreak = 1;
	}
	else
	{
		winstreak = 0;
	}
	
	g_message = 0;
	txt_gold = "";
	txt_cash = "";
	g_rank_type = -1;
#endregion
#region Бот
	#region Твоё время и время врага
		for(i = 1; i <= 12; i ++)
		{
			u_answer[i] = -1;
			e_answer[i] = -1;
			u_time[i]   = 6 * room_speed;
			e_time[i]   = 6 * room_speed;
		}
		u_question = 1;
		e_question = 1;
		global.sraka = 0; // Никто не атакует
		req = 0;
		for(i = 1; i <= 8; i ++)
		{
			for(j = 1; j <= 4; j ++)
			{
				min_time[i,j] = 10;
				min_wait[i,j] = 10;
			}
		}
	#endregion
	#region Билл Младший
		global.jr_e = 0;
	#endregion
	#region Минимальное время и минимальное ожидание
		min_time[1,1] = 10;
		min_time[1,2] = 10;
		min_time[1,3] = 10;
		min_time[1,4] = 10;
	
		min_time[2,1] = 30;
		min_time[2,2] = 10;
		min_time[2,3] = 30;
		min_time[2,4] = 10;
	
		min_time[3,1] = 20;
		min_time[3,2] = 30;
		min_time[3,3] = 20;
		min_time[3,4] = 20;
	
		min_time[4,1] = 20;
		min_time[4,2] = 60;
		min_time[4,3] = 10;
		min_time[4,4] = 10;
		///
		min_wait[1,1] = 10;
		min_wait[1,2] = 10;
		min_wait[1,3] = 10;
		min_wait[1,4] = 10;
		
		min_wait[2,1] = 90;
		min_wait[2,2] = 0;
		min_wait[2,3] = 90;
		min_wait[2,4] = 0;
		
		min_wait[3,1] = 10;
		min_wait[3,2] = 10;
		min_wait[3,3] = 10;
		min_wait[3,4] = 10;
		
		min_wait[4,1] = 90;
		min_wait[4,2] = 100;
		min_wait[4,3] = 0;
		min_wait[4,4] = 0;
	#endregion
	#region Ожидание игрока и бота
		pre_wait = 1;
		bot_wait = 1;
	#endregion
	#region Изменение вида
		view_go_left  = 0;
		view_go_right = 0;
		view_go_down  = 0;
	#endregion
	#region Тип бота
		bot_type = 0;
		if global.player_rank = 15
		{
			bot_type = choose(0, 0, 1, irandom(3));
		}
		if global.player_rank < 15 && global.player_rank >= 13
		{
			bot_type = choose(0, 1, irandom(3));
		}
		if global.player_rank < 13 && global.player_rank > 10
		{
			bot_type = choose(0, 1, 1, irandom(3));
		}
		if global.player_rank <= 10 && global.player_rank > 8
		{
			bot_type = choose(1, irandom(3));
		}
		if global.player_rank <= 8 && global.player_rank > 5
		{
			bot_type = irandom(3);
		}
		if global.player_rank >= 5 && global.player_rank < 3
		{
			bot_type = irandom(3);
		}
		if global.player_rank >= 3 && global.player_rank < 1
		{
			bot_type = choose(2, 1, irandom_range(2, 3), irandom(3));
		}
		if global.player_rank = 1
		{
			bot_type = choose(2, 3, irandom_range(2, 3), irandom(3), irandom(3));
		}
		if global.player_rank = 0
		{
			bot_type = choose(3, 3, irandom_range(2, 3), irandom(3), irandom(3));
		}
	#endregion
	#region Основные переменные бота
		bot_go       = 0;
		bot_question = 1;
		bot_task     = 1;
		bot_time     = -1;
		bot_time2    = 6 * room_speed;
		timer_y      = 0;
		global.bot_answer = -1;
	#endregion
	#region Здоровье бота
		hpold = 0;
		hprld = 0;
	#endregion
	#region Имя бота
		ini_open(string(global.lang) + ".ini");
			for(i = 1; i <= 14; i ++)
			{
				bot_name[i] = ini_read_string("Menu", "bot_name_" + string(i), "");
			}
		ini_close();
		if bot_type = 0
		{
			global.enemy_name = choose(bot_name[1], bot_name[2], bot_name[3]);
		}
		if bot_type = 1
		{
			global.enemy_name = choose(bot_name[4], bot_name[5], bot_name[6]);
		}
		if bot_type = 2
		{
			global.enemy_name = choose(bot_name[7], bot_name[8], bot_name[9]);
		}
		if bot_type = 3
		{
			global.enemy_name = choose(bot_name[10], bot_name[11], bot_name[12]);
		}
		if global.training > 0
		{
			global.enemy_name = bot_name[13];
		}
		if global.shomen
		{
			global.enemy_name = bot_name[14];
		}
	#endregion
#endregion
#region Отладка
	ongle          = 0;
	restart_time   = 0;
	restart_time2  = 0;
	restart_angle  = 0;
	restart_angle2 = 0;
	color[0] = c_white;
	color[1] = c_white;
	color[2] = c_white;
	color[3] = c_white;
	color[4] = c_white;
	trigger  = 0;
#endregion
#region Верно или нет
	answer_rec = 0;
	answer_col = 0;
	answer_alp = 0;
#endregion
#region Способности
	global.bill_abil   = 0;
	global.bill_abil_a = 0;
	global.hand = -1;
	global.hand = -1;
	global.swipe_ability = 0;
	for(i = 1; i <= 3; i ++)
	{
		global.idol_x[i] = 0;
		global.idol_y[i] = -200;
		global.idol[i]   = 0;
		global.idol_s[i] = 1;
		global.idol_h[i] = -1;
		global.anim[i,0] = -1;
		global.anim[i,1] = -1;
	}
	idol_alpha   = 0;
	idol_alpha_s = 0;
#endregion
#region ТОТЕМЫ
	#region Уровень врага
		global.tot = 0;
		global.enemy_level = choose(global.player_rank, global.player_rank + 1, global.player_rank - 1); //irandom_range(1,10);
	#endregion
	#region Случайные тотемы Врага
			if global.pvp = 0
			{
				if global.p_totem[1] != -1 && global.p_totem[2] = -1
				{
					global.e_totem[1] = choose(irandom_range(1, 6), irandom_range(1, 11), irandom_range(1, 15), irandom_range(1, 18));
					global.e_totem[2] = -1;
					global.e_totem[3] = -1;
				}
				if global.p_totem[2] != -1 && global.p_totem[3] = -1
				{
					var toi;
					global.e_totem[1] = choose(irandom_range(1, 11), irandom_range(1, 15), irandom_range(1, 18));
					if global.e_totem[1] != 1
					{
						global.e_totem[2] = irandom_range(1, global.e_totem[1]);
					}
					else
					{
						global.e_totem[2] = choose(irandom_range(2, 11), irandom_range(2, 15), irandom_range(2, 18));
					}
					global.e_totem[3] = -1;
				}
				if global.p_totem[3] != -1
				{
					var toi;
					global.e_totem[1] = choose(irandom_range(1, 11), irandom_range(1, 15), irandom_range(1, 18));
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
						global.e_totem[2] = choose(irandom_range(2, 15), irandom_range(2, 18)); 
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
			}
		#endregion
	#region Тотемы игрока
		var rpt1, rpt2, rpt3;
		rpt1 = global.p_totem[1];
		rpt2 = global.p_totem[2];
		rpt3 = global.p_totem[3];
		if rpt3 != -1 && rpt2 = -1 && rpt1 = -1
		{
			global.p_totem[1] = rpt3;
			global.p_totem[2] = -1;
			global.p_totem[3] = -1;
		}
		if rpt3 != -1 && rpt2 != -1 && rpt1 = -1
		{
			global.p_totem[1] = rpt2;
			global.p_totem[2] = rpt3;
			global.p_totem[3] = -1;
		}
	#endregion
	#region Тотемы врага
		var ret1, ret2, ret3;
		ret1 = global.e_totem[1];
		ret2 = global.e_totem[2];
		ret3 = global.e_totem[3];
		if ret3 != -1 && ret2 = -1 && ret1 = -1
		{
			global.e_totem[1] = ret3;
			global.e_totem[2] = -1;
			global.e_totem[3] = -1;
		}
		if ret3 != -1 && ret2 != -1 && ret1 = -1
		{
			global.e_totem[1] = ret2;
			global.e_totem[2] = ret3;
			global.e_totem[3] = -1;
		}
	#endregion
	#region Тотемы тренировки
		if global.training = 4
		{
			global.p_totem[1] = 15;
			global.p_totem[2] = 8;
			global.p_totem[3] = 12;
			global.e_totem[1] = 18;
			global.e_totem[2] = 6;
			global.e_totem[3] = 3;
		}
	#endregion
	#region Цвета тотемов
		for(i = 1; i <= 3; i ++)
		{
			if global.p_totem[i] <= 6
				{
					totem_pc[i] = global.color_white;
				}
			if global.e_totem[i] <= 6
				{
					totem_ec[i] = global.color_white;
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
	#region Координаты тотемов и прозрачность
		var txx, tss;
		txx = 640;
		tss = 0.3;
		totem_alpha   = 1;
		totem_alpha_d = -1;
		totem_x       = -600;
	#endregion
	#region Координаты тотемов игрока
		if global.p_totem[1] = -1 && global.p_totem[2] = -1 && global.p_totem[3] = -1
		{
			totem_py[1] = -200;
			totem_py[2] = -200;
			totem_py[3] = -200;
		}
		if global.p_totem[1] != -1 && global.p_totem[2] = -1 && global.p_totem[3] = -1
		{
			totem_py[1] = global.height / 2 + 470 * tss * 0.9;
			totem_py[2] = -200;
			totem_py[3] = -200;
		}
		if global.p_totem[1] != -1 && global.p_totem[2] != -1 && global.p_totem[3] = -1
		{
			totem_py[1] = global.height / 2;
			totem_py[2] = global.height / 2 + 470 * tss * 0.9;
			totem_py[3] = -200;
		}
		if global.p_totem[1] != -1 && global.p_totem[2] != -1 && global.p_totem[3] != -1
		{
			totem_py[1] = global.height / 2 - 470 * tss * 0.9;
			totem_py[2] = global.height / 2;
			totem_py[3] = global.height / 2 + 470 * tss * 0.9;
		}
	#endregion
	#region Координаты тотемов врага
		if global.e_totem[1] = -1
		{
			totem_ey[1] = -200;
			totem_ey[2] = -200;
			totem_ey[3] = -200;
		}
		if global.e_totem[1] != -1 && global.e_totem[2] = -1 && global.e_totem[3] = -1
		{
			totem_ey[1] = global.height / 2 + 470 * tss * 0.9;
			totem_ey[2] = -200;
			totem_ey[3] = -200;
		}
		if global.e_totem[1] != -1 && global.e_totem[2] != -1 && global.e_totem[3] = -1
		{
			totem_ey[1] = global.height / 2;
			totem_ey[2] = global.height / 2 + 470 * tss * 0.9;
			totem_ey[3] = -200;
		}
		if global.e_totem[1] != -1 && global.e_totem[2] != -1 && global.e_totem[3] != -1
		{
			totem_ey[1] = global.height / 2 - 470 * tss * 0.9;
			totem_ey[2] = global.height / 2;
			totem_ey[3] = global.height / 2 + 470 * tss * 0.9;
		}
	#endregion
	#region Общие переменные тотемов
		totem_ps[1] = 1;
		totem_ps[2] = 1;
		totem_ps[3] = 1;
		totem_es[1] = 1;
		totem_es[2] = 1;
		totem_es[3] = 1;
		totem_pa[1] = 0.5;
		totem_pa[2] = 0.5;
		totem_pa[3] = 0.5;
		totem_ea[1] = 0.5;
		totem_ea[2] = 0.5;
		totem_ea[3] = 0.5;
		totem_time  = 10;
		totem_first = choose(1, 0);
	#endregion
	#region Работает тотем или нет
		for(i = 1; i <= 19; i ++)
		{
			global.p_totem_a[i] = 0;
			global.e_totem_a[i] = 0;
			for(j = 1; j <= 3; j ++)
			{
				if global.p_totem[j] = i
				{
					global.p_totem_a[i] = 1;
				}
				if global.e_totem[j] = i
				{
					global.e_totem_a[i] = 1;
				}
			}
		}
	#endregion
	#region Прочие переменные тотемов
		if global.e_totem_a[15] = 1
		{
			e_super_need = 2;
		}
		if global.p_totem_a[15] = 1
		{
			super_need = 2;
		}
		poison_e = 0;
		totem_txt_i = 0;
		totem_txt = "";
	#endregion
#endregion
#region ОБУЧЕНИЕ
	#region Чокнутый шаман
		if global.shomen = 1
		{
			global.training = 7;
		}
		if global.shomen = 2
		{
			ini_open("Music.ini");
				global.heroes_have[global.hero] = 0
				{
					ini_write_string("Heroes", "heroes" + string(global.hero), "1");
					global.heroes_have[global.hero] = ini_read_real("Heroes", "heroes" + string(global.hero), 0);
				}
			ini_close();
			global.training = -1;
		}
	#endregion
	#region Стадия тренировки
		global.training_stage[1] = -1;
		global.training_stage[2] = -1;
		global.training_stage[3] = -1;
		global.training_stage[4] = -1;
		global.training_stage[5] = -1;
		global.training_stage[6] = -1;
		global.training_stage[7] = -1;
	#endregion
	#region Переменные тренировки
		if global.training > 0
		{
			#region Основное
				global.player_rank = 15;
				global.training_stage[global.training] = 1;
				theme_choose  = 4;
				theme_g       = 3;
				theme_t[3]    = global.hero;
				global.rounds = 3;
				global.task   = 1;
				global.game_stage  = 5;
				if global.training != 4
				{
					global.tot = -1;
					global.p_totem[1] = -1;
					global.p_totem[2] = -1;
					global.p_totem[3] = -1;
					global.e_totem[1] = -1;
					global.e_totem[2] = -1;
					global.e_totem[3] = -1;
				}
			#endregion
			#region Выполнение темы
				theme_round[global.rounds]  = global.training;
				round_task[global.rounds,1] = 1;
				if theme_round[global.rounds] = 6
				{
					script_execute(asset_get_index("math_" + string(round_task[global.rounds,global.task])));
				}
				if theme_round[global.rounds] = 2
				{
					script_execute(asset_get_index("bottles_" + string(round_task[global.rounds,global.task])));
				}
				if theme_round[global.rounds] = 3
				{
					script_execute(asset_get_index("move_" + string(round_task[global.rounds,global.task])));
				}
				if theme_round[global.rounds] = 4
				{
					script_execute(asset_get_index("attention_" + string(round_task[global.rounds,global.task])));
				}
				if theme_round[global.rounds] = 1
				{
					script_execute(asset_get_index("cards_" + string(round_task[global.rounds,global.task])));
				}
				if theme_round[global.rounds] = 5
				{
					script_execute(asset_get_index("shooting_" + string(round_task[global.rounds,global.task])));
				}
			#endregion
			#region Переменные вопросов, таймер
				bot_time2 = e_time[u_question];
				timer     = u_time[u_question];
				u_question = 1;
				e_question = 1;
				global.sraka = 0; // Никто не атакует
				list_go = 1;
				
				round_task[global.rounds,1] = 1;
				round_task[global.rounds,2] = 2;
				round_task[global.rounds,3] = 3;
			
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
			
				global.game_stage = 5;
				theme_choose = 4;
				list_go      = 1;
				list_y       = -300;			
				list_scale   = 0;
				plas_scale   = 0;
				global.question = 1;
				global.task = 1;
				cards_1();
			#endregion
			#region Атака и хп
				e_hp = atk * 9;
				if global.hero = 2
				{
					e_hp = 9 * 52;
				}
				e_maxhp = e_hp;
				health_e_hp = e_hp;
			#endregion
		}
	#endregion
	#region Переменные координат тренировки
		global.training_question = 0;
		global.training_x        = global.width + 500;
		global.training_hero_i   = 0;
		global.training_gb       = "";
		global.training_gb_y     = global.height + 100;
		global.training_gb_t     = room_speed;
	#endregion
	#region Время суток, Ини
		ini_open(string(global.lang) + ".ini");
			var day_time;
			if o_control.day_hour >= 5 && o_control.day_hour < 12
			{
				day_time = ini_read_string("Menu", "day_hour_1", "");
			}
			if o_control.day_hour >= 12 && o_control.day_hour < 18
			{
				day_time = ini_read_string("Menu", "day_hour_2", "");
			}
			if o_control.day_hour >= 18
			{
				day_time = ini_read_string("Menu", "day_hour_3", "");
			}
			if o_control.day_hour < 5
			{
				day_time = ini_read_string("Menu", "day_hour_4", "");
			}
			for(i = 1; i <= 7; i ++)
			{
				for(j = 1; j <= 22; j ++)
				{
					global.training_text[i,j] = ini_read_string("Menu", "training_" + string(i) + "_" + string(j), "");
					if i = 1 && j = 1
					{
						global.training_text[1,1] = ini_read_string("Menu", "training_1_1_0", "") + day_time + ini_read_string("Menu", "training_1_1_1", "");
					}
				}
			}
		ini_close();
	#endregion
	#region Переменные текста тренировки
		global.text_go = 0;
		global.text_ne = 0;
		global.text_sc = 0;
	#endregion
	#region Рука тренировки
		global.training_hand_x = - 200;
		global.training_hand_y = - 200;
		global.training_hand_i = 0;
		global.training_hand_s = 0;
	#endregion
	#region Тренировка 4
		if global.training = 4
		{
			global.tot = 0;
			list_scale = 0;
			list_go = 0;
			global.game_stage = 0.5;
		}
	#endregion
	#region Тренировка 6
		if global.training = 6
		{
			super_text = super_text2 + super_text + "!";
		}
	#endregion
	#region Отсутствие тренировки
		if global.training = -1
		{
			global.player_rank = 15;
			global.enemy_rank  = 15;
			bot_type = 3;
			global.enemy_name = bot_name[14];
			global.enemy_hero = 7;
		}
	#endregion
#endregion
#region Уровни персонажа
	#region Уровень игрока
		global.hero_level = 10;
		if global.heroes_have[global.hero] < 110 + 42 + 26 + 16 + 10 + 6 + 4 + 2
		{
			global.hero_level = 9;
		}
		if global.heroes_have[global.hero] < 68 + 42 + 26 + 16 + 10 + 6 + 4 + 2
		{
			global.hero_level = 8;
		}
		if global.heroes_have[global.hero] < 42 + 26 + 16 + 10 + 6 + 4 + 2
		{
			global.hero_level = 7;
		}
		if global.heroes_have[global.hero] < 26 + 16 + 10 + 6 + 4 + 2
		{
			global.hero_level = 6;
		}
		if global.heroes_have[global.hero] < 16 + 10 + 6 + 4 + 2
		{
			global.hero_level = 5;
		}
		if global.heroes_have[global.hero] < 10 + 6 + 4 + 2
		{
			global.hero_level = 4;
		}
		if global.heroes_have[global.hero] < 6 + 4 + 2
		{
			global.hero_level = 3;
		}
		if global.heroes_have[global.hero] < 4 + 2
		{
			global.hero_level = 2;
		}
		if global.heroes_have[global.hero] < 2
		{
			global.hero_level = 1;
		}
	#endregion
	#region Характеристики атаки и здоровья
		atk *= (1 + 0.1 * (global.hero_level - 1));
		hp  *= (1 + 0.1 * (global.hero_level - 1));
		maxhp = hp;
		global.enemy_level = choose(global.hero_level - 1, global.hero_level - 1, global.hero_level + 1, global.hero_level);
		if global.enemy_level < 1
		{
			global.enemy_level = 1;
		}
		if global.pvp
		{
			global.enemy_level = global.hero_level;
		}
		e_atk *= (1 + 0.1 * (global.enemy_level - 1));
		e_hp  *= (1 + 0.1 * (global.enemy_level - 1));
		e_maxhp = e_hp;
	#endregion
#endregion
#region Квесты
	global.pralna = 1;
	global.bistra = 1;
	global.bistra_time = 0;
	global.spasabnast = 0;
	global.vremiaiada = 0;
#endregion
#region ПвП
	pvpi = 0;
	global.now = 0;
	global.nex = 0;
	global.pvp_stop = 0;
	pvp_stage = 0
	pvp_scale = 0;
	pvp_super_popa = 0;
	if global.pvp = 1
	{
		ini_open(string(global.lang) + ".ini");
			global.player_name = ini_read_string("Menu", "coin_you_p", "") + " 1";
			global.enemy_name  = ini_read_string("Menu", "coin_you_p", "") + " 2";
		ini_close();
	}
#endregion