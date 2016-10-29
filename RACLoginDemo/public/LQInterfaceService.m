//
//  LQInterfaceService.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/26.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "LQInterfaceService.h"

@implementation LQInterfaceService

+(instancetype)shareInterfaceService{
    static LQInterfaceService * s = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        s = [[LQInterfaceService alloc] init];
    });
    return s;
}

+(void)invokeViewControllerWithURL:(NSString *)urlString{
    /* 示例："lq://invokeVC?class=LQLoginViewController&name=qiang&navTile=设置&hidesBottomBarWhenPushed=YES"
     * 开头固定：lq://invokeVC?class=
     * 设置格式：属性名=值
     * 参数之间不要+空格，以免引起错误
     */
    NSDictionary * parameter = [urlString urlParameterDictionary];
    NSString * myClass = parameter[@"class"];
    if(![LQGlobalService isEmptyString:myClass]){
        Class class = NSClassFromString(myClass);
        BaseViewController * vc = [[class alloc] init];
        for(NSString * key in parameter.allKeys){
            if(![key isEqualToString:@"class"]){
                [vc setValue:parameter[key] forKeyPath:key];
            }
        }
        UINavigationController * n = [LQGlobalService getCurrentNavigationController];
        [n pushViewController:vc animated:YES];
    }
}


@end
