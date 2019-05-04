//requestReview()

switch os_type
{
	case os_ios:
	    var reviewDisplayed = request_review_app_store();
	    if !reviewDisplayed
		{
			var ddd;
			ddd = show_question_async("Do you like this game? Please rate in the AppStore!");
			if ddd
			{
				url_open("itms-apps://itunes.apple.com/app/apple-store/id1400010051?mt=8");
			}
		}
	break;
}