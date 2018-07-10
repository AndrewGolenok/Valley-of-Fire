if load_go = 0
	{
	if go_anim = 0 && !set && mouse_x < 450
		{
		if mouse_x > x + 100
			{ go_anim = 1; }
		if mouse_x < x - 100
			{ go_anim =- 1; }
		}

	var yp, xp, xh, hh;
	yp = y - 800 * scale;
	xp = x + 635 * scale;

	if go_anim = 0 && mouse_x = median(xp + 540 - 100, mouse_x, xp + 540 + 100) && mouse_y = median(yp + 450 - 53, mouse_y, yp + 450 + 53)
		{
		set = 1;
	
		load_time    = irandom_range(5,20);
		load_alltime = load_time;
		load_go      = 1;
		}
	}