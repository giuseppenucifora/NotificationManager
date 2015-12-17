//
//  PushNotificationBody.m
//  Pods
//
//  Created by Giuseppe Nucifora on 17/12/15.
//
//

#import "PushNotificationBody.h"

#define BODY_OBJECTID @"objectId"
#define BODY_ACTION @"action"


#define ACTION_NEW_MESSAGE @"NEW_MESSAGE"
#define ACTION_STAR_EVENT @"STAR"
#define ACTION_LIKE_EVENT @"LIKE"
#define ACTION_FOLLOW_USER @"FOLLOW_USER"
#define ACTION_NEW_REVIEW @"NEW_REVIEW"
#define ACTION_BUY_EVENT @"BUY"

static const NSArray *actionsArray;

#define PushNotificationActionFromString(string) (PushNotificationAction)[actionsArray indexOfObject:string]

@implementation PushNotificationBody

+ (void)initialize
{
    actionsArray = @[ACTION_NEW_MESSAGE,ACTION_STAR_EVENT,ACTION_LIKE_EVENT,ACTION_FOLLOW_USER,ACTION_NEW_REVIEW,ACTION_BUY_EVENT];
}

+ (instancetype) BodyWithInfo:(NSDictionary *)bodyInfo {
    return [[PushNotificationBody alloc] initWithBodyInfo:bodyInfo];
}

- (instancetype) initWithBodyInfo:(NSDictionary *)bodyInfo {
    self = [super init];
    if (self) {
        
        if (bodyInfo && [bodyInfo isKindOfClass:[NSDictionary class]]) {
            
            for (NSString *key  in [bodyInfo allKeys]) {
                ((void (^)())@{
                               BODY_OBJECTID : ^{
                    _objectId = [bodyInfo objectForKey:key];
                },
                               BODY_ACTION : ^{
                    _actionString = [bodyInfo objectForKey:key];
                    if ([actionsArray containsObject:[bodyInfo objectForKey:key]]) {
                        _action = PushNotificationActionFromString([bodyInfo objectForKey:key]);
                    }
                    
                }
                               }[key] ?: ^{
                                   NSLog(@"Notification body default");
                               })();
            }
            
        }
        
    }
    return self;
}

@end
