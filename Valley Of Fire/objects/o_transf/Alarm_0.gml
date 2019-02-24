alarm[1] = room_speed / 10;

#region Удаление текущих объектов
	switch(rmp)
		{
		case "logo":
			with(o_logo)
				{ instance_destroy(); }
		break;
		case "menu":
			if rm != "duel"
				{
				with(o_control)
					{ instance_destroy(); }
				}
			with(o_menu)
				{ instance_destroy(); }
		break;
		case "duel":
			with(o_control)
				{ instance_destroy(); }
			with(o_list)
				{ instance_destroy(); }
			with(o_hero)
				{ instance_destroy(); }
		break;
		}
#endregion
#region Создание новых объектов
	switch(rm)
		{
		case "logo":
			instance_create_depth(0, 0, 0, o_logo);
		break;
		case "menu":
			instance_create_depth(0, 0, 0, o_control);
			instance_create_depth(0, 0, -1, o_menu);
		break;
		case "duel":
			if rmp != "menu"
				{ instance_create_depth(0, 0, -1, o_control); }
			
			instance_create_depth(0, 0, -1, o_list);
			
			global.enemy = 0;
			instance_create_depth(0, 0, 0, o_hero);
			global.enemy = 1;
			instance_create_depth(0, 0, 0, o_hero);
		break;
		}
	global.room_to_go = rm;
#endregion