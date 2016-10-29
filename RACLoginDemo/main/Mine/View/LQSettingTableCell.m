//
//  LQSettingTableCell.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/25.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "LQSettingTableCell.h"

#import "LQSettingViewModel.h"

@interface LQSettingTableCell ()

//一定要注意，这里的model不能用model命名英文出重复调用setModel方法的
@property (nonatomic,strong) LQSettingViewModel * myModel;

@end

@implementation LQSettingTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [[self.mySwitch rac_signalForControlEvents:UIControlEventValueChanged] subscribeNext:^(id x) {
        NSLog(@"按钮改变");
        self.myModel.swichValue = NO;
    }];

    
    @weakify(self)
    [[self.btnSure rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self)
        NSString * url = [NSString stringWithFormat:@"class=%@&navTitle=%@&hidesBottomBarWhenPushed=YES",self.myModel.actionUrl,self.myModel.name];
        [LQInterfaceService invokeViewControllerWithURL:LQ_INVOKE_PROTOCOL(url)];
    }];
}

-(void)setModel:(LQCellViewModel *)model{
    [super setModel:model];
    self.myModel = (LQSettingViewModel *)model.model;
    if ([self.myModel.name isEqualToString:@"消息提醒"]) {
        self.mySwitch.hidden = NO;
        self.imgRightRow.hidden = YES;
        self.btnSure.hidden = YES;
    }else{
        self.mySwitch.hidden = YES;
        self.imgRightRow.hidden = NO;
        self.btnSure.hidden = NO;
    }
    [self.mySwitch setOn:self.myModel.swichValue];
    self.lblName.text = self.myModel.name;
}


@end
