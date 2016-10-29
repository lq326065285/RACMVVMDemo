//
//  LQMineViewModel.h
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/28.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "BaseViewModel.h"

#import "LQMineModel.h"

@interface LQMineViewModel : BaseViewModel

+(LQViewModel *)updateViewModelWithModel:(LQMineModel *)model viewModel:(LQViewModel *)viewModel;

@end
