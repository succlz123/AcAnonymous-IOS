//
//  NodeTableViewCell.m
//  AcAnonymous
//
//  Created by succlz123 on 15/10/8.
//  Copyright © 2015年 succlz123. All rights reserved.
//

#import "NodeTableViewCell.h"
#import "Helper.h"

@interface NodeTableViewCell ()

@property(nonatomic, strong) NSMutableArray *buttonArray;

@property(nonatomic, strong) UIImage *imageNormal;
@property(nonatomic, strong) UIImage *imageHighlighted;

@property(nonatomic, strong) UIView *topBorderLineView;
@property(nonatomic, strong) UIView *bottomBorderLineView;

@end

@implementation NodeTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.812 green:0.612 blue:0.859 alpha:1];

        self.clipsToBounds = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;


        self.buttonArray = [[NSMutableArray alloc] init];

        self.imageNormal = [Helper getImageWithColor:[UIColor colorWithWhite:0.951 alpha:1] size:(CGSize) {200, 28}];
        self.imageHighlighted = [Helper getImageWithColor:[UIColor colorWithRed:0.337 green:0.337 blue:0.337 alpha:1] size:(CGSize) {200, 28}];

//        self.topBorderLineView                    = [UIView new];
//        self.topBorderLineView.backgroundColor    = kLineColorBlackDark;
//        [self addSubview:self.topBorderLineView];

        self.bottomBorderLineView = [[UIView alloc] init];
        self.bottomBorderLineView.backgroundColor = [UIColor colorWithRed:0.494 green:0.404 blue:0.741 alpha:1];

        [self.contentView addSubview:self.bottomBorderLineView];
    }

    return self;
}

#pragma mark - Setter

- (void)setNodesArray:(NSArray *)nodesArray  {
    _nodesArray = nodesArray ;

    if (_nodesArray == nil) {
        return;
    }

    for (int i = 0; i < self.nodesArray.count; i++) {
        UIButton *button;
        if (i < self.buttonArray.count) {
            button = self.buttonArray[i];
        } else {
            button = [self createButton];

            [self.buttonArray addObject:button];
        }

//        V2NodeModel *model = self.nodesArray[i];
//        button.mode = model;

//        [self configureButton:button withModel:model];
    }
    [self layoutButtons];

}

- (void)layoutSubviews {
    [super layoutSubviews];
}


#pragma mark - Configure Button

- (UIButton *)createButton {

    UIButton *nodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nodeButton.frame=CGRectMake(2, 11, 111, 33);
    nodeButton.titleLabel.font = [UIFont systemFontOfSize:22];
    [nodeButton setTitleColor:[UIColor colorWithRed:0.837 green:0.337 blue:0.337 alpha:1] forState:UIControlStateNormal];
    [nodeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [nodeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];

//    @weakify(self);
//    [nodeButton bk_addEventHandler:^(UIButton *sender) {
//        @strongify(self);
//
//        sender.selected = YES;
//        [sender setBackgroundColor:kColorBlue];
//        V2NodeViewController *nodeVC = [[V2NodeViewController alloc] init];
//        nodeVC.model = sender.model;
//
//        [self.navi pushViewController:nodeVC animated:YES];
//        [self bk_performBlock:^(id obj) {
//            sender.selected = NO;
//            [sender setBackgroundColor:[UIColor clearColor]];
//        }          afterDelay:1.0];
//
//    }             forControlEvents:UIControlEventTouchUpInside];
//
//    [nodeButton bk_addEventHandler:^(id sender) {
//        [sender setBackgroundColor:kColorBlue];
//    }             forControlEvents:UIControlEventTouchDown];
//    [nodeButton bk_addEventHandler:^(id sender) {
//        [sender setBackgroundColor:[UIColor clearColor]];
//    }             forControlEvents:UIControlEventTouchCancel | UIControlEventTouchUpOutside | UIControlEventTouchDragOutside];

    return nodeButton;
}


- (void)layoutButtons {

    CGFloat originX = 10;
    CGFloat originY = 10;

    for (int i = 0; i < self.nodesArray.count; i ++) {
        UIButton *button = self.buttonArray[i];

//        id frameCacheObject = frameCacheDict[keyForObject(button.model)];
//        if (frameCacheObject) {
//            button.frame = [frameCacheObject CGRectValue];
//        } else {
//            if (button.width + 10 + originX < kScreenWidth) {
//                button.origin = (CGPoint){originX, originY};
//                originX = button.x + 10 + button.width;
//                originY = button.y;
//            } else {
//                button.origin = (CGPoint){10, originY + 5 + kButtonHeight};
//                originX = button.x + 10 + button.width;
//                originY = button.y;
//            }
//            frameCacheDict[keyForObject(button.model)] = [NSValue valueWithCGRect:button.frame];
//        }

        [button setTitle:@"hah" forState:UIControlStateNormal];


        button.hidden = NO;
        if (!button.superview) {
            [self.contentView addSubview:button];
        }
    }

}


static NSString * keyForObject(id object) {
    return [NSString stringWithFormat:@"%p", object];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}


@end
