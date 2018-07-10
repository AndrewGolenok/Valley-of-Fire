/// Первая покупка
var purchaseList, no_ads;
purchaseList = ds_list_create();
no_ads = ds_map_create();

ds_map_add(no_ads, "id", "no_ads"); 
ds_map_add(no_ads, "title", "No ADS"); 
ds_map_add(no_ads, "description", "Disable ADS"); 
if os_get_language() = "ru"
	{ ds_map_add(no_ads, "price", "149 рублей"); }
	else
	{ ds_map_add(no_ads, "price", "$1.99"); }

ds_list_add(purchaseList, no_ads); 

iap_activate(purchaseList);

ds_map_destroy(no_ads); 
ds_list_destroy(purchaseList);
/// Первая покупка