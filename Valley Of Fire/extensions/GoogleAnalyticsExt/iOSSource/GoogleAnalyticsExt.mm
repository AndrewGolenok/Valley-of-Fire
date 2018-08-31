//
//  Released by YoYo Games Ltd. on 17/04/2014. Intended for use with GM: S EA97 and above ONLY.
//  Copyright YoYo Games Ltd., 2014.
//  For support please submit a ticket at help.yoyogames.com
//
//

#import "GoogleAnalyticsExt.h"
#import "GAI.h"
#import "GAIFields.h"
#import "GAITracker.h"
#import "GAIDictionaryBuilder.h"
#import "UIKit/UIkit.h"

@implementation GoogleAnalyticsExt

-(void)GoogleAnalytics_Init:(char*)_trackingId Arg2:(double)_dryRun;
{
	//By default, data is dispatched from the Google Analytics SDK for iOS every 2 minutes.
	[[GAI sharedInstance] setDispatchInterval:30];
	BOOL bDryRun = (_dryRun >=0.5) ? YES : NO;
	NSString* nsTrackingId = [NSString stringWithUTF8String:_trackingId];
	NSLog(@"GoogleAnalytics_Init trackingId:%@ DryRun:%d", nsTrackingId , bDryRun );
	
	[[GAI sharedInstance] setDryRun:bDryRun];
	//[[GAI sharedInstance].logger setLogLevel:kGAILogLevelVerbose];	// Set the log level to verbose.
	[[GAI sharedInstance] trackerWithTrackingId:nsTrackingId];
}

-(void)GoogleAnalytics_SendScreenView:(char*)_screenName
{
	id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
	if( tracker != nil )
	{
		NSString* nsScreenName = [NSString stringWithUTF8String:_screenName];
		NSLog(@"GoogleAnalytics_SendScreenView: screenName:%@", nsScreenName );
		[tracker set:kGAIScreenName value:nsScreenName];
		[tracker send:[[GAIDictionaryBuilder createAppView] build]];
	}
}

-(void)GoogleAnalytics_SendEvent:(char*)_category Arg2:(char*)_action
{
	[self GoogleAnalytics_SendEventExt:_category Arg2:_action Arg3:NULL Arg4:0];
}

-(void)GoogleAnalytics_SendEventExt:(char*)_category Arg2:(char*)_action Arg3:(char*)_label Arg4:(double)_value
{
	id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
	if( tracker != nil )
	{
		NSString* nsCategory = [NSString stringWithUTF8String:_category];
		NSString* nsAction = [NSString stringWithUTF8String:_action];
		NSString* nsLabel = nil;
		NSNumber* nsValue = nil;
		
		if( _label != NULL )
		{
			nsLabel = [NSString stringWithUTF8String:_label];
			nsValue = [NSNumber numberWithDouble:_value];
		}
		
		NSLog(@"GoogleAnalytics SendEvent: category:%@ action:%@ label:%@ value:%@", nsCategory, nsAction, nsLabel, nsValue );
		[tracker send:[[GAIDictionaryBuilder createEventWithCategory:nsCategory action:nsAction label:nsLabel value:nsValue] build]];
	}
}

@end

