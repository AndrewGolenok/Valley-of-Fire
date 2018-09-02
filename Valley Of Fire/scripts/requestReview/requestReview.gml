//requestReview()

switch os_type
	{
	case os_ios:
	    var reviewDisplayed = request_review_app_store();
	    if !reviewDisplayed
			{
			var ddd;
			ddd = show_question_async("Did you enjoy the game? Write a review!");
			if ddd
				{ url_open("itms-apps://itunes.apple.com/app/apple-store/id1400010051?mt=8"); }
			}
	break;
	}