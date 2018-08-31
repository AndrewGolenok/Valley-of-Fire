///requestReview()

switch os_type {
    case os_ios:
        var reviewDisplayed = request_review_app_store();
        if !reviewDisplayed {
            url_open("itms-apps://itunes.apple.com/app/apple-store/id1400010051?mt=8");
        }
        break;
    //case os_android:
    //    url_open("https://play.google.com/store/apps/details?id=com.jgonfer.devilicious");
    //    break;
    default:
        url_open("http://devilicious.jgonfer.com");
        break;
}
