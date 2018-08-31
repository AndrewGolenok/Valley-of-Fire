alarm[1] = room_speed / 10;

#region Удаление текущих объектов
	switch(rmp)
		{
		case "logo":
			with(o_logo)
				{ instance_destroy(); }
		break;
		case "menu":
			//if global.music = 1
			//	{
			//	if audio_is_playing(sd_menu)
			//		{ audio_pause_sound(sd_menu); }
			//	}
			if rm != "duel"
				{
				with(o_control)
					{ instance_destroy(); }
				}
			with(o_menu)
				{ instance_destroy(); }
			//with(o_padpiska)
			//	{ instance_destroy(); }
		break;
		case "duel":
			//if global.music = 1
			//	{
			//	var musica;
			//	musica = asset_get_index("sd_" + string(global.background));
			//	if audio_is_playing(musica)
			//		{ audio_stop_sound(musica); }
			//	}
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
			//if global.music = 1
			//	{
			//	if audio_is_paused(sd_menu)
			//		{ audio_resume_sound(sd_menu); }
			//	}
			//	else
			//	{
			//	if audio_is_playing(sd_menu)
			//		{ audio_pause_sound(sd_menu); }
			//	}
			instance_create_depth(0, 0, 0, o_control);
			instance_create_depth(0, 0, -1, o_menu);
			//instance_create_depth(0, 0, -3, o_padpiska);
		break;
		//case "sethero":
		//	instance_create_depth(0, 0, 0, o_control);
		//	instance_create_depth(0, 0, -1, o_menu);
		//break;
		case "duel":
			if rmp != "menu"
				{ instance_create_depth(0, 0, -1, o_control); }
			
			//if global.music = 1
			//	{
			//	var musica;
			//	musica = asset_get_index("sd_" + string(global.background));
			//	if audio_is_playing(musica)
			//		{ audio_stop_sound(musica); }
			//	}
			
			instance_create_depth(0, 0, -1, o_list);
			
			global.enemy = 0;
			instance_create_depth(0, 0, 0, o_hero);
			global.enemy = 1;
			instance_create_depth(0, 0, 0, o_hero);
		break;
		}
	global.room_to_go = rm;
#endregion

//global.room_rm  = rm;
//global.room_rmp = rmp;

//if rmp != "logo"
//	{ global.music_pere = 1; }