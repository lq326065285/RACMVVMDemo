//
//  LQSettingViewController.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/25.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "LQSettingViewController.h"

#import "LQGetTestConfigData.h"

@interface LQSettingViewController ()

@end

@implementation LQSettingViewController

-(void)setNavTitle:(NSString *)navTitle{
    self.title = navTitle;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableViewWithStyle:UITableViewStyleGrouped frame:CGRectZero];
    [LQGetTestConfigData getSettingConfigData:^(LQViewModel *vm) {
        [self setDataWithViewModel:vm];
    }];
}


@end
