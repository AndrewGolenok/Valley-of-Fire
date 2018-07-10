/*
if mouse_y<150
	{
	bk=string(irandom(2));
	if instance_exists(o_duel)
		{
		with(o_duel)
			{ instance_destroy(); }
		}
	room_transf("menu");
	}