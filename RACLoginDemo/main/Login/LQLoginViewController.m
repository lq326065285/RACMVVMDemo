//
//  LQLoginViewController.m
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/22.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "LQLoginViewController.h"

#import "AppDelegate.h"

@interface LQLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFUserName;
@property (weak, nonatomic) IBOutlet UITextField *textFPw;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;

@end

@implementation LQLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"登录";
    self.textFUserName.text = [LQGlobalService objectForKey:LOGIN_USERNAME];
    self.textFPw.text = [LQGlobalService objectForKey:LOGIN_PASSWORD];
    self.btnLogin.enabled = NO;
    [self.btnLogin setBackgroundColor:[UIColor grayColor]];
    
    RACSignal * validUserNameSignal = [self.textFUserName.rac_textSignal map:^id(id value) {
        return value;
    }];
    
    RACSignal * validPwSignal = [self.textFPw.rac_textSignal map:^id(id value) {
        return value;
    }];
    
    @weakify(self);
    [[[self.btnLogin rac_signalForControlEvents:UIControlEventTouchUpInside] doNext:^(id x) {
        @strongify(self);
        self.btnLogin.enabled = NO;
    }] subscribeNext:^(id x) {
        @strongify(self);
        if ([self isLoginWithPw:self.textFPw.text userName:self.textFUserName.text]) {
            [LQGlobalService setObject:self.textFUserName.text key:LOGIN_USERNAME];
            [LQGlobalService setObject:self.textFPw.text key:LOGIN_PASSWORD];
            AppDelegate * appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            [appDelegate createHomePage];
        }
    }];
    
    [[RACSignal combineLatest:@[validUserNameSignal,validPwSignal] reduce:^id(NSString * userName,NSString * password){
        return @([self isValidStringWithString:userName] && [self isValidStringWithString:password]);
    }] subscribeNext:^(NSNumber * x) {
        @strongify(self);
        if (x.boolValue) {
            self.btnLogin.enabled = YES;
            [self.btnLogin setBackgroundColor:[UIColor blueColor]];
        }else{
            self.btnLogin.enabled = NO;
            [self.btnLogin setBackgroundColor:[UIColor grayColor]];
        }
    }];
}

-(BOOL)isLoginWithPw:(NSString *)pw userName:(NSString *)userName{
    if ([pw isEqualToString:@"123456"] && [userName isEqualToString:@"liqiang"]) {
        return YES;
    }
    return NO;
}


-(BOOL)isValidStringWithString:(NSString *)string{
    if ([string isEqualToString:@""] || !string) {
        return NO;
    }
    return YES;
}

@end
