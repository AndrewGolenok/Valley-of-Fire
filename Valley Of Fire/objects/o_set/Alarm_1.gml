/*
if !os_is_network_connected()
	{ alarm[4] = 10 * room_speed; }
	else
	{
	GoogleAnalytics_Init("UA-96583902-1", false);
	GoogleMobileAds_Init("pub-5529510774102506");

	if os_type = os_ios
	    { achievement_login(); }

	// РЕКЛАМА
	if os_type = os_ios
	    { unity_ads_init("1202480"); }
	if os_type = os_android
	    { unity_ads_init("1202481"); }
  
	//UnityAds_TestMode(0);

	var google_b;
	if os_device != device_ios_iphone and os_device != device_ios_iphone5 and display_get_width() > 640
		{ google_b = GoogleMobileAds_Full_Banner; }
		else
		{ google_b = GoogleMobileAds_Banner; }
	if os_type = os_ios
	    {					  
	    GoogleMobileAds_AddBanner("ca-app-pub-5529510774102506/7557263279", GoogleMobileAds_Banner);
	    GoogleMobileAds_MoveBanner(0, 2280);
    
	    GoogleMobileAds_Init("ca-app-pub-5529510774102506/5940929278");
	    GoogleMobileAds_LoadInterstitial();
	    }
	if os_type = os_android
	    {
	    GoogleMobileAds_AddBanner("ca-app-pub-5529510774102506/1371128871", GoogleMobileAds_Banner);
	    GoogleMobileAds_MoveBanner(0, 2280);
    
	    GoogleMobileAds_Init("ca-app-pub-5529510774102506/2847862071");
	    GoogleMobileAds_LoadInterstitial();
	    }
	}