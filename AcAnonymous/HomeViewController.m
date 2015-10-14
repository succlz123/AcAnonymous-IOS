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
#import "JSONKit.h"
#import "HomeTableViewCell.h"

@interface HomeViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) LeftMenuView *leftMenuView;
@property(nonatomic, strong) UIVisualEffectView *visualEffectView;

@property UIBarButtonItem *leftBarButton;
@property UIBarButtonItem *rightBarButton;

@property(nonatomic, strong) UITableView *homeTableView;

@property NSMutableArray *jsonMutableArray;

@end

@implementation HomeViewController

- (void)loadView {
    [super loadView];
    self.navigationItem.title = @"Ac匿名版";

    self.leftBarButton = [[UIBarButtonItem alloc] initWithTitle:@"其他板块" style:UIBarButtonItemStylePlain target:self action:@selector(selectLeftBarButton)];
    self.rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(selectRightBarButton)];

    self.navigationItem.leftBarButtonItem = self.leftBarButton;
    self.navigationItem.rightBarButtonItem = self.rightBarButton;

    self.homeTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.homeTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];


    [[UIScreen mainScreen] bounds].size.height;
    [[UIScreen mainScreen] bounds].size.width;

    //侧滑菜单
    self.leftMenuView = [[LeftMenuView alloc] init];
    self.leftMenuView.frame = CGRectMake(-[[UIScreen mainScreen] bounds].size.width * 0.8f, 0, [[UIScreen mainScreen] bounds].size.width * 0.8f, [[UIScreen mainScreen] bounds].size.height);
//    self.leftMenuView.alpha = 0.9f;

    //高斯模糊效果
//    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
//    self.visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//    self.visualEffectView.frame = self.leftMenuView.bounds;
//    self.visualEffectView.backgroundColor = [UIColor whiteColor];
//
//    [self.leftMenuView addSubview:self.visualEffectView];



    //为了添加的侧滑菜单是覆盖在tabBarController上面
    [self.tabBarController.view addSubview:self.leftMenuView];

    [self.view addSubview:self.homeTableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.homeTableView.dataSource = self;
    self.homeTableView.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)selectLeftBarButton {
//    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"更多更多" delegate:self  cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//    [alter show];

    NSString *requestAddress = @"http://h.nimingban.com/Api/showf?id=4&page=1";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    // 不带参数的GET请求
    [manager GET:requestAddress parameters:nil
         success:^void(AFHTTPRequestOperation *operation, id responseObject) {
             self.jsonMutableArray = responseObject;

             [self.homeTableView reloadData];
         }
         failure:^void(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"%@", error);
         }];

//    CGRect frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width * 0.8f, [[UIScreen mainScreen] bounds].size.height);
//    [UIView animateWithDuration:0.2f animations:^{
//        self.leftMenuView.frame = frame;
//    }];
//
//
//    self.leftMenuView.tag = 1;
//    UITapGestureRecognizer *left = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
//    [self.leftMenuView addGestureRecognizer:left];
//
//    self.view.tag = 2;
//    UITapGestureRecognizer *home = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
//    [self.view addGestureRecognizer:home];

}

- (void)selectRightBarButton {

}


- (void)tapped:(UITapGestureRecognizer *)gesture {
    UIView *targetView = gesture.view;

//    if (targetView.tag == 1) {
////        NSLog(@"1");
//
//    } else
    if (targetView.tag == 2) {
        if (!self.leftMenuView.hidden) {
            CGRect frame = CGRectMake(-[[UIScreen mainScreen] bounds].size.width * 0.8f, 0, [[UIScreen mainScreen] bounds].size.width * 0.8f, [[UIScreen mainScreen] bounds].size.height);
            [UIView animateWithDuration:0.2f animations:^{
                self.leftMenuView.frame = frame;
//            self.visualEffectView.frame=frame;
//                [self.leftMenuView setHidden:YES];
//                NSLog(@"2");
            }];
        }
    }
}

#pragma mark dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.jsonMutableArray.count > 0) {
        return self.jsonMutableArray.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellIdentifier = @"cellIdentifier";

    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (cell == nil) {
        cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

//    cell.textLabel.text = [[self.jsonMutableArray objectAtIndex:indexPath.item] objectForKey:@"content"];
    cell.contentString = [[self.jsonMutableArray objectAtIndex:indexPath.item] objectForKey:@"content"];


    return cell;
}

#pragma mark delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [self tableView:_homeTableView cellForRowAtIndexPath:indexPath];
//    HomeTableViewCell *cell = [self.homeTableView cellForRowAtIndexPath:indexPath];
//    NSLog(@"ss%p",cell);

    return cell.frame.size.height;
}


@end
