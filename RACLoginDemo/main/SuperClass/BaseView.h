//
//  BaseView.h
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/25.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQCellViewModel.h"

@interface BaseView : UIView

@property (nonatomic,strong) LQCellViewModel * viewModel;

//处理变高的view
@property (nonatomic,assign) CGFloat mHeight;

-(void)setDataModel:(LQCellViewModel *)viewModel;

-(CGFloat)getViewHeightWithDataModel:(LQCellViewModel *)viewModel;

@end
