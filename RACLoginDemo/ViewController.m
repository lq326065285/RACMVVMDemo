//
//  ViewController.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/22.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "ViewController.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "LQLoginViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"登录";
    
    @weakify(self);
    [[self.btnLogin rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        LQLoginViewController * loginVC = [[LQLoginViewController alloc] init];
        [self.navigationController pushViewController:loginVC animated:YES];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
