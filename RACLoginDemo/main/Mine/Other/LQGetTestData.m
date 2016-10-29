//
//  LQGetTestData.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/27.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "LQGetTestData.h"

@implementation LQGetTestData

+(void)getUserMsg:(void(^)(LQMineModel * object))block{
    LQMineModel * mineModel = [[LQMineModel alloc] init];
    mineModel.name = @"liqiangliqiangliqiangliqiangliqiang";
    mineModel.age = @"14";
    mineModel.imgUrl = @"head_image";
    block(mineModel);
}

@end
