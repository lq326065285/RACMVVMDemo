//
//  LQCancelLoginTableCell.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/25.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "LQCancelLoginTableCell.h"
#import "AppDelegate.h"
@implementation LQCancelLoginTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [[_btnCancelLogin rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self push];
    }];
}

-(void)push{
    AppDelegate * delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate gotoLoginVC];
}

@end
