with(o_hero)
{
	if !enemy
	{
		if huntress_poison = 1
		{
			huntress_poison = 0;
			if (global.enemy_object).huntress_poison = 0
			{
				global.super_ability1 = 0;
			}
			super = 0;
		}
		if have_posion = 1
		{
			have_posion = 0;
		}
		
		if (global.enemy_object).huntress_poison = 1
		{
			poisoned = room_speed * 10;
		}
		if (global.enemy_object).have_posion = 1
		{
			poisoned += room_speed * 3;
		}
		
		if o_list.view_go_left = 0 && o_list.view_go_right = 0
		{
			o_list.view_go_left = 1;
		}
						
		var datk;
		datk = 1;
		var chance, miss;
		miss = 0;
		
		if global.p_totem_a[12] && (o_list.hp - o_list.e_atk) <= 0
		{
			chance = irandom(99);
			if chance < 35
			{
				miss = 1;
				#region ПОКАЗ ТОТЕМА: Тотем уклонения 2
					o_list.totem_show_n[1] = 12;
				#endregion
			}
		}
		
		if o_list.e_hp - (o_list.atk + (1 + global.p_totem_a[5]) * o_list.atk * datk / 10 * (global.critical == (3 - 1 * global.p_totem_a[3]))) <= 0
		{
			datk = (1 + 0.2 * global.e_totem_a[6]);
		}
		else
		{
			datk = 1;
		}
		
		if miss = 0
		{
			if o_list.hp >= 1 && o_list.e_hp >= 1
			{
				o_list.hp -= o_list.e_atk * datk + (1 + global.e_totem_a[5]) * o_list.e_atk * datk / 10 * (global.e_critical == (3 - 1 * global.e_totem_a[3]));
			}
		}
		
		if (global.enemy_hero) = 2
		{
			o_list.e_atk += 10 * (1 + 0.1 * (global.enemy_level - 1));
		}
							
		if diego_dynamit = 1 && skeleton_animation_get() != "super"
		{
			dynamit_d = o_list.e_atk * datk + (1 + global.e_totem_a[5]) * o_list.e_atk * datk / 10 * (global.e_critical == 3);
			diego_dynamit = 2;
			stun_seconds -= 1;
			change = 3;
			skeleton_animation_set("super");
		}
							
		o_list.dop_i[1] = 7;
		o_list.dop_text_color[1] = (global.enemy_object).hero_color;
		if global.e_critical == (3 - 1 * global.e_totem_a[3])
		{
			o_list.dop_text[7] = "-" + string(round(o_list.e_atk * datk + (1 + global.e_totem_a[5]) * o_list.e_atk * datk / 10 * (global.e_critical == (3 - 1 * global.e_totem_a[3]))));
		}
		else
		{
			o_list.dop_text[7] = "-" + string(round(o_list.e_atk * datk));
		}
		if miss != 0
		{
			o_list.dop_text[7] = "BLOCK";
		}
		if global.super_ability = 0 && !(skeleton_animation_get() = "super") && !(image_index <= hero_shoot && skeleton_animation_get() = "shoot")
		{
			stun = 0;
			skeleton_animation_set("damaged");
			change = 1;
			if global.online
			{
				o_client.cl_stage = 15;
			}
		}
	}
}
#region ПОКАЗ ТОТЕМА: Тотем усиления атаки
	if global.p_totem_a[6] = 1
	{
		if o_list.hp > 0 && (o_list.hp - (o_list.e_atk + (1 + global.e_totem_a[5]) * o_list.e_atk * 1 / 10 * (global.e_critical == (3 - 1 * global.e_totem_a[3])))) <= 0
		{
			o_list.totem_show_n[1] = 6;
		}
	}
#endregion
#region Эффект тотема врага (яд)
	if global.e_totem_a[18] = 1
	{
		#region ПОКАЗ ТОТЕМА: Тотем яда
			if (global.enemy_object).have_posion != 1
			{
				o_list.totem_show_n[2] = 18;
			}
		#endregion
		(global.enemy_object).have_posion = 1;
	}
#endregion
//if global.online
//{
//	o_client.cl_stage = 6;
//}