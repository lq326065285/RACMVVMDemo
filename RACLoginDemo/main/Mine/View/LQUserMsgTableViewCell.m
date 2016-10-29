//
//  LQUserMsgTableViewCell.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/27.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "LQUserMsgTableViewCell.h"
#import "LQUserMsgViewModel.h"

@interface LQUserMsgTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *viewLoginBtnBack;

@property (nonatomic,strong) LQUserMsgViewModel * myModel;

@end

@implementation LQUserMsgTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.lblName.preferredMaxLayoutWidth = 95;
}

-(void)setModel:(LQCellViewModel *)model{
    [super setModel:model];
    self.myModel = (LQUserMsgViewModel *)model.model;
    self.lblName.text = self.myModel.name;
    if (![LQGlobalService isEmptyString:self.myModel.name]) {
        self.viewLoginBtnBack.hidden = YES;
         self.imgHead.image = self.myModel.img;
    }else{
        self.viewLoginBtnBack.hidden = NO;
    }
    [self.lblName layoutIfNeeded];
    [self layoutIfNeeded];
}

-(void)layoutSubviews{
    self.cellHeight = self.viewModel.cellHeight - 21 + self.lblName.frame.size.height + .5;//这里+.5也就是因为contentView比cell本身少0.5
    NSLog(@"cell.content:%@",NSStringFromCGRect(self.lblName.frame));
}


@end
