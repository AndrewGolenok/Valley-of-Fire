if stage = -2
	{
	black = 1;
	if art_a < 1
		{ art_a += 0.05; }
		else
		{
		if art_t > 0
			{ art_t -= 1; }
			else
			{ stage = -1; }
		}
	}
if stage = -1
	{
	black = 0;
	if art_a > 0
		{ art_a -= 0.1; }
		else
		{ stage = 0; }
	}
if stage = 0
	{
	if all_y > 0
		{
		if all_y - 40 > 0
			{ all_y -= 40; }
			else
			{ all_y = 0; stage = 1; }
		}
	}
if stage = 1
	{
	if sun_y > 0
		{ sun_y -= 10; }
		else
		{ sun_y = 0; }
	if sun_scale < 1
		{ sun_scale += 0.025; }
		else
		{ sun_scale = 1; }
	if sun_angle < 90
		{ sun_angle += 4.5; }
	
	dark_2 = sun_y / 200;
	dark_1 = 0.4 * sun_y / 200;
	
	if sun_y = 0 && sun_scale = 1
		{ stage = 2; }
	}
if stage = 2
	{
	if heroes2_x > 0
		{ heroes2_x -= 40; }
	if chief_x > 0
		{ chief_x -= 10 + 30 * (chief_x / 550); }
		else
		{ stage = 3; }
	}
if stage = 3
	{
	if heroes1_x > 0
		{ heroes1_x -= 40; }
	if sherif_x > 0
		{ sherif_x -= 10 + 30 * (sherif_x / 550); }
		else
		{ stage = 4; }
	smart_y       = 0;
	smart_angle   = 0;
	smart_scale   = 0.1;

	cowboys_y     = 0;
	cowboys_angle = 0;
	cowboys_scale = 0.1;
	}
	
draw_sprite_ext(s_logo1_back, 0, 640, global.size, back_scale, back_scale, 0, c_white, 1);
draw_sprite_ext(s_train_back1, 0, 640, global.size, 0.512, 0.512, 0, c_white, dark_2);

if stage > 0
	{ draw_sprite_ext(s_sunmoon, 0, 640, global.size - 610 * back_scale + all_y + sun_y, sun_scale, sun_scale, sun_angle, c_white, 1); }


if stage >= 2
	{
	if (sherif_y < 5 && sherif_dir = 1) or (sherif_y > -5 && sherif_dir = -1)
		{ sherif_y += 0.2 * sherif_dir * random_range(0.5, 2); }
		else
		{ sherif_dir = -sherif_dir; sherif_y += 0.25 * sherif_dir;  }
	if (chief_y < 5 && chief_dir = 1) or (chief_y > -5 && chief_dir = -1)
		{ chief_y += 0.2 * chief_dir * random_range(0.5, 2); }
		else
		{ chief_dir = -chief_dir; chief_y += 0.25 * chief_dir;  }
	
	//if (heroes1_x < 5 && heroes1_dir = 1) or (heroes1_x > -5 && heroes1_dir = -1)
	//	{ heroes1_x += 0.1 * heroes1_dir * random_range(0.5, 2); }
	//	else
	//	{ heroes1_dir = -heroes1_dir; heroes1_x += 0.25 * heroes1_dir;  }
	//if (heroes2_x < 5 && heroes2_dir = 1) or (heroes2_x > -5 && heroes2_dir = -1)
	//	{ heroes2_x += 0.1 * heroes2_dir* random_range(0.5, 2); }
	//	else
	//	{ heroes2_dir = -heroes2_dir; heroes2_x += 0.25 * heroes2_dir;  }
	}
	

if stage = 4
	{
	if cowboys_y > - 1040
		{
		cowboys_scale += 0.014;
		cowboys_y -= 52;
		if cowboys_y < -300
			{
			if cowboys_y < -500
				{ cowboys_y += 20; }
				else
				{ cowboys_y += 10; }
			}
		
		cowboys_angle += 30;
		}
	if cowboys_y < - 100
		{
		if smart_y > - 1040
			{
			smart_scale += 0.014;
			smart_y -= 50;
			if smart_y < -300
				{
				if smart_y < -500
					{ smart_y += 20; }
					else
					{ smart_y += 10; }
				}
			smart_angle += 30;
			}
			else
			{
			smart_angle   = 0;
			cowboys_angle = -270;
			
			cowboys_scale = 1;
			smart_scale = 1;
			//audio_play_sound(sound5, 1, 0);
			stage = 5;
			}
		}
	draw_sprite_ext(s_logo1_smartcowboys, 0, 640, global.size - 610 * back_scale + all_y + 50 + smart_y,   back_scale * smart_scale,   back_scale * smart_scale,   smart_angle,   c_white, 1);
	draw_sprite_ext(s_logo1_smartcowboys, 1, 640, global.size - 610 * back_scale + all_y + 50 + cowboys_y, back_scale * cowboys_scale, back_scale * cowboys_scale, cowboys_angle, c_white, 1);
	}

draw_sprite_ext(s_logo1_sand, 0, 640, global.size + all_y, back_scale, back_scale, 0, c_white, 1);

draw_sprite_ext(s_logo1_sherif_chief, 0, 640 - sherif_x * 2 - 30, global.size - 610 * back_scale + sherif_y + iphonex_y, back_scale * iphonex_s, back_scale * iphonex_s, 0, c_white, 1);
draw_sprite_ext(s_logo1_sherif_chief, 1, 640 + chief_x * 2, global.size - 610 * back_scale + chief_y + iphonex_y, back_scale * iphonex_s, back_scale * iphonex_s, 0, c_white, 1);

draw_sprite_ext(s_logo1_rock, 0, 640, global.size - 610 * back_scale + all_y, back_scale1, back_scale1, 0, c_white, 1);

draw_sprite_ext(s_logo1_things, 0, 640 - 10, global.size - 610 * back_scale1 + all_y, back_scale1, back_scale1, 0, c_black, 0.5);
draw_sprite_ext(s_logo1_river , 0, 640 - 50, global.size + all_y, back_scale, back_scale, 0, c_white, 1);
draw_sprite_ext(s_logo1_things, 1, 640 - 10, global.size - 610 * back_scale1 + all_y, back_scale1, back_scale1, 0, c_white, 1);

if stage = 5
	{
	if cowboys_y < 610 * back_scale - all_y - 150
		{
		if cowboys_angle < 0
			{ cowboys_angle += 15; }
		cowboys_y += 65;
		}
		else
		{
		cowboys_y = 610 * back_scale - all_y - 150 ;
		if view_yport < 20
			{ view_yport += 10; }
			else
			{ stage = 6; }
		}
	}
if stage = 6
	{
	if view_yport > 0
		{ view_yport -= 10; }
		else
		{ stage = 7; }
	}
if stage = 7
	{
	if smart_y < - 700
		{ smart_y += 40; }
		else
		{ stage = 8; }
	}
if stage = 8
	{
	if smart_y < 610 * back_scale - all_y - 150 - 270 * back_scale
		{ smart_y += 80; }
		else
		{ stage = 9; smart_y = 610 * back_scale - all_y - 150 - 270 * back_scale; }
	}
if stage = 9
	{
	if view_xport > - 40
		{ view_xport -= 20; view_yport += 10; }
		else
		{ stage = 10; }
	}
if stage = 10
	{
	if view_yport < 40
		{ view_yport += 20; view_xport += 10; }
		else
		{ stage = 11; }
	}
if stage = 11
	{
	if view_xport < 40
		{ view_xport += 20; view_yport -= 10; }
		else
		{ stage = 12; }
	}
if stage = 12
	{
	if view_yport > -40
		{ view_yport -= 20; view_xport -= 10; }
		else
		{ stage = 13; }
	}
if stage = 13
	{
	if view_yport > 0
		{ view_yport -= 10; }
	if view_yport < 0
		{ view_yport += 10; }
		
	if view_xport > 0
		{ view_xport -= 10; }
	if view_xport < 0
		{ view_xport += 10; }
		
	if view_xport = 0 && view_yport = 0
		{ stage = 14; }
	}
if stage = 14
	{
	if word_y > - 100
		{ word_y -= 15; }
		else
		{
		stage = 15;
		load_alpha = 0.5;
		//if load_alpha < 0.5
		//	{ load_alpha += 0.025; }
		//	else
		//	{ stage = 15; }
		}
	}
if stage = 15
	{
	if of_scale > 1
		{ of_scale -= 0.75; }
		else
		{ stage = 16; of_scale = 1; }
	
	of_y = cowboys_y - 270 * back_scale / 2;

	fire_alpha = 0;
	fire_angle = 0;
	}
if stage = 16
	{
	if fire_dist < 17
		{ fire_dist += 5; }
		else
		{ stage = 17; }
	}
if stage = 17
	{
	if (fire_angle < 2 && fire_dir = 1) or (fire_angle > -2 && fire_dir = -1)
		{ fire_angle += 2 * fire_dir; }
		else
		{ fire_dir = - fire_dir; }
	if (fire_angle1 < 3 && fire_dir1 = 1) or (fire_angle1 > -3 && fire_dir1 = -1)
		{ fire_angle1 += 0.5 * fire_dir1; }
		else
		{ fire_dir1 = - fire_dir1; }
	if fire_alpha < 0.75
		{ fire_alpha += 0.015; }
		else
		{ stage = 18; }
	}
if stage = 18
	{
	fire_angle = 0;
	fire_angle1 = 0;
	//load_go += 2.5//choose(0, 0, random(3), random(10), 0, 0, 0);
	////if fire_alpha > 0.65
	////	{ fire_alpha -= 0.02; }
	//if load_go >= 100
	//	{ room_goto_t("menu"); stage = 19; }
	}

if stage >= 5
	{
	draw_sprite_ext(s_logo1_smartcowboys, 0, 640, global.size - fire_dist - 610 * back_scale + all_y + 50 + smart_y + word_y,   back_scale * smart_scale,   back_scale * smart_scale,   smart_angle + fire_angle1,   c_white, 1);
	draw_sprite_ext(s_logo1_smartcowboys, 1, 640, global.size + fire_dist - 610 * back_scale + all_y + 50 + cowboys_y + word_y, back_scale * cowboys_scale, back_scale * cowboys_scale, cowboys_angle + fire_angle, c_white, 1);
	draw_sprite_ext(s_logo1_smartcowboys, 1, 640, global.size + fire_dist - 610 * back_scale + all_y + 50 + cowboys_y + word_y, back_scale * cowboys_scale, back_scale * cowboys_scale, cowboys_angle + fire_angle, c_red, fire_alpha);
	}
	
if stage >= 15
	{
	draw_sprite_ext(s_logo1_smartcowboys, 2, 640, global.size - 610 * back_scale + all_y + 50 + of_y + word_y, back_scale * of_scale, back_scale * of_scale, 10 + fire_angle1, c_white, 1);
	draw_sprite_ext(s_logo1_smartcowboys, 2, 640, global.size - 610 * back_scale + all_y + 50 + of_y + word_y, back_scale * of_scale, back_scale * of_scale, 10 + fire_angle1, c_red, 0.75);
	}

draw_sprite_ext(s_logo1_stuff , 0, 640, global.size + all_y, back_scale, back_scale, 0, c_white, 1);
draw_sprite_ext(s_logo1_heroes, 0, 640 - heroes1_x, global.size + 30 + all_y, back_scale, back_scale, 0, c_white, 1);
draw_sprite_ext(s_logo1_heroes, 1, 640 + heroes2_x, global.size + 30 + all_y, back_scale, back_scale, 0, c_white, 1);

draw_sprite_ext(s_train_back1, 0, 640, global.size, 0.512, 0.512, 0, c_white, dark_1);

if stage >= 14
	{
	load_go += 1.5; //choose(0, 0, random(3), random(10), 0, 0, 0);
	//if fire_alpha > 0.65
	//	{ fire_alpha -= 0.02; }
	if load_go >= 100
		{ room_goto_t("menu"); stage = 19; }
	
	draw_set_alpha(load_alpha);
	draw_set_color(c_black);
	draw_rectangle(0, global.size, 1280, global.size - 15, 0);

	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_rectangle(4, global.size, 1280 * load_go / 100 - 3, global.size - 12, 0);
	}

draw_set_alpha(black);
	draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
draw_set_alpha(1);

draw_sprite_ext(s_logo_artefact, 0, 640, global.size / 2, 1, 1, 0, c_white, art_a);
#region Прочее
/*
#region Фон
	var yy, yyy;
	
	yy  = 80 + sprite_get_height(hero_left[1]) * scale / 2 + sprite_get_height(hero_left[1]) * scale / 3.5 + global.more_size / 1.5 - 86 * 3;
	yyy = global.size - sprite_get_height(s_menu1) / 2;
	
	draw_sprite(s_menu2, 0, 640, yy); // Синий фон
	draw_sprite_ext(back, 0, 640, yy + 85, 1, 1, 0, c_white, alp); // Красный фон
	
	draw_set_alpha((1 - alp) * 0.2);
	draw_set_font(f_logo_bold_com);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(640, yy + 101, "ART&FACT");
	draw_set_alpha(1);
	
	if go > 0
		{
		if text_scale < 1
			{ text_scale += 0.02 * go; }
		if alp < 0.3
			{ alp += 0.02; }
		if alp >= 0.3 && alp < 0.5
			{ alp += 0.01; }
		if alp >= 0.5 && alp < 1
			{ alp += 0.02; }
		draw_circle_color(640, yy + 85 + 350 - 300 * alp, 300, c_yellow, c_yellow, 0); // Солнце
		
		draw_set_alpha(alp * 0.2);
		draw_set_font(f_logo_bold_com);
		draw_set_valign(fa_bottom);
		draw_set_halign(fa_center);
		draw_set_color(c_red);
		draw_text(640, yy + 101, "ART&FACT");
		draw_set_alpha(1);
		if go = 1
			{
			text_scale2 = 0;
			if text_y >- 150
				{ text_y -= 15; }
				else
				{ go = 2; }
			draw_set_font(f_logo_bold1);
			draw_set_color(c_white);
			draw_set_valign(fa_center);
			draw_set_halign(fa_center);
			draw_text_transformed_t(640, yy + 85 + text_y, text2, text_scale, text_scale, 0, c_white, c_black);
			}
		if go > 1
			{
			if text_scale2 < 1
				{ text_scale2 += 0.025 * (go - 1); }
			if go = 2
				{
				draw_set_font(f_logo_bold1);
				draw_set_color(c_white);
				draw_set_valign(fa_center);
				draw_set_halign(fa_center);
				draw_text_transformed_t(640, yy + 85 + text_y2, text1, text_scale2, text_scale2, 0, c_white, c_black);
				if text_y2 >- 150
					{ text_y2 -= 15; }
					else
					{ go = 3; }
				}
			}
		}
	draw_sprite(s_menu01, 0, 640, yy); // Песок
	draw_set_alpha((1 - alp) / 4);
	draw_rectangle_color(0, yy + 86, 1280, global.size, c_blue, c_blue, c_blue, c_blue, 0); // Затемнение песка
	draw_set_alpha(1);
#endregion
#region Персонажи
	for(i = 1; i <= 3; i++)
		{
		if xn[i] > 0
			{ xn[i] -= 40; }
			else
			{ xn[i] = 0; }
		
		if xn[3] = 0 && go = 0
			{ go = 1; }
		scale = (2 + i) / 10;
		
		var xx1, yy1, xx2, yy2;
		xx1 = 80 + sprite_get_width(hero_left[2]) * scale * 4 - i * 300 - xn[i];
		yy1 = 80 + sprite_get_height(hero_left[1]) * scale / 2 + sprite_get_height(hero_left[i]) * scale * i / 3.5 + global.more_size / 1.5;
		
		xx2   = 1280 - 80 - sprite_get_width(hero_left[2]) * scale * 4 + i * 300 + xn[i];
		yy2   = 80 + sprite_get_height(hero_left[1]) * scale / 2 + sprite_get_height(hero_left[i]) * scale * i / 3.5 + global.more_size / 1.5;
		dif   = sprite_get_width(hero_left[i]) * scale / 2;
		angle = 230;
		
		draw_sprite_ext(hero_left[i], 0, xx1, yy1 - 30 * scale, -scale, -scale * 0.6, 0, c_black, alp / 4);
		draw_sprite_ext(hero_left[i], 0, xx1, yy1, -scale, scale, 0, c_white, 1);
		
		if i = 2
			{ hero_right[i] = s_huntress; }
		n += 0.25;
		draw_sprite_ext(hero_right[i], n, xx2, yy2 - 30 * scale, scale, -scale * 0.6, 0, c_black, alp / 4);
		draw_sprite_ext(hero_right[i], n, xx2, yy2, scale, scale, 0, c_white, 1);
		}
#endregion
#region Название игры
	var zhopa;
	zhopa = global.size;
	if go >= 2
		{
		if text_y < zhopa - string_height(text2) / 2 - yy - 160
			{ text_y += 35; }
		draw_set_font(f_logo_bold1);
		draw_set_valign(fa_center);
		draw_set_halign(fa_center);
		draw_set_color(c_white);
		draw_text_transformed_t(640, yy + 85 + text_y, text2, text_scale, text_scale, 0, c_white, c_black);
		}
	if go >= 3
		{
		if text_y2 < zhopa - string_height(text2) * 1.25 - yy - 120
			{ text_y2 += 35; }
		draw_set_font(f_logo_bold1);
		draw_set_valign(fa_center);
		draw_set_halign(fa_center);
		draw_set_color(c_white);
		draw_text_transformed_t(640, yy + 85 + text_y2, text1, text_scale2, text_scale2, 0, c_white, c_black);
		}
#endregion
*/
#endregion