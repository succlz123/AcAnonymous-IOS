//
//  MainTabBarController.m
//  AcAnonymous
//
//  Created by succlz123 on 15/8/26.
//  Copyright (c) 2015年 succlz123. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeNavigationController.h"
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "MeViewController.h"
#import "MeNavigationController.h"
#import "SearchNavigationController.h"
#import "NodeNavigationViewController.h"
#import "NodeViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController


- (void)loadView {
    [super loadView];
    [self configureViewControllers];

}

- (void)viewDidLoad {
    [super viewDidLoad];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureViewControllers {
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    HomeNavigationController *homeNavigationController = [[HomeNavigationController alloc] initWithRootViewController:homeViewController];

    NodeViewController *nodeViewController = [[NodeViewController alloc] init];
    NodeNavigationViewController *nodeNavigationViewController = [[NodeNavigationViewController alloc] initWithRootViewController:nodeViewController];

    SearchViewController *searchViewController = [[SearchViewController alloc] init];
    SearchNavigationController *searchNavigationController = [[SearchNavigationController alloc] initWithRootViewController:searchViewController];

    MeViewController *meViewController = [[MeViewController alloc] init];
    MeNavigationController *meNavigationController = [[MeNavigationController alloc] initWithRootViewController:meViewController];

    //    NSArray *controllers= [NSArray arrayWithObjects:homeNavigationController,searchNavigationController,meNavigationController,nil];
//    [mainTabBarController addChildViewController:homeNavigationController];
//    [mainTabBarController addChildViewController:searchNavigationController];
//    [mainTabBarController addChildViewController:meNavigationController];

    self.viewControllers = @[homeNavigationController, nodeNavigationViewController, searchNavigationController, meNavigationController];
}

#pragma mark - Navigation

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}


@end
