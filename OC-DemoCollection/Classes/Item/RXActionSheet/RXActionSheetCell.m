//
//  RXActionSheetCell.m
//  RXActionSheet
//
//  Created by pingan on 2018/9/28.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXActionSheetCell.h"
#import "RXHelper.h"
#import "Masonry.h"
@interface RXActionSheetCell()

@property(nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, strong)UIView  *bottomLine;
@end
@implementation RXActionSheetCell

- (void)updateCellWithTitle:(NSString *)title{
    self.titleLabel.text = title;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        [self.contentView addSubview:self.bottomLine];
        [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.contentView.mas_right);
            make.top.equalTo(self.contentView.mas_top);
            make.height.mas_equalTo(1/[UIScreen mainScreen].scale);
        }];
    }
    return self;
}
#pragma mark - getter and setters
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15.0];
        [_titleLabel setTextColor:UIColorFromHexRGB(0x333333)];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLabel;
}
- (UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = UIColorFromHexRGB(0xCCCCCC);
    }
    return _bottomLine;
}
@end
