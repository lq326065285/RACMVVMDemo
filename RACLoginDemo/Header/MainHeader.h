//
//  MainHeader.h
//  RACLoginDemo
//
//  Created by ~~浅笑 on 16/10/24.
//  Copyright © 2016年 广东康爱多连锁药店有限公司. All rights reserved.
//

#ifndef MainHeader_h
#define MainHeader_h

#pragma mark - 界面
//2.屏幕宽高
//设备屏幕尺寸 屏幕Size
#define KSCREEN_SIZE      [[UIScreen mainScreen] bounds].size
#define KSCREEN_HEIGHT  ([UIScreen mainScreen].bounds.size.height)
#define KSCREEN_WIDTH   ([UIScreen mainScreen].bounds.size.width)
//适配缩放
#define KSCREEN_SCALING    ([UIScreen mainScreen].bounds.size.width) / 375.0
//获取 屏幕Frame
#define KSCREEN_FRAME   [UIScreen mainScreen].applicationFrame
#define KSCREEN_CENTER_X  kScreen_Width/2
#define KSCREEN_CENTER_Y  kScreen_Height/2

#define GET_VIEW_X(View) (View.frame.size.width + View.frame.origin.x)
#define GET_VIEW_Y(View) (View.frame.size.height + View.frame.origin.y)
#define GET_FRAME_X(Frame) (Frame.size.width + Frame.origin.x)
#define GET_FRAME_Y(Frame) (Frame.size.height + Frame.origin.y)
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#endif /* MainHeader_h */
