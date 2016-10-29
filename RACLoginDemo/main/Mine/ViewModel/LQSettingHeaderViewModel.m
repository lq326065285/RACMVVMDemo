//
//  LQSettingHeaderViewModel.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/29.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "LQSettingHeaderViewModel.h"

@implementation LQSettingHeaderViewModel

-(instancetype)initWithObject:(NSDictionary *)object{
    if (self = [super initWithObject:object]) {
        _name = object[@"name"];
        _desc = object[@"desc"];
    }
    return self;
}

@end
