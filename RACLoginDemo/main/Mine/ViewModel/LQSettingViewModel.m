//
//  LQSettingViewModel.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/27.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "LQSettingViewModel.h"

@implementation LQSettingViewModel

-(instancetype)initWithObject:(NSDictionary *)object{
    if (self = [super initWithObject:object]) {
        _name = object[@"name"];
        _swichValue = [object[@"swichValue"] boolValue];
    }
    return self;
}

@end
