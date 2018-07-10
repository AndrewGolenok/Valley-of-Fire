#region Фон
	draw_sprite(s_menu3, 0, 640, global.size / 2);
#endregion
if load_go=0
	{
	#region Анимация и Персонажи
		if go_anim = 1 or go_anim =- 1
			{
			if imgx > 0
				{ imgx -= anim_spd; }
				else
				{
				global.hero += go_anim;
				if global.hero < 1
					{ global.hero = 11; }
				if global.hero > 11
					{ global.hero = 1; }
				go_anim *= 2;
				
				//
				var hero_sprite, hero_code_name;
				hero_sprite = asset_get_index("s_" + global.hero_code_name[global.hero] + "_idle");
				hero_code_name = global.hero_code_name[global.hero];
	
				sprite_index = hero_sprite;
				image_speed  = 2;
				//
				}
			}
		if go_anim = 2 or go_anim =- 2
			{
			if imgx < 1
				{ imgx += anim_spd; }
				else
				{ go_anim = 0; }
			}
		sc = -1;
	
		var hero_sprite, hero_code_name;
		hero_sprite    = asset_get_index("s_" + global.hero_code_name[global.hero] + "_idle");
		hero_code_name = global.hero_code_name[global.hero];
	
		draw_set_alpha(0.5);
		draw_ellipse_color(x - sprite_get_width(hero_sprite) * scale / 2, y - 40, x + sprite_get_width(hero_sprite) * scale / 2 + 15, y + 15, c_black, c_black, 0);
		draw_set_alpha(1);
		draw_sprite_ext(sprite_index, image_index, x - 28 * (sprite_index == s_huntress_idle), y - 15 * (sprite_index==s_huntress_idle), sc * imgx * scale, scale, 0, c_white, 1);
	#endregion
	#region Описание и Характеристики
		var yp, xp, xh, hh;
		yp = y - 800 * scale;
		xp = x + 635 * scale;
	
		hh = 0;
		if imgx < 1
			{ hh = 0.3; }
	
		var imgx1;
		imgx1 = 1;
	
		draw_set_valign(fa_center);
	
		#region Имя, Класс и Описание
			draw_set_font(f_name_bold);
		
			draw_set_halign(fa_center);
			draw_set_color(c_white);
			draw_text_ext_transformed_t(xp + 120, yp, global.hero_name[global.hero], 30, sprite_get_width(hero_sprite) * 2, imgx, 1, 0, c_white, c_black); // Имя персонажа
	
			draw_set_font(f_description_small);
			draw_text_ext_transformed_t(xp + 120, yp + 50, "(" + global.hero_class[global.hero] + ")", 30, sprite_get_width(hero_sprite) * 2, imgx, 1, 0, c_white, c_black); // Класс персонажа
		
			draw_set_font(f_description_regular_big);
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_text_ext_transformed(xp + 120, yp + 120, global.hero_description[global.hero], 30, 500, imgx1, 1, 0); // Описание персонажа
			draw_set_color(c_white);
			draw_set_alpha(1);
		#endregion
		#region Здоровье
			draw_set_halign(fa_right);
			draw_set_font(f_description_bold);
			draw_text_ext_transformed_t(xp - 130 + string_width(global.description_hp), yp + 170 + 40, global.description_hp, 30, 300, imgx1, 1, 0, c_white, c_black);
		
			draw_set_color(c_red);
			draw_set_alpha(0.5);
			draw_set_halign(fa_left);
			draw_set_font(f_description_regular);
			draw_text_ext_transformed(xp - 130 + string_width(global.description_hp) + 10,yp + 170 + 40, string(round(global.hp[global.hero])), 30, 300, imgx, 1, 0); // Здоровье персонажа
			draw_set_color(c_white);
			draw_set_alpha(1);
		
			var g;
			g = global.hp[global.hero] / 100;
	
			for(i = 1; i <= 6; i++)
				{
				draw_sprite_ext(s_icon, 2, (i - 1) * 46 + xp - 130 + string_width(global.description_at) + 10 + 18 + 32 * 4, yp + 170 + 40, imgx1, 1, 0, c_black, 0.5);
				}
			for(i = 1; i <= floor(g / 2); i++)
				{
				draw_sprite_ext(s_icon, 2, (i - 1) * 46 + xp - 130 + string_width(global.description_at) + 10 + 18 + 32 * 4, yp + 170 + 40, imgx, 1 + hh, 0, c_white, 1);
				}
			if ceil(g / 2) > floor(g / 2)
				{ draw_sprite_ext(s_icon, 0, (ceil(g / 2) - 1) * 46 + xp - 130 + string_width(global.description_at) + 10 +18 + 32 * 4, yp + 170 + 40, imgx, 1 + hh, 0, c_white, 1); }
		#endregion
		#region Атака
			draw_set_halign(fa_right);
			draw_set_font(f_description_bold);
			draw_text_ext_transformed_t(xp - 130 + string_width(global.description_hp), yp + 210 + 40, global.description_at, 30, 300, imgx1, 1, 0, c_white, c_black);
		
			draw_set_color(c_red);
			draw_set_alpha(0.5);
			draw_set_halign(fa_left);
			draw_set_font(f_description_regular);
			draw_text_ext_transformed(xp - 130 + string_width(global.description_hp) + 10, yp + 210 + 40, string(round(global.atk[global.hero])), 30, 300, imgx, 1, 0);
			draw_set_color(c_white);
			draw_set_alpha(1);
		
			draw_sprite_ext(s_icon_2, 0, xp - 140 + string_width(global.description_at) + 18 + 32 * 4, yp + 210 + 40 + 18, 1, 1, 0, c_black, 0.5);
			draw_sprite_part_ext(s_icon_2, 0, 0, 0, 266 * global.atk[global.hero] / 150, 36, xp - 140 + string_width(global.description_at) + 18 + 32 * 4,yp + 210 - 18 + 40, imgx1, imgx, c_white, 1); // Атака персонажа
		#endregion
	
		#region Активная способность
			draw_set_halign(fa_right);
			draw_set_font(f_description_bold);
			draw_text_ext_transformed_t(xp - 130 + string_width(global.description_ab), yp + 310, global.description_ab, 30, 300, imgx1, 1, 0, c_white, c_black);
		
			draw_set_font(f_description_small);
			draw_text_ext_transformed_t(xp - 130 + string_width(global.description_ab), yp + 340, "(" + global.description_aa + ")", 30, 300, imgx1, 1, 0, c_white, c_black);
		
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_set_halign(fa_left);
			draw_set_font(f_description_regular);
			draw_text_ext_transformed(xp - 130 + string_width(global.description_ab) + 10, yp + 310, global.ability_a1[global.hero], 30, 300, imgx, 1, 0); // Активная способность персонажа
			draw_set_color(c_white);
			draw_set_alpha(1);
		
			draw_sprite_ext(s_icon_question, 0, xp - 130 + string_width(global.description_ab) + 10 + 18 + 10 + string_width(global.ability_a1[global.hero]), yp + 310, imgx, 1, 0, c_white, 1);
		#endregion
		#region Пассивная способность
			draw_set_halign(fa_right);
			draw_set_font(f_description_bold);
			draw_text_ext_transformed_t(xp - 130 + string_width(global.description_ab), yp + 370, global.description_ab, 30, 300, imgx1, 1, 0, c_white, c_black);
		
			draw_set_font(f_description_small);
			draw_text_ext_transformed_t(xp - 130 + string_width(global.description_ab), yp + 400, "(" + global.description_pa + ")", 30, 300, imgx1, 1, 0, c_white, c_black);
		
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_set_halign(fa_left);
			draw_set_font(f_description_regular);
			draw_text_ext_transformed(xp - 130 + string_width(global.description_ab) + 10, yp + 370, global.ability_p1[global.hero], 30, 300, imgx, 1, 0); // Пассивная способность персонажа
			draw_set_color(c_white);
			draw_set_alpha(1);
		
			draw_sprite_ext(s_icon_question, 0, xp - 130 + string_width(global.description_ab) + 10 + 18 + 10 + string_width(global.ability_p1[global.hero]), yp + 370, imgx, 1, 0, c_white, 1);
		#endregion
	
		#region История
			draw_set_halign(fa_right);
			draw_set_font(f_description_bold);
			draw_text_ext_transformed_t(xp - 130 + string_width(global.description_hs), yp + 460, global.description_hs, 30, 300, imgx1, 1, 0, c_white, c_black);
			draw_sprite_ext(s_icon_play, 0, xp - 130 + string_width(global.description_hs) + 10 + 18 , yp + 460, imgx, 1, 0, c_white, 1);
		
			draw_text_ext_transformed_t(xp - 130 + string_width(global.description_hs) + 10 + 36 + 40 + string_width(global.description_th), yp + 460, global.description_th, 30, 300, imgx1, 1, 0, c_white, c_black);
		
			draw_set_halign(fa_left);
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_set_font(f_description_regular);
			draw_text_ext_transformed(xp - 130 + string_width(global.description_hs) + 10 + 36 + 40 + string_width(global.description_th) + 10, yp + 460, global.hero_theme[global.hero], 30, 300, imgx, 1, 0);
			//draw_roundrect_ext(xp-130+string_width(global.description_hs)+10+36+40+string_width(global.description_th)+20-10-string_width(global.hero_theme[global.hero])/2,yp+460-10-string_height(global.hero_theme[global.hero])/2,xp-130+string_width(global.description_hs)+10+36+40+string_width(global.description_th)+20+string_width(global.hero_theme[global.hero])/2,yp+460+10+string_height(global.hero_theme[global.hero])/2,20,20,1);
			draw_set_alpha(1);
		#endregion
	#endregion
	#region Уровень и Победы
		draw_set_font(f_level_bold);
	
		draw_set_halign(fa_center);
		draw_set_color(c_white);
		draw_text_ext_transformed_t(xp + 540, yp, string(global.hero_level[global.hero]), 30,sprite_get_width(hero_sprite) * 2, imgx, 1, 0, c_white, c_black); // Имя персонажа
	
		var re;
		re=string_width(string(global.hero_level[global.hero]));
		draw_set_font(f_description_regular);
		draw_text_ext_transformed_t(xp + 540 + 5 + re, yp + 30, global.property_level, 30, sprite_get_width(hero_sprite) * 2, imgx1, 1, 0, c_white, c_black); // Имя персонажа
	
		draw_set_color(c_black);
		draw_set_alpha(0.5);
		draw_rectangle(xp + 435 , yp + 65 , xp + 655 , yp + 75, 0);
		draw_set_alpha(1);
		draw_set_color(c_white);
		draw_rectangle(xp + 435, yp + 65, xp + 435 + 220 * ((global.hero_exp[global.hero]) / (global.hero_level[global.hero] * 100)) * imgx, yp + 75, 0);
	
		draw_set_font(f_description_regular);
		draw_text_ext_transformed_t(xp + 550, yp + 100, "(" + string(global.hero_exp[global.hero]) + "/" + string(global.hero_level[global.hero] * 100) + ")", 30, 500, imgx, 1, 0, c_white, c_black); // Описание персонажа
	
		//
		draw_set_halign(fa_right);
		draw_set_font(f_description_bold);
		draw_text_ext_transformed_t(xp + 450 + string_width(global.property_wins), yp + 140, global.property_wins, 30, 500, imgx1, 1, 0, c_white, c_black); // Описание персонажа
	
		draw_set_halign(fa_left);
		draw_set_font(f_description_regular);
		draw_set_color(c_black);
		draw_set_alpha(0.5);
		draw_text_ext_transformed(xp + 450 + string_width(global.property_wins) + 10, yp + 140, global.hero_wins[global.hero], 30, 500, imgx, 1, 0); // Описание персонажа
		draw_set_alpha(1);
		draw_set_color(c_white);
	
		//
		draw_set_halign(fa_right);
		draw_set_font(f_description_bold);
		draw_text_ext_transformed_t(xp + 450 + string_width(global.property_wins), yp + 180, global.property_grade, 30, 500, imgx1, 1, 0, c_white, c_black); // Описание персонажа
	
		var grade, g;
		g = round(global.hero_grade[global.hero]);
		grade = global.grade_rank[g];
	
		draw_set_halign(fa_left);
		draw_set_font(f_description_regular);
		draw_set_color(c_black);
		draw_set_alpha(0.5);
		draw_text_ext_transformed(xp + 450 + string_width(global.property_wins) + 10, yp + 180, string(grade), 30, 500, imgx, 1, 0); // Описание персонажа
	
		draw_set_alpha(0.35);
		draw_circle_color(xp + 540, yp + 260 - 15, 45, c_black, c_black, 0);
	
		draw_set_alpha(1);
		draw_set_color(c_white);
	
		draw_sprite_ext(s_icon_grade, 0, xp + 540, yp + 260 - 15, imgx1, 1, 0, c_white, 1);
		draw_sprite_ext(s_icon_grade, round(global.hero_grade[global.hero]), xp + 540, yp + 260 - 15, imgx, 1 + hh, 0, c_white, 1);
	#endregion
	#region Кнопки
		draw_sprite_ext(s_icon_buttons, 0, xp + 540, yp + 300 + 50, imgx1, 1, 0, c_white, 1);
		draw_sprite_ext(s_icon_buttons, 1, xp + 540, yp + 300 + 150, imgx1, 1, 0, c_white, 1);
	#endregion
	#region Ограничители
		for(i = 50; i <= global.size - 50; i++)
			{
			draw_sprite(s_border, 0, xp - 150, i);
			draw_sprite(s_border, 0, xp + 400, i);
			}
	#endregion
	}
	else
	{
	#region Поиск персонажа (Загрузка)
		if load_go = 1
			{
			#region Появление
			if load_alpha < 0.8
				{ load_alpha += 0.1; }
			if load_scale < 1
				{ load_scale += 0.1; }
			if load_alpha = 0.8 && load_scale = 1
				{ load_go = 2; }
			#endregion
			alarm[0] = 2;
			}
		if load_go = 2
			{
			load_second += 1;
			#region Троеточие
				if load_second = room_speed / 3 or load_second = room_speed * 2 / 3 or load_second = room_speed
					{
					if load_point = "..."
						{ load_point = ""; }
						else
						{ load_point += "."; }
					}
			#endregion
			#region Выстрел пули
				if load_second = room_speed * 0.8 && load_time > 0
					{
					load_time -= 1;
					load_bullet += 1;
					if load_bullet = 8
						{ load_bullet = 1; }
						else
						{ load_angle1 -= 60; }
					load_second = 0;
					}
			
				if load_angle > load_angle1
					{ load_angle -= 5; }
					else
					{ load_angle = load_angle1; }
			#endregion
			#region Вышло время
			if load_time = 0 && load_enemy_name = global.enemy_name && alarm[1] < 0
				{ alarm[1] = room_speed; load_time = -1; }
			#endregion		
			}
		if load_go > 0
			{
			#region Анимации противника
				//if load_time <= 1
				//	{
				//	go_anim = 0;
				//	load_enemy_name   = global.enemy_name;
				//	load_enemy_sprite = asset_get_index("s_" + global.hero_code_name[global.enemy_hero] + "_idle_" + global.enemy_weapon);
				//	}
				if go_anim = 1
					{
					if load_enemy_scale > 0
						{ load_enemy_scale -= anim_spd; }
						else
						{
						go_anim = 2;
						if load_time <= 1
							{
							load_enemy_name   = global.enemy_name;
							load_enemy_sprite = asset_get_index("s_" + global.hero_code_name[global.enemy_hero] + "_idle_" + global.enemy_weapon);
							//show_message(string(sprite_get_name(load_enemy_sprite)));
							}
							else
							{
							load_enemy_name   = generate_name();
							load_enemy_sprite = asset_get_index("s_" + global.hero_code_name[irandom_range(1, 11)] + "_idle_" + global.weapon);
							}
						}
					}
				if go_anim = 2
					{
					if load_enemy_scale < 1
						{ load_enemy_scale += anim_spd; }
						else
						{ go_anim = 0; }
					}
				if go_anim = 0 && load_time = 0 && load_enemy_name != global.enemy_name
					{ go_anim = 1; }
			#endregion
			#region Рисование загрузки
				draw_set_alpha(load_alpha);
				draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
				draw_set_alpha(1);
				
				draw_sprite_ext_t(s_load, 0, 640, global.size / 2, load_scale, load_scale, load_angle, c_white, 1, c_white, c_black);
				draw_sprite_ext(s_load, load_bullet, 640, global.size / 2, load_scale, load_scale, load_angle, c_white, 1);
			#endregion
			#region Текст загрузки
				draw_set_font(f_description_regular);
				draw_set_halign(fa_center);
				draw_set_valign(fa_center);
				draw_set_color(c_white);
		
				draw_text_transformed_t(640, global.size / 2 + sprite_get_height(s_load) * 0.9 / 2 + string_height(load_text), load_text + load_point, 1, 1, 0, c_white, c_black);
			#endregion
			#region Рисование игрока и противника
				image_speed = 1.4;
				load_image_index += image_speed;
				var sprite;
				sprite = asset_get_index("s_" + global.hero_code_name[global.hero] + "_idle_" + global.weapon);
				sprite_index = sprite;
				draw_sprite_ext(sprite_index, load_image_index, x - 28 * (sprite_index == s_huntress_idle), y - 15 * (sprite_index == s_huntress_idle), sc * scale, scale, 0, c_white, 1);
				
				//load_enemy_sprite = s_huntress_idle;
				sprite_index = load_enemy_sprite;
				
				draw_sprite_ext(load_enemy_sprite, load_image_index, 1280 - x + 28 * (load_enemy_sprite == s_huntress_idle), y - 15 * (load_enemy_sprite == s_huntress_idle), load_enemy_scale * scale, scale, 0, c_white, 1);
				
				//if sprite_index = s_sherif_idle or sprite_index = s_huntress_idle
				//	{ draw_skeleton(sprite_index, "idle", global.hero_code_name[global.hero], image_index, x, y, sc * scale, scale, 0, c_white, 1); }
				//	else
				//	{ draw_sprite_ext(sprite_index, image_index, x, y, sc * scale, scale, 0, c_white, 1); }
					
				//if load_enemy_sprite = s_sherif_idle or sprite_index = s_huntress_idle
				//	{ draw_skeleton(load_enemy_sprite, "idle", global.hero_code_name[global.enemy_hero], image_index, 1280 - x, y, load_enemy_scale * scale, scale, 0, c_white, 1); }
				//	else
				//	{ draw_sprite_ext(load_enemy_sprite, image_index, 1280 - x, y, load_enemy_scale * scale, scale, 0, c_white, 1); }
			
			//draw_text(1280 - x, y - 200, sprite_get_name(sprite_index));
			//draw_text(1280 - x, y - 200, sprite_get_name(load_enemy_sprite));
			#endregion
			#region Листовка Wanted
				#region Координаты текста
					draw_set_font(f_wanted_bold);
					
					var str_wanted_height, str_wanted_width, wanted_x, wanted_y, name_y;
					str_wanted_height = string_height("WANTED");
					str_wanted_width = string_width("WANTED");
					wanted_x = x;//str_wanted_width / 1.8;
					wanted_y = y - sprite_height * scale * 1.2;
			
					name_y = y + str_wanted_height / 2;
			
					if name_y > global.size - str_wanted_height / 1.8
						{ name_y = global.size - str_wanted_height / 1.8; }
			
					if wanted_x < str_wanted_width / 1.8
						{ wanted_x = str_wanted_width / 1.8; }
					if wanted_y < str_wanted_height * 0.6
						{ wanted_y = str_wanted_height * 0.6; }
				#endregion
				#region Листовка игрока
					draw_text_transformed_t(wanted_x, wanted_y, "WANTED", 1, 1, 0, c_white, c_black);
					
					draw_set_font(f_wanted_regular);
					draw_text_transformed_t(wanted_x, wanted_y + str_wanted_height / 2, "dead or alive", 1, 1, 0, c_white, c_black);
					
					name_set_font(global.player_name, 400);
					draw_text_transformed_t(wanted_x, name_y, global.player_name, 1, 1, 0, c_white, c_black);
				#endregion
				#region Листовка противника
					draw_text_transformed_t(1280 - wanted_x, wanted_y, "WANTED", 1, 1, 0, c_white, c_black);
					
					draw_set_font(f_wanted_regular);
					draw_text_transformed_t(1280 - wanted_x, wanted_y + str_wanted_height / 2, "dead or alive", 1, 1, 0, c_white, c_black);
					
					name_set_font(load_enemy_name, 400);
					draw_text_transformed_t(1280 - wanted_x, name_y, load_enemy_name, load_enemy_scale, 1, 0, c_white, c_black);
				#endregion
			#endregion
			}
	#endregion
	}

//if a < string_length(text)
//	{
//	a += 0.25;
//	if a = round(a) && string_char_at(text, a) != " "
//		{ audio_play_sound(sd_text, 0, 0); }
//	}
//draw_text(mouse_x, mouse_y, string_copy(text, 0, ceil(a)));