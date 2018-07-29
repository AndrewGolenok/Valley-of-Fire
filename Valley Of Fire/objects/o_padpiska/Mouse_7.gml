if iap_status() == iap_status_available
   {
   var product = "vip_test";
   iap_acquire(product, "");
   }
   else
   { show_message_async("Store is not available."); }