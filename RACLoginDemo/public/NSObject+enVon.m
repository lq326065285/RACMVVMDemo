//
//  NSObject+enVon.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/25.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "NSObject+enVon.h"

#import <objc/runtime.h>

#define ACTION_URL_NAME @"action_url_name"

@implementation NSObject (enVon)

-(void)setActionUrl:(NSString *)actionUrl{
    objc_setAssociatedObject(self, ACTION_URL_NAME, actionUrl, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *)actionUrl{
    return objc_getAssociatedObject(self, ACTION_URL_NAME);
}

@end
