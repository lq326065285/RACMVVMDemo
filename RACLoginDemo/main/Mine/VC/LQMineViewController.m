//
//  LQMineViewController.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/24.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "LQMineViewController.h"
#import "LQGetTestConfigData.h"
#import "LQGetTestData.h"
#import "LQUserMsgViewModel.h"
#import "LQMineViewModel.h"
@interface LQMineViewController (){
    BOOL _isRepeat;
}

@end

@implementation LQMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableViewWithStyle:UITableViewStyleGrouped frame:CGRectZero];
    [LQGetTestConfigData getMineConfigData:^(LQViewModel *vm) {
        [self setDataWithViewModel:vm];
    }];
    
    
    __block LQMineModel * model;
    [LQGetTestData getUserMsg:^(LQMineModel *object) {
        if (self.viewModel) {
            self.viewModel = [LQMineViewModel updateViewModelWithModel:model viewModel:self.viewModel];
            [self reloadData];
        }
        model = object;
    }];
    
    
    [[self.signal filter:^BOOL(id value) {
        return !_isRepeat;
    }] subscribeNext:^(id x) {
        _isRepeat = YES;
        self.viewModel = [LQMineViewModel updateViewModelWithModel:model viewModel:self.viewModel];
        [self reloadData];
    }];

}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    测试用例，加入这句，可以出发 LQGlobalService 中的starListen方法
//    [JLRoutes routeURL:[NSURL URLWithString:@"lq://commad/mineController/name/actionURL"]];
}

@end
