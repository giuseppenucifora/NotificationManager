//
//  PushNotificationManager.h
//  NotificationManager
//
//  Created by Giuseppe Nucifora on 07/10/15.
//  Copyright (c) 2015 Giuseppe Nucifora. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PushNotification.h"
#import <MPGNotification/MPGNotification.h>

typedef void (^PushNotificationBlock)(PushNotification *pushNotification);

@interface PushNotificationManager : NSObject

//@property (nonatomic, copy) PushNotificationBlock pushNotificationBlock;

/**
 * gets singleton object.
 * @return singleton
 */
+ (PushNotificationManager*)sharedInstance;

- (void) addNotificationHandler:(PushNotificationBlock) block;

- (void) sendPushNotificationToHandlers:(NSDictionary*) userInfo;

- (void) getPushNotificationFromUserInfo: (NSDictionary*) userInfo
                        withBlockSuccess: (PushNotificationBlock) success
                                 failure: (void (^)(BOOL status)) failure;

@end
