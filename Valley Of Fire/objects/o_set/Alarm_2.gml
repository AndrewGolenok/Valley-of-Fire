/// Первая покупка
var purchaseList, no_ads;
purchaseList = ds_list_create();
vip_test = ds_map_create();

ds_map_add(vip_test, "id", "vip_test"); 
ds_map_add(vip_test, "title", "VIP Test"); 
ds_map_add(vip_test, "description", "VIP"); 
if os_get_language() = "ru"
	{ ds_map_add(vip_test, "price", "72 рубля"); }
	else
	{ ds_map_add(vip_test, "price", "$1.99"); }

ds_list_add(purchaseList, vip_test); 

iap_activate(purchaseList);

ds_map_destroy(vip_test); 
ds_list_destroy(purchaseList);
/// Первая покупка