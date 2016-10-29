//
//  LQGetTestData.h
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/27.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LQMineModel.h"
@interface LQGetTestData : NSObject
+(void)getUserMsg:(void(^)(LQMineModel * object))block;
@end
