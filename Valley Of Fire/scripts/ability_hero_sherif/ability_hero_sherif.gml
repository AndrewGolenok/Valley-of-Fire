// Шериф
//if super = 1
//	{ draw_sprite_ext(sprite_index, image_index, x - 28, y - 40, sc * scale, scale, 0, c_yellow, super_img / 70); }
	
if image_index < 32 && skeleton_animation_get() = "super"
	{ super_img = image_index; }
	else
	{
	if super_img > 1
		{ super_img -= 2; }
		else
		{ super_img = 0; super = 0; }
	}
	
if image_index = 32 && skeleton_animation_get() = "super"
	{
	sx = x;
	sy = y;
	
	shoot = 2; 
	global.critical = 3;
	if global.music { audio_play_sound(sd_revolver, 1, 0); }
	}

if image_index = 20 && skeleton_animation_get() = "shoot"
	{
	sx = x;
	sy = y;
	
	shoot = 1;
	
	if global.music { audio_play_sound(sd_revolver, 1, 0); }
	//if enemy
		//{ audio_play_sound(sd_revolver, 1, 0); }
	}
if shoot = 2 or shoot = 3
	{
	if bullet_index < 4
		{ bullet_index += 1.5; }
		else
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
			//if bullet_alpha > 0
			//	{ bullet_alpha -= 0.25; }
			//	else
				{ bullet_alpha = 1; shoot = 0; bullet_index = 0; exit; }
			}
		}
	
	draw_sprite_ext(s_bullet_revolver, bullet_index, sx + 1 - 28 * !enemy + 28 * enemy, sy - 40, sc * scale - 0.025, scale + 0.025, 0, c_yellow, 0.4 * bullet_alpha);
	draw_sprite_ext(s_bullet_revolver, bullet_index, sx - 1 - 28 * !enemy + 28 * enemy, sy - 40, sc * scale - 0.025, scale + 0.025, 0, c_yellow, 0.4 * bullet_alpha);
	draw_sprite_ext(s_bullet_revolver, bullet_index, sx - 28 * !enemy + 28 * enemy, sy - 1 - 40, sc * scale - 0.025, scale + 0.025, 0, c_yellow, 0.4 * bullet_alpha);
	draw_sprite_ext(s_bullet_revolver, bullet_index, sx - 28 * !enemy + 28 * enemy, sy + 1 - 40, sc * scale - 0.025, scale + 0.025, 0, c_yellow, 0.4 * bullet_alpha);
	
	for(i = 0; i <= 5; i++)
		{ draw_sprite_ext(s_bullet_revolver, bullet_index, sx - 8 * i * !enemy + 8 * i * enemy - 28 * !enemy + 28 * enemy, sy - 40, sc * scale - 0.025, scale + 0.025, 0, c_yellow, 0.4 / i * bullet_alpha); }
	
	draw_sprite_ext(s_bullet_revolver, bullet_index, sx - 28 * !enemy + 28 * enemy, sy - 40, sc * scale - 0.025, scale + 0.025, 0, c_white, 1 * bullet_alpha);
	draw_sprite_ext(s_bullet_revolver, bullet_index, sx - 28 * !enemy + 28 * enemy, sy - 40, sc * scale - 0.025, scale + 0.025, 0, c_orange, 0.5 * bullet_alpha);
	draw_sprite_ext(s_bullet_revolver, bullet_index, sx - 28 * !enemy + 28 * enemy, sy - 40, sc * scale - 0.025, scale + 0.025, 0, c_yellow, 0.2 * bullet_alpha);
	
	//draw_sprite_ext(s_bullet_revolver, 0, sx - 28 + 1, sy - 40, sc * scale - 0.025, scale + 0.025, 0, c_white, 1);
	//draw_sprite_ext(s_bullet_revolver, 0, sx - 28 + 1, sy - 40, sc * scale - 0.025, scale + 0.025, 0, c_orange, 0.5);
	//draw_sprite_ext(s_bullet_revolver, 0, sx - 28 + 1, sy - 40, sc * scale - 0.025, scale + 0.025, 0, c_yellow, 0.2);
	
	//draw_sprite_ext(s_bullet_revolver, 0, sx - 28, sy - 40, sc * scale - 0.025, scale + 0.025, 0, c_white, 1);
	//draw_sprite_ext(s_bullet_revolver, 0, sx - 28, sy - 40, sc * scale - 0.025, scale + 0.025, 0, c_orange, 0.5);
	//draw_sprite_ext(s_bullet_revolver, 0, sx - 28, sy - 40, sc * scale - 0.025, scale + 0.025, 0, c_yellow, 0.2);
	
	if ((sx >= (1280 - x - sprite_get_width(s_bullet_revolver) - weapon_spd * 1.2)) && !enemy) or ((sx <= ((1280 - x) + weapon_spd * 1.2 + sprite_get_width(s_bullet_revolver))) && enemy)
		{
		global.super_ability = 0;
		if enemy
			{
			if shoot != 3
				{
				with(o_hero)
					{
					if !enemy
						{
						if o_list.view_go_left = 0 && o_list.view_go_right = 0
							{ o_list.view_go_left = 1; }
						o_list.hp -= o_list.e_atk;
						o_list.dop_i[1] = 7;
						o_list.dop_text_color[1] = c_orange;
						o_list.dop_text[7] = "-" + string(round(o_list.e_atk));
						if !(skeleton_animation_get() = "super") && !(image_index <= 20 && skeleton_animation_get() = "shoot")
							{
							skeleton_animation_set("damaged");
							change = 1;
							}
						global.super_ability = 0;
						}
					}
				}
			}
			else
			{
			if shoot != 3
				{
				with(o_hero)
					{
					if enemy
						{
						if o_list.view_go_left = 0 && o_list.view_go_right = 0
							{ o_list.view_go_right = 1; }
						o_list.e_hp -= o_list.atk;
						o_list.dop_i[2] = 8;
						o_list.dop_text_color[2] = c_orange;
						o_list.dop_text[8] = "-" + string(round(o_list.atk));
						if !(skeleton_animation_get() = "super") && !(image_index <= 20 && skeleton_animation_get() = "shoot")
							{
							skeleton_animation_set("damaged");
							change = 1;
							}
						global.super_ability = 0;
						}
					}
				}
			}
		shoot = 3;
		}
	}