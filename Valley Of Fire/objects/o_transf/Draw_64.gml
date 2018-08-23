if go = 1
	{
	if alp < 1
		{
		alp += 0.05 + alp/4;
		alarm[0] = 2;
		}
		else
		{ alp = 1; }
	}
if go = 2
	{
	if alp > 0
		{ alp -= 0.1; }
		else
		{ instance_destroy(); }
	}
draw_set_alpha(alp);
draw_rectangle_color(0, 0, 1280, global.size, global.color_white, global.color_white, global.color_white, global.color_white, 0); //draw_rectangle_color(0, 0, 1280, global.size, c_white, c_white, c_white, c_white, 0);
draw_set_alpha(1);