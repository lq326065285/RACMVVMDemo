//
//  LQHomeCellViewModel.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/25.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "LQUserMsgViewModel.h"

@implementation LQUserMsgViewModel

-(instancetype)initWithObject:(LQMineModel *)model{
    if (self = [super initWithObject:model]) {
        if ([model isKindOfClass:[LQMineModel class]]) {
            //有哪些需要转化的都在此处进行
            _name = model.name;
            _img = [UIImage imageNamed:model.imgUrl];
            _age = model.age;
        }
    }
    return self;
}

-(void)bindDataWithModel:(LQMineModel *)model{
    _name = model.name;
    _img = [UIImage imageNamed:model.imgUrl];
    _age = model.age;
}


@end
