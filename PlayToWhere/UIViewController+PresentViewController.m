//
//  UIViewController+PresentViewController.m
//  PlayToWhere
//
//  Created by ocean.yu on 2017/2/10.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import "UIViewController+PresentViewController.h"

@implementation UIViewController (PresentViewController)
-(void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag
{
    CATransition * animation = [CATransition animation];
    animation.duration = 0.2;    //  时间
    /**  type：动画类型
     *  pageCurl       向上翻一页
     *  pageUnCurl     向下翻一页
     *  rippleEffect   水滴
     *  suckEffect     收缩
     *  cube           方块
     *  oglFlip        上下翻转
     */
    animation.type = @"pageCurl";
    
    /**  type：页面转换类型
     *  kCATransitionFade       淡出
     *  kCATransitionMoveIn     覆盖
     *  kCATransitionReveal     底部显示
     *  kCATransitionPush       推出
     */
    animation.type = kCATransitionMoveIn;
    
    //PS：type 更多效果请 搜索： CATransition
    /**  subtype：出现的方向
     *  kCATransitionFromRight       右
     *  kCATransitionFromLeft        左
     *  kCATransitionFromTop         上
     *  kCATransitionFromBottom      下
     */
    animation.subtype = kCATransitionFromRight;
    [self.view.window.layer addAnimation:animation forKey:nil];                   //  添加动作
    [self presentViewController:viewControllerToPresent animated:NO completion:nil];
}
@end
