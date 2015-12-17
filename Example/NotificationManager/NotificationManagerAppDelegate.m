//
//  NotificationManagerAppDelegate.m
//  NotificationManager
//
//  Created by Giuseppe Nucifora on 12/16/2015.
//  Copyright (c) 2015 Giuseppe Nucifora. All rights reserved.
//

#import "NotificationManagerAppDelegate.h"
#import "PushNotificationManager.h"

@implementation NotificationManagerAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    
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
    
    
    /**
     *  Simulate arrive of PushNotification
     */
    
    NSDictionary * alert = [[NSDictionary alloc] initWithObjects:@[@"Notification alert title",@"Notification alert body",@"Notification alert action loc key",@"Notification alert loc key",@[@"arg1",@"arg2",@"arg3"]] forKeys:@[@"title",@"body",@"action-loc-key",@"loc-key",@"loc-args"]];
    
    
    NSDictionary *aps = [[NSDictionary alloc] initWithObjects:@[alert,@"9",@"sound.aiff",@"category"] forKeys:@[@"alert", @"badge",@"sound",@"category"]];
    
    NSDictionary *body = @{@"objectId":@"oiuhbubi87y",@"action":@"NEW_MESSAGE"};
    
    NSMutableDictionary *notificationDictionary = [[NSMutableDictionary alloc] init];
    
    [notificationDictionary setObject:aps forKey:@"aps"];
    [notificationDictionary setObject:body forKey:@"body"];
    
    NSLog(@"%@",notificationDictionary);
    
    [[PushNotificationManager sharedInstance] addNotificationHandler:^(PushNotification *pushNotification) {
        
        
        NSLog(@"%@",[[pushNotification alert] title]);
        NSLog(@"%@",[[pushNotification alert] body]);
        NSLog(@"%@",[[pushNotification alert] actionLocalizedKey]);
        NSLog(@"%@",[[pushNotification alert] localizedArgs]);
        NSLog(@"%@",[[pushNotification alert] localizedKey]);
        
        NSLog(@"%@",[[pushNotification body] objectId]);
        NSLog(@"%@",[NSNumber numberWithInteger:[[pushNotification body] action]]);
        NSLog(@"%@",[[pushNotification body] actionString]);
        
        
    }];
    
    [[PushNotificationManager sharedInstance] sendPushNotificationToHandlers:notificationDictionary];
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
