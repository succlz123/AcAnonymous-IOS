//
//  MeNavigationController.m
//  AcAnonymous
//
//  Created by succlz123 on 15/8/26.
//  Copyright (c) 2015年 succlz123. All rights reserved.
//

#import "MeNavigationController.h"

@interface MeNavigationController ()

@end

@implementation MeNavigationController

- (void)loadView {
    [super loadView];
    self.tabBarItem.title = @"个人";
    self.tabBarItem.image = [UIImage imageNamed:@"me"];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
