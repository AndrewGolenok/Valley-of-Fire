/////// КВЕСТЫ
var datk;
datk = 1;
var chance, miss;
miss = 0;
			
if (o_list.hp - (o_list.e_atk + (1 + global.e_totem_a[5]) * o_list.e_atk * 1 / 10 * (global.e_critical == (3 - 1 * global.e_totem_a[3])))) <= 0
{
	datk = (1 + 0.2 * global.p_totem_a[6]);
}
	
for(i = 1; i <= 3; i ++)
{
	if global.quests_a[i] = 1
	{
		if global.quests_t[i] = 16
		{
			if global.quests_n_now[i] < global.quests_n_all[i]
			{
				global.quests_n_now[i] += o_list.atk * datk + (1 + global.p_totem_a[5]) * o_list.atk * datk / 10 * (global.critical == (3 - 1 * global.p_totem_a[3]));
			}
		}
		ini_open("Music.ini");
			ini_write_string("Qual", "qual_nno_" + string(i), string(global.quests_n_now[i]));
		ini_close();
	}
	//&& ((global.hero = 2 && global.swipe_ability = 0) or (global.hero = 1 && global.enemy_hero = 1 && global.swipe_ability = 1))
		
	//if global.quests_t[i] = 19 && global.e_totem_a[8] = 0
	//&& o_list.e_hp - o_list.atk * datk + (1 + global.p_totem_a[5]) * o_list.atk * datk / 10 * (global.critical == (3 - 1 * global.p_totem_a[3])) <= 0
	//	{
	//	if global.quests_n_now[i] < global.quests_n_all[i]
	//		{ global.quests_n_now[i] += 1; }
					
	//	ini_open("Music.ini");
	//		ini_write_string("Qual", "qual_nno_" + string(i), string(global.quests_n_now[i]));
	//	ini_close();
	//	}
}
/////// КВЕСТЫ

with(o_hero)
{
	if enemy
	{
		if global.training > 0
		{
			sc_dist = 30;
			sc_dir  = -1;
			sc_spd   = 5;
		}
		if huntress_poison = 1
		{
			huntress_poison = 0;
			if (global.player_object).huntress_poison = 0
			{
				global.super_ability1 = 0;
			}
			super = 0;
		}
		if have_posion = 1
		{
			have_posion = 0;
		}
		if (global.player_object).huntress_poison = 1
		{
			poisoned = room_speed * 10;
		}
		if (global.player_object).have_posion = 1
		{
			poisoned += room_speed * 3;
		}
		if o_list.view_go_left = 0 && o_list.view_go_right = 0
		{
			o_list.view_go_right = 1;
		}
		//var datk;
		datk = 1;
		var chance, miss;
		miss = 0;
		if global.e_totem_a[12] && (o_list.e_hp - o_list.atk) <= 0
		{
			chance = irandom(99);
			if chance < 35
			{
				miss = 1;
				#region ПОКАЗ ТОТЕМА: Тотем уклонения 2
					o_list.totem_show_n[2] = 12;
				#endregion
			}
		}
		if (o_list.hp - (o_list.e_atk + (1 + global.e_totem_a[5]) * o_list.e_atk * 1 / 10 * (global.e_critical == (3 - 1 * global.e_totem_a[3])))) <= 0//(o_list.hp - o_list.e_atk) <= 0
		{
			datk = (1 + 0.2 * global.p_totem_a[6]);
		}
		if miss = 0
		{
			if o_list.hp >= 1 && o_list.e_hp >= 1
			{
				o_list.e_hp -= o_list.atk * datk + (1 + global.p_totem_a[5]) * o_list.atk * datk / 10 * (global.critical == (3 - 1 * global.p_totem_a[3]));
			}
		}	
			
		if (global.hero) = 2
		{
			o_list.atk += 10 * (1 + 0.1 * (global.hero_level - 1));
		}
				
		if diego_dynamit = 1 && skeleton_animation_get() != "super"
		{
			dynamit_d = o_list.atk + (1 + global.p_totem_a[5]) * o_list.atk * datk / 10 * (global.critical == (3 - 1 * global.p_totem_a[3]));
			diego_dynamit = 2;
			stun_seconds -= 1;
			change = 3;
			skeleton_animation_set("super");
		}
							
		o_list.dop_i[2] = 8;
		o_list.dop_text_color[2] = (global.player_object).hero_color;
							
		if global.critical == 3 - 1 * global.p_totem_a[3]
		{
			o_list.dop_text[8] = "-" + string(round(o_list.atk * datk + (1 + global.p_totem_a[5]) * o_list.atk * datk / 10 * (global.critical == (3 - 1 * global.p_totem_a[3]))));
		}
		else
		{
			o_list.dop_text[8] = "-" + string(round(o_list.atk * datk));
		}
		if miss != 0
		{
			o_list.dop_text[8] = "BLOCK";
		}
		if !(skeleton_animation_get() = "super") && !(image_index <= hero_shoot && skeleton_animation_get() = "shoot")
		{
			stun = 0;
			skeleton_animation_set("damaged");
			change = 1;
		}
	}
}
#region ПОКАЗ ТОТЕМА: Тотем усиления атаки

	if global.e_totem_a[6] = 1
	{
		if o_list.e_hp > 0 && (o_list.e_hp - (o_list.atk + (1 + global.p_totem_a[5]) * o_list.atk * datk / 10 * (global.critical == (3 - 1 * global.p_totem_a[3]))) <= 0)
		{
			o_list.totem_show_n[2] = 6;
		}
	}
#endregion
#region Эффект тотема игрока (яд)
	if global.p_totem_a[18] = 1
	{
		#region ПОКАЗ ТОТЕМА: Тотем яда
			if (global.player_object).have_posion != 1
			{
				o_list.totem_show_n[1] = 18;
			}
		#endregion
		(global.player_object).have_posion = 1;
	}
#endregion
if global.online
{
	o_client.cl_stage = 6;
}