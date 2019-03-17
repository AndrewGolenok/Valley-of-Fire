#region Покупка
	var data = ds_map_find_value(async_load, "data");
	var map = ds_map_create();
	var ntf = push_get_first_local_notification(map);
	
	ini_open("Music.ini");
	
	if data == "d1"
		{ global.gold += 30; }
	if data == "d2"
		{ global.gold += 70; }
	if data == "d3"
		{ global.cash += 25; }
	if data == "d4"
		{ global.gold += 50; global.cash += 30; }
	if data == "d5"
		{ global.gold += 100; global.cash += 50;}
	ini_write_string("Sounds", "sound_on_g", string(global.gold));
	ini_write_string("Sounds", "sound_false_c", string(global.cash));
	
	ini_close();
#endregion