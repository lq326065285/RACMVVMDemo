//
//  BaseViewModel.h
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/27.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseModel.h"

@interface BaseViewModel : NSObject

//表示要跳转的类
@property (nonatomic,strong,readonly) NSString * actionUrl;

-(instancetype)initWithObject:(id)object;

@end
