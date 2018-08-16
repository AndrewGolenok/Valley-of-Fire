#region Появление
if !enemy
	{
	if skeleton_animation_get() = "greetings"
		{
		if x < xn
			{ x += 10; }
			else
			{ x = xn; }

		if x < xn / 2 - 20
			{ x += 10; image_speed = 0.5; }
		if x >= xn / 2 - 50 && x < xn / 2 + 30
			{ x += 5; image_speed = 2; }
		if x >= xn / 2 + 20 && x < xn
			{ x += 2; image_speed = 0; }
		if x >= xn
			{ change = 2; image_speed = 2; }
		}
	}
	else
	{
	if skeleton_animation_get() = "greetings"
		{
		if x > xn
			{ x -= 10; }
			else
			{ x = xn; }

		if x > xn / 2 + 20
			{ x -= 10; image_speed = 0.5; }
		if x <= xn / 2 + 50 && x > xn / 2 - 30
			{ x -= 5; image_speed = 2; }
		if x <= xn / 2 - 20 && x > xn
			{ x -= 2; image_speed = 0; }
		if x <= xn
			{ change = 2; image_speed = 2; }
		}
	}
#endregion
#region Рисование персонажа и выстрел
	var prx, pry;
	prx = global.paral_x * global.paral_sx;
	pry = global.paral_y * global.paral_sy;
	
	if global.background = "mine" or global.background = "saloon"
		{ prx = -prx; pry = -pry; }
	//if shoot = 1
	//	{
	//	var penis;
	//	penis = sprite_get_yoffset(hero_bullet);
	//	//draw_rectangle_color(x, sy - 2 - penis * scale, sx - 28, sy + 2 - penis * scale, c_white, c_white, c_white, c_white, 0);
	//	}

	//draw_text(mouse_x, mouse_y, string(bullet_index));
	if (super = 1 or (global.super_ability1 = 1 && huntress_poison))// && !enemy//global.super_ability
		{
		if ability_index < 5
			{ ability_index += 0.5; }
			else
			{ ability_index += 0.4; }
		if ability_index >= 9
			{ ability_index = 5; }
		
		if image_index >= hero_abindex && !huntress_poison
			{ ability_alpha -= 0.2; ability_index = 9; }
		
		draw_sprite_ext(ability_back, ability_index, x - 28 * !enemy + 28 * enemy + prx, y - 15 + pry, sc * scale, scale, 0, hero_color, ability_alpha);
		}
		else
		{ ability_index = 0; ability_alpha = 1; }
	
	if change = 5 && image_index = 28
		{
		if hero = 2
			{
			stun_seconds -= 1;
			if stun_seconds > 1
				{ image_speed = 1.25; change = 5; }
				else
				{ image_speed = 2; change = 2; }
			image_index = 18;
			}
		}
	
	if enemy
		{
		draw_sprite_ext(sprite_index, image_index, x + 28 + prx, y - 15 + o_control.back_train_y1 + pry, sc * scale, scale, 0, c_white, 1);
		
		if poisoned > 0
			{
			poisoned -= 1;
			
			if poisoned mod room_speed = 0
				{
				o_list.e_hp -= o_list.atk / 10;
				o_list.dop_i[2] = 8;
				o_list.dop_text_color[2] = (global.player_object).hero_color;
				o_list.dop_text[8] = "-" + string(round(o_list.atk / 10));
				if !(skeleton_animation_get() = "super") && !(image_index <= 20 && skeleton_animation_get() = "shoot")
					{
					stun = 0;
					skeleton_animation_set("damaged");
					change = 1;
					}
				}
			draw_sprite_ext(sprite_index, image_index, x + 28 + prx, y - 15 + o_control.back_train_y1 + pry, sc * scale, scale, 0, c_fuchsia, 0.2);
			
			abil_n += 0.4;
			draw_sprite_ext(s_abil_thing_huntress, abil_n, x + 5 + prx, y - 145 - 100 + o_control.back_train_y2 + pry, sc * scale * 1.3, scale * 1.3, 0, c_white, 1);
			}
		}
		else
		{
		//draw_set_alpha(0.5);
		//draw_ellipse_color(x - 28 - sprite_get_width(sprite_index) * scale / 3, y - 45 * scale + o_control.back_train_y2, x + sprite_get_width(sprite_index) * scale / 3 + 10, y + 10 * scale + o_control.back_train_y2, c_black, c_black, 0);
		//draw_set_alpha(1);
		//draw_rectangle_color(0, 0, 1280, global.size, c_black, c_black, c_black, c_black, 0);
		draw_sprite_ext(sprite_index, image_index, x - 28 + prx, y - 15 + o_control.back_train_y2 + pry, sc * scale, scale, 0, c_white, 1);
		
		if poisoned > 0
			{
			poisoned -= 1;
			
			if poisoned mod room_speed = 0
				{
				o_list.hp -= o_list.e_atk / 10;
				o_list.dop_i[1] = 7;
				o_list.dop_text_color[1] = (global.enemy_object).hero_color;
				o_list.dop_text[7] = "-" + string(round(o_list.e_atk / 10));
				if !(skeleton_animation_get() = "super") && !(image_index <= 20 && skeleton_animation_get() = "shoot")
					{
					stun = 0;
					skeleton_animation_set("damaged");
					change = 1;
					}
				}
			draw_sprite_ext(sprite_index, image_index, x - 28 + prx, y - 15 + o_control.back_train_y2 + pry, sc * scale, scale, 0, c_fuchsia, 0.2);
		
			abil_n += 0.4;
			draw_sprite_ext(s_abil_thing_huntress, abil_n, x + 5 + prx, y - 145 - 100 + o_control.back_train_y2 + pry, sc * scale * 1.3, scale * 1.3, 0, c_white, 1);
			}
		}
	
	if change = 5 && hero = 1 && image_index = 50 && stun_seconds >= 2
		{
		image_index = 28;
		stun_seconds -= 1;
		if stun_seconds > 1
			{ change = 5; }
			else
			{ change = 2; }
		}
	if shoot = 1
		{
		if hero = 3
			{ bullet_index = 4; }
		if bullet_index < 4
			{ bullet_index += 1.5; }
			else
			{ sx += (weapon_spd * (!enemy) - weapon_spd * (enemy)) * 2; }
		
		if huntress_poison
			{
			draw_sprite_ext(s_huntress_ability, bullet_index, sx + 1 - 28 + prx, sy - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.4 * bullet_alpha);
			draw_sprite_ext(s_huntress_ability, bullet_index, sx - 1 - 28 + prx, sy - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.4 * bullet_alpha);
			draw_sprite_ext(s_huntress_ability, bullet_index, sx - 28 + prx, sy - 1 - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.4 * bullet_alpha);
			draw_sprite_ext(s_huntress_ability, bullet_index, sx - 28 + prx, sy + 1 - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.4 * bullet_alpha);
	
			for(i = 0; i <= 5; i++)
				{ draw_sprite_ext(s_huntress_ability, bullet_index, sx - 8 * i - 28 + prx, sy - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.4 / i * bullet_alpha); }
	
			draw_sprite_ext(s_huntress_ability, bullet_index, sx - 28 + prx, sy - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_white, 1 * bullet_alpha);
			draw_sprite_ext(s_huntress_ability, bullet_index, sx - 28 + prx, sy - 15 + pry, sc * scale - 0.025, scale + 0.025, 0, c_fuchsia, 0.8 * bullet_alpha);
			}
			else
			{
			draw_sprite_ext(hero_bullet, bullet_index, sx - 28 + prx, sy + pry, sc * scale - 0.025, scale + 0.025, 0, c_white, bullet_alpha);
			}
		
		//or (((sx >= 1280 - x - sprite_get_width(s_bullet_revolver) - weapon_spd * 1.2 - 1280 && !enemy) or (sx <= (1280 - x) + 1280 + weapon_spd * 1.2 + sprite_get_width(s_bullet_revolver) && enemy)) && answer = 0)
		if ((((sx >= 1280 - x - sprite_get_width(s_bullet_revolver) - weapon_spd * 1.2) && !enemy) or ((sx <= (1280 - x) + weapon_spd * 1.2 + sprite_get_width(s_bullet_revolver)) && enemy)) && answer != -1)
			{
			if enemy
				{
				//if o_list.bot_question >= global.question && (o_list.bot_task >= global.task) && o_list.timer > 2 * room_speed
					//{ o_list.timer = 2 * room_speed; o_list.timer_x = 2 * room_speed; }
				if answer = 1
					{
					with(o_hero)
						{
						if !enemy
							{
							if huntress_poison = 1
								{
								huntress_poison = 0;
								global.super_ability1 = 0;
								super = 0;
								}
							if (global.enemy_object).huntress_poison = 1
								{ poisoned = room_speed * 10; }
							if o_list.view_go_left = 0 && o_list.view_go_right = 0
								{ o_list.view_go_left = 1; }
							
							if o_list.hp > 0 && o_list.e_hp > 0
								{ o_list.hp -= o_list.e_atk + o_list.e_atk / 10 * (global.critical == 3); }
							
							if diego_dynamit = 1 && skeleton_animation_get() != "super"
								{ dynamit_d = o_list.e_atk + o_list.e_atk / 10 * (global.e_critical == 3); diego_dynamit = 2; stun_seconds -= 1; change = 3; skeleton_animation_set("super"); }
							
							o_list.dop_i[1] = 7;
							o_list.dop_text_color[1] = (global.enemy_object).hero_color;
							if global.critical == 3
								{ o_list.dop_text[7] = "-" + string(round(o_list.e_atk + o_list.e_atk / 10)); }
								else
								{ o_list.dop_text[7] = "-" + string(round(o_list.e_atk)); }
							if !(skeleton_animation_get() = "super") && !(image_index <= 20 && skeleton_animation_get() = "shoot")
								{
								stun = 0;
								skeleton_animation_set("damaged");
								change = 1;
								}
							}
						}
					}
					else
					{
					with(o_hero)
						{
						if !enemy
							{
							if diego_dynamit = 1 && skeleton_animation_get() != "super"
								{ dynamit_d = 0; diego_dynamit = 2; change = 3; stun_seconds -= 1; skeleton_animation_set("super"); }
							
							if o_list.view_go_down = 0
								{ o_list.view_go_down = 1; o_list.dop_i[0] = 0; }
							}
						}
					}
				}
				else
				{
				if o_list.bot_question <= global.question && (o_list.bot_task <= global.task) && o_list.bot_time2 > 3 * room_speed
					{ o_list.bot_time = random(1) * room_speed; o_list.bot_time2 = 3 * room_speed; }
				if answer = 1
					{
					with(o_hero)
						{
						if enemy
							{
							if huntress_poison = 1
								{
								huntress_poison = 0;
								global.super_ability1 = 0;
								super = 0;
								}
							if (global.player_object).huntress_poison = 1
								{ poisoned = room_speed * 10; }
							if o_list.view_go_left = 0 && o_list.view_go_right = 0
								{ o_list.view_go_right = 1; }
							
							if o_list.hp > 0 && o_list.e_hp > 0
								{ o_list.e_hp -= o_list.atk + o_list.atk / 10 * (global.e_critical == 3); }
							
							if diego_dynamit = 1 && skeleton_animation_get() != "super"
								{ dynamit_d = o_list.atk + o_list.atk / 10 * (global.e_critical == 3); diego_dynamit = 2; stun_seconds -= 1; change = 3; skeleton_animation_set("super"); }
							
							o_list.dop_i[2] = 8;
							o_list.dop_text_color[2] = (global.player_object).hero_color;
							
							if global.critical == 3
								{ o_list.dop_text[8] = "-" + string(round(o_list.atk + o_list.atk / 10))/* + "-" + string(round(o_list.atk / 10));*/ }
								else
								{ o_list.dop_text[8] = "-" + string(round(o_list.atk)); }
							if !(skeleton_animation_get() = "super") && !(image_index <= 20 && skeleton_animation_get() = "shoot")
								{
								stun = 0;
								skeleton_animation_set("damaged");
								change = 1;
								}
							}
						}
					}
					else
					{
					with(o_hero)
						{
						if enemy
							{
							if diego_dynamit = 1 && skeleton_animation_get() != "super"
								{ dynamit_d = o_list.atk + o_list.atk / 10 * (global.e_critical == 3); diego_dynamit = 2; stun_seconds -= 1; change = 3; skeleton_animation_set("super"); }
							
							if o_list.view_go_down = 0
								{ o_list.view_go_down = 1; o_list.dop_i[0] = 1; }
							}
						}
					}
				}
			if answer = 1
				{ shoot = 0; bullet_index = 0; answer = -1; global.pin = -1; }
			}
		if answer = 0 
			{
			if (sx > 1380 && !enemy) or (sx < - 100 && enemy)
				{ shoot = 0; bullet_index = 0; answer = -1; global.pin = -1; }
			}
		}
	if answer = -1 && !super
		{ shoot = 0; bullet_index = 0; }
#endregion
#region Суперспособность
	var abil;
	abil = asset_get_index("ability_hero_" + string(global.hero_code_name[hero]));
	script_execute(abil); 
	
	//if diego_dynamit = 1
	//	{
	//	if global.super_ability = 1 && change = 3
	//		{ global.super_ability = 0; }
	//	hero_sprite = asset_get_index("s_" + global.hero_code_name[hero] + "2");
	//	}
	if diego_dynamit = 2 && image_index >= 18
		{ diego_dynamit = 3; }
	if diego_dynamit = 3
		{
		if enemy = 0
			{
			//global.super_ability1 = 1;
			dynamit_x = x + 375 * scale;
			dynamit_y = y - 200;
			dynamit_a = 135;
			dynamit_i = 0;
			}
			else
			{
			//global.super_ability1 = 1;
			dynamit_x = x - 375 * scale;
			dynamit_y = y - 200;
			dynamit_a = 135;
			dynamit_i = 0;
			}
		diego_dynamit = 4;
		}
	if diego_dynamit = 4
		{
		if !enemy
			{
			if dynamit_x < (global.enemy_object).x
				{ dynamit_x += 30; }
				else
				{
				(global.enemy_object).diego_boom = 1;
				view_xport = 0;
				view_yport = 0;
			
				o_list.view_go_right = 1;
				o_list.view_go_down  = 1;
				
				if o_list.e_hp > 0 && o_list.hp > 0
					{ o_list.e_hp -= dynamit_d; }
				
				if (global.enemy_object).diego_dynamit = 1
					{
					with((global.enemy_object))
						{
						dynamit_d = o_list.atk + o_list.atk / 10 * (global.e_critical == 3);
						diego_dynamit = 2;
						stun_seconds -= 1;
						change = 3;
						skeleton_animation_set("super");
						}
					}
				o_list.dop_i[2] = 8;
				o_list.dop_text_color[2] = (global.player_object).hero_color;
				o_list.dop_text[8] = "-" + string(dynamit_d);
			
				if !(skeleton_animation_get() = "super") && !(image_index <= 20 && skeleton_animation_get() = "shoot")
					{
					stun = 0;
					skeleton_animation_set("damaged");
					change = 1;
					}
				
				diego_dynamit = 0;
				dynamit_d = 0;
				global.super_ability1 = 0;
				global.super_ability = 0;
				super = 0;
				}
			dynamit_a -= 5;
			draw_sprite_ext(s_abil_thing_diego, 0, dynamit_x, dynamit_y, scale * 1.2, scale * 1.2, dynamit_a, c_white, 1)
			}
			else
			{
			if dynamit_x > (global.player_object).x
				{ dynamit_x -= 30; }
				else
				{
				(global.player_object).diego_boom = 1;
				view_xport = 0;
				view_yport = 0;
			
				o_list.view_go_left = 1;
				o_list.view_go_down = 1;
				
				if o_list.hp > 0 && o_list.e_hp > 0
					{ o_list.hp -= dynamit_d; }
				
				if (global.player_object).diego_dynamit = 1
					{
					with((global.player_object))
						{
						dynamit_d = o_list.e_atk + o_list.e_atk / 10 * (global.e_critical == 3);
						diego_dynamit = 2;
						stun_seconds -= 1;
						change = 3;
						skeleton_animation_set("super");
						}
					}
				
				o_list.dop_i[1] = 7;
				o_list.dop_text_color[1] = (global.enemy_object).hero_color;
				if global.critical == 3
					{ o_list.dop_text[7] = "-" + string(round(o_list.e_atk + o_list.e_atk / 10)); }
					else
					{ o_list.dop_text[7] = "-" + string(round(o_list.e_atk)); }
				if !(skeleton_animation_get() = "super") && !(image_index <= 20 && skeleton_animation_get() = "shoot")
					{
					stun = 0;
					skeleton_animation_set("damaged");
					change = 1;
					}
				
				diego_dynamit = 0;
				dynamit_d = 0;
				global.super_ability1 = 0;
				global.super_ability = 0;
				super = 0;
				}
			dynamit_a -= 5;
			draw_sprite_ext(s_abil_thing_diego, 0, dynamit_x + prx, dynamit_y + pry, scale * 1.2, scale * 1.2, dynamit_a, c_white, 1)
			}
		}
#endregion
#region Стан и Взрыв
	if diego_boom > 0
		{
		draw_sprite_ext(s_diego_boom, diego_boom, x + prx, y - 200 + pry, scale * 1.2, scale * 1.2, 0, c_white, 1);
		diego_boom += 0.5;
		if diego_boom > 5
			{ diego_boom = -1; }
		//(global.enemy_object).x
		}
	if stun = 1 && skeleton_animation_get() != "stun"
		{
		//stun = 1;
		stun_seconds = 3;// * room_speed;
		sprite_index = hero_sprite;
		skeleton_animation_set("stun");
		image_index = 0;
		image_speed = 2;
		change = 4;
		}
#endregion