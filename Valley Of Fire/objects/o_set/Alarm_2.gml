var purchaseList, buy_cash_50, buy_cash_270, buy_cash_550, buy_cash_1200,
buy_cash_3000, buy_cash_7000;
purchaseList  = ds_list_create();
	
buy_cash_50   = ds_map_create();
buy_cash_270  = ds_map_create();
buy_cash_550  = ds_map_create();
buy_cash_1200 = ds_map_create();
buy_cash_3000 = ds_map_create();
buy_cash_7000 = ds_map_create();
	
ds_map_add(buy_cash_50, "id", "buy_cash_50"); 
ds_map_add(buy_cash_50, "title", "THE WAD OF CASH"); 
ds_map_add(buy_cash_50, "description", "50 CASH"); 
ds_map_add(buy_cash_50, "price", "$0.99");
	
ds_map_add(buy_cash_270, "id", "buy_cash_270"); 
ds_map_add(buy_cash_270, "title", "THE WAD OF CASH"); 
ds_map_add(buy_cash_270, "description", "270 CASH"); 
ds_map_add(buy_cash_270, "price", "$0.99");
	
ds_map_add(buy_cash_550, "id", "buy_cash_550"); 
ds_map_add(buy_cash_550, "title", "THE WAD OF CASH"); 
ds_map_add(buy_cash_550, "description", "550 CASH"); 
ds_map_add(buy_cash_550, "price", "$0.99");
	
ds_map_add(buy_cash_1200, "id", "buy_cash_1200"); 
ds_map_add(buy_cash_1200, "title", "THE WAD OF CASH"); 
ds_map_add(buy_cash_1200, "description", "1200 CASH"); 
ds_map_add(buy_cash_1200, "price", "$0.99");
	
ds_map_add(buy_cash_3000, "id", "buy_cash_3000"); 
ds_map_add(buy_cash_3000, "title", "THE WAD OF CASH"); 
ds_map_add(buy_cash_3000, "description", "3000 CASH"); 
ds_map_add(buy_cash_3000, "price", "$0.99");
	
ds_map_add(buy_cash_7000, "id", "buy_cash_7000"); 
ds_map_add(buy_cash_7000, "title", "THE WAD OF CASH"); 
ds_map_add(buy_cash_7000, "description", "7000 CASH"); 
ds_map_add(buy_cash_7000, "price", "$0.99");

ds_list_add(purchaseList, buy_cash_50); 
ds_list_add(purchaseList, buy_cash_270); 
ds_list_add(purchaseList, buy_cash_550); 
ds_list_add(purchaseList, buy_cash_1200); 
ds_list_add(purchaseList, buy_cash_3000);
ds_list_add(purchaseList, buy_cash_7000); 
	
iap_activate(purchaseList);
	
ds_map_destroy(buy_cash_50); 
ds_map_destroy(buy_cash_270); 
ds_map_destroy(buy_cash_550); 
ds_map_destroy(buy_cash_1200); 
ds_map_destroy(buy_cash_3000);
ds_map_destroy(buy_cash_7000); 
	
ds_list_destroy(purchaseList);