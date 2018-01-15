//
//  AppDelegate.m
//  WritingEducation
//
//  Created by 张琼 on 2017/12/10.
//  Copyright © 2017年 qzhangmichael. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "HomeViewController.h"
#import <RESideMenu/RESideMenu.h>
#import "LeftMenuViewController.h"
#import "PersonInfoViewController.h"
#import "SignInViewController.h"
#import "BaseNavigationViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    HomeViewController *vc = [[HomeViewController alloc]init];
    BaseNavigationViewController *nav = [[BaseNavigationViewController alloc]initWithRootViewController:vc];
    LeftMenuViewController *leftMenuViewController = [[LeftMenuViewController alloc] init];
    UIViewController *rightMenuViewController = [[UIViewController alloc] init];
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:nav
                                                                    leftMenuViewController:leftMenuViewController
                                                                   rightMenuViewController:rightMenuViewController];
    sideMenuViewController.scaleContentView = NO;
//    sideMenuViewController.scaleMenuView = NO;
//    sideMenuViewController.contentViewShadowEnabled = YES;
//    sideMenuViewController.contentViewShadowOpacity  = 0.5;
    sideMenuViewController.backgroundImage = [UIImage imageNamed:@"photo-3.png"];
    self.window.rootViewController = sideMenuViewController;
    [self.window setRootViewController:sideMenuViewController];
    self.window.backgroundColor = [UIColor purpleColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
