//
//  LQSettingTableCell.h
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/25.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface LQSettingTableCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;
@property (weak, nonatomic) IBOutlet UIImageView *imgRightRow;
@property (weak, nonatomic) IBOutlet UIButton *btnSure;

@end
