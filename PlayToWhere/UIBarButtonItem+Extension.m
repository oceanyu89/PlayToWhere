//
//  UIBarButtonItem+Extension.m
//  MHProject
//
//  Created by ocean.yu on 16/4/24.
//  Copyright © 2016年 ocean.yu. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+(UIBarButtonItem *)itemwithTarget:(id)target action:(SEL)action image:(NSString *)image highimage:(NSString *)highimage
{
    
    UIButton * backbtn = [UIButton buttonWithType:UIButtonTypeCustom];//自定义按钮
    
    [backbtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [backbtn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    [backbtn setBackgroundImage:[UIImage imageNamed:highimage] forState:UIControlStateHighlighted];
    
    backbtn.size = backbtn.currentBackgroundImage.size;
    
    
    return [[UIBarButtonItem alloc] initWithCustomView:backbtn];
    
}

@end
