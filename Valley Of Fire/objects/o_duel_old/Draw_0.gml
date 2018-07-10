/*
#region Лоадинг
	draw_set_alpha(alp);
	draw_rectangle_color(0,0,1280,1280,c_black,c_black,c_black,c_black,0);
	draw_set_alpha(1);
	
	if go<2
		{
		if go=1
			{
			if yb[1]<1280+90+200
				{ yb[1]+=40; }
				else
				{ go=2; }
			}

		ang=bul*60;
		if image_angle>ang
			{ image_angle-=2; }
		draw_sprite_ext(s_drum,0,640,yb[1],1,1,image_angle,c_white,1);
		for(i=1;i<=bul;i++)
			{
			yb[i]=yb[1];
			draw_sprite_ext(s_drum,i,640,yb[i],1,1,image_angle,c_white,1);
			}
	
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(f_loading);
		draw_set_color(c_white);
		if loading
			{ draw_text(640,yb[1]+240,"Searching opponent"+tt); }
			else
			{ draw_text(640,yb[1]+240,"Opponent found"); }
		}
#endregion
#region Листовки
	if go=2
		{
		draw_sprite(s_wanted,0,xl[1],yl[1]);
		draw_sprite(s_wanted,1,xl[2],yl[2]);
		
		/// Игрок
		draw_sprite(s_font,10,xl[1]-string_length(string(hr[1]))*34/2+5,yl[1]+122);
		for(i=1;i<=string_length(string(hr[1]));i++)
			{ draw_sprite(s_font,real(string_copy(string(hr[1]),i,1)),xl[1]-string_length(string(hr[1]))*34/2+i*34,yl[1]+122); }
		///
		
		/// Враг
		draw_sprite(s_font,10,xl[2]-string_length(string(hr[1]))*34/2+5,yl[2]+122);
		for(i=1;i<=string_length(string(hr[2]));i++)
			{ draw_sprite(s_font,real(string_copy(string(hr[2]),i,1)),xl[2]-string_length(string(hr[2]))*34/2+i*34,yl[2]+122); }
		///
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(f_vs);
		//draw_text_ext_transformed_color(640,ys,"VS",0,400,ts,ts,as,c_red,c_red,c_red,c_red,1);
		draw_text_ext_transformed_color(640,ys,"VS",0,400,ts,ts,as,c_white,c_white,c_white,c_white,1);
		
		draw_set_font(f_wanted);
		draw_text(xl[1],yl[1]-200*sign(hr[1]-hr[2]),name[1]);
		draw_text(xl[2],yl[2]-200*sign(hr[2]-hr[1]),name[2]);
		
		if xl[1]>700
			{
			if ts>1
				{ ts-=0.5; }
				else
				{ as=0; ts=1; }
			}
			else
			{
			if ts>0
				{ ts-=0.25; }
				else
				{ ts=0; }
			}
		if xl[1]>640+180
			{
			xl[1]-=20;
			xl[2]+=20;
			}
		if xl[1]<=640+180 && xl[1]>700
			{
			xl[1]-=1.2;
			xl[2]+=1.2;
			}
		if xl[1]<=700 && xl[1]>-300+640-global.size/2
			{
			xl[1]-=40;
			xl[2]+=40;
			//ys-=60;
			}
		if xl[1]<=-300+640-global.size/2
			{ go=3; }
		}
#endregion
#region Персонажи
	if go>2
		{
		#region Появление
			if alp>0
				{ alp-=0.25; }
				else
				{ alp=0; }
			if x3>0
				{ x3-=15; alarm[4]=room_speed/1.5; }
				else
				{ x3=0; }
		#endregion
		#region Выстрел
			
		#endregion
		#region Перезарядка
			
		#endregion
		#region Рисование персонажей
			draw_sprite(s_hero,0,640-global.size/2+120-x3,430);
			draw_sprite(s_gun,0,640-global.size/2+120-x3+120,430-148);
		
			draw_sprite(s_hero,1,640+global.size/2-120+x3,430);
			draw_sprite(s_gun1,0,640+global.size/2-120+x3-15,430-148);
			draw_sprite(s_hero,2,640+global.size/2-120+x3,430);
			#endregion
		}
#endregion
#region Готовность
	if go>3
		{
		if qs>1
			{ qs-=0.5; }
			else
			{ qs=1; answer_can=1; }
		draw_sprite_ext(s_game,0,640,640,qs,qs,0,c_white,1);//draw_sprite_ext(s_game,0,640,640,qs,qs,0,c_white,0.9);
		
		if go=4
			{
			draw_set_font(f_question);
			draw_set_color(c_blue);
			if qs=1
				{ draw_text_new(640,740,question,c_blue,c_white,c_yellow,c_black,0.5,0.1,0.6); }
		
			draw_sprite_ext(s_game,1,640,920,qs,qs,0,c_white,1);
				draw_set_font(f_answer);
				draw_text_ext_transformed_color_new(640,1020,q[1],0,700,qs+answer_bolt[1],qs+answer_bolt[1],0,c_blue,c_white,c_yellow,c_black,0.5,0.1,0.6);
			draw_sprite_ext(s_game,2,640,1130,qs,qs,0,c_white,1);
		
			if answer_can=1
			&& mouse_x=median(640-string_width(q[1])/2,mouse_x,640+string_width(q[1])/2)
			&& mouse_y=median(1040-string_height(q[1])/2,mouse_y,1040+string_height(q[1])/2)
				{
				if mouse_check_button(mb_left)
					{ answer_bolt[1]=0.1; }
				if mouse_check_button_released(mb_left)
					{ answer_bolt[1]=0; go=5 }
				}
				else
				{ answer_bolt[1]=0; }
			
			if answer_can=1
				{
				var round_time_p=round_time;
				round_time-=1/room_speed;
				if floor(round_time_p)>floor(round_time)
					{ rs=1.5; }
				if round_time<4
					{
					if rs>1
						{ rs-=0.02; }
						else
						{ rs=1; }
					draw_set_font(f_vs);
					if floor(round_time)=0
						{ draw_text_ext_transformed_color_new(640,720,"GO!",0,1700,rs,rs,0,c_blue,c_white,c_yellow,c_black,0.5,0.1,0.6); }
						else
						{ draw_text_ext_transformed_color_new(640,720,floor(round_time),0,1700,rs,rs,0,c_blue,c_white,c_yellow,c_black,0.5,0.1,0.6); }
					}
				if round_time=0
					{ answer_bolt[1]=0.1; go=5; }
				}
			}
		}
#endregion
#region Игра
	if go=5
		{
		#region Уравнение
			if !round_start
				{
				vargame="math"//irandom();
				#region Математика
					if vargame="math"
						{	
						var text, t, t1;
					
						xm[2]=choose("+","-","*","/");
						xm[4]=choose("+","-","*","/");
						
						xm[1]=string(irandom_range(1,10));
						xm[3]=string(irandom_range(1,10));
						xm[5]=string(irandom_range(1,10));
						
						if xm[2]="*" or xm[2]="/" or xm[4]="+" or xm[4]="-"
							{
							#region Если по порядку
							#region Первые два числа
								if xm[2]="+" or xm[2]="-"
									{
									xm[1]=string(irandom_range(1,25));
									xm[3]=string(irandom_range(1,25));
									}
									else
									{
									if xm[2]="/"
										{
										xm[1]=string(irandom_range(1,10));
										switch(xm[1])
											{
											case 1: xm[3]=choose("1","2","4","5","10"); break;
											case 2: xm[3]=choose("1","2","4","5","8","10"); break;
											case 3: xm[3]=choose("1","3","6","10"); break;
											case 4: xm[3]=choose("1","2","4","8","10"); break;
											case 5: xm[3]=choose("1","2","5","10"); break;
											case 6: xm[3]=choose("1","2","3","6","10"); break;
											case 7: xm[3]=choose("1","2","5","10"); break;
											case 8: xm[3]=choose("1","2","4","8","10"); break;
											case 9: xm[3]=choose("1","2","9","10"); break;
											case 10: xm[3]=choose("1","2","4","5","10"); break;
											}
										}
										else
										{
										xm[1]=string(irandom_range(1,10));
										xm[3]=string(irandom_range(1,10));
										}
									}
							#endregion
							switch(xm[2])
								{
								case "+": xm[6]=string(real(xm[1])+real(xm[3])); break;
								case "-": xm[6]=string(real(xm[1])-real(xm[3])); break;
								case "*": xm[6]=string(real(xm[1])*real(xm[3])); break;
								case "/": xm[6]=string(real(xm[1])/real(xm[3])); break;
								}
							#region Вторые числа
								if xm[2]="/" && (real(xm[6]) mod 1!= 0)
									{
									xm[4]="*";
									xm[5]=string(real(xm[3])*irandom_range(1,4));
									}
									else
									{
									if xm[2]="/" && xm[4]="/"
										{ xm[4]="*"; }
									if xm[4]="+" or xm[4]="-"
										{ xm[5]=string(irandom_range(1,20)); }
										else
										{
										if xm[4]="/"
											{
											switch(xm[3])
												{
												case 1: xm[5]=xm[3]*irandom_range(1,3); break;
												case 2: xm[5]=choose("1","2",xm[3]*irandom_range(1,3)); break;
												case 3: xm[5]=choose("1","3",xm[3]*irandom_range(1,3)); break;
												case 4: xm[5]=choose("1","2","4",xm[3]*irandom_range(1,3)); break;
												case 5: xm[5]=choose("1","2","5",xm[3]*irandom_range(1,3)); break;
												case 6: xm[5]=choose("1","2","3","6",xm[3]*irandom_range(1,3)); break;
												case 7: xm[5]=choose("1","2",xm[3]*irandom_range(1,3)); break;
												case 8: xm[5]=choose("1","2","4","8",xm[3]*irandom_range(1,3)); break;
												case 9: xm[5]=choose("1","9",xm[3]*irandom_range(1,3)); break;
												case 10: xm[5]=choose("1","2","5","10",xm[3]*irandom_range(1,3)); break;
												}
											}
											else
											{ xm[5]=string(irandom_range(1,10)); }
										}
									}
							#endregion
							switch(xm[4])
								{
								case "+": xm[6]=string(real(xm[6])+real(xm[5])); break;
								case "-": xm[6]=string(real(xm[6])-real(xm[5])); break;
								case "*": xm[6]=string(real(xm[6])*real(xm[5])); break;
								case "/": xm[6]=string(real(xm[6])/real(xm[5])); break;
								}
						#endregion
							}
							else
							{
							#region Если НЕ по порядку
								#region Первые два числа
										if xm[4]="+" or xm[4]="-"
											{
											xm[3]=string(irandom_range(1,25));
											xm[5]=string(irandom_range(1,25));
											}
											else
											{
											if xm[4]="/"
												{
												xm[3]=string(irandom_range(1,10));
												switch(xm[3])
													{
													case 1: xm[5]=choose("1","2","4","5","10"); break;
													case 2: xm[5]=choose("1","2","4","5","8","10"); break;
													case 3: xm[5]=choose("1","3","6","10"); break;
													case 4: xm[5]=choose("1","2","4","8","10"); break;
													case 5: xm[5]=choose("1","2","5","10"); break;
													case 6: xm[5]=choose("1","2","3","6","10"); break;
													case 7: xm[5]=choose("1","2","5","10"); break;
													case 8: xm[5]=choose("1","2","4","8","10"); break;
													case 9: xm[5]=choose("1","2","9","10"); break;
													case 10: xm[5]=choose("1","2","4","5","10"); break;
													}
												}
												else
												{
												xm[3]=string(irandom_range(1,10));
												xm[5]=string(irandom_range(1,10));
												}
											}
									#endregion
								switch(xm[4])
									{
									//case "+": xm[6]=string(real(xm[3])+real(xm[5])); break;
									//case "-": xm[6]=string(real(xm[3])-real(xm[5])); break;
									case "*": xm[6]=string(real(xm[3])*real(xm[5])); break;
									case "/": xm[6]=string(real(xm[3])/real(xm[5])); break;
									}
								#region Вторые числа
									if xm[4]="/" && (real(xm[6]) mod 1!= 0)
										{
										xm[2]="*";
										xm[1]=string(real(xm[5])*irandom_range(1,4));
										}
										else
										{
										if xm[2]="+" or xm[2]="-"
											{ xm[1]=string(irandom_range(1,20)); }
											else
											{
											if xm[2]="/"
												{
												switch(xm[3])
													{
													case 1: xm[1]=choose("1","2","4","5","10"); break;
													case 2: xm[1]=choose("1","2","4","5","8","10"); break;
													case 3: xm[1]=choose("1","3","6","10"); break;
													case 4: xm[1]=choose("1","2","4","8","10"); break;
													case 5: xm[1]=choose("1","2","5","10"); break;
													case 6: xm[1]=choose("1","2","3","6","10"); break;
													case 7: xm[1]=choose("1","2","5","10"); break;
													case 8: xm[1]=choose("1","2","4","8","10"); break;
													case 9: xm[1]=choose("1","2","9","10"); break;
													case 10: xm[1]=choose("1","2","4","5","10"); break;
													}
												}
												else
												{ xm[1]=string(irandom_range(1,10)); }
											}
										}
								#endregion
								switch(xm[2])
									{
									case "+": xm[6]=string(real(xm[1])+real(xm[6])); break;
									case "-": xm[6]=string(real(xm[1])-real(xm[6])); break;
									//case "*": xm[6]=string(real(xm[1])*real(xm[6])); break;
									//case "/": xm[6]=string(real(xm[1])/real(xm[6])); break;
									}
							#endregion
							}
					
						var z;
						z=irandom(1);
						answer_count=4;
						//xm[6]=string(real(xm[6]));
						
						#region Знак или число
							if z=0
								{
								//question="Choose the right sign \n\n"+xm[1]+xm[2]+xm[3]+xm[4]+xm[5]+"="+xm[6];
								q[1]="+";
								q[2]="-";
								q[3]="/";
								q[4]="*";
					
								answer_numb=choose(2,4);
								for(i=1;i<=4;i++)
									{
									if q[i]=xm[answer_numb]
										{ t=i; break; }
									}
								}
							if z=1
								{
								//question="Choose the right\ncalculation \n\n"+xm[1]+xm[2]+xm[3]+xm[4]+xm[5]+"="+xm[6];
								answer_numb=choose(1,3,5,6);
					
								q[1]="";
								q[2]="";
								q[3]="";
								q[4]="";
						
								text="1234";
								for(i=4;i>=1;i--)
									{
									t=irandom_range(1,i);
									t1=irandom(1);
									switch(t1)
										{
										case 0:
											q[string_copy(text,t,1)]=string(round(1+real(xm[answer_numb])+choose(-1,1)*irandom_range(1,20)));
										break;
										case 1:
											q[string_copy(text,t,1)]=string(round(1+real(xm[answer_numb])*choose(+choose(-1,1)*random_range(0.1,10))));
										break;
										}
									text=string_delete(text,t,1);
									}
								t=irandom_range(1,4);
								q[t]=xm[answer_numb];
								}
					
							xm[answer_numb]="?";
					
							if z=0
								{ question="Choose the right\nsign \n\n"+xm[1]+xm[2]+xm[3]+xm[4]+xm[5]+"="+xm[6]; }
							if z=1
								{ question="Choose the right\ncalculation \n\n"+xm[1]+xm[2]+xm[3]+xm[4]+xm[5]+"="+xm[6]; }
						#endregion
					
						answer_can=0; // Можно ответить
						answer_true=q[t]; // Верный вариант
					
						round_time=10; // Время раунда
						round_count-=1; // Всего раундов
						rs=1.2; // Увеличение таймера
						round_start=1;
						}
				#endregion
				}
		#endregion
		#region Рисование
			if round_start=1
				{
				draw_set_font(f_question);
				draw_set_color(c_blue);
				draw_text_new(640,740,question,c_blue,c_white,c_yellow,c_black,0.5,0.1,0.6);
				
				draw_sprite_ext(s_game,1,640,920,qs,qs,0,c_white,1);
				draw_set_font(f_answer);
				
				#region Рисование вариантов
					switch(answer_count)
						{
						case 4:
						
							draw_set_alpha(0.1);
								draw_rectangle_color(640-360+90+20,938,640-360+90+20+110,1125,c_black,c_black,c_black,c_black,0);
								draw_rectangle_color(640-360+90+20+130,938,640-360+90+20+130+110,1125,c_black,c_black,c_black,c_black,0);
								draw_rectangle_color(640-360+90+20+130*2,938,640-360+90+20+130*2+110,1125,c_black,c_black,c_black,c_black,0);
								draw_rectangle_color(640-360+90+20+130*3,938,640-360+90+20+130*3+110,1125,c_black,c_black,c_black,c_black,0);
							draw_set_alpha(1);
					
							draw_text_ext_transformed_color_new(640-360+90+20+55,1015,q[1],0,700,qs+answer_bolt[1],qs+answer_bolt[1],0,c_blue,c_white,c_yellow,c_black,0.5,0.1,0.6);
							draw_text_ext_transformed_color_new(640-360+90+20+130+55,1015,q[2],0,700,qs+answer_bolt[2],qs+answer_bolt[2],0,c_blue,c_white,c_yellow,c_black,0.5,0.1,0.6);
							draw_text_ext_transformed_color_new(640-360+90+20+130*2+55,1015,q[3],0,700,qs+answer_bolt[3],qs+answer_bolt[3],0,c_blue,c_white,c_yellow,c_black,0.5,0.1,0.6);
							draw_text_ext_transformed_color_new(640-360+90+20+130*3+55,1015,q[4],0,700,qs+answer_bolt[4],qs+answer_bolt[4],0,c_blue,c_white,c_yellow,c_black,0.5,0.1,0.6);
						break;
						}
					#endregion
				
				draw_sprite_ext(s_game,2,640,1130,qs,qs,0,c_white,1);
		
				if answer_can=1 && mouse_y=median(938,mouse_y,1125) && shoot[1]=0 && reload[1]=0
					{
					#region Первый ответ
						if mouse_x=median(640-360+90+20,mouse_x,640-360+90+20+110)
							{
							if mouse_check_button(mb_left)
								{ answer_bolt[1]=0.1; }
								else
								{ answer_bolt[1]=0; }
							if mouse_check_button_released(mb_left)
								{
								answer_bolt[1]=0;
								answer=q[1];
								go=6;
								if answer_true=answer
									{ show_message("Красава, уважение!"); }
									else
									{ show_message("Неверно! Верный ответ: "+answer_true); }
								}
							}
							else
							{ answer_bolt[1]=0; }
					#endregion
					#region Второй ответ
						if mouse_x=median(640-360+90+20+110+20,mouse_x,640-360+90+20+110+20+110)
							{
							if mouse_check_button(mb_left)
								{ answer_bolt[2]=0.1; }
								else
								{ answer_bolt[1]=0; }
							if mouse_check_button_released(mb_left)
								{
								answer_bolt[2]=0;
								answer=q[2];
								go=6;
								if answer_true=answer
									{ show_message("Красава, уважение!"); }
									else
									{ show_message("Неверно! Верный ответ: "+answer_true); }
								}
							}
							else
							{ answer_bolt[1]=0; }
					#endregion
					#region Третий ответ
						if mouse_x=median(640-360+90+20+110+20+110+20,mouse_x,640-360+90+20+110+20+110+20+110)
							{
							if mouse_check_button(mb_left)
								{ answer_bolt[3]=0.1; }
								else
								{ answer_bolt[1]=0; }
							if mouse_check_button_released(mb_left)
								{
								answer_bolt[3]=0;
								answer=q[3];
								go=6;
								if answer_true=answer
									{ show_message("Красава, уважение!"); }
									else
									{ show_message("Неверно! Верный ответ: "+answer_true); }
								}
							}
							else
							{ answer_bolt[1]=0; }
					#endregion
					#region Четвертый ответ
						if mouse_x=median(640-360+90+20+110+20+110+20+110+20,mouse_x,640-360+90+20+110+20+110+20+110+20+110)
							{
							if mouse_check_button(mb_left)
								{ answer_bolt[4]=0.1; }
								else
								{ answer_bolt[1]=0; }
							if mouse_check_button_released(mb_left)
								{
								answer_bolt[4]=0;
								answer=q[4];
								go=6;
								if answer_true=answer
									{ show_message("Красава, уважение!"); }
									else
									{ show_message("Неверно! Верный ответ: "+answer_true); }
								}
							}
							else
							{ answer_bolt[1]=0; }
					#endregion
					
					//shoot[1]=1;
					}
					else
					{ answer_bolt[1]=0; }
				
				#region Таймер
					if answer_can=1
						{
						var round_time_p=round_time;
						round_time-=1/room_speed;
						if floor(round_time_p)>floor(round_time)
							{ rs=1.5; }
						if round_time<4
							{
							if rs>1
								{ rs-=0.02; }
								else
								{ rs=1; }
							draw_set_font(f_vs);
						
							if floor(round_time)=0
								{ draw_text_ext_transformed_color(640,100,"SLOW!",0,1700,rs,rs,0,c_white,c_white,c_white,c_white,1); }
								else
								{ draw_text_ext_transformed_color(640,100,floor(round_time),0,1700,rs,rs,0,c_white,c_white,c_white,c_white,1); }
							}
						if round_time=0
							{ answer_bolt[1]=0.1; go=6; }
						}
				#endregion
				}
		#endregion
		}
	if go=6
		{
		round_numb++;
		round_start=0;
		go=5;
		}
	if go>4
		{
		draw_text(640,250,string(round_count));
		}
#endregion