//
//  HomeViewController.m
//  AcAnonymous
//
//  Created by succlz123 on 15/8/26.
//  Copyright (c) 2015年 succlz123. All rights reserved.
//

#import "HomeViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "LeftMenuView.h"

@interface HomeViewController ()

@property(nonatomic, strong) LeftMenuView *leftMenuView;
@property(nonatomic, strong) UIVisualEffectView *visualEffectView;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Ac匿名版";

    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithTitle:@"其他板块" style:UIBarButtonItemStylePlain target:self action:@selector(selectLeftBarButton)];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(selectRightBarButton)];

    self.navigationItem.leftBarButtonItem = leftBarButton;
    self.navigationItem.rightBarButtonItem = rightBarButton;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)selectLeftBarButton {
//    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"更多更多" delegate:self  cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//    [alter show];

//    NSString *requestAddress = @"http://hacfun.tv/Api/getForumList";
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//
//    // 不带参数的GET请求
//    [manager GET:requestAddress
//      parameters:nil
//         success:^(AFHTTPRequestOperation *operation, id responseObject) {
//             NSLog(@"%@", responseObject);
//         }
//         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//             NSLog(@"%@", error);
//         }];

    //侧滑菜单
    self.leftMenuView = [[LeftMenuView alloc] init];
    self.leftMenuView.frame = CGRectMake(-[[UIScreen mainScreen] bounds].size.width/2, 0, [[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height);
    self.leftMenuView.alpha = 0.7f;

    //高斯模糊效果
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    self.visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    self.visualEffectView.frame = self.leftMenuView.bounds;
    self.visualEffectView.backgroundColor = [UIColor whiteColor];

    [self.leftMenuView addSubview:self.visualEffectView];
//    [[self.visualEffectView contentView] addSubview:self.leftMenuView];

    //为了添加的侧滑菜单是覆盖在navigationController上面
    [self.navigationController.view addSubview:self.leftMenuView];

    CGRect frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height);
    [UIView animateWithDuration:0.2f animations:^{
        self.leftMenuView.frame = frame;
    }];


    self.leftMenuView.tag = 1;
    UITapGestureRecognizer *left = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self.leftMenuView addGestureRecognizer:left];

    self.view.tag = 2;
    UITapGestureRecognizer *home = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:home];

}

- (void)selectRightBarButton {

}


- (void)tapped:(UITapGestureRecognizer *)gesture {
    UIView *targetView = gesture.view;

    if (targetView.tag == 1) {
        NSLog(@"1");

    } else if (targetView.tag == 2) {
        if (!self.leftMenuView.hidden) {
            CGRect frame = CGRectMake(-[[UIScreen mainScreen] bounds].size.width/2, 0, [[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height);
            [UIView animateWithDuration:0.2f animations:^{
//            self.leftMenuView.frame = frame;
//            self.visualEffectView.frame=frame;
                [self.leftMenuView setHidden:YES];
                NSLog(@"2");
            }];
        }
    }
}


@end
