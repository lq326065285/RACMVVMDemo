//
//  LQMineModel.h
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/27.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQMineModel : BaseModel

//此处是用来解析网络数据的
@property (nonatomic,strong) NSString * name;

//年龄
@property (nonatomic,strong) NSString * age;

//头像
@property (nonatomic,strong) NSString * imgUrl;

@end
