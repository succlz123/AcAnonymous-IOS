//
//  NodeViewController.m
//  AcAnonymous
//
//  Created by succlz123 on 15/10/8.
//  Copyright © 2015年 succlz123. All rights reserved.
//

#import "NodeViewController.h"
#import "NodeTableViewCell.h"

@interface NodeViewController () <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) NSArray *headerTitleArray;
@property(nonatomic, strong) NSArray *titleArray1;
@property(nonatomic, strong) NSArray *titleArray2;
@property(nonatomic, strong) NSArray *titleArray3;
@property(nonatomic, strong) NSArray *titleArray4;
@property(nonatomic, strong) NSArray *titleArray5;
@property(nonatomic, strong) NSArray *titleArray6;
@property(nonatomic, strong) NSArray *titleArray7;

@end

@implementation NodeViewController

- (void)loadView {
    [super loadView];

    self.navigationItem.title = @"节点";

}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.headerTitleArray = @[@"综合", @"二次元", @"游戏", @"2.5次元", @"三次元", @"管理", @"连线"];

    self.titleArray1 = @[@"综合1", @"欢乐恶搞", @"推理", @"技术讨论", @"美食(汪版)", @"喵版", @"音乐", @"校园(考试)", @"文学(推书)New!", @"绘画涂鸦(二创)", @"姐妹(淑女)", @"女性向", @"女装(时尚)", @"日记(树洞)", @"WIKI", @"都市怪谈"];
    self.titleArray2 = @[@"动画", @"漫画", @"国漫", @"美漫(小马)", @"轻小说", @"小说(连载)", @"GALGAME", @"VOCALOID", @"东方Project", @"舰娘", @"LoveLive"];
    self.titleArray3 = @[@"游戏综合版", @"EVE", @"DNF", @"战争雷霆", @"LOL", @"DOTA", @"GTA5", @"Minecraft", @"音乐游戏", @"WOT坦克世界", @"WOW", @"D3", @"卡牌桌游", @"炉石传说", @"怪物猎人", @"口袋妖怪", @"AC大逃杀", @"索尼", @"任天堂", @"日麻"];
    self.titleArray4 = @[@"AKB48", @"SNH48", @"眼科(Cosplay)", @"声优", @"模型(手办)"];
    self.titleArray5 = @[@"电影/电视", @"摄影", @"体育", @"军武", @"数码", @"天台(股票)"];
    self.titleArray6 = @[@"值班室"];
    self.titleArray7 = @[@"AcFun", @"WIKI"];

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.dataSource = self;
    tableView.delegate=self;

    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.headerTitleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.headerTitleArray objectAtIndex:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";

    NodeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[NodeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
//    switch (indexPath.item) {
//        cell.textLabel.text = [self.titleArray1 objectAtIndex:indexPath.item];
//    }
//    [cell setNodesArray:<#(NSArray *)nodesArray#>] =;

//    NSString *cellText = [self.titleArray1 objectAtIndex:indexPath.row];
//    cell.textLabel.text = cellText;


    [cell setNodesArray:_titleArray2]  ;

    return cell;
}

#pragma mark Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 36;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row==0){
        return 100;
    }
    return 22;
}


@end
