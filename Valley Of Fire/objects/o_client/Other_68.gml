var type, buffer;
type = ds_map_find_value(async_load, "type");
if type = network_type_data
{
	buffer = ds_map_find_value(async_load, "buffer");
	txt    = buffer_read(buffer, buffer_string);
	
	var json   = json_decode(txt);
	
	var module = json[? "module"];
	var act    = json[? "act"];
	var param  = json[? "param"];
	
	switch(module)
	{
		#region authotization
		case "authorization":
			switch(act)
			{
				#region getNews
				case "getNews":
					var er_code = param[? "error_code"];
					var news    = param[? "news"];
					
					global.text[1]   = module;
					global.text[2]   = act;
					global.text[3,1] = er_code;
					global.text[3,2] = news;
					global.text[3,3] = "-";
				break;
				#endregion
			}
		break;
		#endregion
		#region fight
		case "fight":
			switch(act)
			{
				#region getId
				case "getId":
					var g_id  = param[? "id"];
					var f_id = param[? "fightId"];
					
					global.text[1]   = module;
					global.text[2]   = act;
					global.text[3,1] = g_id;
					global.text[3,2] = "-";
					global.text[3,3] = f_id;
					
					global.myid = g_id;
					if global.myid = 1
					{
						global.enid = 2;
					}
					else
					{
						global.enid = 1;
					}
					global.f_id = f_id;
					
					buffer_seek(buffer_c, buffer_seek_start, 0);
					buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"getFight\", \"param\": {\"fightId\": \"" + string(f_id) + "\"}}");
					network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
					
					need_f = room_speed;
				break;
				#endregion
				#region getFight
				case "getFight":
					var start    = param[? "start"];
					var player1  = param[? "player1"];
					var player2  = param[? "player2"];
					var totem1   = player1[? "totem"];
					var totem2   = player2[? "totem"];
					
					back       = param[? "back"];
					first_p    = param[? "first_player"];
					
					rank[1]    = player1[? "rank"];
					level[1]   = player1[? "level"];
					hero[1]    = player1[? "hero"];
					
					/// НЕТ
						hp[1]      = 100 + 20 * hero[1];
						hp_max[1]  = hp[1];
						need_hp[1] = hp[1];
						atk[2]     = round(hp[1] / 7);
					/// НЕТ
					for (i = 0; i < ds_list_size(totem1); i ++)
					{
						totems[1,i+1] = totem1[| i];
					}
					
					rank[2]    = player2[? "rank"];
					level[2]   = player2[? "level"];
					hero[2]    = player2[? "hero"];
					/// НЕТ
						hp[2]      = 100 + 20 * hero[2];
						hp_max[2]  = hp[2];
						need_hp[2] = hp[2];
						atk[1]     = round(hp[2] / 7);
					/// НЕТ
					for (i = 0; i < ds_list_size(totem2); i ++)
					{
						totems[2, i + 1] = totem2[| i];
					}
					/// НЕТ
						need_f       = -1;
						waiting      = 0;
						searching    = 0;
					/// НЕТ
					if instance_exists(o_control)
					{
						with(o_control)
						{
							instance_destroy();
						}
					}
					instance_create_depth(0, 0, -1, o_control);
					global.e_totem[1] = totems[global.enid,1];
					global.e_totem[2] = totems[global.enid,2];
					global.e_totem[3] = totems[global.enid,3];
					global.fight = 1;
				break;
				#endregion
				#region makeMove
				case "makeMove":
					index = param[? "index"];
				break;
				#endregion
				#region autoWin
				case "autoWin":
					winner = global.myid;
					stage  = 3;
				break;
				#endregion
				#region playWithBot
				case "playWithBot":
					waiting = 1;
				break;
				#endregion
			}
		break;
		#endregion
	}
	if index != -1
	{
		switch(index)
		{
			#region Получение тем
				case 1:
					if rearr = 0
					{
						if instance_exists(o_list)
						{
							o_list.theme_t[1]  = param[? "theme1"];
							o_list.theme_t[2]  = param[? "theme2"];
							o_list.theme_t[3]  = param[? "theme3"];
							o_list.theme_nn[1] = global.theme_name[o_list.theme_t[1]];
							o_list.theme_nn[2] = global.theme_name[o_list.theme_t[2]];
							o_list.theme_nn[3] = global.theme_name[o_list.theme_t[3]];
							rearr = 1;
						}
					}
					buffer_seek(buffer_c, buffer_seek_start, 0);
					buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 5" + ",\"fightId\": \"" + string(global.f_id) + "\"}}");
					network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
				break;
			#endregion
			#region Готовность
				case 2:
					ready[global.enid] = param[? "ready"];
				break;
			#endregion
			#region Выбранные темы
				case 3:
					theme_r[1] = param[? "theme_r1"];
					theme_r[2] = param[? "theme_r2"];
					theme_r[3] = param[? "theme_r3"];
					if instance_exists(o_list)
					{
						o_list.theme_click = theme_r[global.rounds];
						o_list.theme_g = 1;
						if global.sound = 1
						{
							audio_play_sound(sd_text, 2, 0);
						}
						o_list.theme_round[global.rounds] = o_list.theme_t[theme_r[global.rounds]];
					}
				break;
			#endregion
			#region Ответ
				case 4:
					answer[global.enid]   = param[? "answer"];
					question[global.enid] = param[? "question"];
					task[global.enid]     = param[? "task"];
					
					global.bot_answer   = answer[global.enid];
					o_list.bot_question = question[global.enid];
					o_list.bot_task     = task[global.enid];
				break;
			#endregion
			#region Досылка темы
				case 5:
					rearr = 1;
				break;
			#endregion
			#region Синхронизация хп
				case 6:
					o_list.hp = param[? "hp"];
				break;
			#endregion
			#region Игрок закончил действовать в раунде
				case 8:
					if o_list.player_end[global.myid] = 0
					{
						o_list.faster_id = global.enid;
					}
					o_list.player_end[global.enid] = param[? "player_end"];
				break;
			#endregion
			#region Синхронизация задач
				case 9:
					o_list.round_task[global.rounds,1] = param[? "task1"];
					o_list.round_task[global.rounds,2] = param[? "task2"];
					o_list.round_task[global.rounds,3] = param[? "task3"];
				break;
			#endregion
		}
		index = -1;
	}
	ping_go = 0;
}