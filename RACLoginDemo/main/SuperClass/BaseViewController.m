//
//  BaseViewController.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/24.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "BaseViewController.h"

#import "LQViewModel.h"

#import "LQCellViewModel.h"

#import "BaseTableViewCell.h"

#import "BaseView.h"

@interface BaseViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;


#define CLASS_NAME(name) [NSString stringWithFormat:@"baseViewCell_%@",name]
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.tableView rac_signalForSelector:<#(SEL)#> fromProtocol:<#(Protocol *)#>]
    
    self.signal = RACObserve(self, viewModel);
}


#pragma mark - public

-(void)setDataWithViewModel:(LQViewModel *)model{
    self.viewModel = model;
    for (NSArray * arr in self.viewModel.arrData) {
        for(LQCellViewModel * vm in arr){
            if (vm.isXib) {
                [self.tableView registerNib:[UINib nibWithNibName:vm.className bundle:nil] forCellReuseIdentifier:CLASS_NAME(vm.className)];
            }else{
                [self.tableView registerClass:NSClassFromString(vm.className) forCellReuseIdentifier:CLASS_NAME(vm.className)];
            }
        }
    }
    [self reloadData];
}

-(void)setupTableViewWithStyle:(UITableViewStyle)style  frame:(CGRect)frame{
    if(frame.size.width == 0){
        frame = CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT);
    }
    _tableView = [[UITableView alloc] initWithFrame:frame style:style];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

-(void)reloadData{
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * arr = self.viewModel.arrData[section];
    return arr.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.viewModel.arrData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LQCellViewModel * vm = self.viewModel.arrData[indexPath.section][indexPath.row];
    BaseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CLASS_NAME(vm.className)];
    cell.viewController = self;
    [cell setModel:vm];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    LQCellViewModel * vm = self.viewModel.arrData[indexPath.section][indexPath.row];
//    return vm.cellHeight;

    return [self getCellHeightWithIndexPath:indexPath];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    BaseView * view = (BaseView *)[self createViewWithArr:self.viewModel.arrFooter index:section];
    return view ? view.mHeight : [self getHeightWithArr:self.viewModel.arrFooter index:section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    BaseView * view = (BaseView *)[self createViewWithArr:self.viewModel.arrHeader index:section];
    return view ? view.mHeight : [self getHeightWithArr:self.viewModel.arrHeader index:section];
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return [self createViewWithArr:self.viewModel.arrFooter index:section];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [self createViewWithArr:self.viewModel.arrHeader index:section];
}

//通过创建cell去计算cell的高度
-(CGFloat)getCellHeightWithIndexPath:(NSIndexPath *)indexPath{
    BaseTableViewCell * cell;
    LQCellViewModel * vm = self.viewModel.arrData[indexPath.section][indexPath.row];
    if (vm.isXib) {
        cell = [[[NSBundle mainBundle] loadNibNamed:vm.className owner:self options:nil] lastObject];
    }else{
        cell = [[BaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CLASS_NAME(vm.className)];
    }
    [cell setModel:vm];
    return cell.cellHeight != 0 ? cell.cellHeight : vm.cellHeight;
}

//取得Model中的cell的高度
-(CGFloat)getHeightWithArr:(NSArray *)data index:(NSInteger)index{
    if (data.count == 0) {
        return .00001;
    }else{
        LQCellViewModel * model = data[index];
        return model.cellHeight;
    }
    return .0001;
}

//根据LQCellViewModel中的className创建实例
-(UIView *)createViewWithArr:(NSArray *)data index:(NSInteger)index{
    if (self.viewModel.arrHeader.count == 0) {
        return nil;
    }else{
        LQCellViewModel * vm = data[index];
        if ([vm.className isEqualToString:@""] || [vm.className isKindOfClass:[NSNull class]] || !vm.className) {
            return nil;
        }else{
            BaseView * view;
            if (vm.isXib) {
                view = [[[NSBundle mainBundle] loadNibNamed:vm.className owner:self options:nil] lastObject];
            }else{
                Class class = NSClassFromString(vm.className);
                view = [[class alloc] init];
            }
            [view setDataModel:vm];
            return view;
        }
    }
    return nil;
}

#pragma mark - get
//
//-(BaseViewModel *)viewModel{
//    if (!_viewModel) {
//        _viewModel = [[BaseViewModel alloc] init];
//    }
//    return _viewModel;
//}

@end
