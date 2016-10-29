//
//  BaseTableViewCell.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/24.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

-(void)setModel:(LQCellViewModel *)model{
    _viewModel = model;
}

@end
