//
//  HomeTableViewCell.h
//  AcAnonymous
//
//  Created by succlz123 on 15/10/12.
//  Copyright © 2015年 succlz123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell

@property(nonatomic, strong) UILabel *contentLabel;
@property(nonatomic, strong) NSString *contentString;

@property(nonatomic, strong) UILabel *idLabel;
@property(nonatomic, strong) UILabel *userIdLabel;
@property(nonatomic, strong) UILabel *timeLabel;
@property(nonatomic, strong) UILabel *replyCountLabel;

@end
