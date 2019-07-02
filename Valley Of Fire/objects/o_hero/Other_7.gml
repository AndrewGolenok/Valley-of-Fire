#region Способность Воришки
	if hero = 1
	{
		if skeleton_animation_get() = "super"
		{
			if global.swipe_ability = 1
			{
				#region Использование чужой способности
					if ((global.enemy_hero = 5 && !enemy) or (global.hero = 5 && enemy)) && change = 3
					{
						super = 0;
						global.bill_abil = 10 * room_speed;
						global.super_ability = 0;
					}
					if ((global.enemy_hero = 7 && !enemy) or (global.hero = 7 && enemy)) && change = 3
					{
						global.super_ability = 0;
						super = 0;
					}
				#endregion
			}
			else
			{
				#region Использование способности воровства
					global.super_ability = 0;
					global.swipe_ability = 1;
					var enemy_now, enemy_need, player_now, player_need;
					enemy_now  = o_list.e_super_now;
					enemy_need = o_list.e_super_need;
					player_now  = o_list.super_now;
					player_need = o_list.super_need;
					o_list.super_now  = enemy_now;
					o_list.super_need = enemy_need;
					o_list.e_super_now  = 0;
					o_list.e_super_need = 3 - global.e_totem_a[15];
					o_list.super_now1 = 0;
					super = 0;
				#endregion
			}
		}
	}
#endregion
#region Способность Шамана
	if (hero = 7 && skeleton_animation_get() = "greetings") or (hero = 1 && global.swipe_ability = 1 && (global.enemy_object).hero = 7 && skeleton_animation_get() = "super")
	{
		if super = 1
		{
			var idol_n, idol_t;
			idol_t = 1;
			idol_n = -1;
			if global.idol_h[1] != -1 && global.idol_h[2] != -1 && global.idol_h[2] != -1
			{
				idol_t = 0;
			}
			if idol_t = 1
			{
				if global.idol[1] = 0 && global.idol[2] = 0 global.idol[3] = 0
				{
					idol_n = choose(1, 2, 3);
				}
				if global.idol[1] = 1 && global.idol[2] = 0 && global.idol[3] = 0
				{
					idol_n = choose(2, 3);
				}
				if global.idol[1] = 0 && global.idol[2] = 1 && global.idol[3] = 0
				{
					idol_n = choose(1, 3);
				}
				if global.online
				{
					idol_n = real(string_copy(o_list.idols_random[global.myid], 1, 1));
					o_list.idols_random[global.myid] = string_delete(o_list.idols_random[global.myid], 1, 1);
				}
				if idol_n != -1
				{
					if enemy
					{
						global.idol_h[idol_n] = 0;
					}
					else
					{
						global.idol_h[idol_n] = 1;
					}
					global.idol[idol_n] = 1;
				}
			}
			super = 0;
			global.super_ability = 0;
		}
	}
#endregion
#region Способность Диего
	if diego_dynamit = 1
	{
		if global.super_ability = 1 && change = 3
		{
			global.super_ability = 0;
		}
		if hero = 4
		{
			hero_sprite = asset_get_index("s_" + global.hero_code_name[hero] + "2");
		}
	}
	if diego_dynamit != 1 && bill_stage = 0
	{
		hero_sprite = asset_get_index("s_" + global.hero_code_name[hero]);
	}
#endregion
#region Билл старший становится младшим
	if bill_stage = 1
	{
		global.bill_propil = 1;
		bill_stage = 2;
		global.super_ability = 0;
		hero_sprite = s_jbill;
		if !enemy
		{
			o_list.atk /= 3;
		}
		else
		{
			o_list.e_atk /= 3;
		}
		image_speed = spd_max;
		change = 1;
	}
#endregion
#region Состояния героя
	#region Состояние 1: Стойка
		if change = 1
		{
			if global.super_ability = 1 && huntress_poison
			{
				global.super_ability  = 0;
				global.super_ability1 = 1;
			}
			if global.game_stage = 0
			{
				if global.p_totem[1] = -1 && global.p_totem[2] = -1 && global.p_totem[3] = -1
				&& global.e_totem[1] = -1 && global.e_totem[2] = -1 && global.e_totem[3] = -1
				{
					global.game_stage = 1;
				}
				else
				{
					global.game_stage = 0.5;
				}
			}
			sprite_index = hero_sprite;
			skeleton_animation_set("idle");
			image_index = 0;
			image_speed = spd_max;
			change = 0;
			exit;
		}
	#endregion
	#region Состояние 2: Достать оружие
		if change = 2
		{
			sprite_index = hero_sprite;
			skeleton_animation_set("gunsout");
			image_index = 0;
			image_speed = spd_max;
			change = 1;
			exit;
		}
	#endregion
	#region Состояние 3: Перезарядка
		if change = 3
		{
			sprite_index = hero_sprite;
			skeleton_animation_set("reload");
			image_index = 0;
			image_speed = spd_max;
			change = 1;
			exit;
		}
	#endregion
	#region Состояние 4: Победа
		if change = 4
		{
			stun_seconds -= 1;
			if stun_seconds > 1
			{
				change = 4;
			}
			else
			{
				if hero = 6 && skeleton_animation_get() = "win"
				{
					change = 2;
				}
				else
				{
					change = 1;
					if stun != 0
					{
						stun = 0;
						answer = -1;
					}
					if global.online
					{
						o_client.cl_stage = 15;
					}
				}
			}
		}
	#endregion
	#region Состояние 5: Суперспособность
		if change = 5
		{
			if hero = 6 or hero = 3
			{
				image_index = 35;
			}
			if hero = 4
			{
				image_index = 18;
			}
			if hero = 1
			{
				image_index = 35;
			}
			if hero = 2
			{
				image_index = 35;
			}
			stun_seconds -= 1;
			if stun_seconds > 1
			{
				change = 5;
			}
			else
			{
				change = 2;
			}
		}
	#endregion
	#region Состояние 6: Возврат способности
		if change = 6
		{
			super  = 0;
			change = 1;
		}
	#endregion
#endregion