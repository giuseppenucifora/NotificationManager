//
//  PushNotificationAlert.h
//  Pods
//
//  Created by Giuseppe Nucifora on 17/12/15.
//
//

#import <Foundation/Foundation.h>

@interface PushNotificationAlert : NSObject

+ (instancetype) AlertWithInfo:(NSDictionary *)alertInfo;

- (instancetype) initWithAlertInfo:(NSDictionary *)alertInfo;

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *body;
@property (nonatomic, strong, readonly) NSString *actionLocalizedKey;
@property (nonatomic, strong, readonly) NSString *localizedKey;
@property (nonatomic, strong, readonly) NSArray *localizedArgs;


@end
