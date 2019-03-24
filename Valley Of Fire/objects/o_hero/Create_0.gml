#region Переменные для Врага или Игрока
	enemy = global.enemy;
	if enemy
	{
		global.enemy_object  = id;
	}
	else
	{
		global.player_object = id;
	}
	weapon = global.hero_code_weapon[global.hero];
	enemy_weapon = global.hero_code_weapon[global.enemy_hero];
	if !enemy
	{
		hero   = global.hero;
		x  = -sprite_width / 2;
		xn = 150;
		ox = global.width + sprite_width / 2;
	}
	else
	{
		hero   = global.enemy_hero;
		x  = global.width + sprite_width / 2;
		xn = global.width - 150;
		ox = -sprite_width / 2;
	}
#endregion
#region Способности
	global.bill_propil = 0;
	have_posion   = 0;
	change        = 0;
	super         = 0;
	super_img     = 0;
	ability_index = 0;
	ability_alpha = 1;
	ability_back  = s_ability_back;
	knife_i       = 0;
	abil_n        = 0;
#endregion
#region Оружие
	bullet_index = 0;
	weapon_spd   = 70;
	hero_shoot   = 20;
	bullet_alpha = 1;
	sx = x;
	sy = y; // Координаты снаряда
#endregion
#region Спрайт персонажа
	hero_sprite    = asset_get_index("s_" + global.hero_code_name[hero]);
	hero_code_name = global.hero_code_name[hero];
	hero_bullet    = asset_get_index("s_bullet_" + weapon);
	hero_bullet_w  = asset_get_index("s_bullet_" + weapon + "_w");
	sprite_index   = hero_sprite;
	image_speed    = 0;
	sc = enemy - !enemy;
	skeleton_animation_set("greetings");
#endregion
#region Размер и положение персонажа
	scale = 0.33 + global.more_size / 2700;
	if scale < 0.33
	{
		scale = 0.33;
	}
	if scale > 0.4
	{
		scale = 0.4;
	}
	y = global.height - 460 + o_control.back_y;
#endregion	
#region Геймплей
	answer = -1;
	shoot  = 0;
#endregion
#region Анимация
	switch(hero)
	{
		case 1:
			hero_shoot = 9;
			hero_abindex = 23;
		break;
		case 2: hero_abindex = 23; break;
		case 5: hero_abindex = 23; break;
		case 7: hero_abindex = 23; break;
		case 6: hero_abindex = 26; break;
		case 4: hero_abindex = 26; break;
		case 3: hero_abindex = 35; break;
	}
#endregion
#region Цвет игрока
	hero_color = global.color_hero[hero];
#endregion
#region Переменные воздействия на персонажа
	poisoned		= 0;
	huntress_poison = 0;
	diego_dynamit   = 0;
	dynamit_x		= 0;
	dynamit_y		= 0;
	dynamit_a		= 0;
	dynamit_i		= 0;
	dynamit_d		= 0;
	diego_boom		= -1;
	bill_stage		= 0;
	bill_boom		= -1;
	fire_time		= 0;
	stun_seconds	= 1;
	stun			= 0;
#endregion
#region Сдвиг персонажа по фону
	if global.background = "mine"
	{
		y += 230;
		scale = 0.45;
	}
	if global.background = "waterfall"
	{
		y += 100;
	}
	if global.background = "saloon"
	{
		xn += 70 * !enemy - 70 * enemy;
		y  += 130;
	}
	if global.background = "house"
	{
		y += 230;
	}
	sc_dist  = 0;
	sc_dir   = 1;
	sc_spd   = 0.5;
	sc_angle = 0;
#endregion
#region Установка мишени при обучении
	if global.training > 0
	{
		if enemy
		{
			hero_sprite  = s_training_scarecrow;
			sprite_index = hero_sprite;
			image_index  = 0;
			image_speed  = 0;
			x       = xn;
			change  = 2;
			sc_dist = 10;
		}
	}
	hand_away  = 0; // Обучение
#endregion