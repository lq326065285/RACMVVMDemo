//
//  LQCellViewModel.h
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/24.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseViewModel.h"

@interface LQCellViewModel : NSObject

@property (nonatomic,strong) NSString * className;

@property (nonatomic,assign) CGFloat cellHeight;

@property (nonatomic,assign) CGFloat cellWidth;

@property (nonatomic,strong) BaseViewModel * model;

@property (nonatomic,assign) BOOL isXib;

@end
