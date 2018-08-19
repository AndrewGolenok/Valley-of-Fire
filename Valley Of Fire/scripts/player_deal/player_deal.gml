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
							
		if (global.hero) = 2
			{ o_list.atk += 10; }
							
		if diego_dynamit = 1 && skeleton_animation_get() != "super"
			{ dynamit_d = o_list.atk + o_list.atk / 10 * (global.e_critical == 3); diego_dynamit = 2; stun_seconds -= 1; change = 3; skeleton_animation_set("super"); }
							
		o_list.dop_i[2] = 8;
		o_list.dop_text_color[2] = (global.player_object).hero_color;
							
		if global.critical == 3
			{ o_list.dop_text[8] = "-" + string(round(o_list.atk + o_list.atk / 10))/* + "-" + string(round(o_list.atk / 10));*/ }
			else
			{ o_list.dop_text[8] = "-" + string(round(o_list.atk)); }
		if !(skeleton_animation_get() = "super") && !(image_index <= hero_shoot && skeleton_animation_get() = "shoot")
			{
			stun = 0;
			skeleton_animation_set("damaged");
			change = 1;
			}
		}
						}