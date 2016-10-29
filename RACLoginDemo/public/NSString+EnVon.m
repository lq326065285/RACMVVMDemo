//
//  NSString+EnVon.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/26.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "NSString+EnVon.h"

@implementation NSString (EnVon)

-(NSDictionary *)urlParameterDictionary{
    NSMutableDictionary * parameter = [NSMutableDictionary dictionary];
    NSString * string = [self componentsSeparatedByString:@"?"][1];
    if (string.length && [string rangeOfString:@"="].location != NSNotFound) {
        NSArray * keyValuePairs = [string componentsSeparatedByString:@"&"];
        for(NSString * keyValuePair in keyValuePairs){
            NSArray * pair = [keyValuePair componentsSeparatedByString:@"="];
            [parameter setObject:pair[1] forKey:pair[0]];
        }
    }
    return parameter;
}



@end
