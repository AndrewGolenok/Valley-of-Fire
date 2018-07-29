if os_is_network_connected() // проверка подключения к интернету
    {
    if iap_status() == iap_status_available // проверяем статус покупки, если 
        {
        var purchase_map = ds_map_create(); //создаём карту покупки
        var purchase_index = ds_map_find_value(iap_data, "index"); //извлекаем из  карты iap_data индекс текущей покупки  
        iap_purchase_details(purchase_index, purchase_map);
        
        if ds_map_find_value(purchase_map, "status") == iap_purchased
            {
            if ds_map_find_value(purchase_map, "product") == "vip_test"// pay id
                {
				show_message("Красава! Уважение!");
                iap_consume("vip_test"); // Отчищаем состояние "покупки" (т.е. iap_status), дабы не произошло лищних покупок.
                }
            }
        ds_map_destroy(purchase_map);
        }
    }
    else
    { show_message("Отсутствует сетевое подключение!"); }