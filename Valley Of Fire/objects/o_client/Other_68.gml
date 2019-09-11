var type, buffer;
type = ds_map_find_value(async_load, "type");
if type = network_type_data
{
	buffer = ds_map_find_value(async_load, "buffer");
	txt    = buffer_read(buffer, buffer_string);
	var json_txt, json_str, module_str;
	var json, module, act, param;
	module_str = @'{"module';
	json_txt   = string(txt);
	json_count = string_count(module_str, json_txt);
	json_txt  += module_str;
	for(i = 1; i <= json_count; i++)
	{
		json_txt     = string_delete(json_txt, 1, string_length(module_str));
		json_str     = string_pos(module_str, json_txt) - 1;
		json_need[i] = module_str + string_copy(json_txt, 1, json_str);
		json_txt     = string_delete(json_txt, 1, json_str);
		#region Синхронизация 
			json   = json_decode(json_need[i]);
			module = json[? "module"];
			act    = json[? "act"];
			param  = json[? "param"];
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
									global.fight = 1;
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
									if instance_exists(o_list)
									{
										global.game_stage   = 5;
										o_list.autowin      = 1;
										o_list.whowin       = 1;
										o_list.theme_choose = 9;
										global.idol[1]		= 0;
										global.idol[2]		= 0;
										global.idol[3]		= 0;
									}
								break;
							#endregion
							#region autoLose
								case "autoLose":
									winner = global.enid;
									stage  = 3;
									if instance_exists(o_list)
									{
										global.game_stage   = 5;
										o_list.autolose     = 1;
										o_list.whowin       = 2; //1;
										o_list.theme_choose = 9;
										global.idol[1]		= 0;
										global.idol[2]		= 0;
										global.idol[3]		= 0;
									}
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
			if index != -1 && instance_exists(o_list)
			{
				switch(index)
				{
					#region Получение тем
						case 1:
							if instance_exists(o_list)
							{
								o_list.theme_t[1]  = param[? "theme1"];
								o_list.theme_t[2]  = param[? "theme2"];
								o_list.theme_t[3]  = param[? "theme3"];
								o_list.theme_nn[1] = global.theme_name[o_list.theme_t[1]];
								o_list.theme_nn[2] = global.theme_name[o_list.theme_t[2]];
								o_list.theme_nn[3] = global.theme_name[o_list.theme_t[3]];
								rearr = 1;
								dosul = 1;
							}
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
							if instance_exists(o_list)
							{
								o_list.bot_question = question[global.enid];
								o_list.bot_task     = task[global.enid];
							}
							if json_count > 1
							{
								if global.bot_answer = 1
								{
									enemy_deal();
								}
								global.bot_answer = -1;
							}
						break;
					#endregion
					#region Досылка темы
						case 5:
							rearr = 1;
						break;
					#endregion
					#region Синхронизация хп
						case 6:
							if instance_exists(o_list)
							{
								o_list.hp	 = param[? "hp"];
								o_list.maxhp = param[? "maxhp"];
							}
						break;
					#endregion
					#region Игрок закончил действовать в раунде
						case 8:
							if instance_exists(o_list)
							{
								if o_list.player_end[global.myid] != 1
								{
									o_list.faster_id = global.enid;
								}
								o_list.player_end[global.enid] = 1; //param[? "player_end"];
							}
						break;
					#endregion
					#region Синхронизация задач
						case 9:
							if instance_exists(o_list)
							{
								o_list.round_task[global.rounds,1] = param[? "task1"];
								o_list.round_task[global.rounds,2] = param[? "task2"];
								o_list.round_task[global.rounds,3] = param[? "task3"];
								o_list.pepa = "PRINIAL";
							}
						break;
					#endregion
					#region Игрок закончил раунд
						case 10:
							if instance_exists(o_list)
							{
								o_list.hp		 = param[? "hp"];
								o_list.maxhp	 = param[? "maxhp"];
								//o_list.round_end = 2;
								o_list.round_end_dop = 1;
							}
							//global.player_name = "PIDORAS_" + string(global.myid);
						break;
					#endregion
					#region Синхронизация итогов раунда
						case 11:
							if instance_exists(o_list)
							{
								if o_list.roundskul[param[? "rounds"]] = param[? "roundskul"]
								{
									if global.enid = first_p
									{
										o_list.roundskul[param[? "rounds"]] = 3 - param[? "roundskul"];
									}
								}
							}
						break;
					#endregion
					#region Игра окончена
						case 12:
							if instance_exists(o_list)
							{
								if o_list.whowin = 0
								or (o_list.whowin = param[? "whowin"] && global.enid = first_p)
								{
									o_list.roundskul[1] = 3 - param[? "rskul1"];
									o_list.roundskul[2] = 3 - param[? "rskul2"];
									o_list.roundskul[3] = 3 - param[? "rskul3"];
									o_list.whowin = 3 - param[? "whowin"];
									o_list.theme_choose = 9;
								}
							}
						break;
					#endregion
					#region Получение имени врага и рандом тотемов
						case 13:
							global.enemy_name = param[? "enemy_name"];
							if instance_exists(o_list)
							{
								o_list.totem_ran_frog[global.enid]     = param[? "frog"];
								o_list.totem_ran_rat[global.enid]      = param[? "rat"];
								o_list.totem_ran_panther[global.enid]  = param[? "panther"];
								o_list.totem_ran_bull[global.enid]     = param[? "bull"];
								o_list.totem_ran_evasive[global.enid]  = param[? "evasive"];
								o_list.totem_ran_pig[global.enid]      = param[? "pig"];
								o_list.totem_ran_pig_num[global.enid]  = param[? "pig_num"];
								o_list.totem_ran_frog_num[global.enid] = param[? "frog_num"];
								o_list.idol_wind[global.enid]          = param[? "idol_wind"];
								if first_p = global.enid
								{
									o_list.idols_random = param[? "idols"];
								}
							}
							nameg2 = 1;
							nameg2_time = 3;
							
							zhopanegra = 1;
							zhopanegra2 = string_upper(param[? "enemy_name"]);
						break;
					#endregion
					#region Получение стана врага (1, с ответом)
						case 14:
							answer[global.enid]   = param[? "answer"];
							question[global.enid] = param[? "question"];
							task[global.enid]     = param[? "task"];
							global.bot_answer   = answer[global.enid];
							o_list.bot_question = question[global.enid];
							o_list.bot_task     = task[global.enid];
							(global.enemy_object).stun = 1;
							if json_count > 1
							{
								if global.bot_answer = 1
								{
									enemy_deal();
								}
								global.bot_answer = -1;
								(global.enemy_object).stun = 0;
							}
						break;
					#endregion
					#region Получение стана врага (0)
						case 15:
							(global.enemy_object).stun = 0; //(global.enemy_object).answer = -1; //param[? "stun"];
						break;
					#endregion
					#region Тотем: стан
						case 16:
							o_list.totem_show_n[2] = 8; //param[? "stun"];
						break;
					#endregion
					#region Имя и тотемы пришли
						case 17:
							o_list.nameg_need = 0;
						break;
					#endregion
					#region Супер
						case 18:
							//o_list.test_zhepa = 1;
							//if o_list.enemy_super != 1
							//{
							//	o_list.enemy_super = 1;
							//}
							//else
							if true
							{
								//o_list.test_zhepa = 2;
								var herr;
								if global.swipe_ability = 0
								{
									//o_list.test_zhepa = 3;
									herr = global.enemy_hero;
								}
								else
								{
									//o_list.test_zhepa = 4;
									herr = global.hero;
								}
								switch(herr)
								{
									#region Воришка
										case 1:
											if global.enemy_hero = 1
											{
												global.swipe_ability = 1;
												o_list.super_need = 3 - global.p_totem_a[15];
												o_list.super_now1 = 3;
												//with(global.enemy_object)
												//{
													global.super_ability = 0;
													global.swipe_ability = 1;
													var enemy_now, enemy_need, player_now, player_need;
													enemy_now  = o_list.e_super_now;
													enemy_need = o_list.e_super_need;
													player_now  = o_list.super_now;
													player_need = o_list.super_need;
													o_list.super_now  = enemy_now;
													o_list.super_need = enemy_need;
													o_list.e_super_now  = 0;
													o_list.e_super_need = 3 - global.e_totem_a[15];
													o_list.super_now1 = 0;
													o_list.super = 0;
												//}
											}
											else
											{
												//with(global.enemy_object)
												//{
													global.super_ability = 0;
													global.swipe_ability = 0;
													o_list.super_now1 = 0;
													var enemy_now, enemy_need, player_now, player_need;
													enemy_now   = o_list.e_super_now;
													enemy_need  = o_list.e_super_need;
													player_now  = o_list.super_now;
													player_need = o_list.super_need;
													o_list.super_now  = enemy_now;
													o_list.super_need = enemy_need;
													o_list.e_super_now  = 0;
													o_list.e_super_need = 3 - global.e_totem_a[15];
												//}
											}
										break;
									#endregion
									#region Джо
										case 2:
											enemy_deal();
											(global.player_object).stun = 1;
										break;
									#endregion
									#region Охотница
										case 3:
											global.super_ability1 = 1;
											(global.enemy_object).huntress_poison = 1;
										break;
									#endregion
									#region Диего
										case 4:
											(global.enemy_object).diego_dynamit = 1;
											if (global.enemy_object).hero = 4
											{
												global.super_ability = 1;
												(global.enemy_object).change = 3;
												with(global.enemy_object)
												{
													skeleton_animation_set("super");
												}
											}
										break;
									#endregion
									#region Билл
										case 5:
											//o_list.test_zhepa = 5;
											global.bill_abil  = 10 * room_speed;
											//with(global.enemy_object)
											//{
											//	super = 1;
											//	image_speed = spd_max;
											//	skeleton_animation_set("shoot");
											//	if hero = 5
											//	{
											//		change = 1;
											//	}
											//	else
											//	{
											//		change = 3;
											//	}
											//}
										break;
									#endregion
									#region Шериф
										case 6:
											global.e_critical = 3 - 1 * global.e_totem_a[3];
										break;
									#endregion
									#region Шаман
										case 7:
											(global.enemy_object).bolshaya_zhopa = 1;
										break;
									#endregion
								}
							}
						break;
					#endregion
				}
				index = -1;
			}
		#endregion
		json_need[i] = "";
	}
	if json_count > 4
	{
		if global.p_totem_a[8] != 1
		{
			(global.player_object).stun = 1;
		}
		else
		{
			o_list.totem_show_n[1] = 8;
		}
	}
	ping_go = 0;
}