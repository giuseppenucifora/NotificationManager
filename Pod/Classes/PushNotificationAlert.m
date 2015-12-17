//
//  PushNotificationAlert.m
//  Pods
//
//  Created by Giuseppe Nucifora on 17/12/15.
//
//

#import "PushNotificationAlert.h"

#define NOTIFICATION_ALERT_TITLE @"title"
#define NOTIFICATION_ALERT_BODY @"body"
#define NOTIFICATION_ALERT_LOC_KEY @"loc-key"
#define NOTIFICATION_ALERT_LOC_ARGS @"loc-args"
#define NOTIFICATION_ALERT_ACTION_LOC_KEY @"action-loc-key"

@implementation PushNotificationAlert

/*
 "alert" : {
 "title" : "Game Request",
 "body" : "Bob wants to play poker",
 "action-loc-key" : "PLAY"
 "loc-args" = ("peppino.peaaa");
 "loc-key" = NLIKE;
 },
 */

+ (instancetype) AlertWithInfo:(NSDictionary *)alertInfo {
    return [[PushNotificationAlert alloc] initWithAlertInfo:alertInfo];
}

- (instancetype) initWithAlertInfo:(NSDictionary *)alertInfo {
    self = [super init];
    if (self) {
        
        if (alertInfo && [alertInfo isKindOfClass:[NSDictionary class]]) {
            
            for (NSString *key  in [alertInfo allKeys]) {
                ((void (^)())@{
                               NOTIFICATION_ALERT_TITLE : ^{
                    _title = [alertInfo objectForKey:key];
                },
                               NOTIFICATION_ALERT_BODY : ^{
                    _body = [alertInfo objectForKey:key];
                },
                               NOTIFICATION_ALERT_LOC_KEY : ^{
                    _localizedKey = [alertInfo objectForKey:key];
                },
                               NOTIFICATION_ALERT_LOC_ARGS : ^{
                    
                    if ([[alertInfo objectForKey:key] isKindOfClass:[NSArray class]]) {
                        _localizedArgs = [[NSArray alloc] initWithArray:[alertInfo objectForKey:key]];
                    }
                },
                               NOTIFICATION_ALERT_ACTION_LOC_KEY : ^{
                    _actionLocalizedKey = [alertInfo objectForKey:key];
                }
                               }[key] ?: ^{
                                   NSLog(@"Notification alert default");
                               })();
            }
            
        }
    }
    
    return self;
}

@end
