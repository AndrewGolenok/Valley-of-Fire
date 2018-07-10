if go_anim = 0
	{
	if load_time <= 1
		{ anim_spd = 0.1; }
		else
	go_anim = 1;
	if load_time != 0
		{ alarm[0] = load_alltime * 8 / load_time; }
	}
	else
	{ alarm[0] = 1; }