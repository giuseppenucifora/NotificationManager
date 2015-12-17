//
//  PushNotificationManager.m
//  NotificationManager
//
//  Created by Giuseppe Nucifora on 07/10/15.
//  Copyright (c) 2015 Giuseppe Nucifora. All rights reserved.
//

#import "PushNotificationManager.h"

@interface PushNotificationManager()

@property (nonatomic, strong) NSMutableArray *notificationHandlers;

@end

@implementation PushNotificationManager

static PushNotificationManager *SINGLETON = nil;

static bool isFirstAccess = YES;

#pragma mark - Public Method

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];
    });
    
    return SINGLETON;
}

- (void) addNotificationHandler:(PushNotificationBlock) block {
    
    if (block) {
        if (![_notificationHandlers containsObject:block]) {
            [_notificationHandlers addObject:block];
        }
    }
}

- (void) removeNotificationHandler:(PushNotificationBlock) block {
    if (block) {
        if ([_notificationHandlers containsObject:block]) {
            [_notificationHandlers removeObject:block];
        }
    }
}

- (void) sendPushNotificationToHandlers:(NSDictionary*) userInfo {
    
    [self getPushNotificationFromUserInfo:userInfo withBlockSuccess:^(PushNotification *pushNotification) {
        for (int i =0; i<[_notificationHandlers count]; i++) {
            PushNotificationBlock block = [_notificationHandlers objectAtIndex:i];
            
            if (block) {
                block(pushNotification);
            }
        }
    } failure:^(BOOL status) {
        
    }];
}

- (void) getPushNotificationFromUserInfo: (NSDictionary*) userInfo
                        withBlockSuccess: (void (^)(PushNotification *pushNotification))success
                                 failure: (void (^)(BOOL status))failure {
    
    PushNotification *notification = [[PushNotification alloc] initWithNotificationInfo:userInfo];
    
    if (notification) {
        if (success) {
            success(notification);
        }
    }
    else {
        if (failure) {
            failure(NO);
        }
    }
}

#pragma mark - Life Cycle

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return [[PushNotificationManager alloc] init];
}

- (id)mutableCopy
{
    return [[PushNotificationManager alloc] init];
}

- (id) init
{
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    if (self) {
        _notificationHandlers = [[NSMutableArray alloc] init];
    }
   
    return self;
}


@end
