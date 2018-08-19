// Охотница
//if super = 1
//	{ draw_sprite_ext(sprite_index, image_index, x - 28, y - 15, sc * scale, scale, 0, c_fuchsia, super_img / 70); }

if image_index < hero_abindex && skeleton_animation_get() = "super"
	{ super_img = image_index; }
	else
	{
	if super_img > 1
		{ super_img -= 2; }
		else
		{ super_img = 0; }
	}

if image_index = 15 && skeleton_animation_get() = "shoot" && shoot = 0
	{
	sx = x;
	sy = y;
	
	knife_i = 0;
	if super = 0
		{ shoot = 1; }
		else
		{ shoot = 2; }
	bullet_index = 4;
	if global.music { audio_play_sound(sd_bow, 1, 0); }
	}
if shoot = 2 or shoot = 3
	{
	if hero = 2
		{ bullet_index = 4; }
	if shoot = 2
		{
		if !enemy
			{ sx += weapon_spd * 1.2; }
			else
			{ sx -= weapon_spd * 1.2; }
		}
		else
		{
		//if bullet_alpha > 0
		//	{ bullet_alpha -= 0.05; }
		//	else
			{ shoot = 0; bullet_index = 0; exit; }
		}
	
	draw_sprite_ext(s_bullet_bottle, 0, sx + 1 - 28, sy - 15, sc * scale - 0.025, scale + 0.025, 0, global.color_hero[2], 0.4 * bullet_alpha);
	draw_sprite_ext(s_bullet_bottle, 0, sx - 1 - 28, sy - 15, sc * scale - 0.025, scale + 0.025, 0, global.color_hero[2], 0.4 * bullet_alpha);
	draw_sprite_ext(s_bullet_bottle, 0, sx - 28, sy - 1 - 15, sc * scale - 0.025, scale + 0.025, 0, global.color_hero[2], 0.4 * bullet_alpha);
	draw_sprite_ext(s_bullet_bottle, 0, sx - 28, sy + 1 - 15, sc * scale - 0.025, scale + 0.025, 0, global.color_hero[2], 0.4 * bullet_alpha);
	
	for(i = 0; i <= 5; i++)
		{ draw_sprite_ext(s_bullet_bottle, 0, sx - 8 * i - 28, sy - 15, sc * scale - 0.025, scale + 0.025, 0, global.color_hero[2], 0.4 / i * bullet_alpha); }
	
	draw_sprite_ext(s_bullet_bottle, 0, sx - 28, sy - 15, sc * scale - 0.025, scale + 0.025, 0, c_white, 1 * bullet_alpha);
	draw_sprite_ext(s_bullet_bottle, 0, sx - 28, sy - 15, sc * scale - 0.025, scale + 0.025, 0, global.color_hero[2], 0.8 * bullet_alpha);
	
	if (sx >= 1280 - x - sprite_get_width(s_bullet_bottle) / 4 && !enemy) or (sx <= (1280 - x) + sprite_get_width(s_bullet_bottle) / 4 && enemy)
		{
		if shoot != 3
			{
			if enemy
				{ enemy_deal(); }
				else
				{ player_deal(); }
			}
		shoot = 3;
		super = 0;
		global.super_ability = 0;
		}
	}
	
//draw_set_font(global.game_font); //draw_set_font(f_wanted_bold);
//draw_text_transformed_t(mouse_x, mouse_y, shoot, 0.10, 0.10, 0, c_white, c_black); //draw_text_transformed_t(mouse_x, mouse_y, string_upper(keyboard_string), 0.10, 0.10, 0, c_white, c_black);