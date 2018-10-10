//
//  ViewController.m
//  OC-DemoCollection
//
//  Created by pingan on 2018/10/10.
//  Copyright © 2018年 OC-DemoCollection. All rights reserved.
//

#import "ViewController.h"
#import "RXActionSheet.h"
@interface ViewController ()<RXActionSheetDelegate>
@property(nonatomic, strong)RXActionSheet *actionSheet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"弹出框" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(self.view.bounds.size.width/2-40, self.view.bounds.size.height/2-40, 80, 80);
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)btnClick{
    [self.actionSheet show];
}
#pragma mark - Delegate
//MARK:actionSheetDelegate
- (void)takePhoto{
    //打开相机
    NSLog(@"打开相机");
}
- (void)serarchFromAlbum {
    //打开相册
    NSLog(@"打开相册");
}

#pragma mark - getter and setter
- (RXActionSheet *)actionSheet{
    if (!_actionSheet) {
        _actionSheet = [[RXActionSheet alloc] init];
        _actionSheet.delegate = self;
    }
    return _actionSheet;
}

@end
