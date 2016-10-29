//
//  LQInterfaceService.h
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/26.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQInterfaceService : NSObject

+(instancetype)shareInterfaceService;

//设置协议，根据协议跳转
+(void)invokeViewControllerWithURL:(NSString *)urlString;

@end
