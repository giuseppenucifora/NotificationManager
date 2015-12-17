//
//  PushNotification.h
//  NotificationManager
//
//  Created by Giuseppe Nucifora on 07/10/15.
//  Copyright (c) 2015 Giuseppe Nucifora. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PushNotificationAlert.h"
#import "PushNotificationBody.h"



@interface PushNotification : NSObject

- (instancetype) initWithNotificationInfo:(NSDictionary *) notificationInfo;

@property (nonatomic, strong, readonly) PushNotificationAlert *alert;
@property (nonatomic, strong, readonly) NSNumber *badge;
@property (nonatomic, strong, readonly) NSString *sound;
@property (nonatomic, strong, readonly) NSString *category;
@property (nonatomic, strong, readonly) PushNotificationBody *body;

@end
