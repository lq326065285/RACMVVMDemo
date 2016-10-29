//
//  PublicHeader.h
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/26.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#ifndef PublicHeader_h
#define PublicHeader_h

#define LQ_INVOKE_PROTOCOL(string) [NSString stringWithFormat:@"lq://invokeVC?%@",string]

#define LOGIN_USERNAME @"login_UserName"
#define LOGIN_PASSWORD @"login_password"

#define WEAK_SELF(weakSelf)  __weak __typeof(&*self)weakSelf = self;



#endif /* PublicHeader_h */
