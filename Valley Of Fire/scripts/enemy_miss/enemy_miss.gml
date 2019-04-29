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
//if global.online
//{
//	o_client.cl_stage = 6;
//}