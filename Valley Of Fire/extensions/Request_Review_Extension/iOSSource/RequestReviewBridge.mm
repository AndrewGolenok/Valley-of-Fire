//
//  RequestReviewBridge.m
//  Request Review Extension
//
//  Created by Josep Gonzalez Fernandez on 29/03/17.
//  Copyright © 2017 jgonfer.com. All rights reserved.
//

#import "RequestReviewBridge.h"
#include <asl.h>
#include <stdio.h>
#include <StoreKit/StoreKit.h>

@implementation RequestReviewBridge

// MARK: GameMaker Methods

- (double) requestReviewAppStore {
    if ([NSProcessInfo.processInfo isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){10,3,0}]) {
        [SKStoreReviewController requestReview];
        return 1;
    }
    return 0;
}

@end
