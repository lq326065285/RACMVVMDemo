//
//  LQHomeViewModel.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/25.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "LQGetTestConfigData.h"

#import "LQMineCellViewModel.h"

#import "LQUserMsgViewModel.h"

#import "LQSettingViewModel.h"

#import "LQSettingHeaderViewModel.h"

@implementation LQGetTestConfigData

/*
 * 你肯定感到很奇怪，为什么这些数据需要这么写，直接赋值有什么不一样吗？
 * 答：有些公司会将下面这些内容做成JSON数据放在服务端，当APP上线之后，我们虽然无法再修改代码，
 *    但是还是可以通过修改这份JSON数据来改变界面的布局已达到动态布局的效果，这就是业内说的用JSON实现动态配置
 */
//获得我的模块儿的界面配置文件
+(void)getMineConfigData:(void(^)(LQViewModel * vm))block{
    
    NSArray * data = @[@[@"用户信息"],@[@"我的好友",@"我的相册"],@[@"我的收藏",@"我的表情"],@[@"版本信息"],@[@"设置"]];
    LQViewModel * viewModel = [[LQViewModel alloc] init];
    
    for (NSArray * a in data) {
        NSMutableArray * arr = [NSMutableArray array];
        for (NSString * name in a) {
            /*1，此处因为是我们自己定义的config方面的数据，数据格式都是固定的，所有没有必要用JsonModel去解析
             *2，所以此处直接用了viewModel命名了，没有按照固有的方法 Model-->viewModel
             */
            
            LQCellViewModel * model = [[LQCellViewModel alloc] init];
            model.className = @"LQMineTableViewCell";
            model.cellHeight = 44;
            model.cellWidth = KSCREEN_WIDTH;
            model.isXib = YES;
            BaseViewModel * bVm;
            if ([name isEqualToString:@"用户信息"]) {
                model.cellHeight = 150;
                model.className = @"LQUserMsgTableViewCell";
                NSDictionary * dict = @{@"actionUrl":@"LQLoginViewController"};
                bVm = [[LQUserMsgViewModel alloc] initWithObject:dict];
            }else{
                NSDictionary * dict;
                if ([name isEqualToString:@"设置"]) {
                    dict = @{@"actionUrl":@"LQSettingViewController",@"name":name};
                }else{
                    dict = @{@"actionUrl":@"LQMineDetailViewController",@"name":name};
                }
                bVm = [[LQMineCellViewModel alloc] initWithObject:dict];
            }
            model.model = bVm;
            [arr addObject:model];
        }
        
        [viewModel.arrData addObject:arr];
    }
    
    for (int i = 0; i < data.count; i++) {
        LQCellViewModel * model = [[LQCellViewModel alloc] init];
        model.cellHeight = 20;
        [viewModel.arrFooter addObject:model];
    }
    block(viewModel);
}

//获得设置界面你的配置文件
+(void)getSettingConfigData:(void(^)(LQViewModel * vm))block{
    
    NSArray * headerData = @[@"分类1",@"分类2",@"分类3",@""];//这里的数量和下面的data.array应该一直，不管有没有值都应该用空字符串补齐
    NSArray * data = @[@[@"消息提醒",@"聊天记录"],@[@"通用",@"我的表情"],@[@"帮助与反馈",@"辅助功能"],@[@"退出登录"]];
    LQViewModel * viewModel = [[LQViewModel alloc] init];
    
    for (NSArray * a in data) {
        NSMutableArray * arr = [NSMutableArray array];
        for (NSString * name in a) {
            LQCellViewModel * model = [[LQCellViewModel alloc] init];
            
            model.cellHeight = 44;
            model.cellWidth = KSCREEN_WIDTH;//cell的宽度
            model.isXib = YES;//是不是xib建立
            BaseViewModel * bVm;
            if ([name isEqualToString:@"退出登录"]) {
                model.cellHeight = 44;//cell default高度
                model.className = @"LQCancelLoginTableCell";//cell名字
                NSDictionary * dict = @{@"actionUrl":@"LQLoginViewController",@"name":name};//cell相关的数据
                bVm = [[LQUserMsgViewModel alloc] initWithObject:dict];
            }else{
               
                model.className = @"LQSettingTableCell";
                NSDictionary * dict;
                dict = @{@"actionUrl":@"LQMineDetailViewController",@"name":name};
                bVm = [[LQSettingViewModel alloc] initWithObject:dict];
            }
            model.model = bVm;
            [arr addObject:model];
        }
        [viewModel.arrData addObject:arr];
    }
    
    for (int i = 0; i < data.count; i++) {
        LQCellViewModel * model = [[LQCellViewModel alloc] init];
        model.cellHeight = 20;
        [viewModel.arrFooter addObject:model];
    }
    
    
    for(NSString * title in headerData){
        LQCellViewModel * model = [[LQCellViewModel alloc] init];
        if ([LQGlobalService isEmptyString:title]) {
            model.className = @"";
            model.cellWidth = KSCREEN_WIDTH;
            model.cellHeight = .00001;
        }else{
            model.className = @"LQSettingHeaderView";
            model.cellWidth = KSCREEN_WIDTH;
            model.cellHeight = 50;
        }
        model.isXib = NO;
        //原则上每个view都对应一个viewModel，但是因为
        LQSettingHeaderViewModel * mVm = [[LQSettingHeaderViewModel alloc] initWithObject:@{@"name":title,@"desc":@"则是测试标题的内容，内容各种各样,则是测试标题的内容，内容各种各样,则是测试标题的内容，内容各种各样"}];
        model.model = mVm;
        [viewModel.arrHeader addObject:model];
    }
    
    
    block(viewModel);
}

@end
