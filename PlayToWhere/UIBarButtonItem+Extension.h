//
//  UIBarButtonItem+Extension.h
//  MHProject
//
//  Created by ocean.yu on 16/4/24.
//  Copyright © 2016年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+(UIBarButtonItem *) itemwithTarget:(id) target action:(SEL)action image:(NSString *)image highimage:(NSString *)highimage;

@end
