/*
go=0;
#region Лоадинг
	loading=1;
	bul=6;
	for(i=1;i<=bul;i++)
		{
		xb[i]=0;
		yb[i]=640;
		}
	
	ang=360;
	image_angle=360;
	image_index=0;
	image_speed=0;
	alarm[1]=room_speed*1;
	
	tt="";
	alarm[2]=room_speed/2;
#endregion
#region Листовки
	xl[1]=200+640+global.size/2;
	xl[2]=-200+640-global.size/2;
	
	hr[1]=global.reward;
	hr[2]=global.reward+choose(-1,1)*random(30)*5;
	
	hr[1]=round(hr[1]);
	hr[2]=round(hr[2]);
	
	yl[1]=640+300*sign(hr[2]-hr[1]);
	yl[2]=640+300*sign(hr[1]-hr[2]);
	
	ts=10; // Скейл VS
	as=0; // Угол VS
	ys=572; // Игрек-координата VS
#endregion
#region Персонажи
	name[1]="Sherif";
	var randname="";
	var hm=irandom(5)+4;
	for(i=0;i<hm;i++)
		{ randname+=string_copy("ABCDIFGHIJKLNOPQRSTUVWXYZ",irandom(36),1); }
	name[2]=choose(choose("Amigo","Pedro","Don","Akimio"),choose("Artemio","Andre","Azamato","Muchacho","Nikolo","Player","Holos"),randname)+choose("",string(irandom_range(1950,2018)),string(irandom(99)));
	x3=300;
	alp=0.8;
#endregion
#region Игра
	#region Начало
		qs=10; // Уменьшение листка
		answer_bolt[1]=0;
		answer_bolt[2]=0;
		answer_bolt[3]=0;
		answer_bolt[4]=0; // Увеличене варианта
	
		vargame="math";
		question="Are you ready,\n"+name[1]+"?";
		answer_count=1; // Количество вариантов
	
		q[1]="I AM READY";
		q[2]="";
		q[3]="";
		q[4]="";
	
		answer_can=0; // Можно ответить
		answer_true=q[1]; // Верный вариант
		answer="-";
	
		round_time=7; // Время раунда
		round_count=6; // Всего раундов
		rs=1.2; // Увеличение таймера
		round_start=0; // Старт раунда
	#endregion
	#region Математика
		for(i=1;i<=6;i++)
			{ xm[i]=""; }
		round_numb=6;
		answer_numb=1;
		qv[1]=1;
		qv[2]=1;
		qv[3]=1;
	#endregion
	#region Выстрелы
		shoot[1]=0;
		shoot[2]=0;
		
		reload[1]=0;
		reload[2]=0;
		
		shoot_ang[1]=0;
		shoot_ang[2]=0;
	#endregion
#endregion