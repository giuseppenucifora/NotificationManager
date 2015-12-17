//
//  PushNotification.m
//  NotificationManager
//
//  Created by Giuseppe Nucifora on 07/10/15.
//  Copyright (c) 2015 Giuseppe Nucifora. All rights reserved.
//

#import "PushNotification.h"
#import "PushNotificationAlert.h"
#import "PushNotificationBody.h"

#define NOTIFICATION_APS @"aps"

#define NOTIFICATION_APS_ALERT @"alert"

#define NOTIFICATION_APS_BADGE @"badge"
#define NOTIFICATION_APS_SOUND @"sound"
#define NOTIFICATION_APS_CATEGORY @"category"

#define NOTIFICATION_BODY @"body"

/*{
    "aps" : {
        "alert" : {
            "title" : "Game Request",
            "body" : "Bob wants to play poker",
            "action-loc-key" : "PLAY"
            "loc-args" = ("peppino.peaaa");
            "loc-key" = NLIKE;
        },
        "badge" : 9,
        "sound" : "bingbong.aiff",
        "category" : "NEW_MESSAGE_CATEGORY"
        
    },
 "body" : {
    "objectId" : "",
    "action" : ""
 }
    
}*/

@implementation PushNotification

- (instancetype) initWithNotificationInfo:(NSDictionary *)notificationInfo {
    self = [super init];
    if (self) {
        
        
        if ([notificationInfo isKindOfClass:[NSDictionary class]]) {
            
            for (NSString *key in [notificationInfo allKeys]) {
                ((void (^)())@{
                               NOTIFICATION_APS : ^{
                    
                    for (NSString *apsKey in [[notificationInfo objectForKey:key] allKeys]) {
                        
                        ((void (^)())@{
                                       NOTIFICATION_APS_ALERT : ^{
                            _alert = [PushNotificationAlert AlertWithInfo:[[notificationInfo objectForKey:key] objectForKey:apsKey]];
                        },
                                       NOTIFICATION_APS_BADGE : ^{
                            _badge = [NSNumber numberWithInteger:[[[notificationInfo objectForKey:key] objectForKey:apsKey] integerValue]];
                        },
                                       NOTIFICATION_APS_SOUND : ^{
                            _sound = [[notificationInfo objectForKey:key] objectForKey:apsKey];
                        },
                                       NOTIFICATION_APS_CATEGORY : ^{
                            _category = [[notificationInfo objectForKey:key] objectForKey:apsKey];
                        }
                                       }[apsKey] ?: ^{
                                           NSLog(@"Notification aps default");
                                       })();
                        
                    }
                    
                },
                               NOTIFICATION_BODY : ^{
                    _body = [PushNotificationBody BodyWithInfo:[notificationInfo objectForKey:key]];
                    
                },
                               }[key] ?: ^{
                                   NSLog(@"Notification default");
                               })();
            }
        }
    }
    return self;
}

@end
