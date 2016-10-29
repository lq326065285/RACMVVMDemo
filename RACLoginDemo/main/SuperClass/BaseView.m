//
//  BaseView.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/25.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mHeight = .0001f;//初始化height
    }
    return self;
}

-(void)setDataModel:(LQCellViewModel *)viewModel{
    _viewModel = viewModel;
}

-(CGFloat)getViewHeightWithDataModel:(LQCellViewModel *)viewModel{
    return .0001f;
}

@end
