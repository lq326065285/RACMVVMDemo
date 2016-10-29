//
//  BaseTableViewCell.h
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/24.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseViewController.h"

#import "LQCellViewModel.h"

@interface BaseTableViewCell : UITableViewCell

@property (nonatomic,assign) CGFloat cellHeight;

@property (nonatomic,strong) BaseViewController * viewController;

@property (nonatomic,strong) LQCellViewModel * viewModel;

-(void)setModel:(LQCellViewModel *)model;

@end
