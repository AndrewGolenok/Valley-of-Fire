#region Стартовые переменные
	anim_skul = 0;
	global.player_name = choose("Andrew", "Artem", "Nikolay");
	global.enemy_rank  = choose(global.player_rank - 1, global.player_rank + 1, global.player_rank + 1, global.player_rank, global.player_rank, global.player_rank, global.player_rank, global.player_rank)
	
	if global.enemy_rank > 15
		{ global.enemy_rank = 15; }
	if global.enemy_rank < 0
		{ global.enemy_rank = 0; }
	lines_true = 0;

	list_go = 0;

	q_col  = c_white;
	h_pos  = 0;
	list_y = -300;
		
	button_xc = 0;
	button_x  = 0;
		
	list_scale = 0;
	plas_scale = 0;
		
	win_plas = 0;

	theme_choose = 1;

	question_text = global.question_text[1, 1];

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
	abil_y = y; //global.size / 2;
	abil_s = 0.5;
	abil_a = 0;
#endregion
#region Темы (Старое)
	theme_stage = 1;
	
	theme_goto_y = 0;
	theme_lo     = 0;
	theme_c      = -1;
	theme_c_true = 0;
	theme_text_y = -600;
	
	theme_real_theme[0] = -1;
	theme_real_theme[1] = -1;
	theme_real_theme[2] = -1;
	
	theme_real_open[0]  = 0;
	theme_real_open[1]  = 0;
	theme_real_open[2]  = 0;
	
	theme_real_theme[irandom_range(0,2)] = global.hero;
	
	if theme_real_theme[0] != -1
		{
		var ttl;
		ttl = choose(1,-1);
		if ttl = 1
			{
			theme_real_theme[1] = 2;
			theme_real_theme[2] = 3;
			}
			else
			{
			theme_real_theme[1] = 3;
			theme_real_theme[2] = 2;
			}
		}
		else
		{
		if theme_real_theme[1] != -1
			{
			var ttl;
			ttl = choose(1,-1);
			if ttl = 1
				{
				theme_real_theme[0] = 2;
				theme_real_theme[2] = 3;
				}
				else
				{
				theme_real_theme[0] = 3;
				theme_real_theme[2] = 2;
				}
			}
			else
			{
			if theme_real_theme[2] != -1
				{
				var ttl;
				ttl = choose(1,-1);
				if ttl = 1
					{
					theme_real_theme[0] = 2;
					theme_real_theme[1] = 3;
					}
					else
					{
					theme_real_theme[0] = 3;
					theme_real_theme[1] = 2;
					}
				}
			}
		}
	theme_real_theme[2] = 5;
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
	for(i=1; i<=11; i++)
		{ theme_b_th[i] = global.theme_name[i]; }
#endregion
#region Раунды
	//round_text1 = "ROUND";
	//round_text2[1] = "ONE";
	//round_text2[2] = "TWO";
	//round_text2[3] = "THREE";
	//round_text2[0] = "DUEL!";
	
	round_text1_x = 1450;
	//round_3_x     = 1450;
	//round_2_x     = 1450;
	//round_1_x     = 1450;
	//round_0_x     = 1450;
	
	//round_alpha   = 1;
#endregion
#region Черепки
	for(j=1; j<=3; j++)
		{
		roundskul[j]   = 0;
		roundskul_y[j] = 200;
		roundskul_n[j] = 0;
		roundskul_s[j] = 0.1;
	
		roundskul_xs[j] = 0;
		roundskul_xa[j] = 0;
		}
#endregion
#region Смайлы
	enemy_smile_chance = -1;
	enemy_smile_time   = -1;
	enemy_smile        = -1;
	
	smile_open = 0;

	smile_sc   = 0;

	smile_show = 0;
	smile_cur  = 0;
	smile_alp  = 0;
	smile_sy   = 0;
	smile_sec  = 0;
	smile_img  = 0;
	
	smile_show1 = 0;
	smile_cur1  = 0;
	smile_alp1  = 0;
	smile_sy1   = 0;
	smile_sec1  = 0;
	smile_img1  = 0;

	smile_bi   = 0;
	smile_bs   = 1;

	smile_n    = 0;

	for(i=0; i<=5; i++)
		{ smile_ss[i] = 0; }
#endregion
#region Выбор Игрока
	#region Первый
		hand_choose = 0;
		hand_x = 640;
		hand_y = global.size + 100;
		hand_a = 0;
		hand_s = 0.9;
		hand_t = 0;
	
		first_player = -1;
	
		hand_text_n = 0;
	
		hand_text_x = 1280 + 300;
		hand_dir    = 1;
	
		hand_alpha  = 1;
		hand_text_y = 0;
	
		theme_points_time = 0;
		theme_points = "";
	
		timer_t = 30 * room_speed;
	
		enemy_timer = -1;
	
		ini_open("Language/" + string_lower(string(global.lang)) + "/other_text_" + string_lower(string(global.lang)) + ".ini");
		ini_open("other_text_en.ini")
		hand_text[0] = ini_read_string("Text", "hand_text_0", "");
		hand_text[1] = ini_read_string("Text", "hand_text_1", "");
		hand_text[2] = ini_read_string("Text", "hand_text_2", "");
	
		theme_text[0] = ini_read_string("Text", "theme_text_0", "");
		theme_text[1] = ini_read_string("Text", "theme_text_1", "");
	
		win_text[0] = ini_read_string("Text", "win_text_0", "");
		win_text[1] = ini_read_string("Text", "win_text_1", "");
	
		end_text[0] = ini_read_string("Text", "end_text_0", "");
		end_text[1] = ini_read_string("Text", "end_text_1", "");
	
		for(i=0;i<=2;i++)
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
			}
	
		//dop_damage_x = 0;
		//dop_damage_y = 0;
		//dop_damage_a = 1;
		//dop_damage_s = 1;
	
		dop_t[3] = 0;
		dop_t[4] = 0;
		dop_t[5] = 0;
		dop_t[6] = 0;
	
		dop_dmg = 0;
	
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
	#region Второй
		coin_x = 640;
		coin_y = global.size + 100;
		coin_s = 1;
		coin_a = 0;
		coin_i = choose(0, 9);
		coin_spd = 35;
		coin_d = 0;
		
		coin_stage = 0;
		first_time = 0;
		
		name_x  = 0;
		name_y  = 0;
		name_s  = 0;
		
		first_x = 0;
		first_y = 0;
		first_s = 0;
		
		th_ch1_x = 0;
		th_ch1_y = 0;
		th_ch1_s = 0;
		
		th_ch2_x = 0;
		th_ch2_y = 0;
		th_ch2_s = 0;
		
		theme_s1 = 1;
		theme_s2 = 1;
		theme_s3 = 1;
		
		coin_you[1]  = "YOU";
		coin_you[0]  = "ENEMY";
		coin_you[2]  = "FIRST"
		coin_text1 = "GET READY?";
		coin_text2 = "GO!";
		
		coin_text1_a = 0;
		coin_text2_a = 0;
		
		coin_text1_s = 0;
		coin_text2_s = 0;
	#endregion
#endregion
#region Выбор Темы
	theme_x[1]  = 640 - 300;
	theme_y[1]  = global.size / 2;
	theme_s[1]  = 0;
	theme_t[1]  = global.enemy_hero;
	theme_a[1]  = 1;
	theme_nn[1] = global.theme_name[theme_t[1]];
	theme_x1[1] = 0;
	theme_y1[1] = 0;
	theme_a1[1] = irandom(360);
	
	theme_x[2]  = 640;
	theme_y[2]  = global.size / 2;
	theme_s[2]  = 0;
	if global.enemy_hero != global.hero
		{ theme_t[2] = global.hero; }
		else
		{ theme_t[2] = theme_new(theme_t[1], -1); }
	
	theme_a[2]  = 1;
	theme_nn[2] = global.theme_name[theme_t[2]];
	theme_x1[2] = 0;
	theme_y1[2] = 0;
	theme_a1[2] = irandom(360);
	
	theme_x[3]  = 640 + 300;
	theme_y[3]  = global.size / 2;
	theme_s[3]  = 0;
	theme_t[3]  = theme_new(theme_t[1], theme_t[2]);
	theme_a[3]  = 1;
	theme_nn[3] = global.theme_name[theme_t[3]];
	theme_x1[3] = 0;
	theme_y1[3] = 0;
	theme_a1[3] = irandom(360);
	
	choose_y = global.size + 300;
	
	theme_g = 0;
	theme_click = 0;
	theme_dot   = "";
	
	theme_timer = room_speed * 14;
#endregion
#region Объявление раунда
	round_text[1] = "ROUND";
	round_text[2] = "READY?";
	round_text[3] = "GO!";
	
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
#endregion
#region Объявление победителя
	win_x  = 350;
	
	win_s1  = 1;
	win_s2  = 1;
	win_a   = 0;
	
	win_stage = 0;
	
	win_y = global.size - 50;
	win_text_y  = global.size + 100;
	win_text_y1 = global.size + 100;
	
	
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
#endregion
#region Переменные
	global.critical   = 0;
	global.e_critical = 0;
	
	critical_x = -250;
	critical_y = -170;
	critical_s = 0.7;
	
	global.critical_y_p = 200;
	global.critical_y_e = 200;
	
	global.cananswer   = 1;
	global.game_stage  = 0;
	
	global.abilitican   = 1;
	global.e_abilitican = 1;
	
	theme_round[1] = -1;
	theme_round[2] = -1;
	theme_round[3] = -1; // В каком раунде какая тема
	
	global.rounds   = 1; // Какой сейчас раунд
	global.task     = 1; // Какая задача (1-3)
	global.question = 1; // Какой вопрос (1-3)
	
	global.answer = -1; // Ответил на все вопросы задачи или нет
		
	for(i=1;i<=3;i++)
		{
		for(j=1;j<=3;j++)
			{
			round_task[i,j] = 0;
			}
		}
	
	maxhp = global.hp[global.hero];
	hp    = maxhp;
	atk   = global.atk[global.hero];
	
	e_maxhp = global.hp[global.enemy_hero];
	e_hp    = e_maxhp;
	e_atk   = global.atk[global.enemy_hero]; // Макс хп, хп и урон
	
	weapon    = 0;
	e_wepaon  = 0; // Оружия
	
	passive   = 1; // Пассивная
	e_passive = 1; // Пассивная
	
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
	
	health_al = 1;
	health_hp = hp;
	
	health_e_al = 1;
	health_e_hp = e_hp;
	
	global.pin = -1;
	
	///
	
	theme_round[1] = -1; // Математика
	theme_round[2] = -1; // Математика
	theme_round[3] = -1; // Математика
	
	o_math_mod = 1;
	o_but_sc   = 1.2;
	
	timer   = 6 * room_speed; // (6 + 3 * global.p_totem_a[4]) * room_speed
	timer_x = 6 * room_speed;
	
	dop_q_y = 0;
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
		bottle_all   = 0;
		bottle_s     = 1;
		bottle_stage = 0;
		bottle_red   = 0;
		bottle_s1    = 1;
		bottle_s2    = 1;
		bottle_a1    = 1;
		bottle_red_a = 0;
		
		bottle_change = 0;
		bottle_end    = 0;
		
		for(i=1;i<=6;i++)
			{
			bottle_y[i]  = 0;
			bottle_a[i]  = 0;
			bottle_x[i]  = 0;
			bottle_n[i]  = 0;
			bottle_n1[i] = 0;
			bottle_i[i]  = irandom_range(2, 3);//irandom_range(1, 4);
			
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
		
		for(i=1;i<=6;i++)
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
			for(i=1;i<=5;i++)
				{
				hand_sign[i] = 0;
				hand_sign_red[i] = 0;
				hand_sign_xx[i]  = 0;
				hand_sign_ss[i]  = 1;
				hand_sign_r[i]   = 0;
				
				for(j=1;j<=3;j++)
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
			for(i=1;i<=6;i++)
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
		for(i=1;i<=2;i++)
			{
			for(j=1;j<=3;j++)
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
		cards_1(); //card_what();
		//cards_2();
		
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
			for(i=1;i<=5;i++)
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
			aim_yy[2] = global.size - 210;
			
			aim_xx[3] = 640;
			aim_yy[3] = global.size / 2;
			
			aim_xx[4] = 640 + 150;
			aim_yy[4] = 150;
			
			aim_xx[5] = 640 + 300;
			aim_yy[5] = global.size - 210;
			
			aim_now   = 1;
			aim_all   = 2;
			aim_max_r = 0;
			for(i=1;i<=5;i++)
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
			
			for(i=1;i<=5;i++)
				{
				target_n[i] = 0;
				target_m[i] = 0;
				
				target_y[i] = global.size / 2;
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
			
			//targetk_v[1] = 0;
			//targetk_v[2] = 72;
			//targetk_v[3] = 72 * 2;
			//targetk_v[4] = 72 * 3;
			//targetk_v[5] = 72 * 4;
			
			for(i=1;i<=5;i++)
				{
				targetk_v[i] = 72 * (i - 1)
				targetk_n[i] = 0;
				targetk_d[i] = 0;
				}
			for(i=1;i<=6;i++)
				{
				knife_now  = 1;
				knife_spd  = 20;
				knife_y[i] = global.size / 2;
				knife_x[i] = 640 - 170;
				
				knife_d[i] = 0;
				knife_a[i] = 0;
				knife_n[i] = 0;
				
				knife_a1[i] = 0;
				}
		#endregion
	#endregion
	#region	Шторм      - Storm
		global.storm = 0;
	#endregion
#endregion
#region Суперудар Кнопка
	super_need  = 3;
	super_now   = 0;
	super_now1  = 0;
	super_scale = 0;
	super_stage = 0;
	super_zhopa = 300;
	super_angle = 0;
	super_dir   = 1;
	super_alp   = 1;
	super_alp1  = 1;
	super_alpha = 1;
	
	e_super_need = 3;
	e_super_now  = 0;
	e_super_now1 = 0;
	
	super_time  = 0;
	super_val   = 0;
	
	part_x = 0;
	part_y = 0;
	part_s = 1;
	part_n = 0;
	part_xspd = 0;
	part_yspd = 0;
	
	health_timer = 20;
	health_scale = 1;
	
	health_e_timer = 20;
	health_e_scale = 1;
	
	shaker = 0;
	shaker_dir = 1;
	shaker_spd = 10;
	shaker_ang = 0;
	go_hp = 0;
	
	super_text = "SUPER";
#endregion
#region Финиш Дуэли
	whowin  = 0;
	finplas = 0;
	fin_y = 500;
	
	accuracy_true = 0;
	accuracy_all  = 0;
#endregion
#region Бот
	for(i=1;i<=12;i++)
		{
		u_answer[i] = -1;
		e_answer[i] = -1;
		
		u_time[i] = 6 * room_speed;
		e_time[i] = 6 * room_speed;
		}
	u_question = 1;
	e_question = 1;
	global.sraka = 0; // Никто не атакует
	for(i=1;i<=8;i++)
		{
		for(j=1;j<=4;j++)
			{
			min_time[i,j] = 10;
			min_wait[i,j] = 10;
			}
		}
	///
	
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
	
	min_wait[2,1] = 90//50;
	min_wait[2,2] = 0;
	min_wait[2,3] = 90//50;
	min_wait[2,4] = 0;
	
	min_wait[3,1] = 10;
	min_wait[3,2] = 10;
	min_wait[3,3] = 10;
	min_wait[3,4] = 10;
	
	min_wait[4,1] = 90;
	min_wait[4,2] = 100;
	min_wait[4,3] = 0;
	min_wait[4,4] = 0;
	
	///
	
	pre_wait = 1;
	bot_wait = 1;
	
	view_go_left = 0;
	view_go_right = 0;
	view_go_down = 0;
	
	if global.player_rank = 15
		{ bot_type = choose(0, 0, 1, irandom(3)); }
	if global.player_rank < 15 && global.player_rank >= 13
		{ bot_type = choose(0, 1, irandom(3)); }
	if global.player_rank < 13 && global.player_rank > 10
		{ bot_type = choose(0, 1, 1, irandom(3)); }
	if global.player_rank <= 10 && global.player_rank > 8
		{ bot_type = choose(1, irandom(3)); }
	if global.player_rank <= 8 && global.player_rank > 5
		{ bot_type = irandom(3); }
	if global.player_rank >= 5 && global.player_rank < 3
		{ bot_type = irandom(3); }
	if global.player_rank >= 3 && global.player_rank < 1
		{ bot_type = choose(2, 1, irandom_range(2, 3), irandom(3)); }
	if global.player_rank = 1
		{ bot_type = choose(2, 3, irandom_range(2, 3), irandom(3), irandom(3)); }
	if global.player_rank = 0
		{ choose(3, 3, irandom_range(2, 3), irandom(3), irandom(3)); }
	
	
	bot_go = 0;
	bot_question = 1;
	bot_task     = 1;
	bot_time   = -1;
	bot_time2  = 6 * room_speed;
	global.bot_answer = -1;
	
	hpold = 0;
	hprld = 0;
	
	timer_y = 0;
	
	if bot_type = 0
		{ global.enemy_name = choose("DUMB BOB", "SILLY SAM", "BAD BOY"); }
	if bot_type = 1
		{ global.enemy_name = choose("SPEED GUY", "JOLLY JIM"); }
	if bot_type = 2
		{ global.enemy_name = choose("DRUNK JOE", "DOZY MO", "OLD RICK"); }
	if bot_type = 3
		{ global.enemy_name = choose("LUCKY BOY", "GOLD JACK", "MAD DOC"); }
	if global.training > 0
		{ global.enemy_name = "MR. SMART"; }
#endregion
#region Отладка
	ongle = 0;
	restart_time  = 0;
	restart_time2  = 0;
	restart_angle = 0;
	restart_angle2 = 0;
	
	color[0] = c_white;
	color[1] = c_white;
	color[2] = c_white;
	color[3] = c_white;
	color[4] = c_white;
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
	idol_alpha   = 0;
	idol_alpha_s = 0;
#endregion
#region ТОТЕМЫ
	global.tot = 0;
	global.p_totem[1] = 1;
	global.p_totem[2] = 2;
	global.p_totem[3] = 3;
	
	global.enemy_level = irandom_range(1,10);
	#region Случайные тотемы Врага
		if global.enemy_level <= 4
			{
			global.e_totem[1] = choose(irandom_range(1, 6), irandom_range(1, 11), irandom_range(1, 15), irandom_range(1, 18));
			global.e_totem[2] = -1;
			global.e_totem[3] = -1;
			}
		if global.enemy_level > 4 && global.enemy_level < 7
			{
			var toi;
			global.e_totem[1] = choose(irandom_range(1, 11), irandom_range(1, 15), irandom_range(1, 18));
		
			if global.e_totem[1] != 1
				{ global.e_totem[2] = irandom_range(1, global.e_totem[1]); }
				else
				{ global.e_totem[2] = choose(irandom_range(2, 11), irandom_range(2, 15), irandom_range(2, 18)); }
			global.e_totem[3] = -1;
			}
		if global.enemy_level >= 7
			{
			var toi;
			global.e_totem[1] = choose(irandom_range(1, 11), irandom_range(1, 15), irandom_range(1, 18));
		
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
				global.e_totem[2] = choose(irandom_range(2, 15), irandom_range(2, 18)); 
				if global.e_totem[2] != 2
					{ global.e_totem[3] = irandom_range(2, global.e_totem[2]); }
					else
					{ global.e_totem[3] = irandom_range(3, 18); }
				}
			}
	#endregion
	
	//global.e_totem[1] = 18;
	//global.e_totem[2] = 2;
	//global.e_totem[3] = 3;
		
	for(i=1;i<=3;i++)
		{
		if global.p_totem[i] <= 6
			{ totem_pc[i] = c_white; }
		if global.e_totem[i] <= 6
			{ totem_ec[i] = c_white; }
		
		if global.p_totem[i] > 6 && global.p_totem[i] <= 11
			{ totem_pc[i] = c_aqua; } // make_color_rgb(127,199,255);
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
	
	var txx, tss;
	txx = 640;
	tss = 0.3;
	totem_alpha   = 1;
	totem_alpha_d = -1;
	totem_x = -600;
	
	if global.p_totem[1] = -1
		{
		totem_py[1] = -200;
		totem_py[2] = -200;
		totem_py[3] = -200;
		}
	if global.p_totem[1] != -1 && global.p_totem[2] = -1 && global.p_totem[3] = -1
		{
		totem_py[1] = global.size / 2 + 470 * tss * 0.9;
		totem_py[2] = 0;
		totem_py[3] = 0;
		}
	if global.p_totem[1] != -1 && global.p_totem[2] != -1 && global.p_totem[3] = -1
		{
		totem_py[1] = global.size / 2;
		totem_py[2] = global.size / 2 + 470 * tss * 0.9;
		totem_py[3] = 0;
		}
	if global.p_totem[1] != -1 && global.p_totem[2] != -1 && global.p_totem[3] != -1
		{
		totem_py[1] = global.size / 2 - 470 * tss * 0.9;
		totem_py[2] = global.size / 2;
		totem_py[3] = global.size / 2 + 470 * tss * 0.9;
		}
		
	//
	if global.e_totem[1] = -1
		{
		totem_ey[1] = -200;
		totem_ey[2] = -200;
		totem_ey[3] = -200;
		}
	if global.e_totem[1] != -1 && global.e_totem[2] = -1 && global.e_totem[3] = -1
		{
		totem_ey[1] = global.size / 2 + 470 * tss * 0.9;
		totem_ey[2] = -200;
		totem_ey[3] = -200;
		}
	if global.e_totem[1] != -1 && global.e_totem[2] != -1 && global.e_totem[3] = -1
		{
		totem_ey[1] = global.size / 2;
		totem_ey[2] = global.size / 2 + 470 * tss * 0.9;
		totem_ey[3] = -200;
		}
	if global.e_totem[1] != -1 && global.e_totem[2] != -1 && global.e_totem[3] != -1
		{
		totem_ey[1] = global.size / 2 - 470 * tss * 0.9;
		totem_ey[2] = global.size / 2;
		totem_ey[3] = global.size / 2 + 470 * tss * 0.9;
		}
	//
	
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
	
	for(i=1;i<=19;i++)
		{
		global.p_totem_a[i] = 0;
		global.e_totem_a[i] = 0;
		for(j=1;j<=3;j++)
			{
			if global.p_totem[j] = i
				{ global.p_totem_a[i] = 1; }
			if global.e_totem[j] = i
				{ global.e_totem_a[i] = 1; }
			}
		}
	
	 if global.e_totem_a[15] = 1
		{ e_super_need = 2; }
	if global.p_totem_a[15] = 1
		{ super_need = 2; }
	
	poison_e = 0;
#endregion
#region ОБУЧЕНИЕ
	global.training_stage[1] = -1;
	global.training_stage[2] = -1;
	global.training_stage[3] = -1;
	global.training_stage[4] = -1;
	global.training_stage[5] = -1;
	global.training_stage[6] = -1;
	
	if global.training > 0
		{
		global.player_rank = 15;
		global.training_stage[global.training] = 1;
		theme_choose = 4; theme_g = 3;
		theme_t[3] = global.hero;
		global.rounds = 3;
		global.task  = 1;
		global.game_stage = 5;
		
		global.p_totem[1] = -1;
		global.p_totem[2] = -1;
		global.p_totem[3] = -1;
		
		global.e_totem[1] = -1;
		global.e_totem[2] = -1;
		global.e_totem[3] = -1;
		theme_round[global.rounds]  = global.training;
		round_task[global.rounds,1] = 1;
		
		#region Переменные
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
			list_go = 1//!list_go;
			list_y = -300;
												
			list_scale = 0;
			plas_scale = 0;
			
			
			global.question = 1;
			global.task = 1;
			cards_1();
		#endregion
		
		e_hp    = atk * 9;
		e_maxhp = atk * 9;
		health_e_hp = e_hp;
		}
	global.training_question = 0;
	global.training_x = 1280 + 200;
	
	global.training_goodbad   = ""; //choose("GOOD!", "AWESOME!", "EXELLENT", "TRY AGAIN");
	global.training_goodbad_y = global.size + 100;
	global.training_goodbad_t = room_speed;
	var day_time;
	if o_control.day_hour >= 5 && o_control.day_hour < 12
		{ day_time = "MORNING" }
	if o_control.day_hour >= 12 && o_control.day_hour < 18
		{ day_time = "AFTERNOON" }
	if o_control.day_hour >= 18
		{ day_time = "EVENING" }
	if o_control.day_hour < 5
		{ day_time = "NIGHT" }
		
	#region Карты
		global.training_text[1,1]  = "GOOD " + day_time + " FRIEND! WELCOME TO THE VALLEY OF FIRE!";
		global.training_text[1,2]  = "YOU HAVE TO DEFEAT THE OPPONENT BY ANSWERING TASKS!";
		global.training_text[1,3]  = "WHO HAS MORE HEALTH POINTS WINS THE ROUND. WHO HAS A VICTORY IN WHO ROUNDS WINS THE DUEL!";
		global.training_text[1,4]  = "";
		global.training_text[1,5]  = "NOW I WILL TEACH YOU TO PLAY THE THEME CARDS!";
		
		global.training_text[1,6]  = "TASK FIRST: PAIR OF THE CARDS";
		global.training_text[1,7]  = "REMEMBER THE POSITION OF THE CARDS";
		global.training_text[1,8]  = "AND TAP ONE THE PAIR OF THE CARDS";
		global.training_text[1,9]  = "";
		
		global.training_text[1,10] = "TASK SECOND: FIND THE CARD";
		global.training_text[1,11] = "REMEMBER THE POSITION OF THE CARDS";
		global.training_text[1,12] = "REMEMBER THIS CARD";
		global.training_text[1,13] = "AND TAP ON THE TWO REQUIRED THE CARDS";
		
		global.training_text[1,14] = "TASK THIRD: THE SEQUENCE OF THE CARDS";
		global.training_text[1,15] = "REMEMBER THE SEQUENCE OF THE CARDS";
		global.training_text[1,16] = "TAP ON THE CARDS IN THE ORIGINAL SEQUENCE";
		global.training_text[1,17] = "";
		
		global.training_text[1,18] = "";
		global.training_text[1,19] = "";
		global.training_text[1,20] = "";
		global.training_text[1,21] = "";
		
		global.training_text[1,22] = "I TAUGHT YOU EVERYTHING I KNEW MYSELF! JOE WILL TEACH YOU HOW TO PLAY THE THEME BOTTLES";
	#endregion
	#region Бутылки
		global.training_text[2,1]  = "GOOD " + day_time + " FRIEND! WELCOME TO THE VALLEY OF FIRE!";
		global.training_text[2,2]  = "YOU HAVE TO DEFEAT THE OPPONENT BY ANSWERING TASKS!";
		global.training_text[2,3]  = "WHO HAS MORE HEALTH POINTS WINS THE ROUND. WHO HAS A VICTORY IN WHO ROUNDS WINS THE DUEL!";
		global.training_text[2,4]  = "";
		global.training_text[2,5]  = "NOW I WILL TEACH YOU TO PLAY THE THEME CARDS!";
		
		global.training_text[2,6]  = "TASK FIRST: PAIR OF THE CARDS";
		global.training_text[2,7]  = "REMEMBER THE POSITION OF THE CARDS";
		global.training_text[2,8]  = "AND TAP ONE THE PAIR OF THE CARDS";
		global.training_text[2,9]  = "";
		
		global.training_text[2,10] = "TASK SECOND: FIND THE CARD";
		global.training_text[2,11] = "REMEMBER THE POSITION OF THE CARDS";
		global.training_text[2,12] = "REMEMBER THIS CARD";
		global.training_text[2,13] = "AND TAP ON THE TWO REQUIRED THE CARDS";
		
		global.training_text[2,14] = "TASK FIRTH: THE SEQUENCE OF THE CARDS";
		global.training_text[2,15] = "REMEMBER THE SEQUENCE OF THE CARDS";
		global.training_text[2,16] = "TAP ON THE CARDS IN THE ORIGINAL SEQUENCE";
		global.training_text[2,17] = "";
		
		global.training_text[2,18] = "HA";
		global.training_text[2,19] = "HA HA";
		global.training_text[2,20] = "HA HA HA";
		global.training_text[2,21] = "BASTARD";
		
		global.training_text[2,22] = "I TAUGHT YOU EVERYTHING I KNEW MYSELF! JOE WILL TEACH YOU HOW TO PLAY THE THEME BOTTLES";
	#endregion
	#region Движение
		global.training_text[3,1]  = "GOOD " + day_time + " FRIEND! WELCOME TO THE VALLEY OF FIRE!";
		global.training_text[3,2]  = "YOU HAVE TO DEFEAT THE OPPONENT BY ANSWERING TASKS!";
		global.training_text[3,3]  = "WHO HAS MORE HEALTH POINTS WINS THE ROUND. WHO HAS A VICTORY IN WHO ROUNDS WINS THE DUEL!";
		global.training_text[3,4]  = "";
		global.training_text[3,5]  = "NOW I WILL TEACH YOU TO PLAY THE THEME CARDS!";
		
		global.training_text[3,6]  = "TASK FIRST: PAIR OF THE CARDS";
		global.training_text[3,7]  = "REMEMBER THE POSITION OF THE CARDS";
		global.training_text[3,8]  = "AND TAP ONE THE PAIR OF THE CARDS";
		global.training_text[3,9]  = "";
		
		global.training_text[3,10] = "TASK SECOND: FIND THE CARD";
		global.training_text[3,11] = "REMEMBER THE POSITION OF THE CARDS";
		global.training_text[3,12] = "REMEMBER THIS CARD";
		global.training_text[3,13] = "AND TAP ON THE TWO REQUIRED THE CARDS";
		
		global.training_text[3,14] = "TASK FIRTH: THE SEQUENCE OF THE CARDS";
		global.training_text[3,15] = "REMEMBER THE SEQUENCE OF THE CARDS";
		global.training_text[3,16] = "TAP ON THE CARDS IN THE ORIGINAL SEQUENCE";
		global.training_text[3,17] = "";
		
		global.training_text[3,18] = "";
		global.training_text[3,19] = "";
		global.training_text[3,20] = "";
		global.training_text[3,21] = "";
		
		global.training_text[3,22] = "I TAUGHT YOU EVERYTHING I KNEW MYSELF! JOE WILL TEACH YOU HOW TO PLAY THE THEME BOTTLES";
	#endregion
	#region Внимание
		global.training_text[4,1]  = "GOOD " + day_time + " FRIEND! WELCOME TO THE VALLEY OF FIRE!";
		global.training_text[4,2]  = "YOU HAVE TO DEFEAT THE OPPONENT BY ANSWERING TASKS!";
		global.training_text[4,3]  = "WHO HAS MORE HEALTH POINTS WINS THE ROUND. WHO HAS A VICTORY IN WHO ROUNDS WINS THE DUEL!";
		global.training_text[4,4]  = "";
		global.training_text[4,5]  = "NOW I WILL TEACH YOU TO PLAY THE THEME CARDS!";
		
		global.training_text[4,6]  = "TASK FIRST: PAIR OF THE CARDS";
		global.training_text[4,7]  = "REMEMBER THE POSITION OF THE CARDS";
		global.training_text[4,8]  = "AND TAP ONE THE PAIR OF THE CARDS";
		global.training_text[4,9]  = "";
		
		global.training_text[4,10] = "TASK SECOND: FIND THE CARD";
		global.training_text[4,11] = "REMEMBER THE POSITION OF THE CARDS";
		global.training_text[4,12] = "REMEMBER THIS CARD";
		global.training_text[4,13] = "AND TAP ON THE TWO REQUIRED THE CARDS";
		
		global.training_text[4,14] = "TASK FIRTH: THE SEQUENCE OF THE CARDS";
		global.training_text[4,15] = "REMEMBER THE SEQUENCE OF THE CARDS";
		global.training_text[4,16] = "TAP ON THE CARDS IN THE ORIGINAL SEQUENCE";
		global.training_text[4,17] = "";
		
		global.training_text[4,18] = "";
		global.training_text[4,19] = "";
		global.training_text[4,20] = "";
		global.training_text[4,21] = "";
		
		global.training_text[4,22] = "I TAUGHT YOU EVERYTHING I KNEW MYSELF! JOE WILL TEACH YOU HOW TO PLAY THE THEME BOTTLES";
	#endregion
	#region Стрельба
		global.training_text[5,1]  = "GOOD " + day_time + " FRIEND! WELCOME TO THE VALLEY OF FIRE!";
		global.training_text[5,2]  = "YOU HAVE TO DEFEAT THE OPPONENT BY ANSWERING TASKS!";
		global.training_text[5,3]  = "WHO HAS MORE HEALTH POINTS WINS THE ROUND. WHO HAS A VICTORY IN WHO ROUNDS WINS THE DUEL!";
		global.training_text[5,4]  = "";
		global.training_text[5,5]  = "NOW I WILL TEACH YOU TO PLAY THE THEME CARDS!";
		
		global.training_text[5,6]  = "TASK FIRST: PAIR OF THE CARDS";
		global.training_text[5,7]  = "REMEMBER THE POSITION OF THE CARDS";
		global.training_text[5,8]  = "AND TAP ONE THE PAIR OF THE CARDS";
		global.training_text[5,9]  = "";
		
		global.training_text[5,10] = "TASK SECOND: FIND THE CARD";
		global.training_text[5,11] = "REMEMBER THE POSITION OF THE CARDS";
		global.training_text[5,12] = "REMEMBER THIS CARD";
		global.training_text[5,13] = "AND TAP ON THE TWO REQUIRED THE CARDS";
		
		global.training_text[5,14] = "TASK FIRTH: THE SEQUENCE OF THE CARDS";
		global.training_text[5,15] = "REMEMBER THE SEQUENCE OF THE CARDS";
		global.training_text[5,16] = "TAP ON THE CARDS IN THE ORIGINAL SEQUENCE";
		global.training_text[5,17] = "";
		
		global.training_text[5,18] = "";
		global.training_text[5,19] = "";
		global.training_text[5,20] = "";
		global.training_text[5,21] = "";
		
		global.training_text[5,22] = "I TAUGHT YOU EVERYTHING I KNEW MYSELF! JOE WILL TEACH YOU HOW TO PLAY THE THEME BOTTLES";
	#endregion
	#region Математика
		global.training_text[6,1]  = "GOOD " + day_time + " FRIEND! WELCOME TO THE VALLEY OF FIRE!";
		global.training_text[6,2]  = "YOU HAVE TO DEFEAT THE OPPONENT BY ANSWERING TASKS!";
		global.training_text[6,3]  = "WHO HAS MORE HEALTH POINTS WINS THE ROUND. WHO HAS A VICTORY IN WHO ROUNDS WINS THE DUEL!";
		global.training_text[6,4]  = "";
		global.training_text[6,5]  = "NOW I WILL TEACH YOU TO PLAY THE THEME CARDS!";
		
		global.training_text[6,6]  = "TASK FIRST: PAIR OF THE CARDS";
		global.training_text[6,7]  = "REMEMBER THE POSITION OF THE CARDS";
		global.training_text[6,8]  = "AND TAP ONE THE PAIR OF THE CARDS";
		global.training_text[6,9]  = "";
		
		global.training_text[6,10] = "TASK SECOND: FIND THE CARD";
		global.training_text[6,11] = "REMEMBER THE POSITION OF THE CARDS";
		global.training_text[6,12] = "REMEMBER THIS CARD";
		global.training_text[6,13] = "AND TAP ON THE TWO REQUIRED THE CARDS";
		
		global.training_text[6,14] = "TASK FIRTH: THE SEQUENCE OF THE CARDS";
		global.training_text[6,15] = "REMEMBER THE SEQUENCE OF THE CARDS";
		global.training_text[6,16] = "TAP ON THE CARDS IN THE ORIGINAL SEQUENCE";
		global.training_text[6,17] = "";
		
		global.training_text[6,18] = "HEH";
		global.training_text[6,19] = "HEH HEH";
		global.training_text[6,20] = "HEH HEH HEH";
		global.training_text[6,21] = "HUNNY";
		
		global.training_text[6,22] = "I TAUGHT YOU EVERYTHING I KNEW MYSELF! JOE WILL TEACH YOU HOW TO PLAY THE THEME BOTTLES";
		//REMEMBER, WITH EACH NEW RANK OF THE TASKS WILL BE MORE DIFFICULT!
	#endregion
	
	global.text_go = 0;
	global.text_ne = 0;
	global.text_sc = 0;
	
	global.training_hand_x = - 200;
	global.training_hand_y = - 200;
	global.training_hand_i = 0;
	global.training_hand_s = 0;
#endregion