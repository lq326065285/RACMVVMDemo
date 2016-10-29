//
//  BaseViewModel.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/27.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

-(instancetype)initWithObject:(id)object{
    if (self = [super init]) {
        if ([object isKindOfClass:[NSDictionary class]]) {
            _actionUrl = object[@"actionUrl"];
        }else if([object isKindOfClass:[BaseModel class]]){
            BaseModel * model = (BaseModel *)object;
            _actionUrl = model.actionUrl;
        }
    }
    return self;
}

@end
