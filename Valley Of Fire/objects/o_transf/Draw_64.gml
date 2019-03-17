#region Отрисовка белого прямоугольника
	if rmp = "set" && go = 1
		{ alarm[0] = 2; go = 1.5; }
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
	draw_rectangle_color(0, 0, global.width, global.height, global.color_white, global.color_white, global.color_white, global.color_white, 0); 
	draw_set_alpha(1);
#endregion