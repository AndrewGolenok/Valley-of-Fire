#region Стартовые переменные
	//instance_destroy();
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

	super_x = 300;
	vvv = 0;
	vvv_time = 0;
	skill[1] = 1;
	skill[2] = 1;
	skill[3] = 1;
	
	e_skill[1] = 1;
	e_skill[2] = 1;
	e_skill[3] = 1;

	abil_x = 160;
	abil_y = global.size / 2;
	abil_s = 0.5;
	abil_a = 0;
#endregion
#region Темы
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
	//if theme_real_theme[0] != -1
	//	{
	//	if global.hero != global.enemy_hero
	//		{ theme_real_theme[irandom_range(1,2)] = global.enemy_hero; }
	//		else
	//		{ theme_real_theme[irandom_range(1,2)] = find_real_theme_1(); }
		
	//	if theme_real_theme[1] != -1
	//		{ theme_real_theme[2] = find_real_theme_2(); }
	//		else
	//		{ theme_real_theme[1] = find_real_theme_2(); }
	//	}
	//	else
	//	{
	//	if theme_real_theme[1] != -1
	//		{
	//		if global.hero != global.enemy_hero
	//			{ theme_real_theme[choose(0,2)] = global.enemy_hero; }
	//			else
	//			{ theme_real_theme[choose(0,2)] = find_real_theme_1(); }
		
	//		if theme_real_theme[0] != -1
	//			{ theme_real_theme[2] = find_real_theme_2(); }
	//			else
	//			{ theme_real_theme[0] = find_real_theme_2(); }
	//		}
	//		else
	//		{
	//		if theme_real_theme[2] != -1
	//			{
	//			if global.hero != global.enemy_hero
	//				{ theme_real_theme[choose(0,1)] = global.enemy_hero; }
	//				else
	//				{ theme_real_theme[choose(0,1)] = find_real_theme_1(); }
		
	//			if theme_real_theme[0] != -1
	//				{ theme_real_theme[1] = find_real_theme_2(); }
	//				else
	//				{ theme_real_theme[0] = find_real_theme_2(); }
	//			}
	//		}
	//	}
	
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
	round_text1 = "ROUND";
	round_text2[1] = "ONE";
	round_text2[2] = "TWO";
	round_text2[3] = "THREE";
	round_text2[0] = "DUEL!";
	
	round_text1_x = 1450;
	round_3_x     = 1450;
	round_2_x     = 1450;
	round_1_x     = 1450;
	round_0_x     = 1450;
	
	round_alpha   = 1;
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
#region Выбор игрока
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
#region Выбор победителя
	win_x  = 350;
	
	win_s1  = 1;
	win_s2  = 1;
	win_a   = 0;
	
	win_stage = 0;
	
	win_y = global.size - 50;
	win_text_y  = global.size + 100;
	win_text_y1 = global.size + 100;
#endregion
#region Переменные
	global.critical   = 0;
	global.e_critical = 0;
	
	critical_x = -250;
	critical_y = -170;
	critical_s = 0.7;
	
	global.critical_y_p = 200;
	global.critical_y_e = 200;
	
	global.cananswer  = 1;
	global.game_stage = 0;
	
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
	
	b_pressed_s[1] = 1;
	b_pressed_s[2] = 1;
	b_pressed_s[3] = 1;
	b_pressed_s[4] = 1;
	
	equation_text = "";
	vtext[1] = "+";
	vtext[2] = "-";
	vtext[3] = "/";
	vtext[4] = "*";
	
	vtrue[1] = 0;
	vtrue[2] = 0;
	vtrue[3] = 0;
	vtrue[4] = 0;
	
	hand_scale = 0;
	hand_angle = 0;
	hand_true  = 0;
	
	hand_s_x = 0;
	hand_s_y = 0;
	hand_s_t = 0;
	
	horse_p[1] = choose(-1, 1);
	horse_p[2] = choose(-1, 1);
	horse_p[3] = choose(-1, 1);
	horse_p[4] = choose(-1, 1);
	
	horse_n[1] = 0;
	horse_n[2] = 0;
	horse_n[3] = 0;
	horse_n[4] = 0;
	
	horse_now = 0;
	
	botle_all = 0;
	botle_s = 0;
	botle_stage = 0;
	
	for(i=1;i<=6;i++)
		{
		botle_y[i] = 0;
		botle_x[i] = 0;
		botle_n[i] = 0;
		
		botle_destroy[i] = 0;
		
		target_x[i] = 0;
		target_y[i] = 0;
		target_s[i] = 1;
		target_c[i] = 1;
		target_numb[i] = 0;
		}
		
	target_n = 0;
	
	o_math_mod = 1;
	o_but_sc   = 1.2;
	
	timer = 6 * room_speed;
	timer_x = 6 * room_speed;
	
	dop_q_y = 0;
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
	
	super_time  = 0;
	super_val   = 0;
	
	part_x = 0;
	part_y = 0;
	part_s = 1;
	part_n = 0;
#endregion
#region Финиш Дуэли
	whowin  = 0;
	finplas = 0;
	fin_y = 500;
	
	accuracy_true = 0;
	accuracy_all  = 0;
#endregion
#region Бот
	global.sraka = 0; // Никто не атакует
	
	view_go_left = 0;
	view_go_right = 0;
	view_go_down = 0;
	
	bot_type = irandom(3);
	
	bot_go = 0;
	bot_question = 1;
	bot_task     = 1;
	bot_time   = -1;
	bot_time2  = 6 * room_speed;
	global.bot_answer = -1;
	
	if bot_type = 0
		{ global.enemy_name = choose("DUMB BOB", "SILLY SAM", "BAD BOY"); }
	if bot_type = 1
		{ global.enemy_name = choose("SPEED GUY", "JOLLY JIM"); }
	if bot_type = 2
		{ global.enemy_name = choose("DRUNK JOE", "DOZY MO", "OLD RICK"); }
	if bot_type = 3
		{ global.enemy_name = choose("LUCKY BOY", "GOLD JACK", "MAD DOC"); }
#endregion
#region Отладка
	ongle = 0;
	restart_time  = 0;
	restart_time2  = 0;
	restart_angle = 0;
	restart_angle2 = 0;
#endregion
#region Верно или нет
	answer_rec = 0;
	answer_col = 0;
	answer_alp = 0;
#endregion