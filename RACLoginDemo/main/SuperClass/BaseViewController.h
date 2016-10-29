//
//  BaseViewController.h
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/24.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LQViewModel.h"

@interface BaseViewController : UIViewController

-(void)reloadData;

-(void)setupTableViewWithStyle:(UITableViewStyle)style  frame:(CGRect)frame;

-(void)setDataWithViewModel:(LQViewModel *)model;

@property (nonatomic,strong) RACSignal * signal;

@property (nonatomic,strong) LQViewModel * viewModel;

@end
