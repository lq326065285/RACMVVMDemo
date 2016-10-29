//
//  LQHomeViewModel.h
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/25.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQGetTestConfigData : NSObject

+(void)getMineConfigData:(void(^)(LQViewModel * vm))block;
+(void)getSettingConfigData:(void(^)(LQViewModel * vm))block;
@end
