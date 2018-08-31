if os_is_network_connected() // проверка подключения к интернету
    {
    if iap_status() == iap_status_available // проверяем статус покупки, если 
        {
        var purchase_map = ds_map_create(); //создаём карту покупки
        var purchase_index = ds_map_find_value(iap_data, "index"); //извлекаем из  карты iap_data индекс текущей покупки  
        iap_purchase_details(purchase_index, purchase_map);
        
        if ds_map_find_value(purchase_map, "status") == iap_purchased
            {
			#region Покупка 1
            if ds_map_find_value(purchase_map, "product") == "buy_cash_50"// pay id
                {
				GoogleAnalytics_SendEvent("CASH","Игрок купил 50 кэша!");
				global.cash += cash_val[1];
				ini_open("Music.ini");
					ini_write_string("Sounds", "sound_false_c", string(global.cash));
				ini_close();
				show_message_async("YOU HAVE SUCCESSFULLY PURCHASED " + string(cash_val[1]) + " CASH!");
                iap_consume("buy_cash_50"); // Отчищаем состояние "покупки" (т.е. iap_status), дабы не произошло лищних покупок.
                }
			#endregion
			#region Покупка 2
            if ds_map_find_value(purchase_map, "product") == "buy_cash_270"// pay id
                {
				GoogleAnalytics_SendEvent("CASH","Игрок купил 270 кэша!");
				global.cash += cash_val[2];
				ini_open("Music.ini");
					ini_write_string("Sounds", "sound_false_c", string(global.cash));
				ini_close();
				show_message_async("YOU HAVE SUCCESSFULLY PURCHASED " + string(cash_val[2]) + " CASH!");
                iap_consume("buy_cash_270"); // Отчищаем состояние "покупки" (т.е. iap_status), дабы не произошло лищних покупок.
                }
			#endregion
			#region Покупка 3
            if ds_map_find_value(purchase_map, "product") == "buy_cash_550"// pay id
                {
				GoogleAnalytics_SendEvent("CASH","Игрок купил 550 кэша!");
				global.cash += cash_val[3];
				ini_open("Music.ini");
					ini_write_string("Sounds", "sound_false_c", string(global.cash));
				ini_close();
				show_message_async("YOU HAVE SUCCESSFULLY PURCHASED " + string(cash_val[3]) + " CASH!");
                iap_consume("buy_cash_550"); // Отчищаем состояние "покупки" (т.е. iap_status), дабы не произошло лищних покупок.
                }
			#endregion
			#region Покупка 4
            if ds_map_find_value(purchase_map, "product") == "buy_cash_1200"// pay id
                {
				GoogleAnalytics_SendEvent("CASH","Игрок купил 1200 кэша!");
				global.cash += cash_val[4];
				ini_open("Music.ini");
					ini_write_string("Sounds", "sound_false_c", string(global.cash));
				ini_close();
				show_message_async("YOU HAVE SUCCESSFULLY PURCHASED " + string(cash_val[4]) + " CASH!");
                iap_consume("buy_cash_1200"); // Отчищаем состояние "покупки" (т.е. iap_status), дабы не произошло лищних покупок.
                }
			#endregion
			#region Покупка 5
            if ds_map_find_value(purchase_map, "product") == "buy_cash_3000"// pay id
                {
				GoogleAnalytics_SendEvent("CASH","Игрок купил 3000 кэша!");
				global.cash += cash_val[5];
				ini_open("Music.ini");
					ini_write_string("Sounds", "sound_false_c", string(global.cash));
				ini_close();
				show_message_async("YOU HAVE SUCCESSFULLY PURCHASED " + string(cash_val[5]) + " CASH!");
                iap_consume("buy_cash_3000"); // Отчищаем состояние "покупки" (т.е. iap_status), дабы не произошло лищних покупок.
                }
			#endregion
			#region Покупка 6
            if ds_map_find_value(purchase_map, "product") == "buy_cash_7000"// pay id
                {
				GoogleAnalytics_SendEvent("CASH","Игрок купил 7000 кэша!");
				global.cash += cash_val[6];
				ini_open("Music.ini");
					ini_write_string("Sounds", "sound_false_c", string(global.cash));
				ini_close();
				show_message_async("YOU HAVE SUCCESSFULLY PURCHASED " + string(cash_val[6]) + " CASH!");
                iap_consume("buy_cash_7000"); // Отчищаем состояние "покупки" (т.е. iap_status), дабы не произошло лищних покупок.
                }
			#endregion
            }
        ds_map_destroy(purchase_map);
        }
    }
    else
    { show_message("NO NETWORK CONNECTION!"); }