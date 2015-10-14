//
//  LeftMenuView.m
//  AcAnonymous
//
//  Created by succlz123 on 15/8/27.
//  Copyright (c) 2015年 succlz123. All rights reserved.
//

#import "LeftMenuView.h"
#import "View+MASAdditions.h"

@interface LeftMenuView () <UITableViewDataSource, UITableViewDelegate>


@property(nonatomic) CGFloat firstX;
@property(nonatomic) CGFloat firstY;


@end

@implementation LeftMenuView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
    imageView.contentMode = UIViewContentModeScaleToFill;

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    imageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.width);

    tableView.tableHeaderView = imageView;

    tableView.dataSource = self;
    tableView.delegate = self;

//    [tableView.tableHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.width.mas_equalTo(CGSizeMake(40, 40));
//    }];

    [self addSubview:tableView];


    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];


    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self setUserInteractionEnabled:YES];
    [self addGestureRecognizer:pan];

}

#pragma mark - DataSource

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 16;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    switch (indexPath.item) {
        case 0:
            cell.textLabel.text = @"综合版1";
            break;
        case 1:
            cell.textLabel.text = @"欢乐恶搞";
            break;
        case 2:
            cell.textLabel.text = @"推理";
            break;
        case 3:
            cell.textLabel.text = @"技术讨论";
            break;
        case 4:
            cell.textLabel.text = @"美食";
            break;
        case 5:
            cell.textLabel.text = @"喵版";
            break;
        case 6:
            cell.textLabel.text = @"音乐";
            break;
        case 7:
            cell.textLabel.text = @"校园(考试)";
            break;
        case 8:
            cell.textLabel.text = @"文学(推书)";
            break;
        case 9:
            cell.textLabel.text = @"绘画涂鸦(二创)";
            break;
        case 10:
            cell.textLabel.text = @"姐妹(淑女)";
            break;
        case 11:
            cell.textLabel.text = @"女性向";
            break;
        case 12:
            cell.textLabel.text = @"女装(时尚)";
            break;
        case 13:
            cell.textLabel.text = @"日记(树洞)";
            break;
        case 14:
            cell.textLabel.text = @"WIKI";
            break;
        case 15:
            cell.textLabel.text = @"都市怪谈";
            break;
        default:
            cell.textLabel.text = @"";
            break;
    }
    cell.textLabel.text;


    return cell;
}

#pragma mark - Delegate

#pragma mark 设置分组标题内容高度

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

#pragma mark 设置每行高度（每行高度可以不一样）

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

#pragma mark 设置尾部说明内容高度

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            NSLog(@"%d", indexPath.row);
            break;
        case 1:
            NSLog(@"%d", indexPath.row);
            break;
        case 2:
            NSLog(@"%d", indexPath.row);
            break;
        case 3:
            NSLog(@"%d", indexPath.row);
            break;
    }

}

- (void)handlePan:(UIPanGestureRecognizer *)rec {
    CGPoint point = [rec translationInView:self];
//    NSLog(@"%f,%f", point.x, point.y);

    if ([rec state] == UIGestureRecognizerStateBegan) {
        self.firstX = rec.view.center.x;
        self.firstY = rec.view.center.y;
        NSLog(@"self.view bounds is %@", NSStringFromCGRect(self.bounds));
        NSLog(@"pan gesture View begin  is %@,%@", NSStringFromCGPoint([rec view].center), NSStringFromCGRect([rec view].frame));
    }

    if ([(UIPanGestureRecognizer *) rec state] == UIGestureRecognizerStateChanged) {
        CGFloat x = self.firstX + point.x;
        CGFloat y = self.firstY + point.y;

        if (x < rec.view.frame.size.width / 2.0) {
            x = rec.view.frame.size.width / 2.0;
        } else if (x + self.frame.size.width / 2.0 > self.frame.size.width) {
            x = self.frame.size.width - self.frame.size.width / 2.0;
        }

        if (y < rec.view.frame.size.height / 2.0) {
            y = rec.view.frame.size.height / 2.0;
        } else if (y + rec.view.frame.size.height / 2.0 > self.frame.size.height) {
            y = self.frame.size.height - rec.view.frame.size.height / 2.0;
        }

        NSLog(@"gesture translatedPoint moving  is %@", NSStringFromCGPoint(point));

        rec.view.center = CGPointMake(x, y);
    }

    if ([rec state] == UIGestureRecognizerStateEnded || [rec state] == UIGestureRecognizerStateCancelled) {
        CGFloat x = rec.view.center.x;
        CGFloat y = rec.view.center.y;

        if (x > self.firstX) {
            x = self.frame.size.width - rec.view.frame.size.width / 2.0;
        } else {
            x = rec.view.frame.size.width / 2.0;
        }

        if (y > self.firstY) {
            y = self.frame.size.height - rec.view.frame.size.height / 2.0;
        } else {
            y = rec.view.frame.size.height / 2.0;
        }

        CGFloat velocityX = (0.2 * [rec velocityInView:self].x);

        [UIView beginAnimations:nil context:NULL];

        [UIView setAnimationDuration:ABS(velocityX * 0.00002 + 0.2)];

        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];

        rec.view.center = CGPointMake(x, y);

        [UIView commitAnimations];

        NSLog(@"gesture translatedPoint  end is %@", NSStringFromCGPoint(point));

        NSLog(@"pan gesture testPanView end  is %@,%@", NSStringFromCGPoint([rec view].center), NSStringFromCGRect([rec view].frame));

    }

//    [rec setTranslation:CGPointMake(0, 0) inView:self];
//
//
//    CGRect frame = CGRectMake(0, 0, point.x, [[UIScreen mainScreen] bounds].size.height);
//    [UIView animateWithDuration:0.2f animations:^{
//        self.frame = frame;
//    }];

}


@end
