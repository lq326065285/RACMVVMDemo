//
//  UIViewController+Tracking.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/11/3.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "UIViewController+Tracking.h"

#import <objc/runtime.h>

@implementation UIViewController (Tracking)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(mrc_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        }else{
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

-(void)mrc_viewWillAppear:(BOOL)animated{
    [self mrc_viewWillAppear:animated];
    //如果有友盟统计，在此处写一次就够了，适用于其他所有的VC
    NSLog(@"className:%@",NSStringFromClass(self.class));
}

@end
