//
//  Released by YoYo Games Ltd. on ??/09/2014. Intended for use with GM: S EA97 and above ONLY.
//  Copyright YoYo Games Ltd., 2014.
//  For support please submit a ticket at help.yoyogames.com
//
//

package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.RunnerActivity;
import com.yoyogames.runner.RunnerJNILib;
import android.util.Log;

import com.google.android.gms.analytics.GoogleAnalytics;
import com.google.android.gms.analytics.Tracker;
import com.google.android.gms.analytics.HitBuilders;
import com.google.android.gms.analytics.Logger.*;

public class GoogleAnalyticsExt
{
	private Tracker mTracker;

	public void GoogleAnalytics_Init(String _trackingId, double _dryRun )
	{
		GoogleAnalytics ga = GoogleAnalytics.getInstance(RunnerActivity.CurrentActivity);
		boolean bDryRun = (_dryRun >=0.5) ? true : false;
		ga.setDryRun( bDryRun );
		ga.getLogger().setLogLevel(LogLevel.VERBOSE);
		
		//By default, data is dispatched from the Google Analytics SDK for Android every 30 minutes.
		//Local dispatching is only used in the absence of Google Play services on the device
		//ga.setLocalDispatchPeriod(30);	// Set the dispatch period in seconds.
		//Log.i("yoyo", "Setting Dispatch interval to 30 seconds");
		
		Log.i("yoyo", "GoogleAnalytics_Init: trackingId:" + _trackingId + " bDryRun:" + bDryRun );
		mTracker = ga.newTracker( _trackingId );
	}
	
	public void GoogleAnalytics_SendScreenView(String _screenName )
	{
		if( mTracker != null)
		{
			Log.i("yoyo", "GoogleAnalytics_SendScreenView: screenName:" + _screenName );
			mTracker.setScreenName( _screenName );
			mTracker.send(new HitBuilders.AppViewBuilder().build());
			
		}
	}
	
	public void GoogleAnalytics_SendEvent(String _category, String _action )
	{
		if( mTracker != null )
		{
			Log.i("yoyo", "GA SendEvent: category:" + _category + " action:" + _action );
			mTracker.send( new HitBuilders.EventBuilder()
				.setCategory(_category)
				.setAction(_action)
				.build());
		}
	}
	
	public void GoogleAnalytics_SendEventExt(String _category, String _action, String _label, double _value )
	{
		if( mTracker != null )
		{
			long lval = (long)_value;
			Log.i("yoyo", "GA SendEventExt: category:" + _category + " action:" + _action + " label:" + _label + " value:" + lval);
			mTracker.send( new HitBuilders.EventBuilder()
				.setCategory(_category)
				.setAction(_action)
				.setLabel(_label)
				.setValue(lval)
				.build());
		}
	}

}


