//
//  LQTableViewCell.h
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/25.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseTableViewCell.h"

@interface LQMineTableViewCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIButton *btnSure;

@end
