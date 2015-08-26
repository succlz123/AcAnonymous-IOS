//
//  AppDelegate.m
//  AcAnonymous
//
//  Created by succlz123 on 15/8/26.
//  Copyright (c) 2015年 succlz123. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"
#import "HomeNavigationController.h"
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "MeViewController.h"
#import "MeNavigationController.h"
#import "SearchNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //程序启动之后执行，只有在第一次程序启动后才执行，以后不再执行；

    //设置window属性（在AppDelegate中定义的window属性）¡，初始化windows的大小和位置
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //设置window的背景
    self.window.backgroundColor = [UIColor whiteColor];

    MainTabBarController *mainTabBarController = [[MainTabBarController alloc] init];
    self.window.rootViewController = mainTabBarController;

    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    SearchViewController *searchViewController = [[SearchViewController alloc] init];
    MeViewController *meViewController = [[MeViewController alloc] init];

    HomeNavigationController *homeNavigationController = [[HomeNavigationController alloc] initWithRootViewController:homeViewController];
    SearchNavigationController *searchNavigationController = [[SearchNavigationController alloc] initWithRootViewController:searchViewController];
    MeNavigationController *meNavigationController = [[MeNavigationController alloc] initWithRootViewController:meViewController];

    homeNavigationController.tabBarItem.title = @"首页";
    searchNavigationController.tabBarItem.title = @"搜索";
    meNavigationController.tabBarItem.title = @"我的";

    homeNavigationController.tabBarItem.image= [UIImage imageNamed:@"home"];
    searchNavigationController.tabBarItem.image= [UIImage imageNamed:@"search"];
    meNavigationController.tabBarItem.image= [UIImage imageNamed:@"me"];

//    NSArray *controllers= [NSArray arrayWithObjects:homeNavigationController,searchNavigationController,meNavigationController,nil];
//    [mainTabBarController addChildViewController:homeNavigationController];
//    [mainTabBarController addChildViewController:searchNavigationController];
//    [mainTabBarController addChildViewController:meNavigationController];

    mainTabBarController.viewControllers=@[homeNavigationController,searchNavigationController,meNavigationController];

    //设置window为应用程序主窗口并设为可见
    [self.window makeKeyAndVisible];

    return YES;
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
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
