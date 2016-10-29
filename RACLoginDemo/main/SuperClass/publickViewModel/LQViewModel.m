//
//  BaseViewModel.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/24.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "LQViewModel.h"

@implementation LQViewModel

-(NSMutableArray *)arrData{
    if (!_arrData) {
        _arrData = [[NSMutableArray alloc] init];
    }
    return _arrData;
}

-(NSMutableArray *)arrFooter{
    if (!_arrFooter) {
        _arrFooter = [[NSMutableArray alloc] init];
    }
    return _arrFooter;
}

-(NSMutableArray *)arrHeader{
    if (!_arrHeader) {
        _arrHeader = [[NSMutableArray alloc] init];
    }
    return _arrHeader;
}

@end
