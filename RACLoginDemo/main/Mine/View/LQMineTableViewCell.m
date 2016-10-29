//
//  LQTableViewCell.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/25.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "LQMineTableViewCell.h"

#import "LQMineCellViewModel.h"

@interface LQMineTableViewCell ()

@property (nonatomic,strong) LQMineCellViewModel * myModel;

@end



@implementation LQMineTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [[self.btnSure rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self push];
    }];
    
    
//    RAC(self.lblName,text) = [RACObserve(self.viewModel, cellData) map:^id(LQCellViewModel * value) {
//        return value.cellData[@"name"];
//    }];
//    
//    RAC(self,actionUrl) = [RACObserve(self, viewModel) map:^id(LQCellViewModel * value) {
//        return value.cellData[@"actionUrl"];
//    }];
}

-(void)push{
    NSString * url = [NSString stringWithFormat:@"class=%@&navTitle=%@&hidesBottomBarWhenPushed=YES",self.myModel.actionUrl,self.myModel.name];
    [LQInterfaceService invokeViewControllerWithURL:LQ_INVOKE_PROTOCOL(url)];
    
}

-(void)setModel:(LQCellViewModel *)model{
    [super setModel:model];
    self.myModel = (LQMineCellViewModel *)model.model;
    self.lblName.text = self.myModel.name;
}



@end
