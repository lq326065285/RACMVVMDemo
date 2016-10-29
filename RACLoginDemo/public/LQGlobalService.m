//
//  LQGlobalService.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/25.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "LQGlobalService.h"

@implementation LQGlobalService

+(instancetype)shareInstance{
    static LQGlobalService * s = nil;
    static dispatch_once_t lqOnce;
    dispatch_once(&lqOnce, ^{
        s = [[LQGlobalService alloc] init];
    });
    return s;
}

+(BOOL)isEmptyString:(NSString *)string{
    if([string isKindOfClass:[NSNull class]] || string == nil || [string isEqualToString:@""]){
        return YES;
    }
    return NO;
}


+(UINavigationController *)getCurrentNavigationController{
    UITabBarController * tbc = (UITabBarController *)[[[UIApplication sharedApplication].delegate window] rootViewController];
    UINavigationController * n = tbc.viewControllers[tbc.selectedIndex];
    return n;
}

+(void)startListen{
    [[JLRoutes routesForScheme:@"lq"] addRoute:@"/:object/:junne/:views/:viewID" handler:^BOOL(NSDictionary * _Nonnull parameters) {
        NSLog(@"%@",parameters);
        return YES;
    }];
}

#pragma mark - 保存本地
+(void)setObject:(id)obj key:(NSString *)key{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:obj forKey:key];
}
+(id)objectForKey:(NSString *)key{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

@end
