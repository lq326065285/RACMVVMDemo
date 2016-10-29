//
//  LQUserMsgTableViewCell.h
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/27.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LQUserMsgTableViewCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgHead;

@property (weak, nonatomic) IBOutlet UILabel *lblName;

@property (weak, nonatomic) IBOutlet UIButton *btnLogin;

@end
