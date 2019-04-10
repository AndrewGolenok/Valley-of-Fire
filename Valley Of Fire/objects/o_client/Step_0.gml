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
				buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 1, \"theme1\": " + string(theme[1]) + ",\"theme2\": " + string(theme[2]) + ",\"theme3\": " + string(theme[3]) + ",\"fightId\": \"" + string(global.f_id) + "\"}}");
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
						buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 1, \"theme1\": " + string(theme[1]) + ",\"theme2\": " + string(theme[2]) + ",\"theme3\": " + string(theme[3]) + ",\"fightId\": \"" + string(global.f_id) + "\"}}");
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
						buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 3, \"theme_r1\": " + string(theme_r[1]) + ",\"theme_r2\": " + string(theme_r[2]) + ",\"theme_r3\": " + string(theme_r[3]) + ",\"fightId\": \"" + string(global.f_id) + "\"}}");
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
						buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 3, \"theme_r1\": " + string(theme_r[1]) + ",\"theme_r2\": " + string(theme_r[2]) + ",\"theme_r3\": " + string(theme_r[3]) + ",\"fightId\": \"" + string(global.f_id) + "\"}}");
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
			buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"getFight\", \"param\": {\"fightId\": \"" + string(global.f_id) + "\"}}");
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
			buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 2, \"ready\": 1" + ",\"fightId\": \"" + string(global.f_id) + "\"}}");
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
		buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"makeMove\", \"param\": {\"index\": 4, \"answer\": " + string(answer[global.myid]) + ",\"question\": " + string(question[global.myid]) + ",\"task\": " + string(task[global.myid]) + ",\"hp\": " + string(hp[global.enid]) + ",\"fightId\": \"" + string(global.f_id) + "\"}}");
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
				buffer_write(buffer_c, buffer_text, "{\"module\": \"fight\", \"act\": \"endFight\", \"param\": {\"fightId\": \"" + string(global.f_id) + "\"}}");
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