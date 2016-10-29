//
//  LQSettingHeaderView.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/29.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "LQSettingHeaderView.h"

#import "LQSettingHeaderViewModel.h"

@interface LQSettingHeaderView (){
    BOOL _isHaveUI;
}

@property (nonatomic,strong) UILabel * lblTitle;

@property (nonatomic,strong) UILabel * lblDesc;

@property (nonatomic,strong) UIView * backView;

@property (nonatomic,strong) UIView * bottomLineView;

@end

@implementation LQSettingHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

-(instancetype)init{
    if (self = [super init]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    if (_isHaveUI) {
        return;
    }
    _isHaveUI = YES;
    
    if(_backView){
        [_backView removeFromSuperview];
    }
    
    _backView = [[UIView alloc] init];
    self.backView.backgroundColor = RGB(220, 220, 220);
    [self addSubview:_backView];
    
    _lblTitle = [[UILabel alloc] init];
   
    [self.backView addSubview:_lblTitle];
    
    _lblDesc = [[UILabel alloc] init];
    _lblDesc.numberOfLines = 0;
    _lblDesc.font = [UIFont systemFontOfSize:15];
    
    [self.backView addSubview:_lblDesc];
    
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    WEAK_SELF(me);
    
    [_lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.centerY.equalTo(me.backView.mas_centerY);
        make.height.mas_equalTo(21);
    }];
    
    [_lblDesc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(me.lblTitle.mas_right).offset(10);
        make.centerY.equalTo(me.backView.mas_centerY);
    }];
}

-(void)setDataModel:(LQCellViewModel *)viewModel{
    [super setDataModel:viewModel];
    LQSettingHeaderViewModel * vm = (LQSettingHeaderViewModel *)viewModel.model;
    self.lblTitle.text = vm.name;
    self.lblDesc.text = vm.desc;
    
     [_lblTitle sizeToFit];
    _lblDesc.preferredMaxLayoutWidth = KSCREEN_WIDTH - _lblTitle.frame.size.width - 10 - 10 - 10;
    [self.backView layoutIfNeeded];
    [self layoutIfNeeded];
}

//-(CGFloat)getViewHeightWithDataModel:(LQCellViewModel *)viewModel{
//    [self setDataModel:viewModel];
//    NSLog(@"self.backView.frame:%@",NSStringFromCGRect(self.lblDesc.frame));
//    return 0.111;
//}

-(void)layoutSubviews{
    CGFloat height = self.lblDesc.frame.size.height + 5 + 5;//+5+5分别是top和bottom
    self.mHeight = height > self.viewModel.cellHeight ? height : self.viewModel.cellHeight;
//    NSLog(@"self.backView.frame:%@",NSStringFromCGRect(self.lblDesc.frame));
}
@end
