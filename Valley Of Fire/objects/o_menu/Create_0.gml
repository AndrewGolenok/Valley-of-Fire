#region Меню
	if global.training_o = 0
		{ global.menu_now   = "training"; } //"main";
	global.back_scale = 1280 / 2092; //global.size / 1024;
	
#endregion
#region Тренировка
	training_back_y = global.size + 350;
	global.training = 0;
	#region Чтение ини
	ini_open("Music.ini");
		global.training_o = ini_read_real("Training", "training", 0);
		
		global.tr[1] = ini_read_real("Training", "tr1", 0);
		global.tr[2] = ini_read_real("Training", "tr2", 0);
		global.tr[3] = ini_read_real("Training", "tr3", 0);
		global.tr[4] = ini_read_real("Training", "tr4", 0);
		global.tr[5] = ini_read_real("Training", "tr5", 0);
		global.tr[6] = ini_read_real("Training", "tr6", 0);
	ini_close();
	#endregion
	theme_sc = 0.4;
	tr_yes = 1;
	for(i=1;i<=3;i++)
		{
		for(j=1;j<=2;j++)
			{
			theme_x[i,j] = 640 - 400 + 200 * i;
			if j = 1
				{
				theme_y[i,j]  = global.size / 2 - 120;
				theme_t[i,j]  = i;
				
				theme_ot[i,j] = global.tr[i];
				
				if theme_ot[i,j] = 1
					{ theme_a[i,j] = 10; }
					else
					{ theme_a[i,j] = 0; }
				}
				else
				{
				theme_y[i,j]  = global.size / 2 + 100;
				theme_t[i,j]  = 3 + i;
				
				theme_ot[i,j] = global.tr[3+i];
				
				if theme_ot[i,j] = 1
					{ theme_a[i,j] = 10; }
					else
					{ theme_a[i,j] = 0; }
				}
			
			theme_op[i,j]  = 0;
			theme_s[i,j]   = 1;
			theme_ss[i,j]  = 1;
			theme_stage[i,j] = 0;
			theme_nn[i,j] = global.theme_name[theme_t[i,j]];
			}
		}
#endregion

#region Главное меню (СТАРОЕ)
	#region Мобайл / Планшет
		if os_device = device_tablet
			{ global.tablet = 0; }
			else
			{ global.tablet = 1; }
		
		global.tablet = choose(0, 1);
	#endregion
	#region Элементы
		menu_stage = 0;
		
		if global.tablet = 1
			{
			menu_heroes_x = 150;
			menu_heroes_y = global.size - 150 - 320;
			menu_heroes_s = 1;
			menu_heroes_n = "HEROES";
			
			menu_totems_x = 150;
			menu_totems_y = global.size - 150;
			menu_totems_s = 1;
			menu_totems_n = "TOTEMS";
			
			menu_quests_x = 1280 - 150;
			menu_quests_y = global.size - 150 - 320;
			menu_quests_s = 1;
			menu_quests_n = "QUESTS";
			
			menu_shop_x   = 1280 - 150;
			menu_shop_y   = global.size - 150;
			menu_shop_s   = 1;
			menu_shop_n   = "SHOP";
			}
			else
			{
			menu_heroes_x = 150;
			menu_heroes_y = global.size - 100 - 150;
			menu_heroes_s = 1;
			menu_heroes_n = "HEROES";
			
			menu_totems_x = 150;
			menu_totems_y = global.size - 100;
			menu_totems_s = 1;
			menu_totems_n = "TOTEMS";
			
			menu_quests_x = 1280 - 150;
			menu_quests_y = global.size - 100 - 150;
			menu_quests_s = 1;
			menu_quests_n = "QUESTS";
			
			menu_shop_x   = 1280 - 150;
			menu_shop_y   = global.size - 100;
			menu_shop_s   = 1;
			menu_shop_n   = "SHOP";
			}
	#endregion
	#region Игра
		if global.tablet = 1
			{
			play_b_x  = 640;
			play_b_y  = 170 + (global.size - 170) / 2 - 100;
			play_b_s  = 0.3;
			play_b_s1 = 1;
			play_b_t  = "PLAY";
		
			training_b_x  = 640;
			training_b_y  = 170 + (global.size - 170) / 2;
			training_b_s  = 0.3;
			training_b_s1 = 1;
			training_b_t  = "TRAINING";
		
			arena_b_x  = 640;
			arena_b_y  = 170 + (global.size - 170) / 2 + 100;
			arena_b_s  = 0.3;
			arena_b_s1 = 1;
			arena_b_t  = "ARENA";
		
			menu_b_p = 0;
			}
			else
			{
			play_b_x  = 640;
			play_b_y  = global.size - 300;
			play_b_s  = 0.25;
			play_b_s1 = 1;
			play_b_t  = "PLAY";
		
			training_b_x  = 640;
			training_b_y  = global.size - 200;
			training_b_s  = 0.25;
			training_b_s1 = 1;
			training_b_t  = "TRAINING";
		
			arena_b_x  = 640;
			arena_b_y  = global.size - 100;
			arena_b_s  = 0.25;
			arena_b_s1 = 1;
			arena_b_t  = "ARENA";
		
			menu_b_p = 1;
			}
	#endregion
#endregion
#region СТАРЫЙ ОБЪЕКТ
	menu_stage = "heroes1"; //"dificult";
	global.player_rank = 15; //irandom_range(1, 15);
	anim_skul = 0;

	lag = 0;

	s0 = 0;
	s1 = 0;
	s2 = 0;
	s3 = 0;

	sd1 = 1;
	sd2 = 1;
	sd3 = 1;

	///
	px1 = 0;
	py1 = 0;
	ps1 = 1;

	px2 = 0;
	py2 = 0;
	ps2 = 1;

	px3 = 0;
	py3 = 0;
	ps3 = 1;

	px4 = 0;
	py4 = 0;
	ps4 = 1;

	px5 = 0;
	py5 = 0;
	ps5 = 1;

	px6 = 0;
	py6 = 0;
	ps6 = 1;

	px7 = 0;
	py7 = 0;
	ps7 = 1;

	px8 = 0;
	py8 = 0;
	ps8 = 1;

	px9 = 0;
	py9 = 0;
	ps9 = 1;

	px10 = 0;
	py10 = 0;
	ps10 = 1;

	px11 = 0;
	py11 = 0;
	ps11 = 1;
	///

	show = 1;

	anim = 0;

	s_time  = irandom_range(3, 6) * room_speed;
	s_stage = 0;

	hold_start = 0;
	hold_true  = 0;
	hold_time  = 0;
	hold_go    = 0;

	global.hero       = 1;
	global.enemy_hero = irandom_range(1,7); //choose(irandom_range(1, 6), irandom_range(1, 6), irandom_range(1, 7));
	#region Переменные персонажей
		must_x    = 1280 / 2;
		hero_y    = global.size - 50;
		now_hero  = 1;
		now_rege  = 1;
		hero_size = 0.7;
	
		hero_g[1]  = 1;
		hero_g[7]  = 2;
		hero_g[6]  = 3;
		hero_g[10] = 4;
		hero_g[2]  = 5;
		hero_g[5]  = 6;
		hero_g[3]  = 7;
		hero_g[8]  = 8;
		hero_g[11] = 9;
		hero_g[9]  = 10;
		hero_g[4]  = 11;
	
		hero_x[1]  = 0;
		hero_x[7]  = 0;
		hero_x[6]  = 0;
		hero_x[10] = 0;
		hero_x[2]  = 0;
		hero_x[5]  = 0;
		hero_x[3]  = 0;
		hero_x[8]  = 0;
		hero_x[11] = 0;
		hero_x[9]  = 0;
		hero_x[4]  = 0;
	
		rege_x[1]  = 0;
		rege_x[2]  = 0;
		rege_x[3]  = 0;
		rege_x[4]  = 0;
	#endregion
	#region Переменные VS
		vs_hero = irandom_range(1, 11);
		vs_x1 = 640 - 500 + 5;
		vs_y1 = global.size + 1000;
		vs_x2 = 640 + 500 - 5;
		vs_y2 = global.size - 1000;
		vs_go = 0;
		sherif_x  = 0;
		sherif_x1 = 0;
	
		vs_vx = 640; // - 500;
		vs_vy = global.size / 2 + 1000;
		vs_sx = 640 + 100; // + 500;
		vs_sy = global.size / 2 - 1000;
	
		vs_ts    = 0.5;
		vs_time  = 0;
		vs_alpha = 1;
	#endregion
#endregion