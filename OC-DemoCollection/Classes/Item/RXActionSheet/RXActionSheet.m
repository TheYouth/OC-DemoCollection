//
//  RXActionSheet.m
//  RXActionSheet
//
//  Created by pingan on 2018/9/28.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXActionSheet.h"
#import <UIKit/UIKit.h>
#import "RXActionSheetCell.h"
static NSString *RXActionSheetCellIdentif = @"RXActionSheetCellIdentif";
@interface RXActionSheet()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UIView  *bgView;
@property(nonatomic, strong)UIView  *tapView;
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *items;

@end
@implementation RXActionSheet
- (instancetype)init{
    if (self = [super init]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self.bgView addSubview:self.tapView];
    [self.bgView addSubview:self.tableView];
}
- (void)takePhoto{
    if (self.delegate && [self.delegate respondsToSelector:@selector(takePhoto)]) {
        [self.delegate takePhoto];
    }
}
- (void)serarchFromAlbum{
    if (self.delegate && [self.delegate respondsToSelector:@selector(serarchFromAlbum)]) {
        [self.delegate serarchFromAlbum];
    }
}
#pragma mark - tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.items.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ((NSArray *)self.items[section]).count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RXActionSheetCell *sheetCell = [tableView dequeueReusableCellWithIdentifier:RXActionSheetCellIdentif];
    if (!sheetCell) {
        sheetCell = [[RXActionSheetCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:RXActionSheetCellIdentif];
    }
    if (self.items.count > indexPath.section) {
        [sheetCell updateCellWithTitle:_items[indexPath.section][indexPath.row]];
    }
    return sheetCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.000001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.000001;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionView = [[UIView alloc] init];
    return sectionView;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self dissmiss];
    if (self.items.count > indexPath.section) {
        NSArray *sectionItem = self.items[indexPath.section];
        if (sectionItem.count > indexPath.row) {
            NSString *title = sectionItem[indexPath.row];
            if ([title isEqualToString:NSLocalizedString(@"拍照",nil)]) {
                [self takePhoto];
            }else if ([title isEqualToString:NSLocalizedString(@"从手机相册选择", nil)]){
                [self serarchFromAlbum];
            }
        }
    }
}
#pragma mark - getter and setter
- (UIView *)bgView{
    if (!_bgView) {
        CGRect bounds = [UIApplication sharedApplication].delegate.window.bounds;
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, bounds.size.width, bounds.size.height)];
        _bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    }
    return _bgView;
}
- (UIView *)tapView{
    if (!_tapView) {
        CGRect bounds = [UIApplication sharedApplication].delegate.window.bounds;
        _tapView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,bounds.size.width, bounds.size.height-169)];
        _tapView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dissmiss)];
        [_tapView addGestureRecognizer:tap];
    }
    return _tapView;
}
- (UITableView *)tableView{
    if (!_tableView) {
        CGRect rect = [UIApplication sharedApplication].delegate.window.bounds;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,rect.size.height, rect.size.width, 169) style:UITableViewStyleGrouped];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[RXActionSheetCell class] forCellReuseIdentifier:RXActionSheetCellIdentif];
    }
    return _tableView;
}
- (NSArray *)items{
    if (!_items) {
        NSArray *firstArray = @[NSLocalizedString(@"拍照", nil),NSLocalizedString(@"从手机相册选择", nil)];
        NSArray *lastArray = @[NSLocalizedString(@"取消", nil)];
        _items = @[firstArray,lastArray];
    }
    return _items;
}
#pragma mark - action
- (void)dissmiss{
    CGRect rect = [UIApplication sharedApplication].delegate.window.bounds;
    CGRect frame = self.tableView.frame;
    frame.origin.y = rect.size.height;
    [UIView animateWithDuration:0.25 animations:^{
        self.tableView.frame = frame;
    }completion:^(BOOL finished) {
        [self.bgView removeFromSuperview];
    }];
}
- (void)show{
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window addSubview:self.bgView];
    CGRect frame = self.tableView.frame;
    CGRect rect = [UIApplication sharedApplication].delegate.window.bounds;
    frame.origin.y = rect.size.height - frame.size.height;
    [UIView animateWithDuration:0.25 animations:^{
        self.tableView.frame = frame;
    }completion:nil];
}

@end
