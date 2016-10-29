//
//  LQMineViewModel.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/28.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "LQMineViewModel.h"

#import "LQUserMsgViewModel.h"

@implementation LQMineViewModel

/*
 *  用这个信号的作用是为了确保，viewModel已经有值了再执行数组操作
 */
+(LQViewModel *)updateViewModelWithModel:(LQMineModel *)model viewModel:(LQViewModel *)viewModel{
    for(NSArray * rowArr in viewModel.arrData){
        for(LQCellViewModel * cellModel in rowArr){
            if ([cellModel.model isKindOfClass:[LQUserMsgViewModel class]]) {
                LQUserMsgViewModel * msgModel = (LQUserMsgViewModel *)cellModel.model;
                [msgModel bindDataWithModel:model];
                cellModel.model = msgModel;
            }
        }
    }
    return viewModel;
}

@end
