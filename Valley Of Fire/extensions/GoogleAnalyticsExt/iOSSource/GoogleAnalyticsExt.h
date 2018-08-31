//
//  Released by YoYo Games Ltd. on 17/04/2014. Intended for use with GM: S EA97 and above ONLY.
//  Copyright YoYo Games Ltd., 2014.
//  For support please submit a ticket at help.yoyogames.com
//
//

@interface GoogleAnalyticsExt:NSObject
{
	
}
-(void)GoogleAnalytics_Init:(char*)_trackingId Arg2:(double)_dryRun;
-(void)GoogleAnalytics_SendScreenView:(char*)_screenName;
-(void)GoogleAnalytics_SendEvent:(char*)_category Arg2:(char*)_action;
-(void)GoogleAnalytics_SendEventExt:(char*)_category Arg2:(char*)_action Arg3:(char*)_label Arg4:(double)_value;

@end
