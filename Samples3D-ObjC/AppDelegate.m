//
//  AppDelegate.m
//  Samples3D-ObjC
//
//  Created by Edgar on 11/17/15.
//  Copyright © 2015 hunk. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (){
    UIApplicationShortcutItem *currentShortcutItem;
}

@end

@implementation AppDelegate

-(BOOL)handleShortcut:(UIApplicationShortcutItem*)shortcutItem {

    BOOL succeeded = false;
    
    UITabBarController *tabBarController = (UITabBarController*)self.window.rootViewController;
    if ([shortcutItem.type isEqualToString:@"com.unique.myapp.item1"]) {
        tabBarController.selectedIndex = 0;
    } else if ([shortcutItem.type isEqualToString:@"com.unique.myapp.item2"]) {
        tabBarController.selectedIndex = 1;
    } else if ([shortcutItem.type isEqualToString:@"com.unique.myapp.item3"]) {
        tabBarController.selectedIndex = 2;
    }
    
    //some especial action
    succeeded = true;
    
    return succeeded;
}

-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL succeeded))completionHandler {
    
    completionHandler([self handleShortcut:shortcutItem]);

}


-(void)createShortcutItem{

    UIMutableApplicationShortcutItem *item1 = [[UIMutableApplicationShortcutItem alloc]
                                               initWithType:@"com.unique.myapp.item1"
                                               localizedTitle:NSLocalizedString(@"Item 1", @"Item 1 in shortcuts")
                                               localizedSubtitle:NSLocalizedString(@"Subtitle 1", @"")
                                               icon:[UIApplicationShortcutIcon iconWithType: UIApplicationShortcutIconTypeFavorite]
                                               userInfo: @{@"url" : @"myapp://item1/"}];
    
    UIMutableApplicationShortcutItem *item2 = [[UIMutableApplicationShortcutItem alloc]
                                               initWithType:@"com.unique.myapp.item2"
                                               localizedTitle:NSLocalizedString(@"Item 2", @"Item 2 in shortcuts")
                                               localizedSubtitle:nil
                                               icon:[UIApplicationShortcutIcon iconWithType: UIApplicationShortcutIconTypeSearch]
                                               userInfo: @{@"url" : @"myapp://item2/"}];
    
    UIMutableApplicationShortcutItem *item3 = [[UIMutableApplicationShortcutItem alloc]
                                               initWithType:@"com.unique.myapp.item3"
                                               localizedTitle:NSLocalizedString(@"Item 3", @"Item 3 in shortcuts")
                                               localizedSubtitle:NSLocalizedString(@"Subtitle 3", @"")
                                               icon:[UIApplicationShortcutIcon iconWithTemplateImageName:@"Bike"]
                                               userInfo: @{@"url" : @"myapp://item3/"}];

    [UIApplication sharedApplication].shortcutItems = @[item1,item2,item3];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    BOOL appLaunchedFromShortCut = false;
    currentShortcutItem = nil;

    if ([launchOptions objectForKey:UIApplicationLaunchOptionsShortcutItemKey]) {
        appLaunchedFromShortCut = true;
        currentShortcutItem = [launchOptions objectForKey:UIApplicationLaunchOptionsShortcutItemKey];
    }
    
    [self createShortcutItem];
    
    return !appLaunchedFromShortCut;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    if (currentShortcutItem) {
        [self handleShortcut:currentShortcutItem];
        currentShortcutItem = nil;
    }
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
