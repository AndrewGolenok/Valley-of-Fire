#region Пуши
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
		push_local_notification(date_inc_day(date_current_datetime(), 1), "DAILY GIFT", "Come and get 30 GOLD!", "d1");
		push_local_notification(date_inc_day(date_current_datetime(), 3), "IS IT TIME TO STRETCH YOUR BRAIN?", "Come and get 70 GOLD!", "d2");
		push_local_notification(date_inc_day(date_current_datetime(), 7), "HOLA AMIGO!", "Come and get 25 CASH!", "d3");
		push_local_notification(date_inc_day(date_current_datetime(), 14), "THE BEST SHOOTERS OF THE TOWN WANT TO FIGHT WITH YOU!", "Come and get 50 GOLD and 30 CASH!", "d4");
		push_local_notification(date_inc_day(date_current_datetime(), 30), "DUELS ARE WAITING FOR YOU!", "Come and get 100 GOLD and 50 CASH!", "d5");
		}
#endregion