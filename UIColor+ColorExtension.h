//
//  UIColor+ColorExtension.h
//  PlayToWhere
//
//  Created by ocean.yu on 2017/1/17.
//  Copyright © 2017年 ocean.yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorExtension)
+(UIColor*)colorWith255Red:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(NSUInteger)alpha;

+(UIColor*)colorWithHex:(NSUInteger)hex;

@end
