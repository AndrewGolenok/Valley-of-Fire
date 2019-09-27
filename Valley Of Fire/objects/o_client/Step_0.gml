#region Последний стейдж
	//if ls_stage != 0
	//{
	//	if ls_stage = cl_stage[1]
	//	{
	//		if cl_stage[1] != 5
	//		{
	//			cl_stage[1] = 0;
	//		}
	//	}
	//	else
	//	{
	//		ls_stage = 0;
	//	}
	//}
	//else
	//{
	//	ls_stage = cl_stage[1];
	//}
#endregion
#region Игрок начинает поиск
	if cl_stage[1] = 1
	{
		buffer_seek(buffer_c, buffer_seek_start, 0);
		buffer_write(buffer_c, buffer_text, "{\"module\": \"authorization\", \"act\": \"search\", \"param\": {\"version\": " + string(global.vers) + ", \"level\": " + string(o_menu.hero_lvl[global.hero]) + ", \"rank\": " + string(global.player_rank) + ", \"hero\": " + string(global.hero) + ", \"totem\": [" + string(global.p_totem[1]) + "," + string(global.p_totem[2]) + "," + string(global.p_totem[3]) + "]}}");
		network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
		cl_stage[1] = 0;
	}
#endregion
#region Игрок отменяет поиск
	if cl_stage[2] = 1//cl_stage[1] = 2
	{
		buffer_seek(buffer_c, buffer_seek_start, 0);
		buffer_write(buffer_c, buffer_text, "{\"module\": \"authorization\", \"act\": \"stopSearch\", \"param\": {\"version\": " + string(global.vers) + "}}");
		network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
		cl_stage[2] = 0;
	}
#endregion
if global.fight
{
	#region Передача имени 1 (подтвр)
		if nameg2 = 1
		{
			if nameg2_time > 0
			{
				nameg2_time --;
			}
			else
			{
				if 1//cl_stage[1] = 0
				{
					buffer_seek(buffer_c, buffer_seek_start, 0);
					buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 17, \"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
					network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
					nameg2 = 2;
				}
			}
		}
	#endregion
	#region Передача имени 2 (передача имени и тотемов)
		if instance_exists(o_list)
		{
			if nameg = 1 && o_list.nameg_need = 1// && cl_stage[1] = 0
			{
				buffer_seek(buffer_c, buffer_seek_start, 0);
				buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 13, \"enemy_name\": \"" + global.player_name + "\", \"bull\": \"" + string(o_list.totem_ran_bull[global.myid]) + "\", \"evasive\": \"" + string(o_list.totem_ran_evasive[global.myid]) + "\", \"pig\": \"" + string(o_list.totem_ran_pig[global.myid]) + "\", \"pig_num\": \"" + string(o_list.totem_ran_pig_num[global.myid]) + "\", \"frog\": \"" + string(o_list.totem_ran_frog[global.myid]) + "\", \"frog_num\": \"" + string(o_list.totem_ran_frog_num[global.myid]) + "\", \"rat\": \"" + string(o_list.totem_ran_rat[global.myid]) + "\", \"panther\": \"" + string(o_list.totem_ran_panther[global.myid]) + "\", \"idols\": \"" + string(o_list.idols_random) + "\", \"idol_wind\": \"" + string(o_list.idol_wind[global.myid]) + "\", \"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
				network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
				nameg = 2;
			}
		}
	#endregion
	#region Досылка темы
		if dosul = 1// && cl_stage[1] = 0
		{
			buffer_seek(buffer_c, buffer_seek_start, 0);
			buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 5" + ",\"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
			network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
			dosul = 2;
		}
	#endregion
	#region Рандом темы у первого игрока - отправка второму игроку
		if  instance_exists(o_list) && cl_stage[3] = 1//cl_stage[1] = 3
		{
			buffer_seek(buffer_c, buffer_seek_start, 0);
			buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 1, \"theme1\": " + string(o_list.theme_t[1]) + ",\"theme2\": " + string(o_list.theme_t[2]) + ",\"theme3\": " + string(o_list.theme_t[3]) + ",\"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
			network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
			rearr_t     = room_speed;
			rearr       = 0;
			cl_stage[3] = 0;
		}
		if rearr = 0 && global.myid = first_p
		{
			if rearr_t > 0
			{
				rearr_t --;
			}
			else
			{
				buffer_seek(buffer_c, buffer_seek_start, 0);
				buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 1, \"theme1\": " + string(o_list.theme_t[1]) + ",\"theme2\": " + string(o_list.theme_t[2]) + ",\"theme3\": " + string(o_list.theme_t[3]) + ",\"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
				network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
				rearr_t = room_speed;
			}
		}
	#endregion
	#region Выбор темы игроком
		if go_theme = 1 or cl_stage[4] = 1 //cl_stage[1] = 4// or go_theme = 1
		{
			buffer_seek(buffer_c, buffer_seek_start, 0);
			buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 3, \"theme_r1\": " + string(theme_r[1]) + ",\"theme_r2\": " + string(theme_r[2]) + ",\"theme_r3\": " + string(theme_r[3]) + ",\"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
			network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
			cl_stage[4] = 0;
			go_theme = 0;
		}
	#endregion
	#region Готовность
		if cl_stage[5] = 1//cl_stage[1] = 5
		{
			if ready[global.myid] = 1 && ready[global.enid] = 1
			{
				o_list.theme_choose = 3;
				cl_stage[5] = 0;
			}
			if ready[global.myid] = 0 && rearr = 1
			{
				buffer_seek(buffer_c, buffer_seek_start, 0);
				buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 2, \"ready\": 1,\"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
				network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
				ready[global.myid] = 1;
			}
		}
	#endregion
	#region Синхронизация хп
		if cl_stage[6] = 1 //cl_stage[1] = 6
		{
			buffer_seek(buffer_c, buffer_seek_start, 0);
			buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 6, \"hp\": " + string(o_list.e_hp) + ", \"maxhp\": " + string(o_list.e_maxhp) + ",\"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
			network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
			cl_stage[6] = 0;
		}
	#endregion
	#region Передача ответа
		if cl_stage[7] = 1 //cl_stage[1] = 7
		{
			buffer_seek(buffer_c, buffer_seek_start, 0);
			buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 4, \"answer\": " + string(answer[global.myid]) + ",\"question\": " + string(question[global.myid]) + ",\"task\": " + string(task[global.myid]) + ",\"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
			network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
			cl_stage[7] = 0;
		}
	#endregion
	#region Синхронизация окончания раунда
		if cl_stage[8] = 1 //cl_stage[1] = 8
		{
			o_list.pepa += "OT8 "; //o_list.pepa += "3 ";
			buffer_seek(buffer_c, buffer_seek_start, 0);
			buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 8, \"player_end\": 1, \"faster_id\": " + string(o_list.faster_id) + ", \"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
			network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
			cl_stage[8] = 0;
		}
	#endregion
	#region Синхронизация задач
		if cl_stage[9] = 1 //cl_stage[1] = 9
		{
			buffer_seek(buffer_c, buffer_seek_start, 0);
			buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 9, \"task1\": " + string(o_list.round_task[global.rounds,1]) + ", \"task2\": " + string(o_list.round_task[global.rounds,2]) + ", \"task3\": " + string(o_list.round_task[global.rounds,3]) + ",\"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
			network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
			cl_stage[9] = 0;
		}
	#endregion
	#region Синхронизация окончания раунда 2
		if cl_stage[10] = 1 //cl_stage[1] = 10
		{
			o_list.pepa += "OT9 "; //o_list.pepa += "13 ";
			buffer_seek(buffer_c, buffer_seek_start, 0);
			buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 10, \"hp\": " + string(o_list.e_hp) + ", \"maxhp\": " + string(o_list.e_maxhp) + ",\"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
			network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
			cl_stage[10] = 0;
		}
	#endregion
	#region Синхронизация итогов раунда
		if cl_stage[11] = 1 //cl_stage[1] = 11
		{
			//o_list.pepa += "7 ";
			buffer_seek(buffer_c, buffer_seek_start, 0);
			buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 11, \"roundskul\": " + string(o_list.roundskul[global.rounds]) + ", \"rounds\": " + string(global.rounds) + ",\"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
			network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
			cl_stage[11] = 0;
		}
	#endregion
	#region Конец дуэли
		if cl_stage[12] = 1 //cl_stage[1] = 12
		{
			buffer_seek(buffer_c, buffer_seek_start, 0);
			buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 12, \"whowin\": " + string(o_list.whowin) + ", \"rskul1\": \"" + string(o_list.roundskul[1]) + ", \"rskul2\": \"" + string(o_list.roundskul[2]) + ", \"rskul3\": \"" + string(o_list.roundskul[3]) + ", \"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
			network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
			cl_stage[12] = 0;
		}
	#endregion
	#region Передача стана: есть стан (с передачей ответа)
		if cl_stage[14] = 1 //cl_stage[1] = 14
		{
			buffer_seek(buffer_c, buffer_seek_start, 0);
			buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 14, \"answer\": " + string(answer[global.myid]) + ",\"question\": " + string(question[global.myid]) + ",\"task\": " + string(task[global.myid]) + ",\"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
			network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
			cl_stage[14] = 0;
			//buffer_seek(buffer_c, buffer_seek_start, 0);
			//buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 14, \"stun\": 1, \"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
			//network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
			//cl_stage[1] = 0;
		}
	#endregion
	#region Передача стана: стана нет
		if cl_stage[15] = 1 //cl_stage[1] = 15
		{
			buffer_seek(buffer_c, buffer_seek_start, 0);
			buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 15, \"stun\": 0, \"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
			network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
			cl_stage[15] = 0;
		}
	#endregion
	#region Тотем: стан
		if cl_stage[16] = 1 //cl_stage[1] = 16
		{
			buffer_seek(buffer_c, buffer_seek_start, 0);
			buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 16, \"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
			network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
			cl_stage[16] = 0;
		}
	#endregion
	#region Супер
		if cl_stage[18] = 1 //cl_stage[1] = 18
		{
			buffer_seek(buffer_c, buffer_seek_start, 0);
			buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 18, \"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
			network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
			cl_stage[18] = 0;
			//o_list.super_ii += "6\n";
		}
	#endregion
	#region Автолуз
		if cl_stage[19] = 1 //cl_stage[1] = 19
		{
			buffer_seek(buffer_c, buffer_seek_start, 0);
			buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 19, \"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
			network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
			cl_stage[19] = 0;
		}
	#endregion
	#region А
		if cl_stage[1] = 1000
		{
		
			cl_stage[1] = 0;
		}
	#endregion
	
	#region Проверка
		if instance_exists(o_list)
		{
			if o_list.player_end[global.myid] != 0 && o_list.whowin = 0
			{
				autolose_time += 1;
				if autolose_time = room_speed * 15
				{
					o_client.winner = global.myid;
					o_client.stage  = 3;
					if instance_exists(o_list)
					{
						global.game_stage   = 5;
						o_list.autowin      = 1;
						o_list.whowin       = 1;
						o_list.theme_choose = 9;
						global.idol[1]		= 0;
						global.idol[2]		= 0;
						global.idol[3]		= 0;
						global.idol_h[1]	= -1;
						global.idol_h[2]	= -1;
						global.idol_h[3]	= -1;
					}
					o_client.cl_stage[19] = 1; //o_client.cl_stage[1] = 19;
				}
			}
		}
	#endregion
}
if 0
{
	///////////
	#region Пинг
		if ping_go
		{
			ping_time += 1;
		}
		if ping_time > ping_max
		{
			ping_max = ping_time;
		}
	#endregion
	#region Этап 0: Поиск, Выбор темы
		if stage = 0
		{
			if global.fight = 1
			{
				if global.myid = first_p
				{
					if theme[1] = -1
					{
						theme[1] = hero[global.myid];
						theme[2] = hero[global.enid];
						theme[3] = irandom_range(1, 8);
				
						buffer_seek(buffer_c, buffer_seek_start, 0);
						buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 1, \"theme1\": " + string(theme[1]) + ",\"theme2\": " + string(theme[2]) + ",\"theme3\": " + string(theme[3]) + ",\"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
						network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
						
						rearr_t = room_speed;
					}
					else
					{
						if rearr = 0
						{
							if rearr_t > 0
							{
								rearr_t --;
							}
							else
							{
								buffer_seek(buffer_c, buffer_seek_start, 0);
								buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 1, \"theme1\": " + string(theme[1]) + ",\"theme2\": " + string(theme[2]) + ",\"theme3\": " + string(theme[3]) + ",\"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
								network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
						
								rearr_t = room_speed;
							}
						}
					}
				}
		
				if theme_r[round_num] = -1
				{
					if (global.myid = first_p && round_num = 1)
					or (global.enid = first_p && round_num = 2)
					or round_num = 3
					{
						if mouse_check_button_pressed(mb_left) && rearr = 1
						{
							if round_num = 1
							{
								if mouse_x < room_width / 3
								{
									theme_r[1] = 1;
								}
								if mouse_x >= room_width / 3
								&& mouse_x <= room_width * 2 / 3
								{
									theme_r[1] = 2;
								}
								if mouse_x > room_width * 2 / 3
								{
									theme_r[1] = 3;
								}
							}
					
							if round_num = 2
							{
								if theme_r[1] = 1
								{
									if mouse_x < room_width / 2
									{
										theme_r[2] = 2;
									}
									else
									{
										theme_r[2] = 3;
									}
								}
								if theme_r[1] = 2
								{
									if mouse_x < room_width / 2
									{
										theme_r[2] = 1;
									}
									else
									{
										theme_r[2] = 3;
									}
								}
								if theme_r[1] = 3
								{
									if mouse_x < room_width / 2
									{
										theme_r[2] = 1;
									}
									else
									{
										theme_r[2] = 2;
									}
								}
							}
							if round_num = 1 or round_num = 2
							{
								buffer_seek(buffer_c, buffer_seek_start, 0);
								buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 3, \"theme_r1\": " + string(theme_r[1]) + ",\"theme_r2\": " + string(theme_r[2]) + ",\"theme_r3\": " + string(theme_r[3]) + ",\"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
								network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
							}
						}
						else
						{
							if round_num = 3
							{
								if (theme_r[1] = 1 && theme_r[2] = 2)
								or (theme_r[1] = 2 && theme_r[2] = 1)
								{
									theme_r[3] = 3;
								}
								if (theme_r[1] = 1 && theme_r[2] = 3)
								or (theme_r[1] = 3 && theme_r[2] = 1)
								{
									theme_r[3] = 2;
								}
								if (theme_r[1] = 2 && theme_r[2] = 3)
								or (theme_r[1] = 3 && theme_r[2] = 2)
								{
									theme_r[3] = 1; 
								}
						
								buffer_seek(buffer_c, buffer_seek_start, 0);
								buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 3, \"theme_r1\": " + string(theme_r[1]) + ",\"theme_r2\": " + string(theme_r[2]) + ",\"theme_r3\": " + string(theme_r[3]) + ",\"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
								network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
							}
						}
					}
				}
				else
				{
					ready[1] = 0;
					ready[2] = 0;
					task[1] = 1;
					task[2] = 1;
					question[1] = 1;
					question[2] = 1;
			
					time_start = room_speed * 5;
					stage = 1;
				}
			if need_f != -1
				{
				if need_f > 0
					{ need_f --; }
					else
					{
					buffer_seek(buffer_c, buffer_seek_start, 0);
					buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"getFight\", \"param\": {\"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
					network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
			
					need_f = room_speed;
					}
				}
			}
			else
			{
				if mouse_check_button_pressed(mb_left)
				{
					if searching = 0
					{
						alarm[0] = 2;
					}
					else
					{
						if mouse_y > room_height / 2
						{
							buffer_seek(buffer_c, buffer_seek_start, 0);
							buffer_write(buffer_c, buffer_text, "{\"module\": \"authorization\", \"act\": \"stopSearch\", \"param\": {\"version\": " + string(global.vers) + "}}");
							network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
							searching = 0;
						}
					}
				}
			}
		}
	#endregion
	#region Этап 1: Готовность
	if stage = 1
		{
			if time_start > 0
			{
				time_start --;
			}
			else
			{
				if ready[global.myid] = 0
				{
					buffer_seek(buffer_c, buffer_seek_start, 0);
					buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 2, \"ready\": 1" + ",\"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
					network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
					ready[global.myid] = 1;
				}
				if ready[1] = 1 && ready[2] = 1
				{
					task[1]     = 1;
					question[1] = 1;
					task[2]     = 1;
					question[2] = 1;
			
					hp[1] = hp_max[1];
					hp[2] = hp_max[2];
					need_hp[1] = hp[1];
					need_hp[2] = hp[2];
			
					stage = 2;
				}
			}
		}
	#endregion
	#region Этап 2: Дуэль
		if stage = 2
		{
			if mouse_check_button_pressed(mb_left) && question[global.myid] < 9
			{
				if mouse_x < room_width / 2
				{
					answer[global.myid] = 1;
				}
				else
				{
					answer[global.myid] = 0;
				}
		
				question[global.myid] += 1;
		
				if question = 3 or question = 6
				{
					task[global.myid] += 1;
				}
		
				buffer_seek(buffer_c, buffer_seek_start, 0);
				buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 4, \"answer\": " + string(answer[global.myid]) + ",\"question\": " + string(question[global.myid]) + ",\"task\": " + string(task[global.myid]) + ",\"hp\": " + string(hp[global.enid]) + ",\"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
				network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
			}
	
			for(i = 1; i <= 2; i ++)
			{
				if answer[i] != -1
				{
					if answer[i] = 1
					{
						need_hp[!(i-1)+1] -= atk[i];
					}
					show_tim[i] = room_speed * 2;
					show_dmg[i] = answer[i];
					answer[i] = -1;
				}
				if show_dmg[i] != -1
				{
					if show_tim[i] > 0
					{
						show_tim[i] --;
					}
					else
					{
						show_tim[i] = 0;
						show_dmg[i] = -1;
					}
				}
		
				if hp[1] > need_hp[1]
				{
					hp[1] --;
				}
				if hp[2] > need_hp[2]
				{
					hp[2] --;
				}
			}
	
			if need_hp[1] <= 0 or need_hp[2] <= 0
			or (question[1] = 9 && question[2] = 9)
			{
				if need_hp[1] > need_hp[2]
				{
					skul[round_num] = 1;
				}
				else
				{
					skul[round_num] = 2;
				}
		
				if !((skul[1] = 1 && skul[2] = 1)
				or (skul[1] = 2 && skul[2] = 2)
				or (skul[3] != -1))
				{
					round_num ++;
					stage = 0;
				}
				else
				{
					if (skul[1] = 1 && skul[2] = 1)
					or (skul[1] = 1 && skul[2] = 2 && skul[3] = 1)
					or (skul[1] = 2 && skul[2] = 1 && skul[3] = 1)
					{
						winner = 1;
					}
					else
					{
						winner = 2;
					}
					if global.myid = 1
					{
						buffer_seek(buffer_c, buffer_seek_start, 0);
						buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"endFight\", \"param\": {\"fightId\": \"" + string(global.f_id) + "\", \"id\": " + string(global.myid) + "}}");
						network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));
					}
					stage = 3;
				}
			}
		}
	#endregion
	#region Этап 3: Финал
		if stage = 3
		{
			if mouse_check_button_pressed(mb_left) && mouse_y > room_height / 2
			{
				network_destroy(socket_c);
				buffer_delete(buffer_c);
				game_restart();
			}
		}
	#endregion
	///////////
}