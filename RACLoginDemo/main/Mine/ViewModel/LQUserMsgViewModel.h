//
//  LQHomeCellViewModel.h
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/25.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "LQCellViewModel.h"
#import "LQMineModel.h"
@interface LQUserMsgViewModel : BaseViewModel

@property (nonatomic,strong,readonly) NSString * name;

@property (nonatomic,strong,readonly) UIImage * img;

@property (nonatomic,strong,readonly) NSString * age;

@property (nonatomic,assign) BOOL isLogin;

-(void)bindDataWithModel:(LQMineModel *)model;

@end
