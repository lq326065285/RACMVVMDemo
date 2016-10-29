//
//  AppDelegate.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/22.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "AppDelegate.h"

#import "LQHomeViewController.h"

#import "LQCategoryViewController.h"

#import "LQMineViewController.h"

#import "LQLoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self gotoLoginVC];
    [LQGlobalService startListen];
    return YES;
}

-(void)createHomePage{
    LQHomeViewController * homeVC = [[LQHomeViewController alloc] init];
    homeVC.title = @"主页";
    UITabBarItem * homeItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];
    homeVC.tabBarItem = homeItem;
    UINavigationController * n1 = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    LQCategoryViewController * categoryVC = [[LQCategoryViewController alloc] init];
    categoryVC.title = @"分类";
    UITabBarItem * categoryItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:0];
    categoryVC.tabBarItem = categoryItem;
    UINavigationController * n2 = [[UINavigationController alloc] initWithRootViewController:categoryVC];
    
    LQMineViewController * mineVC = [[LQMineViewController alloc] init];
    mineVC.title = @"我的";
    UITabBarItem * mineItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:0];
    mineVC.tabBarItem = mineItem;
    UINavigationController * n3 = [[UINavigationController alloc] initWithRootViewController:mineVC];
    
    UITabBarController * tbc = [[UITabBarController alloc] init];
    tbc.viewControllers = @[n1,n2,n3];
    self.window.rootViewController = tbc;
}

-(void)gotoLoginVC{
    LQLoginViewController * loginVC = [[LQLoginViewController alloc] init];
    UINavigationController * n = [[UINavigationController alloc] initWithRootViewController:loginVC];
    self.window.rootViewController = n;
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
