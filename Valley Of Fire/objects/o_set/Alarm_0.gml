if os_get_language() = "ru"
	{
	push_local_notification(date_inc_hour(date_current_datetime(), 12), "ЕЖЕДНЕВНЫЙ ПОДАРОК", "Заходи и получи 30 ЗОЛОТА!", "d1");
	
	push_local_notification(date_inc_day(date_current_datetime(), 3), "УЖЕ ПОРА РАЗМЯТЬ МОЗГИ?", "Заходи и получи 70 ЗОЛОТА!!", "d2");
		
	push_local_notification(date_inc_day(date_current_datetime(), 7), "ХОЛА, АМИГО!", "25 ДЕНЕГ ждут тебя!", "d3");
	
	push_local_notification(date_inc_day(date_current_datetime(), 14), "ЛУЧШИЕ СТРЕЛКИ ЭТОГО ГОРОДА ГОТОВЫ СРАЗИТЬСЯ С ТОБОЙ", "Заходи и получи 50 ЗОЛОТА и 30 ДЕНЕГ!", "d4");
	
	push_local_notification(date_inc_day(date_current_datetime(), 30), "ДУЭЛИ ЖДУТ ТЕБЯ!", "Заходи и получи 100 ЗОЛОТА и 50 ДЕНЕГ", "d5");
	}
	else
	{
	push_local_notification(date_inc_day(date_current_datetime(), 1), "DAILY GIFT", "Gome in and get 30 GOLD!", "d1");
	
	push_local_notification(date_inc_day(date_current_datetime(), 3), "IS IT TIME TO STRETCH YOUR BRAIN?", "Gome in and get 70 GOLD!", "d2");
	
	push_local_notification(date_inc_day(date_current_datetime(), 7), "HOLA AMIGO!", "Gome in and get 25 CASH!", "d3");
	
	push_local_notification(date_inc_day(date_current_datetime(), 14), "THE BEST SHOOTERS OF THE TOWN WANT TO FIGHT WITH YOU!", "Gome in and get 50 GOLD and 30 CASH!", "d4");
	
	push_local_notification(date_inc_day(date_current_datetime(), 30), "DUELS ARE WAITING FOR YOU!", "Gome in and get 100 GOLD and 50 CASH!", "d5");
	}
/*
push_local_notification(date_inc_day(date_current_datetime(), 1), push_txt1, push_txt2, "daily_reward 1");
push_local_notification(date_inc_day(date_current_datetime(), 3), push_txt1, push_txt2, "daily_reward 3");
push_local_notification(date_inc_day(date_current_datetime(), 5), push_txt1, push_txt2, "daily_reward 5");
push_local_notification(date_inc_day(date_current_datetime(), 7), push_txt1, push_txt2, "daily_reward 7"); // Пуши