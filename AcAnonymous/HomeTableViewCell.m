//
//  HomeTableViewCell.m
//  AcAnonymous
//
//  Created by succlz123 on 15/10/12.
//  Copyright © 2015年 succlz123. All rights reserved.
//

#import <Masonry/View+MASAdditions.h>
#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initLayout];
    }

    return self;
}

- (void)initLayout {
    self.contentLabel = [[UILabel alloc] init];
    self.idLabel = [[UILabel alloc] init];
    self.userIdLabel = [[UILabel alloc] init];
    self.timeLabel = [[UILabel alloc] init];
    self.replyCountLabel = [[UILabel alloc] init];

    [self.contentLabel setLineBreakMode:NSLineBreakByCharWrapping];
    [self.contentLabel setNumberOfLines:5];


    [self.contentView addSubview:self.contentLabel];


//        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(self.contentView).with.offset(20);
//            make.top.mas_equalTo(self.contentView).with.offset(20);
//
//        }];
}

- (void)setContentString:(NSString *)contentString {
    _contentString = contentString;

    // 设置Label的字体 HelveticaNeue  Courier
    UIFont *fnt = [UIFont fontWithName:@"HelveticaNeue" size:16.0f];
    self.contentLabel.font = fnt;
    // 根据字体得到NSString的尺寸
    CGSize size = [contentString sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:fnt, NSFontAttributeName, nil]];
    // 名字的H
    CGFloat nameH = size.height;
    // 名字的W
    CGFloat nameW = size.width;
    self.contentLabel.frame = CGRectMake(0, 0, nameW, nameH);

    self.frame=self.contentLabel.frame;

    self.contentLabel.text = contentString;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
