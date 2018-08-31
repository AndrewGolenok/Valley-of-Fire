{
    "id": "e431a8e6-f0c5-4643-830c-2127c2b1b31d",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "GoogleAnalyticsExt",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        "android.permission.INTERNET",
        "android.permission.ACCESS_NETWORK_STATE"
    ],
    "androidProps": true,
    "androidactivityinject": "",
    "androidclassname": "GoogleAnalyticsExt",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "GoogleAnalyticsExt",
    "copyToTargets": 834777342120174,
    "date": "2018-56-31 04:08:39",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "808ea33b-e4c1-44a0-8a62-d5bf117378be",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 35651596,
            "filename": "GoogleAnalyticsExt.ext",
            "final": "",
            "functions": [
                {
                    "id": "cf1a01f2-c724-4dbd-88e5-5eded4f8cd89",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "GoogleAnalytics_Init",
                    "help": "GoogleAnalytics_Init( trackingID, bDryRun )",
                    "hidden": false,
                    "kind": 11,
                    "name": "GoogleAnalytics_Init",
                    "returnType": 2
                },
                {
                    "id": "23ed04eb-342a-4f30-9031-933bad482fff",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "GoogleAnalytics_SendScreenView",
                    "help": "GoogleAnalytics_SendScreenView( screenName )",
                    "hidden": false,
                    "kind": 11,
                    "name": "GoogleAnalytics_SendScreenView",
                    "returnType": 2
                },
                {
                    "id": "9dbc6cf7-57e4-4744-92cb-eb476e01688d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "GoogleAnalytics_SendEvent",
                    "help": "GoogleAnalytics_SendEvent( category, action )",
                    "hidden": false,
                    "kind": 11,
                    "name": "GoogleAnalytics_SendEvent",
                    "returnType": 2
                },
                {
                    "id": "6781517f-7da1-4a88-af42-caf9ce4ffa5b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 4,
                    "args": [
                        1,
                        1,
                        1,
                        2
                    ],
                    "externalName": "GoogleAnalytics_SendEventExt",
                    "help": "GoogleAnalytics_SendEventExt( category, action, label, value )",
                    "hidden": false,
                    "kind": 11,
                    "name": "GoogleAnalytics_SendEventExt",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 4,
            "order": [
                
            ],
            "origname": "extensions\\GoogleAnalyticsExt.ext",
            "uncompress": false
        }
    ],
    "gradleinject": "compile 'com.google.android.gms:play-services-analytics:9.6.1'",
    "helpfile": "",
    "installdir": "",
    "iosProps": true,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosplistinject": "",
    "license": "Free to use, also for commercial games.",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "com.yoyogames.googleanalytics",
    "productID": "613CB732594A20D7D84D3DE524B4DD6D",
    "sourcedir": "",
    "version": "1.2.2"
}