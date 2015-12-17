//
//  PushNotificationBody.h
//  Pods
//
//  Created by Giuseppe Nucifora on 17/12/15.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PushNotificationAction) {
    PushNotificationActionNewMessage = 0,
    PushNotificationActionStar,
    PushNotificationActionLike,
    PushNotificationActionFollowUser,
    PushNotificationActionNewReview,
    PushNotificationActionBuy
};

@interface PushNotificationBody : NSObject

+ (instancetype) BodyWithInfo:(NSDictionary *)bodyInfo;

- (instancetype) initWithBodyInfo:(NSDictionary *)bodyInfo;

@property (nonatomic, strong, readonly) NSString *objectId;
@property (nonatomic, strong, readonly) NSString *actionString;
@property (nonatomic, readonly) PushNotificationAction action;

@end
