if zhepka
{
	#region Общая информация
	var fps_txt = "ОНЛАЙН: " + string(global.online)+ " | ПИНГ: " + string(ping_time) + " | МАКС. ПИНГ:" + string(ping_max) + " | FPS: " + string(round(fps_real)) + " | RSPD: " + string(round(room_speed));
	var myid_t  = "";
	var f_id_t  = "";
	draw_set_font(f_standard);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	if global.myid != -1
	{
		myid_t = " (" + string(global.myid) + ")";
	}
	if global.f_id != -1
	{
		f_id_t = " (" + string(global.f_id) + ")";
	}
	draw_text(room_width - string_width(fps_txt), yy, fps_txt);
	draw_text(xx, yy + 16, fps_txt);
	draw_text(xx, yy + 32, "Получ текст: " + txt);
	if instance_exists(o_list)
	{
		draw_text(xx, yy + 48, "ХП ИГ: " + string(o_list.hp) + "~" + string(o_list.maxhp));
		draw_text(xx, yy + 64, "ХП ВР: " + string(o_list.e_hp) + "~" + string(o_list.e_maxhp));
	}
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	//
	var json_txt, json_str, module_str, test_txt;
	module_str = @'{"m';
	json_txt   = @'{"module":"fight","act":"makeMove","param":{"index":18,"fightId":"1562409641898_187","id":2}}{"module":"fight","act":"makeMove","param":{"index":18,"fightId":"1562409641898_187","id":2}}{"module":"fight","act":"makeMove","param":{"index":18,"fightId":"1562409641898_187","id":2}}';//{\"module\":\"fight\",\"act\":\"makeMove\",\"param\":{\"index\":6,\"hp\":94.5,\"maxhp\":420,\"fightId\":\"1562409641898_187\",\"id\":2}}{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 15, \"stun\": 0, \"fightId\": \"1562409641898_187\", \"id\": 1}}{\"module\":\"fight\",\"act\":\"makeMove\",\"param\":{\"index\":18,\"fightId\":\"1562409641898_187\",\"id\":2}}{\"module\":\"fight\",\"act\":\"makeMove\",\"param\":{\"index\":6,\"hp\":94.5,\"maxhp\":420,\"fightId\":\"1562409641898_187\",\"id\":2}}{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 15, \"stun\": 0, \"fightId\": \"1562409641898_187\", \"id\": 1}}';
	
	//var s = argument[0], d = argument[1];
	//var rl = global.string_split_list;
	//var p = string_pos(d, s), o = 1;
	//var dl = string_length(d);
	//ds_list_clear(rl);
	//if (dl) while (p) {
	//    ds_list_add(rl, string_copy(s, o, p - o));
	//    o = p + dl;
	//    p = string_pos_ext(d, s, o);
	//}
	//ds_list_add(rl, string_delete(s, 1, o - 1));
	//// create an array and store results:
	//var rn = ds_list_size(rl);
	//var rw = array_create(rn);
	//for (p = 0; p < rn; p++) rw[p] = rl[|p];
	////return rw;
	//module_str = @'{"m';
	//json_txt   = @'{"module":"fight","act":"makeMove","param":{"index":18,"fightId":"1562409641898_187","id":2}}{"module":"fight","act":"makeMove","param":{"index":18,"fightId":"1562409641898_187","id":2}}{"module":"fight","act":"makeMove","param":{"index":18,"fightId":"1562409641898_187","id":2}}'; //{\"module\":\"fight\",\"act\":\"makeMove\",\"param\":{\"index\":6,\"hp\":94.5,\"maxhp\":420,\"fightId\":\"1562409641898_187\",\"id\":2}}{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 15, \"stun\": 0, \"fightId\": \"1562409641898_187\", \"id\": 1}}{\"module\":\"fight\",\"act\":\"makeMove\",\"param\":{\"index\":18,\"fightId\":\"1562409641898_187\",\"id\":2}}{\"module\":\"fight\",\"act\":\"makeMove\",\"param\":{\"index\":6,\"hp\":94.5,\"maxhp\":420,\"fightId\":\"1562409641898_187\",\"id\":2}}{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 15, \"stun\": 0, \"fightId\": \"1562409641898_187\", \"id\": 1}}';
	//json_count = string_count(module_str, json_txt);
	//json_txt  += module_str;
	//test_txt = "count:" + string(json_count);
	//for(i = 1; i <= json_count; i++)
	//{
	//	json_txt     = string_delete(json_txt, 1, string_length(module_str));
	//	json_str     = string_pos(module_str, json_txt) - 1;
	//	json_need[i] = module_str + string_copy(json_txt, 1, json_str);
	//	json_txt     = string_delete(json_txt, 1, json_str);
	//	test_txt    += "\nstr" + string(i) + ":" + string(json_need[i]);
	//}
	//@'odule":"fight","act":"makeMove","param":{"index":18,"fightId":"1562409641898_187","id":2}}{"module":"fight","act":"makeMove","param":{"index":18,"fightId":"1562409641898_187","id":2}}{"module":"fight","act":"makeMove","param":{"index":18,"fightId":"1562409641898_187","id":2}}{"m'
	//draw_text(mouse_x, mouse_y, test_txt + "\n\n" + string(string_length(module_str)));
	//draw_text(mouse_x, mouse_y, json_need[1] + "\n" + json_need[2] + "\n" + json_need[3] + "\n" + json_need[4] + "\n" + json_need[5]); //test_txt);
#endregion
}
if 0
{
	#region Этап 0: Поиск, Выбор темы
		if stage = 0
		{
			if global.fight = 0
			{
				if searching = 0
				{
					draw_text(room_width / 2, room_height / 2, "Начать поиск");
				}
				else
				{
					draw_text(room_width / 2, room_height / 2, "Ищем противника...");
					draw_text(room_width / 2, room_height / 2 + 128, "[Отменить поиск]");
				}
		
				if waiting = 1
				{
					draw_text(room_width / 2, room_height / 2 + 144, "(Долго ждём...)");
				}
			}
			else
			{
				if round_num = 1
				{
					if global.myid = first_p
					{
						draw_text(room_width / 4, room_height / 2, "[ТЕМА №" + string(theme[1]) + "]");
						draw_text(room_width / 2, room_height / 2, "[ТЕМА №" + string(theme[2]) + "]");
						draw_text(room_width / 4 * 3, room_height / 2, "[ТЕМА №" + string(theme[3]) + "]");
					}
					else
					{
						draw_set_alpha(0.5);
							draw_text(room_width / 4, room_height / 2, "[ТЕМА №" + string(theme[1]) + "]");
							draw_text(room_width / 2, room_height / 2, "[ТЕМА №" + string(theme[2]) + "]");
							draw_text(room_width / 4 * 3, room_height / 2, "[ТЕМА №" + string(theme[3]) + "]");
						draw_set_alpha(1);
				
						draw_text(room_width / 2, room_height / 2 + 40, "Противник выбирает тему...");
					}
				}
				if round_num = 2
				{
					if global.enid = first_p
					{
						if theme_r[1] = 1
						{
							draw_text(room_width / 3, room_height / 2, "[ТЕМА №" + string(theme[2]) + "]");
							draw_text(room_width / 3 * 2, room_height / 2, "[ТЕМА №" + string(theme[3]) + "]");
						}
						if theme_r[1] = 2
						{
							draw_text(room_width / 3, room_height / 2, "[ТЕМА №" + string(theme[1]) + "]");
							draw_text(room_width / 3 * 2, room_height / 2, "[ТЕМА №" + string(theme[3]) + "]");
						}
						if theme_r[1] = 3
						{
							draw_text(room_width / 3, room_height / 2, "[ТЕМА №" + string(theme[1]) + "]");
							draw_text(room_width / 3 * 2, room_height / 2, "[ТЕМА №" + string(theme[2]) + "]");
						}
					}
					else
					{
						draw_set_alpha(0.5);
							if theme_r[1] = 1
							{
								draw_text(room_width / 3, room_height / 2, "[ТЕМА №" + string(theme[2]) + "]");
								draw_text(room_width / 3 * 2, room_height / 2, "[ТЕМА №" + string(theme[3]) + "]");
							}
							if theme_r[1] = 2
							{
								draw_text(room_width / 3, room_height / 2, "[ТЕМА №" + string(theme[1]) + "]");
								draw_text(room_width / 3 * 2, room_height / 2, "[ТЕМА №" + string(theme[3]) + "]");
							}
							if theme_r[1] = 3
							{
								draw_text(room_width / 3, room_height / 2, "[ТЕМА №" + string(theme[1]) + "]");
								draw_text(room_width / 3 * 2, room_height / 2, "[ТЕМА №" + string(theme[2]) + "]");
							}
						draw_set_alpha(1);
					
						draw_text(room_width / 2, room_height / 2 + 40, "Противник выбирает тему...");
					}
				}
			}
		}
	#endregion
	#region Этап 1: Готовность
		if stage = 1
		{
			draw_text(room_width / 2, room_height / 2, "Время до начала: " + string(time_start));
		}
	#endregion
	#region Этап 2: Дуэль
		if stage = 2
		{
			draw_rectangle(16, room_height - 32, 16 + (room_width / 2 - 16 * 2) * (hp[global.myid] / hp_max[global.myid]), room_height - 16, 0);
			draw_text(16 * 3, room_height - 48, "ХП:" + string(hp[global.myid]) + "/" + string(hp_max[global.myid]));
		
			draw_rectangle(room_width - 16, room_height - 32, room_width - 16 - (room_width / 2 - 16 * 2) * (hp[global.enid] / hp_max[global.enid]), room_height - 16, 0);
			draw_text(room_width - 16 * 3, room_height - 48, "ХП:" + string(hp[global.enid]) + "/" + string(hp_max[global.enid]));
		
			var dmg_t;
			dmg_t = "";
		
			if show_dmg[global.myid] = 1
			{
				dmg_t = "ВЕРНО";
			}
			if show_dmg[global.myid] = 0
			{
				dmg_t = "НЕВЕРНО";
			}
			draw_text_color(room_width / 4, room_height / 2, string(dmg_t), c_white, c_white, c_white, c_white, (show_tim[global.myid] / (room_speed * 2)));
		
			dmg_t = "";
			if show_dmg[global.enid] = 1
			{
				dmg_t = "ВЕРНО";
			}
			if show_dmg[global.enid] = 0
			{
				dmg_t = "НЕВЕРНО";
			}
			draw_text_color(room_width * 3 / 4, room_height / 2, string(dmg_t), c_white, c_white, c_white, c_white, (show_tim[global.enid] / (room_speed * 2)));
		}
	
		if stage > 0
		{
			draw_text(room_width / 2, room_height / 2 - 96, "Выбранная тема: " + string(theme[theme_r[round_num]]));
			draw_text(room_width / 2, room_height / 2 - 96 + 16, "Вопрос: " + string(question[global.myid]));
			draw_text(room_width / 2, room_height / 2 - 96 + 32, "Раунд: " + string(round_num));
		
			var skul_t;
			skul_t = "";
			for(i = 1; i <= 3; i ++)
			{
				if skul[i] = -1
				{
					skul_t += "⚪";
				}
				else
				{
					if skul[i] = global.myid
					{
						skul_t += "⚫";
					}
					else
					{
						skul_t += "ø";
					}
				}
			}
			draw_text(room_width / 2, room_height / 2 - 96 + 48, "Результаты: " + skul_t);
		}
	#endregion
	#region Этап 3: Финал
		if stage = 3
		{
			var result_t;
			result_t = "";
		
			if winner = global.myid
			{
				result_t = "Красава, Уважение!";
			}
			else
			{
				result_t = "Лох! Не осилил.";
			}
		
			draw_text(room_width / 2, room_height / 2, result_t);
			draw_text(room_width / 2, room_height / 2 + 48, "[Выйти в меню]");
		}
	#endregion
}
#region	Шрифт
	draw_set_font(global.game_font);
#endregion