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
	
if image_index = hero_abindex && skeleton_animation_get() = "super"
	{
	sx = x;
	sy = y;
	
	shoot = 1//2;
	if global.music { audio_play_sound(sd_bow, 1, 0); }
	}

if image_index = 20 && skeleton_animation_get() = "shoot"
	{
	sx = x;
	sy = y;
	
	shoot = 1;
	if global.music { audio_play_sound(sd_bow, 1, 0); }
	}
if shoot = 2 or shoot = 3
	{
	if shoot = 2
		{
		if !enemy
			{ sx += weapon_spd * 1.2; }
			else
			{ sx -= weapon_spd * 1.2; }
		}
		else
		{
		if bullet_alpha > 0
			{ bullet_alpha -= 0.05; }
			else
			{ shoot = 0; exit; }
		}
	
	draw_sprite_ext(s_huntress_ability, 0, sx + 1 - 28, sy - 15, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.4 * bullet_alpha);
	draw_sprite_ext(s_huntress_ability, 0, sx - 1 - 28, sy - 15, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.4 * bullet_alpha);
	draw_sprite_ext(s_huntress_ability, 0, sx - 28, sy - 1 - 15, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.4 * bullet_alpha);
	draw_sprite_ext(s_huntress_ability, 0, sx - 28, sy + 1 - 15, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.4 * bullet_alpha);
	
	for(i = 0; i <= 5; i++)
		{ draw_sprite_ext(s_huntress_ability, 0, sx - 8 * i - 28, sy - 15, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.4 / i * bullet_alpha); }
	
	draw_sprite_ext(s_huntress_ability, 0, sx - 28, sy - 15, sc * scale - 0.025, scale + 0.025, 0, c_white, 1 * bullet_alpha);
	draw_sprite_ext(s_huntress_ability, 0, sx - 28, sy - 15, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.8 * bullet_alpha);
	
	if (sx >= 1280 - x - sprite_get_width(s_huntress_ability) / 4 && !enemy) or (sx <= (1280 - x) + sprite_get_width(s_huntress_ability) / 4 && enemy)
		{ shoot = 3; }
	}
	
//draw_set_font(global.game_font); //draw_set_font(f_wanted_bold);
//draw_text_transformed_t(mouse_x, mouse_y, shoot, 0.10, 0.10, 0, c_white, c_black); //draw_text_transformed_t(mouse_x, mouse_y, string_upper(keyboard_string), 0.10, 0.10, 0, c_white, c_black);