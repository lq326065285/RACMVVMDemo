//
//  LQGlobalService.h
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/25.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQGlobalService : NSObject

+(BOOL)isEmptyString:(NSString *)string;

+(void)startListen;

+(UINavigationController *)getCurrentNavigationController;

#pragma mark - 保存本地
+(void)setObject:(id)obj key:(NSString *)key;
+(id)objectForKey:(NSString *)key;
@end
