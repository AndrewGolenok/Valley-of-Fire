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